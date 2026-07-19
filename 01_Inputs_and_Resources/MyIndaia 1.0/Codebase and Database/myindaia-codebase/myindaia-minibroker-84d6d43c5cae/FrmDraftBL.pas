unit FrmDraftBL;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, MyCdMasterDetail, cxGraphics,
  cxControls, cxLookAndFeels, cxLookAndFeelPainters, cxStyles, cxCustomData,
  cxFilter, cxData, cxDataStorage, cxEdit, cxNavigator, Data.DB, cxDBData,
  uWalletFrameBuscaProcesso, cxGridCustomPopupMenu, cxGridPopupMenu,
  cxGridLevel, cxClasses, cxGridCustomView, cxGridCustomTableView,
  cxGridTableView, cxGridDBTableView, cxGrid, Vcl.ExtCtrls, Vcl.StdCtrls,
  Vcl.ComCtrls, FrBuscaProcessos, Vcl.DBCtrls, Vcl.Mask,
  Aurelius.Bind.BaseDataset, Aurelius.Engine.ObjectManager,
  Aurelius.Bind.Dataset ,Aurelius.Events.Manager, Aurelius.Global.Utils,
  Aurelius.Criteria.Projections, cxContainer, cxTextEdit, cxMaskEdit,
  cxDropDownEdit, cxLookupEdit, cxDBLookupEdit, cxDBLookupComboBox, FmDetailCx,
  FrmDraftBLComentarios, FrmDraftBLContainer, MyEntitiesBroker, FmDraftBLCtx,
   Generics.Collections, FrmDraftBLMercContainer, frmDraftBLMercadoria,
  Xml.xmldom, Xml.XMLIntf, Xml.XMLDoc, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client, MyDialog, uMySFTPClient, libssh2_sftp, MyUtil, cxCalc,
  cxDBEdit, dmGerarArquivosDraft, frmRelatorioDraft, dmConfiguracoes, MyGlobal;

