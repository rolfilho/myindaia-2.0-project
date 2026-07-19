unit uWalletFrameBuscaProcesso;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, cxGraphics, cxControls,
  cxLookAndFeels, cxLookAndFeelPainters, cxContainer, cxEdit, Data.DB,
  Aurelius.Bind.BaseDataset, Aurelius.Bind.Dataset, Vcl.StdCtrls, Vcl.Mask,
  Vcl.DBCtrls, cxTextEdit, cxMaskEdit, Vcl.ExtCtrls, ClipBrd, Vcl.Buttons,
  Aurelius.Engine.ObjectManager, Aurelius.Drivers.Interfaces;


type
  TBeforePaste = procedure(Sender: TObject; AText: String; var ADone: Boolean) of object;

  TcxMaskEdit = class(cxMaskEdit.TcxMaskEdit)
  private
    FBeforePaste: TBeforePaste;
  public
    procedure PasteFromClipboard; override;
    property BeforePaste: TBeforePaste read FBeforePaste write FBeforePaste;
  end;

type
  TFrameWalletPesquisaProcesso = class(TFrame)
    pnlFiltroProcesso: TPanel;
    pnlBuscarProcesso: TPanel;
    pnlStyle1: TPanel;
    pnlFiltroProc: TPanel;
    lblUnidNeg: TLabel;
    lblProduto: TLabel;
    lblFiltroProcesso: TLabel;
    dbcbUnidNegocioNome: TDBLookupComboBox;
    dbcbProdutoNome: TDBLookupComboBox;
    edtProcesso: TcxMaskEdit;
    edtProduto: TcxMaskEdit;
    edtUnidadeNeg: TcxMaskEdit;
    pnlResumoProc: TPanel;
    lblCliente: TLabel;
    lblCnpj: TLabel;
    lblServico: TLabel;
    lblSaldo: TLabel;
    lblProcesso: TLabel;
    pnlStyle2: TPanel;
    dbedtCliente: TDBEdit;
    dbedtCNPJ: TDBEdit;
    dbedtServico: TDBEdit;
    dbedtSaldo: TDBEdit;
    dbedtProcesso: TDBEdit;
    adsProcesso: TAureliusDataset;
    adsProcessoSelf: TAureliusEntityField;
    adsProcessoId: TLargeintField;
    adsProcessoAkey: TStringField;
    adsProcessoCustomid: TStringField;
    adsProcessoBalanceId: TAureliusEntityField;
    adsProcessoBalanceIdId: TLargeintField;
    adsProcessoBalanceIdValue: TFloatField;
    adsProcessoCustomerId: TAureliusEntityField;
    adsProcessoCustomerIdName: TStringField;
    adsProcessoCustomerIdTaxid: TStringField;
    adsProcessoServiceId: TAureliusEntityField;
    adsProcessoServiceIdId: TLargeintField;
    adsProcessoServiceIdAkey: TStringField;
    adsProcessoServiceIdName: TStringField;
    adsProcessoCustomerIdAkey: TStringField;
    adsProcessocalcCnpj: TStringField;
    dtsProcesso: TDataSource;
    adsProduto: TAureliusDataset;
    adsProdutoSelf: TAureliusEntityField;
    adsProdutoId: TLargeintField;
    adsProdutoAkey: TStringField;
    adsProdutoName: TStringField;
    dtsProduto: TDataSource;
    adsUnidade: TAureliusDataset;
    adsUnidadeSelf: TAureliusEntityField;
    adsUnidadeId: TLargeintField;
    adsUnidadeAkey: TStringField;
    adsUnidadeName: TStringField;
    adsUnidadeSeniorkey: TStringField;
    adsUnidadeTaxid: TStringField;
    adsUnidadeIss: TFloatField;
    adsUnidadeOrganizationId: TAureliusEntityField;
    dtsUnidade: TDataSource;
    btnPesquisar: TBitBtn;
    adsProcessoCustomerIdGroupIdId: TLargeintField;
    edtLimite: TEdit;
    Label1: TLabel;
    procedure edtProcessoEnter(Sender: TObject);
    procedure edtProcessoKeyPress(Sender: TObject; var Key: Char);
    procedure dbcbProdutoNomeKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure dbcbProdutoNomeExit(Sender: TObject);
    procedure dbcbProdutoNomeCloseUp(Sender: TObject);
    procedure edtProdutoEnter(Sender: TObject);
    procedure edtProdutoExit(Sender: TObject);
    procedure edtProdutoKeyPress(Sender: TObject; var Key: Char);
    procedure dbcbUnidNegocioNomeKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure dbcbUnidNegocioNomeExit(Sender: TObject);
    procedure dbcbUnidNegocioNomeCloseUp(Sender: TObject);
    procedure edtUnidadeNegExit(Sender: TObject);
    procedure edtUnidadeNegKeyPress(Sender: TObject; var Key: Char);
    procedure dbedtSaldoChange(Sender: TObject);
    procedure btnPesquisarClick(Sender: TObject);
    procedure edtProcessoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtProdutoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtUnidadeNegKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure adsProcessoCalcFields(DataSet: TDataSet);
  private
    { Private declarations }
      FObjectManager: TObjectManager;
  procedure PreencherCodigoProduto;
  procedure PreencherCodigoUnidadeNeg;
  procedure BuscarCodigoProduto(CodBroker : String);
  procedure BuscarCodigoUnidadeNeg(CodBroker : String);
  procedure MaskBeforePaste(Sender: TObject; AText: String; var ADone: Boolean);
  procedure AlterarProduto(key : Char);
  procedure ValidaClienteV2Broker(var ads : TAureliusDataset);
  procedure FecharQueryProcesso(key : word);
  procedure AbrirTabelasAux(reabrir : boolean = false);
  public
    { Public declarations }
    Refresh_Datasets : boolean;
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;

    procedure IniciarFrame(manager : TObjectManager);
    procedure BuscaProcessos(Filtrar : boolean; processo : String; validarCliente : Boolean; var adsProcesso : TAureliusDataset);
    procedure ValidaProcessoSelecionado;

    const
    COR_CAMPO_OBRIGATORIO = $00AEA9F5;
  end;

