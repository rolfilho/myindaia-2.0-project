(*******************************************************************************
Sistema: DD Broker - Indaiá Logística
PROGRAMA: PGPE003.PAS - Processo de Exportação - Capa
MANUTENÇÃO: 08/01/2004
*******************************************************************************)
unit PGPE017;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Mask, StdCtrls, ExtCtrls, DBCtrls, Menus, Grids, DBGrids, ComCtrls,
  Db, DBTables, Buttons, Funcoes, ConsOnLineEx, StrUtils, ServicoNovo,
  FormsLog; // Este sempre depois das uses Forms e Classes - Michel - 22/03/2013;

type
  TMercadoriaBasf = record
    NCM: String;
    SufixoNCM: String;
    Naladi: String;
    Mercosul: String;
    NmMerc: String;
    TxMerc: String;
    CatTextil: String;
    UfProdutor: String;
    ValidEmb: TDateTime;
    PesoLiq: Double;
    QtdComercial: Double;
    UnidComercial: String;
    QtdNCM: Double;
    UnidNCM: String;
    VlMCV: Double;
    VlMLE: Double;
    VlUnitMCV: Double;
    VlUnitMLE: Double;
    PcAgente: Double;
    FormaAgente: String;
    VlAgente: Double;
    Finalidade: String;
    ExpFab: Boolean;
    ObsExp: Boolean;
    TxObsExp: String;
    CodMerc: String;
    CodFabric: String;
    Acordo: String;
    Norma: String;
  end;

type
  Tfrm_exp_capa = class(TForm)
    pnl_cadastro: TPanel;
    btn_sair: TSpeedButton;
    btn_salvar: TSpeedButton;
    btn_cancelar: TSpeedButton;
    menu_manut_cadastro: TMainMenu;
    mi_salvar: TMenuItem;
    mi_cancelar: TMenuItem;
    mi_sair: TMenuItem;
    btn_itens_exp: TSpeedButton;
    btn_excluir: TSpeedButton;
    mi_excluir: TMenuItem;
    mi_itens_exp: TMenuItem;
    btn_calculo: TSpeedButton;
    btn_incluir: TSpeedButton;
    mi_incluir: TMenuItem;
    mi_calcular: TMenuItem;
    btn_manut_proc: TSpeedButton;
    mi_manut_proc: TMenuItem;
    pgctrl_exp_capa: TPageControl;
    tsBasicas: TTabSheet;
    tbsht_capa_02: TTabSheet;
    tbsht_capa_03: TTabSheet;
    tbsht_capa_04: TTabSheet;
    pnl_despesas: TPanel;
    lbl_sequencia: TLabel;
    lbl_item: TLabel;
    lbl_valor: TLabel;
    btn_co_item: TSpeedButton;
    Label58: TLabel;
    dbgrd_exp_desp: TDBGrid;
    dbedt_nr_sequencia: TDBEdit;
    dbedt_cd_item: TDBEdit;
    dbedt_vl_despesa: TDBEdit;
    dbedt_vl_tot_despesa: TDBEdit;
    tbsht_capa_05: TTabSheet;
    pnl_re: TPanel;
    dbg_re: TDBGrid;
    pnl_ref_Re: TPanel;
    lbl_re: TLabel;
    lbl_data: TLabel;
    lbl_nbm_sh: TLabel;
    lbl_vl_fob: TLabel;
    lbl_peso_liq: TLabel;
    dbedt_nr_re: TDBEdit;
    dbedt_dt_re: TDBEdit;
    dbedt_cd_nbm_sh: TDBEdit;
    dbedt_vl_fob: TDBEdit;
    dbedt_peso_liq: TDBEdit;
    ts_despacho: TTabSheet;
    Label78: TLabel;
    Label192: TLabel;
    Label82: TLabel;
    btn_co_despacho: TSpeedButton;
    pgctrl_despacho: TPageControl;
    ts_dde_re: TTabSheet;
    dbgrd_re: TDBGrid;
    pnl_dde_re: TPanel;
    lbl_nr_re1: TLabel;
    lbl_nr_anexo_ini: TLabel;
    lbl_nr_anexo_fim: TLabel;
    dbedt_nr_re1: TDBEdit;
    dbedt_nr_anexo_ini: TDBEdit;
    dbedt_nr_anexo_fim: TDBEdit;
    ts_dde_nf: TTabSheet;
    dbgrd_nf: TDBGrid;
    pnl_dde_nf: TPanel;
    lbl_nf_ini: TLabel;
    lbl_nf_fim: TLabel;
    lbl_serie: TLabel;
    dbedt_nf_ini: TDBEdit;
    dbedt_nf_fim: TDBEdit;
    dbedt_serie: TDBEdit;
    dbedt_nr_dde: TDBEdit;
    dbedt_dt_reg_dde: TDBEdit;
    dbedt_cd_local_despacho: TDBEdit;
    tbsht_capa_06: TTabSheet;
    pnl_certificado: TPanel;
    Label63: TLabel;
    Label64: TLabel;
    btn_co_local_emissao: TSpeedButton;
    Label67: TLabel;
    btn_co_obs: TSpeedButton;
    Label69: TLabel;
    btn_co_merc_bl: TSpeedButton;
    lbl_crit_orig_form_a: TLabel;
    dbedt_nr_cert: TDBEdit;
    dbedt_cd_local_emissao: TDBEdit;
    dbm_observacao: TDBMemo;
    dbm_merc_bl: TDBMemo;
    dbm_crit_orig_form_a: TDBMemo;
    tbsht_capa_07: TTabSheet;
    pnl_nf: TPanel;
    ts_pedido: TTabSheet;
    dbgrd_pedido: TDBGrid;
    pnl_pedido: TPanel;
    lbl_tx_marcacao_volume_ped: TLabel;
    lbl_tx_inf_embalagem_ped: TLabel;
    lbl_nr_fatura_ped: TLabel;
    lbl_nr_pedido: TLabel;
    dbedt_nr_fatura_ped: TDBEdit;
    dbm_tx_marcacao_volume_ped: TDBMemo;
    dbm_tx_inf_embalagem_ped: TDBMemo;
    dbedt_nr_pedido: TDBEdit;
    ts_NovoRe: TTabSheet;
    dbgrd_NovoRe: TDBGrid;
    lbl3: TLabel;
    shp2: TShape;
    Label6: TLabel;
    lbl_nr_transm: TLabel;
    dbedt_nr_transm: TDBEdit;
    lbl_cd_canal: TLabel;
    dbcbo_cd_canal: TDBLookupComboBox;
    btn_re: TSpeedButton;
    mi_re: TMenuItem;
    bvlBasicas: TBevel;
    Label26: TLabel;
    Label27: TLabel;
    Label28: TLabel;
    Label29: TLabel;
    btn_co_importador: TSpeedButton;
    btn_co_exportador: TSpeedButton;
    Label32: TLabel;
    Label33: TLabel;
    btn_co_origem: TSpeedButton;
    Label34: TLabel;
    btn_co_destino: TSpeedButton;
    Label35: TLabel;
    btn_co_pais_destino: TSpeedButton;
    Label36: TLabel;
    Label37: TLabel;
    Label39: TLabel;
    Label40: TLabel;
    Label41: TLabel;
    Label42: TLabel;
    btn_co_instr_neg: TSpeedButton;
    Label43: TLabel;
    btn_co_seguradora: TSpeedButton;
    Label44: TLabel;
    btn_co_urf_desp: TSpeedButton;
    Label45: TLabel;
    btn_co_urf_emb: TSpeedButton;
    Label46: TLabel;
    btn_co_termo_pagto: TSpeedButton;
    Label47: TLabel;
    Label48: TLabel;
    btn_co_moeda: TSpeedButton;
    btn_co_incoterm: TSpeedButton;
    lbl_fabr: TLabel;
    btn_co_fabricante: TSpeedButton;
    lbl_pais_origem: TLabel;
    btn_co_pais_origem: TSpeedButton;
    Label65: TLabel;
    btn_co_pais_orig: TSpeedButton;
    lbl_processo: TLabel;
    btn_co_proc_new: TSpeedButton;
    Label80: TLabel;
    btn_co_enquad_op: TSpeedButton;
    dbedt_dt_abertura: TDBEdit;
    dbedt_nr_fatura: TDBEdit;
    dbedt_dt_fatura: TDBEdit;
    dbchkbx_drawback: TDBCheckBox;
    dbedt_cd_exportador: TDBEdit;
    dbedt_cd_importador: TDBEdit;
    dbedt_cd_local_origem: TDBEdit;
    dbedt_cd_local_destino: TDBEdit;
    dbedt_cd_pais_destino: TDBEdit;
    dblck_via_transp: TDBLookupComboBox;
    dblck_tp_frete: TDBLookupComboBox;
    dblck_forma_pagto: TDBLookupComboBox;
    dbedt_perc_comissao: TDBEdit;
    dbedt_cd_incoterm: TDBEdit;
    dbedt_cd_instr_neg: TDBEdit;
    dbedt_cd_seguradora: TDBEdit;
    dbedt_cd_urf_despacho: TDBEdit;
    dbedt_cd_urf_embarque: TDBEdit;
    dbedt_cd_termo_pagto: TDBEdit;
    dblck_tp_lingua: TDBLookupComboBox;
    dbedt_cd_moeda: TDBEdit;
    dbrgrp_fabr_expo: TDBRadioGroup;
    dbedt_cd_fabricante: TDBEdit;
    dbedt_cd_pais_origem: TDBEdit;
    dbedt_cd_pais_orig: TDBEdit;
    mskedt_nr_processo: TMaskEdit;
    dbchkbx_venda_incoterm: TDBCheckBox;
    dbedt_cd_enquad_op: TDBEdit;
    dbchkbx_num_fat_auto: TDBCheckBox;
    bvlTotais: TBevel;
    lblMarcacaoIng: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    lbl_incoterm: TLabel;
    Label15: TLabel;
    Label16: TLabel;
    Label17: TLabel;
    Label18: TLabel;
    Label19: TLabel;
    label70: TLabel;
    Label49: TLabel;
    btn_co_termo_seg: TSpeedButton;
    Label81: TLabel;
    Label83: TLabel;
    lbl1: TLabel;
    dbm_marc_volumes: TDBMemo;
    dbm_inf_geral: TDBMemo;
    dbedt_tot_mle: TDBEdit;
    dbedt_qt_total_emb: TDBEdit;
    dbedt_qt_total_prod: TDBEdit;
    dbedt_vl_desconto: TDBEdit;
    dbedt_tot_pl: TDBEdit;
    dbedt_vl_seguro: TDBEdit;
    dbedt_vl_cubagem: TDBEdit;
    dbedt_vl_frete_intern: TDBEdit;
    dbedt_tot_pb: TDBEdit;
    dbedt_tot_incoterm_mcv: TDBEdit;
    dbedt_tot_exw: TDBEdit;
    dbedt_tx_cambio: TDBEdit;
    dbedt_tot_pallets: TDBEdit;
    dbedt_vl_comissao_agente: TDBEdit;
    dbedt_tot_containers: TDBEdit;
    dbedt_vl_tot_desp: TDBEdit;
    dbm_termo_pagto: TDBMemo;
    dbedt_vl_sem_cobertura_cambial: TDBEdit;
    dbedt_vl_acrescimo: TDBEdit;
    dbedt_vl_frete_int: TDBEdit;
    bvlComplementares: TBevel;
    Label22: TLabel;
    Label23: TLabel;
    Label24: TLabel;
    Label50: TLabel;
    btn_co_agente: TSpeedButton;
    Label51: TLabel;
    btn_co_despachante: TSpeedButton;
    Label52: TLabel;
    btn_co_transportadora: TSpeedButton;
    Label53: TLabel;
    btn_co_consignatario: TSpeedButton;
    Label56: TLabel;
    Label54: TLabel;
    btn_co_notificado1: TSpeedButton;
    Label55: TLabel;
    btn_co_notificado2: TSpeedButton;
    Label61: TLabel;
    Label74: TLabel;
    Label73: TLabel;
    btn_co_documento: TSpeedButton;
    Label75: TLabel;
    btn_co_copia: TSpeedButton;
    Label68: TLabel;
    Label76: TLabel;
    btn_co_banco_saque_bordero: TSpeedButton;
    Label77: TLabel;
    Label79: TLabel;
    Label38: TLabel;
    btn_co_representante: TSpeedButton;
    lbl_decl: TLabel;
    dbm_decl_adicional: TDBMemo;
    dbm_decl_adicional_inst_emb: TDBMemo;
    dbedt_nm_carta_credito: TDBEdit;
    dbedt_cd_agente_carga: TDBEdit;
    dbedt_cd_despachante: TDBEdit;
    dbedt_cd_transportadora: TDBEdit;
    dbedt_nr_li: TDBEdit;
    dbedt_cd_consignatario: TDBEdit;
    dblkcbox_consignatario: TDBLookupComboBox;
    dblkcbox_notificado1: TDBLookupComboBox;
    dbedt_cd_notificado1: TDBEdit;
    dblkcbox_notificado2: TDBLookupComboBox;
    dbedt_cd_notificado2: TDBEdit;
    dbedt_nr_sd: TDBEdit;
    dbedt_dt_sd: TDBEdit;
    dblkcbox_documento: TDBLookupComboBox;
    dbedt_cd_documento: TDBEdit;
    dblkcbox_copia: TDBLookupComboBox;
    dbedt_cd_copia: TDBEdit;
    dbchk_in_decl_ad_instr_emb: TDBCheckBox;
    dbchk_in_decl_ad_packing_list: TDBCheckBox;
    dbedt_cd_banco_saque_bordero: TDBEdit;
    dbchk_in_referencia_fat_inst: TDBCheckBox;
    dbedt_cd_representante: TDBEdit;
    dblck_posicao: TDBLookupComboBox;
    edt_nm_exportador: TEdit;
    edt_nm_importador: TEdit;
    edt_nm_local_destino: TEdit;
    edt_nm_local_origem: TEdit;
    edt_nm_pais_orig: TEdit;
    edt_nm_fabricante: TEdit;
    edt_nm_istr_neg: TEdit;
    edt_nm_urf_embarque: TEdit;
    edt_nm_urf_despacho: TEdit;
    edt_nm_termo_pagto: TEdit;
    edt_nm_pais_destino: TEdit;
    edt_nm_seguradora: TEdit;
    edt_nm_moeda: TEdit;
    edt_nm_enquad_op: TEdit;
    edt_nm_agente_carga: TEdit;
    edt_NmTransportadora: TEdit;
    edt_nm_despachante: TEdit;
    edt_nm_banco_saque_bordero: TEdit;
    edt_nm_representante: TEdit;
    chkProcessos: TCheckBox;
    lblUltProc: TLabel;
    edt_nm_consignatario: TEdit;
    edt_nm_item: TEdit;
    edt_nm_local_despacho: TEdit;
    edt_nm_local_emissao: TEdit;
    edt_nm_notificado1: TEdit;
    edt_nm_documento: TEdit;
    edt_nm_copia: TEdit;
    edt_nm_notificado2: TEdit;
    btnIntegraRAP: TSpeedButton;
    cbbLogomarca: TComboBox;
    lblLogo: TLabel;
    Label7: TLabel;
    dbedt_vl_desconto_pedido: TDBEdit;
    Label14: TLabel;
    dbedt_vl_frente_internacional_pedido: TDBEdit;
    Panel8: TPanel;
    dbmemo_merc: TDBMemo;
    lblMercadoria: TLabel;
    dbedt_vl_seguro_pedido: TDBEdit;
    Label20: TLabel;
    dbedtAcrescimo: TDBEdit;
    lbl2: TLabel;
    btnEstornaRap: TSpeedButton;
    lbl_nf: TLabel;
    dbedt_nr_nf: TDBEdit;
    Label147: TLabel;
    dbedt_dt_nf: TDBEdit;
    Label145: TLabel;
    dbedt_vl_nf: TDBEdit;
    lbl4: TLabel;
    dbedtSerie: TDBEdit;
    lblVlTaxa: TLabel;
    dbedtVlTaxa: TDBEdit;
    dbg_nf: TDBGrid;
    lbl5: TLabel;
    dbedtbCoSaque: TDBEdit;
    edtBcoSaque: TEdit;
    btnCoBcoSaque: TSpeedButton;
    btnIntegraDocto: TSpeedButton;
    btnEstornaDocto: TSpeedButton;
    BtnImportaDados: TSpeedButton;
    OpenDlg: TOpenDialog;
    Label21: TLabel;
    dbedt_vl_inland_freight: TDBEdit;
    btnIntegraBasf: TSpeedButton;
    btnIntegraJP: TSpeedButton;
    AbreDAT: TOpenDialog;
    pnlEtapa: TPanel;
    shp46: TShape;
    lblCodigo: TLabel;
    lblEtapa: TLabel;
    btnConsultaEtapa: TSpeedButton;
    btnSalvarEtapa: TSpeedButton;
    btnCancelarEtapa: TSpeedButton;
    lbl35: TLabel;
    edtCodigoEtapa: TEdit;
    edtNomeEtapa: TEdit;
    edtCodigo: TEdit;
    Label25: TLabel;
    dbedt_vl_inland_freight_pedido: TDBEdit;
    btnIntegraFesto: TSpeedButton;
    dbedtChave: TDBEdit;
    Label30: TLabel;
    dbcbContainer: TDBLookupComboBox;
    Label31: TLabel;
    btnMarcacao: TBitBtn;
    dbm_marc_volumes_esp: TDBMemo;
    lblMarcacaoEsp: TLabel;
    btnVerificaDivergenciasLotes: TSpeedButton;
    Label1: TLabel;
    dbedtAP_CONTAINER_FATURA: TDBEdit;
    Label57: TLabel;
    dbedtPedidoImportador: TDBEdit;
    btnIntegracaoPetronas: TSpeedButton;
    DBLookupComboBox1: TDBLookupComboBox;
    Label59: TLabel;
    dbmemo_ObsCertificadoOrigem: TDBMemo;
    Label60: TLabel;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormShow(Sender: TObject);
    procedure btn_incluirClick(Sender: TObject);
    procedure btn_salvarClick(Sender: TObject);
    procedure btn_cancelarClick(Sender: TObject);
    procedure btn_excluirClick(Sender: TObject);
    procedure btn_itens_expClick(Sender: TObject);
    procedure btn_calculoClick(Sender: TObject);
    procedure btn_manut_procClick(Sender: TObject);
    procedure btn_sairClick(Sender: TObject);
    procedure mskedt_nr_processoExit(Sender: TObject);
    procedure dbedt_cd_exportadorExit(Sender: TObject);
    procedure dbedt_cd_incotermExit(Sender: TObject);
    procedure dbedt_cd_exportadorKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure btn_co_exportadorClick(Sender: TObject);
    procedure btn_co_origemClick(Sender: TObject);
    procedure btn_co_pais_destinoClick(Sender: TObject);
    procedure btn_co_representanteClick(Sender: TObject);
    procedure btn_co_instr_negClick(Sender: TObject);
    procedure btn_co_urf_despClick(Sender: TObject);
    procedure btn_co_termo_pagtoClick(Sender: TObject);
    procedure btn_co_importadorClick(Sender: TObject);
    procedure btn_co_destinoClick(Sender: TObject);
    procedure btn_co_seguradoraClick(Sender: TObject);
    procedure btn_co_urf_embClick(Sender: TObject);
    procedure btn_co_moedaClick(Sender: TObject);
    procedure btn_co_despachanteClick(Sender: TObject);
    procedure btn_co_transportadoraClick(Sender: TObject);
    procedure btn_co_agenteClick(Sender: TObject);
    procedure btn_co_incotermClick(Sender: TObject);
    procedure pgctrl_exp_capaChanging(Sender: TObject; var AllowChange: Boolean);
    procedure pgctrl_exp_capaChange(Sender: TObject);
    procedure dblkcbox_consignatarioExit(Sender: TObject);
    procedure dblkcbox_notificado1Exit(Sender: TObject);
    procedure dblkcbox_notificado2Exit(Sender: TObject);
    procedure dblkcbox_documentoExit(Sender: TObject);
    procedure dblkcbox_copiaExit(Sender: TObject);
    procedure dbedt_cd_consignatarioExit(Sender: TObject);
    procedure dbedt_cd_notificado1Exit(Sender: TObject);
    procedure dbedt_cd_notificado2Exit(Sender: TObject);
    procedure dbedt_cd_documentoExit(Sender: TObject);
    procedure dbedt_cd_copiaExit(Sender: TObject);
    procedure btn_co_consignatarioClick(Sender: TObject);
    procedure btn_co_notificado1Click(Sender: TObject);
    procedure btn_co_notificado2Click(Sender: TObject);
    procedure btn_co_documentoClick(Sender: TObject);
    procedure btn_co_copiaClick(Sender: TObject);
    procedure dbedt_vl_frete_internExit(Sender: TObject);
    procedure dbedt_vl_seguroExit(Sender: TObject);
    procedure dbedt_vl_frete_internEnter(Sender: TObject);
    procedure dbedt_vl_seguroEnter(Sender: TObject);
    procedure btn_co_proc_newClick(Sender: TObject);
    procedure btn_co_itemClick(Sender: TObject);
    procedure dbgrd_exp_despDblClick(Sender: TObject);
    procedure btn_co_local_emissaoClick(Sender: TObject);
    procedure btn_co_obsClick(Sender: TObject);
    procedure btn_co_pais_origemClick(Sender: TObject);
    procedure dbrgrp_fabr_expoChange(Sender: TObject);
    procedure btn_co_fabricanteClick(Sender: TObject);
    procedure btn_co_pais_origClick(Sender: TObject);
    procedure btn_co_merc_blClick(Sender: TObject);
    procedure btn_co_termo_segClick(Sender: TObject);
    procedure btn_co_banco_saque_borderoClick(Sender: TObject);
    procedure mskedt_nr_processoChange(Sender: TObject);
    procedure pgctrl_despachoChanging(Sender: TObject; var AllowChange: Boolean);
    procedure pgctrl_despachoChange(Sender: TObject);
    procedure dbedt_nf_iniExit(Sender: TObject);
    procedure btn_co_enquad_opClick(Sender: TObject);
    procedure btn_co_despachoClick(Sender: TObject);
    procedure dbchkbx_num_fat_autoClick(Sender: TObject);
    procedure dbedt_nr_anexo_iniExit(Sender: TObject);
    procedure dbedt_nr_anexo_fimExit(Sender: TObject);
    procedure dbgrd_NovoReKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure btn_reClick(Sender: TObject);
    procedure btnIntegraRAPClick(Sender: TObject);
    procedure cbbLogomarcaChange(Sender: TObject);
    procedure btnEstornaRapClick(Sender: TObject);
    procedure dbedt_dt_nfEnter(Sender: TObject);
    procedure dbedt_dt_nfExit(Sender: TObject);
    procedure btnCoBcoSaqueClick(Sender: TObject);
    procedure btnIntegraDoctoClick(Sender: TObject);
    procedure btnEstornaDoctoClick(Sender: TObject);
    procedure BtnImportaDadosClick(Sender: TObject);
    procedure btnIntegraBasfClick(Sender: TObject);
    procedure btnIntegraJPClick(Sender: TObject);
    procedure btnCancelarEtapaClick(Sender: TObject);
    procedure btnConsultaEtapaClick(Sender: TObject);
    procedure btnSalvarEtapaClick(Sender: TObject);
    procedure btnIntegraFestoClick(Sender: TObject);
    procedure dbcbContainerKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure btnMarcacaoClick(Sender: TObject);
    procedure btnVerificaDivergenciasLotesClick(Sender: TObject);
    procedure btnIntegracaoPetronasClick(Sender: TObject);
  private
    nr_pedido : String;
    vDtTaxa : TDateTime;
    VGrupo : String;
    function VerAlt : Boolean;
    function Grava  : Boolean;
    procedure Cancelar;
    procedure CodExits;
    procedure Desabilita_Entrada;
    procedure Habilita_Entrada;
    procedure Habilita_Btn_CbBx( nNum : Integer );
    procedure Zera_Numero;
    procedure Muda_Lookup_Nm( nNum:Integer; nTp:Integer );
    procedure ValCodigo( dbedit_Codigo : TDbEdit; nNum : Integer );
    procedure VerificaDesp(Habilita : Boolean);
    procedure BloqueiaCamposRAP(pNrProc: string);
    procedure AbreTabelas;
    function VerificaDePara(vTipo : string; vCodigo : string) : string;
    procedure AtualizaBotoesIntegracao;
  public
    st_modificar, st_incluir, st_excluir : Boolean;
    //un_pd_nr_processo : string[11];
    //Code : integer;
    //in_reb : String[1];
    //Tab_Ativa : TTabSheet;
    lNaoConsiste, in_banco, in_calculo, in_forca_calculo, in_excluiu, in_abrindo_via, in_li_abrindo : Boolean;
    aMoedas : array [1..4] of String;
    aTaxas  : array [1..4] of Double;
    vl_old  : Double;
    //str_complemento : String[4];
    lCalculo : Boolean;
    procedure ValidaBtnDesp(Habilita : Boolean);
    function Consiste : Boolean;   
    function CarregaMarcacaoNestle(nr_processo, idioma : string) : String;
  end;

var
  frm_exp_capa: Tfrm_exp_capa;
  iDoc : Boolean;

implementation

uses GSMLIB, PGGP001, PGGP017, PGPE018, PGPE020, PGPE021, uExpMontaRe, uReCapa, dReCapa,
  uExpIntegraRAP, uExpIntegraRAP_Normas, Math, uConsulta, uImportarPlanilhaPetronasExp;
{ PGSM096,  PGSM103, PGSM104, PGSM046, PGSM019, PGSM148, PGSM126, PGSM014, PGSM041, PGGP015,
PGGP018, PGSM059, PGSM006, PGSM136, PGSM162, PGSM051, PGSM136, uCatalogoEnderecos;}
{$R *.DFM}

function ConsisteMotivo: Boolean;
begin
  ConsisteMotivo := True;
  if Trim(frm_exp_capa.edtNomeEtapa.Text) = '' then
  begin
    MessageDlg('Status não encontrado ou inválido!',mtError,[mbOK],0);
    frm_exp_capa.edtCodigoEtapa.SetFocus;
    ConsisteMotivo := False;
    Exit;
  end;
end;


function NumStatus: integer;
begin
     with TQuery.Create(application) do begin
        Databasename := 'DBBROKER';
        try
          //Query do 'Controle de Status do Processo'//

          SQL.Clear;
          SQL.Add('SELECT MAX(F.CD_FOLLOWUP_ETAPA)');
          SQL.Add('FROM TFOLLOWUP_ETAPA F (NOLOCK)');
          SQL.Add('WHERE F.NR_PROCESSO = '''+frm_exp.edt_nm_unid_neg.Text+'02' +  frm_exp_capa.mskedt_nr_processo.Text + '''');
          Open;

          if Eof then
            Result := 1
          else
            Result := Fields[0].AsInteger + 1;

        finally
        Free;
        end;
   end;
end;

procedure Tfrm_exp_capa.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  if ( pgctrl_exp_capa.ActivePage <> tbsht_capa_05 ) and
     ( pgctrl_exp_capa.ActivePage <> tbsht_capa_07 ) and
     ( pgctrl_exp_capa.ActivePage <> ts_despacho ) and
     ( pgctrl_exp_capa.ActivePage <> ts_pedido ) then
  begin
    if ( Not (lCalculo) ) and ( btn_calculo.Enabled ) then
    begin
      // A linha abaixo foi substituida pelo calculo, pois criavam o RE sem calcular e ficavam com valores zerados - Michel - 23/01/2009
      //BoxMensagem( 'Processo deverá ser calculado !!', 3 );
      btn_calculoClick(btn_calculo);
      frm_exp_capa.SetFocus;
      Exit;
    end;
  end;

  if VerAlt then
  begin
    with datm_exp_capa do
    begin
      nr_processo_gestao := datm_exp_capa.qry_exp_NR_PROCESSO.AsString;

      qry_exp_.Close;
      qry_tp_frete_.Close;
      qry_via_transporte_.Close;
      qry_forma_pagto_.Close;
      qry_lingua_.Close;
      qry_tp_pessoa_exp_.Close;
      qry_ttp_pos_ad_.Close;

      qry_processo_.Close;
      qry_emp_est_.Close;
      qry_emp_nac_.Close;
      qry_item_.Close;
      qry_ret_obs_imp_.Close;
      qry_exp_nf_.Close;
      qry_exec_sp_.Close;
      qry_ret_tot_despesa_.Close;
      qry_exp_itens_.Close;
      qry_exp_tot_desp_.Close;
      qry_exp_verif_nf_.Close;
      qry_exp_re_.Close;
      qry_exp_verif_re_.Close;
      qry_exp_desp_.Close;
      qry_exp_ped_.Close;
      qry_dde_re_.Close;
      qry_dde_nf_.Close;
      qry_taxa_.Close;

      Free;
    end;
    Action := caFree
  end
  else
  begin
    Action := caNone;
    Exit;
  end;
  Screen.Cursor := crArrow;
  Criando_exp := False;
end;

procedure Tfrm_exp_capa.FormCreate(Sender: TObject);
begin
  Screen.Cursor := crHourGlass;
  Application.ProcessMessages;
  Application.CreateForm( Tdatm_exp_capa, datm_exp_capa );

  with datm_exp_capa do
  begin
    qry_tp_frete_.Close;
    qry_tp_frete_.Open;

    qry_via_transporte_.Close;
    qry_via_transporte_.Open;

    qry_forma_pagto_.Close;
    qry_forma_pagto_.Open;

    qry_lingua_.Close;
    qry_lingua_.Open;

    qry_tp_pessoa_exp_.Close;
    qry_tp_pessoa_exp_.Open;

    qry_ttp_pos_ad_.Close;
    qry_ttp_pos_ad_.Open;

    qry_item_.Close;
    qry_item_.Open;

    qry_emp_nac_.Close;
    qry_emp_nac_.Open;

    qry_emp_est_.Close;
    qry_emp_est_.Open;

    qry_embalagem_.Close;
    qry_embalagem_.Open;

  end;
end;

procedure Tfrm_exp_capa.FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if key = 27 then btn_sairClick(nil);
end;

procedure Tfrm_exp_capa.FormShow(Sender: TObject);
begin
  pnl_cadastro.Color := clMenuBroker;
  in_excluiu  := False;
  lCalculo := True;
  tbsht_capa_04.TabVisible := False;  // inibido 24/11/2005 - Aba Despesas
  tbsht_capa_05.TabVisible := False;  // inibido 04/01/2006 - Aba RE
  ts_despacho.TabVisible   := False;  // inibido 25/07/2007 - Aba Despacho

  if Criando_exp then str_nr_processo := '';

  pgctrl_exp_capa.ActivePage := tsBasicas;

  if Trim( str_nr_processo ) = '' then
  begin
    Desabilita_Entrada;
    lbl_processo.Enabled       := True;
    mskedt_nr_processo.Enabled := True;
    mskedt_nr_processo.SetFocus;
    btn_co_proc_new.Enabled    := True;
    btn_itens_exp.Enabled      := False;
    Exit;
  end;

  mskedt_nr_processo.Text     := Copy(Trim( str_nr_processo ), 5, 14 );
  mskedt_nr_processo.Color    := clMenu;
  mskedt_nr_processo.ReadOnly := True;
  mskedt_nr_processo.TabStop  := False;

  frm_exp_capa.Caption := 'Processo de Exportação [ ' + Copy(Trim( str_nr_processo ), 5, 14) + ' ] ';

  // Alterado para centralizar as integrações - Michel - 02/02/2011
  //define a variavel VGrupo para não fazer varios selects da mesma coisa
  AtualizaBotoesIntegracao;
  
  AbreTabelas;

  BloqueiaCamposRAP(datm_exp_capa.qry_exp_NR_PROCESSO.AsString);

  mskedt_nr_processoExit(nil);
end;
                                                       
procedure Tfrm_exp_capa.AbreTabelas;
begin

  with datm_exp_capa do
  begin
    qry_exp_.Close;
    qry_exp_.ParamByName('NR_PROCESSO').AsString := str_nr_processo;
    qry_exp_.Open;

    datm_exp_capa.qry_acordo_.Close;
    datm_exp_capa.qry_acordo_.SQL.Text := 'SELECT A.* FROM TACORDO A '+
      'INNER JOIN TACORDO_PAIS P ON P.CD_ACORDO=A.CODIGO '+
      'WHERE P.CD_PAIS  = :CD_PAIS and IN_ATIVO = ''1'' ';
    datm_exp_capa.qry_acordo_.ParamByName('CD_PAIS').AsString := datm_exp_capa.qry_exp_CD_PAIS_DESTINO.AsString;
    datm_exp_capa.qry_acordo_.Open;


    if datm_exp_capa.qry_exp_TX_LOGOMARCA.AsString = 'logo_sg0.jpg' then cbblogomarca.ItemIndex := 0
    else if datm_exp_capa.qry_exp_TX_LOGOMARCA.AsString = 'logo_sg1.jpg' then cbblogomarca.ItemIndex := 1
    else if datm_exp_capa.qry_exp_TX_LOGOMARCA.AsString = 'logo_sg2.jpg' then cbblogomarca.ItemIndex := 2
    else if datm_exp_capa.qry_exp_TX_LOGOMARCA.AsString = 'logo_sg3.jpg' then cbblogomarca.ItemIndex := 3
    else cbblogomarca.ItemIndex := -1;


    if bCriando then
    begin
      qry_exp_.Edit;
      Zera_Numero;
      qry_exp_.Cancel;
    end;

    VerificaEstado(False);

    dbrgrp_fabr_expoChange(nil);

    qry_exp_itens_.Close;
    qry_exp_itens_.ParamByName('NR_PROCESSO').AsString := str_nr_processo;
    qry_exp_itens_.Open;

    if not (qry_exp_itens_.EOF) then
      btn_calculo.Enabled := True
    else
      btn_calculo.Enabled := False;

    qry_exp_itens_.Close;

    qry_cliente_habilitacao_.Close;
    qry_cliente_habilitacao_.ParamByName('NR_PROCESSO').AsString := qry_exp_NR_PROCESSO.AsString;
    qry_cliente_habilitacao_.Open;

    if (qry_cliente_habilitacao_.FieldByName('IN_NUM_FAT_EXP_AUT').AsString = '1') and
      (qry_exp_.FieldByName('IN_NUM_FAT_AUTO').AsString = '1') then
    begin
      dbedt_nr_fatura.ReadOnly := True;
      dbedt_nr_fatura.TabStop  := False;
      dbedt_nr_fatura.Color    := clMenu;
      dbedt_dt_fatura.ReadOnly := True;
      dbedt_dt_fatura.TabStop  := False;
      dbedt_dt_fatura.Color    := clMenu;
      dbchkbx_num_fat_auto.Checked := True;
    end
    else
    begin
      dbedt_nr_fatura.ReadOnly := False;
      dbedt_nr_fatura.TabStop  := True;
      dbedt_nr_fatura.Color    := clWindow;
      dbedt_dt_fatura.ReadOnly := False;
      dbedt_dt_fatura.TabStop  := True;
      dbedt_dt_fatura.Color    := clWindow;
      dbchkbx_num_fat_auto.Checked := false;
    end;
  end;
end;

procedure Tfrm_exp_capa.BloqueiaCamposRAP(pNrProc: string);
begin
  if StrToIntDef(ConsultaLookUpSQL(' SELECT COUNT(*) AS CONT FROM MYINDAIA.DBO.TRAP (NOLOCK) WHERE NR_PROCESSO = ''' + pNrProc + ''' AND ((CD_STATUS_DOCTO = ''3'') OR (CD_STATUS = ''3'')) ', 'CONT'), 0) > 0 then
  begin
    //capa
    dbedt_cd_exportador.ReadOnly := True;
    cbbLogomarca.Enabled := false;
   // dbrgrp_fabr_expo.ReadOnly := True;
  //  dbedt_cd_fabricante.ReadOnly := True;
    dbedt_cd_pais_destino.ReadOnly := True;

  //  dbedt_nr_fatura.ReadOnly := True;

    dbedt_perc_comissao.ReadOnly := True;
//    dbedt_dt_fatura.ReadOnly := True;

//    dbedt_cd_consignatario.ReadOnly := True; // by carlos - 06/07/2011
//    dbedt_cd_notificado1.ReadOnly := True;
    dblck_via_transp.ReadOnly := True;
    //dbedt_cd_local_origem.ReadOnly := True;
    dbedt_cd_local_origem.ReadOnly := (datm_exp_capa.qry_exp_CD_LOCAL_ORIGEM.AsString <> '0923') and (datm_exp_capa.qry_exp_CD_LOCAL_ORIGEM.AsString <> ''); // Alterado para liberar campo se for *** A DEFINIR *** (0923)
//    dbedt_cd_local_destino.ReadOnly := True;
//    dbedt_cd_incoterm.ReadOnly := True;
//    dbedt_cd_transportadora.ReadOnly := True;
//    dbm_decl_adicional_inst_emb.ReadOnly := True;
//    dbm_marc_volumes.ReadOnly := True;
//    dbedt_cd_banco_saque_bordero.ReadOnly := True;//comentado por agatha nigro 03/05/2018
//    dblkcbox_notificado1.ReadOnly := True;
//    dblkcbox_consignatario.ReadOnly := True;
    if VGrupo = '155' then
    begin
      dbedt_cd_importador.ReadOnly  := false;
      dbedt_cd_termo_pagto.ReadOnly := false;
      btn_co_importador.enabled     := true;
      btn_co_termo_pagto.enabled    := true;
      dbedt_cd_importador.Color     := clWindow;
      dbedt_cd_termo_pagto.color    := clWindow;

    end
    else
    begin
      dbedt_cd_importador.ReadOnly  := True;
      dbedt_cd_termo_pagto.ReadOnly := True;
      btn_co_importador.enabled     := False;
      btn_co_termo_pagto.enabled    := false;      
      dbedt_cd_importador.Color     := clMenu;
      dbedt_cd_termo_pagto.color    := clMenu;
    end;

   if (datm_exp_capa.qry_exp_CD_LOCAL_ORIGEM.AsString = '0923') or (datm_exp_capa.qry_exp_CD_LOCAL_ORIGEM.AsString = '') then // IF incluido para liberar campo se for *** A DEFINIR *** (0923)
    begin
      dbedt_cd_local_origem.Color := clWindow;
      dbedt_cd_termo_pagto.Color  := clWindow;
    end;


    dbedt_dt_abertura.ReadOnly := True;
    dbedt_tot_pl.ReadOnly := True;
    dbedt_tot_pb.ReadOnly := True;
    dbedt_vl_frete_intern.ReadOnly := True;
    dbedt_vl_seguro.ReadOnly := True;
    dbedt_vl_inland_freight.ReadOnly := True;
    dbedt_vl_acrescimo.ReadOnly := True;
    dbedt_vl_desconto.ReadOnly := True;
    dbedt_vl_cubagem.ReadOnly := True;
    dbedt_vl_comissao_agente.ReadOnly := True;
    dbedt_qt_total_prod.ReadOnly := True;
    dbedt_cd_moeda.ReadOnly := True;
    //pedido
    dbedt_nr_pedido.ReadOnly := True;
//    dbedt_nr_fatura_ped.ReadOnly := True;
//    dbm_tx_marcacao_volume_ped.ReadOnly := True;
//    dbm_tx_inf_embalagem_ped.ReadOnly := True;

    //capa
    dbedt_cd_exportador.Color := clMenu;
    cbbLogomarca.Color := clMenu;
//    dbrgrp_fabr_expo.Color := clMenu;
    dbedt_cd_fabricante.Color := clMenu;
    dbedt_cd_pais_destino.Color := clMenu;
//    dbedt_nr_fatura.Color := clMenu;
    dbedt_perc_comissao.Color := clMenu;
//    dbedt_dt_fatura.Color := clMenu;

//    dbedt_cd_consignatario.Color := clMenu;
//    dbedt_cd_notificado1.Color := clMenu;
    dblck_via_transp.Color := clMenu;



//    dbedt_cd_local_destino.Color := clMenu;
//    dbedt_cd_incoterm.Color := clMenu;
//    dbedt_cd_transportadora.Color := clMenu;
//    dbm_decl_adicional_inst_emb.Color := clMenu;
//    dbm_marc_volumes.Color := clMenu;
//    dbedt_cd_banco_saque_bordero.Color := clMenu; //comentado por agatha nigro 03/05/2018
//    dblkcbox_notificado1.Color := clMenu;
//    dblkcbox_consignatario.Color := clMenu;
      
    dbedt_dt_abertura.Color := clMenu;
    dbedt_tot_pl.Color := clMenu;
    dbedt_tot_pb.Color := clMenu;
    dbedt_vl_frete_intern.Color := clMenu;
    dbedt_vl_seguro.Color := clMenu;
    dbedt_vl_inland_freight.Color := clMenu;
    dbedt_vl_acrescimo.Color := clMenu;
    dbedt_vl_desconto.Color := clMenu;
    dbedt_vl_cubagem.Color := clMenu;
    dbedt_vl_comissao_agente.Color := clMenu;
    dbedt_qt_total_prod.Color := clMenu;
    dbedt_cd_moeda.Color := clMenu;
    //pedido
    dbedt_nr_pedido.Color := clMenu;
//    dbedt_nr_fatura_ped.Color := clMenu;
//    dbm_tx_marcacao_volume_ped.Color := clMenu;
//    dbm_tx_inf_embalagem_ped.Color := clMenu;

    //botões
    btn_co_exportador.enabled := False;

//    btn_co_destino.enabled := False;
    if (datm_exp_capa.qry_exp_CD_LOCAL_ORIGEM.AsString = '0923') or (datm_exp_capa.qry_exp_CD_LOCAL_ORIGEM.AsString = '') then // IF incluido para liberar campo se for *** A DEFINIR *** (0923)
      btn_co_origem.enabled := True
    else
      btn_co_origem.enabled     := False;

    btn_co_pais_destino.enabled := False;
//    btn_co_incoterm.enabled     := False;
//    btn_co_termo_pagto.enabled  := False;
//    btn_co_fabricante.enabled     := False;
//    btn_co_consignatario.enabled  := False;
//    btn_co_notificado1.enabled    := False;
//    btn_co_transportadora.enabled := False;
    //btn_co_banco_saque_bordero.enabled := False; //comentado por agatha nigro 03/05/2018
    btn_co_moeda.enabled := False;
  end;
end;

procedure Tfrm_exp_capa.btn_incluirClick(Sender: TObject);
begin
  with datm_exp_capa do begin
    if pgctrl_exp_capa.ActivePage = tbsht_capa_04 then
    begin
      qry_exp_desp_.Close;
      qry_exp_desp_.ParamByName('NR_PROCESSO').AsString := str_nr_processo;
      qry_exp_desp_.Open;

      qry_exp_tot_desp_.Close;
      qry_exp_tot_desp_.ParamByName('NR_PROCESSO').AsString := str_nr_processo;
      qry_exp_tot_desp_.Open;

      qry_exp_desp_.Insert;
      qry_exp_desp_NR_PROCESSO.AsString  := str_nr_processo;

      if qry_exp_tot_desp_TOTAL.AsFloat <> 0 then
        qry_exp_desp_NR_SEQUENCIA.AsString := StrZero( qry_exp_tot_desp_TOTAL.AsFloat + 1, 5 )
      else
        qry_exp_desp_NR_SEQUENCIA.AsString := '00001';

      NullToZero( qry_exp_desp_VL_DESPESA );

      VerificaDesp( True );
      qry_exp_.Edit;
      qry_exp_IN_DECL_AD_INSTR_EMB.AsString    := '1';
      qry_exp_IN_DECL_AD_PACKING_LIST.AsString := '1';
      qry_exp_IN_REFERENCIA_FAT_INST.AsString  := '0';

      dbedt_cd_item.SetFocus;
    end
    else
    if pgctrl_exp_capa.ActivePage = tbsht_capa_05 then
    begin
      qry_exp_re_.Close;
      qry_exp_re_.ParamByName('NR_PROCESSO').AsString := str_nr_processo;
      qry_exp_re_.Open;

      qry_exp_re_.Insert;
      qry_exp_re_NR_PROCESSO.AsString  := str_nr_processo;
      qry_exp_re_DT_RE.AsDateTime      := StrToDate( DateToStr( Date ) );

      VerificaDesp( True );
      dbedt_nr_re.SetFocus;
    end
    else
    if pgctrl_exp_capa.ActivePage = tbsht_capa_07 then
    begin
      qry_exp_nf_.Close;
      qry_exp_nf_.ParamByName('NR_PROCESSO').AsString := str_nr_processo;
      qry_exp_nf_.Open;

      qry_exp_nf_.Insert;
      qry_exp_nf_NR_PROCESSO.AsString  := str_nr_processo;

      VerificaDesp( True );
      dbedt_nr_nf.SetFocus;
    end
    else
    if pgctrl_exp_capa.ActivePage = ts_pedido then
    begin
      qryProcContainer.close;
      cdsProcContainer.close;
      qryProcContainer.ParamByName('NR_PROCESSO').AsString := str_nr_processo;
      qryProcContainer.open;
      cdsProcContainer.open;

      qry_exp_ped_.Close;
      qry_exp_ped_.ParamByName('NR_PROCESSO').AsString := str_nr_processo;
      qry_exp_ped_.Open;

      qry_exp_ped_.Insert;
      qry_exp_ped_NR_PROCESSO.AsString  := str_nr_processo;

      VerificaDesp( True );
      dbedt_nr_pedido.SetFocus;
    end
    else
    if pgctrl_exp_capa.ActivePage = ts_despacho then
    begin
      if pgctrl_despacho.ActivePage = ts_dde_re then
      begin
        qry_dde_re_.Close;
        qry_dde_re_.ParamByName('NR_PROCESSO').AsString := str_nr_processo;
        qry_dde_re_.Open;

        qry_dde_re_.Insert;
        qry_dde_re_NR_PROCESSO.AsString  := str_nr_processo;

        VerificaDesp( True );
        dbedt_nr_re1.SetFocus;
      end
      else
      if pgctrl_despacho.ActivePage = ts_dde_nf then
      begin
        qry_dde_nf_.Close;
        qry_dde_nf_.ParamByName('NR_PROCESSO').AsString := str_nr_processo;
        qry_dde_nf_.Open;

        qry_dde_nf_.Insert;
        qry_dde_nf_NR_PROCESSO.AsString  := str_nr_processo;

        VerificaDesp( True );
        dbedt_nf_ini.SetFocus;
      end;
    end
    else
    if pgctrl_exp_capa.ActivePage = ts_NovoRe then
    begin
      if qry_controle_re.State in [dsBrowse] then
      begin
        dbgrd_NovoRe.Enabled := true;
        dbgrd_NovoRe.ReadOnly := false;
        qry_controle_re.Insert;
        dbgrd_NovoRe.SetFocus;
        ValidaBtnDesp(false);
      end;
    end;
  end;
end;

procedure Tfrm_exp_capa.btn_salvarClick(Sender: TObject);
begin
  ActiveControl := nil;
  if Not Consiste then Exit;
  if Not Grava    then Exit;

  BloqueiaCamposRAP(datm_exp_capa.qry_exp_NR_PROCESSO.AsString);

  btn_salvar.Enabled   := False;
  mi_salvar.Enabled    := False;
  btn_cancelar.Enabled := False;
  mi_cancelar.Enabled  := False;
  btn_excluir.Enabled  := True;
  mi_excluir.Enabled   := True;
  btn_itens_exp.Enabled:= True;
  mi_itens_exp.Enabled := True;

  pgctrl_exp_capa.SetFocus;
  Criando_exp := False;
end;

procedure Tfrm_exp_capa.btn_cancelarClick(Sender: TObject);
begin
  if (pgctrl_exp_capa.ActivePage = tsBasicas) or
     (pgctrl_exp_capa.ActivePage = tbsht_capa_02) or
     (pgctrl_exp_capa.ActivePage = tbsht_capa_03) then
    Criando_exp := False;

  Cancelar;
end;

procedure Tfrm_exp_capa.btn_excluirClick(Sender: TObject);
var
  Nr_Seq : String[5];
begin
  if ( pgctrl_exp_capa.ActivePage <> tbsht_capa_04 ) and
     ( pgctrl_exp_capa.ActivePage <> ts_NovoRe ) and
     ( pgctrl_exp_capa.ActivePage <> tbsht_capa_05 ) and
     ( pgctrl_exp_capa.ActivePage <> tbsht_capa_07 ) and
     ( pgctrl_exp_capa.ActivePage <> ts_despacho )   and
     ( pgctrl_exp_capa.ActivePage <> ts_pedido ) then
  begin
    if BoxMensagem('Deseja excluir o Processo [ ' + Copy(Trim( str_nr_processo ), 5, 14 ) + '] ?', 1 ) then
    begin
      datm_exp_capa.qry_exp_.Close;

      try
        datm_main.db_broker.StartTransaction;
        datm_exp_capa.qry_exec_sp_.SQL.Clear;
        datm_exp_capa.qry_exec_sp_.SQL.Add( 'EXEC sp_exp_exclui "' + str_nr_processo + '"' );
        datm_exp_capa.qry_exec_sp_.ExecSQL;

        datm_main.db_broker.Commit;

        datm_exp_capa.VerificaEstado(False);
      except
        on E: Exception do
        begin
          frm_exp_capa.btn_cancelarClick(nil);
          if datm_main.db_broker.InTransaction then datm_main.db_broker.Rollback;
          TrataErro(E);
        end;
      end;
      in_excluiu := True;
      Close;
    end;
  end
  else if pgctrl_exp_capa.ActivePage = tbsht_capa_04 then
  begin
    if BoxMensagem( 'Deseja realmente excluir esta despesa?', 1 ) then
    begin
      lCalculo := False;
      btn_calculo.Enabled  := True;

      Nr_Seq := datm_exp_capa.qry_exp_desp_NR_SEQUENCIA.AsString;

      datm_exp_capa.qry_exp_desp_.Close;

      with datm_exp_capa do
      begin
        try
          datm_main.db_broker.StartTransaction;

          datm_exp_capa.qry_exec_sp_.SQL.Clear;
          datm_exp_capa.qry_exec_sp_.SQL.Add( 'EXEC sp_exp_apaga_renum_desp "' + str_nr_processo + '","' + Nr_Seq + '"' );
          datm_exp_capa.qry_exec_sp_.ExecSQL;

          qry_ret_tot_despesa_.Close;
          qry_ret_tot_despesa_.ParamByName('NR_PROCESSO').AsString := str_nr_processo;
          qry_ret_tot_despesa_.Open;

          qry_exp_.Edit;
          qry_exp_VL_TOT_DESPESA.AsFloat := qry_ret_tot_despesa_TOTAL.AsFloat;
          qry_exp_.Post;

          datm_main.db_broker.Commit;
        Except
          on E: Exception do
             begin
               if datm_main.db_broker.InTransaction then datm_main.db_broker.Rollback;
               TrataErro(E);
             end;
        end;

        qry_exp_desp_.Close;
        qry_exp_desp_.ParamByName('NR_PROCESSO').AsString := str_nr_processo;
        qry_exp_desp_.Open;

        ValidaBtnDesp( True );
        btn_calculo.Enabled  := True;

        if qry_exp_desp_.EOF then
        begin
          btn_excluir.Enabled := False;
          mi_excluir.Enabled  := False;
          VerificaDesp( False )
        end
        else VerificaDesp( True );
      end;
    end;
  end
  else if pgctrl_exp_capa.ActivePage = tbsht_capa_05 then
  begin
    if BoxMensagem( 'Deseja realmente excluir este RE?', 1 ) then
    begin
      datm_exp_capa.qry_exp_re_.Delete;

      datm_exp_capa.qry_exp_re_.Close;
      datm_exp_capa.qry_exp_re_.ParamByName('NR_PROCESSO').AsString := str_nr_processo;
      datm_exp_capa.qry_exp_re_.Open;

      ValidaBtnDesp( True );

      if datm_exp_capa.qry_exp_re_.EOF then
      begin
        btn_excluir.Enabled := False;
        mi_excluir.Enabled  := False;
        VerificaDesp( False )
      end
      else VerificaDesp( True );
    end;
  end
  else  if pgctrl_exp_capa.ActivePage = tbsht_capa_07 then
  begin
    if StrTointDef(ConsultaLookUpSQL('SELECT COUNT(*) AS CONT FROM TPROCESSO_EXP_ITEM (NOLOCK) ' +
                                     ' WHERE NR_PROCESSO = "' + datm_exp_capa.qry_exp_NR_PROCESSO .AsString + '" '+
                                     '   AND NR_NF = "' + datm_exp_capa.qry_exp_nf_NR_NF.AsString + '" ', 'CONT'), 0) = 0 then begin
      if BoxMensagem( 'Deseja realmente excluir esta NF?', 1 ) then
      begin
        datm_exp_capa.qry_exp_nf_.Delete;

        datm_exp_capa.qry_exp_nf_.Close;
        datm_exp_capa.qry_exp_nf_.ParamByName('NR_PROCESSO').AsString := str_nr_processo;
        datm_exp_capa.qry_exp_nf_.Open;

        ValidaBtnDesp( True );

        if datm_exp_capa.qry_exp_nf_.EOF then
        begin
          btn_excluir.Enabled := False;
          mi_excluir.Enabled  := False;
          VerificaDesp( False )
        end
        else VerificaDesp( True );
      end;
    end else begin
      Application.MessageBox(PChar('Esta nota está relacionada com um ou mais itens do Processo de Exportação' + #13#10 +
                                   'e nao poderá ser excluída! Verifique os Itens deste Processo!'), 'Exclusão de Nota Fiscal', MB_OK + MB_ICONERROR);
      Exit;
    end;
  end
  else if (pgctrl_exp_capa.ActivePage = ts_NovoRe) then
  begin
    if BoxMensagem( 'Este RE será excluído!' + #13#10 + 'Confirma exclusão?', 1 ) then
    try
      datm_main.db_broker.StartTransaction;
      datm_exp_capa.qry_controle_re.Delete;
      datm_main.db_broker.Commit;
      with datm_exp_capa do
      begin
        if qry_controle_re.IsEmpty then
        begin
          dbgrd_NovoRe.Enabled := false;
        end
        else ValidabtnDesp(True);
      end;
    except
      on E: Exception do
      begin
        datm_exp_capa.qry_controle_re.Cancel;
        if datm_main.db_broker.InTransaction then datm_main.db_broker.Rollback;
        TrataErro(E);
      end;
    end;
  end
  else
  if pgctrl_exp_capa.ActivePage = ts_pedido then
  begin
    if BoxMensagem( 'Deseja realmente excluir este Pedido?', 1 ) then
    begin
      datm_exp_capa.qry_exp_ped_.Delete;


      datm_exp_capa.qry_exp_ped_.Close;
      datm_exp_capa.qry_exp_ped_.ParamByName('NR_PROCESSO').AsString := str_nr_processo;
      datm_exp_capa.qry_exp_ped_.Open;

      ValidaBtnDesp( True );

      if datm_exp_capa.qry_exp_ped_.EOF then
      begin
        btn_excluir.Enabled := False;
        mi_excluir.Enabled  := False;
        VerificaDesp( False )
      end
      else VerificaDesp( True );
    end;
  end
  else if pgctrl_exp_capa.ActivePage = ts_despacho then
  begin
    if pgctrl_despacho.ActivePage = ts_dde_re then
    begin
      if BoxMensagem( 'Deseja realmente excluir este RE?', 1 ) then
      begin
        datm_exp_capa.qry_dde_re_.Delete;

        datm_exp_capa.qry_dde_re_.Close;
        datm_exp_capa.qry_dde_re_.ParamByName('NR_PROCESSO').AsString := str_nr_processo;
        datm_exp_capa.qry_dde_re_.Open;

        VerificaDesp( not datm_exp_capa.qry_dde_re_.EOF );
        btn_excluir.Enabled := not datm_exp_capa.qry_dde_re_.EOF;
        mi_excluir.Enabled  := not datm_exp_capa.qry_dde_re_.EOF;
      end;
    end
    else
    begin
      if pgctrl_despacho.ActivePage = ts_dde_nf then
      begin
        if BoxMensagem( 'Deseja realmente excluir esta Nota Fiscal?', 1 ) then
        begin
          datm_exp_capa.qry_dde_nf_.Delete;

          datm_exp_capa.qry_dde_nf_.Close;
          datm_exp_capa.qry_dde_nf_.ParamByName('NR_PROCESSO').AsString := str_nr_processo;
          datm_exp_capa.qry_dde_nf_.Open;

          VerificaDesp( not datm_exp_capa.qry_dde_nf_.EOF );
          btn_excluir.Enabled := not datm_exp_capa.qry_dde_nf_.EOF;
          mi_excluir.Enabled  := not datm_exp_capa.qry_dde_nf_.EOF;
        end;
      end;
    end;
  end;
end;

procedure Tfrm_exp_capa.btn_itens_expClick(Sender: TObject);
begin
  if ( pgctrl_exp_capa.ActivePage <> tbsht_capa_05 ) and
     ( pgctrl_exp_capa.ActivePage <> tbsht_capa_07 ) and
     ( pgctrl_exp_capa.ActivePage <> ts_despacho ) and
     ( pgctrl_exp_capa.ActivePage <> ts_pedido ) then
  begin
    if ( Not ( lCalculo ) ) and ( btn_calculo.Enabled ) then
    begin
      // A linha abaixo foi substituida pelo calculo, pois criavam o RE sem calcular e ficavam com valores zerados - Michel - 23/01/2009
      //BoxMensagem( 'Processo deverá ser calculado !!', 3 );
      btn_calculoClick(btn_calculo);
      frm_exp_capa.SetFocus;
      exit;
    end;
  end;
  Close;
  frm_exp.i_seletor := 2;
end;

procedure Tfrm_exp_capa.btn_calculoClick(Sender: TObject);
begin
  lCalculo := True;

  with TQuery.Create(Application) do
  begin
    DatabaseName := 'DBBROKER';
    SQL.Add(' SELECT COUNT(*)                    ');
    SQL.Add(' FROM   TPROCESSO_EXP_ITEM (NOLOCK) ');
    SQL.Add(' WHERE  NR_PROCESSO = :NR_PROCESSO  ');
    SQL.Add('   AND ISNULL(NR_PEDIDO, "") = ""   ');
    ParamByName('NR_PROCESSO').AsString := str_nr_processo;
    Open;
    if Fields[0].AsInteger > 0 then
    begin
      MessageDlg('Há ítens sem preenchimento do campo "Pedido do Imp./Fatura".'#13'Preencha e tente novamente.',
         mtError, [mbOk], 0);
      Close;
      Free;
      Exit;
    end;
    Close;
    Free;
  end;

  with datm_exp_capa do
  begin
    CloseStoredProc(sp_calcula_sda);
    sp_calcula_sda.ParamByName('@NR_PROCESSO').AsString  := str_nr_processo;
    ExecStoredProc(sp_calcula_sda);
    CloseStoredProc(sp_calcula_sda);
  end;

  with datm_exp_capa do begin
    qry_exp_.Close;
    try
      datm_main.db_broker.StartTransaction;

      CloseStoredProc(sp_exp_calcula);
      sp_exp_calcula.ParamByName('@nr_processo').AsString := str_nr_processo;
      ExecStoredProc(sp_exp_calcula);
      if sp_exp_calcula.ParamByName('Result').AsString = '1' then
        BoxMensagem( 'Peso Líquido deve ser menor ou igual ao Peso Bruto!', 2 );
      if sp_exp_calcula.ParamByName('Result').AsString = '2' then
        BoxMensagem( 'Valor de Nota Fiscal diferente do valor total das mercadorias!', 2 );
      CloseStoredProc(sp_exp_calcula);

      datm_main.db_broker.Commit;

      qry_exp_.Close;
      qry_exp_.ParamByName('NR_PROCESSO').AsString := str_nr_processo;
      qry_exp_.Open;
    except
      on E: Exception do
      begin
        frm_exp_capa.btn_cancelarClick(nil);
        if datm_main.db_broker.InTransaction then datm_main.db_broker.Rollback;
        TrataErro(E);
      end;
    end;
  end;
end;

procedure Tfrm_exp_capa.btn_manut_procClick(Sender: TObject);
begin
  nr_processo_gestao := datm_exp_capa.qry_exp_NR_PROCESSO.AsString;
  str_cd_rotina_atalho := '0102';

  if ( pgctrl_exp_capa.ActivePage <> tbsht_capa_05 ) and
     ( pgctrl_exp_capa.ActivePage <> tbsht_capa_07 ) and
     ( pgctrl_exp_capa.ActivePage <> ts_despacho ) and
     ( pgctrl_exp_capa.ActivePage <> ts_pedido ) then
  begin
    if ( Not ( lCalculo ) ) and ( btn_calculo.Enabled ) then
    begin
      // A linha abaixo foi substituida pelo calculo, pois criavam o RE sem calcular e ficavam com valores zerados - Michel - 23/01/2009
      //BoxMensagem( 'Processo deverá ser calculado !!', 3 );
      btn_calculoClick(btn_calculo);
      frm_exp_capa.SetFocus;
      Exit;
    end;
  end;
  frm_exp.i_seletor := 3;
  Close;
end;

procedure Tfrm_exp_capa.btn_sairClick(Sender: TObject);
begin
  if ( pgctrl_exp_capa.ActivePage <> tbsht_capa_05 ) and
     ( pgctrl_exp_capa.ActivePage <> tbsht_capa_07 ) and
     ( pgctrl_exp_capa.ActivePage <> ts_despacho ) and
     ( pgctrl_exp_capa.ActivePage <> ts_pedido ) then
  begin
    if ( Not ( lCalculo ) ) and ( btn_calculo.Enabled ) then
    begin
      // A linha abaixo foi substituida pelo calculo, pois criavam o RE sem calcular e ficavam com valores zerados - Michel - 23/01/2009
      //BoxMensagem( 'Processo deverá ser calculado !!', 3 );
      btn_calculoClick(btn_calculo);
      frm_exp_capa.SetFocus;
      Exit;
    end;
  end;
  str_cd_rotina_atalho := '';
  Close;
end;

procedure Tfrm_exp_capa.mskedt_nr_processoExit(Sender: TObject);
var
  vMsg: String;
  vqryLinguaProcesso: TQuery;
begin
  // Verifica o preenchimento dos evento 317 e 337 - Michel - 01/12/2008
  vMsg := ValidaInsPreEmbarque(frm_exp.msk_cd_unid_neg.Text + '02' + mskedt_nr_processo.Text);
  if vMsg <> '' then
    MessageDlg(vMsg, mtWarning, [mbOk], 0);

  if mskedt_nr_processo.ReadOnly then Exit;

  if mskedt_nr_processo.Text <> '' then
  begin
    with datm_exp_capa do
    begin
      if Copy( mskedt_nr_processo.Text,1,4 ) <> frm_exp.msk_cd_unid_neg.Text + '02' then
         mskedt_nr_processo.Text := frm_exp.msk_cd_unid_neg.Text + '02' + mskedt_nr_processo.Text;

      SetServicoNovo(mskedt_nr_processo.Text, datm_exp_capa);

      qry_processo_.Close;
      qry_processo_.ParamByName('NR_PROCESSO').AsString := mskedt_nr_processo.Text;
      qry_processo_.Open;

      if (qry_processo_.EOF) then
      begin
        mskedt_nr_processo.Text := Copy( mskedt_nr_processo.Text, 5, 14 );
        BoxMensagem( 'Nr. Processo inexistente !! ', 3 );
        mskedt_nr_processo.Text := '';
        mskedt_nr_processo.SetFocus;
        qry_processo_.Close;
        Exit;
      end;

      qry_exp_.Close;
      qry_exp_.ParamByName('NR_PROCESSO').AsString := mskedt_nr_processo.Text;
      qry_exp_.Open;

      if not (qry_exp_.EOF) then
      begin
        mskedt_nr_processo.Text := Copy( mskedt_nr_processo.Text, 5, 14 );
        BoxMensagem( 'Nr. Processo já existente !! ', 3 );
        mskedt_nr_processo.Text := '';
        Cancelar;
        Desabilita_Entrada;
        Exit;
      end;

      str_nr_processo             := mskedt_nr_processo.Text;
      mskedt_nr_processo.Text     := Copy( mskedt_nr_processo.Text, 5, 14 );
      mskedt_nr_processo.Color    := clMenu;
      mskedt_nr_processo.ReadOnly := True;
      mskedt_nr_processo.TabStop  := False;
      mskedt_nr_processo.Enabled  := True;

      frm_exp_capa.Caption := 'Processo de Exportação [ ' + Copy(Trim( str_nr_processo ),5,14) + ' ] ';

      //logomarca - apenas para SG
      with TQuery.Create(application) do
      begin
        DataBaseName := 'DBBroker';
        Close;
        SQL.Clear;
        SQL.Add('SELECT CD_GRUPO FROM TEMPRESA_NAC (NOLOCK) WHERE CD_EMPRESA IN (SELECT CD_CLIENTE FROM TPROCESSO (NOLOCK) WHERE NR_PROCESSO = "' + qry_exp_NR_PROCESSO.AsString + '") ');
        Open;
        if Fields[0].AsString = '028' then
        begin
          frm_exp_capa.cbblogomarca.Visible := True;
          frm_exp_capa.lblLogo.Visible := True;
          if qry_exp_TX_LOGOMARCA.AsString = 'logo_sg0.jpg' then frm_exp_capa.cbblogomarca.ItemIndex := 0
          else if qry_exp_TX_LOGOMARCA.AsString = 'logo_sg1.jpg' then frm_exp_capa.cbblogomarca.ItemIndex := 1
          else if qry_exp_TX_LOGOMARCA.AsString = 'logo_sg2.jpg' then frm_exp_capa.cbblogomarca.ItemIndex := 2
          else if qry_exp_TX_LOGOMARCA.AsString = 'logo_sg3.jpg' then frm_exp_capa.cbblogomarca.ItemIndex := 3;
        end
        else
        begin
          frm_exp_capa.cbblogomarca.Visible := false;
          frm_exp_capa.cbblogomarca.ItemIndex := -1;
          frm_exp_capa.lblLogo.Visible := false;
        end;
        Free;
      end;



      // Taxa da moeda
      qry_taxa_.Close;
      qry_taxa_.ParamByName('CD_MOEDA'). AsString := qry_processo_CD_MOEDA_MLE.AsString;
      qry_taxa_.Open;

      qry_exp_.Insert;

      qry_exp_NR_PROCESSO.AsString          := Trim(str_nr_processo);
      qry_exp_DT_REGISTRO_PEDIDO.AsDateTime := StrToDate( DateToStr( Date ) );
      // Grava campos da tabela TPROCESSO na TPROCESSO_EXP - 23/11/2005
      qry_exp_CD_PAIS_ORIG.AsString     := qry_processo_CD_PAIS_ORIGEM.AsString;
      qry_exp_CD_LOCAL_ORIGEM.AsString  := qry_processo_CD_LOCAL_EMBARQUE.AsString;
      qry_exp_CD_LOCAL_DESTINO.AsString := qry_processo_CD_LOCAL_DESEMBARQUE.AsString;
      qry_exp_CD_PAIS_DESTINO.AsString  := qry_processo_CD_PAIS_DESTINO.AsString;
      qry_exp_CD_TIPO_FRETE.AsString    := qry_processo_TP_FRETE.AsString;
      qry_exp_CD_REPRESENTANTE.AsString := qry_processo_CD_REPRESENTANTE.AsString;
      qry_exp_CD_MOEDA.AsString         := qry_processo_CD_MOEDA_MLE.AsString;
      qry_exp_NR_DDE.AsString           := qry_processo_NR_DDE.AsString;
      qry_exp_NR_FATURA.AsString        := qry_processo_NR_FATURA.AsString;
      qry_exp_CD_DESPACHANTE.AsString   := qry_processo_CD_DESPACHANTE.AsString;

      qry_exp_CD_AGENTE.AsString        := qry_processo_CD_AGENTE.AsString;

      if not (dbedt_cd_incoterm.Text = 'CIF') and
         not (dbedt_cd_incoterm.Text = 'DAF') and
         not (dbedt_cd_incoterm.Text = 'DES') and
         not (dbedt_cd_incoterm.Text = 'DDP') and
         not (dbedt_cd_incoterm.Text = 'CIP') and
         not (dbedt_cd_incoterm.Text = 'C+I') and
         not (dbedt_cd_incoterm.Text = 'CFR') and
         not (dbedt_cd_incoterm.Text = 'CPT') then
      begin
        if qry_processo_TP_FRETE.AsString = '0' then
          qry_exp_VL_FRETE.AsFloat          := qry_processo_VL_FRETE_COLLECT_MNEG.AsFloat
        else
          qry_exp_VL_FRETE.AsFloat          := qry_processo_VL_FRETE_PREPAID_MNEG.AsFloat;
      end;
      qry_exp_VL_TOT_FOB.AsFloat        := qry_processo_VL_MLE_MNEG.AsFloat;
      if qry_taxa_TX_CAMBIO.AsFloat <> 0 then
        qry_exp_VL_TOT_MCV.AsFloat        := ( qry_processo_VL_CIF_MN.AsFloat / qry_taxa_TX_CAMBIO.AsFloat );
      qry_exp_VL_PESO_BRUTO.AsFloat     := qry_processo_VL_PESO_BRUTO.AsFloat;
      qry_exp_VL_PESO_LIQUIDO.AsFloat   := qry_processo_VL_PESO_LIQUIDO.AsFloat;
      qry_exp_VL_SEGURO.AsFloat         := qry_processo_VL_SEGURO_MNEG.AsFloat;
      qry_exp_DT_REG_DDE.AsDateTime     := qry_processo_DT_REG_DDE.AsDateTime;
      qry_exp_IN_ETIQUETA.AsString      := qry_processo_IN_ETIQUETA.AsString;
      qry_exp_CD_IMPORTADOR.AsString    := qry_processo_CD_IMPORTADOR.AsString;
      qry_exp_CD_EXPORTADOR.AsString    := qry_processo_CD_EXPORTADOR.AsString;
      qry_exp_CD_VIA_TRANSPORTE.AsString:= qry_processo_CD_VIA_TRANSPORTE.AsString;
      qry_exp_CD_LINGUA_PEDIDO.AsString := qry_processo_CD_LINGUA_PAIS.AsString;

      {Atualiza o campo CD_LINGUA_PEDIDO(Processo e Processo de Exportação) de acordo com o país de destino da manutenção}
      vqryLinguaProcesso := TQuery.Create(application);
      try
        datm_main.db_broker.StartTransaction;
        try
          vqryLinguaProcesso.DataBaseName := 'DBBroker';
          vqryLinguaProcesso.Close;
          vqryLinguaProcesso.SQL.Clear;
          vqryLinguaProcesso.SQL.Add('UPDATE TPROCESSO SET CD_LINGUA_PEDIDO = :CD_LINGUA WHERE NR_PROCESSO = :NR_PROCESSO' + '") ');
          vqryLinguaProcesso.ParamByName('NR_PROCESSO').AsString := qry_exp_NR_PROCESSO.AsString;
          vqryLinguaProcesso.ParamByName('CD_LINGUA').AsString := qry_processo_CD_LINGUA_PAIS.AsString;
          vqryLinguaProcesso.ExecSQL;
          datm_main.db_broker.Commit;
        except
          datm_main.db_broker.Rollback;
        end;
      finally
        FreeAndNil(vqryLinguaProcesso);
      end;

      qry_processo_.Close;
      qry_taxa_.Close;
      Habilita_Entrada;
    end;

    Zera_Numero;
    dbedt_dt_abertura.SetFocus;
  end;

  btn_itens_exp.Enabled := True;
  btn_calculo.Enabled   := False;
  mi_excluir.Enabled    := False;
  btn_excluir.Enabled   := False;
  mi_itens_exp.Enabled  := False;
  btn_itens_exp.Enabled := False;
  dbchkbx_num_fat_auto.Checked := True;

  // Atualiza Botoes de Integração - Michel - 02/02/2011
  AtualizaBotoesIntegracao;  
end;

procedure Tfrm_exp_capa.dbedt_cd_exportadorExit(Sender: TObject);
begin
  CodExits;
  AtualizaBotoesIntegracao;
end;

procedure Tfrm_exp_capa.dbedt_cd_incotermExit(Sender: TObject);
begin
  CodExits;
  If datm_exp_capa.qry_exp_.State in [dsEdit,dsInsert] then
  begin
    If not (dbedt_cd_incoterm.Text = 'CIF') and
       not (dbedt_cd_incoterm.Text = 'DAF') and
       not (dbedt_cd_incoterm.Text = 'DES') and
       not (dbedt_cd_incoterm.Text = 'DDP') and
       not (dbedt_cd_incoterm.Text = 'CIP') and
       not (dbedt_cd_incoterm.Text = 'C+I') and
       not (dbedt_cd_incoterm.Text = 'CFR') and
       not (dbedt_cd_incoterm.Text = 'CPT') and
       not (dbedt_cd_incoterm.Text = 'DAP') then
    begin
      datm_exp_capa.qry_exp_VL_FRETE.AsFloat  := 0;
      datm_exp_capa.qry_exp_VL_SEGURO.AsFloat := 0;
    end;
  end;
end;

function Tfrm_exp_capa.Consiste:Boolean;
begin
  if pgctrl_exp_capa.ActivePage = tsBasicas then
  begin
    if datm_exp_capa.qry_exp_.State in [dsInsert, dsEdit] then
    begin
      // Exportador
      if dbedt_cd_exportador.Text <> '' then
      begin
        ValidCodigo( dbedt_cd_exportador );
        If lNaoConsiste = False then
        begin
          if ( edt_nm_exportador.Text = '' ) then
          begin
            BoxMensagem('Código do Exportador inválido !',2);
            pgctrl_exp_capa.ActivePage := tsBasicas;
            dbedt_cd_exportador.SetFocus;
            Consiste := False;
            Exit;
          end;
        end
        else
        begin
          datm_exp_capa.qry_emp_nac_.Locate('CD_EMPRESA', dbedt_cd_exportador.Text, [loCaseInsensitive]);
          if datm_exp_capa.qry_exp_CD_PAIS_ORIG.AsString = '' then
          begin
            if datm_exp_capa.qry_emp_nac_CD_EMPRESA.AsString = dbedt_cd_exportador.Text then
               datm_exp_capa.qry_exp_CD_PAIS_ORIG.AsString := '105';
          end;
        end;
      end;
      // Fabricante
      if dbedt_cd_fabricante.Enabled then
      begin
        if dbedt_cd_fabricante.Text <> '' then
        begin
          ValidCodigo( dbedt_cd_fabricante );
          If lNaoConsiste = False then
          begin
            if ( edt_nm_fabricante.Text = '' ) then
            begin
              BoxMensagem('Código do Fabricante inválido !',2);
              pgctrl_exp_capa.ActivePage := tsBasicas;
              dbedt_cd_fabricante.SetFocus;
              Consiste := False;
              Exit;
            end;
          end
          else
          begin
            datm_exp_capa.qry_emp_nac_.Locate('CD_EMPRESA', dbedt_cd_fabricante.Text, [loCaseInsensitive]);
            if datm_exp_capa.qry_exp_CD_PAIS_ORIGEM.AsString = '' then
            begin
              if datm_exp_capa.qry_emp_nac_CD_EMPRESA.AsString = dbedt_cd_fabricante.Text then
                 datm_exp_capa.qry_exp_CD_PAIS_ORIGEM.AsString := '105';
            end;
          end;
        end;
      end;
      // Importador
      if dbedt_cd_importador.Text = '' then
      begin
        ValidCodigo( dbedt_cd_importador );
        if lNaoConsiste = False then
        begin
        //Comentado para poder salvar sem por o codigo do importador 
          //if ( edt_nm_importador.Text = '' ) then
          //begin
            //BoxMensagem('Código do Importador inválido!',2);
            //pgctrl_exp_capa.ActivePage := tsBasicas;
            //dbedt_cd_importador.SetFocus;
            //Consiste := False;
            //Exit;
          //end;
        end
        else
        begin
          datm_exp_capa.qry_emp_est_.Locate('CD_EMPRESA', dbedt_cd_importador.Text, [loCaseInsensitive]);
          if datm_exp_capa.qry_exp_CD_PAIS_DESTINO.AsString = '' then
          begin
            if datm_exp_capa.qry_emp_est_CD_EMPRESA.AsString = dbedt_cd_importador.Text then
               datm_exp_capa.qry_exp_CD_PAIS_DESTINO.AsString := datm_exp_capa.qry_emp_est_CD_PAIS.AsString;
          end;
        end;
      end;
      // Local de Origem
      if dbedt_cd_local_origem.Text <> '' then
      begin
        ValidCodigo( dbedt_cd_local_origem );
        If lNaoConsiste = False then
        begin
          if ( edt_nm_local_origem.Text = '' ) then
          begin
            BoxMensagem('Código do Local de Origem inválido !',2);
            pgctrl_exp_capa.ActivePage := tsBasicas;
            dbedt_cd_local_origem.SetFocus;
            Consiste := False;
            Exit;
          end;
        end;
      end;
      // Local de Destino
      if dbedt_cd_local_destino.Text <> '' then
      begin
        ValidCodigo( dbedt_cd_local_destino );
        If lNaoConsiste = False then
        begin
          if ( edt_nm_local_destino.Text = '' ) then
          begin
            BoxMensagem('Código do Local de Destino inválido !',2);
            pgctrl_exp_capa.ActivePage := tsBasicas;
            dbedt_cd_local_destino.SetFocus;
            Consiste := False;
            Exit;
          end;
        end;
      end;
      // Pais de Origem
      if dbedt_cd_pais_orig.Text <> '' then
      begin
        ValidCodigo( dbedt_cd_pais_orig );
        If lNaoConsiste = False then
        begin
          if ( edt_nm_pais_orig.Text = '' ) then
          begin
            BoxMensagem('Código do País de Origem inválido !',2);
            pgctrl_exp_capa.ActivePage := tsBasicas;
            dbedt_cd_pais_orig.SetFocus;
            Consiste := False;
            Exit;
          end;
        end;
      end;
      // Pais de Destino Final
      if dbedt_cd_pais_destino.Text <> '' then
      begin
        ValidCodigo( dbedt_cd_pais_destino );
        If lNaoConsiste = False then
        begin
          if ( edt_nm_pais_destino.Text = '' ) then
          begin
            BoxMensagem('Código do País de Destino inválido !',2);
            pgctrl_exp_capa.ActivePage := tsBasicas;
            dbedt_cd_pais_destino.SetFocus;
            Consiste := False;
            Exit;
          end;
        end;
      end;
      // Enquadramento da Operação
      if dbedt_cd_enquad_op.Text <> '' then
      begin
        ValidCodigo( dbedt_cd_enquad_op );
        if Not lNaoConsiste then
        begin
          if ( edt_nm_enquad_op.Text = '' ) then
          begin
            BoxMensagem( 'Código do Enquadramento da Operação inválido !', 2 );
            pgctrl_exp_capa.ActivePage := tsBasicas;
            dbedt_cd_enquad_op.SetFocus;
            Consiste := False;
            Exit;
          end;
        end;
      end;
      // Incoterm
      if dbedt_cd_incoterm.Text <> '' then
      begin
        ValidCodigo( dbedt_cd_incoterm );
        If lNaoConsiste = False then
        begin
          {if ( dbedt_nm_incoterm.Text = '' ) then
          begin
            BoxMensagem('Código do Incoterm inválido!',2);
            pgctrl_exp_capa.ActivePage := tsBasicas;
            dbedt_cd_incoterm.SetFocus;
            Consiste := False;
            Exit;
          end; }
        end;
      end;
      // Instrumento de Negociacao
      if dbedt_cd_instr_neg.Text <> '' then
      begin
        ValidCodigo( dbedt_cd_instr_neg );
        If lNaoConsiste = False then
        begin
          if ( edt_nm_istr_neg.Text = '' ) then
          begin
            BoxMensagem('Código do Instrumento de Negociação inválido!',2);
            pgctrl_exp_capa.ActivePage := tsBasicas;
            dbedt_cd_instr_neg.SetFocus;
            Consiste := False;
            Exit;
          end;
        end;
      end;

      // Seguradora
      if dbedt_cd_seguradora.Text <> '' then
      begin
        ValidCodigo( dbedt_cd_seguradora );
        If lNaoConsiste = False then
        begin
          if ( edt_nm_seguradora.Text = '' ) then
          begin
            BoxMensagem('Código do Agente Comissão inválido!',2);
            pgctrl_exp_capa.ActivePage := tsBasicas;
            dbedt_cd_seguradora.SetFocus;
            Consiste := False;
            Exit;
          end;
        end;
      end;

      // URF de Despacho
      ValidCodigo( dbedt_cd_urf_despacho );
      if dbedt_cd_urf_despacho.Text <> '' then
      begin
        if ( edt_nm_urf_despacho.Text = '' ) then
        begin
          BoxMensagem('Código da URF de Despacho inválido!',2);
          pgctrl_exp_capa.ActivePage := tsBasicas;
          dbedt_cd_urf_despacho.SetFocus;
          Consiste := False;
          Exit;
        end;
      end;

      // URF de Embarque
      if dbedt_cd_urf_embarque.Text <> '' then
      begin
        ValidCodigo( dbedt_cd_urf_embarque );
        If lNaoConsiste = False then
        begin
          if ( edt_nm_urf_embarque.Text = '' ) then
          begin
            BoxMensagem('Código da URF de Embarque inválido!',2);
            pgctrl_exp_capa.ActivePage := tsBasicas;
            dbedt_cd_urf_embarque.SetFocus;
            Consiste := False;
            Exit;
          end;
        end;
      end;

      // Termo de Pagamento
      if dbedt_cd_termo_pagto.Text <> '' then
      begin
        ValidCodigo( dbedt_cd_termo_pagto );
        If lNaoConsiste = False then
        begin
          if ( edt_nm_termo_pagto.Text = '' ) then
          begin
            BoxMensagem('Termo de Pagamento inválido!',2);
            pgctrl_exp_capa.ActivePage := tsBasicas;
            dbedt_cd_termo_pagto.SetFocus;
            Consiste := False;
            Exit;
          end;
        end;
      end;

      // Moeda FOB
      if dbedt_cd_moeda.Text <> '' then
      begin
        ValidCodigo( dbedt_cd_moeda);
        If lNaoConsiste = False then
        begin
          if ( edt_nm_moeda.Text = '' ) then
          begin
            BoxMensagem('Código da Moeda inválido!',2);
            pgctrl_exp_capa.ActivePage := tsBasicas;
            dbedt_cd_moeda.SetFocus;
            Consiste := False;
            Exit;
          end;
        end;
      end;
    end;
  end
  else If pgctrl_exp_capa.ActivePage = tbsht_capa_03 then
  begin
    if datm_exp_capa.qry_exp_.State in [dsInsert, dsEdit] then
    begin
      // Agente de Carga
      ValidCodigo(dbedt_cd_agente_carga);
      If lNaoConsiste = False then
      begin
        if dbedt_cd_agente_carga.Text <> '' then
        begin
          if ( edt_nm_agente_carga.Text = '' ) then
          begin
            BoxMensagem('Código do Agende de Carga inválido!',2);
            pgctrl_exp_capa.ActivePage := tbsht_capa_03;
            dbedt_cd_agente_carga.SetFocus;
            Consiste := False;
            Exit;
          end;
        end;
      end;

      // Despachante
      if dbedt_cd_despachante.Text <> '' then
      begin
        ValidCodigo( dbedt_cd_despachante);
        If lNaoConsiste = False then
        begin
          if ( edt_nm_despachante.Text = '' ) then
          begin
            BoxMensagem('Código do Despachante inválido!',2);
            pgctrl_exp_capa.ActivePage := tbsht_capa_03;
            dbedt_cd_despachante.SetFocus;
            Consiste := False;
            Exit;
          end;
        end;
      end;

      // Transportador Internacional
      if dbedt_cd_transportadora.Text <> '' then
      begin
        ValidCodigo( dbedt_cd_transportadora);
        If lNaoConsiste = False then
        begin
          if ( edt_NmTransportadora.Text = '' ) then
          begin
            BoxMensagem('Código da Transportadora inválido!',2);
            pgctrl_exp_capa.ActivePage := tbsht_capa_03;
            dbedt_cd_transportadora.SetFocus;
            Consiste := False;
            Exit;
          end;
        end;
      end;

      // Banco para Borderô
      ValidCodigo( dbedt_cd_banco_saque_bordero );
      if Not lNaoConsiste then
      begin
        if dbedt_cd_banco_saque_bordero.Text <> '' then
        begin
          if ( edt_nm_banco_saque_bordero.Text = '' ) then
          begin
            BoxMensagem( 'Código do Banco Borderô Inválido!', 2 );
            pgctrl_exp_capa.ActivePage := tbsht_capa_03;
            dbedt_cd_banco_saque_bordero.SetFocus;
            Consiste := False;
            Exit;
          end;
        end;
      end;

      // Banco para Saque
      ValidCodigo( dbedtBcoSaque );
      if Not lNaoConsiste then
      begin
        if dbedtBcoSaque.Text <> '' then
        begin
          if ( edtBcoSaque.Text = '' ) then
          begin
            BoxMensagem( 'Código do Banco Saque Inválido!', 2 );
            pgctrl_exp_capa.ActivePage := tbsht_capa_03;
            dbedtBcoSaque.SetFocus;
            Consiste := False;
            Exit;
          end;
        end;
      end;

      // Representante
      if dbedt_cd_representante.Text <> '' then
      begin
        ValidCodigo( dbedt_cd_representante );
        If lNaoConsiste = False then
        begin
          if ( edt_nm_representante.Text = '' ) then
          begin
            BoxMensagem('Código do Representante inválido !',2);
            pgctrl_exp_capa.ActivePage := tbsht_capa_03;
            dbedt_cd_representante.SetFocus;
            Consiste := False;
            Exit;
          end;
        end;
      end;
    end;
  end
  else if pgctrl_exp_capa.ActivePage = tbsht_capa_04 then
  begin
    if datm_exp_capa.qry_exp_desp_.State in [dsInsert, dsEdit] then
    begin
      // Item
      if dbedt_cd_item.Text <> '' then
      begin
        ValidCodigo( dbedt_cd_item);
        if lNaoConsiste = False then
        begin
          if ( edt_nm_item.Text = '' ) then
          begin
            BoxMensagem('Código da Item inválido!',2);
            pgctrl_exp_capa.ActivePage := tbsht_capa_04;
            dbedt_cd_item.SetFocus;
            Consiste := False;
            Exit;
          end;
        end;
      end;
    end;
  end
  else if pgctrl_exp_capa.ActivePage = tbsht_capa_05 then
  begin
    if datm_exp_capa.qry_exp_re_.State in [dsInsert, dsEdit] then
    begin
      if dbedt_nr_re.Text = '' then
      begin
        BoxMensagem('No. do RE deve ser preenchido !',2);
        pgctrl_exp_capa.ActivePage := tbsht_capa_05;
        dbedt_nr_re.SetFocus;
        Consiste := False;
        Exit;
      end;
    end;
  end
  else if pgctrl_exp_capa.ActivePage = tbsht_capa_06 then
  begin
    if datm_exp_capa.qry_exp_.State in [dsInsert, dsEdit] then
    begin
      if dbedt_cd_local_emissao.Text <> '' then
      begin
        ValidCodigo( dbedt_cd_local_emissao );
        if edt_nm_local_emissao.Text = '' then
        begin
          BoxMensagem('Código do Local inválido !',2);
          pgctrl_exp_capa.ActivePage := tbsht_capa_06;
          dbedt_cd_local_emissao.SetFocus;
          Consiste := False;
          Exit;
        end;
      end;
    end;
  end
  else if pgctrl_exp_capa.ActivePage = tbsht_capa_07 then
  begin
    if datm_exp_capa.qry_exp_nf_.State in [dsInsert, dsEdit] then
    begin
      if dbedt_nr_nf.Text = '' then
      begin
        BoxMensagem('No. da NF deve ser preenchido !',2);
        pgctrl_exp_capa.ActivePage := tbsht_capa_07;
        dbedt_nr_nf.SetFocus;
        Consiste := False;
        Exit;
      end;
    end;
    try
      dbedt_dt_nf.Text := DateToStr(StrToDate( dbedt_dt_nf.Text ) );
    except
      BoxMensagem( 'Data Inválida. Digite novamente.', 2 );
      pgctrl_exp_capa.ActivePage := tbsht_capa_07;
      dbedt_dt_nf.SetFocus;
      Consiste := False;
      Exit;
    end;
  end
  else if pgctrl_exp_capa.ActivePage = ts_pedido then
  begin
    if datm_exp_capa.qry_exp_ped_.State in [dsInsert, dsEdit] then
    begin
      if dbedt_nr_pedido.Text = '' then
      begin
        BoxMensagem( 'Nº do Pedido deve ser preenchido !', 2 );
        pgctrl_exp_capa.ActivePage := ts_pedido;
        dbedt_nr_pedido.SetFocus;
        Consiste := False;
        Exit;
      end;

      if dbedt_nr_fatura_ped.Text = '' then
      begin
        BoxMensagem( 'Nº da Fatura deve ser preenchido !', 2 );
        pgctrl_exp_capa.ActivePage := ts_pedido;
        dbedt_nr_fatura_ped.SetFocus;
        Consiste := False;
        Exit;
      end;
    end
  end
  else if pgctrl_exp_capa.ActivePage = ts_despacho then
  begin

    // Local de Despacho
    if dbedt_cd_local_despacho.Text <> '' then
    begin
      ValidCodigo( dbedt_cd_local_despacho );
      If lNaoConsiste = False then
      begin
        if ( edt_nm_local_despacho.Text = '' ) then
        begin
          BoxMensagem('Código do Local de Despacho inválido !',2);
          pgctrl_exp_capa.ActivePage := ts_despacho;
          dbedt_cd_local_despacho.SetFocus;
          Consiste := False;
          Exit;
        end;
      end;
    end;

    if pgctrl_despacho.ActivePage = ts_dde_re then
    begin
      if datm_exp_capa.qry_dde_re_.State in [dsInsert, dsEdit] then
      begin
        if dbedt_nr_re1.Text = '' then
        begin
          BoxMensagem( 'Nº do RE deve ser preenchido !', 2 );
          pgctrl_exp_capa.ActivePage := ts_despacho;
          dbedt_nr_re1.SetFocus;
          Consiste := False;
          Exit;
        end;

        if dbedt_nr_anexo_ini.Text = '' then
        begin
          BoxMensagem( 'Nº do Anexo Inicial deve ser preenchido !', 2 );
          pgctrl_exp_capa.ActivePage := ts_despacho;
          dbedt_nr_anexo_ini.SetFocus;
          Consiste := False;
          Exit;
        end;

        if dbedt_nr_anexo_fim.Text = '' then
        begin
          BoxMensagem( 'Nº do Anexo Final deve ser preenchido !', 2 );
          pgctrl_exp_capa.ActivePage := ts_despacho;
          dbedt_nr_anexo_fim.SetFocus;
          Consiste := False;
          Exit;
        end;
      end;
    end;

    if pgctrl_despacho.ActivePage = ts_dde_nf then
    begin
      if datm_exp_capa.qry_dde_nf_.State in [dsInsert, dsEdit] then
      begin
        if dbedt_nf_ini.Text = '' then
        begin
          BoxMensagem( 'Nº da Nota Fiscal Inicial deve ser preenchido !', 2 );
          pgctrl_exp_capa.ActivePage := ts_despacho;
          dbedt_nf_ini.SetFocus;
          Consiste := False;
          Exit;
        end;

        if dbedt_nf_fim.Text = '' then
        begin
          BoxMensagem( 'Nº da Nota Fiscal Final deve ser preenchido !', 2 );
          pgctrl_exp_capa.ActivePage := ts_despacho;
          dbedt_nf_fim.SetFocus;
          Consiste := False;
          Exit;
        end;
      end;
    end;
  end;

  // Validar o preenchimento do país de origem - Michel - 01/12/2008
  if Trim(datm_exp_capa.qry_exp_CD_PAIS_DESTINO.AsString) = '' then
  begin
    BoxMensagem('País de destino não preenchido!', 2 );
    pgctrl_exp_capa.ActivePage := tsBasicas;
    dbedt_cd_pais_destino.SetFocus;
    Consiste := False;
    Exit;
  end;

  Consiste := True;
end;

procedure Tfrm_exp_capa.Cancelar;
begin
  with datm_exp_capa do
  begin
    if ( pgctrl_exp_capa.ActivePage <> tbsht_capa_04 ) and
       ( pgctrl_exp_capa.ActivePage <> ts_NovoRe ) and
       ( pgctrl_exp_capa.ActivePage <> tbsht_capa_07 ) and
       ( pgctrl_exp_capa.ActivePage <> tbsht_capa_05 ) and       
       ( pgctrl_exp_capa.ActivePage <> ts_pedido )     and
       ( pgctrl_exp_capa.ActivePage <> ts_despacho )then
    begin
      if qry_exp_.State in [dsEdit,dsInsert] then
        qry_exp_.Cancel;

      ValidaBtnDesp( True );
    end
    else if (pgctrl_exp_capa.ActivePage = tbsht_capa_04) then
    begin
      if qry_exp_desp_.State  in [dsEdit,dsInsert] then qry_exp_desp_.Cancel;
      pnl_despesas.SetFocus;

      qry_exp_desp_.Close;
      qry_exp_desp_.ParamByName('NR_PROCESSO').AsString := str_nr_processo;
      qry_exp_desp_.Open;

      ValidaBtnDesp( True );

      if qry_exp_desp_.EOF then
      begin
        VerificaDesp( False );
        btn_excluir.Enabled := False;
        mi_excluir.Enabled  := False;
      end
      else
        VerificaDesp( True );
    end
    else if (pgctrl_exp_capa.ActivePage = tbsht_capa_05) then
    begin
      if qry_exp_re_.State  in [dsEdit,dsInsert] then qry_exp_re_.Cancel;
      pnl_re.SetFocus;

      qry_exp_re_.Close;
      qry_exp_re_.ParamByName('NR_PROCESSO').AsString := str_nr_processo;
      qry_exp_re_.Open;

      ValidaBtnDesp( True );

      if qry_exp_re_.EOF then
      begin
        VerificaDesp( False );
        btn_excluir.Enabled := False;
        mi_excluir.Enabled  := False;
      end
      else
        VerificaDesp( True );
    end
    else if (pgctrl_exp_capa.ActivePage = tbsht_capa_07) then
    begin
      if qry_exp_nf_.State  in [dsEdit,dsInsert] then qry_exp_nf_.Cancel;
      pnl_nf.SetFocus;

      qry_exp_nf_.Close;
      qry_exp_nf_.ParamByName('NR_PROCESSO').AsString := str_nr_processo;
      qry_exp_nf_.Open;

      ValidaBtnDesp( True );

      if qry_exp_nf_.EOF then
      begin
        VerificaDesp( False );
        btn_excluir.Enabled := False;
        mi_excluir.Enabled  := False;
      end
      else
        VerificaDesp( True );
    end
    else
    if ( pgctrl_exp_capa.ActivePage = ts_pedido ) then
    begin
      if qry_exp_ped_.State  in [dsEdit,dsInsert] then qry_exp_ped_.Cancel;
        pnl_pedido.SetFocus;

      qryProcContainer.close;
      cdsProcContainer.close;
      qryProcContainer.ParamByName('NR_PROCESSO').AsString := str_nr_processo;
      qryProcContainer.open;
      cdsProcContainer.open;

      qry_exp_ped_.Close;
      qry_exp_ped_.ParamByName('NR_PROCESSO').AsString := str_nr_processo;
      qry_exp_ped_.Open;

      ValidaBtnDesp( True );

      if qry_exp_ped_.EOF then
      begin
        VerificaDesp( False );
        btn_excluir.Enabled := False;
        mi_excluir.Enabled  := False;
      end
      else
        VerificaDesp( True );
    end
    else if (pgctrl_exp_capa.ActivePage = ts_NovoRe) then
    begin
      if qry_controle_re.State in [dsInsert, dsEdit] then
         qry_controle_re.Cancel;
       ValidaBtnDesp(true);
    end
    else if pgctrl_exp_capa.ActivePage = ts_despacho then
    begin
      if pgctrl_despacho.ActivePage = ts_dde_re then
      begin
        if qry_dde_re_.State  in [dsEdit,dsInsert] then qry_dde_re_.Cancel;
        pnl_dde_re.SetFocus;

        qry_dde_re_.Close;
        qry_dde_re_.ParamByName('NR_PROCESSO').AsString := str_nr_processo;
        qry_dde_re_.Open;

        ValidaBtnDesp( True );

        if qry_dde_re_.EOF then
        begin
          VerificaDesp( False );
          btn_excluir.Enabled := False;
          mi_excluir.Enabled  := False;
        end
        else
          VerificaDesp( True );
      end
      else
      begin
        if qry_dde_nf_.State  in [dsEdit,dsInsert] then qry_dde_nf_.Cancel;
        pnl_dde_nf.SetFocus;

        qry_dde_nf_.Close;
        qry_dde_nf_.ParamByName('NR_PROCESSO').AsString := str_nr_processo;
        qry_dde_nf_.Open;

        ValidaBtnDesp( True );

        if qry_dde_nf_.EOF then
        begin
          VerificaDesp( False );
          btn_excluir.Enabled := False;
          mi_excluir.Enabled  := False;
        end
        else
          VerificaDesp( True );
      end;
    end;
  end;
end;

function Tfrm_exp_capa.VerAlt;
begin
  VerAlt := True;

  if ( datm_exp_capa.qry_exp_.State in [dsEdit,dsInsert] ) then
  begin
    if BoxMensagem('A Capa do Processo foi alterada.' + #13#10 +
                   'Deseja salvar as alterações?', 1) then
    begin
      if Not Consiste then
      begin
        VerAlt := False;
        Exit;
      end;
      if Not Grava then
      begin
        VerAlt := False;
        Exit;
      end;
      if ( Not (lCalculo) ) and ( btn_calculo.Enabled ) then
      begin
        VerAlt := False;
        Exit;
      end;
      btn_salvar.Enabled   := False;
      mi_salvar.Enabled    := False;
      btn_cancelar.Enabled := False;
      mi_cancelar.Enabled  := False;
      btn_excluir.Enabled  := True;
      mi_excluir.Enabled   := True;
      btn_itens_exp.Enabled:= True;
      mi_itens_exp.Enabled := True;
    end
    else
      Cancelar;
  end;

  if pgctrl_exp_capa.ActivePage = tbsht_capa_04 then
  begin
    if ( datm_exp_capa.qry_exp_desp_.State in [dsEdit,dsInsert] ) then
    begin
      if BoxMensagem('A Despesa foi alterada.' + #13#10 +
                     'Deseja salvar as alterações?', 1) then
      begin
        if Not Consiste then
        begin
          VerAlt := False;
          Exit;
        end;
        if Not Grava then
        begin
          VerAlt := False;
          Exit;
        end;
      end
      else
        Cancelar;
    end;
  end
  else if pgctrl_exp_capa.ActivePage = tbsht_capa_05 then
  begin
    if ( datm_exp_capa.qry_exp_re_.State in [dsEdit,dsInsert] ) then
    begin
      if BoxMensagem('O RE foi alterado.' + #13#10 +
                     'Deseja salvar as alterações?', 1) then
      begin
        if Not Consiste then
        begin
          VerAlt := False;
          Exit;
        end;
        if Not Grava then
        begin
          VerAlt := False;
          Exit;
        end;
      end
      else
        Cancelar;
    end;
  end
  else if pgctrl_exp_capa.ActivePage = tbsht_capa_07 then
  begin
    if ( datm_exp_capa.qry_exp_nf_.State in [dsEdit,dsInsert] ) then
    begin
      if BoxMensagem('A NF foi alterada.' + #13#10 +
                     'Deseja salvar as alterações?', 1) then
      begin
        if Not Consiste then
        begin
          VerAlt := False;
          Exit;
        end;
        if Not Grava then
        begin
          VerAlt := False;
          Exit;
        end;
      end
      else
        Cancelar;
    end;
  end
  else if ( pgctrl_exp_capa.ActivePage = ts_NovoRe ) then
  begin
    if datm_exp_capa.qry_controle_re.State in [dsEdit, dsInsert] then
    begin
      if BoxMensagem( 'Cadastro de RE foi alterado.' + #13#10 +'Deseja salvar as alterações?', 1 ) then
      begin
        if Not Grava then
        begin
          VerAlt := False;
          Exit;
        end;
      end
      else
        Cancelar;
    end;
  end
  else if pgctrl_exp_capa.ActivePage = ts_pedido then
  begin
    if ( datm_exp_capa.qry_exp_ped_.State in [dsEdit,dsInsert] ) then
    begin
      if BoxMensagem('O pedido foi alterado.' + #13#10 +
                     'Deseja salvar as alterações?', 1) then
      begin
        if Not Consiste then
        begin
          VerAlt := False;
          Exit;
        end;
        if Not Grava then
        begin
          VerAlt := False;
          Exit;
        end;
      end
      else
        Cancelar;
    end;
  end
  else if pgctrl_exp_capa.ActivePage = ts_despacho then
  begin
    if ( datm_exp_capa.qry_dde_re_.State in [dsEdit,dsInsert] ) or
       ( datm_exp_capa.qry_dde_nf_.State in [dsEdit,dsInsert] ) or
       ( datm_exp_capa.qry_exp_.State in [dsEdit,dsInsert] ) then
    begin
      if BoxMensagem('O Despacho foi alterado.' + #13#10 +
                     'Deseja salvar as alterações?', 1) then
      begin
        if Not Consiste then
        begin
          VerAlt := False;
          Exit;
        end;
        if Not Grava then
        begin
          VerAlt := False;
          Exit;
        end;
      end
      else
        Cancelar;
    end;
  end;
end;

procedure Tfrm_exp_capa.CodExits;
begin
  lNaoConsiste  := True;
  Consiste;
  lNaoConsiste  := False;
end;

procedure Tfrm_exp_capa.Desabilita_Entrada;
var i : integer;
begin
  for i := 0 to componentcount - 1 do
  begin
    if ( Components[i] is TLabel        ) then TLabel( Components[i] ).Enabled        := False;
    if ( Components[i] is TMaskEdit     ) then TMaskEdit( Components[i] ).Enabled     :=  False;
    if ( Components[i] is TSpeedButton  ) then TSpeedButton( Components[i] ).Enabled  := False;
    if ( Components[i] is TDBEdit       ) then TDBEdit( Components[i] ).Enabled       := False;
    if ( Components[i] is TDBRadioGroup ) then TDBRadioGroup( Components[i] ).Enabled := False;
    if ( Components[i] is TRadioButton  ) then TRadioButton( Components[i] ).Enabled  := False;
    if ( Components[i] is TDBCheckBox   ) then TDBCheckBox( Components[i] ).Enabled   := False;
    if ( Components[i] is TDBLookupComboBox ) then TDBLookupComboBox( Components[i] ).Enabled := False;
  end;

  mi_salvar.Enabled   := btn_salvar.Enabled;
  mi_cancelar.Enabled := btn_cancelar.Enabled;
  mi_excluir.Enabled  := btn_excluir.Enabled;
  btn_sair.Enabled := True;
  btn_itens_exp.Enabled := True;

  mi_itens_exp.Enabled := btn_itens_exp.Enabled;
  mi_sair.Enabled     := btn_sair.Enabled;
end;

procedure Tfrm_exp_capa.dbedt_cd_exportadorKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if Key = VK_F5 then
  begin
    if Sender = mskedt_nr_processo           then btn_co_proc_newClick(btn_co_proc_new);
    if Sender = dbedt_cd_exportador          then btn_co_exportadorClick(btn_co_exportador);
    if Sender = dbedt_cd_importador          then btn_co_importadorClick(btn_co_importador);
    if Sender = dbedt_cd_local_origem        then btn_co_origemClick(btn_co_origem);
    if Sender = dbedt_cd_local_destino       then btn_co_destinoClick(btn_co_destino);
    if Sender = dbedt_cd_pais_destino        then btn_co_pais_destinoClick(btn_co_pais_destino);
    if Sender = dbedt_cd_enquad_op           then btn_co_enquad_opClick(btn_co_enquad_op);
    if Sender = dbedt_cd_representante       then btn_co_representanteClick(btn_co_representante);
    if Sender = dbedt_cd_incoterm            then btn_co_incotermClick(btn_co_incoterm);
    if Sender = dbedt_cd_instr_neg           then btn_co_instr_negClick(btn_co_instr_neg);
    if Sender = dbedt_cd_seguradora          then btn_co_seguradoraClick(btn_co_seguradora);
    if Sender = dbedt_cd_urf_despacho        then btn_co_urf_despClick(btn_co_urf_desp);
    if Sender = dbedt_cd_urf_embarque        then btn_co_urf_embClick(btn_co_urf_emb);
    if Sender = dbedt_cd_termo_pagto         then btn_co_termo_pagtoClick(btn_co_termo_pagto);
    if Sender = dbm_termo_pagto              then btn_co_termo_segClick(btn_co_termo_seg);
    if Sender = dbedt_cd_moeda               then btn_co_moedaClick(btn_co_moeda);
    if Sender = dbedt_cd_agente_carga        then btn_co_agenteClick(btn_co_agente);
    if Sender = dbedt_cd_despachante         then btn_co_despachanteClick(btn_co_despachante);
    if Sender = dbedt_cd_transportadora      then btn_co_transportadoraClick(btn_co_transportadora);
    if Sender = dbedt_cd_consignatario       then btn_co_consignatarioClick(btn_co_consignatario);
    if Sender = dbedt_cd_notificado1         then btn_co_notificado1Click(btn_co_notificado1);
    if Sender = dbedt_cd_notificado2         then btn_co_notificado2Click(btn_co_notificado2);
    if Sender = dbedt_cd_item                then btn_co_itemClick(btn_co_item);
    if Sender = dbedt_cd_local_emissao       then btn_co_local_emissaoClick(btn_co_local_emissao);
    if Sender = dbm_observacao               then btn_co_obsClick(btn_co_obs);
    if Sender = dbm_merc_bl                  then btn_co_merc_blClick(btn_co_merc_bl);
    if Sender = dbedt_cd_fabricante          then btn_co_fabricanteClick(btn_co_fabricante);
    if Sender = dbedt_cd_pais_origem         then btn_co_pais_origemClick(btn_co_pais_origem);
    if Sender = dbedt_cd_documento           then btn_co_documentoClick(btn_co_documento);
    if Sender = dbedt_cd_copia               then btn_co_copiaClick(btn_co_copia);
    if Sender = dbedt_cd_pais_orig           then btn_co_pais_origClick(btn_co_pais_orig);
    if Sender = dbedt_cd_banco_saque_bordero then btn_co_banco_saque_borderoClick(btn_co_banco_saque_bordero);
    if Sender = dbedtbCoSaque                then btnCoBcoSaqueClick(btnCoBcoSaque);    
    if Sender = dbedt_cd_local_despacho      then btn_co_DespachoClick(btn_co_Despacho);
  end;
end;

procedure Tfrm_exp_capa.btn_co_exportadorClick(Sender: TObject);
begin
  if Sender is TSpeedButton then
  begin
    If Not PoeEmEdicao(datm_exp_capa.qry_exp_) Then Exit;
    If (Sender as TSpeedButton).Enabled Then
      datm_exp_capa.qry_exp_CD_EXPORTADOR.AsString := ConsultaOnLineExSQL(
        'SELECT CD_EMPRESA, NM_EMPRESA, AP_EMPRESA, END_EMPRESA, CGC_EMPRESA FROM TEMPRESA_NAC (NOLOCK) WHERE IN_EXPORTADOR = 1',
        'Exportador', ['CD_EMPRESA', 'NM_EMPRESA', 'AP_EMPRESA', 'CGC_EMPRESA', 'END_EMPRESA'], ['Código', 'Descrição', 'Apelido', 'CGC', 'Endereço'], 'CD_EMPRESA', nil);
      dbedt_cd_exportadorExit(nil);
  end
  else edt_nm_exportador.Text := ConsultaLookUPSQL('SELECT NM_EMPRESA FROM TEMPRESA_NAC (NOLOCK) WHERE IN_EXPORTADOR = 1 AND CD_EMPRESA = ''' + dbedt_cd_exportador.Text + '''','NM_EMPRESA');
end;

procedure Tfrm_exp_capa.btn_co_origemClick(Sender: TObject);
begin
  if Sender is TSpeedButton then
  begin
    If Not PoeEmEdicao(datm_exp_capa.qry_exp_) Then Exit;
    If (Sender as TSpeedButton).Enabled Then
     datm_exp_capa.qry_exp_CD_LOCAL_ORIGEM.AsString  := ConsultaOnLineEx('TLOCAL_EMBARQUE', 'Local de Origem',['CODIGO','DESCRICAO'],['Código','Local de Origem'],'CODIGO');
  end
  else edt_nm_local_origem.Text := ConsultaLookUP('TLOCAL_EMBARQUE', 'CODIGO', dbedt_cd_local_origem.Text, 'DESCRICAO');
end;

procedure Tfrm_exp_capa.btn_co_pais_destinoClick(Sender: TObject);
begin
  if Sender is TSpeedButton then
  begin
    If Not PoeEmEdicao(datm_exp_capa.qry_exp_) Then Exit;
    If (Sender as TSpeedButton).Enabled Then
     datm_exp_capa.qry_exp_CD_PAIS_DESTINO.AsString  := ConsultaOnLineEx('TPAIS', 'País de Destino',['CODIGO','DESCRICAO'],['Código','País'],'CODIGO');
  end
  else edt_nm_pais_destino.Text := ConsultaLookUP('TPAIS', 'CODIGO', dbedt_cd_pais_destino.Text, 'DESCRICAO');
end;

procedure Tfrm_exp_capa.btn_co_representanteClick(Sender: TObject);
begin
  if Sender is TSpeedButton then begin
    if Not PoeEmEdicao(datm_exp_capa.qry_exp_) then Exit;
    if (Sender as TSpeedButton).Enabled then
      datm_exp_capa.qry_exp_CD_REPRESENTANTE.AsString := ConsultaOnLineExSQL(
        'SELECT CD_EMPRESA, NM_EMPRESA, AP_EMPRESA FROM TEMPRESA_NAC (NOLOCK) WHERE IN_REPRESENTANTE = ''1'' AND IN_ATIVO = ''1'' ',
        'Representantes',['CD_EMPRESA','NM_EMPRESA','AP_EMPRESA'],['Código','Nome','Apelido'],'CD_EMPRESA')
  end
  else
    edt_nm_representante.Text := ConsultaLookUPSQL(
      'SELECT NM_EMPRESA FROM TEMPRESA_NAC (NOLOCK) ' +
      'WHERE CD_EMPRESA = ''' + dbedt_cd_representante.Text +''' '+
      '  AND IN_REPRESENTANTE = ''1'' AND IN_ATIVO = ''1'' ','NM_EMPRESA');
end;

procedure Tfrm_exp_capa.btn_co_instr_negClick(Sender: TObject);
begin
  if Sender is TSpeedButton then
  begin
    if not PoeEmEdicao(datm_exp_capa.qry_exp_) then exit;
    If (Sender as TSpeedButton).Enabled Then
      datm_exp_capa.qry_exp_CD_INST_NEGOC.AsString := ConsultaOnLineEx('TINST_NEGOC','Instrumento de Negociação',['CD_INST_NEGOC','NM_INST_NEGOC'],['Código','Descrição'],'CD_INST_NEGOC',frm_main.mi_cad_scx_exp_inst_negoc)
  end
  else edt_nm_istr_neg.Text := ConsultaLookUP('TINST_NEGOC','CD_INST_NEGOC',dbedt_cd_instr_neg.Text,'NM_INST_NEGOC');
end;

procedure Tfrm_exp_capa.btn_co_urf_despClick(Sender: TObject);
begin
  if Sender is TSpeedButton then begin
    if not PoeEmEdicao(datm_exp_capa.qry_exp_) then exit;
    If (Sender as TSpeedButton).Enabled Then
      datm_exp_capa.qry_exp_CD_URF_DESPACHO.AsString := ConsultaOnLineEx('TURF', 'URF´s de Despacho ',['CODIGO', 'DESCRICAO'],['Código','URF de Despacho'],'CODIGO');
  end
  else edt_nm_urf_despacho.Text := ConsultaLookUP('TURF', 'CODIGO', dbedt_cd_urf_despacho.Text, 'DESCRICAO');
end;

procedure Tfrm_exp_capa.btn_co_termo_pagtoClick(Sender: TObject);
begin
  if Sender is TSpeedButton then begin
    if not PoeEmEdicao(datm_exp_capa.qry_exp_) then exit;
    If (Sender as TSpeedButton).Enabled Then
      datm_exp_capa.qry_exp_CD_TERMO_PAGTO.AsString := ConsultaOnLineEx('TTERMO_PAGTO','Termo de Pagamento',['CD_TERMO_PAGTO','NM_TERMO_PAGTO','NR_PERIODICIDADE','NR_PARCELAS'],['Código','Descrição','Periodicidade', 'Nº Parcelas'],'CD_TERMO_PAGTO',frm_main.mi_cad_termo_pagto)
  end
  else edt_nm_termo_pagto.Text := ConsultaLookUP('TTERMO_PAGTO','CD_TERMO_PAGTO',dbedt_cd_termo_pagto.Text,'NM_TERMO_PAGTO');
end;

procedure Tfrm_exp_capa.btn_co_importadorClick(Sender: TObject);
//var vGrupo: string[3];
begin
  //vGrupo := ConsultaLookUp('TPROCESSO', 'NR_PROCESSO', datm_exp_capa.qry_exp_NR_PROCESSO.AsString, 'CD_GRUPO');

  if Sender is TSpeedButton then begin
    If Not PoeEmEdicao(datm_exp_capa.qry_exp_) Then Exit;
    If (Sender as TSpeedButton).Enabled Then
       datm_exp_capa.qry_exp_CD_IMPORTADOR.AsString := ConsultaOnLineExSQL(
       'SELECT CD_EMPRESA, NM_EMPRESA, END_CIDADE, END_EMPRESA, END_NUMERO FROM TEMPRESA_EST (NOLOCK) WHERE IN_IMPORTADOR = ''1'' ' +
       ' AND CD_EMPRESA IN (SELECT CD_EMPRESA FROM TEMPRESA_EST_GRUPO (NOLOCK) WHERE CD_GRUPO = "'+ vGrupo +'") ',
       'Cadastro de Importadores',['CD_EMPRESA', 'NM_EMPRESA', 'END_CIDADE','END_EMPRESA', 'END_NUMERO' ],['Código','Importador','Cidade','Endereço','Numero'],'CD_EMPRESA',nil,datm_exp_capa.qry_exp_CD_IMPORTADOR.AsString);


     dbedt_cd_exportadorExit(nil);
  end
  else edt_nm_importador.Text := ConsultaLookUPSQL(' SELECT NM_EMPRESA FROM TEMPRESA_EST (NOLOCK) WHERE IN_IMPORTADOR = 1 AND CD_EMPRESA = '''+ dbedt_cd_importador.Text +''' ' +
                                                   ' AND CD_EMPRESA IN (SELECT CD_EMPRESA FROM TEMPRESA_EST_GRUPO (NOLOCK) WHERE CD_GRUPO = "'+ vGrupo +'") ',
                                                   'NM_EMPRESA');
end;

procedure Tfrm_exp_capa.btn_co_destinoClick(Sender: TObject);
begin
  if Sender is TSpeedButton then
  begin
    If Not PoeEmEdicao(datm_exp_capa.qry_exp_) Then Exit;
    If (Sender as TSpeedButton).Enabled Then
     datm_exp_capa.qry_exp_CD_LOCAL_DESTINO.AsString  := ConsultaOnLineEx('TLOCAL_EMBARQUE', 'Locais de Desembarque',['CODIGO','DESCRICAO'],['Código','Local de Embarque'],'CODIGO');
  end
  else edt_nm_local_destino.Text := ConsultaLookUP('TLOCAL_EMBARQUE', 'CODIGO', dbedt_cd_local_destino.Text , 'DESCRICAO');
end;

procedure Tfrm_exp_capa.btn_co_seguradoraClick(Sender: TObject);
begin
  if Sender is TSpeedButton then begin
    If Not PoeEmEdicao(datm_exp_capa.qry_exp_) Then Exit;
    If (Sender as TSpeedButton).Enabled Then
      datm_exp_capa.qry_exp_CD_SEGURADORA.AsString := ConsultaOnLineExSQL('SELECT CD_EMPRESA, NM_EMPRESA FROM TEMPRESA_EST (NOLOCK) WHERE IN_AGENTE = 1' ,
                                                                          'Agente Comissão', ['CD_EMPRESA', 'NM_EMPRESA'], ['Código', 'Descrição'], 'CD_EMPRESA', nil);
  end
  else edt_nm_seguradora.Text := ConsultaLookUPSQL('SELECT NM_EMPRESA FROM TEMPRESA_EST (NOLOCK) WHERE IN_AGENTE = 1 AND CD_EMPRESA = ''' + dbedt_cd_seguradora.Text + '''','NM_EMPRESA');
end;

procedure Tfrm_exp_capa.btn_co_urf_embClick(Sender: TObject);
begin
  if Sender is TSpeedButton then begin
    if not PoeEmEdicao(datm_exp_capa.qry_exp_) then exit;
    If (Sender as TSpeedButton).Enabled Then
      datm_exp_capa.qry_exp_CD_URF_DESTINO.AsString := ConsultaOnLineEx('TURF', 'URF´s de Embarque ',['CODIGO', 'DESCRICAO'],['Código','URF de Embarque'],'CODIGO');
  end
  else edt_nm_urf_embarque.Text := ConsultaLookUP('TURF', 'CODIGO', dbedt_cd_urf_embarque.Text, 'DESCRICAO');
end;

procedure Tfrm_exp_capa.btn_co_moedaClick(Sender: TObject);
begin
  if Sender is TSpeedButton then begin
    If Not PoeEmEdicao(datm_exp_capa.qry_exp_) Then Exit;
    If (Sender as TSpeedButton).Enabled Then
      datm_exp_capa.qry_exp_CD_MOEDA.AsString := ConsultaOnLineEx('TMOEDA_BROKER', 'Moedas',['CD_MOEDA','NM_MOEDA', 'AP_MOEDA'],['Código','Nome da Moeda', 'Apelido da Moeda'],'CD_MOEDA');
  end
  else edt_nm_moeda.Text := ConsultaLookUP('TMOEDA_BROKER', 'CD_MOEDA', dbedt_cd_moeda.Text, 'NM_MOEDA');
end;

procedure Tfrm_exp_capa.btn_co_despachanteClick(Sender: TObject);
begin
  if Sender is TSpeedButton then begin
    If Not PoeEmEdicao(datm_exp_capa.qry_exp_) Then Exit;
    If (Sender as TSpeedButton).Enabled Then
     datm_exp_capa.qry_exp_CD_DESPACHANTE.AsString  := ConsultaOnLineEx('TDESPACHANTE', 'Despachantes',['CD_DESPACHANTE','NM_DESPACHANTE'],['Código','Despachantes'],'CD_DESPACHANTE');
  end
  else edt_nm_despachante.Text := ConsultaLookUP('TDESPACHANTE', 'CD_DESPACHANTE', dbedt_cd_despachante.Text , 'NM_DESPACHANTE');
end;

procedure Tfrm_exp_capa.btn_co_transportadoraClick(Sender: TObject);
begin
  if Sender is TSpeedButton then begin
    If Not PoeEmEdicao(datm_exp_capa.qry_exp_) Then Exit;
    If (Sender as TSpeedButton).Enabled Then
     datm_exp_capa.qry_exp_CD_TRANSPORTADORA.AsString  := ConsultaOnLineEx('TTRANSP_ROD', 'Transportadores',['CD_TRANSP_ROD','NM_TRANSP_ROD'],['Código','Transportadora'],'CD_TRANSP_ROD');
  end
  else edt_NmTransportadora.Text := ConsultaLookUP('TTRANSP_ROD', 'CD_TRANSP_ROD', dbedt_cd_transportadora.Text , 'NM_TRANSP_ROD');
end;

procedure Tfrm_exp_capa.btn_co_agenteClick(Sender: TObject);
begin
  if Sender is TSpeedButton then begin
    If Not PoeEmEdicao(datm_exp_capa.qry_exp_) Then Exit;
    If (Sender as TSpeedButton).Enabled Then
     datm_exp_capa.qry_exp_CD_AGENTE.AsString  := ConsultaOnLineEx('TAGENTE', 'Agentes de Carga',['CD_AGENTE','NM_AGENTE'],['Código','Agente de Carga'],'CD_AGENTE');
  end
  else edt_nm_agente_carga.Text := ConsultaLookUP('TAGENTE', 'CD_AGENTE', dbedt_cd_agente_carga.Text , 'NM_AGENTE');
end;

function Tfrm_exp_capa.Grava;
var
  dt_fatura : String[10];
  snotify1, snotify2 , sConsignatario: String;
begin
  Grava := True;
//  lCalculo := False;
  if pgctrl_exp_capa.ActivePage = tbsht_capa_04 then
  begin
     if Trim(datm_exp_capa.qry_exp_desp_CD_ITEM.AsString) = '' then
     begin
       BoxMensagem( 'É necessário preencher o Item de Despesa !!', 3 );
       dbedt_cd_item.SetFocus;
       exit;
     end;
  end;

  if ( pgctrl_exp_capa.ActivePage <> ts_NovoRe ) and
     ( pgctrl_exp_capa.ActivePage <> tbsht_capa_05 ) and
     ( pgctrl_exp_capa.ActivePage <> tbsht_capa_07 ) and
     ( pgctrl_exp_capa.ActivePage <> ts_pedido )     and
     ( pgctrl_exp_capa.ActivePage <> ts_despacho )then
  begin
    datm_exp_capa.qry_exp_itens_.Close;
    datm_exp_capa.qry_exp_itens_.ParamByName('NR_PROCESSO').AsString := str_nr_processo;
    datm_exp_capa.qry_exp_itens_.Open;

    if dbchkbx_num_fat_auto.Checked = true then
      datm_exp_capa.qry_exp_in_num_fat_auto.AsString := '1'
    else
      datm_exp_capa.qry_exp_in_num_fat_auto.AsString := '0';

    btn_calculo.Enabled := True;
    datm_exp_capa.qry_exp_itens_.Close;
  end;

  try
    with datm_exp_capa do
    begin
      if pgctrl_exp_capa.ActivePage = tbsht_capa_04 then
      begin
        if qry_exp_desp_.State in [dsEdit,dsInsert] then
        begin
          datm_main.db_broker.StartTransaction;
          qry_exp_desp_.Post;

          qry_exp_.Edit;
          qry_exp_VL_TOT_DESPESA.AsFloat := qry_ret_tot_despesa_TOTAL.AsFloat;
          qry_exp_.Post;

          datm_main.db_broker.Commit;

          qry_ret_tot_despesa_.Close;
          qry_ret_tot_despesa_.ParamByName('NR_PROCESSO').AsString := str_nr_processo;
          qry_ret_tot_despesa_.Open;

          qry_exp_desp_.Close;
          qry_exp_desp_.ParamByName('NR_PROCESSO').AsString := str_nr_processo;
          qry_exp_desp_.Open;

          btn_calculo.Enabled := True;
        end;
      end
      else if pgctrl_exp_capa.ActivePage = tbsht_capa_05 then
      begin
        if qry_exp_re_.State in [dsEdit,dsInsert] then
        begin
          datm_main.db_broker.StartTransaction;
          qry_exp_re_.Post;

          datm_main.db_broker.Commit;

          qry_exp_re_.Close;
          qry_exp_re_.ParamByName('NR_PROCESSO').AsString := str_nr_processo;
          qry_exp_re_.Open;
        end;
      end
      else if pgctrl_exp_capa.ActivePage = tbsht_capa_07 then
      begin
        if qry_exp_nf_.State in [dsEdit,dsInsert] then
        begin
          datm_main.db_broker.StartTransaction;
          qry_exp_nf_.Post;

          datm_main.db_broker.Commit;

          qry_exp_nf_.Close;
          qry_exp_nf_.ParamByName('NR_PROCESSO').AsString := str_nr_processo;
          qry_exp_nf_.Open;
        end
      end
      else if pgctrl_exp_capa.ActivePage = ts_NovoRe then
      begin
        with datm_exp_capa do
        begin
          //verifica campos nulos
          if (qry_controle_reNR_RE_SISCOMEX.IsNull)     or (qry_controle_reNR_RE_SISCOMEX.AsString = '') or
             (qry_controle_reDT_DATA_RE.IsNull)         or
             (qry_controle_reQT_ANEXOS.IsNull)          or (qry_controle_reQT_ANEXOS.AsString = '') or
             (qry_controle_reTX_SITUACAO_RE.IsNull)     or (qry_controle_reTX_SITUACAO_RE.AsString = '') or
             (qry_controle_reVL_ESQUE_PG_TOTAL.IsNull)  or (qry_controle_reVL_ESQUE_PG_TOTAL.AsString = '') or
             (qry_controle_rePESO_LIQUIDO_TOTAL.IsNull) or (qry_controle_rePESO_LIQUIDO_TOTAL.AsString = '') then
            Grava := false;

          try
            StrToDate(qry_controle_reDT_DATA_RE.AsString)
          except
            Grava := False;
          end;

          if not (IsNumeric(qry_controle_reVL_ESQUE_PG_TOTAL.AsString))  or
             not (IsNumeric(qry_controle_rePESO_LIQUIDO_TOTAL.AsString)) then
             Grava := false;

          if (qry_controle_re.State in [dsInsert, dsEdit]) and (Result) then
          begin
            datm_main.db_broker.StartTransaction;
            try
              qry_controle_re.Post;
              qry_controle_re.Close;
              qry_controle_re.ParamByName('NR_PROCESSO').AsString := qry_exp_NR_PROCESSO.AsString;
              qry_controle_re.Open;
              datm_main.db_broker.Commit;
            except
              if datm_main.db_broker.InTransaction then datm_main.db_broker.Rollback;
            end;
            ValidaBtnDesp(True);
          end
          else
          begin
            BoxMensagem('Todos os campos devem estar preenchidos para o RE ser salvo!' + chr(13) + 'Inclua as informações corretamente e salve novamente!' , 2);
            btn_cancelarClick(btn_cancelar);
          end;
        end;
      end
      else
      if pgctrl_exp_capa.ActivePage = ts_pedido then
      begin
        if qry_exp_ped_.State in [dsEdit,dsInsert] then
        begin
          datm_main.db_broker.StartTransaction;
          try
            nr_pedido := qry_exp_ped_NR_PEDIDO.AsString;
            qry_exp_ped_.Post;

            datm_main.db_broker.Commit;

            qry_exp_ped_.Close;
            qry_exp_ped_.ParamByName('NR_PROCESSO').AsString := str_nr_processo;
            qry_exp_ped_.Open;

            qry_exp_ped_.Locate( 'NR_PEDIDO', nr_pedido, [loCaseInsensitive] );
          except
            if datm_main.db_broker.InTransaction then
              datm_main.db_broker.Rollback;
          end;
        end;
      end
      // Despacho
      else if pgctrl_exp_capa.ActivePage = ts_despacho then
      begin
        if pgctrl_despacho.ActivePage = ts_dde_re then
        begin
          if qry_dde_re_.State in [dsEdit,dsInsert] then
          begin
            datm_main.db_broker.StartTransaction;
            qry_dde_re_NR_PROCESSO.AsString := str_nr_processo;
            qry_atz_des_re_dde_.Close;
            qry_atz_des_re_dde_.ParamByName('NR_PROCESSO').AsString := qry_exp_NR_PROCESSO.AsString;
            qry_atz_des_re_dde_.ParamByName('NR_RE').AsString := Trim( dbedt_nr_re1.Text );
            qry_atz_des_re_dde_.ParamByName('NR_ANEXO_INI').AsString := dbedt_nr_anexo_fim.Text;
            qry_atz_des_re_dde_.ParamByName('NR_ANEXO_FIM').AsString := dbedt_nr_anexo_fim.Text;
            qry_atz_des_re_dde_.Open;
            if qry_atz_des_re_dde_.RecordCount = 0 then
            begin
              with TQuery.Create(Application) do
              begin
                DatabaseName := 'DBBROKER';
                SQL.Clear;
                Free;
              end;
            end

            else
            begin
              with TQuery.Create(Application) do
              begin
                DatabaseName := 'DBBROKER';
                SQL.Clear;
                ExecSQL;
                Free;
              end;
            end;
            qry_dde_re_.Post;

            qry_dde_re_.Close;
            qry_dde_re_.ParamByName('NR_PROCESSO').AsString := str_nr_processo;
            qry_dde_re_.Open;

            // Realizar evento Confecção do RE
            CloseStoredProc(sp_atz_evento);
            sp_atz_evento.ParamByName('@NR_PROCESSO').AsString     := str_nr_processo;
            sp_atz_evento.ParamByName('@CD_EVENTO_TXT').AsString   := 'CD_EV_REG_RE';
            sp_atz_evento.ParamByName('@DT_REALIZACAO').AsDateTime := StrToDate( FormatDateTime( 'dd/mm/yyyy', Now ) );
            ExecStoredProc(sp_atz_evento);
            CloseStoredProc(sp_atz_evento);

            datm_main.db_broker.Commit;

            qry_dde_re_.Close;
            qry_dde_re_.ParamByName('NR_PROCESSO').AsString := str_nr_processo;
            qry_dde_re_.Open;
          end;
        end

        else
        begin
          if qry_dde_nf_.State in [dsEdit,dsInsert] then
          begin
            datm_main.db_broker.StartTransaction;

            qry_dde_nf_NR_PROCESSO.AsString := str_nr_processo;

            qry_dde_nf_.Post;

            datm_main.db_broker.Commit;

            qry_dde_nf_.Close;
            qry_dde_nf_.ParamByName('NR_PROCESSO').AsString := str_nr_processo;
            qry_dde_nf_.Open;
          end;
        end;
      end
      else If pgctrl_exp_capa.ActivePage = tbsht_capa_02 then
      begin
        FastExecSQL('UPDATE TPROCESSO SET ' +
                    'TX_MARCACAO_VOL_PROC  = :D_CONSIGNATARIO ' +
                    'WHERE ' +
                    'NR_PROCESSO         = :NR_PROCESSO',
                    [
                      dbm_marc_volumes.Text,
                      str_nr_processo
                    ]
                   )
      end
      else If pgctrl_exp_capa.ActivePage = tbsht_capa_03 then
      begin

        if dblkcbox_notificado1.KeyValue = null then
          snotify1 := ''
        else
         snotify1 := dblkcbox_notificado1.KeyValue;

        if dblkcbox_notificado2.KeyValue = null then
          snotify2 := ''
        else
         snotify2 := dblkcbox_notificado2.KeyValue;

        if dblkcbox_consignatario.KeyValue = null then
          sConsignatario := ''
        else
         sConsignatario := dblkcbox_consignatario.KeyValue;


        FastExecSQL('UPDATE TPROCESSO SET ' +
                    'CD_CONSIGNEE    = :D_CONSIGNATARIO, ' +
                    'CD_NOTIFY1_PROC = :D_NOTIFY1, ' +
                    'CD_NOTIFY2_PROC = :D_NOTIFY2, ' +
                    'TP_CONSIGNEE    = :TP_CONSIGNATARIO, ' +
                    'TP_NOTIFY1_PROC = :TP_NOTIFY1, ' +
                    'TP_NOTIFY2_PROC = :TP_NOTIFY2 ' +
                    'WHERE ' +
                    'NR_PROCESSO     = :NR_PROCESSO',
                    [
                      dbedt_cd_consignatario.Text,
                      dbedt_cd_notificado1.Text,
                      dbedt_cd_notificado2.Text,
                      sConsignatario,
                      snotify1,
                      snotify2 ,
                      str_nr_processo
                    ]
                   )
      end;

      if qry_exp_.State in [dsEdit,dsInsert] then
      begin
        datm_main.db_broker.StartTransaction;

        Case cbblogomarca.ItemIndex of
          -1: qry_exp_TX_LOGOMARCA.AsString := '';
          0: qry_exp_TX_LOGOMARCA.AsString := 'logo_sg0.jpg';
          1: qry_exp_TX_LOGOMARCA.AsString := 'logo_sg1.jpg';
          2: qry_exp_TX_LOGOMARCA.AsString := 'logo_sg2.jpg';
          3: qry_exp_TX_LOGOMARCA.AsString := 'logo_sg3.jpg';
        end;

        qry_exp_.Post;

        // Dados da Gestão
        qry_exec_sp_.SQL.Clear;
        qry_exec_sp_.SQL.Add( 'EXEC sp_exp_insere_gestao "' + str_nr_processo + '"' );
        qry_exec_sp_.ExecSQL;

        // Realizar evento Emissão de DDE
        if pgctrl_exp_capa.ActivePage = ts_despacho then
        begin
          CloseStoredProc(sp_atz_evento);
          sp_atz_evento.ParamByName('@NR_PROCESSO').AsString     := str_nr_processo;
          sp_atz_evento.ParamByName('@CD_EVENTO_TXT').AsString   := 'CD_EV_REG_DDE';
          sp_atz_evento.ParamByName('@DT_REALIZACAO').AsDateTime := StrToDate( FormatDateTime( 'dd/mm/yyyy', Now ) );
          ExecStoredProc(sp_atz_evento);
          CloseStoredProc(sp_atz_evento);
        end;

        // Realizar evento 117 - Emissão da Fatura Comercial
        if ( dbedt_dt_fatura.Text ) <> '  /  /    ' then
        begin
          dt_fatura := dbedt_dt_fatura.Text;
          if pgctrl_exp_capa.ActivePage = tsBasicas then
          begin
            CloseStoredProc(sp_atz_evento);
            sp_atz_evento.ParamByName('@NR_PROCESSO').AsString     := str_nr_processo;
            sp_atz_evento.ParamByName('@CD_EVENTO_TXT').AsString   := 'CD_EV_CONF_DOCS';
            sp_atz_evento.ParamByName('@DT_REALIZACAO').AsDateTime := StrToDate( Copy( dt_fatura, 1, 2 ) + '/' +
                                                                                 Copy( dt_fatura, 4, 2 ) + '/' +
                                                                                 Copy( dt_fatura, 7, 4 ) );
            ExecStoredProc(sp_atz_evento);
            CloseStoredProc(sp_atz_evento);
          end;
        end;

        datm_main.db_broker.Commit;

        qry_exp_.Close;
        qry_exp_.ParamByName('NR_PROCESSO').AsString := str_nr_processo;
        qry_exp_.Open;
      end;

       ValidaBtnDesp( True );
    end;
  except
    on E: Exception do
    begin
      if datm_main.db_broker.InTransaction then datm_main.db_broker.Rollback;
      TrataErro(E);
      Grava := False;
    end;
  end;

  if ( Not (lCalculo) ) and ( btn_calculo.Enabled ) then
  begin
    // A linha abaixo foi substituida pelo calculo, pois criavam o RE sem calcular e ficavam com valores zerados - Michel - 23/01/2009
    //BoxMensagem( 'Processo deverá ser calculado !!', 3 );
    btn_calculoClick(btn_calculo);
  end;
end;

procedure Tfrm_exp_capa.Habilita_Entrada;
var
  i : integer;
begin
  for i := 0 to componentcount - 1 do
  begin
    if ( Components[i] is TLabel        ) then TLabel( Components[i] ).Enabled        := True;
    if ( Components[i] is TMaskEdit     ) then TMaskEdit( Components[i] ).Enabled     := True;
    if ( Components[i] is TSpeedButton  ) then TSpeedButton( Components[i] ).Enabled  := True;
    if ( Components[i] is TDBEdit       ) then TDBEdit( Components[i] ).Enabled       := True;
    if ( Components[i] is TDBRadioGroup ) then TDBRadioGroup( Components[i] ).Enabled := True;
    if ( Components[i] is TRadioButton  ) then TRadioButton( Components[i] ).Enabled  := True;
    if ( Components[i] is TDBCheckBox   ) then TDBCheckBox( Components[i] ).Enabled   := True;
    if ( Components[i] is TDBLookupComboBox ) then TDBLookupComboBox( Components[i] ).Enabled := True;
  end;
  btn_sair.Enabled    := True;
  mi_sair.Enabled     := True;
  btn_incluir.Enabled := False;
  mi_incluir.Enabled  := False;
end;

procedure Tfrm_exp_capa.Zera_Numero;
begin
  NullToZero( datm_exp_capa.qry_exp_VL_FRETE              );
  NullToZero( datm_exp_capa.qry_exp_VL_INLAND_FREIGHT     );
  NullToZero( datm_exp_capa.qry_exp_VL_SEGURO             );
  NullToZero( datm_exp_capa.qry_exp_VL_PESO_BRUTO         );
  NullToZero( datm_exp_capa.qry_exp_VL_PESO_LIQUIDO       );
  NullToZero( datm_exp_capa.qry_exp_VL_ACRESCIMO          );
  NullToZero( datm_exp_capa.qry_exp_VL_DESCONTO           );
  NullToZero( datm_exp_capa.qry_exp_VL_COMISSAO_PERCENT   );
  NullToZero( datm_exp_capa.qry_exp_VL_TOT_ORIGEM         );
  NullToZero( datm_exp_capa.qry_exp_VL_TOT_CUBAGEM        );
  NullToZero( datm_exp_capa.qry_exp_VL_TOT_FOB            );
  NullToZero( datm_exp_capa.qry_exp_VL_TOT_COM_AGENTE     );
  NullToZero( datm_exp_capa.qry_exp_VL_TOT_QTDE_PROD      );
  NullToZero( datm_exp_capa.qry_exp_VL_TOT_QTDE_EMBALAGEM );
  NullToZero( datm_exp_capa.qry_exp_VL_TOT_MCV            );
  NullToZero( datm_exp_capa.qry_exp_VL_TX_CAMBIO          );
  NullToZero( datm_exp_capa.qry_exp_VL_TOT_CONTAINER      );
  NullToZero( datm_exp_capa.qry_exp_VL_TOT_PALLETS        );
  NullToZero( datm_exp_capa.qry_exp_VL_TOT_EXW            );

  if datm_exp_capa.qry_exp_IN_DRAWBACK.AsBoolean <> True then
     datm_exp_capa.qry_exp_IN_DRAWBACK.Value := False;
  if datm_exp_capa.qry_exp_IN_VENDA_INCOTERM.AsBoolean <> True then
     datm_exp_capa.qry_exp_IN_VENDA_INCOTERM.Value := False;
  if datm_exp_capa.qry_exp_IN_REFERENCIA_FAT_INST.AsString <> '1' then
     datm_exp_capa.qry_exp_IN_REFERENCIA_FAT_INST.AsString := '0';
end;

procedure Tfrm_exp_capa.btn_co_incotermClick(Sender: TObject);
begin
  with datm_exp_capa do begin
    if Sender is TSpeedButton then begin
      If Not PoeEmEdicao(qry_exp_) Then Exit;
      If (Sender as TSpeedButton).Enabled Then
        qry_exp_CD_INCOTERM.AsString := ConsultaOnLineEx('TINCOTERMS_VENDA','Incoterms',['CODIGO','DESCRICAO'],['Código','Incoterm'],'CODIGO');
    end;

    if ds_exp.State in [dsInsert, dsEdit] then
      if (qry_exp_CD_INCOTERM.AsString = 'FOB') or (qry_exp_CD_INCOTERM.AsString = 'EXW') or (qry_exp_CD_INCOTERM.AsString = 'FCA') then
        qry_exp_CD_TIPO_FRETE.AsString := '0'  //colect
      else
        qry_exp_CD_TIPO_FRETE.AsString := '1'; //prepaid
  end;
end;

procedure Tfrm_exp_capa.pgctrl_exp_capaChanging(Sender: TObject; var AllowChange: Boolean);
begin
  AllowChange := VerAlt;
end;

procedure Tfrm_exp_capa.pgctrl_exp_capaChange(Sender: TObject);
begin
  btn_incluir.Enabled := False;
  mi_incluir.Enabled  := False;

  if pgctrl_exp_capa.ActivePage = tbsht_capa_02 then
  begin
    lbl_incoterm.Caption := 'MCV Total ' + Trim( dbedt_cd_incoterm.Text );
    dbedt_vl_frete_intern.Color    := clMenu;
    dbedt_vl_frete_intern.ReadOnly := True;
    dbedt_vl_frete_intern.TabStop  := False;
    dbedt_vl_seguro.Color    := clMenu;
    dbedt_vl_seguro.ReadOnly := True;
    dbedt_vl_seguro.TabStop  := False;
    //liberado campo Frete Internacional também para DDU - (a pedido de Gisele 08/06/2007) - Kleber
    If (dbedt_cd_incoterm.Text = 'CIF') or
       (dbedt_cd_incoterm.Text = 'DAF') or
       (dbedt_cd_incoterm.Text = 'DES') or
       (dbedt_cd_incoterm.Text = 'DDP') or
       (dbedt_cd_incoterm.Text = 'CIP') or
       (dbedt_cd_incoterm.Text = 'C+I') or
       (dbedt_cd_incoterm.Text = 'CFR') or
       (dbedt_cd_incoterm.Text = 'CPT') or
       (dbedt_cd_incoterm.Text = 'DAP') or     //Solicitado também para DAP 18/01/2012  FERNANDA
       (dbedt_cd_incoterm.Text = 'DDU') then
    begin
      dbedt_vl_frete_intern.Color    := clWindow;
      dbedt_vl_frete_intern.ReadOnly := False;
      dbedt_vl_frete_intern.TabStop  := True;
      dbedt_vl_seguro.Color    := clWindow;
      dbedt_vl_seguro.ReadOnly := False;
      dbedt_vl_seguro.TabStop  := True;
      dbedt_vl_inland_freight.Color    := clWindow;
      dbedt_vl_inland_freight.ReadOnly := False;
      dbedt_vl_inland_freight.TabStop  := True;
    end;
  end
  else
  if pgctrl_exp_capa.ActivePage = tbsht_capa_03 then
  begin
    dbedt_cd_consignatario.Enabled := True;
    btn_co_consignatario.Enabled   := True;
    dbedt_cd_notificado1.Enabled   := True;
    btn_co_notificado1.Enabled     := True;
    dbedt_cd_notificado2.Enabled   := True;
    btn_co_notificado2.Enabled     := True;
    dbedt_cd_documento.Enabled     := True;
    btn_co_documento.Enabled       := True;
    dbedt_cd_copia.Enabled         := True;
    btn_co_copia.Enabled           := True;

    Habilita_Btn_CbBx( 1 );
    Habilita_Btn_CbBx( 2 );
    Habilita_Btn_CbBx( 3 );
    Habilita_Btn_CbBx( 4 );
    Habilita_Btn_CbBx( 5 );
  end
  else
  if pgctrl_exp_capa.ActivePage = tbsht_capa_04 then
  begin
    datm_exp_capa.qry_exp_desp_.Close;
    datm_exp_capa.qry_exp_desp_.ParamByName('NR_PROCESSO').AsString := str_nr_processo;
    datm_exp_capa.qry_exp_desp_.Open;

    btn_incluir.Enabled := True;
    mi_incluir.Enabled  := True;
    btn_excluir.Enabled := True;
    mi_excluir.Enabled  := True;

    ValidaBtnDesp( True );
    if datm_exp_capa.qry_exp_desp_.EOF then
    begin
      VerificaDesp( False );
      btn_excluir.Enabled := False;
      mi_excluir.Enabled  := False;
    end
    else VerificaDesp( True );
  end
  else
  if pgctrl_exp_capa.ActivePage = tbsht_capa_05 then
  begin
    datm_exp_capa.qry_exp_re_.Close;
    datm_exp_capa.qry_exp_re_.ParamByName('NR_PROCESSO').AsString := str_nr_processo;
    datm_exp_capa.qry_exp_re_.Open;

    datm_exp_capa.qry_tp_canal_.Close;
    datm_exp_capa.qry_tp_canal_.Open;

    btn_incluir.Enabled := True;
    mi_incluir.Enabled  := True;
    btn_excluir.Enabled := True;
    mi_excluir.Enabled  := True;

    ValidaBtnDesp( True );
    if datm_exp_capa.qry_exp_re_.EOF then
    begin
      VerificaDesp( False );
      btn_excluir.Enabled := False;
      mi_excluir.Enabled  := False;
    end
    else VerificaDesp( True );
  end
  else
  if pgctrl_exp_capa.ActivePage = tbsht_capa_07 then
  begin
    datm_exp_capa.qry_exp_nf_.Close;
    datm_exp_capa.qry_exp_nf_.ParamByName('NR_PROCESSO').AsString := str_nr_processo;
    datm_exp_capa.qry_exp_nf_.Open;

    btn_incluir.Enabled := True;
    mi_incluir.Enabled  := True;
    btn_excluir.Enabled := True;
    mi_excluir.Enabled  := True;

    ValidaBtnDesp( True );
    if datm_exp_capa.qry_exp_nf_.EOF then
    begin
      VerificaDesp( False );
      btn_excluir.Enabled := False;
      mi_excluir.Enabled  := False;
    end
    else
      VerificaDesp( True );
  end
  else
  if pgctrl_exp_capa.ActivePage = ts_NovoRe then
  begin

    with datm_exp_capa do
    begin
      qry_controle_re.Close;
      qry_controle_re.ParamByName('NR_PROCESSO').AsString := qry_exp_NR_PROCESSO.AsString;
      qry_controle_re.Open;

      if qry_controle_re.IsEmpty then
      begin
        ValidaBtnDesp(True);
        dbgrd_NovoRe.Enabled := false;
        btn_excluir.Enabled := False;
        mi_excluir.Enabled  := False;
      end
      else
      begin
        ValidaBtnDesp(True);
        dbgrd_NovoRe.Enabled := true;
      end;
    end;
    label6.caption := Copy(str_nr_processo, 5, 10);
  end
  else
  if pgctrl_exp_capa.ActivePage = ts_pedido then
  begin
    datm_exp_capa.qryProcContainer.close;
    datm_exp_capa.cdsProcContainer.close;
    datm_exp_capa.qryProcContainer.ParamByName('NR_PROCESSO').AsString := str_nr_processo;
    datm_exp_capa.qryProcContainer.open;
    datm_exp_capa.cdsProcContainer.open;

    datm_exp_capa.qry_exp_ped_.Close;
    datm_exp_capa.qry_exp_ped_.ParamByName('NR_PROCESSO').AsString := str_nr_processo;
    datm_exp_capa.qry_exp_ped_.Open;

    btn_incluir.Enabled := True;
    mi_incluir.Enabled  := True;
    btn_excluir.Enabled := True;
    mi_excluir.Enabled  := True;

    ValidaBtnDesp( True );
    if datm_exp_capa.qry_exp_ped_.EOF then
    begin
      VerificaDesp( False );
      btn_excluir.Enabled := False;
      mi_excluir.Enabled  := False;
    end
    else
      VerificaDesp( True );
  end
  else if pgctrl_exp_capa.ActivePage = ts_despacho then
  begin
    datm_exp_capa.qry_dde_re_.Close;
    datm_exp_capa.qry_dde_re_.ParamByName('NR_PROCESSO').AsString := str_nr_processo;
    datm_exp_capa.qry_dde_re_.Open;

    datm_exp_capa.qry_dde_nf_.Close;
    datm_exp_capa.qry_dde_nf_.ParamByName('NR_PROCESSO').AsString := str_nr_processo;
    datm_exp_capa.qry_dde_nf_.Open;

    VerificaDesp( not datm_exp_capa.qry_dde_re_.EOF );
    btn_excluir.Enabled := not datm_exp_capa.qry_dde_re_.EOF;
    mi_excluir.Enabled  := not datm_exp_capa.qry_dde_re_.EOF;

    btn_incluir.Enabled := True;
    mi_incluir.Enabled  := True;
    btn_excluir.Enabled := True;
    mi_excluir.Enabled  := True;
  end;
end;

procedure Tfrm_exp_capa.Habilita_Btn_CbBx( nNum : Integer );
begin
  with datm_exp_capa do begin
    if nNum = 1 then begin
      if qry_exp_TP_CONSIGNATARIO.IsNull or (qry_exp_TP_CONSIGNATARIO.AsString = '5') then begin
        dbedt_cd_consignatario.Enabled := False;
        edt_nm_consignatario.Text      := '';
        btn_co_consignatario.Enabled   := False;
      end
      else begin
        dbedt_cd_consignatario.Enabled := True;
        btn_co_consignatario.Enabled   := True;
        Muda_Lookup_Nm( 1, dblkcbox_consignatario.KeyValue );
      end;
    end
    else
    if nNum = 2 then begin
      if qry_exp_TP_NOTIFY1.IsNull or (qry_exp_TP_NOTIFY1.AsString = '5') then begin
        dbedt_cd_notificado1.Enabled := False;
        edt_nm_notificado1.Text      := '';
        btn_co_notificado1.Enabled   := False;
      end
      else begin
        dbedt_cd_notificado1.Enabled := True;
        btn_co_notificado1.Enabled   := True;
        Muda_Lookup_Nm( 2, dblkcbox_notificado1.KeyValue );
      end;
    end
    else
    if nNum = 3 then begin
      if qry_exp_TP_NOTIFY2.IsNull or (qry_exp_TP_NOTIFY2.AsString = '5') then begin
        dbedt_cd_notificado2.Enabled := False;
        edt_nm_notificado2.Text      := '';
        btn_co_notificado2.Enabled   := False;
      end
      else begin
        dbedt_cd_notificado2.Enabled := True;
        btn_co_notificado2.Enabled   := True;
        Muda_Lookup_Nm( 3, dblkcbox_notificado2.KeyValue );
      end;
    end
    else
    if nNum = 4 then begin
      if qry_exp_TP_DOCUMENTO.IsNull or (qry_exp_TP_DOCUMENTO.AsString = '5') then begin
        dbedt_cd_documento.Enabled := False;
        edt_nm_documento.Text      := '';
        btn_co_documento.Enabled   := False;
      end
      else begin
        dbedt_cd_documento.Enabled := True;
        btn_co_documento.Enabled   := True;
        Muda_Lookup_Nm( 4, dblkcbox_documento.KeyValue );
      end;
    end
    else
    if nNum = 5 then begin
      if qry_exp_TP_COPIA.IsNull or (qry_exp_TP_COPIA.AsString = '5') then begin
        dbedt_cd_copia.Enabled := False;
        edt_nm_copia.Text      := '';
        btn_co_copia.Enabled   := False;
      end
      else begin
        dbedt_cd_copia.Enabled := True;
        btn_co_copia.Enabled   := True;
        Muda_Lookup_Nm( 5, dblkcbox_copia.KeyValue );
      end;
    end;
  end;
end;

procedure Tfrm_exp_capa.dblkcbox_consignatarioExit(Sender: TObject);
begin
  dbedt_cd_consignatario.Text := '';
  Habilita_Btn_CbBx( 1 );
  if not datm_exp_capa.qry_exp_TP_CONSIGNATARIO.IsNull then
    if datm_exp_capa.qry_exp_TP_CONSIGNATARIO.AsString <> '5' then
      dbedt_cd_consignatario.SetFocus;
end;

procedure Tfrm_exp_capa.dblkcbox_notificado1Exit(Sender: TObject);
begin
  dbedt_cd_notificado1.Text := '';
  Habilita_Btn_CbBx( 2 );
  if not datm_exp_capa.qry_exp_TP_NOTIFY1.IsNull then
    if datm_exp_capa.qry_exp_TP_NOTIFY1.AsString <> '5' then
      dbedt_cd_notificado1.SetFocus;
end;

procedure Tfrm_exp_capa.dblkcbox_notificado2Exit(Sender: TObject);
begin
  dbedt_cd_notificado2.Text := '';
  Habilita_Btn_CbBx( 3 );
  if not datm_exp_capa.qry_exp_TP_NOTIFY2.IsNull then
    if datm_exp_capa.qry_exp_TP_NOTIFY2.AsString <> '5' then
      dbedt_cd_notificado2.SetFocus;
end;

procedure Tfrm_exp_capa.dblkcbox_documentoExit(Sender: TObject);
begin
  dbedt_cd_documento.Text := '';
  Habilita_Btn_CbBx( 4 );
  If not datm_exp_capa.qry_exp_TP_DOCUMENTO.IsNull then
    If datm_exp_capa.qry_exp_TP_DOCUMENTO.AsString <> '5' then
       dbedt_cd_documento.SetFocus;
end;

procedure Tfrm_exp_capa.dblkcbox_copiaExit(Sender: TObject);
begin
  dbedt_cd_copia.Text := '';
  Habilita_Btn_CbBx( 5 );
  If not datm_exp_capa.qry_exp_TP_COPIA.IsNull then
    If datm_exp_capa.qry_exp_TP_COPIA.AsString <> '5' then
       dbedt_cd_copia.SetFocus;
end;

procedure Tfrm_exp_capa.dbedt_cd_consignatarioExit(Sender: TObject);
begin
  If datm_exp_capa.qry_exp_.State in [dsEdit,dsInsert] then begin
    ValCodigo( dbedt_cd_consignatario, dbedt_cd_consignatario.MaxLength );
    if (dbedt_cd_consignatario.Text <> '') and (edt_nm_consignatario.Text = '') then begin
      BoxMensagem('Código do Consignatário inválido!',2);
      pgctrl_exp_capa.ActivePage := tbsht_capa_03;
      dbedt_cd_consignatario.SetFocus;
      Exit;
    end;
  end;
end;

procedure Tfrm_exp_capa.dbedt_cd_notificado1Exit(Sender: TObject);
begin
  If datm_exp_capa.qry_exp_.State in [dsEdit,dsInsert] then begin
    ValCodigo( dbedt_cd_notificado1, dbedt_cd_notificado1.MaxLength );
    if dbedt_cd_notificado1.Text <> '' then begin
      if ( edt_nm_notificado1.Text = '' ) then begin
        BoxMensagem('Código do Notificado-1 inválido!',2);
        pgctrl_exp_capa.ActivePage := tbsht_capa_03;
        dbedt_cd_notificado1.SetFocus;
        Exit;
      end;
    end;
  end;
end;

procedure Tfrm_exp_capa.dbedt_cd_notificado2Exit(Sender: TObject);
begin
  If datm_exp_capa.qry_exp_.State in [dsEdit,dsInsert] then begin
    ValCodigo( dbedt_cd_notificado2, dbedt_cd_notificado2.MaxLength );
    if dbedt_cd_notificado2.Text <> '' then begin
      if ( edt_nm_notificado2.Text = '' ) then begin
        BoxMensagem('Código do Notificado-2 inválido!',2);
        pgctrl_exp_capa.ActivePage := tbsht_capa_03;
        dbedt_cd_notificado2.SetFocus;
        Exit;
      end;
    end;
  end;
end;

procedure Tfrm_exp_capa.dbedt_cd_documentoExit(Sender: TObject);
begin
  If datm_exp_capa.qry_exp_.State in [dsEdit,dsInsert] then begin
    ValCodigo( dbedt_cd_documento, dbedt_cd_documento.MaxLength );
    if dbedt_cd_documento.Text <> '' then begin
      if ( edt_nm_documento.Text = '' ) then begin
        BoxMensagem('Código do Documento inválido!',2);
        pgctrl_exp_capa.ActivePage := tbsht_capa_03;
        dbedt_cd_documento.SetFocus;
        Exit;
      end;
    end;
  end;
end;

procedure Tfrm_exp_capa.dbedt_cd_copiaExit(Sender: TObject);
begin
  If datm_exp_capa.qry_exp_.State in [dsEdit,dsInsert] then begin
    ValCodigo( dbedt_cd_copia, dbedt_cd_copia.MaxLength );
    if dbedt_cd_copia.Text <> '' then begin
      if ( edt_nm_copia.Text = '' ) then begin
        BoxMensagem('Código da Cópia inválido!',2);
        pgctrl_exp_capa.ActivePage := tbsht_capa_03;
        dbedt_cd_copia.SetFocus;
        Exit;
      end;
    end;
  end;
end;

procedure Tfrm_exp_capa.btn_co_consignatarioClick(Sender: TObject);
//var vGrupo: string[3];
begin
//  vGrupo := ConsultaLookUp('TPROCESSO', 'NR_PROCESSO', datm_exp_capa.qry_exp_NR_PROCESSO.AsString, 'CD_GRUPO');

  with datm_exp_capa do
  begin
    if Sender is TSpeedButton then
    begin
      if Not PoeEmEdicao(qry_exp_) then
        Exit;
      if (Sender as TSpeedButton).Enabled then
      begin
        //Importador
        if dblkcbox_consignatario.KeyValue = 0 then
          qry_exp_CD_CONSIGNATARIO.AsString := ConsultaOnLineExSQL(
            'SELECT CD_EMPRESA, NM_EMPRESA, END_CIDADE, END_EMPRESA, END_NUMERO FROM TEMPRESA_EST (NOLOCK) WHERE IN_IMPORTADOR = ''1'' ' +
            ' AND CD_EMPRESA IN (SELECT CD_EMPRESA FROM TEMPRESA_EST_GRUPO (NOLOCK) WHERE CD_GRUPO = "'+ vGrupo +'") ',
            'Cadastro de Importadores',['CD_EMPRESA', 'NM_EMPRESA', 'END_CIDADE','END_EMPRESA', 'END_NUMERO' ],['Código','Importador','Cidade','Endereço','Numero'],'CD_EMPRESA',nil,qry_exp_CD_CONSIGNATARIO.AsString);


        //Agente
        if dblkcbox_consignatario.KeyValue = 1 then
          qry_exp_CD_CONSIGNATARIO.AsString := ConsultaOnLineExSQL(
            'SELECT CD_EMPRESA, NM_EMPRESA, AP_EMPRESA FROM TEMPRESA_EST (NOLOCK) WHERE IN_AGENTE = ''1'' AND IN_ATIVO = ''1'' ',
            'Agente',['CD_EMPRESA', 'NM_EMPRESA', 'AP_EMPRESA'],['Código', 'Nome', 'Apelido'], 'CD_EMPRESA');
        //Banco
        if dblkcbox_consignatario.KeyValue = 3 then
          qry_exp_CD_CONSIGNATARIO.AsString := ConsultaOnLineExSQL(
            'SELECT CD_EMPRESA, NM_EMPRESA, AP_EMPRESA FROM TEMPRESA_EST (NOLOCK) WHERE IN_BANCO = ''1'' AND IN_ATIVO = ''1'' ',
            'Banco',['CD_EMPRESA','NM_EMPRESA','AP_EMPRESA'],['Código','Nome','Apelido'],'CD_EMPRESA');
        //Transportadora
        if dblkcbox_consignatario.KeyValue = 2 then
          qry_exp_CD_CONSIGNATARIO.AsString := ConsultaOnLineEx('TTRANSPORTADOR_ITL','Transportador',['CODIGO', 'DESCRICAO'],['Código','Nome'],'CODIGO');
        //Despachante
        if dblkcbox_consignatario.KeyValue = 4 then
          qry_exp_CD_CONSIGNATARIO.AsString := ConsultaOnLineEx('TDESPACHANTE','Despachante',['CD_DESPACHANTE','NM_DESPACHANTE'],['Código','Nome'],'CD_DESPACHANTE');
        dbedt_cd_consignatarioExit(nil);
      end;
    end
    else
    begin
      //Importador
      if StrToIntDef(qry_exp_TP_CONSIGNATARIO.AsString, 5) = 0 then
        edt_nm_consignatario.Text := ConsultaLookUPSQL(
        ' SELECT NM_EMPRESA FROM TEMPRESA_EST (NOLOCK) WHERE IN_IMPORTADOR = 1 AND CD_EMPRESA = '''+ dbedt_cd_consignatario.Text +''' ' +
        ' AND CD_EMPRESA IN (SELECT CD_EMPRESA FROM TEMPRESA_EST_GRUPO (NOLOCK) WHERE CD_GRUPO = "'+ vGrupo +'") ','NM_EMPRESA');


      //Agente
      if StrToIntDef(qry_exp_TP_CONSIGNATARIO.AsString, 5) = 1 then
        edt_nm_consignatario.Text := ConsultaLookUPSQL(
          'SELECT NM_EMPRESA FROM TEMPRESA_EST (NOLOCK) '+
          'WHERE CD_EMPRESA = ''' + dbedt_cd_consignatario.Text +''' '+
          '  AND IN_AGENTE = ''1'' AND IN_ATIVO = ''1'' ','NM_EMPRESA');
      //Banco
      if StrToIntDef(qry_exp_TP_CONSIGNATARIO.AsString, 5) = 3 then
        edt_nm_consignatario.Text := ConsultaLookUPSQL(
          'SELECT NM_EMPRESA FROM TEMPRESA_EST (NOLOCK) ' +
          'WHERE CD_EMPRESA = ''' + dbedt_cd_consignatario.Text +''' '+
          '  AND IN_BANCO = ''1'' AND IN_ATIVO = ''1'' ','NM_EMPRESA');
      //Transportadora
      if StrToIntDef(qry_exp_TP_CONSIGNATARIO.AsString, 5) = 2 then
        edt_nm_consignatario.Text := ConsultaLookUP('TTRANSPORTADOR_ITL','CODIGO',dbedt_cd_consignatario.Text, 'DESCRICAO');
      //Despachante
      if StrToIntDef(qry_exp_TP_CONSIGNATARIO.AsString, 5) = 4 then
        edt_nm_consignatario.Text := ConsultaLookUP('TDESPACHANTE','CD_DESPACHANTE',dbedt_cd_consignatario.Text, 'NM_DESPACHANTE');
    end;
  end;
end;

procedure Tfrm_exp_capa.btn_co_notificado1Click(Sender: TObject);
//var  vGrupo: string[3];
begin
 // vGrupo := ConsultaLookUp('TPROCESSO', 'NR_PROCESSO', datm_exp_capa.qry_exp_NR_PROCESSO.AsString, 'CD_GRUPO');
  with datm_exp_capa do
  begin
    if Sender is TSpeedButton then
    begin
      if Not PoeEmEdicao(qry_exp_) then
       Exit;
      if (Sender as TSpeedButton).Enabled then
      begin
        //Importador
        if dblkcbox_notificado1.KeyValue = 0 then
          qry_exp_CD_NOTIFY1.AsString := ConsultaOnLineExSQL(
            'SELECT CD_EMPRESA, NM_EMPRESA, END_CIDADE, END_EMPRESA, END_NUMERO FROM TEMPRESA_EST (NOLOCK) WHERE IN_IMPORTADOR = ''1'' ' +
            ' AND CD_EMPRESA IN (SELECT CD_EMPRESA FROM TEMPRESA_EST_GRUPO (NOLOCK) WHERE CD_GRUPO = "'+ vGrupo +'") ',
            'Cadastro de Importadores',['CD_EMPRESA', 'NM_EMPRESA', 'END_CIDADE','END_EMPRESA', 'END_NUMERO' ],['Código','Importador','Cidade','Endereço','Numero'],'CD_EMPRESA',nil,qry_exp_CD_NOTIFY1.AsString);



        //Agente
        if dblkcbox_notificado1.KeyValue = 1 then
          qry_exp_CD_NOTIFY1.AsString := ConsultaOnLineExSQL(
            'SELECT CD_EMPRESA, NM_EMPRESA, AP_EMPRESA FROM TEMPRESA_EST (NOLOCK) WHERE IN_AGENTE = ''1'' AND IN_ATIVO = ''1'' ',
            'Agente',['CD_EMPRESA', 'NM_EMPRESA', 'AP_EMPRESA'],['Código', 'Nome', 'Apelido'], 'CD_EMPRESA');
        //Banco
        if dblkcbox_notificado1.KeyValue = 3 then
          qry_exp_CD_NOTIFY1.AsString := ConsultaOnLineExSQL(
            'SELECT CD_EMPRESA, NM_EMPRESA, AP_EMPRESA FROM TEMPRESA_EST (NOLOCK) WHERE IN_BANCO = ''1'' AND IN_ATIVO = ''1'' ',
            'Banco',['CD_EMPRESA','NM_EMPRESA','AP_EMPRESA'],['Código','Nome','Apelido'],'CD_EMPRESA');
        //Transportadora
        if dblkcbox_notificado1.KeyValue = 2 then
          qry_exp_CD_NOTIFY1.AsString := ConsultaOnLineEx('TTRANSPORTADOR_ITL','Transportador',['CODIGO', 'DESCRICAO'],['Código','Nome'],'CODIGO');
        //Despachante
        if dblkcbox_notificado1.KeyValue = 4 then
          qry_exp_CD_NOTIFY1.AsString := ConsultaOnLineEx('TDESPACHANTE','Despachante',['CD_DESPACHANTE','NM_DESPACHANTE'],['Código','Nome'],'CD_DESPACHANTE');
        dbedt_cd_notificado1Exit(nil);
      end;
    end
    else begin
      //Importador
      if StrToIntDef(qry_exp_TP_NOTIFY1.AsString, 5) = 0 then
        edt_nm_notificado1.Text := ConsultaLookUPSQL(
        ' SELECT NM_EMPRESA FROM TEMPRESA_EST (NOLOCK) WHERE IN_IMPORTADOR = 1 AND CD_EMPRESA = '''+ dbedt_cd_notificado1.Text +''' ' +
        ' AND CD_EMPRESA IN (SELECT CD_EMPRESA FROM TEMPRESA_EST_GRUPO (NOLOCK) WHERE CD_GRUPO = "'+ vGrupo +'") ','NM_EMPRESA');


      //Agente
      if StrToIntDef(qry_exp_TP_NOTIFY1.AsString, 5) = 1 then
        edt_nm_notificado1.Text := ConsultaLookUPSQL(
          'SELECT NM_EMPRESA FROM TEMPRESA_EST (NOLOCK) '+
          'WHERE CD_EMPRESA = ''' + dbedt_cd_notificado1.Text +''' '+
          '  AND IN_AGENTE = ''1'' AND IN_ATIVO = ''1'' ','NM_EMPRESA');

      //Banco
      if StrToIntDef(qry_exp_TP_NOTIFY1.AsString, 5) = 3 then
        edt_nm_notificado1.Text := ConsultaLookUPSQL(
          'SELECT NM_EMPRESA FROM TEMPRESA_EST (NOLOCK) ' +
          'WHERE CD_EMPRESA = ''' + dbedt_cd_notificado1.Text +''' '+
          '  AND IN_BANCO = ''1'' AND IN_ATIVO = ''1'' ','NM_EMPRESA');
      //Transportadora
      if StrToIntDef(qry_exp_TP_NOTIFY1.AsString, 5) = 2 then
        edt_nm_notificado1.Text := ConsultaLookUP('TTRANSPORTADOR_ITL','CODIGO',dbedt_cd_notificado1.Text, 'DESCRICAO');
      //Despachante
      if StrToIntDef(qry_exp_TP_NOTIFY1.AsString, 5) = 4 then
        edt_nm_notificado1.Text := ConsultaLookUP('TDESPACHANTE','CD_DESPACHANTE',dbedt_cd_notificado1.Text, 'NM_DESPACHANTE');
    end;
  end;
end;

procedure Tfrm_exp_capa.btn_co_notificado2Click(Sender: TObject);
//var vGrupo: string[3];
begin
  //vGrupo := ConsultaLookUp('TPROCESSO', 'NR_PROCESSO', datm_exp_capa.qry_exp_NR_PROCESSO.AsString, 'CD_GRUPO');
  with datm_exp_capa do begin
    if Sender is TSpeedButton then begin
      if Not PoeEmEdicao(qry_exp_) then Exit;
      if (Sender as TSpeedButton).Enabled then begin
        //Importador
        if dblkcbox_notificado2.KeyValue = 0 then
          qry_exp_CD_NOTIFY2.AsString := ConsultaOnLineExSQL(
            'SELECT CD_EMPRESA, NM_EMPRESA, END_CIDADE, END_EMPRESA, END_NUMERO FROM TEMPRESA_EST (NOLOCK) WHERE IN_IMPORTADOR = ''1'' ' +
            ' AND CD_EMPRESA IN (SELECT CD_EMPRESA FROM TEMPRESA_EST_GRUPO (NOLOCK) WHERE CD_GRUPO = "'+ vGrupo +'") ',
            'Cadastro de Importadores',['CD_EMPRESA', 'NM_EMPRESA', 'END_CIDADE','END_EMPRESA', 'END_NUMERO' ],['Código','Importador','Cidade','Endereço','Numero'],'CD_EMPRESA',nil,qry_exp_CD_NOTIFY2.AsString);



        //Agente
        if dblkcbox_notificado2.KeyValue = 1 then
          qry_exp_CD_NOTIFY2.AsString := ConsultaOnLineExSQL(
            'SELECT CD_EMPRESA, NM_EMPRESA, AP_EMPRESA FROM TEMPRESA_EST (NOLOCK) WHERE IN_AGENTE = ''1'' AND IN_ATIVO = ''1'' ',
            'Agente',['CD_EMPRESA', 'NM_EMPRESA', 'AP_EMPRESA'],['Código', 'Nome', 'Apelido'], 'CD_EMPRESA');
        //Banco
        if dblkcbox_notificado2.KeyValue = 3 then
          qry_exp_CD_NOTIFY2.AsString := ConsultaOnLineExSQL(
            'SELECT CD_EMPRESA, NM_EMPRESA, AP_EMPRESA FROM TEMPRESA_EST (NOLOCK) WHERE IN_BANCO = ''1'' AND IN_ATIVO = ''1'' ',
            'Banco',['CD_EMPRESA','NM_EMPRESA','AP_EMPRESA'],['Código','Nome','Apelido'],'CD_EMPRESA');
        //Transportadora
        if dblkcbox_notificado2.KeyValue = 2 then
          qry_exp_CD_NOTIFY2.AsString := ConsultaOnLineEx('TTRANSPORTADOR_ITL','Transportador',['CODIGO', 'DESCRICAO'],['Código','Nome'],'CODIGO');
        //Despachante
        if dblkcbox_notificado2.KeyValue = 4 then
          qry_exp_CD_NOTIFY2.AsString := ConsultaOnLineEx('TDESPACHANTE','Despachante',['CD_DESPACHANTE','NM_DESPACHANTE'],['Código','Nome'],'CD_DESPACHANTE');
      end;
      //dbedt_cd_notificado2Exit(dbedt_cd_notificado2);
    end
    else begin
      //Importador
      if StrToIntDef(qry_exp_TP_NOTIFY2.AsString, 5) = 0 then
        edt_nm_notificado2.Text := ConsultaLookUPSQL(
        ' SELECT NM_EMPRESA FROM TEMPRESA_EST (NOLOCK) WHERE IN_IMPORTADOR = 1 AND CD_EMPRESA = '''+ dbedt_cd_notificado2.Text +''' ' +
        ' AND CD_EMPRESA IN (SELECT CD_EMPRESA FROM TEMPRESA_EST_GRUPO (NOLOCK) WHERE CD_GRUPO = "'+ vGrupo +'") ','NM_EMPRESA');


      //Agente
      if StrToIntDef(qry_exp_TP_NOTIFY2.AsString, 5) = 1 then
        edt_nm_notificado2.Text := ConsultaLookUPSQL(
          'SELECT NM_EMPRESA FROM TEMPRESA_EST (NOLOCK) '+
          'WHERE CD_EMPRESA = ''' + dbedt_cd_notificado2.Text +''' '+
          '  AND IN_AGENTE = ''1'' AND IN_ATIVO = ''1'' ','NM_EMPRESA');
      //Banco
      if StrToIntDef(qry_exp_TP_NOTIFY2.AsString, 5) = 3 then
        edt_nm_notificado2.Text := ConsultaLookUPSQL(
          'SELECT NM_EMPRESA FROM TEMPRESA_EST (NOLOCK) ' +
          'WHERE CD_EMPRESA = ''' + dbedt_cd_notificado2.Text +''' '+
          '  AND IN_BANCO = ''1'' AND IN_ATIVO = ''1'' ','NM_EMPRESA');
      //Transportadora
      if StrToIntDef(qry_exp_TP_NOTIFY2.AsString, 5) = 2 then
        edt_nm_notificado2.Text := ConsultaLookUP('TTRANSPORTADOR_ITL','CODIGO',dbedt_cd_notificado2.Text, 'DESCRICAO');
      //Despachante
      if StrToIntDef(qry_exp_TP_NOTIFY2.AsString, 5) = 4 then
        edt_nm_notificado2.Text := ConsultaLookUP('TDESPACHANTE','CD_DESPACHANTE',dbedt_cd_notificado2.Text, 'NM_DESPACHANTE');
    end;
  end;
end;
procedure Tfrm_exp_capa.btn_co_documentoClick(Sender: TObject);
//Var vGrupo:String[3];
begin
//  vGrupo := ConsultaLookUp('TPROCESSO', 'NR_PROCESSO', datm_exp_capa.qry_exp_NR_PROCESSO.AsString, 'CD_GRUPO');
  with datm_exp_capa do begin
    if Sender is TSpeedButton then begin
      if Not PoeEmEdicao(qry_exp_) then Exit;
      if (Sender as TSpeedButton).Enabled then begin
        //Importador
        if dblkcbox_documento.KeyValue = 0 then
          qry_exp_CD_DOCUMENTO.AsString := ConsultaOnLineExSQL(
            'SELECT CD_EMPRESA, NM_EMPRESA, END_CIDADE, END_EMPRESA, END_NUMERO FROM TEMPRESA_EST (NOLOCK) WHERE IN_IMPORTADOR = ''1'' ' +
            ' AND CD_EMPRESA IN (SELECT CD_EMPRESA FROM TEMPRESA_EST_GRUPO (NOLOCK) WHERE CD_GRUPO = "'+ vGrupo +'") ',
            'Cadastro de Importadores',['CD_EMPRESA', 'NM_EMPRESA', 'END_CIDADE','END_EMPRESA', 'END_NUMERO' ],['Código','Importador','Cidade','Endereço','Numero'],'CD_EMPRESA',nil,qry_exp_CD_DOCUMENTO.AsString);


        //Agente
        if dblkcbox_documento.KeyValue = 1 then
          qry_exp_CD_DOCUMENTO.AsString := ConsultaOnLineExSQL(
            'SELECT CD_EMPRESA, NM_EMPRESA, AP_EMPRESA FROM TEMPRESA_EST (NOLOCK) WHERE IN_AGENTE = ''1'' AND IN_ATIVO = ''1'' ',
            'Agente',['CD_EMPRESA', 'NM_EMPRESA', 'AP_EMPRESA'],['Código', 'Nome', 'Apelido'], 'CD_EMPRESA');
        //Banco
        if dblkcbox_documento.KeyValue = 3 then
          qry_exp_CD_DOCUMENTO.AsString := ConsultaOnLineExSQL(
            'SELECT CD_EMPRESA, NM_EMPRESA, AP_EMPRESA FROM TEMPRESA_EST (NOLOCK) WHERE IN_BANCO = ''1'' AND IN_ATIVO = ''1'' ',
            'Banco',['CD_EMPRESA','NM_EMPRESA','AP_EMPRESA'],['Código','Nome','Apelido'],'CD_EMPRESA');
        //Transportadora
        if dblkcbox_documento.KeyValue = 2 then
          qry_exp_CD_DOCUMENTO.AsString := ConsultaOnLineEx('TTRANSPORTADOR_ITL','Transportador',['CODIGO', 'DESCRICAO'],['Código','Nome'],'CODIGO');
        //Despachante
        if dblkcbox_documento.KeyValue = 4 then
          qry_exp_CD_DOCUMENTO.AsString := ConsultaOnLineEx('TDESPACHANTE','Despachante',['CD_DESPACHANTE','NM_DESPACHANTE'],['Código','Nome'],'CD_DESPACHANTE');
      end;
      //dblkcbox_documentoExit(dblkcbox_documento);
    end
    else begin
      //Importador
      if StrToIntDef(qry_exp_TP_DOCUMENTO.AsString, 5) = 0 then
        edt_nm_documento.Text := ConsultaLookUPSQL(
          'SELECT NM_EMPRESA FROM TEMPRESA_EST (NOLOCK) ' +
          'WHERE CD_EMPRESA = ''' + dbedt_cd_documento.Text +''' '+
          '  AND IN_IMPORTADOR = ''1'' AND IN_ATIVO = ''1'' ','NM_EMPRESA');
      //Agente
      if StrToIntDef(qry_exp_TP_DOCUMENTO.AsString, 5) = 1 then
        edt_nm_documento.Text := ConsultaLookUPSQL(
          'SELECT NM_EMPRESA FROM TEMPRESA_EST (NOLOCK) '+
          'WHERE CD_EMPRESA = ''' + dbedt_cd_documento.Text +''' '+
          '  AND IN_AGENTE = ''1'' AND IN_ATIVO = ''1'' ','NM_EMPRESA');
      //Banco
      if StrToIntDef(qry_exp_TP_DOCUMENTO.AsString, 5) = 3 then
        edt_nm_documento.Text := ConsultaLookUPSQL(
          'SELECT NM_EMPRESA FROM TEMPRESA_EST (NOLOCK) ' +
          'WHERE CD_EMPRESA = ''' + dbedt_cd_documento.Text +''' '+
          '  AND IN_BANCO = ''1'' AND IN_ATIVO = ''1'' ','NM_EMPRESA');
      //Transportadora
      if StrToIntDef(qry_exp_TP_DOCUMENTO.AsString, 5) = 2 then
        edt_nm_documento.Text := ConsultaLookUP('TTRANSPORTADOR_ITL','CODIGO',dbedt_cd_documento.Text, 'DESCRICAO');
      //Despachante
      if StrToIntDef(qry_exp_TP_DOCUMENTO.AsString, 5) = 4 then
        edt_nm_documento.Text := ConsultaLookUP('TDESPACHANTE','CD_DESPACHANTE',dbedt_cd_documento.Text, 'NM_DESPACHANTE');
    end;
  end;
end;

procedure Tfrm_exp_capa.btn_co_copiaClick(Sender: TObject);
//var vGrupo:String[3];
begin
//   vGrupo := ConsultaLookUp('TPROCESSO', 'NR_PROCESSO', datm_exp_capa.qry_exp_NR_PROCESSO.AsString, 'CD_GRUPO');
    with datm_exp_capa do begin
    if Sender is TSpeedButton then begin
      if Not PoeEmEdicao(qry_exp_) then Exit;
      if (Sender as TSpeedButton).Enabled then begin
        //Importador
        if dblkcbox_copia.KeyValue = 0 then
          qry_exp_CD_COPIA.AsString := ConsultaOnLineExSQL(
            'SELECT CD_EMPRESA, NM_EMPRESA, END_CIDADE, END_EMPRESA, END_NUMERO FROM TEMPRESA_EST (NOLOCK) WHERE IN_IMPORTADOR = ''1'' ' +
            ' AND CD_EMPRESA IN (SELECT CD_EMPRESA FROM TEMPRESA_EST_GRUPO (NOLOCK) WHERE CD_GRUPO = "'+ vGrupo +'") ',
            'Cadastro de Importadores',['CD_EMPRESA', 'NM_EMPRESA', 'END_CIDADE','END_EMPRESA', 'END_NUMERO' ],['Código','Importador','Cidade','Endereço','Numero'],'CD_EMPRESA',nil,qry_exp_CD_COPIA.AsString);


        //Agente
        if dblkcbox_copia.KeyValue = 1 then
          qry_exp_CD_COPIA.AsString := ConsultaOnLineExSQL(
            'SELECT CD_EMPRESA, NM_EMPRESA, AP_EMPRESA FROM TEMPRESA_EST (NOLOCK) WHERE IN_AGENTE = ''1'' AND IN_ATIVO = ''1'' ',
            'Agente',['CD_EMPRESA', 'NM_EMPRESA', 'AP_EMPRESA'],['Código', 'Nome', 'Apelido'], 'CD_EMPRESA');
        //Banco
        if dblkcbox_copia.KeyValue = 3 then
          qry_exp_CD_COPIA.AsString := ConsultaOnLineExSQL(
            'SELECT CD_EMPRESA, NM_EMPRESA, AP_EMPRESA FROM TEMPRESA_EST (NOLOCK) WHERE IN_BANCO = ''1'' AND IN_ATIVO = ''1'' ',
            'Banco',['CD_EMPRESA','NM_EMPRESA','AP_EMPRESA'],['Código','Nome','Apelido'],'CD_EMPRESA');
        //Transportadora
        if dblkcbox_copia.KeyValue = 2 then
          qry_exp_CD_COPIA.AsString := ConsultaOnLineEx('TTRANSPORTADOR_ITL','Transportador',['CODIGO', 'DESCRICAO'],['Código','Nome'],'CODIGO');
        //Despachante
        if dblkcbox_copia.KeyValue = 4 then
          qry_exp_CD_COPIA.AsString := ConsultaOnLineEx('TDESPACHANTE','Despachante',['CD_DESPACHANTE','NM_DESPACHANTE'],['Código','Nome'],'CD_DESPACHANTE');
      end;
      //dblkcbox_copiaExit(dblkcbox_copia);
    end
    else begin
      //Importador
      if StrToIntDef(qry_exp_TP_COPIA.AsString, 5) = 0 then
        edt_nm_copia.Text := ConsultaLookUPSQL(
          'SELECT NM_EMPRESA FROM TEMPRESA_EST (NOLOCK) ' +
          'WHERE CD_EMPRESA = ''' + dbedt_cd_copia.Text +''' '+
          '  AND IN_IMPORTADOR = ''1'' AND IN_ATIVO = ''1'' ','NM_EMPRESA');
      //Agente
      if StrToIntDef(qry_exp_TP_COPIA.AsString, 5) = 1 then
        edt_nm_copia.Text := ConsultaLookUPSQL(
          'SELECT NM_EMPRESA FROM TEMPRESA_EST (NOLOCK) '+
          'WHERE CD_EMPRESA = ''' + dbedt_cd_copia.Text +''' '+
          '  AND IN_AGENTE = ''1'' AND IN_ATIVO = ''1'' ','NM_EMPRESA');
      //Banco
      if StrToIntDef(qry_exp_TP_COPIA.AsString, 5) = 3 then
        edt_nm_copia.Text := ConsultaLookUPSQL(
          'SELECT NM_EMPRESA FROM TEMPRESA_EST (NOLOCK) ' +
          'WHERE CD_EMPRESA = ''' + dbedt_cd_copia.Text +''' '+
          '  AND IN_BANCO = ''1'' AND IN_ATIVO = ''1'' ','NM_EMPRESA');
      //Transportadora
      if StrToIntDef(qry_exp_TP_COPIA.AsString, 5) = 2 then
        edt_nm_copia.Text := ConsultaLookUP('TTRANSPORTADOR_ITL','CODIGO',dbedt_cd_copia.Text, 'DESCRICAO');
      //Despachante
      if StrToIntDef(qry_exp_TP_COPIA.AsString, 5) = 4 then
        edt_nm_copia.Text := ConsultaLookUP('TDESPACHANTE','CD_DESPACHANTE',dbedt_cd_copia.Text, 'NM_DESPACHANTE');
    end;
  end;
end;

procedure Tfrm_exp_capa.Muda_Lookup_Nm( nNum:Integer; nTp : Integer );
begin
   // nNum
   // 1 - Consignatario
   // 2 - Notificado 1
   // 3 - Notificado 2
   // 4 - Documento
   // 5 - Copia

   // nTp
   // 0 - Importador
   // 1 - Agente
   // 2 - Transportadora
   // 3 - Banco
   // 4 - Despachante

   // Tamanha para MaxLength
   // Importador = 5
   // Agente = 5
   // Transportadora  = 4
   // Banco = 5
   // Despachante = 3
   If nNum = 1 then
   begin
     If (nTp = 0) or (nTp = 1) or (nTp = 3) then
       dbedt_cd_consignatario.MaxLength := 5;
     If nTp = 2 then
       dbedt_cd_consignatario.MaxLength := 4;
     If nTp = 4 then
       dbedt_cd_consignatario.MaxLength := 3;
   end;

   If nNum = 2 then
   begin
     If (nTp = 0) or (nTp = 1) or (nTp = 3) then
       dbedt_cd_notificado1.MaxLength := 5;
     If nTp = 2 then
       dbedt_cd_notificado1.MaxLength := 4;
     If nTp = 4 then
       dbedt_cd_notificado1.MaxLength := 3;
   end;

   If nNum = 3 then
   begin
     If (nTp = 0) or (nTp = 1) or (nTp = 3) then
       dbedt_cd_notificado2.MaxLength := 5;
     If nTp = 2 then
       dbedt_cd_notificado2.MaxLength := 4;
     If nTp = 4 then
       dbedt_cd_notificado2.MaxLength := 3;
   end;

   If nNum = 4 then
   begin
     If (nTp = 0) or (nTp = 1) or (nTp = 3) then
       dbedt_cd_documento.MaxLength := 5;
     If nTp = 2 then
       dbedt_cd_documento.MaxLength := 4;
     If nTp = 4 then
       dbedt_cd_documento.MaxLength := 3;
   end;

   If nNum = 5 then
   begin
     If (nTp = 0) or (nTp = 1) or (nTp = 3) then
       dbedt_cd_copia.MaxLength := 5;
     If nTp = 2 then
       dbedt_cd_copia.MaxLength := 4;
     If nTp = 4 then
       dbedt_cd_copia.MaxLength := 3;
   end;
end;

procedure Tfrm_exp_capa.ValCodigo( dbedit_Codigo : TDbEdit; nNum : Integer );
var
  nLoop, nFim : Byte;
  lDigitouLetras : Boolean;
  nNumero : Double;
begin
  lDigitouLetras := False;
  if dbedit_Codigo.Field.Size = 0 then Exit;
  nFim := Length(Trim(dbedit_Codigo.Text));

  if nFim > 0 then
  begin
    nLoop := 1;
    Repeat
      if Not (dbedit_Codigo.Text[nLoop] In ['0'..'9'] ) then
         lDigitouLetras := True;
      nLoop := nLoop + 1;
    Until (lDigitouLetras) or ( nLoop > nFim );
    //  SE O USUÁRIO NÃO DIGITOU LETRAS NO CÓDIGO
    if Not( lDigitouLetras ) then
    begin
      nNumero := StrToFloat(dbedit_Codigo.Text);
      if Not dbedit_codigo.ReadOnly then
      dbedit_Codigo.field.AsString := StrZero( nNumero, nNum );
    end;
  end;
end;

procedure Tfrm_exp_capa.dbedt_vl_frete_internExit(Sender: TObject);
begin
  If datm_exp_capa.qry_exp_.State in [dsEdit,dsInsert] then
     If datm_exp_capa.qry_exp_VL_FRETE.AsFloat <> vl_old then
        datm_exp_capa.qry_exp_VL_TOT_MCV.AsFloat := (datm_exp_capa.qry_exp_VL_TOT_MCV.AsFloat - vl_old) +
                                                     datm_exp_capa.qry_exp_VL_FRETE.AsFloat;
end;

procedure Tfrm_exp_capa.dbedt_vl_seguroExit(Sender: TObject);
begin
  If datm_exp_capa.qry_exp_.State in [dsEdit,dsInsert] then
     If datm_exp_capa.qry_exp_VL_SEGURO.AsFloat <> vl_old then
        datm_exp_capa.qry_exp_VL_TOT_MCV.AsFloat := (datm_exp_capa.qry_exp_VL_TOT_MCV.AsFloat - vl_old) +
                                                     datm_exp_capa.qry_exp_VL_SEGURO.AsFloat;

end;

procedure Tfrm_exp_capa.dbedt_vl_frete_internEnter(Sender: TObject);
begin
  vl_old := datm_exp_capa.qry_exp_VL_FRETE.AsFloat;
end;

procedure Tfrm_exp_capa.dbedt_vl_seguroEnter(Sender: TObject);
begin
  vl_old := datm_exp_capa.qry_exp_VL_SEGURO.AsFloat;
end;

procedure Tfrm_exp_capa.btn_co_proc_newClick(Sender: TObject);
var
  vListAux : TStringList;
begin
  vListAux := TStringList.Create;
  vListAux.Add('SELECT SUBSTRING(PR.NR_PROCESSO,5,13) NR_PROCESSO, EN.NM_EMPRESA, PR.DT_ABERTURA, PR.CD_INCOTERM ');
  vListAux.Add('  FROM TPROCESSO PR (NOLOCK) ');
  vListAux.Add('  INNER JOIN TEMPRESA_NAC EN (NOLOCK) ON EN.CD_EMPRESA = PR.CD_CLIENTE');
  vListAux.Add('  WHERE PR.CD_UNID_NEG+PR.CD_PRODUTO = ''' + frm_exp.msk_cd_unid_neg.Text + '02''');
  vListAux.Add('    AND ISNULL(PR.IN_CANCELADO, 0) = ''0'' ');
  if chkProcessos.Checked then
    vListAux.Add('  AND PR.DT_ABERTURA > GETDATE() - ' + IntToStr(vQtdeDiasConsProc));

  mskedt_nr_processo.Text := ConsultaOnLineExSQLList(vListAux,'Consulta de Processos',['NR_PROCESSO','NM_EMPRESA','DT_ABERTURA','CD_INCOTERM'],['Processo','Empresa Nacional','Data de Registro','Incoterm'],'NR_PROCESSO',nil, mskedt_nr_processo.Text);

  vListAux.Free;

  {if Sender is TSpeedButton then
  begin
    If Not PoeEmEdicao(datm_exp_capa.qry_exp_) Then Exit;
    If (Sender as TSpeedButton).Enabled Then
        mskedt_nr_processo.Text := Copy(ConsultaOnLineExSQL(
          'SELECT  P.NR_PROCESSO, E.AP_EMPRESA, P.DT_REGISTRO_PEDIDO, P.CD_INCOTERM ' +
          'FROM TPROCESSO_EXP P, TEMPRESA_NAC E ' +
          'WHERE P.CD_EXPORTADOR *= E.CD_EMPRESA AND ' +
          'SUBSTRING(P.NR_PROCESSO, 1, 4) = ' + QuotedStr(frm_exp.msk_cd_unid_neg.Text + '02') ,
          'Consulta de Processos',
          ['NR_PROCESSO','AP_EMPRESA', 'DT_REGISTRO_PEDIDO', 'CD_INCOTERM'],
          ['Processo','Empresa Nacional', 'Data de Registro', 'Incoterm'],'NR_PROCESSO'), 5, 14);

  end; }

  mskedt_nr_processoExit(nil);
end;

procedure Tfrm_exp_capa.btn_co_itemClick(Sender: TObject);
begin
  with datm_exp_capa do begin
    if Sender is TSpeedButton then begin
      if Not PoeEmEdicao(qry_exp_desp_) then Exit;
      if (Sender as TSpeedButton).Enabled then
        qry_exp_desp_CD_ITEM.AsString := ConsultaOnLineEx('TITEM', 'Itens',['CD_ITEM','NM_ITEM'],['Código','Item'],'CD_ITEM');
    end
    else edt_nm_item.Text := ConsultaLookUP('TITEM', 'CD_ITEM', dbedt_cd_item.Text , 'NM_ITEM');
  end;
end;

procedure Tfrm_exp_capa.VerificaDesp(Habilita : Boolean);
begin
  if pgctrl_exp_capa.ActivePage = tbsht_capa_04 then
  begin
    dbgrd_exp_desp.Enabled     := Habilita;
    lbl_sequencia.Enabled      := Habilita;
    lbl_item.Enabled           := Habilita;
    lbl_valor.Enabled          := Habilita;
    dbedt_nr_sequencia.Enabled := Habilita;
    dbedt_cd_item.Enabled      := Habilita;
    dbedt_vl_despesa.Enabled   := Habilita;
    btn_co_item.Enabled        := Habilita;
  end
  else if pgctrl_exp_capa.ActivePage = tbsht_capa_05 then
  begin
    dbg_re.Enabled          := Habilita;
    lbl_re.Enabled          := Habilita;
    dbedt_nr_re.Enabled     := Habilita;
    lbl_data.Enabled        := Habilita;
    dbedt_dt_re.Enabled     := Habilita;
    lbl_nr_transm.Enabled   := Habilita;
    dbedt_nr_transm.Enabled := Habilita;
    lbl_cd_canal.Enabled    := Habilita;
    dbcbo_cd_canal.Enabled  := Habilita;
    lbl_nbm_sh.Enabled      := Habilita;
    dbedt_cd_nbm_sh.Enabled := Habilita;
    lbl_vl_fob.Enabled      := Habilita;
    dbedt_vl_fob.Enabled    := Habilita;
    lbl_peso_liq.Enabled    := Habilita;
    dbedt_peso_liq.Enabled  := Habilita;
  end
  else if pgctrl_exp_capa.ActivePage = tbsht_capa_07 then
  begin
    dbg_nf.Enabled      := Habilita;
    dbedt_nr_nf.Enabled := Habilita;
  end
  else if pgctrl_exp_capa.ActivePage = ts_pedido then
  begin
    dbgrd_pedido.Enabled               := Habilita;
    lbl_nr_pedido.Enabled              := Habilita;
    lbl_nr_fatura_ped.Enabled          := Habilita;
    lbl_tx_marcacao_volume_ped.Enabled := Habilita;
    lbl_tx_inf_embalagem_ped.Enabled   := Habilita;
    dbedt_nr_pedido.Enabled            := Habilita;
    dbedt_nr_fatura_ped.Enabled        := Habilita;
    dbm_tx_marcacao_volume_ped.Enabled := Habilita;
    dbm_tx_inf_embalagem_ped.Enabled   := Habilita;
  end
  else if pgctrl_exp_capa.ActivePage = ts_despacho then
  begin
    if pgctrl_despacho.ActivePage = ts_dde_re then
    begin
      dbgrd_re.Enabled           := Habilita;
      lbl_nr_re1.Enabled         := Habilita;
      dbedt_nr_re1.Enabled       := Habilita;
      lbl_nr_anexo_ini.Enabled   := Habilita;
      dbedt_nr_anexo_ini.Enabled := Habilita;
      lbl_nr_anexo_fim.Enabled   := Habilita;
      dbedt_nr_anexo_fim.Enabled := Habilita;
    end
    else if pgctrl_despacho.ActivePage = ts_dde_nf then
    begin
      dbgrd_nf.Enabled           := Habilita;
      lbl_nf_ini.Enabled         := Habilita;
      dbedt_nf_ini.Enabled       := Habilita;
      lbl_nf_fim.Enabled         := Habilita;
      dbedt_nf_fim.Enabled       := Habilita;
      lbl_serie.Enabled          := Habilita;
      dbedt_serie.Enabled        := Habilita;
    end;
  end;
end;

procedure Tfrm_exp_capa.dbgrd_exp_despDblClick(Sender: TObject);
begin
  VerificaDesp( True );
  dbedt_cd_item.SetFocus;
end;

procedure Tfrm_exp_capa.ValidaBtnDesp(Habilita : Boolean);
begin
  btn_incluir.Enabled  := Habilita;
  mi_incluir.Enabled   := Habilita;
  btn_excluir.Enabled  := Habilita;
  mi_excluir.Enabled   := Habilita;
  btn_itens_exp.Enabled:= Habilita;
  mi_itens_exp.Enabled := Habilita;
  btn_salvar.Enabled   := Not Habilita;
  mi_salvar.Enabled    := Not Habilita;
  btn_cancelar.Enabled := Not Habilita;
  mi_cancelar.Enabled  := Not Habilita;
end;

procedure Tfrm_exp_capa.btn_co_local_emissaoClick(Sender: TObject);
begin
  if Sender is TSpeedButton then
  begin
    If Not PoeEmEdicao(datm_exp_capa.qry_exp_) Then Exit;
    If (Sender as TSpeedButton).Enabled Then
     datm_exp_capa.qry_exp_CD_LOCAL_EMISSAO.AsString  := ConsultaOnLineEx('TLOCAL_EMISSAO', 'Locais de Emissão',['CODIGO','NOME'],['Código','Local de Emissão'],'CODIGO');
  end
  else edt_nm_local_emissao.Text := ConsultaLookUP('TLOCAL_EMISSAO','CODIGO', dbedt_cd_local_emissao.Text ,'NOME');
end;

procedure Tfrm_exp_capa.btn_co_obsClick(Sender: TObject);
begin
  if Sender is TSpeedButton then
  begin
    If Not PoeEmEdicao(datm_exp_capa.qry_exp_) Then Exit;
    If (Sender as TSpeedButton).Enabled Then
     datm_exp_capa.qry_exp_TX_OBSERVACAO.AsString := ConsultaOnLineEx('TOBSERVACOES', 'Observações' , ['CD_OBS', 'TX_DESCRICAO', 'TX_OBS'], ['Código', 'Descrição', 'Observação'], 'TX_OBS', nil, 0);
  end;
end;

procedure Tfrm_exp_capa.btn_co_pais_origemClick(Sender: TObject);
begin
  if Sender is TSpeedButton then
  begin
    If Not PoeEmEdicao(datm_exp_capa.qry_exp_) Then Exit;
    If (Sender as TSpeedButton).Enabled Then
      datm_exp_capa.qry_exp_CD_PAIS_ORIGEM.AsString := ConsultaOnLineEx('TPAIS', 'País de Origem', ['CODIGO', 'DESCRICAO'], ['Código', 'País'], 'CODIGO');
  end;
end;

procedure Tfrm_exp_capa.dbrgrp_fabr_expoChange(Sender: TObject);
begin
  if datm_exp_capa.qry_exp_.State in [dsEdit,dsInsert] then
  begin
   { if dbrgrp_fabr_expo.Value = '2' then
    begin
      datm_exp_capa.qry_exp_CD_FABRICANTE.AsString := '';
      edt_nm_fabricante.Text    := '';
    end
    else  }
    if not (dbrgrp_fabr_expo.Value = '2') then
    begin
      datm_exp_capa.qry_exp_CD_FABRICANTE.AsString  := '';
      datm_exp_capa.qry_exp_CD_PAIS_ORIGEM.AsString := '';
      edt_nm_fabricante.Text    := '';
    end;
  end;

  if dbrgrp_fabr_expo.Value = '0' then
  begin
    lbl_fabr.Enabled            := True;
    dbedt_cd_fabricante.Enabled := True;
    btn_co_fabricante.Enabled   := True;
    dbedt_cd_fabricante.TabStop := True;
    lbl_pais_origem.Enabled     := True;
    dbedt_cd_pais_origem.Enabled:= True;
    btn_co_pais_origem.Enabled  := True;
  end
  else
  if dbrgrp_fabr_expo.Value = '2' then
  begin
    lbl_fabr.Enabled            := true;
    dbedt_cd_fabricante.Enabled := true;
    btn_co_fabricante.Enabled   := true;
    dbedt_cd_fabricante.TabStop := true;

    lbl_pais_origem.Enabled     := True;
    dbedt_cd_pais_origem.Enabled:= True;
    btn_co_pais_origem.Enabled  := True;
    dbedt_cd_pais_origem.TabStop:= True;
  end
  else
  begin
    lbl_fabr.Enabled            := False;
    dbedt_cd_fabricante.Enabled := False;
    btn_co_fabricante.Enabled   := False;
    dbedt_cd_fabricante.TabStop := False;
    dbedt_cd_fabricante.Enabled := true;
    dbedt_cd_fabricante.TabStop := true;

    lbl_pais_origem.Enabled     := False;
    dbedt_cd_pais_origem.Enabled:= False;
    btn_co_pais_origem.Enabled  := False;
  end;
end;

procedure Tfrm_exp_capa.btn_co_fabricanteClick(Sender: TObject);
begin
  if Sender is TSpeedButton then begin
    If Not PoeEmEdicao(datm_exp_capa.qry_exp_) Then Exit;
    If (Sender as TSpeedButton).Enabled Then
      datm_exp_capa.qry_exp_CD_FABRICANTE.AsString := ConsultaOnLineEx('TEMPRESA_NAC', 'Fabricante/Produtor', ['CD_EMPRESA', 'NM_EMPRESA', 'AP_EMPRESA'], ['Código', 'Empresa', 'Apelido'], 'CD_EMPRESA');
  end
  else edt_nm_fabricante.Text := ConsultaLookUP('TEMPRESA_NAC', 'CD_EMPRESA', dbedt_cd_fabricante.Text, 'AP_EMPRESA');
end;

procedure Tfrm_exp_capa.btn_co_pais_origClick(Sender: TObject);
begin
  if Sender is TSpeedButton then begin
    If Not PoeEmEdicao(datm_exp_capa.qry_exp_) Then Exit;
    If (Sender as TSpeedButton).Enabled Then
      datm_exp_capa.qry_exp_CD_PAIS_ORIG.AsString := ConsultaOnLineEx('TPAIS', 'País de Origem', ['CODIGO', 'DESCRICAO'], ['Código', 'País'], 'CODIGO');
  end
  else edt_nm_pais_orig.Text := ConsultaLookUP('TPAIS', 'CODIGO', dbedt_cd_pais_orig.Text, 'DESCRICAO');
end;

procedure Tfrm_exp_capa.btn_co_merc_blClick(Sender: TObject);
begin
  if Sender is TSpeedButton then begin
    If Not PoeEmEdicao(datm_exp_capa.qry_exp_) Then Exit;
    If (Sender as TSpeedButton).Enabled Then
     datm_exp_capa.qry_exp_TX_MERCADORIA_BL.AsString := ConsultaOnLineEx('TOBSERVACOES', 'Observações' , ['CD_OBS', 'TX_DESCRICAO', 'TX_OBS'], ['Código', 'Descrição', 'Observação'], 'TX_OBS', nil, 0);
  end;
end;

procedure Tfrm_exp_capa.btn_co_termo_segClick(Sender: TObject);
begin
  if Sender is TSpeedButton then begin
    If Not PoeEmEdicao(datm_exp_capa.qry_exp_) Then Exit;
    If (Sender as TSpeedButton).Enabled Then
     datm_exp_capa.qry_exp_TX_TERMO_PAGTO.AsString := ConsultaOnLineEx('TOBSERVACOES', 'Observações' , ['CD_OBS', 'TX_DESCRICAO', 'TX_OBS'], ['Código', 'Descrição', 'Observação'], 'TX_OBS', nil, 0);
  end;
end;

procedure Tfrm_exp_capa.btn_co_banco_saque_borderoClick(Sender: TObject);
begin
  if Sender is TSpeedButton then begin
    if Not PoeEmEdicao(datm_exp_capa.qry_exp_) Then Exit;
    if (Sender as TSpeedButton).Enabled Then
      datm_exp_capa.qry_exp_CD_BANCO_SAQUE_BORDERO.AsString := ConsultaOnLineExSQL(
        'SELECT EE.CD_EMPRESA, EE.NM_EMPRESA, EE.AP_EMPRESA,        '+
        '      (SELECT RTRIM(LTRIM(NM_PAIS)) + '' ''                '+
        '         FROM TPAIS_BROKER (NOLOCK)                        '+
        '        WHERE CD_PAIS = EE.CD_PAIS) AS PAIS,               '+
        '      RTRIM(LTRIM(EE.END_CIDADE))   AS END_CIDADE,         '+
        '      ISNULL(RTRIM(LTRIM(EE.END_EMPRESA)), '''') + '' '' + '+
        '      ISNULL(RTRIM(LTRIM(EE.END_NUMERO)), '''') + '' '' +  '+
        '      ISNULL(RTRIM(LTRIM(EE.END_COMPL)), '''') AS ENDERECO '+
        '  FROM TEMPRESA_EST EE (NOLOCK)                            '+
        ' WHERE EE.IN_BANCO = ''1'' AND EE.IN_ATIVO = ''1'' ',
        'Banco',
        ['CD_EMPRESA', 'NM_EMPRESA', 'AP_EMPRESA', 'PAIS', 'END_CIDADE', 'ENDERECO'],
        ['Código', 'Nome', 'Apelido', 'País', 'Cidade', 'Endereço'],
        'CD_EMPRESA',
        nil, dbedt_cd_banco_saque_bordero.Text)
  end
  else
   edt_nm_banco_saque_bordero.Text := ConsultaLookUPSQL(
     'SELECT NM_EMPRESA FROM TEMPRESA_EST (NOLOCK) '+
     'WHERE CD_EMPRESA = '''+ dbedt_cd_banco_saque_bordero.Text +''' '+
     ' AND IN_BANCO = ''1'' AND IN_ATIVO = ''1'' ','NM_EMPRESA');
end;

procedure Tfrm_exp_capa.mskedt_nr_processoChange(Sender: TObject);
begin
  if Copy( mskedt_nr_processo.Text, 1, 1 ) = 'È' then
  begin
    BoxMensagem( 'Processo inválido', 2 );
    mskedt_nr_processo.SetFocus;
  end;
end;

procedure Tfrm_exp_capa.pgctrl_despachoChanging(Sender: TObject; var AllowChange: Boolean);
begin
  with datm_exp_capa do begin
    if ( qry_dde_re_.State in [dsEdit,dsInsert] ) or ( qry_dde_nf_.State in [dsEdit,dsInsert] ) then
    begin
      if BoxMensagem('O Despacho foi alterado.' + #13#10 + 'Deseja salvar as alterações?', 1) then
      begin
        if Not Consiste then
        begin
          AllowChange := False;
          Exit;
        end;
        if Not Grava then
        begin
          AllowChange := False;
          Exit;
        end;
        AllowChange := True;
      end
      else
      begin
        Cancelar;
        AllowChange := False;
      end;
    end;
  end;
end;

procedure Tfrm_exp_capa.pgctrl_despachoChange(Sender: TObject);
begin
  if pgctrl_despacho.ActivePage = ts_dde_re then
  begin
    VerificaDesp( not datm_exp_capa.qry_dde_re_.EOF );
    btn_excluir.Enabled := not datm_exp_capa.qry_dde_re_.EOF;
    mi_excluir.Enabled  := not datm_exp_capa.qry_dde_re_.EOF;
  end
  else
  begin
    VerificaDesp( not datm_exp_capa.qry_dde_nf_.EOF );
    btn_excluir.Enabled := not datm_exp_capa.qry_dde_nf_.EOF;
    mi_excluir.Enabled  := not datm_exp_capa.qry_dde_nf_.EOF;
  end;
end;

procedure Tfrm_exp_capa.dbedt_nf_iniExit(Sender: TObject);
begin
  with datm_exp_capa do begin
    if qry_dde_nf_.State in [dsEdit, dsInsert] then
      if ( Trim( dbedt_nf_ini.Text ) <> '' ) and ( Trim( dbedt_nf_fim.Text ) = '' ) then
         qry_dde_nf_NR_NF_FIM.AsString := dbedt_nf_ini.Text;
  end;
end;

procedure Tfrm_exp_capa.btn_co_enquad_opClick(Sender: TObject);
begin
  if Sender is TSpeedButton then
  begin
    If Not PoeEmEdicao(datm_exp_capa.qry_exp_) Then Exit;
    If (Sender as TSpeedButton).Enabled Then
      datm_exp_capa.qry_exp_CD_ENQUAD_OP.AsString := ConsultaOnLineEx('TENQUAD_OP', 'Enquadramento da Operação',['CD_ENQUAD_OP','NM_ENQUAD_OP'],['Código','Enquadramento'],'CD_ENQUAD_OP');
  end
  else edt_nm_enquad_op.Text := ConsultaLookUP('TENQUAD_OP', 'CD_ENQUAD_OP', dbedt_cd_enquad_op.Text, 'NM_ENQUAD_OP');
end;

procedure Tfrm_exp_capa.btn_co_despachoClick(Sender: TObject);
begin
  if Sender is TSpeedButton then
  begin
    If Not PoeEmEdicao(datm_exp_capa.qry_exp_) Then Exit;
    If (Sender as TSpeedButton).Enabled Then
     datm_exp_capa.qry_exp_CD_LOCAL_DESPACHO.AsString  := ConsultaOnLineEx('TLOCAL_EMBARQUE', 'Locais de Despacho',['CODIGO','DESCRICAO'],['Código','Local de Despacho'],'CODIGO');
  end
  else edt_nm_local_despacho.Text := ConsultaLookUP('TLOCAL_EMBARQUE', 'CODIGO', dbedt_cd_local_despacho.Text , 'DESCRICAO');
end;

procedure Tfrm_exp_capa.dbchkbx_num_fat_autoClick(Sender: TObject);
begin
  if dbchkbx_num_fat_auto.Checked = true then
  begin
    dbedt_nr_fatura.ReadOnly := True;
    dbedt_nr_fatura.TabStop  := False;
    dbedt_nr_fatura.Color    := clMenu;
    dbedt_dt_fatura.ReadOnly := True;
    dbedt_dt_fatura.TabStop  := False;
    dbedt_dt_fatura.Color    := clMenu;
  end
  else
  begin
    dbedt_nr_fatura.ReadOnly := False;
    dbedt_nr_fatura.TabStop  := True;
    dbedt_nr_fatura.Color    := clWindow;
    dbedt_dt_fatura.ReadOnly := False;
    dbedt_dt_fatura.TabStop  := True;
    dbedt_dt_fatura.Color    := clWindow;
  end;
end;

procedure Tfrm_exp_capa.dbedt_nr_anexo_iniExit(Sender: TObject);
begin
  dbedt_nr_anexo_ini.Text := Copy ( '000',1 ,( 3 - length( Trim( dbedt_nr_anexo_ini.Text ) ) ) ) + dbedt_nr_anexo_ini.Text;
end;

procedure Tfrm_exp_capa.dbedt_nr_anexo_fimExit(Sender: TObject);
begin
  dbedt_nr_anexo_fim.Text := Copy ( '000',1 ,( 3 - length( Trim( dbedt_nr_anexo_fim.Text ) ) ) ) + dbedt_nr_anexo_fim.Text;
end;

procedure Tfrm_exp_capa.dbgrd_NovoReKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if ((dbgrd_NovoRe.Columns.Items[dbgrd_NovoRe.SelectedIndex].FieldName = 'PESO_LIQUIDO_TOTAL') and ((key = VK_TAB) or (key = VK_RIGHT))) or
     (key = VK_DOWN) or (key = VK_UP) then key := 0;
end;

procedure Tfrm_exp_capa.btn_reClick(Sender: TObject);
var
  vVerifica:string;
begin
  with tQuery.Create(application) do
  begin
    DatabaseName := 'DBBROKER';
    Close;

//    SQL.Add('SELECT IN_MONTADO FROM TPROCESSO_EXP WHERE NR_PROCESSO = ' + QuotedStr(datm_exp.qry_exp_NR_PROCESSO.AsString)); by carlos - 29/06/2011
    str_nr_processo:=frm_exp.msk_cd_unid_neg.Text + '02' + mskedt_nr_processo.Text;
    SQL.Add('SELECT IN_MONTADO FROM TPROCESSO_EXP WHERE NR_PROCESSO = ' + QuotedStr(str_nr_processo));
    Open;
//    str_nr_processo := datm_exp.qry_exp_NR_PROCESSO.AsString; by carlos - 29/06/2011
    vVerifica:=ConsultaLookUPSQL('SELECT isnull(IN_MONTADO,'''') as in_montado FROM TPROCESSO_EXP WHERE NR_PROCESSO = '''+str_nr_processo+''' ','in_montado');
    if (Fields[0].AsString = '0') or (Fields[0].IsNull) or (vVerifica='')  then
    begin
      if not VerIntegridade then Exit;
      vStr_cd_modulo := '20';
      str_cd_rotina := '2012';
      str_cd_mod := vStr_cd_modulo;
      str_cd_rot := str_cd_rotina;
      Application.CreateForm(Tfrm_exp_monta_re, frm_exp_monta_re);
      frm_exp_monta_re.ShowModal;
    end
    else
    begin
      if not VerIntegridade then Exit;
      vStr_cd_modulo := '20';
      str_cd_rotina := '2017';
      str_cd_mod := vStr_cd_modulo;
      str_cd_rot := str_cd_rotina;
      Application.CreateForm(Tdatm_re_capa, datm_re_capa);
      Application.CreateForm(Tfrm_re_capa, frm_re_capa);
      frm_re_capa.ShowModal;
    end;
    Free;
  end;
end;

procedure Tfrm_exp_capa.btnIntegraRAPClick(Sender: TObject);
begin
  frmExpIntegraRAP :=  TfrmExpIntegraRAP.Create(Application);

  frmExpIntegraRAP.qryAutorizados.SQL.text :=
    '   SELECT * ' +
    '     FROM MYINDAIA.DBO.FN_INTEGRA_RAP_EMBARQUES_DISPONIVEIS('+ QuotedStr(ConsultaLookUP('TPROCESSO','NR_PROCESSO',
                                                           datm_exp_capa.qry_exp_NR_PROCESSO.AsString,'CD_GRUPO')) + ') ';
  frmExpIntegraRAP.qryAutorizados.open;

  frmExpIntegraRAP.cxGridDBTableView.DataController.DataSource := frmExpIntegraRAP.dsAutorizados;
  frmExpIntegraRAP.edtCdUnidade.Text := Copy(datm_exp_capa.qry_exp_.FieldByName('NR_PROCESSO').AsString,1,2);
  frmExpIntegraRAP.mskCdProduto.Text := Copy(datm_exp_capa.qry_exp_.FieldByName('NR_PROCESSO').AsString,3,2);
  frmExpIntegraRAP.edtProcesso.Text  := Copy(datm_exp_capa.qry_exp_.FieldByName('NR_PROCESSO').AsString,5,12);
  frmExpIntegraRAP.btnIntegrar.Visible := true;
  frmExpIntegraRAP.btnEstornar.Visible := true;
  frmExpIntegraRap.lblTit.Caption := 'Instruções de Embarque Autorizadas';
  frmExpIntegraRap.cxGridDBTableView.Columns[0].Caption := 'Embarque';
  frmExpIntegraRap.cxGridDBTableView.Columns[1].Caption := 'Faturas Autorizadas para o embarque';
  frmExpIntegraRap.cxGridDBTableView.Columns[2].Caption := 'Inserido em:';
  frmExpIntegraRAP.ShowModal;

  BloqueiaCamposRAP(datm_exp_capa.qry_exp_NR_PROCESSO.AsString);
  AbreTabelas;
end;

procedure Tfrm_exp_capa.cbbLogomarcaChange(Sender: TObject);
begin
  If Not PoeEmEdicao(datm_exp_capa.qry_exp_) Then Exit;
end;

procedure Tfrm_exp_capa.btnEstornaRapClick(Sender: TObject);
var
  iCampos : integer;
  //vGrupo :string;
begin
  if Application.MessageBox('Esta ação irá remover a integração da RAP com o'+ #13#10 +
    'processo perdendo todos os dados digitados.'+ #13#10 +'Tem certeza que deseja continuar?',
    'Atenção', MB_YESNO + MB_ICONWARNING + MB_DEFBUTTON2) = IDYES then
  begin
    //se clicar em yes, perdeu a rap esse processo
    iDoc := False;

   // vGrupo := ConsultaLookUp('TPROCESSO', 'NR_PROCESSO', datm_exp_capa.qry_exp_NR_PROCESSO.AsString, 'CD_GRUPO');

    if vGrupo = '155' then
    begin
      iDoc := false;
    end
    else
    begin
      if Application.MessageBox('Haverá reemissão de documentos?',
        'Atenção', MB_YESNO + MB_ICONWARNING + MB_DEFBUTTON2) = IDYES then
      begin
        // Reemissão de Documentos - Status de Processo nº 165.
        iDoc := True;
      end;
    end;
    //-----------------------------------------------------------------------------------------------------------------

    //Inicia o processo de estorno da RAP.          Eric 14:55h 24/01/2012
    BloqueiaCamposRAP(datm_exp_capa.qry_exp_NR_PROCESSO.AsString);
    AbreTabelas;

    with TQuery.Create(application) do
    begin
      Databasename := 'DBBROKER';
      try
        //   Query do 'Controle de Status do Processo' //
        SQL.Clear;
        SQL.Add('SELECT MAX(F.CD_FOLLOWUP_ETAPA)');
        SQL.Add('FROM TFOLLOWUP_ETAPA F (NOLOCK)');
        SQL.Add('WHERE F.NR_PROCESSO = '''+frm_exp.msk_cd_unid_neg.Text+'02' +  mskedt_nr_processo.Text + '''');
        Open;
        if Eof then
          iCampos := 1
        else
          iCampos := Fields[0].AsInteger + 1;

        Close;

        //Habilita o painel do motivo e desabilita os painéis do form principal.
        //                                      Eric, 12:18h 25/01/2012

        edtCodigo.Text := IntToStr(iCampos);
        edtCodigoEtapa.Clear;
        edtNomeEtapa.Clear;
        mi_incluir.Enabled := False;
        mi_salvar.Enabled := False;
        mi_cancelar.Enabled := False;
        btn_itens_exp.Enabled := False;
        btn_excluir.Enabled := False;
        mi_excluir.Enabled := False;
        mi_itens_exp.Enabled := False;
        mi_calcular.Enabled := False;
        mi_manut_proc.Enabled := False;
        mi_re.Enabled := False;
        mi_sair.Enabled := False;
        pgctrl_exp_capa.Enabled := False;
        pnl_cadastro.Enabled := False;   

//        vGrupo := ConsultaLookUp('TPROCESSO', 'NR_PROCESSO', datm_exp_capa.qry_exp_NR_PROCESSO.AsString, 'CD_GRUPO');
        if vGrupo = '155' then
        begin
          pnlEtapa.Visible := false;
          edtCodigoEtapa.text := '55';
          edtNomeEtapa.text := 'Suspenso';
          btnSalvarEtapa.click;
        end
        else
        begin
          pnlEtapa.Visible := True;
        end;

      finally
        Free;
      end; // end do 'try finally'
    end; //end do 'with TQuery do'
  end; // end do 'If MessageBox Estorna RAP'
end;  //end da procedure.

procedure Tfrm_exp_capa.dbedt_dt_nfEnter(Sender: TObject);
begin
//  if dbedt_dt_nf.Text <> '  /  /    ' then
//    vDtTaxa := datm_exp_capa.qry_exp_nf_DT_NOTA.AsDateTime;
end;

procedure Tfrm_exp_capa.dbedt_dt_nfExit(Sender: TObject);
var
  dataNF, dataTaxa :string;
begin
{  dataNF   := formatdatetime('DD/MM/YYYY', StrToDateTime(dbedt_dt_nf.Text));
  dataTaxa := formatdatetime('DD/MM/YYYY', vDtTaxa);

  //caso não tenha taxa de conversão, sugere uma
//if (dbedtVlTaxa.Text = '') or (vDtTaxa <> StrToDateTime(dbedt_dt_nf.Text)) then
  if (dbedtVlTaxa.Text = '') or (dataTaxa <> dataNF) then 
  begin
    with TQuery.Create(Application) do
    begin
      DatabaseName := 'DBBROKER';
      SQL.Add('SELECT TC.TX_CAMBIO FROM TPROCESSO_EXP PE (NOLOCK)');
      SQL.Add('  INNER JOIN TTAXA_CAMBIO TC (NOLOCK) ON (TC.CD_MOEDA = PE.CD_MOEDA)');
      SQL.Add('WHERE PE.NR_PROCESSO = :NR_PROCESSO');
      SQL.Add('  AND TC.DT_INICIO_VIGENCIA <= :DT_SAIDA');
      SQL.Add('  AND TC.DT_TERMINO_VIGENCIA >= :DT_SAIDA');
      ParamByName('NR_PROCESSO').AsString := str_nr_processo;
      ParamByName('DT_SAIDA').AsDateTime := PoeOuTiraDiasUteis(1,'+',StrToDate(dbedt_dt_nf.Text));
      Open;
      if RecordCount > 0 then
      begin
        lCalculo := False;
        if not PoeEmEdicao(datm_exp_capa.qry_exp_nf_) then
          Exit;
        datm_exp_capa.qry_exp_nf_VL_TAXA.AsFloat := Fields[0].AsFloat;
      end;
      Close;
      Free;
    end;
  end;     }
end;

procedure Tfrm_exp_capa.btnCoBcoSaqueClick(Sender: TObject);
begin
  if Sender is TSpeedButton then begin
    if Not PoeEmEdicao(datm_exp_capa.qry_exp_) Then Exit;
    if (Sender as TSpeedButton).Enabled Then
      datm_exp_capa.qry_exp_CD_BANCO_SAQUE.AsString := ConsultaOnLineExSQL(
        'SELECT EE.CD_EMPRESA, EE.NM_EMPRESA, EE.AP_EMPRESA,(SELECT RTRIM(LTRIM(NM_PAIS)) + '' '' FROM TPAIS_BROKER (NOLOCK) WHERE CD_PAIS = EE.CD_PAIS) AS PAIS, ' +
        'RTRIM(LTRIM(EE.END_CIDADE)) AS END_CIDADE, ISNULL(RTRIM(LTRIM(EE.END_EMPRESA)), '''') + '' '' + ISNULL(RTRIM(LTRIM(EE.END_NUMERO)), '''') + '' '' + ISNULL(RTRIM(LTRIM(EE.END_COMPL)), '''') AS ENDERECO ' +
        'FROM TEMPRESA_EST EE (NOLOCK) ' +
        'WHERE EE.IN_BANCO = ''1'' AND EE.IN_ATIVO = ''1'' ',
        'Banco',['CD_EMPRESA', 'NM_EMPRESA', 'AP_EMPRESA', 'PAIS', 'END_CIDADE', 'ENDERECO'],['Código', 'Nome', 'Apelido', 'País', 'Cidade', 'Endereço'],
        'CD_EMPRESA',
        nil, dbedtBcoSaque.Text)
  end
  else
   edtBcoSaque.Text := ConsultaLookUPSQL(
     'SELECT NM_EMPRESA FROM TEMPRESA_EST (NOLOCK) '+
     'WHERE CD_EMPRESA = '''+ dbedtBcoSaque.Text +''' '+
     ' AND IN_BANCO = ''1'' AND IN_ATIVO = ''1'' ','NM_EMPRESA');
end;

procedure Tfrm_exp_capa.btnIntegraDoctoClick(Sender: TObject);
begin
  frmExpIntegraRAP :=  TfrmExpIntegraRAP.Create(Application);
  
  frmExpIntegraRAP.qryAutorizados.SQL.text :=
  '   SELECT * ' +
  '     FROM MYINDAIA.DBO.FN_INTEGRA_RAP_EMBARQUES_DISPONIVEIS('+ QuotedStr(ConsultaLookUP('TPROCESSO','NR_PROCESSO',
                                                         datm_exp_capa.qry_exp_NR_PROCESSO.AsString,'CD_GRUPO')) + ') ';
  //frmExpIntegraRAP.qryAutorizados.open;

  frmExpIntegraRAP.qryAutorizadosDoc.ParamByName('GRUPO').AsString := ConsultaLookUP('TPROCESSO','NR_PROCESSO',datm_exp_capa.qry_exp_NR_PROCESSO.AsString,'CD_GRUPO');
  frmExpIntegraRAP.qryAutorizadosDoc.Open;

  frmExpIntegraRAP.cxGridDBTableView.DataController.DataSource := frmExpIntegraRAP.dsAutorizadosDoc;

  frmExpIntegraRAP.edtCdUnidade.Text                    := Copy(datm_exp_capa.qry_exp_.FieldByName('NR_PROCESSO').AsString,1,2);
  frmExpIntegraRAP.mskCdProduto.Text                    := Copy(datm_exp_capa.qry_exp_.FieldByName('NR_PROCESSO').AsString,3,2);
  frmExpIntegraRAP.edtProcesso.Text                     := Copy(datm_exp_capa.qry_exp_.FieldByName('NR_PROCESSO').AsString,5,12);
  frmExpIntegraRAP.btnIntegrarDoc.Visible               := true;
  frmExpIntegraRAP.btnEstornarDoc.Visible               := true;
  frmExpIntegraRAP.btnIntegrarDoc.Left                  := frmExpIntegraRAP.btnIntegrar.Left;
  frmExpIntegraRAP.btnEstornarDoc.Left                  := frmExpIntegraRAP.btnEstornar.Left;
  frmExpIntegraRap.lblTit.Caption                       := 'Instruções de Embarque Autorizadas para emissão de Documentos';
  frmExpIntegraRap.cxGridDBTableView.Columns[0].Caption := 'Autorização';
  frmExpIntegraRap.cxGridDBTableView.Columns[1].Caption := 'Faturas Autorizadas para a Emissão';
  frmExpIntegraRap.cxGridDBTableView.Columns[2].Caption := 'Autorizado em:';
  
  frmExpIntegraRAP.ShowModal;

  BloqueiaCamposRAP(datm_exp_capa.qry_exp_NR_PROCESSO.AsString);
  AbreTabelas;
end;

procedure Tfrm_exp_capa.btnEstornaDoctoClick(Sender: TObject);
begin
  if Application.MessageBox('Esta ação irá remover a integração da RAP com o'+ #13#10 +
    'processo perdendo todos os dados digitados.'+ #13#10 +'Tem certeza que deseja continuar?',
    'Atenção', MB_YESNO + MB_ICONWARNING + MB_DEFBUTTON2) = IDYES then
  begin
    //se clicar em yes, perdeu a rap esse processo
    with TQuery.Create(application) do begin
      Databasename := 'DBBROKER';
      try
        //exclui os itens
        SQL.Clear;
        SQL.Add('DELETE TPROCESSO_EXP_ITEM');
        SQL.Add('WHERE NR_PROCESSO = '''+datm_exp_capa.qry_exp_.FieldByName('NR_PROCESSO').AsString+'''');
        ExecSQL;
        //exclui os pedidos
        SQL.Clear;
        SQL.Add('DELETE TPROCESSO_EXP_PEDIDO');
        SQL.Add('WHERE NR_PROCESSO = '''+datm_exp_capa.qry_exp_.FieldByName('NR_PROCESSO').AsString+'''');
        ExecSQL;
        //retorna para o status de autorizado
        SQL.Clear;
        SQL.Add('UPDATE RD SET CD_STATUS = ''2'', CD_USUARIO_FIM = NULL, DT_FINALIZADO = NULL');
        SQL.Add('FROM MYINDAIA.DBO.TRAP_DOCUMENTACAO RD (NOLOCK), MYINDAIA.DBO.TRAP R (NOLOCK)');
        SQL.Add('WHERE R.CD_RAP+R.CD_RAP_ANO = RTRIM(LTRIM(RD.CD_RAP))+RTRIM(LTRIM(RD.CD_RAP_ANO)) ');
        SQL.Add('  AND R.NR_PROCESSO = '''+datm_exp_capa.qry_exp_.FieldByName('NR_PROCESSO').AsString+''' ');
        SQL.Add('  AND RD.CD_STATUS = ''3'' '); 
        ExecSQL;
        //retira Evento 117 caso tenha sido preenchido
        SQL.Clear;
        SQL.Add('UPDATE TFOLLOWUP SET DT_REALIZACAO = NULL, CD_RESP_REALIZACAO = NULL WHERE CD_EVENTO = ''117'' AND NR_PROCESSO = '''+datm_exp_capa.qry_exp_.FieldByName('NR_PROCESSO').AsString+''' ');
        ExecSQL;
        SQL.Clear;
        SQL.Add('EXEC sp_atz_followup '''+datm_exp_capa.qry_exp_.FieldByName('NR_PROCESSO').AsString+''' ');
        ExecSQL;
        //retorna para estornar
        SQL.Clear;
        SQL.Add('UPDATE MYINDAIA.DBO.TRAP SET CD_STATUS_DOCTO = ''2''');
        SQL.Add('WHERE NR_PROCESSO = '''+datm_exp_capa.qry_exp_.FieldByName('NR_PROCESSO').AsString+'''');
        ExecSQL;
      finally
        Free;
      end;
    end;
    BloqueiaCamposRAP(datm_exp_capa.qry_exp_NR_PROCESSO.AsString);
    AbreTabelas;
  end;
end;

function Tfrm_exp_capa.VerificaDePara(vTipo : string; vCodigo : string) : string;
begin
  Result := vCodigo;
{
cod importador
cod consignatário
cod notificador
termo pagto
Cod Produto
Cod Moeda
}
end;

procedure Tfrm_exp_capa.BtnImportaDadosClick(Sender: TObject);
var
  A : TextFile;
  vDtPedido, vNumPedido, vMoeda, vLinha, vCliente, vPedidoArquivo : string;
  vQtdItens : Integer;
  I: Integer;
  vInserido: Boolean;

  function DeParaCliente(const vCd_Cliente : string) : string;
  begin
    with TQuery.Create(Application) do
    begin
      DatabaseName := 'DBBROKER';
      SQL.Clear;
      SQL.Add('select CD_EMPRESA from TEMPRESA_EST');
      SQL.Add('where');
      SQL.Add('  NR_CLIENTE = ''' + IntToStr(StrToInt(vCd_Cliente)) + '''');
      Open;
      Result := FieldByName('CD_EMPRESA').AsString;
      Free;
    end;
  end;

  function DeParaTermoPagto(const vCd_TermoPagto : string) : string;
  begin
    with TQuery.Create(Application) do
    begin
      DatabaseName := 'DBBROKER';
      SQL.Clear;
      SQL.Add('select CD_DDBROKER from TDE_PARA');
      SQL.Add('where CD_TABELA = ''23'''); //23 = Termo Pagto - PPG
      SQL.Add('  and CD_EXTERNO = ''' + vCd_TermoPagto + '''');
      Open;
      Result := FieldByName('CD_DDBROKER').AsString;
      Free;
    end;
  end;

  function DeParaUnidMedida(const vCd_UnidMedida : string) : string;
  begin
    with TQuery.Create(Application) do
    begin
      DatabaseName := 'DBBROKER';
      SQL.Clear;
      SQL.Add('select CD_DDBROKER from TDE_PARA');
      SQL.Add('where CD_TABELA = ''24'''); //24 = Unid de Medida - PPG
      SQL.Add('  and CD_EXTERNO = ''' + vCd_UnidMedida + '''');
      Open;
      Result := FieldByName('CD_DDBROKER').AsString;
      Free;
    end;
  end;

begin
  if (Trim(dbedt_cd_pais_destino.Text) <> '') and (Trim(dbedt_cd_exportador.Text) <> '') then
  begin
    OpenDlg.Filter := '*.txt|*.txt';
    if OpenDlg.Execute then
    begin
      // Verifica o tamanho do nome dos arquivos selecionados - Michel - 23/01/2009
      for I := 0 to OpenDlg.Files.Count-1 do
        if Length(ChangeFileExt(ExtractFileName(OpenDlg.Files[I]), '')) > 15 then
        begin
          MessageDlg('Tamanho do nome do arquivo de integração ''' + ChangeFileExt(ExtractFileName(OpenDlg.Files[I]), '') + ''' excede o tamanho máximo.'#13 +
             'Abrevie o nome do arquivo de modo que tenha no máximo 15 caracteres e tente novamente.', mtError, [mbOk], 0);
          Exit;
        end;

      datm_exp_capa.qryRefCliente.Open;

      datm_exp_capa.qry_exp_itens_Imp.Close;
      datm_exp_capa.qry_exp_itens_Imp.ParamByName('NR_PROCESSO').AsString := str_nr_processo;
      datm_exp_capa.qry_exp_itens_Imp.Open;

      datm_exp_capa.qryProcContainer.close;
      datm_exp_capa.cdsProcContainer.close;
      datm_exp_capa.qryProcContainer.ParamByName('NR_PROCESSO').AsString := str_nr_processo;
      datm_exp_capa.qryProcContainer.open;
      datm_exp_capa.cdsProcContainer.open;

      datm_exp_capa.qry_exp_ped_.Close;
      datm_exp_capa.qry_exp_ped_.ParamByName('NR_PROCESSO').AsString := str_nr_processo;
      datm_exp_capa.qry_exp_ped_.Open;

      vCliente := ConsultaLookUP('TPROCESSO', 'NR_PROCESSO', str_nr_processo, 'CD_CLIENTE');

      datm_main.db_broker.StartTransaction;

      for I := 0 to OpenDlg.Files.Count -1 do
      begin
        try
          //AssignFile( A, 'c:\exemplo.txt');
          AssignFile( A, OpenDlg.Files[I]);
          Reset(A);

          // Adicionado por michel em 09/01/2009 para aceitar mais de uma integração
          with TQuery.Create(Application) do
          begin
            DatabaseName := 'DBBROKER';
            SQL.Clear;
            SQL.Add('SELECT COUNT(*)');
            SQL.Add('FROM TPROCESSO_EXP_ITEM');
            SQL.Add('WHERE NR_PROCESSO = :NR_PROCESSO');
            ParamByName('NR_PROCESSO').AsString := datm_exp_capa.qry_exp_NR_PROCESSO.AsString;
            Open;
            vQtdItens := Fields[0].AsInteger;
            Close;
            Free;
          end;

          // Zerar a variavel para inserir o nome do arquivo - Michel - 14/01/2009
          vInserido := False;

          while not EOF(A) do
          begin
            ReadLn(A, vLinha);
            if Copy(vLinha,1,3) = 'TOP' then
            begin
              //if datm_exp_capa.qry_exp_ped_.IsEmpty then
              begin
                datm_exp_capa.qry_exp_.Edit;
                datm_exp_capa.qry_exp_CD_EXPORTADOR.AsString       := dbedt_cd_exportador.Text; //'00192';  //PPG
                datm_exp_capa.qry_exp_CD_IMPORTADOR.AsString       := DeParaCliente(Copy(vLinha,14,10));
                if datm_exp_capa.qry_exp_CD_IMPORTADOR.AsString = '' then //se vier vazio é pq o cliente não está na tabela de Empresa Estrangeira
                begin
                  BoxMensagem( 'O cliente ' + Copy(vLinha,14,10) + ' não está cadastrado na tabela de Empresas Estrangeiras', 3 );
                  datm_exp_capa.qry_exp_.Cancel;
                  datm_main.db_broker.Rollback;
                  btn_cancelar.Click;
                  Exit;
                end;
                datm_exp_capa.qry_exp_CD_CONSIGNATARIO.AsString    := DeParaCliente(Copy(vLinha,24,10));
                datm_exp_capa.qry_exp_CD_NOTIFY1.AsString          := DeParaCliente(Copy(vLinha,34,10));
                vDtPedido                                          := Copy(vLinha,44, 8);
                vDtPedido                                          := Copy(vDtPedido,7, 2) + '/' + Copy(vDtPedido,5, 2) + '/' + Copy(vDtPedido,1, 4);
                datm_exp_capa.qry_exp_VL_COMISSAO_PERCENT.AsString := Copy(vLinha,68, 3);

                datm_exp_capa.qry_exp_CD_TERMO_PAGTO.AsString      := DeParaTermoPagto(Copy(vLinha,71, 4));
                if datm_exp_capa.qry_exp_CD_TERMO_PAGTO.AsString = '' then //se vier vazio é pq o termo de pagto não está na tabela De/Para
                begin
                  BoxMensagem( 'Não existe o termpo de pagamento  " ' + Copy(vLinha,71, 4) + '" na tabela DE/PARA', 3 );
                  datm_exp_capa.qry_exp_.Cancel;
                  datm_main.db_broker.Rollback;
                  btn_cancelar.Click;
                  Exit;
                end;

                datm_exp_capa.qry_exp_CD_INCOTERM.AsString         := Copy(vLinha,75, 3);
                datm_exp_capa.qry_exp_.Post;
                vNumPedido := Copy(vLinha, 4,10);

                // Verifica se existem itens para este pedido - Michel - 04/03/2010
                {if ConsultaLookUPSQL(' SELECT COUNT(*) AS QTD ' +
                                     ' FROM TPROCESSO_EXP_ITEM ' +
                                     ' WHERE NR_PROCESSO = ' + QuotedStr(datm_exp_capa.qry_exp_NR_PROCESSO.AsString) +
                                     '   AND NR_PROC_PE  = ' + QuotedStr(vNumPedido), 'QTD') <> '0' then
                begin
                  BoxMensagem('Existem itens neste processo para o pedido ''' + vNumPedido + '''.'#13 +
                     'A operação está sendo cancelada.', 3);
                  datm_main.db_broker.Rollback;
                  btn_cancelar.Click;
                  Exit;
                end;} // Comentado porque o exportador por dividir o mesmo pedido em várias faturas - Michel - 11/06/2010

    //********************************* Aba PEDIDOS ********************************
                { Comentado por Rodrigo Capra a pedido do Vitor em 15/05/2008}

                // Não inserir duas vezes para o mesmo arquivo - Michel - 14/01/2009
                if not vInserido then
                begin
                  vInserido      := True;
                  vPedidoArquivo := ChangeFileExt(ExtractFileName(OpenDlg.Files[I]), ''); //Copy(ExtractFileName(OpenDlg.FileName),1,Length(ExtractFileName(OpenDlg.FileName))-4);

                  // Incluido para verificar se o
                  if ConsultaLookUPSQL(' SELECT NR_PEDIDO ' +
                                       ' FROM TPROCESSO_EXP_PEDIDO ' +
                                       ' WHERE NR_PROCESSO = ' + QuotedStr(datm_exp_capa.qry_exp_NR_PROCESSO.AsString) +
                                       '   AND NR_PEDIDO   = ' + QuotedStr(vPedidoArquivo), 'NR_PEDIDO') = '' then
                    datm_exp_capa.qry_exp_ped_.Insert
                  else begin
                    datm_exp_capa.qry_exp_ped_.Locate('NR_PEDIDO',vPedidoArquivo,[]); // by Carlos - 29/11/2011
                    datm_exp_capa.qry_exp_ped_.Edit;
                  end;

                  datm_exp_capa.qry_exp_ped_NR_PROCESSO.AsString        := datm_exp_capa.qry_exp_NR_PROCESSO.AsString;
                  datm_exp_capa.qry_exp_ped_NR_PEDIDO.AsString          := vPedidoArquivo;
                  datm_exp_capa.qry_exp_ped_NR_FATURA.AsString          := datm_exp_capa.qry_exp_ped_NR_PEDIDO.AsString;
                  datm_exp_capa.qry_exp_ped_TX_MARCACAO_VOLUME.AsString := '';
                  datm_exp_capa.qry_exp_ped_TX_INF_EMBALAGEM.AsString   := '';
                  datm_exp_capa.qry_exp_ped_TX_MERCADORIA.AsString      := '';
                  datm_exp_capa.qry_exp_ped_VL_DESCONTO.AsFloat         := 0;
                  datm_exp_capa.qry_exp_ped_VL_FRETE.AsFloat            := 0;
                  datm_exp_capa.qry_exp_ped_VL_SEGURO.AsFloat           := 0;
                  datm_exp_capa.qry_exp_ped_VL_PESO_LIQUIDO.AsFloat     := 0;
                  datm_exp_capa.qry_exp_ped_VL_PESO_BRUTO.AsFloat       := 0;
                  datm_exp_capa.qry_exp_ped_VL_CUBAGEM.AsFloat          := 0;

                  datm_exp_capa.qry_exp_ped_.Post;
                end;
              end;
              {showmessage(Copy(vLinha, 4,10));//pedido de venda     showmessage(Copy(vLinha,14,10));  //cod importador
              showmessage(Copy(vLinha,24,10)); //cod consignatário   showmessage(Copy(vLinha,34,10));  //cod notificador
              showmessage(Copy(vLinha,44, 8)); //dt pedido           showmessage(Copy(vLinha,52, 8));  //dt do carregamento
              showmessage(Copy(vLinha,60, 8)); //dt entrada SAP      showmessage(Copy(vLinha,68, 3));  //perc de comissão
              showmessage(Copy(vLinha,71, 4)); //condição de pagto   showmessage(Copy(vLinha,75, 3));  //incoterms
              showmessage(Copy(vLinha,78, 8)); //dt transmissão      showmessage(Copy(vLinha,86, 6));  //hora de transmissão}
            end;
            if Copy(vLinha,1,3) = 'DOC' then
            begin
      //        showmessage(Copy(vLinha,4,10)); //pedido de venda showmessage(Copy(vLinha,14,115)); //informação
            end;
            
            if Copy(vLinha,1,3) = 'DET' then
            begin
              vNumPedido := Copy(vLinha, 4,10);
              if ConsultaLookUPSQL('SELECT NR_PROCESSO FROM TREF_CLIENTE WHERE NR_PROCESSO = ''' +
                                 datm_exp_capa.qry_exp_NR_PROCESSO.AsString + '''','NR_PROCESSO') = '' then
              begin
                datm_exp_capa.qryRefCliente.Insert;
                datm_exp_capa.qryRefCliente.FieldByName('NR_PROCESSO').AsString   := datm_exp_capa.qry_exp_NR_PROCESSO.AsString;
                datm_exp_capa.qryRefCliente.FieldByName('NR_SEQUENCIA').AsString  := FStrZero(IntToStr(Sequencia('10', datm_exp_capa.qry_exp_NR_PROCESSO.AsString)),3);
                datm_exp_capa.qryRefCliente.FieldByName('CD_REFERENCIA').AsString := vNumPedido;
                datm_exp_capa.qryRefCliente.FieldByName('TP_REFERENCIA').AsString := '01';
                datm_exp_capa.qryRefCliente.FieldByName('NR_ITEM_PO').AsString    := Copy(vLinha,14,3);
                datm_exp_capa.qryRefCliente.FieldByName('DT_REFERENCIA').AsString := vDtPedido;
                // Incluído porque estava gerando erro de CD_EMPRESA não pode ser nulo - Michel - 04/03/2010
                datm_exp_capa.qryRefCliente.FieldByName('CD_EMPRESA').AsString    := vCliente;
                datm_exp_capa.qryRefCliente.Post;
              end;

              Inc(vQtdItens);
              datm_exp_capa.qry_exp_itens_Imp.Insert;
              datm_exp_capa.qry_exp_itens_Imp.FieldByName('NR_PROCESSO').AsString  := datm_exp_capa.qry_exp_NR_PROCESSO.AsString;
              datm_exp_capa.qry_exp_itens_Imp.FieldByName('NR_ITEM').AsString      := FStrZero(IntToStr(vQtdItens),3);

              datm_exp_capa.qry_exp_itens_Imp.FieldByName('NR_PROC_PE').AsString   := vNumPedido;
              datm_exp_capa.qry_exp_itens_Imp.FieldByName('NR_ITEM_PE').AsString   := Copy(vLinha,14,3);

              datm_exp_capa.qry_exp_itens_Imp.FieldByName('CD_MERCADORIA').AsString  := Copy(vLinha,17,18);
              datm_exp_capa.qry_exp_itens_Imp.FieldByName('CD_UNID_MEDIDA').AsString := DeParaUnidMedida(Copy(vLinha,35,3));
              if datm_exp_capa.qry_exp_itens_Imp.FieldByName('CD_UNID_MEDIDA').AsString = '' then //se vier vazio é pq o termo de pagto não está na tabela De/Para
              begin
                BoxMensagem( 'Não existe a Unidade de Medida  " ' + Copy(vLinha,35,3) + '" na tabela DE/PARA', 3 );
                datm_exp_capa.qry_exp_itens_Imp.Cancel;
                datm_main.db_broker.Rollback;
                btn_cancelar.Click;
                Exit;
              end;

              datm_exp_capa.qry_exp_itens_Imp.FieldByName('QT_MERCADORIA').AsString        := Copy(vLinha,38,12) + ',' + Copy(vLinha,50,3);
              datm_exp_capa.qry_exp_itens_Imp.FieldByName('VL_UNITARIO').AsString          := Copy(vLinha,53,11) + ',' + Copy(vLinha,64,7);
              datm_exp_capa.qry_exp_itens_Imp.FieldByName('VL_TOT_PESO_LIQ').AsString      := Copy(vLinha,89,10) + ',' + Copy(vLinha,99,3);
              datm_exp_capa.qry_exp_itens_Imp.FieldByName('VL_TOT_PESO_BRUTO').AsString    := Copy(vLinha,102,10) + ',' + Copy(vLinha,111,3);

              datm_exp_capa.qry_exp_itens_Imp.FieldByName('VL_TOT_ITEM').AsFloat           := datm_exp_capa.qry_exp_itens_Imp.FieldByName('QT_MERCADORIA').AsFloat * datm_exp_capa.qry_exp_itens_Imp.FieldByName('VL_UNITARIO').AsFloat;
              datm_exp_capa.qry_exp_itens_Imp.FieldByName('VL_PESO_LIQ_UNIT').AsFloat      := datm_exp_capa.qry_exp_itens_Imp.FieldByName('VL_TOT_PESO_LIQ').AsFloat / datm_exp_capa.qry_exp_itens_Imp.FieldByName('QT_MERCADORIA').AsFloat;
              datm_exp_capa.qry_exp_itens_Imp.FieldByName('NR_PEDIDO').AsString            := ChangeFileExt(ExtractFileName(OpenDlg.Files[I]), ''); //Copy(ExtractFileName(OpenDlg.FileName),1,Length(ExtractFileName(OpenDlg.FileName))-4);
              datm_exp_capa.qry_exp_itens_Imp.FieldByName('CD_NCM').AsString               := ConsultaLookUPSQL('select CD_NCM_SH from TMERCADORIA_EXP where CD_MERCADORIA = ''' + datm_exp_capa.qry_exp_itens_Imp.FieldByName('CD_MERCADORIA').AsString + '''','CD_NCM_SH');
              datm_exp_capa.qry_exp_itens_Imp.FieldByName('CD_SULF_NCM').AsString          := ConsultaLookUPSQL('select CD_SULF_NCM from TMERCADORIA_EXP where CD_MERCADORIA = ''' + datm_exp_capa.qry_exp_itens_Imp.FieldByName('CD_MERCADORIA').AsString + '''','CD_SULF_NCM');
              datm_exp_capa.qry_exp_itens_Imp.FieldByName('CD_NALADI_SH').AsString         := ConsultaLookUPSQL('select CD_NALADI_SH from TMERCADORIA_EXP where CD_MERCADORIA = ''' + datm_exp_capa.qry_exp_itens_Imp.FieldByName('CD_MERCADORIA').AsString + '''','CD_NALADI_SH');

              // Mercadoria x Acordo
              datm_exp_capa.qry_merc_acordo_norma_.Close;
              datm_exp_capa.qry_merc_acordo_norma_.ParamByName('CD_PAIS').AsString         := datm_exp_capa.qry_exp_.FieldByName('CD_PAIS_DESTINO').AsString;
              datm_exp_capa.qry_merc_acordo_norma_.ParamByName('CD_MERCADORIA').AsString   := datm_exp_capa.qry_exp_itens_Imp.FieldByName('CD_MERCADORIA').AsString;
              datm_exp_capa.qry_merc_acordo_norma_.Open;
              if datm_exp_capa.qry_merc_acordo_norma_CD_MERCADORIA.AsString <> '' then
              begin
                datm_exp_capa.qry_exp_itens_Imp.FieldByName('CD_NCM_DOC').AsString         := datm_exp_capa.qry_merc_acordo_norma_CD_NCM_DOC.AsString;
                datm_exp_capa.qry_exp_itens_Imp.FieldByName('NR_SEQ_NCM_DOC').AsInteger    := datm_exp_capa.qry_merc_acordo_norma_NR_SEQ_NCM.AsInteger;
                datm_exp_capa.qry_exp_itens_Imp.FieldByName('CD_NALADI_DOC').AsString      := datm_exp_capa.qry_merc_acordo_norma_CD_NALADI_SH_DOC.AsString;
                datm_exp_capa.qry_exp_itens_Imp.FieldByName('NR_SEQ_NALADI_DOC').AsInteger := datm_exp_capa.qry_merc_acordo_norma_NR_SEQ_NALADI.AsInteger;
                datm_exp_capa.qry_exp_itens_Imp.FieldByName('CD_ACORDO').AsString          := datm_exp_capa.qry_merc_acordo_norma_CD_ACORDO.AsString;
                datm_exp_capa.qry_exp_itens_Imp.FieldByName('CD_NORMAS').AsString          := datm_exp_capa.qry_merc_acordo_norma_CD_NORMA.AsString;
                datm_exp_capa.qry_exp_itens_Imp.FieldByName('TX_MERCADORIA').AsString      := datm_exp_capa.qry_merc_acordo_norma_TX_MERCADORIA.AsString;
              end
              else
                datm_exp_capa.qry_exp_itens_Imp.FieldByName('TX_MERCADORIA').AsString      := ConsultaLookUPSQL('select NM_MERCADORIA from TMERCADORIA_EXP where CD_MERCADORIA = ''' + datm_exp_capa.qry_exp_itens_Imp.FieldByName('CD_MERCADORIA').AsString + '''','NM_MERCADORIA');

              datm_exp_capa.qry_exp_itens_Imp.FieldByName('CD_EMBALAGEM').AsString         := ConsultaLookUPSQL('select CD_EMBALAGEM from TMERCADORIA_EXP where CD_MERCADORIA = ''' + datm_exp_capa.qry_exp_itens_Imp.FieldByName('CD_MERCADORIA').AsString + '''','CD_EMBALAGEM');
              if datm_exp_capa.qry_embalagem_.Locate( 'CD_EMBALAGEM', datm_exp_capa.qry_exp_itens_Imp.FieldByName('CD_EMBALAGEM').AsString, [] ) then
              begin
                if datm_exp_capa.qry_exp_itens_Imp.FieldByName('CD_EMBALAGEM_SUP').AsString = '' then
                  datm_exp_capa.qry_exp_itens_Imp.FieldByName('CD_EMBALAGEM_SUP').AsString := datm_exp_capa.qry_embalagem_CD_EMBALAGEM_SUP.AsString;

                if datm_exp_capa.qry_exp_itens_Imp.FieldByName('QT_POR_EMB_SUP').AsFloat = 0 then
                  datm_exp_capa.qry_exp_itens_Imp.FieldByName('QT_POR_EMB_SUP').AsFloat    := datm_exp_capa.qry_embalagem_QT_EMBALAGEM_SUP.AsFloat;
              end;

              if datm_exp_capa.qry_exp_itens_Imp.FieldByName('CD_UNID_MEDIDA').AsString <> '103' then
                datm_exp_capa.qry_exp_itens_Imp.FieldByName('QT_POR_EMB').AsString         := ConsultaLookUPSQL('select QT_POR_EMBALAGEM from TMERCADORIA_EXP where CD_MERCADORIA = ''' + datm_exp_capa.qry_exp_itens_Imp.FieldByName('CD_MERCADORIA').AsString + '''','QT_POR_EMBALAGEM');

              datm_exp_capa.qry_exp_itens_Imp.FieldByName('VL_POR_EMB').AsFloat            := datm_exp_capa.qry_exp_itens_Imp.FieldByName('QT_POR_EMB').AsFloat * datm_exp_capa.qry_exp_itens_Imp.FieldByName('QT_MERCADORIA').AsFloat;
              datm_exp_capa.qry_exp_itens_Imp.FieldByName('CD_FABR_EXPO').AsString         := ConsultaLookUPSQL('select CD_FABR_EXPO from TMERCADORIA_EXP where CD_MERCADORIA = ''' + datm_exp_capa.qry_exp_itens_Imp.FieldByName('CD_MERCADORIA').AsString + '''','CD_FABR_EXPO');


              if datm_exp_capa.qry_exp_itens_Imp.FieldByName('CD_FABR_EXPO').AsString = '2' then
                datm_exp_capa.qry_exp_itens_Imp.FieldByName('CD_FABRICANTE').AsString      := ConsultaLookUPSQL('select CD_FABRICANTE from TMERCADORIA_EXP where CD_MERCADORIA = ''' + datm_exp_capa.qry_exp_itens_Imp.FieldByName('CD_MERCADORIA').AsString + '''','CD_FABRICANTE');

              if (datm_exp_capa.qry_exp_itens_Imp.FieldByName('CD_FABR_EXPO').AsString = '2') or (datm_exp_capa.qry_exp_itens_Imp.FieldByName('CD_FABR_EXPO').AsString = '3') then
                datm_exp_capa.qry_exp_itens_Imp.FieldByName('CD_PAIS_ORIGEM').AsString     := ConsultaLookUPSQL('select CD_PAIS_ORIGEM from TMERCADORIA_EXP where CD_MERCADORIA = ''' + datm_exp_capa.qry_exp_itens_Imp.FieldByName('CD_MERCADORIA').AsString + '''','CD_PAIS_ORIGEM');

              datm_exp_capa.qry_exp_itens_Imp.Post;

              {showmessage(Copy(vLinha,4,10)); //pedido de venda    showmessage(Copy(vLinha,14,3)); //item do pedido
              showmessage(Copy(vLinha,17,18)); //codigo do produto  showmessage(Copy(vLinha,35,3)); //unidade
              showmessage(Copy(vLinha,38,15)); //qtd por item       showmessage(Copy(vLinha,53,18)); //val unit
              showmessage(Copy(vLinha,71,15)); //val total          showmessage(Copy(vLinha,86, 3)); //moeda
              showmessage(Copy(vLinha,89,13)); //peso liquido       showmessage(Copy(vLinha,102,13)); //peso bruto
              showmessage(Copy(vLinha,115,10)); //nr embarque       showmessage(Copy(vLinha,125,16)); //nr item}

              vMoeda := Trim(Copy(vLinha,86, 3));
              // Incluído por Michel para converter de seigla para código, ex: USD -> 220 - Michel - 04/03/2010
              if (vMoeda <> '') and (not IsNumeric(vMoeda)) then
                vMoeda := ConsultaLookUP('TMOEDAS_ISO', 'CD_SIGLA', vMoeda, 'CD_MOEDA');
            end;

            if Copy(vLinha,1,3) = 'DEP' then
            begin
              //Tabela tava dando erro de que outro usuário tinha alterado o registro
              //por isso que foi colocado para fechar/abrir/localizar o registro antes de editar
              datm_exp_capa.qry_exp_.Close;
              datm_exp_capa.qry_exp_.Open;
              datm_exp_capa.qry_exp_.Locate('NR_PROCESSO',str_nr_processo,[]);
              datm_exp_capa.qry_exp_.Edit;

              //datm_exp_capa.qry_exp_ped_.Edit;
              if Copy(vLinha,17, 4) = 'FL09' then //cod da despesa
                datm_exp_capa.qry_exp_.FieldByName('VL_ACRESCIMO').AsString := Copy(vLinha,24,13) + ',' + Copy(vLinha,37,2);
              if Copy(vLinha,17, 4) = 'FZRF' then //cod da despesa
                datm_exp_capa.qry_exp_.FieldByName('VL_FRETE').AsString     := Copy(vLinha,24,13) + ',' + Copy(vLinha,37,2);

              datm_exp_capa.qry_exp_.Post;
              {showmessage(Copy(vLinha, 4,10)); //pedido de venda showmessage(Copy(vLinha,14, 3)); //item do pedido Copy(vLinha,17, 4); //cod da despesa showmessage(Copy(vLinha,21, 3)); //moeda showmessage(Copy(vLinha,24,15)); //valor}
            end;
          end;

          datm_exp_capa.qry_exp_.Close;
          datm_exp_capa.qry_exp_.Open;
          datm_exp_capa.qry_exp_.Locate('NR_PROCESSO',str_nr_processo,[]);
          datm_exp_capa.qry_exp_.Edit;
          datm_exp_capa.qry_exp_CD_MOEDA.AsString := vMoeda;
          datm_exp_capa.qry_exp_QT_TOTAL_ITENS.AsString := FStrZero(IntToStr(vQtdItens), 3);


          datm_exp_capa.qry_exp_.Post;

          btn_salvar.Enabled   := False;
          btn_cancelar.Enabled := False;
          CloseFile(A);
        except
          BoxMensagem('Erro ao importar o arquivo ''' + OpenDlg.Files[I] + '''.'#13'favor informar ao TI.', 3);
          if datm_main.db_broker.InTransaction then
            datm_main.db_broker.Rollback;
        end; // try
      end; // for
      if datm_main.db_broker.InTransaction then
        datm_main.db_broker.Commit;

      BoxMensagem( 'Importação realizada com Sucesso !',3);

      // As linhas abaixo foram inseridas porque criavam o RE sem calcular e ficavam com valores zerados - Michel - 23/01/2009
      datm_exp_capa.qry_exp_.Edit;
      btn_salvarClick(btn_salvar);
    end; //if
  end // if
  else
  begin
    BoxMensagem( 'Para fazer a importação, é necessário que os campos "Importador" e "País de Destino Final" estejam preenchidos!',3);
    dbedt_cd_pais_destino.SetFocus;
  end; // else
end;

procedure Tfrm_exp_capa.btnIntegraBasfClick(Sender: TObject);
var
  F, L, P: Integer;
  Arquivo: TStrings;
  Texto: String;
  NrRE, DtRE, Exp, Imp, CodPais, CodExp, CodImp: String;
  NrItem: Integer;
  VlMLETotal, VlMCVTotal: Double;
  Query: TQuery;
  NrPedido, CdIdioma: String;
  Itens: array of TMercadoriaBasf;

  procedure PreparaArquivo(ANomeArquivo: String);
  var
    SS: TStringStream;
    MS: TMemoryStream;
    S: String;
    C: Char;
    I: Integer;
  begin
    SS := TStringStream.Create('');
    MS := TMemoryStream.Create;
    MS.LoadFromFile(ANomeArquivo);
    MS.Position := 0;
    SS.CopyFrom(MS, MS.Size);
    S := StringReplace(SS.DataString, #13#10, '@@@@@@@@@@', [rfReplaceAll]);
    //S := StringReplace(StringReplace(SS.DataString, #13, '', [rfReplaceAll]), #10, #13#10, [rfReplaceAll]);
    S := StringReplace(S, #13, '@@@@@@@@@@', [rfReplaceAll]);
    S := StringReplace(S, #10, '@@@@@@@@@@', [rfReplaceAll]);
    S := StringReplace(S, '@@@@@@@@@@', #13#10, [rfReplaceAll]);
    for C := 'a' to 'z' do
      if Pos(' ' + C + ' - ', S) > 0 then
        S := StringReplace(S, ' ' + C + ' - ', #13#10 + C + ' - ', [rfReplaceAll]);
    for I := 1 to 30 do
      if Pos(' ' + FormatFloat('00', I) + '-', S) > 0 then
        S := StringReplace(S, ' ' + FormatFloat('00', I) + '-', #13#10 + FormatFloat('00', I) + '-', [rfReplaceAll]);
    Arquivo.Text := S;
    FreeAndNil(SS);
    FreeAndNil(MS);
  end;

  function ProcuraProxima(var ALinha: Integer; ATexto: String; ATrim: Boolean = True): String;
  begin
    while (ALinha < Arquivo.Count) and (CompareText(Copy(Arquivo[ALinha], 1, Length(ATexto)), ATexto) <> 0) do
      Inc(ALinha);
    if (ALinha < Arquivo.Count) then
      Result := Copy(Arquivo[ALinha], Length(ATexto) + 1, Length(Arquivo[ALinha]))
    else
      Result := '';
    if ATrim and (Result <> '') then
      Result := Trim(Result);
  end;

  function FormataInteiro(AStr: String): Integer;
  begin
    AStr := Trim(AStr);
    if AStr = '' then
      Result := 0
    else
      Result := StrToInt(AStr);
  end;

  function FormataData(AStr: String): TDateTime;
  begin
    AStr := Trim(StringReplace(AStr, '.', '/', [rfReplaceAll]));
    if not TryStrToDate(AStr, Result) then
      Result := 0;
  end;

  function FormataValor(AStr: String): Double;
  begin
    AStr := StringReplace(AStr, '.', '', [rfReplaceAll]);
    if DecimalSeparator <> ',' then
      AStr := Trim(StringReplace(AStr, ',', DecimalSeparator, [rfReplaceAll]));
    if not TryStrToFloat(AStr, Result) then
      Result := 0;
  end;

  function LerCapa(var Linha: Integer): Boolean;
  var
    CNPJExp, NomeImp: String;
    NrRE, Enquad, NrRV, NrAto, NrRC, REVinculado, DIVinculado, NrProcesso,
    URFDespacho, URFEmbarque, CodPaisDest, InstNeg, Incoterm, ModTrans,
    Moeda, Indicador: String;
    DtLimite, DtRE: TDateTime;
    Margem, VlAntecipado, VlVista, VlParcelas, Period, VlParcela, VlMargem, VlConsig,
    VlSemCobertura, VlFinanc: Double;
    Aux: String;
    I: Integer;
  begin
    Linha := 0;
    // RE
    Aux := ProcuraProxima(Linha, 'Nr. do Registro de Exportação:');
    Result := Aux <> '';
    if Result then
    begin
      I := Pos('Dt.', Aux);
      NrRE := Trim(Copy(Aux, 1, I - 1));
      Delete(Aux, 1, I);
      Delete(Aux, 1, Pos(':', Aux));
      DtRE := StrToDate(StringReplace(Trim(Aux), '.', '/', [rfReplaceAll]));
      // Exportador
      CNPJExp := StringReplace(StringReplace(StringReplace(ProcuraProxima(Linha, 'a - CGC:'), '.', '', [rfReplaceAll]), '/', '', [rfReplaceAll]), '-', '', [rfReplaceAll]);
      Result := CNPJExp = Trim(ConsultaLookUP('TEMPRESA_NAC', 'CD_EMPRESA', datm_exp_capa.qry_exp_CD_EXPORTADOR.AsString, 'CGC_EMPRESA'));
      if not Result then
        MessageDlg('Exportador do arquivo diferente do exportador do processo.', mtInformation, [mbOk], 0)
      else
      begin
        Aux            := Trim(StringReplace(StringReplace(StringReplace(CNPJExp, '.', '', [rfReplaceAll]), '/', '', [rfReplaceAll]), '-', '', [rfReplaceAll]));
        CodExp         := ConsultaLookUP('TEMPRESA_NAC', 'CGC_EMPRESA', Aux, 'CD_EMPRESA');
        Result := CodExp <> '';
        if not Result then
          MessageDlg('CNPJ ' + CNPJExp + ' não cadastrado no sistema para o Exportador.'#13 +
                     'Efetue o cadastro e tente novamente.', mtInformation, [mbOk], 0)
        else
        begin
          Enquad         := ProcuraProxima(Linha, 'a - Código:');
          NrRV           := ProcuraProxima(Linha, 'b - Nr. do RV:');
          NrAto          := ProcuraProxima(Linha, 'f - Num. Ato Concessório:');
          NrRC           := ProcuraProxima(Linha, 'c - Nr. do RC:');
          DtLimite       := FormataData(ProcuraProxima(Linha, 'g - Data Limite:'));
          REVinculado    := ProcuraProxima(Linha, 'd - GE/DE/RE Vinculado:');
          Margem         := FormataValor(ProcuraProxima(Linha, 'h - Margem não Sacada %:'));
          DIVinculado    := ProcuraProxima(Linha, 'e - DI/RI Vinculado:');
          NrProcesso     := ProcuraProxima(Linha, 'i - Nr. do Processo:');
          URFDespacho    := ProcuraProxima(Linha, '03-Unidade RF Despacho:');
          URFEmbarque    := ProcuraProxima(Linha, '04-Unidade RF Embarque:');
          NomeImp        := ProcuraProxima(Linha, 'a - Nome:');
          CodImp         := ConsultaLookUPSQL(' SELECT CD_EMPRESA ' +
                                              ' FROM TEMPRESA_EST ' +
                                              ' WHERE REPLACE(NM_EMPRESA, " ", "") = "' + StringReplace(NomeImp, ' ', '', [rfReplaceAll]) + '"', 'CD_EMPRESA');
          Result := CodImp <> '';
          if not Result then
            MessageDlg('Importador ' + NomeImp + ' não encontrado no sistema.'#13 +
                       'Efetue o cadastro e tente novamente.', mtInformation, [mbOk], 0)
          else
          begin
            CodPais        := Copy(ProcuraProxima(Linha, 'c - País:'), 1, 3);
            CodPaisDest    := ProcuraProxima(Linha, '06-Pais Destino Final:');
            InstNeg        := ProcuraProxima(Linha, '07-Instrumento de Negociação:');
            Incoterm       := ProcuraProxima(Linha, '08-Código da Condição de Venda:');
            ModTrans       := ProcuraProxima(Linha, 'a - Modalidade da Transação:');
            Moeda          := ProcuraProxima(Linha, 'b - Moeda:');
            VlAntecipado   := FormataValor(ProcuraProxima(Linha, 'c - Valor Pgto Antecipado:'));
            VlVista        := FormataValor(ProcuraProxima(Linha, 'd - Valor Pgto a Vista:'));
            VlParcelas     := FormataValor(ProcuraProxima(Linha, 'e - Valor de Parcelas:'));
            Period         := FormataInteiro(ProcuraProxima(Linha, 'f - Periodicidade:'));
            Indicador      := ProcuraProxima(Linha, 'g - Indicador:');
            VlParcela      := FormataValor(ProcuraProxima(Linha, 'h - Valor da Parcela:'));
            VlMargem       := FormataValor(ProcuraProxima(Linha, 'i - Valor da Margem não Sacada:'));
            VlConsig       := FormataValor(ProcuraProxima(Linha, 'j - Valor em Consignação:'));
            VlSemCobertura := FormataValor(ProcuraProxima(Linha, 'l - Valor sem Cobertura Câmbio:'));
            VlFinanc       := FormataValor(ProcuraProxima(Linha, 'm - Valor Financiamento RC:'));

            if not (datm_exp_capa.qry_exp_.State in [dsEdit, dsInsert]) then
              datm_exp_capa.qry_exp_.Edit;
            datm_exp_capa.qry_exp_CD_ENQUAD_OP.AsString := Enquad;
            datm_exp_capa.qry_exp_CD_URF_DESPACHO.AsString := URFDespacho;
            datm_exp_capa.qry_exp_CD_URF_DESTINO.AsString := URFEmbarque;
            datm_exp_capa.qry_exp_CD_IMPORTADOR.AsString := CodImp;
            datm_exp_capa.qry_exp_CD_PAIS_DESTINO.AsString := CodPaisDest;
            datm_exp_capa.qry_exp_CD_INST_NEGOC.AsString := InstNeg;
            datm_exp_capa.qry_exp_CD_INCOTERM.AsString := Incoterm;
            datm_exp_capa.qry_exp_CD_MOEDA.AsString := Moeda;
            datm_exp_capa.qry_exp_.Post;
          end;
        end;
      end;
    end;
  end;

  function AdicionaItens: Boolean;
  var
    I: Integer;
  begin
    try
      Query.SQL.Clear;
      Query.SQL.Add('INSERT INTO TPROCESSO_EXP_ITEM(NR_PROCESSO, NR_ITEM, CD_NCM, CD_SULF_NCM, TX_MERCADORIA,');
      Query.SQL.Add('   CD_MERCADORIA, VL_TOT_PESO_LIQ, VL_TOT_PESO_BRUTO, QT_MERCADORIA, CD_UNID_MEDIDA, VL_MCV, VL_MLE,');
      Query.SQL.Add('   CD_FABR_EXPO, VL_UNITARIO, VL_TOT_ITEM, VL_PESO_LIQ_UNIT, CD_ACORDO, CD_NORMAS, NR_PEDIDO,');
      Query.SQL.Add('   CD_FABRICANTE, CD_PAIS_ORIGEM)');
      Query.SQL.Add('VALUES(:NR_PROCESSO, :NR_ITEM, :CD_NCM, :CD_SULF_NCM, :TX_MERCADORIA,');
      Query.SQL.Add('   :CD_MERCADORIA, :VL_TOT_PESO_LIQ, :VL_TOT_PESO_BRUTO, :QT_MERCADORIA, :CD_UNID_MEDIDA, :VL_MCV, :VL_MLE,');
      Query.SQL.Add('   :CD_FABR_EXPO, :VL_UNITARIO, :VL_TOT_ITEM, :VL_PESO_LIQ_UNIT, :CD_ACORDO, :CD_NORMAS, :NR_PEDIDO,');
      Query.SQL.Add('   :CD_FABRICANTE, :CD_PAIS_ORIGEM)');
      Query.ParamByName('NR_PROCESSO').AsString     := datm_exp_capa.qry_exp_NR_PROCESSO.AsString;

      for I := 0 to High(Itens) do
      begin
        Inc(NrItem);
        VlMCVTotal := VlMCVTotal + Itens[I].VlMCV;
        VlMLETotal := VlMLETotal + Itens[I].VlMLE;
        Query.ParamByName('NR_ITEM').AsString          := RightStr('00' + IntToStr(NrItem), 3);
        Query.ParamByName('CD_NCM').AsString           := Itens[I].NCM;
        Query.ParamByName('CD_SULF_NCM').AsString      := Itens[I].SufixoNCM;
//        Query.ParamByName('CD_NALADI_SH').AsString     := Itens[I].Naladi; naladi retirado do insert por não ser necessario na integração - by carlos - 01/07/2011
        Query.ParamByName('TX_MERCADORIA').AsMemo      := Itens[I].TxMerc;
        Query.ParamByName('CD_MERCADORIA').AsString    := Itens[I].CodMerc;
        Query.ParamByName('VL_TOT_PESO_LIQ').AsFloat   := Itens[I].PesoLiq;
        Query.ParamByName('VL_TOT_PESO_BRUTO').AsFloat := Itens[I].PesoLiq;
        Query.ParamByName('QT_MERCADORIA').AsFloat     := Itens[I].QtdComercial;
        Query.ParamByName('CD_UNID_MEDIDA').AsString   := Itens[I].UnidComercial;
        Query.ParamByName('VL_MCV').AsFloat            := Itens[I].VlMCV;
        Query.ParamByName('VL_MLE').AsFloat            := Itens[I].VlMLE;
        Query.ParamByName('VL_UNITARIO').AsFloat       := Itens[I].VlMLE / Itens[I].QtdComercial;
        Query.ParamByName('VL_TOT_ITEM').AsFloat       := Itens[I].VlMLE;
        Query.ParamByName('VL_PESO_LIQ_UNIT').AsFloat  := Itens[I].PesoLiq / Itens[I].QtdComercial;
        Query.ParamByName('CD_ACORDO').AsString        := Itens[I].Acordo;
        Query.ParamByName('CD_NORMAS').AsString        := Itens[I].Norma;
        Query.ParamByName('NR_PEDIDO').AsString        := NrPedido;
        if Itens[I].ExpFab then
        begin
          Query.ParamByName('CD_FABR_EXPO').AsString   := '1';
          Query.ParamByName('CD_FABRICANTE').AsString  := '';
          Query.ParamByName('CD_PAIS_ORIGEM').AsString := '';
        end
        else
        begin
          Query.ParamByName('CD_FABR_EXPO').AsString   := '2';
          Query.ParamByName('CD_FABRICANTE').AsString  := Itens[I].CodFabric;
          Query.ParamByName('CD_PAIS_ORIGEM').AsString := ConsultaLookUP('TEMPRESA_NAC', 'CD_EMPRESA', Itens[I].CodFabric, 'CD_PAIS_IMPORTADOR');
        end;
        Query.ExecSQL;
      end;
      Result := True;
    except
      on E: Exception do
      begin
        Result := False;
        MessageDlg('Erro inserindo itens.'#13'Mensagem original: ' + E.Message, mtError, [mbOk], 0);
      end;
    end;
  end;

  function VerificaMercadorias(Linha: Integer): Boolean;
  var
    NrAnexo, S: String;
    I: Integer;
  begin
    NrAnexo       := ProcuraProxima(Linha, 'Anexo');
    SetLength(Itens, 0);
    // Listar as mercadorias
    while NrAnexo <> '' do
    begin
      SetLength(Itens, High(Itens) + 2);
      with Itens[High(Itens)] do
      begin
        NCM           := ProcuraProxima(Linha, 'a - NCM:');
        NCM           := StringReplace(NCM,'.','',[rfReplaceAll]); //by carlos - 26/05/2011 (retirar os pontos que as vezes vêem)
        NCM           := Copy(NCM, 1, 8);
        SufixoNCM     := IIF(trim(Copy(NCM, 9, 2))='','00',Copy(NCM, 9, 2));

        Naladi        := ProcuraProxima(Linha, 'b - Naladi / SH:');
        Mercosul      := ProcuraProxima(Linha, 'c - Mercosul:');
        NmMerc        := ProcuraProxima(Linha, '11-Descrição da Mercadoria:');
        TxMerc        := NmMerc;
        Inc(Linha);
        while (Linha < Arquivo.Count) and (Trim(Arquivo[Linha]) <> '') and (CompareText(Arquivo[Linha], '12-Categoria Textil:') <> 0) do
        begin
          TxMerc := TxMerc + #13#10 + Trim(Arquivo[Linha]);
          Inc(Linha);
        end;
        CatTextil     := ProcuraProxima(Linha, '12-Categoria Textil:');
        UfProdutor    := ProcuraProxima(Linha, '13-Estado Produtor:');
        ValidEmb      := FormataData(ProcuraProxima(Linha, '14-Validade de Embarque:'));
        PesoLiq       := FormataValor(ProcuraProxima(Linha, '15-Peso Líquido (KG):'));
        QtdComercial  := FormataValor(ProcuraProxima(Linha, 'a - Quantidade...:'));
        S             := ProcuraProxima(Linha, 'b - Unidade:');
        UnidComercial := ConsultaLookUPSQL(' SELECT CD_DDBROKER ' +
                                           ' FROM TDE_PARA ' +
                                           ' WHERE CD_TABELA = "42" ' +
                                           '   AND CD_EXTERNO = "' + S + '"', 'CD_DDBROKER');
        Result := UnidComercial <> '';
        if not Result then
        begin
          MessageDlg('Unidade de medida não cadastrada ''' + S + '''', mtInformation, [mbOk], 0);
          Break;
        end
        else
        begin
          QtdNCM        := FormataValor(ProcuraProxima(Linha, 'a - Quantidade...:'));
          UnidNCM       := ProcuraProxima(Linha, 'b - Unidade:');
          VlMCV         := FormataValor(ProcuraProxima(Linha, 'a - Condição de Venda:'));
          VlMLE         := FormataValor(ProcuraProxima(Linha, 'b - Local de Embarqu'));
          VlUnitMCV     := FormataValor(ProcuraProxima(Linha, 'a - Condição de Venda:'));
          VlUnitMLE     := FormataValor(ProcuraProxima(Linha, 'b - Local de Embarque:'));
          PcAgente      := FormataValor(ProcuraProxima(Linha, 'a - Percentual:'));
          FormaAgente   := ConsultaLookUP('TFORMA_PAGAR', 'NM_SIGLA_SCX', ProcuraProxima(Linha, 'b - Forma:'), 'CODIGO');
          VlAgente      := FormataValor(ProcuraProxima(Linha, 'c - Valor:'));
          Finalidade    := ProcuraProxima(Linha, '21-Finalidade:');
          ExpFab        := CompareText(ProcuraProxima(Linha, '22-O exportador é o Fabricante: (S/N)'), 'S') = 0;
          ObsExp        := CompareText(ProcuraProxima(Linha, '23-Observação do Exportador: (S/N)'), 'S') = 0;
          if ExpFab then
            CodFabric := ''
          else
          begin
            ProcuraProxima(Linha, '24-Dados do Fabricante:');
            while (Linha < Arquivo.Count) and (CompareText(Copy(Trim(Arquivo[Linha]), 1, 7), 'Nº seq.') <> 0) do
              Inc(Linha);
            Inc(Linha);
            while (Linha < Arquivo.Count) and (Trim(Arquivo[Linha]) = '') do
              Inc(Linha);
            S := Trim(Arquivo[Linha]);
            I := Pos(' ', S);
            S := Trim(Copy(S, I+1, Length(S)));
            I := Pos(' ', S);
            S := Trim(Copy(S, I+1, Length(S)));
            I := Pos(' ', S);
            CodFabric := ConsultaLookUP('TEMPRESA_NAC', 'CGC_EMPRESA', Trim(Copy(S, 1, I-1)), 'CD_EMPRESA');
          end;
          TxObsExp      := ProcuraProxima(Linha, '25-Observ./Exp.:');
          Inc(Linha);
          while (Linha < Arquivo.Count) and (CompareText(Copy(Trim(Arquivo[Linha]), 1, 5), 'Anexo') <> 0) and
             (CompareText(Copy(Trim(Arquivo[Linha]), 1, 7), 'Nº seq.') <> 0) do
          begin
            TxObsExp := TxObsExp + #13#10 + Trim(Arquivo[Linha]);
            Inc(Linha);
          end;
          if Query.Active then
            Query.Close;
          Query.SQL.Clear;
          Query.SQL.Add('SELECT CD_MERCADORIA');
          Query.SQL.Add('FROM TMERCADORIA_EXP');
          Query.SQL.Add('WHERE REPLACE(REPLACE(AP_MERCADORIA' + ', '' '', ''''), '','', ''.'') = REPLACE(REPLACE(:NM_MERCADORIA, '' '', ''''), '','', ''.'')');
          Query.ParamByName('NM_MERCADORIA').AsString := NmMerc;
          Query.Open;
          CodMerc := Query.FieldByName('CD_MERCADORIA').AsString;
          Query.Close;
        end;
        NrAnexo := ProcuraProxima(Linha, 'Anexo');
      end;
    end;
    // Verificar se tem mercadoria e se todas estão cadastradas
    Result := High(Itens) >= 0;
    if not Result then
      NrAnexo := 'O arquivo integrado não contem itens.'
    else
    begin
      NrAnexo := '';
      for I := 0 to High(Itens) do
        if Trim(Itens[I].CodMerc) = '' then
          NrAnexo := NrAnexo + #13 + Trim(Itens[I].NmMerc);
      Delete(NrAnexo, 1, 1);
      Result := NrAnexo = '';
      if not Result then
        NrAnexo := 'Mercadorias não encontradas no cadastro de mercadorias:'#13 + NrAnexo;
    end;
    if not Result then
      MessageDlg(NrAnexo, mtError, [mbOk], 0);
  end;

  function VerificaAcordosNormas: Boolean;
  var
    I: Integer;
    Acordo, Norma: String;
  begin
    if Query.Active then
      Query.Open;
    Query.SQL.Clear;
    Query.SQL.Add('SELECT COUNT(*) AS QTD');
    Query.SQL.Add('FROM TCONFIG_PAIS_ACORDO_NORMA_PADRAO (NOLOCK)');
    Query.SQL.Add('WHERE CD_PAIS = :CD_PAIS');
    Query.ParamByName('CD_PAIS').AsString := CodPais;
    Query.Open;
    Result := Query.FieldByName('QTD').AsInteger > 0;
    Query.Close;
    if not Result then
      MessageDlg('Não há Acordo e Norma para o país informado.', mtInformation, [mbOk], 0)
    else
    begin
      // Insere Acordos
      datm_exp_capa.qry_acordos_normas.Close;
      datm_exp_capa.qry_acordos_normas.ParamByName('CD_PAIS').AsString := CodPais;
      datm_exp_capa.qry_acordos_normas.Open;
      datm_exp_capa.qry_acordos_normas.First;

      for I := 0 to High(Itens) do
      begin
        if datm_exp_capa.qry_acordos_normas.RecordCount > 1 then
        begin
          frmExpIntegraRAP_Normas := TfrmExpIntegraRAP_Normas.Create(nil);
          frmExpIntegraRAP_Normas.qry_acordos_normas_geral.Close;
          frmExpIntegraRAP_Normas.qry_acordos_normas_geral.ParamByName('CD_MERCADORIA').AsString := Itens[I].CodMerc;
          frmExpIntegraRAP_Normas.qry_acordos_normas_geral.Open;

          frmExpIntegraRAP_Normas.edt_cd_mercadoria.Text        := Itens[I].CodMerc;
          frmExpIntegraRAP_Normas.lbl_mercadoria.Caption        := '  ' + Itens[I].NmMerc;
          frmExpIntegraRAP_Normas.lbl_mercadoria_idioma.Caption := '  ' + '';
          frmExpIntegraRAP_Normas.lProcessando.Caption := IntToStr(I+1) + ' / ' + IntToStr(High(Itens)+1);
          frmExpIntegraRAP_Normas.DBGrid1.DataSource := datm_exp_capa.ds_acordos_normas;
          frmExpIntegraRAP_Normas.ShowModal;
          FreeAndNil(frmExpIntegraRAP_Normas);
        end;
        Query.SQL.Clear;
        Query.SQL.Add('INSERT INTO TMERC_EXP_ACORDO (CD_MERCADORIA, CD_ACORDO, CD_NORMA, TX_MERCADORIA) ');
        Query.SQL.Add('SELECT TOP 1 ''' + Itens[I].CodMerc + ''', CD_ACORDO, CD_NORMA, ''' + Itens[I].NmMerc + ''' TX_MERCADORIA');
        Query.SQL.Add('FROM TCONFIG_PAIS_ACORDO_NORMA_PADRAO CP (NOLOCK)');
        Query.SQL.Add('WHERE CD_PAIS   = :CD_PAIS');
        Query.SQL.Add('  AND CD_ACORDO = :CD_ACORDO');
        Query.SQL.Add('  AND CD_NORMA  = :CD_NORMA');
        Query.SQL.Add('  AND CD_ACORDO + CD_NORMA NOT IN (SELECT CD_ACORDO + CD_NORMA FROM TMERC_EXP_ACORDO (NOLOCK) WHERE CD_MERCADORIA = ''' + Itens[I].CodMerc + ''')');
        Query.ParamByName('CD_PAIS').AsString := CodPais;
        Query.ParamByName('CD_ACORDO').AsString := datm_exp_capa.qry_acordos_normasCD_ACORDO.AsString;
        Query.ParamByName('CD_NORMA').AsString := datm_exp_capa.qry_acordos_normasCD_NORMA.AsString;
        Query.ExecSQL;
        Itens[I].Acordo := datm_exp_capa.qry_acordos_normasCD_ACORDO.AsString;
        Itens[I].Norma  := datm_exp_capa.qry_acordos_normasCD_NORMA.AsString;
        CdIdioma := datm_exp_capa.qry_acordos_normasCD_IDIOMA.AsString;
      end;
    end;

  end;
begin
  if datm_exp_capa.qry_exp_.State in [dsEdit, dsInsert] then
    if MessageDlg('É necessário salvar as alterações antes de prosseguir com a integração.'#13'Deseja salvar agora?', mtConfirmation, [mbYes, mbNo], 0) = mrYes then
      btn_salvar.Click
    else
    begin
      MessageDlg('A integração foi cancelada.', mtInformation, [mbOk], 0);
      Exit;
    end;
  VlMCVTotal := 0;
  VlMLETotal := 0;
  OpenDlg.Filter := '';
  if OpenDlg.Execute then
  begin
    NrItem := StrToInt(ConsultaLookUPSQL(' SELECT ISNULL(MAX(CONVERT(INT, NR_ITEM)), 0) AS NR_ITEM ' +
                                         ' FROM TPROCESSO_EXP_ITEM ' +
                                         ' WHERE NR_PROCESSO = ' + QuotedStr(datm_exp_capa.qry_exp_NR_PROCESSO.AsString), 'NR_ITEM'));
    Query := TQuery.Create(Self);
    Query.DatabaseName := 'DBBROKER';
    datm_main.db_broker.StartTransaction;
    Arquivo := TStringList.Create;
    try
      for F := 0 to OpenDlg.Files.Count - 1 do
      begin
        PreparaArquivo(OpenDlg.Files[F]);
        NrPedido := ChangeFileExt(ExtractFileName(OpenDlg.Files[F]), '');
        try
          L := 0;
          if LerCapa(L) then
//            if VerificaMercadorias(L) and VerificaAcordosNormas and AdicionaItens then //by carlos não precisa varificar os acordos/normas porque o certificado não é feito pelo myindaia. 01/07/2011
            if VerificaMercadorias(L) and AdicionaItens then
            begin
              // Insere o nome do arquivo na aba Pedidos
              Query.SQL.Clear;
              Query.SQL.Add('DELETE TPROCESSO_EXP_PEDIDO');
              Query.SQL.Add('WHERE NR_PROCESSO = :NR_PROCESSO');
              Query.SQL.Add('  AND NR_PEDIDO   = :NR_PEDIDO');
              Query.ParamByName('NR_PROCESSO').AsString := datm_exp_capa.qry_exp_NR_PROCESSO.AsString;
              Query.ParamByName('NR_PEDIDO').AsString := NrPedido;
              Query.ExecSQL;
              Query.SQL.Clear;
              Query.SQL.Add('INSERT INTO TPROCESSO_EXP_PEDIDO(NR_PROCESSO, NR_PEDIDO, NR_FATURA, IN_INTEGRADO)');
              Query.SQL.Add('VALUES(:NR_PROCESSO, :NR_PEDIDO, :NR_FATURA, "1")');
              Query.ParamByName('NR_PROCESSO').AsString := datm_exp_capa.qry_exp_NR_PROCESSO.AsString;
              Query.ParamByName('NR_PEDIDO').AsString := NrPedido;
              Query.ParamByName('NR_FATURA').AsString := NrPedido;
              Query.ExecSQL;
            end
            else
            begin
              if datm_main.db_broker.InTransaction then
                datm_main.db_broker.Rollback;
              Break;
            end;
        except
          on E: Exception do
          begin
            if datm_main.db_broker.InTransaction then
              datm_main.db_broker.Rollback;
            MessageDlg('Erro na linha ' + IntToStr(L) + ' do arquivo ' + ExtractFileName(OpenDlg.Files[F]) + '.'#13 +
                       'A operação foi totalmente desfeita.'#13 +
                       'Mensagem original: ' + E.Message, mtError, [mbOk], 0);
            Break;
          end; // EXCEPTION
        end; // TRY
      end; // FOR
      if datm_main.db_broker.InTransaction then
      begin
        Query.SQL.Clear;
        Query.SQL.Add('UPDATE TPROCESSO_EXP');
        Query.SQL.Add('SET VL_TOT_MCV          = :VL_TOT_MCV,');
        Query.SQL.Add('    QT_TOTAL_ITENS      = :QT_TOTAL_ITENS,');
        Query.SQL.Add('    CD_LINGUA_PEDIDO    = :CD_LINGUA_PEDIDO,');
        Query.SQL.Add('    VL_COMISSAO_PERCENT = :VL_COMISSAO_PERCENT,');
        Query.SQL.Add('    CD_FORMA_PAGTO      = :CD_FORMA_PAGTO');
        Query.SQL.Add('WHERE NR_PROCESSO = :NR_PROCESSO');
        Query.ParamByName('VL_TOT_MCV').AsFloat   := VlMCVTotal;
        Query.ParamByName('NR_PROCESSO').AsString := datm_exp_capa.qry_exp_NR_PROCESSO.AsString;
        Query.ParamByName('QT_TOTAL_ITENS').AsString := RightStr('00' + IntToStr(High(Itens) + 1), 3);
        Query.ParamByName('CD_LINGUA_PEDIDO').AsString := CdIdioma;
        Query.ParamByName('VL_COMISSAO_PERCENT').AsFloat := Itens[0].PcAgente;
        Query.ParamByName('CD_FORMA_PAGTO').AsString := Itens[0].FormaAgente;
        Query.ExecSQL;

        Query.SQL.Clear;
        Query.SQL.Add('EXEC SP_EXP_CALCULA :NR_PROCESSO');
        Query.ParamByName('NR_PROCESSO').AsString := datm_exp_capa.qry_exp_NR_PROCESSO.AsString;
        Query.ExecSQL;

        datm_main.db_broker.Commit;
        datm_exp_capa.qry_exp_.Close;
        datm_exp_capa.qry_exp_.Open;
        ShowMessage('Integração concluída com sucesso...'#13 +
                    IntToStr(High(Itens) + 1) + ' itens integrados.');
      end
    except
      on E: Exception do
      begin
        if datm_main.db_broker.InTransaction then
          datm_main.db_broker.Rollback;
        MessageDlg('Erro durante a operação:'#13 + E.Message, mtError, [mbOk], 0);
      end; // EXCEPTION
    end; // TRY
    if Assigned(Query) then
      FreeAndNil(Query);
    if Assigned(Arquivo) then
      FreeAndNil(Arquivo);

    btn_salvar.Enabled   := False;
    mi_salvar.Enabled    := False;
    btn_cancelar.Enabled := False;
    mi_cancelar.Enabled  := False;
    btn_excluir.Enabled  := True;
    mi_excluir.Enabled   := True;
    btn_itens_exp.Enabled:= True;
    mi_itens_exp.Enabled := True;

    datm_exp_capa.qry_exp_itens_.Close;
    datm_exp_capa.qry_exp_itens_.ParamByName('NR_PROCESSO').AsString := datm_exp_capa.qry_exp_NR_PROCESSO.AsString;
    datm_exp_capa.qry_exp_itens_.Open;
    btn_calculo.Enabled := not datm_exp_capa.qry_exp_itens_.Eof;
    datm_exp_capa.qry_exp_itens_.Close;

  end;
end;

procedure Tfrm_exp_capa.btnIntegraJPClick(Sender: TObject);
var
  Linhas, Colunas: TStringList;
  l, x, vQtdItens: Integer;
  str_linha, str_registro,vCliente, str_coluna, vInsereProcesso, vitens, vMercadorias, vtemitens, in_pedido, vcods, in_salvo: String;
  vMoeda, flag_CD_fabricante, codPais: String;
  flag_CD_EXPORTADOR, flag_CD_IMPORTADOR, flag_CD_pais,vArquivo, flag_TX_DESC_MERCADORIA: String;
  flag_IN_EXPORTADOR_FABRICANTE: Variant;
  flag_Data_Abertura: TDateTime;

  function DePara_RE(pUnidade,pProduto,pTabela,pCodigoExterno : string) : string;
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

  function DeParaCliente(const vCd_Cliente : string) : string;
  begin
    with TQuery.Create(Application) do
    begin
      DatabaseName := 'DBBROKER';
      SQL.Clear;
      SQL.Add('select CD_EMPRESA from TEMPRESA_EST');
      SQL.Add('where');
      SQL.Add('  NR_CLIENTE = ''' + IntToStr(StrToInt(vCd_Cliente)) + '''');
      Open;
      Result := FieldByName('CD_EMPRESA').AsString;
      Free;
    end;
  end;

  function DeParaTermoPagto(const vCd_TermoPagto : string) : string;
  begin
    with TQuery.Create(Application) do
    begin
      DatabaseName := 'DBBROKER';
      SQL.Clear;
      SQL.Add('select CD_DDBROKER from TDE_PARA');
      SQL.Add('where CD_TABELA = ''23'''); //23 = Termo Pagto - PPG
      SQL.Add('  and CD_EXTERNO = ''' + vCd_TermoPagto + '''');
      Open;
      Result := FieldByName('CD_DDBROKER').AsString;
      Free;
    end;
  end;

  function DeParaUnidMedida(const vCd_UnidMedida : string) : string;
  begin
    with TQuery.Create(Application) do
    begin
      DatabaseName := 'DBBROKER';
      SQL.Clear;
      SQL.Add('select CD_DDBROKER from TDE_PARA');
      SQL.Add('where CD_TABELA = ''24'''); //24 = Unid de Medida - PPG
      SQL.Add('  and CD_EXTERNO = ''' + vCd_UnidMedida + '''');
      Open;
      Result := FieldByName('CD_DDBROKER').AsString;
      Free;
    end;
  end;

  function VerificaMercadorias( CodMerc, NmMerc : string): string;
  var
    NrAnexo,merc: String;
  begin
     with TQuery.Create(nil) do
     begin
      Databasename := 'DBBROKER';
      SQL.Clear;
      SQL.Add('SELECT CD_MERCADORIA');
      SQL.Add('FROM TMERCADORIA_EXP');
      SQL.Add('WHERE CD_MERCADORIA = :CD_MERCADORIA');
      ParamByName('CD_MERCADORIA').AsString := CodMerc;
      Open;
      merc := FieldByName('CD_MERCADORIA').AsString;
      Close;
     end;
     if merc='' then
     begin
      NrAnexo := NrAnexo + #13 + CodMerc;
      Result := NrAnexo;
     end
     else
     begin
       datm_exp_capa.qry_exp_itens_Imp.FieldByName('CD_MERCADORIA').AsString := CodMerc;
      Result := '';
     end;
  end;

  function VerificaAcordosNormas(codPais:string;vitens:string;vmercadorias:string): Boolean;
  var
    Acordo, Norma,codmerc,nmmerc,verifica: String;
  begin
    with TQuery.Create(nil) do
    begin
      Databasename := 'DBBROKER';
      SQL.Clear;
      SQL.Add('SELECT COUNT(*) AS QTD');
      SQL.Add('FROM TCONFIG_PAIS_ACORDO_NORMA_PADRAO (NOLOCK)');
      SQL.Add('WHERE CD_PAIS = :CD_PAIS');
      ParamByName('CD_PAIS').AsString := CodPais;
      Open;
      Result := FieldByName('QTD').AsInteger > 0;
      Close;
      if vmercadorias = '' then
      begin
        if not Result then
          MessageDlg('Não há Acordo e Norma para o país informado.', mtInformation, [mbOk], 0)
        else
        begin
          // Insere Acordos
          datm_exp_capa.qry_acordos_normas.Close;
          datm_exp_capa.qry_acordos_normas.ParamByName('CD_PAIS').AsString := CodPais;
          datm_exp_capa.qry_acordos_normas.Open;
          datm_exp_capa.qry_acordos_normas.First;

          codmerc:=datm_exp_capa.qry_exp_itens_Imp.FieldByName('CD_MERCADORIA').AsString ;
          nmmerc :=datm_exp_capa.qry_exp_itens_Imp.FieldByName('TX_MERCADORIA').AsString ;

          if (datm_exp_capa.qry_acordos_normas.RecordCount > 1 ) then
          begin
            frmExpIntegraRAP_Normas := TfrmExpIntegraRAP_Normas.Create(nil);
            frmExpIntegraRAP_Normas.qry_acordos_normas_geral.Close;
            frmExpIntegraRAP_Normas.qry_acordos_normas_geral.ParamByName('CD_MERCADORIA').AsString := codmerc;//Itens[I].CodMerc;
            frmExpIntegraRAP_Normas.qry_acordos_normas_geral.Open;

            frmExpIntegraRAP_Normas.edt_cd_mercadoria.Text        :=  codmerc;//Itens[I].CodMerc;
            frmExpIntegraRAP_Normas.lbl_mercadoria.Caption        :=  nmmerc;//'  ' + Itens[I].NmMerc;
            frmExpIntegraRAP_Normas.lbl_mercadoria_idioma.Caption := '  ' + '';
            frmExpIntegraRAP_Normas.lProcessando.Caption := codmerc;//IntToStr(I+1) + ' / ' + IntToStr(High(Itens)+1);
            frmExpIntegraRAP_Normas.DBGrid1.DataSource := datm_exp_capa.ds_acordos_normas;
            frmExpIntegraRAP_Normas.ShowModal;
            FreeAndNil(frmExpIntegraRAP_Normas);
          end;
          SQL.Clear;
          SQL.Add('INSERT INTO TMERC_EXP_ACORDO (CD_MERCADORIA, CD_ACORDO, CD_NORMA, TX_MERCADORIA) ');
          SQL.Add('SELECT TOP 1 ''' + codmerc + ''', CD_ACORDO, CD_NORMA, ''' + nmmerc + ''' TX_MERCADORIA');
          SQL.Add('FROM TCONFIG_PAIS_ACORDO_NORMA_PADRAO CP (NOLOCK)');
          SQL.Add('WHERE CD_PAIS   = :CD_PAIS');
          SQL.Add('  AND CD_ACORDO = :CD_ACORDO');
          SQL.Add('  AND CD_NORMA  = :CD_NORMA');
          SQL.Add('  AND CD_ACORDO + CD_NORMA NOT IN (SELECT CD_ACORDO + CD_NORMA FROM TMERC_EXP_ACORDO (NOLOCK) WHERE CD_MERCADORIA = ''' + codmerc + ''')');
          ParamByName('CD_PAIS').AsString := CodPais;
          ParamByName('CD_ACORDO').AsString := datm_exp_capa.qry_acordos_normasCD_ACORDO.AsString;
          ParamByName('CD_NORMA').AsString := datm_exp_capa.qry_acordos_normasCD_NORMA.AsString;
          ExecSQL;
          Acordo := datm_exp_capa.qry_acordos_normasCD_ACORDO.AsString;
          Norma  := datm_exp_capa.qry_acordos_normasCD_NORMA.AsString;

          datm_exp_capa.qry_exp_itens_Imp.FieldByName('CD_ACORDO').AsString        := Acordo;
          datm_exp_capa.qry_exp_itens_Imp.FieldByName('CD_NORMAS').AsString         := Norma;
        end;
      end;
    end;
  end;

begin
  OpenDlg.Filter := '*.txt|*.dat';
  vtemitens := ConsultaLookUPSQL('SELECT COUNT(*) QNTD FROM TPROCESSO_EXP_ITEM WHERE NR_PROCESSO='''+ str_nr_processo +''' ','QNTD');
  in_salvo:='0';
  if vtemitens ='0' then
  begin
    if AbreDAT.Execute then
    begin
      vArquivo:= AbreDAT.FileName;
      if not fileexists(vArquivo) then
      begin
        ShowMessage('Arquivo não Encontrado!!!');
        Exit;
      end;
      if CompareText(ExtractFileExt(vArquivo), '.dat') <> 0 then
      begin
        ShowMessage('Extensão de Arquivo Inválida!!!');
        Exit;
      end;
      datm_exp_capa.qryRefCliente.Open;

      datm_exp_capa.qry_exp_itens_Imp.Close;
      datm_exp_capa.qry_exp_itens_Imp.ParamByName('NR_PROCESSO').AsString := str_nr_processo;
      datm_exp_capa.qry_exp_itens_Imp.Open;

      datm_exp_capa.qryProcContainer.close;
      datm_exp_capa.cdsProcContainer.close;
      datm_exp_capa.qryProcContainer.ParamByName('NR_PROCESSO').AsString := str_nr_processo;
      datm_exp_capa.qryProcContainer.open;
      datm_exp_capa.cdsProcContainer.open;

      datm_exp_capa.qry_exp_ped_.Close;
      datm_exp_capa.qry_exp_ped_.ParamByName('NR_PROCESSO').AsString := str_nr_processo;
      datm_exp_capa.qry_exp_ped_.Open;

      vCliente := ConsultaLookUP('TPROCESSO', 'NR_PROCESSO', str_nr_processo, 'CD_CLIENTE');
      datm_main.db_broker.StartTransaction;

      Linhas  := TStringList.Create;
      Colunas := TStringList.Create;
      try
        linhas.LoadFromFile(vArquivo);
        for l := Pred(Linhas.Count)-1 to Pred(Linhas.Count) do
        begin
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
              SQL.Add('select distinct CD_EMPRESA from TEMPRESA_EST where NR_CLIENTE="'+colunas.Strings[1]+'"' );
              open;
              flag_CD_IMPORTADOR:=Fields[0].AsString;
              close;
              free;
            end;
            datm_exp_capa.qry_exp_.Edit;
            datm_exp_capa.qry_exp_CD_IMPORTADOR.AsString       := flag_CD_IMPORTADOR;
            if flag_CD_IMPORTADOR = '' then
            begin
              with TQuery.Create(nil) do
              begin
                Databasename := 'DBBROKER';
                //Busca o Ultimo Codigo para a empresa Estrangeira
                SQL.Clear;
                SQL.Add('SELECT MAX(cd_empresa) FROM TEMPRESA_EST ' );
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
          end; //FINAL 'IM'

          if str_registro = 'EX' then
          begin
            with TQuery.Create(nil) do
            begin
              Databasename    := 'DBBROKER';
              SQL.Clear;
              SQL.Add('select distinct CD_EMPRESA from TEMPRESA_NAC where CGC_EMPRESA="'+colunas.Strings[6] +'"');
              open;
              flag_CD_EXPORTADOR:=Fields[0].AsString;
              close;
              free;
            end;
            datm_exp_capa.qry_exp_.Edit;
            datm_exp_capa.qry_exp_CD_EXPORTADOR.AsString       := flag_CD_EXPORTADOR;
          end; //FINAL 'EX'
        end; // FINAL FOR


        for l := 0 to Pred(Linhas.Count)-2 do
        begin
          str_linha := linhas.Strings[l];
          colunas.Clear;
          ExtractStrings([','], [' '], PChar(str_linha), Colunas);
          Colunas.Text := StringReplace(Colunas.text, '"', '', [rfReplaceAll]);
          str_registro := Colunas.Strings[0];


          if str_registro='24' then
          begin
            in_pedido:= ConsultaLookUPSQL(' SELECT NR_PEDIDO FROM TPROCESSO_EXP_PEDIDO WHERE NR_PROCESSO = '''+ datm_exp_capa.qry_exp_NR_PROCESSO.AsString +''' AND NR_PEDIDO   = '''+ Colunas.Strings[1]+''' ','NR_PEDIDO');
            if in_pedido = '' then
              datm_exp_capa.qry_exp_ped_.Insert
            else
              datm_exp_capa.qry_exp_ped_.Edit;

            datm_exp_capa.qry_exp_ped_NR_PROCESSO.AsString        := datm_exp_capa.qry_exp_NR_PROCESSO.AsString;
            datm_exp_capa.qry_exp_ped_NR_PEDIDO.AsString          := Colunas.Strings[1];
            datm_exp_capa.qry_exp_ped_NR_FATURA.AsString          := datm_exp_capa.qry_exp_ped_NR_PEDIDO.AsString;
            datm_exp_capa.qry_exp_ped_TX_MARCACAO_VOLUME.AsString := '';
            datm_exp_capa.qry_exp_ped_TX_INF_EMBALAGEM.AsString   := '';
            datm_exp_capa.qry_exp_ped_TX_MERCADORIA.AsString      := '';
            datm_exp_capa.qry_exp_ped_VL_DESCONTO.AsFloat         := 0;
            datm_exp_capa.qry_exp_ped_VL_FRETE.AsFloat            := 0;
            datm_exp_capa.qry_exp_ped_VL_SEGURO.AsFloat           := 0;
            datm_exp_capa.qry_exp_ped_VL_PESO_LIQUIDO.AsFloat     := StrToFloat(StringReplace(Colunas.Strings[53], '.', ',', [rfReplaceAll]));
            datm_exp_capa.qry_exp_ped_VL_PESO_BRUTO.AsFloat       := 0;
            datm_exp_capa.qry_exp_ped_VL_CUBAGEM.AsFloat          := 0;
            datm_exp_capa.qry_exp_ped_.Post;

            datm_exp_capa.qry_exp_.Edit;
            datm_exp_capa.qry_exp_NR_FATURA.AsString := Colunas.Strings[1];
            datm_exp_capa.qry_exp_CD_URF_DESPACHO.AsString := Colunas.Strings[17];
            datm_exp_capa.qry_exp_CD_URF_DESTINO.AsString := Colunas.Strings[18];
            datm_exp_capa.qry_exp_CD_PAIS_DESTINO.AsString := Colunas.Strings[20];
            datm_exp_capa.qry_exp_CD_INST_NEGOC.AsString := Colunas.Strings[21];
            datm_exp_capa.qry_exp_CD_INCOTERM.AsString := Colunas.Strings[22];
            datm_exp_capa.qry_exp_CD_VIA_TRANSPORTE.AsString := ConsultaLookUPSQL('SELECT CD_VIA_TRANSPORTE FROM TPROCESSO TP INNER JOIN TSERVICO_NOVO TS ON TS.CD_SERVICO = TP.CD_SERVICO WHERE NR_PROCESSO = ''' + str_nr_processo + ''' ', 'CD_VIA_TRANSPORTE');
            datm_exp_capa.qry_exp_CD_MOEDA.AsString := Colunas.Strings[26];
            datm_exp_capa.qry_exp_CD_PAIS_ORIGEM.AsString := Colunas.Strings[38];
            datm_exp_capa.qry_exp_VL_FRETE.AsFloat:=StrToFloat(StringReplace(Colunas.Strings[47], '.', ',', [rfReplaceAll]));
            datm_exp_capa.qry_exp_VL_SEGURO.AsFloat := StrToFloat(StringReplace(Colunas.Strings[48], '.', ',', [rfReplaceAll]));
            datm_exp_capa.qry_exp_VL_PESO_LIQUIDO.AsFloat := StrToFloat(StringReplace(Colunas.Strings[53], '.', ',', [rfReplaceAll]));
            datm_exp_capa.qry_exp_VL_PESO_BRUTO.AsFloat   := StrToFloat(StringReplace(Colunas.Strings[53], '.', ',', [rfReplaceAll]));
            datm_exp_capa.qry_exp_CD_LINGUA_PEDIDO.AsString := ConsultaLookUPSQL('select CD_IDIOMA_PADRAO from TPAIS where CODIGO='''+datm_exp_capa.qry_exp_CD_PAIS_DESTINO.AsString+''' ','CD_IDIOMA_PADRAO');
            datm_exp_capa.qry_exp_.Post;

            vMoeda := Trim(Colunas.Strings[26]);
            if (vMoeda <> '') and (not IsNumeric(vMoeda)) then
              vMoeda := ConsultaLookUP('TMOEDAS_ISO', 'CD_SIGLA', vMoeda, 'CD_MOEDA');

          end; //FINAL '24'

          if str_registro='25' then
          begin
           if in_salvo='0' then
           begin
            with TQuery.Create(nil) do
            begin
              Databasename := 'DBBROKER';
              SQL.Clear;
              SQL.Add('UPDATE TPROCESSO_EXP SET CD_FORMA_PAGTO='''+ Colunas.Strings[18] +''',VL_COMISSAO_PERCENT='''+ Colunas.Strings[16] +''' where NR_PROCESSO='''+ str_nr_processo +''' ' );
              ExecSQL;
              Free;
              in_salvo:='1'
            end;
           end;
           
            Inc(vQtdItens);
            datm_exp_capa.qry_exp_itens_Imp.Insert;
            datm_exp_capa.qry_exp_itens_Imp.FieldByName('NR_PROCESSO').AsString          := datm_exp_capa.qry_exp_NR_PROCESSO.AsString;
            datm_exp_capa.qry_exp_itens_Imp.FieldByName('NR_ITEM').AsString              := Colunas.Strings[3] ;
            datm_exp_capa.qry_exp_itens_Imp.FieldByName('QT_MERCADORIA').AsFloat         := StrToFloat(StringReplace((copy(Colunas.Strings[21],1,((PosEx(' ', Colunas.Strings[21]))-1))), '.', '', [rfReplaceAll]));
            datm_exp_capa.qry_exp_itens_Imp.FieldByName('VL_MCV').AsFloat              := StrToFloat(StringReplace(Colunas.Strings[14], '.', ',', [rfReplaceAll])) ;
            datm_exp_capa.qry_exp_itens_Imp.FieldByName('VL_MLE').AsFloat               := StrToFloat(StringReplace(Colunas.Strings[15], '.', ',', [rfReplaceAll])) ;

            datm_exp_capa.qry_exp_itens_Imp.FieldByName('CD_UNID_MEDIDA').AsString := dePara_RE('01','02','29',trim(Colunas.Strings[12]));
            if datm_exp_capa.qry_exp_itens_Imp.FieldByName('CD_UNID_MEDIDA').AsString = '' then //se vier vazio é pq o termo de pagto não está na tabela De/Para
            begin
              BoxMensagem( 'Não existe a Unidade de Medida  " ' + Colunas.Strings[12] + '" na tabela DE/PARA', 3 );
              datm_exp_capa.qry_exp_itens_Imp.Cancel;
              datm_main.db_broker.Rollback;
              btn_cancelar.Click;
              Exit;
            end;
            //datm_exp_capa.qry_exp_itens_Imp.FieldByName('VL_PESO_LIQ_UNIT').Asfloat       := StrToFloat(StringReplace(Colunas.Strings[10], '.', ',', [rfReplaceAll])) ;
            // A linha acima foi substituída pela linha abaixo porque o peso líquido informado no arquivo já é o total e não o unitário - Michel - 02/05/2012
            datm_exp_capa.qry_exp_itens_Imp.FieldByName('VL_PESO_LIQ_UNIT').Asfloat      := StrToFloat(StringReplace(Colunas.Strings[10], '.', ',', [rfReplaceAll])) / datm_exp_capa.qry_exp_itens_Imp.FieldByName('QT_MERCADORIA').AsFloat;
            // Na linha abaixo foi comentada a multiplicação porque o peso líquido informado no arquivo já é o total - Michel - 02/05/2012
            datm_exp_capa.qry_exp_itens_Imp.FieldByName('VL_TOT_PESO_LIQ').Asfloat       := datm_exp_capa.qry_exp_itens_Imp.FieldByName('VL_PESO_LIQ_UNIT').Asfloat * datm_exp_capa.qry_exp_itens_Imp.FieldByName('QT_MERCADORIA').AsFloat;
            datm_exp_capa.qry_exp_itens_Imp.FieldByName('VL_TOT_PESO_BRUTO').Asfloat     := datm_exp_capa.qry_exp_itens_Imp.FieldByName('VL_PESO_LIQ_UNIT').Asfloat * datm_exp_capa.qry_exp_itens_Imp.FieldByName('QT_MERCADORIA').AsFloat;
            datm_exp_capa.qry_exp_itens_Imp.FieldByName('VL_TOT_ITEM').AsFloat           := StrToFloat(StringReplace(Colunas.Strings[14], '.', ',', [rfReplaceAll])) ;
            datm_exp_capa.qry_exp_itens_Imp.FieldByName('VL_UNITARIO').AsFloat           := datm_exp_capa.qry_exp_itens_Imp.FieldByName('VL_TOT_ITEM').AsFloat/datm_exp_capa.qry_exp_itens_Imp.FieldByName('QT_MERCADORIA').AsFloat ;
            //datm_exp_capa.qry_exp_itens_Imp.FieldByName('VL_PESO_LIQ_UNIT').AsFloat      := datm_exp_capa.qry_exp_itens_Imp.FieldByName('VL_TOT_PESO_LIQ').AsFloat / datm_exp_capa.qry_exp_itens_Imp.FieldByName('QT_MERCADORIA').AsFloat;
            datm_exp_capa.qry_exp_itens_Imp.FieldByName('NR_PEDIDO').AsString            := Colunas.Strings[1]; //Copy(ExtractFileName(OpenDlg.FileName),1,Length(ExtractFileName(OpenDlg.FileName))-4);
            datm_exp_capa.qry_exp_itens_Imp.FieldByName('CD_SULF_NCM').AsString          := copy(Colunas.Strings[7],8,2);
            datm_exp_capa.qry_exp_itens_Imp.FieldByName('CD_NCM').AsString               := copy(Colunas.Strings[7],1,8);
            datm_exp_capa.qry_exp_itens_Imp.FieldByName('CD_NALADI_SH').AsString         := Colunas.Strings[5];

           // Mercadoria x Acordo
            datm_exp_capa.qry_merc_acordo_norma_.Close;
            codPais:= datm_exp_capa.qry_exp_.FieldByName('CD_PAIS_DESTINO').AsString;
            datm_exp_capa.qry_merc_acordo_norma_.ParamByName('CD_PAIS').AsString         := datm_exp_capa.qry_exp_.FieldByName('CD_PAIS_DESTINO').AsString;
            datm_exp_capa.qry_merc_acordo_norma_.ParamByName('CD_MERCADORIA').AsString   := datm_exp_capa.qry_exp_itens_Imp.FieldByName('CD_MERCADORIA').AsString;
            datm_exp_capa.qry_merc_acordo_norma_.Open;

            vitens:= Colunas.Strings[3];


            flag_IN_EXPORTADOR_FABRICANTE := '';
            if Colunas.Strings[32] = 'S' then
              flag_IN_EXPORTADOR_FABRICANTE := '1';

            if Colunas.Strings[32] = 'N' then
              flag_IN_EXPORTADOR_FABRICANTE := '2';

            datm_exp_capa.qry_exp_itens_Imp.FieldByName('CD_FABR_EXPO').AsString := flag_IN_EXPORTADOR_FABRICANTE;

            if datm_exp_capa.qry_merc_acordo_norma_CD_MERCADORIA.AsString <> '' then
            begin
              datm_exp_capa.qry_exp_itens_Imp.FieldByName('CD_NCM_DOC').AsString         := Colunas.Strings[7];
              datm_exp_capa.qry_exp_itens_Imp.FieldByName('CD_NALADI_SH').AsString       := Colunas.Strings[5];
              datm_exp_capa.qry_exp_itens_Imp.FieldByName('CD_NALADI_DOC').AsString      := datm_exp_capa.qry_merc_acordo_norma_CD_NALADI_SH_DOC.AsString;
              datm_exp_capa.qry_exp_itens_Imp.FieldByName('NR_SEQ_NALADI_DOC').AsInteger := datm_exp_capa.qry_merc_acordo_norma_NR_SEQ_NALADI.AsInteger;
              datm_exp_capa.qry_exp_itens_Imp.FieldByName('CD_ACORDO').AsString          := datm_exp_capa.qry_merc_acordo_norma_CD_ACORDO.AsString;
              datm_exp_capa.qry_exp_itens_Imp.FieldByName('CD_NORMAS').AsString          := datm_exp_capa.qry_merc_acordo_norma_CD_NORMA.AsString;
              datm_exp_capa.qry_exp_itens_Imp.FieldByName('TX_MERCADORIA').AsString      := datm_exp_capa.qry_merc_acordo_norma_TX_MERCADORIA.AsString;
            end
            else
              datm_exp_capa.qry_exp_itens_Imp.FieldByName('TX_MERCADORIA').AsString      := Colunas.Strings[21];

            // Solicitado para fazer igual a integração no RE - Michel - 10/09/2012
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
            datm_exp_capa.qry_exp_itens_Imp.FieldByName('TX_MERCADORIA').AsString := flag_TX_DESC_MERCADORIA;

            if Trim(ConsultaLookUP('TMERCADORIA_EXP', 'CD_MERCADORIA', Colunas[20], 'CD_MERCADORIA')) = '' then
              FastExecSQL('INSERT INTO TMERCADORIA_EXP(CD_MERCADORIA, NM_MERCADORIA, AP_MERCADORIA, CD_UN_MED_COMERC, CD_NCM_SH, CD_SULF_NCM, CD_PAIS_AQUISICAO, CD_PAIS_ORIGEM, CD_GRUPO, CD_FABR_EXPO, CD_TIPO_CALCULO, CD_FINALIDADE_MERC, CD_USUARIO_CRIACAO, DT_CRIACAO, IN_ATIVO)' +
                          'VALUES(' + QuotedStr(Colunas[20]) + ', ' + QuotedStr(Colunas[21]) + ', ' + QuotedStr(Copy(Colunas[21], 1, 40)) + ', ' + QuotedStr(datm_exp_capa.qry_exp_itens_Imp.FieldByName('CD_UNID_MEDIDA').AsString) + ', ' +
                             QuotedStr(LeftStr(Colunas[7], 8)) + ', ' + QuotedStr(RightStr(Trim(Colunas[7]), 2)) + ', ' + QuotedStr(codPais) + ', ' + QuotedStr('') + ', ''986'', ' + QuotedStr(flag_IN_EXPORTADOR_FABRICANTE) + ', ''1'', ' +
                             QuotedStr('') + ', ''0707'', GETDATE(), ''1'')');

            vMercadorias:= VerificaMercadorias(Colunas.Strings[20],Colunas.Strings[21]);
            if not (pos(vMercadorias,vcods) > 0 ) then
            begin
              vcods:= vmercadorias + vcods;
            end;
            VerificaAcordosNormas(codPais,vitens,vcods);

            datm_exp_capa.qry_exp_itens_Imp.FieldByName('CD_EMBALAGEM').AsString         := ConsultaLookUPSQL('select CD_EMBALAGEM from TMERCADORIA_EXP where CD_MERCADORIA = ''' + datm_exp_capa.qry_exp_itens_Imp.FieldByName('CD_MERCADORIA').AsString + '''','CD_EMBALAGEM');
            if datm_exp_capa.qry_embalagem_.Locate( 'CD_EMBALAGEM', datm_exp_capa.qry_exp_itens_Imp.FieldByName('CD_EMBALAGEM').AsString, [] ) then
            begin
              if datm_exp_capa.qry_exp_itens_Imp.FieldByName('CD_EMBALAGEM_SUP').AsString = '' then
                datm_exp_capa.qry_exp_itens_Imp.FieldByName('CD_EMBALAGEM_SUP').AsString := datm_exp_capa.qry_embalagem_CD_EMBALAGEM_SUP.AsString;

              if datm_exp_capa.qry_exp_itens_Imp.FieldByName('QT_POR_EMB_SUP').AsFloat = 0 then
                datm_exp_capa.qry_exp_itens_Imp.FieldByName('QT_POR_EMB_SUP').AsFloat    := datm_exp_capa.qry_embalagem_QT_EMBALAGEM_SUP.AsFloat;
            end;

            if datm_exp_capa.qry_exp_itens_Imp.FieldByName('CD_UNID_MEDIDA').AsString <> '103' then
              datm_exp_capa.qry_exp_itens_Imp.FieldByName('QT_POR_EMB').AsString         := ConsultaLookUPSQL('select QT_POR_EMBALAGEM from TMERCADORIA_EXP where CD_MERCADORIA = ''' + datm_exp_capa.qry_exp_itens_Imp.FieldByName('CD_MERCADORIA').AsString + '''','QT_POR_EMBALAGEM');

            datm_exp_capa.qry_exp_itens_Imp.FieldByName('VL_POR_EMB').AsFloat            := datm_exp_capa.qry_exp_itens_Imp.FieldByName('QT_POR_EMB').AsFloat * datm_exp_capa.qry_exp_itens_Imp.FieldByName('QT_MERCADORIA').AsFloat;

            datm_exp_capa.qry_exp_.Close;
            datm_exp_capa.qry_exp_.Open;
            datm_exp_capa.qry_exp_.Locate('NR_PROCESSO',str_nr_processo,[]);
            datm_exp_capa.qry_exp_.Edit;

            datm_exp_capa.qry_exp_.Post;

          end;

          // Adicionado por Michel para pegar o ato concessório - Michel - 04/05/2012
          if (str_registro = '26') then
          begin
            if (datm_exp_capa.qry_exp_itens_Imp.FieldByName('NR_ITEM').AsString = Colunas[3]) or datm_exp_capa.qry_exp_itens_Imp.Locate('NR_ITEM', Colunas[3], []) then
              datm_exp_capa.qry_exp_itens_Imp.FieldByName('NR_ATO_CONCESSORIO').AsString := Colunas[8];
          end; // 26

          if (flag_IN_EXPORTADOR_FABRICANTE = '2') and (str_registro = '26') then
          begin
            with TQuery.Create(nil) do
            begin
              Databasename    := 'DBBROKER';
              SQL.Clear;
              SQL.Add('select distinct CD_EMPRESA,CD_PAIS from TEMPRESA_est where CGC_EMPRESA="'+colunas.Strings[5] +'"');
              open;
              flag_CD_fabricante:=Fields[0].AsString;
              flag_CD_pais:=Fields[1].AsString;
              close;
              free;
            end;
            datm_exp_capa.qry_exp_itens_Imp.FieldByName('CD_FABRICANTE').AsString := flag_CD_fabricante;
            datm_exp_capa.qry_exp_itens_Imp.FieldByName('CD_PAIS_ORIGEM').AsString:= flag_CD_pais;
            datm_exp_capa.qry_exp_itens_Imp.Post;
          end
          else
          begin
           if (str_registro <> '24') and (flag_IN_EXPORTADOR_FABRICANTE <> '2') then
           begin
            if datm_exp_capa.qry_exp_itens_Imp.State in [dsEdit,dsInsert] then
            begin
              datm_exp_capa.qry_exp_itens_Imp.Post;
            end;
           end;
          end;
          datm_exp_capa.qry_exp_.Close;
          datm_exp_capa.qry_exp_.Open;
          datm_exp_capa.qry_exp_.Locate('NR_PROCESSO',str_nr_processo,[]);
          datm_exp_capa.qry_exp_.Edit;
          datm_exp_capa.qry_exp_CD_MOEDA.AsString := vMoeda;
          datm_exp_capa.qry_exp_QT_TOTAL_ITENS.AsString := FStrZero(IntToStr(vQtdItens), 3);
          datm_exp_capa.qry_exp_.Post;
        end;//end for

       if ( vcods <> '') then
        begin
          vcods := 'Mercadorias não encontradas no cadastro de mercadorias:'#13 + vcods;
          MessageDlg(vcods, mtError, [mbOk], 0);
          datm_main.db_broker.Rollback;
          datm_exp_capa.qry_exp_.Close;
          datm_exp_capa.qry_exp_.Open;
        end;
        btn_salvar.Enabled   := False;
        btn_cancelar.Enabled := False;

        if datm_main.db_broker.InTransaction then
          datm_main.db_broker.Commit;

        datm_exp_capa.qry_exp_.Edit;
        btn_salvarClick(btn_salvar);
      except
        on E: Exception do
        begin
          if datm_main.db_broker.InTransaction then
            datm_main.db_broker.Rollback;
          MessageDlg('Erro durante a operação:'#13 + E.Message, mtError, [mbOk], 0);
          datm_exp_capa.qry_exp_.Close;
          datm_exp_capa.qry_exp_.Open;
          //Break;
        end;//EXCEPTION
      end;//final try
    end;//final do if abrearquivo
   end
   else
   begin
    ShowMessage('Esse processo já possui itens integrados!');
   end;
end;

procedure Tfrm_exp_capa.AtualizaBotoesIntegracao;
begin

  if trim(str_nr_processo) <> '' then
  begin
    with TQuery.Create(Application) do
    begin
      DatabaseName := 'DBBROKER';
      {
      SQL.Clear;
      SQL.Add('SELECT CD_GRUPO FROM TEMPRESA_NAC (NOLOCK) WHERE CD_EMPRESA = :CD_EMPRESA');
      ParamByName('CD_EMPRESA').AsString := datm_exp_capa.qry_exp_CD_EXPORTADOR.AsString;
      Open;
      BtnImportaDados.Visible := Fields[0].AsString = '497'; //PPG
      Close;

      SQL.Clear;
      SQL.Add('SELECT COUNT(*)');
      SQL.Add('FROM TGRUPO G  (NOLOCK) INNER JOIN TEMPRESA_NAC E (NOLOCK) ON E.CD_GRUPO = G.CD_GRUPO');
      SQL.Add('WHERE E.CD_EMPRESA = :CD_EMPRESA AND G.NM_GRUPO LIKE ''%BASF%''');
      ParamByName('CD_EMPRESA').AsString := datm_exp_capa.qry_exp_CD_EXPORTADOR.AsString;
      Open;
      btnIntegraBasf.Visible := Fields[0].AsString <> '0'; // Basf
      btnIntegraBasf.Left := BtnImportaDados.Left;
      Close;

      SQL.Clear;
      SQL.Add('SELECT COUNT(*) FROM TEMPRESA_NAC (NOLOCK)');
      SQL.Add('WHERE CD_EMPRESA = :CD_EMPRESA AND CD_GRUPO = ''986''');
      ParamByName('CD_EMPRESA').AsString := datm_exp_capa.qry_exp_CD_EXPORTADOR.AsString;
      Open;
      btnIntegraJP.Visible := Fields[0].AsString <> '0'; // JP Morgan
      btnIntegraJP.Left := BtnImportaDados.Left;

      SQL.Clear;
      SQL.Add('SELECT COUNT(*) FROM TEMPRESA_NAC (NOLOCK) ');
      SQL.Add('WHERE CD_EMPRESA = :CD_EMPRESA AND CD_GRUPO = ''B35''');
      ParamByName('CD_EMPRESA').AsString := datm_exp_capa.qry_exp_CD_EXPORTADOR.AsString;
      Open;
      btnIntegraFesto.Visible := Fields[0].AsString <> '0'; // Festo
      btnIntegraFesto.Left := BtnImportaDados.Left;
      }

      SQL.Clear;
      SQL.Text := ' SELECT G.CD_GRUPO, NM_GRUPO                                      ' +slineBreak +
                  '   FROM TPROCESSO    P (NOLOCK)                                   ' +slineBreak +
                  '   JOIN TEMPRESA_NAC E (NOLOCK) ON E.CD_EMPRESA = P.CD_CLIENTE    ' +slineBreak +
                  '   JOIN TGRUPO       G (NOLOCK) ON G.CD_GRUPO = E.CD_GRUPO        ' +slineBreak +
                  '  WHERE P.NR_PROCESSO = :NR_PROCESSO                              ' +slineBreak ;
      ParamByName('NR_PROCESSO').AsString := str_nr_processo; //datm_exp_capa.qry_exp_NR_PROCESSO.AsString;
      Open;

     {Define variavel VGrupo}
      VGrupo := Fields[0].AsString;

      BtnImportaDados.Visible := Fields[0].AsString = '497'; //PPG

      btnIntegraFesto.Visible := Fields[0].AsString = 'B35'; // Festo
      btnIntegraFesto.Left    := BtnImportaDados.Left;

      btnIntegraJP.Visible    := Fields[0].AsString = '986'; // JP Morgan
      btnIntegraJP.Left       := BtnImportaDados.Left;

      btnIntegracaoPetronas.Visible  := Fields[0].AsString = 'C16'; // Petronas
      btnIntegracaoPetronas.Left     := BtnImportaDados.Left;


      btnIntegraBasf.Visible  := AnsiContainsStr(UpperCase(Fields[1].AsString), 'BASF'); // Basf
      btnIntegraBasf.Left     := BtnImportaDados.Left;

      if Fields[0].AsString = '155' then //nestle
      begin
        btnMarcacao.visible          := true;
        lblMarcacaoIng.caption       := 'Marcação dos Volumes Ingles';
        lblMarcacaoEsp.visible       := true;
        dbm_marc_volumes_esp.visible := true;
        btnVerificaDivergenciasLotes.visible := true;
      end
      else
      begin
        btnMarcacao.visible          := false;
        lblMarcacaoIng.caption       := 'Marcação dos Volumes';
        lblMarcacaoEsp.visible       := false;
        dbm_marc_volumes_esp.visible := false;
        btnVerificaDivergenciasLotes.visible :=false;
      end;

      frm_exp_capa.btnIntegraRAP.Visible   := (Fields[0].AsString  = '028') or (Fields[0].AsString  = '241') or (Fields[0].AsString  = '155');
      frm_exp_capa.btnEstornaRap.Visible   := (Fields[0].AsString  = '028') or (Fields[0].AsString  = '241') or (Fields[0].AsString  = '155');
      frm_exp_capa.btnIntegraDocto.Visible := (Fields[0].AsString  = '028') or (Fields[0].AsString  = '241') or (Fields[0].AsString  = '155');
      frm_exp_capa.btnEstornaDocto.Visible := (Fields[0].AsString  = '028') or (Fields[0].AsString  = '241') or (Fields[0].AsString  = '155');

      if Fields[0].AsString = '028' then begin
        frm_exp_capa.cbblogomarca.Visible := True;
        frm_exp_capa.lblLogo.Visible      := True;
      end
      else
      begin
        frm_exp_capa.cbblogomarca.Visible   := false;
        frm_exp_capa.cbblogomarca.ItemIndex := -1;
        frm_exp_capa.lblLogo.Visible        := false;
      end;


      Free;
    end;
  end;
end;

procedure Tfrm_exp_capa.btnCancelarEtapaClick(Sender: TObject);
begin
  try
   // qryFollowUpEtapa.Cancel;
    VerificaCamposTag(frm_exp_capa,[pnlEtapa],False);

    //ativa botões atraves dos direitos de usuário
    pnlEtapa.Visible := False;
    pnl_cadastro.Enabled := True;
    pgctrl_exp_capa.Enabled := True;
    menu_manut_cadastro.Items.Enabled := True;
    mi_incluir.Enabled := True;
    mi_salvar.Enabled := True;
    mi_cancelar.Enabled := True;
    mi_excluir.Enabled := True;
    mi_itens_exp.Enabled := True;
    mi_calcular.Enabled := True;
    mi_manut_proc.Enabled := True;
    mi_re.Enabled := True;
    mi_sair.Enabled := True;


    //dbgrdFup.Enabled := True;
    //btnIncluirEtapa.Enabled := True;
    //btnFollowupEtapa.Enabled := True;
  except
    Application.MessageBox('Falha ao tentar cancelar a edição dos dados!','Erro',0);
  end;
end;

procedure Tfrm_exp_capa.btnConsultaEtapaClick(Sender: TObject);
var
  I: string;
begin
  I := ConsultaLookUp('TPROCESSO', 'NR_PROCESSO',  '' + frm_exp.msk_cd_unid_neg.Text + '02' + mskedt_nr_processo.Text, 'CD_SERVICO');
  if Sender is TSpeedButton then
  begin
    edtCodigoEtapa.Text := ConsultaOnLineExSQL(
       'SELECT CD_ETAPA, NM_ETAPA ' +
       'FROM TETAPA (NOLOCK) ' +
       'WHERE (CD_UNID_NEG = ''' + frm_exp.msk_cd_unid_neg.Text + ''' OR CD_UNID_NEG IS NULL) ' +
       '  AND (CD_PRODUTO  = "02" OR CD_PRODUTO  IS NULL) ' +
       '  AND (IN_RETRABALHO = "1") ' +
       '  AND (CD_EVENTO  IN (SELECT SE.CD_EVENTO ' +
       '                      FROM TSERVICO_EVENTO_NOVO SE (NOLOCK), TEVENTO E (NOLOCK) '+
       '                      WHERE SE.CD_SERVICO = ''' + I + '''' +
       '                        AND SE.CD_EVENTO = E.CD_EVENTO ' +
       '                        AND ISNULL(E.IN_ATIVO, "1") = "1") ' +
       '       OR CD_EVENTO IS NULL)',
       'Status do Processo', ['CD_ETAPA', 'NM_ETAPA'], ['Código', 'Nome'], 'CD_ETAPA', nil);
  end;
  edtNomeEtapa.Text := ConsultaLookUPSQL(
     'SELECT CD_ETAPA, NM_ETAPA ' +
     'FROM TETAPA (NOLOCK) ' +
     'WHERE CD_ETAPA = ''' + edtCodigoEtapa.Text + ''' ' +
     '  AND (CD_UNID_NEG = ''' + frm_exp.msk_cd_unid_neg.Text + ''' OR CD_UNID_NEG IS NULL) '+
     '  AND (CD_PRODUTO  = "02" OR CD_PRODUTO  IS NULL) '+
     '  AND (IN_RETRABALHO = "1") ' +
     '  AND (CD_EVENTO  IN (SELECT SE.CD_EVENTO ' +
     '                      FROM TSERVICO_EVENTO SE (NOLOCK), TEVENTO E (NOLOCK) ' +
     '                      WHERE SE.CD_SERVICO = ''' + I + ''' ' +
     '                        AND SE.CD_EVENTO = E.CD_EVENTO ' +
     '                        AND ISNULL(E.IN_ATIVO, "1") = "1") ' +
     '       OR CD_EVENTO IS NULL)', 'NM_ETAPA');
end;


procedure Tfrm_exp_capa.btnSalvarEtapaClick(Sender: TObject);
var
  iCampos : integer;
begin

   ActiveControl := nil;
   If not ConsisteMotivo then
     Exit;

    // Verifica o número de itens no status e grava a partir do próximo.
    //                        Eric, 16:35h , 25/01/2012

    // Variável iDoc guarda se haverá ou não reemissão de documentos. Foi usada uma
    // variável para evitar que a pessoa clique em "Sim" na pergunta de reemisão e acabe
    // depois cancelando a operação, deixando gravada no banco de dados a reemissão.
    //
    //                      Eric     14:16h,         27/01/2012
    
   If iDoc then
      begin
        with TQuery.Create(application) do begin
                    Databasename := 'DBBROKER';
                    try
                      //   Query do 'Controle de Status do Processo' //
                      SQL.Clear;
                      SQL.Add('SELECT MAX(F.CD_FOLLOWUP_ETAPA)');
                      SQL.Add('FROM TFOLLOWUP_ETAPA F (NOLOCK)');
                      SQL.Add('WHERE F.NR_PROCESSO = '''+frm_exp.msk_cd_unid_neg.Text+'02' +  mskedt_nr_processo.Text + '''');
                      Open;
                      if Eof then
                        iCampos := 1
                      else
                        iCampos := Fields[0].AsInteger + 1;
                      Close;
                      datm_main.db_broker.StartTransaction;
                      SQL.Clear;
                      SQL.Add('INSERT INTO TFOLLOWUP_ETAPA (CD_FOLLOWUP_ETAPA, CD_ETAPA, DT_ALTERACAO, NR_PROCESSO, CD_UNID_NEG, CD_USUARIO, CD_PRODUTO)');
                      SQL.Add('VALUES ('+IntToStr(iCampos)+',''165'', GETDATE(),'''+frm_exp.msk_cd_unid_neg.Text+'02' + mskedt_nr_processo.Text+''','''+frm_exp.msk_cd_unid_neg.text+''','''+str_cd_usuario+''',''02'')');
                      ExecSQL;
                    except
                      if datm_main.db_broker.InTransaction then
                        datm_main.db_broker.Rollback;

                    end;
                      if datm_main.db_broker.InTransaction then
                        datm_main.db_broker.Commit;

                      Free; //libera da memória o TQuery               Eric, 09:11 27/01/2012
               end;
         end;

       with TQuery.Create(application) do begin
                    Databasename := 'DBBROKER';
        try
          // Query do 'Controle de Status do Processo' //
          SQL.Clear;
          SQL.Add('SELECT MAX(F.CD_FOLLOWUP_ETAPA)');
          SQL.Add('FROM TFOLLOWUP_ETAPA F (NOLOCK)');
          SQL.Add('WHERE F.NR_PROCESSO = '''+frm_exp.msk_cd_unid_neg.Text+'02' +  mskedt_nr_processo.Text + '''');
          Open;
          if Eof then
            iCampos := 1
          else
            iCampos := Fields[0].AsInteger + 1;
          Close;
          datm_main.db_broker.StartTransaction;
          SQL.Clear;
          SQL.Add('INSERT INTO TFOLLOWUP_ETAPA (CD_FOLLOWUP_ETAPA, CD_ETAPA, DT_ALTERACAO, NR_PROCESSO, CD_UNID_NEG, CD_USUARIO, CD_PRODUTO)');
          SQL.Add('VALUES ('+IntToStr(iCampos)+','''+edtCodigoEtapa.Text+''', GETDATE(),'''+frm_exp.msk_cd_unid_neg.Text+'02' + mskedt_nr_processo.Text+''','''+frm_exp.msk_cd_unid_neg.Text+''','''+str_cd_usuario+''',''02'')');
          ExecSQL;
          except
          If datm_main.db_broker.InTransaction then
             datm_main.db_broker.Rollback;
          end;

          If datm_main.db_broker.InTransaction then
             datm_main.db_broker.Commit;

          Free;

        end;

        with TQuery.Create(Application) do begin

           DatabaseName := 'DBBROKER';
           try
            //Inicia o processo de estorno da RAP
            //
            //exclui os itens
            datm_main.db_broker.StartTransaction;
            //
            SQL.Clear;
            SQL.Add('DELETE TPROCESSO_EXP_ITEM');
            SQL.Add('WHERE NR_PROCESSO = '''+datm_exp_capa.qry_exp_.FieldByName('NR_PROCESSO').AsString+'''');
            ExecSQL;
            //exclui os pedidos
            SQL.Clear;
            SQL.Add('DELETE TPROCESSO_EXP_PEDIDO');
            SQL.Add('WHERE NR_PROCESSO = '''+datm_exp_capa.qry_exp_.FieldByName('NR_PROCESSO').AsString+'''');
            ExecSQL;
            //retorna para o status de autorizado
            SQL.Clear;
            SQL.Add('UPDATE E SET CD_STATUS = ''2'', CD_USUARIO_FIM = NULL, DT_FINALIZADO = NULL');
            SQL.Add('FROM MYINDAIA.DBO.TRAP_EMBARQUE E (NOLOCK), MYINDAIA.DBO.TRAP R (NOLOCK)');
            SQL.Add('WHERE R.CD_RAP+R.CD_RAP_ANO+R.CD_GRUPO = E.CD_RAP+E.CD_RAP_ANO+E.CD_GRUPO');
            SQL.Add('  AND R.NR_PROCESSO = '''+datm_exp_capa.qry_exp_.FieldByName('NR_PROCESSO').AsString+'''');
            SQL.Add('  AND E.CD_EMBARQUE = ( SELECT MAX(CD_EMBARQUE) FROM MYINDAIA.DBO.TRAP_EMBARQUE WHERE CD_RAP+CD_RAP_ANO+CD_GRUPO = R.CD_RAP+R.CD_RAP_ANO+R.CD_GRUPO )');
            ExecSQL;
            //retira Evento 117 caso tenha sido preenchido
            SQL.Clear;
            SQL.Add('UPDATE TFOLLOWUP SET DT_REALIZACAO = NULL, CD_RESP_REALIZACAO = NULL WHERE CD_EVENTO = ''117'' AND NR_PROCESSO = '''+datm_exp_capa.qry_exp_.FieldByName('NR_PROCESSO').AsString+''' ');
            ExecSQL;
            SQL.Clear;
            SQL.Add('EXEC sp_atz_followup '''+datm_exp_capa.qry_exp_.FieldByName('NR_PROCESSO').AsString+''' ');
            ExecSQL;
            //retorna a rap para autorizada
            SQL.Clear;
            SQL.Add('UPDATE MYINDAIA.DBO.TRAP SET CD_STATUS = ''2'', NR_PROCESSO = NULL');
            SQL.Add('WHERE NR_PROCESSO = '''+datm_exp_capa.qry_exp_.FieldByName('NR_PROCESSO').AsString+'''');
            ExecSQL;
            except
              If datm_main.db_broker.InTransaction then
                 datm_main.db_broker.Rollback;
            end;
              If datm_main.db_broker.InTransaction then
                 datm_main.db_broker.Commit;
        end;
        pnlEtapa.Visible := False;
        edtCodigo.Clear;
        edtCodigoEtapa.Clear;
        pnlEtapa.Visible := False;
        pnl_cadastro.Enabled := True;
        pgctrl_exp_capa.Enabled := True;
        menu_manut_cadastro.Items.Enabled := True;
        mi_incluir.Enabled := True;
        mi_salvar.Enabled := True;
        mi_cancelar.Enabled := True;
        mi_excluir.Enabled := True;
        mi_itens_exp.Enabled := True;
        mi_calcular.Enabled := True;
        mi_manut_proc.Enabled := True;
        mi_re.Enabled := True;
        mi_sair.Enabled := True;
end;
//end;

procedure Tfrm_exp_capa.btnIntegraFestoClick(Sender: TObject);
type
  TREFestoItem = record                   // Tamanho  Início  Fim
    DocumentoFaturamento: String;         // 10       011     020
    ItemDocumentoFaturamento: Integer;    // 06       021     026
    NrDocumentoNovePosicoes: String;      // 09       027     035
    NrMaterial: String;                   // 18       036     053
    TextoMaterial: String;                // 40       054     093
    NrNCM: String;                        // 16       094     109
    Quantidade: Double;                   // 13       110     122
    UnidadeMedida: String;                // 03       123     125
    PrecoLiquidoDocumento: Double;        // 09,2     126     136
    ValorLiquidoItemFaturamento: Double;  // 11,2     137     149
    Moeda: String;                        // 03,2     150     154
    ValorLiquidoFrete: Double;            // 13,2     155     169
    PesoNeto: Double;                     // 10,3     170     182
    PesoBruto: Double;                    // 10,3     183     195
    Incoterms: String;                    // 03       196     198
    Pagador: String;                      // 10       199     208
    NomePagador: String;                  // 35       209     243
    Endereco: String;                     // 35       244     278
    Cidade: String;                       // 25       279     303
    SiglaPais: String;                    // 03       304     306
    NomePais: String;                     // 15       307     321
    MeioTransporte: String;               // 15       322     336
    PortoEmbarque: String;                // 30       337     366
    CNPF: String;                         // 16       367     382
    Acordo: String;
    Norma: String;
  end;

  TREFestoItens = array of TREFestoItem;

  TREFesto = record                       // Tamanho  Início  Fim
    NrProcesso: String;                   // 10       001     010
    NCM: String;
    QuantidadeTotal: Double;
    ValorTotal: Double;
    Moeda: String;
    FreteTotal: Double;
    PesoLiquidoTotal: Double;
    PesoBrutoTotal: Double;
    Incoterms: String;
    NR_RUC :String;
    Itens: TREFestoItens;
  end;

  TArquivoREFesto = array of TREFesto;

const
  CD_GRUPO = 'B35';
  CD_PAIS_ORIGEM = '155';

var
  ArquivoREFesto: TArquivoREFesto;
  MensagemErro: String;

  // LeArquivo -----------------------------------------------------------------
  function LeArquivo(AArquivo: String): Boolean;
  var
    Linha: array of String;
    SL: TStringList;
    I: Integer;
    NrProc: String;

    procedure QuebraLinha;
    var
      S: String;
      L: String;
      P: Integer;
    begin
      SetLength(Linha, 0);
      L := SL[I];
      while (L <> '') do
      begin
        P := Pos(#9, L);
        if P = 0 then
          P := Length(L) +1;
        S := Copy(L, 1, P -1);
        Delete(L, 1, P);

        SetLength(Linha, High(Linha) +2);
        Linha[High(Linha)] := S;
      end;
    end;

    function CopiaStr(AIndice: Integer): String;
    begin
      AIndice := AIndice -1;
      if AIndice > High(Linha) then
        Result := ''
      else
        Result := Trim(Linha[AIndice]);
    end;

    function CopiaInt(AIndice: Integer): Integer;
    begin
      Result := StrToInt(StringReplace(StringReplace(CopiaStr(AIndice), ',', '', [rfReplaceAll]), '.', '', [rfReplaceAll]));
    end;

    function CopiaDouble(AIndice: Integer): Double;
    begin
      Result := StrToFloat(StringReplace(StringReplace(CopiaStr(AIndice), ',', '', [rfReplaceAll]), '.', ',', [rfReplaceAll]));
    end;
  begin
    SetLength(ArquivoREFesto, 0);
    SL := TStringList.Create;
    try
      try
        SL.LoadFromFile(AArquivo);
        I := 0;
        while (I < SL.Count) do
        begin
          QuebraLinha;
          NrProc := CopiaStr(1);

          SetLength(ArquivoREFesto, High(ArquivoREFesto) +2);
          with ArquivoREFesto[High(ArquivoREFesto)] do
          begin
            NrProcesso       := NrProc;
            NCM              := CopiaStr(7);
            QuantidadeTotal  := 0;
            ValorTotal       := 0;
            Moeda            := CopiaStr(12);
            FreteTotal       := 0;
            PesoLiquidoTotal := 0;
            PesoBrutoTotal   := 0;
            Incoterms        := CopiaStr(16);
            NR_RUC           := CopiaStr(26);
            SetLength(Itens, 0);

            while (I < SL.Count) and SameText(NrProc, CopiaStr(1)) do
            begin
              QuebraLinha;
              SetLength(Itens, High(Itens) +2);

              with Itens[High(Itens)] do
              begin
                DocumentoFaturamento        := CopiaStr(2);
                ItemDocumentoFaturamento    := CopiaInt(3);
                NrDocumentoNovePosicoes     := CopiaStr(4);
                NrMaterial                  := CopiaStr(5);
                TextoMaterial               := CopiaStr(6);
                NrNCM                       := CopiaStr(7);
                Quantidade                  := CopiaDouble(8);
                UnidadeMedida               := CopiaStr(9);
                PrecoLiquidoDocumento       := CopiaDouble(10);
                ValorLiquidoItemFaturamento := CopiaDouble(11);
                Moeda                       := CopiaStr(12);
                ValorLiquidoFrete           := CopiaDouble(13);
                PesoNeto                    := CopiaDouble(14) / 1000;
                PesoBruto                   := CopiaDouble(15) / 1000;
                Incoterms                   := CopiaStr(16);
                Pagador                     := CopiaStr(17);
                NomePagador                 := CopiaStr(18);
                Endereco                    := CopiaStr(19);
                Cidade                      := CopiaStr(20);
                SiglaPais                   := CopiaStr(21);
                NomePais                    := CopiaStr(22);
                MeioTransporte              := CopiaStr(23);
                PortoEmbarque               := CopiaStr(24);
                CNPF                        := CopiaStr(25);

                // Inverter NCM, que vem com o destaque primeiro
                NrNCM := Copy(NrNCM, 3, 8) + Copy(NrNCM, 1, 2);

                QuantidadeTotal  := QuantidadeTotal + Quantidade;
                ValorTotal       := ValorTotal + ValorLiquidoItemFaturamento;
                FreteTotal       := FreteTotal + ValorLiquidoFrete;
                PesoLiquidoTotal := PesoLiquidoTotal + PesoNeto;
                PesoBrutoTotal   := PesoBrutoTotal + PesoBruto;
              end;

              Inc(I);
            end;
          end;
        end;
        Result := True;
      except
        on E: Exception do
        begin
          Result := False;
          MensagemErro := E.Message;
        end;
      end;
    finally
      FreeAndNil(SL);
    end;
  end;
  // LeArquivo -----------------------------------------------------------------

  // VerificaMercadorias -------------------------------------------------------
  function VerificaMercadorias: Boolean;
  const
    CD_FABR_EXPO = '0';
    CD_TIPO_CALCULO = '1';
    CD_FINALIDADE_MERC = '';
  var
    NrAnexo, S: String;
    P, I: Integer;
  begin
    try
      for P := 0 to High(ArquivoREFesto) do
        with ArquivoREFesto[P] do
          for I := 0 to High(Itens) do
            with Itens[I] do
              if Trim(ConsultaLookUP('TMERCADORIA_EXP', 'CD_MERCADORIA', NrMaterial, 'CD_MERCADORIA')) = '' then
                FastExecSQL('INSERT INTO TMERCADORIA_EXP(CD_MERCADORIA, NM_MERCADORIA, AP_MERCADORIA, CD_UN_MED_COMERC, CD_NCM_SH, CD_SULF_NCM, CD_PAIS_AQUISICAO, ' +
                                                        'CD_PAIS_ORIGEM, CD_GRUPO, CD_FABR_EXPO, CD_TIPO_CALCULO, CD_FINALIDADE_MERC, CD_USUARIO_CRIACAO, DT_CRIACAO, IN_ATIVO) ' +
                            'VALUES(:CD_MERCADORIA, :NM_MERCADORIA, LEFT(:AP_MERCADORIA, 40), :CD_UN_MED_COMERC, :CD_NCM_SH, RIGHT(:CD_SULF_NCM, 2), :CD_PAIS_AQUISICAO, ' +
                                   ':CD_PAIS_ORIGEM, :CD_GRUPO, :CD_FABR_EXPO, :CD_TIPO_CALCULO, :CD_FINALIDADE_MERC, :CD_USUARIO_CRIACAO, GETDATE(), :IN_ATIVO)',
                   [NrMaterial, TextoMaterial, TextoMaterial, UnidadeMedida, NrNCM, NrNCM, SiglaPais, CD_PAIS_ORIGEM, CD_GRUPO, CD_FABR_EXPO, CD_TIPO_CALCULO, CD_FINALIDADE_MERC, '0707', '1']);
      Result := True;
    except
      on E: Exception do
      begin
        Result := False;
        MensagemErro := E.Message;
      end;
    end;
  end;
  // VerificaMercadorias -------------------------------------------------------

  // VerificaAcordosNormas -----------------------------------------------------
  function VerificaAcordosNormas: Boolean;
  var
    CodPais, Pais: String;
    P, I: Integer;
  begin
    with TQuery.Create(nil) do
      try
        try
          if not datm_exp_capa.qry_exp_itens_Imp.Active then
          begin
            datm_exp_capa.qry_exp_itens_Imp.ParamByName('NR_PROCESSO').AsString := datm_exp_capa.qry_exp_NR_PROCESSO.AsString;
            datm_exp_capa.qry_exp_itens_Imp.Open;
          end;
          DatabaseName := 'DBBROKER';
          Pais := '';
          for P := 0 to High(ArquivoREFEsto) do
            for I := 0 to High(ArquivoREFEsto[P].Itens) do
              with ArquivoREFEsto[P].Itens[I] do
              begin
                if not SameText(SiglaPais, Pais) then
                begin
                  Pais := SiglaPais;
                  SQL.Clear;
                  SQL.Add('SELECT CD_PAIS');
                  SQL.Add('FROM TPAIS_BROKER (nolock) ');
                  SQL.Add('WHERE NM_SIGLA_2L = :NM_SIGLA');
                  ParamByName('NM_SIGLA').AsString := Pais;
                  Open;
                  CodPais := Trim(FieldByName('CD_PAIS').AsString);
                  Close;
                  if CodPais = '' then
                  begin
                    MessageDlg('País não encontrado para a sigla ' + Pais + '.', mtInformation, [mbOk], 0);
                    Exit;
                  end;
                  SQL.Clear;
                  SQL.Add('SELECT COUNT(*) AS QTD');
                  SQL.Add('FROM TCONFIG_PAIS_ACORDO_NORMA_PADRAO (NOLOCK)');
                  SQL.Add('WHERE CD_PAIS = :CD_PAIS');
                  ParamByName('CD_PAIS').AsString := CodPais;
                  Open;
                  Result := FieldByName('QTD').AsInteger > 0;
                  Close;
                  if not Result then
                  begin
                    MessageDlg('Não há Acordo e Norma para o país ' + CodPais + '.', mtInformation, [mbOk], 0);
                    Exit;
                  end;
                end;

                //CodPais := Pais;

                // Insere Acordos
                datm_exp_capa.qry_acordos_normas.Close;
                datm_exp_capa.qry_acordos_normas.ParamByName('CD_PAIS').AsString := CodPais;
                datm_exp_capa.qry_acordos_normas.Open;
                datm_exp_capa.qry_acordos_normas.First;

                if (datm_exp_capa.qry_acordos_normas.RecordCount > 1 ) then
                begin
                  frmExpIntegraRAP_Normas := TfrmExpIntegraRAP_Normas.Create(nil);
                  frmExpIntegraRAP_Normas.qry_acordos_normas_geral.Close;
                  frmExpIntegraRAP_Normas.qry_acordos_normas_geral.ParamByName('CD_MERCADORIA').AsString := NrMaterial;
                  frmExpIntegraRAP_Normas.qry_acordos_normas_geral.Open;

                  frmExpIntegraRAP_Normas.edt_cd_mercadoria.Text        :=  NrMaterial;
                  frmExpIntegraRAP_Normas.lbl_mercadoria.Caption        :=  TextoMaterial;
                  frmExpIntegraRAP_Normas.lbl_mercadoria_idioma.Caption := '  ' + '';
                  frmExpIntegraRAP_Normas.lProcessando.Caption := NrMaterial;
                  frmExpIntegraRAP_Normas.DBGrid1.DataSource := datm_exp_capa.ds_acordos_normas;
                  frmExpIntegraRAP_Normas.ShowModal;
                  FreeAndNil(frmExpIntegraRAP_Normas);
                end;

                SQL.Clear;
                SQL.Add('INSERT INTO TMERC_EXP_ACORDO(CD_MERCADORIA, CD_ACORDO, CD_NORMA, TX_MERCADORIA)');
                SQL.Add('SELECT TOP 1 :CD_MERCADORIA, CD_ACORDO, CD_NORMA, :TX_MERCADORIA');
                SQL.Add('FROM TCONFIG_PAIS_ACORDO_NORMA_PADRAO CP (NOLOCK)');
                SQL.Add('WHERE CD_PAIS   = :CD_PAIS');
                SQL.Add('  AND CD_ACORDO = :CD_ACORDO');
                SQL.Add('  AND CD_NORMA  = :CD_NORMA');
                SQL.Add('  AND CD_ACORDO + CD_NORMA NOT IN (SELECT CD_ACORDO + CD_NORMA FROM TMERC_EXP_ACORDO (NOLOCK) WHERE CD_MERCADORIA = :CD_MERCADORIA)');
                ParamByName('CD_MERCADORIA').AsString := NrMaterial;
                ParamByName('TX_MERCADORIA').AsString := TextoMaterial;
                ParamByName('CD_PAIS').AsString       := CodPais;
                ParamByName('CD_ACORDO').AsString     := datm_exp_capa.qry_acordos_normasCD_ACORDO.AsString;
                ParamByName('CD_NORMA').AsString      := datm_exp_capa.qry_acordos_normasCD_NORMA.AsString;
                ExecSQL;

                Acordo := datm_exp_capa.qry_acordos_normasCD_ACORDO.AsString;
                Norma  := datm_exp_capa.qry_acordos_normasCD_NORMA.AsString;
              end;
        except
          on E: Exception do
          begin
            Result := False;
            MensagemErro := E.Message;
          end;
        end;
      finally
        Free;
      end;
  end;
  // VerificaAcordosNormas -----------------------------------------------------

  // GetMoeda ------------------------------------------------------------------
  function GetMoeda(ASigla: String): String;
  begin
    Result := ConsultaLookUPSQL('SELECT TOP 1 CD_MOEDA ' +
                                'FROM TMOEDAS_ISO  (nolock) ' +
                                'WHERE CD_SIGLA = :CD_SIGLA ' +
                                'ORDER BY CD_MOEDA', 'CD_MOEDA', [ASigla]);
  end;
  // GetMoeda ------------------------------------------------------------------

  // GetUnidadeMedida ----------------------------------------------------------
  function GetUnidadeMedida(ASigla: String): String;
  begin
    Result := ConsultaLookUPSQL('SELECT TOP 1 CD_UNID_MEDIDA ' +
                                'FROM TUNID_MEDIDA_BROKER (nolock) ' +
                                'WHERE NM_SIGLA = :NM_SIGLA ' +
                                'ORDER BY CD_UNID_MEDIDA', 'CD_UNID_MEDIDA', [ASigla]);
  end;
  // GetUnidadeMedida ----------------------------------------------------------

  // GetPagador ----------------------------------------------------------------
  function GetPagador(ANome, AEndereco: String): String;
  begin
    Result := ConsultaLookUPSQL('SELECT TOP 1 CD_EMPRESA ' +
                                'FROM TEMPRESA_EST (nolock) ' +
                                'WHERE NM_EMPRESA = :NM_EMPRESA ' +
                                '  AND IN_ATIVO = :IN_ATIVO ' +
                                'ORDER BY CD_EMPRESA', 'CD_EMPRESA', [ANome, '1']);
    if Result = '' then
    begin
      Result := ConsultaLookUPSQL('SELECT MAX(CD_EMPRESA) +1 AS CD_EMPRESA FROM TEMPRESA_EST', 'CD_EMPRESA');
      FastExecSQL('INSERT INTO TEMPRESA_EST(CD_EMPRESA, AP_EMPRESA, NM_EMPRESA, END_EMPRESA) ' +
                  ' VALUES(:CD_EMPRESA, :AP_EMPRESA, :NM_EMPRESA, :END_EMPRESA)',
         [Result, Copy(ANome, 1, 10), ANome, AEndereco]);
      FastExecSQL('INSERT INTO TEMPRESA_EST_GRUPO(CD_EMPRESA, CD_GRUPO) ' +
                  ' VALUES(:CD_EMPRESA, :CD_GRUPO)', [Result, CD_GRUPO]);
    end;
  end;
  // GetPagador ----------------------------------------------------------------

  // GetPais -------------------------------------------------------------------
  function GetPais(ASigla: String): String;
  begin
    Result := ConsultaLookUPSQL('SELECT CD_PAIS ' +
                                'FROM TPAIS_BROKER  (nolock) ' +
                                'WHERE NM_SIGLA_2L = :NM_SIGLA_2L', 'CD_PAIS', [ASigla]);
  end;
  // GetPais -------------------------------------------------------------------

  // GetLinguaPais -------------------------------------------------------------
  function GetLinguaPais(ACodPais: String): String;
  begin
    Result := ConsultaLookUPSQL('SELECT CD_IDIOMA_PADRAO ' +
                                'FROM TPAIS  (nolock) ' +
                                'WHERE CODIGO = :CODIGO', 'CD_IDIOMA_PADRAO', [ACodPais]);
  end;
  // GetLinguaPais -------------------------------------------------------------

  // GetViaTransporte ----------------------------------------------------------
  function GetViaTransporte: String;
  begin
    Result := ConsultaLookUPSQL('SELECT CD_VIA_TRANSPORTE ' +
                                'FROM TPROCESSO TP (nolock) ' +
                                '   INNER JOIN VW_SERVICO_GERAL S ON S.CD_SERVICO = TP.CD_SERVICO ' +
                                'WHERE NR_PROCESSO = :NR_PROCESSO', 'CD_VIA_TRANSPORTE', [str_nr_processo]);
  end;
  // GetViaTransporte ----------------------------------------------------------

  // Integrar Dados ------------------------------------------------------------
  function IntegrarDados: Boolean;
  var
    P, I: Integer;
    NrItem: Integer;
  begin
    NrItem := 0;
    try
      for P := 0 to High(ArquivoREFEsto) do
        with ArquivoREFEsto[P] do
        begin

          if not datm_exp_capa.qry_exp_ped_.Active then
          begin
            datm_exp_capa.qry_exp_ped_.ParamByName('NR_PROCESSO').AsString := datm_exp_capa.qry_exp_NR_PROCESSO.AsString;
            datm_exp_capa.qry_exp_ped_.Open;
          end;

          if datm_exp_capa.qry_exp_ped_.Locate('NR_PEDIDO', NrProcesso, [loCaseInsensitive]) then
            datm_exp_capa.qry_exp_ped_.Edit
          else
            datm_exp_capa.qry_exp_ped_.Insert;

          datm_exp_capa.qry_exp_ped_NR_PROCESSO.AsString        := datm_exp_capa.qry_exp_NR_PROCESSO.AsString;
          datm_exp_capa.qry_exp_ped_NR_PEDIDO.AsString          := NrProcesso;
          datm_exp_capa.qry_exp_ped_NR_FATURA.AsString          := NrProcesso;
          datm_exp_capa.qry_exp_ped_TX_MARCACAO_VOLUME.AsString := '';
          datm_exp_capa.qry_exp_ped_TX_INF_EMBALAGEM.AsString   := '';
          datm_exp_capa.qry_exp_ped_TX_MERCADORIA.AsString      := '';
          datm_exp_capa.qry_exp_ped_VL_DESCONTO.AsFloat         := 0;
          datm_exp_capa.qry_exp_ped_VL_FRETE.AsFloat            := FreteTotal;
          datm_exp_capa.qry_exp_ped_VL_SEGURO.AsFloat           := 0;
          datm_exp_capa.qry_exp_ped_VL_PESO_LIQUIDO.AsFloat     := PesoLiquidoTotal;
          datm_exp_capa.qry_exp_ped_VL_PESO_BRUTO.AsFloat       := PesoBrutoTotal;
          datm_exp_capa.qry_exp_ped_VL_CUBAGEM.AsFloat          := 0;
          datm_exp_capa.qry_exp_ped_.Post;

          begin
            datm_exp_capa.qry_exp_.Edit;
            datm_exp_capa.qry_exp_NR_FATURA.AsString         := NrProcesso;
            datm_exp_capa.qry_exp_CD_URF_DESPACHO.AsString   := '';
            datm_exp_capa.qry_exp_CD_URF_DESTINO.AsString    := '';
            datm_exp_capa.qry_exp_CD_PAIS_DESTINO.AsString   := GetPais(Itens[0].SiglaPais);
            datm_exp_capa.qry_exp_CD_INST_NEGOC.AsString     := '';
            datm_exp_capa.qry_exp_CD_INCOTERM.AsString       := Incoterms;
            datm_exp_capa.qry_exp_CD_VIA_TRANSPORTE.AsString := GetViaTransporte;
            datm_exp_capa.qry_exp_CD_MOEDA.AsString          := GetMoeda(Moeda);
            datm_exp_capa.qry_exp_CD_PAIS_ORIGEM.AsString    := CD_PAIS_ORIGEM;
            datm_exp_capa.qry_exp_VL_FRETE.AsFloat           := FreteTotal;
            datm_exp_capa.qry_exp_VL_SEGURO.AsFloat          := 0;
            datm_exp_capa.qry_exp_VL_PESO_LIQUIDO.AsFloat    := PesoLiquidoTotal;
            datm_exp_capa.qry_exp_VL_PESO_BRUTO.AsFloat      := PesoBrutoTotal;
            datm_exp_capa.qry_exp_CD_LINGUA_PEDIDO.AsString  := GetLinguaPais(datm_exp_capa.qry_exp_CD_PAIS_DESTINO.AsString);
            datm_exp_capa.qry_exp_CD_MOEDA.AsString          := GetMoeda(Moeda);
            datm_exp_capa.qry_exp_QT_TOTAL_ITENS.AsString    := FormatFloat('000', High(Itens) +1);
            datm_exp_capa.qry_exp_.Post;
          end;

          for I := 0 to High(Itens) do
            with Itens[I] do
            begin
              if not datm_exp_capa.qry_exp_itens_Imp.Active then
              begin
                datm_exp_capa.qry_exp_itens_Imp.ParamByName('NR_PROCESSO').AsString := datm_exp_capa.qry_exp_NR_PROCESSO.AsString;
                datm_exp_capa.qry_exp_itens_Imp.Open;
              end;
              Inc(NrItem);
              datm_exp_capa.qry_exp_itens_Imp.Insert;
              datm_exp_capa.qry_exp_itens_Imp.FieldByName('NR_PROCESSO').AsString       := datm_exp_capa.qry_exp_NR_PROCESSO.AsString;
              datm_exp_capa.qry_exp_itens_Imp.FieldByName('CD_MERCADORIA').AsString     := NrMaterial;
              datm_exp_capa.qry_exp_itens_Imp.FieldByName('NR_ITEM').AsString           := FormataFloat('000', NrItem);
              datm_exp_capa.qry_exp_itens_Imp.FieldByName('NR_ITEM_PE').AsString        := FormataFloat('000000', ItemDocumentoFaturamento);
              datm_exp_capa.qry_exp_itens_Imp.FieldByName('NR_PEDIDO').AsString         := NrProcesso;
              datm_exp_capa.qry_exp_itens_Imp.FieldByName('QT_MERCADORIA').AsFloat      := Quantidade;
              datm_exp_capa.qry_exp_itens_Imp.FieldByName('VL_MCV').AsFloat             := ValorLiquidoItemFaturamento;
              datm_exp_capa.qry_exp_itens_Imp.FieldByName('VL_MLE').AsFloat             := ValorLiquidoItemFaturamento;

              datm_exp_capa.qry_exp_itens_Imp.FieldByName('CD_UNID_MEDIDA').AsString    := GetUnidadeMedida(UnidadeMedida);
              datm_exp_capa.qry_exp_itens_Imp.FieldByName('VL_PESO_LIQ_UNIT').AsFloat   := RoundTo(PesoNeto / Quantidade, 4);
              datm_exp_capa.qry_exp_itens_Imp.FieldByName('VL_TOT_PESO_LIQ').AsFloat    := PesoNeto;
              datm_exp_capa.qry_exp_itens_Imp.FieldByName('VL_TOT_PESO_BRUTO').AsFloat  := PesoBruto;
              datm_exp_capa.qry_exp_itens_Imp.FieldByName('VL_TOT_ITEM').AsFloat        := ValorLiquidoItemFaturamento;
              datm_exp_capa.qry_exp_itens_Imp.FieldByName('VL_UNITARIO').AsFloat        := RoundTo(ValorLiquidoItemFaturamento / Quantidade, 2);
              datm_exp_capa.qry_exp_itens_Imp.FieldByName('NR_PEDIDO').AsString         := NrProcesso;
              datm_exp_capa.qry_exp_itens_Imp.FieldByName('CD_SULF_NCM').AsString       := Copy(NrNCM, 8, 2);
              datm_exp_capa.qry_exp_itens_Imp.FieldByName('CD_NCM').AsString            := Copy(NrNCM, 1, 8);
              datm_exp_capa.qry_exp_itens_Imp.FieldByName('CD_NALADI_SH').AsString      := '';

              // Mercadoria x Acordo
              datm_exp_capa.qry_merc_acordo_norma_.Close;
              datm_exp_capa.qry_merc_acordo_norma_.ParamByName('CD_PAIS').AsString       := datm_exp_capa.qry_exp_.FieldByName('CD_PAIS_DESTINO').AsString;
              datm_exp_capa.qry_merc_acordo_norma_.ParamByName('CD_MERCADORIA').AsString := datm_exp_capa.qry_exp_itens_Imp.FieldByName('CD_MERCADORIA').AsString;
              datm_exp_capa.qry_merc_acordo_norma_.Open;

              if datm_exp_capa.qry_merc_acordo_norma_CD_MERCADORIA.AsString <> '' then
              begin
                datm_exp_capa.qry_exp_itens_Imp.FieldByName('CD_NCM_DOC').AsString         := NrNCM;
                datm_exp_capa.qry_exp_itens_Imp.FieldByName('CD_NALADI_SH').AsString       := '';
                datm_exp_capa.qry_exp_itens_Imp.FieldByName('CD_NALADI_DOC').AsString      := datm_exp_capa.qry_merc_acordo_norma_CD_NALADI_SH_DOC.AsString;
                datm_exp_capa.qry_exp_itens_Imp.FieldByName('NR_SEQ_NALADI_DOC').AsInteger := datm_exp_capa.qry_merc_acordo_norma_NR_SEQ_NALADI.AsInteger;
                datm_exp_capa.qry_exp_itens_Imp.FieldByName('CD_ACORDO').AsString          := datm_exp_capa.qry_merc_acordo_norma_CD_ACORDO.AsString;
                datm_exp_capa.qry_exp_itens_Imp.FieldByName('CD_NORMAS').AsString          := datm_exp_capa.qry_merc_acordo_norma_CD_NORMA.AsString;
                datm_exp_capa.qry_exp_itens_Imp.FieldByName('TX_MERCADORIA').AsString      := datm_exp_capa.qry_merc_acordo_norma_TX_MERCADORIA.AsString;
              end
              else
              begin
                datm_exp_capa.qry_exp_itens_Imp.FieldByName('CD_NCM_DOC').AsString         := '';
                datm_exp_capa.qry_exp_itens_Imp.FieldByName('CD_ACORDO').AsString          := Acordo;
                datm_exp_capa.qry_exp_itens_Imp.FieldByName('CD_NORMAS').AsString          := Norma;
                datm_exp_capa.qry_exp_itens_Imp.FieldByName('TX_MERCADORIA').AsString      := TextoMaterial;
              end;
              datm_exp_capa.qry_exp_itens_Imp.FieldByName('CD_PAIS_ORIGEM').AsString       := GetPais(SiglaPais);
              datm_exp_capa.qry_exp_itens_Imp.Post;
            end;

            if Trim(NR_RUC) <> '' then
            begin
              datm_exp_capa.qryUpdateProcesso.close;
              datm_exp_capa.qryUpdateProcesso.ParamByName('CD_RUC').AsString      := NR_RUC;
              datm_exp_capa.qryUpdateProcesso.ParamByName('NR_PROCESSO').AsString := datm_exp_capa.qry_exp_NR_PROCESSO.AsString;
              datm_exp_capa.qryUpdateProcesso.execSql;
            end;
        end;
      datm_exp_capa.qry_exp_.Close;
      datm_exp_capa.qry_exp_.Open;
      datm_exp_capa.qry_exp_.Locate('NR_PROCESSO', str_nr_processo, []);

      Result := True;
    except
      on E: Exception do
      begin
        MensagemErro := E.Message;
        Result := False;
      end;
    end;
    //datm_exp_capa.qry_exp_.Edit;
    //datm_exp_capa.qry_exp_.Post;
  end;
  // Integrar Dados ------------------------------------------------------------
begin
  if OpenDlg.Execute then
  begin
    if not LeArquivo(OpenDlg.FileName) then
      MessageDlg('Erro lendo arquivo.'#13 + MensagemErro, mtError, [mbOk], 0)
    else
    if not VerificaMercadorias then
      MessageDlg('Erro cadastrando mercadorias.'#13 + MensagemErro, mtError, [mbOk], 0)
    else
    if not VerificaAcordosNormas then
      MessageDlg('Erro cadastrando acordos e normas.'#13 + MensagemErro, mtError, [mbOk], 0)
    else
    begin
      datm_main.db_broker.StartTransaction;
      if IntegrarDados then
      begin
        try
          datm_main.db_broker.Commit;
          ShowMessage('Integrado com sucesso.');
        except
          on E: Exception do
          begin
            if datm_main.db_broker.InTransaction then
              datm_main.db_broker.Rollback;
            MessageDlg('Erro concluindo integração.'#13 + E.Message, mtError, [mbOk], 0);
          end;
        end;
      end
      else
      begin
        if datm_main.db_broker.InTransaction then
          datm_main.db_broker.Rollback;
        MessageDlg('Erro durante a integração.'#13 + MensagemErro, mtError, [mbOk], 0);
      end;
    end;
    btn_salvar.Enabled   := False;
    mi_salvar.Enabled    := False;
    btn_cancelar.Enabled := False;
    mi_cancelar.Enabled  := False;
    btn_excluir.Enabled  := True;
    mi_excluir.Enabled   := True;
    btn_itens_exp.Enabled:= True;
    mi_itens_exp.Enabled := True;

    datm_exp_capa.qry_exp_itens_.Close;
    datm_exp_capa.qry_exp_itens_.ParamByName('NR_PROCESSO').AsString := datm_exp_capa.qry_exp_NR_PROCESSO.AsString;
    datm_exp_capa.qry_exp_itens_.Open;

    btn_calculo.Enabled := not datm_exp_capa.qry_exp_itens_.Eof;
    datm_exp_capa.qry_exp_itens_.Close;
  end;
end;

procedure Tfrm_exp_capa.dbcbContainerKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if key = VK_CONTROL THEN
  begin
    if not (datm_exp_capa.qry_exp_ped_.state in [dsEdit,dsInsert]) then
      datm_exp_capa.qry_exp_ped_.edit;

    datm_exp_capa.qry_exp_ped_NR_CNTR.value := '';
  end;
end;

procedure Tfrm_exp_capa.btnMarcacaoClick(Sender: TObject);
var Tx_MarcacaoIng, Tx_MarcacaoEsp :String;
begin
  Tx_MarcacaoIng := CarregaMarcacaoNestle(datm_exp_capa.qry_exp_NR_PROCESSO.asString, 'ING');
  Tx_MarcacaoEsp := CarregaMarcacaoNestle(datm_exp_capa.qry_exp_NR_PROCESSO.asString, 'ESP');

  If not (datm_exp_capa.qry_exp_.State in [dsEdit,dsInsert]) then
    datm_exp_capa.qry_exp_.edit;

  datm_exp_capa.qry_exp_TX_MARCACAO_VOLUME.asString     := Tx_MarcacaoIng;
  datm_exp_capa.qry_exp_TX_MARCACAO_VOLUME_ESP.asString := Tx_MarcacaoEsp;
end;

function Tfrm_exp_capa.CarregaMarcacaoNestle(nr_processo, idioma: string) : String;
begin
    Result := ConsultaLookUPSQL(
    '  SELECT DBO.FN_MARCACAO_NESTLE(:NR_PROCESSO, '''+idioma+''') AS TX_MARCACAO_VOLUME ' ,
    'TX_MARCACAO_VOLUME', [nr_processo]);
end;

procedure Tfrm_exp_capa.btnVerificaDivergenciasLotesClick(Sender: TObject);
var
  Form: TfmConsulta;
begin
  Form := TfmConsulta.Create(nil);
  try
    Form.TituloRelatorio := 'Divergências - Lotes';
    Form.Titulocoluna.Add('NR_PROCESSO=Nr. Processo');
    Form.Titulocoluna.Add('NR_FORNECIMENTO=Nr. Fornecimento');
    Form.Titulocoluna.Add('CD_MERCADORIA=Cod. Mercadoria');
    Form.Titulocoluna.Add('DS_MERCADORIA=Desc. Mercadoria');
    Form.Titulocoluna.Add('QT_MERCADORIA_PEDIDO=Qt. Mercadoria Pedido');
    Form.Titulocoluna.Add('QT_MERCADORIA_LOTE=Qt. Mercadoria Lote');

    Form.qryMain.SQL.Text :=
     ' SELECT NR_PROCESSO, NR_FORNECIMENTO,            '+
     '        CD_MERCADORIA, DS_MERCADORIA,            '+
     '        QT_MERCADORIA_PEDIDO, QT_MERCADORIA_LOTE '+
     '   FROM FN_DIVERGENCIAS_LOTES_RAP('+QuotedStr(vGrupo)+', '+QuotedStr(datm_exp_capa.qry_exp_NR_PROCESSO.AsString)+', '''' )';

    Form.Executa;
  finally
    Form.Free;
  end;
end;

procedure Tfrm_exp_capa.btnIntegracaoPetronasClick(Sender: TObject);
begin
  try
    frmImportarPlanilhaPetronasExp := tfrmImportarPlanilhaPetronasExp.Create(nil);
    frmImportarPlanilhaPetronasExp.lblNrProcesso.caption :=  str_nr_processo;
    frmImportarPlanilhaPetronasExp.lblGrupo.caption      :=  'C16';
    frmImportarPlanilhaPetronasExp.ShowModal;
  finally
    FreeAndNil(frmImportarPlanilhaPetronasExp);
  end;
end;

end.
