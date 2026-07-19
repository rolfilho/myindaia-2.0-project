unit uReCapa;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, Buttons, StdCtrls, Grids, DBGrids, ComCtrls, Mask, DBCtrls, dbtables,
  Db, StrUtils, UCRPE32, Variants, MaskUtils, cxStyles, cxCustomData,
  cxGraphics, cxFilter, cxData, cxDataStorage, cxEdit, cxDBData,
  cxTextEdit, cxDBLookupComboBox, cxGridCustomTableView, cxGridTableView,
  cxGridDBTableView, cxGridLevel, cxClasses, cxControls, cxGridCustomView,
  cxGrid, cxLookAndFeels, cxLookAndFeelPainters, dxSkinsCore,
  dxSkinsDefaultPainters, dxSkinscxPCPainter;

type
  Tfrm_re_capa = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    pgRe: TPageControl;
    tabLista: TTabSheet;
    tabReBasicas: TTabSheet;
    tabReCompl: TTabSheet;
    tabAnexo: TTabSheet;
    tabAnexoCompl: TTabSheet;
    btn_incluir: TSpeedButton;
    btn_salvar: TSpeedButton;
    btn_cancelar: TSpeedButton;
    btn_excluir: TSpeedButton;
    btn_sair: TSpeedButton;
    Shape1: TShape;
    edt_nr_processo: TDBEdit;
    Label4: TLabel;
    DBEdit3: TDBEdit;
    Label5: TLabel;
    DBEdit4: TDBEdit;
    Label6: TLabel;
    edt_cd_enquad1: TDBEdit;
    Label7: TLabel;
    edt_cd_enquad2: TDBEdit;
    Label8: TLabel;
    edt_cd_enquad3: TDBEdit;
    Label9: TLabel;
    edt_cd_enquad4: TDBEdit;
    Label10: TLabel;
    edt_cd_enquad5: TDBEdit;
    Label11: TLabel;
    edt_cd_enquad6: TDBEdit;
    btn_co_enquad1: TSpeedButton;
    btn_co_enquad2: TSpeedButton;
    btn_co_enquad4: TSpeedButton;
    btn_co_enquad3: TSpeedButton;
    btn_co_enquad5: TSpeedButton;
    btn_co_enquad6: TSpeedButton;
    Label12: TLabel;
    Shape16: TShape;
    Label13: TLabel;
    edt_cd_urf_embarque: TDBEdit;
    Label14: TLabel;
    edt_cd_urf_despacho: TDBEdit;
    edt_nm_urf_despacho: TEdit;
    edt_nm_urf_embarque: TEdit;
    btn_co_urf_despacho: TSpeedButton;
    btn_co_urf_embarque: TSpeedButton;
    Label15: TLabel;
    edt_cd_importador: TDBEdit;
    edt_nm_importador: TEdit;
    btn_co_importador: TSpeedButton;
    Label16: TLabel;
    DBEdit14: TDBEdit;
    Label17: TLabel;
    DBEdit15: TDBEdit;
    Label18: TLabel;
    DBEdit16: TDBEdit;
    Label19: TLabel;
    DBEdit17: TDBEdit;
    Label20: TLabel;
    Label21: TLabel;
    edt_cidade_importador: TEdit;
    Label22: TLabel;
    edt_nm_pais: TEdit;
    Shape2: TShape;
    Shape3: TShape;
    Shape4: TShape;
    Label23: TLabel;
    DBEdit18: TDBEdit;
    Label24: TLabel;
    DBEdit19: TDBEdit;
    Label25: TLabel;
    DBEdit20: TDBEdit;
    Label26: TLabel;
    DBEdit21: TDBEdit;
    Label1: TLabel;
    edt_cd_exportador: TDBEdit;
    edt_nm_exportador: TEdit;
    btn_co_exportador: TSpeedButton;
    Label44: TLabel;
    edt_nr_cnpj_exp: TEdit;
    Shape5: TShape;
    Shape7: TShape;
    Shape8: TShape;
    Label45: TLabel;
    Label46: TLabel;
    Label47: TLabel;
    Label48: TLabel;
    Shape9: TShape;
    Shape10: TShape;
    Label49: TLabel;
    edt_cd_naladi: TDBEdit;
    Label50: TLabel;
    edt_cd_ncm: TDBEdit;
    edt_nm_ncm: TEdit;
    btn_co_ncm: TSpeedButton;
    edt_nm_naladi: TEdit;
    btn_co_naladi: TSpeedButton;
    Shape11: TShape;
    DBText1: TDBText;
    Shape12: TShape;
    Label51: TLabel;
    Label52: TLabel;
    Shape13: TShape;
    DBText2: TDBText;
    chk_export_fabric: TDBCheckBox;
    chk_obs_exportador: TDBCheckBox;
    Label53: TLabel;
    edt_cd_finalidade: TDBEdit;
    edt_nm_finalidade: TEdit;
    btn_co_finalidade: TSpeedButton;
    Label54: TLabel;
    DBEdit43: TDBEdit;
    Label57: TLabel;
    DBEdit46: TDBEdit;
    Label55: TLabel;
    DBEdit44: TDBEdit;
    Label56: TLabel;
    Shape14: TShape;
    Label58: TLabel;
    Shape15: TShape;
    Label59: TLabel;
    Shape17: TShape;
    Label60: TLabel;
    Shape18: TShape;
    Shape19: TShape;
    Label61: TLabel;
    DBEdit45: TDBEdit;
    Label62: TLabel;
    DBEdit47: TDBEdit;
    Label63: TLabel;
    DBEdit48: TDBEdit;
    Label64: TLabel;
    DBEdit49: TDBEdit;
    Label65: TLabel;
    edt_cd_unid_medida: TDBEdit;
    edt_nm_unid_medida: TEdit;
    btn_co_unid_medida: TSpeedButton;
    Label66: TLabel;
    DBEdit51: TDBEdit;
    Label67: TLabel;
    DBEdit52: TDBEdit;
    Label68: TLabel;
    DBEdit53: TDBEdit;
    Label69: TLabel;
    DBEdit54: TDBEdit;
    Shape29: TShape;
    btn_co_processo: TSpeedButton;
    Panel4: TPanel;
    edt_merc1: TEdit;
    edt_merc2: TEdit;
    edt_merc4: TEdit;
    edt_merc3: TEdit;
    edt_merc8: TEdit;
    edt_merc7: TEdit;
    edt_merc6: TEdit;
    edt_merc5: TEdit;
    edt_merc9: TEdit;
    btn_inc_obs_exportador: TSpeedButton;
    Shape35: TShape;
    noteNavegacao: TNotebook;
    dbAnexo: TDBText;
    Shape6: TShape;
    DBNavigator1: TDBNavigator;
    Label72: TLabel;
    cb_ordem: TComboBox;
    DBMemo1: TDBMemo;
    DBMemo2: TDBMemo;
    btn_classifica: TSpeedButton;
    Shape37: TShape;
    Label73: TLabel;
    DBText5: TDBText;
    Shape38: TShape;
    Panel6: TPanel;
    Shape30: TPanel;
    Label33: TLabel;
    DBEdit28: TDBEdit;
    Shape31: TPanel;
    Label31: TLabel;
    Label32: TLabel;
    DBEdit26: TDBEdit;
    EditValSemCobCambio: TDBEdit;
    Shape32: TPanel;
    Label30: TLabel;
    DBEdit25: TDBEdit;
    Shape33: TPanel;
    Label42: TLabel;
    DBEdit37: TDBEdit;
    Shape34: TPanel;
    Label40: TLabel;
    Label41: TLabel;
    DBEdit35: TDBEdit;
    dbedt_tp_indicador: TDBEdit;
    Shape25: TPanel;
    Label39: TLabel;
    DBEdit34: TDBEdit;
    Shape26: TPanel;
    Label38: TLabel;
    DBEdit33: TDBEdit;
    Shape27: TPanel;
    Label37: TLabel;
    DBEdit32: TDBEdit;
    Shape28: TPanel;
    Label36: TLabel;
    btn_co_moeda: TSpeedButton;
    edt_cd_moeda: TDBEdit;
    edt_nm_moeda: TEdit;
    Shape23: TPanel;
    Label35: TLabel;
    SpeedButton15: TSpeedButton;
    dbedt_cd_modalidade_trans: TDBEdit;
    edt_nm_modalidade_trans: TEdit;
    Shape24: TPanel;
    Label29: TLabel;
    DBEdit24: TDBEdit;
    Shape21: TPanel;
    Label27: TLabel;
    btn_co_inst_neg: TSpeedButton;
    edt_cd_inst_neg: TDBEdit;
    edt_nm_inst_neg: TEdit;
    Shape20: TPanel;
    Label28: TLabel;
    btn_co_pais_destino: TSpeedButton;
    edt_cd_pais_destino: TDBEdit;
    edt_nm_pais_destino: TEdit;
    Shape22: TPanel;
    Label34: TLabel;
    SpeedButton14: TSpeedButton;
    dbedt_cd_incoterm: TDBEdit;
    edt_nm_incoterm: TEdit;
    Shape39: TShape;
    Label74: TLabel;
    Shape40: TShape;
    Shape41: TShape;
    Label2: TLabel;
    lblQtTotalAnexos: TLabel;
    btn_inc_anexo_fabric: TSpeedButton;
    SpeedButton1: TSpeedButton;
    Label70: TLabel;
    DBEdit1: TDBEdit;
    Label75: TLabel;
    Label76: TLabel;
    edt_cd_ufprodutor: TDBEdit;
    edt_nm_ufprodutor: TEdit;
    btn_co_ufprodutor: TSpeedButton;
    Label77: TLabel;
    DBEdit5: TDBEdit;
    pnlFreteSeguro: TPanel;
    pnlSeguro: TPanel;
    pnlFrete: TPanel;
    Label78: TLabel;
    Label79: TLabel;
    DBEdit2: TDBEdit;
    DBEdit6: TDBEdit;
    Label80: TLabel;
    Panel7: TPanel;
    Label81: TLabel;
    SpeedButton2: TSpeedButton;
    Panel8: TPanel;
    Label82: TLabel;
    Shape36: TShape;
    pnlDiferenca: TPanel;
    Label83: TLabel;
    Shape42: TShape;
    Shape43: TShape;
    Shape44: TShape;
    Shape45: TShape;
    pnlObsExport: TPanel;
    Panel11: TPanel;
    Label85: TLabel;
    Shape46: TShape;
    Panel12: TPanel;
    edt_obsexport1: TEdit;
    edt_obsexport2: TEdit;
    edt_obsexport4: TEdit;
    edt_obsexport3: TEdit;
    edt_obsexport8: TEdit;
    edt_obsexport7: TEdit;
    edt_obsexport6: TEdit;
    edt_obsexport5: TEdit;
    edt_obsexport9: TEdit;
    edt_obsexport10: TEdit;
    SpeedButton3: TSpeedButton;
    SpeedButton4: TSpeedButton;
    ntbHistorico: TNotebook;
    Panel5: TPanel;
    shpSituacao: TShape;
    lblSituacao: TDBText;
    Bevel1: TBevel;
    Label43: TLabel;
    btn_co_unidade: TSpeedButton;
    lblTitSituacao: TLabel;
    lblDataSituacao: TDBText;
    edt_cd_unidade: TEdit;
    edt_nm_unidade: TEdit;
    Panel9: TPanel;
    DBGrid1: TDBGrid;
    Panel3: TPanel;
    Shape52: TShape;
    DBText4: TDBText;
    DBText6: TDBText;
    Shape53: TShape;
    Shape54: TShape;
    Panel14: TPanel;
    SpeedButton5: TSpeedButton;
    SpeedButton6: TSpeedButton;
    SpeedButton7: TSpeedButton;
    DBMemo3: TDBMemo;
    crp_historico: TCRPE;
    qry_dde_estagios: TQuery;
    ds_dde_estagios: TDataSource;
    qry_dde_estagiosNR_PROCESSO: TStringField;
    qry_dde_estagiosCD_TIPO: TIntegerField;
    qry_dde_estagiosIN_CONCLUIDO: TStringField;
    qry_dde_estagiosDT_CONCLUSAO: TDateTimeField;
    qry_dde_estagiosNM_ESTAGIO_BROKER: TStringField;
    qry_dde_estagiosNM_ESTAGIO_SISCOMEX: TStringField;
    qry_dde_estagiosIN_POSSUI_DOCUMENTO: TStringField;
    qry_dde_estagiosNM_BSL: TStringField;
    qry_dde_estagiosTX_DOCUMENTO_SISCOMEX: TMemoField;
    DBLookupComboBox1: TDBLookupComboBox;
    btn_co_destino: TSpeedButton;
    mem_end_importador: TDBMemo;
    edt_pais_importador: TDBEdit;
    Label84: TLabel;
    msk_cd_produto: TMaskEdit;
    edt_nm_produto: TEdit;
    btn_co_produto: TSpeedButton;
    ds_emp_nac: TDataSource;
    qry_emp_nac_: TQuery;
    qry_emp_nac_CD_EMPRESA: TStringField;
    qry_emp_nac_NM_EMPRESA: TStringField;
    qry_usuario_habilitacao_: TQuery;
    qry_usuario_habilitacao_CD_UNID_NEG: TStringField;
    qry_usuario_habilitacao_CD_PRODUTO: TStringField;
    qry_exec_sp_: TQuery;
    qry_exec_sp_CD_UNID_NEG: TStringField;
    qry_exec_sp_CD_PRODUTO: TStringField;
    qry_produto_: TQuery;
    qry_produto_NM_PRODUTO: TStringField;
    qry_unid_neg_: TQuery;
    qry_unid_neg_CD_UNID_NEG: TStringField;
    qry_unid_neg_NM_UNID_NEG: TStringField;
    edt_unid: TDBEdit;
    edt_desc: TDBEdit;
    dbedt_cd_sulf_ncm: TDBEdit;
    SpeedButton8: TSpeedButton;
    captura_telas: TMemo;
    chkProcessos: TCheckBox;
    dbedt_nr_processo_complemento: TDBEdit;
    shp1: TShape;
    Panel10: TPanel;
    Panel13: TPanel;
    SpeedButton9: TSpeedButton;
    Shape47: TShape;
    Label3: TLabel;
    Shape49: TShape;
    Bevel2: TBevel;
    btnImportar: TSpeedButton;
    btnImportarDados: TSpeedButton;
    lbl1: TLabel;
    edtProcessoImportar: TEdit;
    lblSair: TLabel;
    DBEdit7: TDBEdit;
    DBEdit8: TDBEdit;
    Label86: TLabel;
    Label87: TLabel;
    pnl_dat: TPanel;
    Label88: TLabel;
    Label89: TLabel;
    edt_dat: TEdit;
    SpeedButton10: TSpeedButton;
    Bevel3: TBevel;
    btnConfirmaIntegraRE: TSpeedButton;
    btnIntegraRE: TSpeedButton;
    AbreDAT: TOpenDialog;
    btnRetornoRE: TBitBtn;
    btn_OBS_EXPORTADOR: TSpeedButton;
    SpeedButton11: TSpeedButton;
    edt_anexo: TEdit;
    tbsFila: TTabSheet;
    gpbTipoFila: TGroupBox;
    rdbCancelar: TRadioButton;
    rdbCancelados: TRadioButton;
    rdbCancelamentoCancelado: TRadioButton;
    cxgdbtFila: TcxGridDBTableView;
    cxglFila: TcxGridLevel;
    cxgFila: TcxGrid;
    cxgdbtFilaDBNR_PROCESSO: TcxGridDBColumn;
    cxgdbtFilaDBNR_PROCESSO_COMPLEMENTO: TcxGridDBColumn;
    cxgdbtFilaDBNR_RE: TcxGridDBColumn;
    cxgdbtFilaDBIN_CANCELADO: TcxGridDBColumn;
    Panel15: TPanel;
    cbRegistrados: TCheckBox;
    ck_ult_proc: TCheckBox;
    Label90: TLabel;
    edtDataConsultaInicial: TMaskEdit;
    Label91: TLabel;
    edtDataConsultaFinal: TMaskEdit;
    lblDataConsulta: TLabel;
    Label92: TLabel;
    edrQtRegistros: TEdit;
    Label71: TLabel;
    Label93: TLabel;
    btnPesquisar: TBitBtn;
    edtExportador: TEdit;
    cbExportador: TDBLookupComboBox;
    lblExportador: TLabel;
    mskNrProcesso: TMaskEdit;
    mskNrRegistro: TMaskEdit;
    lblLimpar: TLabel;
    procedure btn_sairClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btn_co_unidadeClick(Sender: TObject);
    procedure edt_cd_unidadeExit(Sender: TObject);
    procedure btn_incluirClick(Sender: TObject);
    procedure btn_salvarClick(Sender: TObject);
    procedure btn_cancelarClick(Sender: TObject);
    procedure btn_excluirClick(Sender: TObject);
    procedure pgReChange(Sender: TObject);
    procedure btn_co_exportadorClick(Sender: TObject);
    procedure btn_co_enquad1Click(Sender: TObject);
    procedure btn_co_enquad2Click(Sender: TObject);
    procedure btn_co_enquad3Click(Sender: TObject);
    procedure btn_co_enquad4Click(Sender: TObject);
    procedure btn_co_enquad5Click(Sender: TObject);
    procedure btn_co_enquad6Click(Sender: TObject);
    procedure btn_cd_paisClick(Sender: TObject);
    procedure btn_co_importadorClick(Sender: TObject);
    procedure btn_co_pais_destinoClick(Sender: TObject);
    procedure btn_co_moedaClick(Sender: TObject);
    procedure btn_co_ncmClick(Sender: TObject);
    procedure btn_co_naladiClick(Sender: TObject);
    procedure btn_co_unid_medidaClick(Sender: TObject);
    procedure btn_co_finalidadeClick(Sender: TObject);
    procedure btn_co_inst_negClick(Sender: TObject);
    procedure edt_chaveChange(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure chk_obs_exportadorClick(Sender: TObject);
    procedure btn_classificaClick(Sender: TObject);
    procedure btn_co_processoClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure edt_nr_processoExit(Sender: TObject);
    procedure btn_co_urf_embarqueClick(Sender: TObject);
    procedure btn_co_urf_despachoClick(Sender: TObject);
    procedure edt_pais_importadorChange(Sender: TObject);
    procedure edt_cd_exportadorExit(Sender: TObject);
    procedure edt_cd_importadorExit(Sender: TObject);
    procedure edt_cd_unid_medidaExit(Sender: TObject);
    procedure pgReChanging(Sender: TObject; var AllowChange: Boolean);
    procedure edt_merc1KeyPress(Sender: TObject; var Key: Char);
    procedure edt_cd_unidadeKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure btn_inc_anexo_fabricClick(Sender: TObject);
    procedure chk_export_fabricClick(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure SpeedButton14Click(Sender: TObject);
    procedure SpeedButton15Click(Sender: TObject);
    procedure CalculoIncoterm;
    procedure CalculoEsqPgTotal;
    function  AlimentaManutencao : Boolean;
    function  ExecutarCalculoIncoterm : Boolean;
    procedure SpeedButton2Click(Sender: TObject);
    procedure DBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure cb_ordemChange(Sender: TObject);
    procedure btn_co_ufprodutorClick(Sender: TObject);
    procedure SpeedButton3Click(Sender: TObject);
    procedure btn_inc_obs_exportadorClick(Sender: TObject);
    procedure DBEdit3Exit(Sender: TObject);
    procedure SpeedButton4Click(Sender: TObject);
    procedure SpeedButton7Click(Sender: TObject);
    procedure SpeedButton5Click(Sender: TObject);
    procedure SpeedButton6Click(Sender: TObject);
    procedure ntbHistoricoExit(Sender: TObject);
    procedure cb_ordemClick(Sender: TObject);
    procedure edt_cd_urf_despachoExit(Sender: TObject);
    procedure edt_cd_urf_embarqueExit(Sender: TObject);
    procedure edt_cd_pais_destinoExit(Sender: TObject);
    procedure btn_co_destinoClick(Sender: TObject);
    procedure edt_pais_importadorExit(Sender: TObject);
    procedure btn_co_produtoClick(Sender: TObject);
    procedure msk_cd_produtoExit(Sender: TObject);
    procedure msk_cd_produtoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edt_cd_ncmExit(Sender: TObject);
    procedure SpeedButton8Click(Sender: TObject);
    procedure DBGrid1DblClick(Sender: TObject);
    procedure DBGrid1CellClick(Column: TColumn);
    procedure btnImportarDadosClick(Sender: TObject);
    procedure btnImportarClick(Sender: TObject);
    procedure SpeedButton9Click(Sender: TObject);
    procedure lblSairClick(Sender: TObject);
    procedure edt_cd_unidadeEnter(Sender: TObject);
    procedure msk_cd_produtoEnter(Sender: TObject);
    procedure cbRegistradosClick(Sender: TObject);
    procedure btnConfirmaIntegraREClick(Sender: TObject);
    procedure btnIntegraREClick(Sender: TObject);
    procedure pnl_datExit(Sender: TObject);
    procedure SpeedButton10Click(Sender: TObject);
    procedure btnRetornoREClick(Sender: TObject);
    procedure ck_ult_procClick(Sender: TObject);
    function DePara_RE(pUnidade,pProduto,pTabela,pCodigoExterno : string) : string;
    procedure btn_OBS_EXPORTADORClick(Sender: TObject);
    procedure SpeedButton11Click(Sender: TObject);
    procedure edt_anexoExit(Sender: TObject);
    procedure edt_anexoKeyPress(Sender: TObject; var Key: Char);
    procedure dbAnexoClick(Sender: TObject);
    procedure dbedt_cd_sulf_ncmExit(Sender: TObject);
    procedure btnConfirmaIntegraREItensClick(Sender: TObject);
    procedure btnConfirmaIntegraJP(Sender: TObject);
    procedure rdbCancelarClick(Sender: TObject);
    procedure btnPesquisarClick(Sender: TObject);
    procedure edrQtRegistrosKeyPress(Sender: TObject; var Key: Char);
    procedure edtRegistroKeyPress(Sender: TObject; var Key: Char);
    procedure edtExportadorKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtExportadorExit(Sender: TObject);
    procedure cbExportadorCloseUp(Sender: TObject);
    procedure cbExportadorExit(Sender: TObject);
    procedure cbExportadorKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtDataConsultaInicialExit(Sender: TObject);
    procedure edtDataConsultaFinalExit(Sender: TObject);
  private
    vUnidade, vProduto : string;
    valor : String;
    a_str_indices : Array[0..5] Of String[60];
    procedure PosicionaNotebook;
    function VerificaUltimoComplemento(pProcesso: string): string;
    procedure BuscarCodigoExport;
    procedure PreencherCodigoExport;
    { Private declarations }
  public
    procedure LeMercComQuebras;
    procedure LeObsExportComQuebras;
    function CamposAtivos(Ativo : Boolean): Boolean;

    { Public declarations }
  end;

var
  frm_re_capa: Tfrm_re_capa;
  procedure FinalizaTransmissao(ok: integer);

implementation

uses ConsOnLineEx, dReCapa, uReclassificacaoAnexos, uReAnexoFabric, FuncoesExport, Funcoes, GSMLIB, PGGP017, PGGP001,
  PGSM990, PGGP019, PGGA004, uRE_NOVOEX, Math;

{$R *.DFM}

procedure Tfrm_re_capa.btn_sairClick(Sender: TObject);
begin
  Close;
end;

procedure Tfrm_re_capa.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  datm_re_capa.Free;

  crp_historico.Free;

  Action := caFree;
end;

procedure Tfrm_re_capa.btn_co_unidadeClick(Sender: TObject);
begin
  if Sender is TSpeedButton then
  begin
//    valor := edt_cd_unidade.Text;
    edt_cd_unidade.Text := ConsultaOnLineEx('TUNID_NEG','Unidades',['CD_UNID_NEG','NM_UNID_NEG','AP_UNID_NEG'],['Código','Nome','Apelido'],'CD_UNID_NEG');
//    if edt_cd_unidade.Text = '' then edt_cd_unidade.Text := valor;
    edt_cd_unidadeExit(edt_cd_unidade);
  end
  else
    edt_nm_unidade.Text := ConsultaLookUP('TUNID_NEG', 'CD_UNID_NEG', edt_cd_unidade.Text, 'AP_UNID_NEG');
end;

procedure Tfrm_re_capa.edt_cd_unidadeExit(Sender: TObject);
begin
  if vUnidade = edt_cd_unidade.Text then
    Exit;

  if Trim(edt_cd_unidade.Text) = '' then
  begin
    MessageDlg('Para começar, escolha uma unidade de negócio.' , mtInformation, [mbOk], 0);
    edt_cd_unidade.SetFocus;
    exit;
  end;
end;

procedure Tfrm_re_capa.DBEdit3Exit(Sender: TObject);
begin
  with datm_re_capa do
  begin
    if DBEdit3.Text <> '  /       -   ' then
      CamposAtivos(False)
    else
    begin
      if datm_re_capa.qry_re_capa.State in [dsEdit, dsInsert] then
      begin
        datm_re_capa.qry_re_capaDT_DATA.Clear;
        datm_re_capa.qry_re_capaNR_RE_SISCOMEX.Clear;
      end;
      CamposAtivos(True);
    end;
  end;
end;

procedure Tfrm_re_capa.SpeedButton4Click(Sender: TObject);
begin
  pgRe.ActivePage := tabLista;
  ntbHistorico.pageindex := 1;
end;

procedure Tfrm_re_capa.SpeedButton7Click(Sender: TObject);
begin
  ntbHistorico.ActivePage := 'ntbSituacao';
  pgRe.ActivePage := tabLista;
end;

procedure Tfrm_re_capa.SpeedButton5Click(Sender: TObject);
begin
  crp_historico.Connect        := 'DSN=BROKER; UID='+str_nm_admin+'; PWD='+str_nm_senha+'; DSQ=BROKER';
  crp_historico.ReportName     := cDir_Rpt + '\RelPrtScrRe.rpt';
  crp_historico.ParamFields[0] := datm_re_capa.qry_re_capaNR_PROCESSO.AsString;

//  crp_historico.Formulas[0] := 'fProcesso = "' + datm_re_capa.qry_re_capaNR_PROCESSO.AsString + '"';
//  crp_historico.Formulas[1] := 'fTipo = "'     + datm_re_capa.qry_re_capaNR_RE_SISCOMEX.AsString + '"';
  crp_historico.Execute;
end;

procedure Tfrm_re_capa.SpeedButton6Click(Sender: TObject);
begin
  datm_re_capa.qry_re_capa.Post;
end;

function Tfrm_re_capa.VerificaUltimoComplemento(pProcesso : string) : string;
begin
  with TQuery.Create(application) do
  begin
    Databasename := 'DBBROKER';
    SQL.Clear;
    SQL.Add('SELECT ISNULL(MAX(NR_PROCESSO_COMPLEMENTO),''0'') FROM TRE_CAPA (NOLOCK) WHERE NR_PROCESSO = ''' + pProcesso + '''');
    Open;
    VerificaUltimoComplemento := Copy('000',1,3-Length( IntToStr(Fields[0].AsInteger + 1) )) + IntToStr(Fields[0].AsInteger + 1);
    Close;
    Free;
  end;
end;

procedure Tfrm_re_capa.btn_incluirClick(Sender: TObject);
begin
  if (pgRe.ActivePage = tabLista) or (pgRe.ActivePage = tabReBasicas) or (pgRe.ActivePage = tabReCompl) then
  begin
    pgRe.ActivePage          := tabReBasicas;

    datm_re_capa.qry_re_capa.Insert;

    btn_co_processo.Enabled  := True;
    edt_nr_processo.ReadOnly := False;
    edt_nr_processo.SetFocus;

    datm_re_capa.qry_re_capa.FieldByName('DT_DATA_RE').AsDateTime := Now;
    datm_re_capa.qry_re_capaIN_NOVOEX.AsBoolean := MessageDlg('Deseja preparar este RE para o modelo NovoEx?', mtConfirmation, [mbYes, mbNo], 0) = mrYes;
    tabReBasicas.TabVisible := True;
  end
  else
  begin
    pgRe.ActivePage := tabAnexo;
    // Ativa Habilitação dos Campos
    CamposAtivos(True);
    datm_re_capa.qry_re_anexo.Insert;
    edt_cd_ncm.SetFocus;
    datm_re_capa.qry_re_anexo.FieldByName('CD_RE_ANEXO').AsInteger := UltimoReAnexo( datm_re_capa.qry_re_capa.FieldByName('NR_PROCESSO').AsString,
                                                                                     datm_re_capa.qry_re_capa.FieldByName('NR_PROCESSO_COMPLEMENTO').AsString ) + 1;
  end;
end;

procedure Tfrm_re_capa.btn_salvarClick(Sender: TObject);
begin
  PERFORM(WM_NEXTDLGCTL,0,0);
  if (pgRe.ActivePage = tabLista) or (pgRe.ActivePage = tabReBasicas) or (pgRe.ActivePage = tabReCompl) then
  begin
    CalculoEsqPgTotal;
    datm_re_capa.qry_re_capa.FieldByName('NR_PROCESSO').AsString             := edt_cd_unidade.Text + msk_cd_produto.Text + edt_nr_processo.Text;
    datm_re_capa.qry_re_capa.FieldByName('NR_PROCESSO_COMPLEMENTO').AsString := dbedt_nr_processo_complemento.Text;
    datm_re_capa.qry_re_capa.Post;

    if not AlimentaManutencao then
      MessageDlg('Erro ao repassar os dados para a manutenção.', mtInformation, [mbOK], 0);
  end
  else
  begin
    datm_re_capa.qry_re_anexo.FieldByName('NR_PROCESSO').AsString             := datm_re_capa.qry_re_capa.FieldByName('NR_PROCESSO').AsString;
    datm_re_capa.qry_re_anexo.FieldByName('NR_PROCESSO_COMPLEMENTO').AsString := datm_re_capa.qry_re_capa.FieldByName('NR_PROCESSO_COMPLEMENTO').AsString;
    datm_re_capa.qry_re_anexo.Post;
  end;

  CalculoIncoterm;
  pnlDiferenca.Visible    :=   (( MyRound(datm_re_capa.qry_re_capa.FieldByName('VL_VALOR_NBM_INCLUIDAS').AsFloat,2) <>
                                  MyRound(datm_re_capa.qry_re_capa.FieldByName('VL_ESQUE_PG_TOTAL').AsFloat,2) )) or
                               (( MyRound(datm_re_capa.qry_re_capa.FieldByName('VL_PESO_NBM_INCLUIDAS').AsFloat,5) <>
                                  MyRound(datm_re_capa.qry_re_capa.FieldByName('PESO_LIQUIDO_TOTAL').AsFloat,5) ));
  AlimentaManutencao;
  lblQtTotalAnexos.Caption := IntToStr(UltimoReAnexo(datm_re_capa.qry_re_capa.FieldByName('NR_PROCESSO').AsString,
                                                     datm_re_capa.qry_re_capa.FieldByName('NR_PROCESSO_COMPLEMENTO').AsString ));

  //verifica se habilita ou não o btnIntegraRE 
  datm_re_capa.qry_re_capa.AfterScroll(nil);

  if not( datm_re_capa.qry_re_capaNR_RE_SISCOMEX.IsNull ) then
     btnIntegraRE.Visible:=False;
end;

function TFrm_re_capa.ExecutarCalculoIncoterm : Boolean;
Begin
  with TQuery.Create(application) do
  begin
    DatabaseName := 'DBBROKER';
    SQL.Clear;
    SQL.Add('SELECT IN_EXP_CALCULOS_RE FROM TPARAMETROS (NOLOCK)');
    Open;
    Result := ( Fields[0].AsString = '1' );
    Close;
    Free;
  end;
end;

procedure Tfrm_re_capa.btn_cancelarClick(Sender: TObject);
begin
  if (pgRe.ActivePage = tabLista) or (pgRe.ActivePage = tabReBasicas) or (pgRe.ActivePage = tabReCompl) then
  begin
    datm_re_capa.qry_re_capa.Cancel;
  end
  else
  begin
    datm_re_capa.qry_re_anexo.Cancel;
    CamposAtivos(True);
  end;
end;

procedure Tfrm_re_capa.btn_excluirClick(Sender: TObject);
begin
  if (pgRe.ActivePage = tabLista) or (pgRe.ActivePage = tabReBasicas) or (pgRe.ActivePage = tabReCompl) then
  begin
    if MessageDlg('Deseja realmente excluir o RE selecionado ?', mtConfirmation, [mbYes, mbNo], 0) = mrYes then
    begin
      with TQuery.Create(Application) do
      begin
        DatabaseName := 'DBBROKER';
        SQL.Clear;
        SQL.text := ' DELETE TRE_ANEXO_PURO '+
                    '  WHERE NR_PROCESSO = ''' + datm_re_capa.qry_re_capa.FieldByName('NR_PROCESSO').AsString + '''  '+
                    '    AND NR_PROCESSO_COMPLEMENTO = ''' + datm_re_capa.qry_re_capa.FieldByName('NR_PROCESSO_COMPLEMENTO').AsString + '''';
        ExecSQL;

        //exclui dados diferente do fabricante
        SQL.Clear;
        SQL.text :=' DELETE TRE_ANEXO_FABRIC '+
                   '  WHERE NR_PROCESSO = ''' + datm_re_capa.qry_re_capa.FieldByName('NR_PROCESSO').AsString + ''' '+
                   '    AND NR_PROCESSO_COMPLEMENTO = ''' + datm_re_capa.qry_re_capa.FieldByName('NR_PROCESSO_COMPLEMENTO').AsString + '''';
        ExecSQL;

        SQL.Clear;
        SQL.text := 'DELETE TPROCESSO_EXP_RE '+
                    ' WHERE NR_PROCESSO = ''' + datm_re_capa.qry_re_capa.FieldByName('NR_PROCESSO').AsString + ''' '+
                    '   AND NR_RE = ''' + StringReplace(StringReplace(datm_re_capa.qry_re_capa.FieldByName('NR_RE_SISCOMEX').AsString,'/','',[rfReplaceAll]),'-','',[rfReplaceAll]) + '''';
        ExecSQL;

        SQL.Clear;
        SQL.text :=' UPDATE TPROCESSO_EXP '+
                   '    SET IN_MONTADO     = ''0'', '+
                   '        IN_SELECIONADO = ''0''  '+
                   '  WHERE NR_PROCESSO    = ''' + datm_re_capa.qry_re_capa.FieldByName('NR_PROCESSO').AsString + '''';
        ExecSQL;
        Free;
      end;

      datm_re_capa.qry_exclui_anexo_.Close;
      datm_re_capa.qry_exclui_anexo_.ParamByName('NR_PROCESSO').AsString := datm_re_capa.qry_re_capa.FieldByName('NR_PROCESSO').AsString;
      datm_re_capa.qry_exclui_anexo_.ParamByName('NR_PROCESSO_COMPLEMENTO').AsString := datm_re_capa.qry_re_capa.FieldByName('NR_PROCESSO_COMPLEMENTO').AsString;
      datm_re_capa.qry_exclui_anexo_.Prepare;
      datm_re_capa.qry_exclui_anexo_.ExecSql;

     // datm_re_capa.qry_re_capa.Delete;
      with TQuery.Create(Application) do
      begin
        DatabaseName := 'DBBROKER';
        SQL.Clear;
        SQL.text :=' DELETE TRE_CAPA      '+
                   '  WHERE NR_PROCESSO = '+ QuotedStr(datm_re_capa.qry_re_capa.FieldByName('NR_PROCESSO').AsString) +
                   '    and NR_PROCESSO_COMPLEMENTO = '+ QuotedStr( datm_re_capa.qry_re_capa.FieldByName('NR_PROCESSO_COMPLEMENTO').AsString);
        ExecSQL;
        Free;
      end;

      datm_re_capa.ds_re_capaStateChange(nil);
      btnPesquisar.click;
    end;
  end
  else
  begin
    if MessageDlg('Deseja realmente excluir o anexo selecionado ?', mtConfirmation, [mbYes, mbNo], 0) = mrYes then
    begin
      //exclui dados diferente do fabricante
      with TQuery.Create(Application) do
      begin
        DatabaseName := 'DBBROKER';
        SQL.Clear;
        SQL.text := ' DELETE TRE_ANEXO_FABRIC '+
                    '  WHERE NR_PROCESSO = ''' + datm_re_capa.qry_re_capa.FieldByName('NR_PROCESSO').AsString + ''' '+
                    '    AND NR_PROCESSO_COMPLEMENTO = ''' + datm_re_capa.qry_re_capa.FieldByName('NR_PROCESSO_COMPLEMENTO').AsString + ''' '+
                    '    AND CD_RE_ANEXO = ''' + datm_re_capa.qry_re_anexo.FieldByName('CD_RE_ANEXO').AsString + '''';
        ExecSQL;
        Free;
      end;
      
      datm_re_capa.qry_re_anexo.Delete;
      datm_re_capa.ds_re_anexoStateChange(nil);
    end;
  end;
end;

procedure Tfrm_re_capa.pgReChange(Sender: TObject);
var
  vReAux, vReAuxComplemento, vAnexoAux : String;
begin
  with datm_re_capa do
  begin
    PosicionaNotebook;
    //se for lista, não abre a qry_anexo
    if pgRE.ActivePage = tabLista then
    begin
      vReAux            := qry_re_capa.FieldByName('NR_PROCESSO').AsString;
      vReAuxComplemento := qry_re_capa.FieldByName('NR_PROCESSO_COMPLEMENTO').AsString;
      {
      datm_re_capa.qry_re_capa.DisableControls;
      if not ((vReAux = '') or (vReAuxComplemento = '')) then
      begin
        datm_re_capa.qry_re_capa.Close;
        datm_re_capa.qry_re_capa.SQL.Text := datm_re_capa.GetSelQueryRE(frm_re_capa.edrQtRegistros.text);

        datm_re_capa.qry_re_capa.SQL[14]  := ' AND RC.NR_PROCESSO = '+QuotedStr(vReAux)+
                                             ' AND RC.NR_PROCESSO_COMPLEMENTO ='+QuotedStr(vReAuxComplemento);

        datm_re_capa.qry_re_capa.ParamByName('CD_UNID_NEG').AsString := edt_cd_unidade.Text;
        datm_re_capa.qry_re_capa.ParamByName('CD_PRODUTO').AsString  := msk_cd_produto.Text;
        datm_re_capa.qry_re_capa.Open;
      end
      else    }
        btnPesquisar.click;

      { qry_re_capa.Close;
      datm_re_capa.qry_re_capa.SQL.Text := datm_re_capa.GetSelQueryRE(frm_re_capa.edrQtRegistros.text);
      qry_re_capa.ParamByName('CD_UNID_NEG').AsString := edt_cd_unidade.Text;
      qry_re_capa.ParamByName('CD_PRODUTO').AsString  := msk_cd_produto.Text;
      qry_re_capa.Prepare;
      qry_re_capa.Open;
      }
      if not ((vReAux = '') or (vReAuxComplemento = '')) then
        qry_re_capa.Locate('NR_PROCESSO;NR_PROCESSO_COMPLEMENTO', VarArrayOf([vReAux, vReAuxComplemento]), []);

     { datm_re_capa.qry_re_capa.EnableControls;}

      CamposAtivos(True);
    end
    else
    if ( pgRE.ActivePage = tabAnexo ) or ( pgRE.ActivePage = tabAnexoCompl ) then
    begin
      vAnexoAux := qry_re_anexo.FieldByName('CD_RE_ANEXO').AsString;

      qry_re_anexo.Close;
      qry_re_anexo.ParamByName('NR_PROCESSO').AsString             := qry_re_capa.FieldByName('NR_PROCESSO').AsString;
      qry_re_anexo.ParamByName('NR_PROCESSO_COMPLEMENTO').AsString := qry_re_capa.FieldByName('NR_PROCESSO_COMPLEMENTO').AsString;
      qry_re_anexo.Prepare;
      qry_re_anexo.Open;

      LeMercComQuebras;

      if edt_cd_ncm.CanFocus then
        edt_cd_ncm.SetFocus;

      if pgRE.ActivePage = tabAnexoCompl then
      begin
        btn_inc_anexo_fabric.Enabled   := NOT chk_export_fabric.Checked;
        btn_inc_obs_exportador.Enabled := chk_obs_exportador.Checked;
      end;

      if (vAnexoAux <> '') then
        qry_re_anexo.Locate('CD_RE_ANEXO', vAnexoAux, []);

      if (qry_re_anexo.IsEmpty) or (DBEdit3.Text <> '  /       -   ') then
        CamposAtivos(False)
      else
        CamposAtivos(True);
    end;
  end;
end;

procedure Tfrm_re_capa.PosicionaNotebook; // aproveita para verificar os botões no topo do form
begin
  if (pgRe.ActivePage = tabLista) then begin
    noteNavegacao.PageIndex := 2;
//    datm_re_capa.ds_re_capaStateChange(nil);
  end else if (pgRe.ActivePage = tabReBasicas) then begin
    noteNavegacao.PageIndex := 1;
//    datm_re_capa.ds_re_capaStateChange(nil);
  end else if (pgRe.ActivePage = tabReCompl) then begin
    noteNavegacao.PageIndex := 1;
//    datm_re_capa.ds_re_capaStateChange(nil);
  end else if (pgRe.ActivePage = tabAnexo) then begin
    noteNavegacao.PageIndex := 0;
//    datm_re_capa.ds_re_anexoStateChange(nil);
  end else if (pgRe.ActivePage = tabAnexoCompl) then begin
    noteNavegacao.PageIndex := 0;
//    datm_re_capa.ds_re_anexoStateChange(nil);
  end;
end;

procedure Tfrm_re_capa.btn_co_exportadorClick(Sender: TObject);
begin
  if Sender is TSpeedButton then
  begin
    if not PoeEmEdicao(datm_re_capa.qry_re_capa) then
      exit;

    edt_cd_exportador.Text := ConsultaOnLineEx('TEMPRESA_NAC','Exportador',['CD_EMPRESA','NM_EMPRESA'],['Código','Nome'],'CD_EMPRESA');
    datm_re_capa.qry_re_capa.FieldByname('CD_EXPORTADOR').AsString := edt_cd_exportador.Text;
  end
  else
  begin
    edt_nm_exportador.Text := ConsultaLookUP('TEMPRESA_NAC', 'CD_EMPRESA', edt_cd_exportador.Text, 'NM_EMPRESA');
    edt_nr_cnpj_exp.Text   := ConsultaLookUP('TEMPRESA_NAC', 'CD_EMPRESA', edt_cd_exportador.Text, 'CGC_EMPRESA');
  end;
end;

procedure Tfrm_re_capa.btn_co_enquad1Click(Sender: TObject);
begin
  if Sender is TSpeedButton then
  begin
    if not PoeEmEdicao(datm_re_capa.qry_re_capa) then
      exit;

    edt_cd_enquad1.Text := ConsultaOnLineEx('TENQUAD_OP','Enquadramento de Operação',['CD_ENQUAD_OP','NM_ENQUAD_OP'],['Código','Nome'],'CD_ENQUAD_OP');
    datm_re_capa.qry_re_capa.FieldByname('CD_ENQUAD1').AsString := edt_cd_enquad1.Text;
  end;
end;

procedure Tfrm_re_capa.btn_co_enquad2Click(Sender: TObject);
begin
  if Sender is TSpeedButton then
  begin
    if not PoeEmEdicao(datm_re_capa.qry_re_capa) then
      exit;

    edt_cd_enquad2.Text := ConsultaOnLineEx('TENQUAD_OP','Enquadramento de Operação',['CD_ENQUAD_OP','NM_ENQUAD_OP'],['Código','Nome'],'CD_ENQUAD_OP');
    datm_re_capa.qry_re_capa.FieldByname('CD_ENQUAD2').AsString := edt_cd_enquad2.Text;
  end;
end;

procedure Tfrm_re_capa.btn_co_enquad3Click(Sender: TObject);
begin
  if Sender is TSpeedButton then
  begin
    if not PoeEmEdicao(datm_re_capa.qry_re_capa) then
      exit;

    edt_cd_enquad3.Text := ConsultaOnLineEx('TENQUAD_OP','Enquadramento de Operação',['CD_ENQUAD_OP','NM_ENQUAD_OP'],['Código','Nome'],'CD_ENQUAD_OP');
    datm_re_capa.qry_re_capa.FieldByname('CD_ENQUAD3').AsString := edt_cd_enquad3.Text;
  end;
end;

procedure Tfrm_re_capa.btn_co_enquad4Click(Sender: TObject);
begin
  if Sender is TSpeedButton then
  begin
    if not PoeEmEdicao(datm_re_capa.qry_re_capa) then
      exit;

    edt_cd_enquad4.Text := ConsultaOnLineEx('TENQUAD_OP','Enquadramento de Operação',['CD_ENQUAD_OP','NM_ENQUAD_OP'],['Código','Nome'],'CD_ENQUAD_OP');
    datm_re_capa.qry_re_capa.FieldByname('CD_ENQUAD4').AsString := edt_cd_enquad4.Text;
  end;
end;

procedure Tfrm_re_capa.btn_co_enquad5Click(Sender: TObject);
begin
  if Sender is TSpeedButton then
  begin
    if not PoeEmEdicao(datm_re_capa.qry_re_capa) then
      exit;

    edt_cd_enquad5.Text := ConsultaOnLineEx('TENQUAD_OP','Enquadramento de Operação',['CD_ENQUAD_OP','NM_ENQUAD_OP'],['Código','Nome'],'CD_ENQUAD_OP');
    datm_re_capa.qry_re_capa.FieldByname('CD_ENQUAD5').AsString := edt_cd_enquad5.Text;
  end;
end;

procedure Tfrm_re_capa.btn_co_enquad6Click(Sender: TObject);
begin
  if Sender is TSpeedButton then
  begin
    if not PoeEmEdicao(datm_re_capa.qry_re_capa) then
      exit;

    edt_cd_enquad6.Text := ConsultaOnLineEx('TENQUAD_OP','Enquadramento de Operação',['CD_ENQUAD_OP','NM_ENQUAD_OP'],['Código','Nome'],'CD_ENQUAD_OP');
    datm_re_capa.qry_re_capa.FieldByname('CD_ENQUAD6').AsString := edt_cd_enquad6.Text;
  end;
end;

procedure Tfrm_re_capa.btn_cd_paisClick(Sender: TObject);
begin
  if Sender is TSpeedButton then
    edt_pais_importador.Text := ConsultaOnLineEx('TPAIS','País',['CODIGO','DESCRICAO'],['Código','Nome'],'CODIGO')
  else
    edt_nm_pais.Text := ConsultaLookUP('TPAIS', 'CODIGO', edt_pais_importador.Text, 'DESCRICAO');
end;

procedure Tfrm_re_capa.btn_co_importadorClick(Sender: TObject);
var
vGrupo:String[3];
begin
  if Sender is TSpeedButton then
  begin
    if not PoeEmEdicao(datm_re_capa.qry_re_capa) then
      exit;
{
    edt_cd_importador.Text := ConsultaOnLineExSQL('SELECT CD_EMPRESA, NM_EMPRESA, CD_PAIS, END_CIDADE, END_EMPRESA, END_NUMERO, END_COMPL FROM TEMPRESA_EST WHERE'+
                                                  ' IN_ATIVO = "1" AND IN_IMPORTADOR = "1"','Importador',['CD_EMPRESA','NM_EMPRESA','CD_PAIS','END_CIDADE','END_EMPRESA','END_NUMERO','END_COMPL'],['Código','Descrição','País','Cidade','Endereço','Número','Complemento'], 'CD_EMPRESA');
}



    vGrupo := ConsultaLookUp('TPROCESSO', 'NR_PROCESSO', datm_re_capa.qry_re_capa.FieldByName('NR_PROCESSO').AsString , 'CD_GRUPO');
    edt_cd_importador.Text := ConsultaOnLineExSQL(
      'SELECT CD_EMPRESA, NM_EMPRESA, END_CIDADE, END_EMPRESA, END_NUMERO FROM TEMPRESA_EST (NOLOCK) WHERE IN_IMPORTADOR = ''1'' ' +
      ' AND CD_EMPRESA IN (SELECT CD_EMPRESA FROM TEMPRESA_EST_GRUPO (NOLOCK) WHERE CD_GRUPO = "'+ vGrupo +'") ',
      'Cadastro de Importadores',['CD_EMPRESA', 'NM_EMPRESA', 'END_CIDADE','END_EMPRESA', 'END_NUMERO' ],['Código','Importador','Cidade','Endereço','Numero'],'CD_EMPRESA',nil,edt_cd_importador.Text);



//    datm_re_capa.qry_re_capa.FieldByname('CD_IMPORTADOR').AsString := edt_cd_importador.Text;

   //O código abaixo estava comentado - 08/10/2010
    mem_end_importador.Text    :=
                                  ConsultaLookUP('TEMPRESA_EST', 'CD_EMPRESA', edt_cd_importador.Text, 'END_EMPRESA') + ', ' +
                                  ConsultaLookUP('TEMPRESA_EST', 'CD_EMPRESA', edt_cd_importador.Text, 'END_NUMERO') + ', ' +
                                  ConsultaLookUP('TEMPRESA_EST', 'CD_EMPRESA', edt_cd_importador.Text, 'END_COMPL');
    edt_pais_importador.Text   := ConsultaLookUP('TEMPRESA_EST', 'CD_EMPRESA', edt_cd_importador.Text, 'CD_PAIS');
    datm_re_capa.qry_re_capa.FieldByname('TX_END_IMPORTADOR').AsString := mem_end_importador.Text;
    datm_re_capa.qry_re_capa.FieldByname('CD_PAIS_IMPORTADOR').AsString := edt_pais_importador.Text;
  end
  else
  begin
    edt_nm_importador.Text     := ConsultaLookUP('TEMPRESA_EST', 'CD_EMPRESA', edt_cd_importador.Text, 'NM_EMPRESA');
    edt_cidade_importador.Text := ConsultaLookUP('TEMPRESA_EST', 'CD_EMPRESA', edt_cd_importador.Text, 'END_CIDADE');
  end;
end;

procedure Tfrm_re_capa.btn_co_pais_destinoClick(Sender: TObject);
begin
  if Sender is TSpeedButton then
  begin
    if not PoeEmEdicao(datm_re_capa.qry_re_capa) then
      exit;

    edt_cd_pais_destino.Text := ConsultaOnLineEx('TPAIS','País',['CODIGO','DESCRICAO'],['Código','Nome'],'CODIGO');
    datm_re_capa.qry_re_capa.FieldByname('CD_PAIS_FINAL').AsString := edt_cd_pais_destino.Text;
  end
  else
    edt_nm_pais_destino.Text := ConsultaLookUP('TPAIS', 'CODIGO', edt_cd_pais_destino.Text, 'DESCRICAO');
end;

procedure Tfrm_re_capa.btn_co_moedaClick(Sender: TObject);
begin
  if Sender is TSpeedButton then
  begin
    if not PoeEmEdicao(datm_re_capa.qry_re_capa) then
      exit;

    edt_cd_moeda.Text := ConsultaOnLineEx('TMOEDA_BROKER','Moeda',['CD_MOEDA','NM_MOEDA'],['Código','Nome'],'CD_MOEDA')
//    datm_re_capa.qry_re_capa.FieldByname('CD_PAIS_DESTINO').AsString := edt_cd_moeda.Text;
  end
  else
    edt_nm_moeda.Text := ConsultaLookUP('TMOEDA_BROKER', 'CD_MOEDA', edt_cd_moeda.Text, 'NM_MOEDA');
end;

procedure Tfrm_re_capa.btn_co_ncmClick(Sender: TObject);
begin
  if Sender is TSpeedButton then
  begin
    if not PoeEmEdicao(datm_re_capa.qry_re_anexo) then
      exit;

    edt_cd_ncm.Text := ConsultaOnLineEx('TNCM','NCM',['CODIGO','DESCRICAO'],['Código','Nome'],'CODIGO');
    datm_re_capa.qry_re_anexo.FieldByname('CD_NCM').AsString := edt_cd_ncm.Text;
  end
  else
    edt_nm_ncm.Text := ConsultaLookUP('TNCM', 'CODIGO', edt_cd_ncm.Text, 'DESCRICAO');
end;

procedure Tfrm_re_capa.btn_co_naladiClick(Sender: TObject);
begin
  if Sender is TSpeedButton then
  begin
    if not PoeEmEdicao(datm_re_capa.qry_re_anexo) then
      exit;

    edt_cd_naladi.Text := ConsultaOnLineEx('TNALADISH','NALADI',['CODIGO','DESCRICAO'],['Código','Nome'],'CODIGO');
    datm_re_capa.qry_re_anexo.FieldByname('CD_NALADI').AsString := edt_cd_naladi.Text;
  end
  else
    edt_nm_naladi.Text := ConsultaLookUP('TNALADISH', 'CODIGO', edt_cd_naladi.Text, 'DESCRICAO');
end;

procedure Tfrm_re_capa.btn_co_unid_medidaClick(Sender: TObject);
begin
  if Sender is TSpeedButton then
  begin
    if not PoeEmEdicao(datm_re_capa.qry_re_anexo) then
      exit;

    edt_cd_unid_medida.Text := ConsultaOnLineEx('TUNID_MEDIDA_BROKER','Unidade de Medida',['CD_UNID_MEDIDA','NM_UNID_MEDIDA'],['Código','Descrição'],'CD_UNID_MEDIDA');
    datm_re_capa.qry_re_anexo.FieldByname('CD_UNID_MEDIDA').AsString := edt_cd_unid_medida.Text;
  end
  else
    edt_nm_unid_medida.Text := ConsultaLookUP('TUNID_MEDIDA_BROKER', 'CD_UNID_MEDIDA', edt_cd_unid_medida.Text, 'NM_UNID_MEDIDA');
end;

procedure Tfrm_re_capa.btn_co_finalidadeClick(Sender: TObject);
begin
  if Sender is TSpeedButton then
  begin
    if not PoeEmEdicao(datm_re_capa.qry_re_anexo) then
      exit;

    edt_cd_finalidade.Text := ConsultaOnLineEx('TFINALIDADE_MERC','Finalidade',['CD_FINALIDADE_MERC','NM_FINALIDADE_MERC'],['Código','Descrição'],'CD_FINALIDADE_MERC');
    datm_re_capa.qry_re_anexo.FieldByname('CD_FINALIDADE').AsString := edt_cd_finalidade.Text;
  end
  else
    edt_nm_finalidade.Text := ConsultaLookUP('TFINALIDADE_MERC', 'CD_FINALIDADE_MERC', edt_cd_finalidade.Text, 'NM_FINALIDADE_MERC');
end;

procedure Tfrm_re_capa.btn_co_inst_negClick(Sender: TObject);
begin
  if Sender is TSpeedButton then
  begin
    if not PoeEmEdicao(datm_re_capa.qry_re_capa) then
    exit;

    edt_cd_inst_neg.Text := ConsultaOnLineEx('TINST_NEGOC','Instrumento de Negociação',['CD_INST_NEGOC','NM_INST_NEGOC'],['Código','Descrição'],'CD_INST_NEGOC');
    datm_re_capa.qry_re_capa.FieldByname('CD_INST_NEGO').AsString := edt_cd_inst_neg.Text;
  end
  else
    edt_nm_inst_neg.Text := ConsultaLookUP('TINST_NEGOC', 'CD_INST_NEGOC', edt_cd_inst_neg.Text, 'NM_INST_NEGOC');
end;

procedure Tfrm_re_capa.edt_chaveChange(Sender: TObject);
begin
//  Localiza(datm_re_capa.qry_re_capa, edt_chave.Text, copy(a_str_indices[cb_ordem.ItemIndex],0,length(a_str_indices[cb_ordem.ItemIndex])-4) );

end;

procedure Tfrm_re_capa.FormCreate(Sender: TObject);
begin
  pgRe.ActivePage := tabLista;  
  // necessita ter os 4 espaços/"asc" ou o "desc" no fim de cada string, para que o ordenador faça-o corretamente.
  a_str_indices[0] := 'PROCESSO_REDUZIDO ASC';//'NR_PROCESSO ASC';
  a_str_indices[1] := 'NR_RE_SISCOMEX DESC';
  a_str_indices[2] := 'DT_DATA DESC';
  a_str_indices[3] := 'EXPORTADOR ASC';
  a_str_indices[4] := 'DT_DATA_RE DESC';
  a_str_indices[5] := 'IMPORTADOR ASC';

  with cb_ordem do
  begin
    Clear;
    Items.Add( 'Nr. Processo' );
    Items.Add( 'Número do Registro' );
    Items.Add( 'Data do Registro' );
    Items.Add( 'Exportador' );
    Items.Add( 'Data de Abertura' );
    Items.Add( 'Importador' );
    ItemIndex := 0;
  end;

end;

procedure Tfrm_re_capa.chk_obs_exportadorClick(Sender: TObject);
begin
  btn_inc_obs_exportador.Enabled := chk_obs_exportador.Checked;
end;

procedure Tfrm_re_capa.btn_classificaClick(Sender: TObject);
begin
  if StrToIntDef(ConsultaLookupSQL('SELECT COUNT(*) BLABLA FROM TRE_ANEXO_PURO (NOLOCK) '+
                                   ' WHERE NR_PROCESSO = '''+datm_re_capa.qry_re_capa.FieldByName('NR_PROCESSO').AsString+''''+
                                   '   AND NR_PROCESSO_COMPLEMENTO='''+datm_re_capa.qry_re_capa.FieldByName('NR_PROCESSO_COMPLEMENTO').AsString+'''','BLABLA'),0) = 0 then
  begin
    BoxMensagem('Não existem registros de items sem classificação nesse processo.'+#10#13+
                'Provavelmente este processo não veio de uma integração com o Processo de Exportação.',2);
    Exit;
  end;
  with datm_re_capa do
  begin
    datm_re_capa.qry_re_anexo.Close;
    Application.CreateForm(Tfrm_reclassificacao_anexos, frm_reclassificacao_anexos);
    frm_reclassificacao_anexos.ShowModal;

    qry_re_anexo.ParamByName('NR_PROCESSO').AsString := qry_re_capa.FieldByName('NR_PROCESSO').AsString;
    qry_re_anexo.ParamByName('NR_PROCESSO_COMPLEMENTO').AsString := qry_re_capa.FieldByName('NR_PROCESSO_COMPLEMENTO').AsString;
    qry_re_anexo.Prepare;
    qry_re_anexo.Open;

    LeMercComQuebras;

    qry_re_capa.Edit;
    qry_re_anexo.Edit;
    CalculoEsqPgTotal;

    if qry_re_capa.State in [dsEdit, dsInsert] then
      qry_re_capa.Post;

    if not AlimentaManutencao then
      MessageDlg('Erro ao repassar os dados para a manutenção.', mtInformation, [mbOK], 0);

    if qry_re_anexo.State in [dsEdit, dsInsert] then
      qry_re_anexo.Post;

    CalculoIncoterm;

    pnlDiferenca.Visible    :=   (( MyRound(datm_re_capa.qry_re_capa.FieldByName('VL_VALOR_NBM_INCLUIDAS').AsFloat,2) <>
                                    MyRound(datm_re_capa.qry_re_capa.FieldByName('VL_ESQUE_PG_TOTAL').AsFloat,2) )) or
                                 (( MyRound(datm_re_capa.qry_re_capa.FieldByName('VL_PESO_NBM_INCLUIDAS').AsFloat,5) <>
                                    MyRound(datm_re_capa.qry_re_capa.FieldByName('PESO_LIQUIDO_TOTAL').AsFloat,5) ));

    AlimentaManutencao;
    lblQtTotalAnexos.Caption := IntToStr(UltimoReAnexo( qry_re_capa.FieldByName('NR_PROCESSO').AsString,
                                                        qry_re_capa.FieldByName('NR_PROCESSO_COMPLEMENTO').AsString ));
  end;
end;

procedure Tfrm_re_capa.btn_co_processoClick(Sender: TObject);
var
  vListAux : TStringList;
begin
  vListAux := TStringList.Create;
  vListAux.Add('SELECT SUBSTRING(PR.NR_PROCESSO, 5, 14) AS NR_PROCESSO, PR.CD_CLIENTE,');
  vListAux.Add('(SELECT AP_EMPRESA FROM TEMPRESA_NAC CL (NOLOCK) WHERE CL.CD_EMPRESA = PR.CD_CLIENTE) AS NM_CLIENTE,');
  vListAux.Add('PR.CD_SERVICO, (SELECT NM_SERVICO FROM TSERVICO SV (NOLOCK) WHERE SV.CD_SERVICO = PR.CD_SERVICO) AS NM_SERVICO,');
  vListAux.Add('PR.DT_ABERTURA, PR.CD_EMBARCACAO, (SELECT NM_EMBARCACAO FROM TEMBARCACAO EB (NOLOCK) WHERE EB.CD_EMBARCACAO = PR.CD_EMBARCACAO) AS NM_EMBARCACAO,');
  vListAux.Add('PR.NR_CONHECIMENTO, PR.NR_CONHECIMENTO_MASTER, PR.NR_DI, PR.NR_MANIFESTO, PR.NR_PROC_REF, SUBSTRING(PR.NR_PROCESSO, 5, 14) AS PROCESSO_REDUZIDO FROM TPROCESSO PR (NOLOCK) ');
  vListAux.Add('LEFT OUTER JOIN TRE_CAPA PC (NOLOCK) ON (PR.NR_PROCESSO = PC.NR_PROCESSO )');
  vListAux.Add('WHERE PR.CD_UNID_NEG = ' + QuotedStr(edt_cd_unidade.Text));
  vListAux.Add('  AND PR.CD_PRODUTO = ' + QuotedStr(msk_cd_produto.Text) + ' AND PR.IN_CANCELADO = ''0'' AND PC.NR_PROCESSO IS NULL ');
  if chkProcessos.Checked then
    vListAux.Add('  AND PR.DT_ABERTURA > GETDATE() - ' + IntToStr(vQtdeDiasConsProc));
  vListAux.Add('ORDER BY SUBSTRING(PR.NR_PROCESSO, 5, 14) DESC');
//  vListAux.Add('  AND SUBSTRING(PR.NR_PROCESSO,13,2) = ''' + edtFiltroAno.Text + '''');
  edt_nr_processo.Text := Copy(ConsultaOnLineExSQLList(vListAux,'Processos',['NR_PROCESSO', 'NM_SERVICO', 'NM_CLIENTE', 'DT_ABERTURA'],['Processo', 'Serviço', 'Cliente', 'Data de Abertura'],'NR_PROCESSO',nil),5,10);
  vListAux.Free;

  datm_re_capa.qry_re_capa.FieldByName('NR_PROCESSO').AsString := edt_cd_unidade.Text + msk_cd_produto.Text + edt_nr_processo.Text;
  datm_re_capa.qry_re_capa.FieldByName('PROCESSO_REDUZIDO').AsString := edt_nr_processo.Text;
  edt_nr_processoExit(nil);
end;

procedure Tfrm_re_capa.FormShow(Sender: TObject);
begin
//  EsconderAplicacao;
  edt_cd_unidade.Text := str_cd_unid_neg;
  edt_cd_unidadeExit(nil);
//  msk_cd_produto.Text := str_cd_produto;
  msk_cd_produto.Text := '02'; 
//  msk_cd_produtoExit(nil);

  btnPesquisar.click;

  pgRe.ActivePage := tabLista;
  datm_re_capa.qry_re_capa.Locate('NR_PROCESSO', str_nr_processo, [loCaseInsensitive, loPartialKey]);
  edt_cd_unidade.SetFocus;
end;

procedure Tfrm_re_capa.edt_nr_processoExit(Sender: TObject);
begin
//  if (datm_re_capa.qry_re_capa.state in [dsEdit, dsInsert]) then
  if Trim(ConsultaLookUP('TPROCESSO_EXP','NR_PROCESSO',edt_cd_unidade.Text + msk_cd_produto.Text + edt_nr_processo.Text,'NR_PROCESSO')) = '' then
  begin
    if MessageDlg('O processo digitado não foi encontrado. Deseja criá-lo agora?', mtConfirmation, [mbYes,mbNo], 0) = mrYes then
    begin
      with TQuery.Create(application) do
      begin
        Databasename := 'DBBROKER';
        SQL.Clear;
        SQL.Add('INSERT INTO TPROCESSO_EXP ( NR_PROCESSO, DT_REGISTRO_PEDIDO, CD_PAIS_ORIG, CD_LOCAL_ORIGEM, CD_LOCAL_DESTINO, CD_PAIS_DESTINO, CD_TIPO_FRETE,');
        SQL.Add('                            CD_REPRESENTANTE, CD_MOEDA, NR_DDE, NR_FATURA, CD_DESPACHANTE, CD_AGENTE, VL_TOT_FOB, VL_PESO_BRUTO, VL_PESO_LIQUIDO,');
        SQL.Add('                            VL_SEGURO, DT_REG_DDE, IN_ETIQUETA, CD_IMPORTADOR, CD_EXPORTADOR, CD_LINGUA_PEDIDO )');
        SQL.Add('                     SELECT '''+edt_cd_unidade.Text + msk_cd_produto.Text + edt_nr_processo.Text+''', GETDATE(), CD_PAIS_ORIGEM, CD_LOCAL_EMBARQUE, CD_LOCAL_DESEMBARQUE, CD_PAIS_DESTINO, TP_FRETE,');
        SQL.Add('                            CD_REPRESENTANTE, CD_MOEDA_MLE, NR_DDE, NR_FATURA, CD_DESPACHANTE, CD_AGENTE, VL_MLE_MNEG, VL_PESO_BRUTO, VL_PESO_LIQUIDO,');
        SQL.Add('                            VL_SEGURO_MNEG, DT_REG_DDE, IN_ETIQUETA, CD_IMPORTADOR, CD_EXPORTADOR, CD_LINGUA_PEDIDO');
        SQL.Add('                       FROM TPROCESSO (NOLOCK)');
        SQL.Add('                      WHERE NR_PROCESSO = ''' + edt_cd_unidade.Text + msk_cd_produto.Text + edt_nr_processo.Text + '''');
        ExecSQL;
        Free;
      end;
    end else begin
      edt_nr_processo.SetFocus;
      Exit;
    end;
  end;
  if datm_re_capa.qry_re_capa.State in [dsEdit,dsInsert] then
   begin
    Manutencao2RE( datm_re_capa.qry_re_capa );
    datm_re_capa.qry_re_capa.FieldByName('NR_PROCESSO_COMPLEMENTO').AsString := VerificaUltimoComplemento(edt_cd_unidade.Text + msk_cd_produto.Text + edt_nr_processo.Text);
  end;
  btn_co_processo.Enabled  := False;
  edt_nr_processo.ReadOnly := True;
end;

procedure Tfrm_re_capa.btn_co_urf_embarqueClick(Sender: TObject);
begin
  if Sender is TSpeedButton then
  begin
    if not PoeEmEdicao(datm_re_capa.qry_re_capa) then
      exit;

    edt_cd_urf_embarque.Text := ConsultaOnLineEx('TURF','URF',['CODIGO','DESCRICAO'],['Código','Descrição'],'CODIGO');
    datm_re_capa.qry_re_capa.FieldByname('CD_URF_EMBARQUE').AsString := edt_cd_urf_embarque.Text;
  end
  else
    edt_nm_urf_embarque.Text := ConsultaLookUP('TURF', 'CODIGO', edt_cd_urf_embarque.Text, 'DESCRICAO');
end;

procedure Tfrm_re_capa.btn_co_urf_despachoClick(Sender: TObject);
begin
  if Sender is TSpeedButton then
  begin
    if not PoeEmEdicao(datm_re_capa.qry_re_capa) then
      exit;

    edt_cd_urf_despacho.Text := ConsultaOnLineEx('TURF','URF',['CODIGO','DESCRICAO'],['Código','Descrição'],'CODIGO');
    datm_re_capa.qry_re_capa.FieldByname('CD_URF_DESPACHO').AsString := edt_cd_urf_despacho.Text;
  end
  else
    edt_nm_urf_despacho.Text := ConsultaLookUP('TURF', 'CODIGO', edt_cd_urf_despacho.Text, 'DESCRICAO');
end;

procedure Tfrm_re_capa.edt_pais_importadorChange(Sender: TObject);
begin
  edt_nm_pais.Text   := ConsultaLookUP('TPAIS', 'CODIGO', edt_pais_importador.Text, 'DESCRICAO');
end;

procedure Tfrm_re_capa.edt_cd_exportadorExit(Sender: TObject);
begin
  CompletaZerosEsq(TDBEdit(Sender));
end;

procedure Tfrm_re_capa.edt_cd_importadorExit(Sender: TObject);
begin
  CompletaZerosEsq(TDBEdit(Sender));
  mem_end_importador.Text    :=
                                ConsultaLookUP('TEMPRESA_EST', 'CD_EMPRESA', edt_cd_importador.Text, 'END_EMPRESA') + ', ' +
                                ConsultaLookUP('TEMPRESA_EST', 'CD_EMPRESA', edt_cd_importador.Text, 'END_NUMERO') + ', ' +
                                ConsultaLookUP('TEMPRESA_EST', 'CD_EMPRESA', edt_cd_importador.Text, 'END_COMPL');
  edt_pais_importador.Text   := ConsultaLookUP('TEMPRESA_EST', 'CD_EMPRESA', edt_cd_importador.Text, 'CD_PAIS');
  datm_re_capa.qry_re_capa.FieldByname('TX_END_IMPORTADOR').AsString := mem_end_importador.Text;
  datm_re_capa.qry_re_capa.FieldByname('CD_PAIS_IMPORTADOR').AsString := edt_pais_importador.Text;
end;

procedure Tfrm_re_capa.edt_cd_unid_medidaExit(Sender: TObject);
begin
  if TDBEdit(Sender).Text <> '' then
    CompletaZerosEsq(TDBEdit(Sender));
end;

procedure Tfrm_re_capa.LeMercComQuebras;
var
  i : Integer;
begin
{ Siscomex só permite 9 itens por anexo - by carlos 07/07/2011
  for i := 0 to 9 do
    case i of
      0: edt_merc1.Text  := Funcoes.ExtractWord(i+1,datm_re_capa.qry_re_anexo.FieldByName('TX_DESC_MERCADORIA').AsString,'|');
      1: edt_merc2.Text  := Funcoes.ExtractWord(i+1,datm_re_capa.qry_re_anexo.FieldByName('TX_DESC_MERCADORIA').AsString,'|');
      2: edt_merc3.Text  := Funcoes.ExtractWord(i+1,datm_re_capa.qry_re_anexo.FieldByName('TX_DESC_MERCADORIA').AsString,'|');
      3: edt_merc4.Text  := Funcoes.ExtractWord(i+1,datm_re_capa.qry_re_anexo.FieldByName('TX_DESC_MERCADORIA').AsString,'|');
      4: edt_merc5.Text  := Funcoes.ExtractWord(i+1,datm_re_capa.qry_re_anexo.FieldByName('TX_DESC_MERCADORIA').AsString,'|');
      5: edt_merc6.Text  := Funcoes.ExtractWord(i+1,datm_re_capa.qry_re_anexo.FieldByName('TX_DESC_MERCADORIA').AsString,'|');
      6: edt_merc7.Text  := Funcoes.ExtractWord(i+1,datm_re_capa.qry_re_anexo.FieldByName('TX_DESC_MERCADORIA').AsString,'|');
      7: edt_merc8.Text  := Funcoes.ExtractWord(i+1,datm_re_capa.qry_re_anexo.FieldByName('TX_DESC_MERCADORIA').AsString,'|');
      8: edt_merc9.Text  := Funcoes.ExtractWord(i+1,datm_re_capa.qry_re_anexo.FieldByName('TX_DESC_MERCADORIA').AsString,'|');
      9: edt_merc10.Text := Funcoes.ExtractWord(i+1,datm_re_capa.qry_re_anexo.FieldByName('TX_DESC_MERCADORIA').AsString,'|');
    end;
}

  for i := 0 to 8 do
    case i of
      0: edt_merc1.Text  := Funcoes.ExtractWord(i+1,datm_re_capa.qry_re_anexo.FieldByName('TX_DESC_MERCADORIA').AsString,'|');
      1: edt_merc2.Text  := Funcoes.ExtractWord(i+1,datm_re_capa.qry_re_anexo.FieldByName('TX_DESC_MERCADORIA').AsString,'|');
      2: edt_merc3.Text  := Funcoes.ExtractWord(i+1,datm_re_capa.qry_re_anexo.FieldByName('TX_DESC_MERCADORIA').AsString,'|');
      3: edt_merc4.Text  := Funcoes.ExtractWord(i+1,datm_re_capa.qry_re_anexo.FieldByName('TX_DESC_MERCADORIA').AsString,'|');
      4: edt_merc5.Text  := Funcoes.ExtractWord(i+1,datm_re_capa.qry_re_anexo.FieldByName('TX_DESC_MERCADORIA').AsString,'|');
      5: edt_merc6.Text  := Funcoes.ExtractWord(i+1,datm_re_capa.qry_re_anexo.FieldByName('TX_DESC_MERCADORIA').AsString,'|');
      6: edt_merc7.Text  := Funcoes.ExtractWord(i+1,datm_re_capa.qry_re_anexo.FieldByName('TX_DESC_MERCADORIA').AsString,'|');
      7: edt_merc8.Text  := Funcoes.ExtractWord(i+1,datm_re_capa.qry_re_anexo.FieldByName('TX_DESC_MERCADORIA').AsString,'|');
      8: edt_merc9.Text  := Funcoes.ExtractWord(i+1,datm_re_capa.qry_re_anexo.FieldByName('TX_DESC_MERCADORIA').AsString,'|');
    end;
end;

procedure Tfrm_re_capa.LeObsExportComQuebras;
var
  i : Integer;
begin
  for i := 0 to 9 do
    case i of
      0: edt_obsexport1.Text  := Funcoes.ExtractWord(i+1,datm_re_capa.qry_re_anexo.FieldByName('TX_OBSERVACAO_EXPORTADOR').AsString,'|');
      1: edt_obsexport2.Text  := Funcoes.ExtractWord(i+1,datm_re_capa.qry_re_anexo.FieldByName('TX_OBSERVACAO_EXPORTADOR').AsString,'|');
      2: edt_obsexport3.Text  := Funcoes.ExtractWord(i+1,datm_re_capa.qry_re_anexo.FieldByName('TX_OBSERVACAO_EXPORTADOR').AsString,'|');
      3: edt_obsexport4.Text  := Funcoes.ExtractWord(i+1,datm_re_capa.qry_re_anexo.FieldByName('TX_OBSERVACAO_EXPORTADOR').AsString,'|');
      4: edt_obsexport5.Text  := Funcoes.ExtractWord(i+1,datm_re_capa.qry_re_anexo.FieldByName('TX_OBSERVACAO_EXPORTADOR').AsString,'|');
      5: edt_obsexport6.Text  := Funcoes.ExtractWord(i+1,datm_re_capa.qry_re_anexo.FieldByName('TX_OBSERVACAO_EXPORTADOR').AsString,'|');
      6: edt_obsexport7.Text  := Funcoes.ExtractWord(i+1,datm_re_capa.qry_re_anexo.FieldByName('TX_OBSERVACAO_EXPORTADOR').AsString,'|');
      7: edt_obsexport8.Text  := Funcoes.ExtractWord(i+1,datm_re_capa.qry_re_anexo.FieldByName('TX_OBSERVACAO_EXPORTADOR').AsString,'|');
      8: edt_obsexport9.Text  := Funcoes.ExtractWord(i+1,datm_re_capa.qry_re_anexo.FieldByName('TX_OBSERVACAO_EXPORTADOR').AsString,'|');
      9: edt_obsexport10.Text := Funcoes.ExtractWord(i+1,datm_re_capa.qry_re_anexo.FieldByName('TX_OBSERVACAO_EXPORTADOR').AsString,'|');
    end;
end;

procedure Tfrm_re_capa.pgReChanging(Sender: TObject; var AllowChange: Boolean);
begin
  if ( pgRE.ActivePage = tabReBasicas ) or ( pgRE.ActivePage = tabReCompl ) or ( pgRE.ActivePage = tabLista ) then
    AllowChange := not (datm_re_capa.qry_re_capa.state in [dsEdit, dsInsert])
  else
  if ( pgRE.ActivePage = tabAnexo ) or ( pgRE.ActivePage = tabAnexoCompl ) then
    AllowChange := not (datm_re_capa.qry_re_anexo.state in [dsEdit, dsInsert]);

  if not AllowChange then
  begin
    MessageDlg('Você está em modo de edição. Favor gravar antes de mudar de guia.', mtInformation, [mbOk], 0);
  end;

  DBEdit3Exit(nil);
end;

procedure Tfrm_re_capa.edt_merc1KeyPress(Sender: TObject; var Key: Char);
begin
  PoeEmEdicao( datm_re_capa.qry_re_anexo );
  if Key = #13 then
    PERFORM(WM_NEXTDLGCTL,0,0);
end;

procedure Tfrm_re_capa.edt_cd_unidadeKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if Key = Vk_F5 then
  begin
    if Sender = edt_cd_unidade            then btn_co_unidadeClick(TSpeedButton.NewInstance) ;
    if Sender = edt_nr_processo           then btn_co_processoClick(TSpeedButton.NewInstance) ;
    if Sender = edt_cd_exportador         then btn_co_exportadorClick(TSpeedButton.NewInstance) ;
    if Sender = edt_cd_enquad1            then btn_co_enquad1Click(TSpeedButton.NewInstance) ;
    if Sender = edt_cd_enquad2            then btn_co_enquad2Click(TSpeedButton.NewInstance) ;
    if Sender = edt_cd_enquad3            then btn_co_enquad3Click(TSpeedButton.NewInstance) ;
    if Sender = edt_cd_enquad4            then btn_co_enquad4Click(TSpeedButton.NewInstance) ;
    if Sender = edt_cd_enquad5            then btn_co_enquad5Click(TSpeedButton.NewInstance) ;
    if Sender = edt_cd_enquad6            then btn_co_enquad6Click(TSpeedButton.NewInstance) ;
    if Sender = edt_cd_inst_neg           then btn_co_inst_negClick(TSpeedButton.NewInstance) ;
    if Sender = dbedt_cd_incoterm         then SpeedButton14Click(TSpeedButton.NewInstance) ;
    if Sender = dbedt_cd_modalidade_trans then SpeedButton15Click(TSpeedButton.NewInstance) ;
    if Sender = edt_cd_ufprodutor         then btn_co_ufprodutorClick(TSpeedButton.NewInstance) ;
    if Sender = edt_cd_urf_despacho       then btn_co_urf_despachoClick(TSpeedButton.NewInstance) ;
    if Sender = edt_cd_urf_embarque       then btn_co_urf_embarqueClick(TSpeedButton.NewInstance) ;
    if Sender = edt_cd_importador         then btn_co_importadorClick(TSpeedButton.NewInstance) ;
    if Sender = edt_cd_pais_destino       then btn_co_pais_destinoClick(TSpeedButton.NewInstance) ;
    if Sender = edt_cd_moeda              then btn_co_moedaClick(TSpeedButton.NewInstance) ;
    if Sender = edt_cd_ncm                then btn_co_ncmClick(TSpeedButton.NewInstance) ;
    if Sender = edt_cd_naladi             then btn_co_naladiClick(TSpeedButton.NewInstance) ;
    if Sender = edt_cd_unid_medida        then btn_co_unid_medidaClick(TSpeedButton.NewInstance) ;
    if Sender = edt_cd_finalidade         then btn_co_finalidadeClick(TSpeedButton.NewInstance);
    if Sender = edt_pais_importador       then btn_co_destinoClick(TSpeedButton.NewInstance);
  end;
end;

procedure Tfrm_re_capa.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if key = #27 then
    btn_sairClick(nil);
end;

procedure Tfrm_re_capa.btn_inc_anexo_fabricClick(Sender: TObject);
begin
  Application.CreateForm(Tfrm_re_anexo_fabric, frm_re_anexo_fabric);
  if datm_re_capa.qry_re_anexoQT_MEDIA_NBM.AsFloat=0 then
     frm_re_anexo_fabric.dbQTD.DataField:='PESO_LIQUIDO'
  else
     frm_re_anexo_fabric.dbQTD.DataField:='QT_MEDIA_NBM';

  datm_re_capa.qry_re_anexo_fabric.Close;
  datm_re_capa.qry_re_anexo_fabric.ParamByname('NR_PROCESSO').AsString             := datm_re_capa.qry_re_capa.FieldByname('NR_PROCESSO').AsString;
  datm_re_capa.qry_re_anexo_fabric.ParamByname('NR_PROCESSO_COMPLEMENTO').AsString := datm_re_capa.qry_re_capa.FieldByname('NR_PROCESSO_COMPLEMENTO').AsString;
  datm_re_capa.qry_re_anexo_fabric.ParamByname('CD_RE_ANEXO').AsInteger            := datm_re_capa.qry_re_anexo.FieldByname('CD_RE_ANEXO').AsInteger;
  datm_re_capa.qry_re_anexo_fabric.Open;
  frm_re_anexo_fabric.ShowModal;

  FreeAndNil(frm_re_anexo_fabric);
end;

procedure Tfrm_re_capa.chk_export_fabricClick(Sender: TObject);
begin
  btn_inc_anexo_fabric.Enabled := not chk_export_fabric.Checked;
end;

procedure Tfrm_re_capa.SpeedButton1Click(Sender: TObject);
var
  vFileName, vAux, vSituacao, sQtd, vMensagemAux, vNR_ANEXO_FIM, vNR_NBM, vCD_UNID_MEDIDA, ProcVetado: String;
  F : TextFile;
  vList : TStringList;
  vPresenca, ClickedOK, vVariosNCMs : Boolean;

begin
  //consistencias Carlos 26/07/2010
  if edt_cd_ufprodutor.Text='' then
  begin
    ShowMessage('Estado do Produtor Não Informado.   **  transmissão não efetuada  **');
    exit;
  end;

  if edt_cd_finalidade.Text='' then
  begin
    ShowMessage('Finalidade Não Informada.  **  transmissão não efetuada  **');
    exit;
  end;

  // abre query com o processo selecionado
  datm_re_capa.qry_re_capa.Close;
  datm_re_capa.qry_re_capa.SQL.Text := datm_re_capa.GetSelQueryRE(frm_re_capa.edrQtRegistros.text);
  datm_re_capa.qry_re_capa.SQL.Strings[14] := '   AND RC.NR_PROCESSO = "' + datm_re_capa.qry_re_capaNR_PROCESSO.AsString + '" '+
                                              '   AND RC.NR_PROCESSO_COMPLEMENTO = "' + datm_re_capa.qry_re_capa.FieldByname('NR_PROCESSO_COMPLEMENTO').AsString + '" ';
  datm_re_capa.qry_re_capa.ParamByName('CD_UNID_NEG').AsString := edt_cd_unidade.Text;
  datm_re_capa.qry_re_capa.ParamByName('CD_PRODUTO').AsString  := msk_cd_produto.Text;
  datm_re_capa.qry_re_capa.Prepare;
  datm_re_capa.qry_re_capa.Open;

  vMensagemAux := '';

  if datm_re_capa.qry_re_capaCD_MODALIDADE_TRANS.AsString <> '006' then //SEM COBERTURA CAMBIAL
  begin
    // analisa problemas de campos em branco
    with TQuery.Create(application) do
    begin
      Databasename := 'DBBROKER';
      SQL.Clear;

      SQL.Add('SELECT LTRIM(RTRIM(SUBSTRING(RC.NR_PROCESSO,5,12))) + '' / '' + RC.NR_PROCESSO_COMPLEMENTO,');
      SQL.Add('       ISNULL(RC.CD_MODALIDADE_TRANS,''''), ISNULL(RC.NR_PERIODICIDADE,''''),');
      SQL.Add('       ISNULL(RC.NR_PARCELAS,''''), ISNULL(RC.TP_INDICADOR,''''), ISNULL(RA.CD_FINALIDADE,''''),');
      SQL.Add('       ISNULL(VL_PAGT_VISTA,0), ISNULL(VL_PAGTO_ANTEC,0) ');
      SQL.Add('  FROM TRE_CAPA RC (NOLOCK), TRE_ANEXO RA (NOLOCK)');
      SQL.Add(' WHERE RA.NR_PROCESSO = RC.NR_PROCESSO');
      SQL.Add('   AND RA.NR_PROCESSO_COMPLEMENTO = RC.NR_PROCESSO_COMPLEMENTO');
      SQL.Add('   AND RTRIM(RC.NR_PROCESSO) + ''/'' + RTRIM(RC.NR_PROCESSO_COMPLEMENTO) IN ('); // Incluido o Complemento porque estava verificando os itens de outros REs - Michel - 25/02/2010

      if not datm_re_capa.qry_re_capa.IsEmpty then
      begin
        while not datm_re_capa.qry_re_capa.EOF do
        begin
          SQL.Add('''' + Trim(datm_re_capa.qry_re_capaNR_PROCESSO.AsString) + '/' +
             Trim(datm_re_capa.qry_re_capaNR_PROCESSO_COMPLEMENTO.AsString) + ''','); // Incluido o Complemento porque estava verificando os itens de outros REs - Michel - 25/02/2010
          datm_re_capa.qry_re_capa.Next;
        end;

        SQL.Strings[SQL.Count-1] := Copy(SQL.Strings[SQL.Count-1],0,Length(SQL.Strings[SQL.Count-1])-1);
        SQL.Add('                         )');
        Open;
        while not EOF do
        begin
          if ( Trim( Fields[1].AsString ) = '' ) or
             ( ( Trim( Fields[3].AsString ) <> '1' ) and ( Trim( Fields[2].AsString ) = '' ) ) or
             ( Trim( Fields[3].AsString ) = '' ) or
             ( ( Trim( Fields[3].AsString ) <> '1' ) and ( Trim( Fields[4].AsString ) = '' ) ) or
             ( Trim( Fields[5].AsString ) = '' ) then
          begin
            //by Carlos 24/09/2010 - equiparando a consistencia do valor a vista( fields[6] ) com valor antecipado( fields[7] ) 
            vMensagemAux := '';
            if ( Trim( Fields[1].AsString ) = '' ) then
              vMensagemAux := vMensagemAux + ' / Modalidade Transação ';
            if ( Trim( Fields[2].AsString ) = '' ) and ( Trim( Fields[1].AsString ) <> '005' ) and ( (Fields[6].AsFloat = 0) and (Fields[7].AsFloat = 0) ) then
              vMensagemAux := vMensagemAux + ' / Periodicidade ';
            if ( Trim( Fields[3].AsString ) = '' ) and ( Trim( Fields[1].AsString ) <> '005' ) and ( (Fields[6].AsFloat = 0) and (Fields[7].AsFloat = 0) ) then
              vMensagemAux := vMensagemAux + ' / Número de Parcelas ';
            if ( Trim( Fields[4].AsString ) = '' ) and ( Trim( Fields[1].AsString ) <> '005' ) and ( (Fields[6].AsFloat = 0) and (Fields[7].AsFloat = 0) ) then
              vMensagemAux := vMensagemAux + ' / Indicador ';
            if ( Trim( Fields[5].AsString ) = '' ) then
              vMensagemAux := vMensagemAux + ' / Finalidade ';
            //exclui o processo com campos em branco da trasmissão
            if vMensagemAux <> '' then
            begin
              BoxMensagem('Não será possível continuar a transmissão do processo " ' + Trim(Fields[0].AsString) + ' " esta com campos importantes em branco: ' + Copy(vMensagemAux,3,Length(vMensagemAux)),2);
              FinalizaTransmissao(0);
              Exit;
            end;
          end;
          Next;
        end;
      end
      else
        BoxMensagem('Não será possível continuar a transmissão do processo " ' + Trim(Fields[0].AsString) + ' " esta com campos importantes em branco: ' + Copy(vMensagemAux,3,Length(vMensagemAux)),2);
      Close;
      Free;
    end;
  end
  else
  begin
    if datm_re_capa.qry_re_capa.FieldByName('VL_VALOR_COBER_CAMBIAL').AsString = '' then
    begin
      BoxMensagem('Não será possível continuar a transmissão do processo "' + edt_nr_processo.Text + ' " pois o campo "Valor s/ Cobertura Câmbio" está em branco', 2);
      EditValSemCobCambio.SetFocus;
      Exit;
    end;
  end;

  //executa transmissão e update das tabelas antigas
  datm_re_capa.qry_re_capa.Close;
  datm_re_capa.qry_re_capa.SQL.Text := datm_re_capa.GetSelQueryRE(frm_re_capa.edrQtRegistros.text);
  datm_re_capa.qry_re_capa.SQL.Strings[14] := '  AND RC.NR_PROCESSO = "' + datm_re_capa.qry_re_capaNR_PROCESSO.AsString + '" '+
                                              '  AND NR_PROCESSO_COMPLEMENTO = "' + datm_re_capa.qry_re_capa.FieldByname('NR_PROCESSO_COMPLEMENTO').AsString + '" ';
  datm_re_capa.qry_re_capa.ParamByName('CD_UNID_NEG').AsString := edt_cd_unidade.Text;
  datm_re_capa.qry_re_capa.ParamByName('CD_PRODUTO').AsString := msk_cd_produto.Text;
  datm_re_capa.qry_re_capa.Prepare;
  datm_re_capa.qry_re_capa.Open;
  datm_re_capa.qry_re_capa.First;

  while not datm_re_capa.qry_re_capa.Eof do
  begin

    // comentado by Carlos 17/09/2009 - tabela TACESSO_SCX_EXP pela view VW_DESPACHANTE_CLIENTE
    if not TransmiteRE( 'RE', ConsultaOnLineExFILTRO('VW_DESPACHANTE_CLIENTE','Escolha o Usuário',['CD_ACESSO','NM_USUARIO','CPF_USUARIO'],['Código','Usuário','CPF'],'CD_ACESSO','TIPO="RE" AND CD_EMPRESA="'+edt_cd_exportador.Text +'"' , nil,'' )) then
    begin
      MessageDlg('Ocorreu um erro na geração do arquivo.' + #10#13 + 'Favor informar o ocorrido ao suporte', mtError, [mbOK], 0);
      exit;
    end
    else
    begin
        with TQuery.Create(application) do
        begin
          DatabaseName := 'DBBROKER';
           //Verifica NCM´s nos anexos
          SQL.Clear;
          SQL.Add('SELECT DISTINCT CD_NBM FROM TRE_ANEXO (NOLOCK) WHERE NR_PROCESSO = ' + QuotedStr(datm_re_capa.qry_re_capa.FieldByName('NR_PROCESSO').AsString));
          SQL.Add(' AND NR_PROCESSO_COMPLEMENTO = ' + QuotedStr(datm_re_capa.qry_re_capa.FieldByName('NR_PROCESSO_COMPLEMENTO').AsString));
          Prepare;
          Open;
          if RecordCount > 1 then
          begin
            vVariosNCMs := true;
            BoxMensagem('Após este processo será necessário preencher os NCM´s ' + chr(13) + 'no Processo de Exportação, aba RE do Processo: ' + datm_re_capa.qry_re_capa.FieldByName('NR_PROCESSO').AsString + '! ', 3);
          end
          else vVariosNCMs := false;
          //passa pra variáveis valores da TRE_ANEXO
          SQL.Clear;
          SQL.Add('SELECT SUBSTRING(''000'',1, 3- LEN(CONVERT(CHAR, MAX(ISNULL(CD_RE_ANEXO, 1))))) + CONVERT(CHAR, MAX(ISNULL(CD_RE_ANEXO, 1))) FROM TRE_ANEXO (NOLOCK) ');
          SQL.Add('WHERE NR_PROCESSO = ' + QuotedStr(datm_re_capa.qry_re_capa.FieldByName('NR_PROCESSO').AsString));
          SQL.Add(' AND NR_PROCESSO_COMPLEMENTO = ' + QuotedStr(datm_re_capa.qry_re_capa.FieldByName('NR_PROCESSO_COMPLEMENTO').AsString));
          Prepare;
          Open;
          vNR_ANEXO_FIM := Trim(Fields[0].AsString);
          //outros valores da TRE_ANEXO
          SQL.Clear;
          SQL.Add('SELECT CD_NBM, CD_UNID_MEDIDA FROM TRE_ANEXO (NOLOCK) ');
          SQL.Add('WHERE NR_PROCESSO = ' + QuotedStr(datm_re_capa.qry_re_capa.FieldByName('NR_PROCESSO').AsString));
          SQL.Add(' AND NR_PROCESSO_COMPLEMENTO = ' + QuotedStr(datm_re_capa.qry_re_capa.FieldByName('NR_PROCESSO_COMPLEMENTO').AsString));
          SQL.Add(' AND CD_RE_ANEXO = ''001'' ');
          Prepare;
          Open;
          vNR_NBM         := Trim(Fields[0].AsString);
          vCD_UNID_MEDIDA := Trim(Fields[1].AsString);
          //update TPROCESSO_EXP_RE verificando se já existe na tabela(19/01/2006)
          SQL.Clear;
          SQL.Add('SELECT NR_PROCESSO FROM TPROCESSO_EXP_RE (NOLOCK) WHERE NR_PROCESSO = '  + QuotedStr(datm_re_capa.qry_re_capa.FieldByName('NR_PROCESSO').AsString));
          SQL.Add(' AND NR_RE = ' + QuotedStr(Copy(datm_re_capa.qry_re_capa.FieldByName('NR_RE_SISCOMEX').AsString, 1, 2) +
                                                    Copy(datm_re_capa.qry_re_capa.FieldByName('NR_RE_SISCOMEX').AsString, 4, 7) +
                                                    Copy(datm_re_capa.qry_re_capa.FieldByName('NR_RE_SISCOMEX').AsString, 12, 3)) );
          Prepare;
          Open;
          if IsEmpty then
          begin
            if datm_re_capa.qry_re_capa.FieldByName('NR_RE_SISCOMEX').AsString <> '' then //Trava feita para impedir que seja inserido registros na manut proc sem num da RE - ocorrência 04430/08
            begin
              SQL.Clear;
              SQL.Add('INSERT INTO TPROCESSO_EXP_RE (NR_PROCESSO, NR_RE, DT_RE, AP_UNID_MED, AP_MOEDA, VL_FOB, QT_PESO_LIQ, CD_NBM_SH) VALUES ( ');
              SQL.Add(':NR_PROCESSO, :NR_RE, :DT_RE, :AP_UNID_MED, :AP_MOEDA, :VL_FOB, :QT_PESO_LIQ, :CD_NBM_SH)');

              ParamByName('NR_PROCESSO').AsString := datm_re_capa.qry_re_capa.FieldByName('NR_PROCESSO').AsString;
              ParamByName('NR_RE').AsString       := datm_re_capa.qry_re_capa.FieldByName('NR_RE_SISCOMEX').AsString;
              ParamByName('DT_RE').AsDateTime     := datm_re_capa.qry_re_capa.FieldByName('DT_DATA_RE').AsDateTime;
              ParamByName('AP_UNID_MED').AsString := vCD_UNID_MEDIDA;
              ParamByName('AP_MOEDA').AsString    := datm_re_capa.qry_re_capa.FieldByName('CD_MOEDA').AsString;
              ParamByName('VL_FOB').AsFloat       := datm_re_capa.qry_re_capa.FieldByName('VL_ESQUE_PG_TOTAL').AsFloat;
              ParamByName('QT_PESO_LIQ').AsFloat  := datm_re_capa.qry_re_capa.FieldByName('PESO_LIQUIDO_TOTAL').AsFloat;
              ParamByName('CD_NBM_SH').AsString   := vNR_NBM;
              ExecSQL;
            end;
          end
          else  // ATUALIZA DATA DA TRANSMISSAO - MICHEL - 03/11/2008
          begin
            SQL.Clear;
            SQL.Add('UPDATE TPROCESSO_EXP_RE');
            SQl.Add('SET DT_RE = CONVERT(DATETIME, ''' + datm_re_capa.qry_re_capa.FieldByName('DT_DATA_RE').AsString + ''')');
            SQL.Add('WHERE NR_PROCESSO = ''' + datm_re_capa.qry_re_capa.FieldByName('NR_PROCESSO').AsString + '''');
            SQL.Add('  AND NR_RE = ''' + Copy(datm_re_capa.qry_re_capa.FieldByName('NR_RE_SISCOMEX').AsString, 1, 2) +
                                         Copy(datm_re_capa.qry_re_capa.FieldByName('NR_RE_SISCOMEX').AsString, 4, 7) +
                                         Copy(datm_re_capa.qry_re_capa.FieldByName('NR_RE_SISCOMEX').AsString, 12, 3) + '''');
            ExecSQL;
          end;

          //update da TPROCESSO_EXP_DDE_RE verificando se já existe(19/01/2006)
          SQL.Clear;
          SQL.Add('SELECT NR_PROCESSO FROM TPROCESSO_EXP_DDE_RE (NOLOCK) WHERE NR_PROCESSO = '  + QuotedStr(datm_re_capa.qry_re_capa.FieldByName('NR_PROCESSO').AsString));
          Prepare;
          Open;
          if IsEmpty then
          begin
            SQL.Clear;
            SQl.Add('INSERT INTO TPROCESSO_EXP_DDE_RE (NR_PROCESSO, NR_RE, NR_ANEXO_INI, NR_ANEXO_FIM, DT_REGISTRO)');
            SQl.Add(' VALUES (:NR_PROCESSO, :NR_RE_SISCOMEX, ''001'', :NR_ANEXO_FIM, CONVERT(DATETIME, :DT_DATA_RE, 103))');

            ParamByName('NR_PROCESSO').AsString := datm_re_capa.qry_re_capa.FieldByName('NR_PROCESSO').AsString;
            ParamByName('NR_RE_SISCOMEX').AsString := Copy(datm_re_capa.qry_re_capa.FieldByName('NR_RE_SISCOMEX').AsString, 1, 2) +
                                                       Copy(datm_re_capa.qry_re_capa.FieldByName('NR_RE_SISCOMEX').AsString, 4, 7) +
                                                       Copy(datm_re_capa.qry_re_capa.FieldByName('NR_RE_SISCOMEX').AsString, 12, 3);
            ParamByName('NR_ANEXO_FIM').AsString := vNr_ANEXO_FIM;
            ParamByName('DT_DATA_RE').AsString := datm_re_capa.qry_re_capa.FieldByName('DT_DATA_RE').AsString;

            ExecSQL;
          end
          else  // ATUALIZA DATA DA TRANSMISSAO - MICHEL - 03/11/2008
          begin
            SQL.Clear;
            SQL.Add('UPDATE TPROCESSO_EXP_DDE_RE');
            SQl.Add('SET DT_REGISTRO = CONVERT(DATETIME, :DT_DATA_RE, 103)');
            SQL.Add('WHERE NR_PROCESSO = :NR_PROCESSO');

            ParamByName('DT_DATA_RE').AsString  := datm_re_capa.qry_re_capa.FieldByName('DT_DATA_RE').AsString;
            ParamByName('NR_PROCESSO').AsString := datm_re_capa.qry_re_capa.FieldByName('NR_PROCESSO').AsString;

            ExecSQL;
          end;

          {// UPDATE TFOLLOWUP - MICHEL - 03/11/2008
          //Alterado campo de data por motivos de erro - Michel - 12/03/2009
          // EVENTO 122
          SQL.Clear;
          SQL.Add('UPDATE TFOLLOWUP');
          SQL.Add('SET DT_REALIZACAO      = ISNULL(DT_REALIZACAO, CONVERT(DATETIME, ''' + datm_re_capa.qry_re_capa.FieldByName('DT_DATA_RE').AsString + ''', 103)),');
          SQL.Add('    CD_RESP_REALIZACAO = ISNULL(CD_RESP_REALIZACAO, ''' + str_cd_usuario + ''')');
          SQL.Add('WHERE NR_PROCESSO = ''' + datm_re_capa.qry_re_capa.FieldByName('NR_PROCESSO').AsString + '''');
          SQL.Add('  AND CD_EVENTO   = ''122''');
          ExecSQL;
          // EVENTO 402
          SQL.Clear;
          SQL.Add('UPDATE TFOLLOWUP');
          SQL.Add('SET DT_REALIZACAO      = ISNULL(DT_REALIZACAO, CONVERT(DATETIME, ''' + datm_re_capa.qry_re_capa.FieldByName('DT_DATA_RE').AsString + ''', 103)),');
          SQL.Add('    CD_RESP_REALIZACAO = ISNULL(CD_RESP_REALIZACAO, ''' + str_cd_usuario + ''')');
          SQL.Add('WHERE NR_PROCESSO = ''' + datm_re_capa.qry_re_capa.FieldByName('NR_PROCESSO').AsString + '''');
          SQL.Add('  AND CD_EVENTO   = ''402''');
          ExecSQL;
          Free;}

          // UPDATE TFOLLOWUP - MICHEL - 03/11/2008
          // Substituido Update acima pelo abaixo poara incluir a hora - Michel - 06/04/2010
          // EVENTO 122
          SQL.Clear;
          SQL.Add('UPDATE F');
          if ConsultaLookUPSQL(' SELECT ISNULL(CS.IN_HORA_EVENTOS, ''0'') AS IN_HORA_EVENTOS ' +
                               ' FROM TCLIENTE_SERVICO CS (NOLOCK) INNER JOIN TPROCESSO P (NOLOCK) ON P.CD_SERVICO = CS.CD_SERVICO ' +
                               '                                                AND P.CD_CLIENTE = CS.CD_CLIENTE ' +
                               '                                                AND P.CD_UNID_NEG = CS.CD_UNID_NEG ' +
                               '                                                AND P.CD_PRODUTO  = CS.CD_PRODUTO ' +
                               ' WHERE P.NR_PROCESSO = ' + QuotedStr(datm_re_capa.qry_re_capa.FieldByName('NR_PROCESSO').AsString), 'IN_HORA_EVENTOS') = '1' then
            SQL.Add('SET DT_REALIZACAO = ISNULL(DT_REALIZACAO, RC.DT_DATA_RE),')
          else
            SQL.Add('SET DT_REALIZACAO = ISNULL(CONVERT(DATETIME, CONVERT(VARCHAR, DT_REALIZACAO, 103), 103), CONVERT(DATETIME, CONVERT(VARCHAR, RC.DT_DATA_RE, 103), 103)),');
          SQL.Add('    CD_RESP_REALIZACAO = ISNULL(CD_RESP_REALIZACAO, ''' + str_cd_usuario + ''')');
          SQL.Add('FROM TFOLLOWUP F (NOLOCK) INNER JOIN TRE_CAPA RC (NOLOCK) ON RC.NR_PROCESSO = F.NR_PROCESSO');
          SQL.Add('WHERE F.NR_PROCESSO = ''' + datm_re_capa.qry_re_capa.FieldByName('NR_PROCESSO').AsString + '''');
          SQL.Add('  AND F.CD_EVENTO   = ''122''');
          ExecSQL;
          // EVENTO 402
          SQL.Clear;
          SQL.Add('UPDATE F');
          if ConsultaLookUPSQL(' SELECT ISNULL(CS.IN_HORA_EVENTOS, ''0'') AS IN_HORA_EVENTOS ' +
                               ' FROM TCLIENTE_SERVICO CS (NOLOCK) INNER JOIN TPROCESSO P (NOLOCK) ON P.CD_SERVICO = CS.CD_SERVICO ' +
                               '                                                AND P.CD_CLIENTE = CS.CD_CLIENTE ' +
                               '                                                AND P.CD_UNID_NEG = CS.CD_UNID_NEG ' +
                               '                                                AND P.CD_PRODUTO  = CS.CD_PRODUTO ' +
                               ' WHERE P.NR_PROCESSO = ' + QuotedStr(datm_re_capa.qry_re_capa.FieldByName('NR_PROCESSO').AsString), 'IN_HORA_EVENTOS') = '1' then
            SQL.Add('SET DT_REALIZACAO = ISNULL(DT_REALIZACAO, RC.DT_DATA_RE),')
          else
            SQL.Add('SET DT_REALIZACAO = ISNULL(CONVERT(DATETIME, CONVERT(VARCHAR, DT_REALIZACAO, 103), 103), CONVERT(DATETIME, CONVERT(VARCHAR, RC.DT_DATA_RE, 103), 103)),');
          SQL.Add('    CD_RESP_REALIZACAO = ISNULL(CD_RESP_REALIZACAO, ''' + str_cd_usuario + ''')');
          SQL.Add('FROM TFOLLOWUP F (NOLOCK) INNER JOIN TRE_CAPA RC (NOLOCK) ON RC.NR_PROCESSO = F.NR_PROCESSO');
          SQL.Add('WHERE F.NR_PROCESSO = ''' + datm_re_capa.qry_re_capa.FieldByName('NR_PROCESSO').AsString + '''');
          SQL.Add('  AND F.CD_EVENTO   = ''402''');
          ExecSQL;
          Free;

          // Na ocorrência anterior era criado o componente datm_proc_realiza, mas estava dando problema para destruir o
          // componente. Então foi susbstituido pelo procedimento abaixo
          // Cria o datamodule para usar o componente sp_atz_followup - Michel - 18/12/2008 - Ocorrência 07028/08
          with Tdatm_proc_realiza.Create(Application) do
          begin
            CloseStoredProc(sp_atz_followup);
            sp_atz_followup.ParamByName('@nr_processo').AsString := datm_re_capa.qry_re_capa.FieldByName('NR_PROCESSO').AsString;
            ExecStoredProc(sp_atz_followup);
            CloseStoredProc(sp_atz_followup);
            Free;
          end;
        end;
    end;
    datm_re_capa.qry_re_capa.Next;
  end;

  FinalizaTransmissao(1);
end;


procedure FinalizaTransmissao(ok: integer);
var
    posicao: String;
begin
  posicao := datm_re_capa.qry_re_capa.FieldByName('NR_PROCESSO').AsString;
  datm_re_capa.qry_re_capa.DisableControls;
  
  datm_re_capa.qry_re_capa.Close;
  datm_re_capa.qry_re_capa.SQL.Text := datm_re_capa.GetSelQueryRE(frm_re_capa.edrQtRegistros.text);
  datm_re_capa.qry_re_capa.SQL.Strings[14] := '  AND P.IN_CANCELADO <> 1';  
  datm_re_capa.qry_re_capa.ParamByName('CD_UNID_NEG').AsString := frm_re_capa.edt_cd_unidade.Text;
  datm_re_capa.qry_re_capa.ParamByName('CD_PRODUTO').AsString := frm_re_capa.msk_cd_produto.Text;
  datm_re_capa.qry_re_capa.Prepare;
  datm_re_capa.qry_re_capa.Open;
  datm_re_capa.qry_re_capa.Locate('NR_PROCESSO',posicao,[]);
  datm_re_capa.qry_re_capa.EnableControls;

  if ok = 1 then //processo ok
    Application.MessageBox('O Processo foi Concluído!', 'Mensagem', mb_Ok+mb_IconInformation)
  else
     Application.MessageBox('O Processo NÃO foi transmitido!', 'Mensagem', mb_Ok+mb_IconInformation);


   { FECHAR EMULADOR - by Carlos}
   datm_re_capa.ByHLLAPI.DescarregaDLL;
   TerminateProcesso('ntvdm.exe');

   //tempo para retirar totalmente da memoria a dll e o emulador e recomeçar o timer
   sleep(10000);


end;

procedure Tfrm_re_capa.SpeedButton15Click(Sender: TObject);
begin
  if Sender is TSpeedButton then
  begin
    if not PoeEmEdicao(datm_re_capa.qry_re_capa) then
      exit;

    dbedt_cd_modalidade_trans.Text := ConsultaOnLineExSQL('SELECT CD_MODALIDADE_TRANS, NM_MODALIDADE_TRANS FROM TMODALIDADE_TRANS (NOLOCK) WHERE IN_ATIVO = "1"', 'Modalidade de Transação',['CD_MODALIDADE_TRANS','NM_MODALIDADE_TRANS'], ['Código','Descrição'], 'CD_MODALIDADE_TRANS');
    datm_re_capa.qry_re_capa.FieldByname('CD_MODALIDADE_TRANS').AsString := dbedt_cd_modalidade_trans.Text;
  end
  else
    edt_nm_modalidade_trans.Text := ConsultaLookUP('TMODALIDADE_TRANS', 'CD_MODALIDADE_TRANS', dbedt_cd_modalidade_trans.Text, 'NM_MODALIDADE_TRANS');
end;

procedure Tfrm_re_capa.SpeedButton14Click(Sender: TObject);
begin
  if Sender is TSpeedButton then begin
    if not PoeEmEdicao(datm_re_capa.qry_re_capa) then
      exit;
    dbedt_cd_incoterm.Text := ConsultaOnLineEx('TINCOTERMS_VENDA','Condições de venda (Incoterms)',['CODIGO', 'DESCRICAO'], ['Código', 'Descrição'], 'CODIGO');
  end
  else
    edt_nm_incoterm.Text := ConsultaLookUP('TINCOTERMS_VENDA', 'CODIGO', dbedt_cd_incoterm.Text, 'DESCRICAO');
end;

procedure Tfrm_re_capa.CalculoIncoterm;
  function ValorItem( xItem , xTotal , xFator : double ) : double;
  begin
    if xTotal = 0 then
      Result := 0
    else
      Result := ( xItem / xTotal ) * xFator;
  end;
var
  vrFreteRateado,vrSeguroRateado,
  vrSomaNBM, vrTotal,vrSomaPeso: double;
  sIncoterm: string;
  i_int, vAnexoAux : integer;
  i_frac: real;
begin
  sIncoterm := datm_re_capa.qry_re_capa.FieldByName('CD_INCOTERM').AsString;
  vrSomaNBM := 0;
  vrSomaPeso:= 0;
    with datm_re_capa.qry_re_anexo do
    begin
      // marca o anexo selecionado, para poder posiciona-lo após atualizar os valores.
      vAnexoAux := FieldByName('CD_RE_ANEXO').AsInteger;
      // começa a contagem dos valores.
      DisableControls; //by Carlos
      First;
      while not EOF do
      begin
        if ExecutarCalculoIncoterm then
        begin
          Edit;
          vrFreteRateado  := ValorItem( RetNum( FieldByName('PESO_LIQUIDO').AsFloat ),
                                        RetNum( datm_re_capa.qry_re_capa.FieldByName('PESO_LIQUIDO_TOTAL').AsFloat ),
                                        RetNum( datm_re_capa.qry_re_capa.FieldByName('VL_FRETE_TOTAL').AsFloat ) ) ;
          vrSeguroRateado := ValorItem( RetNum( FieldByName('VL_LOCAL_VENDA').AsFloat ),
                                        RetNum( datm_re_capa.qry_re_capa.FieldByName('VL_ESQUE_PG_TOTAL').AsFloat ),
                                        RetNum( datm_re_capa.qry_re_capa.FieldByName('VL_SEGURO_TOTAL').AsFloat ) );
          vrTotal         := RetNum( FieldByName('VL_LOCAL_VENDA').AsFloat );
          if sIncoterm = 'CIF' then
            vrTotal := vrTotal + vrSeguroRateado// + vrFreteRateado
          else if sIncoterm = 'CFR' then
            vrTotal := vrTotal;// + vrFreteRateado;

          FieldByName('VL_COND_VENDA').AsFloat  := vrTotal;

          vrSomaNBM := vrSomaNBM + vrTotal;
          Post;
        end else begin
          vrTotal         := RetNum( FieldByName('VL_COND_VENDA').AsFloat );
          vrSomaNBM := vrSomaNBM + vrTotal;
        end;

        vrSomaPeso:=vrSomaPeso+FieldByName('PESO_LIQUIDO').AsFloat;

        Next;
      end;
      EnableControls; //by Carlos
    end;
  i_int   := Trunc( vrSomaNBM );
  i_frac  := Frac( vrSomaNBM );
  vrSomaNBM := i_int + StrToFloat( FormatFloat( '0.00', i_frac ));

{
  i_int   := Trunc( vrSomaPeso );
  i_frac  := Frac( vrSomaPeso );
  vrSomaPeso := i_int + StrToFloat( FormatFloat( '0.00', i_frac ));
 }

  datm_re_capa.qry_re_capa.Edit;
  datm_re_capa.qry_re_capa.FieldByName('VL_VALOR_NBM_INCLUIDAS').AsFloat := vrSomaNBM;
  datm_re_capa.qry_re_capa.FieldByName('VL_PESO_NBM_INCLUIDAS').AsFloat  := vrSomaPeso;
  datm_re_capa.qry_re_capa.Post;
  datm_re_capa.qry_re_anexo.Locate('CD_RE_ANEXO', vAnexoAux, []);



end;

procedure Tfrm_re_capa.CalculoEsqPgTotal;
var vrTotal, vrFrete, vrSeguro, percentMargem, vrMargemNSacada: double;
    i_int: integer;
    i_frac: real;
begin
  if datm_re_capa.qry_re_capa.FieldByName('NR_PARCELAS').AsString <> '' then
    vrTotal := RetNum( datm_re_capa.qry_re_capa.FieldByName('VL_PAGTO_ANTEC').AsFloat ) +
       	       RetNum( datm_re_capa.qry_re_capa.FieldByName('VL_PAGT_VISTA').AsFloat  ) +
             ( RetNum( datm_re_capa.qry_re_capa.FieldByName('VL_PARCELA').AsFloat     ) *
               RetNum( datm_re_capa.qry_re_capa.FieldByName('NR_PARCELAS').AsFloat  ) )
  else
    vrTotal := RetNum( datm_re_capa.qry_re_capa.FieldByName('VL_PAGTO_ANTEC').AsFloat ) +
       	       RetNum( datm_re_capa.qry_re_capa.FieldByName('VL_PAGT_VISTA').AsFloat  ) +
             ( RetNum( datm_re_capa.qry_re_capa.FieldByName('VL_PARCELA').AsFloat     ) * 1 );

  vrTotal := RetNum( vrTotal ) +
             RetNum( datm_re_capa.qry_re_capa.FieldByName('VL_VALOR_COBER_CAMBIAL').AsFloat ) +
             RetNum( datm_re_capa.qry_re_capa.FieldByName('VL_VALOR_CONSIGNACAO').AsFloat   ) +
             RetNum( datm_re_capa.qry_re_capa.FieldByName('VL_VALOR_FINANCEIRO_RC').AsFloat ) ;
  percentMargem := ( RetNum( datm_re_capa.qry_re_capa.FieldByName('PC_MARGEM_NAO_SACADA').AsFloat ) / 100);
  vrTotal := vrTotal / ( 1 - percentMargem );
  vrMargemNSacada := vrTotal * percentMargem;
  datm_re_capa.qry_re_capa.FieldByName('VL_MARGEM_NAO_SACADA').AsFloat := vrMargemNSacada;
  i_int   := Trunc( vrTotal );
  i_frac  := Frac( vrTotal );
  vrTotal := i_int + StrToFloat( FormatFloat( '0.00', i_frac ));
  datm_re_capa.qry_re_capa.FieldByName('VL_ESQUE_PG_TOTAL').AsFloat        := vrTotal;
  datm_re_capa.qry_re_capa.FieldByName('VL_TOTAL_COND_VENDA_ACUM').AsFloat := vrTotal;
End;

function TFrm_re_capa.AlimentaManutencao : Boolean;
begin
  with TQuery.Create(application) do
  begin
    DatabaseName := 'DBBROKER';
    SQL.Clear;
    SQL.Add('EXEC SP_RE_ALIMENTA_MANUTENCAO ''' + datm_re_capa.qry_re_capa.FieldByName('NR_PROCESSO').AsString + '''');
    ExecSQL;
    Free;
  end;
  Result:=True; // by carlos 18/08/2010 (a SP acima está toda comentada)
end;

procedure Tfrm_re_capa.SpeedButton2Click(Sender: TObject);
var
  vFileName : String;
  H:HWnd;
  posicao : String;

begin
  datm_re_capa.qry_re_capa.Close;
  datm_re_capa.qry_re_capa.SQL.Text := datm_re_capa.GetSelQueryRE(frm_re_capa.edrQtRegistros.text);
  datm_re_capa.qry_re_capa.SQL.Strings[14] := '  AND RC.NR_PROCESSO = "' + datm_re_capa.qry_re_capaNR_PROCESSO.AsString + '" '+
                                              '  AND NR_PROCESSO_COMPLEMENTO = "' + datm_re_capa.qry_re_capa.FieldByname('NR_PROCESSO_COMPLEMENTO').AsString + '" ';
  datm_re_capa.qry_re_capa.ParamByName('CD_UNID_NEG').AsString := edt_cd_unidade.Text;
  datm_re_capa.qry_re_capa.ParamByName('CD_PRODUTO').AsString := msk_cd_produto.Text;
  datm_re_capa.qry_re_capa.Prepare;
  datm_re_capa.qry_re_capa.Open;

  vFileName := copy(StringReplace(datm_re_capa.qry_re_capa.FieldByName('NR_PROCESSO').AsString,'-','',[rfReplaceAll]),5,6);

  PausarMySenhas;

  // comentado by Carlos 17/09/2009 - tabela TACESSO_SCX_EXP pela view VW_DESPACHANTE_CLIENTE
  if not ConsultaRE( vFileName, ConsultaOnLineExFILTRO('VW_DESPACHANTE_CLIENTE','Escolha o Usuário',['CD_ACESSO','NM_USUARIO','CPF_USUARIO'],['Código','Usuário','CPF'],'CD_ACESSO','TIPO="RE" AND CD_EMPRESA="'+edt_cd_exportador.Text +'"' , nil,'' )) then
  begin
    ContinuarMySenhas;
    MessageDlg('Ocorreu um erro na geração do arquivo.' + #10#13 + 'Favor informar o ocorrido ao suporte', mtError, [mbOK], 0);
    exit;
  end;

  ContinuarMySenhas;

  posicao := datm_re_capa.qry_re_capa.FieldByName('NR_PROCESSO').AsString;

  Application.MessageBox('Processo Concluído!', 'Mensagem', mb_Ok+mb_IconInformation);

  datm_re_capa.qry_re_capa.Close;
  datm_re_capa.qry_re_capa.SQL.Text := datm_re_capa.GetSelQueryRE(frm_re_capa.edrQtRegistros.text);  
  datm_re_capa.qry_re_capa.SQL.Strings[14] := '  AND P.IN_CANCELADO <> 1';
  datm_re_capa.qry_re_capa.ParamByName('CD_UNID_NEG').AsString := edt_cd_unidade.Text;
  datm_re_capa.qry_re_capa.ParamByName('CD_PRODUTO').AsString  := msk_cd_produto.Text;
  datm_re_capa.qry_re_capa.Prepare;
  datm_re_capa.qry_re_capa.Open;

end;

procedure Tfrm_re_capa.DBGrid1DrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
begin
  //if (Trim(datm_re_capa.qry_re_capa.FieldByname('NR_RE_SISCOMEX').AsString) <> '/-') and (datm_re_capa.qry_re_capa.FieldByname('NR_RE_SISCOMEX').AsString <> '') then
  // Comentado acima e utilizando abaixo para verificar se o numero sem barra e traço algum é vazio - Michel
  if Trim(StringReplace(StringReplace(datm_re_capa.qry_re_capa.FieldByname('NR_RE_SISCOMEX').AsString, '/', '', [rfReplaceAll]), '-', '', [rfReplaceAll])) <> '' then
  begin
    DBGrid1.Canvas.Brush.Color := $00D1FCC2;
    DBGrid1.Canvas.Font.Color := clGray;
    DBGrid1.Canvas.TextRect(Rect,Rect.Left+2,Rect.Top+2,Column.Field.AsString);
  end;
end;

procedure Tfrm_re_capa.cb_ordemChange(Sender: TObject);
begin
  if cb_ordem.itemindex = 0 then
    datm_re_capa.qry_re_capa.SQL.Strings[19] := 'SUBSTRING(RC.NR_PROCESSO,13,2) DESC, RC.NR_PROCESSO DESC'
  else
    datm_re_capa.qry_re_capa.SQL.Strings[19] := a_str_indices[cb_ordem.ItemIndex];
    
  edt_cd_unidadeExit(nil);
end;

procedure Tfrm_re_capa.btn_co_ufprodutorClick(Sender: TObject);
begin
  if Sender is TSpeedButton then
  begin
    if not PoeEmEdicao(datm_re_capa.qry_re_anexo) then
      exit;
    edt_cd_ufprodutor.Text := ConsultaOnLineEx('TUF','Estado Produtor',['CD_UF', 'NM_UF'], ['Código', 'Nome'], 'CD_UF');
  end
  else
    edt_nm_ufprodutor.Text := ConsultaLookUP('TUF', 'CD_UF', edt_cd_ufprodutor.Text, 'NM_UF');
end;

procedure Tfrm_re_capa.SpeedButton3Click(Sender: TObject);
var
guarda_processo,guarda_compl,guarda_anexo:String;
begin
  { usado para apos refresh recuperar a posição atual do registro - by carlos - 07/01/2010 }
  guarda_processo:=datm_re_capa.qry_re_anexoNR_PROCESSO.AsString;
  guarda_compl   :=datm_re_capa.qry_re_anexoNR_PROCESSO_COMPLEMENTO.AsString;
  guarda_anexo   :=datm_re_capa.qry_re_anexoCD_RE_ANEXO.AsString;

  GravaObsExportComQuebras([edt_obsexport1,edt_obsexport2,edt_obsexport3,edt_obsexport4,edt_obsexport5,edt_obsexport6,edt_obsexport7,edt_obsexport8,edt_obsexport9,edt_obsexport10], datm_re_capa.qry_re_capa.FieldByName('NR_PROCESSO').AsString,datm_re_capa.qry_re_capa.FieldByName('NR_PROCESSO_COMPLEMENTO').AsString, datm_re_capa.qry_re_anexo.FieldByName('CD_RE_ANEXO').AsString );

  { REFRESH }
  if not (datm_re_capa.qry_re_anexo.State in [dsEdit,dsInsert]) then
  begin
     datm_re_capa.qry_re_anexo.Close;
     datm_re_capa.qry_re_anexo.Open;
     datm_re_capa.qry_re_anexo.Locate('NR_PROCESSO;NR_PROCESSO_COMPLEMENTO;CD_RE_ANEXO',VarArrayOf([ guarda_processo,guarda_compl,guarda_anexo ]),[]);
  end else datm_re_capa.qry_re_anexo.Post;

  pnlObsExport.Visible := False;
end;

procedure Tfrm_re_capa.btn_inc_obs_exportadorClick(Sender: TObject);
begin
  if datm_re_capa.qry_re_anexo.state = dsInsert then
  begin
    MessageDlg('O Sistema irá salvar as informaçoes deste anexo antes' + #10#13 + 'de entrar com os dados de Observação do Exportador.', mtInformation, [mbOK], 0);
    datm_re_capa.qry_re_anexo.Post;
  end;
  pnlObsExport.Visible := True;
  LeObsExportComQuebras();
end;

procedure Tfrm_re_capa.ntbHistoricoExit(Sender: TObject);
begin
  if ntbHistorico.pageindex <> 0 then
    ntbHistorico.pageindex := 0;
end;

procedure Tfrm_re_capa.cb_ordemClick(Sender: TObject);
begin
//  edt_chave.Clear;
//  edt_chave.Setfocus;
end;

function Tfrm_re_capa.CamposAtivos(Ativo : Boolean): Boolean;
var
 i : integer;
 sColor : TColor;
begin
  if Ativo then
   sColor := clWindow
  else
    sColor := clBtnFace;

  for i := 0 to Self.ComponentCount -1 do
  begin
  // verificar o componente
    if (Self.Components[i] is TDBEdit) then
    begin
      // mudar a cor do componente
      if Self.Components[i].Name <> 'DBEdit3' then
      begin
        TDBEdit(Self.Components[i]).Enabled:=Ativo;
        TDBEdit(Self.Components[i]).Color:=sColor;
      end;
    end;
    if (Self.Components[i] is TEdit) then
    begin
      // mudar a cor do componente
      TEdit(Self.Components[i]).Enabled:=Ativo;
      TEdit(Self.Components[i]).Color:=sColor;
    end;
    if (Self.Components[i] is TDBMemo) then
    begin
      // mudar a cor do componente
      if (TDBMemo(Self.Components[i]).Name <> 'DBMemo1') AND (TDBMemo(Self.Components[i]).Name <> 'DBMemo2') AND (TDBMemo(Self.Components[i]).Name <> 'DBMemo3') then
      begin
        TDBMemo(Self.Components[i]).Enabled:=Ativo;
        TDBMemo(Self.Components[i]).Color:=sColor;
      end;
    end;
    if (Self.Components[i] is TMemo) then
    begin
      // mudar a cor do componente
      TMemo(Self.Components[i]).Enabled:=Ativo;
      TMemo(Self.Components[i]).Color:=sColor;
    end;
    if (Self.Components[i] is TDBLookupComboBox) then
    begin
      // mudar a cor do componente
      TDBLookupComboBox(Self.Components[i]).Enabled:=Ativo;
      TDBLookupComboBox(Self.Components[i]).Color:=sColor;
    end;
{    if (Self.Components[i] is TShape) then
    begin
      // mudar a cor do componente
      TShape(Self.Components[i]).Enabled:=Ativo;
      TShape(Self.Components[i]).Color:=sColor;
    end;
 }
  end;

  edt_anexo.Enabled:=True; {Deixar sempre ativo}

end;


procedure Tfrm_re_capa.edt_cd_urf_despachoExit(Sender: TObject);
begin
  CompletaZerosEsq(TDBEdit(Sender));
end;

procedure Tfrm_re_capa.edt_cd_urf_embarqueExit(Sender: TObject);
begin
  CompletaZerosEsq(TDBEdit(Sender));
end;

procedure Tfrm_re_capa.edt_cd_pais_destinoExit(Sender: TObject);
begin
  if TDBEdit(Sender).Text <> '' then
  CompletaZerosEsq(TDBEdit(Sender));
end;

procedure Tfrm_re_capa.btn_co_destinoClick(Sender: TObject);
begin
   if Sender is TSpeedButton then
      begin
      if not PoeEmEdicao(datm_re_capa.qry_re_capa) then
        exit;
       edt_pais_importador.Text := ConsultaOnLineEx('TPAIS', 'Pais', ['CODIGO','DESCRICAO'], ['Código','Descrição'], 'CODIGO');
      end
   else
       edt_nm_pais.Text := ConsultaLookUP('TPAIS', 'CODIGO', edt_pais_importador.Text, 'DESCRICAO');

end;

procedure Tfrm_re_capa.edt_pais_importadorExit(Sender: TObject);
begin
  CompletaZerosEsq(TDBEdit(Sender));
end;

procedure Tfrm_re_capa.btn_co_produtoClick(Sender: TObject);
begin
  if Sender is TSpeedButton then
  begin
    msk_cd_produto.Text := ConsultaOnLineEx('TPRODUTO','Produtos',['CD_PRODUTO','NM_PRODUTO'],['Código','Descrição'],'CD_PRODUTO');
    msk_cd_produtoExit(nil);
  end
  else
    edt_nm_produto.Text := ConsultaLookUP('TPRODUTO', 'CD_PRODUTO', msk_cd_produto.Text, 'NM_PRODUTO');
end;

procedure Tfrm_re_capa.msk_cd_produtoExit(Sender: TObject);
begin
  if vProduto = msk_cd_produto.Text then
    Exit;
    
  msk_cd_produto.Text   := Trim( msk_cd_produto.Text );
  ValCodEdt( msk_cd_produto );

  if ( msk_cd_produto.Text <> '' ) then
  begin
    qry_usuario_habilitacao_.Close;
    qry_usuario_habilitacao_.ParamByName('CD_USUARIO').AsString := str_cd_usuario;
    qry_usuario_habilitacao_.ParamByName('CD_PRODUTO').AsString := Trim( msk_cd_produto.Text );
    qry_usuario_habilitacao_.Prepare;
    qry_usuario_habilitacao_.Open;
    if Not ( qry_usuario_habilitacao_.Locate('CD_PRODUTO', msk_cd_produto.Text, [loCaseInsensitive]) ) then
    begin
      MessageDlg('Produto não encontrado, sem habilitação ou desativado!', mtInformation, [mbOK], 0);
      msk_cd_produto.Text := '';
      edt_nm_produto.Text := '';
      msk_cd_produto.SetFocus;
    end
    else
    begin
      qry_produto_.Close;
      qry_produto_.ParamByName('CD_PRODUTO').AsString := msk_cd_produto.Text;
      qry_produto_.Prepare;
      qry_produto_.Open;
      if Not ( qry_produto_.EOF ) then
         edt_nm_produto.Text := qry_produto_NM_PRODUTO.AsString;
    end;
  end;
  if ( msk_cd_produto.Text = '' )  then
    edt_nm_produto.Text := '';
end;

procedure Tfrm_re_capa.msk_cd_produtoKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if Key = VK_F5 then
  begin
    if Sender = msk_cd_produto then btn_co_produtoClick(TSpeedButton.NewInstance);
  end;
end;

procedure Tfrm_re_capa.edt_cd_ncmExit(Sender: TObject);
begin
  if datm_re_capa.qry_re_anexo.State in [dsInsert,dsEdit] then
  begin
    if datm_re_capa.qry_re_anexoCD_SULF_NCM.AsString = '' then
       datm_re_capa.qry_re_anexoCD_SULF_NCM.AsString := '00';
  end;
end;

procedure Tfrm_re_capa.SpeedButton8Click(Sender: TObject);
var
  vArquivoRE : TStringList;
  i : Integer;
  str_file_registro,str_file_consulta:String;
begin
  with datm_re_capa do
  begin
    try
      { O Bloco abaixo foi todo re-feito por Carlos em  07/01/2010 }

      { arquivo gerado na consulta do RE }
      str_file_consulta:='H:\TXT_RE\CONSULTA_RE'+StringReplace(StringReplace(datm_re_capa.qry_re_capa.FieldByName('NR_RE_SISCOMEX').AsString,'/','',[rfReplaceAll]),'-','',[rfReplaceAll])+'.txt';
      { arquivo gerado no registro do RE }
      str_file_registro:='H:\TXT_RE\RE'         +StringReplace(StringReplace(datm_re_capa.qry_re_capa.FieldByName('NR_RE_SISCOMEX').AsString,'/','',[rfReplaceAll]),'-','',[rfReplaceAll])+'.txt';

      mtExtratoRE.Open;
      vArquivoRE := TStringList.Create;
      if not fileExists(str_file_consulta) then begin //se não existir um arquivo TXT de consulta, usará o de TXT gerado no registro da RE
         if not fileExists(str_file_registro) then begin
            BoxMensagem('Não existe extrato de RE para este processo.',2);
            Exit;
         end else vArquivoRE.LoadFromFile(str_file_registro);
      end else  vArquivoRE.LoadFromFile(str_file_consulta);


      for i := 0 to vArquivoRE.Count - 1 do begin
        if Pos('SISBACEN',vArquivoRE.Strings[i]) > 0 then begin
          if mtExtratoRE.State in [dsInsert] then
            mtExtratoRE.Post;
          mtExtratoRE.Insert;
          mtExtratoRE.FieldByName('PROCESSO').AsString := Copy(datm_re_capa.qry_re_capa.FieldByName('NR_PROCESSO').AsString,5,10) + ' / ' + datm_re_capa.qry_re_capa.FieldByName('NR_PROCESSO_COMPLEMENTO').AsString;
        end;
        if mtExtratoRE.State in [dsInsert] then
          mtExtratoRE.FieldByName('TELA_SISCOMEX').AsString := mtExtratoRE.FieldByName('TELA_SISCOMEX').AsString + #10 + vArquivoRE.Strings[i];
      end;
      if mtExtratoRE.State in [dsInsert] then
        mtExtratoRE.Post;

      Application.CreateForm(TFrm_impressao, Frm_impressao );
      Frm_impressao.cd_unid_neg   := edt_cd_unidade.text;
      Frm_impressao.cd_produto    := '02';
      Frm_impressao.cd_modulo     := '2017';
      Frm_impressao.ShowModal;
    finally
      vArquivoRE.Free;
      mtExtratoRE.EmptyTable;
      mtExtratoRE.Close;
    end;
  end;
end;

procedure Tfrm_re_capa.DBGrid1DblClick(Sender: TObject);
var
  Processo, Complemento : String;
begin
//   if Sender = DBGrid1 then
  // begin
     Processo    := datm_re_capa.qry_re_capa.FieldByName('NR_PROCESSO').AsString;
     Complemento := datm_re_capa.qry_re_capa.FieldByName('NR_PROCESSO_COMPLEMENTO').AsString;

     datm_re_capa.qry_re_capa.DisableControls;

    { if not ((Processo = '') or (Complemento = '')) then
     begin
       datm_re_capa.qry_re_capa.Close;
       datm_re_capa.qry_re_capa.SQL.Text := datm_re_capa.GetSelQueryRE(frm_re_capa.edrQtRegistros.text);
       datm_re_capa.qry_re_capa.SQL[14] := ' AND RC.NR_PROCESSO = '+QuotedStr(Processo)+
                                         ' AND RC.NR_PROCESSO_COMPLEMENTO ='+QuotedStr(Complemento);

       datm_re_capa.qry_re_capa.ParamByName('CD_UNID_NEG').AsString := edt_cd_unidade.Text;
       datm_re_capa.qry_re_capa.ParamByName('CD_PRODUTO').AsString  := msk_cd_produto.Text;
       datm_re_capa.qry_re_capa.Open;
     end
     else  }
      btnPesquisar.click;
     if not ((Processo = '') or (Complemento = '')) then
      datm_re_capa.qry_re_capa.Locate('NR_PROCESSO;NR_PROCESSO_COMPLEMENTO', VarArrayOf([Processo, Complemento]),[]);
     datm_re_capa.qry_re_capa.EnableControls;
  // end;

   if datm_re_capa.qry_re_capaIN_NOVOEX.AsBoolean then
   begin
     Application.CreateForm(TfrmRE_NovoEx, frmRE_NovoEx);
     frmRE_NovoEx.AbreRE(datm_re_capa.qry_re_capaNR_PROCESSO.AsString, datm_re_capa.qry_re_capaNR_PROCESSO_COMPLEMENTO.AsString);
     FreeAndNil(frmRE_NovoEx);
   end;
end;

procedure Tfrm_re_capa.DBGrid1CellClick(Column: TColumn);
begin
    pnlDiferenca.Visible    :=   (( MyRound(datm_re_capa.qry_re_capa.FieldByName('VL_VALOR_NBM_INCLUIDAS').AsFloat,2) <>
                                    MyRound(datm_re_capa.qry_re_capa.FieldByName('VL_ESQUE_PG_TOTAL').AsFloat,2) )) or
                                 (( MyRound(datm_re_capa.qry_re_capa.FieldByName('VL_PESO_NBM_INCLUIDAS').AsFloat,5) <>
                                    MyRound(datm_re_capa.qry_re_capa.FieldByName('PESO_LIQUIDO_TOTAL').AsFloat,5) ));
end;

procedure Tfrm_re_capa.btnImportarDadosClick(Sender: TObject);
begin
  edtProcessoImportar.Clear;
  Panel10.Visible := True;
end;

procedure Tfrm_re_capa.btnImportarClick(Sender: TObject);
var
  vProcInserir : string;
begin
  if ConsultaLookUpSQL('SELECT COUNT(*) AS CONT          ' +
                       '  FROM TRE_CAPA     RE (NOLOCK), ' +
                       '       TEMPRESA_NAC EN (NOLOCK), ' +
                       '       TEMPRESA_EST EE (NOLOCK)  ' +
                       ' WHERE NR_PROCESSO NOT IN (SELECT DISTINCT NR_PROCESSO FROM TRE_ANEXO_PURO (NOLOCK)) ' +
                       '   AND NR_PROCESSO   = ' + QuotedStr(Trim(edt_cd_unidade.Text) + '02' + Trim(edtProcessoImportar.Text)) +
                       '   AND EN.CD_EMPRESA = RE.CD_EXPORTADOR' +
                       '   AND EE.CD_EMPRESA = RE.CD_IMPORTADOR', 'CONT') = '0' then begin
    Application.MessageBox('Processo Inválido ou Inexistente!', 'Duplicação de RE', MB_OK + MB_ICONERROR);
  end else begin
    with TQuery.Create(application) do
    begin
      try
        try
          datm_main.db_broker.StartTransaction;
          Databasename := 'DBBROKER';
          vProcInserir := edt_cd_unidade.Text + '02' + edt_nr_processo.Text;
          SQL.Clear;
          SQL.Add('DELETE TRE_CAPA WHERE NR_PROCESSO = ''' + vProcInserir + '''');
          ExecSQL;
          SQL.Clear;
          SQL.Add('DELETE TRE_ANEXO WHERE NR_PROCESSO = ''' + vProcInserir + '''');
          ExecSQL;
          SQL.Clear;
          SQL.Add('DELETE TRE_ANEXO_FABRIC WHERE NR_PROCESSO = ''' + vProcInserir + '''');
          ExecSQL;
          SQL.Clear;
          SQL.Add('INSERT INTO TRE_CAPA (NR_PROCESSO, NR_PROCESSO_COMPLEMENTO, NR_OUTRA_REF, NR_REG_VENDA, NR_REG_CREDITO, NR_RE_VINCULADA, NR_DI_VINCULADA,');
          SQL.Add('                      CD_ENQUAD1, CD_ENQUAD2, CD_ENQUAD3, CD_ENQUAD4, CD_ENQUAD5, CD_ENQUAD6, CD_INST_NEGO, CD_ACESSO, CD_URF_EMBARQUE, CD_URF_DESPACHO,');
          SQL.Add('                      IN_MARCA_ATUAL_FABRICANTE, IN_CONTROLE_RATEIO, DT_LIMITE_OPERACAO, VL_MARGEM_NAO_SACADA, VL_VALOR_CONSIGNACAO,');
          SQL.Add('                      VL_VALOR_COBER_CAMBIAL, VL_VALOR_FINANCEIRO_RC, VL_TOTAL_COND_VENDA_ACUM, VL_TOTAL_LOCAL_VENDA_ACUM, CD_ULTIMO_ANEXO_TRANSMITIDO,');
          SQL.Add('                      IN_CONTROLE_TRANSMISSAO, IN_MARCA_TRANSMISSAO, DT_DATA_TRANSMISSAO, CD_NUMERO_TRANSMISSAO, VL_ESQUE_PG_TOTAL, VL_VALOR_NBM_INCLUIDAS,');
          SQL.Add('                      CD_STATUS_RE, CD_SUARIO, DT_DATA, TM_HORA, CD_PROPRIETARIO, IN_ORIGEM_REG, NR_MASTER, NR_HOUSE, DT_DATA_AVERBACAO,');
          SQL.Add('                      DT_DATA_MASTER, CD_PAIS_FINAL, CD_TIPO_IMPORTADOR, CD_IMPORTADOR, DT_DATA_TRANSP_IBERNAT, TM_HORA_TRANSP_IBERNAT, CD_SITUACAO_RE,');
          SQL.Add('                      TX_SITUACAO_SISBACEN, CD_USUARIO_EXTERNO, TX_CPF_SISCOMEX, TX_SENHA_SISCOMEX, NM_ARQUIVO_TRANSMISSAO, IN_TRANSMISSAO_CONCLUIDA,');
          SQL.Add('                      CD_EXPORTADOR, IN_ORIGEM_RE, QT_ANEXOS, CD_MOEDA, IN_AGRUPAR, IN_QUEBRA_POR_VALOR, IN_QUEBRA_POR_FABRICANTE, IN_DESC_TIPO_RECOF,');
          SQL.Add('                      IN_NAO_QUEBRAR_LINHAS, TP_NAO_QUEBRAR_LINHAS_SEPARADOR, NR_PARCELAS, NR_PERIODICIDADE, CD_MODALIDADE_TRANS, VL_CONSIGN,');
          SQL.Add('                      VL_SEM_COB_CAMBIAL, VL_FINANC_RC, VL_PAGT_VISTA, VL_PARCELA, PC_MARGEM_NAO_SACADA, VL_ESQ_PAG_TOT, VL_PAGTO_ANTEC, CD_INCOTERM,');
          SQL.Add('                      TP_INDICADOR, PESO_LIQUIDO_TOTAL, VL_FRETE_TOTAL, VL_SEGURO_TOTAL, TX_DOCUMENTO_SISCOMEX, TX_END_IMPORTADOR,');
          SQL.Add('                      CD_PAIS_IMPORTADOR)');
          SQL.Add('SELECT ''' + vProcInserir + ''', ''001'', NR_OUTRA_REF, NR_REG_VENDA, NR_REG_CREDITO, NR_RE_VINCULADA, NR_DI_VINCULADA,');
          SQL.Add('       CD_ENQUAD1, CD_ENQUAD2, CD_ENQUAD3, CD_ENQUAD4, CD_ENQUAD5, CD_ENQUAD6, CD_INST_NEGO, CD_ACESSO, CD_URF_EMBARQUE, CD_URF_DESPACHO,');
          SQL.Add('       IN_MARCA_ATUAL_FABRICANTE, IN_CONTROLE_RATEIO, DT_LIMITE_OPERACAO, VL_MARGEM_NAO_SACADA, VL_VALOR_CONSIGNACAO,');
          SQL.Add('       VL_VALOR_COBER_CAMBIAL, VL_VALOR_FINANCEIRO_RC, VL_TOTAL_COND_VENDA_ACUM, VL_TOTAL_LOCAL_VENDA_ACUM, CD_ULTIMO_ANEXO_TRANSMITIDO,');
          SQL.Add('       IN_CONTROLE_TRANSMISSAO, IN_MARCA_TRANSMISSAO, DT_DATA_TRANSMISSAO, CD_NUMERO_TRANSMISSAO, VL_ESQUE_PG_TOTAL, VL_VALOR_NBM_INCLUIDAS,');
          SQL.Add('       CD_STATUS_RE, CD_SUARIO, DT_DATA, TM_HORA, CD_PROPRIETARIO, IN_ORIGEM_REG, NR_MASTER, NR_HOUSE, DT_DATA_AVERBACAO,');
          SQL.Add('       DT_DATA_MASTER, CD_PAIS_FINAL, CD_TIPO_IMPORTADOR, CD_IMPORTADOR, DT_DATA_TRANSP_IBERNAT, TM_HORA_TRANSP_IBERNAT, CD_SITUACAO_RE,');
          SQL.Add('       TX_SITUACAO_SISBACEN, CD_USUARIO_EXTERNO, TX_CPF_SISCOMEX, TX_SENHA_SISCOMEX, NM_ARQUIVO_TRANSMISSAO, IN_TRANSMISSAO_CONCLUIDA,');
          SQL.Add('       CD_EXPORTADOR, IN_ORIGEM_RE, QT_ANEXOS, CD_MOEDA, IN_AGRUPAR, IN_QUEBRA_POR_VALOR, IN_QUEBRA_POR_FABRICANTE, IN_DESC_TIPO_RECOF,');
          SQL.Add('       IN_NAO_QUEBRAR_LINHAS, TP_NAO_QUEBRAR_LINHAS_SEPARADOR, NR_PARCELAS, NR_PERIODICIDADE, CD_MODALIDADE_TRANS, VL_CONSIGN,');
          SQL.Add('       VL_SEM_COB_CAMBIAL, VL_FINANC_RC, VL_PAGT_VISTA, VL_PARCELA, PC_MARGEM_NAO_SACADA, VL_ESQ_PAG_TOT, VL_PAGTO_ANTEC, CD_INCOTERM,');
          SQL.Add('       TP_INDICADOR, PESO_LIQUIDO_TOTAL, VL_FRETE_TOTAL, VL_SEGURO_TOTAL, TX_DOCUMENTO_SISCOMEX, TX_END_IMPORTADOR,');
          SQL.Add('       CD_PAIS_IMPORTADOR');
          SQL.Add('  FROM TRE_CAPA (NOLOCK)');
          SQL.Add(' WHERE NR_PROCESSO = ''' + edt_cd_unidade.Text + '02' + edtProcessoImportar.Text + '''');
          SQL.Add('   AND NR_PROCESSO_COMPLEMENTO = ''001''');
          ExecSQL;
          SQL.Clear;
          SQL.Add('INSERT INTO TRE_ANEXO (NR_PROCESSO, NR_PROCESSO_COMPLEMENTO, CD_RE_ANEXO, CD_NALADI, CD_NCM, CD_NBM, CD_UF_PRODUTOR, CD_EMBALAGEM,');
          SQL.Add('                       CD_UNID_MEDIDA, CD_FINALIDADE, CD_FORMA_PGTO, TX_CATEGORIA_TEXTIL, IN_EXPORTADOR_FABRICANTE, IN_OBS_EXPORTADOR,');
          SQL.Add('                       DT_VALIDADE_EMBARQUE, PESO_LIQUIDO, QT_UNIDADE_COMERCIAL, QT_MEDIA_NBM, VL_COND_VENDA, VL_LOCAL_VENDA,');
          SQL.Add('                       PC_COMISSAO, VL_COMISSAO, VL_FRETE_RATEADO, VL_SEGURO_RATEADO, PESO_BRUTO_RATEADO, CD_USUARIO, DT_DATA, TM_HORA,');
          SQL.Add('                       TX_OBSERVACAO_EXPORTADOR, CD_ORIGEM_REGISTRO, TX_PENDENCIA, TX_OBSERVACOES, QT_EMBARCADA, VL_EMBARCADO,');
          SQL.Add('                       DT_EMBARQUE, VL_CAMB_PROVIS_RE, DT_PROVIS, VL_CAMB_APLIC_RE, DT_APLICACAO, VL_CAMB_LIQ_DESP, DT_EMB_EF_COB_CAMB,');
          SQL.Add('                       NR_SD_SISCOMEX, VL_COM_AG_EFET, DT_EMISSAO_CONHEC_EMB, PESO_LIQUIDO_KG_REBATE, QT_COMERC_REBATE,');
          SQL.Add('                       CD_UNIDADE_COMERC_REBATE, QT_NBM_SH_REBATE, CD_UNIDADE_NBM_SH_REBATE, VL_TOTAL_COND_VENDA_REBATE,');
          SQL.Add('                       VL_TOTAL_LOCAL_EMB_REBATE, VL_COMISSAO_AGENTE_REBATE, CD_FORMA_PGTO_REBATE, DT_AVERBACAO,');
          SQL.Add('                       IN_TRANSMISSAO_CONCLUIDA, TX_DESC_MERCADORIA, CD_SULF_NCM)');
          SQL.Add('SELECT ''' + vProcInserir + ''', ''001'', CD_RE_ANEXO, CD_NALADI, CD_NCM, CD_NBM, CD_UF_PRODUTOR, CD_EMBALAGEM,');
          SQL.Add('       CD_UNID_MEDIDA, CD_FINALIDADE, CD_FORMA_PGTO, TX_CATEGORIA_TEXTIL, IN_EXPORTADOR_FABRICANTE, IN_OBS_EXPORTADOR,');
          SQL.Add('       DT_VALIDADE_EMBARQUE, PESO_LIQUIDO, QT_UNIDADE_COMERCIAL, QT_MEDIA_NBM, VL_COND_VENDA, VL_LOCAL_VENDA,');
          SQL.Add('       PC_COMISSAO, VL_COMISSAO, VL_FRETE_RATEADO, VL_SEGURO_RATEADO, PESO_BRUTO_RATEADO, CD_USUARIO, DT_DATA, TM_HORA,');
          SQL.Add('       TX_OBSERVACAO_EXPORTADOR, CD_ORIGEM_REGISTRO, TX_PENDENCIA, TX_OBSERVACOES, QT_EMBARCADA, VL_EMBARCADO,');
          SQL.Add('       DT_EMBARQUE, VL_CAMB_PROVIS_RE, DT_PROVIS, VL_CAMB_APLIC_RE, DT_APLICACAO, VL_CAMB_LIQ_DESP, DT_EMB_EF_COB_CAMB,');
          SQL.Add('       NR_SD_SISCOMEX, VL_COM_AG_EFET, DT_EMISSAO_CONHEC_EMB, PESO_LIQUIDO_KG_REBATE, QT_COMERC_REBATE,');
          SQL.Add('       CD_UNIDADE_COMERC_REBATE, QT_NBM_SH_REBATE, CD_UNIDADE_NBM_SH_REBATE, VL_TOTAL_COND_VENDA_REBATE,');
          SQL.Add('       VL_TOTAL_LOCAL_EMB_REBATE, VL_COMISSAO_AGENTE_REBATE, CD_FORMA_PGTO_REBATE, DT_AVERBACAO,');
          SQL.Add('       IN_TRANSMISSAO_CONCLUIDA, TX_DESC_MERCADORIA, CD_SULF_NCM');
          SQL.Add('  FROM TRE_ANEXO (NOLOCK)');
          SQL.Add(' WHERE NR_PROCESSO = ''' + edt_cd_unidade.Text + '02' + edtProcessoImportar.Text + '''');
          SQL.Add('   AND NR_PROCESSO_COMPLEMENTO = ''001''');
          ExecSQL;
          SQL.Clear;
          SQL.Add('INSERT INTO TRE_ANEXO_FABRIC (NR_PROCESSO, NR_PROCESSO_COMPLEMENTO, CD_RE_ANEXO, CD_RE_ANEXO_FABRIC,');
          SQL.Add('                              CD_FABRICANTE, NR_ATO, QT_MERCADORIA, VL_TOTAL)');
          SQL.Add('SELECT ''' + vProcInserir + ''', ''001'', CD_RE_ANEXO, CD_RE_ANEXO_FABRIC, CD_FABRICANTE, ');
          SQL.Add('                              NR_ATO, QT_MERCADORIA, VL_TOTAL');
          SQL.Add('  FROM TRE_ANEXO_FABRIC (NOLOCK)');
          SQL.Add(' WHERE NR_PROCESSO = ''' + edt_cd_unidade.Text + '02' + edtProcessoImportar.Text + '''');
          SQL.Add('   AND NR_PROCESSO_COMPLEMENTO = ''001''');
          ExecSQL;
          datm_main.db_broker.Commit;
        except
          if datm_main.db_broker.InTransaction then
            datm_main.db_broker.Rollback;
        end;
      finally
        Free;
        Panel10.Visible := False;
        datm_re_capa.qry_re_capa.Close;
        datm_re_capa.qry_re_capa.SQL.Text := datm_re_capa.GetSelQueryRE(frm_re_capa.edrQtRegistros.text);
        datm_re_capa.qry_re_capa.Open;
        datm_re_capa.qry_re_capa.Locate('NR_PROCESSO;NR_PROCESSO_COMPLEMENTO', VarArrayOf([vProcInserir, '001']), [loCaseInsensitive]);
      end;
    end;
  end;
end;

procedure Tfrm_re_capa.SpeedButton9Click(Sender: TObject);
var
  vListAux : TStringList;
begin
  vListAux := TStringList.Create;
  vListAux.Add('SELECT SUBSTRING(NR_PROCESSO,5,10) as PROCESSO, EN.AP_EMPRESA as EXPORTADOR, EE.AP_EMPRESA as IMPORTADOR');
  vListAux.Add('  FROM TRE_CAPA RE (NOLOCK), TEMPRESA_NAC EN (NOLOCK), TEMPRESA_EST EE (NOLOCK)');
  vListAux.Add(' WHERE NR_PROCESSO NOT IN (SELECT DISTINCT NR_PROCESSO FROM TRE_ANEXO_PURO (NOLOCK)) ');
  vListAux.Add('   AND SUBSTRING(NR_PROCESSO,1,2) = ' + QuotedStr(edt_cd_unidade.Text));
  vListAux.Add('   AND EN.CD_EMPRESA = RE.CD_EXPORTADOR');
  vListAux.Add('   AND EE.CD_EMPRESA = RE.CD_IMPORTADOR');
  if trim(edt_cd_exportador.Text) <> '' then
    vListAux.Add('   AND RE.CD_EXPORTADOR = ''' + edt_cd_exportador.Text + '''');
  vListAux.Add('ORDER BY SUBSTRING(NR_PROCESSO, 5, 14) DESC');
  edtProcessoImportar.Text := ConsultaOnLineExSQLList(vListAux,'Processos',['PROCESSO', 'EXPORTADOR', 'IMPORTADOR'],['Processo', 'Exportador', 'Importador'],'PROCESSO',nil);
  vListAux.Free;
end;

procedure Tfrm_re_capa.lblSairClick(Sender: TObject);
begin
  Panel10.Visible := False;
end;

procedure Tfrm_re_capa.edt_cd_unidadeEnter(Sender: TObject);
begin
  vUnidade := edt_cd_unidade.Text;
end;

procedure Tfrm_re_capa.msk_cd_produtoEnter(Sender: TObject);
begin
  vProduto := msk_cd_produto.Text;
end;

procedure Tfrm_re_capa.cbRegistradosClick(Sender: TObject);
begin
  msk_cd_produtoExit(nil);
end;

procedure Tfrm_re_capa.btnConfirmaIntegraREClick(Sender: TObject);
var
Linhas, Colunas:TStringList;
l,x:integer;
str_linha,str_registro,str_coluna,vInsereProcesso, gNR_PROCESSO_COMPLEMENTO,str_erro_ncm:String;
flag_IN_OBS_EXPORTADOR,flag_IN_EXPORTADOR_FABRICANTE,flag_TX_OBSERVACAO_EXPORTADOR,flag_TX_DESC_MERCADORIA:String;
flag_CD_EXPORTADOR,flag_CD_IMPORTADOR,flag_TX_END_IMPORTADOR:string;
flag_DT_LIMITE_OPERACAO,flag_DT_VALIDADE_EMBARQUE,flag_CD_RE_ANEXO_FABRIC,flag_CD_FABRICANTE,flag_cd_unid_medida:Variant;
flag_Data_Abertura:TDateTime;
begin
  if not fileexists(edt_dat.Text) then
  begin
     ShowMessage('Arquivo não Encontrado!!!');
     exit;
  end;
  if Uppercase(copy(edt_dat.Text,length(edt_dat.text)-3,4))<>'.DAT' then
  begin
     ShowMessage('Extensão de Arquivo Inválida!!!');
     exit;
  end;

  gNR_PROCESSO_COMPLEMENTO := datm_re_capa.qry_re_capaNR_PROCESSO_COMPLEMENTO.AsString;
  vInsereProcesso          := datm_re_capa.qry_re_capaNR_PROCESSO.AsString;
  //
  Linhas  := TStringList.Create;
  Colunas := TStringList.Create;
  try
     linhas.LoadFromFile(edt_dat.Text);

     //verifca se IMPORTADOR e EXPORTADOR já estão cadastrados no BROKER
     for l := Pred(Linhas.Count)-1 to Pred(Linhas.Count) do begin
       str_linha:=linhas.Strings[l];
       colunas.Clear;
       ExtractStrings( [','], [' '], PChar(str_linha), Colunas );

       colunas.text:=StringReplace(Colunas.text,'"','',[rfReplaceAll] );
       str_registro:=Colunas.Strings[0];

       if str_registro = 'IM' then
       begin //EMPRESA ESTRANGEIRA
          with TQuery.Create(nil) do
          begin
            Databasename    := 'DBBROKER';
            SQL.Clear;
            SQL.Add('SELECT DISTINCT CD_EMPRESA FROM TEMPRESA_EST (NOLOCK) WHERE NR_CLIENTE="'+colunas.Strings[1]+'"' );
            open;
            flag_CD_IMPORTADOR:=Fields[0].AsString;
            close;
            free;
          end;

          //se não existir o importador , cadastra-lo nesse momento
          if flag_CD_IMPORTADOR='' then
          begin
             with TQuery.Create(nil) do
             begin
               Databasename    := 'DBBROKER';
               //Busca o Ultimo Codigo para a empresa Estrangeira
               SQL.Clear;
               SQL.Add('SELECT MAX(cd_empresa) FROM TEMPRESA_EST (NOLOCK) ' );
               open;
               flag_CD_IMPORTADOR:=StrZero(Fields[0].AsInteger+1,5);
               close;
               //
               SQL.Clear;
               SQL.Add('INSERT INTO TEMPRESA_EST (CD_EMPRESA,AP_EMPRESA,NM_EMPRESA,NM_CONTATO,NR_TELEFONE,END_EMPRESA,NR_CLIENTE ) ' );
               SQL.Add(' VALUES ');
               SQL.Add('( :CD_EMPRESA ,:AP_EMPRESA,:NM_EMPRESA,:NM_CONTATO,:NR_TELEFONE,:END_EMPRESA,:NR_CLIENTE ) ' );
               ParamByName('CD_EMPRESA').AsString :=flag_CD_IMPORTADOR;
               ParamByName('NR_CLIENTE').AsString :=Colunas.Strings[1];
               ParamByName('AP_EMPRESA').AsString :=Colunas.Strings[2];
               ParamByName('NM_EMPRESA').AsString :=Colunas.Strings[3];
               ParamByName('NM_CONTATO').AsString :=Colunas.Strings[6];
               ParamByName('NR_TELEFONE').AsString:=Colunas.Strings[7];
               ParamByName('END_EMPRESA').AsString:=Colunas.Strings[8];
               ExecSQL;
               //inclui o GRUPO 986
               SQL.Clear;
               SQL.Add('INSERT INTO TEMPRESA_EST_GRUPO (CD_EMPRESA,CD_GRUPO ) ' );
               SQL.Add(' VALUES ');
               SQL.Add('( :CD_EMPRESA ,:CD_GRUPO ) ' );
               ParamByName('CD_EMPRESA').AsString :=flag_CD_IMPORTADOR;
               ParamByName('CD_GRUPO').AsString   :='986';
               ExecSQL;
               free;
             end;
          end;
          flag_TX_END_IMPORTADOR:=Colunas.Strings[8];
       end;

       if str_registro='EX' then
       begin //EMPRESA NACIONAL
          with TQuery.Create(nil) do
          begin
            Databasename    := 'DBBROKER';
            SQL.Clear;
            SQL.Add('SELECT DISTINCT CD_EMPRESA FROM TEMPRESA_NAC (NOLOCK) WHERE CGC_EMPRESA="'+colunas.Strings[6] +'"');
            open;
            flag_CD_EXPORTADOR:=Fields[0].AsString;
            close;
            free;
          end;
       end;
     end;
     if flag_CD_EXPORTADOR='' then
     begin
        ShowMessage('O Exportador não está cadastrado no Sistema, integração não efetuada!!');
        exit;
     end;

     if flag_CD_EXPORTADOR<>datm_re_capa.qry_re_capaCD_EXPORTADOR.AsString then begin
        ShowMessage('O Exportador não é compativel com o processo posicionado, integração não efetuada !!');
        exit;
     end;

{    liberando este comentario os anexos serão excluidos por aqui mesmo
     if datm_re_capa.qry_re_anexo.RecordCount>0 then
       if MessageDlg('Já Existe um ou mais Anexo(s) Cadastrado(s).'+#13+'DESEJA APAGAR TUDO E RE-INTEGRAR NOVAMENTE ?', mtConfirmation, [mbYes, mbNo], 0) = mrNO then
          exit;
}
     if datm_re_capa.qry_re_anexo.RecordCount>0 then
     begin
        ShowMessage('Já Existe um ou mais Anexo(s) Cadastrado(s), INTEGRAÇÃO CANCELADA !!!'+#13+#13+'  Elimine os Anexos cadastrados e tente Integrar novamente.');
        exit;
     end;


     str_erro_ncm:='';
     with TQuery.Create(nil) do
     begin
        datm_main.db_broker.StartTransaction;
        Databasename    := 'DBBROKER';

        //guarda a data da Abertura da RE
        SQL.Clear;
        SQL.Add('SELECT ISNULL(DT_DATA_RE,GETDATE()) FROM TRE_CAPA (NOLOCK) WHERE NR_PROCESSO = "' + vInsereProcesso + '"');
        open;
        flag_Data_Abertura:=fields[0].AsDateTime;
        close;

        //apaga processo de RE caso Exista
        SQL.Clear;
        SQL.Add('DELETE TRE_CAPA WHERE NR_PROCESSO = "'         + vInsereProcesso + '"');
        ExecSQL;
        SQL.Clear;
        SQL.Add('DELETE TRE_ANEXO WHERE NR_PROCESSO = "'        + vInsereProcesso + '"');
        ExecSQL;
        SQL.Clear;
        SQL.Add('DELETE TRE_ANEXO_FABRIC WHERE NR_PROCESSO = "' + vInsereProcesso + '"');
        ExecSQL;

        //processa os registros restantes do arquivo texto
        for l := 0 to Pred(Linhas.Count)-2 do begin
          str_linha:=linhas.Strings[l];
          colunas.Clear;
          ExtractStrings( [','], [' '], PChar(str_linha), Colunas );
          Colunas.Text:=StringReplace(Colunas.text,'"','',[rfReplaceAll] );

          str_registro:=Colunas.Strings[0];

          if str_registro='24' then
          begin //RE CAPA
             SQL.Clear;
             SQL.add(' INSERT INTO TRE_CAPA ( ');
             SQL.add('NR_PROCESSO,CD_EXPORTADOR,CD_ENQUAD1,CD_ENQUAD2,CD_ENQUAD3,CD_ENQUAD4,CD_ENQUAD5,CD_ENQUAD6,');
             SQL.add('NR_REG_VENDA,NR_REG_CREDITO,DT_LIMITE_OPERACAO,PC_MARGEM_NAO_SACADA,');
             SQL.add('CD_URF_DESPACHO,CD_URF_EMBARQUE,CD_IMPORTADOR,CD_PAIS_FINAL,CD_INST_NEGO,');
             SQL.add('CD_INCOTERM,CD_MODALIDADE_TRANS,CD_MOEDA,VL_PAGTO_ANTEC,VL_PAGT_VISTA,');
             SQL.add('VL_PARCELA,NR_PARCELAS,VL_ESQUE_PG_TOTAL,NR_PERIODICIDADE,TP_INDICADOR,VL_CONSIGN,VL_SEM_COB_CAMBIAL,');
             SQL.add('CD_PAIS_IMPORTADOR,NR_RE_VINCULADA,NR_DI_VINCULADA,VL_FRETE_TOTAL,VL_SEGURO_TOTAL,');
             SQL.add('VL_FINANC_RC,VL_TOTAL_COND_VENDA_ACUM,VL_TOTAL_LOCAL_VENDA_ACUM,PESO_LIQUIDO_TOTAL,VL_PESO_NBM_INCLUIDAS,VL_VALOR_NBM_INCLUIDAS,');
             SQL.add('NR_PROCESSO_COMPLEMENTO,NR_OUTRA_REF, TX_END_IMPORTADOR, DT_DATA_RE, IN_NOVOEX ) ');
             SQL.add(' VALUES ( ');
             SQL.add(':NR_PROCESSO,:CD_EXPORTADOR,:CD_ENQUAD1,:CD_ENQUAD2,:CD_ENQUAD3,:CD_ENQUAD4,:CD_ENQUAD5,:CD_ENQUAD6,');
             SQL.add(':NR_REG_VENDA,:NR_REG_CREDITO,:DT_LIMITE_OPERACAO,:PC_MARGEM_NAO_SACADA,');
             SQL.add(':CD_URF_DESPACHO,:CD_URF_EMBARQUE,:CD_IMPORTADOR,:CD_PAIS_FINAL,:CD_INST_NEGO,');
             SQL.add(':CD_INCOTERM,:CD_MODALIDADE_TRANS,:CD_MOEDA,:VL_PAGTO_ANTEC,:VL_PAGT_VISTA,');
             SQL.add(':VL_PARCELA,:NR_PARCELAS,:VL_ESQUE_PG_TOTAL,:NR_PERIODICIDADE,:TP_INDICADOR,:VL_CONSIGN,:VL_SEM_COB_CAMBIAL,');
             SQL.add(':CD_PAIS_IMPORTADOR,:NR_RE_VINCULADA,:NR_DI_VINCULADA,:VL_FRETE_TOTAL,:VL_SEGURO_TOTAL,');
             SQL.add(':VL_FINANC_RC,:VL_TOTAL_COND_VENDA_ACUM,:VL_TOTAL_LOCAL_VENDA_ACUM,:PESO_LIQUIDO_TOTAL,:VL_PESO_NBM_INCLUIDAS,:VL_VALOR_NBM_INCLUIDAS,');
             SQL.add(':NR_PROCESSO_COMPLEMENTO,:NR_OUTRA_REF, :TX_END_IMPORTADOR, :DT_DATA_RE, 0 )');
             paramByName('NR_PROCESSO').AsString              :=vInsereProcesso;
             paramByName('CD_EXPORTADOR').AsString            :=flag_CD_EXPORTADOR;
             paramByName('NR_OUTRA_REF').AsString             :=Colunas.Strings[1];
             paramByName('CD_ENQUAD1').AsString               :=Colunas.Strings[6];
             paramByName('CD_ENQUAD2').AsString               :=Colunas.Strings[7];
             paramByName('CD_ENQUAD3').AsString               :=Colunas.Strings[8];
             paramByName('CD_ENQUAD4').AsString               :=Colunas.Strings[9];
             paramByName('CD_ENQUAD5').AsString               :=Colunas.Strings[10];
             paramByName('CD_ENQUAD6').AsString               :=Colunas.Strings[11];
             paramByName('NR_REG_VENDA').AsString             :=Colunas.Strings[12];
             paramByName('NR_REG_CREDITO').AsString           :=Colunas.Strings[14];
             if copy(Colunas.Strings[15],1,2)='00' then
               flag_DT_LIMITE_OPERACAO:=Null
            else
               flag_DT_LIMITE_OPERACAO:=copy(Colunas.Strings[15],7,4)+'/'+copy(Colunas.Strings[15],4,2)+'/'+copy(Colunas.Strings[15],1,2);

             paramByName('DT_LIMITE_OPERACAO').DataType       :=ftDateTime;
             paramByName('DT_LIMITE_OPERACAO').Value          :=flag_DT_LIMITE_OPERACAO;
             paramByName('PC_MARGEM_NAO_SACADA').AsString     :=Colunas.Strings[16];
             paramByName('CD_URF_DESPACHO').AsString          :=Colunas.Strings[17];
             paramByName('CD_URF_EMBARQUE').AsString          :=Colunas.Strings[18];
             paramByName('CD_IMPORTADOR').AsString            :=flag_CD_IMPORTADOR;
             paramByName('CD_PAIS_FINAL').AsString            :=Colunas.Strings[20];
             paramByName('CD_INST_NEGO').AsString             :=Colunas.Strings[21];
             paramByName('CD_INCOTERM').AsString              :=Colunas.Strings[22];
             paramByName('CD_MODALIDADE_TRANS').AsString      :=Colunas.Strings[25];
             paramByName('CD_MOEDA').AsString                 :=Colunas.Strings[26];
             paramByName('VL_PAGTO_ANTEC').AsString           :=Colunas.Strings[27];
             paramByName('VL_PAGT_VISTA').AsString            :=Colunas.Strings[28];
             paramByName('VL_PARCELA').AsString               :=Colunas.Strings[29];
             paramByName('VL_VALOR_NBM_INCLUIDAS').AsString   :=Colunas.Strings[29];
             paramByName('VL_ESQUE_PG_TOTAL').AsString        :=Colunas.Strings[29];
             paramByName('NR_PARCELAS').AsString              :=Colunas.Strings[30];
             paramByName('NR_PERIODICIDADE').AsString         :=Colunas.Strings[31];
             paramByName('TP_INDICADOR').AsString             :=Colunas.Strings[32];
             paramByName('VL_CONSIGN').AsString               :=Colunas.Strings[33];
             paramByName('VL_SEM_COB_CAMBIAL').AsString       :=Colunas.Strings[34];
             paramByName('CD_PAIS_IMPORTADOR').AsString       :=Colunas.Strings[38];
             paramByName('NR_RE_VINCULADA').AsString          :=Colunas.Strings[41];
             paramByName('NR_DI_VINCULADA').AsString          :=Colunas.Strings[42];
             paramByName('VL_FRETE_TOTAL').AsString           :=Colunas.Strings[47];
             paramByName('VL_SEGURO_TOTAL').AsString          :=Colunas.Strings[48];
             paramByName('VL_FINANC_RC').AsString             :=Colunas.Strings[50];
             paramByName('VL_TOTAL_COND_VENDA_ACUM').AsString :=Colunas.Strings[51];
             paramByName('VL_TOTAL_LOCAL_VENDA_ACUM').AsString:=Colunas.Strings[52];
             paramByName('PESO_LIQUIDO_TOTAL').AsString       :=Colunas.Strings[53];
             paramByName('VL_PESO_NBM_INCLUIDAS').AsString    :=Colunas.Strings[54];
             paramByName('NR_PROCESSO_COMPLEMENTO').AsString  :=gNR_PROCESSO_COMPLEMENTO;
             paramByName('TX_END_IMPORTADOR').AsString        :=flag_TX_END_IMPORTADOR;
             paramByName('DT_DATA_RE').AsDateTime             :=flag_DATA_ABERTURA;
             execSQL;
          end;

          if str_registro='25' then
          begin //RE ANEXO
             flag_CD_RE_ANEXO_FABRIC:=0;
             if copy(Colunas.Strings[2],1,2)='00' then
               flag_DT_VALIDADE_EMBARQUE:= NULL
             else
               flag_DT_VALIDADE_EMBARQUE:=copy(Colunas.Strings[2],7,4)+'/'+copy(Colunas.Strings[2],4,2)+'/'+copy(Colunas.Strings[2],1,2);

             flag_cd_unid_medida   :=dePara_RE('01','02','29',trim(Colunas.Strings[12]));
             if flag_cd_unid_medida='' then begin
                showmessage('A Unidade de Medida "'+Colunas.Strings[12]+'" não foi encontrado em nosso sistema, '+#13+
                            'será necessario re-integrar novamente após o acerto do DE PARA');
                exit;
             end;

             //naladi                             //ncm
             if copy(Colunas.Strings[5],1,6)  <>  copy(Colunas.Strings[7],1,6) then
                str_erro_ncm:=str_erro_ncm+'"'+copy(Colunas.Strings[3],1,3)+'"  ';


             SQL.Clear;
             SQL.add(' INSERT INTO TRE_ANEXO ( ');
             SQL.add('NR_PROCESSO,DT_VALIDADE_EMBARQUE,CD_RE_ANEXO,CD_NBM,CD_NALADI,CD_NCM,CD_SULF_NCM,TX_CATEGORIA_TEXTIL,');
             SQL.add('CD_UF_PRODUTOR,PESO_LIQUIDO,QT_UNIDADE_COMERCIAL,CD_UNID_MEDIDA,');
             SQL.add('QT_MEDIA_NBM,VL_COND_VENDA,VL_LOCAL_VENDA,PC_COMISSAO,VL_COM_AG_EFET,');
             SQL.add('CD_FORMA_PGTO,CD_FINALIDADE,TX_DESC_MERCADORIA,IN_OBS_EXPORTADOR,IN_EXPORTADOR_FABRICANTE,TX_OBSERVACAO_EXPORTADOR,');
             SQL.add('NR_PROCESSO_COMPLEMENTO )');
             SQL.add(' VALUES ( ');
             SQL.add(':NR_PROCESSO,:DT_VALIDADE_EMBARQUE,:CD_RE_ANEXO,:CD_NBM,:CD_NALADI,:CD_NCM,:CD_SULF_NCM,:TX_CATEGORIA_TEXTIL,');
             SQL.add(':CD_UF_PRODUTOR,:PESO_LIQUIDO,:QT_UNIDADE_COMERCIAL,:CD_UNID_MEDIDA,');
             SQL.add(':QT_MEDIA_NBM,:VL_COND_VENDA,:VL_LOCAL_VENDA,:PC_COMISSAO,:VL_COM_AG_EFET,');
             SQL.add(':CD_FORMA_PGTO,:CD_FINALIDADE,:TX_DESC_MERCADORIA,:IN_OBS_EXPORTADOR,:IN_EXPORTADOR_FABRICANTE,:TX_OBSERVACAO_EXPORTADOR,');
             SQL.add(':NR_PROCESSO_COMPLEMENTO )');
             paramByName('NR_PROCESSO').AsString              :=vInsereProcesso;
             paramByName('DT_VALIDADE_EMBARQUE').DataType     :=ftDateTime;
             paramByName('DT_VALIDADE_EMBARQUE').value        :=flag_DT_VALIDADE_EMBARQUE;
             paramByName('CD_RE_ANEXO').AsInteger             :=strToInt(copy(Colunas.Strings[3],1,3));
             paramByName('CD_NBM').AsString                   :=Colunas.Strings[4];
             paramByName('CD_NALADI').AsString                :=Colunas.Strings[5];
             paramByName('CD_NCM').AsString                   :=copy(Colunas.Strings[7],1,8);
             paramByName('CD_SULF_NCM').AsString              :=copy(Colunas.Strings[7],9,2);
             paramByName('TX_CATEGORIA_TEXTIL').AsString      :=Colunas.Strings[8];
             paramByName('CD_UF_PRODUTOR').AsString           :=Colunas.Strings[9];
             paramByName('PESO_LIQUIDO').AsString             :=Colunas.Strings[10];
             paramByName('QT_UNIDADE_COMERCIAL').AsString     :=Colunas.Strings[11];

             paramByName('CD_UNID_MEDIDA').AsString           :=flag_cd_unid_medida;

             paramByName('QT_MEDIA_NBM').AsString             :=Colunas.Strings[13];
             paramByName('VL_COND_VENDA').AsString            :=Colunas.Strings[14];
             paramByName('VL_LOCAL_VENDA').AsString           :=Colunas.Strings[15];
             paramByName('PC_COMISSAO').AsString              :=Colunas.Strings[16];
             paramByName('VL_COM_AG_EFET').AsString           :=Colunas.Strings[17];
             paramByName('CD_FORMA_PGTO').AsString            :=Colunas.Strings[18];
             paramByName('CD_FINALIDADE').AsString            :=Colunas.Strings[19];
             flag_TX_DESC_MERCADORIA:='';
             if trim(Colunas.Strings[20])<>'' then
               flag_TX_DESC_MERCADORIA:=flag_TX_DESC_MERCADORIA+trim(Colunas.Strings[20])+' |';
             if trim(Colunas.Strings[21])<>'' then
               flag_TX_DESC_MERCADORIA:=flag_TX_DESC_MERCADORIA+trim(Colunas.Strings[21])+' |';
             if trim(Colunas.Strings[22])<>'' then
               flag_TX_DESC_MERCADORIA:=flag_TX_DESC_MERCADORIA+trim(Colunas.Strings[22])+' |';
             if trim(Colunas.Strings[23])<>'' then
               flag_TX_DESC_MERCADORIA:=flag_TX_DESC_MERCADORIA+trim(Colunas.Strings[23])+' |';
             if trim(Colunas.Strings[24])<>'' then
               flag_TX_DESC_MERCADORIA:=flag_TX_DESC_MERCADORIA+trim(Colunas.Strings[24])+' |';
             if trim(Colunas.Strings[25])<>'' then
               flag_TX_DESC_MERCADORIA:=flag_TX_DESC_MERCADORIA+trim(Colunas.Strings[25])+' |';
             if trim(Colunas.Strings[26])<>'' then
               flag_TX_DESC_MERCADORIA:=flag_TX_DESC_MERCADORIA+trim(Colunas.Strings[26])+' |';
             if trim(Colunas.Strings[27])<>'' then
               flag_TX_DESC_MERCADORIA:=flag_TX_DESC_MERCADORIA+trim(Colunas.Strings[27])+' |';
             if trim(Colunas.Strings[28])<>'' then
               flag_TX_DESC_MERCADORIA:=flag_TX_DESC_MERCADORIA+trim(Colunas.Strings[28])+' |';
             if trim(Colunas.Strings[29])<>'' then
               flag_TX_DESC_MERCADORIA:=flag_TX_DESC_MERCADORIA+trim(Colunas.Strings[29])+' |';

             flag_TX_DESC_MERCADORIA:=copy(flag_TX_DESC_MERCADORIA,1,length(flag_TX_DESC_MERCADORIA)-1);

             paramByName('TX_DESC_MERCADORIA').AsMemo       :=flag_TX_DESC_MERCADORIA;

             flag_IN_OBS_EXPORTADOR:='';
             if Colunas.Strings[31]='S' then
                flag_IN_OBS_EXPORTADOR:='1';

             if Colunas.Strings[31]='N' then
                flag_IN_OBS_EXPORTADOR:='0';

             paramByName('IN_OBS_EXPORTADOR').AsString        :=flag_IN_OBS_EXPORTADOR;

             flag_IN_EXPORTADOR_FABRICANTE:='';
             if Colunas.Strings[32]='S' then
                flag_IN_EXPORTADOR_FABRICANTE:='1';

             if Colunas.Strings[32]='N' then
                flag_IN_EXPORTADOR_FABRICANTE:='2';

             paramByName('IN_EXPORTADOR_FABRICANTE').AsString :=flag_IN_EXPORTADOR_FABRICANTE;

             flag_TX_OBSERVACAO_EXPORTADOR:='';
             if trim(Colunas.Strings[36])<>'' then
                flag_TX_OBSERVACAO_EXPORTADOR:=flag_TX_OBSERVACAO_EXPORTADOR+trim(Colunas.Strings[36])+' |';
             if trim(Colunas.Strings[37])<>'' then
                flag_TX_OBSERVACAO_EXPORTADOR:=flag_TX_OBSERVACAO_EXPORTADOR+trim(Colunas.Strings[37])+' |';
             if trim(Colunas.Strings[38])<>'' then
                flag_TX_OBSERVACAO_EXPORTADOR:=flag_TX_OBSERVACAO_EXPORTADOR+trim(Colunas.Strings[38])+' |';
             if trim(Colunas.Strings[39])<>'' then
                flag_TX_OBSERVACAO_EXPORTADOR:=flag_TX_OBSERVACAO_EXPORTADOR+trim(Colunas.Strings[39])+' |';
             if trim(Colunas.Strings[40])<>'' then
                flag_TX_OBSERVACAO_EXPORTADOR:=flag_TX_OBSERVACAO_EXPORTADOR+trim(Colunas.Strings[40])+' |';
             if trim(Colunas.Strings[41])<>'' then
                flag_TX_OBSERVACAO_EXPORTADOR:=flag_TX_OBSERVACAO_EXPORTADOR+trim(Colunas.Strings[41])+' |';
             if trim(Colunas.Strings[42])<>'' then
                flag_TX_OBSERVACAO_EXPORTADOR:=flag_TX_OBSERVACAO_EXPORTADOR+trim(Colunas.Strings[42])+' |';
             if trim(Colunas.Strings[43])<>'' then
                flag_TX_OBSERVACAO_EXPORTADOR:=flag_TX_OBSERVACAO_EXPORTADOR+trim(Colunas.Strings[43])+' |';
             if trim(Colunas.Strings[44])<>'' then
                flag_TX_OBSERVACAO_EXPORTADOR:=flag_TX_OBSERVACAO_EXPORTADOR+trim(Colunas.Strings[44])+' |';
             if trim(Colunas.Strings[45])<>'' then
                flag_TX_OBSERVACAO_EXPORTADOR:=flag_TX_OBSERVACAO_EXPORTADOR+trim(Colunas.Strings[45])+' |';


             flag_TX_OBSERVACAO_EXPORTADOR:=copy(flag_TX_OBSERVACAO_EXPORTADOR,1,length(flag_TX_OBSERVACAO_EXPORTADOR)-1);

             paramByName('TX_OBSERVACAO_EXPORTADOR').AsMemo   := flag_TX_OBSERVACAO_EXPORTADOR;
             paramByName('NR_PROCESSO_COMPLEMENTO').AsString  := gNR_PROCESSO_COMPLEMENTO;
             execSQL;


          end;

          if (str_registro='26') and (flag_IN_EXPORTADOR_FABRICANTE<>'1')  then
          begin //RE ANEXO FABRICANTE
             x:=5;
             while x<=59 do
             begin
                if trim(Colunas.Strings[x])<>'' then begin //coluna que representa - CGC
                   //verifica se existe o fabricante
                   with TQuery.Create(nil) do begin
                     Databasename    := 'DBBROKER';
                     SQL.Clear;
                     SQL.Add('SELECT DISTINCT CD_EMPRESA FROM TEMPRESA_NAC (NOLOCK) WHERE CGC_EMPRESA="'+trim(colunas.Strings[x]) +'"');
                     open;
                     flag_CD_FABRICANTE:=Fields[0].AsString;
                     close;
                     free;
                   end;

                   if flag_CD_FABRICANTE='' then begin
                      Showmessage('Fabricante CNPJ: '+trim(colunas.Strings[x])+' não Cadastrado, integração não efetuada !!!');
                      exit;
                   end;
                   //auto_incrementa
                   flag_CD_RE_ANEXO_FABRIC:=flag_CD_RE_ANEXO_FABRIC+1;
                   //
                   SQL.Clear;
                   SQL.add(' INSERT INTO TRE_ANEXO_FABRIC ( ');
                   SQL.add('NR_PROCESSO,CD_RE_ANEXO,CD_RE_ANEXO_FABRIC,CD_FABRICANTE,');
                   SQL.add('NR_ATO,QT_MERCADORIA,VL_TOTAL, ');
                   SQL.add('NR_PROCESSO_COMPLEMENTO )');
                   SQL.add(' VALUES ( ');
                   SQL.add(':NR_PROCESSO,:CD_RE_ANEXO,:CD_RE_ANEXO_FABRIC,:CD_FABRICANTE,');
                   SQL.add(':NR_ATO,:QT_MERCADORIA,:VL_TOTAL,');
                   SQL.add(':NR_PROCESSO_COMPLEMENTO )');
                   paramByName('NR_PROCESSO').AsString             :=vInsereProcesso;
                   paramByName('CD_RE_ANEXO').AsInteger            :=strToInt(Colunas.Strings[3]);
                   paramByName('NR_PROCESSO_COMPLEMENTO').AsString :=gNR_PROCESSO_COMPLEMENTO;
                   paramByName('CD_RE_ANEXO_FABRIC').AsInteger     :=flag_CD_RE_ANEXO_FABRIC;
                   //colunas
                   paramByName('CD_FABRICANTE').AsString           :=flag_CD_FABRICANTE;
                   paramByName('NR_ATO').AsString                  :=Colunas.Strings[x+3];
                   paramByName('QT_MERCADORIA').AsString           :=Colunas.Strings[x+4];
                   paramByName('VL_TOTAL').AsString                :=Colunas.Strings[x+5];
                   execSQL;
                end;
                x:=x+6;
             end;
          end;
        end;
        if str_erro_ncm<>'' then
        begin
           showmessage('NCM incompativel com NALADI - ANEXO(s): '+str_erro_ncm+#13+#13+' INTEGRAÇÃO CANCELADA!!!.');
           exit;
        end;


        if datm_main.db_broker.InTransaction then
        begin
           datm_main.db_broker.Commit;
           pnl_dat.Visible:=false;
           showmessage('RE Importada com Sucesso!!!!');
        end;
     end;

  finally
      if datm_main.db_broker.InTransaction then
         datm_main.db_broker.Rollback;

      FreeAndNil(Linhas);
      FreeAndNil(Colunas);

      //refresh e reposicionamento do registro
      datm_re_capa.qry_re_capa.Close;
      datm_re_capa.qry_re_capa.SQL.Text := datm_re_capa.GetSelQueryRE(frm_re_capa.edrQtRegistros.text);
      datm_re_capa.qry_re_capa.Open;
      datm_re_capa.qry_re_capa.Locate('NR_PROCESSO;NR_PROCESSO_COMPLEMENTO', VarArrayOf([vInsereProcesso, gNR_PROCESSO_COMPLEMENTO]), [loCaseInsensitive]);
  end;
end;

procedure Tfrm_re_capa.btnIntegraREClick(Sender: TObject);
begin
  pnl_dat.Visible:=True;
  edt_dat.SetFocus;
end;

procedure Tfrm_re_capa.pnl_datExit(Sender: TObject);
begin
  pnl_dat.Visible:=False;
end;

procedure Tfrm_re_capa.SpeedButton10Click(Sender: TObject);
begin
  if not AbreDat.Execute then
     exit;

  edt_dat.Text:=AbreDat.FileName;
end;

procedure Tfrm_re_capa.btnRetornoREClick(Sender: TObject);
var
vl_comissao:Double;
str_processo_cliente,str_nr_re,str_dt_re,str_linha,str_path:String;
Arq:TStringList;
begin
  arq:=TStringList.Create;
  arq.Clear;
  with TQuery.Create(nil) do
  begin
    Databasename := 'DBBROKER';
    SQL.Clear;
    SQL.Add(' select rc.NR_OUTRA_REF, convert(varchar,rc.DT_DATA,103) DT_DATA , rc.NR_RE_SISCOMEX ');
    SQL.Add(' from TRE_CAPA  rc (NOLOCK) ');
    SQL.Add(' join TEMPRESA_NAC e on e.cd_empresa=rc.cd_exportador ');
    SQL.Add(' where e.CD_GRUPO="986" and isnull(rc.nr_re_siscomex,"")<>"" and convert(varchar,dt_data,103)=convert(varchar,getdate(),103) ');
//    SQL.Add(' where e.CD_GRUPO="986" and rc.NR_PROCESSO In ("0102JA-0033-09","0102JA-0042-09","0102JA-0067-09" ) ');
    Open;
    First;
    while not eof do
    begin
      str_processo_cliente:=trim(FieldByName('NR_OUTRA_REF').AsString);
      vl_comissao:=0;
      str_nr_re           :=FieldByName('NR_RE_SISCOMEX').AsString;
      str_nr_re           :=StringReplace(str_nr_re,'/','',[rfReplaceAll] );
      str_nr_re           :=StringReplace(str_nr_re,'-','',[rfReplaceAll] );
      //
      str_dt_re :=copy(fieldByName('DT_DATA').AsString,1,2)+ //dia
                  copy(fieldByName('DT_DATA').AsString,4,2)+ //mes
                  copy(fieldByName('DT_DATA').AsString,7,4); //ano

      if str_dt_re='' then begin
        showmessage('Data do RE inexistente!');
        exit;
      end;
      str_linha := FStrSpace(str_processo_cliente,15)+str_nr_re+str_dt_re+fFloatToStr(vl_comissao,13,2);

      arq.Add(str_linha);

      next;
    end;
    free;
  end;
  if arq.Count<>0 then begin
    str_dt_re :=copy(str_dt_re,1,2)+'.'+ //dia
                copy(str_dt_re,3,2)+'.'+ //mes
                copy(str_dt_re,5,4); //ano


    str_path  := 'G:\EXPORT\JOHNSON & JOHNSON\RETORNO RE\Retorno_RE_'+str_dt_re+'.TXT';
    arq.SaveToFile(str_path);
    ShowMessage('Arquivo Retorno Salvo com Sucesso em ( '+str_path+' ) !');
  end else     ShowMessage('Não constam REs Registrados Hoje !');
  FreeAndNil(arq);

end;

procedure Tfrm_re_capa.ck_ult_procClick(Sender: TObject);
begin
  msk_cd_produtoExit(nil);
end;

function Tfrm_re_capa.DePara_RE(pUnidade,pProduto,pTabela,pCodigoExterno : string) : string;
begin
  with TQuery.Create(Application) do
  begin
    DataBaseName := 'DBBROKER';
    SQL.Add('SELECT CD_DDBROKER FROM TDE_PARA (NOLOCK) WHERE CD_EXTERNO = "' + pCodigoExterno + '"');
    SQL.Add('AND CD_TABELA = '''+ptabela+''' AND CD_UNID_NEG = '''+pUnidade+''' AND CD_PRODUTO = '''+pProduto+'''');
    Open;
    Result := Fields[0].Asstring;
    Free;
  end;
end;



procedure Tfrm_re_capa.btn_OBS_EXPORTADORClick(Sender: TObject);
var
linhas:TStringList;
i:Integer;
str_filtro:String;
begin
  if Sender is TSpeedButton then
   begin
    str_filtro  := 'CD_PRODUTO="'+msk_cd_produto.Text+'"';  //'1=1';
    linhas      := TStringList.Create;
    linhas.Text := ConsultaLookUp('TOBSERVACOES','CD_OBS', ConsultaOnlineExFiltro('TOBSERVACOES','Observações - '+edt_nm_produto.Text, ['CD_OBS', 'TX_DESCRICAO'],['Código','Descrição'],'CD_OBS',str_filtro,nil),'TX_OBS') + linhas.Text;
    linhas.text := StringReplace(linhas.text,'|','',[rfReplaceAll] );

    for i:=0 to linhas.Count-1 do
    begin
       case i of
          0:edt_obsexport1.Text :=trim(linhas.Strings[i]);
          1:edt_obsexport2.Text :=trim(linhas.Strings[i]);
          2:edt_obsexport3.Text :=trim(linhas.Strings[i]);
          3:edt_obsexport4.Text :=trim(linhas.Strings[i]);
          4:edt_obsexport5.Text :=trim(linhas.Strings[i]);
          5:edt_obsexport6.Text :=trim(linhas.Strings[i]);
          6:edt_obsexport7.Text :=trim(linhas.Strings[i]);
          7:edt_obsexport8.Text :=trim(linhas.Strings[i]);
          8:edt_obsexport9.Text :=trim(linhas.Strings[i]);
          9:edt_obsexport10.Text:=trim(linhas.Strings[i]);
       end;

    end;
  end;

end;

procedure Tfrm_re_capa.SpeedButton11Click(Sender: TObject);
begin
  pnlObsExport.Visible := False;
end;

procedure Tfrm_re_capa.edt_anexoExit(Sender: TObject);
var
vAnexo:String;
begin
  {by Carlos - 16/03/2010}
  if edt_anexo.Text='' then exit;

  if (strToInt(edt_anexo.Text)>strToInt(lblQtTotalAnexos.Caption)) or
     (strToInt(edt_anexo.Text)=0) then begin
     ShowMessage('Anexo Inexistente!!!');
     edt_anexo.SetFocus;
     abort;
  end;
  vAnexo := IntToStr(strToInt( edt_anexo.Text ));
  datm_re_capa.qry_re_anexo.Locate('CD_RE_ANEXO', vAnexo, []);
  edt_anexo.Visible:=False;
end;

procedure Tfrm_re_capa.edt_anexoKeyPress(Sender: TObject; var Key: Char);
begin
  {by Carlos - 16/03/2010}
  if not(Key in ['0'..'9',#8,#13,#27]) then begin
     ShowMessage('Digite Somente Numeros');
     abort;
  end;
  if Key in [#13] then
    edt_anexoExit(sender);

end;

procedure Tfrm_re_capa.dbAnexoClick(Sender: TObject);
begin
  {by Carlos - 16/03/2010}
  edt_anexo.Visible := True;
  edt_anexo.Text    :=  datm_re_capa.qry_re_anexoCD_RE_ANEXO.AsString;
  edt_anexo.SelectAll;
  edt_anexo.SetFocus;
end;

procedure Tfrm_re_capa.dbedt_cd_sulf_ncmExit(Sender: TObject);
begin
  {by Carlos - 23/07/2010 - acerta para o usuario não consiga limpar esse campo }
  if not (datm_re_capa.qry_re_anexo.State in [dsEdit,dsInsert]) then exit;

  datm_re_capa.qry_re_anexoCD_SULF_NCM.AsString:=Copy('00', 1, 2 - Length( dbedt_cd_sulf_ncm.Text )) +  dbedt_cd_sulf_ncm.Text;

end;

procedure Tfrm_re_capa.btnConfirmaIntegraREItensClick(Sender: TObject);
var
  Linhas, Colunas: TStringList;
  l, x, I: Integer;
  str_linha, str_registro, str_coluna, vInsereProcesso, gNR_PROCESSO_COMPLEMENTO, str_erro_ncm, str_anexo,
  str_enquadramento, str_valor_sem_cobertura: String;
  flag_IN_OBS_EXPORTADOR, flag_IN_EXPORTADOR_FABRICANTE, flag_TX_OBSERVACAO_EXPORTADOR, flag_TX_DESC_MERCADORIA: String;
  flag_CD_EXPORTADOR, flag_CD_IMPORTADOR, flag_TX_END_IMPORTADOR: String;
  flag_DT_LIMITE_OPERACAO, flag_DT_VALIDADE_EMBARQUE, flag_CD_RE_ANEXO_FABRIC, flag_CD_FABRICANTE, flag_cd_unid_medida: Variant;
  flag_Data_Abertura: TDateTime;
  dbl_valor_sem_cobertura_total, dbl_valor_sem_cobertura_anexo, dbl_valor_sem_cobertura_sobra: Double;
  qtd_anexos: Integer;
begin
  if not fileexists(edt_dat.Text) then
  begin
    ShowMessage('Arquivo não Encontrado!!!');
    Exit;
  end;
  if CompareText(ExtractFileExt(edt_dat.Text), '.dat') <> 0 then
  begin
    ShowMessage('Extensão de Arquivo Inválida!!!');
    Exit;
  end;

  gNR_PROCESSO_COMPLEMENTO := datm_re_capa.qry_re_capaNR_PROCESSO_COMPLEMENTO.AsString;
  vInsereProcesso          := datm_re_capa.qry_re_capaNR_PROCESSO.AsString;
  //
  Linhas  := TStringList.Create;
  Colunas := TStringList.Create;

  try
    linhas.LoadFromFile(edt_dat.Text);

    //verifca se IMPORTADOR e EXPORTADOR já estão cadastrados no BROKER
    for l := Pred(Linhas.Count)-1 to Pred(Linhas.Count) do
    begin
      str_linha:=linhas.Strings[l];
      colunas.Clear;
      ExtractStrings([','], [' '], PChar(str_linha), Colunas);

      colunas.text:= StringReplace(Colunas.text, '"', '', [rfReplaceAll]);
      str_registro:= Colunas.Strings[0];

      if str_registro = 'IM' then  //EMPRESA ESTRANGEIRA
      begin
        flag_CD_IMPORTADOR := ConsultaLookUPSQL('SELECT DISTINCT CD_EMPRESA FROM TEMPRESA_EST (NOLOCK) WHERE NR_CLIENTE="'+colunas.Strings[1]+'"', 'CD_EMPRESA');

        //se não existir o importador , cadastra-lo nesse momento
        if flag_CD_IMPORTADOR = '' then
        begin
          with TQuery.Create(nil) do
          begin
            Databasename := 'DBBROKER';
            //Busca o Ultimo Codigo para a empresa Estrangeira
            SQL.Clear;
            SQL.Add('SELECT MAX(cd_empresa) FROM TEMPRESA_EST  (NOLOCK)' );
            Open;
            flag_CD_IMPORTADOR := StrZero(Fields[0].AsInteger+1,5);
            Close;
            //
            SQL.Clear;
            SQL.Add('INSERT INTO TEMPRESA_EST (CD_EMPRESA,AP_EMPRESA,NM_EMPRESA,NM_CONTATO,NR_TELEFONE,END_EMPRESA,NR_CLIENTE ) ' );
            SQL.Add(' VALUES ');
            SQL.Add('( :CD_EMPRESA ,:AP_EMPRESA,:NM_EMPRESA,:NM_CONTATO,:NR_TELEFONE,:END_EMPRESA,:NR_CLIENTE ) ' );
            ParamByName('CD_EMPRESA').AsString :=flag_CD_IMPORTADOR;
            ParamByName('NR_CLIENTE').AsString :=Colunas.Strings[1];
            ParamByName('AP_EMPRESA').AsString :=Colunas.Strings[2];
            ParamByName('NM_EMPRESA').AsString :=Colunas.Strings[3];
            ParamByName('NM_CONTATO').AsString :=Colunas.Strings[6];
            ParamByName('NR_TELEFONE').AsString:=Colunas.Strings[7];
            ParamByName('END_EMPRESA').AsString:=Colunas.Strings[8];
            ExecSQL;
            //inclui o GRUPO 986
            SQL.Clear;
            SQL.Add('INSERT INTO TEMPRESA_EST_GRUPO (CD_EMPRESA,CD_GRUPO ) ' );
            SQL.Add(' VALUES ');
            SQL.Add('( :CD_EMPRESA ,:CD_GRUPO ) ' );
            ParamByName('CD_EMPRESA').AsString :=flag_CD_IMPORTADOR;
            ParamByName('CD_GRUPO').AsString   :='986';
            ExecSQL;
            Free;
          end;
        end;
        flag_TX_END_IMPORTADOR:=Colunas.Strings[8];
      end;

      if str_registro='EX' then  //EMPRESA NACIONAL
      begin 
        flag_CD_EXPORTADOR := ConsultaLookUPSQL('SELECT DISTINCT CD_EMPRESA FROM TEMPRESA_NAC (NOLOCK) WHERE CGC_EMPRESA="'+colunas.Strings[6] +'"', 'CD_EMPRESA');
      end;
    end;

    if flag_CD_EXPORTADOR='' then
    begin
      ShowMessage('O Exportador não está cadastrado no Sistema, integração não efetuada!!');
      Exit;
    end;

    if flag_CD_EXPORTADOR<>datm_re_capa.qry_re_capaCD_EXPORTADOR.AsString then
    begin
      ShowMessage('O Exportador não é compativel com o processo posicionado, integração não efetuada !!');
      Exit;
    end;

{    liberando este comentario os anexos serão excluidos por aqui mesmo
     if datm_re_capa.qry_re_anexo.RecordCount>0 then
       if MessageDlg('Já Existe um ou mais Anexo(s) Cadastrado(s).'+#13+'DESEJA APAGAR TUDO E RE-INTEGRAR NOVAMENTE ?', mtConfirmation, [mbYes, mbNo], 0) = mrNO then
          exit;
}
    if datm_re_capa.qry_re_anexo.RecordCount > 0 then
    begin
      ShowMessage('Já Existe um ou mais Anexo(s) Cadastrado(s), INTEGRAÇÃO CANCELADA !!!'+#13+#13+'  Elimine os Anexos cadastrados e tente Integrar novamente.');
      Exit;
    end;

    str_erro_ncm:='';
    with TQuery.Create(nil) do
    begin
      datm_main.db_broker.StartTransaction;
      Databasename    := 'DBBROKER';

      //guarda a data da Abertura da RE
      SQL.Clear;
      SQL.Add('select isNull(dt_data_re,getdate()) FROM TRE_CAPA (NOLOCK) WHERE NR_PROCESSO = "' + vInsereProcesso + '"');
      Open;
      flag_Data_Abertura := fields[0].AsDateTime;
      Close;

      //apaga processo de RE caso Exista
      SQL.Clear;
      SQL.Add('DELETE TRE_CAPA WHERE NR_PROCESSO = "'         + vInsereProcesso + '"');
      ExecSQL;
      SQL.Clear;
      SQL.Add('DELETE TRE_ANEXO WHERE NR_PROCESSO = "'        + vInsereProcesso + '"');
      ExecSQL;
      SQL.Clear;
      SQL.Add('DELETE TRE_ANEXO_FABRIC WHERE NR_PROCESSO = "' + vInsereProcesso + '"');
      ExecSQL;
      // Michel
      SQL.Clear;
      SQL.Add('DELETE TRE_ANEXO_PURO WHERE NR_PROCESSO = "' + vInsereProcesso + '"');
      ExecSQL;

      //processa os registros restantes do arquivo texto
      for l := 0 to Pred(Linhas.Count)-2 do
      begin
        str_linha := linhas.Strings[l];
        colunas.Clear;
        ExtractStrings([','], [' '], PChar(str_linha), Colunas);
        Colunas.Text := StringReplace(Colunas.text, '"', '', [rfReplaceAll]);

        str_registro := Colunas.Strings[0];

        if str_registro='24' then  //RE CAPA
        begin
          str_enquadramento := Trim(Colunas[6]);

          str_valor_sem_cobertura := '0';
          if (str_enquadramento = '81101') and
             InputQuery('Valor Sem Cobertura Cambial para Drawback', 'Digite o valor sem ponto, utilizando apenas vírgula como separador decimal', str_valor_sem_cobertura) then  //RE ANEXO PURO
          begin
            if TryStrToFloat(str_valor_sem_cobertura, dbl_valor_sem_cobertura_total) then
            begin
              str_anexo := ConsultaLookUPSQL(' SELECT MAX(ID_ANEXO) AS ID_ANEXO ' +
                                             ' FROM TRE_ANEXO_PURO (NOLOCK) ' +
                                             ' WHERE NR_PROCESSO = ''' + vInsereProcesso + ''' ' +
                                             '   AND NR_PROCESSO_COMPLEMENTO = ''' + gNR_PROCESSO_COMPLEMENTO + '''', 'ID_ANEXO');

              FastExecSQL(' UPDATE TRE_CAPA ' +
                          ' SET VL_SEM_COB_CAMBIAL = ' + StringReplace(str_valor_sem_cobertura, ',', '.', [rfReplaceAll]) +
                          ' WHERE NR_PROCESSO = ''' + vInsereProcesso + ''' ' +
                          '   AND NR_PROCESSO_COMPLEMENTO = ''' + gNR_PROCESSO_COMPLEMENTO + ''' ');
            end
            else
            begin
              ShowMessage('Valor "' + str_valor_sem_cobertura + '" inválido.');
              Exit;
            end;
          end;

          SQL.Clear;
          SQL.add('INSERT INTO TRE_CAPA (NR_PROCESSO, CD_EXPORTADOR, CD_ENQUAD1, CD_ENQUAD2, CD_ENQUAD3, CD_ENQUAD4, CD_ENQUAD5, CD_ENQUAD6,');
          SQL.add('                      NR_REG_VENDA, NR_REG_CREDITO, DT_LIMITE_OPERACAO, PC_MARGEM_NAO_SACADA,');
          SQL.add('                      CD_URF_DESPACHO, CD_URF_EMBARQUE, CD_IMPORTADOR, CD_PAIS_FINAL, CD_INST_NEGO,');
          SQL.add('                      CD_INCOTERM, CD_MODALIDADE_TRANS, CD_MOEDA, VL_PAGTO_ANTEC, VL_PAGT_VISTA,');
          SQL.add('                      VL_PARCELA, NR_PARCELAS, VL_ESQUE_PG_TOTAL, NR_PERIODICIDADE, VL_CONSIGN, VL_SEM_COB_CAMBIAL,');
          SQL.add('                      CD_PAIS_IMPORTADOR, NR_RE_VINCULADA, NR_DI_VINCULADA, VL_FRETE_TOTAL, VL_SEGURO_TOTAL,');
          SQL.add('                      VL_FINANC_RC, VL_TOTAL_COND_VENDA_ACUM, VL_TOTAL_LOCAL_VENDA_ACUM, PESO_LIQUIDO_TOTAL, VL_PESO_NBM_INCLUIDAS, VL_VALOR_NBM_INCLUIDAS,');
          SQL.add('                      NR_PROCESSO_COMPLEMENTO, NR_OUTRA_REF, TX_END_IMPORTADOR, DT_DATA_RE, IN_NOVOEX)');
          SQL.add('VALUES (:NR_PROCESSO, :CD_EXPORTADOR, :CD_ENQUAD1, :CD_ENQUAD2, :CD_ENQUAD3, :CD_ENQUAD4, :CD_ENQUAD5, :CD_ENQUAD6,');
          SQL.add('        :NR_REG_VENDA, :NR_REG_CREDITO, :DT_LIMITE_OPERACAO, :PC_MARGEM_NAO_SACADA,');
          SQL.add('        :CD_URF_DESPACHO, :CD_URF_EMBARQUE, :CD_IMPORTADOR, :CD_PAIS_FINAL, :CD_INST_NEGO,');
          SQL.add('        :CD_INCOTERM, :CD_MODALIDADE_TRANS, :CD_MOEDA, :VL_PAGTO_ANTEC, :VL_PAGT_VISTA,');
          SQL.add('        :VL_PARCELA, :NR_PARCELAS, :VL_ESQUE_PG_TOTAL, :NR_PERIODICIDADE, :VL_CONSIGN, :VL_SEM_COB_CAMBIAL,');
          SQL.add('        :CD_PAIS_IMPORTADOR, :NR_RE_VINCULADA, :NR_DI_VINCULADA, :VL_FRETE_TOTAL, :VL_SEGURO_TOTAL,');
          SQL.add('        :VL_FINANC_RC, :VL_TOTAL_COND_VENDA_ACUM, :VL_TOTAL_LOCAL_VENDA_ACUM, :PESO_LIQUIDO_TOTAL, :VL_PESO_NBM_INCLUIDAS, :VL_VALOR_NBM_INCLUIDAS,');
          SQL.add('        :NR_PROCESSO_COMPLEMENTO, :NR_OUTRA_REF, :TX_END_IMPORTADOR, :DT_DATA_RE, 1)');
          paramByName('NR_PROCESSO').AsString              :=vInsereProcesso;
          paramByName('CD_EXPORTADOR').AsString            :=flag_CD_EXPORTADOR;
          paramByName('NR_OUTRA_REF').AsString             :=Colunas.Strings[1];
          paramByName('CD_ENQUAD1').AsString               :=Colunas.Strings[6];
          paramByName('CD_ENQUAD2').AsString               :=Colunas.Strings[7];
          paramByName('CD_ENQUAD3').AsString               :=Colunas.Strings[8];
          paramByName('CD_ENQUAD4').AsString               :=Colunas.Strings[9];
          paramByName('CD_ENQUAD5').AsString               :=Colunas.Strings[10];
          paramByName('CD_ENQUAD6').AsString               :=Colunas.Strings[11];
          paramByName('NR_REG_VENDA').AsString             :=Colunas.Strings[12];
          paramByName('NR_REG_CREDITO').AsString           :=Colunas.Strings[14];
          if copy(Colunas.Strings[15],1,2)='00' then
            flag_DT_LIMITE_OPERACAO := Null
          else
            flag_DT_LIMITE_OPERACAO := Copy(Colunas.Strings[15], 7, 4) + '/' + Copy(Colunas.Strings[15], 4, 2) + '/' + Copy(Colunas.Strings[15], 1, 2);

          paramByName('DT_LIMITE_OPERACAO').DataType       :=ftDateTime;
          paramByName('DT_LIMITE_OPERACAO').Value          :=flag_DT_LIMITE_OPERACAO;
          paramByName('PC_MARGEM_NAO_SACADA').AsString     :=Colunas.Strings[16];
          paramByName('CD_URF_DESPACHO').AsString          :=Colunas.Strings[17];
          paramByName('CD_URF_EMBARQUE').AsString          :=Colunas.Strings[18];
          paramByName('CD_IMPORTADOR').AsString            :=flag_CD_IMPORTADOR;
          paramByName('CD_PAIS_FINAL').AsString            :=Colunas.Strings[20];
          paramByName('CD_INST_NEGO').AsString             :=Colunas.Strings[21];
          paramByName('CD_INCOTERM').AsString              :=Colunas.Strings[22];
          paramByName('CD_MODALIDADE_TRANS').AsString      := StringReplace(Colunas.Strings[25], '0', '', [rfReplaceAll]); // 003 -> 3 - Este campo agora tem apenas 1 caractere - Michel
          paramByName('CD_MOEDA').AsString                 :=Colunas.Strings[26];
          paramByName('VL_PAGTO_ANTEC').AsString           :=Colunas.Strings[27];
          paramByName('VL_PAGT_VISTA').AsString            :=Colunas.Strings[28];
          paramByName('VL_PARCELA').AsString               :=Colunas.Strings[29];
          paramByName('VL_VALOR_NBM_INCLUIDAS').AsString   :=Colunas.Strings[29];
          paramByName('VL_ESQUE_PG_TOTAL').AsString        :=Colunas.Strings[29];
          paramByName('NR_PARCELAS').AsString              :=Colunas.Strings[30];
          paramByName('NR_PERIODICIDADE').AsString         :=Colunas.Strings[31];
          paramByName('VL_CONSIGN').AsString               :=Colunas.Strings[33];
          if dbl_valor_sem_cobertura_total = 0 then
            paramByName('VL_SEM_COB_CAMBIAL').AsString     := Colunas.Strings[34]
          else
            paramByName('VL_SEM_COB_CAMBIAL').AsFloat      := dbl_valor_sem_cobertura_total;
          paramByName('CD_PAIS_IMPORTADOR').AsString       :=Colunas.Strings[38];
          paramByName('NR_RE_VINCULADA').AsString          :=Colunas.Strings[41];
          paramByName('NR_DI_VINCULADA').AsString          :=Colunas.Strings[42];
          paramByName('VL_FRETE_TOTAL').AsString           :=Colunas.Strings[47];
          paramByName('VL_SEGURO_TOTAL').AsString          :=Colunas.Strings[48];
          paramByName('VL_FINANC_RC').AsString             :=Colunas.Strings[50];
          paramByName('VL_TOTAL_COND_VENDA_ACUM').AsString :=Colunas.Strings[51];
          paramByName('VL_TOTAL_LOCAL_VENDA_ACUM').AsString:=Colunas.Strings[52];
          paramByName('PESO_LIQUIDO_TOTAL').AsString       :=Colunas.Strings[53];
          paramByName('VL_PESO_NBM_INCLUIDAS').AsString    :=Colunas.Strings[54];
          paramByName('NR_PROCESSO_COMPLEMENTO').AsString  :=gNR_PROCESSO_COMPLEMENTO;
          paramByName('TX_END_IMPORTADOR').AsString        :=flag_TX_END_IMPORTADOR;
          paramByName('DT_DATA_RE').AsDateTime             :=flag_DATA_ABERTURA;
          ExecSQL;
        end;

        if str_registro = '25' then  //RE ANEXO PURO
        begin
          flag_CD_RE_ANEXO_FABRIC:=0;
          if copy(Colunas.Strings[2], 1, 2)='00' then
            flag_DT_VALIDADE_EMBARQUE := NULL
          else
            flag_DT_VALIDADE_EMBARQUE := Copy(Colunas.Strings[2], 7, 4) + '/' + Copy(Colunas.Strings[2], 4, 2) + '/' + Copy(Colunas.Strings[2], 1, 2);

          flag_cd_unid_medida   :=dePara_RE('01','02','29',trim(Colunas.Strings[12]));
          if flag_cd_unid_medida='' then
          begin
            showmessage('A Unidade de Medida "'+Colunas.Strings[12]+'" não foi encontrado em nosso sistema, '+#13+
                        'será necessario re-integrar novamente após o acerto do DE PARA');
            Exit;
          end;

          //naladi                             //ncm
          if copy(Colunas.Strings[5],1,6)  <>  copy(Colunas.Strings[7],1,6) then
            str_erro_ncm := str_erro_ncm + '"' + Copy(Colunas.Strings[3], 1, 3) + '"  ';

          SQL.Clear;
          (*
          SQL.add('INSERT INTO TRE_ANEXO ( ');
          SQL.add('NR_PROCESSO,DT_VALIDADE_EMBARQUE,CD_RE_ANEXO,CD_NBM,CD_NALADI,CD_NCM,CD_SULF_NCM,TX_CATEGORIA_TEXTIL,');
          SQL.add('CD_UF_PRODUTOR,PESO_LIQUIDO,QT_UNIDADE_COMERCIAL,CD_UNID_MEDIDA,');
          SQL.add('QT_MEDIA_NBM,VL_COND_VENDA,VL_LOCAL_VENDA,PC_COMISSAO,VL_COM_AG_EFET,');
          SQL.add('CD_FORMA_PGTO,CD_FINALIDADE,TX_DESC_MERCADORIA,IN_OBS_EXPORTADOR,IN_EXPORTADOR_FABRICANTE,TX_OBSERVACAO_EXPORTADOR,');
          SQL.add('NR_PROCESSO_COMPLEMENTO )');
          SQL.add(' VALUES ( ');
          SQL.add(':NR_PROCESSO,:DT_VALIDADE_EMBARQUE,:CD_RE_ANEXO,:CD_NBM,:CD_NALADI,:CD_NCM,:CD_SULF_NCM,:TX_CATEGORIA_TEXTIL,');
          SQL.add(':CD_UF_PRODUTOR,:PESO_LIQUIDO,:QT_UNIDADE_COMERCIAL,:CD_UNID_MEDIDA,');
          SQL.add(':QT_MEDIA_NBM,:VL_COND_VENDA,:VL_LOCAL_VENDA,:PC_COMISSAO,:VL_COM_AG_EFET,');
          SQL.add(':CD_FORMA_PGTO,:CD_FINALIDADE,:TX_DESC_MERCADORIA,:IN_OBS_EXPORTADOR,:IN_EXPORTADOR_FABRICANTE,:TX_OBSERVACAO_EXPORTADOR,');
          SQL.add(':NR_PROCESSO_COMPLEMENTO )');
          *)

          SQL.add('INSERT INTO TRE_ANEXO_PURO (NR_PROCESSO, CD_NALADI_SH, CD_NCM, CD_SULF_NCM,');
          SQL.add('             CD_UF_PRODUTOR, VL_TOT_PESO_LIQ, QT_MERCADORIA, CD_UNID_MEDIDA,');
          SQL.add('             VL_COND_VENDA, VL_MCV, VL_LOCAL_VENDA, VL_MLE, PC_COMISSAO,');
          SQL.add('             CD_FORMA_PGTO, TX_MERCADORIA, TX_MERCADORIA_ITEM, CD_FABR_EXPO,');
          SQL.add('             NR_PROCESSO_COMPLEMENTO)');
          SQL.add(' VALUES (:NR_PROCESSO, :CD_NALADI, :CD_NCM, :CD_SULF_NCM,');
          SQL.add('         :CD_UF_PRODUTOR, :PESO_LIQUIDO, :QT_UNIDADE_COMERCIAL, :CD_UNID_MEDIDA,');
          SQL.add('         :VL_COND_VENDA, :VL_MCV, :VL_LOCAL_VENDA, :VL_MLE, :PC_COMISSAO,');
          SQL.add('         :CD_FORMA_PGTO, :TX_DESC_MERCADORIA, :TX_MERCADORIA_ITEM, :IN_EXPORTADOR_FABRICANTE,');
          SQL.add('         :NR_PROCESSO_COMPLEMENTO)');

          paramByName('NR_PROCESSO').AsString              :=vInsereProcesso;
          paramByName('CD_NALADI').AsString                :=Colunas.Strings[5];
          paramByName('CD_NCM').AsString                   :=copy(Colunas.Strings[7],1,8);
          paramByName('CD_SULF_NCM').AsString              :=copy(Colunas.Strings[7],9,2);
          paramByName('CD_UF_PRODUTOR').AsString           :=Colunas.Strings[9];
          paramByName('PESO_LIQUIDO').AsString             :=Colunas.Strings[10];
          paramByName('QT_UNIDADE_COMERCIAL').AsString     :=Colunas.Strings[11];
          paramByName('CD_UNID_MEDIDA').AsString           :=flag_cd_unid_medida;

          paramByName('VL_COND_VENDA').AsString            :=Colunas.Strings[14];
          paramByName('VL_MCV').AsString                   :=Colunas.Strings[14];
          paramByName('VL_LOCAL_VENDA').AsString           :=Colunas.Strings[15];
          paramByName('VL_MLE').AsString                   :=Colunas.Strings[15];
          paramByName('PC_COMISSAO').AsString              :=Colunas.Strings[16];
          paramByName('CD_FORMA_PGTO').AsString            :=Colunas.Strings[18];
          flag_TX_DESC_MERCADORIA := '';

          if trim(Colunas.Strings[20])<>'' then
            flag_TX_DESC_MERCADORIA:=flag_TX_DESC_MERCADORIA+trim(Colunas.Strings[20])+' |';
          if trim(Colunas.Strings[21])<>'' then
            flag_TX_DESC_MERCADORIA:=flag_TX_DESC_MERCADORIA+trim(Colunas.Strings[21])+' |';
          if trim(Colunas.Strings[22])<>'' then
            flag_TX_DESC_MERCADORIA:=flag_TX_DESC_MERCADORIA+trim(Colunas.Strings[22])+' |';
          if trim(Colunas.Strings[23])<>'' then
            flag_TX_DESC_MERCADORIA:=flag_TX_DESC_MERCADORIA+trim(Colunas.Strings[23])+' |';
          if trim(Colunas.Strings[24])<>'' then
            flag_TX_DESC_MERCADORIA:=flag_TX_DESC_MERCADORIA+trim(Colunas.Strings[24])+' |';
          if trim(Colunas.Strings[25])<>'' then
            flag_TX_DESC_MERCADORIA:=flag_TX_DESC_MERCADORIA+trim(Colunas.Strings[25])+' |';
          if trim(Colunas.Strings[26])<>'' then
            flag_TX_DESC_MERCADORIA:=flag_TX_DESC_MERCADORIA+trim(Colunas.Strings[26])+' |';
          if trim(Colunas.Strings[27])<>'' then
            flag_TX_DESC_MERCADORIA:=flag_TX_DESC_MERCADORIA+trim(Colunas.Strings[27])+' |';
          if trim(Colunas.Strings[28])<>'' then
            flag_TX_DESC_MERCADORIA:=flag_TX_DESC_MERCADORIA+trim(Colunas.Strings[28])+' |';
          if trim(Colunas.Strings[29])<>'' then
            flag_TX_DESC_MERCADORIA:=flag_TX_DESC_MERCADORIA+trim(Colunas.Strings[29])+' |';

          flag_TX_DESC_MERCADORIA := Copy(flag_TX_DESC_MERCADORIA, 1, length(flag_TX_DESC_MERCADORIA) -1);

          paramByName('TX_DESC_MERCADORIA').AsMemo       := flag_TX_DESC_MERCADORIA;
          paramByName('TX_MERCADORIA_ITEM').AsString     := flag_TX_DESC_MERCADORIA;

          flag_IN_EXPORTADOR_FABRICANTE := '';
          if Colunas.Strings[32] = 'S' then
            flag_IN_EXPORTADOR_FABRICANTE := '1';

          if Colunas.Strings[32] = 'N' then
            flag_IN_EXPORTADOR_FABRICANTE := '2';

          paramByName('IN_EXPORTADOR_FABRICANTE').AsString := flag_IN_EXPORTADOR_FABRICANTE;

          paramByName('NR_PROCESSO_COMPLEMENTO').AsString  := gNR_PROCESSO_COMPLEMENTO;
          ExecSQL;
        end;

        if (str_registro = '26') and (Trim(Colunas[8]) <> '') then  // Ato Concessório
        begin

          str_anexo := ConsultaLookUPSQL(' SELECT MAX(ID_ANEXO) AS ID_ANEXO ' +
                                         ' FROM TRE_ANEXO_PURO (NOLOCK) ' +
                                         ' WHERE NR_PROCESSO = ''' + vInsereProcesso + ''' ' +
                                         '   AND NR_PROCESSO_COMPLEMENTO = ''' + gNR_PROCESSO_COMPLEMENTO + '''', 'ID_ANEXO');

          FastExecSQL(' UPDATE TRE_ANEXO_PURO ' +
                      ' SET NR_ATO = ''' + Trim(Colunas[8]) + ''' ' +
                      ' WHERE NR_PROCESSO = ''' + vInsereProcesso + ''' ' +
                      '   AND NR_PROCESSO_COMPLEMENTO = ''' + gNR_PROCESSO_COMPLEMENTO + ''' ' +
                      '   AND ID_ANEXO = ' + str_anexo);
        end;
      end;

      if str_erro_ncm <> '' then
      begin
        ShowMessage('NCM incompativel com NALADI - ANEXO(s): ' + str_erro_ncm + #13#13 + ' INTEGRAÇÃO CANCELADA!!!.');
        Exit;
      end;

      if datm_main.db_broker.InTransaction then
      begin
        if (str_enquadramento = '81101') and (dbl_valor_sem_cobertura_total > 0) then
        begin
          Close;
          SQL.Clear;
          SQL.Add('SELECT SUM(QT_MERCADORIA)');
          SQL.Add('FROM TRE_ANEXO_PURO (NOLOCK)');
          SQL.Add('WHERE NR_PROCESSO = ''' + vInsereProcesso + '''');
          SQL.Add('  AND NR_PROCESSO_COMPLEMENTO = ''' + gNR_PROCESSO_COMPLEMENTO + '''');
          Open;
          qtd_anexos := Fields[0].AsInteger;
          //dbl_valor_sem_cobertura_anexo := StrToFloat(FormatFloat('0.00', dbl_valor_sem_cobertura_total / qtd_anexos));
          //dbl_valor_sem_cobertura_sobra := dbl_valor_sem_cobertura_total - (dbl_valor_sem_cobertura_anexo * qtd_anexos);

          dbl_valor_sem_cobertura_anexo := dbl_valor_sem_cobertura_total / qtd_anexos;

          Close;
          SQL.Clear;
          SQL.Add('UPDATE TRE_ANEXO_PURO');
          SQL.Add('SET VL_LOCAL_VENDA = VL_LOCAL_VENDA + ROUND(' + StringReplace(FloatToStr(dbl_valor_sem_cobertura_anexo), ',', '.', [rfReplaceAll]) + ' * QT_MERCADORIA, 2),');
          SQL.Add('    VL_COND_VENDA = VL_COND_VENDA + ROUND(' + StringReplace(FloatToStr(dbl_valor_sem_cobertura_anexo), ',', '.', [rfReplaceAll]) + ' * QT_MERCADORIA, 2),');
          SQL.Add('    VL_MLE = VL_MLE + ROUND(' + StringReplace(FloatToStr(dbl_valor_sem_cobertura_anexo), ',', '.', [rfReplaceAll]) + ' * QT_MERCADORIA, 2),');
          SQL.Add('    VL_MCV = VL_MCV + ROUND(' + StringReplace(FloatToStr(dbl_valor_sem_cobertura_anexo), ',', '.', [rfReplaceAll]) + ' * QT_MERCADORIA, 2),');
          SQL.Add('    VL_SEM_COBERTURA = ROUND(' + StringReplace(FloatToStr(dbl_valor_sem_cobertura_anexo), ',', '.', [rfReplaceAll]) + ' * QT_MERCADORIA, 2)');
          SQL.Add('WHERE NR_PROCESSO = ''' + vInsereProcesso + '''');
          SQL.Add('  AND NR_PROCESSO_COMPLEMENTO = ''' + gNR_PROCESSO_COMPLEMENTO + '''');
          ExecSQL;

          SQL.Clear;
          SQL.Add('SELECT SUM(VL_SEM_COBERTURA)');
          SQL.Add('FROM TRE_ANEXO_PURO (NOLOCK)');
          SQL.Add('WHERE NR_PROCESSO = ''' + vInsereProcesso + '''');
          SQL.Add('  AND NR_PROCESSO_COMPLEMENTO = ''' + gNR_PROCESSO_COMPLEMENTO + '''');
          Open;
          dbl_valor_sem_cobertura_sobra := dbl_valor_sem_cobertura_total - Fields[0].AsFloat;
          Close;

          if dbl_valor_sem_cobertura_sobra > 0 then
          begin
            Close;
            SQL.Clear;
            SQL.Add('SELECT MIN(ID_ANEXO) ID_ANEXO');
            SQL.Add('FROM TRE_ANEXO_PURO (NOLOCK)');
            SQL.Add('WHERE NR_PROCESSO = ''' + vInsereProcesso + '''');
            SQL.Add('  AND NR_PROCESSO_COMPLEMENTO = ''' + gNR_PROCESSO_COMPLEMENTO + '''');
            Open;
            str_anexo := Fields[0].AsString;

            Close;
            SQL.Clear;
            SQL.Add('UPDATE TRE_ANEXO_PURO');
            SQL.Add('SET VL_LOCAL_VENDA = VL_LOCAL_VENDA + ROUND(' + StringReplace(FloatToStr(dbl_valor_sem_cobertura_sobra), ',', '.', [rfReplaceAll]) + ', 2),');
            SQL.Add('    VL_MLE = VL_MLE + ROUND(' + StringReplace(FloatToStr(dbl_valor_sem_cobertura_sobra), ',', '.', [rfReplaceAll]) + ', 2),');
            SQL.Add('    VL_SEM_COBERTURA = VL_SEM_COBERTURA + ROUND(' + StringReplace(FloatToStr(dbl_valor_sem_cobertura_anexo), ',', '.', [rfReplaceAll]) + ' * QT_MERCADORIA, 2),');
            SQL.Add('WHERE NR_PROCESSO = ''' + vInsereProcesso + '''');
            SQL.Add('  AND NR_PROCESSO_COMPLEMENTO = ''' + gNR_PROCESSO_COMPLEMENTO + '''');
            SQL.Add('  AND ID_ANEXO = ' + str_anexo);
            ExecSQL;
          end;
        end;

        Close;
        SQL.Clear;
        SQL.Add('UPDATE TRE_CAPA');
        SQL.Add('SET IN_AGRUPAR = ''1'',');
        SQL.Add('    IN_QUEBRA_POR_FABRICANTE = ''1''');
        SQL.Add('WHERE NR_PROCESSO = ''' + vInsereProcesso + '''');
        SQL.Add('  AND NR_PROCESSO_COMPLEMENTO = ''' + gNR_PROCESSO_COMPLEMENTO + '''');
        ExecSQL;
        SQL.Clear;
        SQL.Add('EXEC SP_RE_CLASSIFICA_ANEXO_NOVOEX ''' + vInsereProcesso + ''', ''' + gNR_PROCESSO_COMPLEMENTO + '''');
        try
          ExecSQL;
        except
        end;

        datm_main.db_broker.Commit;
        pnl_dat.Visible:=false;
        showmessage('RE Importada com Sucesso!!!!');
      end;
    end;
  finally
    if datm_main.db_broker.InTransaction then
      datm_main.db_broker.Rollback;

    FreeAndNil(Linhas);
    FreeAndNil(Colunas);

    //refresh e reposicionamento do registro
    datm_re_capa.qry_re_capa.Close;
    datm_re_capa.qry_re_capa.SQL.Text := datm_re_capa.GetSelQueryRE(frm_re_capa.edrQtRegistros.text);    
    datm_re_capa.qry_re_capa.Open;
    datm_re_capa.qry_re_capa.Locate('NR_PROCESSO;NR_PROCESSO_COMPLEMENTO', VarArrayOf([vInsereProcesso, gNR_PROCESSO_COMPLEMENTO]), [loCaseInsensitive]);
  end;
end;

procedure Tfrm_re_capa.btnConfirmaIntegraJP(Sender: TObject);
begin

  if datm_re_capa.qry_re_capaIN_NOVOEX.AsBoolean then
    btnConfirmaIntegraREItensClick(Sender)
  else
    btnConfirmaIntegraREClick(Sender);
end;

procedure Tfrm_re_capa.rdbCancelarClick(Sender: TObject);
begin
  datm_re_capa.qryFilaRE.Close;
  datm_re_capa.qryFilaRE.ParamByName('IN_CANCELADO').AsString := TRadioButton(Sender).Hint;
  datm_re_capa.qryFilaRE.Open;
end;

procedure Tfrm_re_capa.btnPesquisarClick(Sender: TObject);
begin
  with datm_re_capa do
  begin
    datm_re_capa.qry_re_capa.DisableControls;

    qry_re_capa.Close;
    datm_re_capa.qry_re_capa.SQL.Text := datm_re_capa.GetSelQueryRE(frm_re_capa.edrQtRegistros.text);

    if not cbRegistrados.Checked then
    begin
       if ck_ult_proc.Checked then
          datm_re_capa.qry_re_capa.SQL[13] := '  AND ISNULL(RC.NR_RE_SISCOMEX, '''') IN ('''', ''-'') '+
                                              '  AND p.DT_ABERTURA > GETDATE() - ' + IntToStr(vQtdeDiasConsProc)
       else
          datm_re_capa.qry_re_capa.SQL[13] := '  AND ISNULL(RC.NR_RE_SISCOMEX, '''') IN ('''', ''-'') ';
    end
    else
    begin
       if ck_ult_proc.Checked then
          datm_re_capa.qry_re_capa.SQL[13] := ' AND p.DT_ABERTURA > GETDATE() - ' + IntToStr(vQtdeDiasConsProc)
       else
         datm_re_capa.qry_re_capa.SQL[13] := ' AND p.DT_ABERTURA > GETDATE() - 900'; //2 anos e tralala...  by Carlos - 29/11/2011

    end;

    if not ((mskNrProcesso.text = '  -      -  ') or (mskNrProcesso.text = ''))then
      datm_re_capa.qry_re_capa.SQL[14] := ' AND P.NR_PROCESSO = '+QuotedStr(edt_cd_unidade.Text +msk_cd_produto.Text+ mskNrProcesso.text);

    if not ((mskNrRegistro.text = '') or (mskNrRegistro.text = '  /       -   '))then
      datm_re_capa.qry_re_capa.SQL[15] := ' AND NR_RE_SISCOMEX = '+QuotedStr(mskNrRegistro.text);

    if not ((edtDataConsultaInicial.text = '  /  /    ') or (edtDataConsultaInicial.text = '')) then
      datm_re_capa.qry_re_capa.SQL[16] := ' AND (RC.DT_DATA >=' +QuotedStr(FormatDateTime('yyyy/mm/dd',
                                                                StrtoDate(edtDataConsultaInicial.text)) + ' 00:00')+')  '+ sLineBreak;

    if not ((edtDataConsultaFinal.text = '  /  /    ') or (edtDataConsultaFinal.text = '')) then
      datm_re_capa.qry_re_capa.SQL[16] := ' AND (RC.DT_DATA <= '+QuotedStr(FormatDateTime('yyyy/mm/dd',
                                                                StrtoDate(edtDataConsultaFinal.text)) + ' 23:59')+')  '+ sLineBreak;
    if not (edtExportador.text = '' ) then
      datm_re_capa.qry_re_capa.SQL[17] := ' AND E.CD_GRUPO = '+ QuotedStr(edtExportador.text) + sLineBreak;

    qry_re_capa.ParamByName('CD_UNID_NEG').AsString := edt_cd_unidade.Text;
    qry_re_capa.ParamByName('CD_PRODUTO').AsString  := msk_cd_produto.Text;

    qry_re_capa.Prepare;
    qry_re_capa.Open;

   {
    qry_re_anexo.Close;
    qry_re_anexo.ParamByName('NR_PROCESSO').AsString := qry_re_capa.FieldByName('NR_PROCESSO').AsString;
    qry_re_anexo.ParamByName('NR_PROCESSO_COMPLEMENTO').AsString := qry_re_capa.FieldByName('NR_PROCESSO_COMPLEMENTO').AsString;
    qry_re_anexo.Prepare;
    qry_re_anexo.Open; }
    datm_re_capa.qry_re_capa.EnableControls;      
  end;
end;

procedure Tfrm_re_capa.edrQtRegistrosKeyPress(Sender: TObject;
  var Key: Char);
begin
  if not (key in ['1'..'9']) then
    exit;
end;

procedure Tfrm_re_capa.edtRegistroKeyPress(Sender: TObject; var Key: Char);
begin
  if not (key in ['1'..'9']) then
    exit;
end;

procedure Tfrm_re_capa.BuscarCodigoExport;
begin
  if datm_re_capa.cdsGrupo.Locate('CD_GRUPO', edtExportador.Text, [loCaseInsensitive]) then
    cbExportador.KeyValue := datm_re_capa.cdsGrupo.fieldbyName('CD_GRUPO').AsString
  else
    cbExportador.KeyValue := '';
end;

procedure Tfrm_re_capa.edtExportadorKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_RETURN  then
  begin
    BuscarCodigoExport;
  end;
end;

procedure Tfrm_re_capa.edtExportadorExit(Sender: TObject);
begin
  BuscarCodigoExport;
end;

procedure Tfrm_re_capa.PreencherCodigoExport;
begin
  if not ((cbExportador.KeyValue = '') or (cbExportador.KeyValue = null)) then
    edtExportador.Text := datm_re_capa.cdsGrupo.fieldbyName('CD_GRUPO').AsString
  else
    edtExportador.Text := '';
end;

procedure Tfrm_re_capa.cbExportadorCloseUp(Sender: TObject);
begin
  PreencherCodigoExport;
end;

procedure Tfrm_re_capa.cbExportadorExit(Sender: TObject);
begin
  PreencherCodigoExport;                                                                                      
end;

procedure Tfrm_re_capa.cbExportadorKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
   if Key = VK_CONTROL then
    cbExportador.KeyValue := '';
    
    if cbExportador.KeyValue <> null then
    edtExportador.text := cbExportador.KeyValue;
end;

procedure Tfrm_re_capa.edtDataConsultaInicialExit(Sender: TObject);
begin
  if not ((edtDataConsultaInicial.text = '  /  /    ') or (edtDataConsultaInicial.text = '')) and (not cbRegistrados.checked) then
    cbRegistrados.checked := true;
end;

procedure Tfrm_re_capa.edtDataConsultaFinalExit(Sender: TObject);
begin
  if not ((edtDataConsultaFinal.text = '  /  /    ') or (edtDataConsultaFinal.text = '')) and (not cbRegistrados.checked) then
    cbRegistrados.checked := true;
end;

end.