implementation

uses
  MyUtil, ConnectionModule, ConnectionModuleV2, MyEntitiesV2, Aurelius.Criteria.Linq, Aurelius.Criteria.Base, FrMain, MyForm,
  System.Generics.Collections;

{$R *.dfm}

procedure TcxMaskEdit.PasteFromClipboard;
var
  Done: Boolean;
begin
  Done := False;
  if Assigned(FBeforePaste) then
    FBeforePaste(Self, ClipBoard.AsText, Done);
  if not Done then
    inherited;
end;

constructor TFrameWalletPesquisaProcesso.Create(AOwner: TComponent);
begin
  inherited
  Create(AOwner);
  edtUnidadeNeg.BeforePaste := MaskBeforePaste;
  edtProduto.BeforePaste    := MaskBeforePaste;
  edtProcesso.BeforePaste   := MaskBeforePaste;
end;

destructor TFrameWalletPesquisaProcesso.Destroy;
begin
  adsUnidade.close;
  adsProduto.close;
  adsProcesso.close;
  inherited;
end;

procedure TFrameWalletPesquisaProcesso.AbrirTabelasAux(reabrir : boolean = false);
begin
  if (adsProduto.state in [dsInactive]) and not reabrir then
  begin
    adsProduto.DisableControls;
    adsProduto.close;
    adsProduto.SetSourceCriteria(FObjectManager.Find<TProduct>);
    adsProduto.Open;
    adsProduto.EnableControls;

    edtProduto.Text  := FireDacMSSQLV2(sUsuario).sUsuarioProdutoPadrao;
    BuscarCodigoProduto(edtProduto.Text);
  end;
  if (adsUnidade.state in [dsInactive]) and not reabrir then
  begin
    adsUnidade.DisableControls;
    adsUnidade.close;
    adsUnidade.SetSourceCriteria(FObjectManager.Find<TBranch>);
    adsUnidade.Open;
    adsUnidade.EnableControls;

    edtUnidadeNeg.Text := FireDacMSSQLV2(sUsuario).sUsuarioUnidadeNegPadrao;
    BuscarCodigoUnidadeNeg(edtUnidadeNeg.text);
  end;
