unit FrBuscaProcessos;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, cxGraphics, cxControls,
  cxLookAndFeels, cxLookAndFeelPainters, cxContainer, cxEdit, Data.DB,
  Aurelius.Bind.BaseDataset, Aurelius.Bind.Dataset, Vcl.StdCtrls, Vcl.Mask,
  Vcl.DBCtrls, cxTextEdit, cxMaskEdit, Vcl.ExtCtrls, ClipBrd, Vcl.Buttons,
  Aurelius.Engine.ObjectManager;


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
  TFrBuscaProcessos = class(TFrame)
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
    lblProcesso: TLabel;
    pnlStyle2: TPanel;
    dbedtCliente: TDBEdit;
    dbedtCNPJ: TDBEdit;
    dbedtServico: TDBEdit;
    dbedtProcesso: TDBEdit;
    adsProcesso: TAureliusDataset;
    dtsProcesso: TDataSource;
    adsProduto: TAureliusDataset;
    dtsProduto: TDataSource;
    adsUnidade: TAureliusDataset;
    dtsUnidade: TDataSource;
    btnPesquisar: TBitBtn;
    adsProdutoSelf: TAureliusEntityField;
    adsProdutoCdProduto: TStringField;
    adsProdutoNmProduto: TStringField;
    adsProcessoNrProcesso: TStringField;
    adsProcessoDtAbertura: TDateTimeField;
    adsProcessoUnidNeg: TAureliusEntityField;
    adsProcessoProduto: TAureliusEntityField;
    adsProcessoCliente: TAureliusEntityField;
    adsProcessoClienteNmEmpresa: TStringField;
    adsProcessoClienteCgcEmpresa: TStringField;
    adsProcessoServicoNmServico: TStringField;
    adsUnidadeSelf: TAureliusEntityField;
    adsUnidadeCdUnidNeg: TStringField;
    adsUnidadeNmUnidNeg: TStringField;
    adsProcessoCNPJ_CLIENTE: TStringField;
    adsProcessoSelf: TAureliusEntityField;
    adsProcessoCdLinguaPedido: TStringField;
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
  procedure FecharQueryProcesso(key : word);
  procedure AbrirTabelasAux(reabrir : boolean = false);
  public
    { Public declarations }
    Refresh_Datasets : boolean;
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;

    procedure IniciarFrame(manager : TObjectManager);
    procedure BuscaProcessos(Filtrar : boolean; processo : String; var adsProcesso : TAureliusDataset);
    procedure ValidaProcessoSelecionado;

    const
    COR_CAMPO_OBRIGATORIO = $00AEA9F5;
    FILTRAR               = TRUE;
    NAO_FILTRAR           = FALSE;
    NUMEROS_ = ['0' .. '9'];
    LETRAS_ = ['a' .. 'z', 'A' .. 'Z'];
  end;

implementation

uses
  MyUtil, ConnectionModule, Aurelius.Criteria.Linq, Aurelius.Criteria.Base, FrMain, MyForm, MyEntitiesBroker;

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

constructor TFrBuscaProcessos.Create(AOwner: TComponent);
begin
  inherited
  Create(AOwner);
  edtUnidadeNeg.BeforePaste := MaskBeforePaste;
  edtProduto.BeforePaste    := MaskBeforePaste;
  edtProcesso.BeforePaste   := MaskBeforePaste;
end;

destructor TFrBuscaProcessos.Destroy;
begin
  adsUnidade.close;
  adsProduto.close;
  adsProcesso.close;
  inherited;
end;

