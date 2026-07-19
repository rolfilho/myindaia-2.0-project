 (*************************************************************************************************
Sistema: DD Broker - Indaiá Logística
PROGRAMA: PGGP018.PAS - frm_manut_proc - Manutenção de Processos
DATA: 09/10/2001
Manutenção:
*************************************************************************************************)
unit PGGP018;


interface

uses                                                                                                                     
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Buttons, ExtCtrls, Db, DBTables, Grids, DBGrids, Menus, StdCtrls, DBCtrls,
  Mask, ComCtrls, DBCGrids, ToolEdit, RXDBCtrl, Variants, Funcoes, ConsOnLineEx,
  RxDBComb, IBDatabase, IBCustomDataSet, IBQuery, IniFiles, ByHLLAPI, cxSpinEdit,
  cxTimeEdit, cxControls, cxContainer, cxEdit, cxTextEdit, cxMaskEdit, cxDropDownEdit,
  cxCalendar, cxDBEdit, ShellCtrls, ShellAPI, ServicoNovo, FormsLog, uWebModulo,
  cxGraphics, cxLookAndFeels, cxLookAndFeelPainters, dxSkinsCore, dxSkinsDefaultPainters,
  cxStyles, dxSkinscxPCPainter, cxCustomData, cxFilter, cxData,
  cxDataStorage, cxDBData, cxGridCustomTableView, cxGridTableView,
  cxGridDBTableView, cxGridLevel, cxClasses, cxGridCustomView, cxGrid, ClipBrd,
  cxDBLookupComboBox, cxLookupEdit, cxDBLookupEdit, dxGDIPlusClasses; // Este sempre depois das uses Forms e Classes - Michel - 22/03/2013;

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
  TReferencia = record
    CD_REFERENCIA     : string;
    NR_ITEM_PO        : string;
    NR_PARCIAL        : Integer;
  end;

  //Record que guarda os valores da RE
  TREItem = record
   NrItem: Integer;
   TxMercadoria: String;
   VlCondVenda: Double;
   VlLocalEmbarque: Double;
   QtUnComercial: Double;
   TxUnComercial: String;
   QtUnEstatistica : Double;
   TxUnEstatistica: String;
   QtPesoLiquido: Double;
  end;

  TREItens = array of TREItem;

  TRECapa = record
    NrProcesso: String;
    NrRE: String;
    NrNCM: String;
    TxEnquadramento: String;
    Itens: TREItens;
  end;

  TRE = array of TRECapa;

type
 TMyGrid = class(TDBGrid);

 type
   THintLI = class(THintWindow)
   public
       procedure doActivateHint(Sender: TObject);
end;

type
  Tfrm_manut_proc = class(TForm)
    pgctrl_manut_proc: TPageControl;

    ts_lista: TTabSheet;
    ts_imp_mar: TTabSheet;
    ts_exp_mar: TTabSheet;
    ts_ref: TTabSheet;
    pnl_manut_proc: TPanel;
    btn_sair: TSpeedButton;
    btn_salvar: TSpeedButton;
    btn_cancelar: TSpeedButton;
    dbnvg: TDBNavigator;
    Label62: TLabel;
    dbedt_dt_est: TDBEdit;
    dbg_normal: TDBGrid;
    ts_embalagem: TTabSheet;
    dbgrd_proc_embalagem: TDBGrid;
    Label112: TLabel;
    dbedt_nr_processo3: TDBEdit;
    pnl_proc_embalagem: TPanel;
    dbedt_nm_embalagem: TEdit;
    lbl_embalagem: TLabel;
    dbedt_cd_embalagem: TDBEdit;
    btn_co_embalagem: TSpeedButton;
    lbl_qt_embalagem: TLabel;
    dbedt_qt_embalagem: TDBEdit;
    dbedt_pb_embalagem: TDBEdit;
    lbl_pb_embalagem: TLabel;
    btn_incluir: TSpeedButton;
    btn_excluir: TSpeedButton;
    Label63: TLabel;
    dbedt_nr_dde_em: TDBEdit;
    dbg_re_em: TDBCtrlGrid;
    Label65: TLabel;
    dbedt_nr_re_em: TDBEdit;
    Label96: TLabel;
    dbchkbox_re_ativo_em: TDBCheckBox;
    ts_obs: TTabSheet;
    btn_proc_realiza: TSpeedButton;
    Label132: TLabel;
    dbedt_nr_proc_temp_em: TDBEdit;
    Label133: TLabel;
    dbedt_dt_venc_proc_exp_temp_em: TDBEdit;
    Label134: TLabel;
    dbedt_nr_di_retorno_em: TDBEdit;
    ts_nf: TTabSheet;
    Label148: TLabel;
    dbtxt_qt_tot_embalagem: TDBText;
    dbtxt_pb_tot_embalagem: TDBText;
    ts_despacho_exp: TTabSheet;
    pgctrl_despacho_exp: TPageControl;
    Label174: TLabel;
    dbedt_nr_dde: TDBEdit;
    menu_cadastro: TMainMenu;
    mi_incluir: TMenuItem;
    mi_salvar: TMenuItem;
    mi_cancelar: TMenuItem;
    mi_excluir: TMenuItem;
    mi_proc_realiza: TMenuItem;
    mi_sair: TMenuItem;
    btn_di_proc_exp: TSpeedButton;
    mi_di_proc_exp: TMenuItem;
    Label192: TLabel;
    dbedt_dt_reg_dde: TDBEdit;
    lbl_despachante: TLabel;
    dbedt_cd_despachante_exp: TDBEdit;
    dbedt_nm_despachante_exp: TEdit;
    btn_co_despachante_exp: TSpeedButton;
    ts_despacho_imp: TTabSheet;
    ts_fat_exp: TTabSheet;
    btn_co_despachante_imp: TSpeedButton;
    dbedt_nm_despachante_imp: TEdit;
    Label215: TLabel;
    dbedt_cd_despachante_imp: TDBEdit;
    dbgrd_fat_exp: TDBGrid;
    pnl_fat_exp: TPanel;
    Label216: TLabel;
    dbedt_nr_fat_exp: TDBEdit;
    Label35: TLabel;
    dbedt_nr_di: TDBEdit;
    lbl_nr_da_im: TLabel;
    dbedt_nr_da: TDBEdit;
    lbl_dt_vencto_armazenagem: TLabel;
    dbedt_dt_vencto_armazenagem: TDBEdit;
    lbl_dt_vencto_limite:  TLabel;
    dbedt_dt_vencto_limite: TDBEdit;
    lbl_nr_periodo_armazenagem: TLabel;
    dbedt_nr_periodo_armazenagem: TDBEdit;
    lbl_nr_dta: TLabel;
    dbedt_nr_dta: TDBEdit;
    lbl_cd_tab_sda: TLabel;
    dbedt_cd_tab_sda_imp: TDBEdit;
    dbedt_nm_tab_sda_imp: TEdit;
    btn_co_tab_sda_imp: TSpeedButton;
    Label150: TLabel;
    dbedt_cd_tab_sda_exp: TDBEdit;
    dbedt_nm_tab_sda_exp: TEdit;
    btn_co_tab_sda_exp: TSpeedButton;
    dblckpbox_tp_dta: TDBLookupComboBox;
    Label162: TLabel;
    dbedt_dt_exp_fatura: TDBDateEdit;
    lbl_dt_fatura: TLabel;
    ts_importador: TTabSheet;
    dbgrd_importador: TDBGrid;
    Bevel11: TBevel;
    Shape1: TShape;
    btn_ctrl_armazenagem: TSpeedButton;
    ts_licenca_importacao: TTabSheet;
    pnl_li: TPanel;
    lbl_nr_li: TLabel;
    lbl_dt_reg_li: TLabel;
    dbedt_nr_li: TDBEdit;
    dbedt_dt_reg_li: TDBDateEdit;
    nbImportacao: TNotebook;
    nbExportacao: TNotebook;
    nbDadosBasicos: TNotebook;
    pnlDadosBasicos: TPanel;
    Shape30: TShape;
    lblAbertura: TLabel;
    lblUsuario: TLabel;
    lbl19: TLabel;
    lblServico: TLabel;
    lblRepresentante: TLabel;
    lblMercadoria: TLabel;
    btn_co_cliente: TSpeedButton;
    btn_co_servico: TSpeedButton;
    btn_co_rep: TSpeedButton;
    lbl_transp_doc: TLabel;
    btn_co_transp_nac: TSpeedButton;
    lbl_area: TLabel;
    btn_co_area: TSpeedButton;
    lblCelula: TLabel;
    btn_co_celula: TSpeedButton;
    lbl_agente: TLabel;
    btn_agente: TSpeedButton;
    lbl7: TLabel;
    Panel5: TPanel;
    dbedt_dt_abertura: TDBEdit;
    dbedt_cd_usuario: TDBEdit;
    dbmemo_merc: TDBMemo;
    edt_look_nm_usuario: TEdit;
    edt_nm_cliente: TEdit;
    edt_nm_servico: TEdit;
    edt_nm_rep: TEdit;
    edt_nm_transp_nac: TEdit;
    edt_nm_area: TEdit;
    edt_nm_celula: TEdit;
    dbedt_cd_agente: TDBEdit;
    edt_nm_agente: TEdit;
    dbedt_cd_cliente: TDBEdit;
    dbedt_cd_servico: TDBEdit;
    dbedt_cd_rep: TDBEdit;
    dbedt_cd_transp_nac: TDBEdit;
    dbedt_cd_area: TDBEdit;
    dbedt_cd_celula: TDBEdit;
    rxdbcbEstufagem: TRxDBComboBox;
    dbchkInLeadTime: TDBCheckBox;
    dbchkInImpArmaz: TDBCheckBox;
    lblMensagemBuscaProcesso: TLabel;
    Shape32: TShape;
    Panel6: TPanel;
    Panel8: TPanel;
    Panel10: TPanel;
    Panel12: TPanel;
    Shape38: TShape;
    ts_estufagem: TTabSheet;
    pgctrlEstufagem: TPageControl;
    Shape39: TShape;
    ts_cntr: TTabSheet;
    ts_carga_solta: TTabSheet;
    dbgrd_cntr: TDBGrid;
    lbl_qtde: TLabel;
    lbl_especie: TLabel;
    Label157: TLabel;
    Label158: TLabel;
    Label159: TLabel;
    lbl5: TLabel;
    lbl6: TLabel;
    lbl9: TLabel;
    dbgrd_carga_solta: TDBGrid;
    dbedt_vl_qtde: TDBEdit;
    dbedt_nm_especie: TDBEdit;
    dbedt_peso: TDBEdit;
    dbedt_saldo: TDBEdit;
    dbm_obs_avaria_cs: TDBMemo;
    dbedt_dt_ent_arm_cs: TDBDateEdit;
    dbedt_dt_saida_arm_cs: TDBDateEdit;
    dbedtCubagem: TDBEdit;
    Panel13: TPanel;
    Panel14: TPanel;
    lbl_nr_presenca_carga: TLabel;
    lbl_dt_presenca_carga: TLabel;
    dbedt_nr_presenca_carga: TDBEdit;
    dbedt_dt_presenca_carga: TDBEdit;
    Panel15: TPanel;
    Panel16: TPanel;
    Panel18: TPanel;
    Shape44: TShape;
    Panel19: TPanel;
    Panel21: TPanel;
    Shape46: TShape;
    Panel22: TPanel;
    Shape40: TShape;
    Shape41: TShape;
    nbNotaFiscal: TNotebook;
    pnl_ref_nf: TPanel;
    lbl_nf: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    dbedt_nr_nf: TDBEdit;
    dbedt_vl_nf: TDBEdit;
    dbg_nf: TDBGrid;
    dbgrdProcessoNF: TDBGrid;
    pnlProcessoNF: TPanel;
    Label146: TLabel;
    Label147: TLabel;
    Label145: TLabel;
    Label140: TLabel;
    Label170: TLabel;
    dbedt_processo_nf_nota: TDBEdit;
    dbedt_processo_nf_valor: TDBEdit;
    dbedt_dt_entrega_fabr: TDBDateEdit;
    dbedt_dt_nota: TDBDateEdit;
    dbedtCFOP: TDBEdit;
    dbchkInCancelado: TDBCheckBox;
    Shape42: TShape;
    ts_reg_exp: TTabSheet;
    Panel28: TPanel;
    dbg_re: TDBGrid;
    pnl_ref_Re: TPanel;
    lbl_re: TLabel;
    lbl_data: TLabel;
    lbl_nbm_sh: TLabel;
    lbl_vl_fob: TLabel;
    lbl_peso_liq: TLabel;
    lbl_nr_transm: TLabel;
    DBEdit2: TDBEdit;
    dbedt_dt_re: TDBEdit;
    dbedt_cd_nbm_sh: TDBEdit;
    dbedt_vl_fob: TDBEdit;
    dbedt_peso_liq: TDBEdit;
    dbedt_nr_transm: TDBEdit;
    Panel30: TPanel;
    DBRadioGroup1: TDBRadioGroup;
    ts_re: TTabSheet;
    ts_dde_nf: TTabSheet;
    dbgrd_nf: TDBGrid;
    dbgrd_re: TDBGrid;
    Panel31: TPanel;
    Label105: TLabel;
    Panel32: TPanel;
    Label106: TLabel;
    ChkMercadoriaPerigosa: TDBCheckBox;
    Shape15: TShape;
    DBCheckBox2: TDBCheckBox;
    Shape16: TShape;
    Label107: TLabel;
    btnExtratoRE: TSpeedButton;
    btnNotaFiscal: TSpeedButton;
    pnlNFDDNota: TPanel;
    lblSair: TLabel;
    btnImportarNF: TSpeedButton;
    lbl2: TLabel;
    chkImportarTodas: TCheckBox;
    IBNF: TIBDatabase;
    IBQryNF: TIBQuery;
    dsNF: TDataSource;
    IBTransaction: TIBTransaction;
    IBQryNFMEM_DADOS: TBlobField;
    dsMTNF: TDataSource;
    strGrdNF: TStringGrid;
    lbl3: TLabel;
    dbedtSerie: TDBEdit;
    pnlEscolha: TPanel;
    lbl10: TLabel;
    lblSairEscolha: TLabel;
    btnAceitar: TSpeedButton;
    chkX: TCheckBox;
    rbTotalNota: TRadioButton;
    rbTotalProd: TRadioButton;
    rbBICMS: TRadioButton;
    rbOutro: TRadioButton;
    edtOutro: TEdit;
    shp1: TShape;
    lblVlTaxaNF: TLabel;
    dbedtVlTaxaNF: TDBEdit;
    dbedt_dt_nf: TDBDateEdit;
    dbchkInComplementar: TDBCheckBox;
    Label160: TLabel;
    msk_CNPJ_TranspMerc: TMaskEdit;
    DBText1: TDBText;
    DBText2: TDBText;
    dbedt_cd_transp_nac_doc: TDBEdit;
    lbl_transp_nac: TLabel;
    edt_nm_transp_nac_doc: TEdit;
    btn_co_transp_nac_doc: TSpeedButton;
    pnlDemurrage: TPanel;
    Shape2: TShape;
    pnl_vinculado: TPanel;
    edt_vinculado: TEdit;
    dblup_Tp_Estufagem: TDBLookupComboBox;
    Label4: TLabel;
    pnl_qtd_cntr: TPanel;
    lblqtdContainer: TLabel;
    lbl_QT_CNTR: TLabel;
    DBLookupComboBox1: TDBLookupComboBox;
    Label7: TLabel;
    pnl_anuencia_exercito: TPanel;
    Label12: TLabel;
    DBEdit9: TDBEdit;
    popm_referencia: TPopupMenu;
    duplicar_referencia: TMenuItem;
    pnl_duplicar_referencia: TPanel;
    Shape8: TShape;
    Panel2: TPanel;
    btn_sair_duplicar_referencia: TSpeedButton;
    btn_duplicar_referencia: TButton;
    Label184: TLabel;
    edt_duplicar_referencia: TEdit;
    dbchb_dse: TDBCheckBox;
    Label207: TLabel;
    msk_CNPJ_Cliente: TMaskEdit;
    pnlReplicarReferencia: TPanel;
    Shape25: TShape;
    btnFechaReplicarReferencia: TSpeedButton;
    ReplicarReferenciaparaProcessos: TMenuItem;
    Label337: TLabel;
    lbReplicarReferenciaProcessos: TListBox;
    Label338: TLabel;
    edtProcessoReplicar: TEdit;
    btnAdicionarProcessoReplicar: TSpeedButton;
    btnExcluirProcessoReplicar: TSpeedButton;
    btnReplicarReferencia: TBitBtn;
    pnlLocalEntrega: TPanel;
    Label339: TLabel;
    dbedtCD_LOCAL_ENTREGA: TDBEdit;
    edt_NM_LOCAL_ENTREGA: TEdit;
    btn_co_Local_Entrega: TSpeedButton;
    pnlLocalEntregaCargaSolta: TPanel;
    Label380: TLabel;
    btnLOCAL_ENTREGA_CARGA_SOLTA: TSpeedButton;
    dbedtCD_LOCAL_ENTREGA_CARGA_SOLTA: TDBEdit;
    edtNM_LOCAL_ENTREGA_CARGA_SOLTA: TEdit;
    lbl_NF_NR_DOCUMENTO: TLabel;
    dbedt_NF_NR_DOCUMENTO: TDBEdit;
    dbchkIN_TRANSMITE_SEM_PREVISAO: TDBCheckBox;
    pmRecuperaLI: TPopupMenu;
    miRecuperaLI: TMenuItem;
    btnDistribuiSDA: TSpeedButton;
    btnCalculaSDA: TSpeedButton;
    DBEdit15: TDBEdit;
    lblChave: TLabel;
    Label385: TLabel;
    dbck_in_subst: TDBCheckBox;
    dbedt_nr_li_subst: TDBEdit;
    cbx_nr_li_subst: TComboBox;
    dbedtDataSolicitaProrrogacao: TDBDateEdit;
    Label389: TLabel;
    dbedtChave: TDBEdit;
    ts_Draft: TTabSheet;
    pnlDraft: TPanel;
    grp3: TGroupBox;
    lbl15: TLabel;
    lbl16: TLabel;
    btnCoNotificado1: TSpeedButton;
    btnCoNotificado2: TSpeedButton;
    cmbTpNotificado1: TDBLookupComboBox;
    dbeCdNotificado1: TDBEdit;
    edtNmNotificado1: TEdit;
    cmbTpNotificado2: TDBLookupComboBox;
    dbeCdNotificado2: TDBEdit;
    edtNmNotificado2: TEdit;
    pgcDadosContainer: TPageControl;
    tsPrincipal: TTabSheet;
    tsDraft: TTabSheet;
    pnl2: TPanel;
    lbl34: TLabel;
    lbl35: TLabel;
    dbePesoLiquido: TDBEdit;
    lbl36: TLabel;
    dbeQuantidade: TDBEdit;
    lbl37: TLabel;
    dbeCubagem: TDBEdit;
    dbePesoBruto: TDBEdit;
    Label208: TLabel;
    dblkcbox_consignatario: TDBLookupComboBox;
    dbedt_cd_consignatario: TDBEdit;
    edt_nm_consignatario: TEdit;
    btn_co_consignatario: TSpeedButton;
    cmbTipoEmbalagemContainer: TcxDBLookupComboBox;
    lblTipoEmbalagemContainer: TLabel;
    dbgrdImo: TDBGrid;
    lblIMO: TLabel;
    edtDUE: TDBEdit;
    edtRUC: TDBEdit;
    lblDUE: TLabel;
    lblRUC: TLabel;
    btn4: TSpeedButton;
    pgctrl_despacho_imp: TPageControl;
    ts_doctos_imp: TTabSheet;
    pnl_fat_imp: TPanel;
    Label210: TLabel;
    Label142: TLabel;
    Label403: TLabel;
    dbedt_nr_fat_imp: TDBEdit;
    dbedt_dt_fatura: TDBDateEdit;
    dblcbCD_TIPO_DCTO_INSTR: TDBLookupComboBox;
    dbgrd_fat_imp: TDBGrid;
    ts_contr_imp: TTabSheet;
    pnl_contr_imp: TPanel;
    Label151: TLabel;
    Label152: TLabel;
    Label149: TLabel;
    lbl_dias: TLabel;
    Label153: TLabel;
    Label154: TLabel;
    Label155: TLabel;
    dbedt_nr_contr_imp: TDBEdit;
    dbedt_dt_controle: TDBDateEdit;
    dblckpbox_cond_venda_ent: TDBLookupComboBox;
    dbedt_nr_dias: TDBEdit;
    dbedt_dt_vencto_fat: TDBDateEdit;
    dbedt_dt_prazo_eadi: TDBDateEdit;
    dbedt_dt_prazo_nac: TDBDateEdit;
    dbgrd_contr_imp: TDBGrid;
    ts_exportador: TTabSheet;
    dbgrid_exportador: TDBGrid;
    ts_armazenagem: TTabSheet;
    Label167: TLabel;
    Label168: TLabel;
    Label169: TLabel;
    dbedt_periodo: TDBEdit;
    dbedt_vencto: TDBEdit;
    dbedt_pagto: TDBEdit;
    DBGrid2: TDBGrid;
    ts_Retificacoes: TTabSheet;
    DBGrid3: TDBGrid;
    shTopImpo: TShape;
    shleftImpo: TShape;
    shrightImpo: TShape;
    shbottomImpo: TShape;
    shtopExpo: TShape;
    shleftExpo: TShape;
    shrightExpo: TShape;
    shBottomExpo: TShape;
    btnGerarNrRuc: TBitBtn;
    dblPostoAnvisa: TDBLookupComboBox;
    Label410: TLabel;
    Label411: TLabel;
    dbgEmailsProcesso: TDBGrid;
    edtNovoEmail: TEdit;
    btnAdd: TBitBtn;
    btnRemove: TBitBtn;
    dbmmTX_EMAIL_PROCESSO: TDBMemo;
    pnlEXP_M: TPanel;
    Label60: TLabel;
    Label66: TLabel;
    Label67: TLabel;
    Label68: TLabel;
    Label69: TLabel;
    Label70: TLabel;
    Label71: TLabel;
    Label72: TLabel;
    Label73: TLabel;
    Label75: TLabel;
    Label76: TLabel;
    Label77: TLabel;
    Label78: TLabel;
    btn_co_moeda_mle_em: TSpeedButton;
    btn_co_amz_atr_em: TSpeedButton;
    btn_co_amz_est_em: TSpeedButton;
    btn_co_embarc_em: TSpeedButton;
    btn_co_local_emb_em: TSpeedButton;
    btn_co_local_desemb_em: TSpeedButton;
    btn_co_pais_dest_em: TSpeedButton;
    btn_co_pais_origem_em: TSpeedButton;
    Label59: TLabel;
    Label80: TLabel;
    btn_co_moeda_frete_em: TSpeedButton;
    Label61: TLabel;
    btn_co_agente_em: TSpeedButton;
    lbl_analista_com_em: TLabel;
    Label11: TLabel;
    Label127: TLabel;
    lbl_tp_banco_em: TLabel;
    lbl_banco_em: TLabel;
    btn_co_banco_em: TSpeedButton;
    Label130: TLabel;
    btn_co_agente_seg_em: TSpeedButton;
    Label121: TLabel;
    btn_co_contato_em: TSpeedButton;
    Label186: TLabel;
    Label212: TLabel;
    Label301: TLabel;
    Label309: TLabel;
    btn_co_viagem_em: TSpeedButton;
    Label1: TLabel;
    Label2: TLabel;
    Label171: TLabel;
    btn_co_lingua: TSpeedButton;
    lbl_importador_em: TLabel;
    btn_co_importador_em: TSpeedButton;
    lbl13: TLabel;
    btnCoFreteEM: TSpeedButton;
    Label144: TLabel;
    btn_co_local_transb_em: TSpeedButton;
    Label8: TLabel;
    btn_local_entrega_em: TSpeedButton;
    Label238: TLabel;
    Label313: TLabel;
    Label314: TLabel;
    Label319: TLabel;
    btn_co_docs_m: TSpeedButton;
    Label322: TLabel;
    Label329: TLabel;
    Label79: TLabel;
    Label81: TLabel;
    btn_co_resp_draft: TSpeedButton;
    btn_co_nr_depot: TSpeedButton;
    Label239: TLabel;
    btn_co_transportador_ex: TSpeedButton;
    Label390: TLabel;
    Label391: TLabel;
    Label392: TLabel;
    edt_nm_lingua: TEdit;
    dbedt_nm_agente_seg_em: TEdit;
    dbedt_nm_amz_atr_em: TEdit;
    dbedt_nm_amz_est_em: TEdit;
    dbedt_nm_embarc_em: TEdit;
    dbedt_nm_local_emb_em: TEdit;
    dbedt_nm_local_desemb_em: TEdit;
    dbedt_nm_pais_dest_em: TEdit;
    dbedt_nm_pais_origem_em: TEdit;
    dbedt_nm_banco_em: TEdit;
    dbedt_nm_agente_em: TEdit;
    edtNmFreteEM: TEdit;
    dbedt_nm_moeda_frete_em: TEdit;
    dbedt_nm_moeda_mle_em: TEdit;
    edt_nm_importador_em: TEdit;
    dbedt_nm_contato_em: TEdit;
    dbedt_nm_analista_com_em: TEdit;
    dbedt_mle_mneg_em: TDBEdit;
    dbedt_cd_amz_atr_em: TDBEdit;
    dbedt_cd_amz_est_em: TDBEdit;
    dbedt_cd_embarc_em: TDBEdit;
    dbedt_cd_local_emb_em: TDBEdit;
    dbedt_cd_pais_dest_em: TDBEdit;
    dbedt_cd_pais_origem_em: TDBEdit;
    dbedt_nr_conh_em: TDBEdit;
    dbedt_nr_conh_master_em: TDBEdit;
    dbedt_cd_moeda_mle_em: TDBEdit;
    dbedt_mle_mn_em: TDBEdit;
    dbedt_vl_frete_mn_em: TDBEdit;
    dbedt_cd_local_desemb_em: TDBEdit;
    dbedt_vl_frete_prepaid_em: TDBEdit;
    dbedt_cd_moeda_frete_em: TDBEdit;
    dbedt_cd_agente_em: TDBEdit;
    dbedt_cd_analista_com_em: TDBEdit;
    dbedt_nr_viagem_em: TDBEdit;
    dbedt_nr_averbacao_em: TDBEdit;
    dbedt_cd_banco_em: TDBEdit;
    dblckpbox_tp_banco_em: TDBLookupComboBox;
    dbedt_cd_agente_seg_em: TDBEdit;
    dbedt_cd_contato_em: TDBEdit;
    dbedt_dt_conh_em: TDBEdit;
    dblckpbox_tp_frete_em: TDBLookupComboBox;
    dbedt_vl_cif_mn_em: TDBEdit;
    dbedt_vl_m3_em: TDBEdit;
    dbedt_vl_peso_bruto_em: TDBEdit;
    dbedt_vl_peso_liquido_em: TDBEdit;
    dbedt_cd_lingua: TDBEdit;
    dbedt_cd_importador_em: TDBEdit;
    dbedtCdFreteEM: TDBEdit;
    dbedt_cd_local_transb_em: TDBEdit;
    dbedt_nm_local_transb_em: TEdit;
    dbchkIN_PRODUTO_IMPORTADO_M: TDBCheckBox;
    dbedtAtendenteM: TDBEdit;
    nm_local_entrega_em: TEdit;
    dbedt_cd_local_entrega_em: TDBEdit;
    dblckpbox_acordo_certificado_m: TDBLookupComboBox;
    dbedt_dt_est_ea_m: TDBEdit;
    cmb_tp_certificado_exm: TDBComboBox;
    edt_nm_docsenviados_m: TEdit;
    dbedt_cod_docsenviados_m: TDBEdit;
    dbedt_forma_envio_co_M: TDBComboBox;
    dbedt_nm_draft_em: TEdit;
    dbedt_nm_depot_em: TEdit;
    dbedt_cd_draft_em: TDBEdit;
    dbedt_nr_depot_em: TDBEdit;
    dbedt_cd_transportador_ex: TDBEdit;
    dbedt_nm_transportador_ex: TEdit;
    cbchkProcessoMapa: TDBCheckBox;
    dbchkApenasEmissaoDoctos: TDBCheckBox;
    pnlLeadTimeM: TPanel;
    Label342: TLabel;
    Label343: TLabel;
    dbedtVL_LEAD_TIME_M: TDBEdit;
    pnlTransitTimeM: TPanel;
    Label188: TLabel;
    Label201: TLabel;
    dbedt_VL_TRANSIT_TIME_M: TDBEdit;
    dbedt_vl_acrescimo: TDBEdit;
    dbedt_vl_desconto: TDBEdit;
    dbedt_vl_seguro: TDBEdit;
    Label412: TLabel;
    btn_co_local_transb_em2: TSpeedButton;
    dbedtCD_LOCAL_TRANSBORDO2: TDBEdit;
    dbedt_nm_local_transb_em2: TEdit;
    Label413: TLabel;
    btn_co_local_transb_em3: TSpeedButton;
    dbedtCD_LOCAL_TRANSBORDO3: TDBEdit;
    dbedt_nm_local_transb_em3: TEdit;
    Label348: TLabel;
    dbedt_cd_incoterm_m: TDBEdit;
    btn_co_incoterm_m: TSpeedButton;
    pnlEXP_A: TPanel;
    Label74: TLabel;
    Label83: TLabel;
    Label84: TLabel;
    Label85: TLabel;
    Label86: TLabel;
    Label87: TLabel;
    lbl_moeda_fob_ea: TLabel;
    Label89: TLabel;
    Label90: TLabel;
    Label91: TLabel;
    btn_co_moeda_mle_ea: TSpeedButton;
    btn_co_local_emb_ea: TSpeedButton;
    btn_co_local_desemb_ea: TSpeedButton;
    btn_co_pais_dest_ea: TSpeedButton;
    btn_co_pais_origem_ea: TSpeedButton;
    Label92: TLabel;
    Label93: TLabel;
    btn_co_moeda_frete_ea: TSpeedButton;
    Label94: TLabel;
    btn_co_agente_ea: TSpeedButton;
    Label95: TLabel;
    lbl_analista_com_ea: TLabel;
    Label117: TLabel;
    lbl_banco_ea: TLabel;
    btn_co_banco_ea: TSpeedButton;
    Label128: TLabel;
    Label129: TLabel;
    btn_co_agente_seg_ea: TSpeedButton;
    lbl_contato_ea: TLabel;
    btn_co_contato_ea: TSpeedButton;
    Label131: TLabel;
    Label135: TLabel;
    Label136: TLabel;
    Label137: TLabel;
    Label189: TLabel;
    Label206: TLabel;
    Label302: TLabel;
    Label310: TLabel;
    Label58: TLabel;
    Label64: TLabel;
    lbl_importador_ea: TLabel;
    btn_co_importador_ea: TSpeedButton;
    lbl14: TLabel;
    btnCoFreteEA: TSpeedButton;
    Label10: TLabel;
    Label28: TLabel;
    Label300: TLabel;
    Label320: TLabel;
    Label324: TLabel;
    btn_co_docs_a: TSpeedButton;
    Label330: TLabel;
    Label332: TLabel;
    btn_co_transportador_ex_a: TSpeedButton;
    Label393: TLabel;
    Label394: TLabel;
    Label395: TLabel;
    dbedt_nm_local_emb_ea: TEdit;
    dbedt_nm_local_desemb_ea: TEdit;
    dbedt_nm_pais_dest_ea: TEdit;
    dbedt_nm_pais_origem_ea: TEdit;
    dbedt_nm_banco_ea: TEdit;
    dbedt_nm_agente_seg_ea: TEdit;
    dbedt_nm_agente_ea: TEdit;
    edtNmFreteEA: TEdit;
    dbedt_nm_moeda_frete_ea: TEdit;
    dbedt_nm_moeda_mle_ea: TEdit;
    edt_nm_importador_ea: TEdit;
    dbedt_nm_contato_ea: TEdit;
    dbedt_nm_analista_com_ea: TEdit;
    dbedt_mle_mneg_ea: TDBEdit;
    dbedt_nr_conh_ea: TDBEdit;
    dbedt_nr_conh_master_ea: TDBEdit;
    dbedt_cd_moeda_mle_ea: TDBEdit;
    dbedt_mle_mn_ea: TDBEdit;
    dbedt_vl_frete_mn_ea: TDBEdit;
    dbedt_vl_frete_prepaid_ea: TDBEdit;
    dbedt_cd_moeda_frete_ea: TDBEdit;
    dbedt_cd_agente_ea: TDBEdit;
    dbedt_dt_est_ea_a: TDBEdit;
    dbedt_cd_analista_com_ea: TDBEdit;
    dbedt_nr_averbacao_ea: TDBEdit;
    dblckpbox_tp_banco_ea: TDBLookupComboBox;
    dbedt_cd_contato_ea: TDBEdit;
    dbedt_nm_conexao_ea: TDBEdit;
    dbedt_nm_proc_temp_ea: TDBEdit;
    dbedt_dt_venc_exp_temp_ea: TDBEdit;
    dbedt_dt_retorno_ea_a: TDBEdit;
    dbedt_dt_conh_ea: TDBEdit;
    dblckpbox_tp_frete_ea: TDBLookupComboBox;
    dbedt_vl_cif_mn_ea: TDBEdit;
    dbedt_vl_m3_ea: TDBEdit;
    dbedt_vl_peso_bruto_ea: TDBEdit;
    dbedt_vl_peso_liquido_ea: TDBEdit;
    dbedt_cd_importador_ea: TDBEdit;
    dbedtCdFreteEA: TDBEdit;
    dbedt_cd_local_emb_ea: TDBEdit;
    dbedt_cd_local_desemb_ea: TDBEdit;
    dbedt_cd_pais_dest_ea: TDBEdit;
    dbedt_cd_pais_origem_ea: TDBEdit;
    dbedt_cd_banco_ea: TDBEdit;
    dbedt_cd_agente_seg_ea: TDBEdit;
    DBCheckBox3: TDBCheckBox;
    dbchkProdutoImportadoExpA: TDBCheckBox;
    DBEdit8: TDBEdit;
    dblckpbox_acordo_certificado: TDBLookupComboBox;
    dbedt_qnt_acordo: TDBEdit;
    cmb_tp_certificado_exa: TDBComboBox;
    dbedt_cod_docsenviados_a: TDBEdit;
    edt_nm_docsenviados_a: TEdit;
    dbedt_forma_envio_co_A: TDBComboBox;
    dbedt_cd_transportador_ex_a: TDBEdit;
    dbedt_nm_transportador_ex_a: TEdit;
    cbchkProcessoMapa_ea: TDBCheckBox;
    dbchkApenasEmissaoDoctos_ea: TDBCheckBox;
    pnlLeadTimeA: TPanel;
    Label344: TLabel;
    Label345: TLabel;
    dbedtVL_LEAD_TIME_A: TDBEdit;
    pnlTransitTimeA: TPanel;
    Label368: TLabel;
    Label369: TLabel;
    dbedt_VL_TRANSIT_TIME_A: TDBEdit;
    dbedt_Vl_SeguroA: TDBEdit;
    dbedt_Vl_DescontoA: TDBEdit;
    dbedt_Vl_AcrescimoA: TDBEdit;
    pnlEXP_R: TPanel;
    lbl_frete_tnac_er: TLabel;
    Label190: TLabel;
    Label194: TLabel;
    Label195: TLabel;
    Label196: TLabel;
    Label197: TLabel;
    lbl_moeda_fob_er: TLabel;
    Label202: TLabel;
    btn_co_moeda_mle_er: TSpeedButton;
    btn_co_local_emb_er: TSpeedButton;
    btn_co_local_desemb_er: TSpeedButton;
    btn_co_pais_dest_er: TSpeedButton;
    btn_co_pais_origem_er: TSpeedButton;
    lbl_frete_prepaid_er: TLabel;
    Label204: TLabel;
    btn_co_moeda_frete_er: TSpeedButton;
    lbl_analista_com_er: TLabel;
    Label211: TLabel;
    lbl_banco_er: TLabel;
    btn_co_banco_er: TSpeedButton;
    Label214: TLabel;
    btn_co_agente_seg_er: TSpeedButton;
    lbl_contato_er: TLabel;
    btn_co_contato_er: TSpeedButton;
    Label217: TLabel;
    Label218: TLabel;
    Label219: TLabel;
    Label220: TLabel;
    Label88: TLabel;
    lbl_tp_frete_er: TLabel;
    lbl_vl_seguro_er: TLabel;
    Label193: TLabel;
    lbl_frete_collect_er: TLabel;
    Label289: TLabel;
    Label303: TLabel;
    Label311: TLabel;
    Label97: TLabel;
    Label98: TLabel;
    Label101: TLabel;
    Label161: TLabel;
    lbl_importador_er: TLabel;
    btn_co_importador_er: TSpeedButton;
    Label109: TLabel;
    btn_FronteiraExp: TSpeedButton;
    Label15: TLabel;
    Label205: TLabel;
    btn_co_agente_er: TSpeedButton;
    Label315: TLabel;
    Label316: TLabel;
    Label321: TLabel;
    btn_co_docs_r: TSpeedButton;
    Label325: TLabel;
    Label331: TLabel;
    Label333: TLabel;
    btn_co_transportador_ex_r: TSpeedButton;
    Label396: TLabel;
    Label397: TLabel;
    Label398: TLabel;
    dbedt_nm_agente_seg_er: TEdit;
    dbedt_nm_banco_er: TEdit;
    dbedt_nm_pais_origem_er: TEdit;
    dbedt_nm_pais_dest_er: TEdit;
    dbedt_nm_local_desemb_er: TEdit;
    dbedt_nm_local_emb_er: TEdit;
    dbedt_nm_moeda_frete_er: TEdit;
    dbedt_nm_moeda_mle_er: TEdit;
    edt_nm_importador_er: TEdit;
    dbedt_nm_contato_er: TEdit;
    dbedt_nm_analista_com_er: TEdit;
    dbedt_vl_frete_tnac_er: TDBEdit;
    dbedt_mle_mneg_er: TDBEdit;
    dbedt_cd_local_emb_er: TDBEdit;
    dbedt_cd_pais_dest_er: TDBEdit;
    dbedt_cd_pais_origem_er: TDBEdit;
    dbedt_nr_conh_er: TDBEdit;
    dbedt_cd_moeda_mle_er: TDBEdit;
    dbedt_cd_local_desemb_er: TDBEdit;
    dbedt_vl_frete_prepaid_er: TDBEdit;
    dbedt_cd_moeda_frete_er: TDBEdit;
    dbedt_cd_analista_com_er: TDBEdit;
    dbedt_nr_averbacao_er: TDBEdit;
    dbedt_cd_banco_er: TDBEdit;
    dbedt_cd_agente_seg_er: TDBEdit;
    dbedt_cd_contato_er: TDBEdit;
    dbedt_nm_proc_temp_er: TDBEdit;
    dbedt_dt_venc_exp_temp_er: TDBEdit;
    dbedt_dt_retorno_er: TDBEdit;
    dbedt_dt_conh_er: TDBEdit;
    dblckpbox_tp_banco_er: TDBLookupComboBox;
    dblckpbox_tp_frete_er: TDBLookupComboBox;
    dbedt_vl_seguro_er: TDBEdit;
    dbedt_nr_manifesto_er: TDBEdit;
    dbedt_vl_frete_collect_er: TDBEdit;
    dbedt_nr_placa_veiculo_er: TDBEdit;
    dbedt_vl_cif_mn_er: TDBEdit;
    dbedt_vl_m3_er: TDBEdit;
    dbedt_vl_peso_bruto_er: TDBEdit;
    dbedt_vl_peso_liquido_er: TDBEdit;
    dbedt_mle_mn_er: TDBEdit;
    dbedt_nr_caminhao: TDBEdit;
    dbedt_cd_importador_er: TDBEdit;
    dbedt_nm_fronteiraExp: TEdit;
    dbedt_cd_fronteiraExp: TDBEdit;
    DBEdit10: TDBEdit;
    dbedt_cd_agente_er: TDBEdit;
    dbedt_nm_agente_er: TEdit;
    dbchkProdutoImportadoExpR: TDBCheckBox;
    dbedt_dt_est_ea_r: TDBEdit;
    dblckpbox_acordo_certificado_r: TDBLookupComboBox;
    cmb_tp_certificado_exr: TDBComboBox;
    dbedt_cod_docsenviados_r: TDBEdit;
    edt_nm_docsenviados_r: TEdit;
    dbedt_forma_envio_co_R: TDBComboBox;
    dbedt_cd_transportador_ex_r: TDBEdit;
    dbedt_nm_transportador_ex_r: TEdit;
    dbchkApenasEmissaoDoctos_er: TDBCheckBox;
    cbchkProcessoMapa_er: TDBCheckBox;
    pnlLeadTimeR: TPanel;
    Label237: TLabel;
    Label349: TLabel;
    dbedtVL_LEAD_TIME_R: TDBEdit;
    pnlTransitTimeR: TPanel;
    Label370: TLabel;
    Label371: TLabel;
    dbedt_VL_TRANSIT_TIME_R: TDBEdit;
    dbedt_vl_seguroR: TDBEdit;
    dbedt_vl_DescontoR: TDBEdit;
    dbedtVL_AcrescimoR: TDBEdit;
    pnlEXP_F: TPanel;
    lbl_frete_tnac_ef: TLabel;
    Label221: TLabel;
    Label224: TLabel;
    Label225: TLabel;
    Label226: TLabel;
    Label227: TLabel;
    lbl_moeda_fob_ef: TLabel;
    Label232: TLabel;
    btn_co_moeda_mle_ef: TSpeedButton;
    btn_co_local_emb_ef: TSpeedButton;
    btn_co_local_desemb_ef: TSpeedButton;
    btn_co_pais_dest_ef: TSpeedButton;
    btn_co_pais_origem_ef: TSpeedButton;
    Label234: TLabel;
    btn_co_moeda_frete_ef: TSpeedButton;
    Label235: TLabel;
    btn_co_agente_ef: TSpeedButton;
    lbl_analista_com_ef: TLabel;
    Label241: TLabel;
    lbl_banco_ef: TLabel;
    btn_co_banco_ef: TSpeedButton;
    Label244: TLabel;
    btn_co_agente_seg_ef: TSpeedButton;
    lbl_contato_ef: TLabel;
    btn_co_contato_ef: TSpeedButton;
    Label247: TLabel;
    Label248: TLabel;
    Label249: TLabel;
    Label250: TLabel;
    Label124: TLabel;
    lbl_vl_seguro_ef: TLabel;
    lbl_tp_frete_ef: TLabel;
    Label191: TLabel;
    lbl_frete_collect_ef: TLabel;
    lbl_frete_prepaid_ef: TLabel;
    Label304: TLabel;
    Label312: TLabel;
    Label99: TLabel;
    Label100: TLabel;
    lbl_: TLabel;
    lbl_importador_ef: TLabel;
    btn_co_importador_ef: TSpeedButton;
    Label47: TLabel;
    btn_local_entrega_ef: TSpeedButton;
    Label255: TLabel;
    Label317: TLabel;
    Label318: TLabel;
    Label323: TLabel;
    btn_co_docs_f: TSpeedButton;
    Label326: TLabel;
    Label328: TLabel;
    Label335: TLabel;
    btn_co_transportador_ex_f: TSpeedButton;
    Label375: TLabel;
    btn_FronteiraExp_F: TSpeedButton;
    Label399: TLabel;
    Label400: TLabel;
    Label401: TLabel;
    dbedt_nm_local_emb_ef: TEdit;
    dbedt_nm_local_desemb_ef: TEdit;
    dbedt_nm_pais_dest_ef: TEdit;
    dbedt_nm_pais_origem_ef: TEdit;
    dbedt_nm_banco_ef: TEdit;
    dbedt_nm_agente_seg_ef: TEdit;
    dbedt_nm_agente_ef: TEdit;
    dbedt_nm_moeda_frete_ef: TEdit;
    dbedt_nm_moeda_mle_ef: TEdit;
    edt_nm_importador_ef: TEdit;
    dbedt_nm_contato_ef: TEdit;
    dbedt_nm_analista_com_ef: TEdit;
    dbedt_vl_frete_tnac_ef: TDBEdit;
    dbedt_mle_mneg_ef: TDBEdit;
    dbedt_cd_local_emb_ef: TDBEdit;
    dbedt_cd_pais_dest_ef: TDBEdit;
    dbedt_cd_pais_origem_ef: TDBEdit;
    dbedt_nr_conh_ef: TDBEdit;
    dbedt_cd_moeda_mle_ef: TDBEdit;
    dbedt_cd_local_desemb_ef: TDBEdit;
    dbedt_cd_moeda_frete_ef: TDBEdit;
    dbedt_cd_agente_ef: TDBEdit;
    dbedt_cd_analista_com_ef: TDBEdit;
    dbedt_nr_averbacao_ef: TDBEdit;
    dbedt_cd_banco_ef: TDBEdit;
    dbedt_cd_agente_seg_ef: TDBEdit;
    dbedt_cd_contato_ef: TDBEdit;
    dbedt_nm_proc_temp_ef: TDBEdit;
    dbedt_dt_venc_exp_temp_ef: TDBEdit;
    dbedt_dt_retorno_ef: TDBEdit;
    dbedt_dt_conh_ef: TDBEdit;
    dblckpbox_tp_banco_ef: TDBLookupComboBox;
    dbedt_vl_seguro_ef: TDBEdit;
    dblckpbox_tp_frete_ef: TDBLookupComboBox;
    dbedt_nr_manifesto_ef: TDBEdit;
    dbedt_vl_frete_collect_ef: TDBEdit;
    dbedt_vl_frete_prepaid_ef: TDBEdit;
    dbedt_vl_cif_mn_ef: TDBEdit;
    dbedt_vl_m3_ef: TDBEdit;
    dbedt_vl_peso_bruto_ef: TDBEdit;
    dbedt_vl_peso_liquido_ef: TDBEdit;
    dbedt_mle_mn_ef: TDBEdit;
    dbedt_cd_importador_ef: TDBEdit;
    dbchkProdutoImportadoExpF: TDBCheckBox;
    DBEdit11: TDBEdit;
    dbedt_cd_local_entrega_ef: TDBEdit;
    nm_local_entrega_ef: TEdit;
    dbedt_dt_est_ea_f: TDBEdit;
    dblckpbox_acordo_certificado_f: TDBLookupComboBox;
    cmb_tp_certificado_exf: TDBComboBox;
    dbedt_cod_docsenviados_f: TDBEdit;
    edt_nm_docsenviados_f: TEdit;
    dbedt_forma_envio_co_F: TDBComboBox;
    dbedt_cd_transportador_ex_f: TDBEdit;
    dbedt_nm_transportador_ex_f: TEdit;
    DBCheckBox5: TDBCheckBox;
    cbchkProcessoMapa_ef: TDBCheckBox;
    pnlLeadTimeF: TPanel;
    Label346: TLabel;
    Label347: TLabel;
    dbedtVL_LEAD_TIME_F: TDBEdit;
    pnlTransitTimeF: TPanel;
    Label372: TLabel;
    Label373: TLabel;
    dbedt_VL_TRANSIT_TIME_F: TDBEdit;
    dbedt_cd_fronteiraExp_F: TDBEdit;
    dbedt_nm_fronteiraExp_F: TEdit;
    dbedt_Vl_SeguroF: TDBEdit;
    dbedt_vl_descontoF: TDBEdit;
    dbedt_vl_acrescimoF: TDBEdit;
    Label414: TLabel;
    dbedt_cd_incoterm_a: TDBEdit;
    btn_co_incoterm_a: TSpeedButton;
    Label415: TLabel;
    dbedt_cd_incoterm_r: TDBEdit;
    btn_co_incoterm_r: TSpeedButton;
    Label416: TLabel;
    dbedt_cd_incoterm_f: TDBEdit;
    btn_co_incoterm_f: TSpeedButton;
    Panel1: TPanel;
    Label378: TLabel;
    btn_co_id_ref: TSpeedButton;
    btn_co_id_desvincula: TSpeedButton;
    btnImprimirSI: TSpeedButton;
    dbedt_id: TDBEdit;
    Panel4: TPanel;
    lblReferencia: TLabel;
    lblRefExp: TLabel;
    lblDataRef: TLabel;
    lblTipoRef: TLabel;
    lblArea: TLabel;
    btn_co_area_ref: TSpeedButton;
    lblItemCliente: TLabel;
    Label138: TLabel;
    dbedt_cd_ref_normal: TDBEdit;
    dbedt_cd_ref_exp: TDBEdit;
    dbedt_dt_referencia: TDBDateEdit;
    dblck_tp_referencia: TDBLookupComboBox;
    edt_nm_area_ref: TEdit;
    dbedt_cd_area_ref: TDBEdit;
    dbedtNrItemCliente1: TDBEdit;
    dbedtNrParcial1: TDBEdit;
    CmbItens: TDBComboBox;
    CmbParciais: TDBComboBox;
    lbl1: TLabel;
    shpCor: TShape;
    Panel7: TPanel;
    SpeedButton2: TSpeedButton;
    Label379: TLabel;
    SpeedButton1: TSpeedButton;
    SpeedButton3: TSpeedButton;
    Panel9: TPanel;
    Label113: TLabel;
    Label114: TLabel;
    Label115: TLabel;
    Label116: TLabel;
    Label111: TLabel;
    EditAdicao: TDBEdit;
    dbedtProtocolo: TDBEdit;
    dbedtValoMulta: TDBEdit;
    RdgTipoRetificacao: TDBRadioGroup;
    DBMemo1: TDBMemo;
    ChkGeralRetificacao: TDBCheckBox;
    dbedtDataProtocolo: TDBEdit;
    Panel17: TPanel;
    dbgrd_li: TDBGrid;
    Panel11: TPanel;
    gb_comandos_li: TGroupBox;
    btn_incluir_orgao: TSpeedButton;
    btn_salvar_orgao: TSpeedButton;
    btn_cancelar_orgao: TSpeedButton;
    btn_excluir_orgao: TSpeedButton;
    pnlLI_EMARCADO: TPanel;
    Label213: TLabel;
    edt_li_embarcado: TEdit;
    dbgrd_orgao_anuente: TDBGrid;
    pnlGridStatusLI: TPanel;
    Shape10: TShape;
    Label209: TLabel;
    DBGrid4: TDBGrid;
    pnl_li_orgao_anuente: TPanel;
    Label178: TLabel;
    Label176: TLabel;
    Label177: TLabel;
    Label256: TLabel;
    Label387: TLabel;
    btnPreencherOrgaosAnuentesEmLote: TSpeedButton;
    Label402: TLabel;
    dblckp_orgao_anuente: TDBLookupComboBox;
    dbedt_dt_defmto: TDBDateEdit;
    dbedt_dt_vencto: TDBDateEdit;
    dbedt_dt_entrada: TDBDateEdit;
    dbedtReferencia_LI: TDBEdit;
    dbedtDT_RESTRICAO_EMBARQUE: TDBDateEdit;
    pnl_IMP_M: TPanel;
    Label36: TLabel;
    btn_co_moeda_frete_im: TSpeedButton;
    Label19: TLabel;
    Label18: TLabel;
    Label20: TLabel;
    btn_co_agente_im: TSpeedButton;
    Label21: TLabel;
    Label22: TLabel;
    Label23: TLabel;
    Label24: TLabel;
    Label25: TLabel;
    Label26: TLabel;
    btn_co_amz_atr_im: TSpeedButton;
    Label27: TLabel;
    btn_co_amz_des_im: TSpeedButton;
    btn_co_embarc_im: TSpeedButton;
    btn_co_local_emb_im: TSpeedButton;
    btn_co_local_desemb_im: TSpeedButton;
    btn_co_pais_origem_im: TSpeedButton;
    Setor: TLabel;
    Label29: TLabel;
    Label32: TLabel;
    Label31: TLabel;
    Label33: TLabel;
    Label34: TLabel;
    Label119: TLabel;
    lbl_analista_com_im: TLabel;
    lbl_analista_cliente_im: TLabel;
    btn_co_contato_im: TSpeedButton;
    lbl_dt_pres_carga: TLabel;
    lbl_viagem_im: TLabel;
    Label125: TLabel;
    Label139: TLabel;
    Label183: TLabel;
    Label53: TLabel;
    Label222: TLabel;
    Label30: TLabel;
    Label305: TLabel;
    btn_co_viagem_im: TSpeedButton;
    lbl_transp_mar: TLabel;
    btn_co_transportador_im: TSpeedButton;
    Label165: TLabel;
    btn_icoterm: TSpeedButton;
    BtnPrimeiroPortoAtrac: TSpeedButton;
    Label110: TLabel;
    Label120: TLabel;
    Label163: TLabel;
    Label280: TLabel;
    Label281: TLabel;
    Label340: TLabel;
    Label341: TLabel;
    Label350: TLabel;
    Label351: TLabel;
    btn_cd_unid_medida_im: TSpeedButton;
    Label352: TLabel;
    btn_cd_moeda_mle_im: TSpeedButton;
    shpDemb_M: TShape;
    Label405: TLabel;
    Shape4: TShape;
    dbedt_nm_transportador_im: TEdit;
    dbedt_nm_agente_im: TEdit;
    dbedt_nm_pais_origem_im: TEdit;
    dbedt_nm_local_desemb_im: TEdit;
    dbedt_nm_local_emb_im: TEdit;
    dbedt_nm_embarc_im: TEdit;
    dbedt_nm_amz_des_im: TEdit;
    dbedt_nm_amz_atr_im: TEdit;
    dbedt_nm_moeda_frete_im: TEdit;
    dbedt_nm_contato_im: TEdit;
    dbedt_nm_analista_com_im: TEdit;
    dbedt_cd_moeda_frete_im: TDBEdit;
    dbedt_taxa_frete: TDBEdit;
    dbedt_vl_frete_collect_im: TDBEdit;
    dbedt_cd_agente_im: TDBEdit;
    dbedt_cif_dolar_im: TDBEdit;
    dbedt_cif_im: TDBEdit;
    dbedt_ii_im: TDBEdit;
    dbedt_ipi_im: TDBEdit;
    dbedt_icms_im: TDBEdit;
    dbedt_cd_amz_atr_im: TDBEdit;
    dbedt_cd_amz_des_im: TDBEdit;
    dbedt_cd_embarc_im: TDBEdit;
    dbedt_cd_local_emb_im: TDBEdit;
    dbedt_cd_local_desemb_im: TDBEdit;
    dbedt_cd_pais_origem_im: TDBEdit;
    dbedt_nr_conh_im: TDBEdit;
    dbedt_nr_conh_master_im: TDBEdit;
    dbedt_pres_carga_im: TDBEdit;
    dbedt_cd_analista_com_im: TDBEdit;
    dbedt_dt_pres_carga_im: TDBEdit;
    dbedt_nr_viagem_im: TDBEdit;
    dbedt_cd_contato_im: TDBEdit;
    dbedt_nr_manifesto_im: TDBEdit;
    dbedt_vl_frete_prepaid_im: TDBEdit;
    dbedt_dt_conh_im: TDBEdit;
    dblckpbox_tp_frete_im: TDBLookupComboBox;
    dbedt_vl_mle_mn_im: TDBEdit;
    dbedt_vl_mle_mneg_im: TDBEdit;
    dbedt_vl_m3_im: TDBEdit;
    dbedt_cd_transportador_im: TDBEdit;
    dbedt_icoterm: TDBEdit;
    EditPrimeiroPortoAtrac: TEdit;
    dbedt_cd_PrimeiroPortoAtrac: TDBEdit;
    DBEdit5: TDBEdit;
    DBEdit12: TDBEdit;
    dbedt_recinto_alfandegado_im: TEdit;
    edt_cd_recinto_alf_im: TEdit;
    edt_cd_setorm: TEdit;
    edtsetor_m: TEdit;
    dbchkIN_DRAWBACK_ALADI_M: TDBCheckBox;
    dbedt_VL_FOB_im: TDBEdit;
    dbedt_QT_MERC_UN_COMERC_im: TDBEdit;
    dbedt_VL_PESO_LIQUIDO_im: TDBEdit;
    dbedt_CD_UNID_MEDIDA_im: TDBEdit;
    dbedt_NM_UNID_MEDIDA_im: TEdit;
    dbedt_CD_MOEDA_MLE_im: TDBEdit;
    dbedt_NM_MOEDA_MLE_im: TEdit;
    DBCheckBox7: TDBCheckBox;
    chbCrossDockingM: TDBCheckBox;
    dbchbIN_DESEMBARACO_SOBRE_AGUAS_M: TDBCheckBox;
    dbedtVL_PESO_BRUPO_M: TDBEdit;
    dbchkIN_BALDECAO: TDBCheckBox;
    pnlEmbarcacaoBaldeacao: TPanel;
    Label408: TLabel;
    btnEmbarcacaoBaldeacao: TSpeedButton;
    btnViagemBaldeacao: TSpeedButton;
    Label409: TLabel;
    dbedtCD_EMBARCACAO_BALDEACAO: TDBEdit;
    edtEmbarcacaoBaldeacao: TEdit;
    dbedtNR_VIAGEM_BALDEACAO: TDBEdit;
    pnl_IMP_A: TPanel;
    Label39: TLabel;
    Label40: TLabel;
    Label41: TLabel;
    Label42: TLabel;
    Label43: TLabel;
    Label44: TLabel;
    Label45: TLabel;
    Label46: TLabel;
    Label48: TLabel;
    Label50: TLabel;
    Label51: TLabel;
    lbl_nr_conh_master_ia: TLabel;
    Label54: TLabel;
    Label55: TLabel;
    Label56: TLabel;
    Label57: TLabel;
    btn_co_moeda_frete_ia: TSpeedButton;
    btn_co_agente_ia: TSpeedButton;
    btn_co_amz_atr_ia: TSpeedButton;
    btn_co_amz_des_ia: TSpeedButton;
    btn_co_local_emb_ia: TSpeedButton;
    btn_co_local_desemb_ia: TSpeedButton;
    btn_co_pais_origem_ia: TSpeedButton;
    Label38: TLabel;
    lbl_analista_com_ia: TLabel;
    lbl_analista_cliente_ia: TLabel;
    btn_co_contato_ia: TSpeedButton;
    Label126: TLabel;
    Label143: TLabel;
    Label52: TLabel;
    Label37: TLabel;
    Label223: TLabel;
    Label292: TLabel;
    Label306: TLabel;
    lbl8: TLabel;
    Label164: TLabel;
    Label334: TLabel;
    btn_co_transportador_im_a: TSpeedButton;
    Label353: TLabel;
    Label354: TLabel;
    Label355: TLabel;
    Label356: TLabel;
    btn_cd_unid_medida_ia: TSpeedButton;
    btn_cd_moeda_mle_ia: TSpeedButton;
    Label357: TLabel;
    btn1: TSpeedButton;
    lbl12: TLabel;
    Label388: TLabel;
    shpDemb_A: TShape;
    Label404: TLabel;
    dbedt_nm_moeda_frete_ia: TEdit;
    dbedt_nm_contato_ia: TEdit;
    dbedt_nm_analista_com_ia: TEdit;
    dbedt_nm_agente_ia: TEdit;
    dbedt_nm_pais_origem_ia: TEdit;
    dbedt_nm_local_desemb_ia: TEdit;
    dbedt_nm_local_emb_ia: TEdit;
    dbedt_nm_amz_des_ia: TEdit;
    dbedt_nm_amz_atr_ia: TEdit;
    dbedt_vl_frete_collect_ia: TDBEdit;
    dbedt_cif_dolar_ia: TDBEdit;
    dbedt_cif_ia: TDBEdit;
    dbedt_ii_ia: TDBEdit;
    dbedt_ipi_ia: TDBEdit;
    dbedt_icms_ia: TDBEdit;
    dbedt_cd_amz_atr_ia: TDBEdit;
    dbedt_cd_amz_des_ia: TDBEdit;
    dbedt_cd_local_emb_ia: TDBEdit;
    dbedt_cd_pais_origem_ia: TDBEdit;
    dbedt_nr_conh_ia: TDBEdit;
    dbedt_nr_conh_master_ia: TDBEdit;
    dbedt_cd_moeda_frete_ia: TDBEdit;
    dbedt_taxa_frete_ia: TDBEdit;
    dbedt_cd_agente_ia: TDBEdit;
    dbedt_cd_local_desemb_ia: TDBEdit;
    dbedt_nr_voo: TDBEdit;
    dbedt_cd_analista_com_ia: TDBEdit;
    dbedt_cd_contato_ia: TDBEdit;
    dbedt_nr_manifesto_ia: TDBEdit;
    dbedt_vl_frete_prepaid_ia: TDBEdit;
    dbedt_dt_conh_ia: TDBEdit;
    dblckpbox_tp_frete_ia: TDBLookupComboBox;
    dbedt_vl_mle_mn_ia: TDBEdit;
    dbedt_vl_mle_mneg_ia: TDBEdit;
    dbedt_vl_m3_ia: TDBEdit;
    dbedtMantraVisado: TDBEdit;
    DBEdit13: TDBEdit;
    dbedt_cd_transportador_im_a: TDBEdit;
    dbedt_nm_transportador_im_a: TEdit;
    dbchkIN_DRAWBACK_ALADI_A: TDBCheckBox;
    dbedt_QT_MERC_UN_COMERC_ia: TDBEdit;
    dbedt_VL_PESO_LIQUIDO_ia: TDBEdit;
    dbedt_VL_FOB_ia: TDBEdit;
    dbedt_CD_UNID_MEDIDA_ia: TDBEdit;
    dbedt_NM_UNID_MEDIDA_ia: TEdit;
    dbedt_NM_MOEDA_MLE_ia: TEdit;
    dbedt_CD_MOEDA_MLE_ia: TDBEdit;
    DBCheckBox8: TDBCheckBox;
    dbedtCD_INCOTERM: TDBEdit;
    DBCheckBox10: TDBCheckBox;
    dbchbIN_DESEMBARACO_SOBRE_AGUAS_A: TDBCheckBox;
    dbedtVL_PESO_BRUPO_A: TDBEdit;
    pnlIMP_R: TPanel;
    Label200: TLabel;
    Label185: TLabel;
    Label198: TLabel;
    Label199: TLabel;
    Label228: TLabel;
    Label229: TLabel;
    Label230: TLabel;
    Label231: TLabel;
    Label233: TLabel;
    Label240: TLabel;
    Label242: TLabel;
    Label245: TLabel;
    Label246: TLabel;
    Label251: TLabel;
    Label252: TLabel;
    btn_co_moeda_frete_ir: TSpeedButton;
    btn_co_agente_ir: TSpeedButton;
    btn_co_amz_atr_ir: TSpeedButton;
    btn_co_amz_des_ir: TSpeedButton;
    btn_co_local_emb_ir: TSpeedButton;
    btn_co_local_desemb_ir: TSpeedButton;
    btn_co_pais_origem_ir: TSpeedButton;
    Label257: TLabel;
    Label258: TLabel;
    btn_co_contato_ir: TSpeedButton;
    Label259: TLabel;
    Label260: TLabel;
    Label261: TLabel;
    Label262: TLabel;
    Label253: TLabel;
    Label243: TLabel;
    Label123: TLabel;
    Label182: TLabel;
    Label290: TLabel;
    Label293: TLabel;
    Label307: TLabel;
    Label108: TLabel;
    Btn_FronteiraImp: TSpeedButton;
    Label9: TLabel;
    Label336: TLabel;
    btn_co_transportador_im_r: TSpeedButton;
    Label358: TLabel;
    Label359: TLabel;
    Label360: TLabel;
    Label361: TLabel;
    btn_cd_unid_medida_ir: TSpeedButton;
    btn_cd_moeda_mle_ir: TSpeedButton;
    Label362: TLabel;
    btn2: TSpeedButton;
    lbl20: TLabel;
    shpDemb_R: TShape;
    Label406: TLabel;
    dbedt_nm_agente_ir: TEdit;
    dbedt_nm_pais_origem_ir: TEdit;
    dbedt_nm_local_desemb_ir: TEdit;
    dbedt_nm_local_emb_ir: TEdit;
    dbedt_nm_amz_des_ir: TEdit;
    dbedt_nm_amz_atr_ir: TEdit;
    dbedt_nm_moeda_frete_ir: TEdit;
    dbedt_nm_contato_ir: TEdit;
    dbedt_nm_analista_com_ir: TEdit;
    dbedt_vl_frete_collect_ir: TDBEdit;
    dbedt_cif_dolar_ir: TDBEdit;
    dbedt_cif_ir: TDBEdit;
    dbedt_ii_ir: TDBEdit;
    dbedt_ipi_ir: TDBEdit;
    dbedt_icms_ir: TDBEdit;
    dbedt_cd_amz_atr_ir: TDBEdit;
    dbedt_cd_amz_des_ir: TDBEdit;
    dbedt_cd_local_emb_ir: TDBEdit;
    dbedt_cd_pais_origem_ir: TDBEdit;
    dbedt_nr_conh_ir: TDBEdit;
    dbedt_cd_moeda_frete_ir: TDBEdit;
    dbedt_taxa_frete_ir: TDBEdit;
    dbedt_cd_agente_ir: TDBEdit;
    dbedt_cd_local_desemb_ir: TDBEdit;
    dbedt_cd_analista_com_ir: TDBEdit;
    dbedt_cd_contato_ir: TDBEdit;
    dbedt_nr_manifesto_ir: TDBEdit;
    dbedt_vl_frete_prepaid_ir: TDBEdit;
    dbedt_dt_conh_ir: TDBEdit;
    dblckpbox_tp_frete_ir: TDBLookupComboBox;
    dbedt_vl_frete_tnac_ir: TDBEdit;
    dbedt_nr_placa_veiculo_ir: TDBEdit;
    dbedt_pres_carga_ir: TDBEdit;
    dbedt_dt_pres_carga_ir: TDBEdit;
    dbedt_vl_mle_mn_ir: TDBEdit;
    dbedt_vl_mle_mneg_ir: TDBEdit;
    dbedt_vl_m3_ir: TDBEdit;
    dbedt_nm_fronteiraImp: TEdit;
    dbedt_cd_fronteiraImp: TDBEdit;
    DBEdit7: TDBEdit;
    dbedt_cd_transportador_im_r: TDBEdit;
    dbedt_nm_transportador_im_r: TEdit;
    dbchkIN_DRAWBACK_ALADI_R: TDBCheckBox;
    dbedt_QT_MERC_UN_COMERC_ir: TDBEdit;
    dbedt_VL_PESO_LIQUIDO_ir: TDBEdit;
    dbedt_VL_FOB_ir: TDBEdit;
    dbedt_CD_UNID_MEDIDA_ir: TDBEdit;
    dbedt_NM_UNID_MEDIDA_ir: TEdit;
    dbedt_NM_MOEDA_MLE_ir: TEdit;
    dbedt_CD_MOEDA_MLE_ir: TDBEdit;
    DBCheckBox9: TDBCheckBox;
    dbedtCD_INCOTERM1: TDBEdit;
    chkCrossDockingR: TDBCheckBox;
    DBCHBIN_DESEMBARACO_SOBRE_AGUAS_R: TDBCheckBox;
    dbedtVL_PESO_BRUTO_R: TDBEdit;
    pnlIMP_F: TPanel;
    Label263: TLabel;
    Label264: TLabel;
    Label265: TLabel;
    Label266: TLabel;
    Label267: TLabel;
    Label268: TLabel;
    Label269: TLabel;
    Label270: TLabel;
    Label271: TLabel;
    Label273: TLabel;
    Label274: TLabel;
    Label275: TLabel;
    Label276: TLabel;
    Label277: TLabel;
    Label278: TLabel;
    btn_co_moeda_frete_if: TSpeedButton;
    btn_co_agente_if: TSpeedButton;
    btn_co_amz_atr_if: TSpeedButton;
    btn_co_amz_des_if: TSpeedButton;
    btn_co_local_emb_if: TSpeedButton;
    btn_co_local_desemb_if: TSpeedButton;
    btn_co_pais_origem_if: TSpeedButton;
    Label282: TLabel;
    Label283: TLabel;
    btn_co_contato_if: TSpeedButton;
    Label284: TLabel;
    Label285: TLabel;
    Label286: TLabel;
    Label287: TLabel;
    Label288: TLabel;
    Label187: TLabel;
    Label203: TLabel;
    Label291: TLabel;
    Label294: TLabel;
    Label308: TLabel;
    Label166: TLabel;
    Label363: TLabel;
    Label364: TLabel;
    Label365: TLabel;
    Label366: TLabel;
    btn_cd_unid_medida_if: TSpeedButton;
    btn_cd_moeda_mle_if: TSpeedButton;
    Label367: TLabel;
    Label376: TLabel;
    btn_FronteiraImp_F: TSpeedButton;
    shpDemb_F: TShape;
    Label407: TLabel;
    dbedt_nm_moeda_frete_if: TEdit;
    dbedt_nm_contato_if: TEdit;
    dbedt_nm_analista_com_if: TEdit;
    dbedt_vl_frete_collect_if: TDBEdit;
    dbedt_cif_dolar_if: TDBEdit;
    dbedt_cif_if: TDBEdit;
    dbedt_ii_if: TDBEdit;
    dbedt_ipi_if: TDBEdit;
    dbedt_icms_if: TDBEdit;
    dbedt_nr_conh_if: TDBEdit;
    dbedt_cd_moeda_frete_if: TDBEdit;
    dbedt_taxa_frete_if: TDBEdit;
    dbedt_nm_agente_if: TEdit;
    dbedt_nm_amz_atr_if: TEdit;
    dbedt_nm_amz_des_if: TEdit;
    dbedt_nm_local_emb_if: TEdit;
    dbedt_nm_local_desemb_if: TEdit;
    dbedt_nm_pais_origem_if: TEdit;
    dbedt_cd_analista_com_if: TDBEdit;
    dbedt_cd_contato_if: TDBEdit;
    dbedt_nr_manifesto_if: TDBEdit;
    dbedt_vl_frete_prepaid_if: TDBEdit;
    dbedt_dt_conh_if: TDBEdit;
    dblckpbox_tp_frete_if: TDBLookupComboBox;
    dbedt_vl_frete_tnac_if: TDBEdit;
    dbedt_pres_carga_if: TDBEdit;
    dbedt_dt_pres_carga_if: TDBEdit;
    dbedt_vl_mle_mn_if: TDBEdit;
    dbedt_vl_mle_mneg_if: TDBEdit;
    dbedt_vl_m3_if: TDBEdit;
    dbedt_cd_amz_atr_if: TDBEdit;
    dbedt_cd_amz_des_if: TDBEdit;
    dbedt_cd_local_emb_if: TDBEdit;
    dbedt_cd_local_desemb_if: TDBEdit;
    dbedt_cd_pais_origem_if: TDBEdit;
    dbedt_cd_agente_if: TDBEdit;
    DBEdit14: TDBEdit;
    dbchkIN_DRAWBACK_ALADI_F: TDBCheckBox;
    dbedt_QT_MERC_UN_COMERC_if: TDBEdit;
    dbedt_VL_PESO_LIQUIDO_if: TDBEdit;
    dbedt_VL_FOB_if: TDBEdit;
    dbedt_CD_UNID_MEDIDA_if: TDBEdit;
    dbedt_NM_UNID_MEDIDA_if: TEdit;
    dbedt_NM_MOEDA_MLE_if: TEdit;
    dbedt_CD_MOEDA_MLE_if: TDBEdit;
    dbedt_cd_fronteiraImp_F: TDBEdit;
    dbedt_nm_fronteiraImp_F: TEdit;
    DBCheckBox6: TDBCheckBox;
    chkCrossDockingF: TDBCheckBox;
    dbchbIN_DESEMBARACO_SOBRE_AGUAS_F: TDBCheckBox;
    dbedtVL_PESO_BRUTO_F: TDBEdit;
    Panel20: TPanel;
    dbm_tx_cliente: TDBMemo;
    Label118: TLabel;
    Panel23: TPanel;
    Panel24: TPanel;
    Label82: TLabel;
    dbm_tx_obs_int: TDBMemo;
    dbedtCD_DUIMP: TDBEdit;
    Label417: TLabel;
    dbchkIN_FRETE_ACORDADO_M: TDBCheckBox;
    dbchkIN_FRETE_ACORDADO_A: TDBCheckBox;
    dbchkIN_FRETE_ACORDADO_R: TDBCheckBox;
    dbchkIN_FRETE_ACORDADO_F: TDBCheckBox;
    Label418: TLabel;
    btnCdOperadorTanqueM: TSpeedButton;
    edtCD_OPERADOR_TANQUE: TEdit;
    dbedtCD_OPERADOR_TANQUE: TDBEdit;
    pgContainer: TPageControl;
    tbsImportacao: TTabSheet;
    tbsExportacao: TTabSheet;
    pnl1: TPanel;
    shp8: TShape;
    lbl_nr_cntr: TLabel;
    lbl_dt_ent_arm: TLabel;
    lbl_dt_desova: TLabel;
    lbl_dt_entr_fabr: TLabel;
    lbl_tipo: TLabel;
    Label102: TLabel;
    btn_co_processo_vinc: TSpeedButton;
    Label103: TLabel;
    lbl_dt_dev_cntr: TLabel;
    Label156: TLabel;
    lbl4: TLabel;
    Shape23: TShape;
    Label16: TLabel;
    btnSalvarNF: TSpeedButton;
    btnExcluirNF: TSpeedButton;
    Label17: TLabel;
    SpeedButton5: TSpeedButton;
    lblTaraContainer: TLabel;
    lblTemp: TLabel;
    lblNrContainerLeasing: TLabel;
    dbedt_nr_cntr: TDBEdit;
    dbm_avaria_cntr: TDBMemo;
    dbedt_nr_processo_vinc: TDBEdit;
    dbedt_dt_desova: TDBDateEdit;
    pnl_carreta: TPanel;
    lbl_carreta: TLabel;
    dblkp_carreta: TDBLookupComboBox;
    dblckp_box_tp_cntr: TDBLookupComboBox;
    dbedt_dt_entr_fabr: TDBDateEdit;
    dbedt_dt_ent_arm: TDBDateEdit;
    dbedt_nr_lacre: TDBEdit;
    dbedt_dt_dev_cntr: TDBDateEdit;
    dbedt_dt_saida_arm: TDBDateEdit;
    dbchkInDesova: TDBCheckBox;
    dbchkInDemurrage: TDBCheckBox;
    DBGrid1: TDBGrid;
    edtNF: TEdit;
    dbedt_pl_cntr: TDBEdit;
    DBCheckBox4: TDBCheckBox;
    pnlLocalEntregaCntr: TPanel;
    Label377: TLabel;
    btnLOCAL_ENTREGA_CNTR: TSpeedButton;
    dbedtCD_LOCAL_ENTREGA_CNTR: TDBEdit;
    edtNM_LOCAL_ENTREGA_CNTR: TEdit;
    DBEdit18: TDBEdit;
    dbedtNR_CNTR_LEASING: TDBEdit;
    group_dem: TGroupBox;
    Label172: TLabel;
    Label173: TLabel;
    Label175: TLabel;
    btn_co_aprovado_por: TSpeedButton;
    dbedt_motivo_dem: TDBEdit;
    dbedt_resp_dem: TDBEdit;
    dbedt_aprovado_dem: TDBEdit;
    pnl_datas: TPanel;
    lbl_dt_chegada_fabr: TLabel;
    Label179: TLabel;
    Label374: TLabel;
    dt_chegada_fabr: TDBDateEdit;
    hr_chegada_fabr: TcxDBTimeEdit;
    dt_carregamento: TDBDateEdit;
    hr_carregamento: TcxDBTimeEdit;
    dt_prev_chegada_fabr: TDBDateEdit;
    hr_prev_chegada_fabr: TcxDBTimeEdit;
    lblContainerExpo: TLabel;
    Label420: TLabel;
    Label421: TLabel;
    Label141: TLabel;
    lblTaraContainerExpo: TLabel;
    Label424: TLabel;
    dbedtNrCntrExportacao: TDBEdit;
    DBLookupComboBox2: TDBLookupComboBox;
    DBEdit3: TDBEdit;
    dbedt_nr_lacre_sif: TDBEdit;
    dbedtTaraCntrExpo: TDBEdit;
    DBCheckBox1: TDBCheckBox;
    DBEdit17: TDBEdit;
    Label425: TLabel;
    DBDateEdit1: TDBDateEdit;
    dbedt_dt_ent_arm_expo: TDBDateEdit;
    Label426: TLabel;
    Label427: TLabel;
    dbedt_dt_saida_arm_Expo: TDBDateEdit;
    Shape5: TShape;
    Shape6: TShape;
    Label422: TLabel;
    btnSalvarNFExp: TSpeedButton;
    btnExcluirNFExp: TSpeedButton;
    Label428: TLabel;
    btnSelecionarNfExp: TSpeedButton;
    grdNfExp: TDBGrid;
    edtNFExp: TEdit;
    pnlCarretaExp: TPanel;
    Label430: TLabel;
    DBLookupComboBox3: TDBLookupComboBox;
    pnlRodoviarioContainer: TPanel;
    Label3: TLabel;
    dt_chegada_fronteira: TDBDateEdit;
    hr_chegada_fronteira: TcxDBTimeEdit;
    Label6: TLabel;
    dt_chegada_aduana_brasil: TDBDateEdit;
    hr_chegada_aduana_brasil: TcxDBTimeEdit;
    Label419: TLabel;
    dt_saida_aduana_brasil: TDBDateEdit;
    hr_saida_aduana_brasil: TcxDBTimeEdit;
    Label423: TLabel;
    dt_cruze: TDBDateEdit;
    hr_cruze: TcxDBTimeEdit;
    Label429: TLabel;
    dt_chegada_aduana_importador: TDBDateEdit;
    hr_chegada_aduana_importador: TcxDBTimeEdit;
    Label431: TLabel;
    dt_saida_aduana_importador: TDBDateEdit;
    hr_saida_aduana_importador: TcxDBTimeEdit;
    Label432: TLabel;
    dt_chegada_importador: TDBDateEdit;
    hr_chegada_importador: TcxDBTimeEdit;
    Label433: TLabel;
    dt_descarga_importador: TDBDateEdit;
    hr_descarga_importador: TcxDBTimeEdit;
    pnlEntregaPreStacking: TPanel;
    lbl_dt_entr_terminal: TLabel;
    lbl_dt_pre_stacking: TLabel;
    dt_entr_terminal: TDBDateEdit;
    dt_pre_stacking: TDBDateEdit;
    hr_entr_terminal: TcxDBTimeEdit;
    hr_pre_stacking: TcxDBTimeEdit;
    pnlSolicitacaoRetirada: TPanel;
    Label180: TLabel;
    Label181: TLabel;
    dt_solic_ret_vazio: TDBDateEdit;
    dt_ret_vazio: TDBDateEdit;
    hr_solic_ret_vazio: TcxDBTimeEdit;
    hr_ret_vazio: TcxDBTimeEdit;
    lbl_nr_ctrl_Inmetro: TLabel;
    dbedt_nr_exigencia: TDBEdit;
    Label386: TLabel;
    DBEdit16: TDBEdit;
    Label434: TLabel;
    dbrdgin_pre_embarque: TDBRadioGroup;
    Label435: TLabel;
    dbedtdt_solicitacao: TDBDateEdit;
    Label436: TLabel;
    dbedtdt_fin_dossie: TDBDateEdit;
    Label437: TLabel;
    dbedtnr_dossie: TDBEdit;
    Label439: TLabel;
    dbedtdt_doctos_dossie: TDBDateEdit;
    Label440: TLabel;
    dbedtdt_emissao_gru: TDBDateEdit;
    Label441: TLabel;
    dbedtnr_transacao_gru: TDBEdit;
    Label442: TLabel;
    dbedtdt_pgmto_gru: TDBDateEdit;
    Label444: TLabel;
    dbedtnr_expediente_anvisa: TDBEdit;
    dbedtnr_processo_anvisa: TDBEdit;
    Label445: TLabel;
    Label446: TLabel;
    dbedtdt_cumprimento_exigencia: TDBDateEdit;
    Label448: TLabel;
    dbedtqt_itens: TDBEdit;
    Panel25: TPanel;
    lbl_tx_obs_canc: TLabel;
    dbchk_in_cancelado: TDBCheckBox;
    dbmmo_tx_obs_canc: TDBMemo;
    Panel26: TPanel;
    btnImportarArquivoXMLLI: TSpeedButton;
    lblQtdLis: TLabel;
    btnEmissor: TSpeedButton;
    edtNmEmissor: TEdit;
    dbedtcdEmissor: TDBEdit;
    Panel27: TPanel;
    Shape3: TShape;
    lbl_cd_unid_neg: TLabel;
    btn_co_unid_neg: TSpeedButton;
    lbl_cd_produto: TLabel;
    btn_co_produto: TSpeedButton;
    lbl_nr_processo: TLabel;
    btn_co_processo: TSpeedButton;
    edt_nm_unid_neg: TEdit;
    edt_nm_produto: TEdit;
    chkProcessos: TCheckBox;
    dbcbxMadeiraCondenada: TDBCheckBox;
    Shape11: TShape;
    Label443: TLabel;
    dbedtDsArmazemMantra: TDBEdit;
    dbedt_nr_free_time: TDBEdit;
    lbl_free_time: TLabel;
    Label104: TLabel;
    msk_nr_free_time: TMaskEdit;
    msk_nr_processo: TcxMaskEdit;
    msk_cd_produto: TcxMaskEdit;
    msk_cd_unid_neg: TcxMaskEdit;
    dbchICMS_Exo_A: TDBCheckBox;
    dbchICMSExo_M: TDBCheckBox;
    dbchICMS_Exo_R: TDBCheckBox;
    dbchICMS_Exo_F: TDBCheckBox;
    btnDraftBl: TSpeedButton;
    Label5: TLabel;
    cxDBLookupComboBox1: TcxDBLookupComboBox;
    Button1: TButton;
    Panel3: TPanel;
    DBGrid5: TDBGrid;
    btnExcluirRefCntr: TSpeedButton;
    btnSalvarRefCntr: TSpeedButton;
    edtReferencia: TEdit;
    SpeedButton7: TSpeedButton;
    Label449: TLabel;
    Label450: TLabel;
    Shape12: TShape;
    Shape13: TShape;
    tsCamposDescontinuados: TTabSheet;
    GroupBox1: TGroupBox;
    dbedtdt_apto_fin_dossie: TDBDateEdit;
    Label438: TLabel;
    Label451: TLabel;
    GroupBox2: TGroupBox;
    pnlSelecionaCanal: TPanel;
    shp21: TShape;
    shp33: TShape;
    shp34: TShape;
    shp35: TShape;
    shp37: TShape;
    shpLiCanalVermelho: TShape;
    shp40: TShape;
    shp41: TShape;
    shp42: TShape;
    shp43: TShape;
    Label447: TLabel;
    btnAbreCanais: TSpeedButton;
    Shape9: TShape;
    nbCanais: TNotebook;
    shp10: TShape;
    shp9: TShape;
    shp6: TShape;
    Shape7: TShape;
    Label453: TLabel;
    dbedtCD_CANAL_LI: TDBEdit;
    dbedtnr_lpco: TDBEdit;
    lb_Nr_Dossie: TLabel;
    GroupBox3: TGroupBox;
    Shape31: TShape;
    btn_processo_entreposto: TSpeedButton;
    dbedt_nr_processo_entreposto: TDBEdit;
    lbl_processo_entreposto: TLabel;
    dbchkInEntreposto: TDBCheckBox;
    Label327: TLabel;
    dbedt_analista: TDBEdit;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    TabSheet3: TTabSheet;
    TabSheet4: TTabSheet;
    GroupBox5: TGroupBox;
    Label236: TLabel;
    Label382: TLabel;
    dbedt_vl_frete_custo_ia: TDBEdit;
    dbedtTabArmazenagemA: TDBComboBox;
    GroupBox4: TGroupBox;
    Label298: TLabel;
    dbedt_vl_frete_custo_er: TDBEdit;
    GroupBox6: TGroupBox;
    GroupBox7: TGroupBox;
    GroupBox8: TGroupBox;
    GroupBox9: TGroupBox;
    GroupBox10: TGroupBox;
    GroupBox11: TGroupBox;
    dbedt_vl_frete_custo_em: TDBEdit;
    Label296: TLabel;
    dbedt_vl_frete_custo_ea: TDBEdit;
    Label297: TLabel;
    dbedt_vl_frete_custo_ef: TDBEdit;
    Label299: TLabel;
    dbedt_vl_frete_custo_im: TDBEdit;
    Label49: TLabel;
    dbedtTabArmazenagemM: TDBComboBox;
    Label381: TLabel;
    dbedt_vl_frete_custo_ir: TDBEdit;
    Label272: TLabel;
    dbedtTabArmazenagemR: TDBComboBox;
    Label383: TLabel;
    dbedt_vl_frete_custo_if: TDBEdit;
    Label295: TLabel;
    dbedtTabArmazenagemF: TDBComboBox;
    Label384: TLabel;
    dblckpbox_tp_canal_if: TDBLookupComboBox;
    Label279: TLabel;
    dblckpbox_tp_canal_ir: TDBLookupComboBox;
    Label254: TLabel;
    dblckpbox_tp_canal_ia: TDBLookupComboBox;
    Label122: TLabel;
    dblckpbox_tp_canal_im: TDBLookupComboBox;
    lbl_canal: TLabel;
    Label452: TLabel;
    Label454: TLabel;
    Label455: TLabel;
    Label456: TLabel;
    Label457: TLabel;
    Label458: TLabel;
    Label459: TLabel;
    ts_fabricante: TTabSheet;
    dbgrid_fabricante: TDBGrid;
    btnIntegracaoExcelCntrlExpo: TBitBtn;
    btnIntegracaoExcelCntrlImpo: TBitBtn;
    OpenDialogExcel: TOpenDialog;
    btnAjudaIntegracaoCntrExpo: TImage;
    btnAjudaIntegracaoCntrImpo: TImage;
    edtProcessoLECOM: TDBEdit;
    lblProcessoLECOM: TLabel;
    btnAtualizarDadosPO: TSpeedButton;
    DBCheckBox11: TDBCheckBox;
    GroupBox12: TGroupBox;
    edtContractNumber: TDBEdit;
    edtContractParty: TDBEdit;
    edtHSCode: TDBEdit;
    lblContractNumber: TLabel;
    lblContractParty: TLabel;
    lblMoveType: TLabel;
    lblHSCode: TLabel;
    lblCustomerComments: TLabel;
    lblPartnerEmail: TLabel;
    edtCustomerComments: TDBMemo;
    edtPartnerEmail: TDBMemo;
    DBLookupComboBox4: TDBLookupComboBox;
    chkMudancaRegime: TDBCheckBox;
    DBCheckBox12: TDBCheckBox;
    DBCheckBox13: TDBCheckBox;
    DBCheckBox14: TDBCheckBox;
    edtSolicitacaoRequisito: TDBDateEdit;
    lblSolicitacaoRequisito: TLabel;
    edtRecepcaoRequisitoSanitario: TDBDateEdit;
    lblRecepcaoRequisitoSanitario: TLabel;
    edtDataLecom: TDBDateEdit;
    lblDataLecom: TLabel;
    edtLIAutorizada: TDBDateEdit;
    lblLIAutorizada: TLabel;
    edtProtocoloRemotoOk: TDBDateEdit;
    lblProtocoloRemotoOk: TLabel;
    edtDataInspecao: TDBDateEdit;
    lblDataInspecao: TLabel;
    chkInspecao: TDBCheckBox;
    chkDataColetaAmostra: TDBCheckBox;
    lblDataColetaAmostra: TLabel;
    edtDataColetaAmostra: TDBDateEdit;
    lblNrInfa: TLabel;
    edtNrInfa: TDBEdit;
    lblMotivoNovaSub: TLabel;
    DBMemo2: TDBMemo;
    dbchk_in_utilizado: TDBCheckBox;
    btn_co_local_coleta_im: TSpeedButton;
    Label460: TLabel;
    dbedt_nm_local_coleta_im: TEdit;
    dbedt_cd_local_coleta_im: TDBEdit;
    Label461: TLabel;
    btn_co_local_coleta_ia: TSpeedButton;
    dbedt_nm_local_coleta_ia: TEdit;
    dbedt_cd_local_coleta_ia: TDBEdit;
    Label462: TLabel;
    btn_co_local_coleta_ir: TSpeedButton;
    dbedt_nm_local_coleta_ir: TEdit;
    dbedt_cd_local_coleta_ir: TDBEdit;
    Label463: TLabel;
    btn_co_local_coleta_if: TSpeedButton;
    dbedt_nm_local_coleta_if: TEdit;
    dbedt_cd_local_coleta_if: TDBEdit;
    chkExigencia: TDBCheckBox;
    lblChaveImpo: TLabel;
    dbedtCHAVE_NOTAImpo: TDBEdit;
    btnTransitTimeLote: TBitBtn;
    btnTransitTimeLote1: TBitBtn;
    btnTransitTimeLote2: TBitBtn;
    btnTransitTimeLote3: TBitBtn;
    edtChaveAcessoDue: TDBEdit;
    Label464: TLabel;
    lblCdRuc: TLabel;
    dbedtCdRuc: TDBEdit;
    dbcbxCsiMapa: TDBCheckBox;
    Shape14: TShape;
    Label465: TLabel;
    btnOperadorTanqueExpo: TSpeedButton;
    edtNmOperadorTanqueExpo: TEdit;
    dbedtCodOperadorTanqueExpo: TDBEdit;
    Shape17: TShape;
    dbcbxCobrancaEcac: TDBCheckBox;
    rdgTipoLicenca: TDBRadioGroup;
    dbedtnr_dossie_POS: TDBEdit;
    Label466: TLabel;

    procedure btn_sairClick(Sender: TObject);
    procedure msk_cd_unid_negExit(Sender: TObject);
    procedure btn_co_produtoClick(Sender: TObject);
    procedure pgctrl_manut_procChange(Sender: TObject);
    procedure btn_salvarClick(Sender: TObject);
    procedure btn_cancelarClick(Sender: TObject);
    procedure dbnvgBeforeAction(Sender: TObject; Button: TNavigateBtn);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btn_co_clienteClick(Sender: TObject);
    procedure btn_co_servicoClick(Sender: TObject);
    procedure btn_co_repClick(Sender: TObject);
    procedure btn_co_moeda_frete_imClick(Sender: TObject);
    procedure btn_co_agente_imClick(Sender: TObject);
    procedure btn_co_amz_atr_imClick(Sender: TObject);
    procedure btn_co_amz_des_imClick(Sender: TObject);
    procedure btn_co_embarc_imClick(Sender: TObject);
    procedure btn_co_local_emb_imClick(Sender: TObject);
    procedure btn_co_local_desemb_imClick(Sender: TObject);
    procedure btn_co_pais_origem_imClick(Sender: TObject);
    procedure btn_co_moeda_mle_emClick(Sender: TObject);
    procedure btn_co_amz_est_emClick(Sender: TObject);
    procedure btn_co_unid_negClick(Sender: TObject);
    procedure dbedt_pb_refChange(Sender: TObject);
    procedure btn_incluirClick(Sender: TObject);
    procedure dbn_refBeforeAction(Sender: TObject;
      Button: TNavigateBtn);
    procedure btn_excluirClick(Sender: TObject);
    procedure pgctrl_manut_procChanging(Sender: TObject;
      var AllowChange: Boolean);
    procedure DadosRef;
    procedure btn_co_embalagemClick(Sender: TObject);
    procedure msk_cd_produtoExit(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure dbedt_cd_moeda_frete_imKeyDown(Sender: TObject;
      var Key: Word; Shift: TShiftState);
    procedure Edita;
    procedure dbedt_cd_clienteChange(Sender: TObject);
    procedure msk_cd_produtoEnter(Sender: TObject);
    procedure dbg_volumesColEnter(Sender: TObject);
    procedure dbedt_cd_servicoEnter(Sender: TObject);
    procedure dbedt_cd_contato_im2Exit(Sender: TObject);
    procedure btn_co_contato_imClick(Sender: TObject);
    procedure dbedt_nr_cntrChange(Sender: TObject);
    procedure dbedt_vl_qtdeChange(Sender: TObject);
    procedure btn_co_transp_nac_docClick(Sender: TObject);
    procedure btn_co_transp_nacClick(Sender: TObject);
    procedure btn_co_banco_eaClick(Sender: TObject);
    procedure dbedt_cd_banco_carta_eaExit(Sender: TObject);
    procedure dblckpbox_tp_banco_eaClick(Sender: TObject);
    procedure btn_co_agente_seg_emClick(Sender: TObject);
    procedure btn_proc_realizaClick(Sender: TObject);
    procedure btn_co_areaClick(Sender: TObject);
    procedure dbedt_cd_clienteExit(Sender: TObject);
    procedure dbedt_vl_frete_prepaid_imChange(Sender: TObject);
    procedure dbedt_vl_frete_prepaid_iaChange(Sender: TObject);
    procedure dbedt_vl_frete_collect_imChange(Sender: TObject);
    procedure dbedt_vl_frete_collect_iaChange(Sender: TObject);
    procedure dbedt_processo_nf_notaChange(Sender: TObject);
    procedure btn_di_proc_expClick(Sender: TObject);
    procedure btn_co_despachante_expClick(Sender: TObject);
    procedure pgctrl_despacho_expChange(Sender: TObject);
    procedure dblckpbox_tp_frete_erClick(Sender: TObject);
    procedure dbedt_nf_iniExit(Sender: TObject);
    procedure dbedt_nr_reChange(Sender: TObject);
    procedure dbedt_nf_iniChange(Sender: TObject);
    procedure btn_co_despachante_impClick(Sender: TObject);
    procedure pgctrl_despacho_impChange(Sender: TObject);
    procedure dbedt_nr_liChange(Sender: TObject);
    procedure btn_co_processoClick(Sender: TObject);
    procedure msk_nr_processoExit(Sender: TObject);
    procedure msk_nr_processoEnter(Sender: TObject);
    procedure msk_nr_processoChange(Sender: TObject);
    procedure btn_co_moeda_frete_iaClick(Sender: TObject);
    procedure btn_co_moeda_frete_irClick(Sender: TObject);
    procedure btn_co_moeda_frete_ifClick(Sender: TObject);
    procedure btn_co_moeda_frete_emClick(Sender: TObject);
    procedure btn_co_moeda_frete_eaClick(Sender: TObject);
    procedure btn_co_moeda_frete_erClick(Sender: TObject);
    procedure btn_co_moeda_frete_efClick(Sender: TObject);
    procedure btn_co_agente_irClick(Sender: TObject);
    procedure btn_co_agente_ifClick(Sender: TObject);
    procedure btn_co_agente_emClick(Sender: TObject);
    procedure btn_co_agente_eaClick(Sender: TObject);
    procedure btn_co_agente_erClick(Sender: TObject);
    procedure btn_co_agente_efClick(Sender: TObject);
    procedure btn_co_agente_iaClick(Sender: TObject);
    procedure btn_co_amz_atr_irClick(Sender: TObject);
    procedure btn_co_amz_atr_ifClick(Sender: TObject);
    procedure btn_co_amz_atr_emClick(Sender: TObject);
    procedure btn_co_amz_atr_iaClick(Sender: TObject);
    procedure btn_co_amz_des_iaClick(Sender: TObject);
    procedure btn_co_embarc_emClick(Sender: TObject);
    procedure btn_co_local_emb_iaClick(Sender: TObject);
    procedure btn_co_local_emb_irClick(Sender: TObject);
    procedure btn_co_local_emb_ifClick(Sender: TObject);
    procedure btn_co_local_emb_emClick(Sender: TObject);
    procedure btn_co_local_emb_eaClick(Sender: TObject);
    procedure btn_co_local_emb_erClick(Sender: TObject);
    procedure btn_co_local_emb_efClick(Sender: TObject);
    procedure btn_co_local_desemb_iaClick(Sender: TObject);
    procedure btn_co_local_desemb_irClick(Sender: TObject);
    procedure btn_co_local_desemb_ifClick(Sender: TObject);
    procedure btn_co_local_desemb_emClick(Sender: TObject);
    procedure btn_co_local_desemb_eaClick(Sender: TObject);
    procedure btn_co_local_desemb_erClick(Sender: TObject);
    procedure btn_co_local_desemb_efClick(Sender: TObject);
    procedure btn_co_pais_dest_eaClick(Sender: TObject);
    procedure btn_co_pais_dest_erClick(Sender: TObject);
    procedure btn_co_pais_dest_efClick(Sender: TObject);
    procedure btn_co_pais_origem_iaClick(Sender: TObject);
    procedure btn_co_pais_origem_irClick(Sender: TObject);
    procedure btn_co_pais_origem_ifClick(Sender: TObject);
    procedure btn_co_pais_origem_emClick(Sender: TObject);
    procedure btn_co_pais_origem_eaClick(Sender: TObject);
    procedure btn_co_pais_origem_erClick(Sender: TObject);
    procedure btn_co_pais_origem_efClick(Sender: TObject);
    procedure btn_co_moeda_mle_eaClick(Sender: TObject);
    procedure btn_co_moeda_mle_erClick(Sender: TObject);
    procedure btn_co_moeda_mle_efClick(Sender: TObject);
    procedure btn_co_contato_iaClick(Sender: TObject);
    procedure btn_co_contato_irClick(Sender: TObject);
    procedure btn_co_contato_ifClick(Sender: TObject);
    procedure btn_co_contato_emClick(Sender: TObject);
    procedure btn_co_contato_eaClick(Sender: TObject);
    procedure btn_co_contato_erClick(Sender: TObject);
    procedure btn_co_banco_emClick(Sender: TObject);
    procedure btn_co_banco_erClick(Sender: TObject);
    procedure btn_co_banco_efClick(Sender: TObject);
    procedure dblckpbox_tp_banco_emClick(Sender: TObject);
    procedure dblckpbox_tp_banco_erClick(Sender: TObject);
    procedure dblckpbox_tp_banco_efClick(Sender: TObject);
    procedure btn_co_agente_seg_eaClick(Sender: TObject);
    procedure btn_co_agente_seg_erClick(Sender: TObject);
    procedure btn_co_agente_seg_efClick(Sender: TObject);
    procedure dblckpbox_tp_frete_iaClick(Sender: TObject);
    procedure dblckpbox_tp_frete_imClick(Sender: TObject);
    procedure dblckpbox_tp_frete_irClick(Sender: TObject);
    procedure dblckpbox_tp_frete_ifClick(Sender: TObject);
    procedure dblckpbox_tp_frete_efClick(Sender: TObject);
    procedure btn_co_contato_efClick(Sender: TObject);
    procedure btn_co_amz_des_irClick(Sender: TObject);
    procedure btn_co_amz_des_ifClick(Sender: TObject);
    procedure btn_co_pais_dest_emClick(Sender: TObject);
    procedure btn_co_viagem_imClick(Sender: TObject);
    procedure btn_co_viagem_emClick(Sender: TObject);
    procedure dbedt_nr_viagem_imExit(Sender: TObject);
    procedure dbedt_nr_viagem_emExit(Sender: TObject);
    procedure dbedt_cd_banco_emExit(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btn_co_transportador_imClic(Sender: TObject);
    procedure btn_processo_entrepostoClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure dbedt_mle_mn_erChange(Sender: TObject);
    procedure btn_co_processo_vincClick(Sender: TObject);
    procedure msk_nr_free_timeExit(Sender: TObject);
    procedure msk_nr_free_timeEnter(Sender: TObject);
    procedure btn_co_celulaClick(Sender: TObject);
    procedure btn_co_area_refClick(Sender: TObject);
    procedure dbedt_nr_dtaChange(Sender: TObject);
    procedure btn_co_tab_sda_impClick(Sender: TObject);
    procedure btn_co_tab_sda_expClick(Sender: TObject);
    procedure dbchk_deferidoClick(Sender: TObject);
    procedure dbchk_indeferidoClick(Sender: TObject);
    procedure dbedt_dt_vencimento1Change(Sender: TObject);
    procedure btn_icotermClick(Sender: TObject);
    procedure dbedt_cd_servicoKeyPress(Sender: TObject; var Key: Char);
    procedure dbedt_cd_clienteEnter(Sender: TObject);
    procedure btn_agenteClick(Sender: TObject);
    procedure dbedt_cd_unid_negChange(Sender: TObject);
    procedure dbedt_cd_produtoChange(Sender: TObject);
    procedure dbedt_cd_usuarioChange(Sender: TObject);
    procedure dbedt_cd_analista_com_imChange(Sender: TObject);
    procedure dbedt_cd_analista_com_iaChange(Sender: TObject);
    procedure dbedt_cd_analista_com_irChange(Sender: TObject);
    procedure dbedt_cd_analista_com_ifChange(Sender: TObject);
    procedure dbedt_cd_analista_com_emChange(Sender: TObject);
    procedure dbedt_cd_analista_com_eaChange(Sender: TObject);
    procedure dbedt_cd_analista_com_erChange(Sender: TObject);
    procedure dbedt_cd_analista_com_efChange(Sender: TObject);
    procedure btn_ctrl_armazenagemClick(Sender: TObject);
    procedure dbedt_cd_ref_normalKeyPress(Sender: TObject; var Key: Char);
    procedure dbedtNrItemCliente1KeyPress(Sender: TObject; var Key: Char);
    procedure dbedtCFOPExit(Sender: TObject);
    procedure btn_incluir_orgaoClick(Sender: TObject);
    procedure btn_salvar_orgaoClick(Sender: TObject);
    procedure btn_cancelar_orgaoClick(Sender: TObject);
    procedure btn_excluir_orgaoClick(Sender: TObject);
    procedure dblckp_orgao_anuenteClick(Sender: TObject);
    procedure cbx_nr_li_substDropDown(Sender: TObject);
    procedure dbchk_in_canceladoClick(Sender: TObject);
    procedure btn_co_linguaClick(Sender: TObject);
    procedure btn_co_aprovado_porClick(Sender: TObject);
    procedure dbedt_motivo_demChange(Sender: TObject);
    procedure btn_co_importador_emClick(Sender: TObject);
    procedure btn_co_importador_eaClick(Sender: TObject);
    procedure btn_co_importador_erClick(Sender: TObject);
    procedure btn_co_importador_efClick(Sender: TObject);
    procedure dbedt_cd_importador_emExit(Sender: TObject);
    procedure dbedt_cd_importador_eaExit(Sender: TObject);
    procedure dbedt_cd_importador_erExit(Sender: TObject);
    procedure dbedt_cd_importador_efExit(Sender: TObject);
    procedure dbedtMantraVisadoExit(Sender: TObject);
    procedure btnCoFreteEMClick(Sender: TObject);
    procedure btnCoFreteEAClick(Sender: TObject);
    procedure dbedtCdFreteIMExit(Sender: TObject);
    procedure rxdbcbEstufagemEnter(Sender: TObject);
    procedure dblckpbox_tp_frete_emClick(Sender: TObject);
    procedure dbedtDtNFExit(Sender: TObject);
    procedure dbedtDtNFChange(Sender: TObject);
    procedure dbchkInEntrepostoClick(Sender: TObject);
    procedure edtNFChange(Sender: TObject);
    procedure SpeedButton5Click(Sender: TObject);
    procedure btnSalvarNFClick(Sender: TObject);
    procedure DBEdit2Change(Sender: TObject);
    procedure btnExcluirNFClick(Sender: TObject);
    procedure dbedt_dt_reg_ddeChange(Sender: TObject);
    procedure ChkMercadoriaPerigosaClick(Sender: TObject);
    procedure DBCheckBox2Click(Sender: TObject);
    procedure dbedt_nr_processo_vincChange(Sender: TObject);
    procedure dbg_reDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure btnExtratoREClick(Sender: TObject);
    procedure btnNotaFiscalClick(Sender: TObject);
    procedure lblSairClick(Sender: TObject);
    procedure btnImportarNFClick(Sender: TObject);
    procedure msk_cd_unid_negEnter(Sender: TObject);
    procedure dbedt_nr_nfChange(Sender: TObject);
    procedure lblSairEscolhaClick(Sender: TObject);
    procedure rbOutroClick(Sender: TObject);
    procedure btnAceitarClick(Sender: TObject);
    procedure Btn_FronteiraImpClick(Sender: TObject);
    procedure btn_FronteiraExpClick(Sender: TObject);
    procedure ChkGeralRetificacaoClick(Sender: TObject);
    procedure RdgTipoRetificacaoChange(Sender: TObject);
    procedure EditAdicaoChange(Sender: TObject);
    procedure dbedt_dt_nfExit(Sender: TObject);
    procedure dbedt_dt_nfEnter(Sender: TObject);
    procedure dbedt_dt_faturaChange(Sender: TObject);
    procedure BtnPrimeiroPortoAtracClick(Sender: TObject);
    procedure dbedt_cd_ref_normalExit(Sender: TObject);
    procedure CmbItensClick(Sender: TObject);
    procedure CmbItensExit(Sender: TObject);
    procedure btn_co_local_entrega_emClick(Sender: TObject);
    procedure dbedt_cd_local_transb_emChange(Sender: TObject);
    procedure DBEdit5Exit(Sender: TObject);
    procedure edt_selectALL(Sender: TObject);
    procedure dbedt_nr_cntrExit(Sender: TObject);
    procedure dblup_Tp_EstufagemClick(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure dbedt_cd_servicoExit(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure duplicar_referenciaClick(Sender: TObject);
    procedure btn_duplicar_referenciaClick(Sender: TObject);
    procedure btn_sair_duplicar_referenciaClick(Sender: TObject);
    procedure dblkcbox_consignatarioExit(Sender: TObject);
    procedure t(Sender: TObject);
    procedure btn_co_consignatarioClick(Sender: TObject);
    procedure dbchb_dseClick(Sender: TObject);
    procedure dbchk_in_utilizadoClick(Sender: TObject);
    procedure DBGrid4DblClick(Sender: TObject);
    procedure btn_local_entrega_emClick(Sender: TObject);
    procedure btn_local_entrega_efClick(Sender: TObject);
    procedure btn_co_local_transb_emClick(Sender: TObject);
    procedure edt_cd_recinto_alf_imChange(Sender: TObject);
    procedure edt_cd_setormChange(Sender: TObject);
    procedure dblckpbox_acordo_certificadoClick(Sender: TObject);
    procedure DBComboBox1Change(Sender: TObject);
    procedure cmb_tp_certificado_exmChange(Sender: TObject);
    procedure btn_co_docs_mClick(Sender: TObject);
    procedure dbedt_cod_docsenviados_mChange(Sender: TObject);
    procedure btn_co_docs_aClick(Sender: TObject);
    procedure dbedt_cod_docsenviados_aChange(Sender: TObject);
    procedure btn_co_docs_fClick(Sender: TObject);
    procedure btn_co_docs_rClick(Sender: TObject);
    procedure dbedt_cod_docsenviados_rChange(Sender: TObject);
    procedure dbedt_cod_docsenviados_fChange(Sender: TObject);
    procedure dbgrdImoDblClick(Sender: TObject);
    procedure dbedt_forma_envio_co_MChange(Sender: TObject);
    procedure dbedt_cd_consignatarioChange(Sender: TObject);
    procedure dbedt_cd_consignatarioExit(Sender: TObject);
    procedure btn_co_incoterm_mClick(Sender: TObject);
    procedure dbedt_cd_incoterm_mExit(Sender: TObject);
    procedure dbedt_cd_incoterm_mChange(Sender: TObject);
    procedure btn_co_resp_draftClick(Sender: TObject);
    procedure btn_co_nr_depotClick(Sender: TObject);
    procedure btn_co_transportador_exClick(Sender: TObject);
    procedure dbedt_cd_transportador_exChange(Sender: TObject);
    procedure btn_co_transportador_ex_aClick(Sender: TObject);
    procedure btn_co_transportador_ex_rClick(Sender: TObject);
    procedure btn_co_transportador_im_aClick(Sender: TObject);
    procedure btn_co_transportador_ex_fClick(Sender: TObject);
    procedure btn_co_transportador_im_rClick(Sender: TObject);
    procedure dbchkIN_DRAWBACK_ALADI_MClick(Sender: TObject);
    procedure btnFechaReplicarReferenciaClick(Sender: TObject);
    procedure ReplicarReferenciaparaProcessosClick(Sender: TObject);
    procedure popm_referenciaPopup(Sender: TObject);
    procedure btnExcluirProcessoReplicarClick(Sender: TObject);
    procedure btnAdicionarProcessoReplicarClick(Sender: TObject);
    procedure ts_refShow(Sender: TObject);
    procedure btnReplicarReferenciaClick(Sender: TObject);
    procedure pgctrl_despacho_impChanging(Sender: TObject;
      var AllowChange: Boolean);
    procedure btn_co_Local_EntregaClick(Sender: TObject);
    procedure dbedtVL_LEAD_TIME_MChange(Sender: TObject);
    procedure btn_cd_moeda_mle_imClick(Sender: TObject);
    procedure btn_cd_unid_medida_imClick(Sender: TObject);
    procedure dbedt_VL_TRANSIT_TIME_AChange(Sender: TObject);
    procedure btn_FronteiraExp_FClick(Sender: TObject);
    procedure btn_FronteiraImp_FClick(Sender: TObject);
    procedure btnLOCAL_ENTREGA_CNTRClick(Sender: TObject);
    procedure btn_co_id_refClick(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure dbedtCD_LOCAL_ENTREGA_CARGA_SOLTAChange(Sender: TObject);
    procedure dbchkIN_TRANSMITE_SEM_PREVISAOClick(Sender: TObject);
    procedure btn_co_id_desvinculaClick(Sender: TObject);
    procedure dbedt_VL_TRANSIT_TIME_MExit(Sender: TObject);
    procedure miRecuperaLIClick(Sender: TObject);
    procedure pmRecuperaLIPopup(Sender: TObject);
    procedure btnDistribuiSDAClick(Sender: TObject);
    procedure btnCalculaSDAClick(Sender: TObject);
    procedure SpeedButton3Click(Sender: TObject);
    procedure cmbTpNotificado1Exit(Sender: TObject);
    procedure cmbTpNotificado2Exit(Sender: TObject);
    procedure dbeCdNotificado1Exit(Sender: TObject);
    procedure btnCoNotificado1Click(Sender: TObject);
    procedure btnCoNotificado2Click(Sender: TObject);
    procedure dbeCdNotificado2Exit(Sender: TObject);
    procedure dbePesoBrutoChange(Sender: TObject);
    procedure dbePesoLiquidoChange(Sender: TObject);
    procedure dbeCubagemChange(Sender: TObject);
    procedure dbeQuantidadeChange(Sender: TObject);
    procedure cmbTipoEmbalagemContainerExit(Sender: TObject);
    procedure edtDUEChange(Sender: TObject);
    procedure edtRUCChange(Sender: TObject);
    procedure dbedt_VL_TRANSIT_TIME_RExit(Sender: TObject);
    procedure btn4Click(Sender: TObject);
    procedure btnPreencherOrgaosAnuentesEmLoteClick(Sender: TObject);
    procedure cmbTpNotificado1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure dblkcbox_consignatarioKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure cmbTpNotificado2KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure btnImprimirSIClick(Sender: TObject);
    procedure DBGrid4DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure DBGrid4MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure FormDeactivate(Sender: TObject);
    procedure dbchbIN_DESEMBARACO_SOBRE_AGUAS_MClick(Sender: TObject);
    procedure dbchbIN_DESEMBARACO_SOBRE_AGUAS_AClick(Sender: TObject);
    procedure DBCHBIN_DESEMBARACO_SOBRE_AGUAS_RClick(Sender: TObject);
    procedure dbchbIN_DESEMBARACO_SOBRE_AGUAS_FClick(Sender: TObject);
    procedure dbgrd_liDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure dbedt_nr_fat_impChange(Sender: TObject);
    procedure dblcbCD_TIPO_DCTO_INSTRClick(Sender: TObject);
    procedure btnGerarNrRucClick(Sender: TObject);
    procedure dbedtCD_EMBARCACAO_BALDEACAOChange(Sender: TObject);
    procedure dbedtCD_EMBARCACAO_BALDEACAOExit(Sender: TObject);
    procedure btnEmbarcacaoBaldeacaoClick(Sender: TObject);
    procedure dbchkIN_BALDECAOClick(Sender: TObject);
    procedure btnViagemBaldeacaoClick(Sender: TObject);
    procedure dblPostoAnvisaKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure dbmmTX_EMAIL_PROCESSOChange(Sender: TObject);
    procedure btnAddClick(Sender: TObject);
    procedure btnRemoveClick(Sender: TObject);
    procedure dbedtNR_CNTR_LEASINGExit(Sender: TObject);
    procedure btn_co_incoterm_aClick(Sender: TObject);
    procedure btn_co_incoterm_rClick(Sender: TObject);
    procedure btn_co_incoterm_fClick(Sender: TObject);
    procedure btn_co_local_transb_em2Click(Sender: TObject);
    procedure btn_co_local_transb_em3Click(Sender: TObject);
    procedure btnImportarArquivoXMLLIClick(Sender: TObject);
    procedure btnCdOperadorTanqueMClick(Sender: TObject);
    procedure btnAbreCanaisClick(Sender: TObject);
    procedure shpLiCanalVermelhoMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure dbedtCD_CANAL_LIChange(Sender: TObject);
    procedure btnEmissorClick(Sender: TObject);
    procedure dbcbxMadeiraCondenadaClick(Sender: TObject);
    procedure msk_cd_produtoPropertiesChange(Sender: TObject);
    procedure msk_cd_unid_negPropertiesChange(Sender: TObject);
    procedure msk_nr_processoKeyPress(Sender: TObject; var Key: Char);
    procedure msk_cd_unid_negKeyPress(Sender: TObject; var Key: Char);
    procedure msk_cd_produtoKeyPress(Sender: TObject; var Key: Char);
    procedure btnDueClick(Sender: TObject);
    procedure btnDraftBlClick(Sender: TObject);
    procedure DBGrid1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure grdNfExpKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure grdNfExpKeyPress(Sender: TObject; var Key: Char);
    procedure grdNfExpKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBGrid1KeyPress(Sender: TObject; var Key: Char);
    procedure DBGrid1KeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure grdNfExpCellClick(Column: TColumn);
    procedure DBGrid1CellClick(Column: TColumn);
    procedure Button1Click(Sender: TObject);
    procedure SpeedButton7Click(Sender: TObject);
    procedure btnSalvarRefCntrClick(Sender: TObject);
    procedure btnExcluirRefCntrClick(Sender: TObject);
    procedure DBGrid5KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBGrid5KeyPress(Sender: TObject; var Key: Char);
    procedure DBGrid5KeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBGrid5CellClick(Column: TColumn);
    procedure edtReferenciaChange(Sender: TObject);
    procedure btnIntegracaoExcelCntrlExpoClick(Sender: TObject);
    procedure btnIntegracaoExcelCntrlImpoClick(Sender: TObject);
    procedure btnAjudaIntegracaoCntrExpoClick(Sender: TObject);
    procedure btnAjudaIntegracaoCntrImpoClick(Sender: TObject);
    procedure btnAtualizarDadosPOClick(Sender: TObject);
    procedure edtContractNumberChange(Sender: TObject);
    procedure chkInspecaoClick(Sender: TObject);
    procedure chkDataColetaAmostraClick(Sender: TObject);
    procedure btn_co_local_coleta_imClick(Sender: TObject);
    procedure btn_co_local_coleta_iaClick(Sender: TObject);
    procedure btn_co_local_coleta_irClick(Sender: TObject);
    procedure btn_co_local_coleta_ifClick(Sender: TObject);
    procedure chkExigenciaClick(Sender: TObject);
    procedure btnTransitTimeLoteClick(Sender: TObject);
    procedure dbcbxCsiMapaClick(Sender: TObject);
    procedure btnOperadorTanqueExpoClick(Sender: TObject);
    procedure dbcbxCobrancaEcacClick(Sender: TObject);
    procedure dbedt_nr_liExit(Sender: TObject);
    procedure rdgTipoLicencaClick(Sender: TObject);


   // procedure btn_co_transportador_ex_aClick(Sender: TObject);

    private
    vCdTotalNF: string[6];
    st_modulo, st_rotina : String;
    lAbertura, lNaoConsiste, lVerProcesso : Boolean;
    cd_unid_neg_proc, cd_produto_proc : String[2];
    vTpEstufagem: string[1];
    nr_free_time : String;
    cd_servico: string[3];
    var_nr_proc : String[18];
    vNrLIAtual : String;
    vAlterouProcVinc: Boolean;
    vDtTaxa : TDateTime;
    HintLi : THintLi;
    function Grava : Boolean;
    function GravaRef : Boolean;
    function GravaEmbalagem : Boolean;
    function GravaNF : Boolean;
    function GravaDespachoImp : Boolean;
    function GravaDespachoExp : Boolean;
    function GravaCntr : Boolean;
    function GravaCargaSolta : Boolean;
    function GravaRequerimento : Boolean;
    function GravaLI  : Boolean;
    function GravaOrgaoAnuenteLI : Boolean;
    function Consiste : Boolean;
    function VerAlt   : Boolean;
    function VerProcesso : Boolean;
    function PreencheuCamposFrete(qry: TQuery): Boolean;
    procedure VerificaFrete(pForcaCalculo: boolean = false);
    procedure Cancelar;
    procedure CodExits;
    procedure Abertura;
    procedure ApagaItensDI;
    procedure AtualizaItensDI;
    procedure AtualizaTEstagio;
    procedure AtualizaCmbParciais;
    function VerifRefRepetida: Boolean;
    function ConsisteRefRepetida: Boolean;
    function ConsisteServico: Boolean;

    //ImportaRE
    function NewWebBrowserImportaRE: Tfrm_Web;
    procedure WebDocumentCompleteImportaRE(Sender: TObject; const pDisp: IDispatch; var URL: OleVariant);
    procedure ExecutaIntegracaoImportaRE;
    procedure GravaImportaRE;
    procedure SetReferencia(const Processo, NR_RE, Referencia: string);
    procedure Habilita_Btn_Draft(nNum: Integer);
    procedure Muda_Lookup_Nm(nNum, nTp: Integer);
    procedure ValCodigo(dbedit_Codigo: TDbEdit; nNum: Integer);
    procedure AlterarLi(Sender: TObject);
    procedure MaskBeforePaste(Sender: TObject; AText: String; var ADone: Boolean);
    procedure AlterarProduto(key : Char);
    procedure ConfigurarTelaProcessoCarregado;
    procedure ConfiguraBotaoSDA;
    procedure VerificaProcessoVinculado;
    procedure VerificaProcessoFaturado;
    procedure ControleBtnExcluirNF;
    procedure ControleBtnExcluirRefCntr;
    procedure IntegrarPlanilhaContainer;
    procedure ExecutaFormAjuda;
    procedure controleMascaraNrLi;

  public
    RefAtual : TReferencia;
    st_modificar, st_incluir, st_excluir : Boolean;
    pesq_nr_proc, pesq_cd_unid_neg, pesq_cd_prod : string;
    cd_servico_proc : string[3];
    vAlterouServico, lCons_OnLine : Boolean;
    vClientePreenchido : string;
    vEmbarcacaoOld : string;
    vConhecimentoOld : string;
    //ImportaRE
    FStatusBrowser: Boolean;
    RE_atual: String;
    ImportaRE: TRE;
    function Consulta_RE_MANUT( Usuario :String  ):Boolean;
    procedure TornaVisivelTabSheet;
    procedure btn_mi(i:Boolean; s:Boolean; c:Boolean; e:Boolean);
    procedure AtualizaDeferimentoLI( aNrProcesso, aNrLI : String );
    procedure PreencheComboLI;
    procedure PesquisaProc;
    procedure VerRefCliente;
    procedure VerEmbalagem;
    procedure VerNF;
    procedure VerLI;
    procedure VerCntr;
    procedure VerCargaSolta;
    procedure VerCamposDI;
    procedure VerDDE;
    procedure VerProcessoExp;
    procedure VerDespachoImp;
    procedure VerDespachoExp;
    function  VerUnidNegProduto(origem : string) : Boolean;
    function  ConsisteCmbsReferencia : Boolean;
    function  VerifRefOrdemRepetida : Boolean;
    procedure AtivaAlertaDesembaracoSobreAguas(chk : TDbCheckBox; shp : TShape);
    procedure HabilitaBaldecao(status_IN_BALDEACAO : String);
    procedure PreencheEmailsProcesso;
    function VerificaEmailJaExiste(Email : String) : Boolean;
    function ValidaNumeroRUC(sRUC, nr_processo : String) : String;
    procedure FocaEmContainer;

  end;

const
  C_ENTER = '@E';
  C_PF3   = '@3';
  C_PF8   = '@8';
  C_PF6   = '@6';
  C_PF12  = '@c';
  MSG_BUSCA_PROCESSO = 'Informe o processo desejado para que o sistema ' + #13#10 +
                       'exiba as informações correspondentes ao ' + #13#10 +
                       'tipo de classificação do mesmo.';


var
  frm_manut_proc: Tfrm_manut_proc;

implementation

uses GSMLIB, PGGP001, PGGP017, PGGP019, PGSM096, PGSM136, PGSM148, uControleArmaz,
  PGSM990, PGPE018, FUNCOESEXPORT, StrUtils, uInfoNovoEx, KrQuery,
  UAtualizaDatasLisProcesso, UAtualizaDatasOrgaosAnuentesProcesso,
  URelatoriosNestle, uLI_Importa_XML, KrUtil, ComObj, frmAjuda, KrDialog, USelecionaProcTransitTime;

{$R *.DFM}

procedure Tfrm_manut_proc.FormCreate(Sender: TObject);
var
  vIni : TIniFile;
begin
  //pega base do DDNota
  vIni := TIniFile.Create( ExtractFilePath(Application.ExeName) + 'CONFIG.INI');
  IBNF.DatabaseName  := vIni.ReadString('DATABASEIB', 'IBNAME', 'ERROR');
  vIni.Free;
  pnl_Manut_Proc.Color          := clBtnFace;
  nbDadosBasicos.ActivePage     := 'Inicio';
  Application.CreateForm(Tdatm_manut_proc, datm_manut_proc );
  Shape2.Brush.Color            := clBtnFace;
  Shape23.Brush.Color           := clBtnFace;
  Shape40.Brush.Color           := clBtnFace;
  Shape41.Brush.Color           := clBtnFace;
//  DBCheckBox1.Color             := clPnlClaroBroker;
//  DBCheckBox2.Color             := clPnlClaroBroker;
//  DBCheckBox7.Color             := clPnlClaroBroker;
//  DBCheckBox8.Color             := clPnlClaroBroker;
  dbedt_dt_presenca_carga.Color := clBtnFace;
  edt_nm_transp_nac_doc.Color   := clBtnFace;
  chkProcessos.Color            := clBtnFace;
  pnl_manut_proc.Color          := clBtnFace;
  HintLi := THintLi.Create(Self);
  datm_manut_proc.cdsEmailsProcesso.createDataSet;


  msk_cd_unid_neg.BeforePaste   := MaskBeforePaste;
  msk_cd_produto.BeforePaste    := MaskBeforePaste;
  msk_nr_processo.BeforePaste   := MaskBeforePaste;

  lblMensagemBuscaProcesso.Caption := MSG_BUSCA_PROCESSO;
end;

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

procedure Tfrm_manut_proc.MaskBeforePaste(Sender: TObject; AText: String; var ADone: Boolean);
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

  if (Sender = msk_cd_unid_neg) or (Sender = msk_cd_produto) or (Sender = msk_nr_processo) then
  begin
    if Unidade <> '' then
    begin
      msk_cd_unid_neg.Text := Unidade;
      msk_cd_unid_negPropertiesChange(sender);
    end;
    if Produto <> '' then
    begin
      msk_cd_produto.Text := Produto;
      msk_cd_produtoPropertiesChange(sender);
    end;
    if Processo <> '' then
    begin

      if Produto = '' then
        AlterarProduto(Processo[1]);

      msk_nr_processo.Text := Processo;
    end;
  end;
  ADone := True;
end;

procedure Tfrm_manut_proc.msk_nr_processoKeyPress(
  Sender: TObject; var Key: Char);
begin
  AlterarProduto(key);
end;

procedure Tfrm_manut_proc.AlterarProduto(key : Char);
begin
  if key in ['i', 'I'] then
  begin
    if msk_cd_produto.text = '02' then
    begin
      msk_cd_produto.Text := '01';
      msk_cd_produtoPropertiesChange(msk_cd_produto);
    end;
  end
  else
  if key in ['e', 'E'] then
  begin
    if msk_cd_produto.text = '01' then
    begin
      msk_cd_produto.Text := '02';
      msk_cd_produtoPropertiesChange(msk_cd_produto);
    end;
  end;
end;

function BloqueiaProcExp(Processo: String): Boolean;
var
iExiste : string;
begin
    //    Verifica se o processo existe também na tabela TPROCESSO_EXP
    // Isso indica que alguns campos do processo devem ser bloqueados para
    // evitar alterações do usuário nesta tela.
    //    Estes dados só poderão ser mudados na tela do Processo de Exportação
    // (CTRL+E)
    //
    //                                Eric, 22/02/2012 12:30h

    with TQuery.Create(Application) do
    begin
      DatabaseName := 'DBBroker';
      SQL.Clear;
      SQL.Add('SELECT COUNT(NR_PROCESSO) AS ''Retorno'' FROM TPROCESSO_EXP (NOLOCK) ');
      SQL.Add('WHERE NR_PROCESSO = ''' + Processo +'''');
      Open;
      iExiste := FieldByName('Retorno').AsString;

      if iExiste = '1' then
      Result := True
      else
      Result := False;

      Free;
   end;

end;

procedure Tfrm_manut_proc.btn_sairClick(Sender: TObject);
begin
  if Not VerAlt then Exit;
//  msk_nr_processo.Text := '';  by carlos - problemas com a pesquisa /abertura e manut processo (07/06/2010)
//  str_cd_rotina_atalho := '';
//  str_nr_processo := '';
//  pesq_nr_proc := '';
  Close;
end;

procedure Tfrm_manut_proc.msk_cd_unid_negExit(Sender: TObject);
begin
  lNaoConsiste := True;
  if Trim(msk_cd_unid_neg.Text) <> '' then
    msk_cd_unid_neg.Text := Copy('00', 1, 2 - Length( msk_cd_unid_neg.Text)) +  msk_cd_unid_neg.Text;

  if (not datm_manut_proc.qry_processo_.Active) or (pesq_cd_unid_neg <> Trim(msk_cd_unid_neg.Text)) then
  begin
    str_nr_processo := Trim( msk_cd_unid_neg.Text ) + Trim( msk_cd_produto.Text ) + Trim( msk_nr_processo.Text );
    Consiste;
  end;
  lNaoConsiste := False;
end;

procedure Tfrm_manut_proc.btn_co_produtoClick(Sender: TObject);
begin
  datm_manut_proc.qry_processo_.Close;
  if Sender Is TSpeedButton Then
  begin
    msk_cd_produto.Text := ConsultaOnLineEx('TPRODUTO','Produto',['CD_PRODUTO','AP_PRODUTO'],['Código','Descrição'],'CD_PRODUTO',frm_main.mi_tabela_produto, 1, msk_cd_produto.Text);
  end
  else
    edt_nm_produto.Text := ConsultaLookUP('TPRODUTO','CD_PRODUTO', msk_cd_produto.Text,'AP_PRODUTO');
end;

procedure Tfrm_manut_proc.pgctrl_manut_procChange(Sender: TObject);
begin
  btn_mi( False, False, False, False );

  with datm_manut_proc do
  begin
    //habilita aba de Container e/ou Carga Solta dependendo do Modal - Kleber (28/06/2007)
    if pgctrl_manut_proc.ActivePage = ts_estufagem then
    begin


      if transp_servico = '07' then
      begin
        pnl_carreta.Visible             := True;
        pnlCarretaExp.visible           := false;
        qry_carreta.Active              := True;
        lblqtdContainer.caption         := 'Qtd. Carreta';
        lbl_nr_cntr.caption             := 'Placa';
        lblContainerExpo.caption        := 'Placa';
        lblTaraContainerExpo.visible    := false;
        dbedtTaraCntrExpo.visible       := false;
        lblTaraContainer.visible        := false;
        dbedt_pl_cntr.visible           := false;
        pnlRodoviarioContainer.visible  := true;
        qry_proc_cntr_NR_CNTR.EditMask  := '';
        pnlEntregaPreStacking.visible   := false;
        pnlSolicitacaoRetirada.visible  := false;
        dbgrd_cntr.Columns[0].Title.Caption  := 'Placa Carreta';
        ts_cntr.caption                 := '    Carretas    ';
      end
      else
      begin
        pnl_carreta.Visible             := false;
        pnlCarretaExp.visible           := false;
        qry_carreta.Active              := false;
        lblqtdContainer.caption         := 'Qtd. CNTR';
        lbl_nr_cntr.caption             := 'Contêiner';
        lblContainerExpo.caption        := 'Contêiner';
        lblTaraContainerExpo.visible    := true;
        dbedtTaraCntrExpo.visible       := true;
        lblTaraContainer.visible        := true;
        dbedt_pl_cntr.visible           := true;
        pnlRodoviarioContainer.visible  := false;
        qry_proc_cntr_NR_CNTR.EditMask  := 'llll-999-999-9;0;_';
        pnlEntregaPreStacking.visible   := true;
        pnlSolicitacaoRetirada.visible  := true;
        dbgrd_cntr.Columns[0].Title.Caption  := 'Nº Contêiner';
        ts_cntr.caption                 := '    Contêineres    ';
      end;

      ts_cntr.TabVisible        := (qry_processo_TP_ESTUFAGEM.AsString = '1') or (qry_processo_TP_ESTUFAGEM.AsString = '0'); //FCL ou LCL
      ts_carga_solta.TabVisible := (qry_processo_TP_ESTUFAGEM.AsString = '0') or (qry_processo_TP_ESTUFAGEM.AsString = '2'); //LCL ou Carga Solta

      if (datm_manut_proc.qry_processo_CD_GRUPO.AsString ='155') and (datm_manut_proc.qry_processo_CD_SERVICO.AsString ='710')
          and (datm_manut_proc.qry_processo_CD_PRODUTO.AsString ='02') and (str_cd_cargo <> '133')  then
      begin
        datm_manut_proc.qry_tp_cntr_.close;
        datm_manut_proc.qry_tp_cntr_.sql.clear;
        datm_manut_proc.qry_tp_cntr_.sql.add( 'SELECT TP_CNTR, NM_TP_CNTR FROM   TTP_CNTR (NOLOCK) WHERE TP_CNTR IN (SELECT DISTINCT CD_EQUIPMENT FROM TBID  (NOLOCK) WHERE CD_DEST_NEST='''+dbedt_cd_pais_dest_em.text+''' AND CD_PORT_DISCHARGE='''+dbedt_cd_local_desemb_em.text+''' AND CD_ORIGIN_CITY='''+ dbedt_cd_local_emb_em.text+''' AND CD_CARRIER='''+ dbedt_cd_agente_em.text+''') ' );
        datm_manut_proc.qry_tp_cntr_.Prepare;
        datm_manut_proc.qry_tp_cntr_.Open;
        if  datm_manut_proc.qry_tp_cntr_.RecordCount <= 0 then
        begin
          datm_manut_proc.qry_tp_cntr_.close;
          datm_manut_proc.qry_tp_cntr_.sql.CLEAR;
          datm_manut_proc.qry_tp_cntr_.sql.add( 'SELECT TP_CNTR, NM_TP_CNTR FROM TTP_CNTR (NOLOCK) ' );
          datm_manut_proc.qry_tp_cntr_.Open;
        end;
      end
      else
      begin
        datm_manut_proc.qry_tp_cntr_.close;
        datm_manut_proc.qry_tp_cntr_.sql.CLEAR;
        datm_manut_proc.qry_tp_cntr_.sql.add( 'SELECT TP_CNTR, NM_TP_CNTR FROM   TTP_CNTR (NOLOCK) ' );
        datm_manut_proc.qry_tp_cntr_.Open;
      end;

    end
    else
    begin
      pnl_carreta.Visible       := False;
      pnlCarretaExp.visible     := false;
      qry_carreta.Active        := False;
    end;
    if ( pgctrl_manut_proc.ActivePage = ts_exp_mar ) then
    begin
       qry_acordo_certificados.Active:=true;
    end;


    if ( pgctrl_manut_proc.ActivePage = ts_ref ) then
    begin
      btn_mi( ( st_incluir and ts_ref.Enabled ), False, False, ( st_excluir and ts_ref.Enabled ) );

      btnImprimirSI.Visible := (msk_cd_produto.Text = '01') and (datm_manut_proc.qry_processo_CD_GRUPO.AsString ='155');
      btnAtualizarDadosPO.Visible := btnImprimirSI.Visible;

    end;
    if ( pgctrl_manut_proc.ActivePage = ts_reg_exp ) then
       btn_mi( st_incluir, False, False, st_excluir );

    with qry_proc_embalagem_ do
    begin
      if ( pgctrl_manut_proc.ActivePage = ts_embalagem ) then
      begin
        btn_mi( ( st_incluir and ts_embalagem.Enabled ), False, False, ( st_excluir and ts_embalagem.Enabled ) );
        Close;
        ParamByName('NR_PROCESSO').AsString := qry_processo_NR_PROCESSO.AsString;
        Open;
        VerEmbalagem;
        qry_tot_embalagem_.Close;
        qry_tot_embalagem_.ParamByName('NR_PROCESSO').AsString := qry_processo_NR_PROCESSO.AsString;
        qry_tot_embalagem_.Open;
      end
      else
        Close;
    end;

    if ( pgctrl_manut_proc.ActivePage = ts_estufagem ) and ( pgctrlEstufagem.ActivePage = ts_cntr ) then
    begin
      dbgrdImo.Visible                     := ChkMercadoriaPerigosa.Checked;
      lblImo.Visible                       := ChkMercadoriaPerigosa.Checked;

      datm_manut_proc.qry_proc_cntr_AfterScroll(nil);
      vAlterouProcVinc := False;
      btn_mi( ( st_incluir and ts_cntr.Enabled ), False, False, ( st_excluir and ts_cntr.Enabled ) );

      datm_manut_proc.qryTpEmbalagemInttra.Open;
    end;

    if ( pgctrl_manut_proc.ActivePage = ts_nf ) then
       btn_mi( ( st_incluir and ts_nf.Enabled ), False, False, ( st_excluir and ts_nf.Enabled ) );

    if ( pgctrl_manut_proc.ActivePage = ts_estufagem ) and ( pgctrlEstufagem.ActivePage = ts_carga_solta ) then
       btn_mi( ( st_incluir and ts_carga_solta.Enabled ), False, False, ( st_excluir and ts_carga_solta.Enabled ) );

    if ( pgctrl_manut_proc.ActivePage = ts_licenca_importacao) then
       btn_mi( ( st_incluir and ts_licenca_importacao.Enabled ), False, False, ( st_excluir and ts_licenca_importacao.Enabled ) );

    if ( pgctrl_manut_proc.ActivePage = ts_despacho_imp ) then
    begin
      qry_existe_di_.Close;
      qry_existe_di_.Open;
      qry_tp_dta_.Close;
      qry_tp_dta_.Open;
      qry_existe_da_.Close;
      qry_existe_da_.Open;
      if tbl_doc_instr_emb_.state in [dsInactive] then
        tbl_doc_instr_emb_.open;

      if (qry_existe_di_EXISTEDI.AsInteger > 0) or (qry_existe_da_EXISTEDA.AsInteger > 0) then
      //if ((qry_existe_di_EXISTEDI.AsInteger > 0) and (Trim(qry_existe_di_NR_DECLARACAO_IMP.AsString) <> '')) or (qry_existe_da_EXISTEDA.AsInteger > 0) then
        btn_mi( False, False, False, False )
      else
        btn_mi( st_incluir, False, False, st_excluir );

      dbgrid_exportador.ReadOnly := ((qry_existe_di_EXISTEDI.AsInteger > 0) and (Trim(qry_existe_di_NR_DECLARACAO_IMP.AsString) <> ''));
      dbgrid_fabricante.ReadOnly := ((qry_existe_di_EXISTEDI.AsInteger > 0) and (Trim(qry_existe_di_NR_DECLARACAO_IMP.AsString) <> ''));

      qryRetificaDI.Close;
      qryRetificaDI.ParamByName('NR_PROCESSO').AsString := qry_processo_NR_PROCESSO.AsString;
      qryRetificaDI.Open;

      if datm_manut_proc.qry_processo_CD_DUIMP.AsString <> '' then
        datm_manut_proc.qry_processo_NR_DI.EditMask := '';

      dbchkIN_TRANSMITE_SEM_PREVISAO.ReadOnly := str_cd_cargo <> '001';
    end;

    if ( pgctrl_manut_proc.ActivePage = ts_despacho_exp ) then
    begin
      qry_proc_exp_.Close;
      qry_proc_exp_.ParamByName('NR_PROCESSO').AsString := qry_processo_NR_PROCESSO.AsString;
      qry_proc_exp_.Open;

      if qry_proc_exp_.RecordCount = 0 then
        btn_mi( st_incluir, False, False, st_excluir )
      else
        btn_mi( False, False, False, False );

      qry_proc_exp_.Close;

      qry_importador_.Close;
      qry_importador_.ParamByName('NR_PROCESSO').AsString := qry_processo_NR_PROCESSO.AsString;
      qry_importador_.Open;

      //Abas RE e NF só aparecerão para processos abertos antes de 07/07/2007 - desativado após essa data (kleber)
      ts_re.TabVisible     :=  qry_processo_DT_ABERTURA.AsDateTime < StrToDate('12/07/2007');
      ts_dde_nf.TabVisible := ts_re.TabVisible;

      if ts_re.TabVisible then
        pgctrl_despacho_exp.ActivePageIndex := 0
      else
        pgctrl_despacho_exp.ActivePageIndex := 2;

      if not dbchb_dse.Checked then
      begin
        if not ((str_cd_cargo = '099') or (str_cd_cargo = '001')) then
        begin
          dbedt_nr_dde.ReadOnly := True;
        end
        else
          dbedt_nr_dde.ReadOnly := False;
      end
      else
        dbedt_nr_dde.ReadOnly := False;

    end;

    if ( pgctrl_manut_proc.ActivePage = ts_reg_exp ) then
    begin
      btn_mi( st_incluir, False, False, st_excluir );
      qry_exp_re_.Close;
      qry_exp_re_.ParamByName('NR_PROCESSO').AsString := qry_processo_NR_PROCESSO.AsString;
      qry_exp_re_.Open;

      if datm_manut_proc.qry_exp_re_.IsEmpty then
        pnl_ref_Re.Enabled := False
      else
        pnl_ref_Re.Enabled := True;
    end;

    VerCamposDI;

    if ( pgctrl_manut_proc.ActivePage = ts_lista ) and ( nbDadosBasicos.ActivePage = 'DadosBasicos' )  then
    begin
      // Abre cliente x habilitacao
    {  qry_cliente_habilitacao_.Close;
      qry_cliente_habilitacao_.ParamByName('CD_CLIENTE').AsString  := Trim( dbedt_cd_cliente.Text );
      qry_cliente_habilitacao_.ParamByName('CD_UNID_NEG').AsString := Trim( msk_cd_unid_neg.Text );
      qry_cliente_habilitacao_.ParamByName('CD_PRODUTO').AsString  := Trim( msk_cd_produto.Text );
      qry_cliente_habilitacao_.Open;
     }

     { if Not qry_cliente_habilitacao_.EOF then
      begin
        if qry_cliente_habilitacao_IN_OBS_UNICA.AsString = '0' then
        begin
          dbmemo_obs.ReadOnly := False;
          dbmemo_obs.Color    := clWindow;
          dbmemo_obs.TabStop  := True;
        end
        else
        begin
          dbmemo_obs.ReadOnly := True;
          dbmemo_obs.Color    := clMenu;
          dbmemo_obs.TabStop  := False;
        end;
      end;
//      qry_cliente_habilitacao_.Close; by Carlos em 25/03/2010   estava ocultando o nome do atendende
      }

      if Trim( msk_cd_produto.Text ) = '10' then
      begin
       // dbedt_look_nm_pend.Width := 97;
        
        with datm_manut_proc do
        begin
          qry_proc_em_.Close;
          qry_proc_em_.Open;
        end;
      end
      else
      begin
       // dbedt_look_nm_pend.Width := 313;
        lbl_agente.Visible       := False;
        dbedt_cd_agente.Visible  := False;
        edt_nm_agente.Visible    := False;
        btn_agente.Visible       := False;
      end;
    end;

    // Nota Fiscal
    if pgctrl_manut_proc.ActivePage = ts_nf then
    begin
      btnNotaFiscal.Visible := (nbNotaFiscal.ActivePage = 'I');
      if nbNotaFiscal.ActivePage = 'I' then
      begin
        with qry_processo_nf_ do
        begin
          Close;
          ParamByName('NR_PROCESSO').Value := qry_processo_NR_PROCESSO.Value;
          Open;
          VerNF;
        end;
      end
      else
      begin
        qry_exp_re_.Close;
        qry_exp_re_.ParamByName('NR_PROCESSO').AsString := qry_processo_NR_PROCESSO.AsString;
        qry_exp_re_.Open;

        with qry_exp_nf_ do
        begin

          Close;
          ParamByName('NR_PROCESSO').Value := qry_processo_NR_PROCESSO.Value;
          Open;
          VerNF;
        end;
      end;
    end
    else
    begin
      qry_processo_nf_.Close;
      qry_exp_nf_.Close;
    end;

    // Despacho Importação
    if pgctrl_manut_proc.ActivePage = ts_despacho_imp then
    begin
      pgctrl_despacho_imp.ActivePage := ts_doctos_imp;
      // Importação Fatura
      qry_Doctos_Inst.Close;
      qry_Doctos_Inst.ParamByName('NR_PROCESSO').AsString := qry_processo_NR_PROCESSO.AsString;
      qry_Doctos_Inst.Open;
      // Importação Controle/Prazos EADI
      qry_contr_imp_.Close;
      qry_contr_imp_.ParamByName('NR_PROCESSO').AsString :=  qry_processo_NR_PROCESSO.AsString;
      qry_contr_imp_.Open;
      // Exportador
      qry_exportador_.Close;
      qry_exportador_.ParamByName('NR_PROCESSO').AsString :=  qry_processo_NR_PROCESSO.AsString;
      qry_exportador_.Open;
      // Fabricante
      qry_fabricante_.Close;
      qry_fabricante_.ParamByName('NR_PROCESSO').AsString :=  qry_processo_NR_PROCESSO.AsString;
      qry_fabricante_.Open;
      // Nota Fiscal
      qry_processo_armazenagem_.Close;
      qry_processo_armazenagem_.ParamByName('NR_PROCESSO').AsString := qry_processo_NR_PROCESSO.AsString;
      qry_processo_armazenagem_.Open;

      VerDespachoImp;
    end;

    // Despacho Exportação
    if pgctrl_manut_proc.ActivePage = ts_despacho_exp then
    begin
      // Exportação RE
      qry_processo_re_.Close;
      qry_processo_re_.ParamByName('NR_PROCESSO').AsString := qry_processo_NR_PROCESSO.AsString;
      qry_processo_re_.Open;
      // Exportação DDE Nota Fiscal
      qry_dde_nf_.Close;
      qry_dde_nf_.ParamByName('NR_PROCESSO').AsString := qry_processo_NR_PROCESSO.asString;
      qry_dde_nf_.Open;
      // Exportação Fatura
      qry_Doctos_Inst.Close;
      qry_Doctos_Inst.ParamByName('NR_PROCESSO').AsString := qry_processo_NR_PROCESSO.AsString;
      qry_Doctos_Inst.Open;
      // Exportação Importador
      qry_importador_.Close;
      qry_importador_.ParamByName('NR_PROCESSO').AsString := qry_processo_NR_PROCESSO.AsString;
      qry_importador_.Open;
      VerDespachoExp;
    end;

    // Licença de Importação - L.I.
    if pgctrl_manut_proc.ActivePage = ts_licenca_importacao then
    begin
      //Lista L.I.'s processo
      qry_li_.Close;
      qry_li_.ParamByName('NR_PROCESSO').AsString := qry_processo_NR_PROCESSO.AsString;
      qry_li_.Open;
      // Orgãos Anuentes
      qry_orgao_anuente_.Close;
      qry_orgao_anuente_.Open;

      qry_li_orgao_anuente_.Close;
      qry_li_orgao_anuente_.ParamByName('NR_PROCESSO').AsString := qry_li_NR_PROCESSO.AsString;
      qry_li_orgao_anuente_.ParamByName('NR_LI').AsString       := qry_li_NR_LI.AsString;
      qry_li_orgao_anuente_.Open;
      //
      VerLI;

    end;

    // DBNAVIGATOR
    dbnvg.Enabled := ( ( pgctrl_manut_proc.ActivePage <> ts_lista   ) and
                       ( pgctrl_manut_proc.ActivePage <> ts_imp_mar ) and
                       ( pgctrl_manut_proc.ActivePage <> ts_exp_mar ) and
                       ( pgctrl_manut_proc.ActivePage <> ts_obs     ) );

    if ( pgctrl_manut_proc.ActivePage = ts_ref ) then
      dbnvg.DataSource := ds_ref_cliente;
    if ( pgctrl_manut_proc.ActivePage = ts_embalagem ) then
      dbnvg.DataSource := ds_proc_embalagem;
    if ( pgctrl_manut_proc.ActivePage = ts_cntr ) then
      dbnvg.DataSource := ds_proc_cntr;
    if ( pgctrl_manut_proc.ActivePage = ts_carga_solta ) then
      dbnvg.DataSource := ds_proc_carga_solta;
    if ( pgctrl_manut_proc.ActivePage = ts_nf ) then
      dbnvg.DataSource := ds_processo_nf;
    if ( pgctrl_manut_proc.ActivePage = ts_licenca_importacao ) then
      dbnvg.DataSource := ds_li;

    if ( pgctrl_manut_proc.ActivePage = ts_despacho_imp ) then
    begin
      if ( pgctrl_despacho_imp.ActivePage = ts_doctos_imp ) then
        dbnvg.DataSource := ds_Doctos_Inst;
      if ( pgctrl_despacho_imp.ActivePage = ts_contr_imp ) then
        dbnvg.DataSource := ds_contr_imp;
      if ( pgctrl_despacho_imp.ActivePage = ts_exportador ) then
        dbnvg.DataSource := ds_exportador;
      if ( pgctrl_despacho_imp.ActivePage = ts_Retificacoes ) then
        dbnvg.DataSource := dtsRetificaDi;
    end;

    if ( pgctrl_manut_proc.ActivePage = ts_despacho_exp ) then
    begin
      if ( pgctrl_despacho_exp.ActivePage = ts_re ) then
        dbnvg.DataSource := ds_processo_re;
      if ( pgctrl_despacho_exp.ActivePage = ts_dde_nf ) then
        dbnvg.DataSource := ds_dde_nf;
      if ( pgctrl_despacho_exp.ActivePage = ts_fat_exp ) then
        btn_mi( st_incluir, False, False, st_excluir );      
        dbnvg.DataSource := ds_Doctos_Inst;
    end;

    if (pgctrl_manut_proc.ActivePage = ts_Draft ) then
    begin
      Habilita_Btn_Draft(1);
      Habilita_Btn_Draft(2);
      Habilita_Btn_Draft(3);
    end;
  end;

  datm_manut_proc.vAlterouDadosFrete := False;
end;

procedure Tfrm_manut_proc.TornaVisivelTabSheet;
var
vTipo_processo:string;
begin
//Pega os dois primeiro caracter do n° do porcesso para verificação (Andressa 26/10/2010)
  vTipo_processo:=Copy((msk_nr_processo.Text), 1, Pred(Pos('-', (msk_nr_processo.Text))));
  with datm_manut_proc do
  begin
    ts_ref.TabVisible       := True;
    ts_obs.TabVisible       := True;
    btn_di_proc_exp.Visible := ( ( msk_cd_produto.Text = '01' ) or ( msk_cd_produto.Text = '02' ) );
    mi_di_proc_exp.Visible  := ( ( msk_cd_produto.Text = '01' ) or ( msk_cd_produto.Text = '02' ) );

   // btnDue.Visible     := ( msk_cd_produto.Text = '02' );
    btnDraftBl.visible := ( msk_cd_produto.Text = '02' );

    // se for importação
    if ( msk_cd_produto.Text = '01' ) or ( msk_cd_produto.Text = '03' ) then
    begin
      // exp
      ts_exp_mar.TabVisible      := False;
      ts_despacho_exp.TabVisible := False;
      ts_Draft.TabVisible        := False;
      ts_reg_exp.tabVisible      := false;
      // imp
      ts_imp_mar.TabVisible      := True;
      ts_licenca_importacao.TabVisible := True;
      ts_despacho_imp.TabVisible := True;

      if msk_cd_produto.Text = '01' then // desembaraço
      begin
        mi_di_proc_exp.Caption  := '&Declaração de Importação';
        btn_di_proc_exp.Hint    := 'Declaração de Importação';
        mi_di_proc_exp.ShortCut := ShortCut(VK_F4,[]);
      end;

      
      // verificando via de transporte
      if qry_processo_LookViaTransporte.AsString = '01' then // importação maritima
      begin
        nbImportacao.ActivePage := 'M';
        AtivaAlertaDesembaracoSobreAguas(dbchbIN_DESEMBARACO_SOBRE_AGUAS_M,shpDemb_M);
      end
      else
      if (qry_processo_LookViaTransporte.AsString = '10') and  ((trim(vTipo_processo)) = 'TD') then //Verifica se o processo é TD e sem definiçao de transporte para ativar a aba importação maritima(Andressa 26/10/2010)
      begin
        nbImportacao.ActivePage := 'M';
        AtivaAlertaDesembaracoSobreAguas(dbchbIN_DESEMBARACO_SOBRE_AGUAS_M,shpDemb_M);
      end
      else
      if qry_processo_LookViaTransporte.AsString = '04' then //importação aerea
      begin
        nbImportacao.ActivePage := 'A';
        AtivaAlertaDesembaracoSobreAguas(dbchbIN_DESEMBARACO_SOBRE_AGUAS_A,shpDemb_A);
      end
      else
      if qry_processo_LookViaTransporte.AsString = '06' then //importação ferroviaria
      begin
        nbImportacao.ActivePage := 'F';
        AtivaAlertaDesembaracoSobreAguas(dbchbIN_DESEMBARACO_SOBRE_AGUAS_F,shpDemb_F);
      end
      else
      if qry_processo_LookViaTransporte.AsString = '07' then //importação rodoviaria
      begin
        nbImportacao.ActivePage := 'R';
        AtivaAlertaDesembaracoSobreAguas(dbchbIN_DESEMBARACO_SOBRE_AGUAS_R,shpDemb_R);
      end;

      qry_proc_im_.Close;
      qry_proc_im_.Open;
      vEmbarcacaoOld := qry_proc_im_CD_EMBARCACAO.AsString;
      vConhecimentoOld := qry_proc_im_NR_CONHECIMENTO.AsString;
    end;
    // se for Exportação
    if ( Trim(frm_manut_proc.msk_cd_produto.Text) = '02' ) or ( Trim(frm_manut_proc.msk_cd_produto.Text) = '10' )  then
    begin
      // imp
      ts_imp_mar.TabVisible      := False;
      ts_licenca_importacao.TabVisible := False;
      ts_despacho_imp.TabVisible := False;
      // exp
      ts_exp_mar.TabVisible      := True;
      ts_despacho_exp.TabVisible := True;
      ts_Draft.TabVisible        := True;
      ts_reg_exp.tabVisible      := true;      

      if msk_cd_produto.Text = '02' then // desembaraço
      begin
        mi_di_proc_exp.Caption  := 'Processo de &Exportação';
        btn_di_proc_exp.Hint    := 'Processo de Exportação';
        mi_di_proc_exp.ShortCut := ShortCut(Word('E'),[ssCtrl]);
      end;
      if msk_cd_produto.Text = '10' then // NVOCC
      begin
        mi_di_proc_exp.Caption  := 'NVOCC &Exportação';
        btn_di_proc_exp.Hint    := 'NVOCC Exportação';
        mi_di_proc_exp.ShortCut := ShortCut(Word('E'),[ssCtrl]);
      end;

      // verificando via de transporte
      if qry_processo_LookViaTransporte.AsString = '01' then //exportação maritima
        nbExportacao.ActivePage := 'M'
      else
      if qry_processo_LookViaTransporte.AsString = '04' then //exportação aerea
        nbExportacao.ActivePage := 'A'
      else
      if qry_processo_LookViaTransporte.AsString = '06' then //exportação ferroviaria
        nbExportacao.ActivePage := 'F'
      else
      if qry_processo_LookViaTransporte.AsString = '07' then //exportação rodoviaria
        nbExportacao.ActivePage := 'R';

      qry_proc_em_.Close;
      qry_proc_em_.Open;

      //
      if BloqueiaProcExp(msk_cd_unid_neg.Text+msk_cd_produto.Text+msk_nr_processo.Text) = True then
         begin
           {dbedt_cd_pais_origem_em.Enabled    := False;
           dbedt_cd_pais_origem_em.Color      := clMenu;
           dbedt_cd_local_emb_em.Enabled      := False;
           dbedt_cd_local_emb_em.Color        := clMenu;
           dbedt_cd_local_desemb_em.Enabled   := False;
           dbedt_cd_local_desemb_em.Color     := clMenu;
           dbedt_cd_pais_dest_em.Enabled      := False;
           dbedt_cd_pais_dest_em.Color        := clMenu;
           dbedt_cd_moeda_mle_em.Enabled      := False;
           dbedt_cd_moeda_mle_em.Color        := clMenu;
           dbedt_cd_agente_em.Enabled         := False;
           dbedt_cd_agente_em.Color           := clMenu;
           dbedt_vl_frete_prepaid_em.Enabled  := False;
           dbedt_vl_frete_prepaid_em.Color    := clMenu;
           dbedt_mle_mneg_em.Enabled          := False;
           dbedt_mle_mneg_em.Color            := clMenu;
           dbedt_mle_mn_em.Enabled            := False;
           dbedt_mle_mn_em.Color              := clMenu;
           dbedt_vl_cif_mn_em.Enabled         := False;
           dbedt_vl_cif_mn_em.Color           := clMenu;
           dbedt_vl_peso_bruto_em.Enabled     := False;
           dbedt_vl_peso_bruto_em.Color       := clMenu;
           dbedt_vl_peso_liquido_em.Enabled   := False;
           dbedt_vl_peso_liquido_em.Color     := clMenu;
           dbedt_cd_importador_em.Enabled     := False;
           dbedt_cd_importador_em.Color       := clMenu;
           dbedt_cd_moeda_frete_em.Enabled    := False;
           dbedt_cd_moeda_frete_em.Color      := clMenu;
           dbedt_cd_incoterm.Enabled          := False;
           dbedt_cd_incoterm.Color            := clMenu;
           dbedt_cd_lingua.Enabled            := False;
           dbedt_cd_lingua.Color              := clMenu;
           btn_co_local_emb_em.Visible        := False;
           }

        end;

      // Foi acrescentado abaixo, mas é desnecessário, já que a tabela qry_proc_em_ também traz os campos - Michel - 18/04/2012
      {//Abrindo essa query para acrescentar o transporte também para os processos de exportação (Produtos 3 e 10) FERNANDA 01/02/12 (O_00912/12 Carolina Regazzo)
      qry_proc_im_.Close;          // Usadas no Transporte de importação (Usei como referência)
      qry_proc_im_.Open;}


    end;
    //habilita nota fiscal - comentado, pq agora as NFs de exportação tbm serão na manutenção !
//    ts_nf.TabVisible          := Trim( msk_cd_produto.Text ) <> '02';

  end;
end;

procedure Tfrm_manut_proc.btn_salvarClick(Sender: TObject);
var vNrRE: string[12];
begin
  if not Consiste then
    Exit;

  if pgctrl_manut_proc.ActivePage = ts_ref then
    if CmbItens.Text = '' then
      CmbItens.Text := '0000';

  if pgctrl_manut_proc.ActivePage = ts_reg_exp then
  begin
    vNrRe := datm_manut_proc.qry_exp_re_NR_RE.AsString;
    datm_manut_proc.qry_exp_re_.Post;
    datm_manut_proc.qry_exp_re_.Close;
    datm_manut_proc.qry_exp_re_.ParamByName('NR_PROCESSO').AsString := datm_manut_proc.qry_processo_NR_PROCESSO.AsString;
    datm_manut_proc.qry_exp_re_.Open;
    datm_manut_proc.qry_exp_re_.Locate('NR_RE', vNrRE, []);
    btn_mi(st_incluir, False, False, st_excluir )
  end
  else
  if pgctrl_manut_proc.ActivePage = ts_embalagem then
  begin
    if not GravaEmbalagem then
      Exit;
  end
  else
  if pgctrl_manut_proc.ActivePage = ts_ref then
  begin
{  comentado by Carlos - 24/08/2011 (o tipo ORDEM pode ser repetido em outros processos )
   if datm_manut_proc.qry_ref_cliente_TP_REFERENCIA.AsString = '02' then begin
      if VerifRefOrdemRepetida then begin
        MessageDlg('Essa Referência já existe em outro processo.', mtError, [mbOK], 0);
        pgctrl_manut_proc.ActivePage := ts_ref;
        dblck_tp_referencia.SetFocus;
        Exit;
      end;
   end;
}
    if not GravaRef then
      Exit;
  end
  else
  if ( pgctrlEstufagem.ActivePage = ts_cntr ) and ( pgctrl_manut_proc.ActivePage = ts_estufagem ) then
  begin
    if vAlterouProcVinc then
      if not Grava then
        Exit;
    if Not GravaCntr then
      Exit;
    if datm_manut_proc.vAlterouDadosFrete then
      VerificaFrete(true);
  end
  else
  if ( pgctrlEstufagem.ActivePage = ts_carga_solta ) and ( pgctrl_manut_proc.ActivePage = ts_estufagem ) then
  begin
    if Not GravaCargaSolta then
      Exit;
    if datm_manut_proc.vAlterouDadosFrete then
      VerificaFrete(true);
  end
  else if pgctrl_manut_proc.ActivePage = ts_nf then
  begin
    if Not GravaNF then
      Exit;
  end
  else if pgctrl_manut_proc.ActivePage = ts_licenca_importacao then
  begin
    if Not GravaLI then
      Exit;
  end
  else if pgctrl_manut_proc.ActivePage = ts_despacho_imp then
  begin
    if Not GravaDespachoImp then
      Exit;
  end
  else if pgctrl_manut_proc.ActivePage = ts_despacho_exp then
  begin
    if Not GravaDespachoExp then
      Exit;
  end
  else
  {if pgctrl_manut_proc.ActivePage = ts_Draft then
  begin
    if not GravaDraft then
      Exit;
  end
  else }
  begin
    if Not Grava then
      Exit;
    if datm_manut_proc.vAlterouDadosFrete then
      VerificaFrete(true);
  end;
end;

procedure Tfrm_manut_proc.btn_cancelarClick(Sender: TObject);
begin
  Cancelar;
end;

procedure Tfrm_manut_proc.Cancelar;
begin
  try
    with datm_manut_proc do
    begin
      if pgctrl_manut_proc.ActivePage = ts_reg_exp then
      begin
        qry_exp_re_.Cancel;

        if datm_manut_proc.qry_exp_re_.IsEmpty then
          pnl_ref_Re.Enabled := False
        else
          pnl_ref_Re.Enabled := True;
      end
      else
      if (pgctrl_manut_proc.ActivePage = ts_ref) and
         (qry_ref_cliente_.State in [dsInsert, dsEdit]) then
      begin
        qry_ref_cliente_.Cancel;
        dbg_normal.Enabled := True;
        VerRefCliente;
      end
      else
      if (pgctrl_manut_proc.ActivePage = ts_embalagem) and
      (qry_proc_embalagem_.State in [dsInsert, dsEdit]) then
      begin
        qry_proc_embalagem_.Cancel;
        VerEmbalagem;
      end
      else
      if ( pgctrlEstufagem.ActivePage = ts_cntr ) and
         ( pgctrl_manut_proc.ActivePage = ts_estufagem ) and
         (qry_proc_cntr_.State in [dsInsert, dsEdit]) then
      begin
        qry_proc_cntr_.Cancel;
        VerCntr;
      end
      else
      if ( pgctrlEstufagem.ActivePage   = ts_carga_solta ) and
         ( pgctrl_manut_proc.ActivePage = ts_estufagem )   and
         (qry_proc_carga_solta_.State in [dsInsert, dsEdit]) then
      begin
        qry_proc_carga_solta_.Cancel;
        VerCargaSolta;
      end
      else
      if (pgctrl_manut_proc.ActivePage = ts_nf) and (qry_processo_nf_.State in [dsInsert, dsEdit]) then
      begin
        if qry_processo_nf_.State in [dsInsert,dsEdit] then
          qry_processo_nf_.Cancel;

        if qry_exp_nf_.State in [dsInsert,dsEdit] then
          qry_exp_nf_.Cancel;

        VerNF;
        dbgrdProcessoNF.Enabled := True;
        dbg_nf.Enabled          := True;
      end
      else
      if pgctrl_manut_proc.ActivePage = ts_despacho_exp then
      begin
        if (pgctrl_despacho_exp.ActivePage = ts_re) and (qry_processo_re_.State in [dsInsert, dsEdit]) then
        begin
          qry_processo_re_.Cancel;
          VerDespachoExp;
        end
        else
        if (pgctrl_despacho_exp.ActivePage = ts_dde_nf) and (qry_dde_nf_.State in [dsInsert, dsEdit]) then
        begin
          qry_processo_re_.Cancel;
          VerDespachoExp;
        end
        else
        if (pgctrl_despacho_exp.ActivePage = ts_fat_exp) and (qry_Doctos_Inst.State in [dsInsert, dsEdit]) then
        begin
          qry_Doctos_Inst.Cancel;
          VerDespachoExp;
        end;
        
        if qry_processo_.State in [dsEdit] then
          qry_processo_.Cancel;
      end
      else
      if pgctrl_manut_proc.ActivePage = ts_despacho_imp then
      begin
        // Exportador
        if (pgctrl_despacho_imp.ActivePage = ts_exportador) and (qry_exportador_.State in [dsEdit, dsInsert]) then
        begin
          qry_exportador_.Cancel;
          VerDespachoImp;
        end
        else
        // Fabricante
        if (pgctrl_despacho_imp.ActivePage = ts_fabricante) and (qry_fabricante_.State in [dsEdit, dsInsert]) then
        begin
          qry_fabricante_.Cancel;
          VerDespachoImp;
        end
        else
        if (pgctrl_despacho_imp.ActivePage = ts_doctos_imp) and (qry_Doctos_Inst.State in [dsInsert, dsEdit]) then
        begin
          qry_Doctos_Inst.Cancel;
          VerDespachoImp;
        end
        else
        if (pgctrl_despacho_imp.ActivePage = ts_contr_imp) and (qry_contr_imp_.State in [dsInsert, dsEdit]) then
        begin
          qry_contr_imp_.Cancel;
          VerDespachoImp;
        end
        else
        if (qry_processo_.State in [dsInsert, dsEdit]) then
        begin
          qry_processo_.Cancel;
          VerDespachoImp;
        end;
      end
      else
      if pgctrl_manut_proc.ActivePage = ts_licenca_importacao then
      begin
        if qry_li_.State in [dsInsert, dsEdit] then
        begin
          qry_li_.Cancel;
          VerLI;
        end;

        if qry_li_orgao_anuente_.State in [dsInsert, dsEdit] then
        begin
          qry_li_orgao_anuente_.Cancel;
          VerLI;
        end;
      end
      else
      begin
        if qry_processo_.State in [dsEdit] then
          qry_processo_.Cancel;

        if qry_proc_im_.State in [dsEdit]  then
          qry_proc_im_.Cancel;

        if qry_proc_em_.State in [dsEdit]  then
          qry_proc_em_.Cancel;

        if qry_re_.State in [dsEdit]       then
          qry_re_.Cancel;

        if qry_di_.State in [dsEdit]       then
          qry_di_.Cancel;
      end;
    end;
  except
    BoxMensagem( 'Erro - cancelamento da operação. Tente cancelar novamente.', 2 );
  end;
  if ( pgctrl_manut_proc.ActivePage = ts_ref ) or
     ( pgctrl_manut_proc.ActivePage = ts_cntr ) or
     ( pgctrl_manut_proc.ActivePage = ts_estufagem ) or
     ( pgctrl_manut_proc.ActivePage = ts_nf ) or
     ( pgctrl_manut_proc.ActivePage = ts_licenca_importacao ) or
     ( pgctrl_manut_proc.ActivePage = ts_despacho_imp ) or
     ( pgctrl_manut_proc.ActivePage = ts_despacho_exp ) or
     ( pgctrl_manut_proc.ActivePage = ts_reg_exp ) then
    btn_mi(st_incluir, False, False, st_excluir)
  else
    btn_mi(False, False, False, False);
end;

procedure Tfrm_manut_proc.dbnvgBeforeAction(Sender: TObject; Button: TNavigateBtn);
begin
  datm_manut_proc.qry_processo_.Cancel;
  datm_manut_proc.qry_li_.Cancel;
  datm_manut_proc.qry_Doctos_Inst.Cancel;
  datm_manut_proc.qry_contr_imp_.Cancel;
  datm_manut_proc.qry_re_.Cancel;
  if ( pgctrl_manut_proc.ActivePage <> ts_ref ) and
     ( pgctrl_manut_proc.ActivePage <> ts_cntr ) and
     ( pgctrl_manut_proc.ActivePage <> ts_carga_solta ) and
     ( pgctrl_manut_proc.ActivePage <> ts_embalagem ) and
     ( pgctrl_manut_proc.ActivePage <> ts_nf ) and
     ( pgctrl_manut_proc.ActivePage <> ts_licenca_importacao ) and
     ( pgctrl_manut_proc.ActivePage <> ts_despacho_imp ) and
     ( pgctrl_manut_proc.ActivePage <> ts_despacho_exp ) then
    btn_mi(False, False, False, False);
end;

function Tfrm_manut_proc.Grava : Boolean;
var
    vQueryDI: TQuery;
begin
  with datm_manut_proc do
  begin
    try
      datm_main.db_broker.StartTransaction;

      CloseStoredProc(sp_atz_arm_di);
      sp_atz_arm_di.ParamByName('@NR_PROCESSO').AsString      := qry_proc_im_NR_PROCESSO.AsString;
      sp_atz_arm_di.ParamByName('@CD_AMZ_ATRACACAO').AsString := qry_proc_im_CD_ARMAZEM_ATRACACAO.AsString;
      sp_atz_arm_di.ParamByName('@CD_AMZ_DESCARGA').AsString  := qry_proc_im_CD_ARMAZEM_DESCARGA.AsString;
      ExecStoredProc(sp_atz_arm_di);
      CloseStoredProc(sp_atz_arm_di);
      // Grava processo, di, li, fat e re

      if ( qry_processo_.State in [dsEdit] ) then
      begin
        if (nbExportacao.ActivePage = 'R') and (pgctrl_manut_proc.ActivePage = ts_exp_mar) then
        begin
          qry_taxa_cambio_.Close;
          qry_taxa_cambio_.ParamByName( 'DT_VIGENCIA' ).AsDateTime := qry_processo_DT_ABERTURA.AsDateTime;
          qry_taxa_cambio_.ParamByName( 'CD_MOEDA' ).AsString      := Trim( dbedt_cd_moeda_mle_er.Text );
          qry_taxa_cambio_.Open;
          if Not qry_taxa_cambio_.EOF then
            qry_proc_em_VL_MLE_MN.AsFloat := ( qry_taxa_cambio_TX_CAMBIO.AsFloat * qry_proc_em_VL_MLE_MNEG.AsFloat );
          qry_taxa_cambio_.Close;
        end;

        qry_processo_CD_GRUPO.AsString  := FastLookup( 'TEMPRESA_NAC', qry_processo_CD_CLIENTE, 'CD_EMPRESA', 'CD_GRUPO', '' );
        qry_processo_.Post;

        if vClientePreenchido <> qry_processo_CD_CLIENTE.AsString then
        begin
          vClientePreenchido := qry_processo_CD_CLIENTE.AsString;
          if MessageDlg('Deseja alterar o cliente na DI ?', mtConfirmation, [mbYes, mbNo], 0) = mrYes then
          begin
            vQueryDI := TQuery.Create(Application);
            try

              vQueryDI.DatabaseName := 'DBBROKER';
              vQueryDI.SQL.Clear;
              vQueryDI.SQl.Add('UPDATE TDECLARACAO_IMPORTACAO SET CD_IMPORTADOR = ''' + qry_processo_CD_CLIENTE.AsString + ''' WHERE NR_PROCESSO = ''' + qry_processo_NR_PROCESSO.AsString + '''');
              vQueryDI.ExecSQL;
            finally
              vQueryDI.free;
            end;
          end;
        end;
      end;
      with TQuery.Create(Application) do
      begin
        DatabaseName := 'DBBROKER'; SQL.Clear;
        SQl.Add('UPDATE DI');
        SQl.Add('   SET DT_CHEGADA_CARGA = RIGHT( ''00'' + CONVERT(VARCHAR,DATEPART(DAY,VI.DT_ENT)),2) + RIGHT( ''00'' + CONVERT(VARCHAR,DATEPART(MONTH,VI.DT_ENT)),2) + RIGHT( ''0000'' + CONVERT(VARCHAR,DATEPART(YEAR,VI.DT_ENT)),4),');
        SQl.Add('       DT_EMBARQUE      = ''' + FormatDateTime('ddmmyyyy', qry_proc_im_DT_CONHECIMENTO.AsDateTime) + '''');
        SQl.Add('  FROM TVIAGEM VI (NOLOCK), TDECLARACAO_IMPORTACAO DI (NOLOCK)');
        SQl.Add('  WHERE DI.NR_PROCESSO = ''' + qry_processo_NR_PROCESSO.AsString + '''');
        SQl.Add('   AND VI.CD_UNID_NEG = ''' + IfThen(msk_cd_unid_neg.text = '07', '01', msk_cd_unid_neg.text) + '''');
        SQl.Add('   AND VI.CD_PRODUTO  = ''' + msk_cd_produto.text + '''');
        SQl.Add('   AND VI.CD_EMBARCACAO = ''' + dbedt_cd_embarc_im.Text + '''');
        SQl.Add('   AND VI.NR_VIAGEM = ''' + dbedt_nr_viagem_im.Text + '''');
        ExecSQL; Free;
      end;

      if ( qry_Doctos_Inst.State in [dsInsert,dsEdit]) then qry_Doctos_Inst.Post;
      if ( qry_contr_imp_.State  in [dsInsert,dsEdit]) then qry_contr_imp_.Post;
      if ( qry_re_.State         in [dsInsert,dsEdit]) then qry_re_.Post;
      if ( qry_di_.State         in [dsEdit])          then qry_di_.Post;

      if ( qry_proc_im_.State in [dsEdit]) then
      begin

        if vEmbarcacaoOld <> dbedt_cd_embarc_im.Text then
        begin
          vEmbarcacaoOld := dbedt_cd_embarc_im.Text;
          vQueryDI := TQuery.Create(Application);
          try
            vQueryDI.DatabaseName := 'DBBROKER';
            vQueryDI.SQL.Clear;
            vQueryDI.SQl.Add('UPDATE TDECLARACAO_IMPORTACAO SET CD_VEICULO_TRANSP = ' + QuotedStr(dbedt_cd_embarc_im.Text) + ', NM_VEICULO_TRANSP = ' + QuotedStr(dbedt_nm_embarc_im.text) + '  WHERE ');
            vQueryDI.SQl.Add('NR_PROCESSO = ' + QuotedStr(qry_processo_NR_PROCESSO.AsString));
            vQueryDI.ExecSQL;
          finally
            vQueryDI.Free;
          end;
        end;

        if vConhecimentoOld <> dbedt_nr_conh_im.text then
        begin
          vConhecimentoOld := dbedt_nr_conh_im.text;
          vQueryDI := TQuery.Create(Application);
          try
            vQueryDI.DatabaseName := 'DBBROKER';
            vQueryDI.SQL.Clear;
            vQueryDI.SQl.Add('UPDATE TDECLARACAO_IMPORTACAO SET NR_DCTO_CARGA = ' + QuotedStr(dbedt_nr_conh_im.text) + ' WHERE NR_PROCESSO = ' + QuotedStr(qry_processo_NR_PROCESSO.AsString));
            vQueryDI.ExecSQL;
          finally
            vQueryDI.Free;
          end;
        end;

        qry_proc_im_.Post;

      end;

      if ( qry_proc_em_.State in [dsEdit]) then
        qry_proc_em_.Post;

      if (pgctrl_manut_proc.ActivePage = ts_exp_mar) and (nbExportacao.ActivePage = 'M' )  then
      begin
        //Andressa- atualizar as datas dos deadlines,pois apenas com a trigger ás vezes não atualizava
        CloseStoredProc(sp_atualiza_deadline);
        sp_atualiza_deadline.ParamByName('@NR_PROCESSO').AsString := qry_processo_NR_PROCESSO.AsString;
        ExecStoredProc(sp_atualiza_deadline);
        CloseStoredProc(sp_atualiza_deadline);
      end;

//      if vAlterouServico then
      {by carlos - 15/07/2011 - caso mude o serviço executar a sp_muda_servico }
      //if (cd_servico_proc<>dbedt_cd_servico.Text) then
      if (qry_processo_CD_SERVICO.OldValue <> qry_processo_CD_SERVICO.NewValue) or (qry_processo_CD_SERVICO.OldValue <> dbedt_cd_servico.Text) then
      begin
        CloseStoredProc(sp_muda_servico);
        sp_muda_servico.ParamByName('@NR_PROCESSO').AsString := qry_processo_NR_PROCESSO.AsString;
        ExecStoredProc(sp_muda_servico);
        CloseStoredProc(sp_muda_servico);
//        vAlterouServico := False;
      end;

      datm_main.db_broker.Commit;
      Grava := True;
    except

      on E: Exception do
      begin
        ShowMessage(e.message);
        qry_processo_.Cancel;
        qry_Doctos_Inst.Cancel;
        qry_contr_imp_.Cancel;
        qry_re_.Cancel;
        if datm_main.db_broker.InTransaction then datm_main.db_broker.Rollback;
        TrataErro(E);
        Grava := False;
      end;
    end;
  end;
  btn_mi(False, False, False, False);
end;

function Tfrm_manut_proc.Consiste: Boolean;
var
  in_comprador   : String[1];
  cntr_existente : boolean;
  OldCntr, NewCntr, vCdUnidNeg , ProcessoRucRepetida, cdLocalEmbarque: String;
begin
  Consiste := True;
  // **************************************************************************
  // Consistências de Dados Básicos
  if ( pgctrl_manut_proc.ActivePage = ts_lista ) and ( ( msk_cd_unid_neg.Focused ) or ( msk_cd_produto.Focused ) ) then
  begin
    // Unidade
    ValCodEdt( msk_cd_unid_neg );
    if msk_cd_unid_neg.Text <> '' then
    begin
      edt_nm_unid_neg.Text := FastEdit( 'TUNID_NEG', msk_cd_unid_neg, 'CD_UNID_NEG', 'AP_UNID_NEG' );
      if Trim( edt_nm_unid_neg.Text ) = '' then
      begin
        BoxMensagem( 'Unidade de Negócio não cadastrada!', 2 );
        pgctrl_manut_proc.ActivePage := ts_lista;
        msk_cd_unid_neg.SetFocus;
        Consiste := False;
        nbDadosBasicos.ActivePage := 'Inicio';
        Exit;
      end;
    end;
    // Produto
    ValCodEdt( msk_cd_produto );
    if msk_cd_produto.Text <> '' then
    begin
      edt_nm_produto.Text := FastEdit( 'TPRODUTO', msk_cd_produto, 'CD_PRODUTO', 'AP_PRODUTO' );
      if Trim( edt_nm_produto.Text ) = '' then
      begin
        BoxMensagem( 'Produto não cadastrado!', 2 );
        pgctrl_manut_proc.ActivePage := ts_lista;
        msk_cd_produto.SetFocus;
        Consiste := False;
        nbDadosBasicos.ActivePage := 'Inicio';
        Exit;
      end;
    end;
    Abertura;
  end;
  with datm_manut_proc, pgctrl_manut_proc do
  begin
    if ( ( ( ActivePage = ts_lista ) ) and ( Not ( qry_processo_.State in [dsEdit] ) ) ) or
         ( ( ActivePage = ts_imp_mar ) and ( Not ( qry_proc_im_.State  in [dsEdit] ) ) ) or
         ( ( ActivePage = ts_exp_mar ) and ( Not ( qry_proc_em_.State  in [dsEdit] ) ) ) or
         ( ( ActivePage = ts_obs )     and ( Not ( qry_processo_.State in [dsEdit] ) ) ) then
    begin
      Consiste := False;
      Exit;
    end;;
  end;

  if ( pgctrl_manut_proc.ActivePage = ts_lista ) and ( nbDadosBasicos.ActivePage = 'DadosBasicos' ) then
  begin
    if ( ( msk_cd_unid_neg.Text <> '' ) or ( msk_cd_produto.Text <> '' ) ) and ( Not ( datm_manut_proc.qry_processo_.State in [dsInsert, dsEdit] ) ) then
    begin
      if Not VerUnidNegProduto('manutencao') then
      begin
        edt_nm_unid_neg.Text := '';
        edt_nm_produto.Text  := '';
        pgctrl_manut_proc.ActivePage := ts_lista;
        msk_cd_unid_neg.SetFocus;
        Consiste := False;
        Exit;
      end;
    end;
    // **************************************************************************
    // Consistências de Dados Básicos

    // Cód Célula
    if Not lNaoConsiste then
    begin
      if dbedt_cd_celula.Text = '' then
      begin
        BoxMensagem( 'Campo ''Cód. Célula'' deve ser preenchido!', 2 );
        pgctrl_manut_proc.ActivePage := ts_lista;
        dbedt_cd_celula.SetFocus;
        Consiste := False;
        Exit;
      end;
    end;

    if ( datm_manut_proc.qry_processo_.State in [dsEdit, dsInsert] ) then
    begin;
      ValidCodigo( dbedt_cd_celula );
      if dbedt_cd_celula.Text <> '' then
      begin
        if edt_nm_celula.Text = '' then
        begin
          BoxMensagem( 'Código da Célula inválido!', 2 );
          pgctrl_manut_proc.ActivePage := ts_lista;
          dbedt_cd_celula.SetFocus;
          Consiste := False;
          Exit;
        end;
      end;
    end;

    // Cód Cliente
    if Not lNaoConsiste then
    begin
      if dbedt_cd_cliente.Text = '' then
      begin
        BoxMensagem( 'Campo ''Cód. Cliente'' deve ser preenchido!', 2 );
        pgctrl_manut_proc.ActivePage := ts_lista;
        dbedt_cd_cliente.SetFocus;
        Consiste := False;
        Exit;
      end;
    end;
    if (dbedt_cd_cliente.Text <> '') and
       (ConsultaLookUP('TEMPRESA_NAC', 'CD_EMPRESA', datm_manut_proc.qry_processo_CD_CLIENTE.OldValue, 'CD_GRUPO') <> ConsultaLookUP('TEMPRESA_NAC', 'CD_EMPRESA', datm_manut_proc.qry_processo_CD_CLIENTE.Value, 'CD_GRUPO')) then
    begin
      MessageDlg('O novo cliente deve ser do mesmo grupo.'#13'Desfazendo operação.', mtInformation, [mbOk], 0);
      datm_manut_proc.qry_processo_CD_CLIENTE.Value := datm_manut_proc.qry_processo_CD_CLIENTE.OldValue;
      pgctrl_manut_proc.ActivePage := ts_lista;
      dbedt_cd_cliente.SetFocus;
      Consiste := False;
      Exit;
    end;

    if ( datm_manut_proc.qry_processo_.State in [dsEdit, dsInsert] ) then
    begin;
      ValidCodigo( dbedt_cd_cliente );
      if dbedt_cd_cliente.Text <> '' then
      begin
        if edt_nm_cliente.Text = '' then
        begin
          BoxMensagem( 'Código do Cliente inválido!', 2 );
          pgctrl_manut_proc.ActivePage := ts_lista;
          dbedt_cd_cliente.SetFocus;
          Consiste := False;
          Exit;
        end;
      end;
    end;

    // Cód Serviço
    if Not lNaoConsiste then
    begin
      if dbedt_cd_servico.Text = '' then
      begin
        BoxMensagem( 'Campo ''Cód. Serviço'' deve ser preenchido!', 2 );
        pgctrl_manut_proc.ActivePage:=ts_lista;
        dbedt_cd_servico.SetFocus;
        Consiste := False;
        Exit;
      end
      else if not ConsisteServico then // Incluido por Michel para não deixar salvar se o serviço for inválido - 19/07/2010
      begin
        Result := False;
        Exit;
      end;
    end;

    if ( datm_manut_proc.qry_processo_.State in [dsEdit, dsInsert] ) then
    begin;
      if (not GetServicoNovo) then
        ValidCodigo(dbedt_cd_servico);
      if dbedt_cd_servico.Text <> '' then
      begin
        if edt_nm_servico.Text = '' then
        begin
          BoxMensagem( 'Código do Serviço inválido!', 2 );
          pgctrl_manut_proc.ActivePage := ts_lista;
          dbedt_cd_servico.SetFocus;
          Consiste := False;
          Exit;
        end;
      end;
    end;

    if Not lNaoConsiste then
    begin
      with datm_manut_proc do
      begin
        qry_cliente_servico_.Close;
        qry_cliente_servico_.ParamByName('CD_CLIENTE').AsString  := Trim( dbedt_cd_cliente.Text );
        qry_cliente_servico_.ParamByName('CD_UNID_NEG').AsString := Trim( msk_cd_unid_neg.Text );
        qry_cliente_servico_.ParamByName('CD_PRODUTO').AsString  := Trim( msk_cd_produto.Text );
        qry_cliente_servico_.ParamByName('CD_SERVICO').AsString  := Trim( dbedt_cd_servico.Text );
        qry_cliente_servico_.Open;
        if ( qry_cliente_servico_.RecordCount = 0 ) and ( in_comprador = 'F' ) then
        begin
          qry_cliente_servico_.Close;
          BoxMensagem( 'Não existe habilitação ativa para este serviço!', 2 );
          pgctrl_manut_proc.ActivePage := ts_lista;
          dbedt_cd_servico.SetFocus;
          Consiste := False;
          Exit;
        end;
        qry_cliente_servico_.Close;
      end;
    end;
    // Cód Representante
    if ( datm_manut_proc.qry_processo_.State in [dsEdit, dsInsert] ) then
    begin;
      ValidCodigo( dbedt_cd_rep );
      if dbedt_cd_rep.Text <> '' then
      begin
        if edt_nm_rep.Text = '' then
        begin
          BoxMensagem( 'Código do Representante inválido!', 2 );
          pgctrl_manut_proc.ActivePage := ts_lista;
          dbedt_cd_rep.SetFocus;
          Consiste := False;
          Exit;
        end;
      end;
    end;

    if ( Not lNaoConsiste ) and ( dbedt_cd_rep.Text <> '' ) then
    begin
      with datm_manut_proc do
      begin
        qry_cliente_representante_.Close;
        qry_cliente_representante_.ParamByName('CD_CLIENTE').AsString       := Trim( dbedt_cd_cliente.Text );
        qry_cliente_representante_.ParamByName('CD_UNID_NEG').AsString      := Trim( msk_cd_unid_neg.Text );
        qry_cliente_representante_.ParamByName('CD_PRODUTO').AsString       := Trim( msk_cd_produto.Text );
        qry_cliente_representante_.ParamByName('CD_REPRESENTANTE').AsString := Trim( dbedt_cd_rep.Text );
        qry_cliente_representante_.Open;
        if ( qry_cliente_representante_.RecordCount = 0 ) and ( in_comprador = 'F' ) then
        begin
          qry_cliente_representante_.Close;
          BoxMensagem( 'Não existe habilitação ativa para este representante!', 2 );
          pgctrl_manut_proc.ActivePage := ts_lista;
          dbedt_cd_rep.SetFocus;
          Consiste := False;
          Exit;
        end;
        qry_cliente_representante_.Close;
      end;
    end;

    if ( Not lNaoConsiste ) and ( dbedt_cd_transp_nac_doc.Text <> '' ) then
    begin
      with datm_manut_proc do
      begin
        qry_cliente_transp_.Close;
        qry_cliente_transp_.ParamByName('CD_CLIENTE').AsString    := Trim( dbedt_cd_cliente.Text );
        qry_cliente_transp_.ParamByName('CD_UNID_NEG').AsString   := Trim( msk_cd_unid_neg.Text );
        qry_cliente_transp_.ParamByName('CD_PRODUTO').AsString    := Trim( msk_cd_produto.Text );
        qry_cliente_transp_.ParamByName('CD_TRANSP_NAC').AsString := Trim( dbedt_cd_transp_nac_doc.Text );
        qry_cliente_transp_.Open;
        if ( qry_cliente_transp_.RecordCount = 0 ) and ( in_comprador = 'F' ) then
        begin
          qry_cliente_transp_.Close;
          BoxMensagem( 'Não existe habilitação ativa para este Transportador!', 2 );
          pgctrl_manut_proc.ActivePage := ts_lista;
          dbedt_cd_transp_nac_doc.SetFocus;
          Consiste := False;
          Exit;
        end;
        qry_cliente_transp_.Close;
      end;
    end;
    // Cód Transportador Nacional - Mercadoria
    if ( datm_manut_proc.qry_processo_.State in [dsEdit, dsInsert] ) then
    begin;
      ValidCodigo( dbedt_cd_transp_nac );
      if dbedt_cd_transp_nac.Text <> '' then
      begin
        if edt_nm_transp_nac.Text = '' then
        begin
          BoxMensagem( 'Código do Transportador Nacional inválido!', 2 );
          pgctrl_manut_proc.ActivePage := ts_lista;
          dbedt_cd_transp_nac.SetFocus;
          Consiste := False;
          Exit;
        end;
      end;
    end;

    if ( Not lNaoConsiste ) and ( dbedt_cd_transp_nac.Text <> '' ) and ( btn_co_transp_nac.Enabled ) then
    begin
      with datm_manut_proc do
      begin
        qry_cliente_transp_.Close;
        qry_cliente_transp_.ParamByName('CD_CLIENTE').AsString    := Trim( dbedt_cd_cliente.Text );
        qry_cliente_transp_.ParamByName('CD_UNID_NEG').AsString   := Trim( msk_cd_unid_neg.Text );
        qry_cliente_transp_.ParamByName('CD_PRODUTO').AsString    := Trim( msk_cd_produto.Text );
        qry_cliente_transp_.ParamByName('CD_TRANSP_NAC').AsString := Trim( dbedt_cd_transp_nac.Text );
        qry_cliente_transp_.Open;
        if ( qry_cliente_transp_.RecordCount = 0 ) and ( in_comprador = 'F' ) then
        begin
          qry_cliente_transp_.Close;
          BoxMensagem( 'Não existe habilitação ativa para este Transportador!', 2 );
          pgctrl_manut_proc.ActivePage := ts_lista;
          dbedt_cd_transp_nac.SetFocus;
          Consiste := False;
          Exit;
        end;
        qry_cliente_transp_.Close;
      end;
    end;
    // Código de Área/Trava de área - obrigatoriedade
    if dbedt_cd_area.Text = '' then
    begin
      BoxMensagem('O campo Área deve ser preenchido!', 2);
      dbedt_cd_area.SetFocus;
      Consiste := False;
      Exit;
    end
    else begin
      ValidCodigo( dbedt_cd_area );
      if edt_nm_area.Text = '' then
      begin
        BoxMensagem('Essa Área não está cadastrada!', 2);
        dbedt_cd_area.SetFocus;
        Consiste := False;
        Exit;
      end;
    end;
    // Processo-Entreposto
    if ( Not lNaoConsiste ) and (dbedt_nr_processo_entreposto.Text <> '') then
    begin
      if dbedt_nr_processo_entreposto.Text = ( Trim( msk_cd_unid_neg.Text ) + Trim( msk_cd_produto.Text ) + Trim( msk_nr_processo.Text )) then
      begin
        BoxMensagem( 'Processo-Entreposto deve ser diferente do processo atual!', 2 );
        dbedt_nr_processo_entreposto.Text := '';
        pgctrl_manut_proc.ActivePage := ts_lista;
        dbedt_nr_processo_entreposto.SetFocus;
        Exit;
      end;
      with datm_manut_proc do
      begin
        qry_processo_entreposto_.Close;
        qry_processo_entreposto_.ParamByName('NR_PROCESSO').AsString := Trim( dbedt_nr_processo_entreposto.Text );
        qry_processo_entreposto_.Open;
        if qry_processo_entreposto_.RecordCount = 0 then
        begin
          qry_processo_entreposto_.Close;
          BoxMensagem('Processo-Entreposto digitado não existe !', 2);
          pgctrl_manut_proc.ActivePage := ts_lista;
          dbedt_nr_processo_entreposto.SetFocus;
          Consiste := False;
          Exit;
        end;
        qry_processo_entreposto_.Close;
      end;
    end;
  end;

  // **************************************************************************
  // Consistências de Importação Marítima
  if nbImportacao.ActivePage = 'M' then
  begin
    if ( datm_manut_proc.qry_proc_im_.State in [dsEdit, dsInsert] ) then
    begin;
      // Cód Analista Comissária
      ValidCodigo( dbedt_cd_analista_com_im );
      if dbedt_cd_analista_com_im.Text <> '' then
      begin
        if dbedt_nm_analista_com_im.Text = '' then
        begin
          BoxMensagem( 'Código do Analista da Comissária inválido!', 2 );
          nbImportacao.ActivePage := 'M';
          dbedt_cd_analista_com_im.SetFocus;
          Consiste := False;
          Exit;
        end;
      end;
      // Cód Analista Cliente
      ValidCodigo( dbedt_cd_contato_im );
      if dbedt_cd_contato_im.Text <> '' then
      begin
        if dbedt_nm_contato_im.Text = '' then
        begin
          BoxMensagem( 'Código do Contato inválido!', 2 );
          nbImportacao.ActivePage := 'M';
          dbedt_cd_contato_im.SetFocus;
          Consiste := False;
          Exit;
        end;
      end;
      // Cód Moeda Frete
      ValidCodigo( dbedt_cd_moeda_frete_im );
      if dbedt_cd_moeda_frete_im.Text <> '' then
      begin
        if dbedt_nm_moeda_frete_im.Text = '' then
        begin
          BoxMensagem( 'Código da Moeda do Frete inválido!', 2 );
          nbImportacao.ActivePage := 'M';
          dbedt_cd_moeda_frete_im.SetFocus;
          Consiste := False;
          Exit;
        end;
      end;
      // Cód Agente
      ValidCodigo( dbedt_cd_agente_im );
      if dbedt_cd_agente_im.Text <> '' then
      begin
        if dbedt_nm_agente_im.Text = '' then
        begin
          BoxMensagem( 'Código do Agente inválido!', 2 );
          nbImportacao.ActivePage := 'M';
          dbedt_cd_agente_im.SetFocus;
          Consiste := False;
          Exit;
        end;
      end;
      // Cód Armazém de Atracação
      ValidCodigo( dbedt_cd_amz_atr_im );
      if dbedt_cd_amz_atr_im.Text <> '' then
      begin
        if dbedt_nm_amz_atr_im.Text = '' then
        begin
          BoxMensagem( 'Código do Armazém de Atracação inválido!', 2 );
          nbImportacao.ActivePage := 'M';
          dbedt_cd_amz_atr_im.SetFocus;
          Consiste := False;
          Exit;
        end;
      end;
      // Cód Armazém de Descarga
      ValidCodigo( dbedt_cd_amz_des_im );
      if dbedt_cd_amz_des_im.Text <> '' then
      begin
        if dbedt_nm_amz_des_im.Text = '' then
        begin
          BoxMensagem( 'Código do Armazém de Descarga inválido!', 2 );
          nbImportacao.ActivePage := 'M';
          dbedt_cd_amz_des_im.SetFocus;
          Consiste := False;
          Exit;
        end;
      end;
      // Cód Embarcação
      ValidCodigo( dbedt_cd_embarc_im );
      if dbedt_cd_embarc_im.Text <> '' then
      begin
        if dbedt_nm_embarc_im.Text = '' then
        begin
          BoxMensagem( 'Código da Embarcação inválido!', 2 );
          nbImportacao.ActivePage := 'M';
          dbedt_cd_embarc_im.SetFocus;
          Consiste := False;
          Exit;
        end;
      end;
      // Viagem
      if Trim( dbedt_cd_embarc_im.Text ) = '' then
      begin
        dbedt_nr_viagem_im.Text := '';
        datm_manut_proc.qry_proc_im_NR_VIAGEM.AsString := '';
      end;

      if (Trim( dbedt_nr_viagem_im.Text ) <> '')  and (Trim( dbedt_cd_embarc_im.Text ) <> '') and (not (dbchkIN_BALDECAO.Checked)) then
      begin
        if Trim( dbedt_cd_local_desemb_im.Text ) <> '' then
        begin

          with datm_manut_proc do
          begin
            qry_viagem_.Close;
            qry_viagem_.ParamByName('CD_UNID_NEG').AsString   := datm_manut_proc.qry_processo_CD_UNID_NEG.AsString;
            qry_viagem_.ParamByName('CD_PRODUTO').AsString    := datm_manut_proc.qry_processo_CD_PRODUTO.AsString;
            qry_viagem_.ParamByName('CD_EMBARCACAO').AsString := datm_manut_proc.qry_proc_im_CD_EMBARCACAO.AsString;
            qry_viagem_.ParamByName('NR_VIAGEM').AsString     := datm_manut_proc.qry_proc_im_NR_VIAGEM.AsString;
            qry_viagem_.ParamByName('CD_LOCAL').AsString      := datm_manut_proc.qry_proc_im_CD_LOCAL_DESEMBARQUE.AsString;
            qry_viagem_.Open;

            if qry_viagem_.RecordCount = 0 then
            begin
              BoxMensagem( 'Nº da Viagem inválido!', 2 );
              nbImportacao.ActivePage := 'M';
              dbedt_nr_viagem_im.SetFocus;
              Consiste := False;
              Exit;
            end
            else
            begin
              if Trim( qry_proc_im_NR_MANIFESTO.AsString ) = '' then
                qry_proc_im_NR_MANIFESTO.AsString         := qry_viagem_.FieldByName('NR_MANIFESTO').AsString;

              if Trim( qry_proc_im_CD_ARMAZEM_ATRACACAO.AsString ) = '' then
                qry_proc_im_CD_ARMAZEM_ATRACACAO.AsString := qry_viagem_.FieldByName('CD_ARMAZEM_ATRACACAO').AsString;

              qry_viagem_.Close;
            end;
          end;

        end
        else
        begin
          BoxMensagem( 'Código do Local de Desembarque inválido!', 2 );
          nbImportacao.ActivePage := 'M';
          dbedt_cd_local_desemb_im.SetFocus;
          Consiste := False;
        end;
      end;


      if (Trim( dbedtNR_VIAGEM_BALDEACAO.Text ) <> '') and (Trim( dbedtCD_EMBARCACAO_BALDEACAO.Text ) <> '')   and ((dbchkIN_BALDECAO.Checked)) then
      begin
        if Trim( dbedt_cd_local_desemb_im.Text ) <> '' then
        begin

          with datm_manut_proc do
          begin
            qry_viagem_.Close;
            qry_viagem_.ParamByName('CD_UNID_NEG').AsString   := datm_manut_proc.qry_processo_CD_UNID_NEG.AsString;
            qry_viagem_.ParamByName('CD_PRODUTO').AsString    := datm_manut_proc.qry_processo_CD_PRODUTO.AsString;
            qry_viagem_.ParamByName('CD_EMBARCACAO').AsString := datm_manut_proc.qry_proc_im_CD_EMBARCACAO_BALDEACAO.AsString;
            qry_viagem_.ParamByName('NR_VIAGEM').AsString     := datm_manut_proc.qry_proc_im_NR_VIAGEM_BALDEACAO.AsString;
            qry_viagem_.ParamByName('CD_LOCAL').AsString      := datm_manut_proc.qry_proc_im_CD_LOCAL_DESEMBARQUE.AsString;
            qry_viagem_.Open;

            if qry_viagem_.RecordCount = 0 then
            begin
              BoxMensagem( 'Nº da Viagem inválido!', 2 );
              nbImportacao.ActivePage := 'M';
              dbedt_nr_viagem_im.SetFocus;
              Consiste := False;
              Exit;
            end
            else
            begin
              if Trim( qry_proc_im_NR_MANIFESTO.AsString ) = '' then
                qry_proc_im_NR_MANIFESTO.AsString         := qry_viagem_.FieldByName('NR_MANIFESTO').AsString;

              qry_viagem_.Close;
            end;
          end;
        end
        else
        begin
          BoxMensagem( 'Código do Local de Desembarque inválido!', 2 );
          nbImportacao.ActivePage := 'M';
          dbedt_cd_local_desemb_im.SetFocus;
          Consiste := False;
        end;
      end;

      // Cód Local de Embarque
      ValidCodigo( dbedt_cd_local_emb_im );
      if dbedt_cd_local_emb_im.Text <> '' then
      begin
        if dbedt_nm_local_emb_im.Text = '' then
        begin
          BoxMensagem( 'Código do Local de Embarque inválido!', 2 );
          nbImportacao.ActivePage := 'M';
          dbedt_cd_local_emb_im.SetFocus;
          Consiste := False;
          Exit;
        end;
      end;
      // Cód 1º Porto de Atracação no Brasil
      ValidCodigo( dbedt_cd_PrimeiroPortoAtrac );
      if dbedt_cd_PrimeiroPortoAtrac.Text <> '' then
      begin
        if EditPrimeiroPortoAtrac.Text = '' then
        begin
          BoxMensagem( 'Código do 1º Porto de Atracação inválido!', 2 );
          nbImportacao.ActivePage := 'M';
          dbedt_cd_PrimeiroPortoAtrac.SetFocus;
          Consiste := False;
          Exit;
        end;
      end;

      // Cód Local de Desembarque
      ValidCodigo( dbedt_cd_local_desemb_im );
      if Trim( dbedt_cd_local_desemb_im.Text ) <> '' then
      begin
        if Trim( dbedt_nm_local_desemb_im.Text ) = '' then
        begin
          BoxMensagem( 'Código do Local de Desembarque inválido!', 2 );
          nbImportacao.ActivePage := 'M';
          dbedt_cd_local_desemb_im.SetFocus;
          Consiste := False;
          Exit;
        end;
      end;
      // Cód País Origem
      ValidCodigo( dbedt_cd_pais_origem_im );
      if dbedt_cd_pais_origem_im.Text <> '' then
      begin
        if dbedt_nm_pais_origem_im.Text = '' then
        begin
          BoxMensagem( 'Código do País de Origem inválido!', 2 );
          nbImportacao.ActivePage := 'M';
          dbedt_cd_pais_origem_im.SetFocus;
          Consiste := False;
          Exit;
        end;
      end;
      // Cód Transportador Marítimo
      ValidCodigo( dbedt_cd_transportador_im );
      if dbedt_cd_transportador_im.Text <> '' then
      begin
        if dbedt_nm_transportador_im.Text = '' then
        begin
          BoxMensagem( 'Código do Transportador Marítimo inválido!', 2 );
          nbImportacao.ActivePage := 'M';
          dbedt_cd_transportador_im.SetFocus;
          Consiste := False;
          Exit;
        end;
       end;
       //--------
        ValidCodigo( dbedt_cd_transportador_ex );
      if dbedt_cd_transportador_ex.Text <> '' then
      begin
        if dbedt_nm_transportador_ex.Text = '' then                                               //FERNANDA
        begin
          BoxMensagem( 'Código do Transportador Marítimo inválido!', 2 );
          nbImportacao.ActivePage := 'M';
          dbedt_cd_transportador_ex.SetFocus;
          Consiste := False;
          Exit;
        end;
      end;
       //--------
         ValidCodigo( dbedt_cd_transportador_ex_a );
      if dbedt_cd_transportador_ex_a.Text <> '' then                                         //FERNANDA
      begin
         if dbedt_nm_transportador_ex_a.Text= '' then
       begin
          BoxMensagem( 'Código do Transportador Marítimo inválido!', 2 );
          //nbImportacao.ActivePage := 'M';
          nbExportacao.ActivePage := 'M';
          dbedt_cd_transportador_ex_a.SetFocus;
          Consiste := False;
          Exit;
        end;
      end;
      //-----------------------
            ValidCodigo( dbedt_cd_transportador_ex_a );
      if dbedt_cd_transportador_ex_a.Text <> '' then                                         //FERNANDA
      begin
         if dbedt_nm_transportador_ex_a.Text= '' then
       begin
          BoxMensagem( 'Código do Transportador Marítimo inválido!', 2 );
          //nbImportacao.ActivePage := 'M';
          nbExportacao.ActivePage := 'A';
          dbedt_cd_transportador_ex_a.SetFocus;
          Consiste := False;
          Exit;
        end;
      end;
      //-----------------------
    end;
  end;// fim to ts_imp_mar

  // Cód Transportadora Nacional - Cntr Vazio
  if (pgctrl_manut_proc.ActivePage = ts_estufagem) and (datm_manut_proc.qry_processo_.State in [dsEdit, dsInsert]) then
  begin
    ValidCodigo( dbedt_cd_transp_nac_doc );
    if dbedt_cd_transp_nac_doc.Text <> '' then
    begin
      if edt_nm_transp_nac_doc.Text = '' then
      begin
        BoxMensagem( 'Código do Transportador Nacional - Doctos inválido!', 2 );
        pgctrl_manut_proc.ActivePage := ts_estufagem;
        dbedt_cd_transp_nac_doc.SetFocus;
        Consiste := False;
        Exit;
      end;
    end;
  end;

  // **************************************************************************
  // Consistências de Importação Aérea
  if nbImportacao.ActivePage = 'A' then
  begin
    if ( datm_manut_proc.qry_proc_im_.State in [dsEdit, dsInsert] ) then
    begin;
      dbedtMantraVisadoExit(dbedtMantraVisado);
      // Cód Analista Comissária
      ValidCodigo( dbedt_cd_analista_com_ia );
      if dbedt_cd_analista_com_ia.Text <> '' then
      begin
        if dbedt_nm_analista_com_ia.Text = '' then
        begin
          BoxMensagem( 'Código do Analista da Comissária inválido!', 2 );
          nbImportacao.ActivePage := 'A';
          dbedt_cd_analista_com_ia.SetFocus;
          Consiste := False;
          Exit;
        end;
      end;
      // Cód Analista Cliente
      ValidCodigo( dbedt_cd_contato_ia );
      if dbedt_cd_contato_ia.Text <> '' then
      begin
        if dbedt_nm_contato_ia.Text = '' then
        begin
          BoxMensagem( 'Código do Contato inválido!', 2 );
          nbImportacao.ActivePage := 'A';
          dbedt_cd_contato_ia.SetFocus;
          Consiste := False;
          Exit;
        end;
      end;
      // Cód Moeda Frete
      ValidCodigo( dbedt_cd_moeda_frete_ia );
      if dbedt_cd_moeda_frete_ia.Text <> '' then
      begin
        if dbedt_nm_moeda_frete_ia.Text = '' then
        begin
          BoxMensagem( 'Código da Moeda do Frete inválido!', 2 );
          nbImportacao.ActivePage := 'A';
          dbedt_cd_moeda_frete_ia.SetFocus;
          Consiste := False;
          Exit;
        end;
      end;
      // Cód Agente
      ValidCodigo( dbedt_cd_agente_ia );
      if dbedt_cd_agente_ia.Text <> '' then
      begin
        if dbedt_nm_agente_ia.Text = '' then
        begin
          BoxMensagem( 'Código do Agente inválido!', 2 );
          nbImportacao.ActivePage := 'A';
          dbedt_cd_agente_ia.SetFocus;
          Consiste := False;
          Exit;
        end;
      end;
      // Cód Armazém de Atracação
      ValidCodigo( dbedt_cd_amz_atr_ia );
      if dbedt_cd_amz_atr_ia.Text <> '' then
      begin
        if dbedt_nm_amz_atr_ia.Text = '' then
        begin
          BoxMensagem( 'Código do Armazém de Atracação inválido!', 2 );
          nbImportacao.ActivePage := 'A';
          dbedt_cd_amz_atr_ia.SetFocus;
          Consiste := False;
          Exit;
        end;
      end;
      // Cód Armazém de Descarga
      ValidCodigo( dbedt_cd_amz_des_ia );
      if dbedt_cd_amz_des_ia.Text <> '' then
      begin
        if dbedt_nm_amz_des_ia.Text = '' then
        begin
          BoxMensagem( 'Código do Armazém de Descarga inválido!', 2 );
          nbImportacao.ActivePage := 'A';
          dbedt_cd_amz_des_ia.SetFocus;
          Consiste := False;
          Exit;
        end;
      end;
      // Cód Local de Embarque
      ValidCodigo( dbedt_cd_local_emb_ia );
      if dbedt_cd_local_emb_ia.Text <> '' then
      begin
        if dbedt_nm_local_emb_ia.Text = '' then
        begin
          BoxMensagem( 'Código do Local de Embarque inválido!', 2 );
          nbImportacao.ActivePage := 'A';
          dbedt_cd_local_emb_ia.SetFocus;
          Consiste := False;
          Exit;
        end;
      end;
      // Cód Local de Desembarque
      ValidCodigo( dbedt_cd_local_desemb_ia );
      if dbedt_cd_local_desemb_ia.Text <> '' then
      begin
        if dbedt_nm_local_desemb_ia.Text = '' then
        begin
          BoxMensagem( 'Código do Local de Desembarque inválido!', 2 );
          nbImportacao.ActivePage := 'A';
          dbedt_cd_local_desemb_ia.SetFocus;
          Consiste := False;
          Exit;
        end;
      end;
      // Cód País Origem
      ValidCodigo( dbedt_cd_pais_origem_ia );
      if dbedt_cd_pais_origem_ia.Text <> '' then
      begin
        if dbedt_nm_pais_origem_ia.Text = '' then
        begin
          BoxMensagem( 'Código do País de Origem inválido!', 2 );
          nbImportacao.ActivePage := 'A';
          dbedt_cd_pais_origem_ia.SetFocus;
          Consiste := False;
          Exit;
        end;
      end;
    end;
  end;// fim to ts_imp_aerea
  // **************************************************************************
  // Consistências de Importação Rodoviária
  if nbImportacao.ActivePage = 'R' then
  begin
    if ( datm_manut_proc.qry_proc_im_.State in [dsEdit, dsInsert] ) then
    begin;
      // Cód Analista Comissária
      ValidCodigo( dbedt_cd_analista_com_ir );
      if dbedt_cd_analista_com_ir.Text <> '' then
      begin
        if dbedt_nm_analista_com_ir.Text = '' then
        begin
          BoxMensagem( 'Código do Analista da Comissária inválido!', 2 );
          nbImportacao.ActivePage := 'R';
          dbedt_cd_analista_com_ir.SetFocus;
          Consiste := False;
          Exit;
        end;
      end;
      // Cód Analista Cliente
      ValidCodigo( dbedt_cd_contato_ir );
      if dbedt_cd_contato_ir.Text <> '' then
      begin
        if dbedt_nm_contato_ir.Text = '' then
        begin
          BoxMensagem( 'Código do Contato inválido!', 2 );
          nbImportacao.ActivePage := 'R';
          dbedt_cd_contato_ir.SetFocus;
          Consiste := False;
          Exit;
        end;
      end;
      // Cód Moeda Frete
      ValidCodigo( dbedt_cd_moeda_frete_ir );
      if dbedt_cd_moeda_frete_ir.Text <> '' then
      begin
        if dbedt_nm_moeda_frete_ir.Text = '' then
        begin
          BoxMensagem( 'Código da Moeda do Frete inválido!', 2 );
          nbImportacao.ActivePage := 'R';
          dbedt_cd_moeda_frete_ir.SetFocus;
          Consiste := False;
          Exit;
        end;
      end;
      // Cód Agente
      ValidCodigo( dbedt_cd_agente_ir );
      if dbedt_cd_agente_ir.Text <> '' then
      begin
        if dbedt_nm_agente_ir.Text = '' then
        begin
          BoxMensagem( 'Código do Agente inválido!', 2 );
          nbImportacao.ActivePage := 'R';
          dbedt_cd_agente_ir.SetFocus;
          Consiste := False;
          Exit;
        end;
      end;
      // Fronteira
      ValidCodigo( dbedt_cd_fronteiraImp );
      if dbedt_cd_fronteiraImp.Text <> '' then
      begin
        if dbedt_nm_fronteiraImp.Text = '' then
        begin
          BoxMensagem( 'Código da Fronteira inválida!', 2 );
          nbImportacao.ActivePage := 'R';
          dbedt_cd_fronteiraImp.SetFocus;
          Consiste := False;
          Exit;
        end;
      end;

      // Cód Armazém de Atracação
      ValidCodigo( dbedt_cd_amz_atr_ir );
      if dbedt_cd_amz_atr_ir.Text <> '' then
      begin
        if dbedt_nm_amz_atr_ir.Text = '' then
        begin
          BoxMensagem( 'Código do Armazém de Atracação inválido!', 2 );
          nbImportacao.ActivePage := 'R';
          dbedt_cd_amz_atr_ir.SetFocus;
          Consiste := False;
          Exit;
        end;
      end;
      // Cód Armazém de Descarga
      ValidCodigo( dbedt_cd_amz_des_ir );
      if dbedt_cd_amz_des_ir.Text <> '' then
      begin
        if dbedt_nm_amz_des_ir.Text = '' then
        begin
          BoxMensagem( 'Código do Armazém de Descarga inválido!', 2 );
          nbImportacao.ActivePage := 'R';
          dbedt_cd_amz_des_ir.SetFocus;
          Consiste := False;
          Exit;
        end;
      end;
      // Cód Local de Embarque
      ValidCodigo( dbedt_cd_local_emb_ir );
      if dbedt_cd_local_emb_ir.Text <> '' then
      begin
        if dbedt_nm_local_emb_ir.Text = '' then
        begin
          BoxMensagem( 'Código do Local de Embarque inválido!', 2 );
          nbImportacao.ActivePage := 'R';
          dbedt_cd_local_emb_ir.SetFocus;
          Consiste := False;
          Exit;
        end;
      end;
      // Cód Local de Desembarque
      ValidCodigo( dbedt_cd_local_desemb_ir );
      if dbedt_cd_local_desemb_ir.Text <> '' then
      begin
        if dbedt_nm_local_desemb_ir.Text = '' then
        begin
          BoxMensagem( 'Código do Local de Desembarque inválido!', 2 );
          nbImportacao.ActivePage := 'R';
          dbedt_cd_local_desemb_ir.SetFocus;
          Consiste := False;
          Exit;
        end;
      end;
      // Cód País Origem
      ValidCodigo( dbedt_cd_pais_origem_ir );
      if dbedt_cd_pais_origem_ir.Text <> '' then
      begin
        if dbedt_nm_pais_origem_ir.Text = '' then
        begin
          BoxMensagem( 'Código do País de Origem inválido!', 2 );
          nbImportacao.ActivePage := 'R';
          dbedt_cd_pais_origem_ir.SetFocus;
          Consiste := False;
          Exit;
        end;
      end;
    end;
  end;// fim to ts_imp_rod

  //**************************************************************************
  //Consistências de Importação Ferroviária
  if nbImportacao.ActivePage = 'F' then
  begin
    if ( datm_manut_proc.qry_proc_im_.State in [dsEdit, dsInsert] ) then
    begin;
      //Cód Analista Comissária
      ValidCodigo( dbedt_cd_analista_com_if );
      if dbedt_cd_analista_com_if.Text <> '' then
      begin
        if dbedt_nm_analista_com_if.Text = '' then
        begin
          BoxMensagem( 'Código do Analista da Comissária inválido!', 2 );
          nbImportacao.ActivePage := 'F';
          dbedt_cd_analista_com_if.SetFocus;
          Consiste := False;
          Exit;
        end;
      end;
      //Cód Analista Cliente
      ValidCodigo( dbedt_cd_contato_if );
      if dbedt_cd_contato_if.Text <> '' then
      begin
        if dbedt_nm_contato_if.Text = '' then
        begin
          BoxMensagem( 'Código do Contato inválido!', 2 );
          nbImportacao.ActivePage := 'F';
          dbedt_cd_contato_if.SetFocus;
          Consiste := False;
          Exit;
        end;
      end;
      //Cód Moeda Frete
      ValidCodigo( dbedt_cd_moeda_frete_if );
      if dbedt_cd_moeda_frete_if.Text <> '' then
      begin
        if dbedt_nm_moeda_frete_if.Text = '' then
        begin
          BoxMensagem( 'Código da Moeda do Frete inválido!', 2 );
          nbImportacao.ActivePage := 'F';
          dbedt_cd_moeda_frete_if.SetFocus;
          Consiste := False;
          Exit;
        end;
      end;
      //Cód Agente
      ValidCodigo( dbedt_cd_agente_if );
      if dbedt_cd_agente_if.Text <> '' then
      begin
        if dbedt_nm_agente_if.Text = '' then
        begin
          BoxMensagem( 'Código do Agente inválido!', 2 );
          nbImportacao.ActivePage := 'F';
          dbedt_cd_agente_if.SetFocus;
          Consiste := False;
          Exit;
        end;
      end;
      //Cód Armazém de Atracação
      ValidCodigo( dbedt_cd_amz_atr_if );
      if dbedt_cd_amz_atr_if.Text <> '' then
      begin
        if dbedt_nm_amz_atr_if.Text = '' then
        begin
          BoxMensagem( 'Código do Armazém de Atracação inválido!', 2 );
          nbImportacao.ActivePage := 'F';
          dbedt_cd_amz_atr_if.SetFocus;
          Consiste := False;
          Exit;
        end;
      end;
      // Cód Armazém de Descarga
      ValidCodigo( dbedt_cd_amz_des_if );
      if dbedt_cd_amz_des_if.Text <> '' then
      begin
        if dbedt_nm_amz_des_if.Text = '' then
        begin
          BoxMensagem( 'Código do Armazém de Descarga inválido!', 2 );
          nbImportacao.ActivePage := 'F';
          dbedt_cd_amz_des_if.SetFocus;
          Consiste := False;
          Exit;
        end;
      end;
      // Cód Local de Embarque
      ValidCodigo( dbedt_cd_local_emb_if );
      if dbedt_cd_local_emb_if.Text <> '' then
      begin
        if dbedt_nm_local_emb_if.Text = '' then
        begin
          BoxMensagem( 'Código do Local de Embarque inválido!', 2 );
          nbImportacao.ActivePage := 'F';
          dbedt_cd_local_emb_if.SetFocus;
          Consiste := False;
          Exit;
        end;
      end;
      // Cód Local de Desembarque
      ValidCodigo( dbedt_cd_local_desemb_if );
      if dbedt_cd_local_desemb_if.Text <> '' then
      begin
        if dbedt_nm_local_desemb_if.Text = '' then
        begin
          BoxMensagem( 'Código do Local de Desembarque inválido!', 2 );
          nbImportacao.ActivePage := 'F';
          dbedt_cd_local_desemb_if.SetFocus;
          Consiste := False;
          Exit;
        end;
      end;
      // Cód País Origem
      ValidCodigo( dbedt_cd_pais_origem_if );
      if dbedt_cd_pais_origem_if.Text <> '' then
      begin
        if dbedt_nm_pais_origem_if.Text = '' then
        begin
          BoxMensagem( 'Código do País de Origem inválido!', 2 );
          nbImportacao.ActivePage := 'F';
          dbedt_cd_pais_origem_if.SetFocus;
          Consiste := False;
          Exit;
        end;
      end;
    end;
  end;// fim to ts_imp_ferrov

  // **************************************************************************
  // Consistência Geral de Exportação
  // Consistências de Exportação Marítima
  if nbExportacao.ActivePage = 'M' then
  begin
    if ( datm_manut_proc.qry_proc_em_.State in [dsEdit, dsInsert] ) then
    begin;
      // Tabela de Frete
      if dbedtCdFreteEM.Text <> '' then
      begin
        dbedtCdFreteEM.Text := Copy('00000', 1, 5 - Length( dbedtCdFreteEM.Text)) +  dbedtCdFreteEM.Text;
        if edtNmFreteEM.Text = '' then
        begin
          BoxMensagem( 'Código da Tabela de Frete inválida!', 2 );
          nbExportacao.ActivePage := 'M';
          dbedtCdFreteEM.SetFocus;
          Consiste := False;
          Exit;
        end;
      end;
      // Cód Analista Comissária
      ValidCodigo( dbedt_cd_analista_com_em );
      if dbedt_cd_analista_com_em.Text <> '' then
      begin
        if dbedt_nm_analista_com_em.Text = '' then
        begin
          BoxMensagem( 'Código do Analista da Comissária inválido!', 2 );
          nbExportacao.ActivePage := 'M';
          dbedt_cd_analista_com_em.SetFocus;
          Consiste := False;
          Exit;
        end;
      end;
      // Cód Analista Cliente
      ValidCodigo( dbedt_cd_contato_em );
      if dbedt_cd_contato_em.Text <> '' then
      begin
        if dbedt_nm_contato_em.Text = '' then
        begin
          BoxMensagem( 'Código do Contato inválido!', 2 );
          nbExportacao.ActivePage := 'M';
          dbedt_cd_contato_em.SetFocus;
          Consiste := False;
          Exit;
        end;
      end;
      // Código do Importador
      ValidCodigo( dbedt_cd_importador_em );
      if dbedt_cd_importador_em.Text <> '' then
      begin
        if edt_nm_importador_em.Text = '' then
        begin
          BoxMensagem( 'Código do Importador inválido!', 2 );
          nbExportacao.ActivePage := 'M';
          dbedt_cd_importador_em.SetFocus;
          Consiste := False;
          Exit;
        end;
      end;
      // Cód Moeda MLE
      ValidCodigo( dbedt_cd_moeda_mle_em );
      if dbedt_cd_moeda_mle_em.Text <> '' then
      begin
        if dbedt_nm_moeda_mle_em.Text = '' then
        begin
          BoxMensagem( 'Código da Moeda FOB inválido!', 2 );
          nbExportacao.ActivePage := 'M';
          dbedt_cd_moeda_mle_em.SetFocus;
          Consiste := False;
          Exit;
        end;
      end;
      // Cód Moeda Frete
      ValidCodigo( dbedt_cd_moeda_frete_em );
      if dbedt_cd_moeda_frete_em.Text <> '' then
      begin
        if dbedt_nm_moeda_frete_em.Text = '' then
        begin
          BoxMensagem( 'Código da Moeda do Frete inválido!', 2 );
          nbExportacao.ActivePage := 'M';
          dbedt_cd_moeda_frete_em.SetFocus;
          Consiste := False;
          Exit;
        end;
      end;
      // Cód Agente
      ValidCodigo( dbedt_cd_agente_em );
      if dbedt_cd_agente_em.Text <> '' then
      begin
        if dbedt_nm_agente_em.Text = '' then
        begin
          BoxMensagem( 'Código do Agente inválido!', 2 );
          nbExportacao.ActivePage := 'M';
          dbedt_cd_agente_em.SetFocus;
          Consiste := False;
          Exit;
        end;
      end;
      // Cód Armazém de Atracação
      ValidCodigo( dbedt_cd_amz_atr_em );
      if dbedt_cd_amz_atr_em.Text <> '' then
      begin
        if dbedt_nm_amz_atr_em.Text = '' then
        begin
          BoxMensagem( 'Código do Armazém de Atracação inválido!', 2 );
          nbExportacao.ActivePage := 'M';
          dbedt_cd_amz_atr_em.SetFocus;
          Consiste := False;
          Exit;
        end;
      end;
      // Cód Armazém de Descarga
      ValidCodigo( dbedt_cd_amz_est_em );
      if dbedt_cd_amz_est_em.Text <> '' then
      begin
        if dbedt_nm_amz_est_em.Text = '' then
        begin
          BoxMensagem( 'Código do Armazém de Descarga inválido!', 2 );
          nbExportacao.ActivePage := 'M';
          dbedt_cd_amz_est_em.SetFocus;
          Consiste := False;
          Exit;
        end;
      end;
      // Cód Embarcação
      ValidCodigo( dbedt_cd_embarc_em );
      if dbedt_cd_embarc_em.Text <> '' then
      begin
        if dbedt_nm_embarc_em.Text = '' then
        begin
          BoxMensagem( 'Código da Embarcação inválido!', 2 );
          nbExportacao.ActivePage := 'M';
          dbedt_cd_embarc_em.SetFocus;
          Consiste := False;
          Exit;
        end;
      end;
      // Viagem
      if Trim( dbedt_nr_viagem_em.Text ) <> '' then
      begin
        if Trim( dbedt_nr_viagem_em.Text ) <> '' then
        begin
          if msk_cd_unid_neg.Text = '07' then
            vCdUnidNeg := ' ''01'',''07'' '
          else
            vCdUnidNeg := ''''+msk_cd_unid_neg.Text+'''';

          with datm_manut_proc do
          begin
            cdLocalEmbarque := ConsultaLookUPSQL(
            'SELECT CD_LOCAL FROM TVIAGEM V (NOLOCK) ' +
            ' WHERE  V.CD_UNID_NEG in (' + vCdUnidNeg + ') AND ' +
            '  V.CD_PRODUTO = ''' + qry_processo_CD_PRODUTO.AsString + ''' AND ' +
            '  V.CD_EMBARCACAO = ''' + qry_proc_em_CD_EMBARCACAO.AsString + ''' AND ' +
            '  V.NR_VIAGEM = ''' + dbedt_nr_viagem_em.Text + '''','CD_LOCAL');

            if datm_manut_proc.qry_proc_em_CD_LOCAL_EMBARQUE.AsString <> cdLocalEmbarque then
              qry_proc_em_CD_LOCAL_EMBARQUE.AsString := cdLocalEmbarque;
            //
            qry_viagem_.Close;
            qry_viagem_.ParamByName('CD_UNID_NEG').AsString   := qry_processo_CD_UNID_NEG.AsString;
            qry_viagem_.ParamByName('CD_PRODUTO').AsString    := qry_processo_CD_PRODUTO.AsString;
            qry_viagem_.ParamByName('CD_EMBARCACAO').AsString := qry_proc_em_CD_EMBARCACAO.AsString;
            qry_viagem_.ParamByName('NR_VIAGEM').AsString     := qry_proc_em_NR_VIAGEM.AsString;
            qry_viagem_.ParamByName('CD_LOCAL').AsString      := qry_proc_em_CD_LOCAL_EMBARQUE.AsString;
            qry_viagem_.Open;

            if qry_viagem_.RecordCount = 0 then
            begin
              BoxMensagem( 'Nº da Viagem inválido!', 2 );
              nbExportacao.ActivePage := 'M';
              dbedt_nr_viagem_em.SetFocus;
              Consiste := False;
              Exit;
            end
            else
            begin
              if Trim( qry_proc_em_CD_ARMAZEM_ATRACACAO.AsString ) = '' then
                qry_proc_em_CD_ARMAZEM_ATRACACAO.AsString := qry_viagem_.FieldByName('CD_ARMAZEM_ATRACACAO').AsString;

              if qry_proc_em_CD_LOCAL_EMBARQUE.AsString <> qry_viagem_.FieldByName('CD_LOCAL').AsString then // linha incluida para não fazer o tempo todo por causa do change do field - Michel - 19/07/2010
                qry_proc_em_CD_LOCAL_EMBARQUE.AsString := qry_viagem_.FieldByName('CD_LOCAL').AsString;
              qry_viagem_.Close;
            end;
          end;
        end
        else
        begin
          BoxMensagem( 'Código do Local de Embarque inválido!', 2 );
          nbExportacao.ActivePage := 'M';
          dbedt_cd_local_emb_em.SetFocus;
          Consiste := False;
          Exit;
        end;
      end;
      // Cód Local de Embarque
      ValidCodigo( dbedt_cd_local_emb_em );

      if dbedt_nm_local_emb_em.Text = '' then
      begin
        BoxMensagem('Código do Local de Embarque deve ser preenchido!', 2 );
        nbExportacao.ActivePage := 'M';
        dbedt_cd_local_emb_em.SetFocus;
        Consiste := False;
        Exit;
      end;
      // Cód Local de Transbordo
      ValidCodigo( dbedt_cd_local_transb_em );
      if dbedt_cd_local_transb_em.Text <> '' then
      begin
        if dbedt_nm_local_transb_em.Text = '' then
        begin
          BoxMensagem( 'Código do Local de Transbordo inválido!', 2 );
          nbExportacao.ActivePage := 'M';
          dbedt_cd_local_transb_em.SetFocus;
          Consiste := False;
          Exit;
        end;
      end;
      // Cód Local de Desembarque
      ValidCodigo( dbedt_cd_local_desemb_em );
      if dbedt_cd_local_desemb_em.Text <> '' then
      begin
        if dbedt_nm_local_desemb_em.Text = '' then
        begin
          BoxMensagem( 'Código do Local de Desembarque inválido!', 2 );
          nbExportacao.ActivePage := 'M';
          dbedt_cd_local_desemb_em.SetFocus;
          Consiste := False;
          Exit;
        end;
      end;
      // Cód País Destino
      ValidCodigo( dbedt_cd_pais_dest_em );
      if dbedt_cd_pais_dest_em.Text <> '' then
      begin
        if dbedt_nm_pais_dest_em.Text = '' then
        begin
          BoxMensagem( 'Código do País de Destino inválido!', 2 );
          nbExportacao.ActivePage := 'M';
          dbedt_cd_pais_dest_em.SetFocus;
          Consiste := False;
          Exit;
        end;
      end;
      // Cód País Origem
      ValidCodigo( dbedt_cd_pais_origem_em );
      if dbedt_cd_pais_origem_em.Text <> '' then
      begin
        if dbedt_nm_pais_origem_em.Text = '' then
        begin
          BoxMensagem( 'Código do País de Origem inválido!', 2 );
          nbExportacao.ActivePage := 'M';
          dbedt_cd_pais_origem_em.SetFocus;
          Consiste := False;
          Exit;
        end;
      end;
      // Cód Banco
      ValidCodigo( dbedt_cd_banco_em );
      if dbedt_cd_banco_em.Text <> '' then
      begin
        if dbedt_nm_banco_em.Text = '' then
        begin
          BoxMensagem( 'Código do Banco inválido!', 2 );
          nbExportacao.ActivePage := 'M';
          dbedt_cd_banco_em.SetFocus;
          Consiste := False;
          Exit;
        end;
      end;
      // Agente de Seguro
      ValidCodigo( dbedt_cd_agente_seg_em);
      if dbedt_cd_agente_seg_em.Text <> '' then
      begin
        if dbedt_nm_agente_seg_em.Text = '' then
        begin
          BoxMensagem( 'Código do Agente de Seguro inválido!', 2 );
          nbExportacao.ActivePage := 'M';
          dbedt_cd_agente_seg_em.SetFocus;
          Consiste := False;
          Exit;
        end;
      end;
            // Cód Local de Entrega
      ValidCodigo( dbedt_cd_local_entrega_em );
      if dbedt_cd_local_entrega_em.Text <> '' then
      begin
        if dbedt_cd_local_entrega_em.Text = '' then
        begin
          BoxMensagem( 'Código do Local de Entrega inválido!', 2 );
          nbExportacao.ActivePage := 'M';
          dbedt_cd_local_entrega_em.SetFocus;
          Consiste := False;
          Exit;
        end;
      end;

      if pgctrl_manut_proc.ActivePage = ts_exp_mar then
      begin
        // Incoterm
        if (dbedt_cd_incoterm_m.Text <> '') and (Trim(ConsultaLookUP('TINCOTERMS_VENDA', 'CODIGO', dbedt_cd_incoterm_m.Text, 'CODIGO')) = '') then
        begin
          BoxMensagem('Incoterm inválido!', 2);
          dbedt_cd_incoterm_m.SetFocus;
          Consiste := False;
          Exit;
        end;
      end;
    end;
  end;// fim to ts_exp_mar

  // **************************************************************************
  // Consistências de Exportação Aérea
  if nbExportacao.ActivePage = 'A' then
  begin
    if ( datm_manut_proc.qry_proc_em_.State in [dsEdit, dsInsert] ) then
    begin;
      // Tabela de Frete
      if dbedtCdFreteEA.Text <> '' then
      begin
        dbedtCdFreteEA.Text := Copy('00000', 1, 5 - Length( dbedtCdFreteEA.Text)) +  dbedtCdFreteEA.Text;
        if edtNmFreteEA.Text = '' then
        begin
          BoxMensagem( 'Código da Tabela de Frete inválida!', 2 );
          nbExportacao.ActivePage := 'A';
          dbedtCdFreteEA.SetFocus;
          Consiste := False;
          Exit;
        end;
      end;
      // Cód Analista Comissária
      ValidCodigo( dbedt_cd_analista_com_ea );
      if dbedt_cd_analista_com_ea.Text <> '' then
      begin
        if dbedt_nm_analista_com_ea.Text = '' then
        begin
          BoxMensagem( 'Código do Analista da Comissária inválido!', 2 );
          nbExportacao.ActivePage := 'A';
          dbedt_cd_analista_com_ea.SetFocus;
          Consiste := False;
          Exit;
        end;
      end;
      // Cód Analista Cliente
      ValidCodigo( dbedt_cd_contato_ea );
      if dbedt_cd_contato_ea.Text <> '' then
      begin
        if dbedt_nm_contato_ea.Text = '' then
        begin
          BoxMensagem( 'Código do Contato inválido!', 2 );
          nbExportacao.ActivePage := 'A';
          dbedt_cd_contato_ea.SetFocus;
          Consiste := False;
          Exit;
        end;
      end;
      // Código do Importador
      ValidCodigo( dbedt_cd_importador_ea );
      if dbedt_cd_importador_ea.Text <> '' then
      begin
        if edt_nm_importador_ea.Text = '' then
        begin
          BoxMensagem( 'Código do Importador inválido!', 2 );
          nbExportacao.ActivePage := 'A';
          dbedt_cd_importador_ea.SetFocus;
          Consiste := False;
          Exit;
        end;
      end;
      // Cód Moeda MLE
      ValidCodigo( dbedt_cd_moeda_mle_ea );
      if dbedt_cd_moeda_mle_ea.Text <> '' then
      begin
        if dbedt_nm_moeda_mle_ea.Text = '' then
        begin
          BoxMensagem( 'Código da Moeda FOB inválido!', 2 );
          nbExportacao.ActivePage := 'A';
          dbedt_cd_moeda_mle_ea.SetFocus;
          Consiste := False;
          Exit;
        end;
      end;
      // Cód Moeda Frete
      ValidCodigo( dbedt_cd_moeda_frete_ea );
      if dbedt_cd_moeda_frete_ea.Text <> '' then
      begin
        if dbedt_nm_moeda_frete_ea.Text = '' then
        begin
          BoxMensagem( 'Código da Moeda do Frete inválido!', 2 );
          nbExportacao.ActivePage := 'A';
          dbedt_cd_moeda_frete_ea.SetFocus;
          Consiste := False;
          Exit;
        end;
      end;
      // Cód Agente
      ValidCodigo( dbedt_cd_agente_ea );
      if dbedt_cd_agente_ea.Text <> '' then
      begin
        if dbedt_nm_agente_ea.Text = '' then
        begin
          BoxMensagem( 'Código do Agente inválido!', 2 );
          nbExportacao.ActivePage := 'A';
          dbedt_cd_agente_ea.SetFocus;
          Consiste := False;
          Exit;
        end;
      end;
      // Cód Local de Embarque
      ValidCodigo( dbedt_cd_local_emb_ea );

      if dbedt_nm_local_emb_ea.Text = '' then
      begin
        BoxMensagem('Código do Local de Embarque deve ser preenchido!', 2);
        nbExportacao.ActivePage := 'A';
        dbedt_cd_local_emb_ea.SetFocus;
        Consiste := False;
        Exit;
      end;
      
      // Cód Local de Desembarque
      ValidCodigo( dbedt_cd_local_desemb_ea );
      if dbedt_cd_local_desemb_ea.Text <> '' then
      begin
        if dbedt_nm_local_desemb_ea.Text = '' then
        begin
          BoxMensagem( 'Código do Local de Desembarque inválido!', 2 );
          nbExportacao.ActivePage := 'A';
          dbedt_cd_local_desemb_ea.SetFocus;
          Consiste := False;
          Exit;
        end;
      end;
      // Cód País Destino
      ValidCodigo( dbedt_cd_pais_dest_ea );
      if dbedt_cd_pais_dest_ea.Text <> '' then
      begin
        if dbedt_nm_pais_dest_ea.Text = '' then
        begin
          BoxMensagem( 'Código do País de Destino inválido!', 2 );
          nbExportacao.ActivePage := 'A';
          dbedt_cd_pais_dest_ea.SetFocus;
          Consiste := False;
          Exit;
        end;
      end;
      // Cód País Origem
      ValidCodigo( dbedt_cd_pais_origem_ea );
      if dbedt_cd_pais_origem_ea.Text <> '' then
      begin
        if dbedt_nm_pais_origem_ea.Text = '' then
        begin
          BoxMensagem( 'Código do País de Origem inválido!', 2 );
          nbExportacao.ActivePage := 'A';
          dbedt_cd_pais_origem_ea.SetFocus;
          Consiste := False;
          Exit;
        end;
      end;
      // Cód Banco
      ValidCodigo( dbedt_cd_banco_ea );
      if dbedt_cd_banco_ea.Text <> '' then
      begin
        if dbedt_nm_banco_ea.Text = '' then
        begin
          BoxMensagem( 'Código do Banco inválido!', 2 );
          nbExportacao.ActivePage := 'A';
          dbedt_cd_banco_ea.SetFocus;
          Consiste := False;
          Exit;
        end;
      end;

      // Agente de Seguro
      ValidCodigo( dbedt_cd_agente_seg_ea);
      if dbedt_cd_agente_seg_ea.Text <> '' then
      begin
        if dbedt_nm_agente_seg_ea.Text = '' then
        begin
          BoxMensagem( 'Código do Agente de Seguro inválido!', 2 );
          nbExportacao.ActivePage := 'A';
          dbedt_cd_agente_seg_ea.SetFocus;
          Consiste := False;
          Exit;
        end;
      end;
      if pgctrl_manut_proc.ActivePage = ts_exp_mar then
      begin
        // Incoterm
        if (dbedt_cd_incoterm_a.Text <> '') and (Trim(ConsultaLookUP('TINCOTERMS_VENDA', 'CODIGO', dbedt_cd_incoterm_a.Text, 'CODIGO')) = '') then
        begin
          BoxMensagem('Incoterm inválido!', 2);
          dbedt_cd_incoterm_a.SetFocus;
          Consiste := False;
          Exit;
        end;
      end;
    end;
  end;// fim to ts_exp_aerea

  // **************************************************************************
  // Consistências de Exportação Rodoviária
  if nbExportacao.ActivePage = 'R' then
  begin
    if ( datm_manut_proc.qry_proc_em_.State in [dsEdit, dsInsert] ) then
    begin;
      // Cód Analista Comissária
      ValidCodigo( dbedt_cd_analista_com_er );
      if dbedt_cd_analista_com_er.Text <> '' then
      begin
        if dbedt_nm_analista_com_er.Text = '' then
        begin
          BoxMensagem( 'Código do Analista da Comissária inválido!', 2 );
          nbExportacao.ActivePage := 'R';
          dbedt_cd_analista_com_er.SetFocus;
          Consiste := False;
          Exit;
        end;
      end;
      // Cód Contato
      ValidCodigo( dbedt_cd_contato_er );
      if dbedt_cd_contato_er.Text <> '' then
      begin
        if dbedt_nm_contato_er.Text = '' then
        begin
          BoxMensagem( 'Código do Contato inválido!', 2 );
          nbExportacao.ActivePage := 'R';
          dbedt_cd_contato_er.SetFocus;
          Consiste := False;
          Exit;
        end;
      end;
      // Código do Importador
      ValidCodigo( dbedt_cd_importador_er );
      if dbedt_cd_importador_er.Text <> '' then
      begin
        if edt_nm_importador_er.Text = '' then
        begin
          BoxMensagem( 'Código do Importador inválido!', 2 );
          nbExportacao.ActivePage := 'R';
          dbedt_cd_importador_er.SetFocus;
          Consiste := False;
          Exit;
        end;
      end;
      // Cód Moeda MLE
      ValidCodigo( dbedt_cd_moeda_mle_er );
      if dbedt_cd_moeda_mle_er.Text <> '' then
      begin
        if dbedt_nm_moeda_mle_er.Text = '' then
        begin
          BoxMensagem( 'Código da Moeda FOB inválido!', 2 );
          nbExportacao.ActivePage := 'R';
          dbedt_cd_moeda_mle_er.SetFocus;
          Consiste := False;
          Exit;
        end;
      end;
      // Cód Moeda Frete
      ValidCodigo( dbedt_cd_moeda_frete_er );
      if dbedt_cd_moeda_frete_er.Text <> '' then
      begin
        if dbedt_nm_moeda_frete_er.Text = '' then
        begin
          BoxMensagem( 'Código da Moeda do Frete inválido!', 2 );
          nbExportacao.ActivePage := 'R';
          dbedt_cd_moeda_frete_er.SetFocus;
          Consiste := False;
          Exit;
        end;
      end;
      // Cód Agente
      ValidCodigo( dbedt_cd_agente_er );
      if dbedt_cd_agente_er.Text <> '' then
      begin
        if dbedt_nm_agente_er.Text = '' then
        begin
          BoxMensagem( 'Código do Agente inválido!', 2 );
          nbExportacao.ActivePage := 'R';
          dbedt_cd_agente_er.SetFocus;
          Consiste := False;
          Exit;
        end;
      end;

      // Fronteira
      ValidCodigo( dbedt_cd_fronteiraExp );

      if dbedt_nm_fronteiraExp.Text = '' then
      begin
        BoxMensagem('Código da Fronteira deve ser preenchido!', 2 );
        nbImportacao.ActivePage := 'R';
        dbedt_cd_fronteiraExp.SetFocus;
        Consiste := False;
        Exit;
      end;

      // Cód Local de Embarque
      ValidCodigo( dbedt_cd_local_emb_er );
      if dbedt_cd_local_emb_er.Text <> '' then
      begin
        if dbedt_nm_local_emb_er.Text = '' then
        begin
          BoxMensagem( 'Código do Local de Embarque inválido!', 2 );
          nbExportacao.ActivePage := 'R';
          dbedt_cd_local_emb_er.SetFocus;
          Consiste := False;
          Exit;
        end;
      end;
      // Cód Local de Desembarque
      ValidCodigo( dbedt_cd_local_desemb_er );
      if dbedt_cd_local_desemb_er.Text <> '' then
      begin
        if dbedt_nm_local_desemb_er.Text = '' then
        begin
          BoxMensagem( 'Código do Local de Desembarque inválido!', 2 );
          nbExportacao.ActivePage := 'R';
          dbedt_cd_local_desemb_er.SetFocus;
          Consiste := False;
          Exit;
        end;
      end;

      // Cód País Destino
      ValidCodigo( dbedt_cd_pais_dest_er );
      if dbedt_cd_pais_dest_er.Text <> '' then
      begin
        if dbedt_nm_pais_dest_er.Text = '' then
        begin
          BoxMensagem( 'Código do País de Destino inválido!', 2 );
          nbExportacao.ActivePage := 'R';
          dbedt_cd_pais_dest_er.SetFocus;
          Consiste := False;
          Exit;
        end;
      end;
      // Cód País Origem
      ValidCodigo( dbedt_cd_pais_origem_er );
      if dbedt_cd_pais_origem_er.Text <> '' then
      begin
        if dbedt_nm_pais_origem_er.Text = '' then
        begin
          BoxMensagem( 'Código do País de Origem inválido!', 2 );
          nbExportacao.ActivePage := 'R';
          dbedt_cd_pais_origem_er.SetFocus;
          Consiste := False;
          Exit;
        end;
      end;
      // Cód Banco
      ValidCodigo( dbedt_cd_banco_er );
      if dbedt_cd_banco_er.Text <> '' then
      begin
        if dbedt_nm_banco_er.Text = '' then
        begin
          BoxMensagem( 'Código do Banco inválido!', 2 );
          nbExportacao.ActivePage := 'R';
          dbedt_cd_banco_er.SetFocus;
          Consiste := False;
          Exit;
        end;
      end;
      // Agente de Seguro
      ValidCodigo( dbedt_cd_agente_seg_er );
      if dbedt_cd_agente_seg_er.Text <> '' then
      begin
        if dbedt_nm_agente_seg_er.Text = '' then
        begin
          BoxMensagem( 'Código do Agente de Seguro inválido!', 2 );
          nbExportacao.ActivePage := 'R';
          dbedt_cd_agente_seg_er.SetFocus;
          Consiste := False;
          Exit;
        end;
      end;
      if pgctrl_manut_proc.ActivePage = ts_exp_mar then
      begin
        // Incoterm
        if (dbedt_cd_incoterm_r.Text <> '') and (Trim(ConsultaLookUP('TINCOTERMS_VENDA', 'CODIGO', dbedt_cd_incoterm_r.Text, 'CODIGO')) = '') then
        begin
          BoxMensagem('Incoterm inválido!', 2);
          dbedt_cd_incoterm_r.SetFocus;
          Consiste := False;
          Exit;
        end;
      end;
    end;
  end;// fim to ts_exp_rod

  // **************************************************************************
  // Consistências de Exportação Ferroviária
  if nbExportacao.ActivePage = 'F' then
  begin
    if ( datm_manut_proc.qry_proc_em_.State in [dsEdit, dsInsert] ) then
    begin;
      // Cód Analista Comissária
      ValidCodigo( dbedt_cd_analista_com_ef );
      if dbedt_cd_analista_com_ef.Text <> '' then
      begin
        if dbedt_nm_analista_com_ef.Text = '' then
        begin
          BoxMensagem( 'Código do Analista da Comissária inválido!', 2 );
          nbExportacao.ActivePage := 'F';
          dbedt_cd_analista_com_ef.SetFocus;
          Consiste := False;
          Exit;
        end;
      end;
      // Cód Contato
      ValidCodigo( dbedt_cd_contato_ef );
      if dbedt_cd_contato_ef.Text <> '' then
      begin
        if dbedt_nm_contato_ef.Text = '' then
        begin
          BoxMensagem( 'Código do Contato inválido!', 2 );
          nbExportacao.ActivePage := 'F';
          dbedt_cd_contato_ef.SetFocus;
          Consiste := False;
          Exit;
        end;
      end;
      // Código do Importador
      ValidCodigo( dbedt_cd_importador_ef );
      if dbedt_cd_importador_ef.Text <> '' then
      begin
        if edt_nm_importador_ef.Text = '' then
        begin
          BoxMensagem( 'Código do Importador inválido!', 2 );
          nbExportacao.ActivePage := 'F';
          dbedt_cd_importador_ef.SetFocus;
          Consiste := False;
          Exit;
        end;
      end;
      // Cód Moeda MLE
      ValidCodigo( dbedt_cd_moeda_mle_ef );
      if dbedt_cd_moeda_mle_ef.Text <> '' then
      begin
        if dbedt_nm_moeda_mle_ef.Text = '' then
        begin
          BoxMensagem( 'Código da Moeda FOB inválido!', 2 );
          nbExportacao.ActivePage := 'F';
          dbedt_cd_moeda_mle_ef.SetFocus;
          Consiste := False;
          Exit;
        end;
      end;
            // Cód Local de Entrega
      ValidCodigo( dbedt_cd_local_entrega_ef );
      if dbedt_cd_local_entrega_ef.Text <> '' then
      begin
        if dbedt_cd_local_entrega_ef.Text = '' then
        begin
          BoxMensagem( 'Código do Local de Entrega inválido!', 2 );
          nbExportacao.ActivePage := 'F';
          dbedt_cd_local_entrega_ef.SetFocus;
          Consiste := False;
          Exit;
        end;
      end;
      // Cód Moeda Frete
      ValidCodigo( dbedt_cd_moeda_frete_ef );
      if dbedt_cd_moeda_frete_ef.Text <> '' then
      begin
        if dbedt_nm_moeda_frete_ef.Text = '' then
        begin
          BoxMensagem( 'Código da Moeda do Frete inválido!', 2 );
          nbExportacao.ActivePage := 'F';
          dbedt_cd_moeda_frete_ef.SetFocus;
          Consiste := False;
          Exit;
        end;
      end;
      // Cód Agente
      ValidCodigo( dbedt_cd_agente_ef );
      if dbedt_cd_agente_ef.Text <> '' then
      begin
        if dbedt_nm_agente_ef.Text = '' then
        begin
          BoxMensagem( 'Código do Agente inválido!', 2 );
          nbExportacao.ActivePage := 'F';
          dbedt_cd_agente_ef.SetFocus;
          Consiste := False;
          Exit;
        end;
      end;
      // Cód Local de Embarque
      ValidCodigo( dbedt_cd_local_emb_ef );
      if dbedt_cd_local_emb_ef.Text <> '' then
      begin
        if dbedt_nm_local_emb_ef.Text = '' then
        begin
          BoxMensagem( 'Código do Local de Embarque inválido!', 2 );
          nbExportacao.ActivePage := 'F';
          dbedt_cd_local_emb_ef.SetFocus;
          Consiste := False;
          Exit;
        end;
      end;
      // Cód Local de Desembarque
      ValidCodigo( dbedt_cd_local_desemb_ef );
      if dbedt_cd_local_desemb_ef.Text <> '' then
      begin
        if dbedt_nm_local_desemb_ef.Text = '' then
        begin
          BoxMensagem( 'Código do Local de Desembarque inválido!', 2 );
          nbExportacao.ActivePage := 'F';
          dbedt_cd_local_desemb_ef.SetFocus;
          Consiste := False;
          Exit;
        end;
      end;
      // Cód País Destino
      ValidCodigo( dbedt_cd_pais_dest_ef );
      if dbedt_cd_pais_dest_ef.Text <> '' then
      begin
        if dbedt_nm_pais_dest_ef.Text = '' then
        begin
          BoxMensagem( 'Código do País de Destino inválido!', 2 );
          nbExportacao.ActivePage := 'F';
          dbedt_cd_pais_dest_ef.SetFocus;
          Consiste := False;
          Exit;
        end;
      end;
      // Cód País Origem
      ValidCodigo( dbedt_cd_pais_origem_ef );
      if dbedt_cd_pais_origem_ef.Text <> '' then
      begin
        if dbedt_nm_pais_origem_ef.Text = '' then
        begin
          BoxMensagem( 'Código do País de Origem inválido!', 2 );
          nbExportacao.ActivePage := 'F';
          dbedt_cd_pais_origem_ef.SetFocus;
          Consiste := False;
          Exit;
        end;
      end;
      // Cód Banco
      ValidCodigo( dbedt_cd_banco_ef );
      if dbedt_cd_banco_ef.Text <> '' then
      begin
        if dbedt_nm_banco_ef.Text = '' then
        begin
          BoxMensagem( 'Código do Banco inválido!', 2 );
          nbExportacao.ActivePage := 'F';
          dbedt_cd_banco_ef.SetFocus;
          Consiste := False;
          Exit;
        end;
      end;
      // Agente de Seguro
      ValidCodigo( dbedt_cd_agente_seg_ef );
      if dbedt_cd_agente_seg_ef.Text <> '' then
      begin
        if dbedt_nm_agente_seg_ef.Text = '' then
        begin
          BoxMensagem( 'Código do Agente de Seguro inválido!', 2 );
          nbExportacao.ActivePage := 'F';
          dbedt_cd_agente_seg_ef.SetFocus;
          Consiste := False;
          Exit;
        end;
      end;
      if pgctrl_manut_proc.ActivePage = ts_exp_mar then
      begin
        // Incoterm
        if (dbedt_cd_incoterm_f.Text <> '') and (Trim(ConsultaLookUP('TINCOTERMS_VENDA', 'CODIGO', dbedt_cd_incoterm_f.Text, 'CODIGO')) = '') then
        begin
          BoxMensagem('Incoterm inválido!', 2);
          dbedt_cd_incoterm_f.SetFocus;
          Consiste := False;
          Exit;
        end;
      end;
    end;
  end;// fim to ts_exp_ferrov

  // **************************************************************************
  // Consistências de Referências
  if pgctrl_manut_proc.ActivePage = ts_ref then
  begin
    if ( Not ( datm_manut_proc.qry_ref_cliente_.State in [dsInsert, dsEdit] ) ) then
      Exit;

    if dbedt_cd_ref_normal.Text = '' then
    begin
      BoxMensagem('Campo ''Referência'' deve ser preenchido!', 2 );
      pgctrl_manut_proc.ActivePage := ts_ref;
      dbedt_cd_ref_normal.SetFocus;
      Consiste := False;
      Exit;
    end;

    if CmbItens.Visible then
    begin
      if Trim(CmbItens.Text) = '' then
      begin
        BoxMensagem('Campo ''Item do Cliente'' deve ser preenchido!', 2 );
        pgctrl_manut_proc.ActivePage := ts_ref;
        CmbItens.SetFocus;
        Consiste := False;
        Exit;
      end;
    end;

    if CmbParciais.Visible then
    begin
      if Trim(CmbParciais.Text) = '' then
      begin
        BoxMensagem('Campo ''Parcial'' deve ser preenchido!', 2 );
        pgctrl_manut_proc.ActivePage := ts_ref;
        CmbParciais.SetFocus;
        Consiste := False;
        Exit;
      end;
    end;

    // Área
    if dbedt_cd_area_ref.Text <> '' then
    begin
      with datm_manut_proc do
      begin
        ValidCodigo( dbedt_cd_area_ref );
        if edt_nm_area_ref.Text = '' then
        begin
          BoxMensagem( 'Área não cadastrada!', 2 );
          edt_nm_area_ref.Text := '';
          dbedt_cd_area_ref.SetFocus;
        end;
      end;
    end;

    if dbedt_cd_area_ref.Text = '' then
    begin
      if dblck_tp_referencia.Text = 'PEDIDO' then
      begin
        BoxMensagem( 'Área não cadastrada!', 2 );
        Consiste := False;
        dbedt_cd_area_ref.SetFocus;
        Exit;
      end;
    end;

    if Not lNaoConsiste then
    begin
      if dbedt_cd_area_ref.Text = '' then
      begin
        with datm_manut_proc do
        begin
          qry_parametros_.Close;
          qry_parametros_.Open;
          if (( qry_processo_LookGrupo.AsString = qry_parametros_.FieldByName('CD_GRUPO_BASF').AsString ) or
             ( qry_processo_LookGrupo.AsString = qry_parametros_.FieldByName('CD_GRUPO_BSG').AsString ))
               and ( msk_cd_produto.Text = '02' ) then
          begin
            BoxMensagem( 'Campo Área deve ser preenchido!', 2 );
            pgctrl_manut_proc.ActivePage := ts_ref;
            dbedt_cd_area_ref.SetFocus;
            Consiste := False;
            qry_parametros_.Close;
            Exit;
          end;
          qry_parametros_.Close;
        end;
      end;
    end;
  end;

  // *************************************************************************
  // Consistências de Embalagens
  if pgctrl_manut_proc.ActivePage = ts_embalagem then
  begin
    if ( Not ( datm_manut_proc.qry_proc_embalagem_.State in [dsInsert, dsEdit] ) ) then Exit;
    // Cód Embalagem
    if Not lNaoConsiste then
    begin
      if dbedt_cd_embalagem.Text = '' then
      begin
        BoxMensagem( 'Campo ''Cód Embalagem'' deve ser preenchido!', 2 );
        pgctrl_manut_proc.ActivePage := ts_embalagem;
        dbedt_cd_embalagem.SetFocus;
        Consiste := False;
        Exit;
      end;
    end;

    ValidCodigo( dbedt_cd_embalagem );
    if dbedt_cd_embalagem.Text <> '' then
    begin
      if dbedt_nm_embalagem.Text = '' then
      begin
        BoxMensagem( 'Código da Embalagem inválido!', 2 );
        pgctrl_manut_proc.ActivePage := ts_embalagem;
        dbedt_cd_embalagem.SetFocus;
        Consiste := False;
        Exit;
      end;
    end;
  end;

  // *************************************************************************
  // Consistências de Contêineres
  if pgctrlEstufagem.ActivePage = ts_cntr then
  begin
    if ( datm_manut_proc.qry_proc_cntr_.State in [dsInsert, dsEdit] ) then
    begin
      if (dbedt_dt_saida_arm.Date < dbedt_dt_ent_arm.Date) and (dbedt_dt_saida_arm.Date <> 0) and (dbedt_dt_ent_arm.Date <> 0) then
      begin
        Application.MessageBox('Data de Saída não pode ser menor que a Data de Entrada!', 'Data Inválida', MB_OK + MB_ICONSTOP);
        pgctrl_manut_proc.ActivePage := ts_cntr;
        FocaEmContainer;
        Consiste := False;
        Exit;
      end;
      if (dbedt_dt_saida_arm_Expo.Date < dbedt_dt_ent_arm_expo.Date) and (dbedt_dt_saida_arm_Expo.Date <> 0) and (dbedt_dt_ent_arm_expo.Date <> 0) then
      begin
        Application.MessageBox('Data de Saída não pode ser menor que a Data de Entrada!', 'Data Inválida', MB_OK + MB_ICONSTOP);
        pgctrl_manut_proc.ActivePage := ts_cntr;
        dbedtNrCntrExportacao.SetFocus;
        Consiste := False;
        Exit;
      end;

      // Nº Contêiner
      if Not lNaoConsiste then
      begin
        if datm_manut_proc.transp_servico <> '07' then
        if  ( (dbedt_nr_cntr.Text         = '') and tbsImportacao.TabVisible ) or
            ( (dbedtNrCntrExportacao.Text = '') and tbsExportacao.TabVisible ) then
        begin
          BoxMensagem( 'Campo ''Nº Contêiner'' deve ser preenchido!', 2 );
          pgctrl_manut_proc.ActivePage := ts_cntr;
          FocaEmContainer;                        
          Consiste := False;
          Exit;
        end;
      end;

      if (length(alltrim(dbedt_nr_cntr.Text))>1) or (length(alltrim(dbedtNrCntrExportacao.Text))>1) then
      begin
        if datm_manut_proc.transp_servico <> '07' then
        if  ( not( ValidaContainer(trim(dbedt_nr_cntr.Text)))         and tbsImportacao.TabVisible ) or
            ( not( ValidaContainer(trim(dbedtNrCntrExportacao.Text))) and tbsExportacao.TabVisible ) then
         begin
            showmessage('Digito do Container Inválido');
            FocaEmContainer;
            Consiste := False;
            exit;
         end;

         // Tira o foco do nmero do container e coloca novamente para definir o valor no field - Michel - 17/09/2009
         //alterado por agatha nigro  23/10/2018 - separei em duas abas. então estou validando por aba
         if dbedt_nr_cntr.Focused or dbedtNrCntrExportacao.Focused then
         begin
            if tbsImportacao.TabVisible  then
            begin
              Self.SelectNext(dbedt_nr_cntr, True, True);
              FocaEmContainer;
            end
            else
            if tbsExportacao.TabVisible then
            begin
              Self.SelectNext(dbedtNrCntrExportacao, True, True);
              FocaEmContainer;                        
            end;
         end;

         if (datm_manut_proc.qry_proc_cntr_.State = dsEdit) and not VarIsNull(datm_manut_proc.qry_proc_cntr_NR_CNTR.OldValue) then
         begin
           OldCntr := Trim(datm_manut_proc.qry_proc_cntr_NR_CNTR.OldValue);
           NewCntr := Trim(datm_manut_proc.qry_proc_cntr_NR_CNTR.NewValue);
         end
         else
         begin
           OldCntr := '';
           NewCntr := datm_manut_proc.qry_proc_cntr_NR_CNTR.AsString;
         end;

         if OldCntr <> NewCntr then
         begin
           //verifica se o container já existe.
           with TQuery.Create(Application) do
           begin
              DatabaseName := 'DBBROKER';
              SQL.Clear;
              SQl.Add(' select count(*) from TPROCESSO_CNTR (NOLOCK) ');
              SQl.Add(' where NR_PROCESSO= :NR_PROCESSO AND NR_CNTR= :NR_CNTR ');
              ParamByName('NR_PROCESSO').AsString := datm_manut_proc.qry_proc_cntr_NR_PROCESSO.AsString;
              ParamByName('NR_CNTR').AsString     := NewCntr;
              Open;
              cntr_existente:=( fields[0].AsInteger > 0 );
              close;
              Free;
           end;
           if  cntr_existente then
           begin
              if datm_manut_proc.transp_servico = '07' then
                showmessage('Placa já Cadastrada!!!')
              else
                showmessage('Container Já Cadastrado!!!');

              FocaEmContainer; 
              Consiste := False;
              exit;
           end;
         end;    
      end;
    end;

    if ( datm_manut_proc.qry_processo_.State in [dsInsert, dsEdit] ) then
    begin
      // Processo-Vinculado
      if ( dbedt_nr_processo_vinc.Text <> '' ) then
      begin
        if dbedt_nr_processo_vinc.Text = ( Trim( msk_cd_unid_neg.Text ) + Trim( msk_cd_produto.Text ) + Trim( msk_nr_processo.Text ) ) then
        begin
          BoxMensagem( 'Processo-Vinculado deve ser diferente do processo atual!', 2 );
          dbedt_nr_processo_vinc.Text := '';
          pgctrl_manut_proc.ActivePage := ts_cntr;
          dbedt_nr_processo_vinc.SetFocus;
          Exit;
        end;
        with datm_manut_proc do
        begin
          qry_processo_vinc_.Close;
          qry_processo_vinc_.ParamByName('NR_PROCESSO').AsString := Trim( dbedt_nr_processo_vinc.Text );
          qry_processo_vinc_.Open;
          if qry_processo_vinc_.RecordCount = 0 then
          begin
            BoxMensagem( 'Processo-Vinculado digitado não existe !', 2 );
            pgctrl_manut_proc.ActivePage := ts_cntr;
            dbedt_nr_processo_vinc.SetFocus;
            Consiste := False;
            qry_processo_vinc_.Close;
            Exit;
          end;
        end;
      end;
    end;
  end;

  // **************************************************************************
  // Consistências de Carga Solta
  if pgctrlEstufagem.ActivePage = ts_carga_solta then
  begin
    if ( Not ( datm_manut_proc.qry_proc_carga_solta_.State in [dsInsert, dsEdit] ) ) then Exit;
    if (dbedt_dt_saida_arm_cs.Date < dbedt_dt_ent_arm_cs.Date) and (dbedt_dt_saida_arm_cs.Date <> 0) and (dbedt_dt_ent_arm_cs.Date <> 0) then
    begin
      Application.MessageBox('Data de Saída não pode ser menor que a Data de Entrada!', 'Data Inválida', MB_OK + MB_ICONSTOP);
      pgctrl_manut_proc.ActivePage := ts_carga_solta;
      dbedt_vl_qtde.SetFocus;
      Consiste := False;
      Exit;
    end;
    // Quantidade
    if Not lNaoConsiste then
    begin
      if dbedt_vl_qtde.Text = '' then
      begin
        BoxMensagem( 'Campo ''Quantidade'' deve ser preenchido!', 2 );
        pgctrl_manut_proc.ActivePage := ts_carga_solta;
        dbedt_vl_qtde.SetFocus;
        Consiste := False;
        Exit;
      end
      else
      begin
        if ( StrToFloat( dbedt_vl_qtde.Text ) <= 0 ) then
        begin
          if not ( (StrToFloat( dbedt_vl_qtde.Text )=0) and (dblup_Tp_Estufagem.KeyValue = '37') ) then //granel
          begin
            BoxMensagem( 'Campo ''Quantidade'' deve ser maior que zero!', 2 );
            pgctrl_manut_proc.ActivePage := ts_carga_solta;
            dbedt_vl_qtde.SetFocus;
            Consiste := False;
            Exit;
          end;
        end;
      end;
      if dbedt_nm_especie.Text = '' then
      begin
        BoxMensagem( 'Campo ''Espécie'' deve ser preenchido!', 2 );
        pgctrl_manut_proc.ActivePage := ts_carga_solta;
        dbedt_nm_especie.SetFocus;
        Consiste := False;
        Exit;
      end;
      if datm_manut_proc.qry_proc_carga_solta_TP_ESTUFAGEM.AsString = '' then // Michel - 12/08/2009 - Ocorrencia 10800/09
      begin
        BoxMensagem('Campo ''Espécie (SISCOMEX)'' deve ser preenchido!', 2);
        pgctrl_manut_proc.ActivePage := ts_carga_solta;
        dblup_Tp_Estufagem.SetFocus;
        Result := False;
        Exit;
      end;
    end;
  end;

  // **************************************************************************
  // Consistências de Despacho de Importação
  if pgctrl_manut_proc.ActivePage = ts_despacho_imp then
  begin
    // Consistências de Despacho Importação - Processo
    if ( datm_manut_proc.qry_processo_.State in [dsInsert, dsEdit] ) then
    begin
      //Data de vencimento da armazenagem - Eric - 04/05/2012
      if Trim(StringReplace(dbedt_dt_vencto_armazenagem.Text, '/', '', [rfReplaceAll])) = '' then
        datm_manut_proc.qry_processo_DT_VENCTO_ARMAZENAGEM.Clear;
        
      // Cód Tabela SDA
      ValidCodigo( dbedt_cd_tab_sda_imp );
      if dbedt_cd_tab_sda_imp.Text <> '' then
      begin
        if dbedt_nm_tab_sda_imp.Text = '' then
        begin
          BoxMensagem( 'Código da tabela S.D.A. inválido!', 2 );
          pgctrl_manut_proc.ActivePage := ts_despacho_imp;
          dbedt_cd_tab_sda_imp.SetFocus;
          Consiste := False;
          Exit;
        end;
      end;
      // Cód Despachante
      ValidCodigo( dbedt_cd_despachante_imp );
      if dbedt_cd_despachante_imp.Text <> '' then
      begin
        if dbedt_nm_despachante_imp.Text = '' then
        begin
          BoxMensagem( 'Código do Despachante inválido!', 2 );
          pgctrl_manut_proc.ActivePage := ts_despacho_imp;
          dbedt_cd_despachante_imp.SetFocus;
          Consiste := False;
          Exit;
        end;
      end;
    end;
    // Consistências de Despacho Importação - Fatura
    if pgctrl_despacho_imp.ActivePage = ts_doctos_imp then
    begin
      if datm_manut_proc.qry_Doctos_Inst.State in [dsInsert, dsEdit] then
      begin
        if dbedt_nr_fat_imp.Text = '' then
        begin
          BoxMensagem( 'Nº do Documento deve ser preenchido !', 2 );
          pgctrl_manut_proc.ActivePage   := ts_despacho_imp;
          pgctrl_despacho_imp.ActivePage := ts_doctos_imp;
          dbedt_nr_fat_imp.SetFocus;
          Consiste := False;
          Exit;
        end;
      end;
    end;
    // Consistências de Despacho Importação - Controle/Prazos EADI
    if pgctrl_despacho_imp.ActivePage = ts_contr_imp then
    begin
      if datm_manut_proc.qry_contr_imp_.State in [dsInsert, dsEdit] then
      begin
        if dbedt_nr_contr_imp.Text = '' then
        begin
          BoxMensagem( 'Nº da Fatura deve ser preenchido !', 2 );
          pgctrl_manut_proc.ActivePage   := ts_despacho_imp;
          pgctrl_despacho_imp.ActivePage := ts_contr_imp;
          dbedt_nr_contr_imp.SetFocus;
          Consiste := False;
          Exit;
        end;

        if ( dbedt_dt_controle.Date  = 0 ) then
        begin
          BoxMensagem( 'A data base para vencimento deve ser preenchido !', 2);
          pgctrl_manut_proc.ActivePage   := ts_despacho_imp;
          pgctrl_despacho_imp.ActivePage := ts_contr_imp;
          dbedt_dt_controle.SetFocus;
          Consiste := False;
          Exit;
        end;

        if ( dblckpbox_cond_venda_ent.Text = 'Até' ) then
        begin
          if (dbedt_nr_dias.Text = '') or (strtoint(dbedt_nr_dias.Text) = 0) then
          begin
            BoxMensagem( 'O número de dias deve ser preenchido !', 2);
            pgctrl_manut_proc.ActivePage   := ts_despacho_imp;
            pgctrl_despacho_imp.ActivePage := ts_contr_imp;
            dblckpbox_cond_venda_ent.SetFocus;
            Consiste := False;
            Exit;
          end;
        end;
      end;
    end;

    // Consistências de Despacho Importação - Fatura
    if pgctrl_despacho_imp.ActivePage = ts_exportador then
    begin
      if datm_manut_proc.qry_exportador_.State in [dsInsert, dsEdit] then
      begin
        if Trim(datm_manut_proc.qry_exportador_CD_EXPORTADOR.AsString) = '' then
        begin
          BoxMensagem('Exportador deve ser preenchido!', 2);
          pgctrl_manut_proc.ActivePage   := ts_despacho_imp;
          pgctrl_despacho_imp.ActivePage := ts_exportador;
          dbgrid_exportador.SetFocus;
          Consiste := False;
          Exit;
        end;
      end;
    end;

    // Consistências de Despacho Importação - Retificação
    if pgctrl_despacho_imp.ActivePage = ts_Retificacoes then
    begin
      if datm_manut_proc.qryRetificaDI.State in [dsInsert, dsEdit] then
      begin
        if not ChkGeralRetificacao.Checked then
        begin
          if Trim(EditAdicao.Text) = '' then
          begin
            BoxMensagem( 'Campo Nº da Adição obrigatório !', 2 );
            EditAdicao.SetFocus;
            Consiste := False;
            Exit;
          end
          else
          begin
            if ConsultaLookUPSQL('select NR_ADICAO from TADICAO_DE_IMPORTACAO (NOLOCK) ' +
                                 'where nr_processo = ''' + datm_manut_proc.qry_processo_NR_PROCESSO.AsString + '''' +
                                 ' and NR_ADICAO = ''' + EditAdicao.Text + '''','NR_ADICAO') = '' then
            begin
              BoxMensagem( 'Nº da Adição digitado não existe !', 2 );
              EditAdicao.SelectAll;
              EditAdicao.SetFocus;
              Consiste := False;
              Exit;
            end;
          end;
        end;

        if not VerificaCamposTag(frm_manut_proc, [ts_Retificacoes]) then
        begin
          Consiste := False;
          Exit;
        end;
      end;
    end;
  end;
  // **************************************************************************
  // Consistências de Licença de Importação
  if pgctrl_manut_proc.ActivePage = ts_licenca_importacao then
  begin
    if datm_manut_proc.qry_li_.State in [dsInsert, dsEdit] then
    begin
      if dbedt_nr_li.Text = '' then
      begin
        BoxMensagem( 'Nº da LI deve ser preenchido !', 2 );
        pgctrl_manut_proc.ActivePage := ts_licenca_importacao;
        dbedt_nr_li.SetFocus;
        Consiste := False;
        Exit;
      end;
    end;
    if datm_manut_proc.qry_li_orgao_anuente_.State in [dsInsert, dsEdit] then
    begin
      if dblckp_orgao_anuente.Text = '' then
      begin
        BoxMensagem( 'Selecione o Orgão Anuente !', 2 );
        pgctrl_manut_proc.ActivePage := ts_licenca_importacao;
        dblckp_orgao_anuente.SetFocus;
        Consiste := False;
        Exit;
      end;
    end;
  end;
  // Fim do Consiste LI

  // **************************************************************************
  // Consistências de Despacho de Exportação
  if pgctrl_manut_proc.ActivePage = ts_despacho_exp then
  begin
    // Consistências de Despacho Exportação - Processo
    if ( datm_manut_proc.qry_processo_.State in [dsInsert, dsEdit] ) then
    begin
      // Cód Tabela SDA
      ValidCodigo( dbedt_cd_tab_sda_exp );
      if dbedt_cd_tab_sda_exp.Text <> '' then
      begin
        if dbedt_nm_tab_sda_exp.Text = '' then
        begin
          BoxMensagem( 'Código da tabela S.D.A. inválido!', 2 );
          pgctrl_manut_proc.ActivePage := ts_despacho_exp;
          dbedt_cd_tab_sda_exp.SetFocus;
          Consiste := False;
          Exit;
        end;
      end;
      // Cód Despachante
      ValidCodigo( dbedt_cd_despachante_exp );
      if dbedt_cd_despachante_exp.Text <> '' then
      begin
        if dbedt_nm_despachante_exp.Text = '' then
        begin
          BoxMensagem( 'Código do Despachante inválido!', 2 );
          pgctrl_manut_proc.ActivePage := ts_despacho_exp;
          dbedt_cd_despachante_exp.SetFocus;
          Consiste := False;
          Exit;
        end;
      end;
    end;

    // Consistências de Despacho Exportação - Fatura
    if pgctrl_despacho_exp.ActivePage = ts_fat_exp then
    begin
      if datm_manut_proc.qry_Doctos_Inst.State in [dsInsert, dsEdit] then
      begin
        if dbedt_nr_fat_exp.Text = '' then
        begin
          BoxMensagem( 'Nº da Fatura deve ser preenchido !', 2 );
          pgctrl_manut_proc.ActivePage   := ts_despacho_exp;
          pgctrl_despacho_exp.ActivePage := ts_fat_exp;
          dbedt_nr_fat_exp.SetFocus;
          Consiste := False;
          Exit;
        end;
      end;
    end;
  end;

  // Validar o preenchimento do país de destino - Michel - 01/12/2008
  if (pgctrl_manut_proc.ActivePage = ts_exp_mar) and (Trim(datm_manut_proc.qry_processo_CD_PRODUTO.AsString) = '02') and (dbedt_nm_pais_dest_em.Text = '') then
  begin
    // Sai se não for possível preencher o campo
    if ((nbExportacao.ActivePage = 'M') and (dbedt_cd_pais_dest_em.ReadOnly)) or
       ((nbExportacao.ActivePage = 'A') and (dbedt_cd_pais_dest_ea.ReadOnly)) or
       ((nbExportacao.ActivePage = 'R') and (dbedt_cd_pais_dest_er.ReadOnly)) or
       ((nbExportacao.ActivePage = 'F') and (dbedt_cd_pais_dest_ef.ReadOnly)) then
      Exit;

    BoxMensagem('País de destino não preenchido!', 2 );
    pgctrl_manut_proc.ActivePage := ts_exp_mar;

    if nbExportacao.ActivePage = 'M' then
      dbedt_cd_pais_dest_em.SetFocus
    else if nbExportacao.ActivePage = 'A' then
      dbedt_cd_pais_dest_ea.SetFocus
    else if nbExportacao.ActivePage = 'R' then
      dbedt_cd_pais_dest_er.SetFocus
    else if nbExportacao.ActivePage = 'F' then
     dbedt_cd_pais_dest_ef.SetFocus;

    Consiste := False;
    Exit;
  end;

  if (datm_manut_proc.qry_processo_CD_PRODUTO.AsString ='02') then
  begin
    if length(trim(edtRUC.text)) = 35 then
    begin
      if (edtRUC.text <> datm_manut_proc.vCodRUCInicial) then
      begin
        ProcessoRucRepetida := ValidaNumeroRUC(edtRUC.text, datm_manut_proc.qry_processo_NR_PROCESSO.asString);
        if ProcessoRucRepetida <> '' then
        begin
          if MessageDlg(PAnsiChar('Número da RUC já está cadastrado em outro processo: ' +ProcessoRucRepetida+
                        '. Gravar mesmo assim?') , mtConfirmation, [mbYes, mbNo], 3) = mrNo then
            edtRUC.EditText := '';
          {EXPO-283 - pediram para nao bloquear, apenas avisar.}
        {  Consiste := False;
          Exit;  }
        end;
      end;
    end;
  end;
end;

procedure Tfrm_manut_proc.FormClose(Sender: TObject;
   var Action: TCloseAction);
begin
  with datm_manut_proc do
  begin
    lAbertura := True;
    cd_unid_neg_gestao := msk_cd_unid_neg.Text;
    cd_prod_gestao     := msk_cd_produto.Text;
    nr_processo_gestao := Trim( msk_cd_unid_neg.Text ) + Trim( msk_cd_produto.Text ) + Trim( msk_nr_processo.Text );

    qry_traz_default_.Close;
    qry_tp_banco_exp.Close;
    qry_tp_pend_.Close;
    qry_li_orgao_anuente_.Close;
    qry_orgao_anuente_.Close;
    qry_li_.Close;
    qry_Doctos_Inst.Close;
    qry_contr_imp_.Close;
    qry_re_.Close;
    qry_pais_.Close;
    qry_agente_.Close;
    qry_embarcacao_.Close;
    qry_local_.Close;
    qry_usuario_habilitacao_.Close;
    qry_ref_cliente_.Close;
    qry_processo_nf_.Close;
    qry_proc_embalagem_.Close;
    qry_proc_cntr_.Close;
    qry_proc_carga_solta_.Close;
    qry_processo_re_.Close;
    qry_dde_nf_.Close;
    qry_tp_dta_.Close;
    qry_empresa_nac_.Close;
    qry_processo_.Close;
  end;

  // by carlos - 07/06/2010
  if tag=0 then
  begin
     msk_nr_processo.Text := '';
     str_cd_rotina_atalho := '';
     str_nr_processo      := '';
     pesq_nr_proc         := '';
  end;
end;

procedure Tfrm_manut_proc.btn_co_clienteClick(Sender: TObject);
var
  vCliente: String;
begin
  if Sender is TSpeedButton then
  begin
    if not PoeEmEdicao(datm_manut_proc.qry_processo_) then
      Exit;
    if (Sender as TSpeedButton).Enabled then
    begin
      vCliente := ConsultaOnLineExFiltro('TEMPRESA_NAC', 'Cliente', ['CD_EMPRESA', 'NM_EMPRESA', 'AP_EMPRESA', 'CGC_EMPRESA', 'END_EMPRESA'],
         ['Código', 'Descrição', 'Apelido', 'CNPJ', 'Endereço'], 'CD_EMPRESA', 'CD_GRUPO = ''' + datm_manut_proc.qry_processo_CD_GRUPO.AsString + '''', frm_main.mi_cad_emp_nac, dbedt_cd_cliente.text, 1);
      if vCliente <> datm_manut_proc.qry_processo_CD_CLIENTE.AsString then
        datm_manut_proc.qry_processo_CD_CLIENTE.AsString := vCliente;
    end;
  end
  else
    edt_nm_cliente.Text := ConsultaLookUP('TEMPRESA_NAC', 'CD_EMPRESA', dbedt_cd_cliente.Text, 'NM_EMPRESA');
  msk_CNPJ_Cliente.Text := ConsultaLookUPSQL(' SELECT CGC_EMPRESA  ' +
                                                ' FROM TEMPRESA_NAC (NOLOCK)       ' +
                                                ' WHERE CD_EMPRESA = ''' + dbedt_cd_cliente.Text + '''', 'CGC_EMPRESA');
end;

procedure Tfrm_manut_proc.btn_co_servicoClick(Sender: TObject);
var
  vCdServico: String;
begin
  if Not lAbertura then Edita;
  if Sender is TSpeedButton then
  begin
    if not PoeEmEdicao(datm_manut_proc.qry_processo_) then exit;
    if (Sender as TSpeedButton).Enabled Then
      //datm_manut_proc.qry_processo_CD_SERVICO.AsString := ConsultaOnLineEx('TSERVICO','Serviços',['CD_SERVICO','NM_SERVICO'],['Código','Descrição'],'CD_SERVICO',frm_main.mi_tabela_servico, 1, dbedt_cd_servico.text)
      vCdServico := ConsultaOnLineExSQL(' SELECT S.CD_SERVICO AS SCD_SERVICO, S.NM_SERVICO AS SNM_SERVICO ' +
                                        ' FROM TSERVICO S (NOLOCK) ' +
                                        '    INNER JOIN TCLIENTE_SERVICO CS (NOLOCK) ON CS.CD_SERVICO = CONVERT(VARCHAR, S.CD_SERVICO) ' +
                                        ' WHERE CS.CD_CLIENTE       = ' + QuotedStr(datm_manut_proc.qry_processo_CD_CLIENTE.AsString) +
                                        '   AND CS.CD_UNID_NEG      = ' + QuotedStr(datm_manut_proc.qry_processo_CD_UNID_NEG.AsString) +
                                        '   AND CS.CD_PRODUTO       = ' + QuotedStr(datm_manut_proc.qry_processo_CD_PRODUTO.AsString) +
                                        '   AND CS.IN_ATIVO         = ''1'' ' +
                                        '   AND S.IN_ATIVO          = ''1'' ' +
                                        '   AND S.CD_VIA_TRANSPORTE = (SELECT CD_VIA_TRANSPORTE ' +
                                        '                              FROM TSERVICO S2 (NOLOCK) ' +
                                        '                              WHERE S2.CD_SERVICO = ' + QuotedStr(datm_manut_proc.qry_processo_CD_SERVICO.AsString) + ') ',
         'Serviços', ['SCD_SERVICO', 'SNM_SERVICO'], ['Código', 'Descrição'], 'SCD_SERVICO', nil, dbedt_cd_servico.text);
      if dbedt_cd_servico.Text <> vCdServico then
        dbedt_cd_servico.Text := vCdServico;
  end
  else
    edt_nm_servico.Text := ConsultaLookUP('TSERVICO', 'CD_SERVICO', dbedt_cd_servico.Text, 'NM_SERVICO');
end;

procedure Tfrm_manut_proc.btn_co_repClick(Sender: TObject);
begin
  if Not lAbertura then Edita;
  if Sender is TSpeedButton then
  begin
    if not PoeEmEdicao(datm_manut_proc.qry_processo_) then exit;
    If (Sender as TSpeedButton).Enabled Then
      datm_manut_proc.qry_processo_CD_REPRESENTANTE.AsString := ConsultaOnLineExSQL('SELECT CD_EMPRESA,NM_EMPRESA FROM TEMPRESA_NAC EN (NOLOCK), TCLIENTE_REPRESENTANTE CR (NOLOCK)' +
                                                                                    ' WHERE EN.IN_REPRESENTANTE = ''1''' +
                                                                                    '   AND EN.CD_EMPRESA = CR.CD_REPRESENTANTE ' +
                                                                                    '   AND CR.CD_CLIENTE = ''' + dbedt_cd_cliente.text + '''' +
                                                                                    '   AND CR.CD_SERVICO = ''' + dbedt_cd_servico.text + '''',
                                                                                    'Representantes',['CD_EMPRESA','NM_EMPRESA'],['Código','Descrição'],'CD_EMPRESA',frm_main.mi_cad_emp_nac, dbedt_cd_rep.Text)
  end
  else
    edt_nm_rep.Text := ConsultaLookUPSQL('SELECT NM_EMPRESA FROM TEMPRESA_NAC (NOLOCK) WHERE CD_EMPRESA = ''' + dbedt_cd_rep.Text + ''' AND IN_REPRESENTANTE = ''1''','NM_EMPRESA');
end;

procedure Tfrm_manut_proc.btn_co_moeda_frete_imClick(Sender: TObject);
begin
  if Not lAbertura then Edita;
  if Sender is TSpeedButton then
  begin
    if not PoeEmEdicao(datm_manut_proc.qry_proc_im_) then exit;
    If (Sender as TSpeedButton).Enabled Then
      datm_manut_proc.qry_proc_im_CD_MOEDA_FRETE.AsString := ConsultaOnLineEx('TMOEDA_BROKER','Moeda',['CD_MOEDA','NM_MOEDA'],['Código','Descrição'],'CD_MOEDA',frm_main.mi_cad_moeda, 1, dbedt_cd_moeda_frete_im.Text)
  end
  else
    dbedt_nm_moeda_frete_im.Text := ConsultaLookUP('TMOEDA_BROKER','CD_MOEDA',dbedt_cd_moeda_frete_im.Text,'NM_MOEDA');
end;

procedure Tfrm_manut_proc.btn_co_agente_imClick(Sender: TObject);
begin
  if Not lAbertura then Edita;
  if Sender is TSpeedButton then
  begin
    if not PoeEmEdicao(datm_manut_proc.qry_proc_im_) then
    exit;
    If (Sender as TSpeedButton).Enabled Then
      datm_manut_proc.qry_proc_im_CD_AGENTE.AsString := ConsultaOnLineEx('TAGENTE','Agentes',['CD_AGENTE','NM_AGENTE'],['Código','Descrição'],'CD_AGENTE',frm_main.mi_agentes, 1, dbedt_cd_agente_im.Text)
  end
  else
    dbedt_nm_agente_im.Text := ConsultaLookUP('TAGENTE','CD_AGENTE',dbedt_cd_agente_im.Text,'NM_AGENTE');
end;

procedure Tfrm_manut_proc.btn_co_amz_atr_imClick(Sender: TObject);
begin
  if Not lAbertura then Edita;
  if Sender is TSpeedButton then
  begin
    if not PoeEmEdicao(datm_manut_proc.qry_proc_im_) then
    exit;
    If (Sender as TSpeedButton).Enabled Then
      datm_manut_proc.qry_proc_im_CD_ARMAZEM_ATRACACAO.AsString := ConsultaOnLineEx('TARMAZEM','Armazém',['CD_ARMAZEM','NM_ARMAZEM','NM_SIGLA', 'CD_RECINTO'],['Código','Nome','Sigla', 'Recinto'],'CD_ARMAZEM',frm_main.mi_cad_amz, 1, dbedt_cd_amz_atr_im.text)
  end
  else
    dbedt_nm_amz_atr_im.Text := ConsultaLookUP('TARMAZEM','CD_ARMAZEM',dbedt_cd_amz_atr_im.Text,'NM_ARMAZEM');
end;

procedure Tfrm_manut_proc.btn_co_amz_des_imClick(Sender: TObject);
begin
  edt_cd_recinto_alf_im.text := ConsultaLookUPSQL('SELECT CD_RECINTO from TARMAZEM (NOLOCK) where CD_ARMAZEM ='''+ dbedt_cd_amz_des_im.text +''' ', 'CD_RECINTO');
  edt_cd_setorm.text:= ConsultaLookUPSQL('SELECT CD_SETOR from TARMAZEM (NOLOCK) where CD_RECINTO ='''+ edt_cd_recinto_alf_im.text +''' ', 'CD_SETOR');

  if Not lAbertura then Edita;
  if Sender is TSpeedButton then
  begin
    if not PoeEmEdicao(datm_manut_proc.qry_proc_im_) then
    exit;
    If (Sender as TSpeedButton).Enabled Then
      datm_manut_proc.qry_proc_im_CD_ARMAZEM_DESCARGA.AsString := ConsultaOnLineEx('TARMAZEM','Armazém',['CD_ARMAZEM','NM_ARMAZEM','NM_SIGLA', 'CD_RECINTO'],['Código','Nome','Sigla', 'Recinto'],'CD_ARMAZEM',frm_main.mi_cad_amz, 1, dbedt_cd_amz_des_im.text)
  end
  else
    dbedt_nm_amz_des_im.Text := ConsultaLookUP('TARMAZEM','CD_ARMAZEM',dbedt_cd_amz_des_im.Text,'NM_ARMAZEM');
end;

procedure Tfrm_manut_proc.btn_co_embarc_imClick(Sender: TObject);
begin
  if Not lAbertura then Edita;
  if Sender is TSpeedButton then
  begin
    if not PoeEmEdicao(datm_manut_proc.qry_proc_im_) then
    exit;
    if (Sender as TSpeedButton).Enabled Then
      //datm_manut_proc.qry_proc_im_CD_EMBARCACAO.AsString := ConsultaOnLineEx('TEMBARCACAO','Embarcação',['CD_EMBARCACAO','NM_EMBARCACAO'],['Código','Nome'],'CD_EMBARCACAO',frm_main.mi_cad_embar, 1, dbedt_cd_embarc_im.Text)
      datm_manut_proc.qry_proc_im_CD_EMBARCACAO.AsString := ConsultaOnLineExSQL('select CD_EMBARCACAO, NM_EMBARCACAO from TEMBARCACAO (NOLOCK) where IN_ATIVO = 1 ',
                                                                                'Cadastro de Embarcações',
                                                                                ['CD_EMBARCACAO','NM_EMBARCACAO'],
                                                                                ['Código','Embarcação'],
                                                                                'CD_EMBARCACAO', nil, dbedt_cd_embarc_im.Text);
  end
  else
    dbedt_nm_embarc_im.Text := ConsultaLookUPSQL(' select CD_EMBARCACAO, NM_EMBARCACAO from TEMBARCACAO (NOLOCK) where IN_ATIVO = 1 and CD_EMBARCACAO = ''' + dbedt_cd_embarc_im.Text + '''', 'NM_EMBARCACAO');
end;

procedure Tfrm_manut_proc.btn_co_local_emb_imClick(Sender: TObject);
begin
  if Not lAbertura then Edita;
  if Sender is TSpeedButton then
  begin
    if not PoeEmEdicao(datm_manut_proc.qry_proc_im_) then
    exit;
    If (Sender as TSpeedButton).Enabled Then
      datm_manut_proc.qry_proc_im_CD_LOCAL_EMBARQUE.AsString := ConsultaOnLineEx('TLOCAL_EMBARQUE','Local Embarque',['CODIGO','DESCRICAO'],['Código','Nome'],'CODIGO',frm_main.mi_cad_local_emb, 1, dbedt_cd_local_emb_im.Text)
  end
  else
  begin
    dbedt_nm_local_emb_im.Text := ConsultaLookUP('TLOCAL_EMBARQUE','CODIGO',dbedt_cd_local_emb_im.Text,'DESCRICAO');
    If datm_manut_proc.qry_proc_im_CD_PAIS_ORIGEM.IsNull then
      dbedt_cd_pais_origem_im.Text := ConsultaLookUP('TLOCAL_EMBARQUE','CODIGO',dbedt_cd_local_emb_im.Text,'CD_PAIS');
  end;
end;

procedure Tfrm_manut_proc.btn_co_local_desemb_imClick(Sender: TObject);
begin
  if Not lAbertura then Edita;
  if Sender is TSpeedButton then
  begin
    if not PoeEmEdicao(datm_manut_proc.qry_proc_im_) then
    exit;
    If (Sender as TSpeedButton).Enabled Then
      datm_manut_proc.qry_proc_im_CD_LOCAL_DESEMBARQUE.AsString := ConsultaOnLineEx('TLOCAL_EMBARQUE','Local Desembarque',['CODIGO','DESCRICAO'],['Código','Nome'],'CODIGO',frm_main.mi_cad_local_emb, 1, dbedt_cd_local_desemb_im.Text)
  end
  else
    dbedt_nm_local_desemb_im.Text := ConsultaLookUP('TLOCAL_EMBARQUE','CODIGO',dbedt_cd_local_desemb_im.Text,'DESCRICAO');
end;

procedure Tfrm_manut_proc.btn_co_pais_origem_imClick(Sender: TObject);
begin
  if Not lAbertura then Edita;
  if Sender is TSpeedButton then
  begin
    if not PoeEmEdicao(datm_manut_proc.qry_proc_im_) then
    Exit;
    If (Sender as TSpeedButton).Enabled Then
      datm_manut_proc.qry_proc_im_CD_PAIS_ORIGEM.AsString := ConsultaOnLineEx('TPAIS','Países',['CODIGO','DESCRICAO'],['Código','Nome'],'CODIGO',nil, 1, dbedt_cd_pais_origem_im.Text)
  end
  else
    dbedt_nm_pais_origem_im.Text := ConsultaLookUP('TPAIS','CODIGO',dbedt_cd_pais_origem_im.Text,'DESCRICAO')
end;

procedure Tfrm_manut_proc.btn_co_moeda_mle_emClick(Sender: TObject);
begin
  if Not lAbertura then Edita;
  if Sender is TSpeedButton then
  begin
    if not PoeEmEdicao(datm_manut_proc.qry_proc_em_) then
      exit;
      
    If (Sender as TSpeedButton).Enabled Then
      datm_manut_proc.qry_proc_em_CD_MOEDA_MLE.AsString := ConsultaOnLineEx('TMOEDA_BROKER','Moeda',['CD_MOEDA','AP_MOEDA'],['Código','Descrição'],'CD_MOEDA',frm_main.mi_cad_moeda, 1, dbedt_cd_moeda_mle_em.text)
  end
  else
    dbedt_nm_moeda_mle_em.Text := ConsultaLookUP('TMOEDA_BROKER','CD_MOEDA',dbedt_cd_moeda_mle_em.Text,'AP_MOEDA')
end;

procedure Tfrm_manut_proc.btn_co_amz_est_emClick(Sender: TObject);
begin
  if Not lAbertura then Edita;
  if Sender is TSpeedButton then
  begin
    if not PoeEmEdicao(datm_manut_proc.qry_proc_em_) then
      exit;
      
    If (Sender as TSpeedButton).Enabled Then
      datm_manut_proc.qry_proc_em_CD_ARMAZEM_ESTOCAGEM.AsString := ConsultaOnLineEx('TARMAZEM','Armazém',['CD_ARMAZEM','NM_ARMAZEM','NM_SIGLA','CD_RECINTO'],['Código','Nome','Sigla', 'Recinto'],'CD_ARMAZEM',frm_main.mi_cad_amz,1, dbedt_cd_amz_est_em.text)
  end
  else
    dbedt_nm_amz_est_em.Text := ConsultaLookUP('TARMAZEM','CD_ARMAZEM',dbedt_cd_amz_est_em.Text,'NM_ARMAZEM');
end;

procedure Tfrm_manut_proc.btn_co_unid_negClick(Sender: TObject);
begin
  datm_manut_proc.qry_processo_.Close;
  if Sender Is TSpeedButton Then
  begin
    msk_cd_unid_neg.Text := ConsultaOnLineEx('TUNID_NEG','Unidade de Negócio',['CD_UNID_NEG','AP_UNID_NEG'],['Código','Descrição'],'CD_UNID_NEG',frm_main.mi_tabela_unid_neg, 1,msk_cd_unid_neg.Text);
  end else
    edt_nm_unid_neg.Text := ConsultaLookUP('TUNID_NEG','CD_UNID_NEG', msk_cd_unid_neg.Text,'AP_UNID_NEG');
end;

procedure Tfrm_manut_proc.dbedt_pb_refChange(Sender: TObject);
begin
//  if Not lAbertura then
//    btn_mi(False, True, True, False);
end;

procedure Tfrm_manut_proc.btn_incluirClick(Sender: TObject);
begin
  with datm_manut_proc do
  begin

    if pgctrl_manut_proc.ActivePage = ts_ref then
    begin
      if qry_ref_cliente_.State in [dsInsert] then
      begin
        qry_ref_cliente_.Cancel;
        dbg_normal.Enabled := True;
      end;

      qry_ref_cliente_.DisableControls;
      dbedt_cd_ref_normal.ReadOnly := False;
      qry_ref_cliente_.Append;
      qry_ref_cliente_.EnableControls;

      qry_ref_cliente_NR_PROCESSO.AsString  := qry_processo_NR_PROCESSO.AsString;
      qry_ref_cliente_NR_SEQUENCIA.AsString := UltCod( qry_ult_ref_cliente_, qry_ult_ref_cliente_ULTIMO );

      if ( Trim( msk_cd_produto.Text ) = '01' ) or ( Trim( msk_cd_produto.Text ) = '03' ) then
        qry_ref_cliente_TP_REFERENCIA.AsString := '01';

      qry_ref_cliente_NR_PARCIAL.AsInteger := 1;
      dbedt_cd_ref_normal.SetFocus;
      dbg_normal.Enabled := False;
    end;

    if pgctrl_manut_proc.ActivePage = ts_embalagem then
    begin
      if qry_proc_embalagem_.State in [dsInsert] then qry_proc_embalagem_.Cancel;
      dbedt_cd_embalagem.ReadOnly := False;
      dbedt_qt_embalagem.ReadOnly := False;
      dbedt_pb_embalagem.ReadOnly := False;

      btn_co_embalagem.Enabled    := True;
      
      qry_proc_embalagem_.Append;
      qry_proc_embalagem_NR_PROCESSO.AsString := qry_processo_NR_PROCESSO.AsString;
      dbedt_cd_embalagem.SetFocus;
    end;

    if ( pgctrl_manut_proc.ActivePage = ts_estufagem ) and ( pgctrlEstufagem.ActivePage = ts_cntr ) then
    begin
      if qry_proc_cntr_.State in [dsInsert] then
        qry_proc_cntr_.Cancel;

      dbedt_dt_presenca_carga.ReadOnly := False;
      dbedt_dt_ent_arm.ReadOnly        := False;
      dbedt_dt_desova.ReadOnly         := False;
      dbedt_dt_entr_fabr.ReadOnly      := False;
      dbedt_nr_presenca_carga.ReadOnly := False;
      dbedt_nr_cntr.ReadOnly           := False;
      dbedt_nr_free_time.ReadOnly      := False;
      dbedt_dt_dev_cntr.ReadOnly       := False;
      dbchkInDemurrage.ReadOnly        := False;
      dbchkInDesova.ReadOnly           := False;
      dblckp_box_tp_cntr.ReadOnly      := False;

      qry_proc_cntr_.Insert;
    {  qry_proc_cntr_NR_PROCESSO.AsString         := qry_processo_NR_PROCESSO.AsString;
      qry_proc_cntr_IN_DESOVA.AsString           := '0';
      qry_proc_cntr_IN_DEMURRAGE.AsString        := '0';
      qry_proc_cntr_IN_PAGTO_EFETIVADO.AsBoolean := False;
      qry_proc_cntr_TP_DIAS.AsString             := '1';
      qry_proc_cntr_TP_CNTR.AsString             := '01';
      qry_proc_cntr_IN_PARTE_LOTE.AsString       := '0';    }

      if Trim( msk_nr_free_time.Text ) <> '' then
        qry_proc_cntr_NR_FREE_TIME.AsInteger     := StrToInt( Trim( msk_nr_free_time.Text ) );

      qry_dt_ent_.Close;
      qry_dt_ent_.ParamByName('NR_PROCESSO').AsString := Trim( qry_proc_cntr_NR_PROCESSO.AsString );
      qry_dt_ent_.Open;

      if Not qry_dt_ent_.EOF then
      begin
        if Not qry_dt_ent_DT_REALIZACAO.IsNull then
          qry_proc_cntr_DT_ENT.AsDateTime := qry_dt_ent_DT_REALIZACAO.AsDateTime;
      end;

      qry_dt_ent_.Close;

      FocaEmContainer;
    end;

    // Carga Solta
    if ( pgctrl_manut_proc.ActivePage = ts_estufagem ) and ( pgctrlEstufagem.ActivePage = ts_carga_solta ) then
    begin
      if qry_proc_carga_solta_.State in [dsInsert] then
        qry_proc_carga_solta_.Cancel;

      dbedt_nr_presenca_carga.ReadOnly  := False;
      dbedt_dt_presenca_carga.ReadOnly  := False;
      dbedt_vl_qtde.ReadOnly            := False;
      dbedt_nm_especie.ReadOnly         := False;

      qry_proc_carga_solta_.Append;
      qry_proc_carga_solta_NR_PROCESSO.AsString := qry_processo_NR_PROCESSO.AsString;
      dbedt_vl_qtde.SetFocus;
    end;

    // RE
    if pgctrl_manut_proc.ActivePage = ts_reg_exp then
    begin

      if qry_exp_re_.State in [dsInsert] then
        qry_exp_re_.Cancel;

      qry_exp_re_.Append;
      qry_exp_re_NR_PROCESSO.AsString  := qry_processo_NR_PROCESSO.AsString;
      pnl_ref_Re.Enabled := True;
      DBEdit2.SetFocus;
    end;

    // Nota Fiscal
    if pgctrl_manut_proc.ActivePage = ts_nf then
    begin
      if nbNotaFiscal.ActivePage = 'I' then
      begin
        if qry_processo_nf_.State in [dsInsert] then
          qry_processo_nf_.Cancel;
        qry_processo_nf_.Append;

{ transferido para o evento da Query OnNewRecord - carlos 11/05/2011
        dbedt_processo_nf_nota.ReadOnly  := False;
        dbedt_dt_nota.ReadOnly           := False;

        qry_processo_nf_NR_PROCESSO.AsString  := qry_processo_NR_PROCESSO.AsString;
        qry_processo_nf_IN_CANCELADO.AsString := '0';
        // Adicionado para iniciar a NF como não complementar - Michel - 17/12/2008 - Ocorrência 06948/08
        qry_processo_nf_IN_COMPLEMENTAR.AsString := '0';

        dbedt_processo_nf_nota.SetFocus;
        dbgrdProcessoNF.Enabled := False;
}

      end
      else if nbNotaFiscal.ActivePage = 'E' then
      begin
        if qry_exp_nf_.State in [dsInsert] then
          qry_exp_nf_.Cancel;

        qry_exp_nf_.Append;

{ transferido para o evento da Query OnNewRecord - carlos 11/05/2011
        qry_exp_nf_NR_PROCESSO.AsString  := qry_processo_NR_PROCESSO.AsString;
        dbedt_nr_nf.SetFocus;
        dbg_nf.Enabled := False;
}
      end;
    end;

    // Despacho Importação
    if pgctrl_manut_proc.ActivePage = ts_despacho_imp then
    begin
      // Exportador
      if pgctrl_despacho_imp.ActivePage = ts_exportador then
      begin
        if qry_exportador_.State in [dsInsert] then
          qry_exportador_.Cancel;

        qry_exportador_.Append;
        dbgrid_exportador.SetFocus;
      end;

      // Fabricante
      if pgctrl_despacho_imp.ActivePage = ts_fabricante then
      begin
        if qry_fabricante_.State in [dsInsert] then
          qry_fabricante_.Cancel;

        qry_fabricante_.Append;
        dbgrid_fabricante.SetFocus;
      end;


      // Fatura
      if pgctrl_despacho_imp.ActivePage = ts_doctos_imp then
      begin
        if qry_Doctos_Inst.State in [dsInsert] then qry_Doctos_Inst.Cancel;

        dbedt_nr_fat_imp.ReadOnly          := False;
        dblcbCD_TIPO_DCTO_INSTR.readOnly   := false;
        qry_Doctos_Inst.Append;
        qry_Doctos_InstNR_PROCESSO.AsString       := qry_processo_NR_PROCESSO.AsString;
        qry_Doctos_InstNR_DIAS.AsInteger          := 0;
        qry_Doctos_InstCD_COND_VENDA_ENT.AsString := '0';
        pnl_fat_imp.Enabled := True;
        dblcbCD_TIPO_DCTO_INSTR.setFocus;
       // dbedt_nr_fat_imp.SetFocus;
      end;

      // Controle/Prazos EADI
      if pgctrl_despacho_imp.ActivePage = ts_contr_imp then
      begin
        if qry_contr_imp_.State in [dsInsert] then qry_contr_imp_.Cancel;

        dbedt_nr_contr_imp.ReadOnly              := False;
        qry_contr_imp_.Append;
        qry_contr_imp_NR_PROCESSO.AsString       := qry_processo_NR_PROCESSO.AsString;
        qry_contr_imp_NR_DIAS.AsInteger          := 0;
        qry_contr_imp_CD_COND_VENDA_ENT.AsString := '0';
        pnl_contr_imp.Enabled := True;
        dbedt_nr_contr_imp.SetFocus;
      end;

      // Retificações
      if pgctrl_despacho_imp.ActivePage = ts_Retificacoes then
      begin
        if qryRetificaDI.State in [dsInsert] then
          qryRetificaDI.Cancel;

        qryRetificaDI.Append;
        qryRetificaDINR_PROCESSO.AsString           := qry_processo_NR_PROCESSO.AsString;
        qryRetificaDINR_SEQUENCIA.AsInteger         := UltCod( qry_ult_retificaDI, qry_ult_retificaDIULTIMO );
        qryRetificaDIIN_INICIATIVA_PROPRIA.AsString := '0';
        qryRetificaDIIN_GERAL.AsString              := '1';
        ChkGeralRetificacao.SetFocus;
      end;
    end;

    // Despacho Exportação
    if pgctrl_manut_proc.ActivePage = ts_despacho_exp then
    begin
      // RE
      if pgctrl_despacho_exp.ActivePage = ts_re then
      begin
        if qry_processo_re_.State in [dsInsert] then qry_processo_re_.Cancel;
//        dbedt_nr_re.ReadOnly        := False;
//        dbedt_nr_anexo_ini.ReadOnly := False;
//        dbedt_nr_anexo_fim.ReadOnly := False;
        qry_processo_re_.Append;
        qry_processo_re_NR_PROCESSO.AsString := qry_processo_NR_PROCESSO.AsString;
//        pnl_re.Enabled := True;
//        dbedt_nr_re.SetFocus;
      end;

      // NF
      if pgctrl_despacho_exp.ActivePage = ts_dde_nf then
      begin
        if qry_dde_nf_.State in [dsInsert] then qry_dde_nf_.Cancel;
//        dbedt_nf_ini.ReadOnly := False;
//        dbedt_nf_fim.ReadOnly := False;
//        dbedt_serie.ReadOnly := False;
        qry_dde_nf_.Append;
        qry_dde_nf_NR_PROCESSO.AsString := qry_processo_NR_PROCESSO.AsString;
//        pnl_nf.Enabled := True;
//        dbedt_nf_ini.SetFocus;
      end;

      // Fatura
      if pgctrl_despacho_exp.ActivePage = ts_fat_exp then
      begin
        if qry_Doctos_Inst.State in [dsInsert] then qry_Doctos_Inst.Cancel;
        dbedt_nr_fat_exp.ReadOnly := False;
        qry_Doctos_Inst.Append;
        qry_Doctos_InstNR_PROCESSO.AsString := qry_processo_NR_PROCESSO.AsString;
        qry_Doctos_InstCD_TIPO_DCTO_INSTR.AsString := '01';        
        pnl_fat_exp.Enabled := True;
        dbedt_nr_fat_exp.SetFocus;
      end;
    end;

    // Licença de Importação - L.I.
    if pgctrl_manut_proc.ActivePage = ts_licenca_importacao then
    begin
      if qry_li_.State in [dsInsert] then
        qry_li_.Cancel;

      dbedt_nr_li.ReadOnly           := False;

      qry_li_.Append;
      qry_li_NR_PROCESSO.AsString    := qry_processo_NR_PROCESSO.AsString;
      qry_li_IN_SUBSTITUIDA.AsString := '0';
      qry_li_IN_CANCELADO.AsString   := '0';
      qry_li_IN_UTILIZADO.AsString   := '0';

      pnl_li.Enabled                 := True;
      pnl_li_orgao_anuente.Enabled   := True;
      btn_incluir_orgao.Enabled      := True;
      gb_comandos_li.Enabled         := True;
      dbedt_nr_li.SetFocus;

      if Confirm('Deseja incluir uma nova LI?' + #13#10 + 'Caso negativo, será incluído uma LPCO.' ) then
      begin
        rdgTipoLicenca.ItemIndex := 0;
      end
      else
      begin
        rdgTipoLicenca.ItemIndex := 1;
      end;

    end;
  end;
  btn_mi(False, True, True, False);
end;

procedure Tfrm_manut_proc.dbn_refBeforeAction(Sender: TObject; Button: TNavigateBtn);
begin
  if pgctrl_manut_proc.ActivePage = ts_ref then datm_manut_proc.qry_ref_cliente_.Cancel;

  if ( pgctrl_manut_proc.ActivePage = ts_ref ) or
     ( pgctrl_manut_proc.ActivePage = ts_cntr ) or
     ( pgctrl_manut_proc.ActivePage = ts_carga_solta ) or
     ( pgctrl_manut_proc.ActivePage = ts_embalagem ) or
     ( pgctrl_manut_proc.ActivePage = ts_nf ) or
     ( pgctrl_manut_proc.ActivePage = ts_licenca_importacao ) or
     ( pgctrl_manut_proc.ActivePage = ts_despacho_imp ) or
     ( pgctrl_manut_proc.ActivePage = ts_despacho_exp ) then
    btn_mi(st_incluir, False, False, st_excluir )
  else
    btn_mi( False, False, False, False );
end;

procedure Tfrm_manut_proc.btn_excluirClick(Sender: TObject);
var
  vNrProcessoDel, vNrLIDel, MensagemContainer: String;
begin
  if pgctrl_manut_proc.ActivePage = ts_ref then
  begin
    if BoxMensagem( 'Esta referência será excluída!' + #13#10 + 'Confirma exclusão?', 1 ) then
    begin
      try
        datm_main.db_broker.StartTransaction;
        ApagaItensDI;
        datm_manut_proc.qry_ref_cliente_.Delete;
        VerRefCliente;
        datm_main.db_broker.Commit;
        datm_manut_proc.qry_ref_cliente_.Close;
        datm_manut_proc.qry_ref_cliente_.Open;
      except
        on E: Exception do
        begin
          datm_manut_proc.qry_ref_cliente_.Cancel;
          if datm_main.db_broker.InTransaction then datm_main.db_broker.Rollback;
          TrataErro(E);
        end;
      end;
    end;
  end;

  if pgctrl_manut_proc.ActivePage = ts_embalagem then
  begin
    if BoxMensagem( 'Esta embalagem será excluída!' + #13#10 + 'Confirma exclusão?', 1 ) then
    try
      datm_main.db_broker.StartTransaction;
      datm_manut_proc.qry_proc_embalagem_.Delete;
      VerEmbalagem;
      datm_main.db_broker.Commit;
    except
      on E: Exception do
      begin
        datm_manut_proc.qry_proc_embalagem_.Cancel;
        if datm_main.db_broker.InTransaction then datm_main.db_broker.Rollback;
        TrataErro(E);
      end;
    end;
  end;

  if ( pgctrlEstufagem.ActivePage = ts_cntr ) and ( pgctrl_manut_proc.ActivePage = ts_estufagem ) then
  begin
    if datm_manut_proc.transp_servico = '07' then
      MensagemContainer := 'Esta carreta e as NF cadastradas para ela, serão excluídas!'
    else
      MensagemContainer := 'Este Contêiner e as NF cadastradas para ele, serão excluídos!';
    if BoxMensagem( MensagemContainer + #13#10 + 'Confirma exclusão?', 1 ) then
    try
      datm_main.db_broker.StartTransaction;
      {with TQuery.Create(application) do
      begin
        Databasename := 'DBBROKER';
        SQL.Clear;
        SQL.Add('DELETE FROM TPROCESSO_CNTR_NF');
        SQL.Add(' WHERE NR_PROCESSO = ''' + datm_manut_proc.qry_proc_cntr_.FieldByName('NR_PROCESSO').AsString + '''');
        SQL.Add('   AND NR_CNTR     = ''' + datm_manut_proc.qry_proc_cntr_.FieldByName('NR_CNTR').AsString + '''');
        ExecSQL;
        Free;
      end;}
      datm_manut_proc.qry_proc_cntr_.Delete;
      if (datm_manut_proc.qry_processo_.FieldByName('TP_ESTUFAGEM').AsString = '1') then VerificaFrete(true);
      VerCntr;
      datm_main.db_broker.Commit;
    except
      on E: Exception do
      begin
        datm_manut_proc.qry_proc_cntr_.Cancel;
        if datm_main.db_broker.InTransaction then datm_main.db_broker.Rollback;
        TrataErro(E);
      end;
    end;
  end;

  if ( pgctrlEstufagem.ActivePage = ts_carga_solta ) and ( pgctrl_manut_proc.ActivePage = ts_estufagem ) then
  begin
    if BoxMensagem( 'Esta Carga Solta será excluída!' + #13#10 + 'Confirma exclusão?', 1 ) then
    try
      datm_main.db_broker.StartTransaction;
      datm_manut_proc.qry_proc_carga_solta_.Delete;
      if (datm_manut_proc.qry_processo_.FieldByName('TP_ESTUFAGEM').AsString = '0') then VerificaFrete(true);
      VerCargaSolta;
      datm_main.db_broker.Commit;
    except
      on E: Exception do
      begin
        datm_manut_proc.qry_proc_carga_solta_.Cancel;
        if datm_main.db_broker.InTransaction then datm_main.db_broker.Rollback;
        TrataErro(E);
      end;
    end;
  end;

  if pgctrl_manut_proc.ActivePage = ts_nf then
  begin
    //integridade referencial - não exclui nota se estiver relacionada com cntr
    if nbNotaFiscal.ActivePage = 'I' then
    begin
      if ConsultaLookUpSQL(' SELECT COUNT(*) AS CONT FROM TPROCESSO_CNTR_NF (NOLOCK) WHERE NR_PROCESSO = "' + datm_manut_proc.qry_processo_NR_PROCESSO.AsString + '" AND NR_NF = "' + datm_manut_proc.qry_processo_nf_NR_NOTA.AsString + '" ', 'CONT') <> '0' then
      begin
        Application.MessageBox('Esta Nota Fiscal está relacionada com Containeres neste processo e não poderá ser excluída! Verifique!', 'Exclusão de Nota Fiscal', MB_OK + MB_ICONERROR);
        Exit;
      end;
    end else if nbNotaFiscal.ActivePage = 'E' then
    begin
      if ConsultaLookUpSQL(' SELECT COUNT(*) AS CONT FROM TPROCESSO_CNTR_NF (NOLOCK) WHERE NR_PROCESSO = "' + datm_manut_proc.qry_processo_NR_PROCESSO.AsString + '" AND NR_NF = "' + datm_manut_proc.qry_exp_nf_NR_NF.AsString + '" ', 'CONT') <> '0' then
      begin
        Application.MessageBox('Esta Nota Fiscal está relacionada com Containeres neste processo e não poderá ser excluída! Verifique!', 'Exclusão de Nota Fiscal', MB_OK + MB_ICONERROR);
        Exit;
      end;
      if StrTointDef(ConsultaLookUpSQL('SELECT COUNT(*) AS CONT FROM TPROCESSO_EXP_ITEM (NOLOCK) ' +
                                       ' WHERE NR_PROCESSO = "' + datm_manut_proc.qry_processo_NR_PROCESSO.AsString + '" '+
                                       '   AND NR_NF = "' + datm_manut_proc.qry_exp_nf_NR_NF.AsString + '" ', 'CONT'), 0) <> 0 then
                                       begin
        Application.MessageBox(PChar('Esta nota está relacionada com um ou mais itens do Processo de Exportação' + #13#10 +
                                     'e nao poderá ser excluída! Verifique os Itens deste Processo!'), 'Exclusão de Nota Fiscal', MB_OK + MB_ICONERROR);
        Exit;
      end;

    end;  

    if BoxMensagem( 'Esta Nota Fiscal será excluída!' + #13#10 + 'Confirma exclusão?', 1 ) then
    try
      datm_main.db_broker.StartTransaction;
      if nbNotaFiscal.ActivePage = 'I' then
      begin
        datm_manut_proc.qry_processo_nf_.Delete;
        VerNF;
      end else if nbNotaFiscal.ActivePage = 'E' then
        datm_manut_proc.qry_exp_nf_.Delete;
      datm_main.db_broker.Commit;
    except
      on E: Exception do
      begin
        datm_manut_proc.qry_processo_nf_.Cancel;
        if datm_main.db_broker.InTransaction then datm_main.db_broker.Rollback;
        TrataErro(E);
      end;
    end;
  end;

  if pgctrl_manut_proc.ActivePage = ts_despacho_imp then
  begin
    if pgctrl_despacho_imp.ActivePage = ts_doctos_imp then
    begin
      if BoxMensagem( 'Este documento será excluído!' + #13#10 + 'Confirma exclusão?', 1 ) then
      try
        datm_main.db_broker.StartTransaction;
        datm_manut_proc.qry_Doctos_Inst.Delete;
        VerDespachoImp;
        datm_main.db_broker.Commit;

        //atualiza a query faturas
        datm_manut_proc.qry_contr_imp_.Close;
        datm_manut_proc.qry_contr_imp_.Open;
      except
        on E: Exception do
        begin
          datm_manut_proc.qry_Doctos_Inst.Cancel;
          if datm_main.db_broker.InTransaction then datm_main.db_broker.Rollback;
          TrataErro(E);
        end;
      end;

    end;

    if pgctrl_despacho_imp.ActivePage = ts_contr_imp then
    begin
      if BoxMensagem( 'Esta Fatura será excluída!' + #13#10 + 'Confirma exclusão?', 1 ) then
      try
        datm_main.db_broker.StartTransaction;
        datm_manut_proc.qry_contr_imp_.Delete;
        VerDespachoImp;
        datm_main.db_broker.Commit;

        //atualiza a query de documentos
        datm_manut_proc.qry_Doctos_Inst.Close;
        datm_manut_proc.qry_Doctos_Inst.Open;
      except
        on E: Exception do
        begin
          datm_manut_proc.qry_contr_imp_.Cancel;
          if datm_main.db_broker.InTransaction then datm_main.db_broker.Rollback;
          TrataErro(E);
        end;
      end;
    end;

    if pgctrl_despacho_imp.ActivePage = ts_Retificacoes then
    begin
      if not datm_manut_proc.qryRetificaDI.IsEmpty then
      begin
        if BoxMensagem( 'Esta Retificação será excluída!' + #13#10 + 'Confirma exclusão?', 1 ) then
        try
          datm_main.db_broker.StartTransaction;
          datm_manut_proc.qryRetificaDI.Delete;
          datm_main.db_broker.Commit;
        except
          on E: Exception do
          begin
            datm_manut_proc.qryRetificaDI.Cancel;
            if datm_main.db_broker.InTransaction then
              datm_main.db_broker.Rollback;
            TrataErro(E);
          end;
        end;
      end
      else
        BoxMensagem( 'Não existem retificações para serem excluídas !', 2 );
    end;

    if pgctrl_despacho_imp.ActivePage = ts_fabricante then
    begin
      if not datm_manut_proc.qry_fabricante_.IsEmpty then
      begin
        if BoxMensagem( 'Este Fabricante será excluído!' + #13#10 + 'Confirma exclusão?', 1 ) then
        try
          datm_main.db_broker.StartTransaction;
          datm_manut_proc.qry_fabricante_.Delete;
          datm_main.db_broker.Commit;

        except
          on E: Exception do
          begin
            datm_manut_proc.qry_fabricante_.Cancel;
            if datm_main.db_broker.InTransaction then
              datm_main.db_broker.Rollback;
            TrataErro(E);
          end;
        end;
      end
      else
        BoxMensagem( 'Não existe Fabricante para ser excluído !', 2 );
    end;
  end;

  if pgctrl_manut_proc.ActivePage = ts_despacho_exp then
  begin
    if pgctrl_despacho_exp.ActivePage = ts_re then
    begin
      if BoxMensagem( 'Este RE será excluído!' + #13#10 + 'Confirma exclusão?', 1 ) then
      try
        datm_main.db_broker.StartTransaction;
        datm_manut_proc.qry_processo_re_.Delete;
        VerDespachoExp;
        datm_main.db_broker.Commit;
      except
        on E: Exception do
        begin
          datm_manut_proc.qry_processo_re_.Cancel;
          if datm_main.db_broker.InTransaction then datm_main.db_broker.Rollback;
          TrataErro(E);
        end;
      end;
    end;

    if pgctrl_despacho_exp.ActivePage = ts_dde_nf then
    begin
      if BoxMensagem( 'Esta Sequência de NF será excluída!' + #13#10 + 'Confirma exclusão?', 1 ) then
      try
        datm_main.db_broker.StartTransaction;
        datm_manut_proc.qry_dde_nf_.Delete;
        VerDespachoExp;
        datm_main.db_broker.Commit;
      except
        on E: Exception do
        begin
          datm_manut_proc.qry_dde_nf_.Cancel;
          if datm_main.db_broker.InTransaction then datm_main.db_broker.Rollback;
          TrataErro(E);
        end;
      end;
    end;

    if pgctrl_despacho_exp.ActivePage = ts_fat_exp then
    begin
      if BoxMensagem( 'Esta Fatura será excluída!' + #13#10 + 'Confirma exclusão?', 1 ) then
      try
        datm_main.db_broker.StartTransaction;
        datm_manut_proc.qry_Doctos_Inst.Delete;
        VerDespachoExp;
        datm_main.db_broker.Commit;
      except
        on E: Exception do
        begin
          datm_manut_proc.qry_Doctos_Inst.Cancel;
          if datm_main.db_broker.InTransaction then datm_main.db_broker.Rollback;
          TrataErro(E);
        end;
      end;
    end;
  end;
  
  // Apaga LI
  if pgctrl_manut_proc.ActivePage = ts_licenca_importacao then
  begin
    if BoxMensagem( 'Esta LI será excluída!' + #13#10 + 'Confirma exclusão?', 1 ) then
    try
      datm_main.db_broker.StartTransaction;
      with datm_manut_proc do
      begin
        vNrProcessoDel := qry_li_NR_PROCESSO.AsString;
        vNrLIDel       := qry_li_NR_LI.AsString;

        with TQuery.Create(Application) do
        begin
          DatabaseName := 'DBBROKER';
          // Apaga os orgãos anuentes da li excluída
          SQL.Clear;
          SQL.Add(' DELETE FROM TPROCESSO_LI_ORGAO_ANUENTE ');
          SQL.Add(' WHERE NR_PROCESSO = ''' + vNrProcessoDel + '''');
          SQL.Add('   AND NR_LI       = ''' + vNrLIDel + '''');
          ExecSQL;

          Free;
        end;

        qry_li_.Delete;
      end;

      VerLI;
      datm_main.db_broker.Commit;
    except
      on E: Exception do
      begin
        datm_manut_proc.qry_li_.Cancel;
        if datm_main.db_broker.InTransaction then datm_main.db_broker.Rollback;
        TrataErro(E);
      end;
    end;
  end;



  //exclusão de RE (exclui apenas os não-registrados pelo sistema)
  if pgctrl_manut_proc.ActivePage = ts_reg_exp then
  begin
    if (ConsultaLookUpSQL('SELECT COUNT(*) AS CONT FROM TRE_CAPA (NOLOCK) WHERE ' +
       ' NR_PROCESSO = "'+ datm_manut_proc.qry_processo_NR_PROCESSO.AsString +'" AND ' +
       ' SUBSTRING(NR_RE_SISCOMEX, 1,2) + SUBSTRING(NR_RE_SISCOMEX, 4,7) + SUBSTRING(NR_RE_SISCOMEX, 12,3) = "' +
       datm_manut_proc.qry_exp_re_NR_RE.AsString + '" ', 'CONT') = '0') then
    begin
      if BoxMensagem( 'Este RE será excluído!' + #13#10 + 'Confirma exclusão?', 1 ) then
      try
        datm_main.db_broker.StartTransaction;
        datm_manut_proc.qry_exp_re_.Delete;
        datm_main.db_broker.Commit;
      except
        on E: Exception do
        begin
          datm_manut_proc.qry_exp_re_.Cancel;
          if datm_main.db_broker.InTransaction then datm_main.db_broker.Rollback;
          TrataErro(E);
        end;
      end;
    end
    else
      Application.MessageBox('Este RE foi registrado pelo MyIndaiá e não pode ser excluído!', 'RE já registrado - MyIndaiá', MB_OK + MB_ICONERROR);
    if datm_manut_proc.qry_exp_re_.IsEmpty then
      pnl_ref_Re.Enabled := False;
  end;



  if ( pgctrl_manut_proc.ActivePage = ts_ref ) or
     ( pgctrl_manut_proc.ActivePage = ts_cntr ) or
     ( pgctrl_manut_proc.ActivePage = ts_carga_solta ) or
     ( pgctrl_manut_proc.ActivePage = ts_embalagem ) or
     ( pgctrl_manut_proc.ActivePage = ts_nf ) or
     ( pgctrl_manut_proc.ActivePage = ts_despacho_imp ) or
     ( pgctrl_manut_proc.ActivePage = ts_despacho_exp ) or
     ( pgctrl_manut_proc.ActivePage = ts_licenca_importacao ) or
     ( pgctrl_manut_proc.ActivePage = ts_reg_exp ) then
    btn_mi(st_incluir, False, False, st_excluir )
  else
    btn_mi(False, False, False, False );
end;

function Tfrm_manut_proc.GravaRef : Boolean;
var
  NrProcessoAnt  : string;
  NrSequenciaAnt : string;
  vRefClienteHabilitacao : Integer;
begin
  GravaRef := True;

  //if (datm_manut_proc.qry_ref_cliente_.State <> dsInsert) or
  //   (datm_manut_proc.qry_ref_cliente_.State <> dsInsert) then
  // O IF acima foi substituído porque estava errada a comparação - Michel - 29/05/2009
  if not (datm_manut_proc.qry_ref_cliente_.State in [dsEdit, dsInsert]) then
    datm_manut_proc.qry_ref_cliente_.Edit;

  if datm_manut_proc.qry_ref_cliente_CD_EMPRESA.AsString <> datm_manut_proc.qry_processo_CD_CLIENTE.AsString then
    datm_manut_proc.qry_ref_cliente_CD_EMPRESA.AsString := datm_manut_proc.qry_processo_CD_CLIENTE.AsString;

  try
    vRefClienteHabilitacao := RefClienteHabilitacao(msk_cd_unid_neg.Text, msk_cd_produto.Text, dbedt_cd_cliente.Text, 1);
    // Verifica se o tamanho esta correto, desde que o cliente necessite essa verificação ( TCLIENTE_HABILITACAO )
    if vRefClienteHabilitacao > 0 then
    begin
      if ( Length(Trim(dbedt_cd_ref_normal.text)) <> vRefClienteHabilitacao ) and ( dblck_tp_referencia.Text = 'PEDIDO' ) then
      begin
        MessageDlg('As referências para esse cliente devem ter ' + IntToStr(vRefClienteHabilitacao) + ' caracteres. Verifique se suas referências foram digitadas corretamente.', mtError, [mbOK], 0);
        GravaRef := False;
        Exit;
      end;
    end;
    CmbItens.Text := Copy('0000',1,4-Length(CmbItens.Text)) + CmbItens.Text;
    if Trim(msk_cd_produto.Text) = '03' then
    begin
      CmbParciais.Text := IfThen(CmbParciais.Text='','1',CmbParciais.Text);
      CmbItens.Text    := IfThen(Trim(CmbItens.Text)='','0000',CmbItens.Text);
    end;
    // Verifica se o item do cliente digitado existe no pedido digitado
    if Trim(msk_cd_produto.Text) = '01' then
    begin
      with TQuery.Create(Application) do
      begin
        DatabaseName := 'DBBROKER';
        SQL.Clear;
        SQL.Add('SELECT COUNT(*) FROM TPO_ITEM (NOLOCK) WHERE NR_PROCESSO = ''' + Trim(dbedt_cd_ref_normal.Text) + ''' AND NR_ITEM_CLIENTE = ''' + Trim(CmbItens.text) + ''' AND CD_EMPRESA = ''' + dbedt_cd_cliente.Text + ''' ');
        Open;
        if Fields[0].AsInteger = 0 then
        begin
          SQL.Clear;
          SQL.Add('SELECT COUNT(*) FROM TESTAGIO_PROCESSO (NOLOCK) WHERE NR_REFERENCIA = ''' + Trim(dbedt_cd_ref_normal.Text) + ''' AND ISNULL(NR_PROCESSO_ADM, '''') <> '''' AND CD_EMPRESA = ''' + dbedt_cd_cliente.Text + ''' ');
          Open;
          if Fields[0].AsInteger > 0 then
          begin
            Application.MessageBox(Pchar('A T E N Ç Ã O ! Não existe o Item de Cliente "' + Trim(CmbItens.Text) + '" para o pedido "' + Trim(dbedt_cd_ref_normal.Text) + '".' + #10#13 +
                                   'Continuando a inclusão desse Pedido/Item inexistente nesse processo, você estará induzindo o sistema a futuros problemas.' + #10#13 +
                                   'Verifique Nr. Item Cliente e tente novamente!'), 'Pedido/Item inexistente no sistema!', MB_OK + MB_ICONERROR);
            GravaRef := False;
            Exit;
          end;
          Close;
        end;
        Close;
        Free;
      end;
    end;

    if VerifRefRepetida then
    begin
      MessageDlg('Essa Referência e Item já existem no mesmo processo.', mtError, [mbOK], 0);
      GravaRef := False;
      pgctrl_manut_proc.ActivePage := ts_ref;
      CmbItens.SetFocus;
      Exit;
    end;

    datm_manut_proc.qry_ref_cliente_NR_ITEM_PO.AsString := CmbItens.Text;
    datm_manut_proc.qry_ref_cliente_NR_PARCIAL.AsString := CmbParciais.Text;
    datm_manut_proc.qry_ref_cliente_IN_FLAG_LI.AsString := ConsultaLookUP('TSERVICO', 'CD_SERVICO', dbedt_cd_servico.text, 'IN_LI');

    if not ConsisteRefRepetida then //
    begin
      GravaRef := False;
      pgctrl_manut_proc.ActivePage := ts_ref;
      dbedt_cd_ref_normal.SetFocus;
      Exit;
    end;

    // IF colocado para não alterar os ítens da DI quando for Insert - Michel - 29/05/2009
    if datm_manut_proc.qry_ref_cliente_.State = dsEdit then
      AtualizaItensDI;
//    AtualizaTEstagio;

    NrProcessoAnt:=datm_manut_proc.qry_ref_cliente_NR_PROCESSO.AsString;
    NrSequenciaAnt:=datm_manut_proc.qry_ref_cliente_NR_SEQUENCIA.AsString;
    if datm_manut_proc.qry_ref_cliente_.State in [ dsInsert, dsEdit ] then
    begin
      datm_manut_proc.qry_ref_cliente_.Post;
      datm_manut_proc.qry_ref_cliente_.Close;
      datm_manut_proc.qry_ref_cliente_.Open;
      datm_manut_proc.qry_ref_cliente_.Locate('NR_PROCESSO;NR_SEQUENCIA', VarArrayOf([NrProcessoAnt,NrSequenciaAnt]),[loCaseInsensitive] );
      VerRefCliente;
    end;
    dbg_normal.Enabled := True;
  except
    on E: Exception do
    begin
      datm_manut_proc.qry_ref_cliente_.Cancel;
      TrataErro(E);
      GravaRef := False;
      dbg_normal.Enabled := True;
    end;
  end;

  if ( pgctrl_manut_proc.ActivePage = ts_ref ) or
     ( pgctrl_manut_proc.ActivePage = ts_cntr ) or
     ( pgctrl_manut_proc.ActivePage = ts_carga_solta ) or
     ( pgctrl_manut_proc.ActivePage = ts_embalagem ) or
     ( pgctrl_manut_proc.ActivePage = ts_nf ) or
     ( pgctrl_manut_proc.ActivePage = ts_licenca_importacao ) or
     ( pgctrl_manut_proc.ActivePage = ts_despacho_imp ) or
     ( pgctrl_manut_proc.ActivePage = ts_despacho_exp ) then
    btn_mi(st_incluir, False, False, st_excluir )
  else
    btn_mi(False, False, False, False );
end;

procedure Tfrm_manut_proc.btn_mi(i:Boolean; s:Boolean; c:Boolean; e:Boolean);
begin
  btn_incluir.Enabled  := i;  mi_incluir.Enabled   := i;
  btn_salvar.Enabled   := s;  mi_salvar.Enabled    := s;
  btn_Cancelar.Enabled := c;  mi_Cancelar.Enabled  := c;
  btn_excluir.Enabled  := e;  mi_excluir.Enabled   := e;
end;

procedure Tfrm_manut_proc.pgctrl_manut_procChanging(Sender: TObject; var AllowChange: Boolean);
begin
  with datm_manut_proc do
  begin
    if ( pgctrl_manut_proc.ActivePage = ts_lista ) and ( Not qry_processo_.Active ) then
    begin
      if Trim( msk_nr_processo.Text ) = '' then
        AllowChange := False
      else
        AllowChange := VerProcesso;
    end
    else
      AllowChange := VerAlt;
  end;
end;

function Tfrm_manut_proc.VerAlt : Boolean;
begin
  VerAlt := True;
  with datm_manut_proc do
  begin
    if qry_processo_.State in [dsEdit] then
    begin
      if BoxMensagem( 'Cadastro de Processos foi alterado.' + #13#10 +'Deseja salvar as alterações?', 1 ) then
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
    if pgctrl_manut_proc.ActivePage = ts_imp_mar then
    begin
      if ( qry_proc_im_.State in [ dsInsert, dsEdit ] ) then
      begin
        if BoxMensagem( 'Tela Importação foi alterada.' + #13#10 +'Deseja salvar as alterações?', 1 ) then
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

    if (pgctrl_manut_proc.ActivePage = ts_exp_mar) or (pgctrl_manut_proc.ActivePage = ts_Draft) then
    begin
      if ( qry_proc_em_.State in [ dsInsert, dsEdit ] ) then
      begin
        if (pgctrl_manut_proc.ActivePage = ts_exp_mar) then
        begin
        if BoxMensagem( 'Tela Exportação foi alterada.' + #13#10 +'Deseja salvar as alterações?', 1 ) then
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
        end
        else
        begin
          if (pgctrl_manut_proc.ActivePage = ts_Draft) then
          begin
          if BoxMensagem( 'Tela Draft foi alterada.' + #13#10 +'Deseja salvar as alterações?', 1 ) then
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
    end;
    
    if pgctrl_manut_proc.ActivePage = ts_ref then
    begin
      if ( qry_ref_cliente_.State in [ dsInsert, dsEdit ] ) then
      begin
        if BoxMensagem( 'Cadastro de referência foi alterado.' + #13#10 +'Deseja salvar as alterações?', 1 ) then
        begin
          if not Consiste then
          begin
            VerAlt := False;
            Exit;
          end;
          if not GravaRef then
          begin
            VerAlt := False;
            Exit;
          end;
        end
        else
          Cancelar;
      end;
    end;

    if ( pgctrl_manut_proc.ActivePage = ts_embalagem ) then
    begin
      if qry_proc_embalagem_.State in [dsEdit, dsInsert] then
      begin
        if BoxMensagem( 'Cadastro de Embalagens foi alterado.' + #13#10 +'Deseja salvar as alterações?', 1 ) then
        begin
          if Not Consiste then
          begin
            VerAlt := False;
            Exit;
          end;
          if Not GravaEmbalagem then
          begin
            VerAlt := False;
            Exit;
          end;
        end
        else
          Cancelar;
      end;
    end;

    if ( pgctrl_manut_proc.ActivePage = ts_cntr ) then
    begin
      if qry_proc_cntr_.State in [dsEdit, dsInsert] then
      begin
        if BoxMensagem( 'Cadastro de Contêineres foi alterado.' + #13#10 +'Deseja salvar as alterações?', 1 ) then
        begin
          if Not Consiste then
          begin
            VerAlt := False;
            Exit;
          end;
          if Not GravaCntr then
          begin
            VerAlt := False;
            Exit;
          end;
        end
        else
          Cancelar;
      end;
    end;

    if ( pgctrl_manut_proc.ActivePage = ts_nf ) then
    begin
      if (qry_processo_nf_.State in [dsEdit, dsInsert]) or (qry_exp_nf_.State in [dsEdit, dsInsert]) then
      begin
        if BoxMensagem( 'Cadastro de Notas Fiscais foi alterado.' + #13#10 +'Deseja salvar as alterações?', 1 ) then
        begin
          if Not Consiste then
          begin
            VerAlt := False;
            Exit;
          end;
          if Not GravaNF then
          begin
            VerAlt := False;
            Exit;
          end;
        end
        else
          Cancelar;
      end;
    end;

    if ( pgctrl_manut_proc.ActivePage = ts_despacho_imp ) then
    begin
      if ( pgctrl_despacho_imp.ActivePage = ts_doctos_imp ) then
      begin
        if qry_exportador_.State in [dsEdit, dsInsert] then
        begin
          if BoxMensagem('Exportador foi alterado.' + #13#10 +'Deseja salvar as alterações?', 1) then
          begin
            if Not Consiste then
            begin
              VerAlt := False;
              Exit;
            end;
            if Not GravaDespachoImp then
            begin
              VerAlt := False;
              Exit;
            end;
          end
          else
            Cancelar;
        end;

        if qry_fabricante_.State in [dsEdit, dsInsert] then
        begin
          if BoxMensagem('Fabricante foi alterado.' + #13#10 +'Deseja salvar as alterações?', 1) then
          begin
            if Not Consiste then
            begin
              VerAlt := False;
              Exit;
            end;
            if Not GravaDespachoImp then
            begin
              VerAlt := False;
              Exit;
            end;
          end
          else
            Cancelar;
        end;

        if qry_Doctos_Inst.State in [dsEdit, dsInsert] then
        begin
          if BoxMensagem( 'Cadastro de Faturas foi alterado.' + #13#10 +'Deseja salvar as alterações?', 1 ) then
          begin
            if Not Consiste then
            begin
              VerAlt := False;
              Exit;
            end;
            if Not GravaDespachoImp then
            begin
              VerAlt := False;
              Exit;
            end;
          end
          else
            Cancelar;
        end;
      end;

      if ( pgctrl_despacho_imp.ActivePage = ts_contr_imp ) then
      begin
        if qry_contr_imp_.State in [dsEdit, dsInsert] then
        begin
          if BoxMensagem( 'Controle/Prazos EADI foi alterado.' + #13#10 +'Deseja salvar as alterações?', 1 ) then
          begin
            if Not Consiste then
            begin
              VerAlt := False;
              Exit;
            end;
            if Not GravaDespachoImp then
            begin
              VerAlt := False;
              Exit;
            end;
          end
          else
            Cancelar;
        end;
      end;

      if ( pgctrl_despacho_imp.ActivePage = ts_Retificacoes ) then
      begin
        if qryRetificaDI.State in [dsEdit, dsInsert] then
        begin
          if BoxMensagem( 'A Retificação foi alterada.' + #13#10 +'Deseja salvar as alterações?', 1 ) then
          begin
            if Not Consiste then
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
    // Verifica se a LI foi modificada e não foi salva.
    if ( pgctrl_manut_proc.ActivePage = ts_licenca_importacao ) then
    begin
      if ( qry_li_.State in [dsEdit, dsInsert] ) or ( qry_li_orgao_anuente_.State in [dsEdit, dsInsert] ) then
      begin
        if BoxMensagem( 'Cadastro de LI foi alterado.' + #13#10 +'Deseja salvar as alterações?', 1 ) then
        begin
          if Not Consiste then
          begin
            VerAlt := False;
            Exit;
          end;
          if Not GravaLI then
          begin
            VerAlt := False;
            Exit;
          end;
          if Not GravaOrgaoAnuenteLI then
          begin
            VerAlt := False;
            Exit;
          end;
        end
        else
          Cancelar;
      end;
    end;

    if ( pgctrl_manut_proc.ActivePage = ts_despacho_exp ) then
    begin
      if ( pgctrl_despacho_exp.ActivePage = ts_re ) then
      begin
        if qry_processo_re_.State in [dsEdit, dsInsert] then
        begin
          if BoxMensagem( 'Cadastro de RE foi alterado.' + #13#10 +'Deseja salvar as alterações?', 1 ) then
          begin
            if Not Consiste then
            begin
              VerAlt := False;
              Exit;
            end;
            if Not GravaDespachoExp then
            begin
              VerAlt := False;
              Exit;
            end;
          end
          else
            Cancelar;
        end;
      end;

      if ( pgctrl_despacho_exp.ActivePage = ts_dde_nf ) then
      begin
        if qry_dde_nf_.State in [dsEdit, dsInsert] then
        begin
          if BoxMensagem( 'Cadastro de Notas Fiscais foi alterado.' + #13#10 +'Deseja salvar as alterações?', 1 ) then
          begin
            if Not Consiste then
            begin
              VerAlt := False;
              Exit;
            end;
            if Not GravaDespachoExp then
            begin
              VerAlt := False;
              Exit;
            end;
          end
          else
            Cancelar;
        end;
      end;

      if ( pgctrl_despacho_exp.ActivePage = ts_fat_exp ) then
      begin
        if qry_Doctos_Inst.State in [dsEdit, dsInsert] then
        begin
          if BoxMensagem( 'Cadastro de Faturas foi alterado.' + #13#10 +'Deseja salvar as alterações?', 1 ) then
          begin
            if Not Consiste then
            begin
              VerAlt := False;
              Exit;
            end;
            if Not GravaDespachoExp then
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
  end;
end;

procedure Tfrm_manut_proc.CodExits;
begin
  lNaoConsiste  := True;
  Consiste;
  lNaoConsiste  := False;
end;

procedure Tfrm_manut_proc.DadosRef;
begin
  with datm_manut_proc do
  begin
    qry_ref_cliente_.Close;
    qry_ref_cliente_.Open;
  end;
end;

procedure Tfrm_manut_proc.VerEmbalagem;
begin
  if Not ( datm_manut_proc.qry_proc_embalagem_.State in [dsInactive] ) then
  begin
    if datm_manut_proc.qry_proc_embalagem_.RecordCount > 0 then
    begin
      dbedt_cd_embalagem.ReadOnly := False;
      dbedt_qt_embalagem.ReadOnly := False;
      dbedt_pb_embalagem.ReadOnly := False;
      btn_co_embalagem.Enabled    := True;
    end
    else
    begin
      dbedt_cd_embalagem.ReadOnly := True;
      dbedt_qt_embalagem.ReadOnly := True;
      dbedt_pb_embalagem.ReadOnly := True;
      btn_co_embalagem.Enabled    := False;
    end;
  end;
end;

procedure Tfrm_manut_proc.VerDespachoExp;
begin
  if pgctrl_despacho_exp.ActivePage = ts_re then
  begin
    if Not ( datm_manut_proc.qry_processo_re_.State in [dsInactive] ) then
    begin
//      dbedt_nr_re.ReadOnly        := Not(datm_manut_proc.qry_processo_re_.RecordCount > 0);
//      dbedt_nr_anexo_ini.ReadOnly := Not(datm_manut_proc.qry_processo_re_.RecordCount > 0);
//      dbedt_nr_anexo_fim.ReadOnly := Not(datm_manut_proc.qry_processo_re_.RecordCount > 0);
    end;
  end;

  if pgctrl_despacho_exp.ActivePage = ts_dde_nf then
  begin
    if Not ( datm_manut_proc.qry_dde_nf_.State in [dsInactive] ) then
    begin
//      dbedt_nf_ini.ReadOnly := Not(datm_manut_proc.qry_dde_nf_.RecordCount > 0);
//      dbedt_nf_fim.ReadOnly := Not(datm_manut_proc.qry_dde_nf_.RecordCount > 0);
//      dbedt_serie.ReadOnly  := Not(datm_manut_proc.qry_dde_nf_.RecordCount > 0);
    end;
  end;
end;

procedure Tfrm_manut_proc.VerDespachoImp;
begin
  with datm_manut_proc do
  begin

    if pgctrl_despacho_imp.ActivePage = ts_doctos_imp then
    begin
      if Not ( qry_Doctos_Inst.State in [dsInactive] ) then
      begin
        qry_existe_di_.Close;
        qry_existe_di_.Open;

        if ( qry_Doctos_Inst.RecordCount > 0 ) and
           ( qry_existe_di_EXISTEDI.AsInteger = 0 ) then
        begin
          dbedt_nr_fat_imp.ReadOnly         := False;
          dblcbCD_TIPO_DCTO_INSTR.readOnly  := false;
        end
        else
        begin
          dbedt_nr_fat_imp.ReadOnly         := True;
          dblcbCD_TIPO_DCTO_INSTR.readOnly  := true;
        end;
      end;
    end;

    if pgctrl_despacho_imp.ActivePage = ts_contr_imp then
    begin
      if Not ( qry_contr_imp_.State in [dsInactive] ) then
      begin
        qry_existe_di_.Close;
        qry_existe_di_.Open;
        if ( qry_contr_imp_.RecordCount > 0 ) and
           ( qry_existe_di_EXISTEDI.AsInteger = 0 ) then
        begin
          dbedt_nr_contr_imp.ReadOnly := False;
        end
        else
        begin
          dbedt_nr_contr_imp.ReadOnly := True;
        end;
      end;
    end;
  end;
end;

procedure Tfrm_manut_proc.VerLI;
begin
  with datm_manut_proc do
  begin
    if Not ( qry_li_.State in [dsInactive] ) then
    begin
      gb_comandos_li.Enabled        := (qry_li_.RecordCount > 0);
      btn_incluir_orgao.Enabled     := (qry_li_.RecordCount > 0);
      pnlLI_EMARCADO.Visible        := (qry_li_IN_LI_PRE_JA_EMBARCADO.AsString='1' );

      if qry_li_IN_LI_PRE_JA_EMBARCADO.AsString='1' then
         with TQUERY.Create(nil) do
         begin
            DatabaseName := 'DBBROKER';
            SQL.Clear;
            SQl.Add('SELECT NR_PROCESSO FROM TPROCESSO_LI (NOLOCK) WHERE NR_LI= "'+qry_li_NR_LI.AsString+'" AND ISNULL(IN_LI_PRE_JA_EMBARCADO,"0")="0"');
            Open;
            edt_li_embarcado.Text:=fields[0].AsString;
            close;
            Free;
         end;
    end;
    if Not ( qry_li_orgao_anuente_.State in [dsInactive] ) then
    begin
//      dblckp_orgao_anuente.ReadOnly := Not(qry_li_orgao_anuente_.RecordCount > 0);    by carlos 18/10/2010  ( não estava deixando incluir um novo registro )
      btn_excluir_orgao.Enabled     := (qry_li_orgao_anuente_.RecordCount > 0);
      pnl_li_orgao_anuente.Enabled  := (qry_li_orgao_anuente_.RecordCount > 0);
    end;
  end;
end;

procedure Tfrm_manut_proc.VerNF;
begin
  if Not ( datm_manut_proc.qry_processo_nf_.State in [dsInactive] ) then
  begin
    dbedt_processo_nf_nota.ReadOnly := Not(datm_manut_proc.qry_processo_nf_.RecordCount > 0);
    dbedt_dt_nota.ReadOnly          := Not(datm_manut_proc.qry_processo_nf_.RecordCount > 0);
  end;
end;

procedure Tfrm_manut_proc.VerCntr;
begin
  if Not ( datm_manut_proc.qry_proc_cntr_.State in [dsInactive] ) then
  begin
    if Not ( datm_manut_proc.qry_proc_cntr_.EOF ) then
    begin
      dbedt_dt_presenca_carga.ReadOnly := False;
      dbedt_dt_ent_arm.ReadOnly        := False;
      dbedt_dt_desova.ReadOnly         := False;
      dbedt_dt_entr_fabr.ReadOnly      := False;
      dbedt_nr_presenca_carga.ReadOnly := False;
      dbedt_nr_cntr.ReadOnly           := False;
      dbedt_nr_free_time.ReadOnly      := False;
      dbedt_dt_dev_cntr.ReadOnly       := False;
      dbchkInDemurrage.ReadOnly        := False;
      dbchkInDesova.ReadOnly           := False;
      dblckp_box_tp_cntr.ReadOnly      := False;
    end
    else
    begin
      dbedt_dt_presenca_carga.ReadOnly := True;
      dbedt_dt_ent_arm.ReadOnly        := True;
      dbedt_dt_desova.ReadOnly         := True;
      dbedt_dt_entr_fabr.ReadOnly      := True;
      dbedt_nr_presenca_carga.ReadOnly := True;
      dbedt_nr_cntr.ReadOnly           := True;
      dbedt_nr_free_time.ReadOnly      := True;
      dbedt_dt_dev_cntr.ReadOnly       := True;
      dbchkInDemurrage.ReadOnly        := True;
      dbchkInDesova.ReadOnly           := True;
      dblckp_box_tp_cntr.ReadOnly      := True;
    end;
  end;
end;

procedure Tfrm_manut_proc.VerCargaSolta;
begin
  if Not ( datm_manut_proc.qry_proc_carga_solta_.State in [dsInactive] ) then
  begin
    if Not ( datm_manut_proc.qry_proc_carga_solta_.EOF ) then
    begin
      dbedt_nr_presenca_carga.ReadOnly := False;
      dbedt_dt_presenca_carga.ReadOnly := False;
      dbedt_vl_qtde.ReadOnly            := False;
      dbedt_nm_especie.ReadOnly         := False;
    end
    else
    begin
      dbedt_nr_presenca_carga.ReadOnly := True;
      dbedt_dt_presenca_carga.ReadOnly := True;
      dbedt_vl_qtde.ReadOnly            := True;
      dbedt_nm_especie.ReadOnly         := True;
    end;
  end;
end;

procedure Tfrm_manut_proc.VerRefCliente;
begin
  if Not ( datm_manut_proc.qry_ref_cliente_.State in [dsInactive] ) then
  begin
    if datm_manut_proc.qry_ref_cliente_.RecordCount > 0 then
       dbedt_cd_ref_normal.ReadOnly := False
    else
       dbedt_cd_ref_normal.ReadOnly := True;
  end;
end;

function Tfrm_manut_proc.GravaEmbalagem : Boolean;
var
  NrProcessoAnt, CdEmbalagemAnt  : String;
begin
  with datm_manut_proc do
  begin
    try
      datm_main.db_broker.StartTransaction;

      NrProcessoAnt  := qry_proc_embalagem_NR_PROCESSO.AsString;
      CdEmbalagemAnt := qry_proc_embalagem_CD_EMBALAGEM.AsString;

      if qry_proc_embalagem_.State in [ dsInsert, dsEdit ] then
      begin
        qry_proc_embalagem_.Post;
        qry_proc_embalagem_.Close;
        qry_proc_embalagem_.Open;
        qry_proc_embalagem_.Locate('NR_PROCESSO;CD_EMBALAGEM',
          VarArrayOf([NrProcessoAnt,CdEmbalagemAnt]),[loCaseInsensitive] );
        VerEmbalagem;
      end;
      if (qry_volumes_.State in [dsInsert,dsEdit]) then
        qry_volumes_.Post;

      datm_main.db_broker.Commit;
      GravaEmbalagem := True;
    except
      on E: Exception do
      begin
        qry_proc_embalagem_.Cancel;
        if datm_main.db_broker.InTransaction then datm_main.db_broker.Rollback;
        TrataErro(E);
        GravaEmbalagem := False;
      end;
    end;
    if ( pgctrl_manut_proc.ActivePage = ts_ref ) or
       ( pgctrl_manut_proc.ActivePage = ts_cntr ) or
       ( pgctrl_manut_proc.ActivePage = ts_carga_solta ) or
       ( pgctrl_manut_proc.ActivePage = ts_embalagem ) or
       ( pgctrl_manut_proc.ActivePage = ts_nf ) or
       ( pgctrl_manut_proc.ActivePage = ts_despacho_imp ) or
       ( pgctrl_manut_proc.ActivePage = ts_despacho_exp ) then
      btn_mi(st_incluir, False, False, st_excluir )
    else
      btn_mi(False, False, False, False );
  end;
end;

function Tfrm_manut_proc.GravaNF : Boolean;
var
  NrProcessoAnt, CdNFAnt  : String;
begin
  if nbNotaFiscal.ActivePage = 'I' then
  begin
    try
      dbedt_dt_nota.Text := DateToStr(StrToDate( dbedt_dt_nota.Text ) );
    except
      BoxMensagem( 'Data Inválida. Digite novamente.', 2 );
      dbedt_dt_nota.SetFocus;
      GravaNF := False;
      Exit;
    end;
    try
      datm_main.db_broker.StartTransaction;
      NrProcessoAnt :=datm_manut_proc.qry_processo_nf_NR_PROCESSO.AsString;
      CdNFAnt       :=datm_manut_proc.qry_processo_nf_NR_NOTA.AsString;
      if datm_manut_proc.qry_processo_nf_.State in [ dsInsert, dsEdit ] then
      begin
        datm_manut_proc.qry_processo_nf_.Post;
        datm_manut_proc.qry_processo_nf_.Close;
        datm_manut_proc.qry_processo_nf_.Open;
        datm_manut_proc.qry_processo_nf_.Locate('NR_PROCESSO;NR_NOTA',
          VarArrayOf([NrProcessoAnt,CdNFAnt]),[loCaseInsensitive] );
        VerNF;
      end;
      datm_main.db_broker.Commit;
      GravaNF := True;
      dbgrdProcessoNF.Enabled := True;
    except
      on E: Exception do
      begin
        datm_manut_proc.qry_processo_nf_.Cancel;
        if datm_main.db_broker.InTransaction then datm_main.db_broker.Rollback;
        TrataErro(E);
        GravaNF := False;
      end;
    end;
  end
  else
  if nbNotaFiscal.ActivePage = 'E' then
  begin
    try
      dbedt_dt_nf.Text := DateToStr(StrToDate( dbedt_dt_nf.Text ) );
    except
      BoxMensagem( 'Data Inválida. Digite novamente.', 2 );
      dbedt_dt_nf.SetFocus;
      GravaNF := False;
      Exit;
    end;
    try
      datm_main.db_broker.StartTransaction;
      NrProcessoAnt := datm_manut_proc.qry_exp_nf_NR_PROCESSO.AsString;
      CdNFAnt       := datm_manut_proc.qry_exp_nf_NR_NF.AsString;
      if datm_manut_proc.qry_exp_nf_.State in [ dsInsert, dsEdit ] then
      begin
        datm_manut_proc.qry_exp_nf_.Post;
        datm_manut_proc.qry_exp_nf_.Close;
        datm_manut_proc.qry_exp_nf_.Open;
        datm_manut_proc.qry_exp_nf_.Locate('NR_PROCESSO;NR_NF',
          VarArrayOf([NrProcessoAnt,CdNFAnt]),[loCaseInsensitive] );
//        VerNF;

      end;
      datm_main.db_broker.Commit;
      GravaNF := True;
      dbg_nf.Enabled := True;
    except
      on E: Exception do
      begin
        datm_manut_proc.qry_exp_nf_.Cancel;
        if datm_main.db_broker.InTransaction then datm_main.db_broker.Rollback;
        TrataErro(E);
        GravaNF := False;
      end;
    end;
  end;

  if ( pgctrl_manut_proc.ActivePage = ts_ref ) or
     ( pgctrl_manut_proc.ActivePage = ts_cntr ) or
     ( pgctrl_manut_proc.ActivePage = ts_carga_solta ) or
     ( pgctrl_manut_proc.ActivePage = ts_embalagem ) or
     ( pgctrl_manut_proc.ActivePage = ts_nf ) or
     ( pgctrl_manut_proc.ActivePage = ts_despacho_imp ) or
     ( pgctrl_manut_proc.ActivePage = ts_despacho_exp ) then
    btn_mi(st_incluir, False, False, st_excluir )
  else
    btn_mi(False, False, False, False );
end;

function Tfrm_manut_proc.GravaDespachoExp : Boolean;
var
  NrProcessoAnt, NrREAnt, NrAnexoIni, NrAnexoFim, NrNFIni, NrNFFim : String;
begin
  with datm_manut_proc do
  begin
    try
      datm_main.db_broker.StartTransaction;

      if ( qry_processo_.State in [dsEdit]) then qry_processo_.Post;

      if pgctrl_despacho_exp.ActivePage = ts_re then
      begin
        NrProcessoAnt := qry_processo_re_NR_PROCESSO.AsString;
        NrREAnt       := qry_processo_re_NR_RE.AsString;
        NrAnexoIni    := qry_processo_re_NR_ANEXO_INI.AsString;
        NrAnexoFim    := qry_processo_re_NR_ANEXO_FIM.AsString;

        if qry_processo_re_.State in [ dsInsert, dsEdit ] then
        begin
          qry_processo_re_.Post;

          qry_atz_des_re_.Close;
          qry_atz_des_re_.ParamByName('NR_PROCESSO').AsString := NrProcessoAnt;
          qry_atz_des_re_.ParamByName('NR_RE').AsString := NrREAnt;
          qry_atz_des_re_.Open;
          if qry_atz_des_re_.RecordCount = 0 then
          begin
            with TQuery.Create(Application) do
            begin
              DatabaseName := 'DBBROKER';
              SQL.Clear;
              SQL.Add('INSERT INTO TPROCESSO_EXP_RE (NR_RE, NR_PROCESSO) ');
              SQL.Add(' VALUES ("'+ NrREAnt + NrAnexoFim +'", "'+NrProcessoAnt+'")');
              ExecSQL;
              Free;
            end;
          end
          else
          begin
            with TQuery.Create(Application) do
            begin
              DatabaseName := 'DBBROKER';
              SQL.Clear;
              SQL.Add('UPDATE TPROCESSO_EXP_RE SET');
              SQL.Add(' NR_RE = "'+ NrREAnt + NrAnexoFim + '"');
              SQL.Add(' WHERE (NR_PROCESSO = "'+ NrProcessoAnt +'") AND');
              SQL.Add('       (SUBSTRING(NR_RE, 1, 9) ="'+ NrREAnt +'")');
              ExecSQL;
              Free;
            end;
          end;

          qry_processo_re_.Close;
          qry_processo_re_.Open;
          qry_processo_re_.Locate('NR_PROCESSO;NR_RE;NR_ANEXO_INI;NR_ANEXO_FIM',
            VarArrayOf([NrProcessoAnt,NrREAnt,NrAnexoIni,NrAnexoFim]),[loCaseInsensitive] );
        end;
      end;

      if pgctrl_despacho_exp.ActivePage = ts_dde_nf then
      begin
        NrProcessoAnt := qry_dde_nf_NR_PROCESSO.AsString;
        NrNFIni       := qry_dde_nf_NR_NF_INI.AsString;
        NrNFFim       := qry_dde_nf_NR_NF_FIM.AsString;

        if qry_dde_nf_.State in [ dsInsert, dsEdit ] then
        begin
          qry_dde_nf_.Post;
          qry_dde_nf_.Close;
          qry_dde_nf_.Open;
          qry_dde_nf_.Locate('NR_PROCESSO;NR_NF_INI;NR_NF_FIM',
            VarArrayOf([NrProcessoAnt,NrNFIni,NrNFFim]),[loCaseInsensitive] );
        end;
      end;

      if pgctrl_despacho_exp.ActivePage = ts_fat_exp then
      begin
        if qry_Doctos_Inst.State in [ dsInsert, dsEdit ] then qry_Doctos_Inst.Post;
      end;

      VerDespachoExp;

      datm_main.db_broker.Commit;
      GravaDespachoExp := True;
    except
      on E: Exception do
      begin
        if qry_processo_re_.State in [dsInsert, dsEdit] then qry_processo_re_.Cancel;
        if qry_dde_nf_.State in [dsInsert, dsEdit] then qry_dde_nf_.Cancel;
        if datm_main.db_broker.InTransaction then datm_main.db_broker.Rollback;
        TrataErro(E);
        GravaDespachoExp := False;
      end;
    end;
    if ( pgctrl_manut_proc.ActivePage = ts_ref ) or
       ( pgctrl_manut_proc.ActivePage = ts_cntr ) or
       ( pgctrl_manut_proc.ActivePage = ts_carga_solta ) or
       ( pgctrl_manut_proc.ActivePage = ts_embalagem ) or
       ( pgctrl_manut_proc.ActivePage = ts_nf ) or
       ( pgctrl_manut_proc.ActivePage = ts_licenca_importacao ) or
       ( pgctrl_manut_proc.ActivePage = ts_despacho_imp ) or
       ( pgctrl_manut_proc.ActivePage = ts_despacho_exp ) then
      btn_mi( st_incluir, False, False, st_excluir )
    else
      btn_mi( False, False, False, False );
  end;
end;

function Tfrm_manut_proc.GravaLI : Boolean;
var
  NrProcessoAnt, NrLIAnt, NrLISubst, NrProcessoLI, strPath_LI_old, strPath_LI_New, DigPath : String;
  vNrOrgaosAnuentes : Integer;
  vInserindo: Boolean;
  vQryAux:TQuery;
begin
  vQryAux := TQuery.Create(application);
  vQryAux.DataBaseName := 'DBBROKER';


  with datm_manut_proc do
  begin
    try
      if Trim(qry_li_NR_LI.AsString) = '' then
      begin
        Result := False;
        MessageDlg('Você deve informar o número da LI.', mtInformation, [mbOk], 0);
        Exit;
      end;

 (*     if qry_li_orgao_anuente_.IsEmpty then
      begin
        Result := False;
        MessageDlg('Você deve informar pelo menos 1 Órgão Anuente para a LI.', mtInformation, [mbOk], 0);
        Exit;
      end;  *)

      vInserindo := (qry_li_.State = dsInsert);

      datm_main.db_broker.StartTransaction;

      if ( qry_processo_.State in [dsEdit] ) then qry_processo_.Post;
      if Not ( dbck_in_subst.Checked )       then qry_li_NR_SUBSTITUIDA.AsVariant := Null;

      NrProcessoAnt := trim(qry_li_NR_PROCESSO.AsString);
      NrLIAnt       := qry_li_NR_LI.AsString;

      if qry_li_.State in [ dsInsert, dsEdit ] then
      begin
        vNrOrgaosAnuentes := qry_li_orgao_anuente_.RecordCount;

        qry_li_.Post;
        qry_li_.Close;
        qry_li_.Open;
        qry_li_.Locate('NR_PROCESSO;NR_LI',
        VarArrayOf([NrProcessoAnt,NrLIAnt]),[loCaseInsensitive] );
        NrLISubst := qry_li_NR_SUBSTITUIDA.AsString;


        with TQuery.Create(Application) do
        begin
          DatabaseName := 'DBBROKER';
          SQL.clear;
          SQL.Add(' update TPROCESSO_LI set IN_CANCELADO="1" ');;
          SQL.Add(' where isNull(IN_CANCELADO,"0")<>"1" ');;
          SQL.Add(' and NR_PROCESSO= :NR_PROCESSO ');;
          SQL.Add(' and NR_LI= :NR_SUBSTITUIDA ');;
          ParamByName('NR_PROCESSO').AsString   :=NrProcessoAnt;
          ParamByName('NR_SUBSTITUIDA').AsString:=NrLISubst;
          if NrLISubst<>'' then
            ExecSQL;


         { by Carlos - Verifica se Existe Li Pré embarcada e efetua a copia dos dados para este processo, bem como os PDF - 08/10/2010  }
          SQL.Clear;
          SQL.Add(' select NR_PROCESSO from TPROCESSO_LI (NOLOCK) ');
          SQL.Add(' WHERE NR_LI= "'+NrLIAnt+'" ');
          SQL.Add(' AND NR_PROCESSO <> "'+NrProcessoAnt+'" ');
          SQL.Add(' AND IN_LI_PRE_JA_EMBARCADO = "0" ');
          open;
          NrProcessoLI:=trim(fields[0].AsString);
          close;
          if NrProcessoLI<>'' then begin
             SQL.Clear;
             SQL.Add(' SELECT TX_DIR_EXTRATO FROM TPROCESSO_LI_STATUS (NOLOCK)  ');
             SQL.Add(' WHERE NR_PROCESSO = "' + NrProcessoLI + '" ' );
             SQL.Add(' AND NR_LI = "' + NrLIAnt+ '" ' );
             open;
             //
             first;
             while not eof do
             begin
               strPath_LI_old:=trim(fields[0].AsString);
               //muda o path dos arqs digitalizados
               strPath_LI_new:=StringReplace(strPath_LI_old, NrProcessoLI,  NrProcessoAnt, [rfIgnoreCase]);
               if fileexists(strPath_LI_new) then
               begin
                  showmessage('Já existe um arquivo de LI digitalizado.'+#13+' por favor abra uma ocorrencia comunicando o fato.');
                  if datm_main.db_broker.InTransaction then
                     datm_main.db_broker.Rollback;

                  exit;
               end;
               next;
             end;
             //
             { marca a flag "IN_LI_PRE_JA_EMBARCADO" do processo encontrado }
             SQL.Clear;
             SQL.Add(' update TPROCESSO_LI set IN_LI_PRE_JA_EMBARCADO="1" ');
             SQL.Add(' WHERE NR_LI= "'+NrLIAnt+'" ');
             SQL.Add(' AND NR_PROCESSO = "'+NrProcessoLI+'" ');
             SQL.Add(' AND IN_LI_PRE_JA_EMBARCADO = "0" ');
             ExecSQL;

             { copiar os ORGÃOS ANUENTES }
             SQL.Clear;
             SQL.Add(' INSERT INTO TPROCESSO_LI_ORGAO_ANUENTE ( ');
             SQL.Add('   NR_PROCESSO, NR_LI, CD_ORGAO_ANUENTE, DT_DEFERIMENTO, DT_VENCTO  ) ');
             SQL.Add(' SELECT ');
             SQL.Add('  :NR_PROCESSO_ANT , OA1.NR_LI, OA1.CD_ORGAO_ANUENTE, OA1.DT_DEFERIMENTO, OA1.DT_VENCTO  ');
             SQL.Add(' FROM TPROCESSO_LI_ORGAO_ANUENTE OA1 (NOLOCK) ' );
             SQL.Add(' WHERE OA1.NR_PROCESSO = "' + NrProcessoLI + '" ' );
             SQL.Add('   AND OA1.NR_LI       = "' + NrLIAnt      + '" ' );
             SQL.Add('   AND NOT EXISTS( SELECT OA2.NR_LI FROM TPROCESSO_LI_ORGAO_ANUENTE OA2 (NOLOCK) ');
             SQL.Add('                                   WHERE OA2.NR_PROCESSO = :NR_PROCESSO_ANT AND OA2.NR_LI= OA1.NR_LI AND OA2.CD_ORGAO_ANUENTE= OA1.CD_ORGAO_ANUENTE )');
             ParamByName('NR_PROCESSO_ANT').AsString:=NrProcessoAnt;
             ExecSQL;

             { copiar os STATUS }
             SQL.Clear;
             SQL.Add(' INSERT INTO TPROCESSO_LI_STATUS ( ');
             SQL.Add('   NR_PROCESSO, NR_LI, DT_STATUS, TX_STATUS, CD_ORGAO_ANUENTE, DT_CONSULTA, TX_DIR_EXTRATO  ) ');
             SQL.Add(' SELECT ');
             SQL.Add(' :NR_PROCESSO_ANT , S1.NR_LI, S1.DT_STATUS, S1.TX_STATUS, S1.CD_ORGAO_ANUENTE, S1.DT_CONSULTA, REPLACE( S1.TX_DIR_EXTRATO, "'+NrProcessoLI+'" , "'+NrProcessoAnt+'" )' );
             SQL.Add(' FROM TPROCESSO_LI_STATUS S1 (NOLOCK) ' );
             SQL.Add(' WHERE S1.NR_PROCESSO = "' + NrProcessoLI + '" ' );
             SQL.Add('   AND S1.NR_LI       = "' + NrLIAnt      + '" ' );
             SQL.Add('   AND NOT EXISTS( SELECT S2.NR_LI FROM TPROCESSO_LI_STATUS S2 (NOLOCK) ');
             SQL.Add('                                   WHERE S2.NR_PROCESSO = :NR_PROCESSO_ANT AND S2.NR_LI= S1.NR_LI AND S2.CD_ORGAO_ANUENTE= S1.CD_ORGAO_ANUENTE AND S2.TX_STATUS= S1.TX_STATUS )');
             ParamByName('NR_PROCESSO_ANT').AsString:=NrProcessoAnt;
             ExecSQL;



             //copia os arqs digitalizados para o novo processo
             SQL.Clear;
             SQL.Add(' SELECT TX_DIR_EXTRATO FROM TPROCESSO_LI_STATUS (NOLOCK)  ');
             SQL.Add(' WHERE NR_PROCESSO = "' + NrProcessoLI + '" ' );
             SQL.Add(' AND NR_LI = "' + NrLIAnt+ '" ' );
             open;
             //
             first;
             while not eof do begin
               strPath_LI_old:=trim(fields[0].AsString);
               strPath_LI_new:=StringReplace(strPath_LI_old, NrProcessoLI,  NrProcessoAnt, [rfIgnoreCase]);
               if fileexists(strPath_LI_old) then begin
                  DigPath:=trim(ConsultaLookUpSQL('SELECT PATH_DIGITALIZACAO FROM TPARAMETROS', 'PATH_DIGITALIZACAO'))+ 'TPROCESSO\'+NrProcessoAnt+'\';
                  ForceDirectories(DigPath);

                  if not copyfile(Pchar(strPath_LI_old), PChar(strPath_LI_new),true) then
                     showmessage('Erro ao copiar os Arquivos digitalizados da pasta: '+strPath_LI_old+' para: '+strPath_LI_new )
                  else begin
                     //salvar digitalização (CTRL F1)
                      vQryAux.SQL.Clear;
                      vQryAux.SQL.Add(' INSERT TPROCESSO_DOCTOS (  NR_PROCESSO,    CD_TIPO_DOCTO,    NM_DESCRICAO,    NM_ARQUIVO,    CD_USUARIO_CRIACAO,    ID_TABELA ) ');
                      vQryAux.SQL.Add('                  SELECT  "'+NrProcessoAnt+'" ,  d.CD_TIPO_DOCTO,  d.NM_DESCRICAO,  d.NM_ARQUIVO,  d.CD_USUARIO_CRIACAO,  d.ID_TABELA ');
                      vQryAux.SQL.Add(' FROM TPROCESSO_DOCTOS d (NOLOCK) ' );
                      vQryAux.SQL.Add(' WHERE d.NR_PROCESSO = "' + NrProcessoLI + '"  and d.CD_TIPO_DOCTO="8" ' );
                      vQryAux.SQL.Add('   AND NOT EXISTS( SELECT d2.NR_PROCESSO FROM TPROCESSO_DOCTOS d2 (NOLOCK) ');
                      vQryAux.SQL.Add('                                   WHERE d2.NR_PROCESSO = :NR_PROCESSO_ANT AND d2.CD_TIPO_DOCTO= d.CD_TIPO_DOCTO AND d2.NM_ARQUIVO= d.NM_ARQUIVO AND d2.ID_TABELA= d.ID_TABELA )');
                      vQryAux.ParamByName('NR_PROCESSO_ANT').AsString:=NrProcessoAnt;
                      vQryAux.ExecSQL;
                  end;
               end;
               next;
             end;
             //REFRESH L.I.'s processo
             qry_li_.Close;
             qry_li_.ParamByName('NR_PROCESSO').AsString := NrProcessoAnt;
             qry_li_.Open;
             // Orgãos Anuentes
             qry_orgao_anuente_.Close;
             qry_orgao_anuente_.Open;
             qry_li_orgao_anuente_.Close;
             qry_li_orgao_anuente_.ParamByName('NR_PROCESSO').AsString := NrProcessoAnt;
             qry_li_orgao_anuente_.ParamByName('NR_LI').AsString       := NrLIAnt;
             qry_li_orgao_anuente_.Open;

             qry_li_.Locate('NR_PROCESSO;NR_LI',  VarArrayOf([NrProcessoAnt,NrLIAnt]),[loCaseInsensitive] );
          end;
        end;




        (*with TQuery.Create(Application) do
        begin
          DatabaseName := 'DBBROKER';

          if ( dbck_in_subst.Checked ) then
          begin
            // Apaga os orgãos anuentes gravados anteriormente na LI substitutiva.
            SQL.Clear;
            SQL.Add(' DELETE FROM TPROCESSO_LI_ORGAO_ANUENTE ');
            SQL.Add(' WHERE NR_PROCESSO = ''' + NrProcessoAnt + ''' ');
            SQL.Add('   AND NR_LI       = ''' + NrLIAnt       + ''' ');
            ExecSQL;
            // Copia os orgãos anuentes da LI substituida para a substitutiva
            SQL.Clear;
            SQL.Add(' INSERT INTO TPROCESSO_LI_ORGAO_ANUENTE ( ');
            SQL.Add('   NR_PROCESSO, NR_LI, CD_ORGAO_ANUENTE ) ');
            SQL.Add(' SELECT ');
            SQL.Add('   NR_PROCESSO, ''' + NrLIAnt + ''', CD_ORGAO_ANUENTE ');
            SQL.Add(' FROM TPROCESSO_LI_ORGAO_ANUENTE (NOLOCK) ');
            SQL.Add(' WHERE NR_PROCESSO = ''' + NrProcessoAnt + ''' ');
            SQL.Add('   AND NR_LI       = ''' + NrLISubst     + ''' ');
            ExecSQL;
            Free;
          end;
          // Verifica se para a LI existem orgãos anuentes, se tiver verifica se o
          // nr. da LI foi alterado e atualiza os orgãos anuentes.
          if ( vNrOrgaosAnuentes > 0 ) and ( NrLIAnt <> vNrLIAtual ) then
          begin
            // Atualiza os orgãos anuentes com a nova LI
            SQL.Clear;
            SQL.Add(' UPDATE TPROCESSO_LI_ORGAO_ANUENTE ');
            SQL.Add(' SET NR_LI = ''' + NrLIAnt + ''' ');
            SQL.Add(' WHERE NR_PROCESSO = ''' + NrProcessoAnt + ''' ');
            SQL.Add('   AND NR_LI       = ''' + vNrLIAtual    + ''' ');
            ExecSQL;
            Free;
          end;

          qry_li_orgao_anuente_.Close;
          qry_li_orgao_anuente_.Open;
          qry_li_orgao_anuente_.Locate('NR_PROCESSO;NR_LI',
          VarArrayOf([NrProcessoAnt,NrLIAnt]),[loCaseInsensitive] );
        end;   *)

        If vNrOrgaosAnuentes > 0 then
          AtualizaDeferimentoLI( NrProcessoAnt, NrLIAnt );
      end;

      VerLI;

      if vInserindo and (qry_li_orgao_anuente_.State in [dsEdit, dsInsert]) then
      begin
        if not GravaOrgaoAnuenteLI then
          Exit;
      end;

      datm_main.db_broker.Commit;
      GravaLI := True;
    except
      on E: Exception do
      begin
        if qry_li_.State in [dsInsert, dsEdit] then qry_li_.Cancel;
        if datm_main.db_broker.InTransaction then datm_main.db_broker.Rollback;
        TrataErro(E);
        GravaLI := False;
      end;
    end;

    if ( pgctrl_manut_proc.ActivePage = ts_licenca_importacao ) then
      btn_mi(st_incluir, False, False, st_excluir )
    else
      btn_mi(False, False, False, False );
  end;

  freeandnil(vQryAux);
end;


function Tfrm_manut_proc.GravaOrgaoAnuenteLI : Boolean;
var
  NrProcessoAnt, NrLIAnt, CdOrgaoAnuenteAnt : String;
begin
  with datm_manut_proc do
  begin
    try
      if (qry_li_.State = dsInsert) and (not GravaLI) then
        Exit;

      datm_main.db_broker.StartTransaction;

      if ( qry_processo_.State in [dsEdit] ) then qry_processo_.Post;
      if ( qry_li_.State in [dsEdit] )       then qry_li_.Post;

      NrProcessoAnt     := qry_li_orgao_anuente_NR_PROCESSO.AsString;
      NrLIAnt           := qry_li_orgao_anuente_NR_LI.AsString;
      CdOrgaoAnuenteAnt := qry_li_orgao_anuente_CD_ORGAO_ANUENTE.AsString;

      if qry_li_orgao_anuente_.State in [ dsInsert, dsEdit ] then
      begin
        qry_li_orgao_anuente_.Post;
        qry_li_orgao_anuente_.Close;
        qry_li_orgao_anuente_.Open;
        qry_li_orgao_anuente_.Locate('NR_PROCESSO;NR_LI;CD_ORGAO_ANUENTE',
          VarArrayOf([NrProcessoAnt,NrLIAnt,CdOrgaoAnuenteAnt]),[loCaseInsensitive] );
      end;

      AtualizaDeferimentoLI( NrProcessoAnt, NrLIAnt );
      VerLI;

      datm_main.db_broker.Commit;
      GravaOrgaoAnuenteLI := True;
    except
      on E: Exception do
      begin
        if qry_li_orgao_anuente_.State in [dsInsert, dsEdit] then
          qry_li_orgao_anuente_.Cancel;
        if datm_main.db_broker.InTransaction then
          datm_main.db_broker.Rollback;
        TrataErro(E);
        GravaOrgaoAnuenteLI := False;
      end;
    end;

    //if ( pgctrl_manut_proc.ActivePage = ts_licenca_importacao ) then
    //  btn_mi(st_incluir, False, False, st_excluir )
    //else
    //  btn_mi(False, False, False, False );
    // Comentado acima por michel. Pois tem que habilitar e desabilitar os botões do orgão anuente - 05/02/2010
    btn_incluir_orgao.Enabled  := st_incluir;
    btn_salvar_orgao.Enabled   := False;
    btn_cancelar_orgao.Enabled := False;
    btn_excluir_orgao.Enabled  := st_excluir;
  end;
end;


function Tfrm_manut_proc.GravaDespachoImp : Boolean;
var
  NrProcessoAnt, NrFatImpAnt, NrContrImpAnt : String;
begin
  with datm_manut_proc do
  begin
    try
      datm_main.db_broker.StartTransaction;
      if ( qry_processo_.State in [dsEdit] ) then
        qry_processo_.Post;

      // Exportador
      if pgctrl_despacho_imp.ActivePage = ts_exportador then
      begin
        if qry_exportador_.State in [dsEdit, dsInsert] then
          qry_exportador_.Post;
      end;

      // Fabricante
      if pgctrl_despacho_imp.ActivePage = ts_fabricante then
      begin
        if qry_fabricante_.State in [dsEdit, dsInsert] then
          qry_fabricante_.Post;
      end;

      if pgctrl_despacho_imp.ActivePage = ts_doctos_imp then
      begin
        NrProcessoAnt := qry_Doctos_InstNR_PROCESSO.AsString;
        NrFatImpAnt   := qry_Doctos_InstNR_DCTO_INSTRUCAO.AsString;

        if qry_Doctos_Inst.State in [ dsInsert, dsEdit ] then
        begin
          qry_Doctos_Inst.Post;
          qry_Doctos_Inst.Close;
          qry_Doctos_Inst.Open;
          qry_Doctos_Inst.Locate('NR_PROCESSO;NR_DCTO_INSTRUCAO',
            VarArrayOf([NrProcessoAnt,NrFatImpAnt]),[loCaseInsensitive] );

          //se atualizar a query de documentos, precisa atualizar a de faturas
          qry_contr_imp_.Close;
          qry_contr_imp_.Open;
        end;
      end;

      if pgctrl_despacho_imp.ActivePage = ts_contr_imp then
      begin
        NrProcessoAnt := qry_contr_imp_NR_PROCESSO.AsString;
        NrContrImpAnt := qry_contr_imp_NR_DCTo_INSTRUCAO.AsString;

        if qry_contr_imp_.State in [ dsInsert, dsEdit ] then
        begin
          qry_contr_imp_.Post;
          qry_contr_imp_.Close;
          qry_contr_imp_.Open;
          qry_contr_imp_.Locate('NR_PROCESSO;CD_TIPO_DCTO_INSTR;NR_DCTO_INSTRUCAO',
            VarArrayOf([NrProcessoAnt,'01',NrContrImpAnt]),[loCaseInsensitive]);

          //se atualizar a query de faturas, precisa atualizar a query de documentos
          qry_Doctos_Inst.Close;
          qry_Doctos_Inst.Open;
        end;
      end;

      if pgctrl_despacho_imp.ActivePage = ts_Retificacoes then
      begin
        if qryRetificaDI.State in [ dsInsert, dsEdit ] then
        begin
          qryRetificaDI.Post;
          qryRetificaDI.Close;
          qryRetificaDI.Open;
        end;
      end;

      VerDespachoImp;

      datm_main.db_broker.Commit;
      GravaDespachoImp := True;

    except
      on E: Exception do
      begin
        if qry_Doctos_Inst.State in [dsInsert, dsEdit] then qry_Doctos_Inst.Cancel;
        if qry_contr_imp_.State in [dsInsert, dsEdit] then qry_contr_imp_.Cancel;
        if datm_main.db_broker.InTransaction then datm_main.db_broker.Rollback;
        TrataErro(E);
        GravaDespachoImp := False;
      end;
    end;

    qry_existe_di_.Close;
    qry_existe_di_.Open;
    if ( pgctrl_manut_proc.ActivePage = ts_ref ) or
       ( pgctrl_manut_proc.ActivePage = ts_cntr ) or
       ( pgctrl_manut_proc.ActivePage = ts_carga_solta ) or
       ( pgctrl_manut_proc.ActivePage = ts_embalagem ) or
       ( pgctrl_manut_proc.ActivePage = ts_nf ) or
       ( pgctrl_manut_proc.ActivePage = ts_licenca_importacao ) or
       ( ( pgctrl_manut_proc.ActivePage = ts_despacho_imp ) and ( qry_existe_di_EXISTEDI.AsInteger = 0 ) ) or
       ( pgctrl_manut_proc.ActivePage = ts_despacho_exp ) then
      btn_mi(st_incluir, False, False, st_excluir )
    else
      btn_mi(False, False, False, False );

   if (pgctrl_manut_proc.ActivePage = ts_despacho_imp) and (pgctrl_despacho_imp.ActivePage = ts_Retificacoes) then
     btn_mi(pgctrl_despacho_imp.ActivePage = ts_Retificacoes, False, False, pgctrl_despacho_imp.ActivePage = ts_Retificacoes);

    qry_existe_di_.Close;
  end;
end;


function Tfrm_manut_proc.GravaCntr : Boolean;
var
  NrProcessoAnt, CdCntrAnt, str_cntr_existentes, nrcontainer : String;
begin
  GravaCntr := True;
  with datm_manut_proc do
  begin
    try
      NrProcessoAnt := qry_proc_cntr_NR_PROCESSO.AsString;
      CdCntrAnt     := qry_proc_cntr_NR_CNTR.AsString;

      if (DBCheckBox4.Checked =True) and  (CdCntrAnt='') then
      begin
        qry_proc_cntr_NR_CNTR.AsString:=' ';
        CdCntrAnt     :=' ';
      end;


      if (qry_processo_.State in [dsEdit]) and (Trim(qry_processo_NR_PROCESSO_VINC.AsString) <> '') then
      begin
        CloseStoredProc( sp_atz_processo_vinc );
        sp_atz_processo_vinc.ParamByName('@nr_processo').AsString      := qry_processo_NR_PROCESSO.AsString;
        sp_atz_processo_vinc.ParamByName('@nr_processo_vinc').AsString := qry_processo_NR_PROCESSO_VINC.AsString;
        ExecStoredProc( sp_atz_processo_vinc );
        CloseStoredProc( sp_atz_processo_vinc );

        qry_processo_.Post;
        qry_processo_.Close;
        qry_processo_.Open;
      end;

      if msk_cd_produto.Text <> '01' then  //Consistência de containers só será feita se não for importação - 05/11/2008 - Rodrigo Capra
      begin

        if tbsImportacao.TabVisible  then
          nrcontainer := dbedt_nr_cntr.text
        else
        if tbsExportacao.TabVisible then
          nrcontainer :=dbedtNrCntrExportacao.text;


        // Verifica se o código do container não está cadastrado
        if (qry_proc_cntr_.State = dsInsert) and (ConsultaLookUPSQL(' SELECT COUNT(*) QTD ' +
                                                                    ' FROM TPROCESSO_CNTR (NOLOCK) ' +
                                                                    ' WHERE NR_PROCESSO = ''' + qry_proc_cntr_NR_PROCESSO.AsString + ''' AND ' +
                                                                    ' NR_CNTR = ''' + nrcontainer+ '''','QTD') <> '0') then
           begin
             Result := False;
             FocaEmContainer;

             MessageDlg('A carreta/container informado já está cadastrado.', mtError, [mbOk], 0);
             Exit;
           end
        else
        if (qry_proc_cntr_.State = dsEdit) then
           begin
             if StrToInt(ConsultaLookUPSQL(' SELECT COUNT(*) QTD FROM TPROCESSO_CNTR (NOLOCK) ' +
                                           ' WHERE NR_PROCESSO = ''' + qry_proc_cntr_NR_PROCESSO.AsString + ''' AND ' +
                                           ' NR_CNTR = ''' +nrcontainer + ''' AND ' +
                                           ' CODIGO <> ''' + datm_manut_proc.qry_proc_cntr_CODIGO.AsString + '''', 'QTD')) >= 1 then
             begin
               Result := False;
               FocaEmContainer;                        

               MessageDlg('A carreta/container informado já está cadastrado.', mtError, [mbOk], 0);
               Exit;
             end;
           end
        else
           begin
             {if (qry_proc_cntr_.State = dsInsert) and (ConsultaLookUPSQL(' SELECT COUNT(*) QTD ' +
                                                                         ' FROM TPROCESSO_CNTR ' +
                                                                         ' WHERE NR_LACRE = ''' + dbedt_nr_lacre.Text + '''', 'QTD') <> '0') then
             begin
               Result := False;
               dbedt_nr_lacre.SetFocus;
               MessageDlg('O código do Lacre informado já está cadastrado.', mtError, [mbOk], 0);
               Exit;
             end
             else if (qry_proc_cntr_.State = dsInsert) and (ConsultaLookUPSQL(' SELECT COUNT(*) QTD ' +
                                                                              ' FROM TPROCESSO_CNTR ' +
                                                                              ' WHERE NR_LACRE_SIF = ''' + dbedt_nr_lacre_sif.Text + '''', 'QTD') <> '0') then

             begin
               Result := False;
               dbedt_nr_lacre_sif.SetFocus;
               MessageDlg('O código do Lacre SIF informado já está cadastrado.', mtError, [mbOk], 0);
               Exit;
             end;}
           end;

           // Verifica se o container já foi utilizado em outro(s) processo(s)  - by Carlos 19/04/2010
           if length(trim(nrcontainer))>1 then
           begin

              str_cntr_existentes:='';
              with TQuery.Create(Application) do
              begin
                DatabaseName := 'DBBROKER';
                SQL.Clear;
                SQl.Add(' select substring(pc.NR_PROCESSO,5,12) NR_PROCESSO_REDUZIDO  ');
                SQl.Add(' from TPROCESSO_CNTR pc (NOLOCK) ');
                SQl.Add(' join tPROCESSO p (NOLOCK) on p.NR_PROCESSO=pc.NR_PROCESSO ');
                SQl.Add(' where pc.NR_CNTR = "'+nrcontainer+'"  and pc.NR_PROCESSO<> "'+qry_proc_cntr_NR_PROCESSO.AsString +'" ');
                SQl.Add(' and p.CD_PRODUTO<>"01" ');
                SQl.Add(' order by convert(varchar,p.DT_ABERTURA,103) desc,pc.NR_PROCESSO ');
                SQl.Add('  ');
                Open;
                first;
                while not eof do
                begin
                  str_cntr_existentes:=str_cntr_existentes+fields[0].AsString+#13;
                  next;
                end;

                close;
                Free;
              end;
              
              if str_cntr_existentes<>'' then
              begin
                 if transp_servico = '07' then
                 begin
                   if MessageDlg('Placa já utilizada no(s) seguinte(s) processo(s):'+#13+#13+str_cntr_existentes+#13+'Deseja incluir assim mesmo ?',
                                     mtConfirmation, [mbYes, mbNo], 0) = mrNo then
                   begin
                      btn_cancelar.Click;
                      exit;
                   end
                 end
                 else
                 begin
                   if MessageDlg('Container já utilizado no(s) seguinte(s) processo(s):'+#13+#13+str_cntr_existentes+#13+'Deseja incluir assim mesmo ?',
                                     mtConfirmation, [mbYes, mbNo], 0) = mrNo then
                   begin
                      btn_cancelar.Click;
                      exit;
                   end;
                 end;
              end;

           end;
      end;

      if qry_proc_cntr_.State in [ dsInsert, dsEdit ] then
      begin
        if SameText(qry_processo_CD_GRUPO.AsString, 'B40') and dbedtCD_LOCAL_ENTREGA_CNTR.ReadOnly and (Trim(qry_proc_cntr_CD_LOCAL_ENTREGA.AsString) = '') then
          qry_proc_cntr_CD_LOCAL_ENTREGA.AsString := '3290640';

        if (qry_proc_cntr_IN_DEMURRAGE.AsString = '1') or (dbchkInDemurrage.Checked) then
        begin
          cdCntrAnt :=  qry_proc_cntr_NR_CNTR.AsString;

          qry_proc_cntr_.Post;
          qry_proc_cntr_.Locate('NR_PROCESSO;NR_CNTR',VarArrayOf([qry_proc_cntr_NR_PROCESSO.AsString,CdCntrAnt]),[loCaseInsensitive] );
          qry_proc_cntr_.Edit;

          CloseStoredProc( sp_calc_dt_demurrage );
          sp_calc_dt_demurrage.ParamByName('@nr_processo').AsString := qry_proc_cntr_NR_PROCESSO.AsString;
          sp_calc_dt_demurrage.ParamByName('@nr_cntr').AsString     := cdCntrAnt;

          ExecStoredProc( sp_calc_dt_demurrage );

          if sp_calc_dt_demurrage.ParamByName('@dt_demurrage').AsDateTime <> 0 then
            qry_proc_cntr_DT_DEMURRAGE.AsDateTime := sp_calc_dt_demurrage.ParamByName('@dt_demurrage').AsDateTime;

          CloseStoredProc( sp_calc_dt_demurrage );
        end
        else qry_proc_cntr_DT_DEMURRAGE.AsVariant := null;

        qry_proc_cntr_.Post;
        qry_proc_cntr_.Close;
        qry_proc_cntr_.Open;
        //qry_proc_cntr_.Locate('NR_POCESSO;NR_CNTR',VarArrayOf([NrProcessoAnt,CdCntrAnt]),[loCaseInsensitive] );
        VerCntr;
      end;
    except
      on E: Exception do
      begin
        qry_proc_cntr_.Cancel;
        TrataErro(E);
        GravaCntr := False;
      end;
    end;                                                                             
    if ( pgctrl_manut_proc.ActivePage = ts_ref ) or
       ( pgctrl_manut_proc.ActivePage = ts_estufagem ) or
       ( pgctrl_manut_proc.ActivePage = ts_embalagem ) or
       ( pgctrl_manut_proc.ActivePage = ts_nf ) or
       ( pgctrl_manut_proc.ActivePage = ts_despacho_imp ) or
       ( pgctrl_manut_proc.ActivePage = ts_despacho_exp ) or
       ( pgctrl_manut_proc.ActivePage = ts_licenca_importacao ) then
      btn_mi( st_incluir, False, False, st_excluir )
    else
      btn_mi( False, False, False, False );
  end;
end;

function Tfrm_manut_proc.GravaCargaSolta : Boolean;
var
  NrProcessoAnt, NrSeqAnt : String;
begin
  try
    datm_main.db_broker.StartTransaction;

    NrProcessoAnt := datm_manut_proc.qry_proc_carga_solta_NR_PROCESSO.AsString;
    NrSeqAnt      := datm_manut_proc.qry_proc_carga_solta_NR_SEQUENCIA.AsString;

    if datm_manut_proc.qry_proc_carga_solta_.State in [ dsInsert, dsEdit ] then
    begin
      datm_manut_proc.qry_proc_carga_solta_.Post;
      datm_manut_proc.qry_proc_carga_solta_.Close;
      datm_manut_proc.qry_proc_carga_solta_.Open;
      datm_manut_proc.qry_proc_carga_solta_.Locate('NR_PROCESSO;NR_SEQUENCIA',
        VarArrayOf([NrProcessoAnt,NrSeqAnt]),[loCaseInsensitive] );
      VerCargaSolta;
    end;

    datm_main.db_broker.Commit;
    GravaCargaSolta := True;
  except
    on E: Exception do
    begin
      datm_manut_proc.qry_proc_carga_solta_.Cancel;
      if datm_main.db_broker.InTransaction then datm_main.db_broker.Rollback;
      TrataErro(E);
      GravaCargaSolta := False;
    end;
  end;
  if ( pgctrl_manut_proc.ActivePage = ts_ref ) or
     ( pgctrl_manut_proc.ActivePage = ts_estufagem ) or
     ( pgctrl_manut_proc.ActivePage = ts_embalagem ) or
     ( pgctrl_manut_proc.ActivePage = ts_nf ) or
     ( pgctrl_manut_proc.ActivePage = ts_despacho_imp ) or
     ( pgctrl_manut_proc.ActivePage = ts_despacho_exp ) or
     ( pgctrl_manut_proc.ActivePage = ts_licenca_importacao ) then
    btn_mi(st_incluir, False, False, st_excluir )
  else
    btn_mi(False, False, False, False );
end;


function Tfrm_manut_proc.GravaRequerimento : Boolean;
begin
end;

procedure Tfrm_manut_proc.btn_co_embalagemClick(Sender: TObject);
begin
  if Not lAbertura then Edita;
  if Sender is TSpeedButton then
  begin
    if not PoeEmEdicao(datm_manut_proc.qry_proc_embalagem_) then exit;
    If (Sender as TSpeedButton).Enabled Then
      dbedt_nm_embalagem.Text := ConsultaOnLineEx('TTP_EMBALAGEM','Embalagem - Siscomex',['CODIGO','DESCRICAO'],['Código','Descrição'],'CODIGO',frm_main.mi_cad_transp_rod)
  end
  else
    dbedt_nm_embalagem.Text := ConsultaLookUP('TTP_EMBALAGEM','CODIGO',dbedt_cd_embalagem.Text,'DESCRICAO');
end;

procedure Tfrm_manut_proc.msk_cd_produtoExit(Sender: TObject);
begin
  lNaoConsiste := True;
  if Trim(msk_cd_produto.text) <> '' then  msk_cd_produto.Text := Copy('00', 1, 2 - Length(Trim(msk_cd_produto.Text))) +  msk_cd_produto.Text;
  if (not datm_manut_proc.qry_processo_.Active) or (pesq_cd_prod <> Trim(msk_cd_produto.text)) then
  begin
    str_nr_processo := Trim( msk_cd_unid_neg.Text ) + Trim( msk_cd_produto.Text ) + Trim( msk_nr_processo.Text );
    Consiste;
  end;

  lNaoConsiste := False;
end;

function Tfrm_manut_proc.VerUnidNegProduto(origem : string) : Boolean;
var
  nr_processo : String;
begin
  Screen.Cursor := crHourGlass;
  Application.ProcessMessages;
  VerUnidNegProduto := True;

  if datm_manut_proc.qry_usuario_habilitacao_.state in [dsInactive] then
  begin
      datm_manut_proc.qry_usuario_habilitacao_.Close;
      datm_manut_proc.qry_usuario_habilitacao_.ParamByName('CD_USUARIO').AsString := str_cd_usuario;
      datm_manut_proc.qry_usuario_habilitacao_.Open;
  end;

  if ( Trim( msk_cd_unid_neg.Text ) <> '' ) and ( Trim( msk_cd_produto.Text ) <> '' ) then
  begin
    if Not datm_manut_proc.qry_usuario_habilitacao_.Locate('CD_UNID_NEG;CD_PRODUTO',
           VarArrayOf([ Trim( msk_cd_unid_neg.Text ), Trim( msk_cd_produto.Text )]), [loCaseInsensitive]) then
    begin
      BoxMensagem( 'Unidade x Produto não encontrado ou sem habilitação para o usuário!', 2 );
      edt_nm_unid_neg.Text        := '';
      edt_nm_produto.Text         := '';
      ts_imp_mar.TabVisible       := False;
      ts_exp_mar.TabVisible       := False;
      ts_ref.TabVisible           := False;
      ts_obs.TabVisible           := False;
      VerUnidNegProduto           := False;
    end
    else
    begin
      Screen.Cursor := crHourGlass;
      Application.ProcessMessages;
      edt_nm_unid_neg.Text := datm_manut_proc.qry_usuario_habilitacao_.FieldByName('AP_UNID_NEG').AsString;
      edt_nm_produto.Text  := datm_manut_proc.qry_usuario_habilitacao_.FieldByName('AP_PRODUTO').AsString;

      if msk_nr_processo.Text <> '' then
         nr_processo := datm_manut_proc.qry_processo_NR_PROCESSO.AsString;

      if (origem <> 'datamodulemanutencao')  and  (not(datm_manut_proc.qry_processo_.state in [dsinactive])) then
      begin
        datm_manut_proc.qry_processo_.Close;
        datm_manut_proc.qry_processo_.ParamByName('NR_PROCESSO').asString := nr_processo;
        datm_manut_proc.qry_processo_.Open;
      end;
      vTpEstufagem := datm_manut_proc.qry_processo_TP_ESTUFAGEM.AsString;

      TornaVisivelTabSheet;

      Screen.Cursor:=crDefault;
      Application.ProcessMessages;
    end;
  end
  else
    edt_nm_unid_neg.Text:='';

  Screen.Cursor := crDefault;
  Application.ProcessMessages;
end;

procedure Tfrm_manut_proc.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #27 then
  begin
    str_cd_rotina_atalho := '';
    if Not VerAlt then Exit;
    str_nr_processo := '';
    msk_nr_processo.Text := '';
    pesq_nr_proc := '';
    Close;
  end;
end;

procedure Tfrm_manut_proc.dbedt_cd_moeda_frete_imKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if Key = VK_F5 then
  begin
    if Sender = dbedtCdFreteEM then btnCoFreteEMClick(btnCoFreteEM)                                      else
    if Sender = dbedtCdFreteEA then btnCoFreteEAClick(btnCoFreteEA)                                      else
    if Sender = msk_cd_unid_neg               then btn_co_unid_negClick(btn_co_unid_neg)                 else
    if Sender = msk_cd_produto                then btn_co_produtoClick(btn_co_produto)                   else
    if Sender = dbedt_cd_area_ref             then btn_co_area_refClick(btn_co_area_ref)                 else
    if Sender = dbedt_nr_processo_entreposto  then btn_processo_entrepostoClick(btn_processo_entreposto) else
    if Sender = dbedt_nr_processo_vinc        then btn_co_processo_vincClick(btn_co_processo_vinc)       else
    if Sender = dbedt_cd_moeda_frete_im       then btn_co_moeda_frete_imClick(btn_co_moeda_frete_im)     else
    if Sender = dbedt_cd_agente_im            then btn_co_agente_imClick(btn_co_agente_im)               else
    if Sender = dbedt_cd_amz_atr_im           then btn_co_amz_atr_imClick(btn_co_amz_atr_im)             else
    if Sender = dbedt_cd_amz_des_im           then btn_co_amz_des_imClick(btn_co_amz_des_im)             else
    if Sender = dbedt_cd_embarc_im            then btn_co_embarc_imClick(btn_co_embarc_im)               else
    if Sender = dbedt_nr_viagem_im            then btn_co_viagem_imClick(btn_co_viagem_im)               else
    if Sender = dbedt_cd_local_emb_im         then btn_co_local_emb_imClick(btn_co_local_emb_im)         else
    if Sender = dbedt_cd_local_desemb_im      then btn_co_local_desemb_imClick(btn_co_local_desemb_im)   else
    if Sender = dbedt_cd_pais_origem_im       then btn_co_pais_origem_imClick(btn_co_pais_origem_im)     else
    if Sender = dbedt_cd_celula               then btn_co_celulaClick(btn_co_celula)                     else
    if Sender = dbedt_cd_cliente              then btn_co_clienteClick(btn_co_cliente)                   else
    if Sender = dbedt_cd_servico              then btn_co_servicoClick(btn_co_servico)                   else
    if Sender = dbedt_cd_rep                  then btn_co_repClick(btn_co_rep)                           else
    if Sender = dbedt_cd_transp_nac_doc       then btn_co_transp_nac_docClick(btn_co_transp_nac_doc)     else
    if Sender = dbedt_cd_transp_nac           then btn_co_transp_nacClick(btn_co_transp_nac)             else
    if Sender = dbedt_cd_area                 then btn_co_areaClick(btn_co_area)                         else
    if Sender = dbedt_cd_agente               then btn_agenteClick(btn_agente)                           else
    if Sender = dbedt_cd_contato_im           then btn_co_contato_imClick(btn_co_contato_im)             else
 //   if Sender = dbedt_cd_transportador_im     then btn_co_transportador_imClick(btn_co_transportador_im) else
    if Sender = dbedt_cd_transportador_ex     then btn_co_transportador_exClick(btn_co_transportador_ex) else
  //  if Sender = dbedt_cd_transportador_ex_a   then btn_co_transportador_ex_aClick(btn_co_transportador_ex_a) else
  if Sender = dbedt_cd_transportador_im_a     then btn_co_transportador_im_aClick(btn_co_transportador_im_a) else
    if Sender = dbedt_cd_moeda_frete_ia       then btn_co_moeda_frete_iaClick(btn_co_moeda_frete_ia)     else
    if Sender = dbedt_cd_agente_ia            then btn_co_agente_iaClick(btn_co_agente_ia)               else
    if Sender = dbedt_cd_amz_atr_ia           then btn_co_amz_atr_iaClick(btn_co_amz_atr_ia)             else
    if Sender = dbedt_cd_amz_des_ia           then btn_co_amz_des_iaClick(btn_co_amz_des_ia)             else
    if Sender = dbedt_cd_local_emb_ia         then btn_co_local_emb_iaClick(btn_co_local_emb_ia)         else
    if Sender = dbedt_cd_local_desemb_ia      then btn_co_local_desemb_iaClick(btn_co_local_desemb_ia)   else
    if Sender = dbedt_cd_pais_origem_ia       then btn_co_pais_origem_iaClick(btn_co_pais_origem_ia)     else
    if Sender = dbedt_cd_contato_ia           then btn_co_contato_iaClick(btn_co_contato_ia)             else
    if Sender = dbedt_cd_moeda_frete_ir       then btn_co_moeda_frete_irClick(btn_co_moeda_frete_ir)     else
    if Sender = dbedt_cd_agente_ir            then btn_co_agente_irClick(btn_co_agente_ir)               else
    if Sender = dbedt_cd_amz_atr_ir           then btn_co_amz_atr_irClick(btn_co_amz_atr_ir)             else
    if Sender = dbedt_cd_amz_des_ir           then btn_co_amz_des_irClick(btn_co_amz_des_ir)             else
    if Sender = dbedt_cd_local_emb_ir         then btn_co_local_emb_irClick(btn_co_local_emb_ir)         else
    if Sender = dbedt_cd_local_desemb_ir      then btn_co_local_desemb_irClick(btn_co_local_desemb_ir)   else
    if Sender = dbedt_cd_pais_origem_ir       then btn_co_pais_origem_irClick(btn_co_pais_origem_ir)     else
    if Sender = dbedt_cd_contato_ir           then btn_co_contato_irClick(btn_co_contato_ir)             else
    if Sender = dbedt_cd_moeda_frete_if       then btn_co_moeda_frete_ifClick(btn_co_moeda_frete_if)     else
    if Sender = dbedt_cd_agente_if            then btn_co_agente_ifClick(btn_co_agente_if)               else
    if Sender = dbedt_cd_amz_atr_if           then btn_co_amz_atr_ifClick(btn_co_amz_atr_if)             else
    if Sender = dbedt_cd_amz_des_if           then btn_co_amz_des_ifClick(btn_co_amz_des_if)             else
    if Sender = dbedt_cd_local_emb_if         then btn_co_local_emb_ifClick(btn_co_local_emb_if)         else
    if Sender = dbedt_cd_local_desemb_if      then btn_co_local_desemb_ifClick(btn_co_local_desemb_if)   else
    if Sender = dbedt_cd_pais_origem_if       then btn_co_pais_origem_ifClick(btn_co_pais_origem_if)     else
    if Sender = dbedt_cd_contato_if           then btn_co_contato_ifClick(btn_co_contato_if)             else
    if Sender = dbedt_cd_moeda_mle_em         then btn_co_moeda_mle_emClick(btn_co_moeda_mle_em)         else
    if Sender = dbedt_cd_moeda_frete_em       then btn_co_moeda_frete_emClick(btn_co_moeda_frete_em)     else
    if Sender = dbedt_cd_agente_em            then btn_co_agente_emClick(btn_co_agente_em)               else
    if Sender = dbedt_cd_amz_atr_em           then btn_co_amz_atr_emClick(btn_co_amz_atr_em)             else
    if Sender = dbedt_cd_amz_est_em           then btn_co_amz_est_emClick(btn_co_amz_est_em)             else
    if Sender = dbedt_cd_embarc_em            then btn_co_embarc_emClick(btn_co_embarc_em)               else
    if Sender = dbedt_nr_viagem_em            then btn_co_viagem_emClick(btn_co_viagem_em)               else
    if Sender = dbedt_cd_local_emb_em         then btn_co_local_emb_emClick(btn_co_local_emb_em)         else
    if Sender = dbedt_cd_local_transb_em      then btn_co_local_transb_emClick(btn_co_local_transb_em)   else
    if Sender = dbedt_cd_local_desemb_em      then btn_co_local_desemb_emClick(btn_co_local_desemb_em)   else
    if Sender = dbedt_cd_pais_dest_em         then btn_co_pais_dest_emClick(btn_co_pais_dest_em)         else
    if Sender = dbedt_cd_pais_origem_em       then btn_co_pais_origem_emClick(btn_co_pais_origem_em)     else
    if Sender = dbedt_cd_banco_em             then btn_co_banco_emClick(btn_co_banco_em)                 else
    if Sender = dbedt_cd_agente_seg_em        then btn_co_agente_seg_emClick(btn_co_agente_seg_em)       else
    if Sender = dbedt_cd_contato_em           then btn_co_contato_emClick(btn_co_contato_em)             else
    if Sender = dbedt_cd_importador_em        then btn_co_importador_emClick(btn_co_importador_em)       else
    if Sender = dbedt_cd_moeda_mle_ea         then btn_co_moeda_mle_eaClick(btn_co_moeda_mle_ea)         else
    if Sender = dbedt_cd_moeda_frete_ea       then btn_co_moeda_frete_iaClick(btn_co_moeda_frete_ia)     else
    if Sender = dbedt_cd_agente_ea            then btn_co_agente_eaClick(btn_co_agente_ea)               else
    if Sender = dbedt_cd_local_emb_ea         then btn_co_local_emb_eaClick(btn_co_local_emb_ea)         else
    if Sender = dbedt_cd_local_desemb_ea      then btn_co_local_desemb_eaClick(btn_co_local_desemb_ea)   else
    if Sender = dbedt_cd_pais_dest_ea         then btn_co_pais_dest_eaClick(btn_co_pais_dest_ea)         else
    if Sender = dbedt_cd_pais_origem_ea       then btn_co_pais_origem_eaClick(btn_co_pais_origem_ea)     else
    if Sender = dbedt_cd_banco_ea             then btn_co_banco_eaClick(btn_co_banco_ea)                 else
    if Sender = dbedt_cd_agente_seg_ea        then btn_co_agente_seg_eaClick(btn_co_agente_seg_ea)       else
    if Sender = dbedt_cd_contato_ea           then btn_co_contato_eaClick(btn_co_contato_ea)             else
    if Sender = dbedt_cd_moeda_mle_er         then btn_co_moeda_mle_erClick(btn_co_moeda_mle_er)         else
    if Sender = dbedt_cd_moeda_frete_er       then btn_co_moeda_frete_erClick(btn_co_moeda_frete_er)     else
    if Sender = dbedt_cd_agente_er            then btn_co_agente_erClick(btn_co_agente_er)               else
    if Sender = dbedt_cd_local_emb_er         then btn_co_local_emb_erClick(btn_co_local_emb_er)         else
    if Sender = dbedt_cd_local_desemb_er      then btn_co_local_desemb_erClick(btn_co_local_desemb_er)   else
    if Sender = dbedt_cd_pais_dest_er         then btn_co_pais_dest_erClick(btn_co_pais_dest_er)         else
    if Sender = dbedt_cd_pais_origem_er       then btn_co_pais_origem_erClick(btn_co_pais_origem_er)     else
    if Sender = dbedt_cd_banco_er             then btn_co_banco_erClick(btn_co_banco_er)                 else
    if Sender = dbedt_cd_agente_seg_er        then btn_co_agente_seg_erClick(btn_co_agente_seg_er)       else
    if Sender = dbedt_cd_contato_er           then btn_co_contato_erClick(btn_co_contato_er)             else
    if Sender = dbedt_cd_moeda_mle_ef         then btn_co_moeda_mle_efClick(btn_co_moeda_mle_ef)         else
    if Sender = dbedt_cd_moeda_frete_ef       then btn_co_moeda_frete_efClick(btn_co_moeda_frete_ef)     else
    if Sender = dbedt_cd_agente_ef            then btn_co_agente_efClick(btn_co_agente_ef)               else
    if Sender = dbedt_cd_local_emb_ef         then btn_co_local_emb_efClick(btn_co_local_emb_ef)         else
    if Sender = dbedt_cd_local_desemb_ef      then btn_co_local_desemb_efClick(btn_co_local_desemb_ef)   else
    if Sender = dbedt_cd_pais_dest_ef         then btn_co_pais_dest_efClick(btn_co_pais_dest_ef)         else
    if Sender = dbedt_cd_pais_origem_ef       then btn_co_pais_origem_efClick(btn_co_pais_origem_ef)     else
    if Sender = dbedt_cd_banco_ef             then btn_co_banco_efClick(btn_co_banco_ef)                 else
    if Sender = dbedt_cd_agente_seg_ef        then btn_co_agente_seg_efClick(btn_co_agente_seg_ef)       else
    if Sender = dbedt_cd_contato_ef           then btn_co_contato_efClick(btn_co_contato_ef)             else
    if Sender = dbedt_cd_lingua               then btn_co_linguaClick(btn_co_lingua)                     else
    if ( Sender = dbedt_cd_embalagem ) and ( btn_co_embalagem.Enabled ) then btn_co_embalagemClick(btn_co_embalagem) else
    if ( Sender = dbedt_cd_despachante_imp ) and ( btn_co_despachante_imp.Enabled ) then btn_co_despachante_impClick(btn_co_despachante_imp);
    if ( Sender = dbedt_cd_tab_sda_imp )     and ( btn_co_tab_sda_imp.Enabled )     then btn_co_tab_sda_impClick(btn_co_tab_sda_imp);
    if ( Sender = dbedt_cd_despachante_exp ) and ( btn_co_despachante_exp.Enabled ) then btn_co_despachante_expClick(btn_co_despachante_exp);
    if ( Sender = dbedt_cd_tab_sda_exp )     and ( btn_co_tab_sda_exp.Enabled )     then btn_co_tab_sda_expClick(btn_co_tab_sda_exp);
    if Sender = msk_nr_processo              then btn_co_processoClick(nil);
    if Sender = dbedt_icoterm                then btn_icotermClick(btn_icoterm);
    if Sender = dbedt_cd_fronteiraImp        then btn_FronteiraImpClick(btn_FronteiraImp);
    if Sender = dbedt_cd_fronteiraExp        then btn_FronteiraExpClick(btn_FronteiraExp);
    if Sender = dbedt_cd_PrimeiroPortoAtrac  then BtnPrimeiroPortoAtracClick(BtnPrimeiroPortoAtrac);
    if Sender = dbedt_cd_incoterm_m          then btn_co_incoterm_mClick(btn_co_incoterm_a);
    if Sender = dbedt_cd_incoterm_a          then btn_co_incoterm_aClick(btn_co_incoterm_a);
    if Sender = dbedt_cd_incoterm_r          then btn_co_incoterm_rClick(btn_co_incoterm_r);
    if Sender = dbedt_cd_incoterm_f          then btn_co_incoterm_fClick(btn_co_incoterm_f);
    if Sender = dbedtCD_LOCAL_ENTREGA        then btn_co_local_entrega_emClick(btn_co_Local_Entrega);
    if Sender = dbedt_cd_consignatario       then btn_co_consignatarioClick(btn_co_consignatario);
    if Sender = dbeCdNotificado1             then btnCoNotificado1Click(btnCoNotificado1);
    if Sender = dbeCdNotificado2             then btnCoNotificado2Click(btnCoNotificado2);
    if Sender = dbedt_cd_local_coleta_im     then btn_co_local_coleta_imClick(btn_co_local_coleta_im);
    if Sender = dbedt_cd_local_coleta_ia     then btn_co_local_coleta_iaClick(btn_co_local_coleta_ia);
    if Sender = dbedt_cd_local_coleta_ir     then btn_co_local_coleta_irClick(btn_co_local_coleta_ir);
    if Sender = dbedt_cd_local_coleta_if     then btn_co_local_coleta_ifClick(btn_co_local_coleta_if);


  end;

  if ( Key = VK_F8 ) and ( Sender = msk_nr_processo ) then
  begin
    try
      if frm_pesq_proc.Tag < 1 then
        PesquisaProc;
    except
      PesquisaProc;
    end;
  end;
  if ( Key = VK_F8 ) and ( Sender = dbedt_nr_processo_entreposto ) then
    btn_processo_entrepostoClick(nil);
end;

procedure Tfrm_manut_proc.Edita;
begin
  with datm_manut_proc do
  begin
    if ( qry_processo_.State    in [ dsEdit ] )           or
       ( qry_proc_cntr_.State   in [ dsEdit ] )           or
       ( qry_proc_im_.State     in [ dsEdit ] )           or
       ( qry_proc_em_.State     in [ dsEdit ] )           or
       ( qry_di_.State          in [ dsEdit ] )           or
       ( qry_re_.State          in [ dsEdit, dsInsert ] ) or
       ( qry_ref_cliente_.State in [ dsEdit ] )           or
       ( qry_proc_vinc_.State   in [ dsEdit ] )           or
       ( qryRetificaDI.State   in [ dsEdit, dsInsert ] ) then
      btn_mi( False, True, True, False );
  end;
end;

procedure Tfrm_manut_proc.dbedt_cd_clienteChange(Sender: TObject);
begin
  if not lAbertura then Edita;

//  if dbedt_dt_pres_carga_im.Text = '  /  /    ' then
//    if datm_manut_proc.qry_proc_im_.State = dsEdit then
//      datm_manut_proc.qry_proc_im_DT_PRESENCA_CARGA.AsVariant := Null;

  If Sender is TDbEdit Then
    If TDbEdit(Sender).Name = dbedt_cd_cliente.Name Then
      btn_co_cliente.OnClick(Sender);
end;

procedure Tfrm_manut_proc.Abertura;
begin
  vstr_cd_modulo := '01';
  str_cd_rotina := '0102';
  with datm_manut_proc do
  begin
    if ( pesq_cd_unid_neg <> '' ) and ( pesq_cd_prod <> '' ) and ( pesq_nr_proc <> '' ) then
      str_nr_processo := pesq_nr_proc;
    if Trim( str_nr_processo ) = '' then
    begin
      // Abre queries
      qry_traz_default_.Close;
      qry_traz_default_.ParamByName('CD_USUARIO').AsString := str_cd_usuario;
      qry_traz_default_.Open;
      // Abre serviço parametrizado
      qry_servico_prm_.Close;
      qry_servico_prm_.Open;
      // Traz as habilitacoes para o usuario
      qry_usuario_habilitacao_.Close;
      qry_usuario_habilitacao_.ParamByName('CD_USUARIO').AsString := str_cd_usuario;
      qry_usuario_habilitacao_.Open;
      if lAbertura then
      begin
        msk_nr_processo.Text := '';
        var_nr_proc          := '';
      end;
    end
    else
    begin

      if ((Trim(msk_cd_unid_neg.Text) <> '') and ( Trim( msk_cd_produto.Text )  <> '' ) and (Trim(msk_nr_processo.Text) <> '')) and
         (( Trim(msk_cd_unid_neg.Text) <> pesq_cd_unid_neg) or
          ( Trim(msk_cd_produto.Text)  <> pesq_cd_prod)     or
          ( var_nr_proc                <> str_nr_processo)) then
      begin
        msk_cd_unid_neg.Text := Copy( str_nr_processo, 1, 2 );
        msk_cd_produto.Text  := Copy( str_nr_processo, 3, 2 );
        msk_nr_processo.Text := Copy( str_nr_processo, 5, 14 );
        VerProcesso;
      end
      else
      begin
        var_nr_proc          := '';
        msk_nr_processo.Text := '';
      end;
    end;
  end;
  msk_nr_processoExit(msk_nr_processo);
  vstr_cd_modulo := '01';
  str_cd_rotina := '0102';
  AtribuiDireitos(st_modificar, st_incluir, st_excluir);
  datm_manut_proc.ds_processo.AutoEdit := st_modificar;
  datm_manut_proc.ds_li.AutoEdit       := st_modificar;
end;

procedure Tfrm_manut_proc.msk_cd_produtoEnter(Sender: TObject);
begin
  pesq_cd_prod := Trim(msk_cd_produto.Text);
end;

procedure Tfrm_manut_proc.VerCamposDI;
var Hab : Boolean;
begin
  with datm_manut_proc do
  begin
//    qry_existe_di_.Close;
//    qry_existe_di_.Open;
    qry_existe_da_.Close;
    qry_existe_da_.Open;

    qry_existe_di_Reg.Close;
    qry_existe_di_Reg.Open;
    Hab := ( datm_manut_proc.qry_existe_di_RegTotal.AsInteger > 0); //Rodrigo Capra - 11/06/2008 - 03566/08

//    Hab := (( qry_existe_di_EXISTEDI.AsInteger > 0 ) or ( qry_existe_da_EXISTEDA.AsInteger > 0 ));
    // Qdo processo é DA (IE...) não mostra campo de DI
    if Copy( qry_processo_NR_PROCESSO.AsString, 5, 2 ) = 'IE' then
    begin
      label35.Visible      := False;
      dbedt_nr_di.Visible  := False;
      lbl_nr_da_im.Left    := 8;
      dbedt_nr_da.Left     := 8;
      dbedt_nr_da.ReadOnly := True;
      dbedt_nr_da.Color    := clMenu;
      dbedt_nr_da.TabStop  := Not Hab;
    end
    else
    begin
      dbedt_nr_di.ReadOnly := Hab;
      if hab then dbedt_nr_di.Color := clMenu else dbedt_nr_di.Color := clWindow;
      dbedt_nr_di.TabStop  := Not Hab;
    end;

    if nbDadosBasicos.ActivePage = 'DadosBasicos' then
    begin
      dbmemo_merc.ReadOnly := Hab;
      if hab then dbmemo_merc.Color := clMenu else dbmemo_merc.Color := clWindow;
      dbmemo_merc.TabStop  := Not Hab;
    end;

    if nbImportacao.ActivePage = 'M' then
    begin
      if ( Trim( dbedt_nr_di.Text ) ) = '' then
      begin
        // Campos somente DA
        if qry_existe_da_EXISTEDA.AsInteger = 0 then
        begin
          dbedt_cd_amz_des_ia.ReadOnly := False;
          dbedt_cd_amz_des_ir.ReadOnly := False;
          dbedt_cd_amz_des_if.ReadOnly := False;
        end
        else
        begin
          dbedt_cd_amz_des_ia.ReadOnly := True;
          dbedt_cd_amz_des_ir.ReadOnly := True;
          dbedt_cd_amz_des_if.ReadOnly := True;
        end;
        dbedt_nr_viagem_im.ReadOnly    := False;
        dbedt_cd_amz_des_im.ReadOnly := False;

        if qry_existe_da_EXISTEDA.AsInteger = 0 then
        begin
          dbedt_cd_amz_des_ia.Color    := clWindow;
          dbedt_cd_amz_des_ir.Color    := clWindow;
          dbedt_cd_amz_des_if.Color    := clWindow;
        end
        else
        begin
          dbedt_cd_amz_des_ia.Color    := clMenu;
          dbedt_cd_amz_des_ir.Color    := clMenu;
          dbedt_cd_amz_des_if.Color    := clMenu;
        end;
        dbedt_nr_viagem_im.Color       := clWindow;
        dbedt_cd_amz_des_im.Color      := clWindow;

        if qry_existe_da_EXISTEDA.AsInteger = 0 then
        begin
          dbedt_cd_amz_des_ia.TabStop  := True;
          dbedt_cd_amz_des_ir.TabStop  := True;
          dbedt_cd_amz_des_if.TabStop  := True;
        end
        else
        begin
          dbedt_cd_amz_des_ia.TabStop  := False;
          dbedt_cd_amz_des_ir.TabStop  := False;
          dbedt_cd_amz_des_if.TabStop  := False;
        end;
        dbedt_nr_viagem_im.TabStop   := True;
        dbedt_cd_amz_des_im.TabStop  := True;

        if qry_existe_da_EXISTEDA.AsInteger = 0 then
        begin
          btn_co_amz_des_ia.Enabled    := True;
          btn_co_amz_des_ir.Enabled    := True;
          btn_co_amz_des_if.Enabled    := True;
        end
        else
        begin
          btn_co_amz_des_ia.Enabled    := False;
          btn_co_amz_des_ir.Enabled    := False;
          btn_co_amz_des_if.Enabled    := False;
        end;
        btn_co_viagem_im.Enabled     := True;
        btn_co_amz_des_im.Enabled    := True;
      end
      else
      begin
        dbedt_cd_amz_des_im.ReadOnly     := True;
        dbedt_cd_amz_des_ia.ReadOnly     := True;
        dbedt_cd_amz_des_ir.ReadOnly     := True;
        dbedt_cd_amz_des_if.ReadOnly     := True;
        dbedt_nr_viagem_im.ReadOnly      := True;

        dbedt_cd_amz_des_im.Color     := clMenu;
        dbedt_cd_amz_des_ia.Color     := clMenu;
        dbedt_cd_amz_des_ir.Color     := clMenu;
        dbedt_cd_amz_des_if.Color     := clMenu;
        dbedt_nr_viagem_im.Color      := clMenu;

        dbedt_cd_amz_des_im.TabStop     := False;

        dbedt_cd_amz_des_ia.TabStop  := False;
        dbedt_cd_amz_des_ir.TabStop  := False;
        dbedt_cd_amz_des_if.TabStop  := False;
        dbedt_nr_viagem_im.TabStop   := False;

        btn_co_amz_des_im.Enabled    := False;
        btn_co_amz_des_ia.Enabled    := False;
        btn_co_amz_des_ir.Enabled    := False;
        btn_co_amz_des_if.Enabled    := False;
        btn_co_viagem_im.Enabled     := False;
      end;

      dbedt_cd_moeda_frete_im.ReadOnly     := Hab;
      dbedt_vl_frete_collect_im.ReadOnly   := Hab;
      dbedt_vl_frete_prepaid_im.ReadOnly   := Hab;
      dbedt_vl_mle_mn_im.ReadOnly          := Hab;
      dbedt_cif_dolar_im.ReadOnly          := Hab;
      dbedt_cif_im.ReadOnly                := Hab;
      dbedt_ii_im.ReadOnly                 := Hab;
      dbedt_ipi_im.ReadOnly                := Hab;
      dbedt_icms_im.ReadOnly               := Hab;
      dbedt_cd_local_emb_im.ReadOnly       := Hab;
      dbedt_cd_PrimeiroPortoAtrac.ReadOnly := Hab;
      dbedt_cd_local_desemb_im.ReadOnly    := Hab;
      dbedt_cd_pais_origem_im.ReadOnly     := Hab;
      dbedt_nr_conh_im.ReadOnly            := Hab;
      dbedt_nr_conh_master_im.ReadOnly     := Hab;
      dbedt_nr_presenca_carga.ReadOnly     := Hab;
      dbedt_nr_manifesto_im.ReadOnly       := Hab;
      dbedt_cd_transportador_im.ReadOnly   := Hab;
      dbedt_cd_transportador_ex.ReadOnly   := Hab;
      dbedt_cd_transportador_ex_a.ReadOnly := Hab;
      dbedt_cd_embarc_im.ReadOnly          := Hab;
      dbedt_cd_amz_atr_im.ReadOnly         := Hab;
      dbedt_cd_agente_im.ReadOnly          := Hab;
      dbedt_dt_conh_im.ReadOnly            := Hab;
      dbedt_nr_conh_im.ReadOnly            := Hab;
      dbedt_nr_conh_master_im.ReadOnly     := Hab;
      dblckpbox_tp_frete_im.ReadOnly       := Hab;
      dbedt_icoterm.ReadOnly               := Hab;
      dbedt_QT_MERC_UN_COMERC_im.ReadOnly  := Hab;
      dbedt_VL_PESO_LIQUIDO_im.ReadOnly    := Hab;
      dbedt_VL_FOB_im.ReadOnly             := Hab;
      dbedt_CD_UNID_MEDIDA_im.ReadOnly     := Hab;
      btn_cd_unid_medida_im.Enabled        := not Hab;
      dbedt_CD_MOEDA_MLE_im.ReadOnly       := Hab;
      btn_cd_moeda_mle_im.Enabled          := not Hab;
      if hab then
      begin
        dbedt_cd_moeda_frete_im.Color    := clMenu;
        dbedt_vl_frete_collect_im.Color  := clMenu;
        dbedt_vl_frete_prepaid_im.Color  := clMenu;
        dbedt_vl_mle_mn_im.Color         := clMenu;
        dbedt_cif_dolar_im.Color         := clMenu;
        dbedt_cif_im.Color               := clMenu;
        dbedt_ii_im.Color                := clMenu;
        dbedt_ipi_im.Color               := clMenu;
        dbedt_icms_im.Color              := clMenu;
        dbedt_cd_local_emb_im.Color      := clMenu;
        dbedt_cd_PrimeiroPortoAtrac.Color := clMenu;
        dbedt_cd_local_desemb_im.Color   := clMenu;
        dbedt_cd_pais_origem_im.Color    := clMenu;
        dbedt_nr_conh_im.Color           := clMenu;
        dbedt_nr_conh_master_im.Color    := clMenu;
        dbedt_nr_presenca_carga.Color    := clBtnFace;
        dbedt_nr_manifesto_im.Color      := clMenu;
        dbedt_cd_transportador_im.Color  := clMenu;
        dbedt_cd_transportador_ex.Color  := clMenu;
        dbedt_cd_transportador_ex_a.Color  := clMenu;
        dbedt_cd_embarc_im.Color         := clMenu;
        dbedt_cd_amz_atr_im.Color        := clMenu;
        dbedt_cd_agente_im.Color         := clMenu;
        dbedt_dt_conh_im.Color           := clMenu;
        dbedt_nr_conh_im.Color           := clMenu;
        dbedt_nr_conh_master_im.Color    := clMenu;
        dblckpbox_tp_frete_im.Color      := clMenu;
        dbedt_icoterm.Color              := clMenu;
        dbedt_QT_MERC_UN_COMERC_im.Color := clMenu;
        dbedt_VL_PESO_LIQUIDO_im.Color   := clMenu;
        dbedt_VL_FOB_im.Color            := clMenu;
        dbedt_CD_UNID_MEDIDA_im.Color    := clMenu;
        dbedt_CD_MOEDA_MLE_im.Color      := clMenu;
      end
      else
      begin
        dbedt_cd_moeda_frete_im.Color    := clWindow;
        dbedt_vl_frete_collect_im.Color  := clWindow;
        dbedt_vl_frete_prepaid_im.Color  := clWindow;
        dbedt_vl_mle_mn_im.Color         := clWindow;
        dbedt_cif_dolar_im.Color         := clWindow;
        dbedt_cif_im.Color               := clWindow;
        dbedt_ii_im.Color                := clWindow;
        dbedt_ipi_im.Color               := clWindow;
        dbedt_icms_im.Color              := clWindow;
        dbedt_cd_local_emb_im.Color      := clWindow;
        dbedt_cd_PrimeiroPortoAtrac.Color := clWindow;
        dbedt_cd_local_desemb_im.Color   := clWindow;
        dbedt_cd_pais_origem_im.Color    := clWindow;
        dbedt_nr_conh_im.Color           := clWindow;
        dbedt_nr_conh_master_im.Color    := clWindow;
        dbedt_nr_presenca_carga.Color    := clWindow;
        dbedt_nr_manifesto_im.Color      := clWindow;
        dbedt_cd_transportador_im.Color  := clWindow;
        dbedt_cd_transportador_ex.Color  := clWindow;
        dbedt_cd_transportador_ex_a.Color  := clWindow;
        dbedt_cd_embarc_im.Color         := clWindow;
        dbedt_cd_amz_atr_im.Color        := clWindow;
        dbedt_cd_agente_im.Color         := clWindow;
        dbedt_dt_conh_im.Color           := clWindow;
        dbedt_nr_conh_im.Color           := clWindow;
        dbedt_nr_conh_master_im.Color    := clWindow;
        dblckpbox_tp_frete_im.Color      := clWindow;
        dbedt_icoterm.Color              := clWindow;
        dbedt_QT_MERC_UN_COMERC_im.Color := clWindow;
        dbedt_VL_PESO_LIQUIDO_im.Color   := clWindow;
        dbedt_VL_FOB_im.Color            := clWindow;
        dbedt_CD_UNID_MEDIDA_im.Color    := clWindow;
        dbedt_CD_MOEDA_MLE_im.Color      := clWindow;
      end;

      dbedt_cd_moeda_frete_im.TabStop    := Not Hab;
      dbedt_vl_frete_collect_im.TabStop  := Not Hab;
      dbedt_vl_frete_prepaid_im.TabStop  := Not Hab;
      dbedt_vl_mle_mn_im.TabStop         := Not Hab;
      dbedt_cif_dolar_im.TabStop         := Not Hab;
      dbedt_cif_im.TabStop               := Not Hab;
      dbedt_ii_im.TabStop                := Not Hab;
      dbedt_ipi_im.TabStop               := Not Hab;
      dbedt_icms_im.TabStop              := Not Hab;
      dbedt_cd_local_emb_im.TabStop      := Not Hab;
      dbedt_cd_PrimeiroPortoAtrac.TabStop := Not Hab;
      dbedt_cd_local_desemb_im.TabStop   := Not Hab;
      dbedt_cd_pais_origem_im.TabStop    := Not Hab;
      dbedt_nr_conh_im.TabStop           := Not Hab;
      dbedt_nr_conh_master_im.TabStop    := Not Hab;
      dbedt_nr_presenca_carga.TabStop    := Not Hab;
      dbedt_nr_manifesto_im.TabStop      := Not Hab;
      dbedt_cd_transportador_im.TabStop  := Not Hab;
      dbedt_cd_transportador_ex.TabStop  := Not Hab;
      dbedt_cd_transportador_ex_a.TabStop  := Not Hab;
      dbedt_cd_embarc_im.TabStop         := Not Hab;
      dbedt_cd_amz_atr_im.TabStop        := Not Hab;
      dbedt_cd_agente_im.TabStop         := Not Hab;
      dbedt_dt_conh_im.TabStop           := Not Hab;
      dbedt_nr_conh_im.TabStop           := Not Hab;
      dbedt_nr_conh_master_im.TabStop    := Not Hab;
      dblckpbox_tp_frete_im.TabStop      := Not Hab;
      dbedt_icoterm.TabStop              := Not Hab;
      dbedt_QT_MERC_UN_COMERC_im.TabStop := Not Hab;
      dbedt_VL_PESO_LIQUIDO_im.TabStop   := Not Hab;
      dbedt_VL_FOB_im.TabStop            := Not Hab;
      dbedt_CD_UNID_MEDIDA_im.TabStop    := Not Hab;
      dbedt_CD_MOEDA_MLE_im.TabStop      := Not Hab;

      btn_co_moeda_frete_im.Enabled      := Not Hab;
      btn_co_local_emb_im.Enabled        := Not Hab;
      BtnPrimeiroPortoAtrac.Enabled      := Not Hab;
      btn_co_local_desemb_im.Enabled     := Not Hab;
      btn_co_pais_origem_im.Enabled      := Not Hab;
      btn_co_transportador_im.Enabled    := Not Hab;
      btn_co_transportador_im_a.Enabled    := Not Hab;
      btn_co_transportador_ex.Enabled    := Not Hab;
      btn_co_transportador_ex_a.Enabled  := Not Hab;
      btn_co_embarc_im.Enabled           := Not Hab;
      btn_co_amz_atr_im.Enabled          := Not Hab;
      btn_co_agente_im.Enabled           := Not Hab;
      btn_icoterm.Enabled                := Not Hab;
    end;

    if nbImportacao.ActivePage = 'A' then
    begin
      dbedt_cd_moeda_frete_ia.ReadOnly   := Hab;
      dbedt_vl_frete_collect_ia.ReadOnly := Hab;
      dbedt_vl_frete_prepaid_ia.ReadOnly := Hab;
      dbedt_vl_mle_mn_ia.ReadOnly        := Hab;
      dbedt_cif_dolar_ia.ReadOnly        := Hab;
      dbedt_cif_ia.ReadOnly              := Hab;
      dbedt_ii_ia.ReadOnly               := Hab;
      dbedt_ipi_ia.ReadOnly              := Hab;
      dbedt_icms_ia.ReadOnly             := Hab;
      dbedt_cd_local_emb_ia.ReadOnly     := Hab;
      dbedt_cd_local_desemb_ia.ReadOnly  := Hab;
      dbedt_cd_pais_origem_ia.ReadOnly   := Hab;
      dbedt_nr_conh_ia.ReadOnly          := Hab;
      dbedt_nr_conh_master_ia.ReadOnly   := Hab;
      dbedt_nr_manifesto_ia.ReadOnly     := Hab;
      dbedt_cd_amz_atr_ia.ReadOnly       := Hab;
      dbedt_cd_agente_ia.ReadOnly        := Hab;
      dbedt_dt_conh_ia.ReadOnly          := Hab;
      dbedt_nr_conh_ia.ReadOnly          := Hab;
      dbedt_nr_conh_master_ia.ReadOnly   := Hab;
      dblckpbox_tp_frete_ia.ReadOnly     := Hab;
      dbedt_QT_MERC_UN_COMERC_ia.ReadOnly  := Hab;
      dbedt_VL_PESO_LIQUIDO_ia.ReadOnly    := Hab;
      dbedt_VL_FOB_ia.ReadOnly             := Hab;
      dbedt_CD_UNID_MEDIDA_ia.ReadOnly     := Hab;
      btn_cd_unid_medida_ia.Enabled        := not Hab;
      dbedt_CD_MOEDA_MLE_ia.ReadOnly       := Hab;
      btn_cd_moeda_mle_ia.Enabled          := not Hab;
      if hab then
      begin
        dbedt_cd_moeda_frete_ia.Color    := clMenu;
        dbedt_vl_frete_collect_ia.Color  := clMenu;
        dbedt_vl_frete_prepaid_ia.Color  := clMenu;
        dbedt_vl_mle_mn_ia.Color         := clMenu;
        dbedt_cif_dolar_ia.Color         := clMenu;
        dbedt_cif_ia.Color               := clMenu;
        dbedt_ii_ia.Color                := clMenu;
        dbedt_ipi_ia.Color               := clMenu;
        dbedt_icms_ia.Color              := clMenu;
        dbedt_cd_local_emb_ia.Color      := clMenu;
        dbedt_cd_local_desemb_ia.Color   := clMenu;
        dbedt_cd_pais_origem_ia.Color    := clMenu;
        dbedt_nr_conh_ia.Color           := clMenu;
        dbedt_nr_conh_master_ia.Color    := clMenu;
        dbedt_nr_manifesto_ia.Color      := clMenu;
        dbedt_cd_amz_atr_ia.Color        := clMenu;
        dbedt_cd_agente_ia.Color         := clMenu;
        dbedt_dt_conh_ia.Color           := clMenu;
        dbedt_nr_conh_ia.Color           := clMenu;
        dbedt_nr_conh_master_ia.Color    := clMenu;
        dblckpbox_tp_frete_ia.Color      := clMenu;
        dbedt_QT_MERC_UN_COMERC_ia.Color := clMenu;
        dbedt_VL_PESO_LIQUIDO_ia.Color   := clMenu;
        dbedt_VL_FOB_ia.Color            := clMenu;
        dbedt_CD_UNID_MEDIDA_ia.Color    := clMenu;
        dbedt_CD_MOEDA_MLE_ia.Color      := clMenu;
      end
      else
      begin
        dbedt_cd_moeda_frete_ia.Color    := clWindow;
        dbedt_vl_frete_collect_ia.Color  := clWindow;
        dbedt_vl_frete_prepaid_ia.Color  := clWindow;
        dbedt_vl_mle_mn_ia.Color         := clWindow;
        dbedt_cif_dolar_ia.Color         := clWindow;
        dbedt_cif_ia.Color               := clWindow;
        dbedt_ii_ia.Color                := clWindow;
        dbedt_ipi_ia.Color               := clWindow;
        dbedt_icms_ia.Color              := clWindow;
        dbedt_cd_local_emb_ia.Color      := clWindow;
        dbedt_cd_local_desemb_ia.Color   := clWindow;
        dbedt_cd_pais_origem_ia.Color    := clWindow;
        dbedt_nr_conh_ia.Color           := clWindow;
        dbedt_nr_conh_master_ia.Color    := clWindow;
        dbedt_nr_manifesto_ia.Color      := clWindow;
        dbedt_cd_amz_atr_ia.Color        := clWindow;
        dbedt_cd_agente_ia.Color         := clWindow;
        dbedt_dt_conh_ia.Color           := clWindow;
        dbedt_nr_conh_ia.Color           := clWindow;
        dbedt_nr_conh_master_ia.Color    := clWindow;
        dblckpbox_tp_frete_ia.Color      := clWindow;
        dbedt_QT_MERC_UN_COMERC_ia.Color := clWindow;
        dbedt_VL_PESO_LIQUIDO_ia.Color   := clWindow;
        dbedt_VL_FOB_ia.Color            := clWindow;
        dbedt_CD_UNID_MEDIDA_ia.Color    := clWindow;
        dbedt_CD_MOEDA_MLE_ia.Color      := clWindow;
      end;

      dbedt_cd_moeda_frete_ia.TabStop    := Not Hab;
      dbedt_vl_frete_collect_ia.TabStop  := Not Hab;
      dbedt_vl_frete_prepaid_ia.TabStop  := Not Hab;
      dbedt_vl_mle_mn_ia.TabStop         := Not Hab;
      dbedt_cif_dolar_ia.TabStop         := Not Hab;
      dbedt_cif_ia.TabStop               := Not Hab;
      dbedt_ii_ia.TabStop                := Not Hab;
      dbedt_ipi_ia.TabStop               := Not Hab;
      dbedt_icms_ia.TabStop              := Not Hab;
      dbedt_cd_local_emb_ia.TabStop      := Not Hab;
      dbedt_cd_local_desemb_ia.TabStop   := Not Hab;
      dbedt_cd_pais_origem_ia.TabStop    := Not Hab;
      dbedt_nr_conh_ia.TabStop           := Not Hab;
      dbedt_nr_conh_master_ia.TabStop    := Not Hab;
      dbedt_nr_manifesto_ia.TabStop      := Not Hab;
      dbedt_cd_amz_atr_ia.TabStop        := Not Hab;
      dbedt_cd_agente_ia.TabStop         := Not Hab;
      dbedt_dt_conh_ia.TabStop           := Not Hab;
      dbedt_nr_conh_ia.TabStop           := Not Hab;
      dbedt_nr_conh_master_ia.TabStop    := Not Hab;
      dblckpbox_tp_frete_ia.TabStop      := Not Hab;

      dbedt_cd_amz_des_ia.ReadOnly       := False;    { As três linhas na sequencia foram incluídas para liberar o campo quando for IA}
      dbedt_cd_amz_des_ia.TabStop        := True;     { Pois em algum momento entrou com outro processo, que não IA, e quando entrou como IA não liberou}
      dbedt_cd_amz_des_ia.Color          := clWindow; { Michel em 24/10/2008}

      btn_co_moeda_frete_ia.Enabled      := Not Hab;
      btn_co_local_emb_ia.Enabled        := Not Hab;
      btn_co_local_desemb_ia.Enabled     := Not Hab;
      btn_co_pais_origem_ia.Enabled      := Not Hab;
      btn_co_amz_atr_ia.Enabled          := Not Hab;
      btn_co_agente_ia.Enabled           := Not Hab;
    end;

    if nbImportacao.ActivePage = 'R' then
    begin
      dbedt_cd_moeda_frete_ir.ReadOnly   := Hab;
      dbedt_vl_frete_collect_ir.ReadOnly := Hab;
      dbedt_vl_frete_prepaid_ir.ReadOnly := Hab;
      dbedt_vl_frete_tnac_ir.ReadOnly    := Hab;
      dbedt_vl_mle_mn_ir.ReadOnly        := Hab;
      dbedt_cif_dolar_ir.ReadOnly        := Hab;
      dbedt_cif_ir.ReadOnly              := Hab;
      dbedt_ii_ir.ReadOnly               := Hab;
      dbedt_ipi_ir.ReadOnly              := Hab;
      dbedt_icms_ir.ReadOnly             := Hab;
      dbedt_cd_local_emb_ir.ReadOnly     := Hab;
      dbedt_cd_local_desemb_ir.ReadOnly  := Hab;
      dbedt_cd_pais_origem_ir.ReadOnly   := Hab;
      dbedt_nr_conh_ir.ReadOnly          := Hab;
      dbedt_nr_manifesto_ir.ReadOnly     := Hab;
      dbedt_nr_placa_veiculo_ir.ReadOnly := Hab;
      dbedt_cd_amz_atr_ir.TabStop        := Hab;
      dbedt_cd_agente_ir.TabStop         := Hab;
      dbedt_dt_conh_ir.TabStop           := Hab;
      dbedt_nr_conh_ir.TabStop           := Hab;
      dblckpbox_tp_frete_ir.ReadOnly     := Hab;
      dbedt_cd_fronteiraImp.ReadOnly     := Hab;
      dbedt_cd_amz_des_ir.ReadOnly       := Hab;
      dbedt_QT_MERC_UN_COMERC_ir.ReadOnly  := Hab;
      dbedt_VL_PESO_LIQUIDO_ir.ReadOnly    := Hab;
      dbedt_VL_FOB_ir.ReadOnly             := Hab;
      dbedt_CD_UNID_MEDIDA_ir.ReadOnly     := Hab;
      btn_cd_unid_medida_ir.Enabled        := not Hab;
      dbedt_CD_MOEDA_MLE_ir.ReadOnly       := Hab;
      btn_cd_moeda_mle_ir.Enabled          := not Hab;
      if hab then
      begin
        dbedt_cd_moeda_frete_ir.Color    := clMenu;
        dbedt_vl_frete_collect_ir.Color  := clMenu;
        dbedt_vl_frete_prepaid_ir.Color  := clMenu;
        dbedt_vl_frete_tnac_ir.Color     := clMenu;
        dbedt_vl_mle_mn_ir.Color         := clMenu;
        dbedt_cif_dolar_ir.Color         := clMenu;
        dbedt_cif_ir.Color               := clMenu;
        dbedt_ii_ir.Color                := clMenu;
        dbedt_ipi_ir.Color               := clMenu;
        dbedt_icms_ir.Color              := clMenu;
        dbedt_cd_local_emb_ir.Color      := clMenu;
        dbedt_cd_local_desemb_ir.Color   := clMenu;
        dbedt_cd_pais_origem_ir.Color    := clMenu;
        dbedt_nr_conh_ir.Color           := clMenu;
        dbedt_nr_manifesto_ir.Color      := clMenu;
        dbedt_nr_placa_veiculo_ir.Color  := clMenu;
        dbedt_cd_amz_atr_ir.Color        := clMenu;
        dbedt_cd_agente_ir.Color         := clMenu;
        dbedt_dt_conh_ir.Color           := clMenu;
        dbedt_nr_conh_ir.Color           := clMenu;
        dblckpbox_tp_frete_ir.Color      := clMenu;
        dbedt_cd_fronteiraImp.Color      := clMenu;
        dbedt_cd_amz_des_ir.Color        := clMenu;
        dbedt_QT_MERC_UN_COMERC_ir.Color := clMenu;
        dbedt_VL_PESO_LIQUIDO_ir.Color   := clMenu;
        dbedt_VL_FOB_ir.Color            := clMenu;
        dbedt_CD_UNID_MEDIDA_ir.Color    := clMenu;
        dbedt_CD_MOEDA_MLE_ir.Color      := clMenu;
      end
      else
      begin
        dbedt_cd_moeda_frete_ir.Color    := clWindow;
        dbedt_vl_frete_collect_ir.Color  := clWindow;
        dbedt_vl_frete_prepaid_ir.Color  := clWindow;
        dbedt_vl_frete_tnac_ir.Color     := clWindow;
        dbedt_vl_mle_mn_ir.Color         := clWindow;
        dbedt_cif_dolar_ir.Color         := clWindow;
        dbedt_cif_ir.Color               := clWindow;
        dbedt_ii_ir.Color                := clWindow;
        dbedt_ipi_ir.Color               := clWindow;
        dbedt_icms_ir.Color              := clWindow;
        dbedt_cd_local_emb_ir.Color      := clWindow;
        dbedt_cd_local_desemb_ir.Color   := clWindow;
        dbedt_cd_pais_origem_ir.Color    := clWindow;
        dbedt_nr_conh_ir.Color           := clWindow;
        dbedt_nr_manifesto_ir.Color      := clWindow;
        dbedt_nr_placa_veiculo_ir.Color  := clWindow;
        dbedt_cd_amz_atr_ir.Color        := clWindow;
        dbedt_cd_agente_ir.Color         := clWindow;
        dbedt_dt_conh_ir.Color           := clWindow;
        dbedt_nr_conh_ir.Color           := clWindow;
        dblckpbox_tp_frete_ir.Color      := clWindow;
        dbedt_cd_fronteiraImp.Color      := clWindow;
        dbedt_cd_amz_des_ir.Color        := clWindow;
        dbedt_QT_MERC_UN_COMERC_ir.Color := clWindow;
        dbedt_VL_PESO_LIQUIDO_ir.Color   := clWindow;
        dbedt_VL_FOB_ir.Color            := clWindow;
        dbedt_CD_UNID_MEDIDA_ir.Color    := clWindow;
        dbedt_CD_MOEDA_MLE_ir.Color      := clWindow;
      end;

      dbedt_cd_moeda_frete_ir.TabStop    := Not Hab;
      dbedt_vl_frete_collect_ir.TabStop  := Not Hab;
      dbedt_vl_frete_prepaid_ir.TabStop  := Not Hab;
      dbedt_vl_frete_tnac_ir.TabStop     := Not Hab;
      dbedt_vl_mle_mn_ir.TabStop         := Not Hab;
      dbedt_cif_dolar_ir.TabStop         := Not Hab;
      dbedt_cif_ir.TabStop               := Not Hab;
      dbedt_ii_ir.TabStop                := Not Hab;
      dbedt_ipi_ir.TabStop               := Not Hab;
      dbedt_icms_ir.TabStop              := Not Hab;
      dbedt_cd_local_emb_ir.TabStop      := Not Hab;
      dbedt_cd_local_desemb_ir.TabStop   := Not Hab;
      dbedt_cd_pais_origem_ir.TabStop    := Not Hab;
      dbedt_nr_conh_ir.TabStop           := Not Hab;
      dbedt_nr_manifesto_ir.TabStop      := Not Hab;
      dbedt_nr_placa_veiculo_ir.TabStop  := Not Hab;
      dbedt_cd_amz_atr_ir.TabStop        := Not Hab;
      dbedt_cd_agente_ir.TabStop         := Not Hab;
      dbedt_dt_conh_ir.TabStop           := Not Hab;
      dbedt_nr_conh_ir.TabStop           := Not Hab;
      dblckpbox_tp_frete_ir.TabStop      := Not Hab;
      dbedt_cd_fronteiraImp.TabStop      := Not Hab;
      btn_co_moeda_frete_ir.Enabled      := Not Hab;
      btn_co_local_emb_ir.Enabled        := Not Hab;
      btn_co_local_desemb_ir.Enabled     := Not Hab;
      btn_co_pais_origem_ir.Enabled      := Not Hab;
      btn_co_amz_atr_ir.Enabled          := Not Hab;
      btn_co_agente_ir.Enabled           := Not Hab;
      Btn_FronteiraImp.Enabled           := Not Hab;
      btn_co_amz_des_ir.Enabled          := Not Hab;
    end;

    if nbImportacao.ActivePage = 'F' then
    begin
      dbedt_cd_moeda_frete_if.ReadOnly   := Hab;
      dbedt_vl_frete_collect_if.ReadOnly := Hab;
      dbedt_vl_frete_prepaid_if.ReadOnly := Hab;
      dbedt_vl_frete_tnac_if.ReadOnly    := Hab;
      dbedt_vl_mle_mn_if.ReadOnly        := Hab;
      dbedt_cif_dolar_if.ReadOnly        := Hab;
      dbedt_cif_if.ReadOnly              := Hab;
      dbedt_ii_if.ReadOnly               := Hab;
      dbedt_ipi_if.ReadOnly              := Hab;
      dbedt_icms_if.ReadOnly             := Hab;
      dbedt_cd_local_emb_if.ReadOnly     := Hab;
      dbedt_cd_local_desemb_if.ReadOnly  := Hab;
      dbedt_cd_pais_origem_if.ReadOnly   := Hab;
      dbedt_nr_conh_if.ReadOnly          := Hab;
      dbedt_nr_manifesto_if.ReadOnly     := Hab;
      dbedt_cd_amz_atr_if.ReadOnly       := Hab;
      dbedt_cd_agente_if.ReadOnly        := Hab;
      dbedt_dt_conh_if.ReadOnly          := Hab;
      dbedt_nr_conh_if.ReadOnly          := Hab;
      dblckpbox_tp_frete_ir.ReadOnly     := Hab;
      dbedt_QT_MERC_UN_COMERC_if.ReadOnly  := Hab;
      dbedt_VL_PESO_LIQUIDO_if.ReadOnly    := Hab;
      dbedt_VL_FOB_if.ReadOnly             := Hab;
      dbedt_CD_UNID_MEDIDA_if.ReadOnly     := Hab;
      btn_cd_unid_medida_if.Enabled        := not Hab;
      dbedt_CD_MOEDA_MLE_if.ReadOnly       := Hab;
      btn_cd_moeda_mle_if.Enabled          := not Hab;
      if hab then
      begin
        dbedt_cd_moeda_frete_if.Color    := clMenu;
        dbedt_vl_frete_collect_if.Color  := clMenu;
        dbedt_vl_frete_prepaid_if.Color  := clMenu;
        dbedt_vl_frete_tnac_if.Color     := clMenu;
        dbedt_vl_mle_mn_if.Color         := clMenu;
        dbedt_cif_dolar_if.Color         := clMenu;
        dbedt_cif_if.Color               := clMenu;
        dbedt_ii_if.Color                := clMenu;
        dbedt_ipi_if.Color               := clMenu;
        dbedt_icms_if.Color              := clMenu;
        dbedt_cd_local_emb_if.Color      := clMenu;
        dbedt_cd_local_desemb_if.Color   := clMenu;
        dbedt_cd_pais_origem_if.Color    := clMenu;
        dbedt_nr_conh_if.Color           := clMenu;
        dbedt_nr_manifesto_if.Color      := clMenu;
        dbedt_cd_amz_atr_if.Color        := clMenu;
        dbedt_cd_agente_if.Color         := clMenu;
        dbedt_dt_conh_if.Color           := clMenu;
        dbedt_nr_conh_if.Color           := clMenu;
        dblckpbox_tp_frete_if.Color      := clMenu;
        dbedt_QT_MERC_UN_COMERC_if.Color := clMenu;
        dbedt_VL_PESO_LIQUIDO_if.Color   := clMenu;
        dbedt_VL_FOB_if.Color            := clMenu;
        dbedt_CD_UNID_MEDIDA_if.Color    := clMenu;
        dbedt_CD_MOEDA_MLE_if.Color      := clMenu;
      end
      else
      begin
        dbedt_cd_moeda_frete_if.Color    := clWindow;
        dbedt_vl_frete_collect_if.Color  := clWindow;
        dbedt_vl_frete_prepaid_if.Color  := clWindow;
        dbedt_vl_frete_tnac_if.Color     := clWindow;
        dbedt_vl_mle_mn_if.Color         := clWindow;
        dbedt_cif_dolar_if.Color         := clWindow;
        dbedt_cif_if.Color               := clWindow;
        dbedt_ii_if.Color                := clWindow;
        dbedt_ipi_if.Color               := clWindow;
        dbedt_icms_if.Color              := clWindow;
        dbedt_cd_local_emb_if.Color      := clWindow;
        dbedt_cd_local_desemb_if.Color   := clWindow;
        dbedt_cd_pais_origem_if.Color    := clWindow;
        dbedt_nr_conh_if.Color           := clWindow;
        dbedt_nr_manifesto_if.Color      := clWindow;
        dbedt_cd_amz_atr_if.Color        := clWindow;
        dbedt_cd_agente_if.Color         := clWindow;
        dbedt_dt_conh_if.Color           := clWindow;
        dbedt_nr_conh_if.Color           := clWindow;
        dblckpbox_tp_frete_ir.Color      := clWindow;
        dbedt_QT_MERC_UN_COMERC_if.Color := clWindow;
        dbedt_VL_PESO_LIQUIDO_if.Color   := clWindow;
        dbedt_VL_FOB_if.Color            := clWindow;
        dbedt_CD_UNID_MEDIDA_if.Color    := clWindow;
        dbedt_CD_MOEDA_MLE_if.Color      := clWindow;
      end;

      dbedt_cd_moeda_frete_if.TabStop    := Not Hab;
      dbedt_vl_frete_collect_if.TabStop  := Not Hab;
      dbedt_vl_frete_prepaid_if.TabStop  := Not Hab;
      dbedt_vl_frete_tnac_if.TabStop     := Not Hab;
      dbedt_vl_mle_mn_if.TabStop         := Not Hab;
      dbedt_cif_dolar_if.TabStop         := Not Hab;
      dbedt_cif_if.TabStop               := Not Hab;
      dbedt_ii_if.TabStop                := Not Hab;
      dbedt_ipi_if.TabStop               := Not Hab;
      dbedt_icms_if.TabStop              := Not Hab;
      dbedt_cd_local_emb_if.TabStop      := Not Hab;
      dbedt_cd_local_desemb_if.TabStop   := Not Hab;
      dbedt_cd_pais_origem_if.TabStop    := Not Hab;
      dbedt_nr_conh_if.TabStop           := Not Hab;
      dbedt_nr_manifesto_if.TabStop      := Not Hab;
      dbedt_cd_amz_atr_if.TabStop        := Not Hab;
      dbedt_cd_agente_if.TabStop         := Not Hab;
      dbedt_dt_conh_if.TabStop           := Not Hab;
      dbedt_nr_conh_if.TabStop           := Not Hab;
      dblckpbox_tp_frete_ir.TabStop      := Not Hab;

      btn_co_moeda_frete_if.Enabled      := Not Hab;
      btn_co_local_emb_if.Enabled        := Not Hab;
      btn_co_local_desemb_if.Enabled     := Not Hab;
      btn_co_pais_origem_if.Enabled      := Not Hab;
      btn_co_amz_atr_if.Enabled          := Not Hab;
      btn_co_agente_if.Enabled           := Not Hab;
    end;
    qry_existe_di_.Close;
    qry_existe_da_.Close;
  end;
end;

procedure Tfrm_manut_proc.dbg_volumesColEnter(Sender: TObject);
begin
  if datm_manut_proc.qry_volumes_.State in [dsInsert, dsEdit] then btn_mi(False, True, True, False);
end;

procedure Tfrm_manut_proc.dbedt_cd_servicoEnter(Sender: TObject);
begin
  cd_servico := datm_manut_proc.qry_processo_CD_SERVICO.AsString;
end;

procedure Tfrm_manut_proc.dbedt_cd_contato_im2Exit(Sender: TObject);
begin
  CodExits;
end;

procedure Tfrm_manut_proc.btn_co_contato_imClick(Sender: TObject);
begin
  if Not lAbertura then Edita;
  if Sender is TSpeedButton then
  begin
    If Not PoeEmEdicao(datm_manut_proc.qry_proc_im_) Then Exit;
    If (Sender as TSpeedButton).Enabled Then
      datm_manut_proc.qry_proc_im_CD_CONTATO.AsString := ConsultaOnLineExSQL('SELECT CD_CONTATO, NM_CONTATO FROM TCLIENTE_CONTATO (NOLOCK) WHERE CD_CLIENTE = ''' + dbedt_cd_cliente.Text + ''' and CD_UNID_NEG = ''' + msk_cd_unid_neg.Text + ''' AND CD_PRODUTO    = ''' + msk_cd_produto.Text + '''',
                                                                             'Contatos', ['CD_CONTATO', 'NM_CONTATO'], ['Código', 'Descrição'], 'CD_CONTATO', nil, dbedt_cd_contato_im.Text);
  end
  else
    dbedt_nm_contato_im.Text := ConsultaLookUPSQL('SELECT NM_CONTATO FROM TCLIENTE_CONTATO (NOLOCK) WHERE CD_CLIENTE = ''' + dbedt_cd_cliente.Text + ''' and CD_UNID_NEG = ''' + msk_cd_unid_neg.Text + ''' AND CD_PRODUTO    = ''' + msk_cd_produto.Text + ''' and CD_CONTATO = ''' + dbedt_cd_contato_im.Text + '''','NM_CONTATO');
end;

procedure Tfrm_manut_proc.dbedt_nr_cntrChange(Sender: TObject);
begin
  if Not lAbertura then
  begin
    if ( datm_manut_proc.qry_proc_cntr_.State in [ dsInsert, dsEdit ] ) then
      btn_mi(False, True, True, False);
  end;
end;

procedure Tfrm_manut_proc.dbedt_vl_qtdeChange(Sender: TObject);
begin
  if Not lAbertura then
  begin
    if ( datm_manut_proc.qry_proc_carga_solta_.State in [ dsInsert, dsEdit ] ) then
       btn_mi(False, True, True, False);
  end;
end;

procedure Tfrm_manut_proc.btn_co_transp_nac_docClick(Sender: TObject);
begin
  if Not lAbertura then
    Edita;
  if Sender is TSpeedButton then
  begin
    if not PoeEmEdicao(datm_manut_proc.qry_processo_) then
      exit;
    If (Sender as TSpeedButton).Enabled Then
      datm_manut_proc.qry_processo_CD_TRANSP_NAC_DOC.AsString := ConsultaOnLineEx('TTRANSP_ROD','Transportador',['CD_TRANSP_ROD','NM_TRANSP_ROD'],['Código','Descrição'],'CD_TRANSP_ROD',frm_main.mi_cad_transp_rod, 1 ,dbedt_cd_transp_nac_doc.text)
  end else
    edt_nm_transp_nac_doc.Text := ConsultaLookUP('TTRANSP_ROD','CD_TRANSP_ROD',dbedt_cd_transp_nac_doc.Text,'NM_TRANSP_ROD');
end;

procedure Tfrm_manut_proc.btn_co_transp_nacClick(Sender: TObject);
var
  vListAux : TStringList;
begin

  if Not lAbertura then Edita;

  if Sender is TSpeedButton then begin
    if not PoeEmEdicao(datm_manut_proc.qry_processo_) then  exit;

    if (Sender as TSpeedButton).Enabled Then begin
//      datm_manut_proc.qry_processo_CD_TRANSP_NAC.AsString := ConsultaOnLineEx('TTRANSP_ROD','Transportador',['CD_TRANSP_ROD','NM_TRANSP_ROD'],['Código','Descrição'],'CD_TRANSP_ROD',frm_main.mi_cad_transp_rod, 1, dbedt_cd_transp_nac.text) by carlos - 26/08/2011 (precisava ver habilitação)

      vListAux := TStringList.Create;
      vListAux.Add(' SELECT DISTINCT CT.CD_TRANSP , T.NM_TRANSP_ROD ');
      vListAux.Add(' FROM TCLIENTE_TRANSPORTADOR CT ( NOLOCK ) ');
      vListAux.Add(' JOIN TTRANSP_ROD T ( NOLOCK ) ON CT.CD_TRANSP = T.CD_TRANSP_ROD ');
      vListAux.Add(' WHERE CT.CD_CLIENTE = "' + dbedt_cd_cliente.Text + '" ');
      vListAux.Add(' AND CT.CD_PRODUTO   = "' + msk_cd_produto.Text   + '" ');
      vListAux.Add(' AND CT.CD_UNID_NEG  = "' + msk_cd_unid_neg.Text  + '" ');
      vListAux.Add(' AND CT.IN_ATIVO     = "1" ');
      datm_manut_proc.qry_processo_CD_TRANSP_NAC.AsString := ConsultaOnLineExSQLList(vListAux,'Transportadoras',['CD_TRANSP', 'NM_TRANSP_ROD'],['Código', 'Nome'],'CD_TRANSP',nil, datm_manut_proc.qry_processo_CD_TRANSP_NAC.AsString);
      vListAux.Free;
    end;
  end else begin
//    edt_nm_transp_nac.Text := ConsultaLookUP('TTRANSP_ROD','CD_TRANSP_ROD',dbedt_cd_transp_nac.Text,'NM_TRANSP_ROD'); //by carlos - checar habilitação

    edt_nm_transp_nac.Text := ConsultaLookUPSQL(
    ' SELECT DISTINCT CT.CD_TRANSP , T.NM_TRANSP_ROD '+
    ' FROM TCLIENTE_TRANSPORTADOR CT ( NOLOCK ) '+
    ' JOIN TTRANSP_ROD T ( NOLOCK ) ON CT.CD_TRANSP = T.CD_TRANSP_ROD '+
    ' WHERE CT.CD_CLIENTE = "' + datm_manut_proc.qry_processo_CD_CLIENTE.AsString    + '" '+
    ' AND CT.CD_PRODUTO   = "' + msk_cd_produto.Text      + '" '+
    ' AND CT.CD_UNID_NEG  = "' + msk_cd_unid_neg.Text     + '" '+
    ' AND CT.CD_TRANSP    = "' + dbedt_cd_transp_nac.Text + '" '+
    ' AND CT.IN_ATIVO     = "1" ' , 'NM_TRANSP_ROD' );


  end;


  // Exibir o CNPJ da Transportadora - Michel - 06/01/2009 - Ocorrência 00423/09
  msk_CNPJ_TranspMerc.Text := ConsultaLookUPSQL(' SELECT CNPJ_TRANSP_ROD  ' +
                                                ' FROM TTRANSP_ROD (NOLOCK)       ' +
                                                ' WHERE CD_TRANSP_ROD = ''' + dbedt_cd_transp_nac.Text + '''', 'CNPJ_TRANSP_ROD');
end;

procedure Tfrm_manut_proc.btn_co_banco_eaClick(Sender: TObject);
begin
  if Not lAbertura then Edita;
  if Sender is TSpeedButton then
  begin
    If Not PoeEmEdicao(datm_manut_proc.qry_proc_em_) Then Exit;
    If (Sender as TSpeedButton).Enabled Then
      datm_manut_proc.qry_proc_em_CD_BANCO_EXP.AsString := ConsultaOnLineExSQL('SELECT EE.CD_EMPRESA, EE.NM_EMPRESA, EE.AP_EMPRESA,(SELECT RTRIM(LTRIM(NM_PAIS)) + '' '' FROM TPAIS_BROKER (NOLOCK) WHERE CD_PAIS = EE.CD_PAIS) AS PAIS, ' +
                    'RTRIM(LTRIM(EE.END_CIDADE)) AS END_CIDADE, ISNULL(RTRIM(LTRIM(EE.END_EMPRESA)), '''') + '' '' + ISNULL(RTRIM(LTRIM(EE.END_NUMERO)), '''') + '' '' + ISNULL(RTRIM(LTRIM(EE.END_COMPL)), '''') AS ENDERECO ' +
                    'FROM TEMPRESA_EST EE (NOLOCK) ' +
                    'WHERE EE.IN_BANCO = ''1'' AND EE.IN_ATIVO = ''1'' ',
                    'Banco',['CD_EMPRESA', 'NM_EMPRESA', 'AP_EMPRESA', 'PAIS', 'END_CIDADE', 'ENDERECO'],['Código', 'Nome', 'Apelido', 'País', 'Cidade', 'Endereço'],
                    'CD_EMPRESA',
                    nil, dbedt_cd_banco_ea.text);
  end
  else
    dbedt_nm_banco_ea.Text := ConsultaLookUPSQL('SELECT NM_EMPRESA FROM TEMPRESA_EST (NOLOCK) WHERE IN_BANCO = 1 and CD_EMPRESA = ''' + dbedt_cd_banco_ea.Text + '''','NM_EMPRESA');
end;

procedure Tfrm_manut_proc.dbedt_cd_banco_carta_eaExit(Sender: TObject);
begin
  CodExits;
end;

procedure Tfrm_manut_proc.dblckpbox_tp_banco_eaClick(Sender: TObject);
begin
  with datm_manut_proc do
  begin
    dbedt_cd_clienteChange(nil);

    if qry_proc_em_.State in [dsEdit, dsInsert] then
    begin
      qry_proc_em_CD_BANCO_EXP.AsString := '';
      dbedt_nm_banco_ea.Text    := '';
      if dblckpbox_tp_banco_ea.KeyValue = '0' then  // em branco
      begin
        dbedt_cd_banco_ea.ReadOnly := True;
        dbedt_cd_banco_ea.TabStop  := False;
        dbedt_cd_banco_ea.Color    := clMenu;

        btn_co_banco_ea.Enabled    := False;
      end
      else   // Fechamento de Cambio / Carta de Credito
      begin
        dbedt_cd_banco_ea.ReadOnly := False;
        dbedt_cd_banco_ea.TabStop  := True;
        dbedt_cd_banco_ea.Color    := clWindow;

        btn_co_banco_ea.Enabled   := True;
      end;
    end;
  end;
end;

procedure Tfrm_manut_proc.btn_co_agente_seg_emClick(Sender: TObject);
begin
  If Not lAbertura Then Edita;
  If Sender is TSpeedButton Then
  Begin
    If Not PoeEmEdicao(datm_manut_proc.qry_proc_em_) Then
      Exit;
      
    If (Sender as TSpeedButton).Enabled Then
      datm_manut_proc.qry_proc_em_CD_AGENTE_SEGURO.AsString := ConsultaOnLineExSQL('SELECT CD_EMPRESA, NM_EMPRESA FROM TEMPRESA_EST (NOLOCK) WHERE IN_AGENTE = 1',
                                                                                  'Agente de Seguro', ['CD_EMPRESA', 'NM_EMPRESA'], ['Código', 'Descrição'], 'CD_EMPRESA', nil, dbedt_cd_agente_seg_em.text);
  End
  Else
    dbedt_nm_agente_seg_em.Text := ConsultaLookUPSQL('SELECT NM_EMPRESA FROM TEMPRESA_EST (NOLOCK) WHERE IN_AGENTE = 1 and CD_EMPRESA = ''' + dbedt_cd_agente_seg_em.Text + '''','NM_EMPRESA');
end;

procedure Tfrm_manut_proc.btn_proc_realizaClick(Sender: TObject);
begin
  str_cd_rotina_atalho := '0110';
  if Not VerAlt then
    Exit;
  Tag:=1;
  Close;
end;

procedure Tfrm_manut_proc.dbedt_cd_clienteExit(Sender: TObject);
begin
  CodExits;
end;

procedure Tfrm_manut_proc.dbedt_vl_frete_prepaid_imChange(Sender: TObject);
begin
  if Not lAbertura then
    Edita;
  if (Trim(dbedt_vl_frete_prepaid_im.Text) <> '') and (Trim(dbedt_vl_frete_prepaid_im.Text) <> '0,00') then
  begin
    dbedt_vl_frete_collect_im.Text     := '0,00';
    dbedt_vl_frete_collect_im.Color    := clSilver;
    dbedt_vl_frete_collect_im.ReadOnly := True;
  end
  else
  begin
    dbedt_vl_frete_collect_im.Color    := clWindow;
    dbedt_vl_frete_collect_im.ReadOnly := False;
  end;
end;

procedure Tfrm_manut_proc.dbedt_vl_frete_prepaid_iaChange(Sender: TObject);
begin
  if Not lAbertura then Edita;
  if (Trim(dbedt_vl_frete_prepaid_ia.Text) <> '') and ( Trim( dbedt_vl_frete_prepaid_ia.Text) <> '0,00' ) then
  begin
    dbedt_vl_frete_collect_ia.Text     := '0,00';
    dbedt_vl_frete_collect_ia.Color    := clSilver;
    dbedt_vl_frete_collect_ia.ReadOnly := True;
  end
  else
  begin
    dbedt_vl_frete_collect_ia.Color    := clWindow;
    dbedt_vl_frete_collect_ia.ReadOnly := False;
  end;
end;

procedure Tfrm_manut_proc.dbedt_vl_frete_collect_imChange(Sender: TObject);
begin
  if Not lAbertura then Edita;
  if (Trim(dbedt_vl_frete_collect_im.Text) <> '') and (Trim(dbedt_vl_frete_collect_im.Text) <> '0,00') then
  begin
    dbedt_vl_frete_prepaid_im.Text     := '0,00';
    dbedt_vl_frete_prepaid_im.Color    := clSilver;
    dbedt_vl_frete_prepaid_im.ReadOnly := True;
  end
  else
  begin
    dbedt_vl_frete_prepaid_im.Color    := clWindow;
    dbedt_vl_frete_prepaid_im.ReadOnly := False;
  end;
end;

procedure Tfrm_manut_proc.dbedt_vl_frete_collect_iaChange(Sender: TObject);
begin
  if Not lAbertura then Edita;
  if ( Trim( dbedt_vl_frete_collect_ia.Text ) <> '' ) and ( Trim( dbedt_vl_frete_collect_ia.Text ) <> '0,00' ) then
  begin
    dbedt_vl_frete_prepaid_ia.Text     := '0,00';
    dbedt_vl_frete_prepaid_ia.Color    := clSilver;
    dbedt_vl_frete_prepaid_ia.ReadOnly := True;
  end
  else
  begin
    dbedt_vl_frete_prepaid_ia.Color    := clWindow;
    dbedt_vl_frete_prepaid_ia.ReadOnly := False;
  end;
end;

procedure Tfrm_manut_proc.dbedt_processo_nf_notaChange(Sender: TObject);
begin
  if Not lAbertura then
    if ( datm_manut_proc.qry_processo_nf_.State in [ dsInsert, dsEdit ] ) then
       btn_mi(False, True, True, False);
end;

procedure Tfrm_manut_proc.btn_di_proc_expClick(Sender: TObject);
begin
  if msk_cd_produto.Text = '01' then str_cd_rotina_atalho := '0201';

  if msk_cd_produto.Text = '02' then
  begin
    str_cd_rotina_atalho := '2001';
    with datm_manut_proc do
    begin
      qry_proc_exp_.Close;
      qry_proc_exp_.ParamByName('NR_PROCESSO').AsString := qry_processo_NR_PROCESSO.AsString;
      qry_proc_exp_.Open;
      if qry_proc_exp_.RecordCount = 0 then
      begin
        BoxMensagem( 'Processo de Exportação não cadastrado!', 2 );
        qry_proc_exp_.Close;
        str_cd_rotina_atalho := '';
        Exit;
      end;
      qry_proc_exp_.Close;
    end;
  end;

  if Not VerAlt then
    Exit;
  Tag:=1;
  Close;
end;

procedure Tfrm_manut_proc.btn_co_despachante_expClick(Sender: TObject);
begin
  if Not lAbertura then Edita;
  if Sender is TSpeedButton then
  begin
    if not PoeEmEdicao(datm_manut_proc.qry_processo_) then exit;
    If (Sender as TSpeedButton).Enabled Then
      datm_manut_proc.qry_processo_CD_DESPACHANTE.AsString := ConsultaOnLineEx('TDESPACHANTE','Despachantes',['CD_DESPACHANTE','NM_DESPACHANTE','CPF_DESPACHANTE'],['Código','Nome','CPF'],'CD_DESPACHANTE',frm_main.mi_cad_desp, 1, dbedt_cd_despachante_exp.text) //by carlos - 29/11/2011 (incluir o CPF)
  end
  else
    dbedt_nm_despachante_exp.Text := ConsultaLookUP('TDESPACHANTE','CD_DESPACHANTE',dbedt_cd_despachante_exp.Text,'NM_DESPACHANTE');
end;

procedure Tfrm_manut_proc.pgctrl_despacho_expChange(Sender: TObject);
begin
  with datm_manut_proc do
  begin
    if ( pgctrl_despacho_exp.ActivePage = ts_re ) then
       dbnvg.DataSource := ds_processo_re;
    if ( pgctrl_despacho_exp.ActivePage = ts_dde_nf ) then
       dbnvg.DataSource := ds_dde_nf;

    if pgctrl_despacho_exp.ActivePage = ts_fat_exp then
    begin
      btn_mi( st_incluir, False, False, st_excluir );
      dbnvg.DataSource := ds_Doctos_Inst;
    end;
  end;
end;

procedure Tfrm_manut_proc.dblckpbox_tp_frete_erClick(Sender: TObject);
begin
  with datm_manut_proc do
  begin
    if qry_proc_em_.State in [dsEdit, dsInsert] then
    begin
      if dblckpbox_tp_frete_er.KeyValue = '' then  // em branco
      begin
        dbedt_vl_frete_collect_er.Enabled := False;
        dbedt_vl_frete_collect_er.TabStop := False;
        dbedt_vl_frete_collect_er.Color   := clMenu;

        dbedt_vl_frete_prepaid_er.Enabled := False;
        dbedt_vl_frete_prepaid_er.TabStop := False;
        dbedt_vl_frete_prepaid_er.Color   := clMenu;

        qry_proc_em_VL_FRETE_COLLECT_MNEG.AsFloat := 0;
        qry_proc_em_VL_FRETE_PREPAID_MNEG.AsFloat := 0;
      end
      else if dblckpbox_tp_frete_er.KeyValue = '0' then  // Collect
      begin
        dbedt_vl_frete_collect_er.Enabled := True;
        dbedt_vl_frete_collect_er.TabStop := True;
        dbedt_vl_frete_collect_er.Color   := clWindow;
        dbedt_vl_frete_collect_er.ReadOnly:= false;

        dbedt_vl_frete_prepaid_er.Enabled := False;
        dbedt_vl_frete_prepaid_er.TabStop := False;
        dbedt_vl_frete_prepaid_er.Color   := clMenu;

        qry_proc_em_VL_FRETE_PREPAID_MNEG.AsFloat := 0;
      end
      else if dblckpbox_tp_frete_er.KeyValue = '1' then  //Prepaid
      begin
        dbedt_vl_frete_collect_er.Enabled := False;
        dbedt_vl_frete_collect_er.TabStop := False;
        dbedt_vl_frete_collect_er.Color   := clMenu;
        dbedt_vl_frete_prepaid_er.ReadOnly:= false;

        dbedt_vl_frete_prepaid_er.Enabled := True;
        dbedt_vl_frete_prepaid_er.TabStop := True;
        dbedt_vl_frete_prepaid_er.Color   := clWindow;

        qry_proc_em_VL_FRETE_COLLECT_MNEG.AsFloat := 0;
      end;
    end;
    dbedt_cd_clienteChange(nil);
    VerificaFrete;
  end;
end;

procedure Tfrm_manut_proc.VerDDE;
var vDDE: Boolean;
begin
  vDDE := StrToIntDef(ConsultaLookUPSQL('SELECT COUNT(*) AS CONT FROM TSD (NOLOCK) WHERE NR_SD = "' + datm_manut_proc.qry_processo_NR_PROCESSO.AsString + '" ', 'CONT'), 0) = 0;
  dbedt_nr_dde.ReadOnly               := Not vDDE;
  dbedt_dt_reg_dde.ReadOnly           := Not vDDE;
  dbedt_cd_despachante_exp.ReadOnly   := Not vDDE;
  btn_co_despachante_exp.Enabled      := vDDE;  //by carlos 16/04/2010
  dbedt_nr_dde.TabStop                := vDDE;
  dbedt_dt_reg_dde.TabStop            := vDDE;
  dbedt_cd_despachante_exp.TabStop    := vDDE;
  if vDDE then
  begin
    dbedt_nr_dde.Color                := clWindow;
    dbedt_dt_reg_dde.Color            := clWindow;
    dbedt_cd_despachante_exp.Color    := clWindow;
  end else begin
    dbedt_nr_dde.Color                := clMenu;
    dbedt_dt_reg_dde.Color            := clMenu;
    dbedt_cd_despachante_exp.Color    := clMenu;
  end;
end;

procedure Tfrm_manut_proc.VerProcessoExp;
var
  ProcExp, ProcExpI : Boolean;
  TemPedido: Boolean;
begin
  with datm_manut_proc do
  begin
    qry_proc_exp_.Close;
    qry_proc_exp_.ParamByName('NR_PROCESSO').AsString := datm_manut_proc.qry_processo_NR_PROCESSO.AsString;
    qry_proc_exp_.Open;
    ProcExp := ( qry_proc_exp_.RecordCount = 0 );
    qry_proc_exp_.Close;

    if ProcExp then
    begin
      btn_co_incoterm_m.Enabled     := True;
      btn_co_incoterm_a.Enabled     := True;
      btn_co_incoterm_r.Enabled     := True;
      btn_co_incoterm_f.Enabled     := True;

      dbedt_cd_incoterm_m.ReadOnly  := False;
      dbedt_cd_incoterm_a.ReadOnly  := False;
      dbedt_cd_incoterm_r.ReadOnly  := False;
      dbedt_cd_incoterm_f.ReadOnly  := False;

      dbedt_cd_incoterm_m.TabStop   := False;
      dbedt_cd_incoterm_a.TabStop   := False;
      dbedt_cd_incoterm_r.TabStop   := False;
      dbedt_cd_incoterm_f.TabStop   := False;

      dbedt_cd_incoterm_m.Color     := clWindow;
      dbedt_cd_incoterm_a.Color     := clWindow;
      dbedt_cd_incoterm_r.Color     := clWindow;
      dbedt_cd_incoterm_f.Color     := clWindow;
    end
    else
    begin
      btn_co_incoterm_m.Enabled     := False;
      btn_co_incoterm_a.Enabled     := False;
      btn_co_incoterm_r.Enabled     := False;
      btn_co_incoterm_f.Enabled     := False;

      dbedt_cd_incoterm_m.ReadOnly  := True;
      dbedt_cd_incoterm_a.ReadOnly  := True;
      dbedt_cd_incoterm_r.ReadOnly  := True;
      dbedt_cd_incoterm_f.ReadOnly  := True;

      dbedt_cd_incoterm_m.TabStop   := True;
      dbedt_cd_incoterm_a.TabStop   := True;
      dbedt_cd_incoterm_r.TabStop   := True;
      dbedt_cd_incoterm_f.TabStop   := True;

      dbedt_cd_incoterm_m.Color     := clMenu;
      dbedt_cd_incoterm_a.Color     := clMenu;
      dbedt_cd_incoterm_r.Color     := clMenu;
      dbedt_cd_incoterm_f.Color     := clMenu;
    end;

    ProcExpI := StrToIntDef(ConsultaLookUPSQL('SELECT COUNT(*) AS CONT FROM TPROCESSO_EXP_ITEM (NOLOCK) WHERE NR_PROCESSO = "' + datm_manut_proc.qry_processo_NR_PROCESSO.AsString + '" ', 'CONT'), 0) = 0;

    TemPedido := ConsultaLookUPSQL(' SELECT COUNT(*) AS QTD ' +
                                   ' FROM TESTAGIO_PROCESSO (NOLOCK) ' +
                                   ' WHERE NR_PROCESSO_DES = ''' + datm_manut_proc.qry_processo_NR_PROCESSO.AsString + ''' ' +
                                   '   AND ISNULL(NR_PROCESSO_ADM, '''') <> ''''', 'QTD') <> '0';

    //consistência do frete (liberar quando valor for zero)
    dbedt_vl_frete_prepaid_em.ReadOnly  := (Not ProcExpI) and (qry_proc_em_VL_FRETE_PREPAID_MNEG.AsFloat <> 0);
    dbedtCdFreteEM.ReadOnly             := dbedt_vl_frete_prepaid_em.ReadOnly;
    dbedt_vl_frete_prepaid_ea.ReadOnly  := (Not ProcExpI) and (qry_proc_em_VL_FRETE_PREPAID_MNEG.AsFloat <> 0);
    dbedtCdFreteEA.ReadOnly             := dbedt_vl_frete_prepaid_ea.ReadOnly;
    dbedt_vl_frete_prepaid_er.ReadOnly  := ((Not ProcExpI) and (qry_proc_em_VL_FRETE_PREPAID_MNEG.AsFloat <> 0)) or
                                            (datm_manut_proc.qry_proc_em_TP_FRETE.AsString = '0');
    dbedt_vl_frete_prepaid_ef.ReadOnly  := ((Not ProcExpI) and (qry_proc_em_VL_FRETE_PREPAID_MNEG.AsFloat <> 0)) or
                                            (datm_manut_proc.qry_proc_em_TP_FRETE.AsString = '0');
    dbedt_vl_frete_collect_er.ReadOnly  := ((Not ProcExpI) and (qry_proc_em_VL_FRETE_COLLECT_MNEG.AsFloat <> 0)) or
                                            (datm_manut_proc.qry_proc_em_TP_FRETE.AsString = '1');
    dbedt_vl_frete_collect_ef.ReadOnly  := ((Not ProcExpI) and (qry_proc_em_VL_FRETE_COLLECT_MNEG.AsFloat <> 0)) or
                                            (qry_proc_em_TP_FRETE.AsString = '1');

    dbedt_vl_frete_prepaid_em.TabStop  := (ProcExpI) or (qry_proc_em_VL_FRETE_PREPAID_MNEG.AsFloat = 0);
    dbedtCdFreteEM.TabStop             := dbedt_vl_frete_prepaid_em.TabStop;
    dbedt_vl_frete_prepaid_ea.TabStop  := (ProcExpI) or (qry_proc_em_VL_FRETE_PREPAID_MNEG.AsFloat = 0);
    dbedtCdFreteEA.TabStop             := dbedt_vl_frete_prepaid_em.TabStop;
    dbedt_vl_frete_prepaid_er.TabStop  := ((ProcExpI) or (qry_proc_em_VL_FRETE_PREPAID_MNEG.AsFloat = 0)) and
                                           (datm_manut_proc.qry_proc_em_TP_FRETE.AsString = '1');
    dbedt_vl_frete_prepaid_ef.TabStop  := ((ProcExpI) or (qry_proc_em_VL_FRETE_PREPAID_MNEG.AsFloat = 0)) and
                                           (datm_manut_proc.qry_proc_em_TP_FRETE.AsString = '1');
    dbedt_vl_frete_collect_er.TabStop  := ((ProcExpI) or (qry_proc_em_VL_FRETE_COLLECT_MNEG.AsFloat = 0)) and
                                           (datm_manut_proc.qry_proc_em_TP_FRETE.AsString = '0');
    dbedt_vl_frete_collect_ef.TabStop  := ((ProcExpI) or (qry_proc_em_VL_FRETE_COLLECT_MNEG.AsFloat = 0)) and
                                           (qry_proc_em_TP_FRETE.AsString = '0');

    //esquema de cores (passa branco e posteriormente verifica se deve ficar cinza)
    dbedt_vl_frete_prepaid_em.Color     := clWindow;
    dbedtCdFreteEM.Color                := clWindow;
    dbedt_vl_frete_prepaid_ea.Color     := clWindow;
    dbedtCdFreteEA.Color                := clWindow;
    dbedt_vl_frete_prepaid_er.Color     := clWindow;
    dbedt_vl_frete_prepaid_ef.Color     := clWindow;
    dbedt_vl_frete_collect_er.Color     := clWindow;
    dbedt_vl_frete_collect_ef.Color     := clWindow;

    if (Not ProcExpI) and (qry_proc_em_VL_FRETE_PREPAID_MNEG.AsFloat <> 0) then dbedt_vl_frete_prepaid_em.Color := clMenu;
    dbedtCdFreteEM.Color := dbedt_vl_frete_prepaid_em.Color;
    if (Not ProcExpI) and (qry_proc_em_VL_FRETE_PREPAID_MNEG.AsFloat <> 0) then dbedt_vl_frete_prepaid_ea.Color := clMenu;
    dbedtCdFreteEA.Color := dbedt_vl_frete_prepaid_ea.Color;
    if ((Not ProcExpI) and (qry_proc_em_VL_FRETE_PREPAID_MNEG.AsFloat <> 0)) or(qry_proc_em_TP_FRETE.AsString = '0') then
      dbedt_vl_frete_prepaid_er.Color := clMenu;
    if ((Not ProcExpI) and (qry_proc_em_VL_FRETE_PREPAID_MNEG.AsFloat <> 0)) or (qry_proc_em_TP_FRETE.AsString = '0') then
      dbedt_vl_frete_prepaid_ef.Color := clMenu;
    if ((Not ProcExpI) and (qry_proc_em_VL_FRETE_COLLECT_MNEG.AsFloat <> 0)) or (qry_proc_em_TP_FRETE.AsString = '1') then
      dbedt_vl_frete_collect_er.Color := clMenu;
    if ((Not ProcExpI) and (qry_proc_em_VL_FRETE_COLLECT_MNEG.AsFloat <> 0)) or (qry_proc_em_TP_FRETE.AsString = '1') then
      dbedt_vl_frete_collect_ef.Color := clMenu;

    //dblkcbox_consignatario.Enabled      := ProcExp;
    dbedt_cd_consignatario.ReadOnly     := Not ProcExp;

    dblckpbox_tp_frete_er.ReadOnly      := Not ProcExp;
    dblckpbox_tp_frete_ef.ReadOnly      := Not ProcExp;
    //dbedt_cd_cliente.ReadOnly           := Not ProcExp; // Comentado e utilizando código abaixo - Michel - 15/06/2010

    dbedt_cd_cliente.ReadOnly           := not ((not ProcExp) or (ProcExp and (not TemPedido)));
//    dbedt_cd_rep.ReadOnly               := Not ProcExp;  //comentado por agatha nigro 14/03
    dbedt_cd_importador_em.ReadOnly     := Not ProcExp;
    dbedt_cd_importador_ea.ReadOnly     := Not ProcExp;
    dbedt_cd_importador_er.ReadOnly     := Not ProcExp;
    dbedt_cd_importador_ef.ReadOnly     := Not ProcExp;
    dbedt_cd_moeda_mle_em.ReadOnly      := Not ProcExp;
    dbedt_cd_moeda_mle_ea.ReadOnly      := Not ProcExp;
    dbedt_cd_moeda_mle_er.ReadOnly      := Not ProcExp;
    dbedt_cd_moeda_mle_ef.ReadOnly      := Not ProcExp;
    dbedt_mle_mneg_em.ReadOnly          := Not ProcExpI;
    dbedt_mle_mneg_ea.ReadOnly          := Not ProcExpI;
    dbedt_mle_mneg_er.ReadOnly          := Not ProcExpI;
    dbedt_mle_mneg_ef.ReadOnly          := Not ProcExpI;
    dbedt_mle_mn_em.ReadOnly            := Not ProcExpI;
    dbedt_mle_mn_ea.ReadOnly            := Not ProcExpI;
    dbedt_mle_mn_er.ReadOnly            := Not ProcExpI;
    dbedt_mle_mn_ef.ReadOnly            := Not ProcExpI;
    dbedt_vl_cif_mn_em.ReadOnly         := Not ProcExpI;
    dbedt_vl_cif_mn_ea.ReadOnly         := Not ProcExpI;
    dbedt_vl_cif_mn_er.ReadOnly         := Not ProcExpI;
    dbedt_vl_cif_mn_ef.ReadOnly         := Not ProcExpI;

//    dbedt_vl_frete_prepaid_em.ReadOnly  := (Not ProcExp) and (datm_manut_proc.qry_proc_em_VL_FRETE_PREPAID_MNEG.AsFloat <> 0);
//    dbedt_vl_frete_prepaid_ea.ReadOnly  := (Not ProcExp) and (datm_manut_proc.qry_proc_ea_VL_FRETE_PREPAID_MNEG.AsFloat <> 0);
    dbedt_vl_frete_tnac_er.ReadOnly     := Not ProcExpI;
    dbedt_vl_frete_tnac_ef.ReadOnly     := Not ProcExpI;
    dbedt_vl_seguro_er.ReadOnly         := Not ProcExpI;
    dbedt_vl_seguro_ef.ReadOnly         := Not ProcExpI;
//    dbedt_vl_peso_bruto_em.ReadOnly     := Not ProcExpI;    //Comentado para liberar campos para edição de peso bruto e peso líquido  FERNANDA 13/01/12
//    dbedt_vl_peso_bruto_ea.ReadOnly     := Not ProcExpI;
//    dbedt_vl_peso_bruto_er.ReadOnly     := Not ProcExpI;
//    dbedt_vl_peso_bruto_ef.ReadOnly     := Not ProcExpI;
//    dbedt_vl_peso_liquido_em.ReadOnly   := Not ProcExpI;
//    dbedt_vl_peso_liquido_ea.ReadOnly   := Not ProcExpI;
//    dbedt_vl_peso_liquido_er.ReadOnly   := Not ProcExpI;
//    dbedt_vl_peso_liquido_ef.ReadOnly   := Not ProcExpI;
//    dbedt_cd_agente_em.ReadOnly         := Not ProcExp;
//    dbedt_cd_agente_ea.ReadOnly         := Not ProcExp;
    //dbedt_cd_agente_er.ReadOnly         := Not ProcExp;  // linha comentada para hablitar para todos os processos de exportação
    dbedt_cd_agente_ef.ReadOnly         := Not ProcExp;
    dbedt_cd_local_emb_em.ReadOnly      := Not ProcExp;
  //dbedt_cd_local_emb_ea.ReadOnly      := Not ProcExp;
    dbedt_cd_local_emb_er.ReadOnly      := Not ProcExp;
    dbedt_cd_local_emb_ef.ReadOnly      := Not ProcExp;
//    dbedt_cd_local_transb_em.ReadOnly   := Not ProcExp;
    dbedt_cd_local_desemb_em.ReadOnly   := Not ProcExp;
    dbedt_cd_local_desemb_ea.ReadOnly   := Not ProcExp;
    dbedt_cd_local_desemb_er.ReadOnly   := Not ProcExp;
    dbedt_cd_local_desemb_ef.ReadOnly   := Not ProcExp;
    dbedt_cd_pais_dest_em.ReadOnly      := Not ProcExp;
    dbedt_cd_pais_dest_ea.ReadOnly      := Not ProcExp;
    dbedt_cd_pais_dest_er.ReadOnly      := Not ProcExp;
    dbedt_cd_pais_dest_ef.ReadOnly      := Not ProcExp;
    dbedt_cd_pais_origem_em.ReadOnly    := Not ProcExp;
    dbedt_cd_pais_origem_ea.ReadOnly    := Not ProcExp;
    dbedt_cd_pais_origem_er.ReadOnly    := Not ProcExp;
    dbedt_cd_pais_origem_ef.ReadOnly    := Not ProcExp;
    dbedt_cd_fronteiraExp.ReadOnly      := Not ProcExp;
    { Específicos
    if Not ProcExp then
    begin
      dbedt_vl_frete_prepaid_er.ReadOnly  := Not ProcExp;
      dbedt_vl_frete_prepaid_ef.ReadOnly  := Not ProcExp;
      dbedt_vl_frete_collect_er.ReadOnly  := Not ProcExp;
      dbedt_vl_frete_collect_ef.ReadOnly  := Not ProcExp;
    end; }

    dblckpbox_tp_frete_er.TabStop       := ProcExp;
    dblckpbox_tp_frete_ef.TabStop       := ProcExp;
    dbedt_cd_cliente.TabStop            := not dbedt_cd_cliente.ReadOnly;
//    dbedt_cd_rep.TabStop                := ProcExp; //comentado por agatha nigro 14/03
    dbedt_cd_importador_em.TabStop      := ProcExp;
    dbedt_cd_importador_ea.TabStop      := ProcExp;
    dbedt_cd_importador_er.TabStop      := ProcExp;
    dbedt_cd_importador_ef.TabStop      := ProcExp;
    dbedt_cd_moeda_mle_em.TabStop       := ProcExp;
    dbedt_cd_moeda_mle_ea.TabStop       := ProcExp;
    dbedt_cd_moeda_mle_er.TabStop       := ProcExp;
    dbedt_cd_moeda_mle_ef.TabStop       := ProcExp;
    dbedt_mle_mneg_em.TabStop           := ProcExpI;
    dbedt_mle_mneg_ea.TabStop           := ProcExpI;
    dbedt_mle_mneg_er.TabStop           := ProcExpI;
    dbedt_mle_mneg_ef.TabStop           := ProcExpI;
    dbedt_mle_mn_em.TabStop             := ProcExpI;
    dbedt_mle_mn_ea.TabStop             := ProcExpI;
    dbedt_mle_mn_er.TabStop             := ProcExpI;
    dbedt_mle_mn_ef.TabStop             := ProcExpI;
    dbedt_vl_cif_mn_em.TabStop          := ProcExpI;
    dbedt_vl_cif_mn_ea.TabStop          := ProcExpI;
    dbedt_vl_cif_mn_er.TabStop          := ProcExpI;
    dbedt_vl_cif_mn_ef.TabStop          := ProcExpI;
{    dbedt_vl_frete_prepaid_em.TabStop   := ProcExpI;
    dbedt_vl_frete_prepaid_ea.TabStop   := ProcExp; }
    dbedt_vl_frete_tnac_er.TabStop      := ProcExpI;
    dbedt_vl_frete_tnac_ef.TabStop      := ProcExpI;
    dbedt_vl_seguro_er.TabStop          := ProcExpI;
    dbedt_vl_seguro_ef.TabStop          := ProcExpI;
//    dbedt_vl_peso_bruto_em.TabStop      := ProcExpI;   //Comentado para liberar campos para edição de peso bruto e peso líquido  FERNANDA 13/01/12
//    dbedt_vl_peso_bruto_ea.TabStop      := ProcExpI;
//    dbedt_vl_peso_bruto_er.TabStop      := ProcExpI;
//    dbedt_vl_peso_bruto_ef.TabStop      := ProcExpI;
//    dbedt_vl_peso_liquido_em.TabStop    := ProcExpI;
//    dbedt_vl_peso_liquido_ea.TabStop    := ProcExpI;
//    dbedt_vl_peso_liquido_er.TabStop    := ProcExpI;
//    dbedt_vl_peso_liquido_ef.TabStop    := ProcExpI;
//    dbedt_cd_agente_em.TabStop          := ProcExp;
//    dbedt_cd_agente_ea.TabStop          := ProcExp;
    //dbedt_cd_agente_er.TabStop          := ProcExp;  // linha comentada para habilitar para todos os processos de exportação
    dbedt_cd_agente_ef.TabStop          := ProcExp;
  //dbedt_cd_local_emb_em.TabStop       := ProcExp;
  //dbedt_cd_local_emb_ea.TabStop       := ProcExp;
  //dbedt_cd_local_emb_er.TabStop       := ProcExp;
  //dbedt_cd_local_emb_ef.TabStop       := ProcExp;
//    dbedt_cd_local_transb_em.TabStop    := ProcExp;
  //dbedt_cd_local_desemb_em.TabStop    := ProcExp;
  //dbedt_cd_local_desemb_ea.TabStop    := ProcExp;
  //dbedt_cd_local_desemb_er.TabStop    := ProcExp;
  //dbedt_cd_local_desemb_ef.TabStop    := ProcExp;
  //dbedt_cd_pais_dest_em.TabStop       := ProcExp;
  //dbedt_cd_pais_dest_ea.TabStop       := ProcExp;
  //dbedt_cd_pais_dest_er.TabStop       := ProcExp;
  //dbedt_cd_pais_dest_ef.TabStop       := ProcExp;
    dbedt_cd_pais_origem_em.TabStop     := ProcExp;
    dbedt_cd_pais_origem_ea.TabStop     := ProcExp;
    dbedt_cd_pais_origem_er.TabStop     := ProcExp;
    dbedt_cd_pais_origem_ef.TabStop     := ProcExp;
    dbedt_cd_fronteiraExp.TabStop       := ProcExp;
{    // Específicos
    if Not ProcExp then
    begin
      dbedt_vl_frete_prepaid_er.TabStop := ProcExp;
      dbedt_vl_frete_prepaid_ef.TabStop := ProcExp;
      dbedt_vl_frete_collect_er.TabStop := ProcExp;
      dbedt_vl_frete_collect_ef.TabStop := ProcExp;
    end;   }

    btn_co_cliente.Enabled              := not dbedt_cd_cliente.ReadOnly;
//    btn_co_rep.Enabled                  := ProcExp; //comentado por agatha nigro 14/03/2018
    btn_co_importador_em.Enabled        := ProcExp;
    btn_co_importador_ea.Enabled        := ProcExp;
    btn_co_importador_er.Enabled        := ProcExp;
    btn_co_importador_ef.Enabled        := ProcExp;
    btn_co_moeda_mle_em.Enabled         := ProcExp;
    btn_co_moeda_mle_ea.Enabled         := ProcExp;
    btn_co_moeda_mle_ef.Enabled         := ProcExp;
    btn_co_moeda_mle_er.Enabled         := ProcExp;
//    btn_co_agente_em.Enabled            := ProcExp;
//    btn_co_agente_ea.Enabled            := ProcExp;
    //btn_co_agente_er.Enabled            := ProcExp; // linha comentada para habilitar processos que estejam na TPROCESSO_EXP
    btn_co_agente_ef.Enabled            := ProcExp;
  //btn_co_local_emb_em.Enabled         := ProcExp; // linha comentada para habilitar embarque mesmo após ter gerado o RE no myindaia  (ANDRESSA 21/10/2010)
  //btn_co_local_emb_ea.Enabled         := ProcExp; // linha comentada para habilitar embarque mesmo após ter gerado o RE no myindaia  (ANDRESSA 21/10/2010)
  //btn_co_local_emb_er.Enabled         := ProcExp; // linha comentada para habilitar embarque final mesmo após ter gerado o RE no myindaia (ANDRESSA 21/10/2010)
  //btn_co_local_emb_ef.Enabled         := ProcExp; // linha comentada para habilitar embarque final mesmo após ter gerado o RE no myindaia (ANDRESSA 21/10/2010)
  //btn_co_local_desemb_em.Enabled      := ProcExp; // linha comentada para habilitar desembarque mesmo após ter gerado o RE no myindaia (ANDRESSA 21/10/2010)
  //btn_co_local_desemb_ea.Enabled      := ProcExp; // linha comentada para habilitar desembarque mesmo após ter gerado o RE no myindaia (ANDRESSA 21/10/2010)
  //btn_co_local_desemb_er.Enabled      := ProcExp; // linha comentada para habilitar desembarque mesmo após ter gerado o RE no myindaia (ANDRESSA 21/10/2010)
  //btn_co_local_desemb_ef.Enabled      := ProcExp; // linha comentada para habilitar desembarque mesmo após ter gerado o RE no myindaia (ANDRESSA 21/10/2010)
  //btn_co_pais_dest_em.Enabled         := ProcExp; // linha comentada para habilitar destino final mesmo após ter gerado o RE no myindaia (ANDRESSA 21/10/2010)
  //btn_co_pais_dest_ea.Enabled         := ProcExp; // linha comentada para habilitar destino final mesmo após ter gerado o RE no myindaia (ANDRESSA 21/10/2010)
  //btn_co_pais_dest_er.Enabled         := ProcExp; // linha comentada para habilitar destino final mesmo após ter gerado o RE no myindaia (ANDRESSA 21/10/2010)
  //btn_co_pais_dest_ef.Enabled         := ProcExp; // linha comentada para habilitar destino final mesmo após ter gerado o RE no myindaia (ANDRESSA 21/10/2010)

   If ProcExp then
      begin
         //Deixa os Edits e DBEdits brancos      Eric  13:40h 22/02/2012
         dbedt_cd_pais_origem_em.Color      := clWindow;
         dbedt_cd_pais_origem_ea.Color      := clWindow;
         dbedt_cd_pais_origem_er.Color      := clWindow;
         dbedt_cd_pais_origem_ef.Color      := clWindow;
         dbedt_cd_local_emb_em.Color        := clWindow;
         dbedt_cd_local_emb_ea.Color        := clWindow;
         dbedt_cd_local_emb_er.Color        := clWindow;
         dbedt_cd_local_emb_ef.Color        := clWindow;
         dbedt_cd_local_desemb_em.Color     := clWindow;
         dbedt_cd_local_desemb_ea.Color     := clWindow;
         dbedt_cd_local_desemb_er.Color     := clWindow;
         dbedt_cd_local_desemb_ef.Color     := clWindow;
         dbedt_cd_pais_dest_em.Color        := clWindow;
         dbedt_cd_pais_dest_ea.Color        := clWindow;
         dbedt_cd_pais_dest_er.Color        := clWindow;
         dbedt_cd_pais_dest_ef.Color        := clWindow;
         dbedt_cd_moeda_mle_em.Color        := clWindow;
         dbedt_cd_moeda_mle_ea.Color        := clWindow;
         dbedt_cd_moeda_mle_er.Color        := clWindow;
         dbedt_cd_moeda_mle_ef.Color        := clWindow;
         dbedt_cd_agente_em.Color           := clWindow;
         dbedt_cd_agente_ea.Color           := clWindow;
         dbedt_cd_agente_er.Color           := clWindow;
         dbedt_cd_agente_ef.Color           := clWindow;
         dbedt_vl_frete_prepaid_em.Color    := clWindow;
         dbedt_vl_frete_prepaid_ea.Color    := clWindow;
         dbedt_vl_frete_prepaid_er.Color    := clWindow;
         dbedt_vl_frete_prepaid_ef.Color    := clWindow;
         dbedt_mle_mneg_em.Color            := clWindow;
         dbedt_mle_mneg_ea.Color            := clWindow;
         dbedt_mle_mneg_er.Color            := clWindow;
         dbedt_mle_mneg_ef.Color            := clWindow;
         dbedt_mle_mn_em.Color              := clWindow;
         dbedt_mle_mn_ea.Color              := clWindow;
         dbedt_mle_mn_er.Color              := clWindow;
         dbedt_mle_mn_ef.Color              := clWindow;
         dbedt_cd_lingua.Color              := clWindow;
         dbedt_vl_cif_mn_em.Color           := clWindow;
         dbedt_vl_cif_mn_ea.Color           := clWindow;
         dbedt_vl_cif_mn_er.Color           := clWindow;
         dbedt_vl_cif_mn_ef.Color           := clWindow;
         dbedt_vl_peso_bruto_em.Color       := clWindow;
         dbedt_vl_peso_bruto_ea.Color       := clWindow;
         dbedt_vl_peso_bruto_er.Color       := clWindow;
         dbedt_vl_peso_bruto_ef.Color       := clWindow;
         dbedt_vl_peso_liquido_em.Color     := clWindow;
         dbedt_vl_peso_liquido_ea.Color     := clWindow;
         dbedt_vl_peso_liquido_er.Color     := clWindow;
         dbedt_vl_peso_liquido_er.Color     := clWindow;
         dbedt_cd_importador_em.Color       := clWindow;
         dbedt_cd_importador_ea.Color       := clWindow;
         dbedt_cd_importador_er.Color       := clWindow;
         dbedt_cd_importador_ef.Color       := clWindow;
         dbedt_cd_moeda_frete_em.Color      := clWindow;
         dbedt_cd_moeda_frete_ea.Color      := clWindow;
         dbedt_cd_moeda_frete_er.Color      := clWindow;
         dbedt_cd_moeda_frete_ef.Color      := clWindow;
         dbedt_cd_incoterm_m.Color          := clWindow;
         dbedt_cd_incoterm_a.Color          := clWindow;
         dbedt_cd_incoterm_r.Color          := clWindow;
         dbedt_cd_incoterm_f.Color          := clWindow;
   end
   else begin
         //Deixa os Edits e DBEdits cinzas      Eric  13:40h 22/02/2012
         dbedt_cd_pais_origem_em.Color      := clMenu;
         dbedt_cd_pais_origem_ea.Color      := clMenu;
         dbedt_cd_pais_origem_er.Color      := clMenu;
         dbedt_cd_pais_origem_ef.Color      := clMenu;
         dbedt_cd_local_emb_em.Color        := clMenu;
         dbedt_cd_local_emb_ea.Color        := clMenu;
         dbedt_cd_local_emb_er.Color        := clMenu;
         dbedt_cd_local_emb_ef.Color        := clMenu;
         dbedt_cd_local_desemb_em.Color     := clMenu;
         dbedt_cd_local_desemb_ea.Color     := clMenu;
         dbedt_cd_local_desemb_er.Color     := clMenu;
         dbedt_cd_local_desemb_ef.Color     := clMenu;
         dbedt_cd_pais_dest_em.Color        := clMenu;
         dbedt_cd_pais_dest_ea.Color        := clMenu;
         dbedt_cd_pais_dest_er.Color        := clMenu;
         dbedt_cd_pais_dest_ef.Color        := clMenu;
         dbedt_cd_moeda_mle_em.Color        := clMenu;
         dbedt_cd_moeda_mle_ea.Color        := clMenu;
         dbedt_cd_moeda_mle_er.Color        := clMenu;
         dbedt_cd_moeda_mle_ef.Color        := clMenu;
         dbedt_cd_agente_em.Color           := clMenu;
         dbedt_cd_agente_ea.Color           := clMenu;
         dbedt_cd_agente_er.Color           := clMenu;
         dbedt_cd_agente_ef.Color           := clMenu;
         dbedt_vl_frete_prepaid_em.Color    := clMenu;
         dbedt_vl_frete_prepaid_ea.Color    := clMenu;
         dbedt_vl_frete_prepaid_er.Color    := clMenu;
         dbedt_vl_frete_prepaid_ef.Color    := clMenu;
         dbedt_mle_mneg_em.Color            := clMenu;
         dbedt_mle_mneg_ea.Color            := clMenu;
         dbedt_mle_mneg_er.Color            := clMenu;
         dbedt_mle_mneg_ef.Color            := clMenu;
         dbedt_mle_mn_em.Color              := clMenu;
         dbedt_mle_mn_ea.Color              := clMenu;
         dbedt_mle_mn_er.Color              := clMenu;
         dbedt_mle_mn_ef.Color              := clMenu;
         dbedt_cd_lingua.Color              := clMenu;
         dbedt_vl_cif_mn_em.Color           := clMenu;
         dbedt_vl_cif_mn_ea.Color           := clMenu;
         dbedt_vl_cif_mn_er.Color           := clMenu;
         dbedt_vl_cif_mn_ef.Color           := clMenu;
         dbedt_vl_peso_bruto_em.Color       := clMenu;
         dbedt_vl_peso_bruto_ea.Color       := clMenu;
         dbedt_vl_peso_bruto_er.Color       := clMenu;
         dbedt_vl_peso_bruto_ef.Color       := clMenu;
         dbedt_vl_peso_liquido_em.Color     := clMenu;
         dbedt_vl_peso_liquido_ea.Color     := clMenu;
         dbedt_vl_peso_liquido_er.Color     := clMenu;
         dbedt_vl_peso_liquido_er.Color     := clMenu;
         dbedt_cd_importador_em.Color       := clMenu;
         dbedt_cd_importador_ea.Color       := clMenu;
         dbedt_cd_importador_er.Color       := clMenu;
         dbedt_cd_importador_ef.Color       := clMenu;
         dbedt_cd_moeda_frete_em.Color      := clMenu;
         dbedt_cd_moeda_frete_ea.Color      := clMenu;
         dbedt_cd_moeda_frete_er.Color      := clMenu;
         dbedt_cd_moeda_frete_ef.Color      := clMenu;

         dbedt_cd_incoterm_m.Color          := clMenu;
         dbedt_cd_incoterm_a.Color          := clMenu;
         dbedt_cd_incoterm_r.Color          := clMenu;
         dbedt_cd_incoterm_f.Color          := clMenu;

   end;

   //Desabilitando Edits e DBEdits       Eric   13:40h 22/02/2012
   dbedt_cd_pais_origem_em.Enabled    := ProcExp;
   dbedt_cd_pais_origem_ea.Enabled    := ProcExp;
   dbedt_cd_pais_origem_er.Enabled    := ProcExp;
   dbedt_cd_pais_origem_ef.Enabled    := ProcExp;
   dbedt_cd_local_emb_em.Enabled      := ProcExp;
   dbedt_cd_local_emb_ea.Enabled      := ProcExp;
   dbedt_cd_local_emb_er.Enabled      := ProcExp;
   dbedt_cd_local_emb_ef.Enabled      := ProcExp;
   dbedt_cd_local_desemb_em.Enabled   := ProcExp;
   dbedt_cd_local_desemb_ea.Enabled   := ProcExp;
   dbedt_cd_local_desemb_er.Enabled   := ProcExp;
   dbedt_cd_local_desemb_ef.Enabled   := ProcExp;
   dbedt_cd_pais_dest_em.Enabled      := ProcExp;
   dbedt_cd_pais_dest_ea.Enabled      := ProcExp;
   dbedt_cd_pais_dest_er.Enabled      := ProcExp;
   dbedt_cd_pais_dest_ef.Enabled      := ProcExp;
   dbedt_cd_moeda_mle_em.Enabled      := ProcExp;
   dbedt_cd_moeda_mle_ea.Enabled      := ProcExp;
   dbedt_cd_moeda_mle_er.Enabled      := ProcExp;
   dbedt_cd_moeda_mle_ef.Enabled      := ProcExp;
   dbedt_cd_agente_em.Enabled         := ProcExp;
   dbedt_cd_agente_ea.Enabled         := ProcExp;
   dbedt_cd_agente_er.Enabled         := ProcExp;
   dbedt_cd_agente_ef.Enabled         := ProcExp;
   dbedt_vl_frete_prepaid_em.Enabled  := ProcExp;
   dbedt_vl_frete_prepaid_ea.Enabled  := ProcExp;
   dbedt_vl_frete_prepaid_er.Enabled  := ProcExp;
   dbedt_vl_frete_prepaid_ef.Enabled  := ProcExp;
   dbedt_mle_mneg_em.Enabled          := ProcExp;
   dbedt_mle_mneg_ea.Enabled          := ProcExp;
   dbedt_mle_mneg_er.Enabled          := ProcExp;
   dbedt_mle_mneg_ef.Enabled          := ProcExp;
   dbedt_mle_mn_em.Enabled            := ProcExp;
   dbedt_mle_mn_ea.Enabled            := ProcExp;
   dbedt_mle_mn_er.Enabled            := ProcExp;
   dbedt_mle_mn_ef.Enabled            := ProcExp;
   dbedt_vl_cif_mn_em.Enabled         := ProcExp;
   dbedt_vl_cif_mn_ea.Enabled         := ProcExp;
   dbedt_vl_cif_mn_er.Enabled         := ProcExp;
   dbedt_vl_cif_mn_ef.Enabled         := ProcExp;
   dbedt_vl_peso_bruto_em.Enabled     := ProcExp;
   dbedt_vl_peso_bruto_ea.Enabled     := ProcExp;
   dbedt_vl_peso_bruto_er.Enabled     := ProcExp;
   dbedt_vl_peso_bruto_ef.Enabled     := ProcExp;
   dbedt_vl_peso_liquido_em.Enabled   := ProcExp;
   dbedt_vl_peso_liquido_ea.Enabled   := ProcExp;
   dbedt_vl_peso_liquido_er.Enabled   := ProcExp;
   dbedt_vl_peso_liquido_ef.Enabled   := ProcExp;
   dbedt_cd_importador_em.Enabled     := ProcExp;
   dbedt_cd_importador_ea.Enabled     := ProcExp;
   dbedt_cd_importador_er.Enabled     := ProcExp;
   dbedt_cd_importador_ef.Enabled     := ProcExp;
   dbedt_cd_moeda_frete_em.Enabled    := ProcExp;
   dbedt_cd_moeda_frete_ea.Enabled    := ProcExp;
   dbedt_cd_moeda_frete_er.Enabled    := ProcExp;
   dbedt_cd_moeda_frete_ef.Enabled    := ProcExp;
   dbedt_cd_incoterm_a.Enabled        := ProcExp;
   dbedt_cd_incoterm_m.Enabled        := ProcExp;
   dbedt_cd_incoterm_r.Enabled        := ProcExp;
   dbedt_cd_incoterm_f.Enabled        := ProcExp;
   dbedt_cd_lingua.Enabled            := ProcExp;

   //Desabilitando Speedbuttons          Eric   13:40h 22/02/2012
   btn_co_local_emb_em.Enabled        := ProcExp;
   btn_co_local_emb_ea.Enabled        := ProcExp;
   btn_co_local_emb_er.Enabled        := ProcExp;
   btn_co_local_emb_ef.Enabled        := ProcExp;
   btn_co_moeda_frete_em.Enabled      := ProcExp;
   btn_co_moeda_frete_ef.Enabled      := ProcExp;
   btn_co_moeda_frete_ea.Enabled      := ProcExp;
   btn_co_moeda_frete_er.Enabled      := ProcExp;
   btn_co_local_desemb_em.Enabled     := ProcExp;
   btn_co_local_desemb_ea.Enabled     := ProcExp;
   btn_co_local_desemb_ef.Enabled     := ProcExp;
   btn_co_local_desemb_er.Enabled     := ProcExp;
   btn_co_agente_em.Enabled           := ProcExp;
   btn_co_agente_ea.Enabled           := ProcExp;
   btn_co_agente_er.Enabled           := ProcExp;
   btn_co_agente_ef.Enabled           := ProcExp;
   btn_co_lingua.Enabled              := ProcExp;
   btn_co_pais_origem_em.Enabled      := ProcExp;
   btn_co_pais_origem_ea.Enabled      := ProcExp;
   btn_co_pais_origem_er.Enabled      := ProcExp;
   btn_co_pais_origem_ef.Enabled      := ProcExp;
   btn_co_pais_dest_em.Enabled        := ProcExp;
   btn_co_pais_dest_ea.Enabled        := ProcExp;
   btn_co_pais_dest_er.Enabled        := ProcExp;
   btn_co_pais_dest_ef.Enabled        := ProcExp;

  { //Deixa os Edits e DBEdits cinzas      Eric  13:40h 22/02/2012
   dbedt_cd_pais_origem_em.Color      := clMenu;
   dbedt_cd_pais_origem_ea.Color      := clMenu;
   dbedt_cd_pais_origem_er.Color      := clMenu;
   dbedt_cd_pais_origem_ef.Color      := clMenu;
   dbedt_cd_local_emb_em.Color        := clMenu;
   dbedt_cd_local_emb_ea.Color        := clMenu;
   dbedt_cd_local_emb_er.Color        := clMenu;
   dbedt_cd_local_emb_ef.Color        := clMenu;
   dbedt_cd_local_desemb_em.Color     := clMenu;
   dbedt_cd_local_desemb_ea.Color     := clMenu;
   dbedt_cd_local_desemb_er.Color     := clMenu;
   dbedt_cd_local_desemb_ef.Color     := clMenu;
   dbedt_cd_pais_dest_em.Color        := clMenu;
   dbedt_cd_pais_dest_ea.Color        := clMenu;
   dbedt_cd_pais_dest_er.Color        := clMenu;
   dbedt_cd_pais_dest_ef.Color        := clMenu;
   dbedt_cd_moeda_mle_em.Color        := clMenu;
   dbedt_cd_moeda_mle_ea.Color        := clMenu;
   dbedt_cd_moeda_mle_er.Color        := clMenu;
   dbedt_cd_moeda_mle_ef.Color        := clMenu;
   dbedt_cd_agente_em.Color           := clMenu;
   dbedt_cd_agente_ea.Color           := clMenu;
   dbedt_cd_agente_er.Color           := clMenu;
   dbedt_cd_agente_ef.Color           := clMenu;
   dbedt_vl_frete_prepaid_em.Color    := clMenu;
   dbedt_vl_frete_prepaid_ea.Color    := clMenu;
   dbedt_vl_frete_prepaid_er.Color    := clMenu;
   dbedt_vl_frete_prepaid_ef.Color    := clMenu;
   dbedt_mle_mneg_em.Color            := clMenu;
   dbedt_mle_mneg_ea.Color            := clMenu;
   dbedt_mle_mneg_er.Color            := clMenu;
   dbedt_mle_mneg_ef.Color            := clMenu;
   dbedt_mle_mn_em.Color              := clMenu;
   dbedt_mle_mn_ea.Color              := clMenu;
   dbedt_mle_mn_er.Color              := clMenu;
   dbedt_mle_mn_ef.Color              := clMenu;
   dbedt_cd_lingua.Color              := clMenu;
   dbedt_vl_cif_mn_em.Color           := clMenu;
   dbedt_vl_cif_mn_ea.Color           := clMenu;
   dbedt_vl_cif_mn_er.Color           := clMenu;
   dbedt_vl_cif_mn_ef.Color           := clMenu;
   dbedt_vl_peso_bruto_em.Color       := clMenu;
   dbedt_vl_peso_bruto_ea.Color       := clMenu;
   dbedt_vl_peso_bruto_er.Color       := clMenu;
   dbedt_vl_peso_bruto_ef.Color       := clMenu;
   dbedt_vl_peso_liquido_em.Color     := clMenu;
   dbedt_vl_peso_liquido_ea.Color     := clMenu;
   dbedt_vl_peso_liquido_er.Color     := clMenu;
   dbedt_vl_peso_liquido_er.Color     := clMenu;
   dbedt_cd_importador_em.Color       := clMenu;
   dbedt_cd_importador_ea.Color       := clMenu;
   dbedt_cd_importador_er.Color       := clMenu;
   dbedt_cd_importador_ef.Color       := clMenu;
   dbedt_cd_moeda_frete_em.Color      := clMenu;
   dbedt_cd_moeda_frete_ea.Color      := clMenu;
   dbedt_cd_moeda_frete_er.Color      := clMenu;
   dbedt_cd_moeda_frete_ef.Color      := clMenu;
   dbedt_cd_incoterm.Color            := clMenu; }

   // btn_co_consignatario.Enabled      := ProcExp; //linha comentada para habilitar botão escolha consignatario andressa 25/10/2010
  //btn_co_despachante_exp.Enabled      := ProcExp;    by carlos em 16/04/2010

   if ProcExpI then
   begin
      dbedt_mle_mneg_em.Color           := clWindow;
      dbedt_mle_mneg_ea.Color           := clWindow;
      dbedt_mle_mneg_er.Color           := clWindow;
      dbedt_mle_mneg_ef.Color           := clWindow;
      dbedt_mle_mn_em.Color             := clWindow;
      dbedt_mle_mn_ea.Color             := clWindow;
      dbedt_mle_mn_er.Color             := clWindow;
      dbedt_mle_mn_ef.Color             := clWindow;
      dbedt_vl_cif_mn_em.Color          := clWindow;
      dbedt_vl_cif_mn_ea.Color          := clWindow;
      dbedt_vl_cif_mn_er.Color          := clWindow;
      dbedt_vl_cif_mn_ef.Color          := clWindow;
{      dbedt_vl_frete_prepaid_em.Color   := clWindow;
      dbedt_vl_frete_prepaid_ea.Color   := clWindow; }
      dbedt_vl_frete_tnac_er.Color      := clWindow;
      dbedt_vl_frete_tnac_ef.Color      := clWindow;
      dbedt_vl_seguro_er.Color          := clWindow;
      dbedt_vl_seguro_ef.Color          := clWindow;
//      dbedt_vl_peso_bruto_em.Color      := clWindow;    //Comentado para liberar campos para edição de peso bruto e peso líquido  FERNANDA 13/01/12
      dbedt_vl_peso_bruto_ea.Color      := clWindow;
      dbedt_vl_peso_bruto_er.Color      := clWindow;                           
      dbedt_vl_peso_bruto_ef.Color      := clWindow;
//      dbedt_vl_peso_liquido_em.Color    := clWindow;
      dbedt_vl_peso_liquido_ea.Color    := clWindow;
      dbedt_vl_peso_liquido_er.Color    := clWindow;
      dbedt_vl_peso_liquido_ef.Color    := clWindow;
    end else begin
      dbedt_mle_mneg_em.Color           := clMenu;
      dbedt_mle_mneg_ea.Color           := clMenu;
      dbedt_mle_mneg_er.Color           := clMenu;
      dbedt_mle_mneg_ef.Color           := clMenu;
      dbedt_mle_mn_em.Color             := clMenu;
      dbedt_mle_mn_ea.Color             := clMenu;
      dbedt_mle_mn_er.Color             := clMenu;
      dbedt_mle_mn_ef.Color             := clMenu;
      dbedt_vl_cif_mn_em.Color          := clMenu;
      dbedt_vl_cif_mn_ea.Color          := clMenu;
      dbedt_vl_cif_mn_er.Color          := clMenu;
      dbedt_vl_cif_mn_ef.Color          := clMenu;
{      dbedt_vl_frete_prepaid_em.Color   := clMenu;
      dbedt_vl_frete_prepaid_ea.Color   := clMenu;
      dbedt_vl_frete_prepaid_er.Color   := clMenu;
      dbedt_vl_frete_prepaid_ef.Color   := clMenu;
      dbedt_vl_frete_collect_er.Color   := clMenu;
      dbedt_vl_frete_collect_ef.Color   := clMenu; }
      dbedt_vl_frete_tnac_er.Color      := clMenu;
      dbedt_vl_frete_tnac_ef.Color      := clMenu;
//      dbedt_vl_peso_bruto_em.Color      := clMenu;   //Comentado para liberar campos para edição de peso bruto e peso líquido  FERNANDA 13/01/12
//      dbedt_vl_peso_bruto_ea.Color      := clMenu;
//      dbedt_vl_peso_bruto_er.Color      := clMenu;
//      dbedt_vl_peso_bruto_ef.Color      := clMenu;
//      dbedt_vl_peso_liquido_em.Color    := clMenu;
//      dbedt_vl_peso_liquido_ea.Color    := clMenu;
//      dbedt_vl_peso_liquido_er.Color    := clMenu;
//      dbedt_vl_peso_liquido_ef.Color    := clMenu;
      dbedt_vl_seguro_er.Color          := clMenu;
      dbedt_vl_seguro_ef.Color          := clMenu;
    end;

    dbedt_cd_rep.Color                  := clWindow; //add por agatha nigro 14/03/2018
    if ProcExp then
    begin
      dblckpbox_tp_frete_er.Color       := clWindow;
      dblckpbox_tp_frete_ef.Color       := clWindow;
      dbedt_cd_cliente.Color            := clWindow;
//      dbedt_cd_rep.Color                := clWindow;  //comentado por agatha nigro 14/03/2018
      dbedt_cd_importador_em.Color      := clWindow;
      dbedt_cd_importador_ea.Color      := clWindow;
      dbedt_cd_importador_er.Color      := clWindow;
      dbedt_cd_importador_ef.Color      := clWindow;
      dbedt_cd_moeda_mle_em.Color       := clWindow;
      dbedt_cd_moeda_mle_ea.Color       := clWindow;
      dbedt_cd_moeda_mle_er.Color       := clWindow;
      dbedt_cd_moeda_mle_ef.Color       := clWindow;
//      dbedt_cd_agente_em.Color          := clWindow;
//      dbedt_cd_agente_ea.Color          := clWindow;
      //dbedt_cd_agente_er.Color          := clWindow;  // linha comentada para habilitar para todos os processos de exportação
      dbedt_cd_agente_ef.Color          := clWindow;
      dbedt_cd_local_emb_em.Color       := clWindow;
      dbedt_cd_local_emb_ea.Color       := clWindow;
      dbedt_cd_local_emb_er.Color       := clWindow;
      dbedt_cd_local_emb_ef.Color       := clWindow;
//      dbedt_cd_local_transb_em.Color    := clWindow;
      dbedt_cd_local_desemb_em.Color    := clWindow;
      dbedt_cd_local_desemb_ea.Color    := clWindow;
      dbedt_cd_local_desemb_er.Color    := clWindow;
      dbedt_cd_local_desemb_ef.Color    := clWindow;
      dbedt_cd_pais_dest_em.Color       := clWindow;
      dbedt_cd_pais_dest_ea.Color       := clWindow;
      dbedt_cd_pais_dest_er.Color       := clWindow;
      dbedt_cd_pais_dest_ef.Color       := clWindow;
      dbedt_cd_pais_origem_em.Color     := clWindow;
      dbedt_cd_pais_origem_ea.Color     := clWindow;
      dbedt_cd_pais_origem_er.Color     := clWindow;
      dbedt_cd_pais_origem_ef.Color     := clWindow;
      dbedt_cd_fronteiraExp.Color      := clWindow;
      dblkcbox_consignatario.Color     := clWindow;
      dbedt_cd_consignatario.Color     := clWindow;

    end
    else
    begin
      dblckpbox_tp_frete_er.Color       := clMenu;
      dblckpbox_tp_frete_ef.Color       := clMenu;
      dbedt_cd_cliente.Color            := clMenu;
//      dbedt_cd_rep.Color                := clMenu; //comentado por agatha nigro 14/03/2018
      dbedt_cd_importador_em.Color      := clMenu;
      dbedt_cd_importador_ea.Color      := clMenu;
      dbedt_cd_importador_er.Color      := clMenu;
      dbedt_cd_importador_ef.Color      := clMenu;
      dbedt_cd_moeda_mle_em.Color       := clMenu;
      dbedt_cd_moeda_mle_ea.Color       := clMenu;
      dbedt_cd_moeda_mle_er.Color       := clMenu;
      dbedt_cd_moeda_mle_ef.Color       := clMenu;
//      dbedt_cd_agente_em.Color          := clMenu;
//      dbedt_cd_agente_ea.Color          := clMenu;
      //dbedt_cd_agente_er.Color          := clMenu;  // linha comentada para habilitar para todos os processos de exportação
      dbedt_cd_agente_ef.Color          := clMenu;
     //dbedt_cd_local_emb_em.Color       := clMenu;
    //dbedt_cd_local_emb_ea.Color       := clMenu;
    //dbedt_cd_local_emb_er.Color       := clMenu;
    //dbedt_cd_local_emb_ef.Color       := clMenu;
//      dbedt_cd_local_transb_em.Color    := clMenu;
    //dbedt_cd_local_desemb_em.Color    := clMenu;
    //dbedt_cd_local_desemb_ea.Color    := clMenu;
    //dbedt_cd_local_desemb_er.Color    := clMenu;
    //dbedt_cd_local_desemb_ef.Color    := clMenu;
    //dbedt_cd_pais_dest_em.Color       := clMenu;
    //dbedt_cd_pais_dest_ea.Color       := clMenu;
    //dbedt_cd_pais_dest_er.Color       := clMenu;
    //dbedt_cd_pais_dest_ef.Color       := clMenu;
      dbedt_cd_pais_origem_em.Color     := clMenu;
      dbedt_cd_pais_origem_ea.Color     := clMenu;
      dbedt_cd_pais_origem_er.Color     := clMenu;
      dbedt_cd_pais_origem_ef.Color     := clMenu;
      dbedt_cd_fronteiraExp.Color       := clMenu;
      //dblkcbox_consignatario.Color      := clMenu;
      //dbedt_cd_consignatario.Color      := clMenu;

    end;
  end;
end;

procedure Tfrm_manut_proc.dbedt_nf_iniExit(Sender: TObject);
begin
  with datm_manut_proc do
  begin
    if qry_dde_nf_.State in [dsEdit, dsInsert] then
    begin
//      if (Trim(dbedt_nf_ini.Text) <> '') and (Trim( dbedt_nf_fim.Text) = '') then
  //      qry_dde_nf_NR_NF_FIM.AsString := dbedt_nf_ini.Text;
    end;
  end;
end;

procedure Tfrm_manut_proc.dbedt_nr_reChange(Sender: TObject);
begin
  if Not lAbertura then
    if ( datm_manut_proc.qry_processo_re_.State in [ dsInsert, dsEdit ] ) then btn_mi(False, True, True, False);
end;

procedure Tfrm_manut_proc.dbedt_nf_iniChange(Sender: TObject);
begin
  if Not lAbertura then
    if ( datm_manut_proc.qry_dde_nf_.State in [ dsInsert, dsEdit ] ) then btn_mi(False, True, True, False);
end;

procedure Tfrm_manut_proc.btn_co_despachante_impClick(Sender: TObject);
begin
  if Not lAbertura then Edita;
  if Sender is TSpeedButton then
  begin
    if not PoeEmEdicao(datm_manut_proc.qry_processo_) then exit;
    If (Sender as TSpeedButton).Enabled Then
      datm_manut_proc.qry_processo_CD_DESPACHANTE.AsString := ConsultaOnLineEx('TDESPACHANTE','Despachantes',['CD_DESPACHANTE','NM_DESPACHANTE'],['Código','Nome'],'CD_DESPACHANTE',frm_main.mi_cad_desp,1, dbedt_cd_despachante_imp.text)
  end
  else
    dbedt_nm_despachante_imp.Text := ConsultaLookUP('TDESPACHANTE','CD_DESPACHANTE',dbedt_cd_despachante_imp.Text,'NM_DESPACHANTE');
end;

procedure Tfrm_manut_proc.pgctrl_despacho_impChange(Sender: TObject);
begin
  with datm_manut_proc do
  begin
    if ( pgctrl_despacho_imp.ActivePage = ts_doctos_imp )   then dbnvg.DataSource := ds_Doctos_Inst;
    if ( pgctrl_despacho_imp.ActivePage = ts_contr_imp)     then dbnvg.DataSource := ds_contr_imp;
    if ( pgctrl_despacho_imp.ActivePage = ts_armazenagem )  then dbnvg.DataSource := ds_processo_armazenagem;
    if ( pgctrl_despacho_imp.ActivePage = ts_Retificacoes)  then dbnvg.DataSource := dtsRetificaDi;
    if ( pgctrl_despacho_imp.ActivePage = ts_exportador)    then dbnvg.DataSource := ds_exportador;
    if ( pgctrl_despacho_imp.ActivePage = ts_fabricante)    then dbnvg.DataSource := ds_fabricante;

    btn_mi(pgctrl_despacho_imp.ActivePage = ts_Retificacoes, False, False, pgctrl_despacho_imp.ActivePage = ts_Retificacoes);

    if not qry_existe_di_.Active then
      qry_existe_di_.Open;
    if not  qry_tp_dta_.Active then
      qry_tp_dta_.Open;
    if not  qry_existe_da_.Active then
      qry_existe_da_.Open;

    if pgctrl_despacho_imp.ActivePage = ts_fabricante then
    begin
      btn_mi( st_incluir, False, False, st_excluir );
    end
    else
    if pgctrl_despacho_imp.ActivePage = ts_exportador then
    begin
      if ((qry_existe_di_EXISTEDI.AsInteger > 0) and (Trim(qry_existe_di_NR_DECLARACAO_IMP.AsString) <> '')) then
      begin
        btn_mi( False, False, False, False );
        //qry_exportador_.Close;
        //qry_exportador_.ParamByName('NR_PROCESSO').AsString :=  qry_processo_NR_PROCESSO.AsString;
        //qry_exportador_.Open;
      end
      else
        btn_mi( st_incluir, False, False, st_excluir );
    end
    else
    begin
      if (qry_existe_di_EXISTEDI.AsInteger > 0) or (qry_existe_da_EXISTEDA.AsInteger > 0) then
        btn_mi( False, False, False, False )
      else
        btn_mi( st_incluir, False, False, st_excluir );
    end;
  end;
end;

procedure Tfrm_manut_proc.dbedt_nr_liChange(Sender: TObject);
begin
  AlterarLi(Sender);
end;

procedure Tfrm_manut_proc.AlterarLi(Sender: TObject);
var
  vNrLI : String;
begin
  vNrLIAtual := dbedt_nr_li.Text;

  if Not lAbertura then
  begin
    if ( datm_manut_proc.qry_li_.State in [ dsInsert, dsEdit ] ) then
      btn_mi(False, True, True, False);
//    lbl_nr_li_subst.Visible   := ( ( datm_manut_proc.qry_li_IN_SUBSTITUIDA.AsString = '1' ) or ( dbck_in_subst.Checked ) );
//    dbedt_nr_li_subst.Visible := lbl_nr_li_subst.Visible;
//    cbx_nr_li_subst.Visible   := lbl_nr_li_subst.Visible;
    if Sender = cbx_nr_li_subst then
    begin
      datm_manut_proc.qry_li_.Edit;
      vNrLI := Copy(cbx_nr_li_subst.Text, 1, 2) + Copy(cbx_nr_li_subst.Text, 4, 7) + Copy(cbx_nr_li_subst.Text, 12, 1);
      dbedt_nr_li_subst.Text := vNrLI;
    end;
  end;
end;

procedure Tfrm_manut_proc.btn_co_processoClick(Sender: TObject);
var
  vListAux : TStringList;
begin
  vListAux := TStringList.Create;
  vListAux.Add('SELECT SUBSTRING(PR.NR_PROCESSO,5,13) NR_PROCESSO, PR.CD_SERVICO, EN.NM_EMPRESA, EN.AP_EMPRESA, EN.CGC_EMPRESA, DT_ABERTURA ');
  vListAux.Add('FROM TPROCESSO PR ( NOLOCK ) ');
  vListAux.Add('  INNER JOIN TEMPRESA_NAC EN ( NOLOCK ) ON EN.CD_EMPRESA = PR.CD_CLIENTE');
  vListAux.Add('WHERE CD_PRODUTO  = ''' + msk_cd_produto.Text  + '''');
  vListAux.Add('  AND CD_UNID_NEG = ''' + msk_cd_unid_neg.Text + '''');
  vListAux.Add('  AND PR.IN_CANCELADO = ''0''');
  if chkProcessos.Checked then
    vListAux.Add('  AND DT_ABERTURA > GETDATE() - ' + IntToStr(vQtdeDiasConsProc));
  msk_nr_processo.Text := ConsultaOnLineExSQLList(vListAux,'Processos',['NR_PROCESSO', 'CD_SERVICO', 'NM_EMPRESA', 'AP_EMPRESA', 'CGC_EMPRESA', 'DT_ABERTURA'],['Processo', 'Serviço', 'Cliente', 'Apelido', 'CNPJ', 'Data de Abertura'],'NR_PROCESSO',nil, msk_nr_processo.Text);
  msk_nr_processoExit(msk_nr_processo);  
  vListAux.Free;
end;

procedure Tfrm_manut_proc.msk_nr_processoExit(Sender: TObject);
begin      
  dbedt_cd_consignatario.Text := '';
  edt_nm_consignatario.Text   := '';

  label35.Visible      := True;
  dbedt_nr_di.Visible  := True;
  lbl_nr_da_im.Left    := 146;
  dbedt_nr_da.Left     := 146;
  dbedt_nr_da.ReadOnly := False;
  dbedt_nr_da.Color    := clWindow;
  dbedt_nr_da.TabStop  := True;

  if Trim( msk_nr_processo.Text ) <> '' then
  begin
   {tag 999 significa que o usuario digitou um processo }
    datm_manut_proc.qry_processo_.tag := 999;

    if VerProcesso then
    begin
      str_nr_processo := Trim( msk_cd_unid_neg.Text ) + Trim( msk_cd_produto.Text ) + Trim( msk_nr_processo.Text );
      msk_nr_free_time.Text := '';
      vClientePreenchido := datm_manut_proc.qry_processo_CD_CLIENTE.AsString;

      ConfigurarTelaProcessoCarregado;
    end;
  end;
end;

procedure Tfrm_manut_proc.ConfigurarTelaProcessoCarregado;
begin
  with datm_manut_proc do
  begin
    lbl_NF_NR_DOCUMENTO.Visible := SameText(qry_processo_CD_GRUPO.AsString, 'B40');
    dbedt_NF_NR_DOCUMENTO.Visible := lbl_NF_NR_DOCUMENTO.Visible;

    pnlLeadTimeM.Visible := qry_processo_CD_GRUPO.AsString = '155';
    pnlLeadTimeM.Visible := pnlLeadTimeM.Visible;
    pnlLeadTimeM.Visible := pnlLeadTimeM.Visible;
    pnlLeadTimeM.Visible := pnlLeadTimeM.Visible;

    ConfiguraBotaoSDA;
  end;

  dbchkIN_TRANSMITE_SEM_PREVISAO.Visible := ConsultaLookUP('TCARGO', 'CD_CARGO', str_cd_cargo, 'IN_LIBERA_TRANSMISSAO_DI') = '1';

  btn_cd_unid_medida_imClick(dbedt_CD_UNID_MEDIDA_im);
  btn_cd_unid_medida_imClick(dbedt_CD_UNID_MEDIDA_ia);
  btn_cd_unid_medida_imClick(dbedt_CD_UNID_MEDIDA_ir);
  btn_cd_unid_medida_imClick(dbedt_CD_UNID_MEDIDA_if);
  btn_cd_moeda_mle_imClick(dbedt_CD_MOEDA_MLE_im);
  btn_cd_moeda_mle_imClick(dbedt_CD_MOEDA_MLE_ia);
  btn_cd_moeda_mle_imClick(dbedt_CD_MOEDA_MLE_ir);
  btn_cd_moeda_mle_imClick(dbedt_CD_MOEDA_MLE_if);

  // Inibe Agente aba Dados Básicos - Solic. por Maurício - NVOCC - 10/02/2005
  lbl_tp_banco_em.Visible        := Not(msk_cd_produto.text = '10');
  dblckpbox_tp_banco_em.Visible  := lbl_tp_banco_em.Visible;
  lbl_banco_em.Visible           := lbl_tp_banco_em.Visible;
  dbedt_cd_banco_em.Visible      := lbl_tp_banco_em.Visible;
  dbedt_nm_banco_em.Visible      := lbl_tp_banco_em.Visible;
  btn_co_banco_em.Visible        := lbl_tp_banco_em.Visible;

  VerificaProcessoFaturado;

  pnlLocalEntregaCntr.Visible       := (msk_cd_produto.Text = '01') and (datm_manut_proc.qry_processo_CD_GRUPO.AsString = 'B40');
  pnlLocalEntregaCargaSolta.Visible := pnlLocalEntregaCntr.Visible;

  // inibe campos no caso de ser exportação.
  if (Trim(msk_cd_produto.Text) = '02') or (Trim(msk_cd_produto.Text) = '10') then
  begin
    dbgrdImo.Visible                     := False;
    lblImo.Visible                       := False;
    dbgrd_cntr.Columns[1].Visible        := False;   // Ocultados a pedido de Maria Cristina - Michel - 28/10/2008
    dbgrd_cntr.Columns[2].Visible        := False;   // Ocultados a pedido de Maria Cristina - Michel - 28/10/2008
    dbgrd_cntr.Columns[3].Visible        := False;
    dbgrd_cntr.Columns[4].Visible        := False;
    dbgrd_cntr.Columns[5].Visible        := False;
    dbgrd_cntr.Columns[6].Visible        := False;
    dbgrd_cntr.Columns[7].Visible        := False;   // Ocultados a pedido de Maria Cristina - Michel - 28/10/2008
    dbgrd_cntr.Columns[8].Visible        := True;
    dbgrd_cntr.Columns[9].Visible        := True;
    dbgrd_cntr.Columns[10].Visible       := True;
    dbgrd_cntr.Columns[7].Title.Caption  := 'Dt. Saída Fábr.';
    nbNotaFiscal.ActivePage              := 'E';
    ts_reg_exp.tabVisible                := True;
    tbsExportacao.tabvisible             := true;
    tbsImportacao.tabvisible             := false;

    { Verifica se existe alguma mercadoria/ncm com anuencia do exercito By Carlos em 25/03/2010 }
    With TQuery.Create(Application) do
    begin
       DatabaseName:='DBBROKER';
       SQL.Clear;
       SQL.Add(' select distinct p.CD_NCM  ');
       SQL.Add(' from TPROCESSO_EXP_ITEM p (NOLOCK)   ');
       SQL.Add(' join TNCM               n (NOLOCK) ON n.CODIGO=p.CD_NCM and n.IN_ANUENCIA_EXERCITO="1"  ');
       SQL.Add(' where p.NR_PROCESSO = "'+str_nr_processo+'"');
       Open;
       pnl_anuencia_exercito.Visible:=IIF(RecordCount>0,TRUE,FALSE);
       Close;
    end;
  end
  else
  begin
    dbgrdImo.Visible                     := ChkMercadoriaPerigosa.Checked;
    lblImo.Visible                       := ChkMercadoriaPerigosa.Checked;

    dbgrd_cntr.Columns[1].Visible        := True;   // Exibidos por ocultar acima - Michel - 28/10/2008
    dbgrd_cntr.Columns[2].Visible        := True;   // Exibidos por ocultar acima - Michel - 28/10/2008
    dbgrd_cntr.Columns[3].Visible        := True;
    dbgrd_cntr.Columns[4].Visible        := True;
    dbgrd_cntr.Columns[5].Visible        := True;
    dbgrd_cntr.Columns[6].Visible        := True;
    dbgrd_cntr.Columns[7].Visible        := True;   // Exibidos por ocultar acima - Michel - 28/10/2008
    dbgrd_cntr.Columns[8].Visible        := False;
    dbgrd_cntr.Columns[9].Visible        := False;
    dbgrd_cntr.Columns[10].Visible       := False;
    dbgrd_cntr.Columns[7].Title.Caption  := 'Dt. Entr. Fábr.';
    nbNotaFiscal.ActivePage              := 'I';
    ts_reg_exp.tabVisible                := False;
    tbsExportacao.tabvisible             := false;
    tbsImportacao.tabvisible             := true;
  end;

  VerificaProcessoVinculado;
end;

procedure Tfrm_manut_proc.VerificaProcessoFaturado;
var
  vVerificaFaturado:string;
begin
  dbedt_cd_servico.Enabled := True;
  dbedt_cd_cliente.Enabled := True;
  btn_co_servico.Enabled   := True;
  btn_co_cliente.Enabled   := True;


  //Verificar se existe o evento de faturamento no processo
  vVerificaFaturado := ConsultaLookUPSQL('SELECT isnull(CD_EVENTO,'''') as CD_EVENTO FROM TFOLLOWUP (NOLOCK) WHERE CD_EVENTO=''092'' AND NR_PROCESSO='''+str_nr_processo+'''','CD_EVENTO');

  //Libera campos conforme se o processo está faturado
  if vVerificaFaturado <> '' then
  begin
    With TQuery.Create(Application) do
    begin
      DatabaseName:='DBBROKER';
      SQL.Clear;
      SQL.Add(' select distinct NR_PROCESSO  ');
      SQL.Add(' from TFOLLOWUP  (NOLOCK)   ');
      SQL.Add(' where NR_PROCESSO = "'+str_nr_processo+'" AND CD_EVENTO=''092'' AND DT_REALIZACAO IS NOT NULL ');
      Open;

      dbedt_cd_servico.Enabled:= IIF(RecordCount > 0, False, True);
      dbedt_cd_cliente.Enabled:= IIF(RecordCount > 0, False, True);
      // Incluido por Michel para desabilitar os botões - 12/07/2012
      btn_co_servico.Enabled := dbedt_cd_servico.Enabled;
      btn_co_cliente.Enabled := dbedt_cd_cliente.Enabled;
      Close;
    end;
  end;
end;

procedure Tfrm_manut_proc.VerificaProcessoVinculado;
begin
  //verifica se existe processo vinculado
  with TQuery.Create(Application) do
  begin
     DatabaseName := 'DBBROKER'; SQL.Clear;
     edt_vinculado.Text    := '';
     pnl_vinculado.Visible := False;

     if (trim(msk_cd_produto.Text)='03') or (trim(msk_cd_produto.Text)='10') then
     begin
        pnl_vinculado.Caption:=' Vinculado ao processo de desembaraço: ';
        SQL.Clear;
        SQl.Add('Select Substring(NR_PROCESSO_DES,5,12) from TESTAGIO_PROCESSO_FI (NOLOCK) where NR_PROCESSO_FI="'+str_nr_processo+'"');
        Open;
        edt_vinculado.Text:=fields[0].AsString;
        if edt_vinculado.text<>'' then
           pnl_vinculado.Visible:=True;
     end
     else
     begin
        pnl_vinculado.Caption:=' Vinculado ao processo de Logística: ';
        SQL.Clear;
        SQl.Add('Select Substring(NR_PROCESSO_FI,5,12) from TESTAGIO_PROCESSO_FI (NOLOCK) where NR_PROCESSO_DES="'+str_nr_processo+'"');
        Open;
        edt_vinculado.Text:=fields[0].AsString;
        if edt_vinculado.text<>'' then
           pnl_vinculado.Visible:=True;
        if (trim(msk_cd_produto.Text)='01') then
        begin
          Label327.Visible:= true;
          dbedt_analista.Visible:=true;
        end
        else
        begin
          Label327.Visible:= false;
          dbedt_analista.Visible:=false;
        end;
     end;
     Free;
  end;
end;

procedure Tfrm_manut_proc.ConfiguraBotaoSDA;
begin
  // ---------------- SDA - FIN-164
  // Só ficam visíveis para quem tem habilitação para a tela de Distribuição de SDA
  btnDistribuiSDA.Visible := ConsultaLookUPSQL('SELECT COUNT(*) AS ACESSO ' +
                                               'FROM TCONTROLE_ACESSO (nolock) ' +
                                               'WHERE CD_CARGO = :CD_CARGO ' +
                                               '  AND CD_MODULO = ''09'' ' +
                                               '  AND CD_ROTINA = ''0901'' ' +
                                               '  AND IN_ACESSO = ''1'' ' +
                                               '  AND IN_MODIFICAR = ''1''', 'ACESSO', [str_cd_cargo]) <> '0';
  btnCalculaSDA.Visible := btnDistribuiSDA.Visible;
  if btnCalculaSDA.Visible then // Não precisa fazer as consultas se estiver invisível
  begin
    // Só distribui se não estiver distribuído
    btnDistribuiSDA.Enabled := ConsultaLookUPSQL('SELECT ISNULL(CD_STATUS, ''0'') AS CD_STATUS ' +
                                                 'FROM TPROCESSO_SDA (nolock)' +
                                                 'WHERE NR_PROCESSO = :NR_PROCESSO', 'CD_STATUS', [str_nr_processo]) = '0';
    // Só calcula enquanto não estiver faturado
    btnCalculaSDA.Enabled := ConsultaLookUPSQL('SELECT COUNT(*) AS QTD ' +
                                               'FROM TFOLLOWUP F (nolock)' +
                                               'WHERE NR_PROCESSO = :NR_PROCESSO ' +
                                               '  AND F.CD_EVENTO = ''092'' ' +
                                               '  AND F.DT_REALIZACAO IS NOT NULL', 'QTD', [str_nr_processo]) = '0';
  end;
end;

function Tfrm_manut_proc.VerProcesso: Boolean;
var
  vMsg, vDemurrage: String;
begin
  VerProcesso := True;
  // Se o processo já estiver validado ele não será revalidado. 30/11/2005 - Alexandre
  if (lVerProcesso) and not (datm_manut_proc.qry_processo_.State in [dsBrowse, dsInactive]) then Exit;
  lVerProcesso := True;

  with datm_manut_proc do
  begin
    lblMensagemBuscaProcesso.Caption := MSG_BUSCA_PROCESSO;

    qry_processo_.Close;
    qry_processo_.ParamByName('NR_PROCESSO').AsString := Trim(msk_cd_unid_neg.Text) + Trim(msk_cd_produto.Text) + Trim(msk_nr_processo.Text);
    qry_processo_.Open;

    if ChkMercadoriaPerigosa.Checked then
    begin
      Shape15.Pen.Mode  := pmCopy;
      Shape15.Pen.Width := 2;
    end
    else
    begin
      Shape15.Pen.Mode  := pmMerge;
      Shape15.Pen.Width := 1;
    end;

    if DBCheckBox2.Checked then
    begin
      Shape16.Pen.Mode  := pmCopy;
      Shape16.Pen.Width := 2;
    end
    else
    begin
      Shape16.Pen.Mode  := pmMerge;
      Shape16.Pen.Width := 1;
    end;


    if dbcbxMadeiraCondenada.Checked then
    begin
      Shape11.Pen.Mode  := pmCopy;
      Shape11.Pen.Width := 2;
    end
    else
    begin
      Shape11.Pen.Mode  := pmMerge;
      Shape11.Pen.Width := 1;
    end;

    if dbcbxCsiMapa.Checked then
    begin
      Shape14.Pen.Mode  := pmCopy;
      Shape14.Pen.Width := 2;
    end
    else
    begin
      Shape14.Pen.Mode  := pmMerge;
      Shape14.Pen.Width := 1;
    end;

    if dbcbxCobrancaEcac.Checked then
    begin
      Shape17.Pen.Mode  := pmCopy;
      Shape17.Pen.Width := 2;
    end
    else
    begin
      Shape17.Pen.Mode  := pmMerge;
      Shape17.Pen.Width := 1;
    end;

    if qry_processo_.RecordCount = 0 then
    begin
      qry_processo_.Close;
      lblMensagemBuscaProcesso.caption := 'Processo não encontrado! Digite novamente!';
      lblMensagemBuscaProcesso.visible := true;
//      BoxMensagem( 'Processo não encontrado! Digite novamente!', 2 );
      VerProcesso  := False;
      lVerProcesso := False;

      pgctrl_manut_proc.ActivePage := ts_lista;
    end
    else
    begin

      vTpEstufagem := datm_manut_proc.qry_processo_TP_ESTUFAGEM.AsString;

      if (qry_processo_IN_CANCELADO.AsString = '1') and (str_cd_cargo = '001') and
         (MessageDlg('Este processo está cancelado.'#13'Deseja descancelá-lo?', mtConfirmation, [mbYes, mbNo], 0) = mrYes) then
      begin
        qry_processo_.Edit;
        qry_processo_IN_CANCELADO.AsString := '0';
        qry_processo_.Post;
        ShowMessage('Processo descancelado com sucesso.');

        msk_nr_processoExit(msk_nr_processo);
      end;

      if qry_processo_IN_CANCELADO.AsString = '1' then
      begin
        qry_processo_.Close;
        if (str_cd_cargo <> '001') then
          BoxMensagem( 'Processo Cancelado! Digite novamente!', 2 );

        VerProcesso  := False;
        lVerProcesso := False;
        Exit;
      end;

      if qry_processo_IN_LIBERADO.AsString = '0' then
      begin
        qry_processo_.Close;
        BoxMensagem( 'Processo não está liberado! Digite novamente!', 2 );
        VerProcesso  := False;
        lVerProcesso := False;
        Exit;
      end;

      if qry_processo_IN_PRODUCAO.AsString = '0' then
      begin
        qry_processo_.Close;
        BoxMensagem( 'Processo não está na produção! Digite novamente!', 2 );
        VerProcesso  := False;
        lVerProcesso := False;
        Exit;
      end;

      if (qry_processo_CD_GRUPO.AsString = 'A74') and (qry_processo_CD_PRODUTO.AsString = '01') then
         lblRefExp.Caption := 'ID (Shell)'
      else
         lblRefExp.Caption := 'Referência Exportador';

      //Verifica se a data de demurrage do processo está atrasada
      vDemurrage := ConsultaLookUpSql('SELECT TOP 1 CONVERT(VARCHAR, DATEDIFF(DAY, GETDATE(), DT_DEMURRAGE), 103) AS DEMURRAGE ' +
                                               ' FROM TPROCESSO_CNTR (NOLOCK) WHERE IN_DEMURRAGE = ''1'' AND ISNULL(DT_DEVOLUCAO_CNTR, '''') = '''' AND '+
                                               ' NR_PROCESSO = ''' + Trim(msk_cd_unid_neg.Text) + Trim(msk_cd_produto.Text) + Trim(msk_nr_processo.Text) + '''', 'DEMURRAGE');
      if (vDemurrage <> '') and (StrToInt(vDemurrage) <= 6) then
      begin
        if StrToInt(vDemurrage) >= 0 then
          pnlDemurrage.Caption := 'Demurrage próximo ao vencimento'
        else if StrToInt(vDemurrage) < 0 then
          pnlDemurrage.Caption := 'Demurrage Atrasada';
        pnlDemurrage.Visible := True;
      end
      else
        pnlDemurrage.Visible := False;
    end;

    // Verifica o preenchimento dos evento 317 e 337 - Michel - 01/12/2008
    vMsg := ValidaInsPreEmbarque(datm_manut_proc.qry_processo_NR_PROCESSO.Asstring);
    if vMsg <> '' then
      MessageDlg(vMsg, mtWarning, [mbOk], 0);
  end;
end;

procedure Tfrm_manut_proc.msk_nr_processoEnter(Sender: TObject);
begin
  var_nr_proc := Trim( msk_cd_unid_neg.Text ) + Trim( msk_cd_produto.Text ) + Trim( msk_nr_processo.Text );
end;

procedure Tfrm_manut_proc.msk_nr_processoChange(Sender: TObject);
begin
 if datm_manut_proc.qry_processo_.Active then
    datm_manut_proc.qry_processo_.Close;
  lVerProcesso := False;
  Screen.Cursor := crDefault;
end;

procedure Tfrm_manut_proc.btn_co_moeda_frete_iaClick(Sender: TObject);
begin
  if Not lAbertura then Edita;
  if Sender is TSpeedButton then
  begin
    if not PoeEmEdicao(datm_manut_proc.qry_proc_im_) then exit;
    If (Sender as TSpeedButton).Enabled Then
      datm_manut_proc.qry_proc_im_CD_MOEDA_FRETE.AsString := ConsultaOnLineEx('TMOEDA_BROKER','Moeda',['CD_MOEDA','NM_MOEDA'],['Código','Descrição'],'CD_MOEDA',frm_main.mi_cad_moeda, 1, dbedt_cd_moeda_frete_ia.text)
  end
  else dbedt_nm_moeda_frete_ia.Text := ConsultaLookUP('TMOEDA_BROKER','CD_MOEDA',dbedt_cd_moeda_frete_ia.Text,'NM_MOEDA')
end;

procedure Tfrm_manut_proc.btn_co_moeda_frete_irClick(Sender: TObject);
begin
  if Not lAbertura then Edita;
  if Sender is TSpeedButton then
  begin
    if not PoeEmEdicao(datm_manut_proc.qry_proc_im_) then
    exit;
    If (Sender as TSpeedButton).Enabled Then
      datm_manut_proc.qry_proc_im_CD_MOEDA_FRETE.AsString := ConsultaOnLineEx('TMOEDA_BROKER','Moeda',['CD_MOEDA','NM_MOEDA'],['Código','Descrição'],'CD_MOEDA',frm_main.mi_cad_moeda)
  end
  else
    dbedt_nm_moeda_frete_ir.Text := ConsultaLookUP('TMOEDA_BROKER','CD_MOEDA',dbedt_cd_moeda_frete_ir.Text,'NM_MOEDA')
end;

procedure Tfrm_manut_proc.btn_co_moeda_frete_ifClick(Sender: TObject);
begin
  if Not lAbertura then Edita;
  if Sender is TSpeedButton then
  begin
    if not PoeEmEdicao(datm_manut_proc.qry_proc_im_) then
      exit;

    If (Sender as TSpeedButton).Enabled Then
      datm_manut_proc.qry_proc_im_CD_MOEDA_FRETE.AsString := ConsultaOnLineEx('TMOEDA_BROKER','Moeda',['CD_MOEDA','NM_MOEDA'],['Código','Descrição'],'CD_MOEDA',frm_main.mi_cad_moeda)
  end
  else
    dbedt_nm_moeda_frete_if.Text := ConsultaLookUP('TMOEDA_BROKER','CD_MOEDA',dbedt_cd_moeda_frete_if.Text,'NM_MOEDA')
end;

procedure Tfrm_manut_proc.btn_co_moeda_frete_emClick(Sender: TObject);
begin
  if Not lAbertura then Edita;
  if Sender is TSpeedButton then
  begin
    if not PoeEmEdicao(datm_manut_proc.qry_proc_em_) then
      exit;

    If (Sender as TSpeedButton).Enabled Then
      datm_manut_proc.qry_proc_em_CD_MOEDA_FRETE.AsString := ConsultaOnLineEx('TMOEDA_BROKER','Moeda',['CD_MOEDA','AP_MOEDA'],['Código','Descrição'],'CD_MOEDA',frm_main.mi_cad_moeda, 1 ,dbedt_cd_moeda_frete_em.Text)
  end
  else
    dbedt_nm_moeda_frete_em.Text := ConsultaLookUP('TMOEDA_BROKER','CD_MOEDA',dbedt_cd_moeda_frete_em.Text,'AP_MOEDA')
end;

procedure Tfrm_manut_proc.btn_co_moeda_frete_eaClick(Sender: TObject);
begin
  if Not lAbertura then Edita;
  if Sender is TSpeedButton then
  begin
    if not PoeEmEdicao(datm_manut_proc.qry_proc_em_) then
      exit;
      
    If (Sender as TSpeedButton).Enabled Then
      datm_manut_proc.qry_proc_em_CD_MOEDA_FRETE.AsString := ConsultaOnLineEx('TMOEDA_BROKER','Moeda',['CD_MOEDA','NM_MOEDA'],['Código','Descrição'],'CD_MOEDA',frm_main.mi_cad_moeda,1,dbedt_cd_moeda_frete_ea.text)
  end
  else
    dbedt_nm_moeda_frete_ea.Text := ConsultaLookUP('TMOEDA_BROKER','CD_MOEDA',dbedt_cd_moeda_frete_ea.Text,'NM_MOEDA')
end;

procedure Tfrm_manut_proc.btn_co_moeda_frete_erClick(Sender: TObject);
begin
  if Not lAbertura then Edita;
  if Sender is TSpeedButton then
  begin
    if not PoeEmEdicao(datm_manut_proc.qry_proc_em_) then
      exit;
      
    If (Sender as TSpeedButton).Enabled Then
      datm_manut_proc.qry_proc_em_CD_MOEDA_FRETE.AsString := ConsultaOnLineEx('TMOEDA_BROKER','Moeda',['CD_MOEDA','NM_MOEDA'],['Código','Descrição'],'CD_MOEDA',frm_main.mi_cad_moeda,1, dbedt_cd_moeda_frete_er.text)
  end
  else
    dbedt_nm_moeda_frete_er.Text := ConsultaLookUP('TMOEDA_BROKER','CD_MOEDA',dbedt_cd_moeda_frete_er.Text,'NM_MOEDA')
end;

procedure Tfrm_manut_proc.btn_co_moeda_frete_efClick(Sender: TObject);
begin
  if Not lAbertura then Edita;
  if Sender is TSpeedButton then
  begin
    if not PoeEmEdicao(datm_manut_proc.qry_proc_em_) then
      exit;
      
    If (Sender as TSpeedButton).Enabled Then
      datm_manut_proc.qry_proc_em_CD_MOEDA_FRETE.AsString := ConsultaOnLineEx('TMOEDA_BROKER','Moeda',['CD_MOEDA','NM_MOEDA'],['Código','Descrição'],'CD_MOEDA',frm_main.mi_cad_moeda)
  end
  else
    dbedt_nm_moeda_frete_ef.Text := ConsultaLookUP('TMOEDA_BROKER','CD_MOEDA',dbedt_cd_moeda_frete_ef.Text,'NM_MOEDA')
end;

procedure Tfrm_manut_proc.btn_co_agente_irClick(Sender: TObject);
begin
  if Not lAbertura then Edita;
  if Sender is TSpeedButton then
  begin
    if not PoeEmEdicao(datm_manut_proc.qry_proc_im_) then
    exit;
    If (Sender as TSpeedButton).Enabled Then
      datm_manut_proc.qry_proc_im_CD_AGENTE.AsString := ConsultaOnLineEx('TAGENTE','Agentes',['CD_AGENTE','NM_AGENTE'],['Código','Descrição'],'CD_AGENTE',frm_main.mi_agentes)
  end
  else
    dbedt_nm_agente_ir.Text := ConsultaLookUP('TAGENTE','CD_AGENTE',dbedt_cd_agente_ir.Text,'NM_AGENTE');
end;

procedure Tfrm_manut_proc.btn_co_agente_ifClick(Sender: TObject);
begin
  if Not lAbertura then Edita;
  if Sender is TSpeedButton then
  begin
    if not PoeEmEdicao(datm_manut_proc.qry_proc_im_) then
      exit;

    If (Sender as TSpeedButton).Enabled Then
      datm_manut_proc.qry_proc_im_CD_AGENTE.AsString := ConsultaOnLineEx('TAGENTE','Agentes',['CD_AGENTE','NM_AGENTE'],['Código','Descrição'],'CD_AGENTE',frm_main.mi_agentes)
  end
  else
    dbedt_nm_agente_if.Text := ConsultaLookUP('TAGENTE','CD_AGENTE',dbedt_cd_agente_if.Text,'NM_AGENTE');
end;

procedure Tfrm_manut_proc.btn_co_agente_emClick(Sender: TObject);
begin
  if Not lAbertura then Edita;
  if Sender is TSpeedButton then
  begin
    if not PoeEmEdicao(datm_manut_proc.qry_proc_em_) then
      exit;

    If (Sender as TSpeedButton).Enabled Then
      datm_manut_proc.qry_proc_em_CD_AGENTE.AsString := ConsultaOnLineEx('TAGENTE','Agentes',['CD_AGENTE','NM_AGENTE','NM_AGENTE_REDUZIDO'],['Código','Nome','Apelido'],'CD_AGENTE',frm_main.mi_agentes, 1, dbedt_cd_agente_em.text)
  end
  else
    dbedt_nm_agente_em.Text := ConsultaLookUP('TAGENTE','CD_AGENTE',dbedt_cd_agente_em.Text,'ISNULL(NM_AGENTE_REDUZIDO,NM_AGENTE)');
//    dbedt_nm_agente_em.Text := ConsultaLookUP('TAGENTE','CD_AGENTE',dbedt_cd_agente_em.Text,'NM_AGENTE'); //by carlos - 01/09/2011
end;

procedure Tfrm_manut_proc.btn_co_agente_eaClick(Sender: TObject);
begin
  if Not lAbertura then Edita;
  if Sender is TSpeedButton then
  begin
    if not PoeEmEdicao(datm_manut_proc.qry_proc_em_) then
      exit;

    If (Sender as TSpeedButton).Enabled Then
      datm_manut_proc.qry_proc_em_CD_AGENTE.AsString := ConsultaOnLineEx('TAGENTE','Agentes',['CD_AGENTE','NM_AGENTE','NM_AGENTE_REDUZIDO'],['Código','Nome','Apelido'],'CD_AGENTE',frm_main.mi_agentes, 1, dbedt_cd_agente_ea.text)

  end
  else
    dbedt_nm_agente_ea.Text := ConsultaLookUP('TAGENTE','CD_AGENTE',dbedt_cd_agente_ea.Text,'ISNULL(NM_AGENTE_REDUZIDO,NM_AGENTE)');
//    dbedt_nm_agente_ea.Text := ConsultaLookUP('TAGENTE','CD_AGENTE',dbedt_cd_agente_ea.Text,'NM_AGENTE');  //by carlos - 01/09/2011
end;

procedure Tfrm_manut_proc.btn_co_agente_erClick(Sender: TObject);
begin
  if Not lAbertura then Edita;
  if Sender is TSpeedButton then
  begin
    if not PoeEmEdicao(datm_manut_proc.qry_proc_em_) then
      exit;

    If (Sender as TSpeedButton).Enabled Then
      datm_manut_proc.qry_proc_em_CD_AGENTE.AsString := ConsultaOnLineEx('TAGENTE','Agentes',['CD_AGENTE','NM_AGENTE','NM_AGENTE_REDUZIDO'],['Código','Nome','Apelido'],'CD_AGENTE',frm_main.mi_agentes, 1, dbedt_cd_agente_er.text)

  end
  else
    dbedt_nm_agente_er.Text := ConsultaLookUP('TAGENTE','CD_AGENTE',dbedt_cd_agente_er.Text,'ISNULL(NM_AGENTE_REDUZIDO,NM_AGENTE)');
//    dbedt_nm_agente_er.Text := ConsultaLookUP('TAGENTE','CD_AGENTE',dbedt_cd_agente_er.Text,'NM_AGENTE');   //by carlos - 01/09/2011
end;

procedure Tfrm_manut_proc.btn_co_agente_efClick(Sender: TObject);
begin
  if Not lAbertura then Edita;
  if Sender is TSpeedButton then
  begin
    if not PoeEmEdicao(datm_manut_proc.qry_proc_em_) then
      exit;
      
    If (Sender as TSpeedButton).Enabled Then
      datm_manut_proc.qry_proc_em_CD_AGENTE.AsString := ConsultaOnLineEx('TAGENTE','Agentes',['CD_AGENTE','NM_AGENTE','NM_AGENTE_REDUZIDO'],['Código','Nome','Apelido'],'CD_AGENTE',frm_main.mi_agentes, 1, dbedt_cd_agente_ef.text)

  end
  else
    dbedt_nm_agente_ef.Text := ConsultaLookUP('TAGENTE','CD_AGENTE',dbedt_cd_agente_ef.Text,'ISNULL(NM_AGENTE_REDUZIDO,NM_AGENTE)');
//    dbedt_nm_agente_ef.Text := ConsultaLookUP('TAGENTE','CD_AGENTE',dbedt_cd_agente_ef.Text,'NM_AGENTE');  //by carlos - 01/09/2011
end;

procedure Tfrm_manut_proc.btn_co_agente_iaClick(Sender: TObject);
begin
  if Not lAbertura then Edita;
  if Sender is TSpeedButton then
  begin
    if not PoeEmEdicao(datm_manut_proc.qry_proc_im_) then
    exit;
    If (Sender as TSpeedButton).Enabled Then
      datm_manut_proc.qry_proc_im_CD_AGENTE.AsString := ConsultaOnLineEx('TAGENTE','Agentes',['CD_AGENTE','NM_AGENTE'],['Código','Descrição'],'CD_AGENTE',frm_main.mi_agentes, 1, dbedt_cd_agente_ia.text)
  end
  else
    dbedt_nm_agente_ia.Text := ConsultaLookUP('TAGENTE','CD_AGENTE',dbedt_cd_agente_ia.Text,'NM_AGENTE');
end;

procedure Tfrm_manut_proc.btn_co_amz_atr_irClick(Sender: TObject);
begin
  if Not lAbertura then Edita;
  if Sender is TSpeedButton then
  begin
    if not PoeEmEdicao(datm_manut_proc.qry_proc_im_) then
    exit;
    If (Sender as TSpeedButton).Enabled Then
      datm_manut_proc.qry_proc_im_CD_ARMAZEM_ATRACACAO.AsString := ConsultaOnLineEx('TARMAZEM','Armazém',['CD_ARMAZEM','NM_ARMAZEM','NM_SIGLA','CD_RECINTO'],['Código','Nome','Sigla','Recinto'],'CD_ARMAZEM',frm_main.mi_cad_amz)
  end
  else
    dbedt_nm_amz_atr_ir.Text := ConsultaLookUP('TARMAZEM','CD_ARMAZEM',dbedt_cd_amz_atr_ir.Text,'NM_ARMAZEM');
end;

procedure Tfrm_manut_proc.btn_co_amz_atr_ifClick(Sender: TObject);
begin
  if Not lAbertura then Edita;
  if Sender is TSpeedButton then
  begin
    if not PoeEmEdicao(datm_manut_proc.qry_proc_im_) then
    exit;
    If (Sender as TSpeedButton).Enabled Then
      datm_manut_proc.qry_proc_im_CD_ARMAZEM_ATRACACAO.AsString := ConsultaOnLineEx('TARMAZEM','Armazém',['CD_ARMAZEM','NM_ARMAZEM','NM_SIGLA','CD_RECINTO'],['Código','Nome','Sigla','Recinto'],'CD_ARMAZEM',frm_main.mi_cad_amz)
  end
  else
    dbedt_nm_amz_atr_if.Text := ConsultaLookUP('TARMAZEM','CD_ARMAZEM',dbedt_cd_amz_atr_if.Text,'NM_ARMAZEM');
end;

procedure Tfrm_manut_proc.btn_co_amz_atr_emClick(Sender: TObject);
begin
  if Not lAbertura then Edita;
  if Sender is TSpeedButton then
  begin
    if not PoeEmEdicao(datm_manut_proc.qry_proc_em_) then
    exit;
    If (Sender as TSpeedButton).Enabled Then
      datm_manut_proc.qry_proc_em_CD_ARMAZEM_ATRACACAO.AsString := ConsultaOnLineEx('TARMAZEM','Armazém',['CD_ARMAZEM','NM_ARMAZEM','NM_SIGLA','CD_RECINTO'],['Código','Nome','Sigla','Recinto'],'CD_ARMAZEM',frm_main.mi_cad_amz,1 , dbedt_cd_amz_atr_em.text)
  end
  else
    dbedt_nm_amz_atr_em.Text := ConsultaLookUP('TARMAZEM','CD_ARMAZEM',dbedt_cd_amz_atr_em.Text,'NM_ARMAZEM');
end;

procedure Tfrm_manut_proc.btn_co_amz_atr_iaClick(Sender: TObject);
begin
  if Not lAbertura then Edita;
  if Sender is TSpeedButton then
  begin
    if not PoeEmEdicao(datm_manut_proc.qry_proc_im_) then
    exit;
    If (Sender as TSpeedButton).Enabled Then
      datm_manut_proc.qry_proc_im_CD_ARMAZEM_ATRACACAO.AsString := ConsultaOnLineEx('TARMAZEM','Armazém',['CD_ARMAZEM','NM_ARMAZEM','NM_SIGLA','CD_RECINTO'],['Código','Nome','Sigla','Recinto'],'CD_ARMAZEM',frm_main.mi_cad_amz, 1 ,dbedt_cd_amz_atr_ia.text)
  end
  else
    dbedt_nm_amz_atr_ia.Text := ConsultaLookUP('TARMAZEM','CD_ARMAZEM',dbedt_cd_amz_atr_ia.Text,'NM_ARMAZEM');
end;

procedure Tfrm_manut_proc.btn_co_amz_des_iaClick(Sender: TObject);
begin

  if Not lAbertura then Edita;
  if Sender is TSpeedButton then
  begin
    if not PoeEmEdicao(datm_manut_proc.qry_proc_im_) then
    exit;
    If (Sender as TSpeedButton).Enabled Then
      datm_manut_proc.qry_proc_im_CD_ARMAZEM_DESCARGA.AsString := ConsultaOnLineEx('TARMAZEM','Armazém',['CD_ARMAZEM','NM_ARMAZEM','NM_SIGLA','CD_RECINTO'],['Código','Nome','Sigla','Recinto'],'CD_ARMAZEM',frm_main.mi_cad_amz, 1, dbedt_cd_amz_des_ia.text)
  end
  else
    dbedt_nm_amz_des_ia.Text := ConsultaLookUP('TARMAZEM','CD_ARMAZEM',dbedt_cd_amz_des_ia.Text,'NM_ARMAZEM');
end;

procedure Tfrm_manut_proc.btn_co_embarc_emClick(Sender: TObject);
begin
  if Not lAbertura then Edita;
  if Sender is TSpeedButton then
  begin
    if not PoeEmEdicao(datm_manut_proc.qry_proc_em_) then
    exit;
    If (Sender as TSpeedButton).Enabled Then
      datm_manut_proc.qry_proc_em_CD_EMBARCACAO.AsString := ConsultaOnLineEx('TEMBARCACAO','Embarcação',['CD_EMBARCACAO','NM_EMBARCACAO'],['Código','Nome'],'CD_EMBARCACAO',frm_main.mi_cad_embar,1,dbedt_cd_embarc_em.text)
  end
  else
    dbedt_nm_embarc_em.Text := ConsultaLookUP('TEMBARCACAO','CD_EMBARCACAO',dbedt_cd_embarc_em.Text,'NM_EMBARCACAO');
end;

procedure Tfrm_manut_proc.btn_co_local_emb_iaClick(Sender: TObject);
begin
  if Not lAbertura then Edita;
  if Sender is TSpeedButton then
  begin
    if not PoeEmEdicao(datm_manut_proc.qry_proc_im_) then
    exit;
    If (Sender as TSpeedButton).Enabled Then
      datm_manut_proc.qry_proc_im_CD_LOCAL_EMBARQUE.AsString := ConsultaOnLineEx('TLOCAL_EMBARQUE','Local Embarque',['CODIGO','DESCRICAO'],['Código','Nome'],'CODIGO',frm_main.mi_cad_local_emb,1 ,dbedt_cd_local_emb_ia.text)
  end
  else
  begin
    dbedt_nm_local_emb_ia.Text   := ConsultaLookUP('TLOCAL_EMBARQUE','CODIGO',dbedt_cd_local_emb_ia.Text,'DESCRICAO');
    //dbedt_cd_pais_origem_ia.Text := ConsultaLookUP('TLOCAL_EMBARQUE','CODIGO',dbedt_cd_local_emb_ia.Text,'CD_PAIS');
  end;
end;

procedure Tfrm_manut_proc.btn_co_local_emb_irClick(Sender: TObject);
begin
  if Not lAbertura then Edita;
  if Sender is TSpeedButton then
  begin
    if not PoeEmEdicao(datm_manut_proc.qry_proc_im_) then
    exit;
    If (Sender as TSpeedButton).Enabled Then
      datm_manut_proc.qry_proc_im_CD_LOCAL_EMBARQUE.AsString := ConsultaOnLineEx('TLOCAL_EMBARQUE','Local Embarque',['CODIGO','DESCRICAO'],['Código','Nome'],'CODIGO',frm_main.mi_cad_local_emb)
  end
  else
  begin
    dbedt_nm_local_emb_ir.Text   := ConsultaLookUP('TLOCAL_EMBARQUE','CODIGO',dbedt_cd_local_emb_ir.Text,'DESCRICAO');
    //dbedt_cd_pais_origem_ir.Text := ConsultaLookUP('TLOCAL_EMBARQUE','CODIGO',dbedt_cd_local_emb_ir.Text,'CD_PAIS');
  end;
end;

procedure Tfrm_manut_proc.btn_co_local_emb_ifClick(Sender: TObject);
begin
  if Not lAbertura then Edita;
  if Sender is TSpeedButton then
  begin
    if not PoeEmEdicao(datm_manut_proc.qry_proc_im_) then
    exit;
    If (Sender as TSpeedButton).Enabled Then
      datm_manut_proc.qry_proc_im_CD_LOCAL_EMBARQUE.AsString := ConsultaOnLineEx('TLOCAL_EMBARQUE','Local Embarque',['CODIGO','DESCRICAO'],['Código','Nome'],'CODIGO',frm_main.mi_cad_local_emb)
  end
  else
  begin
    dbedt_nm_local_emb_if.Text   := ConsultaLookUP('TLOCAL_EMBARQUE','CODIGO',dbedt_cd_local_emb_if.Text,'DESCRICAO');
    //dbedt_cd_pais_origem_if.Text := ConsultaLookUP('TLOCAL_EMBARQUE','CODIGO',dbedt_cd_local_emb_if.Text,'CD_PAIS');
  end;
end;

procedure Tfrm_manut_proc.btn_co_local_emb_emClick(Sender: TObject);
begin
  if Not lAbertura then Edita;
  if Sender is TSpeedButton then
  begin
    if not PoeEmEdicao(datm_manut_proc.qry_proc_em_) then
    exit;
    If (Sender as TSpeedButton).Enabled Then
      datm_manut_proc.qry_proc_em_CD_LOCAL_EMBARQUE.AsString := ConsultaOnLineEx('TLOCAL_EMBARQUE','Local Embarque',['CODIGO','DESCRICAO'],['Código','Nome'],'CODIGO',frm_main.mi_cad_local_emb, 1, dbedt_cd_local_emb_em.text)
  end
  else dbedt_nm_local_emb_em.Text := ConsultaLookUP('TLOCAL_EMBARQUE','CODIGO',dbedt_cd_local_emb_em.Text,'DESCRICAO');
end;

procedure Tfrm_manut_proc.btn_co_local_emb_eaClick(Sender: TObject);
begin
  if Not lAbertura then Edita;
  if Sender is TSpeedButton then
  begin
    if not PoeEmEdicao(datm_manut_proc.qry_proc_em_) then
    exit;
    If (Sender as TSpeedButton).Enabled Then
      datm_manut_proc.qry_proc_em_CD_LOCAL_EMBARQUE.AsString := ConsultaOnLineEx('TLOCAL_EMBARQUE','Local Embarque',['CODIGO','DESCRICAO'],['Código','Nome'],'CODIGO',frm_main.mi_cad_local_emb,1,dbedt_cd_local_emb_ea.text)  end
  else dbedt_nm_local_emb_ea.Text := ConsultaLookUP('TLOCAL_EMBARQUE','CODIGO',dbedt_cd_local_emb_ea.Text,'DESCRICAO');
end;

procedure Tfrm_manut_proc.btn_co_local_emb_erClick(Sender: TObject);
begin
  if Not lAbertura then Edita;
  if Sender is TSpeedButton then
  begin
    if not PoeEmEdicao(datm_manut_proc.qry_proc_em_) then
    exit;
    If (Sender as TSpeedButton).Enabled Then
      datm_manut_proc.qry_proc_em_CD_LOCAL_EMBARQUE.AsString := ConsultaOnLineEx('TLOCAL_EMBARQUE','Local Embarque',['CODIGO','DESCRICAO'],['Código','Nome'],'CODIGO',frm_main.mi_cad_local_emb,1,dbedt_cd_local_emb_er.text)
  end
  else dbedt_nm_local_emb_er.Text := ConsultaLookUP('TLOCAL_EMBARQUE','CODIGO',dbedt_cd_local_emb_er.Text,'DESCRICAO');
end;

procedure Tfrm_manut_proc.btn_co_local_emb_efClick(Sender: TObject);
begin
  if Not lAbertura then Edita;
  if Sender is TSpeedButton then
  begin
    if not PoeEmEdicao(datm_manut_proc.qry_proc_em_) then
    exit;
    If (Sender as TSpeedButton).Enabled Then
      datm_manut_proc.qry_proc_em_CD_LOCAL_EMBARQUE.AsString := ConsultaOnLineEx('TLOCAL_EMBARQUE','Local Embarque',['CODIGO','DESCRICAO'],['Código','Nome'],'CODIGO',frm_main.mi_cad_local_emb)
  end
  else dbedt_nm_local_emb_ef.Text := ConsultaLookUP('TLOCAL_EMBARQUE','CODIGO',dbedt_cd_local_emb_ef.Text,'DESCRICAO');
end;

procedure Tfrm_manut_proc.btn_co_local_desemb_iaClick(Sender: TObject);
begin
  if Not lAbertura then Edita;
  if Sender is TSpeedButton then
  begin
    if not PoeEmEdicao(datm_manut_proc.qry_proc_im_) then
    exit;
    If (Sender as TSpeedButton).Enabled Then
      datm_manut_proc.qry_proc_im_CD_LOCAL_DESEMBARQUE.AsString := ConsultaOnLineEx('TLOCAL_EMBARQUE','Local Desembarque',['CODIGO','DESCRICAO'],['Código','Nome'],'CODIGO',frm_main.mi_cad_local_emb, 1, dbedt_cd_local_desemb_ia.text)
  end
  else dbedt_nm_local_desemb_ia.Text := ConsultaLookUP('TLOCAL_EMBARQUE','CODIGO',dbedt_cd_local_desemb_ia.Text,'DESCRICAO');
end;

procedure Tfrm_manut_proc.btn_co_local_desemb_irClick(Sender: TObject);
begin
  if Not lAbertura then Edita;
  if Sender is TSpeedButton then
  begin
    if not PoeEmEdicao(datm_manut_proc.qry_proc_im_) then
    exit;
    If (Sender as TSpeedButton).Enabled Then
      datm_manut_proc.qry_proc_im_CD_LOCAL_DESEMBARQUE.AsString := ConsultaOnLineEx('TLOCAL_EMBARQUE','Local Desembarque',['CODIGO','DESCRICAO'],['Código','Nome'],'CODIGO',frm_main.mi_cad_local_emb)
  end
  else dbedt_nm_local_desemb_ir.Text := ConsultaLookUP('TLOCAL_EMBARQUE','CODIGO',dbedt_cd_local_desemb_ir.Text,'DESCRICAO');
end;

procedure Tfrm_manut_proc.btn_co_local_desemb_ifClick(Sender: TObject);
begin
  if Not lAbertura then Edita;
  if Sender is TSpeedButton then
  begin
    if not PoeEmEdicao(datm_manut_proc.qry_proc_im_) then
    exit;
    If (Sender as TSpeedButton).Enabled Then
      datm_manut_proc.qry_proc_im_CD_LOCAL_DESEMBARQUE.AsString := ConsultaOnLineEx('TLOCAL_EMBARQUE','Local Desembarque',['CODIGO','DESCRICAO'],['Código','Nome'],'CODIGO',frm_main.mi_cad_local_emb)
  end
  else dbedt_nm_local_desemb_if.Text := ConsultaLookUP('TLOCAL_EMBARQUE','CODIGO',dbedt_cd_local_desemb_if.Text,'DESCRICAO');
end;

procedure Tfrm_manut_proc.btn_co_local_desemb_emClick(Sender: TObject);
begin
  if Not lAbertura then Edita;
  if Sender is TSpeedButton then
  begin
    if not PoeEmEdicao(datm_manut_proc.qry_proc_em_) then
    exit;
    If (Sender as TSpeedButton).Enabled Then
      datm_manut_proc.qry_proc_em_CD_LOCAL_DESEMBARQUE.AsString := ConsultaOnLineEx('TLOCAL_EMBARQUE','Local Desembarque',['CODIGO','DESCRICAO'],['Código','Nome'],'CODIGO',frm_main.mi_cad_local_emb, 1, dbedt_cd_local_desemb_em.text);
  end
  else dbedt_nm_local_desemb_em.Text := ConsultaLookUP('TLOCAL_EMBARQUE','CODIGO',dbedt_cd_local_desemb_em.Text,'DESCRICAO');
end;

procedure Tfrm_manut_proc.btn_co_local_desemb_eaClick(Sender: TObject);
begin
  if Not lAbertura then Edita;
  if Sender is TSpeedButton then
  begin
    if not PoeEmEdicao(datm_manut_proc.qry_proc_em_) then
    exit;
    If (Sender as TSpeedButton).Enabled Then
      datm_manut_proc.qry_proc_em_CD_LOCAL_DESEMBARQUE.AsString := ConsultaOnLineEx('TLOCAL_EMBARQUE','Local Desembarque',['CODIGO','DESCRICAO'],['Código','Nome'],'CODIGO',frm_main.mi_cad_local_emb,1,dbedt_cd_local_desemb_ea.text);
  end
  else dbedt_nm_local_desemb_ea.Text := ConsultaLookUP('TLOCAL_EMBARQUE','CODIGO',dbedt_cd_local_desemb_ea.Text,'DESCRICAO');
end;

procedure Tfrm_manut_proc.btn_co_local_desemb_erClick(Sender: TObject);
begin
  if Not lAbertura then Edita;
  if Sender is TSpeedButton then
  begin
    if not PoeEmEdicao(datm_manut_proc.qry_proc_em_) then
    exit;
    If (Sender as TSpeedButton).Enabled Then
      datm_manut_proc.qry_proc_em_CD_LOCAL_DESEMBARQUE.AsString := ConsultaOnLineEx('TLOCAL_EMBARQUE','Local Desembarque',['CODIGO','DESCRICAO'],['Código','Nome'],'CODIGO',frm_main.mi_cad_local_emb,1,dbedt_cd_local_desemb_er.text);
  end
  else dbedt_nm_local_desemb_er.Text := ConsultaLookUP('TLOCAL_EMBARQUE','CODIGO',dbedt_cd_local_desemb_er.Text,'DESCRICAO');
end;

procedure Tfrm_manut_proc.btn_co_local_desemb_efClick(Sender: TObject);
begin
  if Not lAbertura then Edita;
  if Sender is TSpeedButton then
  begin
    if not PoeEmEdicao(datm_manut_proc.qry_proc_em_) then
    exit;
    If (Sender as TSpeedButton).Enabled Then
      datm_manut_proc.qry_proc_em_CD_LOCAL_DESEMBARQUE.AsString := ConsultaOnLineEx('TLOCAL_EMBARQUE','Local Desembarque',['CODIGO','DESCRICAO'],['Código','Nome'],'CODIGO',frm_main.mi_cad_local_emb);
  end
  else dbedt_nm_local_desemb_ef.Text := ConsultaLookUP('TLOCAL_EMBARQUE','CODIGO',dbedt_cd_local_desemb_ef.Text,'DESCRICAO');
end;

procedure Tfrm_manut_proc.btn_co_pais_dest_eaClick(Sender: TObject);
begin
  if Not lAbertura then Edita;
  if Sender is TSpeedButton then
  begin
    if not PoeEmEdicao(datm_manut_proc.qry_proc_em_) then
    exit;
    If (Sender as TSpeedButton).Enabled Then
      datm_manut_proc.qry_proc_em_CD_PAIS_DESTINO.AsString := ConsultaOnLineEx('TPAIS','Países',['CODIGO','DESCRICAO'],['Código','Nome'],'CODIGO',frm_main.mi_cad_pais,1,dbedt_cd_pais_dest_ea.text);
  end
  else dbedt_nm_pais_dest_ea.Text := ConsultaLookUP('TPAIS','CODIGO',dbedt_cd_pais_dest_ea.Text,'DESCRICAO')
end;

procedure Tfrm_manut_proc.btn_co_pais_dest_erClick(Sender: TObject);
begin
  if Not lAbertura then Edita;
  if Sender is TSpeedButton then
  begin
    if not PoeEmEdicao(datm_manut_proc.qry_proc_em_) then
    exit;
    If (Sender as TSpeedButton).Enabled Then
      datm_manut_proc.qry_proc_em_CD_PAIS_DESTINO.AsString := ConsultaOnLineEx('TPAIS','Países',['CODIGO','DESCRICAO'],['Código','Nome'],'CODIGO',frm_main.mi_cad_pais, 1, dbedt_cd_pais_dest_er.text);
  end
  else dbedt_nm_pais_dest_er.Text := ConsultaLookUP('TPAIS','CODIGO',dbedt_cd_pais_dest_er.Text,'DESCRICAO')
end;

procedure Tfrm_manut_proc.btn_co_pais_dest_efClick(Sender: TObject);
begin
  if Not lAbertura then Edita;
  if Sender is TSpeedButton then
  begin
    if not PoeEmEdicao(datm_manut_proc.qry_proc_em_) then
    exit;
    If (Sender as TSpeedButton).Enabled Then
      datm_manut_proc.qry_proc_em_CD_PAIS_DESTINO.AsString := ConsultaOnLineEx('TPAIS','Países',['CODIGO','DESCRICAO'],['Código','Nome'],'CODIGO',frm_main.mi_cad_pais);
  end
  else dbedt_nm_pais_dest_ef.Text := ConsultaLookUP('TPAIS','CODIGO',dbedt_cd_pais_dest_ef.Text,'DESCRICAO')
end;

procedure Tfrm_manut_proc.btn_co_pais_origem_iaClick(Sender: TObject);
begin
  if Not lAbertura then Edita;
  if Sender is TSpeedButton then
  begin
    if not PoeEmEdicao(datm_manut_proc.qry_proc_im_) then
    exit;
    If (Sender as TSpeedButton).Enabled Then
      datm_manut_proc.qry_proc_im_CD_PAIS_ORIGEM.AsString := ConsultaOnLineEx('TPAIS','Países',['CODIGO','DESCRICAO'],['Código','Nome'],'CODIGO',nil, 1 ,dbedt_cd_pais_origem_ia.text)
  end
  else dbedt_nm_pais_origem_ia.Text := ConsultaLookUP('TPAIS','CODIGO',dbedt_cd_pais_origem_ia.Text,'DESCRICAO')
end;

procedure Tfrm_manut_proc.btn_co_pais_origem_irClick(Sender: TObject);
begin
  if Not lAbertura then Edita;
  if Sender is TSpeedButton then
  begin
    if not PoeEmEdicao(datm_manut_proc.qry_proc_im_) then
    exit;
    If (Sender as TSpeedButton).Enabled Then
      datm_manut_proc.qry_proc_im_CD_PAIS_ORIGEM.AsString := ConsultaOnLineEx('TPAIS','Países',['CODIGO','DESCRICAO'],['Código','Nome'],'CODIGO',nil)
  end
  else dbedt_nm_pais_origem_ir.Text := ConsultaLookUP('TPAIS','CODIGO',dbedt_cd_pais_origem_ir.Text,'DESCRICAO')
end;

procedure Tfrm_manut_proc.btn_co_pais_origem_ifClick(Sender: TObject);
begin
  if Not lAbertura then Edita;
  if Sender is TSpeedButton then
  begin
    if not PoeEmEdicao(datm_manut_proc.qry_proc_im_) then
    exit;
    If (Sender as TSpeedButton).Enabled Then
      datm_manut_proc.qry_proc_im_CD_PAIS_ORIGEM.AsString := ConsultaOnLineEx('TPAIS','Países',['CODIGO','DESCRICAO'],['Código','Nome'],'CODIGO',nil)
  end
  else dbedt_nm_pais_origem_if.Text := ConsultaLookUP('TPAIS','CODIGO',dbedt_cd_pais_origem_if.Text,'DESCRICAO')
end;

procedure Tfrm_manut_proc.btn_co_pais_origem_emClick(Sender: TObject);
begin
  if Not lAbertura then Edita;
  if Sender is TSpeedButton then
  begin
    if not PoeEmEdicao(datm_manut_proc.qry_proc_em_) then
    exit;
    If (Sender as TSpeedButton).Enabled Then
      datm_manut_proc.qry_proc_em_CD_PAIS_ORIGEM.AsString := ConsultaOnLineEx('TPAIS','Países',['CODIGO','DESCRICAO'],['Código','Nome'],'CODIGO',frm_main.mi_cad_pais,1, dbedt_cd_pais_origem_em.Text);
  end
  else dbedt_nm_pais_origem_em.Text := ConsultaLookUP('TPAIS','CODIGO',dbedt_cd_pais_origem_em.Text,'DESCRICAO')
end;

procedure Tfrm_manut_proc.btn_co_pais_origem_eaClick(Sender: TObject);
begin
  if Not lAbertura then Edita;
  if Sender is TSpeedButton then
  begin
    if not PoeEmEdicao(datm_manut_proc.qry_proc_em_) then
    exit;
    If (Sender as TSpeedButton).Enabled Then
      datm_manut_proc.qry_proc_em_CD_PAIS_ORIGEM.AsString := ConsultaOnLineEx('TPAIS','Países',['CODIGO','DESCRICAO'],['Código','Nome'],'CODIGO',frm_main.mi_cad_pais,1, dbedt_cd_pais_origem_ea.text);
  end
  else dbedt_nm_pais_origem_ea.Text := ConsultaLookUP('TPAIS','CODIGO',dbedt_cd_pais_origem_ea.Text,'DESCRICAO')
end;

procedure Tfrm_manut_proc.btn_co_pais_origem_erClick(Sender: TObject);
begin
  if Not lAbertura then Edita;
  if Sender is TSpeedButton then
  begin
    if not PoeEmEdicao(datm_manut_proc.qry_proc_em_) then
    exit;
    If (Sender as TSpeedButton).Enabled Then
      datm_manut_proc.qry_proc_em_CD_PAIS_ORIGEM.AsString := ConsultaOnLineEx('TPAIS','Países',['CODIGO','DESCRICAO'],['Código','Nome'],'CODIGO',frm_main.mi_cad_pais,1, dbedt_cd_pais_origem_er.text);
  end
  else dbedt_nm_pais_origem_er.Text := ConsultaLookUP('TPAIS','CODIGO',dbedt_cd_pais_origem_er.Text,'DESCRICAO')
end;

procedure Tfrm_manut_proc.btn_co_pais_origem_efClick(Sender: TObject);
begin
  if Not lAbertura then Edita;
  if Sender is TSpeedButton then
  begin
    if not PoeEmEdicao(datm_manut_proc.qry_proc_em_) then
    exit;
    If (Sender as TSpeedButton).Enabled Then
      datm_manut_proc.qry_proc_em_CD_PAIS_ORIGEM.AsString := ConsultaOnLineEx('TPAIS','Países',['CODIGO','DESCRICAO'],['Código','Nome'],'CODIGO',frm_main.mi_cad_pais);
  end
  else dbedt_nm_pais_origem_ef.Text := ConsultaLookUP('TPAIS','CODIGO',dbedt_cd_pais_origem_ef.Text,'DESCRICAO')
end;

procedure Tfrm_manut_proc.btn_co_moeda_mle_eaClick(Sender: TObject);
begin
  if Not lAbertura then Edita;
  if Sender is TSpeedButton then
  begin
    if not PoeEmEdicao(datm_manut_proc.qry_proc_em_) then
    exit;
    If (Sender as TSpeedButton).Enabled Then
      datm_manut_proc.qry_proc_em_CD_MOEDA_MLE.AsString := ConsultaOnLineEx('TMOEDA_BROKER','Moeda',['CD_MOEDA','NM_MOEDA'],['Código','Descrição'],'CD_MOEDA',frm_main.mi_cad_moeda, 1, dbedt_cd_moeda_mle_ea.text)
  end
  else dbedt_nm_moeda_mle_ea.Text := ConsultaLookUP('TMOEDA_BROKER','CD_MOEDA',dbedt_cd_moeda_mle_ea.Text,'NM_MOEDA')
end;

procedure Tfrm_manut_proc.btn_co_moeda_mle_erClick(Sender: TObject);
begin
  if Not lAbertura then Edita;
  If Sender is TSpeedButton Then
  Begin
    if not PoeEmEdicao(datm_manut_proc.qry_proc_em_) then
    exit;
    If (Sender as TSpeedButton).Enabled Then
      datm_manut_proc.qry_proc_em_CD_MOEDA_MLE.AsString := ConsultaOnLineEx('TMOEDA_BROKER','Moeda',['CD_MOEDA','NM_MOEDA'],['Código','Descrição'],'CD_MOEDA',frm_main.mi_cad_moeda,1, dbedt_cd_moeda_mle_er.text)
  End
  Else dbedt_nm_moeda_mle_er.Text := ConsultaLookUP('TMOEDA_BROKER','CD_MOEDA',dbedt_cd_moeda_mle_er.Text,'NM_MOEDA')
end;

procedure Tfrm_manut_proc.btn_co_moeda_mle_efClick(Sender: TObject);
begin
  if Not lAbertura then Edita;
  if Sender is TSpeedButton then
  begin
    if not PoeEmEdicao(datm_manut_proc.qry_proc_em_) then
    exit;
    If (Sender as TSpeedButton).Enabled Then
      datm_manut_proc.qry_proc_em_CD_MOEDA_MLE.AsString := ConsultaOnLineEx('TMOEDA_BROKER','Moeda',['CD_MOEDA','NM_MOEDA'],['Código','Descrição'],'CD_MOEDA',frm_main.mi_cad_moeda)
  end
  else dbedt_nm_moeda_mle_ef.Text := ConsultaLookUP('TMOEDA_BROKER','CD_MOEDA',dbedt_cd_moeda_mle_ef.Text,'NM_MOEDA')
end;

procedure Tfrm_manut_proc.btn_co_contato_iaClick(Sender: TObject);
begin
  if Not lAbertura then Edita;
  if Sender is TSpeedButton then
  begin
    If Not PoeEmEdicao(datm_manut_proc.qry_proc_im_) Then
    Exit;
    If (Sender as TSpeedButton).Enabled Then
      datm_manut_proc.qry_proc_im_CD_CONTATO.AsString := ConsultaOnLineExSQL('SELECT CD_CONTATO, NM_CONTATO FROM TCLIENTE_CONTATO (NOLOCK) WHERE CD_CLIENTE = ''' + dbedt_cd_cliente.Text + ''' and CD_UNID_NEG = ''' + msk_cd_unid_neg.Text + ''' AND CD_PRODUTO    = ''' + msk_cd_produto.Text + '''',
                                                                             'Contatos', ['CD_CONTATO', 'NM_CONTATO'], ['Código', 'Descrição'], 'CD_CONTATO', nil, dbedt_cd_contato_ia.text);
  end
  else dbedt_nm_contato_ia.Text := ConsultaLookUPSQL('SELECT NM_CONTATO FROM TCLIENTE_CONTATO (NOLOCK) WHERE CD_CLIENTE = ''' + dbedt_cd_cliente.Text + ''' and CD_UNID_NEG = ''' + msk_cd_unid_neg.Text + ''' AND CD_PRODUTO    = ''' + msk_cd_produto.Text + ''' and CD_CONTATO = ''' + dbedt_cd_contato_ia.Text + '''','NM_CONTATO');
end;

procedure Tfrm_manut_proc.btn_co_contato_irClick(Sender: TObject);
begin
  if Not lAbertura then Edita;
  if Sender is TSpeedButton then
  begin
    If Not PoeEmEdicao(datm_manut_proc.qry_proc_im_) Then
    Exit;
    If (Sender as TSpeedButton).Enabled Then
      datm_manut_proc.qry_proc_im_CD_CONTATO.AsString := ConsultaOnLineExSQL('SELECT CD_CONTATO, NM_CONTATO FROM TCLIENTE_CONTATO (NOLOCK) WHERE CD_CLIENTE = ''' + dbedt_cd_cliente.Text + ''' and CD_UNID_NEG = ''' + msk_cd_unid_neg.Text + ''' AND CD_PRODUTO    = ''' + msk_cd_produto.Text + '''',
                                                                             'Contatos', ['CD_CONTATO', 'NM_CONTATO'], ['Código', 'Descrição'], 'CD_CONTATO', nil);
  end
  else dbedt_nm_contato_ir.Text := ConsultaLookUPSQL('SELECT NM_CONTATO FROM TCLIENTE_CONTATO (NOLOCK) WHERE CD_CLIENTE = ''' + dbedt_cd_cliente.Text + ''' and CD_UNID_NEG = ''' + msk_cd_unid_neg.Text + ''' AND CD_PRODUTO    = ''' + msk_cd_produto.Text + ''' and CD_CONTATO = ''' + dbedt_cd_contato_ir.Text + '''','NM_CONTATO');
end;

procedure Tfrm_manut_proc.btn_co_contato_ifClick(Sender: TObject);
begin
  if Not lAbertura then Edita;
  if Sender is TSpeedButton then
  begin
    If Not PoeEmEdicao(datm_manut_proc.qry_proc_im_) Then
    Exit;
    If (Sender as TSpeedButton).Enabled Then
      datm_manut_proc.qry_proc_im_CD_CONTATO.AsString := ConsultaOnLineExSQL('SELECT CD_CONTATO, NM_CONTATO FROM TCLIENTE_CONTATO (NOLOCK) WHERE CD_CLIENTE = ''' + dbedt_cd_cliente.Text + ''' and CD_UNID_NEG = ''' + msk_cd_unid_neg.Text + ''' AND CD_PRODUTO    = ''' + msk_cd_produto.Text + '''',
                                                                             'Contatos', ['CD_CONTATO', 'NM_CONTATO'], ['Código', 'Descrição'], 'CD_CONTATO', nil);
  end
  else dbedt_nm_contato_if.Text := ConsultaLookUPSQL('SELECT NM_CONTATO FROM TCLIENTE_CONTATO (NOLOCK) WHERE CD_CLIENTE = ''' + dbedt_cd_cliente.Text + ''' and CD_UNID_NEG = ''' + msk_cd_unid_neg.Text + ''' AND CD_PRODUTO    = ''' + msk_cd_produto.Text + ''' and CD_CONTATO = ''' + dbedt_cd_contato_if.Text + '''','NM_CONTATO');
end;

procedure Tfrm_manut_proc.btn_co_contato_emClick(Sender: TObject);
begin
  if Not lAbertura then Edita;
  with datm_manut_proc Do
  begin
    if Sender is TSpeedButton then
    begin
      If Not PoeEmEdicao(qry_proc_em_) Then
      Exit;
      If (Sender as TSpeedButton).Enabled Then
        qry_proc_em_CD_CONTATO.AsString := ConsultaOnLineExSQL('SELECT CD_CONTATO, NM_CONTATO FROM TCLIENTE_CONTATO (NOLOCK)WHERE CD_CLIENTE = ''' + qry_processo_.FieldByName('CD_CLIENTE').AsString + ''' and CD_UNID_NEG = ''' + qry_processo_.FieldByName('CD_UNID_NEG').AsString + ''' AND CD_PRODUTO    = ''' + qry_processo_.FieldByName('CD_PRODUTO').AsString + '''',
                                                               'Contatos', ['CD_CONTATO', 'NM_CONTATO'], ['Código', 'Descrição'], 'CD_CONTATO', nil, dbedt_cd_contato_em.text);
    end
    else dbedt_nm_contato_em.Text := ConsultaLookUPSQL('SELECT NM_CONTATO FROM TCLIENTE_CONTATO (NOLOCK) WHERE CD_CLIENTE = ''' + qry_processo_.FieldByName('CD_CLIENTE').AsString + ''' and CD_UNID_NEG = ''' + qry_processo_.FieldByName('CD_UNID_NEG').AsString + ''' AND CD_PRODUTO = ''' + qry_processo_.FieldByName('CD_PRODUTO').AsString + ''' and CD_CONTATO = ''' + dbedt_cd_contato_em.Text + '''','NM_CONTATO');
  end;
end;

procedure Tfrm_manut_proc.btn_co_contato_eaClick(Sender: TObject);
begin
  if Not lAbertura then Edita;
  With datm_manut_proc Do
  Begin
    if Sender is TSpeedButton then
    begin
      If Not PoeEmEdicao(qry_proc_em_) Then
      Exit;
      If (Sender as TSpeedButton).Enabled Then
        qry_proc_em_CD_CONTATO.AsString := ConsultaOnLineExSQL('SELECT CD_CONTATO, NM_CONTATO FROM TCLIENTE_CONTATO (NOLOCK) WHERE CD_CLIENTE = ''' + qry_processo_.FieldByName('CD_CLIENTE').AsString + ''' and CD_UNID_NEG = ''' + qry_processo_.FieldByName('CD_UNID_NEG').AsString + ''' AND CD_PRODUTO    = ''' + qry_processo_.FieldByName('CD_PRODUTO').AsString + '''',
                                                               'Contatos', ['CD_CONTATO', 'NM_CONTATO'], ['Código', 'Descrição'], 'CD_CONTATO', nil, dbedt_cd_contato_ea.text);
    end
    else dbedt_nm_contato_ea.Text := ConsultaLookUPSQL('SELECT NM_CONTATO FROM TCLIENTE_CONTATO (NOLOCK) WHERE CD_CLIENTE = ''' + qry_processo_.FieldByName('CD_CLIENTE').AsString + ''' and CD_UNID_NEG = ''' + qry_processo_.FieldByName('CD_UNID_NEG').AsString + ''' AND CD_PRODUTO = ''' + qry_processo_.FieldByName('CD_PRODUTO').AsString + ''' and CD_CONTATO = ''' + dbedt_cd_contato_ea.Text + '''','NM_CONTATO');
  End;
end;

procedure Tfrm_manut_proc.btn_co_contato_erClick(Sender: TObject);
begin
  if Not lAbertura then Edita;
  With datm_manut_proc Do
  Begin
    If Sender Is TSpeedButton Then
    Begin
      If Not PoeEmEdicao(qry_proc_em_) Then
      Exit;
      If (Sender as TSpeedButton).Enabled Then
        qry_proc_em_CD_CONTATO.AsString := ConsultaOnLineExSQL('SELECT CD_CONTATO, NM_CONTATO FROM TCLIENTE_CONTATO (NOLOCK) WHERE CD_CLIENTE = ''' + qry_processo_.FieldByName('CD_CLIENTE').AsString + ''' and CD_UNID_NEG = ''' + qry_processo_.FieldByName('CD_UNID_NEG').AsString + ''' AND CD_PRODUTO    = ''' + qry_processo_.FieldByName('CD_PRODUTO').AsString + '''',
                                                               'Contatos', ['CD_CONTATO', 'NM_CONTATO'], ['Código', 'Descrição'], 'CD_CONTATO', nil, dbedt_cd_contato_er.text);
    End
    Else dbedt_nm_contato_er.Text := ConsultaLookUPSQL('SELECT NM_CONTATO FROM TCLIENTE_CONTATO (NOLOCK) WHERE CD_CLIENTE = ''' + qry_processo_.FieldByName('CD_CLIENTE').AsString + ''' and CD_UNID_NEG = ''' + qry_processo_.FieldByName('CD_UNID_NEG').AsString + ''' AND CD_PRODUTO = ''' + qry_processo_.FieldByName('CD_PRODUTO').AsString + ''' and CD_CONTATO = ''' + dbedt_cd_contato_er.Text + '''','NM_CONTATO');
  End;
end;

procedure Tfrm_manut_proc.btn_co_banco_emClick(Sender: TObject);
begin
  if Not lAbertura then Edita;
  if Sender is TSpeedButton then
  begin
    If Not PoeEmEdicao(datm_manut_proc.qry_proc_em_) Then
    Exit;
    If (Sender as TSpeedButton).Enabled Then
      datm_manut_proc.qry_proc_em_CD_BANCO_EXP.AsString := ConsultaOnLineExSQL('SELECT EE.CD_EMPRESA, EE.NM_EMPRESA, EE.AP_EMPRESA,(SELECT RTRIM(LTRIM(NM_PAIS)) + '' '' FROM TPAIS_BROKER (NOLOCK) WHERE CD_PAIS = EE.CD_PAIS) AS PAIS, ' +
                    'RTRIM(LTRIM(EE.END_CIDADE)) AS END_CIDADE, ISNULL(RTRIM(LTRIM(EE.END_EMPRESA)), '''') + '' '' + ISNULL(RTRIM(LTRIM(EE.END_NUMERO)), '''') + '' '' + ISNULL(RTRIM(LTRIM(EE.END_COMPL)), '''') AS ENDERECO ' +
                    'FROM TEMPRESA_EST EE (NOLOCK) ' +
                    'WHERE EE.IN_BANCO = ''1'' AND EE.IN_ATIVO = ''1'' ',
                    'Banco',['CD_EMPRESA', 'NM_EMPRESA', 'AP_EMPRESA', 'PAIS', 'END_CIDADE', 'ENDERECO'],['Código', 'Nome', 'Apelido', 'País', 'Cidade', 'Endereço'],
                    'CD_EMPRESA',
                    nil, dbedt_cd_banco_em.text);
  end
  else dbedt_nm_banco_em.Text := ConsultaLookUPSQL('SELECT NM_EMPRESA FROM TEMPRESA_EST (NOLOCK) WHERE IN_BANCO = 1 and CD_EMPRESA = ''' + dbedt_cd_banco_em.Text + '''','NM_EMPRESA');
end;

procedure Tfrm_manut_proc.btn_co_banco_erClick(Sender: TObject);
begin
  if Not lAbertura then Edita;
  if Sender is TSpeedButton then
  begin
    If Not PoeEmEdicao(datm_manut_proc.qry_proc_em_) Then
    Exit;
    If (Sender as TSpeedButton).Enabled Then
      datm_manut_proc.qry_proc_em_CD_BANCO_EXP.AsString := ConsultaOnLineExSQL(
                    'SELECT EE.CD_EMPRESA, EE.NM_EMPRESA, EE.AP_EMPRESA,(SELECT RTRIM(LTRIM(NM_PAIS)) + '' '' FROM TPAIS_BROKER (NOLOCK) WHERE CD_PAIS = EE.CD_PAIS) AS PAIS, ' +
                    'RTRIM(LTRIM(EE.END_CIDADE)) AS END_CIDADE, ISNULL(RTRIM(LTRIM(EE.END_EMPRESA)), '''') + '' '' + ISNULL(RTRIM(LTRIM(EE.END_NUMERO)), '''') + '' '' + ISNULL(RTRIM(LTRIM(EE.END_COMPL)), '''') AS ENDERECO ' +
                    'FROM TEMPRESA_EST EE (NOLOCK) ' +
                    'WHERE EE.IN_BANCO = ''1'' AND EE.IN_ATIVO = ''1'' ',
                    'Banco',['CD_EMPRESA', 'NM_EMPRESA', 'AP_EMPRESA', 'PAIS', 'END_CIDADE', 'ENDERECO'],['Código', 'Nome', 'Apelido', 'País', 'Cidade', 'Endereço'],
                    'CD_EMPRESA',
                    nil, dbedt_cd_banco_er.text);
  end
  else dbedt_nm_banco_er.Text := ConsultaLookUPSQL('SELECT NM_EMPRESA FROM TEMPRESA_EST (NOLOCK) WHERE IN_BANCO = 1 and CD_EMPRESA = ''' + dbedt_cd_banco_er.Text + '''','NM_EMPRESA');
end;

procedure Tfrm_manut_proc.btn_co_banco_efClick(Sender: TObject);
begin
  if Not lAbertura then Edita;
  if Sender is TSpeedButton then
  begin
    If Not PoeEmEdicao(datm_manut_proc.qry_proc_em_) Then
    Exit;
    If (Sender as TSpeedButton).Enabled Then
      datm_manut_proc.qry_proc_em_CD_BANCO_EXP.AsString := ConsultaOnLineExSQL('SELECT EE.CD_EMPRESA, EE.NM_EMPRESA, EE.AP_EMPRESA,(SELECT RTRIM(LTRIM(NM_PAIS)) + '' '' FROM TPAIS_BROKER (NOLOCK) WHERE CD_PAIS = EE.CD_PAIS) AS PAIS, ' +
                    'RTRIM(LTRIM(EE.END_CIDADE)) AS END_CIDADE, ISNULL(RTRIM(LTRIM(EE.END_EMPRESA)), '''') + '' '' + ISNULL(RTRIM(LTRIM(EE.END_NUMERO)), '''') + '' '' + ISNULL(RTRIM(LTRIM(EE.END_COMPL)), '''') AS ENDERECO ' +
                    'FROM TEMPRESA_EST EE (NOLOCK) ' +
                    'WHERE EE.IN_BANCO = ''1'' AND EE.IN_ATIVO = ''1'' ',
                    'Banco',['CD_EMPRESA', 'NM_EMPRESA', 'AP_EMPRESA', 'PAIS', 'END_CIDADE', 'ENDERECO'],['Código', 'Nome', 'Apelido', 'País', 'Cidade', 'Endereço'],
                    'CD_EMPRESA',
                    nil);
  end
  else dbedt_nm_banco_ef.Text := ConsultaLookUPSQL('SELECT NM_EMPRESA FROM TEMPRESA_EST (NOLOCK) WHERE IN_BANCO = 1 and CD_EMPRESA = ''' + dbedt_cd_banco_ef.Text + '''','NM_EMPRESA');
end;

procedure Tfrm_manut_proc.dblckpbox_tp_banco_emClick(Sender: TObject);
begin
  with datm_manut_proc do
  begin
    dbedt_cd_clienteChange(nil);

    if qry_proc_em_.State in [dsEdit, dsInsert] then
    begin
      qry_proc_em_CD_BANCO_EXP.AsString := '';
      dbedt_nm_banco_em.Text            := '';
      if dblckpbox_tp_banco_em.KeyValue = '0' then  // em branco
      begin
        dbedt_cd_banco_em.ReadOnly := True;
        dbedt_cd_banco_em.TabStop  := False;
        dbedt_cd_banco_em.Color    := clMenu;
        btn_co_banco_em.Enabled    := False;
      end
      else   // Fechamento de Cambio / Carta de Credito
      begin
        dbedt_cd_banco_em.ReadOnly := False;
        dbedt_cd_banco_em.TabStop  := True;
        dbedt_cd_banco_em.Color    := clWindow;
        btn_co_banco_em.Enabled    := True;
      end;
    end;
  end;
end;

procedure Tfrm_manut_proc.dblckpbox_tp_banco_erClick(Sender: TObject);
begin
  with datm_manut_proc do
  begin
    dbedt_cd_clienteChange(nil);

    if qry_proc_em_.State in [dsEdit, dsInsert] then
    begin
      qry_proc_em_CD_BANCO_EXP.AsString := '';
      dbedt_nm_banco_er.Text    := '';
      if dblckpbox_tp_banco_er.KeyValue = '0' then  // em branco
      begin
        dbedt_cd_banco_er.ReadOnly := True;
        dbedt_cd_banco_er.TabStop  := False;
        dbedt_cd_banco_er.Color    := clMenu;
        btn_co_banco_er.Enabled    := False;
      end
      else   // Fechamento de Cambio / Carta de Credito
      begin
        dbedt_cd_banco_er.ReadOnly := False;
        dbedt_cd_banco_er.TabStop  := True;
        dbedt_cd_banco_er.Color    := clWindow;
        btn_co_banco_er.Enabled    := True;
      end;
    end;
  end;
end;

procedure Tfrm_manut_proc.dblckpbox_tp_banco_efClick(Sender: TObject);
begin
  with datm_manut_proc do
  begin
    dbedt_cd_clienteChange(nil);

    if qry_proc_em_.State in [dsEdit, dsInsert] then
    begin
      qry_proc_em_CD_BANCO_EXP.AsString := '';
      dbedt_nm_banco_ef.Text    := '';
      if dblckpbox_tp_banco_ef.KeyValue = '0' then  // em branco
      begin
        dbedt_cd_banco_ef.ReadOnly := True;
        dbedt_cd_banco_ef.TabStop  := False;
        dbedt_cd_banco_ef.Color    := clMenu;
        btn_co_banco_ef.Enabled    := False;
      end
      else   // Fechamento de Cambio / Carta de Credito
      begin
        dbedt_cd_banco_ef.ReadOnly := False;
        dbedt_cd_banco_ef.TabStop  := True;
        dbedt_cd_banco_ef.Color    := clWindow;
        btn_co_banco_ef.Enabled    := True;
      end;
    end;
  end;
end;

procedure Tfrm_manut_proc.btn_co_agente_seg_eaClick(Sender: TObject);
begin
  if Not lAbertura then Edita;
  if Sender is TSpeedButton then
  begin
    If Not PoeEmEdicao(datm_manut_proc.qry_proc_em_) Then
    Exit;
    If (Sender as TSpeedButton).Enabled Then
      datm_manut_proc.qry_proc_em_CD_AGENTE_SEGURO.AsString := ConsultaOnLineExSQL('SELECT CD_EMPRESA, NM_EMPRESA FROM TEMPRESA_EST (NOLOCK) WHERE IN_AGENTE = 1',
                                                                             'Agente de Seguro', ['CD_EMPRESA', 'NM_EMPRESA'], ['Código', 'Descrição'], 'CD_EMPRESA', nil, dbedt_cd_agente_seg_ea.text);
  end
  else dbedt_nm_agente_seg_ea.Text := ConsultaLookUPSQL('SELECT NM_EMPRESA FROM TEMPRESA_EST (NOLOCK) WHERE IN_AGENTE = 1 and CD_EMPRESA = ''' + dbedt_cd_agente_seg_ea.Text + '''','NM_EMPRESA');
end;

procedure Tfrm_manut_proc.btn_co_agente_seg_erClick(Sender: TObject);
begin
  if Not lAbertura then Edita;
  if Sender is TSpeedButton then
  begin
    If Not PoeEmEdicao(datm_manut_proc.qry_proc_em_) Then
    Exit;
    If (Sender as TSpeedButton).Enabled Then
      datm_manut_proc.qry_proc_em_CD_AGENTE_SEGURO.AsString := ConsultaOnLineExSQL('SELECT CD_EMPRESA, NM_EMPRESA FROM TEMPRESA_EST (NOLOCK) WHERE IN_AGENTE = 1',
                                                                             'Agente de Seguro', ['CD_EMPRESA', 'NM_EMPRESA'], ['Código', 'Descrição'], 'CD_EMPRESA', nil, dbedt_cd_agente_seg_er.text);
  end
  else dbedt_nm_agente_seg_er.Text := ConsultaLookUPSQL('SELECT NM_EMPRESA FROM TEMPRESA_EST (NOLOCK) WHERE IN_AGENTE = 1 and CD_EMPRESA = ''' + dbedt_cd_agente_seg_er.Text + '''','NM_EMPRESA');
end;

procedure Tfrm_manut_proc.btn_co_agente_seg_efClick(Sender: TObject);
begin
  if Not lAbertura then Edita;
  if Sender is TSpeedButton then
  begin
    If Not PoeEmEdicao(datm_manut_proc.qry_proc_em_) Then
    Exit;
    If (Sender as TSpeedButton).Enabled Then
      datm_manut_proc.qry_proc_em_CD_AGENTE_SEGURO.AsString := ConsultaOnLineExSQL('SELECT CD_EMPRESA, NM_EMPRESA FROM TEMPRESA_EST (NOLOCK) WHERE IN_AGENTE = 1',
                                                                           'Agente de Seguro', ['CD_EMPRESA', 'NM_EMPRESA'], ['Código', 'Descrição'], 'CD_EMPRESA', nil);
  end
  else dbedt_nm_agente_seg_ef.Text := ConsultaLookUPSQL('SELECT NM_EMPRESA FROM TEMPRESA_EST (NOLOCK) WHERE IN_AGENTE = 1 and CD_EMPRESA = ''' + dbedt_cd_agente_seg_ef.Text + '''','NM_EMPRESA');
end;

procedure Tfrm_manut_proc.dblckpbox_tp_frete_iaClick(Sender: TObject);
begin
  with datm_manut_proc do
  begin
    if qry_proc_im_.State in [dsEdit, dsInsert] then
    begin
      if dblckpbox_tp_frete_ia.KeyValue = '' then  // em branco
      begin
        dbedt_vl_frete_collect_ia.Enabled := False;
        dbedt_vl_frete_collect_ia.TabStop := False;
        dbedt_vl_frete_collect_ia.Color   := clMenu;

        dbedt_vl_frete_prepaid_ia.Enabled := False;
        dbedt_vl_frete_prepaid_ia.TabStop := False;
        dbedt_vl_frete_prepaid_ia.Color   := clMenu;

        qry_proc_im_VL_FRETE_COLLECT_MNEG.AsFloat := 0;
        qry_proc_im_VL_FRETE_PREPAID_MNEG.AsFloat := 0;
      end
      else if dblckpbox_tp_frete_ia.KeyValue = '0' then  // Collect
      begin
        dbedt_vl_frete_collect_ia.Enabled := True;
        dbedt_vl_frete_collect_ia.TabStop := True;
        dbedt_vl_frete_collect_ia.Color   := clWindow;

        dbedt_vl_frete_prepaid_ia.Enabled := False;
        dbedt_vl_frete_prepaid_ia.TabStop := False;
        dbedt_vl_frete_prepaid_ia.Color   := clMenu;

        qry_proc_im_VL_FRETE_PREPAID_MNEG.AsFloat := 0;
      end
      else if dblckpbox_tp_frete_ia.KeyValue = '1' then  //Prepaid
      begin
        dbedt_vl_frete_collect_ia.Enabled := False;
        dbedt_vl_frete_collect_ia.TabStop := False;
        dbedt_vl_frete_collect_ia.Color   := clMenu;

        dbedt_vl_frete_prepaid_ia.Enabled := True;
        dbedt_vl_frete_prepaid_ia.TabStop := True;
        dbedt_vl_frete_prepaid_ia.Color   := clWindow;

        qry_proc_im_VL_FRETE_COLLECT_MNEG.AsFloat := 0;
      end;
      dbedt_cd_clienteChange(nil);
    end;
  end
end;

procedure Tfrm_manut_proc.dblckpbox_tp_frete_imClick(Sender: TObject);
begin
  with datm_manut_proc do
  begin
    if qry_proc_im_.State in [dsEdit, dsInsert] then
    begin
      if dblckpbox_tp_frete_im.KeyValue = '' then  // em branco
      begin
        dbedt_vl_frete_collect_im.Enabled := False;
        dbedt_vl_frete_collect_im.TabStop := False;
        dbedt_vl_frete_collect_im.Color   := clMenu;

        dbedt_vl_frete_prepaid_im.Enabled := False;
        dbedt_vl_frete_prepaid_im.TabStop := False;
        dbedt_vl_frete_prepaid_im.Color   := clMenu;

        qry_proc_im_VL_FRETE_COLLECT_MNEG.AsFloat := 0;
        qry_proc_im_VL_FRETE_PREPAID_MNEG.AsFloat := 0;
      end
      else if dblckpbox_tp_frete_im.KeyValue = '0' then  // Collect
      begin
        dbedt_vl_frete_collect_im.Enabled := True;
        dbedt_vl_frete_collect_im.TabStop := True;
        dbedt_vl_frete_collect_im.Color   := clWindow;

        dbedt_vl_frete_prepaid_im.Enabled := False;
        dbedt_vl_frete_prepaid_im.TabStop := False;
        dbedt_vl_frete_prepaid_im.Color   := clMenu;

        qry_proc_im_VL_FRETE_PREPAID_MNEG.AsFloat := 0;
      end
      else if dblckpbox_tp_frete_im.KeyValue = '1' then  //Prepaid
      begin
        dbedt_vl_frete_collect_im.Enabled := False;
        dbedt_vl_frete_collect_im.TabStop := False;
        dbedt_vl_frete_collect_im.Color   := clMenu;

        dbedt_vl_frete_prepaid_im.Enabled := True;
        dbedt_vl_frete_prepaid_im.TabStop := True;
        dbedt_vl_frete_prepaid_im.Color   := clWindow;

        qry_proc_im_VL_FRETE_COLLECT_MNEG.AsFloat := 0;
      end;
      dbedt_cd_clienteChange(nil);
    end;
  end;
end;

procedure Tfrm_manut_proc.dblckpbox_tp_frete_irClick(Sender: TObject);
begin
  with datm_manut_proc do
  begin
    if qry_proc_im_.State in [dsEdit, dsInsert] then
    begin
      if dblckpbox_tp_frete_ir.KeyValue = '' then  // em branco
      begin
        dbedt_vl_frete_collect_ir.Enabled := False;
        dbedt_vl_frete_collect_ir.TabStop := False;
        dbedt_vl_frete_collect_ir.Color   := clMenu;

        dbedt_vl_frete_prepaid_ir.Enabled := False;
        dbedt_vl_frete_prepaid_ir.TabStop := False;
        dbedt_vl_frete_prepaid_ir.Color   := clMenu;

        dbedt_vl_frete_tnac_ir.Enabled    := False;
        dbedt_vl_frete_tnac_ir.TabStop    := False;
        dbedt_vl_frete_tnac_ir.Color      := clMenu;

        qry_proc_im_VL_FRETE_COLLECT_MNEG.AsFloat := 0;
        qry_proc_im_VL_FRETE_PREPAID_MNEG.AsFloat := 0;
      end
      else if dblckpbox_tp_frete_ir.KeyValue = '0' then  // Collect
      begin
        dbedt_vl_frete_collect_ir.Enabled := True;
        dbedt_vl_frete_collect_ir.TabStop := True;
        dbedt_vl_frete_collect_ir.Color   := clWindow;

        dbedt_vl_frete_prepaid_ir.Enabled := False;
        dbedt_vl_frete_prepaid_ir.TabStop := False;
        dbedt_vl_frete_prepaid_ir.Color   := clMenu;

        dbedt_vl_frete_tnac_ir.Enabled    := False;
        dbedt_vl_frete_tnac_ir.TabStop    := False;
        dbedt_vl_frete_tnac_ir.Color      := clMenu;

        qry_proc_im_VL_FRETE_PREPAID_MNEG.AsFloat := 0;
      end
      else if dblckpbox_tp_frete_ir.KeyValue = '1' then  // Prepaid
      begin
        dbedt_vl_frete_collect_ir.Enabled := False;
        dbedt_vl_frete_collect_ir.TabStop := False;
        dbedt_vl_frete_collect_ir.Color   := clMenu;

        dbedt_vl_frete_prepaid_ir.Enabled := True;
        dbedt_vl_frete_prepaid_ir.TabStop := True;
        dbedt_vl_frete_prepaid_ir.Color   := clWindow;

        dbedt_vl_frete_tnac_ir.Enabled    := True;
        dbedt_vl_frete_tnac_ir.TabStop    := True;
        dbedt_vl_frete_tnac_ir.Color      := clWindow;

        qry_proc_im_VL_FRETE_COLLECT_MNEG.AsFloat := 0;
      end;
      dbedt_cd_clienteChange(nil);
    end;
  end
end;

procedure Tfrm_manut_proc.dblckpbox_tp_frete_ifClick(Sender: TObject);
begin
  with datm_manut_proc do
  begin
    if qry_proc_im_.State in [dsEdit, dsInsert] then
    begin
      if dblckpbox_tp_frete_if.KeyValue = '' then  // em branco
      begin
        dbedt_vl_frete_collect_if.Enabled := False;
        dbedt_vl_frete_collect_if.TabStop := False;
        dbedt_vl_frete_collect_if.Color   := clMenu;

        dbedt_vl_frete_prepaid_if.Enabled := False;
        dbedt_vl_frete_prepaid_if.TabStop := False;
        dbedt_vl_frete_prepaid_if.Color   := clMenu;

        dbedt_vl_frete_tnac_if.Enabled    := False;
        dbedt_vl_frete_tnac_if.TabStop    := False;
        dbedt_vl_frete_tnac_if.Color      := clMenu;

        qry_proc_im_VL_FRETE_COLLECT_MNEG.AsFloat := 0;
        qry_proc_im_VL_FRETE_PREPAID_MNEG.AsFloat := 0;
      end
      else if dblckpbox_tp_frete_if.KeyValue = '0' then  // Collect
      begin
        dbedt_vl_frete_collect_if.Enabled := True;
        dbedt_vl_frete_collect_if.TabStop := True;
        dbedt_vl_frete_collect_if.Color   := clWindow;

        dbedt_vl_frete_prepaid_if.Enabled := False;
        dbedt_vl_frete_prepaid_if.TabStop := False;
        dbedt_vl_frete_prepaid_if.Color   := clMenu;

        dbedt_vl_frete_tnac_if.Enabled    := False;
        dbedt_vl_frete_tnac_if.TabStop    := False;
        dbedt_vl_frete_tnac_if.Color      := clMenu;

        qry_proc_im_VL_FRETE_PREPAID_MNEG.AsFloat := 0;
      end
      else if dblckpbox_tp_frete_if.KeyValue = '1' then  // Prepaid
      begin
        dbedt_vl_frete_collect_if.Enabled := False;
        dbedt_vl_frete_collect_if.TabStop := False;
        dbedt_vl_frete_collect_if.Color   := clMenu;

        dbedt_vl_frete_prepaid_if.Enabled := True;
        dbedt_vl_frete_prepaid_if.TabStop := True;
        dbedt_vl_frete_prepaid_if.Color   := clWindow;

        dbedt_vl_frete_tnac_if.Enabled    := True;
        dbedt_vl_frete_tnac_if.TabStop    := True;
        dbedt_vl_frete_tnac_if.Color      := clWindow;

        qry_proc_im_VL_FRETE_COLLECT_MNEG.AsFloat := 0;
      end;
      dbedt_cd_clienteChange(nil);
    end;
  end;
end;

procedure Tfrm_manut_proc.dblckpbox_tp_frete_efClick(Sender: TObject);
begin
  with datm_manut_proc do
  begin
    if qry_proc_em_.State in [dsEdit, dsInsert] then
    begin
      if dblckpbox_tp_frete_ef.KeyValue = '' then  // em branco
      begin
        dbedt_vl_frete_collect_ef.Enabled := False;
        dbedt_vl_frete_collect_ef.TabStop := False;
        dbedt_vl_frete_collect_ef.Color   := clMenu;

        dbedt_vl_frete_prepaid_ef.Enabled := False;
        dbedt_vl_frete_prepaid_ef.TabStop := False;
        dbedt_vl_frete_prepaid_ef.Color   := clMenu;

        qry_proc_em_VL_FRETE_COLLECT_MNEG.AsFloat := 0;
        qry_proc_em_VL_FRETE_PREPAID_MNEG.AsFloat := 0;
      end
      else if dblckpbox_tp_frete_ef.KeyValue = '0' then  // Collect
      begin
        dbedt_vl_frete_collect_ef.Enabled := True;
        dbedt_vl_frete_collect_ef.TabStop := True;
        dbedt_vl_frete_collect_ef.Color   := clWindow;

        dbedt_vl_frete_prepaid_ef.Enabled := False;
        dbedt_vl_frete_prepaid_ef.TabStop := False;
        dbedt_vl_frete_prepaid_ef.Color   := clMenu;

        qry_proc_em_VL_FRETE_PREPAID_MNEG.AsFloat := 0;
      end
      else if dblckpbox_tp_frete_ef.KeyValue = '1' then  // Prepaid
      begin
        dbedt_vl_frete_collect_ef.Enabled := False;
        dbedt_vl_frete_collect_ef.TabStop := False;
        dbedt_vl_frete_collect_ef.Color   := clMenu;

        dbedt_vl_frete_prepaid_ef.Enabled := True;
        dbedt_vl_frete_prepaid_ef.TabStop := True;
        dbedt_vl_frete_prepaid_ef.Color   := clWindow;

        qry_proc_em_VL_FRETE_COLLECT_MNEG.AsFloat := 0;
      end;
      dbedt_cd_clienteChange(nil);
    end;
  end;
end;

procedure Tfrm_manut_proc.btn_co_contato_efClick(Sender: TObject);
begin
  if Not lAbertura then Edita;
  With datm_manut_proc Do
  Begin
    if Sender is TSpeedButton then
    begin
      If Not PoeEmEdicao(qry_proc_em_) Then Exit;
      If (Sender as TSpeedButton).Enabled Then
        qry_proc_em_CD_CONTATO.AsString := ConsultaOnLineExSQL('SELECT CD_CONTATO, NM_CONTATO FROM TCLIENTE_CONTATO (NOLOCK) WHERE CD_CLIENTE = ''' + qry_processo_.FieldByName('CD_CLIENTE').AsString + ''' and CD_UNID_NEG = ''' + qry_processo_.FieldByName('CD_UNID_NEG').AsString + ''' AND CD_PRODUTO    = ''' + qry_processo_.FieldByName('CD_PRODUTO').AsString + '''',
                                                               'Contatos', ['CD_CONTATO', 'NM_CONTATO'], ['Código', 'Descrição'], 'CD_CONTATO', nil);
    end
    else dbedt_nm_contato_ef.Text := ConsultaLookUPSQL('SELECT NM_CONTATO FROM TCLIENTE_CONTATO (NOLOCK) WHERE CD_CLIENTE = ''' + qry_processo_.FieldByName('CD_CLIENTE').AsString + ''' and CD_UNID_NEG = ''' + qry_processo_.FieldByName('CD_UNID_NEG').AsString + ''' AND CD_PRODUTO = ''' + qry_processo_.FieldByName('CD_PRODUTO').AsString + ''' and CD_CONTATO = ''' + dbedt_cd_contato_ef.Text + '''','NM_CONTATO');
  End;
end;

procedure Tfrm_manut_proc.btn_co_amz_des_irClick(Sender: TObject);
begin
  if Not lAbertura then Edita;
  if Sender is TSpeedButton then
  begin
    if not PoeEmEdicao(datm_manut_proc.qry_proc_im_) then exit;
    If (Sender as TSpeedButton).Enabled Then
      datm_manut_proc.qry_proc_im_CD_ARMAZEM_DESCARGA.AsString := ConsultaOnLineEx('TARMAZEM','Armazém',['CD_ARMAZEM','NM_ARMAZEM','NM_SIGLA','CD_RECINTO'],['Código','Nome','Sigla','Recinto'],'CD_ARMAZEM',frm_main.mi_cad_amz)
  end
  else dbedt_nm_amz_des_ir.Text := ConsultaLookUP('TARMAZEM','CD_ARMAZEM',dbedt_cd_amz_des_ir.Text,'NM_ARMAZEM');
end;

procedure Tfrm_manut_proc.btn_co_amz_des_ifClick(Sender: TObject);
begin
  if Not lAbertura then Edita;
  if Sender is TSpeedButton then
  begin
    if not PoeEmEdicao(datm_manut_proc.qry_proc_im_) then exit;
    If (Sender as TSpeedButton).Enabled Then
      datm_manut_proc.qry_proc_im_CD_ARMAZEM_DESCARGA.AsString := ConsultaOnLineEx('TARMAZEM','Armazém',['CD_ARMAZEM','NM_ARMAZEM','NM_SIGLA','CD_RECINTO'],['Código','Nome','Sigla','Recinto'],'CD_ARMAZEM',frm_main.mi_cad_amz)
  end
  else dbedt_nm_amz_des_if.Text := ConsultaLookUP('TARMAZEM','CD_ARMAZEM',dbedt_cd_amz_des_if.Text,'NM_ARMAZEM');
end;

procedure Tfrm_manut_proc.btn_co_pais_dest_emClick(Sender: TObject);
begin
  if Not lAbertura then Edita;
  if Sender is TSpeedButton then
  begin
    if not PoeEmEdicao(datm_manut_proc.qry_proc_em_) then exit;
    If (Sender as TSpeedButton).Enabled Then
      datm_manut_proc.qry_proc_em_CD_PAIS_DESTINO.AsString := ConsultaOnLineEx('TPAIS','Países',['CODIGO','DESCRICAO'],['Código','Nome'],'CODIGO',frm_main.mi_cad_pais,1, dbedt_cd_pais_dest_em.text);
  end
  else dbedt_nm_pais_dest_em.Text := ConsultaLookUP('TPAIS','CODIGO',dbedt_cd_pais_dest_em.Text,'DESCRICAO')
end;

procedure Tfrm_manut_proc.btn_co_viagem_imClick(Sender: TObject);
var vCdUnidNeg : string;
begin
  if msk_cd_unid_neg.Text = '07' then
    vCdUnidNeg := ' ''01'',''07'' '
  else
    vCdUnidNeg := ''''+msk_cd_unid_neg.Text+'''';

  if Not lAbertura then
    Edita;

  with datm_manut_proc do
  begin
    if Trim( dbedt_cd_embarc_im.Text ) = '' then
    begin
      BoxMensagem( 'Informe uma Embarcação', 3 );
      dbedt_cd_embarc_im.SetFocus;
      Exit;
    end;

    if not PoeEmEdicao(datm_manut_proc.qry_proc_im_) then
      exit;

    if Sender is TSpeedButton then
    begin
      qry_proc_im_NR_VIAGEM.AsString := ConsultaOnLineExSQL(
        'SELECT V.NR_VIAGEM, V.NR_VIAGEM_ARMADOR, V.DT_ESPERADA, V.DT_ENT, E.DESCRICAO, A.NM_ARMAZEM, A.NM_SIGLA, V.NR_MANIFESTO, A.CD_RECINTO ' +
        'FROM   TVIAGEM V (NOLOCK), TARMAZEM A (NOLOCK), TLOCAL_EMBARQUE E (NOLOCK) ' +
        'WHERE  V.CD_UNID_NEG in (' + vCdUnidNeg + ') AND ' +
        '  V.CD_PRODUTO = ''' + msk_cd_produto.Text + ''' AND ' +
        '  V.CD_EMBARCACAO = ''' + dbedt_cd_embarc_im.Text + ''' AND ' +
        '  V.CD_ARMAZEM_ATRACACAO *= A.CD_ARMAZEM AND ' +
        '  V.CD_LOCAL = E.CODIGO ',
        'Viagens', ['NR_VIAGEM',  'NR_VIAGEM_ARMADOR', 'DT_ESPERADA', 'DT_ENT', 'DESCRICAO.','NM_ARMAZEM','NM_SIGLA','NR_MANIFESTO','CD_RECINTO'],
        ['Viagem', 'Viagem Armador', 'Dt. Esperada', 'Dt. Entrada', 'Local Desemb.','Arm. Atracação','Sigla Arm.','Nº Manifesto', 'Recinto'],
         'NR_VIAGEM', frm_main.mi_gp_ga_cad_viagem, dbedt_nr_viagem_im.Text);
    end;

    qry_proc_im_CD_LOCAL_DESEMBARQUE.AsString := ConsultaLookUPSQL(
      'SELECT CD_LOCAL FROM TVIAGEM V (NOLOCK) ' +
      'WHERE  V.CD_UNID_NEG in (' + vCdUnidNeg + ') AND ' +
      '  V.CD_PRODUTO = ''' + msk_cd_produto.Text + ''' AND ' +
      '  V.CD_EMBARCACAO = ''' + dbedt_cd_embarc_im.Text + ''' AND ' +
      '  V.NR_VIAGEM = ''' + dbedt_nr_viagem_im.Text + '''','CD_LOCAL');

    qry_proc_im_CD_ARMAZEM_ATRACACAO.AsString := ConsultaLookUPSQL(
      'SELECT CD_ARMAZEM_ATRACACAO FROM TVIAGEM V (NOLOCK) ' +
      'WHERE  V.CD_UNID_NEG in (' + vCdUnidNeg + ') AND ' +
      '  V.CD_PRODUTO = ''' + msk_cd_produto.Text + ''' AND ' +
      '  V.CD_EMBARCACAO = ''' + dbedt_cd_embarc_im.Text + ''' AND ' +
      '  V.NR_VIAGEM = ''' + dbedt_nr_viagem_im.Text + '''','CD_ARMAZEM_ATRACACAO');

    qry_proc_im_NR_MANIFESTO.AsString := ConsultaLookUPSQL(
                                          'SELECT NR_MANIFESTO FROM TVIAGEM V (NOLOCK) ' +
                                          'WHERE  V.CD_UNID_NEG in (' + vCdUnidNeg + ') AND ' +
                                          '  V.CD_PRODUTO = ''' + msk_cd_produto.Text + ''' AND ' +
                                          '  V.CD_EMBARCACAO = ''' + dbedt_cd_embarc_im.Text + ''' AND ' +
                                          '  V.NR_VIAGEM = ''' + dbedt_nr_viagem_im.Text + '''','NR_MANIFESTO');
  end;

  with TQuery.Create(application) do
  begin
    Databasename := 'DBBROKER';
    SQL.Clear;
    SQL.Add('Exec sp_atz_followup ''' + datm_manut_proc.qry_proc_im_NR_PROCESSO.AsString + '''');
    ExecSQL;
    Free;
  end;
end;

procedure Tfrm_manut_proc.btn_co_viagem_emClick(Sender: TObject);
var
vCdUnidNeg : string;
begin
  if msk_cd_unid_neg.Text = '07' then
    vCdUnidNeg := ' ''01'',''07'' '
  else
    vCdUnidNeg := ''''+msk_cd_unid_neg.Text+'''';


  if Not lAbertura then Edita;
  with datm_manut_proc do
  begin
    if Trim( dbedt_cd_embarc_em.Text ) = '' then
    begin
      BoxMensagem( 'Informe uma Embarcação', 3 );
      dbedt_cd_embarc_em.SetFocus;
      Exit;
    end;
    if not PoeEmEdicao(datm_manut_proc.qry_proc_em_) then
      exit;
    qry_proc_em_NR_VIAGEM.AsString := ConsultaOnLineExSQL(
      ' SELECT V.NR_VIAGEM, V.NR_VIAGEM_ARMADOR, V.DT_ESPERADA, V.DT_ENT, E.DESCRICAO, A.NM_ARMAZEM, A.NM_SIGLA, V.NR_MANIFESTO, A.CD_RECINTO ' +
      ' FROM   TVIAGEM V (NOLOCK), TARMAZEM A (NOLOCK), TLOCAL_EMBARQUE E (NOLOCK) ' +
      ' WHERE  V.CD_UNID_NEG in (' + vCdUnidNeg + ') AND ' +
      '  V.CD_PRODUTO = ''' + qry_processo_CD_PRODUTO.AsString + ''' AND ' +
      '  V.CD_EMBARCACAO = ''' + qry_proc_em_CD_EMBARCACAO.AsString + ''' AND ' +
      '  V.CD_ARMAZEM_ATRACACAO *= A.CD_ARMAZEM AND ' +
      '  V.CD_LOCAL = E.CODIGO ',
      'Viagens', ['NR_VIAGEM', 'NR_VIAGEM_ARMADOR', 'DT_ESPERADA', 'DT_ENT', 'DESCRICAO.','NM_ARMAZEM','NM_SIGLA','NR_MANIFESTO','CD_RECINTO'],
      ['Viagem', 'Viagem Armador', 'Dt. Esperada', 'Dt. Entrada', 'Local Embarque','Arm. Atracação','Sigla Arm.','Nº Manifesto','Recinto'], 'NR_VIAGEM', frm_main.mi_gp_ga_cad_viagem, dbedt_nr_viagem_em.text);

    qry_proc_em_CD_LOCAL_EMBARQUE.AsString := ConsultaLookUPSQL(
      'SELECT CD_LOCAL FROM TVIAGEM V (NOLOCK) ' +
      ' WHERE  V.CD_UNID_NEG in (' + vCdUnidNeg + ') AND ' +
      '  V.CD_PRODUTO = ''' + qry_processo_CD_PRODUTO.AsString + ''' AND ' +
      '  V.CD_EMBARCACAO = ''' + qry_proc_em_CD_EMBARCACAO.AsString + ''' AND ' +
      '  V.NR_VIAGEM = ''' + dbedt_nr_viagem_em.Text + '''','CD_LOCAL');
  end;
end;

procedure Tfrm_manut_proc.dbedt_nr_viagem_imExit(Sender: TObject);
begin
  CodExits;
end;

procedure Tfrm_manut_proc.dbedt_nr_viagem_emExit(Sender: TObject);
begin
  CodExits;
end;

procedure Tfrm_manut_proc.dbedt_cd_banco_emExit(Sender: TObject);
begin
  CodExits;
end;

procedure Tfrm_manut_proc.btn_co_transportador_imClic(Sender: TObject);
begin
  if Not lAbertura then Edita;
  if Sender is TSpeedButton then
  begin
    if not PoeEmEdicao(datm_manut_proc.qry_proc_im_) then exit;
    If (Sender as TSpeedButton).Enabled Then
      datm_manut_proc.qry_proc_im_CD_TRANSPORTADOR.AsString := ConsultaOnLineEx('TTRANSPORTADOR_ITL','Transportador',['CODIGO','DESCRICAO'],['Código','Descrição'],'CODIGO',frm_main.mi_cad_transp_itl, 1 ,dbedt_cd_transportador_im.Text)
  end else
    dbedt_nm_transportador_im.Text := ConsultaLookUP('TTRANSPORTADOR_ITL','CODIGO',dbedt_cd_transportador_im.Text,'DESCRICAO');
end;

procedure Tfrm_manut_proc.btn_co_areaClick(Sender: TObject);
begin
  if Not lAbertura then Edita;
  if Sender is TSpeedButton then
  begin
    if not PoeEmEdicao(datm_manut_proc.qry_processo_) then exit;
    If (Sender as TSpeedButton).Enabled Then
      datm_manut_proc.qry_processo_CD_AREA.AsString := ConsultaOnLineEx('TAREA',
                                                                        'Área',
                                                                       ['CD_AREA','NM_AREA'],
                                                                       ['Código','Descrição'],
                                                                       'CD_AREA',
                                                                       frm_main.mi_cad_area, 1, dbedt_cd_area.text)
  end
  else
    edt_nm_area.Text := ConsultaLookUP('TAREA','CD_AREA',dbedt_cd_area.Text,'NM_AREA');
end;

procedure Tfrm_manut_proc.btn_processo_entrepostoClick(Sender: TObject);
begin
  Application.CreateForm( Tfrm_pesq_proc, frm_pesq_proc );
  if ( st_modificar ) and Not ( datm_manut_proc.qry_processo_.State in [dsEdit] ) then
    datm_manut_proc.qry_processo_.Edit;
  frm_pesq_proc.ShowModal;
  if ( frm_pesq_proc.PesqNrProcesso <> '' ) then
  begin
    dbedt_nr_processo_entreposto.Text := frm_pesq_proc.PesqNrProcesso;
    dbedt_cd_clienteExit(nil);
  end;
end;

procedure Tfrm_manut_proc.FormActivate(Sender: TObject);
begin
  // Caso a tabela do Lookup da Espécie (SISCOMEX) da Carga Solta esteja fechada - Michel - 13/08/2009
  if not datm_manut_proc.qry_tp_embalagem.Active then
    datm_manut_proc.qry_tp_embalagem.Open;
  // Rotinas de FormCreate
  st_modulo    := vstr_cd_modulo;
  st_rotina    := str_cd_rotina;
  var_nr_proc  := '';
  // Fim Rotinas de FormCreate
  ts_imp_mar.TabVisible    := False;
  ts_exp_mar.TabVisible    := False;
  with datm_manut_proc do
  begin                             
    qry_tp_banco_exp.Close;
    qry_tp_banco_exp.Open;
    qry_tp_frete_.Close;
    qry_tp_frete_.Open;
    qry_tp_referencia_.Close;
    qry_tp_referencia_.Open;
    qry_tp_pessoa_exp_.Close;
    qry_tp_pessoa_exp_.Open;

    qry_ncm.Close;
    qry_ncm.Open;

    qryMoveType.Close;
    qryMoveType.Open;

  end;
  lVerProcesso := False;
  if (nr_processo_gestao = '') or (Length(Trim(nr_processo_gestao)) < 5) then
  begin
    if Trim(pesq_nr_proc) = '' then
    begin
      str_nr_processo := '';
      msk_nr_processo.Text := '';
    end else begin
      str_nr_processo := pesq_nr_proc;
      msk_nr_processo.Text := Copy(pesq_nr_proc, 5 ,14);;
    end;
    msk_cd_unid_neg.Text := str_cd_unid_neg;
    msk_cd_unid_negExit(nil);
    msk_cd_produto.Text  := str_cd_produto;
    msk_cd_produtoExit(nil);
  end else begin
    msk_cd_unid_neg.Text := Copy(nr_processo_gestao, 1,2);
    msk_cd_unid_negExit(nil);
    msk_cd_produto.Text  := Copy(nr_processo_gestao, 3,2);
    msk_cd_produtoExit(nil);
    msk_nr_processo.Text := Copy(nr_processo_gestao, 5 ,14);
    str_nr_processo := nr_processo_gestao;
  end;

  lAbertura := True;
  Abertura;
  lAbertura := False;
  lNaoConsiste                 := False;
  pgctrl_manut_proc.ActivePage := ts_lista;
  btn_mi( False, False, False, False );

  if msk_nr_processo.Text = '' then
    msk_nr_processo.SetFocus
  else
    pgctrl_manut_proc.SetFocus;

  tsCamposDescontinuados.TabVisible := false;
end;

procedure Tfrm_manut_proc.dbedt_mle_mn_erChange(Sender: TObject);
begin
  if Not lAbertura then Edita;
end;

procedure Tfrm_manut_proc.btn_co_processo_vincClick(Sender: TObject);
begin
  Application.CreateForm( Tfrm_pesq_proc, frm_pesq_proc );
  if ( st_modificar ) and Not ( datm_manut_proc.qry_processo_.State in [dsEdit] ) then
    datm_manut_proc.qry_processo_.Edit;

  frm_pesq_proc.ShowModal;

  if ( frm_pesq_proc.PesqNrProcesso <> '' ) then
  begin
    dbedt_nr_processo_vinc.Text := frm_pesq_proc.PesqNrProcesso;
    dbedt_cd_clienteExit(nil);
  end;
end;

procedure Tfrm_manut_proc.msk_nr_free_timeExit(Sender: TObject);
begin
  with datm_manut_proc do
  begin
    if ( Trim( msk_nr_free_time.Text ) <> nr_free_time ) and ( Trim( msk_nr_free_time.Text ) <> '' ) then
    begin
      if BoxMensagem( 'Deseja repassar este Free Time para todos os Contêineres?', 1 ) then
      begin
        try
          datm_main.db_broker.StartTransaction;
          CloseStoredProc( sp_repassa_free_time );
          sp_repassa_free_time.ParamByName('@nr_processo').AsString   := qry_proc_cntr_NR_PROCESSO.AsString;
          sp_repassa_free_time.ParamByName('@nr_free_time').AsInteger := StrToInt( Trim( msk_nr_free_time.Text ) );
          ExecStoredProc( sp_repassa_free_time );
          CloseStoredProc( sp_repassa_free_time );
          datm_main.db_broker.Commit;
        except
          on E: Exception do
          begin
            if datm_main.db_broker.InTransaction then datm_main.db_broker.Rollback;
            TrataErro(E);
          end;
        end;
        qry_proc_cntr_.Close;
        qry_proc_cntr_.Open;
      end;
    end;
  end;
end;

procedure Tfrm_manut_proc.msk_nr_free_timeEnter(Sender: TObject);
begin
  nr_free_time := Trim( msk_nr_free_time.Text );
end;

procedure Tfrm_manut_proc.PesquisaProc;
begin
  Application.CreateForm( Tfrm_pesq_proc, frm_pesq_proc );
  frm_pesq_proc.Tag := 1;
  frm_pesq_proc.ShowModal;

  if ( frm_pesq_proc.PesqNrProcesso <> '' ) then
  begin
    msk_cd_unid_neg.Text := Copy( frm_pesq_proc.PesqNrProcesso, 1, 2 );
    msk_cd_unid_negExit(nil);
    msk_cd_produto.Text := Copy( frm_pesq_proc.PesqNrProcesso, 3, 2 );
    msk_cd_produtoExit(nil);
    msk_nr_processo.Text := Copy( frm_pesq_proc.PesqNrProcesso, 5, 14 );
    msk_nr_processoExit(nil);
  end;
end;

procedure Tfrm_manut_proc.btn_co_celulaClick(Sender: TObject);
begin
  if Not lAbertura then Edita;
  if Sender is TSpeedButton then
  begin
    if not PoeEmEdicao(datm_manut_proc.qry_processo_) then exit;
    If (Sender as TSpeedButton).Enabled Then
      //datm_manut_proc.qry_processo_CD_CELULA.AsString := ConsultaOnLineEx('TCELULA','Célula',['CD_CELULA','NM_CELULA'],['Código','Descrição'],'CD_CELULA',frm_main.mi_out_celula, 1, dbedt_cd_celula.Text)
      //Alterado para mostrar somente as células ativas, de acordo com a ocorrência 07957/12              Eric  05/09/2012.
      datm_manut_proc.qry_processo_CD_CELULA.AsString := ConsultaOnLineExSQL('SELECT CD_CELULA, NM_CELULA FROM TCELULA (NOLOCK) WHERE IN_ATIVO = ''1''','Célula',['CD_CELULA','NM_CELULA'],['Código','Descrição'],'CD_CELULA',frm_main.mi_out_celula, dbedt_cd_celula.Text);
  end
  else edt_nm_celula.Text := ConsultaLookUP('TCELULA','CD_CELULA',dbedt_cd_celula.Text,'NM_CELULA');
end;

procedure Tfrm_manut_proc.btn_co_area_refClick(Sender: TObject);
begin
  if Not lAbertura then Edita;
  if Sender is TSpeedButton then
  begin
    if not PoeEmEdicao(datm_manut_proc.qry_ref_cliente_) then exit;
    If (Sender as TSpeedButton).Enabled Then
      datm_manut_proc.qry_ref_cliente_CD_AREA.AsString := ConsultaOnLineEx('TAREA','Área',['CD_AREA','NM_AREA'],['Código','Descrição'],'CD_AREA',frm_main.mi_cad_area, 1, dbedt_cd_area_ref.text)
  end
  else edt_nm_area_ref.Text := ConsultaLookUP('TAREA','CD_AREA',dbedt_cd_area_ref.Text,'NM_AREA');
end;

procedure Tfrm_manut_proc.dbedt_nr_dtaChange(Sender: TObject);
begin
  if Not lAbertura then Edita;
end;

procedure Tfrm_manut_proc.btn_co_tab_sda_impClick(Sender: TObject);
begin
  if Not lAbertura then Edita;
  if Sender is TSpeedButton then
  begin
    if not PoeEmEdicao(datm_manut_proc.qry_processo_) then exit;
    If (Sender as TSpeedButton).Enabled Then
      datm_manut_proc.qry_processo_CD_TAB_SDA.AsString := ConsultaOnLineEx('TSDA','SDA´s',['CD_SDA','TX_DESCRICAO'],['Código','Nome'],'CD_SDA',frm_main.mi_sda_distr, 1 ,dbedt_cd_tab_sda_imp.text)
  end
  else dbedt_nm_tab_sda_exp.Text := ConsultaLookUP('TSDA','CD_SDA',dbedt_cd_tab_sda_exp.Text,'TX_DESCRICAO');
end;

procedure Tfrm_manut_proc.btn_co_tab_sda_expClick(Sender: TObject);
begin
  if Not lAbertura then Edita;
  if Sender is TSpeedButton then
  begin
    if not PoeEmEdicao(datm_manut_proc.qry_processo_) then exit;
    If (Sender as TSpeedButton).Enabled Then
      datm_manut_proc.qry_processo_CD_TAB_SDA.AsString := ConsultaOnLineEx('TSDA','SDA´s',['CD_SDA','TX_DESCRICAO'],['Código','Nome'],'CD_SDA',frm_main.mi_sda_distr, 1, dbedt_cd_tab_sda_exp.text)
  end
  else dbedt_nm_tab_sda_exp.Text := ConsultaLookUP('TSDA','CD_SDA',dbedt_cd_tab_sda_exp.Text,'TX_DESCRICAO');
end;

procedure Tfrm_manut_proc.dbchk_deferidoClick(Sender: TObject);
begin
//  If dbchk_deferido.Checked Then dbchk_indeferido.Checked := False;
end;

procedure Tfrm_manut_proc.dbchk_indeferidoClick(Sender: TObject);
begin
//  if dbchk_indeferido.Checked then dbchk_deferido.Checked := False;
end;

procedure Tfrm_manut_proc.dbedt_dt_vencimento1Change(Sender: TObject);
begin
//
end;

procedure Tfrm_manut_proc.btn_icotermClick(Sender: TObject);
begin
  if Sender is TSpeedButton then
  begin
    if not PoeEmEdicao(datm_manut_proc.qry_proc_im_) then exit;
    If (Sender as TSpeedButton).Enabled Then
      datm_manut_proc.qry_proc_im_CD_INCOTERM.AsString := ConsultaOnLineEx('TINCOTERMS_VENDA','INCOTERMS',['CODIGO','DESCRICAO'],['Código','Descrição'],'CODIGO',nil, 1, dbedt_icoterm.Text)
  end;
end;

procedure Tfrm_manut_proc.dbedt_cd_servicoKeyPress(Sender: TObject; var Key: Char);
begin
//  if Key <> Char(VK_Escape) then vAlterouServico := True; 
end;

procedure Tfrm_manut_proc.dbedt_cd_clienteEnter(Sender: TObject);
begin
  vClientePreenchido := dbedt_cd_cliente.Text;
end;

procedure Tfrm_manut_proc.btn_agenteClick(Sender: TObject);
begin
  if Not lAbertura then Edita;
  if Sender is TSpeedButton then
  begin
    if not PoeEmEdicao(datm_manut_proc.qry_proc_em_) then exit;
    If (Sender as TSpeedButton).Enabled Then
      datm_manut_proc.qry_proc_em_CD_AGENTE.AsString := ConsultaOnLineEx('TAGENTE','Agentes',['CD_AGENTE','NM_AGENTE'],['Código','Descrição'],'CD_AGENTE',frm_main.mi_agentes,1,dbedt_cd_agente.text)
  end
  else edt_nm_agente.Text := ConsultaLookUP('TAGENTE','CD_AGENTE',dbedt_cd_agente.Text,'NM_AGENTE');
end;

procedure Tfrm_manut_proc.dbedt_cd_unid_negChange(Sender: TObject);
begin
  edt_nm_unid_neg.Text := ConsultaLookUP('TUNID_NEG','CD_UNID_NEG', msk_cd_unid_neg.Text,'AP_UNID_NEG');
end;

procedure Tfrm_manut_proc.dbedt_cd_produtoChange(Sender: TObject);
begin
  edt_nm_produto.Text := ConsultaLookUP('TPRODUTO','CD_PRODUTO', msk_cd_produto.Text,'AP_PRODUTO');
end;

procedure Tfrm_manut_proc.dbedt_cd_usuarioChange(Sender: TObject);
begin
  edt_look_nm_usuario.Text := ConsultaLookUP('TUsuario','CD_USUARIO', dbedt_cd_usuario.Text,'NM_USUARIO');
end;

procedure Tfrm_manut_proc.dbedt_cd_analista_com_imChange(Sender: TObject);
begin
  dbedt_nm_analista_com_im.Text := ConsultaLookUP('TUSUARIO','CD_USUARIO', dbedt_cd_analista_com_im.Text,'NM_USUARIO');
end;

procedure Tfrm_manut_proc.dbedt_cd_analista_com_iaChange(Sender: TObject);
begin
  dbedt_nm_analista_com_ia.Text := ConsultaLookUP('TUSUARIO','CD_USUARIO', dbedt_cd_analista_com_ia.Text,'NM_USUARIO');
end;

procedure Tfrm_manut_proc.dbedt_cd_analista_com_irChange(Sender: TObject);
begin
  dbedt_nm_analista_com_ir.Text := ConsultaLookUP('TUSUARIO','CD_USUARIO', dbedt_cd_analista_com_ir.Text,'NM_USUARIO');
end;

procedure Tfrm_manut_proc.dbedt_cd_analista_com_ifChange(Sender: TObject);
begin
  dbedt_nm_analista_com_if.Text := ConsultaLookUP('TUSUARIO','CD_USUARIO', dbedt_cd_analista_com_if.Text,'NM_USUARIO');
end;

procedure Tfrm_manut_proc.dbedt_cd_analista_com_emChange(Sender: TObject);
begin
  dbedt_nm_analista_com_em.Text := ConsultaLookUP('TUSUARIO','CD_USUARIO', dbedt_cd_analista_com_em.Text,'NM_USUARIO');
end;

procedure Tfrm_manut_proc.dbedt_cd_analista_com_eaChange(Sender: TObject);
begin
  dbedt_nm_analista_com_ea.Text := ConsultaLookUP('TUSUARIO','CD_USUARIO', dbedt_cd_analista_com_ea.Text,'NM_USUARIO');
end;

procedure Tfrm_manut_proc.dbedt_cd_analista_com_erChange(Sender: TObject);
begin
  dbedt_nm_analista_com_er.Text := ConsultaLookUP('TUSUARIO','CD_USUARIO', dbedt_cd_analista_com_er.Text,'NM_USUARIO');
end;

procedure Tfrm_manut_proc.dbedt_cd_analista_com_efChange(Sender: TObject);
begin
  dbedt_nm_analista_com_ef.Text := ConsultaLookUP('TUSUARIO','CD_USUARIO', dbedt_cd_analista_com_ef.Text,'NM_USUARIO');
end;

procedure Tfrm_manut_proc.btn_ctrl_armazenagemClick(Sender: TObject);
begin
  if Not VerIntegridade then Exit;
  vstr_cd_modulo := '01';
  str_cd_rotina := '0124';
  str_cd_mod    := vstr_cd_modulo;
  str_cd_rot    := str_cd_rotina;
  Application.CreateForm(Tfrm_controle_armazenagem, frm_controle_armazenagem);
  frm_controle_armazenagem.ShowModal;
end;

procedure Tfrm_manut_proc.dbedt_cd_ref_normalKeyPress(Sender: TObject; var Key: Char);
begin
  // Se não aceitar barra na referencia, segundo a TCLIENTE_HABILITACAO
  if datm_manut_proc.qry_ref_cliente_.State in [dsInsert, dsEdit] then
    if RefClienteHabilitacao(msk_cd_unid_neg.Text, msk_cd_produto.Text, dbedt_cd_cliente.Text, 0) = 0 then
      if ( Key = '/' ) then
        Key := #0;
end;

procedure Tfrm_manut_proc.dbedtNrItemCliente1KeyPress(Sender: TObject; var Key: Char);
begin
//  if not ( IsNumeric(Key) ) and ( Key <> chr(VK_RETURN) ) and ( Key <> chr(VK_BACK) ) then  Key := #0;
end;

procedure Tfrm_manut_proc.dbedtCFOPExit(Sender: TObject);
begin
  if Length(Trim(dbedtCFOP.Text)) < 4 then
  begin
    BoxMensagem('CFOP inválido',2);
    dbedtCFOP.SetFocus;
  end;
end;

procedure Tfrm_manut_proc.btn_incluir_orgaoClick(Sender: TObject);
begin
  // Inclui Orgão Anuente na LI
  with datm_manut_proc do
  begin
    if qry_li_orgao_anuente_.State in [dsInsert] then qry_li_orgao_anuente_.Cancel;
    dblckp_orgao_anuente.ReadOnly := False;

    qry_li_orgao_anuente_.Append;
    qry_li_orgao_anuente_NR_PROCESSO.AsString := qry_li_NR_PROCESSO.AsString;
    qry_li_orgao_anuente_NR_LI.AsString       := qry_li_NR_LI.AsString;

    pnl_li_orgao_anuente.Enabled := True;
    dblckp_orgao_anuente.SetFocus;
  end;

  btn_incluir_orgao.Enabled  := False;
  btn_salvar_orgao.Enabled   := True;
  btn_cancelar_orgao.Enabled := True;
  btn_excluir_orgao.Enabled  := False;
end;

procedure Tfrm_manut_proc.btn_salvar_orgaoClick(Sender: TObject);
begin
  // Grava Orgão Anuente na LI
  ActiveControl := nil;

  btn_incluir_orgao.Enabled  := True;
  btn_salvar_orgao.Enabled   := False;
  btn_cancelar_orgao.Enabled := False;
  btn_excluir_orgao.Enabled  := True;

  if Not Consiste then Exit;
  if Not GravaOrgaoAnuenteLI then Exit;
end;

procedure Tfrm_manut_proc.btn_cancelar_orgaoClick(Sender: TObject);
begin
  // Cancela a inclusão/edição de Orgão Anuente na LI
  btn_incluir_orgao.Enabled  := True;
  btn_salvar_orgao.Enabled   := False;
  btn_cancelar_orgao.Enabled := False;
  btn_excluir_orgao.Enabled  := True;

  Cancelar;
end;

procedure Tfrm_manut_proc.btn_excluir_orgaoClick(Sender: TObject);
var
  vNrProcesso, vNrLI : String;
begin
  // Exclui Orgão Anuente da LI
  if BoxMensagem( 'Este Orgão Anuente da LI será excluído!' + #13#10 + 'Confirma exclusão?', 1 ) then
    try
      datm_main.db_broker.StartTransaction;
      with datm_manut_proc do
      begin
        vNrProcesso := qry_li_orgao_anuente_NR_PROCESSO.AsString;
        vNrLI       := qry_li_orgao_anuente_NR_LI.AsString;
        qry_li_orgao_anuente_.Delete;

        AtualizaDeferimentoLI( vNrProcesso, vNrLI );
      end;
      VerLI;
      datm_main.db_broker.Commit;
    except
      on E: Exception do
      begin
        datm_manut_proc.qry_li_orgao_anuente_.Cancel;
        if datm_main.db_broker.InTransaction then datm_main.db_broker.Rollback;
        TrataErro(E);
      end;
    end;
end;

procedure Tfrm_manut_proc.dblckp_orgao_anuenteClick(Sender: TObject);
begin
  if Not lAbertura then
  begin
    if ( datm_manut_proc.qry_li_orgao_anuente_.State in [ dsInsert, dsEdit ] ) then
    begin
      btn_incluir_orgao.Enabled  := False;
      btn_salvar_orgao.Enabled   := True;
      btn_cancelar_orgao.Enabled := True;
      btn_excluir_orgao.Enabled  := False;
    end;
  end;
end;

procedure Tfrm_manut_proc.AtualizaDeferimentoLI( aNrProcesso, aNrLI : String );
var
  vDataDeferimento: TDate;
  vQtdDiasVencimento: Integer;
begin
  // Atualiza a LI com a maior data de deferimento do orgão anuente e calcula data de vencto.
  with datm_manut_proc do
  begin
    with TQuery.Create(Application) do
    begin
      DatabaseName := 'DBBROKER';
      // Seleciona a quantidade de dias do vencimento - Michel - 12/09/2011
      SQL.Clear;
      SQL.Add('SELECT ISNULL(MIN(OA.QTD_DIAS_VENCIMENTO), 60)');
      SQL.Add('FROM TORGAO_ANUENTES OA (NOLOCK) ');
      SQL.Add('   INNER JOIN TPROCESSO_LI_ORGAO_ANUENTE PL (NOLOCK) ON PL.CD_ORGAO_ANUENTE = OA.CODIGO');
      SQL.Add('WHERE NR_PROCESSO = ' + QuotedStr(aNrProcesso));
      SQL.Add('  AND NR_LI       = ' + QuotedStr(aNrLI));
      Open;
      vQtdDiasVencimento := Fields[0].AsInteger;
      Close;

      // Seleciona a maior data de deferimento
      SQL.Clear;
      SQL.Add('SELECT MAX(DT_DEFERIMENTO)');
      SQL.Add('FROM TPROCESSO_LI_ORGAO_ANUENTE (NOLOCK)');
      SQL.Add('WHERE NR_PROCESSO = ' + QuotedStr(aNrProcesso));
      SQL.Add('  AND NR_LI       = ' + QuotedStr(aNrLI)      );
      Open;

      if Not qry_li_orgao_anuente_.IsEmpty and Not Fields[0].IsNull then
      begin
        vDataDeferimento := Fields[0].AsDateTime;
        Close;
        // Atualiza a LI com a data do deferimento
        SQL.Clear;
        SQL.Add(' UPDATE TPROCESSO_LI ');
        SQL.Add(' SET DT_DEFERIMENTO = CONVERT( datetime, ' + QuotedStr(DateToStr(vDataDeferimento))      + ', 103 ), ');
        SQL.Add('     DT_VENCTO      = CONVERT( datetime, ' + QuotedStr(DateToStr(vDataDeferimento + vQtdDiasVencimento)) + ', 103 )  ');
        SQL.Add(' WHERE NR_PROCESSO = ' + QuotedStr(aNrProcesso) );
        SQL.Add('   AND NR_LI       = ' + QuotedStr(aNrLI)       );
        ExecSQL;
      end
      else
      begin
        Close;
        // Se não tem mais orgão anuente atualiza as datas da LI com NULL
        SQL.Clear;
        SQL.Add(' UPDATE TPROCESSO_LI ');
        SQL.Add(' SET DT_DEFERIMENTO = NULL, ');
        SQL.Add('     DT_VENCTO      = NULL  ');
        SQL.Add(' WHERE NR_PROCESSO = ' + QuotedStr(aNrProcesso) );
        SQL.Add('   AND NR_LI       = ' + QuotedStr(aNrLI)       );
        ExecSQL;
      end;
      (*verifica qual a maior data de LI existente para esse processo (kleber - 15/03/2006) *)
      SQL.Clear;
      (*Comentado a atualização do Follow Up pois já é feito pela trigger, e é necessário que seja feito por lá, pois essa tabela é alimentada pelo robô*)
//      SQL.Add(' SELECT MAX(DT_DEFERIMENTO) ');
//      SQL.Add(' FROM TPROCESSO_LI (NOLOCK) ');
//      SQL.Add(' WHERE NR_PROCESSO = ''' + aNrProcesso + ''' ');
//      Open;
//
//      vMaiorDataGeral := Fields[0].AsDateTime;
//      (*atualiza o FUP com a maior data de Deferimento existente nas LI´s (kleber - 15/3/2006) *)
//      (* ultima alteração - Kleber - 29/11/2006 *)
//      SQL.Clear;
//      SQl.Add('UPDATE TFOLLOWUP ');
//      if vMaiorDataGeral = 0 then
//        SQL.Add('  SET DT_REALIZACAO = Null ')
//      else
//        SQL.Add('  SET DT_REALIZACAO = CONVERT(datetime, ''' + DateToStr(vMaiorDataGeral) + ''' , 103) ');
//      SQL.Add('WHERE NR_PROCESSO = ''' + aNrProcesso + ''' ');
//      SQL.Add('  AND CD_EVENTO = ''397'' ');
//      ExecSQL;

      Free;
    end;

    qry_li_.Close;
    qry_li_.Open;
    qry_li_.Locate('NR_PROCESSO;NR_LI',VarArrayOf([aNrProcesso,aNrLI]),[loCaseInsensitive] );
  end;
end;

procedure Tfrm_manut_proc.PreencheComboLI;
var
  nr_li_mascara : String;
begin
  with datm_manut_proc, TQuery.Create(Application) do
  begin
    // Seleciona as LI's do processo que podem se tornar LI substituida
    DatabaseName := 'DBBROKER';
    SQL.Clear;
    SQL.Add('SELECT NR_LI FROM TPROCESSO_LI ( NOLOCK ) ');
    SQL.Add('WHERE NR_PROCESSO = '''+qry_processo_NR_PROCESSO.AsString+''' ');
    SQL.Add('  AND NR_LI      <> '''+qry_li_NR_LI.AsString+''' ');
    Open;
    // Adiciona os itens no combobox com as LI's substituidas
    cbx_nr_li_subst.Items.Clear;
    while Not Eof do
    begin
      nr_li_mascara := Copy(Fields[0].AsString, 1, 2) + '/' +
                       Copy(Fields[0].AsString, 3, 7) + '-' +
                       Copy(Fields[0].AsString, 10, 1);
      cbx_nr_li_subst.Items.Add(nr_li_mascara);
      Next;
      if Eof then Exit;
    end;
    Free;
  end;
end;

procedure Tfrm_manut_proc.cbx_nr_li_substDropDown(Sender: TObject);
begin
  PreencheComboLI;
end;

procedure Tfrm_manut_proc.dbchk_in_canceladoClick(Sender: TObject);
begin
   if Not lAbertura then
  begin
    if ( datm_manut_proc.qry_li_.State in [ dsInsert, dsEdit ] ) then btn_mi(False, True, True, False);
    if ( datm_manut_proc.qry_li_IN_CANCELADO.AsString = '1' ) or ( dbchk_in_cancelado.Checked ) then
    begin
      lbl_tx_obs_canc.Visible   := True;
      dbmmo_tx_obs_canc.Visible := True;
    end
    else
    begin
      lbl_tx_obs_canc.Visible   := False;
      dbmmo_tx_obs_canc.Visible := False;
    end;
  end;
end;

procedure Tfrm_manut_proc.btn_co_linguaClick(Sender: TObject);
begin
  If Not lAbertura Then Edita;
  If Sender is TSpeedButton Then
  Begin
    If Not PoeEmEdicao(datm_manut_proc.qry_proc_em_) Then Exit;
    If (Sender as TSpeedButton).Enabled Then
      datm_manut_proc.qry_proc_em_CD_LINGUA_PEDIDO.AsString := ConsultaOnLineEx('TIDIOMA', 'Língua do Pedido', ['CODIGO', 'DESCRICAO'], ['Código', 'Descrição'], 'CODIGO', nil, 1, dbedt_cd_lingua.text);
  End
  Else edt_nm_lingua.Text := ConsultaLookUP('TIDIOMA', 'CODIGO',  dbedt_cd_lingua.Text ,'DESCRICAO');
end;

procedure Tfrm_manut_proc.btn_co_aprovado_porClick(Sender: TObject);
begin
  if Not lAbertura then Edita;
  if Sender is TSpeedButton then
  begin
    if not PoeEmEdicao(datm_manut_proc.qry_proc_cntr_) then Exit;
    if (Sender as TSpeedButton).Enabled then
      datm_manut_proc.qry_proc_cntr_NM_APROV_POR_DEM.AsString := ConsultaOnLineExFiltro('TCLIENTE_CONTATO', 'Contatos do Cliente', ['CD_CONTATO', 'NM_CONTATO', 'TX_CARGO', 'TX_DEPARTAMENTO'], ['Código', 'Nome', 'Cargo', 'Departamento'], 'NM_CONTATO',
                                                                                        'CD_CLIENTE = ''' + datm_manut_proc.qry_processo_CD_CLIENTE.AsString + ''' AND CD_UNID_NEG = ''' + datm_manut_proc.qry_processo_CD_UNID_NEG.AsString + ''' AND CD_PRODUTO = ''' + datm_manut_proc.qry_processo_CD_PRODUTO.AsString + ''' ', nil);
  end;
end;

procedure Tfrm_manut_proc.dbedt_motivo_demChange(Sender: TObject);
begin
  if Not lAbertura then
    if ( datm_manut_proc.qry_proc_cntr_.State in [ dsInsert, dsEdit ] ) then btn_mi(False, True, True, False);
end;

procedure Tfrm_manut_proc.btn_co_importador_emClick(Sender: TObject);
begin
  if Not lAbertura then Edita;
  if Sender is TSpeedButton then
  begin
    if not PoeEmEdicao(datm_manut_proc.qry_proc_em_) then Exit;
    If (Sender as TSpeedButton).Enabled Then
      datm_manut_proc.qry_proc_em_CD_IMPORTADOR.AsString := ConsultaOnLineExSQL('SELECT CD_EMPRESA, RTRIM(NM_EMPRESA) AS NM_EMPRESA, RTRIM(END_EMPRESA) + ISNULL(", " + END_NUMERO, "") AS END_EMPRESA, ' +
                                                                                ' RTRIM(END_CIDADE) AS END_CIDADE ' +
                                                                                ' FROM TEMPRESA_EST (NOLOCK) ' +
                                                                                ' WHERE IN_IMPORTADOR = "1" ' +
                                                                                '   AND CD_EMPRESA IN (SELECT CD_EMPRESA ' +
                                                                                '                      FROM TEMPRESA_EST_GRUPO (NOLOCK) ' +
                                                                                '                      WHERE CD_GRUPO = "'+ datm_manut_proc.qry_processo_CD_GRUPO.AsString +'") ',
                                                                                'Cadastro de Importadores',
                                                                                ['CD_EMPRESA','NM_EMPRESA', 'END_EMPRESA', 'END_CIDADE'],
                                                                                ['Cdigo','Importador', 'Endereo', 'Cidade'],
                                                                                'CD_EMPRESA', nil, dbedt_cd_importador_em.text);
  end
  else
    edt_nm_importador_em.Text := ConsultaLookUPSQL(' SELECT NM_EMPRESA FROM TEMPRESA_EST (NOLOCK) WHERE IN_IMPORTADOR = "1" AND CD_EMPRESA = ' + QuotedStr(datm_manut_proc.qry_proc_em_CD_IMPORTADOR.AsString) +
                                 ' AND CD_EMPRESA IN (SELECT CD_EMPRESA FROM TEMPRESA_EST_GRUPO (NOLOCK) WHERE CD_GRUPO = "'+ datm_manut_proc.qry_processo_CD_GRUPO.AsString +'") ',
                                 'NM_EMPRESA');
end;

procedure Tfrm_manut_proc.btn_co_importador_eaClick(Sender: TObject);
begin
  if Not lAbertura then Edita;
  if Sender is TSpeedButton then
  begin
    if not PoeEmEdicao(datm_manut_proc.qry_proc_em_) then Exit;
    If (Sender as TSpeedButton).Enabled Then
      datm_manut_proc.qry_proc_em_CD_IMPORTADOR.AsString := ConsultaOnLineExSQL('SELECT CD_EMPRESA, RTRIM(NM_EMPRESA) AS NM_EMPRESA, RTRIM(END_EMPRESA) + ISNULL(", " + END_NUMERO, "") AS END_EMPRESA, ' +
                                                                                ' RTRIM(END_CIDADE) AS END_CIDADE ' +
                                                                                ' FROM TEMPRESA_EST (NOLOCK) ' +
                                                                                ' WHERE IN_IMPORTADOR = "1" ' +
                                                                                '   AND CD_EMPRESA IN (SELECT CD_EMPRESA ' +
                                                                                '                      FROM TEMPRESA_EST_GRUPO (NOLOCK) ' +
                                                                                '                      WHERE CD_GRUPO = "'+ datm_manut_proc.qry_processo_CD_GRUPO.AsString +'") ',
                                                                                'Cadastro de Importadores',
                                                                                ['CD_EMPRESA','NM_EMPRESA', 'END_EMPRESA', 'END_CIDADE'],
                                                                                ['Cdigo','Importador', 'Endereo', 'Cidade'],
                                                                                'CD_EMPRESA', nil, dbedt_cd_importador_ea.text);
  end
  else
    edt_nm_importador_ea.Text := ConsultaLookUPSQL(' SELECT NM_EMPRESA FROM TEMPRESA_EST (NOLOCK) WHERE IN_IMPORTADOR = "1" AND CD_EMPRESA = ' + QuotedStr(datm_manut_proc.qry_proc_em_CD_IMPORTADOR.AsString) +
                                 ' AND CD_EMPRESA IN (SELECT CD_EMPRESA FROM TEMPRESA_EST_GRUPO (NOLOCK) WHERE CD_GRUPO = "'+ datm_manut_proc.qry_processo_CD_GRUPO.AsString +'") ',
                                 'NM_EMPRESA');
end;

procedure Tfrm_manut_proc.btn_co_importador_erClick(Sender: TObject);
begin
  if Not lAbertura then Edita;
  if Sender is TSpeedButton then
  begin
    if not PoeEmEdicao(datm_manut_proc.qry_proc_em_) then Exit;
    If (Sender as TSpeedButton).Enabled Then
      datm_manut_proc.qry_proc_em_CD_IMPORTADOR.AsString := ConsultaOnLineExSQL('SELECT CD_EMPRESA, RTRIM(NM_EMPRESA) AS NM_EMPRESA, RTRIM(END_EMPRESA) + ISNULL(", " + END_NUMERO, "") AS END_EMPRESA, ' +
                                                                                ' RTRIM(END_CIDADE) AS END_CIDADE ' +
                                                                                ' FROM TEMPRESA_EST (NOLOCK) ' +
                                                                                ' WHERE IN_IMPORTADOR = "1" ' +
                                                                                '   AND CD_EMPRESA IN (SELECT CD_EMPRESA ' +
                                                                                '                      FROM TEMPRESA_EST_GRUPO (NOLOCK) ' +
                                                                                '                      WHERE CD_GRUPO = "'+ datm_manut_proc.qry_processo_CD_GRUPO.AsString +'") ',
                                                                                'Cadastro de Importadores',
                                                                                ['CD_EMPRESA','NM_EMPRESA', 'END_EMPRESA', 'END_CIDADE'],
                                                                                ['Cdigo','Importador', 'Endereo', 'Cidade'],
                                                                                'CD_EMPRESA', nil, dbedt_cd_importador_er.text);
  end
  else
    edt_nm_importador_er.Text := ConsultaLookUPSQL(' SELECT NM_EMPRESA FROM TEMPRESA_EST (NOLOCK) WHERE IN_IMPORTADOR = "1" AND CD_EMPRESA = ' + QuotedStr(datm_manut_proc.qry_proc_em_CD_IMPORTADOR.AsString) +
                                 ' AND CD_EMPRESA IN (SELECT CD_EMPRESA FROM TEMPRESA_EST_GRUPO (NOLOCK) WHERE CD_GRUPO = "'+ datm_manut_proc.qry_processo_CD_GRUPO.AsString +'") ',
                                 'NM_EMPRESA');
end;

procedure Tfrm_manut_proc.btn_co_importador_efClick(Sender: TObject);
begin
  if Not lAbertura then Edita;
  if Sender is TSpeedButton then
  begin
    if not PoeEmEdicao(datm_manut_proc.qry_proc_em_) then Exit;
    If (Sender as TSpeedButton).Enabled Then
      datm_manut_proc.qry_proc_em_CD_IMPORTADOR.AsString := ConsultaOnLineExSQL('SELECT CD_EMPRESA, RTRIM(NM_EMPRESA) AS NM_EMPRESA, RTRIM(END_EMPRESA) + ISNULL(", " + END_NUMERO, "") AS END_EMPRESA, ' +
                                                                                ' RTRIM(END_CIDADE) AS END_CIDADE ' +
                                                                                ' FROM TEMPRESA_EST (NOLOCK) ' +
                                                                                ' WHERE IN_IMPORTADOR = "1" ' +
                                                                                '   AND CD_EMPRESA IN (SELECT CD_EMPRESA ' +
                                                                                '                      FROM TEMPRESA_EST_GRUPO (NOLOCK) ' +
                                                                                '                      WHERE CD_GRUPO = "'+ datm_manut_proc.qry_processo_CD_GRUPO.AsString +'") ',
                                                                                'Cadastro de Importadores',
                                                                                ['CD_EMPRESA','NM_EMPRESA', 'END_EMPRESA', 'END_CIDADE'],
                                                                                ['Cdigo','Importador', 'Endereo', 'Cidade'],
                                                                                'CD_EMPRESA', nil, dbedt_cd_importador_ef.text);
  end
  else
    edt_nm_importador_ef.Text := ConsultaLookUPSQL(' SELECT NM_EMPRESA FROM TEMPRESA_EST (NOLOCK) WHERE IN_IMPORTADOR = "1" AND CD_EMPRESA = ' + QuotedStr(datm_manut_proc.qry_proc_em_CD_IMPORTADOR.AsString) +
                                 ' AND CD_EMPRESA IN (SELECT CD_EMPRESA FROM TEMPRESA_EST_GRUPO (NOLOCK) WHERE CD_GRUPO = "'+ datm_manut_proc.qry_processo_CD_GRUPO.AsString +'") ',
                                 'NM_EMPRESA');
end;

procedure Tfrm_manut_proc.dbedt_cd_importador_emExit(Sender: TObject);
begin
  CodExits;
end;

procedure Tfrm_manut_proc.dbedt_cd_importador_eaExit(Sender: TObject);
begin
  CodExits;
end;

procedure Tfrm_manut_proc.dbedt_cd_importador_erExit(Sender: TObject);
begin
  CodExits;
end;

procedure Tfrm_manut_proc.dbedt_cd_importador_efExit(Sender: TObject);
begin
  CodExits;
end;

function Tfrm_manut_proc.PreencheuCamposFrete(qry: TQuery): Boolean;
//var vMensagem: TStringList;
begin
  //retirada da trava após o preenchimento do Nr. do Conhecimnto - kleber (07/05/2007)
  // a pedido de Wagner Branco
  {vMensagem := TStringList.Create;
  vMensagem.Add('Após o preenchimento do Nr. do Conhecimento, é necessário');
  vMensagem.Add('preencher os seguintes campos: ');
  Result := True;
  if (qry.FieldByName('DT_CONHECIMENTO').AsDateTime = 0) or (qry.FieldByName('DT_CONHECIMENTO').IsNull) then
  begin
    Result := False;
    vMensagem.Add('* Data Conhecimento.');
  end;
  if (qry.FieldByName('CD_MOEDA_FRETE').AsString = '') or (qry.FieldByName('CD_MOEDA_FRETE').IsNull) then
  begin
    Result := False;
    vMensagem.Add('* Moeda Frete.');
  end;
  if (qry.FieldByName('TP_FRETE').AsString = '') or (qry.FieldByName('TP_FRETE').IsNull) then
  begin
    Result := False;
    vMensagem.Add('* Tipo do Frete.');
  end;
  if (qry = datm_manut_proc.qry_proc_im_) or (qry = datm_manut_proc.qry_proc_ia_) or
     (qry = datm_manut_proc.qry_proc_ir_) or (qry = datm_manut_proc.qry_proc_if_) then
  begin
    if ((qry.FieldByName('VL_FRETE_PREPAID_MNEG').AsFloat = 0) or (qry.FieldByName('VL_FRETE_PREPAID_MNEG').IsNull)) and
       ((qry.FieldByName('VL_FRETE_COLLECT_MNEG').AsFloat = 0) or (qry.FieldByName('VL_FRETE_COLLECT_MNEG').IsNull)) then
    begin
      Result := False;
      vMensagem.Add('* Valor de Frete Prepaid ou Frete Collect.');
    end;
  end;
  if (qry = datm_manut_proc.qry_proc_er_) or (qry = datm_manut_proc.qry_proc_ef_) then
  begin
    if ((qry.FieldByName('VL_FRETE_PREPAID_MNEG').AsFloat = 0) or (qry.FieldByName('VL_FRETE_PREPAID_MNEG').IsNull)) and
       (qry.FieldByName('TP_FRETE').AsString = '1') then
    begin
      Result := False;
      vMensagem.Add('* Valor de Frete Prepaid.');
    end;
  end;

  if Result = False then Application.MessageBox(PChar(vMensagem.Text), 'Campos Obrigatórios', MB_OK + MB_ICONERROR);
  vMensagem.Free;}
end;

procedure Tfrm_manut_proc.dbedtMantraVisadoExit(Sender: TObject);
begin
  if dbedtMantraVisado.Text = '  /  /    ' then
    if datm_manut_proc.qry_proc_im_.State = dsEdit then datm_manut_proc.qry_proc_im_DT_PRESENCA_CARGA.AsVariant := Null;
end;

procedure Tfrm_manut_proc.btnCoFreteEMClick(Sender: TObject);
begin
  if Not lAbertura then Edita;
  if Sender is TSpeedButton then
  begin
    if not PoeEmEdicao(datm_manut_proc.qry_proc_em_) then exit;
    If (Sender as TSpeedButton).Enabled Then
      datm_manut_proc.qry_proc_em_.FieldByName('CD_TAB_FRETE').AsString := ConsultaOnLineExSQL(
        'SELECT F.CD_TAB_FRETE TAB_FRETE, '+
        '  (SELECT P1.NM_PORTO FROM TPORTO P1 (NOLOCK) WHERE P1.CD_PORTO = F.CD_ORIGEM_TAB_FRETE)  ORIGEM, '+
        '  (SELECT P2.NM_PORTO FROM TPORTO P2 (NOLOCK) WHERE P2.CD_PORTO = F.CD_DESTINO_TAB_FRETE) DESTINO, '+
        '  (SELECT T.DESCRICAO FROM TTRANSPORTADOR_ITL T (NOLOCK) WHERE T.CODIGO = F.CD_ARMADOR) ARMADOR, '+
        '  (SELECT A.NM_AGENTE FROM TAGENTE A (NOLOCK) WHERE A.CD_AGENTE = F.CD_AGENTE_TAB_FRETE) AGENTE, '+
        '  (SELECT M.AP_MOEDA FROM TMOEDA_BROKER M (NOLOCK) WHERE M.CD_MOEDA = F.CD_MOEDA_TAB_FRETE) MOEDA '+
        'FROM TCLIENTE_SERVICO_FRETE CSF (NOLOCK), TTAB_FRETE F (NOLOCK), TPROCESSO PR (NOLOCK) '+
        'WHERE PR.NR_PROCESSO = "'+ datm_manut_proc.qry_proc_em_.FieldByName('NR_PROCESSO').AsString +'" '+
        '  AND CSF.CD_TAB_FRETE      = F.CD_TAB_FRETE '+
        // '  AND F.CD_AGENTE_TAB_FRETE = PR.CD_AGENTE '+
        '  AND CSF.CD_UNID_NEG       = PR.CD_UNID_NEG '+
        '  AND CSF.CD_PRODUTO        = PR.CD_PRODUTO '+
        '  AND CSF.CD_CLIENTE        = PR.CD_CLIENTE '+
        '  AND CSF.CD_SERVICO        = PR.CD_SERVICO ',
        'Tabelas de Frete',['TAB_FRETE', 'ORIGEM', 'DESTINO', 'ARMADOR', 'AGENTE', 'MOEDA'],['Código', 'Origem', 'Destino', 'Armador', 'Agente', 'Moeda'],'TAB_FRETE', nil,dbedtCdFreteEM.Text)
  end
  else
  begin
    edtNmFreteEM.Text := ConsultaLookUPSQL(
      'SELECT (SELECT F.DESC_TAB_FRETE FROM TTAB_FRETE F (NOLOCK) WHERE F.CD_TAB_FRETE = CSF.CD_TAB_FRETE) DESCRICAO ' +
      'FROM TCLIENTE_SERVICO_FRETE CSF (NOLOCK), TPROCESSO PR (NOLOCK) '+
      'WHERE PR.NR_PROCESSO = "' + datm_manut_proc.qry_proc_em_.FieldByName('NR_PROCESSO').AsString + '" '+
      '  AND CSF.CD_UNID_NEG = PR.CD_UNID_NEG '+
      '  AND CSF.CD_PRODUTO  = PR.CD_PRODUTO '+
      '  AND CSF.CD_CLIENTE  = PR.CD_CLIENTE '+
      '  AND CSF.CD_SERVICO  = PR.CD_SERVICO ' +
      '  AND CSF.CD_TAB_FRETE = "' + dbedtCdFreteEM.Text +'" ','DESCRICAO');
  end;
end;

procedure Tfrm_manut_proc.btnCoFreteEAClick(Sender: TObject);
begin
  if Not lAbertura then Edita;
  if Sender is TSpeedButton then
  begin
    if not PoeEmEdicao(datm_manut_proc.qry_proc_em_) then exit;
    If (Sender as TSpeedButton).Enabled Then
      datm_manut_proc.qry_proc_em_.FieldByName('CD_TAB_FRETE').AsString := ConsultaOnLineExSQL(
        'SELECT F.CD_TAB_FRETE TAB_FRETE, '+
        '  (SELECT P1.NM_PORTO FROM TPORTO P1 (NOLOCK) WHERE P1.CD_PORTO = F.CD_ORIGEM_TAB_FRETE)  ORIGEM, '+
        '  (SELECT P2.NM_PORTO FROM TPORTO P2 (NOLOCK) WHERE P2.CD_PORTO = F.CD_DESTINO_TAB_FRETE) DESTINO, '+
        '  (SELECT T.DESCRICAO FROM TTRANSPORTADOR_ITL T (NOLOCK) WHERE T.CODIGO = F.CD_ARMADOR) ARMADOR, '+
        '  (SELECT A.NM_AGENTE FROM TAGENTE A (NOLOCK) WHERE A.CD_AGENTE = F.CD_AGENTE_TAB_FRETE) AGENTE, '+
        '  (SELECT M.AP_MOEDA FROM TMOEDA_BROKER M (NOLOCK) WHERE M.CD_MOEDA = F.CD_MOEDA_TAB_FRETE) MOEDA '+
        'FROM TCLIENTE_SERVICO_FRETE CSF (NOLOCK), TTAB_FRETE F (NOLOCK), TPROCESSO PR (NOLOCK) '+
        'WHERE PR.NR_PROCESSO = "'+ datm_manut_proc.qry_proc_em_.FieldByName('NR_PROCESSO').AsString +'" '+
        '  AND CSF.CD_TAB_FRETE      = F.CD_TAB_FRETE '+
        '  AND F.CD_AGENTE_TAB_FRETE = PR.CD_AGENTE '+
        '  AND CSF.CD_UNID_NEG       = PR.CD_UNID_NEG '+
        '  AND CSF.CD_PRODUTO        = PR.CD_PRODUTO '+
        '  AND CSF.CD_CLIENTE        = PR.CD_CLIENTE '+
        '  AND CSF.CD_SERVICO        = PR.CD_SERVICO ',
        'Tabelas de Frete',['TAB_FRETE', 'ORIGEM', 'DESTINO', 'ARMADOR', 'AGENTE', 'MOEDA'],['Código', 'Origem', 'Destino', 'Armador', 'Agente', 'Moeda'],'TAB_FRETE', nil,dbedtCdFreteEA.Text)
  end
  else begin
    edtNmFreteEA.Text := ConsultaLookUPSQL(
      'SELECT (SELECT F.DESC_TAB_FRETE FROM TTAB_FRETE F (NOLOCK) WHERE F.CD_TAB_FRETE = CSF.CD_TAB_FRETE) DESCRICAO ' +
      'FROM TCLIENTE_SERVICO_FRETE CSF (NOLOCK),  TPROCESSO PR (NOLOCK) '+
      'WHERE PR.NR_PROCESSO = "' + datm_manut_proc.qry_proc_em_.FieldByName('NR_PROCESSO').AsString + '" '+
      '  AND CSF.CD_UNID_NEG = PR.CD_UNID_NEG '+
      '  AND CSF.CD_PRODUTO  = PR.CD_PRODUTO '+
      '  AND CSF.CD_CLIENTE  = PR.CD_CLIENTE '+
      '  AND CSF.CD_SERVICO  = PR.CD_SERVICO ' +
      '  AND CSF.CD_TAB_FRETE = "' + dbedtCdFreteEA.Text +'" ','DESCRICAO');
  end;
end;

procedure TFrm_manut_proc.VerificaFrete(pForcaCalculo: boolean = false);

  function ChamaCalculoFrete(pTabela: string): real;
  const
    txErro: array[1..11] of string = ('Erro Interno. Problema na Consulta ao Banco de Dados. Informe o Depto. de TI.',
                                      'Não existem todos os tipos de cntrs do Processo na Tabela de Fretes!',
                                      'Não existe "Tarifa LCL" cadastrada em Tarifas na Tabela de Frete!',
                                      'Não existe Tarifa cadastrada com Simbolo "-" na Tabela de Frete!',
                                      'Não existe Tarifa cadastrada com símbolo "+" na tabela de Frete!',
                                      'Não foi possível encontrar Tarifa correta na Tabela de Frete. Informe o Depto. de TI.',
                                      'Não existe via de Transporte válida na tabela de Frete!',
                                      'Não existe Tipo de Estufagem válida na tabela de Frete!',
                                      'Não existe Taxa de Moeda cadastrada para o dia de Hoje!',
                                      'Moeda de Frete do Processo diferente da Moeda da Tabela de Frete!',
                                      'Não existe Cntrs cadastrados no Processo. Impossível calcular!');
  var vErros: string;
      vItemFrete: string[3];
      vResultado: real;
      vCdErro: string [2];
      vMensagem: TStringList;
      i: Byte;
  begin
    //************************************************************************//
    //Verifica serviços de frete e mostra possíveis erros no cálculo ao final //
    //************************************************************************//
    vErros := '';
    Result := 0;
    if ConsultaLookUp('TSERVICO', 'CD_SERVICO', datm_manut_proc.qry_processo_CD_SERVICO.AsString, 'CD_VIA_TRANSPORTE') = '01' then
      vItemFrete := ConsultaLookUpSQL('SELECT CD_ITEM_FRETE_MAR   FROM TPARAMETROS', 'CD_ITEM_FRETE_MAR')
    else if ConsultaLookUp('TSERVICO', 'CD_SERVICO', datm_manut_proc.qry_processo_CD_SERVICO.AsString, 'CD_VIA_TRANSPORTE') = '04' then
      vItemFrete := ConsultaLookUpSQL('SELECT CD_ITEM_FRETE_AEREO FROM TPARAMETROS', 'CD_ITEM_FRETE_AEREO');

    vResultado := CalculaFrete(datm_manut_proc.qry_processo_NR_PROCESSO.AsString, pTabela, vItemFrete, false);
    if vResultado < 0 then
    begin
      vCdErro := Copy('00' , 1, 2- Length(FloatToStr(Abs(vResultado)))) + FloatToStr(Abs(vResultado));
      vResultado := 0;
      if Pos(vCdErro, vErros) = 0 then
        vErros := vErros + '/' + vCdErro;
    end;
    Result := vResultado;

    if vErros <> '' then
    begin
      vMensagem := TStringList.Create;
      i := 2;
      repeat
        vMensagem.Add(txErro[StrToInt(Copy(vErros, i, 2))]);
        i := i + 3;
      until i > Length(vErros);
      Application.MessageBox(Pchar(vMensagem.Text), 'Erro(s) no cálculo de Frete...', MB_OK + MB_ICONERROR);
      vMensagem.Free;
    end;
  end;

var
  vValorAntes, vValorDepois: real;
begin
  datm_manut_proc.vAlterouDadosFrete := False;
  vValorAntes  := 0;
  vValorDepois := 0;
  //*****************************************************************************//
  //Verifica pela Tab visivel quais são os dados para função e onde vai lançá-los//
  //*****************************************************************************//
  // exportação marítima
  if ts_exp_mar.TabVisible then
  begin
    if nbExportacao.ActivePage = 'M' then
    begin
      if  (edtNmFreteEM.Text <> '') and (datm_manut_proc.qry_proc_em_.FieldByName('TP_FRETE').AsInteger = 1) then
      begin
        if pForcaCalculo then
          datm_manut_proc.qry_proc_em_.Edit
        else
          if not (datm_manut_proc.qry_proc_em_.State = dsEdit) then Exit;

        vValorAntes := datm_manut_proc.qry_proc_em_.FieldByName('VL_FRETE_PREPAID_MNEG').AsFloat;
        datm_manut_proc.qry_proc_em_.FieldByName('VL_FRETE_PREPAID_MNEG').AsFloat := ChamaCalculoFrete(dbedtCdFreteEM.Text);
        vValorDepois := datm_manut_proc.qry_proc_em_.FieldByName('VL_FRETE_PREPAID_MNEG').AsFloat;

        if pForcaCalculo then
          datm_manut_proc.qry_proc_em_.Post;
      end;
    end else
    // exportação aérea
    if nbExportacao.ActivePage = 'A' then
    begin
      if (edtNmFreteEA.Text <> '') and (datm_manut_proc.qry_proc_em_.FieldByName('TP_FRETE').AsInteger = 1) then
      begin
        if pForcaCalculo then
          datm_manut_proc.qry_proc_em_.Edit
        else
          if not (datm_manut_proc.qry_proc_em_.State = dsEdit) then Exit;
        vValorAntes := datm_manut_proc.qry_proc_em_.FieldByName('VL_FRETE_PREPAID_MNEG').AsFloat;
        datm_manut_proc.qry_proc_em_.FieldByName('VL_FRETE_PREPAID_MNEG').AsFloat := ChamaCalculoFrete(dbedtCdFreteEA.Text);
        vValorDepois := datm_manut_proc.qry_proc_em_.FieldByName('VL_FRETE_PREPAID_MNEG').AsFloat;
        if pForcaCalculo then datm_manut_proc.qry_proc_em_.Post;
      end;
    end;
  end;
  if vValorAntes <> vValorDepois then
    Application.MessageBox(Pchar('O valor do Frete foi alterado para ' + FormatFloat('$ #0.,00', vValorDepois) + ' devido as alterações realizadas!'), 'Alteração do Valor do Frete', MB_OK + MB_ICONWARNING);
end;

procedure Tfrm_manut_proc.dbedtCdFreteIMExit(Sender: TObject);
begin
  CodExits;
end;

procedure Tfrm_manut_proc.rxdbcbEstufagemEnter(Sender: TObject);
begin
  vTpEstufagem := datm_manut_proc.qry_processo_TP_ESTUFAGEM.AsString;
end;

procedure Tfrm_manut_proc.dblckpbox_tp_frete_emClick(Sender: TObject);
begin
  if Not lAbertura then Edita;
end;

procedure Tfrm_manut_proc.dbedtDtNFExit(Sender: TObject);
begin
//  if dbedtDtNF.Text = '  /  /    ' then
//    if datm_manut_proc.qry_dde_nf_.State = dsEdit then datm_manut_proc.qry_dde_nf_DT_NF.AsVariant := Null;
end;

procedure Tfrm_manut_proc.dbedtDtNFChange(Sender: TObject);
begin
  if Not lAbertura then
    if ( datm_manut_proc.qry_dde_nf_.State in [ dsInsert, dsEdit ] ) then btn_mi(False, True, True, False);
//  if dbedtDtNF.Text = '  /  /    ' then
//    if datm_manut_proc.qry_dde_nf_.State = dsEdit then datm_manut_proc.qry_dde_nf_DT_NF.AsVariant := Null;
end;

procedure Tfrm_manut_proc.dbchkInEntrepostoClick(Sender: TObject);
begin
  dbedt_nr_processo_entreposto.Enabled := dbchkInEntreposto.Checked;
  btn_processo_entreposto.Enabled      := dbchkInEntreposto.Checked;
  if Not lAbertura then Edita;
end;

procedure Tfrm_manut_proc.edtNFChange(Sender: TObject);
begin
  if datm_manut_proc.qry_processo_.FieldByName('CD_PRODUTO').AsString = '01' then
    btnSalvarNF.Enabled := (TEdit(Sender).Text <> '')
  else
    btnSalvarNFExp.Enabled := (TEdit(Sender).Text <> '');

end;

procedure Tfrm_manut_proc.SpeedButton5Click(Sender: TObject);
begin
  if datm_manut_proc.qry_processo_.FieldByName('CD_PRODUTO').AsString = '01' then
    edtNF.Text := ConsultaOnLineExSQL('SELECT NR_NOTA, DT_NOTA, VL_NOTA FROM TPROCESSO_NF (NOLOCK) WHERE NR_PROCESSO = ''' + datm_manut_proc.qry_processo_.FieldByName('NR_PROCESSO').AsString + '''',
                                      'Notas Fiscais',['NR_NOTA', 'DT_NOTA', 'VL_NOTA'],['Nota Fiscal','Data','Valor'],'NR_NOTA',nil,'')
  else
    edtNFExp.Text := ConsultaOnLineExSQL('SELECT NR_NF, DT_NOTA, VL_NOTA FROM TPROCESSO_EXP_NF (NOLOCK) WHERE NR_PROCESSO = ''' + datm_manut_proc.qry_processo_.FieldByName('NR_PROCESSO').AsString + '''',
                                      'Notas Fiscais',['NR_NF', 'DT_NOTA', 'VL_NOTA'],['Nota Fiscal','Data','Valor'],'NR_NF',nil,'');

end;

procedure Tfrm_manut_proc.btnSalvarNFClick(Sender: TObject);
var
  nrNf: String;
begin
  if datm_manut_proc.qry_processo_.FieldByName('CD_PRODUTO').AsString = '01' then
  begin
    // verifica se o número digitado é válido
    if StrToIntDef(ConsultaLookUpSQL('SELECT COUNT(*) BLABLA FROM TPROCESSO_NF (NOLOCK) WHERE NR_PROCESSO = ''' + datm_manut_proc.qry_processo_.FieldByName('NR_PROCESSO').AsString + ''' AND NR_NOTA = ''' + edtNF.Text + '''','BLABLA'),0) = 0 then
    begin
      BoxMensagem('Essa nota fiscal não existe para este processo.',2);
      Exit;
    end
    else
      nrNf := edtNF.Text;
  end;
  if datm_manut_proc.qry_processo_.FieldByName('CD_PRODUTO').AsString = '02' then
  begin
    // verifica se o número digitado é válido
    if StrToIntDef(ConsultaLookUpSQL('SELECT COUNT(*) BLABLA FROM TPROCESSO_EXP_NF (NOLOCK) WHERE NR_PROCESSO = ''' + datm_manut_proc.qry_processo_.FieldByName('NR_PROCESSO').AsString + ''' AND NR_NF = ''' + edtNFExp.Text + '''','BLABLA'),0) = 0 then
    begin
      BoxMensagem('Essa nota fiscal não existe para este processo.',2);
      Exit;
    end
    else
      nrNf := edtNFExp.Text;
  end;
  // verifica se já existe essa NF cadastradas para esse container
  if StrToInt(ConsultaLookUpSQL('SELECT COUNT(*) BLABLA FROM TPROCESSO_CNTR_NF (NOLOCK) WHERE NR_PROCESSO = '''+datm_manut_proc.qry_processo_.FieldByName('NR_PROCESSO').AsString+''' AND NR_CNTR = '''+datm_manut_proc.qry_proc_cntr_.FieldByName('NR_CNTR').AsString+''' AND NR_NF = ''' + nrNf + '''','BLABLA')) = 0 then
  begin
    // grava importação e exportação
    with TQuery.Create(application) do
    begin
      Databasename := 'DBBROKER';
      SQL.Clear;
      SQL.Add('INSERT INTO TPROCESSO_CNTR_NF(NR_PROCESSO, NR_NF, NR_CNTR)');
      SQL.Add('     VALUES ('''+datm_manut_proc.qry_processo_.FieldByName('NR_PROCESSO').AsString+''','''+nrNf+''','''+datm_manut_proc.qry_proc_cntr_.FieldByName('NR_CNTR').AsString+''')');
      ExecSQL;
      Free;
    end;
  end else
    BoxMensagem('Essa nota fiscal já foi inserida.',2);
  datm_manut_proc.qryProcessoCntrNF.Close;
  datm_manut_proc.qryProcessoCntrNF.Open;
  edtNF.Clear;
  edtNFExp.Clear;
end;

procedure Tfrm_manut_proc.DBEdit2Change(Sender: TObject);
begin
  if Not lAbertura then
  begin
    if ( datm_manut_proc.qry_exp_re_.State in [ dsInsert, dsEdit ] ) then
      btn_mi(False, True, True, False);
  end;
//  if DBEdit2.Text = '  /  /    ' then
//    if datm_manut_proc.qry_exp_re_.State = dsEdit then
//      datm_manut_proc.qry_exp_re_DT_RE.AsVariant := Null;
end;

procedure Tfrm_manut_proc.btnExcluirNFClick(Sender: TObject);
begin
  if BoxMensagem( 'Esta NF será excluída!' + #13#10 + 'Confirma exclusão?', 1 ) then
  try
    datm_main.db_broker.StartTransaction;
    datm_manut_proc.qryProcessoCntrNF.Delete;
    datm_main.db_broker.Commit;
  except
    on E: Exception do
    begin
      datm_manut_proc.qryProcessoCntrNF.Cancel;
      if datm_main.db_broker.InTransaction then datm_main.db_broker.Rollback;
      TrataErro(E);
    end;
  end;
end;

procedure Tfrm_manut_proc.dbedt_dt_reg_ddeChange(Sender: TObject);
begin
  if Not lAbertura then Edita;
  if dbedt_dt_reg_dde.Text = '  /  /    ' then
    if datm_manut_proc.qry_processo_.State = dsEdit then
      datm_manut_proc.qry_processo_DT_REG_DDE.AsVariant := Null;
end;

procedure Tfrm_manut_proc.ChkMercadoriaPerigosaClick(Sender: TObject);
begin
  if Not lAbertura then Edita;
  if ChkMercadoriaPerigosa.Checked then
  begin
    Shape15.Pen.Mode  := pmCopy;
    Shape15.Pen.Width := 2;
  end else begin
    Shape15.Pen.Mode  := pmMerge;
    Shape15.Pen.Width := 1;
  end;
end;

procedure Tfrm_manut_proc.DBCheckBox2Click(Sender: TObject);
begin
  if Not lAbertura then Edita;
  if DBCheckBox2.Checked then
  begin
    Shape16.Pen.Mode  := pmCopy;
    Shape16.Pen.Width := 2;
  end
  else
  begin
    Shape16.Pen.Mode  := pmMerge;
    Shape16.Pen.Width := 1;
  end;
end;

procedure Tfrm_manut_proc.dbedt_nr_processo_vincChange(Sender: TObject);
begin
  if Not lAbertura then
  begin
    Edita;
    vAlterouProcVinc := True;
  end;
end;

procedure Tfrm_manut_proc.dbg_reDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
begin
  if ConsultaLookUpSQL('SELECT COUNT(*) AS CONT FROM TRE_CAPA (NOLOCK) WHERE ' +
     ' NR_PROCESSO = "'+ datm_manut_proc.qry_processo_NR_PROCESSO.AsString +'" AND ' +
     ' SUBSTRING(NR_RE_SISCOMEX, 1,2) + SUBSTRING(NR_RE_SISCOMEX, 4,7) + SUBSTRING(NR_RE_SISCOMEX, 12,3) = "' +
     datm_manut_proc.qry_exp_re_NR_RE.AsString + '" ', 'CONT') <> '0' then
     begin
    TDBGrid(Sender).Canvas.Brush.Color := $00D1FCC2;
    TDBGrid(Sender).Canvas.Font.Color := clGray;
  end else begin
    TDBGrid(Sender).Canvas.Brush.Color := clWhite;
    TDBGrid(Sender).Canvas.Font.Color := clBlack;
  end;

  if Column.FieldName = 'NR_RE' then
    TDBGrid(Sender).Canvas.TextRect(Rect,Rect.Left+2,Rect.Top+2,Copy(Column.Field.AsString, 1,2) + '/' + Copy(Column.Field.AsString, 3,7) + '-' + Copy(Column.Field.AsString, 10,3))
  else if Column.FieldName = 'VL_FOB' then
    TDBGrid(Sender).Canvas.TextRect(Rect,Rect.Left+2,Rect.Top+2,FormatFloat('#0.,00', Column.Field.AsFloat))
  else if Column.FieldName = 'QT_PESO_LIQ' then
    TDBGrid(Sender).Canvas.TextRect(Rect,Rect.Left+2,Rect.Top+2,FormatFloat('#0.,000', Column.Field.AsFloat))
  else if (Column.Field <> nil) and not Column.Field.IsNull then
    TDBGrid(Sender).Canvas.TextRect(Rect,Rect.Left+2,Rect.Top+2,Column.Field.AsString);

end;

procedure Tfrm_manut_proc.btnExtratoREClick(Sender: TObject);
var
  vArquivoRE : TStringList;
  i : Integer;
  str_file_registro,str_file_consulta:String;
begin
  with datm_manut_proc do
  begin
    try
      { O Bloco abaixo foi todo re-feito por Carlos em  18/02/2010 }

      { arquivo gerado na consulta do RE }

      str_file_consulta:='H:\TXT_RE\CONSULTA_RE'+datm_manut_proc.qry_exp_re_.FieldByName('NR_RE').AsString+'.txt';
      { arquivo gerado no registro do RE }
      str_file_registro:='H:\TXT_RE\RE'         +datm_manut_proc.qry_exp_re_.FieldByName('NR_RE').AsString+'.txt';

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
          mtExtratoRE.FieldByName('PROCESSO').AsString := Copy(datm_manut_proc.qry_processo_.FieldByName('NR_PROCESSO').AsString,5,10) + ' / ' + '001';
        end;
        if mtExtratoRE.State in [dsInsert] then
          mtExtratoRE.FieldByName('TELA_SISCOMEX').AsString := mtExtratoRE.FieldByName('TELA_SISCOMEX').AsString + #10 + vArquivoRE.Strings[i];
      end;
      if mtExtratoRE.State in [dsInsert] then
        mtExtratoRE.Post;

      Application.CreateForm(TFrm_impressao, Frm_impressao );
      Frm_impressao.cd_unid_neg   := msk_cd_unid_neg.text;
      Frm_impressao.cd_produto    := '02';
      Frm_impressao.cd_modulo     := '0102';
      Frm_impressao.ShowModal;
    finally
      vArquivoRE.Free;
      mtExtratoRE.EmptyTable;
      mtExtratoRE.Close;
    end;
  end;
end;


procedure Tfrm_manut_proc.btnNotaFiscalClick(Sender: TObject);

  procedure GeraDadosNF;
  var vAux: TStringList;
      j: Byte;
      i: Integer;
  begin
    strGrdNF.RowCount := 0;
    j := 0;
    vAux := TStringList.Create();
    while not iBQryNF.Eof do
    begin
      //lança o campo mem_dados da base do DDNota
      // e procura nele: nr. Nota (00002), CFOP (000003), Dt Nota (000022), Total (parametrizado, padrão 000099)
      vAux.Clear;
      vAux.Assign(IBQryNF.FieldbyName('mem_dados'));
      strGrdNF.RowCount := strGrdNF.RowCount + 1;
      for i := 0 to vAux.Count- 1 do
      begin
        if Pos('000002', Copy(vAux.Strings[i], 1, 6)) > 0 then
          strGrdNF.Cells[0, j] := Copy(vAux.Strings[i], 7, Length(vAux.Strings[i]) - 6)
        else if Pos('000022', Copy(vAux.Strings[i], 1, 6)) > 0 then
          strGrdNF.Cells[1, j] := Copy(vAux.Strings[i], 7, Length(vAux.Strings[i]) - 6)
        else if Pos('000003', Copy(vAux.Strings[i], 1, 6)) > 0 then
        begin
          strGrdNF.Cells[2, j] := Copy(vAux.Strings[i], 7, Length(vAux.Strings[i]) - 6);
          strGrdNF.Cells[2, j] := StringReplace(strGrdNF.Cells[2, j], '.', '', [rfReplaceAll]);
        end else if Pos(vCdTotalNF, Copy(vAux.Strings[i], 1, 6)) > 0 then
        begin
          strGrdNF.Cells[3, j] := Copy(vAux.Strings[i], 7, Length(vAux.Strings[i]) - 6);
          strGrdNF.Cells[3, j] := StringReplace(strGrdNF.Cells[3, j], '.', '', [rfReplaceAll]);
        end;
      end;

      j := j + 1;
      iBQryNF.Next;
    end;
    if strGrdNF.RowCount > 0 then strGrdNF.RowCount := strGrdNF.RowCount - 1;
    vAux.Free;
    //exibe panel
    chkImportarTodas.Checked := true;
    pnlNFDDNota.Visible := True;
  end;


begin
  if nbNotaFiscal.ActivePage = 'I' then
  begin
    if datm_manut_proc.qry_processo_nf_.State in [dsInsert, dsEdit] then
    begin
      Application.MessageBox('Salve as alterações antes de Importar as Notas Fiscais.', 'Tabela em inserção/edição', MB_OK + MB_ICONWARNING);
      Exit;
    end;
  end;
  //abre qry e conecta o DDnota
  IBNF.Connected := True;
  if not IBTransaction.InTransaction then IBTransaction.StartTransaction;
  IBQryNF.Close;
  IBQryNF.ParamByName('processo').AsString := UpperCase(datm_manut_proc.qry_processo_NR_PROCESSO.AsString);
  IBQryNF.Open;
  if IBQryNF.IsEmpty then
  begin
    Application.MessageBox('Não há notas no sistema DDNota para este processo!', 'Notas Fiscais - DDNota', MB_OK + MB_ICONERROR);
  end else begin
    //pega campo total parametrizado para cliente
    if Sender <> nil then
    begin
      vCdTotalNF := '';
      vCdTotalNF := ConsultaLookUp('TEMPRESA_NAC', 'CD_EMPRESA', datm_manut_proc.qry_processo_CD_CLIENTE.AsString, 'CD_TOTAL_NF_DDNOTA');
    end;
    //caso não tenha campo abre tela para escolher
    if Trim(vCdTotalNF) = '' then
      pnlEscolha.Visible := True
    else if Length(Trim(vCdTotalNF)) = 6 then GeraDadosNF;
  end;
  if IBTransaction.InTransaction then IBTransaction.Commit;
  IBTransaction.Active := False;


end;

procedure Tfrm_manut_proc.lblSairClick(Sender: TObject);
var i: Byte;
begin
  pnlNFDDNota.Visible := false;
  //fecha qry
  IBQryNF.Close;
  IBNF.Connected := false;
  //limpa StringGrid
  for i := 0 to StrGrdNf.RowCount do
    strGrdNF.Rows[i].Clear;
  strGrdNF.RowCOunt := 0;

end;
                                
procedure Tfrm_manut_proc.btnImportarNFClick(Sender: TObject);
var i: byte;

  procedure InsereNF(vLinhaGrid: Integer);
  var vQryAux: TQuery;
  begin
    if Trim(strGrdNF.Cells[0, vLinhaGrid]) <> '' then
    begin
      try
        vQryAux := TQuery.Create(application);
        vQryAux.DataBaseName := 'DBBROKER';
        vQryAux.Close;
        vQryAux.SQL.Clear;

        if datm_manut_proc.qry_processo_nf_.Locate('NR_NOTA', Trim(strGrdNF.Cells[0, vLinhaGrid]), []) then
        begin
           vQryAux.SQL.Add('UPDATE TPROCESSO_NF SET DT_NOTA = :DT_NOTA, VL_NOTA = :VL_NOTA, CD_CFOP = :CFOP ');
           vQryAux.SQL.Add('WHERE NR_PROCESSO = "' + datm_manut_proc.qry_processo_NR_PROCESSO.AsString + '" AND NR_NOTA = :NF ');
         end else begin
           vQryAux.SQL.Add('INSERT INTO TPROCESSO_NF(NR_PROCESSO, NR_NOTA, DT_NOTA, VL_NOTA, CD_CFOP) ');
           vQryAux.SQL.Add('VALUES("' + datm_manut_proc.qry_processo_NR_PROCESSO.AsString + '", :NF, :DT_NOTA, :VL_NOTA, :CFOP) ');
         end;
         vQryAux.ParamByName('NF').AsString := Trim(strGrdNF.Cells[0, vLinhaGrid]);
         if StrToDateDef(strGrdNF.Cells[1, vLinhaGrid], 0) = 0 then
           vQryAux.ParamByName('DT_NOTA').AsString := ''
         else
           vQryAux.ParamByName('DT_NOTA').AsDateTime := StrToDate(strGrdNF.Cells[1, vLinhaGrid]);
         vQryAux.ParamByName('VL_NOTA').AsFloat := StrToFloatDef(Trim(strGrdNF.Cells[3, vLinhaGrid]), 0);
         vQryAux.ParamByName('CFOP').AsString := Trim(strGrdNF.Cells[2, vLinhaGrid]);
         vQryAux.ExecSQL;
      finally
        vQryAux.Free;
      end;
    end;
  end;

begin
  try
    if chkImportarTodas.Checked then
      for i := 0 to strGrdNF.RowCount do InsereNF(i)
    else
      InsereNF(strGrdNF.Row);

    datm_manut_proc.qry_processo_nf_.Close;
    datm_manut_proc.qry_processo_nf_.ParamByName('NR_PROCESSO').Value := datm_manut_proc.qry_processo_NR_PROCESSO.Value;
    datm_manut_proc.qry_processo_nf_.Open;
    VerNF;
  finally
    lblSairClick(nil);
  end;
end;

procedure Tfrm_manut_proc.msk_cd_unid_negEnter(Sender: TObject);
begin
  pesq_cd_unid_neg := Trim(msk_cd_unid_neg.Text);
end;

procedure Tfrm_manut_proc.dbedt_nr_nfChange(Sender: TObject);
begin
  if Not lAbertura then
    if ( datm_manut_proc.qry_exp_nf_.State in [ dsInsert, dsEdit ] ) then
       btn_mi(False, True, True, False);
end;

procedure Tfrm_manut_proc.lblSairEscolhaClick(Sender: TObject);
begin
  rbTotalNota.Checked := true;
  chkX.Checked := True;
  edtOutro.Clear;
  pnlEscolha.Visible := false;
end;

procedure Tfrm_manut_proc.rbOutroClick(Sender: TObject);
begin
 chkX.Checked := False;
end;

procedure Tfrm_manut_proc.btnAceitarClick(Sender: TObject);
begin
    if chkX.Checked then
    begin
    if rbTotalNota.Checked then vCdTotalNF := '000026'
    else if rbTotalProd.Checked then vCdTotalNF := '000099'
    else if rbBICMS.Checked then vCdTotalNF := '000101'
    else if (rbOutro.Checked) and (Length(Trim(edtOutro.Text)) = 6) then vCdTotalNF := Trim(edtOutro.Text)
    else vCdTotalNF := '';
  end else begin
    if rbTotalNota.Checked then vCdTotalNF := '000068'
    else if rbTotalProd.Checked then vCdTotalNF := '000052'
    else if rbBICMS.Checked then vCdTotalNF := '000050'
    else if (rbOutro.Checked) and (Length(Trim(edtOutro.Text)) = 6) then vCdTotalNF := Trim(edtOutro.Text)
    else vCdTotalNF := '';      
  end;
  lblSairEscolhaClick(nil);
  btnNotaFiscalClick(nil);
end;

procedure Tfrm_manut_proc.Btn_FronteiraImpClick(Sender: TObject);
begin
  if not lAbertura then
    Edita;
  if Sender is TSpeedButton then
  begin
    if not PoeEmEdicao(datm_manut_proc.qry_proc_im_) then
      exit;
    if (Sender as TSpeedButton).Enabled then
      datm_manut_proc.qry_proc_im_CD_FRONTEIRA.AsString := ConsultaOnLineEx('TLOCAL_EMBARQUE','Fronteira',['CODIGO','DESCRICAO'],['Código','Descrição'],'CODIGO',frm_main.mi_cad_local_emb);
  end
  else
    dbedt_nm_fronteiraImp.Text := ConsultaLookUP('TLOCAL_EMBARQUE','CODIGO',dbedt_cd_fronteiraImp.Text,'DESCRICAO');
end;

procedure Tfrm_manut_proc.btn_FronteiraExpClick(Sender: TObject);
begin
  if not lAbertura then
    Edita;
  if Sender is TSpeedButton then
  begin
    if not PoeEmEdicao(datm_manut_proc.qry_proc_em_) then
      exit;
    if (Sender as TSpeedButton).Enabled then
      datm_manut_proc.qry_proc_em_CD_FRONTEIRA.AsString := ConsultaOnLineEx('TLOCAL_EMBARQUE','Fronteira',['CODIGO','DESCRICAO'],['Código','Descrição'],'CODIGO',frm_main.mi_cad_local_emb);
  end
  else
    dbedt_nm_fronteiraExp.Text := ConsultaLookUP('TLOCAL_EMBARQUE','CODIGO',dbedt_cd_fronteiraExp.Text,'DESCRICAO');
end;

procedure Tfrm_manut_proc.ChkGeralRetificacaoClick(Sender: TObject);
begin
  if ChkGeralRetificacao.Checked then
  begin
    EditAdicao.Enabled := False;
    EditAdicao.Color   := clMenu;
  end
  else
  begin
    EditAdicao.Enabled := True;
    EditAdicao.Color   := clWindow;
  end;
  if Not lAbertura then
    Edita;
end;

procedure Tfrm_manut_proc.RdgTipoRetificacaoChange(Sender: TObject);
begin
  if Not lAbertura then
    Edita;
end;

procedure Tfrm_manut_proc.EditAdicaoChange(Sender: TObject);
begin
  if Not lAbertura then
    Edita;
end;

procedure Tfrm_manut_proc.dbedt_dt_nfExit(Sender: TObject);
begin
  //caso não tenha taxa de conversão, sugere uma
  if dbedt_dt_nf.Text <> '  /  /    ' then
  begin
    dbedt_dt_nf.Text := FormatDateTime('dd/mm/yyyy', dbedt_dt_nf.Date);

    if (dbedtVlTaxaNF.Text = '') or (vDtTaxa <> StrToDate(dbedt_dt_nf.Text)) then
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
          if not PoeEmEdicao(datm_manut_proc.qry_exp_nf_) then Exit;
          datm_manut_proc.qry_exp_nf_VL_TAXA.AsFloat := Fields[0].AsFloat;
        end;
        Close;
        Free;
      end;
    end;
  end;
end;

procedure Tfrm_manut_proc.dbedt_dt_nfEnter(Sender: TObject);
begin
  if dbedt_dt_nf.Text <> '  /  /    ' then
  begin
    vDtTaxa := datm_manut_proc.qry_exp_nf_DT_NOTA.AsDateTime;
    dbedt_dt_nf.Text := FormatDateTime('dd/mm/yyyy', datm_manut_proc.qry_exp_nf_DT_NOTA.AsDateTime);
  end;
end;

procedure Tfrm_manut_proc.dbedt_dt_faturaChange(Sender: TObject);
begin
  if not lAbertura then
    if ( datm_manut_proc.qry_Doctos_Inst.State in [ dsInsert, dsEdit ] ) then
       btn_mi(False, True, True, False);
end;

procedure Tfrm_manut_proc.BtnPrimeiroPortoAtracClick(Sender: TObject);
begin
  if not lAbertura then Edita;
  if Sender is TSpeedButton then
  begin
    if not PoeEmEdicao(datm_manut_proc.qry_proc_im_) then exit;
    If (Sender as TSpeedButton).Enabled Then
      datm_manut_proc.qry_proc_im_CD_PRIMEIRO_PORTO_ATRAC.AsString := ConsultaOnLineEx('TLOCAL_EMBARQUE','1º Porto de Atracação',['CODIGO','DESCRICAO'],['Código','Nome'],'CODIGO',frm_main.mi_cad_local_emb, 1, dbedt_cd_PrimeiroPortoAtrac.Text)
  end
  else
    EditPrimeiroPortoAtrac.Text := ConsultaLookUP('TLOCAL_EMBARQUE','CODIGO',dbedt_cd_PrimeiroPortoAtrac.Text,'DESCRICAO');
end;

procedure Tfrm_manut_proc.AtualizaItensDI;
begin
  //Verifica se existe Itens de DI utilizando a Referência/Item/Parcial alterada,
  //Caso exista, será avisado o usuário que os valores serão alterados
  with TQuery.Create(Application) do
  begin
    DatabaseName := 'DBBROKER';
    SQL.Clear;
    SQL.Add('SELECT count(*) cont FROM TDETALHE_MERCADORIA (NOLOCK) ');
    SQL.Add('WHERE NR_PROCESSO =:NR_PROCESSO  AND NR_PROC_PO =:NR_PROC_PO_ANT and ');
    SQL.Add('NR_ITEM_PO =:NR_ITEM_PO_ANT and NR_PARCIAL =:NR_PARCIAL_ANT');

    ParamByName('NR_PROCESSO').AsString := datm_manut_proc.qry_processo_NR_PROCESSO.AsString;

    ParamByName('NR_PROC_PO_ANT').AsString  := RefAtual.CD_REFERENCIA;
    ParamByName('NR_ITEM_PO_ANT').AsString  := RefAtual.NR_ITEM_PO;
    ParamByName('NR_PARCIAL_ANT').AsInteger := RefAtual.NR_PARCIAL;

    Open;
    if FieldByName('cont').AsInteger > 0 then
      BoxMensagem( 'Atenção ! Nesta DI, existem Itens com esta Referência/Item/Parcial e eles serão atualizadas! ', 2 );

    Close;
    SQL.Clear;
    SQL.Add('UPDATE TDETALHE_MERCADORIA SET');
    SQL.Add('   NR_PROC_PO =:NR_PROC_PO, ');
    SQL.Add('   NR_ITEM_PO =:NR_ITEM_PO, ');
    SQL.Add('   NR_PARCIAL =:NR_PARCIAL');
    SQL.Add('WHERE');
    SQL.Add('   NR_PROCESSO =:NR_PROCESSO    AND NR_PROC_PO =:NR_PROC_PO_ANT AND');
    SQL.Add('   NR_ITEM_PO  =:NR_ITEM_PO_ANT AND NR_PARCIAL =:NR_PARCIAL_ANT');

    ParamByName('NR_PROCESSO').AsString := datm_manut_proc.qry_processo_NR_PROCESSO.AsString;

    ParamByName('NR_PROC_PO').AsString  := Trim(dbedt_cd_ref_normal.Text);
    ParamByName('NR_ITEM_PO').AsString  := Trim(CmbItens.Text);
    ParamByName('NR_PARCIAL').AsInteger := StrToInt(CmbParciais.Text);

    //Record "RefAtual" alimentado no AfterScroll do qry_ref_cliente_
    ParamByName('NR_PROC_PO_ANT').AsString  := RefAtual.CD_REFERENCIA;
    ParamByName('NR_ITEM_PO_ANT').AsString  := RefAtual.NR_ITEM_PO;
    ParamByName('NR_PARCIAL_ANT').AsInteger := RefAtual.NR_PARCIAL;

    ExecSql;
    Free;
  end;
end;

procedure Tfrm_manut_proc.ApagaItensDI;
begin
  with TQuery.Create(Application) do
  begin
    DatabaseName := 'DBBROKER';
    SQL.Clear;
    SQL.Add('UPDATE TDETALHE_MERCADORIA SET ');
    SQL.Add('  NR_PROC_PO = NULL, NR_ITEM_PO = NULL, NR_PARCIAL = NULL');
    SQL.Add('WHERE');
    SQL.Add('   NR_PROCESSO =:NR_PROCESSO   AND');
    SQL.Add('   NR_PROC_PO =:NR_PROC_PO_ANT AND ');
    SQL.Add('   NR_ITEM_PO =:NR_ITEM_PO_ANT AND ');
    SQL.Add('   NR_PARCIAL =:NR_PARCIAL_ANT');

    ParamByName('NR_PROCESSO').AsString := datm_manut_proc.qry_processo_NR_PROCESSO.AsString;

    ParamByName('NR_PROC_PO_ANT').AsString  := RefAtual.CD_REFERENCIA;
    ParamByName('NR_ITEM_PO_ANT').AsString  := RefAtual.NR_ITEM_PO;
    ParamByName('NR_PARCIAL_ANT').AsInteger := RefAtual.NR_PARCIAL;

    ExecSql;
    Free;
  end;
end;

procedure Tfrm_manut_proc.AtualizaTEstagio;
begin
  with TQuery.Create(Application) do
  begin
    DatabaseName := 'DBBROKER';
    SQL.Clear;
    SQL.Add('DELETE FROM TESTAGIO_PROCESSO');
    SQL.Add('WHERE');
    SQL.Add('   NR_PROCESSO_DES =:NR_PROCESSO   AND');
    SQL.Add('   NR_REFERENCIA   =:NR_PROC_PO_ANT AND ');
    SQL.Add('   NR_ITEM_CLIENTE =:NR_ITEM_PO_ANT AND ');
    SQL.Add('   NR_PARCIAL      =:NR_PARCIAL_ANT AND');
    SQL.Add('   NR_PROCESSO_ADM IS NULL');

    ParamByName('NR_PROCESSO').AsString := datm_manut_proc.qry_processo_NR_PROCESSO.AsString;

    ParamByName('NR_PROC_PO_ANT').AsString  := RefAtual.CD_REFERENCIA;
    ParamByName('NR_ITEM_PO_ANT').AsString  := RefAtual.NR_ITEM_PO;
    ParamByName('NR_PARCIAL_ANT').AsInteger := RefAtual.NR_PARCIAL;

    ExecSql;
    Free;
  end;
end;


procedure Tfrm_manut_proc.dbedt_cd_ref_normalExit(Sender: TObject);
begin
  if Trim(dbedt_cd_ref_normal.Text) <> '' then
    if datm_manut_proc.qry_ref_cliente_.State in [dsInsert, dsEdit] then
      ConsisteCmbsReferencia;
end;

function Tfrm_manut_proc.ConsisteCmbsReferencia : Boolean;
var
vVerificaLi:string;
i:integer;
begin
  Result := True;
  if datm_manut_proc.qry_ref_cliente_CD_REFERENCIA.AsString <> '' then
  begin
    with TQuery.Create(Application) do
    begin
      Close;
      DataBaseName := 'DBBROKER';
      SQL.Add('select NR_REFERENCIA, NR_ITEM_CLIENTE, NR_PARCIAL, NR_PROCESSO_ADM, NR_PROCESSO_DES');
      SQL.Add('from TESTAGIO_PROCESSO (NOLOCK) ');
      SQL.Add('where');
      SQL.Add('  NR_REFERENCIA =:NR_REFERENCIA AND NR_PROCESSO_DES IS NULL AND CD_EMPRESA = :CD_EMPRESA AND NR_PARCIAL > 0 ');
      ParamByName('NR_REFERENCIA').AsString := dbedt_cd_ref_normal.Text;
      ParamByName('CD_EMPRESA').AsString := datm_manut_proc.qry_processo_CD_CLIENTE.AsString;
      Open;


      if IsEmpty then
      begin
        CmbItens.Style    := csDropDown;
        CmbItens.Items.Clear;

        CmbParciais.Items.Clear;

     {   CmbParciais.Items.Add('1'); //Foi mudado para 1 a pedido do Vitor

        //GAMBI !!! Devido ao fato de não utilizar adm de pedido, a parcial pode ser outro valor diferente de 1 então
        //para aparecer certo na tela, foi feito a inclusão de mais 9 itens no combo para garantir que irá
        //aparecer certo na tela.
        CmbParciais.Items.Add('2');
        CmbParciais.Items.Add('3');
        CmbParciais.Items.Add('4');
        CmbParciais.Items.Add('5');
        CmbParciais.Items.Add('6');
        CmbParciais.Items.Add('7');
        CmbParciais.Items.Add('8');
        CmbParciais.Items.Add('9');   }

        for i := 1 to 200 do
        begin
          CmbParciais.Items.Add(inttostr(i));
        end;
        CmbParciais.ItemIndex := 0;

        Free;
        Exit;
      end
      else
      begin
        vVerificaLi:= ConsultaLookUPSQL('SELECT IN_LI FROM TSERVICO (NOLOCK) WHERE CD_SERVICO = '''+ datm_manut_proc.qry_processo_CD_SERVICO.AsString +'''','IN_LI');
        if (FieldByName('NR_PROCESSO_ADM').AsString <> '') and (vVerificaLi <> '1')  then  //se estiver preenchido, então veio de um processo adm
        begin
          CmbItens.Style    := csDropDownList;
          CmbParciais.Style := csDropDownList;
        end
        else
        begin
          CmbItens.Style    := csDropDown;
          //CmbParciais.Style := csDropDown;
        end;
      end;

      First;
      CmbItens.Items.Clear;
      while not Eof do
      begin
        if CmbItens.Items.IndexOf(FieldByName('NR_ITEM_CLIENTE').AsString) = -1 then
          CmbItens.Items.Add(FieldByName('NR_ITEM_CLIENTE').AsString);
        Next;
      end;
      if CmbItens.Items.Count = 1 then
        CmbItens.ItemIndex := 0;

      First;
      CmbParciais.Items.Clear;
      while not Eof do
      begin
        if CmbParciais.Items.IndexOf(FieldByName('NR_PARCIAL').AsString) = -1 then
          if (FieldByName('NR_PARCIAL').AsInteger <> 0) or (FieldByName('NR_PROCESSO_ADM').AsString = '') then
            CmbParciais.Items.Add(FieldByName('NR_PARCIAL').AsString);
        Next;
      end;
      if CmbItens.ItemIndex <> -1 then //Só vai deixar alimentado se o campo dos itens já estiver alimentado
        if CmbParciais.Items.Count = 1 then
          CmbParciais.ItemIndex := 0;
      Free;
    end;
  end;
end;


procedure Tfrm_manut_proc.AtualizaCmbParciais;
begin
  with TQuery.Create(Application) do
  begin
    Databasename := 'DBBROKER';
    SQL.Clear;
    SQL.Add('select NR_REFERENCIA, NR_ITEM_CLIENTE, NR_PARCIAL, NR_PROCESSO_DES, NR_PROCESSO_ADM');
    SQL.Add('from TESTAGIO_PROCESSO (NOLOCK) ');
    SQL.Add('where');
    SQL.Add('  NR_REFERENCIA =:NR_REFERENCIA AND NR_ITEM_CLIENTE =:NR_ITEM_CLIENTE');
//    SQL.Add('  AND NR_PROCESSO_ADM IS NOT NULL');
    ParamByName('NR_REFERENCIA').AsString := dbedt_cd_ref_normal.Text;
    ParamByName('NR_ITEM_CLIENTE').AsString    := CmbItens.Text;
    Open;

    if IsEmpty then
    begin
      CmbItens.Style    := csDropDown;
      CmbParciais.Style := csDropDown;
      CmbItens.Text     := '';
      CmbParciais.Text  := '';
    end
    else
    begin
      if FieldByName('NR_PROCESSO_ADM').AsString <> '' then  //se estiver preenchido, então veio de um processo adm
      begin
        CmbItens.Style    := csDropDownList;
        //CmbParciais.Style := csDropDownList;
      end;
    end;

    First;
    CmbParciais.Items.Clear;
    while not Eof do
    begin
      if CmbParciais.Items.IndexOf(FieldByName('NR_PARCIAL').AsString) = -1 then
        if (FieldByName('NR_PARCIAL').AsInteger <> 0) then
        begin
          CmbParciais.Style := csDropDownlist;
          CmbParciais.Items.Add(FieldByName('NR_PARCIAL').AsString);
        end
        else
        begin
          CmbParciais.Style := csDropDown;
        end;
      Next;
    end;
    if CmbParciais.Items.Count = 1 then
      CmbParciais.ItemIndex := 0;
    Free;
  end;
end;

function Tfrm_manut_proc.VerifRefRepetida : Boolean;
begin
  Result := False;
  with TQuery.Create(Application) do
  begin
    DataBaseName := 'DBBROKER';
    SQL.Clear;
    SQL.Add('SELECT CD_REFERENCIA FROM TREF_CLIENTE (NOLOCK) ');
    SQL.Add('WHERE NR_PROCESSO   = ''' + datm_manut_proc.qry_processo_NR_PROCESSO.AsString     + ''' ');
    SQL.Add('  AND CD_REFERENCIA = ''' + Trim( dbedt_cd_ref_normal.Text )                      + ''' ');
    SQL.Add('  AND NR_ITEM_PO    = ''' + Trim( CmbItens.Text)                                  + ''' ');
    SQL.Add('  AND NR_PARCIAL    = ''' + Trim( CmbParciais.Text)                               + ''' ');
    SQL.Add('  AND NR_SEQUENCIA <> ''' + datm_manut_proc.qry_ref_cliente_NR_SEQUENCIA.AsString + ''' ');
    Open;
    if RecordCount > 0 then
    begin
      Result := True;
    end;
    Free;
  end;
end;

function TFrm_manut_proc.ConsisteRefRepetida : Boolean;
var
  S: String;
begin
  Result := True;
  if msk_cd_produto.Text='01' then
  begin
    //só fazer a consistência se o pedido não tiver processo adm
    //if ConsultaLookUPSQL('SELECT NR_PROCESSO FROM TPO_ITEM(NOLOCK) WHERE NR_PROCESSO = ''' + dbedt_cd_ref_normal.Text + '''','NR_PROCESSO') = '' then
    begin
      with TQuery.Create(Application) do
      begin
        try
          DataBaseName := 'DBBROKER';
          SQL.Clear;
          SQL.Add('SELECT NR_PROCESSO, NR_PARCIAL');
          SQL.Add('FROM TREF_CLIENTE (NOLOCK)');
          SQL.Add('WHERE CD_REFERENCIA = :CD_REFERENCIA');
          SQL.Add('  AND NR_ITEM_PO    = :NR_ITEM_PO');
          SQL.Add('  AND NR_PARCIAL    = :NR_PARCIAL');
          SQL.Add('  AND CD_EMPRESA    = :CD_EMPRESA');
          //SQL.Add('  AND NR_SEQUENCIA <> :NR_SEQUENCIA'); //Guilherme - 20/09/2011

          ParamByName('CD_REFERENCIA').AsString := dbedt_cd_ref_normal.Text;
          ParamByName('NR_ITEM_PO').AsString    := Trim(CmbItens.Text);
          ParamByName('NR_PARCIAL').AsInteger   := StrToInt(CmbParciais.Text);
          ParamByName('CD_EMPRESA').AsInteger   := StrToInt(dbedt_cd_cliente.Text);
          //ParamByName('NR_SEQUENCIA').AsString  := datm_manut_proc.qry_ref_cliente_.FieldByName('NR_SEQUENCIA').AsString;  //Guilherme - 20/09/2011

          Open;
          if not IsEmpty then
          begin
            S := '';
            First;
            while not Eof do
            begin
              S := S + ', ' + FieldByName('NR_PROCESSO').AsString;
              Next;
            end;
            System.Delete(S, 1, 2);

            if datm_manut_proc.qry_ref_cliente_TP_REFERENCIA.AsString = '01' then
            begin
              MessageDlg('Este Pedido/Item/Parcial já está sendo utilizado no(s) processo(s): ' + S + '.'#13 +
                 'Favor selecionar outro Pedido/Item/Parcial.', mtInformation, [mbOk], 0);
              Result := False;
              Exit;
            end
            else if MessageDlg('Este Pedido/Item/Parcial já está sendo utilizado em outro processo.'#13 +
               'Deseja continuar mesmo assim?', mtInformation, [mbYes, mbNo], 0) <> mrYes then
            begin
              Result := False;
              Exit;
            end;
          end;
        finally
          Free;
        end;
      end;
    end;
  end
  else // Exportação
  begin
    with TQuery.Create(Application) do
    begin
      try
        DataBaseName := 'DBBROKER';
        SQL.Clear;
        SQL.Add('SELECT NR_PROCESSO, NR_PARCIAL, TP_REFERENCIA');
        SQL.Add('FROM TREF_CLIENTE (NOLOCK)');
        SQL.Add('WHERE CD_REFERENCIA = :CD_REFERENCIA');
        SQL.Add('  AND NR_ITEM_PO    = :NR_ITEM_PO');
        //SQL.Add('  AND NR_SEQUENCIA <> :NR_SEQUENCIA'); //Guilherme - 20/09/2011

        ParamByName('CD_REFERENCIA').AsString := dbedt_cd_ref_normal.Text;
        ParamByName('NR_ITEM_PO').AsString    := Trim(CmbItens.Text);
        //ParamByName('NR_SEQUENCIA').AsString  := datm_manut_proc.qry_ref_cliente_.FieldByName('NR_SEQUENCIA').AsString;  //Guilherme - 20/09/2011

        Open;
        S := '';
        First;
        while not Eof do
        begin
          S := S + ', ' + FieldByName('NR_PROCESSO').AsString;
          Next;
        end;
        System.Delete(S, 1, 2);
        
        if (not IsEmpty) and (MessageDlg('Este Pedido/Item/Parcial já está sendo utilizado nos(s) processo(s): ' + S + '.'#13 +
           'Deseja continuar mesmo assim?', mtInformation, [mbYes, mbNo], 0) <> mrYes) then
        begin
          Result := False;
          Exit;
        end;
      finally
        Free;
      end;
    end;
  end;

  // Validações feitas por Michel para que só possa existir um pedido para o processo de importação e que os outros tipo, inclusive para exportação, questionem antes de salvar - 03/11/2011
  {with TQuery.Create(Application) do
  begin
    try
      DataBaseName := 'DBBROKER';
      SQL.Clear;
      SQL.Add('SELECT TP_REFERENCIA');
      SQL.Add('FROM TREF_CLIENTE');
      SQL.Add('WHERE NR_PROCESSO   = :NR_PROCESSO');
      SQL.Add('  AND TP_REFERENCIA = :TP_REFERENCIA');
      SQL.Add('  AND NR_SEQUENCIA <> :NR_SEQUENCIA');
      ParamByName('NR_PROCESSO').AsString   := datm_manut_proc.qry_processo_NR_PROCESSO.AsString;
      ParamByName('TP_REFERENCIA').AsString := datm_manut_proc.qry_ref_cliente_TP_REFERENCIA.AsString;
      ParamByName('NR_SEQUENCIA').AsString  := datm_manut_proc.qry_ref_cliente_NR_SEQUENCIA.AsString;
      Open;
      if RecordCount > 0 then
        if (Trim(datm_manut_proc.qry_ref_cliente_TP_REFERENCIA.AsString) = '01') and (datm_manut_proc.qry_processo_CD_PRODUTO.AsString = '01') then 
        begin
          MessageDlg('Já existe uma referência do tipo Pedido neste processo.', mtInformation, [mbOk], 0);
          Result := False;
          Exit;
        end
        else if MessageDlg('Já existe(m) outra(s) referência(s) do tipo ' + dblck_tp_referencia.Text +
           ' neste processo.'#13'Deseja continuar mesmo assim?', mtInformation, [mbYes, mbNo], 0) <> mrYes then
        begin
          Result := False;
          Exit;
        end;
    finally
      Free;
    end;
  end;}
end;

function Tfrm_manut_proc.VerifRefOrdemRepetida : Boolean;
begin
  Result := False;
  with TQuery.Create(Application) do
  begin
    DataBaseName := 'DBBROKER';
    SQL.Clear;
    SQL.Add('SELECT CD_REFERENCIA FROM TREF_CLIENTE TR (NOLOCK)                    ');
    SQL.Add('INNER JOIN TPROCESSO tp (NOLOCK) on tp.NR_PROCESSO = tr.NR_PROCESSO            ');
    SQL.Add('WHERE TP_REFERENCIA   = "02" and IN_CANCELADO = "0"                   ');
    SQL.Add('  AND CD_REFERENCIA = ''' + Trim( dbedt_cd_ref_normal.Text ) + '''    ');
    Open;
    if RecordCount > 0 then
    begin
      Result := True;
    end;
    Free;
  end;
end;

procedure Tfrm_manut_proc.CmbItensClick(Sender: TObject);
begin
  if Not lAbertura then
    btn_mi(False, True, True, False);
  AtualizaCmbParciais;
end;

procedure Tfrm_manut_proc.CmbItensExit(Sender: TObject);
begin
  CmbItens.Text := Copy('0000',1,4-Length(CmbItens.Text)) + CmbItens.Text;
end;

procedure Tfrm_manut_proc.btn_co_local_entrega_emClick(Sender: TObject);
begin
  if Not lAbertura then Edita;
  if Sender is TSpeedButton then
  begin
    if not PoeEmEdicao(datm_manut_proc.qry_proc_em_) then exit;
    If (Sender as TSpeedButton).Enabled Then
      datm_manut_proc.qry_proc_em_CD_LOCAL_TRANSBORDO.AsString := ConsultaOnLineEx('TLOCAL_EMBARQUE','Local Desembarque',['CODIGO','DESCRICAO'],['Código','Nome'],'CODIGO',frm_main.mi_cad_local_emb, 1, dbedt_cd_local_transb_em.text);
  end
  else dbedt_nm_local_transb_em.Text := ConsultaLookUP('TLOCAL_EMBARQUE','CODIGO',dbedt_cd_local_transb_em.Text,'DESCRICAO');
end;

procedure Tfrm_manut_proc.dbedt_cd_local_transb_emChange(Sender: TObject);
begin
  if Not lAbertura then Edita;
  if Sender is TSpeedButton then
  begin
    if not PoeEmEdicao(datm_manut_proc.qry_proc_em_) then exit;
    If (Sender as TSpeedButton).Enabled Then
      datm_manut_proc.qry_proc_em_CD_LOCAL_TRANSBORDO.AsString := ConsultaOnLineEx('TLOCAL_EMBARQUE','Local Desembarque',['CODIGO','DESCRICAO'],['Código','Nome'],'CODIGO',frm_main.mi_cad_local_emb, 1, dbedt_cd_local_transb_em.text);
  end
  else dbedt_nm_local_transb_em.Text := ConsultaLookUP('TLOCAL_EMBARQUE','CODIGO',dbedt_cd_local_transb_em.Text,'DESCRICAO');
end;

procedure Tfrm_manut_proc.DBEdit5Exit(Sender: TObject);
begin
  if (DBEdit5.Text <> '') and (datm_manut_proc.qry_proc_im_.State in [dsInsert, dsEdit]) then
  begin
    datm_manut_proc.qry_proc_im_.FieldByName('NR_PRESENCA_CARGA').AsString := 'CEMERCANTE31032008' + DBEdit5.Text;
    dbedt_dt_pres_carga_im.SetFocus;
  end;
end;

procedure Tfrm_manut_proc.edt_selectALL(Sender: TObject);
begin
  TEdit(Sender).SelectAll;
end;

procedure Tfrm_manut_proc.dbedt_nr_cntrExit(Sender: TObject);
begin
  if not ( datm_manut_proc.qry_proc_cntr_.State in [dsInsert, dsEdit] ) then exit;

  if length(alltrim(TDBEdit(sender).Text))>1 then
     if datm_manut_proc.transp_servico <> '07' then
     if not( ValidaContainer(trim(TDBEdit(sender).Text))) then
     begin
       showmessage('Digito do Container Inválido');
       FocaEmContainer;
       abort;
     end;
end;

procedure Tfrm_manut_proc.dblup_Tp_EstufagemClick(Sender: TObject);
begin
  if (not lAbertura) and (datm_manut_proc.qry_proc_carga_solta_.State in [dsInsert, dsEdit]) then
  begin
    btn_mi(False, True, True, False);
    datm_manut_proc.qry_proc_carga_solta_NM_ESPECIE.AsString := dblup_Tp_Estufagem.Text;
  end;
end;

{

By Carlos ( FEV/2010 )

}
function Tfrm_manut_proc.Consulta_RE_MANUT( Usuario: String ):Boolean;
var
   Res:Integer;
   str_numero_re, str_anexo,vSenhaSiscomex,vCpfUsuario,CNPJ_EMPRESA,str_CD_EMPRESA : String;
   i : Integer;
   qtd_anexos, a : Integer;
   ByHLLAPI: TByHLLAPI;
   Captura_telas:TMEMO;
begin
   result:=False;
   if usuario='' then exit;


   PausarMySenhas;


   with TQuery.Create(application) do begin
      DatabaseName := 'DBBROKER';
      SQL.Clear;
      SQL.Add('SELECT distinct CD_SENHA_SCX, CPF_USUARIO, CPF_USUARIO CNPJ_REPRES FROM VW_DESPACHANTE_CLIENTE WHERE CD_ACESSO = "' + Usuario + '"');
      Open;
      vSenhaSiscomex    := FieldByName('CD_SENHA_SCX').AsString;
      vCpfUsuario       := FieldByName('CPF_USUARIO').AsString;
      close;
      free;
   end;

   ByHLLAPI:=TByHLLAPI.Create(Application);
   captura_telas:=TMemo.CreateParented(Application.Handle);

   try
     try
       ByHLLAPI.HLLAPIKind := hkIWW4;
       ByHLLAPI.DllName    := 'WHLLAPI.DLL';
       ByHLLAPI.DllFunc    := 'WINHLLAPI';
       ByHLLAPI.IPAddress  := '127.0.0.1';
       ByHLLAPI.IPPort     := 4321;
       ByHLLAPI.TimeOut    := 60000;


       { inicia o carregamento do emulador do siscomex } //by Carlos - 07/01/2010
       if FindWindow(nil,'TN3270') = 0 then
         WinExec('C:\IWWTCPIP\EMU.EXE SESSIONA.EMU',SHOW_OPENWINDOW);


       Sleep(3000);

       ByHLLAPI.ExePath := ExtractFileDir( Application.ExeName );
       ByHLLAPI.ExeName := 'BySrv16.EXE';



       ByHLLAPI.TimeOut := ( 240 * 1000 );

       ByHLLAPI.DescarregaDLL;
       Sleep(3000);
       ByHLLAPI.CarregaDLL;
       ByHLLAPI.ResetaConectaPS( 'A' );
       { finaliza o carregamento do emulador do siscomex }


        { Logon }
        while not ( ByHLLAPI.ScrComp( 1, 3, 'TELA 001' ) ) do begin
          Res := ByHLLAPI.SendKey( C_PF3, True );
          Res := ByHLLAPI.Wait( True );
          Sleep(2000);
        end;

        ByHLLAPI.CopyString2PS( 16, 12, vCPFUsuario );
        ByHLLAPI.CopyString2PS( 17, 12, vSenhaSiscomex );
        ByHLLAPI.CopyString2PS( 18, 12, 'SISCOMEX' );

        Res := ByHLLAPI.SendKey( C_ENTER, True );
        Res := ByHLLAPI.Wait( True );

        PosicaoPalavra('POSICURSOR','CONRE');
        if not ByHLLAPI.ScrComp( linha_palavra, coluna_palavra, palavra) then begin
           Sleep(3000);
           exit;
        end;

        result:=True;

        ByHLLAPI.CopyString2PS( 22, 15, 'REGI-OPER' );
        Res := ByHLLAPI.SendKey( C_ENTER, True );
        Res := ByHLLAPI.Wait( True );


        { by Carlos - 16/03/2010    busca o codigo do exportador na capa de RE }
        str_CD_EMPRESA:= ConsultaLookUP('TRE_CAPA','NR_PROCESSO',datm_manut_proc.qry_processo_NR_PROCESSO.AsString,'CD_EXPORTADOR');

        { by Carlos - 16/03/2010    usa o CNPJ do exportador da capa de RE }
        CNPJ_EMPRESA  := ConsultaLookUP('TEMPRESA_NAC','CD_EMPRESA',str_CD_EMPRESA,'CGC_EMPRESA' );

        { by Carlos - 16/03/2010    se não existir o registro pelo MyIndaia então usa o do cliente }
        if CNPJ_EMPRESA='' then begin
          if (ConsultaLookUP('TEMPRESA_NAC','CD_EMPRESA',datm_manut_proc.qry_processo_CD_CLIENTE.AsString,'CD_TIPO_PESSOA') = '1') then  begin
            CNPJ_EMPRESA:= ConsultaLookUP('TEMPRESA_NAC','CD_EMPRESA',datm_manut_proc.qry_processo_CD_CLIENTE.AsString,'CGC_EMPRESA')
          end else begin
            CNPJ_EMPRESA:= ConsultaLookUP('TEMPRESA_NAC','CD_EMPRESA',datm_manut_proc.qry_processo_CD_CLIENTE.AsString,'CPF_EMPRESA');
          end;
        end;


        PosicaoPalavra('PREENCHASOLIC','CONRE');
        if ( ByHLLAPI.ScrComp( linha_palavra, coluna_palavra, palavra ) ) then begin
           ByHLLAPI.CopyString2PS( 18, 29, CNPJ_EMPRESA);
           ByHLLAPI.CopyString2PS( 18, 48, vCPFUsuario );
           Res := ByHLLAPI.SendKey( C_ENTER, True );
           Res := ByHLLAPI.Wait( True );
        end;


        PosicaoPalavra('REGOPEREXP','CONRE');
        if ( ByHLLAPI.ScrComp( linha_palavra, coluna_palavra, palavra ) ) then begin
           ByHLLAPI.CopyString2PS( 22, 18, 'PCEX300' );
           Res := ByHLLAPI.SendKey( C_ENTER, True );
           Res := ByHLLAPI.Wait( True );

           PosicaoPalavra('MCEX300','CONRE');
           while not ( ByHLLAPI.ScrComp( linha_palavra, coluna_palavra, palavra ) ) do begin
              Res := ByHLLAPI.SendKey( C_ENTER, True );
              Res := ByHLLAPI.Wait( True );
           end;
        end;


        str_numero_re := StringReplace(datm_manut_proc.qry_exp_re_NR_RE.AsString, '/', '', [rfReplaceAll]);
        str_numero_re := StringReplace(str_numero_re, '-', '', [rfReplaceAll]);

        qtd_anexos:=strToInt( Copy(str_numero_re,10,3));

        str_numero_re := Copy(str_numero_re,1,9);
        for a:=1 to qtd_anexos do begin
          str_anexo:=strzero(a,3);
          //
          ByHLLAPI.CopyString2PS( 20, 20, '  ' );
          ByHLLAPI.CopyString2PS( 20, 20, '07' );
          ByHLLAPI.CopyString2PS( 20, 41, str_numero_re );
          ByHLLAPI.CopyString2PS( 20, 53, str_anexo     );
          //
          Res := ByHLLAPI.SendKey( C_ENTER, True );
          Res := ByHLLAPI.Wait( True );
          //
          while not ( ByHLLAPI.ScrComp( 1, 2, 'ULTIMA PAGINA' ) ) do begin
             {salva tela}
             i:=1;
             while i <= 25 do begin
               captura_telas.Lines.Add( ByHLLAPI.CopyPS2String( i, 1, 80, Res) );
               i:=i+1;
             end;

             Res := ByHLLAPI.SendKey( C_ENTER, True );
             Res := ByHLLAPI.Wait( True );
          end;

          {  Voltar ao menu para selecionar outro RE }
          Res := ByHLLAPI.SendKey( C_PF6 , True );
          Res := ByHLLAPI.Wait( True );

        end;


        captura_telas.Lines.SaveToFile('H:\TXT_RE\CONSULTA_RE'+datm_manut_proc.qry_exp_re_NR_RE.AsString+'.txt');

     except
       on e:Exception do ShowMessage(e.Message);
     end;

   finally

     { retira da memoria o emulador do siscomex }
     ByHLLAPI.DescarregaDLL;
     TerminateProcesso('ntvdm.exe');

     ByHLLAPI.Free;
     captura_telas.Free;

     ContinuarMySenhas;

   end;



end;




procedure Tfrm_manut_proc.dbedt_cd_servicoExit(Sender: TObject);
begin
  // Não utilizar o CodExists para o serviço, fazer as validações específicas - Michel - 05/03/2010
  //CodExits;
  // Aqui estava o bloco que está na função ConsisteServico - Michel - 19/07/2010
  ConsisteServico;
end;

// by Carlos - somente re-compilar esta unit para versão 08.14      (25/03/2010)

procedure Tfrm_manut_proc.FormShow(Sender: TObject);
begin
  pgctrl_manut_proc.ActivePage := ts_lista;
  tag:=0;
end;

procedure Tfrm_manut_proc.duplicar_referenciaClick(Sender: TObject);
begin
  //by Carlos - 14/07/2010
  if datm_manut_proc.qry_ref_cliente_TP_REFERENCIA.AsString<>'01' then
  begin
     Showmessage('Somente Pedido pode ser duplicado');
     exit;
  end;

  edt_duplicar_referencia.Text := '';
  pnl_duplicar_referencia.Visible := True;
  edt_duplicar_referencia.SetFocus;
end;

procedure Tfrm_manut_proc.btn_duplicar_referenciaClick(Sender: TObject);
var
  parcial_maxima  : string;
  parcial_clicada : string;
  parcial_check : Boolean;
//  NrSequenciaAnt : string;
// vRefClienteHabilitacao,
    I, nSeq : Integer;
begin
  { by carlos - 14/07/2010 - pegar o ultimo seguencial }
  with TQuery.Create(application) do begin
     DatabaseName := 'DBBROKER';
     SQL.Clear;
     SQL.Add (' Select isnull(MAX(NR_SEQUENCIA),0) FROM TREF_CLIENTE (NOLOCK) ');
     SQL.Add (' where NR_PROCESSO= :NR_PROCESSO ');
     ParamByName('NR_PROCESSO').AsString    :=datm_manut_proc.qry_ref_cliente_NR_PROCESSO.AsString;
     Open;
     nSeq:=Fields[0].AsInteger;
     close;
     free;
  end;

  I := 1;
  parcial_clicada := datm_manut_proc.qry_ref_cliente_NR_PARCIAL.asString;
  parcial_check := False;
  while I <= StrToInt(edt_duplicar_referencia.Text)-1 do
  begin
    with TQuery.Create(application) do begin
      DatabaseName := 'DBBROKER';
      if not parcial_check then
      begin
        SQL.Clear;
        SQL.Add(' SELECT MAX(NR_PARCIAL) AS MAXIMA FROM TREF_CLIENTE (NOLOCK) WHERE NR_PROCESSO = '''+ datm_manut_proc.qry_ref_cliente_NR_PROCESSO.AsString +''' ');
        SQL.Add(' AND CD_REFERENCIA = '''+ datm_manut_proc.qry_ref_cliente_CD_REFERENCIA.AsString + ''' AND NR_ITEM_PO = '''+ datm_manut_proc.qry_ref_cliente_NR_ITEM_PO.AsString +'''');
        Open;
        parcial_maxima :=  FieldByName('MAXIMA').AsString;
        Close;
        parcial_check := True;
      end;
      if parcial_clicada = parcial_maxima then
      begin
        Inc(nSeq);
        SQL.Clear;
        SQL.Add (' INSERT INTO TREF_CLIENTE (  ');
        SQL.Add (' NR_PROCESSO, NR_SEQUENCIA, CD_REFERENCIA, CD_REF_EXP, DT_REFERENCIA, TP_REFERENCIA, CD_AREA, NR_ITEM_PO, NR_PARCIAL, CD_EMPRESA ) ');
        SQL.Add (' VALUES ( ');
        SQL.Add (' :NR_PROCESSO, :NR_SEQUENCIA, :CD_REFERENCIA, :CD_REF_EXP, :DT_REFERENCIA, :TP_REFERENCIA, :CD_AREA, :NR_ITEM_PO, :NR_PARCIAL, :CD_EMPRESA ) ');
        ParamByName('NR_PROCESSO').AsString    :=datm_manut_proc.qry_ref_cliente_NR_PROCESSO.AsString;
        ParamByName('NR_SEQUENCIA').AsString   :=StrZero(nSeq,3);
        ParamByName('CD_REFERENCIA').AsString  :=datm_manut_proc.qry_ref_cliente_CD_REFERENCIA.AsString;
        ParamByName('CD_REF_EXP').AsString     :=datm_manut_proc.qry_ref_cliente_CD_REF_EXP.AsString;
        ParamByName('DT_REFERENCIA').AsDatetime:=Now();
        ParamByName('TP_REFERENCIA').AsString  :=datm_manut_proc.qry_ref_cliente_TP_REFERENCIA.AsString;
        ParamByName('CD_AREA').AsString        :=datm_manut_proc.qry_ref_cliente_CD_AREA.AsString;
        ParamByName('NR_ITEM_PO').AsString     :=datm_manut_proc.qry_ref_cliente_NR_ITEM_PO.AsString;
        ParamByName('NR_PARCIAL').AsString     :=IntToStr(StrToInt(datm_manut_proc.qry_ref_cliente_NR_PARCIAL.asString)+ I);
        ParamByName('CD_EMPRESA').AsString     :=datm_manut_proc.qry_ref_cliente_CD_EMPRESA.AsString;
        //        SQL.Add (' VALUES ('''+ datm_manut_proc.qry_ref_cliente_NR_PROCESSO.AsString +''', ''' + StrZero((StrToInt(datm_manut_proc.qry_ref_cliente_NR_SEQUENCIA.AsString)+I),Length(datm_manut_proc.qry_ref_cliente_NR_SEQUENCIA.AsString)) + ''', ''' +        datm_manut_proc.qry_ref_cliente_CD_REFERENCIA.AsString + ''', ''' + datm_manut_proc.qry_ref_cliente_CD_REF_EXP.AsString + ''',        ''' +DateTimeToStr(Now) + ''', ''' + datm_manut_proc.qry_ref_cliente_TP_REFERENCIA.AsString + ''',        ''' + datm_manut_proc.qry_ref_cliente_CD_AREA.AsString + ''', ''' +        datm_manut_proc.qry_ref_cliente_NR_ITEM_PO.AsString + ''', ' + IntToStr(StrToInt(datm_manut_proc.qry_ref_cliente_NR_PARCIAL.asString)+ I) + ', ''' + datm_manut_proc.qry_ref_cliente_CD_EMPRESA.AsString + ''')'); by carlos 14/07/2010 (mudei para parametros pois tava dando erro de conversão)

        ExecSQL;
      end
      else
      begin
        ShowMessage('Favor escolher REFERENCIA/ITEM com a maior parcial para fazer duplicação!');
        Exit;
      end;
    end;
    Inc(I);
  end;
  datm_manut_proc.qry_ref_cliente_.Close;
  datm_manut_proc.qry_ref_cliente_.Open;
  pnl_duplicar_referencia.Visible := False;
end;

procedure Tfrm_manut_proc.btn_sair_duplicar_referenciaClick(
  Sender: TObject);
begin
  pnl_duplicar_referencia.Visible := False;
end;

function Tfrm_manut_proc.ConsisteServico: Boolean;
var
  vMsg: String;
begin
  vMsg := '';
  if (datm_manut_proc.qry_processo_.State in [dsEdit, dsInsert]) and
     (datm_manut_proc.qry_processo_CD_SERVICO.OldValue <> datm_manut_proc.qry_processo_CD_SERVICO.NewValue) then
  begin
    if Trim(dbedt_cd_servico.Text) = '' then
      datm_manut_proc.qry_processo_CD_SERVICO.Value := datm_manut_proc.qry_processo_CD_SERVICO.OldValue
    else
    begin
      if (not GetServicoNovo) and (Length(Trim(dbedt_cd_servico.Text)) < 3) then
        datm_manut_proc.qry_processo_CD_SERVICO.AsString := RightStr('00' + Trim(dbedt_cd_servico.Text), 3);

      if ConsultaLookUPSQL(' SELECT COUNT(*) AS QTD' +
                           ' FROM TSERVICO S (NOLOCK) ' +
                           '    INNER JOIN TCLIENTE_SERVICO CS (NOLOCK) ON CS.CD_SERVICO = S.CD_SERVICO ' +
                           ' WHERE CS.CD_CLIENTE       = ' + QuotedStr(datm_manut_proc.qry_processo_CD_CLIENTE.AsString) +
                           '   AND CS.CD_UNID_NEG      = ' + QuotedStr(datm_manut_proc.qry_processo_CD_UNID_NEG.AsString) +
                           '   AND CS.CD_PRODUTO       = ' + QuotedStr(datm_manut_proc.qry_processo_CD_PRODUTO.AsString) +
                           '   AND CS.CD_SERVICO       = ' + QuotedStr(dbedt_cd_servico.Text) +
                           '   AND CS.IN_ATIVO         = ''1'' ' +
                           '   AND S.IN_ATIVO          = ''1'' ' +
                           '   AND S.CD_VIA_TRANSPORTE = (SELECT CD_VIA_TRANSPORTE ' +
                           '                              FROM TSERVICO S2 (NOLOCK) ' +
                           '                              WHERE S2.CD_SERVICO = ' + QuotedStr(datm_manut_proc.qry_processo_CD_SERVICO.OldValue) + ')', 'QTD') = '0' then
        vMsg := 'Serviço não cadastrado ou sem habilitação para esta Unidade x Produto x Cliente.'
      else if ConsultaLookUP('TSERVICO', 'CD_SERVICO', dbedt_cd_servico.Text, 'CD_VIA_TRANSPORTE') <>
         ConsultaLookUP('TSERVICO', 'CD_SERVICO', datm_manut_proc.qry_processo_CD_SERVICO.OldValue, 'CD_VIA_TRANSPORTE') then
        vMsg := 'A via de transporte do serviço informado é diferente da via de transporte do serviço cadastrado para este processo.';
    end;
  end;
  Result := vMsg = '';
  if not Result then
  begin
    pgctrl_manut_proc.ActivePage := ts_lista;
    dbedt_cd_servico.SetFocus;
    MessageDlg(vMsg, mtInformation, [mbOk], 0);
    //dbedt_cd_servico.Text := datm_manut_proc.qry_processo_CD_SERVICO.OldValue;
  end;
end;

procedure Tfrm_manut_proc.dblkcbox_consignatarioExit(Sender: TObject);
begin
  if Not lAbertura then
    Edita;

  // dbedt_cd_consignatario.Text := ''; {alterado por agatha nigro 05/02/2018}
  Habilita_Btn_Draft( 1 );
//  if not datm_manut_proc.qry_processo_TP_CONSIGNATARIO.IsNull then
//    if datm_manut_proc.qry_processo_TP_CONSIGNATARIO.AsString <> '5' then
//      dbeCdConsignatario.SetFocus;
end;

procedure Tfrm_manut_proc.t(Sender: TObject);
var
vGrupo: string[3];
begin
  //Coloquei no exite pois estava chamando no onchagen do campo impedindo que o usuário digitasse o codigo inteiro,antes de validar
  {by Carlos - 17/08/2010 - ATENÇÃO: foi usado o field CD_CONSIGNEE ao invés de CD_CONSIGNATARIO
  devido a falta de alias em algumas querys espalhadas pelo sistema que causará erro de ambiguidade}
  if Not lAbertura then Edita;

  vGrupo := ConsultaLookUp('TPROCESSO', 'NR_PROCESSO', datm_manut_proc.qry_proc_em_NR_PROCESSO.AsString, 'CD_GRUPO');
  with datm_manut_proc do
  begin
    if Sender is TSpeedButton then
    begin
      if Not PoeEmEdicao(qry_proc_em_) then
        Exit;

      if (Sender as TSpeedButton).Enabled then
      begin
        //Importador
        if dblkcbox_consignatario.KeyValue = 0 then
          qry_proc_em_CD_CONSIGNEE.AsString := ConsultaOnLineExSQL(
            'SELECT CD_EMPRESA, NM_EMPRESA, END_CIDADE, END_EMPRESA, END_NUMERO FROM TEMPRESA_EST (NOLOCK) WHERE IN_IMPORTADOR = ''1'' ' +
            ' AND CD_EMPRESA IN (SELECT CD_EMPRESA FROM TEMPRESA_EST_GRUPO (NOLOCK) WHERE CD_GRUPO = "'+ vGrupo +'") ',
            'Cadastro de Importadores',['CD_EMPRESA', 'NM_EMPRESA', 'END_CIDADE','END_EMPRESA', 'END_NUMERO' ],['Código','Importador','Cidade','Endereço','Numero'],'CD_EMPRESA',nil,qry_proc_em_CD_CONSIGNEE.AsString);


        //Agente
        if dblkcbox_consignatario.KeyValue = 1 then
          qry_proc_em_CD_CONSIGNEE.AsString := ConsultaOnLineExSQL(
            'SELECT CD_EMPRESA, NM_EMPRESA, AP_EMPRESA FROM TEMPRESA_EST (NOLOCK) WHERE IN_AGENTE = ''1'' AND IN_ATIVO = ''1'' ',
            'Agente',['CD_EMPRESA', 'NM_EMPRESA', 'AP_EMPRESA'],['Código', 'Nome', 'Apelido'], 'CD_EMPRESA');

        //Transportadora
        if dblkcbox_consignatario.KeyValue = 2 then
          qry_proc_em_CD_CONSIGNEE.AsString := ConsultaOnLineExSQL(
            'SELECT CODIGO, DESCRICAO FROM TTRANSPORTADOR_ITL (NOLOCK)',
            'Transportador',['CODIGO','DESCRICAO'],['Código','Nome'],'CODIGO');

        //Banco
        if dblkcbox_consignatario.KeyValue = 3 then
          qry_proc_em_CD_CONSIGNEE.AsString := ConsultaOnLineExSQL(
            'SELECT CD_EMPRESA, NM_EMPRESA, AP_EMPRESA FROM TEMPRESA_EST (NOLOCK) WHERE IN_BANCO = ''1'' AND IN_ATIVO = ''1'' ',
            'Banco',['CD_EMPRESA','NM_EMPRESA','AP_EMPRESA'],['Código','Nome','Apelido'],'CD_EMPRESA');

        //Despachante
        if dblkcbox_consignatario.KeyValue = 4 then
          qry_proc_em_CD_CONSIGNEE.AsString := ConsultaOnLineEx('TDESPACHANTE','Despachante',['CD_DESPACHANTE','NM_DESPACHANTE'],['Código','Nome'],'CD_DESPACHANTE');

        dbedt_cd_consignatarioExit(nil);
      end;
    end
    else begin
      //Importador
      if StrToIntDef(qry_proc_em_TP_CONSIGNEE.AsString, 5) = 0 then
      begin
        //if dbedt_cd_consignatario.Text<>'' then
           //dbedt_cd_consignatario.Text := Copy ( '00000',1 ,( 5 - length( Trim( dbedt_cd_consignatario.Text ) ) ) ) + dbedt_cd_consignatario.Text;

        edt_nm_consignatario.Text := ConsultaLookUPSQL(
        ' SELECT NM_EMPRESA FROM TEMPRESA_EST (NOLOCK) WHERE IN_IMPORTADOR = ''1'' AND CD_EMPRESA = '''+ dbedt_cd_consignatario.Text +''' ' +
        ' AND CD_EMPRESA IN (SELECT CD_EMPRESA FROM TEMPRESA_EST_GRUPO (NOLOCK) WHERE CD_GRUPO = "'+ vGrupo +'") ','NM_EMPRESA');
      end;

      //Agente
      if StrToIntDef(qry_proc_em_TP_CONSIGNEE.AsString, 5) = 1 then
      begin
        //if dbedt_cd_consignatario.Text<>'' then
           //dbedt_cd_consignatario.Text := Copy ( '00000',1 ,( 5 - length( Trim( dbedt_cd_consignatario.Text ) ) ) ) + dbedt_cd_consignatario.Text;

        edt_nm_consignatario.Text := ConsultaLookUPSQL(
          'SELECT NM_EMPRESA FROM TEMPRESA_EST (NOLOCK) '+
          'WHERE CD_EMPRESA = ''' + dbedt_cd_consignatario.Text +''' '+
          '  AND IN_AGENTE = ''1'' AND IN_ATIVO = ''1'' ','NM_EMPRESA');
      end;

      //Transportadora
      if StrToIntDef(qry_proc_em_TP_CONSIGNEE.AsString, 5) = 2 then
      begin
        if dbedt_cd_consignatario.Text<>'' then
           dbedt_cd_consignatario.Text := Copy ( '0000',1 ,( 4 - length( Trim( dbedt_cd_consignatario.Text ) ) ) ) + dbedt_cd_consignatario.Text;

        edt_nm_consignatario.Text := ConsultaLookUPSQL(
          'SELECT DESCRICAO FROM TTRANSPORTADOR_ITL (NOLOCK) '+
          'WHERE CODIGO = ''' + dbedt_cd_consignatario.Text +'''' ,'DESCRICAO');
      end;
      //Banco
      if StrToIntDef(qry_proc_em_TP_CONSIGNEE.AsString, 5) = 3 then
      begin
        if dbedt_cd_consignatario.Text<>'' then
           dbedt_cd_consignatario.Text := Copy ( '00000',1 ,( 5 - length( Trim( dbedt_cd_consignatario.Text ) ) ) ) + dbedt_cd_consignatario.Text;

        edt_nm_consignatario.Text := ConsultaLookUPSQL(
          'SELECT NM_EMPRESA FROM TEMPRESA_EST (NOLOCK) ' +
          'WHERE CD_EMPRESA = ''' + dbedt_cd_consignatario.Text +''' '+
          '  AND IN_BANCO = ''1'' AND IN_ATIVO = ''1'' ','NM_EMPRESA');
      end;

      //Despachante
      if StrToIntDef(qry_proc_em_TP_CONSIGNEE.AsString, 5) = 4 then
      begin
        if dbedt_cd_consignatario.Text<>'' then
           dbedt_cd_consignatario.Text := Copy ( '000',1 ,( 3 - length( Trim( dbedt_cd_consignatario.Text ) ) ) ) + dbedt_cd_consignatario.Text;

        edt_nm_consignatario.Text := ConsultaLookUP('TDESPACHANTE','CD_DESPACHANTE',dbedt_cd_consignatario.Text, 'NM_DESPACHANTE');
      end;

    end;
  end;
  If datm_manut_proc.qry_proc_em_.State in [dsEdit,dsInsert] then begin
    if (dbedt_cd_consignatario.Text <> '') and (edt_nm_consignatario.Text = '') then
    begin
      BoxMensagem('Código do Consignatário inválido!',2);
      dbedt_cd_consignatario.SetFocus;
      Exit;
    end;
  end;
end;

procedure Tfrm_manut_proc.btn_co_consignatarioClick(Sender: TObject);
var
vGrupo: string[3];
begin
 {by Carlos - 17/08/2010 - ATENÇÃO: foi usado o field CD_CONSIGNEE ao invés de CD_CONSIGNATARIO
  devido a falta de alias em algumas querys espalhadas pelo sistema que causará erro de ambiguidade}

  if Not lAbertura then
    Edita;

  vGrupo := ConsultaLookUp('TPROCESSO', 'NR_PROCESSO', datm_manut_proc.qry_proc_em_NR_PROCESSO.AsString, 'CD_GRUPO');

  with datm_manut_proc do
  begin
    if Sender is TSpeedButton then
    begin
      if Not PoeEmEdicao(qry_proc_em_) then
        Exit;

      if (Sender as TSpeedButton).Enabled then
      begin
        //Importador
        if dblkcbox_consignatario.KeyValue = 0 then
          qry_proc_em_CD_CONSIGNEE.AsString := ConsultaOnLineExSQL(
            'SELECT CD_EMPRESA, NM_EMPRESA, END_CIDADE, END_EMPRESA, END_NUMERO FROM TEMPRESA_EST (NOLOCK) WHERE IN_IMPORTADOR = ''1'' ' +
            ' AND CD_EMPRESA IN (SELECT CD_EMPRESA FROM TEMPRESA_EST_GRUPO (NOLOCK) WHERE CD_GRUPO = "'+ vGrupo +'") ',
            'Cadastro de Importadores',['CD_EMPRESA', 'NM_EMPRESA', 'END_CIDADE','END_EMPRESA', 'END_NUMERO' ],['Código','Importador','Cidade','Endereço','Numero'],'CD_EMPRESA',nil,qry_proc_em_CD_CONSIGNEE.AsString);


        //Agente
        if dblkcbox_consignatario.KeyValue = 1 then
          qry_proc_em_CD_CONSIGNEE.AsString := ConsultaOnLineExSQL(
            'SELECT CD_EMPRESA, NM_EMPRESA, AP_EMPRESA FROM TEMPRESA_EST (NOLOCK) WHERE IN_AGENTE = ''1'' AND IN_ATIVO = ''1'' ',
            'Agente',['CD_EMPRESA', 'NM_EMPRESA', 'AP_EMPRESA'],['Código', 'Nome', 'Apelido'], 'CD_EMPRESA');

        //Transportadora
        if dblkcbox_consignatario.KeyValue = 2 then
          qry_proc_em_CD_CONSIGNEE.AsString := ConsultaOnLineExSQL(
            'SELECT CODIGO, DESCRICAO FROM TTRANSPORTADOR_ITL (NOLOCK)',
            'Transportador',['CODIGO','DESCRICAO'],['Código','Nome'],'CODIGO');

        //Banco
        if dblkcbox_consignatario.KeyValue = 3 then
          qry_proc_em_CD_CONSIGNEE.AsString := ConsultaOnLineExSQL(
            'SELECT CD_EMPRESA, NM_EMPRESA, AP_EMPRESA FROM TEMPRESA_EST (NOLOCK) WHERE IN_BANCO = ''1'' AND IN_ATIVO = ''1'' ',
            'Banco',['CD_EMPRESA','NM_EMPRESA','AP_EMPRESA'],['Código','Nome','Apelido'],'CD_EMPRESA');

        //Despachante
        if dblkcbox_consignatario.KeyValue = 4 then
          qry_proc_em_CD_CONSIGNEE.AsString := ConsultaOnLineEx('TDESPACHANTE','Despachante',['CD_DESPACHANTE','NM_DESPACHANTE'],['Código','Nome'],'CD_DESPACHANTE');

       // dbedt_cd_consignatarioExit(nil);
      end;
    end
    else
    begin
      //Importador
      if StrToIntDef(qry_proc_em_TP_CONSIGNEE.AsString, 5) = 0 then
      begin
        //if dbedt_cd_consignatario.Text<>'' then
           //dbedt_cd_consignatario.Text := Copy ( '00000',1 ,( 5 - length( Trim( dbedt_cd_consignatario.Text ) ) ) ) + dbedt_cd_consignatario.Text;

        edt_nm_consignatario.Text := ConsultaLookUPSQL(
        ' SELECT NM_EMPRESA FROM TEMPRESA_EST (NOLOCK) WHERE IN_IMPORTADOR = ''1'' AND CD_EMPRESA = '''+ dbedt_cd_consignatario.Text +''' ' +
        ' AND CD_EMPRESA IN (SELECT CD_EMPRESA FROM TEMPRESA_EST_GRUPO (NOLOCK) WHERE CD_GRUPO = "'+ vGrupo +'") ','NM_EMPRESA');
      end;

      //Agente
      if StrToIntDef(qry_proc_em_TP_CONSIGNEE.AsString, 5) = 1 then
      begin
       // if dbedt_cd_consignatario.Text<>'' then
          // dbedt_cd_consignatario.Text := Copy ( '00000',1 ,( 5 - length( Trim( dbedt_cd_consignatario.Text ) ) ) ) + dbedt_cd_consignatario.Text;

        edt_nm_consignatario.Text := ConsultaLookUPSQL(
          'SELECT NM_EMPRESA FROM TEMPRESA_EST (NOLOCK) '+
          'WHERE CD_EMPRESA = ''' + dbedt_cd_consignatario.Text +''' '+
          '  AND IN_AGENTE = ''1'' AND IN_ATIVO = ''1'' ','NM_EMPRESA');
      end;

      //Transportadora
      if StrToIntDef(qry_proc_em_TP_CONSIGNEE.AsString, 5) = 2 then
      begin
        //if dbedt_cd_consignatario.Text<>'' then
          // dbedt_cd_consignatario.Text := Copy ( '0000',1 ,( 4 - length( Trim( dbedt_cd_consignatario.Text ) ) ) ) + dbedt_cd_consignatario.Text;

        edt_nm_consignatario.Text := ConsultaLookUPSQL(
          'SELECT DESCRICAO FROM TTRANSPORTADOR_ITL (NOLOCK) '+
          'WHERE CODIGO = ''' + dbedt_cd_consignatario.Text +'''' ,'DESCRICAO');
      end;


      //Banco
      if StrToIntDef(qry_proc_em_TP_CONSIGNEE.AsString, 5) = 3 then
      begin
       // if dbedt_cd_consignatario.Text<>'' then
          // dbedt_cd_consignatario.Text := Copy ( '00000',1 ,( 5 - length( Trim( dbedt_cd_consignatario.Text ) ) ) ) + dbedt_cd_consignatario.Text;

        edt_nm_consignatario.Text := ConsultaLookUPSQL(
          'SELECT NM_EMPRESA FROM TEMPRESA_EST (NOLOCK) ' +
          'WHERE CD_EMPRESA = ''' + dbedt_cd_consignatario.Text +''' '+
          '  AND IN_BANCO = ''1'' AND IN_ATIVO = ''1'' ','NM_EMPRESA');
      end;

      //Despachante
      if StrToIntDef(qry_proc_em_TP_CONSIGNEE.AsString, 5) = 4 then
      begin
        //if dbedt_cd_consignatario.Text<>'' then
          // dbedt_cd_consignatario.Text := Copy ( '000',1 ,( 3 - length( Trim( dbedt_cd_consignatario.Text ) ) ) ) + dbedt_cd_consignatario.Text;

        edt_nm_consignatario.Text := ConsultaLookUP('TDESPACHANTE','CD_DESPACHANTE',dbedt_cd_consignatario.Text, 'NM_DESPACHANTE');
      end;

      if dbedt_cd_consignatario.text = '' then
        edt_nm_consignatario.Text := '';
    end;
  end;  
end;

procedure Tfrm_manut_proc.dbchb_dseClick(Sender: TObject);
begin
  if Not lAbertura then Edita;

  if not dbchb_dse.Checked then
  begin
    if not ((str_cd_cargo = '099') or (str_cd_cargo = '001')) then
    begin
      dbedt_nr_dde.ReadOnly := True;
    end
      else
      dbedt_nr_dde.ReadOnly := False;
  end
  else
    dbedt_nr_dde.ReadOnly := False;
end;

procedure Tfrm_manut_proc.dbchk_in_utilizadoClick(Sender: TObject);
begin
   if Not lAbertura then
  begin
    if ( datm_manut_proc.qry_li_.State in [ dsInsert, dsEdit ] ) then btn_mi(False, True, True, False);
    if ( datm_manut_proc.qry_li_IN_UTILIZADO.AsString = '1' ) or ( dbchk_in_utilizado.Checked ) then
    begin
      lbl_tx_obs_canc.Visible   := True;
      dbmmo_tx_obs_canc.Visible := True;
    end
    else
    begin
      lbl_tx_obs_canc.Visible   := False;
      dbmmo_tx_obs_canc.Visible := False;
    end;
  end;

end;

procedure Tfrm_manut_proc.DBGrid4DblClick(Sender: TObject);
var
DigPath:String;
begin
  DigPath:=trim(ConsultaLookUpSQL('SELECT PATH_DIGITALIZACAO FROM TPARAMETROS', 'PATH_DIGITALIZACAO'))+
  'TPROCESSO\'+datm_manut_proc.qry_processo_NR_PROCESSO.AsString+'\';

//  if fileexists(trim(datm_manut_proc.qry_li_statusTX_DIR_EXTRATO.AsString)) then
//     ShellExecuteA(Self.Handle, nil, PAnsiChar(trim(datm_manut_proc.qry_li_statusTX_DIR_EXTRATO.AsString)), nil, PAnsiChar(DigPath), SW_SHOW)
//   else
//     ShowMessage('Não consta arquivo vinculado!');

 if fileexists(trim(TDBGrid(Sender).Columns[4].Field.asString)) then
    ShellExecuteA(Self.Handle, nil, PAnsiChar(trim(TDBGrid(Sender).Columns[4].Field.asString)), nil, PAnsiChar(DigPath), SW_SHOW)
  else
    ShowMessage('Não consta arquivo vinculado!');

end;

procedure Tfrm_manut_proc.btn_local_entrega_emClick(Sender: TObject);
begin
  if Not lAbertura then Edita;
  if Sender is TSpeedButton then
  begin
    if not PoeEmEdicao(datm_manut_proc.qry_proc_em_) then exit;
    If (Sender as TSpeedButton).Enabled Then
      datm_manut_proc.qry_proc_em_CD_LOCAL_ENTREGA.AsString := ConsultaOnLineEx('TLOCAL_EMBARQUE','Local Entrega',['CODIGO','DESCRICAO'],['Código','Nome'],'CODIGO',frm_main.mi_cad_local_emb,1,dbedt_cd_local_entrega_em.text);
  end
  else nm_local_entrega_em.Text := ConsultaLookUP('TLOCAL_EMBARQUE','CODIGO',dbedt_cd_local_entrega_em.Text,'DESCRICAO');
end;

procedure Tfrm_manut_proc.btn_local_entrega_efClick(Sender: TObject);
begin
  if Not lAbertura then Edita;
  if Sender is TSpeedButton then
  begin
    if not PoeEmEdicao(datm_manut_proc.qry_proc_em_) then exit;
    If (Sender as TSpeedButton).Enabled Then
      datm_manut_proc.qry_proc_em_CD_LOCAL_ENTREGA.AsString := ConsultaOnLineEx('TLOCAL_EMBARQUE','Local Entrega',['CODIGO','DESCRICAO'],['Código','Nome'],'CODIGO',frm_main.mi_cad_local_emb,1,dbedt_cd_local_entrega_ef.text);
  end
  else nm_local_entrega_ef.Text := ConsultaLookUP('TLOCAL_EMBARQUE','CODIGO',dbedt_cd_local_entrega_ef.Text,'DESCRICAO');
end;

procedure Tfrm_manut_proc.btn_co_local_transb_emClick(Sender: TObject);
begin
  if Not lAbertura then Edita;
  if Sender is TSpeedButton then
  begin
    if not PoeEmEdicao(datm_manut_proc.qry_proc_em_) then exit;
    If (Sender as TSpeedButton).Enabled Then
      datm_manut_proc.qry_proc_em_CD_LOCAL_TRANSBORDO.AsString := ConsultaOnLineEx('TLOCAL_EMBARQUE','Local Desembarque',['CODIGO','DESCRICAO'],['Código','Nome'],'CODIGO',frm_main.mi_cad_local_emb, 1, dbedt_cd_local_transb_em.text);
  end
  else dbedt_nm_local_transb_em.Text := ConsultaLookUP('TLOCAL_EMBARQUE','CODIGO',dbedt_cd_local_transb_em.Text,'DESCRICAO');
end;

procedure Tfrm_manut_proc.edt_cd_recinto_alf_imChange(Sender: TObject);
begin
  dbedt_recinto_alfandegado_im.Text := ConsultaLookUPSQL('SELECT DESCRICAO from TREC_ALFANDEGADO (NOLOCK)  where CODIGO ='''+ edt_cd_recinto_alf_im.Text +''' ', 'DESCRICAO');
end;

procedure Tfrm_manut_proc.edt_cd_setormChange(Sender: TObject);
begin
edtsetor_m.Text:= ConsultaLookUPSQL('SELECT NOME FROM TRECINTO_SETORES_IMPORTACAO (NOLOCK) where SETOR ='''+edt_cd_setorm.Text+''' AND RECINTO='''+ edt_cd_recinto_alf_im.Text +''' ', 'NOME');
end;

procedure Tfrm_manut_proc.dblckpbox_acordo_certificadoClick(Sender: TObject);
begin
  if not lAbertura then Edita;
end;

procedure Tfrm_manut_proc.DBComboBox1Change(Sender: TObject);
begin
  if not lAbertura then Edita;
//  if dbedt_dt_pres_carga_im.Text = '  /  /    ' then
//    if datm_manut_proc.qry_proc_im_.State = dsEdit then
//      datm_manut_proc.qry_proc_im_DT_PRESENCA_CARGA.AsVariant := Null;

  If Sender is TDbEdit Then
    If TDbEdit(Sender).Name = dbedt_cd_cliente.Name Then
      btn_co_cliente.OnClick(Sender);
end;

procedure Tfrm_manut_proc.cmb_tp_certificado_exmChange(Sender: TObject);
begin
 if not lAbertura then Edita;
end;

procedure Tfrm_manut_proc.btn_co_docs_mClick(Sender: TObject);
begin
  if Not lAbertura then Edita;
  if Sender is TSpeedButton then
  begin
    If Not PoeEmEdicao(datm_manut_proc.qry_proc_em_) Then Exit;
    If (Sender as TSpeedButton).Enabled Then
      datm_manut_proc.qry_proc_em_DOCS_ENVIADO_PARA.AsString := ConsultaOnLineExSQL('SELECT CD_EMPRESA,NM_EMPRESA,AP_EMPRESA FROM TEMPRESA_EST (NOLOCK) WHERE IN_IMPORTADOR= ''' + '01' + ''' ',
                                                             'Empresa', ['CD_EMPRESA', 'NM_EMPRESA','AP_EMPRESA'], ['Código', 'Empresa','Apelido'], 'CD_EMPRESA', nil,dbedt_cod_docsenviados_m.Text );
  end
  else
    edt_nm_docsenviados_m.Text := ConsultaLookUPSQL('SELECT NM_EMPRESA FROM TEMPRESA_EST (NOLOCK) WHERE IN_IMPORTADOR= ''' + '01' + ''' ','NM_EMPRESA');
end;

procedure Tfrm_manut_proc.dbedt_cod_docsenviados_mChange(Sender: TObject);
begin
 edt_nm_docsenviados_m.Text := ConsultaLookUP('TEMPRESA_EST','CD_EMPRESA',dbedt_cod_docsenviados_m.Text,'NM_EMPRESA');
 if ( datm_manut_proc.qry_proc_em_.State in [ dsInsert, dsEdit ] ) then
   btn_mi(False, True, True, False);
end;

procedure Tfrm_manut_proc.btn_co_docs_aClick(Sender: TObject);
begin
  if Not lAbertura then Edita;
  with datm_manut_proc Do
  begin
    if Sender is TSpeedButton then
    begin
      If Not PoeEmEdicao(qry_proc_em_) Then Exit;
      If (Sender as TSpeedButton).Enabled Then
        qry_proc_em_DOCS_ENVIADO_PARA.AsString := ConsultaOnLineExSQL('SELECT CD_EMPRESA,NM_EMPRESA,AP_EMPRESA FROM TEMPRESA_EST (NOLOCK) WHERE IN_IMPORTADOR= ''' + '01' + ''' ',
                                                               'Empresa', ['CD_EMPRESA', 'NM_EMPRESA','AP_EMPRESA'], ['Código', 'Empresa','Apelido'], 'CD_EMPRESA', nil,dbedt_cod_docsenviados_a.Text );
    end
    else
      edt_nm_docsenviados_a.Text := ConsultaLookUPSQL('SELECT NM_EMPRESA FROM TEMPRESA_EST (NOLOCK) WHERE IN_IMPORTADOR= ''' + '01' + ''' ','NM_EMPRESA');
  end;
end;

procedure Tfrm_manut_proc.dbedt_cod_docsenviados_aChange(Sender: TObject);
begin
  edt_nm_docsenviados_a.Text := ConsultaLookUP('TEMPRESA_EST','CD_EMPRESA',dbedt_cod_docsenviados_a.Text,'NM_EMPRESA');
  if ( datm_manut_proc.qry_proc_em_.State in [ dsInsert, dsEdit ] ) then
   btn_mi(False, True, True, False);
end;

procedure Tfrm_manut_proc.btn_co_docs_fClick(Sender: TObject);
begin
  if Not lAbertura then Edita;
  with datm_manut_proc Do
  begin
    if Sender is TSpeedButton then
    begin
      If Not PoeEmEdicao(qry_proc_em_) Then Exit;
      If (Sender as TSpeedButton).Enabled Then
        qry_proc_em_DOCS_ENVIADO_PARA.AsString := ConsultaOnLineExSQL('SELECT CD_EMPRESA,NM_EMPRESA,AP_EMPRESA FROM TEMPRESA_EST (NOLOCK) WHERE IN_IMPORTADOR= ''' + '01' + ''' ',
                                                               'Empresa', ['CD_EMPRESA', 'NM_EMPRESA','AP_EMPRESA'], ['Código', 'Empresa','Apelido'], 'CD_EMPRESA', nil,dbedt_cod_docsenviados_f.Text );
    end
    else
      edt_nm_docsenviados_f.Text := ConsultaLookUPSQL('SELECT NM_EMPRESA FROM TEMPRESA_EST (NOLOCK) WHERE IN_IMPORTADOR= ''' + '01' + ''' ','NM_EMPRESA');
  end;
end;

procedure Tfrm_manut_proc.btn_co_docs_rClick(Sender: TObject);
begin
  if Not lAbertura then Edita;
  with datm_manut_proc Do
  begin
    if Sender is TSpeedButton then
    begin
      If Not PoeEmEdicao(qry_proc_em_) Then Exit;
      If (Sender as TSpeedButton).Enabled Then
        qry_proc_em_DOCS_ENVIADO_PARA.AsString := ConsultaOnLineExSQL('SELECT CD_EMPRESA,NM_EMPRESA,AP_EMPRESA FROM TEMPRESA_EST (NOLOCK) WHERE IN_IMPORTADOR= ''' + '01' + ''' ',
                                                               'Empresa', ['CD_EMPRESA', 'NM_EMPRESA','AP_EMPRESA'], ['Código', 'Empresa','Apelido'], 'CD_EMPRESA', nil,dbedt_cod_docsenviados_r.Text );
    end
    else
      edt_nm_docsenviados_r.Text := ConsultaLookUPSQL('SELECT NM_EMPRESA FROM TEMPRESA_EST (NOLOCK) WHERE IN_IMPORTADOR= ''' + '01' + ''' ','NM_EMPRESA');
  end;
end;

procedure Tfrm_manut_proc.dbedt_cod_docsenviados_rChange(Sender: TObject);
begin
  edt_nm_docsenviados_r.Text := ConsultaLookUP('TEMPRESA_EST','CD_EMPRESA',dbedt_cod_docsenviados_r.Text,'NM_EMPRESA');
  if ( datm_manut_proc.qry_proc_em_.State in [ dsInsert, dsEdit ] ) then
    btn_mi(False, True, True, False);
end;

procedure Tfrm_manut_proc.dbedt_cod_docsenviados_fChange(Sender: TObject);
begin
  edt_nm_docsenviados_f.Text := ConsultaLookUP('TEMPRESA_EST','CD_EMPRESA',dbedt_cod_docsenviados_f.Text,'NM_EMPRESA');
  if ( datm_manut_proc.qry_proc_em_.State in [ dsInsert, dsEdit ] ) then
   btn_mi(False, True, True, False);
end;

procedure Tfrm_manut_proc.dbgrdImoDblClick(Sender: TObject);
begin
  if not(datm_manut_proc.qryProcessoCntrImo.State in [dsEdit, dsInsert]) then
     datm_manut_proc.qryProcessoCntrImo.Edit;


  datm_manut_proc.qryProcessoCntrImoNR_IMDG_CLASS.AsString:=ConsultaOnlineEx('TTP_IMDG_CLASS', 'Classes IMDG', ['NR_IMDG_CLASS', 'TX_PORTUGUES'], ['Código', 'Descrição'], 'NR_IMDG_CLASS', nil, 1, datm_manut_proc.qryProcessoCntrImoNR_IMDG_CLASS.AsString);


end;

procedure Tfrm_manut_proc.dbedt_forma_envio_co_MChange(Sender: TObject);
begin
 if not lAbertura then Edita;
end;

procedure Tfrm_manut_proc.dbedt_cd_consignatarioChange(Sender: TObject);
var
  vGrupo :string;
begin
  vGrupo := ConsultaLookUp('TPROCESSO', 'NR_PROCESSO', datm_manut_proc.qry_proc_em_NR_PROCESSO.AsString, 'CD_GRUPO');

  with datm_manut_proc do begin
    if Sender is TSpeedButton then begin
      if (Sender as TSpeedButton).Enabled then begin
        //Importador
        if dblkcbox_consignatario.KeyValue = 0 then
          qry_proc_em_CD_CONSIGNEE.AsString := ConsultaOnLineExSQL(
            'SELECT CD_EMPRESA, NM_EMPRESA, END_CIDADE, END_EMPRESA, END_NUMERO FROM TEMPRESA_EST (NOLOCK) WHERE IN_IMPORTADOR = ''1'' ' +
            ' AND CD_EMPRESA IN (SELECT CD_EMPRESA FROM TEMPRESA_EST_GRUPO (NOLOCK) WHERE CD_GRUPO = "'+ vGrupo +'") ',
            'Cadastro de Importadores',['CD_EMPRESA', 'NM_EMPRESA', 'END_CIDADE','END_EMPRESA', 'END_NUMERO' ],['Código','Importador','Cidade','Endereço','Numero'],'CD_EMPRESA',nil,qry_proc_em_CD_CONSIGNEE.AsString);


        //Agente
        if dblkcbox_consignatario.KeyValue = 1 then
          qry_proc_em_CD_CONSIGNEE.AsString := ConsultaOnLineExSQL(
            'SELECT CD_EMPRESA, NM_EMPRESA, AP_EMPRESA FROM TEMPRESA_EST (NOLOCK) WHERE IN_AGENTE = ''1'' AND IN_ATIVO = ''1'' ',
            'Agente',['CD_EMPRESA', 'NM_EMPRESA', 'AP_EMPRESA'],['Código', 'Nome', 'Apelido'], 'CD_EMPRESA');

        //Transportadora
        if dblkcbox_consignatario.KeyValue = 2 then
          qry_proc_em_CD_CONSIGNEE.AsString := ConsultaOnLineExSQL(
            'SELECT CODIGO, DESCRICAO FROM TTRANSPORTADOR_ITL (NOLOCK)',
            'Transportador',['CODIGO','DESCRICAO'],['Código','Nome'],'CODIGO');

        //Banco
        if dblkcbox_consignatario.KeyValue = 3 then
          qry_proc_em_CD_CONSIGNEE.AsString := ConsultaOnLineExSQL(
            'SELECT CD_EMPRESA, NM_EMPRESA, AP_EMPRESA FROM TEMPRESA_EST (NOLOCK) WHERE IN_BANCO = ''1'' AND IN_ATIVO = ''1'' ',
            'Banco',['CD_EMPRESA','NM_EMPRESA','AP_EMPRESA'],['Código','Nome','Apelido'],'CD_EMPRESA');

        //Despachante
        if dblkcbox_consignatario.KeyValue = 4 then
          qry_proc_em_CD_CONSIGNEE.AsString := ConsultaOnLineEx('TDESPACHANTE','Despachante',['CD_DESPACHANTE','NM_DESPACHANTE'],['Código','Nome'],'CD_DESPACHANTE');

        dbedt_cd_consignatarioExit(nil);
      end;
    end
    else begin
      //Importador
      if StrToIntDef(qry_proc_em_TP_CONSIGNEE.AsString, 5) = 0 then begin
        edt_nm_consignatario.Text := ConsultaLookUPSQL(
        ' SELECT NM_EMPRESA FROM TEMPRESA_EST (NOLOCK) WHERE IN_IMPORTADOR = ''1'' AND CD_EMPRESA = '''+ dbedt_cd_consignatario.Text +''' ' +
        ' AND CD_EMPRESA IN (SELECT CD_EMPRESA FROM TEMPRESA_EST_GRUPO (NOLOCK) WHERE CD_GRUPO = "'+ vGrupo +'") ','NM_EMPRESA');
      end;

      //Agente
      if StrToIntDef(qry_proc_em_TP_CONSIGNEE.AsString, 5) = 1 then begin
        edt_nm_consignatario.Text := ConsultaLookUPSQL(
          'SELECT NM_EMPRESA FROM TEMPRESA_EST (NOLOCK) '+
          'WHERE CD_EMPRESA = ''' + dbedt_cd_consignatario.Text +''' '+
          '  AND IN_AGENTE = ''1'' AND IN_ATIVO = ''1'' ','NM_EMPRESA');
      end;

      //Transportadora
      if StrToIntDef(qry_proc_em_TP_CONSIGNEE.AsString, 5) = 2 then begin
        if dbedt_cd_consignatario.Text<>'' then
        edt_nm_consignatario.Text := ConsultaLookUPSQL(
          'SELECT DESCRICAO FROM TTRANSPORTADOR_ITL (NOLOCK) '+
          'WHERE CODIGO = ''' + dbedt_cd_consignatario.Text +'''' ,'DESCRICAO');
      end;
      //Banco
      if StrToIntDef(qry_proc_em_TP_CONSIGNEE.AsString, 5) = 3 then begin
        edt_nm_consignatario.Text := ConsultaLookUPSQL(
          'SELECT NM_EMPRESA FROM TEMPRESA_EST (NOLOCK) ' +
          'WHERE CD_EMPRESA = ''' + dbedt_cd_consignatario.Text +''' '+
          '  AND IN_BANCO = ''1'' AND IN_ATIVO = ''1'' ','NM_EMPRESA');
      end;

      //Despachante
      if StrToIntDef(qry_proc_em_TP_CONSIGNEE.AsString, 5) = 4 then begin
        if dbedt_cd_consignatario.Text<>'' then
        edt_nm_consignatario.Text := ConsultaLookUP('TDESPACHANTE','CD_DESPACHANTE',dbedt_cd_consignatario.Text, 'NM_DESPACHANTE');
      end;

    end;
  end;
end;

procedure Tfrm_manut_proc.dbedt_cd_consignatarioExit(Sender: TObject);
var
vGrupo: string[3];
begin
  //Coloquei no exite pois estava chamando no onchagen do campo impedindo que o usuário digitasse o codigo inteiro,antes de validar
  {by Carlos - 17/08/2010 - ATENÇÃO: foi usado o field CD_CONSIGNEE ao invés de CD_CONSIGNATARIO
  devido a falta de alias em algumas querys espalhadas pelo sistema que causará erro de ambiguidade}
  if Not lAbertura then Edita;

  vGrupo := ConsultaLookUp('TPROCESSO', 'NR_PROCESSO', datm_manut_proc.qry_proc_em_NR_PROCESSO.AsString, 'CD_GRUPO');
  with datm_manut_proc do begin
    if Sender is TSpeedButton then begin
      if Not PoeEmEdicao(qry_proc_em_) then Exit;
      if (Sender as TSpeedButton).Enabled then begin
        //Importador
        if dblkcbox_consignatario.KeyValue = 0 then
          qry_proc_em_CD_CONSIGNEE.AsString := ConsultaOnLineExSQL(
            'SELECT CD_EMPRESA, NM_EMPRESA, END_CIDADE, END_EMPRESA, END_NUMERO FROM TEMPRESA_EST (NOLOCK) WHERE IN_IMPORTADOR = ''1'' ' +
            ' AND CD_EMPRESA IN (SELECT CD_EMPRESA FROM TEMPRESA_EST_GRUPO (NOLOCK) WHERE CD_GRUPO = "'+ vGrupo +'") ',
            'Cadastro de Importadores',['CD_EMPRESA', 'NM_EMPRESA', 'END_CIDADE','END_EMPRESA', 'END_NUMERO' ],['Código','Importador','Cidade','Endereço','Numero'],'CD_EMPRESA',nil,qry_proc_em_CD_CONSIGNEE.AsString);


        //Agente
        if dblkcbox_consignatario.KeyValue = 1 then
          qry_proc_em_CD_CONSIGNEE.AsString := ConsultaOnLineExSQL(
            'SELECT CD_EMPRESA, NM_EMPRESA, AP_EMPRESA FROM TEMPRESA_EST (NOLOCK) WHERE IN_AGENTE = ''1'' AND IN_ATIVO = ''1'' ',
            'Agente',['CD_EMPRESA', 'NM_EMPRESA', 'AP_EMPRESA'],['Código', 'Nome', 'Apelido'], 'CD_EMPRESA');

        //Transportadora
        if dblkcbox_consignatario.KeyValue = 2 then
          qry_proc_em_CD_CONSIGNEE.AsString := ConsultaOnLineExSQL(
            'SELECT CODIGO, DESCRICAO FROM TTRANSPORTADOR_ITL (NOLOCK)',
            'Transportador',['CODIGO','DESCRICAO'],['Código','Nome'],'CODIGO');

        //Banco
        if dblkcbox_consignatario.KeyValue = 3 then
          qry_proc_em_CD_CONSIGNEE.AsString := ConsultaOnLineExSQL(
            'SELECT CD_EMPRESA, NM_EMPRESA, AP_EMPRESA FROM TEMPRESA_EST (NOLOCK) WHERE IN_BANCO = ''1'' AND IN_ATIVO = ''1'' ',
            'Banco',['CD_EMPRESA','NM_EMPRESA','AP_EMPRESA'],['Código','Nome','Apelido'],'CD_EMPRESA');

        //Despachante
        if dblkcbox_consignatario.KeyValue = 4 then
          qry_proc_em_CD_CONSIGNEE.AsString := ConsultaOnLineEx('TDESPACHANTE','Despachante',['CD_DESPACHANTE','NM_DESPACHANTE'],['Código','Nome'],'CD_DESPACHANTE');

        dbedt_cd_consignatarioExit(nil);
      end;
    end
    else begin
      //Importador
      if StrToIntDef(qry_proc_em_TP_CONSIGNEE.AsString, 5) = 0 then begin
        if dbedt_cd_consignatario.Text<>'' then
           dbedt_cd_consignatario.Text := Copy ( '00000',1 ,( 5 - length( Trim( dbedt_cd_consignatario.Text ) ) ) ) + dbedt_cd_consignatario.Text;

        edt_nm_consignatario.Text := ConsultaLookUPSQL(
        ' SELECT NM_EMPRESA FROM TEMPRESA_EST (NOLOCK) WHERE IN_IMPORTADOR = ''1'' AND CD_EMPRESA = '''+ dbedt_cd_consignatario.Text +''' ' +
        ' AND CD_EMPRESA IN (SELECT CD_EMPRESA FROM TEMPRESA_EST_GRUPO (NOLOCK) WHERE CD_GRUPO = "'+ vGrupo +'") ','NM_EMPRESA');
      end;

      //Agente
      if StrToIntDef(qry_proc_em_TP_CONSIGNEE.AsString, 5) = 1 then begin
        if dbedt_cd_consignatario.Text<>'' then
           dbedt_cd_consignatario.Text := Copy ( '00000',1 ,( 5 - length( Trim( dbedt_cd_consignatario.Text ) ) ) ) + dbedt_cd_consignatario.Text;

        edt_nm_consignatario.Text := ConsultaLookUPSQL(
          'SELECT NM_EMPRESA FROM TEMPRESA_EST (NOLOCK) '+
          'WHERE CD_EMPRESA = ''' + dbedt_cd_consignatario.Text +''' '+
          '  AND IN_AGENTE = ''1'' AND IN_ATIVO = ''1'' ','NM_EMPRESA');
      end;

      //Transportadora
      if StrToIntDef(qry_proc_em_TP_CONSIGNEE.AsString, 5) = 2 then begin
        if dbedt_cd_consignatario.Text<>'' then
           dbedt_cd_consignatario.Text := Copy ( '0000',1 ,( 4 - length( Trim( dbedt_cd_consignatario.Text ) ) ) ) + dbedt_cd_consignatario.Text;

        edt_nm_consignatario.Text := ConsultaLookUPSQL(
          'SELECT DESCRICAO FROM TTRANSPORTADOR_ITL (NOLOCK) '+
          'WHERE CODIGO = ''' + dbedt_cd_consignatario.Text +'''' ,'DESCRICAO');
      end;
      //Banco
      if StrToIntDef(qry_proc_em_TP_CONSIGNEE.AsString, 5) = 3 then begin
        if dbedt_cd_consignatario.Text<>'' then
           dbedt_cd_consignatario.Text := Copy ( '00000',1 ,( 5 - length( Trim( dbedt_cd_consignatario.Text ) ) ) ) + dbedt_cd_consignatario.Text;

        edt_nm_consignatario.Text := ConsultaLookUPSQL(
          'SELECT NM_EMPRESA FROM TEMPRESA_EST (NOLOCK) ' +
          'WHERE CD_EMPRESA = ''' + dbedt_cd_consignatario.Text +''' '+
          '  AND IN_BANCO = ''1'' AND IN_ATIVO = ''1'' ','NM_EMPRESA');
      end;

      //Despachante
      if StrToIntDef(qry_proc_em_TP_CONSIGNEE.AsString, 5) = 4 then begin
        if dbedt_cd_consignatario.Text<>'' then
           dbedt_cd_consignatario.Text := Copy ( '000',1 ,( 3 - length( Trim( dbedt_cd_consignatario.Text ) ) ) ) + dbedt_cd_consignatario.Text;

        edt_nm_consignatario.Text := ConsultaLookUP('TDESPACHANTE','CD_DESPACHANTE',dbedt_cd_consignatario.Text, 'NM_DESPACHANTE');
      end;

    end;
  end;
  If datm_manut_proc.qry_proc_em_.State in [dsEdit,dsInsert] then begin
    if (dbedt_cd_consignatario.Text <> '') and (edt_nm_consignatario.Text = '') then begin
      BoxMensagem('Código do Consignatário inválido!',2);
      dbedt_cd_consignatario.SetFocus;
      Exit;
    end;
  end;

end;

procedure Tfrm_manut_proc.btn_co_incoterm_mClick(Sender: TObject);
begin
  if btn_co_incoterm_m.Enabled and PoeEmEdicao(datm_manut_proc.qry_proc_em_) then
    datm_manut_proc.qry_proc_em_CD_INCOTERM.AsString := ConsultaOnLineEx('TINCOTERMS_VENDA',
       'Incoterms', ['CODIGO', 'DESCRICAO'], ['Código', 'Incoterm'], 'CODIGO');
end;

procedure Tfrm_manut_proc.dbedt_cd_incoterm_mExit(Sender: TObject);
begin
  CodExits;
end;

procedure Tfrm_manut_proc.dbedt_cd_incoterm_mChange(Sender: TObject);
begin
  if not lAbertura then
    Edita;
end;

procedure Tfrm_manut_proc.btn_co_resp_draftClick(Sender: TObject);
begin
if Not lAbertura then Edita;
  with datm_manut_proc Do
  begin
    if Sender is TSpeedButton then
    begin
      If Not PoeEmEdicao(qry_proc_em_) Then Exit;
      If (Sender as TSpeedButton).Enabled Then
        qry_proc_em_CD_RESP_DRAFT.AsString := ConsultaOnLineExSQL(' SELECT TH.CD_USUARIO AS CD_USUARIO_H, U.NM_USUARIO ' +
                                                                  ' FROM TUSUARIO_HABILITACAO TH (NOLOCK) ' +
                                                                  '    INNER JOIN TUSUARIO U (NOLOCK) ON TH.CD_USUARIO = U.CD_USUARIO ' +
                                                                  ' WHERE TH.CD_UNID_NEG = ''' + msk_cd_unid_neg.Text + ''' ' +
                                                                  '   AND TH.CD_PRODUTO = ''' + msk_cd_produto.Text + ''' ' +
                                                                  '   AND TH.IN_ATIVO = ''1'' ' +
                                                                  '   AND U.IN_ATIVO = ''1'' ' , 'Responsável pelo Draft', ['CD_USUARIO_H', 'NM_USUARIO'], ['Código', 'Nome'], 'CD_USUARIO_H', nil, dbedt_cd_draft_em.text);
       end
    else
      //dbedt_nm_draft_em.Text := ConsultaLookUPSQL('SELECT NM_USUARIO FROM TUSUARIO WHERE CD_USUARIO = ''' + qry_proc_em_CD_RESP_DRAFT.AsString + '''', 'NM_USUARIO');
      dbedt_nm_draft_em.Text := ConsultaLookUPSQL('SELECT NM_USUARIO FROM TUSUARIO (NOLOCK) WHERE CD_USUARIO = ''' + Trim(dbedt_cd_draft_em.Text) + '''', 'NM_USUARIO');
  end;
 end;
procedure Tfrm_manut_proc.btn_co_nr_depotClick(Sender: TObject);
begin
if Not lAbertura then Edita;
  if Sender is TSpeedButton then
  begin
    if not PoeEmEdicao(datm_manut_proc.qry_proc_em_) then exit;
    If (Sender as TSpeedButton).Enabled Then
      datm_manut_proc.qry_proc_em_NR_DEPOT.AsString := ConsultaOnLineEx('TARMAZEM','Armazém',['CD_ARMAZEM','NM_ARMAZEM','NM_SIGLA','CD_RECINTO'],['Código','Nome','Sigla','Sigla'],'CD_ARMAZEM',nil,1 , dbedt_nr_depot_em.text)
  end
  else
    dbedt_nm_depot_em.Text := ConsultaLookUP('TARMAZEM','CD_ARMAZEM',dbedt_nr_depot_em.Text,'NM_ARMAZEM');
end;

procedure Tfrm_manut_proc.btn_co_transportador_exClick(Sender: TObject);      //FERNANDA 02/02/12 O_00912/12
begin
  if Not lAbertura then
    Edita;
  if Sender is TSpeedButton then
  begin
    if not PoeEmEdicao(datm_manut_proc.qry_proc_em_) then
      exit;  

    If (Sender as TSpeedButton).Enabled Then
      datm_manut_proc.qry_proc_em_CD_TRANSPORTADOR.AsString :=
      ConsultaOnLineEx('TTRANSPORTADOR_ITL','Transportador',['CODIGO','DESCRICAO'],['Código','Descrição'],'CODIGO',frm_main.mi_cad_transp_itl, 1 ,dbedt_cd_transportador_ex.Text)
  end else
    dbedt_nm_transportador_ex.Text := ConsultaLookUP('TTRANSPORTADOR_ITL','CODIGO',dbedt_cd_transportador_ex.Text,'DESCRICAO');
 end;

procedure Tfrm_manut_proc.dbedt_cd_transportador_exChange(Sender: TObject);
begin
 if Not lAbertura then Edita;
  if Sender is TSpeedButton then
  begin
    if not PoeEmEdicao(datm_manut_proc.qry_proc_im_) then exit;
    If (Sender as TSpeedButton).Enabled Then
      datm_manut_proc.qry_proc_im_CD_TRANSPORTADOR.AsString := ConsultaOnLineEx('TTRANSPORTADOR_ITL','Transportador',['CODIGO','DESCRICAO'],['Código','Descrição'],'CODIGO',frm_main.mi_cad_transp_itl, 1 ,dbedt_cd_transportador_ex.Text)
  end
  else
    dbedt_nm_transportador_ex.Text := ConsultaLookUP('TTRANSPORTADOR_ITL','CODIGO',dbedt_cd_transportador_ex.Text,'DESCRICAO');
end;

procedure Tfrm_manut_proc.btn_co_transportador_ex_aClick(Sender: TObject);
begin
  if Not lAbertura then Edita;
  if Sender is TSpeedButton then
  begin
    if not PoeEmEdicao(datm_manut_proc.qry_proc_em_) then
      exit;

    If (Sender as TSpeedButton).Enabled Then
      datm_manut_proc.qry_proc_EM_CD_TRANSPORTADOR.AsString :=
      ConsultaOnLineEx('TTRANSPORTADOR_ITL','Transportador',['CODIGO','DESCRICAO'],['Código','Descrição'],'CODIGO',frm_main.mi_cad_transp_itl, 1 ,dbedt_cd_transportador_ex_a.Text)
  end
  else
    dbedt_nm_transportador_ex_a.Text := ConsultaLookUP('TTRANSPORTADOR_ITL','CODIGO',dbedt_cd_transportador_ex_a.Text,'DESCRICAO');
end;

procedure Tfrm_manut_proc.btn_co_transportador_ex_rClick(Sender: TObject);
 begin
  if Not lAbertura then Edita;
  if Sender is TSpeedButton then
  begin
    if not PoeEmEdicao(datm_manut_proc.qry_proc_em_) then exit;  

    If (Sender as TSpeedButton).Enabled Then
      datm_manut_proc.qry_proc_em_CD_TRANSPORTADOR.AsString := ConsultaOnLineEx('TTRANSPORTADOR_ITL','Transportador',['CODIGO','DESCRICAO'],['Código','Descrição'],'CODIGO',frm_main.mi_cad_transp_itl, 1 ,dbedt_cd_transportador_ex_r.Text)
  end
  else
    dbedt_nm_transportador_ex_r.Text := ConsultaLookUP('TTRANSPORTADOR_ITL','CODIGO',dbedt_cd_transportador_ex_r.Text,'DESCRICAO');
end;

procedure Tfrm_manut_proc.btn_co_transportador_im_aClick(Sender: TObject);
begin
  if Not lAbertura then Edita;

  if Sender is TSpeedButton then
  begin
    if not PoeEmEdicao(datm_manut_proc.qry_proc_im_) then exit;
    If (Sender as TSpeedButton).Enabled Then
      datm_manut_proc.qry_proc_im_CD_TRANSPORTADOR.AsString := ConsultaOnLineEx('TTRANSPORTADOR_ITL','Transportador',['CODIGO','DESCRICAO'],['Código','Descrição'],'CODIGO',frm_main.mi_cad_transp_itl, 1 ,dbedt_cd_transportador_im_a.Text)
  end
  else
    dbedt_nm_transportador_im_a.Text := ConsultaLookUP('TTRANSPORTADOR_ITL','CODIGO',dbedt_cd_transportador_im_a.Text,'DESCRICAO');
end;

procedure Tfrm_manut_proc.btn_co_transportador_ex_fClick(Sender: TObject);
 begin
  if Not lAbertura then Edita;

  if Sender is TSpeedButton then
  begin
    if not PoeEmEdicao(datm_manut_proc.qry_proc_em_) then exit;

    If (Sender as TSpeedButton).Enabled Then
      datm_manut_proc.qry_proc_em_CD_TRANSPORTADOR.AsString := ConsultaOnLineEx('TTRANSPORTADOR_ITL','Transportador',['CODIGO','DESCRICAO'],['Código','Descrição'],'CODIGO',frm_main.mi_cad_transp_itl, 1 ,dbedt_cd_transportador_ex_f.Text)
  end
  else
    dbedt_nm_transportador_ex_f.Text := ConsultaLookUP('TTRANSPORTADOR_ITL','CODIGO',dbedt_cd_transportador_ex_f.Text,'DESCRICAO');
 end;

procedure Tfrm_manut_proc.btn_co_transportador_im_rClick(Sender: TObject);
begin
  if Not lAbertura then Edita;
  if Sender is TSpeedButton then
  begin
    if not PoeEmEdicao(datm_manut_proc.qry_proc_im_) then exit;
    If (Sender as TSpeedButton).Enabled Then
      datm_manut_proc.qry_proc_im_CD_TRANSPORTADOR.AsString := ConsultaOnLineEx('TTRANSPORTADOR_ITL','Transportador',['CODIGO','DESCRICAO'],['Código','Descrição'],'CODIGO',frm_main.mi_cad_transp_itl, 1 ,dbedt_cd_transportador_im_r.Text)
  end
  else
    dbedt_nm_transportador_im_r.Text := ConsultaLookUP('TTRANSPORTADOR_ITL','CODIGO',dbedt_cd_transportador_im_r.Text,'DESCRICAO');

end;

procedure Tfrm_manut_proc.dbchkIN_DRAWBACK_ALADI_MClick(Sender: TObject);
begin
  if Not lAbertura then
    Edita;
end;

procedure Tfrm_manut_proc.btnFechaReplicarReferenciaClick(Sender: TObject);
begin
  pnlReplicarReferencia.Visible := False;
end;

procedure Tfrm_manut_proc.ReplicarReferenciaparaProcessosClick(Sender: TObject);
begin
  edtProcessoReplicar.Clear;
  lbReplicarReferenciaProcessos.Clear;
  pnlReplicarReferencia.Visible := True;
  edtProcessoReplicar.SetFocus;
end;

procedure Tfrm_manut_proc.popm_referenciaPopup(Sender: TObject);
begin
  ReplicarReferenciaparaProcessos.Visible := msk_cd_produto.Text = '02';
end;

procedure Tfrm_manut_proc.btnExcluirProcessoReplicarClick(Sender: TObject);
var
  I: Integer;
begin
  I := lbReplicarReferenciaProcessos.ItemIndex;
  lbReplicarReferenciaProcessos.DeleteSelected;
  if I < lbReplicarReferenciaProcessos.Count then
    lbReplicarReferenciaProcessos.Selected[I] := True;
end;

procedure Tfrm_manut_proc.btnAdicionarProcessoReplicarClick(Sender: TObject);
begin
  if SameText(Trim(msk_nr_processo.Text), Trim(edtProcessoReplicar.Text)) then
    MessageDlg('O processo de destino é o mesmo de origem.', mtInformation, [mbOk], 0)
  else if ConsultaLookUPSQL(' SELECT COUNT(*) AS QTD ' +
                            ' FROM TPROCESSO (NOLOCK) ' +
                            ' WHERE NR_PROCESSO = "' + msk_cd_unid_neg.Text + msk_cd_produto.Text + edtProcessoReplicar.Text + '" ' +
                            '   AND IN_CANCELADO = "0"', 'QTD') <> '1' then
    MessageDlg('Processo não encontrado ou cancelado.', mtInformation, [mbOk], 0)
  else
  begin
    if lbReplicarReferenciaProcessos.Items.IndexOf(Trim(edtProcessoReplicar.Text)) < 0 then
      lbReplicarReferenciaProcessos.Items.Add(Trim(edtProcessoReplicar.Text));
    lbReplicarReferenciaProcessos.ItemIndex := lbReplicarReferenciaProcessos.Items.IndexOf(Trim(edtProcessoReplicar.Text));
  end;
end;

procedure Tfrm_manut_proc.ts_refShow(Sender: TObject);
var
  contador_di : String;
begin
  pnlReplicarReferencia.Visible := False;
  contador_di  := ConsultaLookUPSQL(' SELECT COUNT(*) TOTAL FROM TDECLARACAO_IMPORTACAO WHERE NR_PROCESSO = ''' + datm_manut_proc.qry_processo_NR_PROCESSO.AsString + '''', 'TOTAL');
  If (datm_manut_proc.qry_processo_ID_CODIGO_INSTR_DESEMB.AsString <> '') or  (StrToInt(contador_di) > 0) then
  begin
    btn_co_id_ref.Enabled := False;
    dbedt_id.Color := clMenu;
    if StrToInt(contador_di) = 0 then
      btn_co_id_desvincula.Enabled := True
    else
      btn_co_id_desvincula.Enabled := False;
  end
  else
  begin
    btn_co_id_desvincula.Enabled := False;
    btn_co_id_ref.Enabled := True;
    dbedt_id.Color := clWhite;
  end;
end;

procedure Tfrm_manut_proc.btnReplicarReferenciaClick(Sender: TObject);
var
  I: Integer;
  Proc: String;
begin
  if lbReplicarReferenciaProcessos.Count > 0 then
    with TQuery.Create(Self) do
      try
        DataBaseName := 'DBBROKER';
        SQL.Add('INSERT INTO TREF_CLIENTE(NR_PROCESSO, NR_SEQUENCIA, CD_REFERENCIA, CD_REF_EXP, DT_REFERENCIA, TP_REFERENCIA, CD_AREA, NR_ITEM_PO, NR_PARCIAL, IN_FLAG_LI, CD_EMPRESA)');
        SQL.Add('SELECT :NR_PROCESSO, :NR_SEQUENCIA, CD_REFERENCIA, CD_REF_EXP, CONVERT(DATETIME, CONVERT(VARCHAR, GETDATE(), 103), 103), TP_REFERENCIA, CD_AREA, NR_ITEM_PO, NR_PARCIAL, IN_FLAG_LI, :CD_EMPRESA');
        SQL.Add('FROM TREF_CLIENTE (NOLOCK) ');
        SQL.Add('WHERE NR_PROCESSO = :NR_PROCESSO_ORIGEM');
        SQL.Add('  AND CD_REFERENCIA = :CD_REFERENCIA_ORIGEM');
        SQL.Add('  AND NR_SEQUENCIA = :NR_SEQUENCIA_ORIGEM');
        ParamByName('NR_PROCESSO_ORIGEM').AsString   := datm_manut_proc.qry_ref_cliente_NR_PROCESSO.AsString;
        ParamByName('CD_REFERENCIA_ORIGEM').AsString := datm_manut_proc.qry_ref_cliente_CD_REFERENCIA.AsString;
        ParamByName('NR_SEQUENCIA_ORIGEM').AsString  := datm_manut_proc.qry_ref_cliente_NR_SEQUENCIA.AsString;

        for I := 0 to lbReplicarReferenciaProcessos.Count -1 do
        begin
          Proc := msk_cd_unid_neg.Text + msk_cd_produto.Text + lbReplicarReferenciaProcessos.Items[I];
          lbReplicarReferenciaProcessos.Selected[I] := True;
          Application.ProcessMessages;
          ParamByName('NR_PROCESSO').AsString   := Proc;
          ParamByName('CD_EMPRESA').AsString    := ConsultaLookUP('TPROCESSO', 'NR_PROCESSO', Proc, 'CD_CLIENTE');
          ParamByName('NR_SEQUENCIA').AsString  := ConsultaLookUPSQL(' SELECT RIGHT(''00'' + CONVERT(VARCHAR, ISNULL(MAX(CONVERT(INT, NR_SEQUENCIA)), 0) +1), 3) AS NR_SEQUENCIA' +
                                                                     ' FROM TREF_CLIENTE (NOLOCK) ' +
                                                                     ' WHERE NR_PROCESSO = ' + QuotedStr(Proc) +
                                                                     '   AND ISNUMERIC(NR_SEQUENCIA) = 1', 'NR_SEQUENCIA');

          try
            ExecSQL;
          except
            on E: Exception do
              MessageDlg('Erro replicando referência para o processo ''' + Proc + '''.'#13'Mensagem originial: ' + E.Message, mtError, [mbOk], 0);
          end;
        end;
      finally
        Free;
      end;
  MessageDlg('Operação concluída.', mtInformation, [mbOk], 0);
end;

procedure Tfrm_manut_proc.pgctrl_despacho_impChanging(Sender: TObject; var AllowChange: Boolean);
begin
  if (pgctrl_despacho_imp.ActivePage = ts_exportador) and (datm_manut_proc.qry_exportador_.State in [dsEdit, dsInsert]) then
    case MessageDlg('Exportador não foi salvo.'#13'Deseja salvar?', mtConfirmation, [mbYes, mbNo, mbCancel], 0) of
      mrYes: begin
               btn_salvar.Click;
               AllowChange := True;
             end;
      mrNo: begin
              btn_cancelar.Click;
              AllowChange := not (datm_manut_proc.qry_exportador_.State in [dsEdit, dsInsert]);
            end;
    else
      AllowChange := False;
    end
  else
    AllowChange := True;

  if (pgctrl_despacho_imp.ActivePage = ts_fabricante) and (datm_manut_proc.qry_fabricante_.State in [dsEdit, dsInsert]) then
    case MessageDlg('Fabricante não foi salvo.'#13'Deseja salvar?', mtConfirmation, [mbYes, mbNo, mbCancel], 0) of
      mrYes: begin
               btn_salvar.Click;
               AllowChange := True;
             end;
      mrNo: begin
              btn_cancelar.Click;
              AllowChange := not (datm_manut_proc.qry_fabricante_.State in [dsEdit, dsInsert]);
            end;
    else
      AllowChange := False;
    end
  else
    AllowChange := True;

end;

procedure Tfrm_manut_proc.btn_co_Local_EntregaClick(Sender: TObject);
begin
  if not lAbertura then
    Edita;
  if Sender is TSpeedButton then
  begin
    if not PoeEmEdicao(datm_manut_proc.qry_proc_im_) then
      Exit;
    if (Sender as TSpeedButton).Enabled then
      datm_manut_proc.qry_proc_im_CD_LOCAL_ENTREGA.AsString := ConsultaOnLineEx('TLOCAL_EMBARQUE', 'Local de Entrega', ['CODIGO', 'DESCRICAO'], ['Código', 'Nome'], 'CODIGO', frm_main.mi_cad_local_emb, 1, dbedtCD_LOCAL_ENTREGA.Text)
  end
  else
    edt_NM_LOCAL_ENTREGA.Text := ConsultaLookUP('TLOCAL_EMBARQUE', 'CODIGO', dbedtCD_LOCAL_ENTREGA.Text, 'DESCRICAO');
end;

procedure Tfrm_manut_proc.dbedtVL_LEAD_TIME_MChange(Sender: TObject);
begin
  if not lAbertura then
    Edita;
end;

procedure Tfrm_manut_proc.btn_cd_moeda_mle_imClick(Sender: TObject);
var
  DB_Codigo: TDBEdit;
  DB_Nome: TEdit;
begin
  if not lAbertura then
    Edita;
  if Sender is TSpeedButton then
  begin
    if not PoeEmEdicao(datm_manut_proc.qry_proc_im_) then
      Exit;
    DB_Codigo := TDBEdit(FindComponent(StringReplace(TSpeedButton(Sender).Name, 'btn', 'dbedt', [rfIgnoreCase])));
    if (Sender as TSpeedButton).Enabled Then
      DB_Codigo.Field.AsString := ConsultaOnLineEx('TMOEDA_BROKER', 'Moeda', ['CD_MOEDA', 'NM_MOEDA'], ['Código', 'Descrição'], 'CD_MOEDA', frm_main.mi_cad_moeda, 1, dbedt_CD_MOEDA_MLE_im.Text);
      //datm_manut_proc.qry_proc_im_CD_MOEDA_MLE.AsString := ConsultaOnLineEx('TMOEDA_BROKER', 'Moeda', ['CD_MOEDA', 'NM_MOEDA'], ['Código', 'Descrição'], 'CD_MOEDA', frm_main.mi_cad_moeda, 1, dbedt_CD_MOEDA_MLE_im.Text);
  end
  else
  begin
    DB_Nome := TEdit(FindComponent(StringReplace(TDBEdit(Sender).Name, '_CD_', '_NM_', [rfIgnoreCase])));
    DB_Nome.Text := ConsultaLookUP('TMOEDA_BROKER', 'CD_MOEDA', dbedt_CD_MOEDA_MLE_im.Text, 'NM_MOEDA');
    //dbedt_NM_MOEDA_MLE_im.Text := ConsultaLookUP('TMOEDA_BROKER', 'CD_MOEDA', dbedt_CD_MOEDA_MLE_im.Text, 'NM_MOEDA');
  end;
end;

procedure Tfrm_manut_proc.btn_cd_unid_medida_imClick(Sender: TObject);
var
  DB_Codigo: TDBEdit;
  DB_Nome: TEdit;
begin
  if not lAbertura then
    Edita;

  if Sender is TSpeedButton then
  begin
    if not PoeEmEdicao(datm_manut_proc.qry_proc_im_) then
      Exit;
      
    DB_Codigo := TDBEdit(FindComponent(StringReplace(TSpeedButton(Sender).Name, 'btn', 'dbedt', [rfIgnoreCase])));
    if (Sender as TSpeedButton).Enabled Then
      DB_Codigo.Field.AsString := ConsultaOnLineEx('TUNID_MEDIDA_BROKER', 'Unidade de Medida', ['CD_UNID_MEDIDA', 'NM_UNID_MEDIDA'], ['Código', 'Descrição'], 'CD_UNID_MEDIDA', frm_main.mi_cad_unid_medida, 1, dbedt_CD_UNID_MEDIDA_im.Text);
      //datm_manut_proc.qry_proc_im_CD_UNID_MEDIDA.AsString := ConsultaOnLineEx('TUNID_MEDIDA_BROKER', 'Unidade de Medida', ['CD_UNID_MEDIDA', 'NM_UNID_MEDIDA'], ['Código', 'Descrição'], 'CD_UNID_MEDIDA', frm_main.mi_cad_unid_medida, 1, dbedt_CD_UNID_MEDIDA_im.Text);
  end
  else
  begin
    DB_Nome := TEdit(FindComponent(StringReplace(TDBEdit(Sender).Name, '_CD_', '_NM_', [rfIgnoreCase])));
    DB_Nome.Text := ConsultaLookUP('TUNID_MEDIDA_BROKER', 'CD_UNID_MEDIDA', TDBEdit(Sender).Text, 'NM_UNID_MEDIDA');
    //dbedt_NM_UNID_MEDIDA_im.Text := ConsultaLookUP('TUNID_MEDIDA_BROKER', 'CD_UNID_MEDIDA', dbedt_CD_UNID_MEDIDA_im.Text, 'NM_UNID_MEDIDA');
  end;
end;

procedure Tfrm_manut_proc.dbedt_VL_TRANSIT_TIME_AChange(Sender: TObject);
begin
    if not lAbertura then
    Edita;

  if trim((Sender as TDBEdit).text) = '' then
    (Sender as TDBEdit).text :='0';
end;

procedure Tfrm_manut_proc.btn_FronteiraExp_FClick(Sender: TObject);
begin
  if not lAbertura then
    Edita;
  if Sender is TSpeedButton then
  begin
    if not PoeEmEdicao(datm_manut_proc.qry_proc_em_) then
      exit;
    if (Sender as TSpeedButton).Enabled then
      datm_manut_proc.qry_proc_em_CD_FRONTEIRA.AsString := ConsultaOnLineEx('TLOCAL_EMBARQUE', 'Fronteira', ['CODIGO', 'DESCRICAO'], ['Código', 'Descrição'], 'CODIGO', frm_main.mi_cad_local_emb);
  end
  else
    dbedt_nm_fronteiraExp_F.Text := ConsultaLookUP('TLOCAL_EMBARQUE', 'CODIGO', dbedt_cd_fronteiraExp_F.Text, 'DESCRICAO');
end;

procedure Tfrm_manut_proc.btn_FronteiraImp_FClick(Sender: TObject);
begin
  if not lAbertura then
    Edita;
  if Sender is TSpeedButton then
  begin
    if not PoeEmEdicao(datm_manut_proc.qry_proc_im_) then
      exit;
    if (Sender as TSpeedButton).Enabled then
      datm_manut_proc.qry_proc_im_CD_FRONTEIRA.AsString := ConsultaOnLineEx('TLOCAL_EMBARQUE', 'Fronteira', ['CODIGO', 'DESCRICAO'], ['Código', 'Descrição'], 'CODIGO', frm_main.mi_cad_local_emb);
  end
  else
    dbedt_nm_fronteiraImp_F.Text := ConsultaLookUP('TLOCAL_EMBARQUE', 'CODIGO', dbedt_cd_fronteiraImp_F.Text, 'DESCRICAO');
end;

procedure Tfrm_manut_proc.btnLOCAL_ENTREGA_CNTRClick(Sender: TObject);
begin
  if not lAbertura then
    Edita;
  if Sender is TSpeedButton then
  begin
    if not PoeEmEdicao(datm_manut_proc.qry_proc_cntr_) then
      Exit;
    if (Sender as TSpeedButton).Enabled then
      datm_manut_proc.qry_proc_cntr_CD_LOCAL_ENTREGA.AsString := ConsultaOnLineEx('TLOCAL_ENTREGA_SAMSUNG', 'Local de Entrega', ['CD_LOCAL_ENTREGA', 'NM_LOCAL_ENTREGA', 'DS_LOCAL_ENTREGA'], ['Código', 'Nome', 'Descrição'], 'CD_LOCAL_ENTREGA', nil);
  end
  else
    edtNM_LOCAL_ENTREGA_CNTR.Text := ConsultaLookUP('TLOCAL_ENTREGA_SAMSUNG', 'CD_LOCAL_ENTREGA', dbedtCD_LOCAL_ENTREGA_CNTR.Text, 'NM_LOCAL_ENTREGA');
end;

procedure Tfrm_manut_proc.btn_co_id_refClick(Sender: TObject);
var
  id_codigo : String;
begin
  //GUILHERME - 07/05/2014 - INTEGRAR ID EM PROCESSO EM ANDAMENTO
  if Not lAbertura then Edita;

  if Sender is TSpeedButton then
  begin
    id_codigo := ConsultaOnLineExSQL('SELECT ID.ID_CODIGO, U.NM_USUARIO, CONVERT(VARCHAR, ID.DT_AUTORIZACAO, 103) DT_AUTORIZACAO  ' +
                                      ' FROM TINSTRUCAO_DESEMBARACO ID ' +
                                      '  INNER JOIN TUSUARIO U ON U.CD_USUARIO = ID.CD_USUARIO_AUTORIZACAO ' +
                                      ' WHERE ID.CD_CLIENTE = '''+ datm_manut_proc.qry_processo_CD_CLIENTE.AsString + ''''+
                                      '   AND ID.IN_AUTORIZADO = ''1'''+
                                      '   AND ID.CD_MODAL = (SELECT CD_VIA_TRANSPORTE FROM VW_SERVICO_GERAL WHERE CD_SERVICO = ''' + datm_manut_proc.qry_processo_CD_SERVICO.AsString + ''') ' +
                                      '   AND ID.NR_PROCESSO IS NULL',
                              'Instruções de desembaraço',
                              ['ID_CODIGO', 'NM_USUARIO', 'DT_AUTORIZACAO'],
                              ['ID', 'Autorizado por', 'Autorizado em'],
                              'ID_CODIGO', nil, dbedt_id.text);
  end;

  if id_codigo <> '' then
  begin
    if MessageDlg('ATENÇÃO: Deseja realmente integrar os pedidos da ' + Trim(id_codigo) + ' neste processo?', mtConfirmation, [mbYes, mbNo], 0) = mrYes then
    begin
      datm_main.db_broker.StartTransaction;
      try
        datm_manut_proc.qry_processo_.Edit;
        datm_manut_proc.qry_processo_ID_CODIGO_INSTR_DESEMB.AsString := id_codigo;

        with TQuery.Create(Application)do
        begin
          DatabaseName  := 'DBBROKER';
          SQL.Clear;
          SQL.Add('DELETE FROM TREF_CLIENTE WHERE TP_REFERENCIA = ''01'' AND NR_PROCESSO = :NR_PROCESSO');
          ParamByName('NR_PROCESSO').AsString := datm_manut_proc.qry_processo_NR_PROCESSO.AsString;
          ExecSQL;

          SQL.Clear;
          SQL.Add('SELECT IDP.NR_REFERENCIA, ID.CD_CLIENTE, IDP.NR_ITEM_PO, IDP.NR_PARCIAL');
          SQL.Add('FROM TINSTRUCAO_DESEMBARACO_PEDIDO IDP');
          SQL.Add('   INNER JOIN TINSTRUCAO_DESEMBARACO ID ON ID.ID_CODIGO = IDP.ID_CODIGO');
          SQL.Add('WHERE IDP.ID_CODIGO = :ID_CODIGO');
          ParamByName('ID_CODIGO').AsString := datm_manut_proc.qry_processo_ID_CODIGO_INSTR_DESEMB.AsString;
          Open;

          CloseStoredProc(datm_manut_proc.sp_alimenta_ref_cliente);
          datm_manut_proc.sp_alimenta_ref_cliente.ParamByName('@NR_PROCESSO').AsString := datm_manut_proc.qry_processo_NR_PROCESSO.AsString;
          datm_manut_proc.sp_alimenta_ref_cliente.ParamByName('@ID_CODIGO').AsString := datm_manut_proc.qry_processo_ID_CODIGO_INSTR_DESEMB.AsString;
          ExecStoredProc(datm_manut_proc.sp_alimenta_ref_cliente);
          CloseStoredProc(datm_manut_proc.sp_alimenta_ref_cliente);

          Close;
          SQL.Clear;
          SQL.Add(' UPDATE TINSTRUCAO_DESEMBARACO SET NR_PROCESSO = :NR_PROCESSO WHERE ID_CODIGO = :ID_CODIGO ');
          ParamByName('NR_PROCESSO').AsString := datm_manut_proc.qry_processo_NR_PROCESSO.AsString;
          ParamByName('ID_CODIGO').AsString := datm_manut_proc.qry_processo_ID_CODIGO_INSTR_DESEMB.AsString;
          ExecSQL;
        end;

        datm_manut_proc.qry_ref_cliente_.Close;
        datm_manut_proc.qry_ref_cliente_.Open;
        datm_manut_proc.qry_processo_.Post;

        with TQuery.Create(Application)do
        begin
          DatabaseName  := 'DBBROKER';
          SQL.Clear;
          if datm_manut_proc.qry_processo_CD_GRUPO.AsString = '155' then
          begin
            SQL.Clear;
            SQL.TEXT := ' SELECT SUM(PO.PL_PO) AS PESO_LIQUIDO, SUM(PO.PB_PO) AS PESO_BRUTO     ' +
                        '   FROM TPO  PO  (NOLOCK)                                              ' +
                        '   JOIN(SELECT MAX(NR_ITEM) AS NR_ITEM , I.NR_PROCESSO, I.CD_EMPRESA   ' +
                        '          FROM TPO_ITEM I (NOLOCK)                                     ' +
                        '         WHERE I.ID_CODIGO_INSTR_DESEMB = :ID_CODIGO                   ' +
                        '      GROUP BY I.NR_PROCESSO, I.CD_EMPRESA                             ' +
                        '       ) POI ON POI.NR_PROCESSO = PO.NR_PROCESSO                       ' +
                        '            AND POI.CD_EMPRESA  = PO.CD_EMPRESA                        ' ;
            ParamByName('ID_CODIGO').AsString := datm_manut_proc.qry_processo_ID_CODIGO_INSTR_DESEMB.AsString;
            Open;
            datm_manut_proc.qry_proc_im_.Edit;
            datm_manut_proc.qry_proc_im_VL_PESO_LIQUIDO.AsFloat := fieldByName('PESO_LIQUIDO').asfloat;
            datm_manut_proc.qry_proc_im_VL_PESO_BRUTO.AsFloat   := fieldByName('PESO_BRUTO').asfloat;
            datm_manut_proc.qry_proc_im_.Post;
            close;
          end;
        end;

        datm_main.db_broker.Commit;

        btn_co_id_ref.Enabled := False;
        dbedt_id.Color := clMenu;
      except on e:exception do
      begin
        if datm_main.db_broker.InTransaction then
          datm_main.db_broker.Rollback;
        ShowMessage('ATENÇÃO: Erro ao integrar ID! ' + e.message);

        btn_co_id_ref.Enabled := True;
        dbedt_id.Color := clWhite;
      end;
      end;
    end
    else
      id_codigo := '';
  end;
end;

function Tfrm_manut_proc.NewWebBrowserImportaRE: Tfrm_Web;
begin
  Application.CreateForm(Tfrm_Web, Result);
  Result.WindowState := wsNormal;
  Result.OnDocumentComplete  := WebDocumentCompleteImportaRE;
  FStatusBrowser := True;
end;

procedure Tfrm_manut_proc.SpeedButton2Click(Sender: TObject);
begin
  //GUILHERME - 14/05/2014 (ESSE BOTAO NAO É MAIS ATUALIZADO)
  //if not Consulta_RE_MANUT(  ConsultaOnLineExFILTRO('VW_DESPACHANTE_CLIENTE','Escolha o Usuário',['CD_ACESSO','NM_USUARIO','CPF_USUARIO'],['Código','Usuário','CPF'],'CD_ACESSO','TIPO="RE" AND CD_EMPRESA="'+datm_manut_proc.qry_processo_CD_CLIENTE.AsString +'"' , nil,'' ) ) then
  //    ShowMessage('RE NÃO CONSULTADO !');
  ExecutaIntegracaoImportaRE;
end;

procedure Tfrm_manut_proc.ExecutaIntegracaoImportaRE;
var
  dtInicio, dtFim: TDateTime;
  Script: TStrings;
  ArquivoScript: String;
  CPF, Senha: String;
  ConsultarTodos: Boolean;
begin
  datm_manut_proc.qry_exp_re_.First;
  if not datm_manut_proc.qry_exp_re_.Eof then
  begin
    while not datm_manut_proc.qry_exp_re_.Eof do
    begin
      Script := TStringList.Create;
      try
        with TQuery.Create(application) do begin
          DatabaseName := 'DBBROKER';
          SQL.Clear;
          SQL.Add(' SELECT TOP 1 D.CPF_DESPACHANTE, D.NM_SENHA ');
          SQL.Add(' FROM TDESPACHANTE_CLIENTE DC ');
          SQL.Add(' INNER JOIN TDESPACHANTE D ON D.CD_DESPACHANTE = DC.CD_DESPACHANTE ');
          SQL.Add(' WHERE DC.CD_EMPRESA = ''' + datm_manut_proc.qry_processo_CD_CLIENTE.AsString + ''' ');
          SQL.Add(' AND RTRIM(DC.TIPO) = ''RE''');
          Open;

          Senha := FieldByName('NM_SENHA').AsString;
          CPF   := FieldByName('CPF_DESPACHANTE').AsString;
          Close;
          Free;
        end;

        if CPF <> '' then
        begin
          frm_web := NewWebBrowserImportaRE;
          try
            with frm_web do
            begin
              Script.Add('javascript');
              Script.Add('if ((document.getElementById("cpfTemp") != null))');
              Script.Add('{');
              Script.Add('  document.getElementById("cpfTemp").value = "' + CPF + '";');
              Script.Add('  if ((document.getElementById("senhaTemp") != null))');
              Script.Add('    document.getElementById("senhaTemp").value = "' + Senha + '";');
              Script.Add('  if ((document.getElementById("Image7") != null))');
              Script.Add('    document.getElementById("Image7").click();');
              Script.Add('}');

              Navegar('https://siscomex.desenvolvimento.gov.br/g33159Secex2/jsp/logon.jsp?ind=1', Script);
            end;
          finally
            FreeAndNil(frm_web);
            //frm_web := nil;
          end;
        end;
      finally
        FreeAndNil(Script);
      end;
    if FStatusBrowser then
      datm_manut_proc.qry_exp_re_.Next;
    end;
  end;
end;

procedure Tfrm_manut_proc.WebDocumentCompleteImportaRE(Sender: TObject;
  const pDisp: IDispatch; var URL: OleVariant);
var
  TabelaREItens: Variant;
  TabelaRECabec: Variant;
  QtdeItens, QtdeREs, I, J, T, N: Integer;
begin
   if AnsiContainsText(URL, 'index.jsp')  then
   begin
     SetLength(ImportaRE, 0);
     RE_atual := LeftStr(Trim( datm_manut_proc.qry_exp_re_NR_RE.AsString), 9) + '001';
     frm_Web.ExecutaScript('document.location = "https://siscomex.desenvolvimento.gov.br/ExportacaoWeb/ExibirRegistroExportacao.do?re=' + RE_atual + '&st=2"','javascript');
   end
   else if AnsiContainsText(URL, 'ExibirRegistroExportacao.do?re=') and ((High(ImportaRE) < 0) or (ImportaRE[High(ImportaRE)].NrRE <> RE_atual)) then
   begin
     SetLength(ImportaRE, High(ImportaRE)+2);

     //Valores Capa
     ImportaRE[High(ImportaRE)].NrProcesso      := Trim(datm_manut_proc.qry_exp_re_NR_PROCESSO.AsString);
     ImportaRE[High(ImportaRE)].NrRE            := RE_atual;

     //Valor Enquadramento
     frm_Web.ExecutaScript('toggle("enquadramento-detalhes","menu-enquadramento-detalhes");','javascript');
     TabelaRECabec := frm_Web.OleDocument.getElementById('enquadramento-detalhes').getElementsByTagName('tbody').item(0);
     ImportaRE[High(ImportaRE)].TxEnquadramento := TabelaRECabec.getElementsByTagName('input').item(0).value;

     //Valor NCM e Mercadorias
     frm_Web.ExecutaScript('toggle("mercadoria","menu-mercadoria");','javascript');
     frm_Web.ExecutaScript('consultarItensMercadoria();','javascript');
     ImportaRE[High(ImportaRE)].NrNCM := StringReplace(frm_Web.OleDocument.all.codigoMercadoria.value, '-', '',[rfReplaceAll]);

     //Pega a quantidade de Itens da RE
     QtdeItens :=  (frm_Web.OleDocument.getElementById('itens-mercadoria').getElementsByTagName('tbody').item(1).getElementsByTagName('tr').length)/2;

     //Valores de cabeçalho
     TabelaRECabec :=  frm_Web.OleDocument.getElementById('itens-mercadoria').getElementsByTagName('table').item(1).getElementsByTagName('th');

     //Valores da tabela
     TabelaREItens := frm_Web.OleDocument.getElementById('itens-mercadoria').getElementsByTagName('tbody').item(1).getElementsByTagName('tr');

     SetLength(ImportaRE[High(ImportaRE)].Itens, QtdeItens);
     T := 0;
     for I:= 0 to QtdeItens-1 do
     begin
       ImportaRE[High(ImportaRE)].Itens[I].NrItem          := I+1;
       ImportaRE[High(ImportaRE)].Itens[I].TxMercadoria    := Trim(TabelaREItens.item(T).getElementsByTagName('td').item(0).childNodes.item(0).innerHTML);
       ImportaRE[High(ImportaRE)].Itens[I].VlCondVenda     := TabelaREItens.item(T+1).getElementsByTagName('td').item(1).innerHTML;
       ImportaRE[High(ImportaRE)].Itens[I].VlLocalEmbarque := TabelaREItens.item(T+1).getElementsByTagName('td').item(2).innerHTML;
       ImportaRE[High(ImportaRE)].Itens[I].QtUnComercial   := TabelaREItens.item(T+1).getElementsByTagName('td').item(3).innerHTML;
       ImportaRE[High(ImportaRE)].Itens[I].TxUnComercial   := StringReplace(StringReplace(TabelaRECabec.item(4).innerHTML,'Qtde. Un. Comercializada (','',[rfReplaceAll]),')','',[rfReplaceAll]);
       ImportaRE[High(ImportaRE)].Itens[I].QtUnEstatistica := TabelaREItens.item(T+1).getElementsByTagName('td').item(4).innerHTML;
       ImportaRE[High(ImportaRE)].Itens[I].TxUnEstatistica := StringReplace(StringReplace(TabelaRECabec.item(5).innerHTML,'Qtde. Un. Estatística (','',[rfReplaceAll]),')','',[rfReplaceAll]);
       ImportaRE[High(ImportaRE)].Itens[I].QtPesoLiquido   := TabelaREItens.item(T+1).getElementsByTagName('td').item(5).innerHTML;
       T := T + 2;
     end;
     if RE_atual <> Trim(datm_manut_proc.qry_exp_re_NR_RE.AsString) then
     begin
       RE_atual := LeftStr(Trim(RE_atual), 9) + FormatFloat('000', StrToInt(RightStr(Trim(RE_atual), 3)) + 1);
       frm_Web.ExecutaScript('document.location = "https://siscomex.desenvolvimento.gov.br/ExportacaoWeb/ExibirRegistroExportacao.do?re=' + RE_atual + '&st=2"','javascript');
     end
     else
     begin
       datm_manut_proc.qry_exp_re_.Next;
       if datm_manut_proc.qry_exp_re_.Eof then
       begin
         frm_Web.Close;
         GravaImportaRE;
       end
       else
       begin
         RE_atual := LeftStr(Trim( datm_manut_proc.qry_exp_re_NR_RE.AsString), 9) + '001';
         frm_Web.ExecutaScript('document.location = "https://siscomex.desenvolvimento.gov.br/ExportacaoWeb/ExibirRegistroExportacao.do?re=' + RE_atual + '&st=2"','javascript');
       end;
     end;
   end;

end;

procedure Tfrm_manut_proc.GravaImportaRE;
var
  I, J: Integer;
begin
  with TQuery.Create(Application)do
  begin
    DatabaseName := 'DBBROKER';
    SQL.Clear;
    SQL.Add('DELETE FROM TPROCESSO_RE_ITENS_NOVOEX WHERE NR_PROCESSO = :NR_PROCESSO ');
    ParamByName('NR_PROCESSO').AsString := datm_manut_proc.qry_exp_re_NR_PROCESSO.AsString;
    ExecSQL;
    for I := 0 to High(ImportaRE) do
    begin
      for J := 0 to High(ImportaRE[I].Itens) do
      begin
        SQL.Clear;
        SQL.Add('INSERT INTO TPROCESSO_RE_ITENS_NOVOEX ');
        SQL.Add(' (NR_PROCESSO, NR_RE, NR_NCM, TX_ENQUADRAMENTO, NR_ITEM, TX_MERCADORIA, VL_COND_VENDA, VL_LOCAL_EMB, ');
        SQL.Add('  QT_UNID_COMERC, TX_UNID_COMERC, QT_UNID_ESTAT,	TX_UNID_ESTAT, QT_PESO_LIQ) ');
        SQL.Add('VALUES ');
        SQL.Add(' (:NR_PROCESSO, :NR_RE, :NR_NCM, :TX_ENQUADRAMENTO, :NR_ITEM, :TX_MERCADORIA, :VL_COND_VENDA, :VL_LOCAL_EMB, ');
        SQL.Add('  :QT_UNID_COMERC, :TX_UNID_COMERC, :QT_UNID_ESTAT, :TX_UNID_ESTAT, :QT_PESO_LIQ) ');
        ParamByName('NR_PROCESSO').AsString := ImportaRE[I].NrProcesso;
        ParamByName('NR_RE').AsString := ImportaRE[I].NrRE;
        ParamByName('NR_NCM').AsString := ImportaRE[I].NrNCM;
        ParamByName('TX_ENQUADRAMENTO').AsString := ImportaRE[I].TxEnquadramento;
        ParamByName('NR_ITEM').AsInteger       := ImportaRE[I].Itens[J].NrItem;
        ParamByName('TX_MERCADORIA').AsString  := RightStr(ImportaRE[I].Itens[J].TxMercadoria, Length(ImportaRE[I].Itens[J].TxMercadoria) - 4);
        ParamByName('VL_COND_VENDA').AsFloat   := ImportaRE[I].Itens[J].VlCondVenda;
        ParamByName('VL_LOCAL_EMB').AsFloat    := ImportaRE[I].Itens[J].VlLocalEmbarque;
        ParamByName('QT_UNID_COMERC').AsFloat  := ImportaRE[I].Itens[J].QtUnComercial;
        ParamByName('TX_UNID_COMERC').AsString := ImportaRE[I].Itens[J].TxUnComercial;
        ParamByName('QT_UNID_ESTAT').AsFloat   := ImportaRE[I].Itens[J].QtUnEstatistica;
        ParamByName('TX_UNID_ESTAT').AsString  := ImportaRE[I].Itens[J].TxUnEstatistica;
        ParamByName('QT_PESO_LIQ').AsFloat     := ImportaRE[I].Itens[J].QtPesoLiquido;
        ExecSQL;
      end;
    end;
    Free;
  end;
end;

procedure Tfrm_manut_proc.SpeedButton1Click(Sender: TObject);
begin
  Application.CreateForm(Tfrm_info_novoex, frm_info_novoex);
  try
     frm_info_novoex.ShowModal(Trim(datm_manut_proc.qry_exp_re_NR_PROCESSO.AsString));
  finally
    FreeAndNil(frm_info_novoex);
  end;
end;

procedure Tfrm_manut_proc.dbedtCD_LOCAL_ENTREGA_CARGA_SOLTAChange(
  Sender: TObject);
begin
  if not lAbertura then
    Edita;
  if Sender is TSpeedButton then
  begin
    if not PoeEmEdicao(datm_manut_proc.qry_proc_carga_solta_) then
      Exit;
    if (Sender as TSpeedButton).Enabled then
      datm_manut_proc.qry_proc_carga_solta_CD_LOCAL_ENTREGA.AsString := ConsultaOnLineEx('TLOCAL_ENTREGA_SAMSUNG', 'Local de Entrega', ['CD_LOCAL_ENTREGA', 'NM_LOCAL_ENTREGA', 'DS_LOCAL_ENTREGA'], ['Código', 'Nome', 'Descrição'], 'CD_LOCAL_ENTREGA', nil);
  end
  else
    edtNM_LOCAL_ENTREGA_CARGA_SOLTA.Text := ConsultaLookUP('TLOCAL_ENTREGA_SAMSUNG', 'CD_LOCAL_ENTREGA', dbedtCD_LOCAL_ENTREGA_CARGA_SOLTA.Text, 'NM_LOCAL_ENTREGA');
end;

procedure Tfrm_manut_proc.dbchkIN_TRANSMITE_SEM_PREVISAOClick(Sender: TObject);
begin
  if Not lAbertura then
    Edita;
end;

procedure Tfrm_manut_proc.btn_co_id_desvinculaClick(Sender: TObject);
begin
  if MessageDlg('ATENÇÃO: Deseja realmente desvincular a ' + Trim(datm_manut_proc.qry_processo_ID_CODIGO_INSTR_DESEMB.AsString) + ' deste processo?', mtConfirmation, [mbYes, mbNo], 0) = mrYes then
  begin
    datm_main.db_broker.StartTransaction;
    try
    with TQuery.Create(Application)do
    begin
      DatabaseName  := 'DBBROKER';
      SQL.Clear;
      SQL.Add('DELETE FROM TREF_CLIENTE WHERE TP_REFERENCIA = ''01'' AND NR_PROCESSO = :NR_PROCESSO');
      ParamByName('NR_PROCESSO').AsString := datm_manut_proc.qry_processo_NR_PROCESSO.AsString;
      ExecSQL;

      SQL.Clear;
      SQL.Add(' UPDATE TINSTRUCAO_DESEMBARACO SET NR_PROCESSO = NULL WHERE ID_CODIGO = :ID_CODIGO ');
      ParamByName('ID_CODIGO').AsString := datm_manut_proc.qry_processo_ID_CODIGO_INSTR_DESEMB.AsString;
      ExecSQL;

      SQL.Clear;
      SQL.Add(' UPDATE TPROCESSO SET ID_CODIGO_INSTR_DESEMB = NULL WHERE NR_PROCESSO = :NR_PROCESSO ');
      ParamByName('NR_PROCESSO').AsString := datm_manut_proc.qry_processo_NR_PROCESSO.AsString;
      ExecSQL;
    end;
    datm_manut_proc.qry_ref_cliente_.Close;
    datm_manut_proc.qry_ref_cliente_.Open;
    datm_main.db_broker.Commit;

    btn_co_id_ref.Enabled := False;
    dbedt_id.Color := clMenu;
    except
      if datm_main.db_broker.InTransaction then
        datm_main.db_broker.Rollback;
      ShowMessage('ATENÇÃO: Erro ao desvincular ID!');

      btn_co_id_ref.Enabled := True;
      dbedt_id.Color := clWhite;
    end;
  end;
end;

procedure Tfrm_manut_proc.dbedt_VL_TRANSIT_TIME_MExit(Sender: TObject);
begin

  //guilherme - 20/01/2015
  if (datm_manut_proc.qry_processo_CD_GRUPO.AsString = '155') then
  begin
    if datm_manut_proc.qry_proc_em_.State <> dsEdit then
      datm_manut_proc.qry_proc_em_.Edit;

    if Not lAbertura then Edita;
    if (Trim(datm_manut_proc.qry_proc_em_VL_TRANSIT_TIME.AsString) <> '') then
      datm_manut_proc.qry_proc_em_VL_LEAD_TIME.AsInteger :=  datm_manut_proc.qry_proc_em_VL_TRANSIT_TIME.AsInteger + 7  
    else
      datm_manut_proc.qry_proc_em_VL_LEAD_TIME.AsString :=  '';
  end;

end;

procedure Tfrm_manut_proc.miRecuperaLIClick(Sender: TObject);
var
  bmLi : TBookmark;
begin
  FastExecSQL(' UPDATE TPROCESSO_LI SET IN_FILA_RECUPERAR = ''1'' WHERE NR_LI = :NR_LI', [datm_manut_proc.qry_li_NR_LI.AsString]);

  bmLi := datm_manut_proc.qry_li_.getbookmark;
  datm_manut_proc.qry_li_.Close;
  datm_manut_proc.qry_li_.Open;
  datm_manut_proc.qry_li_.gotoBookMark(bmLi);
  datm_manut_proc.qry_li_.freeBookMark(bmLi);
end;

procedure Tfrm_manut_proc.pmRecuperaLIPopup(Sender: TObject);
begin
  miRecuperaLI.Visible := not (datm_manut_proc.ds_li.State in [dsEdit, dsInsert]) and (Length(Trim(datm_manut_proc.qry_li_NR_LI.AsString))>2);

  if miRecuperaLI.Visible then
  begin
    with TQuery.Create(Application)do
    try
      DatabaseName  := 'DBBROKER';
      SQL.Clear;
      SQL.text := ' SELECT COUNT(*) CONTADOR                                                                '+
                  '   FROM TPROCESSO_LI L (NOLOCK)                                                          '+
                  '   LEFT JOIN OPERAÇÃO_COM_TRATAMENTO O (NOLOCK) ON  O.NR_OPER_TRAT_PREV = L.NR_LI        '+
                  '  WHERE  ( (IN_FILA_RECUPERAR = ''1'' ) OR (O.NR_OPER_TRAT_PREV IS NOT NULL) )           '+
//                '--       OR NR_LI IN (SELECT NR_OPER_TRAT_PREV FROM OPERAÇÃO_COM_TRATAMENTO (NOLOCK) ) ) '+
                  '    AND NR_LI = :NR_LI                                                                   ';
      ParamByName('NR_LI').AsString := datm_manut_proc.qry_li_NR_LI.AsString;
      Open;
      miRecuperaLI.Enabled := FieldByName('CONTADOR').AsInteger = 0;
      Close;
    finally
      Free;
    end;
  end;
end;

procedure Tfrm_manut_proc.btnDistribuiSDAClick(Sender: TObject);
begin
  try
    FastExecSQL('EXEC SP_REDISTRIBUI_SDA :NR_PROCESSO', [str_nr_processo]);
  except
    on E: Exception do
      MessageDlg('Erro executando a operação.'#13 + E.Message, mtError, [mbOk], 0);
  end;
end;

procedure Tfrm_manut_proc.btnCalculaSDAClick(Sender: TObject);
begin
  try
    FastExecSQL('EXEC SP_CALCULA_SDA :NR_PROCESSO', [str_nr_processo]);
  except
    on E: Exception do
      MessageDlg('Erro executando a operação.'#13 + E.Message, mtError, [mbOk], 0);
  end;
end;

procedure Tfrm_manut_proc.SetReferencia(const Processo, NR_RE, Referencia: string);
var
  Query: TLocalQuery;
begin
  Query := AutoQuery.Query('UPDATE TPROCESSO_EXP_RE SET CD_REFERENCIA = :CD_REFERENCIA '+
                           'WHERE NR_PROCESSO = :NR_PROCESSO AND NR_RE = :NR_RE');
  Query.ParamByName('CD_REFERENCIA').AsString := Referencia;
  Query.ParamByName('NR_PROCESSO').AsString := Processo;
  Query.ParamByName('NR_RE').AsString := NR_RE;
  Query.ExecSQL;
  datm_manut_proc.qry_exp_re_.Close;
  datm_manut_proc.qry_exp_re_.ParamByName('NR_PROCESSO').AsString := Processo;
  datm_manut_proc.qry_exp_re_.Open;
end;

procedure Tfrm_manut_proc.SpeedButton3Click(Sender: TObject);
var
  SQL: string;
  Ref: string;
begin
  SQL := 'SELECT CD_REFERENCIA, DT_REFERENCIA FROM TREF_CLIENTE (NOLOCK) WHERE TP_REFERENCIA = '+
     QuotedStr('01') + ' AND NR_PROCESSO = ' + QuotedStr(datm_manut_proc.qry_exp_re_NR_PROCESSO.AsString);
  Ref := '';
  Ref := ConsultaOnLineExSQL(SQL, 'Referências', ['CD_REFERENCIA', 'DT_REFERENCIA'], ['Referência', 'Data'], 'CD_REFERENCIA');
  if Ref <> '' then
    SetReferencia(datm_manut_proc.qry_exp_re_NR_PROCESSO.AsString, datm_manut_proc.qry_exp_re_NR_RE.AsString, Ref);
end;

procedure Tfrm_manut_proc.cmbTpNotificado1Exit(Sender: TObject);
begin
  if Not lAbertura then
    Edita;

 // dbeCdNotificado1.Text := '';   {alterado por agatha nigro 05/02/2018}

  Habilita_Btn_Draft( 2 );
//  if not datm_manut_proc.qry_processo_TP_NOTIFY1.IsNull then
//    if datm_manut_proc.qry_processo_TP_NOTIFY1.AsString <> '5' then
//      dbeCdNotificado1.SetFocus;
end;

procedure Tfrm_manut_proc.cmbTpNotificado2Exit(Sender: TObject);
begin
  if Not lAbertura then
    Edita;

 // dbeCdNotificado2.Text := '';  // {alterado por agatha nigro 05/02/2018}

  Habilita_Btn_Draft( 3 );
//  if not datm_manut_proc.qry_processo_TP_NOTIFY2.IsNull then
//    if datm_manut_proc.qry_processo_TP_NOTIFY2.AsString <> '5' then
//      dbeCdNotificado2.SetFocus;
end;

procedure Tfrm_manut_proc.Habilita_Btn_Draft( nNum : Integer );
begin
  with datm_manut_proc do
  begin
    if nNum = 1 then
    begin
      if qry_proc_em_TP_CONSIGNEE.IsNull or (qry_proc_em_TP_CONSIGNEE.AsString = '5') then begin
        dbedt_cd_consignatario.Enabled   := False;
        edt_nm_consignatario.Text        := '';
        btn_co_consignatario.Enabled     := False;
      end
      else
      begin
        dbedt_cd_consignatario.Enabled   := True;
        btn_co_consignatario.Enabled     := True;
        if dblkcbox_consignatario.KeyValue <> '' then
          Muda_Lookup_Nm( 1, dblkcbox_consignatario.KeyValue );
      end;
    end
    else
    if nNum = 2 then
    begin
      if qry_proc_em_TP_NOTIFY1_PROC.IsNull or (qry_proc_em_TP_NOTIFY1_PROC.AsString = '5') then begin
        dbeCdNotificado1.Enabled   := False;
        edtNmNotificado1.Text      := '';
        btnCoNotificado1.Enabled   := False;
      end
      else
      begin
        dbeCdNotificado1.Enabled   := True;
        btnCoNotificado1.Enabled   := True;
        if cmbTpNotificado1.KeyValue <> '' then
          Muda_Lookup_Nm( 2, cmbTpNotificado1.KeyValue );
      end;
    end
    else
    if nNum = 3 then
    begin
      if qry_proc_em_TP_NOTIFY2_PROC.IsNull or (qry_proc_em_TP_NOTIFY2_PROC.AsString = '5') then begin
        dbeCdNotificado2.Enabled   := False;
        edtNmNotificado2.Text      := '';
        btnCoNotificado2.Enabled   := False;
      end
      else
      begin
        dbeCdNotificado2.Enabled   := True;
        btnCoNotificado2.Enabled   := True;
        if cmbTpNotificado2.KeyValue <> '' then
          Muda_Lookup_Nm( 3, cmbTpNotificado2.KeyValue );
      end;
    end;
  end;
end;

procedure Tfrm_manut_proc.dbeCdNotificado1Exit(Sender: TObject);
begin
  If datm_manut_proc.qry_proc_em_.State in [dsEdit,dsInsert] then
  begin
    ValCodigo( dbeCdNotificado1, dbeCdNotificado1.MaxLength );
    if dbeCdNotificado1.Text <> '' then
    begin
      if ( edtNmNotificado1.Text = '' ) then
      begin
        BoxMensagem('Código do Notificado1 inválido!',2);
        pgctrl_manut_proc.ActivePage := ts_Draft;
        dbeCdNotificado1.SetFocus;
        Exit;
      end;
    end;
  end;
end;

procedure Tfrm_manut_proc.btnCoNotificado1Click(Sender: TObject);
var
vGrupo: string[3];
begin
  if Not lAbertura then
    Edita;

  vGrupo := ConsultaLookUp('TPROCESSO', 'NR_PROCESSO', datm_manut_proc.qry_proc_em_NR_PROCESSO.AsString, 'CD_GRUPO');

  with datm_manut_proc do
  begin
    if Sender is TSpeedButton then
    begin
      if Not PoeEmEdicao(qry_proc_em_) then
        Exit;

      if (Sender as TSpeedButton).Enabled then
      begin
        //Importador
        if cmbTpNotificado1.KeyValue = 0 then
          qry_proc_em_CD_NOTIFY1_PROC.AsString := ConsultaOnLineExSQL(
            'SELECT CD_EMPRESA, NM_EMPRESA, END_CIDADE, END_EMPRESA, END_NUMERO FROM TEMPRESA_EST (NOLOCK) WHERE IN_IMPORTADOR = ''1'' ' +
            ' AND CD_EMPRESA IN (SELECT CD_EMPRESA FROM TEMPRESA_EST_GRUPO (NOLOCK) WHERE CD_GRUPO = "'+ vGrupo +'") ',
            'Cadastro de Importadores',['CD_EMPRESA', 'NM_EMPRESA', 'END_CIDADE','END_EMPRESA', 'END_NUMERO' ],['Código','Importador','Cidade','Endereço','Numero'],'CD_EMPRESA',nil,qry_proc_em_CD_NOTIFY1_PROC.AsString);

         //Agente
        if cmbTpNotificado1.KeyValue = 1 then
          qry_proc_em_CD_NOTIFY1_PROC.AsString := ConsultaOnLineExSQL(
            'SELECT CD_EMPRESA, NM_EMPRESA, AP_EMPRESA FROM TEMPRESA_EST (NOLOCK) WHERE IN_AGENTE = ''1'' AND IN_ATIVO = ''1'' ',
            'Agente',['CD_EMPRESA', 'NM_EMPRESA', 'AP_EMPRESA'],['Código', 'Nome', 'Apelido'], 'CD_EMPRESA');
        //Banco
        if cmbTpNotificado1.KeyValue = 3 then
          qry_proc_em_CD_NOTIFY1_PROC.AsString := ConsultaOnLineExSQL(
            'SELECT CD_EMPRESA, NM_EMPRESA, AP_EMPRESA FROM TEMPRESA_EST (NOLOCK) WHERE IN_BANCO = ''1'' AND IN_ATIVO = ''1'' ',
            'Banco',['CD_EMPRESA','NM_EMPRESA','AP_EMPRESA'],['Código','Nome','Apelido'],'CD_EMPRESA');
        //Transportadora
        if cmbTpNotificado1.KeyValue = 2 then
          qry_proc_em_CD_NOTIFY1_PROC.AsString := ConsultaOnLineEx('TTRANSPORTADOR_ITL','Transportador',['CODIGO', 'DESCRICAO'],['Código','Nome'],'CODIGO');
        //Despachante
        if cmbTpNotificado1.KeyValue = 4 then
          qry_proc_em_CD_NOTIFY1_PROC.AsString := ConsultaOnLineEx('TDESPACHANTE','Despachante',['CD_DESPACHANTE','NM_DESPACHANTE'],['Código','Nome'],'CD_DESPACHANTE');
        dbeCdNotificado1Exit(nil);
      end;
    end
    else
    begin
      //Importador
      if StrToIntDef(qry_proc_em_TP_NOTIFY1_PROC.AsString, 5) = 0 then
        edtNmNotificado1.Text := ConsultaLookUPSQL(
        ' SELECT NM_EMPRESA FROM TEMPRESA_EST (NOLOCK) WHERE IN_IMPORTADOR = 1 AND CD_EMPRESA = '''+ dbeCdNotificado1.Text +''' ' +
        ' AND CD_EMPRESA IN (SELECT CD_EMPRESA FROM TEMPRESA_EST_GRUPO (NOLOCK) WHERE CD_GRUPO = "'+ vGrupo +'") ','NM_EMPRESA');


      //Agente
      if StrToIntDef(qry_proc_em_TP_NOTIFY1_PROC.AsString, 5) = 1 then
        edtNmNotificado1.Text := ConsultaLookUPSQL(
          'SELECT NM_EMPRESA FROM TEMPRESA_EST (NOLOCK) '+
          'WHERE CD_EMPRESA = ''' + dbeCdNotificado1.Text +''' '+
          '  AND IN_AGENTE = ''1'' AND IN_ATIVO = ''1'' ','NM_EMPRESA');

      //Banco
      if StrToIntDef(qry_proc_em_TP_NOTIFY1_PROC.AsString, 5) = 3 then
        edtNmNotificado1.Text := ConsultaLookUPSQL(
          'SELECT NM_EMPRESA FROM TEMPRESA_EST (NOLOCK) ' +
          'WHERE CD_EMPRESA = ''' + dbeCdNotificado1.Text +''' '+
          '  AND IN_BANCO = ''1'' AND IN_ATIVO = ''1'' ','NM_EMPRESA');
      //Transportadora
      if StrToIntDef(qry_proc_em_TP_NOTIFY1_PROC.AsString, 5) = 2 then
        edtNmNotificado1.Text := ConsultaLookUP('TTRANSPORTADOR_ITL','CODIGO',dbeCdNotificado1.Text, 'DESCRICAO');
      //Despachante
      if StrToIntDef(qry_proc_em_TP_NOTIFY1_PROC.AsString, 5) = 4 then
        edtNmNotificado1.Text := ConsultaLookUP('TDESPACHANTE','CD_DESPACHANTE',dbeCdNotificado1.Text, 'NM_DESPACHANTE');
    end;
  end;
end;

procedure Tfrm_manut_proc.btnCoNotificado2Click(Sender: TObject);
var
vGrupo: string[3];
begin
  if Not lAbertura then Edita;
  vGrupo := ConsultaLookUp('TPROCESSO', 'NR_PROCESSO', datm_manut_proc.qry_proc_em_NR_PROCESSO.AsString, 'CD_GRUPO');
  with datm_manut_proc do begin
    if Sender is TSpeedButton then begin
      if Not PoeEmEdicao(qry_proc_em_) then Exit;
      if (Sender as TSpeedButton).Enabled then begin
        //Importador
        if cmbTpNotificado2.KeyValue = 0 then
          qry_proc_em_CD_NOTIFY2_PROC.AsString := ConsultaOnLineExSQL(
            'SELECT CD_EMPRESA, NM_EMPRESA, END_CIDADE, END_EMPRESA, END_NUMERO FROM TEMPRESA_EST (NOLOCK) WHERE IN_IMPORTADOR = ''1'' ' +
            ' AND CD_EMPRESA IN (SELECT CD_EMPRESA FROM TEMPRESA_EST_GRUPO (NOLOCK) WHERE CD_GRUPO = "'+ vGrupo +'") ',
            'Cadastro de Importadores',['CD_EMPRESA', 'NM_EMPRESA', 'END_CIDADE','END_EMPRESA', 'END_NUMERO' ],['Código','Importador','Cidade','Endereço','Numero'],'CD_EMPRESA',nil,qry_proc_em_CD_NOTIFY2_PROC.AsString);



        //Agente
        if cmbTpNotificado2.KeyValue = 1 then
          qry_proc_em_CD_NOTIFY2_PROC.AsString := ConsultaOnLineExSQL(
            'SELECT CD_EMPRESA, NM_EMPRESA, AP_EMPRESA FROM TEMPRESA_EST (NOLOCK) WHERE IN_AGENTE = ''1'' AND IN_ATIVO = ''1'' ',
            'Agente',['CD_EMPRESA', 'NM_EMPRESA', 'AP_EMPRESA'],['Código', 'Nome', 'Apelido'], 'CD_EMPRESA');
        //Banco
        if cmbTpNotificado2.KeyValue = 3 then
          qry_proc_em_CD_NOTIFY2_PROC.AsString := ConsultaOnLineExSQL(
            'SELECT CD_EMPRESA, NM_EMPRESA, AP_EMPRESA FROM TEMPRESA_EST (NOLOCK) WHERE IN_BANCO = ''1'' AND IN_ATIVO = ''1'' ',
            'Banco',['CD_EMPRESA','NM_EMPRESA','AP_EMPRESA'],['Código','Nome','Apelido'],'CD_EMPRESA');
        //Transportadora
        if cmbTpNotificado2.KeyValue = 2 then
          qry_proc_em_CD_NOTIFY2_PROC.AsString := ConsultaOnLineEx('TTRANSPORTADOR_ITL','Transportador',['CODIGO', 'DESCRICAO'],['Código','Nome'],'CODIGO');
        //Despachante
        if cmbTpNotificado2.KeyValue = 4 then
          qry_proc_em_CD_NOTIFY2_PROC.AsString := ConsultaOnLineEx('TDESPACHANTE','Despachante',['CD_DESPACHANTE','NM_DESPACHANTE'],['Código','Nome'],'CD_DESPACHANTE');
      end;
      //dbedt_cd_notificado2Exit(dbedt_cd_notificado2);
    end
    else begin
      //Importador
      if StrToIntDef(qry_proc_em_TP_NOTIFY2_PROC.AsString, 5) = 0 then
        edtNmNotificado2.Text := ConsultaLookUPSQL(
        ' SELECT NM_EMPRESA FROM TEMPRESA_EST (NOLOCK) WHERE IN_IMPORTADOR = 1 AND CD_EMPRESA = '''+ dbeCdNotificado2.Text +''' ' +
        ' AND CD_EMPRESA IN (SELECT CD_EMPRESA FROM TEMPRESA_EST_GRUPO (NOLOCK) WHERE CD_GRUPO = "'+ vGrupo +'") ','NM_EMPRESA');


      //Agente
      if StrToIntDef(qry_proc_em_TP_NOTIFY2_PROC.AsString, 5) = 1 then
        edtNmNotificado2.Text := ConsultaLookUPSQL(
          'SELECT NM_EMPRESA FROM TEMPRESA_EST (NOLOCK) '+
          'WHERE CD_EMPRESA = ''' + dbeCdNotificado2.Text +''' '+
          '  AND IN_AGENTE = ''1'' AND IN_ATIVO = ''1'' ','NM_EMPRESA');
      //Banco
      if StrToIntDef(qry_proc_em_TP_NOTIFY2_PROC.AsString, 5) = 3 then
        edtNmNotificado2.Text := ConsultaLookUPSQL(
          'SELECT NM_EMPRESA FROM TEMPRESA_EST (NOLOCK) ' +
          'WHERE CD_EMPRESA = ''' + dbeCdNotificado2.Text +''' '+
          '  AND IN_BANCO = ''1'' AND IN_ATIVO = ''1'' ','NM_EMPRESA');
      //Transportadora
      if StrToIntDef(qry_proc_em_TP_NOTIFY2_PROC.AsString, 5) = 2 then
        edtNmNotificado2.Text := ConsultaLookUP('TTRANSPORTADOR_ITL','CODIGO',dbeCdNotificado2.Text, 'DESCRICAO');
      //Despachante
      if StrToIntDef(qry_proc_em_TP_NOTIFY2_PROC.AsString, 5) = 4 then
        edtNmNotificado2.Text := ConsultaLookUP('TDESPACHANTE','CD_DESPACHANTE',dbeCdNotificado2.Text, 'NM_DESPACHANTE');
    end;
  end;
end;

procedure Tfrm_manut_proc.dbeCdNotificado2Exit(Sender: TObject);
begin
  If datm_manut_proc.qry_proc_em_.State in [dsEdit,dsInsert] then begin
    ValCodigo( dbeCdNotificado2, dbeCdNotificado2.MaxLength );
    if dbeCdNotificado2.Text <> '' then begin
      if ( edtNmNotificado2.Text = '' ) then begin
        BoxMensagem('Código do Notificado2 inválido!',2);
        pgctrl_manut_proc.ActivePage := ts_Draft;
        dbeCdNotificado2.SetFocus;
        Exit;
      end;
    end;
  end;
end;

procedure Tfrm_manut_proc.Muda_Lookup_Nm( nNum:Integer; nTp : Integer );
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
       dbeCdNotificado1.MaxLength := 5;
     If nTp = 2 then
       dbeCdNotificado1.MaxLength := 4;
     If nTp = 4 then
       dbeCdNotificado1.MaxLength := 3;
   end;

   If nNum = 3 then
   begin
     If (nTp = 0) or (nTp = 1) or (nTp = 3) then
       dbeCdNotificado2.MaxLength := 5;
     If nTp = 2 then
       dbeCdNotificado2.MaxLength := 4;
     If nTp = 4 then
       dbeCdNotificado2.MaxLength := 3;
   end;
end;

procedure Tfrm_manut_proc.ValCodigo( dbedit_Codigo : TDbEdit; nNum : Integer );
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



procedure Tfrm_manut_proc.dbePesoBrutoChange(Sender: TObject);
begin
  if Not lAbertura then Edita;
end;

procedure Tfrm_manut_proc.dbePesoLiquidoChange(Sender: TObject);
begin
  if Not lAbertura then Edita;
end;

procedure Tfrm_manut_proc.dbeCubagemChange(Sender: TObject);
begin
  if Not lAbertura then Edita;
end;

procedure Tfrm_manut_proc.dbeQuantidadeChange(Sender: TObject);
begin
  if Not lAbertura then Edita;
end;


procedure Tfrm_manut_proc.cmbTipoEmbalagemContainerExit(Sender: TObject);
begin
  if Not lAbertura then Edita;
end;

procedure Tfrm_manut_proc.edtDUEChange(Sender: TObject);
begin
  if Not lAbertura then Edita;
end;

procedure Tfrm_manut_proc.edtRUCChange(Sender: TObject);
begin
  if Not lAbertura then Edita;

  btnGerarNrRuc.enabled := (trim(edtRUC.text) = '');
end;

procedure Tfrm_manut_proc.dbedt_VL_TRANSIT_TIME_RExit(Sender: TObject);
begin
  if (datm_manut_proc.qry_processo_CD_GRUPO.AsString = '155') then
  begin
    if datm_manut_proc.qry_proc_em_.State <> dsEdit then
      datm_manut_proc.qry_proc_em_.Edit;

    if Not lAbertura then Edita;
    if (Trim(datm_manut_proc.qry_proc_em_VL_TRANSIT_TIME.AsString) <> '') then
      datm_manut_proc.qry_proc_em_VL_LEAD_TIME.AsInteger :=  datm_manut_proc.qry_proc_em_VL_TRANSIT_TIME.AsInteger + 3
    else
      datm_manut_proc.qry_proc_em_VL_LEAD_TIME.AsString :=  '';
  end;
end;

procedure Tfrm_manut_proc.btn4Click(Sender: TObject);
begin
  try
    frmAtualizaDatasLisProcesso := tfrmAtualizaDatasLisProcesso.Create(self);      
    frmAtualizaDatasLisProcesso.Nr_Processo                := datm_manut_proc.qry_processo_NR_PROCESSO.AsString;
    frmAtualizaDatasLisProcesso.medtDataRegistro.text      := dbedt_dt_reg_li.text;
    frmAtualizaDatasLisProcesso.medtDataProrrogacao.text   := dbedtDataSolicitaProrrogacao.text;
    frmAtualizaDatasLisProcesso.medDtSolicitacao.text      := dbedtdt_solicitacao.text;
    frmAtualizaDatasLisProcesso.medAptoFinDossie.text      := dbedtdt_apto_fin_dossie.text;
    frmAtualizaDatasLisProcesso.medFinDossie.text          := dbedtdt_fin_dossie.text;
    frmAtualizaDatasLisProcesso.medAnexoDossie.text        := dbedtdt_doctos_dossie.text;
    frmAtualizaDatasLisProcesso.medEmissaoGRU.text         := dbedtdt_emissao_gru.text;
    frmAtualizaDatasLisProcesso.medPagtoGRU.text           := dbedtdt_pgmto_gru.text;
//    frmAtualizaDatasLisProcesso.medProtocoloGRU.text       := dbedtdt_protocolo_gru.text;
    frmAtualizaDatasLisProcesso.edtUsuarioEmissor.text     := dbedtcdEmissor.text;
    frmAtualizaDatasLisProcesso.rgTipoLi.ItemIndex         := dbrdgin_pre_embarque.ItemIndex;

    frmAtualizaDatasLisProcesso.ShowModal;
  finally
  begin
    FreeAndNil(frmAtualizaDatasLisProcesso);
    datm_manut_proc.qry_li_.Close;
    datm_manut_proc.qry_li_.ParamByName('NR_PROCESSO').AsString := datm_manut_proc.qry_processo_NR_PROCESSO.AsString;
    datm_manut_proc.qry_li_.Open;
  end;
  end;
end;

procedure Tfrm_manut_proc.btnPreencherOrgaosAnuentesEmLoteClick(Sender: TObject);
begin
  try   
    frmAtualizaDatasOrgaosAnuentesProcesso := tfrmAtualizaDatasOrgaosAnuentesProcesso.Create(nil);
    frmAtualizaDatasOrgaosAnuentesProcesso.Nr_Processo               := datm_manut_proc.qry_processo_NR_PROCESSO.AsString;
    frmAtualizaDatasOrgaosAnuentesProcesso.medtDataEntrada.text      := dbedt_dt_entrada.text;
    frmAtualizaDatasOrgaosAnuentesProcesso.medtDataVencimento.text   := dbedt_dt_vencto.text;
    frmAtualizaDatasOrgaosAnuentesProcesso.medtDataDeferimento.text  := dbedt_dt_defmto.text;
    frmAtualizaDatasOrgaosAnuentesProcesso.lblReferencia.text        := dbedtReferencia_LI.text;
    frmAtualizaDatasOrgaosAnuentesProcesso.showModal;
  finally
  begin
    datm_manut_proc.qry_li_orgao_anuente_.close;
    datm_manut_proc.qry_li_orgao_anuente_.ParamByName('NR_PROCESSO').AsString := datm_manut_proc.qry_li_NR_PROCESSO.AsString;
    datm_manut_proc.qry_li_orgao_anuente_.ParamByName('NR_LI').AsString       := datm_manut_proc.qry_li_NR_LI.AsString;
    datm_manut_proc.qry_li_orgao_anuente_.Open;
  end;
  end;
end;

procedure Tfrm_manut_proc.cmbTpNotificado1KeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if Key = Vk_DELETE then
  begin
    if not ( datm_manut_proc.qry_proc_em_.State in [dsEdit, dsInsert] ) then
    begin
      datm_manut_proc.qry_proc_em_.edit;
    end;
    datm_manut_proc.qry_proc_em_.fieldByName('TP_NOTIFY1_PROC').value := null;
  end;
end;

procedure Tfrm_manut_proc.dblkcbox_consignatarioKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if Key = Vk_DELETE then
  begin
    if not ( datm_manut_proc.qry_proc_em_.State in [dsEdit, dsInsert] ) then
    begin
      datm_manut_proc.qry_proc_em_.edit;
    end;
    datm_manut_proc.qry_proc_em_.fieldByName('TP_CONSIGNEE').value := null;
  end;
end;

procedure Tfrm_manut_proc.cmbTpNotificado2KeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if Key = Vk_DELETE then
  begin
    if not ( datm_manut_proc.qry_proc_em_.State in [dsEdit, dsInsert] ) then
    begin
      datm_manut_proc.qry_proc_em_.edit;
    end;    
    datm_manut_proc.qry_proc_em_.fieldByName('TP_NOTIFY2_PROC').value := null;
  end;
end;

procedure Tfrm_manut_proc.btnImprimirSIClick(Sender: TObject);
begin
  try
    frmRelatoriosNestle := TfrmRelatoriosNestle.Create(nil);
    frmRelatoriosNestle.lblNomeRelatorio.Caption := 'Shipping Instructions';
    frmRelatoriosNestle.Caption                  := frmRelatoriosNestle.Caption + 'Shipping Instructions';
    frmRelatoriosNestle.TipoRelatorio            := 8; //Shipping Instructions
    frmRelatoriosNestle.cbProduto.KeyValue       := '01';
    frmRelatoriosNestle.edtProduto.text          := '01';
    frmRelatoriosNestle.cbUnidade.KeyValue       :=  msk_cd_unid_neg.Text;
    frmRelatoriosNestle.edUnidade.text           :=  msk_cd_unid_neg.Text;
    frmRelatoriosNestle.edtNrProcesso.Text       :=  msk_nr_processo.text;
    frmRelatoriosNestle.ShowModal;
  finally
    FreeAndNil(frmRelatoriosNestle);
  end;
end;

procedure Tfrm_manut_proc.DBGrid4DrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
var
 Left: Integer;
 Text : string;
begin
  if (Column.Field.DataType = ftMemo) or
     (Column.Field.DataType = ftFmtMemo) then
  begin
    Text := Column.Field.AsString;

    case Column.Field.Alignment of
      taLeftJustify:
        Left := Rect.Left + 2;
      taRightJustify:
        Left := Rect.Right - TDBGrid(Sender).Canvas.TextWidth(Text) - 3;
    else // center
      Left := Rect.Left + (Rect.Right - Rect.Left) shr 1 - (TDBGrid(Sender).Canvas.TextWidth(Text) shr 1);
    end;
    TDBGrid(Sender).Canvas.TextRect(Rect, Left, Rect.Top + 2, Text);
  end;
end;

procedure Tfrm_manut_proc.DBGrid4MouseMove(Sender: TObject;
  Shift: TShiftState; X, Y: Integer);
var
  Cell: TGridCoord;
  ActRec: Integer;
begin
  Cell := TDbGrid(Sender).MouseCoord(X, Y);

  if dgIndicator in TDbGrid(Sender).Options then
    Dec(Cell.X);
  if dgTitles in TDbGrid(Sender).Options then
    Dec(Cell.Y);

  if TMyGrid(TDbGrid(Sender)).DataLink.Active and
    (Cell.X >= 0) and
    (Cell.Y >= 0) and
    ((TDBGrid(Sender).Columns[Cell.X].Field.DataType = ftMemo) or
     (TDBGrid(Sender).Columns[Cell.X].Field.DataType = ftFmtMemo)) then
  begin
    ActRec := TMyGrid(TDbGrid(Sender)).DataLink.ActiveRecord;
    try
      TMyGrid(TDbGrid(Sender)).DataLink.ActiveRecord := Cell.Y;
      TDBGrid(Sender).Hint := TDBGrid(Sender).Columns[Cell.X].Field.AsString;

     // Application.ActivateHint(Mouse.CursorPos);
      HintLI.doActivateHint(TDbGrid(Sender));
    finally
      TMyGrid(TDbGrid(Sender)).DataLink.ActiveRecord := ActRec;
    end;
  end
  else
  begin
    TDbGrid(Sender).Hint := '';
    HintLI.ReleaseHandle;
  end;
end;

procedure THintLi.doActivateHint(Sender: TObject);
var
   r : TRect;
   wdth_hint, hght_hint : integer;
begin
   if (Sender is TDbGrid) then
   begin
      // Calculo as dimensões necessárias à janela de Hint sendo o limite igual à 1/3 da tela
      r := CalcHintRect((Screen.Width div 3), (Sender as TDbGrid).Hint, nil);
      wdth_hint := r.Right - r.Left;
      hght_hint := r.Bottom - r.Top;
 
      // Reposiciono a janela do Hint para próximo da posição do mouse mantendo o tamanho
      // calculado pela rotina anterior
      r.Left := r.Left + mouse.CursorPos.X + 16;
      r.Top := r.Top + mouse.CursorPos.Y + 16;
      r.Right := r.Left + wdth_hint;
      r.Bottom := r.Top + hght_hint;

      // Executo o procedimento para exibição do Hint na tela
      ActivateHint(r,(Sender as TDbGrid).Hint);
   end;
end;

procedure Tfrm_manut_proc.FormDeactivate(Sender: TObject);
begin
  dbGrid4.Hint := '';
  HintLI.ReleaseHandle;
end;

procedure Tfrm_manut_proc.dbchbIN_DESEMBARACO_SOBRE_AGUAS_MClick(
  Sender: TObject);
begin
  if Not lAbertura then
    Edita;
  AtivaAlertaDesembaracoSobreAguas(dbchbIN_DESEMBARACO_SOBRE_AGUAS_M,shpDemb_M );
end;

procedure Tfrm_manut_proc.dbchbIN_DESEMBARACO_SOBRE_AGUAS_AClick(
  Sender: TObject);
begin
  if Not lAbertura then
    Edita;
  AtivaAlertaDesembaracoSobreAguas(dbchbIN_DESEMBARACO_SOBRE_AGUAS_A,shpDemb_A );
end;

procedure Tfrm_manut_proc.DBCHBIN_DESEMBARACO_SOBRE_AGUAS_RClick(
  Sender: TObject);
begin
  if Not lAbertura then
    Edita;
  AtivaAlertaDesembaracoSobreAguas(dbchbIN_DESEMBARACO_SOBRE_AGUAS_R,shpDemb_R );
end;

procedure Tfrm_manut_proc.dbchbIN_DESEMBARACO_SOBRE_AGUAS_FClick(
  Sender: TObject);
begin
  if Not lAbertura then
    Edita;
  AtivaAlertaDesembaracoSobreAguas(dbchbIN_DESEMBARACO_SOBRE_AGUAS_F,shpDemb_F );
end;

procedure Tfrm_manut_proc.AtivaAlertaDesembaracoSobreAguas(chk : TDbCheckBox; shp : TShape);
begin
  if chk.Checked then
  begin
    shp.Pen.Mode  := pmCopy;
    shp.Pen.Width := 2;
  end
  else
  begin
    shp.Pen.Mode  := pmMerge;
    shp.Pen.Width := 1;
  end;
end;

procedure Tfrm_manut_proc.dbgrd_liDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
begin
 if (Column.FieldName = 'calc_LI_CONSULTADA') then
    if (Column.Field.asString = 'r') then
      (Sender as TDBGrid).Canvas.Font.Color := clRed
    else
      (Sender as TDBGrid).Canvas.Font.Color := clGreen;

   dbgrd_li.DefaultDrawColumnCell(Rect, DataCol, Column, State);
end;

procedure Tfrm_manut_proc.dbedt_nr_fat_impChange(Sender: TObject);
begin
  if not lAbertura then
    if ( datm_manut_proc.qry_Doctos_Inst.State in [ dsInsert, dsEdit ] ) then
       btn_mi(False, True, True, False);
end;

procedure Tfrm_manut_proc.dblcbCD_TIPO_DCTO_INSTRClick(Sender: TObject);
begin
  if not lAbertura then
    if ( datm_manut_proc.qry_Doctos_Inst.State in [ dsInsert, dsEdit ] ) then
       btn_mi(False, True, True, False);
end;

procedure Tfrm_manut_proc.btnGerarNrRucClick(Sender: TObject);
begin
  if trim(edtRUC.text) = '' then
  begin
    if not PoeEmEdicao(datm_manut_proc.qry_processo_) then
      Exit;

    datm_manut_proc.qry_processo_CD_RUC.asString := datm_manut_proc.GeraNumeroRuc(datm_manut_proc.qry_processo_NR_PROCESSO.asString,
                                                                                  datm_manut_proc.qry_processo_CD_GRUPO.asString);
  end;
end;

procedure Tfrm_manut_proc.dbedtCD_EMBARCACAO_BALDEACAOChange(
  Sender: TObject);
begin
if Not lAbertura then Edita;
  if Sender is TSpeedButton then
  begin
    if not PoeEmEdicao(datm_manut_proc.qry_proc_im_) then
    exit;
    if (Sender as TSpeedButton).Enabled Then
      datm_manut_proc.qry_proc_im_CD_EMBARCACAO_BALDEACAO.AsString :=
       ConsultaOnLineExSQL('select CD_EMBARCACAO, NM_EMBARCACAO from TEMBARCACAO (NOLOCK) where IN_ATIVO = 1 ',
                           'Cadastro de Embarcações',
                           ['CD_EMBARCACAO','NM_EMBARCACAO'],
                           ['Código','Embarcação'],
                           'CD_EMBARCACAO', nil, dbedtCD_EMBARCACAO_BALDEACAO.Text);
  end
  else
    edtEmbarcacaoBaldeacao.Text := ConsultaLookUPSQL(' select CD_EMBARCACAO, NM_EMBARCACAO '+
                                                     'from TEMBARCACAO (NOLOCK) where IN_ATIVO = 1 and CD_EMBARCACAO = '''
                                                      + dbedtCD_EMBARCACAO_BALDEACAO.Text + '''',
                                                      'NM_EMBARCACAO');
end;

procedure Tfrm_manut_proc.dbedtCD_EMBARCACAO_BALDEACAOExit(
  Sender: TObject);
begin
  CodExits;
end;

procedure Tfrm_manut_proc.btnEmbarcacaoBaldeacaoClick(Sender: TObject);
begin
if Not lAbertura then Edita;
  if Sender is TSpeedButton then
  begin
    if not PoeEmEdicao(datm_manut_proc.qry_proc_im_) then
    exit;
    if (Sender as TSpeedButton).Enabled Then
      datm_manut_proc.qry_proc_im_CD_EMBARCACAO_BALDEACAO.AsString := ConsultaOnLineExSQL('select CD_EMBARCACAO, NM_EMBARCACAO from TEMBARCACAO (NOLOCK) where IN_ATIVO = 1 ',
                                                                                'Cadastro de Embarcações',
                                                                                ['CD_EMBARCACAO','NM_EMBARCACAO'],
                                                                                ['Código','Embarcação'],
                                                                                'CD_EMBARCACAO', nil, dbedtCD_EMBARCACAO_BALDEACAO.Text);
  end
  else
    edtEmbarcacaoBaldeacao.Text := ConsultaLookUPSQL(' select CD_EMBARCACAO, NM_EMBARCACAO from TEMBARCACAO (NOLOCK) where IN_ATIVO = 1 and CD_EMBARCACAO = ''' + dbedtCD_EMBARCACAO_BALDEACAO.Text + '''', 'NM_EMBARCACAO');
end;

procedure Tfrm_manut_proc.dbchkIN_BALDECAOClick(Sender: TObject);
begin
  if not lAbertura then Edita;

  if dbchkIN_BALDECAO.checked then
    HabilitaBaldecao('1')
  else
    HabilitaBaldecao('0');
end;

procedure Tfrm_manut_proc.HabilitaBaldecao(status_IN_BALDEACAO : String);
begin
  if status_IN_BALDEACAO = '1' then
  begin
    pnlEmbarcacaoBaldeacao.enabled     := true;
    dbedtCD_EMBARCACAO_BALDEACAO.color := clWindow ;
    dbedtNR_VIAGEM_BALDEACAO.color     := clWindow;
  end
  else
  begin
    pnlEmbarcacaoBaldeacao.enabled     := false;
    dbedtCD_EMBARCACAO_BALDEACAO.color := clMenu;
    dbedtNR_VIAGEM_BALDEACAO.color     := clMenu;
  end ;
end;

procedure Tfrm_manut_proc.btnViagemBaldeacaoClick(Sender: TObject);
 var vCdUnidNeg : string;
begin
  if msk_cd_unid_neg.Text = '07' then
    vCdUnidNeg := ' ''01'',''07'' '
  else
    vCdUnidNeg := ''''+msk_cd_unid_neg.Text+'''';


  if Not lAbertura then
    Edita;

  with datm_manut_proc do
  begin
    if Trim( dbedtCD_EMBARCACAO_BALDEACAO.Text ) = '' then
    begin
      BoxMensagem( 'Informe uma Embarcação', 3 );
      dbedtCD_EMBARCACAO_BALDEACAO.SetFocus;
      Exit;
    end;

    if not PoeEmEdicao(datm_manut_proc.qry_proc_im_) then
    exit;


    if Sender is TSpeedButton then
    begin
      qry_proc_im_NR_VIAGEM_BALDEACAO.AsString :=
               ConsultaOnLineExSQL( 'SELECT V.NR_VIAGEM, V.DT_ESPERADA, V.DT_ENT, E.DESCRICAO, A.NM_ARMAZEM, A.NM_SIGLA, V.NR_MANIFESTO, A.CD_RECINTO ' +
                                    '  FROM TVIAGEM V (NOLOCK), TARMAZEM A (NOLOCK), TLOCAL_EMBARQUE E (NOLOCK) ' +
                                    ' WHERE V.CD_UNID_NEG in (' + vCdUnidNeg + ') AND ' +
                                    '       V.CD_PRODUTO            = ''' + msk_cd_produto.Text     + ''' AND ' +
                                    '       V.CD_EMBARCACAO         = ''' + dbedtCD_EMBARCACAO_BALDEACAO.Text + ''' AND ' +
                                    '       V.CD_ARMAZEM_ATRACACAO *= A.CD_ARMAZEM AND ' +
                                    '       V.CD_LOCAL              = E.CODIGO ',
                                    'Viagens',
                                    ['NR_VIAGEM', 'DT_ESPERADA', 'DT_ENT', 'DESCRICAO.','NM_ARMAZEM','NM_SIGLA','NR_MANIFESTO','CD_RECINTO'],
                                    ['Viagem', 'Dt. Esperada', 'Dt. Entrada', 'Local Desemb.','Arm. Atracação','Sigla Arm.','Nº Manifesto', 'Recinto'],
                                    'NR_VIAGEM', frm_main.mi_gp_ga_cad_viagem, dbedtNR_VIAGEM_BALDEACAO.Text);
    end;


    datm_manut_proc.qry_proc_im_CD_LOCAL_DESEMBARQUE.AsString :=
                   ConsultaLookUPSQL( 'SELECT CD_LOCAL FROM TVIAGEM V (NOLOCK) '              +
                                      ' WHERE V.CD_UNID_NEG in (' + vCdUnidNeg + ') AND '     +
                                      '       V.CD_PRODUTO    = ''' + msk_cd_produto.Text     + ''' AND ' +
                                      '       V.CD_EMBARCACAO = ''' + dbedtCD_EMBARCACAO_BALDEACAO.Text + ''' AND ' +
                                      '       V.NR_VIAGEM     = ''' + dbedtNR_VIAGEM_BALDEACAO.Text + '''',
                                      'CD_LOCAL');


    datm_manut_proc.qry_proc_im_NR_MANIFESTO.AsString :=
                   ConsultaLookUPSQL('SELECT NR_MANIFESTO FROM TVIAGEM V (NOLOCK) ' +
                                     ' WHERE V.CD_UNID_NEG in (' + vCdUnidNeg + ') AND '     +
                                     '       V.CD_PRODUTO    = ''' + msk_cd_produto.Text     + ''' AND ' +
                                     '       V.CD_EMBARCACAO = ''' + dbedtCD_EMBARCACAO_BALDEACAO.Text + ''' AND ' +
                                     '       V.NR_VIAGEM     = ''' + dbedtNR_VIAGEM_BALDEACAO.Text + '''',
                                     'NR_MANIFESTO');
  end;

  {with TQuery.Create(application) do
  begin
    Databasename := 'DBBROKER';
    SQL.Clear;
    SQL.Add('Exec sp_atz_followup ''' + datm_manut_proc.qry_proc_im_NR_PROCESSO.AsString + '''');
    ExecSQL;
    Free;
  end; }
end;


procedure Tfrm_manut_proc.dblPostoAnvisaKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if Key = VK_CONTROL then
  begin
    if not ( datm_manut_proc.qry_li_.State in [ dsInsert, dsEdit ] ) then
      datm_manut_proc.qry_li_.edit;

      datm_manut_proc.qry_li_CD_POSTO_ANVISA.value := 0;
      alterarli(sender);
  end;
end;

procedure Tfrm_manut_proc.dbmmTX_EMAIL_PROCESSOChange(Sender: TObject);
  var
    emails : string;
    ListaEmails : TStrings;
    i : integer;
begin
  edtNovoEmail.clear;
  emails := datm_manut_proc.qry_processo_.fieldByName('TX_EMAIL_PROCESSO').asString;

  ListaEmails := TStringList.Create;
  ListaEmails.Clear;
  ListaEmails.Delimiter       := ';';
  ListaEmails.DelimitedText   := emails;

  datm_manut_proc.cdsEmailsProcesso.DisableControls;
  datm_manut_proc.cdsEmailsProcesso.EmptyDataSet;
  for i := 0 to ListaEmails.count - 1 do
  begin
    if trim(ListaEmails[i]) <> '' then
    begin
      datm_manut_proc.cdsEmailsProcesso.append;
      datm_manut_proc.cdsEmailsProcesso.fieldByName('NM_EMAIL').asString := ListaEmails[i];
      datm_manut_proc.cdsEmailsProcesso.post;
    end;
  end;
  datm_manut_proc.cdsEmailsProcesso.first;
  datm_manut_proc.cdsEmailsProcesso.EnableControls;
end;

procedure Tfrm_manut_proc.btnAddClick(Sender: TObject);
  var LEmailsInserir : TStrings; i : integer;
begin
  if trim(edtNovoEmail.text) <> '' then
  begin
    LEmailsInserir := TStringList.Create;
    LEmailsInserir.Clear;
    LEmailsInserir.Delimiter       := ';';
    LEmailsInserir.DelimitedText   := edtNovoEmail.text;

    datm_manut_proc.cdsEmailsProcesso.DisableControls;
    for i := 0 to LEmailsInserir.count - 1 do
    begin
      if Trim(LEmailsInserir[i]) <> '' then
      begin
        if not VerificaEmailJaExiste(LEmailsInserir[i]) then
        begin
          datm_manut_proc.cdsEmailsProcesso.append;
          datm_manut_proc.cdsEmailsProcesso.fieldByName('NM_EMAIL').asString := LEmailsInserir[i];
          datm_manut_proc.cdsEmailsProcesso.post;
        end;
      end;
    end;
    datm_manut_proc.cdsEmailsProcesso.EnableControls;

    PreencheEmailsProcesso;
  end;
end;

procedure Tfrm_manut_proc.PreencheEmailsProcesso;
var emails :String;
begin
  emails := '';
  datm_manut_proc.cdsEmailsProcesso.DisableControls;
  datm_manut_proc.cdsEmailsProcesso.first;
  while not datm_manut_proc.cdsEmailsProcesso.eof do
  begin
    emails := emails + StringReplace(datm_manut_proc.cdsEmailsProcesso.fieldByName('NM_EMAIL').asString, ';', '', [rfReplaceAll]) + ';';

    datm_manut_proc.cdsEmailsProcesso.next;
  end;
  datm_manut_proc.cdsEmailsProcesso.EnableControls;

  if not ( datm_manut_proc.qry_processo_.State in [ dsInsert, dsEdit ] ) then
  begin
    datm_manut_proc.qry_processo_.edit;
    btn_mi( False, True, True, False );
  end;
  datm_manut_proc.qry_processo_.fieldByName('TX_EMAIL_PROCESSO').asString := emails;
end;

function Tfrm_manut_proc.VerificaEmailJaExiste(Email : String) : Boolean;
begin
  Result := false;
  datm_manut_proc.cdsEmailsProcesso.first;
  while not datm_manut_proc.cdsEmailsProcesso.eof do
  begin
    if AnsiCompareText(Email, datm_manut_proc.cdsEmailsProcesso.fieldByName('NM_EMAIL').asString) = 0 then
    begin
      Result := true;
      break;
    end;
    datm_manut_proc.cdsEmailsProcesso.next;
  end;
end;

procedure Tfrm_manut_proc.btnRemoveClick(Sender: TObject);
begin
  if not datm_manut_proc.cdsEmailsProcesso.isEmpty then
  begin
    datm_manut_proc.cdsEmailsProcesso.delete;
    PreencheEmailsProcesso;
  end;
end;


function Tfrm_manut_proc.ValidaNumeroRUC(sRUC, nr_processo : String) : String;
begin
  if trim(sRUC) <> '' then
  begin
    with TQuery.Create(Application) do
    begin
      DatabaseName := 'DBBroker';
      SQL.Clear;
      SQL.text :=  ' SELECT CD_RUC, NR_PROCESSO             '+ slinebreak +
                   '   FROM TPROCESSO (NOLOCK)              '+ slinebreak +
                   '  WHERE CD_PRODUTO  = ''02''            '+ slinebreak +
                   '    AND DT_ABERTURA >= ''2018/01/01''   '+ slinebreak +
                   '    AND NR_PROCESSO <> :NR_PROCESSO     '+ slinebreak +
                   '    AND ISNULL(CD_RUC, '''') = :CD_RUC  '+ slinebreak ;
      paramByName('NR_PROCESSO').value := nr_processo;
      paramByName('CD_RUC').value      := sRUC;
      Open;

      if isEmpty then
        Result := ''
      else
        Result := fieldByName('NR_PROCESSO').asstring;

      Free;
    end;
  end;
end;

procedure Tfrm_manut_proc.dbedtNR_CNTR_LEASINGExit(Sender: TObject);
begin
  if not ( datm_manut_proc.qry_proc_cntr_.State in [dsInsert, dsEdit] ) then exit;

  if length(alltrim(dbedtNR_CNTR_LEASING.Text))>1 then
     if not( ValidaContainer(trim(dbedtNR_CNTR_LEASING.Text))) then
     begin
       showmessage('Digito do Container Inválido');
       dbedtNR_CNTR_LEASING.SetFocus;
       abort;
     end;
end;

procedure Tfrm_manut_proc.btn_co_incoterm_aClick(Sender: TObject);
begin
  if btn_co_incoterm_a.Enabled and PoeEmEdicao(datm_manut_proc.qry_proc_em_) then
    datm_manut_proc.qry_proc_em_CD_INCOTERM.AsString := ConsultaOnLineEx('TINCOTERMS_VENDA',
       'Incoterms', ['CODIGO', 'DESCRICAO'], ['Código', 'Incoterm'], 'CODIGO');
end;

procedure Tfrm_manut_proc.btn_co_incoterm_rClick(Sender: TObject);
begin
  if btn_co_incoterm_r.Enabled and PoeEmEdicao(datm_manut_proc.qry_proc_em_) then
    datm_manut_proc.qry_proc_em_CD_INCOTERM.AsString := ConsultaOnLineEx('TINCOTERMS_VENDA',
       'Incoterms', ['CODIGO', 'DESCRICAO'], ['Código', 'Incoterm'], 'CODIGO');
end;

procedure Tfrm_manut_proc.btn_co_incoterm_fClick(Sender: TObject);
begin
  if btn_co_incoterm_f.Enabled and PoeEmEdicao(datm_manut_proc.qry_proc_em_) then
    datm_manut_proc.qry_proc_em_CD_INCOTERM.AsString := ConsultaOnLineEx('TINCOTERMS_VENDA',
       'Incoterms', ['CODIGO', 'DESCRICAO'], ['Código', 'Incoterm'], 'CODIGO');
end;

procedure Tfrm_manut_proc.btn_co_local_transb_em2Click(Sender: TObject);
begin
  if Not lAbertura then
    Edita;

  if Sender is TSpeedButton then
  begin
    if not PoeEmEdicao(datm_manut_proc.qry_proc_em_) then
      exit;

    If (Sender as TSpeedButton).Enabled Then
      datm_manut_proc.qry_proc_em_CD_LOCAL_TRANSBORDO2.AsString :=
      ConsultaOnLineEx('TLOCAL_EMBARQUE','Local Desembarque',['CODIGO','DESCRICAO'],['Código','Nome'],'CODIGO',frm_main.mi_cad_local_emb, 1, dbedt_cd_local_transb_em.text);
  end
  else
    dbedt_nm_local_transb_em2.Text := ConsultaLookUP('TLOCAL_EMBARQUE','CODIGO',dbedtCD_LOCAL_TRANSBORDO2.Text,'DESCRICAO');

end;

procedure Tfrm_manut_proc.btn_co_local_transb_em3Click(Sender: TObject);
begin
  if Not lAbertura then
    Edita;

  if Sender is TSpeedButton then
  begin
    if not PoeEmEdicao(datm_manut_proc.qry_proc_em_) then
      exit;

    If (Sender as TSpeedButton).Enabled Then
      datm_manut_proc.qry_proc_em_CD_LOCAL_TRANSBORDO3.AsString :=
      ConsultaOnLineEx('TLOCAL_EMBARQUE','Local Desembarque',['CODIGO','DESCRICAO'],['Código','Nome'],'CODIGO',frm_main.mi_cad_local_emb, 1, dbedt_cd_local_transb_em.text);
  end
  else
    dbedt_nm_local_transb_em3.Text := ConsultaLookUP('TLOCAL_EMBARQUE','CODIGO',dbedtCD_LOCAL_TRANSBORDO3.Text,'DESCRICAO');
end;

procedure Tfrm_manut_proc.btnImportarArquivoXMLLIClick(Sender: TObject);
begin
  try
    frmLi_Importa_XML := TfrmLi_Importa_XML.Create(self);
    frmLi_Importa_XML.Nr_Processo := datm_manut_proc.qry_processo_NR_PROCESSO.AsString;
    frmLi_Importa_XML.ShowModal;
  finally
  begin
    FreeAndNil(frmLi_Importa_XML);
    datm_manut_proc.qry_li_.Close;
    datm_manut_proc.qry_li_.ParamByName('NR_PROCESSO').AsString := datm_manut_proc.qry_processo_NR_PROCESSO.AsString;
    datm_manut_proc.qry_li_.Open;
  end;
  end;
end;

procedure Tfrm_manut_proc.btnCdOperadorTanqueMClick(Sender: TObject);
begin
  if Not lAbertura then Edita;
  if Sender is TSpeedButton then
  begin
    if not PoeEmEdicao(datm_manut_proc.qry_proc_im_) then exit;
    If (Sender as TSpeedButton).Enabled Then
      datm_manut_proc.qry_proc_im_CD_OPERADOR_TANQUE.AsString :=
      ConsultaOnLineEx('TTRANSPORTADOR_ITL','Transportador',['CODIGO','DESCRICAO'],['Código','Descrição'],'CODIGO',frm_main.mi_cad_transp_itl, 1 ,dbedtCD_OPERADOR_TANQUE.Text)
  end else
    edtCD_OPERADOR_TANQUE.Text := ConsultaLookUP('TTRANSPORTADOR_ITL','CODIGO',dbedtCD_OPERADOR_TANQUE.Text,'DESCRICAO');
end;

procedure Tfrm_manut_proc.FocaEmContainer;
begin
  if tbsImportacao.TabVisible  then
    dbedt_nr_cntr.SetFocus
  else
  if tbsExportacao.TabVisible then
    dbedtNrCntrExportacao.setfocus;
end;
procedure Tfrm_manut_proc.btnAbreCanaisClick(Sender: TObject);
begin
  pnlSelecionaCanal.Visible := not pnlSelecionaCanal.Visible;
end;

procedure Tfrm_manut_proc.shpLiCanalVermelhoMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
var
  vTag : String;  
begin
  try
    vTag := IntToStr(TShape(Sender).Tag);
  except
    vTag := IntToStr(TImage(Sender).Tag);
  end;
  pnlSelecionaCanal.Visible := False;

  if not( datm_manut_proc.qry_li_.State in [ dsInsert, dsEdit ] ) then
    datm_manut_proc.qry_li_.edit;

  if ( datm_manut_proc.qry_li_.State in [ dsInsert, dsEdit ] ) then
  begin
    btn_mi(False, True, True, False);
    datm_manut_proc.qry_li_CD_CANAL.asstring := vTag;
  end;

  nbCanais.PageIndex := StrToInt(vTag);
end;

procedure Tfrm_manut_proc.dbedtCD_CANAL_LIChange(Sender: TObject);
begin
  if  datm_manut_proc.qry_li_CD_CANAL.asstring = '' then
    nbCanais.PageIndex := 4
  else
    nbCanais.PageIndex := strtoint(datm_manut_proc.qry_li_CD_CANAL.asstring);
end;

procedure Tfrm_manut_proc.btnEmissorClick(Sender: TObject);
begin
  if Sender is TSpeedButton then
  begin
    AlterarLi(Sender);  
    if not PoeEmEdicao(datm_manut_proc.qry_li_) then
     exit;

    If (Sender as TSpeedButton).Enabled Then
      datm_manut_proc.qry_li_CD_USUARIO_EMISSOR.AsString := ConsultaOnLineExFiltro('TUSUARIO','Usuarios',['CD_USUARIO','NM_USUARIO'],
                                                    ['Código','Nome'],'CD_USUARIO', ' IN_ATIVO = 1 AND CD_CARGO <> ''040'' ',nil)
  end
  else
    edtNmEmissor.Text := ConsultaLookUP('TUSUARIO','CD_USUARIO',dbedtcdEmissor.Text,'NM_USUARIO');
end;

procedure Tfrm_manut_proc.dbcbxMadeiraCondenadaClick(Sender: TObject);
begin
  if Not lAbertura then Edita;
  if dbcbxMadeiraCondenada.Checked then
  begin
    Shape11.Pen.Mode  := pmCopy;
    Shape11.Pen.Width := 2;
  end
  else
  begin
    Shape11.Pen.Mode  := pmMerge;
    Shape11.Pen.Width := 1;
  end;
end;

procedure Tfrm_manut_proc.msk_cd_produtoPropertiesChange(Sender: TObject);
begin
  if Length(msk_cd_produto.text) > 1 then
    btn_co_produtoClick(sender);
end;

procedure Tfrm_manut_proc.msk_cd_unid_negPropertiesChange(Sender: TObject);
begin
  if Length(msk_cd_unid_neg.text) > 1 then
    btn_co_unid_negClick(sender);
end;

procedure Tfrm_manut_proc.msk_cd_unid_negKeyPress(Sender: TObject;
  var Key: Char);
begin
  If not( key in['0'..'9',#08] ) then
    key:=#0;
end;

procedure Tfrm_manut_proc.msk_cd_produtoKeyPress(Sender: TObject;
  var Key: Char);
begin
  If not( key in['0'..'9',#08] ) then
    key:=#0;
end;

procedure Tfrm_manut_proc.btnDueClick(Sender: TObject);
begin
  frm_main.AbrirMiniBroker('ProcessosDue1', str_nr_processo);
end;

procedure Tfrm_manut_proc.btnDraftBlClick(Sender: TObject);
begin
  frm_main.AbrirMiniBroker('DraftBL', str_nr_processo);
end;

procedure Tfrm_manut_proc.DBGrid1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  ControleBtnExcluirNF;
end;

procedure Tfrm_manut_proc.ControleBtnExcluirNF;
begin
  if datm_manut_proc.qryProcessoCntrNf.RecordCount > 0 then
  begin
    if datm_manut_proc.qry_processo_.FieldByName('CD_PRODUTO').AsString = '01' then
      btnExcluirNF.Enabled := True
    else
      btnExcluirNfExp.Enabled := True;
  end
  else
  begin
    if datm_manut_proc.qry_processo_.FieldByName('CD_PRODUTO').AsString = '01' then
      btnExcluirNF.Enabled := False
    else
      btnExcluirNFExp.Enabled := False;
  end;

end;

procedure Tfrm_manut_proc.ControleBtnExcluirRefCntr;
begin
  if datm_manut_proc.qryProcCntrRef.RecordCount > 0 then
    btnExcluirRefCntr.Enabled := True
  else
    btnExcluirRefCntr.Enabled := False;

end;

procedure Tfrm_manut_proc.grdNfExpKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  ControleBtnExcluirNF;
end;

procedure Tfrm_manut_proc.grdNfExpKeyPress(Sender: TObject; var Key: Char);
begin
  ControleBtnExcluirNF;

end;

procedure Tfrm_manut_proc.grdNfExpKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  ControleBtnExcluirNF;

end;

procedure Tfrm_manut_proc.DBGrid1KeyPress(Sender: TObject; var Key: Char);
begin
  ControleBtnExcluirNF;

end;

procedure Tfrm_manut_proc.DBGrid1KeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  ControleBtnExcluirNF;

end;

procedure Tfrm_manut_proc.grdNfExpCellClick(Column: TColumn);
begin
  ControleBtnExcluirNF;

end;

procedure Tfrm_manut_proc.DBGrid1CellClick(Column: TColumn);
begin
  ControleBtnExcluirNF;

end;

procedure Tfrm_manut_proc.Button1Click(Sender: TObject);
var
  vQryProcExpNFItensDue, vQryProcCntrNf: TQuery;
begin
  vQryProcExpNFItensDue := TQuery.Create(Application);
  vQryProcExpNFItensDue.DatabaseName := 'DBBroker';

  try
    vQryProcExpNFItensDue.Close;
    vQryProcExpNFItensDue.SQL.Clear;

    vQryProcExpNFItensDue.SQL.Add('SELECT  A.NR_PROCESSO, B.NR_CNTR, SUM(A.PL_MERCADORIA) AS PL_MERCADORIA, MIN(CD_NCM) AS CD_NCM FROM TPROCESSO_EXP_NF_ITEM A ');
    vQryProcExpNFItensDue.SQL.Add('LEFT JOIN TPROCESSO_CNTR_NF B ON B.NR_PROCESSO = A.NR_PROCESSO AND B.NR_NF = A.NR_NF ');
    vQryProcExpNFItensDue.SQL.Add('WHERE A.NR_PROCESSO = :NR_PROCESSO ');
    vQryProcExpNFItensDue.SQL.Add('GROUP BY A.NR_PROCESSO, B.NR_CNTR');

    vQryProcExpNFItensDue.ParamByName('NR_PROCESSO').AsString := datm_manut_proc.qry_processo_NR_PROCESSO.asString;
    vQryProcExpNFItensDue.Open;

    datm_manut_proc.qry_proc_cntr_.DisableControls;
    datm_manut_proc.qryProcessoCntrNF.First;

    while not vQryProcExpNFItensDue.Eof do
    begin
      datm_manut_proc.qry_proc_cntr_.Locate('NR_PROCESSO; NR_CNTR', VarArrayOf([datm_manut_proc.qry_processo_NR_PROCESSO.asString, vQryProcExpNFItensDue.FieldByName('NR_CNTR').AsString]), [loCaseInsensitive]);
      datm_manut_proc.qry_proc_cntr_.Edit;
      datm_manut_proc.qry_proc_cntr_VL_PESO_LIQUIDO.Value := vQryProcExpNFItensDue.FieldByName('PL_MERCADORIA').AsFloat;
      datm_manut_proc.qry_proc_cntr_CD_NCM.Value := vQryProcExpNFItensDue.FieldByName('CD_NCM').AsString;
      datm_manut_proc.qry_proc_cntr_.Post;

      vQryProcExpNFItensDue.Next;
    end;

    datm_manut_proc.qry_proc_cntr_.EnableControls;

  finally
    vQryProcExpNFItensDue.Free;
  end;

end;

procedure Tfrm_manut_proc.SpeedButton7Click(Sender: TObject);
begin
  edtReferencia.Text := ConsultaOnLineExSQL('SELECT R.CD_REFERENCIA AS COD_REFERENCIA, DT_REFERENCIA, TP_REFERENCIA, NM_REFERENCIA FROM TREF_CLIENTE R ' +
                                       ' LEFT JOIN TTP_REFERENCIA TR ON TR.CD_REFERENCIA = R.TP_REFERENCIA ' +
                                       ' WHERE NR_PROCESSO =   ''' + datm_manut_proc.qry_processo_.FieldByName('NR_PROCESSO').AsString + ''' AND TP_REFERENCIA = ''03'' ',
                                       'Referências (REMESSAS)',
                                       ['NR_REFERENCIA', 'DT_REFERENCIA', 'TP_REFERENCIA'],
                                       ['Referência',    'Data',          'Tipo'], 'COD_REFERENCIA', nil,'');
End;

procedure Tfrm_manut_proc.btnSalvarRefCntrClick(Sender: TObject);
var
  nrReferencia: String;
begin
  // verifica se o número digitado é válido
  if StrToIntDef(ConsultaLookUpSQL('SELECT COUNT(*) C FROM TREF_CLIENTE R (NOLOCK) ' +
                                   ' LEFT JOIN TTP_REFERENCIA TR ON TR.CD_REFERENCIA = R.TP_REFERENCIA ' +
                                   ' WHERE NR_PROCESSO = ' + QuotedStr(datm_manut_proc.qry_processo_.FieldByName('NR_PROCESSO').AsString) +
                                   ' AND TP_REFERENCIA = ''03'' AND R.CD_REFERENCIA = ' + QuotedStr(edtReferencia.Text),'C'),0) = 0 then
  begin
    BoxMensagem('Essa remessa não existe para este processo.',2);
    Exit;
  end
  else
    nrReferencia := edtReferencia.Text;
  // verifica se já existe essa referencia cadastradas para esse container
  if StrToIntDef(ConsultaLookUpSQL('SELECT COUNT(*) C FROM TPROCESSO_CNTR_REFERENCIA R (NOLOCK) ' +
                                   ' LEFT JOIN TTP_REFERENCIA TR ON TR.CD_REFERENCIA = R.TP_REFERENCIA ' +
                                   ' WHERE NR_PROCESSO = ' + QuotedStr(datm_manut_proc.qry_processo_.FieldByName('NR_PROCESSO').AsString) +
                                   ' AND NR_CNTR = ' + QuotedStr(datm_manut_proc.qry_proc_cntr_.FieldByName('NR_CNTR').AsString) +
                                   ' AND TP_REFERENCIA = ''03'' AND R.CD_REFERENCIA = ' + QuotedStr(edtReferencia.Text),'C'),0) = 0 then
  begin
    // grava importação e exportação
    with TQuery.Create(application) do
    begin
      Databasename := 'DBBROKER';
      SQL.Clear;
      SQL.Add('INSERT INTO TPROCESSO_CNTR_REFERENCIA');
      SQL.Add('     VALUES ('''+datm_manut_proc.qry_processo_.FieldByName('NR_PROCESSO').AsString+''','''+datm_manut_proc.qry_proc_cntr_.FieldByName('NR_CNTR').AsString+''','''+nrReferencia+''', ''03'')');
      ExecSQL;
      Free;
    end;
  end else
    BoxMensagem('Essa referencia já foi inserida.',2);
  datm_manut_proc.qryProcCntrRef.Close;
  datm_manut_proc.qryProcCntrRef.Open;
  edtReferencia.Clear;
end;

procedure Tfrm_manut_proc.btnExcluirRefCntrClick(Sender: TObject);
begin
  if BoxMensagem( 'Esta remessa será excluída!' + #13#10 + 'Confirma exclusão?', 1 ) then
  try
    datm_main.db_broker.StartTransaction;
    datm_manut_proc.qryProcCntrRef.Delete;
    datm_main.db_broker.Commit;
  except
    on E: Exception do
    begin
      datm_manut_proc.qryProcCntrRef.Cancel;
      if datm_main.db_broker.InTransaction then datm_main.db_broker.Rollback;
      TrataErro(E);
    end;
  end;

end;

procedure Tfrm_manut_proc.DBGrid5KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  ControleBtnExcluirRefCntr;
end;

procedure Tfrm_manut_proc.DBGrid5KeyPress(Sender: TObject; var Key: Char);
begin
  ControleBtnExcluirRefCntr;
end;

procedure Tfrm_manut_proc.DBGrid5KeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  ControleBtnExcluirRefCntr;
end;

procedure Tfrm_manut_proc.DBGrid5CellClick(Column: TColumn);
begin
  ControleBtnExcluirRefCntr;
end;

procedure Tfrm_manut_proc.edtReferenciaChange(Sender: TObject);
begin
  btnSalvarRefCntr.Enabled := (TEdit(Sender).Text <> '');
end;

procedure Tfrm_manut_proc.btnIntegracaoExcelCntrlExpoClick(Sender: TObject);
begin
  IntegrarPlanilhaContainer;
end;

procedure Tfrm_manut_proc.IntegrarPlanilhaContainer;
var
  vPlanilhaExcel, vSheet: OLEVariant;
  i, c: Integer;
  vContemRegistroNaLinha: Boolean;
  vExisteRegistroNfRef: Boolean;
  vMsgNrContainerInvalido: String;
begin
  vPlanilhaExcel := CreateOleObject('Excel.Application');
  try
    vPlanilhaExcel.Visible := False;
    if not OpenDialogExcel.Execute then
      Exit;

    vPlanilhaExcel.WorkBooks.Add(OpenDialogExcel.FileName);
    vSheet := vPlanilhaExcel.Workbooks[1].WorkSheets[1];

    i := 2;
    vMsgNrContainerInvalido := '';
    if datm_manut_proc.transp_servico <> '07' then //Se precisar validar os números dos Containers.
    begin
      while vSheet.Cells[I, 1].Value <> '' do
      begin
        if not( ValidaContainer(Trim(vSheet.Cells[i,1].value))) then
          vMsgNrContainerInvalido := vMsgNrContainerInvalido + Trim(vSheet.Cells[i,1].value + ', ');
        Inc(i, 1);
      end;
    end;

    if vMsgNrContainerInvalido <> '' then
    begin
      ShowMessage('Containers com o número inválido: ' + vMsgNrContainerInvalido + '.');
      exit;
    end;

    i := 2;
    while vSheet.Cells[I, 1].Value <> '' do
    begin
      btn_incluir.click;

      datm_manut_proc.qry_proc_cntr_NR_CNTR.AsString := Trim(vSheet.Cells[i,1].value);
      datm_manut_proc.qry_proc_cntr_TP_CNTR.AsString := Trim(vSheet.Cells[i,2].value);
      datm_manut_proc.qry_proc_cntr_TARA_CNTR.AsString := Trim(vSheet.Cells[i,3].value);
      datm_manut_proc.qry_proc_cntr_NR_LACRE.AsString := Trim(vSheet.Cells[i,4].value);
      datm_manut_proc.qry_proc_cntr_NR_LACRE_SIF.AsString := Trim(vSheet.Cells[i,5].value);

      btn_salvar.click;

      Inc(i, 1);
    end;
    showMessage('Containers integrados com sucesso!');

  finally
    vPlanilhaExcel.quit;
    vPlanilhaExcel.WorkBooks.Close;
  end;
end;


procedure Tfrm_manut_proc.btnIntegracaoExcelCntrlImpoClick(Sender: TObject);
begin
  IntegrarPlanilhaContainer;
end;

procedure Tfrm_manut_proc.btnAjudaIntegracaoCntrExpoClick(
  Sender: TObject);
begin
  ExecutaFormAjuda;
end;
procedure Tfrm_manut_proc.ExecutaFormAjuda;
begin
  TformAjuda.Execute('A planilha para a integração deve ser preenchida de acordo com a imagem ao lado.' + #13#10 + #13#10 +
                      'O campo "Tipo", deve ser preenchido com o código do tipo do container, conforme a lista abaixo: ' + #13#10 + #13#10 +
                      'Cód. | Descrição ' + #13#10 +
                      '01      PIER ' + #13#10 +
                      '02      CNTR 20"DRY ' + #13#10 +
                      '03      CNTR 40"DRY ' + #13#10 +
                      '04      TANK 20" ' + #13#10 +
                      '05      TANK 40" ' + #13#10 +
                      '06      REFFER ' + #13#10 +
                      '07      20"REEFER ' + #13#10 +
                      '08      40"REEFER ' + #13#10 +
                      '09      20"OPEN TOP ' + #13#10 +
                      '10      40"OPEN TOP ' + #13#10 +
                      '11      40"HC ' + #13#10 +
                      '12      40"HC REEFER ' + #13#10 +
                      '13      FR 40 ' + #13#10 +
                      '14      FR 20 ' + #13#10 +
                      '15      40"OH ' + #13#10 +
                      '16      20"OTC ' + #13#10 +
                      '17      20"OTS ' + #13#10 +
                      '18      FT20" ' + #13#10 +
                      '19      FT40" ' + #13#10 +
                      '20      MF 40 ' + #13#10 +
                      '21      CAMINHÃO SECO ' + #13#10 +
                      '22      CAMINHÃO CLIMATIZADO ' + #13#10 +
                      '23      CAMINHÃO REFRIGERADO ' + #13#10 +
                      '24      CAMINHÃO SIDER ',
                    IncludeTrailingPathDelimiter(ExtractFilePath(Application.ExeName)) + '\Ajuda_IntegracaoContainer.jpg', True)
end;



procedure Tfrm_manut_proc.btnAjudaIntegracaoCntrImpoClick(Sender: TObject);
begin
  ExecutaFormAjuda;
end;

procedure Tfrm_manut_proc.btnAtualizarDadosPOClick(Sender: TObject);
var
  qrySelectPO: TQuery;
  qryInsertExportadorDi: TQuery;
  qryUpdateEvento798: TQuery;
  qryUpdateProcesso: TQuery;
begin
  qrySelectPO := TQuery.Create(Application);
  qrySelectPO.DataBaseName := 'DBBROKER';

  qryUpdateEvento798 := TQuery.Create(Application);
  qryUpdateEvento798.DataBaseName := 'DBBROKER';

  qryInsertExportadorDi := TQuery.Create(Application);
  qryInsertExportadorDi.DataBaseName := 'DBBROKER';

  qryUpdateProcesso := TQuery.Create(Application);
  qryUpdateProcesso.DataBaseName := 'DBBROKER';

  try
    datm_main.db_broker.StartTransaction;
    try
      qrySelectPO.Close;
      qrySelectPO.SQL.Text := ' SELECT ' + #13#10 +
                              '    PO.DT_NECESSIDADE AS [Delivery] ' + #13#10 + //EVENTO 798
                              '   ,PO.CD_EXPORTADOR AS [Exportador] ' + #13#10 +
                              '   ,PO.VL_TOTAL AS [Preco_Total] ' + #13#10 +
                              '   ,PO.PL_PO AS [Peso_Liquido] ' + #13#10 +
                              '   ,PO.PB_PO AS [Peso_Bruto] ' + #13#10 +
                              '   ,PO.VL_M3 AS [Cubagem] ' + #13#10 +
                              '   ,PO.CD_INCOTERM AS [Incoterm] ' + #13#10 +
                              '   ,PO.CD_MOEDA_NEG AS [Moeda] ' + #13#10 +
                              '   ,PO.CD_MOEDA_FRETE AS [MOEDA_FRETE] ' + #13#10 +
                              '   ,PO.CD_LOCAL_DESEMBARQUE AS [LOCAL_ENTREGA] ' + #13#10 +
                              ' FROM BROKER.dbo.TPO PO ' + #13#10 +
                              ' WHERE PO.NR_PROCESSO = :REFERENCIA ';
      qrySelectPO.ParamByName('REFERENCIA').AsString := datm_manut_proc.qry_ref_cliente_CD_REFERENCIA.AsString;
      qrySelectPO.Open;

      if not (qrySelectPO.RecordCount > 0) then
        reject('Nenhum pedido encontrado para a referência selecionada.');

      qryUpdateEvento798.Close;
      qryUpdateEvento798.SQL.Text := 'UPDATE BROKER.dbo.TFOLLOWUP SET DT_REALIZACAO = :Delivery WHERE NR_PROCESSO = :NR_PROCESSO AND CD_EVENTO = ''798''';
      qryUpdateEvento798.ParamByName('Delivery').AsString := qrySelectPO.FieldByName('Delivery').AsString;
      qryUpdateEvento798.ParamByName('NR_PROCESSO').AsString := datm_manut_proc.qry_ref_cliente_NR_PROCESSO.AsString;
      qryUpdateEvento798.ExecSQL;

      if ConsultaLookUP('TEXPORTADOR_DI', 'NR_PROCESSO', datm_manut_proc.qry_ref_cliente_NR_PROCESSO.AsString, 'CD_EXPORTADOR') = '' then
      begin
        qryInsertExportadorDi.Close;
        qryInsertExportadorDi.SQL.Text :='INSERT INTO [dbo].[TEXPORTADOR_DI] ([NR_PROCESSO],[CD_EXPORTADOR]) VALUES (:NR_PROCESSO, :Exportador)';
        qryInsertExportadorDi.ParamByName('NR_PROCESSO').AsString := datm_manut_proc.qry_ref_cliente_NR_PROCESSO.AsString;
        qryInsertExportadorDi.ParamByName('Exportador').AsString := qrySelectPO.FieldByName('Exportador').Value;
        qryInsertExportadorDi.ExecSQL;
      end;

      qryUpdateProcesso.Close;
      qryUpdateProcesso.SQL.Text := ' UPDATE BROKER.dbo.TPROCESSO SET VL_MLE_MNEG = :Preco_Total ' + #13#10 +
                                    '                                 ,VL_PESO_LIQUIDO = :Peso_Liquido ' + #13#10 +
                                    '                                 ,VL_PESO_BRUTO = :Peso_Bruto ' + #13#10 +
                                    '                                 ,VL_M3 = :Cubagem ' + #13#10 +
                                    '                                 ,CD_INCOTERM = :Incoterm ' + #13#10 +
                                    '                                 ,CD_MOEDA_MLE = :Moeda ' + #13#10 +
                                    '                                 ,CD_MOEDA_FRETE = :MOEDA_FRETE ' + #13#10 +
                                    '                                 ,CD_LOCAL_ENTREGA = :LOCAL_ENTREGA ' + #13#10 +
                                    '                                 ,CD_EXPORTADOR = :Exportador ' + #13#10 +
                                    '                                 WHERE NR_PROCESSO = :NR_PROCESSO ';
      qryUpdateProcesso.ParamByName('Preco_total').Value := qrySelectPO.FieldByName('Preco_total').Value;
      qryUpdateProcesso.ParamByName('Peso_Liquido').Value := qrySelectPO.FieldByName('Peso_Liquido').Value;
      qryUpdateProcesso.ParamByName('Peso_Bruto').Value := qrySelectPO.FieldByName('Peso_Bruto').Value;;
      qryUpdateProcesso.ParamByName('Cubagem').Value := qrySelectPO.FieldByName('Cubagem').Value;
      qryUpdateProcesso.ParamByName('Incoterm').Value := qrySelectPO.FieldByName('Incoterm').Value;
      qryUpdateProcesso.ParamByName('Moeda').Value := qrySelectPO.FieldByName('Moeda').Value;
      qryUpdateProcesso.ParamByName('MOEDA_FRETE').Value := qrySelectPO.FieldByName('MOEDA_FRETE').Value;
      qryUpdateProcesso.ParamByName('LOCAL_ENTREGA').Value := qrySelectPO.FieldByName('LOCAL_ENTREGA').Value;
      qryUpdateProcesso.ParamByName('Exportador').Value := qrySelectPO.FieldByName('Exportador').Value;
      qryUpdateProcesso.ParamByName('NR_PROCESSO').Value := datm_manut_proc.qry_ref_cliente_NR_PROCESSO.AsString;
      qryUpdateProcesso.ExecSQL;

      datm_main.db_broker.Commit;
      Information('Processo atualizado com sucesso.');
    except
      on E: Exception do
      begin
        datm_main.db_broker.Rollback;
        Information('Erro: ' + E.Message);
      end;
    end;
  finally
    qrySelectPO.Free;
    qryUpdateEvento798.Free;
    qryInsertExportadorDi.Free;
    qryUpdateProcesso.Free;
  end;
end;

procedure Tfrm_manut_proc.edtContractNumberChange(Sender: TObject);
begin
  if not lAbertura then Edita;
end;

procedure Tfrm_manut_proc.chkInspecaoClick(Sender: TObject);
begin
  if Not lAbertura then
  begin
    if ( datm_manut_proc.qry_li_.State in [ dsInsert, dsEdit ] ) then
      btn_mi(False, True, True, False);

    lblDataInspecao.Visible   := ( datm_manut_proc.qry_li_IN_INSPECAO.AsString = '1' ) or ( chkInspecao.Checked );
    edtDataInspecao.Visible := lblDataInspecao.Visible;
  end;
end;

procedure Tfrm_manut_proc.chkDataColetaAmostraClick(Sender: TObject);
begin
  if Not lAbertura then
  begin
    if ( datm_manut_proc.qry_li_.State in [ dsInsert, dsEdit ] ) then
      btn_mi(False, True, True, False);

    lblDataColetaAmostra.Visible   := ( datm_manut_proc.qry_li_IN_COLETA_AMOSTRA.AsString = '1' ) or ( chkDataColetaAmostra.Checked );
    edtDataColetaAmostra.Visible := lblDataColetaAmostra.Visible;
  end;
end;

procedure Tfrm_manut_proc.btn_co_local_coleta_imClick(Sender: TObject);
begin
  if Not lAbertura then Edita;
  if Sender is TSpeedButton then
  begin
    if not PoeEmEdicao(datm_manut_proc.qry_proc_im_) then
    exit;
    If (Sender as TSpeedButton).Enabled Then
      datm_manut_proc.qry_proc_im_CD_LOCAL_COLETA.AsString := ConsultaOnLineEx('TLOCAL_EMBARQUE','Local Coleta',['CODIGO','DESCRICAO'],['Código','Nome'],'CODIGO',frm_main.mi_cad_local_emb, 1, dbedt_cd_local_emb_im.Text)
  end
  else
    dbedt_nm_local_coleta_im.Text := ConsultaLookUP('TLOCAL_EMBARQUE','CODIGO',dbedt_cd_local_coleta_im.Text,'DESCRICAO');
end;

procedure Tfrm_manut_proc.btn_co_local_coleta_iaClick(Sender: TObject);
begin
  if Not lAbertura then Edita;
  if Sender is TSpeedButton then
  begin
    if not PoeEmEdicao(datm_manut_proc.qry_proc_im_) then
    exit;
    If (Sender as TSpeedButton).Enabled Then
      datm_manut_proc.qry_proc_im_CD_LOCAL_COLETA.AsString := ConsultaOnLineEx('TLOCAL_EMBARQUE','Local Coleta',['CODIGO','DESCRICAO'],['Código','Nome'],'CODIGO',frm_main.mi_cad_local_emb,1 ,dbedt_cd_local_emb_ia.text)
  end
  else
    dbedt_nm_local_coleta_ia.Text   := ConsultaLookUP('TLOCAL_EMBARQUE','CODIGO',dbedt_cd_local_coleta_ia.Text,'DESCRICAO');
end;

procedure Tfrm_manut_proc.btn_co_local_coleta_irClick(Sender: TObject);
begin
  if Not lAbertura then Edita;
  if Sender is TSpeedButton then
  begin
    if not PoeEmEdicao(datm_manut_proc.qry_proc_im_) then
    exit;
    If (Sender as TSpeedButton).Enabled Then
      datm_manut_proc.qry_proc_im_CD_LOCAL_COLETA.AsString := ConsultaOnLineEx('TLOCAL_EMBARQUE','Local Coleta',['CODIGO','DESCRICAO'],['Código','Nome'],'CODIGO',frm_main.mi_cad_local_emb)
  end
  else
  begin
    dbedt_nm_local_coleta_ir.Text   := ConsultaLookUP('TLOCAL_EMBARQUE','CODIGO',dbedt_cd_local_coleta_ir.Text,'DESCRICAO');
  end;
end;

procedure Tfrm_manut_proc.btn_co_local_coleta_ifClick(Sender: TObject);
begin
  if Not lAbertura then Edita;
  if Sender is TSpeedButton then
  begin
    if not PoeEmEdicao(datm_manut_proc.qry_proc_im_) then
    exit;
    If (Sender as TSpeedButton).Enabled Then
      datm_manut_proc.qry_proc_im_CD_LOCAL_COLETA.AsString := ConsultaOnLineEx('TLOCAL_EMBARQUE','Local Coleta',['CODIGO','DESCRICAO'],['Código','Nome'],'CODIGO',frm_main.mi_cad_local_emb)
  end
  else
    dbedt_nm_local_coleta_if.Text   := ConsultaLookUP('TLOCAL_EMBARQUE','CODIGO',dbedt_cd_local_coleta_if.Text,'DESCRICAO');
end;

procedure Tfrm_manut_proc.chkExigenciaClick(Sender: TObject);
begin
  if Not lAbertura then
  begin
    if ( datm_manut_proc.qry_li_.State in [ dsInsert, dsEdit ] ) then
      btn_mi(False, True, True, False);
  end;
end;

procedure Tfrm_manut_proc.btnTransitTimeLoteClick(Sender: TObject);
var
  F: TfrmSelecionaProcTransitTime;
begin
  F := TfrmSelecionaProcTransitTime.Create(Application);
  try
    F.unidade := msk_cd_unid_neg.Text;
    F.produto := msk_cd_produto.Text;
    F.ShowModal;
  finally
    F.Free;
  end;
end;

procedure Tfrm_manut_proc.dbcbxCsiMapaClick(Sender: TObject);
begin
  if Not lAbertura then Edita;
  if dbcbxCsiMapa.Checked then
  begin
    Shape14.Pen.Mode  := pmCopy;
    Shape14.Pen.Width := 2;
  end
  else
  begin
    Shape14.Pen.Mode  := pmMerge;
    Shape14.Pen.Width := 1;
  end;
end;

procedure Tfrm_manut_proc.btnOperadorTanqueExpoClick(Sender: TObject);
begin
  if Not lAbertura then Edita;
  if Sender is TSpeedButton then
  begin
    if not PoeEmEdicao(datm_manut_proc.qry_proc_em_) then exit;
    If (Sender as TSpeedButton).Enabled Then
    begin
      datm_manut_proc.qry_proc_em_CD_OPERADOR_TANQUE.AsString :=  ConsultaOnLineEx('TTRANSPORTADOR_ITL','Transportador',['CODIGO','DESCRICAO'],['Código','Descrição'],'CODIGO',frm_main.mi_cad_transp_itl, 1 ,dbedtCodOperadorTanqueExpo.Text)
    end;
  end else
    edtNmOperadorTanqueExpo.Text := ConsultaLookUP('TTRANSPORTADOR_ITL','CODIGO',dbedtCodOperadorTanqueExpo.Text,'DESCRICAO');
end;

procedure Tfrm_manut_proc.dbcbxCobrancaEcacClick(Sender: TObject);
begin
  if Not lAbertura then Edita;
  if dbcbxCobrancaEcac.Checked then
  begin
    Shape17.Pen.Mode  := pmCopy;
    Shape17.Pen.Width := 2;
  end
  else
  begin
    Shape17.Pen.Mode  := pmMerge;
    Shape17.Pen.Width := 1;
  end;
end;

procedure Tfrm_manut_proc.controleMascaraNrLi;
begin
  if rdgTipoLicenca.ItemIndex = 0 then
//  if datm_manut_proc.qry_li_IN_LPCO.AsInteger = 0 then
  begin
    datm_manut_proc.qry_li_NR_LI.EditMask := '99/9999999-9;0;';
    lbl_nr_li.Caption := 'Nº Li';
  end
  else if datm_manut_proc.qry_li_IN_LPCO.AsInteger = 1 then
  begin
    datm_manut_proc.qry_li_NR_LI.EditMask := '9999999999;0;';
    lbl_nr_li.Caption := 'Nº LPCO (sem i)';
  end;
end;

procedure Tfrm_manut_proc.dbedt_nr_liExit(Sender: TObject);
begin
  if rdgTipoLicenca.ItemIndex = 1 then
//  if datm_manut_proc.qry_li_IN_LPCO.AsInteger = 1 then
    datm_manut_proc.qry_li_NR_LPCO.AsString := 'i' + datm_manut_proc.qry_li_NR_LI.AsString;
end;

procedure Tfrm_manut_proc.rdgTipoLicencaClick(Sender: TObject);
begin
  controleMascaraNrLi;
  
end;

end.

