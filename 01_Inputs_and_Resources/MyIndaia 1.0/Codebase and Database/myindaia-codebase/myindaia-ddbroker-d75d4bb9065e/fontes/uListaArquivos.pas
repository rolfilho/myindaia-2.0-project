unit uListaArquivos;

interface

uses
  Windows, Messages, Dialogs, OleCtnrs, ExtCtrls, StdCtrls, Buttons, SysUtils,
  Controls, Classes, Graphics, Forms, sPanel, sLabel, sMemo, sComboBox,
  sCheckBox, sSpeedButton;


const
  _DEFAULT_PANEL_WIDTH  = 352;
  _DEFAULT_PANEL_HEIGHT = 150;
  _SPACE   = 10;
  _START_X = 5;
  _START_Y = 5;


type
  TItemType = (itNone, itNew, itEdit, itShow);
  TImageStyle = (isNone, isShow, isIcon);

type
  TColecaoArquivos = class;

  TItemArquivo = class(TComponent)
  private
    FFullFileName: TFileName;
    FReplaceFile: Boolean;
    FPanel: TsPanel;
    FCaptionFileName: TsLabel;
    FLabelFileName: TsLabel;
    FCaptionType: TsLabel;
    FComboType: TsComboBox;
    FCaptionDesc: TsLabel;
    FMemoDesc: TsMemo;
    FOleImage: TOleContainer;
    FPanelPages: TPanel;
    FChecked: TsCheckBox;
    FBtnDelete: TsSpeedButton;
    FBtnSearch: TsSpeedButton;
    FBtnRefresh: TsSpeedButton;
    FItemType: TItemType;
    FIndex: Integer;
    FOwner: TColecaoArquivos;
    FOnChange: TNotifyEvent;
    FImageStyle: TImageStyle;
    FParentItem: TItemArquivo;
    function GetChecked: Boolean;
    function GetDescription: TStrings;
    function GetFileName: TFileName;
    function GetTypeDoc: String;
    procedure SetChecked(const Value: Boolean);
    procedure SetDescription(const Value: TStrings);
    procedure SetFileName(const Value: TFileName);
    procedure SetTypeDoc(const Value: String);
    procedure SetParent(const Value: TWinControl);
    function GetParent: TWinControl;
    function GetLeft: Integer;
    function GetTop: Integer;
    procedure SetLeft(const Value: Integer);
    procedure SetTop(const Value: Integer);
    function GetBorderStyle: TBorderStyle;
    procedure SetBorderStyle(const Value: TBorderStyle);
    function GetCtl3D: Boolean;
    procedure SetCtl3D(const Value: Boolean);
    function GetBevelInner: TBevelCut;
    function GetBevelOuter: TBevelCut;
    procedure SetBevelInner(const Value: TBevelCut);
    procedure SetBevelOuter(const Value: TBevelCut);
    function GetColor: TColor;
    procedure SetColor(const Value: TColor);
    function GetTypeItems: TStrings;
    procedure SetTypeItems(const Value: TStrings);
    procedure SetItemType(const Value: TItemType);
    procedure SetImageStyle(const Value: TImageStyle);
    procedure SetParentItem(const Value: TItemArquivo);
    function GetVisible: Boolean;
    procedure SetVisible(const Value: Boolean);
    function GetCaptionFileName: String;
    procedure SetCaptionFileName(const Value: String);
    function GetFileCount: Integer;
    procedure SetFileCount(const Value: Integer);
    function GetDescriptionFontColor: TColor;
    procedure SetDescriptionFontColor(const Value: TColor);
  protected
    procedure DoDelete(Sender: TObject);
    procedure DoSearch(Sender: TObject);
    procedure DoRefresh(Sender: TObject);
    procedure DoChange(Sender: TObject);
    procedure DoEnter(Sender: TObject);
    procedure DoExit(Sender: TObject);
    function GetTypeIndex: Integer;
    procedure SetTypeIndex(AIndex: Integer);
    procedure DoDescriptionChanged(Sender: TObject);
    procedure DoDescriptionKeyPress(Sender: TObject; var Key: Char);
    property Parent: TWinControl read GetParent write SetParent;
    property BorderStyle: TBorderStyle read GetBorderStyle write SetBorderStyle;
    property Ctl3D: Boolean read GetCtl3D write SetCtl3D;
    property BevelInner: TBevelCut read GetBevelInner write SetBevelInner;
    property BevelOuter: TBevelCut read GetBevelOuter write SetBevelOuter;
    property Color: TColor read GetColor write SetColor;
    property OnChange: TNotifyEvent read FOnChange write FOnChange;
    property ImageStyle: TImageStyle read FImageStyle write SetImageStyle;
  public
    constructor Create(AOwner: TColecaoArquivos);
    destructor Destroy; override;
    procedure SetFocus;
    function CanFocus: Boolean;
    property CaptionFileName: String read GetCaptionFileName write SetCaptionFileName;
    property FileName: TFileName read GetFileName write SetFileName;
    property ReplaceFile: Boolean read FReplaceFile write FReplaceFile;
    property TypeDoc: String read GetTypeDoc write SetTypeDoc;
    property Description: TStrings read GetDescription write SetDescription;
    property DescriptionFontColor: TColor read GetDescriptionFontColor write SetDescriptionFontColor;
    property TypeItems: TStrings read GetTypeItems write SetTypeItems;
    property Checked: Boolean read GetChecked write SetChecked;
    property Left: Integer read GetLeft write SetLeft;
    property Top: Integer read GetTop write SetTop;
    property ItemType: TItemType read FItemType write SetItemType;
    property Index: Integer read FIndex;
    property ParentItem: TItemArquivo read FParentItem write SetParentItem;
    property Visible: Boolean read GetVisible write SetVisible;
    property FileCount: Integer read GetFileCount write SetFileCount;
  end;

  TProgress = procedure(Sender: TObject; MaxProgress, CurrentProgress: Int64) of object;

  TColecaoArquivos = class
  private
    FList: array of TItemArquivo;
    FOwner: TComponent;
    FParent: TWinControl;
    FOnchange: TNotifyEvent;
    FBorderStyle: TBorderStyle;
    FCtl3D: Boolean;
    FBevelInner: TBevelCut;
    FBevelOuter: TBevelCut;
    FColor: TColor;
    FTypeItems: TStrings;
    FImageStyle: TImageStyle;
    FOnProgress: TProgress;
    function GetCount: Integer;
    function GetItem(Index: Integer): TItemArquivo;
    procedure SetItem(Index: Integer; const Value: TItemArquivo);
    procedure SetParent(const Value: TWinControl);
    procedure DoChange(Sender: TObject);
    procedure SetBorderStyle(const Value: TBorderStyle);
    procedure SetCtl3D(const Value: Boolean);
    procedure SetBevelInner(const Value: TBevelCut);
    procedure SetBevelOuter(const Value: TBevelCut);
    procedure SetColor(const Value: TColor);
    procedure SetTypeItems(const Value: TStrings);
    procedure SetImageStyle(const Value: TImageStyle);
    function GetItemIndex: Integer;
    procedure SetItemIndex(const Value: Integer);
  protected
    procedure DoTypeItemsChange(Sender: TObject);
    procedure ReIndex;
    property OnChange: TNotifyEvent read FOnchange write FOnChange;
    property Parent: TWinControl read FParent write SetParent;
    procedure ItemDragOver(Sender, Source: TObject; X, Y: Integer;
       State: TDragState; var Accept: Boolean);
    procedure ItemEndDrag(Sender, Target: TObject; X, Y: Integer);
    property OnProgress: TProgress read FOnProgress write FOnProgress;
  public
    constructor Create(AOwner: TComponent);
    destructor Destroy; override;
    procedure Clear;
    procedure Delete(Index: Integer);
    procedure DeleteByFileName(AFileName: TFileName);
    procedure DeleteMissingFiles;
    function Add(AFileName: TFileName): TItemArquivo;
    function AddParented(AFileName: TFileName; AParentItem: TItemArquivo): TItemArquivo;
    function FileNameExists(AFileName: TFileName; const ACaseInsensitive: Boolean = True): Boolean;
    function GetItemByFileName(AFileName: TFileName; const ACaseInsensitive: Boolean = True): TItemArquivo;
    function GetIndexFromPos(X, Y: Integer): Integer;
    function GetItemFromPos(X, Y: Integer): TItemArquivo;
    property Owner: TComponent read FOwner;
    property Item[Index: Integer]: TItemArquivo read GetItem write SetItem; default;
    property Count: Integer read GetCount;
    property BorderStyle: TBorderStyle read FBorderStyle write SetBorderStyle;
    property Ctl3D: Boolean read FCtl3D write SetCtl3D;
    property BevelInner: TBevelCut read FBevelInner write SetBevelInner;
    property BevelOuter: TBevelCut read FBevelOuter write SetBevelOuter;
    property Color: TColor read FColor write SetColor;
    property DefaultTypeItems: TStrings read FTypeItems write SetTypeItems;
    property ImageStyle: TImageStyle read FImageStyle write SetImageStyle;
    property ItemIndex: Integer read GetItemIndex write SetItemIndex;
  end;

  TListaArquivos = class
  private
    FItems: TColecaoArquivos;
    FOwner: TComponent;
    FParent: TWinControl;
    FOnChange: TNotifyEvent;
    FOnProgress: TProgress;
    function GetCount: Integer;
    procedure SetParent(const Value: TWinControl);
    function GetTypeItems: TStrings;
    procedure SetTypeItems(const Value: TStrings);
  protected
    procedure DoChange(Sender: TObject);
    procedure DoProgress(Sender: TObject; MaxProgress, CurrentProgress: Int64);
  public
    constructor Create(AOwner: TComponent);
    destructor Destroy; override;
    procedure Clear;
    procedure SortWindow;
    procedure DeleteMissingFiles;
    property Items: TColecaoArquivos read FItems;
    property Count: Integer read GetCount;
    property Owner: TComponent read FOwner;
    property OnChange: TNotifyEvent read FOnChange write FOnChange;
    property Parent: TWinControl read FParent write SetParent;
    property DefaultTypeItems: TStrings read GetTypeItems write SetTypeItems;
    property OnProgress: TProgress read FOnProgress write FOnProgress;
  end;

