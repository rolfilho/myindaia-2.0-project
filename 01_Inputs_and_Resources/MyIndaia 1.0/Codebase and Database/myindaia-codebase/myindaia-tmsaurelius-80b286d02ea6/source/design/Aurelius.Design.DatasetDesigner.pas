unit Aurelius.Design.DatasetDesigner;

{$I Aurelius.inc}

interface

uses
  Generics.Collections, Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Rtti, StdCtrls, DB, TypInfo,
  Aurelius.Bind.Dataset, CheckLst, Buttons, ComCtrls;

type
  TfmFieldLoader = class(TForm)
    btOk: TButton;
    btCancel: TButton;
    OpenDialog1: TOpenDialog;
    PageControl1: TPageControl;
    tsClass: TTabSheet;
    tsPackages: TTabSheet;
    lbPackages: TCheckListBox;
    btAddPackage: TSpeedButton;
    btRemovePackage: TSpeedButton;
    edPath: TEdit;
    lvClasses: TListView;
    edSearch: TEdit;
    Label1: TLabel;
    procedure btOkClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btCancelClick(Sender: TObject);
    procedure btAddPackageClick(Sender: TObject);
    procedure btRemovePackageClick(Sender: TObject);
    procedure lbPackagesClick(Sender: TObject);
    procedure lbPackagesClickCheck(Sender: TObject);
    procedure edSearchEnter(Sender: TObject);
    procedure edSearchExit(Sender: TObject);
    procedure edSearchChange(Sender: TObject);
    procedure lvClassesDblClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    type
      TPackageInfo = class
      private
        Name: string;
        FileName: string;
        Description: string;
        Handle: HMODULE;
        Owner: TfmFieldLoader;
      public
        constructor Create(AOwner: TfmFieldLoader);
        destructor Destroy; override;
        procedure Load;
        procedure Unload;
      end;
  private
    FDataset: TDataset;
    FPackages: TObjectList<TPackageInfo>;
    FFiltering: boolean;
    FContext: TRttiContext;
    function PackageKey: string;
    procedure FillClassList(const ClassToSelect: string = '');
    function PackageExists(AFileName: string): boolean;
    function AddPackage(AFileName: string): TPackageInfo;
    procedure RemovePackage(APackage: TPackageInfo);
    function GetPackageInList(AIndex: integer): TPackageInfo;
    procedure FillPackageList(ToSelect: TPackageInfo);
    procedure LoadPackageList;
    procedure SavePackageList;
    {$IFDEF DELPHIBERLIN_LVL}
    procedure ClearHandleObjectsWithRtti(APackage: TRttiPackage);
    {$ENDIF}
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    class function Execute(Dataset: TDataset): Boolean;
    class procedure Reload(Dataset: TDataset);
  end;

implementation

uses
  Registry, StrUtils,
  Aurelius.Mapping.Attributes,
  Aurelius.Mapping.Explorer;

{$R *.dfm}

type
  TInternalAureliusDataset = class(TBaseAureliusDataset)
  end;

{ TfmFieldLoader }

function TfmFieldLoader.AddPackage(AFileName: string): TPackageInfo;
var
  P: TPackageInfo;
begin
  P := TPackageInfo.Create(Self);
  try
    try
      P.Description := GetPackageDescription(PChar(AFileName));
    except
      P.Description := '';
    end;
    P.Name := ExtractFileName(AFileName);
    P.FileName := AFileName;
    FPackages.Add(P);
  except
    P.Free;
  end;
  Result := P;
end;

procedure TfmFieldLoader.btAddPackageClick(Sender: TObject);
var
  New: TPackageInfo;
begin
  if OpenDialog1.Execute then
  begin
    if not PackageExists(OpenDialog1.FileName) then
    begin
      New := AddPackage(OpenDialog1.FileName);
      try
        New.Load;
      except
        RemovePackage(New);
        raise;
      end;
      FillPackageList(New);
    end;
  end;
end;

procedure TfmFieldLoader.btCancelClick(Sender: TObject);
begin
  ModalResult := mrCancel;
end;

procedure TfmFieldLoader.btOkClick(Sender: TObject);
var
  SelectedType: TRttiInstanceType;
