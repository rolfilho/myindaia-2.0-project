(*************************************************************************************************
 Sistema: DD Broker - Indaiá Logística
 PROGRAMA: PGSM101.PAS - Parametros do Sistema
 CRIAÇÃO: 09/10/2001
 Manutenção:
 DATA: 10/02/2005
*************************************************************************************************)
unit PGSM101;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ComCtrls, ExtCtrls, StdCtrls, Mask, DBCtrls, Buttons, Menus, Db,
  ToolEdit, CurrEdit, RXDBCtrl, Grids, DBGrids;

type
  Tfrm_param_sistema = class(TForm)
    pgctrl_param: TPageControl;
    ts_solic_ch: TTabSheet;
    ts_dir: TTabSheet;
    dbedt_dt_solic_ch: TDBEdit;
    Label1: TLabel;
    Label2: TLabel;
    dbedt_hr_solic_ch: TDBEdit;
    Label3: TLabel;
    dbedt_seq_solic_ch: TDBEdit;
    bvl_diretorio: TBevel;
    Label5: TLabel;
    dbedt_path_risc: TDBEdit;
    ts_geral: TTabSheet;
    pnl_comandos: TPanel;
    SpeedButton1: TSpeedButton;
    btn_salvar: TSpeedButton;
    btn_cancelar: TSpeedButton;
    menu_cadastro: TMainMenu;
    mi_salvar: TMenuItem;
    mi_cancelar: TMenuItem;
    mi_sair: TMenuItem;
    Label7: TLabel;
    Label8: TLabel;
    dbedt_nm_servidor: TDBEdit;
    dblckbox_tp_instal: TDBLookupComboBox;
    ts_exp: TTabSheet;
    bvl_exportacao: TBevel;
    Label9: TLabel;
    dbedt_nr_perc_seguro: TDBEdit;
    Label10: TLabel;
    ts_eventos_1: TTabSheet;
    lbl_cd_ev_reg_di: TLabel;
    btn_co_ev_reg_di: TSpeedButton;
    dbedt_cd_ev_reg_di: TDBEdit;
    dbedt_nm_ev_reg_di: TDBEdit;
    btn_co_ev_prev_chegada: TSpeedButton;
    dbedt_cd_ev_prev_chegada: TDBEdit;
    dbedt_nm_ev_prev_chegada: TDBEdit;
    lbl_cd_ev_prev_chegada: TLabel;
    lbl_cd_ev_conhecimento: TLabel;
    btn_co_ev_conhecimento: TSpeedButton;
    dbedt_cd_ev_conhecimento: TDBEdit;
    dbedt_nm_ev_conhecimento: TDBEdit;
    btn_co_ev_chegada: TSpeedButton;
    dbedt_cd_ev_chegada: TDBEdit;
    dbedt_nm_ev_chegada: TDBEdit;
    lbl_cd_ev_chegada: TLabel;
    lbl_cd_ev_pagto_li: TLabel;
    btn_co_ev_pagto_li: TSpeedButton;
    dbedt_cd_ev_pagto_li: TDBEdit;
    dbedt_nm_ev_pagto_li: TDBEdit;
    btn_co_ev_etd: TSpeedButton;
    dbedt_cd_ev_etd: TDBEdit;
    dbedt_nm_ev_etd: TDBEdit;
    lbl_cd_ev_etd: TLabel;
    lbl_cd_ev_espera_navio: TLabel;
    btn_co_ev_espera_navio: TSpeedButton;
    dbedt_cd_ev_espera_navio: TDBEdit;
    dbedt_nm_ev_espera_navio: TDBEdit;
    btn_co_ev_dig_di: TSpeedButton;
    dbedt_cd_ev_dig_di: TDBEdit;
    dbedt_nm_ev_dig_di: TDBEdit;
    lbl_cd_ev_dig_di: TLabel;
    lbl_cd_ev_ent: TLabel;
    btn_co_ev_ent: TSpeedButton;
    dbedt_cd_ev_ent: TDBEdit;
    dbedt_nm_ev_ent: TDBEdit;
    btn_co_ev_ci: TSpeedButton;
    dbedt_cd_ev_ci: TDBEdit;
    dbedt_nm_ev_ci: TDBEdit;
    lbl_cd_ev_ci: TLabel;
    lbl_cd_ev_envio_saque_bordero: TLabel;
    btn_co_ev_envio_saque_bordero: TSpeedButton;
    dbedt_cd_ev_envio_saque_bordero: TDBEdit;
    dbedt_nm_ev_envio_saque_bordero: TDBEdit;
    btn_co_ev_recep_analise: TSpeedButton;
    dbedt_cd_ev_recep_analise: TDBEdit;
    dbedt_nm_ev_recep_analise: TDBEdit;
    lbl_cd_ev_recep_analise: TLabel;
    lbl_cd_ev_insp_ma: TLabel;
    btn_co_ev_insp_ma: TSpeedButton;
    dbedt_cd_ev_insp_ma: TDBEdit;
    dbedt_nm_ev_insp_ma: TDBEdit;
    btn_co_ev_receb_doc: TSpeedButton;
    dbedt_cd_ev_receb_doc: TDBEdit;
    dbedt_nm_ev_receb_doc: TDBEdit;
    lbl_cd_ev_receb_doc: TLabel;
    lbl_cd_ev_prev_desemb: TLabel;
    btn_co_ev_prev_desemb: TSpeedButton;
    dbedt_cd_ev_prev_desemb: TDBEdit;
    dbedt_nm_ev_prev_desemb: TDBEdit;
    btn_co_ev_abre_proc: TSpeedButton;
    dbedt_cd_ev_abre_proc: TDBEdit;
    dbedt_nm_ev_abre_proc: TDBEdit;
    lbl_cd_ev_abre_proc: TLabel;
    lbl_cd_ev_desemb: TLabel;
    btn_co_ev_desemb: TSpeedButton;
    dbedt_cd_ev_desemb: TDBEdit;
    dbedt_nm_ev_desemb: TDBEdit;
    btn_co_ev_num_imp: TSpeedButton;
    dbedt_cd_ev_num_imp: TDBEdit;
    dbedt_nm_ev_num_imp: TDBEdit;
    lbl_cd_ev_num_imp: TLabel;
    lbl_cd_ev_descarga: TLabel;
    btn_co_ev_descarga: TSpeedButton;
    dbedt_cd_ev_descarga: TDBEdit;
    dbedt_nm_ev_descarga: TDBEdit;
    btn_co_ev_rec_imp: TSpeedButton;
    dbedt_cd_ev_rec_imp: TDBEdit;
    dbedt_nm_ev_rec_imp: TDBEdit;
    lbl_cd_ev_rec_imp: TLabel;
    ts_eventos_2: TTabSheet;
    lbl_cd_ev_num_frete: TLabel;
    btn_co_ev_num_frete: TSpeedButton;
    dbedt_cd_ev_num_frete: TDBEdit;
    dbedt_nm_ev_num_frete: TDBEdit;
    btn_co_ev_pag_arm: TSpeedButton;
    dbedt_cd_ev_pag_arm: TDBEdit;
    dbedt_nm_ev_pag_arm: TDBEdit;
    lbl_cd_ev_pag_arm: TLabel;
    lbl_cd_ev_rec_frete: TLabel;
    btn_co_ev_rec_frete: TSpeedButton;
    dbedt_cd_ev_rec_frete: TDBEdit;
    dbedt_nm_ev_rec_frete: TDBEdit;
    btn_co_ev_pag_sda: TSpeedButton;
    dbedt_cd_ev_pag_sda: TDBEdit;
    dbedt_nm_ev_pag_sda: TDBEdit;
    lbl_cd_ev_pag_sda: TLabel;
    lbl_cd_ev_num_exp: TLabel;
    btn_co_ev_num_exp: TSpeedButton;
    dbedt_cd_ev_num_exp: TDBEdit;
    dbedt_nm_ev_num_exp: TDBEdit;
    btn_co_ev_envio_imp: TSpeedButton;
    dbedt_cd_ev_envio_imp: TDBEdit;
    dbedt_nm_ev_envio_imp: TDBEdit;
    lbl_cd_ev_envio_doc_cli: TLabel;
    lbl_cd_ev_rec_exp: TLabel;
    btn_co_ev_rec_exp: TSpeedButton;
    dbedt_cd_ev_rec_exp: TDBEdit;
    dbedt_nm_ev_rec_exp: TDBEdit;
    btn_co_ev_envio_fat: TSpeedButton;
    dbedt_cd_ev_envio_fat: TDBEdit;
    dbedt_nm_ev_envio_fat: TDBEdit;
    lbl_cd_ev_envio_fat: TLabel;
    lbl_cd_ev_pres_carga: TLabel;
    btn_co_ev_pres_carga: TSpeedButton;
    dbedt_cd_ev_pres_carga: TDBEdit;
    dbedt_nm_ev_pres_carga: TDBEdit;
    btn_co_ev_cambio_ok: TSpeedButton;
    dbedt_cd_ev_cambio_ok: TDBEdit;
    dbedt_nm_ev_cambio_ok: TDBEdit;
    lbl_cd_ev_cambio_ok: TLabel;
    lbl_cd_ev_vencto_li: TLabel;
    btn_co_ev_vencto_li: TSpeedButton;
    dbedt_cd_ev_vencto_li: TDBEdit;
    dbedt_nm_ev_vencto_li: TDBEdit;
    btn_co_ev_prev_embarque: TSpeedButton;
    dbedt_cd_ev_prev_embarque: TDBEdit;
    dbedt_nm_ev_prev_embarque: TDBEdit;
    lbl_cd_ev_prev_embarque: TLabel;
    lbl_cd_ev_desova: TLabel;
    btn_co_ev_desova: TSpeedButton;
    dbedt_cd_ev_desova: TDBEdit;
    dbedt_nm_ev_desova: TDBEdit;
    btn_co_ev_embarque: TSpeedButton;
    dbedt_cd_ev_embarque: TDBEdit;
    dbedt_nm_ev_embarque: TDBEdit;
    lbl_cd_ev_embarque: TLabel;
    lbl_cd_ev_lib_bl: TLabel;
    btn_co_ev_lib_bl: TSpeedButton;
    dbedt_cd_ev_lib_bl: TDBEdit;
    dbedt_nm_ev_lib_bl: TDBEdit;
    btn_co_ev_entrega_merc: TSpeedButton;
    btn_co_ev_dt_necessidade: TSpeedButton;
    dbedt_cd_ev_entrega_merc: TDBEdit;
    dbedt_nm_ev_entrega_merc: TDBEdit;
    lbl_cd_ev_entrega_merc: TLabel;
    lbl_cd_ev_pag_demur: TLabel;
    btn_co_ev_pag_demur: TSpeedButton;
    dbedt_cd_ev_pag_demur: TDBEdit;
    dbedt_nm_ev_pag_demur: TDBEdit;
    btn_co_ev_averbacao: TSpeedButton;
    dbedt_cd_ev_averbacao: TDBEdit;
    dbedt_nm_ev_averbacao: TDBEdit;
    lbl_cd_ev_averbacao: TLabel;
    lbl_cd_ev_pagto_icms: TLabel;
    btn_co_ev_pagto_icms: TSpeedButton;
    dbedt_cd_ev_pagto_icms: TDBEdit;
    dbedt_nm_ev_pagto_icms: TDBEdit;
    lbl_nr_ult_fatura: TLabel;
    dbedt_nr_ult_fatura: TDBEdit;
    lbl_nr_ult_nota: TLabel;
    dbedt_nr_ult_nota: TDBEdit;
    GroupBox1: TGroupBox;
    Label13: TLabel;
    dblckbox_tp_ncm: TDBLookupComboBox;
    Label14: TLabel;
    dblckbox_tp_naladi: TDBLookupComboBox;
    ts_item1: TTabSheet;
    ts_item2: TTabSheet;
    lbl_item_receb_num: TLabel;
    btn_co_item_receb_num: TSpeedButton;
    btn_co_item_ir: TSpeedButton;
    lbl_item_ir: TLabel;
    lbl_item_devol_num: TLabel;
    btn_co_item_devol_num: TSpeedButton;
    btn_co_item_iss: TSpeedButton;
    lbl_item_iss: TLabel;
    lbl_item_extor_num: TLabel;
    btn_co_item_extor_num: TSpeedButton;
    btn_co_item_sda: TSpeedButton;
    lbl_item_sda: TLabel;
    lbl_item_cpmf: TLabel;
    btn_co_item_cpmf: TSpeedButton;
    btn_co_item_saldo_cre: TSpeedButton;
    lbl_item_saldo_cre: TLabel;
    lbl_item_comissao: TLabel;
    btn_co_item_comissao: TSpeedButton;
    btn_co_item_saldo_deb: TSpeedButton;
    lbl_item_saldo_deb: TLabel;
    lbl_item_exped: TLabel;
    btn_co_item_exped: TSpeedButton;
    btn_co_item_receb_sd: TSpeedButton;
    lbl_item_receb_sd: TLabel;
    lbl_item_afrmm: TLabel;
    btn_co_item_afrmm: TSpeedButton;
    btn_co_item_pagto_sd: TSpeedButton;
    lbl_item_pagto_sd: TLabel;
    lbl_item_desp_orig: TLabel;
    btn_co_item_desp_orig: TSpeedButton;
    btn_co_item_ext_receb: TSpeedButton;
    lbl_item_ext_receb: TLabel;
    lbl_item_nvocc: TLabel;
    btn_co_item_nvocc: TSpeedButton;
    btn_co_item_ext_pagto: TSpeedButton;
    lbl_item_ext_pagto: TLabel;
    lbl_item_nao_fat: TLabel;
    btn_co_item_nao_fat: TSpeedButton;
    dbedt_cd_item_receb_num: TDBEdit;
    dbedt_nm_item_receb_num: TDBEdit;
    dbedt_cd_item_ir: TDBEdit;
    dbedt_nm_item_ir: TDBEdit;
    dbedt_cd_item_devol_num: TDBEdit;
    dbedt_nm_item_devol_num: TDBEdit;
    dbedt_cd_item_iss: TDBEdit;
    dbedt_nm_item_iss: TDBEdit;
    dbedt_cd_item_extor_num: TDBEdit;
    dbedt_nm_item_extor_num: TDBEdit;
    dbedt_cd_item_sda: TDBEdit;
    dbedt_nm_item_sda: TDBEdit;
    dbedt_cd_item_cpmf: TDBEdit;
    dbedt_nm_item_cpmf: TDBEdit;
    dbedt_cd_item_saldo_cre: TDBEdit;
    dbedt_nm_item_saldo_cre: TDBEdit;
    dbedt_cd_item_comissao: TDBEdit;
    dbedt_nm_item_comissao: TDBEdit;
    dbedt_cd_item_saldo_deb: TDBEdit;
    dbedt_nm_item_saldo_deb: TDBEdit;
    dbedt_cd_item_exped: TDBEdit;
    dbedt_nm_item_exped: TDBEdit;
    dbedt_cd_item_receb_sd: TDBEdit;
    dbedt_nm_item_receb_sd: TDBEdit;
    dbedt_cd_item_afrmm: TDBEdit;
    dbedt_nm_item_afrmm: TDBEdit;
    dbedt_cd_item_pagto_sd: TDBEdit;
    dbedt_nm_item_pagto_sd: TDBEdit;
    dbedt_cd_item_desp_orig: TDBEdit;
    dbedt_nm_item_desp_orig: TDBEdit;
    dbedt_cd_item_ext_receb: TDBEdit;
    dbedt_nm_item_ext_receb: TDBEdit;
    dbedt_cd_item_nvocc: TDBEdit;
    dbedt_nm_item_nvocc: TDBEdit;
    dbedt_cd_item_ext_pagto: TDBEdit;
    dbedt_nm_item_ext_pagto: TDBEdit;
    dbedt_cd_item_nao_fat: TDBEdit;
    dbedt_nm_item_nao_fat: TDBEdit;
    lbl_item_icms: TLabel;
    btn_co_item_icms: TSpeedButton;
    lbl_item_frete_aereo: TLabel;
    btn_co_item_frete_aereo: TSpeedButton;
    lbl_item_frete_mar: TLabel;
    btn_co_item_frete_mar: TSpeedButton;
    lbl_item_seguro: TLabel;
    btn_co_item_seguro: TSpeedButton;
    lbl_item_vmle: TLabel;
    btn_co_item_vmle: TSpeedButton;
    lbl_item_acresc: TLabel;
    btn_co_item_acresc: TSpeedButton;
    lbl_item_ded: TLabel;
    btn_co_item_ded: TSpeedButton;
    lbl_item_siscomex: TLabel;
    btn_co_item_siscomex: TSpeedButton;
    dbedt_cd_item_icms: TDBEdit;
    dbedt_nm_item_icms: TDBEdit;
    dbedt_cd_item_frete_aereo: TDBEdit;
    dbedt_nm_item_frete_aereo: TDBEdit;
    dbedt_cd_item_frete_mar: TDBEdit;
    dbedt_nm_item_frete_mar: TDBEdit;
    dbedt_cd_item_seguro: TDBEdit;
    dbedt_nm_item_seguro: TDBEdit;
    dbedt_cd_item_vmle: TDBEdit;
    dbedt_nm_item_vmle: TDBEdit;
    dbedt_cd_item_acresc: TDBEdit;
    dbedt_nm_item_acresc: TDBEdit;
    dbedt_cd_item_ded: TDBEdit;
    dbedt_nm_item_ded: TDBEdit;
    dbedt_cd_item_siscomex: TDBEdit;
    dbedt_nm_item_siscomex: TDBEdit;
    btn_co_item_pago_cli: TSpeedButton;
    lbl_item_pago_cli: TLabel;
    dbedt_cd_item_pago_cli: TDBEdit;
    dbedt_nm_item_pago_cli: TDBEdit;
    lbl_mod_fat: TLabel;
    dblcpbox_tp_instal: TDBLookupComboBox;
    Label12: TLabel;
    dbedt_nr_ult_nf_serv: TDBEdit;
    lbl_mod_nf_serv: TLabel;
    dblcpbox_cd_mod_nf_serv: TDBLookupComboBox;
    ts_ct_contabil: TTabSheet;
    lbl_sistema_contabil: TLabel;
    dblckpbox_sistema_contabil: TDBLookupComboBox;
    lbl_dir_contab: TLabel;
    dbedt_path_contabil: TDBEdit;
    lbl_cd_ev_rec_fed: TLabel;
    dbedt_cd_ev_ent_rec_fed: TDBEdit;
    dbedt_nm_ev_ent_rec_fed: TDBEdit;
    btn_co_ev_ent_rec_fed: TSpeedButton;
    lbl_excel: TLabel;
    dbedt_path_excel: TDBEdit;
    lbl_word: TLabel;
    dbedt_path_word: TDBEdit;
    lbl_ddmap: TLabel;
    dbedt_path_ddmap: TDBEdit;
    lbl_path_cob_aut_imp: TLabel;
    dbedt_path_cob_aut_imp: TDBEdit;
    lbl_path_cob_aut_trans: TLabel;
    dbedt_path_cob_aut_trans: TDBEdit;
    ts_eventos_3: TTabSheet;
    Label17: TLabel;
    dbedt_cd_ev_remocao: TDBEdit;
    dbedt_nm_ev_remocao: TDBEdit;
    btn_co_ev_remocao: TSpeedButton;
    lbl_libera_di: TLabel;
    dblckpbox_libera_di: TDBLookupComboBox;
    lbl_cd_ct_caixa: TLabel;
    dbedt_cd_ct_caixa: TDBEdit;
    dbedt_nm_ct_caixa: TDBEdit;
    btn_co_cd_ct_caixa: TSpeedButton;
    lbl_cd_ct_ch_pagtos_div: TLabel;
    dbedt_cd_ct_ch_pagtos_div: TDBEdit;
    dbedt_nm_ct_ch_pagtos_div: TDBEdit;
    btn_co_cd_ct_ch_pagtos_div: TSpeedButton;
    lbl_cd_ct_fat_a_classif: TLabel;
    dbedt_cd_ct_fat_a_classif: TDBEdit;
    dbedt_nm_ct_fat_a_classif: TDBEdit;
    btn_co_cd_ct_fat_a_classif: TSpeedButton;
    Label18: TLabel;
    btn_co_ev_prev_carregamento: TSpeedButton;
    dbedt_cd_ev_prev_carregamento: TDBEdit;
    dbedt_nm_ev_prev_carregamento: TDBEdit;
    Label19: TLabel;
    btn_co_local_emissao_sp: TSpeedButton;
    dbedt_cd_local_emissao_sp: TDBEdit;
    dbedt_nm_local_emissao_sp: TDBEdit;
    lbl_item_servico_comissaria: TLabel;
    btn_co_item_servico_comissaria: TSpeedButton;
    dbedt_cd_item_servico_comissaria: TDBEdit;
    dbedt_nm_item_servico_comissaria: TDBEdit;
    Label20: TLabel;
    dbedt_cd_ev_abert_di: TDBEdit;
    dbedt_nm_ev_abertura_di: TDBEdit;
    btn_co_ev_abert_di: TSpeedButton;
    Label21: TLabel;
    dbedt_cd_ev_nf_entrada: TDBEdit;
    dbedt_nm_ev_nf_entrada: TDBEdit;
    btn_co_ev_nf_entrada: TSpeedButton;
    DBLookupComboBox2: TDBLookupComboBox;
    DBLookupComboBox3: TDBLookupComboBox;
    Label25: TLabel;
    Label26: TLabel;
    Label22: TLabel;
    dbedt_cd_ev_prev_entr_merc: TDBEdit;
    dbedt_nm_ev_prev_entr_merc: TDBEdit;
    btn_co_ev_prev_entr_merc: TSpeedButton;
    dbedt_cd_ev_nf_transp: TDBEdit;
    dbedt_nm_ev_nf_transp: TDBEdit;
    btn_co_ev_nf_transp: TSpeedButton;
    Label4: TLabel;
    lbl_ct_ctaapagar: TLabel;
    btn_co_cd_ct_ctaapagar: TSpeedButton;
    dbedt_cd_ct_ctaapagar: TDBEdit;
    dbedt_nm_ct_ctaapagar: TDBEdit;
    dblckpbox_gerencia_proc_vinc: TDBLookupComboBox;
    lbl_gerencia_proc_vinc: TLabel;
    Label6: TLabel;
    dbedt_cd_ev_cruze: TDBEdit;
    dbedt_nm_ev_cruze: TDBEdit;
    btn_co_ev_cruze: TSpeedButton;
    Label11: TLabel;
    dbedt_cd_ev_apresentacao: TDBEdit;
    dbedt_nm_ev_apresentacao: TDBEdit;
    btn_co_ev_apresentacao: TSpeedButton;
    ts_documento: TTabSheet;
    lbl_doc_nf_imp: TLabel;
    btn_co_doc_nf_imp: TSpeedButton;
    lbl_doc_fat_imp: TLabel;
    btn_co_doc_fat_imp: TSpeedButton;
    lbl_doc_re_imp: TLabel;
    btn_co_doc_re_imp: TSpeedButton;
    dbedt_cd_doc_nf_imp: TDBEdit;
    dbedt_nm_doc_nf_imp: TDBEdit;
    dbedt_cd_doc_fat_imp: TDBEdit;
    dbedt_nm_doc_fat_imp: TDBEdit;
    dbedt_cd_doc_re_imp: TDBEdit;
    dbedt_nm_doc_re_imp: TDBEdit;
    lbl_doc_nf_exp: TLabel;
    btn_co_doc_nf_exp: TSpeedButton;
    lbl_doc_fat_exp: TLabel;
    btn_co_doc_fat_exp: TSpeedButton;
    lbl_doc_re_exp: TLabel;
    btn_co_doc_re_exp: TSpeedButton;
    dbedt_cd_doc_nf_exp: TDBEdit;
    dbedt_nm_doc_nf_exp: TDBEdit;
    dbedt_cd_doc_fat_exp: TDBEdit;
    dbedt_nm_doc_fat_exp: TDBEdit;
    dbedt_cd_doc_re_exp: TDBEdit;
    dbedt_nm_doc_re_exp: TDBEdit;
    Label24: TLabel;
    dbedt_cd_ev_prev_fabrica: TDBEdit;
    dbedt_nm_ev_prev_fabrica: TDBEdit;
    btn_co_ev_prev_fabrica: TSpeedButton;
    Label27: TLabel;
    dbedt_path_nf_dbf: TDBEdit;
    Label28: TLabel;
    dblckbox_agrupa_itens_por_anexo: TDBLookupComboBox;
    lbl_quebra_por_vl_unit: TLabel;
    dblckbox_quebra_anexo_por_vl_unit: TDBLookupComboBox;
    lbl_ct_ir: TLabel;
    btn_co_cd_ct_ir: TSpeedButton;
    dbedt_cd_ct_ir: TDBEdit;
    dbedt_nm_ct_ir: TDBEdit;
    lbl_ct_inss: TLabel;
    btn_co_cd_ct_inss: TSpeedButton;
    dbedt_cd_ct_inss: TDBEdit;
    dbedt_nm_ct_inss: TDBEdit;
    Label23: TLabel;
    btn_co_ev_reg_dde: TSpeedButton;
    Label29: TLabel;
    btn_co_ev_reg_re: TSpeedButton;
    Label30: TLabel;
    btn_co_ev_insp_ok: TSpeedButton;
    dbedt_cd_ev_reg_dde: TDBEdit;
    dbedt_nm_ev_reg_dde: TDBEdit;
    dbedt_cd_ev_reg_re: TDBEdit;
    dbedt_nm_ev_reg_re: TDBEdit;
    dbedt_cd_ev_insp_ok: TDBEdit;
    dbedt_nm_ev_insp_ok: TDBEdit;
    Label31: TLabel;
    dblckbox_quebra_fabric: TDBLookupComboBox;
    lbl_vl_ir: TLabel;
    dbedt_vl_ir: TDBEdit;
    lbl_vl_min_irrf: TLabel;
    dbedt_vl_min_ir: TDBEdit;
    Label32: TLabel;
    dbedt_cd_ct_juros: TDBEdit;
    dbedt_nm_ct_juros: TDBEdit;
    btn_co_cd_ct_juros: TSpeedButton;
    Label33: TLabel;
    dbedt_cd_ct_desconto: TDBEdit;
    dbedt_nm_ct_desconto: TDBEdit;
    btn_co_cd_ct_desconto: TSpeedButton;
    Label34: TLabel;
    dbedt_cd_desconto: TDBEdit;
    dbedt_nm_desconto: TDBEdit;
    btn_co_item_desconto: TSpeedButton;
    ts_Cob_banc: TTabSheet;
    lbl_vl_mora_dia: TLabel;
    lbl_nr_remessa_inicial: TLabel;
    Label15: TLabel;
    lbl_cd_empresa_cob_aut: TLabel;
    dbedt_vl_perc_mora_dia_cob_aut: TDBEdit;
    dbedt_nr_remessa_cob_aut_inicial: TDBEdit;
    dbedt_nr_carteira_cob_aut: TDBEdit;
    dbedt_cd_empresa_cob_aut: TDBEdit;
    lbl_nr_boleto_inicial: TLabel;
    dbedt_nr_boleto_inicial: TDBEdit;
    lbl_bco_cob_aut: TLabel;
    dbedt_cd_banco_cob_aut: TDBEdit;
    dbedt_nm_banco_cob_aut: TDBEdit;
    btn_co_banco_cob_aut: TSpeedButton;
    dbedt_cd_carteira_cob_aut: TDBLookupComboBox;
    lbl_cd_carteira_cob_aut: TLabel;
    Label35: TLabel;
    DBLookupComboBox1: TDBLookupComboBox;
    Label36: TLabel;
    DBLookupComboBox4: TDBLookupComboBox;
    Label37: TLabel;
    DBLookupComboBox5: TDBLookupComboBox;
    DBLookupComboBox6: TDBLookupComboBox;
    Label38: TLabel;
    Label39: TLabel;
    dbedt_cd_ev_atracacao: TDBEdit;
    dbedt_nm_ev_atracacao: TDBEdit;
    btn_co_ev_atracacao: TSpeedButton;
    lbl_ct_ctareceber: TLabel;
    dbedt_cd_ct_ctaareceber: TDBEdit;
    dbedt_nm_ct_ctaareceber: TDBEdit;
    btn_co_cd_ct_ctaareceber: TSpeedButton;
    ts_ct_gerencial: TTabSheet;
    Label46: TLabel;
    dbedt_cd_ct_ger_ctaareceber: TDBEdit;
    dbedt_nm_ct_ger_ctaareceber: TDBEdit;
    btn_co_ct_ger_ctaareceber: TSpeedButton;
    Label47: TLabel;
    dbedt_cd_ct_ger_desconto: TDBEdit;
    dbedt_nm_ct_ger_desconto: TDBEdit;
    btn_co_ct_ger_desconto: TSpeedButton;
    Label48: TLabel;
    dbedt_cd_ct_ger_financeiro: TDBEdit;
    dbedt_nm_ct_ger_financeiro: TDBEdit;
    btn_co_ct_ger_financeiro: TSpeedButton;
    dblckpbox_in_arredonda_cpmf_item: TDBLookupComboBox;
    Label49: TLabel;
    Label51: TLabel;
    btn_co_ev_solic_cambio: TSpeedButton;
    dbedt_cd_ev_solic_cambio: TDBEdit;
    dbedt_nm_ev_solic_cambio: TDBEdit;
    Label52: TLabel;
    btn_co_ev_solic_seguro: TSpeedButton;
    dbedt_cd_ev_solic_seguro: TDBEdit;
    dbedt_nm_ev_solic_seguro: TDBEdit;
    Label53: TLabel;
    btn_co_ev_receb_seguro: TSpeedButton;
    dbedt_cd_ev_receb_seguro: TDBEdit;
    dbedt_nm_ev_receb_seguro: TDBEdit;
    Label54: TLabel;
    btn_co_ev_liberacao: TSpeedButton;
    dbedt_cd_ev_liberacao: TDBEdit;
    dbedt_nm_ev_liberacao: TDBEdit;
    Label55: TLabel;
    btn_co_ev_solic_ministerio: TSpeedButton;
    dbedt_cd_ev_solic_ministerio: TDBEdit;
    dbedt_nm_ev_solic_ministerio: TDBEdit;
    Label56: TLabel;
    btn_co_ev_receb_ministerio: TSpeedButton;
    dbedt_cd_ev_receb_ministerio: TDBEdit;
    dbedt_nm_ev_receb_ministerio: TDBEdit;
    Label50: TLabel;
    btn_co_ev_canal: TSpeedButton;
    dbedt_cd_ev_canal: TDBEdit;
    dbedt_nm_ev_canal: TDBEdit;
    Label57: TLabel;
    dbedt_path_work_image: TDBEdit;
    lbl_ct_contabil_lp: TLabel;
    btn_co_cd_ct_lp: TSpeedButton;
    dbedt_nm_ct_lp: TDBEdit;
    dbedt_cd_ct_lp: TDBEdit;
    lbl_nr_dias_entre_viagens: TLabel;
    dbedt_nr_dias_entre_viagens: TDBEdit;
    Label58: TLabel;
    Label59: TLabel;
    dbedt_cd_item_demurrage: TDBEdit;
    dbedt_nm_item_demurrage: TDBEdit;
    btn_co_item_demurrage: TSpeedButton;
    ts_demurrage: TTabSheet;
    grp_aviso: TGroupBox;
    Label60: TLabel;
    dbedt_nr_dias_desemb: TDBEdit;
    Label62: TLabel;
    dbedt_nr_dias_nf_transp: TDBEdit;
    Label63: TLabel;
    dbedt_nr_dias_demurrage: TDBEdit;
    Label61: TLabel;
    dbedt_nr_dias_ret_cntr: TDBEdit;
    Label64: TLabel;
    dblckpbox_aviso_dem: TDBLookupComboBox;
    lbl_usuario: TLabel;
    btn_co_usuario_demurrage: TSpeedButton;
    dbedt_cd_usuario_demurrage: TDBEdit;
    dbedt_nm_usuario_demurrage: TDBEdit;
    ts_entreposto: TTabSheet;
    Label16: TLabel;
    dbedt_cd_ev_venda_nac: TDBEdit;
    dbedt_cd_ev_envio_doc_nac: TDBEdit;
    Label65: TLabel;
    dbedt_nm_ev_envio_doc_nac: TDBEdit;
    dbedt_nm_ev_venda_nac: TDBEdit;
    btn_co_ev_venda_nac: TSpeedButton;
    btn_co_ev_envio_doc_nac: TSpeedButton;
    lbl_pc_max_seguro_di: TLabel;
    dbedt_pc_max_seguro_di: TDBEdit;
    ts_eventos_4: TTabSheet;
    Label73: TLabel;
    btn_co_env_comext: TSpeedButton;
    Label74: TLabel;
    btn_co_ev_lib_est: TSpeedButton;
    Label75: TLabel;
    btn_co_ev_form_dt: TSpeedButton;
    Label76: TLabel;
    btn_co_ev_lib_fab: TSpeedButton;
    Label77: TLabel;
    btn_co_ev_rec_dhl: TSpeedButton;
    dbedt_cd_env_comext: TDBEdit;
    dbedt_nm_env_comext: TDBEdit;
    dbedt_cd_ev_lib_est: TDBEdit;
    dbedt_nm_ev_lib_est: TDBEdit;
    dbedt_cd_ev_form_dt: TDBEdit;
    dbedt_nm_ev_form_dt: TDBEdit;
    dbedt_cd_ev_lib_fab: TDBEdit;
    dbedt_nm_ev_lib_fab: TDBEdit;
    dbedt_cd_ev_rec_dhl: TDBEdit;
    dbedt_nm_ev_rec_dhl: TDBEdit;
    Label40: TLabel;
    dbedt_cd_ev_email_lib: TDBEdit;
    dbedt_nm_ev_email_lib: TDBEdit;
    dbedt_cd_ev_conf_docs: TDBEdit;
    Label41: TLabel;
    dbedt_nm_ev_conf_docs: TDBEdit;
    btn_co_ev_conf_docs: TSpeedButton;
    btn_co_ev_email_lib: TSpeedButton;
    Label42: TLabel;
    btn_co_ev_solic_desova: TSpeedButton;
    dbedt_cd_ev_solic_desova: TDBEdit;
    dbedt_nm_ev_solic_desova: TDBEdit;
    Label43: TLabel;
    dbedt_nr_dias_vencto_ent_navio: TDBEdit;
    Label44: TLabel;
    btn_co_item_logistica: TSpeedButton;
    dbedt_cd_item_logistica: TDBEdit;
    dbedt_nm_item_logistica: TDBEdit;
    Label45: TLabel;
    dbedt_cd_ev_cert_origem: TDBEdit;
    dbedt_nm_ev_cert_origem: TDBEdit;
    btn_co_ev_cert_origem: TSpeedButton;
    Label78: TLabel;
    btn_co_ev_ped_rec: TSpeedButton;
    Label79: TLabel;
    btn_co_ev_entr_merc_fabr: TSpeedButton;
    dbedt_cd_ev_ped_rec: TDBEdit;
    dbedt_nm_ev_ped_rec: TDBEdit;
    dbedt_cd_ev_entr_merc_fabr: TDBEdit;
    dbedt_nm_ev_entr_merc_fabr: TDBEdit;
    dbedt_cd_ev_dt_necessidade: TDBEdit;
    dbedt_nm_ev_dt_necessidade: TDBEdit;
    DBGrid1: TDBGrid;
    Label81: TLabel;
    Label83: TLabel;
    btn_co_ev_envio_doc_cli: TSpeedButton;
    dbedt_cd_ev_envio_doc_cli: TDBEdit;
    dbedt_nm_ev_envio_doc_cli: TDBEdit;
    Label84: TLabel;
    dbedt_cd_ev_entr_eadi: TDBEdit;
    dbedt_nm_ev_entr__eadi: TDBEdit;
    btn_co_ev_entr_eadi: TSpeedButton;
    dbedt_cd_ev_dt_consolidacao: TDBEdit;
    dbedt_nm_ev_dt_consolidacao: TDBEdit;
    Label86: TLabel;
    btn_co_ev_dt_consolidacao: TSpeedButton;
    dbedt_cd_ev_receb_ped: TDBEdit;
    dbedt_nm_ev_receb_ped: TDBEdit;
    Label87: TLabel;
    btn_co_ev_receb_ped: TSpeedButton;
    dbedt_cd_ev_solic_ov: TDBEdit;
    Label88: TLabel;
    dbedt_nm_ev_solic_ov: TDBEdit;
    btn_co_ev_solic_ov: TSpeedButton;
    Label89: TLabel;
    dbedt_cd_ev_solic_remessa: TDBEdit;
    dbedt_nm_ev_solic_remessa: TDBEdit;
    btn_co_ev_solic_remessa: TSpeedButton;
    dbedt_cd_item_cofins: TDBEdit;
    Label90: TLabel;
    dbedt_nm_item_cofins: TDBEdit;
    btn_co_item_cofins: TSpeedButton;
    Label91: TLabel;
    dbedt_cd_item_cofins_ret: TDBEdit;
    dbedt_nm_item_cofins_ret: TDBEdit;
    btn_co_item_cofins_ret: TSpeedButton;
    ts_impostos: TTabSheet;
    dbedt_vl_cofins: TDBEdit;
    Label92: TLabel;
    Label93: TLabel;
    dbedt_vl_cofins_ret: TDBEdit;
    Label94: TLabel;
    dbedt_cd_ev_dta_transp: TDBEdit;
    dbedt_nm_ev_dta_transp: TDBEdit;
    btn_co_ev_dta_transp: TSpeedButton;
    Label95: TLabel;
    dbedt_cd_ev_param_dta: TDBEdit;
    dbedt_nm_ev_param_dta: TDBEdit;
    btn_co_ev_param_dta: TSpeedButton;
    ts_eventos_5: TTabSheet;
    dbedt_cd_ev_pres_carga_eadi: TDBEdit;
    dbedt_nm_ev_pres_carga_eadi: TDBEdit;
    Label96: TLabel;
    btn_co_ev_pres_carga_eadi: TSpeedButton;
    Label97: TLabel;
    dbedt_cd_ev_registro_dta: TDBEdit;
    dbedt_nm_ev_registro_dta: TDBEdit;
    btn_co_ev_registro_dta: TSpeedButton;
    Label98: TLabel;
    dbedt_cd_item_mp164: TDBEdit;
    dbedt_nm_item_mp164: TDBEdit;
    btn_co_item_mp164: TSpeedButton;
    dbchk_mp164: TDBCheckBox;
    DBCheckBox1: TDBCheckBox;
    Label99: TLabel;
    dbedt_cd_item_pis_imp: TDBEdit;
    dbedt_nm_item_pis_imp: TDBEdit;
    btn_co_item_pis_imp: TSpeedButton;
    Label100: TLabel;
    dbedt_cd_item_cofins_imp: TDBEdit;
    dbedt_nm_item_cofins_imp: TDBEdit;
    btn_co_item_cofins_imp: TSpeedButton;
    Label101: TLabel;
    dbedt_vl_min_di: TDBEdit;
    Label102: TLabel;
    DBEdit1: TDBEdit;
    dbedt_vl_remessa: TDBEdit;
    Label103: TLabel;
    DBCheckBox67: TDBCheckBox;
    ts_integracao_contabil: TTabSheet;
    Label104: TLabel;
    Label105: TLabel;
    Label106: TLabel;
    DBEdit10: TDBEdit;
    DBEdit11: TDBEdit;
    dbedt_dt_fech_ctbl: TDBDateEdit;
    Label107: TLabel;
    DBEdit2: TDBEdit;
    Label110: TLabel;
    dbedt_nr_ult_dem: TDBEdit;
    Label111: TLabel;
    dbedt_vl_min_ted: TDBEdit;
    Label113: TLabel;
    dbedt_nr_ult_rd: TDBEdit;
    ts_grupo_enac: TTabSheet;
    bvl_grupo_enac: TBevel;
    lbl_grupo_basf: TLabel;
    btn_co_grupo_basf: TSpeedButton;
    lbl_grupo_bsg: TLabel;
    btn_co_grupo_bsg: TSpeedButton;
    lbl_grupo_oxiteno: TLabel;
    btn_co_grupo_oxiteno: TSpeedButton;
    lbl_grupo_valspar: TLabel;
    btn_co_grupo_valspar: TSpeedButton;
    lbl_grupo_valtra: TLabel;
    btn_co_grupo_valtra: TSpeedButton;
    lbl_grupo_croda: TLabel;
    btn_co_grupo_croda: TSpeedButton;
    dbedt_cd_grupo_basf: TDBEdit;
    dbedt_nm_grupo_basf: TDBEdit;
    dbedt_cd_grupo_bsg: TDBEdit;
    dbedt_nm_grupo_bsg: TDBEdit;
    dbedt_cd_grupo_oxiteno: TDBEdit;
    dbedt_nm_grupo_oxiteno: TDBEdit;
    dbedt_cd_grupo_valspar: TDBEdit;
    dbedt_nm_grupo_valspar: TDBEdit;
    dbedt_cd_grupo_valtra: TDBEdit;
    dbedt_nm_grupo_valtra: TDBEdit;
    dbedt_cd_grupo_croda: TDBEdit;
    dbedt_nm_grupo_croda: TDBEdit;
    btn_co_grupo_saintg: TSpeedButton;
    lbl_grupo_saintg: TLabel;
    dbedt_nm_grupo_saintg: TDBEdit;
    dbedt_cd_grupo_saintg: TDBEdit;
    lbl_grupo_bsh: TLabel;
    dbedt_cd_grupo_bsh: TDBEdit;
    dbedt_nm_grupo_bsh: TDBEdit;
    btn_co_grupo_bsh: TSpeedButton;
    bvl_solic_cheque: TBevel;
    bvl_geral: TBevel;
    bvl_eventos_1: TBevel;
    bvl_eventos_2: TBevel;
    bvl_eventos_3: TBevel;
    bvl_eventos_4: TBevel;
    bvl_eventos_5: TBevel;
    bvl_doctos: TBevel;
    bvl_impostos: TBevel;
    bvl_int_contabil: TBevel;
    bvl_entreposto: TBevel;
    bvl_int_bancaria: TBevel;
    bvl_itens_1: TBevel;
    bvl_contas_contabeis: TBevel;
    bvl_contas_gerenciais: TBevel;
    bvl_itens_2: TBevel;
    Label66: TLabel;
    dbedt_cd_item_pis_cofins: TDBEdit;
    dbedt_nm_item_pis_cofins: TDBEdit;
    btn_co_item_pis_cofins: TSpeedButton;
    lbl1: TLabel;
    dbedtCdEvEntFabr: TDBEdit;
    dbedtNmEvEntFabr: TDBEdit;
    btnCoEvEntFabr: TSpeedButton;
    Label67: TLabel;
    DBEdit3: TDBEdit;
    DBEdit4: TDBEdit;
    Label68: TLabel;
    lbl_item_ii: TLabel;
    dbedt_cd_item_ii: TDBEdit;
    dbedt_nm_item_ii: TDBEdit;
    btn_co_item_ii: TSpeedButton;
    lbl_item_ipi: TLabel;
    dbedt_cd_item_ipi: TDBEdit;
    dbedt_nm_item_ipi: TDBEdit;
    btn_co_item_ipi: TSpeedButton;
    Label69: TLabel;
    dbedt_cd_item_frt_mar_fi: TDBEdit;
    dbedt_nm_item_frt_mar_fi: TDBEdit;
    btn_co_item_frt_mar_fi: TSpeedButton;
    Label70: TLabel;
    dbedt_cd_item_frt_aer_fi: TDBEdit;
    dbedt_nm_item_frt_aer_fi: TDBEdit;
    btn_co_item_frt_aer_fi: TSpeedButton;
    Label71: TLabel;
    dbedt_cd_item_frt_rod_fi: TDBEdit;
    dbedt_nm_item_frt_rod_fi: TDBEdit;
    btn_co_item_frt_rod_fi: TSpeedButton;
    Label72: TLabel;
    dbedt_cd_item_frt_seguro: TDBEdit;
    DBEdit6: TDBEdit;
    btn_co_item_frt_seguro: TSpeedButton;
    procedure btn_salvarClick(Sender: TObject);
    procedure btn_cancelarClick(Sender: TObject);
    procedure btn_sairClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure dbedt_dt_solic_chChange(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure btn_co_ev_reg_diClick(Sender: TObject);
    procedure dbedt_cd_ev_reg_diExit(Sender: TObject);
    procedure dbedt_cd_ev_conhecimentoExit(Sender: TObject);
    procedure dbedt_cd_ev_pagto_liExit(Sender: TObject);
    procedure dbedt_cd_ev_espera_navioExit(Sender: TObject);
    procedure dbedt_cd_ev_entExit(Sender: TObject);
    procedure dbedt_cd_ev_envio_saque_borderoExit(Sender: TObject);
    procedure dbedt_cd_ev_insp_maExit(Sender: TObject);
    procedure dbedt_cd_ev_prev_desembExit(Sender: TObject);
    procedure dbedt_cd_ev_desembExit(Sender: TObject);
    procedure dbedt_cd_ev_descargaExit(Sender: TObject);
    procedure dbedt_cd_ev_prev_chegadaExit(Sender: TObject);
    procedure dbedt_cd_ev_chegadaExit(Sender: TObject);
    procedure dbedt_cd_ev_etdExit(Sender: TObject);
    procedure dbedt_cd_ev_dig_diExit(Sender: TObject);
    procedure dbedt_cd_ev_ciExit(Sender: TObject);
    procedure dbedt_cd_ev_recep_analiseExit(Sender: TObject);
    procedure dbedt_cd_ev_receb_docExit(Sender: TObject);
    procedure dbedt_cd_ev_abre_procExit(Sender: TObject);
    procedure dbedt_cd_ev_num_impExit(Sender: TObject);
    procedure dbedt_cd_ev_rec_impExit(Sender: TObject);
    procedure dbedt_cd_ev_num_freteExit(Sender: TObject);
    procedure dbedt_cd_ev_rec_freteExit(Sender: TObject);
    procedure dbedt_cd_ev_num_expExit(Sender: TObject);
    procedure dbedt_cd_ev_rec_expExit(Sender: TObject);
    procedure dbedt_cd_ev_pres_cargaExit(Sender: TObject);
    procedure dbedt_cd_ev_vencto_liExit(Sender: TObject);
    procedure dbedt_cd_ev_desovaExit(Sender: TObject);
    procedure dbedt_cd_ev_lib_blExit(Sender: TObject);
    procedure dbedt_cd_ev_pag_demurExit(Sender: TObject);
    procedure dbedt_cd_ev_pagto_icmsExit(Sender: TObject);
    procedure dbedt_cd_ev_pag_armExit(Sender: TObject);
    procedure dbedt_cd_ev_pag_sdaExit(Sender: TObject);
    procedure dbedt_cd_ev_envio_impExit(Sender: TObject);
    procedure dbedt_cd_ev_envio_fatExit(Sender: TObject);
    procedure dbedt_cd_ev_cambio_okExit(Sender: TObject);
    procedure dbedt_cd_ev_prev_embarqueExit(Sender: TObject);
    procedure dbedt_cd_ev_embarqueExit(Sender: TObject);
    procedure dbedt_cd_ev_entrega_mercExit(Sender: TObject);
    procedure dbedt_cd_ev_averbacaoExit(Sender: TObject);
    procedure dbedt_cd_ev_reg_diKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure btn_co_item_receb_numClick(Sender: TObject);
    procedure dbedt_cd_item_receb_numExit(Sender: TObject);
    procedure dbedt_cd_item_devol_numExit(Sender: TObject);
    procedure dbedt_cd_item_extor_numExit(Sender: TObject);
    procedure dbedt_cd_item_cpmfExit(Sender: TObject);
    procedure dbedt_cd_item_comissaoExit(Sender: TObject);
    procedure dbedt_cd_item_expedExit(Sender: TObject);
    procedure dbedt_cd_item_afrmmExit(Sender: TObject);
    procedure dbedt_cd_item_desp_origExit(Sender: TObject);
    procedure dbedt_cd_item_nvoccExit(Sender: TObject);
    procedure dbedt_cd_item_nao_fatExit(Sender: TObject);
    procedure dbedt_cd_item_irExit(Sender: TObject);
    procedure dbedt_cd_item_issExit(Sender: TObject);
    procedure dbedt_cd_item_sdaExit(Sender: TObject);
    procedure dbedt_cd_item_saldo_creExit(Sender: TObject);
    procedure dbedt_cd_item_saldo_debExit(Sender: TObject);
    procedure dbedt_cd_item_receb_sdExit(Sender: TObject);
    procedure dbedt_cd_item_pagto_sdExit(Sender: TObject);
    procedure dbedt_cd_item_ext_recebExit(Sender: TObject);
    procedure dbedt_cd_item_ext_pagtoExit(Sender: TObject);
    procedure dbedt_cd_item_pago_cliExit(Sender: TObject);
    procedure dbedt_cd_item_iiExit(Sender: TObject);
    procedure dbedt_cd_item_ipiExit(Sender: TObject);
    procedure dbedt_cd_item_icmsExit(Sender: TObject);
    procedure dbedt_cd_item_frete_aereoExit(Sender: TObject);
    procedure dbedt_cd_item_frete_marExit(Sender: TObject);
    procedure dbedt_cd_item_seguroExit(Sender: TObject);
    procedure dbedt_cd_item_vmleExit(Sender: TObject);
    procedure dbedt_cd_item_acrescExit(Sender: TObject);
    procedure dbedt_cd_item_dedExit(Sender: TObject);
    procedure dbedt_cd_item_siscomexExit(Sender: TObject);
    procedure dbedt_cd_ev_ent_rec_fedExit(Sender: TObject);
    procedure dbedt_cd_banco_cob_autExit(Sender: TObject);
    procedure btn_co_banco_cob_autClick(Sender: TObject);
    procedure dbedt_nr_carteira_cob_autExit(Sender: TObject);
    procedure btn_co_cd_ct_caixaClick(Sender: TObject);
    procedure btn_co_cd_ct_ch_pagtos_divClick(Sender: TObject);
    procedure btn_co_cd_ct_fat_a_classifClick(Sender: TObject);
    procedure dbedt_cd_ct_caixaExit(Sender: TObject);
    procedure dbedt_cd_ct_ch_pagtos_divExit(Sender: TObject);
    procedure dbedt_cd_ct_fat_a_classifExit(Sender: TObject);
    procedure dbedt_cd_ev_remocaoExit(Sender: TObject);
    procedure dbedt_cd_ev_prev_carregamentoExit(Sender: TObject);
    procedure btn_co_local_emissao_spClick(Sender: TObject);
    procedure dbedt_cd_local_emissao_spExit(Sender: TObject);
    procedure dbedt_cd_item_servico_comissariaExit(Sender: TObject);
    procedure dbedt_cd_ev_abert_diExit(Sender: TObject);
    procedure dbedt_cd_ev_nf_entradaExit(Sender: TObject);
    procedure dbedt_cd_ev_prev_entr_mercExit(Sender: TObject);
    procedure dbedt_cd_ev_nf_transpExit(Sender: TObject);
    procedure btn_co_cd_ct_ctaapagarClick(Sender: TObject);
    procedure dbedt_cd_ct_ctaapagarExit(Sender: TObject);
    procedure dbedt_cd_ev_cruzeExit(Sender: TObject);
    procedure dbedt_cd_ev_apresentacaoExit(Sender: TObject);
    procedure dbedt_cd_doc_nf_impExit(Sender: TObject);
    procedure dbedt_cd_doc_fat_impExit(Sender: TObject);
    procedure dbedt_cd_doc_re_impExit(Sender: TObject);
    procedure btn_co_doc_nf_impClick(Sender: TObject);
    procedure dbedt_cd_doc_nf_expExit(Sender: TObject);
    procedure dbedt_cd_doc_fat_expExit(Sender: TObject);
    procedure dbedt_cd_doc_re_expExit(Sender: TObject);
    procedure dbedt_cd_ev_prev_fabricaExit(Sender: TObject);
    procedure pgctrl_paramChange(Sender: TObject);
    procedure dblckbox_agrupa_itens_por_anexoClick(Sender: TObject);
    procedure dbedt_cd_ct_irExit(Sender: TObject);
    procedure dbedt_cd_ct_inssExit(Sender: TObject);
    procedure btn_co_cd_ct_irClick(Sender: TObject);
    procedure btn_co_cd_ct_inssClick(Sender: TObject);
    procedure dbedt_cd_ev_reg_ddeExit(Sender: TObject);
    procedure dbedt_cd_ev_reg_reExit(Sender: TObject);
    procedure dbedt_cd_ev_insp_okExit(Sender: TObject);
    procedure btn_co_cd_ct_jurosClick(Sender: TObject);
    procedure dbedt_cd_ct_descontoExit(Sender: TObject);
    procedure dbedt_cd_ct_jurosExit(Sender: TObject);
    procedure btn_co_cd_ct_descontoClick(Sender: TObject);
    procedure dbedt_cd_descontoExit(Sender: TObject);
    procedure dbedt_nm_banco_cob_autChange(Sender: TObject);
    procedure dbedt_cd_carteira_cob_autExit(Sender: TObject);
    procedure dbedt_cd_ev_atracacaoExit(Sender: TObject);
    procedure dbedt_cd_ct_ctaareceberExit(Sender: TObject);
    procedure btn_co_cd_ct_ctaareceberClick(Sender: TObject);
    procedure btn_co_ct_ger_ctaareceberClick(Sender: TObject);
    procedure dbedt_cd_ct_ger_ctaareceberExit(Sender: TObject);
    procedure dbedt_cd_ct_ger_descontoExit(Sender: TObject);
    procedure dbedt_cd_ct_ger_financeiroExit(Sender: TObject);
    procedure btn_co_ct_ger_descontoClick(Sender: TObject);
    procedure btn_co_ct_ger_financeiroClick(Sender: TObject);
    procedure dbedt_cd_ev_solic_cambioExit(Sender: TObject);
    procedure dbedt_cd_ev_solic_seguroExit(Sender: TObject);
    procedure dbedt_cd_ev_receb_seguroExit(Sender: TObject);
    procedure dbedt_cd_ev_solic_ministerioExit(Sender: TObject);
    procedure dbedt_cd_ev_receb_ministerioExit(Sender: TObject);
    procedure dbedt_cd_ev_canalExit(Sender: TObject);
    procedure dbedt_cd_ev_liberacaoExit(Sender: TObject);
    procedure btn_co_cd_ct_lpClick(Sender: TObject);
    procedure dbedt_cd_item_demurrageExit(Sender: TObject);
    procedure btn_co_usuario_demurrageClick(Sender: TObject);
    procedure dbedt_cd_usuario_demurrageExit(Sender: TObject);
    procedure dbedt_cd_ev_venda_nacExit(Sender: TObject);
    procedure dbedt_cd_ev_envio_doc_nacExit(Sender: TObject);
    procedure btn_co_ev_venda_nacClick(Sender: TObject);
    procedure btn_co_ev_envio_doc_nacClick(Sender: TObject);
    procedure dbedt_cd_grupo_basfExit(Sender: TObject);
    procedure btn_co_grupo_basfClick(Sender: TObject);
    procedure dbedt_cd_env_comextExit(Sender: TObject);
    procedure dbedt_cd_ev_lib_estExit(Sender: TObject);
    procedure dbedt_cd_ev_form_dtExit(Sender: TObject);
    procedure dbedt_cd_ev_lib_fabExit(Sender: TObject);
    procedure dbedt_cd_ev_rec_dhlExit(Sender: TObject);
    procedure dbedt_cd_ev_email_libExit(Sender: TObject);
    procedure dbedt_cd_ev_conf_docsExit(Sender: TObject);
    procedure dbedt_cd_ev_solic_desovaExit(Sender: TObject);
    procedure dbedt_cd_item_logisticaChange(Sender: TObject);
    procedure dbedt_cd_item_logisticaExit(Sender: TObject);
    procedure dbedt_cd_ev_cert_origemChange(Sender: TObject);
    procedure dbedt_cd_ev_cert_origemExit(Sender: TObject);
    procedure dbedt_cd_ev_ped_recExit(Sender: TObject);
    procedure dbedt_cd_ev_entr_merc_fabrExit(Sender: TObject);
    procedure dbedt_cd_ev_dt_necessidadeExit(Sender: TObject);
    procedure btn_co_grupo_bsgClick(Sender: TObject);
    procedure dbedt_cd_grupo_bsgExit(Sender: TObject);
    procedure btn_co_grupo_oxitenoClick(Sender: TObject);
    procedure dbedt_cd_grupo_oxitenoExit(Sender: TObject);
    procedure dbedt_cd_ev_envio_doc_cliExit(Sender: TObject);
    procedure dbedt_cd_ev_entr_eadiExit(Sender: TObject);
    procedure dbedt_cd_ev_dt_consolidacaoExit(Sender: TObject);
    procedure dbedt_cd_ev_receb_pedExit(Sender: TObject);
    procedure dbedt_cd_ev_solic_ovExit(Sender: TObject);
    procedure dbedt_cd_ev_solic_remessaExit(Sender: TObject);
    procedure dbedt_cd_item_cofinsExit(Sender: TObject);
    procedure dbedt_cd_item_cofins_retExit(Sender: TObject);
    procedure dbedt_cd_ev_dta_transpExit(Sender: TObject);
    procedure dbedt_cd_ev_param_dtaExit(Sender: TObject);
    procedure dbedt_cd_ev_pres_carga_eadiExit(Sender: TObject);
    procedure dbedt_cd_ev_registro_dtaExit(Sender: TObject);
    procedure dbedt_cd_item_mp164Exit(Sender: TObject);
    procedure dbedt_cd_item_pis_impExit(Sender: TObject);
    procedure dbedt_cd_item_cofins_impExit(Sender: TObject);
    procedure dbedt_cd_grupo_valsparExit(Sender: TObject);
    procedure btn_co_grupo_valsparClick(Sender: TObject);
    procedure dbedt_cd_grupo_valtraExit(Sender: TObject);
    procedure btn_co_grupo_valtraClick(Sender: TObject);
    procedure dbedt_cd_grupo_crodaExit(Sender: TObject);
    procedure btn_co_grupo_crodaClick(Sender: TObject);
    procedure dbedt_cd_grupo_saintgExit(Sender: TObject);
    procedure dbedt_cd_grupo_bshExit(Sender: TObject);
    procedure btn_co_grupo_saintgClick(Sender: TObject);
    procedure btn_co_grupo_bshClick(Sender: TObject);
    procedure dbedt_cd_item_pis_cofinsExit(Sender: TObject);
    procedure dbedtCdEvEntFabrExit(Sender: TObject);
    procedure dbedt_cd_item_frt_mar_fiExit(Sender: TObject);
    procedure dbedt_cd_item_frt_aer_fiExit(Sender: TObject);
    procedure dbedt_cd_item_frt_rod_fiExit(Sender: TObject);
    procedure dbedt_cd_item_frt_seguroExit(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frm_param_sistema: Tfrm_param_sistema;

implementation

uses GSMLIB, PGGP001, PGSM016, PGSM036, PGSM041, PGSM059, PGSM102, PGSM119, PGSM168,
     PGSM170, PGSM192, PGSM208;

{$R *.DFM}

procedure Tfrm_param_sistema.btn_salvarClick(Sender: TObject);
begin
  with datm_param_sistema do
  begin
    ActiveControl := nil;
    if ( qry_param_dem_.State in [dsEdit] ) then
      Commit( qry_param_dem_ );

    if ( qry_parametros_.State in [dsEdit] ) then
      qry_parametros_.Post;

    btn_salvar.Enabled   := False;
    btn_cancelar.Enabled := False;
    mi_salvar.Enabled    := False;
    mi_cancelar.Enabled  := False;

    //cDir_Rpt            := Trim( qry_parametros_PATH_RELATORIOS.AsString );
    //cDir_Scx            := Trim( qry_parametros_PATH_SISCOMEX.AsString );

    cDir_Risc            := Trim( qry_parametros_PATH_RISC.AsString );

    str_nm_servidor      := Trim( qry_parametros_NM_SERVIDOR.AsString );
  end;
end;

procedure Tfrm_param_sistema.btn_cancelarClick(Sender: TObject);
begin
  with datm_param_sistema do
  begin
    if ( qry_param_dem_.State in [dsEdit] ) then
      qry_param_dem_.CancelUpdates;

    if ( qry_parametros_.State in [dsEdit] ) then
      qry_parametros_.Cancel;

    btn_salvar.Enabled   := False;
    btn_cancelar.Enabled := False;
    mi_salvar.Enabled    := False;
    mi_cancelar.Enabled  := False;
  end;
end;

procedure Tfrm_param_sistema.btn_sairClick(Sender: TObject);
begin
  with datm_param_sistema do
  begin
    qry_parametros_.Close;
    qry_sistema_contabil_.Close;
    qry_tp_mod_fat_.Close;
    qry_tp_naladi_.Close;
    qry_tp_ncm_.Close;
    qry_yes_no_.Close;
    qry_carteira_.Close;
    qry_cadastramento_.Close;
    Close;
  end;
end;

procedure Tfrm_param_sistema.FormClose(Sender: TObject; var Action: TCloseAction);
begin
 with datm_param_sistema do
 begin
   qry_parametros_.Close;
   qry_param_dem_.Close;
   tbl_tp_instal_.Close;
   qry_tp_ncm_.Close;
   qry_tp_naladi_.Close;
   qry_yes_no_.Close;
   qry_carteira_.Close;
   qry_cadastramento_.Close;

   Free;

   Action := caFree;
 end;
end;

procedure Tfrm_param_sistema.dbedt_dt_solic_chChange(Sender: TObject);
begin
  btn_salvar.Enabled   := True;
  btn_cancelar.Enabled := True;
  mi_salvar.Enabled    := True;
  mi_cancelar.Enabled  := True;
end;

procedure Tfrm_param_sistema.FormShow(Sender: TObject);
var
   st_modificar : boolean;
   st_incluir   : boolean;
   st_excluir   : boolean;
begin
  with datm_param_sistema do
  begin
    qry_parametros_.Close;
    qry_param_dem_.Close;
    tbl_tp_instal_.Close;
    qry_tp_ncm_.Close;
    qry_sistema_contabil_.Close;
    qry_tp_mod_fat_.Close;
    qry_tp_naladi_.Close;
    qry_yes_no_.Close;

    qry_parametros_.Prepare;
    qry_param_dem_.Prepare;
    qry_tp_ncm_.Prepare;
    qry_sistema_contabil_.Prepare;
    qry_tp_mod_fat_.Prepare;
    qry_tp_naladi_.Prepare;
    qry_yes_no_.Prepare;

    qry_parametros_.Open;
    qry_param_dem_.Open;
    tbl_tp_instal_.Open;
    qry_tp_ncm_.Open;
    qry_sistema_contabil_.Open;
    qry_tp_mod_fat_.Open;
    qry_tp_naladi_.Open;
    qry_yes_no_.Open;

    qry_ct_contabilRM_.Close;
    qry_ct_contabilRM_.Prepare;
    qry_ct_contabilRM_.Open;

    qry_tp_at_basf_.Close;
    qry_tp_at_basf_.Prepare;
    qry_tp_at_basf_.Open;

    dbedt_nm_ct_caixa.DataField         := 'LookCtCaixa';
    dbedt_nm_ct_ch_pagtos_div.DataField := 'LookCtChPagtosDiv';
    dbedt_nm_ct_fat_a_classif.DataField := 'LookCtFatAClassif';
    dbedt_nm_ct_ctaapagar.DataField     := 'LookCtCtaAPagar';
    dbedt_nm_ct_ir.DataField            := 'LookCtIR';
    dbedt_nm_ct_inss.DataField          := 'LookCtINSS';
    dbedt_nm_ct_juros.DataField         := 'LookCtJuros';
    dbedt_nm_ct_desconto.DataField      := 'LookCtDesconto';
    dbedt_nm_ct_ctaareceber.DataField   := 'LookCtCtaAReceber';

    dbedt_nm_ct_ger_ctaareceber.DataField := 'LookCtGerCtaAReceber';
    dbedt_nm_ct_ger_desconto.DataField    := 'LookCtGerDesconto';
    dbedt_nm_ct_ger_financeiro.DataField  := 'LookCtGerFinanceiro';

    {qry_parametros_.FieldByName('CD_CT_CAIXA').EditMask             := '999.99.99999;0;_';
    qry_parametros_.FieldByName('CD_CT_CH_PAGTOS_DIV').EditMask     := '999.99.99999;0;_';
    qry_parametros_.FieldByName('CD_CT_FAT_A_CLASSIF').EditMask     := '999.99.99999;0;_';
    qry_parametros_.FieldByName('CD_CT_CTAAPAGAR').EditMask         := '999.99.99999;0;_';
    qry_parametros_.FieldByName('CD_CT_IR').EditMask                := '999.99.99999;0;_';
    qry_parametros_.FieldByName('CD_CT_INSS').EditMask              := '999.99.99999;0;_';
    qry_parametros_.FieldByName('CD_CT_CONTABIL_JUROS').EditMask    := '999.99.99999;0;_';
    qry_parametros_.FieldByName('CD_CT_CONTABIL_DESCONTO').EditMask := '999.99.99999;0;_';
    qry_parametros_.FieldByName('CD_CT_CTAARECEBER').EditMask       := '999.99.99999;0;_';}

    st_modificar := False;
    st_incluir   := False;
    st_excluir   := False;

    AtribuiDireitos(st_modificar, st_incluir, st_excluir);

    ds_parametros.AutoEdit := st_modificar;

    pgctrl_param.ActivePage := ts_geral;
  end;

  btn_salvar.Enabled   := False;
  btn_cancelar.Enabled := False;
  mi_salvar.Enabled    := False;
  mi_cancelar.Enabled  := False;
end;

procedure Tfrm_param_sistema.FormCreate(Sender: TObject);
begin
  // Cria o DataModule do Usuario
  Application.CreateForm(Tdatm_param_sistema, datm_param_sistema);
end;

procedure Tfrm_param_sistema.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #27 then Close;
end;

procedure Tfrm_param_sistema.btn_co_ev_reg_diClick(Sender: TObject);
begin
  Application.CreateForm( Tfrm_evento, frm_evento );
  with frm_evento, datm_param_sistema do
  begin
    // Tela 1 - Coluna 1
    if ( Sender = dbedt_cd_ev_reg_di ) or ( Sender = btn_co_ev_reg_di ) then
       Cons_OnLine := qry_parametros_CD_EV_REG_DI;
    if ( Sender = dbedt_cd_ev_conhecimento ) or ( Sender = btn_co_ev_conhecimento ) then
       Cons_OnLine := qry_parametros_CD_EV_CONHECIMENTO;
    if ( Sender = dbedt_cd_ev_pagto_li ) or ( Sender = btn_co_ev_pagto_li ) then
       Cons_OnLine := qry_parametros_CD_EV_PAGTO_LI;
    if ( Sender = dbedt_cd_ev_espera_navio ) or ( Sender = btn_co_ev_espera_navio ) then
       Cons_OnLine := qry_parametros_CD_EV_ESPERA_NAVIO;
    if ( Sender = dbedt_cd_ev_ent ) or ( Sender = btn_co_ev_ent ) then
       Cons_OnLine := qry_parametros_CD_EV_ENT;
    if ( Sender = dbedt_cd_ev_envio_saque_bordero ) or ( Sender = btn_co_ev_envio_saque_bordero ) then
       Cons_OnLine := qry_parametros_CD_EV_ENVIO_SAQUE_BORDERO;
    if ( Sender = dbedt_cd_ev_insp_ma ) or ( Sender = btn_co_ev_insp_ma ) then
       Cons_OnLine := qry_parametros_CD_EV_INSP_MA;
    if ( Sender = dbedt_cd_ev_prev_desemb ) or ( Sender = btn_co_ev_prev_desemb ) then
       Cons_OnLine := qry_parametros_CD_EV_PREV_DESEMB;
    if ( Sender = dbedt_cd_ev_desemb ) or ( Sender = btn_co_ev_desemb ) then
       Cons_OnLine := qry_parametros_CD_EV_DESEMB;
    if ( Sender = dbedt_cd_ev_descarga ) or ( Sender = btn_co_ev_descarga ) then
       Cons_OnLine := qry_parametros_CD_EV_DESCARGA;
    // Tela 1 - Coluna 2
    if ( Sender = dbedt_cd_ev_prev_chegada ) or ( Sender = btn_co_ev_prev_chegada ) then
       Cons_OnLine := qry_parametros_CD_EV_PREV_CHEGADA;
    if ( Sender = dbedt_cd_ev_chegada ) or ( Sender = btn_co_ev_chegada ) then
       Cons_OnLine := qry_parametros_CD_EV_CHEGADA;
    if ( Sender = dbedt_cd_ev_etd ) or ( Sender = btn_co_ev_etd ) then
       Cons_OnLine := qry_parametros_CD_EV_ETD;
    if ( Sender = dbedt_cd_ev_dig_di ) or ( Sender = btn_co_ev_dig_di ) then
       Cons_OnLine := qry_parametros_CD_EV_DIG_DI;
    if ( Sender = dbedt_cd_ev_ci ) or ( Sender = btn_co_ev_ci ) then
       Cons_OnLine := qry_parametros_CD_EV_CI;
    if ( Sender = dbedt_cd_ev_recep_analise ) or ( Sender = btn_co_ev_recep_analise ) then
       Cons_OnLine := qry_parametros_CD_EV_RECEP_ANALISE;
    if ( Sender = dbedt_cd_ev_receb_doc ) or ( Sender = btn_co_ev_receb_doc ) then
       Cons_OnLine := qry_parametros_CD_EV_RECEB_DOC;
    if ( Sender = dbedt_cd_ev_abre_proc ) or ( Sender = btn_co_ev_abre_proc ) then
       Cons_OnLine := qry_parametros_CD_EV_ABRE_PROC;
    if ( Sender = dbedt_cd_ev_num_imp ) or ( Sender = btn_co_ev_num_imp ) then
       Cons_OnLine := qry_parametros_CD_EV_NUM_IMP;
    if ( Sender = dbedt_cd_ev_rec_imp ) or ( Sender = btn_co_ev_rec_imp ) then
       Cons_OnLine := qry_parametros_CD_EV_REC_IMP;

    // Tela 2 - Coluna 1
    if ( Sender = dbedt_cd_ev_num_frete ) or ( Sender = btn_co_ev_num_frete ) then
       Cons_OnLine := qry_parametros_CD_EV_NUM_FRETE;
    if ( Sender = dbedt_cd_ev_rec_frete ) or ( Sender = btn_co_ev_rec_frete ) then
       Cons_OnLine := qry_parametros_CD_EV_REC_FRETE;
    if ( Sender = dbedt_cd_ev_num_exp ) or ( Sender = btn_co_ev_num_exp ) then
       Cons_OnLine := qry_parametros_CD_EV_NUM_EXP;
    if ( Sender = dbedt_cd_ev_rec_exp ) or ( Sender = btn_co_ev_rec_exp ) then
       Cons_OnLine := qry_parametros_CD_EV_REC_EXP;
    if ( Sender = dbedt_cd_ev_pres_carga ) or ( Sender = btn_co_ev_pres_carga ) then
       Cons_OnLine := qry_parametros_CD_EV_PRES_CARGA;
    if ( Sender = dbedt_cd_ev_vencto_li ) or ( Sender = btn_co_ev_vencto_li ) then
       Cons_OnLine := qry_parametros_CD_EV_VENCTO_LI;
    if ( Sender = dbedt_cd_ev_desova ) or ( Sender = btn_co_ev_desova ) then
       Cons_OnLine := qry_parametros_CD_EV_DESOVA;
    if ( Sender = dbedt_cd_ev_lib_bl ) or ( Sender = btn_co_ev_lib_bl ) then
       Cons_OnLine := qry_parametros_CD_EV_LIB_BL;
    if ( Sender = dbedt_cd_ev_pag_demur ) or ( Sender = btn_co_ev_pag_demur ) then
       Cons_OnLine := qry_parametros_CD_EV_PAG_DEMUR;
    if ( Sender = dbedt_cd_ev_pagto_icms ) or ( Sender = btn_co_ev_pagto_icms ) then
       Cons_OnLine := qry_parametros_CD_EV_PAGTO_ICMS;

    // Tela 2 - Coluna 2
    if ( Sender = dbedt_cd_ev_pag_arm ) or ( Sender = btn_co_ev_pag_arm ) then
       Cons_OnLine := qry_parametros_CD_EV_PAG_ARM;
    if ( Sender = dbedt_cd_ev_pag_sda ) or ( Sender = btn_co_ev_pag_sda ) then
       Cons_OnLine := qry_parametros_CD_EV_PAG_SDA;
    if ( Sender = dbedt_cd_ev_envio_doc_cli ) or ( Sender = btn_co_ev_envio_doc_cli ) then
       Cons_OnLine := qry_parametros_CD_EV_ENVIO_DOC_CLI;
    if ( Sender = dbedt_cd_ev_envio_fat ) or ( Sender = btn_co_ev_envio_fat ) then
       Cons_OnLine := qry_parametros_CD_EV_ENVIO_FAT;
    if ( Sender = dbedt_cd_ev_cambio_ok ) or ( Sender = btn_co_ev_cambio_ok ) then
       Cons_OnLine := qry_parametros_CD_EV_CAMBIO_OK;
    if ( Sender = dbedt_cd_ev_prev_embarque ) or ( Sender = btn_co_ev_prev_embarque ) then
       Cons_OnLine := qry_parametros_CD_EV_PREV_EMBARQUE;
    if ( Sender = dbedt_cd_ev_embarque ) or ( Sender = btn_co_ev_embarque ) then
       Cons_OnLine := qry_parametros_CD_EV_EMBARQUE;
    if ( Sender = dbedt_cd_ev_entrega_merc ) or ( Sender = btn_co_ev_entrega_merc ) then
       Cons_OnLine := qry_parametros_CD_EV_ENTREGA_MERC;
    if ( Sender = dbedt_cd_ev_averbacao ) or ( Sender = btn_co_ev_averbacao ) then
       Cons_OnLine := qry_parametros_CD_EV_AVERBACAO;
    if ( Sender = dbedt_cd_ev_ent_rec_fed ) or ( Sender = btn_co_ev_ent_rec_fed ) then
       Cons_OnLine := qry_parametros_CD_EV_ENT_REC_FED;

    // Tela 3 - Coluna 1
    if ( Sender = dbedt_cd_ev_remocao ) or ( Sender = btn_co_ev_remocao ) then
       Cons_OnLine := qry_parametros_CD_EV_REMOCAO;
    if ( Sender = dbedt_cd_ev_prev_carregamento ) or ( Sender = btn_co_ev_prev_carregamento ) then
       Cons_OnLine := qry_parametros_CD_EV_PREV_CARREGAMENTO;
    if ( Sender = dbedt_cd_ev_abert_di ) or ( Sender = btn_co_ev_abert_di ) then
       Cons_OnLine := qry_parametros_CD_EV_ABERT_DI;
    if ( Sender = dbedt_cd_ev_nf_entrada ) or ( Sender = btn_co_ev_nf_entrada ) then
       Cons_OnLine := qry_parametros_CD_EV_NF_ENTRADA;
    if ( Sender = dbedt_cd_ev_prev_entr_merc ) or ( Sender = btn_co_ev_prev_entr_merc ) then
       Cons_OnLine := qry_parametros_CD_EV_PREV_ENTR_MERC;
    if ( Sender = dbedt_cd_ev_nf_transp ) or ( Sender = btn_co_ev_nf_transp ) then
       Cons_OnLine := qry_parametros_CD_EV_NF_TRANSP;
    if ( Sender = dbedt_cd_ev_cruze ) or ( Sender = btn_co_ev_cruze ) then
       Cons_OnLine := qry_parametros_CD_EV_CRUZE;
    if ( Sender = dbedt_cd_ev_apresentacao ) or ( Sender = btn_co_ev_apresentacao ) then
       Cons_OnLine := qry_parametros_CD_EV_APRESENTACAO;
    if ( Sender = dbedt_cd_ev_prev_fabrica ) or ( Sender = btn_co_ev_prev_fabrica ) then
       Cons_OnLine := qry_parametros_CD_EV_PREV_FABRICA;
    if ( Sender = dbedt_cd_ev_liberacao ) or ( Sender = btn_co_ev_liberacao ) then
       Cons_OnLine := qry_parametros_CD_EV_LIBERACAO;

    // Tela 3 - Coluna 2
    if ( Sender = dbedt_cd_ev_reg_dde ) or ( Sender = btn_co_ev_reg_dde ) then
       Cons_OnLine := qry_parametros_CD_EV_REG_DDE;
    if ( Sender = dbedt_cd_ev_reg_re ) or ( Sender = btn_co_ev_reg_re ) then
       Cons_OnLine := qry_parametros_CD_EV_REG_RE;
    if ( Sender = dbedt_cd_ev_insp_ok ) or ( Sender = btn_co_ev_insp_ok ) then
       Cons_OnLine := qry_parametros_CD_EV_EMISSAO_ETIQUETA;
    if ( Sender = dbedt_cd_ev_atracacao ) or ( Sender = btn_co_ev_atracacao ) then
       Cons_OnLine := qry_parametros_CD_EV_ATRACACAO;
    if ( Sender = dbedt_cd_ev_solic_cambio ) or ( Sender = btn_co_ev_solic_cambio ) then
       Cons_OnLine := qry_parametros_CD_EV_SOLIC_CAMBIO;
    if ( Sender = dbedt_cd_ev_solic_seguro ) or ( Sender = btn_co_ev_solic_seguro ) then
       Cons_OnLine := qry_parametros_CD_EV_SOLIC_SEGURO;
    if ( Sender = dbedt_cd_ev_receb_seguro ) or ( Sender = btn_co_ev_receb_seguro ) then
       Cons_OnLine := qry_parametros_CD_EV_RECEB_SEGURO;
    if ( Sender = dbedt_cd_ev_solic_ministerio ) or ( Sender = btn_co_ev_solic_ministerio ) then
       Cons_OnLine := qry_parametros_CD_EV_SOLIC_MINISTERIO;
    if ( Sender = dbedt_cd_ev_receb_ministerio ) or ( Sender = btn_co_ev_receb_ministerio ) then
       Cons_OnLine := qry_parametros_CD_EV_RECEB_MINISTERIO;
    if ( Sender = dbedt_cd_ev_canal ) or ( Sender = btn_co_ev_canal ) then
       Cons_OnLine := qry_parametros_CD_EV_CANAL;

    // Tela 4 - Coluna 1
    if ( Sender = dbedt_cd_env_comext ) or ( Sender = btn_co_env_comext ) then
       Cons_OnLine := qry_parametros_CD_EV_ENV_COMEXT;
    if ( Sender = dbedt_cd_ev_lib_est ) or ( Sender = btn_co_ev_lib_est ) then
       Cons_OnLine := qry_parametros_CD_EV_LIB_EST;
    if ( Sender = dbedt_cd_ev_form_dt ) or ( Sender = btn_co_ev_form_dt ) then
       Cons_OnLine := qry_parametros_CD_EV_FORM_DT;
    if ( Sender = dbedt_cd_ev_lib_fab ) or ( Sender = btn_co_ev_lib_fab ) then
       Cons_OnLine := qry_parametros_CD_EV_LIB_FAB;
    if ( Sender = dbedt_cd_ev_rec_dhl ) or ( Sender = btn_co_ev_rec_dhl ) then
       Cons_OnLine := qry_parametros_CD_EV_REC_DHL;
    if ( Sender = dbedt_cd_ev_email_lib ) or ( Sender = btn_co_ev_email_lib ) then
       Cons_OnLine := qry_parametros_CD_EV_EMAIL_LIB;
    if ( Sender = dbedt_cd_ev_conf_docs ) or ( Sender = btn_co_ev_conf_docs ) then
       Cons_OnLine := qry_parametros_CD_EV_CONF_DOCS;
    if ( Sender = dbedt_cd_ev_solic_desova ) or ( Sender = btn_co_ev_solic_desova ) then
       Cons_OnLine := qry_parametros_CD_EV_SOLIC_DESOVA;
    if ( Sender = dbedt_cd_ev_cert_origem ) or ( Sender = btn_co_ev_cert_origem ) then
       Cons_OnLine := qry_parametros_CD_EV_CERT_ORIGEM;
    if ( Sender = dbedt_cd_ev_dta_transp ) or ( Sender = btn_co_ev_dta_transp ) then
       Cons_OnLine := qry_parametros_CD_EV_DTA_TRANSP;

    // Tela 4 - Coluna 2
    if ( Sender = dbedt_cd_ev_ped_rec ) or ( Sender = btn_co_ev_ped_rec ) then
       Cons_OnLine := qry_parametros_CD_EV_PED_REC;
    if ( Sender = dbedt_cd_ev_entr_merc_fabr ) or ( Sender = btn_co_ev_entr_merc_fabr ) then
       Cons_OnLine := qry_parametros_CD_EV_ENTR_MERC_FABR;
    if ( Sender = dbedt_cd_ev_dt_necessidade ) or ( Sender = btn_co_ev_dt_necessidade ) then
       Cons_OnLine := qry_parametros_CD_EV_NECESSIDADE;
    if ( Sender = dbedt_cd_ev_envio_doc_cli ) or ( Sender = btn_co_ev_envio_doc_cli ) then
       Cons_OnLine := qry_parametros_CD_EV_ENVIO_DOC;
    if ( Sender = dbedt_cd_ev_entr_eadi ) or ( Sender = btn_co_ev_entr_eadi ) then
       Cons_OnLine := qry_parametros_CD_EV_ENTR_EADI;
    if ( Sender = dbedt_cd_ev_dt_consolidacao ) or ( Sender = btn_co_ev_dt_consolidacao ) then
       Cons_OnLine := qry_parametros_CD_EV_DT_CONSOLIDACAO;
    if ( Sender = dbedt_cd_ev_receb_ped ) or ( Sender = btn_co_ev_receb_ped ) then
       Cons_OnLine := qry_parametros_CD_EV_RECEB_PED;
    if ( Sender = dbedt_cd_ev_solic_ov ) or ( Sender = btn_co_ev_solic_ov ) then
       Cons_OnLine := qry_parametros_CD_EV_SOLIC_OV;
    if ( Sender = dbedt_cd_ev_solic_remessa ) or ( Sender = btn_co_ev_solic_remessa ) then
       Cons_OnLine := qry_parametros_CD_EV_SOLIC_REM;
    if ( Sender = dbedt_cd_ev_param_dta ) or ( Sender = btn_co_ev_param_dta ) then
       Cons_OnLine := qry_parametros_CD_EV_PARAM_DTA;

    //Tela 5 - Coluna 1
    if ( Sender = dbedt_cd_ev_pres_carga_eadi ) or ( Sender = btn_co_ev_pres_carga_eadi ) then
       Cons_OnLine := qry_parametros_CD_EV_PRES_CARGA_EADI;
    if ( Sender = dbedt_cd_ev_registro_dta ) or ( Sender = btn_co_ev_registro_dta ) then
       Cons_OnLine := qry_parametros_CD_EV_REG_DTA;
    if ( Sender = dbedtCdEvEntFabr ) or ( Sender = btnCoEvEntFabr ) then
       Cons_OnLine := qry_parametros_CD_EV_DT_ENT_FABR;


    // Entreposto
    if ( Sender = dbedt_cd_ev_venda_nac ) or ( Sender = btn_co_ev_venda_nac ) then
       Cons_OnLine := qry_parametros_CD_EV_VENDA_NAC;
    if ( Sender = dbedt_cd_ev_envio_doc_nac ) or ( Sender = btn_co_ev_envio_doc_nac ) then
       Cons_OnLine := qry_parametros_CD_EV_ENVIO_DOC_NAC;

    Caption := Caption + ' [Consulta On-Line]';
    lCons_OnLine := True;
    if Not ( qry_parametros_.State in [dsEdit, dsInsert] ) then qry_parametros_.Edit;
    ShowModal;
    lCons_OnLine := False;

    qry_evento_.Close;
    qry_evento_.Prepare;
    qry_evento_.Open;
  end;

  // Tela 1 - Coluna 1
  if ( Sender = dbedt_cd_ev_reg_di )              or ( Sender = btn_co_ev_reg_di )              then dbedt_cd_ev_reg_diExit(nil);
  if ( Sender = dbedt_cd_ev_conhecimento )        or ( Sender = btn_co_ev_conhecimento )        then dbedt_cd_ev_conhecimentoExit(nil);
  if ( Sender = dbedt_cd_ev_pagto_li )            or ( Sender = btn_co_ev_pagto_li )            then dbedt_cd_ev_pagto_liExit(nil);
  if ( Sender = dbedt_cd_ev_espera_navio )        or ( Sender = btn_co_ev_espera_navio )        then dbedt_cd_ev_espera_navioExit(nil);
  if ( Sender = dbedt_cd_ev_ent )                 or ( Sender = btn_co_ev_ent )                 then dbedt_cd_ev_entExit(nil);
  if ( Sender = dbedt_cd_ev_envio_saque_bordero ) or ( Sender = btn_co_ev_envio_saque_bordero ) then dbedt_cd_ev_envio_saque_borderoExit(nil);
  if ( Sender = dbedt_cd_ev_insp_ma )             or ( Sender = btn_co_ev_insp_ma )             then dbedt_cd_ev_insp_maExit(nil);
  if ( Sender = dbedt_cd_ev_prev_desemb )         or ( Sender = btn_co_ev_prev_desemb )         then dbedt_cd_ev_prev_desembExit(nil);
  if ( Sender = dbedt_cd_ev_desemb )              or ( Sender = btn_co_ev_desemb )              then dbedt_cd_ev_desembExit(nil);
  if ( Sender = dbedt_cd_ev_descarga )            or ( Sender = btn_co_ev_descarga )            then dbedt_cd_ev_descargaExit(nil);
  // Tela 1 - Coluna 2
  if ( Sender = dbedt_cd_ev_prev_chegada )        or ( Sender = btn_co_ev_prev_chegada )        then dbedt_cd_ev_prev_chegadaExit(nil);
  if ( Sender = dbedt_cd_ev_chegada )             or ( Sender = btn_co_ev_chegada )             then dbedt_cd_ev_chegadaExit(nil);
  if ( Sender = dbedt_cd_ev_etd )                 or ( Sender = btn_co_ev_etd )                 then dbedt_cd_ev_etdExit(nil);
  if ( Sender = dbedt_cd_ev_dig_di )              or ( Sender = btn_co_ev_dig_di )              then dbedt_cd_ev_dig_diExit(nil);
  if ( Sender = dbedt_cd_ev_ci )                  or ( Sender = btn_co_ev_ci )                  then dbedt_cd_ev_ciExit(nil);
  if ( Sender = dbedt_cd_ev_recep_analise )       or ( Sender = btn_co_ev_recep_analise )       then dbedt_cd_ev_recep_analiseExit(nil);
  if ( Sender = dbedt_cd_ev_receb_doc )           or ( Sender = btn_co_ev_receb_doc )           then dbedt_cd_ev_receb_docExit(nil);
  if ( Sender = dbedt_cd_ev_abre_proc )           or ( Sender = btn_co_ev_abre_proc )           then dbedt_cd_ev_abre_procExit(nil);
  if ( Sender = dbedt_cd_ev_num_imp )             or ( Sender = btn_co_ev_num_imp )             then dbedt_cd_ev_num_impExit(nil);
  if ( Sender = dbedt_cd_ev_rec_imp )             or ( Sender = btn_co_ev_rec_imp )             then dbedt_cd_ev_rec_impExit(nil);
  // Tela 2 - Coluna 1
  if ( Sender = dbedt_cd_ev_num_frete )           or ( Sender = btn_co_ev_num_frete )           then dbedt_cd_ev_num_freteExit(nil);
  if ( Sender = dbedt_cd_ev_rec_frete )           or ( Sender = btn_co_ev_rec_frete )           then dbedt_cd_ev_rec_freteExit(nil);
  if ( Sender = dbedt_cd_ev_num_exp )             or ( Sender = btn_co_ev_num_exp )             then dbedt_cd_ev_num_expExit(nil);
  if ( Sender = dbedt_cd_ev_rec_exp )             or ( Sender = btn_co_ev_rec_exp )             then dbedt_cd_ev_rec_expExit(nil);
  if ( Sender = dbedt_cd_ev_pres_carga )          or ( Sender = btn_co_ev_pres_carga )          then dbedt_cd_ev_pres_cargaExit(nil);
  if ( Sender = dbedt_cd_ev_vencto_li )           or ( Sender = btn_co_ev_vencto_li )           then dbedt_cd_ev_vencto_liExit(nil);
  if ( Sender = dbedt_cd_ev_desova )              or ( Sender = btn_co_ev_desova )              then dbedt_cd_ev_desovaExit(nil);
  if ( Sender = dbedt_cd_ev_lib_bl )              or ( Sender = btn_co_ev_lib_bl )              then dbedt_cd_ev_lib_blExit(nil);
  if ( Sender = dbedt_cd_ev_pag_demur )           or ( Sender = btn_co_ev_pag_demur )           then dbedt_cd_ev_pag_demurExit(nil);
  if ( Sender = dbedt_cd_ev_pagto_icms )          or ( Sender = btn_co_ev_pagto_icms )          then dbedt_cd_ev_pagto_icmsExit(nil);
  // Tela 2 - Coluna 2
  if ( Sender = dbedt_cd_ev_pag_arm )             or ( Sender = btn_co_ev_pag_arm )             then dbedt_cd_ev_pag_armExit(nil);
  if ( Sender = dbedt_cd_ev_pag_sda )             or ( Sender = btn_co_ev_pag_sda )             then dbedt_cd_ev_pag_sdaExit(nil);
  if ( Sender = dbedt_cd_ev_envio_imp )           or ( Sender = btn_co_ev_envio_imp )           then dbedt_cd_ev_envio_impExit(nil);
  if ( Sender = dbedt_cd_ev_envio_fat )           or ( Sender = btn_co_ev_envio_fat )           then dbedt_cd_ev_envio_fatExit(nil);
  if ( Sender = dbedt_cd_ev_cambio_ok )           or ( Sender = btn_co_ev_cambio_ok )           then dbedt_cd_ev_cambio_okExit(nil);
  if ( Sender = dbedt_cd_ev_prev_embarque )       or ( Sender = btn_co_ev_prev_embarque )       then dbedt_cd_ev_prev_embarqueExit(nil);
  if ( Sender = dbedt_cd_ev_embarque )            or ( Sender = btn_co_ev_embarque )            then dbedt_cd_ev_embarqueExit(nil);
  if ( Sender = dbedt_cd_ev_entrega_merc )        or ( Sender = btn_co_ev_entrega_merc )        then dbedt_cd_ev_entrega_mercExit(nil);
  if ( Sender = dbedt_cd_ev_averbacao )           or ( Sender = btn_co_ev_averbacao )           then dbedt_cd_ev_averbacaoExit(nil);
  if ( Sender = dbedt_cd_ev_ent_rec_fed )         or ( Sender = btn_co_ev_ent_rec_fed )         then dbedt_cd_ev_ent_rec_fedExit(nil);
  // Tela 3 - Coluna 1
  if ( Sender = dbedt_cd_ev_remocao )             or ( Sender = btn_co_ev_remocao )             then dbedt_cd_ev_remocaoExit(nil);
  if ( Sender = dbedt_cd_ev_prev_carregamento )   or ( Sender = btn_co_ev_prev_carregamento )   then dbedt_cd_ev_prev_carregamentoExit(nil);
  if ( Sender = dbedt_cd_ev_abert_di )            or ( Sender = btn_co_ev_abert_di )            then dbedt_cd_ev_abert_diExit(nil);
  if ( Sender = dbedt_cd_ev_nf_entrada )          or ( Sender = btn_co_ev_nf_entrada )          then dbedt_cd_ev_nf_entradaExit(nil);
  if ( Sender = dbedt_cd_ev_prev_entr_merc )      or ( Sender = btn_co_ev_prev_entr_merc )      then dbedt_cd_ev_prev_entr_mercExit(nil);
  if ( Sender = dbedt_cd_ev_nf_transp )           or ( Sender = btn_co_ev_nf_transp )           then dbedt_cd_ev_nf_transpExit(nil);
  if ( Sender = dbedt_cd_ev_cruze )               or ( Sender = btn_co_ev_cruze )               then dbedt_cd_ev_cruzeExit(nil);
  if ( Sender = dbedt_cd_ev_apresentacao )        or ( Sender = btn_co_ev_apresentacao )        then dbedt_cd_ev_apresentacaoExit(nil);
  if ( Sender = dbedt_cd_ev_prev_fabrica )        or ( Sender = btn_co_ev_prev_fabrica )        then dbedt_cd_ev_prev_fabricaExit(nil);
  if ( Sender = dbedt_cd_ev_liberacao )           or ( Sender = btn_co_ev_liberacao )           then dbedt_cd_ev_liberacaoExit(nil);
  // Tela 3 - Coluna 2
  if ( Sender = dbedt_cd_ev_reg_dde )             or ( Sender = btn_co_ev_reg_dde )             then dbedt_cd_ev_reg_ddeExit(nil);
  if ( Sender = dbedt_cd_ev_reg_re )              or ( Sender = btn_co_ev_reg_re )              then dbedt_cd_ev_reg_reExit(nil);
  if ( Sender = dbedt_cd_ev_insp_ok )             or ( Sender = btn_co_ev_insp_ok )             then dbedt_cd_ev_insp_okExit(nil);
  if ( Sender = dbedt_cd_ev_atracacao )           or ( Sender = btn_co_ev_atracacao )           then dbedt_cd_ev_atracacaoExit(nil);
  if ( Sender = dbedt_cd_ev_solic_cambio )        or ( Sender = btn_co_ev_solic_cambio )        then dbedt_cd_ev_solic_cambioExit(nil);
  if ( Sender = dbedt_cd_ev_solic_seguro )        or ( Sender = btn_co_ev_solic_seguro )        then dbedt_cd_ev_solic_seguroExit(nil);
  if ( Sender = dbedt_cd_ev_receb_seguro )        or ( Sender = btn_co_ev_receb_seguro )        then dbedt_cd_ev_receb_seguroExit(nil);
  if ( Sender = dbedt_cd_ev_solic_ministerio )    or ( Sender = btn_co_ev_solic_ministerio )    then dbedt_cd_ev_solic_ministerioExit(nil);
  if ( Sender = dbedt_cd_ev_receb_ministerio )    or ( Sender = btn_co_ev_receb_ministerio )    then dbedt_cd_ev_receb_ministerioExit(nil);
  if ( Sender = dbedt_cd_ev_canal )               or ( Sender = btn_co_ev_canal )               then dbedt_cd_ev_canalExit(nil);
  // Tela 4 - Coluna 1
  if ( Sender = dbedt_cd_env_comext )             or ( Sender = btn_co_env_comext )             then dbedt_cd_env_comextExit(nil);
  if ( Sender = dbedt_cd_ev_lib_est )             or ( Sender = btn_co_ev_lib_est )             then dbedt_cd_ev_lib_estExit(nil);
  if ( Sender = dbedt_cd_ev_form_dt )             or ( Sender = btn_co_ev_form_dt )             then dbedt_cd_ev_form_dtExit(nil);
  if ( Sender = dbedt_cd_ev_lib_fab )             or ( Sender = btn_co_ev_lib_fab )             then dbedt_cd_ev_lib_fabExit(nil);
  if ( Sender = dbedt_cd_ev_rec_dhl )             or ( Sender = btn_co_ev_rec_dhl )             then dbedt_cd_ev_rec_dhlExit(nil);
  if ( Sender = dbedt_cd_ev_email_lib )           or ( Sender = btn_co_ev_email_lib )           then dbedt_cd_ev_email_libExit(nil);
  if ( Sender = dbedt_cd_ev_conf_docs )           or ( Sender = btn_co_ev_conf_docs )           then dbedt_cd_ev_conf_docsExit(nil);
  if ( Sender = dbedt_cd_ev_solic_desova )        or ( Sender = btn_co_ev_solic_desova )        then dbedt_cd_ev_solic_desovaExit(nil);
  //  if ( Sender = dbedt_cd_cert_origem )            or ( Sender = btn_co_cert_origem )            then dbedt_cd_ev_cert_origem(nil);
  // Entreposto
  if ( Sender = dbedt_cd_ev_venda_nac )           or ( Sender = btn_co_ev_venda_nac )           then dbedt_cd_ev_venda_nacExit(nil);
  if ( Sender = dbedt_cd_ev_envio_doc_nac )       or ( Sender = btn_co_ev_envio_doc_nac )       then dbedt_cd_ev_envio_doc_nacExit(nil);
  // Tela 4 - Coluna 2
  if ( Sender = dbedt_cd_ev_ped_rec )             or ( Sender = btn_co_ev_ped_rec )             then dbedt_cd_ev_ped_recExit(nil);
  if ( Sender = dbedt_cd_ev_entr_merc_fabr )      or ( Sender = btn_co_ev_entr_merc_fabr )      then dbedt_cd_ev_entr_merc_fabrExit(nil);
  if ( Sender = dbedt_cd_ev_dt_necessidade )      or ( Sender = btn_co_ev_dt_necessidade )      then dbedt_cd_ev_dt_necessidadeExit(nil);
  if ( Sender = dbedt_cd_ev_envio_doc_cli )       or ( Sender = btn_co_ev_envio_doc_cli )       then dbedt_cd_ev_envio_doc_cliExit(nil);
  if ( Sender = dbedt_cd_ev_dt_consolidacao )     or ( Sender = btn_co_ev_dt_consolidacao )     then dbedt_cd_ev_dt_consolidacaoExit(nil);
  if ( Sender = dbedt_cd_ev_receb_ped )           or ( Sender = btn_co_ev_receb_ped )           then dbedt_cd_ev_receb_pedExit(nil);
  if ( Sender = dbedt_cd_ev_solic_ov )            or ( Sender = btn_co_ev_solic_ov )            then dbedt_cd_ev_solic_ovExit(nil);
  if ( Sender = dbedt_cd_ev_solic_remessa )       or ( Sender = btn_co_ev_solic_remessa )       then dbedt_cd_ev_solic_remessaExit(nil);
  if ( Sender = dbedt_cd_ev_param_dta )           or ( Sender = btn_co_ev_param_dta )           then dbedt_cd_ev_param_dtaExit(nil);
  // Tela 5 - Coluna 1
  if ( Sender = dbedt_cd_ev_pres_carga_eadi )     or ( Sender = btn_co_ev_pres_carga_eadi )     then dbedt_cd_ev_pres_carga_eadiExit(nil);
  if ( Sender = dbedt_cd_ev_registro_dta )        or ( Sender = btn_co_ev_registro_dta )        then dbedt_cd_ev_registro_dtaExit(nil);
end;

procedure Tfrm_param_sistema.dbedt_cd_ev_reg_diExit(Sender: TObject);
begin
  if ( datm_param_sistema.qry_parametros_.State in [dsEdit, dsInsert] ) then
  begin
    ValidCodigo( dbedt_cd_ev_reg_di );
    if dbedt_cd_ev_reg_di.Text <> '' then
    begin
      if dbedt_nm_ev_reg_di.Text = '' then
      begin
        BoxMensagem( 'Código do evento Registro DI inválido!', 2 );
        pgctrl_param.ActivePage := ts_eventos_1;
        dbedt_cd_ev_reg_di.SetFocus;
        Exit;
      end;
    end;
  end;
end;

procedure Tfrm_param_sistema.dbedt_cd_ev_conhecimentoExit(Sender: TObject);
begin
  if ( datm_param_sistema.qry_parametros_.State in [dsEdit, dsInsert] ) then
  begin
    ValidCodigo( dbedt_cd_ev_conhecimento );
    if dbedt_cd_ev_conhecimento.Text <> '' then
    begin
      if dbedt_nm_ev_conhecimento.Text = '' then
      begin
        BoxMensagem( 'Código do evento Conhecimento inválido!', 2 );
        pgctrl_param.ActivePage := ts_eventos_1;
        dbedt_cd_ev_conhecimento.SetFocus;
        Exit;
      end;
    end;
  end;
end;

procedure Tfrm_param_sistema.dbedt_cd_ev_pagto_liExit(Sender: TObject);
begin
  if ( datm_param_sistema.qry_parametros_.State in [dsEdit, dsInsert] ) then
  begin
    ValidCodigo( dbedt_cd_ev_pagto_li );
    if dbedt_cd_ev_pagto_li.Text <> '' then
    begin
      if dbedt_nm_ev_pagto_li.Text = '' then
      begin
        BoxMensagem( 'Código do evento Pagto LI inválido!', 2 );
        pgctrl_param.ActivePage := ts_eventos_1;
        dbedt_cd_ev_pagto_li.SetFocus;
        Exit;
      end;
    end;
  end;
end;

procedure Tfrm_param_sistema.dbedt_cd_ev_espera_navioExit(Sender: TObject);
begin
  if ( datm_param_sistema.qry_parametros_.State in [dsEdit, dsInsert] ) then
  begin
    ValidCodigo( dbedt_cd_ev_espera_navio );
    if dbedt_cd_ev_espera_navio.Text <> '' then
    begin
      if dbedt_nm_ev_espera_navio.Text = '' then
      begin
        BoxMensagem( 'Código do evento Espera do Navio inválido!', 2 );
        pgctrl_param.ActivePage := ts_eventos_1;
        dbedt_cd_ev_espera_navio.SetFocus;
        Exit;
      end;
    end;
  end;
end;

procedure Tfrm_param_sistema.dbedt_cd_ev_entExit(Sender: TObject);
begin
  if ( datm_param_sistema.qry_parametros_.State in [dsEdit, dsInsert] ) then
  begin
    ValidCodigo( dbedt_cd_ev_ent );
    if dbedt_cd_ev_ent.Text <> '' then
    begin
      if dbedt_nm_ev_ent.Text = '' then
      begin
        BoxMensagem( 'Código do evento Entrada do Navio inválido!', 2 );
        pgctrl_param.ActivePage := ts_eventos_1;
        dbedt_cd_ev_ent.SetFocus;
        Exit;
      end;
    end;
  end;
end;

procedure Tfrm_param_sistema.dbedt_cd_ev_envio_saque_borderoExit(Sender: TObject);
begin
  if ( datm_param_sistema.qry_parametros_.State in [dsEdit, dsInsert] ) then
  begin
    ValidCodigo( dbedt_cd_ev_envio_saque_bordero );
    if dbedt_cd_ev_envio_saque_bordero.Text <> '' then
    begin
      if dbedt_nm_ev_envio_saque_bordero.Text = '' then
      begin
        BoxMensagem( 'Código do evento Envio de Saque/Borderô inválido!', 2 );
        pgctrl_param.ActivePage := ts_eventos_1;
        dbedt_cd_ev_envio_saque_bordero.SetFocus;
        Exit;
      end;
    end;
  end;
end;

procedure Tfrm_param_sistema.dbedt_cd_ev_insp_maExit(Sender: TObject);
begin
  if ( datm_param_sistema.qry_parametros_.State in [dsEdit, dsInsert] ) then
  begin
    ValidCodigo( dbedt_cd_ev_insp_ma );
    if dbedt_cd_ev_insp_ma.Text <> '' then
    begin
      if dbedt_nm_ev_insp_ma.Text = '' then
      begin
        BoxMensagem( 'Código do evento Inspeção no MA inválido!', 2 );
        pgctrl_param.ActivePage := ts_eventos_1;
        dbedt_cd_ev_insp_ma.SetFocus;
        Exit;
      end;
    end;
  end;
end;

procedure Tfrm_param_sistema.dbedt_cd_ev_prev_desembExit(Sender: TObject);
begin
  if ( datm_param_sistema.qry_parametros_.State in [dsEdit, dsInsert] ) then
  begin
    ValidCodigo( dbedt_cd_ev_prev_desemb );
    if dbedt_cd_ev_prev_desemb.Text <> '' then
    begin
      if dbedt_nm_ev_prev_desemb.Text = '' then
      begin
        BoxMensagem( 'Código do evento Previsão de Desembaraço inválido!', 2 );
        pgctrl_param.ActivePage := ts_eventos_1;
        dbedt_cd_ev_prev_desemb.SetFocus;
        Exit;
      end;
    end;
  end;
end;

procedure Tfrm_param_sistema.dbedt_cd_ev_desembExit(Sender: TObject);
begin
  if ( datm_param_sistema.qry_parametros_.State in [dsEdit, dsInsert] ) then
  begin
    ValidCodigo( dbedt_cd_ev_desemb );
    if dbedt_cd_ev_desemb.Text <> '' then
    begin
      if dbedt_nm_ev_desemb.Text = '' then
      begin
        BoxMensagem( 'Código do evento Desembaraço inválido!', 2 );
        pgctrl_param.ActivePage := ts_eventos_1;
        dbedt_cd_ev_desemb.SetFocus;
        Exit;
      end;
    end;
  end;
end;

procedure Tfrm_param_sistema.dbedt_cd_ev_descargaExit(Sender: TObject);
begin
  if ( datm_param_sistema.qry_parametros_.State in [dsEdit, dsInsert] ) then
  begin
    ValidCodigo( dbedt_cd_ev_descarga );
    if dbedt_cd_ev_descarga.Text <> '' then
    begin
      if dbedt_nm_ev_descarga.Text = '' then
      begin
        BoxMensagem( 'Código do evento Descarga inválido!', 2 );
        pgctrl_param.ActivePage := ts_eventos_1;
        dbedt_cd_ev_descarga.SetFocus;
        Exit;
      end;
    end;
  end;
end;

procedure Tfrm_param_sistema.dbedt_cd_ev_prev_chegadaExit(Sender: TObject);
begin
  if ( datm_param_sistema.qry_parametros_.State in [dsEdit, dsInsert] ) then
  begin
    ValidCodigo( dbedt_cd_ev_prev_chegada );
    if dbedt_cd_ev_prev_chegada.Text <> '' then
    begin
      if dbedt_nm_ev_prev_chegada.Text = '' then
      begin
        BoxMensagem( 'Código do evento Previsão de Chegada inválido!', 2 );
        pgctrl_param.ActivePage := ts_eventos_1;
        dbedt_cd_ev_prev_chegada.SetFocus;
        Exit;
      end;
    end;
  end;
end;

procedure Tfrm_param_sistema.dbedt_cd_ev_chegadaExit(Sender: TObject);
begin
  if ( datm_param_sistema.qry_parametros_.State in [dsEdit, dsInsert] ) then
  begin
    ValidCodigo( dbedt_cd_ev_chegada );
    if dbedt_cd_ev_chegada.Text <> '' then
    begin
      if dbedt_nm_ev_chegada.Text = '' then
      begin
        BoxMensagem( 'Código do evento Chegada inválido!', 2 );
        pgctrl_param.ActivePage := ts_eventos_1;
        dbedt_cd_ev_chegada.SetFocus;
        Exit;
      end;
    end;
  end;
end;

procedure Tfrm_param_sistema.dbedt_cd_ev_etdExit(Sender: TObject);
begin
  if ( datm_param_sistema.qry_parametros_.State in [dsEdit, dsInsert] ) then
  begin
    ValidCodigo( dbedt_cd_ev_etd );
    if dbedt_cd_ev_etd.Text <> '' then
    begin
      if dbedt_nm_ev_etd.Text = '' then
      begin
        BoxMensagem( 'Código do evento ETD inválido!', 2 );
        pgctrl_param.ActivePage := ts_eventos_1;
        dbedt_cd_ev_etd.SetFocus;
        Exit;
      end;
    end;
  end;
end;

procedure Tfrm_param_sistema.dbedt_cd_ev_dig_diExit(Sender: TObject);
begin
  if ( datm_param_sistema.qry_parametros_.State in [dsEdit, dsInsert] ) then
  begin
    ValidCodigo( dbedt_cd_ev_dig_di );
    if dbedt_cd_ev_dig_di.Text <> '' then
    begin
      if dbedt_nm_ev_dig_di.Text = '' then
      begin
        BoxMensagem( 'Código do evento Digitação da DI inválido!', 2 );
        pgctrl_param.ActivePage := ts_eventos_1;
        dbedt_cd_ev_dig_di.SetFocus;
        Exit;
      end;
    end;
  end;
end;

procedure Tfrm_param_sistema.dbedt_cd_ev_ciExit(Sender: TObject);
begin
  if ( datm_param_sistema.qry_parametros_.State in [dsEdit, dsInsert] ) then
  begin
    ValidCodigo( dbedt_cd_ev_ci );
    if dbedt_cd_ev_ci.Text <> '' then
    begin
      if dbedt_nm_ev_ci.Text = '' then
      begin
        BoxMensagem( 'Código do evento CI inválido!', 2 );
        pgctrl_param.ActivePage := ts_eventos_1;
        dbedt_cd_ev_ci.SetFocus;
        Exit;
      end;
    end;
  end;
end;

procedure Tfrm_param_sistema.dbedt_cd_ev_recep_analiseExit(
  Sender: TObject);
begin
  if ( datm_param_sistema.qry_parametros_.State in [dsEdit, dsInsert] ) then
  begin
    ValidCodigo( dbedt_cd_ev_recep_analise );
    if dbedt_cd_ev_recep_analise.Text <> '' then
    begin
      if dbedt_nm_ev_recep_analise.Text = '' then
      begin
        BoxMensagem( 'Código do evento Recepção e Análise inválido!', 2 );
        pgctrl_param.ActivePage := ts_eventos_1;
        dbedt_cd_ev_recep_analise.SetFocus;
        Exit;
      end;
    end;
  end;
end;

procedure Tfrm_param_sistema.dbedt_cd_ev_receb_docExit(Sender: TObject);
begin
  if ( datm_param_sistema.qry_parametros_.State in [dsEdit, dsInsert] ) then
  begin
    ValidCodigo( dbedt_cd_ev_receb_doc );
    if dbedt_cd_ev_receb_doc.Text <> '' then
    begin
      if dbedt_nm_ev_receb_doc.Text = '' then
      begin
        BoxMensagem( 'Código do evento Recebimento de Documentos inválido!', 2 );
        pgctrl_param.ActivePage := ts_eventos_1;
        dbedt_cd_ev_receb_doc.SetFocus;
        Exit;
      end;
    end;
  end;
end;

procedure Tfrm_param_sistema.dbedt_cd_ev_abre_procExit(Sender: TObject);
begin
  if ( datm_param_sistema.qry_parametros_.State in [dsEdit, dsInsert] ) then
  begin
    ValidCodigo( dbedt_cd_ev_abre_proc );
    if dbedt_cd_ev_abre_proc.Text <> '' then
    begin
      if dbedt_nm_ev_abre_proc.Text = '' then
      begin
        BoxMensagem( 'Código do evento Abertura do Processo inválido!', 2 );
        pgctrl_param.ActivePage := ts_eventos_1;
        dbedt_cd_ev_abre_proc.SetFocus;
        Exit;
      end;
    end;
  end;
end;

procedure Tfrm_param_sistema.dbedt_cd_ev_num_impExit(Sender: TObject);
begin
  if ( datm_param_sistema.qry_parametros_.State in [dsEdit, dsInsert] ) then
  begin
    ValidCodigo( dbedt_cd_ev_num_imp );
    if dbedt_cd_ev_num_imp.Text <> '' then
    begin
      if dbedt_nm_ev_num_imp.Text = '' then
      begin
        BoxMensagem( 'Código do evento Solic. Numerário Importação inválido!', 2 );
        pgctrl_param.ActivePage := ts_eventos_1;
        dbedt_cd_ev_num_imp.SetFocus;
        Exit;
      end;
    end;
  end;
end;

procedure Tfrm_param_sistema.dbedt_cd_ev_rec_impExit(Sender: TObject);
begin
  if ( datm_param_sistema.qry_parametros_.State in [dsEdit, dsInsert] ) then
  begin
    ValidCodigo( dbedt_cd_ev_rec_imp );
    if dbedt_cd_ev_rec_imp.Text <> '' then
    begin
      if dbedt_nm_ev_rec_imp.Text = '' then
      begin
        BoxMensagem( 'Código do evento Recebto de Numerário Importação inválido!', 2 );
        pgctrl_param.ActivePage := ts_eventos_1;
        dbedt_cd_ev_rec_imp.SetFocus;
        Exit;
      end;
    end;
  end;
end;

procedure Tfrm_param_sistema.dbedt_cd_ev_num_freteExit(Sender: TObject);
begin
  if ( datm_param_sistema.qry_parametros_.State in [dsEdit, dsInsert] ) then
  begin
    ValidCodigo( dbedt_cd_ev_num_frete );
    if dbedt_cd_ev_num_frete.Text <> '' then
    begin
      if dbedt_nm_ev_num_frete.Text = '' then
      begin
        BoxMensagem( 'Código do evento Sol. Numerário Frete inválido!', 2 );
        pgctrl_param.ActivePage := ts_eventos_2;
        dbedt_cd_ev_num_frete.SetFocus;
        Exit;
      end;
    end;
  end;
end;

procedure Tfrm_param_sistema.dbedt_cd_ev_rec_freteExit(Sender: TObject);
begin
  if ( datm_param_sistema.qry_parametros_.State in [dsEdit, dsInsert] ) then
  begin
    ValidCodigo( dbedt_cd_ev_rec_frete );
    if dbedt_cd_ev_rec_frete.Text <> '' then
    begin
      if dbedt_nm_ev_rec_frete.Text = '' then
      begin
        BoxMensagem( 'Código do evento Rec. Numerário Frete inválido!', 2 );
        pgctrl_param.ActivePage := ts_eventos_2;
        dbedt_cd_ev_rec_frete.SetFocus;
        Exit;
      end;
    end;
  end;
end;

procedure Tfrm_param_sistema.dbedt_cd_ev_num_expExit(Sender: TObject);
begin
  if ( datm_param_sistema.qry_parametros_.State in [dsEdit, dsInsert] ) then
  begin
    ValidCodigo( dbedt_cd_ev_num_exp );
    if dbedt_cd_ev_num_exp.Text <> '' then
    begin
      if dbedt_nm_ev_num_exp.Text = '' then
      begin
        BoxMensagem( 'Código do evento Sol. Numerário Exportação inválido!', 2 );
        pgctrl_param.ActivePage := ts_eventos_2;
        dbedt_cd_ev_num_exp.SetFocus;
        Exit;
      end;
    end;
  end;
end;

procedure Tfrm_param_sistema.dbedt_cd_ev_rec_expExit(Sender: TObject);
begin
  if ( datm_param_sistema.qry_parametros_.State in [dsEdit, dsInsert] ) then
  begin
    ValidCodigo( dbedt_cd_ev_rec_exp );
    if dbedt_cd_ev_rec_exp.Text <> '' then
    begin
      if dbedt_nm_ev_rec_exp.Text = '' then
      begin
        BoxMensagem( 'Código do evento Recebimento Numerário Exportação inválido!', 2 );
        pgctrl_param.ActivePage := ts_eventos_2;
        dbedt_cd_ev_rec_exp.SetFocus;
        Exit;
      end;
    end;
  end;
end;

procedure Tfrm_param_sistema.dbedt_cd_ev_pres_cargaExit(Sender: TObject);
begin
  if ( datm_param_sistema.qry_parametros_.State in [dsEdit, dsInsert] ) then
  begin
    ValidCodigo( dbedt_cd_ev_pres_carga );
    if dbedt_cd_ev_pres_carga.Text <> '' then
    begin
      if dbedt_nm_ev_pres_carga.Text = '' then
      begin
        BoxMensagem( 'Código do evento Presença de Carga inválido!', 2 );
        pgctrl_param.ActivePage := ts_eventos_2;
        dbedt_cd_ev_pres_carga.SetFocus;
        Exit;
      end;
    end;
  end;
end;

procedure Tfrm_param_sistema.dbedt_cd_ev_vencto_liExit(Sender: TObject);
begin
  if ( datm_param_sistema.qry_parametros_.State in [dsEdit, dsInsert] ) then
  begin
    ValidCodigo( dbedt_cd_ev_prev_desemb );
    if dbedt_cd_ev_prev_desemb.Text <> '' then
    begin
      if dbedt_nm_ev_prev_desemb.Text = '' then
      begin
        BoxMensagem( 'Código do evento Vencimento da LI inválido!', 2 );
        pgctrl_param.ActivePage := ts_eventos_2;
        dbedt_cd_ev_prev_desemb.SetFocus;
        Exit;
      end;
    end;
  end;
end;

procedure Tfrm_param_sistema.dbedt_cd_ev_desovaExit(Sender: TObject);
begin
  if ( datm_param_sistema.qry_parametros_.State in [dsEdit, dsInsert] ) then
  begin
    ValidCodigo( dbedt_cd_ev_prev_desemb );
    if dbedt_cd_ev_prev_desemb.Text <> '' then
    begin
      if dbedt_nm_ev_prev_desemb.Text = '' then
      begin
        BoxMensagem( 'Código do evento Desova inválido!', 2 );
        pgctrl_param.ActivePage := ts_eventos_2;
        dbedt_cd_ev_prev_desemb.SetFocus;
        Exit;
      end;
    end;
  end;
end;

procedure Tfrm_param_sistema.dbedt_cd_ev_lib_blExit(Sender: TObject);
begin
  if ( datm_param_sistema.qry_parametros_.State in [dsEdit, dsInsert] ) then
  begin
    ValidCodigo( dbedt_cd_ev_prev_desemb );
    if dbedt_cd_ev_prev_desemb.Text <> '' then
    begin
      if dbedt_nm_ev_prev_desemb.Text = '' then
      begin
        BoxMensagem( 'Código do evento Liberação do BL inválido!', 2 );
        pgctrl_param.ActivePage := ts_eventos_2;
        dbedt_cd_ev_prev_desemb.SetFocus;
        Exit;
      end;
    end;
  end;
end;

procedure Tfrm_param_sistema.dbedt_cd_ev_pag_demurExit(Sender: TObject);
begin
  if ( datm_param_sistema.qry_parametros_.State in [dsEdit, dsInsert] ) then
  begin
    ValidCodigo( dbedt_cd_ev_prev_desemb );
    if dbedt_cd_ev_prev_desemb.Text <> '' then
    begin
      if dbedt_nm_ev_prev_desemb.Text = '' then
      begin
        BoxMensagem( 'Código do evento Pagamento Demurrage inválido!', 2 );
        pgctrl_param.ActivePage := ts_eventos_2;
        dbedt_cd_ev_prev_desemb.SetFocus;
        Exit;
      end;
    end;
  end;
end;

procedure Tfrm_param_sistema.dbedt_cd_ev_pagto_icmsExit(Sender: TObject);
begin
  if ( datm_param_sistema.qry_parametros_.State in [dsEdit, dsInsert] ) then
  begin
    ValidCodigo( dbedt_cd_ev_prev_desemb );
    if dbedt_cd_ev_prev_desemb.Text <> '' then
    begin
      if dbedt_nm_ev_prev_desemb.Text = '' then
      begin
        BoxMensagem( 'Código do evento Pagamento ICMS inválido!', 2 );
        pgctrl_param.ActivePage := ts_eventos_2;
        dbedt_cd_ev_prev_desemb.SetFocus;
        Exit;
      end;
    end;
  end;
end;

procedure Tfrm_param_sistema.dbedt_cd_ev_pag_armExit(Sender: TObject);
begin
  if ( datm_param_sistema.qry_parametros_.State in [dsEdit, dsInsert] ) then
  begin
    ValidCodigo( dbedt_cd_ev_prev_desemb );
    if dbedt_cd_ev_prev_desemb.Text <> '' then
    begin
      if dbedt_nm_ev_prev_desemb.Text = '' then
      begin
        BoxMensagem( 'Código do evento Pagamento Armazenagem inválido!', 2 );
        pgctrl_param.ActivePage := ts_eventos_2;
        dbedt_cd_ev_prev_desemb.SetFocus;
        Exit;
      end;
    end;
  end;
end;

procedure Tfrm_param_sistema.dbedt_cd_ev_pag_sdaExit(Sender: TObject);
begin
  if ( datm_param_sistema.qry_parametros_.State in [dsEdit, dsInsert] ) then
  begin
    ValidCodigo( dbedt_cd_ev_prev_desemb );
    if dbedt_cd_ev_prev_desemb.Text <> '' then
    begin
      if dbedt_nm_ev_prev_desemb.Text = '' then
      begin
        BoxMensagem( 'Código do evento Pagamento SDA inválido!', 2 );
        pgctrl_param.ActivePage := ts_eventos_2;
        dbedt_cd_ev_prev_desemb.SetFocus;
        Exit;
      end;
    end;
  end;
end;

procedure Tfrm_param_sistema.dbedt_cd_ev_envio_impExit(Sender: TObject);
begin
  if ( datm_param_sistema.qry_parametros_.State in [dsEdit, dsInsert] ) then
  begin
    ValidCodigo( dbedt_cd_ev_envio_imp );
    if dbedt_cd_ev_envio_imp.Text <> '' then
    begin
      if dbedt_cd_ev_envio_imp.Text = '' then
      begin
        BoxMensagem( 'Código do evento Envio Documentos ao Importador Banco/Agente inválido!', 2 );
        pgctrl_param.ActivePage := ts_eventos_2;
        dbedt_cd_ev_envio_imp.SetFocus;
        Exit;
      end;
    end;
  end;
end;

procedure Tfrm_param_sistema.dbedt_cd_ev_envio_fatExit(Sender: TObject);
begin
  if ( datm_param_sistema.qry_parametros_.State in [dsEdit, dsInsert] ) then
  begin
    ValidCodigo( dbedt_cd_ev_prev_desemb );
    if dbedt_cd_ev_prev_desemb.Text <> '' then
    begin
      if dbedt_nm_ev_prev_desemb.Text = '' then
      begin
        BoxMensagem( 'Código do evento Envio da Fatura para o Cliente inválido!', 2 );
        pgctrl_param.ActivePage := ts_eventos_2;
        dbedt_cd_ev_prev_desemb.SetFocus;
        Exit;
      end;
    end;
  end;
end;

procedure Tfrm_param_sistema.dbedt_cd_ev_cambio_okExit(Sender: TObject);
begin
  if ( datm_param_sistema.qry_parametros_.State in [dsEdit, dsInsert] ) then
  begin
    ValidCodigo( dbedt_cd_ev_prev_desemb );
    if dbedt_cd_ev_prev_desemb.Text <> '' then
    begin
      if dbedt_nm_ev_prev_desemb.Text = '' then
      begin
        BoxMensagem( 'Código do evento Cambio OK inválido!', 2 );
        pgctrl_param.ActivePage := ts_eventos_2;
        dbedt_cd_ev_prev_desemb.SetFocus;
        Exit;
      end;
    end;
  end;
end;

procedure Tfrm_param_sistema.dbedt_cd_ev_prev_embarqueExit(Sender: TObject);
begin
  if ( datm_param_sistema.qry_parametros_.State in [dsEdit, dsInsert] ) then
  begin
    ValidCodigo( dbedt_cd_ev_prev_desemb );
    if dbedt_cd_ev_prev_desemb.Text <> '' then
    begin
      if dbedt_nm_ev_prev_desemb.Text = '' then
      begin
        BoxMensagem( 'Código do evento Previsão de Embarque inválido!', 2 );
        pgctrl_param.ActivePage := ts_eventos_2;
        dbedt_cd_ev_prev_desemb.SetFocus;
        Exit;
      end;
    end;
  end;
end;

procedure Tfrm_param_sistema.dbedt_cd_ev_embarqueExit(Sender: TObject);
begin
  if ( datm_param_sistema.qry_parametros_.State in [dsEdit, dsInsert] ) then
  begin
    ValidCodigo( dbedt_cd_ev_prev_desemb );
    if dbedt_cd_ev_prev_desemb.Text <> '' then
    begin
      if dbedt_nm_ev_prev_desemb.Text = '' then
      begin
        BoxMensagem( 'Código do evento Embarque inválido!', 2 );
        pgctrl_param.ActivePage := ts_eventos_2;
        dbedt_cd_ev_prev_desemb.SetFocus;
        Exit;
      end;
    end;
  end;
end;

procedure Tfrm_param_sistema.dbedt_cd_ev_entrega_mercExit(Sender: TObject);
begin
  if ( datm_param_sistema.qry_parametros_.State in [dsEdit, dsInsert] ) then
  begin
    ValidCodigo( dbedt_cd_ev_prev_desemb );
    if dbedt_cd_ev_prev_desemb.Text <> '' then
    begin
      if dbedt_nm_ev_prev_desemb.Text = '' then
      begin
        BoxMensagem( 'Código do evento Entrega da Mercadoria inválido!', 2 );
        pgctrl_param.ActivePage := ts_eventos_2;
        dbedt_cd_ev_prev_desemb.SetFocus;
        Exit;
      end;
    end;
  end;
end;

procedure Tfrm_param_sistema.dbedt_cd_ev_averbacaoExit(Sender: TObject);
begin
  if ( datm_param_sistema.qry_parametros_.State in [dsEdit, dsInsert] ) then
  begin
    ValidCodigo( dbedt_cd_ev_prev_desemb );
    if dbedt_cd_ev_prev_desemb.Text <> '' then
    begin
      if dbedt_nm_ev_prev_desemb.Text = '' then
      begin
        BoxMensagem( 'Código do evento Averbação inválido!', 2 );
        pgctrl_param.ActivePage := ts_eventos_2;
        dbedt_cd_ev_prev_desemb.SetFocus;
        Exit;
      end;
    end;
  end;
end;

procedure Tfrm_param_sistema.dbedt_cd_ev_reg_diKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if Key = VK_F5 then
  begin
    if ( Sender = dbedt_cd_banco_cob_aut )           then btn_co_banco_cob_autClick(Sender);
    if ( Sender = dbedt_cd_local_emissao_sp )        then btn_co_local_emissao_spClick(Sender);

    // Eventos - Tela 1 - Coluna 1
    if ( Sender = dbedt_cd_ev_reg_di )               then btn_co_ev_reg_diClick(Sender);
    if ( Sender = dbedt_cd_ev_conhecimento )         then btn_co_ev_reg_diClick(Sender);
    if ( Sender = dbedt_cd_ev_pagto_li )             then btn_co_ev_reg_diClick(Sender);
    if ( Sender = dbedt_cd_ev_espera_navio )         then btn_co_ev_reg_diClick(Sender);
    if ( Sender = dbedt_cd_ev_ent )                  then btn_co_ev_reg_diClick(Sender);
    if ( Sender = dbedt_cd_ev_envio_saque_bordero )  then btn_co_ev_reg_diClick(Sender);
    if ( Sender = dbedt_cd_ev_insp_ma )              then btn_co_ev_reg_diClick(Sender);
    if ( Sender = dbedt_cd_ev_prev_desemb )          then btn_co_ev_reg_diClick(Sender);
    if ( Sender = dbedt_cd_ev_desemb )               then btn_co_ev_reg_diClick(Sender);
    if ( Sender = dbedt_cd_item_pis_cofins )         then btn_co_ev_reg_diClick(Sender);

    // Eventos - Tela 1 - Coluna 2
    if ( Sender = dbedt_cd_ev_prev_chegada )         then btn_co_ev_reg_diClick(Sender);
    if ( Sender = dbedt_cd_ev_chegada )              then btn_co_ev_reg_diClick(Sender);
    if ( Sender = dbedt_cd_ev_etd )                  then btn_co_ev_reg_diClick(Sender);
    if ( Sender = dbedt_cd_ev_dig_di )               then btn_co_ev_reg_diClick(Sender);
    if ( Sender = dbedt_cd_ev_ci )                   then btn_co_ev_reg_diClick(Sender);
    if ( Sender = dbedt_cd_ev_recep_analise )        then btn_co_ev_reg_diClick(Sender);
    if ( Sender = dbedt_cd_ev_receb_doc )            then btn_co_ev_reg_diClick(Sender);
    if ( Sender = dbedt_cd_ev_abre_proc )            then btn_co_ev_reg_diClick(Sender);
    if ( Sender = dbedt_cd_ev_num_imp )              then btn_co_ev_reg_diClick(Sender);
    if ( Sender = dbedt_cd_ev_rec_imp )              then btn_co_ev_reg_diClick(Sender);

    // Eventos - Tela 2 - Coluna 1
    if ( Sender = dbedt_cd_ev_num_frete )            then btn_co_ev_reg_diClick(Sender);
    if ( Sender = dbedt_cd_ev_rec_frete )            then btn_co_ev_reg_diClick(Sender);
    if ( Sender = dbedt_cd_ev_num_exp )              then btn_co_ev_reg_diClick(Sender);
    if ( Sender = dbedt_cd_ev_rec_exp )              then btn_co_ev_reg_diClick(Sender);
    if ( Sender = dbedt_cd_ev_pres_carga )           then btn_co_ev_reg_diClick(Sender);
    if ( Sender = dbedt_cd_ev_vencto_li )            then btn_co_ev_reg_diClick(Sender);
    if ( Sender = dbedt_cd_ev_desova )               then btn_co_ev_reg_diClick(Sender);
    if ( Sender = dbedt_cd_ev_lib_bl )               then btn_co_ev_reg_diClick(Sender);
    if ( Sender = dbedt_cd_ev_pag_demur )            then btn_co_ev_reg_diClick(Sender);
    if ( Sender = dbedt_cd_ev_pagto_icms )           then btn_co_ev_reg_diClick(Sender);

    // Eventos - Tela 2 - Coluna 2
    if ( Sender = dbedt_cd_ev_pag_arm )              then btn_co_ev_reg_diClick(Sender);
    if ( Sender = dbedt_cd_ev_pag_sda )              then btn_co_ev_reg_diClick(Sender);
    if ( Sender = dbedt_cd_ev_envio_imp )            then btn_co_ev_reg_diClick(Sender);
    if ( Sender = dbedt_cd_ev_envio_fat )            then btn_co_ev_reg_diClick(Sender);
    if ( Sender = dbedt_cd_ev_cambio_ok )            then btn_co_ev_reg_diClick(Sender);
    if ( Sender = dbedt_cd_ev_prev_embarque )        then btn_co_ev_reg_diClick(Sender);
    if ( Sender = dbedt_cd_ev_embarque )             then btn_co_ev_reg_diClick(Sender);
    if ( Sender = dbedt_cd_ev_entrega_merc )         then btn_co_ev_reg_diClick(Sender);
    if ( Sender = dbedt_cd_ev_averbacao )            then btn_co_ev_reg_diClick(Sender);
    if ( Sender = dbedt_cd_ev_ent_rec_fed )          then btn_co_ev_reg_diClick(Sender);

    // Eventos - Tela 3 - Coluna 1
    if ( Sender = dbedt_cd_ev_remocao )              then btn_co_ev_reg_diClick(Sender);
    if ( Sender = dbedt_cd_ev_prev_carregamento )    then btn_co_ev_reg_diClick(Sender);
    if ( Sender = dbedt_cd_ev_abert_di )             then btn_co_ev_reg_diClick(Sender);
    if ( Sender = dbedt_cd_ev_nf_entrada )           then btn_co_ev_reg_diClick(Sender);
    if ( Sender = dbedt_cd_ev_prev_entr_merc )       then btn_co_ev_reg_diClick(Sender);
    if ( Sender = dbedt_cd_ev_nf_transp )            then btn_co_ev_reg_diClick(Sender);
    if ( Sender = dbedt_cd_ev_cruze )                then btn_co_ev_reg_diClick(Sender);
    if ( Sender = dbedt_cd_ev_apresentacao )         then btn_co_ev_reg_diClick(Sender);
    if ( Sender = dbedt_cd_ev_prev_fabrica )         then btn_co_ev_reg_diClick(Sender);
    if ( Sender = dbedt_cd_ev_liberacao )            then btn_co_ev_reg_diClick(Sender);

    // Eventos - Tela 3 - Coluna 2
    if ( Sender = dbedt_cd_ev_reg_dde )              then btn_co_ev_reg_diClick(Sender);
    if ( Sender = dbedt_cd_ev_reg_re )               then btn_co_ev_reg_diClick(Sender);
    if ( Sender = dbedt_cd_ev_insp_ok )              then btn_co_ev_reg_diClick(Sender);
    if ( Sender = dbedt_cd_ev_atracacao )            then btn_co_ev_reg_diClick(Sender);
    if ( Sender = dbedt_cd_ev_solic_cambio )         then btn_co_ev_reg_diClick(Sender);
    if ( Sender = dbedt_cd_ev_solic_seguro )         then btn_co_ev_reg_diClick(Sender);
    if ( Sender = dbedt_cd_ev_receb_seguro )         then btn_co_ev_reg_diClick(Sender);
    if ( Sender = dbedt_cd_ev_solic_ministerio )     then btn_co_ev_reg_diClick(Sender);
    if ( Sender = dbedt_cd_ev_receb_ministerio )     then btn_co_ev_reg_diClick(Sender);
    if ( Sender = dbedt_cd_ev_canal )                then btn_co_ev_reg_diClick(Sender);

    // Eventos - Tela 4 - Coluna 1
    if ( Sender = dbedt_cd_env_comext )              then btn_co_ev_reg_diClick(Sender);
    if ( Sender = dbedt_cd_ev_lib_est )              then btn_co_ev_reg_diClick(Sender);
    if ( Sender = dbedt_cd_ev_form_dt )              then btn_co_ev_reg_diClick(Sender);
    if ( Sender = dbedt_cd_ev_lib_fab )              then btn_co_ev_reg_diClick(Sender);
    if ( Sender = dbedt_cd_ev_rec_dhl )              then btn_co_ev_reg_diClick(Sender);
    if ( Sender = dbedt_cd_ev_email_lib )            then btn_co_ev_reg_diClick(Sender);
    if ( Sender = dbedt_cd_ev_conf_docs )            then btn_co_ev_reg_diClick(Sender);
    if ( Sender = dbedt_cd_ev_solic_desova )         then btn_co_ev_reg_diClick(Sender);
    if ( Sender = dbedt_cd_ev_cert_origem )          then btn_co_ev_reg_diClick(Sender);
    if ( Sender = dbedt_cd_ev_dta_transp )           then btn_co_ev_reg_diClick(Sender);

    // Eventos - Tela 4 - Coluna 2
    if ( Sender = dbedt_cd_ev_ped_rec )              then btn_co_ev_reg_diClick(Sender);
    if ( Sender = dbedt_cd_ev_entr_merc_fabr )       then btn_co_ev_reg_diClick(Sender);
    if ( Sender = dbedt_cd_ev_dt_necessidade )       then btn_co_ev_reg_diClick(Sender);
    if ( Sender = dbedt_cd_ev_envio_doc_cli )        then btn_co_ev_reg_diClick(Sender);
    if ( Sender = dbedt_cd_ev_entr_eadi )            then btn_co_ev_reg_diClick(Sender);
    if ( Sender = dbedt_cd_ev_dt_consolidacao )      then btn_co_ev_reg_diClick(Sender);
    if ( Sender = dbedt_cd_ev_receb_ped )            then btn_co_ev_reg_diClick(Sender);
    if ( Sender = dbedt_cd_ev_solic_ov )             then btn_co_ev_reg_diClick(Sender);
    if ( Sender = dbedt_cd_ev_solic_remessa )        then btn_co_ev_reg_diClick(Sender);
    if ( Sender = dbedt_cd_ev_param_dta )            then btn_co_ev_reg_diClick(Sender);
    // Eventos - Tela 5 - Coluna 1
    if ( Sender = dbedt_cd_ev_pres_carga_eadi )      then btn_co_ev_reg_diClick(Sender);
    if ( Sender = dbedt_cd_ev_registro_dta )         then btn_co_ev_reg_diClick(Sender);
    if ( Sender = dbedtCdEvEntFabr)                  then btn_co_ev_reg_diClick(Sender);
    // Item - Tela 1 - Coluna 1
    if ( Sender = dbedt_cd_item_receb_num )          then btn_co_item_receb_numClick(Sender);
    if ( Sender = dbedt_cd_item_devol_num )          then btn_co_item_receb_numClick(Sender);
    if ( Sender = dbedt_cd_item_extor_num )          then btn_co_item_receb_numClick(Sender);
    if ( Sender = dbedt_cd_item_cpmf )               then btn_co_item_receb_numClick(Sender);
    if ( Sender = dbedt_cd_item_comissao )           then btn_co_item_receb_numClick(Sender);
    if ( Sender = dbedt_cd_item_exped )              then btn_co_item_receb_numClick(Sender);
    if ( Sender = dbedt_cd_item_afrmm )              then btn_co_item_receb_numClick(Sender);
    if ( Sender = dbedt_cd_item_desp_orig )          then btn_co_item_receb_numClick(Sender);
    if ( Sender = dbedt_cd_item_nvocc )              then btn_co_item_receb_numClick(Sender);
    if ( Sender = dbedt_cd_item_nao_fat )            then btn_co_item_receb_numClick(Sender);

    // Item - Tela 1 - Coluna 2
    if ( Sender = dbedt_cd_item_ir )                 then btn_co_item_receb_numClick(Sender);
    if ( Sender = dbedt_cd_item_iss )                then btn_co_item_receb_numClick(Sender);
    if ( Sender = dbedt_cd_item_sda )                then btn_co_item_receb_numClick(Sender);
    if ( Sender = dbedt_cd_item_saldo_cre )          then btn_co_item_receb_numClick(Sender);
    if ( Sender = dbedt_cd_item_saldo_deb )          then btn_co_item_receb_numClick(Sender);
    if ( Sender = dbedt_cd_item_receb_sd )           then btn_co_item_receb_numClick(Sender);
    if ( Sender = dbedt_cd_item_pagto_sd )           then btn_co_item_receb_numClick(Sender);
    if ( Sender = dbedt_cd_item_ext_receb )          then btn_co_item_receb_numClick(Sender);
    if ( Sender = dbedt_cd_item_ext_pagto )          then btn_co_item_receb_numClick(Sender);
    if ( Sender = dbedt_cd_item_pago_cli )           then btn_co_item_receb_numClick(Sender);
    if ( Sender = dbedt_cd_item_pago_cli )           then btn_co_item_receb_numClick(Sender);

    // Item - Tela 2 - Coluna 1
    if ( Sender = dbedt_cd_item_ii )                 then btn_co_item_receb_numClick(Sender);
    if ( Sender = dbedt_cd_item_ipi )                then btn_co_item_receb_numClick(Sender);
    if ( Sender = dbedt_cd_item_icms )               then btn_co_item_receb_numClick(Sender);
    if ( Sender = dbedt_cd_item_frete_aereo )        then btn_co_item_receb_numClick(Sender);
    if ( Sender = dbedt_cd_item_frete_mar )          then btn_co_item_receb_numClick(Sender);
    if ( Sender = dbedt_cd_item_seguro )             then btn_co_item_receb_numClick(Sender);
    if ( Sender = dbedt_cd_item_vmle )               then btn_co_item_receb_numClick(Sender);
    if ( Sender = dbedt_cd_item_acresc )             then btn_co_item_receb_numClick(Sender);
    if ( Sender = dbedt_cd_item_ded )                then btn_co_item_receb_numClick(Sender);
    if ( Sender = dbedt_cd_item_siscomex )           then btn_co_item_receb_numClick(Sender);

    // Item - Tela 2 - Coluna 2
    if ( Sender = dbedt_cd_item_servico_comissaria ) then btn_co_item_receb_numClick(Sender);
    if ( Sender = dbedt_cd_desconto )                then btn_co_item_receb_numClick(Sender);
    if ( Sender = dbedt_cd_item_demurrage )          then btn_co_item_receb_numClick(Sender);
    if ( Sender = dbedt_cd_item_logistica )          then btn_co_item_receb_numClick(Sender);
    if ( Sender = dbedt_cd_item_cofins )             then btn_co_item_receb_numClick(Sender);
    if ( Sender = dbedt_cd_item_cofins_ret )         then btn_co_item_receb_numClick(Sender);
    if ( Sender = dbedt_cd_item_mp164 )              then btn_co_item_receb_numClick(Sender);
    if ( Sender = dbedt_cd_item_pis_imp )            then btn_co_item_receb_numClick(Sender);
    if ( Sender = dbedt_cd_item_cofins_imp )         then btn_co_item_receb_numClick(Sender);

    //by carlos - FI
    if ( Sender = dbedt_cd_item_frt_mar_fi )         then btn_co_item_receb_numClick(Sender);
    if ( Sender = dbedt_cd_item_frt_aer_fi )         then btn_co_item_receb_numClick(Sender);
    if ( Sender = dbedt_cd_item_frt_rod_fi )         then btn_co_item_receb_numClick(Sender);

    // Contas Contábeis
    if ( Sender = dbedt_cd_ct_caixa )                then btn_co_cd_ct_caixaClick(Sender);
    if ( Sender = dbedt_cd_ct_ch_pagtos_div )        then btn_co_cd_ct_ch_pagtos_divClick(Sender);
    if ( Sender = dbedt_cd_ct_fat_a_classif )        then btn_co_cd_ct_fat_a_classifClick(Sender);
    if ( Sender = dbedt_cd_ct_ctaapagar )            then btn_co_cd_ct_ctaapagarClick(Sender);
    if ( Sender = dbedt_cd_ct_lp )                   then btn_co_cd_ct_lpClick(Sender);
    if ( Sender = dbedt_cd_ct_ir )                   then btn_co_cd_ct_irClick(Sender);
    if ( Sender = dbedt_cd_ct_inss )                 then btn_co_cd_ct_inssClick(Sender);
    if ( Sender = dbedt_cd_ct_juros )                then btn_co_cd_ct_jurosClick(Sender);
    if ( Sender = dbedt_cd_ct_desconto )             then btn_co_cd_ct_descontoClick(Sender);
    if ( Sender = dbedt_cd_ct_ctaareceber )          then btn_co_cd_ct_ctaareceberClick(Sender);

    // Contas Gerenciais
    if ( Sender = dbedt_cd_ct_ger_ctaareceber )      then btn_co_ct_ger_ctaareceberClick(Sender);
    if ( Sender = dbedt_cd_ct_ger_desconto )         then btn_co_ct_ger_descontoClick(Sender);
    if ( Sender = dbedt_cd_ct_ger_financeiro )       then btn_co_ct_ger_financeiroClick(Sender);

    // Documentos - Coluna 1
    if ( Sender = dbedt_cd_doc_nf_imp )              then btn_co_doc_nf_impClick(Sender);
    if ( Sender = dbedt_cd_doc_fat_imp )             then btn_co_doc_nf_impClick(Sender);
    if ( Sender = dbedt_cd_doc_re_imp )              then btn_co_doc_nf_impClick(Sender);

    // Documentos - Coluna 2
    if ( Sender = dbedt_cd_doc_nf_exp )              then btn_co_doc_nf_impClick(Sender);
    if ( Sender = dbedt_cd_doc_fat_exp )             then btn_co_doc_nf_impClick(Sender);
    if ( Sender = dbedt_cd_doc_re_exp )              then btn_co_doc_nf_impClick(Sender);

    // Demurrage
    if ( Sender = dbedt_cd_usuario_demurrage )       then btn_co_usuario_demurrageClick(Sender);

    // Entreposto
    if ( Sender = dbedt_cd_ev_venda_nac )            then btn_co_ev_venda_nacClick(Sender);
    if ( Sender = dbedt_cd_ev_envio_doc_nac )        then btn_co_ev_envio_doc_nacClick(Sender);

    // Geral
    if ( Sender = dbedt_cd_grupo_basf )              then btn_co_grupo_basfClick(Sender);
    if ( Sender = dbedt_cd_grupo_bsg )               then btn_co_grupo_bsgClick(Sender);
    if ( Sender = dbedt_cd_grupo_oxiteno )           then btn_co_grupo_oxitenoClick(Sender);
    if ( Sender = dbedt_cd_grupo_valspar )           then btn_co_grupo_valsparClick(Sender);
    if ( Sender = dbedt_cd_grupo_valtra )            then btn_co_grupo_valtraClick(Sender);
    if ( Sender = dbedt_cd_grupo_croda )             then btn_co_grupo_crodaClick(Sender);
  end;
end;

procedure Tfrm_param_sistema.btn_co_item_receb_numClick(Sender: TObject);
begin
  Application.CreateForm( Tfrm_item, frm_item );
  with frm_item, datm_param_sistema do
  begin
    // Tela 1 - Coluna 1
    if ( Sender = dbedt_cd_item_receb_num ) or ( Sender = btn_co_item_receb_num ) then
       Cons_OnLine := qry_parametros_CD_ITEM_RECEB_NUM;
    if ( Sender = dbedt_cd_item_devol_num ) or ( Sender = btn_co_item_devol_num ) then
       Cons_OnLine := qry_parametros_CD_ITEM_DEVOL_NUM;
    if ( Sender = dbedt_cd_item_extor_num ) or ( Sender = btn_co_item_extor_num ) then
       Cons_OnLine := qry_parametros_CD_ITEM_EXTOR_NUM;
    if ( Sender = dbedt_cd_item_cpmf ) or ( Sender = btn_co_item_cpmf ) then
       Cons_OnLine := qry_parametros_CD_ITEM_CPMF;
    if ( Sender = dbedt_cd_item_comissao ) or ( Sender = btn_co_item_comissao ) then
       Cons_OnLine := qry_parametros_CD_ITEM_COMISSAO;
    if ( Sender = dbedt_cd_item_exped ) or ( Sender = btn_co_item_exped ) then
       Cons_OnLine := qry_parametros_CD_ITEM_EXPED;
    if ( Sender = dbedt_cd_item_afrmm ) or ( Sender = btn_co_item_afrmm ) then
       Cons_OnLine := qry_parametros_CD_ITEM_AFRMM;
    if ( Sender = dbedt_cd_item_desp_orig ) or ( Sender = btn_co_item_desp_orig ) then
       Cons_OnLine := qry_parametros_CD_ITEM_DESP_ORIG;
    if ( Sender = dbedt_cd_item_nvocc ) or ( Sender = btn_co_item_nvocc ) then
       Cons_OnLine := qry_parametros_CD_ITEM_NVOCC;
    if ( Sender = dbedt_cd_item_nao_fat ) or ( Sender = btn_co_item_nao_fat ) then
       Cons_OnLine := qry_parametros_CD_ITEM_NAO_FAT;
    // Tela 1 - Coluna 2
    if ( Sender = dbedt_cd_item_ir ) or ( Sender = btn_co_item_ir ) then
       Cons_OnLine := qry_parametros_CD_ITEM_IR;
    if ( Sender = dbedt_cd_item_iss ) or ( Sender = btn_co_item_iss ) then
       Cons_OnLine := qry_parametros_CD_ITEM_ISS;
    if ( Sender = dbedt_cd_item_sda ) or ( Sender = btn_co_item_sda ) then
       Cons_OnLine := qry_parametros_CD_ITEM_SDA;
    if ( Sender = dbedt_cd_item_saldo_cre ) or ( Sender = btn_co_item_saldo_cre ) then
       Cons_OnLine := qry_parametros_CD_ITEM_SALDO_CRE;
    if ( Sender = dbedt_cd_item_saldo_deb ) or ( Sender = btn_co_item_saldo_deb ) then
       Cons_OnLine := qry_parametros_CD_ITEM_SALDO_DEB;
    if ( Sender = dbedt_cd_item_receb_sd ) or ( Sender = btn_co_item_receb_sd ) then
       Cons_OnLine := qry_parametros_CD_ITEM_RECEB_SD;
    if ( Sender = dbedt_cd_item_pagto_sd ) or ( Sender = btn_co_item_pagto_sd ) then
       Cons_OnLine := qry_parametros_CD_ITEM_PAGTO_SD;
    if ( Sender = dbedt_cd_item_ext_receb ) or ( Sender = btn_co_item_ext_receb ) then
       Cons_OnLine := qry_parametros_CD_ITEM_EXT_RECEB;
    if ( Sender = dbedt_cd_item_ext_pagto ) or ( Sender = btn_co_item_ext_pagto ) then
       Cons_OnLine := qry_parametros_CD_ITEM_EXT_PAGTO;
    if ( Sender = dbedt_cd_item_pago_cli ) or ( Sender = btn_co_item_pago_cli ) then
       Cons_OnLine := qry_parametros_CD_ITEM_PAGO_CLI;
    // Tela 2 - Coluna 1
    if ( Sender = dbedt_cd_item_ii ) or ( Sender = btn_co_item_ii ) then
       Cons_OnLine := qry_parametros_CD_ITEM_II;
    if ( Sender = dbedt_cd_item_ipi ) or ( Sender = btn_co_item_ipi ) then
       Cons_OnLine := qry_parametros_CD_ITEM_IPI;
    if ( Sender = dbedt_cd_item_icms ) or ( Sender = btn_co_item_icms ) then
       Cons_OnLine := qry_parametros_CD_ITEM_ICMS;
    if ( Sender = dbedt_cd_item_frete_aereo ) or ( Sender = btn_co_item_frete_aereo ) then
       Cons_OnLine := qry_parametros_CD_ITEM_FRETE_AEREO;
    if ( Sender = dbedt_cd_item_frete_mar ) or ( Sender = btn_co_item_frete_mar ) then
       Cons_OnLine := qry_parametros_CD_ITEM_FRETE_MAR;
    if ( Sender = dbedt_cd_item_seguro ) or ( Sender = btn_co_item_seguro ) then
       Cons_OnLine := qry_parametros_CD_ITEM_SEGURO;
    if ( Sender = dbedt_cd_item_vmle ) or ( Sender = btn_co_item_vmle ) then
       Cons_OnLine := qry_parametros_CD_ITEM_VMLE;
    if ( Sender = dbedt_cd_item_acresc ) or ( Sender = btn_co_item_acresc ) then
       Cons_OnLine := qry_parametros_CD_ITEM_ACRESC;
    if ( Sender = dbedt_cd_item_ded ) or ( Sender = btn_co_item_ded ) then
       Cons_OnLine := qry_parametros_CD_ITEM_DED;
    if ( Sender = dbedt_cd_item_siscomex ) or ( Sender = btn_co_item_siscomex ) then
       Cons_OnLine := qry_parametros_CD_ITEM_SISCOMEX;
    // Tela 2 - Coluna 2
    if ( Sender = dbedt_cd_item_servico_comissaria ) or ( Sender = btn_co_item_servico_comissaria ) then
       Cons_OnLine := qry_parametros_CD_ITEM_SERVICO_COMISSARIA;
    if ( Sender = dbedt_cd_desconto ) or ( Sender = btn_co_item_desconto ) then
       Cons_OnLine := qry_parametros_CD_ITEM_DESCONTO;
    if ( Sender = dbedt_cd_item_demurrage ) or ( Sender = btn_co_item_demurrage ) then
       Cons_OnLine := qry_parametros_CD_ITEM_DEMURRAGE;
    if ( Sender = dbedt_cd_item_logistica ) or ( Sender = btn_co_item_logistica ) then
       Cons_OnLine := qry_parametros_CD_ITEM_LOGISTICA;
    if ( Sender = dbedt_cd_item_cofins ) or ( Sender = btn_co_item_cofins ) then
       Cons_OnLine := qry_parametros_CD_ITEM_COFINS;
    if ( Sender = dbedt_cd_item_cofins_ret ) or ( Sender = btn_co_item_cofins_ret ) then
       Cons_OnLine := qry_parametros_CD_ITEM_COFINS_RETENCAO;
    if ( Sender = dbedt_cd_item_mp164 ) or ( Sender = btn_co_item_mp164 ) then
       Cons_OnLine := qry_parametros_CD_ITEM_MP164;
    if ( Sender = dbedt_cd_item_pis_imp ) or ( Sender = btn_co_item_pis_imp ) then
       Cons_OnLine := qry_parametros_CD_ITEM_PIS_IMP;
    if ( Sender = dbedt_cd_item_cofins_imp ) or ( Sender = btn_co_item_cofins_imp ) then
       Cons_OnLine := qry_parametros_CD_ITEM_COFINS_IMP;
    if ( Sender = dbedt_cd_item_pis_cofins ) or ( Sender = btn_co_item_pis_cofins ) then
       Cons_OnLine := qry_parametros_CD_ITEM_PIS_COFINS;

    //by carlos - FI
    if ( Sender = dbedt_cd_item_frt_mar_fi ) or ( Sender = btn_co_item_frt_mar_fi ) then
       Cons_OnLine := qry_parametros_CD_ITEM_FRT_MAR_FI;
    if ( Sender = dbedt_cd_item_frt_aer_fi ) or ( Sender = btn_co_item_frt_aer_fi ) then
       Cons_OnLine := qry_parametros_CD_ITEM_FRT_AER_FI;
    if ( Sender = dbedt_cd_item_frt_rod_fi ) or ( Sender = btn_co_item_frt_rod_fi ) then
       Cons_OnLine := qry_parametros_CD_ITEM_FRT_ROD_FI;
    if ( Sender = dbedt_cd_item_frt_seguro ) or ( Sender = btn_co_item_frt_seguro ) then
       Cons_OnLine := qry_parametros_CD_ITEM_FRT_SEGURO;

    //fim


    Caption := Caption + ' [Consulta On-Line]';
    lCons_OnLine := True;
    if Not ( qry_parametros_.State in [dsEdit, dsInsert] ) then qry_parametros_.Edit;
    ShowModal;
    lCons_OnLine := False;

    qry_item_.Close;
    qry_item_.Prepare;
    qry_item_.Open;
  end;

  // Tela 1 - Coluna 1
  if ( Sender = dbedt_cd_item_receb_num )   or ( Sender = btn_co_item_receb_num )   then dbedt_cd_item_receb_numExit(nil);
  if ( Sender = dbedt_cd_item_devol_num )   or ( Sender = btn_co_item_devol_num )   then dbedt_cd_item_devol_numExit(nil);
  if ( Sender = dbedt_cd_item_extor_num )   or ( Sender = btn_co_item_extor_num )   then dbedt_cd_item_extor_numExit(nil);
  if ( Sender = dbedt_cd_item_cpmf )        or ( Sender = btn_co_item_cpmf )        then dbedt_cd_item_cpmfExit(nil);
  if ( Sender = dbedt_cd_item_comissao )    or ( Sender = btn_co_item_comissao )    then dbedt_cd_item_comissaoExit(nil);
  if ( Sender = dbedt_cd_item_exped )       or ( Sender = btn_co_item_exped )       then dbedt_cd_item_expedExit(nil);
  if ( Sender = dbedt_cd_item_afrmm )       or ( Sender = btn_co_item_afrmm )       then dbedt_cd_item_afrmmExit(nil);
  if ( Sender = dbedt_cd_item_desp_orig )   or ( Sender = btn_co_item_desp_orig )   then dbedt_cd_item_desp_origExit(nil);
  if ( Sender = dbedt_cd_item_nvocc )       or ( Sender = btn_co_item_nvocc )       then dbedt_cd_item_nvoccExit(nil);
  if ( Sender = dbedt_cd_item_nao_fat )     or ( Sender = btn_co_item_nao_fat )     then dbedt_cd_item_nao_fatExit(nil);
  // Tela 1 - Coluna 2
  if ( Sender = dbedt_cd_item_ir )          or ( Sender = btn_co_item_ir )          then dbedt_cd_item_irExit(nil);
  if ( Sender = dbedt_cd_item_iss )         or ( Sender = btn_co_item_iss )         then dbedt_cd_item_issExit(nil);
  if ( Sender = dbedt_cd_item_sda )         or ( Sender = btn_co_item_sda )         then dbedt_cd_item_sdaExit(nil);
  if ( Sender = dbedt_cd_item_saldo_cre )   or ( Sender = btn_co_item_saldo_cre )   then dbedt_cd_item_saldo_creExit(nil);
  if ( Sender = dbedt_cd_item_saldo_deb )   or ( Sender = btn_co_item_saldo_deb )   then dbedt_cd_item_saldo_debExit(nil);
  if ( Sender = dbedt_cd_item_receb_sd )    or ( Sender = btn_co_item_receb_sd )    then dbedt_cd_item_receb_sdExit(nil);
  if ( Sender = dbedt_cd_item_pagto_sd )    or ( Sender = btn_co_item_pagto_sd )    then dbedt_cd_item_pagto_sdExit(nil);
  if ( Sender = dbedt_cd_item_ext_receb )   or ( Sender = btn_co_item_ext_receb )   then dbedt_cd_item_ext_recebExit(nil);
  if ( Sender = dbedt_cd_item_ext_pagto )   or ( Sender = btn_co_item_ext_pagto )   then dbedt_cd_item_ext_pagtoExit(nil);
  if ( Sender = dbedt_cd_item_pago_cli )    or ( Sender = btn_co_item_pago_cli )    then dbedt_cd_item_pago_cliExit(nil);
  // Tela 2 - Coluna 1
  if ( Sender = dbedt_cd_item_ii )          or ( Sender = btn_co_item_ii )          then dbedt_cd_item_iiExit(nil);
  if ( Sender = dbedt_cd_item_ipi )         or ( Sender = btn_co_item_ipi )         then dbedt_cd_item_ipiExit(nil);
  if ( Sender = dbedt_cd_item_icms )        or ( Sender = btn_co_item_icms )        then dbedt_cd_item_icmsExit(nil);
  if ( Sender = dbedt_cd_item_frete_aereo ) or ( Sender = btn_co_item_frete_aereo ) then dbedt_cd_item_frete_aereoExit(nil);
  if ( Sender = dbedt_cd_item_frete_mar )   or ( Sender = btn_co_item_frete_mar )   then dbedt_cd_item_frete_marExit(nil);
  if ( Sender = dbedt_cd_item_seguro )      or ( Sender = btn_co_item_seguro )      then dbedt_cd_item_seguroExit(nil);
  if ( Sender = dbedt_cd_item_vmle )        or ( Sender = btn_co_item_vmle )        then dbedt_cd_item_vmleExit(nil);
  if ( Sender = dbedt_cd_item_acresc )      or ( Sender = btn_co_item_acresc )      then dbedt_cd_item_acrescExit(nil);
  if ( Sender = dbedt_cd_item_ded )         or ( Sender = btn_co_item_ded )         then dbedt_cd_item_dedExit(nil);
  if ( Sender = dbedt_cd_item_siscomex )    or ( Sender = btn_co_item_siscomex )    then dbedt_cd_item_receb_numExit(nil);
  // Tela 2 - Coluna 1
  if ( Sender = dbedt_cd_item_servico_comissaria ) or ( Sender = btn_co_item_servico_comissaria ) then dbedt_cd_item_servico_comissariaExit(nil);
  if ( Sender = dbedt_cd_desconto )         or ( Sender = btn_co_item_desconto )    then dbedt_cd_descontoExit(nil);
  if ( Sender = dbedt_cd_item_demurrage )   or ( Sender = btn_co_item_demurrage )   then dbedt_cd_item_demurrageExit(nil);
  if ( Sender = dbedt_cd_item_logistica )   or ( Sender = btn_co_item_logistica )   then dbedt_cd_item_logisticaExit(nil);
  if ( Sender = dbedt_cd_item_cofins )      or ( Sender = btn_co_item_cofins )      then dbedt_cd_item_cofinsExit(nil);
  if ( Sender = dbedt_cd_item_cofins_ret )  or ( Sender = btn_co_item_cofins_ret )  then dbedt_cd_item_cofins_retExit(nil);
  if ( Sender = dbedt_cd_item_mp164 )       or ( Sender = btn_co_item_mp164 )       then dbedt_cd_item_mp164Exit(nil);
  if ( Sender = dbedt_cd_item_pis_imp )     or ( Sender = btn_co_item_pis_imp )     then dbedt_cd_item_pis_impExit(nil);
  if ( Sender = dbedt_cd_item_cofins_imp )  or ( Sender = btn_co_item_cofins_imp )  then dbedt_cd_item_cofins_impExit(nil);
end;


procedure Tfrm_param_sistema.dbedt_cd_item_receb_numExit(Sender: TObject);
begin
  if ( datm_param_sistema.qry_parametros_.State in [dsEdit, dsInsert] ) then
  begin
    ValidCodigo( dbedt_cd_item_receb_num );
    if dbedt_cd_item_receb_num.Text <> '' then
    begin
      if dbedt_nm_item_receb_num.Text = '' then
      begin
        BoxMensagem( 'Código do Item Recebimento de Numerário inválido!', 2 );
        pgctrl_param.ActivePage := ts_item1;
        dbedt_cd_item_receb_num.SetFocus;
        Exit;
      end;
    end;
  end;
end;

procedure Tfrm_param_sistema.dbedt_cd_item_devol_numExit(Sender: TObject);
begin
  if ( datm_param_sistema.qry_parametros_.State in [dsEdit, dsInsert] ) then
  begin
    ValidCodigo( dbedt_cd_item_devol_num );
    if dbedt_cd_item_devol_num.Text <> '' then
    begin
      if dbedt_nm_item_devol_num.Text = '' then
      begin
        BoxMensagem( 'Código do Item Devolução de Numerário inválido!', 2 );
        pgctrl_param.ActivePage := ts_item1;
        dbedt_cd_item_devol_num.SetFocus;
        Exit;
      end;
    end;
  end;
end;

procedure Tfrm_param_sistema.dbedt_cd_item_extor_numExit(Sender: TObject);
begin
  if ( datm_param_sistema.qry_parametros_.State in [dsEdit, dsInsert] ) then
  begin
    ValidCodigo( dbedt_cd_item_extor_num );
    if dbedt_cd_item_extor_num.Text <> '' then
    begin
      if dbedt_nm_item_extor_num.Text = '' then
      begin
        BoxMensagem( 'Código do Item Estorno de Numerário inválido!', 2 );
        pgctrl_param.ActivePage := ts_item1;
        dbedt_cd_item_extor_num.SetFocus;
        Exit;
      end;
    end;
  end;
end;

procedure Tfrm_param_sistema.dbedt_cd_item_cpmfExit(Sender: TObject);
begin
  if ( datm_param_sistema.qry_parametros_.State in [dsEdit, dsInsert] ) then
  begin
    ValidCodigo( dbedt_cd_item_cpmf );
    if dbedt_cd_item_cpmf.Text <> '' then
    begin
      if dbedt_nm_item_cpmf.Text = '' then
      begin
        BoxMensagem( 'Código do Item CPMF inválido!', 2 );
        pgctrl_param.ActivePage := ts_item1;
        dbedt_cd_item_cpmf.SetFocus;
        Exit;
      end;
    end;
  end;
end;

procedure Tfrm_param_sistema.dbedt_cd_item_comissaoExit(Sender: TObject);
begin
  if ( datm_param_sistema.qry_parametros_.State in [dsEdit, dsInsert] ) then
  begin
    ValidCodigo( dbedt_cd_item_comissao );
    if dbedt_cd_item_comissao.Text <> '' then
    begin
      if dbedt_nm_item_comissao.Text = '' then
      begin
        BoxMensagem( 'Código do Item Comissão inválido!', 2 );
        pgctrl_param.ActivePage := ts_item1;
        dbedt_cd_item_receb_num.SetFocus;
        Exit;
      end;
    end;
  end;
end;

procedure Tfrm_param_sistema.dbedt_cd_item_expedExit(Sender: TObject);
begin
  if ( datm_param_sistema.qry_parametros_.State in [dsEdit, dsInsert] ) then
  begin
    ValidCodigo( dbedt_cd_item_exped );
    if dbedt_cd_item_exped.Text <> '' then
    begin
      if dbedt_nm_item_exped.Text = '' then
      begin
        BoxMensagem( 'Código do Item Expediente inválido!', 2 );
        pgctrl_param.ActivePage := ts_item1;
        dbedt_cd_item_exped.SetFocus;
        Exit;
      end;
    end;
  end;
end;

procedure Tfrm_param_sistema.dbedt_cd_item_afrmmExit(Sender: TObject);
begin
  if ( datm_param_sistema.qry_parametros_.State in [dsEdit, dsInsert] ) then
  begin
    ValidCodigo( dbedt_cd_item_afrmm );
    if dbedt_cd_item_afrmm.Text <> '' then
    begin
      if dbedt_nm_item_afrmm.Text = '' then
      begin
        BoxMensagem( 'Código do Item AFRMM inválido!', 2 );
        pgctrl_param.ActivePage := ts_item1;
        dbedt_cd_item_afrmm.SetFocus;
        Exit;
      end;
    end;
  end;
end;

procedure Tfrm_param_sistema.dbedt_cd_item_desp_origExit(Sender: TObject);
begin
  if ( datm_param_sistema.qry_parametros_.State in [dsEdit, dsInsert] ) then
  begin
    ValidCodigo( dbedt_cd_item_desp_orig );
    if dbedt_cd_item_desp_orig.Text <> '' then
    begin
      if dbedt_nm_item_desp_orig.Text = '' then
      begin
        BoxMensagem( 'Código do Item Despesas de Origem inválido!', 2 );
        pgctrl_param.ActivePage := ts_item1;
        dbedt_cd_item_desp_orig.SetFocus;
        Exit;
      end;
    end;
  end;
end;

procedure Tfrm_param_sistema.dbedt_cd_item_nvoccExit(Sender: TObject);
begin
  if ( datm_param_sistema.qry_parametros_.State in [dsEdit, dsInsert] ) then
  begin
    ValidCodigo( dbedt_cd_item_nvocc );
    if dbedt_cd_item_nvocc.Text <> '' then
    begin
      if dbedt_nm_item_nvocc.Text = '' then
      begin
        BoxMensagem( 'Código do Item NVOCC inválido!', 2 );
        pgctrl_param.ActivePage := ts_item1;
        dbedt_cd_item_nvocc.SetFocus;
        Exit;
      end;
    end;
  end;
end;

procedure Tfrm_param_sistema.dbedt_cd_item_nao_fatExit(Sender: TObject);
begin
  if ( datm_param_sistema.qry_parametros_.State in [dsEdit, dsInsert] ) then
  begin
    ValidCodigo( dbedt_cd_item_nao_fat );
    if dbedt_cd_item_nao_fat.Text <> '' then
    begin
      if dbedt_nm_item_nao_fat.Text = '' then
      begin
        BoxMensagem( 'Código do Item Não Faturável inválido!', 2 );
        pgctrl_param.ActivePage := ts_item1;
        dbedt_cd_item_nao_fat.SetFocus;
        Exit;
      end;
    end;
  end;
end;

procedure Tfrm_param_sistema.dbedt_cd_item_irExit(Sender: TObject);
begin
  if ( datm_param_sistema.qry_parametros_.State in [dsEdit, dsInsert] ) then
  begin
    ValidCodigo( dbedt_cd_item_ir );
    if dbedt_cd_item_ir.Text <> '' then
    begin
      if dbedt_nm_item_ir.Text = '' then
      begin
        BoxMensagem( 'Código do Item I.R.R.F. inválido!', 2 );
        pgctrl_param.ActivePage := ts_item1;
        dbedt_cd_item_ir.SetFocus;
        Exit;
      end;
    end;
  end;
end;

procedure Tfrm_param_sistema.dbedt_cd_item_issExit(Sender: TObject);
begin
  if ( datm_param_sistema.qry_parametros_.State in [dsEdit, dsInsert] ) then
  begin
    ValidCodigo( dbedt_cd_item_iss );
    if dbedt_cd_item_iss.Text <> '' then
    begin
      if dbedt_nm_item_iss.Text = '' then
      begin
        BoxMensagem( 'Código do Item I.S.S. inválido!', 2 );
        pgctrl_param.ActivePage := ts_item1;
        dbedt_cd_item_iss.SetFocus;
        Exit;
      end;
    end;
  end;
end;

procedure Tfrm_param_sistema.dbedt_cd_item_sdaExit(Sender: TObject);
begin
  if ( datm_param_sistema.qry_parametros_.State in [dsEdit, dsInsert] ) then
  begin
    ValidCodigo( dbedt_cd_item_sda );
    if dbedt_cd_item_sda.Text <> '' then
    begin
      if dbedt_nm_item_sda.Text = '' then
      begin
        BoxMensagem( 'Código do Item S.D.A. inválido!', 2 );
        pgctrl_param.ActivePage := ts_item1;
        dbedt_cd_item_sda.SetFocus;
        Exit;
      end;
    end;
  end;
end;

procedure Tfrm_param_sistema.dbedt_cd_item_saldo_creExit(Sender: TObject);
begin
  if ( datm_param_sistema.qry_parametros_.State in [dsEdit, dsInsert] ) then
  begin
    ValidCodigo( dbedt_cd_item_saldo_cre );
    if dbedt_cd_item_saldo_cre.Text <> '' then
    begin
      if dbedt_nm_item_saldo_cre.Text = '' then
      begin
        BoxMensagem( 'Código do Item Saldo Credor inválido!', 2 );
        pgctrl_param.ActivePage := ts_item1;
        dbedt_cd_item_saldo_cre.SetFocus;
        Exit;
      end;
    end;
  end;
end;

procedure Tfrm_param_sistema.dbedt_cd_item_saldo_debExit(Sender: TObject);
begin
  if ( datm_param_sistema.qry_parametros_.State in [dsEdit, dsInsert] ) then
  begin
    ValidCodigo( dbedt_cd_item_saldo_deb );
    if dbedt_cd_item_saldo_deb.Text <> '' then
    begin
      if dbedt_nm_item_saldo_deb.Text = '' then
      begin
        BoxMensagem( 'Código do Item Saldo Devedor inválido!', 2 );
        pgctrl_param.ActivePage := ts_item1;
        dbedt_cd_item_saldo_deb.SetFocus;
        Exit;
      end;
    end;
  end;
end;

procedure Tfrm_param_sistema.dbedt_cd_item_receb_sdExit(Sender: TObject);
begin
  if ( datm_param_sistema.qry_parametros_.State in [dsEdit, dsInsert] ) then
  begin
    ValidCodigo( dbedt_cd_item_receb_sd );
    if dbedt_cd_item_receb_sd.Text <> '' then
    begin
      if dbedt_nm_item_receb_sd.Text = '' then
      begin
        BoxMensagem( 'Código do Item S/Pagto inválido!', 2 );
        pgctrl_param.ActivePage := ts_item1;
        dbedt_cd_item_receb_sd.SetFocus;
        Exit;
      end;
    end;
  end;
end;

procedure Tfrm_param_sistema.dbedt_cd_item_pagto_sdExit(Sender: TObject);
begin
  if ( datm_param_sistema.qry_parametros_.State in [dsEdit, dsInsert] ) then
  begin
    ValidCodigo( dbedt_cd_item_pagto_sd );
    if dbedt_cd_item_pagto_sd.Text <> '' then
    begin
      if dbedt_nm_item_pagto_sd.Text = '' then
      begin
        BoxMensagem( 'Código do Item N/Pagto inválido!', 2 );
        pgctrl_param.ActivePage := ts_item1;
        dbedt_cd_item_pagto_sd.SetFocus;
        Exit;
      end;
    end;
  end;
end;

procedure Tfrm_param_sistema.dbedt_cd_item_ext_recebExit(Sender: TObject);
begin
  if ( datm_param_sistema.qry_parametros_.State in [dsEdit, dsInsert] ) then
  begin
    ValidCodigo( dbedt_cd_item_ext_receb );
    if dbedt_cd_item_ext_receb.Text <> '' then
    begin
      if dbedt_nm_item_ext_receb.Text = '' then
      begin
        BoxMensagem( 'Código do Item Estorno S/Pagto inválido!', 2 );
        pgctrl_param.ActivePage := ts_item1;
        dbedt_cd_item_ext_receb.SetFocus;
        Exit;
      end;
    end;
  end;
end;

procedure Tfrm_param_sistema.dbedt_cd_item_ext_pagtoExit(Sender: TObject);
begin
  if ( datm_param_sistema.qry_parametros_.State in [dsEdit, dsInsert] ) then
  begin
    ValidCodigo( dbedt_cd_item_ext_pagto );
    if dbedt_cd_item_ext_pagto.Text <> '' then
    begin
      if dbedt_nm_item_ext_pagto.Text = '' then
      begin
        BoxMensagem( 'Código do Item Estorno N/Pagto inválido!', 2 );
        pgctrl_param.ActivePage := ts_item1;
        dbedt_cd_item_ext_pagto.SetFocus;
        Exit;
      end;
    end;
  end;
end;

procedure Tfrm_param_sistema.dbedt_cd_item_pago_cliExit(Sender: TObject);
begin
  if ( datm_param_sistema.qry_parametros_.State in [dsEdit, dsInsert] ) then
  begin
    ValidCodigo( dbedt_cd_item_pago_cli );
    if dbedt_cd_item_pagto_sd.Text <> '' then
    begin
      if dbedt_nm_item_pagto_sd.Text = '' then
      begin
        BoxMensagem( 'Código do Item Pago Direto pelo Cliente inválido!', 2 );
        pgctrl_param.ActivePage := ts_item1;
        dbedt_cd_item_pago_cli.SetFocus;
        Exit;
      end;
    end;
  end;
end;

procedure Tfrm_param_sistema.dbedt_cd_item_iiExit(Sender: TObject);
begin
  if ( datm_param_sistema.qry_parametros_.State in [dsEdit, dsInsert] ) then
  begin
    ValidCodigo( dbedt_cd_item_ii );
    if dbedt_cd_item_ii.Text <> '' then
    begin
      if dbedt_nm_item_ii.Text = '' then
      begin
        BoxMensagem( 'Código do Item I.I. inválido!', 2 );
        pgctrl_param.ActivePage := ts_item2;
        dbedt_cd_item_ii.SetFocus;
        Exit;
      end;
    end;
  end;
end;

procedure Tfrm_param_sistema.dbedt_cd_item_ipiExit(Sender: TObject);
begin
  if ( datm_param_sistema.qry_parametros_.State in [dsEdit, dsInsert] ) then
  begin
    ValidCodigo( dbedt_cd_item_ipi );
    if dbedt_cd_item_ipi.Text <> '' then
    begin
      if dbedt_nm_item_ipi.Text = '' then
      begin
        BoxMensagem( 'Código do Item I.P.I. inválido!', 2 );
        pgctrl_param.ActivePage := ts_item2;
        dbedt_cd_item_ipi.SetFocus;
        Exit;
      end;
    end;
  end;
end;

procedure Tfrm_param_sistema.dbedt_cd_item_icmsExit(Sender: TObject);
begin
  if ( datm_param_sistema.qry_parametros_.State in [dsEdit, dsInsert] ) then
  begin
    ValidCodigo( dbedt_cd_item_icms );
    if dbedt_cd_item_icms.Text <> '' then
    begin
      if dbedt_nm_item_icms.Text = '' then
      begin
        BoxMensagem( 'Código do Item I.C.M.S. inválido!', 2 );
        pgctrl_param.ActivePage := ts_item2;
        dbedt_cd_item_icms.SetFocus;
        Exit;
      end;
    end;
  end;
end;

procedure Tfrm_param_sistema.dbedt_cd_item_frete_aereoExit(Sender: TObject);
begin
  if ( datm_param_sistema.qry_parametros_.State in [dsEdit, dsInsert] ) then
  begin
    ValidCodigo( dbedt_cd_item_frete_aereo );
    if dbedt_cd_item_frete_aereo.Text <> '' then
    begin
      if dbedt_nm_item_frete_aereo.Text = '' then
      begin
        BoxMensagem( 'Código do Item Frete Aéreo inválido!', 2 );
        pgctrl_param.ActivePage := ts_item2;
        dbedt_cd_item_frete_aereo.SetFocus;
        Exit;
      end;
    end;
  end;
end;

procedure Tfrm_param_sistema.dbedt_cd_item_frete_marExit(Sender: TObject);
begin
  if ( datm_param_sistema.qry_parametros_.State in [dsEdit, dsInsert] ) then
  begin
    ValidCodigo( dbedt_cd_item_frete_mar );
    if dbedt_cd_item_frete_mar.Text <> '' then
    begin
      if dbedt_nm_item_frete_mar.Text = '' then
      begin
        BoxMensagem( 'Código do Item Frete Marítimo inválido!', 2 );
        pgctrl_param.ActivePage := ts_item2;
        dbedt_cd_item_frete_mar.SetFocus;
        Exit;
      end;
    end;
  end;
end;

procedure Tfrm_param_sistema.dbedt_cd_item_seguroExit(Sender: TObject);
begin
  if ( datm_param_sistema.qry_parametros_.State in [dsEdit, dsInsert] ) then
  begin
    ValidCodigo( dbedt_cd_item_seguro );
    if dbedt_cd_item_seguro.Text <> '' then
    begin
      if dbedt_nm_item_seguro.Text = '' then
      begin
        BoxMensagem( 'Código do Item Seguro inválido!', 2 );
        pgctrl_param.ActivePage := ts_item2;
        dbedt_cd_item_seguro.SetFocus;
        Exit;
      end;
    end;
  end;
end;

procedure Tfrm_param_sistema.dbedt_cd_item_vmleExit(Sender: TObject);
begin
  if ( datm_param_sistema.qry_parametros_.State in [dsEdit, dsInsert] ) then
  begin
    ValidCodigo( dbedt_cd_item_vmle );
    if dbedt_cd_item_vmle.Text <> '' then
    begin
      if dbedt_nm_item_vmle.Text = '' then
      begin
        BoxMensagem( 'Código do Item V.M.L.E. inválido!', 2 );
        pgctrl_param.ActivePage := ts_item2;
        dbedt_cd_item_vmle.SetFocus;
        Exit;
      end;
    end;
  end;
end;

procedure Tfrm_param_sistema.dbedt_cd_item_acrescExit(Sender: TObject);
begin
  if ( datm_param_sistema.qry_parametros_.State in [dsEdit, dsInsert] ) then
  begin
    ValidCodigo( dbedt_cd_item_acresc );
    if dbedt_cd_item_acresc.Text <> '' then
    begin
      if dbedt_nm_item_acresc.Text = '' then
      begin
        BoxMensagem( 'Código do Item Acréscimo inválido!', 2 );
        pgctrl_param.ActivePage := ts_item2;
        dbedt_cd_item_acresc.SetFocus;
        Exit;
      end;
    end;
  end;
end;

procedure Tfrm_param_sistema.dbedt_cd_item_dedExit(Sender: TObject);
begin
  if ( datm_param_sistema.qry_parametros_.State in [dsEdit, dsInsert] ) then
  begin
    ValidCodigo( dbedt_cd_item_ded );
    if dbedt_cd_item_ded.Text <> '' then
    begin
      if dbedt_nm_item_ded.Text = '' then
      begin
        BoxMensagem( 'Código do Item Dedução inválido!', 2 );
        pgctrl_param.ActivePage := ts_item2;
        dbedt_cd_item_ded.SetFocus;
        Exit;
      end;
    end;
  end;
end;

procedure Tfrm_param_sistema.dbedt_cd_item_siscomexExit(Sender: TObject);
begin
  if ( datm_param_sistema.qry_parametros_.State in [dsEdit, dsInsert] ) then
  begin
    ValidCodigo( dbedt_cd_item_siscomex );
    if dbedt_cd_item_siscomex.Text <> '' then
    begin
      if dbedt_nm_item_siscomex.Text = '' then
      begin
        BoxMensagem( 'Código do Item Taxa de Siscomex inválido!', 2 );
        pgctrl_param.ActivePage := ts_item2;
        dbedt_cd_item_siscomex.SetFocus;
        Exit;
      end;
    end;
  end;
end;

procedure Tfrm_param_sistema.dbedt_cd_ev_ent_rec_fedExit(Sender: TObject);
begin
  if ( datm_param_sistema.qry_parametros_.State in [dsEdit, dsInsert] ) then
  begin
    ValidCodigo( dbedt_cd_ev_ent_rec_fed );
    if dbedt_cd_ev_ent_rec_fed.Text <> '' then
    begin
      if dbedt_nm_ev_ent_rec_fed.Text = '' then
      begin
        BoxMensagem( 'Código do evento Entrega na Receita Federal inválido!', 2 );
        pgctrl_param.ActivePage := ts_eventos_2;
        dbedt_cd_ev_ent_rec_fed.SetFocus;
        Exit;
      end;
    end;
  end;
end;

procedure Tfrm_param_sistema.dbedt_cd_banco_cob_autExit(Sender: TObject);
begin
  if ( datm_param_sistema.qry_parametros_.State in [dsEdit, dsInsert] ) then
  begin
    ValidCodigo( dbedt_cd_banco_cob_aut );
    if dbedt_cd_banco_cob_aut.Text <> '' then
    begin
      if dbedt_nm_banco_cob_aut.Text = '' then
      begin
        BoxMensagem( 'Cód do Banco para Cobrança Automática inválido!', 2 );
        pgctrl_param.ActivePage := ts_geral;
        dbedt_cd_banco_cob_aut.SetFocus;
        Exit;
      end;
    end;
  end;
end;

procedure Tfrm_param_sistema.btn_co_banco_cob_autClick(Sender: TObject);
begin
  Application.CreateForm( Tfrm_banco, frm_banco );
  with frm_banco, datm_param_sistema do
  begin
    Cons_OnLine := qry_parametros_CD_BANCO_COB_AUT;
    Caption := Caption + ' [Consulta On-Line]';
    lCons_OnLine := True;
    if Not ( qry_parametros_.State in [dsEdit, dsInsert] ) then qry_parametros_.Edit;
    ShowModal;
    lCons_OnLine := False;

    qry_banco_.Close;
    qry_banco_.Prepare;
    qry_banco_.Open;
  end;
  dbedt_cd_banco_cob_autExit(nil);
end;

procedure Tfrm_param_sistema.dbedt_nr_carteira_cob_autExit(
  Sender: TObject);
begin
  if ( datm_param_sistema.qry_parametros_.State in [dsEdit, dsInsert] ) then
  begin
    ValidCodigo( dbedt_nr_carteira_cob_aut );
  end;
end;

procedure Tfrm_param_sistema.btn_co_cd_ct_caixaClick(Sender: TObject);
begin
  if datm_param_sistema.qry_parametros_.FieldByName('CD_SISTEMA_CONTABIL').AsString = '0' then
  begin
    Cons_On_line( 'DBBROKER', 'TCONTABIL_PLANO', datm_param_sistema.qry_parametros_CD_CT_CAIXA,
                  'Contas Contábeis', 8,
                  'SELECT CD_COLIGADA, CD_CT_CONTABIL, NM_CT_CONTABIL FROM TCONTABIL_PLANO WHERE CD_COLIGADA = "01"',
                  'TQuery' );
  end
  else
  begin
    Application.CreateForm(Tfrm_ct_contabil, frm_ct_contabil);
    frm_ct_contabil.Cons_OnLine := datm_param_sistema.qry_parametros_CD_CT_CAIXA;
    with frm_ct_contabil do
    begin
      Caption      := Caption + ' [Consulta On-Line]';
      lCons_OnLine := True;
      if Not ( datm_param_sistema.qry_parametros_.State in [dsEdit, dsInsert] ) then
           datm_param_sistema.qry_parametros_.Edit;
      ShowModal;
      lCons_OnLine := False;
    end;
    with datm_param_sistema do
    begin
      qry_ct_contabil_.Close;
      qry_ct_contabil_.Prepare;
      qry_ct_contabil_.Open;
    end;
  end;
  dbedt_cd_ct_caixaExit(nil);
end;

procedure Tfrm_param_sistema.btn_co_cd_ct_ch_pagtos_divClick(Sender: TObject);
begin
  if datm_param_sistema.qry_parametros_.FieldByName('CD_SISTEMA_CONTABIL').AsString = '0' then
  begin
    Cons_On_line( 'DBBROKER', 'TCONTABIL_PLANO', datm_param_sistema.qry_parametros_CD_CT_CH_PAGTOS_DIV,
                  'Contas Contábeis', 8,
                  'SELECT CD_COLIGADA, CD_CT_CONTABIL, NM_CT_CONTABIL FROM TCONTABIL_PLANO WHERE CD_COLIGADA = "01"',
                  'TQuery' );
  end
  else
  begin
    Application.CreateForm(Tfrm_ct_contabil, frm_ct_contabil);
    frm_ct_contabil.Cons_OnLine := datm_param_sistema.qry_parametros_CD_CT_CH_PAGTOS_DIV;
    with frm_ct_contabil do
    begin
      Caption      := Caption + ' [Consulta On-Line]';
      lCons_OnLine := True;
      if Not ( datm_param_sistema.qry_parametros_.State in [dsEdit, dsInsert] ) then
           datm_param_sistema.qry_parametros_.Edit;
      ShowModal;
      lCons_OnLine := False;
    end;
    with datm_param_sistema do
    begin
      qry_ct_contabil_.Close;
      qry_ct_contabil_.Prepare;
      qry_ct_contabil_.Open;
    end;
  end;
  dbedt_cd_ct_ch_pagtos_divExit(nil);
end;

procedure Tfrm_param_sistema.btn_co_cd_ct_fat_a_classifClick(Sender: TObject);
begin
  if datm_param_sistema.qry_parametros_.FieldByName('CD_SISTEMA_CONTABIL').AsString = '0' then
  begin
    Cons_On_line( 'DBBROKER', 'TCONTABIL_PLANO', datm_param_sistema.qry_parametros_CD_CT_FAT_A_CLASSIF,
                  'Contas Contábeis', 8,
                  'SELECT CD_COLIGADA, CD_CT_CONTABIL, NM_CT_CONTABIL FROM TCONTABIL_PLANO WHERE CD_COLIGADA = "01"',
                  'TQuery' );
  end
  else
  begin
    Application.CreateForm(Tfrm_ct_contabil, frm_ct_contabil);
    frm_ct_contabil.Cons_OnLine := datm_param_sistema.qry_parametros_CD_CT_FAT_A_CLASSIF;
    with frm_ct_contabil do
    begin
      Caption      := Caption + ' [Consulta On-Line]';
      lCons_OnLine := True;
      if Not ( datm_param_sistema.qry_parametros_.State in [dsEdit, dsInsert] ) then
           datm_param_sistema.qry_parametros_.Edit;
      ShowModal;
      lCons_OnLine := False;
    end;
    with datm_param_sistema do
    begin
      qry_ct_contabil_.Close;
      qry_ct_contabil_.Prepare;
      qry_ct_contabil_.Open;
    end;
  end;
  dbedt_cd_ct_fat_a_classifExit(nil);
end;

procedure Tfrm_param_sistema.dbedt_cd_ct_caixaExit(Sender: TObject);
begin
  if ( datm_param_sistema.qry_parametros_.State in [dsEdit, dsInsert] ) then
  begin
    if dbedt_cd_ct_caixa.Text <> '' then
    begin
      if dbedt_nm_ct_caixa.Text = '' then
      begin
        BoxMensagem( 'Código da Conta Contábil Caixa inválido!', 2 );
        pgctrl_param.ActivePage := ts_ct_contabil;
        dbedt_cd_ct_caixa.SetFocus;
        Exit;
      end;
    end;
  end;
end;

procedure Tfrm_param_sistema.dbedt_cd_ct_ch_pagtos_divExit(
  Sender: TObject);
begin
  if ( datm_param_sistema.qry_parametros_.State in [dsEdit, dsInsert] ) then
  begin
    if dbedt_cd_ct_ch_pagtos_div.Text <> '' then
    begin
      if dbedt_nm_ct_ch_pagtos_div.Text = '' then
      begin
        BoxMensagem( 'Código da Conta Contábil Cheques Pagtos Diversos inválido!', 2 );
        pgctrl_param.ActivePage := ts_ct_contabil;
        dbedt_cd_ct_ch_pagtos_div.SetFocus;
        Exit;
      end;
    end;
  end;
end;

procedure Tfrm_param_sistema.dbedt_cd_ct_fat_a_classifExit(
  Sender: TObject);
begin
  if ( datm_param_sistema.qry_parametros_.State in [dsEdit, dsInsert] ) then
  begin
    if dbedt_cd_ct_fat_a_classif.Text <> '' then
    begin
      if dbedt_nm_ct_fat_a_classif.Text = '' then
      begin
        BoxMensagem( 'Código da Conta Contábil Faturamento à Classificar inválido!', 2 );
        pgctrl_param.ActivePage := ts_ct_contabil;
        dbedt_cd_ct_fat_a_classif.SetFocus;
        Exit;
      end;
    end;
  end;
end;

procedure Tfrm_param_sistema.dbedt_cd_ev_remocaoExit(Sender: TObject);
begin
  if ( datm_param_sistema.qry_parametros_.State in [dsEdit, dsInsert] ) then
  begin
    ValidCodigo( dbedt_cd_ev_remocao );
    if dbedt_cd_ev_remocao.Text <> '' then
    begin
      if dbedt_nm_ev_remocao.Text = '' then
      begin
        BoxMensagem( 'Código do evento Remoção inválido!', 2 );
        pgctrl_param.ActivePage := ts_eventos_3;
        dbedt_cd_ev_remocao.SetFocus;
        Exit;
      end;
    end;
  end;
end;

procedure Tfrm_param_sistema.dbedt_cd_ev_prev_carregamentoExit(
  Sender: TObject);
begin
  if ( datm_param_sistema.qry_parametros_.State in [dsEdit, dsInsert] ) then
  begin
    ValidCodigo( dbedt_cd_ev_prev_carregamento );
    if dbedt_cd_ev_prev_carregamento.Text <> '' then
    begin
      if dbedt_nm_ev_prev_carregamento.Text = '' then
      begin
        BoxMensagem( 'Código do evento Previsão de Carregamento inválido!', 2 );
        pgctrl_param.ActivePage := ts_eventos_3;
        dbedt_cd_ev_prev_carregamento.SetFocus;
        Exit;
      end;
    end;
  end;
end;

procedure Tfrm_param_sistema.btn_co_local_emissao_spClick(Sender: TObject);
begin
  Application.CreateForm( Tfrm_local_emissao, frm_local_emissao );
  with frm_local_emissao, datm_param_sistema do
  begin
    Cons_OnLine := qry_parametros_CD_LOCAL_EMISSAO_SP;
    Caption := Caption + ' [Consulta On-Line]';
    lCons_OnLine := True;
    if Not ( qry_parametros_.State in [dsEdit, dsInsert] ) then qry_parametros_.Edit;
    ShowModal;
    lCons_OnLine := False;

    qry_local_emissao_.Close;
    qry_local_emissao_.Prepare;
    qry_local_emissao_.Open;
  end;
  dbedt_cd_local_emissao_spExit(nil);
end;

procedure Tfrm_param_sistema.dbedt_cd_local_emissao_spExit(
  Sender: TObject);
begin
  if ( datm_param_sistema.qry_parametros_.State in [dsEdit, dsInsert] ) then
  begin
    ValidCodigo( dbedt_cd_local_emissao_sp );
    if dbedt_cd_local_emissao_sp.Text <> '' then
    begin
      if dbedt_nm_local_emissao_sp.Text = '' then
      begin
        BoxMensagem( 'Local de Emissão São Paulo!', 2 );
        pgctrl_param.ActivePage := ts_exp;
        dbedt_cd_local_emissao_sp.SetFocus;
        Exit;
      end;
    end;
  end;
end;

procedure Tfrm_param_sistema.dbedt_cd_item_servico_comissariaExit(
  Sender: TObject);
begin
  if ( datm_param_sistema.qry_parametros_.State in [dsEdit, dsInsert] ) then
  begin
    ValidCodigo( dbedt_cd_item_servico_comissaria );
    if dbedt_cd_item_servico_comissaria.Text <> '' then
    begin
      if dbedt_nm_item_servico_comissaria.Text = '' then
      begin
        BoxMensagem( 'Código do item Serviço Comissária inválido!', 2 );
        pgctrl_param.ActivePage := ts_item2;
        dbedt_cd_item_servico_comissaria.SetFocus;
        Exit;
      end;
    end;
  end;
end;

procedure Tfrm_param_sistema.dbedt_cd_ev_abert_diExit(Sender: TObject);
begin
  if ( datm_param_sistema.qry_parametros_.State in [dsEdit, dsInsert] ) then
  begin
    ValidCodigo( dbedt_cd_ev_abert_di );
    if dbedt_cd_ev_abert_di.Text <> '' then
    begin
      if dbedt_nm_ev_abertura_di.Text = '' then
      begin
        BoxMensagem( 'Código do evento Elaboração da DI inválido!', 2 );
        pgctrl_param.ActivePage := ts_eventos_3;
        dbedt_cd_ev_abert_di.SetFocus;
        Exit;
      end;
    end;
  end;
end;

procedure Tfrm_param_sistema.dbedt_cd_ev_nf_entradaExit(Sender: TObject);
begin
  if ( datm_param_sistema.qry_parametros_.State in [dsEdit, dsInsert] ) then
  begin
    ValidCodigo( dbedt_cd_ev_nf_entrada );
    if dbedt_cd_ev_nf_entrada.Text <> '' then
    begin
      if dbedt_nm_ev_nf_entrada.Text = '' then
      begin
        BoxMensagem( 'Código do evento NF de Entrada inválido!', 2 );
        pgctrl_param.ActivePage := ts_eventos_3;
        dbedt_cd_ev_nf_entrada.SetFocus;
        Exit;
      end;
    end;
  end;
end;

procedure Tfrm_param_sistema.dbedt_cd_ev_prev_entr_mercExit(
  Sender: TObject);
begin
  if ( datm_param_sistema.qry_parametros_.State in [dsEdit, dsInsert] ) then
  begin
    ValidCodigo( dbedt_cd_ev_prev_entr_merc );
    if dbedt_cd_ev_prev_entr_merc.Text <> '' then
    begin
      if dbedt_nm_ev_prev_entr_merc.Text = '' then
      begin
        BoxMensagem( 'Código do evento Previsão de Entrega da Mercadoria inválido!', 2 );
        pgctrl_param.ActivePage := ts_eventos_3;
        dbedt_cd_ev_prev_entr_merc.SetFocus;
        Exit;
      end;
    end;
  end;
end;

procedure Tfrm_param_sistema.dbedt_cd_ev_nf_transpExit(Sender: TObject);
begin
  if ( datm_param_sistema.qry_parametros_.State in [dsEdit, dsInsert] ) then
  begin
    ValidCodigo( dbedt_cd_ev_nf_transp );
    if Trim(dbedt_cd_ev_nf_transp.Text) <> '' then
    begin
      if Trim(dbedt_nm_ev_nf_transp.Text) = '' then
      begin
        BoxMensagem( 'Código do evento Envio da Nota Fiscal ao Transportador Inválido!', 2 );
        pgctrl_param.ActivePage := ts_eventos_3;
        dbedt_cd_ev_nf_transp.SetFocus;
        Exit;
      end;
    end;
  end;
end;

procedure Tfrm_param_sistema.btn_co_cd_ct_ctaapagarClick(Sender: TObject);
begin
  if datm_param_sistema.qry_parametros_.FieldByName('CD_SISTEMA_CONTABIL').AsString = '0' then
  begin
    Cons_On_line( 'DBBROKER', 'TCONTABIL_PLANO', datm_param_sistema.qry_parametros_CD_CT_CTAAPAGAR,
                  'Contas Contábeis', 8,
                  'SELECT CD_COLIGADA, CD_CT_CONTABIL, NM_CT_CONTABIL FROM TCONTABIL_PLANO WHERE CD_COLIGADA = "01"',
                  'TQuery' );
  end
  else
  begin
    Application.CreateForm(Tfrm_ct_contabil, frm_ct_contabil);
    frm_ct_contabil.Cons_OnLine := datm_param_sistema.qry_parametros_CD_CT_CTAAPAGAR;
    with frm_ct_contabil do
    begin
      Caption      := Caption + ' [Consulta On-Line]';
      lCons_OnLine := True;
      if Not ( datm_param_sistema.qry_parametros_.State in [dsEdit, dsInsert] ) then
           datm_param_sistema.qry_parametros_.Edit;
      ShowModal;
      lCons_OnLine := False;
    end;
    with datm_param_sistema do
    begin
      qry_ct_contabil_.Close;
      qry_ct_contabil_.Prepare;
      qry_ct_contabil_.Open;
    end;
  end;
  dbedt_cd_ct_ctaapagarExit(nil);
end;

procedure Tfrm_param_sistema.dbedt_cd_ct_ctaapagarExit(Sender: TObject);
begin
  if ( datm_param_sistema.qry_parametros_.State in [dsEdit, dsInsert] ) then
  begin
    if dbedt_cd_ct_ctaapagar.Text <> '' then
    begin
      if dbedt_nm_ct_ctaapagar.Text = '' then
      begin
        BoxMensagem( 'Código da Conta Contábil Contas a Pagar inválido!', 2 );
        pgctrl_param.ActivePage := ts_ct_contabil;
        dbedt_cd_ct_ctaapagar.SetFocus;
        Exit;
      end;
    end;
  end;
end;

procedure Tfrm_param_sistema.dbedt_cd_ev_cruzeExit(Sender: TObject);
begin
  if ( datm_param_sistema.qry_parametros_.State in [dsEdit, dsInsert] ) then
  begin
    ValidCodigo( dbedt_cd_ev_cruze );
    if Trim(dbedt_cd_ev_cruze.Text) <> '' then
    begin
      if Trim(dbedt_nm_ev_cruze.Text) = '' then
      begin
        BoxMensagem( 'Código do Evento Cruze Inválido!', 2 );
        pgctrl_param.ActivePage := ts_eventos_3;
        dbedt_cd_ev_cruze.SetFocus;
        Exit;
      end;
    end;
  end;
end;

procedure Tfrm_param_sistema.dbedt_cd_ev_apresentacaoExit(Sender: TObject);
begin
  if ( datm_param_sistema.qry_parametros_.State in [dsEdit, dsInsert] ) then
  begin
    ValidCodigo( dbedt_cd_ev_apresentacao );
    if Trim(dbedt_cd_ev_apresentacao.Text) <> '' then
    begin
      if Trim(dbedt_nm_ev_apresentacao.Text) = '' then
      begin
        BoxMensagem( 'Código do Evento Apresentacao Inválido!', 2 );
        pgctrl_param.ActivePage := ts_eventos_3;
        dbedt_cd_ev_apresentacao.SetFocus;
        Exit;
      end;
    end;
  end;
end;


procedure Tfrm_param_sistema.dbedt_cd_doc_nf_impExit(Sender: TObject);
begin
  if ( datm_param_sistema.qry_parametros_.State in [dsEdit, dsInsert] ) then
  begin
    ValidCodigo( dbedt_cd_doc_nf_imp );
    if dbedt_cd_doc_nf_imp.Text <> '' then
    begin
      if dbedt_nm_doc_nf_imp.Text = '' then
      begin
        BoxMensagem( 'Código do Documento NF - Importação inválido!', 2 );
        pgctrl_param.ActivePage := ts_documento;
        dbedt_cd_doc_nf_imp.SetFocus;
        Exit;
      end;
    end;
  end;
end;

procedure Tfrm_param_sistema.dbedt_cd_doc_fat_impExit(Sender: TObject);
begin
  if ( datm_param_sistema.qry_parametros_.State in [dsEdit, dsInsert] ) then
  begin
    ValidCodigo( dbedt_cd_doc_fat_imp );
    if dbedt_cd_doc_fat_imp.Text <> '' then
    begin
      if dbedt_nm_doc_fat_imp.Text = '' then
      begin
        BoxMensagem( 'Código do Documento Fatura - Importação inválido!', 2 );
        pgctrl_param.ActivePage := ts_documento;
        dbedt_cd_doc_fat_imp.SetFocus;
        Exit;
      end;
    end;
  end;
end;

procedure Tfrm_param_sistema.dbedt_cd_doc_re_impExit(Sender: TObject);
begin
  if ( datm_param_sistema.qry_parametros_.State in [dsEdit, dsInsert] ) then
  begin
    ValidCodigo( dbedt_cd_doc_re_imp );
    if dbedt_cd_doc_re_imp.Text <> '' then
    begin
      if dbedt_nm_doc_re_imp.Text = '' then
      begin
        BoxMensagem( 'Código do Documento RE - Importação inválido!', 2 );
        pgctrl_param.ActivePage := ts_documento;
        dbedt_cd_doc_re_imp.SetFocus;
        Exit;
      end;
    end;
  end;
end;

procedure Tfrm_param_sistema.btn_co_doc_nf_impClick(Sender: TObject);
begin
  Application.CreateForm( Tfrm_documento, frm_documento );
  with frm_documento, datm_param_sistema do
  begin
    if ( Sender = dbedt_cd_doc_nf_imp ) or ( Sender = btn_co_doc_nf_imp ) then
       Cons_OnLine := qry_parametros_CD_DOC_NF_IMP;
    if ( Sender = dbedt_cd_doc_fat_imp ) or ( Sender = btn_co_doc_fat_imp ) then
       Cons_OnLine := qry_parametros_CD_DOC_FAT_IMP;
    if ( Sender = dbedt_cd_doc_re_imp ) or ( Sender = btn_co_doc_re_imp ) then
       Cons_OnLine := qry_parametros_CD_DOC_RE_IMP;
    if ( Sender = dbedt_cd_doc_nf_exp ) or ( Sender = btn_co_doc_nf_exp ) then
       Cons_OnLine := qry_parametros_CD_DOC_NF_EXP;
    if ( Sender = dbedt_cd_doc_fat_exp ) or ( Sender = btn_co_doc_fat_exp ) then
       Cons_OnLine := qry_parametros_CD_DOC_FAT_EXP;
    if ( Sender = dbedt_cd_doc_re_exp ) or ( Sender = btn_co_doc_re_exp ) then
       Cons_OnLine := qry_parametros_CD_DOC_RE_EXP;

    Caption := Caption + ' [Consulta On-Line]';
    lCons_OnLine := True;
    if ( Sender = dbedt_cd_doc_nf_imp ) or ( Sender = btn_co_doc_nf_imp ) or
       ( Sender = dbedt_cd_doc_fat_imp ) or ( Sender = btn_co_doc_fat_imp ) or
       ( Sender = dbedt_cd_doc_re_imp ) or ( Sender = btn_co_doc_re_imp ) then
    begin
      cd_produto   := '01';
    end;
    if ( Sender = dbedt_cd_doc_nf_exp ) or ( Sender = btn_co_doc_nf_exp ) or
       ( Sender = dbedt_cd_doc_fat_exp ) or ( Sender = btn_co_doc_fat_exp ) or
       ( Sender = dbedt_cd_doc_re_exp ) or ( Sender = btn_co_doc_re_exp ) then
    begin
      cd_produto   := '02';
    end;

    if Not ( qry_parametros_.State in [dsEdit, dsInsert] ) then qry_parametros_.Edit;
    ShowModal;
    lCons_OnLine := False;

    qry_documento_.Close;
    qry_documento_.Prepare;
    qry_documento_.Open;
  end;

  if ( Sender = dbedt_cd_doc_nf_imp )  or ( Sender = btn_co_doc_nf_imp )  then dbedt_cd_doc_nf_impExit(nil);
  if ( Sender = dbedt_cd_doc_fat_imp ) or ( Sender = btn_co_doc_fat_imp ) then dbedt_cd_doc_fat_impExit(nil);
  if ( Sender = dbedt_cd_doc_re_imp )  or ( Sender = btn_co_doc_re_imp )  then dbedt_cd_doc_re_impExit(nil);
  if ( Sender = dbedt_cd_doc_nf_exp )  or ( Sender = btn_co_doc_nf_exp )  then dbedt_cd_doc_nf_expExit(nil);
  if ( Sender = dbedt_cd_doc_fat_exp ) or ( Sender = btn_co_doc_fat_exp ) then dbedt_cd_doc_fat_expExit(nil);
  if ( Sender = dbedt_cd_doc_re_exp )  or ( Sender = btn_co_doc_re_exp )  then dbedt_cd_doc_re_expExit(nil);
end;

procedure Tfrm_param_sistema.dbedt_cd_doc_nf_expExit(Sender: TObject);
begin
  if ( datm_param_sistema.qry_parametros_.State in [dsEdit, dsInsert] ) then
  begin
    ValidCodigo( dbedt_cd_doc_nf_exp );
    if dbedt_cd_doc_nf_exp.Text <> '' then
    begin
      if dbedt_nm_doc_nf_exp.Text = '' then
      begin
        BoxMensagem( 'Código do Documento NF - Exportação inválido!', 2 );
        pgctrl_param.ActivePage := ts_documento;
        dbedt_cd_doc_nf_exp.SetFocus;
        Exit;
      end;
    end;
  end;
end;

procedure Tfrm_param_sistema.dbedt_cd_doc_fat_expExit(Sender: TObject);
begin
  if ( datm_param_sistema.qry_parametros_.State in [dsEdit, dsInsert] ) then
  begin
    ValidCodigo( dbedt_cd_doc_fat_exp );
    if dbedt_cd_doc_fat_exp.Text <> '' then
    begin
      if dbedt_nm_doc_fat_exp.Text = '' then
      begin
        BoxMensagem( 'Código do Documento Fatura - Exportação inválido!', 2 );
        pgctrl_param.ActivePage := ts_documento;
        dbedt_cd_doc_fat_exp.SetFocus;
        Exit;
      end;
    end;
  end;
end;

procedure Tfrm_param_sistema.dbedt_cd_doc_re_expExit(Sender: TObject);
begin
  if ( datm_param_sistema.qry_parametros_.State in [dsEdit, dsInsert] ) then
  begin
    ValidCodigo( dbedt_cd_doc_re_exp );
    if dbedt_cd_doc_re_exp.Text <> '' then
    begin
      if dbedt_nm_doc_re_exp.Text = '' then
      begin
        BoxMensagem( 'Código do Documento RE - Exportação inválido!', 2 );
        pgctrl_param.ActivePage := ts_documento;
        dbedt_cd_doc_re_exp.SetFocus;
        Exit;
      end;
    end;
  end;
end;

procedure Tfrm_param_sistema.dbedt_cd_ev_prev_fabricaExit(Sender: TObject);
begin
  if ( datm_param_sistema.qry_parametros_.State in [dsEdit, dsInsert] ) then
  begin
    ValidCodigo( dbedt_cd_ev_prev_fabrica );
    if Trim(dbedt_cd_ev_prev_fabrica.Text) <> '' then
    begin
      if Trim(dbedt_nm_ev_prev_fabrica.Text) = '' then
      begin
        BoxMensagem( 'Código do evento Previsão da Fábrica Inválido!', 2 );
        pgctrl_param.ActivePage := ts_eventos_3;
        dbedt_cd_ev_prev_fabrica.SetFocus;
        Exit;
      end;
    end;
  end;
end;

procedure Tfrm_param_sistema.pgctrl_paramChange(Sender: TObject);
begin
  if pgctrl_param.ActivePage = ts_exp then
  begin
    dblckbox_quebra_anexo_por_vl_unit.Enabled := False;
    lbl_quebra_por_vl_unit.Enabled := False;

    if dblckbox_agrupa_itens_por_anexo.KeyValue = '1' then
    begin
      dblckbox_quebra_anexo_por_vl_unit.Enabled := True;
      lbl_quebra_por_vl_unit.Enabled := True;
    end;
  end;

end;

procedure Tfrm_param_sistema.dblckbox_agrupa_itens_por_anexoClick(
  Sender: TObject);
begin
  btn_salvar.Enabled   := True;
  btn_cancelar.Enabled := True;
  mi_salvar.Enabled    := True;
  mi_cancelar.Enabled  := True;

  dblckbox_quebra_anexo_por_vl_unit.Enabled := False;
  lbl_quebra_por_vl_unit.Enabled := False;

  if dblckbox_agrupa_itens_por_anexo.KeyValue = '1' then
  begin
     dblckbox_quebra_anexo_por_vl_unit.Enabled := True;
     lbl_quebra_por_vl_unit.Enabled := True;
  end;

end;

procedure Tfrm_param_sistema.dbedt_cd_ct_irExit(Sender: TObject);
begin
  if ( datm_param_sistema.qry_parametros_.State in [dsEdit, dsInsert] ) then
  begin
    if dbedt_cd_ct_ir.Text <> '' then
    begin
      if dbedt_nm_ct_ir.Text = '' then
      begin
        BoxMensagem( 'Código da Conta Contábil I.R. inválido!', 2 );
        pgctrl_param.ActivePage := ts_ct_contabil;
        dbedt_cd_ct_ir.SetFocus;
        Exit;
      end;
    end;
  end;
end;

procedure Tfrm_param_sistema.dbedt_cd_ct_inssExit(Sender: TObject);
begin
  if ( datm_param_sistema.qry_parametros_.State in [dsEdit, dsInsert] ) then
  begin
    if dbedt_cd_ct_inss.Text <> '' then
    begin
      if dbedt_nm_ct_inss.Text = '' then
      begin
        BoxMensagem( 'Código da Conta Contábil INSS inválido!', 2 );
        pgctrl_param.ActivePage := ts_ct_contabil;
        dbedt_cd_ct_inss.SetFocus;
        Exit;
      end;
    end;
  end;
end;

procedure Tfrm_param_sistema.btn_co_cd_ct_irClick(Sender: TObject);
begin
  if datm_param_sistema.qry_parametros_.FieldByName('CD_SISTEMA_CONTABIL').AsString = '0' then
  begin
    Cons_On_line( 'DBBROKER', 'TCONTABIL_PLANO', datm_param_sistema.qry_parametros_CD_CT_IR,
                  'Contas Contábeis', 8,
                  'SELECT CD_COLIGADA, CD_CT_CONTABIL, NM_CT_CONTABIL FROM TCONTABIL_PLANO WHERE CD_COLIGADA = "01"',
                  'TQuery' );
  end
  else
  begin
    Application.CreateForm(Tfrm_ct_contabil, frm_ct_contabil);
    frm_ct_contabil.Cons_OnLine := datm_param_sistema.qry_parametros_CD_CT_IR;
    with frm_ct_contabil do
    begin
      Caption      := Caption + ' [Consulta On-Line]';
      lCons_OnLine := True;
      if Not ( datm_param_sistema.qry_parametros_.State in [dsEdit, dsInsert] ) then
           datm_param_sistema.qry_parametros_.Edit;
      ShowModal;
      lCons_OnLine := False;
    end;
    with datm_param_sistema do
    begin
      qry_ct_contabil_.Close;
      qry_ct_contabil_.Prepare;
      qry_ct_contabil_.Open;
    end;
  end;
  dbedt_cd_ct_irExit(nil);
end;

procedure Tfrm_param_sistema.btn_co_cd_ct_inssClick(Sender: TObject);
begin
  if datm_param_sistema.qry_parametros_.FieldByName('CD_SISTEMA_CONTABIL').AsString = '0' then
  begin
    Cons_On_line( 'DBBROKER', 'TCONTABIL_PLANO', datm_param_sistema.qry_parametros_CD_CT_INSS,
                  'Contas Contábeis', 8,
                  'SELECT CD_COLIGADA, CD_CT_CONTABIL, NM_CT_CONTABIL FROM TCONTABIL_PLANO WHERE CD_COLIGADA = "01"',
                  'TQuery' );
  end
  else
  begin
    Application.CreateForm(Tfrm_ct_contabil, frm_ct_contabil);
    frm_ct_contabil.Cons_OnLine := datm_param_sistema.qry_parametros_CD_CT_INSS;
    with frm_ct_contabil do
    begin
      Caption      := Caption + ' [Consulta On-Line]';
      lCons_OnLine := True;
      if Not ( datm_param_sistema.qry_parametros_.State in [dsEdit, dsInsert] ) then
           datm_param_sistema.qry_parametros_.Edit;
      ShowModal;
      lCons_OnLine := False;
    end;
    with datm_param_sistema do
    begin
      qry_ct_contabil_.Close;
      qry_ct_contabil_.Prepare;
      qry_ct_contabil_.Open;
    end;
  end;
  dbedt_cd_ct_inssExit(nil);
end;

procedure Tfrm_param_sistema.dbedt_cd_ev_reg_ddeExit(Sender: TObject);
begin
  if ( datm_param_sistema.qry_parametros_.State in [dsEdit, dsInsert] ) then
  begin
    ValidCodigo( dbedt_cd_ev_reg_dde );
    if dbedt_cd_ev_reg_dde.Text <> '' then
    begin
      if dbedt_nm_ev_reg_dde.Text = '' then
      begin
        BoxMensagem( 'Código do evento Registro DDE inválido!', 2 );
        pgctrl_param.ActivePage := ts_eventos_3;
        dbedt_cd_ev_reg_dde.SetFocus;
        Exit;
      end;
    end;
  end;
end;

procedure Tfrm_param_sistema.dbedt_cd_ev_reg_reExit(Sender: TObject);
begin
  if ( datm_param_sistema.qry_parametros_.State in [dsEdit, dsInsert] ) then
  begin
    ValidCodigo( dbedt_cd_ev_reg_re );
    if dbedt_cd_ev_reg_re.Text <> '' then
    begin
      if dbedt_nm_ev_reg_re.Text = '' then
      begin
        BoxMensagem( 'Código do evento Registro RE inválido!', 2 );
        pgctrl_param.ActivePage := ts_eventos_3;
        dbedt_cd_ev_reg_re.SetFocus;
        Exit;
      end;
    end;
  end;
end;

procedure Tfrm_param_sistema.dbedt_cd_ev_insp_okExit(
  Sender: TObject);
begin
  if ( datm_param_sistema.qry_parametros_.State in [dsEdit, dsInsert] ) then
  begin
    ValidCodigo( dbedt_cd_ev_insp_ok );
    if dbedt_cd_ev_insp_ok.Text <> '' then
    begin
      if dbedt_nm_ev_insp_ok.Text = '' then
      begin
        BoxMensagem( 'Código do evento Inspeção OK inválido!', 2 );
        pgctrl_param.ActivePage := ts_eventos_3;
        dbedt_cd_ev_insp_ok.SetFocus;
        Exit;
      end;
    end;
  end;
end;

procedure Tfrm_param_sistema.btn_co_cd_ct_jurosClick(Sender: TObject);
begin
  if datm_param_sistema.qry_parametros_.FieldByName('CD_SISTEMA_CONTABIL').AsString = '0' then
  begin
    Cons_On_line( 'DBBROKER', 'TCONTABIL_PLANO', datm_param_sistema.qry_parametros_CD_CT_INSS,
                  'Contas Contábeis', 8,
                  'SELECT CD_COLIGADA, CD_CT_CONTABIL, NM_CT_CONTABIL FROM TCONTABIL_PLANO WHERE CD_COLIGADA = "01"',
                  'TQuery' );
  end
  else
  begin
    Application.CreateForm(Tfrm_ct_contabil, frm_ct_contabil);
    frm_ct_contabil.Cons_OnLine := datm_param_sistema.qry_parametros_CD_CT_CONTABIL_JUROS;
    with frm_ct_contabil do
    begin
      Caption      := Caption + ' [Consulta On-Line]';
      lCons_OnLine := True;
      if Not ( datm_param_sistema.qry_parametros_.State in [dsEdit, dsInsert] ) then
           datm_param_sistema.qry_parametros_.Edit;
      ShowModal;
      lCons_OnLine := False;
    end;
    with datm_param_sistema do
    begin
      qry_ct_contabil_.Close;
      qry_ct_contabil_.Prepare;
      qry_ct_contabil_.Open;
    end;
  end;
  dbedt_cd_ct_jurosExit(nil);
end;

procedure Tfrm_param_sistema.dbedt_cd_ct_descontoExit(
  Sender: TObject);
begin
  if ( datm_param_sistema.qry_parametros_.State in [dsEdit, dsInsert] ) then
  begin
    if dbedt_cd_ct_desconto.Text <> '' then
    begin
      if dbedt_nm_ct_desconto.Text = '' then
      begin
        BoxMensagem( 'Código da Conta Contábil Desconto inválido!', 2 );
        pgctrl_param.ActivePage := ts_ct_contabil;
        dbedt_cd_ct_desconto.SetFocus;
        Exit;
      end;
    end;
  end;
end;

procedure Tfrm_param_sistema.dbedt_cd_ct_jurosExit(
  Sender: TObject);
begin
  if ( datm_param_sistema.qry_parametros_.State in [dsEdit, dsInsert] ) then
  begin
    if dbedt_cd_ct_juros.Text <> '' then
    begin
      if dbedt_nm_ct_juros.Text = '' then
      begin
        BoxMensagem( 'Código da Conta Contábil Juros inválido!', 2 );
        pgctrl_param.ActivePage := ts_ct_contabil;
        dbedt_cd_ct_juros.SetFocus;
        Exit;
      end;
    end;
  end;
end;

procedure Tfrm_param_sistema.btn_co_cd_ct_descontoClick(Sender: TObject);
begin
  if datm_param_sistema.qry_parametros_.FieldByName('CD_SISTEMA_CONTABIL').AsString = '0' then
  begin
    Cons_On_line( 'DBBROKER', 'TCONTABIL_PLANO', datm_param_sistema.qry_parametros_CD_CT_INSS,
                  'Contas Contábeis', 8,
                  'SELECT CD_COLIGADA, CD_CT_CONTABIL, NM_CT_CONTABIL FROM TCONTABIL_PLANO WHERE CD_COLIGADA = "01"',
                  'TQuery' );
  end
  else
  begin
    Application.CreateForm(Tfrm_ct_contabil, frm_ct_contabil);
    frm_ct_contabil.Cons_OnLine := datm_param_sistema.qry_parametros_CD_CT_CONTABIL_DESCONTO;
    with frm_ct_contabil do
    begin
      Caption      := Caption + ' [Consulta On-Line]';
      lCons_OnLine := True;
      if Not ( datm_param_sistema.qry_parametros_.State in [dsEdit, dsInsert] ) then
           datm_param_sistema.qry_parametros_.Edit;
      ShowModal;
      lCons_OnLine := False;
    end;
    with datm_param_sistema do
    begin
      qry_ct_contabil_.Close;
      qry_ct_contabil_.Prepare;
      qry_ct_contabil_.Open;
    end;
  end;
  dbedt_cd_ct_descontoExit(nil);
end;

procedure Tfrm_param_sistema.dbedt_cd_descontoExit(Sender: TObject);
begin
  if ( datm_param_sistema.qry_parametros_.State in [dsEdit, dsInsert] ) then
  begin
    ValidCodigo( dbedt_cd_desconto );
    if dbedt_cd_desconto.Text <> '' then
    begin
      if dbedt_nm_desconto.Text = '' then
      begin
        BoxMensagem( 'Código do item Desconto inválido!', 2 );
        pgctrl_param.ActivePage := ts_item2;
        dbedt_cd_desconto.SetFocus;
        Exit;
      end;
    end;
  end;
end;

procedure Tfrm_param_sistema.dbedt_nm_banco_cob_autChange(Sender: TObject);
begin
  with datm_param_sistema do
  begin
    with qry_carteira_ do
    begin
      Close;
      ParamByName('CD_BANCO').AsString := NR_BANCO(qry_parametros_CD_BANCO_COB_AUT.Value);
      Prepare;
      Open;
    end;

    with qry_cadastramento_ do
    begin
      Close;
      ParamByName('CD_BANCO').AsString := NR_BANCO(qry_parametros_CD_BANCO_COB_AUT.Value);
      Prepare;
      Open;
    end;

    with qry_tp_docto do
    begin
      Close;
      ParamByName('CD_BANCO').AsString := NR_BANCO(qry_parametros_CD_BANCO_COB_AUT.Value);
      Prepare;
      Open;
    end;

    with qry_emissao_ do
    begin
      Close;
      ParamByName('CD_BANCO').AsString := NR_BANCO(qry_parametros_CD_BANCO_COB_AUT.Value);
      Prepare;
      Open;
    end;

    with qry_distribui do
    begin
      Close;
      ParamByName('CD_BANCO').AsString := NR_BANCO(qry_parametros_CD_BANCO_COB_AUT.Value);
      Prepare;
      Open;
    end;
  end;
end;

procedure Tfrm_param_sistema.dbedt_cd_carteira_cob_autExit(
  Sender: TObject);
begin
  if datm_param_sistema.qry_parametros_.State in [dsEdit, dsInsert] then
  begin
    btn_salvar.Enabled   := True;
    btn_cancelar.Enabled := True;
    mi_salvar.Enabled    := True;
    mi_cancelar.Enabled  := True;
  end;
end;

procedure Tfrm_param_sistema.dbedt_cd_ev_atracacaoExit(Sender: TObject);
begin
  if ( datm_param_sistema.qry_parametros_.State in [dsEdit, dsInsert] ) then
  begin
    ValidCodigo( dbedt_cd_ev_atracacao );
    if dbedt_cd_ev_atracacao.Text <> '' then
    begin
      if dbedt_nm_ev_atracacao.Text = '' then
      begin
        BoxMensagem( 'Código do evento Atracação inválido!', 2 );
        pgctrl_param.ActivePage := ts_eventos_3;
        dbedt_cd_ev_atracacao.SetFocus;
        Exit;
      end;
    end;
  end;
end;

procedure Tfrm_param_sistema.dbedt_cd_ct_ctaareceberExit(Sender: TObject);
begin
  if ( datm_param_sistema.qry_parametros_.State in [dsEdit, dsInsert] ) then
  begin
    if dbedt_cd_ct_ctaareceber.Text <> '' then
    begin
      if dbedt_nm_ct_ctaareceber.Text = '' then
      begin
        BoxMensagem( 'Código da Conta Contábil Contas a Receber inválido!', 2 );
        pgctrl_param.ActivePage := ts_ct_contabil;
        dbedt_cd_ct_ctaareceber.SetFocus;
        Exit;
      end;
    end;
  end;
end;

procedure Tfrm_param_sistema.btn_co_cd_ct_ctaareceberClick(
  Sender: TObject);
begin
  if datm_param_sistema.qry_parametros_.FieldByName('CD_SISTEMA_CONTABIL').AsString = '0' then
  begin
    Cons_On_line( 'DBBROKER', 'TCONTABIL_PLANO', datm_param_sistema.qry_parametros_CD_CT_CTAARECEBER,
                  'Contas Contábeis', 8,
                  'SELECT CD_COLIGADA, CD_CT_CONTABIL, NM_CT_CONTABIL FROM TCONTABIL_PLANO WHERE CD_COLIGADA = "01"',
                  'TQuery' );
  end
  else
  begin
    Application.CreateForm(Tfrm_ct_contabil, frm_ct_contabil);
    frm_ct_contabil.Cons_OnLine := datm_param_sistema.qry_parametros_CD_CT_CTAARECEBER;
    with frm_ct_contabil do
    begin
      Caption      := Caption + ' [Consulta On-Line]';
      lCons_OnLine := True;
      if Not ( datm_param_sistema.qry_parametros_.State in [dsEdit, dsInsert] ) then
           datm_param_sistema.qry_parametros_.Edit;
      ShowModal;
      lCons_OnLine := False;
    end;
    with datm_param_sistema do
    begin
      qry_ct_contabil_.Close;
      qry_ct_contabil_.Prepare;
      qry_ct_contabil_.Open;
    end;
  end;
  dbedt_cd_ct_ctaareceberExit(nil);
end;

procedure Tfrm_param_sistema.btn_co_ct_ger_ctaareceberClick(Sender: TObject);
begin
  if datm_param_sistema.qry_parametros_.FieldByName('CD_SISTEMA_CONTABIL').AsString = '0' then
  begin
    Cons_On_line( 'DBBROKER', 'TCONTABIL_GERENCIAL', datm_param_sistema.qry_parametros_CD_CT_GER_CTAARECEBER,
                  'Contas Gerenciais', 13,
                  'SELECT CD_COLIGADA, CD_CT_GERENCIAL, NM_CT_GERENCIAL FROM TCONTABIL_GERENCIAL WHERE CD_COLIGADA = "01"',
                  'TQuery' );
  end
  else
  begin
    Application.CreateForm(Tfrm_ct_gerencial, frm_ct_gerencial);
    frm_ct_gerencial.Cons_OnLine := datm_param_sistema.qry_parametros_CD_CT_GER_CTAARECEBER;
    with frm_ct_gerencial do
    begin
      Caption      := Caption + ' [Consulta On-Line]';
      lCons_OnLine := True;
      if Not ( datm_param_sistema.qry_parametros_.State in [dsEdit, dsInsert] ) then
           datm_param_sistema.qry_parametros_.Edit;
      ShowModal;
      lCons_OnLine := False;
    end;
    with datm_param_sistema do
    begin
      qry_ct_gerencial_.Close;
      qry_ct_gerencial_.Prepare;
      qry_ct_gerencial_.Open;
    end;
  end;
  dbedt_cd_ct_ger_ctaareceberExit(nil);
end;

procedure Tfrm_param_sistema.dbedt_cd_ct_ger_ctaareceberExit(
  Sender: TObject);
begin
  if ( datm_param_sistema.qry_parametros_.State in [dsEdit, dsInsert] ) then
  begin
    if dbedt_cd_ct_ger_ctaareceber.Text <> '' then
    begin
      if dbedt_nm_ct_ger_ctaareceber.Text = '' then
      begin
        BoxMensagem( 'Código da Conta Gerencial Contas a Receber inválido!', 2 );
        pgctrl_param.ActivePage := ts_ct_gerencial;
        dbedt_cd_ct_ger_ctaareceber.SetFocus;
        Exit;
      end;
    end;
  end;
end;

procedure Tfrm_param_sistema.dbedt_cd_ct_ger_descontoExit(Sender: TObject);
begin
  if ( datm_param_sistema.qry_parametros_.State in [dsEdit, dsInsert] ) then
  begin
    if dbedt_cd_ct_ger_desconto.Text <> '' then
    begin
      if dbedt_nm_ct_ger_desconto.Text = '' then
      begin
        BoxMensagem( 'Código da Conta Gerencial Desconto inválido!', 2 );
        pgctrl_param.ActivePage := ts_ct_gerencial;
        dbedt_cd_ct_ger_desconto.SetFocus;
        Exit;
      end;
    end;
  end;
end;

procedure Tfrm_param_sistema.dbedt_cd_ct_ger_financeiroExit(Sender: TObject);
begin
  if ( datm_param_sistema.qry_parametros_.State in [dsEdit, dsInsert] ) then
  begin
    if dbedt_cd_ct_ger_financeiro.Text <> '' then
    begin
      if dbedt_nm_ct_ger_financeiro.Text = '' then
      begin
        BoxMensagem( 'Código da Conta Gerencial Financeiro inválido!', 2 );
        pgctrl_param.ActivePage := ts_ct_gerencial;
        dbedt_cd_ct_ger_financeiro.SetFocus;
        Exit;
      end;
    end;
  end;
end;

procedure Tfrm_param_sistema.btn_co_ct_ger_descontoClick(Sender: TObject);
begin
  if datm_param_sistema.qry_parametros_.FieldByName('CD_SISTEMA_CONTABIL').AsString = '0' then
  begin
    Cons_On_line( 'DBBROKER', 'TCONTABIL_GERENCIAL', datm_param_sistema.qry_parametros_CD_CT_GER_DESCONTO,
                  'Contas Gerenciais', 13,
                  'SELECT CD_COLIGADA, CD_CT_GERENCIAL, NM_CT_GERENCIAL FROM TCONTABIL_GERENCIAL WHERE CD_COLIGADA = "01"',
                  'TQuery' );
  end
  else
  begin
    Application.CreateForm(Tfrm_ct_gerencial, frm_ct_gerencial);
    frm_ct_gerencial.Cons_OnLine := datm_param_sistema.qry_parametros_CD_CT_GER_DESCONTO;
    with frm_ct_gerencial do
    begin
      Caption      := Caption + ' [Consulta On-Line]';
      lCons_OnLine := True;
      if Not ( datm_param_sistema.qry_parametros_.State in [dsEdit, dsInsert] ) then
           datm_param_sistema.qry_parametros_.Edit;
      ShowModal;
      lCons_OnLine := False;
    end;
    with datm_param_sistema do
    begin
      qry_ct_gerencial_.Close;
      qry_ct_gerencial_.Prepare;
      qry_ct_gerencial_.Open;
    end;
  end;
  dbedt_cd_ct_ger_descontoExit(nil);
end;

procedure Tfrm_param_sistema.btn_co_ct_ger_financeiroClick(Sender: TObject);
begin
  if datm_param_sistema.qry_parametros_.FieldByName('CD_SISTEMA_CONTABIL').AsString = '0' then
  begin
    Cons_On_line( 'DBBROKER', 'TCONTABIL_GERENCIAL', datm_param_sistema.qry_parametros_CD_CT_GER_FINANCEIRO,
                  'Contas Gerenciais', 13,
                  'SELECT CD_COLIGADA, CD_CT_GERENCIAL, NM_CT_GERENCIAL FROM TCONTABIL_GERENCIAL WHERE CD_COLIGADA = "01"',
                  'TQuery' );
  end
  else
  begin
    Application.CreateForm(Tfrm_ct_gerencial, frm_ct_gerencial);
    frm_ct_gerencial.Cons_OnLine := datm_param_sistema.qry_parametros_CD_CT_GER_FINANCEIRO;
    with frm_ct_gerencial do
    begin
      Caption      := Caption + ' [Consulta On-Line]';
      lCons_OnLine := True;
      if Not ( datm_param_sistema.qry_parametros_.State in [dsEdit, dsInsert] ) then
           datm_param_sistema.qry_parametros_.Edit;
      ShowModal;
      lCons_OnLine := False;
    end;
    with datm_param_sistema do
    begin
      qry_ct_gerencial_.Close;
      qry_ct_gerencial_.Prepare;
      qry_ct_gerencial_.Open;
    end;
  end;
  dbedt_cd_ct_ger_financeiroExit(nil);
end;

procedure Tfrm_param_sistema.dbedt_cd_ev_solic_cambioExit(Sender: TObject);
begin
  if ( datm_param_sistema.qry_parametros_.State in [dsEdit, dsInsert] ) then
  begin
    ValidCodigo( dbedt_cd_ev_solic_cambio );
    if dbedt_cd_ev_solic_cambio.Text <> '' then
    begin
      if dbedt_nm_ev_solic_cambio.Text = '' then
      begin
        BoxMensagem( 'Código do evento Solicitação do Câmbio inválido!', 2 );
        pgctrl_param.ActivePage := ts_eventos_3;
        dbedt_cd_ev_solic_cambio.SetFocus;
        Exit;
      end;
    end;
  end;
end;

procedure Tfrm_param_sistema.dbedt_cd_ev_solic_seguroExit(Sender: TObject);
begin
  if ( datm_param_sistema.qry_parametros_.State in [dsEdit, dsInsert] ) then
  begin
    ValidCodigo( dbedt_cd_ev_solic_seguro );
    if dbedt_cd_ev_solic_seguro.Text <> '' then
    begin
      if dbedt_nm_ev_solic_seguro.Text = '' then
      begin
        BoxMensagem( 'Código do evento Solicitação do Seguro inválido!', 2 );
        pgctrl_param.ActivePage := ts_eventos_3;
        dbedt_cd_ev_solic_seguro.SetFocus;
        Exit;
      end;
    end;
  end;
end;

procedure Tfrm_param_sistema.dbedt_cd_ev_receb_seguroExit(Sender: TObject);
begin
  if ( datm_param_sistema.qry_parametros_.State in [dsEdit, dsInsert] ) then
  begin
    ValidCodigo( dbedt_cd_ev_receb_seguro );
    if dbedt_cd_ev_receb_seguro.Text <> '' then
    begin
      if dbedt_nm_ev_receb_seguro.Text = '' then
      begin
        BoxMensagem( 'Código do evento Recebimento do Seguro inválido!', 2 );
        pgctrl_param.ActivePage := ts_eventos_3;
        dbedt_cd_ev_receb_seguro.SetFocus;
        Exit;
      end;
    end;
  end;
end;

procedure Tfrm_param_sistema.dbedt_cd_ev_solic_ministerioExit(
  Sender: TObject);
begin
  if ( datm_param_sistema.qry_parametros_.State in [dsEdit, dsInsert] ) then
  begin
    ValidCodigo( dbedt_cd_ev_solic_ministerio );
    if dbedt_cd_ev_solic_ministerio.Text <> '' then
    begin
      if dbedt_nm_ev_solic_ministerio.Text = '' then
      begin
        BoxMensagem( 'Código do evento Solicitação do Ministério inválido!', 2 );
        pgctrl_param.ActivePage := ts_eventos_3;
        dbedt_cd_ev_solic_ministerio.SetFocus;
        Exit;
      end;
    end;
  end;
end;

procedure Tfrm_param_sistema.dbedt_cd_ev_receb_ministerioExit(
  Sender: TObject);
begin
  if ( datm_param_sistema.qry_parametros_.State in [dsEdit, dsInsert] ) then
  begin
    ValidCodigo( dbedt_cd_ev_receb_ministerio );
    if dbedt_cd_ev_receb_ministerio.Text <> '' then
    begin
      if dbedt_nm_ev_receb_ministerio.Text = '' then
      begin
        BoxMensagem( 'Código do evento Recebimento do Ministério inválido!', 2 );
        pgctrl_param.ActivePage := ts_eventos_3;
        dbedt_cd_ev_receb_ministerio.SetFocus;
        Exit;
      end;
    end;
  end;
end;

procedure Tfrm_param_sistema.dbedt_cd_ev_canalExit(Sender: TObject);
begin
  if ( datm_param_sistema.qry_parametros_.State in [dsEdit, dsInsert] ) then
  begin
    ValidCodigo( dbedt_cd_ev_canal );
    if dbedt_cd_ev_canal.Text <> '' then
    begin
      if dbedt_nm_ev_canal.Text = '' then
      begin
        BoxMensagem( 'Código do evento Canal inválido!', 2 );
        pgctrl_param.ActivePage := ts_eventos_3;
        dbedt_cd_ev_canal.SetFocus;
        Exit;
      end;
    end;
  end;
end;

procedure Tfrm_param_sistema.dbedt_cd_ev_liberacaoExit(Sender: TObject);
begin
  if ( datm_param_sistema.qry_parametros_.State in [dsEdit, dsInsert] ) then
  begin
    ValidCodigo( dbedt_cd_ev_liberacao );
    if dbedt_cd_ev_liberacao.Text <> '' then
    begin
      if dbedt_nm_ev_liberacao.Text = '' then
      begin
        BoxMensagem( 'Código do evento Liberação inválido!', 2 );
        pgctrl_param.ActivePage := ts_eventos_3;
        dbedt_cd_ev_liberacao.SetFocus;
        Exit;
      end;
    end;
  end;
end;

procedure Tfrm_param_sistema.btn_co_cd_ct_lpClick(Sender: TObject);
begin
  if datm_param_sistema.qry_parametros_.FieldByName('CD_SISTEMA_CONTABIL').AsString = '0' then
  begin
    Cons_On_line( 'DBBROKER', 'TCONTABIL_PLANO', datm_param_sistema.qry_parametros_CD_CT_LP_SALDUS,
                  'Contas Contábeis', 8,
                  'SELECT CD_COLIGADA, CD_CT_CONTABIL, NM_CT_CONTABIL FROM TCONTABIL_PLANO WHERE CD_COLIGADA = "01"',
                  'TQuery' );
  end
  else
  begin
    Application.CreateForm(Tfrm_ct_contabil, frm_ct_contabil);
    frm_ct_contabil.Cons_OnLine := datm_param_sistema.qry_parametros_CD_CT_LP_SALDUS;
    with frm_ct_contabil do
    begin
      Caption      := Caption + ' [Consulta On-Line]';
      lCons_OnLine := True;
      if Not ( datm_param_sistema.qry_parametros_.State in [dsEdit, dsInsert] ) then
           datm_param_sistema.qry_parametros_.Edit;
      ShowModal;
      lCons_OnLine := False;
    end;
    with datm_param_sistema do
    begin
      qry_ct_contabil_.Close;
      qry_ct_contabil_.Prepare;
      qry_ct_contabil_.Open;
    end;
  end;
  dbedt_cd_ct_ctaapagarExit(nil);
end;

procedure Tfrm_param_sistema.dbedt_cd_item_demurrageExit(Sender: TObject);
begin
  if ( datm_param_sistema.qry_parametros_.State in [dsEdit, dsInsert] ) then
  begin
    ValidCodigo( dbedt_cd_item_demurrage );
    if dbedt_cd_item_demurrage.Text <> '' then
    begin
      if dbedt_nm_item_demurrage.Text = '' then
      begin
        BoxMensagem( 'Código do Item Demurrage inválido!', 2 );
        pgctrl_param.ActivePage := ts_item2;
        dbedt_cd_item_demurrage.SetFocus;
        Exit;
      end;
    end;
  end;
end;

procedure Tfrm_param_sistema.btn_co_usuario_demurrageClick(
  Sender: TObject);
begin
  Application.CreateForm( Tfrm_usuario, frm_usuario );
  with frm_usuario, datm_param_sistema do
  begin
    Cons_OnLine := qry_param_dem_CD_USUARIO_DEMURRAGE;
    Caption := Caption + ' [Consulta On-Line]';
    lCons_OnLine := True;
    if Not ( qry_param_dem_.State in [dsEdit, dsInsert] ) then qry_param_dem_.Edit;
    ShowModal;
    lCons_OnLine := False;

    qry_usuario_.Close;
    qry_usuario_.Prepare;
    qry_usuario_.Open;
  end;

  dbedt_cd_usuario_demurrageExit(nil);
end;

procedure Tfrm_param_sistema.dbedt_cd_usuario_demurrageExit(
  Sender: TObject);
begin
  if ( datm_param_sistema.qry_param_dem_.State in [dsEdit, dsInsert] ) then
  begin
    ValidCodigo( dbedt_cd_usuario_demurrage );
    if dbedt_cd_usuario_demurrage.Text <> '' then
    begin
      if dbedt_nm_usuario_demurrage.Text = '' then
      begin
        BoxMensagem( 'Código do Usuário de Demurrage inválido!', 2 );
        pgctrl_param.ActivePage := ts_demurrage;
        dbedt_cd_usuario_demurrage.SetFocus;
        Exit;
      end;
    end;
  end;
end;

procedure Tfrm_param_sistema.dbedt_cd_ev_venda_nacExit(Sender: TObject);
begin
  if ( datm_param_sistema.qry_parametros_.State in [dsEdit, dsInsert] ) then
  begin
    ValidCodigo( dbedt_cd_ev_venda_nac );
    if dbedt_cd_ev_venda_nac.Text <> '' then
    begin
      if dbedt_nm_ev_venda_nac.Text = '' then
      begin
        BoxMensagem( 'Código do evento Venda ( Nacionalização ) inválido!', 2 );
        pgctrl_param.ActivePage := ts_entreposto;
        dbedt_cd_ev_venda_nac.SetFocus;
        Exit;
      end;
    end;
  end;
end;

procedure Tfrm_param_sistema.dbedt_cd_ev_envio_doc_nacExit(
  Sender: TObject);
begin
   if ( datm_param_sistema.qry_parametros_.State in [dsEdit, dsInsert] ) then
  begin
    ValidCodigo( dbedt_cd_ev_envio_doc_nac );
    if dbedt_cd_ev_envio_doc_nac.Text <> '' then
    begin
      if dbedt_nm_ev_envio_doc_nac.Text = '' then
      begin
        BoxMensagem( 'Código do Evento Envio Docs ( Nacionalização ) inválido!', 2 );
        pgctrl_param.ActivePage := ts_entreposto;
        dbedt_cd_ev_envio_doc_nac.SetFocus;
        Exit;
      end;
    end;
  end;
end;

procedure Tfrm_param_sistema.btn_co_ev_venda_nacClick(
  Sender: TObject);
begin
  Application.CreateForm( Tfrm_evento, frm_evento );
  with frm_evento, datm_param_sistema do
  begin
    Cons_OnLine := qry_parametros_CD_EV_VENDA_NAC;
    Caption := Caption + ' [Consulta On-Line]';
    lCons_OnLine := True;
    if Not ( qry_parametros_.State in [dsEdit, dsInsert] ) then qry_parametros_.Edit;
    ShowModal;
    lCons_OnLine := False;

    qry_usuario_.Close;
    qry_usuario_.Prepare;
    qry_usuario_.Open;
  end;
end;

procedure Tfrm_param_sistema.btn_co_ev_envio_doc_nacClick(
  Sender: TObject);
begin
  Application.CreateForm( Tfrm_evento, frm_evento );
  with frm_evento, datm_param_sistema do
  begin
    Cons_OnLine := qry_parametros_CD_EV_ENVIO_DOC_NAC;
    Caption := Caption + ' [Consulta On-Line]';
    lCons_OnLine := True;
    if Not ( qry_parametros_.State in [dsEdit, dsInsert] ) then qry_parametros_.Edit;
    ShowModal;
    lCons_OnLine := False;

    qry_usuario_.Close;
    qry_usuario_.Prepare;
    qry_usuario_.Open;
  end;
end;

procedure Tfrm_param_sistema.dbedt_cd_grupo_basfExit(Sender: TObject);
begin
  if ( datm_param_sistema.qry_parametros_.State in [dsEdit, dsInsert] ) then
  begin
    ValidCodigo( dbedt_cd_grupo_basf );
    if dbedt_cd_grupo_basf.Text <> '' then
    begin
      if dbedt_nm_grupo_basf.Text = '' then
      begin
        BoxMensagem( 'Código do Grupo BASF!', 2 );
        pgctrl_param.ActivePage := ts_geral;
        dbedt_cd_grupo_basf.SetFocus;
        Exit;
      end;
    end;
  end;
end;

procedure Tfrm_param_sistema.btn_co_grupo_basfClick(Sender: TObject);
begin
  Application.CreateForm( Tfrm_grupo, frm_grupo );
  with frm_grupo, datm_param_sistema do
  begin
    Cons_OnLine := qry_parametros_CD_GRUPO_BASF;
    Caption := Caption + ' [Consulta On-Line]';
    lCons_OnLine := True;
    if Not ( qry_parametros_.State in [dsEdit, dsInsert] ) then qry_parametros_.Edit;
    ShowModal;
    lCons_OnLine := False;

    qry_grupo_.Close;
    qry_grupo_.Prepare;
    qry_grupo_.Open;
  end;
  dbedt_cd_grupo_basfExit(nil);
end;

procedure Tfrm_param_sistema.dbedt_cd_env_comextExit(Sender: TObject);
begin
  if ( datm_param_sistema.qry_parametros_.State in [dsEdit, dsInsert] ) then
  begin
    ValidCodigo( dbedt_cd_env_comext );
    if dbedt_cd_env_comext.Text <> '' then
    begin
      if dbedt_nm_env_comext.Text = '' then
      begin
        BoxMensagem( 'Código do evento Envio ao Comércio Exterior inválido!', 2 );
        pgctrl_param.ActivePage := ts_eventos_4;
        dbedt_cd_env_comext.SetFocus;
        Exit;
      end;
    end;
  end;
end;

procedure Tfrm_param_sistema.dbedt_cd_ev_lib_estExit(Sender: TObject);
begin
  if ( datm_param_sistema.qry_parametros_.State in [dsEdit, dsInsert] ) then
  begin
    ValidCodigo( dbedt_cd_ev_lib_est );
    if dbedt_cd_ev_lib_est.Text <> '' then
    begin
      if dbedt_nm_ev_lib_est.Text = '' then
      begin
        BoxMensagem( 'Código do evento Liberação do Estoque inválido!', 2 );
        pgctrl_param.ActivePage := ts_eventos_4;
        dbedt_cd_ev_lib_est.SetFocus;
        Exit;
      end;
    end;
  end;
end;

procedure Tfrm_param_sistema.dbedt_cd_ev_form_dtExit(Sender: TObject);
begin
  if ( datm_param_sistema.qry_parametros_.State in [dsEdit, dsInsert] ) then
  begin
    ValidCodigo( dbedt_cd_ev_form_dt );
    if dbedt_cd_ev_form_dt.Text <> '' then
    begin
      if dbedt_nm_ev_form_dt.Text = '' then
      begin
        BoxMensagem( 'Código do evento Formatação/Data inválido!', 2 );
        pgctrl_param.ActivePage := ts_eventos_4;
        dbedt_cd_ev_form_dt.SetFocus;
        Exit;
      end;
    end;
  end;
end;

procedure Tfrm_param_sistema.dbedt_cd_ev_lib_fabExit(Sender: TObject);
begin
  if ( datm_param_sistema.qry_parametros_.State in [dsEdit, dsInsert] ) then
  begin
    ValidCodigo( dbedt_cd_ev_lib_fab );
    if dbedt_cd_ev_lib_fab.Text <> '' then
    begin
      if dbedt_nm_ev_lib_fab.Text = '' then
      begin
        BoxMensagem( 'Código do evento Liberação para Fábrica inválido!', 2 );
        pgctrl_param.ActivePage := ts_eventos_4;
        dbedt_cd_ev_lib_fab.SetFocus;
        Exit;
      end;
    end;
  end;
end;

procedure Tfrm_param_sistema.dbedt_cd_ev_rec_dhlExit(Sender: TObject);
begin
  if ( datm_param_sistema.qry_parametros_.State in [dsEdit, dsInsert] ) then
  begin
    ValidCodigo( dbedt_cd_ev_rec_dhl );
    if dbedt_cd_ev_rec_dhl.Text <> '' then
    begin
      if dbedt_nm_ev_rec_dhl.Text = '' then
      begin
        BoxMensagem( 'Código do evento Recebimento do DHL inválido!', 2 );
        pgctrl_param.ActivePage := ts_eventos_4;
        dbedt_cd_ev_rec_dhl.SetFocus;
        Exit;
      end;
    end;
  end;
end;

procedure Tfrm_param_sistema.dbedt_cd_ev_email_libExit(Sender: TObject);
begin
  if ( datm_param_sistema.qry_parametros_.State in [dsEdit, dsInsert] ) then
  begin
    ValidCodigo( dbedt_cd_ev_email_lib );
    if dbedt_cd_ev_email_lib.Text <> '' then
    begin
      if dbedt_nm_ev_email_lib.Text = '' then
      begin
        BoxMensagem( 'Código do evento Email de Liberação inválido!', 2 );
        pgctrl_param.ActivePage := ts_eventos_4;
        dbedt_cd_ev_email_lib.SetFocus;
        Exit;
      end;
    end;
  end;
end;

procedure Tfrm_param_sistema.dbedt_cd_ev_conf_docsExit(Sender: TObject);
begin
  if ( datm_param_sistema.qry_parametros_.State in [dsEdit, dsInsert] ) then
  begin
    ValidCodigo( dbedt_cd_ev_conf_docs );
    if dbedt_cd_ev_conf_docs.Text <> '' then
    begin
      if dbedt_nm_ev_conf_docs.Text = '' then
      begin
        BoxMensagem( 'Código do evento Confecção de Documentos inválido!', 2 );
        pgctrl_param.ActivePage := ts_eventos_4;
        dbedt_cd_ev_conf_docs.SetFocus;
        Exit;
      end;
    end;
  end;
end;

procedure Tfrm_param_sistema.dbedt_cd_ev_solic_desovaExit(Sender: TObject);
begin
  if ( datm_param_sistema.qry_parametros_.State in [dsEdit, dsInsert] ) then
  begin
    ValidCodigo( dbedt_cd_ev_solic_desova );
    if dbedt_cd_ev_solic_desova.Text <> '' then
    begin
      if dbedt_nm_ev_solic_desova.Text = '' then
      begin
        BoxMensagem( 'Código do evento Solicitação de Desova inválido!', 2 );
        pgctrl_param.ActivePage := ts_eventos_4;
        dbedt_cd_ev_solic_desova.SetFocus;
        Exit;
      end;
    end;
  end;
end;


procedure Tfrm_param_sistema.dbedt_cd_item_logisticaChange(
  Sender: TObject);
begin
  btn_salvar.Enabled   := True;
  btn_cancelar.Enabled := True;
  mi_salvar.Enabled    := True;
  mi_cancelar.Enabled  := True;
end;

procedure Tfrm_param_sistema.dbedt_cd_item_logisticaExit(Sender: TObject);
begin
  if ( datm_param_sistema.qry_parametros_.State in [dsEdit, dsInsert] ) then
  begin
    ValidCodigo( dbedt_cd_item_logistica );
    if dbedt_cd_item_logistica.Text <> '' then
    begin
      if dbedt_nm_item_logistica.Text = '' then
      begin
        BoxMensagem( 'Código do Item Operação Logistica inválido!', 2 );
        pgctrl_param.ActivePage := ts_item2;
        dbedt_cd_item_logistica.SetFocus;
        Exit;
      end;
    end;
  end;
end;

procedure Tfrm_param_sistema.dbedt_cd_ev_cert_origemChange(Sender: TObject);
begin
  btn_salvar.Enabled   := True;
  btn_cancelar.Enabled := True;
  mi_salvar.Enabled    := True;
  mi_cancelar.Enabled  := True;
end;

procedure Tfrm_param_sistema.dbedt_cd_ev_cert_origemExit(Sender: TObject);
begin
if ( datm_param_sistema.qry_parametros_.State in [dsEdit, dsInsert] ) then
  begin
    ValidCodigo( dbedt_cd_ev_cert_origem );
    if dbedt_cd_ev_cert_origem.Text <> '' then
    begin
      if dbedt_nm_ev_cert_origem.Text = '' then
      begin
        BoxMensagem( 'Código do evento Certificado de Origem inválido!', 2 );
        pgctrl_param.ActivePage := ts_eventos_4;
        dbedt_cd_ev_cert_origem.SetFocus;
        Exit;
      end;
    end;
  end;
end;

procedure Tfrm_param_sistema.dbedt_cd_ev_ped_recExit(Sender: TObject);
begin
  if ( datm_param_sistema.qry_parametros_.State in [dsEdit, dsInsert] ) then
  begin
    ValidCodigo( dbedt_cd_ev_ped_rec );
    if dbedt_cd_ev_ped_rec.Text <> '' then
    begin
      if dbedt_cd_ev_ped_rec.Text = '' then
      begin
        BoxMensagem( 'Código do evento Recebimento PO inválido!', 2 );
        pgctrl_param.ActivePage := ts_eventos_4;
        dbedt_cd_ev_ped_rec.SetFocus;
        Exit;
      end;
    end;
  end;
end;

procedure Tfrm_param_sistema.dbedt_cd_ev_entr_merc_fabrExit(Sender: TObject);
begin
if ( datm_param_sistema.qry_parametros_.State in [dsEdit, dsInsert] ) then
  begin
    ValidCodigo( dbedt_cd_ev_entr_merc_fabr );
    if dbedt_cd_ev_entr_merc_fabr.Text <> '' then
    begin
      if dbedt_cd_ev_entr_merc_fabr.Text = '' then
      begin
        BoxMensagem( 'Código do evento Entrega Mercadoria Fábrica inválido!', 2 );
        pgctrl_param.ActivePage := ts_eventos_4;
        dbedt_cd_ev_entr_merc_fabr.SetFocus;
        Exit;
      end;
    end;
  end;
end;

procedure Tfrm_param_sistema.dbedt_cd_ev_dt_necessidadeExit(
  Sender: TObject);
begin
if ( datm_param_sistema.qry_parametros_.State in [dsEdit, dsInsert] ) then
  begin
    ValidCodigo( dbedt_cd_ev_dt_necessidade );
    if dbedt_cd_ev_dt_necessidade.Text <> '' then
    begin
      if dbedt_cd_ev_dt_necessidade.Text = '' then
      begin
        BoxMensagem( 'Código do evento Data Necessidade inválido!', 2 );
        pgctrl_param.ActivePage := ts_eventos_4;
        dbedt_cd_ev_dt_necessidade.SetFocus;
        Exit;
      end;
    end;
  end;
end;

procedure Tfrm_param_sistema.btn_co_grupo_bsgClick(Sender: TObject);
begin
  Application.CreateForm( Tfrm_grupo, frm_grupo );
  with frm_grupo, datm_param_sistema do
  begin
    Cons_OnLine := qry_parametros_CD_GRUPO_BSG;
    Caption := Caption + ' [Consulta On-Line]';
    lCons_OnLine := True;
    if Not ( qry_parametros_.State in [dsEdit, dsInsert] ) then qry_parametros_.Edit;
    ShowModal;
    lCons_OnLine := False;

    qry_grupo_.Close;
    qry_grupo_.Prepare;
    qry_grupo_.Open;
  end;
  dbedt_cd_grupo_bsgExit(nil);
end;

procedure Tfrm_param_sistema.dbedt_cd_grupo_bsgExit(Sender: TObject);
begin
  if ( datm_param_sistema.qry_parametros_.State in [dsEdit, dsInsert] ) then
  begin
    ValidCodigo( dbedt_cd_grupo_bsg );
    if dbedt_cd_grupo_bsg.Text <> '' then
    begin
      if dbedt_nm_grupo_bsg.Text = '' then
      begin
        BoxMensagem( 'Código do Grupo BSG!', 2 );
        pgctrl_param.ActivePage := ts_geral;
        dbedt_cd_grupo_bsg.SetFocus;
        Exit;
      end;
    end;
  end;
end;

procedure Tfrm_param_sistema.dbedt_cd_ev_envio_doc_cliExit(
  Sender: TObject);
begin
  if ( datm_param_sistema.qry_parametros_.State in [dsEdit, dsInsert] ) then
  begin
    ValidCodigo( dbedt_cd_ev_envio_doc_cli );
    if dbedt_cd_ev_envio_doc_cli.Text <> '' then
    begin
      if dbedt_cd_ev_envio_doc_cli.Text = '' then
      begin
        BoxMensagem( 'Código do evento Envios Documentos para Cliente inválido!', 2 );
        pgctrl_param.ActivePage := ts_eventos_4;
        dbedt_cd_ev_envio_doc_cli.SetFocus;
        Exit;
      end;
    end;
  end;
end;

procedure Tfrm_param_sistema.dbedt_cd_ev_entr_eadiExit(Sender: TObject);
begin
if ( datm_param_sistema.qry_parametros_.State in [dsEdit, dsInsert] ) then
  begin
    ValidCodigo( dbedt_cd_ev_entr_eadi );
    if dbedt_cd_ev_entr_eadi.Text <> '' then
    begin
      if dbedt_cd_ev_entr_eadi.Text = '' then
      begin
        BoxMensagem( 'Código do evento Envios Documentos para Cliente inválido!', 2 );
        pgctrl_param.ActivePage := ts_eventos_4;
        dbedt_cd_ev_entr_eadi.SetFocus;
        Exit;
      end;
    end;
  end;
end;

procedure Tfrm_param_sistema.dbedt_cd_grupo_oxitenoExit(Sender: TObject);
begin
  if ( datm_param_sistema.qry_parametros_.State in [dsEdit, dsInsert] ) then
  begin
    ValidCodigo( dbedt_cd_grupo_oxiteno );
    if dbedt_cd_grupo_oxiteno.Text <> '' then
    begin
      if dbedt_nm_grupo_oxiteno.Text = '' then
      begin
        BoxMensagem( 'Código do Grupo Oxiteno!', 2 );
        pgctrl_param.ActivePage := ts_geral;
        dbedt_cd_grupo_oxiteno.SetFocus;
        Exit;
      end;
    end;
  end;
end;

procedure Tfrm_param_sistema.btn_co_grupo_oxitenoClick(Sender: TObject);
begin
  Application.CreateForm( Tfrm_grupo, frm_grupo );
  with frm_grupo, datm_param_sistema do
  begin
    Cons_OnLine := qry_parametros_CD_GRUPO_OXITENO;
    Caption := Caption + ' [Consulta On-Line]';
    lCons_OnLine := True;
    if Not ( qry_parametros_.State in [dsEdit, dsInsert] ) then qry_parametros_.Edit;
    ShowModal;
    lCons_OnLine := False;

    qry_grupo_.Close;
    qry_grupo_.Prepare;
    qry_grupo_.Open;
  end;
  dbedt_cd_grupo_oxitenoExit(nil);
end;

procedure Tfrm_param_sistema.dbedt_cd_ev_dt_consolidacaoExit(Sender: TObject);
begin
if ( datm_param_sistema.qry_parametros_.State in [dsEdit, dsInsert] ) then
  begin
    ValidCodigo( dbedt_cd_ev_dt_consolidacao );
    if dbedt_cd_ev_dt_consolidacao.Text <> '' then
    begin
      if dbedt_cd_ev_dt_consolidacao.Text = '' then
      begin
        BoxMensagem( 'Código do evento Data de Consolidação inválido!', 2 );
        pgctrl_param.ActivePage := ts_eventos_4;
        dbedt_cd_ev_dt_consolidacao.SetFocus;
        Exit;
      end;
    end;
  end;
end;

procedure Tfrm_param_sistema.dbedt_cd_ev_receb_pedExit(Sender: TObject);
begin
if ( datm_param_sistema.qry_parametros_.State in [dsEdit, dsInsert] ) then
  begin
    ValidCodigo( dbedt_cd_ev_receb_ped );
    if dbedt_cd_ev_receb_ped.Text <> '' then
    begin
      if dbedt_cd_ev_receb_ped.Text = '' then
      begin
        BoxMensagem( 'Código do evento Data de Consolidação inválido!', 2 );
        pgctrl_param.ActivePage := ts_eventos_4;
        dbedt_cd_ev_receb_ped.SetFocus;
        Exit;
      end;
    end;
  end;
end;

procedure Tfrm_param_sistema.dbedt_cd_ev_solic_ovExit(Sender: TObject);
begin
if ( datm_param_sistema.qry_parametros_.State in [dsEdit, dsInsert] ) then
  begin
    ValidCodigo( dbedt_cd_ev_solic_ov );
    if dbedt_cd_ev_solic_ov.Text <> '' then
    begin
      if dbedt_cd_ev_solic_ov.Text = '' then
      begin
        BoxMensagem( 'Código do evento Data de Consolidação inválido!', 2 );
        pgctrl_param.ActivePage := ts_eventos_4;
        dbedt_cd_ev_solic_ov.SetFocus;
        Exit;
      end;
    end;
  end;
end;

procedure Tfrm_param_sistema.dbedt_cd_ev_solic_remessaExit(Sender: TObject);
begin
if ( datm_param_sistema.qry_parametros_.State in [dsEdit, dsInsert] ) then
  begin
    ValidCodigo( dbedt_cd_ev_solic_remessa );
    if dbedt_cd_ev_solic_remessa.Text <> '' then
    begin
      if dbedt_cd_ev_solic_remessa.Text = '' then
      begin
        BoxMensagem( 'Código do evento Data de Consolidação inválido!', 2 );
        pgctrl_param.ActivePage := ts_eventos_4;
        dbedt_cd_ev_solic_remessa.SetFocus;
        Exit;
      end;
    end;
  end;
end;

procedure Tfrm_param_sistema.dbedt_cd_ev_param_dtaExit(Sender: TObject);
begin
if ( datm_param_sistema.qry_parametros_.State in [dsEdit, dsInsert] ) then
  begin
    ValidCodigo( dbedt_cd_ev_param_dta );
    if dbedt_cd_ev_param_dta.Text <> '' then
    begin
      if dbedt_cd_ev_param_dta.Text = '' then
      begin
        BoxMensagem( 'Código do evento Data de Parametrização DTA inválido!', 2 );
        pgctrl_param.ActivePage := ts_eventos_4;
        dbedt_cd_ev_param_dta.SetFocus;
        Exit;
      end;
    end;
  end;
end;

procedure Tfrm_param_sistema.dbedt_cd_ev_pres_carga_eadiExit(Sender: TObject);
begin
if ( datm_param_sistema.qry_parametros_.State in [dsEdit, dsInsert] ) then
  begin
    ValidCodigo( dbedt_cd_ev_pres_carga_eadi );
    if dbedt_cd_ev_pres_carga_eadi.Text <> '' then
    begin
      if dbedt_cd_ev_pres_carga_eadi.Text = '' then
      begin
        BoxMensagem( 'Código do evento Data de Presença de Carga EADI inválido!', 2 );
        pgctrl_param.ActivePage := ts_eventos_5;
        dbedt_cd_ev_pres_carga_eadi.SetFocus;
        Exit;
      end;
    end;
  end;
end;

procedure Tfrm_param_sistema.dbedt_cd_ev_registro_dtaExit(Sender: TObject);
begin
if ( datm_param_sistema.qry_parametros_.State in [dsEdit, dsInsert] ) then
  begin
    ValidCodigo( dbedt_cd_ev_registro_dta );
    if dbedt_cd_ev_registro_dta.Text <> '' then
    begin
      if dbedt_cd_ev_registro_dta.Text = '' then
      begin
        BoxMensagem( 'Código do evento Data do Registro DTA inválido!', 2 );
        pgctrl_param.ActivePage := ts_eventos_5;
        dbedt_cd_ev_registro_dta.SetFocus;
        Exit;
      end;
    end;
  end;
end;

procedure Tfrm_param_sistema.dbedt_cd_item_cofinsExit(Sender: TObject);
begin
  if ( datm_param_sistema.qry_parametros_.State in [dsEdit, dsInsert] ) then
  begin
    ValidCodigo( dbedt_cd_item_cofins );
    if dbedt_cd_item_cofins.Text <> '' then
    begin
      if dbedt_nm_item_cofins.Text = '' then
      begin
        BoxMensagem( 'Código do Item Cofins inválido!', 2 );
        pgctrl_param.ActivePage := ts_item2;
        dbedt_cd_item_cofins.SetFocus;
        Exit;
      end;
    end;
  end;
end;

procedure Tfrm_param_sistema.dbedt_cd_item_cofins_retExit(Sender: TObject);
begin
  if ( datm_param_sistema.qry_parametros_.State in [dsEdit, dsInsert] ) then
  begin
    ValidCodigo( dbedt_cd_item_cofins_ret );
    if dbedt_cd_item_cofins_ret.Text <> '' then
    begin
      if dbedt_nm_item_cofins_ret.Text = '' then
      begin
        BoxMensagem( 'Código do Item Cofins inválido!', 2 );
        pgctrl_param.ActivePage := ts_item2;
        dbedt_cd_item_cofins_ret.SetFocus;
        Exit;
      end;
    end;
  end;
end;

procedure Tfrm_param_sistema.dbedt_cd_ev_dta_transpExit(Sender: TObject);
begin
if ( datm_param_sistema.qry_parametros_.State in [dsEdit, dsInsert] ) then
  begin
    ValidCodigo( dbedt_cd_ev_dta_transp );
    if dbedt_cd_ev_dta_transp.Text <> '' then
    begin
      if dbedt_nm_ev_dta_transp.Text = '' then
      begin
        BoxMensagem( 'Código do evento Envio DTA Transportadora inválido!', 2 );
        pgctrl_param.ActivePage := ts_eventos_4;
        dbedt_cd_ev_dta_transp.SetFocus;
        Exit;
      end;
    end;
  end;
end;

procedure Tfrm_param_sistema.dbedt_cd_item_mp164Exit(Sender: TObject);
begin
  if ( datm_param_sistema.qry_parametros_.State in [dsEdit, dsInsert] ) then
  begin
    ValidCodigo( dbedt_cd_item_mp164 );
    if dbedt_cd_item_mp164.Text <> '' then
    begin
      if dbedt_nm_item_mp164.Text = '' then
      begin
        BoxMensagem( 'Código da MP164 inválido!', 2 );
        pgctrl_param.ActivePage := ts_item2;
        dbedt_cd_item_mp164.SetFocus;
        Exit;
      end;
    end;
  end;
end;

procedure Tfrm_param_sistema.dbedt_cd_item_pis_impExit(Sender: TObject);
begin
  if ( datm_param_sistema.qry_parametros_.State in [dsEdit, dsInsert] ) then
  begin
    ValidCodigo( dbedt_cd_item_pis_imp );
    if dbedt_cd_item_pis_imp.Text <> '' then
    begin
      if dbedt_nm_item_pis_imp.Text = '' then
      begin
        BoxMensagem( 'Código do PIS Importação inválido!', 2 );
        pgctrl_param.ActivePage := ts_item2;
        dbedt_cd_item_pis_imp.SetFocus;
        Exit;
      end;
    end;
  end;
end;

procedure Tfrm_param_sistema.dbedt_cd_item_cofins_impExit(Sender: TObject);
begin
  if ( datm_param_sistema.qry_parametros_.State in [dsEdit, dsInsert] ) then
  begin
    ValidCodigo( dbedt_cd_item_cofins_imp );
    if dbedt_cd_item_cofins_imp.Text <> '' then
    begin
      if dbedt_nm_item_cofins_imp.Text = '' then
      begin
        BoxMensagem( 'Código do COFINS Importação inválido!', 2 );
        pgctrl_param.ActivePage := ts_item2;
        dbedt_cd_item_cofins_imp.SetFocus;
        Exit;
      end;
    end;
  end;
end;

procedure Tfrm_param_sistema.dbedt_cd_grupo_valsparExit(Sender: TObject);
begin
  if ( datm_param_sistema.qry_parametros_.State in [dsEdit, dsInsert] ) then
  begin
    ValidCodigo( dbedt_cd_grupo_valspar );
    if dbedt_cd_grupo_valspar.Text <> '' then
    begin
      if dbedt_nm_grupo_valspar.Text = '' then
      begin
        BoxMensagem( 'Código do Grupo Valspar!', 2 );
        pgctrl_param.ActivePage := ts_geral;
        dbedt_cd_grupo_valspar.SetFocus;
        Exit;
      end;
    end;
  end;
end;

procedure Tfrm_param_sistema.btn_co_grupo_valsparClick(Sender: TObject);
begin
  Application.CreateForm( Tfrm_grupo, frm_grupo );
  with frm_grupo, datm_param_sistema do
  begin
    Cons_OnLine := qry_parametros_CD_GRUPO_VALSPAR;
    Caption := Caption + ' [Consulta On-Line]';
    lCons_OnLine := True;
    if Not ( qry_parametros_.State in [dsEdit, dsInsert] ) then qry_parametros_.Edit;
    ShowModal;
    lCons_OnLine := False;

    qry_grupo_.Close;
    qry_grupo_.Prepare;
    qry_grupo_.Open;
  end;
  dbedt_cd_grupo_valsparExit(nil);
end;

procedure Tfrm_param_sistema.dbedt_cd_grupo_valtraExit(Sender: TObject);
begin
  if ( datm_param_sistema.qry_parametros_.State in [dsEdit, dsInsert] ) then
  begin
    ValidCodigo( dbedt_cd_grupo_valtra );
    if dbedt_cd_grupo_valtra.Text <> '' then
    begin
      if dbedt_nm_grupo_valtra.Text = '' then
      begin
        BoxMensagem( 'Código do Grupo Valtra!', 2 );
        pgctrl_param.ActivePage := ts_geral;
        dbedt_cd_grupo_valtra.SetFocus;
        Exit;
      end;
    end;
  end;
end;

procedure Tfrm_param_sistema.btn_co_grupo_valtraClick(Sender: TObject);
begin
  Application.CreateForm( Tfrm_grupo, frm_grupo );
  with frm_grupo, datm_param_sistema do
  begin
    Cons_OnLine := qry_parametros_CD_GRUPO_VALTRA;
    Caption := Caption + ' [Consulta On-Line]';
    lCons_OnLine := True;
    if Not ( qry_parametros_.State in [dsEdit, dsInsert] ) then qry_parametros_.Edit;
    ShowModal;
    lCons_OnLine := False;

    qry_grupo_.Close;
    qry_grupo_.Prepare;
    qry_grupo_.Open;
  end;
  dbedt_cd_grupo_valtraExit(nil);
end;

procedure Tfrm_param_sistema.dbedt_cd_grupo_crodaExit(Sender: TObject);
begin
  if ( datm_param_sistema.qry_parametros_.State in [dsEdit, dsInsert] ) then
  begin
    ValidCodigo( dbedt_cd_grupo_croda );
    if dbedt_cd_grupo_croda.Text <> '' then
    begin
      if dbedt_nm_grupo_croda.Text = '' then
      begin
        BoxMensagem( 'Código do Grupo Croda!', 2 );
        pgctrl_param.ActivePage := ts_geral;
        dbedt_cd_grupo_croda.SetFocus;
        Exit;
      end;
    end;
  end;
end;

procedure Tfrm_param_sistema.btn_co_grupo_crodaClick(Sender: TObject);
begin
  Application.CreateForm( Tfrm_grupo, frm_grupo );
  with frm_grupo, datm_param_sistema do
  begin
    Cons_OnLine := qry_parametros_CD_GRUPO_CRODA;
    Caption := Caption + ' [Consulta On-Line]';
    lCons_OnLine := True;
    if Not ( qry_parametros_.State in [dsEdit, dsInsert] ) then qry_parametros_.Edit;
    ShowModal;
    lCons_OnLine := False;

    qry_grupo_.Close;
    qry_grupo_.Prepare;
    qry_grupo_.Open;
  end;
  dbedt_cd_grupo_crodaExit(nil);
end;

procedure Tfrm_param_sistema.dbedt_cd_grupo_saintgExit(Sender: TObject);
begin
  if ( datm_param_sistema.qry_parametros_.State in [dsEdit, dsInsert] ) then
  begin
    ValidCodigo( dbedt_cd_grupo_saintg );
    if dbedt_cd_grupo_saintg.Text <> '' then
    begin
      if dbedt_nm_grupo_saintg.Text = '' then
      begin
        BoxMensagem( 'Código do Grupo Croda!', 2 );
        pgctrl_param.ActivePage := ts_geral;
        dbedt_cd_grupo_saintg.SetFocus;
        Exit;
      end;
    end;
  end;
end;

procedure Tfrm_param_sistema.dbedt_cd_grupo_bshExit(Sender: TObject);
begin
  if ( datm_param_sistema.qry_parametros_.State in [dsEdit, dsInsert] ) then
  begin
    ValidCodigo( dbedt_cd_grupo_bsh );
    if dbedt_cd_grupo_bsh.Text <> '' then
    begin
      if dbedt_nm_grupo_bsh.Text = '' then
      begin
        BoxMensagem( 'Código do Grupo Croda!', 2 );
        pgctrl_param.ActivePage := ts_geral;
        dbedt_cd_grupo_bsh.SetFocus;
        Exit;
      end;
    end;
  end;
end;

procedure Tfrm_param_sistema.btn_co_grupo_saintgClick(Sender: TObject);
begin
  Application.CreateForm( Tfrm_grupo, frm_grupo );
  with frm_grupo, datm_param_sistema do
  begin
    Cons_OnLine := qry_parametros_CD_GRUPO_CRODA;
    Caption := Caption + ' [Consulta On-Line]';
    lCons_OnLine := True;
    if Not ( qry_parametros_.State in [dsEdit, dsInsert] ) then qry_parametros_.Edit;
    ShowModal;
    lCons_OnLine := False;

    qry_grupo_.Close;
    qry_grupo_.Prepare;
    qry_grupo_.Open;
  end;
  dbedt_cd_grupo_saintgExit(nil);
end;

procedure Tfrm_param_sistema.btn_co_grupo_bshClick(Sender: TObject);
begin
  Application.CreateForm( Tfrm_grupo, frm_grupo );
  with frm_grupo, datm_param_sistema do
  begin
    Cons_OnLine := qry_parametros_CD_GRUPO_CRODA;
    Caption := Caption + ' [Consulta On-Line]';
    lCons_OnLine := True;
    if Not ( qry_parametros_.State in [dsEdit, dsInsert] ) then qry_parametros_.Edit;
    ShowModal;
    lCons_OnLine := False;

    qry_grupo_.Close;
    qry_grupo_.Prepare;
    qry_grupo_.Open;
  end;
  dbedt_cd_grupo_bshExit(nil);
end;

procedure Tfrm_param_sistema.dbedt_cd_item_pis_cofinsExit(Sender: TObject);
begin
  if ( datm_param_sistema.qry_parametros_.State in [dsEdit, dsInsert] ) then
  begin
    ValidCodigo( dbedt_cd_item_pis_cofins );
    if dbedt_cd_item_pis_cofins.Text <> '' then
    begin
      if dbedt_nm_item_pis_cofins.Text = '' then
      begin
        BoxMensagem( 'Código do PIS/COFINS inválido!', 2 );
        pgctrl_param.ActivePage := ts_item2;
        dbedt_cd_item_pis_cofins.SetFocus;
        Exit;
      end;
    end;
  end;
end;

procedure Tfrm_param_sistema.dbedtCdEvEntFabrExit(Sender: TObject);
begin
if ( datm_param_sistema.qry_parametros_.State in [dsEdit, dsInsert] ) then
  begin
    ValidCodigo( dbedtCdEvEntFabr );
    if dbedtCdEvEntFabr.Text <> '' then
    begin
      if dbedtCdEvEntFabr.Text = '' then
      begin
        BoxMensagem( 'Código do evento Data de Entrada na Fábrica inválido!', 2 );
        pgctrl_param.ActivePage := ts_eventos_5;
        dbedtCdEvEntFabr.SetFocus;
        Exit;
      end;
    end;
  end;
end;

procedure Tfrm_param_sistema.dbedt_cd_item_frt_mar_fiExit(Sender: TObject);
begin
  //by carlos
  if ( datm_param_sistema.qry_parametros_.State in [dsEdit, dsInsert] ) then begin
    ValidCodigo( dbedt_cd_item_frt_mar_fi );
    if dbedt_cd_item_frt_mar_fi.Text <> '' then
      if dbedt_nm_item_frt_mar_fi.Text = '' then begin
         BoxMensagem( 'Código do Item FI - MARITIMO inválido!', 2 );
         pgctrl_param.ActivePage := ts_item2;
         dbedt_cd_item_frt_mar_fi.SetFocus;
         Exit;
      end;

  end;

end;

procedure Tfrm_param_sistema.dbedt_cd_item_frt_aer_fiExit(Sender: TObject);
begin
  //by carlos
  if ( datm_param_sistema.qry_parametros_.State in [dsEdit, dsInsert] ) then  begin
    ValidCodigo( dbedt_cd_item_frt_aer_fi );
    if dbedt_cd_item_frt_aer_fi.Text <> '' then
      if dbedt_nm_item_frt_aer_fi.Text = '' then begin
        BoxMensagem( 'Código do Item FI - AÉREO inválido!', 2 );
        pgctrl_param.ActivePage := ts_item2;
        dbedt_cd_item_frt_aer_fi.SetFocus;
        Exit;
      end;
  end;

end;

procedure Tfrm_param_sistema.dbedt_cd_item_frt_rod_fiExit(Sender: TObject);
begin
  //by carlos
  if ( datm_param_sistema.qry_parametros_.State in [dsEdit, dsInsert] ) then  begin
    ValidCodigo( dbedt_cd_item_frt_rod_fi );
    if dbedt_cd_item_frt_rod_fi.Text <> '' then
      if dbedt_nm_item_frt_rod_fi.Text = '' then begin
        BoxMensagem( 'Código do Item FI - RODOVIÁRIO inválido!', 2 );
        pgctrl_param.ActivePage := ts_item2;
        dbedt_cd_item_frt_rod_fi.SetFocus;
        Exit;
      end;
  end;

end;

procedure Tfrm_param_sistema.dbedt_cd_item_frt_seguroExit(Sender: TObject);
begin
  //by carlos
  if ( datm_param_sistema.qry_parametros_.State in [dsEdit, dsInsert] ) then  begin
    ValidCodigo( dbedt_cd_item_frt_seguro );
    if dbedt_cd_item_frt_seguro.Text <> '' then
      if dbedt_cd_item_frt_seguro.Text = '' then begin
        BoxMensagem( 'Código do Item FRETE SEGURO  inválido!', 2 );
        pgctrl_param.ActivePage := ts_item2;
        dbedt_cd_item_frt_seguro.SetFocus;
        Exit;
      end;
  end;

end;

end.