implementation

uses StrUtils, Math, Variants;

{$R Imagens.res}

{ TItemArquivo }

function TItemArquivo.CanFocus: Boolean;
begin
  Result := FPanel.CanFocus;
end;

constructor TItemArquivo.Create(AOwner: TColecaoArquivos);
begin
  FOwner := AOwner;

  // Painel
  FPanel          := TsPanel.Create(Self);
  FPanel.Width    := _DEFAULT_PANEL_WIDTH;
  FPanel.Height   := _DEFAULT_PANEL_HEIGHT;
  FPanel.DragMode := dmAutomatic;
  FPanel.OnEnter  := DoEnter;
  FPanel.OnExit   := DoExit;

  // Imagem do arquivo
  FOleImage              := TOleContainer.Create(FOwner.Owner);
  FOleImage.Parent       := FPanel;
  FOleImage.Left         := 8;
  FOleImage.Top          := 8;
  FOleImage.Width        := 120;
  FOleImage.Height       := _DEFAULT_PANEL_HEIGHT -15;
  FOleImage.AutoActivate := aaDoubleClick;
  FOleImage.Caption      := '';
  FOleImage.Ctl3D        := False;
  FOleImage.ParentColor  := True;
  FOleImage.ParentCtl3D  := False;
  FOleImage.SizeMode     := smScale;
  FOleImage.BorderStyle  := bsSingle;
  FOleImage.Color        := clWhite;
  FOleImage.Enabled      := False;     

  // Páginas de arquivos
  FPanelPages             := TPanel.Create(FOwner.Owner);
  FPanelPages.Parent      := FPanel;
  FPanelPages.Color       := clWhite;
  FPanelPages.Width       := 19;
  FPanelPages.Height      := 27;
  FPanelPages.BorderStyle := bsSingle;
  FPanelPages.Top         := _DEFAULT_PANEL_HEIGHT -35;
  FPanelPages.Left        := 108;

  // Nome do arquivo
  FCaptionFileName            := TsLabel.Create(FOwner.Owner);
  FCaptionFileName.Parent     := FPanel;
  FCaptionFileName.Left       := 136;
  FCaptionFileName.Top        := 12;
  FCaptionFileName.Caption    := 'Nome Original:';
  FCaptionFileName.Font.Style := [fsBold];

  FLabelFileName          := TsLabel.Create(FOwner.Owner);
  FLabelFileName.Parent   := FPanel;
  FLabelFileName.Left     := 136;
  FLabelFileName.Top      := 25;
  FLabelFileName.AutoSize := True;
  FLabelFileName.Width    := 208; 
  FLabelFileName.Caption  := '';

  // Tipo do arquivo
  FCaptionType            := TsLabel.Create(FOwner.Owner);
  FCaptionType.Parent     := FPanel;
  FCaptionType.Left       := 136;
  FCaptionType.Top        := 40;
  FCaptionType.Caption    := 'Tipo do Arquivo:';
  FCaptionType.Font.Style := [fsBold];

  FComboType             := TsComboBox.Create(FOwner.Owner);
  FComboType.Sorted      := True;
  FComboType.Parent      := FPanel;
  FComboType.Left        := 136;
  FComboType.Top         := 55;
  FComboType.Width       := FPanel.Width - 149;
  FComboType.Height      := 21;
  FComboType.Style       := csDropDownList;
  FComboType.Ctl3D       := True;
  FComboType.ItemHeight  := 13;
  FComboType.ParentCtl3D := False;
  FComboType.OnChange    := DoChange;

  // Descrição do arquivo
  FCaptionDesc            := TsLabel.Create(FOwner.Owner);
  FCaptionDesc.Parent     := FPanel;
  FCaptionDesc.Left       := 136;
  FCaptionDesc.Top        := 78;
  FCaptionDesc.Caption    := 'Descrição:';
  FCaptionDesc.Font.Style := [fsBold];

  FMemoDesc            := TsMemo.Create(FOwner.Owner);
  FMemoDesc.Parent     := FPanel;
  FMemoDesc.Left       := 136;
  FMemoDesc.Top        := 93;
  FMemoDesc.Width      := _DEFAULT_PANEL_WIDTH - 149;
  FMemoDesc.Height     := _DEFAULT_PANEL_HEIGHT - 104;
  FMemoDesc.OnChange   := DoDescriptionChanged;
  FMemoDesc.OnKeyPress := DoDescriptionKeyPress;

  // Check do arquivo para seleção
  FChecked         := TsCheckBox.Create(FOwner.Owner);
  FChecked.Parent  := FPanel;
  FChecked.Left    := 4;
  FChecked.Top     := 4;
  FChecked.Width   := 13;
  FChecked.Height  := 13;
  FChecked.Checked := True;

  // Os botões Pesquisar e Excluir ficam na mesma posição porque não ocorrerá de ficarem visiveis ao mesmo tempo

  // Botão Pesquisar
  FBtnSearch              := TsSpeedButton.Create(FOwner.Owner);
  FBtnSearch.Parent       := FPanel;
  FBtnSearch.Glyph        := TBitmap.Create;
  FBtnSearch.Glyph.Handle := LoadBitmap(HInstance, 'BMPSEARCH');
  FBtnSearch.Left         := _DEFAULT_PANEL_WIDTH - 55;
  FBtnSearch.Top          := 4;
  FBtnSearch.ShowHint     := True;
  FBtnSearch.Hint         := 'Procurar arquivo';
  FBtnSearch.OnClick      := DoSearch;

  // Botão Excluir
  FBtnDelete              := TsSpeedButton.Create(FOwner.Owner);
  FBtnDelete.Parent       := FPanel;
  FBtnDelete.Glyph        := TBitmap.Create;
  FBtnDelete.Glyph.Handle := LoadBitmap(HInstance, 'BMPDELETE');
  FBtnDelete.Left         := _DEFAULT_PANEL_WIDTH - 55;
  FBtnDelete.Top          := 4;
  FBtnDelete.ShowHint     := True;
  FBtnDelete.Hint         := 'Excluir arquivo';
  FBtnDelete.OnClick      := DoDelete;

  // Botão Atualizar Miniatura
  FBtnRefresh              := TsSpeedButton.Create(FOwner.Owner);
  FBtnRefresh.Parent       := FPanel;
  FBtnRefresh.Glyph        := TBitmap.Create;
  FBtnRefresh.Glyph.Handle := LoadBitmap(HInstance, 'BMPREFRESH');
  FBtnRefresh.Left         := _DEFAULT_PANEL_WIDTH - 30;
  FBtnRefresh.Top          := 4;
  FBtnRefresh.ShowHint     := True;
  FBtnRefresh.Hint         := 'Atualizar Imagem';
  FBtnRefresh.OnClick      := DoRefresh;

  // Propriedades padrão
  ParentItem   := nil;
  BorderStyle  := bsNone;
  Ctl3D        := True;
  BevelInner   := bvNone;
  BevelOuter   := bvRaised;
  Color        := clBtnFace;
  ItemType     := itNew;
  FReplaceFile := False;
  FileCount    := 1;
  ImageStyle   := isIcon;