procedure TFrBuscaProcessos.AbrirTabelasAux(reabrir : boolean = false);
begin
  if (adsProduto.state in [dsInactive]) and not reabrir then
  begin
    adsProduto.DisableControls;
    adsProduto.close;
    adsProduto.SetSourceCriteria(FObjectManager.Find<TTproduto>);
    adsProduto.Open;
    adsProduto.EnableControls;

    edtProduto.Text  := '02';//FireDacMSSQLV2(sUsuario).sUsuarioProdutoPadrao;
    BuscarCodigoProduto(edtProduto.Text);
  end;
  if (adsUnidade.state in [dsInactive]) and not reabrir then
  begin
    adsUnidade.DisableControls;
    adsUnidade.close;
    adsUnidade.SetSourceCriteria(FObjectManager.Find<TTunidNeg>);
    adsUnidade.Open;
    adsUnidade.EnableControls;

    edtUnidadeNeg.Text :='01';// FireDacMSSQLV2(sUsuario).sUsuarioUnidadeNegPadrao;
    BuscarCodigoUnidadeNeg(edtUnidadeNeg.text);
  end;
end;

procedure TFrBuscaProcessos.MaskBeforePaste(Sender: TObject; AText: String; var ADone: Boolean);
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

procedure TFrBuscaProcessos.adsProcessoCalcFields(DataSet: TDataSet);
begin
  if Length(adsProcessoClienteCgcEmpresa.AsString) = 11  then
  begin
    adsProcessoCNPJ_CLIENTE.value := Copy(adsProcessoClienteCgcEmpresa.AsString, 1,3)+'.'+
                                 Copy(adsProcessoClienteCgcEmpresa.AsString, 4,3)+'.'+
                                 Copy(adsProcessoClienteCgcEmpresa.AsString, 7,3)+'-'+
                                 Copy(adsProcessoClienteCgcEmpresa.AsString, 10,2);
  end
  else
  begin
    adsProcessoCNPJ_CLIENTE.value :=  Copy(adsProcessoClienteCgcEmpresa.AsString,1,2) + '.' +
                                  Copy(adsProcessoClienteCgcEmpresa.AsString,3,3) + '.' +
                                  Copy(adsProcessoClienteCgcEmpresa.AsString,6,3) + '/' +
                                  Copy(adsProcessoClienteCgcEmpresa.AsString,9,4) + '-' +
                                  Copy(adsProcessoClienteCgcEmpresa.AsString,13,2)
  end;
end;

procedure TFrBuscaProcessos.AlterarProduto(key : Char);
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

procedure TFrBuscaProcessos.BuscarCodigoUnidadeNeg(CodBroker : String);
begin
  if adsUnidade.Locate('CdUnidNeg', CodBroker, []) then
     dbcbUnidNegocioNome.KeyValue := adsUnidadeCdUnidNeg.asString
  else
    dbcbUnidNegocioNome.KeyValue := 0;
end;

procedure TFrBuscaProcessos.PreencherCodigoUnidadeNeg;
begin
  if not ((dbcbUnidNegocioNome.KeyValue = 0) or (dbcbUnidNegocioNome.KeyValue = null)) then
    edtUnidadeNeg.Text := adsUnidadeCdUnidNeg.asString
  else
    edtUnidadeNeg.Text := '';
end;

procedure TFrBuscaProcessos.btnPesquisarClick(Sender: TObject);
var nr_processo : string;
begin
  nr_processo       := edtUnidadeNeg.text + edtProduto.text + edtProcesso.Text;
  edtProcesso.Color := clWhite;

  BuscaProcessos(FILTRAR, nr_processo, adsProcesso);
end;

procedure TFrBuscaProcessos.BuscaProcessos(Filtrar : boolean; processo : String;
var adsProcesso : TAureliusDataset);
var
  Criteria: TCriteria;
begin
  try
    Refresh_Datasets := true;
    adsProcesso.DisableControls;
    adsProcesso.close;

    Criteria := FObjectManager.Find<TTprocesso>;

    if Filtrar then
      Criteria.Add(Linq.Eq('NrProcesso',processo))
    else
      Criteria.Add(Linq.Eq('NrProcesso',0));

    adsProcesso.SetSourceCriteria(Criteria.Refreshing);
    adsProcesso.Open;

  finally
    adsProcesso.EnableControls;
    Refresh_Datasets := false;
  end;
end;

