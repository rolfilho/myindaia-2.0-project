unit uNfeSamsung;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls, Mask, Clipbrd, Math, DB, DBTables,
  Provider, DBClient, Grids, DBGrids, ShellAPI, cxGraphics, cxControls, cxDBData,
  cxCheckBox, cxLookAndFeels, cxLookAndFeelPainters, cxStyles, dxSkinsCore,
  dxSkinsDefaultPainters, dxSkinscxPCPainter, cxCustomData, cxFilter, cxData,
  cxDataStorage, cxEdit, cxGridLevel, cxClasses, cxGridCustomView, cxTextEdit,
  cxGridTableView, cxGridDBTableView, cxGrid, cxCurrencyEdit, cxDBLookupComboBox,
  cxGridCustomTableView;

type
  TNotifyPasteEvent = procedure(Sender: TObject; var AText: String) of object;

  TEdit = class(StdCtrls.TEdit)
  private
    FOnPaste: TNotifyPasteEvent;
  protected
    procedure MsgPaste(var Msg: TMessage); message WM_PASTE;
  published
    property OnPaste: TNotifyPasteEvent read FOnPaste write FOnPaste;
  end;

  TLabelFile = class(TLabel)
  private
    FFileName: String;
    procedure DoOnClick(Sender: TObject);
    procedure SetFileName(const Value: String);
  public
    constructor Create(AOwner: TComponent); override;
    property FileName: String read FFileName write SetFileName;
  end;

  TNFFilhoteSamsung = class;

  TNFSamsung = class(TStringList)
  protected
    FProcesso: String;
    FProcId: String;
    FFileName: String;
    function GetNewFileName: String; virtual; abstract;
  public
    property Processo: String read FProcesso write FProcesso;
    property ProcId: String read FProcId write FProcId;
    property FileName: String read FFileName;
    function Path: String;
    function Save: String;
  end;

  TNFMaeSamsung = class(TNFSamsung)
  protected
    FFilhotes: array of TNFFilhoteSamsung;
    function GetNewFileName: String; override;
    procedure AddNFFilhote(AFilhote: TNFFilhoteSamsung);
    procedure DeleteNFFilhote(AFilhote: TNFFilhoteSamsung);
  public
    function TotalFilhotes: Integer;
    function GetFilhoteByIndex(AIndex: Integer): TNFFilhoteSamsung;
    function GetFilhote(AConhecimento, AContainer: String): TNFFilhoteSamsung;
    procedure WriteToFilhote(AConhecimento, AContainer, ATexto: String);
    procedure ClearAll;
    constructor Create; virtual;
  end;

  TNFFilhoteSamsung = class(TNFSamsung)
  protected
    FNFMae: TNFMaeSamsung;
    FConhecimento: String;
    FContainer: String;
    function GetNewFileName: String; override;
  public
    property Conhecimento: String read FConhecimento write FConhecimento;
    property Container: String read FContainer write FContainer;
    constructor Create(ANFMae: TNFMaeSamsung; AConhecimento, AContainer: String); reintroduce;
    destructor Destroy; override;
  end;

  TfrmNfeSamsung = class(TForm)
    nbNfe: TNotebook;
    pnlOpcoes: TPanel;
    btnCancelar: TBitBtn;
    btnVoltar: TBitBtn;
    pnlTitulo: TPanel;
    lblTituloSombra: TLabel;
    lblTitulo: TLabel;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    edtCD_UNID_NEG: TEdit;
    edtNM_UNID_NEG: TEdit;
    edtCD_PRODUTO: TEdit;
    edtNM_PRODUTO: TEdit;
    edtNR_PROCESSO: TEdit;
    btnUNID_NEG: TSpeedButton;
    btnPRODUTO: TSpeedButton;
    btnPROCESSO: TSpeedButton;
    chkUltimosProcessos: TCheckBox;
    Label4: TLabel;
    edtCD_CFOP: TMaskEdit;
    edtNM_CFOP: TEdit;
    btnCFOP: TSpeedButton;
    qryNfe: TQuery;
    qryNfeContainer: TQuery;
    Bevel1: TBevel;
    pnlArquivos: TPanel;
    qryProcesso: TQuery;
    qryProcessoNR_PROCESSO: TStringField;
    qryProcessoCD_CLIENTE: TStringField;
    qryProcessoCD_GRUPO: TStringField;
    qryProcessoIN_CANCELADO: TStringField;
    qryNfeNR_LINHA: TAutoIncField;
    qryNfeNR_PROC_ID: TStringField;
    qryNfeTX_LINHA: TMemoField;
    btnAvancar: TBitBtn;
    qryNfeContainerNR_LINHA: TAutoIncField;
    qryNfeContainerNR_PROC_ID: TStringField;
    qryNfeContainerNR_CONHECIMENTO: TStringField;
    qryNfeContainerNR_CNTR: TStringField;
    qryNfeContainerTX_LINHA: TMemoField;
    chkPossuiFilhote: TCheckBox;
    qryItensDI: TQuery;
    qryProcessoCntr: TQuery;
    updItensDI: TUpdateSQL;
    dsItensDI: TDataSource;
    dsProcessoCntr: TDataSource;
    qryItensDINR_ADICAO: TStringField;
    qryItensDINR_ITEM: TStringField;
    qryItensDICD_MERCADORIA: TStringField;
    qryItensDIPL_MERCADORIA: TFloatField;
    qryItensDIQT_MERC_UN_COMERC: TFloatField;
    qryProcessoCntrNR_CNTR: TStringField;
    qryItensDIIN_SELECIONADO: TIntegerField;
    cxGrid1DBTableView1: TcxGridDBTableView;
    cxGrid1Level1: TcxGridLevel;
    cxGrid1: TcxGrid;
    cxGrid1DBTableView1NR_ADICAO: TcxGridDBColumn;
    cxGrid1DBTableView1NR_ITEM: TcxGridDBColumn;
    cxGrid1DBTableView1CD_MERCADORIA: TcxGridDBColumn;
    cxGrid1DBTableView1PL_MERCADORIA: TcxGridDBColumn;
    cxGrid1DBTableView1NR_CONTAINER: TcxGridDBColumn;
    cxGrid1DBTableView1QT_USAR: TcxGridDBColumn;
    cxGrid1DBTableView1IN_SELECIONADO: TcxGridDBColumn;
    qryItensDIQT_USAR: TFloatField;
    qryItensDINR_CONTAINER: TStringField;
    cxStyleRepository1: TcxStyleRepository;
    cxsHeader: TcxStyle;
    cxGrid1DBTableView1QT_MERC_UN_COMERC: TcxGridDBColumn;
    procedure FormCreate(Sender: TObject);
    procedure nbNfePageChanged(Sender: TObject);
    procedure btnAvancarClick(Sender: TObject);
    procedure btnVoltarClick(Sender: TObject);
    procedure edtCD_UNID_NEGChange(Sender: TObject);
    procedure edtCD_PRODUTOChange(Sender: TObject);
    procedure btnUNID_NEGClick(Sender: TObject);
    procedure btnPRODUTOClick(Sender: TObject);
    procedure edtCD_UNID_NEGPaste(Sender: TObject; var AText: String);
    procedure edtCD_PRODUTOPaste(Sender: TObject; var AText: String);
    procedure edtNR_PROCESSOPaste(Sender: TObject; var AText: String);
    procedure edtCD_UNID_NEGExit(Sender: TObject);
    procedure edtCD_PRODUTOExit(Sender: TObject);
    procedure btnPROCESSOClick(Sender: TObject);
    procedure edtCD_CFOPChange(Sender: TObject);
    procedure btnCFOPClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure edtNR_PROCESSOChange(Sender: TObject);
    procedure qryItensDINR_CONTAINERChange(Sender: TField);
    procedure chkPossuiFilhoteClick(Sender: TObject);
    procedure qryItensDIIN_SELECIONADOChange(Sender: TField);
  private
    NF: TNFMaeSamsung;
    function GeraNotaMae: Boolean;
    function GeraNotasFilhotes: Boolean;
    procedure AdicionarLink(ANomeArquivo, ACaption: String);
  public
    { Public declarations }
  end;