end;

destructor TItemArquivo.Destroy;
begin
  FFullFileName := '';
  FCaptionFileName.Free;
  FLabelFileName.Free;
  FCaptionType.Free;
  FComboType.Free;
  FCaptionDesc.Free;
  FMemoDesc.Free;
  FOleImage.Free;
  FPanelPages.Free;
  FChecked.Free;
  FBtnDelete.Free;
  FBtnSearch.Free;
  FPanel.Free;
  inherited;
end;

procedure TItemArquivo.DoChange(Sender: TObject);
begin
  FChecked.Checked := True;
  if not (FItemType in [itEdit, itNew]) then
    FItemType := itEdit;
  if Assigned(FOnChange) then
    FOnChange(Self);
end;

procedure TItemArquivo.DoDelete(Sender: TObject);
begin
  if MessageDlg('Se este item for excluído não poderá ser recuperado.'#13'Deseja realmente excluí-lo?',
     mtConfirmation, [mbYes, mbNo], 0) = mrYes then
    FOwner.Delete(Index);
end;

procedure TItemArquivo.DoEnter(Sender: TObject);
var
  C: TColor;
begin
  C := FMemoDesc.Font.Color;
  FPanel.SkinData.SkinSection := 'HINT';
  FMemoDesc.Font.Color := C;
