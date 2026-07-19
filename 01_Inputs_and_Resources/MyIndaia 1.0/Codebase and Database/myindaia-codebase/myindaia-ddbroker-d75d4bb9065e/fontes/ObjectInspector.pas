unit ObjectInspector;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, JvExControls, JvInspector, cxControls, cxContainer, cxEdit,
  cxTextEdit, cxMaskEdit, cxDropDownEdit, ExtCtrls, ComCtrls, TypInfo, DB;

type
  TfrmObjectInspector = class(TForm)
    pgObjectInspector: TPageControl;
    tbsProperties: TTabSheet;
    JvInspector1: TJvInspector;
    Panel1: TPanel;
    cboItems: TcxComboBox;
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure JvInspector1BeforeItemCreate(Sender: TObject;
      Data: TJvCustomInspectorData; var ItemClass: TJvInspectorItemClass);
  private
    FOnActiveControlChange: TNotifyEvent;
    procedure DoOnActiveControlChange(Sender: TObject);
    procedure WMActivate(var Message: TWMActivate); message WM_ACTIVATE;
    function GetInspectObject: TObject;
    procedure SetInspectObject(const Value: TObject);
  public
    property InspectObject: TObject read GetInspectObject write SetInspectObject;
  end;

  TJvInspectorTParamsItem = class(TJvCustomInspectorItem)
  protected
    procedure ContentsChanged(Sender: TObject);
    function GetDisplayValue: string; override;
    procedure Edit; override;
    procedure SetDisplayValue(const Value: string); override;
    procedure SetFlags(const Value: TInspectorItemFlags); override;
  public
    constructor Create(const AParent: TJvCustomInspectorItem;
      const AData: TJvCustomInspectorData); override;
  end;

  TJvInspectorParamValueItem = class(TJvCustomInspectorItem)
  protected
    function GetDisplayValue: string; override;
    procedure SetDisplayValue(const Value: string); override;
  end;

  procedure ShowObjectInspector;

var
  frmObjectInspector: TfrmObjectInspector;

implementation

uses
  ParamsEditor;

{$R *.dfm}

procedure ShowObjectInspector;
begin
  if not Assigned(frmObjectInspector) then
    Application.CreateForm(TfrmObjectInspector, frmObjectInspector);
  frmObjectInspector.Show;
end;

{ TfrmObjectInspector }

procedure TfrmObjectInspector.WMActivate(var Message: TWMActivate);
begin
  //if Message.Active = WA_INACTIVE then
  //  Close;
end;

procedure TfrmObjectInspector.FormShow(Sender: TObject);
begin
  Left := 0;
  Top  := 0;
  Height := Screen.WorkAreaHeight;
  FOnActiveControlChange := Screen.OnActiveControlChange;
  Screen.OnActiveControlChange := DoOnActiveControlChange;
  DoOnActiveControlChange(Screen.ActiveControl);
end;

procedure TfrmObjectInspector.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Screen.OnActiveControlChange := FOnActiveControlChange;
  CloseParamsEditor;
end;

procedure TfrmObjectInspector.DoOnActiveControlChange(Sender: TObject);
begin
  if (Screen.ActiveForm <> Self) and (not (Screen.ActiveForm is TfrmParamsEditor)) and (Screen.ActiveControl <> nil) and (Screen.ActiveControl.Name <> '') then
    InspectObject := Screen.ActiveControl;
end;

procedure TfrmObjectInspector.JvInspector1BeforeItemCreate(Sender: TObject;
  Data: TJvCustomInspectorData; var ItemClass: TJvInspectorItemClass);
begin
  if (Data.TypeInfo^.Kind = tkClass) and SameText(Data.TypeInfo^.Name, 'TParams') then
    ItemClass := TJvInspectorTParamsItem
  else if (Data.TypeInfo^.Kind = tkVariant) and SameText(Data.Name, 'Value') then
    ItemClass := TJvInspectorParamValueItem;
end;

function TfrmObjectInspector.GetInspectObject: TObject;
begin
  Result := frmObjectInspector.JvInspector1.InspectObject;
end;

procedure TfrmObjectInspector.SetInspectObject(const Value: TObject);
begin
  frmObjectInspector.cboItems.Properties.Items.Clear;
  if Value <> nil then
  begin
    if Value is TControl then
      frmObjectInspector.cboItems.Properties.Items.Add(TControl(Value).Name + ': ' + Value.ClassName)
    else
      frmObjectInspector.cboItems.Properties.Items.Add(': ' + Value.ClassName);
    frmObjectInspector.cboItems.ItemIndex := 0;
    try
      frmObjectInspector.JvInspector1.InspectObject := Value;
    except
      Close;
    end;
  end;
end;

{ TJvInspectorTParamsItem }

procedure TJvInspectorTParamsItem.ContentsChanged(Sender: TObject);
var
  Obj: TStrings;