var
  frmNfeSamsung: TfrmNfeSamsung;

implementation

uses
  ConsOnlineEx, Funcoes;

{$R *.dfm}

{ TEdit }

procedure TEdit.MsgPaste(var Msg: TMessage);
var
  S: String;
begin
  S := ClipBoard.AsText;
  if Assigned(FOnPaste) then
    FOnPaste(Self, S);
  Text := S;
end;

{ TLabelFile }

constructor TLabelFile.Create(AOwner: TComponent);
begin
  inherited;
  OnClick := DoOnClick;
  Cursor := crHandPoint;
  Font.Color := clBlue;
  ShowHint := True;
end;

procedure TLabelFile.DoOnClick(Sender: TObject);
begin
  ShellExecute(0, nil, PAnsiChar(FFileName), nil, nil, SW_SHOW);
end;

procedure TLabelFile.SetFileName(const Value: String);
begin
  FFileName := Value;
  Caption := ExtractFileName(Value);
  Hint := Value;
end;

{ TNFSamsung }

function TNFSamsung.Path: String;
begin
  Result := 'C:\DDBROKER\NOTA FISCAL\' + Processo + ' (' + ProcId + ')\';
end;

function TNFSamsung.Save: String;
begin
  if (FFileName <> '') and FileExists(FFileName) then
    DeleteFile(FFileName);
  FFileName := GetNewFileName;
  if not DirectoryExists(Path) then
    ForceDirectories(Path);
  SaveToFile(FFileName);
  Result := FFileName