end;

procedure TItemArquivo.DoExit(Sender: TObject);
var
  C: TColor;
begin
  C := FMemoDesc.Font.Color;
  FPanel.SkinData.SkinSection := 'PANEL';
  FMemoDesc.Font.Color := C;
end;

procedure TItemArquivo.DoSearch(Sender: TObject);
begin
  with TOpenDialog.Create(Application) do
  begin
    if Execute then
      Self.FileName := FileName;
    Free;
    FReplaceFile := True;
    DoChange(Self);
  end;
end;

function TItemArquivo.GetBevelInner: TBevelCut;
begin
  Result := FPanel.BevelInner;
end;

function TItemArquivo.GetBevelOuter: TBevelCut;
begin
  Result := FPanel.BevelOuter;
end;

function TItemArquivo.GetBorderStyle: TBorderStyle;
begin
  Result := FPanel.BorderStyle;
end;

function TItemArquivo.GetCaptionFileName: String;
begin
  Result := FLabelFileName.Caption;
end;

function TItemArquivo.GetChecked: Boolean;
begin
  Result := FChecked.Checked;
end;

function TItemArquivo.GetColor: TColor;
begin
  Result := FPanel.Color;
end;

function TItemArquivo.GetCtl3D: Boolean;
begin
  Result := FPanel.Ctl3D;
end;

function TItemArquivo.GetDescription: TStrings;
begin
  Result := FMemoDesc.Lines;
end;

function TItemArquivo.GetFileName: TFileName;
begin
  Result := FFullFileName;
