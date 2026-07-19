(*******************************************************************************
  Sistema    : MyIndaia - Indaiá Logística Internacional
  PROGRAMA   : PGGP001.PAS - MainForm
  DATA       : dd/mm/yyyy
  Manutenção :
*******************************************************************************)

unit PGGP001;

interface

uses
  Windows, Messages, SysUtils, Classes  , Graphics, Controls, Forms  , Dialogs ,
  Menus  , ExtCtrls, db      , dbctrls  , StdCtrls, Buttons, DBTables,
  UCRPE32, Registry, RxGIF   , AutoClose, Funcoes, AppEvnts, jpeg, ConsOnLineEx,
  xmldom, XMLIntf, msxmldom, XMLDoc, ShellAPI, ComCtrls, RichEdit,
  OleCtrls, SHDocVw, MSHTML, DdeMan, Grids, DBGrids, ClipBrd, cxTextEdit,
  cxMaskEdit, cxDropDownEdit, cxCalendar, cxControls, cxContainer, cxEdit,
  cxCheckBox, cxSpinEdit, cxTimeEdit, cxButtonEdit, StrUtils,
  FormsLog, cxGraphics, cxLookAndFeels, cxLookAndFeelPainters, dxSkinsCore,
  dxSkinsDefaultPainters, dxGDIPlusClasses, RLXLSXFilter, RLXLSFilter,
  RLPDFFilter, RLHTMLFilter, RLFilters, RLRichFilter, RLDraftFilter; // Este sempre depois das uses Forms e Classes - Michel - 22/03/2013;

const
  //  este é o código do módulo de Gestão de Processo
  str_proc_zeros          = '              ';
  FData                   = 'dd/mm/yyyy';

var
  nr_versao: String = '09.03.20.1';
  nr_versao_teste: String = '9.05.55 beta v2';

  vCaminhoHelpDesk: string;
  dt_server: TDateTime;
  hr_server: TDateTime;
  // str_cd_usuario: string[4];
  str_senha_usuario: string[16];
  str_ap_usuario: string[15];
  str_nm_usuario: string[50];
  // str_cd_unid_neg: string[2];
  str_nm_unid_neg: string[50];
  // str_cd_produto: string[2];
  // str_nr_processo: string[18];
  str_nr_po: string[18];
  str_nr_cntr: string[20];
  // str_cd_rotina: string[4];
  str_cd_rotina_atalho: string[4];
  // str_cd_modulo: string[2];
  // str_cd_rot: string[4];
  // str_cd_mod: string[2];
  str_cd_tipo_lanc: string[1];
  // str_cd_cargo: string[3];
  str_nm_servidor: string[15];
  str_nm_admin: string[20];
  str_nm_senha: string[10];
  str_cd_coligada: string[2];
  str_cd_receb: string[3];
  str_cd_devol: string[3];
  str_cd_extor: string[3];
  str_cd_sda: string[3];
  str_cd_ir: string[3];
  str_cd_sd_cre: string[3];
  str_cd_sd_deb: string[3];
  str_cd_pg_sd: string[3];
  str_cd_rc_sd: string[3];
  str_cd_ev_reg_di: string[3];
  str_cd_ev_pagto_li: string[3];
  str_cd_ev_desemb: string[3];
  str_cd_ev_ent: string[3];
  str_cd_ev_ent_setpin: string[3];
  str_cd_ev_sai_setpin: string[3];
  str_cd_ev_descarga: string[3];
  str_cd_ev_chegada: string[3];
  str_cd_moeda_corrente: string[3];
  str_cd_ev_abre_proc: string[3];
  str_nm_cidade: string[20];
  str_cd_nomenc_ncm: string[8];
  str_cd_atributo_ncm: string[2];
  nr_seq_ncm_doc_exp: Integer;
  nr_seq_naladi_doc_exp: Integer;
  str_cd_grp_item_arm: string[2];
  str_cd_grp_item_cap: string[2];
  str_cd_grp_item_frete: string[2];
  str_cd_item_nao_fat: string[3];
  str_cd_item_receb_num: string[3];
  str_cd_item_extor_num: string[3];
  str_cd_item_devol_num: string[3];
  str_cd_item_xerox: string[3];
  str_cd_item_exped: string[3];
  str_cd_item_icms: string[3];
  str_cd_item_ii: string[3];
  str_cd_item_ipi: string[3];
  str_cd_item_cpmf: string[3];
  str_cd_item_afrmm: string[3];
  str_cd_item_sda: string[3];
  str_cd_item_siscomex: string[3];
  str_cd_item_comissao: string[3];
  str_cd_item_iss: string[3];
  str_cd_item_ext_receb: string[3];
  str_cd_item_ext_pagto: string[3];
  str_cd_item_pago_cli: string[3];
  str_cd_item_demurrage: string[3];

  lManutProc: Boolean;
  lManutPo: Boolean;
  lControleAcesso: Boolean;
  lControle_Acesso: Boolean;
  in_aviso_po: string[1];
  a_str_indices: array[0..10] of string[60];
  lResposta: Boolean;
  vl_minimo_ted: Double;
  cDir_Rpt: string;
  cDir_Scx: string;
  cDir_Risc: string;
  cDir_Contab: string;
  cDir_Rei: string;
  cDir_cb_aut_imp: string;
  cDir_cb_aut_trans: string;
  ameses: array[1..12] of string[10];
  cd_unid_neg_gestao: string[2];
  cd_prod_gestao: string[2];
  cd_origem_gestao, cd_destino_gestao: string[4];
  nr_processo_gestao: string[18];
  cd_cliente_gestao : string[5];
  nr_po_gestao: string[18];
  nr_processo_po: string[18];
  nr_item_cliente_po: string[4] = ''; // Link para Followup PO - Michel - 15/12/2008 - Ocorrência 06924/08
  nr_parcial_po: Integer = 0;  // Link para Followup PO - Michel - 15/12/2008 - Ocorrência 06924/08

  // variaveis do cargo

  in_abre_proc_exp        : String[1];
  in_forma_rateio         : string[1];
  in_frm_pe               : string[1];
  in_remessa              : string[1];
  in_trade                : string[1];
  in_iata                 : string[1];
  in_integracao_contabil  : String[1];
  vl_custo_corretora      :real;
  vl_custo_mov_bancario   :real;
  vl_perc_minimo          :real;
  dt_contabilizacao       :TDateTime;
  vVeioAbertura           : Boolean;
  vCriarSession           : Boolean;


const
  vXMLTwitter  = 'H:\DDBroker\Twitter\Twitter.xml';
  vHTMLTwitter = 'H:\DDBroker\Twitter\HTMLPage2.htm';

type
  Tfrm_main = class(TForm)
    pnl_toolbar: TPanel;
    crp_main: TCrpe;
    Panel1: TPanel;
    open_print: TPrintDialog;
    Panel2: TPanel;
    pnl_data: TPanel;
    lbl_data: TLabel;
    lbl_data_atual: TLabel;
    pnl_hora: TPanel;
    lbl_hora: TLabel;
    lbl_hora_atual: TLabel;
    pnl_unid_neg: TPanel;
    lbl_unid_neg: TLabel;
    lbl_nm_unid_neg: TLabel;
    pnl_usuario: TPanel;
    lbl_usuario: TLabel;
    lbl_nm_usuario: TLabel;
    Panel3: TPanel;
    btn_aviso: TSpeedButton;
    btn_about: TSpeedButton;
    Panel4: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    pnl_manut_proc: TPanel;
    btn_manut_proc: TSpeedButton;
    pnl_proc_realiza: TPanel;
    btn_proc_realiza: TSpeedButton;
    pnl_di: TPanel;
    pnl_solinum: TPanel;
    pnl_recnum: TPanel;
    pnl_pagto: TPanel;
    pnl_ch_branco: TPanel;
    pnl_sda: TPanel;
    pnl_fin: TPanel;
    pnl_fat_cc: TPanel;
    pnl_fat_sol: TPanel;
    pnl_liq: TPanel;
    pnl_li: TPanel;
    pnl_po: TPanel;
    btn_di: TSpeedButton;
    btn_solinum: TSpeedButton;
    btn_recnum: TSpeedButton;
    btn_pagto: TSpeedButton;
    btn_ch_branco: TSpeedButton;
    btn_sda: TSpeedButton;
    btn_fin: TSpeedButton;
    btn_fat_cc: TSpeedButton;
    btn_fat_sol: TSpeedButton;
    btn_liq: TSpeedButton;
    btn_li: TSpeedButton;
    btn_po: TSpeedButton;
    pnl_pe: TPanel;
    btn_pe: TSpeedButton;
    pnlRelease: TPanel;
    btn_release: TSpeedButton;
    tmrHora: TTimer;
    lblHora: TLabel;
    Shape1: TShape;
    MainMenu: TMainMenu;
    mi_movimentos: TMenuItem;
    Comercial1: TMenuItem;
    mi_manut_cli_av: TMenuItem;
    mi_proc_comerc: TMenuItem;
    mi_proposta: TMenuItem;
    mi_cotacao: TMenuItem;
    mi_agenda_comercial: TMenuItem;
    INstruodeEmbarqueAreo1: TMenuItem;
    mi_instr_comerc_aereo: TMenuItem;
    mi_instr_marit: TMenuItem;
    mi_gp: TMenuItem;
    mi_gb: TMenuItem;
    AberturaComercial1: TMenuItem;
    mi_abertura_processo: TMenuItem;
    mi_liberacao_processo: TMenuItem;
    mi_manutencao_processo: TMenuItem;
    mi_cancelamento_processo: TMenuItem;
    mi_pesquisa_processo: TMenuItem;
    mi_espelho_processo: TMenuItem;
    mi_gp_gb_rel_proc_mod1: TMenuItem;
    mi_ga: TMenuItem;
    mi_aplicabilidade_evento: TMenuItem;
    mi_realizacao_processo: TMenuItem;
    mi_realizacao_evento: TMenuItem;
    mi_gp_ga_cad_viagem: TMenuItem;
    mi_realizacao_veiculo: TMenuItem;
    mi_bloqueio_evento: TMenuItem;
    mi_repasse_dados: TMenuItem;
    mi_inspecao_processo: TMenuItem;
    mi_inspecao_evento: TMenuItem;
    mi_li_gestao_av: TMenuItem;
    mi_relacao_nao_realizacao: TMenuItem;
    mi_relacao_nao_inspecao: TMenuItem;
    mi_relacao_realizados: TMenuItem;
    mi_relatriodecontrolededescarga: TMenuItem;
    mi_relacao_ev_critico: TMenuItem;
    mi_gd: TMenuItem;
    mi_gd_cntr: TMenuItem;
    mi_gd_fat: TMenuItem;
    mi_gp_dem_rel: TMenuItem;
    mi_gp_gd_rel_cont_nao_devol: TMenuItem;
    mi_gp_gd_rel_ger: TMenuItem;
    mi_gp_gd_rel_ger2: TMenuItem;
    mi_gp_gd_rel_est: TMenuItem;
    mi_Account: TMenuItem;
    mi_analise_account: TMenuItem;
    mi_acc_master: TMenuItem;
    mi_emis_fatura: TMenuItem;
    mi_ems_fat_master: TMenuItem;
    mi_emis_remessa: TMenuItem;
    mi_gera_remessa: TMenuItem;
    mi_lib_account: TMenuItem;
    mi_disp_remessa: TMenuItem;
    mi_remissao_fat: TMenuItem;
    mi_fat_compl: TMenuItem;
    mi_entreposto: TMenuItem;
    mi_ent_da: TMenuItem;
    mi_ent_nac: TMenuItem;
    mi_ent_ret_da: TMenuItem;
    mi_ent_ret_nac: TMenuItem;
    mi_ent_rel: TMenuItem;
    mi_ent_rel_sol_des: TMenuItem;
    mi_ent_rel_sol_desu: TMenuItem;
    mi_ent_rel_plan_des: TMenuItem;
    Importao1: TMenuItem;
    mi_agenciamento: TMenuItem;
    mi_aereo: TMenuItem;
    mi_instr_embarq_aereo: TMenuItem;
    mi_calc_profit_aereo: TMenuItem;
    mi_maritimo: TMenuItem;
    mi_instr_embarq_marit: TMenuItem;
    mi_ctrl_embarque: TMenuItem;
    mi_ctrl_demurrage: TMenuItem;
    mi_retificador_imp: TMenuItem;
    mi_menu_PO: TMenuItem;
    mi_gestao_po: TMenuItem;
    mi_PO: TMenuItem;
    mi_po_flp: TMenuItem;
    mi_prepara: TMenuItem;
    mi_estorno: TMenuItem;
    mi_po_consulta: TMenuItem;
    mi_po_consulta_itens: TMenuItem;
    mi_po_consulta_prod: TMenuItem;
    mi_po_relat: TMenuItem;
    mi_imp_po: TMenuItem;
    mi_po_imp_mod2: TMenuItem;
    mi_po_imp_mod3: TMenuItem;
    mi_po_rel_saldo_merc: TMenuItem;
    mi_po_rel_proc: TMenuItem;
    mi_po_rel_flp: TMenuItem;
    mi_po_rel_lead_time: TMenuItem;
    mi_po_rel_emb_prev: TMenuItem;
    mi_po_rel_emb: TMenuItem;
    mi_po_rel_nivel_servico: TMenuItem;
    mi_po_rel_prev_nacion: TMenuItem;
    mi_po_rel_gestao: TMenuItem;
    mi_relacao_ev_critico_po: TMenuItem;
    mi_po_at_basf: TMenuItem;
    mi_po_at_basf_cad: TMenuItem;
    mi_po_at_basf_rel: TMenuItem;
    mi_po_ev_critico: TMenuItem;
    mi_menu_LI: TMenuItem;
    mi_LI: TMenuItem;
    mi_li_trans_LI: TMenuItem;
    mi_integracao_li: TMenuItem;
    mi_imp_li: TMenuItem;
    mi_menu_di: TMenuItem;
    mi_di: TMenuItem;
    mi_previsao: TMenuItem;
    mi_di_trans: TMenuItem;
    mi_di_recupera: TMenuItem;
    mi_di_icms_online: TMenuItem;
    mi_imp_di: TMenuItem;
    mi_imp_itens: TMenuItem;
    mi_di_recalculo: TMenuItem;
    mi_di_retif_di: TMenuItem;
    mi_di_imprime_darf: TMenuItem;
    mi_di_lib_alto_valor: TMenuItem;
    mi_menu_Exp: TMenuItem;
    mi_exp_agenciamento: TMenuItem;
    mi_exp_aerea: TMenuItem;
    mi_ped_inst_aerea: TMenuItem;
    mi_pre_al_marit: TMenuItem;
    mi_rel_iata: TMenuItem;
    mi_exp_marit: TMenuItem;
    mi_exp_pedido_marit: TMenuItem;
    mi_exp_prof_marit: TMenuItem;
    mi_exp_com_marit: TMenuItem;
    mi_retificador_exp: TMenuItem;
    mi_menu_pe: TMenuItem;
    mi_pe: TMenuItem;
    mi_pe_prepara: TMenuItem;
    mi_pe_estorno: TMenuItem;
    mi_pe_consulta: TMenuItem;
    mi_pe_consulta_itens: TMenuItem;
    mi_pe_consulta_prod: TMenuItem;
    mi_imp_pe: TMenuItem;
    mi_exp: TMenuItem;
    mi_exp_saque: TMenuItem;
    mi_exp_bordero: TMenuItem;
    mi_exp_carta_cred: TMenuItem;
    mi_exp_re: TMenuItem;
    mi_exp_prep_re: TMenuItem;
    mi_transmissao_re_bsh: TMenuItem;
    mi_exp_doc: TMenuItem;
    mi_exp_doc_fat_com: TMenuItem;
    mi_fatura_comercial2: TMenuItem;
    mi_exp_doc_cert_orig: TMenuItem;
    mi_exp_doc_packing_list: TMenuItem;
    mi_packing_list2: TMenuItem;
    mi_exp_doc_cert_seguro: TMenuItem;
    mi_exp_doc_instr_emb: TMenuItem;
    mi_exp_doc_saque: TMenuItem;
    mi_exp_doc_bordero: TMenuItem;
    mi_traco2: TMenuItem;
    mi_exp_imp: TMenuItem;
    mi_mov_db: TMenuItem;
    Laudo1: TMenuItem;
    mi_db_susp: TMenuItem;
    mi_db_susp_forecast: TMenuItem;
    mi_db_susp_ac: TMenuItem;
    mi_db_susp_trans_ac: TMenuItem;
    mi_db_susp_baixa_ac: TMenuItem;
    mi_consulta_db: TMenuItem;
    mi_db_isen: TMenuItem;
    mi_db_isen_forecast: TMenuItem;
    mi_db_isen_comp: TMenuItem;
    mi_db_isen_ac: TMenuItem;
    mi_db_isen_ruds: TMenuItem;
    mi_db_rel: TMenuItem;
    mi_db_rel_gerais: TMenuItem;
    mi_rel_integrado: TMenuItem;
    mi_db_rel_ger_ent: TMenuItem;
    mi_db_rel_ger_cons: TMenuItem;
    mi_db_rel_ger_saldo_ufabr: TMenuItem;
    mi_db_rel_ger_eco_realiz: TMenuItem;
    mi_db_rel_ger_susp: TMenuItem;
    mi_db_rel_susp_dcr: TMenuItem;
    mi_db_rel_susp_termo_resp: TMenuItem;
    mi_db_rel_susp_ruds: TMenuItem;
    mi_db_rel_susp_ruds_imp: TMenuItem;
    mi_db_rel_susp_ruds_exp: TMenuItem;
    mi_db_rel_susp_ruds_capa: TMenuItem;
    mi_db_rel_susp_laudo_tec: TMenuItem;
    mi_db_rel_susp_ped_db: TMenuItem;
    mi_db_rel_susp_anexo_ped_db: TMenuItem;
    mi_db_rel_susp_adit: TMenuItem;
    mi_db_rel_susp_anexo_adit: TMenuItem;
    mi_db_rel_susp_saldo_ac: TMenuItem;
    mi_db_rel_susp_saldo_ac_imp: TMenuItem;
    mi_db_rel_susp_saldo_ac_exp: TMenuItem;
    mi_db_rel_susp_saldo_ac_equaliz: TMenuItem;
    mi_db_rel_susp_trib: TMenuItem;
    mi_db_rel_susp_trib_pagos: TMenuItem;
    mi_db_rel_susp_trib_susp: TMenuItem;
    mi_db_rel_susp_trib_ganho_reg: TMenuItem;
    mi_db_rel_susp_prev: TMenuItem;
    mi_db_rel_susp_prev_itens_imp: TMenuItem;
    mi_db_rel_susp_prev_itens_exp_prev_real: TMenuItem;
    mi_db_rel_susp_prev_itens_imp_prev_real: TMenuItem;
    mi_db_rel_isen: TMenuItem;
    mi_db_rel_isen_termo_resp: TMenuItem;
    mi_db_rel_isen_ruds: TMenuItem;
    mi_db_rel_isen_ruds_imp: TMenuItem;
    mi_db_rel_isen_ruds_exp: TMenuItem;
    mi_db_rel_isen_ruds_capa: TMenuItem;
    mi_db_rel_isen_laudo_tec: TMenuItem;
    mi_db_rel_isen_ped_db: TMenuItem;
    mi_db_rel_isen_anexo_ped_db: TMenuItem;
    mi_db_rel_isen_adit: TMenuItem;
    mi_db_rel_isen_anexo_adit: TMenuItem;
    mi_db_rel_isen_saldo_ac: TMenuItem;
    mi_db_rel_isen_saldo_ac_imp: TMenuItem;
    mi_db_rel_isen_saldo_ac_exp: TMenuItem;
    mi_db_rel_isen_trib: TMenuItem;
    mi_db_rel_isen_trib_pagos: TMenuItem;
    mi_db_rel_isen_trib_isen: TMenuItem;
    mi_db_rel_isen_trib_ganho_reg: TMenuItem;
    mi_db_rel_isen_prev: TMenuItem;
    mi_db_rel_isen_prev_itens_imp: TMenuItem;
    mi_db_rel_isen_prev_itens_exp_prev_real: TMenuItem;
    mi_db_rel_isen_prev_itens_imp_prev_real: TMenuItem;
    mi_db_cons: TMenuItem;
    mi_db_cons_susp: TMenuItem;
    mi_db_cons_susp_di_vinc: TMenuItem;
    mi_db_cons_susp_re_vinc: TMenuItem;
    mi_db_cons_isen: TMenuItem;
    mi_db_cons_isen_di_vinc: TMenuItem;
    mi_db_cons_isen_re_vinc: TMenuItem;
    mi_db_flp: TMenuItem;
    mi_db_flp_imp_realiz: TMenuItem;
    mi_db_flp_exp_realiz: TMenuItem;
    MensagensdeErro1: TMenuItem;
    mi_sol_num: TMenuItem;
    mi_solicitacao_numerario: TMenuItem;
    mi_emi_sol_num: TMenuItem;
    mi_notificacao: TMenuItem;
    mi_rec_num: TMenuItem;
    mi_recebimento_ag: TMenuItem;
    mi_rec_num_solicitado: TMenuItem;
    mi_rec_num_dev: TMenuItem;
    mi_li_recebimento: TMenuItem;
    mi_rec_num_rel_nao_rec: TMenuItem;
    mi_rec_num_rel_rec_dev: TMenuItem;
    mi_rec_num_rel_tot: TMenuItem;
    mi_emi_sol_liberacao: TMenuItem;
    mi_pagto: TMenuItem;
    mi_pagto_solic: TMenuItem;
    mi_pagto_montagem: TMenuItem;
    mi_pagto_lib: TMenuItem;
    mi_pagto_lib_ted: TMenuItem;
    mi_pagto_imp_cheque: TMenuItem;
    mi_pagto_gera_ted: TMenuItem;
    mi_pagto_rel_copia_cheque: TMenuItem;
    mi_pagto_rel_sol_nao_emitidas: TMenuItem;
    mi_pagto_rel_pend: TMenuItem;
    mi_pagto_rel_pagto_pend: TMenuItem;
    mi_pagto_rel_razao: TMenuItem;
    mi_pagto_rel_pagto: TMenuItem;
    mi_pagto_pesquisa: TMenuItem;
    ContasaPagar1: TMenuItem;
    mi_lancamentos: TMenuItem;
    mi_AutorizaodePagamentos: TMenuItem;
    mi_adm_imp_cheque: TMenuItem;
    mi_adm_gera_ted: TMenuItem;
    mi_IntegraocomSISPAG: TMenuItem;
    mi_adm_copias_cheque1: TMenuItem;
    mi_Pesquisar: TMenuItem;
    mi_RelaodeContasaPagar: TMenuItem;
    mi_RelaodePagtosLiberados: TMenuItem;
    mi_adm: TMenuItem;
    mi_adm_solic: TMenuItem;
    mi_adm_montagem: TMenuItem;
    mi_adm_lib_ted: TMenuItem;
    EmissodeChequesNotas1: TMenuItem;
    GeraodeTEDs1: TMenuItem;
    mi_adm_copias_cheque: TMenuItem;
    mi_adm_pesquisa: TMenuItem;
    mi_fin: TMenuItem;
    mi_fin_lanc: TMenuItem;
    mi_cheque_avulso: TMenuItem;
    mi_fin_transf_pagto: TMenuItem;
    mi_fin_pesq: TMenuItem;
    mi_li_financeiro: TMenuItem;
    mi_fin_manut_rel_reemb_fin: TMenuItem;
    mi_fin_rel_desemb: TMenuItem;
    mi_fin_rel_ext_cc: TMenuItem;
    mi_fin_rel_tab_juros: TMenuItem;
    mi_fin_rel_dem_clientes: TMenuItem;
    mi_ch_br: TMenuItem;
    mi_entrega_ch_br: TMenuItem;
    mi_li_cheque_br: TMenuItem;
    mi_rel_pend_ch_br: TMenuItem;
    mi_rel_prestados_conta_ch_br: TMenuItem;
    mi_sda: TMenuItem;
    mi_sda_distr: TMenuItem;
    mi_li_sda: TMenuItem;
    mi_sda_emissao: TMenuItem;
    mi_sda_cancel: TMenuItem;
    mi_ext_hon_sda: TMenuItem;
    mi_sda_pesq: TMenuItem;
    mi_fat: TMenuItem;
    mi_fat_lanc: TMenuItem;
    mi_fat_sol: TMenuItem;
    li_faturamento2: TMenuItem;
    mi_fat_relat: TMenuItem;
    mi_fat_rel_rent_proc: TMenuItem;
    mi_fat_rel_saldos: TMenuItem;
    mi_fat_rel_resumo_fat: TMenuItem;
    mi_fat_rel_pago_cli: TMenuItem;
    mi_fat_rel_comissao: TMenuItem;
    mi_fat_rel_comparativo: TMenuItem;
    mi_fat_rel_abfat: TMenuItem;
    mi_fat_rel_proc_fat_prefixo: TMenuItem;
    mi_fat_rel_demo_cc: TMenuItem;
    mi_fat_rel_cc_cli: TMenuItem;
    mi_fat_rel_fat_nf_nota_emit_canc: TMenuItem;
    mi_adiant_pend_fat: TMenuItem;
    mi_fat_rel_nf_rec: TMenuItem;
    mi_fat_rel_ret: TMenuItem;
    mi_fat_rel_val_ret: TMenuItem;
    mi_fat_rel_livro_fiscal: TMenuItem;
    mi_fat_rel_livro_fisc_nf: TMenuItem;
    mi_fat_rel_livro_fisc_capa: TMenuItem;
    mi_rel_armaz_fumiga: TMenuItem;
    mi_fat_rel_rd: TMenuItem;
    mi_li_faturamento1: TMenuItem;
    mi_fat_emi_nf_fat: TMenuItem;
    mi_fat_emi_dem_desp: TMenuItem;
    mi_fat_emi_nota: TMenuItem;
    mi_fat_emi_nf_serv: TMenuItem;
    mi_fat_emi_nf_serv_fat: TMenuItem;
    mi_liq: TMenuItem;
    mi_liquidacao: TMenuItem;
    N1: TMenuItem;
    mi_rel_saldos_pend: TMenuItem;
    mi_rel_liquidacao: TMenuItem;
    mi_liq_rel_tot: TMenuItem;
    mi_li_movimento: TMenuItem;
    mi_saida: TMenuItem;
    mi_rel: TMenuItem;
    mi_rel_est: TMenuItem;
    mi_rel_est_lead_time: TMenuItem;
    mi_rel_es_desvios: TMenuItem;
    mi_rel_es_realizado: TMenuItem;
    mi_rel_es_arealizar: TMenuItem;
    mi_rel_es_periodo: TMenuItem;
    mi_rel_es_saldo_cli: TMenuItem;
    mi_rel_es_desp: TMenuItem;
    mi_rel_es_rec_desp_op: TMenuItem;
    mi_rel_es_rank_rec: TMenuItem;
    mi_rel_es_vencto_cartao: TMenuItem;
    mi_rel_es_gastos_processo: TMenuItem;
    mi_rel_es_gastos_porto: TMenuItem;
    mi_rel_es_gastos_amz: TMenuItem;
    mi_rel_es_vl_cif: TMenuItem;
    mi_rel_es_cli_ativo: TMenuItem;
    mi_rel_es_cli_nao_ativo: TMenuItem;
    mi_rel_es_cli_ativo_nao_ativo: TMenuItem;
    mi_rel_es_cli_nao_ativo_ativo: TMenuItem;
    mi_rel_es_tot_serv_cli: TMenuItem;
    mi_rel_es_tot_serv_cli_an: TMenuItem;
    mi_rel_es_ensaio_rec: TMenuItem;
    mi_rel_cont_emb: TMenuItem;
    mi_rel_com_imp_exp: TMenuItem;
    mi_rel_com_ind_por: TMenuItem;
    mi_rel_est_cntr: TMenuItem;
    mi_rel_est_qt_cntr: TMenuItem;
    mi_rel_est_cntr_vl_cif: TMenuItem;
    mi_rel_est_volumes: TMenuItem;
    mi_rel_est_volumes2: TMenuItem;
    mi_rel_est_desp: TMenuItem;
    mi_rel_est_merc: TMenuItem;
    mi_rel_est_arm_demurrage: TMenuItem;
    mi_rel_est_arm_prefixo: TMenuItem;
    mi_rel_est_qtde_proc_ind: TMenuItem;
    mi_rel_armaz_carga: TMenuItem;
    mi_rel_imp: TMenuItem;
    mi_rel_imp_reg: TMenuItem;
    mi_rel_imp_desemb: TMenuItem;
    mi_rel_imp_imp_sap: TMenuItem;
    mi_rel_imp_proc_pg_des_di: TMenuItem;
    mi_rel_imp_proc_pg_des_li: TMenuItem;
    mi_rel_imp_canal_mes: TMenuItem;
    mi_rel_imp_canal_mes_mod_2: TMenuItem;
    mi_rel_imp_mov_proc: TMenuItem;
    mi_rel_imp_andamento: TMenuItem;
    mi_rel_imp_and_servico: TMenuItem;
    mi_rel_imp_pos_veiculos: TMenuItem;
    mi_rel_imp_desp_nao_desemb_di: TMenuItem;
    mi_rel_imp_followup: TMenuItem;
    mi_rel_imp_followup_navio: TMenuItem;
    mi_rel_imp_flp_plan: TMenuItem;
    mi_rel_imp_map_seg: TMenuItem;
    mi_rel_imp_prev_custo: TMenuItem;
    mi_rel_imp_lead_time: TMenuItem;
    mi_rel_imp_performance: TMenuItem;
    mi_rel_imp_plan_custo: TMenuItem;
    mi_rel_imp_docto_rec: TMenuItem;
    mi_rel_imp_desp_mensais: TMenuItem;
    mi_rel_imp_desp_arm: TMenuItem;
    mi_rel_imp_desp_pagto: TMenuItem;
    mi_rel_imp_minuta_transp: TMenuItem;
    mi_rel_imp_ctrl_demurrage: TMenuItem;
    mi_rel_imp_demurrage: TMenuItem;
    mi_rel_imp_ctrl_cliente_arm: TMenuItem;
    mi_rel_imp_ctrl_requerimento: TMenuItem;
    mi_rel_imp_lead_time2: TMenuItem;
    mi_rel_imp_proc_and: TMenuItem;
    mi_rel_imp_proc_desemb: TMenuItem;
    mi_rel_imp_acomp_proc: TMenuItem;
    mi_rel_imp_fup_dia: TMenuItem;
    mi_rel_imp_fup_proc: TMenuItem;
    mi_rel_exp: TMenuItem;
    mi_rel_exp_emb_averb: TMenuItem;
    mi_rel_exp_proc_pend_averb: TMenuItem;
    mi_rel_exp_proc_averb: TMenuItem;
    mi_rel_exp_pos_veiculos: TMenuItem;
    mi_rel_exp_flp: TMenuItem;
    mi_rel_exp_andamento: TMenuItem;
    mi_rel_exp_contr_averb: TMenuItem;
    mi_exp_dde_vencimento: TMenuItem;
    mi_rel_exp_est_cambial: TMenuItem;
    mi_rel_exp_re: TMenuItem;
    mi_rel_exp_kpi: TMenuItem;
    mi_rel_exp_custos: TMenuItem;
    mi_rel_exp_mapa_anl_ox: TMenuItem;
    mi_rel_exp_flp_ind: TMenuItem;
    FollowUpControledeNavios1: TMenuItem;
    mi_rel_cad: TMenuItem;
    mi_rel_cad_tx_cambio: TMenuItem;
    mi_rel_cad_merc_imp: TMenuItem;
    mi_rel_cad_merc_exp: TMenuItem;
    mi_n1: TMenuItem;
    mi_cadastros: TMenuItem;
    mi_cad_empresas: TMenuItem;
    mi_agentes_carga: TMenuItem;
    mi_agentes: TMenuItem;
    mi_cad_area: TMenuItem;
    mi_cad_emp_nac: TMenuItem;
    mi_cad_emp_est: TMenuItem;
    mi_cad_desp: TMenuItem;
    mi_cad_hab_desp: TMenuItem;
    mi_cad_cli: TMenuItem;
    mi_cad_transp_itl: TMenuItem;
    mi_cad_transp_rod: TMenuItem;
    mi_cad_prop_merc: TMenuItem;
    mi_cad_fin: TMenuItem;
    mi_cad_fin_conta_banc: TMenuItem;
    mi_cad_fin_contas_caixa: TMenuItem;
    mi_cad_fin_conta_custo: TMenuItem;
    mi_cad_fin_conta_gerencial: TMenuItem;
    mi_cad_fin_fav: TMenuItem;
    mi_cad_fin_grupo_item: TMenuItem;
    mi_cad_fin_hist_padrao: TMenuItem;
    mi_cad_fin_item: TMenuItem;
    mi_cad_fin_item_avanc: TMenuItem;
    mi_cad_fin_conta_contabil: TMenuItem;
    mi_cad_fin_priori_itens: TMenuItem;
    mi_cad_fin_centro_custos: TMenuItem;
    mi_evento_contab: TMenuItem;
    mi_cad_scx_exp: TMenuItem;
    mi_cad_scx_exp_acesso: TMenuItem;
    mi_cad_scx_exp_cabecalho: TMenuItem;
    mi_cad_scx_exp_enquad_op: TMenuItem;
    mi_cad_scx_exp_inst_negoc: TMenuItem;
    mi_cad_scx_exp_local_emis: TMenuItem;
    mi_cad_mod_trans: TMenuItem;
    mi_cad_normas: TMenuItem;
    mi_cad_scx_exp_acordo: TMenuItem;
    mi_cad_scx_exp_naladincca: TMenuItem;
    mi_cad_scx_exp_naladish: TMenuItem;
    mi_cad_scx_exp_ncm: TMenuItem;
    mi_cad_termo_pagto: TMenuItem;
    mi_cad_scx_exp_urf: TMenuItem;
    mi_cad_frete: TMenuItem;
    mi_cad_frete_importacao: TMenuItem;
    mi_cad_frete_exportacao: TMenuItem;
    mi_cad_tabela_iata: TMenuItem;
    mi_cad_conteiners: TMenuItem;
    mi_cad_notificador: TMenuItem;
    mi_cad_documentos: TMenuItem;
    mi_cad_embarque_desembarque: TMenuItem;
    mi_cad_local_emb: TMenuItem;
    mi_cad_portos: TMenuItem;
    mi_cad_aeroportos: TMenuItem;
    mi_cad_grupo_portos: TMenuItem;
    mi_cad_vendedores: TMenuItem;
    mi_cad_amz: TMenuItem;
    mi_cad_disp_legal: TMenuItem;
    mi_cad_embal: TMenuItem;
    mi_cad_embar: TMenuItem;
    mi_cad_familia_prod: TMenuItem;
    mi_cad_feriado: TMenuItem;
    mi_cad_finalidade_merc: TMenuItem;
    mi_cad_merc: TMenuItem;
    mi_cad_merc_pesq: TMenuItem;
    mi_cad_merc_exp: TMenuItem;
    mi_cad_moeda: TMenuItem;
    mi_mod_followup: TMenuItem;
    mi_cad_ncm: TMenuItem;
    mi_cad_obs: TMenuItem;
    mi_cad_pais: TMenuItem;
    mi_cad_documento: TMenuItem;
    mi_cad_unid_medida: TMenuItem;
    mi_cad_urf: TMenuItem;
    mi_cad_delegacia: TMenuItem;
    mi_cad_via_transp: TMenuItem;
    mi_cad_ncm_pis_cofins: TMenuItem;
    mi_TaxaSELIC: TMenuItem;
    mi_banco_itl: TMenuItem;
    mi_tx: TMenuItem;
    mi_tx_exp: TMenuItem;
    mi_tx_sda: TMenuItem;
    mi_tx_darf: TMenuItem;
    mi_tx_teca: TMenuItem;
    mi_tx_codesp: TMenuItem;
    mi_tx_tra: TMenuItem;
    mi_tx_amz: TMenuItem;
    mi_tx_ag: TMenuItem;
    mi_tabelas: TMenuItem;
    mi_tabela_unid_neg: TMenuItem;
    mi_tabela_produto: TMenuItem;
    mi_tabela_grupo_servico: TMenuItem;
    mi_tabela_servico: TMenuItem;
    mi_tabela_evento: TMenuItem;
    mi_tabela_evento_po: TMenuItem;
    mi_tabela_etapa: TMenuItem;
    mi_tabela_classif: TMenuItem;
    mi_tabela_modulo: TMenuItem;
    mi_tabela_arm_rec: TMenuItem;
    mi_tabela_de_para: TMenuItem;
    mi_outros: TMenuItem;
    mi_tabela_cargo: TMenuItem;
    mi_cadastro_usuario: TMenuItem;
    mi_out_celula: TMenuItem;
    mi_out_release: TMenuItem;
    mi_muda_usuario: TMenuItem;
    mi_li_outros: TMenuItem;
    mi_parametros_sistema: TMenuItem;
    mi_ajuste_impressao: TMenuItem;
    mi_ajuste_impressao_sda: TMenuItem;
    mi_ajuste_impressao_sda_rgs: TMenuItem;
    mi_ajuste_impressao_sda_sp: TMenuItem;
    mi_ajuste_impressao_sda_sts: TMenuItem;
    mi_ajuste_impressao_sda_rj: TMenuItem;
    mi_ajuste_impressao_icms: TMenuItem;
    mi_ajuste_impressao_icms_rgs: TMenuItem;
    mi_ajuste_impressao_icms_sp: TMenuItem;
    mi_ajuste_impressao_gnre: TMenuItem;
    mi_ajuste_impressao_darf: TMenuItem;
    mi_ajuste_impressao_exoneracao: TMenuItem;
    mi_out_ajuste_boleto: TMenuItem;
    mi_out_ajuste_nf_servico: TMenuItem;
    mi_nf_indaia: TMenuItem;
    mi_nota_fiscal: TMenuItem;
    mi_out_integr_contab: TMenuItem;
    mi_out_recontab_fat: TMenuItem;
    mi_out_recontab_fin: TMenuItem;
    mi_out_recontab_ctaapagar: TMenuItem;
    mi_out_integr_po: TMenuItem;
    mi_out_leitura_po: TMenuItem;
    mi_out_po_sap_broker: TMenuItem;
    mi_out_integr_di: TMenuItem;
    mi_out_di_padrao: TMenuItem;
    mi_out_di_ddimport: TMenuItem;
    mi_out_ddbroker_ddimport: TMenuItem;
    mi_out_ler_po: TMenuItem;
    mi_out_saida_ddimport_followup: TMenuItem;
    mi_out_saida_ddimport_custo: TMenuItem;
    mi_out_exportacao: TMenuItem;
    mi_out_exp_brok_sap: TMenuItem;
    mi_out_imp_nf_proc: TMenuItem;
    mi_out_exp_retorno: TMenuItem;
    mi_out_nf_broker_sap: TMenuItem;
    mi_integrao_basf: TMenuItem;
    mi_atualizao_ncm: TMenuItem;
    mi_int_mesquita: TMenuItem;
    mi_out_Atualiza_SISCOMEX: TMenuItem;
    mi_out_edit_doc: TMenuItem;
    mi_out_pesq_log: TMenuItem;
    mi_config_alerta_eventos: TMenuItem;
    mi_Integracoes: TMenuItem;
    mi_int_work_im: TMenuItem;
    mi_ajuda: TMenuItem;
    mi_about: TMenuItem;
    mi_rel_cat63: TMenuItem;
    mi_fat_rel_dem_cob: TMenuItem;
    mi_fin_conc_banc: TMenuItem;
    mi_re_capa: TMenuItem;
    mi_out_integr_dem: TMenuItem;
    mi_exp_prep_re_rei: TMenuItem;
    mi_fin_fluxo: TMenuItem;
    mi_consulta_parametrizacao: TMenuItem;
    appMain: TApplicationEvents;
    mi_leitura_arquivos_bsh: TMenuItem;
    mi_env_doc_web: TMenuItem;
    PreenchimentoAutomticodeDocumentos1: TMenuItem;
    mi_carta_config: TMenuItem;
    mi_cria_variaveis: TMenuItem;
    mi_emissao_documentos: TMenuItem;
    mi_fat_emi_dem_desp_comp: TMenuItem;
    GestoArmazenagem1: TMenuItem;
    mi_controle_armazenagem: TMenuItem;
    mi_controle_viagem: TMenuItem;
    mi_fat_emi_nf_fat_nova: TMenuItem;
    mi_fin_rel_rec_liq: TMenuItem;
    integracaoplanBASF: TMenuItem;
    mniPaletizacao: TMenuItem;
    mi_sda_desp: TMenuItem;
    mi_pagto_conf_recibos: TMenuItem;
    Panel7: TPanel;
    SpeedButton1: TSpeedButton;
    Panel8: TPanel;
    Panel6: TPanel;
    img1: TImage;
    Image2: TImage;
    Panel5: TPanel;
    pnl1: TPanel;
    img2: TImage;
    lbl2: TLabel;
    Image1: TImage;
    FluxodeCaixaOperacional1: TMenuItem;
    mi_fin_saldo_cli: TMenuItem;
    miPaletizacao: TMenuItem;
    mi_dde: TMenuItem;
    mi_cad_config_status: TMenuItem;
    miAcertaTxt: TMenuItem;
    miDCA: TMenuItem;
    miIntegraBASF85: TMenuItem;
    miConsMantra: TMenuItem;
    miRelDetFatura: TMenuItem;
    mniContCambio: TMenuItem;
    btn_suporte: TSpeedButton;
    NovoControledePISCofinsIRRF1: TMenuItem;
    pnl_InstrucaoDesemb: TPanel;
    btn_InstrucaoDesemb: TSpeedButton;
    mi_Instrucao_desemb: TMenuItem;
    FaturamentosConsolidados1: TMenuItem;
    mi_rel_icms_suspenso: TMenuItem;
    BtnCorrigir: TSpeedButton;
    mnuRelacaodeRetrabalhos: TMenuItem;
    mi_Gera_Arquivo_Croda: TMenuItem;
    Arquivos1: TMenuItem;
    miDeclaracoesFIESP: TMenuItem;
    miCertificadodeOrigemFIESP: TMenuItem;
    mi_rel_LinhaAzul: TMenuItem;
    mi_out_nf: TMenuItem;
    mi_Gera_txt_Basf: TMenuItem;
    mi_fin_rel_valores_receb: TMenuItem;
    pnlSombraMyTwitter: TPanel;
    tmrTwitter: TTimer;
    mi_rel_BBPag: TMenuItem;
    mi_rel_valores_pend: TMenuItem;
    pnlMyTwitter: TPanel;
    wbMyTwitter: TWebBrowser;
    mi_fin_rel_ref_basf: TMenuItem;
    tmrFecharJanelas: TTimer;
    miCadastrodeViagens: TMenuItem;
    Parceiros1: TMenuItem;
    pnl_pendencias_principal_menu: TPanel;
    pnl_pendencias_menu: TPanel;
    dbg_pendencia_menu: TDBGrid;
    dsPendenciasMenu: TDataSource;
    qryPendenciasMenu: TQuery;
    qryPendenciasMenuAtendente: TQuery;
    qryPendenciasMenuAtendenteNR_PROCESSO: TStringField;
    qryPendenciasMenuAtendenteNM_PENDENCIA: TStringField;
    qryPendenciasMenuAtendenteDT_MAXIMA: TDateTimeField;
    qryPendenciasMenuAtendenteAP_USUARIO: TStringField;
    qryPendenciasMenuNR_PROCESSO: TStringField;
    qryPendenciasMenuNM_PENDENCIA: TStringField;
    qryPendenciasMenuDT_MAXIMA: TDateTimeField;
    qryPendenciasMenuAP_USUARIO: TStringField;
    qryPendenciasMenuNR_PROCESSO_REDUZIDO: TStringField;
    qryPendenciasMenuAtendenteNR_PROCESSO_REDUZIDO: TStringField;
    Label6: TLabel;
    qryPendenciasMenuAtendenteNM_STATUS: TStringField;
    qryPendenciasMenuNM_STATUS: TStringField;
    qryPendenciasMenuAtendenteCALC_DIF_TEMPO: TStringField;
    qryPendenciasMenuCALC_DIF_TEMPO: TStringField;
    qryPendenciasMenuAtendenteCD_PENDENCIA: TIntegerField;
    qryPendenciasMenuCD_PENDENCIA: TIntegerField;
    qryPendenciasMenuAtendenteDIFERENCA: TIntegerField;
    qryPendenciasMenuDIFERENCA: TIntegerField;
    qryPendenciasMenuDIFERENCA2: TIntegerField;
    qryPendenciasMenuAtendenteDIFERENCA2: TIntegerField;
    qryPendenciasMenuAtendenteCALC_DIF_TEMPO2: TStringField;
    qryPendenciasMenuCALC_DIF_TEMPO2: TStringField;
    qryPendenciasMenuCD_STATUS: TStringField;
    qryPendenciasMenuAtendenteCD_STATUS: TStringField;
    chb_solicitadas: TcxCheckBox;
    chb_finalizadas: TcxCheckBox;
    dte_dt_inicial: TcxDateEdit;
    dte_dt_final: TcxDateEdit;
    tme_dt_final: TcxTimeEdit;
    tme_dt_inicial: TcxTimeEdit;
    edt_processo: TcxTextEdit;
    Label7: TLabel;
    pnl_borda_atualiza: TPanel;
    Panel9: TPanel;
    Image3: TImage;
    Label8: TLabel;
    Image4: TImage;
    mi_cadastra_dica: TMenuItem;
    PlanilhaRFUruguaiana1: TMenuItem;
    pnl_dde: TPanel;
    btn_dde: TSpeedButton;
    pnl_di_conferencia: TPanel;
    btn_di_conferencia: TSpeedButton;
    miTransitTime: TMenuItem;
    pnl_re: TPanel;
    btn_re: TSpeedButton;
    qryPendenciasMenuNR_REFERENCIA: TStringField;
    qryPendenciasMenuNR_ITEM_CLIENTE: TStringField;
    qryPendenciasMenuNR_PARCIAL: TIntegerField;
    qryPendenciasMenuCD_EMPRESA: TStringField;
    qryPendenciasMenuAtendenteNR_REFERENCIA: TStringField;
    qryPendenciasMenuAtendenteNR_ITEM_CLIENTE: TStringField;
    qryPendenciasMenuAtendenteNR_PARCIAL: TIntegerField;
    qryPendenciasMenuAtendenteCD_EMPRESA: TStringField;
    VerQuery1: TMenuItem;
    mi_consulta_produtos_di: TMenuItem;
    pnl_Abertura: TPanel;
    btn_Abertura: TSpeedButton;
    miFatores: TMenuItem;
    miRobos: TMenuItem;
    miLeadTime: TMenuItem;
    mi_rel_Financeiro: TMenuItem;
    miRelPagamentosAdministrativos: TMenuItem;
    mi_int_gt_nexus: TMenuItem;
    ObjectInspector1: TMenuItem;
    miEtapaProdutoEvento: TMenuItem;
    mi_int_ford: TMenuItem;
    NFeSamsung1: TMenuItem;
    mi_int_bid_nest: TMenuItem;
    mi_rel_exp_co_novoex: TMenuItem;
    DANFEFesto1: TMenuItem;
    lblTestingSombra: TLabel;
    lblTesting: TLabel;
    tmrBlink: TTimer;
    miRelatorioBasico: TMenuItem;
    POSystem1: TMenuItem;
    NotasFiscaisdeEntrada1: TMenuItem;
    SEFAZ1: TMenuItem;
    RLDraftFilter1: TRLDraftFilter;
    RLRichFilter1: TRLRichFilter;
    RLHTMLFilter1: TRLHTMLFilter;
    RLXLSFilter1: TRLXLSFilter;
    RLXLSXFilter1: TRLXLSXFilter;
    DIValoresporAdio1: TMenuItem;
    ConsultaLI1: TMenuItem;
    mniExigenciasInmetro: TMenuItem;
    DuplicarLI1: TMenuItem;
    mi_CadUfIcmsOnline: TMenuItem;
    mi_cad_importacao: TMenuItem;
    mi_dde_novo: TMenuItem;
    btn_dde_novo: TSpeedButton;	
	CargillTrimestralOperaes1: TMenuItem;
    RelatriodeDespesasBASF1: TMenuItem;
    Numerrios1: TMenuItem;
    BASF1: TMenuItem;
    NumerriosnoFaturados1: TMenuItem;
    Nestl1: TMenuItem;
    Faturados1: TMenuItem;
    PagamentosCriadosBoleto1: TMenuItem;
    Mattel1: TMenuItem;
    Pagamentosnofaturadoscomnumerrioemaberto1: TMenuItem;
    PagamentosnoFaturadosesemNumerrioSolicitado1: TMenuItem;
    NumerriosnoFaturados2: TMenuItem;
    ControledeFaturamentoporUsurio1: TMenuItem;
    PadroSISCOSERVDespesasPagas1: TMenuItem;
    FaturadosSaldodeFatura1: TMenuItem;
    Cargil1: TMenuItem;
    FaturadosImportao1: TMenuItem;
    PagamentosnoFaturados1: TMenuItem;
    DespesasPagas1: TMenuItem;
    FaturadosExportao1: TMenuItem;
    FaturadosCEBRACE1: TMenuItem;
    CEBRACE1: TMenuItem;
    Firmenic1: TMenuItem;
    Faturados2: TMenuItem;
    Whirlpool1: TMenuItem;
    Faturado1: TMenuItem;
    Comisses1: TMenuItem;
    MBASF1: TMenuItem;
    Chevron1: TMenuItem;
    NumerriosnoFaturados3: TMenuItem;
    ProcessodeExportaoItens1: TMenuItem;
    SaintGobain1: TMenuItem;
    SpedFiscal1: TMenuItem;
    CBE1: TMenuItem;
    SpedFiscal2: TMenuItem;
    Firmenich1: TMenuItem;
    SpedFiscal3: TMenuItem;
    CardinalICF1: TMenuItem;
    GerenciamentodeProcessos1: TMenuItem;
    mnuIntegraoPhilips: TMenuItem;
    ArmazenagemExpo1: TMenuItem;
    ConfigEnviodeEmails1: TMenuItem;
    Anvisa1: TMenuItem;
    ConsultaMercante1: TMenuItem;
    Nestle1: TMenuItem;
    InstruodeEmbarque1: TMenuItem;
    Philips1: TMenuItem;
    Faturados3: TMenuItem;
    MBASF2: TMenuItem;
    LIsConsultadasRobo1: TMenuItem;
    PagamentoMercante1: TMenuItem;
    Numerarios1: TMenuItem;
    FaturamentoLI1: TMenuItem;
    mi_due: TMenuItem;
    SpeedButton2: TSpeedButton;
    MercadoriasExpo1: TMenuItem;
    MercadoriasImportao1: TMenuItem;
    FaturadosComisso1: TMenuItem;
    AFaturar1: TMenuItem;
    Faturados4: TMenuItem;
    DIObservacoesAutomaticas1: TMenuItem;
    Panel10: TPanel;
    lblServidor: TLabel;
    lblNmServidor: TLabel;
    PagamentoAFRMM1: TMenuItem;
    FaturadosSemanal1: TMenuItem;
    Mercante1: TMenuItem;
    DIObsAutomaticasParametros1: TMenuItem;
    mitiposdePendencias: TMenuItem;
    Prometeon1: TMenuItem;
    SaintGobain2: TMenuItem;
    DespesasPagas2: TMenuItem;
    mi_wallet: TMenuItem;
    miWalletCadastros: TMenuItem;
    miWalletSolicitarNumerarios: TMenuItem;
    miWalletCriarPagamentos: TMenuItem;
    Impostos1: TMenuItem;
    miWalletSolicitarPagamento: TMenuItem;
    WalletCadBanco: TMenuItem;
    WalletCadCliente: TMenuItem;
    WalletCadFavorecido: TMenuItem;
    WalletCadFilial: TMenuItem;
    WalletCadGrupo: TMenuItem;
    WalletCadItem: TMenuItem;
    WalletCadOrganizacao: TMenuItem;
    WalletCadPais: TMenuItem;
    WalletCadProduto: TMenuItem;
    WalletCadServico: TMenuItem;
    WalletCadUsuario: TMenuItem;
    WalletTransferenciaPagamento: TMenuItem;
    IntegrcaoFecomercio1: TMenuItem;
    Yara1: TMenuItem;
    Faturados5: TMenuItem;
    walletPreFaturamento: TMenuItem;
    Numerrios2: TMenuItem;
    Ferrero1: TMenuItem;
    DIeImpostosEASY1: TMenuItem;
    AcordoComercial1: TMenuItem;
    DeclaraodeOrigem1: TMenuItem;
    DescriodeMercadoriaDraft1: TMenuItem;
    ProcessosFaturadosSaldoFaturasemaprovComissao: TMenuItem;
    Cargil: TMenuItem;
    RelatrioNFsCargil1: TMenuItem;
    IntegracaoSAP1: TMenuItem;
    IntegraoDrawbackIsencao1: TMenuItem;
    Prometeon2: TMenuItem;
    FaturadosDespesasHonorarios1: TMenuItem;
    FaturadosHonorarios1: TMenuItem;
    Pirelli1: TMenuItem;
    FaturadosHonorarios2: TMenuItem;
    Nestl2: TMenuItem;
    IntegracaoDraftDanfeNestle1: TMenuItem;
    Rousselot1: TMenuItem;
    FaturadosDespesas1: TMenuItem;
    Ferrero2: TMenuItem;
    Faturados6: TMenuItem;
    FaturadosComissaoExportacao1: TMenuItem;
    AberturadeProcessosNestleDF1: TMenuItem;
    AberturadeProcessosNestleLean1: TMenuItem;
    Booking1: TMenuItem;
    FaturadosImportacaosgb: TMenuItem;
    FaturadosExportacaoSgb: TMenuItem;
    Apolo1: TMenuItem;
    ApoloItensExportao1: TMenuItem;
    NestleIntegraoLotesItensExportao1: TMenuItem;
    Essity: TMenuItem;
    DraftBL1: TMenuItem;
    CertificadodeOrigem1: TMenuItem;
    ExtratorDadosSiscomex1: TMenuItem;
    NexansDraftNF1: TMenuItem;
    SolicNumerrio1: TMenuItem;
    Husqvarna: TMenuItem;
    Faturados7: TMenuItem;
    FaturadosExportaointegra1: TMenuItem;
    mniPrimient1: TMenuItem;
    Faturados8: TMenuItem;
    LogManager1: TMenuItem;
    Anvisa2: TMenuItem;
    GerarxmlNFe1: TMenuItem;
    procedure VerAtalho;
    procedure mi_saidaClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Cds(Sender: TObject);
    procedure mi_tabela_moduloClick(Sender: TObject);
    procedure mi_cadastro_usuarioClick(Sender: TObject);
    procedure mi_tabela_produtoClick(Sender: TObject);
    procedure mi_tabela_unid_negClick(Sender: TObject);
    procedure mi_tabela_cargoClick(Sender: TObject);
    procedure mi_muda_usuarioClick(Sender: TObject);
    procedure btn_aboutClick(Sender: TObject);
    procedure mi_tabela_servicoClick(Sender: TObject);
    procedure mi_abertura_processoClick(Sender: TObject);
    procedure mi_tabela_etapaClick(Sender: TObject);
    procedure mi_tabela_eventoClick(Sender: TObject);
    procedure mi_realizacao_processoClick(Sender: TObject);
    procedure mi_inspecao_processoClick(Sender: TObject);
    procedure mi_realizacao_eventoClick(Sender: TObject);
    procedure mi_inspecao_eventoClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure mi_solicitacao_numerarioClick(Sender: TObject);
    procedure mi_fat_lancClick(Sender: TObject);
    procedure mi_cad_cliClick(Sender: TObject);
    procedure mi_cad_emp_nacClick(Sender: TObject);
    procedure mi_cad_emp_estClick(Sender: TObject);
    procedure mi_cad_local_embClick(Sender: TObject);
    procedure mi_cad_transp_itlClick(Sender: TObject);
    procedure mi_integracao_liClick(Sender: TObject);
    procedure mi_cad_despClick(Sender: TObject);
    procedure mi_sda_distrClick(Sender: TObject);
    procedure mi_ext_hon_sdaClick(Sender: TObject);
    procedure mi_sda_emissaoClick(Sender: TObject);
    procedure mi_parametros_sistemaClick(Sender: TObject);
    procedure mi_cad_obsClick(Sender: TObject);
    procedure mi_diClick(Sender: TObject);
    procedure mi_cad_amzClick(Sender: TObject);
    procedure mi_cad_fin_favClick(Sender: TObject);
    procedure mi_cad_mercClick(Sender: TObject);
    procedure mi_previsaoClick(Sender: TObject);
    procedure mi_cad_via_transpClick(Sender: TObject);
    procedure mi_tabela_classifClick(Sender: TObject);
    procedure mi_cad_hab_despClick(Sender: TObject);
    procedure mi_cad_fin_conta_bancClick(Sender: TObject);
    procedure mi_out_celulaClick(Sender: TObject);
    procedure mi_cad_moedaClick(Sender: TObject);
    procedure mi_tx_expClick(Sender: TObject);
    procedure mi_tx_darfClick(Sender: TObject);
    procedure mi_cad_transp_rodClick(Sender: TObject);
    procedure mi_cad_fin_itemClick(Sender: TObject);
    procedure mi_cad_fin_priori_itensClick(Sender: TObject);
    procedure mi_tx_codespClick(Sender: TObject);
    procedure mi_cad_embalClick(Sender: TObject);
    procedure mi_cad_embarClick(Sender: TObject);
    procedure mi_tx_tecaClick(Sender: TObject);
    procedure mi_tx_traClick(Sender: TObject);
    procedure mi_tx_amzClick(Sender: TObject);
    procedure mi_cad_fin_contas_caixaClick(Sender: TObject);
    procedure mi_rec_num_rel_rec_devClick(Sender: TObject);
    procedure mi_rec_num_rel_totClick(Sender: TObject);
    procedure mi_entrega_ch_brClick(Sender: TObject);
    procedure mi_emi_sol_numClick(Sender: TObject);
    procedure mi_rec_num_solicitadoClick(Sender: TObject);
    procedure mi_rec_num_devClick(Sender: TObject);
    procedure mi_liberacao_processoClick(Sender: TObject);
    procedure mi_manutencao_processoClick(Sender: TObject);
    procedure mi_cancelamento_processoClick(Sender: TObject);
    procedure mi_pesquisa_processoClick(Sender: TObject);
    procedure mi_agentesClick(Sender: TObject);
    procedure mi_tx_agClick(Sender: TObject);
    procedure mi_fin_lancClick(Sender: TObject);
    procedure mi_tx_sdaClick(Sender: TObject);
    procedure mi_cheque_avulsoClick(Sender: TObject);
    procedure mi_aplicabilidade_eventoClick(Sender: TObject);
    procedure mi_fat_solClick(Sender: TObject);
    procedure mi_fat_emi_nf_fatClick(Sender: TObject);
    procedure mi_liquidacaoClick(Sender: TObject);
    procedure mi_rel_saldos_pendClick(Sender: TObject);
    procedure mi_rel_liquidacaoClick(Sender: TObject);
    procedure mi_rel_prestados_conta_ch_brClick(Sender: TObject);
    procedure mi_rel_pend_ch_brClick(Sender: TObject);
    procedure mi_rel_imp_proc_pg_des_diClick(Sender: TObject);
    procedure mi_rel_imp_proc_pg_des_liClick(Sender: TObject);
    procedure mi_rel_imp_mov_procClick(Sender: TObject);
    procedure mi_relacao_nao_inspecaoClick(Sender: TObject);
    procedure mi_fat_emi_notaClick(Sender: TObject);
    procedure mi_rel_imp_andamentoClick(Sender: TObject);
    procedure mi_rel_es_periodoClick(Sender: TObject);
    procedure mi_fat_rel_comissaoClick(Sender: TObject);
    procedure mi_fat_rel_comparativoClick(Sender: TObject);
    procedure mi_rel_es_saldo_cliClick(Sender: TObject);
    procedure mi_rel_es_despClick(Sender: TObject);
    procedure mi_rel_es_rec_desp_opClick(Sender: TObject);
    procedure mi_rel_es_rank_recClick(Sender: TObject);
    procedure mi_rel_es_vencto_cartaoClick(Sender: TObject);
    procedure mi_relacao_nao_realizacaoClick(Sender: TObject);
    procedure mi_rel_es_gastos_processoClick(Sender: TObject);
    procedure mi_rel_es_gastos_portoClick(Sender: TObject);
    procedure mi_rel_imp_flp_planClick(Sender: TObject);
    procedure mi_rel_imp_map_segClick(Sender: TObject);
    procedure mi_rel_imp_prev_custoClick(Sender: TObject);
    procedure mi_rel_es_gastos_amzClick(Sender: TObject);
    procedure mi_rel_es_vl_cifClick(Sender: TObject);
    procedure mi_rel_es_cli_ativoClick(Sender: TObject);
    procedure mi_rel_es_cli_nao_ativoClick(Sender: TObject);
    procedure mi_rel_es_cli_ativo_nao_ativoClick(Sender: TObject);
    procedure mi_rel_es_cli_nao_ativo_ativoClick(Sender: TObject);
    procedure mi_mod_followupClick(Sender: TObject);
    procedure mi_rel_imp_followupClick(Sender: TObject);
    procedure mi_imp_diClick(Sender: TObject);
    procedure mi_imp_liClick(Sender: TObject);
    procedure mi_out_recontab_fatClick(Sender: TObject);
    procedure mi_out_recontab_finClick(Sender: TObject);
    procedure mi_di_recalculoClick(Sender: TObject);
    procedure mi_espelho_processoClick(Sender: TObject);
    procedure mi_rel_imp_plan_custoClick(Sender: TObject);
    procedure mi_rel_imp_lead_timeClick(Sender: TObject);
    procedure mi_rel_exp_proc_pend_averbClick(Sender: TObject);
    procedure mi_rel_exp_proc_averbClick(Sender: TObject);
    procedure mi_rel_es_tot_serv_cliClick(Sender: TObject);
    procedure mi_rel_es_tot_serv_cli_anClick(Sender: TObject);
    procedure mi_rel_imp_docto_recClick(Sender: TObject);
    procedure mi_di_retif_diClick(Sender: TObject);
    procedure mi_rel_es_ensaio_recClick(Sender: TObject);
    procedure mi_cad_unid_medidaClick(Sender: TObject);
    procedure mi_rel_cad_tx_cambioClick(Sender: TObject);
    procedure mi_liq_rel_totClick(Sender: TObject);
    procedure mi_out_recontab_ctaapagarClick(Sender: TObject);
    procedure mi_relacao_realizadosClick(Sender: TObject);
    procedure mi_out_pesq_logClick(Sender: TObject);
    procedure mi_rel_imp_performanceClick(Sender: TObject);
    procedure mi_rel_imp_desp_mensaisClick(Sender: TObject);
    procedure mi_LIClick(Sender: TObject);
    procedure mi_out_Atualiza_SISCOMEXClick(Sender: TObject);
    procedure mi_li_trans_LIClick(Sender: TObject);
    procedure mi_fat_emi_nf_servClick(Sender: TObject);
    procedure mi_cad_disp_legalClick(Sender: TObject);
    procedure mi_pagto_solicClick(Sender: TObject);
    procedure mi_cad_feriadoClick(Sender: TObject);
    procedure mi_pagto_montagemClick(Sender: TObject);
    procedure mi_tabela_arm_recClick(Sender: TObject);
    procedure mi_pagto_libClick(Sender: TObject);
    procedure mi_pagto_imp_chequeClick(Sender: TObject);
    procedure mi_pagto_rel_copia_chequeClick(Sender: TObject);
    procedure mi_pagto_rel_sol_nao_emitidasClick(Sender: TObject);
    procedure mi_pagto_rel_pendClick(Sender: TObject);
    procedure mi_POClick(Sender: TObject);
    procedure mi_imp_poClick(Sender: TObject);
    procedure mi_cad_ncmClick(Sender: TObject);
    procedure mi_cad_scx_exp_acessoClick(Sender: TObject);
    procedure mi_cad_scx_exp_enquad_opClick(Sender: TObject);
    procedure mi_cad_scx_exp_urfClick(Sender: TObject);
    procedure mi_cad_scx_exp_inst_negocClick(Sender: TObject);
    procedure mi_cad_fin_conta_contabilClick(Sender: TObject);
    procedure mi_cad_fin_conta_gerencialClick(Sender: TObject);
    procedure mi_cad_fin_conta_custoClick(Sender: TObject);
    procedure mi_cad_fin_hist_padraoClick(Sender: TObject);
    procedure mi_fat_rel_abfatClick(Sender: TObject);
    procedure mi_preparaClick(Sender: TObject);
    procedure mi_estornoClick(Sender: TObject);
    procedure mi_po_consulta_itensClick(Sender: TObject);
    procedure mi_po_consulta_prodClick(Sender: TObject);
    procedure mi_out_leitura_poClick(Sender: TObject);
    procedure mi_adm_solicClick(Sender: TObject);
    procedure mi_adm_montagemClick(Sender: TObject);
    procedure mi_adm_pesquisaClick(Sender: TObject);
    procedure mi_pagto_pesquisaClick(Sender: TObject);
    procedure mi_adm_imp_chequeClick(Sender: TObject);
    procedure mi_peClick(Sender: TObject);
    procedure mi_pe_preparaClick(Sender: TObject);
    procedure mi_pe_estornoClick(Sender: TObject);
    procedure mi_pe_consulta_itensClick(Sender: TObject);
    procedure mi_pe_consulta_prodClick(Sender: TObject);
    procedure mi_imp_peClick(Sender: TObject);
    procedure mi_cad_finalidade_mercClick(Sender: TObject);
    procedure mi_cad_mod_transClick(Sender: TObject);
    procedure mi_cad_familia_prodClick(Sender: TObject);
    procedure mi_cad_termo_pagtoClick(Sender: TObject);
    procedure mi_expClick(Sender: TObject);
    procedure mi_exp_impClick(Sender: TObject);
    procedure mi_realizacao_veiculoClick(Sender: TObject);
    procedure mi_exp_doc_fat_comClick(Sender: TObject);
    procedure mi_exp_doc_cert_origClick(Sender: TObject);
    procedure mi_exp_doc_packing_listClick(Sender: TObject);
    procedure mi_exp_doc_cert_seguroClick(Sender: TObject);
    procedure mi_exp_doc_instr_embClick(Sender: TObject);
    procedure mi_cad_merc_expClick(Sender: TObject);
    procedure mi_bloqueio_eventoClick(Sender: TObject);
    procedure mi_repasse_dadosClick(Sender: TObject);
    procedure mi_fin_rel_desembClick(Sender: TObject);
    procedure mi_rel_imp_desp_nao_desemb_diClick(Sender: TObject);
    procedure mi_rel_imp_followup_navioClick(Sender: TObject);
    procedure mi_rel_imp_pos_veiculosClick(Sender: TObject);
    procedure mi_rel_imp_desp_armClick(Sender: TObject);
    procedure mi_rel_imp_desp_pagtoClick(Sender: TObject);
    procedure mi_emi_sol_liberacaoClick(Sender: TObject);
    procedure mi_rel_imp_minuta_transpClick(Sender: TObject);
    procedure mi_imp_itensClick(Sender: TObject);
    procedure mi_cad_scx_exp_acordoClick(Sender: TObject);
    procedure mi_cad_scx_exp_cabecalhoClick(Sender: TObject);
    procedure mi_cad_scx_exp_local_emisClick(Sender: TObject);
    procedure mi_fin_rel_ext_ccClick(Sender: TObject);
    procedure mi_rel_exp_pos_veiculosClick(Sender: TObject);
    procedure mi_out_nf_broker_sapClick(Sender: TObject);
    procedure mi_out_po_sap_brokerClick(Sender: TObject);
    procedure mi_out_exp_brok_sapClick(Sender: TObject);
    procedure mi_out_exp_retornoClick(Sender: TObject);
    procedure mi_tabela_de_paraClick(Sender: TObject);
    procedure mi_exp_saqueClick(Sender: TObject);
    procedure mi_exp_doc_saqueClick(Sender: TObject);
    procedure mi_cad_scx_exp_ncmClick(Sender: TObject);
    procedure mi_cad_scx_exp_naladinccaClick(Sender: TObject);
    procedure mi_cad_scx_exp_naladishClick(Sender: TObject);
    procedure mi_fin_rel_tab_jurosClick(Sender: TObject);
    procedure mi_fin_manut_rel_reemb_finClick(Sender: TObject);
    procedure mi_fat_rel_demo_ccClick(Sender: TObject);
    procedure mi_fat_rel_cc_cliClick(Sender: TObject);
    procedure mi_exp_borderoClick(Sender: TObject);
    procedure mi_exp_doc_borderoClick(Sender: TObject);
    procedure mi_fat_rel_resumo_fatClick(Sender: TObject);
    procedure mi_pagto_rel_pagto_pendClick(Sender: TObject);
    procedure mi_cad_documentoClick(Sender: TObject);
    procedure mi_cad_urfClick(Sender: TObject);
    procedure mi_di_imprime_darfClick(Sender: TObject);
    procedure mi_di_transClick(Sender: TObject);
    procedure mi_cad_paisClick(Sender: TObject);
    procedure mi_cad_areaClick(Sender: TObject);
    procedure mi_out_imp_nf_procClick(Sender: TObject);
    procedure mi_di_recuperaClick(Sender: TObject);
    procedure mi_exp_prep_reClick(Sender: TObject);
    procedure mi_rel_imp_and_servicoClick(Sender: TObject);
    procedure mi_tabela_evento_poClick(Sender: TObject);
    procedure mi_fat_rel_proc_fat_prefixoClick(Sender: TObject);
    procedure mi_po_flpClick(Sender: TObject);
    procedure mi_fat_rel_fat_nf_nota_emit_cancClick(Sender: TObject);
    procedure mi_adm_copias_cheque1Click(Sender: TObject);
    procedure mi_po_imp_mod2Click(Sender: TObject);
    procedure mi_po_rel_procClick(Sender: TObject);
    procedure mi_po_rel_saldo_mercClick(Sender: TObject);
    procedure mi_rel_exp_flpClick(Sender: TObject);
    procedure mi_ajuste_impressao_icms_rgsClick(Sender: TObject);
    procedure mi_out_edit_docClick(Sender: TObject);
    procedure mi_rec_num_rel_nao_recClick(Sender: TObject);
    procedure mi_ajuste_impressao_sda_rgsClick(Sender: TObject);
    procedure mi_rel_imp_ctrl_demurrageClick(Sender: TObject);
    procedure mi_po_imp_mod3Click(Sender: TObject);
    procedure mi_out_di_ddimportClick(Sender: TObject);
    procedure mi_out_di_padraoClick(Sender: TObject);
    procedure mi_rel_cont_embClick(Sender: TObject);
    procedure mi_ajuste_impressao_sda_spClick(Sender: TObject);
    procedure mi_ajuste_impressao_sda_stsClick(Sender: TObject);
    procedure mi_ajuste_impressao_icms_spClick(Sender: TObject);
    procedure mi_ajuste_impressao_exoneracaoClick(Sender: TObject);
    procedure mi_ajuste_impressao_gnreClick(Sender: TObject);
    procedure mi_rel_imp_ctrl_cliente_armClick(Sender: TObject);
    procedure mi_ajuste_impressao_darfClick(Sender: TObject);
    procedure mi_cad_merc_pesqClick(Sender: TObject);
    procedure mi_adiant_pend_fatClick(Sender: TObject);
    procedure mi_rel_exp_andamentoClick(Sender: TObject);
    procedure mi_relatriodecontrolededescargaClick(Sender: TObject);
    procedure mi_rel_exp_contr_averbClick(Sender: TObject);
    procedure mi_out_ajuste_boletoClick(Sender: TObject);
    procedure mi_rel_com_imp_expClick(Sender: TObject);
    procedure mi_rel_com_ind_porClick(Sender: TObject);
    procedure mi_out_ajuste_nf_servicoClick(Sender: TObject);
    procedure mi_exp_dde_vencimentoClick(Sender: TObject);
    procedure mi_int_work_imClick(Sender: TObject);
    procedure mi_fat_emi_nf_serv_fatClick(Sender: TObject);
    procedure mi_rel_est_cntrClick(Sender: TObject);
    procedure mi_rel_est_mercClick(Sender: TObject);
    procedure mi_fat_rel_pago_cliClick(Sender: TObject);
    procedure mi_rel_est_volumesClick(Sender: TObject);
    procedure mi_rel_est_arm_demurrageClick(Sender: TObject);
    procedure mi_rel_cad_merc_impClick(Sender: TObject);
    procedure mi_rel_cad_merc_expClick(Sender: TObject);
    procedure mi_cad_fin_grupo_itemClick(Sender: TObject);
    procedure mi_rel_est_cntr_vl_cifClick(Sender: TObject);
    procedure mi_rel_exp_emb_averbClick(Sender: TObject);
    procedure mi_rel_est_arm_prefixoClick(Sender: TObject);
    procedure mi_fat_rel_saldosClick(Sender: TObject);
    procedure mi_pagto_rel_razaoClick(Sender: TObject);
    procedure mi_po_rel_flpClick(Sender: TObject);
    procedure mi_gp_gb_rel_proc_mod1Click(Sender: TObject);
    procedure mi_gp_ga_cad_viagemClick(Sender: TObject);
    procedure mi_rel_exp_est_cambialClick(Sender: TObject);
    procedure mi_fat_rel_nf_recClick(Sender: TObject);
    procedure mi_rel_est_despClick(Sender: TObject);
    procedure mi_gp_gd_rel_cont_nao_devolClick(Sender: TObject);
    procedure mi_pagto_lib_tedClick(Sender: TObject);
    procedure mi_adm_lib_tedClick(Sender: TObject);
    procedure mi_pagto_rel_pagtoClick(Sender: TObject);
    procedure mi_adm_gera_tedClick(Sender: TObject);
    procedure mi_pagto_gera_tedClick(Sender: TObject);
    procedure mi_rel_imp_demurrageClick(Sender: TObject);
    procedure mi_fin_transf_pagtoClick(Sender: TObject);
    procedure mi_gd_cntrClick(Sender: TObject);
    procedure mi_gd_fatClick(Sender: TObject);
    procedure mi_fin_pesqClick(Sender: TObject);
    procedure mi_fat_rel_livro_fisc_nfClick(Sender: TObject);
    procedure mi_fat_rel_livro_fisc_capaClick(Sender: TObject);
    procedure mi_exp_carta_credClick(Sender: TObject);
    procedure mi_cad_prop_mercClick(Sender: TObject);
    procedure mi_ent_daClick(Sender: TObject);
    procedure mi_rel_imp_regClick(Sender: TObject);
    procedure mi_rel_imp_desembClick(Sender: TObject);
    procedure mi_ent_ret_daClick(Sender: TObject);
    procedure mi_ent_nacClick(Sender: TObject);
    procedure mi_ent_ret_nacClick(Sender: TObject);
    procedure mi_atualizao_ncmClick(Sender: TObject);
    procedure mi_int_mesquitaClick(Sender: TObject);
    procedure mi_rel_exp_reClick(Sender: TObject);
    procedure mi_di_lib_alto_valorClick(Sender: TObject);
    procedure mi_ajuste_impressao_sda_rjClick(Sender: TObject);
    procedure mi_ent_rel_sol_desClick(Sender: TObject);
    procedure mi_ent_rel_sol_desuClick(Sender: TObject);
    procedure mi_ent_rel_plan_desClick(Sender: TObject);
    procedure mi_rel_exp_kpiClick(Sender: TObject);
    procedure mi_gp_gd_rel_gerClick(Sender: TObject);
    procedure mi_gp_gd_rel_estClick(Sender: TObject);
    procedure btn_avisoClick(Sender: TObject);
    procedure mi_rel_est_lead_timeClick(Sender: TObject);
    procedure mi_tabela_grupo_servicoClick(Sender: TObject);
    procedure mi_db_susp_forecastClick(Sender: TObject);
    procedure mi_di_icms_onlineClick(Sender: TObject);
    procedure mi_fat_rel_rent_procClick(Sender: TObject);
    procedure mi_out_releaseClick(Sender: TObject);
    procedure btn_releaseClick(Sender: TObject);
    procedure tmr_releaseTimer(Sender: TObject);
    procedure btn_releaseMouseMove(Sender: TObject; Shift: TShiftState; X, Y: Integer);
    procedure mi_rel_imp_imp_sapClick(Sender: TObject);
    procedure mi_sda_cancelClick(Sender: TObject);
    procedure mi_sda_pesqClick(Sender: TObject);
    procedure mi_po_rel_lead_timeClick(Sender: TObject);
    procedure mi_rel_est_qt_cntrClick(Sender: TObject);
    procedure mi_po_rel_embClick(Sender: TObject);
    procedure mi_po_rel_nivel_servicoClick(Sender: TObject);
    procedure mi_rel_imp_canal_mesClick(Sender: TObject);
    procedure mi_po_at_basf_cadClick(Sender: TObject);
    procedure mi_po_at_basf_relClick(Sender: TObject);
    procedure mi_rel_es_desviosClick(Sender: TObject);
    procedure mi_cad_delegaciaClick(Sender: TObject);
    procedure mi_db_susp_acClick(Sender: TObject);
    procedure mi_po_rel_emb_prevClick(Sender: TObject);
    procedure mi_gp_gd_rel_ger2Click(Sender: TObject);
    procedure mi_rel_est_volumes2Click(Sender: TObject);
    procedure mi_db_flp_imp_realizClick(Sender: TObject);
    procedure mi_db_flp_exp_realizClick(Sender: TObject);
    procedure mi_po_rel_prev_nacionClick(Sender: TObject);
    procedure mi_out_saida_ddimport_followupClick(Sender: TObject);
    procedure mi_rel_imp_ctrl_requerimentoClick(Sender: TObject);
    procedure mi_rel_imp_canal_mes_mod_2Click(Sender: TObject);
    procedure mi_rel_exp_custosClick(Sender: TObject);
    procedure mi_out_saida_ddimport_custoClick(Sender: TObject);
    procedure mi_rel_imp_lead_time2Click(Sender: TObject);
    procedure mi_fat_rel_retClick(Sender: TObject);
    procedure mi_cad_ncm_pis_cofinsClick(Sender: TObject);
    procedure mi_rel_imp_proc_andClick(Sender: TObject);
    procedure mi_rel_imp_proc_desembClick(Sender: TObject);
    procedure mi_rel_est_qtde_proc_indClick(Sender: TObject);
    procedure mi_rel_exp_mapa_anl_oxClick(Sender: TObject);
    procedure mi_rel_exp_flp_indClick(Sender: TObject);
    procedure mi_gestao_poClick(Sender: TObject);
    procedure mi_po_ev_criticoClick(Sender: TObject);
    procedure FollowUpControledeNavios1Click(Sender: TObject);
    procedure mi_relacao_ev_criticoClick(Sender: TObject);
    procedure mi_po_rel_gestaoClick(Sender: TObject);
    procedure mi_relacao_ev_critico_poClick(Sender: TObject);
    procedure mi_rel_imp_acomp_procClick(Sender: TObject);
    procedure mi_cad_frete_importacaoClick(Sender: TObject);
    procedure mi_cad_frete_exportacaoClick(Sender: TObject);
    procedure mi_cad_tabela_iataClick(Sender: TObject);
    procedure mi_cad_notificadorClick(Sender: TObject);
    procedure mi_cad_documentosClick(Sender: TObject);
    procedure mi_cad_portosClick(Sender: TObject);
    procedure mi_cad_vendedoresClick(Sender: TObject);
    procedure mi_manut_cli_avClick(Sender: TObject);
    procedure mi_proc_comercClick(Sender: TObject);
    procedure mi_propostaClick(Sender: TObject);
    procedure mi_cotacaoClick(Sender: TObject);
    procedure mi_agenda_comercialClick(Sender: TObject);
    procedure mi_instr_comerc_aereoClick(Sender: TObject);
    procedure mi_instr_maritClick(Sender: TObject);
    procedure tmrHoraTimer(Sender: TObject);
    procedure mi_cad_aeroportosClick(Sender: TObject);
    procedure mi_agentes_cargaClick(Sender: TObject);
    procedure mi_cad_grupo_portosClick(Sender: TObject);
    procedure AberturaComercial1Click(Sender: TObject);
    procedure mi_fat_rel_val_retClick(Sender: TObject);
    procedure mi_config_alerta_eventosClick(Sender: TObject);
    procedure closerBeforeClose(Sender: TObject; var CanClose: Boolean);
    procedure FormDeactivate(Sender: TObject);
    procedure mi_nf_indaiaClick(Sender: TObject);
    procedure Laudo1Click(Sender: TObject);
    procedure mi_consulta_dbClick(Sender: TObject);
    procedure MensagensdeErro1Click(Sender: TObject);
    procedure mi_rel_armaz_cargaClick(Sender: TObject);
    procedure mi_fatura_comercial2Click(Sender: TObject);
    procedure mi_rel_armaz_fumigaClick(Sender: TObject);
    procedure mi_packing_list2Click(Sender: TObject);
    procedure mi_rel_imp_fup_diaClick(Sender: TObject);
    procedure mi_rel_imp_fup_processoClick(Sender: TObject);
    procedure mi_rel_imp_fup_procClick(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure mi_TaxaSELICClick(Sender: TObject);
    procedure mi_recebimento_agClick(Sender: TObject);
    procedure mi_db_isen_forecastClick(Sender: TObject);
    procedure mi_cad_fin_centro_custosClick(Sender: TObject);
    procedure mi_lancamentosClick(Sender: TObject);
    procedure mi_AutorizaodePagamentosClick(Sender: TObject);
    procedure mi_IntegraocomSISPAGClick(Sender: TObject);
    procedure mi_PesquisarClick(Sender: TObject);
    procedure mi_RelaodeContasaPagarClick(Sender: TObject);
    procedure mi_RelaodePagtosLiberadosClick(Sender: TObject);
    procedure mi_cad_fin_item_avancClick(Sender: TObject);
    procedure mi_evento_contabClick(Sender: TObject);
    procedure mi_notificacaoClick(Sender: TObject);
    procedure EmissodeChequesNotas1Click(Sender: TObject);
    procedure GeraodeTEDs1Click(Sender: TObject);
    procedure mi_adm_copias_chequeClick(Sender: TObject);
    procedure mi_instr_embarq_aereoClick(Sender: TObject);
    procedure mi_calc_profit_aereoClick(Sender: TObject);
    procedure mi_instr_embarq_maritClick(Sender: TObject);
    procedure mi_ctrl_embarqueClick(Sender: TObject);
    procedure mi_ctrl_demurrageClick(Sender: TObject);
    procedure mi_retificador_impClick(Sender: TObject);
    procedure mi_ped_inst_aereaClick(Sender: TObject);
    procedure mi_pre_al_maritClick(Sender: TObject);
    procedure mi_rel_iataClick(Sender: TObject);
    procedure mi_exp_pedido_maritClick(Sender: TObject);
    procedure mi_exp_prof_maritClick(Sender: TObject);
    procedure mi_exp_com_maritClick(Sender: TObject);
    procedure mi_retificador_expClick(Sender: TObject);
    procedure mi_analise_accountClick(Sender: TObject);
    procedure mi_acc_masterClick(Sender: TObject);
    procedure mi_emis_faturaClick(Sender: TObject);
    procedure mi_ems_fat_masterClick(Sender: TObject);
    procedure mi_emis_remessaClick(Sender: TObject);
    procedure mi_gera_remessaClick(Sender: TObject);
    procedure mi_lib_accountClick(Sender: TObject);
    procedure mi_disp_remessaClick(Sender: TObject);
    procedure mi_remissao_fatClick(Sender: TObject);
    procedure mi_fat_complClick(Sender: TObject);
    procedure mi_fin_rel_dem_clientesClick(Sender: TObject);
    procedure mi_rel_integradoClick(Sender: TObject);
    procedure mi_db_isen_acClick(Sender: TObject);
    procedure mi_cad_conteinersClick(Sender: TObject);
    procedure mi_banco_itlClick(Sender: TObject);
    procedure mi_transmissao_re_bshClick(Sender: TObject);
    procedure mi_rel_cat63Click(Sender: TObject);
    procedure mi_fat_rel_rdClick(Sender: TObject);
    procedure mi_fat_emi_dem_despClick(Sender: TObject);
    procedure mi_fat_rel_dem_cobClick(Sender: TObject);
    procedure mi_fin_conc_bancClick(Sender: TObject);
    procedure mi_re_capaClick(Sender: TObject);
    procedure aTrataErrosException(Sender: TObject; E: Exception);
    procedure mi_out_integr_demClick(Sender: TObject);
    procedure mi_exp_prep_re_reiClick(Sender: TObject);
    procedure mi_fin_fluxoClick(Sender: TObject);
    procedure mi_consulta_parametrizacaoClick(Sender: TObject);
    procedure appMainMessage(var Msg: tagMSG; var Handled: Boolean);
    procedure mi_leitura_arquivos_bshClick(Sender: TObject);
    procedure mi_env_doc_webClick(Sender: TObject);
    procedure mi_carta_configClick(Sender: TObject);
    procedure mi_emissao_documentosClick(Sender: TObject);
    procedure mi_fat_emi_dem_desp_compClick(Sender: TObject);
    procedure mi_cria_variaveisClick(Sender: TObject);
    procedure mi_controle_armazenagemClick(Sender: TObject);
    procedure mi_controle_viagemClick(Sender: TObject);
    procedure mi_fat_emi_nf_fat_novaClick(Sender: TObject);
    procedure mi_fin_rel_rec_liqClick(Sender: TObject);
    procedure integracaoplanBASFClick(Sender: TObject);
    procedure mniPaletizacaoClick(Sender: TObject);
    procedure mi_sda_despClick(Sender: TObject);
    procedure mi_pagto_conf_recibosClick(Sender: TObject);
    procedure img2Click(Sender: TObject);
    procedure FluxodeCaixaOperacional1Click(Sender: TObject);
    procedure mi_fin_saldo_cliClick(Sender: TObject);
    procedure miPaletizacaoClick(Sender: TObject);
    procedure mi_ddeClick(Sender: TObject);
    procedure mi_cad_config_statusClick(Sender: TObject);
    procedure miAcertaTxtClick(Sender: TObject);
    procedure miDCAClick(Sender: TObject);
    procedure miIntegraBASF85Click(Sender: TObject);
    procedure miConsMantraClick(Sender: TObject);
    procedure mniNFFatClick(Sender: TObject);
    procedure miRelDetFaturaClick(Sender: TObject);
    procedure mniContCambioClick(Sender: TObject);
    procedure btn_suporteClick(Sender: TObject);
    procedure NovoControledePISCofinsIRRF1Click(Sender: TObject);
    procedure mi_Instrucao_desembClick(Sender: TObject);
    procedure FaturamentosConsolidados1Click(Sender: TObject);
    procedure mi_rel_icms_suspensoClick(Sender: TObject);
    procedure BtnCorrigirClick(Sender: TObject);
    procedure mnuRelacaodeRetrabalhosClick(Sender: TObject);
    procedure mi_Gera_Arquivo_CrodaClick(Sender: TObject);
    procedure Arquivos1Click(Sender: TObject);
    procedure miDeclaracoesFIESPClick(Sender: TObject);
    procedure miCertificadodeOrigemFIESPClick(Sender: TObject);
    procedure mi_rel_LinhaAzulClick(Sender: TObject);
    procedure mi_out_nfClick(Sender: TObject);
    procedure mi_Gera_txt_BasfClick(Sender: TObject);
    procedure mi_fin_rel_valores_recebClick(Sender: TObject);
    procedure tmrTwitterTimer(Sender: TObject);
    procedure mi_rel_BBPagClick(Sender: TObject);
    procedure mi_rel_valores_pendClick(Sender: TObject);
    procedure wbMyTwitterDocumentComplete(Sender: TObject;
      const pDisp: IDispatch; var URL: OleVariant);
    procedure mi_fin_rel_ref_basfClick(Sender: TObject);
    procedure appMainActivate(Sender: TObject);
    procedure tmrFecharJanelasTimer(Sender: TObject);
    procedure miCadastrodeViagensClick(Sender: TObject);
    procedure Parceiros1Click(Sender: TObject);
    procedure dbg_pendencia_menuDblClick(Sender: TObject);
    procedure dbg_pendencia_menuDrawColumnCell(Sender: TObject;
      const Rect: TRect; DataCol: Integer; Column: TColumn;
      State: TGridDrawState);
    procedure qryPendenciasMenuCalcFields(DataSet: TDataSet);
    procedure qryPendenciasMenuAtendenteCalcFields(DataSet: TDataSet);
    procedure chb_solicitadasClick(Sender: TObject);
    procedure edt_processoExit(Sender: TObject);
    procedure Panel9Click(Sender: TObject);
    procedure Image3Click(Sender: TObject);
    procedure mi_cadastra_dicaClick(Sender: TObject);
    procedure PlanilhaRFUruguaiana1Click(Sender: TObject);
    procedure miTransitTimeClick(Sender: TObject);
    procedure VerQuery1Click(Sender: TObject);
    procedure mi_consulta_produtos_diClick(Sender: TObject);
    procedure miFatoresClick(Sender: TObject);
    procedure miRobosClick(Sender: TObject);
    procedure miLeadTimeClick(Sender: TObject);
    procedure miRelPagamentosAdministrativosClick(Sender: TObject);
    procedure mi_int_gt_nexusClick(Sender: TObject);
    procedure ObjectInspector1Click(Sender: TObject);
    procedure miEtapaProdutoEventoClick(Sender: TObject);
    procedure mi_int_fordClick(Sender: TObject);
    procedure NFeSamsung1Click(Sender: TObject);
    procedure mi_int_bid_nestClick(Sender: TObject);
    procedure mi_rel_exp_co_novoexClick(Sender: TObject);
    procedure DANFEFesto1Click(Sender: TObject);
    procedure tmrBlinkTimer(Sender: TObject);
    procedure miRelatorioBasicoClick(Sender: TObject);
    procedure NotasFiscaisdeEntrada1Click(Sender: TObject);
    procedure SEFAZ1Click(Sender: TObject);
    procedure DIValoresporAdio1Click(Sender: TObject);
    procedure ConsultaLI1Click(Sender: TObject);
    procedure mniExigenciasInmetroClick(Sender: TObject);
    procedure DuplicarLI1Click(Sender: TObject);
    procedure mi_CadUfIcmsOnlineClick(Sender: TObject);
    procedure mi_dde_novoClick(Sender: TObject);	
    procedure CargillTrimestralOperaes1Click(Sender: TObject);
    procedure RelatriodeDespesasBASF1Click(Sender: TObject);
    procedure Numerrios1Click(Sender: TObject);
    procedure NumerriosnoFaturados1Click(Sender: TObject);
    procedure Faturados1Click(Sender: TObject);
    procedure PagamentosCriadosBoleto1Click(Sender: TObject);
    procedure Pagamentosnofaturadoscomnumerrioemaberto1Click(
      Sender: TObject);
    procedure PagamentosnoFaturadosesemNumerrioSolicitado1Click(
      Sender: TObject);
    procedure NumerriosnoFaturados2Click(Sender: TObject);
    procedure ControledeFaturamentoporUsurio1Click(Sender: TObject);
    procedure PadroSISCOSERVDespesasPagas1Click(Sender: TObject);
    procedure FaturadosSaldodeFatura1Click(Sender: TObject);
    procedure FaturadosImportao1Click(Sender: TObject);
    procedure PagamentosnoFaturados1Click(Sender: TObject);
    procedure DespesasPagas1Click(Sender: TObject);
    procedure FaturadosExportao1Click(Sender: TObject);
    procedure FaturadosCEBRACE1Click(Sender: TObject);
    procedure Faturados2Click(Sender: TObject);
    procedure Faturado1Click(Sender: TObject);
    procedure Comisses1Click(Sender: TObject);
    procedure MBASF1Click(Sender: TObject);
    procedure NumerriosnoFaturados3Click(Sender: TObject);
    procedure ProcessodeExportaoItens1Click(Sender: TObject);
    procedure SpedFiscal1Click(Sender: TObject);
    procedure SpedFiscal2Click(Sender: TObject);
    procedure SpedFiscal3Click(Sender: TObject);
    procedure CardinalICF1Click(Sender: TObject);
    procedure GerenciamentodeProcessos1Click(Sender: TObject);
    procedure mnuIntegraoPhilipsClick(Sender: TObject);
    procedure ArmazenagemExpo1Click(Sender: TObject);
    procedure ConfigEnviodeEmails1Click(Sender: TObject);
    procedure Anvisa1Click(Sender: TObject);
    procedure ConsultaMercante1Click(Sender: TObject);
    procedure InstruodeEmbarque1Click(Sender: TObject);
    procedure Faturados3Click(Sender: TObject);
    procedure MBASF2Click(Sender: TObject);
    procedure LIsConsultadasRobo1Click(Sender: TObject);
    procedure PagamentoMercante1Click(Sender: TObject);
    procedure Numerarios1Click(Sender: TObject);
    procedure FaturamentoLI1Click(Sender: TObject);
    procedure mi_dueClick(Sender: TObject);
    procedure MercadoriasExpo1Click(Sender: TObject);
    procedure MercadoriasImportao1Click(Sender: TObject);
    procedure FaturadosComisso1Click(Sender: TObject);
    procedure AFaturar1Click(Sender: TObject);
    procedure Faturados4Click(Sender: TObject);
    procedure DIObservacoesAutomaticas1Click(Sender: TObject);
    procedure PagamentoAFRMM1Click(Sender: TObject);
    procedure FaturadosSemanal1Click(Sender: TObject);
    procedure DIObsAutomaticasParametros1Click(Sender: TObject);
    procedure mitiposdePendenciasClick(Sender: TObject);
    procedure Prometeon1Click(Sender: TObject);
    procedure DespesasPagas2Click(Sender: TObject);
    procedure miWalletSolicitarNumerariosClick(Sender: TObject);
    procedure miWalletCriarPagamentosClick(Sender: TObject);
    procedure Impostos1Click(Sender: TObject);
    procedure miWalletSolicitarPagamentoClick(Sender: TObject);
    procedure AbrirMiniBroker(nomeMenu : String; nr_processo : string = '');
    procedure WalletCadBancoClick(Sender: TObject);
    procedure WalletCadClienteClick(Sender: TObject);
    procedure WalletCadFavorecidoClick(Sender: TObject);
    procedure WalletCadFilialClick(Sender: TObject);
    procedure WalletCadGrupoClick(Sender: TObject);
    procedure WalletCadItemClick(Sender: TObject);
    procedure WalletCadOrganizacaoClick(Sender: TObject);
    procedure WalletCadPaisClick(Sender: TObject);
    procedure WalletCadProdutoClick(Sender: TObject);
    procedure WalletCadServicoClick(Sender: TObject);
    procedure WalletCadUsuarioClick(Sender: TObject);
    procedure WalletTransferenciaPagamentoClick(Sender: TObject);
    procedure IntegrcaoFecomercio1Click(Sender: TObject);    
    procedure Faturados5Click(Sender: TObject);
    procedure walletPreFaturamentoClick(Sender: TObject);
    procedure Numerrios2Click(Sender: TObject);
    procedure DraftBL1Click(Sender: TObject);
    procedure DIeImpostosEASY1Click(Sender: TObject);
    procedure AcordoComercial1Click(Sender: TObject);
    procedure DeclaraodeOrigem1Click(Sender: TObject);
    procedure DescriodeMercadoriaDraft1Click(Sender: TObject);
    procedure ProcessosFaturadosSaldoFaturasemaprovComissaoClick(
      Sender: TObject);
    procedure CertificadodeOrigem1Click(Sender: TObject);
    procedure RelatrioNFsCargil1Click(Sender: TObject);
    procedure IntegracaoSAP1Click(Sender: TObject);
    procedure IntegraoDrawbackIsencao1Click(Sender: TObject);
    procedure FaturadosDespesasHonorarios1Click(Sender: TObject);
    procedure FaturadosHonorarios1Click(Sender: TObject);
    procedure FaturadosHonorarios2Click(Sender: TObject);
    procedure IntegracaoDraftDanfeNestle1Click(Sender: TObject);
    procedure FaturadosDespesas1Click(Sender: TObject);
    procedure Faturados6Click(Sender: TObject);
    procedure FaturadosComissaoExportacao1Click(Sender: TObject);
    procedure AberturadeProcessosNestleDF1Click(Sender: TObject);
    procedure AberturadeProcessosNestleLean1Click(Sender: TObject);
    procedure Booking1Click(Sender: TObject);
    procedure FaturadosImportacaosgbClick(Sender: TObject);
    procedure FaturadosExportacaoSgbClick(Sender: TObject);
    procedure ApoloItensExportao1Click(Sender: TObject);
    procedure NestleIntegraoLotesItensExportao1Click(Sender: TObject);
    procedure EssityClick(Sender: TObject);
    procedure ExtratorDadosSiscomex1Click(Sender: TObject);
    procedure NexansDraftNF1Click(Sender: TObject);
    procedure SolicNumerrio1Click(Sender: TObject);
    procedure Faturados7Click(Sender: TObject);
    procedure FaturadosExportaointegra1Click(Sender: TObject);
    procedure Faturados8Click(Sender: TObject);
    procedure LogManager1Click(Sender: TObject);
    procedure Anvisa2Click(Sender: TObject);
    procedure GerarxmlNFe1Click(Sender: TObject);


  private
    FFecomercio: HWND;
    FMensagens: array of String;
    FIndiceMensagem: Integer;
    FDataLeituraTwitter: TDateTime;
    function TempoDecorridoExtenso(Minuto: Integer): String;
    function GetMyPagamentoMercantePath: string;
  protected
    { Protected declarations }
  public
    { Public declarations }
    vMostrouInatividade : Boolean;
    vCloserTimeout : Integer;
    flag_analista : String;
    qtde_pendencias : Integer;
    procedure MyException(Sender: TObject; E: Exception);
    procedure ReiniciaCloser;
    procedure KickUser;
    procedure UserUp;

  end;

  function StartupSystem: Boolean; stdcall;
  function GetLoginName: PWideChar;    stdcall;
  function GetPassword: PWideChar;     stdcall;
  function GetUserCode: PWideChar;     stdcall;
  function GetUserName: PWideChar;     stdcall;
  function GetUserEmail: PWideChar;    stdcall;
  function GetCargoCode: PWideChar;    stdcall;
  function GetCargoName: PWideChar;    stdcall;


var
  frm_main: Tfrm_main;
  vLogado: Boolean = False;
  vInDigitalizacao: Boolean = False;

implementation

uses GSMLIB, PGGP003, PGGP005, PGGP017, PGGP018, PGGP027, PGGP029, PGGP037,
  PGGP039, PGGP043, PGGP047, PGGP048, PGGP051, PGGP053, PGGP055, PGGP057,
  PGGP059, PGGP061, PGGP065,
  PGSM001, PGSM002, PGSM004, PGSM006, PGSM010, PGSM011, PGSM012, PGSM014,
  PGSM015, PGSM016, PGSM018, PGSM019, PGSM022, PGSM024, PGSM027,
  PGSM028, PGSM029, PGSM034, PGSM036, PGSM041, PGSM044, PGSM046,
  PGSM048, PGSM051, PGSM054, PGSM056, PGSM059, PGSM061, PGSM064,
  PGSM079, PGSM081, PGSM085,
  PGSM088, PGSM090, PGSM091, PGSM093, PGSM097, PGSM101, PGSM103,
  PGSM117, PGSM119, PGSM121, PGSM126, uAg,
  PGSM130, PGSM132, PGSM134, PGSM136, PGSM138, PGSM142, PGSM149, PGSM151,
  PGSM153, PGSM155, PGSM157, PGSM160, PGSM162, PGSM164, PGSM166, PGSM168,
  PGSM170, PGSM172, PGSM174, PGSM176, PGSM178, PGSM180, PGSM182, PGSM184,
  PGSM185, PGSM186, PGSM190, PGSM192, PGSM194, PGSM196, PGSM198, PGSM990,
  PGSM200, PGSM202, PGSM204, PGSM206, PGSM208, PGSM210, PGSM212, PGSM216,
  PGSM218, PGSM238, PGSM240, PGSM244, PGSM246, PGSM248, PGSM250, PGSM252,
  PGDI003, PGDI014, PGDI023,
  PGDI025, PGDI026, PGDI029, PGDI036, PGDI038, PGDI040, PGDI044, PGDI050,
  PGNM001, PGNM003, PGNM021, PGNM023, PGCH009, PGCH012, PGCH014,
  PGCH016, PGCH021, PGCH029, PGCH032, PGCH038, PGCH044, PGSD002, PGSD011,
  PGSD013, PGSD015, PGSD017, PGFI001, PGFI011, PGFI013, PGFI017, PGFI019,
  PGFT001, PGFT003, PGFT005, PGFT009, PGFT013, PGFT019, PGFT021,
  PGFT023, PGFT025, PGFT027, PGFT031, PGFT049,
  PGLQ007, PGLQ010, PGGA003, PGGA007,
  PGGA013, PGGA023, PGGA025,
  PGES001, PGES003, PGLI002, PGLI007,
  PGPG001, PGPG003, PGPG005, PGPG007, PGPG011, PGPG013, PGPG015, PGPG017,
  PGPG019, PGPG021, PGPG023, PGPG025, PGPG027, PGPG029,
  PGPE002, PGPE007, PGPE011, PGPE013, PGPE015, PGPE018, PGPE025, PGPE027,
  PGPE031, PGPE033, PGPE035, PGPE037, PGPE039, PGPE041, PGPE043,
  PGPE047, PGPE049, PGPE051, PGPO001, PGPO003, PGPO005, PGPO007,
  PGPO011, PGPO016, PGPO018, PGBF001, PGBF003, PGIN001, PGRE002,
  PGRE004, PGDE001, PGDE003, PGEN001, PGEN003, PGCH036,
  uCadNcmPisCofins, PGPO023, PGGP067, uFreteServ,
  uNotificador, uPortos, uVendedores, PGSM290, uModDoc,
  uProcComerc, uProposta, uCotacao, uAgendaComercial, uPedidoInstrucao,
  uGrupoPortos, uRelatoriosMailAut, PGSM300, uFaturaComercial2,
  uPackingList2, uTaxaSelic, PGSM292, uCentroCusto,
  PGGP011, PGGP013, PGCH018, PGFI009, uCadItensAvancado, PGSM275, PGSM295,
  PGPG019_OLD, PGPG029_OLD, uInstrucaoEmbarque, uExpCalcProfit,
  uExpProfitMarit, uCalcProfit, uProfitMaritimo, uCtrlDemurrage,
  uRetificador, uProcIata, uEmissaoRemessa, uAccount, uGerarRemessa,
  uEmissaoFatura, uLibAccount, uDispRemessa, uFaturaComplementar, uRelIntegradoDrawback,
  uRelProcessosCAT63, uBancoItl, uIntegracaoBSH, Uimp_rd, uConciliacao,
  uExpMontaRe, uReCapa, dReCapa, uNewTrataErros, uCatalogoEnderecos,
  uIntegraDem, uParametrizacao, uFollowUp, uBSHIntegracaoDI,
  UintegracaoWEB, uCartaConfig, uEmissaoDocumentos, uCriaVariaveis,
  uArmazenagem, uControleViagem, uEtapa, uPedidosAbertosBASF, uPaletizacao,
  uGestaoPedido, pgpe045, PGGA011, uPackingList, uDDE, dDDE,
  uCadConfigStatus, uAcertaTxtNF, uDCA, uIntegraBASF85, uConsultaMantra,
  PGPE029, uContCambio, uRetencaoPorEmpresa, uInstrucaoDesembaraco,
  uConserta, uRelRetrabalho, uArquivoCroda, uDigitalizacao,
  uDeclaracoes_Fiesp, uSistema_Cool, uIntegraNotaBasf, uRelBBPag, IniFiles, FileCtrl,
  uControleRecibo, usemaforico, upendencias, Variants,
  uSistemas_Cadastro_Sugestao, uSistemas_Dicas, UTransit_Time, mySplash,
  uVer_query, Mensagens, uconsulta_di_merc, uFatores, uRobos, ULead_Time,
  uRel_Pag_Adm, uIntNexus, ObjectInspector, uEtapaProdutoEvento,
  uIntFORDExp, uNfeSamsung, uBidNestle, uCONovoEx, uNfeFesto, DelRun,
  uRelatorioBasico, uIntegracaoPoSystem,
  OiValorPorAdicao, uConsultaLI, uConsultaIntegracaoSAPCargil, uConsultaNFsCargil, uConsultaExigenciaInmetro, uDuplicaLi,
  uCadUfIcmsOnLine, dDDENovo, uDDENovo, uCargillTrimestralOperacoes,
  FrDespesasBASF, FrNumerariosBASF, FrNumerariosNaoFaturados,
  frFaturadosNestle, FrConsultaPagamentosWalletCtx, uConsulta, 
  FrControleFaturamentoUsuarioCtx, FrmSISCOSERVDespesasPagasCtx,
  FrmFaturadosSaldoFaturaCtx, FrmCargilFaturadoImportacaoCtx, 
  FrmPagamentosNaoFaturadosCtx, FrmRelDespesasPagasCtx,FrmRelDespesasPagasCtxSG,
  FrmRlCargilFaturadosExportacaoCtx, FrmRlFaturadosCEBRACECtx,
  FrmRLFirmenichFaturadosCtx, FrmRlWhirlpoolFaturadosCtx,
  FrmRlBASFComissoesCtx, FrmRlTM_BASFCtx, FrmProcessoExportacaoItensCtx, 
  FrmSaintGobainSpedFiscalCtx, FrmSaintCBESpedFiscalCtx,
  FrmFirmenichSpedFiscalCtx, FrmCardinalICF, FrGerenciamentoDeProcessos,
  frmIntegracaoPhilips, FrmRlBASFArmazenagemExpoCtx, KrGlobal,
  uConfigurarEnvioArquivosEmail, FrAnvisa, UConsultaMercante,
  URelProgramacaoRodoviariaNestlePOR, URelatoriosNestle,
   URlPhilipsFaturadosCtx, URelatorioLIs, KrUtil, FrNumerariosNestle,
  URelFaturamentoLIs, uRelatorioMercadorias,
  FrmRlWhirlpoolFaturadosComissoesCtx, FrmRlWhirlpoolAFaturarCtx,
  FrFaturadosMattel, FrmRlBASFPagmtoAFRMM, uRelPagamentoAFRMM,

  frFaturadosNestleSemanal, UCadPendenciasProc, uPrometeonEDI, FrDespesasClienteBASF, ExternalApplication, FrmRlYaraFaturadosComissoesCtx, FrNumerariosYara,
  FerreroDIeImpostosEASY, CdAcorodoComercial, CdDeclarcaoOrigem, FrmFaturadosSaldoFaturaCtxAprovComissao, uIntegracaoNotaNexans, uIntegracaoNumerarioMattel,
  FrmRlPrometeonFaturadosDespesasHonorariosCtx, FrmRlPrometeonFaturadosHonorariosCtx, FrmRlPirelliFaturadosHonorariosCtx, uIntegracaoNotaNestle, uIntegracaoNotaEssity,
  FrmRlRousselotFaturadosDespesasCtx, FrmRlWhirlpoolFaturadosComissoesExpCtx, FrmRlFerreroFaturadosCtx, uIntegracaoAberturaProcessoNestle, uIntegracaoAberturaProcessoNestleLean,
  uIntegracaoBookingInttra, FrmRlSaintGobainFaturadosCtx, FrmIntegracaoApolo, FrmIntegracaoNestleExpItemLote, FrFaturadosHusqvarna, FrmRlFerreroFaturadosExpoCtx,
  FrmRLPrimientFaturadosCtx, frAnvisaNestle ;

  //Mensagens, uDesabilitaSistema;

const
  _TECLAS_SHORTCUT = ['a','b','d','e','f','g','h','i','j','k','l','m','n','o','p',
     'q','r','s','t','u','v','w','x','y','z','A','B','D','E','F','G','H','I','J',
     'K','L','M','N','O','P','Q','R','S','T','U','V','W','X','Y','Z','0','1','2',
     '3','4','5','6','7','8','9'];

var
  vScriptTwitter    : String    = '';
  str_cd_usuario_old: String[4] = '';

{$R *.DFM}
  Procedure AbreFormLaudo(hAplicacao : THandle; pBase : TDataBase; pStr_cd_cargo : String ); stdcall; external 'Drawback.dll';
  Procedure AbreFormForecast(hAplicacao : THandle; pBase : TDataBase; pStr_cd_cargo, pStr_cd_usuario : String; pTpDrawBack :TTipoDrawBack); stdcall; external 'Drawback.dll';
  Procedure AbreFormAtoConcess(hAplicacao : THandle; pBase : TDataBase; pStr_cd_cargo, pStr_cd_usuario : String; pTpDrawBack :TTipoDrawback ); stdcall; external 'Drawback.dll';
  Procedure AbreFormConsultaDB(hAplicacao : THandle; pBase : TDataBase; pStr_cd_cargo, pStr_cd_usuario, pStr_cd_rotina : String ); stdcall; external 'Drawback.dll';
  Procedure AbreFormMensagemErro(hAplicacao : THandle; pBase : TDataBase; pStr_cd_cargo, pStr_cd_usuario, pStr_cd_rotina : String ); stdcall; external 'Drawback.dll';

  function StartupSystem: Boolean;  external 'C:\ddbroker\MyLoginInt.dll';
  function GetLoginName: PWideChar; external 'C:\ddbroker\MyLoginInt.dll';
  function GetPassword: PWideChar;  external 'C:\ddbroker\MyLoginInt.dll';
  function GetUserCode: PWideChar;  external 'C:\ddbroker\MyLoginInt.dll';
  function GetUserName: PWideChar;  external 'C:\ddbroker\MyLoginInt.dll';
  function GetUserEmail: PWideChar; external 'C:\ddbroker\MyLoginInt.dll';
  function GetCargoCode: PWideChar; external 'C:\ddbroker\MyLoginInt.dll';
  function GetCargoName: PWideChar; external 'C:\ddbroker\MyLoginInt.dll';


procedure Tfrm_main.MyException(Sender: TObject; E: Exception);
begin
  if Pos('Key violation', E.Message) > 0 then
  begin
    MessageDlg('Já existe um processo com esta referência!!!', mtError, [mbOk], 0);
  end;
  if Pos('not a valid date', E.Message) > 0 then
  begin
    with Sender as TDbEdit do
    begin
      Field.Clear;
    end;
    MessageDlg('Você digitou uma data inválida!!!', mtError, [mbOk], 0);
  end;
  if Pos('invalid input value', E.Message) > 0 then
  begin
    with Sender as TDbEdit do
    begin
      Field.Clear;
    end;
    MessageDlg('Digitação inválida!!! Use a Tecla ESC para cancelar', mtError, [mbOk], 0);
  end;
end;

procedure Tfrm_main.mi_saidaClick(Sender: TObject);
begin
  Close;
end;

procedure Tfrm_main.FormShow(Sender: TObject);
var nomemaquina :string;
begin
//  pnl_toolbar.Color := clMenuBroker;
  panel2.Color := clPnlClaroBroker;
//  panel4.Color := clPnlClaroBroker;

  with datm_main do
  begin
    ameses[1] := 'Janeiro';
    ameses[2] := 'Fevereiro';
    ameses[3] := 'Marco';
    ameses[4] := 'Abril';
    ameses[5] := 'Maio';
    ameses[6] := 'Junho';
    ameses[7] := 'Julho';
    ameses[8] := 'Agosto';
    ameses[9] := 'Setembro';
    ameses[10] := 'Outubro';
    ameses[11] := 'Novembro';
    ameses[12] := 'Dezembro';

    //Parametros
    tbl_parametro_.Open;
    cDir_Risc := AllTrim(tbl_parametro_PATH_RISC.AsString);
    cDir_Contab := AllTrim(tbl_parametro_PATH_CONTABIL.AsString);
    cDir_cb_aut_imp := AllTrim(tbl_parametro_PATH_COB_AUT_IMP.AsString);
    cDir_cb_aut_trans := AllTrim(tbl_parametro_PATH_COB_AUT_TRANS.AsString);
    str_nm_servidor := AllTrim(tbl_parametro_NM_SERVIDOR.AsString);
    vl_minimo_ted := tbl_parametro_VL_MINIMO_TED.AsFloat;
    str_cd_sda := tbl_parametro_CD_ITEM_SDA.AsString;
    str_cd_receb := tbl_parametro_CD_ITEM_RECEB_NUM.AsString;
    str_cd_devol := tbl_parametro_CD_ITEM_DEVOL_NUM.AsString;
    str_cd_extor := tbl_parametro_CD_ITEM_EXTOR_NUM.AsString;
    str_cd_ir := tbl_parametro_CD_ITEM_IR.AsString;
    str_cd_sd_cre := tbl_parametro_CD_ITEM_SALDO_CRE.AsString;
    str_cd_sd_deb := tbl_parametro_CD_ITEM_SALDO_DEB.AsString;
    str_cd_rc_sd := tbl_parametro_CD_ITEM_RECEB_SD.AsString;
    str_cd_pg_sd := tbl_parametro_CD_ITEM_PAGTO_SD.AsString;
    str_cd_ev_reg_di := tbl_parametro_CD_EV_REG_DI.AsString;
    str_cd_ev_pagto_li := tbl_parametro_CD_EV_PAGTO_LI.AsString;
    str_cd_ev_desemb := tbl_parametro_CD_EV_DESEMB.AsString;
    str_cd_ev_ent := tbl_parametro_CD_EV_ENT.AsString;
    str_cd_ev_ent_setpin := tbl_parametro_CD_EV_ENT_SETPIN.AsString;
    str_cd_ev_sai_setpin := tbl_parametro_CD_EV_SAI_SETPIN.AsString;
    str_cd_ev_descarga := tbl_parametro_CD_EV_DESCARGA.AsString;
    str_cd_ev_chegada := tbl_parametro_CD_EV_CHEGADA.AsString;
    str_cd_moeda_corrente := tbl_parametro_CD_MOEDA_CORRENTE.AsString;

    str_cd_ev_abre_proc := tbl_parametro_CD_EV_ABRE_PROC.AsString;
    str_nm_cidade := tbl_parametro_NM_CID_CHEQUE.AsString;

    str_cd_grp_item_arm := tbl_parametro_CD_GRP_ITEM_ARM.AsString;
    str_cd_grp_item_cap := tbl_parametro_CD_GRP_ITEM_CAP.AsString;
    str_cd_grp_item_frete := tbl_parametro_CD_GRP_ITEM_FRETE.AsString;
    str_cd_item_nao_fat := tbl_parametro_CD_ITEM_NAO_FAT.AsString;
    str_cd_item_receb_num := tbl_parametro_CD_ITEM_RECEB_NUM.AsString;
    str_cd_item_extor_num := tbl_parametro_CD_ITEM_EXTOR_NUM.AsString;
    str_cd_item_devol_num := tbl_parametro_CD_ITEM_DEVOL_NUM.AsString;
    str_cd_item_icms := tbl_parametro_CD_ITEM_ICMS.AsString; //Rodrigo
    str_cd_item_ii := tbl_parametro_CD_ITEM_II.AsString; //Rodrigo
    str_cd_item_ipi := tbl_parametro_CD_ITEM_IPI.AsString; //Rodrigo
    str_cd_item_cpmf := tbl_parametro_CD_ITEM_CPMF.AsString; //Rodrigo
    str_cd_item_afrmm := tbl_parametro_CD_ITEM_AFRMM.AsString; //Rodrigo
    str_cd_item_sda := tbl_parametro_CD_ITEM_SDA.AsString; //Rodrigo
    str_cd_item_siscomex := tbl_parametro_CD_ITEM_SISCOMEX.AsString; //Rodrigo
    str_cd_item_comissao := tbl_parametro_CD_ITEM_COMISSAO.AsString;
    str_cd_item_iss := tbl_parametro_CD_ITEM_ISS.AsString;
    str_cd_item_ext_receb := tbl_parametro_CD_ITEM_EXT_RECEB.AsString;
    str_cd_item_ext_pagto := tbl_parametro_CD_ITEM_EXT_PAGTO.AsString;
    str_cd_item_pago_cli := tbl_parametro_CD_ITEM_PAGO_CLI.AsString;
    str_cd_item_demurrage := tbl_parametro_CD_ITEM_DEMURRAGE.AsString;

    vCloserTimeout := tbl_parametro_VL_AUTOCLOSER.AsInteger;
    vQtdeDiasConsProc := tbl_parametro_NR_DIAS_CONS_PROC.AsInteger;

    tbl_parametro_.Close;
    // alteração para trazer a senha do usuário (identificação de locks) ao invés de SA
    str_nm_admin := str_ap_usuario;
    str_nm_senha := str_senha_usuario;
    str_nr_processo := str_proc_zeros;
    try
      CloseStoredProc(sp_data_hora_server);
      ExecStoredProc(sp_data_hora_server);
      dt_server := sp_data_hora_server.ParamByName('@dt_nt_server').AsDateTime;
      hr_server := dt_server;
      dt_server := StrToDate(DateToStr(dt_server));
      CloseStoredProc(sp_data_hora_server);
    except
      on E: Exception do
      begin
        TrataErro(E);
        dt_server := Date;
        hr_server := Time;
      end;
    end;
    str_cd_coligada := '01'; //código da coligada padrão S.Magalhaes
  end;
  vVeioAbertura := False;
  Caption := Caption + ' ' + nr_versao;
  nomemaquina := GetLocalComputerName;
  lblNmServidor.caption := nomemaquina;
end;

procedure Tfrm_main.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = 27 then Close;
end;

procedure Tfrm_main.FormClose(Sender: TObject; var Action: TCloseAction);
var
  Handle: THandle;
begin
  if in_aviso_po = '1' then
  begin
    Handle := frm_lembrete_po.Handle;
    if Handle > 0 then
    begin
      frm_lembrete_po.Close;
      frm_lembrete_po.Free;
    end;
  end;
  CloseExternalApp(FFecomercio);

  crp_main.Free;
  Action := caFree;
end;

procedure Tfrm_main.Cds(Sender: TObject);
var
  i_Pos_Btn: Integer;
  vIni: TIniFile;
begin

  if VersaoTeste then
    nr_versao := nr_versao_teste;
  Image1.Left := frm_main.Width - 20 - Image1.Width;
  Img2.Left   := frm_main.Width - 37 - Img2.Width;
  Lbl2.Left   := frm_main.Width - 40 - Lbl2.Width;
  //Label5.Left := frm_main.Width - Image1.Width - 35 - Label5.Width;
  //Lbl1.Left   := frm_main.Width - Image1.Width - 35 - Lbl1.Width;
  Panel4.Top  := Panel1.Height - 32;

  // Acertar o MyTwitter na tela - Michel
  pnlMyTwitter.Top        := Panel1.Height - 196;
  pnlMyTwitter.Left       := Panel1.Width - 315;
  pnlSombraMyTwitter.Top  := Panel1.Height - 190;
  pnlSombraMyTwitter.Left := Panel1.Width - 309;

  //Acertar o Botão Visualizar/Atualizar Pendências na tela - Guilherme
  pnl_borda_atualiza.Left := Panel1.Width - 207;

  i_Pos_btn   := btn_about.Left;
  i_pos_btn   := i_pos_btn + 40;
//  btn_sair.Left := i_pos_btn;
  Screen.Cursor := crHourGlass;
  Application.ProcessMessages;
  lControleAcesso := False;
  vCriarSession := True;
  in_aviso_po := '0';

  vIni := TIniFile.Create(ExtractFilePath(Application.ExeName) + 'CONFIG.INI');
  FDataLeituraTwitter := vIni.ReadDateTime('TWITTER', 'ULTIMA_LEITURA', 0); // Se não houver data como como 31/12/1900 - Michel - 19/08/2009
  vIni.Free;

  if FileExists(vXMLTwitter) then
  begin
    if (FileDateToDateTime(FileAge(vXMLTwitter)) <= FDataLeituraTwitter) then
      wbMyTwitter.Navigate(vHTMLTwitter)
    else
      tmrTwitterTimer(tmrTwitter); // Inicia o form com as mensagens - Michel - 08/07/2009    ,
  end;

  lblTesting.Top := -8;
  lblTesting.Left := 0;
  lblTesting.Width := lblTesting.Parent.ClientWidth;
  lblTestingSombra.Top := lblTesting.Top +3;
  lblTestingSombra.Left := lblTesting.Left +3;
  lblTestingSombra.Width := lblTesting.Width;
end;

procedure Tfrm_main.btn_aboutClick(Sender: TObject);
begin
  UserUp;
  ReiniciaCloser;
  Application.CreateForm(Tdlg_about, dlg_about);
  dlg_about.ShowModal;
  KickUser;
end;

procedure Tfrm_main.FormActivate(Sender: TObject);
var
  vStringList: TStrings;
  I, qtde_atendente: Integer;
  Arquivo : String;
begin
  if vLogado then // Se estiver logado não passa mais por aqui - Michel - 06/04/2011
    Exit;
  Application.ProcessMessages;
  //if in_aviso_po = '0' then  // if trocado porque fazia ir para a tela de login em algumas transições de tela - Michel - 01/12/2008

{  if not vLogado then
  begin
    Application.CreateForm(Tfrm_senha, frm_senha);
    frm_senha.ShowModal;
  end; // Utilizando o MyLogin - Michel - 30/10/2009}

  Application.ProcessMessages;
  //if not (lControle_Acesso) then Application.Terminate; // comentado por Michel por causa do MyLogin - 30/10/2009
   // alteração para trazer a senha do usuário (identificação de locks) ao invés de SA
    str_nm_admin := str_ap_usuario;
    str_nm_senha := str_senha_usuario;

  if vLogado then
  begin
    pnl_borda_atualiza.Visible := True;
    {
    if flag_analista = '' then
    begin
        with TQuery.Create(application) do
        begin
          Databasename := 'DBBROKER';
          SQL.Clear;
          SQL.Add(' SELECT COUNT(CD_ATENDENTE) AS CONT_ATENDENTE FROM TCLIENTE_HABILITACAO WHERE CD_ATENDENTE = :CD_ATENDENTE');
          SQL.Add(' OR CD_ATENDENTE IN (SELECT CD_USUARIO FROM TUSUARIO WHERE CD_CHEFIA = :CD_ATENDENTE)');
          ParamByName('CD_ATENDENTE').AsString := str_cd_usuario;
          Open;
          qtde_atendente := FieldByName('CONT_ATENDENTE').asInteger;

          if qtde_atendente > 0 then
            flag_analista := str_cd_usuario;
          Close;
          Free;
        end;
    end;
    if flag_analista <> '' then
    begin
      dsPendenciasMenu.DataSet := qryPendenciasMenuAtendente;
      qryPendenciasMenuAtendente.Close;
      qryPendenciasMenuAtendente.ParamByName('CD_ATENDENTE').AsString := str_cd_usuario;
      qryPendenciasMenuAtendente.Open;
      qtde_pendencias :=  qryPendenciasMenuAtendente.RecordCount;
    end
    else
    begin
      dsPendenciasMenu.DataSet := qryPendenciasMenu;
      qryPendenciasMenu.Close;
      qryPendenciasMenu.ParamByName('CD_USUARIO_CRIADOR').AsString := str_cd_usuario;
      qryPendenciasMenu.Open;
      qtde_pendencias :=  qryPendenciasMenu.RecordCount;
    end;
    if qtde_pendencias > 0 then
    begin
      pnl_pendencias_principal_menu.Visible := True;
      pnl_pendencias_principal_menu.Width  := pnlMyTwitter.Left - pnl_pendencias_principal_menu.Left - 10;
      pnl_pendencias_principal_menu.Height := Panel4.Top - pnl_pendencias_principal_menu.Top - 10;
    end;
    }
  end;

  if str_cd_cargo = '001' then
  begin             
    BtnCorrigir.Visible := True;
    Panel4.Visible := True;
    vStringList := TStringList.Create;
    try
      datm_main.db_broker.Session.GetAliasParams('DBBROKER', vStringList);
      // database
      Label4.Caption := copy(vStringList.Strings[0], Pos('=', vStringList.Strings[0]) + 1, 20);
      // server
      Label2.Caption := copy(vStringList.Strings[1], Pos('=', vStringList.Strings[1]) + 1, 20);
    finally
      vStringList.Free;
    end;
  end;
//  Application.CreateForm(Tfrm_sistemas_dicas, frm_sistemas_dicas);
//  frm_sistemas_dicas.ShowModal;
//  FreeAndNil(frm_sistemas_dicas);
end;

procedure Tfrm_main.mi_abertura_processoClick(Sender: TObject);
begin
  UserUp;
  ReiniciaCloser;
  if not VerIntegridade then Exit;
  vstr_cd_modulo := '01';
  str_cd_rotina := '0101';
  str_cd_mod := vstr_cd_modulo;
  str_cd_rot := str_cd_rotina;
  Application.CreateForm(Tfrm_abre_proc, frm_abre_proc);
  frm_abre_proc.ShowModal;
  VerAtalho;
  KickUser;
end;

procedure Tfrm_main.mi_manutencao_processoClick(Sender: TObject);
begin
  UserUp;
  ReiniciaCloser;

  if not VerIntegridade then
    Exit;

  vstr_cd_modulo := '01';
  str_cd_rotina := '0102';
  str_cd_mod := vstr_cd_modulo;
  str_cd_rot := str_cd_rotina;

  // Application.CreateForm(Tfrm_manut_proc, frm_manut_proc);
  frm_manut_proc.pesq_cd_unid_neg := Copy(nr_processo_gestao, 1, 2);
  frm_manut_proc.pesq_cd_prod     := Copy(nr_processo_gestao, 3, 2);
  // frm_manut_proc.pesq_nr_proc := nr_processo_gestao;

  frm_manut_proc.ShowModal;
  VerAtalho;
  KickUser;
end;

procedure Tfrm_main.mi_cancelamento_processoClick(Sender: TObject);
begin
  UserUp;
  ReiniciaCloser;
  if not VerIntegridade then Exit;
  vstr_cd_modulo := '01';
  str_cd_rotina := '0104';
  str_cd_mod := vstr_cd_modulo;
  str_cd_rot := str_cd_rotina;
  Application.CreateForm(Tfrm_canc_proc, frm_canc_proc);
  frm_canc_proc.ShowModal;
  KickUser;
end;

procedure Tfrm_main.mi_aplicabilidade_eventoClick(Sender: TObject);
begin
//  UserUp;
//  ReiniciaCloser;
//  if not VerIntegridade then Exit;
//  vstr_cd_modulo := '01';
//  str_cd_rotina := '0105';
//  str_cd_mod := vstr_cd_modulo;
//  str_cd_rot := str_cd_rotina;
//  Application.CreateForm(Tfrm_proc_aplic, frm_proc_aplic);
//  frm_proc_aplic.ShowModal;
//  KickUser;
end;

procedure Tfrm_main.mi_realizacao_eventoClick(Sender: TObject);
begin
  UserUp;
  ReiniciaCloser;
  if not VerIntegridade then Exit;
  vstr_cd_modulo := '01';
  str_cd_rotina := '0106';
  str_cd_mod := vstr_cd_modulo;
  str_cd_rot := str_cd_rotina;
  Application.CreateForm(Tfrm_evento_realizacao, frm_evento_realizacao);
  frm_evento_realizacao.ShowModal;
  KickUser;
end;

procedure Tfrm_main.mi_inspecao_eventoClick(Sender: TObject);
begin
//  UserUp;
//  ReiniciaCloser;
//  if not VerIntegridade then Exit;
//  vstr_cd_modulo := '01';
//  str_cd_rotina := '0107';
//  str_cd_mod := vstr_cd_modulo;
//  str_cd_rot := str_cd_rotina;
//  Application.CreateForm(Tfrm_evento_inspec, frm_evento_inspec);
//  frm_evento_inspec.ShowModal;
//  KickUser;
end;

procedure Tfrm_main.mi_liberacao_processoClick(Sender: TObject);
begin
  UserUp;
  ReiniciaCloser;
  if not VerIntegridade then Exit;
  vStr_cd_modulo := '01';
  str_cd_rotina := '0108';
  str_cd_mod := vStr_cd_modulo;
  str_cd_rot := str_cd_rotina;
  Application.CreateForm(Tfrm_lib_proc, frm_lib_proc);
  frm_lib_proc.ShowModal;
  KickUser;
end;

procedure Tfrm_main.mi_pesquisa_processoClick(Sender: TObject);
begin
  UserUp;
  ReiniciaCloser;
  if not VerIntegridade then Exit;
  vStr_cd_modulo := '01';
  str_cd_rotina := '0109';
  str_cd_mod := vStr_cd_modulo;
  str_cd_rot := str_cd_rotina;
  Application.CreateForm(Tfrm_pesq_proc, frm_pesq_proc);
  frm_pesq_proc.Tag := 3;
  frm_pesq_proc.ShowModal;
  VerAtalho;
  KickUser;
end;

procedure Tfrm_main.mi_realizacao_processoClick(Sender: TObject);
begin
  UserUp;
  ReiniciaCloser;
  if not VerIntegridade then Exit;
  vStr_cd_modulo := '01';
  str_cd_rotina := '0110';
  str_cd_mod := vStr_cd_modulo;
  str_cd_rot := str_cd_rotina;
  Application.CreateForm(Tfrm_followup, frm_followup);
  frm_followup.pesq_cd_unid_neg := cd_unid_neg_gestao;
  frm_followup.pesq_cd_prod     := cd_prod_gestao;
  frm_followup.pesq_nr_proc     := nr_processo_gestao;
  frm_followup.ShowModal;
  VerAtalho;
  KickUser;
end;

procedure Tfrm_main.mi_realizacao_veiculoClick(Sender: TObject);
begin
//  UserUp;
//  ReiniciaCloser;
//  if not VerIntegridade then Exit;
//  vStr_cd_modulo := '01';
//  str_cd_rotina := '0116';
//  str_cd_mod := vStr_cd_modulo;
//  str_cd_rot := str_cd_rotina;
//  Application.CreateForm(Tfrm_veiculo_realizacao, frm_veiculo_realizacao);
//  frm_veiculo_realizacao.ShowModal;
//  KickUser;
end;

procedure Tfrm_main.mi_inspecao_processoClick(Sender: TObject);
begin
//  UserUp;
//  ReiniciaCloser;
//  if not VerIntegridade then Exit;
//  vStr_cd_modulo := '01';
//  str_cd_rotina := '0111';
//  str_cd_mod := vStr_cd_modulo;
//  str_cd_rot := str_cd_rotina;
//  Application.CreateForm(Tfrm_proc_inspec, frm_proc_inspec);
//  frm_proc_inspec.ShowModal;
//  KickUser;
end;

procedure Tfrm_main.mi_relacao_nao_realizacaoClick(Sender: TObject);
begin
//  UserUp;
//  ReiniciaCloser;
//  if not VerIntegridade then Exit;
//  vStr_cd_modulo := '01';
//  str_cd_rotina := '0112';
//  str_cd_mod := vStr_cd_modulo;
//  str_cd_rot := str_cd_rotina;
//  Application.CreateForm(Tfrm_imp_eventos_nao_realizados, frm_imp_eventos_nao_realizados);
//  frm_imp_eventos_nao_realizados.str_cd_relatorio := '1';
//  frm_imp_eventos_nao_realizados.ShowModal;
//  KickUser;
end;

procedure Tfrm_main.mi_relacao_nao_inspecaoClick(Sender: TObject);
begin
  UserUp;
  ReiniciaCloser;
  if not VerIntegridade then Exit;
  vStr_cd_modulo := '01';
  str_cd_rotina := '0113';
  str_cd_mod := vStr_cd_modulo;
  str_cd_rot := str_cd_rotina;
  Application.CreateForm(Tfrm_rel_proc_pend, frm_rel_proc_pend);
  frm_rel_proc_pend.ShowModal;
  KickUser;
end;

procedure Tfrm_main.mi_espelho_processoClick(Sender: TObject);
begin
  UserUp;
  ReiniciaCloser;
  if not VerIntegridade then Exit;
  vStr_cd_modulo := '01';
  str_cd_rotina := '0114';
  str_cd_mod := vStr_cd_modulo;
  str_cd_rot := str_cd_rotina;
  Application.CreateForm(Tfrm_sel_processo, frm_sel_processo);
  frm_sel_processo.str_cd_relatorio := '2';
  frm_sel_processo.ShowModal;
  KickUser;
end;

procedure Tfrm_main.mi_relacao_realizadosClick(Sender: TObject);
begin
//  UserUp;
//  ReiniciaCloser;
//  if not VerIntegridade then Exit;
//  vStr_cd_modulo := '01';
//  str_cd_rotina := '0115';
//  str_cd_mod := vStr_cd_modulo;
//  str_cd_rot := str_cd_rotina;
//  Application.CreateForm(Tfrm_imp_eventos_nao_realizados, frm_imp_eventos_nao_realizados);
//  frm_imp_eventos_nao_realizados.str_cd_relatorio := '2';
//  frm_imp_eventos_nao_realizados.ShowModal;
//  KickUser;
end;

procedure Tfrm_main.mi_diClick(Sender: TObject);
begin
  UserUp;
  ReiniciaCloser;
  if not VerIntegridade then Exit;
  vStr_cd_modulo := '02';
  str_cd_rotina := '0201';
  str_cd_mod := vStr_cd_modulo;
  str_cd_rot := str_cd_rotina;
  Application.CreateForm(Tfrm_DI, frm_DI);
  frm_DI.pesq_cd_unid_neg := cd_unid_neg_gestao;
  frm_DI.pesq_nr_processo := Trim(Copy(nr_processo_gestao, 5, 14));
  frm_DI.ShowModal;                        
  VerAtalho;
  KickUser;
end;

procedure Tfrm_main.mi_previsaoClick(Sender: TObject);
begin
  UserUp;
  ReiniciaCloser;
  if not VerIntegridade then Exit;
  vStr_cd_modulo := '02';
  str_cd_rotina := '0204';
  str_cd_mod := vStr_cd_modulo;
  str_cd_rot := str_cd_rotina;
  Application.CreateForm(Tfrm_previsao, frm_previsao);
  frm_previsao.ShowModal;
  KickUser;
end;

procedure Tfrm_main.mi_imp_diClick(Sender: TObject);
begin
  UserUp;
  ReiniciaCloser;
  if not VerIntegridade then Exit;
  vStr_cd_modulo := '02';
  str_cd_rotina := '0206';
  str_cd_mod := vStr_cd_modulo;
  str_cd_rot := str_cd_rotina;
  Application.CreateForm(tfrm_imp_varias_di, frm_imp_varias_di);
  frm_imp_varias_di.ShowModal;
  KickUser;
end;

procedure Tfrm_main.mi_di_recalculoClick(Sender: TObject);
begin
  UserUp;
  ReiniciaCloser;
  if not VerIntegridade then Exit;
  vStr_cd_modulo := '02';
  str_cd_rotina := '0207';
  str_cd_mod := vStr_cd_modulo;
  str_cd_rot := str_cd_rotina;
  Application.CreateForm(Tfrm_recalc_proc, frm_recalc_proc);
  frm_recalc_proc.ShowModal;
  KickUser;
end;

procedure Tfrm_main.mi_di_retif_diClick(Sender: TObject);
begin
  UserUp;
  ReiniciaCloser;
  if not VerIntegridade then Exit;
  vStr_cd_modulo := '02';
  str_cd_rotina := '0208';
  str_cd_mod := vStr_cd_modulo;
  str_cd_rot := str_cd_rotina;
  Application.CreateForm(Tfrm_DI, frm_DI);
  frm_DI.in_DI_Retificacao := True;
  frm_DI.ShowModal;
  VerAtalho;
  KickUser;
end;

procedure Tfrm_main.mi_di_imprime_darfClick(Sender: TObject);
begin
  UserUp;
  ReiniciaCloser;
  if not VerIntegridade then Exit;
  vStr_cd_modulo := '02';
  str_cd_rotina := '0210';
  str_cd_mod := vStr_cd_modulo;
  str_cd_rot := str_cd_rotina;
  Application.CreateForm(Tfrm_imp_darf, frm_imp_darf);
  frm_imp_darf.ShowModal;
  KickUser;
end;

procedure Tfrm_main.mi_integracao_liClick(Sender: TObject);
begin
  UserUp;
  ReiniciaCloser;
  if not VerIntegridade then Exit;
  vStr_cd_modulo := '03';
  str_cd_rotina := '0301';
  str_cd_mod := vStr_cd_modulo;
  str_cd_rot := str_cd_rotina;
  Application.CreateForm(Tfrm_Integracao_LI, frm_Integracao_LI);
  frm_Integracao_LI.ShowModal;
  KickUser;
end;

procedure Tfrm_main.mi_imp_liClick(Sender: TObject);
begin
  UserUp;
  ReiniciaCloser;
  if not VerIntegridade then Exit;
  vStr_cd_modulo := '03';
  str_cd_rotina := '0302';
  str_cd_mod := vStr_cd_modulo;
  str_cd_rot := str_cd_rotina;
  Application.CreateForm(tfrm_rascunho_LI, frm_rascunho_LI);
  frm_rascunho_LI.ShowModal;
  KickUser;
end;

procedure Tfrm_main.mi_solicitacao_numerarioClick(Sender: TObject);
begin
  UserUp;
  ReiniciaCloser;
  if not VerIntegridade then Exit;
  vStr_cd_modulo := '05';
  str_cd_rotina := '0501';
  str_cd_mod := vStr_cd_modulo;
  str_cd_rot := str_cd_rotina;
  Application.CreateForm(Tfrm_numerario, frm_numerario);
  frm_numerario.ShowModal;
  KickUser;
end;

procedure Tfrm_main.mi_emi_sol_numClick(Sender: TObject);
begin
  UserUp;
  ReiniciaCloser;
  if not VerIntegridade then Exit;
  vStr_cd_modulo := '05';
  str_cd_rotina := '0502';
  str_cd_mod := vStr_cd_modulo;
  str_cd_rot := str_cd_rotina;
  Application.CreateForm(Tfrm_Impressao_Numerario, frm_Impressao_Numerario);
  frm_Impressao_Numerario.ShowModal;
  KickUser;
end;

procedure Tfrm_main.mi_rec_num_solicitadoClick(Sender: TObject);
begin
  UserUp;
  ReiniciaCloser;
  if not VerIntegridade then Exit;
  vStr_cd_modulo := '06';
  str_cd_rotina := '0601';
  str_cd_mod := vStr_cd_modulo;
  str_cd_rot := str_cd_rotina;
  Application.CreateForm(Tfrm_recebimento, frm_recebimento);
  frm_recebimento.ShowModal;
  KickUser;
end;

procedure Tfrm_main.mi_rec_num_devClick(Sender: TObject);
begin
//  UserUp;
//  ReiniciaCloser;
//  if not VerIntegridade then Exit;
//  vStr_cd_modulo := '06';
//  str_cd_rotina := '0603';
//  str_cd_mod := vStr_cd_modulo;
//  str_cd_rot := str_cd_rotina;
//  Application.CreateForm(Tfrm_devolucao, frm_devolucao);
//  frm_devolucao.ShowModal;
//  KickUser;
end;

procedure Tfrm_main.mi_rec_num_rel_rec_devClick(Sender: TObject);
begin
  UserUp;
  ReiniciaCloser;
  if not VerIntegridade then Exit;
  vStr_cd_modulo := '06';
  str_cd_rotina := '0604';
  str_cd_mod := vStr_cd_modulo;
  str_cd_rot := str_cd_rotina;
  Application.CreateForm(Tfrm_sel_unid_prod, frm_sel_unid_prod);
  frm_sel_unid_prod.tp_rel := 1;
  frm_sel_unid_prod.ComPeriodo := False;
  frm_sel_unid_prod.ShowModal;
  KickUser;
end;

procedure Tfrm_main.mi_rec_num_rel_totClick(Sender: TObject);
begin
  UserUp;
  ReiniciaCloser;
  if not VerIntegridade then Exit;
  vStr_cd_modulo := '06';
  str_cd_rotina := '0605';
  str_cd_mod := vStr_cd_modulo;
  str_cd_rot := str_cd_rotina;
  Application.CreateForm(Tfrm_sel_data, frm_sel_data);
  frm_sel_data.str_cd_relatorio := '2';
  frm_sel_data.ShowModal;
  KickUser;
end;

procedure Tfrm_main.mi_pagto_solicClick(Sender: TObject);
begin
  UserUp;
  ReiniciaCloser;
  if not VerIntegridade then Exit;
  vStr_cd_modulo := '26';
  str_cd_rotina := '2601';
  str_cd_mod := vStr_cd_modulo;
  str_cd_rot := str_cd_rotina;
  Application.CreateForm(Tfrm_solic_pagto, frm_solic_pagto);
  frm_solic_pagto.ShowModal;
  KickUser;
end;

procedure Tfrm_main.mi_pagto_montagemClick(Sender: TObject);
begin
  UserUp;
  ReiniciaCloser;
  if not VerIntegridade then Exit;
  vStr_cd_modulo := '26';
  str_cd_rotina := '2602';
  str_cd_mod := vStr_cd_modulo;
  str_cd_rot := str_cd_rotina;
  Application.CreateForm(Tfrm_monta_pagto, frm_monta_pagto);
  frm_monta_pagto.ShowModal;
  KickUser;
end;

procedure Tfrm_main.mi_pagto_libClick(Sender: TObject);
begin
  UserUp;
  ReiniciaCloser;
  if not VerIntegridade then Exit;
  vStr_cd_modulo := '26';
  str_cd_rotina := '2603';
  str_cd_mod := vStr_cd_modulo;
  str_cd_rot := str_cd_rotina;
  Application.CreateForm(Tfrm_lib_pagto, frm_lib_pagto);
  frm_lib_pagto.in_ted := '0';
  frm_lib_pagto.ShowModal;
  KickUser;
end;

procedure Tfrm_main.mi_pagto_lib_tedClick(Sender: TObject);
begin
  UserUp;
  ReiniciaCloser;
  if not VerIntegridade then Exit;
  vStr_cd_modulo := '26';
  str_cd_rotina := '2613';
  str_cd_mod := vStr_cd_modulo;
  str_cd_rot := str_cd_rotina;
  Application.CreateForm(Tfrm_lib_pagto, frm_lib_pagto);
  frm_lib_pagto.in_ted := '1';
  frm_lib_pagto.ShowModal;
  KickUser;
end;

procedure Tfrm_main.mi_pagto_imp_chequeClick(Sender: TObject);
begin
  UserUp;
  ReiniciaCloser;
  if not VerIntegridade then Exit;
  vStr_cd_modulo := '26';
  str_cd_rotina := '2604';
  str_cd_mod := vStr_cd_modulo;
  str_cd_rot := str_cd_rotina;
  Application.CreateForm(Tfrm_imp_pagtos, frm_imp_pagtos);
  frm_imp_pagtos.ShowModal;
  KickUser;
end;

procedure Tfrm_main.mi_pagto_rel_copia_chequeClick(Sender: TObject);
begin
  UserUp;
  ReiniciaCloser;
  if not VerIntegridade then Exit;
  vStr_cd_modulo := '26';
  str_cd_rotina := '2605';
  str_cd_mod := vStr_cd_modulo;
  str_cd_rot := str_cd_rotina;
  Application.CreateForm(Tfrm_sel_data, frm_sel_data);
  frm_sel_data.str_cd_relatorio := '11';
  frm_sel_data.ShowModal;
  KickUser;
end;

procedure Tfrm_main.mi_pagto_rel_sol_nao_emitidasClick(Sender: TObject);
begin
  UserUp;
  ReiniciaCloser;
  if not VerIntegridade then Exit;
  vStr_cd_modulo := '26';
  str_cd_rotina := '2607';
  str_cd_mod := vStr_cd_modulo;
  str_cd_rot := str_cd_rotina;
  Application.CreateForm(Tfrm_sel_data, frm_sel_data);
  frm_sel_data.str_cd_relatorio := '12';
  frm_sel_data.ShowModal;
  KickUser;
end;

procedure Tfrm_main.mi_pagto_rel_pendClick(Sender: TObject);
begin
  UserUp;
  ReiniciaCloser;
  if not VerIntegridade then Exit;
  vStr_cd_modulo := '26';
  str_cd_rotina := '2608';
  str_cd_mod := vStr_cd_modulo;
  str_cd_rot := str_cd_rotina;
  Application.CreateForm(Tfrm_sel_data, frm_sel_data);
  frm_sel_data.str_cd_relatorio := '13';
  frm_sel_data.ShowModal;
  KickUser;
end;

procedure Tfrm_main.mi_pagto_rel_pagto_pendClick(Sender: TObject);
begin
  UserUp;
  ReiniciaCloser;
  if not VerIntegridade then Exit;
  vStr_cd_modulo := '26';
  str_cd_rotina := '2610';
  str_cd_mod := vStr_cd_modulo;
  str_cd_rot := str_cd_rotina;
  Application.CreateForm(Tfrm_sel_unid_cli_grupo_item, frm_sel_unid_cli_grupo_item);
  frm_sel_unid_cli_grupo_item.tp_rel := 1;
  frm_sel_unid_cli_grupo_item.ComPeriodo := True;
  frm_sel_unid_cli_grupo_item.ShowModal;
  KickUser;
end;

procedure Tfrm_main.mi_pagto_pesquisaClick(Sender: TObject);
begin
  UserUp;
  ReiniciaCloser;
  if not VerIntegridade then Exit;
  vStr_cd_modulo := '26';
  str_cd_rotina := '2609';
  str_cd_mod := vStr_cd_modulo;
  str_cd_rot := str_cd_rotina;
  Application.CreateForm(Tfrm_pesq_pagto, frm_pesq_pagto);
  frm_pesq_pagto.ShowModal;
  KickUser;
end;

procedure Tfrm_main.mi_adm_solicClick(Sender: TObject);
begin
  UserUp;
  ReiniciaCloser;
  if not VerIntegridade then Exit;
  vStr_cd_modulo := '27';
  str_cd_rotina := '2701';
  str_cd_mod := vStr_cd_modulo;
  str_cd_rot := str_cd_rotina;
  Application.CreateForm(Tfrm_solic_adm, frm_solic_adm);
  frm_solic_adm.ShowModal;
  KickUser;
end;

procedure Tfrm_main.mi_adm_montagemClick(Sender: TObject);
begin
  UserUp;
  ReiniciaCloser;
  if not VerIntegridade then Exit;
  vStr_cd_modulo := '27';
  str_cd_rotina := '2702';
  str_cd_mod := vStr_cd_modulo;
  str_cd_rot := str_cd_rotina;
  Application.CreateForm(Tfrm_monta_adm, frm_monta_adm);
  frm_monta_adm.ShowModal;
  KickUser;
end;

procedure Tfrm_main.mi_adm_lib_tedClick(Sender: TObject);
begin
  UserUp;
  ReiniciaCloser;
  if not VerIntegridade then Exit;
  vStr_cd_modulo := '27';
  str_cd_rotina := '2706';
  str_cd_mod := vStr_cd_modulo;
  str_cd_rot := str_cd_rotina;
  Application.CreateForm(Tfrm_lib_adm, frm_lib_adm);
  frm_lib_adm.ShowModal;
  KickUser;
end;

procedure Tfrm_main.mi_adm_imp_chequeClick(Sender: TObject);
begin
  UserUp;
  ReiniciaCloser;
  if not VerIntegridade then Exit;
  vStr_cd_modulo := '37';
  str_cd_rotina := '3707';
  str_cd_mod := vStr_cd_modulo;
  str_cd_rot := str_cd_rotina;
  Application.CreateForm(Tfrm_imp_adm, frm_imp_adm);
  frm_imp_adm.ShowModal;
  KickUser;
end;

procedure Tfrm_main.mi_adm_pesquisaClick(Sender: TObject);
begin
  UserUp;
  ReiniciaCloser;
  if not VerIntegridade then Exit;
  vStr_cd_modulo := '27';
  str_cd_rotina := '2704';
  str_cd_mod := vStr_cd_modulo;
  str_cd_rot := str_cd_rotina;
  Application.CreateForm(Tfrm_pesq_adm, frm_pesq_adm);
  frm_pesq_adm.ShowModal;
  KickUser;
end;

procedure Tfrm_main.mi_sda_distrClick(Sender: TObject);
begin
  UserUp;
  ReiniciaCloser;
  if not VerIntegridade then Exit;
  vStr_cd_modulo := '09';
  str_cd_rotina := '0901';
  str_cd_mod := vStr_cd_modulo;
  str_cd_rot := str_cd_rotina;
  Application.CreateForm(Tfrm_sda_distr, frm_sda_distr);
  frm_sda_distr.ShowModal;
  KickUser;
end;

procedure Tfrm_main.mi_sda_emissaoClick(Sender: TObject);
begin
  UserUp;
  ReiniciaCloser;
  if not VerIntegridade then Exit;
  vStr_cd_modulo := '09';
  str_cd_rotina := '0902';
  str_cd_mod := vStr_cd_modulo;
  str_cd_rot := str_cd_rotina;
  Application.CreateForm(Tfrm_sda_emissao, frm_sda_emissao);
  frm_sda_emissao.ShowModal;
  KickUser;
end;

procedure Tfrm_main.mi_sda_cancelClick(Sender: TObject);
begin
  UserUp;
  ReiniciaCloser;
  if not VerIntegridade then Exit;
  vStr_cd_modulo := '09';
  str_cd_rotina := '0904';
  str_cd_mod := vStr_cd_modulo;
  str_cd_rot := str_cd_rotina;
  Application.CreateForm(Tfrm_sda_cancel, frm_sda_cancel);
  frm_sda_cancel.ShowModal;
  KickUser;
end;

procedure Tfrm_main.mi_ext_hon_sdaClick(Sender: TObject);
begin
  UserUp;
  ReiniciaCloser;
  if not VerIntegridade then Exit;
  vStr_cd_modulo := '09';
  str_cd_rotina := '0903';
  str_cd_mod := vStr_cd_modulo;
  str_cd_rot := str_cd_rotina;
  Application.CreateForm(Tfrm_relatorio_extrato_honorarios, frm_relatorio_extrato_honorarios);
  frm_relatorio_extrato_honorarios.ShowModal;
  KickUser;
end;

procedure Tfrm_main.mi_sda_pesqClick(Sender: TObject);
begin
  UserUp;
  ReiniciaCloser;
  if not VerIntegridade then Exit;
  vStr_cd_modulo := '09';
  str_cd_rotina := '0905';
  str_cd_mod := vStr_cd_modulo;
  str_cd_rot := str_cd_rotina;
  Application.CreateForm(Tfrm_sda_pesq, frm_sda_pesq);
  frm_sda_pesq.ShowModal;
  KickUser;
end;

procedure Tfrm_main.mi_fat_lancClick(Sender: TObject);
begin
  UserUp;
  ReiniciaCloser;
  if not VerIntegridade then Exit;
  vStr_cd_modulo := '11';
  str_cd_rotina := '1101';
  str_cd_mod := vStr_cd_modulo;
  str_cd_rot := str_cd_rotina;
  Application.CreateForm(Tfrm_fat_cc, frm_fat_cc);
  frm_fat_cc.ShowModal;
  KickUser;
end;

procedure Tfrm_main.mi_fat_solClick(Sender: TObject);
begin
  UserUp;
  ReiniciaCloser;
  if not VerIntegridade then Exit;
  vStr_cd_modulo := '11';
  str_cd_rotina := '1102';
  str_cd_mod := vStr_cd_modulo;
  str_cd_rot := str_cd_rotina;
  Application.CreateForm(Tfrm_fat_sol, frm_fat_sol);
  frm_fat_sol.ShowModal;
  if str_cd_rotina = '1120' then
  begin
    if not VerIntegridade then Exit;
    str_cd_mod := vStr_cd_modulo;
    str_cd_rot := str_cd_rotina;
    Application.CreateForm(Tfrm_nf_serv, frm_nf_serv);
    frm_nf_serv.ShowModal;
    KickUser;
  end;
  if str_cd_rotina = '1105' then
  begin
    if not VerIntegridade then Exit;
    str_cd_mod := vStr_cd_modulo;
    str_cd_rot := str_cd_rotina;
    Application.CreateForm(Tfrm_sel_fat, frm_sel_fat);
    frm_sel_fat.tp_tipo_fat := 'N';
    frm_sel_fat.ShowModal;
    KickUser;
  end;
  if str_cd_rotina = '1104' then
  begin
    if not VerIntegridade then Exit;
    str_cd_mod := vStr_cd_modulo;
    str_cd_rot := str_cd_rotina;
    Application.CreateForm(Tfrm_sel_fat, frm_sel_fat);
    frm_sel_fat.PreviewFatura := False;
    frm_sel_fat.tp_tipo_fat := 'D';
    frm_sel_fat.ShowModal;
    KickUser;
  end;
  KickUser;
end;

procedure Tfrm_main.mi_fat_emi_nf_fatClick(Sender: TObject);
begin
  UserUp;
  ReiniciaCloser;
  if not VerIntegridade then Exit;
  vStr_cd_modulo := '11';
  str_cd_rotina := '1104';
  str_cd_mod := vStr_cd_modulo;
  str_cd_rot := str_cd_rotina;
  Application.CreateForm(Tfrm_sel_fat, frm_sel_fat);
  frm_sel_fat.PreviewFatura := False;
  frm_sel_fat.tp_tipo_fat := 'F';
  frm_sel_fat.ShowModal;
  KickUser;
end;

procedure Tfrm_main.mi_fat_emi_notaClick(Sender: TObject);
begin
  UserUp;
  ReiniciaCloser;
  if not VerIntegridade then Exit;
  vStr_cd_modulo := '11';
  str_cd_rotina := '1105';
  str_cd_mod := vStr_cd_modulo;
  str_cd_rot := str_cd_rotina;
  Application.CreateForm(Tfrm_sel_fat, frm_sel_fat);
  frm_sel_fat.PreviewFatura := False;
  frm_sel_fat.tp_tipo_fat := 'N';
  frm_sel_fat.ShowModal;
  KickUser;
end;

procedure Tfrm_main.mi_fat_emi_nf_servClick(Sender: TObject);
begin
  UserUp;
  ReiniciaCloser;
  if not VerIntegridade then Exit;
  vStr_cd_modulo := '11';
  str_cd_rotina := '1120';
  str_cd_mod := vStr_cd_modulo;
  str_cd_rot := str_cd_rotina;
  Application.CreateForm(Tfrm_sel_fat, frm_sel_fat);
  frm_sel_fat.PreviewFatura := False;
  frm_sel_fat.tp_tipo_fat := 'S';
  frm_sel_fat.ShowModal;
  KickUser;
end;

procedure Tfrm_main.mi_fat_rel_comissaoClick(Sender: TObject);
begin
  UserUp;
  ReiniciaCloser;
  if not VerIntegridade then Exit;
  vStr_cd_modulo := '11';
  str_cd_rotina := '1115';
  str_cd_mod := vStr_cd_modulo;
  str_cd_rot := str_cd_rotina;
  Application.CreateForm(Tfrm_sel_unid_prod, frm_sel_unid_prod);
  frm_sel_unid_prod.tp_rel := 3;
  frm_sel_unid_prod.ComPeriodo := True;
  frm_sel_unid_prod.ShowModal;
  KickUser;
end;

procedure Tfrm_main.mi_fat_rel_comparativoClick(Sender: TObject);
begin
  UserUp;
  ReiniciaCloser;
  if not VerIntegridade then Exit;
  vStr_cd_modulo := '11';
  str_cd_rotina := '1116';
  str_cd_mod := vStr_cd_modulo;
  str_cd_rot := str_cd_rotina;
  Application.CreateForm(Tfrm_sel_unid_prod, frm_sel_unid_prod);
  frm_sel_unid_prod.tp_rel := 4;
  frm_sel_unid_prod.ComPeriodo := True;
  frm_sel_unid_prod.ShowModal;
  KickUser;
end;

procedure Tfrm_main.mi_fin_lancClick(Sender: TObject);
begin
  UserUp;
  ReiniciaCloser;
  if not VerIntegridade then Exit;
  vStr_cd_modulo := '12';
  str_cd_rotina := '1201';
  str_cd_mod := vStr_cd_modulo;
  str_cd_rot := str_cd_rotina;
  Application.CreateForm(Tfrm_financeiro, frm_financeiro);
  frm_financeiro.ShowModal;
  KickUser;
end;

procedure Tfrm_main.mi_fin_rel_ext_ccClick(Sender: TObject);
begin
  UserUp;
  ReiniciaCloser;
  if not VerIntegridade then Exit;
  vStr_cd_modulo := '12';
  str_cd_rotina := '1212';
  str_cd_mod := vStr_cd_modulo;
  str_cd_rot := str_cd_rotina;
  Application.CreateForm(Tfrm_rel_extrato_cc, frm_rel_extrato_cc);
  frm_rel_extrato_cc.str_cd_relatorio := '1';
  frm_rel_extrato_cc.ShowModal;
  KickUser;
end;

procedure Tfrm_main.mi_cheque_avulsoClick(Sender: TObject);
begin
  UserUp;
  ReiniciaCloser;
  if not VerIntegridade then Exit;
  vStr_cd_modulo := '12';
  str_cd_rotina := '1207';
  str_cd_mod := vStr_cd_modulo;
  str_cd_rot := str_cd_rotina;
  Application.CreateForm(Tfrm_cheque_avulso, frm_cheque_avulso);
  frm_cheque_avulso.ShowModal;
  KickUser;
end;

procedure Tfrm_main.mi_entrega_ch_brClick(Sender: TObject);
begin
  UserUp;
  ReiniciaCloser;
  if not VerIntegridade then Exit;
  vStr_cd_modulo := '13';
  str_cd_rotina := '1301';
  str_cd_mod := vStr_cd_modulo;
  str_cd_rot := str_cd_rotina;
  Application.CreateForm(Tfrm_ent_ch_br, frm_ent_ch_br);
  frm_ent_ch_br.ShowModal;
  KickUser;
end;

procedure Tfrm_main.mi_rel_pend_ch_brClick(Sender: TObject);
begin
  UserUp;
  ReiniciaCloser;
  if not VerIntegridade then Exit;
  vStr_cd_modulo := '13';
  str_cd_rotina := '1303';
  str_cd_mod := vStr_cd_modulo;
  str_cd_rot := str_cd_rotina;
  Application.CreateForm(Tfrm_imp_cheque_branco, frm_imp_cheque_branco);
  frm_imp_cheque_branco.ShowModal;
  KickUser;
end;

procedure Tfrm_main.mi_rel_prestados_conta_ch_brClick(Sender: TObject);
begin
  UserUp;
  ReiniciaCloser;
  if not VerIntegridade then Exit;
  vStr_cd_modulo := '13';
  str_cd_rotina := '1304';
  str_cd_mod := vStr_cd_modulo;
  str_cd_rot := str_cd_rotina;
  Application.CreateForm(Tfrm_sel_data, frm_sel_data);
  frm_sel_data.str_cd_relatorio := '5';
  frm_sel_data.ShowModal;
  KickUser;
end;

procedure Tfrm_main.mi_liquidacaoClick(Sender: TObject);
begin
  UserUp;
  ReiniciaCloser;
  if not VerIntegridade then Exit;
  vStr_cd_modulo := '14';
  str_cd_rotina := '1401';
  str_cd_mod := vStr_cd_modulo;
  str_cd_rot := str_cd_rotina;
  Application.CreateForm(Tfrm_liq, frm_liq);
  frm_liq.ShowModal;
  KickUser;
end;

procedure Tfrm_main.mi_rel_saldos_pendClick(Sender: TObject);
begin
  UserUp;
  ReiniciaCloser;
  if not VerIntegridade then Exit;
  vStr_cd_modulo := '14';
  str_cd_rotina := '1402';
  str_cd_mod := vStr_cd_modulo;
  str_cd_rot := str_cd_rotina;
  Application.CreateForm(Tfrm_sel_unid_prod, frm_sel_unid_prod);
  frm_sel_unid_prod.tp_rel := 19;
  frm_sel_unid_prod.ComPeriodo := False;
  frm_sel_unid_prod.ShowModal;
  KickUser;
end;

procedure Tfrm_main.mi_rel_liquidacaoClick(Sender: TObject);
begin
  UserUp;
  ReiniciaCloser;
  if not VerIntegridade then Exit;
  vStr_cd_modulo := '14';
  str_cd_rotina := '1403';
  str_cd_mod := vStr_cd_modulo;
  str_cd_rot := str_cd_rotina;
  Application.CreateForm(Tfrm_sel_unid_prod, frm_sel_unid_prod);
  frm_sel_unid_prod.tp_rel := 22;
  frm_sel_unid_prod.ComPeriodo := True;
  frm_sel_unid_prod.ShowModal;
  KickUser;
end;

procedure Tfrm_main.mi_liq_rel_totClick(Sender: TObject);
begin
  UserUp;
  ReiniciaCloser;
  if not VerIntegridade then Exit;
  vStr_cd_modulo := '14';
  str_cd_rotina := '1404';
  str_cd_mod := vStr_cd_modulo;
  str_cd_rot := str_cd_rotina;
  Application.CreateForm(Tfrm_sel_data, frm_sel_data);
  frm_sel_data.str_cd_relatorio := '10';
  frm_sel_data.ShowModal;
  KickUser;
end;

procedure Tfrm_main.mi_rel_imp_proc_pg_des_diClick(Sender: TObject);
begin
  UserUp;
  ReiniciaCloser;
  if not VerIntegridade then Exit;
  vStr_cd_modulo := '15';
  str_cd_rotina := '1501';
  str_cd_mod := vStr_cd_modulo;
  str_cd_rot := str_cd_rotina;
  Application.CreateForm(Tfrm_sel_cli_periodo, frm_sel_cli_periodo);
  frm_sel_cli_periodo.tp_relat := '1';
  frm_sel_cli_periodo.ShowModal;
  KickUser;
end;

procedure Tfrm_main.mi_rel_imp_proc_pg_des_liClick(Sender: TObject);
begin
  UserUp;
  ReiniciaCloser;
  if not VerIntegridade then Exit;
  vStr_cd_modulo := '15';
  str_cd_rotina := '1502';
  str_cd_mod := vStr_cd_modulo;
  str_cd_rot := str_cd_rotina;
  Application.CreateForm(Tfrm_sel_cli_periodo, frm_sel_cli_periodo);
  frm_sel_cli_periodo.tp_relat := '2';
  frm_sel_cli_periodo.ShowModal;
  KickUser;
end;

procedure Tfrm_main.mi_rel_imp_mov_procClick(Sender: TObject);
begin
  UserUp;
  ReiniciaCloser;
  if not VerIntegridade then Exit;
  vStr_cd_modulo := '15';
  str_cd_rotina := '1503';
  str_cd_mod := vStr_cd_modulo;
  str_cd_rot := str_cd_rotina;
  Application.CreateForm(Tfrm_sel_unid_cli, frm_sel_unid_cli);
  frm_sel_unid_cli.tp_rel := 4;
  frm_sel_unid_cli.ComPeriodo := True;
  frm_sel_unid_cli.ShowModal;
  KickUser;
end;

procedure Tfrm_main.mi_rel_es_saldo_cliClick(Sender: TObject);
begin
  UserUp;
  (* if Not VerIntegridade then Exit;
  vStr_cd_modulo := '15';
  str_cd_rotina := '1504';
  str_cd_mod    := vStr_cd_modulo;
  str_cd_rot    := str_cd_rotina;
  Application.CreateForm(Tfrm_sel_data, frm_sel_data);
  frm_sel_data.str_cd_relatorio := '7';
  frm_sel_data.ShowModal;*)
  ReiniciaCloser;
  if not VerIntegridade then Exit;
  vStr_cd_modulo := '15';
  str_cd_rotina := '1504';
  str_cd_mod := vStr_cd_modulo;
  str_cd_rot := str_cd_rotina;
  Application.CreateForm(Tfrm_sel_cli_periodo, frm_sel_cli_periodo);
  frm_sel_cli_periodo.tp_relat := '5';
  frm_sel_cli_periodo.ShowModal;
  KickUser;
end;

procedure Tfrm_main.mi_rel_es_despClick(Sender: TObject);
begin
  UserUp;
  ReiniciaCloser;
  if not VerIntegridade then Exit;
  vStr_cd_modulo := '15';
  str_cd_rotina := '1505';
  str_cd_mod := vStr_cd_modulo;
  str_cd_rot := str_cd_rotina;
  Application.CreateForm(Tfrm_imp_despesas_nao_faturaveis, frm_imp_despesas_nao_faturaveis);
  frm_imp_despesas_nao_faturaveis.ShowModal;
  KickUser;
end;

procedure Tfrm_main.mi_rel_es_rec_desp_opClick(Sender: TObject);
begin
  UserUp;
  ReiniciaCloser;
  if not VerIntegridade then Exit;
  vStr_cd_modulo := '15';
  str_cd_rotina := '1506';
  str_cd_mod := vStr_cd_modulo;
  str_cd_rot := str_cd_rotina;
  Application.CreateForm(Tfrm_imp_receitas_operacionais, frm_imp_receitas_operacionais);
  frm_imp_receitas_operacionais.ShowModal;
  KickUser;
end;

procedure Tfrm_main.mi_rel_es_rank_recClick(Sender: TObject);
begin
  UserUp;
  ReiniciaCloser;
  if not VerIntegridade then Exit;
  vStr_cd_modulo := '15';
  str_cd_rotina := '1507';
  str_cd_mod := vStr_cd_modulo;
  str_cd_rot := str_cd_rotina;
  Application.CreateForm(Tfrm_sel_mes_ano_produto, frm_sel_mes_ano_produto);
  frm_sel_mes_ano_produto.str_cd_relatorio := '1';
  frm_sel_mes_ano_produto.ShowModal;
  KickUser;
end;

procedure Tfrm_main.mi_rel_es_periodoClick(Sender: TObject);
begin
  UserUp;
  ReiniciaCloser;
  if not VerIntegridade then Exit;
  vStr_cd_modulo := '15';
  str_cd_rotina := '1508';
  str_cd_mod := vStr_cd_modulo;
  str_cd_rot := str_cd_rotina;
  Application.CreateForm(Tfrm_sel_unid_prod, frm_sel_unid_prod);
  frm_sel_unid_prod.tp_rel := 2;
  frm_sel_unid_prod.ComPeriodo := True;
  frm_sel_unid_prod.ShowModal;
  KickUser;
end;

procedure Tfrm_main.mi_rel_imp_andamentoClick(Sender: TObject);
begin
  UserUp;
  ReiniciaCloser;
  if not VerIntegridade then Exit;
  vStr_cd_modulo := '15';
  str_cd_rotina := '1509';
  str_cd_mod := vStr_cd_modulo;
  str_cd_rot := str_cd_rotina;
  Application.CreateForm(Tfrm_sel_unid_cli, frm_sel_unid_cli);
  frm_sel_unid_cli.tp_rel := 5;
  frm_sel_unid_cli.ComPeriodo := False;
  frm_sel_unid_cli.ShowModal;
  KickUser;
end;

procedure Tfrm_main.mi_rel_es_vencto_cartaoClick(Sender: TObject);
begin
  UserUp;
  ReiniciaCloser;
  if not VerIntegridade then Exit;
  vStr_cd_modulo := '15';
  str_cd_rotina := '1510';
  str_cd_mod := vStr_cd_modulo;
  str_cd_rot := str_cd_rotina;
  Application.CreateForm(Tfrm_imp_lanc_fat_cc, frm_imp_lanc_fat_cc);
  frm_imp_lanc_fat_cc.str_relatorio := 2;
  frm_imp_lanc_fat_cc.ShowModal;
  KickUser;
end;

procedure Tfrm_main.mi_rel_es_gastos_processoClick(Sender: TObject);
begin
  UserUp;
  ReiniciaCloser;
  if not VerIntegridade then Exit;
  vStr_cd_modulo := '15';
  str_cd_rotina := '1511';
  str_cd_mod := vStr_cd_modulo;
  str_cd_rot := str_cd_rotina;
  Application.CreateForm(Tfrm_tot_gastos_processo, frm_tot_gastos_processo);
  frm_tot_gastos_processo.ShowModal;
  KickUser;
end;

procedure Tfrm_main.mi_rel_es_gastos_portoClick(Sender: TObject);
begin
  UserUp;
  ReiniciaCloser;
  if not VerIntegridade then Exit;
  vStr_cd_modulo := '15';
  str_cd_rotina := '1512';
  str_cd_mod := vStr_cd_modulo;
  str_cd_rot := str_cd_rotina;
  Application.CreateForm(Tfrm_tot_gastos_porto, frm_tot_gastos_porto);
  frm_tot_gastos_porto.str_relatorio := 1;
  frm_tot_gastos_porto.ShowModal;
  KickUser;
end;

procedure Tfrm_main.mi_rel_imp_flp_planClick(Sender: TObject);
begin
  UserUp;
  ReiniciaCloser;
  if not VerIntegridade then Exit;
  vStr_cd_modulo := '15';
  str_cd_rotina := '1513';
  str_cd_mod := vStr_cd_modulo;
  str_cd_rot := str_cd_rotina;
  Application.CreateForm(Tfrm_sel_unid_prod, frm_sel_unid_prod);
  frm_sel_unid_prod.tp_rel := 5;
  frm_sel_unid_prod.ComPeriodo := False;
  frm_sel_unid_prod.ShowModal;
  KickUser;
end;

procedure Tfrm_main.mi_rel_imp_map_segClick(Sender: TObject);
begin
  UserUp;
  ReiniciaCloser;
  if not VerIntegridade then Exit;
  vStr_cd_modulo := '15';
  str_cd_rotina := '1514';
  str_cd_mod := vStr_cd_modulo;
  str_cd_rot := str_cd_rotina;
  Application.CreateForm(Tfrm_sel_unid_cli_mes_ano, frm_sel_unid_cli_mes_ano);
  frm_sel_unid_cli_mes_ano.str_relatorio := 1;
  frm_sel_unid_cli_mes_ano.ShowModal;
  KickUser;
end;

procedure Tfrm_main.mi_rel_imp_prev_custoClick(Sender: TObject);
begin
  UserUp;
  ReiniciaCloser;
  if not VerIntegridade then Exit;
  vStr_cd_modulo := '15';
  str_cd_rotina := '1515';
  str_cd_mod := vStr_cd_modulo;
  str_cd_rot := str_cd_rotina;
  Application.CreateForm(Tfrm_previsao_custo, frm_previsao_custo);
  frm_previsao_custo.ShowModal;
  KickUser;
end;

procedure Tfrm_main.mi_rel_es_gastos_amzClick(Sender: TObject);
begin
  UserUp;
  ReiniciaCloser;
  if not VerIntegridade then Exit;
  vStr_cd_modulo := '15';
  str_cd_rotina := '1516';
  str_cd_mod := vStr_cd_modulo;
  str_cd_rot := str_cd_rotina;
  Application.CreateForm(Tfrm_tot_gastos_porto, frm_tot_gastos_porto);
  frm_tot_gastos_porto.str_relatorio := 2;
  frm_tot_gastos_porto.ShowModal;
  KickUser;
end;

procedure Tfrm_main.mi_rel_es_vl_cifClick(Sender: TObject);
begin
  UserUp;
  ReiniciaCloser;
  if not VerIntegridade then Exit;
  vStr_cd_modulo := '15';
  str_cd_rotina := '1517';
  str_cd_mod := vStr_cd_modulo;
  str_cd_rot := str_cd_rotina;
  Application.CreateForm(Tfrm_sel_mes_ano_produto, frm_sel_mes_ano_produto);
  frm_sel_mes_ano_produto.str_cd_relatorio := '2';
  frm_sel_mes_ano_produto.ShowModal;
  KickUser;
end;

procedure Tfrm_main.mi_rel_es_cli_ativoClick(Sender: TObject);
begin
  UserUp;
  ReiniciaCloser;
  if not VerIntegridade then Exit;
  vStr_cd_modulo := '15';
  str_cd_rotina := '1518';
  str_cd_mod := vStr_cd_modulo;
  str_cd_rot := str_cd_rotina;
  Application.CreateForm(Tfrm_sel_mes_ano_produto, frm_sel_mes_ano_produto);
  frm_sel_mes_ano_produto.str_cd_relatorio := '3';
  frm_sel_mes_ano_produto.ShowModal;
  KickUser;
end;

procedure Tfrm_main.mi_rel_es_cli_nao_ativoClick(Sender: TObject);
begin
  UserUp;
  ReiniciaCloser;
  if not VerIntegridade then Exit;
  vStr_cd_modulo := '15';
  str_cd_rotina := '1519';
  str_cd_mod := vStr_cd_modulo;
  str_cd_rot := str_cd_rotina;
  Application.CreateForm(Tfrm_sel_mes_ano_produto, frm_sel_mes_ano_produto);
  frm_sel_mes_ano_produto.str_cd_relatorio := '4';
  frm_sel_mes_ano_produto.ShowModal;
  KickUser;
end;

procedure Tfrm_main.mi_rel_es_cli_ativo_nao_ativoClick(Sender: TObject);
begin
  UserUp;
  ReiniciaCloser;
  if not VerIntegridade then Exit;
  vStr_cd_modulo := '15';
  str_cd_rotina := '1520';
  str_cd_mod := vStr_cd_modulo;
  str_cd_rot := str_cd_rotina;
  Application.CreateForm(Tfrm_sel_mes_ano_produto, frm_sel_mes_ano_produto);
  frm_sel_mes_ano_produto.str_cd_relatorio := '5';
  frm_sel_mes_ano_produto.ShowModal;
  KickUser;
end;

procedure Tfrm_main.mi_rel_es_cli_nao_ativo_ativoClick(Sender: TObject);
begin
  UserUp;
  ReiniciaCloser;
  if not VerIntegridade then Exit;
  vStr_cd_modulo := '15';
  str_cd_rotina := '1521';
  str_cd_mod := vStr_cd_modulo;
  str_cd_rot := str_cd_rotina;
  Application.CreateForm(Tfrm_sel_mes_ano_produto, frm_sel_mes_ano_produto);
  frm_sel_mes_ano_produto.str_cd_relatorio := '6';
  frm_sel_mes_ano_produto.ShowModal;
  KickUser;
end;

procedure Tfrm_main.mi_rel_imp_followupClick(Sender: TObject);
begin
  UserUp;
  //wagner - ver forma de saida do processo do relatório
  ReiniciaCloser;
  if not VerIntegridade then Exit;
  vStr_cd_modulo := '15';
  str_cd_rotina := '1522';
  str_cd_mod := vStr_cd_modulo;
  str_cd_rot := str_cd_rotina;
  Application.CreateForm(Tfrm_sel_unid_cli_mes_ano, frm_sel_unid_cli_mes_ano);
  frm_sel_unid_cli_mes_ano.str_relatorio := 2;
  frm_sel_unid_cli_mes_ano.ShowModal;
  KickUser;
end;

procedure Tfrm_main.mi_rel_imp_lead_timeClick(Sender: TObject);
begin
  UserUp;
  ReiniciaCloser;
  if not VerIntegridade then Exit;
  vStr_cd_modulo := '15';
  str_cd_rotina := '1523';
  str_cd_mod := vStr_cd_modulo;
  str_cd_rot := str_cd_rotina;
  Application.CreateForm(Tfrm_sel_unid_prod_cli, frm_sel_unid_prod_cli);
  frm_sel_unid_prod_cli.str_relatorio := 1;
  frm_sel_unid_prod_cli.ShowModal;
  KickUser;
end;

procedure Tfrm_main.mi_rel_imp_plan_custoClick(Sender: TObject);
begin
  UserUp;
  ReiniciaCloser;
  if not VerIntegridade then Exit;
  vStr_cd_modulo := '15';
  str_cd_rotina := '1524';
  str_cd_mod := vStr_cd_modulo;
  str_cd_rot := str_cd_rotina;
  Application.CreateForm(Tfrm_sel_processo, frm_sel_processo);
  frm_sel_processo.str_cd_relatorio := '3';
  frm_sel_processo.ShowModal;
  KickUser;
end;

procedure Tfrm_main.mi_rel_exp_proc_pend_averbClick(Sender: TObject);
begin
  UserUp;
  ReiniciaCloser;
  if not VerIntegridade then Exit;
  vStr_cd_modulo := '15';
  str_cd_rotina := '1525';
  str_cd_mod := vStr_cd_modulo;
  str_cd_rot := str_cd_rotina;
  Application.CreateForm(Tfrm_sel_unid_cli, frm_sel_unid_cli);
  frm_sel_unid_cli.tp_rel := 6;
  frm_sel_unid_cli.ComPeriodo := False;
  frm_sel_unid_cli.ShowModal;
  KickUser;
end;

procedure Tfrm_main.mi_rel_exp_proc_averbClick(Sender: TObject);
begin
  UserUp;
  ReiniciaCloser;
  if not VerIntegridade then Exit;
  vStr_cd_modulo := '15';
  str_cd_rotina := '1526';
  str_cd_mod := vStr_cd_modulo;
  str_cd_rot := str_cd_rotina;
  Application.CreateForm(Tfrm_sel_unid_cli, frm_sel_unid_cli);
  frm_sel_unid_cli.tp_rel := 7;
  frm_sel_unid_cli.ComPeriodo := True;
  frm_sel_unid_cli.ShowModal;
  KickUser;
end;

procedure Tfrm_main.mi_rel_es_tot_serv_cliClick(Sender: TObject);
begin
  UserUp;
  ReiniciaCloser;
  if not VerIntegridade then Exit;
  vStr_cd_modulo := '15';
  str_cd_rotina := '1527';
  str_cd_mod := vStr_cd_modulo;
  str_cd_rot := str_cd_rotina;
  Application.CreateForm(Tfrm_sel_unid_prod, frm_sel_unid_prod);
  frm_sel_unid_prod.tp_rel := 6;
  frm_sel_unid_prod.ComPeriodo := True;
  frm_sel_unid_prod.ShowModal;
  KickUser;
end;

procedure Tfrm_main.mi_rel_es_tot_serv_cli_anClick(Sender: TObject);
begin
  UserUp;
  ReiniciaCloser;
  if not VerIntegridade then Exit;
  vStr_cd_modulo := '15';
  str_cd_rotina := '1527';
  str_cd_mod := vStr_cd_modulo;
  str_cd_rot := str_cd_rotina;
  Application.CreateForm(Tfrm_sel_unid_prod, frm_sel_unid_prod);
  frm_sel_unid_prod.tp_rel := 7;
  frm_sel_unid_prod.ComPeriodo := True;
  frm_sel_unid_prod.ShowModal;
  KickUser;
end;

procedure Tfrm_main.mi_rel_imp_docto_recClick(Sender: TObject);
begin
  UserUp;
  ReiniciaCloser;
  if not VerIntegridade then Exit;
  vStr_cd_modulo := '15';
  str_cd_rotina := '1529';
  str_cd_mod := vStr_cd_modulo;
  str_cd_rot := str_cd_rotina;
  Application.CreateForm(Tfrm_sel_unid_cli, frm_sel_unid_cli);
  frm_sel_unid_cli.tp_rel := 8;
  frm_sel_unid_cli.ComPeriodo := True;
  frm_sel_unid_cli.ShowModal;
  KickUser;
end;

procedure Tfrm_main.mi_rel_es_ensaio_recClick(Sender: TObject);
begin
  UserUp;
  ReiniciaCloser;
  if not VerIntegridade then Exit;
  vStr_cd_modulo := '15';
  str_cd_rotina := '1530';
  str_cd_mod := vStr_cd_modulo;
  str_cd_rot := str_cd_rotina;
  Application.CreateForm(Tfrm_ensaios, frm_ensaios);
  frm_ensaios.ShowModal;
  KickUser;
end;

procedure Tfrm_main.mi_rel_imp_desp_mensaisClick(Sender: TObject);
begin
  UserUp;
  ReiniciaCloser;
  if not VerIntegridade then Exit;
  vStr_cd_modulo := '15';
  str_cd_rotina := '1531';
  str_cd_mod := vStr_cd_modulo;
  str_cd_rot := str_cd_rotina;
  Application.CreateForm(Tfrm_sel_unid_cli_mes_ano, frm_sel_unid_cli_mes_ano);
  frm_sel_unid_cli_mes_ano.str_relatorio := 3;
  frm_sel_unid_cli_mes_ano.ShowModal;
  KickUser;
end;

procedure Tfrm_main.mi_rel_imp_performanceClick(Sender: TObject);
begin
  UserUp;
  ReiniciaCloser;
  if not VerIntegridade then Exit;
  vStr_cd_modulo := '15';
  str_cd_rotina := '1532';
  str_cd_mod := vStr_cd_modulo;
  str_cd_rot := str_cd_rotina;
  Application.CreateForm(Tfrm_sel_unid_prod_cli, frm_sel_unid_prod_cli);
  frm_sel_unid_prod_cli.str_relatorio := 2;
  frm_sel_unid_prod_cli.ShowModal;
  KickUser;
end;

procedure Tfrm_main.mi_rel_cad_tx_cambioClick(Sender: TObject);
begin
  UserUp;
  ReiniciaCloser;
  if not VerIntegridade then Exit;
  vStr_cd_modulo := '17';
  str_cd_rotina := '1701';
  str_cd_mod := vStr_cd_modulo;
  str_cd_rot := str_cd_rotina;
  Application.CreateForm(Tfrm_sel_data, frm_sel_data);
  frm_sel_data.str_cd_relatorio := '9';
  frm_sel_data.ShowModal;
  KickUser;
end;

procedure Tfrm_main.mi_cad_cliClick(Sender: TObject);
begin
  UserUp;
  ReiniciaCloser;
  if not VerIntegridade then Exit;
  vStr_cd_modulo := '22';
  str_cd_rotina := '2201';
  str_cd_mod := vStr_cd_modulo;
  str_cd_rot := str_cd_rotina;
  Application.CreateForm(Tfrm_grupo, frm_grupo);
  frm_grupo.ShowModal;
  KickUser;
end;

procedure Tfrm_main.mi_cad_emp_nacClick(Sender: TObject);
begin
  UserUp;
  ReiniciaCloser;
  if not VerIntegridade then Exit;
  vStr_cd_modulo := '22';
  str_cd_rotina := '2202';
  str_cd_mod := vStr_cd_modulo;
  str_cd_rot := str_cd_rotina;
  Application.CreateForm(Tfrm_Cliente, frm_Cliente);
  frm_Cliente.ShowModal;
  KickUser;
end;

procedure Tfrm_main.mi_cad_emp_estClick(Sender: TObject);
begin
  UserUp;
  ReiniciaCloser;
  if not VerIntegridade then Exit;
  vStr_cd_modulo := '22';
  str_cd_rotina := '2203';
  str_cd_mod := vStr_cd_modulo;
  str_cd_rot := str_cd_rotina;
  Application.CreateForm(Tfrm_emp_est, frm_emp_est);
  frm_emp_est.ShowModal;
  KickUser;
end;

procedure Tfrm_main.mi_cad_despClick(Sender: TObject);
begin
  UserUp;
  ReiniciaCloser;
  if not VerIntegridade then Exit;
  vStr_cd_modulo := '22';
  str_cd_rotina := '2204';
  str_cd_mod := vStr_cd_modulo;
  str_cd_rot := str_cd_rotina;
  Application.CreateForm(Tfrm_despachante, frm_despachante);
  frm_despachante.ShowModal;
  KickUser;
end;

procedure Tfrm_main.mi_cad_obsClick(Sender: TObject);
begin
  UserUp;
  ReiniciaCloser;
  if not VerIntegridade then Exit;
  vStr_cd_modulo := '22';
  str_cd_rotina := '2205';
  str_cd_mod := vStr_cd_modulo;
  str_cd_rot := str_cd_rotina;
  Application.CreateForm(Tfrm_observacoes, frm_observacoes);
  frm_observacoes.ShowModal;
  KickUser;
end;

procedure Tfrm_main.mi_cad_local_embClick(Sender: TObject);
begin
  UserUp;
  ReiniciaCloser;
  if not VerIntegridade then Exit;
  vStr_cd_modulo := '22';
  str_cd_rotina := '2206';
  str_cd_mod := vStr_cd_modulo;
  str_cd_rot := str_cd_rotina;
  Application.CreateForm(Tfrm_local_embarque, frm_local_embarque);
  frm_local_embarque.ShowModal;
  KickUser;
end;

procedure Tfrm_main.mi_cad_transp_itlClick(Sender: TObject);
begin
  UserUp;
  ReiniciaCloser;
  if not VerIntegridade then Exit;
  vStr_cd_modulo := '22';
  str_cd_rotina := '2207';
  str_cd_mod := vStr_cd_modulo;
  str_cd_rot := str_cd_rotina;
  Application.CreateForm(Tfrm_transportador_itl, frm_transportador_itl);
  frm_transportador_itl.ShowModal;
  KickUser;
end;

procedure Tfrm_main.mi_cad_fin_favClick(Sender: TObject);
begin
  UserUp;
  ReiniciaCloser;
  if not VerIntegridade then Exit;
  vStr_cd_modulo := '22';
  str_cd_rotina := '2208';
  str_cd_mod := vStr_cd_modulo;
  str_cd_rot := str_cd_rotina;
  Application.CreateForm(Tfrm_favor, frm_favor);
  frm_favor.ShowModal;
  KickUser;
end;

procedure Tfrm_main.mi_cad_amzClick(Sender: TObject);
begin
   UserUp;
  ReiniciaCloser;
  if not VerIntegridade then Exit;
  vStr_cd_modulo := '22';
  str_cd_rotina := '2209';
  str_cd_mod := vStr_cd_modulo;
  str_cd_rot := str_cd_rotina;
  Application.CreateForm(Tfrm_amz, frm_amz);
  frm_amz.ShowModal;
  KickUser;
end;

procedure Tfrm_main.mi_cad_mercClick(Sender: TObject);
begin
  UserUp;
  ReiniciaCloser;
  if not VerIntegridade then Exit;
  vStr_cd_modulo := '22';
  str_cd_rotina := '2210';
  str_cd_mod := vStr_cd_modulo;
  str_cd_rot := str_cd_rotina;
  Application.CreateForm(Tfrm_Mercadoria, frm_Mercadoria);
  frm_Mercadoria.cGrupo := '';
  frm_Mercadoria.cImportador := '';
  frm_Mercadoria.ShowModal;
  KickUser;
end;

procedure Tfrm_main.mi_cad_familia_prodClick(Sender: TObject);
begin
  UserUp;
  ReiniciaCloser;
  if not VerIntegridade then Exit;
  vStr_cd_modulo := '22';
  str_cd_rotina := '2242';
  str_cd_mod := vStr_cd_modulo;
  str_cd_rot := str_cd_rotina;
  Application.CreateForm(Tfrm_familia_prod, frm_familia_prod);
  frm_familia_prod.ShowModal;
  KickUser;
end;

procedure Tfrm_main.mi_cad_finalidade_mercClick(Sender: TObject);
begin
  UserUp;
  ReiniciaCloser;
  if not VerIntegridade then Exit;
  vStr_cd_modulo := '22';
  str_cd_rotina := '2243';
  str_cd_mod := vStr_cd_modulo;
  str_cd_rot := str_cd_rotina;
  Application.CreateForm(Tfrm_finalidade_merc, frm_finalidade_merc);
  frm_finalidade_merc.ShowModal;
  KickUser;
end;

procedure Tfrm_main.mi_cad_transp_rodClick(Sender: TObject);
begin
  UserUp;
  ReiniciaCloser;
  if not VerIntegridade then Exit;
  vStr_cd_modulo := '22';
  str_cd_rotina := '2211';
  str_cd_mod := vStr_cd_modulo;
  str_cd_rot := str_cd_rotina;
  Application.CreateForm(Tfrm_transp_rod, frm_transp_rod);
  frm_transp_rod.ShowModal;
  KickUser;
end;

procedure Tfrm_main.mi_cad_via_transpClick(Sender: TObject);
begin
  UserUp;
  ReiniciaCloser;
  if not VerIntegridade then Exit;
  vStr_cd_modulo := '22';
  str_cd_rotina := '2212';
  str_cd_mod := vStr_cd_modulo;
  str_cd_rot := str_cd_rotina;
  Application.CreateForm(Tfrm_via_transp, frm_via_transp);
  frm_via_transp.ShowModal;
  KickUser;
end;

procedure Tfrm_main.mi_cad_hab_despClick(Sender: TObject);
begin
  UserUp;
  ReiniciaCloser;
  if not VerIntegridade then Exit;
  vStr_cd_modulo := '22';
  str_cd_rotina := '2213';
  str_cd_mod := vStr_cd_modulo;
  str_cd_rot := str_cd_rotina;
  Application.CreateForm(Tfrm_hab_desp, frm_hab_desp);
  frm_hab_desp.ShowModal;
  KickUser;
end;

procedure Tfrm_main.mi_cad_fin_itemClick(Sender: TObject);
begin
  UserUp;
  ReiniciaCloser;
  if not VerIntegridade then Exit;
  vStr_cd_modulo := '22';
  str_cd_rotina := '2214';
  str_cd_mod := vStr_cd_modulo;
  str_cd_rot := str_cd_rotina;
  Application.CreateForm(Tfrm_item, frm_item);
  frm_item.ShowModal;
  KickUser;
end;

procedure Tfrm_main.mi_cad_moedaClick(Sender: TObject);
begin
  UserUp;
  ReiniciaCloser;
  if not VerIntegridade then Exit;
  vStr_cd_modulo := '22';
  str_cd_rotina := '2215';
  str_cd_mod := vStr_cd_modulo;
  str_cd_rot := str_cd_rotina;
  Application.CreateForm(Tfrm_moeda, frm_moeda);
  frm_moeda.ShowModal;
  KickUser;
end;

procedure Tfrm_main.mi_cad_fin_conta_bancClick(Sender: TObject);
begin
  UserUp;
  ReiniciaCloser;
  if not VerIntegridade then Exit;
  vStr_cd_modulo := '22';
  str_cd_rotina := '2216';
  str_cd_mod := vStr_cd_modulo;
  str_cd_rot := str_cd_rotina;
  Application.CreateForm(Tfrm_banco, frm_banco);
  frm_banco.ShowModal;
  KickUser;
end;

procedure Tfrm_main.mi_cad_fin_contas_caixaClick(Sender: TObject);
begin
  UserUp;
  ReiniciaCloser;
  if not VerIntegridade then Exit;
  vStr_cd_modulo := '22';
  str_cd_rotina := '2227';
  str_cd_mod := vStr_cd_modulo;
  str_cd_rot := str_cd_rotina;
  Application.CreateForm(Tfrm_conta, frm_conta);
  frm_conta.ShowModal;
  KickUser;
end;

procedure Tfrm_main.mi_cad_fin_conta_contabilClick(Sender: TObject);
begin
  UserUp;
  ReiniciaCloser;
  if not VerIntegridade then Exit;
  vStr_cd_modulo := '22';
  str_cd_rotina := '2245';
  str_cd_mod := vStr_cd_modulo;
  str_cd_rot := str_cd_rotina;
  Application.CreateForm(Tfrm_ct_contabil, frm_ct_contabil);
  frm_ct_contabil.ShowModal;
  KickUser;
end;

procedure Tfrm_main.mi_cad_fin_conta_gerencialClick(Sender: TObject);
begin
  UserUp;
  ReiniciaCloser;
  if not VerIntegridade then Exit;
  vStr_cd_modulo := '22';
  str_cd_rotina := '2247';
  str_cd_mod := vStr_cd_modulo;
  str_cd_rot := str_cd_rotina;
  Application.CreateForm(Tfrm_ct_gerencial, frm_ct_gerencial);
  frm_ct_gerencial.ShowModal;
  KickUser;
end;       

procedure Tfrm_main.mi_cad_fin_hist_padraoClick(Sender: TObject);
begin
  UserUp;
  ReiniciaCloser;
  if not VerIntegridade then Exit;
  vStr_cd_modulo := '22';
  str_cd_rotina := '2248';
  str_cd_mod := vStr_cd_modulo;
  str_cd_rot := str_cd_rotina;
  Application.CreateForm(Tfrm_hist_padrao, frm_hist_padrao);
  frm_hist_padrao.ShowModal;
  KickUser;
end;

procedure Tfrm_main.mi_cad_fin_conta_custoClick(Sender: TObject);
begin
  UserUp;
  ReiniciaCloser;
  if not VerIntegridade then Exit;
  vStr_cd_modulo := '22';
  str_cd_rotina := '2246';
  str_cd_mod := vStr_cd_modulo;
  str_cd_rot := str_cd_rotina;
  Application.CreateForm(Tfrm_ct_custo, frm_ct_custo);
  frm_ct_custo.ShowModal;
  KickUser;
end;

procedure Tfrm_main.mi_tx_sdaClick(Sender: TObject);
begin
  UserUp;
  ReiniciaCloser;
  if not VerIntegridade then Exit;
  vStr_cd_modulo := '22';
  str_cd_rotina := '2217';
  str_cd_mod := vStr_cd_modulo;
  str_cd_rot := str_cd_rotina;
  Application.CreateForm(Tfrm_sda, frm_sda);
  frm_sda.ShowModal;
  KickUser;
end;

procedure Tfrm_main.mi_out_celulaClick(Sender: TObject);
begin
  UserUp;
  ReiniciaCloser;
  if not VerIntegridade then Exit;
  vStr_cd_modulo := '22';
  str_cd_rotina := '2218';
  str_cd_mod := vStr_cd_modulo;
  str_cd_rot := str_cd_rotina;
  Application.CreateForm(Tfrm_celula, frm_celula);
  frm_celula.ShowModal;
  KickUser;
end;

procedure Tfrm_main.mi_tx_expClick(Sender: TObject);
begin
  UserUp;
  ReiniciaCloser;
  if not VerIntegridade then Exit;
  vStr_cd_modulo := '22';
  str_cd_rotina := '2219';
  str_cd_mod := vStr_cd_modulo;
  str_cd_rot := str_cd_rotina;
  Application.CreateForm(Tfrm_expurgo, frm_expurgo);
  frm_expurgo.ShowModal;
  KickUser;
end;

procedure Tfrm_main.mi_tx_darfClick(Sender: TObject);
begin
  UserUp;
  ReiniciaCloser;
  if not VerIntegridade then Exit;
  vStr_cd_modulo := '22';
  str_cd_rotina := '2220';
  str_cd_mod := vStr_cd_modulo;
  str_cd_rot := str_cd_rotina;
  Application.CreateForm(Tfrm_DARF, frm_DARF);
  frm_DARF.ShowModal;
  KickUser;
end;

procedure Tfrm_main.mi_tx_codespClick(Sender: TObject);
begin
  UserUp;
  ReiniciaCloser;
  if not VerIntegridade then Exit;
  vStr_cd_modulo := '22';
  str_cd_rotina := '2221';
  str_cd_mod := vStr_cd_modulo;
  str_cd_rot := str_cd_rotina;
  Application.CreateForm(Tfrm_tx_codesp, frm_tx_codesp);
  frm_tx_codesp.ShowModal;
  KickUser;
end;

procedure Tfrm_main.mi_tx_traClick(Sender: TObject);
begin
  UserUp;
  ReiniciaCloser;
  if not VerIntegridade then Exit;
  vStr_cd_modulo := '22';
  str_cd_rotina := '2222';
  str_cd_mod := vStr_cd_modulo;
  str_cd_rot := str_cd_rotina;
  Application.CreateForm(Tfrm_tx_tra, frm_tx_tra);
  frm_tx_tra.ShowModal;
  KickUser;
end;

procedure Tfrm_main.mi_tx_amzClick(Sender: TObject);
begin
  UserUp;
  (*
  if Not VerIntegridade then Exit;
  vStr_cd_modulo := '22';
  str_cd_rotina := '2223';
  str_cd_mod    := vStr_cd_modulo;
  str_cd_rot    := str_cd_rotina;
  Application.CreateForm( Tfrm_tx_amg, frm_tx_amg );
  frm_tx_amg.ShowModal;
  *)
end;

procedure Tfrm_main.mi_tx_tecaClick(Sender: TObject);
begin
  UserUp;
  ReiniciaCloser;
  if not VerIntegridade then Exit;
  vStr_cd_modulo := '22';
  str_cd_rotina := '2224';
  str_cd_mod := vStr_cd_modulo;
  str_cd_rot := str_cd_rotina;
  Application.CreateForm(Tfrm_tx_teca, frm_tx_teca);
  frm_tx_teca.ShowModal;
  KickUser;
end;

procedure Tfrm_main.mi_cad_embarClick(Sender: TObject);
begin
  UserUp;
  ReiniciaCloser;
  if not VerIntegridade then Exit;
  vStr_cd_modulo := '22';
  str_cd_rotina := '2225';
  str_cd_mod := vStr_cd_modulo;
  str_cd_rot := str_cd_rotina;
  Application.CreateForm(Tfrm_emb, frm_emb);
  frm_emb.ShowModal;
  KickUser;
end;

procedure Tfrm_main.mi_cad_embalClick(Sender: TObject);
begin
  UserUp;
  ReiniciaCloser;
  if not VerIntegridade then Exit;
  vStr_cd_modulo := '22';
  str_cd_rotina := '2226';
  str_cd_mod := vStr_cd_modulo;
  str_cd_rot := str_cd_rotina;
  Application.CreateForm(Tfrm_embal, frm_embal);
  frm_embal.ShowModal;
  KickUser;
end;

procedure Tfrm_main.mi_cad_fin_priori_itensClick(Sender: TObject);
begin
  UserUp;
  ReiniciaCloser;
  if not VerIntegridade then Exit;
  vStr_cd_modulo := '22';
  str_cd_rotina := '2228';
  str_cd_mod := vStr_cd_modulo;
  str_cd_rot := str_cd_rotina;
  Application.CreateForm(Tfrm_priori_item, frm_priori_item);
  frm_priori_item.ShowModal;
  KickUser;
end;

procedure Tfrm_main.mi_agentesClick(Sender: TObject);
begin
  UserUp;
  ReiniciaCloser;
  if not VerIntegridade then Exit;
  vStr_cd_modulo := '22';
  str_cd_rotina := '2229';
  str_cd_mod := vStr_cd_modulo;
  str_cd_rot := str_cd_rotina;
  Application.CreateForm(Tfrm_ag, frm_ag);
  frm_ag.tp_ag := False;
  frm_ag.ShowModal;
  KickUser;
end;

procedure Tfrm_main.mi_cad_areaClick(Sender: TObject);
begin
  UserUp;
  ReiniciaCloser;
  if not VerIntegridade then Exit;
  vStr_cd_modulo := '22';
  str_cd_rotina := '2261';
  str_cd_mod := vStr_cd_modulo;
  str_cd_rot := str_cd_rotina;
  Application.CreateForm(Tfrm_area, frm_area);
  frm_area.ShowModal;
  KickUser;
end;

procedure Tfrm_main.mi_tx_agClick(Sender: TObject);
begin
  UserUp;
  ReiniciaCloser;
  if not VerIntegridade then Exit;
  vStr_cd_modulo := '22';
  str_cd_rotina := '2230';
  str_cd_mod := vStr_cd_modulo;
  str_cd_rot := str_cd_rotina;
  Application.CreateForm(Tfrm_ag_tx, frm_ag_tx);
  frm_ag_tx.ShowModal;
  KickUser;
end;

procedure Tfrm_main.mi_mod_followupClick(Sender: TObject);
begin
  UserUp;
  ReiniciaCloser;
  if not VerIntegridade then Exit;
  vStr_cd_modulo := '22';
  str_cd_rotina := '2231';
  str_cd_mod := vStr_cd_modulo;
  str_cd_rot := str_cd_rotina;
  Application.CreateForm(Tfrm_mod_follow_up, frm_mod_follow_up);
  frm_mod_follow_up.ShowModal;
  KickUser;
end;

procedure Tfrm_main.mi_cad_unid_medidaClick(Sender: TObject);
begin
  UserUp;
  ReiniciaCloser;
  if not VerIntegridade then Exit;
  vStr_cd_modulo := '22';
  str_cd_rotina := '2232';
  str_cd_mod := vStr_cd_modulo;
  str_cd_rot := str_cd_rotina;
  Application.CreateForm(Tfrm_unid_medida, frm_unid_medida);
  frm_unid_medida.ShowModal;
  KickUser;
end;

procedure Tfrm_main.mi_cad_disp_legalClick(Sender: TObject);
begin
  UserUp;
  ReiniciaCloser;
  if not VerIntegridade then Exit;
  vStr_cd_modulo := '22';
  str_cd_rotina := '2233';
  str_cd_mod := vStr_cd_modulo;
  str_cd_rot := str_cd_rotina;
  Application.CreateForm(Tfrm_disp_legal, frm_disp_legal);
  frm_disp_legal.ShowModal;
  KickUser;
end;

procedure Tfrm_main.mi_tabela_unid_negClick(Sender: TObject);
begin
  UserUp;
  ReiniciaCloser;
  if not VerIntegridade then Exit;
  vStr_cd_modulo := '23';
  str_cd_rotina := '2301';
  str_cd_mod := vStr_cd_modulo;
  str_cd_rot := str_cd_rotina;
  Application.CreateForm(Tfrm_unidade, frm_unidade);
  frm_unidade.ShowModal;
  KickUser;
end;

procedure Tfrm_main.mi_tabela_produtoClick(Sender: TObject);
begin
  UserUp;
  ReiniciaCloser;
  if not VerIntegridade then Exit;
  vStr_cd_modulo := '23';
  str_cd_rotina := '2302';
  str_cd_mod := vStr_cd_modulo;
  str_cd_rot := str_cd_rotina;
  Application.CreateForm(Tfrm_produto, frm_produto);
  frm_produto.ShowModal;
  KickUser;
end;

procedure Tfrm_main.mi_tabela_servicoClick(Sender: TObject);
begin
  UserUp;
  ReiniciaCloser;
  if not VerIntegridade then Exit;
  vStr_cd_modulo := '23';
  str_cd_rotina := '2303';
  str_cd_mod := vStr_cd_modulo;
  str_cd_rot := str_cd_rotina;
  Application.CreateForm(Tfrm_servico, frm_servico);
  frm_servico.ShowModal;
  KickUser;
end;

procedure Tfrm_main.mi_tabela_eventoClick(Sender: TObject);
begin
  UserUp;
  ReiniciaCloser;
  if not VerIntegridade then Exit;
  vStr_cd_modulo := '23';
  str_cd_rotina := '2304';
  str_cd_mod := vStr_cd_modulo;
  str_cd_rot := str_cd_rotina;
  Application.CreateForm(Tfrm_evento, frm_evento);
  frm_evento.ShowModal;
  KickUser;
end;

procedure Tfrm_main.mi_tabela_evento_poClick(Sender: TObject);
begin
  UserUp;
  ReiniciaCloser;
  if not VerIntegridade then Exit;
  vStr_cd_modulo := '23';
  str_cd_rotina := '2312';
  str_cd_mod := vStr_cd_modulo;
  str_cd_rot := str_cd_rotina;
  Application.CreateForm(Tfrm_evento_po, frm_evento_po);
  frm_evento_po.ShowModal;
  KickUser;
end;

procedure Tfrm_main.mi_tabela_etapaClick(Sender: TObject);
begin
  UserUp;
  ReiniciaCloser;
  if not VerIntegridade then Exit;
  vStr_cd_modulo := '23';
  str_cd_rotina := '2305';
  str_cd_mod := vStr_cd_modulo;
  str_cd_rot := str_cd_rotina;
  Application.CreateForm(TfrmEtapa, frmEtapa); // PGSM034  PGSM035
  frmEtapa.ShowModal;
  KickUser;
end;

procedure Tfrm_main.mi_tabela_classifClick(Sender: TObject);
begin
  UserUp;
  ReiniciaCloser;
  if not VerIntegridade then Exit;
  vStr_cd_modulo := '23';
  str_cd_rotina := '2306';
  str_cd_mod := vStr_cd_modulo;
  str_cd_rot := str_cd_rotina;
  Application.CreateForm(Tfrm_serv_classif, frm_serv_classif);
  frm_serv_classif.ShowModal;
  KickUser;
end;

procedure Tfrm_main.mi_tabela_moduloClick(Sender: TObject);
begin
  UserUp;
  ReiniciaCloser;
  if not VerIntegridade then Exit;
  vStr_cd_modulo := '23';
  str_cd_rotina := '2308';
  str_cd_mod := vStr_cd_modulo;
  str_cd_rot := str_cd_rotina;
  Application.CreateForm(Tfrm_modulo, frm_modulo);
  frm_modulo.ShowModal;
  KickUser;
end;

procedure Tfrm_main.mi_tabela_cargoClick(Sender: TObject);
begin
  UserUp;
  ReiniciaCloser;
  if not VerIntegridade then Exit;
  vStr_cd_modulo := '24';
  str_cd_rotina := '2401';
  str_cd_mod := vStr_cd_modulo;
  str_cd_rot := str_cd_rotina;
  Application.CreateForm(Tfrm_cargo, frm_cargo);
  frm_cargo.ShowModal;
  KickUser;
end;

procedure Tfrm_main.mi_cadastro_usuarioClick(Sender: TObject);
begin
  UserUp;
  ReiniciaCloser;
  if not VerIntegridade then Exit;
  vStr_cd_modulo := '24';
  str_cd_rotina := '2402';
  str_cd_mod := vStr_cd_modulo;
  str_cd_rot := str_cd_rotina;
  Application.CreateForm(Tfrm_usuario, frm_usuario);
  frm_usuario.ShowModal;
  KickUser;
end;

procedure Tfrm_main.mi_muda_usuarioClick(Sender: TObject);
var i: Integer;
  Handle: THandle;
begin
  Close;
  {
  UserUp;
  if in_aviso_po = '1' then
  begin
    Handle := frm_lembrete_po.Handle;
    if Handle > 0 then
    begin
      frm_lembrete_po.Close;
      frm_lembrete_po.Free;
    end;
  end;
  if not VerIntegridade then Exit;
  vStr_cd_modulo := '24';
  str_cd_rotina := '2403';
  str_cd_mod := vStr_cd_modulo;
  str_cd_rot := str_cd_rotina;
  for i := 0 to ComponentCount - 1 do
  begin
    if (Components[i] is TMenuItem) then
      TMenuItem(Components[i]).Visible := False;
    if (Components[i] is TSpeedButton) then
      TSpeedButton(Components[i]).Visible := False;
  end;
  mi_saida.Visible := True;
//  btn_sair.Visible := True;
  mi_ajuda.Visible := True;
  mi_about.Visible := True;
  btn_about.Visible := True;

  Application.CreateForm(Tfrm_senha, frm_senha);
  frm_senha.ShowModal;
  Application.ProcessMessages;
  KickUser; }
end;

procedure Tfrm_main.mi_out_pesq_logClick(Sender: TObject);
begin
  UserUp;
  ReiniciaCloser;
  if not VerIntegridade then Exit;
  vStr_cd_modulo := '24';
  str_cd_rotina := '2405';
  str_cd_mod := vStr_cd_modulo;
  str_cd_rot := str_cd_rotina;
  Application.CreateForm(Tfrm_pesq_log, frm_pesq_log);
  frm_pesq_log.ShowModal;
  KickUser;
end;

procedure Tfrm_main.mi_parametros_sistemaClick(Sender: TObject);
begin
  UserUp;
  ReiniciaCloser;
  if not VerIntegridade then Exit;
  vStr_cd_modulo := '24';
  str_cd_rotina := '2490';
  str_cd_mod := vStr_cd_modulo;
  str_cd_rot := str_cd_rotina;
  Application.CreateForm(Tfrm_param_sistema, frm_param_sistema);
  frm_param_sistema.ShowModal;
  KickUser;
end;

procedure Tfrm_main.mi_out_recontab_fatClick(Sender: TObject);
begin
  UserUp;
  ReiniciaCloser;
  if not VerIntegridade then Exit;
  vStr_cd_modulo := '24';
  str_cd_rotina := '2492';
  str_cd_mod := vStr_cd_modulo;
  str_cd_rot := str_cd_rotina;
  Application.CreateForm(Tfrm_sel_col_data, frm_sel_col_data);
  frm_sel_col_data.str_cd_relatorio := '1';
  frm_sel_col_data.ShowModal;
  KickUser;
end;

procedure Tfrm_main.mi_out_recontab_finClick(Sender: TObject);
begin
  UserUp;
  ReiniciaCloser;
  if not VerIntegridade then Exit;
  vStr_cd_modulo := '24';
  str_cd_rotina := '2493';
  str_cd_mod := vStr_cd_modulo;
  str_cd_rot := str_cd_rotina;
  Application.CreateForm(Tfrm_sel_col_data, frm_sel_col_data);
  frm_sel_col_data.str_cd_relatorio := '2';
  frm_sel_col_data.ShowModal;
  KickUser;
end;

procedure Tfrm_main.mi_out_nf_broker_sapClick(Sender: TObject);
var Arquivo: string;
begin
  UserUp;
  ReiniciaCloser;
  if not VerIntegridade then Exit;
  vStr_cd_modulo := '24';
  str_cd_rotina := '2406';
  str_cd_mod := vStr_cd_modulo;
  str_cd_rot := str_cd_rotina;
  Arquivo := 'BROKEDI.EXE ' + str_ap_usuario + ' ' + str_senha_usuario;
  WinExec(PChar(Arquivo), SW_SHOW);
  KickUser;
end;

procedure Tfrm_main.mi_out_recontab_ctaapagarClick(Sender: TObject);
begin
  UserUp;
  ReiniciaCloser;
  if not VerIntegridade then Exit;
  vStr_cd_modulo := '24';
  str_cd_rotina := '2497';
  str_cd_mod := vStr_cd_modulo;
  str_cd_rot := str_cd_rotina;
  BoxMensagem('Rotina desabilitada', 3);
  KickUser;
  // Application.CreateForm(Tfrm_recontab_ctaapagar, frm_recontab_ctaapagar);
  // frm_recontab_ctaapagar.ShowModal;
end;

procedure Tfrm_main.mi_LIClick(Sender: TObject);
begin
  UserUp;
  ReiniciaCloser;
  if not VerIntegridade then Exit;
  vStr_cd_modulo := '03';
  str_cd_rotina := '0303';
  str_cd_mod := vStr_cd_modulo;
  str_cd_rot := str_cd_rotina;
  Application.CreateForm(Tfrm_LI, frm_LI);
  frm_LI.ShowModal;
  KickUser;
end;

procedure Tfrm_main.mi_li_trans_LIClick(Sender: TObject);
begin
  UserUp;
  ReiniciaCloser;
  if not VerIntegridade then Exit;
  vStr_cd_modulo := '03';
  str_cd_rotina := '0304';
  str_cd_mod := vStr_cd_modulo;
  str_cd_rot := str_cd_rotina;
  Application.CreateForm(Tfrm_trans_LI, frm_trans_LI);
  frm_trans_LI.ShowModal;
  KickUser;
end;

procedure Tfrm_main.mi_out_Atualiza_SISCOMEXClick(Sender: TObject);
begin
  UserUp;
  ReiniciaCloser;
  if not VerIntegridade then Exit;
  vStr_cd_modulo := '24';
  str_cd_rotina := '2497';
  str_cd_mod := vStr_cd_modulo;
  str_cd_rot := str_cd_rotina;
  Application.CreateForm(Tfrm_AtualizaSISCOMEX, frm_AtualizaSISCOMEX);
  frm_AtualizaSISCOMEX.ShowModal;
  KickUser;
end;

procedure Tfrm_main.mi_cad_feriadoClick(Sender: TObject);
begin
  UserUp;
  ReiniciaCloser;
  if not VerIntegridade then Exit;
  vStr_cd_modulo := '22';
  str_cd_rotina := '2235';
  str_cd_mod := vStr_cd_modulo;
  str_cd_rot := str_cd_rotina;
  Application.CreateForm(Tfrm_feriado, frm_feriado);
  frm_feriado.ShowModal;
  KickUser;
end;

procedure Tfrm_main.mi_tabela_arm_recClick(Sender: TObject);
begin
  UserUp;
  ReiniciaCloser;
  if not VerIntegridade then Exit;
  vStr_cd_modulo := '23';
  str_cd_rotina := '2310';
  str_cd_mod := vStr_cd_modulo;
  str_cd_rot := str_cd_rotina;
  Application.CreateForm(Tfrm_Arm_Rec, frm_Arm_Rec);
  frm_Arm_Rec.ShowModal;
  KickUser;
end;

procedure Tfrm_main.mi_POClick(Sender: TObject);
begin
  UserUp;
  ReiniciaCloser;
  if not VerIntegridade then Exit;
  vStr_cd_modulo := '18';
  str_cd_rotina := '1801';
  str_cd_mod := vStr_cd_modulo;
  str_cd_rot := str_cd_rotina;
  Application.CreateForm(Tfrm_PO, frm_PO);
  frm_PO.edtChave.Text := Trim(nr_po_gestao);
  frm_PO.ShowModal;
  VerAtalho;
  KickUser;
end;

procedure Tfrm_main.mi_po_flpClick(Sender: TObject);
begin
  UserUp;
  ReiniciaCloser;
  if not VerIntegridade then Exit;
  vStr_cd_modulo := '18';
  str_cd_rotina := '1807';
  str_cd_mod := vStr_cd_modulo;
  str_cd_rot := str_cd_rotina;
  Application.CreateForm(Tfrm_po_flp, frm_po_flp);
//  frm_po_flp.pesq_cd_evento := '';
  frm_po_flp.msk_nr_po.Text := Trim(nr_po_gestao);
//  frm_po_flp.msk_nr_processo.Text := Copy(Trim(nr_processo_gestao), 5, 10);
  frm_po_flp.ShowModal;
  VerAtalho;
  KickUser;
end;

procedure Tfrm_main.mi_imp_poClick(Sender: TObject);
begin
  UserUp;
  ReiniciaCloser;
  if not VerIntegridade then Exit;
  vStr_cd_modulo := '18';
  str_cd_rotina := '1806';
  str_cd_mod := vStr_cd_modulo;
  str_cd_rot := str_cd_rotina;
  Application.CreateForm(Tfrm_po_impressao, frm_po_impressao);
  frm_po_impressao.tp_modelo := 1;
  frm_po_impressao.ShowModal;
  KickUser;
end;

procedure Tfrm_main.mi_po_imp_mod2Click(Sender: TObject);
begin
  UserUp;
  ReiniciaCloser;
  if not VerIntegridade then Exit;
  vStr_cd_modulo := '18';
  str_cd_rotina := '1808';
  str_cd_mod := vStr_cd_modulo;
  str_cd_rot := str_cd_rotina;
  Application.CreateForm(Tfrm_po_impressao, frm_po_impressao);
  frm_po_impressao.tp_modelo := 2;
  frm_po_impressao.ShowModal;
  KickUser;
end;

procedure Tfrm_main.mi_po_rel_saldo_mercClick(Sender: TObject);
begin
  UserUp;
  ReiniciaCloser;
  if not VerIntegridade then Exit;
  vStr_cd_modulo := '18';
  str_cd_rotina := '1809';
  str_cd_mod := vStr_cd_modulo;
  str_cd_rot := str_cd_rotina;
  Application.CreateForm(Tfrm_sel_mercadoria, frm_sel_mercadoria);
  frm_sel_mercadoria.tp_rel := 1;
  frm_sel_mercadoria.ShowModal;
  KickUser;
end;

procedure Tfrm_main.mi_po_rel_procClick(Sender: TObject);
begin
  UserUp;
  ReiniciaCloser;
  if not VerIntegridade then Exit;
  vStr_cd_modulo := '18';
  str_cd_rotina := '1810';
  str_cd_mod := vStr_cd_modulo;
  str_cd_rot := str_cd_rotina;
  Application.CreateForm(Tfrm_sel_processo, frm_sel_processo);
  frm_sel_processo.str_cd_relatorio := '5';
  frm_sel_processo.ShowModal;
  KickUser;
end;

procedure Tfrm_main.mi_cad_ncmClick(Sender: TObject);
begin
  UserUp;
  ReiniciaCloser;
  if not VerIntegridade then Exit;
  vStr_cd_modulo := '22';
  str_cd_rotina := '2236';
  str_cd_mod := vStr_cd_modulo;
  str_cd_rot := str_cd_rotina;
  Application.CreateForm(Tfrm_ncm, frm_ncm);
  frm_ncm.Showmodal;
  KickUser;
end;

procedure Tfrm_main.mi_fat_rel_resumo_fatClick(Sender: TObject);
begin
  UserUp;
  ReiniciaCloser;
  if not VerIntegridade then Exit;
  vStr_cd_modulo := '11';
  str_cd_rotina := '1126';
  str_cd_mod := vStr_cd_modulo;
  str_cd_rot := str_cd_rotina;
  Application.CreateForm(Tfrm_sel_unid_cli_grupo_item, frm_sel_unid_cli_grupo_item);
  frm_sel_unid_cli_grupo_item.tp_rel := 3;
  frm_sel_unid_cli_grupo_item.ComPeriodo := True;
  frm_sel_unid_cli_grupo_item.ShowModal;
  KickUser;
  (* Application.CreateForm(Tfrm_sel_unid_cli, frm_sel_unid_cli);
  frm_sel_unid_cli.tp_rel := 12;
  frm_sel_unid_cli.ComPeriodo := True;
  frm_sel_unid_cli.ShowModal; *)
end;

procedure Tfrm_main.mi_cad_scx_exp_acessoClick(Sender: TObject);
begin
  UserUp;
  ReiniciaCloser;
  if not VerIntegridade then Exit;
  vStr_cd_modulo := '22';
  str_cd_rotina := '2237';
  str_cd_mod := vStr_cd_modulo;
  str_cd_rot := str_cd_rotina;
  Application.CreateForm(Tfrm_acesso_scx, frm_acesso_scx);
  frm_acesso_scx.ShowModal;
  KickUser;
end;

procedure Tfrm_main.mi_cad_scx_exp_inst_negocClick(Sender: TObject);
begin
  UserUp;
  ReiniciaCloser;
  if not VerIntegridade then Exit;
  vStr_cd_modulo := '22';
  str_cd_rotina := '2240';
  str_cd_mod := vStr_cd_modulo;
  str_cd_rot := str_cd_rotina;
  Application.CreateForm(Tfrm_inst_negoc, frm_inst_negoc);
  frm_inst_negoc.ShowModal;
  KickUser;
end;

procedure Tfrm_main.mi_cad_scx_exp_urfClick(Sender: TObject);
begin
  UserUp;
  ReiniciaCloser;
  if not VerIntegridade then Exit;
  vStr_cd_modulo := '22';
  str_cd_rotina := '2239';
  str_cd_mod := vStr_cd_modulo;
  str_cd_rot := str_cd_rotina;
  Application.CreateForm(Tfrm_urf_scx_exp, frm_urf_scx_exp);
  frm_urf_scx_exp.ShowModal;
  KickUser;
end;

procedure Tfrm_main.mi_cad_scx_exp_enquad_opClick(Sender: TObject);
begin
  UserUp;
  ReiniciaCloser;
  if not VerIntegridade then Exit;
  vStr_cd_modulo := '22';
  str_cd_rotina := '2238';
  str_cd_mod := vStr_cd_modulo;
  str_cd_rot := str_cd_rotina;
  Application.CreateForm(Tfrm_enquad_op, frm_enquad_op);
  frm_enquad_op.ShowModal;
  KickUser;
end;

procedure Tfrm_main.mi_cad_termo_pagtoClick(Sender: TObject);
begin
  UserUp;
  ReiniciaCloser;
  if not VerIntegridade then Exit;
  vStr_cd_modulo := '22';
  str_cd_rotina := '2241';
  str_cd_mod := vStr_cd_modulo;
  str_cd_rot := str_cd_rotina;
  Application.CreateForm(Tfrm_termo_pagto, frm_termo_pagto);
  frm_termo_pagto.ShowModal;
  KickUser;
end;

procedure Tfrm_main.mi_cad_mod_transClick(Sender: TObject);
begin
  UserUp;
  ReiniciaCloser;
  if not VerIntegridade then Exit;
  vStr_cd_modulo := '22';
  str_cd_rotina := '2244';
  str_cd_mod := vStr_cd_modulo;
  str_cd_rot := str_cd_rotina;
  Application.CreateForm(Tfrm_modalidade_trans, frm_modalidade_trans);
  frm_modalidade_trans.ShowModal;
  KickUser;
end;

procedure Tfrm_main.mi_fat_rel_abfatClick(Sender: TObject);
begin
  UserUp;
  ReiniciaCloser;
  if not VerIntegridade then Exit;
  vStr_cd_modulo := '11';
  str_cd_rotina := '1123';
  str_cd_mod := vStr_cd_modulo;
  str_cd_rot := str_cd_rotina;
  Application.CreateForm(Tfrm_sel_cli_periodo, frm_sel_cli_periodo);
  frm_sel_cli_periodo.tp_relat := '3';
  frm_sel_cli_periodo.ShowModal;
  KickUser;
end;

procedure Tfrm_main.mi_fat_rel_proc_fat_prefixoClick(Sender: TObject);
begin
  UserUp;
  ReiniciaCloser;
  if not VerIntegridade then Exit;
  vStr_cd_modulo := '11';
  str_cd_rotina := '1130';
  str_cd_mod := vStr_cd_modulo;
  str_cd_rot := str_cd_rotina;
  Application.CreateForm(Tfrm_sel_unid_cli, frm_sel_unid_cli);
  frm_sel_unid_cli.tp_rel := 16;
  frm_sel_unid_cli.ComPeriodo := True;
  frm_sel_unid_cli.ShowModal;
  KickUser;
end;

procedure Tfrm_main.mi_preparaClick(Sender: TObject);
begin
  UserUp;
  ReiniciaCloser;
  if not VerIntegridade then Exit;
  vStr_cd_modulo := '18';
  str_cd_rotina := '1802';
  str_cd_mod := vStr_cd_modulo;
  str_cd_rot := str_cd_rotina;
  Application.CreateForm(Tfrm_PO_Prepara, frm_PO_Prepara);
  frm_PO_Prepara.tp_po := '0';
  frm_PO_Prepara.ShowModal;
  KickUser;
end;

procedure Tfrm_main.mi_estornoClick(Sender: TObject);
begin
  UserUp;
  ReiniciaCloser;
  if not VerIntegridade then Exit;
  vStr_cd_modulo := '18';
  str_cd_rotina := '1803';
  str_cd_mod := vStr_cd_modulo;
  str_cd_rot := str_cd_rotina;
  Application.CreateForm(Tfrm_PO_Estorno, frm_PO_Estorno);
  frm_po_estorno.tp_po := '0';
  frm_PO_Estorno.ShowModal;
  KickUser;
end;

procedure Tfrm_main.mi_po_consulta_itensClick(Sender: TObject);
begin
  UserUp;
  ReiniciaCloser;
  if not VerIntegridade then Exit;
  vStr_cd_modulo := '18';
  str_cd_rotina := '1804';
  str_cd_mod := vStr_cd_modulo;
  str_cd_rot := str_cd_rotina;
  Application.CreateForm(Tfrm_PO_Consulta_Itens, frm_PO_Consulta_Itens);
  frm_PO_Consulta_Itens.ShowModal;
  KickUser;
end;

procedure Tfrm_main.mi_po_consulta_prodClick(Sender: TObject);
begin
  UserUp;
  ReiniciaCloser;
  if not VerIntegridade then Exit;
  vStr_cd_modulo := '18';
  str_cd_rotina := '1805';
  str_cd_mod := vStr_cd_modulo;
  str_cd_rot := str_cd_rotina;
  Application.CreateForm(Tfrm_PO_Consulta_Prod, frm_PO_Consulta_Prod);
  frm_PO_Consulta_Prod.ShowModal;
  KickUser;
end;

procedure Tfrm_main.mi_out_leitura_poClick(Sender: TObject);
begin
  UserUp;
  ReiniciaCloser;
  if not VerIntegridade then Exit;
  vStr_cd_modulo := '24';
  str_cd_rotina := '2408';
  str_cd_mod := vStr_cd_modulo;
  str_cd_rot := str_cd_rotina;
  Application.CreateForm(Tfrm_PO_Leitura, frm_PO_Leitura);
  frm_po_leitura.open_file_.InitialDir := 'G:\';
  frm_po_leitura.tp_leitura := 1;
  frm_PO_Leitura.ShowModal;
  KickUser;
end;

procedure Tfrm_main.mi_peClick(Sender: TObject);
begin
  UserUp;
  ReiniciaCloser;
  if not VerIntegridade then Exit;
  vStr_cd_modulo := '19';
  str_cd_rotina := '1901';
  str_cd_mod := vStr_cd_modulo;
  str_cd_rot := str_cd_rotina;
  Application.CreateForm(Tfrm_PE, frm_PE);
  frm_PE.ShowModal;
  KickUser;
end;

procedure Tfrm_main.mi_pe_preparaClick(Sender: TObject);
begin
  UserUp;
  ReiniciaCloser;
  if not VerIntegridade then Exit;
  vStr_cd_modulo := '19';
  str_cd_rotina := '1902';
  str_cd_mod := vStr_cd_modulo;
  str_cd_rot := str_cd_rotina;
  Application.CreateForm(Tfrm_PE_Prepara, frm_PE_Prepara);
  frm_PE_Prepara.ShowModal;
  KickUser;
end;

procedure Tfrm_main.mi_pe_estornoClick(Sender: TObject);
begin
  UserUp;
  ReiniciaCloser;
  if not VerIntegridade then Exit;
  vStr_cd_modulo := '19';
  str_cd_rotina := '1903';
  str_cd_mod := vStr_cd_modulo;
  str_cd_rot := str_cd_rotina;
  Application.CreateForm(Tfrm_PE_Estorno, frm_PE_Estorno);
  frm_PE_Estorno.ShowModal;
  KickUser;
end;

procedure Tfrm_main.mi_pe_consulta_itensClick(Sender: TObject);
begin
  UserUp;
  ReiniciaCloser;
  if not VerIntegridade then Exit;
  vStr_cd_modulo := '19';
  str_cd_rotina := '1904';
  str_cd_mod := vStr_cd_modulo;
  str_cd_rot := str_cd_rotina;
  Application.CreateForm(Tfrm_PE_Consulta_Itens, frm_PE_Consulta_Itens);
  frm_PE_Consulta_Itens.ShowModal;
  KickUser;
end;

procedure Tfrm_main.mi_pe_consulta_prodClick(Sender: TObject);
begin
  UserUp;
  ReiniciaCloser;
  if not VerIntegridade then Exit;
  vStr_cd_modulo := '19';
  str_cd_rotina := '1905';
  str_cd_mod := vStr_cd_modulo;
  str_cd_rot := str_cd_rotina;
  Application.CreateForm(Tfrm_PE_Consulta_Prod, frm_PE_Consulta_Prod);
  frm_PE_Consulta_Prod.ShowModal;
  KickUser;
end;

procedure Tfrm_main.mi_imp_peClick(Sender: TObject);
begin
  UserUp;
  ReiniciaCloser;
  if not VerIntegridade then Exit;
  vStr_cd_modulo := '19';
  str_cd_rotina := '1906';
  str_cd_mod := vStr_cd_modulo;
  str_cd_rot := str_cd_rotina;
  Application.CreateForm(Tfrm_pe_impressao, frm_pe_impressao);
  frm_pe_impressao.ShowModal;
  KickUser;
end;

procedure Tfrm_main.mi_expClick(Sender: TObject);
begin
  UserUp;
  ReiniciaCloser;
  if not VerIntegridade then Exit;
  vStr_cd_modulo := '20';
  str_cd_rotina := '2001';
  str_cd_mod := vStr_cd_modulo;
  str_cd_rot := str_cd_rotina;
  Application.CreateForm(Tfrm_Exp, frm_Exp);
  frm_exp.pesq_cd_unid_neg := cd_unid_neg_gestao;
  frm_exp.pesq_nr_processo := nr_processo_gestao;
  frm_Exp.ShowModal;
  VerAtalho;
  KickUser;
end;

procedure Tfrm_main.mi_exp_impClick(Sender: TObject);
begin
  UserUp;
  ReiniciaCloser;
  if not VerIntegridade then Exit;
  vStr_cd_modulo := '20';
  str_cd_rotina := '2008';
  str_cd_mod := vStr_cd_modulo;
  str_cd_rot := str_cd_rotina;
  Application.CreateForm(Tfrm_Exp_Impressao, frm_Exp_Impressao);
  frm_Exp_Impressao.ShowModal;
  KickUser;
end;

procedure Tfrm_main.mi_exp_doc_fat_comClick(Sender: TObject);
{var
  hMod : THandle;
  AbreFaturaComercial : procedure(nr_processo : string);}
begin
  UserUp;
  ReiniciaCloser;
  if not VerIntegridade then Exit;
  vStr_cd_modulo := '20';
  str_cd_rotina := '2003';
  str_cd_mod := vStr_cd_modulo;
  str_cd_rot := str_cd_rotina;
  Application.CreateForm(Tfrm_exp_impr_fatura, frm_exp_impr_fatura);
  frm_exp_impr_fatura.ShowModal;
  KickUser;

  {hMod := LoadLibrary('FatCom.DLL');
  if (hMod = 0) then Exit;   
  @AbreFaturaComercial := GetProcAddress(hMod, 'AbreFaturaComercial');
  if @AbreFaturaComercial <> nil then
    AbreFaturaComercial( '' );
  FreeLibrary(hMod);}
end;

procedure Tfrm_main.mi_exp_doc_cert_origClick(Sender: TObject);
begin
  UserUp;
  ReiniciaCloser;
  if not VerIntegridade then Exit;
  vStr_cd_modulo := '20';
  str_cd_rotina := '2004';
  str_cd_mod := vStr_cd_modulo;
  str_cd_rot := str_cd_rotina;
  Application.CreateForm(Tfrm_exp_impr_cert_orig, frm_exp_impr_cert_orig);
  frm_exp_impr_cert_orig.ShowModal;
  KickUser;
end;

procedure Tfrm_main.mi_exp_doc_packing_listClick(Sender: TObject);
begin
  UserUp;
  ReiniciaCloser;
  if not VerIntegridade then Exit;
  vStr_cd_modulo := '20';
  str_cd_rotina := '2005';
  str_cd_mod := vStr_cd_modulo;
  str_cd_rot := str_cd_rotina;
  Application.CreateForm(Tfrm_exp_impr_packing, frm_exp_impr_packing);
  frm_exp_impr_packing.ShowModal;
  KickUser;
end;

procedure Tfrm_main.mi_exp_doc_cert_seguroClick(Sender: TObject);
begin
  UserUp;
  ReiniciaCloser;
  if not VerIntegridade then Exit;
  vStr_cd_modulo := '20';
  str_cd_rotina := '2006';
  str_cd_mod := vStr_cd_modulo;
  str_cd_rot := str_cd_rotina;
  Application.CreateForm(Tfrm_exp_impr_cert_seg, frm_exp_impr_cert_seg);
  frm_exp_impr_cert_seg.ShowModal;
  KickUser;
end;

procedure Tfrm_main.mi_exp_doc_instr_embClick(Sender: TObject);
begin
  UserUp;
  ReiniciaCloser;
  if not VerIntegridade then Exit;
  vStr_cd_modulo := '20';
  str_cd_rotina := '2007';
  str_cd_mod := vStr_cd_modulo;
  str_cd_rot := str_cd_rotina;
  Application.CreateForm(Tfrm_exp_impr_instr_emb, frm_exp_impr_instr_emb);
  frm_exp_impr_instr_emb.ShowModal;
  KickUser;
end;

procedure Tfrm_main.mi_cad_merc_expClick(Sender: TObject);
begin
  UserUp;
  ReiniciaCloser;
  if not VerIntegridade then Exit;
  vStr_cd_modulo := '22';
  str_cd_rotina := '2249';
  str_cd_mod := vStr_cd_modulo;
  str_cd_rot := str_cd_rotina;
  Application.CreateForm(Tfrm_Mercadoria_Exp, frm_Mercadoria_Exp);

//  Screen.Cursor := crHourGlass;
//  Application.ProcessMessages;

//  CloseStoredProc(datm_mercadoria_exp.sp_mercadoria_exp_);
//  datm_mercadoria_exp.sp_mercadoria_exp_.ParamByName('@cd_exportador').AsString := '';
//  datm_mercadoria_exp.sp_mercadoria_exp_.ParamByName('@cd_grupo').AsString := '';
//  ExecStoredProc(datm_mercadoria_exp.sp_mercadoria_exp_);
//  frm_mercadoria_exp.nr_identificador := datm_mercadoria_exp.sp_mercadoria_exp_.ParamByName('@nr_identificador').AsInteger;
//  CloseStoredProc(datm_mercadoria_exp.sp_mercadoria_exp_);

  datm_mercadoria_exp.qry_lista_.Close;
//  datm_mercadoria_exp.qry_lista_.ParamByName('NR_IDENTIFICADOR').asInteger := frm_mercadoria_exp.nr_identificador;
  datm_mercadoria_exp.qry_lista_.Prepare;
  datm_mercadoria_exp.qry_lista_.Open;

//  Screen.Cursor := crDefault;

  frm_Mercadoria_exp.ShowModal;
  KickUser;
end;

procedure Tfrm_main.mi_bloqueio_eventoClick(Sender: TObject);
begin
//  UserUp;
//  ReiniciaCloser;
//  if not VerIntegridade then Exit;
//  vStr_cd_modulo := '01';
//  str_cd_rotina := '0118';
//  str_cd_mod := vStr_cd_modulo;
//  str_cd_rot := str_cd_rotina;
//  Application.CreateForm(Tfrm_bloqueio_evento, frm_bloqueio_evento);
//  frm_bloqueio_evento.ShowModal;
//  KickUser;
end;

procedure Tfrm_main.mi_repasse_dadosClick(Sender: TObject);
begin
//  UserUp;
//  ReiniciaCloser;
//  if not VerIntegridade then Exit;
//  vStr_cd_modulo := '01';
//  str_cd_rotina := '0117';
//  str_cd_mod := vStr_cd_modulo;
//  str_cd_rot := str_cd_rotina;
//  Application.CreateForm(Tfrm_repassa_dados, frm_repassa_dados);
//  frm_repassa_dados.ShowModal;
//  KickUser;
end;

procedure Tfrm_main.mi_fin_manut_rel_reemb_finClick(Sender: TObject);
begin
  UserUp;
  ReiniciaCloser;
  if not VerIntegridade then Exit;
  vStr_cd_modulo := '12';
  str_cd_rotina := '1214';
  str_cd_mod := vStr_cd_modulo;
  str_cd_rot := str_cd_rotina;
  Application.CreateForm(Tfrm_manut_rel_fin, frm_manut_rel_fin);
  frm_manut_rel_fin.ShowModal;
  KickUser;
end;

procedure Tfrm_main.mi_fin_rel_desembClick(Sender: TObject);
begin
  UserUp;
  ReiniciaCloser;
  if not VerIntegridade then Exit;
  vStr_cd_modulo := '12';
  str_cd_rotina := '1211';
  str_cd_mod := vStr_cd_modulo;
  str_cd_rot := str_cd_rotina;
  Application.CreateForm(Tfrm_sel_unid_prod_fin, frm_sel_unid_prod_fin);
  frm_sel_unid_prod_fin.tp_rel := 1;
  frm_sel_unid_prod_fin.ShowModal;
  KickUser;
end;

procedure Tfrm_main.mi_rel_imp_desp_nao_desemb_diClick(Sender: TObject);
begin
  UserUp;
  ReiniciaCloser;
  if not VerIntegridade then Exit;
  vStr_cd_modulo := '15';
  str_cd_rotina := '1551';
  str_cd_mod := vStr_cd_modulo;
  str_cd_rot := str_cd_rotina;
  Application.CreateForm(Tfrm_sel_unid_prod_emb, frm_sel_unid_prod_emb);
  frm_sel_unid_prod_emb.tp_rel := 5;
  frm_sel_unid_prod_emb.ComPeriodo := False;
  frm_sel_unid_prod_emb.ShowModal;
  KickUser;
end;

procedure Tfrm_main.mi_rel_imp_followup_navioClick(Sender: TObject);
begin
  UserUp;
  ReiniciaCloser;
  if not VerIntegridade then Exit;
  vStr_cd_modulo := '15';
  str_cd_rotina := '1552';
  str_cd_mod := vStr_cd_modulo;
  str_cd_rot := str_cd_rotina;
  Application.CreateForm(Tfrm_sel_unid_prod_emb, frm_sel_unid_prod_emb);
  frm_sel_unid_prod_emb.tp_rel := 1;
  frm_sel_unid_prod_emb.ComPeriodo := True;
  frm_sel_unid_prod_emb.ShowModal;
  KickUser;
end;

procedure Tfrm_main.mi_rel_imp_pos_veiculosClick(Sender: TObject);
begin
  UserUp;
  ReiniciaCloser;
  if not VerIntegridade then Exit;
  vStr_cd_modulo := '15';
  str_cd_rotina := '1550';
  str_cd_mod := vStr_cd_modulo;
  str_cd_rot := str_cd_rotina;
  Application.CreateForm(Tfrm_sel_unid_prod_via, frm_sel_unid_prod_via);
  frm_sel_unid_prod_via.tp_rel := 1;
  frm_sel_unid_prod_via.ShowModal;
  KickUser;
end;

procedure Tfrm_main.mi_rel_imp_desp_armClick(Sender: TObject);
begin
  UserUp;
  ReiniciaCloser;
  if not VerIntegridade then Exit;
  vStr_cd_modulo := '15';
  str_cd_rotina := '1553';
  str_cd_mod := vStr_cd_modulo;
  str_cd_rot := str_cd_rotina;
  Application.CreateForm(Tfrm_sel_unid_prod_arm, frm_sel_unid_prod_arm);
  frm_sel_unid_prod_arm.tp_rel := 1;
  frm_sel_unid_prod_arm.ComPeriodo := True;
  frm_sel_unid_prod_arm.ShowModal;
  KickUser;
end;

procedure Tfrm_main.mi_rel_imp_desp_pagtoClick(Sender: TObject);
begin
  UserUp;
  ReiniciaCloser;
  if not VerIntegridade then Exit;
  vStr_cd_modulo := '15';
  str_cd_rotina := '1554';
  str_cd_mod := vStr_cd_modulo;
  str_cd_rot := str_cd_rotina;
  Application.CreateForm(Tfrm_sel_unid_prod_emb, frm_sel_unid_prod_emb);
  frm_sel_unid_prod_emb.tp_rel := 2;
  frm_sel_unid_prod_emb.ComPeriodo := False;
  frm_sel_unid_prod_emb.ShowModal;
  KickUser;
end;

procedure Tfrm_main.mi_emi_sol_liberacaoClick(Sender: TObject);
begin
  UserUp;
  ReiniciaCloser;
  if not VerIntegridade then Exit;
  vStr_cd_modulo := '05';
  str_cd_rotina := '0503';
  str_cd_mod := vStr_cd_modulo;
  str_cd_rot := str_cd_rotina;
  Application.CreateForm(Tfrm_libera_sol_aberto, frm_libera_sol_aberto);
  frm_libera_sol_aberto.ShowModal;
  KickUser;
end;

procedure Tfrm_main.mi_rel_imp_minuta_transpClick(Sender: TObject);
begin
  UserUp;
  (* if Not VerIntegridade then Exit;
  vStr_cd_modulo := '15';
  str_cd_rotina := '1549';
  str_cd_mod    := vStr_cd_modulo;
  str_cd_rot    := str_cd_rotina;
  Application.CreateForm(Tfrm_sel_data, frm_sel_data);
  frm_sel_data.str_cd_relatorio := '14';
  frm_sel_data.ShowModal; *)
  ReiniciaCloser;
  if not VerIntegridade then Exit;
  vStr_cd_modulo := '15';
  str_cd_rotina := '1549';
  str_cd_mod := vStr_cd_modulo;
  str_cd_rot := str_cd_rotina;
  Application.CreateForm(Tfrm_sel_cli_periodo, frm_sel_cli_periodo);
  frm_sel_cli_periodo.tp_relat := '4';
  frm_sel_cli_periodo.ShowModal;
  KickUser;
end;

procedure Tfrm_main.mi_imp_itensClick(Sender: TObject);
begin
  UserUp;
  ReiniciaCloser;
  if not VerIntegridade then Exit;
  vStr_cd_modulo := '02';
  str_cd_rotina := '0209';
  str_cd_mod := vStr_cd_modulo;
  str_cd_rot := str_cd_rotina;
  Application.CreateForm(Tfrm_sel_processo, frm_sel_processo);
  frm_sel_processo.str_cd_relatorio := '4';
  frm_sel_processo.ShowModal;
  KickUser;
end;

procedure Tfrm_main.mi_cad_scx_exp_acordoClick(Sender: TObject);
begin
  UserUp;
  ReiniciaCloser;
  if not VerIntegridade then Exit;
  vStr_cd_modulo := '22';
  str_cd_rotina := '2250';
  str_cd_mod := vStr_cd_modulo;
  str_cd_rot := str_cd_rotina;
  Application.CreateForm(Tfrm_acordo, frm_acordo);
  frm_acordo.ShowModal;
  KickUser;
end;

procedure Tfrm_main.mi_cad_scx_exp_cabecalhoClick(Sender: TObject);
begin
  UserUp;
  ReiniciaCloser;
  if not VerIntegridade then Exit;
  vStr_cd_modulo := '22';
  str_cd_rotina := '2252';
  str_cd_mod := vStr_cd_modulo;
  str_cd_rot := str_cd_rotina;
  Application.CreateForm(Tfrm_cabecalho, frm_cabecalho);
  frm_cabecalho.ShowModal;
  KickUser;
end;

procedure Tfrm_main.mi_cad_scx_exp_local_emisClick(Sender: TObject);
begin
  UserUp;
  ReiniciaCloser;
  if not VerIntegridade then Exit;
  vStr_cd_modulo := '22';
  str_cd_rotina := '2253';
  str_cd_mod := vStr_cd_modulo;
  str_cd_rot := str_cd_rotina;
  Application.CreateForm(Tfrm_local_emissao, frm_local_emissao);
  frm_local_emissao.ShowModal;
  KickUser;
end;

procedure Tfrm_main.mi_rel_exp_pos_veiculosClick(Sender: TObject);
begin
  UserUp;
  ReiniciaCloser;
  if not VerIntegridade then Exit;
  vStr_cd_modulo := '15';
  str_cd_rotina := '1548';
  str_cd_mod := vStr_cd_modulo;
  str_cd_rot := str_cd_rotina;
  Application.CreateForm(Tfrm_sel_unid_prod_via, frm_sel_unid_prod_via);
  frm_sel_unid_prod_via.tp_rel := 2;
  frm_sel_unid_prod_via.ShowModal;
  KickUser;
end;

procedure Tfrm_main.mi_rel_exp_flpClick(Sender: TObject);
begin
  UserUp;
  ReiniciaCloser;
  if not VerIntegridade then Exit;
  vStr_cd_modulo := '15';
  str_cd_rotina := '1556';
  str_cd_mod := vStr_cd_modulo;
  str_cd_rot := str_cd_rotina;
  Application.CreateForm(Tfrm_rel_exp_flp, frm_rel_exp_flp);
  frm_rel_exp_flp.tp_rel := 1;
  frm_rel_exp_flp.ShowModal;
  KickUser;
end;

procedure Tfrm_main.mi_out_po_sap_brokerClick(Sender: TObject);
begin
  UserUp;
  ReiniciaCloser;
  if not VerIntegridade then Exit;
  vStr_cd_modulo := '24';
  str_cd_rotina := '2407';
  str_cd_mod := vStr_cd_modulo;
  str_cd_rot := str_cd_rotina;
  Application.CreateForm(Tfrm_PO_Leitura, frm_PO_Leitura);
  frm_po_leitura.open_file_.InitialDir := 'O:\';
  frm_po_leitura.tp_leitura := 2;
  frm_PO_Leitura.ShowModal;
  KickUser;
end;

procedure Tfrm_main.mi_out_exp_brok_sapClick(Sender: TObject);
begin
  UserUp;
  ReiniciaCloser;
  if not VerIntegridade then Exit;
  vStr_cd_modulo := '24';
  str_cd_rotina := '2409';
  str_cd_mod := vStr_cd_modulo;
  str_cd_rot := str_cd_rotina;
  Application.CreateForm(Tfrm_integra_basf, frm_integra_basf);
  frm_integra_basf.ShowModal;
  frm_integra_basf.Free;
  KickUser;
end;

procedure Tfrm_main.mi_out_exp_retornoClick(Sender: TObject);
begin
  UserUp;
  ReiniciaCloser;
  if not VerIntegridade then Exit;
  vStr_cd_modulo := '24';
  str_cd_rotina := '2411';
  str_cd_mod := vStr_cd_modulo;
  str_cd_rot := str_cd_rotina;
  Application.CreateForm(Tfrm_retorno_fi, frm_retorno_fi);
  frm_retorno_fi.ShowModal;
  KickUser;
end;

procedure Tfrm_main.mi_tabela_de_paraClick(Sender: TObject);
begin
  UserUp;
  ReiniciaCloser;
  if not VerIntegridade then Exit;
  vStr_cd_modulo := '23';
  str_cd_rotina := '2311';
  str_cd_mod := vStr_cd_modulo;
  str_cd_rot := str_cd_rotina;
  Application.CreateForm(Tfrm_de_para, frm_de_para);
  frm_de_para.ShowModal;
  KickUser;
end;

procedure Tfrm_main.mi_exp_saqueClick(Sender: TObject);
begin
  UserUp;
  ReiniciaCloser;
  if not VerIntegridade then Exit;
  vStr_cd_modulo := '20';
  str_cd_rotina := '2002';
  str_cd_mod := vStr_cd_modulo;
  str_cd_rot := str_cd_rotina;
  Application.CreateForm(Tfrm_Exp_Saque, frm_Exp_Saque);
  frm_Exp_Saque.ShowModal;
  KickUser;
end;

procedure Tfrm_main.mi_exp_doc_saqueClick(Sender: TObject);
begin
  UserUp;
  ReiniciaCloser;
  if not VerIntegridade then Exit;
  vStr_cd_modulo := '20';
  str_cd_rotina := '2009';
  str_cd_mod := vStr_cd_modulo;
  str_cd_rot := str_cd_rotina;
  Application.CreateForm(Tfrm_Exp_Impr_Saque, frm_Exp_Impr_Saque);
  frm_Exp_Impr_Saque.ShowModal;
  KickUser;
end;

procedure Tfrm_main.mi_cad_scx_exp_ncmClick(Sender: TObject);
begin
  UserUp;
  ReiniciaCloser;
  if not VerIntegridade then Exit;
  vStr_cd_modulo := '22';
  str_cd_rotina := '2254';
  str_cd_mod := vStr_cd_modulo;
  str_cd_rot := str_cd_rotina;
  Application.CreateForm(Tfrm_ncm_exp, frm_ncm_exp);
  frm_ncm_exp.Showmodal;
  KickUser;
end;

procedure Tfrm_main.mi_cad_scx_exp_naladinccaClick(Sender: TObject);
begin
  UserUp;
  ReiniciaCloser;
  if not VerIntegridade then Exit;
  vStr_cd_modulo := '22';
  str_cd_rotina := '2255';
  str_cd_mod := vStr_cd_modulo;
  str_cd_rot := str_cd_rotina;
  Application.CreateForm(Tfrm_naladi_ncca_exp, frm_naladi_ncca_exp);
  frm_naladi_ncca_exp.Showmodal;
  KickUser;
end;

procedure Tfrm_main.mi_cad_scx_exp_naladishClick(Sender: TObject);
begin
  UserUp;
  ReiniciaCloser;
  if not VerIntegridade then Exit;
  vStr_cd_modulo := '22';
  str_cd_rotina := '2256';
  str_cd_mod := vStr_cd_modulo;
  str_cd_rot := str_cd_rotina;
  Application.CreateForm(Tfrm_naladi_sh_exp, frm_naladi_sh_exp);
  frm_naladi_sh_exp.Showmodal;
  KickUser;
end;

procedure Tfrm_main.mi_fin_rel_tab_jurosClick(Sender: TObject);
begin
  UserUp;
  ReiniciaCloser;
  if not VerIntegridade then Exit;
  vStr_cd_modulo := '12';
  str_cd_rotina := '1213';
  str_cd_mod := vStr_cd_modulo;
  str_cd_rot := str_cd_rotina;
  Application.CreateForm(Tfrm_sel_moeda_periodo, frm_sel_moeda_periodo);
  frm_sel_moeda_periodo.str_cd_relatorio := '1';
  frm_sel_moeda_periodo.ShowModal;
  KickUser;
end;

procedure Tfrm_main.mi_fat_rel_demo_ccClick(Sender: TObject);
begin
  UserUp;
  ReiniciaCloser;
  if not VerIntegridade then Exit;
  vStr_cd_modulo := '11';
  str_cd_rotina := '1124';
  str_cd_mod := vStr_cd_modulo;
  str_cd_rot := str_cd_rotina;
  Application.CreateForm(Tfrm_sel_unid_prod, frm_sel_unid_prod);
  frm_sel_unid_prod.tp_rel := 27;
  frm_sel_unid_prod.ComPeriodo := True;
  frm_sel_unid_prod.ShowModal;
  KickUser;
end;

procedure Tfrm_main.mi_fat_rel_cc_cliClick(Sender: TObject);
begin
  UserUp;
  ReiniciaCloser;
  if not VerIntegridade then Exit;
  vStr_cd_modulo := '11';
  str_cd_rotina := '1125';
  str_cd_mod := vStr_cd_modulo;
  str_cd_rot := str_cd_rotina;
  Application.CreateForm(Tfrm_sel_unid_cli, frm_sel_unid_cli);
  frm_sel_unid_cli.tp_rel := 11;
  frm_sel_unid_cli.ComPeriodo := True;
  frm_sel_unid_cli.ShowModal;
  KickUser;
end;

procedure Tfrm_main.mi_exp_borderoClick(Sender: TObject);
begin
  UserUp;
  ReiniciaCloser;
  if not VerIntegridade then Exit;
  vStr_cd_modulo := '20';
  str_cd_rotina := '2010';
  str_cd_mod := vStr_cd_modulo;
  str_cd_rot := str_cd_rotina;
  Application.CreateForm(Tfrm_Exp_Bordero, frm_Exp_Bordero);
  frm_Exp_Bordero.ShowModal;
  KickUser;
end;

procedure Tfrm_main.mi_exp_doc_borderoClick(Sender: TObject);
begin
  UserUp;
  ReiniciaCloser;
  if not VerIntegridade then Exit;
  vStr_cd_modulo := '20';
  str_cd_rotina := '2011';
  str_cd_mod := vStr_cd_modulo;
  str_cd_rot := str_cd_rotina;
  Application.CreateForm(Tfrm_exp_impr_bordero, frm_exp_impr_bordero);
  frm_exp_impr_bordero.ShowModal;
  KickUser;
end;

procedure Tfrm_main.mi_cad_documentoClick(Sender: TObject);
begin
  UserUp;
  ReiniciaCloser;
  if not VerIntegridade then Exit;
  vStr_cd_modulo := '22';
  str_cd_rotina := '2257';
  str_cd_mod := vStr_cd_modulo;
  str_cd_rot := str_cd_rotina;
  Application.CreateForm(Tfrm_documento, frm_documento);
  frm_documento.ShowModal;
  KickUser;
end;

procedure Tfrm_main.mi_cad_urfClick(Sender: TObject);
begin
  UserUp;
  // 0609
  ReiniciaCloser;
  if not VerIntegridade then Exit;
  vStr_cd_modulo := '22';
  str_cd_rotina := '2260';
  str_cd_mod := vStr_cd_modulo;
  str_cd_rot := str_cd_rotina;
  Application.CreateForm(Tfrm_urf_scx, frm_urf_scx);
  frm_urf_scx.ShowModal;
  KickUser;
end;

procedure Tfrm_main.mi_di_transClick(Sender: TObject);
begin
  UserUp;
  // 0609
  ReiniciaCloser;
  if not VerIntegridade then Exit;
  vStr_cd_modulo := '02';
  str_cd_rotina := '0211';
  str_cd_mod := vStr_cd_modulo;
  str_cd_rot := str_cd_rotina;
  Application.CreateForm(Tfrm_trans_di, frm_trans_di);
  frm_trans_di.ShowModal;
  KickUser;
end;

procedure Tfrm_main.mi_cad_paisClick(Sender: TObject);
begin
  UserUp;
  ReiniciaCloser;
  if not VerIntegridade then Exit;
  vStr_cd_modulo := '22';
  str_cd_rotina := '2265';
  str_cd_mod := vStr_cd_modulo;
  str_cd_rot := str_cd_rotina;
  Application.CreateForm(Tfrm_pais, frm_pais);
  frm_pais.ShowModal;
  KickUser;
end;

procedure Tfrm_main.mi_out_imp_nf_procClick(Sender: TObject);
begin
  UserUp;
  ReiniciaCloser;
  if not VerIntegridade then Exit;
  vStr_cd_modulo := '24';
  str_cd_rotina := '2410';
  str_cd_mod := vStr_cd_modulo;
  str_cd_rot := str_cd_rotina;
  Application.CreateForm(Tfrm_exp_leitura_nf, frm_exp_leitura_nf);
  frm_exp_leitura_nf.ShowModal;
  frm_exp_leitura_nf.Free;
  KickUser;
end;

procedure Tfrm_main.mi_di_recuperaClick(Sender: TObject);
begin
  UserUp;
  ReiniciaCloser;
  if not VerIntegridade then Exit;
  vStr_cd_modulo := '02';
  str_cd_rotina := '0212';
  str_cd_mod := vStr_cd_modulo;
  str_cd_rot := str_cd_rotina;
  Application.CreateForm(Tfrm_di_rec_diag, frm_di_rec_diag);
  frm_di_rec_diag.str_rec_diag := '1';
  frm_di_rec_diag.ShowModal;
  KickUser;
end;

procedure Tfrm_main.mi_exp_prep_reClick(Sender: TObject);
//var
//  Arquivo: string;
begin
  UserUp;
//  ReiniciaCloser;
//  if not VerIntegridade then Exit;
//  vStr_cd_modulo := '20';
//  str_cd_rotina := '2012';
//  str_cd_mod := vStr_cd_modulo;
//  str_cd_rot := str_cd_rotina;
//
//  Arquivo := 'BROKHED.EXE ' + 'PREPARA_RE ' + str_cd_usuario + ' ' + str_cd_cargo + ' ' + str_cd_unid_neg;
//  WinExec(PChar(Arquivo), SW_SHOW);

  ReiniciaCloser;
  if not VerIntegridade then Exit;
  vStr_cd_modulo := '20';
  str_cd_rotina := '2012';
  str_cd_mod := vStr_cd_modulo;
  str_cd_rot := str_cd_rotina;
  Application.CreateForm(Tfrm_exp_monta_re, frm_exp_monta_re);
  frm_exp_monta_re.ShowModal;
  KickUser;
end;

procedure Tfrm_main.mi_rel_imp_and_servicoClick(Sender: TObject);
begin
  UserUp;
  ReiniciaCloser;
  if not VerIntegridade then Exit;
  vStr_cd_modulo := '15';
  str_cd_rotina := '1555';
  str_cd_mod := vStr_cd_modulo;
  str_cd_rot := str_cd_rotina;
  Application.CreateForm(Tfrm_rel_and_servico, frm_rel_and_servico);
  frm_rel_and_servico.ShowModal;
  KickUser;
end;

procedure Tfrm_main.mi_fat_rel_fat_nf_nota_emit_cancClick(Sender: TObject);
begin
  UserUp;
  ReiniciaCloser;
  if not VerIntegridade then Exit;
  vStr_cd_modulo := '11';
  str_cd_rotina := '1131';
  str_cd_mod := vStr_cd_modulo;
  str_cd_rot := str_cd_rotina;
  Application.CreateForm(Tfrm_sel_unid_cli, frm_sel_unid_cli);
  frm_sel_unid_cli.tp_rel := 17;
  frm_sel_unid_cli.ComPeriodo := True;
  frm_sel_unid_cli.ShowModal;
  KickUser;
end;

procedure Tfrm_main.mi_adm_copias_cheque1Click(Sender: TObject);
begin
  UserUp;
  ReiniciaCloser;
  if not VerIntegridade then Exit;
  vStr_cd_modulo := '37';
  str_cd_rotina := '3709';
  str_cd_mod := vStr_cd_modulo;
  str_cd_rot := str_cd_rotina;
  Application.CreateForm(Tfrm_sel_data, frm_sel_data);
  frm_sel_data.str_cd_relatorio := '15';
  frm_sel_data.ShowModal;
  KickUser;
end;

procedure Tfrm_main.mi_ajuste_impressao_icms_rgsClick(Sender: TObject);
begin
  UserUp;
  ReiniciaCloser;
  if not VerIntegridade then Exit;
  vStr_cd_modulo := '24';
  str_cd_rotina := '2412';
  str_cd_mod := vStr_cd_modulo;
  str_cd_rot := str_cd_rotina;
  Application.CreateForm(Tfrm_ajuste_impressao_icms, frm_ajuste_impressao_icms);
  frm_ajuste_impressao_icms.str_cd_documento := '001';
  frm_ajuste_impressao_icms.ShowModal;
  KickUser;
end;

procedure Tfrm_main.mi_out_edit_docClick(Sender: TObject);
var Arquivo: string;
begin
  UserUp;
  ReiniciaCloser;
  if not VerIntegridade then Exit;
  vStr_cd_modulo := '24';
  str_cd_rotina := '2413';
  str_cd_mod := vStr_cd_modulo;
  str_cd_rot := str_cd_rotina;
  Arquivo := 'DDEDITMOD.EXE ';
  WinExec(PChar(Arquivo), SW_SHOW);
  KickUser;
end;

procedure Tfrm_main.mi_rec_num_rel_nao_recClick(Sender: TObject);
begin
  UserUp;
  ReiniciaCloser;
  if not VerIntegridade then Exit;
  vStr_cd_modulo := '06';
  str_cd_rotina := '0607';
  str_cd_mod := vStr_cd_modulo;
  str_cd_rot := str_cd_rotina;
  Application.CreateForm(Tfrm_sel_unid_prod, frm_sel_unid_prod);
  frm_sel_unid_prod.tp_rel := 11;
  frm_sel_unid_prod.ComPeriodo := True;
  frm_sel_unid_prod.ShowModal;
  KickUser;
end;

procedure Tfrm_main.mi_ajuste_impressao_sda_rgsClick(Sender: TObject);
begin
  UserUp;
  ReiniciaCloser;
  if not VerIntegridade then Exit;
  vStr_cd_modulo := '24';
  str_cd_rotina := '2414';
  str_cd_mod := vStr_cd_modulo;
  str_cd_rot := str_cd_rotina;
  Application.CreateForm(Tfrm_ajuste_impressao_sda, frm_ajuste_impressao_sda);
  frm_ajuste_impressao_sda.str_cd_documento := '001';
  frm_ajuste_impressao_sda.ShowModal;
  KickUser;
end;

procedure Tfrm_main.mi_rel_imp_ctrl_demurrageClick(Sender: TObject);
begin
  UserUp;
  ReiniciaCloser;
  if not VerIntegridade then Exit;
  vStr_cd_modulo := '15';
  str_cd_rotina := '1557';
  str_cd_mod := vStr_cd_modulo;
  str_cd_rot := str_cd_rotina;
  Application.CreateForm(Tfrm_sel_unid_prod, frm_sel_unid_prod);
  frm_sel_unid_prod.tp_rel := 12;
  frm_sel_unid_prod.ComPeriodo := False;
  frm_sel_unid_prod.ShowModal;
  KickUser;
end;

procedure Tfrm_main.mi_po_imp_mod3Click(Sender: TObject);
begin
  UserUp;
  ReiniciaCloser;
  if not VerIntegridade then Exit;
  vStr_cd_modulo := '18';
  str_cd_rotina := '1811';
  str_cd_mod := vStr_cd_modulo;
  str_cd_rot := str_cd_rotina;
  Application.CreateForm(Tfrm_po_impressao, frm_po_impressao);
  frm_po_impressao.tp_modelo := 3;
  frm_po_impressao.ShowModal;
  KickUser;
end;

procedure Tfrm_main.mi_out_di_ddimportClick(Sender: TObject);
begin
  UserUp;
  ReiniciaCloser;
  if not VerIntegridade then Exit;
  vStr_cd_modulo := '24';
  str_cd_rotina := '2416';
  str_cd_mod := vStr_cd_modulo;
  str_cd_rot := str_cd_rotina;
  Application.CreateForm(Tfrm_DI_Saida, frm_DI_Saida);
  frm_DI_Saida.tp_saida := 2;
  frm_DI_Saida.ShowModal;
  KickUser;
end;

procedure Tfrm_main.mi_out_di_padraoClick(Sender: TObject);
begin
  UserUp;
  ReiniciaCloser;
  if not VerIntegridade then Exit;
  vStr_cd_modulo := '24';
  str_cd_rotina := '2415';
  str_cd_mod := vStr_cd_modulo;
  str_cd_rot := str_cd_rotina;
  Application.CreateForm(Tfrm_DI_Saida, frm_DI_Saida);
  frm_DI_Saida.tp_saida := 1;
  frm_DI_Saida.ShowModal;
  KickUser;
end;

procedure Tfrm_main.mi_rel_cont_embClick(Sender: TObject);
begin
  UserUp;
  ReiniciaCloser;
  if not VerIntegridade then Exit;
  vStr_cd_modulo := '15';
  str_cd_rotina := '1581';
  str_cd_mod := vStr_cd_modulo;
  str_cd_rot := str_cd_rotina;
  Application.CreateForm(Tfrm_sel_processo, frm_sel_processo);
  frm_sel_processo.str_cd_relatorio := '6';
  frm_sel_processo.ShowModal;
  KickUser;
end;

procedure Tfrm_main.mi_ajuste_impressao_sda_spClick(Sender: TObject);
begin
  UserUp;
  ReiniciaCloser;
  if not VerIntegridade then Exit;
  vStr_cd_modulo := '24';
  str_cd_rotina := '2419';
  str_cd_mod := vStr_cd_modulo;
  str_cd_rot := str_cd_rotina;
  Application.CreateForm(Tfrm_ajuste_impressao_sda, frm_ajuste_impressao_sda);
  frm_ajuste_impressao_sda.str_cd_documento := '002';
  frm_ajuste_impressao_sda.ShowModal;
  KickUser;
end;

procedure Tfrm_main.mi_ajuste_impressao_sda_stsClick(Sender: TObject);
begin
  UserUp;
  ReiniciaCloser;
  if not VerIntegridade then Exit;
  vStr_cd_modulo := '24';
  str_cd_rotina := '2420';
  str_cd_mod := vStr_cd_modulo;
  str_cd_rot := str_cd_rotina;
  Application.CreateForm(Tfrm_ajuste_impressao_sda, frm_ajuste_impressao_sda);
  frm_ajuste_impressao_sda.str_cd_documento := '003';
  frm_ajuste_impressao_sda.ShowModal;
  KickUser;
end;

procedure Tfrm_main.mi_ajuste_impressao_icms_spClick(Sender: TObject);
begin
  UserUp;
  ReiniciaCloser;
  if not VerIntegridade then Exit;
  vStr_cd_modulo := '24';
  str_cd_rotina := '2421';
  str_cd_mod := vStr_cd_modulo;
  str_cd_rot := str_cd_rotina;
  Application.CreateForm(Tfrm_ajuste_impressao_icms, frm_ajuste_impressao_icms);
  frm_ajuste_impressao_icms.str_cd_documento := '002';
  frm_ajuste_impressao_icms.ShowModal;
  KickUser;
end;

procedure Tfrm_main.mi_ajuste_impressao_exoneracaoClick(Sender: TObject);
begin
  UserUp;
  ReiniciaCloser;
  if not VerIntegridade then Exit;
  vStr_cd_modulo := '24';
  str_cd_rotina := '2423';
  str_cd_mod := vStr_cd_modulo;
  str_cd_rot := str_cd_rotina;
  Application.CreateForm(Tfrm_ajuste_impressao_exoneracao, frm_ajuste_impressao_exoneracao);
  frm_ajuste_impressao_exoneracao.str_cd_documento := '001';
  frm_ajuste_impressao_exoneracao.ShowModal;
  KickUser;
end;

procedure Tfrm_main.mi_ajuste_impressao_gnreClick(Sender: TObject);
begin
  UserUp;
  ReiniciaCloser;
  if not VerIntegridade then Exit;
  vStr_cd_modulo := '24';
  str_cd_rotina := '2422';
  str_cd_mod := vStr_cd_modulo;
  str_cd_rot := str_cd_rotina;
  Application.CreateForm(Tfrm_ajuste_impressao_gnre, frm_ajuste_impressao_gnre);
  frm_ajuste_impressao_gnre.str_cd_documento := '001';
  frm_ajuste_impressao_gnre.ShowModal;
  KickUser;
end;

procedure Tfrm_main.mi_rel_imp_ctrl_cliente_armClick(Sender: TObject);
begin
  UserUp;
  ReiniciaCloser;
  if not VerIntegridade then Exit;
  vStr_cd_modulo := '15';
  str_cd_rotina := '1559';
  str_cd_mod := vStr_cd_modulo;
  str_cd_rot := str_cd_rotina;
  Application.CreateForm(Tfrm_sel_unid_prod_cli_arm, frm_sel_unid_prod_cli_arm);
  frm_sel_unid_prod_cli_arm.str_relatorio := 1;
  frm_sel_unid_prod_cli_arm.ShowModal;
  KickUser;
end;

procedure Tfrm_main.mi_ajuste_impressao_darfClick(Sender: TObject);
begin
  UserUp;
  ReiniciaCloser;
  if not VerIntegridade then Exit;
  vStr_cd_modulo := '24';
  str_cd_rotina := '2424';
  str_cd_mod := vStr_cd_modulo;
  str_cd_rot := str_cd_rotina;
  Application.CreateForm(Tfrm_ajuste_impressao_darf, frm_ajuste_impressao_darf);
  frm_ajuste_impressao_darf.str_cd_documento := '001';
  frm_ajuste_impressao_darf.ShowModal;
  KickUser;
end;

procedure Tfrm_main.mi_cad_merc_pesqClick(Sender: TObject);
begin
  UserUp;
  ReiniciaCloser;
  if not VerIntegridade then Exit;
  vStr_cd_modulo := '22';
  str_cd_rotina := '2287';
  str_cd_mod := vStr_cd_modulo;
  str_cd_rot := str_cd_rotina;
  Application.CreateForm(Tfrm_Mercadoria, frm_Mercadoria);
  frm_Mercadoria.lPesq := True;
  frm_Mercadoria.cGrupo := '';
  frm_Mercadoria.cImportador := '';
  frm_Mercadoria.ShowModal;
  KickUser;
end;

procedure Tfrm_main.mi_adiant_pend_fatClick(Sender: TObject);
begin
  UserUp;
  ReiniciaCloser;
  if not VerIntegridade then Exit;
  vStr_cd_modulo := '11';
  str_cd_rotina := '1138';
  str_cd_mod := vStr_cd_modulo;
  str_cd_rot := str_cd_rotina;
  Application.CreateForm(Tfrm_sel_cli_periodo, frm_sel_cli_periodo);
  frm_sel_cli_periodo.tp_relat := '6';
  frm_sel_cli_periodo.ShowModal;
  KickUser;
end;

procedure Tfrm_main.mi_rel_exp_andamentoClick(Sender: TObject);
begin
  UserUp;
  ReiniciaCloser;
  if not VerIntegridade then Exit;
  vStr_cd_modulo := '15';
  str_cd_rotina := '1560';
  str_cd_mod := vStr_cd_modulo;
  str_cd_rot := str_cd_rotina;
  Application.CreateForm(Tfrm_sel_unid_cli_serv_anal, frm_sel_unid_cli_serv_anal);
  frm_sel_unid_cli_serv_anal.tp_rel := 1;
  frm_sel_unid_cli_serv_anal.ShowModal;
  KickUser;
end;

procedure Tfrm_main.mi_rel_exp_contr_averbClick(Sender: TObject);
begin
  UserUp;
  ReiniciaCloser;
  if not VerIntegridade then Exit;
  vStr_cd_modulo := '15';
  str_cd_rotina := '1562';
  str_cd_mod := vStr_cd_modulo;
  str_cd_rot := str_cd_rotina;
  Application.CreateForm(Tfrm_sel_unid_cli_serv_anal, frm_sel_unid_cli_serv_anal);
  frm_sel_unid_cli_serv_anal.tp_rel := 2;
  frm_sel_unid_cli_serv_anal.ShowModal;
  KickUser;
end;

procedure Tfrm_main.mi_relatriodecontrolededescargaClick(Sender: TObject);
begin
  UserUp;
  ReiniciaCloser;
  if not VerIntegridade then Exit;
  vStr_cd_modulo := '01';
  str_cd_rotina := '0123';
  str_cd_mod := vStr_cd_modulo;
  str_cd_rot := str_cd_rotina;
  Application.CreateForm(Tfrm_sel_processo, frm_sel_processo);
  frm_sel_processo.str_cd_relatorio := '7';
  frm_sel_processo.ShowModal;
  KickUser;
end;

procedure Tfrm_main.mi_out_ajuste_boletoClick(Sender: TObject);
begin
  UserUp;
  ReiniciaCloser;
  if not VerIntegridade then Exit;
  vStr_cd_modulo := '24';
  str_cd_rotina := '2426';
  str_cd_mod := vStr_cd_modulo;
  str_cd_rot := str_cd_rotina;
  Application.CreateForm(Tfrm_ajuste_impressao_boleto, frm_ajuste_impressao_boleto);
  frm_ajuste_impressao_boleto.ShowModal;
  KickUser;
end;

procedure Tfrm_main.mi_rel_com_imp_expClick(Sender: TObject);
begin
  UserUp;
  ReiniciaCloser;
  if not VerIntegridade then Exit;
  vStr_cd_modulo := '15';
  str_cd_rotina := '1563';
  str_cd_mod := vStr_cd_modulo;
  str_cd_rot := str_cd_rotina;
  Application.CreateForm(Tfrm_rel_com_imp_exp, frm_rel_com_imp_exp);
  frm_rel_com_imp_exp.ShowModal;
  KickUser;
end;

procedure Tfrm_main.mi_rel_com_ind_porClick(Sender: TObject);
begin
  UserUp;
  ReiniciaCloser;
  if not VerIntegridade then Exit;
  vStr_cd_modulo := '15';
  str_cd_rotina := '1564';
  str_cd_mod := vStr_cd_modulo;
  str_cd_rot := str_cd_rotina;
  Application.CreateForm(Tfrm_rel_com_ind_por, frm_rel_com_ind_por);
  frm_rel_com_ind_por.ShowModal;
  KickUser;
end;

procedure Tfrm_main.mi_out_ajuste_nf_servicoClick(Sender: TObject);
begin
  UserUp;
  ReiniciaCloser;
  if not VerIntegridade then Exit;
  vStr_cd_modulo := '24';
  str_cd_rotina := '2427';
  str_cd_mod := vStr_cd_modulo;
  str_cd_rot := str_cd_rotina;
  Application.CreateForm(Tfrm_ajuste_impressao_nf_serv, frm_ajuste_impressao_nf_serv);
  frm_ajuste_impressao_nf_serv.ShowModal;
  KickUser;
end;

procedure Tfrm_main.mi_exp_dde_vencimentoClick(Sender: TObject);
begin
  UserUp;
  ReiniciaCloser;
  if not VerIntegridade then Exit;
  vStr_cd_modulo := '15';
  str_cd_rotina := '1582';
  str_cd_mod := vStr_cd_modulo;
  str_cd_rot := str_cd_rotina;
  Application.CreateForm(Tfrm_rel_dde_vencto, frm_rel_dde_vencto);
  frm_rel_dde_vencto.ShowModal;
  KickUser;
end;

procedure Tfrm_main.mi_int_work_imClick(Sender: TObject);
begin
  UserUp;
  ReiniciaCloser;
  if not VerIntegridade then Exit;
  vStr_cd_modulo := '32';
  str_cd_rotina := '3201';
  str_cd_mod := vStr_cd_modulo;
  str_cd_rot := str_cd_rotina;
  Application.CreateForm(Tfrm_Int_Work_im, frm_Int_Work_im);
  frm_Int_Work_im.ShowModal;
  KickUser;
end;

procedure Tfrm_main.mi_fat_emi_nf_serv_fatClick(Sender: TObject);
begin
  UserUp;
  ReiniciaCloser;
  if not VerIntegridade then Exit;
  vStr_cd_modulo := '11';
  str_cd_rotina := '1147';
  str_cd_mod := vStr_cd_modulo;
  str_cd_rot := str_cd_rotina;
  Application.CreateForm(Tfrm_nf_serv, frm_nf_serv);
  frm_nf_serv.ShowModal;
  KickUser;
end;

procedure Tfrm_main.mi_rel_est_cntrClick(Sender: TObject);
begin
  UserUp;
  ReiniciaCloser;
  if not VerIntegridade then Exit;
  vStr_cd_modulo := '15';
  str_cd_rotina := '1565';
  str_cd_mod := vStr_cd_modulo;
  str_cd_rot := str_cd_rotina;
  Application.CreateForm(Tfrm_sel_padrao_agente, frm_sel_padrao_agente);
  frm_sel_padrao_agente.ComPeriodo := True;
  frm_sel_padrao_agente.tp_rel := 1;
  frm_sel_padrao_agente.ShowModal;
  KickUser;
end;

procedure Tfrm_main.mi_rel_est_mercClick(Sender: TObject);
begin
  UserUp;
  ReiniciaCloser;
  if not VerIntegridade then Exit;
  vStr_cd_modulo := '15';
  str_cd_rotina := '1566';
  str_cd_mod := vStr_cd_modulo;
  str_cd_rot := str_cd_rotina;
  Application.CreateForm(Tfrm_sel_unid_prod, frm_sel_unid_prod);
  frm_sel_unid_prod.tp_rel := 15;
  frm_sel_unid_prod.ComPeriodo := True;
  frm_sel_unid_prod.ShowModal;
  KickUser;
end;

procedure Tfrm_main.mi_fat_rel_pago_cliClick(Sender: TObject);
begin
  UserUp;
  ReiniciaCloser;
  if not VerIntegridade then Exit;
  vStr_cd_modulo := '11';
  str_cd_rotina := '1141';
  str_cd_mod := vStr_cd_modulo;
  str_cd_rot := str_cd_rotina;
  Application.CreateForm(Tfrm_sel_unid_prod, frm_sel_unid_prod);
  frm_sel_unid_prod.tp_rel := 16;
  frm_sel_unid_prod.ComPeriodo := True;
  frm_sel_unid_prod.ShowModal;
  KickUser;
end;

procedure Tfrm_main.mi_rel_est_volumesClick(Sender: TObject);
begin
  UserUp;
  ReiniciaCloser;
  if not VerIntegridade then Exit;
  vStr_cd_modulo := '15';
  str_cd_rotina := '1567';
  str_cd_mod := vStr_cd_modulo;
  str_cd_rot := str_cd_rotina;
  Application.CreateForm(Tfrm_sel_padrao_agente, frm_sel_padrao_agente);
  frm_sel_padrao_agente.ComPeriodo := True;
  frm_sel_padrao_agente.tp_rel := 2;
  frm_sel_padrao_agente.ShowModal;
  KickUser;
end;

procedure Tfrm_main.mi_rel_est_arm_demurrageClick(Sender: TObject);
begin
  UserUp;
  ReiniciaCloser;
  if not VerIntegridade then Exit;
  vStr_cd_modulo := '15';
  str_cd_rotina := '1568';
  str_cd_mod := vStr_cd_modulo;
  str_cd_rot := str_cd_rotina;
  Application.CreateForm(Tfrm_sel_unid_prod, frm_sel_unid_prod);
  frm_sel_unid_prod.tp_rel := 17;
  frm_sel_unid_prod.ComPeriodo := True;
  frm_sel_unid_prod.ShowModal;
  KickUser;
end;

procedure Tfrm_main.mi_rel_cad_merc_impClick(Sender: TObject);
begin
  UserUp;
  ReiniciaCloser;
  with crp_main do
  begin
    ReportName := cDir_Rpt + '\CRCD003.RPT';
    Connect := 'DSN=BROKER; UID=' + str_nm_admin + '; PWD=' + str_nm_senha + '; DSQ=BROKER';
    Formulas[0] := 'Grupo = ""';
    Execute;
  end;
  KickUser;
end;

procedure Tfrm_main.mi_rel_cad_merc_expClick(Sender: TObject);
begin
  UserUp;
  ReiniciaCloser;
  with crp_main do
  begin
    ReportName := cDir_Rpt + '\CRCD002.RPT';
    Connect := 'DSN=BROKER; UID=' + str_nm_admin + '; PWD=' + str_nm_senha + '; DSQ=BROKER';
    Formulas[0] := 'Grupo = ""';
    Execute;
  end;
  KickUser;
end;

procedure Tfrm_main.mi_cad_fin_grupo_itemClick(Sender: TObject);
begin
  UserUp;
  ReiniciaCloser;
  if not VerIntegridade then Exit;
  vStr_cd_modulo := '22';
  str_cd_rotina := '2262';
  str_cd_mod := vStr_cd_modulo;
  str_cd_rot := str_cd_rotina;
  Application.CreateForm(Tfrm_grupo_item, frm_grupo_item);
  frm_grupo_item.ShowModal;
  KickUser;
end;

procedure Tfrm_main.mi_rel_est_cntr_vl_cifClick(Sender: TObject);
begin
  UserUp;
  ReiniciaCloser;
  if not VerIntegridade then Exit;
  vStr_cd_modulo := '15';
  str_cd_rotina := '1533';
  str_cd_mod := vStr_cd_modulo;
  str_cd_rot := str_cd_rotina;
  Application.CreateForm(Tfrm_sel_unid_prod, frm_sel_unid_prod);
  frm_sel_unid_prod.tp_rel := 18;
  frm_sel_unid_prod.ComPeriodo := True;
  frm_sel_unid_prod.ShowModal;
  KickUser;
end;

procedure Tfrm_main.mi_rel_exp_emb_averbClick(Sender: TObject);
begin
  UserUp;
  ReiniciaCloser;
  if not VerIntegridade then Exit;
  vStr_cd_modulo := '15';
  str_cd_rotina := '1534';
  str_cd_mod := vStr_cd_modulo;
  str_cd_rot := str_cd_rotina;
  Application.CreateForm(Tfrm_sel_unid_cli, frm_sel_unid_cli);
  frm_sel_unid_cli.tp_rel := 21;
  frm_sel_unid_cli.ComPeriodo := True;
  frm_sel_unid_cli.ShowModal;
  KickUser;
end;

procedure Tfrm_main.mi_rel_est_arm_prefixoClick(Sender: TObject);
begin
  UserUp;
  ReiniciaCloser;
  if not VerIntegridade then Exit;
  vStr_cd_modulo := '15';
  str_cd_rotina := '1535';
  str_cd_mod := vStr_cd_modulo;
  str_cd_rot := str_cd_rotina;
  Application.CreateForm(Tfrm_sel_unid_prod, frm_sel_unid_prod);
  frm_sel_unid_prod.tp_rel := 20;
  frm_sel_unid_prod.ComPeriodo := True;
  frm_sel_unid_prod.ShowModal;
  KickUser;
end;

procedure Tfrm_main.mi_fat_rel_saldosClick(Sender: TObject);
begin
  UserUp;
  ReiniciaCloser;
  if not VerIntegridade then Exit;
  vStr_cd_modulo := '11';
  str_cd_rotina := '1142';
  str_cd_mod := vStr_cd_modulo;
  str_cd_rot := str_cd_rotina;
  Application.CreateForm(Tfrm_sel_unid_prod, frm_sel_unid_prod);
  frm_sel_unid_prod.tp_rel := 21;
  frm_sel_unid_prod.ComPeriodo := True;
  frm_sel_unid_prod.ShowModal;
  KickUser;
end;

procedure Tfrm_main.mi_pagto_rel_razaoClick(Sender: TObject);
begin
  UserUp;
  ReiniciaCloser;
  if not VerIntegridade then Exit;
  vStr_cd_modulo := '26';
  str_cd_rotina := '2612';
  str_cd_mod := vStr_cd_modulo;
  str_cd_rot := str_cd_rotina;
  Application.CreateForm(Tfrm_sel_unid_cli_grupo_item, frm_sel_unid_cli_grupo_item);
  frm_sel_unid_cli_grupo_item.tp_rel := 2;
  frm_sel_unid_cli_grupo_item.ComPeriodo := True;
  frm_sel_unid_cli_grupo_item.ShowModal;
  KickUser;
end;

procedure Tfrm_main.mi_po_rel_flpClick(Sender: TObject);
begin
//  UserUp;
//  ReiniciaCloser;
//  if not VerIntegridade then Exit;
//  vStr_cd_modulo := '18';
//  str_cd_rotina := '1812';
//  str_cd_mod := vStr_cd_modulo;
//  str_cd_rot := str_cd_rotina;
//  Application.CreateForm(Tfrm_po_imp, frm_po_imp);
//  frm_po_imp.tp_rel := 1;
//  frm_po_imp.ShowModal;
//  KickUser;
end;

procedure Tfrm_main.mi_gp_gb_rel_proc_mod1Click(Sender: TObject);
begin
  UserUp;
  ReiniciaCloser;
  if not VerIntegridade then Exit;
  vStr_cd_modulo := '01';
  str_cd_rotina := '0122';
  str_cd_mod := vStr_cd_modulo;
  str_cd_rot := str_cd_rotina;
  Application.CreateForm(Tfrm_pesq_proc, frm_pesq_proc);
  frm_pesq_proc.tp_relatorio := 1;
  frm_pesq_proc.ShowModal;
  KickUser;
end;

procedure Tfrm_main.mi_gp_ga_cad_viagemClick(Sender: TObject);
begin
  UserUp;
  ReiniciaCloser;
  if not VerIntegridade then Exit;
  vStr_cd_modulo := '01';
  str_cd_rotina := '0124';
  str_cd_mod := vStr_cd_modulo;
  str_cd_rot := str_cd_rotina;
  Application.CreateForm(Tfrm_viagem, frm_viagem);
  frm_viagem.ShowModal;
  if tdbEdit(Sender).Name <> 'btn_incluir' then
    KickUser;
end;

procedure Tfrm_main.VerAtalho();
begin
  UserUp;
  //ReiniciaCloser;
  if str_cd_rotina_atalho = '' then
  begin
    cd_unid_neg_gestao := '';
    cd_prod_gestao := '';
    cd_origem_gestao := '';
    cd_destino_gestao := '';
    nr_processo_gestao := '';
    Exit;
  end;

  //cargo
  if str_cd_rotina_atalho = '3904' then
  begin
    mi_ctrl_embarqueClick(nil);
  end;

  if str_cd_rotina_atalho = '0504' then
  begin
    mi_notificacaoClick(nil);
  end;


  //desembaraço e PO
  if str_cd_rotina_atalho = '0102' then
  begin
    mi_manutencao_processoClick(nil);
  end;

  if str_cd_rotina_atalho = '0110' then
  begin
    mi_realizacao_processoClick(nil);
  end;

  // Importação
  if str_cd_rotina_atalho = '0201' then
  begin
    mi_diClick(nil);
  end;

  // Exportação
  if str_cd_rotina_atalho = '2001' then
  begin
    mi_expClick(nil);
  end;

  // Demurrage - Contêineres
  if str_cd_rotina_atalho = '0126' then
  begin
    mi_gd_cntrClick(nil);
  end;

  // Demurrage - Faturas
  if str_cd_rotina_atalho = '0127' then
  begin
    mi_gd_fatClick(nil);
  end;

  // PO - Manutenção
  if str_cd_rotina_atalho = '1801' then
  begin
    mi_POClick(nil);
  end;

  // PO - Follow-Up
  if str_cd_rotina_atalho = '1807' then
  begin
    mi_po_flpClick(nil);
  end;

  // Gestão PO
  if str_cd_rotina_atalho = '1820' then
  begin
    mi_gestao_poClick(nil);
  end;

 // Instruo de Desembarao
  if str_cd_rotina_atalho = '1834' then
  begin
    mi_Instrucao_desembClick(nil);
  end;

 // LIBERAR DI COM VALOR ALTO
  if str_cd_rotina_atalho = '0203' then
  begin
    mi_di_lib_alto_valorClick(nil);
  end;

  str_cd_rotina_atalho := '';
end;

procedure Tfrm_main.mi_rel_exp_est_cambialClick(Sender: TObject);
begin
  UserUp;
  ReiniciaCloser;
  if not VerIntegridade then Exit;
  vStr_cd_modulo := '15';
  str_cd_rotina := '1536';
  str_cd_mod := vStr_cd_modulo;
  str_cd_rot := str_cd_rotina;
  Application.CreateForm(Tfrm_sel_unid_cli, frm_sel_unid_cli);
  frm_sel_unid_cli.tp_rel := 13;
  frm_sel_unid_cli.ComPeriodo := True;
  frm_sel_unid_cli.ShowModal;
  KickUser;
end;

procedure Tfrm_main.mi_fat_rel_nf_recClick(Sender: TObject);
begin
  UserUp;
  ReiniciaCloser;
  if not VerIntegridade then Exit;
  vStr_cd_modulo := '11';
  str_cd_rotina := '1143';
  str_cd_mod := vStr_cd_modulo;
  str_cd_rot := str_cd_rotina;
  Application.CreateForm(Tfrm_sel_unid_cli, frm_sel_unid_cli);
  frm_sel_unid_cli.tp_rel := 23;
  frm_sel_unid_cli.ComPeriodo := True;
  frm_sel_unid_cli.ShowModal;
  KickUser;
end;

procedure Tfrm_main.mi_rel_est_despClick(Sender: TObject);
begin
  UserUp;
  ReiniciaCloser;
  if not VerIntegridade then Exit;
  vStr_cd_modulo := '15';
  str_cd_rotina := '1537';
  str_cd_mod := vStr_cd_modulo;
  str_cd_rot := str_cd_rotina;
  Application.CreateForm(Tfrm_sel_unid_prod, frm_sel_unid_prod);
  frm_sel_unid_prod.tp_rel := 23;
  frm_sel_unid_prod.ComPeriodo := True;
  frm_sel_unid_prod.ShowModal;
  KickUser;
end;

procedure Tfrm_main.mi_gp_gd_rel_cont_nao_devolClick(Sender: TObject);
begin
  UserUp;
  ReiniciaCloser;
  if not VerIntegridade then Exit;
  vStr_cd_modulo := '01';
  str_cd_rotina := '0128';
  str_cd_mod := vStr_cd_modulo;
  str_cd_rot := str_cd_rotina;
  Application.CreateForm(Tfrm_sel_unid_cont, frm_sel_unid_cont);
  frm_sel_unid_cont.tp_rel := 24;
  frm_sel_unid_cont.ComPeriodo := True;
  frm_sel_unid_cont.ShowModal;
  KickUser;
end;

procedure Tfrm_main.mi_pagto_rel_pagtoClick(Sender: TObject);
begin
  UserUp;
  ReiniciaCloser;
  if not VerIntegridade then Exit;
  vStr_cd_modulo := '26';
  str_cd_rotina := '2615';
  str_cd_mod := vStr_cd_modulo;
  str_cd_rot := str_cd_rotina;
  Application.CreateForm(Tfrm_sel_pagtos, frm_sel_pagtos);
  frm_sel_pagtos.tp_rel := 1;
  frm_sel_pagtos.ComPeriodo := True;
  frm_sel_pagtos.ShowModal;
  KickUser;
end;

procedure Tfrm_main.mi_adm_gera_tedClick(Sender: TObject);
begin
  UserUp;
  ReiniciaCloser;
  if not VerIntegridade then Exit;
  vStr_cd_modulo := '37';
  str_cd_rotina := '3708';
  str_cd_mod := vStr_cd_modulo;
  str_cd_rot := str_cd_rotina;
  Application.CreateForm(Tfrm_imp_adm_gera_ted, frm_imp_adm_gera_ted);
  frm_imp_adm_gera_ted.ShowModal;
  KickUser;
end;

procedure Tfrm_main.mi_pagto_gera_tedClick(Sender: TObject);
begin
  UserUp;
  ReiniciaCloser;
  if not VerIntegridade then Exit;
  vStr_cd_modulo := '26';
  str_cd_rotina := '2614';
  str_cd_mod := vStr_cd_modulo;
  str_cd_rot := str_cd_rotina;
  Application.CreateForm(Tfrm_pagto_gera_ted, frm_pagto_gera_ted);
  frm_pagto_gera_ted.ShowModal;
  KickUser;
end;

procedure Tfrm_main.mi_rel_imp_demurrageClick(Sender: TObject);
begin
  UserUp;
  ReiniciaCloser;
  if not VerIntegridade then Exit;
  vStr_cd_modulo := '15';
  str_cd_rotina := '1539';
  str_cd_mod := vStr_cd_modulo;
  str_cd_rot := str_cd_rotina;
  Application.CreateForm(Tfrm_sel_unid_cli, frm_sel_unid_cli);
  frm_sel_unid_cli.tp_rel := 24;
  frm_sel_unid_cli.ComPeriodo := True;
  frm_sel_unid_cli.ShowModal;
  KickUser;
end;

procedure Tfrm_main.mi_fin_transf_pagtoClick(Sender: TObject);
begin
  UserUp;
  ReiniciaCloser;
  if not VerIntegridade then Exit;
  vStr_cd_modulo := '12';
  str_cd_rotina := '1219';
  str_cd_mod := vStr_cd_modulo;
  str_cd_rot := str_cd_rotina;
  Application.CreateForm(Tfrm_fin_transf_pagto, frm_fin_transf_pagto);
  frm_fin_transf_pagto.ShowModal;
  KickUser;
end;

procedure Tfrm_main.mi_gd_cntrClick(Sender: TObject);
begin
  UserUp;
  ReiniciaCloser;
  if not VerIntegridade then Exit;
  vStr_cd_modulo := '01';
  str_cd_rotina := '0126';
  str_cd_mod := vStr_cd_modulo;
  str_cd_rot := str_cd_rotina;
  Application.CreateForm(Tfrm_dem_cntr, frm_dem_cntr);
  frm_dem_cntr.ShowModal;
  VerAtalho;
  KickUser;
end;

procedure Tfrm_main.mi_gd_fatClick(Sender: TObject);
begin
  UserUp;
  ReiniciaCloser;
  if not VerIntegridade then Exit;
  vStr_cd_modulo := '01';
  str_cd_rotina := '0127';
  str_cd_mod := vStr_cd_modulo;
  str_cd_rot := str_cd_rotina;
  Application.CreateForm(Tfrm_dem_fat, frm_dem_fat);
  frm_dem_fat.ShowModal;
  VerAtalho;
  KickUser;
end;

procedure Tfrm_main.mi_fin_pesqClick(Sender: TObject);
begin
  UserUp;
  ReiniciaCloser;
  if not VerIntegridade then Exit;
  vStr_cd_modulo := '12';
  str_cd_rotina := '1220';
  str_cd_mod := vStr_cd_modulo;
  str_cd_rot := str_cd_rotina;
  Application.CreateForm(Tfrm_pesq_fin, frm_pesq_fin);
  frm_pesq_fin.ShowModal;
  KickUser;
end;

procedure Tfrm_main.mi_fat_rel_livro_fisc_nfClick(Sender: TObject);
begin
  UserUp;
  ReiniciaCloser;
  if not VerIntegridade then Exit;
  vStr_cd_modulo := '11';
  str_cd_rotina := '1113';
  str_cd_mod := vStr_cd_modulo;
  str_cd_rot := str_cd_rotina;
  Application.CreateForm(Tfrm_livro_iss, frm_livro_iss);
  frm_livro_iss.tp_relatorio := 1;
  frm_livro_iss.ShowModal;
  KickUser;
end;

procedure Tfrm_main.mi_fat_rel_livro_fisc_capaClick(Sender: TObject);
begin
  UserUp;
  ReiniciaCloser;
  if not VerIntegridade then Exit;
  vStr_cd_modulo := '11';
  str_cd_rotina := '1146';
  str_cd_mod := vStr_cd_modulo;
  str_cd_rot := str_cd_rotina;
  Application.CreateForm(Tfrm_livro_iss, frm_livro_iss);
  frm_livro_iss.tp_relatorio := 2;
  frm_livro_iss.ShowModal;
  KickUser;
end;

procedure Tfrm_main.mi_exp_carta_credClick(Sender: TObject);
begin
  UserUp;
  ReiniciaCloser;
  if not VerIntegridade then Exit;
  vStr_cd_modulo := '20';
  str_cd_rotina := '2013';
  str_cd_mod := vStr_cd_modulo;
  str_cd_rot := str_cd_rotina;
  Application.CreateForm(Tfrm_exp_carta_cred, frm_exp_carta_cred);
  frm_exp_carta_cred.ShowModal;
  KickUser;
end;

procedure Tfrm_main.mi_cad_prop_mercClick(Sender: TObject);
begin
  UserUp;
  ReiniciaCloser;
  if not VerIntegridade then Exit;
  vStr_cd_modulo := '22';
  str_cd_rotina := '2266';
  str_cd_mod := vStr_cd_modulo;
  str_cd_rot := str_cd_rotina;
  Application.CreateForm(Tfrm_prop_merc, frm_prop_merc);
  frm_prop_merc.ShowModal;
  KickUser;
end;

procedure Tfrm_main.mi_ent_daClick(Sender: TObject);
begin
  UserUp;
  ReiniciaCloser;
  if not VerIntegridade then Exit;
  vStr_cd_modulo := '35';
  str_cd_rotina := '3501';
  str_cd_mod := vStr_cd_modulo;
  str_cd_rot := str_cd_rotina;
  Application.CreateForm(Tfrm_da, frm_da);
  frm_da.st_retificacao := False;
  frm_da.ShowModal;
  VerAtalho;
  KickUser;
end;

procedure Tfrm_main.mi_rel_imp_regClick(Sender: TObject);
begin
  UserUp;
  ReiniciaCloser;
  if not VerIntegridade then Exit;
  vStr_cd_modulo := '15';
  str_cd_rotina := '1569';
  str_cd_mod := vStr_cd_modulo;
  str_cd_rot := str_cd_rotina;
  Application.CreateForm(Tfrm_sel_unid_cli, frm_sel_unid_cli);
  frm_sel_unid_cli.tp_rel := 25;
  frm_sel_unid_cli.ComPeriodo := True;
  frm_sel_unid_cli.ShowModal;
  KickUser;
end;

procedure Tfrm_main.mi_rel_imp_desembClick(Sender: TObject);
begin
  UserUp;
  ReiniciaCloser;
  if not VerIntegridade then Exit;
  vStr_cd_modulo := '15';
  str_cd_rotina := '1570';
  str_cd_mod := vStr_cd_modulo;
  str_cd_rot := str_cd_rotina;
  Application.CreateForm(Tfrm_sel_unid_cli, frm_sel_unid_cli);
  frm_sel_unid_cli.tp_rel := 26;
  frm_sel_unid_cli.ComPeriodo := True;
  frm_sel_unid_cli.ShowModal;
  KickUser;
end;

procedure Tfrm_main.mi_ent_ret_daClick(Sender: TObject);
begin
  UserUp;
  ReiniciaCloser;
  if not VerIntegridade then Exit;
  vStr_cd_modulo := '35';
  str_cd_rotina := '3503';
  str_cd_mod := vStr_cd_modulo;
  str_cd_rot := str_cd_rotina;
  Application.CreateForm(Tfrm_da, frm_da);
  frm_da.st_retificacao := True;
  frm_da.ShowModal;
  VerAtalho;
  KickUser;
end;

procedure Tfrm_main.mi_ent_nacClick(Sender: TObject);
begin
  UserUp;
  ReiniciaCloser;
  if not VerIntegridade then Exit;
  vStr_cd_modulo := '35';
  str_cd_rotina := '3502';
  str_cd_mod := vStr_cd_modulo;
  str_cd_rot := str_cd_rotina;
  Application.CreateForm(Tfrm_nac, frm_nac);
  frm_nac.st_retificacao := False;
  frm_nac.ShowModal;
  VerAtalho;
  KickUser;
end;

procedure Tfrm_main.mi_ent_ret_nacClick(Sender: TObject);
begin
  UserUp;
  ReiniciaCloser;
  if not VerIntegridade then Exit;
  vStr_cd_modulo := '35';
  str_cd_rotina := '3504';
  str_cd_mod := vStr_cd_modulo;
  str_cd_rot := str_cd_rotina;
  Application.CreateForm(Tfrm_nac, frm_nac);
  frm_nac.st_retificacao := True;
  frm_nac.ShowModal;
  VerAtalho;
  KickUser;
end;

procedure Tfrm_main.mi_atualizao_ncmClick(Sender: TObject);
begin
  UserUp;
  ReiniciaCloser;
  if not VerIntegridade then Exit;
  vStr_cd_modulo := '24';
  str_cd_rotina := '2430';
  str_cd_mod := vStr_cd_modulo;
  str_cd_rot := str_cd_rotina;
  Application.CreateForm(Tfrm_atualiza_ncm, frm_atualiza_ncm);
  frm_atualiza_ncm.ShowModal;
  KickUser;
end;

procedure Tfrm_main.mi_int_mesquitaClick(Sender: TObject);
begin
  UserUp;
  ReiniciaCloser;
  if not VerIntegridade then Exit;
  vStr_cd_modulo := '24';
  str_cd_rotina := '2431';
  str_cd_mod := vStr_cd_modulo;
  str_cd_rot := str_cd_rotina;
  Application.CreateForm(Tfrm_int_mesquita, frm_int_mesquita);
  frm_int_mesquita.ShowModal;
  KickUser;
end;

procedure Tfrm_main.mi_rel_exp_reClick(Sender: TObject);
begin
  UserUp;
  ReiniciaCloser;
  if not VerIntegridade then Exit;
  vStr_cd_modulo := '15';
  str_cd_rotina := '1571';
  str_cd_mod := vStr_cd_modulo;
  str_cd_rot := str_cd_rotina;
  Application.CreateForm(Tfrm_sel_unid_cli_imp_area, frm_sel_unid_cli_imp_area);
  frm_sel_unid_cli_imp_area.tp_rel := 1;
  frm_sel_unid_cli_imp_area.ComPeriodo := True;
  frm_sel_unid_cli_imp_area.ShowModal;
  KickUser;
end;

procedure Tfrm_main.mi_di_lib_alto_valorClick(Sender: TObject);
begin
  if mi_di_lib_alto_valor.visible then
  begin
    UserUp;
    ReiniciaCloser;
    if not VerIntegridade then Exit;
    vStr_cd_modulo := '02';
    str_cd_rotina := '0203';
    str_cd_mod := vStr_cd_modulo;
    str_cd_rot := str_cd_rotina;
    Application.CreateForm(Tfrm_di_libera, frm_di_libera);
    frm_di_libera.ShowModal;
    KickUser;
  end
  else
    ShowMessage('Usuario sem acesso ao modulo de Liberação de DI');
end;

procedure Tfrm_main.mi_ajuste_impressao_sda_rjClick(Sender: TObject);
begin
  UserUp;
  ReiniciaCloser;
  if not VerIntegridade then Exit;
  vStr_cd_modulo := '24';
  str_cd_rotina := '2432';
  str_cd_mod := vStr_cd_modulo;
  str_cd_rot := str_cd_rotina;
  Application.CreateForm(Tfrm_ajuste_impressao_sda, frm_ajuste_impressao_sda);
  frm_ajuste_impressao_sda.str_cd_documento := '004';
  frm_ajuste_impressao_sda.ShowModal;
  KickUser;
end;

procedure Tfrm_main.mi_ent_rel_sol_desClick(Sender: TObject);
begin
  UserUp;
  ReiniciaCloser;
  if not VerIntegridade then Exit;
  vStr_cd_modulo := '35';
  str_cd_rotina := '3505';
  str_cd_mod := vStr_cd_modulo;
  str_cd_rot := str_cd_rotina;
  Application.CreateForm(Tfrm_sel_processo, frm_sel_processo);
  frm_sel_processo.str_cd_relatorio := '8';
  frm_sel_processo.ShowModal;
  KickUser;
end;

procedure Tfrm_main.mi_ent_rel_sol_desuClick(Sender: TObject);
begin
  UserUp;
  ReiniciaCloser;
  if not VerIntegridade then Exit;
  vStr_cd_modulo := '35';
  str_cd_rotina := '3506';
  str_cd_mod := vStr_cd_modulo;
  str_cd_rot := str_cd_rotina;
  Application.CreateForm(Tfrm_sel_processo, frm_sel_processo);
  frm_sel_processo.str_cd_relatorio := '9';
  frm_sel_processo.ShowModal;
  KickUser;
end;

procedure Tfrm_main.mi_ent_rel_plan_desClick(Sender: TObject);
begin
  UserUp;
  ReiniciaCloser;
  if not VerIntegridade then Exit;
  vStr_cd_modulo := '35';
  str_cd_rotina := '3507';
  str_cd_mod := vStr_cd_modulo;
  str_cd_rot := str_cd_rotina;
  Application.CreateForm(Tfrm_sel_processo, frm_sel_processo);
  frm_sel_processo.str_cd_relatorio := '9';
  frm_sel_processo.ShowModal;
  KickUser;
end;

procedure Tfrm_main.mi_rel_exp_kpiClick(Sender: TObject);
begin
  UserUp;
  ReiniciaCloser;
  if not VerIntegridade then Exit;
  vStr_cd_modulo := '15';
  str_cd_rotina := '1572';
  str_cd_mod := vStr_cd_modulo;
  str_cd_rot := str_cd_rotina;
  Application.CreateForm(Tfrm_sel_unid_cli, frm_sel_unid_cli);
  frm_sel_unid_cli.tp_rel := 27;
  frm_sel_unid_cli.ComPeriodo := True;
  frm_sel_unid_cli.ShowModal;
  KickUser;
end;

procedure Tfrm_main.mi_gp_gd_rel_gerClick(Sender: TObject);
begin
  UserUp;
  ReiniciaCloser;
  if not VerIntegridade then Exit;
  vStr_cd_modulo := '01';
  str_cd_rotina := '0129';
  str_cd_mod := vStr_cd_modulo;
  str_cd_rot := str_cd_rotina;
  Application.CreateForm(Tfrm_sel_unid_prod_emb, frm_sel_unid_prod_emb);
  frm_sel_unid_prod_emb.tp_rel := 3;
  frm_sel_unid_prod_emb.ComPeriodo := True;
  frm_sel_unid_prod_emb.ShowModal;
  KickUser;
end;

procedure Tfrm_main.mi_gp_gd_rel_estClick(Sender: TObject);
begin
  UserUp;
  ReiniciaCloser;
  if not VerIntegridade then Exit;
  vStr_cd_modulo := '01';
  str_cd_rotina := '0130';
  str_cd_mod := vStr_cd_modulo;
  str_cd_rot := str_cd_rotina;
  Application.CreateForm(Tfrm_sel_unid_prod, frm_sel_unid_prod);
  frm_sel_unid_prod.tp_rel := 25;
  frm_sel_unid_prod.ComPeriodo := True;
  frm_sel_unid_prod.ShowModal;
  KickUser;
end;

procedure Tfrm_main.btn_avisoClick(Sender: TObject);
begin
  UserUp;
  ReiniciaCloser;
  frm_lembrete_po.Show;
  KickUser;
end;

procedure Tfrm_main.mi_rel_est_lead_timeClick(Sender: TObject);
begin
  UserUp;
  ReiniciaCloser;
  if not VerIntegridade then Exit;
  vStr_cd_modulo := '15';
  str_cd_rotina := '1540';
  str_cd_mod := vStr_cd_modulo;
  str_cd_rot := str_cd_rotina;
  Application.CreateForm(Tfrm_sel_unid_prod_emb, frm_sel_unid_prod_emb);
  frm_sel_unid_prod_emb.tp_rel := 4;
  frm_sel_unid_prod_emb.ComPeriodo := True;
  frm_sel_unid_prod_emb.ShowModal;
  KickUser;
end;

procedure Tfrm_main.mi_tabela_grupo_servicoClick(Sender: TObject);
begin
  UserUp;
  ReiniciaCloser;
  if not VerIntegridade then Exit;
  vStr_cd_modulo := '23';
  str_cd_rotina := '2313';
  str_cd_mod := vStr_cd_modulo;
  str_cd_rot := str_cd_rotina;
  Application.CreateForm(Tfrm_grupo_servico, frm_grupo_servico);
  frm_grupo_servico.ShowModal;
  KickUser;
end;

procedure Tfrm_main.mi_db_susp_forecastClick(Sender: TObject);
begin
  UserUp;
  // ReiniciaCloser;
  AbreFormForecast(Application.Handle, datm_main.db_broker, Str_cd_cargo, Str_cd_usuario, tdSuspensao);
end;

procedure Tfrm_main.mi_di_icms_onlineClick(Sender: TObject);
begin
  UserUp;
  ReiniciaCloser;
  if not VerIntegridade then Exit;
  vStr_cd_modulo := '02';
  str_cd_rotina := '0202';
  str_cd_mod := vStr_cd_modulo;
  str_cd_rot := str_cd_rotina;
  Application.CreateForm(Tfrm_icms_online, frm_icms_online);
  frm_icms_online.ShowModal;
  KickUser;
end;

procedure Tfrm_main.mi_fat_rel_rent_procClick(Sender: TObject);
begin
  UserUp;
  ReiniciaCloser;
  if not VerIntegridade then Exit;
  vStr_cd_modulo := '11';
  str_cd_rotina := '1144';
  str_cd_mod := vStr_cd_modulo;
  str_cd_rot := str_cd_rotina;
  Application.CreateForm(Tfrm_sel_unid_prod, frm_sel_unid_prod);
  frm_sel_unid_prod.tp_rel := 26;
  frm_sel_unid_prod.ComPeriodo := True;
  frm_sel_unid_prod.ShowModal;
  KickUser;
end;

procedure Tfrm_main.mi_out_releaseClick(Sender: TObject);
begin
  UserUp;
  ReiniciaCloser;
  if not VerIntegridade then Exit;
  vStr_cd_modulo := '24';
  str_cd_rotina := '2417';
  str_cd_mod := vStr_cd_modulo;
  str_cd_rot := str_cd_rotina;
  Application.CreateForm(Tfrm_release, frm_release);
  frm_release.ShowModal;
  KickUser;
end;

procedure Tfrm_main.btn_releaseClick(Sender: TObject);
var
  Reg: TRegistry;
begin
  UserUp;
  ReiniciaCloser;
  with datm_main do
  begin
    Reg := TRegistry.Create; //Criação de um Nome no Regedit, grava ( True ou False )
    try
      with Reg do
      begin
        RootKey := HKEY_LOCAL_MACHINE;
        OpenKey('\SOFTWARE\DDBROKER\NOVAVERSAO', True);
        WriteString(nr_versao, 'False');
        CloseKey;
      end;
    finally
      Reg.CloseKey;
      Reg.Free;
    end;

    qry_release_.Close;
    qry_release_.Prepare;
    qry_release_.ParamByName('NR_VERSAO').AsString := nr_versao;
    qry_release_.Open;
    ppRepRelease.Template.FileName := cDir_RPT + '\RBREL001.rtm';
    ppRepRelease.Print;

    pnlRelease.ParentColor := True;

  end;
  KickUser;
end;

procedure Tfrm_main.tmr_releaseTimer(Sender: TObject);
begin
  UserUp;
  (* if btn_release.Enabled then
  begin
    if btn_release.Visible then
    begin
      btn_release.Visible := False;
    end
    else
    begin
      btn_release.Visible := True;
    end;
  end;*)
  // if btn_release.Enabled then
  //   btn_release.Visible := not btn_release.Visible;
end;

procedure Tfrm_main.btn_releaseMouseMove(Sender: TObject;
  Shift: TShiftState; X, Y: Integer);
begin
  UserUp;
  // tmr_release.Enabled := False;
end;

procedure Tfrm_main.mi_rel_imp_imp_sapClick(Sender: TObject);
begin
  UserUp;
  ReiniciaCloser;
  if not VerIntegridade then Exit;
  vStr_cd_modulo := '15';
  str_cd_rotina := '1573';
  str_cd_mod := vStr_cd_modulo;
  str_cd_rot := str_cd_rotina;
  Application.CreateForm(Tfrm_sel_unid_cli, frm_sel_unid_cli);
  frm_sel_unid_cli.ComPeriodo := True;
  frm_sel_unid_cli.tp_rel := 28;
  frm_sel_unid_cli.ShowModal;
  KickUser;
end;

procedure Tfrm_main.mi_po_rel_lead_timeClick(Sender: TObject);
begin
  UserUp;
  ReiniciaCloser;
  if not VerIntegridade then Exit;
  vStr_cd_modulo := '18';
  str_cd_rotina := '1813';
  str_cd_mod := vStr_cd_modulo;
  str_cd_rot := str_cd_rotina;
  Application.CreateForm(Tfrm_sel_unid_prod, frm_sel_unid_prod);
  frm_sel_unid_prod.tp_rel := 28;
  frm_sel_unid_prod.ComPeriodo := True;
  frm_sel_unid_prod.ShowModal;
  KickUser;
end;

procedure Tfrm_main.mi_rel_est_qt_cntrClick(Sender: TObject);
begin
  UserUp;
  ReiniciaCloser;
  if not VerIntegridade then Exit;
  vStr_cd_modulo := '15';
  str_cd_rotina := '1542';
  str_cd_mod := vStr_cd_modulo;
  str_cd_rot := str_cd_rotina;
  Application.CreateForm(Tfrm_sel_unid_prod, frm_sel_unid_prod);
  frm_sel_unid_prod.tp_rel := 29;
  frm_sel_unid_prod.ComPeriodo := True;
  frm_sel_unid_prod.ShowModal;
  KickUser;
end;

procedure Tfrm_main.mi_po_rel_embClick(Sender: TObject);
begin
  UserUp;
  ReiniciaCloser;
  if not VerIntegridade then Exit;
  vStr_cd_modulo := '18';
  str_cd_rotina := '1818';
  str_cd_mod := vStr_cd_modulo;
  str_cd_rot := str_cd_rotina;
  Application.CreateForm(Tfrm_sel_unid_prod, frm_sel_unid_prod);
  frm_sel_unid_prod.tp_rel := 32;
  frm_sel_unid_prod.ComPeriodo := True;
  frm_sel_unid_prod.ShowModal;
  KickUser;
end;

procedure Tfrm_main.mi_po_rel_nivel_servicoClick(Sender: TObject);
begin
  UserUp;
  ReiniciaCloser;
  if not VerIntegridade then Exit;
  vStr_cd_modulo := '18';
  str_cd_rotina := '1815';
  str_cd_mod := vStr_cd_modulo;
  str_cd_rot := str_cd_rotina;
  Application.CreateForm(Tfrm_sel_unid_prod, frm_sel_unid_prod);
  frm_sel_unid_prod.tp_rel := 31;
  frm_sel_unid_prod.ComPeriodo := True;
  frm_sel_unid_prod.ShowModal;
  KickUser;
end;

procedure Tfrm_main.mi_rel_imp_canal_mesClick(Sender: TObject);
begin
  UserUp;
  ReiniciaCloser;
  if not VerIntegridade then Exit;
  vStr_cd_modulo := '15';
  str_cd_rotina := '1543';
  str_cd_mod := vStr_cd_modulo;
  str_cd_rot := str_cd_rotina;
  Application.CreateForm(Tfrm_sel_unid_cli, frm_sel_unid_cli);
  frm_sel_unid_cli.tp_rel := 29;
  frm_sel_unid_cli.ComPeriodo := True;
  frm_sel_unid_cli.ShowModal;
  KickUser;
end;

procedure Tfrm_main.mi_po_at_basf_cadClick(Sender: TObject);
begin
  UserUp;
  ReiniciaCloser;
  if not VerIntegridade then Exit;
  vStr_cd_modulo := '18';
  str_cd_rotina := '1816';
  str_cd_mod := vStr_cd_modulo;
  str_cd_rot := str_cd_rotina;
  Application.CreateForm(Tfrm_at_basf, frm_at_basf);
  frm_at_basf.ShowModal;
  KickUser;
end;

procedure Tfrm_main.mi_po_at_basf_relClick(Sender: TObject);
begin
  UserUp;
  ReiniciaCloser;
  if not VerIntegridade then Exit;
  vStr_cd_modulo := '18';
  str_cd_rotina := '1817';
  str_cd_mod := vStr_cd_modulo;
  str_cd_rot := str_cd_rotina;
  Application.CreateForm(Tfrm_sel_unid_cli_imp_area, frm_sel_unid_cli_imp_area);
  frm_sel_unid_cli_imp_area.tp_rel := 2;
  frm_sel_unid_cli_imp_area.ComPeriodo := True;
  frm_sel_unid_cli_imp_area.ShowModal;
  KickUser;
end;

procedure Tfrm_main.mi_rel_es_desviosClick(Sender: TObject);
begin
  UserUp;
  ReiniciaCloser;
  if not VerIntegridade then Exit;
  vStr_cd_modulo := '15';
  str_cd_rotina := '1541';
  str_cd_mod := vStr_cd_modulo;
  str_cd_rot := str_cd_rotina;
  Application.CreateForm(Tfrm_sel_unid_prod_emb, frm_sel_unid_prod_emb);
  frm_sel_unid_prod_emb.tp_rel := 6;
  frm_sel_unid_prod_emb.ComPeriodo := True;
  frm_sel_unid_prod_emb.ShowModal;
  KickUser;
end;

procedure Tfrm_main.mi_cad_delegaciaClick(Sender: TObject);
begin
  UserUp;
  ReiniciaCloser;
  if not VerIntegridade then Exit;
  vStr_cd_modulo := '22';
  str_cd_rotina := '2258';
  str_cd_mod := vStr_cd_modulo;
  str_cd_rot := str_cd_rotina;
  // Application.CreateForm( Tfrm_delegacia, frm_delegacia );
  // frm_delegacia.ShowModal;
end;

procedure Tfrm_main.mi_db_susp_acClick(Sender: TObject);
begin
  UserUp;
  // ReiniciaCloser;
  AbreFormAtoConcess(Application.Handle, datm_main.db_broker, Str_cd_cargo, Str_cd_usuario, tdSuspensao);
end;

procedure Tfrm_main.mi_po_rel_emb_prevClick(Sender: TObject);
begin
  UserUp;
  ReiniciaCloser;
  if not VerIntegridade then Exit;
  vStr_cd_modulo := '18';
  str_cd_rotina := '1814';
  str_cd_mod := vStr_cd_modulo;
  str_cd_rot := str_cd_rotina;
  Application.CreateForm(Tfrm_sel_unid_prod, frm_sel_unid_prod);
  frm_sel_unid_prod.tp_rel := 30;
  frm_sel_unid_prod.ComPeriodo := True;
  frm_sel_unid_prod.ShowModal;
  KickUser;
end;

procedure Tfrm_main.mi_gp_gd_rel_ger2Click(Sender: TObject);
begin
  UserUp;
  ReiniciaCloser;
  if not VerIntegridade then Exit;
  vStr_cd_modulo := '01';
  str_cd_rotina := '0131';
  str_cd_mod := vStr_cd_modulo;
  str_cd_rot := str_cd_rotina;
  Application.CreateForm(Tfrm_sel_unid_prod_emb, frm_sel_unid_prod_emb);
  frm_sel_unid_prod_emb.tp_rel := 7;
  frm_sel_unid_prod_emb.ComPeriodo := True;
  frm_sel_unid_prod_emb.ShowModal;
  KickUser;
end;

procedure Tfrm_main.mi_rel_est_volumes2Click(Sender: TObject);
begin
  UserUp;
  ReiniciaCloser;
  if not VerIntegridade then Exit;
  vStr_cd_modulo := '15';
  str_cd_rotina := '1574';
  str_cd_mod := vStr_cd_modulo;
  str_cd_rot := str_cd_rotina;
  Application.CreateForm(Tfrm_sel_padrao_agente, frm_sel_padrao_agente);
  frm_sel_padrao_agente.ComPeriodo := True;
  frm_sel_padrao_agente.tp_rel := 3;
  frm_sel_padrao_agente.ShowModal;
  KickUser;
end;

procedure Tfrm_main.mi_db_flp_imp_realizClick(Sender: TObject);
begin
  UserUp;
  (* ReiniciaCloser;
  if not VerIntegridade then Exit;
  vStr_cd_modulo := '04';
  str_cd_rotina := '0403';
  str_cd_mod := vStr_cd_modulo;
  str_cd_rot := str_cd_rotina;
  Application.CreateForm(Tfrm_db_flp, frm_db_flp);
  frm_db_flp.ShowModal; *)
end;

procedure Tfrm_main.mi_db_flp_exp_realizClick(Sender: TObject);
begin
  UserUp;
  (* ReiniciaCloser;
  if not VerIntegridade then Exit;
  vStr_cd_modulo := '04';
  str_cd_rotina := '0404';
  str_cd_mod := vStr_cd_modulo;
  str_cd_rot := str_cd_rotina;
  Application.CreateForm(Tfrm_db_flp, frm_db_flp);
  frm_db_flp.ShowModal; *)
end;

procedure Tfrm_main.mi_po_rel_prev_nacionClick(Sender: TObject);
begin
  UserUp;
  ReiniciaCloser;
  if not VerIntegridade then Exit;
  vStr_cd_modulo := '18';
  str_cd_rotina := '1819';
  str_cd_mod := vStr_cd_modulo;
  str_cd_rot := str_cd_rotina;
  Application.CreateForm(Tfrm_sel_unid_prod, frm_sel_unid_prod);
  frm_sel_unid_prod.tp_rel := 33;
  frm_sel_unid_prod.ComPeriodo := True;
  frm_sel_unid_prod.ShowModal;
  KickUser;
end;

(*
procedure Tfrm_main.LeituradePO1Click(Sender: TObject);
begin
  UserUp;
  if Not VerIntegridade then Exit;
  vStr_cd_modulo := '24';
  str_cd_rotina := '2408';
  str_cd_mod    := vStr_cd_modulo;
  str_cd_rot    := str_cd_rotina;
  Application.CreateForm( Tfrm_PO_Leitura, frm_PO_Leitura );
  frm_po_leitura.tp_leitura := 1;
  frm_PO_Leitura.ShowModal;
end;

procedure Tfrm_main.SadaDDImportFollowup1Click(Sender: TObject);
begin
  UserUp;
  if Not VerIntegridade then Exit;
  vStr_cd_modulo := '24';
  str_cd_rotina := '2416';
  str_cd_mod    := vStr_cd_modulo;
  str_cd_rot    := str_cd_rotina;
  Application.CreateForm(Tfrm_DI_Saida, frm_DI_Saida);
  frm_DI_Saida.tp_saida := 3;
  frm_DI_Saida.ShowModal;
end;
*)

procedure Tfrm_main.mi_out_saida_ddimport_followupClick(Sender: TObject);
begin
  UserUp;
  ReiniciaCloser;
  if not VerIntegridade then Exit;
  vStr_cd_modulo := '24';
  str_cd_rotina := '2433';
  str_cd_mod := vStr_cd_modulo;
  str_cd_rot := str_cd_rotina;
  Application.CreateForm(Tfrm_DI_Saida, frm_DI_Saida);
  frm_DI_Saida.tp_saida := 3;
  frm_DI_Saida.ShowModal;
  KickUser;
end;

procedure Tfrm_main.mi_rel_imp_ctrl_requerimentoClick(Sender: TObject);
begin
  UserUp;
  ReiniciaCloser;
  if not VerIntegridade then Exit;
  vStr_cd_modulo := '15';
  str_cd_rotina := '1561';
  str_cd_mod := vStr_cd_modulo;
  str_cd_rot := str_cd_rotina;
  Application.CreateForm(Tfrm_sel_unid_prod_emb, frm_sel_unid_prod_emb);
  frm_sel_unid_prod_emb.tp_rel := 8;
  frm_sel_unid_prod_emb.ComPeriodo := True;
  frm_sel_unid_prod_emb.ShowModal;
  KickUser;
end;

procedure Tfrm_main.mi_rel_imp_canal_mes_mod_2Click(Sender: TObject);
begin
  UserUp;
  ReiniciaCloser;
  if not VerIntegridade then Exit;
  vStr_cd_modulo := '15';
  str_cd_rotina := '1575';
  str_cd_mod := vStr_cd_modulo;
  str_cd_rot := str_cd_rotina;
  Application.CreateForm(Tfrm_sel_unid_cli, frm_sel_unid_cli);
  frm_sel_unid_cli.tp_rel := 29;
  frm_sel_unid_cli.ComPeriodo := True;
  frm_sel_unid_cli.ShowModal;
  KickUser;
end;

procedure Tfrm_main.mi_rel_exp_custosClick(Sender: TObject);
begin
  UserUp;
  ReiniciaCloser;
  if not VerIntegridade then Exit;
  vStr_cd_modulo := '15';
  str_cd_rotina := '1576';
  str_cd_mod := vStr_cd_modulo;                    
  str_cd_rot := str_cd_rotina;
  Application.CreateForm(Tfrm_sel_unid_cli, frm_sel_unid_cli);
  frm_sel_unid_cli.tp_rel := 31;
  frm_sel_unid_cli.ComPeriodo := True;
  frm_sel_unid_cli.ShowModal;
  KickUser;
end;

procedure Tfrm_main.mi_out_saida_ddimport_custoClick(Sender: TObject);
begin
  UserUp;
  ReiniciaCloser;
  if not VerIntegridade then Exit;
  vStr_cd_modulo := '24';
  str_cd_rotina := '2434';
  str_cd_mod := vStr_cd_modulo;
  str_cd_rot := str_cd_rotina;
  Application.CreateForm(Tfrm_DI_Saida, frm_DI_Saida);
  frm_DI_Saida.tp_saida := 4;
  frm_DI_Saida.ShowModal;
  KickUser;
end;

procedure Tfrm_main.mi_rel_imp_lead_time2Click(Sender: TObject);
begin
  UserUp;
  ReiniciaCloser;
  if not VerIntegridade then Exit;
  vStr_cd_modulo := '15';
  str_cd_rotina := '1577';
  str_cd_mod := vStr_cd_modulo;
  str_cd_rot := str_cd_rotina;
  Application.CreateForm(Tfrm_sel_unid_cli, frm_sel_unid_cli);
  frm_sel_unid_cli.tp_rel := 32;
  frm_sel_unid_cli.ComPeriodo := True;
  frm_sel_unid_cli.ShowModal;
  KickUser;
end;

procedure Tfrm_main.mi_fat_rel_retClick(Sender: TObject);
begin
  UserUp;
  ReiniciaCloser;
  if not VerIntegridade then Exit;
  vStr_cd_modulo := '11';
  str_cd_rotina := '1145';
  str_cd_mod := vStr_cd_modulo;
  str_cd_rot := str_cd_rotina;
  Application.CreateForm(Tfrm_sel_relat, frm_sel_relat);
  frm_sel_relat.tp_rel := 1;
  frm_sel_relat.ShowModal;
  KickUser;
end;

procedure Tfrm_main.mi_cad_ncm_pis_cofinsClick(Sender: TObject);
begin
  UserUp;
  ReiniciaCloser;
  if not VerIntegridade then Exit;
  vStr_cd_modulo := '22';
  str_cd_rotina := '2286';
  str_cd_mod := vStr_cd_modulo;
  str_cd_rot := str_cd_rotina;
  Application.CreateForm(Tfrm_ncm_pis_cofins, frm_ncm_pis_cofins);
  frm_ncm_pis_cofins.ShowModal;
  KickUser;
end;

procedure Tfrm_main.mi_rel_imp_proc_andClick(Sender: TObject);
begin
  UserUp;
  ReiniciaCloser;
  if not VerIntegridade then Exit;
  vStr_cd_modulo := '15';
  str_cd_rotina := '1578';
  str_cd_mod := vStr_cd_modulo;
  str_cd_rot := str_cd_rotina;
  Application.CreateForm(Tfrm_sel_relat, frm_sel_relat);
  frm_sel_relat.tp_rel := 2;
  frm_sel_relat.ShowModal;
  KickUser;
end;

procedure Tfrm_main.mi_rel_imp_proc_desembClick(Sender: TObject);
begin
  UserUp;
  ReiniciaCloser;
  if not VerIntegridade then Exit;
  vStr_cd_modulo := '15';
  str_cd_rotina := '1579';
  str_cd_mod := vStr_cd_modulo;
  str_cd_rot := str_cd_rotina;
  Application.CreateForm(Tfrm_sel_relat, frm_sel_relat);
  frm_sel_relat.tp_rel := 3;
  frm_sel_relat.ShowModal;
  KickUser;
end;

procedure Tfrm_main.mi_rel_est_qtde_proc_indClick(Sender: TObject);
begin
  UserUp;
  ReiniciaCloser;
  if not VerIntegridade then Exit;
  vStr_cd_modulo := '15';
  str_cd_rotina := '1584';
  str_cd_mod := vStr_cd_modulo;
  str_cd_rot := str_cd_rotina;
  Application.CreateForm(Tfrm_sel_relat, frm_sel_relat);
  frm_sel_relat.tp_rel := 5;
  frm_sel_relat.ShowModal;
  KickUser;
end;

procedure Tfrm_main.mi_rel_exp_mapa_anl_oxClick(Sender: TObject);
begin
  UserUp;
  ReiniciaCloser;
  if not VerIntegridade then Exit;
  vStr_cd_modulo := '15';
  str_cd_rotina := '1580';
  str_cd_mod := vStr_cd_modulo;
  str_cd_rot := str_cd_rotina;
  Application.CreateForm(Tfrm_sel_relat, frm_sel_relat);
  frm_sel_relat.tp_rel := 4;
  frm_sel_relat.ShowModal;
  KickUser;
end;

procedure Tfrm_main.mi_rel_exp_flp_indClick(Sender: TObject);
begin
  UserUp;
  ReiniciaCloser;
  if not VerIntegridade then Exit;
  vStr_cd_modulo := '15';
  str_cd_rotina := '1585';
  str_cd_mod := vStr_cd_modulo;
  str_cd_rot := str_cd_rotina;
  Application.CreateForm(Tfrm_rel_exp_flp, frm_rel_exp_flp);
  frm_rel_exp_flp.tp_rel := 2;
  frm_rel_exp_flp.ShowModal;
  KickUser;
end;

procedure Tfrm_main.mi_gestao_poClick(Sender: TObject);
begin
  UserUp;
  ReiniciaCloser;
  if not VerIntegridade then Exit;
  vStr_cd_modulo := '18';
  str_cd_rotina := '1820';
  str_cd_mod := vStr_cd_modulo;
  str_cd_rot := str_cd_rotina;
  Application.CreateForm(TfrmGestaoPedido, frmGestaoPedido);
  frmGestaoPedido.mskNrProcesso.Text := Trim(nr_po_gestao);
  frmGestaoPedido.ShowModal;
  VerAtalho;
  KickUser;
end;

procedure Tfrm_main.mi_po_ev_criticoClick(Sender: TObject);
begin
//  UserUp;
//  ReiniciaCloser;
//  if not VerIntegridade then Exit;
//  vStr_cd_modulo := '18';
//  str_cd_rotina := '1821';
//  str_cd_mod := vStr_cd_modulo;
//  str_cd_rot := str_cd_rotina;
//  Application.CreateForm(Tfrm_evento_critico, frm_evento_critico);
//  frm_evento_critico.ShowModal;
//  KickUser;
end;

procedure Tfrm_main.FollowUpControledeNavios1Click(Sender: TObject);
begin
  UserUp;
  ReiniciaCloser;
  if not VerIntegridade then Exit;
  vStr_cd_modulo := '15';
  str_cd_rotina := '1583';
  str_cd_mod := vStr_cd_modulo;
  str_cd_rot := str_cd_rotina;
  Application.CreateForm(Tfrm_rel_exp_flp, frm_rel_exp_flp);
  frm_rel_exp_flp.tp_rel := 3;
  frm_rel_exp_flp.ShowModal;
  KickUser;
end;

procedure Tfrm_main.mi_relacao_ev_criticoClick(Sender: TObject);
begin
//  UserUp;
//  ReiniciaCloser;
//  if not VerIntegridade then Exit;
//  vStr_cd_modulo := '01';
//  str_cd_rotina := '0132';
//  str_cd_mod := vStr_cd_modulo;
//  str_cd_rot := str_cd_rotina;
//  Application.CreateForm(Tfrm_rel_ev_critico, frm_rel_ev_critico);
//  frm_rel_ev_critico.vTipoRel := 0;
//  frm_rel_ev_critico.ShowModal;
//  KickUser;
end;

procedure Tfrm_main.mi_po_rel_gestaoClick(Sender: TObject);
begin
  UserUp;
  ReiniciaCloser;
  if not VerIntegridade then Exit;
  vStr_cd_modulo := '18';
  str_cd_rotina := '1822';
  str_cd_mod := vStr_cd_modulo;
  str_cd_rot := str_cd_rotina;
  Application.CreateForm(Tfrm_po_planilha, frm_po_planilha);
  frm_po_planilha.ShowModal;
  KickUser;
end;

procedure Tfrm_main.mi_relacao_ev_critico_poClick(Sender: TObject);
begin
//  UserUp;
//  ReiniciaCloser;
//  if not VerIntegridade then Exit;
//  vStr_cd_modulo := '18';
//  str_cd_rotina := '1833';
//  str_cd_mod := vStr_cd_modulo;
//  str_cd_rot := str_cd_rotina;
//  Application.CreateForm(Tfrm_rel_ev_critico, frm_rel_ev_critico);
//  frm_rel_ev_critico.vTipoRel := 1;
//  frm_rel_ev_critico.ShowModal;
//  KickUser;
end;

procedure Tfrm_main.mi_rel_imp_acomp_procClick(Sender: TObject);
begin
  UserUp;
  ReiniciaCloser;
  if Not VerIntegridade then Exit;
  vStr_cd_modulo := '15';
  str_cd_rotina := '1584';
  str_cd_mod    := vStr_cd_modulo;
  str_cd_rot    := str_cd_rotina;
  Application.CreateForm(Tfrm_sel_relat, frm_sel_relat);
  frm_sel_relat.tp_rel := 6;
  frm_sel_relat.ShowModal;
  KickUser;
end;

procedure Tfrm_main.mi_cad_frete_importacaoClick(Sender: TObject);
begin
  UserUp;
  ReiniciaCloser;
  if Not VerIntegridade then Exit;
  vStr_cd_modulo := '22';
  str_cd_rotina := '2288';
  str_cd_mod    := vStr_cd_modulo;
  str_cd_rot    := str_cd_rotina;
  Application.CreateForm(Tfrm_frete_serv, frm_frete_serv);
  frm_frete_serv.Modulo := 'I';
  frm_frete_serv.Caption := 'Tabela de Fretes - [ Importação ]';
  frm_frete_serv.ShowModal;
  KickUser;
end;

procedure Tfrm_main.mi_cad_frete_exportacaoClick(Sender: TObject);
begin
  UserUp;
  ReiniciaCloser;
  if Not VerIntegridade then Exit;
  vStr_cd_modulo := '22';
  str_cd_rotina := '2289';
  str_cd_mod    := vStr_cd_modulo;
  str_cd_rot    := str_cd_rotina;
  Application.CreateForm(Tfrm_frete_serv, frm_frete_serv);
  frm_frete_serv.Modulo := 'E';
  frm_frete_serv.Caption := 'Tabela de Fretes - [ Exportação ]';
  frm_frete_serv.ShowModal;
  KickUser;
end;

procedure Tfrm_main.mi_cad_tabela_iataClick(Sender: TObject);
begin
  UserUp;
  ReiniciaCloser;
  if Not VerIntegridade then Exit;
  vStr_cd_modulo := '22';
  str_cd_rotina := '2290';
  str_cd_mod    := vStr_cd_modulo;
  str_cd_rot    := str_cd_rotina;
  Application.CreateForm(Tfrm_frete_serv, frm_frete_serv);
  frm_frete_serv.bl_IATA:=true;
  frm_frete_serv.ShowModal;
  KickUser;
end;

procedure Tfrm_main.mi_cad_notificadorClick(Sender: TObject);
begin
  UserUp;
  ReiniciaCloser;
  if Not VerIntegridade then Exit;
  vStr_cd_modulo := '22';
  str_cd_rotina := '2279';
  Application.CreateForm(Tfrm_notificador, frm_notificador);
  frm_notificador.ShowModal;
  KickUser;
end;

procedure Tfrm_main.mi_cad_documentosClick(Sender: TObject);
begin
  UserUp;
  ReiniciaCloser;
  if Not VerIntegridade then Exit;
  vStr_cd_modulo := '22';
  str_cd_rotina := '2271';
  str_cd_mod    := vStr_cd_modulo;
  str_cd_rot    := str_cd_rotina;
  Application.CreateForm(Tfrm_mod_doc, frm_mod_doc);
  frm_mod_doc.ShowModal;
  KickUser;
end;

procedure Tfrm_main.mi_cad_portosClick(Sender: TObject);
begin
  UserUp;
  ReiniciaCloser;
  if Not VerIntegridade then Exit;
  vStr_cd_modulo := '22';
  str_cd_rotina := '2267';
  str_cd_mod    := vStr_cd_modulo;
  str_cd_rot    := str_cd_rotina;
  // Navegacao(str_cd_mod, str_cd_rot, 'E');
  Application.CreateForm( Tfrm_portos, frm_portos );
  frm_portos.In_porto := True;
  frm_portos.ShowModal;
  // Navegacao(str_cd_mod, str_cd_rot, 'S');
  KickUser;
end;

procedure Tfrm_main.mi_cad_vendedoresClick(Sender: TObject);
begin
  UserUp;
  ReiniciaCloser;
  if Not VerIntegridade then Exit;
  vStr_cd_modulo := '22';
  str_cd_rotina := '2272';
  str_cd_mod    := vStr_cd_modulo;
  str_cd_rot    := str_cd_rotina;
  // Navegacao(str_cd_mod, str_cd_rot, 'E');
  Application.CreateForm( Tfrm_vendedores, frm_vendedores );
  frm_vendedores.ShowModal;
  // Navegacao(str_cd_mod, str_cd_rot, 'S');
  KickUser;
end;

procedure Tfrm_main.mi_manut_cli_avClick(Sender: TObject);
begin
  UserUp;
  ReiniciaCloser;
  if Not VerIntegridade then Exit;
  vStr_cd_modulo := '31';
  str_cd_rotina := '3105';
  str_cd_mod    := vStr_cd_modulo;
  str_cd_rot    := str_cd_rotina;
  // Navegacao(str_cd_mod, str_cd_rot, 'E');
  Application.CreateForm(Tfrm_proc_comerc, frm_proc_comerc);
  frm_proc_comerc.ShowModal;
  // Navegacao(str_cd_mod, str_cd_rot, 'S');
  KickUser;
end;

procedure Tfrm_main.mi_proc_comercClick(Sender: TObject);
begin
  UserUp;
  ReiniciaCloser;
  if Not VerIntegridade then Exit;
  vStr_cd_modulo := '31';
  str_cd_rotina := '3101';
  str_cd_mod    := vStr_cd_modulo;
  str_cd_rot    := str_cd_rotina;
  // Navegacao(str_cd_mod, str_cd_rot, 'E');
  Application.CreateForm(Tfrm_proc_comerc, frm_proc_comerc);
  frm_proc_comerc.ShowModal;
  // Navegacao(str_cd_mod, str_cd_rot, 'S');      
  KickUser;
end;

procedure Tfrm_main.mi_propostaClick(Sender: TObject);
begin
  UserUp;
  ReiniciaCloser;
  if Not VerIntegridade then Exit;
  vStr_cd_modulo := '31';
  str_cd_rotina := '3102';
  str_cd_mod    := vStr_cd_modulo;
  str_cd_rot    := str_cd_rotina;
  // Navegacao(str_cd_mod, str_cd_rot, 'E');
  Application.CreateForm(Tfrm_proposta,frm_proposta);
  frm_proposta.Caption:='Proposta';
  frm_proposta.ShowModal;
  // Navegacao(str_cd_mod, str_cd_rot, 'S');
  KickUser;
end;

procedure Tfrm_main.mi_cotacaoClick(Sender: TObject);
begin
  UserUp;
  ReiniciaCloser;
  if Not VerIntegridade then Exit;
  vStr_cd_modulo := '31';
  str_cd_rotina := '3104';
  str_cd_mod    := vStr_cd_modulo;
  str_cd_rot    := str_cd_rotina;
  // Navegacao(str_cd_mod, str_cd_rot, 'E');
  Application.CreateForm(Tfrm_cotacao,frm_cotacao);
  frm_cotacao.ShowModal;
  // Navegacao(str_cd_mod, str_cd_rot, 'S');
  KickUser;
end;

procedure Tfrm_main.mi_agenda_comercialClick(Sender: TObject);
begin
  UserUp;
  ReiniciaCloser;
  if Not VerIntegridade then Exit;
  vStr_cd_modulo := '31';
  str_cd_rotina := '3103';
  str_cd_mod    := vStr_cd_modulo;
  str_cd_rot    := str_cd_rotina;
  // Navegacao(str_cd_mod, str_cd_rot, 'E');
  Application.CreateForm(Tfrm_agenda_comercial, frm_agenda_comercial);
  frm_agenda_comercial.ShowModal;
  // Navegacao(str_cd_mod, str_cd_rot, 'S');
  KickUser;
end;

procedure Tfrm_main.mi_instr_comerc_aereoClick(Sender: TObject);
begin
  UserUp;
  ReiniciaCloser;
 if Not VerIntegridade then Exit;
  vStr_cd_modulo := '31';
  str_cd_rotina := '3106';
  str_cd_mod    := vStr_cd_modulo;
  str_cd_rot    := str_cd_rotina;
  // Navegacao(str_cd_mod, str_cd_rot, 'E');
  Application.CreateForm(Tfrm_pedido_instrucao, frm_pedido_instrucao);
  frm_pedido_instrucao.Caption := 'Instrução de Embarque - Aéreo';
  frm_pedido_instrucao.in_comerc:=true;
  frm_pedido_instrucao.via_transp:='04';
  frm_pedido_instrucao.ShowModal;
  // Navegacao(str_cd_mod, str_cd_rot, 'S');
  KickUser;
 end;

procedure Tfrm_main.mi_instr_maritClick(Sender: TObject);
begin
  UserUp;
  ReiniciaCloser;
  if Not VerIntegridade then Exit;
  vStr_cd_modulo := '31';
  str_cd_rotina := '3107';
  str_cd_mod    := vStr_cd_modulo;
  str_cd_rot    := str_cd_rotina;
  Application.CreateForm(Tfrm_pedido_instrucao, frm_pedido_instrucao);
  frm_pedido_instrucao.Caption := 'Instrução de Embarque - Marítimo';
  frm_pedido_instrucao.in_comerc:=true;
  frm_pedido_instrucao.via_transp:='01';
  frm_pedido_instrucao.ShowModal;
  KickUser;
end;

procedure Tfrm_main.tmrHoraTimer(Sender: TObject);
begin
  lblHora.Caption := FormatDateTime('hh:mm:ss',now);
  // pnl_inativo.Visible := ( Closer.vMostrandoInatividade );
end;

procedure Tfrm_main.mi_cad_aeroportosClick(Sender: TObject);
begin
  UserUp;
  ReiniciaCloser;
  if Not VerIntegridade then Exit;
  vStr_cd_modulo := '22';
  str_cd_rotina := '2292';
  str_cd_mod    := vStr_cd_modulo;
  str_cd_rot    := str_cd_rotina;
  // Navegacao(str_cd_mod, str_cd_rot, 'E');
  Application.CreateForm( Tfrm_portos, frm_portos );
  frm_portos.In_porto := False;
  frm_portos.ShowModal;
  // Navegacao(str_cd_mod, str_cd_rot, 'S');
  KickUser;
end;

procedure Tfrm_main.mi_agentes_cargaClick(Sender: TObject);
begin
  UserUp;
  ReiniciaCloser;
  if not VerIntegridade then Exit;
  vStr_cd_modulo := '22';
  str_cd_rotina := '2293';
  str_cd_mod := vStr_cd_modulo;
  str_cd_rot := str_cd_rotina;
  Application.CreateForm(Tfrm_ag, frm_ag);
  frm_ag.tp_ag := True;
  frm_ag.ShowModal;
  KickUser;
end;

procedure Tfrm_main.mi_cad_grupo_portosClick(Sender: TObject);
begin
  UserUp;
  ReiniciaCloser;
  if not VerIntegridade then Exit;
  vStr_cd_modulo := '22';
  str_cd_rotina := '2294';
  str_cd_mod := vStr_cd_modulo;
  str_cd_rot := str_cd_rotina;
  Application.CreateForm(Tfrm_grupo_portos, frm_grupo_portos);
  frm_grupo_portos.ShowModal;
  KickUser;
end;

procedure Tfrm_main.AberturaComercial1Click(Sender: TObject);
begin
  UserUp;
  ReiniciaCloser;
  if not VerIntegridade then Exit;
  vStr_cd_modulo := '01';
  str_cd_rotina := '0133';
  str_cd_mod := vStr_cd_modulo;
  str_cd_rot := str_cd_rotina;
  Application.CreateForm(Tfrm_abre_proc, frm_abre_proc);
  frm_abre_proc.in_comercial:= true;
  frm_abre_proc.ShowModal;
  VerAtalho;
  KickUser;
end;

procedure Tfrm_main.mi_fat_rel_val_retClick(Sender: TObject);
begin
  UserUp;
  ReiniciaCloser;
  if not VerIntegridade then Exit;
  vStr_cd_modulo := '11';
  str_cd_rotina := '1145';
  str_cd_mod := vStr_cd_modulo;
  str_cd_rot := str_cd_rotina;
  Application.CreateForm(Tfrm_sel_relat, frm_sel_relat);
  frm_sel_relat.tp_rel := 8;
  frm_sel_relat.ShowModal;
  KickUser;
end;

procedure Tfrm_main.mi_config_alerta_eventosClick(Sender: TObject);
begin
  UserUp;
  ReiniciaCloser;
  if not VerIntegridade then Exit;
  vStr_cd_modulo := '24';
  str_cd_rotina := '2440';
  str_cd_mod := vStr_cd_modulo;
  str_cd_rot := str_cd_rotina;
  Application.CreateForm(Tfrm_relatorios_mail_aut, frm_relatorios_mail_aut);
  frm_relatorios_mail_aut.ShowModal;
  KickUser;
end;

procedure Tfrm_main.closerBeforeClose(Sender: TObject; var CanClose: Boolean);
begin
  UserUp;
  //  CanClose := True;
  //  if Closer.vMostrandoInatividade then begin
  //    btn_sairClick(nil);
  //  end else begin
  //    pnl_inativo.Visible := True;
  //    CanClose := False;
  //    frm_main.closer.Enabled := False;
  //    frm_main.closer.TimeOut := 30;
  //    frm_main.closer.Enabled := True;
  //  end;
end;

procedure Tfrm_main.ReiniciaCloser;
begin
  UserUp;
  //  pnl_inativo.Visible := False;
  //  frm_main.closer.Enabled := False;
  //  frm_main.closer.TimeOut := vCloserTimeout;
  //  frm_main.closer.Enabled := True;
end;

procedure Tfrm_main.FormDeactivate(Sender: TObject);
begin
  UserUp;
  ReiniciaCloser;
end;

procedure Tfrm_main.mi_nf_indaiaClick(Sender: TObject);
begin
  UserUp;
  ReiniciaCloser;
  if not VerIntegridade then Exit;
  vStr_cd_modulo := '24';
  str_cd_rotina := '2441';
  str_cd_mod := vStr_cd_modulo;
  str_cd_rot := str_cd_rotina;
  Application.CreateForm(Tfrm_trans_nota, frm_trans_nota);
  frm_trans_nota.ShowModal;
  KickUser;
end;

procedure Tfrm_main.Laudo1Click(Sender: TObject);
begin
  AbreFormLaudo(Application.Handle, datm_main.db_broker, Str_cd_cargo);
end;

procedure Tfrm_main.mi_consulta_dbClick(Sender: TObject);
begin
  AbreFormConsultaDB(Application.Handle, datm_main.db_broker, Str_cd_cargo, Str_cd_usuario, Str_cd_rotina);
end;

procedure Tfrm_main.MensagensdeErro1Click(Sender: TObject);
begin
  AbreFormMensagemErro(Application.Handle, datm_main.db_broker, Str_cd_cargo, Str_cd_usuario, Str_cd_rotina);
end;

procedure Tfrm_main.mi_rel_armaz_cargaClick(Sender: TObject);
begin
  UserUp;
  ReiniciaCloser;
  if not VerIntegridade then Exit;
  vStr_cd_modulo := '15';
  str_cd_rotina := '1586';
  str_cd_mod := vStr_cd_modulo;
  str_cd_rot := str_cd_rotina;
  Application.CreateForm(Tfrm_sel_padrao_agente, frm_sel_padrao_agente);
  frm_sel_padrao_agente.tp_rel := 4;
  frm_sel_padrao_agente.ShowModal;
  KickUser;
end;

procedure Tfrm_main.mi_fatura_comercial2Click(Sender: TObject);
begin
  UserUp;
  Application.CreateForm(Tfrm_fatura_comercial2, frm_fatura_comercial2);
  frm_fatura_comercial2.ShowModal;
  KickUser;
end;

procedure Tfrm_main.mi_rel_armaz_fumigaClick(Sender: TObject);
begin
  UserUp;
  Application.CreateForm(Tfrm_sel_padrao_agente, frm_sel_padrao_agente);
  frm_sel_padrao_agente.tp_rel := 5;
  frm_sel_padrao_agente.ComPeriodo := True;
  frm_sel_padrao_agente.ShowModal;
  KickUser;
end;

procedure Tfrm_main.mi_packing_list2Click(Sender: TObject);
begin
  UserUp;
  Application.CreateForm(Tfrm_packing_list2, frm_packing_list2);
  frm_packing_list2.ShowModal;
  KickUser;
end;

procedure Tfrm_main.mi_rel_imp_fup_diaClick(Sender: TObject);
begin
  UserUp;
  ReiniciaCloser;
  if not VerIntegridade then Exit;
  vStr_cd_modulo := '15';
  str_cd_rotina := '1587';
  str_cd_mod := vStr_cd_modulo;
  str_cd_rot := str_cd_rotina;
  Application.CreateForm(Tfrm_sel_padrao_agente, frm_sel_padrao_agente);
  frm_sel_padrao_agente.ComPeriodo := True;
  frm_sel_padrao_agente.tp_rel := 6;
  frm_sel_padrao_agente.ShowModal;
  KickUser;
end;

procedure Tfrm_main.mi_rel_imp_fup_processoClick(Sender: TObject);
begin
  UserUp;
  ReiniciaCloser;
  if not VerIntegridade then Exit;
  vStr_cd_modulo := '15';
  str_cd_rotina := '1588';
  str_cd_mod := vStr_cd_modulo;
  str_cd_rot := str_cd_rotina;
  Application.CreateForm(Tfrm_sel_padrao_agente, frm_sel_padrao_agente);
  frm_sel_padrao_agente.ComPeriodo := True;
  frm_sel_padrao_agente.tp_rel := 7;
  frm_sel_padrao_agente.ShowModal;
  KickUser;
end;

procedure Tfrm_main.mi_rel_imp_fup_procClick(Sender: TObject);
begin
  UserUp;
  ReiniciaCloser;
  if not VerIntegridade then Exit;
  vStr_cd_modulo := '15';
  str_cd_rotina := '1588';
  str_cd_mod := vStr_cd_modulo;
  str_cd_rot := str_cd_rotina;
  Application.CreateForm(Tfrm_sel_padrao_agente, frm_sel_padrao_agente);
  frm_sel_padrao_agente.ComPeriodo := True;
  frm_sel_padrao_agente.tp_rel := 7;
  frm_sel_padrao_agente.ShowModal;
  KickUser;
end;

procedure Tfrm_main.BitBtn1Click(Sender: TObject);
//var Ano, Mes, Dia : Word;
begin
  UserUp;
  //  Application.CreateForm(Tfrm_altera_servico, frm_altera_servico);
  //  frm_altera_servico.ShowModal;
  //  ShowMessage(DateToStr(PoeOuTiraDiasUteis(0,'+',StrToDate('01/10/2005'))));
  //  DecodeDate (now, Ano, Mes, Dia);
  //  ShowMessage( DateToStr(PoeOuTiraDiasUteis(5,'-',StrToDate(FormatDateTime('dd/mm/yyyy',EndOfAMonth(Ano,Mes))))));
  //  Application.CreateForm(TfrmCatalogoEnderecos, frmCatalogoEnderecos);
  //  frmCatalogoEnderecos.ShowModal;
  //  ShowMessage(OpenAddressBook(10,10));
  //  Application.CreateForm(Tfrm_parametrizacao, frm_parametrizacao);
  //  frm_parametrizacao.ShowModal;
  //  Application.CreateForm(Tfrm_BSH_Integracao_DI, frm_BSH_Integracao_DI);
  //  frm_BSH_Integracao_DI.ShowModal;
  //  Application.CreateForm(Tfrm_followup, frm_followup);
  //  frm_followup.ShowModal;
  //  Application.CreateForm(Tfrm_upload_img, frm_upload_img);
  //  frm_upload_img.ShowModal;
try

  vCaminhoHelpDesk := 'c:\DDBROKER\HelpDeskUsuario.exe ' + str_cd_usuario;
  WinExec(PChar(vCaminhoHelpDesk) , SW_SHOW);
except
  Application.MessageBox('Não foi possível abrir o sistema de HelpDesk', 'MyIndaiá', MB_OK + MB_ICONERROR);
  Exit;
end;



end;

procedure Tfrm_main.mi_TaxaSELICClick(Sender: TObject);
begin
  UserUp;
  ReiniciaCloser;
  if not VerIntegridade then Exit;
  vStr_cd_modulo := '22';
  str_cd_rotina := '2295';
  str_cd_mod := vStr_cd_modulo;
  str_cd_rot := str_cd_rotina;
  Application.CreateForm(Tfrm_taxaSelic, frm_taxaSelic);
  frm_taxaSelic.ShowModal;
  KickUser;
end;

procedure Tfrm_main.mi_recebimento_agClick(Sender: TObject);
begin
  UserUp;
  if Not VerIntegridade then Exit;
  vStr_cd_modulo := '06';
  str_cd_rotina := '0608';
  str_cd_mod    := vStr_cd_modulo;
  str_cd_rot    := str_cd_rotina;
  // Navegacao(str_cd_mod, str_cd_rot, 'E');
  Application.CreateForm( Tfrm_recebimento_ag, frm_recebimento_ag );
  frm_recebimento_ag.ShowModal;
  // Navegacao(str_cd_mod, str_cd_rot, 'S');
  KickUser;
end;

procedure Tfrm_main.mi_db_isen_forecastClick(Sender: TObject);
begin
  AbreFormForecast(Application.Handle, datm_main.db_broker, Str_cd_cargo, Str_cd_usuario, tdIsencao);
end;

procedure Tfrm_main.mi_cad_fin_centro_custosClick(Sender: TObject);
begin
  UserUp;
  ReiniciaCloser;
  if not VerIntegridade then Exit;
  vStr_cd_modulo := '22';
  str_cd_rotina := '2295';
  str_cd_mod := vStr_cd_modulo;
  str_cd_rot := str_cd_rotina;
  Application.CreateForm(Tfrm_centro_custo, frm_centro_custo);
  frm_centro_custo.ShowModal;
  KickUser;
end;

procedure Tfrm_main.mi_lancamentosClick(Sender: TObject);
begin
  UserUp;
  if Not VerIntegridade then Exit;
  vStr_cd_modulo := '37';
  str_cd_rotina := '3701';
  str_cd_mod    := vStr_cd_modulo;
  str_cd_rot    := str_cd_rotina;
  // Navegacao(str_cd_mod, str_cd_rot, 'E');
  Application.CreateForm(Tfrm_ctaapagar, frm_ctaapagar);
  frm_ctaapagar.lPesq := False;
  frm_ctaapagar.ShowModal;
  // Navegacao(str_cd_mod, str_cd_rot, 'S');
  KickUser;
end;

procedure Tfrm_main.mi_AutorizaodePagamentosClick(Sender: TObject);
begin
  UserUp;
  if Not VerIntegridade then Exit;
  vStr_cd_modulo := '37';
  str_cd_rotina := '3702';
  str_cd_mod    := vStr_cd_modulo;
  str_cd_rot    := str_cd_rotina;
  // Navegacao(str_cd_mod, str_cd_rot, 'E');
  Application.CreateForm(Tfrm_lib_ctaapagar, frm_lib_ctaapagar);
  frm_lib_ctaapagar.ShowModal;
  // Navegacao(str_cd_mod, str_cd_rot, 'S');
  KickUser;
end;

procedure Tfrm_main.mi_IntegraocomSISPAGClick(Sender: TObject);
begin
  UserUp;
  if Not VerIntegridade then Exit;
  vStr_cd_modulo := '37';
  str_cd_rotina := '3703';
  str_cd_mod    := vStr_cd_modulo;
  str_cd_rot    := str_cd_rotina;
  // Navegacao(str_cd_mod, str_cd_rot, 'E');
  Application.CreateForm(Tfrm_sel_banco_data, frm_sel_banco_data);
  frm_sel_banco_data.str_cd_relatorio := '2';
  frm_sel_banco_data.ShowModal;
  // Navegacao(str_cd_mod, str_cd_rot, 'S');
  KickUser;
end;

procedure Tfrm_main.mi_PesquisarClick(Sender: TObject);
begin
  UserUp;
  if Not VerIntegridade then Exit;
  vStr_cd_modulo := '37';
  str_cd_rotina := '3704';
  str_cd_mod    := vStr_cd_modulo;
  str_cd_rot    := str_cd_rotina;
  // Navegacao(str_cd_mod, str_cd_rot, 'E');
  Application.CreateForm(Tfrm_ctaapagar, frm_ctaapagar);
  frm_ctaapagar.lPesq := True;
  frm_ctaapagar.ShowModal;
  // Navegacao(str_cd_mod, str_cd_rot, 'S');
  KickUser;
end;

procedure Tfrm_main.mi_RelaodeContasaPagarClick(Sender: TObject);
begin
  UserUp;
  if Not VerIntegridade then Exit;
  vStr_cd_modulo := '37';
  str_cd_rotina := '3705';
  str_cd_mod    := vStr_cd_modulo;
  str_cd_rot    := str_cd_rotina;
  // Navegacao(str_cd_mod, str_cd_rot, 'E');
  Application.CreateForm(Tfrm_sel_col_periodo, frm_sel_col_periodo);
  frm_sel_col_periodo.str_cd_relatorio := '2';
  frm_sel_col_periodo.ShowModal;
  // Navegacao(str_cd_mod, str_cd_rot, 'S');
  KickUser;
end;

procedure Tfrm_main.mi_RelaodePagtosLiberadosClick(Sender: TObject);
begin
  UserUp;
  if Not VerIntegridade then Exit;
  vStr_cd_modulo := '37';
  str_cd_rotina := '3706';
  str_cd_mod    := vStr_cd_modulo;
  str_cd_rot    := str_cd_rotina;
  Application.CreateForm(Tfrm_sel_col_periodo, frm_sel_col_periodo);
  frm_sel_col_periodo.str_cd_relatorio := '3';
  frm_sel_col_periodo.ShowModal;
  KickUser;
end;

procedure Tfrm_main.mi_cad_fin_item_avancClick(Sender: TObject);
begin
  UserUp;
  // mi_cad_fin_item_avanc
  if Not VerIntegridade then Exit;
  vStr_cd_modulo := '22';
  str_cd_rotina := '2297';
  str_cd_mod    := vStr_cd_modulo;
  str_cd_rot    := str_cd_rotina;
  // Navegacao(str_cd_mod, str_cd_rot, 'E');
  Application.CreateForm(Tfrm_Caditens_Avancado, frm_Caditens_Avancado );
  frm_Caditens_Avancado.in_contabil := true;
  frm_Caditens_Avancado.ShowModal;
  // Navegacao(str_cd_mod, str_cd_rot, 'S');
  KickUser;
end;

procedure Tfrm_main.mi_evento_contabClick(Sender: TObject);
begin
  UserUp;
  if Not VerIntegridade then Exit;
  vStr_cd_modulo := '22';
  str_cd_rotina := '2296';
  str_cd_mod    := vStr_cd_modulo;
  str_cd_rot    := str_cd_rotina;
  // Navegacao(str_cd_mod, str_cd_rot, 'E');
  Application.CreateForm(Tfrm_item_contabil, frm_item_contabil );
  frm_item_contabil.ShowModal;
  // Navegacao(str_cd_mod, str_cd_rot, 'S');
  KickUser;
end;

procedure Tfrm_main.mi_notificacaoClick(Sender: TObject);
begin
  UserUp;
  if Not VerIntegridade then Exit;
  vstr_cd_modulo := '05';
  str_cd_rotina := '0504';
  str_cd_mod    := vstr_cd_modulo;
  str_cd_rot    := str_cd_rotina;
  // Navegacao(str_cd_mod, str_cd_rot, 'E');
  Application.CreateForm(Tfrm_notificacao, frm_notificacao);
  frm_notificacao.ShowModal;
  // Navegacao(str_cd_mod, str_cd_rot, 'S');
  KickUser;
end;

procedure Tfrm_main.EmissodeChequesNotas1Click(Sender: TObject);
begin
  UserUp;
  ReiniciaCloser;
  if not VerIntegridade then Exit;
  vStr_cd_modulo := '27';
  str_cd_rotina := '2703';
  str_cd_mod := vStr_cd_modulo;
  str_cd_rot := str_cd_rotina;
  Application.CreateForm(Tfrm_imp_adm_old, frm_imp_adm_old);
  frm_imp_adm_old.ShowModal;
  KickUser;
end;

procedure Tfrm_main.GeraodeTEDs1Click(Sender: TObject);
begin
  UserUp;
  ReiniciaCloser;
  if not VerIntegridade then Exit;
  vStr_cd_modulo := '27';
  str_cd_rotina := '2707';
  str_cd_mod := vStr_cd_modulo;
  str_cd_rot := str_cd_rotina;
  Application.CreateForm(Tfrm_imp_adm_gera_ted_old, frm_imp_adm_gera_ted_old);
  frm_imp_adm_gera_ted_old.ShowModal;
  KickUser;
end;

procedure Tfrm_main.mi_adm_copias_chequeClick(Sender: TObject);
begin
  UserUp;
  ReiniciaCloser;
  if not VerIntegridade then Exit;
  vStr_cd_modulo := '27';
  str_cd_rotina := '2705';
  str_cd_mod := vStr_cd_modulo;
  str_cd_rot := str_cd_rotina;
  Application.CreateForm(Tfrm_sel_data, frm_sel_data);
  frm_sel_data.str_cd_relatorio := '15';
  frm_sel_data.ShowModal;
  KickUser;
end;

procedure Tfrm_main.mi_instr_embarq_aereoClick(Sender: TObject);
begin
  UserUp;
  if Not VerIntegridade then Exit;
  vstr_cd_modulo := '39';
  str_cd_rotina := '3901';
  str_cd_mod    := vstr_cd_modulo;
  str_cd_rot    := str_cd_rotina;
  // Navegacao(str_cd_mod, str_cd_rot, 'E');
  Application.CreateForm(Tfrm_instrucao_embarque,frm_instrucao_embarque);
  frm_instrucao_embarque.via_transp:='04';
  frm_instrucao_embarque.Caption := 'Envio de Instrução - Áereo [Importação]';
  frm_instrucao_embarque.ShowModal;
  // Navegacao(str_cd_mod, str_cd_rot, 'S');
  KickUser;
end;

procedure Tfrm_main.mi_calc_profit_aereoClick(Sender: TObject);
begin
  UserUp;
  if Not VerIntegridade then Exit;
  vstr_cd_modulo := '39';
  str_cd_rotina := '3902';
  str_cd_mod    := vstr_cd_modulo;
  str_cd_rot    := str_cd_rotina;
  Application.CreateForm(Tfrm_calc_profit, frm_calc_profit);
  frm_calc_profit.Caption := 'Pré Alerta - Aéreo [Importação]';
  frm_calc_profit.ShowModal;
  KickUser;
end;

procedure Tfrm_main.mi_instr_embarq_maritClick(Sender: TObject);
begin
  UserUp;
  if Not VerIntegridade then Exit;
  vstr_cd_modulo := '39';
  str_cd_rotina := '3903';
  str_cd_mod    := vstr_cd_modulo;
  str_cd_rot    := str_cd_rotina;
  // Navegacao(str_cd_mod, str_cd_rot, 'E');
  Application.CreateForm(Tfrm_instrucao_embarque,frm_instrucao_embarque);
  frm_instrucao_embarque.via_transp := '01';
  frm_instrucao_embarque.Caption := 'Envio de Instrução - Marítimo [Importação]';
  frm_instrucao_embarque.ShowModal;
  VerAtalho;
  KickUser;
end;

procedure Tfrm_main.mi_ctrl_embarqueClick(Sender: TObject);
begin
  UserUp;
  if Not VerIntegridade then Exit;
  vstr_cd_modulo := '39';
  str_cd_rotina := '3904';
  str_cd_mod    := vstr_cd_modulo;
  str_cd_rot    := str_cd_rotina;
  Application.CreateForm(Tfrm_profit_maritimo,frm_profit_maritimo);
  frm_profit_maritimo.Caption := 'Pré Alerta - Marítimo [Importação]';
  frm_profit_maritimo.ShowModal;
  VerAtalho;
  KickUser;
end;

procedure Tfrm_main.mi_ctrl_demurrageClick(Sender: TObject);
begin
  UserUp;
  if Not VerIntegridade then Exit;
  vstr_cd_modulo := '39';
  str_cd_rotina := '3905';
  str_cd_mod    := vstr_cd_modulo;
  str_cd_rot    := str_cd_rotina;
  Application.CreateForm(Tfrm_ctrl_demurrage, frm_ctrl_demurrage);
  frm_ctrl_demurrage.ShowModal;
  KickUser;
end;

procedure Tfrm_main.mi_retificador_impClick(Sender: TObject);
begin
  UserUp;
  if Not VerIntegridade then Exit;
  vstr_cd_modulo := '39';
  str_cd_rotina := '3906';
  str_cd_mod    := vstr_cd_modulo;
  str_cd_rot    := str_cd_rotina;
  Application.CreateForm( Tfrm_retifica, frm_retifica );
  frm_retifica.Caption := 'Retificador - Importação';
  frm_retifica.ShowModal;
  KickUser;
end;

procedure Tfrm_main.mi_ped_inst_aereaClick(Sender: TObject);
begin
  UserUp;
  if Not VerIntegridade then Exit;
  vstr_cd_modulo := '40';
  str_cd_rotina := '4001';
  str_cd_mod    := vstr_cd_modulo;
  str_cd_rot    := str_cd_rotina;
  Application.CreateForm(Tfrm_pedido_instrucao, frm_pedido_instrucao);
  frm_pedido_instrucao.Caption := 'Pedido Instrução - Aéreo [Exportação]';
  frm_pedido_instrucao.via_transp := '04';
  frm_pedido_instrucao.ShowModal;
  KickUser;
end;

procedure Tfrm_main.mi_pre_al_maritClick(Sender: TObject);
begin
  UserUp;
  if Not VerIntegridade then Exit;
  vstr_cd_modulo := '40';
  str_cd_rotina := '4002';
  str_cd_mod    := vstr_cd_modulo;
  str_cd_rot    := str_cd_rotina;
  Application.CreateForm( Tfrm_exp_calc_profit, frm_exp_calc_profit );
  frm_exp_calc_profit.Caption := 'Pré Alerta - Aéreo [Exportação]';
  frm_exp_calc_profit.ShowModal;
  KickUser;
end;

procedure Tfrm_main.mi_rel_iataClick(Sender: TObject);
begin
  UserUp;
  if Not VerIntegridade then Exit;
  vstr_cd_modulo := '40';
  str_cd_rotina := '4003';
  str_cd_mod    := vstr_cd_modulo;
  str_cd_rot    := str_cd_rotina;
  Application.CreateForm(Tfrm_proc_iata,frm_proc_iata);
  frm_proc_iata.cd_via_transp := '04';
  frm_proc_iata.ShowModal;
  KickUser;
end;

procedure Tfrm_main.mi_exp_pedido_maritClick(Sender: TObject);
begin
  UserUp;
  if Not VerIntegridade then Exit;
  vstr_cd_modulo := '40';
  str_cd_rotina := '4004';
  str_cd_mod    := vstr_cd_modulo;
  str_cd_rot    := str_cd_rotina;
  Application.CreateForm(Tfrm_pedido_instrucao, frm_pedido_instrucao);
  frm_pedido_instrucao.Caption := 'Pedido Instrução - Marítimo [Exportação]';
  frm_pedido_instrucao.via_transp:='01';
  frm_pedido_instrucao.ShowModal;
  KickUser;
end;

procedure Tfrm_main.mi_exp_prof_maritClick(Sender: TObject);
begin
  UserUp;
  if Not VerIntegridade then Exit;
  vstr_cd_modulo := '40';
  str_cd_rotina := '4005';
  str_cd_mod    := vstr_cd_modulo;
  str_cd_rot    := str_cd_rotina;
  Application.CreateForm( Tfrm_exp_profit_marit, frm_exp_profit_marit );
  frm_exp_profit_marit.Caption := 'Pré Alerta - Marítimo [Exportação]';
  frm_exp_profit_marit.ShowModal;
  KickUser;
end;

procedure Tfrm_main.mi_exp_com_maritClick(Sender: TObject);
begin
  UserUp;
  if Not VerIntegridade then Exit;
  vstr_cd_modulo := '40';
  str_cd_rotina := '4006';
  str_cd_mod    := vstr_cd_modulo;
  str_cd_rot    := str_cd_rotina;
  Application.CreateForm(Tfrm_proc_iata,frm_proc_iata);
  frm_proc_iata.cd_via_transp := '01';
  frm_proc_iata.ShowModal;
  KickUser;
end;

procedure Tfrm_main.mi_retificador_expClick(Sender: TObject);
begin
  UserUp;
  if Not VerIntegridade then Exit;
  vstr_cd_modulo := '40';
  str_cd_rotina := '4007';
  str_cd_mod    := vstr_cd_modulo;
  str_cd_rot    := str_cd_rotina;
  Application.CreateForm( Tfrm_retifica, frm_retifica );
  frm_retifica.Caption := 'Retificador - Exportação';
  frm_retifica.ShowModal;
  KickUser;
end;

procedure Tfrm_main.mi_analise_accountClick(Sender: TObject);
begin
  UserUp;
  if Not VerIntegridade then Exit;
  vstr_cd_modulo := '38';
  str_cd_rotina := '3801';
  str_cd_mod    := vstr_cd_modulo;
  str_cd_rot    := str_cd_rotina;
  Application.CreateForm(Tfrm_account, frm_account);
  frm_account.ShowModal;
  KickUser;
end;

procedure Tfrm_main.mi_acc_masterClick(Sender: TObject);
begin
  UserUp;
  if Not VerIntegridade then Exit;
  vstr_cd_modulo := '38';
  str_cd_rotina := '3802';
  str_cd_mod    := vstr_cd_modulo;
  str_cd_rot    := str_cd_rotina;
  Application.CreateForm(Tfrm_account, frm_account);
  frm_account.in_master := true;
  frm_account.ShowModal;
  KickUser;
end;

procedure Tfrm_main.mi_emis_faturaClick(Sender: TObject);
begin
  UserUp;
  if Not VerIntegridade then Exit;
  vstr_cd_modulo := '38';
  str_cd_rotina := '3803';
  str_cd_mod    := vstr_cd_modulo;
  str_cd_rot    := str_cd_rotina;
  Application.CreateForm( Tfrm_emissao_fatura, frm_emissao_fatura );
  frm_emissao_fatura.tp_emissao := 0;
  frm_emissao_fatura.ShowModal;
  KickUser;
end;

procedure Tfrm_main.mi_ems_fat_masterClick(Sender: TObject);
begin
  UserUp;
  if Not VerIntegridade then Exit;
  vstr_cd_modulo := '38';
  str_cd_rotina := '3304';
  str_cd_mod    := vstr_cd_modulo;
  str_cd_rot    := str_cd_rotina;
  Application.CreateForm( Tfrm_emissao_fatura, frm_emissao_fatura );
  frm_emissao_fatura.tp_emissao := 1;
  frm_emissao_fatura.ShowModal;
  KickUser;
end;

procedure Tfrm_main.mi_emis_remessaClick(Sender: TObject);
begin
  UserUp;
  if Not VerIntegridade then Exit;
  vstr_cd_modulo := '38';
  str_cd_rotina := '3805';
  str_cd_mod    := vstr_cd_modulo;
  str_cd_rot    := str_cd_rotina;
  Application.CreateForm(Tfrm_emissao_remessa, frm_emissao_remessa);
  frm_emissao_remessa.ShowModal;
  KickUser;
end;

procedure Tfrm_main.mi_gera_remessaClick(Sender: TObject);
begin
  UserUp;
  if Not VerIntegridade then Exit;
  vstr_cd_modulo := '38';
  str_cd_rotina := '3806';
  str_cd_mod    := vstr_cd_modulo;
  str_cd_rot    := str_cd_rotina;
  Application.CreateForm( Tfrm_gerar_remessa, frm_gerar_remessa );
  frm_gerar_remessa.ShowModal;
  KickUser;
end;

procedure Tfrm_main.mi_lib_accountClick(Sender: TObject);
begin
  UserUp;
  if Not VerIntegridade then Exit;
  vstr_cd_modulo := '38';
  str_cd_rotina := '3807';
  str_cd_mod    := vstr_cd_modulo;
  str_cd_rot    := str_cd_rotina;
  Application.CreateForm( Tfrm_lib_account, frm_lib_account );
  frm_lib_account.ShowModal;
  KickUser;
end;

procedure Tfrm_main.mi_disp_remessaClick(Sender: TObject);
begin
  UserUp;
  if Not VerIntegridade then Exit;
  vstr_cd_modulo := '38';
  str_cd_rotina := '3808';
  str_cd_mod    := vstr_cd_modulo;
  str_cd_rot    := str_cd_rotina;
  Application.CreateForm( Tfrm_disp_remessa, frm_disp_remessa );
  frm_disp_remessa.ShowModal;
  KickUser;
end;

procedure Tfrm_main.mi_remissao_fatClick(Sender: TObject);
begin
  UserUp;
  if Not VerIntegridade then Exit;
  vstr_cd_modulo := '38';
  str_cd_rotina := '3809';
  str_cd_mod    := vstr_cd_modulo;
  str_cd_rot    := str_cd_rotina;
  Application.CreateForm( Tfrm_emissao_fatura, frm_emissao_fatura );
  frm_emissao_fatura.tp_emissao := 2;
  frm_emissao_fatura.ShowModal;
  KickUser;
end;

procedure Tfrm_main.mi_fat_complClick(Sender: TObject);
begin
  UserUp;
  if Not VerIntegridade then Exit;
  vstr_cd_modulo := '38';
  str_cd_rotina := '3810';
  str_cd_mod    := vstr_cd_modulo;
  str_cd_rot    := str_cd_rotina;
  Application.CreateForm(Tfrm_fat_Itl_complementar, frm_fat_Itl_complementar);
  frm_fat_Itl_complementar.ShowModal;
  KickUser;
end;

procedure Tfrm_main.mi_fin_rel_dem_clientesClick(Sender: TObject);
begin
  UserUp;
  ReiniciaCloser;
  if not VerIntegridade then Exit;
  vStr_cd_modulo := '12';
  str_cd_rotina := '1211';
  str_cd_mod := vStr_cd_modulo;
  str_cd_rot := str_cd_rotina;
  Application.CreateForm(Tfrm_sel_unid_prod_fin, frm_sel_unid_prod_fin);
  frm_sel_unid_prod_fin.tp_rel := 2;
  frm_sel_unid_prod_fin.ShowModal;
  KickUser;
end;

procedure Tfrm_main.mi_rel_integradoClick(Sender: TObject);
begin
  UserUp;
  if Not VerIntegridade then Exit;
  vstr_cd_modulo := '04';
  str_cd_rotina := '0407';
  str_cd_mod    := vstr_cd_modulo;
  str_cd_rot    := str_cd_rotina;
  Application.CreateForm(Tfrm_rel_integrado_drawback, frm_rel_integrado_drawback);
  frm_rel_integrado_drawback.ShowModal;
  KickUser;
end;

procedure Tfrm_main.mi_db_isen_acClick(Sender: TObject);
begin
  AbreFormAtoConcess(Application.Handle, datm_main.db_broker, Str_cd_cargo, Str_cd_usuario, tdIsencao);
end;

procedure Tfrm_main.mi_cad_conteinersClick(Sender: TObject);
begin
  UserUp;
  ReiniciaCloser;
  if Not VerIntegridade then Exit;
  vStr_cd_modulo := '22';
  str_cd_rotina := '2291';
  str_cd_mod    := vStr_cd_modulo;
  str_cd_rot    := str_cd_rotina;
  Application.CreateForm(Tfrm_cntr, frm_cntr);
  frm_cntr.ShowModal;
  KickUser;
end;

procedure Tfrm_main.mi_banco_itlClick(Sender: TObject);
begin
  UserUp;
  ReiniciaCloser;
  if Not VerIntegridade then Exit;
  vStr_cd_modulo := '22';
  str_cd_rotina := '2296';
  str_cd_mod    := vStr_cd_modulo;
  str_cd_rot    := str_cd_rotina;
  Application.CreateForm(Tfrm_banco_itl,frm_banco_itl);
  frm_banco_itl.ShowModal;
  KickUser;
end;

procedure Tfrm_main.mi_transmissao_re_bshClick(Sender: TObject);
begin
  UserUp;
  ReiniciaCloser;
  if Not VerIntegridade then Exit;
  vStr_cd_modulo := '20';
  str_cd_rotina := '2016';
  Application.CreateForm(TfrmIntegracaoBSH, frmIntegracaoBSH);
  frmIntegracaoBSH.ShowModal;
  KickUser;
end;

procedure Tfrm_main.mi_rel_cat63Click(Sender: TObject);
begin
  UserUp;
  ReiniciaCloser;
  if Not VerIntegridade then Exit;
  vStr_cd_modulo := '20';
  str_cd_rotina := '2016';
  Application.CreateForm(TFrmRelProcessosCat63, FrmRelProcessosCat63);
  FrmRelProcessosCat63.CriaRelatorio('0');
  KickUser;
end;

procedure Tfrm_main.mi_fat_rel_rdClick(Sender: TObject);
begin
  UserUp;
  ReiniciaCloser;
  if Not VerIntegridade then Exit;
  vStr_cd_modulo := '11';
  str_cd_rotina := '1149';
  Application.CreateForm(TFrm_impressao_rd, Frm_impressao_rd);
  Frm_impressao_rd.ShowModal;
  KickUser;
end;

procedure Tfrm_main.mi_fat_emi_dem_despClick(Sender: TObject);
begin
  UserUp;
  ReiniciaCloser;
  if not VerIntegridade then Exit;
  vStr_cd_modulo := '11';
  str_cd_rotina := '1104';
  str_cd_mod := vStr_cd_modulo;
  str_cd_rot := str_cd_rotina;
  Application.CreateForm(Tfrm_sel_fat, frm_sel_fat);
  frm_sel_fat.PreviewFatura := False;
  frm_sel_fat.tp_tipo_fat := 'D';
  frm_sel_fat.ShowModal;
  KickUser;
end;

procedure Tfrm_main.mi_fat_rel_dem_cobClick(Sender: TObject);
begin
  UserUp;
  ReiniciaCloser;
  if not VerIntegridade then Exit;
  vStr_cd_modulo := '11';
  str_cd_rotina := '1145';
  str_cd_mod := vStr_cd_modulo;
  str_cd_rot := str_cd_rotina;
  Application.CreateForm(Tfrm_sel_relat, frm_sel_relat);
  frm_sel_relat.tp_rel := 9;
  frm_sel_relat.ShowModal;
  KickUser;
end;

procedure Tfrm_main.mi_fin_conc_bancClick(Sender: TObject);
begin
  UserUp;
  ReiniciaCloser;
  if not VerIntegridade then Exit;
  vStr_cd_modulo := '12';
  str_cd_rotina := '1221';
  str_cd_mod := vStr_cd_modulo;
  str_cd_rot := str_cd_rotina;
  Application.CreateForm(Tfrm_conciliacao, frm_conciliacao);
  frm_conciliacao.ShowModal;
  KickUser;
end;

procedure Tfrm_main.mi_re_capaClick(Sender: TObject);
begin
  UserUp;
  ReiniciaCloser;
  if not VerIntegridade then
  Exit;

  vStr_cd_modulo := '20';
  str_cd_rotina := '2017';
  str_cd_mod := vStr_cd_modulo;
  str_cd_rot := str_cd_rotina;

  Application.CreateForm(Tdatm_re_capa, datm_re_capa);
  Application.CreateForm(Tfrm_re_capa, frm_re_capa);
  frm_re_capa.ShowModal;
  KickUser;
end;

procedure Tfrm_main.aTrataErrosException(Sender: TObject; E: Exception);
begin
end;

  // Application.CreateForm(TfrmNewTrataErros,frmNewTrataErros);
  // frmNewTrataErros.lbl1.Caption := e.Message;
  // frmNewTrataErros.ShowModal;

procedure Tfrm_main.mi_out_integr_demClick(Sender: TObject);
begin
  UserUp;
  ReiniciaCloser;
  if not VerIntegridade then Exit;
  vStr_cd_modulo := '24';
  str_cd_rotina := '2442';
  str_cd_mod := vStr_cd_modulo;
  str_cd_rot := str_cd_rotina;
  Application.CreateForm(Tfrm_integra_dem, frm_integra_dem);
  frm_integra_dem.ShowModal;
  KickUser;
end;

procedure Tfrm_main.mi_exp_prep_re_reiClick(Sender: TObject);
var
  Arquivo: string;
begin
  UserUp;
  ReiniciaCloser;
  if not VerIntegridade then Exit;
  vStr_cd_modulo := '20';
  str_cd_rotina := '2018';
  str_cd_mod := vStr_cd_modulo;
  str_cd_rot := str_cd_rotina;
  Arquivo := 'BROKHED.EXE ' + 'PREPARA_RE ' + str_cd_usuario + ' ' + str_cd_cargo + ' ' + str_cd_unid_neg;
  WinExec(PChar(Arquivo), SW_SHOW);
  KickUser;
end;

procedure Tfrm_main.mi_fin_fluxoClick(Sender: TObject);
begin
  UserUp;
  ReiniciaCloser;
  if not VerIntegridade then Exit;
  vStr_cd_modulo := '12';
  str_cd_rotina := '1224';
  str_cd_mod := vStr_cd_modulo;
  str_cd_rot := str_cd_rotina;
  Application.CreateForm(Tfrm_sel_unid_cli, frm_sel_unid_cli);
  frm_sel_unid_cli.tp_rel := 14;
  frm_sel_unid_cli.ComPeriodo := True;
  frm_sel_unid_cli.ShowModal;
  KickUser;
end;

procedure Tfrm_main.mi_consulta_parametrizacaoClick(Sender: TObject);
begin
  UserUp;
  ReiniciaCloser;
  if not VerIntegridade then Exit;
  vStr_cd_modulo := '02';
  str_cd_rotina := '0213';
  str_cd_mod := vStr_cd_modulo;
  str_cd_rot := str_cd_rotina;
  Application.CreateForm(Tfrm_parametrizacao, frm_parametrizacao);
  frm_parametrizacao.ShowModal;
  KickUser;
end;

procedure Tfrm_main.appMainMessage(var Msg: tagMSG; var Handled: Boolean);
var
  i: SmallInt;
  Shift: TShiftState;
  M: TMessage;
begin
  if Msg.message = WM_MOUSEWHEEL then
  begin
    Msg.message := WM_KEYDOWN;
    Msg.lParam := 0;
    i := HiWord(Msg.wParam);
    if i > 0 then
      Msg.wParam := VK_UP
    else Msg.wParam := VK_DOWN;
    Handled := False;
  end
  else if Msg.message = WM_KEYDOWN then
  begin
    if GetKeyState(VK_CONTROL) < 0 then
      Shift := [ssCtrl]
    else
      Shift := [];
    if GetKeyState(VK_APPS) < 0 then
      Shift := Shift + [ssAlt];
    if (GetKeyState(VK_SHIFT) < 0) then
      Shift := Shift + [ssShift];
    if ShortCut(Msg.wParam, Shift) = Arquivos1.ShortCut then
      Arquivos1Click(Arquivos1);

    if ShortCut(Msg.wParam, Shift) = VerQuery1.ShortCut then begin
       {by carlos}
       Msg.wParam:=0;
       VerQuery1Click(VerQuery1);
    end;

    if ShortCut(Msg.wParam, Shift) = ObjectInspector1.ShortCut then begin
       {by carlos}
       Msg.wParam:=0;
       ObjectInspector1Click(ObjectInspector1);
    end;

    if (Screen.ActiveControl = wbMyTwitter) and (Shift = [ssCtrl]) and (not (Msg.wParam in [67, 99])) then
      Msg.hwnd := Self.Handle;
  end;
end;

procedure Tfrm_main.mi_leitura_arquivos_bshClick(Sender: TObject);
begin
  UserUp;
  ReiniciaCloser;
  if not VerIntegridade then Exit;
  vStr_cd_modulo := '24';
  str_cd_rotina := '2436';
  str_cd_mod := vStr_cd_modulo;
  str_cd_rot := str_cd_rotina;
  Application.CreateForm(Tfrm_BSH_Integracao_DI, frm_BSH_Integracao_DI);
  frm_BSH_Integracao_DI.ShowModal;
  KickUser;
end;

procedure Tfrm_main.mi_env_doc_webClick(Sender: TObject);
begin
  UserUp;
  if not VerIntegridade then Exit;
  vStr_cd_modulo := '24';
  str_cd_rotina := '2437';
  str_cd_mod := vStr_cd_modulo;
  str_cd_rot := str_cd_rotina;
  Application.CreateForm(Tfrm_upload_img, frm_upload_img);
  frm_upload_img.ShowModal;
  KickUser;
end;

procedure Tfrm_main.mi_carta_configClick(Sender: TObject);
begin
  UserUp;
  Application.CreateForm(TfrmCartaConfig, frmCartaConfig);
  frmCartaConfig.ShowModal;
  KickUser;
end;

procedure Tfrm_main.mi_emissao_documentosClick(Sender: TObject);
begin
  UserUp;
  Application.CreateForm(TfrmEmissaoDocumentos, frmEmissaoDocumentos);
  vTipoTabela := TTProcesso;
  frmEmissaoDocumentos.ShowModal;
  KickUser;
end;

procedure Tfrm_main.KickUser;
begin
  if Screen.ActiveForm = Self then    
  begin
    if datm_main.db_broker.Connected then
      datm_main.db_broker.Close;
    if datm_main.db_suporte.Connected then
      datm_main.db_suporte.Close;
    if datm_main.db_broker_pendencias.Connected then
      datm_main.db_broker_pendencias.Close;
  end;
end;

procedure Tfrm_main.UserUp;
begin
  if not datm_main.db_broker.Connected then
    datm_main.db_broker.Open;
end;

procedure Tfrm_main.mi_fat_emi_dem_desp_compClick(Sender: TObject);
begin
  UserUp;
  ReiniciaCloser;
  if not VerIntegridade then Exit;
  vStr_cd_modulo := '11';
  str_cd_rotina := '1104';
  str_cd_mod := vStr_cd_modulo;
  str_cd_rot := str_cd_rotina;
  Application.CreateForm(Tfrm_sel_fat, frm_sel_fat);
  frm_sel_fat.PreviewFatura := False;
  frm_sel_fat.tp_tipo_fat := 'C';
  frm_sel_fat.ShowModal;
  KickUser;
end;

procedure Tfrm_main.mi_cria_variaveisClick(Sender: TObject);
begin
  UserUp;
  Application.CreateForm(TfrmCriaVariaveis, frmCriaVariaveis);
  vTipoTabela := TTProcesso;
  frmCriaVariaveis.ShowModal;
  KickUser;
end;

procedure Tfrm_main.mi_controle_armazenagemClick(Sender: TObject);
begin
  UserUp;
  Application.CreateForm(TfrmArmazenagem, frmArmazenagem);
  frmArmazenagem.ShowModal;
  KickUser;
end;

procedure Tfrm_main.mi_controle_viagemClick(Sender: TObject);
begin
  Application.CreateForm(TfrmControleViagem,frmControleViagem);
  frmControleViagem.ShowModal;
end;

procedure Tfrm_main.mi_fat_emi_nf_fat_novaClick(Sender: TObject);
begin
  UserUp;
  ReiniciaCloser;
  if not VerIntegridade then Exit;
  vStr_cd_modulo := '11';
  str_cd_rotina := '1150';
  str_cd_mod := vStr_cd_modulo;
  str_cd_rot := str_cd_rotina;
  Application.CreateForm(Tfrm_sel_fat, frm_sel_fat);
  frm_sel_fat.PreviewFatura := False;
  frm_sel_fat.tp_tipo_fat := 'W';
  frm_sel_fat.ShowModal;
  KickUser;
end;

procedure Tfrm_main.mi_fin_rel_rec_liqClick(Sender: TObject);
begin
  UserUp;
  ReiniciaCloser;
  if not VerIntegridade then Exit;
  vStr_cd_modulo := '12';
  str_cd_rotina := '1211';
  str_cd_mod := vStr_cd_modulo;
  str_cd_rot := str_cd_rotina;
  Application.CreateForm(Tfrm_sel_unid_prod_fin, frm_sel_unid_prod_fin);
  frm_sel_unid_prod_fin.tp_rel := 3;
  frm_sel_unid_prod_fin.ShowModal;
  KickUser;
end;

procedure Tfrm_main.integracaoplanBASFClick(Sender: TObject);
begin
  UserUp;
  ReiniciaCloser;
  if not VerIntegridade then Exit;
  vStr_cd_modulo := '24';
  str_cd_rotina := '2428';
  str_cd_mod := vStr_cd_modulo;
  str_cd_rot := str_cd_rotina;
  Application.CreateForm(TfrmPedidosAbertosBASF, frmPedidosAbertosBASF);
  frmPedidosAbertosBASF.ShowModal;
  KickUser;
end;

procedure Tfrm_main.mniPaletizacaoClick(Sender: TObject);
begin
  UserUp;
  ReiniciaCloser;
  if not VerIntegridade then Exit;
  vStr_cd_modulo := '20';
  str_cd_rotina := '2019';
  str_cd_mod := vStr_cd_modulo;
  str_cd_rot := str_cd_rotina;
  Application.CreateForm(TfrmPaletizacao, frmPaletizacao);
  frmPaletizacao.ShowModal;
  KickUser;
end;

procedure Tfrm_main.mi_sda_despClick(Sender: TObject);
begin
  // alterar modulo/rotina
  UserUp;
  ReiniciaCloser;
  if not VerIntegridade then Exit;
  vStr_cd_modulo := '09';
  str_cd_rotina := '0906';
  str_cd_mod := vStr_cd_modulo;
  str_cd_rot := str_cd_rotina;
  Application.CreateForm(Tfrm_sel_relat, frm_sel_relat);
  frm_sel_relat.tp_rel := 11;
  frm_sel_relat.ShowModal;
  KickUser;
end;

procedure Tfrm_main.mi_pagto_conf_recibosClick(Sender: TObject);
begin
  UserUp;
  ReiniciaCloser;
  if not VerIntegridade then Exit;
  vStr_cd_modulo := '26';
  str_cd_rotina := '2616';
  str_cd_mod := vStr_cd_modulo;
  str_cd_rot := str_cd_rotina;
  Application.CreateForm(TfrmControleRecibo, frmControleRecibo);
  frmControleRecibo.ShowModal;
  KickUser;
end;

procedure Tfrm_main.img2Click(Sender: TObject);
begin
  Close;
end;

procedure Tfrm_main.FluxodeCaixaOperacional1Click(Sender: TObject);
begin
  UserUp;
  ReiniciaCloser;
  if not VerIntegridade then Exit;
  vStr_cd_modulo := '12';
  str_cd_rotina := '1223';
  str_cd_mod := vStr_cd_modulo;
  str_cd_rot := str_cd_rotina;
  Application.CreateForm(Tfrm_sel_unid_prod_fin, frm_sel_unid_prod_fin);
  frm_sel_unid_prod_fin.tp_rel := 4;
  frm_sel_unid_prod_fin.ShowModal;
  KickUser;
end;

procedure Tfrm_main.mi_fin_saldo_cliClick(Sender: TObject);
begin
  UserUp;
  ReiniciaCloser;
  if not VerIntegridade then Exit;
  vStr_cd_modulo := '12';
  str_cd_rotina := '1225';
  str_cd_mod := vStr_cd_modulo;
  str_cd_rot := str_cd_rotina;
  Application.CreateForm(Tfrm_sel_unid_prod, frm_sel_unid_prod);
  frm_sel_unid_prod.tp_rel := 34;
  frm_sel_unid_prod.ComPeriodo := False;
  frm_sel_unid_prod.ShowModal;
  KickUser;
end;

procedure Tfrm_main.miPaletizacaoClick(Sender: TObject);
begin
  UserUp;
  ReiniciaCloser;
  if not VerIntegridade then Exit;
  vStr_cd_modulo := '20';
  str_cd_rotina := '2021';
  str_cd_mod := vStr_cd_modulo;
  str_cd_rot := str_cd_rotina;
  Application.CreateForm(TfrmPackingList, frmPackingList);
  frmPackingList.ShowModal;
  KickUser;
end;

procedure Tfrm_main.mi_ddeClick(Sender: TObject);
begin
  UserUp;
  ReiniciaCloser;
  if not VerIntegridade then Exit;
  vStr_cd_modulo := '20';
  str_cd_rotina := '2022';
  str_cd_mod := vStr_cd_modulo;
  str_cd_rot := str_cd_rotina;
  Application.CreateForm(Tdatm_dde, datm_dde);
  Application.CreateForm(Tfrm_dde, frm_dde);
  frm_dde.ShowModal;
  KickUser;
end;

procedure Tfrm_main.mi_dde_novoClick(Sender: TObject);
begin
UserUp;
  ReiniciaCloser;
  if not VerIntegridade then Exit;
  vStr_cd_modulo := '20';
  str_cd_rotina := '2028';
  str_cd_mod := vStr_cd_modulo;
  str_cd_rot := str_cd_rotina;
  Application.CreateForm(Tdatm_dde_novo, datm_dde_novo);
  Application.CreateForm(Tfrm_dde_novo, frm_dde_novo);
  frm_dde_novo.ShowModal;
  KickUser;
end;

procedure Tfrm_main.mi_cad_config_statusClick(Sender: TObject);
begin
  UserUp;
  ReiniciaCloser;
  if not VerIntegridade then Exit;
  vStr_cd_modulo := '23';
  str_cd_rotina := '2314';
  str_cd_mod := vStr_cd_modulo;
  str_cd_rot := str_cd_rotina;
  Application.CreateForm(TfrmCadConfigStatus, frmCadConfigStatus);
  frmCadConfigStatus.ShowModal;
  KickUser;
end;

procedure Tfrm_main.miAcertaTxtClick(Sender: TObject);
begin
  UserUp;
  ReiniciaCloser;
  if not VerIntegridade then Exit;
  vStr_cd_modulo := '24';
  str_cd_rotina := '2453';
  str_cd_mod := vStr_cd_modulo;
  str_cd_rot := str_cd_rotina;
  Application.CreateForm(TfrmAcertaTxtNF, frmAcertaTxtNF);
  frmAcertaTxtNF.ShowModal;
  KickUser;
end;

procedure Tfrm_main.miDCAClick(Sender: TObject);
begin
  UserUp;
  ReiniciaCloser;
  if not VerIntegridade then Exit;
  vStr_cd_modulo := '20';
  str_cd_rotina := '2023';
  str_cd_mod := vStr_cd_modulo;
  str_cd_rot := str_cd_rotina;
  Application.CreateForm(TfrmDCA, frmDCA);
  frmDCA.ShowModal;
  KickUser;
end;

procedure Tfrm_main.miIntegraBASF85Click(Sender: TObject);
begin
  UserUp;
  ReiniciaCloser;
  if Not VerIntegridade then Exit;
  vStr_cd_modulo := '24';
  str_cd_rotina := '2424';
  Application.CreateForm(TFrmIntegraBASF85, FrmIntegraBASF85);
  FrmIntegraBASF85.ShowModal;
  KickUser;
end;

procedure Tfrm_main.miConsMantraClick(Sender: TObject);
begin
  UserUp;
  ReiniciaCloser;
  if not VerIntegridade then Exit;
  vStr_cd_modulo := '02';
  str_cd_rotina := '0214';
  str_cd_mod := vStr_cd_modulo;
  str_cd_rot := str_cd_rotina;
  Application.CreateForm(TfrmConsultaMantra, frmConsultaMantra);
  frmConsultaMantra.ShowModal;
  KickUser;
end;

procedure Tfrm_main.mniNFFatClick(Sender: TObject);
begin
  UserUp;
  ReiniciaCloser;
  if not VerIntegridade then Exit;
  vStr_cd_modulo := '11';
  str_cd_rotina := '1151';
  str_cd_mod := vStr_cd_modulo;
  str_cd_rot := str_cd_rotina;
  Application.CreateForm(Tfrm_nf_serv, frm_nf_serv);
  frm_nf_serv.btn_preview.Visible := false;
  frm_nf_serv.btn_imprimir.Visible := false;
  frm_nf_serv.btnPrev.Visible := true;
  frm_nf_serv.btnImp.Visible := true;
  frm_nf_serv.Caption := frm_nf_serv.Caption + '- NOVA';
  frm_nf_serv.ShowModal;
  KickUser;
end;

procedure Tfrm_main.miRelDetFaturaClick(Sender: TObject);
begin
  UserUp;
  ReiniciaCloser;
  if not VerIntegridade then Exit;
  vStr_cd_modulo := '11';
  str_cd_rotina := '1151';
  str_cd_mod := vStr_cd_modulo;
  str_cd_rot := str_cd_rotina;
  Application.CreateForm(Tfrm_sel_unid_cli_grupo_item, frm_sel_unid_cli_grupo_item);
  frm_sel_unid_cli_grupo_item.tp_rel := 5;
  frm_sel_unid_cli_grupo_item.ComPeriodo := True;
  frm_sel_unid_cli_grupo_item.ShowModal;
  KickUser;
  (* Application.CreateForm(Tfrm_sel_unid_cli, frm_sel_unid_cli);
  frm_sel_unid_cli.tp_rel := 12;
  frm_sel_unid_cli.ComPeriodo := True;
  frm_sel_unid_cli.ShowModal; *)
end;

procedure Tfrm_main.mniContCambioClick(Sender: TObject);
begin
  UserUp;
  ReiniciaCloser;
  if not VerIntegridade then Exit;
  vStr_cd_modulo := '20';
  str_cd_rotina := '2020';
  str_cd_mod := vStr_cd_modulo;
  str_cd_rot := str_cd_rotina;
  Application.CreateForm(TfrmContCambio, frmContCambio);
  frmContCambio.ShowModal;
  KickUser;
end;

procedure Tfrm_main.btn_suporteClick(Sender: TObject);
var
  Arquivo, vUouM, vManager: string;
begin
  SendMessage(FindWindow('MyHelpDesk', nil), WM_CLOSE, 0, 0);
  Application.ProcessMessages;
  if ConsultaLookUPSQL('SELECT isnull (CD_CHEFIA, 0) CD_CHEFIA FROM TUSUARIO WHERE CD_USUARIO = "' + str_cd_usuario + '" ', 'CD_CHEFIA' ) = '0' then
  begin
    Application.MessageBox('Você não possui acesso para este módulo', 'MyIndaiá', MB_OK + MB_ICONERROR);
    exit;
  end
  else
  begin
    UserUp;
    ReiniciaCloser;
    vManager := ConsultaLookUPSQL('SELECT C.IN_MANAGER FROM TCARGO C, TUSUARIO U WHERE C.CD_CARGO = U.CD_CARGO AND U.CD_USUARIO = "' + str_cd_usuario + '" ', 'IN_MANAGER' );
    if vManager = '1' then
    begin
      if FindWindow('MyHelpDesk', nil) > 0 then
      begin
        Application.MessageBox('O seu myHelpDesk for Manager já está funcionando ao lado do relógio do Windows.', 'MyIndaiá', MB_OK + MB_ICONERROR);
        exit;
      end else
        vUouM := 'M';
    end else
      vUouM := 'U';
    Arquivo := 'C:\DDBROKER\MyHelpDesk.exe ' + str_cd_usuario + ' ' + VUouM;
    WinExec(PChar(Arquivo), SW_SHOW);
    KickUser;
  end;
end;

procedure Tfrm_main.NovoControledePISCofinsIRRF1Click(Sender: TObject);
begin
  UserUp;
  ReiniciaCloser;
  if not VerIntegridade then Exit;
    vStr_cd_modulo := '11';
    str_cd_rotina := '1152';
    str_cd_mod := vStr_cd_modulo;
    str_cd_rot := str_cd_rotina;
    Application.CreateForm(TFrmControleRetencao, FrmControleRetencao);
    FrmControleRetencao.ShowModal;
    KickUser;
end;

procedure Tfrm_main.mi_Instrucao_desembClick(Sender: TObject);
begin
  UserUp;
  ReiniciaCloser;
  if not VerIntegridade then
    Exit;
  vStr_cd_modulo := '18';
  str_cd_rotina := '1834';
  str_cd_mod := vStr_cd_modulo;
  str_cd_rot := str_cd_rotina;
  Application.CreateForm(TFrm_InstrucaoDesembaraco, Frm_InstrucaoDesembaraco);
  Frm_InstrucaoDesembaraco.ShowModal;
  VerAtalho;
  KickUser;
end;

procedure Tfrm_main.FaturamentosConsolidados1Click(Sender: TObject);
begin
  UserUp;
  ReiniciaCloser;
  if not VerIntegridade then Exit;
  vStr_cd_modulo := '11';
  str_cd_rotina := '1153';
  str_cd_mod := vStr_cd_modulo;
  str_cd_rot := str_cd_rotina;
  Application.CreateForm(Tfrm_sel_unid_prod, frm_sel_unid_prod);
  frm_sel_unid_prod.tp_rel := 35;
  frm_sel_unid_prod.ComPeriodo := False;
  frm_sel_unid_prod.ShowModal;
  KickUser;
end;

procedure Tfrm_main.mi_rel_icms_suspensoClick(Sender: TObject);
begin
  UserUp;
  ReiniciaCloser;
  if Not VerIntegridade then Exit;
  vStr_cd_modulo := '15';
  str_cd_rotina := '1590';
  Application.CreateForm(TFrmRelProcessosCat63, FrmRelProcessosCat63);
  FrmRelProcessosCat63.CriaRelatorio('1');
  KickUser;
end;

procedure Tfrm_main.BtnCorrigirClick(Sender: TObject);
begin
  Application.CreateForm(TFrmConserta, FrmConserta);
  FrmConserta.ShowModal;
  FrmConserta.Release;
end;

procedure Tfrm_main.mnuRelacaodeRetrabalhosClick(Sender: TObject);
begin
  UserUp;
  ReiniciaCloser;
  if not VerIntegridade then Exit;
  vStr_cd_modulo := '15';
  str_cd_rotina := '1591';
  str_cd_mod := vStr_cd_modulo;
  str_cd_rot := str_cd_rotina;
  Application.CreateForm(TFrmRelRetrabalho, FrmRelRetrabalho);
  FrmRelRetrabalho.tp_rel := 1;
  FrmRelRetrabalho.ShowModal;
  KickUser;
end;

procedure Tfrm_main.mi_Gera_Arquivo_CrodaClick(Sender: TObject);
begin
  UserUp;
  ReiniciaCloser;
  if not VerIntegridade then Exit;
  vStr_cd_modulo := '24';
  str_cd_rotina := '2454';
  str_cd_mod := vStr_cd_modulo;
  str_cd_rot := str_cd_rotina;
  Application.CreateForm(TfrmArquivoCroda, frmArquivoCroda);
  frmArquivoCroda.ShowModal;
  KickUser;
end;

procedure Tfrm_main.Arquivos1Click(Sender: TObject);
{var
  I: Integer;
  DataModule: TComponent;
  Query: TQuery;
  S: String;
  Param: String;}
begin
  {if (Trim(str_cd_usuario) = '') or Assigned(frmDigitalizacao) then
    Exit;
  with datm_main do
  begin
    if qry_Forms.Active then
      qry_Forms.Close;
    I := 0;
    while I < Screen.FormCount do
    begin
      if qry_Forms.Active then
        qry_Forms.Close;
      if Screen.ActiveForm is TFrm_impressao then
        qry_Forms.ParamByName('NM_FORM').AsString := Screen.ActiveForm.Name
      else
        qry_Forms.ParamByName('NM_FORM').AsString := Screen.Forms[I].Name;
      qry_Forms.Open;
      if not qry_Forms.Eof then
        Break;
      Inc(I);
    end;

    if qry_Forms.Active and (qry_Forms.RecordCount > 0) then
    begin
      DataModule := Application.FindComponent(qry_FormsNM_DATA_MODULE.AsString);
      if Assigned(DataModule) then
      begin
        Query := TQuery(DataModule.FindComponent(qry_FormsNM_QUERY.AsString));
        if Assigned(Query) then
        begin
          if Assigned(Query.FieldByName(qry_FormsNM_CAMPO.AsString)) then
          begin
            S := Query.FieldByName(qry_FormsNM_CAMPO.AsString).AsString;
            if qry_FormsIN_PROCESSO.AsString = '1' then
              EnviaProcessoDigitalizacao(S)
            else if qry_FormsIN_PROCESSO.AsString = '2' then // Criado para Instrução de Desembaraço
              EnviaInstrucaoDigitalizacao(S)
            else
              EnviaOutrosDigitalizacao(qry_FormsID_TABELA.AsInteger, S);
          end; // Campo existe na query
        end; // Objeto do tipo Query existe
      end; // DataModule (ou Form) existe
    end; // Form encontrado na tabela
  end;}

  if FileLastModified('H:\DDBroker\myDigitalizacao\myIndaiaDigitalizacao.exe') > FileLastModified('C:\DDBROKER\myIndaiaDigitalizacao.exe') then
    CopyFile('H:\DDBroker\myDigitalizacao\myIndaiaDigitalizacao.exe', 'C:\DDBROKER\myIndaiaDigitalizacao.exe', False);

  if vInDigitalizacao then
    Exit;
  vInDigitalizacao := True;
  if FileLastModified('H:\DDBroker\myDigitalizacao\myIndaiaDigitalizacao.exe') > FileLastModified('C:\DDBROKER\myIndaiaDigitalizacao.exe') then
    CopyFile('H:\DDBroker\myDigitalizacao\myIndaiaDigitalizacao.exe', 'C:\DDBROKER\myIndaiaDigitalizacao.exe', False);

  while (GetKeyState(VK_CONTROL) < 0) or (GetKeyState(VK_F1) < 0) do
  begin
    Sleep(100);
    Application.ProcessMessages;
  end;
  with datm_main.GetReferenciaDigitalizacao do
    if Processo <> '' then
      EnviaProcessoDigitalizacao(Processo)
    else if Instrucao <> '' then
      EnviaInstrucaoDigitalizacao(Instrucao)
    else if Pedido.Referencia <> '' then
      EnviaPedidoDigitalizacao(Pedido.Unidade, Pedido.Produto, Pedido.Cliente, Pedido.Referencia)
    else if OutraReferencia.Tabela > 0 then
      EnviaOutrosDigitalizacao(OutraReferencia.Tabela, OutraReferencia.Referencia)
    else
      AbrirDigitalizacao;
  vInDigitalizacao := False;

  {try
    Application.CreateForm(TfrmDigitalizacao, frmDigitalizacao);
    frmDigitalizacao.ShowModal;
    frmDigitalizacao.Release;
    FreeAndNil(frmDigitalizacao);
  except
    // Em caso de erro, procurar pela janela e destrui-la - Michel - 15/06/2010
    I := 0;
    while (I < Application.ComponentCount) and (not (Application.Components[I] is TfrmDigitalizacao)) do
      Inc(I);
    if (I < Application.ComponentCount) then
    begin
      Application.Components[I].Free;
      frmDigitalizacao := nil;
    end;
  end;}
end;

procedure Tfrm_main.miDeclaracoesFIESPClick(Sender: TObject);
begin
  UserUp;
  ReiniciaCloser;
  if not VerIntegridade then Exit;
  vStr_cd_modulo := '22';
  str_cd_rotina := '2296';
  str_cd_mod := vStr_cd_modulo;
  str_cd_rot := str_cd_rotina;
  Application.CreateForm(Tfrm_declaracoes_fiesp, frm_declaracoes_fiesp);
  frm_declaracoes_fiesp.ShowModal;
  KickUser;
end;

procedure Tfrm_main.miCertificadodeOrigemFIESPClick(Sender: TObject);
begin
  UserUp;
  ReiniciaCloser;
  if not VerIntegridade then Exit;
  vStr_cd_modulo := '20';
  str_cd_rotina := '2026';
  str_cd_mod := vStr_cd_modulo;
  str_cd_rot := str_cd_rotina;
  Application.CreateForm(Tfrm_Sistema_Cool, frm_sistema_cool);
  frm_sistema_cool.ShowModal;
  KickUser;  
end;

procedure Tfrm_main.mi_rel_LinhaAzulClick(Sender: TObject);
begin
  UserUp;
  ReiniciaCloser;
  if not VerIntegridade then Exit;
  vStr_cd_modulo := '15';
  str_cd_rotina := '1592';
  str_cd_mod := vStr_cd_modulo;
  str_cd_rot := str_cd_rotina;
  Application.CreateForm(TFrmRelRetrabalho, FrmRelRetrabalho);
  FrmRelRetrabalho.tp_rel := 2;
  FrmRelRetrabalho.ShowModal;
  KickUser;
end;

procedure Tfrm_main.mi_out_nfClick(Sender: TObject);
var Arquivo: string;
begin
  UserUp;
  ReiniciaCloser;
  if not VerIntegridade then Exit;
  vStr_cd_modulo := '24';
  str_cd_rotina := '2494';
  str_cd_mod := vStr_cd_modulo;
  str_cd_rot := str_cd_rotina;
  Arquivo := cDir_Rpt + '\NFEXPORT.EXE ' + str_ap_usuario + ' ' + str_senha_usuario + ' ' + str_cd_unid_neg;
  WinExec(PChar(Arquivo), SW_SHOW);
  KickUser;
end;

procedure Tfrm_main.mi_Gera_txt_BasfClick(Sender: TObject);
var Arquivo: string;
begin
  UserUp;
  ReiniciaCloser;
  if not VerIntegridade then Exit;
  vStr_cd_modulo := '24';
  str_cd_rotina := '2455';
  str_cd_mod := vStr_cd_modulo;
  str_cd_rot := str_cd_rotina;
  Application.CreateForm(Tfrm_integra_nota_basf, frm_integra_nota_basf);
  frm_integra_nota_basf.ShowModal;
  KickUser;
end;

procedure Tfrm_main.mi_fin_rel_valores_recebClick(Sender: TObject);
begin
  UserUp;
  ReiniciaCloser;
  if not VerIntegridade then Exit;
  vStr_cd_modulo := '12';
  str_cd_rotina := '1226';
  str_cd_mod := vStr_cd_modulo;
  str_cd_rot := str_cd_rotina;
  Application.CreateForm(Tfrm_sel_unid_prod_fin, frm_sel_unid_prod_fin);
  frm_sel_unid_prod_fin.tp_rel := 5;
  frm_sel_unid_prod_fin.ShowModal;
  KickUser;
end;

procedure Tfrm_main.tmrTwitterTimer(Sender: TObject);
var
  FA: TDateTime;
  vIni: TIniFile;
begin
  if FileExists(vXMLTwitter) then
  begin
    FA := FileDateToDateTime(FileAge(vXMLTwitter));
    if FileExists(vHTMLTwitter) and (FA > FDataLeituraTwitter) then
    begin
      wbMyTwitter.Navigate(vHTMLTwitter);
      vScriptTwitter := ' tblPrincipal.style.borderColor = "aqua";' +
                        ' tblPrincipal.style.borderWidth = "3";';
      FDataLeituraTwitter := FA;
      vIni := TIniFile.Create(ExtractFilePath(Application.ExeName) + 'CONFIG.INI');
      vIni.WriteDateTime('TWITTER', 'ULTIMA_LEITURA', Now); // Grava a data da atual - Michel - 19/08/2009
      vIni.Free;
    end;
  end;
end;

procedure Tfrm_main.mi_rel_BBPagClick(Sender: TObject);
begin
  UserUp;
  ReiniciaCloser;
  if not VerIntegridade then Exit;
  vStr_cd_modulo := '15';
  str_cd_rotina := '1594';
  str_cd_mod := vStr_cd_modulo;
  str_cd_rot := str_cd_rotina;
  Application.CreateForm(Tfrm_RelBBPag, frm_RelBBPag);
  frm_RelBBPag.ShowModal;
  KickUser;
end;

procedure Tfrm_main.mi_rel_valores_pendClick(Sender: TObject);
begin
  UserUp;
  ReiniciaCloser;
  if not VerIntegridade then Exit;
  vStr_cd_modulo := '14';
  str_cd_rotina := '1406';
  str_cd_mod := vStr_cd_modulo;
  str_cd_rot := str_cd_rotina;
  Application.CreateForm(Tfrm_sel_unid_prod, frm_sel_unid_prod);
  frm_sel_unid_prod.tp_rel := 36;
  frm_sel_unid_prod.ComPeriodo := False;
  frm_sel_unid_prod.ShowModal;
  KickUser;
end;

procedure Tfrm_main.wbMyTwitterDocumentComplete(Sender: TObject;
  const pDisp: IDispatch; var URL: OleVariant);

  procedure ExecutaScript(AScript, ALinguagem: String);
  var
    Doc: IHTMLDocument2;
  begin
    if wbMyTwitter.Document = nil then Exit;
    AScript := Trim(AScript);
    if AScript <> '' then
    begin
      Doc := wbMyTwitter.Document as IHTMLDocument2;
      Doc.parentWindow.execScript(AScript, ALinguagem);
    end;
  end;
begin
  if vScriptTwitter <> '' then
    ExecutaScript(vScriptTwitter, 'javascript');
end;

procedure Tfrm_main.mi_fin_rel_ref_basfClick(Sender: TObject);
begin
  UserUp;
  ReiniciaCloser;
  if not VerIntegridade then Exit;
  vStr_cd_modulo := '12';
  str_cd_rotina := '1227';
  str_cd_mod := vStr_cd_modulo;
  str_cd_rot := str_cd_rotina;
  Application.CreateForm(Tfrm_sel_unid_prod_fin, frm_sel_unid_prod_fin);
  frm_sel_unid_prod_fin.tp_rel := 6;
  frm_sel_unid_prod_fin.ShowModal;
  KickUser;
end;

procedure Tfrm_main.appMainActivate(Sender: TObject);
var
  Login, Senha: String;
  I: Integer;
  BDEParams: TStringList;
begin
  if vLogado or not Assigned(datm_main) then // Se estiver logado não passa mais por aqui - Michel - 06/04/2011
    Exit;

  BDEParams := TStringList.Create;

  if not datm_main.db_broker.Connected then
    datm_main.db_broker.Open;
  datm_main.db_broker.Session.GetAliasParams('DBBROKER', BDEParams);

  if VersaoTeste then
  begin
    Panel1.Color := $008080FF;
    Panel5.Color := clRed;
    pnl1.Color := clRed;
    lblTesting.Visible := True;
    lblTestingSombra.Visible := True;
    tmrBlink.Enabled := True;
    ServidorEmUso := ServidorHomologacao;
  end
  else
  begin
    Panel1.Color := $00FBF7F7;
    Panel5.Color := $009B3737;
    pnl1.Color := $009B3737;
    tmrBlink.Enabled := False;
    lblTesting.Visible := False;
    lblTestingSombra.Visible := False;
    ServidorEmUso := ServidorProducao;
  end;
  if (not SameText(BDEParams.Values['SERVER NAME'], ServidorEmUso)) then
  begin
    BDEParams.Values['SERVER NAME'] := ServidorEmUso;
    datm_main.db_broker.Close;
    datm_main.db_broker.Session.ModifyAlias('BROKER', BDEParams);
  end;
  if datm_main.db_broker.Connected then
    datm_main.db_broker.Close;

  FreeAndNil(BDEParams);

  try
    if StartupSystem then
    begin
      Login := GetLoginName;
      Senha := GetPassword;
      if Login <> str_ap_usuario then
      begin
        str_ap_usuario                  := Login;
        str_senha_usuario               := Senha;
        frm_senha.edt_nome_usuario.Text := str_ap_usuario;
        frm_senha.edt_senha.Text        := str_senha_usuario;
        
        frm_senha.btn_Ok.Click;
      end;
    end
    else
      if Trim(str_cd_usuario) = '' then
      begin
        frm_senha.ShowModal;
        if Trim(str_cd_usuario) = '' then
          Close;
      end;
  finally
    TerminateSplash;
  end;
end;

procedure Tfrm_main.tmrFecharJanelasTimer(Sender: TObject);
var
  Comp: TComponent;
begin
  {if Screen.Forms[0] = Self then
  begin
    frmDesabilitarSistema.Fechar;
    tmrFecharJanelas.Enabled := False;
  end
  else
  begin
    // Desabilitar o botão salvar
    Comp := Screen.Forms[0].FindComponent('btn_salvar');
    if Comp = nil then
    Comp := Screen.Forms[0].FindComponent('btnsalvar');
    if Comp <> nil then
      TButton(Comp).Enabled := False;
    Screen.Forms[0].Close;
  end;}
end;

procedure Tfrm_main.miCadastrodeViagensClick(Sender: TObject);
begin
  UserUp;
  ReiniciaCloser;
  if not VerIntegridade then Exit;
  vStr_cd_modulo := '22';
  str_cd_rotina := '2297';
  str_cd_mod := vStr_cd_modulo;
  str_cd_rot := str_cd_rotina;
  Application.CreateForm(Tfrm_semaforico, frm_semaforico);
  frm_semaforico.ShowModal;
  KickUser;
end;

procedure Tfrm_main.Parceiros1Click(Sender: TObject);
begin
  UserUp;
  ReiniciaCloser;
  if not VerIntegridade then Exit;
  vStr_cd_modulo := '14';
  str_cd_rotina := '1406';
  str_cd_mod := vStr_cd_modulo;
  str_cd_rot := str_cd_rotina;
  Application.CreateForm(Tfrm_sel_relat, frm_sel_relat);
  frm_sel_relat.tp_rel := 37;
  frm_sel_relat.ShowModal;
  KickUser;
end;

procedure Tfrm_main.dbg_pendencia_menuDblClick(Sender: TObject);
var
  cd_analista : string;
begin
  with TQuery.Create(application) do
  begin
    Databasename := 'DBBROKER';
    SQL.Clear;
    if flag_analista <> '' Then
    begin
      if qryPendenciasMenuAtendenteNR_PROCESSO.AsString = 'X' then
      begin
        SQL.Add(' SELECT P.CD_ANALISTA_CLIENTE AS ANALISTA ');
        SQL.Add(' FROM TPROCESSO P (NOLOCK) ');
        SQL.Add(' WHERE P.NR_REFERENCIA = :NR_REFERENCIA');
        SQL.Add(' AND P.CD_CLIENTE      = :CD_EMPRESA');
        ParamByName('NR_REFERENCIA').AsString := qryPendenciasMenuAtendenteNR_REFERENCIA.AsString;
        ParamByName('CD_EMPRESA').AsString    := qryPendenciasMenuAtendenteCD_EMPRESA.AsString;
      end
      else
      begin
        SQL.Add('SELECT C.CD_USUARIO AS ANALISTA ');
        SQL.Add('FROM TPROCESSO P (NOLOCK) ');
        SQL.Add('INNER JOIN TCLIENTE_CONTATO C (NOLOCK)  ON C.CD_CONTATO = P.CD_CONTATO AND C.CD_CLIENTE = P.CD_CLIENTE ');
        SQL.Add('AND C.CD_PRODUTO = P.CD_PRODUTO AND C.CD_UNID_NEG = P.CD_UNID_NEG ');
        SQL.Add('WHERE P.NR_PROCESSO = :NR_PROCESSO');
        ParamByName('NR_PROCESSO').AsString   := qryPendenciasMenuAtendenteNR_PROCESSO.AsString;
      end;
    end
    else
    begin
      if qryPendenciasMenuNR_PROCESSO.AsString = 'X' then
      begin
        SQL.Add(' SELECT P.CD_ANALISTA_CLIENTE AS ANALISTA ');
        SQL.Add(' FROM TPROCESSO P (NOLOCK) ');
        SQL.Add(' WHERE P.NR_REFERENCIA = :NR_REFERENCIA');
        SQL.Add(' AND P.CD_CLIENTE      = :CD_EMPRESA');
        ParamByName('NR_REFERENCIA').AsString := qryPendenciasMenuNR_REFERENCIA.AsString;
        ParamByName('CD_EMPRESA').AsString    := qryPendenciasMenuCD_EMPRESA.AsString;
      end
      else
      begin
        SQL.Add('SELECT C.CD_USUARIO AS ANALISTA ');
        SQL.Add('FROM TPROCESSO P (NOLOCK) ');
        SQL.Add('INNER JOIN TCLIENTE_CONTATO C  (NOLOCK) ON C.CD_CONTATO = P.CD_CONTATO AND C.CD_CLIENTE = P.CD_CLIENTE ');
        SQL.Add('AND C.CD_PRODUTO = P.CD_PRODUTO AND C.CD_UNID_NEG = P.CD_UNID_NEG ');
        SQL.Add('WHERE P.NR_PROCESSO = :NR_PROCESSO');
        ParamByName('NR_PROCESSO').AsString   := qryPendenciasMenuNR_PROCESSO.AsString;
      end;
    end;
    Open;
    cd_analista := FieldByName('ANALISTA').AsString;
    Close;
  end;
  if cd_analista <> '' then
  begin
    Application.CreateForm(Tfrm_pendencias, frm_pendencias);
    frm_pendencias.tp_origem := 1;
    if flag_analista <> '' Then
      frm_pendencias.tp_usuario := 1
    else
      frm_pendencias.tp_usuario := 2;
    frm_pendencias.ShowModal;
  end
  else
    ShowMessage('ATENÇÃO: Preencha o campo CONTATO com um usuário cadastrado no sistema myIndaiáWeb!');
end;

procedure Tfrm_main.dbg_pendencia_menuDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
begin
  {
   if flag_analista <> '' then
   begin
   if (TStringGrid(dbg_pendencia_menu).RowCount-1)<= qryPendenciasMenuAtendente.RecordCount then //Se tiver menos de 10 linha
      ShowScrollBar(dbg_pendencia_menu.Handle,SB_VERT,False)
   else
      ShowScrollBar(dbg_pendencia_menu.Handle,SB_VERT,True);
   end
   else
   begin
   if (TStringGrid(dbg_pendencia_menu).RowCount-1)<= qryPendenciasMenu.RecordCount then //Se tiver menos de 10 linha
      ShowScrollBar(dbg_pendencia_menu.Handle,SB_VERT,False)
   else
      ShowScrollBar(dbg_pendencia_menu.Handle,SB_VERT,True);
   end;
   }
end;

function Tfrm_main.TempoDecorridoExtenso(Minuto:Integer):String;
var
  int_dif_min:Integer;
  int_dif_hor:Integer;
  int_dif_dia:Integer;
  str_dif_tempo:String;
begin
  if Minuto >= 1 then
    int_dif_min := Minuto
  else
    int_dif_min := 1;
  int_dif_hor := 0;
  int_dif_dia := 0;

  if int_dif_min = 1440 then
  begin
     int_dif_dia := 1;
     int_dif_min := 0;
  end
  else
  begin
    //se for maior que 1 dia
    if int_dif_min > 1440 then
    begin
      int_dif_dia :=  int_dif_min div 1440;
      int_dif_min :=  int_dif_min mod 1440;
      if int_dif_min = 60 then
      begin
         int_dif_hor := 1;
         int_dif_min := 0;
      end
      else
      begin
        // se for maior que 1 hora
        if int_dif_min > 60 then
        begin
           int_dif_hor := int_dif_min div 60;
           int_dif_min := int_dif_min mod 60;
        end;
      end;
    end
    else
    begin
      // se for menor que 1 dia
      if int_dif_min = 60 then
      begin
         int_dif_hor := 1;
         int_dif_min := 0;
      end
      else
      begin
        // se for maior que 1 hora
        if int_dif_min > 60 then
        begin
           int_dif_hor := int_dif_min div 60;
           int_dif_min := int_dif_min mod 60;
        end;
      end;
    end;
  end;
  str_dif_tempo := '';
  if int_dif_dia > 0 then
    str_dif_tempo := str_dif_tempo + IntToStr(int_dif_dia) + ' dia(s) ';
  if int_dif_hor > 0 then
    str_dif_tempo := str_dif_tempo + IntToStr(int_dif_hor) + ' hora(s) ';
  if int_dif_min > 0 then
    str_dif_tempo := str_dif_tempo + IntToStr(int_dif_min) + ' minuto(s) ';
  Result := str_dif_tempo;
end;

procedure Tfrm_main.qryPendenciasMenuCalcFields(DataSet: TDataSet);
begin
  if (qryPendenciasMenuDIFERENCA.AsInteger > 0) and (qryPendenciasMenuCD_STATUS.AsString <> '4') then
    qryPendenciasMenuCALC_DIF_TEMPO.AsString := TempoDecorridoExtenso(qryPendenciasMenuDIFERENCA.AsInteger)
  else
    qryPendenciasMenuCALC_DIF_TEMPO.AsString := ' - ';

  if qryPendenciasMenuDIFERENCA2.AsInteger > 0 then
    qryPendenciasMenuCALC_DIF_TEMPO2.AsString := TempoDecorridoExtenso(qryPendenciasMenuDIFERENCA2.AsInteger)
  else
    qryPendenciasMenuCALC_DIF_TEMPO2.AsString := ' - ';
end;

procedure Tfrm_main.qryPendenciasMenuAtendenteCalcFields(
  DataSet: TDataSet);
begin
  if (qryPendenciasMenuAtendenteDIFERENCA.AsInteger > 0) and (qryPendenciasMenuAtendenteCD_STATUS.AsString <> '4') then
    qryPendenciasMenuAtendenteCALC_DIF_TEMPO.AsString := TempoDecorridoExtenso(qryPendenciasMenuAtendenteDIFERENCA.AsInteger)
  else
    qryPendenciasMenuAtendenteCALC_DIF_TEMPO.AsString := ' - ';

  if qryPendenciasMenuAtendenteDIFERENCA2.AsInteger > 0 then
    qryPendenciasMenuAtendenteCALC_DIF_TEMPO2.AsString := TempoDecorridoExtenso(qryPendenciasMenuAtendenteDIFERENCA2.AsInteger)
  else
    qryPendenciasMenuAtendenteCALC_DIF_TEMPO2.AsString := ' - ';
end;

procedure Tfrm_main.chb_solicitadasClick(Sender: TObject);
begin
  edt_processo.Clear;
  if not chb_solicitadas.Checked then
  begin
    if not chb_finalizadas.Checked then
    begin
      if (dte_dt_inicial.Text <> '') and (dte_dt_final.Text <> '') then
      begin
        if flag_analista <> '' then
        begin
          qryPendenciasMenuAtendente.Close;
          qryPendenciasMenuAtendente.SQL[14]:= ' AND PP.CD_STATUS NOT IN  (''5'',''1'',''2'',''4'')) ' +
                                               ' AND DT_RESPOSTA_SOLICITA BETWEEN CONVERT(DATETIME,''' + dte_dt_inicial.Text + ' ' + tme_dt_inicial.Text + ''',103) AND ' +
                                               ' CONVERT(DATETIME,''' + dte_dt_final.Text + ' ' + tme_dt_final.Text + ''',103)' ;
          qryPendenciasMenuAtendente.Open;
        end
        else
        begin
          qryPendenciasMenu.Close;
          qryPendenciasMenu.SQL[7]:= ' AND PP.CD_STATUS NOT IN  (''5'',''1'',''2'',''4'')) ' +
                                     ' AND DT_RESPOSTA_SOLICITA BETWEEN CONVERT(DATETIME,''' + dte_dt_inicial.Text + ' ' + tme_dt_inicial.Text + ''',103) AND ' +
                                     ' CONVERT(DATETIME,''' + dte_dt_final.Text + ' ' + tme_dt_final.Text + ''',103)' ;
          qryPendenciasMenu.Open;
        end;
      end
      else
      begin
        if flag_analista <> '' then
        begin
          qryPendenciasMenuAtendente.Close;
          qryPendenciasMenuAtendente.SQL[14]:= ' AND PP.CD_STATUS NOT IN  (''5'',''1'',''2'',''4''))';
          qryPendenciasMenuAtendente.Open;
        end
        else
        begin
          qryPendenciasMenu.Close;
          qryPendenciasMenu.SQL[7]:= ' AND PP.CD_STATUS NOT IN  (''5'',''1'',''2'',''4''))';
          qryPendenciasMenu.Open;
        end;
      end;
    end
    else
    begin
      if (dte_dt_inicial.Text <> '') and (dte_dt_final.Text <> '') then
      begin
        if flag_analista <> '' then
        begin
          qryPendenciasMenuAtendente.Close;
          qryPendenciasMenuAtendente.SQL[14]:= ' AND PP.CD_STATUS NOT IN  (''5'',''1'',''2''))'+
                                               ' AND DT_FINALIZACAO BETWEEN CONVERT(DATETIME,''' + dte_dt_inicial.Text + ' ' + tme_dt_inicial.Text + ''',103) AND ' +
                                               ' CONVERT(DATETIME,''' + dte_dt_final.Text + ' ' + tme_dt_final.Text + ''',103)' ;
          qryPendenciasMenuAtendente.Open;
        end
        else
        begin
          qryPendenciasMenu.Close;
          qryPendenciasMenu.SQL[7]:= ' AND PP.CD_STATUS NOT IN  (''5'',''1'',''2''))'+
                                     ' AND DT_FINALIZACAO BETWEEN CONVERT(DATETIME,''' + dte_dt_inicial.Text + ' ' + tme_dt_inicial.Text + ''',103) AND ' +
                                     ' CONVERT(DATETIME,''' + dte_dt_final.Text + ' ' + tme_dt_final.Text + ''',103)' ;
          qryPendenciasMenu.Open;
        end;
      end
      else
      begin
        if flag_analista <> '' then
        begin
          qryPendenciasMenuAtendente.Close;
          qryPendenciasMenuAtendente.SQL[14]:= ' AND PP.CD_STATUS NOT IN  (''5'',''1'',''2''))';
          qryPendenciasMenuAtendente.Open;
        end
        else
        begin
          qryPendenciasMenu.Close;
          qryPendenciasMenu.SQL[7]:= ' AND PP.CD_STATUS NOT IN  (''5'',''1'',''2''))';
          qryPendenciasMenu.Open;
        end;
      end;
    end;
  end
  else
  begin
    if not chb_finalizadas.Checked then
    begin
      if (dte_dt_inicial.Text <> '') and (dte_dt_final.Text <> '') then
      begin
        if flag_analista <> '' then
        begin
          qryPendenciasMenuAtendente.Close;
          qryPendenciasMenuAtendente.SQL[14]:= ' AND PP.CD_STATUS NOT IN  (''5'',''4''))'+
                                               ' AND (ISNULL(PP.DT_SOLICITACAO, PP.DT_PRIMEIRA_SOLICITACAO) BETWEEN CONVERT(DATETIME,''' + dte_dt_inicial.Text + ' ' + tme_dt_inicial.Text + ''',103) AND ' +
                                               ' CONVERT(DATETIME,''' + dte_dt_final.Text + ' ' + tme_dt_final.Text + ''',103)' +
                                               ' OR PP.DT_CRIACAO_PENDENCIA BETWEEN CONVERT(DATETIME,''' + dte_dt_inicial.Text + ' ' + tme_dt_inicial.Text + ''',103) AND ' +
                                               ' CONVERT(DATETIME,''' + dte_dt_final.Text + ' ' + tme_dt_final.Text + ''',103))';
          qryPendenciasMenuAtendente.Open;
        end
        else
        begin
          qryPendenciasMenu.Close;
          qryPendenciasMenu.SQL[7]:= ' AND PP.CD_STATUS NOT IN  (''5'',''4''))'+
                                     ' AND ISNULL(PP.DT_SOLICITACAO, PP.DT_PRIMEIRA_SOLICITACAO) BETWEEN CONVERT(DATETIME,''' + dte_dt_inicial.Text + ' ' + tme_dt_inicial.Text + ''',103) AND ' +
                                     ' CONVERT(DATETIME,''' + dte_dt_final.Text + ' ' + tme_dt_final.Text + ''',103)' +
                                     ' OR PP.DT_CRIACAO_PENDENCIA BETWEEN CONVERT(DATETIME,''' + dte_dt_inicial.Text + ' ' + tme_dt_inicial.Text + ''',103) AND ' +
                                     ' CONVERT(DATETIME,''' + dte_dt_final.Text + ' ' + tme_dt_final.Text + ''',103))';
          qryPendenciasMenu.Open;
        end;
      end
      else
      begin
        if flag_analista <> '' then
        begin
          qryPendenciasMenuAtendente.Close;
          qryPendenciasMenuAtendente.SQL[14]:= ' AND PP.CD_STATUS NOT IN  (''5'',''4''))';
          qryPendenciasMenuAtendente.Open;
        end
        else
        begin
          qryPendenciasMenu.Close;
          qryPendenciasMenu.SQL[7]:= ' AND PP.CD_STATUS NOT IN  (''5'',''4''))';
          qryPendenciasMenu.Open;
        end;
      end;
    end
    else
    begin
      if (dte_dt_inicial.Text <> '') and (dte_dt_final.Text <> '') then
      begin
        if flag_analista <> '' then
        begin
          qryPendenciasMenuAtendente.Close;
          qryPendenciasMenuAtendente.SQL[14]:= ' AND PP.CD_STATUS NOT IN  (''5''))' +
                                               ' AND (ISNULL(PP.DT_SOLICITACAO, PP.DT_PRIMEIRA_SOLICITACAO) BETWEEN CONVERT(DATETIME,''' + dte_dt_inicial.Text + ' ' + tme_dt_inicial.Text + ''',103) AND ' +
                                               ' CONVERT(DATETIME,''' + dte_dt_final.Text + ' ' + tme_dt_final.Text + ''',103)' +
                                               ' OR PP.DT_FINALIZACAO BETWEEN CONVERT(DATETIME,''' + dte_dt_inicial.Text + ' ' + tme_dt_inicial.Text + ''',103) AND ' +
                                               ' CONVERT(DATETIME,''' + dte_dt_final.Text + ' ' + tme_dt_final.Text + ''',103)'+
                                               ' OR PP.DT_CRIACAO_PENDENCIA BETWEEN CONVERT(DATETIME,''' + dte_dt_inicial.Text + ' ' + tme_dt_inicial.Text + ''',103) AND ' +
                                               ' CONVERT(DATETIME,''' + dte_dt_final.Text + ' ' + tme_dt_final.Text + ''',103))';
          qryPendenciasMenuAtendente.Open;
        end
        else
        begin
          qryPendenciasMenu.Close;
          qryPendenciasMenu.SQL[7]:= ' AND PP.CD_STATUS NOT IN  (''5''))' +
                                     ' AND (ISNULL(PP.DT_SOLICITACAO, PP.DT_PRIMEIRA_SOLICITACAO) BETWEEN CONVERT(DATETIME,''' + dte_dt_inicial.Text + ' ' + tme_dt_inicial.Text + ''',103) AND ' +
                                     ' CONVERT(DATETIME,''' + dte_dt_final.Text + ' ' + tme_dt_final.Text + ''',103)' +
                                     ' OR PP.DT_FINALIZACAO BETWEEN CONVERT(DATETIME,''' + dte_dt_inicial.Text + ' ' + tme_dt_inicial.Text + ''',103) AND ' +
                                     ' CONVERT(DATETIME,''' + dte_dt_final.Text + ' ' + tme_dt_final.Text + ''',103)'+
                                     ' OR PP.DT_CRIACAO_PENDENCIA BETWEEN CONVERT(DATETIME,''' + dte_dt_inicial.Text + ' ' + tme_dt_inicial.Text + ''',103) AND ' +
                                     ' CONVERT(DATETIME,''' + dte_dt_final.Text + ' ' + tme_dt_final.Text + ''',103))';
          qryPendenciasMenu.Open;
        end;
      end
      else
      begin
        if flag_analista <> '' then
        begin
          qryPendenciasMenuAtendente.Close;
          qryPendenciasMenuAtendente.SQL[14]:= ' AND PP.CD_STATUS NOT IN  (''5''))';
          qryPendenciasMenuAtendente.Open;
        end
        else
        begin
          qryPendenciasMenu.Close;
          qryPendenciasMenu.SQL[7]:= ' AND PP.CD_STATUS NOT IN  (''5''))';
          qryPendenciasMenu.Open;
        end;
      end;
    end;
  end;
end;

procedure Tfrm_main.edt_processoExit(Sender: TObject);
begin
  if edt_processo.Text <> '' Then
  begin
    if flag_analista <> '' then
    begin
      qryPendenciasMenuAtendente.Close;
      qryPendenciasMenuAtendente.SQL[14]:= ' AND PP.NR_PROCESSO LIKE ''%' + edt_processo.Text + ''') ';
      qryPendenciasMenuAtendente.Open;
    end
    else
    begin
      qryPendenciasMenu.Close;
      qryPendenciasMenu.SQL[7]:= ' AND PP.NR_PROCESSO LIKE ''%' + edt_processo.Text + ''') ';
      qryPendenciasMenu.Open;
    end;
  end
  else
  begin
  if flag_analista <> '' then
    begin
      qryPendenciasMenuAtendente.Close;
      qryPendenciasMenuAtendente.SQL[14] := ' AND PP.CD_STATUS NOT IN  (''5''))';
      qryPendenciasMenuAtendente.Open;
    end
    else
    begin
      qryPendenciasMenu.Close;
      qryPendenciasMenu.SQL[7] := ' AND PP.CD_STATUS NOT IN  (''5''))';
      qryPendenciasMenu.Open;
    end;
  end;
end;

procedure Tfrm_main.Panel9Click(Sender: TObject);
var
int_pendencia, qtde_atendente : Integer;
str_processo : String;
begin
    if not datm_main.db_broker_pendencias.Connected then
    begin
      datm_main.db_broker_pendencias.Connected := True;
    end;

    if flag_analista = '' then
    begin
        with TQuery.Create(application) do
        begin
          Databasename := 'DBBROKER';
          SQL.Clear;
          SQL.Add(' SELECT COUNT(CD_ATENDENTE) AS CONT_ATENDENTE FROM TCLIENTE_HABILITACAO (NOLOCK) WHERE CD_ATENDENTE = :CD_ATENDENTE');
          SQL.Add(' OR CD_ATENDENTE IN (SELECT CD_USUARIO FROM TUSUARIO (NOLOCK) WHERE CD_CHEFIA = :CD_ATENDENTE)');
          ParamByName('CD_ATENDENTE').AsString := str_cd_usuario;
          Open;
          qtde_atendente := FieldByName('CONT_ATENDENTE').asInteger;

          if qtde_atendente > 0 then
            flag_analista := str_cd_usuario;
          Close;
          Free;
        end;
    end;
    if flag_analista <> '' then
    begin
      dsPendenciasMenu.DataSet := qryPendenciasMenuAtendente;
      qryPendenciasMenuAtendente.Close;
      qryPendenciasMenuAtendente.ParamByName('CD_ATENDENTE').AsString := str_cd_usuario;
      qryPendenciasMenuAtendente.Open;
      qtde_pendencias :=  qryPendenciasMenuAtendente.RecordCount;
    end
    else
    begin
      dsPendenciasMenu.DataSet := qryPendenciasMenu;
      qryPendenciasMenu.Close;
      qryPendenciasMenu.ParamByName('CD_USUARIO_CRIADOR').AsString := str_cd_usuario;
      qryPendenciasMenu.Open;
      qtde_pendencias :=  qryPendenciasMenu.RecordCount;
    end;
    if qtde_pendencias > 0 then
    begin
      pnl_pendencias_principal_menu.Visible := True;
      pnl_pendencias_principal_menu.Width  := pnlMyTwitter.Left - pnl_pendencias_principal_menu.Left - 5 + 108;
      pnl_pendencias_principal_menu.Height := Panel4.Top - pnl_pendencias_principal_menu.Top - 6;
    end
    else
    begin
      pnl_pendencias_principal_menu.Visible := False;
      datm_main.db_broker_pendencias.Connected := False;
    end;
end;

procedure Tfrm_main.Image3Click(Sender: TObject);
begin
  pnl_pendencias_principal_menu.Visible := False;
  datm_main.db_broker_pendencias.Connected := False;
end;

procedure Tfrm_main.mi_cadastra_dicaClick(Sender: TObject);
begin
  UserUp;
  ReiniciaCloser;
  if not VerIntegridade then Exit;
  vstr_cd_modulo := '40';
  str_cd_rotina := '4001';
  str_cd_mod := vstr_cd_modulo;
  str_cd_rot := str_cd_rotina;
  Application.CreateForm(Tfrm_cadastro_sugestao, frm_cadastro_sugestao);
  frm_cadastro_sugestao.ShowModal;
  VerAtalho;
  KickUser;
end;

procedure Tfrm_main.PlanilhaRFUruguaiana1Click(Sender: TObject);
begin
  UserUp;
  ReiniciaCloser;
  if not VerIntegridade then Exit;
  vStr_cd_modulo := '15';
  str_cd_rotina := '1524';
  str_cd_mod := vStr_cd_modulo;
  str_cd_rot := str_cd_rotina;
  Application.CreateForm(Tfrm_sel_processo, frm_sel_processo);
  frm_sel_processo.str_cd_relatorio := '10';
  frm_sel_processo.ShowModal;
  KickUser;
end;

procedure Tfrm_main.miTransitTimeClick(Sender: TObject);
begin
  UserUp;
  ReiniciaCloser;
  if not VerIntegridade then Exit;
  vStr_cd_modulo := '22';
  str_cd_rotina := '2298';
  str_cd_mod := vStr_cd_modulo;
  str_cd_rot := str_cd_rotina;
  Application.CreateForm(Tfrm_transit_time, frm_transit_time);
  frm_transit_time.ShowModal;
  KickUser;
end;

procedure Tfrm_main.VerQuery1Click(Sender: TObject);
begin
  { by Carlos - 15/05/2011 - Tecla de Atalho - CTRL+ Y }
  frm_ver_query:=TFrm_ver_query.Create(nil);
  frm_ver_query.form_ativo:=screen.ActiveForm;
  frm_ver_query.showmodal;
  FreeAndNil(frm_ver_query);
end;

procedure Tfrm_main.mi_consulta_produtos_diClick(Sender: TObject);
begin
  UserUp;
  ReiniciaCloser;
  if not VerIntegridade then Exit;
  vStr_cd_modulo := '20';
  str_cd_rotina := '2027';
  str_cd_mod := vStr_cd_modulo;
  str_cd_rot := str_cd_rotina;
  Application.CreateForm(Tfrm_consulta_di_merc, frm_consulta_di_merc);
  frm_consulta_di_merc.ShowModal;
  KickUser;
end;

procedure Tfrm_main.miFatoresClick(Sender: TObject);
begin
  UserUp;
  ReiniciaCloser;
  if not VerIntegridade then Exit;
  vStr_cd_modulo := '23';
  str_cd_rotina := '2315';
  str_cd_mod := vStr_cd_modulo;
  str_cd_rot := str_cd_rotina;
  Application.CreateForm(TfrmFatores, frmFatores);
  frmFatores.ShowModal;
  KickUser;
end;

procedure Tfrm_main.miRobosClick(Sender: TObject);
begin
  UserUp;
  ReiniciaCloser;
  if not VerIntegridade then Exit;
  vStr_cd_modulo := '24';
  str_cd_rotina := '2429';
  str_cd_mod := vStr_cd_modulo;
  str_cd_rot := str_cd_rotina;
  Application.CreateForm(TfrmRobos, frmRobos);
  frmRobos.ShowModal;
  KickUser;
end;

procedure Tfrm_main.miLeadTimeClick(Sender: TObject);
begin
  UserUp;
  ReiniciaCloser;
  if not VerIntegridade then Exit;
  vStr_cd_modulo := '22';
  str_cd_rotina := '2298';
  str_cd_mod := vStr_cd_modulo;
  str_cd_rot := str_cd_rotina;
  Application.CreateForm(Tfrm_lead_time, frm_lead_time);
  frm_lead_time.ShowModal;
  KickUser;
end;

procedure Tfrm_main.miRelPagamentosAdministrativosClick(Sender: TObject);
begin
  UserUp;
  ReiniciaCloser;
  if not VerIntegridade then Exit;
  vStr_cd_modulo := '41';
  str_cd_rotina := '4101';
  str_cd_mod := vStr_cd_modulo;
  str_cd_rot := str_cd_rotina;
  Application.CreateForm(Tfrm_Rel_Pag_Adm, frm_Rel_Pag_Adm);
  frm_Rel_Pag_Adm.ShowModal;
  KickUser;
end;

procedure Tfrm_main.mi_int_gt_nexusClick(Sender: TObject);
begin
  UserUp;
  ReiniciaCloser;
  if not VerIntegridade then Exit;
  vStr_cd_modulo := '42';
  str_cd_rotina := '4201';
  str_cd_mod := vStr_cd_modulo;
  str_cd_rot := str_cd_rotina;
  Application.CreateForm(TfrmIntNexus, frmIntNexus);
  frmIntNexus.ShowModal;
  KickUser;
end;

procedure Tfrm_main.ObjectInspector1Click(Sender: TObject);
begin
  ShowObjectInspector;
end;

procedure Tfrm_main.miEtapaProdutoEventoClick(Sender: TObject);
begin
  UserUp;
  ReiniciaCloser;
  if not VerIntegridade then Exit;
  vStr_cd_modulo := '23';
  str_cd_rotina := '2316';
  str_cd_mod := vStr_cd_modulo;
  str_cd_rot := str_cd_rotina;
  Application.CreateForm(TfrmEtapaProdutoEvento, frmEtapaProdutoEvento);
  frmEtapaProdutoEvento.ShowModal;
  KickUser;
end;

procedure Tfrm_main.mi_int_fordClick(Sender: TObject);
begin
  UserUp;
  ReiniciaCloser;
  if not VerIntegridade then Exit;
  vStr_cd_modulo := '32';
  str_cd_rotina := '3203';
  str_cd_mod := vStr_cd_modulo;
  str_cd_rot := str_cd_rotina;
  Application.CreateForm(TfrmIntFORDExp, frmIntFORDExp);
  frmIntFORDExp.ShowModal;
  FreeAndNil(frmIntFORDExp);
  KickUser;
end;

procedure Tfrm_main.NFeSamsung1Click(Sender: TObject);
begin
  UserUp;
  ReiniciaCloser;
  if not VerIntegridade then Exit;
  vStr_cd_modulo := '24';
  str_cd_rotina := '2456';
  str_cd_mod := vStr_cd_modulo;
  str_cd_rot := str_cd_rotina;
  Application.CreateForm(TfrmNfeSamsung, frmNfeSamsung);
  frmNfeSamsung.ShowModal;
  FreeAndNil(frmNfeSamsung);
  KickUser;
end;

procedure Tfrm_main.mi_int_bid_nestClick(Sender: TObject);
begin
  UserUp;
  ReiniciaCloser;
  if not VerIntegridade then
  Exit;

  vStr_cd_modulo := '32';
  str_cd_rotina  := '3204';
  str_cd_mod     := vStr_cd_modulo;
  str_cd_rot     := str_cd_rotina;
  Application.CreateForm(TfrmBidNestle, frmBidNestle);
  frmBidNestle.ShowModal;
  FreeAndNil(frmBidNestle);
  KickUser;
end;

procedure Tfrm_main.mi_rel_exp_co_novoexClick(Sender: TObject);
begin
  UserUp;
  ReiniciaCloser;
  if not VerIntegridade then
   Exit;

  vStr_cd_modulo := '15';
  str_cd_rotina  := '1597';
  str_cd_mod     := vStr_cd_modulo;
  str_cd_rot     := str_cd_rotina;
  Application.CreateForm(Tfrm_co_novoex, frm_co_novoex);
  frm_co_novoex.ShowModal;
  FreeAndNil(frm_co_novoex);
  KickUser;
end;

procedure Tfrm_main.DANFEFesto1Click(Sender: TObject);
begin
  UserUp;
  ReiniciaCloser;
  if not VerIntegridade then
  Exit;

  vStr_cd_modulo := '24';
  str_cd_rotina  := '2457';
  str_cd_mod     := vStr_cd_modulo;
  str_cd_rot     := str_cd_rotina;

  Application.CreateForm(TfrmNfeFesto, frmNfeFesto);
  frmNfeFesto.ShowModal;
  FreeAndNil(frmNfeFesto);
  KickUser;
end;

procedure Tfrm_main.tmrBlinkTimer(Sender: TObject);
begin
  lblTesting.Visible       := not lblTesting.Visible;
  lblTestingSombra.Visible := lblTesting.Visible;

  if lblTesting.Visible then
  begin
    lblTesting.Tag := lblTesting.Tag +1;

    if lblTesting.Tag >= 10 then
      tmrBlink.Enabled := False;
  end;
end;

procedure Tfrm_main.miRelatorioBasicoClick(Sender: TObject);
begin
  UserUp;
  ReiniciaCloser;
  if not VerIntegridade then
  Exit;

  vStr_cd_modulo := '15';
  str_cd_rotina  := '1598';
  str_cd_mod     := vStr_cd_modulo;
  str_cd_rot     := str_cd_rotina;

  Application.CreateForm(TfrmRelatorioBasico, frmRelatorioBasico);
  frmRelatorioBasico.ShowModal;
  FreeAndNil(frmRelatorioBasico);
  KickUser;
end;

procedure Tfrm_main.NotasFiscaisdeEntrada1Click(Sender: TObject);
begin
  UserUp;
  ReiniciaCloser;
  if not VerIntegridade then
    Exit;

  vStr_cd_modulo := '15';
  str_cd_rotina  := '1598';
  str_cd_mod     := vStr_cd_modulo;
  str_cd_rot     := str_cd_rotina;
  TfrmIntegrcaoPoSystem.ExecutePOSystem;
  KickUser;
end;

procedure Tfrm_main.SEFAZ1Click(Sender: TObject);
begin
  UserUp;
  ReiniciaCloser;
  if not VerIntegridade then
    Exit;
  vStr_cd_modulo := '15';
  str_cd_rotina := '1598';
  str_cd_mod := vStr_cd_modulo;
  str_cd_rot := str_cd_rotina;
  TfrmIntegrcaoPoSystem.ExecuteSefaz;
  KickUser;
end;

procedure Tfrm_main.DIValoresporAdio1Click(Sender: TObject);
var
  Form: TfrmOiValorPorAdicao;
begin
  UserUp;
  ReiniciaCloser;
  if not VerIntegridade then
    Exit;
  Form := TfrmOiValorPorAdicao.Create(nil);
  try
    Form.ShowModal;
  finally
    Form.Free;
  end;
  KickUser;
end;

procedure Tfrm_main.ConsultaLI1Click(Sender: TObject);
begin
  TfmConsultaLI.Execute;
end;

procedure Tfrm_main.mniExigenciasInmetroClick(Sender: TObject);
begin
  Application.CreateForm(TfrmConsultaExigenciaInmetro, frmConsultaExigenciaInmetro);
  frmConsultaExigenciaInmetro.ShowModal;
end;

procedure Tfrm_main.DuplicarLI1Click(Sender: TObject);
begin
  TfrmDuplicaLI.Execute;
end;

procedure Tfrm_main.mi_CadUfIcmsOnlineClick(Sender: TObject);
begin
  Application.CreateForm(Tfrm_CadUfIcmsOnLine, frm_CadUfIcmsOnLine);
  frm_CadUfIcmsOnLine.ShowModal;
end;

procedure Tfrm_main.CargillTrimestralOperaes1Click(Sender: TObject);
var
  Form: TfrCargillTrimestralOperacoes;
begin
  Form := TfrCargillTrimestralOperacoes.Create(nil);
  try
    Form.ShowModal;
  finally
    Form.Free;
  end;
end;

procedure Tfrm_main.RelatriodeDespesasBASF1Click(Sender: TObject);
var
  Form: TfrmDespesasBASF;
begin
  Form := TfrmDespesasBASF.Create(nil);
  try
    Form.sEmpresa := 'Basf';
    Form.ShowModal;
  finally
    Form.Free;
  end;
end;

procedure Tfrm_main.Numerrios1Click(Sender: TObject);
var
  Form: TfrmNumerariosBASF;
begin
  Form := TfrmNumerariosBASF.Create(nil);
  try
    Form.sEmpresa := 'Basf';
    Form.ShowModal;
  finally
    Form.Free;
  end;
end;

procedure Tfrm_main.NumerriosnoFaturados1Click(Sender: TObject);
var
  Form: TfrmNumerariosNaoFaturados;
begin
  Form := TfrmNumerariosNaoFaturados.Create(nil);
  try
    Form.ShowModal;
  finally
    Form.Free;
  end;
end;

procedure Tfrm_main.Faturados1Click(Sender: TObject);
var
  Form: TfrmFaturadosNestle;
begin
  Form := TfrmFaturadosNestle.Create(nil);
  try
    Form.ShowModal;
  finally
    Form.Free;
  end;
end;

procedure Tfrm_main.PagamentosCriadosBoleto1Click(Sender: TObject);
var
  F: TFormConsultaPaqamentosWallet;
begin
  F := TFormConsultaPaqamentosWallet.Create(Application);
  try
    F.ShowModal;
  finally
    F.Free;
  end;
end;

function GetSQLPagamentosNaoFaturadosComNumerariosEmAberto: string;
begin
  Result :=
        '    SELECT DISTINCT                                                                                            ' + sLineBreak +
        '         CC.CUSTOMID                                    AS [Número Processo],                                  ' + sLineBreak +
        '         REF.CD_REFERENCIA                              AS [Outras Referências],                               ' + sLineBreak +
        '         G.NM_GRUPO                                     AS [Grupo],                                            ' + sLineBreak +
        '         CONVERT (VARCHAR(10),MIN(CR.RECEIVEDDATE),103) AS [Data Rec. Numerário],                              ' + sLineBreak +
        '         CR.CASHREQUESTTOTAL                            AS [Valor Total Solicitado],                           ' + sLineBreak +
        '         SUM(PREQ.PAYMENTTOTAL)                         AS [Total Despesas],                                   ' + sLineBreak +
        '    	   0 - SUM(PREQ.PAYMENTTOTAL)                      AS [Saldo]                                             ' + sLineBreak +
        '    FROM       MYINDAIAV2.DBO.PAYMENTREQUESTED PREQ                                                            ' + sLineBreak +
        '    LEFT JOIN  MYINDAIAV2.DBO.CUSTOMCLEARANCE  CC  (NOLOCK)  ON CC.ID= PREQ.CUSTOMCLEARANCE_ID                 ' + sLineBreak +
        '    LEFT JOIN  BROKER.DBO.TPROCESSO            PR  (NOLOCK)  ON PR.NR_PROCESSO = CC.CUSTOMID                   ' + sLineBreak +
        '    LEFT JOIN  BROKER.DBO.TGRUPO               G   (NOLOCK)  ON G.CD_GRUPO=PR.CD_GRUPO                         ' + sLineBreak +
        '    LEFT JOIN  BROKER.DBO.TREF_CLIENTE         REF (NOLOCK)  ON REF.NR_PROCESSO=PR.NR_PROCESSO                 ' + sLineBreak +
        '                                                            AND REF.TP_REFERENCIA=''04''                       ' + sLineBreak +
        '    LEFT JOIN  MYINDAIAV2.DBO.CASHREQUESTED    CR  (NOLOCK)  ON PREQ.CUSTOMCLEARANCE_ID=CR.CUSTOMCLEARANCE_ID  ' + sLineBreak +
        '    WHERE  PR.CD_GRUPO=''B77''                                                                                 ' + sLineBreak +
        '      AND  PREQ.BILLING_ID IS NULL                                                                             ' + sLineBreak +
        '      AND  PREQ.STATUS=''APPROVED''                                                                            ' + sLineBreak +
        '      AND  CR.STATUS=''OPEN''                                                                                  ' + sLineBreak +
        '                                                                                                               ' + sLineBreak +
        ' 	GROUP BY  CC.CUSTOMID,                                                                                      ' + sLineBreak +
        '              REF.CD_REFERENCIA,                                                                               ' + sLineBreak +
        '              G.NM_GRUPO,                                                                                      ' + sLineBreak +
        '              PREQ.CUSTOMCLEARANCE_ID,                                                                         ' + sLineBreak +
        '              CR.CUSTOMCLEARANCE_ID,CR.CASHREQUESTTOTAL                                                        ' + sLineBreak ;
end;

procedure Tfrm_main.Pagamentosnofaturadoscomnumerrioemaberto1Click(
  Sender: TObject);
var
  Form: TfmConsulta;
begin
  Form := TfmConsulta.Create(nil);
  try
    Form.TituloRelatorio := 'Pagamentos não Faturados com Numerário em Aberto';
    Form.qryMain.SQL.Text := GetSQLPagamentosNaoFaturadosComNumerariosEmAberto;
    Form.Executa;
  finally
    Form.Free;
  end;
end;

function GetSQLPagamentosNaoFaturadosSemNumerariosSolicitado: string;
begin
  Result :=
     '  SELECT DISTINCT                                                                                                      ' + sLineBreak +
     '             CC.CUSTOMID                                           AS [Nr. Processo],                                  ' + sLineBreak +
     '                  REF.CD_REFERENCIA                                AS [Outras Referências],                            ' + sLineBreak +
     '                  G.NM_GRUPO                                       AS [Grupo],                                         ' + sLineBreak +
     '                  CONVERT (VARCHAR(10), MIN(CR.RECEIVEDDATE), 103) AS [Data Recebimento Numerário],                    ' + sLineBreak +
     '                  SUM(CR.CASHREQUESTTOTAL)                         AS [Valor Total Solicitado],                        ' + sLineBreak +
     '                  SUM(PREQ.PAYMENTTOTAL)                           AS [Total Despesas],                                ' + sLineBreak +
     '                  0 - SUM(PREQ.PAYMENTTOTAL)                       AS [Saldo]                                          ' + sLineBreak +
     '  FROM   MYINDAIAV2.DBO.PAYMENTREQUESTED PREQ                                                                          ' + sLineBreak +
     '         LEFT JOIN MYINDAIAV2.DBO.CUSTOMCLEARANCE CC   (NOLOCK) ON CC.ID                   = PREQ.CUSTOMCLEARANCE_ID   ' + sLineBreak +
     '         LEFT JOIN BROKER.DBO.TPROCESSO           PR   (NOLOCK) ON PR.NR_PROCESSO          = CC.CUSTOMID               ' + sLineBreak +
     '         LEFT JOIN BROKER.DBO.TGRUPO              G    (NOLOCK) ON G.CD_GRUPO              = PR.CD_GRUPO               ' + sLineBreak +
     '         LEFT JOIN BROKER.DBO.TREF_CLIENTE        REF  (NOLOCK) ON REF.NR_PROCESSO         = PR.NR_PROCESSO            ' + sLineBreak +
     '                                                               AND REF.TP_REFERENCIA       = ''04''                    ' + sLineBreak +
     '         LEFT JOIN MYINDAIAV2.DBO.CASHREQUESTED   CR   (NOLOCK) ON PREQ.CUSTOMCLEARANCE_ID = CR.CUSTOMCLEARANCE_ID     ' + sLineBreak +
     '  WHERE  PR.CD_GRUPO = ''B77''                                                                                         ' + sLineBreak +
     '         AND PREQ.BILLING_ID IS NULL                                                                                   ' + sLineBreak +
     '         AND PREQ.STATUS = ''APPROVED''                                                                                ' + sLineBreak +
     '         AND CR.ID IS NULL                                                                                             ' + sLineBreak +
     '  GROUP  BY CC.CUSTOMID,                                                                                               ' + sLineBreak +
     '            REF.CD_REFERENCIA,                                                                                         ' + sLineBreak +
     '            G.NM_GRUPO,                                                                                                ' + sLineBreak +
     '            PREQ.CUSTOMCLEARANCE_ID,                                                                                   ' + sLineBreak +
     '            CR.CUSTOMCLEARANCE_ID                                                                                      ' + sLineBreak ;

end;

procedure Tfrm_main.PagamentosnoFaturadosesemNumerrioSolicitado1Click(
  Sender: TObject);
var
  Form: TfmConsulta;
begin
  Form := TfmConsulta.Create(nil);
  try
    Form.TituloRelatorio := 'Pagamentos não Faturados e sem Numerário Solicitado';
    Form.qryMain.SQL.Text := GetSQLPagamentosNaoFaturadosSemNumerariosSolicitado;
    Form.Executa;
  finally
    Form.Free;
  end;
end;

function GetSQLNumerariosNaoFaturados: string;
begin
  Result :=
    '  SELECT DISTINCT                                                                                           ' + sLineBreak +
    '        CC.CUSTOMID                                               AS [Nr. Processo],                        ' + sLineBreak +
    '        REF.CD_REFERENCIA                                         AS [Outras Referencias],                  ' + sLineBreak +
    '        G.NM_GRUPO                                                AS [Grupo],                               ' + sLineBreak +
// '   --     CONVERT (VARCHAR(10), MIN(CR.RECEIVEDDATE), 103)         AS DATA_RECEBIMENTO_NUMERARIO,            ' + sLineBreak +
    '        MIN(CR.RECEIVEDDATE)                                      AS [Data Recebimento Numerário],          ' + sLineBreak +
    '        SUM(CR.CASHREQUESTTOTAL)                                  AS [Valor Total Recebido],                ' + sLineBreak +
    '        (SELECT SUM(PAYMENTTOTAL)                                                                           ' + sLineBreak +
    '           FROM MYINDAIAV2.DBO.PAYMENTREQUESTED (NOLOCK)                                                    ' + sLineBreak +
    '          WHERE CUSTOMCLEARANCE_ID = CR.CUSTOMCLEARANCE_ID                                                  ' + sLineBreak +
    '            AND BILLING_ID IS NULL                                                                          ' + sLineBreak +
    '            AND STATUS = ''APPROVED'')                            AS [Total Despesas],                      ' + sLineBreak +
    '        SUM(CR.CASHREQUESTTOTAL) -                                                                          ' + sLineBreak +
    ' 	   (SELECT SUM(PAYMENTTOTAL)                                                                             ' + sLineBreak +
    '           FROM   MYINDAIAV2.DBO.PAYMENTREQUESTED (NOLOCK)                                                  ' + sLineBreak +
    '          WHERE  CUSTOMCLEARANCE_ID = CR.CUSTOMCLEARANCE_ID                                                 ' + sLineBreak +
    '            AND BILLING_ID IS NULL                                                                          ' + sLineBreak +
    '            AND STATUS = ''APPROVED'')                            AS [Saldo]                                ' + sLineBreak +
    '  FROM   MYINDAIAV2.DBO.CASHREQUESTED                   CR  (NOLOCK)                                        ' + sLineBreak +
    '         LEFT JOIN MYINDAIAV2.DBO.BILLING_CASHREQUESTED BCR (NOLOCK) ON BCR.CASHREQUESTS_ID = CR.ID         ' + sLineBreak +
    '         LEFT JOIN MYINDAIAV2.DBO.CUSTOMCLEARANCE       CC  (NOLOCK) ON CC.ID = CR.CUSTOMCLEARANCE_ID       ' + sLineBreak +
    '         LEFT JOIN BROKER.DBO.TPROCESSO                 PR  (NOLOCK) ON PR.NR_PROCESSO = CC.CUSTOMID        ' + sLineBreak +
    '         LEFT JOIN BROKER.DBO.TGRUPO                    G   (NOLOCK) ON G.CD_GRUPO = PR.CD_GRUPO            ' + sLineBreak +
    '         LEFT JOIN BROKER.DBO.TREF_CLIENTE              REF (NOLOCK) ON REF.NR_PROCESSO = PR.NR_PROCESSO    ' + sLineBreak +
    '                                                                    AND REF.TP_REFERENCIA = ''04''          ' + sLineBreak +
    '  WHERE  PR.CD_GRUPO = ''B77''                                                                              ' + sLineBreak +
    '         AND CR.STATUS = ''APPROVED''                                                                       ' + sLineBreak +
    '         AND BCR.CASHREQUESTS_ID IS NULL                                                                    ' + sLineBreak +
    '  GROUP  BY CC.CUSTOMID,                                                                                    ' + sLineBreak +
    '            REF.CD_REFERENCIA,                                                                              ' + sLineBreak +
    '            G.NM_GRUPO,                                                                                     ' + sLineBreak +
    '            CUSTOMCLEARANCE_ID                                                                              ' + sLineBreak ;
end;

procedure Tfrm_main.NumerriosnoFaturados2Click(Sender: TObject);
var
  Form: TfmConsulta;
begin
  Form := TfmConsulta.Create(nil);
  try
    Form.TituloRelatorio := 'Mattel - Numerários não Faturados';
    Form.qryMain.SQL.Text := GetSQLNumerariosNaoFaturados;
    Form.Executa;
  finally
    Form.Free;
  end;
end;

procedure Tfrm_main.ControledeFaturamentoporUsurio1Click(Sender: TObject);
var
  F: TFormControleFaturamentoUsuarioCtx;
begin
  F := TFormControleFaturamentoUsuarioCtx.Create(Application);
  try
    F.ShowModal;
  finally
    F.Free;
  end;
end;

procedure Tfrm_main.PadroSISCOSERVDespesasPagas1Click(Sender: TObject);
var
  F: TFormPadraoSISCOSERVCtx;
begin
  F := TFormPadraoSISCOSERVCtx.Create(Application);
  try
    F.ShowModal;
  finally
    F.Free;
  end;
end;

procedure Tfrm_main.FaturadosSaldodeFatura1Click(Sender: TObject);
var
  F: TFormFaturadosSaldoFaturaCtx;
begin
  F := TFormFaturadosSaldoFaturaCtx.Create(Application);
  try
    F.ShowModal;
  finally
    F.Free;
  end;
end;

procedure Tfrm_main.FaturadosImportao1Click(Sender: TObject);
var
  F: TFormCargilFaturadosImportacaoCtx;
begin
  F := TFormCargilFaturadosImportacaoCtx.Create(Application);
  try
    F.ShowModal;
  finally
    F.Free;
  end;
end;

procedure Tfrm_main.PagamentosnoFaturados1Click(Sender: TObject);
var
  F: TFormPagamentosNaoFaturadosCtx;
begin
  F := TFormPagamentosNaoFaturadosCtx.Create(Application);
  try
    F.ShowModal;
  finally
    F.Free;
  end;
end;

procedure Tfrm_main.DespesasPagas1Click(Sender: TObject);
var
  F: TFormRelDepesasPagasCtx;
begin
  F := TFormRelDepesasPagasCtx.Create(Application);
  try
    F.ShowModal;
  finally
    F.Free;
  end;
end;

procedure Tfrm_main.FaturadosExportao1Click(Sender: TObject);
var
  F: TFormRlCargilFaturadosExportacao;
begin
  F := TFormRlCargilFaturadosExportacao.Create(Application);
  try
    F.ShowModal;
  finally
    F.Free;
  end;
end;

procedure Tfrm_main.FaturadosCEBRACE1Click(Sender: TObject);
var
  F: TFormRlFaturadosCEBRACECtx;
begin
  F := TFormRlFaturadosCEBRACECtx.Create(Application);
  try
    F.ShowModal;
  finally
    F.Free;
  end;
end;

procedure Tfrm_main.Faturados2Click(Sender: TObject);
var
  F: TFormRLFirmenichFaturadosCtx;
begin
  F := TFormRLFirmenichFaturadosCtx.Create(Application);
  try
    F.ShowModal;
  finally
    F.Free;
  end;
end;

procedure Tfrm_main.Faturado1Click(Sender: TObject);
var
  F: TFormRlWhirlpooFaturadoslCtx;
begin
  F := TFormRlWhirlpooFaturadoslCtx.Create(Application);
  try
    F.ShowModal;
  finally
    F.Free;
  end;
end;

procedure Tfrm_main.Comisses1Click(Sender: TObject);
var
  F: TFormRlBASFComissoesCtx;
begin
  F := TFormRlBASFComissoesCtx.Create(Application);
  try
    F.sEmpresa := 'Basf';
    F.ShowModal;
  finally
    F.Free;
  end;
end;

procedure Tfrm_main.MBASF1Click(Sender: TObject);
var
  F: TFormRlTM_BASFCtx;
begin
  F := TFormRlTM_BASFCtx.Create(Application);
  try
    F.TipoRelatorio:= 'I';
    F.ShowModal;
  finally
    F.Free;
  end;
end;

function getSQLNumerariosNaoFaturadosChevron: string;
begin
  Result :=
    'SELECT DISTINCT                                                                                          '+ slineBreak +
    '       CC.CUSTOMID              AS [Nr. Processo],                                                       '+ slineBreak +
    '       REF.CD_REFERENCIA        AS [Outras Referencias],                                                 '+ slineBreak +
    '       G.NM_GRUPO               AS [Grupo],                                                              '+ slineBreak +
    '       MIN(CR.RECEIVEDDATE)     AS [Data Recebimento Numerário],                                         '+ slineBreak +
    '       SUM(CR.CASHREQUESTTOTAL) AS [Valor Total Recebido]                                                '+ slineBreak +
    'FROM   MYINDAIAV2.DBO.CASHREQUESTED                   CR   (NOLOCK)                                      '+ slineBreak +
    '       LEFT JOIN MYINDAIAV2.DBO.BILLING_CASHREQUESTED BCR  (NOLOCK)  ON BCR.CASHREQUESTS_ID = CR.ID      '+ slineBreak +
    '       LEFT JOIN MYINDAIAV2.DBO.CUSTOMCLEARANCE       CC   (NOLOCK)  ON CC.ID = CR.CUSTOMCLEARANCE_ID    '+ slineBreak +
    '       LEFT JOIN BROKER.DBO.TPROCESSO                 PR   (NOLOCK)  ON PR.NR_PROCESSO = CC.CUSTOMID     '+ slineBreak +
    '       LEFT JOIN BROKER.DBO.TGRUPO                    G    (NOLOCK)  ON G.CD_GRUPO = PR.CD_GRUPO         '+ slineBreak +
    '       LEFT JOIN BROKER.DBO.TREF_CLIENTE              REF  (NOLOCK)  ON REF.NR_PROCESSO = PR.NR_PROCESSO '+ slineBreak +
    '                                                                    AND REF.TP_REFERENCIA = ''04''       '+ slineBreak +
    'WHERE  PR.CD_GRUPO = ''560''                                                                             '+ slineBreak +
    '       AND CR.STATUS = ''APPROVED''                                                                      '+ slineBreak +
    '       AND BCR.CASHREQUESTS_ID IS NULL                                                                   '+ slineBreak +
    'GROUP  BY CC.CUSTOMID,                                                                                   '+ slineBreak +
    '          REF.CD_REFERENCIA,                                                                             '+ slineBreak +
    '          G.NM_GRUPO,                                                                                    '+ slineBreak +
    '          CUSTOMCLEARANCE_ID                                                                             '+ slineBreak ;
end;

procedure Tfrm_main.NumerriosnoFaturados3Click(Sender: TObject);
var
  Form: TfmConsulta;
begin
  Form := TfmConsulta.Create(nil);
  try
    Form.TituloRelatorio := 'Chevron - Numerários não Faturados';
    Form.qryMain.SQL.Text := getSQLNumerariosNaoFaturadosChevron;
    Form.Executa;
  finally
    Form.Free;
  end;
end;

procedure Tfrm_main.ProcessodeExportaoItens1Click(Sender: TObject);
var
  F: TFormProcessoExportacaoItensCtx;
begin
  F := TFormProcessoExportacaoItensCtx.Create(Application);
  try
    F.ShowModal;
  finally
    F.Free;
  end;
end;

procedure Tfrm_main.SpedFiscal1Click(Sender: TObject);
var
  F: TFormSaintGobainSpedFiscalCtx;
begin
  F := TFormSaintGobainSpedFiscalCtx.Create(Application);
  try
    F.ShowModal;
  finally
    F.Free;
  end;
end;

procedure Tfrm_main.SpedFiscal2Click(Sender: TObject);
var
  F: TFormCDESpedFiscalCtx;
begin
  F := TFormCDESpedFiscalCtx.Create(Application);
  try
    F.ShowModal;
  finally
    F.Free;
  end;
end;

procedure Tfrm_main.SpedFiscal3Click(Sender: TObject);
var
  F: TFormFirmenichSpedFiscalCtx;
begin
  F := TFormFirmenichSpedFiscalCtx.Create(Application);
  try
    F.ShowModal;
  finally
    F.Free;
  end;
end;

procedure Tfrm_main.CardinalICF1Click(Sender: TObject);
var
  F: TFormCardinalICF;
begin
  F := TFormCardinalICF.Create(Application);
  try
    F.ShowModal;
  finally
    F.Free;
  end;
end;

procedure Tfrm_main.GerenciamentodeProcessos1Click(Sender: TObject);
var
  F: TFormGerenciamentoDeProcessos;
begin
  F := TFormGerenciamentoDeProcessos.Create(Self);
  try
    F.ShowModal;
  finally
    F.Free;
  end;
end;

procedure Tfrm_main.mnuIntegraoPhilipsClick(Sender: TObject);
var
  F: TFormIntegracaoPhilips;
begin
  F := TFormIntegracaoPhilips.Create(Self);
  try
    F.ShowModal;
  finally
    F.Free;
  end;
end;

procedure Tfrm_main.ArmazenagemExpo1Click(Sender: TObject);
var
  F: TFormRlBASFArmazenagemExpoCtx;
begin
  F := TFormRlBASFArmazenagemExpoCtx.Create(Self);
  try
    F.sEmpresa := 'Basf';
    F.ShowModal;
  finally
    F.Free;
  end;
end;

procedure Tfrm_main.ConfigEnviodeEmails1Click(Sender: TObject);
begin
  try
    frmConfigurarEnvioArquivosEmail := tfrmConfigurarEnvioArquivosEmail.create(Application);
    frmConfigurarEnvioArquivosEmail.showmodal;
  finally
    FreeAndNil(frmConfigurarEnvioArquivosEmail)
  end;
end;

procedure Tfrm_main.Anvisa1Click(Sender: TObject);
var
  F: TFormAnvisa;
begin
  F := TFormAnvisa.Create(Self);
  try
    F.ShowModal;
  finally
    F.Free;
  end;
end;

procedure Tfrm_main.ConsultaMercante1Click(Sender: TObject);
begin
  vStr_cd_modulo := '42';
  str_cd_rotina  := '4202';
  str_cd_mod := vStr_cd_modulo;
  str_cd_rot := str_cd_rotina;
  try
    frmConsultaMercante := TfrmConsultaMercante.Create(Self);
    frmConsultaMercante.ShowModal;
  finally
    FreeAndNil(frmConsultaMercante);
  end;
end;

procedure Tfrm_main.InstruodeEmbarque1Click(Sender: TObject);
begin
  try
    frmRelatoriosNestle := TfrmRelatoriosNestle.Create(nil);
    frmRelatoriosNestle.lblNomeRelatorio.Caption := InstruodeEmbarque1.caption;
    frmRelatoriosNestle.Caption                  := frmRelatoriosNestle.Caption + StringReplace(InstruodeEmbarque1.caption, '&', '', [rfReplaceAll]);
    frmRelatoriosNestle.TipoRelatorio            := 5; //Instrução de Embarque
    frmRelatoriosNestle.ShowModal;
  finally
    FreeAndNil(frmRelatoriosNestle);
  end;
end;

procedure Tfrm_main.Faturados3Click(Sender: TObject);
var
  F: TFrmRlPhilipsFaturadosCtx;
begin
  F := TFrmRlPhilipsFaturadosCtx.Create(Application);
  try
    F.ShowModal;
  finally
    F.Free;
  end;
end;

procedure Tfrm_main.MBASF2Click(Sender: TObject);
var
  F: TFormRlTM_BASFCtx;
begin
  F := TFormRlTM_BASFCtx.Create(Application);
  try
    F.TipoRelatorio:= 'E';
    F.ShowModal;
  finally
    F.Free;
  end;
end;

procedure Tfrm_main.LIsConsultadasRobo1Click(Sender: TObject);
var
  F: TfrmRelatorioLIs;
begin
  F := TfrmRelatorioLIs.Create(Application);
  try
    F.ShowModal;
  finally
    F.Free;
  end;
end;

function Tfrm_main.GetMyPagamentoMercantePath: string;
var
  R: TRegistry;
  Local: string;
begin
  R := TRegistry.Create(KEY_READ or KEY_WOW64_64KEY);
  try
    R.RootKey := HKEY_LOCAL_MACHINE;
    R.OpenKey('Software\MyIndaia\MyPagamentoMercante', False);
    Result := R.ReadString('Path');
  finally
    R.Free;
  end;
end;

procedure Tfrm_main.PagamentoMercante1Click(Sender: TObject);
var
  MyPagamentoMercantePath: string;
  MyPagamentoMercante: string;
  nr_processo: string;
  IDRep: string;
  sUsuario, sSenha :String;
begin
  vStr_cd_modulo := '42';
  str_cd_rotina  := '4201';
  str_cd_mod := vStr_cd_modulo;
  str_cd_rot := str_cd_rotina;


  sUsuario := str_ap_usuario;
  sSenha   := str_senha_usuario;

  MyPagamentoMercantePath := 'C:\DDBROKER\PagamentoMercante\';
  MyPagamentoMercante := MyPagamentoMercantePath+'MyPagamentoMercante.exe';

  if not FileExists( MyPagamentoMercante) then
  begin
    ShowMessage('Pagamento Mercante não encontrado no caminho ' + MyPagamentoMercante +'.'+#13#10+
      'Para resolver este problema tente executar o Pagamento Mercante  uma vez como administrador.');
    Exit;
  end;

  StartApp('Open', PChar(MyPagamentoMercante), PAnsiChar(sUsuario + ' ' + sSenha), PChar(MyPagamentoMercantePath), SW_SHOW);
end;


procedure Tfrm_main.Numerarios1Click(Sender: TObject);
var
  Form: TfrmNumerariosNestle;
begin
  Form := TfrmNumerariosNestle.Create(nil);
  try
    Form.sEmpresa := 'Nestlé';
    Form.ShowModal;
  finally
    Form.Free;
  end;
end;

procedure Tfrm_main.FaturamentoLI1Click(Sender: TObject);
var
  Form: TfrmRelFaturamentoLIs;
begin
  Form := TfrmRelFaturamentoLIs.Create(nil);
  try
    Form.ShowModal;
  finally
    Form.Free;
  end;
end;

procedure Tfrm_main.mi_dueClick(Sender: TObject);
begin
  AbrirMiniBroker('ProcessosDue1');
end;

procedure Tfrm_main.MercadoriasExpo1Click(Sender: TObject);
var
  F: TfrmRelatorioMercadorias;
begin
  F := TFrmRelatorioMercadorias.Create(Application);
  try
    F.TipoRelatorio:= 'E';
    F.ShowModal;
  finally
    F.Free;
  end;
end;

procedure Tfrm_main.MercadoriasImportao1Click(Sender: TObject);
var
  F: TfrmRelatorioMercadorias;
begin
  F := TFrmRelatorioMercadorias.Create(Application);
  try
    F.TipoRelatorio:= 'I';
    F.ShowModal;
  finally
    F.Free;
  end;
end;

procedure Tfrm_main.FaturadosComisso1Click(Sender: TObject);
var
  F: TFormRlWhirlpoolFaturadosComissoesCtx;
begin
  F := TFormRlWhirlpoolFaturadosComissoesCtx.Create(Application);
  try
    F.ShowModal;
  finally
    F.Free;
  end;
end;

procedure Tfrm_main.AFaturar1Click(Sender: TObject);
var
  F: TFormRlWhirlpoolAFaturarCtx;
begin
  F := TFormRlWhirlpoolAFaturarCtx.Create(Application);
  try
    F.ShowModal;
  finally
    F.Free;
  end;

end;

procedure Tfrm_main.Faturados4Click(Sender: TObject);
var
  Form: tfrmFaturadosMattel;
begin
  Form := tfrmFaturadosMattel.Create(nil);
  try
    Form.ShowModal;
  finally
    Form.Free;
  end;
end;

procedure Tfrm_main.DIObservacoesAutomaticas1Click(Sender: TObject);
begin
  vStr_cd_modulo := '02';
  str_cd_rotina  := '0215';
  str_cd_mod := vStr_cd_modulo;
  str_cd_rot := str_cd_rotina;
  AbrirMiniBroker('CadastroRegrasObservacoesAutomaticas1');
end;

procedure Tfrm_main.PagamentoAFRMM1Click(Sender: TObject);
var
  F: TfrmRelPagamentoAFRMM;
begin
  F := TfrmRelPagamentoAFRMM.Create(Self);
  try
    F.ShowModal;
  finally
    F.Free;
  end;
end;

procedure Tfrm_main.FaturadosSemanal1Click(Sender: TObject);
var  Form: TfrmFaturadosNestleSemanal;
begin
  Form := TfrmFaturadosNestleSemanal.Create(nil);
  try
    Form.ShowModal;
  finally
    Form.Free;
  end;
end;

procedure Tfrm_main.DIObsAutomaticasParametros1Click(Sender: TObject);
begin
  vStr_cd_modulo := '02';
  str_cd_rotina  := '0216';
  str_cd_mod := vStr_cd_modulo;
  str_cd_rot := str_cd_rotina;
  AbrirMiniBroker('CadastroTabelasCamposRegrasObservaesAutomticas1');
end;

procedure Tfrm_main.mitiposdePendenciasClick(Sender: TObject);
var  Form: TfrmCadPendenciasProc;
begin
  UserUp;
  ReiniciaCloser;
  if not VerIntegridade then Exit;
  vStr_cd_modulo := '22';
  str_cd_rotina := '2300';
  str_cd_mod := vStr_cd_modulo;
  str_cd_rot := str_cd_rotina;
  Form := TfrmCadPendenciasProc.Create(nil);
  try
    Form.ShowModal;
  finally
    Form.Free;
  end;
  KickUser;
end;

procedure Tfrm_main.Prometeon1Click(Sender: TObject);
var  Form: TfrmPrometeonEDI;
begin
  UserUp;
  ReiniciaCloser;
  if not VerIntegridade then Exit;
  str_cd_mod := vStr_cd_modulo;
  str_cd_rot := str_cd_rotina;
  Form := TfrmPrometeonEDI.Create(nil);
  try
    Form.ShowModal;
  finally
    Form.Free;
  end;
  KickUser;
end;

procedure Tfrm_main.DespesasPagas2Click(Sender: TObject);
var
  F: TFormRelDepesasPagasCtxSG;
begin
  F := TFormRelDepesasPagasCtxSG.Create(Application);
  try
    F.ShowModal;
  finally
    F.Free;
  end;
end;

procedure Tfrm_main.Impostos1Click(Sender: TObject);
var
  Form: TfrmDespesasClienteBASF;
begin
  Form := TfrmDespesasClienteBASF.Create(nil);
  try
    Form.sEmpresa := 'Basf';
    Form.ShowModal;
  finally
    Form.Free;
  end;
end;

procedure Tfrm_main.AbrirMiniBroker(nomeMenu : String; nr_processo : string = '');
var
  MiniBrokerPath: string;
  MiniBroker: string;
  sUsuario, sSenha :String;
begin
  sUsuario := str_ap_usuario;
  sSenha   := str_senha_usuario;

  MiniBrokerPath :='C:\DDBROKER\MiniBroker\';
  MiniBroker := MiniBrokerPath+'MiniBroker.exe';

  if not FileExists( MiniBroker) then
  begin
    ShowMessage('Sistema MiniBroker não encontrado no caminho ' + MiniBroker +'.');
    Exit;
  end;

  StartApp('Open', PChar(MiniBroker), PAnsiChar('/user '+sUsuario+' /password '+sSenha+ ' /menu '+ nomeMenu + ' /processo '+ nr_processo), PChar(MiniBrokerPath), SW_SHOW);
end;

procedure Tfrm_main.CertificadoDeOrigem1Click(Sender: TObject);
var
  Params: string;
begin
  Params := '/DBServer '+Ifthen(VersaoTeste, ServidorHomologacao, ServidorProducao)+
    ' /DBName BROKER'+
    ' /DBUser SA'+
    ' /DBPassword 123';
  //ExecuteExternal('Fecomercio', GetPath + 'Fecomercio.exe', Params, Handle, FFecomercio, 618, 520);
  StartApp('Open', PChar(GetPath + 'COD.exe'), PAnsiChar(Params), PChar(GetPath), SW_SHOW);
end;

procedure Tfrm_main.miWalletSolicitarNumerariosClick(Sender: TObject);
begin
  vStr_cd_modulo := '43';
  str_cd_rotina  := '4302';
  str_cd_mod := vStr_cd_modulo;
  str_cd_rot := str_cd_rotina;
  AbrirMiniBroker('WalletSolicitarNumerario');
end;

procedure Tfrm_main.miWalletCriarPagamentosClick(Sender: TObject);
begin
  vStr_cd_modulo := '43';
  str_cd_rotina  := '4303';
  str_cd_mod := vStr_cd_modulo;
  str_cd_rot := str_cd_rotina;
  AbrirMiniBroker('WalletCriarPagamentos');
end;

procedure Tfrm_main.miWalletSolicitarPagamentoClick(Sender: TObject);
begin
  vStr_cd_modulo := '43';
  str_cd_rotina  := '4304';
  str_cd_mod := vStr_cd_modulo;
  str_cd_rot := str_cd_rotina;
  AbrirMiniBroker('WalletSolicitarPagamento');
end;

procedure Tfrm_main.WalletCadBancoClick(Sender: TObject);
begin
  vStr_cd_modulo := '43';
  str_cd_rotina  := '4305';
  str_cd_mod := vStr_cd_modulo;
  str_cd_rot := str_cd_rotina;
  AbrirMiniBroker('WalletCadBanco');
end;

procedure Tfrm_main.WalletCadClienteClick(Sender: TObject);
begin
  vStr_cd_modulo := '43';
  str_cd_rotina  := '4306';
  str_cd_mod := vStr_cd_modulo;
  str_cd_rot := str_cd_rotina;
  AbrirMiniBroker('WalletCadCliente');
end;

procedure Tfrm_main.WalletCadFavorecidoClick(Sender: TObject);
begin
  vStr_cd_modulo := '43';
  str_cd_rotina  := '4307';
  str_cd_mod := vStr_cd_modulo;
  str_cd_rot := str_cd_rotina;
  AbrirMiniBroker('WalletCadFavorecido');
end;

procedure Tfrm_main.WalletCadFilialClick(Sender: TObject);
begin
  vStr_cd_modulo := '43';
  str_cd_rotina  := '4308';
  str_cd_mod := vStr_cd_modulo;
  str_cd_rot := str_cd_rotina;
  AbrirMiniBroker('WalletCadFilial');
end;

procedure Tfrm_main.WalletCadGrupoClick(Sender: TObject);
begin
  vStr_cd_modulo := '43';
  str_cd_rotina  := '4309';
  str_cd_mod := vStr_cd_modulo;
  str_cd_rot := str_cd_rotina;
  AbrirMiniBroker('WalletCadGrupo');
end;

procedure Tfrm_main.WalletCadItemClick(Sender: TObject);
begin
  vStr_cd_modulo := '43';
  str_cd_rotina  := '4310';
  str_cd_mod := vStr_cd_modulo;
  str_cd_rot := str_cd_rotina;
  AbrirMiniBroker('WalletCadItem');
end;

procedure Tfrm_main.WalletCadOrganizacaoClick(Sender: TObject);
begin
  vStr_cd_modulo := '43';
  str_cd_rotina  := '4311';
  str_cd_mod := vStr_cd_modulo;
  str_cd_rot := str_cd_rotina;
  AbrirMiniBroker('WalletCadOrganizacao');
end;

procedure Tfrm_main.WalletCadPaisClick(Sender: TObject);
begin
  vStr_cd_modulo := '43';
  str_cd_rotina  := '4312';
  str_cd_mod := vStr_cd_modulo;
  str_cd_rot := str_cd_rotina;
  AbrirMiniBroker('WalletCadPais');
end;

procedure Tfrm_main.WalletCadProdutoClick(Sender: TObject);
begin
  vStr_cd_modulo := '43';
  str_cd_rotina  := '4313';
  str_cd_mod := vStr_cd_modulo;
  str_cd_rot := str_cd_rotina;
  AbrirMiniBroker('WalletCadProduto');
end;

procedure Tfrm_main.WalletCadServicoClick(Sender: TObject);
begin
  vStr_cd_modulo := '43';
  str_cd_rotina  := '4314';
  str_cd_mod := vStr_cd_modulo;
  str_cd_rot := str_cd_rotina;
  AbrirMiniBroker('WalletCadServico');
end;

procedure Tfrm_main.WalletCadUsuarioClick(Sender: TObject);
begin
  vStr_cd_modulo := '43';
  str_cd_rotina  := '4315';
  str_cd_mod := vStr_cd_modulo;
  str_cd_rot := str_cd_rotina;
  AbrirMiniBroker('WalletCadUsuario');
end;


procedure Tfrm_main.WalletTransferenciaPagamentoClick(Sender: TObject);
begin
  vStr_cd_modulo := '43';
  str_cd_rotina  := '4316';
  str_cd_mod := vStr_cd_modulo;
  str_cd_rot := str_cd_rotina;
  AbrirMiniBroker('WalletTransferenciaPagamento');
end;

procedure Tfrm_main.IntegrcaoFecomercio1Click(Sender: TObject);
var
  Params: string;
begin
  Params := '/DBServer '+Ifthen(VersaoTeste, ServidorHomologacao, ServidorProducao)+
    ' /DBName BROKER'+
    ' /DBUser SA'+
    ' /DBPassword 123';
  //ExecuteExternal('Fecomercio', GetPath + 'Fecomercio.exe', Params, Handle, FFecomercio, 618, 520);
  StartApp('Open', PChar(GetPath + 'Fecomercio.exe'), PAnsiChar(Params), PChar(GetPath), SW_SHOW);
end;

procedure Tfrm_main.Faturados5Click(Sender: TObject);
var
  F: TFormRlYaraFaturadosComissoesCtx;
begin
  F := TFormRlYaraFaturadosComissoesCtx.Create(Application);
  try
    F.ShowModal;
  finally
    F.Free;
  end;
end;

procedure Tfrm_main.walletPreFaturamentoClick(Sender: TObject);
begin
  vStr_cd_modulo := '43';
  str_cd_rotina  := '4317';
  str_cd_mod := vStr_cd_modulo;
  str_cd_rot := str_cd_rotina;
  AbrirMiniBroker('WalletPreFaturamento');
end;

procedure Tfrm_main.Numerrios2Click(Sender: TObject);
var
  F: TfrmNumerariosYara;
begin
  F := TfrmNumerariosYara.Create(Application);
  try
    F.ShowModal;
  finally
    F.Free;
  end;
end;

procedure Tfrm_main.DraftBL1Click(Sender: TObject);
begin
  AbrirMiniBroker('DraftBL');
end;

procedure Tfrm_main.DIeImpostosEASY1Click(Sender: TObject);
var
  Form: TFormFerreroDIeImpostosEASY;
begin
  Form := TFormFerreroDIeImpostosEASY.Create(nil);
  try
    Form.showModal;
  finally
    Form.Free;
  end;
end;

procedure Tfrm_main.AcordoComercial1Click(Sender: TObject);
var
  Form: TfrmCdAcordoComercial;
begin
  UserUp;
  ReiniciaCloser;
  if not VerIntegridade then Exit;
  vStr_cd_modulo := '22';
  str_cd_rotina := '2301';
  str_cd_mod := vStr_cd_modulo;
  str_cd_rot := str_cd_rotina;
  Form := TfrmCdAcordoComercial.Create(nil);
  try
    Form.ShowModal;
  finally
    Form.Free;
  end;
  KickUser;
end;

procedure Tfrm_main.DeclaraodeOrigem1Click(Sender: TObject);
var
  Form: TfrmCdDeclaracaoOrigem;
begin
  UserUp;
  ReiniciaCloser;
  if not VerIntegridade then Exit;
  vStr_cd_modulo := '22';
  str_cd_rotina := '2302';
  str_cd_mod := vStr_cd_modulo;
  str_cd_rot := str_cd_rotina;
  Form := TfrmCdDeclaracaoOrigem.Create(nil);
  try
    Form.ShowModal;
  finally
    Form.Free;
  end;
  KickUser;
end;

procedure Tfrm_main.DescriodeMercadoriaDraft1Click(Sender: TObject);
begin
  AbrirMiniBroker('DescriodeMercadoriaDraft');
end;

procedure Tfrm_main.ProcessosFaturadosSaldoFaturasemaprovComissaoClick(
  Sender: TObject);
var
  F: TFormFaturadosSaldoFaturaCtxAprovComissao;
begin
  F := TFormFaturadosSaldoFaturaCtxAprovComissao.Create(Application);
  try
    F.ShowModal;
  finally
    F.Free;
  end;
end;


procedure Tfrm_main.RelatrioNFsCargil1Click(Sender: TObject);
begin
  TfmConsultaNFsCargil.Execute;
end;

procedure Tfrm_main.IntegracaoSAP1Click(Sender: TObject);
begin
  TfmConsultaIntegracaoSAPCargil.Execute;
end;

procedure Tfrm_main.IntegraoDrawbackIsencao1Click(Sender: TObject);
var
  IntegracaoDrawbackIsencaoPath: string;
  IntegracaoDrawbackIsencao: string;
  nr_processo: string;
  IDRep: string;
  sUsuario, sSenha :String;
begin
  vStr_cd_modulo := '43';
  str_cd_rotina  := '4301';
  str_cd_mod := vStr_cd_modulo;
  str_cd_rot := str_cd_rotina;


  sUsuario := str_ap_usuario;
  sSenha   := str_senha_usuario;

  IntegracaoDrawbackIsencaoPath := 'C:\DDBROKER\IntegracaoDrawbackIsencao\';
  IntegracaoDrawbackIsencao := IntegracaoDrawbackIsencaoPath+'IntegracaoDrawbackIsencao.exe';

  if not FileExists(IntegracaoDrawbackIsencao) then
  begin
    ShowMessage('Integração Drawback Isenção não encontrado no caminho ' + IntegracaoDrawbackIsencao);
    Exit;
  end;

  StartApp('Open', PChar(IntegracaoDrawbackIsencao), PAnsiChar(sUsuario + ' ' + sSenha), PChar(IntegracaoDrawbackIsencaoPath), SW_SHOW);
end;

procedure Tfrm_main.FaturadosDespesasHonorarios1Click(Sender: TObject);
var
  F: TFormRlPrometeonFaturadosDespesasHonorariosCtx;
begin
  F := TFormRlPrometeonFaturadosDespesasHonorariosCtx.Create(Application);
  try
    F.ShowModal;
  finally
    F.Free;
  end;
end;

procedure Tfrm_main.FaturadosHonorarios1Click(Sender: TObject);
var
  F: TFormRlPrometeonFaturadosHonorariosCtx;
begin
  F := TFormRlPrometeonFaturadosHonorariosCtx.Create(Application);
  try
    F.ShowModal;
  finally
    F.Free;
  end;
end;

procedure Tfrm_main.FaturadosHonorarios2Click(Sender: TObject);
var
  F: TFormRlPirelliFaturadosHonorariosCtx;
begin
  F := TFormRlPirelliFaturadosHonorariosCtx.Create(Application);
  try
    F.ShowModal;
  finally
    F.Free;
  end;
end;

procedure Tfrm_main.IntegracaoDraftDanfeNestle1Click(Sender: TObject);
var
  F: Tfrm_integracao_nota_nestle;
begin
  F := Tfrm_integracao_nota_nestle.Create(Application);
  try
    F.ShowModal;
  finally
    F.Free;
  end;
end;

procedure Tfrm_main.FaturadosDespesas1Click(Sender: TObject);
var
  F: TFormRlRousselotFaturadosDespesasCtx;
begin
  F := TFormRlRousselotFaturadosDespesasCtx.Create(Application);
  try
    F.ShowModal;
  finally
    F.Free;
  end;
end;

procedure Tfrm_main.Faturados6Click(Sender: TObject);
var
  F: TFormRlFerreroFaturadosCtx;
begin
  F := TFormRlFerreroFaturadosCtx.Create(Application);
  try
    F.ShowModal;
  finally
    F.Free;
  end;
end;

procedure Tfrm_main.FaturadosComissaoExportacao1Click(Sender: TObject);
var
  F: TFormRlWhirlpoolFaturadosComissoesExpCtx;
begin
  F := TFormRlWhirlpoolFaturadosComissoesExpCtx.Create(Application);
  try
    F.ShowModal;
  finally
    F.Free;
  end;
end;

procedure Tfrm_main.AberturadeProcessosNestleDF1Click(Sender: TObject);
var
  F: Tfrm_integracao_abertura_processo_nestle;
begin
  F := Tfrm_integracao_abertura_processo_nestle.Create(Application);
  try
    F.ShowModal;
  finally
    F.Free;
  end;
end;

procedure Tfrm_main.AberturadeProcessosNestleLean1Click(Sender: TObject);
var
  F: Tfrm_integracao_abertura_processo_nestle_Lean;
begin
  F := Tfrm_integracao_abertura_processo_nestle_Lean.Create(Application);
  try
    F.ShowModal;
  finally
    F.Free;
  end;
end;

procedure Tfrm_main.Booking1Click(Sender: TObject);
var
  F: TfmIntegracaoBookingInttra;
begin
  F := TfmIntegracaoBookingInttra.Create(Application);
  try
    F.ShowModal;
  finally
    F.Free;
  end;
end;

procedure Tfrm_main.FaturadosImportacaosgbClick(Sender: TObject);
var
  F: TFormRlSaintGobainFaturadosCtx;
begin
  F := TFormRlSaintGobainFaturadosCtx.Create(Application);
  try
    F.Produto := '01';
    F.ShowModal;
  finally
    F.Free;
  end;
end;

procedure Tfrm_main.FaturadosExportacaoSgbClick(Sender: TObject);
var
  F: TFormRlSaintGobainFaturadosCtx;
begin
  F := TFormRlSaintGobainFaturadosCtx.Create(Application);
  try
    F.Produto := '02';
    F.ShowModal;
  finally
    F.Free;
  end;
end;

procedure Tfrm_main.ApoloItensExportao1Click(Sender: TObject);
var
  F: TFormIntegracaoApolo;
begin
  F := TFormIntegracaoApolo.Create(Application);
  try
    F.ShowModal;
  finally
    F.Free;
  end;
end;

procedure Tfrm_main.NestleIntegraoLotesItensExportao1Click(Sender: TObject);
var
  F: TFormIntegracaoNestleExpItemLote;
begin
  F := TFormIntegracaoNestleExpItemLote.Create(Application);
  try
    F.ShowModal;
  finally
    F.Free;
  end;
  
end;

procedure Tfrm_main.EssityClick(Sender: TObject);
var
  F: Tfrm_integracao_nota_essity;
begin
  F := Tfrm_integracao_nota_essity.Create(Application);
  try
    F.ShowModal;
  finally
    F.Free;
  end;
end;



procedure Tfrm_main.NexansDraftNF1Click(Sender: TObject);
var
  F: Tfrm_integracao_nota_nexans;
begin
  F := Tfrm_integracao_nota_nexans.Create(Application);
  try
    F.ShowModal;
  finally
    F.Free;
  end;
end;


procedure Tfrm_main.SolicNumerrio1Click(Sender: TObject);
var
  F: Tfrm_integracao_numerario_mattel;
begin
  F := Tfrm_integracao_numerario_mattel.Create(Application);
  try
    F.ShowModal;
  finally
    F.Free;
  end;
end;

procedure Tfrm_main.ExtratorDadosSiscomex1Click(Sender: TObject);
var
  Pasta: string;
  CaminhoArquivo: string;
begin
  Pasta :='C:\DDBROKER\ExtratorDadosSiscomex\';
  CaminhoArquivo := Pasta+'ExtratorDeDadosSiscomex.exe';

  if not FileExists( CaminhoArquivo) then
  begin
    ShowMessage('Sistema não encontrado no caminho ' + CaminhoArquivo +'.');
    Exit;
  end;

  StartApp('Open', PChar(CaminhoArquivo), PAnsiChar(''), PChar(Pasta), SW_SHOW);
end;

procedure Tfrm_main.Faturados7Click(Sender: TObject);
var
  F: TfrmFaturadosHusqvarna;
begin
  F := TfrmFaturadosHusqvarna.Create(Application);
  try
    F.ShowModal;
  finally
    F.Free;
  end;
end;


procedure Tfrm_main.FaturadosExportaointegra1Click(Sender: TObject);
var
  F: TFormRlFerreroFaturadosExpoCtx;
begin
  F := TFormRlFerreroFaturadosExpoCtx.Create(Application);
  try
    F.ShowModal;
  finally
    F.Free;
  end;
end;




procedure Tfrm_main.Faturados8Click(Sender: TObject);
var
  F: TFormRLPrimientFaturadosCtx;
begin
  F := TFormRLPrimientFaturadosCtx.Create(Application);
  try
    F.ShowModal;
  finally
    F.Free;
  end;
end;

procedure Tfrm_main.LogManager1Click(Sender: TObject);
var
  Pasta: string;
  CaminhoArquivo: string;
begin
  Pasta :='C:\DDBROKER\LogManager\';
  CaminhoArquivo := Pasta+'IntegracaoLogManager.exe';

  if not FileExists( CaminhoArquivo) then
  begin
    ShowMessage('Sistema não encontrado no caminho ' + CaminhoArquivo +'.');
    Exit;
  end;

  StartApp('Open', PChar(CaminhoArquivo), PAnsiChar(''), PChar(Pasta), SW_SHOW);
end;

procedure Tfrm_main.Anvisa2Click(Sender: TObject);
var
  F: TfrmAnvisaNestle;
begin
  F := TfrmAnvisaNestle.Create(Application);
  try
    F.ShowModal;
  finally
    F.Free;
  end;
end;

procedure Tfrm_main.GerarxmlNFe1Click(Sender: TObject);
var
  Pasta: string;
  CaminhoArquivo: string;
begin
  Pasta :='C:\DDBROKER\';
  CaminhoArquivo := Pasta+'CriaXmlNfe.exe';

  if not FileExists( CaminhoArquivo) then
  begin
    ShowMessage('Sistema não encontrado no caminho ' + CaminhoArquivo +'.');
    Exit;
  end;

  StartApp('Open', PChar(CaminhoArquivo), PAnsiChar(''), PChar(Pasta), SW_SHOW);
end;

initialization
  with TIniFile.Create('H:\DDBROKER\CONFIG.INI') do
    try
      if AnsiIndexText(ReadString('SERVIDOR', 'PRODUCAO', ServidorProducao), ['', ServidorProducao]) < 0 then
        ServidorProducao := ReadString('SERVIDOR', 'PRODUCAO', ServidorProducao);
      if AnsiIndexText(ReadString('SERVIDOR', 'HOMOLOGACAO', ServidorHomologacao), ['', ServidorHomologacao]) < 0 then
        ServidorHomologacao := ReadString('SERVIDOR', 'HOMOLOGACAO', ServidorHomologacao);
    finally
      Free;
    end;

end.