end;

procedure TFrameWalletPesquisaProcesso.MaskBeforePaste(Sender: TObject; AText: String; var ADone: Boolean);
var
  I: Integer;
  Unidade, Produto, Processo: String;
begin
  Processo := Trim(AText);

  if TryStrToInt(Copy(Processo, 1, 4), I) then
  begin
    Unidade := Copy(Processo, 1, 2);
    Produto := Copy(Processo, 3, 2);
    System.Delete(Processo, 1, 4);
  end
  else if TryStrToInt(Copy(Processo, 1, 2), I) then
  begin
    Unidade := '';
    Produto := Copy(Processo, 1, 2);
    System.Delete(Processo, 1, 2);
  end
  else
  begin
    Unidade := '';
    Produto := '';
  end;

  if (Sender = edtUnidadeNeg) or (Sender = edtProduto) or (Sender = edtProcesso) then
  begin
    if Unidade <> '' then
    begin
      edtUnidadeNeg.Text := Unidade;
      edtUnidadeNegExit(sender);
    end;
    if Produto <> '' then
    begin
      edtProduto.Text := Produto;
      edtProdutoExit(sender);
    end;
    if Processo <> '' then
    begin
      if Produto = '' then
        AlterarProduto(Processo[1]);
      edtProcesso.Text := Processo;
    end;
  end;
  ADone := True;
end;

procedure TFrameWalletPesquisaProcesso.adsProcessoCalcFields(DataSet: TDataSet);
begin
  if Length(adsProcessoCustomerIdTaxid.AsString) = 11  then
  begin
    adsProcessocalcCnpj.value := Copy(adsProcessoCustomerIdTaxid.AsString, 1,3)+'.'+
                                 Copy(adsProcessoCustomerIdTaxid.AsString, 4,3)+'.'+
                                 Copy(adsProcessoCustomerIdTaxid.AsString, 7,3)+'-'+
                                 Copy(adsProcessoCustomerIdTaxid.AsString, 10,2);
  end
  else
  begin
    adsProcessocalcCnpj.value :=  Copy(adsProcessoCustomerIdTaxid.AsString,1,2) + '.' +
                                  Copy(adsProcessoCustomerIdTaxid.AsString,3,3) + '.' +
                                  Copy(adsProcessoCustomerIdTaxid.AsString,6,3) + '/' +
                                  Copy(adsProcessoCustomerIdTaxid.AsString,9,4) + '-' +
                                  Copy(adsProcessoCustomerIdTaxid.AsString,13,2)
  end;
end;

procedure TFrameWalletPesquisaProcesso.AlterarProduto(key : Char);
begin
  if key in ['i', 'I'] then
  begin
    if edtProduto.text = '02' then
    begin
      edtProduto.Text := '01';
      edtProdutoExit(edtProduto);
    end;
  end
  else
  if key in ['e', 'E'] then
  begin
    if edtProduto.text = '01' then
    begin
      edtProduto.Text := '02';
      edtProdutoExit(edtProduto);
    end;
  end;
end;

procedure TFrameWalletPesquisaProcesso.BuscarCodigoUnidadeNeg(CodBroker : String);
begin
  if adsUnidade.Locate('Akey', CodBroker, []) then
     dbcbUnidNegocioNome.KeyValue := adsUnidadeId.asInteger
  else
    dbcbUnidNegocioNome.KeyValue := 0;
end;

procedure TFrameWalletPesquisaProcesso.PreencherCodigoUnidadeNeg;
begin
  if not ((dbcbUnidNegocioNome.KeyValue = 0) or (dbcbUnidNegocioNome.KeyValue = null)) then
    edtUnidadeNeg.Text := adsUnidadeAkey.asString
  else
    edtUnidadeNeg.Text := '';
end;

procedure TFrameWalletPesquisaProcesso.btnPesquisarClick(Sender: TObject);
var nr_processo : string;
begin
  nr_processo       := edtUnidadeNeg.text + edtProduto.text + edtProcesso.Text;
  edtProcesso.Color := clWhite;

  BuscaProcessos(FILTRAR, nr_processo, VALIDAR_CLIENTE, adsProcesso);