end;

function TItemArquivo.GetLeft: Integer;
begin
  Result := FPanel.Left;
end;

function TItemArquivo.GetFileCount: Integer;
begin
  Result := StrToInt(FPanelPages.Caption);
end;

function TItemArquivo.GetParent: TWinControl;
begin
  Result := FPanel.Parent;
end;

function TItemArquivo.GetTop: Integer;
begin
  Result := FPanel.Top;
end;

function TItemArquivo.GetTypeDoc: String;
begin
  Result := FComboType.Text;
end;

function TItemArquivo.GetTypeItems: TStrings;
begin
  Result := FComboType.Items;
end;

function TItemArquivo.GetVisible: Boolean;
begin
  Result := FPanel.Visible;
end;

procedure TItemArquivo.SetBevelInner(const Value: TBevelCut);
begin
  FPanel.BevelInner := Value;
end;

procedure TItemArquivo.SetBevelOuter(const Value: TBevelCut);
begin
  FPanel.BevelOuter := Value;
end;

procedure TItemArquivo.SetBorderStyle(const Value: TBorderStyle);
begin
  FPanel.BorderStyle := Value;
end;

procedure TItemArquivo.SetCaptionFileName(const Value: String);
begin
  FLabelFileName.Caption := Value;
end;

procedure TItemArquivo.SetChecked(const Value: Boolean);
begin
  FChecked.Checked := Value;
end;

procedure TItemArquivo.SetColor(const Value: TColor);
begin
  FPanel.Color := Value;
end;

procedure TItemArquivo.SetCtl3D(const Value: Boolean);
begin
  FPanel.Ctl3D := Value;
end;

procedure TItemArquivo.SetDescription(const Value: TStrings);
begin
  FMemoDesc.Text := Value.Text;
end;

procedure TItemArquivo.SetFileName(const Value: TFileName);
var
  P: String;
begin
  FReplaceFile := (FFullFileName <> '');
  FFullFileName := Value;
  FLabelFileName.Caption := ExtractFileName(Value);
  FPanel.Update;
  if FImageStyle <> isNone then
    try
      FOleImage.CreateObjectFromFile(Value, False);
    except
      //
    end;
end;

procedure TItemArquivo.SetFocus;
begin
  FPanel.SetFocus;
end;

procedure TItemArquivo.SetImageStyle(const Value: TImageStyle);
begin
  if Value = FImageStyle then
    Exit;
  FOleImage.Visible   := (Value <> isNone);
  FPanelPages.Visible := FOleImage.Visible;
  if not FOleImage.Visible then
  begin
    FCaptionFileName.Left := 31;
    FLabelFileName.Left   := 31;
    FCaptionType.Left     := 8;
    FComboType.Left       := 8;
    FCaptionDesc.Left     := 8;
    FMemoDesc.Left        := 8;
  end
  else
  begin
    FCaptionFileName.Left := 136;
    FLabelFileName.Left   := 136;
    FCaptionType.Left     := 136;
    FComboType.Left       := 136;
    FCaptionDesc.Left     := 136;
    FMemoDesc.Left        := 136;
  end;

  FComboType.Width := _DEFAULT_PANEL_WIDTH - FComboType.Left - 13;
  FMemoDesc.Width  := _DEFAULT_PANEL_WIDTH - FMemoDesc.Left - 13;

  case Value of
    isNone: ;
    isIcon, isShow: if (FOleImage.State = osEmpty) and FileExists(FFullFileName) then
                      FOleImage.CreateObjectFromFile(FFullFileName, Value = isIcon);
  end;
  FImageStyle := Value;
end;

procedure TItemArquivo.SetItemType(const Value: TItemType);
begin
  if Value <> FItemType then
  begin
    FItemType           := Value;
    FBtnDelete.Visible  := Value = itNew;
    FBtnSearch.Visible  := Value = itEdit;
    //FComboType.ReadOnly := not(Value in [itNew]);
    FComboType.ReadOnly := False; // Era do modo acima, mas foi pedido para poder alterar o tipo do documento - Michel - 01/04/2009 - Ocorrência 08196/09
    FMemoDesc.ReadOnly  := False; //not(Value in [itNew, itEdit]);
    FChecked.ReadOnly   := not(Value in [itNew, itShow]);
    if Value = itShow then
      FChecked.Checked := False;
  end;
end;

procedure TItemArquivo.SetLeft(const Value: Integer);
begin
  FPanel.Left := Value;
end;

procedure TItemArquivo.SetFileCount(const Value: Integer);
begin
  FPanelPages.Caption := IntToStr(Value);
end;

procedure TItemArquivo.SetParent(const Value: TWinControl);
begin
  FPanel.Parent := Value;
end;

procedure TItemArquivo.SetParentItem(const Value: TItemArquivo);
var
  OldParent: TItemArquivo;
begin
  if Value <> FParentItem then
  begin
    OldParent := FParentItem;
    FParentItem := Value;
    Visible := (Value = nil);
    if OldParent <> nil then
      OldParent.FileCount := OldParent.FileCount - 1;
    if Value <> nil then
      Value.FileCount := Value.FileCount +1;
    DoChange(Self);
  end;