begin
  //Obj := TStrings(Data.AsOrdinal);
  //Obj.Text := TMemo(Sender).Lines.Text;
end;

constructor TJvInspectorTParamsItem.Create(const AParent: TJvCustomInspectorItem; const AData: TJvCustomInspectorData);
begin
  inherited Create(AParent, AData);
  RowSizing.MinHeight := irsItemHeight;
  Flags := Flags + [iifEditButton];
end;

procedure TJvInspectorTParamsItem.Edit;
begin
  ExecuteParamsEditor(TParams(Data.AsOrdinal));
end;

function TJvInspectorTParamsItem.GetDisplayValue: string;
var
  Obj: TObject;
begin
  Obj := TObject(Data.AsOrdinal);
  if not Multiline then
  begin
    if Obj <> nil then
      Result := Result + '(' + Obj.ClassName + ')'
    else
      Result := Result + '(' + GetTypeData(Data.TypeInfo).ClassType.ClassName + ')';
  end
  else
    Result := TStrings(Obj).Text;
end;

procedure TJvInspectorTParamsItem.SetDisplayValue(const Value: string);
var
  Obj: TObject;
begin
  if Multiline then
  begin
    Obj := TObject(Data.AsOrdinal);
    TStrings(Obj).Text := Value;
  end;
end;

procedure TJvInspectorTParamsItem.SetFlags(const Value: TInspectorItemFlags);
var
  OldMask: TInspectorItemFlags;
  NewMask: TInspectorItemFlags;
begin
  { The item has either an edit button or is multiline. If one of them is set,
    the other one will be removed }
  OldMask := Flags * [iifEditButton, iifMultiLine];
  NewMask := Value * [iifEditButton, iifMultiLine];
  if OldMask <> NewMask then
  begin
    if Multiline and not (iifEditButton in OldMask) and (iifEditButton in NewMask) then
      inherited SetFlags(Value - [iifMultiLine]) // iifEditButton has changed
    else
    if not Multiline and (iifEditButton in OldMask) and (iifMultiLine in NewMask) then
      inherited SetFlags(Value - [iifEditButton]) // iifMultiLine has changed
    else
      inherited SetFlags(Value); // Neither flag has changed. Should never occur.
  end
  else // Flags have not changed
    inherited SetFlags(Value);
  if RowSizing <> nil then
  begin
    RowSizing.Sizable := Multiline; // Update sizable state
    if not Multiline then
      RowSizing.SizingFactor := irsNoReSize
    else
      RowSizing.SizingFactor := irsValueHeight;
  end;
end;

{ TJvInspectorParamValueItem }

function TJvInspectorParamValueItem.GetDisplayValue: string;
begin
  if TJvInspectorPropData(Data).Instance is TParam then
    Result := TParam(TJvInspectorPropData(Data).Instance).Value
  else
    Result := GetStrProp(TJvInspectorPropData(Data).Instance, TJvInspectorPropData(Data).Prop);
end;

procedure TJvInspectorParamValueItem.SetDisplayValue(const Value: string);
begin
  if TJvInspectorPropData(Data).Instance is TParam then
  begin
    if (not (TParam(TJvInspectorPropData(Data).Instance).DataType in [ftString, ftFixedChar, ftWideString])) and (Value = '') then
      TParam(TJvInspectorPropData(Data).Instance).Clear
    else if (TParam(TJvInspectorPropData(Data).Instance).DataType in [ftVariant, ftUnknown, ftString, ftFixedChar, ftWideString]) or (Value = '') then
      TParam(TJvInspectorPropData(Data).Instance).Value := Value
    else
      case TParam(TJvInspectorPropData(Data).Instance).DataType of
        ftSmallint, ftInteger, ftWord, ftLargeint, ftBytes: TParam(TJvInspectorPropData(Data).Instance).Value := StrToInt(Value);
        ftBoolean: TParam(TJvInspectorPropData(Data).Instance).Value := StrToBool(Value);
        ftFloat, ftCurrency: TParam(TJvInspectorPropData(Data).Instance).Value := StrToFloat(Value);
        ftDate: TParam(TJvInspectorPropData(Data).Instance).Value := StrToDate(Value);
        ftTime: TParam(TJvInspectorPropData(Data).Instance).Value := StrToTime(Value);
        ftDateTime:TParam(TJvInspectorPropData(Data).Instance).Value := StrToDateTime(Value);
        {ftVarBytes, ftAutoInc, ftBlob, ftMemo, ftGraphic, ftFmtMemo,
        ftParadoxOle, ftDBaseOle, ftTypedBinary, ftCursor,
        ftADT, ftArray, ftReference, ftDataSet, ftOraBlob, ftOraClob,
        ftInterface, ftIDispatch, ftGuid, ftTimeStamp, ftFMTBcd}
      end;
  end
  else
    SetStrProp(TJvInspectorPropData(Data).Instance, TJvInspectorPropData(Data).Prop, Value);
end;

end.