end;

{ TNFMaeSamsung }

procedure TNFMaeSamsung.AddNFFilhote(AFilhote: TNFFilhoteSamsung);
var
  I: Integer;
begin
  I := 0;
  while (I < TotalFilhotes) and (FFilhotes[I] <> AFilhote) do
    Inc(I);
  if (I >= TotalFilhotes) then
  begin
    SetLength(FFilhotes, TotalFilhotes +1);
    FFilhotes[TotalFilhotes -1] := AFilhote;
    AFilhote.Processo := Processo;
    AFilhote.ProcId := ProcId;
  end;
end;

procedure TNFMaeSamsung.ClearAll;
begin
  Clear;
  FProcesso := '';
  FProcId := '';
  while TotalFilhotes > 0 do
    FFilhotes[0].Free;
end;

constructor TNFMaeSamsung.Create;
begin
  inherited;
  SetLength(FFilhotes, 0);
end;

procedure TNFMaeSamsung.DeleteNFFilhote(AFilhote: TNFFilhoteSamsung);
var
  I, I2: Integer;
begin
  I := 0;
  while (I < TotalFilhotes) and (FFilhotes[I] <> AFilhote) do
    Inc(I);
  if (I < TotalFilhotes) then
  begin
    for I2 := I to TotalFilhotes -2  do
      FFilhotes[I2] := FFilhotes[I2 +1];
    SetLength(FFilhotes, TotalFilhotes -1);
  end;
end;

function TNFMaeSamsung.GetFilhote(AConhecimento, AContainer: String): TNFFilhoteSamsung;
var
  I: Integer;
begin
  Result := nil;
  I := 0;
  while (I < TotalFilhotes) and (Result = nil) do
    if SameText(FFilhotes[I].Conhecimento, AConhecimento) and SameText(FFilhotes[I].Container, AContainer) then
      Result := FFilhotes[I]
    else
      Inc(I);
end;

function TNFMaeSamsung.GetFilhoteByIndex(AIndex: Integer): TNFFilhoteSamsung;
begin
  Result := FFilhotes[AIndex];
end;

function TNFMaeSamsung.GetNewFileName: String;
begin
  Result := Path + 'NOTA ' + Trim(FProcId) + FormatDateTime('yyyymmddhhnnss', Now) + '.txt';
end;

function TNFMaeSamsung.TotalFilhotes: Integer;
begin
  Result := High(FFilhotes) +1;
end;

procedure TNFMaeSamsung.WriteToFilhote(AConhecimento, AContainer, ATexto: String);
var
  Filhote: TNFFilhoteSamsung;
begin
  Filhote := GetFilhote(AConhecimento, AContainer);
  if Filhote = nil then
    Filhote := TNFFilhoteSamsung.Create(Self, AConhecimento, AContainer);
  Filhote.Add(ATexto);
end;

{ TNFFilhoteSamsung }

constructor TNFFilhoteSamsung.Create(ANFMae: TNFMaeSamsung; AConhecimento, AContainer: String);
begin
  inherited Create;
  FNFMae := ANFMae;
  FConhecimento := AConhecimento;
  FContainer := AContainer;
  if Assigned(FNFMae) then
    ANFMae.AddNFFilhote(Self);
end;

destructor TNFFilhoteSamsung.Destroy;
begin
  if Assigned(FNFMae) then
    FNFMae.DeleteNfFilhote(Self);
  inherited;
end;

function TNFFilhoteSamsung.GetNewFileName;
begin
  Result := Path + 'NOTA FILHOTE ' + Trim(ProcId) + '_' + FormatDateTime('yyyymmddhhnnss', Now) + '_' + Trim(FConhecimento) + '_' + Trim(FContainer) + '.txt';
end;