end;

procedure TItemArquivo.SetTop(const Value: Integer);
begin
  FPanel.Top := Value;
end;

procedure TItemArquivo.SetTypeDoc(const Value: String);
begin
  FComboType.ItemIndex := FComboType.Items.IndexOf(Value);
  FComboType.ReadOnly := FComboType.ItemIndex >= 0;
  if FComboType.ItemIndex < 0 then
    FComboType.ItemIndex := 0;
end;

procedure TItemArquivo.SetTypeItems(const Value: TStrings);
begin
  FComboType.Items.Assign(Value);
end;

procedure TItemArquivo.SetVisible(const Value: Boolean);
begin
  FPanel.Visible := Value;
end;

procedure TItemArquivo.SetTypeIndex(AIndex: Integer);
begin
  FComboType.ItemIndex := AIndex;
end;

function TItemArquivo.GetTypeIndex: Integer;
begin
  Result := FComboType.ItemIndex;
end;

procedure TItemArquivo.DoRefresh(Sender: TObject);
begin
  try
    SetFileName(FileName);
  except
    MessageDlg('Erro ao carregar a imagem.'#13 +
       'Verifique se o arquivo existe e se não esta sendo utilizado por outro programa e tente novamente.',
       mtError, [mbOk], 0);
  end;
end;

function TItemArquivo.GetDescriptionFontColor: TColor;
begin
  Result := FMemoDesc.Font.Color;
end;

procedure TItemArquivo.SetDescriptionFontColor(const Value: TColor);
begin
  if FMemoDesc.Font.Color <> Value then
    FMemoDesc.Font.Color := Value;
end;

