unit uRE_NOVOEX;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, Mask, DBCtrls, cxControls, cxContainer,
  cxEdit, cxGroupBox, Buttons, cxTextEdit, cxDBEdit, cxRadioGroup,
  cxStyles, cxCustomData, cxGraphics, cxFilter, cxData, cxDataStorage,
  cxClasses, cxGridCustomView, cxGridCustomTableView, cxGridTableView,
  cxGridBandedTableView, cxGridLevel, cxGrid, DB, cxDBData,
  cxGridDBTableView, cxGridDBBandedTableView, StrUtils, cxLabel, cxDBLabel,
  ComCtrls, ToolWin, ImgList, dbcgrids, dRE_NOVOEX,
  FormsLog, cxLookAndFeels, cxLookAndFeelPainters, dxSkinsCore,
  dxSkinsDefaultPainters, dxSkinscxPCPainter; // Este sempre depois das uses Forms e Classes - Michel - 22/03/2013;

const
  _ARQUIVO_JA_EXISTE = 'O arquivo de lote enviado já existe na base de dados.';

type
  TStatusRE = (srePadrao, sreConsulta, sreTransmissao);

type
  TfrmRE_NovoEx = class(TForm)
    pnlMenu: TPanel;
    lblDiagnostico: TLabel;
    lblExportador: TLabel;
    lblEnquadramento: TLabel;
    lblGerais: TLabel;
    lblMercadoria: TLabel;
    pnlDados: TPanel;
    nbTelas: TNotebook;
    pnlInformacoes: TPanel;
    Bevel1: TBevel;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Bevel2: TBevel;
    Bevel3: TBevel;
    Label13: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    lblTituloDrawback: TLabel;
    lblTituloCCTPC: TLabel;
    lblTituloFabricante: TLabel;
    Label19: TLabel;
    Label20: TLabel;
    sbDadosGerais: TScrollBox;
    gbDadosImportador: TcxGroupBox;
    Label39: TLabel;
    Label40: TLabel;
    Label41: TLabel;
    dbedt_3_ImportadorNome: TDBEdit;
    dbedt_3_ImportadorEndereco: TDBEdit;
    dbedt_3_PaisImportador: TDBEdit;
    btn_3_PaisImportador: TSpeedButton;
    gbDadosOperacaoExportacao: TcxGroupBox;
    Label44: TLabel;
    btn_3_PaisDestino: TSpeedButton;
    dbedt_3_PaisDestino: TDBEdit;
    dblcb_3_PaisDestino: TDBLookupComboBox;
    dbedt_3_InstrumentoNegociacao: TDBEdit;
    Label42: TLabel;
    btn_3_InstrumentoNegociacao: TSpeedButton;
    dblcb_3_InstrumentoNegociacao: TDBLookupComboBox;
    dbedt_3_RFDespacho: TDBEdit;
    Label43: TLabel;
    btn_3_RFDespacho: TSpeedButton;
    dblcb_3_RFDespacho: TDBLookupComboBox;
    dbedt_3_RFEmbarque: TDBEdit;
    Label45: TLabel;
    btn_3_RFEmbarque: TSpeedButton;
    dblcb_3_RFEmbarque: TDBLookupComboBox;
    Label46: TLabel;
    dbedt_3_CondicaoVenda: TDBEdit;
    dblcb_3_CondicaoVenda: TDBLookupComboBox;
    dbcbo_3_ModalidadePagamento: TDBLookupComboBox;
    Label47: TLabel;
    Label48: TLabel;
    dbedt_3_Moeda: TDBEdit;
    btn_3_Moeda: TSpeedButton;
    dblcb_3_Moeda: TDBLookupComboBox;
    gbValoresOperacaoExp: TcxGroupBox;
    Label49: TLabel;
    dbedt_3_ValorComCoberturaCambial: TDBEdit;
    Label50: TLabel;
    dbedt_3_ValorSemCoberturaCambial: TDBEdit;
    Label51: TLabel;
    Label52: TLabel;
    Label53: TLabel;
    Label54: TLabel;
    Label55: TLabel;
    sbDadosMercadoria: TScrollBox;
    Label59: TLabel;
    dbrg_4_ExportadorUnicoFabricante: TcxDBRadioGroup;
    gbMercadoria: TcxGroupBox;
    Label56: TLabel;
    dbedt_4_NCM: TDBEdit;
    btn_4_NCM: TSpeedButton;
    Label57: TLabel;
    dbedt_4_Naladi: TDBEdit;
    dblcb_4_Naladi: TDBLookupComboBox;
    Label58: TLabel;
    gbConsolidacaoItensMercadoria: TcxGroupBox;
    Label60: TLabel;
    Label61: TLabel;
    dbedt_4_UnidadeMedidaComerc: TDBEdit;
    dbedt_4_PrazoPagamento: TDBEdit;
    Bevel4: TBevel;
    Label62: TLabel;
    Label63: TLabel;
    Label64: TLabel;
    Label65: TLabel;
    Label66: TLabel;
    Label67: TLabel;
    Label68: TLabel;
    Label69: TLabel;
    Label71: TLabel;
    Label74: TLabel;
    Label75: TLabel;
    Label76: TLabel;
    gbComissaoAgente: TcxGroupBox;
    Label83: TLabel;
    dbedt_4_Comissao: TDBEdit;
    Label84: TLabel;
    Label85: TLabel;
    gbCategoriaCota: TcxGroupBox;
    Label86: TLabel;
    dbedt_4_CategoriaCota: TDBEdit;
    btn_4_CategoriaCota: TSpeedButton;
    dbedt_4_CategoriaCotaNome: TDBEdit;
    gbObservacao: TcxGroupBox;
    dbedt_4_Descricao: TDBMemo;
    sbDrawback: TScrollBox;
    gbDrawback: TcxGroupBox;
    Label88: TLabel;
    Label89: TLabel;
    Label90: TLabel;
    Label91: TLabel;
    Label92: TLabel;
    Label93: TLabel;
    Label94: TLabel;
    Label95: TLabel;
    Label96: TLabel;
    dbedt_5_CNPJ: TDBEdit;
    dbedt_5_NCM: TDBEdit;
    dbedt_5_AtoConcessorio: TDBEdit;
    dbedt_5_Item: TDBEdit;
    dbedt_5_ValorMoedaComCobertura: TDBEdit;
    dbedt_5_ValorMoedaSemCobertura: TDBEdit;
    dbedt_5_ValorDolarComCobertura: TDBEdit;
    dbedt_5_ValorDolarSemCobertura: TDBEdit;
    dbedt_5_Quantidade: TDBEdit;
    btn_5_Incluir: TButton;
    btn_5_Atualizar: TButton;
    btn_5_Excluir: TButton;
    cxglDrawback: TcxGridLevel;
    cxgDrawback: TcxGrid;
    cxgdbbtvDrawback: TcxGridDBBandedTableView;
    cxgdbbcDrawbackCNPJ: TcxGridDBBandedColumn;
    cxgdbbcDrawbackNCM: TcxGridDBBandedColumn;
    cxgdbbcDrawbackAtoConcessorio: TcxGridDBBandedColumn;
    cxgdbbcDrawbackItem: TcxGridDBBandedColumn;
    cxgdbbcDrawbackQuantidade: TcxGridDBBandedColumn;
    cxgdbbcDrawbackValorREComCobertura: TcxGridDBBandedColumn;
    cxgdbbcDrawbackValorRESemCobertura: TcxGridDBBandedColumn;
    cxgdbbcDrawbackNF: TcxGridDBBandedColumn;
    cxgdbbcDrawbackEditar: TcxGridDBBandedColumn;
    sbCCPTC_CCROM: TScrollBox;
    gbCCPTC_CCROM: TcxGroupBox;
    Label98: TLabel;
    Label99: TLabel;
    Label100: TLabel;
    Label102: TLabel;
    Label103: TLabel;
    Label104: TLabel;
    Label105: TLabel;
    dbedt_6_CCPTC: TDBEdit;
    dbedt_6_NCM: TDBEdit;
    dbedt_6_UnidadeMedida: TDBEdit;
    dbedt_6_Quantidade: TDBEdit;
    btn_6_Incluir: TButton;
    btn_6_Atualizar: TButton;
    btn_6_Excluir: TButton;
    cxgCCPTC: TcxGrid;
    cxglCCPTC: TcxGridLevel;
    cxgdbtvCCPTC: TcxGridDBTableView;
    cxgdbbcCCPTC: TcxGridDBColumn;
    cxgdbbcNCM: TcxGridDBColumn;
    cxgdbbcUnidadeMedida: TcxGridDBColumn;
    cxgdbbcQuantidade: TcxGridDBColumn;
    cxgdbbcEditar: TcxGridDBColumn;
    sbDadosFabricante: TScrollBox;
    gbSaldos: TcxGroupBox;
    Label107: TLabel;
    Label97: TLabel;
    Label101: TLabel;
    Label106: TLabel;
    Label108: TLabel;
    Label109: TLabel;
    gbDadosFabricante: TcxGroupBox;
    Label110: TLabel;
    dbedt_7_UF: TDBEdit;
    btn_7_UF: TSpeedButton;
    Label111: TLabel;
    Label112: TLabel;
    dbedt_7_Quantidade: TDBEdit;
    Label113: TLabel;
    dbedt_7_UnidadeMedida: TDBEdit;
    Label114: TLabel;
    dbedt_7_PesoLiquido: TDBEdit;
    Label115: TLabel;
    dbedt_7_ValorRELE: TDBEdit;
    Label116: TLabel;
    btn_7_Incluir: TButton;
    btn_7_Atualizar: TButton;
    btn_7_Excluir: TButton;
    dbmm_7_Observacoes: TDBMemo;
    cxgFabricante: TcxGrid;
    cxgdbbtvFabricante: TcxGridDBBandedTableView;
    cxgdbbcFabricante_CNPJ: TcxGridDBBandedColumn;
    cxgdbbcFabricante_UF: TcxGridDBBandedColumn;
    cxgdbbcFabricante_Quantidade: TcxGridDBBandedColumn;
    cxgdbbcFabricante_PesoLiquido: TcxGridDBBandedColumn;
    cxgdbbcFabricante_ValorMoedaRE: TcxGridDBBandedColumn;
    cxgdbbcFabricante_Editar: TcxGridDBBandedColumn;
    cxglFabricante: TcxGridLevel;
    sbDadosExportador: TScrollBox;
    Panel1: TPanel;
    Label21: TLabel;
    Label22: TLabel;
    dbedt_1_GerenteExportacao: TDBEdit;
    Label23: TLabel;
    dbedt_1_HomePage: TDBEdit;
    gbTelefone: TcxGroupBox;
    Label24: TLabel;
    Label25: TLabel;
    Label27: TLabel;
    Label28: TLabel;
    Label26: TLabel;
    dbcbo_1_TelefoneTipo: TDBComboBox;
    dbedt_1_TelefoneDDD: TDBEdit;
    dbedt_1_TelefoneNumero: TDBEdit;
    btn_1_Telefone_Incluir: TButton;
    btn_1_Telefone_Atualizar: TButton;
    btn_1_Telefone_Excluir: TButton;
    gbCorreioEletronico: TcxGroupBox;
    Label29: TLabel;
    Label30: TLabel;
    dbcbo_1_CorreioEletronicoTipo: TDBComboBox;
    dbedt_1_CorreioEletronicoEndereco: TDBEdit;
    btn_1_CorreioEletronico_Incluir: TButton;
    btn_1_CorreioEletronico_Atualizar: TButton;
    btn_1_CorreioEletronico_Excluir: TButton;
    sbDetalhesEnquadramento: TScrollBox;
    pnlNavegacao: TPanel;
    btnVoltar: TButton;
    btnAvancar: TButton;
    pnlSubMenuMercadoria: TPanel;
    Label6: TLabel;
    lblDrawback: TLabel;
    Label7: TLabel;
    lblCCTPC: TLabel;
    Label8: TLabel;
    lblFabricante: TLabel;
    Label117: TLabel;
    Label118: TLabel;
    Label119: TLabel;
    lblSubMenuLinha: TLabel;
    dbcbo_3_PaisImportador: TDBLookupComboBox;
    Label17: TLabel;
    dblbl_4_NCM_Descricao: TcxDBLabel;
    dblbl_4_ValidadeRE: TcxDBLabel;
    dblbl_4_ValorComissao: TcxDBLabel;
    dblbl_3_ValorTotalOperacao: TcxDBLabel;
    dblbl_4_ValorCondicaoVenda: TcxDBLabel;
    dblbl_4_ValorLocalEmbarque: TcxDBLabel;
    dblbl_4_QuantidadeUnidadeComerc: TcxDBLabel;
    dblbl_4_QuantidadeUnidadeEstat: TcxDBLabel;
    dblbl_4_QuantidadeQuilogramaLiquido: TcxDBLabel;
    cxDBLabel1: TcxDBLabel;
    cxDBLabel2: TcxDBLabel;
    cxDBLabel4: TcxDBLabel;
    cxDBLabel5: TcxDBLabel;
    Label16: TLabel;
    Label18: TLabel;
    ImageList1: TImageList;
    tbOpcoes: TToolBar;
    btnSalvar: TToolButton;
    ToolButton4: TToolButton;
    btnCancelar: TToolButton;
    dblcb_4_FormaPagamento: TDBLookupComboBox;
    dblbl_Titulo_CNPJ_Exportador: TDBText;
    dblbl_Titulo_NM_Exportador: TDBText;
    ToolButton1: TToolButton;
    btnTransmitir: TToolButton;
    ToolButton2: TToolButton;
    btnClassificar: TToolButton;
    cxGroupBox1: TcxGroupBox;
    Label33: TLabel;
    dbedt_2_Enquadramento1: TDBEdit;
    dblcb_2_Enquadramento1: TDBLookupComboBox;
    dbedt_2_Enquadramento2: TDBEdit;
    dblcb_2_Enquadramento2: TDBLookupComboBox;
    dbedt_2_Enquadramento3: TDBEdit;
    dblcb_2_Enquadramento3: TDBLookupComboBox;
    dbedt_2_Enquadramento4: TDBEdit;
    dblcb_2_Enquadramento4: TDBLookupComboBox;
    Label31: TLabel;
    Label32: TLabel;
    Label34: TLabel;
    dbedt_2_DataLimite: TDBEdit;
    dbedt_2_MargemNaoSacada: TDBEdit;
    dbedt_2_NumeroProcesso: TDBEdit;
    cxGroupBox2: TcxGroupBox;
    Label35: TLabel;
    Label36: TLabel;
    Label37: TLabel;
    Label38: TLabel;
    dbedt_2_NumeroRC: TDBEdit;
    dbedt_2_NumeroRV: TDBEdit;
    dbedt_2_NumeroRE: TDBEdit;
    dbedt_2_NumeroDI: TDBEdit;
    Button7: TButton;
    sbDiagnostico: TScrollBox;
    dbedt_4_SulfixoNCM: TDBEdit;
    dblcb_7_UF_Nome: TDBLookupComboBox;
    tmrJanela: TTimer;
    Label72: TLabel;
    dblbl_Titulo_IDArquivo: TDBText;
    Panel2: TPanel;
    dbrg_6_CCPTC: TcxDBRadioGroup;
    Panel3: TPanel;
    dbrg_6_CCPTC_Insumos: TcxDBRadioGroup;
    Panel4: TPanel;
    dbrg_6_CCROM: TcxDBRadioGroup;
    Label81: TLabel;
    dblbl_Titulo_NumeroLote: TDBText;
    dblcb_4_UnidadeMedidaComerc: TDBLookupComboBox;
    Label82: TLabel;
    dbedt_7_Fabricante: TDBEdit;
    btn_7_Fabricante: TSpeedButton;
    pnlNavegacaoAdicao: TPanel;
    dbn_4_Mercadoria: TDBNavigator;
    dblbl_4_PosicaoAnexo: TcxDBLabel;
    btn_4_Observacao: TSpeedButton;
    btn_7_Observacao: TSpeedButton;
    reDiagnostico: TRichEdit;
    btn_7_Cancelar: TButton;
    btn_6_Cancelar: TButton;
    btn_5_Cancelar: TButton;
    pnlResumo: TPanel;
    Label120: TLabel;
    Label121: TLabel;
    cxDBLabel3: TcxDBLabel;
    dblbl_Totais_ValorRE: TcxDBLabel;
    dblbl_Totais_ValorAdicoes: TcxDBLabel;
    dblbl_Totais_SaldoRE: TcxDBLabel;
    Label122: TLabel;
    Bevel5: TBevel;
    Bevel6: TBevel;
    Label123: TLabel;
    dblbl_Totais_Itens: TcxDBLabel;
    Label124: TLabel;
    dblbl_Totais_Adicoes: TcxDBLabel;
    Splitter1: TSplitter;
    dblbl_7_SaldoQuantidade: TcxDBLabel;
    dblbl_7_SaldoPesoLiquido: TcxDBLabel;
    dblbl_7_SaldoValorLE: TcxDBLabel;
    dblbl_7_QuantidadeTotal: TcxDBLabel;
    dblbl_7_PesoLiquidoTotal: TcxDBLabel;
    dblbl_7_ValorTotalLE: TcxDBLabel;
    Label125: TLabel;
    dblbl_Totais_ValorFabricantes: TcxDBLabel;
    Label126: TLabel;
    dblbl_Totais_SaldoValorFabricantes: TcxDBLabel;
    Label127: TLabel;
    Bevel7: TBevel;
    Label128: TLabel;
    Label129: TLabel;
    dblbl_Totais_PesoAdicoes: TcxDBLabel;
    Label131: TLabel;
    dblbl_Totais_PesoFabricantes: TcxDBLabel;
    Label132: TLabel;
    dblbl_Totais_SaldoPesoFabricantes: TcxDBLabel;
    dblbl_4_NumeroRE: TDBText;
    Label130: TLabel;
    Label133: TLabel;
    Label134: TLabel;
    dblbl_Totais_ValorMLEAdicoes: TcxDBLabel;
    dblbl_Titulo_NumeroRE: TDBText;
    cxStyleRepository1: TcxStyleRepository;
    cxsHeader: TcxStyle;
    cxgBackGround: TcxStyle;
    cxgMercadorias: TcxGrid;
    cxgdbbtvMercadorias: TcxGridDBBandedTableView;
    cxgdbbtvMercadoriasDBBandedColumn1: TcxGridDBBandedColumn;
    cxgdbbtvMercadoriasDBBandedColumn2: TcxGridDBBandedColumn;
    cxgdbbtvMercadoriasDBBandedColumn3: TcxGridDBBandedColumn;
    cxgdbbtvMercadoriasDBBandedColumn4: TcxGridDBBandedColumn;
    cxgdbbtvMercadoriasDBBandedColumn5: TcxGridDBBandedColumn;
    cxgdbbtvMercadoriasDBBandedColumn6: TcxGridDBBandedColumn;
    cxglMercadorias: TcxGridLevel;
    dblblProcessoSombra: TDBText;
    dblblProcesso: TDBText;
    dbedt_7_Nome_Fabricante: TDBEdit;
    dbedt_7_CNPJ_Fabricante: TDBEdit;
    cxGroupBox3: TcxGroupBox;
    Label70: TLabel;
    Label73: TLabel;
    Label77: TLabel;
    Label79: TLabel;
    dbedt_5_NR_NF: TDBEdit;
    dbedt_5_DT_NF: TDBEdit;
    dbedt_5_QTD_NF: TDBEdit;
    dbedt_5_VL_NF: TDBEdit;
    cxGroupBox4: TcxGroupBox;
    Label78: TLabel;
    Label135: TLabel;
    Label136: TLabel;
    Label138: TLabel;
    cxDBLabel6: TcxDBLabel;
    cxDBLabel8: TcxDBLabel;
    cxDBLabel9: TcxDBLabel;
    cxDBLabel11: TcxDBLabel;
    Label87: TLabel;
    cxDBLabel12: TcxDBLabel;
    Label139: TLabel;
    cxDBLabel13: TcxDBLabel;
    Label80: TLabel;
    dbedt_2_NumeroDSI: TDBEdit;
    btnSeparadorReconsultar: TToolButton;
    btnReconsultar: TToolButton;
    procedure lblDiagnosticoClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure lblDiagnosticoMouseEnter(Sender: TObject);
    procedure lblDiagnosticoMouseLeave(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure nbTelasPageChanged(Sender: TObject);
    procedure btnVoltarClick(Sender: TObject);
    procedure dbedt_2_Enquadramento1Change(Sender: TObject);
    procedure btnSalvarClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure btnTransmitirClick(Sender: TObject);
    procedure btnClassificarClick(Sender: TObject);
    procedure btn_5_IncluirClick(Sender: TObject);
    procedure btn_5_AtualizarClick(Sender: TObject);
    procedure btn_5_ExcluirClick(Sender: TObject);
    procedure btn_6_IncluirClick(Sender: TObject);
    procedure btn_6_AtualizarClick(Sender: TObject);
    procedure btn_6_ExcluirClick(Sender: TObject);
    procedure btn_7_IncluirClick(Sender: TObject);
    procedure btn_7_AtualizarClick(Sender: TObject);
    procedure btn_7_ExcluirClick(Sender: TObject);
    procedure btn_3_PaisImportadorClick(Sender: TObject);
    procedure btn_3_PaisDestinoClick(Sender: TObject);
    procedure btn_3_InstrumentoNegociacaoClick(Sender: TObject);
    procedure btn_3_RFDespachoClick(Sender: TObject);
    procedure btn_3_RFEmbarqueClick(Sender: TObject);
    procedure btn_3_MoedaClick(Sender: TObject);
    procedure btn_4_NCMClick(Sender: TObject);
    procedure btn_7_UFClick(Sender: TObject);
    procedure tmrJanelaTimer(Sender: TObject);
    procedure dblbl_Titulo_NumeroLoteClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btn_7_FabricanteClick(Sender: TObject);
    procedure btn_7_ObservacaoClick(Sender: TObject);
    procedure btn_4_ObservacaoClick(Sender: TObject);
    procedure dbn_4_MercadoriaClick(Sender: TObject; Button: TNavigateBtn);
    procedure btn_7_CancelarClick(Sender: TObject);
    procedure btn_6_CancelarClick(Sender: TObject);
    procedure btn_5_CancelarClick(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure dbedt_7_FabricanteChange(Sender: TObject);
    procedure dbedt_7_CNPJ_FabricanteKeyPress(Sender: TObject;
      var Key: Char);
    procedure btnReconsultarClick(Sender: TObject);
  private
    FArquivoXML: String;
    FHWND: HWND;
    FStatusRE: TStatusRE;
    procedure AtualizaMenuDrawback;
    function DiagnosticoDadosExportador: Boolean;
    function DiagnosticoEnquadramento: Boolean;
    function DiagnosticoDadosGerais: Boolean;
    function DiagnosticoDadosMercadoria: Boolean;
    function DiagnosticoDrawback: Boolean;
    function DiagnosticoCCPTC: Boolean;
    function DiagnosticoDadosFabricante: Boolean;
    procedure WebDocumentComplete(Sender: TObject; const pDisp: IDispatch; var URL: OleVariant);
    function SelecionaDespachante: String;
  public
    function Consiste: Boolean;
    procedure AtualizaMenu;
    function DiagnosticoPaginaAtiva: Boolean;
    function DiagnosticoGeral: Boolean;
    procedure AtualizaBotoes;
    procedure AbreRE(AProcesso, AComplemento: String);
    property StatusRE: TStatusRE read FStatusRE;
  end;

var
  frmRE_NovoEx: TfrmRE_NovoEx;

implementation

uses
  DelRun, uWebModulo, Componentes, ConsOnlineEx, PGGP017, Funcoes;

{$R *.dfm}

procedure TfrmRE_NovoEx.lblDiagnosticoClick(Sender: TObject);
begin
  nbTelas.PageIndex := TLabel(Sender).Tag;
end;

procedure TfrmRE_NovoEx.FormCreate(Sender: TObject);
begin
  Application.CreateForm(TdatmRE_NOVOEX, datmRE_NOVOEX);
  
  FStatusRE := srePadrao;
  CarregaGridView(cxgdbbtvMercadorias);
  CarregaGridView(cxgdbbtvDrawback);
  CarregaGridView(cxgdbtvCCPTC);
  CarregaGridView(cxgdbbtvFabricante);
end;

procedure TfrmRE_NovoEx.lblDiagnosticoMouseEnter(Sender: TObject);
begin
  TLabel(Sender).Font.Color := $00399BFD;
end;

procedure TfrmRE_NovoEx.lblDiagnosticoMouseLeave(Sender: TObject);
begin
  if TLabel(Sender).Tag <> nbTelas.PageIndex then
    TLabel(Sender).Font.Color := clTeal;
end;

procedure TfrmRE_NovoEx.FormShow(Sender: TObject);
begin
  nbTelas.PageIndex := 1;
  ShowWindow(Self.Handle, SW_MAXIMIZE);
end;

procedure TfrmRE_NovoEx.nbTelasPageChanged(Sender: TObject);
var
  XML: TStrings;
begin
  Self.SelectFirst;
  btnVoltar.Enabled  := nbTelas.PageIndex > 1;
  btnAvancar.Enabled := nbTelas.PageIndex < 7;
  pnlNavegacaoAdicao.Visible := nbTelas.PageIndex >= 4;
  AtualizaMenu;
  AtualizaBotoes;

  // Desmarca todos
  lblDiagnosticoMouseLeave(lblDiagnostico);
  lblDiagnosticoMouseLeave(lblExportador);
  lblDiagnosticoMouseLeave(lblEnquadramento);
  lblDiagnosticoMouseLeave(lblGerais);
  lblDiagnosticoMouseLeave(lblMercadoria);
  lblDiagnosticoMouseLeave(lblDrawback);
  lblDiagnosticoMouseLeave(lblCCTPC);
  lblDiagnosticoMouseLeave(lblFabricante);
  // Marca o atual
  case nbTelas.PageIndex of
    0: lblDiagnosticoMouseEnter(lblDiagnostico);
    1: lblDiagnosticoMouseEnter(lblExportador);
    2: lblDiagnosticoMouseEnter(lblEnquadramento);
    3: lblDiagnosticoMouseEnter(lblGerais);
    4: lblDiagnosticoMouseEnter(lblMercadoria);
    5: lblDiagnosticoMouseEnter(lblDrawback);
    6: lblDiagnosticoMouseEnter(lblCCTPC);
    7: lblDiagnosticoMouseEnter(lblFabricante);
  end;
  // Número na página CCPTC e Dados do Fabricante... Para quando o Drawback estiver visivel ou não.
  if nbTelas.PageIndex = lblCCTPC.Tag then
  begin
    if lblDrawback.Visible then
      lblTituloCCTPC.Caption := IntToStr(nbTelas.PageIndex) + Copy(lblTituloCCTPC.Caption, 2, Length(lblTituloCCTPC.Caption) - 1)
    else
      lblTituloCCTPC.Caption := IntToStr(nbTelas.PageIndex - 1) + Copy(lblTituloCCTPC.Caption, 2, Length(lblTituloCCTPC.Caption) - 1);
  end
  else if nbTelas.PageIndex = lblFabricante.Tag then
  begin
    if lblDrawback.Visible then
      lblTituloFabricante.Caption := IntToStr(nbTelas.PageIndex) + Copy(lblTituloFabricante.Caption, 2, Length(lblTituloFabricante.Caption) - 1)
    else
      lblTituloFabricante.Caption := IntToStr(nbTelas.PageIndex - 1) + Copy(lblTituloFabricante.Caption, 2, Length(lblTituloFabricante.Caption) - 1);
  end;
  // Abrir tabelas
  if nbTelas.PageIndex = lblDrawback.Tag then
  begin
    if not datmRE_NOVOEX.qry_RE_Anexo_Drawback.Active then
    begin
      datmRE_NOVOEX.qry_RE_Anexo_Drawback.Prepare;
      datmRE_NOVOEX.qry_RE_Anexo_Drawback.Open;
    end;
  end
  else
  if nbTelas.PageIndex = lblCCTPC.Tag then
  begin
    if not datmRE_NOVOEX.qry_RE_Anexo_CCPTC.Active then
    begin
      datmRE_NOVOEX.qry_RE_Anexo_CCPTC.Prepare;
      datmRE_NOVOEX.qry_RE_Anexo_CCPTC.Open;
    end;
  end
  else
  if nbTelas.PageIndex = lblFabricante.Tag then
  begin
    if not datmRE_NOVOEX.qry_RE_Anexo_Fabric.Active then
    begin
      datmRE_NOVOEX.qry_RE_Anexo_Fabric.Prepare;
      datmRE_NOVOEX.qry_RE_Anexo_Fabric.Open;
    end;
  end;

  if (nbTelas.PageIndex = lblDiagnostico.Tag) then
  begin
    XML := TStringList.Create;
    if datmRE_NOVOEX.GeraXML(XML) then
      XML.SaveToFile('C:\' + datmRE_NOVOEX.Processo + '-' + datmRE_NOVOEX.Complemento + '.xml');
    FreeAndNil(XML);
  end;
end;

procedure TfrmRE_NovoEx.btnVoltarClick(Sender: TObject);
begin
  if btnSalvar.Enabled then
    btnSalvar.Click;
  if ((nbTelas.PageIndex + TComponent(Sender).Tag) = lblDrawback.Tag) and not lblDrawback.Visible then
    nbTelas.PageIndex := nbTelas.PageIndex + (2 * TComponent(Sender).Tag)
  else
    nbTelas.PageIndex := nbTelas.PageIndex + TComponent(Sender).Tag;
end;

procedure TfrmRE_NovoEx.AtualizaMenuDrawback;
begin
  lblDrawback.Visible := (AnsiIndexStr(datmRE_NOVOEX.qry_RE_CapaCD_ENQUAD1.AsString, _ENQUADRAMENTOS_DRAWBACK) >= 0) or
                         (AnsiIndexStr(datmRE_NOVOEX.qry_RE_CapaCD_ENQUAD2.AsString, _ENQUADRAMENTOS_DRAWBACK) >= 0) or
                         (AnsiIndexStr(datmRE_NOVOEX.qry_RE_CapaCD_ENQUAD3.AsString, _ENQUADRAMENTOS_DRAWBACK) >= 0) or
                         (AnsiIndexStr(datmRE_NOVOEX.qry_RE_CapaCD_ENQUAD4.AsString, _ENQUADRAMENTOS_DRAWBACK) >= 0);
  if lblDrawback.Visible then
  begin
    lblSubMenuLinha.Caption     := '|'#13'|'#13'|';
    lblCCTPC.Top                := 25;
    lblFabricante.Top           := 45;
    pnlSubMenuMercadoria.Height := 65;
  end
  else
  begin
    lblSubMenuLinha.Caption     := '|'#13'|';
    lblCCTPC.Top                := 5;
    lblFabricante.Top           := 25;
    pnlSubMenuMercadoria.Height := 45;
  end;
end;

procedure TfrmRE_NovoEx.dbedt_2_Enquadramento1Change(Sender: TObject);
begin
  AtualizaMenuDrawback;
  dbcbo_3_ModalidadePagamento.Enabled := not datmRE_NOVOEX.EnquadramentoSemCobertura;//(dbedt_2_Enquadramento1.Text, dbedt_2_Enquadramento2.Text,
     //dbedt_2_Enquadramento3.Text, dbedt_2_Enquadramento4.Text);
end;

procedure TfrmRE_NovoEx.AtualizaMenu;
begin
  pnlSubMenuMercadoria.Visible := nbTelas.PageIndex >= 4;
  AtualizaMenuDrawback;
end;

function TfrmRE_NovoEx.DiagnosticoCCPTC: Boolean;
begin
  Result := True;
end;

function TfrmRE_NovoEx.DiagnosticoDadosExportador: Boolean;
begin
  Result := True;
end;

function TfrmRE_NovoEx.DiagnosticoDadosFabricante: Boolean;
begin
  Result := True;
end;

function TfrmRE_NovoEx.DiagnosticoDadosGerais: Boolean;
begin
  Result := True;
end;

function TfrmRE_NovoEx.DiagnosticoDadosMercadoria: Boolean;
begin
  Result := True;
end;

function TfrmRE_NovoEx.DiagnosticoDrawback: Boolean;
begin
  Result := True;
end;

function TfrmRE_NovoEx.DiagnosticoEnquadramento: Boolean;
begin
  Result := True;
end;

function TfrmRE_NovoEx.DiagnosticoGeral: Boolean;
begin
  Result := DiagnosticoDadosExportador and
            DiagnosticoEnquadramento   and
            DiagnosticoDadosGerais     and
            DiagnosticoDadosMercadoria and
            DiagnosticoDrawback        and
            DiagnosticoCCPTC           and
            DiagnosticoDadosFabricante;
end;

function TfrmRE_NovoEx.DiagnosticoPaginaAtiva: Boolean;
begin
  case nbTelas.PageIndex of
    1: Result := DiagnosticoDadosExportador;
    2: Result := DiagnosticoEnquadramento;
    3: Result := DiagnosticoDadosGerais;
    4: Result := DiagnosticoDadosMercadoria;
    5: Result := DiagnosticoDrawback;
    6: Result := DiagnosticoCCPTC;
    7: Result := DiagnosticoDadosFabricante;
  else
    Result := True;
  end;
end;

procedure TfrmRE_NovoEx.AtualizaBotoes;
begin
  // Opções Básicas
  btnSalvar.Enabled      := (datmRE_NOVOEX.qry_RE_Capa.State           in [dsEdit, dsInsert]) or (datmRE_NOVOEX.qry_RE_Capa.UpdatesPending) or
                            (datmRE_NOVOEX.qry_RE_Anexo.State          in [dsEdit, dsInsert]) or (datmRE_NOVOEX.qry_RE_Anexo.UpdatesPending) or
                            (datmRE_NOVOEX.qry_RE_Anexo_Itens.State    in [dsEdit, dsInsert]) or (datmRE_NOVOEX.qry_RE_Anexo_Itens.UpdatesPending) or
                            (datmRE_NOVOEX.qry_RE_Anexo_Fabric.State   in [dsEdit, dsInsert]) or (datmRE_NOVOEX.qry_RE_Anexo_Fabric.UpdatesPending) or
                            (datmRE_NOVOEX.qry_RE_Anexo_Drawback.State in [dsEdit, dsInsert]) or (datmRE_NOVOEX.qry_RE_Anexo_Drawback.UpdatesPending) or
                            (datmRE_NOVOEX.qry_RE_Anexo_CCPTC.State    in [dsEdit, dsInsert]) or (datmRE_NOVOEX.qry_RE_Anexo_CCPTC.UpdatesPending);

  btnCancelar.Enabled    := btnSalvar.Enabled;

  btnTransmitir.Enabled  := (not btnSalvar.Enabled) and (
                             (Trim(datmRE_NOVOEX.qry_RE_CapaNR_RE_SISCOMEX.AsString) = '') or
                             (Trim(datmRE_NOVOEX.qry_RE_CapaNR_RE_SISCOMEX.AsString) = '-'));
  //btnClassificar.Enabled := True;
  btnClassificar.Enabled := btnTransmitir.Enabled;

  // Dados Comerciais do Exportador
  btn_1_Telefone_Incluir.Enabled            := False;
  btn_1_Telefone_Atualizar.Enabled          := False;
  btn_1_Telefone_Excluir.Enabled            := False;
  btn_1_CorreioEletronico_Incluir.Enabled   := False;
  btn_1_CorreioEletronico_Atualizar.Enabled := False;
  btn_1_CorreioEletronico_Excluir.Enabled   := False;

  // Drawback
  if not datmRE_NOVOEX.qry_RE_Anexo_Drawback.ControlsDisabled then
  begin
    btn_5_Incluir.Enabled                     := datmRE_NOVOEX.qry_RE_Anexo_Drawback.Active and
                                                 not(datmRE_NOVOEX.qry_RE_Anexo_Drawback.State in [dsEdit, dsInsert]);

    btn_5_Atualizar.Enabled                   := datmRE_NOVOEX.qry_RE_Anexo_Drawback.Active and
                                                 not btn_5_Incluir.Enabled;
                                                 
    btn_5_Cancelar.Enabled                    := btn_5_Atualizar.Enabled;
    btn_5_Excluir.Enabled                     := btn_5_Incluir.Enabled;
  end;

  // CCPTC / CCROM
  if not datmRE_NOVOEX.qry_RE_Anexo_CCPTC.ControlsDisabled then
  begin
    btn_6_Incluir.Enabled                     := datmRE_NOVOEX.qry_RE_Anexo_CCPTC.Active and not(datmRE_NOVOEX.qry_RE_Anexo_CCPTC.State in [dsEdit, dsInsert]);
    btn_6_Atualizar.Enabled                   := datmRE_NOVOEX.qry_RE_Anexo_CCPTC.Active and not btn_6_Incluir.Enabled;
    btn_6_Cancelar.Enabled                    := btn_6_Atualizar.Enabled;
    btn_6_Excluir.Enabled                     := btn_6_Incluir.Enabled;
  end;

  // Dados do Fabricante
  if not datmRE_NOVOEX.qry_RE_Anexo_Fabric.ControlsDisabled then
  begin
    btn_7_Incluir.Enabled                     := datmRE_NOVOEX.qry_RE_Anexo_Fabric.Active and not(datmRE_NOVOEX.qry_RE_Anexo_Fabric.State in [dsEdit, dsInsert]);
    btn_7_Atualizar.Enabled                   := datmRE_NOVOEX.qry_RE_Anexo_Fabric.Active and not btn_7_Incluir.Enabled;
    btn_7_Cancelar.Enabled                    := btn_7_Atualizar.Enabled;
    btn_7_Excluir.Enabled                     := btn_7_Incluir.Enabled;
  end;
end;

procedure TfrmRE_NovoEx.btnSalvarClick(Sender: TObject);
begin
  datmRE_NOVOEX.SaveAll;
  AtualizaBotoes;
  if dbrg_4_ExportadorUnicoFabricante.Focused then
    dbedt_4_NCM.SetFocus;
end;

procedure TfrmRE_NovoEx.btnCancelarClick(Sender: TObject);
begin
  if MessageDlg('Esta opção cancelará qualquer alteração feita após a Abertura ou o última vez em que foi salva alguma informação neste RE.'#13 +
     'Deseja continuar o cancelamento?', mtConfirmation, [mbYes, mbNo], 0) = mrYes then
  begin
    datmRE_NOVOEX.CancelAll;
    AtualizaBotoes;
  end;
end;

procedure TfrmRE_NovoEx.btnTransmitirClick(Sender: TObject);
var
  XML: TStrings;
  Script: TStrings;
  ArquivoScript: String;
  CPF, Senha: String;
begin
  try
    Self.Enabled := False;
  if Consiste then
  begin
    if (Trim(datmRE_NOVOEX.qry_RE_CapaID_ARQUIVO_NOVOEX.AsString) <> '') and (datmRE_NOVOEX.qry_RE_CapaIN_TRANSMISSAO_CONCLUIDA.AsString = '1') and
       (MessageDlg('Este processo já foi transmitido.'#13'Deseja transmití-lo novamente?', mtConfirmation, [mbYes, mbNo], 0) <> mrYes) then
      Exit;

    nbTelas.PageIndex := 1;
    XML       := TStringList.Create;
    Script    := TStringList.Create;
    FStatusRE := sreTransmissao;

    try
      CPF := SelecionaDespachante;
      if CPF <> '' then
      begin
        Senha := TrimRight(ConsultaLookUPSQL('SELECT NM_SENHA FROM TDESPACHANTE (NOLOCK) WHERE CPF_DESPACHANTE = :CPF_DESPACHANTE', 'NM_SENHA', [CPF]));
        if datmRE_NOVOEX.GeraXML(XML) then
        begin
          datmRE_NOVOEX.Edit(datmRE_NOVOEX.ds_RE_Capa);

          case MessageDlg('Deseja que sejam baixados os Extratos Deferidos deste RE?', mtConfirmation, [mbYes, mbNo], 0) of
            mrYes: datmRE_NOVOEX.qry_RE_CapaIN_BAIXA_EXTRATO_DEFERIDO.AsBoolean := True;
          else
            datmRE_NOVOEX.qry_RE_CapaIN_BAIXA_EXTRATO_DEFERIDO.AsBoolean := False;
          end;

          datmRE_NOVOEX.qry_RE_CapaTX_CPF_SISCOMEX.AsString        := CPF;
          datmRE_NOVOEX.qry_RE_CapaCD_USUARIO_TRANSMISSAO.AsString := str_cd_usuario;
          datmRE_NOVOEX.qry_RE_CapaDT_DATA_TRANSMISSAO.AsDateTime  := Now;

          FArquivoXML    := ExtractFilePath(Application.ExeName) + 'NovoEx\' + datmRE_NOVOEX.qry_RE_CapaNR_PROCESSO.AsString + '.xml';
          ArquivoScript  := ExtractFilePath(Application.ExeName) + 'NovoEx\' + datmRE_NOVOEX.qry_RE_CapaNR_PROCESSO.AsString + '.js';

          if not DirectoryExists(ExtractFilePath(Application.ExeName) + 'NovoEx') then
            ForceDirectories(ExtractFilePath(Application.ExeName) + 'NovoEx');

          XML.SaveToFile(FArquivoXML);
          Application.CreateForm(Tfrm_Web, frm_Web);
          frm_web.OnDocumentComplete  := WebDocumentComplete;
          Script.Add('javascript');
          Script.Add('if ((document.getElementById("cpfTemp") != null))');
          Script.Add('{');
          Script.Add('  document.getElementById("cpfTemp").value = "' + CPF + '";');
          Script.Add('  if ((document.getElementById("senhaTemp") != null))');
          Script.Add('    document.getElementById("senhaTemp").value = "' + Senha + '";');
          Script.Add('  if ((document.getElementById("Image7") != null))');
          Script.Add('    document.getElementById("Image7").click();');
          Script.Add('}');
          Script.SaveToFile(ArquivoScript);

          if RunningUnderDelphi then
            frm_Web.Navegar('https://www.webservtre.serpro.gov.br/g33159Secex2/jsp/logon.jsp?ind=1', ArquivoScript)
          else
            frm_Web.Navegar(URL_Exp + 'g33159Secex2/jsp/logon.jsp?ind=1', ArquivoScript);
        end; // GeraXML
      end; // CPF <> ''
    finally
      FStatusRE := srePadrao;
      FreeAndNil(XML);
      FreeAndNil(Script);
    end;
  end;
  finally
    Self.Enabled := True;
  end;
end;

procedure TfrmRE_NovoEx.btnClassificarClick(Sender: TObject);
begin
  datmRE_NOVOEX.ClassificaAnexos;
  nbTelasPageChanged(nbTelas);     
end;

procedure TfrmRE_NovoEx.btn_5_IncluirClick(Sender: TObject);
begin
  datmRE_NOVOEX.Insert(datmRE_NOVOEX.ds_RE_Anexo_Drawback);
end;

procedure TfrmRE_NovoEx.btn_5_AtualizarClick(Sender: TObject);
begin
  datmRE_NOVOEX.qry_RE_Anexo_Drawback.Post;
end;

procedure TfrmRE_NovoEx.btn_5_ExcluirClick(Sender: TObject);
begin
  datmRE_NOVOEX.Delete(datmRE_NOVOEX.ds_RE_Anexo_Drawback);
end;

procedure TfrmRE_NovoEx.btn_6_IncluirClick(Sender: TObject);
begin
  datmRE_NOVOEX.Insert(datmRE_NOVOEX.ds_RE_Anexo_CCPTC);
end;

procedure TfrmRE_NovoEx.btn_6_AtualizarClick(Sender: TObject);
begin
  datmRE_NOVOEX.qry_RE_Anexo_CCPTC.Post;
end;

procedure TfrmRE_NovoEx.btn_6_ExcluirClick(Sender: TObject);
begin
  datmRE_NOVOEX.Delete(datmRE_NOVOEX.ds_RE_Anexo_CCPTC);
end;

procedure TfrmRE_NovoEx.btn_7_IncluirClick(Sender: TObject);
begin
  datmRE_NOVOEX.Insert(datmRE_NOVOEX.ds_RE_Anexo_Fabric);
end;

procedure TfrmRE_NovoEx.btn_7_AtualizarClick(Sender: TObject);
begin
  datmRE_NOVOEX.qry_RE_Anexo_Fabric.Post;
end;

procedure TfrmRE_NovoEx.btn_7_ExcluirClick(Sender: TObject);
begin
  datmRE_NOVOEX.Delete(datmRE_NOVOEX.ds_RE_Anexo_Fabric);
end;

procedure TfrmRE_NovoEx.btn_3_PaisImportadorClick(Sender: TObject);
begin
  datmRE_NOVOEX.EditLookupField(datmRE_NOVOEX.ds_RE_Capa, datmRE_NOVOEX.qry_RE_CapaCD_PAIS_IMPORTADOR,
     'TPAIS_BROKER', 'Selecione o País do Importador', '', ['CD_PAIS', 'NM_PAIS'], ['Código', 'País'], 'CD_PAIS', 1);
end;

procedure TfrmRE_NovoEx.btn_3_PaisDestinoClick(Sender: TObject);
begin
  datmRE_NOVOEX.EditLookupField(datmRE_NOVOEX.ds_RE_Capa, datmRE_NOVOEX.qry_RE_CapaCD_PAIS_FINAL,
     'TPAIS_BROKER', 'Selecione o País de Destino', '', ['CD_PAIS', 'NM_PAIS'], ['Código', 'País'], 'CD_PAIS', 1);
end;

procedure TfrmRE_NovoEx.btn_3_InstrumentoNegociacaoClick(Sender: TObject);
begin
  datmRE_NOVOEX.EditLookupField(datmRE_NOVOEX.ds_RE_Capa, datmRE_NOVOEX.qry_RE_CapaCD_INST_NEGO,
     'TINST_NEGOC', 'Selecione o Instrumento de Negociação', 'IN_ATIVO = "1"', ['CD_INST_NEGOC', 'NM_INST_NEGOC'],
     ['Código', 'Instrumento'], 'CD_INST_NEGOC', 1);
end;

procedure TfrmRE_NovoEx.btn_3_RFDespachoClick(Sender: TObject);
begin
  datmRE_NOVOEX.EditLookupField(datmRE_NOVOEX.ds_RE_Capa, datmRE_NOVOEX.qry_RE_CapaCD_URF_DESPACHO,
     'TURF', 'Selecione a URF', '', ['CODIGO', 'DESCRICAO'], ['Código', 'URF'], 'CODIGO', 1);
end;

procedure TfrmRE_NovoEx.btn_3_RFEmbarqueClick(Sender: TObject);
begin
  datmRE_NOVOEX.EditLookupField(datmRE_NOVOEX.ds_RE_Capa, datmRE_NOVOEX.qry_RE_CapaCD_URF_EMBARQUE,
     'TURF', 'Selecione a URF', '', ['CODIGO', 'DESCRICAO'], ['Código', 'URF'], 'CODIGO', 1);
end;

procedure TfrmRE_NovoEx.btn_3_MoedaClick(Sender: TObject);
begin
  datmRE_NOVOEX.EditLookupField(datmRE_NOVOEX.ds_RE_Capa, datmRE_NOVOEX.qry_RE_CapaCD_MOEDA,
     'TMOEDA_BROKER', 'Selecione a Moeda', 'IN_ATIVO = "1"', ['CD_MOEDA', 'NM_MOEDA'], ['Código', 'Moeda'], 'CD_MOEDA', 1);
end;

procedure TfrmRE_NovoEx.btn_4_NCMClick(Sender: TObject);
begin
  datmRE_NOVOEX.EditLookupField(datmRE_NOVOEX.ds_RE_Anexo, datmRE_NOVOEX.qry_RE_AnexoCD_NCM,
     'TNCM', 'Selecione o NCM', '', ['CODIGO', 'DESCRICAO'], ['NCM', 'Nome'], 'CODIGO', 1);
end;

procedure TfrmRE_NovoEx.btn_7_UFClick(Sender: TObject);
begin
  datmRE_NOVOEX.EditLookupField(datmRE_NOVOEX.ds_RE_Anexo_Fabric, datmRE_NOVOEX.qry_RE_Anexo_FabricUF,
     'TUF', 'Selecione o Estado', '', ['CD_UF', 'NM_UF'], ['Sigla', 'Nome'], 'CD_UF', 1);
end;

procedure TfrmRE_NovoEx.tmrJanelaTimer(Sender: TObject);
var
  AW: HWND;
  CN: array[0..MAX_PATH] of Char;
  I: Integer;
begin
  try
    tmrJanela.Enabled := False;
    AW := GetActiveWindow;
    if AW <> FHWND then
    begin
      FHWND := AW;
      GetClassName(AW, CN, MAX_PATH);
      if StrPas(CN) = '#32770' then
      begin
        ListarComponentes(AW);
        I := 0;
        while (I < High(Comps)) and (CompareText(Comps[I].ClassName, 'Edit') <> 0) do
          Inc(I);
        if I <= High(Comps) then
        begin
          SendText(Comps[I].Hnd, FArquivoXML);
          Application.ProcessMessages;
          I := 0;
          while (I < High(Comps)) and ((CompareText(Comps[I].ClassName, 'Button') <> 0) or
             (CompareText(StringReplace(Comps[I].Text, '&', '', [rfReplaceAll]), 'Abrir') <> 0)) do
            Inc(I);
          if I <= High(Comps) then
          begin
            SendClick(Comps[I].Hnd);
            Application.ProcessMessages;
          end;
        end;
      end;
    end;
  finally
    tmrJanela.Enabled := True;
  end;
end;

function TfrmRE_NovoEx.Consiste: Boolean;
  procedure AdicionaTitulo(ATitulo: String);
  begin
    if reDiagnostico.Lines.IndexOf(ATitulo) < 0 then
    begin
      reDiagnostico.SelStart              := Length(reDiagnostico.Lines.Text);
      reDiagnostico.Paragraph.Numbering   := nsNone;
      reDiagnostico.Paragraph.FirstIndent := 10;
      reDiagnostico.Lines.Add(ATitulo);
    end;
  end;
  procedure AdicionaMensagem(AMsg: String);
  begin
    reDiagnostico.SelStart              := Length(reDiagnostico.Lines.Text);
    reDiagnostico.Paragraph.Numbering   := nsBullet;
    reDiagnostico.Paragraph.FirstIndent := 25;
    reDiagnostico.Paragraph.LeftIndent  := 25;
    reDiagnostico.Lines.Add(AMsg);
  end;
var
  Bookmark: Pointer;
begin
  Bookmark := datmRE_NOVOEX.qry_RE_Anexo.GetBookmark;
  datmRE_NOVOEX.qry_RE_Anexo.DisableControls;
  datmRE_NOVOEX.qry_RE_Anexo_Itens.DisableControls;
  datmRE_NOVOEX.qry_RE_Anexo_Fabric.DisableControls;
  datmRE_NOVOEX.qry_RE_Anexo_Drawback.DisableControls;
  datmRE_NOVOEX.qry_RE_Anexo_CCPTC.DisableControls;
  try
    reDiagnostico.Clear;
    //-------------------------------- Totais -------------------------------//
    if FormatFloat('#0.00', datmRE_NOVOEX.qry_TotaisVL_TOTAL_CAPA.AsFloat) <> FormatFloat('#0.00', datmRE_NOVOEX.qry_TotaisVL_MCV_TOTAL_ADICOES.AsFloat) then
    begin
      AdicionaTitulo('Totais');
      AdicionaMensagem('Valor dos Anexos está diferente do valor da Capa');
    end;
    datmRE_NOVOEX.qry_RE_Anexo.First;
    while not datmRE_NOVOEX.qry_RE_Anexo.Eof do
    begin
      //if FormatFloat('#0.00', datmRE_NOVOEX.qry_TotaiscalcVL_TOTAL_FABRICANTE.AsFloat) <> FormatFloat('#0.00', datmRE_NOVOEX.qry_RE_AnexoVL_LOCAL_VENDA.AsFloat) then
      if datmRE_NOVOEX.qry_TotaiscalcVL_SALDO_FABRICANTE.AsFloat <> 0 then
      begin
        AdicionaTitulo('Totais');
        AdicionaMensagem('Valor dos Fabricantes está diferente do Valor do Anexo ' + datmRE_NOVOEX.qry_RE_AnexoCD_RE_ANEXO.AsString);
      end;
      //if FormatFloat('#0.00000', datmRE_NOVOEX.qry_TotaiscalcPL_TOTAL_FABRICANTE.AsFloat) <> FormatFloat('#0.00000', datmRE_NOVOEX.qry_RE_AnexoPESO_LIQUIDO.AsFloat) then
      if datmRE_NOVOEX.qry_TotaiscalcPL_SALDO_FABRICANTE.AsFloat <> 0 then
      begin
        AdicionaTitulo('Totais');
        AdicionaMensagem('Peso Líquido dos Fabricantes está diferente do Peso Líquido do Anexo ' + datmRE_NOVOEX.qry_RE_AnexoCD_RE_ANEXO.AsString);
      end;
      //if FormatFloat('#0.00000', datmRE_NOVOEX.qry_TotaiscalcQT_TOTAL_FABRICANTE.AsFloat) <> FormatFloat('#0.00000', datmRE_NOVOEX.qry_RE_AnexoQT_MEDIA_NBM.AsFloat) then
      if datmRE_NOVOEX.qry_TotaiscalcQT_SALDO_FABRICANTE.AsFloat <> 0 then
      begin
        AdicionaTitulo('Totais');
        AdicionaMensagem('Quantidade da Mercadoria dos Fabricantes está diferente da Quantidade da Mercadoria do Anexo ' + datmRE_NOVOEX.qry_RE_AnexoCD_RE_ANEXO.AsString);
      end;
      datmRE_NOVOEX.qry_RE_Anexo.Next;
    end;
    //-----------------------------------------------------------------------//
    reDiagnostico.Lines.Add('');
    //------------------------ Consistências da Capa ------------------------//
    if Trim(datmRE_NOVOEX.qry_RE_CapaCD_ENQUAD1.AsString) = '' then
    begin
      AdicionaTitulo('Capa - Dados Gerais');
      AdicionaMensagem('Enquadramento não informado');
    end;
    if Trim(datmRE_NOVOEX.qry_RE_CapaCD_PAIS_IMPORTADOR.AsString) = '' then
    begin
      AdicionaTitulo('Capa - Dados Gerais');
      AdicionaMensagem('País do Importador não informado');
    end;
    if Trim(datmRE_NOVOEX.qry_RE_CapaCD_PAIS_FINAL.AsString) = '' then
    begin
      AdicionaTitulo('Capa - Dados Gerais');
      AdicionaMensagem('País de Destino não informado');
    end;
{    if Trim(datmRE_NOVOEX.qry_RE_CapaCD_INST_NEGO.AsString) = '' then
    begin
      AdicionaTitulo('Capa - Dados Gerais');
      AdicionaMensagem('Instrumento de Negociação não informado');
    end;} // Não é mais obrigatório, pois em alguns casos não pode ser preenchido
    if Trim(datmRE_NOVOEX.qry_RE_CapaCD_URF_DESPACHO.AsString) = '' then
    begin
      AdicionaTitulo('Capa - Dados Gerais');
      AdicionaMensagem('RF de Despacho não informado');
    end;
    if Trim(datmRE_NOVOEX.qry_RE_CapaCD_URF_EMBARQUE.AsString) = '' then
    begin
      AdicionaTitulo('Capa - Dados Gerais');
      AdicionaMensagem('RF de Embarque não informado');
    end;
    if Trim(datmRE_NOVOEX.qry_RE_CapaCD_INCOTERM.AsString) = '' then
    begin
      AdicionaTitulo('Capa - Dados Gerais');
      AdicionaMensagem('Condição de Venda não informado');
    end;
    if Trim(datmRE_NOVOEX.qry_RE_CapaCD_MODALIDADE_TRANS.AsString) = '' then
    begin
      AdicionaTitulo('Capa - Dados Gerais');
      AdicionaMensagem('Modalidade de Pagamento não informado');
    end;
    if Trim(datmRE_NOVOEX.qry_RE_CapaCD_MOEDA.AsString) = '' then
    begin
      AdicionaTitulo('Capa - Dados Gerais');
      AdicionaMensagem('Moeda não informada');
    end;
    if datmRE_NOVOEX.qry_TotaisVL_TOTAL_CAPA.AsFloat = 0 then
    begin
      AdicionaTitulo('Capa - Dados Gerais');
      AdicionaMensagem('Valor da Operação não informado');
    end;
    //-----------------------------------------------------------------------//
    reDiagnostico.Lines.Add('');
    //---------------------- Consistências das Adições ----------------------//
    datmRE_NOVOEX.qry_RE_Anexo.First;
    while not datmRE_NOVOEX.qry_RE_Anexo.Eof do
    begin
      if VarIsNull(datmRE_NOVOEX.qry_RE_AnexoQTD_PRAZO_PAGAMENTO.Value) or VarIsEmpty(datmRE_NOVOEX.qry_RE_AnexoQTD_PRAZO_PAGAMENTO.Value) then
      begin
        AdicionaTitulo('Anexo ' + datmRE_NOVOEX.qry_RE_AnexoCD_RE_ANEXO.AsString);
        AdicionaMensagem('UF do Exportador não preenchido');
      end;
      datmRE_NOVOEX.qry_RE_Anexo.Next;
    end;

  finally
    if datmRE_NOVOEX.qry_RE_Anexo.ControlsDisabled then
      datmRE_NOVOEX.qry_RE_Anexo.EnableControls;
    datmRE_NOVOEX.qry_RE_Anexo.GotoBookmark(Bookmark);
    if datmRE_NOVOEX.qry_RE_Anexo_Itens.ControlsDisabled then
      datmRE_NOVOEX.qry_RE_Anexo_Itens.EnableControls;
    if datmRE_NOVOEX.qry_RE_Anexo_Fabric.ControlsDisabled then
      datmRE_NOVOEX.qry_RE_Anexo_Fabric.EnableControls;
    if datmRE_NOVOEX.qry_RE_Anexo_Drawback.ControlsDisabled then
      datmRE_NOVOEX.qry_RE_Anexo_Drawback.EnableControls;
    if datmRE_NOVOEX.qry_RE_Anexo_CCPTC.ControlsDisabled then
      datmRE_NOVOEX.qry_RE_Anexo_CCPTC.EnableControls;
  end;
  //-----------------------------------------------------------------------//
  while (reDiagnostico.Lines.Count > 0) and (reDiagnostico.Lines[0] = '') do
    reDiagnostico.Lines.Delete(0);

  Result := reDiagnostico.Lines.Count = 0;

  if not Result then
  begin
    nbTelas.PageIndex := 0;
    MessageDlg('Foram encontradas algumas inconsistência durante o processo.'#13'Favor verificar antes de prosseguir.', mtWarning, [mbOk], 0)
  end;
end;

procedure TfrmRE_NovoEx.WebDocumentComplete(Sender: TObject; const pDisp: IDispatch;
  var URL: OleVariant);
var
  Script, Pagina: String;
  S, Texto: String;
  Lote: Int64;
  P: Integer;
begin
  Pagina := URL;
  while Pos('/', Pagina) > 0 do
    Delete(Pagina, 1, Pos('/', Pagina));
  // Funções de transmissão
  case FStatusRE of
    sreTransmissao: begin
                      if not frm_Web.WebBrowser1.Silent then
                        frm_Web.WebBrowser1.Silent := True;
                      if CompareText(Pagina, 'index.jsp') = 0 then
                      begin                                  // Página inicial, redirecionar para a página de seleção de arquivo
                        if RunningUnderDelphi then
                          Script := 'location.href = "https://www.webservtre.serpro.gov.br/ExportacaoWeb/SelecionarArqTransmitirMenu.do?lote=RE";'
                        else
                          Script := 'location.href = "' + URL_Exp + 'ExportacaoWeb/SelecionarArqTransmitirMenu.do?lote=RE";'
                      end
                      else if CompareText(Copy(Pagina, 1, 30), 'SelecionarArqTransmitirMenu.do') = 0 then        // Página de seleção de arquivo, preenche com o nome do arquivo
                      begin                        
                        if (not frm_Web.getElementById('myFile').IsNil) and (frm_Web.getElementById('myFile').AsInputElement.value = '') then
                        begin
                          FHWND := Self.Handle;
                          tmrJanela.Enabled := True;
                          Script := '';
                          (*Script := 'if (document.getElementById("myFile") != null)' +
                                    '{' +
                                    '  document.getElementById("myFile").focus();' +
                                    '  document.getElementById("myFile").click();' +
                                    '}';
                          frm_Web.ExecutaScript(Script, 'javascript');
                          Application.ProcessMessages;
                          Sleep(100);
                          Application.ProcessMessages;
                          Script := 'if (document.getElementById("enviar") != null)' +
                                    '{' +
                                    '  document.getElementById("enviar").focus();' +
                                    '  document.getElementById("enviar").click();' +
                                    '}';
                          *)
                        end
                      end                                      
                      else if CompareText(Pagina, 'TransmitirArqEstruturaPropria.do') = 0 then      // Pegar informações da janela
                      begin
                        S := frm_Web.Document.AsHTMLDocument2.body.innerHTML;
                        P := Pos('&nbsp;&nbsp;', S);
                        while (S <> '') and (P > 0) do
                        begin
                          Delete(S, 1, P - 1);
                          while (S <> '') and (Copy(S, 1, 6) = '&nbsp;') do
                            Delete(S, 1, 6);
                          P := Pos('&nbsp;&nbsp;', S);
                          if P = 0 then
                            P := Length(S) + 1;
                          Texto := Texto + #13#10 + Trim(StringReplace(StringReplace(Copy(S, 1, P - 1), #13, '', [rfReplaceAll]), #10, '', [rfReplaceAll]));
                          Delete(S, 1, P - 1);
                          while (S <> '') and (Copy(S, 1, 6) = '&nbsp;') do
                            Delete(S, 1, 6);
                          P := Pos('&nbsp;&nbsp;', S);
                        end;
                        Delete(Texto, 1, 2);
                        P := Pos(':', Texto);
                        if P > 0 then
                        begin
                          S := Trim(Copy(Texto, P + 1, Length(Texto) - P));
                        end
                        else
                          S := 'Erro';
                        tmrJanela.Enabled := not frm_Web.getElementById('myFile').IsNil;
                        if datmRE_NOVOEX.Edit(datmRE_NOVOEX.ds_RE_Capa) then
                        begin
                          if TryStrToInt64(S, Lote) then
                          begin
                            datmRE_NOVOEX.qry_RE_CapaNR_LOTE.AsString := S;
                            datmRE_NOVOEX.qry_RE_CapaIN_TRANSMISSAO_CONCLUIDA.AsString := '1';
                          end
                          else
                          begin
                            datmRE_NOVOEX.qry_RE_CapaNR_LOTE.Clear;
                            datmRE_NOVOEX.qry_RE_CapaIN_TRANSMISSAO_CONCLUIDA.AsString := '0';
                          end;
                          datmRE_NOVOEX.qry_RE_CapaTX_TRANSMISSAO_NOVOEX.AsString    := Texto;
                          datmRE_NOVOEX.qry_RE_CapaNR_RE_SISCOMEX.Clear;
                          datmRE_NOVOEX.Post(datmRE_NOVOEX.ds_RE_Capa);
                          frm_Web.Close;
                          Exit;
                        end;
                      end
                      else
                        Script := 'if (document.getElementById("numeroLote") != null)' +
                                  '  document.getElementById("numeroLote").value = "' + Trim(datmRE_NOVOEX.qry_RE_CapaNR_LOTE.AsString) + '";';
                    end;
    sreConsulta: begin
                   if CompareText(Pagina, 'index.jsp') = 0 then
                   begin
                     if RunningUnderDelphi then
                       Script := 'location.href = "https://www.webservtre.serpro.gov.br/ExportacaoWeb/ConsultarLoteReMenu.do";'
                     else
                       Script := 'location.href = "' + URL_Exp + 'ExportacaoWeb/ConsultarLoteReMenu.do";'
                   end
                   else 
                     Script := 'if (document.getElementById("numeroLote") != null)' +
                               '  document.getElementById("numeroLote").value = "' + Trim(datmRE_NOVOEX.qry_RE_CapaNR_LOTE.AsString) + '";';
                 end;
  end;
  frm_Web.ExecutaScript(Script, 'javascript');
end;

procedure TfrmRE_NovoEx.AbreRE(AProcesso, AComplemento: String);
var
  W: Integer;
begin
  datmRE_NOVOEX.AbreRE(AProcesso, AComplemento);
  datmRE_NOVOEX.qry_Diagnostico.First;
  while not datmRE_NOVOEX.qry_Diagnostico.Eof do
  begin
    reDiagnostico.Lines.Add(datmRE_NOVOEX.qry_DiagnosticoTX_RE.AsString);
    datmRE_NOVOEX.qry_Diagnostico.Next;
  end;

  if (str_cd_cargo <> '001') and (ConsultaLookUPSQL('SELECT ISNULL(IN_MANAGER, "0") AS IN_MANAGER ' +
                                                    'FROM TCARGO ' +
                                                    'WHERE CD_CARGO = :CD_CARGO', 'IN_MANAGER', [str_cd_cargo]) <> '1') then
  begin
    btnSeparadorReconsultar.Visible := False;
    btnReconsultar.Visible := False;
    W := tbOpcoes.Width;
    tbOpcoes.Width  := 116;
    tbOpcoes.Left   := tbOpcoes.Left + (W - tbOpcoes.Width);
  end;

  if (Trim(datmRE_NOVOEX.qry_RE_CapaNR_RE_SISCOMEX.AsString) <> '') and (Trim(datmRE_NOVOEX.qry_RE_CapaNR_LOTE.AsString) <> '') then
  begin
    btnSeparadorReconsultar.Enabled := True;
    btnReconsultar.Enabled := True;
  end;
  
  ShowModal;
end;

procedure TfrmRE_NovoEx.dblbl_Titulo_NumeroLoteClick(Sender: TObject);
var
  Script: TStrings;
  ArquivoScript: String;
  CPF, Senha: String;
begin
  FStatusRE := sreConsulta;
  Script := TStringList.Create;
  try
    if Trim(datmRE_NOVOEX.qry_RE_CapaTX_CPF_SISCOMEX.AsString) <> '' then
      CPF := datmRE_NOVOEX.qry_RE_CapaTX_CPF_SISCOMEX.AsString
    else
      CPF := SelecionaDespachante;

    if CPF <> '' then
    begin
      Senha := TrimRight(ConsultaLookUPSQL('SELECT NM_SENHA FROM TDESPACHANTE (NOLOCK) WHERE CPF_DESPACHANTE = :CPF_DESPACHANTE', 'NM_SENHA', [CPF]));
      ArquivoScript := ExtractFilePath(Application.ExeName) + datmRE_NOVOEX.qry_RE_CapaNR_PROCESSO.AsString + '.js';
      Application.CreateForm(Tfrm_Web, frm_Web);
      frm_web.OnDocumentComplete  := WebDocumentComplete;
      Script.Add('javascript');
      Script.Add('if ((document.getElementById("cpfTemp") != null))');
      Script.Add('{');
      Script.Add('  document.getElementById("cpfTemp").value = "' + CPF + '";');
      Script.Add('  if ((document.getElementById("senhaTemp") != null))');
      Script.Add('    document.getElementById("senhaTemp").value = "' + Senha + '";');
      Script.Add('  if ((document.getElementById("Image7") != null))');
      Script.Add('    document.getElementById("Image7").click();');
      Script.Add('}');
      Script.SaveToFile(ArquivoScript);

      if RunningUnderDelphi then
        frm_Web.Navegar('https://www.webservtre.serpro.gov.br/g33159Secex2/jsp/logon.jsp?ind=1', ArquivoScript)
      else
        frm_Web.Navegar(URL_Exp + 'g33159Secex2/jsp/logon.jsp?ind=1', ArquivoScript);
      FreeAndNil(frm_Web);
    end;
  finally
    FStatusRE := srePadrao;
    FreeAndNil(Script);
  end;
end;

procedure TfrmRE_NovoEx.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
  SalvaGridView(cxgdbbtvMercadorias);
  SalvaGridView(cxgdbbtvDrawback);
  SalvaGridView(cxgdbtvCCPTC);
  SalvaGridView(cxgdbbtvFabricante);
  FreeAndNil(datmRE_NOVOEX);
end;

procedure TfrmRE_NovoEx.btn_7_FabricanteClick(Sender: TObject);
begin
  datmRE_NOVOEX.EditLookupField(datmRE_NOVOEX.ds_RE_Anexo_Fabric, datmRE_NOVOEX.qry_RE_Anexo_FabricCD_FABRICANTE,
     'TEMPRESA_NAC', 'Selecione o Estado', 'IN_ATIVO = "1"',
     ['CD_EMPRESA', 'NM_EMPRESA', 'ISNULL(END_CIDADE, "") + "/" + ISNULL(END_UF, "") AS END_CIDADE', 'CGC_EMPRESA'],
     ['Código', 'Nome', 'Cidade/UF', 'CNPJ'], 'CD_EMPRESA', 1);
end;

procedure TfrmRE_NovoEx.btn_7_ObservacaoClick(Sender: TObject);
var
  OldTxt, NewTxt: String;
  Anexo: Integer;
  Fabricante: String;
begin
  OldTxt := datmRE_NOVOEX.qry_RE_Anexo_FabricTX_OBSERVACAO.AsString;
  datmRE_NOVOEX.EditLookupField(datmRE_NOVOEX.ds_RE_Anexo_Fabric, datmRE_NOVOEX.qry_RE_Anexo_FabricTX_OBSERVACAO, 'TOBSERVACOES',
     'Observações do Fabricante', 'CD_PRODUTO = "02"', ['CD_OBS', 'TX_DESCRICAO', 'TX_OBS'], ['Código', 'Descrição', 'Observação'], 'TX_OBS', 0);
  NewTxt := datmRE_NOVOEX.qry_RE_Anexo_FabricTX_OBSERVACAO.AsString;

  if (OldTxt <> NewTxt) and (MessageDlg('Deseja repassar a observação do Fabricante para os outros fabricantes?', mtConfirmation, [mbYes, mbNo], 0) = mrYes) then
  begin
    Anexo := datmRE_NOVOEX.qry_RE_Anexo_FabricCD_RE_ANEXO.AsInteger;
    Fabricante := datmRE_NOVOEX.qry_RE_Anexo_FabricCD_FABRICANTE.AsString;
    datmRE_NOVOEX.qry_RE_Anexo_Fabric.DisableControls;
    try
      if datmRE_NOVOEX.qry_RE_Anexo_Fabric.State = dsEdit then
        datmRE_NOVOEX.qry_RE_Anexo_Fabric.Post;
      datmRE_NOVOEX.qry_RE_Anexo_Fabric.First;
      while not datmRE_NOVOEX.qry_RE_Anexo_Fabric.Eof do
      begin
        if (VarIsNull(datmRE_NOVOEX.qry_RE_Anexo_FabricTX_OBSERVACAO.OldValue) or VarIsEmpty(datmRE_NOVOEX.qry_RE_Anexo_FabricTX_OBSERVACAO.OldValue)) then
          OldTxt := ''
        else
          OldTxt := datmRE_NOVOEX.qry_RE_Anexo_FabricTX_OBSERVACAO.OldValue;
        if OldTxt <> NewTxt then
        begin
          datmRE_NOVOEX.qry_RE_Anexo_Fabric.Edit;
          datmRE_NOVOEX.qry_RE_Anexo_FabricTX_OBSERVACAO.AsString := NewTxt;
          datmRE_NOVOEX.qry_RE_Anexo_Fabric.Post;
        end;
        datmRE_NOVOEX.qry_RE_Anexo_Fabric.Next;
      end;
    finally
      if datmRE_NOVOEX.qry_RE_Anexo_Fabric.ControlsDisabled then
        datmRE_NOVOEX.qry_RE_Anexo_Fabric.EnableControls;
      datmRE_NOVOEX.qry_RE_Anexo_Fabric.Locate('CD_RE_ANEXO;CD_FABRICANTE', VarArrayOf([Anexo, Fabricante]), []);
    end;
  end;
end;

procedure TfrmRE_NovoEx.btn_4_ObservacaoClick(Sender: TObject);
var
  OldTxt, NewTxt: String;
  Anexo: Integer;
begin
  OldTxt := datmRE_NOVOEX.qry_RE_AnexoTX_DESC_MERCADORIA.AsString;
  datmRE_NOVOEX.EditLookupField(datmRE_NOVOEX.ds_RE_Anexo,
                                datmRE_NOVOEX.qry_RE_AnexoTX_DESC_MERCADORIA, 'TOBSERVACOES',
                               'Observações da Mercadoria',
                               'CD_PRODUTO = "02"',
                               ['CD_OBS', 'TX_DESCRICAO', 'TX_OBS'],
                               ['Código', 'Descrição', 'Observação'], 'TX_OBS', 0, True);
  NewTxt := datmRE_NOVOEX.qry_RE_AnexoTX_DESC_MERCADORIA.AsString;

  if (OldTxt <> NewTxt) and (MessageDlg('Deseja repassar a observação da mercadoria para as outras adições?',
                                         mtConfirmation, [mbYes, mbNo], 0) = mrYes) then
  begin
    Anexo := datmRE_NOVOEX.qry_RE_AnexoCD_RE_ANEXO.AsInteger;
    datmRE_NOVOEX.qry_RE_Anexo.DisableControls;
    try
      if datmRE_NOVOEX.qry_RE_Anexo.State = dsEdit then
        datmRE_NOVOEX.qry_RE_Anexo.Post;

      datmRE_NOVOEX.qry_RE_Anexo.First;
      while not datmRE_NOVOEX.qry_RE_Anexo.Eof do
      begin
        if (VarIsNull(datmRE_NOVOEX.qry_RE_AnexoTX_DESC_MERCADORIA.OldValue) or
            VarIsEmpty(datmRE_NOVOEX.qry_RE_AnexoTX_DESC_MERCADORIA.OldValue)) then
          OldTxt := ''
        else
          OldTxt := datmRE_NOVOEX.qry_RE_AnexoTX_DESC_MERCADORIA.OldValue;

        if OldTxt <> NewTxt then
        begin
          datmRE_NOVOEX.qry_RE_Anexo.Edit;
          datmRE_NOVOEX.qry_RE_AnexoTX_DESC_MERCADORIA.AsString := NewTxt;
          datmRE_NOVOEX.qry_RE_Anexo.Post;
        end;

        datmRE_NOVOEX.qry_RE_Anexo.Next;
      end;

    finally
      if datmRE_NOVOEX.qry_RE_Anexo.ControlsDisabled then
        datmRE_NOVOEX.qry_RE_Anexo.EnableControls;

      datmRE_NOVOEX.qry_RE_Anexo.Locate('CD_RE_ANEXO', Anexo, []);
    end;
  end;
end;

function TfrmRE_NovoEx.SelecionaDespachante: String;
var
  Qtd: Integer;
begin
  Qtd := StrToInt(ConsultaLookUPSQL(' SELECT COUNT(*) AS QTD ' +
                                    ' FROM VW_DESPACHANTE_CLIENTE (NOLOCK) ' +
                                    ' WHERE TIPO = "RE" ' +
                                    '   AND CD_EMPRESA = :CD_EMPRESA', 'QTD', [datmRE_NOVOEX.qry_RE_CapaCD_EXPORTADOR.AsString]));
  if Qtd = 0 then
  begin
    MessageDlg('Nenhum Despachante encontrado para o exportador deste RE.', mtInformation, [mbOk], 0);
    Result := '';
  end
  else if Qtd = 1 then
    Result := ConsultaLookUPSQL(' SELECT CPF_USUARIO ' +
                                ' FROM VW_DESPACHANTE_CLIENTE (NOLOCK) ' +
                                ' WHERE TIPO = "RE" ' +
                                '   AND CD_EMPRESA = :CD_EMPRESA', 'CPF_USUARIO', [datmRE_NOVOEX.qry_RE_CapaCD_EXPORTADOR.AsString])
  else
    Result := TrimRight(ConsultaOnLineExFILTRO('VW_DESPACHANTE_CLIENTE', 'Escolha o Usuário', ['CD_ACESSO', 'NM_USUARIO', 'CPF_USUARIO'],
       ['Código', 'Usuário', 'CPF'], 'CPF_USUARIO', 'TIPO = "RE" AND CD_EMPRESA = :CD_EMPRESA', nil, [datmRE_NOVOEX.qry_RE_CapaCD_EXPORTADOR.AsString], ''));
end;

procedure TfrmRE_NovoEx.dbn_4_MercadoriaClick(Sender: TObject; Button: TNavigateBtn);
begin
  if dbrg_4_ExportadorUnicoFabricante.Focused then
    dbedt_4_NCM.SetFocus;
end;

procedure TfrmRE_NovoEx.btn_7_CancelarClick(Sender: TObject);
begin
  datmRE_NOVOEX.qry_RE_Anexo_Fabric.Cancel;
end;

procedure TfrmRE_NovoEx.btn_6_CancelarClick(Sender: TObject);
begin
  datmRE_NOVOEX.qry_RE_Anexo_CCPTC.Cancel;
end;

procedure TfrmRE_NovoEx.btn_5_CancelarClick(Sender: TObject);
begin
  datmRE_NOVOEX.qry_RE_Anexo_Drawback.Cancel;
end;

procedure TfrmRE_NovoEx.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
  CanClose := True;
  if btnSalvar.Enabled then
    case MessageDlg('Há alterações não salvas.'#13'Deseja salvar antes de sair?', mtConfirmation, [mbYes, mbNo, mbCancel], 0) of
      mrYes: btnSalvar.Click;
      mrNo: begin
              btnCancelar.Click;
              CanClose := not btnSalvar.Enabled; // Porque o usuário pode clicar em Não Cancelar na janela de confirmação para cancelar as alterações
            end;
      mrCancel: CanClose := False;
    end;
end;

procedure TfrmRE_NovoEx.dbedt_7_FabricanteChange(Sender: TObject);
begin
  dbedt_7_Nome_Fabricante.ReadOnly := Trim(dbedt_7_Fabricante.Text) <> '';
  dbedt_7_CNPJ_Fabricante.ReadOnly := dbedt_7_Nome_Fabricante.ReadOnly;

  if dbedt_7_Nome_Fabricante.ReadOnly then
    dbedt_7_Nome_Fabricante.Color := clMenu
  else
    dbedt_7_Nome_Fabricante.Color := clWindow;
  dbedt_7_CNPJ_Fabricante.Color := dbedt_7_Nome_Fabricante.Color;
end;

procedure TfrmRE_NovoEx.dbedt_7_CNPJ_FabricanteKeyPress(Sender: TObject;
  var Key: Char);
begin
  if not (Key in [#8, '0', '1', '2', '3', '4', '5', '6', '7', '8', '9']) then
    Key := #0;
end;

procedure TfrmRE_NovoEx.btnReconsultarClick(Sender: TObject);
begin
  if MessageDlg('Deseja realmente apagar o registro para refazer a consulta?', mtConfirmation, [mbYes, mbNo], 0) = mrYes then
  begin
    datmRE_NOVOEX.qry_RE_Capa.Edit;
    datmRE_NOVOEX.qry_RE_CapaNR_RE_SISCOMEX.AsString := '';
    datmRE_NOVOEX.SaveAll;
  end;
end;

end.