{ TfrmNfeSamsung }

procedure TfrmNfeSamsung.FormCreate(Sender: TObject);
begin
  nbNfe.PageIndex := 0;
  edtCD_UNID_NEG.OnPaste := edtCD_UNID_NEGPaste;
  edtCD_PRODUTO.OnPaste  := edtCD_PRODUTOPaste;
  edtNR_PROCESSO.OnPaste := edtNR_PROCESSOPaste;
  NF := TNFMaeSamsung.Create;
end;

procedure TfrmNfeSamsung.nbNfePageChanged(Sender: TObject);
begin
  btnVoltar.Enabled := nbNfe.PageIndex > 0;
  btnAvancar.Enabled := nbNfe.PageIndex < nbNfe.Pages.Count -1;

  case nbNfe.PageIndex of
    0: if chkPossuiFilhote.Checked then
         btnAvancar.Caption := 'Avançar'
       else
         btnAvancar.Caption := 'Gerar';
    1: btnAvancar.Caption := 'Gerar';
  end;

  lblTitulo.Caption := nbNfe.ActivePage;
  lblTituloSombra.Caption := nbNfe.ActivePage;
end;

procedure TfrmNfeSamsung.btnAvancarClick(Sender: TObject);
var
  I: Integer;
begin
  case nbNfe.PageIndex of
    // Nota Fiscal Mãe
    0: begin
         if edtNM_UNID_NEG.Text = '' then
         begin
           edtCD_UNID_NEG.SetFocus;
           MessageDlg('Insira uma Unidade válida.', mtError, [mbOk], 0);
         end
         else if edtNM_PRODUTO.Text = '' then
         begin
           edtCD_PRODUTO.SetFocus;
           MessageDlg('Insira um Produto válido.', mtError, [mbOk], 0);
         end
         else if edtNR_PROCESSO.Text = '' then
         begin
           edtNR_PROCESSO.SetFocus;
           MessageDlg('Insira um Processo válido.', mtError, [mbOk], 0);
         end
         else if edtNM_CFOP.Text = '' then
         begin
           edtCD_CFOP.SetFocus;
           MessageDlg('Insira um CFOP válido.', mtError, [mbOk], 0);
         end
         else
         begin
           if qryProcesso.Active then
             qryProcesso.Close;
           qryProcesso.ParamByName('NR_PROCESSO').AsString := edtCD_UNID_NEG.Text + edtCD_PRODUTO.Text + edtNR_PROCESSO.Text;
           qryProcesso.Open;
           if Trim(qryProcessoNR_PROCESSO.AsString) = '' then
             MessageDlg('Processo não encontrado.'#13'Verifique a Unidade, o Produto e Processo.', mtInformation, [mbOk], 0)
           else if not SameText(qryProcessoCD_GRUPO.AsString, 'B40') then
             MessageDlg('O Processo não é do grupo Samsung.'#13'Verifique a Unidade, o Produto e Processo.', mtInformation, [mbOk], 0)
           else if qryProcessoIN_CANCELADO.AsString = '1' then
             MessageDlg('Processo está cancelado.'#13'Verifique a Unidade, o Produto e Processo.', mtInformation, [mbOk], 0)
           else
           begin
             if (StrToInt(ConsultaLookUPSQL('SELECT COUNT(*) AS QTD_CONTAINER ' +
                                           'FROM TPROCESSO_CNTR ' +
                                           'WHERE NR_PROCESSO = :NR_PROCESSO', 'QTD_CONTAINER',
                                           [edtCD_UNID_NEG.Text + edtCD_PRODUTO.Text + edtNR_PROCESSO.Text])) > 1) and (not chkPossuiFilhote.Checked) and
                (MessageDlg('Este processo possui mais de um container.'#13'Deseja gerar Nota Filhote?', mtConfirmation, [mbYes, mbNo], 0) = mrYes) then
               chkPossuiFilhote.Checked := True;

             if GeraNotaMae then
               if chkPossuiFilhote.Checked then
               begin
                 nbNfe.PageIndex := nbNfe.PageIndex +1;
                 if qryItensDI.Active then
                   qryItensDI.Close;
                 qryItensDI.ParamByName('NR_PROCESSO').AsString := NF.Processo;
                 qryItensDI.Open;
                 if qryProcessoCntr.Active then
                   qryProcessoCntr.Close;
                 qryProcessoCntr.ParamByName('NR_PROCESSO').AsString := NF.Processo;
                 qryProcessoCntr.Open;
               end
               else
                 nbNfe.PageIndex := nbNfe.PageIndex +2;
           end;
         end
       end;
    1: begin
         if GeraNotasFilhotes and (qryItensDI.RecordCount = 0) then
           nbNfe.PageIndex := nbNfe.PageIndex +1;
       end;
  end;

  if nbNfe.PageIndex = 2 then
  begin
    while pnlArquivos.ComponentCount > 0 do
      pnlArquivos.Components[0].Free;

    AdicionarLink(NF.Save, 'Nota Fiscal Mãe');
    for I := 0 to NF.TotalFilhotes -1 do
      AdicionarLink(NF.GetFilhoteByIndex(I).Save, 'Nota Fiscal Filhote ' + IntToStr(I +1));
  end;
end;

procedure TfrmNfeSamsung.btnVoltarClick(Sender: TObject);
begin
  case nbNfe.PageIndex of
    // Nota Fiscal Filhote
    1: nbNfe.PageIndex := nbNfe.PageIndex -1;

    // Arquivos Gerados
    2: if chkPossuiFilhote.Checked then
         nbNfe.PageIndex := nbNfe.PageIndex -1
       else
         nbNfe.PageIndex := nbNfe.PageIndex -2; 
  end;
end;

procedure TfrmNfeSamsung.edtCD_UNID_NEGChange(Sender: TObject);
begin
  if Length(edtCD_UNID_NEG.Text) < 2 then
    edtNM_UNID_NEG.Text := ''
  else
  begin
    edtNM_UNID_NEG.Text := Trim(ConsultaLookUP('TUNID_NEG', 'CD_UNID_NEG', edtCD_UNID_NEG.Text, 'AP_UNID_NEG'));
    if edtNM_UNID_NEG.Text = '' then
    begin
      MessageDlg('Unidade inválida.', mtError, [mbOk], 0);
      edtCD_UNID_NEG.SetFocus;
    end;
    edtCD_PRODUTO.SetFocus;
  end;
end;

procedure TfrmNfeSamsung.edtCD_PRODUTOChange(Sender: TObject);
begin
  if Length(edtCD_PRODUTO.Text) < 2 then
    edtNM_PRODUTO.Text := ''
  else
  begin
    edtNM_PRODUTO.Text := Trim(ConsultaLookUP('TPRODUTO', 'CD_PRODUTO', edtCD_PRODUTO.Text, 'NM_PRODUTO'));
    if edtNM_PRODUTO.Text = '' then
    begin
      MessageDlg('Produto inválido.', mtError, [mbOk], 0);
      edtCD_PRODUTO.SetFocus;
    end;
    edtNR_PROCESSO.SetFocus;
  end;
end;

procedure TfrmNfeSamsung.btnUNID_NEGClick(Sender: TObject);
var
  S: String;
begin
  S := ConsultaOnLineExSQL('SELECT CD_UNID_NEG, AP_UNID_NEG ' +
                           'FROM TUNID_NEG ' +
                           'WHERE IN_ATIVO = "1"', 'Unidade', ['CD_UNID_NEG', 'AP_UNID_NEG'], ['Código', 'Nome'], 'CD_UNID_NEG', nil, edtCD_UNID_NEG.Text);
  if S <> edtCD_UNID_NEG.Text then
    edtCD_UNID_NEG.Text := S;
end;

procedure TfrmNfeSamsung.btnPRODUTOClick(Sender: TObject);
var
  S: String;
begin
  S := ConsultaOnLineExSQL('SELECT CD_PRODUTO, NM_PRODUTO ' +
                           'FROM TPRODUTO ' +
                           'WHERE IN_ATIVO = "1"', 'Produto', ['CD_PRODUTO', 'AP_PRODUTO'], ['Código', 'Nome'], 'CD_PRODUTO', nil, edtCD_PRODUTO.Text);
  if S <> edtCD_PRODUTO.Text then
    edtCD_PRODUTO.Text := S;
end;

procedure TfrmNfeSamsung.edtNR_PROCESSOPaste(Sender: TObject; var AText: String);
var
  I: Integer;
begin
  if TryStrToInt(Copy(AText, 1, 4), I) then
  begin
    if edtCD_UNID_NEG.Text <> Copy(AText, 1, 2) then
      edtCD_UNID_NEG.Text := Copy(AText, 1, 2);
    if edtCD_PRODUTO.Text <> Copy(AText, 3, 2) then
      edtCD_PRODUTO.Text := Copy(AText, 3, 2);
    Delete(AText, 1, 4);
  end;
end;

procedure TfrmNfeSamsung.edtCD_PRODUTOPaste(Sender: TObject; var AText: String);
begin
  if Length(AText) > 2 then
  begin
    if edtCD_UNID_NEG.Text <> Copy(AText, 1, 2) then
      edtCD_UNID_NEG.Text := Copy(AText, 1, 2);
    edtNR_PROCESSO.Text := Copy(AText, 5, Length(AText) -4);
    AText := Copy(AText, 3, 2);
  end;
end;

procedure TfrmNfeSamsung.edtCD_UNID_NEGPaste(Sender: TObject; var AText: String);
begin
  if Length(AText) > 2 then
  begin
    if edtCD_PRODUTO.Text <> Copy(AText, 3, 2) then
      edtCD_PRODUTO.Text := Copy(AText, 3, 2);
    edtNR_PROCESSO.Text := Copy(AText, 5, Length(AText) -4);
    AText := Copy(AText, 1, 2);
  end;
end;

procedure TfrmNfeSamsung.edtCD_UNID_NEGExit(Sender: TObject);
begin
  if Length(Trim(edtCD_UNID_NEG.Text)) = 1 then
    edtCD_UNID_NEG.Text := '0' + Trim(edtCD_UNID_NEG.Text);
end;

procedure TfrmNfeSamsung.edtCD_PRODUTOExit(Sender: TObject);
begin
  if Length(Trim(edtCD_PRODUTO.Text)) = 1 then
    edtCD_PRODUTO.Text := '0' + Trim(edtCD_PRODUTO.Text);
end;

procedure TfrmNfeSamsung.btnPROCESSOClick(Sender: TObject);
var
  SQL: TStringList;
begin
  SQL := TStringList.Create;
  try
    SQL.Add('SELECT SUBSTRING(PR.NR_PROCESSO, 5, 13) NR_PROCESSO, PR.CD_SERVICO, EN.NM_EMPRESA, EN.AP_EMPRESA, EN.CGC_EMPRESA, DT_ABERTURA');
    SQL.Add('FROM TPROCESSO PR');
    SQL.Add('  INNER JOIN TEMPRESA_NAC EN ON EN.CD_EMPRESA = PR.CD_CLIENTE');
    SQL.Add('WHERE PR.CD_PRODUTO  = :CD_PRODUTO');
    SQL.Add('  AND PR.CD_UNID_NEG = :CD_UNID_NEG');
    SQL.Add('  AND EN.CD_GRUPO = ''B40''');
    SQL.Add('  AND PR.IN_CANCELADO = "0"');
    if chkUltimosProcessos.Checked then
      SQL.Add('  AND DT_ABERTURA > GETDATE() - :QTD_DIAS');
    //edtNR_PROCESSO.Text := ConsultaOnLineExSQLList(SQL, 'Processos', ['NR_PROCESSO', 'CD_SERVICO', 'NM_EMPRESA', 'AP_EMPRESA', 'CGC_EMPRESA', 'DT_ABERTURA'],
    //   ['Processo', 'Serviço', 'Cliente', 'Apelido', 'CNPJ', 'Data de Abertura'], 'NR_PROCESSO', nil, edtNR_PROCESSO.Text, );
    edtNR_PROCESSO.Text := ConsultaOnLineExSQL(SQL.Text, 'Processos', ['NR_PROCESSO', 'CD_SERVICO', 'NM_EMPRESA', 'AP_EMPRESA', 'CGC_EMPRESA', 'DT_ABERTURA'],
       ['Processo', 'Serviço', 'Cliente', 'Apelido', 'CNPJ', 'Data de Abertura'], 'NR_PROCESSO', [edtCD_PRODUTO.Text, edtCD_UNID_NEG.Text, 90], nil, edtNR_PROCESSO.Text);
  finally
    FreeAndNil(SQL);
  end;
end;

procedure TfrmNfeSamsung.edtCD_CFOPChange(Sender: TObject);
begin
  if Length(edtCD_CFOP.Text) < 4 then
    edtNM_CFOP.Text := ''
  else
  begin
    edtNM_CFOP.Text := Trim(ConsultaLookUP('TCFOP', 'CD_CFOP', edtCD_CFOP.Text, 'NM_CFOP'));
    if edtNM_CFOP.Text = '' then
    begin
      MessageDlg('CFOP inválido.', mtError, [mbOk], 0);
      edtCD_CFOP.SetFocus;
    end;
  end;
end;

procedure TfrmNfeSamsung.btnCFOPClick(Sender: TObject);
var
  S: String;
begin
  S := ConsultaOnLineExSQL('SELECT CD_CFOP, NM_CFOP ' +
                           'FROM TCFOP', 'CFOP', ['CD_CFOP', 'NM_CFOP'], ['Código', 'Nome'], 'CD_CFOP', nil, edtCD_CFOP.Text);
  if S <> edtCD_CFOP.Text then
    edtCD_CFOP.Text := S;
end;

procedure TfrmNfeSamsung.FormActivate(Sender: TObject);
begin
  edtCD_UNID_NEG.Text := str_cd_unid_neg;
  edtCD_PRODUTO.Text  := str_cd_produto;
end;

procedure TfrmNfeSamsung.edtNR_PROCESSOChange(Sender: TObject);
begin
  if Length(edtNR_PROCESSO.Text) >= 12 then
    edtCD_CFOP.Text := ConsultaLookUPSQL('SELECT TOP 1 CD_CFOP ' +
                                         'FROM TADICAO_DE_IMPORTACAO ' +
                                         'WHERE NR_PROCESSO = :NR_PROCESSO ' +
                                         '  AND ISNULL(CD_CFOP, "") <> ""', 'CD_CFOP', [edtCD_UNID_NEG.Text + edtCD_PRODUTO.Text + edtNR_PROCESSO.Text]);
end;

procedure TfrmNfeSamsung.qryItensDINR_CONTAINERChange(Sender: TField);
begin
  if qryItensDI.State <> dsEdit then
    qryItensDI.Edit;
  if (qryItensDIQT_USAR.AsFloat <= 0) or (Trim(qryItensDINR_CONTAINER.AsString) = '') then
    qryItensDIIN_SELECIONADO.AsInteger := 0
  else
    qryItensDIIN_SELECIONADO.AsInteger := 1;
end;

function TfrmNfeSamsung.GeraNotaMae: Boolean;
  procedure LimparPasta;
  var
    SR: TSearchRec;
  begin
    if FindFirst(NF.Path + '*.txt', faAnyFile, SR) = 0 then
      repeat
        if SR.Attr and faDirectory <> faDirectory then
          DeleteFile(NF.Path + SR.Name);
      until FindNext(SR) <> 0;

    FindClose(SR);
  end;
begin
  Result := True;

  NF.ClearAll;

  NF.Processo := edtCD_UNID_NEG.Text + edtCD_PRODUTO.Text + edtNR_PROCESSO.Text;
  NF.ProcId := Trim(ConsultaLookUPSQL('SELECT TOP 1 CD_REFERENCIA ' +
                                      'FROM TREF_CLIENTE ' +
                                      'WHERE NR_PROCESSO = :NR_PROCESSO ' +
                                      '  AND TP_REFERENCIA = "04"', 'CD_REFERENCIA', [NF.Processo]));

  LimparPasta;

  // Nota Fiscal Mãe
  if qryNfe.Active then
    qryNfe.Close;
  qryNfe.ParamByName('CD_CFOP').AsString     := edtCD_CFOP.Text;
  qryNfe.ParamByName('NR_PROCESSO').AsString := NF.Processo;
  qryNfe.Open;

  while Result and not qryNfe.Eof do
  begin
    if Trim(qryNfeTX_LINHA.AsString) = '' then
      Result := False
    else
    begin
      NF.Add(qryNfeTX_LINHA.AsString);
      qryNfe.Next;
    end;
  end;

  if not Result then
    MessageDlg('Erro gerando Nota Fiscal Mãe. Alguma informação esta faltando e uma das linhas está vazia.'#13'Favor verificar dados de DI e de Nota Fiscal.', mtWarning, [mbOk], 0)
  else
    qryNfe.First;
end;

function TfrmNfeSamsung.GeraNotasFilhotes: Boolean;
begin
  qryItensDI.DisableControls;
  Result := True;
  if qryItensDI.State = dsEdit then
    qryItensDI.Post;

  try
    qryItensDI.First;
    while Result and not qryItensDI.Eof do
    begin
      if qryItensDIQT_USAR.AsFloat > qryItensDIQT_MERC_UN_COMERC.AsFloat then
      begin
        Result := False;
        MessageDlg('Quantidade a ser usada é maior do que a quantidade disponível para o item abaixo:'#13 +
                   'Adição: ' + qryItensDINR_ADICAO.AsString + #13 +
                   'Item: ' + qryItensDINR_Item.AsString + '.', mtWarning, [mbOk], 0);
        cxGrid1.SetFocus;
      end;
      if Result then
        qryItensDI.Next;
    end;

    if Result then
      qryItensDI.First;
    while Result and not qryItensDI.Eof do
    begin
      if qryItensDIIN_SELECIONADO.AsInteger = 1 then
      begin
        if qryNfeContainer.Active then
          qryNfeContainer.Close;
        qryNfeContainer.ParamByName('NR_PROCESSO').AsString := NF.Processo;
        qryNfeContainer.ParamByName('NR_ADICAO').AsString := qryItensDINR_ADICAO.AsString;
        qryNfeContainer.ParamByName('NR_ITEM').AsString := qryItensDINR_ITEM.AsString;
        qryNfeContainer.ParamByName('QT_USAR').AsFloat := qryItensDIQT_USAR.AsFloat;
        qryNfeContainer.ParamByName('NR_CNTR').AsString := qryItensDINR_CONTAINER.AsString;
        qryNfeContainer.Open;

        if Trim(qryNfeContainerTX_LINHA.AsString) = '' then
        begin
          Result := False;
          MessageDlg('Erro gerando Nota Fiscal Filhote.'#13'Favor verificar os dados para:'#13 +
                     'Adição: ' + qryItensDINR_ADICAO.AsString + #13 +
                     'Item: ' + qryItensDINR_Item.AsString + '.', mtWarning, [mbOk], 0);
        end
        else
          NF.WriteToFilhote(Trim(qryNfeContainerNR_CONHECIMENTO.AsString), Trim(qryNfeContainerNR_CNTR.AsString), qryNfeContainerTX_LINHA.AsString);
      end; // Selecionado

      qryItensDI.Next;
    end; // While

    if Result then
    begin
      qryItensDI.First;
      while not qryItensDI.Eof do
      begin
        if qryItensDIIN_SELECIONADO.AsInteger = 1 then
        begin
          if qryItensDIQT_MERC_UN_COMERC.AsFloat - qryItensDIQT_USAR.AsFloat > 0.1 then
          begin
            qryItensDI.Edit;
            qryItensDIQT_MERC_UN_COMERC.AsFloat := qryItensDIQT_MERC_UN_COMERC.AsFloat - qryItensDIQT_USAR.AsFloat;
            qryItensDINR_CONTAINER.AsString := '';
            qryItensDIQT_USAR.AsFloat := 0;
            qryItensDI.Post;
            qryItensDI.Next;
          end
          else
            qryItensDI.Delete;
        end // Selecionado
        else
          qryItensDI.Next;
      end; // While
      ShowMessage('Arquivo(s) gerado(s) com sucesso.');
    end;
  finally
    if Result then
      qryItensDI.First;
    qryItensDI.EnableControls;
  end;
end;

procedure TfrmNfeSamsung.AdicionarLink(ANomeArquivo, ACaption: String);
var
  I: Integer;
begin
  I := 0;
  while (I < pnlArquivos.ComponentCount) do
  begin
    if (pnlArquivos.Components[I] is TLabelFile) and SameText(TLabelFile(pnlArquivos.Components[I]).FileName, ANomeArquivo) then
      Exit;
    Inc(I);
  end;

  with TLabelFile.Create(pnlArquivos) do
  begin
    Parent := pnlArquivos;
    if pnlArquivos.ComponentCount = 0 then
      Top := 10
    else
      Top := 15 * pnlArquivos.ComponentCount;
    Left := 10;
    FileName := ANomeArquivo;
    Caption := ACaption;
  end;
end;

procedure TfrmNfeSamsung.chkPossuiFilhoteClick(Sender: TObject);
begin
  if chkPossuiFilhote.Checked then
    btnAvancar.Caption := 'Avançar'
  else
    btnAvancar.Caption := 'Gerar';
end;

procedure TfrmNfeSamsung.qryItensDIIN_SELECIONADOChange(Sender: TField);
begin
  if (qryItensDIIN_SELECIONADO.AsInteger = 1) and ((qryItensDIQT_USAR.AsFloat <= 0) or (Trim(qryItensDINR_CONTAINER.AsString) = '')) then
  begin
    qryItensDIIN_SELECIONADO.AsInteger := 0;
    if qryItensDIQT_USAR.AsFloat <= 0 then
      MessageDlg('É necessário informar uma quantidade a ser utilizada para este item.', mtError, [mbOk], 0)
    else
      MessageDlg('É necessário informar um container para este item.', mtError, [mbOk], 0);
  end;
end;

end.