begin
  if lvClasses.Selected <> nil then
  begin
    SelectedType := TRttiInstanceType(lvClasses.Selected.Data);
    TInternalAureliusDataset(FDataset).InitFieldDefsFromClass(SelectedType.MetaclassType);
    TInternalAureliusDataset(FDataset).DesignClass := SelectedType.QualifiedName;
  end;
  SavePackageList;
  ModalResult := mrOk;
end;

procedure TfmFieldLoader.btRemovePackageClick(Sender: TObject);
begin
  if lbPackages.ItemIndex >= 0 then
    RemovePackage(GetPackageInList(lbPackages.ItemIndex));
end;

{$IFDEF DELPHIBERLIN_LVL}
procedure TfmFieldLoader.ClearHandleObjectsWithRtti(APackage: TRttiPackage);
var
  PackageType, DictionaryType: TRttiType;
  HandleToObjectField: TRttiField;
  ClearMethod: TRttiMethod;
  Dictionary: TObject;
begin
  // Super-hack way of calling APackage.FHandleToObject.Clear
  PackageType := FContext.GetType(TRttiPackage);
  if PackageType <> nil then
  begin
    HandleToObjectField := PackageType.GetField('FHandleToObject');
    if HandleToObjectField <> nil then
    begin
      Dictionary := HandleToObjectField.GetValue(APackage).AsObject;
      if Dictionary <> nil then
      begin
        DictionaryType := FContext.GetType(Dictionary.ClassType);
        if DictionaryType <> nil then
        begin
          ClearMethod := DictionaryType.GetMethod('Clear');
          if ClearMethod <> nil then
            ClearMethod.Invoke(Dictionary, []);
        end;
      end;
    end;
  end;
end;
{$ENDIF}

constructor TfmFieldLoader.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  FPackages := TObjectList<TPackageInfo>.Create;
  FContext := TRttiContext.Create;
end;

destructor TfmFieldLoader.Destroy;
begin
  // Clear all cache in TMappingExplorer, because we are unloading the packages,
  // there might be some garbage classes cached in rtti explorer
  // TODO: A better way of handling this is just use a local instance of TMappingExplorer,
  // and pass it to the TAureliusdataset so the defaultinstance is not touched by the dataset when the fields are retrieved
  TMappingExplorer.ReplaceDefaultInstance(nil);
  FPackages.Free;
  FContext.Free;
  inherited;
end;

procedure TfmFieldLoader.edSearchChange(Sender: TObject);
begin
  if FFiltering then
    FillClassList;
end;

procedure TfmFieldLoader.edSearchEnter(Sender: TObject);
begin
  if edSearch.Font.Color <> clWindowText then // dirty way to check for the "search" string
  begin
    edSearch.Text := '';
    edSearch.Font.Color := clWindowText;
  end;
  FFiltering := true;
end;

procedure TfmFieldLoader.edSearchExit(Sender: TObject);
begin
  FFiltering := false;
  if edSearch.Text = '' then
  begin
    edSearch.Text := 'Search';
    edSearch.Font.Color := clGray;
  end;
end;

class function TfmFieldLoader.Execute(Dataset: TDataset): boolean;
var
  Form: TfmFieldLoader;
begin
  Form := TfmFieldLoader.Create(Application);
  try
    Form.FDataset := Dataset;
    Result := (Form.ShowModal = mrOk);
  finally
    Form.Free;
  end;
end;

procedure TfmFieldLoader.FillClassList(const ClassToSelect: string = '');
var
  AllTypes: TArray<TRttiType>;
  T: TRttiType;
  A: TCustomAttribute;
  EntityClass: TClass;
  Item: TListItem;
begin
  if csDestroying in ComponentState then Exit;

  lvClasses.Items.BeginUpdate;
  try
    lvClasses.Clear;
    AllTypes := FContext.GetTypes;
    for T in AllTypes do
      if T.IsInstance then
        for A in T.GetAttributes do
          if A is Entity then
          begin
            EntityClass := T.AsInstance.MetaclassType;
            if not FFiltering or (edSearch.Text = '') or (ContainsText(EntityClass.ClassName, edSearch.Text)) then
            begin
              Item := lvClasses.Items.Add;
              Item.Caption := EntityClass.ClassName;
              Item.Data := T.AsInstance;
              Item.SubItems.Add(T.AsInstance.DeclaringUnitName);
              if SameText(ClassToSelect, T.AsInstance.QualifiedName) then
                lvClasses.Selected := Item;
            end;
          end;
    lvClasses.SortType := TSortType.stText;
  finally
    lvClasses.Items.EndUpdate;
  end;
  if lvClasses.Selected <> nil then
    lvClasses.Selected.MakeVisible(false);