end;

procedure TFrameWalletPesquisaProcesso.BuscaProcessos(Filtrar : boolean; processo : String; validarCliente : Boolean;
var adsProcesso : TAureliusDataset);
var
  Criteria: TCriteria;

  Params: TObjectList<TDBParam>;
  Statement: IDBStatement;
  ResultSet: IDBResultSet;
  vSelectLimite: String;
begin
  try
    Refresh_Datasets := true;
    adsProcesso.DisableControls;
    adsProcesso.close;

    Criteria := FObjectManager.Find<TCustomclearance>;

    if Filtrar then
      Criteria.Add(Linq.Eq('customID',processo))
    else
      Criteria.Add(Linq.Eq('id',0));

    adsProcesso.SetSourceCriteria(Criteria.Refreshing);
    adsProcesso.Open;

    if Filtrar then
      if validarCliente then
        ValidaClienteV2Broker(adsProcesso);
  finally
    adsProcesso.EnableControls;
    Refresh_Datasets := false;
  end;


  vSelectLimite :=
    'SELECT ' +
    'cc.id AS [ID] ' +
    ',cc.customID AS [NrProcesso] ' +
    ',CP.limitValue AS [LimiteAdiantamento] ' +
    'FROM MYINDAIAV2.DBO.CUSTOMCLEARANCE CC (NOLOCK) ' +
    'INNER JOIN MYINDAIAV2.dbo.Customer C (NOLOCK) ON C.id = CC.customer_id ' +
    'LEFT JOIN MYINDAIAV2.dbo.CustomerGroup_CustomerProfile CGCP (NOLOCK) ON C.group_id = CGCP.CustomerGroup_id ' +
    'INNER JOIN MYINDAIAV2.dbo.CustomerProfile CP (NOLOCK) ON CP.id = CGCP.cps_id AND CP.product_id = SUBSTRING(CC.CUSTOMID,4,1) ' +
    'WHERE CC.CUSTOMID = :processo';// or cc.id='599253';

  Params := TObjectList<TDBParam>.Create;
  try
    Statement := FObjectManager.Connection.CreateStatement;
    Params.Add(TDBParam.Create('processo', ftString, processo));
    Statement.SetSQLCommand(vSelectLimite);
    Statement.SetParams(Params);
    ResultSet := Statement.ExecuteQuery;
  finally
    Params.Free;
  end;

  if ResultSet.GetFieldValue('LimiteAdiantamento') <> NULL then
    edtLimite.text := FormatFloat('#,0.00', ResultSet.GetFieldValue('LimiteAdiantamento'));

end;

procedure TFrameWalletPesquisaProcesso.ValidaClienteV2Broker(var ads : TAureliusDataset);
var ClienteBroker : string;
begin
  if not (ads.state in [dsbrowse]) then
    exit;

  ClienteBroker := FireDacMSSQL.ClienteBroker(ads.FieldByName('Customid').AsString);
  if ClienteBroker <> ads.fieldByName('CustomerId.Akey').AsString then
  begin
    if Application.MessageBox(PWideChar('CNPJ divergente do MyIndaia. Deseja continuar?'), 'Atenção!', MB_YESNO) = ID_NO then
      BuscaProcessos(NAO_FILTRAR, '', NAO_VALIDAR_CLIENTE, ads);
  end;
end;

procedure TFrameWalletPesquisaProcesso.BuscarCodigoProduto(CodBroker : String);
begin
  if adsProduto.Locate('Akey', CodBroker, []) then
     dbcbProdutoNome.KeyValue := adsProdutoId.asInteger
  else
    dbcbProdutoNome.KeyValue := '';
end;

procedure TFrameWalletPesquisaProcesso.PreencherCodigoProduto;
begin
  if not ((dbcbProdutoNome.KeyValue =0) or (dbcbProdutoNome.KeyValue = null)) then
    edtProduto.Text := adsProdutoAkey.asString
  else
    edtProduto.Text := '';
end;