type

  TfrmCdDraftBL = class(TformMyCdMasterDetail)
    framePesquisaProc: TFrBuscaProcessos;
    Splitter1: TSplitter;
    adsMainSelf: TAureliusEntityField;
    adsMainDtCriacao: TDateTimeField;
    adsMainDtEnvioDraft: TDateTimeField;
    adsMainCdEnvioInttra: TStringField;
    adsMainCdUsuarioCriacao: TAureliusEntityField;
    cxGridDBTableViewNrProcesso: TcxGridDBColumn;
    cxGridDBTableViewNrAmend: TcxGridDBColumn;
    cxGridDBTableViewDtCriacao: TcxGridDBColumn;
    cxGridDBTableViewDtEnvioDraft: TcxGridDBColumn;
    cxGridDBTableViewCdEnvioInttra: TcxGridDBColumn;
    cxGridDBTableViewCdUsuarioCriacaoNmUsuario: TcxGridDBColumn;
    pgCamposMaster: TPageControl;
    TabSheet1: TTabSheet;
    Panel1: TPanel;
    Label14: TLabel;
    Label13: TLabel;
    Label1: TLabel;
    Label17: TLabel;
    Label18: TLabel;
    Label19: TLabel;
    DBEdit2: TDBEdit;
    DBEdit1: TDBEdit;
    dbedtId: TDBEdit;
    DBEdit10: TDBEdit;
    DBEdit11: TDBEdit;
    DBEdit12: TDBEdit;
    TabSheet2: TTabSheet;
    GroupBox6: TGroupBox;
    Label32: TLabel;
    Label33: TLabel;
    Label34: TLabel;
    Label35: TLabel;
    Label37: TLabel;
    DBEdit33: TDBEdit;
    DBEdit34: TDBEdit;
    DBEdit35: TDBEdit;
    DBEdit36: TDBEdit;
    DBEdit38: TDBEdit;
    GroupBox10: TGroupBox;
    DBEdit39: TDBEdit;
    GroupBox12: TGroupBox;
    DBEdit41: TDBEdit;
    GroupBox13: TGroupBox;
    DBEdit42: TDBEdit;
    GroupBox5: TGroupBox;
    Label38: TLabel;
    DBEdit30: TDBEdit;
    Label39: TLabel;
    DBEdit31: TDBEdit;
    Label40: TLabel;
    DBEdit32: TDBEdit;
    Marcação: TTabSheet;
    GroupBox7: TGroupBox;
    DBMemo1: TDBMemo;
    TabSheet3: TTabSheet;
    GroupBox8: TGroupBox;
    Label42: TLabel;
    dbcbPrepaindCollect: TcxDBLookupComboBox;
    Label41: TLabel;
    dbcbTipoTaxa: TcxDBLookupComboBox;
    dbcbTaxa: TcxDBLookupComboBox;
    adsTipoFrete: TAureliusDataset;
    dsTipoFrete: TDataSource;
    adsTipoFreteSelf: TAureliusEntityField;
    adsTipoFreteCodigo: TStringField;
    adsTipoFreteDescricao: TStringField;
    adsTipoTaxaInttra: TAureliusDataset;
    dsTipoTaxaInttra: TDataSource;
    adsTipoTaxaInttraSelf: TAureliusEntityField;
    adsTipoTaxaInttraCdTaxaInttra: TIntegerField;
    adsTipoTaxaInttraDescricao: TStringField;
    dsComentariosIntra: TDataSource;
    adsComentariosIntra: TAureliusDataset;
    adsComentariosIntraSelf: TAureliusEntityField;
    adsComentariosIntraCdComentarioInntra: TStringField;
    adsComentariosIntraDescricao: TStringField;
    GroupBox9: TGroupBox;
    cxDBLookupComboBox1: TcxDBLookupComboBox;
    dsMovimentoInttra: TDataSource;
    adsMovimentoInttra: TAureliusDataset;
    TabSheet4: TTabSheet;
    TabSheet6: TTabSheet;
    adsUsuario: TAureliusDataset;
    dtsUsuario: TDataSource;
    adsUsuarioSelf: TAureliusEntityField;
    adsUsuarioApUsuario: TStringField;
    adsUsuarioInAtivo: TStringField;
    adsUsuarioCdUsuario: TStringField;
    adsMainNrProcesso: TAureliusEntityField;
    adsMainNrProcessoNrProcesso: TStringField;
    frameDraftBLComentarios: TframeDraftBLComentarios;
    adsMainClienteNome: TStringField;
    adsMainClienteEndereco: TStringField;
    adsMainClienteCidade: TStringField;
    adsMainClienteCep: TStringField;
    adsMainClienteEstado: TStringField;
    adsMainClientePaisCod: TStringField;
    adsMainClienteCnpj: TStringField;
    adsMainConsigNome: TStringField;
    adsMainConsigEndereco: TStringField;
    adsMainConsigCidade: TStringField;
    adsMainConsigCep: TStringField;
    adsMainConsigEstado: TStringField;
    adsMainNotify1Nome: TStringField;
    adsMainNotify1Cidade: TStringField;
    adsMainNotify1Cep: TStringField;
    adsMainNotify1Estado: TStringField;
    adsMainNotify1PaisCod: TStringField;
    adsMainNotify2Nome: TStringField;
    adsMainNotify2Cidade: TStringField;
    adsMainNotify2Cep: TStringField;
    adsMainNotify2Estado: TStringField;
    adsMainNotify2PaisCod: TStringField;
    adsMainAgenteNome: TStringField;
    adsMainAgenteCdInttra: TStringField;
    adsMainAgenteCidade: TStringField;
    adsMainAgenteCep: TStringField;
    adsMainAgenteEstado: TStringField;
    adsMainAgentePaisCod: TStringField;
    adsMainBookingArmador: TStringField;
    adsMainReferenciaEmbarque: TStringField;
    adsMainNmNavio: TStringField;
    adsMainNrViagem: TStringField;
    adsMainLocalEmbarque: TStringField;
    adsMainLocalDesembarque: TStringField;
    adsMainLocalDesembarquePaisCod: TStringField;
    adsMainMarcacaoVolumes: TStringField;
    adsMainCdRuc: TStringField;
    adsMainCdUsuarioCriacaoApUsuario: TStringField;
    adsMainCdCollectPrepaid: TAureliusEntityField;
    adsMainCdTipoPgmtoTaxas: TAureliusEntityField;
    adsMainCdTipoMovimento: TAureliusEntityField;
    adsMaincalc_Processo: TStringField;
    adsMaincalc_Usuario: TStringField;
    adsMainDsEmailIndaia: TStringField;
    GroupBox15: TGroupBox;
    DBEdit47: TDBEdit;
    Label48: TLabel;
    adsMainNrAmend: TIntegerField;
    Label43: TLabel;
    DBEdit44: TDBEdit;
    Label44: TLabel;
    DBEdit45: TDBEdit;
    Label45: TLabel;
    DBEdit46: TDBEdit;
    Label46: TLabel;
    DBEdit48: TDBEdit;
    Label47: TLabel;
    DBEdit49: TDBEdit;
    Label49: TLabel;
    DBEdit50: TDBEdit;
    DBEdit51: TDBEdit;
    Label50: TLabel;
    DBEdit52: TDBEdit;
    Label51: TLabel;
    cxGridDBTableViewDetailNrCntr: TcxGridDBColumn;
    cxGridDBTableViewDetailNrLacre: TcxGridDBColumn;
    cxGridDBTableViewDetailNrLacreSif: TcxGridDBColumn;
    cxGridDBTableViewDetailNmTpCntr: TcxGridDBColumn;
    cxGridDBTableViewDetailDsTemperatura: TcxGridDBColumn;
    cxGridDBTableViewDetailTaraCntr: TcxGridDBColumn;
    cxGridDBTableViewDetailVlCubagem: TcxGridDBColumn;
    frameDraftBLMercadoria: TframeDraftBLMercadoria;
    adsDetailSelf: TAureliusEntityField;
    adsDetailNrProcesso: TStringField;
    adsDetailNrAmend: TIntegerField;
    adsDetailNrCntr: TStringField;
    adsDetailNrLacre: TStringField;
    adsDetailNrLacreSif: TStringField;
    adsDetailNmTpCntr: TStringField;
    adsDetailCdIso: TStringField;
    adsDetailDsTemperatura: TStringField;
    adsDetailTaraCntr: TFloatField;
    adsDetailVlCubagem: TFloatField;
    dbchAbroad: TDBCheckBox;
    DBEdit53: TDBEdit;
    adsMainInPgmtoAbroad: TStringField;
    adsMainNmLocalPgmtoTaxas: TStringField;
    btnEnviarInttra: TButton;
    btnImprimir: TButton;
    btnenviarEmail: TButton;
    adsMainConsigPaisCod: TStringField;
    adsMainNotify1Endereco: TStringField;
    adsMainNotify2Endereco: TStringField;
    adsMainAgenteEndereco: TStringField;
    GroupBox1: TGroupBox;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label15: TLabel;
    Label16: TLabel;
    dbedtNome: TDBEdit;
    DBEdit3: TDBEdit;
    DBEdit4: TDBEdit;
    DBEdit5: TDBEdit;
    DBEdit6: TDBEdit;
    DBEdit8: TDBEdit;
    DBEdit9: TDBEdit;
    GroupBox16: TGroupBox;
    DBEdit54: TDBEdit;
    adsMainLocalEntrega: TStringField;
    adsMainLocalEmbarqueSigla: TStringField;
    adsMainLocalDesembarqueSigla: TStringField;
    Label52: TLabel;
    DBEdit55: TDBEdit;
    Label53: TLabel;
    Label56: TLabel;
    Label57: TLabel;
    DBEdit56: TDBEdit;
    XMLDocument1: TXMLDocument;
    Label58: TLabel;
    txtCargoDescription: TDBMemo;
    adsDetailDsCarga: TMemoField;
    Button1: TButton;
    Button2: TButton;
    adsDetailCdNcm: TStringField;
    adsDetailCdEmbalagem: TStringField;
    adsDetailDsEmbalagem: TStringField;
    adsDetailQtEmbalagem: TIntegerField;
    adsDetailQtPesoBruto: TFloatField;
    Label59: TLabel;
    Label60: TLabel;
    Label61: TLabel;
    Label62: TLabel;
    DBEdit57: TDBEdit;
    DBEdit58: TDBEdit;
    DBEdit59: TDBEdit;
    DBEdit60: TDBEdit;
    Label63: TLabel;
    Label64: TLabel;
    DBEdit61: TDBEdit;
    DBEdit62: TDBEdit;
    adsMainCdTipoPgmtoTaxasCdTaxaInttra: TIntegerField;
    adsMainCdTipoPgmtoTaxasDescricao: TStringField;
    adsMovimentoInttraSelf: TAureliusEntityField;
    adsMovimentoInttraCdMovimentoInttra: TIntegerField;
    adsMovimentoInttraDescricao: TStringField;
    adsMainCdCollectPrepaidCodigo: TStringField;
    adsMainCdCollectPrepaidDescricao: TStringField;
    adsMainCdTipoMovimentoCdMovimentoInttra: TIntegerField;
    adsMainCdTipoMovimentoDescricao: TStringField;
    qryContainersAgrupados: TFDQuery;
    qryContainersAgrupadosNR_PROCESSO: TStringField;
    qryContainersAgrupadosQTDE_CNTR: TIntegerField;
    qryContainersAgrupadosNM_TP_CNTR: TStringField;
    qryContainersAgrupadosCD_ISO: TStringField;
    qryContainersAgrupadosNM_EMBALAGEM: TStringField;
    qryContainersAgrupadosQTDE_EMBALAGEM: TFloatField;
    qryContainersAgrupadosVL_PESO_BRUTO: TFloatField;
    qryContainersAgrupadosVL_PESO_LIQUIDO: TFloatField;
    qryNcmItem: TFDQuery;
    qryDescricaoItem: TFDQuery;
    qryNcmItemCD_NCM: TStringField;
    qryDescricaoItemTX_DESCRICAO_INGLES: TMemoField;
    qryDescricaoItemTX_DESCRICAO_ESPANHOL: TMemoField;
    edtExcessoCntr: TDBEdit;
    lblExcessoCntr: TLabel;
    adsDetailVlExcessoCntr: TFloatField;
    qryContainersAgrupadosTP_CNTR: TStringField;
    TabSheet5: TTabSheet;
    GroupBox3: TGroupBox;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Label12: TLabel;
    DBEdit7: TDBEdit;
    DBEdit15: TDBEdit;
    DBEdit16: TDBEdit;
    DBEdit18: TDBEdit;
    DBEdit20: TDBEdit;
    GroupBox2: TGroupBox;
    Label20: TLabel;
    Label21: TLabel;
    Label22: TLabel;
    Label23: TLabel;
    Label25: TLabel;
    DBEdit13: TDBEdit;
    DBEdit14: TDBEdit;
    DBEdit17: TDBEdit;
    DBEdit21: TDBEdit;
    DBEdit23: TDBEdit;
    DBEdit37: TDBEdit;
    Label36: TLabel;
    DBEdit63: TDBEdit;
    Label65: TLabel;
    DBEdit64: TDBEdit;
    Label66: TLabel;
    DBEdit65: TDBEdit;
    Label67: TLabel;
    DBEdit66: TDBEdit;
    Label68: TLabel;
    Label69: TLabel;
    Label70: TLabel;
    DBEdit67: TDBEdit;
    DBEdit68: TDBEdit;
    Label71: TLabel;
    DBEdit69: TDBEdit;
    DBEdit70: TDBEdit;
    Label72: TLabel;
    DBEdit71: TDBEdit;
    Label73: TLabel;
    DBEdit72: TDBEdit;
    Label74: TLabel;
    DBEdit73: TDBEdit;
    Label75: TLabel;
    Label76: TLabel;
    Label77: TLabel;
    DBEdit74: TDBEdit;
    DBEdit75: TDBEdit;
    DBEdit76: TDBEdit;
    Label78: TLabel;
    DBEdit77: TDBEdit;
    Label79: TLabel;
    DBEdit78: TDBEdit;
    Label80: TLabel;
    Label81: TLabel;
    Label82: TLabel;
    DBEdit79: TDBEdit;
    DBEdit80: TDBEdit;
    Label83: TLabel;
    DBEdit81: TDBEdit;
    DBEdit82: TDBEdit;
    Label84: TLabel;
    adsMainConsigEndNumero: TStringField;
    adsMainConsigEndCompl: TStringField;
    adsMainConsigNrTelefone: TStringField;
    adsMainConsigNrFax: TStringField;
    adsMainConsigNrRuc: TStringField;
    adsMainConsigNrNit: TStringField;
    adsMainConsigNrCuit: TStringField;
    adsMainNotify1EndNumero: TStringField;
    adsMainNotify1EndCompl: TStringField;
    adsMainNotify1NrTelefone: TStringField;
    adsMainNotify1NrFax: TStringField;
    adsMainNotify1NrRuc: TStringField;
    adsMainNotify1NrNit: TStringField;
    adsMainNotify1NrCuit: TStringField;
    adsMainNotify2EndNumero: TStringField;
    adsMainNotify2EndCompl: TStringField;
    adsMainNotify2NrTelefone: TStringField;
    adsMainNotify2NrFax: TStringField;
    adsMainNotify2NrRuc: TStringField;
    adsMainNotify2NrNit: TStringField;
    adsMainNotify2NrCuit: TStringField;
    GroupBox18: TGroupBox;
    Label90: TLabel;
    Label91: TLabel;
    DBEdit88: TDBEdit;
    DBEdit89: TDBEdit;
    DBEdit90: TDBEdit;
    Label92: TLabel;
    adsMainLocalLiberacaoBlCod: TStringField;
    adsMainLocalLiberacaoBlNome: TStringField;
    adsMainLocalLiberacaoBlPais: TStringField;
    Label11: TLabel;
    edtPaisDesembarqueDescricao: TEdit;
    Label55: TLabel;
    DBEdit40: TDBEdit;
    Label24: TLabel;
    Label54: TLabel;
    Label85: TLabel;
    edtPaisEntregaDescricao: TEdit;
    DBEdit19: TDBEdit;
    Label86: TLabel;
    Label87: TLabel;
    adsMainLocalEntregaSigla: TStringField;
    adsMainLocalEntregaPaisCod: TStringField;
    GroupBox4: TGroupBox;
    Label26: TLabel;
    Label27: TLabel;
    Label28: TLabel;
    Label29: TLabel;
    Label31: TLabel;
    Label30: TLabel;
    Label88: TLabel;
    DBEdit24: TDBEdit;
    DBEdit25: TDBEdit;
    DBEdit26: TDBEdit;
    DBEdit27: TDBEdit;
    DBEdit29: TDBEdit;
    DBEdit22: TDBEdit;
    DBEdit28: TDBEdit;
    Button3: TButton;
    qryDraftRetorno: TFDQuery;
    adsMainStatusEnvio: TStringField;
    cxGridDBTableViewStatusEnvio: TcxGridDBColumn;
    qryReferenciaCliente: TFDQuery;
    procedure btnIncluirClick(Sender: TObject);
    procedure btnAlterarClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure btnSalvarClick(Sender: TObject);
    procedure framePesquisaProcbtnPesquisarClick(Sender: TObject);
    procedure framePesquisaProcadsProcessoAfterOpen(DataSet: TDataSet);
    procedure adsMainAfterScroll(DataSet: TDataSet);
    procedure adsMainAfterInsert(DataSet: TDataSet);
    procedure adsMainCalcFields(DataSet: TDataSet);
    procedure frameDetailComentariosbtnIncluirClick(Sender: TObject);
    procedure frameDetailComentariosbtnAlterarClick(Sender: TObject);
    procedure frameDetailComentariosbtnCancelarClick(Sender: TObject);
    procedure frameDetailComentariosbtnSalvarClick(Sender: TObject);
    procedure btnDetailExcluirClick(Sender: TObject);
    procedure btnExcluirClick(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure frameDetailComentariosbtnExcluirClick(Sender: TObject);
    procedure frameDraftBLMercadoriabtnIncluirClick(Sender: TObject);
    procedure frameDraftBLMercadoriabtnAlterarClick(Sender: TObject);
    procedure frameDraftBLMercadoriabtnExcluirClick(Sender: TObject);
    procedure adsDetailAfterInsert(DataSet: TDataSet);
    procedure frameDraftBLMercadoriabtnCancelarClick(Sender: TObject);
    procedure frameDraftBLMercadoriabtnSalvarClick(Sender: TObject);
    procedure btnDetailIncluirClick(Sender: TObject);
    procedure btnDetailAlterarClick(Sender: TObject);
    procedure btnDetailCancelarClick(Sender: TObject);
    procedure btnDetailSalvarClick(Sender: TObject);
    procedure adsMainBeforeClose(DataSet: TDataSet);
    procedure DBEdit50KeyPress(Sender: TObject; var Key: Char);
    procedure DBEdit49KeyPress(Sender: TObject; var Key: Char);
    procedure DBEdit48KeyPress(Sender: TObject; var Key: Char);
    procedure framePesquisaProcadsProcessoAfterClose(DataSet: TDataSet);
    procedure btnImprimirClick(Sender: TObject);
    procedure btnenviarEmailClick(Sender: TObject);
    procedure btnEnviarInttraClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure Button3Click(Sender: TObject);
  private
    { Private declarations }
    MaxAmendProcesso : integer;
      OpcoesDraft: TOpcoesCtxDraft;
    ItensExcluirContainer : TList<TTprocessoDraftCntr>;
    SFTP: TSFTPClient;

    ArquivosInttra: string;
    ArquivosInttraEnvio: string;
    ArquivosInttraEnvioGerados: string;
    ArquivosInttraEnvioEnviados: string;
    ArquivosInttraEnvioErro: string;

    ArquivosInttraRetorno: string;
    ArquivosInttraRetornoCopiados: string;
    ArquivosInttraRetornoLidosRenomeados: string;
    ArquivosInttraRetornoContrlx: string;

    dmGerarArquivosDraft : TdtmGerarArquivosDraft;

    procedure AtualizarDetail;
    procedure AbrirTabelasAux(reabrir : boolean = false);
    procedure AbrirDetailContainer(nrAmend : integer; nrProcesso : string);

    procedure CarregarDadosProcesso(nrProcesso: String; idioma : integer);
    procedure CarregarDadosProcesso_Containers(nrProcesso, CargoDescription: String);
    procedure CarregarDadosProcesso_Mercadorias(nrProcesso, grupo: String; idioma : integer);
    procedure CarregarDadosProcesso_MercadoriasContainer(nrProcesso: String);

    procedure CarregarDadosAmend(nrProcesso: String; nrAmend : integer);
    procedure CarregarDadosAmend_Containers(nrProcesso: String; nrAmend : integer);
    procedure CarregarDadosAmend_Mercadorias(nrProcesso: String; nrAmend : integer);
    procedure CarregarDadosAmend_MercadoriasContainer(nrProcesso: String; nrAmend : integer);
    procedure CarregarDadosAmend_Comentarios(nrProcesso: String; nrAmend : integer);

    procedure CarregarDrafts(nrProcesso : string);

    function BuscarMarcacaoProcessoExp(nrProcesso : string) : String;
    function BuscarRefProcesso(nrProcesso, tpReferencia : string) : String;
    function BuscarMercadoria(cdMercadoria, cdGrupo : string) : TTmercadoriaExp;

    function BuscarMaxAmendProcesso : integer;

    procedure GravarMainNoBancodeDados;
    procedure RemoverDetails(draft : TTprocessoDraftBl);

    procedure ExcluirDoBancoDeDados_DetailContainer;
    procedure GravarNoBancoDeDados_DetailContainer;
    procedure ExcluirTodosOsContainers(nrProcesso : string; nrAmend : integer);

    procedure ConfigPageControl;
    procedure ConfigFramePesquisar;
    function BuscarDescricaoPais(Sigla2l: string): String;
    procedure GerarXml;
    function ConectarSFTP: Boolean;
    procedure EnviarArquivo;
    procedure CriarPastas;
    function MoverArquivo(Origem, Destino: String): Boolean;
    function PreencherCargoDescription(Processo: ttprocesso): String;
    function AddChildList(aTexto, aNomeNode: String; aNodeAtual: IXMLNode;
     aLimiteCaracteres, aLimiteLinhas: Integer; aNomeAtributo: String = ''; aTextoAtributo: String = ''; QuebraComEnter: Boolean = false): IXMLNode;
    procedure ControleExcessoContainer;
    procedure AbreTelaModoConsulta;
    procedure BuscarInttra;
    function LerArquivoRetorno(Caminho, NomeArquivo: String; var NumeroProcesso: String): Boolean;
  public
    { Public declarations }
  protected
    procedure DoCreate; override;
    procedure DoShow; override;
    procedure DoActivate;override;


  end;

var
  frmCdDraftBL: TfrmCdDraftBL;

implementation

{$R *.dfm}

uses FrMain, ConnectionModule, Aurelius.Criteria.Linq, Aurelius.Criteria.Base, uGerarArquivosDraft, FrXMLTeste;

procedure TfrmCdDraftBL.DoCreate;
begin
  inherited;
  VisilbleDetail := false;
  if not Assigned(FObjectManager) then
  begin
    FObjectManager := TObjectManager.Create(FireDacMSSQL.DBConnection);
    FOwnsManager   := True;
  end;

  framePesquisaProc.IniciarFrame(FObjectManager);
  framePesquisaProc.Height := 178;

  frameDraftBLMercadoria.IniciarFrame(FObjectManager);
  frameDraftBLComentarios.IniciarFrame(FObjectManager);

  ConfigDetails(MOSTRAR_DETAILS,0);
  frameDraftBLMercadoria.ConfigDetails(ESCONDER_DETAILS, 0);
  frameDraftBLComentarios.ConfigDetails(ESCONDER_DETAILS, 0);

  AbrirTabelasAux;
  ItensExcluirContainer := Tlist<TTprocessoDraftCntr>.create;

  pnlMaster.Height := 480;

end;

procedure TfrmCdDraftBL.DoShow;
begin
  inherited;
  adsMain.Manager   := nil;
  adsDetail.Manager := nil;
  if sProcesso <> '' then
  begin
    framePesquisaProc.edtUnidadeNeg.Text := copy(sProcesso,1,2);
    framePesquisaProc.edtProduto.Text    := copy(sProcesso,3,2);
    framePesquisaProc.edtProcesso.text   := copy(sProcesso,5,12);
    framePesquisaProc.btnPesquisar.Click;
  end;
end;

procedure TfrmCdDraftBL.DoActivate;
begin
  inherited;
  framePesquisaProc.edtProcesso.SetFocus;
end;

procedure TfrmCdDraftBL.DBEdit48KeyPress(Sender: TObject; var Key: Char);
begin
  inherited;
  EscapePontos(key);
  EscapeVirgulaRepetida((Sender as TDBEdit).Text, key);
end;

procedure TfrmCdDraftBL.DBEdit49KeyPress(Sender: TObject; var Key: Char);
begin
  inherited;
  EscapePontos(key);
  EscapeVirgulaRepetida((Sender as TDBEdit).Text, key);
end;

procedure TfrmCdDraftBL.DBEdit50KeyPress(Sender: TObject; var Key: Char);
begin
  inherited;
  EscapePontos(key);
  EscapeVirgulaRepetida((Sender as TDBEdit).Text, key);
end;

procedure TfrmCdDraftBL.ConfigFramePesquisar;
begin
  if PageControl.ActivePage = tshGrid then
    framePesquisaProc.Visible := true
  else
    framePesquisaProc.Visible := false;
end;

procedure TfrmCdDraftBL.ConfigPageControl;
begin
  if PageControl.ActivePage = tshEdit then
  begin
    pgCamposMaster.ActivePageIndex := 0;
    pgDetails.ActivePageIndex := 0;
    ControleExcessoContainer;
  end;
end;

procedure TfrmCdDraftBL.framePesquisaProcbtnPesquisarClick(Sender: TObject);
begin
  inherited;
  framePesquisaProc.btnPesquisarClick(Sender);
end;

procedure TfrmCdDraftBL.frameDetailComentariosbtnAlterarClick(Sender: TObject);
begin
 if frameDraftBLComentarios.adsDetailx.RecordCount = 0 then
  exit;

  ConfigTelaEdicaoDetail;
  ConfigDetails(ESCONDER_DETAILS,2);

  frameDraftBLComentarios.btnAlterarClick(Sender);
end;

procedure TfrmCdDraftBL.frameDetailComentariosbtnExcluirClick(Sender: TObject);
begin
  ConfirmarExclusao('Excluir o comentário?');
  frameDraftBLComentarios.btnExcluirClick(Sender);
end;

procedure TfrmCdDraftBL.frameDetailComentariosbtnIncluirClick(Sender: TObject);
begin
  ConfigTelaEdicaoDetail;
  ConfigDetails(ESCONDER_DETAILS,2);
  frameDraftBLComentarios.btnIncluirClick(Sender);
end;

procedure TfrmCdDraftBL.frameDetailComentariosbtnSalvarClick(Sender: TObject);
begin
  ValidarDataSet(frameDraftBLComentarios.adsDetailx);
  frameDraftBLComentarios.btnSalvarClick(Sender);
  ConfigTelaEdicaoDetail;
  ConfigDetails(MOSTRAR_DETAILS,2);
end;

procedure TfrmCdDraftBL.frameDetailComentariosbtnCancelarClick(Sender: TObject);
begin
  frameDraftBLComentarios.btnCancelarClick(Sender);
  ConfigTelaEdicaoDetail;
  ConfigDetails(MOSTRAR_DETAILS,2);
end;

procedure TfrmCdDraftBL.frameDraftBLMercadoriabtnAlterarClick(Sender: TObject);
begin
 if frameDraftBLMercadoria.adsDetailx.RecordCount = 0 then
  exit;

  ConfigTelaEdicaoDetail;
  ConfigDetails(ESCONDER_DETAILS,1);

  frameDraftBLMercadoria.btnAlterarClick(Sender);
end;

procedure TfrmCdDraftBL.frameDraftBLMercadoriabtnExcluirClick(Sender: TObject);
begin
  ConfirmarExclusao('Excluir a mercadoria?');
  frameDraftBLMercadoria.btnExcluirClick(Sender);
end;

procedure TfrmCdDraftBL.frameDraftBLMercadoriabtnIncluirClick(Sender: TObject);
begin
  ConfigTelaEdicaoDetail;
  ConfigDetails(ESCONDER_DETAILS,1);
  frameDraftBLMercadoria.btnIncluirClick(Sender);
end;

procedure TfrmCdDraftBL.frameDraftBLMercadoriabtnSalvarClick(Sender: TObject);
begin
  ValidarDataSet(frameDraftBLMercadoria.adsDetailx);
  frameDraftBLMercadoria.btnSalvarClick(Sender);
  ConfigTelaEdicaoDetail;
  ConfigDetails(MOSTRAR_DETAILS,1);
end;

procedure TfrmCdDraftBL.frameDraftBLMercadoriabtnCancelarClick(Sender: TObject);
begin
  frameDraftBLMercadoria.btnCancelarClick(Sender);
  ConfigTelaEdicaoDetail;
  ConfigDetails(MOSTRAR_DETAILS,1);
end;

procedure TfrmCdDraftBL.btnDetailAlterarClick(Sender: TObject);
begin
  inherited;
  ConfigDetails(ESCONDER_DETAILS,0);
end;

procedure TfrmCdDraftBL.btnDetailExcluirClick(Sender: TObject);
begin
  ConfirmarExclusao('Excluir a Container?');
 // inherited;
  ItensExcluirContainer.Add(adsDetailSelf.AsEntity<TTprocessoDraftCntr>);
  adsDetail.Delete;
end;

procedure TfrmCdDraftBL.btnDetailIncluirClick(Sender: TObject);
begin
  inherited;
  ConfigDetails(ESCONDER_DETAILS,0);
end;

procedure TfrmCdDraftBL.btnDetailSalvarClick(Sender: TObject);
begin
  inherited;
  ConfigDetails(MOSTRAR_DETAILS,0);
end;

procedure TfrmCdDraftBL.btnImprimirClick(Sender: TObject);
begin
  inherited;
  framePesquisaProc.ValidaProcessoSelecionado;
//  TfrmGerarArquivosDraft.Execute(adsMainNrProcessoNrProcesso.AsString, adsMainNrAmend.asInteger, TELA);

    formRelatorioDraft := TformRelatorioDraft.Create(nil);
    try
      formRelatorioDraft.processo := adsMainNrProcessoNrProcesso.AsString;
      formRelatorioDraft.amend := adsMainNrAmend.asInteger;
      formRelatorioDraft.RLReport1.PreviewModal;
    finally
      formRelatorioDraft.Free;
    end;
end;

procedure TfrmCdDraftBL.btnenviarEmailClick(Sender: TObject);
begin
  inherited;
  framePesquisaProc.ValidaProcessoSelecionado;
  TfrmGerarArquivosDraft.Execute(adsMainNrProcessoNrProcesso.AsString, adsMainNrAmend.asInteger, EMAIL);
end;

procedure TfrmCdDraftBL.btnDetailCancelarClick(Sender: TObject);
begin
  inherited;
  ConfigDetails(MOSTRAR_DETAILS,0);
end;

procedure TfrmCdDraftBL.framePesquisaProcadsProcessoAfterClose(
  DataSet: TDataSet);
begin
  inherited;
  adsMain.Close;
end;

procedure TfrmCdDraftBL.framePesquisaProcadsProcessoAfterOpen(
  DataSet: TDataSet);
begin
  inherited;
  if not framePesquisaProc.adsProcesso.IsEmpty then
    CarregarDrafts(framePesquisaProc.adsProcesso.FieldByName('nrProcesso').asString)
end;

procedure TfrmCdDraftBL.adsDetailAfterInsert(DataSet: TDataSet);
begin
  inherited;
  adsDetailNrProcesso.AsString  := framePesquisaProc.adsProcessoNrProcesso.asstring;
  adsDetailNrAmend.AsInteger    := adsMainNrAmend.AsInteger ;
end;

procedure TfrmCdDraftBL.adsMainAfterInsert(DataSet: TDataSet);
begin
  inherited;
  adsMainNrProcesso.AsObject := framePesquisaProc.adsProcessoSelf.AsObject;
  adsUsuario.Locate('ApUsuario',sUsuario, []);
  adsMainCdUsuarioCriacao.AsObject := adsUsuarioSelf.AsObject;
  adsMainNrAmend.Value             := MaxAmendProcesso +1;
  adsMainDtCriacao.AsDateTime      := now;
end;

procedure TfrmCdDraftBL.adsMainAfterScroll(DataSet: TDataSet);
begin
  inherited;
  AtualizarDetail;

  edtPaisDesembarqueDescricao.Text := BuscarDescricaoPais(adsMainLocalDesembarquePaisCod.AsString);
  edtPaisEntregaDescricao.Text := BuscarDescricaoPais(adsMainLocalEntregaPaisCod.Value);

  if adsMainCdEnvioInttra.AsString <> '' then
  begin
    btnAlterar.Caption := 'Consultar';
    btnExcluir.Enabled := false;
  end
  else
  begin
    btnAlterar.Caption := 'Alterar';
    btnExcluir.Enabled := true;
  end;

end;

procedure TfrmCdDraftBL.adsMainBeforeClose(DataSet: TDataSet);
begin
  adsDetail.Close;
  frameDraftBLComentarios.adsDetailx.Close;
  frameDraftBLMercadoria.adsDetailx.Close;
  inherited;
end;

procedure TfrmCdDraftBL.adsMainCalcFields(DataSet: TDataSet);
begin
  inherited;
  if adsMain.State in [dsInsert] then
  begin
    adsMaincalc_Processo.AsString := framePesquisaProc.adsProcessoNrProcesso.asstring;
    adsMaincalc_Usuario.AsString  := sUsuario;
  end
  else
  begin
    adsMaincalc_Processo.AsString := adsMainNrProcessoNrProcesso.AsString;
    adsMaincalc_Usuario.AsString  := adsMainCdUsuarioCriacaoApUsuario.AsString;
  end;
end;

procedure TfrmCdDraftBL.CarregarDrafts(nrProcesso : string);
  var
  Criteria: TCriteria;
begin
  try
    adsMain.DisableControls;
    adsMain.AfterScroll := nil;

    adsMain.close;
    Criteria := FObjectManager.Find<TTprocessoDraftBl>.Refreshing;
    Criteria.Add(Linq.Eq('nrProcesso',nrProcesso));
    adsMain.SetSourceCriteria(Criteria);
    adsMain.Open;
  finally
    adsMain.EnableControls;
    adsMain.AfterScroll := adsMainAfterScroll;
    adsMain.First;
  end;
end;

procedure TfrmCdDraftBL.AtualizarDetail;
var nrAmend : integer;
begin
  if adsMain.RecordCount = 0 then
    nrAmend := 1
  else
    nrAmend := adsMainNrAmend.AsInteger;

  AbrirDetailContainer(NrAmend, framePesquisaProc.adsProcessoNrProcesso.asstring);
  frameDraftBLComentarios.AbrirDetail(NrAmend, framePesquisaProc.adsProcessoNrProcesso.asstring);
  frameDraftBLMercadoria.AbrirDetail(NrAmend, framePesquisaProc.adsProcessoNrProcesso.asstring);
  frameDraftBLMercadoria.frameDraftBLMercContainer.AbrirDetail(NrAmend, framePesquisaProc.adsProcessoNrProcesso.asstring)
end;

procedure TfrmCdDraftBL.AbrirDetailContainer(nrAmend : integer; nrProcesso : string);
begin
  try
    adsDetail.DisableControls;
    adsDetail.close;
    adsDetail.SetSourceCriteria(FObjectManager.Find<TTProcessoDraftCntr>
                .Add(Linq.Eq('FNrAmend', NrAmend))
                .Add(Linq.Eq('FNrProcesso', framePesquisaProc.adsProcessoNrProcesso.asstring))
                .Refreshing
                );
    adsDetail.Open;
  finally
    adsDetail.EnableControls;
  end;
end;

procedure TfrmCdDraftBL.AbrirTabelasAux(reabrir : boolean = false);
begin
  if (adsComentariosIntra.state in [dsInactive]) and not reabrir then
  begin
    adsComentariosIntra.DisableControls;
    adsComentariosIntra.close;
    adsComentariosIntra.SetSourceCriteria(FObjectManager.Find<TTtpComentariosInttra>);
    adsComentariosIntra.Open;
    adsComentariosIntra.EnableControls;
  end;
  if (adsTipoFrete.state in [dsInactive]) and not reabrir then
  begin
    adsTipoFrete.DisableControls;
    adsTipoFrete.close;
    adsTipoFrete.SetSourceCriteria(FObjectManager.Find<TTtpFrete>);
    adsTipoFrete.Open;
    adsTipoFrete.EnableControls;
  end;
  if (adsTipoTaxaInttra.state in [dsInactive]) and not reabrir then
  begin
    adsTipoTaxaInttra.DisableControls;
    adsTipoTaxaInttra.close;
    adsTipoTaxaInttra.SetSourceCriteria(FObjectManager.Find<TTtpTaxasInttra>);
    adsTipoTaxaInttra.Open;
    adsTipoTaxaInttra.EnableControls;
  end;
  if (adsMovimentoInttra.state in [dsInactive]) and not reabrir then
  begin
    adsMovimentoInttra.DisableControls;
    adsMovimentoInttra.close;
    adsMovimentoInttra.SetSourceCriteria(FObjectManager.Find<TTtpMovimentoInttra>);
    adsMovimentoInttra.Open;
    adsMovimentoInttra.EnableControls;
  end;
  if (adsUsuario.state in [dsInactive]) and not reabrir then
  begin
    adsUsuario.DisableControls;
    adsUsuario.close;
    adsUsuario.SetSourceCriteria(FObjectManager.Find<TTusuario>
                                .Add(Linq.Eq('FApUsuario', sUsuario)));
    adsUsuario.Open;
    adsUsuario.EnableControls;
  end;
end;

function TfrmCdDraftBL.BuscarMaxAmendProcesso : integer;
 var book : TBookmark;
  maxAmend : Integer;
begin
  try
    maxAmend := 0;
    adsMain.DisableControls;
    book := adsMain.GetBookmark;

    adsMain.First;
    while not adsMain.eof do
    begin
      if adsMainNrAmend.AsInteger > maxAmend then
        maxAmend := adsMainNrAmend.AsInteger;

      adsMain.next;
    end;

    if adsMain.BookmarkValid(book) then
      adsMain.GotoBookmark(book);
    adsMain.FreeBookmark(book);
  finally
    adsMain.EnableControls;
    result := maxAmend;
  end;
end;

function TfrmCdDraftBL.BuscarMercadoria(cdMercadoria, cdGrupo: string) : TTmercadoriaExp;
var  mercadoria : TTmercadoriaExp;
begin
  mercadoria := FObjectManager.Find<TTmercadoriaExp>
                               .Add(Linq.Eq('FCdMercadoria', cdMercadoria))
                               .Add(Linq.Eq('FCdGrupo', cdGrupo))
                               .Refreshing
                               .UniqueResult;
  result := mercadoria;
end;

function TfrmCdDraftBL.BuscarMarcacaoProcessoExp(nrProcesso : string) : String;
var  ProcessoExp : TTprocessoExp;
begin
  result := '';
  ProcessoExp := FObjectManager.Find<TTprocessoExp>
                               .CreateAlias('FProcesso', 'P')
                               .Add(Linq.Eq('p.FNrProcesso', nrProcesso))
                               .Refreshing
                               .UniqueResult;
  if ProcessoExp <> nil then
    result := ProcessoExp.TxMarcacaoVolume.AsUnicodeString;
end;

function TfrmCdDraftBL.BuscarRefProcesso(nrProcesso, tpReferencia : string) : String;
var  referencias : TList<TTrefCliente>;
begin
  result := '';
  referencias := FObjectManager.Find<TTrefCliente>
                               .Add(Linq.Eq('FNrProcesso', nrProcesso))
                               .Add(Linq.Eq('FTpReferencia', tpReferencia))
                               .Refreshing
                               .List;
  if referencias.count > 0 then
    result := referencias[0].CdReferencia;
end;

procedure TfrmCdDraftBL.Button1Click(Sender: TObject);
begin
  inherited;

  GerarXML;
  TformXMLTeste.Execute(ArquivosInttraEnvioGerados, adsMainNrProcessoNrProcesso.AsString + '.xml');
end;

procedure TfrmCdDraftBL.Button2Click(Sender: TObject);
begin
  inherited;
  if not FileExists(ArquivosInttraEnvioGerados +'\'+ adsMainNrProcessoNrProcesso.AsString + '.xml') then
    Reject('Não existe arquivo enviado para este processo.');

  TformXMLTeste.Execute(ArquivosInttraEnvioGerados, adsMainNrProcessoNrProcesso.AsString + '.xml');

end;

procedure TfrmCdDraftBL.Button3Click(Sender: TObject);
begin
  inherited;
  BuscarInttra;
end;

function TfrmCdDraftBL.BuscarDescricaoPais(Sigla2l : string) : String;
var  PaisBroker : TTPaisBroker;
begin
  result := '';
  PaisBroker := FObjectManager.Find<TTPaisBroker>
                               .Add(Linq.Eq('FNmSigla2l', Sigla2l))
                               .Refreshing
                               .UniqueResult;
  if PaisBroker <> nil then
    result := PaisBroker.NmPais.ValueOrDefault;
end;

procedure TfrmCdDraftBL.CarregarDadosProcesso(nrProcesso: String; idioma : integer);
var processo : TTprocesso;
  CargoDescription: String;
begin
  processo := FObjectManager.Find<ttprocesso>
                            .Add(Linq.Eq('FNrProcesso', nrProcesso))
                            .Refreshing
                            .UniqueResult;


  if processo <> nil then
  begin
    if not (adsMain.State in [dsedit]) then
      adsMain.edit;

    if processo.Cliente <> nil then
    begin
      if processo.Cliente.NmEmpresa.HasValue then
        adsMainClienteNome.value             := processo.Cliente.NmEmpresa;
      if processo.Cliente.EndEmpresa.HasValue then
        adsMainClienteEndereco.value         := processo.Cliente.EndEmpresa;
      if processo.Cliente.EndCidade.HasValue then
        adsMainClienteCidade.value           := processo.Cliente.EndCidade;
      if processo.Cliente.EndUf.HasValue then
        adsMainClienteEstado.value           := processo.Cliente.EndUf;
      if processo.Cliente.CgcEmpresa.HasValue then
      begin
        if Length(processo.Cliente.CgcEmpresa) = 11  then
        begin
          adsMainClienteCnpj.value :=  Copy(processo.Cliente.CgcEmpresa, 1,3)+'.'+
                                       Copy(processo.Cliente.CgcEmpresa, 4,3)+'.'+
                                       Copy(processo.Cliente.CgcEmpresa, 7,3)+'-'+
                                       Copy(processo.Cliente.CgcEmpresa, 10,2);
        end
        else
        begin
          adsMainClienteCnpj.value :=   Copy(processo.Cliente.CgcEmpresa,1,2) + '.' +
                                        Copy(processo.Cliente.CgcEmpresa,3,3) + '.' +
                                        Copy(processo.Cliente.CgcEmpresa,6,3) + '/' +
                                        Copy(processo.Cliente.CgcEmpresa,9,4) + '-' +
                                        Copy(processo.Cliente.CgcEmpresa,13,2)
        end;
      end;
      if processo.Cliente.EndCep.HasValue then
        adsMainClienteCep.value              := processo.Cliente.EndCep;
      adsMainClientePaisCod.value            := 'BR';

      if processo.Cliente.Grupo <> nil then
        if processo.Cliente.Grupo.NmEmailDraftBl.HasValue then
          adsMainDsEmailIndaia.Value         := processo.Cliente.Grupo.NmEmailDraftBl;
    end;

    if processo.Consignee <> nil then
    begin
      if processo.Consignee.NmEmpresa.HasValue then
        adsMainConsigNome.value              := processo.Consignee.NmEmpresa;
      if processo.Consignee.EndEmpresa.HasValue then
        adsMainConsigEndereco.value          := processo.Consignee.EndEmpresa;
      if processo.Consignee.EndCidade.HasValue then
        adsMainConsigCidade.value            := processo.Consignee.EndCidade;
      if processo.Consignee.EndEstado.HasValue then
        adsMainConsigEstado.value            := processo.Consignee.EndEstado;

      if processo.Consignee.Pais <> nil then
        if processo.Consignee.Pais.NmSiglaCrt.HasValue then
          adsMainConsigPaisCod.value     := processo.Consignee.Pais.NmSiglaCrt;

      adsMainConsigCep.value               := '';

      adsMainConsigEndNumero.AsString       := processo.Consignee.EndNumero.ValueOrDefault;
      adsMainConsigEndCompl.AsString        := processo.Consignee.EndCompl.ValueOrDefault;
      adsMainConsigNrTelefone.AsString      := processo.Consignee.NrTelefone.ValueOrDefault;
      adsMainConsigNrFax.AsString           := processo.Consignee.NrFax.ValueOrDefault;
      adsMainConsigNrRuc.AsString           := processo.Consignee.NrRuc.ValueOrDefault;
      adsMainConsigNrNit.AsString           := processo.Consignee.NrNit.ValueOrDefault;
      adsMainConsigNrCuit.AsString          := processo.Consignee.NrCuit.ValueOrDefault;
    end;

    if processo.Notify1Proc <> nil then
    begin
      if processo.Notify1Proc.NmEmpresa.HasValue then
        adsMainNotify1Nome.value             := processo.Notify1Proc.NmEmpresa;
      if processo.Notify1Proc.EndEmpresa.HasValue then
        adsMainNotify1Endereco.value         := processo.Notify1Proc.EndEmpresa;
      if processo.Notify1Proc.EndCidade.HasValue then
        adsMainNotify1Cidade.value           := processo.Notify1Proc.EndCidade;
      if processo.Notify1Proc.EndEstado.HasValue then
        adsMainNotify1Estado.value           := processo.Notify1Proc.EndEstado;
      if processo.Notify1Proc.Pais <> nil then
        if processo.Notify1Proc.Pais.NmSiglaCrt.HasValue then
          adsMainNotify1PaisCod.value        := processo.Notify1Proc.Pais.NmSiglaCrt;

      adsMainNotify1Cep.value                := '';

      adsMainNotify1EndNumero.AsString       := processo.Notify1Proc.EndNumero.ValueOrDefault;
      adsMainNotify1EndCompl.AsString        := processo.Notify1Proc.EndCompl.ValueOrDefault;
      adsMainNotify1NrTelefone.AsString      := processo.Notify1Proc.NrTelefone.ValueOrDefault;
      adsMainNotify1NrFax.AsString           := processo.Notify1Proc.NrFax.ValueOrDefault;
      adsMainNotify1NrRuc.AsString           := processo.Notify1Proc.NrRuc.ValueOrDefault;
      adsMainNotify1NrNit.AsString           := processo.Notify1Proc.NrNit.ValueOrDefault;
      adsMainNotify1NrCuit.AsString          := processo.Notify1Proc.NrCuit.ValueOrDefault;
    end;

    if processo.Notify2Proc <> nil then
    begin
      if processo.Notify2Proc.NmEmpresa.HasValue then
        adsMainNotify2Nome.value             := processo.Notify2Proc.NmEmpresa;
      if processo.Notify2Proc.EndEmpresa.HasValue then
        adsMainNotify2Endereco.value         := processo.Notify2Proc.EndEmpresa;
      if processo.Notify2Proc.EndCidade.HasValue then
        adsMainNotify2Cidade.value           := processo.Notify2Proc.EndCidade;
      if processo.Notify2Proc.EndEstado.HasValue then
        adsMainNotify2Estado.value           := processo.Notify2Proc.EndEstado;
      if processo.Notify2Proc.Pais <> nil then
        if processo.Notify2Proc.Pais.NmSiglaCrt.HasValue then
          adsMainNotify2PaisCod.value        := processo.Notify2Proc.Pais.NmSiglaCrt;

      adsMainNotify2Cep.value                := '';

      adsMainNotify2EndNumero.AsString       := processo.Notify2Proc.EndNumero.ValueOrDefault;
      adsMainNotify2EndCompl.AsString        := processo.Notify2Proc.EndCompl.ValueOrDefault;
      adsMainNotify2NrTelefone.AsString      := processo.Notify2Proc.NrTelefone.ValueOrDefault;
      adsMainNotify2NrFax.AsString           := processo.Notify2Proc.NrFax.ValueOrDefault;
      adsMainNotify2NrRuc.AsString           := processo.Notify2Proc.NrRuc.ValueOrDefault;
      adsMainNotify2NrNit.AsString           := processo.Notify2Proc.NrNit.ValueOrDefault;
      adsMainNotify2NrCuit.AsString          := processo.Notify2Proc.NrCuit.ValueOrDefault;
    end;

    if processo.Agente <> nil then
    begin
      adsMainAgenteNome.value                := processo.Agente.NmAgente;
      if processo.Agente.DsScacCode.HasValue then
        adsMainAgenteCdInttra.value          := processo.Agente.DsScacCode;
      if processo.Agente.DsEndereco.HasValue then
        adsMainAgenteEndereco.value          := processo.Agente.DsEndereco;
      if processo.Agente.CdCidade <> nil then
        adsMainAgenteCidade.value            := processo.Agente.CdCidade.Descricao;
      if processo.Agente.NrZipCode.HasValue then
        adsMainAgenteCep.value               := processo.Agente.NrZipCode;
      if processo.Agente.EndUf.HasValue then
        adsMainAgenteEstado.value            := processo.Agente.EndUf;
      if processo.Agente.Pais <> nil then
        if processo.Agente.Pais.NmSiglaCrt.HasValue then
          adsMainAgentePaisCod.value         := processo.Agente.Pais.NmSiglaCrt;
    end;
    if processo.Embarcacao <> nil then
      adsMainNmNavio.value                   := processo.Embarcacao.NmEmbarcacao;

    if Assigned(processo.Viagem) then
      adsMainNrViagem.value                  := processo.Viagem.NrViagemArmador.ValueOrDefault;

    if processo.LocalEmbarque <> nil then
    begin
      adsMainLocalEmbarque.value             := processo.LocalEmbarque.Descricao;
      adsMainLocalEmbarqueSigla.value        := processo.LocalEmbarque.CdSigla.ValueOrDefault;
    end;

    if processo.LocalDesembarque <> nil then
    begin
      adsMainLocalDesembarque.value          := processo.LocalDesembarque.Descricao;
      adsMainLocalDesembarqueSigla.Value     := processo.LocalDesembarque.CdSigla.ValueOrDefault;
    end;

    if processo.LocalEntrega <> nil then
    begin
      adsMainLocalEntrega.value          := processo.LocalEntrega.Descricao;
      adsMainLocalEntregaSigla.value     := processo.LocalEntrega.CdSigla;
      adsMainLocalEntregaPaisCod.Value   := processo.LocalEntrega.CdPais.NmSigla2l.ValueOrDefault;
    end;

    if processo.CdRuc.HasValue then
      adsMainCdRuc.value                     := processo.CdRuc;

    adsMainLocalDesembarquePaisCod.value     := processo.LocalDesembarque.cdPais.NmSigla2l;
    edtPaisDesembarqueDescricao.Text         := BuscarDescricaoPais(adsMainLocalDesembarquePaisCod.AsString);
    edtPaisEntregaDescricao.Text             := BuscarDescricaoPais(adsMainLocalEntregaPaisCod.Value);

    adsMainMarcacaoVolumes.value             := BuscarMarcacaoProcessoExp(framePesquisaProc.adsProcessoNrProcesso.AsString);

    adsMainBookingArmador.value              := BuscarRefProcesso(framePesquisaProc.adsProcessoNrProcesso.AsString, '05');
    adsMainReferenciaEmbarque.value          := BuscarRefProcesso(framePesquisaProc.adsProcessoNrProcesso.AsString , '08');

    adsMainCdCollectPrepaid.AsObject         := processo.TpFrete;

    adsMovimentoInttra.Locate('DESCRICAO', 'PortToPort', [loCaseInsensitive]);
    adsMainCdTipoMovimento.AsObject          := adsMovimentoInttraSelf.AsObject;

    adsTipoTaxaInttra.First;
    adsMainCdTipoPgmtoTaxas.AsObject         := adsTipoTaxaInttraSelf.AsObject;

    adsMainInPgmtoAbroad.value               := '0';



    CargoDescription := PreencherCargoDescription(Processo);

    CarregarDadosProcesso_Containers(nrProcesso, CargoDescription);
//    CarregarDadosProcesso_Mercadorias(nrProcesso, processo.CdGrupo , idioma);
//    CarregarDadosProcesso_MercadoriasContainer(nrProcesso);

//    PreencherCargoDescription(processo);
  end;
end;

function TfrmCdDraftBL.PreencherCargoDescription(Processo: ttprocesso): String;
var
  ListaCargoDescription: TStringList;
  vTextTemp: String;
  vPesoBruto, vPesoLiquido: Double;
  incoterm: string;
  vlExcessoCntr: Double;
begin

  ListaCargoDescription := TStringList.create;

  qryContainersAgrupados.Close;
  qryContainersAgrupados.ParamByName('NR_PROCESSO').AsString := Processo.NrProcesso;
  qryContainersAgrupados.Open;

  vPesoLiquido := 0;
  vPesoBruto := 0;
  vlExcessoCntr := 0;
  vTextTemp := '';
  qryContainersAgrupados.First;
  While not qryContainersAgrupados.Eof do
  begin
    if not vTextTemp.IsEmpty then
    vTextTemp := vTextTemp + '; ';
    vTextTemp := vTextTemp +
                 IntToStr(qryContainersAgrupadosQTDE_CNTR.AsInteger) +  IIf(OpcoesDraft.Idioma = iESPANHOL, ' contenedor ', ' containers ') +
                 qryContainersAgrupadosNM_TP_CNTR.AsString + IIf(OpcoesDraft.Idioma = iESPANHOL, ' conteniendo ', ' containing ') +
                 FloatToStr(qryContainersAgrupadosQTDE_EMBALAGEM.AsFloat) + ' ' +
                 qryContainersAgrupadosNM_EMBALAGEM.AsString;

    vPesoLiquido := vPesoLiquido + qryContainersAgrupadosVL_PESO_LIQUIDO.AsFloat;
    vPesoBruto := vPesoBruto + qryContainersAgrupadosVL_PESO_BRUTO.AsFloat;

    if (qryContainersAgrupadosTP_CNTR.AsString = '09') or {20'OPEN TOP}
       (qryContainersAgrupadosTP_CNTR.AsString = '10') or {40'OPEN TOP}
       (qryContainersAgrupadosTP_CNTR.AsString = '16') then {20'OPEN TOP}
    vlExcessoCntr := vlExcessoCntr + adsDetailVlExcessoCntr.AsFloat;

    qryContainersAgrupados.Next;
  end;
  vTextTemp := vTextTemp + IIf(OpcoesDraft.Idioma = iESPANHOL, ' Con: ', ' With: ');
  ListaCargoDescription.Add(vTextTemp);

  {DESCRICAO}
  qryNcmItem.Close;
  qryNcmItem.SQL.Text := '';
  qryNcmItem.SQL.Text := 'SELECT DISTINCT CD_NCM FROM TPROCESSO_EXP_NF_ITEM WHERE NR_PROCESSO = :NR_PROCESSO ORDER BY CD_NCM';
  qryNcmItem.ParamByName('NR_PROCESSO').AsString := processo.NrProcesso;
  qryNcmItem.Open;

  {Pegar de preferência os itens da Due(TPROCESSO_EXP_NF_ITEM), se não tiver, pegar os itens do processo de exportação(TPROCESSO_EXP_ITEM)}

  if qryNcmItem.RecordCount > 0 then
  begin
    qryDescricaoItem.Close;
    qryDescricaoItem.SQL.Text := '';
    qryDescricaoItem.SQL.Text := 'SELECT DISTINCT '+
                                 'DM.TX_DESCRICAO_INGLES AS TX_DESCRICAO_INGLES, ' +
                                 'DM.TX_DESCRICAO_ESPANHOL AS  TX_DESCRICAO_ESPANHOL '+
                                 'FROM TPROCESSO_EXP_NF_ITEM I ' +
                                 'LEFT JOIN TMERCADORIA_EXP ME ON ME.CD_MERCADORIA = I.CD_MERCADORIA ' +
                                 'LEFT JOIN TDESCRICAO_MERCADORIA_DRAFT DM ON DM.CODIGO = ME.CD_DESC_MERCADORIA_DRAFT ' +
                                 'WHERE NR_PROCESSO = :NR_PROCESSO ';
    qryDescricaoItem.ParamByName('NR_PROCESSO').AsString := processo.NrProcesso;
    qryDescricaoItem.Open;
  end
  else
  begin
    qryNcmItem.Close;
    qryNcmItem.SQL.Text := '';
    qryNcmItem.SQL.Text := 'SELECT DISTINCT CD_NCM FROM TPROCESSO_EXP_ITEM WHERE NR_PROCESSO = :NR_PROCESSO ORDER BY CD_NCM';
    qryNcmItem.ParamByName('NR_PROCESSO').AsString := processo.NrProcesso;
    qryNcmItem.Open;

    qryDescricaoItem.Close;
    qryDescricaoItem.SQL.Text := '';
    qryDescricaoItem.SQL.Text := 'SELECT DISTINCT '+
                                 'DM.TX_DESCRICAO_INGLES AS TX_DESCRICAO_INGLES, ' +
                                 'DM.TX_DESCRICAO_ESPANHOL AS  TX_DESCRICAO_ESPANHOL '+
                                 'FROM TPROCESSO_EXP_ITEM I '+
                                 'LEFT JOIN TMERCADORIA_EXP ME ON ME.CD_MERCADORIA = I.CD_MERCADORIA '+
                                 'LEFT JOIN TDESCRICAO_MERCADORIA_DRAFT DM ON DM.CODIGO = ME.CD_DESC_MERCADORIA_DRAFT '+
                                 'WHERE NR_PROCESSO = :NR_PROCESSO ';
    qryDescricaoItem.ParamByName('NR_PROCESSO').AsString := processo.NrProcesso;
    qryDescricaoItem.Open;

  end;

  qryDescricaoItem.First;
  While not qryDescricaoItem.Eof do
  begin
    if OpcoesDraft.Idioma = iESPANHOL then
      ListaCargoDescription.Add(qryDescricaoItem.FieldByName('TX_DESCRICAO_ESPANHOL').AsString)
    else
      ListaCargoDescription.Add(qryDescricaoItem.FieldByName('TX_DESCRICAO_INGLES').AsString);

    qryDescricaoItem.Next;
  end;


  ListaCargoDescription.Add('');
  ListaCargoDescription.Add('NCMs:');
  While not qryNcmItem.Eof do
  begin
    ListaCargoDescription.Add(qryNcmItem.FieldByName('CD_NCM').AsString);
    qryNcmItem.Next;
  end;

  ListaCargoDescription.Add('');
  ListaCargoDescription.Add(processo.NrProcesso);
  ListaCargoDescription.Add('');

  qryReferenciaCliente.Close;
  qryReferenciaCliente.ParamByName('NR_PROCESSO').AsString := processo.NrProcesso;
  qryReferenciaCliente.open;
  qryReferenciaCliente.First;
  While not qryReferenciaCliente.Eof do
  begin
    ListaCargoDescription.Add(qryReferenciaCliente.FieldByName('CD_REFERENCIA').AsString);
    qryReferenciaCliente.Next;
  end;


  ListaCargoDescription.Add('');
  ListaCargoDescription.Add('DUE ' + Processo.CdDue.ValueOrDefault);
  ListaCargoDescription.Add('RUC: ' + Processo.CdRuc.ValueOrDefault);

  ListaCargoDescription.Add(IIf(OpcoesDraft.Idioma = iESPANHOL, 'PESO NETO: ', 'NET WEIGHT: ') +
                            FormatFloat('0.000', vPesoLiquido) + ' KG');

  ListaCargoDescription.Add(IIf(OpcoesDraft.Idioma = iESPANHOL, 'PESO BRUTO: ', 'GROSS WEIGHT: ') +
                            FormatFloat('0.000', vPesoBruto) + ' KG');

  incoterm := Processo.Incoterm.Codigo;

  ListaCargoDescription.Add('');
//  if (incoterm = 'EXW') or (incoterm = 'FCA') or (incoterm = 'FOB') or (incoterm = 'FAS') then
  if Processo.TpFrete.Descricao = 'Collect' then
  begin
    ListaCargoDescription.Add(IIf(OpcoesDraft.Idioma = iESPANHOL, 'Flete Collect', 'Freight Collect'));
  end
  else
//  if (incoterm = 'CFR') or (incoterm = 'CPT') or (incoterm = 'CIF') or (incoterm = 'CIP') or
//     (incoterm = 'DAP') or (incoterm = 'DAT') or (incoterm = 'DDP') then
  if Processo.TpFrete.Descricao = 'Prepaid' then
  begin
    ListaCargoDescription.Add(IIf(OpcoesDraft.Idioma = iESPANHOL, 'Flete pagado', 'Freight Prepaid'));
  end;

  ListaCargoDescription.Add('');
  if vlExcessoCntr > 0 then
    ListaCargoDescription.Add(IIf(OpcoesDraft.Idioma = iESPANHOL, 'Contenedor con exceso de ', 'Container With Excess of ') +
                              FloatToStr(vlExcessoCntr) + ' cm');


  Result := ListaCargoDescription.Text;
  ListaCargoDescription.Free;
end;

procedure TfrmCdDraftBL.ControleExcessoContainer;
begin
  if (adsDetailNmTpCntr.AsString = '20'+Chr(39)+'OPEN TOP') or
     (adsDetailNmTpCntr.AsString = '40'+Chr(39)+'OPEN TOP') or
     (adsDetailNmTpCntr.AsString = '20´OTC') then
  begin
    lblExcessoCntr.Visible := true;
    edtExcessoCntr.Visible := true;
  end;
 end;

procedure TfrmCdDraftBL.CarregarDadosProcesso_Containers(nrProcesso, CargoDescription: String);
var
 containers  : Tlist<ttprocessocntr>;
 container   : ttprocessocntr;
begin
  containers := FObjectManager.Find<ttprocessocntr>
                            .Add(Linq.Eq('FNrProcesso', nrProcesso))
                            .Refreshing
                            .List;

  if Assigned(container) then
  begin
    for container in containers do
    begin
      adsDetail.Append;

      adsDetailNrCntr.Value           := container.NrCntr;
      if container.NrLacre.hasvalue then
        adsDetailNrLacre.Value        := container.NrLacre;
      if container.NrLacreSif.hasvalue then
        adsDetailNrLacreSif.Value     := container.NrLacreSif;

      if Assigned(container.TpCntr) then
      begin
        adsDetailNmTpCntr.Value       := container.TpCntr.NmTpCntr;
        if container.TpCntr.CdIso.HasValue then
          adsDetailCdIso.Value     := container.TpCntr.CdIso;
      end;

      if container.DsTemperatura.HasValue then
        adsDetailDsTemperatura.Value   := StringReplace(container.DsTemperatura, ',', '.', [rfReplaceAll]);

      if container.TaraCntr.hasvalue then
        adsDetailTaraCntr.Value       := container.TaraCntr;
      if container.VlCubagem.hasvalue then
        adsDetailVlCubagem.Value      := container.VlCubagem;

      adsDetailCdNcm.Value            := container.CdNcm.ValueOrDefault;
      if Assigned(container.Embalagem) then
      begin
        adsDetailCdEmbalagem.Value      := container.Embalagem.CdEdifact.ValueOrDefault;
        adsDetailDsEmbalagem.Value      := container.Embalagem.NmEmbalagem.ValueOrDefault;
      end;
      adsDetailQtEmbalagem.Value      := trunc(container.VlQuantidadeEmbalagem.ValueOrDefault);
      adsDetailQtPesoBruto.Value      := container.VlPesoBruto.ValueOrDefault;

      if containers.IndexOf(container) = 0 then
        adsDetailDsCarga.Value          := CargoDescription;

      adsDetail.Post;
    end;
  end
  else
  begin
    adsDetail.Append;
    adsDetailDsCarga.Value          := CargoDescription;
    adsDetail.Post;
  end;
end;

procedure TfrmCdDraftBL.CarregarDadosProcesso_Mercadorias(nrProcesso, grupo: String; idioma : integer);
var mercadorias : TList<TTprocessoExpItem>;
 item: TTprocessoExpItem;
 dadosMercadoria : TTmercadoriaExp;
 qtMerc : double;
begin
  mercadorias := FObjectManager.Find<TTprocessoExpItem>
                            .Add(Linq.Eq('FNrProcesso', nrProcesso))
                            .Refreshing
                            .List;

  for item in mercadorias do
  begin
    frameDraftBLMercadoria.adsDetailx.Append;

    frameDraftBLMercadoria.adsDetailxNrItem.Value           := strtoint(item.NrItem);

    if item.CdMercadoria.HasValue then
    begin
      dadosMercadoria := BuscarMercadoria(item.CdMercadoria, grupo);
      if dadosMercadoria <> nil then
      begin
        frameDraftBLMercadoria.adsDetailxCdMercadoria.Value   := dadosMercadoria.CdMercadoria;
        frameDraftBLMercadoria.adsDetailxDsMercadoria.Value   := dadosMercadoria.ApMercadoria;
        if idioma = iINGLES then
        begin
          if dadosMercadoria.TxDescIngles.AsUnicodeString <> '' then
            frameDraftBLMercadoria.adsDetailxDsMercadoria.Value := dadosMercadoria.TxDescIngles.AsUnicodeString
        end
        else
        if idioma = iESPANHOL then
        begin
          if dadosMercadoria.TxDescEsp.AsUnicodeString <> '' then
            frameDraftBLMercadoria.adsDetailxDsMercadoria.Value := dadosMercadoria.TxDescEsp.AsUnicodeString
        end
        else
        if idioma = iPORTUGUES then
        begin
          if dadosMercadoria.NmMercadoria.HasValue then
            frameDraftBLMercadoria.adsDetailxDsMercadoria.Value := dadosMercadoria.NmMercadoria
        end;
      end;
    end;
    if item.CdNcm.HasValue then
      frameDraftBLMercadoria.adsDetailxCdNcm.Value          := item.CdNcm;
    if item.Embalagem <> nil then
    begin
      frameDraftBLMercadoria.adsDetailxCdEmbalagem.Value    := item.Embalagem.CdEmbalagem;
      if item.Embalagem.NmEmbalagemS.HasValue then
        frameDraftBLMercadoria.adsDetailxDsEmbalagem.Value  := item.Embalagem.NmEmbalagemS;
    end;
    if item.QtEmbalagem.HasValue then
    begin
      qtMerc := item.QtMercadoria;
      frameDraftBLMercadoria.adsDetailxQtEmbalagem.Value    := round(qtMerc); //deveria ser int
    end;
    if item.VlTotPesoBruto.HasValue then
      frameDraftBLMercadoria.adsDetailxQtPesoBruto.Value    := item.VlTotPesoBruto;
    if item.VlCubagem.HasValue then
      frameDraftBLMercadoria.adsDetailxVlCubagem.Value      := item.VlCubagem;

    frameDraftBLMercadoria.adsDetailx.Post;
  end;
end;

procedure TfrmCdDraftBL.CarregarDadosProcesso_MercadoriasContainer(nrProcesso: String);
var mercadorias_containers : TList<TTprocessoExpItemContainer>;
 mercadoria_container : TTprocessoExpItemContainer;
 qtMerc : Double;
begin
  mercadorias_containers := FObjectManager.Find<TTprocessoExpItemContainer>
                            .Add(Linq.Eq('FNrProcesso', nrProcesso))
                            .Refreshing
                            .List;

  for mercadoria_container in mercadorias_containers do
  begin
    frameDraftBLMercadoria.frameDraftBLMercContainer.adsDetailx.Append;

    frameDraftBLMercadoria.frameDraftBLMercContainer.adsDetailxNrItem.Value        := strtoint(mercadoria_container.NrItem);
    frameDraftBLMercadoria.frameDraftBLMercContainer.adsDetailxNrCntr.Value        := mercadoria_container.NrContr;
    if mercadoria_container.QtMercadoria.HasValue then
    begin
      qtMerc := mercadoria_container.QtMercadoria; //deveria ser int
      frameDraftBLMercadoria.frameDraftBLMercContainer.adsDetailxQtEmbalagem.Value := round(qtMerc);
    end;
    if mercadoria_container.QtPesoBruto.HasValue then
      frameDraftBLMercadoria.frameDraftBLMercContainer.adsDetailxQtPesoBruto.Value := mercadoria_container.QtPesoBruto;
    if mercadoria_container.VlCubagem.HasValue then
      frameDraftBLMercadoria.frameDraftBLMercContainer.adsDetailxVlCubagem.Value   := mercadoria_container.VlCubagem;

    frameDraftBLMercadoria.frameDraftBLMercContainer.adsDetailx.Post;
  end;
end;

procedure TfrmCdDraftBL.CarregarDadosAmend(nrProcesso: String; nrAmend : integer);
var processo : TTprocessoDraftBl;
begin
  processo := FObjectManager.Find<TTprocessoDraftBl>
                            .Add(Linq.Eq('FNrProcesso', nrProcesso))
                            .Add(Linq.Eq('FNrAmend', nrAmend))
                            .Refreshing
                            .UniqueResult;

  if processo <> nil then
  begin
    if not (adsMain.State in [dsedit]) then
      adsMain.edit;

    if processo.ClienteNome.HasValue then
      adsMainClienteNome.value             := processo.ClienteNome;
    if processo.ClienteEndereco.HasValue then
      adsMainClienteEndereco.value         := processo.ClienteEndereco;
    if processo.ClienteCidade.HasValue then
      adsMainClienteCidade.value           := processo.ClienteCidade;
    if processo.ClienteEstado.HasValue then
      adsMainClienteEstado.value           := processo.ClienteEstado;
    if processo.ClienteCnpj.HasValue then
      adsMainClienteCnpj.value             := processo.ClienteCnpj;
    if processo.ClienteEndereco.HasValue then
      adsMainClienteCep.value              := processo.ClienteEndereco;
    if processo.ClientePaisCod.HasValue then
      adsMainClientePaisCod.value          := processo.ClientePaisCod;
    if processo.DsEmailIndaia.HasValue then
      adsMainDsEmailIndaia.Value           := processo.DsEmailIndaia;
    if processo.ConsigNome.HasValue then
      adsMainConsigNome.value              := processo.ConsigNome;
    if processo.ConsigEndereco.HasValue then
      adsMainConsigEndereco.value          := processo.ConsigEndereco;
    if processo.ConsigCidade.HasValue then
      adsMainConsigCidade.value            := processo.ConsigCidade;
    if processo.ConsigEstado.HasValue then
      adsMainConsigEstado.value            := processo.ConsigEstado;
    if processo.ConsigPaisCod.HasValue then
      adsMainConsigPaisCod.value       := processo.ConsigPaisCod;
    if processo.ConsigCep.HasValue then
      adsMainConsigCep.value               := processo.ConsigCep;
    adsMainConsigEndNumero.AsString        := processo.ConsigEndNumero.ValueOrDefault;
    adsMainConsigEndCompl.AsString         := processo.ConsigEndCompl.ValueOrDefault;
    adsMainConsigNrTelefone.AsString       := processo.ConsigNrTelefone.ValueOrDefault;
    adsMainConsigNrFax.AsString            := processo.ConsigNrFax.ValueOrDefault;
    adsMainConsigNrRuc.AsString            := processo.ConsigNrRuc.ValueOrDefault;
    adsMainConsigNrNit.AsString            := processo.ConsigNrNit.ValueOrDefault;
    adsMainConsigNrCuit.AsString           := processo.ConsigNrCuit.ValueOrDefault;

    if processo.Notify1Nome.HasValue then
      adsMainNotify1Nome.value             := processo.Notify1Nome;
    if processo.Notify1Endereco.HasValue then
      adsMainNotify1Endereco.value         := processo.Notify1Endereco;
    if processo.Notify1Cidade.HasValue then
      adsMainNotify1Cidade.value           := processo.Notify1Cidade;
    if processo.Notify1Estado.HasValue then
      adsMainNotify1Estado.value           := processo.Notify1Estado;
    if processo.Notify1PaisCod.HasValue then
        adsMainNotify1PaisCod.value        := processo.Notify1PaisCod;
    if processo.Notify1Cep.HasValue then
      adsMainNotify1Cep.value              := processo.Notify1Cep;
    adsMainNotify1EndNumero.AsString       := processo.Notify1EndNumero.ValueOrDefault;
    adsMainNotify1EndCompl.AsString        := processo.Notify1EndCompl.ValueOrDefault;
    adsMainNotify1NrTelefone.AsString      := processo.Notify1NrTelefone.ValueOrDefault;
    adsMainNotify1NrFax.AsString           := processo.Notify1NrFax.ValueOrDefault;
    adsMainNotify1NrRuc.AsString           := processo.Notify1NrRuc.ValueOrDefault;
    adsMainNotify1NrNit.AsString           := processo.Notify1NrNit.ValueOrDefault;
    adsMainNotify1NrCuit.AsString          := processo.Notify1NrCuit.ValueOrDefault;

    if processo.Notify2Nome.HasValue then
      adsMainNotify2Nome.value             := processo.Notify2Nome;
    if processo.Notify2Endereco.HasValue then
      adsMainNotify2Endereco.value         := processo.Notify2Endereco;
    if processo.Notify2Cidade.HasValue then
      adsMainNotify2Cidade.value           := processo.Notify2Cidade;
    if processo.Notify2Estado.HasValue then
      adsMainNotify2Estado.value           := processo.Notify2Estado;
    if processo.Notify2PaisCod.HasValue then
       adsMainNotify2PaisCod.value         := processo.Notify2PaisCod;
    if processo.Notify2Cep.HasValue then
      adsMainNotify2Cep.value              := processo.Notify2Cep;
    adsMainNotify2EndNumero.AsString       := processo.Notify2EndNumero.ValueOrDefault;
    adsMainNotify2EndCompl.AsString        := processo.Notify2EndCompl.ValueOrDefault;
    adsMainNotify2NrTelefone.AsString      := processo.Notify2NrTelefone.ValueOrDefault;
    adsMainNotify2NrFax.AsString           := processo.Notify2NrFax.ValueOrDefault;
    adsMainNotify2NrRuc.AsString           := processo.Notify2NrRuc.ValueOrDefault;
    adsMainNotify2NrNit.AsString           := processo.Notify2NrNit.ValueOrDefault;
    adsMainNotify2NrCuit.AsString          := processo.Notify2NrCuit.ValueOrDefault;

    if processo.AgenteNome.HasValue then
      adsMainAgenteNome.value              := processo.AgenteNome;
    if processo.AgenteCdInttra.HasValue then
      adsMainAgenteCdInttra.value          := processo.AgenteCdInttra;
    if processo.AgenteEndereco.HasValue then
      adsMainAgenteEndereco.value          := processo.AgenteEndereco;
    if processo.AgenteCidade.HasValue then
      adsMainAgenteCidade.value            := processo.AgenteCidade;
    if processo.AgenteCep.HasValue then
      adsMainAgenteCep.value               := processo.AgenteCep;
    if processo.AgenteEstado.HasValue then
      adsMainAgenteEstado.value            := processo.AgenteEstado;
    if processo.AgentePaisCod.HasValue then
        adsMainAgentePaisCod.value         := processo.AgentePaisCod;
    if processo.NmNavio.HasValue then
      adsMainNmNavio.value                 := processo.NmNavio;
    if processo.NrViagem.HasValue then
      adsMainNrViagem.value                := processo.NrViagem;
    if processo.LocalEmbarque.HasValue then
      adsMainLocalEmbarque.value           := processo.LocalEmbarque;
    if processo.LocalEmbarqueSigla.HasValue then
      adsMainLocalEmbarqueSigla.Value      := processo.LocalEmbarqueSigla;
    if processo.LocalDesembarque.HasValue then
      adsMainLocalDesembarque.value        := processo.LocalDesembarque;
    if processo.LocalDesembarqueSigla.HasValue then
      adsMainLocalDesembarqueSigla.Value   := processo.LocalDesembarqueSigla;
    edtPaisDesembarqueDescricao.Text   := BuscarDescricaoPais(adsMainLocalDesembarquePaisCod.AsString);

    adsMainLocalEntrega.value          := processo.LocalEntrega.ValueOrDefault;
    adsMainLocalEntregaSigla.value     := processo.LocalEntregaSigla.ValueOrDefault;
    adsMainLocalEntregaPaisCod.Value   := processo.LocalEntregaPaisCod.ValueOrDefault;
    edtPaisEntregaDescricao.Text       := BuscarDescricaoPais(adsMainLocalEntregaPaisCod.Value);

    if processo.CdRuc.HasValue then
      adsMainCdRuc.value                   := processo.CdRuc;
    if processo.LocalDesembarquePaisCod.HasValue then
      adsMainLocalDesembarquePaisCod.value := processo.LocalDesembarquePaisCod;
    if processo.MarcacaoVolumes.HasValue then
      adsMainMarcacaoVolumes.value         := processo.MarcacaoVolumes;
    if processo.BookingArmador.HasValue then
      adsMainBookingArmador.value          :=  processo.BookingArmador;
    if processo.ReferenciaEmbarque.HasValue then
      adsMainReferenciaEmbarque.value      :=  processo.ReferenciaEmbarque;

    if processo.CdCollectPrepaid <> nil then
      adsMainCdCollectPrepaid.AsObject := processo.CdCollectPrepaid;

    if processo.CdTipoMovimento <> nil then
      adsMainCdTipoMovimento.AsObject  := processo.CdTipoMovimento;

    if processo.CdTipoPgmtoTaxas <> nil then
      adsMainCdTipoPgmtoTaxas.AsObject := processo.CdTipoPgmtoTaxas;

    if processo.InPgmtoAbroad.hasValue then
      adsMainInPgmtoAbroad.value      :=  processo.InPgmtoAbroad
    else
      adsMainInPgmtoAbroad.value      := '0';

    if processo.NmLocalPgmtoTaxas.hasValue then
     adsMainNmLocalPgmtoTaxas.value      :=  processo.NmLocalPgmtoTaxas;

    CarregarDadosAmend_Containers(nrProcesso, nrAmend);
    CarregarDadosAmend_Mercadorias(nrProcesso, nrAmend);
    CarregarDadosAmend_MercadoriasContainer(nrProcesso, nrAmend);
    CarregarDadosAmend_Comentarios(nrProcesso, nrAmend);
  end;
end;

procedure TfrmCdDraftBL.CarregarDadosAmend_Containers(nrProcesso: String; nrAmend : integer);
var containers : TList<TTprocessoDraftCntr>;
 container : TTprocessoDraftCntr;
begin
  containers := FObjectManager.Find<TTprocessoDraftCntr>
                            .Add(Linq.Eq('FNrProcesso', nrProcesso))
                            .Add(Linq.Eq('FNrAmend', nrAmend))
                            .Refreshing
                            .List;

  for container in containers do
  begin
    adsDetail.Append;

    adsDetailNrCntr.Value         := container.NrCntr;
    if container.NrLacre.hasvalue then
      adsDetailNrLacre.Value        := container.NrLacre;
    if container.NrLacreSif.hasvalue then
      adsDetailNrLacreSif.Value     := container.NrLacreSif;
    if container.NmTpCntr.hasvalue then
      adsDetailNmTpCntr.Value       := container.NmTpCntr;
    if container.CdIso.hasvalue then
      adsDetailCdIso.Value          := container.CdIso;
    if container.DsTemperatura.hasvalue then
      adsDetailDsTemperatura.Value  := container.DsTemperatura;
    if container.TaraCntr.hasvalue then
      adsDetailTaraCntr.Value       := container.TaraCntr;
    if container.VlCubagem.hasvalue then
      adsDetailVlCubagem.Value      := container.VlCubagem;

    adsDetailCdNcm.Value            := container.CdNcm.ValueOrDefault;
    adsDetailCdEmbalagem.Value      := container.CdEmbalagem.ValueOrDefault;
    adsDetailDsEmbalagem.Value      := container.DsEmbalagem.ValueOrDefault;
    adsDetailQtEmbalagem.Value      := trunc(container.QtEmbalagem.ValueOrDefault);
    adsDetailQtPesoBruto.Value      := container.QtPesoBruto.ValueOrDefault;

    adsDetailDsCarga.Value          := container.DsCarga;

    adsDetail.Post;
  end;
end;

procedure TfrmCdDraftBL.CarregarDadosAmend_Mercadorias(nrProcesso: String; nrAmend : integer);
var mercadorias : TList<TTprocessoDraftMerc>;
 mercadoria : TTprocessoDraftMerc;
begin
  mercadorias := FObjectManager.Find<TTprocessoDraftMerc>
                            .Add(Linq.Eq('FNrProcesso', nrProcesso))
                            .Add(Linq.Eq('FNrAmend', nrAmend))
                            .Refreshing
                            .List;

  for mercadoria in mercadorias do
  begin
    frameDraftBLMercadoria.adsDetailx.Append;

    frameDraftBLMercadoria.adsDetailxNrItem.Value         := mercadoria.NrItem;
    frameDraftBLMercadoria.adsDetailxCdMercadoria.Value   := mercadoria.CdMercadoria;
    if mercadoria.DsMercadoria.HasValue then
      frameDraftBLMercadoria.adsDetailxDsMercadoria.Value := mercadoria.DsMercadoria;
    if mercadoria.CdNcm.HasValue then
      frameDraftBLMercadoria.adsDetailxCdNcm.Value        := mercadoria.CdNcm;
    if mercadoria.CdEmbalagem.HasValue then
      frameDraftBLMercadoria.adsDetailxCdEmbalagem.Value  := mercadoria.CdEmbalagem;
    if mercadoria.QtEmbalagem.HasValue then
      frameDraftBLMercadoria.adsDetailxQtEmbalagem.Value  := mercadoria.QtEmbalagem;
    if mercadoria.QtPesoBruto.HasValue then
      frameDraftBLMercadoria.adsDetailxQtPesoBruto.Value  := mercadoria.QtPesoBruto;
    if mercadoria.VlCubagem.HasValue then
      frameDraftBLMercadoria.adsDetailxVlCubagem.Value    := mercadoria.VlCubagem;

    frameDraftBLMercadoria.adsDetailx.Post;
  end;
end;

procedure TfrmCdDraftBL.CarregarDadosAmend_MercadoriasContainer(nrProcesso: String; nrAmend : integer);
var mercadorias_containers : TList<TTprocessoDraftMercCntr>;
 mercadoria_container : TTprocessoDraftMercCntr;
begin
  mercadorias_containers := FObjectManager.Find<TTprocessoDraftMercCntr>
                            .Add(Linq.Eq('FNrProcesso', nrProcesso))
                            .Add(Linq.Eq('FNrAmend', nrAmend))
                            .Refreshing
                            .List;

  for mercadoria_container in mercadorias_containers do
  begin
    frameDraftBLMercadoria.frameDraftBLMercContainer.adsDetailx.Append;

    frameDraftBLMercadoria.frameDraftBLMercContainer.adsDetailxNrItem.Value        := mercadoria_container.NrItem;
    frameDraftBLMercadoria.frameDraftBLMercContainer.adsDetailxNrCntr.Value        := mercadoria_container.NrCntr;
    if mercadoria_container.QtEmbalagem.HasValue then
      frameDraftBLMercadoria.frameDraftBLMercContainer.adsDetailxQtEmbalagem.Value := mercadoria_container.QtEmbalagem;
    if mercadoria_container.QtPesoBruto.HasValue then
      frameDraftBLMercadoria.frameDraftBLMercContainer.adsDetailxQtPesoBruto.Value := mercadoria_container.QtPesoBruto;
    if mercadoria_container.VlCubagem.HasValue then
      frameDraftBLMercadoria.frameDraftBLMercContainer.adsDetailxVlCubagem.Value   := mercadoria_container.VlCubagem;

    frameDraftBLMercadoria.frameDraftBLMercContainer.adsDetailx.Post;
  end;
end;

procedure TfrmCdDraftBL.CarregarDadosAmend_Comentarios(nrProcesso: String; nrAmend : integer);
var comentarios : TList<TTprocessoDraftComentarios>;
 comentario : TTprocessoDraftComentarios;
begin
  comentarios := FObjectManager.Find<TTprocessoDraftComentarios>
                            .Add(Linq.Eq('FNrProcesso', nrProcesso))
                            .Add(Linq.Eq('FNrAmend', nrAmend))
                            .Refreshing
                            .List;

  for comentario in comentarios do
  begin
    frameDraftBLComentarios.adsDetailx.Append;

    frameDraftBLComentarios.adsDetailxNrComentario.Value       := comentario.NrComentario;
    if comentario.DsComentario.HasValue then
      frameDraftBLComentarios.adsDetailxDsComentario.Value     := comentario.DsComentario;
    if comentario.TpComentario <> nil then
      frameDraftBLComentarios.adsDetailxTpComentario.AsObject  := comentario.TpComentario;

    frameDraftBLComentarios.adsDetailx.Post;
  end;
end;

procedure TfrmCdDraftBL.btnAlterarClick(Sender: TObject);
begin
  inherited;
  ConfigFramePesquisar;
  ConfigPageControl;

  if adsMainCdEnvioInttra.AsString <> ''  then
  begin
    AbreTelaModoConsulta;
    btnCancelar.Caption := 'Ok';
    btnDetailCancelar.Caption := 'Ok';
    btnDetailAlterar.Caption := 'Consultar';
    btnSalvar.Visible := False;
    btnDetailSalvar.Visible := False;
    btnDetailIncluir.Enabled := False;
    btnDetailExcluir.Enabled := False;
  end
  else
  begin
    btnCancelar.Caption := 'Cancelar';
    btnDetailCancelar.Caption := 'Cancelar';
    btnDetailAlterar.Caption := 'Alterar';
    btnSalvar.Visible := True;
    btnDetailSalvar.Visible := True;
    btnDetailIncluir.Enabled := True;
    btnDetailExcluir.Enabled := True;
  end;
end;

procedure TfrmCdDraftBL.AbreTelaModoConsulta;
var
i:integer;
begin
  for i := 0 to componentCount - 1 do
  begin
    if (Components[i] is tEdit) then
      (Components[i] as TEdit).ReadOnly:= true;

   if (Components[i] is TDBEdit) then
      (Components[i] as TDBEdit).ReadOnly:= true;

   if (Components[i] is TDBMemo) then
      (Components[i] as TDBMemo).ReadOnly:= true;
  end;
end;

procedure TfrmCdDraftBL.btnCancelarClick(Sender: TObject);
begin
  inherited;
  ConfigFramePesquisar;
  adsMainAfterScroll(nil);

end;

procedure TfrmCdDraftBL.btnSalvarClick(Sender: TObject);
begin
  inherited;
  ExcluirDoBancoDeDados_DetailContainer;
  frameDraftBLComentarios.ExcluirDoBancoDeDados;
  frameDraftBLMercadoria.frameDraftBLMercContainer.ExcluirDoBancoDeDados;
  frameDraftBLMercadoria.ExcluirDoBancoDeDados;

  GravarMainNoBancoDeDados;
  GravarNoBancoDeDados_DetailContainer;
  frameDraftBLComentarios.GravarNoBancoDeDados;
  frameDraftBLMercadoria.GravarNoBancoDeDados;
  frameDraftBLMercadoria.frameDraftBLMercContainer.GravarNoBancoDeDados;

  adsMainAfterScroll(nil);
  ConfigFramePesquisar;
end;

procedure TfrmCdDraftBL.btnIncluirClick(Sender: TObject);
begin
  MaxAmendProcesso    := BuscarMaxAmendProcesso;
  opcoesdraft.NrAmend := MaxAmendProcesso;

  opcoesdraft.CopiarDoProcesso := adsMain.IsEmpty;
  opcoesdraft.CopiarDoAmend    := not adsMain.IsEmpty;

    Case StrToIntDef(framePesquisaProc.adsProcessoCdLinguaPedido.AsString, 0) of
    0: OpcoesDraft.Idioma           := iPORTUGUES;
    1: OpcoesDraft.Idioma           := iINGLES;
    2: OpcoesDraft.Idioma           := iESPANHOL;
  End;

  if TfrmDraftBlCtx.Execute(OpcoesDraft) then
  begin
    inherited;
    ConfigFramePesquisar;
    ConfigPageControl;
    if OpcoesDraft.CopiarDoProcesso then
      CarregarDadosProcesso(framePesquisaProc.adsProcessoNrProcesso.AsString, OpcoesDraft.Idioma)
    else
    if OpcoesDraft.CopiarDoAmend then
      CarregarDadosAmend(framePesquisaProc.adsProcessoNrProcesso.AsString, OpcoesDraft.NrAmend);
  end;
end;

function TfrmCdDraftBL.ConectarSFTP: Boolean;
begin
  result := false;
  SFTP := TSFTPClient.Create(Self);
  if Config.DraftAmbiente.Equals('P') then
  begin
    SFTP.UserName := Config.DraftUsuarioFtpProducao;
    SFTP.Password := Config.DraftSenhaFtpProducao;
    SFTP.Host := Config.DraftEndFtpProducao;
  end
  else
  begin
    SFTP.UserName := Config.DraftUsuarioFtpHomologacao;//'i0003534';
    SFTP.Password := Config.DraftSenhaFtpHomologacao;//'LS0htJiu';
    SFTP.Host := Config.DraftEndFtpHomologacao;//'ftp.cvt.inttra.com';
  end;

  SFTP.Port := 22;
  SFTP.IPVersion := IPv4;
  SFTP.AuthModes := [amPassword];

  try
    SFTP.Connect;
    result := SFTP.Connected;
  except
    on E: ESSH2Exception do
      ShowMessage('Erro ao tentar conectar ao FTP: ' + E.Message);
  end;
end;

function CopyFile(AExistingFileName, ANewFileName: String; AFailIfExists: Boolean = False): Boolean;
var
  MS: TMemoryStream;
begin
  Result := (not FileExists(ANewFileName)) or (not AFailIfExists);
  if Result then
  begin
    if not DirectoryExists(ExtractFileDir(ANewFileName)) then
      ForceDirectories(ExtractFileDir(ANewFileName));

    try
      MS := TMemoryStream.Create;
      try
        MS.LoadFromFile(AExistingFileName);
        MS.SaveToFile(ANewFileName);
      finally
        FreeAndNil(MS);
      end;
      Result := FileExists(ANewFileName);
    except
      Result := False;
    end;
  end;
end;

function TfrmCdDraftBL.MoverArquivo(Origem, Destino: String): Boolean;
var
  tentativas: integer;

  Copiado: boolean;

begin

  tentativas := 0;

  result := false;

  if FileExists(Origem) then

  begin
    Copiado := CopyFile(Origem, Destino);
    while (not FileExists(Destino)) or (tentativas = 100) do
    begin
      sleep(100);
      inc(tentativas);
    end;
    if FileExists(Destino) and Copiado then
    begin
      DeleteFile(Origem);
      result := true;
    end;
  end

end;

procedure TfrmCdDraftBL.EnviarArquivo;
var
  FS: TFileStream;
  Path,FileName: String;
  Origem, Destino: String;
begin

  if ConectarSFTP then
  begin
    FileName := adsMainNrProcessoNrProcesso.AsString + '.xml';
    FS := TFileStream.Create(ArquivosInttraEnvioGerados + '\' +FileName, fmOpenRead or fmShareDenyWrite);
    try
      try
        Origem := ArquivosInttraEnvioGerados + '\' + FileName;
        Destino := ArquivosInttraEnvioEnviados + '\' + FileName;
        SFTP.Put(FS, SFTP.CurrentDirectory + '/inbound/' + FileName);
        MoverArquivo(Origem, Destino);
        adsMain.Edit;
        adsMainDtEnvioDraft.Value := Now;
        adsMainStatusEnvio.Value := 'Aguardando Retorno';
        adsMain.Post;
        GravarMainNoBancodeDados;
        ShowMessage('Arquivo '+FileName+' enviado com sucesso!');
        FireDacMSSQL.AtualizaFollowUp(adsMainNrProcessoNrProcesso.AsString, '348',  Now);
      except
        on E: ESSH2Exception do
        begin
          Destino := PChar(ArquivosInttraEnvioErro + '\' + FileName);
          MoverArquivo(Origem, Destino);
          ShowMessage(E.Message);
        end;
      end;
    finally
      FS.Free;
      SFTP.Disconnect;
    end;
  end;
end;

procedure TfrmCdDraftBL.BuscarInttra;
var
  FS: TStream;
  Path,FileName: String;
  Origem, Destino: String;
  I: Integer;
  vNrProcesso: String;
begin

  qryDraftRetorno.Close;
  qryDraftRetorno.Open('SELECT * FROM TPROCESSO_DRAFT_BL WHERE DT_ENVIO_DRAFT IS NULL AND ISNULL(CD_ENVIO_INTTRA, '''') = ''''');

  if qryDraftRetorno.RecordCount = 0 then
    exit;

  if ConectarSFTP then
  begin
    try
      SFTP.List('/outbound');
      if not (SFTP.DirectoryItems.Count > 0) then
        reject('Não tem nada.');

      for I := 0 to SFTP.DirectoryItems.Count - 1 do
      begin
        if SFTP.DirectoryItems[I].ItemType = sitFile then
        begin
          FileName := SFTP.DirectoryItems[I].FileName;
          FS := TFileStream.Create(ArquivosInttraRetornoCopiados + '\' + FileName, fmCreate);
          try
            try
              SFTP.Get(SFTP.CurrentDirectory + '/' + FileName, FS, false);
  //            ShowMessage('Arquivo '+FileName+' recebido com sucesso!');
            except
              on E: ESSH2Exception do
              begin
                if e.Message <> 'A operação foi concluída com êxito' then
                  ShowMessage(E.Message);
              end;
            end;


          finally
            FS.Free;
          end;
          Sleep(2000);
          if FileExists(ArquivosInttraRetornoCopiados + '\' + FileName) then
          begin
          //deletar arquivo do FTP.
            if FileName.Contains('INDAI_APERAK') then
            begin
              if LerArquivoRetorno(ArquivosInttraRetornoCopiados, FileName, vNrProcesso) then
              begin
                ShowMessage('Retornou processo: ' + vNrProcesso);
                if MoverArquivo(ArquivosInttraRetornoCopiados + '\' + FileName,
                             ArquivosInttraRetornoLidosRenomeados + '\' + vNrProcesso + '_' + FileName) then
                  showmessage('e o arquvio foi movido também.');

              end;
            end
            else
            begin
              if MoverArquivo(ArquivosInttraRetornoCopiados + '\' + FileName,
                           ArquivosInttraRetornoContrlx + '\' + FileName) then
            end;
          end;
        end;
      end;
      ShowMessage('Arquivos recebidos com sucesso!');
    finally
      SFTP.Disconnect;
    end;
  end;
end;

function TfrmCdDraftBL.LerArquivoRetorno(Caminho, NomeArquivo: String; var NumeroProcesso: String): Boolean;
var
  vArquivo: String;
  vXML: TXMLDocument;
  vXMLMessage: IXMLNode;
  vXMLMessageBody: IXMLNode;
  vXMLMessageProperties: IXMLNode;
  vXMLShipmentID: IXMLNode;
  vXMLReferenceInformation: IXMLNode;
  i: Integer;
  vSID, vAmend, vNrProcesso, vStatus, vRefEmbarque: string;
begin
  try
    XMLDocument1.LoadFromfile(Caminho + '\' + NomeArquivo);
    vXMLMessage := XMLDocument1.ChildNodes.FindNode('Message');
    vXMLMessageBody := vXMLMessage.ChildNodes.FindNode('MessageBody');
    vXMLMessageProperties := vXMLMessageBody.ChildNodes.FindNode('MessageProperties');
    vXMLShipmentID := vXMLMessageProperties.ChildNodes.FindNode('ShipmentID');
    vXMLReferenceInformation := vXMLMessageProperties.ChildNodes.FindNode('ReferenceInformation');

    vStatus := vXMLShipmentID.ChildNodes.FindNode('ShipmentIdentifier').GetAttributeNS('Acknowledgment', '');
    vRefEmbarque := vXMLShipmentID.ChildValues['ShipmentIdentifier'];
    vAmend := vXMLShipmentID.ChildValues['DocumentVersion'];

    for i := 0 to vXMLMessageProperties.ChildNodes.Count -1 do
    begin
      if vXMLMessageProperties.ChildNodes[i].NodeName = 'ReferenceInformation' then
        if vXMLMessageProperties.ChildNodes[i].GetAttributeNS('ReferenceType', '') = 'FreightForwarderReference' then
          vNrProcesso := vXMLMessageProperties.ChildNodes[i].NodeValue;
    end;


    qryDraftRetorno.Close;
    qryDraftRetorno.SQL.Text := 'SELECT * FROM TPROCESSO_DRAFT_BL WHERE NR_PROCESSO = :NR_PROCESSO AND NR_AMEND = :NR_AMEND';
    qryDraftRetorno.ParamByName('NR_PROCESSO').AsString := vNrProcesso;
    qryDraftRetorno.ParamByName('NR_AMEND').AsInteger := StrToInt(vAmend);
    qryDraftRetorno.Open;

    if qryDraftRetorno.RecordCount = 1 then
    begin
      vSID := copy(NomeArquivo, 29, 6);
      qryDraftRetorno.Edit;
      qryDraftRetorno.FieldByName('CD_ENVIO_INTTRA').AsString := vSID;
      qryDraftRetorno.Post;
    end;

    NumeroProcesso := vNrProcesso;

    Showmessage(
                'vStatus = ' + vStatus + #13#10 +
                'vSID = ' + vSID + #13#10 +
                'vAmend = ' + vAmend + #13#10 +
                'vNrProcesso = ' + vNrProcesso
                );
    result := True;
  Except
    on E: Exception do
    begin
      Showmessage(e.Message);
      result:= false;
    end;
  end;
end;

procedure TfrmCdDraftBL.btnEnviarInttraClick(Sender: TObject);
begin
  inherited;

  if Confirm('Tem certeza que deseja enviar este draft para teste?') then
  begin
    GerarXml;
    EnviarArquivo;
  end;
end;

procedure sBreakApart(BaseString, BreakString: string; var StringList: TStringList);
var
  EndOfCurrentString: byte;
  TempStr: string;
begin
  repeat
    EndOfCurrentString := Pos(BreakString, BaseString);
    if EndOfCurrentString = 0 then
    StringList.add(BaseString)
    else
    StringList.add(Copy(BaseString, 1, EndOfCurrentString - 1));
    BaseString := Copy(BaseString, EndOfCurrentString + length(BreakString), length(BaseString) - EndOfCurrentString);

  until EndOfCurrentString = 0;
end;

function QuebraTextoPorEspaco(TextoQuebradoPorEnters: String; Largura : Integer): TStringList;
var
  ListaPorEspaco, ListaPorLinhas: TStringList;
  i: integer;
  frase: String;
begin
  ListaPorEspaco := TStringList.Create;
  ListaPorLinhas := TStringList.Create;
  sBreakApart(TextoQuebradoPorEnters, ' ', ListaPorEspaco);

  frase := '';
  for i := 0 to ListaPorEspaco.Count-1 do
  begin
    if Length(frase) = Largura then
    begin
      ListaPorLinhas.Add(frase);
      frase := '';
    end;
    if( Length(frase + ' ' + ListaPorEspaco.Strings[i]) > Largura) then
    begin
      ListaPorLinhas.Add(frase);
      frase := '';
    end;
    if (i = 0) and (frase = '') then
        frase := ListaPorEspaco.Strings[i]
    else
    if frase = '' then
      frase := ListaPorEspaco.Strings[i]
    else
      frase := frase + ' ' + ListaPorEspaco.Strings[i];

    if i = ListaPorEspaco.Count-1 then
    begin
      if frase <> '' then
        ListaPorLinhas.Add(frase);
    end;
  end;

  result:= ListaPorLinhas;

end;

Function QuebraTextString(Texto : String; Largura : Integer; QuebraComEnter: Boolean = false):TStringList;
var
  ListaPorEnters, ListaPorLinhas, ListaQuebraTexto: TStringList;
  i, x, c: integer;
  frase1: String;
  vPos: Integer;
  vQtdeEnters, vEnter : Integer;



begin
  ListaPorLinhas := TStringList.Create;
  ListaPorEnters := TStringList.Create;
  ListaQuebraTexto := TStringList.Create;
  vQtdeEnters := 0;

  Texto := StringReplace(Texto, ' -  - ', ' - ', [rfReplaceAll]);
  if QuebraComEnter then
  begin
    sBreakApart(Texto, #13#10, ListaPorEnters);

    frase1 := '';
    for i := 0 to ListaPorEnters.Count-1 do
    begin
      if Length(ListaPorEnters.Strings[i]) <= Largura then
        if ListaPorEnters.Strings[i] = '' then
          ListaPorLinhas.Add(' ')
        else
          ListaPorLinhas.Add(ListaPorEnters.Strings[i])
      else
      begin
        ListaQuebraTexto := QuebraTextoPorEspaco(ListaPorEnters.Strings[i], Largura);
        for c := 0 to ListaQuebraTexto.Count-1 do
          ListaPorLinhas.Add(ListaQuebraTexto.Strings[c]);
      end;
    end;
  end
  else
  begin
    Texto := StringReplace(Texto, #13#10, '', [rfReplaceAll]);
    ListaPorLinhas := QuebraTextoPorEspaco(Texto, Largura);
  end;

  result:= ListaPorLinhas;

end;

function TfrmCdDraftBL.AddChildList(aTexto, aNomeNode: String; aNodeAtual: IXMLNode;
                                   aLimiteCaracteres, aLimiteLinhas: Integer; aNomeAtributo: String = ''; aTextoAtributo: String = ''; QuebraComEnter: Boolean = false): IXMLNode;
var
 vListaNodes: IXMLNode;
 vTextoList: TStringList;
 i: Integer;
begin

  vTextoList := TStringList.Create;
  try
    vTextoList := QuebraTextString(aTexto, aLimiteCaracteres, QuebraComEnter);

    for i := 0 to vTextoList.Count-1 do
    begin
      if i = (aLimiteLinhas) then
      begin
        Information('É permitido apenas ' + IntToStr(aLimiteLinhas) + ' linhas para a tag: ' + aNomeNode +
                    ', mas o texto contém ' + IntToStr(vTextoList.Count) + ' linhas.');
        break;
      end;
      vListaNodes :=  aNodeAtual.AddChild(aNomeNode);
      vListaNodes.NodeValue :=  vTextoList.Strings[I];
      if not aNomeAtributo.IsEmpty and not aTextoAtributo.IsEmpty then
        vListaNodes.Attributes[aNomeAtributo] := aTextoAtributo;
    end;
  finally
    FreeAndNil(vTextoList);
  end;

  result := aNodeAtual;
end;

procedure TfrmCdDraftBL.GerarXml;
var
  MessageRaiz,
  Header,
  Header_Parties,
  Header_Parties_Partner,
  Body,
  Body_Properties,
  Body_Properties_ReferenceInformation,
  Body_Properties_BlLocations,
  Body_Properties_BlLocation_Location,
  Body_Properties_Instructions,
  Body_Properties_Instructions_ShipmentComments,
  Body_Properties_ControlTotal,
  Body_Properties_TransportationDetails,
  Body_Properties_TransportationDetails_Tags,
  Body_Properties_Parties,
  Body_Properties_Parties_Partner,
  Body_Properties_Parties_Partner_Name,
  Body_Properties_Parties_Partner_Contact,
  Body_Properties_Parties_Partner_Address,
  Body_Properties_Parties_Partner_Address_AddressLine,
  Body_Details,
  Body_Details_EquipmentDetails,
  Body_Details_GoodsDetails,
  Body_Details_GoodsDetails_PackageDetailComments,
  Body_Details_GoodsDetails_PackageMarks,
  Body_Details_GoodsDetails_PackageMarks_Marks,
  Body_Details_GoodsDetails_SplitGoodsDetails,
  Body_Details_GoodsDetails_DetailsCustomsInformation: IXMLNode;

  i: integer;
  vQtEmbalagem: integer;
  vQtPesoBruto, vVlCubagem: Double;

  vStringsComentarios, vStringsAgenteEndereco, vStringsConsigEndereco, vStringsClienteNome,
  vStringsClienteEndereco, vStringsDescricaoCarga, vStringsMarcacaoVolume: TStringList;
  cont_Container: Integer;
  vTemperatura: String;
begin

  if adsMain.RecordCount = 0 then
  begin
    Reject('Favor selecionar um processo');
  end;

  dmGerarArquivosDraft.qryDraft.Close;
  dmGerarArquivosDraft.qryDraft.ParamByName('NR_PROCESSO').AsString := adsMainNrProcessoNrProcesso.AsString;
  dmGerarArquivosDraft.qryDraft.ParamByName('NR_amend').AsString := adsMainNrAmend.AsString;
  dmGerarArquivosDraft.qryDraft.Open;

  dmGerarArquivosDraft.qryContainer.Close;
  dmGerarArquivosDraft.qryContainer.ParamByName('NR_PROCESSO').AsString := adsMainNrProcessoNrProcesso.AsString;
  dmGerarArquivosDraft.qryContainer.ParamByName('NR_amend').AsString := adsMainNrAmend.AsString;
  dmGerarArquivosDraft.qryContainer.Open;

//  qryMercadoria.Close;
//  qryMercadoria.ParamByName('NR_PROCESSO').AsString := adsMainNrProcessoNrProcesso.AsString;
//  qryMercadoria.ParamByName('NR_amend').AsString := adsMainNrAmend.AsString;
//  qryMercadoria.Open;

//  qryMerc_Container.Close;
//  qryMerc_Container.ParamByName('NR_PROCESSO').AsString := adsMainNrProcessoNrProcesso.AsString;
//  qryMerc_Container.ParamByName('NR_amend').AsString := adsMainNrAmend.AsString;
//  qryMerc_Container.Open;

  dmGerarArquivosDraft.qryComentarios.Close;
  dmGerarArquivosDraft.qryComentarios.ParamByName('NR_PROCESSO').AsString := adsMainNrProcessoNrProcesso.AsString;
  dmGerarArquivosDraft.qryComentarios.ParamByName('NR_amend').AsString := adsMainNrAmend.AsString;
  dmGerarArquivosDraft.qryComentarios.Open;

  XMLDocument1.FileName := '';
  XMLDocument1.XML.Text := '';
  XMLDocument1.Active := False;
  XMLDocument1.Active := True;
  XMLDocument1.Version := '1.0';
  XMLDocument1.Encoding := 'ISO-8859-1';

  XMLDocument1.AddChild('Message');
  MessageRaiz := XMLDocument1.DocumentElement;
  Header := MessageRaiz.AddChild('Header');
  Header.AddChild('MessageType');
  Header.ChildNodes['MessageType'].Attributes['MessageVersion'] := '1.0';
  Header.ChildNodes['MessageType'].NodeValue := 'ShippingInstruction';

  Header.AddChild('DocumentIdentifier');
  Header.ChildNodes['DocumentIdentifier'].NodeValue := adsMainNrProcessoNrProcesso.AsString + '_' + adsMainNrAmend.AsString;

  Header.AddChild('DateTime');
  Header.ChildNodes['DateTime'].Attributes['DateType'] := 'Document';
  Header.ChildNodes['DateTime'].NodeValue := FormatDateTime('yymmddhhnn', now);//'1909181636';

  Header_Parties := Header.AddChild('Parties');

  Header_Parties_Partner := Header_Parties.AddChild('PartnerInformation');
  Header_Parties_Partner.Attributes['PartnerRole'] := 'Sender';
  Header_Parties_Partner.AddChild('PartnerIdentifier');
  Header_Parties_Partner.ChildNodes['PartnerIdentifier'].Attributes['Agency'] := 'AssignedBySender';
  Header_Parties_Partner.ChildNodes['PartnerIdentifier'].NodeValue := 'INDAIA';
  Header_Parties_Partner.AddChild('PartnerName');
  Header_Parties_Partner.ChildNodes['PartnerName'].NodeValue := 'Indaia Logistica Internacional';

  Header_Parties_Partner := Header_Parties.AddChild('PartnerInformation');
  Header_Parties_Partner.Attributes['PartnerRole'] := 'Recipient';
  Header_Parties_Partner.AddChild('PartnerIdentifier');
  Header_Parties_Partner.ChildNodes['PartnerIdentifier'].Attributes['Agency'] := 'AssignedByRecipient';
  Header_Parties_Partner.ChildNodes['PartnerIdentifier'].NodeValue := 'INTTRA';

  Body := MessageRaiz.AddChild('MessageBody');
  Body_Properties := Body.AddChild('MessageProperties');
  Body_Properties.AddChild('ShipmentID');
  Body_Properties.ChildNodes['ShipmentID'].AddChild('ShipmentIdentifier');
  if dmGerarArquivosDraft.qryDraftNR_AMEND.AsInteger > 1  then
    Body_Properties.ChildNodes['ShipmentID'].ChildNodes['ShipmentIdentifier'].Attributes['MessageStatus'] := 'Amendment'
  else
    Body_Properties.ChildNodes['ShipmentID'].ChildNodes['ShipmentIdentifier'].Attributes['MessageStatus'] := 'Original';
  if dmGerarArquivosDraft.qryDraftREFERENCIA_EMBARQUE.AsString = '' then
    reject('Obrigatório o preenchimento da referência de embarque.');
  Body_Properties.ChildNodes['ShipmentID'].ChildNodes['ShipmentIdentifier'].NodeValue := dmGerarArquivosDraft.qryDraftREFERENCIA_EMBARQUE.AsString;//'NES074310/2019';
  Body_Properties.ChildNodes['ShipmentID'].AddChild('DocumentVersion');
  Body_Properties.ChildNodes['ShipmentID'].ChildNodes['DocumentVersion'].NodeValue := FormatFloat('000000', dmGerarArquivosDraft.qryDraftNR_AMEND.AsInteger);//'000001';

  Body_Properties.AddChild('DateTime');
  Body_Properties.ChildNodes['DateTime'].Attributes['DateType'] := 'Message';
  Body_Properties.ChildNodes['DateTime'].NodeValue := FormatDateTime('yyyymmddhhnn', now);//'201909181636';


  if (adsMainCdCollectPrepaidDescricao.IsNull or (adsMainCdCollectPrepaidDescricao.AsString = '')) or
     (adsMainCdTipoPgmtoTaxasDescricao.IsNull or (adsMainCdTipoPgmtoTaxasDescricao.AsString = '')) then
     reject('Tipo de frete e tipo da taxa devem estar preenchidos.');
  Body_Properties.AddChild('ChargeCategory');
  Body_Properties.ChildNodes['ChargeCategory'].Attributes['PrepaidorCollectIndicator'] := dmGerarArquivosDraft.qryDraftTIPO_FRETE_DESCRICAO.AsString;
  Body_Properties.ChildNodes['ChargeCategory'].Attributes['ChargeType'] := dmGerarArquivosDraft.qryDraftPGTO_TAXA_DESCRICAO.AsString;

  if not dmGerarArquivosDraft.qryDraftLOCAL_LIBERACAO_BL_COD.IsNull and (dmGerarArquivosDraft.qryDraftLOCAL_LIBERACAO_BL_COD.AsString <> '') and
     not dmGerarArquivosDraft.qryDraftLOCAL_LIBERACAO_BL_NOME.IsNull and (dmGerarArquivosDraft.qryDraftLOCAL_LIBERACAO_BL_NOME.AsString <> '') and
     not dmGerarArquivosDraft.qryDraftLOCAL_LIBERACAO_BL_PAIS.IsNull and (dmGerarArquivosDraft.qryDraftLOCAL_LIBERACAO_BL_PAIS.AsString <> '') then
  begin
    Body_Properties_BlLocations := Body_Properties.AddChild('BlLocations');
  //  Body_Properties_BlLocation_Location := Body_Properties_BlLocations.AddChild('Location');
  //  Body_Properties_BlLocation_Location.Attributes['LocationType'] := 'FreightPaymentLocation';
  //  Body_Properties_BlLocation_Location.AddChild('LocationCode').NodeValue := 'BR'+ dmGerarArquivosDraft.qryDraftLOCAL_EMBARQUE_SIGLA.AsString;;
  //  Body_Properties_BlLocation_Location.ChildNodes['LocationCode'].Attributes['Agency'] := 'UN';
  //  Body_Properties_BlLocation_Location.AddChild('LocationName').NodeValue := dmGerarArquivosDraft.qryDraftLOCAL_EMBARQUE.AsString;;

    Body_Properties_BlLocation_Location := Body_Properties_BlLocations.AddChild('Location');
    Body_Properties_BlLocation_Location.Attributes['LocationType'] := 'BillOfLadingRelease';
    Body_Properties_BlLocation_Location.AddChild('LocationCode').NodeValue := dmGerarArquivosDraft.qryDraftLOCAL_LIBERACAO_BL_ID.AsString;
    Body_Properties_BlLocation_Location.ChildNodes['LocationCode'].Attributes['Agency'] := 'UN';
    Body_Properties_BlLocation_Location.AddChild('LocationName').NodeValue := dmGerarArquivosDraft.qryDraftLOCAL_LIBERACAO_BL_NOME.AsString;
    Body_Properties_BlLocation_Location.AddChild('LocationCountry').NodeValue := dmGerarArquivosDraft.qryDraftLOCAL_LIBERACAO_BL_PAIS.AsString;
  //  Body_Properties_BlLocation.AddChild('DateTime') := '20171108';
  //  Body_Properties_BlLocation.ChildNodes['DateTime'].Attributes['DateType'] := 'BlReleaseDate';
  end;


  Body_Properties_ReferenceInformation := Body_Properties.AddChild('ReferenceInformation');
  Body_Properties_ReferenceInformation.Attributes['ReferenceType'] := 'BookingNumber';
  Body_Properties_ReferenceInformation.NodeValue := dmGerarArquivosDraft.qryDraftBOOKING_ARMADOR.AsString; //'241ISZ1296278';

  Body_Properties_ReferenceInformation := Body_Properties.AddChild('ReferenceInformation');
  Body_Properties_ReferenceInformation.Attributes['ReferenceType'] := 'FreightForwarderReference';
  Body_Properties_ReferenceInformation.NodeValue := dmGerarArquivosDraft.qryDraftNR_PROCESSO.AsString;//'0102EM-000200-19  ';

  Body_Properties_ReferenceInformation := Body_Properties.AddChild('ReferenceInformation');
  Body_Properties_ReferenceInformation.Attributes['ReferenceType'] := 'ShipperIdentifyingNumber';
  Body_Properties_ReferenceInformation.NodeValue := dmGerarArquivosDraft.qryDraftREFERENCIA_EMBARQUE.AsString;

  Body_Properties_ReferenceInformation := Body_Properties.AddChild('ReferenceInformation');
  Body_Properties_ReferenceInformation.Attributes['ReferenceType'] := 'ExportersReferenceNumber';
  Body_Properties_ReferenceInformation.NodeValue := dmGerarArquivosDraft.qryDraftCD_RUC.AsString;//'RUC 9BR6040907510015580000NES074184';

  Body_Properties_Instructions := Body_Properties.AddChild('Instructions');

  dmGerarArquivosDraft.qryComentarios.first;
  while not dmGerarArquivosDraft.qryComentarios.Eof do
  begin
    if dmGerarArquivosDraft.qryComentariosCD_TP_COMENTARIO.AsString <> '' then
    begin
      Body_Properties_Instructions_ShipmentComments := Body_Properties_Instructions.AddChild('ShipmentComments');
      Body_Properties_Instructions_ShipmentComments.Attributes['CommentType'] := 'BlClause';
      Body_Properties_Instructions_ShipmentComments.Attributes['ClauseType'] := dmGerarArquivosDraft.qryComentariosCD_TP_COMENTARIO.AsString;
      Body_Properties_Instructions_ShipmentComments.NodeValue := Copy(dmGerarArquivosDraft.qryComentariosDS_COMENTARIO.AsString, 0, 34);
    end
    else
    begin
      Body_Properties_Instructions_ShipmentComments := AddChildList(dmGerarArquivosDraft.qryComentariosDS_COMENTARIO.AsString, 'ShipmentComments',
                                                                    Body_Properties_Instructions, 35, 99,'CommentType', 'General');
    end;
    dmGerarArquivosDraft.qryComentarios.Next;
  end;

  vQtEmbalagem :=0;
  vQtPesoBruto := 0;
  vVlCubagem := 0;
  dmGerarArquivosDraft.qryContainer.first;
  While not dmGerarArquivosDraft.qryContainer.Eof do
  begin
    vQtEmbalagem := vQtEmbalagem + dmGerarArquivosDraft.qryContainerQT_EMBALAGEM.AsInteger;
    vQtPesoBruto := vQtPesoBruto + dmGerarArquivosDraft.qryContainerQT_PESO_BRUTO.AsFloat;
    vVlCubagem := vVlCubagem + dmGerarArquivosDraft.qryContainerVL_CUBAGEM.AsFloat;
    dmGerarArquivosDraft.qryContainer.Next;
  end;

  Body_Properties_ControlTotal := Body_Properties.AddChild('ControlTotal');
  Body_Properties_ControlTotal.AddChild('NumberOfEquipment');
  Body_Properties_ControlTotal.ChildNodes['NumberOfEquipment'].NodeValue := dmGerarArquivosDraft.qryContainer.RecordCount; //'1';
  Body_Properties_ControlTotal.AddChild('NumberOfPackages');
  Body_Properties_ControlTotal.ChildNodes['NumberOfPackages'].NodeValue := vQtEmbalagem;//'0';
  Body_Properties_ControlTotal.AddChild('GrossWeight');
  Body_Properties_ControlTotal.ChildNodes['GrossWeight'].Attributes['UOM'] := 'KGM';
  Body_Properties_ControlTotal.ChildNodes['GrossWeight'].NodeValue := StringReplace(FormatFloat('##0.000', vQtPesoBruto), ',', '.', [rfReplaceAll]);//'0.000';
  Body_Properties_ControlTotal.AddChild('GrossVolume');
  Body_Properties_ControlTotal.ChildNodes['GrossVolume'].Attributes['UOM'] := 'MTQ';
  Body_Properties_ControlTotal.ChildNodes['GrossVolume'].NodeValue := StringReplace(FormatFloat('##0.000', vVlCubagem), ',', '.', [rfReplaceAll]);//'3500.0000';

  Body_Properties.AddChild('HaulageDetails');
  Body_Properties.ChildNodes['HaulageDetails'].Attributes['MovementType'] := dmGerarArquivosDraft.qryDraftMOVIMENTO_DESCRICAO.AsString;
  Body_Properties.ChildNodes['HaulageDetails'].Attributes['ServiceType'] := dmGerarArquivosDraft.qryDraftServiceType.AsString;

  Body_Properties_TransportationDetails := Body_Properties.AddChild('TransportationDetails');
  Body_Properties_TransportationDetails.Attributes['TransportStage'] := dmGerarArquivosDraft.qryDraftTransportStage.AsString;//'Main';
  Body_Properties_TransportationDetails.Attributes['TransportMode'] := dmGerarArquivosDraft.qryDraftTransportMode.AsString;//'Maritime';

  Body_Properties_TransportationDetails_Tags := Body_Properties_TransportationDetails.AddChild('ConveyanceInformation');
  Body_Properties_TransportationDetails_Tags.AddChild('ConveyanceName');
  Body_Properties_TransportationDetails_Tags.ChildNodes['ConveyanceName'].NodeValue := dmGerarArquivosDraft.qryDraftNM_NAVIO.AsString;//'AGIOS DIMITRIOS';
  Body_Properties_TransportationDetails_Tags.AddChild('VoyageTripNumber');
  Body_Properties_TransportationDetails_Tags.ChildNodes['VoyageTripNumber'].NodeValue := dmGerarArquivosDraft.qryDraftNR_VIAGEM.AsString;//'0219';

  Body_Properties_TransportationDetails_Tags := Body_Properties_TransportationDetails.AddChild('Location');
  Body_Properties_TransportationDetails_Tags.Attributes['LocationType'] := 'PortOfLoading';
  Body_Properties_TransportationDetails_Tags.AddChild('LocationCode');
  Body_Properties_TransportationDetails_Tags.ChildNodes['LocationCode'].Attributes['Agency'] := 'UN';
  Body_Properties_TransportationDetails_Tags.ChildNodes['LocationCode'].NodeValue := 'BR'+ dmGerarArquivosDraft.qryDraftLOCAL_EMBARQUE_SIGLA.AsString;//'BRSSZ';
  Body_Properties_TransportationDetails_Tags.AddChild('LocationName');
  Body_Properties_TransportationDetails_Tags.ChildNodes['LocationName'].NodeValue := dmGerarArquivosDraft.qryDraftLOCAL_EMBARQUE.AsString;//'SANTOS';
  Body_Properties_TransportationDetails_Tags.AddChild('LocationCountry').NodeValue := 'BRAZIL';//preencher


  Body_Properties_TransportationDetails_Tags := Body_Properties_TransportationDetails.AddChild('Location');
  Body_Properties_TransportationDetails_Tags.Attributes['LocationType'] := 'PortOfDischarge';
  Body_Properties_TransportationDetails_Tags.AddChild('LocationCode');
  Body_Properties_TransportationDetails_Tags.ChildNodes['LocationCode'].Attributes['Agency'] := 'UN';

  if length(dmGerarArquivosDraft.qryDraftLOCAL_DESEMBARQUE_ID.AsString) < 5 then
      reject('A sigla do local de descarga está incorreta.');
  Body_Properties_TransportationDetails_Tags.ChildNodes['LocationCode'].NodeValue := dmGerarArquivosDraft.qryDraftLOCAL_DESEMBARQUE_ID.AsString;
                                                                                     //+ dmGerarArquivosDraft.qryDraftLOCAL_DESEMBARQUE_SIGLA.AsString;//'HTPAP';
  Body_Properties_TransportationDetails_Tags.AddChild('LocationName');
  Body_Properties_TransportationDetails_Tags.ChildNodes['LocationName'].NodeValue := dmGerarArquivosDraft.qryDraftLOCAL_DESEMBARQUE.AsString;//'PORT-AU-PRINCE';
  Body_Properties_TransportationDetails_Tags.AddChild('LocationCountry');
  Body_Properties_TransportationDetails_Tags.ChildNodes['LocationCountry'].NodeValue := dmGerarArquivosDraft.qryDraftLOCAL_DESEMBARQUE_PAIS.AsString;

  if dmGerarArquivosDraft.qryDraftCD_TIPO_MOVIMENTO.AsInteger = 1 then
  begin
    if dmGerarArquivosDraft.qryDraftLOCAL_ENTREGA.AsString <> '' then
    begin
      Body_Properties_TransportationDetails_Tags := Body_Properties_TransportationDetails.AddChild('Location');
      Body_Properties_TransportationDetails_Tags.Attributes['LocationType'] := 'PlaceOfDelivery';
      Body_Properties_TransportationDetails_Tags.AddChild('LocationCode');
      Body_Properties_TransportationDetails_Tags.ChildNodes['LocationCode'].Attributes['Agency'] := 'UN';
      Body_Properties_TransportationDetails_Tags.ChildNodes['LocationCode'].NodeValue := dmGerarArquivosDraft.qryDraftLOCAL_ENTREGA_ID.AsString;
                                                                                         //+ dmGerarArquivosDraft.qryDraftLOCAL_ENTREGA_SIGLA.AsString;
      Body_Properties_TransportationDetails_Tags.AddChild('LocationName');
      Body_Properties_TransportationDetails_Tags.ChildNodes['LocationName'].NodeValue := dmGerarArquivosDraft.qryDraftLOCAL_ENTREGA.AsString;//'PORT-AU-PRINCE';
      Body_Properties_TransportationDetails_Tags.AddChild('LocationCountry');
      Body_Properties_TransportationDetails_Tags.ChildNodes['LocationCountry'].NodeValue := dmGerarArquivosDraft.qryDraftLOCAL_ENTREGA_PAIS.AsString;
    end
    else
    begin
      Body_Properties_TransportationDetails_Tags := Body_Properties_TransportationDetails.AddChild('Location');
      Body_Properties_TransportationDetails_Tags.Attributes['LocationType'] := 'PlaceOfDelivery';
      Body_Properties_TransportationDetails_Tags.AddChild('LocationCode');
      Body_Properties_TransportationDetails_Tags.ChildNodes['LocationCode'].Attributes['Agency'] := 'UN';
      Body_Properties_TransportationDetails_Tags.ChildNodes['LocationCode'].NodeValue := dmGerarArquivosDraft.qryDraftLOCAL_DESEMBARQUE_ID.AsString;
                                                                                        // + dmGerarArquivosDraft.qryDraftLOCAL_DESEMBARQUE_SIGLA.AsString;//'HTPAP';
      Body_Properties_TransportationDetails_Tags.AddChild('LocationName');
      Body_Properties_TransportationDetails_Tags.ChildNodes['LocationName'].NodeValue := dmGerarArquivosDraft.qryDraftLOCAL_DESEMBARQUE.AsString;//'PORT-AU-PRINCE';
      Body_Properties_TransportationDetails_Tags.AddChild('LocationCountry');
      Body_Properties_TransportationDetails_Tags.ChildNodes['LocationCountry'].NodeValue := dmGerarArquivosDraft.qryDraftLOCAL_DESEMBARQUE_PAIS.AsString;
    end;

      Body_Properties_TransportationDetails_Tags := Body_Properties_TransportationDetails.AddChild('Location');
      Body_Properties_TransportationDetails_Tags.Attributes['LocationType'] := 'PlaceOfReceipt';
      Body_Properties_TransportationDetails_Tags.AddChild('LocationName');
      Body_Properties_TransportationDetails_Tags.ChildNodes['LocationName'].NodeValue := dmGerarArquivosDraft.qryDraftCLIENTE_CIDADE.AsString;
      Body_Properties_TransportationDetails_Tags.AddChild('LocationCountry');
      Body_Properties_TransportationDetails_Tags.ChildNodes['LocationCountry'].NodeValue := dmGerarArquivosDraft.qryDraftCLIENTE_PAIS.AsString;
  end
  else
  begin
    if dmGerarArquivosDraft.qryDraftLOCAL_ENTREGA.AsString <> '' then
    begin
      Body_Properties_TransportationDetails_Tags := Body_Properties_TransportationDetails.AddChild('Location');
      Body_Properties_TransportationDetails_Tags.Attributes['LocationType'] := 'PlaceOfDelivery';
      Body_Properties_TransportationDetails_Tags.AddChild('LocationCode');
      Body_Properties_TransportationDetails_Tags.ChildNodes['LocationCode'].Attributes['Agency'] := 'UN';
      Body_Properties_TransportationDetails_Tags.ChildNodes['LocationCode'].NodeValue := dmGerarArquivosDraft.qryDraftLOCAL_ENTREGA_ID.AsString;
                                                                                         //+ dmGerarArquivosDraft.qryDraftLOCAL_ENTREGA_SIGLA.AsString;
      Body_Properties_TransportationDetails_Tags.AddChild('LocationName');
      Body_Properties_TransportationDetails_Tags.ChildNodes['LocationName'].NodeValue := dmGerarArquivosDraft.qryDraftLOCAL_ENTREGA.AsString;//'PORT-AU-PRINCE';
      Body_Properties_TransportationDetails_Tags.AddChild('LocationCountry');
      Body_Properties_TransportationDetails_Tags.ChildNodes['LocationCountry'].NodeValue := dmGerarArquivosDraft.qryDraftLOCAL_ENTREGA_PAIS.AsString;
    end;
  end;

  Body_Properties_Parties := Body_Properties.AddChild('Parties');

  {Carrier}
  Body_Properties_Parties_Partner := Body_Properties_Parties.AddChild('PartnerInformation');
  Body_Properties_Parties_Partner.Attributes['PartnerRole'] := 'Carrier';
  Body_Properties_Parties_Partner.AddChild('PartnerIdentifier');
  Body_Properties_Parties_Partner.ChildNodes['PartnerIdentifier'].Attributes['Agency'] := 'AssignedBySender';

  if (dmGerarArquivosDraft.qryDraftAGENTE_CD_INTTRA.IsNull or (dmGerarArquivosDraft.qryDraftAGENTE_CD_INTTRA.AsString = '')) then
     reject('Favor preencher o código SCAC no cadastro do Agente.');
  Body_Properties_Parties_Partner.ChildNodes['PartnerIdentifier'].NodeValue := dmGerarArquivosDraft.qryDraftAGENTE_CD_INTTRA.AsString; //'CA20';

  Body_Properties_Parties_Partner.AddChild('PartnerName');
  Body_Properties_Parties_Partner.ChildNodes['PartnerName'].NodeValue := dmGerarArquivosDraft.qryDraftAGENTE_NOME.AsString;//'MSC MEDITERRANEAN SHIPPING LTDA';

  if dmGerarArquivosDraft.qryDraftAGENTE_ENDERECO.AsString = '' then
    reject('Favor preencher o endereço do Agente.');

  Body_Properties_Parties_Partner_Address := Body_Properties_Parties_Partner.AddChild('AddressInformation');

  Body_Properties_Parties_Partner_Address_AddressLine := AddChildList(dmGerarArquivosDraft.qryDraftAGENTE_ENDERECO.AsString, 'AddressLine',
                                                                     Body_Properties_Parties_Partner_Address, 35, 4,
                                                                     '', '');

  {Requestor}
  Body_Properties_Parties_Partner := Body_Properties_Parties.AddChild('PartnerInformation');
  Body_Properties_Parties_Partner.Attributes['PartnerRole'] := 'Requestor';
  Body_Properties_Parties_Partner.AddChild('PartnerIdentifier');
  Body_Properties_Parties_Partner.ChildNodes['PartnerIdentifier'].Attributes['Agency'] := 'AssignedByRecipient';

  if Config.DraftAmbiente.Equals('P') then
    Body_Properties_Parties_Partner.ChildNodes['PartnerIdentifier'].NodeValue := '816639'
  else
    Body_Properties_Parties_Partner.ChildNodes['PartnerIdentifier'].NodeValue := '804727';

  Body_Properties_Parties_Partner.AddChild('PartnerName');
  Body_Properties_Parties_Partner.ChildNodes['PartnerName'].NodeValue := 'Indaia Logistica Internacional';

  Body_Properties_Parties_Partner_Contact := Body_Properties_Parties_Partner.AddChild('ContactInformation');
  Body_Properties_Parties_Partner_Contact.AddChild('ContactName');
  Body_Properties_Parties_Partner_Contact.ChildNodes['ContactName'].NodeValue := 'Indaiá';
  Body_Properties_Parties_Partner_Contact.ChildNodes['ContactName'].Attributes['ContactType'] := 'Informational';

  Body_Properties_Parties_Partner_Contact.AddChild('CommunicationValue');

  if dmGerarArquivosDraft.qryDraftDS_EMAIL_INDAIA.AsString <> '' then
    Body_Properties_Parties_Partner_Contact.ChildNodes['CommunicationValue'].NodeValue := dmGerarArquivosDraft.qryDraftDS_EMAIL_INDAIA.AsString//'renan.ferreira@myindaia.com.br'
  else
    Body_Properties_Parties_Partner_Contact.ChildNodes['CommunicationValue'].NodeValue := 'renan.ferreira@myindaia.com.br';

  Body_Properties_Parties_Partner_Contact.ChildNodes['CommunicationValue'].Attributes['CommunicationType'] := 'Email';

  Body_Properties_Parties_Partner_Address := Body_Properties_Parties_Partner.AddChild('AddressInformation');
  Body_Properties_Parties_Partner_Address_AddressLine := Body_Properties_Parties_Partner_Address.AddChild('AddressLine');
  Body_Properties_Parties_Partner_Address_AddressLine.NodeValue := 'R XV de Novembro, 170 Centro Santos';

  {CONSIGNEE}
  if dmGerarArquivosDraft.qryDraftCONSIG_NOME.AsString <> '' then
  begin
    Body_Properties_Parties_Partner := Body_Properties_Parties.AddChild('PartnerInformation');
    Body_Properties_Parties_Partner.Attributes['PartnerRole'] := 'Consignee';
    Body_Properties_Parties_Partner := AddChildList(dmGerarArquivosDraft.qryDraftCONSIG_NOME.AsString,
                                                    'PartnerName', Body_Properties_Parties_Partner, 35, 2);
    if dmGerarArquivosDraft.qryDraftCONSIG_ENDERECO.AsString = '' then
      reject('Favor preencher o endereço do Consignatário.');
    Body_Properties_Parties_Partner_Address := Body_Properties_Parties_Partner.AddChild('AddressInformation');

    Body_Properties_Parties_Partner_Address_AddressLine := AddChildList(dmGerarArquivosDraft.qryDraftCONSIG_END_COMPLETO.AsString,
                                                                        'AddressLine', Body_Properties_Parties_Partner_Address, 35, 4);
  end;

  {NOTIFY1}
  if dmGerarArquivosDraft.qryDraftNOTIFY1_NOME.AsString <> '' then
  begin
    Body_Properties_Parties_Partner := Body_Properties_Parties.AddChild('PartnerInformation');
    Body_Properties_Parties_Partner.Attributes['PartnerRole'] := 'NotifyParty';
    Body_Properties_Parties_Partner := AddChildList(dmGerarArquivosDraft.qryDraftNOTIFY1_NOME.AsString,
                                                 'PartnerName', Body_Properties_Parties_Partner, 35, 2);
    Body_Properties_Parties_Partner_Address := Body_Properties_Parties_Partner.AddChild('AddressInformation');

    if dmGerarArquivosDraft.qryDraftNOTIFY1_ENDERECO.AsString = '' then
      reject('Favor preencher o endereço do Nofify 1.');

    Body_Properties_Parties_Partner_Address_AddressLine := AddChildList(dmGerarArquivosDraft.qryDraftNOTIFY1_END_COMPLETO.AsString,
                                                                        'AddressLine', Body_Properties_Parties_Partner_Address, 35, 4);
  end;

  {NOTIFY2}
  if (dmGerarArquivosDraft.qryDraftNOTIFY2_NOME.AsString <> '') then
  begin
    Body_Properties_Parties_Partner := Body_Properties_Parties.AddChild('PartnerInformation');
    Body_Properties_Parties_Partner.Attributes['PartnerRole'] := 'NotifyParty1';
    Body_Properties_Parties_Partner := AddChildList(dmGerarArquivosDraft.qryDraftNOTIFY2_NOME.AsString,
                                                    'PartnerName', Body_Properties_Parties_Partner, 35, 2);
    Body_Properties_Parties_Partner_Address := Body_Properties_Parties_Partner.AddChild('AddressInformation');

    if dmGerarArquivosDraft.qryDraftNOTIFY2_ENDERECO.AsString = '' then
      reject('Favor preencher o endereço do Nofify 2.');

    Body_Properties_Parties_Partner_Address_AddressLine := AddChildList(dmGerarArquivosDraft.qryDraftNOTIFY2_END_COMPLETO.AsString,
                                                                        'AddressLine', Body_Properties_Parties_Partner_Address, 35, 4);
  end;
  {SHIPPER - EXPORTADOR}
  Body_Properties_Parties_Partner := Body_Properties_Parties.AddChild('PartnerInformation');
  Body_Properties_Parties_Partner.Attributes['PartnerRole'] := 'Shipper';

  Body_Properties_Parties_Partner_Name := AddChildList(dmGerarArquivosDraft.qryDraftCLIENTE_NOME.AsString, 'PartnerName',
                                                 Body_Properties_Parties_Partner, 35, 2);

  Body_Properties_Parties_Partner_Address := Body_Properties_Parties_Partner.AddChild('AddressInformation');

  Body_Properties_Parties_Partner_Address_AddressLine := AddChildList(dmGerarArquivosDraft.qryDraftCLIENTE_END_COMPLETO.AsString,
                                                                      'AddressLine', Body_Properties_Parties_Partner_Address, 35, 3);
  Body_Properties_Parties_Partner_Address.AddChild('AddressLine').NodeValue := 'CNPJ: ' + dmGerarArquivosDraft.qryDraftCLIENTE_CNPJ.AsString;

  {FreightForwarder}
  Body_Properties_Parties_Partner := Body_Properties_Parties.AddChild('PartnerInformation');
  Body_Properties_Parties_Partner.Attributes['PartnerRole'] := 'FreightForwarder';

  Body_Properties_Parties_Partner_Name := AddChildList('INDAIA LOGISTICA INTERNACIONAL LTDA', 'PartnerName',
                                                       Body_Properties_Parties_Partner, 35, 2);

  Body_Properties_Parties_Partner_Address := Body_Properties_Parties_Partner.AddChild('AddressInformation');

  Body_Properties_Parties_Partner_Address.AddChild('AddressLine').NodeValue := 'Rua XV de Novembro, 170';
  Body_Properties_Parties_Partner_Address.AddChild('AddressLine').NodeValue := 'CEP 11010-150 - Santos/SP';
  Body_Properties_Parties_Partner_Address.AddChild('AddressLine').NodeValue := 'Fone: 55 13 3211-4000';


  {Payer}
//  if dmGerarArquivosDraft.qryDraftTIPO_FRETE_DESCRICAO.AsString = 'Prepaid' then
//  begin
//    {SHIPPER - EXPORTADOR}
//    Body_Properties_Parties_Partner := Body_Properties_Parties.AddChild('PartnerInformation');
//    Body_Properties_Parties_Partner.Attributes['PartnerRole'] := 'FreightPayer';
//
//    Body_Properties_Parties_Partner_Name := AddChildList(dmGerarArquivosDraft.qryDraftCLIENTE_NOME.AsString, 'PartnerName',
//                                                   Body_Properties_Parties_Partner, 35, 2);
//
//    Body_Properties_Parties_Partner_Address := Body_Properties_Parties_Partner.AddChild('AddressInformation');
//
//    Body_Properties_Parties_Partner_Address_AddressLine := AddChildList(dmGerarArquivosDraft.qryDraftCLIENTE_END_COMPLETO.AsString,
//                                                                        'AddressLine', Body_Properties_Parties_Partner_Address, 35, 3);
//    Body_Properties_Parties_Partner_Address.AddChild('AddressLine').NodeValue := 'CNPJ: ' + dmGerarArquivosDraft.qryDraftCLIENTE_CNPJ.AsString;
//  end
//  else
//  if dmGerarArquivosDraft.qryDraftTIPO_FRETE_DESCRICAO.AsString = 'Collect' then
//  begin
//    {CONSIGNEE}
//    Body_Properties_Parties_Partner := Body_Properties_Parties.AddChild('PartnerInformation');
//    Body_Properties_Parties_Partner.Attributes['PartnerRole'] := 'FreightPayer';
//    Body_Properties_Parties_Partner := AddChildList(dmGerarArquivosDraft.qryDraftCONSIG_NOME.AsString,
//                                                    'PartnerName', Body_Properties_Parties_Partner, 35, 2);
//    if dmGerarArquivosDraft.qryDraftCONSIG_ENDERECO.AsString = '' then
//      reject('Favor preencher o endereço do Consignatário.');
//    Body_Properties_Parties_Partner_Address := Body_Properties_Parties_Partner.AddChild('AddressInformation');
//
//    Body_Properties_Parties_Partner_Address_AddressLine := AddChildList(dmGerarArquivosDraft.qryDraftCONSIG_END_COMPLETO.AsString,
//                                                                        'AddressLine', Body_Properties_Parties_Partner_Address, 35, 4);
//  end;


  Body_Details := Body.AddChild('MessageDetails');

  cont_Container := 0;

  dmGerarArquivosDraft.qryContainer.first;
  while not dmGerarArquivosDraft.qryContainer.Eof do
  begin
    inc(cont_Container);

    Body_Details_EquipmentDetails := Body_Details.AddChild('EquipmentDetails');
    Body_Details_EquipmentDetails.AddChild('LineNumber');
    Body_Details_EquipmentDetails.ChildNodes['LineNumber'].NodeValue := dmGerarArquivosDraft.qryContainer.RecNo;//'1';

    Body_Details_EquipmentDetails.AddChild('EquipmentIdentifier');
    Body_Details_EquipmentDetails.ChildNodes['EquipmentIdentifier'].Attributes['EquipmentSupplier'] :=dmGerarArquivosDraft.qryDraftEquipmentSupplier.AsString;//'Carrier';
    Body_Details_EquipmentDetails.ChildNodes['EquipmentIdentifier'].NodeValue := dmGerarArquivosDraft.qryContainerNR_CNTR.AsString;//'BMOU6015592';

    if dmGerarArquivosDraft.qryContainerCD_ISO.AsString = '' then
      reject('É obrigatório o preenchimento do código ISO do container. O campo deve estar preenchido no cadastro do container.');

    Body_Details_EquipmentDetails.AddChild('EquipmentType').AddChild('EquipmentTypeCode').NodeValue := dmGerarArquivosDraft.qryContainerCD_ISO.AsString;//;'40HC';
    Body_Details_EquipmentDetails.ChildNodes['EquipmentType'].AddChild('EquipmentDescription').NodeValue := dmGerarArquivosDraft.qryContainerNM_TP_CNTR.AsString;//;'40HC';

    Body_Details_EquipmentDetails.AddChild('EquipmentGrossWeight');
    Body_Details_EquipmentDetails.ChildNodes['EquipmentGrossWeight'].Attributes['UOM'] := 'KGM';
    Body_Details_EquipmentDetails.ChildNodes['EquipmentGrossWeight'].NodeValue := StringReplace(FormatFloat('##0.000', dmGerarArquivosDraft.qryContainerQT_PESO_BRUTO.AsFloat), ',', '.', [rfReplaceAll]);//'0.000';

    Body_Details_EquipmentDetails.AddChild('EquipmentTareWeight');
    Body_Details_EquipmentDetails.ChildNodes['EquipmentTareWeight'].Attributes['UOM'] := 'KGM';
    Body_Details_EquipmentDetails.ChildNodes['EquipmentTareWeight'].NodeValue := StringReplace(FormatFloat('##0.000', dmGerarArquivosDraft.qryContainerTARA_CNTR.AsFloat), ',', '.', [rfReplaceAll]);//'0.000';

    Body_Details_EquipmentDetails.AddChild('EquipmentGrossVolume');
    Body_Details_EquipmentDetails.ChildNodes['EquipmentGrossVolume'].Attributes['UOM'] := 'MTQ';
    Body_Details_EquipmentDetails.ChildNodes['EquipmentGrossVolume'].NodeValue := StringReplace(dmGerarArquivosDraft.qryContainerVL_CUBAGEM.AsString, ',', '.', [rfReplaceAll]);//'10';

    if dmGerarArquivosDraft.qryContainerDS_TEMPERATURA.AsString <> '' then
    begin
      vTemperatura := dmGerarArquivosDraft.qryContainerDS_TEMPERATURA.AsString;
      if not (Copy(vTemperatura, 0, 1) = '+') and not (Copy(vTemperatura, 0, 1) = '-') then
        reject('Favor indicar se a temperatura é positiva ou negativa (+ ou -)')
      else
        vTemperatura := StringReplace(vTemperatura, '+', '', []);

      if not (pos('.', vTemperatura) = 3) then
        reject('Está faltanto do separador "ponto" na temperatura do container.')
      else
        vTemperatura := StringReplace(vTemperatura, '.', '', []);

      if not (Length(SomenteNumero(vTemperatura)) = 3) then
        reject('A temperatura do container digitada não é válida, deve conter 3 números.');


      Body_Details_EquipmentDetails.AddChild('EquipmentTemperature');
      Body_Details_EquipmentDetails.ChildNodes['EquipmentTemperature'].Attributes['UOM'] := 'CEL';
      Body_Details_EquipmentDetails.ChildNodes['EquipmentTemperature'].NodeValue := StringReplace(dmGerarArquivosDraft.qryContainerDS_TEMPERATURA.AsString, '+', '', [rfReplaceAll]);
    end;

    Body_Details_EquipmentDetails.AddChild('EquipmentSeal');
    Body_Details_EquipmentDetails.ChildNodes['EquipmentSeal'].Attributes['SealingParty'] := dmGerarArquivosDraft.qryDraftSealingParty.AsString;//'Carrier';

    if length(dmGerarArquivosDraft.qryContainerNR_LACRE.AsString) > 15 then
      reject('Número do Lacre deve conter no máximo 15 caracteres.');
    Body_Details_EquipmentDetails.ChildNodes['EquipmentSeal'].NodeValue := dmGerarArquivosDraft.qryContainerNR_LACRE.AsString;//'MSCFJ03885129  ';


    dmGerarArquivosDraft.qryContainer.Next;
  end;



  cont_Container := 0;

  dmGerarArquivosDraft.qryContainer.first;
  while not dmGerarArquivosDraft.qryContainer.Eof do
  begin
    inc(cont_Container);
    {INICIO GoodsDetails}

    Body_Details_GoodsDetails := Body_Details.AddChild('GoodsDetails');
    Body_Details_GoodsDetails.AddChild('LineNumber');
    Body_Details_GoodsDetails.ChildNodes['LineNumber'].NodeValue := cont_Container;//'1';


    if dmGerarArquivosDraft.qryContainerQT_EMBALAGEM.IsNull or (dmGerarArquivosDraft.qryContainerQT_EMBALAGEM.AsString = '') then
      reject('A quantidade de embalagem devem estar preenchida.');
    Body_Details_GoodsDetails.AddChild('PackageDetail');
    Body_Details_GoodsDetails.ChildNodes['PackageDetail'].Attributes['Level'] := 'Outer';
    Body_Details_GoodsDetails.ChildNodes['PackageDetail'].AddChild('NumberOfPackages').NodeValue := dmGerarArquivosDraft.qryContainerQT_EMBALAGEM.AsString;//'1008';

    if (dmGerarArquivosDraft.qryContainerCD_EMBALAGEM.AsString = '') or (dmGerarArquivosDraft.qryContainerDS_EMBALAGEM.AsString = '') then
      reject('O código e descrição da embalagem devem estar preenchidos.');
    Body_Details_GoodsDetails.ChildNodes['PackageDetail'].AddChild('PackageTypeCode').NodeValue := dmGerarArquivosDraft.qryContainerCD_EMBALAGEM.AsString;//'CR';
    Body_Details_GoodsDetails.ChildNodes['PackageDetail'].AddChild('PackageTypeDescription').NodeValue := dmGerarArquivosDraft.qryContainerDS_EMBALAGEM.AsString;//'CRATES';

    if dmGerarArquivosDraft.qryContainerDS_CARGA.AsString = '' then
      reject('A descrição de carga do container deve estar preenchida.');

    {cargo description}
    Body_Details_GoodsDetails_PackageDetailComments := AddChildList(dmGerarArquivosDraft.qryContainerDS_CARGA.AsString, 'PackageDetailComments',
                                                                       Body_Details_GoodsDetails, 35, 99, 'CommentType', 'GoodsDescription', true);

    {acredito que essa tag não seja obrigatória, estou retirando para não imprimir mais no cargo description}
//    if dmGerarArquivosDraft.qryContainerCD_NCM.isNull or (dmGerarArquivosDraft.qryContainerCD_NCM.AsString = '') then
//      reject('O NCM deve estar preenchido.');
//    Body_Details_GoodsDetails.AddChild('ProductId').NodeValue := dmGerarArquivosDraft.qryContainerCD_NCM.AsString;//'04029900';
//    Body_Details_GoodsDetails.ChildNodes['ProductId'].Attributes['ItemTypeIdCode'] := 'NCMCode';

    if (dmGerarArquivosDraft.qryContainerVL_CUBAGEM.IsNull) or (dmGerarArquivosDraft.qryContainerVL_CUBAGEM.AsString = '') or
       (dmGerarArquivosDraft.qryContainerQT_PESO_BRUTO.IsNull) or (dmGerarArquivosDraft.qryContainerQT_PESO_BRUTO.AsString = '') then
      reject('Os valores de cubagem e peso bruto devem estar preenchidos.');
    Body_Details_GoodsDetails.AddChild('PackageDetailGrossVolume').NodeValue := StringReplace(dmGerarArquivosDraft.qryContainerVL_CUBAGEM.AsString, ',', '.', [rfReplaceAll]);//'23.269';
    Body_Details_GoodsDetails.ChildNodes['PackageDetailGrossVolume'].Attributes['UOM'] := 'MTQ';

    Body_Details_GoodsDetails.AddChild('PackageDetailGrossWeight').NodeValue := StringReplace(FormatFloat('##0.000', dmGerarArquivosDraft.qryContainerQT_PESO_BRUTO.AsFloat), ',', '.', [rfReplaceAll]);//'0.000';
    Body_Details_GoodsDetails.ChildNodes['PackageDetailGrossWeight'].Attributes['UOM'] := 'KGM';

    Body_Details_GoodsDetails_PackageMarks := Body_Details_GoodsDetails.AddChild('PackageMarks');

//    if qryMercadoria.RecNo = 1 then
//    begin

    Body_Details_GoodsDetails_PackageMarks_Marks := AddChildList(dmGerarArquivosDraft.qryDraftMARCACAO_VOLUMES.AsString, 'Marks',
                                                                 Body_Details_GoodsDetails_PackageMarks, 35, 10, '', '', true);
//    end;

    Body_Details_GoodsDetails_SplitGoodsDetails := Body_Details_GoodsDetails.AddChild('SplitGoodsDetails');
    Body_Details_GoodsDetails_SplitGoodsDetails.AddChild('EquipmentIdentifier').NodeValue := dmGerarArquivosDraft.qryContainerNR_CNTR.AsString;//'BMOU6015592';
    Body_Details_GoodsDetails_SplitGoodsDetails.AddChild('SplitGoodsNumberOfPackages').NodeValue := dmGerarArquivosDraft.qryContainerQT_EMBALAGEM.AsString;//'100';
    Body_Details_GoodsDetails_SplitGoodsDetails.AddChild('SplitGoodsGrossVolume').NodeValue := StringReplace(dmGerarArquivosDraft.qryContainerVL_CUBAGEM.AsString, ',', '.', [rfReplaceAll]);//'100';
    Body_Details_GoodsDetails_SplitGoodsDetails.ChildNodes['SplitGoodsGrossVolume'].Attributes['UOM'] := 'MTQ';
    Body_Details_GoodsDetails_SplitGoodsDetails.AddChild('SplitGoodsGrossWeight').NodeValue := StringReplace(FormatFloat('##0.000', dmGerarArquivosDraft.qryContainerQT_PESO_BRUTO.AsFloat), ',', '.', [rfReplaceAll]);//'0.000';
    Body_Details_GoodsDetails_SplitGoodsDetails.ChildNodes['SplitGoodsGrossWeight'].Attributes['UOM'] := 'KGM';

    dmGerarArquivosDraft.qryContainer.Next;
  end;

  Body_Details_GoodsDetails_DetailsCustomsInformation := Body_Details_GoodsDetails.AddChild('DetailsCustomsInformation');
  Body_Details_GoodsDetails_DetailsCustomsInformation.AddChild('DetailsCustomsFilerInstruction');
  Body_Details_GoodsDetails_DetailsCustomsInformation.ChildNodes['DetailsCustomsFilerInstruction'].Attributes['ManifestFilerStatus'] := dmGerarArquivosDraft.qryDraftManifestFilerStatus.AsString;//'Carrier';
  Body_Details_GoodsDetails_DetailsCustomsInformation.ChildNodes['DetailsCustomsFilerInstruction'].AddChild('ManifestFilingCountryCode').NodeValue := dmGerarArquivosDraft.qryDraftManifestFilingCountryCode.AsString;//'BR';
  Body_Details_GoodsDetails_DetailsCustomsInformation.ChildNodes['DetailsCustomsFilerInstruction'].ChildNodes['ManifestFilingCountryCode'].Attributes['Agency'] := 'UN';

  XMLDocument1.SaveToFile(ArquivosInttraEnvioGerados + '\' + adsMainNrProcessoNrProcesso.AsString + '.xml');
end;


procedure TfrmCdDraftBL.btnExcluirClick(Sender: TObject);
var processo : TTprocessoDraftBl;
begin
  ConfirmarExclusao('Excluir o draft inteiro?');
  try
    if FObjectManager.IsAttached(adsMainSelf.AsEntity<TTprocessoDraftBl>) then
    begin
      processo := adsMainSelf.AsEntity<TTprocessoDraftBl>;
      adsMain.Close;

      RemoverDetails(processo);
      FObjectManager.Remove(processo);
    end;
  finally
    framePesquisaProc.btnPesquisar.Click;
  end;
end;

procedure TfrmCdDraftBL.RemoverDetails(draft : TTprocessoDraftBl);
begin
  frameDraftBLComentarios.ExcluirTodosOsComentarios(draft.NrProcesso.NrProcesso, draft.nrAmend);
  frameDraftBLMercadoria.ExcluirTodasAsMercadoriasEContainersRelacionados(draft.NrProcesso.NrProcesso, draft.nrAmend);
  ExcluirTodosOsContainers(draft.NrProcesso.NrProcesso, draft.nrAmend);
end;

procedure TfrmCdDraftBL.ExcluirDoBancoDeDados_DetailContainer;
var i : integer;
begin
  if ItensExcluirContainer.Count = 0 then
    exit;

  for i := 0 to ItensExcluirContainer.count -1 do
  begin
    if FObjectManager.IsAttached(ItensExcluirContainer[i]) then
      FObjectManager.Remove(ItensExcluirContainer[i]);
  end;
  ItensExcluirContainer.Clear;
end;

procedure TfrmCdDraftBL.GravarNoBancoDeDados_DetailContainer;
begin
  if adsDetail.IsEmpty then
    exit;

  adsDetail.First;
  while not adsDetail.eof do
  begin
    if FObjectManager.IsAttached(adsDetailSelf.AsEntity<TTprocessoDraftCntr>) then
      FObjectManager.Update(adsDetailSelf.AsEntity<TTprocessoDraftCntr>)
    else
      FObjectManager.Save(adsDetailSelf.AsEntity<TTprocessoDraftCntr>);

    FObjectManager.Flush(adsDetailSelf.AsEntity<TTprocessoDraftCntr>);
    adsDetail.Next;
  end;
end;

procedure TfrmCdDraftBL.GravarMainNoBancodeDados;
begin
  if FObjectManager.IsAttached(adsMainSelf.AsEntity<TTprocessoDraftBl>) then
    FObjectManager.Update(adsMainSelf.AsEntity<TTprocessoDraftBl>)
  else
    FObjectManager.Save(adsMainSelf.AsEntity<TTprocessoDraftBl>);

  FObjectManager.Flush(adsMainSelf.AsEntity<TTprocessoDraftBl>); //gravando só o objeto atual no banco
end;

procedure TfrmCdDraftBL.ExcluirTodosOsContainers(nrProcesso : string; nrAmend : integer);
var  j: integer;
containers : TList<TTprocessoDraftCntr>;
begin
  try
    adsDetail.close;
    containers := FObjectManager.Find<TTprocessoDraftCntr>
                                .Add(Linq.Eq('FNrProcesso', nrProcesso))
                                .Add(Linq.Eq('FNrAmend', nrAmend))
                                .Refreshing
                                .list;
    for j := 0 to containers.Count-1 do
      FObjectManager.Remove(containers[j]);
  finally
    AbrirDetailContainer(nrAmend,nrProcesso);
  end;
end;

procedure TfrmCdDraftBL.FormCreate(Sender: TObject);
begin
  inherited;
  Application.CreateForm(TdtmGerarArquivosDraft, dtmGerarArquivosDraft);
  CriarPastas;

  dmGerarArquivosDraft := TdtmGerarArquivosDraft.Create(nil);
end;


procedure TfrmCdDraftBL.CriarPastas;
begin
  ArquivosInttra := FileExistsForce(GetLocalPath + 'Inttra');
  ArquivosInttraEnvio := FileExistsForce(ArquivosInttra + '\Envio');
  ArquivosInttraEnvioGerados := FileExistsForce(ArquivosInttraEnvio + '\Gerados');
  ArquivosInttraEnvioEnviados := FileExistsForce(ArquivosInttraEnvio + '\Enviados');
  ArquivosInttraEnvioErro := FileExistsForce(ArquivosInttraEnvio + '\Erro');

  ArquivosInttraRetorno  := FileExistsForce(ArquivosInttra + '\Retorno');
  ArquivosInttraRetornoCopiados  := FileExistsForce(ArquivosInttraRetorno + '\Copiados');
  ArquivosInttraRetornoLidosRenomeados  := FileExistsForce(ArquivosInttraRetorno + '\LidosRenomeados');
  ArquivosInttraRetornoContrlx := FileExistsForce(ArquivosInttraRetorno + '\Contrlx');
end;

procedure TfrmCdDraftBL.FormDestroy(Sender: TObject);
begin
  ItensExcluirContainer.Free;
  dmGerarArquivosDraft.free;
  inherited;
end;

procedure TfrmCdDraftBL.FormShow(Sender: TObject);
begin
  inherited;
  dtmConfiguracoes.CarregarConfiguracoes;
end;

end.