end;

procedure TfmFieldLoader.FillPackageList(ToSelect: TPackageInfo);
var
  P: TPackageInfo;
  List: TStrings;
  Str: string;
begin
  List := lbPackages.Items;
  List.BeginUpdate;
  try
    List.Clear;
    lbPackages.Sorted := false;
    for P in FPackages do
    begin
      if P.Description <> '' then
        Str := Format('%s (%s)', [P.Description, P.Name])
      else
        Str := P.FileName;
      List.AddObject(Str, P);
      lbPackages.Checked[List.Count - 1] := P.Handle <> 0;
    end;
    lbPackages.Sorted := true;
    if ToSelect <> nil then
      lbPackages.ItemIndex := lbPackages.Items.IndexOfObject(ToSelect);
    lbPackagesClick(nil);
  finally
    List.EndUpdate;
  end;
end;

procedure TfmFieldLoader.FormCreate(Sender: TObject);
begin
  edSearch.Text := '';
  edSearchExit(nil);
  LoadPackageList;
end;

procedure TfmFieldLoader.FormShow(Sender: TObject);
begin
  FillClassList(TInternalAureliusDataset(FDataset).DesignClass);
  if lvClasses.Items.Count > 0 then
    PageControl1.ActivePage := tsClass
  else
    PageControl1.ActivePage := tsPackages;
end;

function TfmFieldLoader.GetPackageInList(AIndex: integer): TPackageInfo;
begin
  if (AIndex < 0) or (AIndex >= lbPackages.Count) then Exit(nil);
  Result := TPackageInfo(lbPackages.Items.Objects[AIndex]);
end;

procedure TfmFieldLoader.lbPackagesClick(Sender: TObject);
var
  P: TPackageInfo;
begin
  P := GetPackageInList(lbPackages.ItemIndex);
  if P <> nil then
    edPath.Text := P.FileName
  else
    edPath.Text := '';
end;

procedure TfmFieldLoader.lbPackagesClickCheck(Sender: TObject);
begin
  if (lbPackages.ItemIndex < 0) or (lbPackages.ItemIndex >= lbPackages.Count) then Exit;
  if lbPackages.Checked[lbPackages.ItemIndex] then
    GetPackageInList(lbPackages.ItemIndex).Load
  else
    GetPackageInList(lbPackages.ItemIndex).Unload;
end;

procedure TfmFieldLoader.LoadPackageList;
var
  R: TRegIniFile;
  Sections: TStringList;
  P: TPackageInfo;
  I: integer;
  FileName: string;
  Loaded: boolean;
begin
  R := TRegIniFile.Create(PackageKey);
  Sections := TStringList.Create;
  try
    R.ReadSections(Sections);
    FPackages.Clear;
    for I := 0 to Sections.Count - 1 do
    begin
      FileName := R.ReadString(Sections[I], 'FileName', '');
      if FileName <> '' then
      begin
        Loaded := R.ReadBool(Sections[I], 'Loaded', false);
        P := AddPackage(FileName);
        if Loaded then
          try
            P.Load;
          except
          end;
      end;
    end;
    FillPackageList(nil);
  finally
    Sections.Free;
    R.Free;
  end;
end;

procedure TfmFieldLoader.lvClassesDblClick(Sender: TObject);
begin
  btOkClick(nil);
end;

function TfmFieldLoader.PackageExists(AFileName: string): boolean;
var
  P: TPackageInfo;
begin
  for P in FPackages do
    if SameText(AFileName, P.FileName) then
      Exit(true);
  Exit(false);
end;

function TfmFieldLoader.PackageKey: string;
var
  DelphiIDE: string;