procedure TItemArquivo.DoDescriptionChanged(Sender: TObject);
begin
  if FMemoDesc.Font.Color <> clWindowText then
    FMemoDesc.Font.Color := clWindowText;
  if Pos('’', FMemoDesc.Text) > 0 then
    FMemoDesc.Text := StringReplace(FMemoDesc.Text, '’', '´', [rfReplaceAll]);
  if Pos('''', FMemoDesc.Text) > 0 then
    FMemoDesc.Text := StringReplace(FMemoDesc.Text, '''', '´', [rfReplaceAll]);
  if Pos('"', FMemoDesc.Text) > 0 then
    FMemoDesc.Text := StringReplace(FMemoDesc.Text, '"', '´', [rfReplaceAll]);
  DoChange(FMemoDesc);
end;

procedure TItemArquivo.DoDescriptionKeyPress(Sender: TObject;
  var Key: Char);
begin
  if Key in ['’', '''', '"'] then
    Key := '´';
end;

{ TColecaoArquivos }

function TColecaoArquivos.Add(AFileName: TFileName): TItemArquivo;
begin
  Result := AddParented(AFileName, nil);
end;

function TColecaoArquivos.AddParented(AFileName: TFileName; AParentItem: TItemArquivo): TItemArquivo;
begin
  if FileNameExists(AFileName) then
  begin
    with Self.GetItemByFileName(AFileName) do
    begin
      if Visible then
        SetFocus
      else if Assigned(ParentItem) then
        ParentItem.SetFocus
      else
        MessageDlg('Já existe um arquivo com o nome ''' + AFileName + '''.', mtInformation, [mbOk], 0);
    end;
  end
  else
  begin
    Result            := TItemArquivo.Create(Self);
    Result.ParentItem := AParentItem;
    Result.Parent     := FParent;
    SetLength(FList, Count +1);
    FList[Count-1]          := Result;
    Result.TypeDoc          := '';
    Result.Description.Text := '';
    Result.TypeItems        := FTypeItems;
    Result.Checked          := True;
    Result.SetImageStyle(FImageStyle);
    ReIndex;
    Result.OnChange := DoChange;
    Result.FPanel.OnDragOver := ItemDragOver;
    Result.FPanel.OnEndDrag  := ItemEndDrag;
    DoChange(Self);
    Result.FileName := AFileName;
    if Result.FPanel.Showing then
      Result.SetFocus;
  end;
end;

procedure TColecaoArquivos.Clear;
begin
  while Count > 0 do
    Delete(0);
  DoChange(Self);
end;


constructor TColecaoArquivos.Create(AOwner: TComponent);
begin
  SetLength(FList, 0);
  FOwner                           := AOwner;
  BorderStyle                      := bsNone;
  Ctl3D                            := True;
  BevelInner                       := bvNone;
  BevelOuter                       := bvRaised;
  Color                            := clBtnFace;
  ImageStyle                       := isNone;
  FTypeItems                       := TStringList.Create;
  TStringList(FTypeItems).OnChange := DoTypeItemsChange;
end;

procedure TColecaoArquivos.Delete(Index: Integer);
var
  I: Integer;
begin
  if (Index in [0..Count-1]) then
  begin
    FList[Index].Destroy;
    for I := Index to Count -2 do
      FList[I] := FList[I+1];
    SetLength(FList, Count-1);
    ReIndex;
    DoChange(Self);
  end;
end;

procedure TColecaoArquivos.DeleteByFileName(AFileName: TFileName);
var
  Item: TItemArquivo;
begin
  Item := GetItemByFileName(AFileName);
  if Assigned(Item) then
    Delete(Item.Index);
end;

procedure TColecaoArquivos.DeleteMissingFiles;
var
  I: Integer;
begin
  I := 0;
  while I < Count do
    if (Item[I].ItemType = itNew) and not FileExists(Item[I].FileName) then
      Delete(I)
    else
      Inc(I);
end;

destructor TColecaoArquivos.Destroy;
begin
  Clear;
  inherited;
end;

procedure TColecaoArquivos.DoChange(Sender: TObject);
begin
  if Assigned(FOnChange) then
    FOnchange(Sender);
end;

procedure TColecaoArquivos.DoTypeItemsChange(Sender: TObject);
var
  I: Integer;
begin
  for I := 0 to Count -1 do
    Item[I].TypeItems := FTypeItems;
end;

function TColecaoArquivos.FileNameExists(AFileName: TFileName; const ACaseInsensitive: Boolean = True): Boolean;
begin
  Result := GetItemByFileName(AFileName, ACaseInsensitive) <> nil;
end;

function TColecaoArquivos.GetCount: Integer;
begin
  Result := High(FList) +1;
end;

function TColecaoArquivos.GetIndexFromPos(X, Y: Integer): Integer;
begin
  Result := 0;
  while Result < Count do
  begin
    if ((X >= FList[Result].FPanel.Left + FList[Result].FPanel.ClientOrigin.X) and
        (X <= FList[Result].FPanel.Left + FList[Result].FPanel.ClientOrigin.X + FList[Result].FPanel.Width)) and
       ((Y >= FList[Result].FPanel.Top  + FList[Result].FPanel.ClientOrigin.Y) and
        (Y <= FList[Result].FPanel.Top  + FList[Result].FPanel.ClientOrigin.Y + FList[Result].FPanel.Height)) then
      Break;
    Inc(Result);
  end;
  if Result >= Count then
    Result := -1;
end;

function TColecaoArquivos.GetItem(Index: Integer): TItemArquivo;
begin
  Result := FList[Index];
end;

function TColecaoArquivos.GetItemByFileName(AFileName: TFileName;
  const ACaseInsensitive: Boolean): TItemArquivo;
var
  I: Integer;
begin
  if ACaseInsensitive then
    AFileName := AnsiUpperCase(AFileName);
  for I := 0 to Count -1 do
    if ((AFileName = IfThen(ACaseInsensitive, AnsiUpperCase(Item[I].FFullFileName), Item[I].FFullFileName)) or
       (AFileName = IfThen(ACaseInsensitive, AnsiUpperCase(ExtractFileName(Item[I].FFullFileName)),
          ExtractFileName(Item[I].FFullFileName)))) then
      Break;
  if I < Count then
    Result := Item[I]
  else
    Result := nil;
end;

function TColecaoArquivos.GetItemFromPos(X, Y: Integer): TItemArquivo;
var
  I: Integer;
begin
  I := GetIndexFromPos(X, Y);
  if I >= 0 then
    Result := FList[I]
  else
    Result := nil;
end;

function TColecaoArquivos.GetItemIndex: Integer;
begin
  Result := 0;
  while (Result < Count) and (Item[Result].FPanel.SkinData.SkinSection <> 'HINT') do
    Inc(Result);
  if Result >= Count then
    Result := -1;
end;

procedure TColecaoArquivos.ItemDragOver(Sender, Source: TObject; X,
  Y: Integer; State: TDragState; var Accept: Boolean);
begin
  Accept := (Source is TsPanel) and (Sender <> Source);
end;

procedure TColecaoArquivos.ItemEndDrag(Sender, Target: TObject; X,
  Y: Integer);
var
  I: Integer;
begin
  // Saídas por não conformidades
  if Target = nil then Exit;
  if (TItemArquivo(TsPanel(Sender).Owner).TypeDoc <> TItemArquivo(TsPanel(Target).Owner).TypeDoc) then
  begin
    MessageDlg('O tipo de documento dos ítens é diferente.'#13'Edite primeiro o tipo do documento antes de continuar.', mtWarning, [mbOk], 0);
    Exit;
  end;
  if (TItemArquivo(TsPanel(Sender).Owner).FileCount > 1) and (MessageDlg('O ítem que você está tentando incorporar contém ' +
     IntToStr(TItemArquivo(TsPanel(Sender).Owner).FileCount) + ' ítem(s). Todos os ítens serão incorporados junto.'#13 +
     'Deseja continuar a operação?', mtConfirmation, [mbYes, mbNo], 0) <> mrYes) then
    Exit;

  TItemArquivo(TsPanel(Sender).Owner).ParentItem := TItemArquivo(TsPanel(Target).Owner);
  TItemArquivo(TsPanel(Target).Owner).SetFocus;

  for I := 0 to Count -1 do
  begin
    if FList[I].ParentItem = TItemArquivo(TsPanel(Sender).Owner) then
      FList[I].ParentItem := TItemArquivo(TsPanel(Target).Owner);
  end;
end;

procedure TColecaoArquivos.ReIndex;
var
  I: Integer;
begin
  for I := 0 to Count -1 do
    FList[I].FIndex := I;
end;

procedure TColecaoArquivos.SetBevelInner(const Value: TBevelCut);
var
  I: Integer;
begin
  FBevelInner := Value;
  for I := 0 to Count -1 do
    Item[I].BevelInner := Value;
end;

procedure TColecaoArquivos.SetBevelOuter(const Value: TBevelCut);
var
  I: Integer;
begin
  FBevelOuter := Value;
  for I := 0 to Count -1 do
    Item[I].BevelOuter := Value;
end;

procedure TColecaoArquivos.SetBorderStyle(const Value: TBorderStyle);
var
  I: Integer;
begin
  FBorderStyle := Value;
  for I := 0 to Count -1 do
    Item[I].BorderStyle := Value;
end;

procedure TColecaoArquivos.SetColor(const Value: TColor);
var
  I: Integer;
begin
  FColor := Value;
  for I := 0 to Count -1 do
    Item[I].Color := Value;
end;

procedure TColecaoArquivos.SetCtl3D(const Value: Boolean);
var
  I: Integer;
begin
  FCtl3D := Value;
  for I := 0 to Count -1 do
    Item[I].Ctl3D := Value;
end;

procedure TColecaoArquivos.SetImageStyle(const Value: TImageStyle);
var
  I: Integer;
begin
  for I := 0 to Count -1 do
  begin
    FList[I].SetImageStyle(Value);
    if Assigned(FOnProgress) then
      FOnProgress(Self, Count, I + 1);
  end;
end;

procedure TColecaoArquivos.SetItem(Index: Integer;
  const Value: TItemArquivo);
begin
  FList[Index] := Value;
end;

procedure TColecaoArquivos.SetItemIndex(const Value: Integer);
var
  I: Integer;
begin
  for I := 0 to Count -1 do
    FList[I].DoExit(FList[I].FPanel);
  if (Value >= 0) and (Value < Count) then
    FList[Value].DoEnter(FList[Value].FPanel);
end;

procedure TColecaoArquivos.SetParent(const Value: TWinControl);
var
  I: Integer;
begin
  FParent := Value;
  for I := 0 to Count -1 do
    Item[I].Parent := Value;
end;

procedure TColecaoArquivos.SetTypeItems(const Value: TStrings);
begin
  FTypeItems.Text := Value.Text;
end;

{ TListaArquivos }

procedure TListaArquivos.Clear;
begin
  FItems.Clear;
end;

constructor TListaArquivos.Create(AOwner: TComponent);
begin
  FOwner := AOwner;
  FItems := TColecaoArquivos.Create(AOwner);
  FItems.OnChange := DoChange;
  FItems.OnProgress := DoProgress;
  if AOwner is TWinControl then
    Parent := TWinControl(AOwner);
end;

procedure TListaArquivos.DeleteMissingFiles;
begin
  Items.DeleteMissingFiles;
end;

destructor TListaArquivos.Destroy;
begin
  FItems.Destroy;
  inherited;
end;

procedure TListaArquivos.DoChange(Sender: TObject);
begin
  if (Sender is TColecaoArquivos) or ((Sender is TItemArquivo) and (not TItemArquivo(Sender).Visible)) then
    SortWindow;
  if Assigned(FOnChange) then
    FOnChange(Sender);
end;

procedure TListaArquivos.DoProgress(Sender: TObject; MaxProgress, CurrentProgress: Int64);
begin
  if Assigned(FOnProgress) then
    FOnProgress(Self, MaxProgress, CurrentProgress);
end;

function TListaArquivos.GetCount: Integer;
begin
  Result := FItems.Count;
end;

function TListaArquivos.GetTypeItems: TStrings;
begin
  Result := FItems.FTypeItems;
end;

procedure TListaArquivos.SetParent(const Value: TWinControl);
begin
  FParent := Value;
  FItems.Parent := Value;
end;

procedure TListaArquivos.SetTypeItems(const Value: TStrings);
begin
  FItems.DefaultTypeItems := Value;
end;

procedure TListaArquivos.SortWindow;
var
  I: Integer;
  X, Y: Integer;
  VScroll: Integer;
begin
  if Count < 1 then
    Exit;

  if Parent is TScrollBox then
    VScroll := TScrollBox(Parent).VertScrollBar.Position
  else
    VScroll := 0;

  X  := _START_X;
  Y  := _START_Y - VScroll;
  for I := 0 to FItems.Count -1 do
  begin
    if FItems[I].Visible then
    begin
      FItems[I].Left := X;
      FItems[I].Top  := Y;
      X := X + _DEFAULT_PANEL_WIDTH + _SPACE;
      if X + _DEFAULT_PANEL_WIDTH > FParent.ClientWidth then
      begin
        X  := _START_X;
        Y := Y + _DEFAULT_PANEL_HEIGHT + _SPACE;
      end;
    end;
  end;
end;

end.