procedure TFrameWalletPesquisaProcesso.dbcbProdutoNomeCloseUp(Sender: TObject);
begin
  PreencherCodigoProduto;
end;

procedure TFrameWalletPesquisaProcesso.dbcbProdutoNomeExit(Sender: TObject);
begin
  PreencherCodigoProduto;
end;

procedure TFrameWalletPesquisaProcesso.dbcbProdutoNomeKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
   if Key = VK_CONTROL then
    dbcbProdutoNome.KeyValue := '';
end;

procedure TFrameWalletPesquisaProcesso.dbcbUnidNegocioNomeCloseUp(Sender: TObject);
begin
  PreencherCodigoUnidadeNeg
end;

procedure TFrameWalletPesquisaProcesso.dbcbUnidNegocioNomeExit(Sender: TObject);
begin
  PreencherCodigoUnidadeNeg;
end;

procedure TFrameWalletPesquisaProcesso.dbcbUnidNegocioNomeKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
   if Key = VK_CONTROL then
    dbcbUnidNegocioNome.KeyValue := '';
end;

procedure TFrameWalletPesquisaProcesso.dbedtSaldoChange(Sender: TObject);
begin
  if adsProcessoBalanceIdValue.value < 0 then
    dbedtSaldo.Color := $008484FF
  else
    dbedtSaldo.Color := $00E3E3E3;
end;

procedure TFrameWalletPesquisaProcesso.edtProcessoEnter(Sender: TObject);
begin
  edtProcesso.TabOrder := 0;
end;

procedure TFrameWalletPesquisaProcesso.edtProcessoKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_RETURN  then
    btnPesquisar.Click
  else
    FecharQueryProcesso(key);
end;

procedure TFrameWalletPesquisaProcesso.edtProcessoKeyPress(Sender: TObject; var Key: Char);
begin
  if key = '-' then
    key :=#0;

  AlterarProduto(key);
end;

procedure TFrameWalletPesquisaProcesso.edtProdutoEnter(Sender: TObject);
begin
  edtProcesso.TabOrder := 6;
end;

procedure TFrameWalletPesquisaProcesso.edtProdutoExit(Sender: TObject);
begin
  BuscarCodigoProduto(edtProduto.text);
end;

procedure TFrameWalletPesquisaProcesso.edtProdutoKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_RETURN  then
    BuscarCodigoProduto(edtProduto.text)
  else
    FecharQueryProcesso(key);
end;

procedure TFrameWalletPesquisaProcesso.edtProdutoKeyPress(Sender: TObject; var Key: Char);
begin
  SomenteNumeros(key);
end;

procedure TFrameWalletPesquisaProcesso.edtUnidadeNegExit(Sender: TObject);
begin
  BuscarCodigoUnidadeNeg(edtUnidadeNeg.Text);
end;

procedure TFrameWalletPesquisaProcesso.edtUnidadeNegKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_RETURN  then
    BuscarCodigoUnidadeNeg(edtUnidadeNeg.Text)
  else
    FecharQueryProcesso(key);
end;

procedure TFrameWalletPesquisaProcesso.edtUnidadeNegKeyPress(Sender: TObject; var Key: Char);
begin
  SomenteNumeros(key);
end;

procedure TFrameWalletPesquisaProcesso.FecharQueryProcesso(key : word);
begin
  if (char(key) in NUMEROS_) or (char(key) in LETRAS_)  then
    if not (adsProcesso.State in [dsInactive]) then
      adsProcesso.Close;
end;

procedure TFrameWalletPesquisaProcesso.ValidaProcessoSelecionado;
begin
  if adsProcesso.recordcount = 0 then
  begin
    edtProcesso.Color := COR_CAMPO_OBRIGATORIO;
    abort;
  end;
end;

procedure TFrameWalletPesquisaProcesso.IniciarFrame(manager : TObjectManager);
begin
  FObjectManager := manager;

  if Assigned(FObjectManager) then
    adsProcesso.Manager := FObjectManager;

  AbrirTabelasAux;
  BuscaProcessos(NAO_FILTRAR, '', NAO_VALIDAR_CLIENTE, adsProcesso);
end;

end.