begin
  {$IF DEFINED(VER210)}
  DelphiIDE := 'IDE\2010';
  {$ELSEIF Defined(VER220)}
  DelphiIDE := 'IDE\XE';
  {$ELSEIF Defined(VER230)}
  DelphiIDE := 'IDE\XE2';
  {$ELSEIF Defined(VER240)}
  DelphiIDE := 'IDE\XE3';
  {$ELSEIF Defined(VER250)}
  DelphiIDE := 'IDE\XE4';
  {$ELSEIF Defined(VER260)}
  DelphiIDE := 'IDE\XE5';
  {$ELSEIF Defined(VER270)}
  DelphiIDE := 'IDE\XE6';
  {$ELSE}
  DelphiIDE := 'IDE\D' + FloatToStr(System.CompilerVersion);
  {$IFEND}
  Result := Format('Software\TMS Software\Aurelius\%s\DatasetPackages', [DelphiIDE]);
end;

class procedure TfmFieldLoader.Reload(Dataset: TDataset);
var
  Form: TfmFieldLoader;
begin
  Form := TfmFieldLoader.Create(Application);
  try
    Form.FDataset := Dataset;
    Form.FillClassList(TInternalAureliusDataset(Dataset).DesignClass);
    Form.btOkClick(nil);
  finally
    Form.Free;
  end;
end;

procedure TfmFieldLoader.RemovePackage(APackage: TPackageInfo);
begin
  FPackages.Remove(APackage);
  FillPackageList(nil);
end;

procedure TfmFieldLoader.SavePackageList;
var
  R: TRegIniFile;
  P: TPackageInfo;
  Sections: TStringList;
  I: Integer;
begin
  R := TRegIniFile.Create(PackageKey);
  Sections := TStringList.Create;
  try
    R.ReadSections(Sections);
    for I := 0 to Sections.Count - 1 do
      R.EraseSection(Sections[I]);
    for P in FPackages do
    begin
      R.WriteString(P.Name, 'FileName', P.FileName);
      R.WriteBool(P.Name, 'Loaded', P.Handle <> 0);
    end;
  finally
    Sections.Free;
    R.Free;
  end;
end;

{ TfmFieldLoader.TPackageInfo }

constructor TfmFieldLoader.TPackageInfo.Create(AOwner: TfmFieldLoader);
begin
  Owner := AOwner;
end;

destructor TfmFieldLoader.TPackageInfo.Destroy;
begin
  Unload;
  inherited;
end;

procedure TfmFieldLoader.TPackageInfo.Load;
begin
  if Handle = 0 then
  begin
    Handle := LoadPackage(FileName);
    Owner.FillPackageList(Self);
    Owner.FillClassList;
  end;
end;

{$IFNDEF DELPHIBERLIN_LVL}
type
  TRttiPackageHelper = class helper for TRttiPackage
  public
    procedure ClearHandleObjects;
  end;

procedure TRttiPackageHelper.ClearHandleObjects;
begin
  Self.FHandleToObject.Clear;
end;
{$ENDIF}

procedure TfmFieldLoader.TPackageInfo.Unload;

  procedure OnUnloadModule(AInstance: THandle);
  var
    Package: TRttiPackage;
  begin
    for Package in Owner.FContext.GetPackages do
      if Package.Handle = AInstance then
      begin
        {$IFDEF DELPHIBERLIN_LVL}
        Owner.ClearHandleObjectsWithRtti(Package);
        {$ELSE}
        Package.ClearHandleObjects;
        {$ENDIF}
        Break;
      end;
  end;

begin
  if Handle <> 0 then
  begin
    // workaround a Delphi bug related to user-defined attributes
    // declared in the package
    // More info: http://qc.embarcadero.com/wc/qcmain.aspx?d=106586
    // we need to add the UnloadProc event because there might be
    // dependency packages that are also being unloaded
    AddModuleUnloadProc(TModuleUnloadProcLW(@OnUnloadModule));
    try
      UnloadPackage(Handle);
    finally
      RemoveModuleUnloadProc(TModuleUnloadProcLW(@OnUnloadModule));
    end;
    Handle := 0;
    Owner.FillPackageList(Self);
    Owner.FillClassList;
  end;
end;

end.