procedure TFrBuscaProcessos.BuscarCodigoProduto(CodBroker : String);
begin
  if adsProduto.Locate('CdProduto', CodBroker, []) then
     dbcbProdutoNome.KeyValue := adsProdutoCdProduto.asstring
  else
    dbcbProdutoNome.KeyValue := '';
end;

procedure TFrBuscaProcessos.PreencherCodigoProduto;
begin
  if not ((dbcbProdutoNome.KeyValue =0) or (dbcbProdutoNome.KeyValue = null)) then
    edtProduto.Text := adsProdutoCdProduto.asString
  else
    edtProduto.Text := '';
end;

procedure TFrBuscaProcessos.dbcbProdutoNomeCloseUp(Sender: TObject);
begin
  PreencherCodigoProduto;
end;

procedure TFrBuscaProcessos.dbcbProdutoNomeExit(Sender: TObject);
begin
  PreencherCodigoProduto;
end;

procedure TFrBuscaProcessos.dbcbProdutoNomeKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
   if Key = VK_CONTROL then
    dbcbProdutoNome.KeyValue := '';
end;

procedure TFrBuscaProcessos.dbcbUnidNegocioNomeCloseUp(Sender: TObject);
begin
  PreencherCodigoUnidadeNeg
end;

procedure TFrBuscaProcessos.dbcbUnidNegocioNomeExit(Sender: TObject);
begin
  PreencherCodigoUnidadeNeg;
end;

procedure TFrBuscaProcessos.dbcbUnidNegocioNomeKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
   if Key = VK_CONTROL then
    dbcbUnidNegocioNome.KeyValue := '';
end;

procedure TFrBuscaProcessos.edtProcessoEnter(Sender: TObject);
begin
  edtProcesso.TabOrder := 0;
end;

procedure TFrBuscaProcessos.edtProcessoKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_RETURN  then
    btnPesquisar.Click
  else
    FecharQueryProcesso(key);
end;

procedure TFrBuscaProcessos.edtProcessoKeyPress(Sender: TObject; var Key: Char);
begin
  if key = '-' then
    key :=#0;

  AlterarProduto(key);
end;

procedure TFrBuscaProcessos.edtProdutoEnter(Sender: TObject);
begin
  edtProcesso.TabOrder := 6;
end;

procedure TFrBuscaProcessos.edtProdutoExit(Sender: TObject);
begin
  BuscarCodigoProduto(edtProduto.text);
end;

procedure TFrBuscaProcessos.edtProdutoKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_RETURN  then
    BuscarCodigoProduto(edtProduto.text)
  else
    FecharQueryProcesso(key);
end;

procedure TFrBuscaProcessos.edtProdutoKeyPress(Sender: TObject; var Key: Char);
begin
  SomenteNumeros(key);
end;

procedure TFrBuscaProcessos.edtUnidadeNegExit(Sender: TObject);
begin
  BuscarCodigoUnidadeNeg(edtUnidadeNeg.Text);
end;

procedure TFrBuscaProcessos.edtUnidadeNegKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_RETURN  then
    BuscarCodigoUnidadeNeg(edtUnidadeNeg.Text)
  else
    FecharQueryProcesso(key);
end;

procedure TFrBuscaProcessos.edtUnidadeNegKeyPress(Sender: TObject; var Key: Char);
begin
  SomenteNumeros(key);
end;

procedure TFrBuscaProcessos.FecharQueryProcesso(key : word);
begin
  if (char(key) in NUMEROS_) or (char(key) in LETRAS_)  then
    if not (adsProcesso.State in [dsInactive]) then
      adsProcesso.Close;
end;

procedure TFrBuscaProcessos.ValidaProcessoSelecionado;
begin
  if adsProcesso.recordcount = 0 then
  begin
    edtProcesso.Color := COR_CAMPO_OBRIGATORIO;
    abort;
  end;
end;

procedure TFrBuscaProcessos.IniciarFrame(manager : TObjectManager);
begin
  FObjectManager := manager;

  AbrirTabelasAux;
  BuscaProcessos(NAO_FILTRAR, '', adsProcesso);
end;

end.
