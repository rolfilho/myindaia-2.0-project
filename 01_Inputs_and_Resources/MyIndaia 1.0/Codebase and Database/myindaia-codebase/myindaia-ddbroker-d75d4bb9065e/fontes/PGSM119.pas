unit PGSM119;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Buttons, ExtCtrls, Db, DBTables, Grids, DBGrids, Menus, StdCtrls,
  DBCtrls, Mask, ComCtrls, DBCGrids, PGGP001, ConsOnlineEx,Variants,
  ToolEdit, RxLookup, StrUtils, RXDBCtrl;

type
  TPageControl = class(ComCtrls.TPageControl)
  private
    FOldPageIndex: Integer;
    FNewPageIndex: Integer;
  protected
    function CanChange: Boolean; override;
  public
    constructor Create(AOwner: TComponent); override;
    property OldPageIndex: Integer read FOldPageIndex;
    property NewPageIndex: Integer read FNewPageIndex;
  end;

type

  Tfrm_grupo = class(TForm)
    pgctrl_grupo: TPageControl;
    ts_lista: TTabSheet;
    ts_dados_basicos: TTabSheet;
    pnl_entrada_de_dados: TPanel;
    dbg_cadastro: TDBGrid;
    menu_cadastro: TMainMenu;
    mi_incluir: TMenuItem;
    mi_excluir: TMenuItem;
    mi_sair: TMenuItem;
    Label3: TLabel;
    dbedt_cd_grupo: TDBEdit;
    Label4: TLabel;
    dbedt_nm_grupo: TDBEdit;
    mi_salvar: TMenuItem;
    mi_cancelar: TMenuItem;
    lblAtivo: TLabel;
    dblkpcbox_ativo: TDBLookupComboBox;
    dbedt_dt_inclusao: TDBEdit;
    lbl_dt_inclusao: TLabel;
    lbl_cnpj: TLabel;
    dbedt_cnpj_grupo: TDBEdit;
    pnl_cadastro: TPanel;
    Panel1: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    edt_chave: TEdit;
    cb_ordem: TComboBox;
    btn_incluir: TSpeedButton;
    btn_excluir: TSpeedButton;
    btn_sair: TSpeedButton;
    btn_salvar: TSpeedButton;
    btn_cancelar: TSpeedButton;
    dbnvg: TDBNavigator;
    lblRateio: TLabel;
    dblckRateio: TDBLookupComboBox;
    dbedtCdLayout: TDBEdit;
    dbedtNmLayout: TDBEdit;
    lbl1: TLabel;
    btnCoBordero: TSpeedButton;
    DBCheckBox1: TDBCheckBox;
    DBCheckBox2: TDBCheckBox;
    DBRadioGroup1: TDBRadioGroup;
    DBCheckBox3: TDBCheckBox;
    ts_Itens: TTabSheet;
    shp1: TShape;
    lbl2: TLabel;
    dbgrdListaArm: TDBGrid;
    lbl_pais: TLabel;
    btn_item: TSpeedButton;
    dbedt_nm_item: TEdit;
    dbedt_cd_Item: TDBEdit;
    Label5: TLabel;
    dbedt_nr_rel_consolidado: TDBEdit;
    dblkpTpPedido: TDBLookupComboBox;
    Label6: TLabel;
    GroupBox1: TGroupBox;
    dbedt_email_criacao: TDBEdit;
    dbedt_email_validacao: TDBEdit;
    dbedt_email_autorizacao: TDBEdit;
    dbchk_email_criacao: TDBCheckBox;
    dbchk_email_validacao: TDBCheckBox;
    dbchk_email_autorizacao: TDBCheckBox;
    dbchk_fornecimento: TDBCheckBox;
    dbchk_packing: TDBCheckBox;
    dbchk_modo_simples: TDBCheckBox;
    dbchk_rap_sequencial: TDBCheckBox;
    dbchk_envia_arquivos: TDBCheckBox;
    dbchk_mostra_followup: TDBCheckBox;
    dbchk_exibir_faturados: TDBCheckBox;
    dbchk_divide_embarcados: TDBCheckBox;
    dbchk_conferencia: TDBCheckBox;
    dbchkE01: TDBCheckBox;
    DBCheckBox5: TDBCheckBox;
    DBRadioGroup2: TDBRadioGroup;
    chk_grupo: TCheckBox;
    ts_Conta_Bancaria: TTabSheet;
    db_contas_bancarias: TDBGrid;
    lbl_banco: TLabel;
    dbchk_envia_como_ti: TDBCheckBox;
    Shape1: TShape;
    db_cliente: TDBEdit;
    db_cd_cliente: TDBEdit;
    db_cd_servico: TDBEdit;
    db_servico: TDBEdit;
    db_cd_banco_adiantamento: TDBEdit;
    db_banco_adiantamento: TDBEdit;
    db_cd_banco_icms: TDBEdit;
    db_banco_icms: TDBEdit;
    db_banco_impostos: TDBEdit;
    db_cd_banco_impostos: TDBEdit;
    db_cd_banco_despesa_indaia: TDBEdit;
    db_banco_despesa_indaia: TDBEdit;
    db_cd_banco_despesa_cliente: TDBEdit;
    db_banco_despesa_cliente: TDBEdit;
    Label9: TLabel;
    Label8: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    Label16: TLabel;
    Label17: TLabel;
    Label10: TLabel;
    Label7: TLabel;
    Label18: TLabel;
    Label19: TLabel;
    Label20: TLabel;
    lbl_banco1: TLabel;
    lbl_banco2: TLabel;
    lbl_banco4: TLabel;
    lbl_banco3: TLabel;
    lbl_banco5: TLabel;
    DBCheckBox6: TDBCheckBox;
    dblkpTpPedidoImp: TDBLookupComboBox;
    Label22: TLabel;
    ts_disparo_automatico: TTabSheet;
    pnl_disparo: TPanel;
    pgctrl_documento: TPageControl;
    ts_lista_disparo: TTabSheet;
    DBGrid1: TDBGrid;
    ts_dados_disparo: TTabSheet;
    Label23: TLabel;
    Label24: TLabel;
    Label25: TLabel;
    Label26: TLabel;
    Shape3: TShape;
    Shape4: TShape;
    Label28: TLabel;
    file_path: TFilenameEdit;
    DBEdit1: TDBEdit;
    DBCheckBox7: TDBCheckBox;
    ts_usuarios: TTabSheet;
    Panel3: TPanel;
    Label124: TLabel;
    DBText2: TDBText;
    DBText1: TDBText;
    Label125: TLabel;
    DBGrid2: TDBGrid;
    Panel4: TPanel;
    Panel15: TPanel;
    pnlCampos: TPanel;
    Shape15: TShape;
    btn_co_usuario: TSpeedButton;
    Label126: TLabel;
    Label127: TLabel;
    Edit2: TEdit;
    edt_horarios: TEdit;
    MaskEdit1: TMaskEdit;
    DBEdit3: TDBEdit;
    pnl_config_disparo: TPanel;
    lbl17: TLabel;
    btn14: TSpeedButton;
    lbl19: TLabel;
    btn16: TSpeedButton;
    lbl20: TLabel;
    btn17: TSpeedButton;
    lbl21: TLabel;
    btn18: TSpeedButton;
    lbl22: TLabel;
    btn19: TSpeedButton;
    lbl16: TLabel;
    btn20: TSpeedButton;
    Label86: TLabel;
    SpeedButton60: TSpeedButton;
    Label93: TLabel;
    SpeedButton67: TSpeedButton;
    Label85: TLabel;
    SpeedButton59: TSpeedButton;
    ed28: TEdit;
    ed29: TEdit;
    ed32: TEdit;
    ed33: TEdit;
    ed34: TEdit;
    ed35: TEdit;
    ed36: TEdit;
    ed37: TEdit;
    ed38: TEdit;
    ed39: TEdit;
    ed41: TEdit;
    ed40: TEdit;
    dbedtModal: TDBEdit;
    Edit123: TEdit;
    Edit135: TEdit;
    Edit136: TEdit;
    Edit121: TEdit;
    Edit122: TEdit;
    pnl_filtro_disparo: TPanel;
    Label27: TLabel;
    dblkpProduto: TRxDBLookupCombo;
    chk_ativo_disparo: TCheckBox;
    popGridUsuarios: TPopupMenu;
    Aplicarhorriosparatodososusurios1: TMenuItem;
    lblE01: TLabel;
    edt_chave_disparo: TEdit;
    SpeedButton1: TSpeedButton;
    pnl_aviso_generico: TPanel;
    Shape2: TShape;
    Memo1: TMemo;
    Label29: TLabel;
    dbedtLucroEstimado: TDBEdit;
    Label30: TLabel;
    dbedtICMS_ATE: TDBEdit;
    edt_cd_urf_despacho: TEdit;
    edt_nm_urf_despacho: TEdit;
    spd_urf_despacho: TSpeedButton;
    lbl_urf_despacho: TLabel;
    tbsFatores: TTabSheet;
    pgcFatores: TPageControl;
    tbsFatoresLista: TTabSheet;
    tbsFatoresCampos: TTabSheet;
    tbsFatoresEventos: TTabSheet;
    dbgrdFatores: TDBGrid;
    tbsFatoresDadoBasicos: TTabSheet;
    Nome: TLabel;
    dbedtFatoresNome: TDBEdit;
    Label31: TLabel;
    dbmemFatoresDescricao: TDBMemo;
    Label32: TLabel;
    btnFatoresUnidade: TSpeedButton;
    edtFatoresUnidadeNome: TEdit;
    dbedtFatoresUnidadeCodigo: TDBEdit;
    Label33: TLabel;
    btnFatoresProduto: TSpeedButton;
    edtFatoresProdutoNome: TEdit;
    dbedtFatoresProdutoCodigo: TDBEdit;
    Label34: TLabel;
    btnFatoresGrupo: TSpeedButton;
    edtFatoresGrupoNome: TEdit;
    dbedtFatoresGrupoCodigo: TDBEdit;
    gbFatoresValidacao: TGroupBox;
    SpeedButton2: TSpeedButton;
    Label35: TLabel;
    Label36: TLabel;
    SpeedButton3: TSpeedButton;
    Label37: TLabel;
    SpeedButton4: TSpeedButton;
    Label38: TLabel;
    SpeedButton5: TSpeedButton;
    Label39: TLabel;
    Label40: TLabel;
    Label41: TLabel;
    dbmemNM_SQL: TDBMemo;
    gbFatoresTrigger: TGroupBox;
    dbchkOpcional: TDBCheckBox;
    Label42: TLabel;
    SpeedButton6: TSpeedButton;
    Label43: TLabel;
    dbedtNM_CAMPO_PROCESSO: TDBEdit;
    dbedtNM_TABELA: TDBEdit;
    dbedtNM_CAMPO_CHAVE_TABELA: TDBEdit;
    dbedtNM_CAMPO_RETORNO_TABELA: TDBEdit;
    dblupFatoresComparador: TDBLookupComboBox;
    dbedtNM_RETORNO: TDBEdit;
    dbedtNM_TABELA_TRIGGER: TDBEdit;
    dbedtNM_CAMPOS_CHAVE_TRIGGER: TDBEdit;
    pgFatoresCampos: TPageControl;
    tbsFatoresCamposLista: TTabSheet;
    tbsFatoresCamposDados: TTabSheet;
    Label44: TLabel;
    dbedtNM_FATOR_CAMPO: TDBEdit;
    Label45: TLabel;
    dbedtCamposNM_CAMPO_PROCESSO: TDBEdit;
    gbFatoresCamposLookup: TGroupBox;
    Label46: TLabel;
    Label47: TLabel;
    Label48: TLabel;
    SpeedButton7: TSpeedButton;
    SpeedButton8: TSpeedButton;
    SpeedButton9: TSpeedButton;
    Label49: TLabel;
    dbedtNM_LOOKUP_TABELA: TDBEdit;
    dbedtNM_LOOKUP_CAMPO_CHAVE: TDBEdit;
    dbedtNM_LOOKUP_CAMPO_RETORNO: TDBEdit;
    dbmemNM_LOOKUP_SQL: TDBMemo;
    SpeedButton10: TSpeedButton;
    pgFatoresEventos: TPageControl;
    tbsFatoresEventosLista: TTabSheet;
    tbsFatoresEventosDados: TTabSheet;
    dbgrdFatoresCampos: TDBGrid;
    dbgrdFatoresEventos: TDBGrid;
    Label50: TLabel;
    dbedtFatoresEventoCodigo: TDBEdit;
    edtFatoresEventoNome: TEdit;
    btnFatoresEvento: TSpeedButton;
    Label51: TLabel;
    dbedtFatoresEventoBaseCodigo: TDBEdit;
    edtFatoresEventoBaseNome: TEdit;
    btnFatoresEventoBase: TSpeedButton;
    Label53: TLabel;
    dbedtFatoresEventoPrazo: TDBEdit;
    Label52: TLabel;
    dbedtFatoresEventoAnteriorCodigo: TDBEdit;
    edtFatoresEventoAnteriorNome: TEdit;
    btnFatoresEventoAnterior: TSpeedButton;
    Label54: TLabel;
    dbedtFatoresEventoPrioridade: TDBEdit;
    dbchkFatoresEventoExcluir: TDBCheckBox;
    dbchkFatoresEventoAlterar: TDBCheckBox;
    gbNovoFollowup: TGroupBox;
    Label55: TLabel;
    Label56: TLabel;
    dbdtNovoFollowupImp: TDBDateEdit;
    dbdtNovoFollowupExp: TDBDateEdit;
    dbchkIN_PENDENCIAS: TDBCheckBox;
    GroupBox2: TGroupBox;
    dbedt_cd_cc_contas_receber: TDBEdit;
    dbedt_cd_cc_despacho_faturar: TDBEdit;
    dbedt_cd_cc_despacho_andamento: TDBEdit;
    Label58: TLabel;
    Label59: TLabel;
    Label60: TLabel;
    dbchkIN_EXTRATO_AVERBADO_RESUMIDO: TDBCheckBox;
    dbchkIN_EXIGE_CFOP_EXP: TDBCheckBox;
    dbchkIN_PLANILHA_CUSTOS: TDBCheckBox;
    tbsRefCompDI: TTabSheet;
    DBGrid3: TDBGrid;
    DBGrid4: TDBGrid;
    btnAdicionarRef: TSpeedButton;
    btnRemoverRef: TSpeedButton;
    btnRemoverTodasRef: TSpeedButton;
    Panel2: TPanel;
    Label61: TLabel;
    tbsBaseICMS: TTabSheet;
    DBGrid5: TDBGrid;
    btnAdicionarDespesa: TSpeedButton;
    btnRemoverDespesa: TSpeedButton;
    btnRemoverTodasDespesas: TSpeedButton;
    DBGrid6: TDBGrid;
    Label62: TLabel;
    Label63: TLabel;
    lblE01_ExportadorImportador: TLabel;
    edtE01_ExportadorImportador_Cod: TEdit;
    edtE01_ExportadorImportador_Nome: TEdit;
    btnE01_ExportadorImportador: TSpeedButton;
    tbsEmail: TTabSheet;
    DBCheckBox4: TDBCheckBox;
    Label21: TLabel;
    Label57: TLabel;
    Label64: TLabel;
    Label65: TLabel;
    dbedtNM_EMAIL_DAILY: TDBEdit;
    dbedtNM_EMAIL_FOLLOWUP: TDBEdit;
    dbedtEMAIL_AVARIAS: TDBEdit;
    dbedtNM_EMAIL_CONSULTA_MERCANTE: TDBEdit;
    dbedtNM_EMAIL_CONSULTA_LI: TDBEdit;
    Label66: TLabel;
    lbl_Banco6: TLabel;
    db_DESC_BANCO_PGMTO_AFRMM: TDBEdit;
    Label69: TLabel;
    db_CD_BANCO_PGMTO_AFRMM: TDBEdit;
    Label70: TLabel;
    tbsParametrosDi: TTabSheet;
    Label68: TLabel;
    Label82: TLabel;
    DBEdit2: TDBEdit;
    DBRadioGroup3: TDBRadioGroup;
    edtRepresentante: TEdit;
    Label72: TLabel;
    edtRepresentanteDesc: TEdit;
    btnRepresentante: TSpeedButton;
    tbsGestao: TTabSheet;
    Label73: TLabel;
    dbedtCoordImpo: TDBEdit;
    edtCoordImpo: TEdit;
    btnCoordImpo: TSpeedButton;
    Label74: TLabel;
    dbedtCoordExpo: TDBEdit;
    edtCoordExpo: TEdit;
    btnCoordExpo: TSpeedButton;
    Panel5: TPanel;
    Label67: TLabel;
    dbmmNM_EMAIL_CONSULTA_LI_STATUS: TDBMemo;
    edtNovoEmail: TEdit;
    dbgEmailsProcesso: TDBGrid;
    btnRemove: TBitBtn;
    btnAdd: TBitBtn;
    dbchkIN_STATUS_LI_INCLUIR_CONTATO: TDBCheckBox;
    PageControl1: TPageControl;
    tbsDadosEmail: TTabSheet;
    tbsDetalhes: TTabSheet;
    Panel6: TPanel;
    GroupBox3: TGroupBox;
    chkAtendente: TCheckBox;
    chkTransportador: TCheckBox;
    chkContato: TCheckBox;
    chkEmailExtraProcesso: TCheckBox;
    chkArmazemDescarga: TCheckBox;
    chkAgenteDeCarga: TCheckBox;
    mmSql: TMemo;
    lblSql: TLabel;
    Label71: TLabel;
    SpeedButton11: TSpeedButton;
    edtTPDocto: TEdit;
    btnAddVariavel: TBitBtn;
    Label87: TLabel;
    dbedtIdioma: TDBEdit;
    Edit124: TEdit;
    SpeedButton61: TSpeedButton;
    dbmNM_RELATORIO: TDBMemo;
    dbMMTX_RELATORIO: TDBMemo;
    Label75: TLabel;
    btnServico: TSpeedButton;
    edtcdServico: TEdit;
    edtnmServico: TEdit;
    Label76: TLabel;
    btnAgenteCarga: TSpeedButton;
    edtAgenteCarga: TEdit;
    edtNmAgenteCarga: TEdit;
    Label77: TLabel;
    btnArmazemDescarga: TSpeedButton;
    edtArmazemDescarga: TEdit;
    edtNmArmazemDescarga: TEdit;
    Label78: TLabel;
    btnLocalDesembarque: TSpeedButton;
    edtCdLocalDesembarque: TEdit;
    edtLocalDesembarque: TEdit;
    dbrgEmissaoDIExterna: TDBRadioGroup;
    Label79: TLabel;
    edtEmailDraftBL: TDBEdit;
    DBCheckBox8: TDBCheckBox;
    chkPreencheQuadroComplementarAd: TDBCheckBox;
    Label80: TLabel;
    btnGestorContas: TSpeedButton;
    edtCdGestorContas: TDBEdit;
    edtGestorContas: TEdit;
    edtIndiceReajusteAcordado: TDBEdit;
    chkContrato: TDBCheckBox;
    lblVigenciaContrato: TLabel;
    edtVigenciaContrato: TDBDateEdit;
    lblIndiceReajusteAcordado: TLabel;
    GroupBox4: TGroupBox;
    dbgrd1: TDBGrid;
    btn_incluir_reajuste: TSpeedButton;
    btn_salvar_reajuste: TSpeedButton;
    btn_cancelar_reajuste: TSpeedButton;
    btn_excluir_reajuste: TSpeedButton;
    pnlGrupoReajusteContr: TPanel;
    Label83: TLabel;
    Label81: TLabel;
    Label84: TLabel;
    Label88: TLabel;
    Label89: TLabel;
    dbePedidoReajuste: TDBDateEdit;
    edtReajusteNegociado: TDBDateEdit;
    edtReajusteInicioAplicacao: TDBDateEdit;
    EdtProximoReajuste: TDBDateEdit;
    edtIndiceNegociado: TDBEdit;
    DBEdit4: TDBEdit;
    Label90: TLabel;
    Label91: TLabel;
    edtCdArmazemEstocagem: TEdit;
    edtArmazemEstocagem: TEdit;
    btnArmazemEstocagem: TSpeedButton;
    procedure btn_sairClick(Sender: TObject);
    procedure btn_incluirClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure dbg_cadastroDblClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormCreate(Sender: TObject);
    procedure btn_excluirClick(Sender: TObject);
    procedure btn_salvarClick(Sender: TObject);
    procedure btn_cancelarClick(Sender: TObject);
    procedure cb_ordemClick(Sender: TObject);
    procedure edt_chaveChange(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure dbedt_nm_grupoChange(Sender: TObject);
    procedure dbg_cadastroKeyPress(Sender: TObject; var Key: Char);
    procedure pgctrl_grupoChange(Sender: TObject);
    procedure pgctrl_grupoChanging(Sender: TObject; var AllowChange: Boolean);
    procedure dbedt_cnpj_grupoExit(Sender: TObject);
    procedure btnCoBorderoClick(Sender: TObject);
    procedure btn_itemClick(Sender: TObject);
    procedure dbedt_cd_ItemExit(Sender: TObject);
    procedure dblkpTpPedidoClick(Sender: TObject);
    procedure chk_grupoClick(Sender: TObject);
    procedure db_contas_bancariasDblClick(Sender: TObject);
    procedure db_contas_bancariasCellClick(Column: TColumn);
    procedure db_contas_bancariasColEnter(Sender: TObject);
    procedure db_cd_clienteChange(Sender: TObject);
    procedure db_cd_servicoChange(Sender: TObject);
    procedure db_cd_banco_adiantamentoChange(Sender: TObject);
    procedure db_cd_banco_icmsChange(Sender: TObject);
    procedure db_cd_banco_impostosChange(Sender: TObject);
    procedure db_cd_banco_despesa_indaiaChange(Sender: TObject);
    procedure db_cd_banco_despesa_clienteChange(Sender: TObject);
    procedure pgctrl_documentoChange(Sender: TObject);
    procedure dblkpProdutoChange(Sender: TObject);
    procedure btn_co_usuarioClick(Sender: TObject);
    procedure DBEdit3Exit(Sender: TObject);
    procedure DBEdit3KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBGrid1TitleClick(Column: TColumn);
    procedure chk_ativo_disparoClick(Sender: TObject);
    procedure edicao(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure mmSqlChange(Sender: TObject);
    procedure btn20Click(Sender: TObject);
    procedure MaskEdit1KeyPress(Sender: TObject; var Key: Char);
    procedure Aplicarhorriosparatodososusurios1Click(Sender: TObject);
    procedure SpeedButton67Click(Sender: TObject);
    procedure btn17Click(Sender: TObject);
    procedure btn19Click(Sender: TObject);
    procedure SpeedButton61Click(Sender: TObject);
    procedure Edit135Change(Sender: TObject);
    procedure habilita_botoes(Sender: TObject);
    procedure btn14Click(Sender: TObject);
    procedure SpeedButton60Click(Sender: TObject);
    procedure SpeedButton59Click(Sender: TObject);
    procedure file_pathButtonClick(Sender: TObject);
    procedure dbchkE01Click(Sender: TObject);
    procedure edt_chave_disparoChange(Sender: TObject);
    procedure DBGrid1DblClick(Sender: TObject);
    procedure spd_urf_despachoClick(Sender: TObject);
    procedure dbedtFatoresUnidadeCodigoChange(Sender: TObject);
    procedure dbedtFatoresProdutoCodigoChange(Sender: TObject);
    procedure dbedtFatoresGrupoCodigoChange(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure SpeedButton3Click(Sender: TObject);
    procedure SpeedButton4Click(Sender: TObject);
    procedure SpeedButton5Click(Sender: TObject);
    procedure SpeedButton6Click(Sender: TObject);
    procedure dbedtFatoresNomeExit(Sender: TObject);
    procedure pgcFatoresChanging(Sender: TObject;
      var AllowChange: Boolean);
    procedure dbedtFatoresEventoCodigoChange(Sender: TObject);
    procedure dbedtFatoresEventoBaseCodigoChange(Sender: TObject);
    procedure dbedtFatoresEventoAnteriorCodigoChange(Sender: TObject);
    procedure pgcFatoresChange(Sender: TObject);
    procedure btnAdicionarRefClick(Sender: TObject);
    procedure btnRemoverRefClick(Sender: TObject);
    procedure btnRemoverTodasRefClick(Sender: TObject);
    procedure btnAdicionarDespesaClick(Sender: TObject);
    procedure btnRemoverDespesaClick(Sender: TObject);
    procedure btnRemoverTodasDespesasClick(Sender: TObject);
    procedure btnE01_ExportadorImportadorClick(Sender: TObject);
    procedure db_CD_BANCO_PGMTO_AFRMMChange(Sender: TObject);
    procedure SpeedButton11Click(Sender: TObject);
    procedure btnRepresentanteClick(Sender: TObject);
    procedure btnCoordImpoClick(Sender: TObject);
    procedure btnCoordExpoClick(Sender: TObject);
    procedure btnAddClick(Sender: TObject);
    procedure btnRemoveClick(Sender: TObject);
    procedure dbmmNM_EMAIL_CONSULTA_LI_STATUSChange(Sender: TObject);
    procedure btnAddVariavelClick(Sender: TObject);
    procedure btnServicoClick(Sender: TObject);
    procedure btnArmazemDescargaClick(Sender: TObject);
    procedure btnAgenteCargaClick(Sender: TObject);
    procedure btnLocalDesembarqueClick(Sender: TObject);
    procedure btnGestorContasClick(Sender: TObject);
    procedure btn_incluir_reajusteClick(Sender: TObject);
    procedure btn_salvar_reajusteClick(Sender: TObject);
    procedure btn_cancelar_reajusteClick(Sender: TObject);
    procedure btn_excluir_reajusteClick(Sender: TObject);
    procedure dbePedidoReajusteChange(Sender: TObject);
    procedure btnArmazemEstocagemClick(Sender: TObject);
  private
    OnChanging: Boolean;
    a_str_indices: array[0..1] of string[60];

    Pesquisa,vOrdenadoPor, vAcao: string;
    st_modificar, st_incluir, st_excluir: Boolean;
    lnm_grupo: Boolean;
    function Grava: Boolean;
    function VerAlt: Boolean;
    procedure Cancelar;
    procedure PreparaAgendaEDI(pUsuario: String);
    function vEmail_Valido(CD_USUARIO: String): Boolean;
    function ConsisteFatores(Sender: TObject): Boolean;
    function GravaFatores: Boolean;
    function VerificaEmailJaExiste(Email : String) : Boolean;
    procedure PreencheEmailsProcesso;
    procedure SelectReajusteContrato;
  public
    lCons_OnLine: Boolean;
    Cons_OnLine: TStringField;
    Cons_OnLine_Texto: string;
    function Consiste: Boolean;
    procedure btn_mi(Inc: Boolean; Salv: Boolean; Canc: Boolean; Exc: Boolean);
  end;

var
  frm_grupo: Tfrm_grupo;

implementation

uses GSMLIB, PGGP017, PGSM120, Funcoes, USelecionaTiposDoctosEmail,
  uCartaConfig, PGSM022;

{$R *.DFM}

{ TPageControl }

function TPageControl.CanChange: Boolean;
begin
  FOldPageIndex := ActivePageIndex;
  with ScreenToClient(Mouse.CursorPos) do
    FNewPageIndex := IndexOfTabAt(X, Y);
  Result := inherited CanChange;
  if not Result then
  begin
    FOldPageIndex := -1;
    FNewPageIndex := -1;
  end;
end;

constructor TPageControl.Create(AOwner: TComponent);
begin
  inherited;
  FOldPageIndex := -1;
  FNewPageIndex := -1;
end;

{ Tfrm_grupo }

procedure Tfrm_grupo.btn_sairClick(Sender: TObject);
begin
  if not VerAlt then Exit;
  Close;
end;

procedure Tfrm_grupo.btn_incluirClick(Sender: TObject);

  { by Carlos - nova combinação de numeros para geração do codigo do grupo - 31/08/2011 }
   function CriaCodigo:String;
   var
   strUltimaLetra,strNew:String;
   c,x:Integer;
   begin
     strUltimaLetra:=ConsultaLookUPSQL(' select max(SUBSTRING(CD_GRUPO,1,1)) LETRA from TGRUPO ','LETRA');
     while True do begin
       for c:=1 to 99 do begin
          strNew:=strUltimaLetra+FormatFloat('00',c);
          if ConsultaLookUPSQL(' select CD_GRUPO from TGRUPO where CD_GRUPO = "'+strNew+'"','CD_GRUPO') = '' then begin
             Result:= strNew;
             exit;
          end;
       end;
       strUltimaLetra:= chr(ord(strUltimaletra[1])+1);   //proxima letra
       if ord(strUltimaletra[1])>90 then begin
          { Faz a sequencia somente com letras }
          for c:=65 to 90 do begin
            for x:=65 to 90 do begin
              strNew:=chr(c)+chr(x);
              if ConsultaLookUPSQL(' select CD_GRUPO from TGRUPO where CD_GRUPO = "'+strNew+'"','CD_GRUPO') = '' then begin
                 Result:= strNew;
                 exit;
              end;
            end;
          end;
          ShowMessage('Não Existe mais combinações para geração do numero do grupo');
          result:='';
          exit;
       end;
     end;
   end;

begin
//  if pgctrl_grupo.ActivePageIndex in [0,1] then //lista ou dados básicos
  if( pgctrl_grupo.ActivePage = ts_lista) or (pgctrl_grupo.ActivePage = ts_dados_basicos) then //lista ou dados básicos
  begin
    with datm_grupo do
    begin
      qry_grupo_.DisableControls;
      qry_grupo_.Cancel;
      qry_grupo_.Append;
      qry_grupo_.EnableControls;

      qry_grupo_.FieldByName('CD_GRUPO').AsString               := CriaCodigo;  //UltCod(qry_ult_grupo_, qry_ult_grupo_ULTIMO);
      qry_grupo_.FieldByName('IN_ATIVO').AsString               := '1';
      qry_grupo_.FieldByName('DT_INCLUSAO').AsDateTime          := Date;
      qry_grupo_.FieldByName('IN_CONFERE_REFERENCIA').AsString  := '0';
      qry_grupo_.FieldByName('IN_EXIBE_PEDIDO_SITE').AsString   := '0';
      qry_grupo_.FieldByName('NR_REL_FAT_CONSOLIDADO').AsString := '0';
      qry_grupo_.FieldByName('TP_PEDIDO_BUSCA').AsString        := '01';
      qry_grupo_.FieldByName('TP_PEDIDO_BUSCA_IMP').AsString    := '01';
    end;

    pgctrl_grupo.ActivePage := ts_dados_basicos;
    dbedt_nm_grupo.SetFocus;
  end
  else
 // if pgctrl_grupo.ActivePageIndex = 2 then  //Itens
  if pgctrl_grupo.ActivePage = ts_Itens then  //Itens
  begin
    Btn_Mi(False, True, True, False);
    Pgctrl_Grupo.ActivePage := ts_Itens;
    dbedt_cd_Item.SetFocus;
    datm_grupo.QryGrupoItem.Insert;
    datm_grupo.QryGrupoItemCD_GRUPO.AsString := datm_grupo.qry_grupo_CD_GRUPO.AsString;
  end
  else
//  if  pgctrl_grupo.ActivePageIndex = 3 then
  if pgctrl_grupo.ActivePage =  ts_Conta_Bancaria then
  begin
    datm_grupo.qry_grupo_banco.Insert;
    Btn_Mi(False, True, True, False);
  end
  else
  //if  pgctrl_grupo.ActivePageIndex = 4 then
  if pgctrl_grupo.ActivePage = ts_disparo_automatico then
  begin
    if (pgctrl_documento.ActivePage = ts_dados_disparo) or
      ((pgctrl_documento.ActivePage = ts_lista_disparo)) then
    begin
       pgctrl_documento.ActivePage := ts_dados_disparo;
       datm_grupo.qry_relatorios_mail_aut_.Insert;
    end;

    if (pgctrl_documento.ActivePage = ts_usuarios) then
    begin
      Shape15.SendToBack;
      DBEdit3.Enabled        := True;
      btn_co_usuario.Enabled := True;
      DBEdit3.SetFocus;
      datm_grupo.qry_relatorios_mail_aut_usuarios_.Insert;
      Btn_Mi(False, True, True, False);
    end;
  end
  else
 // if  pgctrl_grupo.ActivePageIndex = 5 then
  if pgctrl_grupo.ActivePage = tbsFatores then
  begin
    case pgcFatores.ActivePageIndex of
      0: begin
           pgcFatores.ActivePageIndex := 1;
           datm_grupo.qryFatores.Insert;
         end;
      1: datm_grupo.qryFatores.Insert;
      2: datm_grupo.qryFatoresCampos.Insert;
      3: datm_grupo.qryFatoresEventos.Insert;
    end;
    Btn_Mi(False, True, True, False);
  end
  else
 // if  pgctrl_grupo.ActivePageIndex = 8 then
  if pgctrl_grupo.ActivePage = tbsEmail then
  begin
    Btn_Mi(False, True, True, False);
  end;
end;

procedure Tfrm_grupo.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  datm_grupo.qry_yes_no_.Close;
  datm_grupo.qry_grupo_.Close;
  datm_grupo.qryTpReferencia.Close;
  datm_grupo.qry_produto.Close;
  datm_grupo.Free;
  Action := caFree;
end;

procedure Tfrm_grupo.dbg_cadastroDblClick(Sender: TObject);
begin
  if lCons_OnLine then                            
  begin
    try
      Cons_OnLine.AsString := datm_grupo.qry_grupo_.FieldByName('CD_GRUPO').AsString;
    except
      try
        Cons_Online_Texto := datm_grupo.qry_grupo_.FieldByName('CD_GRUPO').AsString;
      except
        BoxMensagem('Não consegui retornar Código do Grupo!', 2);
      end;
    end;
    Close;
  end;
end;

procedure Tfrm_grupo.FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if Key = 27 then
    Close
  else
  if Key = 13 then
    dbg_cadastroDblClick(Sender);
end;

procedure Tfrm_grupo.FormCreate(Sender: TObject);
var i : integer;
begin
  st_modificar := False;
  st_incluir := False;
  st_excluir := False;

  AtribuiDireitos(st_modificar, st_incluir, st_excluir);

 { Inicializa o Data Module para Grupo}
  Application.CreateForm(Tdatm_grupo, datm_grupo);

  with datm_grupo do
  begin
    ds_grupo_.AutoEdit := st_modificar;

    qry_yes_no_.Close;
    qry_yes_no_.Prepare;
    qry_yes_no_.Open;

    qryTpReferencia.Close;
    qryTpReferencia.Prepare;
    qryTpReferencia.Open;

    qry_grupo_.Close;
    qry_grupo_.sql.text := stringreplace(qry_grupo_.sql.text,
                                        '@orderby@',
                                        'NM_GRUPO',
                                        [rfReplaceAll]) ;
//    qry_grupo_.SQL[63] := 'NM_GRUPO';
    qry_grupo_.Prepare;
    qry_grupo_.Open;

    qry_produto.Open;
  end;

  a_str_indices[0] := 'CD_GRUPO';
  a_str_indices[1] := 'NM_GRUPO';

  with cb_ordem do
  begin
    Clear;
    Items.Add('Código');
    Items.Add('Descrição');
    ItemIndex := 1;
  end;

  datm_grupo.QryGrupoItem.Open;

  btn_incluir.Enabled := st_incluir;
  mi_incluir.Enabled  := st_incluir;
  btn_excluir.Enabled := st_excluir;
  mi_excluir.Enabled  := st_excluir;

  for i := pgctrl_grupo.PageCount -1 downto 0 do
  begin
    if pgctrl_grupo.pages[i].Name = 'ts_Itens' then
    begin
      pgctrl_grupo.pages[i].TabVisible := false;
      break;
    end;
  end;
end;

procedure Tfrm_grupo.btn_excluirClick(Sender: TObject);
begin
//  if pgctrl_grupo.ActivePageIndex in [0,1] then //dados básicos
  if( pgctrl_grupo.ActivePage = ts_lista) or (pgctrl_grupo.ActivePage = ts_dados_basicos) then //lista ou dados básicos
  begin
    if BoxMensagem('Este Grupo será excluído!' + #13#10 + 'Confirma exclusão?', 1) then
    try
      datm_main.db_broker.StartTransaction;
      datm_grupo.qry_grupo_.Delete;
      datm_main.db_broker.Commit;

      with TQuery.Create(application) do
        begin
          DatabaseName := 'DBBROKER';
          SQL.Clear;
          SQL.Add(' DELETE FROM MYINDAIA.DBO.TGRUPO WHERE CD_GRUPO = ''' + Pesquisa  + ''' ');
          ExecSQL;
          Free;
        end;
    except
      on E: Exception do
      begin
        datm_grupo.qry_grupo_.Cancel;
        if datm_main.db_broker.InTransaction then datm_main.db_broker.Rollback;
        TrataErro(E);
      end;
    end;
    pgctrl_grupo.ActivePage := ts_lista;
  end
  else
  //if pgctrl_grupo.ActivePageIndex = 2 then //Itens
  if (pgctrl_grupo.ActivePage = ts_Itens ) then  
  begin
    if not datm_grupo.QryGrupoItem.IsEmpty then
    begin
      if BoxMensagem('Este item do Grupo será excluído!' + #13#10 + 'Confirma exclusão?', 1) then
      try
        datm_main.db_broker.StartTransaction;
        datm_grupo.QryGrupoItem.Delete;
        datm_main.db_broker.Commit;
      except
        on E: Exception do
        begin
          datm_grupo.QryGrupoItem.Cancel;
          if datm_main.db_broker.InTransaction then
            datm_main.db_broker.Rollback;
          TrataErro(E);
        end;
      end;
      pgctrl_grupo.ActivePage := ts_Itens;
    end
    else
      BoxMensagem('Não existe itens para serem excluídos', 3);
  end
  else
  //if pgctrl_grupo.ActivePageIndex = 3 then // Contas
  if pgctrl_grupo.ActivePage =  ts_Conta_Bancaria then  
  begin
    if not datm_grupo.qry_grupo_banco.IsEmpty then
    begin
      if BoxMensagem('Esta conta do Grupo será excluída!' + #13#10 + 'Confirma exclusão?', 1) then
      try
        datm_main.db_broker.StartTransaction;
        datm_grupo.qry_grupo_banco.Delete;
        datm_main.db_broker.Commit;
      except
        on E: Exception do
        begin
          datm_grupo.qry_grupo_banco.Cancel;
          if datm_main.db_broker.InTransaction then
            datm_main.db_broker.Rollback;
          TrataErro(E);
        end;
      end;
      pgctrl_grupo.ActivePage := ts_Conta_Bancaria;
    end
    else
      BoxMensagem('Não existe itens para serem excluídos', 3);
  end
  else
//  if pgctrl_grupo.ActivePageIndex = 4 then //Disparo
  if pgctrl_grupo.ActivePage = ts_disparo_automatico then
  begin
    if (pgctrl_documento.ActivePage = ts_lista_disparo) or (pgctrl_documento.ActivePage = ts_dados_disparo) then begin
      if not datm_grupo.qry_relatorios_mail_aut_.IsEmpty then
      begin
        if BoxMensagem('Este Alerta será excluído!' + #13#10 + 'Confirma exclusão?', 1) then
        try
          datm_main.db_broker.StartTransaction;
          datm_grupo.qry_relatorios_mail_aut_.Delete;
          datm_main.db_broker.Commit;
        except
          on E: Exception do
          begin
            datm_grupo.qry_relatorios_mail_aut_.Cancel;
            if datm_main.db_broker.InTransaction then
              datm_main.db_broker.Rollback;
            TrataErro(E);
          end;
        end;
        pgctrl_documento.ActivePage := ts_lista_disparo;
      end
      else
        BoxMensagem('Não existe registro para ser excluído', 3);
    end;

    if (pgctrl_documento.ActivePage = ts_usuarios) then begin
      if not datm_grupo.qry_relatorios_mail_aut_usuarios_.IsEmpty then
      begin
        if BoxMensagem('Este Usuario do Alerta será excluído!' + #13#10 + 'Confirma exclusão?', 1) then
        try
          datm_main.db_broker.StartTransaction;
          datm_grupo.qry_relatorios_mail_aut_usuarios_.Delete;
          PreparaAgendaEDI(datm_grupo.qry_relatorios_mail_aut_usuarios_.FieldByName('CD_USUARIO').AsString);
          datm_main.db_broker.Commit;

        except
          on E: Exception do
          begin
            datm_grupo.qry_relatorios_mail_aut_usuarios_.Cancel;
            if datm_main.db_broker.InTransaction then
              datm_main.db_broker.Rollback;
            TrataErro(E);
          end;
        end;
        pgctrl_documento.ActivePage := ts_usuarios;
      end
      else
        BoxMensagem('Não existe usuario para ser excluído', 3);
    end;


  end;


end;

procedure Tfrm_grupo.btn_salvarClick(Sender: TObject);
begin
  ActiveControl := nil;
  if   (pgctrl_grupo.ActivePage= ts_dados_basicos)
   and ((dbedt_cd_cc_contas_receber.Text = '')
        or (dbedt_cd_cc_despacho_andamento.Text = '')
        or (dbedt_cd_cc_despacho_faturar.Text = '')) then
  begin
    BoxMensagem('Contas reduzidas devem ser preenchidas!', 2);
    Exit;
  end;
  //if not Consiste then Exit;
  if not  GRAVA then
    Exit;
end;

procedure Tfrm_grupo.btn_cancelarClick(Sender: TObject);
begin
  vAcao :='';
  Cancelar;
end;

procedure Tfrm_grupo.Cancelar;
begin                                
//  if (pgctrl_grupo.ActivePageIndex = 1) or (pgctrl_grupo.ActivePageIndex = 8) then //dados básicos
  if( pgctrl_grupo.ActivePage = ts_dados_basicos) or
    ( pgctrl_grupo.ActivePage = tbsEmail) or
    ( pgctrl_grupo.ActivePage = tbsGestao) then
  begin
    try
      if datm_grupo.qry_grupo_.State in [dsInsert, dsEdit] then
      begin
        datm_grupo.qry_grupo_.Cancel;
      //  if (pgctrl_grupo.ActivePageIndex = 1) then
        if ( pgctrl_grupo.ActivePage = ts_lista) then
        begin
          pgctrl_grupo.ActivePage := ts_dados_basicos;
          dbedt_nm_grupo.SetFocus;          
        end;
//        if (pgctrl_grupo.ActivePageIndex = 8) then
        if (pgctrl_grupo.ActivePage = tbsEmail) then
            pgctrl_grupo.ActivePage := tbsEmail;

        if (pgctrl_grupo.ActivePage = tbsGestao) then
            pgctrl_grupo.ActivePage := tbsGestao;  
      end;
    except
      BoxMensagem('Erro - cancelamento da operação. Tente cancelar novamente.', 2);
    end;
  end
  else
  //if pgctrl_grupo.ActivePageIndex = 2 then //Itens
  if (pgctrl_grupo.ActivePage = ts_Itens ) then
  begin
    try
      if datm_grupo.QryGrupoItem.State in [dsInsert, dsEdit] then
      begin
        datm_grupo.QryGrupoItem.Cancel;
        pgctrl_grupo.ActivePage := ts_Itens;
        dbedt_cd_Item.SetFocus;
      end;
    except
      BoxMensagem('Erro - cancelamento da operação. Tente cancelar novamente.', 2);
    end;
  end
  else
//  if  pgctrl_grupo.ActivePageIndex = 3 then
  if pgctrl_grupo.ActivePage =  ts_Conta_Bancaria then
  begin
    try
      if datm_grupo.qry_grupo_banco.State in [dsInsert, dsEdit] then
      begin
        datm_grupo.qry_grupo_banco.Cancel;
        pgctrl_grupo.ActivePage := ts_Conta_Bancaria;
      end;
    except
      BoxMensagem('Erro - cancelamento da operação. Tente cancelar novamente.', 2);
    end;
  end
  else
//  if  pgctrl_grupo.ActivePageIndex = 4 then
  if pgctrl_grupo.ActivePage = ts_disparo_automatico then
  begin
    try
      if (pgctrl_documento.ActivePage=ts_dados_disparo) then
      begin
        if datm_grupo.qry_relatorios_mail_aut_.State in [dsInsert, dsEdit] then
        begin
          datm_grupo.qry_relatorios_mail_aut_.Cancel;
          datm_grupo.AtualizaNB;
        end;
      end;
      if (pgctrl_documento.ActivePage=ts_usuarios) then
      begin
        if datm_grupo.qry_relatorios_mail_aut_usuarios_.State in [dsInsert, dsEdit] then
          datm_grupo.qry_relatorios_mail_aut_usuarios_.Cancel;
      end;
    except
      BoxMensagem('Erro - cancelamento da operação. Tente cancelar novamente.', 2);
    end;
  end
  else
//  if pgctrl_grupo.ActivePageIndex = 5 then
  if pgctrl_grupo.ActivePage = tbsFatores then
  begin
    if datm_grupo.qryFatores.State in [dsEdit, dsInsert] then
      datm_grupo.qryFatores.Cancel;
    if datm_grupo.qryFatoresCampos.State in [dsEdit, dsInsert] then
      datm_grupo.qryFatoresCampos.Cancel;
    if datm_grupo.qryFatoresEventos.State in [dsEdit, dsInsert] then
      datm_grupo.qryFatoresEventos.Cancel;
  end;   

//  if pgctrl_grupo.ActivePageIndex <> 3 then
  if not (pgctrl_grupo.ActivePage =  ts_Conta_Bancaria) then
    Btn_Mi(st_incluir, False, False, st_excluir)
  else
  //  Btn_Mi(st_incluir, False, False, false);
    datm_grupo.ds_grupo_bancoStateChange(datm_grupo.ds_grupo_banco);
end;

procedure Tfrm_grupo.cb_ordemClick(Sender: TObject);
begin
  Pesquisa := datm_grupo.qry_grupo_.FieldByName('CD_GRUPO').AsString;
  { Apaga o campo de pesquisa }
  edt_chave.Text := '';
  datm_grupo.qry_grupo_.Close;
  datm_grupo.qry_grupo_.sql.text := stringreplace(datm_grupo.qry_grupo_.sql.text,
                                                  '@orderby@',
                                                  a_str_indices[cb_ordem.ItemIndex],
                                                  [rfReplaceAll]);
 // datm_grupo.qry_grupo_.SQL[63] := a_str_indices[cb_ordem.ItemIndex];

  datm_grupo.qry_grupo_.Prepare;
  datm_grupo.qry_grupo_.Open;
  Localiza(datm_grupo.qry_grupo_, Pesquisa, a_str_indices[0]);
  edt_chave.SetFocus;
end;

procedure Tfrm_grupo.edt_chaveChange(Sender: TObject);
begin
  Localiza(datm_grupo.qry_grupo_, edt_chave.Text, a_str_indices[cb_ordem.ItemIndex]);
end;

procedure Tfrm_grupo.FormShow(Sender: TObject);
begin
  pnl_cadastro.Color := clMenuBroker;
  pgctrl_grupo.ActivePage := ts_lista;
  edt_chave.SetFocus;
  if st_incluir then
    db_contas_bancarias.ReadOnly := false
  else
    db_contas_bancarias.ReadOnly := true;

  vOrdenadoPor := 'CD_RELATORIO';    
end;

procedure Tfrm_grupo.dbedt_nm_grupoChange(Sender: TObject);
begin
  if (datm_grupo.qry_grupo_.State in [dsInsert, dsEdit]) then
    Btn_Mi(False, True, True, False);
end;

procedure Tfrm_grupo.dbg_cadastroKeyPress(Sender: TObject;
  var Key: Char);
begin
  if Key = #13 then dbg_cadastroDblClick(Sender);
end;

function Tfrm_grupo.Consiste: Boolean;
begin
  //if pgctrl_grupo.ActivePageIndex = 1 then //lista ou dados básicos
  if (pgctrl_grupo.ActivePage = ts_dados_basicos) then
  begin
    {Nome}
    if dbedt_nm_grupo.Text = '' then
    begin
      BoxMensagem('Campo Descrição deve ser preenchido!', 2);
      pgctrl_grupo.ActivePage := ts_dados_basicos;
      dbedt_nm_grupo.SetFocus;
      lnm_grupo := True;
      Consiste := False;
      Exit;
    end;
    {C.N.P.J.}
    if not CNPJ(dbedt_cnpj_grupo.Text) then
    begin
      pgctrl_grupo.ActivePage := ts_dados_basicos;
      dbedt_cnpj_grupo.SetFocus;
      Consiste := False;
      Exit;
    end;
  end
  else
//  if pgctrl_grupo.ActivePageIndex = 2 then
  if (pgctrl_grupo.ActivePage = ts_Itens ) then
  begin{ITEM}
    if dbedt_nm_item.Text = '' then
    begin
      BoxMensagem('Campo Item deve ser preenchido!', 2);
      pgctrl_grupo.ActivePage := ts_Itens;
      dbedt_cd_Item.SetFocus;
      Consiste := False;
      Exit;
    end;
  end;
//  if pgctrl_grupo.ActivePageIndex = 3 then
  if pgctrl_grupo.ActivePage =  ts_Conta_Bancaria then
  begin
    with datm_grupo do
    begin
      if (qry_grupo_bancoCD_BANCO_ADIANTAMENTO.AsString='')
      or (qry_grupo_bancoCD_BANCO_ICMS.AsString='')
      or (qry_grupo_bancoCD_BANCTO_PAGTO_DESPESAS_INDAIA.AsString='')
      or (qry_grupo_bancoCD_BANCTO_PAGTO_DESPESAS_CLIENTE.AsString='')
      or (qry_grupo_bancoCD_GRUPO.AsString='')
      or (qry_grupo_bancoCD_CLIENTE.AsString='')
      or (qry_grupo_bancoCD_UNID_NEG.AsString='')
      or (qry_grupo_bancoCD_PRODUTO.AsString='')
      or (qry_grupo_bancoCD_PRODUTO.AsString='')  then
      begin
        ShowMessage('O cadastro não pode ser concluído,faltam informações!');
        pgctrl_grupo.ActivePage := ts_Conta_Bancaria;
        Consiste := False;
        Exit;
      end;
    end;
  end;
  
  Consiste := True;
end;

function Tfrm_grupo.Grava: Boolean;
var
  vStrAux, in_email_atendente, in_email_contato, in_email_transportador, in_email_Extra_Processo, in_email_ArmazemDescarga, in_email_Agente_Carga,
  in_email_Armazem_Estocagem: String;
  i: Integer;
begin
 { if (pgctrl_grupo.ActivePageIndex = 1) or (pgctrl_grupo.ActivePageIndex = 8) or (pgctrl_grupo.ActivePageIndex = 9) then }  //lista ou dados básicos  //email //parametros DI
  if  (pgctrl_grupo.ActivePage = ts_dados_basicos) or
      (pgctrl_grupo.ActivePage = tbsEmail) or
      (pgctrl_grupo.ActivePage = tbsParametrosDi)  or
      (pgctrl_grupo.ActivePage = tbsGestao) then
  begin
    try
      datm_main.db_broker.StartTransaction;

      if (datm_grupo.qry_grupo_.State in [dsInsert, dsEdit]) then
      begin
        datm_grupo.qry_grupo_.Post;
        Pesquisa := datm_grupo.qry_grupo_.FieldByName('CD_GRUPO').AsString;

        {copiar os alertas genericos para este grupo}
        if vAcao='1' then
        begin
           with datm_grupo do
            begin
             CloseStoredProc(SP_CRIA_ALERTA_GRUPO);
             SP_CRIA_ALERTA_GRUPO.ParamByName('@CD_GRUPO').AsString := Pesquisa;
             ExecStoredProc(SP_CRIA_ALERTA_GRUPO);
             CloseStoredProc(SP_CRIA_ALERTA_GRUPO);
           end;
        end;

        {Desativar todos os alertas especificos deste grupo, permitindo que ele utilize os genericos }
        if vAcao='2' then
        begin
           with TQuery.Create(application) do
           begin
             DatabaseName := 'DBBROKER';
             SQL.Clear;
             SQL.Add(' UPDATE TRELATORIOS_MAIL_AUT SET IN_ATIVO=0 ');
             SQL.Add('  WHERE CD_TIPO_RELATORIO = "E01" ');
             SQL.Add('    AND master.dbo.FN_EXTRACT_WORD( TX_CONFIGURACAO,3) = "'+Pesquisa+'" ');
             ExecSQL;
             Free;
           end;
        end;
        vAcao :='';

        datm_grupo.qry_grupo_.Close;
        datm_grupo.qry_grupo_.Prepare;
        datm_grupo.qry_grupo_.Open;
        Localiza(datm_grupo.qry_grupo_, Pesquisa, a_str_indices[0]);
      end;
      datm_main.db_broker.Commit;


      with TQuery.Create(application) do
        begin
          DatabaseName := 'DBBROKER';
          SQL.Clear;
          SQL.Add(' DELETE FROM MYINDAIA.DBO.TGRUPO WHERE CD_GRUPO = ''' + Pesquisa  + ''' ');
          ExecSQL;
          SQL.Clear;
          SQL.Add(' INSERT INTO MYINDAIA.DBO.TGRUPO ( CD_GRUPO, NM_GRUPO, IN_EXIBE_PEDIDO_SITE, TP_PEDIDO_BUSCA, TP_DESC_BUSCA, IN_RATEIO, ');
          SQL.Add(' IN_EMAIL_CRIACAO, EMAIL_CRIACAO, IN_EMAIL_AUTORIZACAO, EMAIL_AUTORIZACAO, IN_EMAIL_PRE_AUTORIZACAO, EMAIL_PRE_AUTORIZACAO, ');
          SQL.Add(' IN_INTEGRA_FORNECIMENTO, IN_INTEGRA_PACKING_LIST, IN_MODO_SIMPLES, IN_RAP_SEQUENCIAL, IN_ENVIA_ARQUIVOS, IN_MOSTRA_FATURADOS, ');
          SQL.Add(' IN_DIVIDE_EMBARCADOS, IN_MOSTRA_FOLLOWUP, IN_CONFERENCIA, IN_PENDENCIAS, IN_RATEIA_PEDIDO, IN_ENVIA_COMO_TI, TP_PEDIDO_BUSCA_IMP, IN_PLANILHA_CUSTOS ) ');
          SQL.Add(' SELECT CD_GRUPO, NM_GRUPO, IN_EXIBE_PEDIDO_SITE, TP_PEDIDO_BUSCA, TP_DESC_BUSCA, IN_RATEIO, IN_EMAIL_CRIACAO, EMAIL_CRIACAO, ');
          SQL.Add(' IN_EMAIL_AUTORIZACAO, EMAIL_AUTORIZACAO, IN_EMAIL_PRE_AUTORIZACAO, EMAIL_PRE_AUTORIZACAO, IN_INTEGRA_FORNECIMENTO, IN_INTEGRA_PACKING_LIST, ');
          SQL.Add(' IN_MODO_SIMPLES, IN_RAP_SEQUENCIAL, IN_ENVIA_ARQUIVOS, IN_MOSTRA_FATURADOS, IN_DIVIDE_EMBARCADOS, IN_MOSTRA_FOLLOWUP, IN_CONFERENCIA, ');
          SQL.Add(' IN_PENDENCIAS, IN_RATEIA_PEDIDO, IN_ENVIA_COMO_TI, TP_PEDIDO_BUSCA_IMP, IN_PLANILHA_CUSTOS  ');
          SQL.Add(' FROM TGRUPO ( NOLOCK )  WHERE IN_ATIVO = ''1'' AND CD_GRUPO = ''' + Pesquisa + ''' ');
          ExecSQL;
          Free;
        end;

      Grava := True;
    except
      on E: Exception do
      begin
        datm_grupo.qry_grupo_.Cancel;
        if datm_main.db_broker.InTransaction then
          datm_main.db_broker.Rollback;

        TrataErro(E);
        Grava := False;
      end;
    end;
    Btn_Mi(st_incluir, False, False, st_excluir);
  end
  else
//  if pgctrl_grupo.ActivePageIndex = 2 then //Itens
  if (pgctrl_grupo.ActivePage = ts_Itens ) then
  begin
    try
      datm_main.db_broker.StartTransaction;
      if (datm_grupo.QryGrupoItem.State in [dsInsert, dsEdit]) then
      begin
        datm_grupo.QryGrupoItem.Post;
        datm_grupo.QryGrupoItem.Close;
        datm_grupo.QryGrupoItem.Open;
      end;
      datm_main.db_broker.Commit;
      Grava := True;
    except
      on E: Exception do
      begin
        datm_grupo.QryGrupoItem.Cancel;
        if datm_main.db_broker.InTransaction then
          datm_main.db_broker.Rollback;

        TrataErro(E);
        Grava := False;
      end;
    end;
    Btn_Mi(st_incluir, False, False, st_excluir);
  end
  else
  //if pgctrl_grupo.ActivePageIndex = 3 then
  if pgctrl_grupo.ActivePage =  ts_Conta_Bancaria then  
  begin
    try
      datm_main.db_broker.StartTransaction;
      if (datm_grupo.qry_grupo_banco.State in [dsinsert,dsedit]) then
      begin
        datm_grupo.qry_grupo_banco.Post;
        Pesquisa := datm_grupo.qry_grupo_banco.FieldByName('CD_CLIENTE').AsString;
        datm_grupo.qry_grupo_banco.Close;
        datm_grupo.qry_grupo_banco.Open;

        Localiza(datm_grupo.qry_grupo_banco, Pesquisa, a_str_indices[0]);
      end;
      datm_main.db_broker.Commit;
      Grava := True;
    except
      on E:Exception do
      begin
        if datm_main.db_broker.InTransaction then
          datm_main.db_broker.Rollback;

        TrataErro(E);
        Grava:=false;
      end;
    end;
  end
  else
//  if pgctrl_grupo.ActivePageIndex = 4 then
  if pgctrl_grupo.ActivePage = ts_disparo_automatico then
  begin
    try
      if pgctrl_documento.ActivePage=ts_usuarios then begin
        for i:=0 to ContaOcorrencias(edt_horarios.Text, '/') - 1 do
        begin
          try
            StrToTime(ExtractWord(i+1,edt_horarios.Text,'/'));
          except
            BoxMensagem('Existem datas inválidas no campo "Horários de Envio". Favor verificar.',3);
            Exit;
          end;
        end;
      end;

      datm_main.db_broker.StartTransaction;
      if (pgctrl_documento.ActivePage=ts_dados_disparo) then
      begin
         if chkAtendente.Checked          then in_email_atendente       :='1' else in_email_atendente       :='0';
         if chkContato.Checked            then in_email_contato         :='1' else in_email_contato         :='0';
         if chkTransportador.Checked      then in_email_transportador   :='1' else in_email_transportador   :='0';
         if chkEmailExtraProcesso.Checked then in_email_Extra_Processo  :='1' else in_email_Extra_Processo  :='0';
         if chkArmazemDescarga.Checked    then in_email_ArmazemDescarga :='1' else in_email_ArmazemDescarga :='0';
         if chkAgenteDeCarga.Checked      then in_email_Agente_Carga    :='1' else in_email_Agente_Carga    :='0';
//         if chkArmazemEstocagem.Checked   then in_email_Armazem_Estocagem :='1' else in_email_Armazem_Estocagem    :='0';


         datm_grupo.qry_relatorios_mail_aut_TX_MODELO.AsString       := file_path.Text;
         datm_grupo.qry_relatorios_mail_aut_CD_TIPO_DOCTO.AsString   := edtTPDocto.text;
         //datm_grupo.qry_relatorios_mail_aut_TX_CONFIGURACAO.AsString := Ed40.Text + '/' + Ed29.Text + '/' + datm_grupo.qry_relatorios_mail_aut_.ParamByName('GRUPO').AsString + '/' + Ed33.Text + '/' + Ed35.Text + '/' + Ed37.Text + '/' + Ed39.Text + '/' + Edit121.Text + '/'+mmSql.Lines.Text+ '/'+ Edit135.Text + '/'+ in_email_atendente + '/'+ in_email_contato + '/'+ in_email_transportador + '/';  // Para incluir a URF de Despacho na lista de parâmetros do select

         //padrão do robô de alertas. Eric 31/07/2012    10:14h
         datm_grupo.qry_relatorios_mail_aut_TX_CONFIGURACAO.AsString := Ed40.Text + '/' +
                                                                        Ed29.Text + '/' +
                                                                        datm_grupo.qry_relatorios_mail_aut_.ParamByName('GRUPO').AsString + '/' +
                                                                        Ed33.Text + '/' +
                                                                        Ed35.Text + '/' +
                                                                        Ed37.Text + '/' +
                                                                        Ed39.Text + '/' +
                                                                        Edit121.Text + '/'+
                                                                        mmSql.Lines.Text+ '/'+
                                                                        Edit135.Text + '/'+
                                                                        in_email_atendente + '/'+
                                                                        in_email_contato + '/'+
                                                                        in_email_transportador + '/' +
                                                                        edt_cd_urf_despacho.Text + '/' +
                                                                        edtE01_ExportadorImportador_Cod.Text + '/' +
                                                                        edtRepresentante.text + '/' + 
                                                                        in_email_Extra_Processo + '/' +
                                                                        in_email_ArmazemDescarga + '/' +
                                                                        in_email_Agente_Carga + '/' +
                                                                        edtcdServico.text + '/'+
                                                                        edtArmazemDescarga.text + '/' +
                                                                        edtAgenteCarga.text + '/' +
                                                                        edtCdLocalDesembarque.text + '/' +
                                                                        edtCdArmazemEstocagem.text + '/' +
                                                                        in_email_Armazem_Estocagem + '/'
                                                                        ;
         {os campos são cadastrados no datm_grupo}
         if datm_grupo.qry_relatorios_mail_aut_.State in [dsinsert,dsedit] then
            datm_grupo.qry_relatorios_mail_aut_.post;

         PreparaAgendaEDI('');

         vStrAux := datm_grupo.qry_relatorios_mail_aut_.FieldByName('CD_RELATORIO').AsString;
         datm_grupo.qry_relatorios_mail_aut_.Close;
         datm_grupo.qry_relatorios_mail_aut_.Prepare;
         datm_grupo.qry_relatorios_mail_aut_.Open;
         datm_grupo.qry_relatorios_mail_aut_.Locate('CD_RELATORIO',vStrAux,[]);

      end;

      if (pgctrl_documento.ActivePage=ts_usuarios) then
      begin
         datm_grupo.qry_relatorios_mail_aut_usuarios_CD_RELATORIO.AsString      := datm_grupo.qry_relatorios_mail_aut_CD_RELATORIO.AsString;
         datm_grupo.qry_relatorios_mail_aut_usuarios_TX_HORARIOS_ENVIO.AsString := edt_horarios.Text;

         if datm_grupo.qry_relatorios_mail_aut_usuarios_.State in [dsinsert,dsedit] then
            datm_grupo.qry_relatorios_mail_aut_usuarios_.post;

         PreparaAgendaEDI(datm_grupo.qry_relatorios_mail_aut_usuarios_.FieldByName('CD_USUARIO').AsString);

         datm_grupo.qry_relatorios_mail_aut_usuarios_.Close;
         datm_grupo.qry_relatorios_mail_aut_usuarios_.ParamByName('CD_RELATORIO').AsString := datm_grupo.qry_relatorios_mail_aut_.FieldByName('CD_RELATORIO').AsString;
         datm_grupo.qry_relatorios_mail_aut_usuarios_.Prepare;
         datm_grupo.qry_relatorios_mail_aut_usuarios_.Open;
      end;

      datm_main.db_broker.Commit;
      Grava := True;
    except
      on E:Exception do
      begin
        if datm_main.db_broker.InTransaction then
          datm_main.db_broker.Rollback;

        TrataErro(E);
        Grava:=false;
      end;
    end;

  end
  else
//  if pgctrl_grupo.ActivePageIndex = 5 then // Fatores
  if pgctrl_grupo.ActivePage = tbsFatores then
    Result := GravaFatores;
end;

procedure Tfrm_grupo.pgctrl_grupoChange(Sender: TObject);
begin
  OnChanging := False;

  if lnm_grupo then
  begin
    lnm_grupo := False;
    pgctrl_grupo.ActivePage := ts_dados_basicos;
    dbedt_nm_grupo.SetFocus;

    Exit;
  end;

  if (pgctrl_grupo.ActivePage = ts_Conta_Bancaria) then
  begin
    datm_grupo.qry_grupo_banco.Close;
    datm_grupo.qry_grupo_banco.ParamByName('CD_GRUPO').AsString:= datm_grupo.qry_grupo_CD_GRUPO.AsString;
    datm_grupo.qry_grupo_banco.Prepare;
    datm_grupo.qry_grupo_banco.Open;
  end;

  if (pgctrl_grupo.ActivePage = ts_Disparo_Automatico) then
  begin
    btn_excluir.Enabled:=True;
    datm_grupo.qry_relatorios_mail_aut_.Close;

    if datm_grupo.qry_grupo_IN_ALERTA_E01_NAO_GENERICO.Value='1' then
    begin
      datm_grupo.qry_relatorios_mail_aut_.ParamByName('GRUPO').AsString:=datm_grupo.qry_grupo_CD_GRUPO.AsString;
      lblE01.Caption:='ESPECÍFICO DESTE GRUPO';
      pnl_aviso_generico.Visible:=False;
    end
    else
    begin
      datm_grupo.qry_relatorios_mail_aut_.ParamByName('GRUPO').AsString:='';
      lblE01.Caption:='GENÉRICO PARA TODOS OS CLIENTES';
      pnl_aviso_generico.Visible:=True;
    end;

    dblkpProdutoChange(Sender);
    chk_ativo_disparoClick(sender);

    datm_grupo.qry_relatorios_mail_aut_.Open;
    //
    pgctrl_documento.ActivePageIndex:=0;
    pgctrl_documentoChange(sender);

  end;

  if (pgctrl_grupo.ActivePage = ts_lista)  then
  begin
    dbnvg.Enabled     := True;
    edt_chave.Enabled := True;
    cb_ordem.Enabled  := True;
  end
  else
  begin
    dbnvg.Enabled     := False;
    edt_chave.Enabled := False;
    cb_ordem.Enabled  := False;
  end;

  if (pgctrl_grupo.ActivePage = tbsFatores) then
    with datm_grupo do
    begin
      pgcFatores.ActivePageIndex := 0;

      if qryGruposFatores.Active then
        qryGruposFatores.Close;

      qryGruposFatores.ParamByName('CD_GRUPO').AsString := qry_grupo_CD_GRUPO.AsString;
      qryGruposFatores.Prepare;
      qryGruposFatores.Open;

      if qryFatores.Active then
        qryFatores.Close;
      qryFatores.ParamByName('CD_GRUPO').AsString := qry_grupo_CD_GRUPO.AsString;
      qryFatores.Prepare;
      qryFatores.Open;
    end;

  if (pgctrl_grupo.ActivePage = tbsRefCompDI) then
  begin
    if datm_grupo.qry_Tipo_Referencia.Active then
      datm_grupo.qry_Tipo_Referencia.Close;
    datm_grupo.qry_Tipo_Referencia.Open;
    if datm_grupo.qry_Grupo_Ref_Comp_DI.Active then
      datm_grupo.qry_Grupo_Ref_Comp_DI.Close;
    datm_grupo.qry_Grupo_Ref_Comp_DI.Open;
  end;

  if (pgctrl_grupo.ActivePage = tbsBaseICMS) then
  begin
    if datm_grupo.qry_Despesas.Active then
      datm_grupo.qry_Despesas.Close;
    datm_grupo.qry_Despesas.Open;
    if datm_grupo.qry_Grupo_Despesas.Active then
      datm_grupo.qry_Grupo_Despesas.Close;
    datm_grupo.qry_Grupo_Despesas.Open;
  end;

  if (pgctrl_grupo.ActivePage = tbsGestao) then
  begin
    SelectReajusteContrato;

    btn_incluir_reajuste.Enabled  := st_incluir;
    btn_salvar_reajuste.Enabled   := False;
    btn_cancelar_reajuste.Enabled := False;
    if datm_grupo.qryGrupoReajusteContr.RecordCount > 0 then
      btn_excluir_reajuste.Enabled  := st_excluir;
  end;

end;

procedure Tfrm_grupo.pgctrl_grupoChanging(Sender: TObject; var AllowChange: Boolean);
begin
  OnChanging := True;
  VerAlt;
end;

function Tfrm_grupo.VerAlt: Boolean;
begin
  VerAlt := True;
  if pgctrl_grupo.ActivePage =  tbsFatores then
  begin
    if (((datm_grupo.qryFatores.State in [dsEdit, dsInsert]) or (datm_grupo.qryFatores.UpdatesPending)) or
       ((datm_grupo.qryFatoresCampos.State in [dsEdit, dsInsert]) or (datm_grupo.qryFatoresCampos.UpdatesPending)) or
       ((datm_grupo.qryFatoresEventos.State in [dsEdit, dsInsert]) or (datm_grupo.qryFatoresEventos.UpdatesPending))) then
      case MessageDlg('Cadastro de Fatores alterado.'#13'Deseja salvar as alterações?', mtConfirmation, [mbYes, mbNo, mbCancel], 0) of
        mrYes: Result := GravaFatores;
        mrNo: begin
                if datm_grupo.qryFatoresCampos.State in [dsEdit, dsInsert] then
                  datm_grupo.qryFatoresCampos.Cancel;
                if datm_grupo.qryFatoresEventos.State in [dsEdit, dsInsert] then
                  datm_grupo.qryFatoresEventos.Cancel;
                if datm_grupo.qryFatores.State in [dsEdit, dsInsert] then
                  datm_grupo.qryFatores.Cancel;
              end;
      else
        Result := False;
      end;
  end
  else if (((datm_grupo.qry_grupo_.State in [dsEdit]) and st_modificar) or
    (datm_grupo.qry_grupo_.State in [dsInsert])) or (datm_grupo.qry_grupo_.UpdatesPending) then
  begin
    if BoxMensagem('Cadastro de Grupos foi alterado.' + #13#10 +
      'Deseja salvar as alterações?', 1) then
    begin
      if not Consiste then
      begin                                
        VerAlt := False;
        Exit;
      end;
      if not Grava then
      begin
        VerAlt := False;
        Exit;
      end;
    end
    else
      Cancelar;
  end;
end;

procedure Tfrm_grupo.btn_mi(Inc: Boolean; Salv: Boolean; Canc: Boolean; Exc: Boolean);
begin
  btn_incluir.Enabled   := Inc;  mi_incluir.Enabled  := Inc;
  btn_excluir.Enabled   := Exc;  mi_excluir.Enabled  := Exc;
  btn_salvar.Enabled    := Salv; mi_salvar.Enabled   := Salv;
  btn_Cancelar.Enabled  := Canc; mi_Cancelar.Enabled := Canc;
end;

procedure Tfrm_grupo.dbedt_cnpj_grupoExit(Sender: TObject);
begin
  Consiste;
end;

procedure Tfrm_grupo.btn_itemClick(Sender: TObject);
begin
  if Sender is TSpeedButton then
  begin
    if datm_grupo.QryGrupoItem.State in [dsBrowse, dsInactive] then
      datm_grupo.QryGrupoItem.Edit;
    datm_grupo.QryGrupoItemCD_ITEM.AsString := ConsultaOnLineEx('TITEM','Itens',['CD_ITEM','NM_ITEM'],['Código','Descrição'],'CD_ITEM',frm_main.mi_cad_fin_item, 1, dbedt_cd_Item.Text);
  end
  else
    dbedt_nm_item.Text := ConsultaLookUP('TITEM','CD_ITEM',dbedt_cd_Item.Text,'NM_ITEM')
end;

procedure Tfrm_grupo.dbedt_cd_ItemExit(Sender: TObject);
begin
  if Trim(dbedt_cd_Item.Text) <> '' then
    dbedt_cd_Item.Text := FStrZero(dbedt_cd_Item.Text, 3);
end;

procedure Tfrm_grupo.dblkpTpPedidoClick(Sender: TObject);
begin
  if (datm_grupo.qry_grupo_.State in [dsInsert, dsEdit]) then
    Btn_Mi(False, True, True, False);
end;

procedure Tfrm_grupo.chk_grupoClick(Sender: TObject);
begin
  with datm_grupo do begin
    qry_grupo_.Close;
    if chk_grupo.Checked then
       qry_grupo_.ParamByName('IN_ATIVO').AsString   := 'X'
    else
       qry_grupo_.ParamByName('IN_ATIVO').Value   := Null ;
    qry_grupo_.Prepare;
    qry_grupo_.Open;
  end;
end;

procedure Tfrm_grupo.db_contas_bancariasDblClick(Sender: TObject);
var
  cliente,Banco:string;
begin
 datm_grupo.qry_grupo_banco.Edit;
 datm_grupo.qry_grupo_bancoCD_GRUPO.AsString:= datm_grupo.qry_grupo_CD_GRUPO.AsString;
 if db_contas_bancarias.Columns.Items[db_contas_bancarias.SelectedIndex].FieldName='CD_CLIENTE' then
 begin
  if datm_grupo.qry_grupo_bancoCD_GRUPO.AsString <> '' then
  begin
    Cliente:=ConsultaOnLineExFiltro('TEMPRESA_NAC', 'Clientes',['CD_EMPRESA', 'NM_EMPRESA', 'AP_EMPRESA'],
                                                               ['Código', 'Descrição', 'Apelido'], 'CD_EMPRESA',
                                                               'CD_GRUPO = ''' + datm_grupo.qry_grupo_bancoCD_GRUPO.AsString + ''' and cd_EMPRESA not in (select cd_cliente from  TCLIENTE_BANCO WHERE  CD_GRUPO = ''' + datm_grupo.qry_grupo_bancoCD_GRUPO.AsString + ''') ' , nil);
    if not (datm_grupo.qry_grupo_banco.State in [dsEdit, dsInsert]) then
      datm_grupo.qry_grupo_banco.Edit;
    datm_grupo.qry_grupo_bancoCD_CLIENTE.AsString:=cliente;
    if datm_grupo.qry_grupo_bancoCD_CLIENTE.AsString = '' then
      datm_grupo.qry_grupo_bancoCD_CLIENTE.AsString:='0';
  end;
 end;
 if (db_contas_bancarias.Columns.Items[db_contas_bancarias.SelectedIndex].FieldName = 'CD_BANCO_ADIANTAMENTO') or
    (db_contas_bancarias.Columns.Items[db_contas_bancarias.SelectedIndex].FieldName = 'CD_BANCO_ICMS') or
    (db_contas_bancarias.Columns.Items[db_contas_bancarias.SelectedIndex].FieldName = 'CD_BANCO_PAGTO_IMPOSTOS') or
    (db_contas_bancarias.Columns.Items[db_contas_bancarias.SelectedIndex].FieldName = 'CD_BANCTO_PAGTO_DESPESAS_INDAI') or
    (db_contas_bancarias.Columns.Items[db_contas_bancarias.SelectedIndex].FieldName = 'CD_BANCTO_PAGTO_DESPESAS_CLIEN')
 then
 begin
  Banco:=ConsultaOnLineEx('TBANCO', 'Bancos',['CD_BANCO', 'NM_BANCO', 'AP_BANCO'],['Código', 'Descrição', 'Apelido'], 'CD_BANCO',nil,1, Banco);
  if banco <> '' then
    db_contas_bancarias.SelectedField.Value := Banco
  else
    db_contas_bancarias.SelectedField.Value := 0;
 end;
end;

procedure Tfrm_grupo.db_contas_bancariasCellClick(Column: TColumn);
begin
  if not (datm_grupo.qry_grupo_banco.State in [dsEdit, dsInsert]) then
      datm_grupo.qry_grupo_banco.Edit;
  if (datm_grupo.qry_grupo_banco.State  in [dsEdit])  then
  begin
    datm_grupo.qry_grupo_bancoCD_UNID_NEG.ReadOnly :=true;
    datm_grupo.qry_grupo_bancoCD_PRODUTO.ReadOnly  :=true;
    datm_grupo.qry_grupo_bancoCD_SERVICO.ReadOnly  :=true;

  end
  else
  begin
    datm_grupo.qry_grupo_bancoCD_UNID_NEG.ReadOnly :=false;
    datm_grupo.qry_grupo_bancoCD_PRODUTO.ReadOnly  :=false;
    datm_grupo.qry_grupo_bancoCD_SERVICO.ReadOnly  :=false;
  end;
end;

procedure Tfrm_grupo.db_contas_bancariasColEnter(Sender: TObject);
begin
 {if db_contas_bancarias.Columns.Items[db_contas_bancarias.SelectedIndex].FieldName='CD_BANCO_ADIANTAMENTO' then
  begin
    lbl_banco.Caption:= 'Banco Adiantamento';
    db_banco.DataField := 'CD_BANCO_ADIANTAMENTO';
    db_banco.Text := datm_grupo.qry_grupo_bancoCD_BANCO_ADIANTAMENTO.AsString;
  end
  else if db_contas_bancarias.Columns.Items[db_contas_bancarias.SelectedIndex].FieldName='CD_BANCO_ICMS' then
  begin

    db_banco.DataField := 'CD_BANCO_ICMS';
    lbl_banco.Caption:= 'Banco ICMS' ;
    db_banco.Text := datm_grupo.qry_grupo_bancoCD_BANCO_ICMS.AsString;
  end
  else if db_contas_bancarias.Columns.Items[db_contas_bancarias.SelectedIndex].FieldName='CD_BANCO_PAGTO_IMPOSTOS' then
  begin

    db_banco.DataField := 'CD_BANCO_PAGTO_IMPOSTOS';
    lbl_banco.Caption:= 'Banco Pagto de Impostos';
    db_banco.Text := datm_grupo.qry_grupo_bancoCD_BANCO_PAGTO_IMPOSTOS.AsString;
  end
  else if db_contas_bancarias.Columns.Items[db_contas_bancarias.SelectedIndex].FieldName='CD_BANCTO_PAGTO_DESPESAS_INDAI' then
  begin

    db_banco.DataField := 'CD_BANCTO_PAGTO_DESPESAS_INDAI';
    lbl_banco.Caption:= 'Banco Despesas Indaia';
    db_banco.Text := datm_grupo.qry_grupo_bancoCD_BANCTO_PAGTO_DESPESAS_INDAI.AsString;
  end
  else if db_contas_bancarias.Columns.Items[db_contas_bancarias.SelectedIndex].FieldName='CD_BANCTO_PAGTO_DESPESAS_CLIEN' then
  begin

    db_banco.DataField := 'CD_BANCTO_PAGTO_DESPESAS_CLIEN';
    lbl_banco.Caption:= 'Banco Despesas Cliente';
    db_banco.Text := datm_grupo.qry_grupo_bancoCD_BANCTO_PAGTO_DESPESAS_CLIEN.AsString;
  end
  else
  begin
    db_banco.DataField := '';
    lbl_banco.Caption:= '';
    db_banco.Text := '';
    edt_nome_banco.Text:= '';
  end; }

end;

procedure Tfrm_grupo.db_cd_clienteChange(Sender: TObject);
begin
  if (db_cd_cliente.Text = '') or (db_cd_cliente.Text='0') then
    db_cliente.Text:= 'Indefinido'
  else
    db_cliente.Text:= ConsultaLookUPSQL('SELECT NM_EMPRESA FROM TEMPRESA_NAC WHERE CD_EMPRESA ='''+ formatfloat('00000',strtofloat(db_cd_cliente.Text))+'''','NM_EMPRESA');
end;

procedure Tfrm_grupo.db_cd_servicoChange(Sender: TObject);
begin
  if (db_cd_servico.Text = '') or (db_cd_servico.Text='0') then
    db_servico.Text:= 'Indefinido'
  else
    db_servico.Text:= ConsultaLookUPSQL('SELECT NM_SERVICO FROM TSERVICO WHERE CD_SERVICO ='''+ formatfloat('000',strtofloat(db_cd_servico.Text))+'''','NM_SERVICO');
end;

procedure Tfrm_grupo.db_cd_banco_adiantamentoChange(Sender: TObject);
begin
  if (db_cd_banco_adiantamento.Text = '') or (db_cd_banco_adiantamento.Text='0') then
    db_banco_adiantamento.Text:= 'Indefinido'
  else
  begin
    db_banco_adiantamento.Text:= ConsultaLookUPSQL('SELECT NM_BANCO FROM TBANCO WHERE CD_BANCO ='''+ formatfloat('000',strtofloat(db_cd_banco_adiantamento.Text))+'''','NM_BANCO');
    lbl_banco1.caption:= ConsultaLookUPSQL('SELECT CASE WHEN IN_INDAIA = 1 THEN "Banco Indaiá" ELSE "Banco Cliente" END as "BANCO" FROM TBANCO WHERE CD_BANCO ='''+ formatfloat('000',strtofloat(db_cd_banco_adiantamento.Text))+'''','BANCO');
  end;
end;

procedure Tfrm_grupo.db_cd_banco_icmsChange(Sender: TObject);
begin
  if (db_cd_banco_icms.Text = '') or (db_cd_banco_icms.Text='0') then
    db_banco_icms.Text:= 'Indefinido'
  else
  begin
    db_banco_icms.Text:= ConsultaLookUPSQL('SELECT NM_BANCO FROM TBANCO WHERE CD_BANCO ='''+ formatfloat('000',strtofloat(db_cd_banco_icms.Text))+'''','NM_BANCO');
    lbl_banco2.caption:= ConsultaLookUPSQL('SELECT CASE WHEN IN_INDAIA = 1 THEN "Banco Indaiá" ELSE "Banco Cliente" END as "BANCO" FROM TBANCO WHERE CD_BANCO ='''+ formatfloat('000',strtofloat(db_cd_banco_icms.Text))+'''','BANCO');
  end;
end;

procedure Tfrm_grupo.db_cd_banco_impostosChange(Sender: TObject);
begin
  if (db_cd_banco_impostos.Text = '') or (db_cd_banco_impostos.Text='0') then
    db_banco_impostos.Text:= 'Indefinido'
  else
  begin
    db_banco_impostos.Text:= ConsultaLookUPSQL('SELECT NM_BANCO FROM TBANCO WHERE CD_BANCO ='''+ formatfloat('000',strtofloat(db_cd_banco_impostos.Text))+'''','NM_BANCO');
    lbl_banco3.caption:= ConsultaLookUPSQL('SELECT CASE WHEN IN_INDAIA = 1 THEN "Banco Indaiá" ELSE "Banco Cliente" END as "BANCO" FROM TBANCO WHERE CD_BANCO ='''+ formatfloat('000',strtofloat(db_cd_banco_impostos.Text))+'''','BANCO');
  end;
end;

procedure Tfrm_grupo.db_cd_banco_despesa_indaiaChange(Sender: TObject);
begin
  if (db_cd_banco_despesa_indaia.Text = '') or (db_cd_banco_despesa_indaia.Text='0') then
    db_banco_despesa_indaia.Text:= 'Indefinido'
  else
  begin
    db_banco_despesa_indaia.Text:= ConsultaLookUPSQL('SELECT NM_BANCO FROM TBANCO WHERE CD_BANCO ='''+ formatfloat('000',strtofloat(db_cd_banco_despesa_indaia.Text))+'''','NM_BANCO');
    lbl_banco4.caption:= ConsultaLookUPSQL('SELECT CASE WHEN IN_INDAIA = 1 THEN "Banco Indaiá" ELSE "Banco Cliente" END as "BANCO" FROM TBANCO WHERE CD_BANCO ='''+ formatfloat('000',strtofloat(db_cd_banco_despesa_indaia.Text))+'''','BANCO');
  end;
end;

procedure Tfrm_grupo.db_cd_banco_despesa_clienteChange(Sender: TObject);
begin
  if (db_cd_banco_despesa_cliente.Text = '') or (db_cd_banco_despesa_cliente.Text='0') then
    db_banco_despesa_cliente.Text:= 'Indefinido'
  else
  begin
    db_banco_despesa_cliente.Text:= ConsultaLookUPSQL('SELECT NM_BANCO FROM TBANCO WHERE CD_BANCO ='''+ formatfloat('000',strtofloat(db_cd_banco_despesa_cliente.Text))+'''','NM_BANCO');
    lbl_banco5.caption:= ConsultaLookUPSQL('SELECT CASE WHEN IN_INDAIA = 1 THEN "Banco Indaiá" ELSE "Banco Cliente" END as "BANCO" FROM TBANCO WHERE CD_BANCO ='''+ formatfloat('000',strtofloat(db_cd_banco_despesa_cliente.Text))+'''','BANCO');
  end;
end;

procedure Tfrm_grupo.db_CD_BANCO_PGMTO_AFRMMChange(Sender: TObject);
begin
  if (db_CD_BANCO_PGMTO_AFRMM.Text = '') or (db_CD_BANCO_PGMTO_AFRMM.Text='0') then
    db_DESC_BANCO_PGMTO_AFRMM.Text:= 'Indefinido'
  else
  begin
    db_DESC_BANCO_PGMTO_AFRMM.Text:= ConsultaLookUPSQL('SELECT NM_BANCO FROM TBANCO (NOLOCK) WHERE CD_BANCO ='''+ formatfloat('000',strtofloat(db_CD_BANCO_PGMTO_AFRMM.Text))+'''','NM_BANCO');
    lbl_Banco6.caption:= ConsultaLookUPSQL('SELECT CASE WHEN IN_INDAIA = 1 THEN "Banco Indaiá" ELSE "Banco Cliente" END as "BANCO" FROM TBANCO WHERE CD_BANCO ='''+ formatfloat('000',strtofloat(db_CD_BANCO_PGMTO_AFRMM.Text))+'''','BANCO');
  end;
end;

procedure Tfrm_grupo.pgctrl_documentoChange(Sender: TObject);
begin
  with datm_grupo do
  begin
    if pgctrl_documento.ActivePage = ts_usuarios then begin
      qry_relatorios_mail_aut_usuarios_.Close;
      qry_relatorios_mail_aut_usuarios_.ParamByName('CD_RELATORIO').AsString := qry_relatorios_mail_aut_.FieldByName('CD_RELATORIO').AsString;
      qry_relatorios_mail_aut_usuarios_.Prepare;
      qry_relatorios_mail_aut_usuarios_.Open;
    end;
  end;

end;

procedure Tfrm_grupo.dblkpProdutoChange(Sender: TObject);
begin
   datm_grupo.qry_relatorios_mail_aut_.Close;
   if dblkpProduto.KeyValue=Null then
      datm_grupo.qry_relatorios_mail_aut_.ParamByName('PRODUTO').AsString:=''
   else
      datm_grupo.qry_relatorios_mail_aut_.ParamByName('PRODUTO').AsString:=dblkpProduto.KeyValue;

   datm_grupo.qry_relatorios_mail_aut_.Open;

end;

procedure Tfrm_grupo.btn_co_usuarioClick(Sender: TObject);
begin
  if Sender is TSpeedButton then
    DBEdit3.Text := ConsultaOnLineEx('TUSUARIO','Usuários',['CD_USUARIO','NM_USUARIO','NM_EMAIL'],['Código','Nome','Email'],'CD_USUARIO',nil)
  else Edit2.Text := ConsultaLookUP('TUSUARIO','CD_USUARIO', DBEdit3.Text,'NM_USUARIO');

end;

procedure Tfrm_grupo.DBEdit3Exit(Sender: TObject);
begin
  if Edit2.Text = '' then
  begin
    BoxMensagem('Usuário não cadastrado.',3);
    DBEdit3.SetFocus;
  end;
end;

procedure Tfrm_grupo.DBEdit3KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
 PoeEmEdicao(datm_grupo.qry_relatorios_mail_aut_usuarios_);
  if Key = VK_F5 then
    if Sender = DBEdit3 then          btn_co_usuarioClick(btn_co_usuario);
end;

procedure Tfrm_grupo.DBGrid1TitleClick(Column: TColumn);
var
  i : Integer;
begin
  datm_grupo.qry_relatorios_mail_aut_.Close;
  if Column.Title.Caption <> 'Ativo' then begin
    datm_grupo.qry_relatorios_mail_aut_.SQL.Strings[datm_grupo.qry_relatorios_mail_aut_.SQL.Count-1] := 'ORDER BY ' + Column.FieldName;
    for i:=0 to DBGrid1.Columns.Count-1 do
      DBGrid1.Columns[i].Color := clWindow;
    Column.Color := $00EBFFE6;
    vOrdenadoPor := Column.FieldName;
  end;
  datm_grupo.qry_relatorios_mail_aut_.Prepare;
  datm_grupo.qry_relatorios_mail_aut_.Open;

  edt_chave_disparo.Clear;
end;

procedure Tfrm_grupo.chk_ativo_disparoClick(Sender: TObject);
begin
  datm_grupo.qry_relatorios_mail_aut_.Close;
  if chk_ativo_disparo.Checked then
     datm_grupo.qry_relatorios_mail_aut_.ParamByName('ATIVO').AsString:='1'
  else
     datm_grupo.qry_relatorios_mail_aut_.ParamByName('ATIVO').AsString:='';

  datm_grupo.qry_relatorios_mail_aut_.Open;
end;

procedure Tfrm_grupo.edicao(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  PoeEmEdicao(datm_grupo.qry_relatorios_mail_aut_);
end;

procedure Tfrm_grupo.mmSqlChange(Sender: TObject);
begin
  if mmSql.Focused then
    PoeEmEdicao(datm_grupo.qry_relatorios_mail_aut_);
end;

procedure Tfrm_grupo.btn20Click(Sender: TObject);
begin
  if Sender is TSpeedButton then
  begin
    if PoeEmEdicao(datm_grupo.qry_relatorios_mail_aut_) then
      Ed40.Text := ConsultaOnLineEx('TUNID_NEG','Unidades de Negócio',['CD_UNID_NEG','NM_UNID_NEG'],['Código','Nome'],'CD_UNID_NEG',nil,1,ed40.Text);
  end
  else
    Ed41.Text := ConsultaLookUP('TUNID_NEG','CD_UNID_NEG', Ed40.Text,'NM_UNID_NEG');
end;

procedure Tfrm_grupo.MaskEdit1KeyPress(Sender: TObject; var Key: Char);
begin
  if Key = CHR(Vk_RETURN) then
  begin
    try
      StrToTime(MaskEdit1.Text);
      edt_horarios.Text := edt_horarios.Text + MaskEdit1.Text + '/';
    except
      BoxMensagem('A data digitada não é válida. Favor verificar.',3)
    end;
    MaskEdit1.Clear;
    MaskEdit1.SetFocus;
  end;
end;

procedure Tfrm_grupo.Aplicarhorriosparatodososusurios1Click(
  Sender: TObject);
var
  resultado : TModalResult;
begin
  resultado := MessageDlg('Deseja aplicar os horários desse usuário para todos os usuários desse relatório ?' + #13#10 +
                '"Sim" para todos.' + #13#10 +
                '"Não" apenas para os que estão com horários em branco.' + #13#10 +
                '"Cancel" para não copiar horários.', mtConfirmation, [mbYes,mbNo,mbCancel], 0);

  if (resultado = 6) then
  begin
    with TQuery.Create(Application) do
    begin
      DatabaseName := 'DBBROKER';
      SQL.Clear;
      SQL.Add('UPDATE TRELATORIOS_MAIL_AUT_USUARIOS SET TX_HORARIOS_ENVIO = ''' + datm_grupo.qry_relatorios_mail_aut_usuarios_.FieldByName('TX_HORARIOS_ENVIO').AsString + ''' WHERE CD_RELATORIO = ''' + datm_grupo.qry_relatorios_mail_aut_.FieldByName('CD_RELATORIO').AsString + '''');
      ExecSQL;
      Free;
    end;
  end
  else
  if (resultado = 7) then
  begin
    with TQuery.Create(Application) do
    begin
      DatabaseName := 'DBBROKER';
      SQL.Clear;
      SQL.Add('UPDATE TRELATORIOS_MAIL_AUT_USUARIOS SET TX_HORARIOS_ENVIO = ''' + datm_grupo.qry_relatorios_mail_aut_usuarios_.FieldByName('TX_HORARIOS_ENVIO').AsString + ''' WHERE CD_RELATORIO = ''' + datm_grupo.qry_relatorios_mail_aut_.FieldByName('CD_RELATORIO').AsString + '''');
      SQL.Add('AND LTRIM(RTRIM(TX_HORARIOS_ENVIO)) = ''''');
      ExecSQL;
      Free;
    end;
  end;
  with datm_grupo do
  begin
    qry_relatorios_mail_aut_usuarios_.Close;
    qry_relatorios_mail_aut_usuarios_.ParamByName('CD_RELATORIO').AsString := qry_relatorios_mail_aut_.FieldByName('CD_RELATORIO').AsString;
    qry_relatorios_mail_aut_usuarios_.Prepare;
    qry_relatorios_mail_aut_usuarios_.Open;
  end;
  PreparaAgendaEDI('');


end;


procedure Tfrm_grupo.PreparaAgendaEDI(pUsuario : String);
var
  i : Integer;
  vTipoEDI : string;
begin
  with datm_grupo do
  begin
    // verifica se o relatório está ativo ou não
    if qry_relatorios_mail_aut_.FieldByName('IN_ATIVO').AsString = '1' then begin
      with TQuery.Create(application) do
      begin
        DatabaseName := 'DBBROKER';
        // limpa todas as entradas na agenda para esse relatório, reconfigurando-a por inteiro
        SQL.Clear;
        if pUsuario <> '' then
        begin
          SQL.Add('DELETE FROM TFILA_AGENDA');
          SQL.Add('WHERE NM_PATH_EDI LIKE ''%CD_RELATORIO="' + qry_relatorios_mail_aut_.FieldByName('CD_RELATORIO').AsString + '"%''');
          SQL.Add('AND NM_PATH_EDI LIKE ''%CD_USUARIO="' + pUsuario + '"%''');
        end else
          SQL.Add('DELETE FROM TFILA_AGENDA WHERE NM_PATH_EDI LIKE ''%CD_RELATORIO="' + qry_relatorios_mail_aut_.FieldByName('CD_RELATORIO').AsString + '"%''');
        ExecSQL;
        // começa a varrer a tabela de usuarios para inserir os registros de agenda na TFILA_AGENDA
        qry_relatorios_mail_aut_usuarios_.Close;
        qry_relatorios_mail_aut_usuarios_.ParamByName('CD_RELATORIO').AsString := qry_relatorios_mail_aut_.FieldByName('CD_RELATORIO').AsString;
        qry_relatorios_mail_aut_usuarios_.Prepare;
        qry_relatorios_mail_aut_usuarios_.Open;
        qry_relatorios_mail_aut_usuarios_.First;
        while not qry_relatorios_mail_aut_usuarios_.EOF do
        begin
          if ( pUsuario = '' ) or ( pUsuario = qry_relatorios_mail_aut_usuarios_.FieldByName('CD_USUARIO').AsString ) then
          begin
            for i := 1 to ContaOcorrencias(qry_relatorios_mail_aut_usuarios_.FieldByName('TX_HORARIOS_ENVIO').AsString,'/') do
            begin
              // insere na TFILA_AGENDA passando o numero do relatorio e o usuario.
              vTipoEDI := 'C';
              SQL.Clear;
              if StrToTime(ExtractWord(i,qry_relatorios_mail_aut_usuarios_.FieldByName('TX_HORARIOS_ENVIO').AsString,'/')) > StrToTime(FormatDateTime('hh:nn',now)) then
                SQL.Add('INSERT INTO TFILA_AGENDA VALUES (''' + ConsultaLookupSQL('SELECT MAX(CD_AGENDA) + 1 AS CD_AGENDA FROM TFILA_AGENDA', 'CD_AGENDA') + ''',''' + vTipoEDI + ''',''CD_RELATORIO="' + qry_relatorios_mail_aut_.FieldByName('CD_RELATORIO').AsString + '"/CD_USUARIO="' + qry_relatorios_mail_aut_usuarios_.FieldByName('CD_USUARIO').AsString + '"/'',''1'','''',''24'',''' + ExtractWord(i,qry_relatorios_mail_aut_usuarios_.FieldByName('TX_HORARIOS_ENVIO').AsString,'/') + ''',''H'',''00:00'',GETDATE()-1)')
              else SQL.Add('INSERT INTO TFILA_AGENDA VALUES (''' + ConsultaLookupSQL('SELECT MAX(CD_AGENDA) + 1 AS CD_AGENDA FROM TFILA_AGENDA', 'CD_AGENDA') + ''',''' + vTipoEDI + ''',''CD_RELATORIO="' + qry_relatorios_mail_aut_.FieldByName('CD_RELATORIO').AsString + '"/CD_USUARIO="' + qry_relatorios_mail_aut_usuarios_.FieldByName('CD_USUARIO').AsString + '"/'',''1'','''',''24'',''' + ExtractWord(i,qry_relatorios_mail_aut_usuarios_.FieldByName('TX_HORARIOS_ENVIO').AsString,'/') + ''',''H'',''00:00'',GETDATE())');

              ExecSQL;
            end;
          end;
          qry_relatorios_mail_aut_usuarios_.Next;
        end;
        Free;
      end;
    end else begin
      with TQuery.Create(application) do
      begin
        DatabaseName := 'DBBROKER';
        // caso fique inativo, ele exclui da tabela TFILA_AGENDA, para que o EDI não mais envie mails sobre esse relatório
        SQL.Clear;
        SQL.Add('DELETE FROM TFILA_AGENDA WHERE NM_PATH_EDI LIKE ''%CD_RELATORIO="' + qry_relatorios_mail_aut_.FieldByName('CD_RELATORIO').AsString + '"%''');
        ExecSQL;
        Free;
      end;
    end;
  end;
end;


procedure Tfrm_grupo.SpeedButton67Click(Sender: TObject);
begin
  if Sender is TSpeedButton then
  begin
    if PoeEmEdicao(datm_grupo.qry_relatorios_mail_aut_) then
      Edit135.Text := ConsultaOnLineEx('TPRODUTO','Produto',['CD_PRODUTO','NM_PRODUTO'],['Código','Nome'],'CD_PRODUTO',nil)
  end
  else
    Edit136.Text := ConsultaLookUP('TPRODUTO','CD_PRODUTO', Edit135.Text,'NM_PRODUTO');
end;

procedure Tfrm_grupo.btn17Click(Sender: TObject);
begin
  if Sender is TSpeedButton then
  begin
    if PoeEmEdicao(datm_grupo.qry_relatorios_mail_aut_) then
    begin
      if ed33.Text <> '' then
        ed35.Text := ConsultaOnLineExSQL('SELECT CD_AREA, NM_AREA FROM TAREA WHERE NM_GRUPO = ''' + ed33.Text + '''','Sub-areas',['CD_AREA','NM_AREA'],['Código','Nome'],'CD_AREA',nil)
      else ed35.Text := ConsultaOnLineEx('TAREA','Áreas',['CD_AREA','NM_AREA','NM_GRUPO'],['Código','Nome','Grupo'],'CD_AREA',nil);
    end
  end
  else
    ed34.Text := ConsultaLookUP('TAREA','CD_AREA', ed35.Text,'NM_AREA');
end;

procedure Tfrm_grupo.btn19Click(Sender: TObject);
begin
  if Sender is TSpeedButton then
  begin
    if PoeEmEdicao(datm_grupo.qry_relatorios_mail_aut_) then
      Ed39.Text := ConsultaOnLineEx('TUSUARIO','Usuários',['CD_USUARIO','NM_USUARIO'],['Código','Nome'],'CD_USUARIO',nil);
  end
  else Ed38.Text := ConsultaLookUP('TUSUARIO','CD_USUARIO', Ed39.Text,'NM_USUARIO');
end;

procedure Tfrm_grupo.SpeedButton61Click(Sender: TObject);
begin
  If Sender is TSpeedButton Then
  begin
    if PoeEmEdicao(datm_grupo.qry_relatorios_mail_aut_) then
      dbedtIdioma.Text := ConsultaOnLineEx('TIDIOMA', 'Idioma', ['CODIGO', 'DESCRICAO'], ['Código', 'Descrição'], 'CODIGO', nil, 1, dbedtIdioma.Text);
  end
  else Edit124.Text := ConsultaLookUP('TIDIOMA', 'CODIGO',  dbedtIdioma.Text ,'DESCRICAO');
end;

procedure Tfrm_grupo.Edit135Change(Sender: TObject);
begin
  if Sender is TSpeedButton then
  begin
    if PoeEmEdicao(datm_grupo.qry_relatorios_mail_aut_) then
      Edit135.Text := ConsultaOnLineEx('TPRODUTO','Produtos',['CD_PRODUTO','NM_PRODUTO'],['Código','Nome'],'CD_PRODUTO',nil)
  end
  else
    Edit136.Text := ConsultaLookUP('TPRODUTO','CD_PRODUTO', Edit135.Text,'NM_PRODUTO');

  if Edit135.Text = '01' then
    lblE01_ExportadorImportador.Caption := 'Exportador'
  else
  if Edit135.Text = '02' then
    lblE01_ExportadorImportador.Caption := 'Importador'
  else
    lblE01_ExportadorImportador.Caption := 'Exportador / Importador';
end;

procedure Tfrm_grupo.habilita_botoes(Sender: TObject);
begin
   if (pgctrl_documento.ActivePage=ts_dados_disparo) then
     PoeEmEdicao(datm_grupo.qry_relatorios_mail_aut_);
end;

procedure Tfrm_grupo.btn14Click(Sender: TObject);
begin
  if Sender is TSpeedButton then
  begin
    if PoeEmEdicao(datm_grupo.qry_relatorios_mail_aut_) then
      Ed29.Text := ConsultaOnLineEx('TEMPRESA_NAC','Clientes',['CD_EMPRESA','NM_EMPRESA'],['Código','Nome'],'CD_EMPRESA',nil,1,ed29.Text)
  end
  else
    Ed28.Text := ConsultaLookUP('TEMPRESA_NAC','CD_EMPRESA', ed29.Text,'NM_EMPRESA');
end;

procedure Tfrm_grupo.SpeedButton60Click(Sender: TObject);
begin
  if Sender is TSpeedButton then
  begin
    if PoeEmEdicao(datm_grupo.qry_relatorios_mail_aut_) then
      dbedtModal.Text := ConsultaOnLineEx('TVIA_TRANSP_BROKER', 'Modais', ['CD_VIA_TRANSP', 'NM_VIA_TRANSP'], ['Código', 'Nome'], 'CD_VIA_TRANSP', nil)
  end
  else
    Edit123.Text := ConsultaLookUP('TVIA_TRANSP_BROKER', 'CD_VIA_TRANSP',  dbedtModal.Text ,'NM_VIA_TRANSP');
end;

procedure Tfrm_grupo.SpeedButton59Click(Sender: TObject);
begin
  if Sender is TSpeedButton then
  begin
    if PoeEmEdicao(datm_grupo.qry_relatorios_mail_aut_) then
      Edit121.Text := ConsultaOnLineEx('TEVENTO', 'Eventos', ['CD_EVENTO', 'NM_EVENTO'], ['Código', 'Nome'], 'CD_EVENTO', nil)
  end
  else
    Edit122.Text := ConsultaLookUP('TEVENTO','CD_EVENTO', Edit121.Text,'NM_EVENTO');
end;

procedure Tfrm_grupo.file_pathButtonClick(Sender: TObject);
begin
  PoeEmEdicao(datm_grupo.qry_relatorios_mail_aut_);
end;

{by Carlos - 06/10/2011 }
procedure Tfrm_grupo.dbchkE01Click(Sender: TObject);
begin
  vAcao :='';
  if (datm_grupo.qry_grupo_.State in [dsEdit]) then
  begin
    Btn_Mi(False, True, True, False);

    if dbchkE01.Checked then begin
       if (MessageDlg('Esta ação irá copiar todos os alertas genéricos para esse grupo, tornando-o especifico!'+#13+'Deseja prosseguir ?', mtConfirmation, [mbYes,mbNo], 0))=mrYes then
          vAcao :='1'
       else
          Cancelar;
    end else begin
       if (MessageDlg('Esta ação irá desativar todos os alertas especificos deste grupo!'+#13+'Deseja prosseguir ?', mtConfirmation, [mbYes,mbNo], 0))=mrYes then
          vAcao :='2'
       else
          Cancelar;
    end;
  end;
  if (datm_grupo.qry_grupo_.State in [dsInsert]) then begin
    if dbchkE01.Checked then
       vAcao :='1'
    else
       vAcao :='2'
  end;
end;

procedure Tfrm_grupo.edt_chave_disparoChange(Sender: TObject);
begin
  datm_grupo.qry_relatorios_mail_aut_.Locate(vOrdenadoPor, edt_chave_disparo.Text, [loPartialKey, loCaseInsensitive])
end;

procedure Tfrm_grupo.DBGrid1DblClick(Sender: TObject);
begin
 {if DBGrid1.SelectedIndex = 3 then begin
    datm_grupo.qry_relatorios_mail_aut_.Edit;
    if datm_grupo.qry_relatorios_mail_aut_IN_ATIVO.AsString='1' then
       datm_grupo.qry_relatorios_mail_aut_IN_ATIVO.AsString:='0'
    else
       datm_grupo.qry_relatorios_mail_aut_IN_ATIVO.AsString:='1';

    datm_grupo.qry_relatorios_mail_aut_.Post;
  end;} // Comentado a pedido de Eric e Carlos - Michel - 18/09/2012
end;
                                  
function Tfrm_grupo.vEmail_Valido(CD_USUARIO:String):Boolean;
begin

  with TQuery.Create(application) do
    begin
      DatabaseName := 'DBBROKER';
      SQL.Clear;
      SQL.Add( 'SELECT NM_EMAIL FROM TUSUARIO WHERE CD_USUARIO= :CD_USUARIO' );
      ParamByName('CD_USUARIO').AsString:=CD_USUARIO;
      Open;
      Result:=(Pos('@myindaia',Fields[0].AsString)>0);
      close;
      Free;
    end;
end;

procedure Tfrm_grupo.spd_urf_despachoClick(Sender: TObject);
begin
  if Sender is TSpeedButton then
  begin
    if PoeEmEdicao(datm_grupo.qry_relatorios_mail_aut_) then
      edt_cd_urf_despacho.Text := ConsultaOnLineEx('TURF','URF de Despacho',['CODIGO','DESCRICAO'],['Código','Nome'],'CODIGO',nil,1,edt_cd_urf_despacho.Text)
  end else
    edt_nm_urf_despacho.Text := ConsultaLookUP('TURF','CODIGO', edt_cd_urf_despacho.Text,'DESCRICAO');
end;

procedure Tfrm_grupo.dbedtFatoresUnidadeCodigoChange(Sender: TObject);
begin
  if Sender is TSpeedButton then
  begin
    if PoeEmEdicao(datm_grupo.qryFatores) then
      datm_grupo.qryFatoresCD_UNID_NEG.AsString := ConsultaOnLineEx('TUNID_NEG', 'Unidades de Negócio', ['CD_UNID_NEG', 'NM_UNID_NEG'], ['Código', 'Nome'], 'CD_UNID_NEG', nil, 1, datm_grupo.qryFatoresCD_UNID_NEG.AsString);
  end
  else if dbedtFatoresUnidadeCodigo.Text = 'XX' then
    edtFatoresUnidadeNome.Text := 'Todas'
  else
    edtFatoresUnidadeNome.Text := ConsultaLookUP('TUNID_NEG', 'CD_UNID_NEG', datm_grupo.qryFatoresCD_UNID_NEG.AsString, 'NM_UNID_NEG');
end;

procedure Tfrm_grupo.dbedtFatoresProdutoCodigoChange(Sender: TObject);
begin
  if Sender is TSpeedButton then
  begin
    if PoeEmEdicao(datm_grupo.qryFatores) then
      datm_grupo.qryFatoresCD_PRODUTO.AsString := ConsultaOnLineEx('TPRODUTO', 'Produtos', ['CD_PRODUTO', 'NM_PRODUTO'], ['Código', 'Nome'], 'CD_PRODUTO', nil, 1, datm_grupo.qryFatoresCD_PRODUTO.AsString);
  end
  else
  if dbedtFatoresProdutoCodigo.Text = 'XX' then
    edtFatoresProdutoNome.Text := 'Todos'
  else
    edtFatoresProdutoNome.Text := ConsultaLookUP('TPRODUTO', 'CD_PRODUTO', datm_grupo.qryFatoresCD_PRODUTO.AsString, 'NM_PRODUTO');
end;

procedure Tfrm_grupo.dbedtFatoresGrupoCodigoChange(Sender: TObject);
begin
  if Sender is TSpeedButton then
  begin
    if PoeEmEdicao(datm_grupo.qryFatores) then
      datm_grupo.qryFatoresCD_GRUPO.AsString := ConsultaOnLineExSQL(' SELECT * ' +
                                                                    ' FROM (SELECT CD_GRUPO, NM_GRUPO ' +
                                                                    '       FROM TGRUPO ' +
                                                                    '       WHERE IN_ATIVO = "1" ' +
                                                                    '       UNION ALL ' +
                                                                    '       SELECT "XXX" AS CD_GRUPO, "Todos" AS NM_GRUPO) AS VW ' +
                                                                    ' ORDER BY CASE CD_GRUPO ' +
                                                                    '              WHEN "XXX" THEN "00" ' +
                                                                    '          ELSE NM_GRUPO ' +
                                                                    '          END', 'Grupo', ['CD_GRUPO', 'NM_GRUPO'], ['Código', 'Nome'], 'CD_GRUPO', nil, datm_grupo.qryFatoresCD_GRUPO.AsString);
  end
  else if datm_grupo.qryFatoresCD_GRUPO.AsString = 'XXX' then
    edtFatoresGrupoNome.Text := 'Todos'
  else
    edtFatoresGrupoNome.Text := ConsultaLookUP('TGRUPO', 'CD_GRUPO', datm_grupo.qryFatoresCD_GRUPO.AsString, 'NM_GRUPO');
end;

procedure Tfrm_grupo.SpeedButton2Click(Sender: TObject);
begin
  datm_grupo.qryFatoresNM_CAMPO_PROCESSO.AsString := ConsultaOnLineExSQL('SELECT C.NAME ' +
                                                                         ' FROM SYS.TABLES T ' +
                                                                         '    INNER JOIN SYS.COLUMNS C ON C.OBJECT_ID = T.OBJECT_ID ' +
                                                                         ' WHERE T.NAME = "TPROCESSO" ' +
                                                                         ' ORDER BY C.NAME',
     'Campo da tabela TPROCESSO', ['NAME'], ['Nome'], 'NAME', nil, datm_grupo.qryFatoresNM_CAMPO_PROCESSO.AsString);
end;

procedure Tfrm_grupo.SpeedButton3Click(Sender: TObject);
begin
  datm_grupo.qryFatoresNM_TABELA.AsString := ConsultaOnLineExSQL('SELECT NAME ' +
                                                                 ' FROM SYS.TABLES ' +
                                                                 ' ORDER BY NAME',
     'Tabela Comparação', ['NAME'], ['Nome'], 'NAME', nil, datm_grupo.qryFatoresNM_TABELA.AsString);
end;

procedure Tfrm_grupo.SpeedButton4Click(Sender: TObject);
begin
  datm_grupo.qryFatoresNM_CAMPO_CHAVE_TABELA.AsString := ConsultaOnLineExSQL('SELECT C.NAME ' +
                                                                             ' FROM SYS.TABLES T ' +
                                                                             '    INNER JOIN SYS.COLUMNS C ON C.OBJECT_ID = T.OBJECT_ID ' +
                                                                             ' WHERE T.NAME = "' + datm_grupo.qryFatoresNM_TABELA.AsString + '" ' +
                                                                             ' ORDER BY C.NAME',
     'Campo chave da tabela de Comparação', ['NAME'], ['Nome'], 'NAME', nil, datm_grupo.qryFatoresNM_CAMPO_CHAVE_TABELA.AsString);
end;

procedure Tfrm_grupo.SpeedButton5Click(Sender: TObject);
begin
  datm_grupo.qryFatoresNM_CAMPO_RETORNO_TABELA.AsString := ConsultaOnLineExSQL('SELECT C.NAME ' +
                                                                               ' FROM SYS.TABLES T ' +
                                                                               '    INNER JOIN SYS.COLUMNS C ON C.OBJECT_ID = T.OBJECT_ID ' +
                                                                               ' WHERE T.NAME = "' + datm_grupo.qryFatoresNM_TABELA.AsString + '" ' +
                                                                               ' ORDER BY C.NAME',
     'Campo retorno da tabela de Comparação', ['NAME'], ['Nome'], 'NAME', nil, datm_grupo.qryFatoresNM_CAMPO_RETORNO_TABELA.AsString);
end;

procedure Tfrm_grupo.SpeedButton6Click(Sender: TObject);
begin
  datm_grupo.qryFatoresNM_TABELA_TRIGGER.AsString := ConsultaOnLineExSQL('SELECT NAME ' +
                                                                         ' FROM SYS.TABLES ' +
                                                                         ' ORDER BY NAME',
     'Tabela para trigger', ['NAME'], ['Nome'], 'NAME', nil, datm_grupo.qryFatoresNM_TABELA_TRIGGER.AsString);
end;

function Tfrm_grupo.ConsisteFatores(Sender: TObject): Boolean;
var
  MsgErro: String;
  I: Integer;

  function ValidaCampo(ACampo: TObject): Boolean;
  begin
    if ((ACampo is TDBEdit) and (TDBEdit(ACampo).Text = '')) or ((ACampo is TDBMemo) and (TDBMemo(ACampo).Text = '')) then
      Result := False
    else
      Result := True;
    if (ACampo is TDBEdit) and (TDBEdit(ACampo).DataSource.State in [dsEdit, dsInsert]) and (TDBEdit(ACampo).Text <> '') and (TDBEdit(ACampo).MaxLength > 0) then
      TDBEdit(ACampo).Field.AsString := RightStr('0000000000' + Trim(TDBEdit(ACampo).Text), TDBEdit(ACampo).MaxLength);
  end;

  function ValidaSenderCampo(ACampo: TObject): Boolean;
  begin
    if ((Sender = nil) or (Sender = ACampo)) and ValidaCampo(ACampo) then
      Result := False
    else
      Result := True;
  end;
begin
  MsgErro := '';
  case pgcFatores.ActivePageIndex of
    // Fatores
    1: begin
         if datm_grupo.qryFatores.State in [dsEdit, dsInsert] then
         begin
           if (Sender = nil) then
           begin
             for I := 0 to tbsFatoresDadoBasicos.ComponentCount -1 do
               if (Trim(TControl(tbsFatoresDadoBasicos.Components[I]).Hint) <> '') and
                  (not TControl(tbsFatoresDadoBasicos.Components[I]).ShowHint) and
                  not ValidaCampo(tbsFatoresDadoBasicos.Components[I]) then
               begin
                 Sender := tbsFatoresDadoBasicos.Components[I];
                 MsgErro := TControl(tbsFatoresDadoBasicos.Components[I]).Hint;
                 Break;
               end;
           end;
           if (MsgErro = '') then // Consiste as comparações
           begin
             if not (ValidaSenderCampo(dbedtNM_CAMPO_PROCESSO) and
                     ValidaSenderCampo(dbedtNM_TABELA) and
                     ValidaSenderCampo(dbedtNM_CAMPO_CHAVE_TABELA) and
                     ValidaSenderCampo(dbedtNM_CAMPO_RETORNO_TABELA) and
                     ValidaSenderCampo(dbmemNM_SQL)) then
             begin
               Sender := dbedtNM_CAMPO_PROCESSO;
               MsgErro := 'É necessário informar uma comparação (completa).';
             end
             else if not ValidaCampo(dbedtNM_RETORNO) then
             begin
               Sender := dbedtNM_RETORNO;
               MsgErro := 'É necessário informar um valor de retorno.';
             end;
           end;
           if (Sender <> nil) and (MsgErro = '') and (Trim(TControl(Sender).Hint) <> '') and
              (not TControl(Sender).ShowHint) and  not ValidaCampo(Sender) then
             MsgErro := TControl(Sender).Hint;
         end;
       end;

    // Campos
    2: begin
         if datm_grupo.qryFatoresCampos.State in [dsEdit, dsInsert] then
         begin
           if (Sender = nil) then
           begin
             for I := 0 to tbsFatoresCamposDados.ComponentCount -1 do
               if (Trim(TControl(tbsFatoresCamposDados.Components[I]).Hint) <> '') and
                  (not TControl(tbsFatoresCamposDados.Components[I]).ShowHint) and
                  not ValidaCampo(tbsFatoresCamposDados.Components[I]) then
               begin
                 Sender := tbsFatoresCampos.Components[I];
                 MsgErro := TControl(tbsFatoresCamposDados.Components[I]).Hint;
                 Break;
               end;
           end;
           if (MsgErro = '') then // Consiste as comparações
           begin
             if (Trim(dbedtNM_LOOKUP_TABELA.Text) <> '') and not ValidaSenderCampo(dbedtNM_LOOKUP_CAMPO_CHAVE) then
             begin
               Sender := dbedtNM_LOOKUP_CAMPO_CHAVE;
               MsgErro := 'Lookup incompleto.';
             end
             else if (Trim(dbedtNM_LOOKUP_TABELA.Text) <> '') and not ValidaSenderCampo(dbedtNM_LOOKUP_CAMPO_RETORNO) then
             begin
               Sender := dbedtNM_LOOKUP_CAMPO_RETORNO;
               MsgErro := 'Lookup incompleto.';
             end;
           end;
           if (Sender <> nil) and (MsgErro = '') and (Trim(TControl(Sender).Hint) <> '') and
              (not TControl(Sender).ShowHint) and  not ValidaCampo(Sender) then
             MsgErro := TControl(Sender).Hint;
         end;
       end;

    // Eventos
    3: begin
         if datm_grupo.qryFatoresEventos.State in [dsEdit, dsInsert] then
         begin
           if (Sender = nil) then
           begin
             for I := 0 to tbsFatoresEventosDados.ComponentCount -1 do
               if (Trim(TControl(tbsFatoresEventosDados.Components[I]).Hint) <> '') and
                  (not TControl(tbsFatoresEventosDados.Components[I]).ShowHint) and
                  not ValidaCampo(tbsFatoresEventosDados.Components[I]) then
               begin
                 Sender := tbsFatoresCampos.Components[I];
                 MsgErro := TControl(tbsFatoresEventosDados.Components[I]).Hint;
                 Break;
               end;

             if dbchkFatoresEventoAlterar.Checked and dbchkFatoresEventoExcluir.Checked and
                (MessageDlg('Marcados ALTERAR e EXCLUIR, será utilizado ALTERAR.'#13'Continuar assim mesmo?', mtConfirmation, [mbYes, mbNo], 0) <> mrYes) then
             begin
               Result := False;
               Exit;
             end;
           end;
           if ((Sender = dbchkFatoresEventoAlterar) or (Sender = dbchkFatoresEventoExcluir)) and (MsgErro = '') then // Consiste ALTERAR / EXCLUIR
           begin
             if dbchkFatoresEventoAlterar.Checked and dbchkFatoresEventoExcluir.Checked and
                (MessageDlg('Marcados ALTERAR e EXCLUIR, será utilizado ALTERAR.'#13'Continuar assim mesmo?', mtConfirmation, [mbYes, mbNo], 0) <> mrYes) then
               TDBCheckBox(Sender).Field.AsString := '0';
           end;
           if (Sender <> nil) and (MsgErro = '') and (Trim(TControl(Sender).Hint) <> '') and
              (not TControl(Sender).ShowHint) and  not ValidaCampo(Sender) then
             MsgErro := TControl(Sender).Hint;
         end;
       end;
  end;
  Result := (MsgErro = '');
  if (not Result) and Assigned(Sender) then
    TWinControl(Sender).SetFocus;
  if not Result then
    MessageDlg(MsgErro, mtInformation, [mbOK], 0);
end;

procedure Tfrm_grupo.dbedtFatoresNomeExit(Sender: TObject);
begin
  ConsisteFatores(Sender);
end;

function Tfrm_grupo.GravaFatores: Boolean;
begin
  Result := ConsisteFatores(nil);
  if Result then
    try
      case pgcFatores.ActivePageIndex of
        1: datm_grupo.qryFatores.Post;
        2: datm_grupo.qryFatoresCampos.Post;
        3: datm_grupo.qryFatoresEventos.Post;
      end;
    except
      on E: Exception do
      begin
        TrataErro(E);
        Result := False;
      end;
    end;
end;

procedure Tfrm_grupo.pgcFatoresChanging(Sender: TObject; var AllowChange: Boolean);
begin         
  if datm_grupo.qryFatores.State in [dsEdit, dsInsert] then
  begin
    case MessageDlg('Houve alteração no fator.'#13'Deseja salvar as alterações?', mtConfirmation, [mbYes, mbNo, mbCancel], 0) of
      mrYes: AllowChange := GravaFatores;
      mrNo: begin
              datm_grupo.qryFatores.Cancel;
              AllowChange := True;
            end;
    else
      AllowChange := False;
    end;
  end
  else if datm_grupo.qryFatoresCampos.State in [dsEdit, dsInsert] then
  begin
    case MessageDlg('Houve alteração nos campos do fator.'#13'Deseja salvar as alterações?', mtConfirmation, [mbYes, mbNo, mbCancel], 0) of
      mrYes: AllowChange := GravaFatores;
      mrNo: begin
              datm_grupo.qryFatoresCampos.Cancel;
              AllowChange := True;
            end;
    else
      AllowChange := False;
    end;
  end
  else if datm_grupo.qryFatoresEventos.State in [dsEdit, dsInsert] then
  begin
    case MessageDlg('Houve alteração nos eventos do fator.'#13'Deseja salvar as alterações?', mtConfirmation, [mbYes, mbNo, mbCancel], 0) of
      mrYes: AllowChange := GravaFatores;
      mrNo: begin
              datm_grupo.qryFatoresEventos.Cancel;
              AllowChange := True;
            end;
    else
      AllowChange := False;
    end;
  end
  else if (pgcFatores.NewPageIndex in [2, 3]) and (datm_grupo.qryFatores.Eof) then
  begin
    AllowChange := False;
    MessageDlg('É necessário criar um fator antes.', mtInformation, [mbOK], 0);
  end
  else
    AllowChange := True;
end;

procedure Tfrm_grupo.dbedtFatoresEventoCodigoChange(Sender: TObject);
begin
  if Sender is TSpeedButton then
  begin
    if PoeEmEdicao(datm_grupo.qryFatoresEventos) then
      datm_grupo.qryFatoresEventosCD_EVENTO.AsString := ConsultaOnLineEx('TEVENTO', 'Evento', ['CD_EVENTO', 'NM_EVENTO'], ['Código', 'Nome'], 'CD_EVENTO', nil, 1, datm_grupo.qryFatoresEventosCD_EVENTO.AsString);
  end
  else
    edtFatoresEventoNome.Text := ConsultaLookUP('TEVENTO', 'CD_EVENTO', datm_grupo.qryFatoresEventosCD_EVENTO.AsString, 'NM_EVENTO');
end;

procedure Tfrm_grupo.dbedtFatoresEventoBaseCodigoChange(Sender: TObject);
begin
  if Sender is TSpeedButton then
  begin
    if PoeEmEdicao(datm_grupo.qryFatoresEventos) then
      datm_grupo.qryFatoresEventosCD_EVENTO_BASE.AsString := ConsultaOnLineEx('TEVENTO', 'Evento', ['CD_EVENTO', 'NM_EVENTO'], ['Código', 'Nome'], 'CD_EVENTO', nil, 1, datm_grupo.qryFatoresEventosCD_EVENTO_BASE.AsString);
  end
  else
    edtFatoresEventoBaseNome.Text := ConsultaLookUP('TEVENTO', 'CD_EVENTO', datm_grupo.qryFatoresEventosCD_EVENTO_BASE.AsString, 'NM_EVENTO');
end;

procedure Tfrm_grupo.dbedtFatoresEventoAnteriorCodigoChange(Sender: TObject);
begin
  if Sender is TSpeedButton then
  begin
    if PoeEmEdicao(datm_grupo.qryFatoresEventos) then
      datm_grupo.qryFatoresEventosCD_EVENTO_ANTERIOR.AsString := ConsultaOnLineEx('TEVENTO', 'Evento', ['CD_EVENTO', 'NM_EVENTO'], ['Código', 'Nome'], 'CD_EVENTO', nil, 1, datm_grupo.qryFatoresEventosCD_EVENTO_ANTERIOR.AsString);
  end
  else
    edtFatoresEventoAnteriorNome.Text := ConsultaLookUP('TEVENTO', 'CD_EVENTO', datm_grupo.qryFatoresEventosCD_EVENTO_ANTERIOR.AsString, 'NM_EVENTO');
end;

procedure Tfrm_grupo.pgcFatoresChange(Sender: TObject);
begin
  case pgcFatores.ActivePageIndex of
    2: pgFatoresCampos.ActivePageIndex := 0;
    3: pgFatoresEventos.ActivePageIndex := 0;
  end;
end;

procedure Tfrm_grupo.btnAdicionarRefClick(Sender: TObject);
begin
  with datm_grupo do
    try
      FastExecSQL('INSERT INTO TGRUPO_REF_COMPLEM ' +
                  'SELECT :CD_GRUPO, :TP_REFERECIA, ISNULL(MAX(NR_ORDEM), 0) +1 ' +
                  'FROM TGRUPO_REF_COMPLEM ' +
                  'WHERE CD_GRUPO = :CD_GRUPO_WHERE', [qry_grupo_CD_GRUPO.AsString, qry_Tipo_ReferenciaCD_REFERENCIA.AsString, qry_grupo_CD_GRUPO.AsString]);
      qry_Tipo_Referencia.Close;
      qry_Tipo_Referencia.Open;
      qry_Grupo_Ref_Comp_DI.Close;
      qry_Grupo_Ref_Comp_DI.Open;
    except
      on E: Exception do
        MessageDlg('Ocorreu um erro efetuando a operação.'#13 + E.Message, mtError, [mbOk], 0);
    end;
end;

procedure Tfrm_grupo.btnRemoverRefClick(Sender: TObject);
begin
  datm_grupo.qry_Grupo_Ref_Comp_DI.Delete;
  datm_grupo.qry_Tipo_Referencia.Close;
  datm_grupo.qry_Tipo_Referencia.Open;
end;

procedure Tfrm_grupo.btnRemoverTodasRefClick(Sender: TObject);
begin
  FastExecSQL('DELETE TGRUPO_REF_COMPLEM ' +
              'WHERE CD_GRUPO = :CD_GRUPO', [datm_grupo.qry_grupo_CD_GRUPO.AsString]);
  datm_grupo.qry_Tipo_Referencia.Close;
  datm_grupo.qry_Tipo_Referencia.Open;
  datm_grupo.qry_Grupo_Ref_Comp_DI.Close;
  datm_grupo.qry_Grupo_Ref_Comp_DI.Open;
end;

procedure Tfrm_grupo.btnAdicionarDespesaClick(Sender: TObject);
begin
  with datm_grupo do
    try
      FastExecSQL('INSERT INTO TGRUPO_DESPESAS_BASE_ICMS ' +
                  'VALUES(:CD_GRUPO, :CD_ITEM)', [qry_grupo_CD_GRUPO.AsString, qry_DespesasCD_ITEM.AsString]);
      qry_Despesas.Close;
      qry_Despesas.Open;
      qry_Grupo_Despesas.Close;
      qry_Grupo_Despesas.Open;
    except
      on E: Exception do
        MessageDlg('Ocorreu um erro efetuando a operação.'#13 + E.Message, mtError, [mbOk], 0);
    end;
end;

procedure Tfrm_grupo.btnRemoverDespesaClick(Sender: TObject);
begin
  datm_grupo.qry_Grupo_Despesas.Delete;
  datm_grupo.qry_Despesas.Close;
  datm_grupo.qry_Despesas.Open;
end;

procedure Tfrm_grupo.btnRemoverTodasDespesasClick(Sender: TObject);
begin
  FastExecSQL('DELETE TGRUPO_DESPESAS_BASE_ICMS ' +
              'WHERE CD_GRUPO = :CD_GRUPO', [datm_grupo.qry_grupo_CD_GRUPO.AsString]);
  datm_grupo.qry_Despesas.Close;
  datm_grupo.qry_Despesas.Open;
  datm_grupo.qry_Grupo_Despesas.Close;
  datm_grupo.qry_Grupo_Despesas.Open;
end;

procedure Tfrm_grupo.btnE01_ExportadorImportadorClick(Sender: TObject);
begin
  if Sender is TSpeedButton then
  begin
    if PoeEmEdicao(datm_grupo.qry_relatorios_mail_aut_) then
      edtE01_ExportadorImportador_Cod.Text := ConsultaOnLineEx('TEMPRESA_EST', lblE01_ExportadorImportador.Caption, ['CD_EMPRESA', 'NM_EMPRESA'], ['Código', 'Nome'], 'CD_EMPRESA', nil)
  end
  else
    edtE01_ExportadorImportador_Nome.Text := ConsultaLookUP('TEMPRESA_EST', 'CD_EMPRESA', edtE01_ExportadorImportador_Cod.Text, 'NM_EMPRESA');
end;


procedure Tfrm_grupo.SpeedButton11Click(Sender: TObject);
var frmSelecionaTiposDoctosEmail : TfrmSelecionaTiposDoctosEmail;
begin
  frmSelecionaTiposDoctosEmail := TfrmSelecionaTiposDoctosEmail.Create(Self);
  try
    frmSelecionaTiposDoctosEmail.memoDoctos.text := edtTPDocto.text;
    if frmSelecionaTiposDoctosEmail.showModal = mrOk then
    if PoeEmEdicao(datm_grupo.qry_relatorios_mail_aut_) then
      edtTPDocto.text := frmSelecionaTiposDoctosEmail.memoDoctos.text;
  finally
    frmSelecionaTiposDoctosEmail.free;
  end;

{  if Sender is TSpeedButton then
  begin
    if PoeEmEdicao(datm_grupo.qry_relatorios_mail_aut_) then
    If (Sender as TSpeedButton).Enabled Then
      edtTPDocto.Text := ConsultaOnLineEx('TTP_DOCTO_DIGITALIZADO','Tipo Documento',
                                          ['CD_TIPO_DOCTO', 'NM_TIPO_DOCTO'],
                                          ['Código', 'Documento'],
                                          'CD_TIPO_DOCTO',nil)
  end
  else
    edtDocumento.Text := ConsultaLookUP('TTP_DOCTO_DIGITALIZADO','CD_TIPO_DOCTO', edtTPDocto.Text  ,'NM_TIPO_DOCTO');  }
    
end;

procedure Tfrm_grupo.btnRepresentanteClick(Sender: TObject);
begin
  if Sender is TSpeedButton then
  begin
    if not PoeEmEdicao(datm_grupo.qry_relatorios_mail_aut_) then
      exit;

    If (Sender as TSpeedButton).Enabled Then
      edtRepresentante.text:= ConsultaOnLineExSQL('SELECT DISTINCT CD_EMPRESA,NM_EMPRESA            ' +
                                                  '  FROM TEMPRESA_NAC EN (NOLOCK),                 ' +
                                                  '       TCLIENTE_REPRESENTANTE CR (NOLOCK)        ' +
                                                  ' WHERE EN.IN_REPRESENTANTE = ''1''               ' +
                                                  '   AND EN.CD_EMPRESA       = CR.CD_REPRESENTANTE ' ,
                                                  'Representantes',
                                                  ['CD_EMPRESA','NM_EMPRESA'],
                                                  ['Código','Descrição'],
                                                  'CD_EMPRESA'
                                                  ,frm_main.mi_cad_emp_nac, edtRepresentante.Text)
  end
  else
    edtRepresentanteDesc.Text := ConsultaLookUPSQL('SELECT NM_EMPRESA            '+
                                                   '  FROM TEMPRESA_NAC (NOLOCK) '+
                                                   ' WHERE CD_EMPRESA = ''' + edtRepresentante.Text + ''' '+
                                                   '   AND IN_REPRESENTANTE = ''1''',
                                                   'NM_EMPRESA');
end;

procedure Tfrm_grupo.btnCoBorderoClick(Sender: TObject);
begin
  if Sender is TSpeedButton then
  begin
    if datm_grupo.qry_grupo_.State in [dsBrowse, dsInactive] then
      datm_grupo.qry_grupo_.Edit;
    dbedtCdLayout.Text := ConsultaOnlineEx('TTP_BORDERO', 'Layouts para Emissão de Borderô',
                                          ['CD_LAYOUT', 'NM_LAYOUT'],
                                          ['Código', 'Descrição'], 'CD_LAYOUT', nil, 1, dbedtCdLayout.Text);
    Btn_Mi(False, True, True, False);
  end
  else
  begin
    if datm_grupo.qry_grupo_.State in [dsBrowse, dsInactive] then
      Exit;
    dbedtNmLayout.Text := ConsultaLookUp('TTP_BORDERO', 'CD_LAYOUT', dbedtCdLayout.Text, 'NM_LAYOUT');
    Btn_Mi(False, True, True, False);
  end;
end;

procedure Tfrm_grupo.btnCoordImpoClick(Sender: TObject);
begin
  if Sender is TSpeedButton then
  begin
    if datm_grupo.qry_grupo_.State in [dsBrowse, dsInactive] then
      datm_grupo.qry_grupo_.Edit;

    dbedtCoordImpo.Text := ConsultaOnLineExFiltro('TUSUARIO','Usuários',
                                            ['CD_USUARIO','NM_USUARIO'],
                                            ['Código','Nome'],'CD_USUARIO',
                                            'IN_ATIVO = 1 ', nil, dbedtCoordImpo.Text, 1);
  end
  else
  begin
    edtCoordImpo.Text := ConsultaLookUP('TUSUARIO','CD_USUARIO', dbedtCoordImpo.Text,'NM_USUARIO');
  end;

  if (datm_grupo.qry_grupo_.State in [dsInsert, dsEdit]) then
    Btn_Mi(False, True, True, False);
end;

procedure Tfrm_grupo.btnCoordExpoClick(Sender: TObject);
begin 
  if Sender is TSpeedButton then
  begin
    if datm_grupo.qry_grupo_.State in [dsBrowse, dsInactive] then
      datm_grupo.qry_grupo_.Edit;



    dbedtCoordExpo.Text := ConsultaOnLineExFiltro('TUSUARIO','Usuários',
                                            ['CD_USUARIO','NM_USUARIO'],
                                            ['Código','Nome'],'CD_USUARIO',
                                            'IN_ATIVO = 1 ', nil, dbedtCoordExpo.Text, 1);
  end
  else
  begin
    edtCoordExpo.Text := ConsultaLookUP('TUSUARIO','CD_USUARIO', dbedtCoordExpo.Text,'NM_USUARIO');
  end;

  if (datm_grupo.qry_grupo_.State in [dsInsert, dsEdit]) then
    Btn_Mi(False, True, True, False);  

end;

procedure Tfrm_grupo.btnAddClick(Sender: TObject);
  var LEmailsInserir : TStrings; i : integer;
begin
  if trim(edtNovoEmail.text) <> '' then
  begin
    LEmailsInserir := TStringList.Create;
    LEmailsInserir.Clear;
    LEmailsInserir.Delimiter       := ';';
    LEmailsInserir.DelimitedText   := edtNovoEmail.text;

    datm_grupo.cdsEmailConsultaLiStatus.DisableControls;
    for i := 0 to LEmailsInserir.count - 1 do
    begin
      if Trim(LEmailsInserir[i]) <> '' then
      begin
        if not VerificaEmailJaExiste(LEmailsInserir[i]) then
        begin
          datm_grupo.cdsEmailConsultaLiStatus.append;
          datm_grupo.cdsEmailConsultaLiStatus.fieldByName('NM_EMAIL').asString := LEmailsInserir[i];
          datm_grupo.cdsEmailConsultaLiStatus.post;
        end;
      end;
    end;
    datm_grupo.cdsEmailConsultaLiStatus.EnableControls;

    PreencheEmailsProcesso;
  end;
end;

procedure Tfrm_grupo.btnRemoveClick(Sender: TObject);
begin
  if not datm_grupo.cdsEmailConsultaLiStatus.isEmpty then
  begin
    datm_grupo.cdsEmailConsultaLiStatus.delete;
    PreencheEmailsProcesso;
  end;
end;

procedure Tfrm_grupo.dbmmNM_EMAIL_CONSULTA_LI_STATUSChange(
  Sender: TObject);
var
    emails : string;
    ListaEmails : TStrings;
    i : integer;
begin
  edtNovoEmail.clear;
  emails := datm_grupo.qry_grupo_.fieldByName('NM_EMAIL_CONSULTA_LI_STATUS').asString;

  ListaEmails := TStringList.Create;
  ListaEmails.Clear;
  ListaEmails.Delimiter       := ';';
  ListaEmails.DelimitedText   := emails;

  datm_grupo.cdsEmailConsultaLiStatus.DisableControls;
  datm_grupo.cdsEmailConsultaLiStatus.EmptyDataSet;
  for i := 0 to ListaEmails.count - 1 do
  begin
    if trim(ListaEmails[i]) <> '' then
    begin
      datm_grupo.cdsEmailConsultaLiStatus.append;
      datm_grupo.cdsEmailConsultaLiStatus.fieldByName('NM_EMAIL').asString := ListaEmails[i];
      datm_grupo.cdsEmailConsultaLiStatus.post;
    end;
  end;
  datm_grupo.cdsEmailConsultaLiStatus.first;
  datm_grupo.cdsEmailConsultaLiStatus.EnableControls;
end;


procedure Tfrm_grupo.PreencheEmailsProcesso;
var emails :String;
begin
  emails := '';
  datm_grupo.cdsEmailConsultaLiStatus.DisableControls;
  datm_grupo.cdsEmailConsultaLiStatus.first;
  while not datm_grupo.cdsEmailConsultaLiStatus.eof do
  begin
    emails := emails + StringReplace(datm_grupo.cdsEmailConsultaLiStatus.fieldByName('NM_EMAIL').asString, ';', '', [rfReplaceAll]) + ';';

    datm_grupo.cdsEmailConsultaLiStatus.next;
  end;
  datm_grupo.cdsEmailConsultaLiStatus.EnableControls;

  if not (datm_grupo.qry_grupo_.State in [dsInsert, dsEdit]) then
  begin
    datm_grupo.qry_grupo_.edit;
    Btn_Mi(False, True, True, False);
  end;

  datm_grupo.qry_grupo_.fieldByName('NM_EMAIL_CONSULTA_LI_STATUS').asString := emails;
end;

function Tfrm_grupo.VerificaEmailJaExiste(Email : String) : Boolean;
begin
  Result := false;
  datm_grupo.cdsEmailConsultaLiStatus.first;
  while not datm_grupo.cdsEmailConsultaLiStatus.eof do
  begin
    if AnsiCompareText(Email, datm_grupo.cdsEmailConsultaLiStatus.fieldByName('NM_EMAIL').asString) = 0 then
    begin
      Result := true;
      break;
    end;
    datm_grupo.cdsEmailConsultaLiStatus.next;
  end;
end;

procedure Tfrm_grupo.btnAddVariavelClick(Sender: TObject);
begin
  frmCartaConfig := TfrmCartaConfig.Create(Self);
  try
    frmCartaConfig.ConfiguraTelaParaCadEmailGrupo;
    if frmCartaConfig.showModal = mrOk then
    if PoeEmEdicao(datm_grupo.qry_relatorios_mail_aut_) then
      datm_grupo.qry_relatorios_mail_aut_.fieldByName('NM_RELATORIO').asstring  := dbmNM_RELATORIO.text  + ' ' + frmCartaConfig.edtVariavelSelecionada.text;
  finally
    frmCartaConfig.free;
  end;

end;

procedure Tfrm_grupo.btnServicoClick(Sender: TObject);
begin
  if Sender is TSpeedButton then
  begin
    if PoeEmEdicao(datm_grupo.qry_relatorios_mail_aut_) then
      edtcdServico.Text := ConsultaOnLineExFiltro('VW_SERVICO_GERAL','Serviço Novo',
                                                 ['CD_SERVICO','NM_SERVICO'],['Código','Nome'],'CD_SERVICO', 'IN_NOVO_SERVICO = 1',nil)
  end
  else
    edtnmServico.Text := ConsultaLookUP('VW_SERVICO_GERAL','CD_SERVICO', edtcdServico.Text,'NM_SERVICO');  
end;

procedure Tfrm_grupo.btnArmazemDescargaClick(Sender: TObject);
begin
  if Sender is TSpeedButton then
  begin
    if PoeEmEdicao(datm_grupo.qry_relatorios_mail_aut_) then
      edtArmazemDescarga.Text := ConsultaOnLineEx('TARMAZEM','Armazém',['CD_ARMAZEM','NM_ARMAZEM','NM_SIGLA', 'CD_RECINTO'],
                          ['Código','Nome','Sigla', 'Recinto'],'CD_ARMAZEM')
  end
  else
    edtNmArmazemDescarga.Text := ConsultaLookUP('TARMAZEM','CD_ARMAZEM',edtArmazemDescarga.Text,'NM_ARMAZEM');
end;

procedure Tfrm_grupo.btnAgenteCargaClick(Sender: TObject);
begin
  if Sender is TSpeedButton then
  begin
    if PoeEmEdicao(datm_grupo.qry_relatorios_mail_aut_) then
      edtAgenteCarga.Text := ConsultaOnLineEx('TAGENTE','Agentes',['CD_AGENTE','NM_AGENTE','NM_AGENTE_REDUZIDO'],['Código','Nome','Apelido'],'CD_AGENTE');
  end
  else
    edtNmAgenteCarga.Text := ConsultaLookUP('TAGENTE','CD_AGENTE',edtAgenteCarga.Text,'ISNULL(NM_AGENTE_REDUZIDO,NM_AGENTE)');
end;

procedure Tfrm_grupo.btnLocalDesembarqueClick(Sender: TObject);
begin
  if Sender is TSpeedButton then
  begin
    if PoeEmEdicao(datm_grupo.qry_relatorios_mail_aut_) then
      edtCdLocalDesembarque.Text :=  ConsultaOnLineEx('TLOCAL_EMBARQUE','Local Desembarque',['CODIGO','DESCRICAO'],['Código','Nome'],'CODIGO');
  end
  else
    edtLocalDesembarque.Text :=  ConsultaLookUP('TLOCAL_EMBARQUE','CODIGO',edtCdLocalDesembarque.Text,'DESCRICAO');
end;

procedure Tfrm_grupo.btnGestorContasClick(Sender: TObject);
begin
  if Sender is TSpeedButton then
  begin
    if datm_grupo.qry_grupo_.State in [dsBrowse, dsInactive] then
      datm_grupo.qry_grupo_.Edit;

    edtCdGestorContas.Text := ConsultaOnLineExFiltro('TUSUARIO','Usuários',
                                            ['CD_USUARIO','NM_USUARIO'],
                                            ['Código','Nome'],'CD_USUARIO',
                                            'IN_ATIVO = 1 ', nil, edtCdGestorContas.Text, 1);
  end
  else
  begin
    edtGestorContas.Text := ConsultaLookUP('TUSUARIO','CD_USUARIO', edtCdGestorContas.Text,'NM_USUARIO');
  end;

  if (datm_grupo.qry_grupo_.State in [dsInsert, dsEdit]) then
    Btn_Mi(False, True, True, False);
end;

procedure Tfrm_grupo.btn_incluir_reajusteClick(Sender: TObject);
begin
  if datm_grupo.qryGrupoReajusteContr.State in [dsInsert] then
    datm_grupo.qryGrupoReajusteContr.Cancel;

  datm_grupo.qryGrupoReajusteContr.Append;
  datm_grupo.qryGrupoReajusteContrCD_GRUPO.AsString := datm_grupo.qry_grupo_CD_GRUPO.AsString;

  pnlGrupoReajusteContr.Enabled := True;
  dbePedidoReajuste.SetFocus;

  btn_incluir_reajuste.Enabled  := False;
  btn_salvar_reajuste.Enabled   := True;
  btn_cancelar_reajuste.Enabled := True;
  btn_excluir_reajuste.Enabled  := False;

end;

procedure Tfrm_grupo.btn_salvar_reajusteClick(Sender: TObject);
begin
  ActiveControl := nil;

  if Not Consiste then Exit;

  try
    if (datm_grupo.qry_grupo_.State = dsInsert) and (not Grava) then
      Exit;

    datm_main.db_broker.StartTransaction;

    if ( datm_grupo.qry_grupo_.State in [dsEdit] ) then datm_grupo.qry_grupo_.Post;

    if datm_grupo.qryGrupoReajusteContr.State in [ dsInsert, dsEdit ] then
      datm_grupo.qryGrupoReajusteContr.Post;

    datm_main.db_broker.Commit;
    SelectReajusteContrato;
  except
    on E: Exception do
    begin
      if datm_grupo.qryGrupoReajusteContr.State in [dsInsert, dsEdit] then
        datm_grupo.qryGrupoReajusteContr.Cancel;
      if datm_main.db_broker.InTransaction then
        datm_main.db_broker.Rollback;
      TrataErro(E);
    end;
  end;

  btn_incluir_reajuste.Enabled  := st_incluir;
  btn_salvar_reajuste.Enabled   := False;
  btn_cancelar_reajuste.Enabled := False;
  if datm_grupo.qryGrupoReajusteContr.RecordCount > 0 then
    btn_excluir_reajuste.Enabled  := st_excluir;

end;

procedure Tfrm_grupo.btn_cancelar_reajusteClick(Sender: TObject);
begin
  btn_incluir_reajuste.Enabled  := st_incluir;
  btn_salvar_reajuste.Enabled   := False;
  btn_cancelar_reajuste.Enabled := False;
  if datm_grupo.qryGrupoReajusteContr.RecordCount > 0 then
    btn_excluir_reajuste.Enabled  := st_excluir;


  if datm_grupo.qryGrupoReajusteContr.State in [ dsInsert, dsEdit ] then
    datm_grupo.qryGrupoReajusteContr.Cancel;

  SelectReajusteContrato;    
end;

procedure Tfrm_grupo.btn_excluir_reajusteClick(Sender: TObject);
var
  vNrProcesso, vNrLI : String;
begin
  if BoxMensagem( 'Este reajuste do contrato será excluído!' + #13#10 + 'Confirma exclusão?', 1 ) then
    try
      datm_main.db_broker.StartTransaction;
      datm_grupo.qryGrupoReajusteContr.Delete;
      datm_main.db_broker.Commit;
      SelectReajusteContrato;      
    except
      on E: Exception do
      begin
        datm_grupo.qryGrupoReajusteContr.Cancel;
        if datm_main.db_broker.InTransaction then datm_main.db_broker.Rollback;
        TrataErro(E);
      end;
    end;
end;

procedure Tfrm_grupo.SelectReajusteContrato;
begin
  datm_grupo.qryGrupoReajusteContr.Close;
  datm_grupo.qryGrupoReajusteContr.ParamByName('CD_GRUPO').AsString := datm_grupo.qry_grupo_CD_GRUPO.AsString;
  datm_grupo.qryGrupoReajusteContr.Open;

  if datm_grupo.qryGrupoReajusteContr.IsEmpty then
    pnlGrupoReajusteContr.Enabled := False;
end;

procedure Tfrm_grupo.dbePedidoReajusteChange(Sender: TObject);
begin
  if ( datm_grupo.qryGrupoReajusteContr.State in [ dsInsert, dsEdit ] ) then
  begin
    btn_incluir_reajuste.Enabled  := False;
    btn_salvar_reajuste.Enabled   := True;
    btn_cancelar_reajuste.Enabled := True;
    btn_excluir_reajuste.Enabled  := False;
  end;
end;

procedure Tfrm_grupo.btnArmazemEstocagemClick(Sender: TObject);
begin
  if Sender is TSpeedButton then
  begin
    If PoeEmEdicao(datm_grupo.qry_relatorios_mail_aut_) Then
      edtCdArmazemEstocagem.Text := ConsultaOnLineEx('TARMAZEM','Armazém',['CD_ARMAZEM','NM_ARMAZEM','NM_SIGLA','CD_RECINTO'],['Código','Nome','Sigla', 'Recinto'],'CD_ARMAZEM');
  end
  else
    edtArmazemEstocagem.Text := ConsultaLookUP('TARMAZEM','CD_ARMAZEM',edtCdArmazemEstocagem.Text,'NM_ARMAZEM');

end;

end.
