unit PGDI004;

interface

uses
  Variants,   Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, StdCtrls, Mask, DBCtrls, Menus, Buttons, ComCtrls, Grids, StrUtils,
  DBGrids, Db, DBTables, DBCGrids, Funcoes, DateUtils, Math,
  FormsLog, cxGraphics, cxControls, cxLookAndFeels, cxLookAndFeelPainters,
  cxContainer, cxEdit, dxSkinsCore, dxSkinsDefaultPainters, cxCheckBox,
  cxDBEdit, cxTextEdit, cxMaskEdit, cxDropDownEdit, cxCalendar, ToolEdit,
  RXDBCtrl, KrUtil; // Este sempre depois das uses Forms e Classes - Michel - 22/03/2013

type
  Tfrm_DI_adicao = class(TForm)
    pnl_cadastro: TPanel;
    btn_sair: TSpeedButton;
    btn_salvar: TSpeedButton;
    btn_cancelar: TSpeedButton;
    menu_manut_cadastro: TMainMenu;
    mi_salvar: TMenuItem;
    mi_cancelar: TMenuItem;
    mi_sair: TMenuItem;
    pgctrl_adicao: TPageControl;
    tbsht_fornecedor_fabricante: TTabSheet;
    lbl_vinculacao_comp_vend: TLabel;
    lbl_pais_origem1: TLabel;
    sbtn_tab_pais1: TSpeedButton;
    dbrgrp_fabr_expo: TDBRadioGroup;
    pgctrl_expo_fabr: TPageControl;
    tbsht_exportador: TTabSheet;
    SpeedButton8: TSpeedButton;
    tbsht_fabricante_produtor: TTabSheet;
    lbl_fabr_codigo: TLabel;
    btn_co_fabricante: TSpeedButton;
    lbl_fabr_nome: TLabel;
    lbl_fabr_logradouro: TLabel;
    lbl_fabr_complemento: TLabel;
    lbl_fabr_estado: TLabel;
    lbl_fabr_cidade: TLabel;
    lbl_fabr_numero: TLabel;
    lbl_fabr_pais_origem: TLabel;
    sbtn_tab_pais3: TSpeedButton;
    dbedt_fabr_codigo: TDBEdit;
    dbedt_fabr_descricao: TDBEdit;
    dbedt_fabr_nm: TDBEdit;
    dbedt_fabr_logradouro: TDBEdit;
    dbedt_fabr_complemento: TDBEdit;
    dbedt_fabr_estado: TDBEdit;
    dbedt_fabr_cidade: TDBEdit;
    dbedt_fabr_numero: TDBEdit;
    dbedt_fabr_cd_pais: TDBEdit;
    dbedt_fabr_nm_pais: TDBEdit;
    dbedt_cd_pais_origem1: TDBEdit;
    dbedt_nm_pais_origem1: TDBEdit;
    tbsht_mercadoria: TTabSheet;
    pgctrl_mercadorias: TPageControl;
    tbsht_mercadoria_basica: TTabSheet;
    lbl_naladi_sh: TLabel;
    dbedt_cd_naladi_sh: TDBEdit;
    sbtn_tab_naladi_sh: TSpeedButton;
    lbl_naladi_ncca: TLabel;
    dbedt_cd_naladi_ncca: TDBEdit;
    sbtn_tab_naladi_ncca: TSpeedButton;
    lbl_denominacao_ncm: TLabel;
    dbedt_nm_ncm: TDBEdit;
    lbl_aliquota_II: TLabel;
    dbedt_aliq_II: TDBEdit;
    lbl_aliquota_IPI: TLabel;
    dbedt_aliq_IPI: TDBEdit;
    lbl_Qt_Med_Estatistica: TLabel;
    dbedt_qt_med_estatistica: TDBEdit;
    lbl_unid_med_estatistica: TLabel;
    lbl_peso_liquido: TLabel;
    dbedt_pl_mercadoria: TDBEdit;
    dbg_destaque_ncm: TDBGrid;
    dbrgrp_aplicacao: TDBRadioGroup;
    dbg_docto_vinc: TDBGrid;
    tbsht_mercadoria_item: TTabSheet;
    lbl_moeda_mcv: TLabel;
    dbedt_cd_moeda_mcv: TDBEdit;
    tbsht_carga: TTabSheet;
    lbl_vl_tot_Cond_Vend: TLabel;
    dbedt_tot_merc_cod_vend: TDBEdit;
    grpbox_seguro_total: TGroupBox;
    lbl_moeda_seguro_total: TLabel;
    sbtn_tab_moeda_Seguro_Total: TSpeedButton;
    lbl_vl_seguro_moeda: TLabel;
    lbl_vl_seguro_real: TLabel;
    dbedt_cd_moeda_seguro: TDBEdit;
    dbedt_vl_seguro_moeda: TDBEdit;
    dbedt_vl_seguro_real: TDBEdit;
    lbl_cd_pais_procedencia: TLabel;
    dbedt_cd_pais_procedencia: TDBEdit;
    dbedt_nm_pais_procedencia: TDBEdit;
    sbtn_tab_pais4: TSpeedButton;
    lbl_urf_entrada_pais: TLabel;
    dbedt_cd_urf_entrada: TDBEdit;
    dbedt_nm_urf_entrada: TDBEdit;
    sbtn_tab_urf_entrada: TSpeedButton;
    grpbox_frete_total: TGroupBox;
    lbl_moeda_frete_total: TLabel;
    sbtn_tab_moeda_Frete_Total: TSpeedButton;
    lbl_vl_frete_moeda: TLabel;
    lbl_vl_frete_real: TLabel;
    dbedt_cd_moeda_frete: TDBEdit;
    dbedt_vl_frete_moeda: TDBEdit;
    dbedt_vl_frete_real: TDBEdit;
    dblkpcbox_via_transp: TDBLookupComboBox;
    lbl_via_transp: TLabel;
    dbg_ad_itens: TDBGrid;
    tbsht_valor_aduaneiro: TTabSheet;
    pgctrl_acres_dedu: TPageControl;
    tbsht_valoracao_acrescimos: TTabSheet;
    tbsht_valoracao_deducoes: TTabSheet;
    tbsht_valoracao_complemento: TTabSheet;
    dbg_acrescimos: TDBGrid;
    dbg_deducoes: TDBGrid;
    dbmemo_complemento: TDBMemo;
    pnl_cond_venda_mercadoria: TPanel;
    lbl_cd_incoterm: TLabel;
    dbedt_cd_incoterm: TDBEdit;
    lbl_metodo_valoracao: TLabel;
    dbedt_cd_metodo_valoracao: TDBEdit;
    lbl_cd_moeda_cond_venda: TLabel;
    dbedt_cd_moeda_cond_venda: TDBEdit;
    sbtn_tab_moeda_Cond_Venda: TSpeedButton;
    Label11: TLabel;
    lbl_vl_moeda_cond_venda: TLabel;
    dbedt_vl_moeda_cond_venda: TDBEdit;
    lbl_vl_real_cond_venda: TLabel;
    dbedt_vl_real_cond_venda: TDBEdit;
    lbl_local_cond_venda: TLabel;
    pnl_frete_seguro_intl: TPanel;
    lbl_frete_internacional: TLabel;
    dbedt_vl_frete_internacional: TDBEdit;
    lbl_seguro_internacional: TLabel;
    dbedt_vl_seguro_internacional: TDBEdit;
    tbsht_tributos: TTabSheet;
    pgctrl_tributos: TPageControl;
    tbsht_tributo_II: TTabSheet;
    tbsht_tributo_IPI: TTabSheet;
    tbsht_antidumping: TTabSheet;
    tbsht_calculos: TTabSheet;
    stxt_base_calculo_nao_gerada: TStaticText;
    Label25: TLabel;
    dbedt_vl_base_calculo: TDBEdit;
    gbox_reg_trib: TGroupBox;
    Label27: TLabel;
    dbedt_cd_fund_legal: TDBEdit;
    dbedt_desc_fund_leg: TDBEdit;
    btn_co_Fund_legal: TSpeedButton;
    gbox_acordo_tar: TGroupBox;
    Label28: TLabel;
    Label29: TLabel;
    dbedt_cd_acordo_aladi: TDBEdit;
    gbox_aliquotas: TGroupBox;
    Label30: TLabel;
    Label31: TLabel;
    dbedt_aliq_ad_valorem: TDBEdit;
    dbedt_aliq_acordo: TDBEdit;
    Label32: TLabel;
    dbedt_aliq_reduzida: TDBEdit;
    Label33: TLabel;
    dbedt_pc_reducao: TDBEdit;
    tbsht_tributo_TD19: TTabSheet;
    Bevel2: TBevel;
    GroupBox5: TGroupBox;
    Label34: TLabel;
    SpeedButton13: TSpeedButton;
    Label35: TLabel;
    SpeedButton15: TSpeedButton;
    dbedt_cd_reg_trib1: TDBEdit;
    dbedt_nm_reg_trib: TDBEdit;
    dbedt_cd_fund_legal1: TDBEdit;
    dbedt_nm_fund_legal: TDBEdit;
    Label36: TLabel;
    GroupBox6: TGroupBox;
    Label37: TLabel;
    dbedt_nr_identificacao: TDBEdit;
    Label38: TLabel;
    dbedt_vl_dolar_red_ii: TDBEdit;
    Label39: TLabel;
    dbedt_vl_ii_devido2: TDBEdit;
    Label40: TLabel;
    dbedt_pc_reducao_ii: TDBEdit;
    Label41: TLabel;
    dbedt_vl_ii_em_real: TDBEdit;
    Label42: TLabel;
    dbedt_vl_ii_a_recolher2: TDBEdit;
    dbcb_ipi_nao_tributavel: TDBCheckBox;
    bv_benef_fiscal_ipi: TBevel;
    Label43: TLabel;
    Label44: TLabel;
    bv_aliquotas_ipi: TBevel;
    gb_aliq_ad_valorem: TGroupBox;
    gb_aliq_unitaria: TGroupBox;
    Label45: TLabel;
    dbedt_pc_ipi_ad_val: TDBEdit;
    Label46: TLabel;
    dbedt_pc_ipi_reduzida: TDBEdit;
    Label47: TLabel;
    dbedt_nota_compl_tipi: TDBEdit;
    Label48: TLabel;
    dbedt_vl_unid_med: TDBEdit;
    Label49: TLabel;
    dbedt_nm_unid_medida: TDBEdit;
    Label50: TLabel;
    dbedt_qt_unidade: TDBEdit;
    Label51: TLabel;
    dbedt_capacidade_recip: TDBEdit;
    Label52: TLabel;
    Label53: TLabel;
    GroupBox9: TGroupBox;
    Label54: TLabel;
    Label55: TLabel;
    dbedt_vl_ad_valorem: TDBEdit;
    dbedt_vl_base_calc_advalorem: TDBEdit;
    GroupBox10: TGroupBox;
    Label57: TLabel;
    Label58: TLabel;
    Label59: TLabel;
    dbedt_vl_aliq_espec: TDBEdit;
    dbedt_desc_unid_aliq_espec: TDBEdit;
    dbedt_qt_unid_aliq_espec: TDBEdit;
    Bevel7: TBevel;
    StaticText5: TStaticText;
    gbII: TGroupBox;
    gbIPI: TGroupBox;
    gbAntidumping: TGroupBox;
    Label56: TLabel;
    dbedt_vl_ii_calculado: TDBEdit;
    Label60: TLabel;
    dbedt_vl_ii_reduzido: TDBEdit;
    Label61: TLabel;
    dbedt_vl_ii_devido: TDBEdit;
    Label62: TLabel;
    dbedt_vl_ii_a_recolher: TDBEdit;
    Label69: TLabel;
    dbedt_vl_ipi_devido: TDBEdit;
    Label70: TLabel;
    dbedt_vl_ipi_a_recolher: TDBEdit;
    dbedt_vl_ad_devido: TDBEdit;
    dbedt_vl_ad_a_recolher: TDBEdit;
    Label71: TLabel;
    Label72: TLabel;
    tbsht_cambio1: TTabSheet;
    gbox_cobertura_cambial: TGroupBox;
    rbtn_cambial_Ate180: TRadioButton;
    rbtn_cambial_De180_360: TRadioButton;
    rbtn_cambial_Acima360: TRadioButton;
    rbtn_cambial_Sem_Cobertura: TRadioButton;
    dbedt_cd_mot_sem_cobert: TDBEdit;
    btn_co_motivo_sem_cob: TSpeedButton;
    lbl_mot_sem_cobert: TLabel;
    gbox_pg_comissao: TGroupBox;
    dbedt_ag_pc_comissao: TDBEdit;
    Label74: TLabel;
    Label75: TLabel;
    dbedt_ag_identificacao: TDBEdit;
    Label76: TLabel;
    dbedt_ag_nr_banco: TDBEdit;
    Label77: TLabel;
    dbedt_ag_nr_agencia: TDBEdit;
    dblkpcbox_vinc_comp_vend: TDBLookupComboBox;
    grpbox_cond_mercadoria: TGroupBox;
    dbrg_reg_tributacao: TDBRadioGroup;
    pnl_ncm: TPanel;
    pnl_nbm: TPanel;
    stxt_classificacao: TStaticText;
    stxt_codigo: TStaticText;
    stxt_docto_vinculado: TStaticText;
    stxt_destaque_ncm: TStaticText;
    dbedt_cd_local_embarque2: TDBEdit;
    dbedt_nm_local_embarque2: TDBEdit;
    btn_local_embarque: TSpeedButton;
    lbl_expo_codigo: TLabel;
    dbedt_expo_codigo: TDBEdit;
    dbedt_expo_descricao: TDBEdit;
    btn_co_exportador: TSpeedButton;
    lbl_expo_nome: TLabel;
    dbedt_expo_nome: TDBEdit;
    lbl_expo_logradouro: TLabel;
    dbedt_expo_logradouro: TDBEdit;
    lbl_expo_numero: TLabel;
    dbedt_expo_numero: TDBEdit;
    lbl_expo_complemento: TLabel;
    dbedt_expo_complemento: TDBEdit;
    lbl_expo_cidade: TLabel;
    dbedt_expo_cidade: TDBEdit;
    lbl_expo_estado: TLabel;
    dbedt_expo_estado: TDBEdit;
    lbl_expo_pais_aquis: TLabel;
    dbedt_expo_cd_pais: TDBEdit;
    dbedt_expo_nm_pais: TDBEdit;
    sbtn_tab_pais2: TSpeedButton;
    lbl_nr_licenciamento: TLabel;
    dbedt_nr_licenciamento: TDBEdit;
    dbchkbox_in_multimodal: TDBCheckBox;
    dbedt_mot_sem_cobert: TDBEdit;
    dblkcbox_acordo_tarif: TDBLookupComboBox;
    StaticText2: TStaticText;
    dbedt_ex_ato_legal_acordo_tar: TDBEdit;
    dblkpcbox_tipo_ato_legal_acordo_tar: TDBLookupComboBox;
    dblkpcbox_orgao_ato_legal_acordo_tar: TDBLookupComboBox;
    dbedt_nr_ato_legal_acordo_tar: TDBEdit;
    dbedt_dt_ano_ato_legal_acordo_tar: TDBEdit;
    StaticText20: TStaticText;
    StaticText21: TStaticText;
    StaticText22: TStaticText;
    StaticText23: TStaticText;
    StaticText24: TStaticText;
    Bevel4: TBevel;
    StaticText3: TStaticText;
    StaticText25: TStaticText;
    StaticText26: TStaticText;
    StaticText27: TStaticText;
    StaticText28: TStaticText;
    StaticText29: TStaticText;
    dbedt_dt_ano_ato_legal_benef_ipi: TDBEdit;
    dbedt_nr_ato_legal_benef_ipi: TDBEdit;
    dblkpcbox_orgao_ato_legal_benef_ipi: TDBLookupComboBox;
    dblkpcbox_tipo_ato_legal_benef_ipi: TDBLookupComboBox;
    dbedt_ex_ato_legal_benef_ipi: TDBEdit;
    Bevel5: TBevel;
    StaticText4: TStaticText;
    StaticText30: TStaticText;
    StaticText31: TStaticText;
    StaticText32: TStaticText;
    StaticText33: TStaticText;
    StaticText34: TStaticText;
    dbedt_dt_ano_ato_legal_antidump: TDBEdit;
    dbedt_nr_ato_legal_antidump: TDBEdit;
    dblkpcbox_orgao_ato_legal_antidump: TDBLookupComboBox;
    dblkpcbox_tipo_ato_legal_antidump: TDBLookupComboBox;
    dbedt_ex_ato_legal_antidump: TDBEdit;
    Bevel10: TBevel;
    stxt_ato_legal_ncm: TStaticText;
    stxt_ex_ato_legal_ncm: TStaticText;
    stxt_tipo_ato_legal_ncm: TStaticText;
    stxt_orgao_ato_legal_ncm: TStaticText;
    stxt_nr_ato_legal_ncm: TStaticText;
    stxt_dt_ano_ato_legal_ncm: TStaticText;
    dbedt_dt_ano_ato_legal_ncm: TDBEdit;
    dbedt_nr_ato_legal_ncm: TDBEdit;
    dblkpcbox_orgao_ato_legal_ncm: TDBLookupComboBox;
    dblkpcbox_tipo_ato_legal_ncm: TDBLookupComboBox;
    dbedt_ex_ato_legal_ncm: TDBEdit;
    dbedt_ex_ato_legal_nbm: TDBEdit;
    dblkpcbox_tipo_ato_legal_nbm: TDBLookupComboBox;
    dblkpcbox_orgao_ato_legal_nbm: TDBLookupComboBox;
    dbedt_nr_ato_legal_nbm: TDBEdit;
    dbedt_dt_ano_ato_legal_nbm: TDBEdit;
    dbedt_nm_metodo_valoracao: TDBEdit;
    dblkcbox_tp_recipiente: TDBLookupComboBox;
    gbox_rof_imp_sem_cobert: TGroupBox;
    Label3: TLabel;
    dbedt_nr_rof: TDBEdit;
    gbox_pg_cambio_2: TGroupBox;
    Label78: TLabel;
    SpeedButton24: TSpeedButton;
    pgctrl_pg_cambio2: TPageControl;
    tbsht_pg_cambio_antec2: TTabSheet;
    tbsht_pg_cambio_avista2: TTabSheet;
    tbsht_pg_cambio_em2: TTabSheet;
    dbrgrp_parcelas2: TDBRadioGroup;
    Panel3: TPanel;
    ntbk_parcelas_2: TNotebook;
    Label79: TLabel;
    Label80: TLabel;
    Label81: TLabel;
    Label82: TLabel;
    dbedt_qt_parcelas2: TDBEdit;
    dbedt_qt_periodos2: TDBEdit;
    dbedt_vl_total_financ2: TDBEdit;
    rbtn_ind_per_diaria2: TRadioButton;
    rbtn_ind_per_mensal2: TRadioButton;
    dbedt_parc_var_cambio: TDBGrid;
    GroupBox17: TGroupBox;
    btn_co_taxa_juros_BACEN2: TSpeedButton;
    Label84: TLabel;
    Label85: TLabel;
    dbedt_cd_taxa_juros2: TDBEdit;
    dbedt_pc_taxa_juros2: TDBEdit;
    dbchkbox_in_taxa_juros2: TDBCheckBox;
    dbedt_cd_mod_pagto_2: TDBEdit;
    dbedt_mod_pagto2: TDBEdit;
    Bevel8: TBevel;
    Label110: TLabel;
    dbedt_vl_vinc_md_cambio_antec: TDBEdit;
    Bevel9: TBevel;
    Label111: TLabel;
    dbedt_vl_vinc_md_cambio_avista: TDBEdit;
    gbox_pg_cambio_1: TGroupBox;
    lbl_mod_pagto: TLabel;
    btn_co_mod_pagto: TSpeedButton;
    pgctrl_pg_cambio1: TPageControl;
    tbsht_pg_cambio_antec1: TTabSheet;
    dbg_contrato_cambio_antec: TDBGrid;
    btn_incluir_1: TBitBtn;
    btn_alterar_1: TBitBtn;
    tbsht_pg_cambio_avista1: TTabSheet;
    tbsht_pg_cambio_em1: TTabSheet;
    dbrgrp_parcelas1: TDBRadioGroup;
    Panel1: TPanel;
    GroupBox7: TGroupBox;
    btn_co_taxa_juros_BACEN: TSpeedButton;
    Label12: TLabel;
    Label13: TLabel;
    dbedt_cd_taxa_juros1: TDBEdit;
    dbedt_pc_taxa_juros1: TDBEdit;
    dbcbox_com_taxa_juros: TDBCheckBox;
    dbedt_cd_mod_pagto_1: TDBEdit;
    dbedt_mod_pagto_1: TDBEdit;
    btn_excluir_1: TBitBtn;
    dbg_contrato_cambio_av: TDBGrid;
    btn_incluir_2: TBitBtn;
    btn_alterar_2: TBitBtn;
    btn_excluir_2: TBitBtn;
    Label1: TLabel;
    dbedt_cd_reg_trib: TDBEdit;
    dbedt_desc_reg_trib: TDBEdit;
    btn_co_Reg_Trib: TSpeedButton;
    btn_capa_di: TSpeedButton;
    btn_itens_di: TSpeedButton;
    edt_nm_unid_med_est: TEdit;
    tbsht_mercadoria_nve: TTabSheet;
    dbedt_cd_nbm: TDBEdit;
    dbedt_cd_ncm_sh: TDBEdit;
    btn_co_incoterm: TSpeedButton;
    btn_co_met_valoracao: TSpeedButton;
    tbsht_pg_cambio_Sup: TTabSheet;
    Label5: TLabel;
    dbedt_vl_vinculado_cambio: TDBEdit;
    Bevel3: TBevel;
    Label14: TLabel;
    dbedt_nr_rof2: TDBEdit;
    lbl_inst_financ: TLabel;
    dbedt_cd_inst_financ: TDBEdit;
    dbedt_inst_financ: TDBEdit;
    btn_co_inst_financ: TSpeedButton;
    tbsht_tributo_ICMS: TTabSheet;
    GroupBox1: TGroupBox;
    btn_excluir: TSpeedButton;
    Label18: TLabel;
    dbedt_ag_vl: TDBEdit;
    btn_calculo: TSpeedButton;
    ntbk_parcelas_1: TNotebook;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    dbedt_qt_parcelas1: TDBEdit;
    dbedt_qt_periodos1: TDBEdit;
    dbedt_vl_total_financ1: TDBEdit;
    rbtn_ind_per_diaria1: TRadioButton;
    rbtn_ind_per_mensal1: TRadioButton;
    DBGrid10: TDBGrid;
    Label19: TLabel;
    dbedt_cd_tributacao_icms: TDBEdit;
    dbedt_nm_tributacao_icms: TDBEdit;
    btn_co_trib_icms: TSpeedButton;
    rbtn_material_usado: TRadioButton;
    rbtn_Bem_sob_encomenda: TRadioButton;
    SpeedButton2: TSpeedButton;
    lbl_mot_ad_temp: TLabel;
    dbedt_cd_mot_ad_temp: TDBEdit;
    dbedt_desc_mot_ad_temp: TDBEdit;
    btn_co_mot_ad_temp: TSpeedButton;
    Panel2: TPanel;
    Label16: TLabel;
    dbedt_pc_icms: TDBEdit;
    Label17: TLabel;
    dbedt_pc_reducao_icms: TDBEdit;
    dbedt_vl_icms_a_recolher: TDBEdit;
    Label15: TLabel;
    dbedt_vl_icms_devido: TDBEdit;
    Label6: TLabel;
    Panel4: TPanel;
    lbl_fund: TLabel;
    dbedt_cd_disp_legal: TDBEdit;
    dbedt_nm_disp_legal: TEdit;
    btn_co_disp_legal: TSpeedButton;
    Label20: TLabel;
    memo_tribut: TMemo;
    Label21: TLabel;
    edt_trat_tribut: TEdit;
    mi_excluir: TMenuItem;
    mi_capa_di: TMenuItem;
    mi_itens_di: TMenuItem;
    mi_calculo: TMenuItem;
    Label22: TLabel;
    dbedt_vl_despesas: TDBEdit;
    dbedt_nr_destaque_ncm: TDBEdit;
    StaticText1: TStaticText;
    lbl_numero: TLabel;
    dbedt_cd_numero_ato: TDBEdit;
    tbsht_ncm_pis_cofins: TTabSheet;
    dbchk_manual: TDBCheckBox;
    DBEdit6: TDBEdit;
    Label73: TLabel;
    Shape10: TShape;
    Shape11: TShape;
    dbedt_base_pis: TDBEdit;
    Label64: TLabel;
    dbedt_vl_pis: TDBEdit;
    Label65: TLabel;
    dbedt_vl_cofins: TDBEdit;
    Label66: TLabel;
    dbedt_reduc_base: TDBEdit;
    Label86: TLabel;
    Label87: TLabel;
    Bevel13: TBevel;
    dbmemo_pis_cofins: TDBMemo;
    Label68: TLabel;
    dbrdgr_reg_trib_pis_cofins: TDBRadioGroup;
    Label23: TLabel;
    lbl_nm_usuario: TLabel;
    Label2: TLabel;
    dbedt_nr_adicao: TDBEdit;
    dbedt_qt_adicoes: TDBEdit;
    DBNavigator1: TDBNavigator;
    Shape6: TShape;
    Shape4: TShape;
    lbl3: TLabel;
    shp3: TShape;
    bvl1: TBevel;
    dbedtCD_FUND_LEGAL_PISCOFINS: TDBEdit;
    edtFundLegalPisCofins: TEdit;
    btnFundLegal: TSpeedButton;
    lbl4: TLabel;
    lbl6: TLabel;
    Label63: TLabel;
    dbedtCFOP: TDBEdit;
    btn_co_cd_cfop: TSpeedButton;
    edtCFOP: TEdit;
    btn_trans_DI: TSpeedButton;
    pnlFundoPobreza: TPanel;
    dbchk_IN_FUNDO_POBREZA: TDBCheckBox;
    Label67: TLabel;
    edtICMS_Fundo_Pobreza: TEdit;
    pgcAliquotas_PIS_COFINS: TPageControl;
    tbsAliquota_PIS: TTabSheet;
    tbsAliquota_COFINS: TTabSheet;
    GroupBox2: TGroupBox;
    Label24: TLabel;
    dbedt_aliq_pis: TDBEdit;
    GroupBox3: TGroupBox;
    GroupBox4: TGroupBox;
    Label26: TLabel;
    dbedt_aliq_cofins: TDBEdit;
    dbedt_VL_ALIQUOTA_ESPECIFICA_PIS: TDBEdit;
    Label83: TLabel;
    Label88: TLabel;
    dbedt_QTD_UNID_ESPECIFICA_PIS: TDBEdit;
    Label89: TLabel;
    dbedt_CD_UNIDADE_MEDIDA_PIS: TDBEdit;
    btnUnidadeMedidaPIS: TSpeedButton;
    edtUnidadeMedidaPIS: TEdit;
    GroupBox8: TGroupBox;
    Label90: TLabel;
    Label91: TLabel;
    Label92: TLabel;
    btnUnidadeMedidaCOFINS: TSpeedButton;
    dbedt_VL_ALIQUOTA_ESPECIFICA_COFINS: TDBEdit;
    dbedt_QTD_UNID_ESPECIFICA_COFINS: TDBEdit;
    dbedt_CD_UNIDADE_MEDIDA_COFINS: TDBEdit;
    edtUnidadeMedidaCOFINS: TEdit;
    Label93: TLabel;
    dbedt_QT_MESES_ADM_TEMP: TDBEdit;
    dbchk_IN_SUSPENDE_II_RETIFIC: TDBCheckBox;
    dbchk_IN_SUSPENDE_IPI_RETIFIC: TDBCheckBox;
    dbchk_IN_SUSPENDE_PIS_COFINS_RETIFIC: TDBCheckBox;
    btn_Retificar: TSpeedButton;
    lblICMS_AFRMM: TLabel;
    dbedtICMS_AFRMM: TDBEdit;
    Label94: TLabel;
    dbedt_aliq_pis_reduzida: TDBEdit;
    dbedt_aliq_cofins_reduzida: TDBEdit;
    Label95: TLabel;
    Label4: TLabel;
    dbedt_cd_ncm_nve: TDBEdit;
    dbedt_nm_ncm_nve: TDBEdit;
    Label96: TLabel;
    dbedt_cd_nivel: TDBEdit;
    dbedt_nm_nivel: TDBEdit;
    btn_co_nivel: TSpeedButton;
    Label97: TLabel;
    dbedt_cd_atrib: TDBEdit;
    dbedt_nm_atrib: TDBEdit;
    btn_co_atrib: TSpeedButton;
    Label98: TLabel;
    dbedt_cd_espec: TDBEdit;
    dbedt_nm_especif: TDBEdit;
    btn_co_especif: TSpeedButton;
    Panel5: TPanel;
    DBGrid1: TDBGrid;
    Panel6: TPanel;
    btn_NVE_Incluir: TSpeedButton;
    btn_NVE_Salvar: TSpeedButton;
    btn_NVE_Cancelar: TSpeedButton;
    btn_NVE_Excluir: TSpeedButton;
    gbPIS: TGroupBox;
    Label99: TLabel;
    Label100: TLabel;
    dbedt_vl_pis_calculado: TDBEdit;
    dbedt_vl_pis2: TDBEdit;
    gbCOFINS: TGroupBox;
    Label101: TLabel;
    Label102: TLabel;
    dbedt_vl_cofins_calculado: TDBEdit;
    dbedt_vl_cofins2: TDBEdit;
    Label103: TLabel;
    dbedtVL_MULTA_II: TDBEdit;
    Label104: TLabel;
    dbedtVL_JUROS_II: TDBEdit;
    Bevel1: TBevel;
    Label105: TLabel;
    dbedtVL_MULTA_IPI: TDBEdit;
    Label106: TLabel;
    dbedtVL_JUROS_IPI: TDBEdit;
    Label107: TLabel;
    dbedtVL_MULTA_PIS: TDBEdit;
    Label108: TLabel;
    dbedtVL_JUROS_PIS: TDBEdit;
    Label109: TLabel;
    dbedtVL_MULTA_COFINS: TDBEdit;
    Label112: TLabel;
    dbedtVL_JUROS_COFINS: TDBEdit;
    Bevel6: TBevel;
    Bevel11: TBevel;
    Bevel12: TBevel;
    dbcb_in_fma: TcxDBCheckBox;
    pnlPagamentoDarf: TPanel;
    Label113: TLabel;
    cxdbedtDT_PAGAMENTO_DARF: TcxDBDateEdit;
    tbsPgmtoAFRMM: TTabSheet;
    dbrgCD_TP_AFRMM: TDBRadioGroup;
    Label114: TLabel;
    dbedtTP_SUSPENCAO: TDBEdit;
    dbedtCD_TP_SUSPENSAO: TDBEdit;
    dbedtTP_ISENCAO: TDBEdit;
    dbedtCD_TP_ISENCAO: TDBEdit;
    Label115: TLabel;
    btnTPIsensao: TSpeedButton;
    btnTPSuspensao: TSpeedButton;
    Label116: TLabel;
    dbedtNR_PARCELA: TDBEdit;
    Label117: TLabel;
    dbedtDT_VENCIMENTO_SUSPENSAO: TDBDateEdit;
    dbedNR_ATO_CONCESSORIO: TDBEdit;
    Label118: TLabel;
    edtItemDireto: TEdit;
    CadMercadoria1: TMenuItem;
    Label119: TLabel;
    dbedt_cd_fund_legal_ii_duimp: TDBEdit;
    dbedt_desc_fund_leg_ii_duimp: TDBEdit;
    btn_co_Fund_legal_ii_duimp: TSpeedButton;
    Label120: TLabel;
    btn_co_Fund_legal_ipi_duimp: TSpeedButton;
    dbedt_cd_fund_legal_ipi_duimp: TDBEdit;
    dbedt_desc_fund_leg_ipi_duimp: TDBEdit;
    Label121: TLabel;
    dbedt_cd_fund_legal_piscofins_duimp: TDBEdit;
    dbedt_desc_fund_leg_piscofins_duimp: TDBEdit;
    btn_co_Fund_legal_piscofins_duimp: TSpeedButton;
    btnEnvioDuimp: TSpeedButton;
    tbsht_ibs_cbs: TTabSheet;
    GroupBox11: TGroupBox;
    lbl_valor_is: TLabel;
    dbedt_valor_is: TDBEdit;
    lbl_valor_CIDE: TLabel;
    dbedt_valor_CIDE: TDBEdit;
    lbl_valor_dir_comp: TLabel;
    dbedt_valor_dir_comp: TDBEdit;
    lbl_valor_med_salv: TLabel;
    dbedt_valor_med_salv: TDBEdit;
    dbedt_valor_outros_trib: TDBEdit;
    lbl_valor_outros_trib: TLabel;
    GroupBox12: TGroupBox;
    lbl_aliq_ibs_uf: TLabel;
    lbl_aliq_ibs_municipio: TLabel;
    lbl_aliq_cbs: TLabel;
    dbedt_aliq_ibs_uf: TDBEdit;
    dbedt_aliq_ibs_municipio: TDBEdit;
    dbedt_aliq_cbs: TDBEdit;
    GroupBox13: TGroupBox;
    lbl_base_ibs_cbs: TLabel;
    lbl_valor_ibs_municipio: TLabel;
    lbl_valor_ibs_uf: TLabel;
    lbl_valor_cbs: TLabel;
    dbedt_base_ibs_cbs: TDBEdit;
    dbedt_valor_ibs_municipio: TDBEdit;
    dbedt_valor_ibs_uf: TDBEdit;
    dbedt_valor_cbs: TDBEdit;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btn_sairClick(Sender: TObject);
    procedure btn_salvarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure pgctrl_adicaoChange(Sender: TObject);
    procedure dbrgrp_fabr_expoChange(Sender: TObject);
    procedure dbedt_ex_ato_legal_ncmExit(Sender: TObject);
    procedure dbedt_ex_ato_legal_nbmExit(Sender: TObject);
    procedure rbtn_ind_per_diaria1Click(Sender: TObject);
    procedure rbtn_ind_per_mensal1Click(Sender: TObject);
    procedure dbedt_qt_parcelas1Change(Sender: TObject);
    procedure dbedt_qt_parcelas2Change(Sender: TObject);
    procedure rbtn_ind_per_diaria2Click(Sender: TObject);
    procedure rbtn_ind_per_mensal2Click(Sender: TObject);
    procedure dbcb_ipi_nao_tributavelClick(Sender: TObject);
    procedure rbtn_cambial_Ate180Click(Sender: TObject);
    procedure dbedt_cd_mot_sem_cobertExit(Sender: TObject);
    procedure btn_excluir_1Click(Sender: TObject);
    procedure dbrgrp_parcelas1Change(Sender: TObject);
    procedure dbrgrp_parcelas2Change(Sender: TObject);
    procedure btn_alterar_1Click(Sender: TObject);
    procedure btn_incluir_1Click(Sender: TObject);
    procedure btn_incluir_2Click(Sender: TObject);
    procedure btn_alterar_2Click(Sender: TObject);
    procedure btn_excluir_2Click(Sender: TObject);
    procedure btn_capa_diClick(Sender: TObject);
    procedure btn_itens_diClick(Sender: TObject);
    procedure btn_cancelarClick(Sender: TObject);
    procedure sbtn_tab_pais1Click(Sender: TObject);
    procedure sbtn_tab_pais2Click(Sender: TObject);
    procedure sbtn_tab_pais3Click(Sender: TObject);
    procedure sbtn_tab_pais4Click(Sender: TObject);
    procedure btn_co_exportadorClick(Sender: TObject);
    procedure btn_co_fabricanteClick(Sender: TObject);
    procedure sbtn_tab_naladi_shClick(Sender: TObject);
    procedure sbtn_tab_naladi_nccaClick(Sender: TObject);
    procedure sbtn_tab_moeda_Cond_VendaClick(Sender: TObject);
    procedure btn_co_acordo_aladiClick(Sender: TObject);
    procedure btn_co_motivo_sem_cobClick(Sender: TObject);
    procedure btn_co_taxa_juros_BACENClick(Sender: TObject);
    procedure btn_co_mod_pagtoClick(Sender: TObject);
    procedure btn_local_embarqueClick(Sender: TObject);
    procedure dbedt_cd_fund_legalExit(Sender: TObject);
    procedure dbedt_cd_urf_entradaExit(Sender: TObject);
    procedure btn_co_incotermClick(Sender: TObject);
    procedure btn_co_Reg_TribClick(Sender: TObject);
    procedure btn_co_met_valoracaoClick(Sender: TObject);
    procedure DBNavigator1Click(Sender: TObject; Button: TNavigateBtn);
    procedure FormCreate(Sender: TObject);
    procedure grpbox_cond_mercadoriaClick(Sender: TObject);
    procedure rbtn_material_usadoClick(Sender: TObject);
    procedure dbedt_cd_inst_financExit(Sender: TObject);
    procedure btn_co_inst_financClick(Sender: TObject);
    procedure btn_excluirClick(Sender: TObject);
    procedure dbedt_ag_identificacaoExit(Sender: TObject);
    procedure dblkcbox_acordo_tarifExit(Sender: TObject);
    procedure dbedt_cd_incotermExit(Sender: TObject);
    procedure dbedt_aliq_reduzidaExit(Sender: TObject);
    procedure dbedt_pc_reducaoExit(Sender: TObject);
    procedure btn_calculoClick(Sender: TObject);
    procedure dbedt_cd_local_embarque2Exit(Sender: TObject);
    procedure dbedt_nr_adicaoChange(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure btn_co_trib_icmsClick(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure dbedt_cd_pais_origem1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure dbedt_expo_cd_paisExit(Sender: TObject);
    procedure dbedt_fabr_cd_paisExit(Sender: TObject);
    procedure dbedt_expo_codigoExit(Sender: TObject);
    procedure dbedt_fabr_codigoExit(Sender: TObject);
    procedure dbedt_ex_ato_legal_acordo_tarExit(Sender: TObject);
    procedure dbedt_ex_ato_legal_benef_ipiExit(Sender: TObject);
    procedure dbedt_ex_ato_legal_antidumpExit(Sender: TObject);
    function  AtzTaxaCambialAdicao( Moeda : String ): Double;
    procedure GuardaTaxaCambialAdicao;
    procedure dbedt_cd_moeda_cond_vendaExit(Sender: TObject);
    procedure dbedt_cd_moeda_cond_vendaEnter(Sender: TObject);
    procedure btn_co_mot_ad_tempClick(Sender: TObject);
    procedure btn_co_disp_legalClick(Sender: TObject);
    procedure btn_co_Fund_legalClick(Sender: TObject);
    procedure dbedt_cd_disp_legalExit(Sender: TObject);
    procedure dbedt_cd_tributacao_icmsExit(Sender: TObject);
    procedure dbedt_cd_tributacao_icmsChange(Sender: TObject);
    procedure dbedt_cd_ncm_shChange(Sender: TObject);
    procedure dbedt_cd_disp_legalChange(Sender: TObject);
    procedure dbedt_cd_reg_tribChange(Sender: TObject);
    procedure dbedt_cd_metodo_valoracaoExit(Sender: TObject);
    procedure dbedt_aliq_ad_valoremExit(Sender: TObject);
    procedure dbedt_pc_ipi_ad_valExit(Sender: TObject);
    procedure dbedt_aliq_pisEnter(Sender: TObject);
    procedure dbedt_aliq_pisExit(Sender: TObject);
    procedure dbedt_aliq_cofinsEnter(Sender: TObject);
    procedure dbedt_aliq_cofinsExit(Sender: TObject);
    procedure dbrdgr_reg_trib_pis_cofinsChange(Sender: TObject);
    procedure dbedt_cd_reg_tribExit(Sender: TObject);
    procedure btnFundLegalClick(Sender: TObject);
    procedure btn_co_cd_cfopClick(Sender: TObject);
    procedure dbedtCFOPChange(Sender: TObject);
    procedure btn_trans_DIClick(Sender: TObject);
    procedure dbchk_IN_FUNDO_POBREZAClick(Sender: TObject);
    procedure tbsht_ncm_pis_cofinsShow(Sender: TObject);
    procedure dbedt_CD_UNIDADE_MEDIDA_PISChange(Sender: TObject);
    procedure dbedt_CD_UNIDADE_MEDIDA_PISKeyPress(Sender: TObject;
      var Key: Char);
    procedure dbedt_CD_UNIDADE_MEDIDA_COFINSChange(Sender: TObject);
    procedure dbedt_CD_UNIDADE_MEDIDA_COFINSExit(Sender: TObject);
    procedure btnUnidadeMedidaPISClick(Sender: TObject);
    procedure btnUnidadeMedidaCOFINSClick(Sender: TObject);
    procedure dbedt_VL_ALIQUOTA_ESPECIFICA_PISExit(Sender: TObject);
    procedure dbedt_QTD_UNID_ESPECIFICA_PISExit(Sender: TObject);
    procedure dbedt_VL_ALIQUOTA_ESPECIFICA_COFINSExit(Sender: TObject);
    procedure dbedt_QTD_UNID_ESPECIFICA_COFINSExit(Sender: TObject);
    procedure dbedt_cd_fund_legalChange(Sender: TObject);
    procedure dbedt_QT_MESES_ADM_TEMPKeyPress(Sender: TObject;
      var Key: Char);
    procedure dbrg_reg_tributacaoChange(Sender: TObject);
    procedure btn_RetificarClick(Sender: TObject);
    procedure tbsht_tributo_ICMSShow(Sender: TObject);
    procedure btn_co_nivelClick(Sender: TObject);
    procedure btn_co_atribClick(Sender: TObject);
    procedure btn_co_especifClick(Sender: TObject);
    procedure btn_NVE_IncluirClick(Sender: TObject);
    procedure btn_NVE_SalvarClick(Sender: TObject);
    procedure btn_NVE_CancelarClick(Sender: TObject);
    procedure btn_NVE_ExcluirClick(Sender: TObject);
    procedure btnTPSuspensaoClick(Sender: TObject);
    procedure btnTPIsensaoClick(Sender: TObject);
    procedure dbrgCD_TP_AFRMMChange(Sender: TObject);
    procedure dblkcbox_acordo_tarifClick(Sender: TObject);
    procedure pgctrl_adicaoChanging(Sender: TObject;
      var AllowChange: Boolean);
    procedure edtItemDiretoKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtItemDiretoKeyPress(Sender: TObject; var Key: Char);
    procedure edtItemDiretoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure CadMercadoria1Click(Sender: TObject);
    procedure btn_co_Fund_legal_ii_duimpClick(Sender: TObject);
    procedure btn_co_Fund_legal_ipi_duimpClick(Sender: TObject);
    procedure btn_co_Fund_legal_piscofins_duimpClick(Sender: TObject);
    procedure btnEnvioDuimpClick(Sender: TObject);
  private
    procedure ValidaDispositivo;
    procedure AtualizaCheckBoxSuspensao;
    procedure ValidaVisibilidadeAbaMercante;
    procedure AbrirCadMercadoria;
    procedure FecharCadMercadoria;
  public
    nr_adicao : string[3];
    in_DI_Registrada, in_di_abrindo, in_change_adicao : Boolean;
    i_Tipo_Declaracao : Integer;
    repassa_campos_classif, vDispositivoIlegal : Boolean;
    fAliq_cofins, fAliq_pis : double;
    aMoedas : array [1..4] of String;
    aTaxas  : array [1..4] of Double;
    str_cd_moeda_mle : String[3];
    procedure AbreTabelas;
    procedure AbreGeral;
    procedure FechaTabelas;
    procedure FechaGeral;
    procedure SalvaDadosNaoGravados;
    procedure Consulta_On_line( cNomeTabela : String; fcampo : TStringField; cCaption : String; nCodigo : Integer  );
    procedure TrocaNullToZero_Ad;
    procedure TrocaNullToZero_II;
    procedure TrocaNullToZero_IPI;
    procedure TrocaNullToZero_AntiDump;
    procedure AtoVinculadoAcordoTarif;
    procedure Controla_Tela_Tributos;
    procedure Tributo_ICMS;
    procedure AtualizaTelaICMSRJ;
    function Consiste: Boolean;
  end;

var
  frm_DI_adicao: Tfrm_DI_adicao;

implementation

uses GSMLIB,  PGDI019, PGSM096, PGDI003, PGSM014, PGSM103, PGSM148, PGDI011,
     PGDI008, PGDI009, PGGP017, PGGP001, PGSM048, ConsOnLineEx, PGDI018,
  PGDI001, PGDI038, PGDI039, uRetificaDI_Adm_Temp, PGDI017, PGSM117;

{$R *.DFM}
procedure Tfrm_DI_adicao.AbreGeral;
begin
  with datm_DI_Adicao do
  begin
    {Genéricas}
    if in_DI_Registrada then
    begin
      qry_di_.RequestLive        := False;
      qry_adicao_.CachedUpdates  := False;
    end;

    qry_di_.Close;
    qry_di_.ParamByName('NR_PROCESSO').AsString := str_nr_processo;
    qry_di_.Prepare;
    qry_di_.Open;
//    if Not (qry_di_.Locate('NR_PROCESSO', str_nr_processo, [loCaseInsensitive ] ) ) then
    if qry_di_.IsEmpty then
    begin
      frm_DI_adicao.SetFocus;
      frm_DI_adicao.Close;
      Exit;
    end;

    qry_adicao_.Close;
    qry_adicao_.Prepare;
    qry_adicao_.ParamByName('NR_PROCESSO').AsString := str_nr_processo;
    qry_adicao_.Open;

    if Not ( qry_adicao_.Locate('NR_PROCESSO;NR_ADICAO', VarArrayOf ([str_nr_processo, nr_adicao]), [loCaseInsensitive]) ) then
    begin
      frm_DI_adicao.SetFocus;
      frm_DI_adicao.Close;
      Exit;
    end;

    qry_itens_.Close;
    qry_itens_.Prepare;
    qry_itens_.Open;

    AbreTabelas;
  end;
end;

procedure Tfrm_DI_adicao.FechaGeral;
begin
  FechaTabelas;
  {Genéricas}
  datm_DI_Adicao.qry_itens_.Close;
  datm_DI_Adicao.qry_adicao_.Close;
  datm_DI_Adicao.qry_di_.Close;

end;

procedure Tfrm_DI_adicao.AbreTabelas;
begin
  {Fornecedor}
  if ( frm_DI_adicao.pgctrl_adicao.ActivePage = tbsht_fornecedor_fabricante ) then
  begin
    if in_DI_Registrada then
    begin
      datm_DI_Adicao.tbl_empresa_est_.Close;
      datm_DI_Adicao.tbl_tp_vinc_expo_impo_.Close;

      datm_DI_Adicao.tbl_empresa_est_.ReadOnly       := True;
      datm_DI_Adicao.tbl_tp_vinc_expo_impo_.ReadOnly := True;
    end;
    datm_DI_Adicao.tbl_empresa_est_.Open;
    datm_DI_Adicao.tbl_tp_vinc_expo_impo_.Open;
  end;

  {Mercadoria}
  if ( frm_DI_adicao.pgctrl_adicao.ActivePage = tbsht_mercadoria ) then
  begin
    {Mercadoria Basico}

    if ( frm_DI_adicao.pgctrl_mercadorias.ActivePage = tbsht_mercadoria_basica ) then
    begin
      datm_DI_Adicao.qry_ncm_.Close;
      if in_DI_Registrada then
      begin
        datm_DI_Adicao.tbl_ad_docto_vinc_.Close;
        datm_DI_Adicao.tbl_unid_med_.Close;
        datm_DI_Adicao.tbl_tp_ato_legal_.Close;
        datm_DI_Adicao.tbl_orgao_emissor_.Close;
        datm_DI_Adicao.tbl_ad_destaque_ncm_.Close;
        datm_DI_Adicao.tbl_ad_ato_leg_ncm_.Close;
        datm_DI_Adicao.tbl_ad_ato_legal_nbm_.Close;

        datm_DI_Adicao.tbl_ad_docto_vinc_.ReadOnly    := True;
        datm_DI_Adicao.tbl_unid_med_.ReadOnly         := True;
        datm_DI_Adicao.tbl_tp_ato_legal_.ReadOnly     := True;
        datm_DI_Adicao.tbl_orgao_emissor_.ReadOnly    := True;
        datm_DI_Adicao.tbl_ad_destaque_ncm_.ReadOnly  := True;
        datm_DI_Adicao.tbl_ad_ato_leg_ncm_.ReadOnly   := True;
        datm_DI_Adicao.tbl_ad_ato_legal_nbm_.ReadOnly := True;

        datm_DI_Adicao.qry_ncm_.RequestLive           := False;
      end;
      datm_DI_Adicao.qry_ncm_.ParamByName('CODIGO').AsString := Copy(datm_DI_Adicao.qry_adicao_CD_NCM_SH.AsString,1,8);
      datm_DI_Adicao.qry_ncm_.Prepare;
      datm_DI_Adicao.qry_ncm_.Open;

      datm_DI_Adicao.tbl_ad_docto_vinc_.Open;
      datm_DI_Adicao.tbl_unid_med_.Open;
      datm_DI_Adicao.tbl_tp_ato_legal_.Open;
      datm_DI_Adicao.tbl_orgao_emissor_.Open;
      datm_DI_Adicao.tbl_ad_destaque_ncm_.Open;
      datm_DI_Adicao.tbl_ad_ato_leg_ncm_.Open;
      datm_DI_Adicao.tbl_ad_ato_legal_nbm_.Open;
    end;

    {Mercadoria NVE}
    if pgctrl_mercadorias.ActivePage = tbsht_mercadoria_nve then
    begin
      datm_DI_Adicao.qry_nve_.Close;
      datm_DI_Adicao.qry_ncm_.Close;
      if in_DI_Registrada then
      begin
        datm_DI_Adicao.qry_abrangencia_nve_.Close;

        datm_DI_Adicao.qry_nve_.RequestLive          := False;
        datm_DI_Adicao.qry_ncm_.RequestLive          := False;
      end;
      datm_DI_Adicao.qry_nve_.ParamByName('NR_PROCESSO').AsString := str_nr_processo;
      datm_DI_Adicao.qry_nve_.ParamByName('NR_ADICAO').AsString   := datm_DI_Adicao.qry_adicao_NR_ADICAO.AsString;
      datm_DI_Adicao.qry_nve_.Prepare;
      datm_DI_Adicao.qry_nve_.Open;
      {if datm_DI_Adicao.qry_nve_.RecordCount > 0  then
      begin
        btn_alterar_item_numerario.Enabled := True;
        btn_excluir_item_numerario.Enabled := True;
      end
      else
      begin
        btn_alterar_item_numerario.Enabled := False;
        btn_excluir_item_numerario.Enabled := False;
      end;}
      datm_DI_Adicao.qry_ncm_.ParamByName('CODIGO').AsString := Copy(datm_DI_Adicao.qry_adicao_CD_NCM_SH.AsString,1,8);
      datm_DI_Adicao.qry_ncm_.Prepare;
      datm_DI_Adicao.qry_ncm_.Open;

      datm_DI_Adicao.qry_abrangencia_nve_.Open;
    end;
  end;

  {Carga}
  if pgctrl_adicao.ActivePage = tbsht_carga then
  begin
    datm_DI_Adicao.qry_urf_entrada_.Close;
    if in_DI_Registrada then
    begin
      datm_DI_Adicao.tbl_via_transporte_.Close;

      datm_DI_Adicao.tbl_via_transporte_.ReadOnly := True;

      datm_DI_Adicao.qry_urf_entrada_.RequestLive := False;
    end;
    datm_DI_Adicao.qry_urf_entrada_.ParamByName('CODIGO').AsString := datm_DI_Adicao.qry_adicao_CD_FUND_LEG_REGIME.AsString;
    datm_DI_Adicao.qry_urf_entrada_.Prepare;
    datm_DI_Adicao.qry_urf_entrada_.Open;

    datm_DI_Adicao.tbl_via_transporte_.Open;
  end;

  {Valor Aduaneiro}
  if pgctrl_adicao.ActivePage = tbsht_valor_aduaneiro then
  begin
    datm_DI_Adicao.qry_assoc_acresc_.Close;
    datm_DI_Adicao.qry_assoc_ded_.Close;
    if in_DI_Registrada then
    begin
      datm_DI_Adicao.tbl_taxa_cambio_.Close;
      datm_DI_Adicao.tbl_ad_acrescimos_.Close;
      datm_DI_Adicao.tbl_ad_deducoes_.Close;
      datm_DI_Adicao.tbl_incoterms_.Close;
      datm_DI_Adicao.tbl_local_embarque_.Close;

      datm_DI_Adicao.tbl_taxa_cambio_.ReadOnly     := True;
      datm_DI_Adicao.tbl_ad_acrescimos_.ReadOnly   := True;
      datm_DI_Adicao.tbl_ad_deducoes_.ReadOnly     := True;
      datm_DI_Adicao.tbl_incoterms_.ReadOnly       := True;
      datm_DI_Adicao.tbl_local_embarque_.ReadOnly  := True;

      datm_DI_Adicao.qry_assoc_acresc_.RequestLive := False;
      datm_DI_Adicao.qry_assoc_ded_.RequestLive    := False;
    end;
    datm_DI_Adicao.qry_assoc_acresc_.ParamByName('COD_INCOTERMS').AsString := datm_DI_Adicao.qry_adicao_CD_INCOTERMS_VENDA.AsString;
    datm_DI_Adicao.qry_assoc_acresc_.Prepare;
    datm_DI_Adicao.qry_assoc_acresc_.Open;

    datm_DI_Adicao.qry_assoc_ded_.ParamByName('COD_INCOTERMS').AsString := datm_DI_Adicao.qry_adicao_CD_INCOTERMS_VENDA.AsString;
    datm_DI_Adicao.qry_assoc_ded_.Prepare;
    datm_DI_Adicao.qry_assoc_ded_.Open;

    datm_DI_Adicao.tbl_taxa_cambio_.Open;
    datm_DI_Adicao.tbl_ad_acrescimos_.Open;
    datm_DI_Adicao.tbl_ad_deducoes_.Open;
    datm_DI_Adicao.tbl_incoterms_.Open;
    datm_DI_Adicao.tbl_local_embarque_.Open;
  end;

  {Tributos}
  if pgctrl_adicao.ActivePage = tbsht_tributos then
  begin
    datm_DI_Adicao.qry_ad_ii_.Close;
    datm_DI_Adicao.qry_ad_ipi_.Close;
    datm_DI_Adicao.qry_ad_antidump_.Close;
    datm_DI_Adicao.qry_fund_leg_.Close;
    datm_DI_Adicao.qry_disp_legal_.Close;
    datm_DI_Adicao.qry_trat_tribut_.Close;

    if in_DI_Registrada then
    begin
      datm_DI_Adicao.tbl_acordo_tarif_.Close;
      datm_DI_Adicao.tbl_tp_ato_legal_.Close;
      datm_DI_Adicao.tbl_orgao_emissor_.Close;
      datm_DI_Adicao.tbl_ad_ato_legal_acordo_tar_.Close;
      datm_DI_Adicao.tbl_ad_ato_legal_benef_ipi_.Close;
      datm_DI_Adicao.tbl_ad_ato_legal_antidump_.Close;
      datm_DI_Adicao.tbl_tp_recipiente_.Close;

      datm_DI_Adicao.tbl_acordo_tarif_.ReadOnly            := True;
      datm_DI_Adicao.tbl_tp_ato_legal_.ReadOnly            := True;
      datm_DI_Adicao.tbl_orgao_emissor_.ReadOnly           := True;
      datm_DI_Adicao.tbl_ad_ato_legal_acordo_tar_.ReadOnly := True;

      datm_DI_Adicao.tbl_ad_ato_legal_benef_ipi_.ReadOnly  := True;
      datm_DI_Adicao.qry_ad_ii_.RequestLive                := False;
      datm_DI_Adicao.qry_ad_ipi_.RequestLive               := False;
      datm_DI_Adicao.tbl_ad_ato_legal_antidump_.ReadOnly   := True;
      datm_DI_Adicao.qry_ad_antidump_.RequestLive          := False;
      datm_DI_Adicao.tbl_tp_recipiente_.ReadOnly           := True;

      datm_DI_Adicao.qry_fund_leg_.RequestLive             := False;
    end;
    datm_DI_Adicao.qry_fund_leg_.ParamByName('CODIGO').AsString := datm_DI_Adicao.qry_adicao_CD_FUND_LEG_REGIME.AsString;
    datm_DI_Adicao.qry_fund_leg_.Prepare;
    datm_DI_Adicao.qry_fund_leg_.Open;

    datm_DI_Adicao.qry_disp_legal_.Open;
    datm_DI_Adicao.qry_trat_tribut_.Open;

    datm_DI_Adicao.tbl_acordo_tarif_.Open;
    datm_DI_Adicao.tbl_tp_ato_legal_.Open;
    datm_DI_Adicao.tbl_orgao_emissor_.Open;
    datm_DI_Adicao.tbl_ad_ato_legal_acordo_tar_.Open;

    datm_DI_Adicao.qry_ad_ii_.Prepare;
    datm_DI_Adicao.qry_ad_ii_.Open;
    datm_DI_Adicao.tbl_ad_ato_legal_benef_ipi_.Open;
    datm_DI_Adicao.qry_ad_ipi_.Prepare;
    datm_DI_Adicao.qry_ad_ipi_.Open;
    datm_DI_Adicao.tbl_ad_ato_legal_antidump_.Open;
    datm_DI_Adicao.qry_ad_antidump_.Prepare;
    datm_DI_Adicao.qry_ad_antidump_.Open;

    datm_DI_Adicao.tbl_tp_recipiente_.Open;
  end;

  {Tributos - Tipo 19}
  if pgctrl_adicao.ActivePage = tbsht_tributo_TD19 then
  begin
    datm_DI_Adicao.qry_ad_ii_.Close;
    if in_DI_Registrada then
    begin
      datm_DI_Adicao.qry_ad_ii_.RequestLive                  := False;
    end;
    datm_DI_Adicao.qry_ad_ii_.Prepare;
    datm_DI_Adicao.qry_ad_ii_.Open;
  end;

  {Câmbio}
  if pgctrl_adicao.ActivePage = tbsht_cambio1 then
  begin
    datm_DI_Adicao.qry_mot_sem_cobertura_.Close;
    datm_DI_Adicao.qry_mod_pagto_.Close;
    datm_DI_Adicao.qry_inst_financ_.Close;
    datm_DI_Adicao.qry_ad_cambio_pg_antec_.Close;
    datm_DI_Adicao.qry_ad_cambio_pg_avista_.Close;
    if in_DI_Registrada then
    begin
      datm_DI_Adicao.tbl_ad_cambio_parc_var_.ReadOnly     := True;

      datm_DI_Adicao.qry_mot_sem_cobertura_.RequestLive   := False;
      datm_DI_Adicao.qry_mod_pagto_.RequestLive           := False;
      datm_DI_Adicao.qry_inst_financ_.RequestLive         := False;
      datm_DI_Adicao.qry_ad_cambio_pg_antec_.RequestLive  := False;
      datm_DI_Adicao.qry_ad_cambio_pg_avista_.RequestLive := False;
    end;
    datm_DI_Adicao.qry_mot_sem_cobertura_.ParamByName('CODIGO').AsString := datm_DI_Adicao.qry_adicao_CD_MOTIVO_SEM_COB.AsString;
    datm_DI_Adicao.qry_mot_sem_cobertura_.Prepare;
    datm_DI_Adicao.qry_mot_sem_cobertura_.Open;

    datm_DI_Adicao.qry_mod_pagto_.ParamByName('CODIGO').AsString := datm_DI_Adicao.qry_adicao_CD_MODALIDADE_PGTO.AsString;
    datm_DI_Adicao.qry_mod_pagto_.Prepare;
    datm_DI_Adicao.qry_mod_pagto_.Open;

    datm_DI_Adicao.qry_inst_financ_.ParamByName('CODIGO').AsString := datm_DI_Adicao.qry_adicao_CD_ORGAO_FIN_INTER.AsString;
    datm_DI_Adicao.qry_inst_financ_.Prepare;
    datm_DI_Adicao.qry_inst_financ_.Open;

    datm_DI_Adicao.qry_ad_cambio_pg_antec_.Prepare;
    datm_DI_Adicao.qry_ad_cambio_pg_antec_.Open;

    datm_DI_Adicao.qry_ad_cambio_pg_avista_.Prepare;
    datm_DI_Adicao.qry_ad_cambio_pg_avista_.Open;

    datm_DI_Adicao.tbl_ad_cambio_parc_var_.Open;
  end;
end;

procedure Tfrm_DI_adicao.FechaTabelas;
begin
  with datm_DI_Adicao do
  begin
    {Fornecedor}
    if tbl_empresa_est_.Active             then datm_DI_Adicao.tbl_empresa_est_.Close;
    if tbl_tp_vinc_expo_impo_.Active       then datm_DI_Adicao.tbl_tp_vinc_expo_impo_.Close;

    {Mercadoria}
      {Mercadoria Basico}
      if tbl_ad_docto_vinc_.Active         then tbl_ad_docto_vinc_.Close;
      if tbl_unid_med_.Active              then tbl_unid_med_.Close;
      if tbl_tp_ato_legal_.Active          then tbl_tp_ato_legal_.Close;
      if tbl_orgao_emissor_.Active         then tbl_orgao_emissor_.Close;
      if tbl_ad_destaque_ncm_.Active       then tbl_ad_destaque_ncm_.Close;
      if tbl_ad_ato_leg_ncm_.Active        then tbl_ad_ato_leg_ncm_.Close;
      if tbl_ad_ato_legal_nbm_.Active      then tbl_ad_ato_legal_nbm_.Close;

      if qry_ncm_.Active                   then qry_ncm_.Close;

      {Mercadoria NVE}
      if qry_nve_.Active                   then qry_nve_.Close;
      if qry_abrangencia_nve_.Active       then qry_abrangencia_nve_.Open;

    {Carga}
    if tbl_via_transporte_.Active          then tbl_via_transporte_.Close;
    if qry_urf_entrada_.Active             then qry_urf_entrada_.Close;

    {Valor Aduaneiro}
    if tbl_taxa_cambio_.Active             then tbl_taxa_cambio_.Close;
    if tbl_ad_acrescimos_.Active           then tbl_ad_acrescimos_.Close;
    if tbl_ad_deducoes_.Active             then tbl_ad_deducoes_.Close;
    if tbl_incoterms_.Active               then tbl_incoterms_.Close;
    if tbl_local_embarque_.Active          then tbl_local_embarque_.Close;
    if qry_assoc_acresc_.Active            then qry_assoc_acresc_.Close;
    if qry_assoc_ded_.Active               then qry_assoc_ded_.Close;

    {Tributos}
    if tbl_acordo_tarif_.Active            then tbl_acordo_tarif_.Close;
    if tbl_tp_ato_legal_.Active            then tbl_tp_ato_legal_.Close;
    if tbl_orgao_emissor_.Active           then tbl_orgao_emissor_.Close;
    if tbl_ad_ato_legal_acordo_tar_.Active then tbl_ad_ato_legal_acordo_tar_.Close;
    if qry_ad_ii_.Active                   then qry_ad_ii_.Close;
    if tbl_ad_ato_legal_benef_ipi_.Active  then tbl_ad_ato_legal_benef_ipi_.Close;
    if qry_ad_ipi_.Active                  then qry_ad_ipi_.Close;
    if tbl_ad_ato_legal_antidump_.Active   then tbl_ad_ato_legal_antidump_.Close;
    if qry_ad_antidump_.Active             then qry_ad_antidump_.Close;
    if tbl_tp_recipiente_.Active           then tbl_tp_recipiente_.Close;
    if qry_fund_leg_.Active                then qry_fund_leg_.Close;
    if qry_disp_legal_.Active              then qry_disp_legal_.Close;
    if qry_trat_tribut_.Active             then qry_trat_tribut_.Close;

    {Câmbio}
    if tbl_ad_cambio_parc_var_.Active      then tbl_ad_cambio_parc_var_.Close;
    if qry_mot_sem_cobertura_.Active       then qry_mot_sem_cobertura_.Close;
    if qry_mod_pagto_.Active               then qry_mod_pagto_.Close;
    if qry_inst_financ_.Active             then qry_inst_financ_.Close;
    if qry_ad_cambio_pg_antec_.Active      then qry_ad_cambio_pg_antec_.Close;
    if qry_ad_cambio_pg_avista_.Active     then qry_ad_cambio_pg_avista_.Close;
  end;
end;

procedure Tfrm_DI_adicao.TrocaNullToZero_II;
begin
  with datm_DI_Adicao do
  begin
    NullToZero( qry_ad_ii_VL_BASE_CALC_ADVAL );
    NullToZero( qry_ad_ii_PC_ALIQ_NORM_ADVAL );
    NullToZero( qry_ad_ii_VL_CALC_IPT_ADVAL );
    NullToZero( qry_ad_ii_QT_ML_RECIPIENTE );
    NullToZero( qry_ad_ii_QT_MERC_UN_ALIQ_ES );
    NullToZero( qry_ad_ii_VL_ALIQ_ESPEC_IPT );
    NullToZero( qry_ad_ii_VL_CALC_IPT_ESPEC );
    NullToZero( qry_ad_ii_PC_ALIQ_REDUZIDA );
    NullToZero( qry_ad_ii_PC_REDUCAO_IPT_BLI );
//    NullToZero( qry_ad_ii_PC_ALIQ_ACOR_TARIF );
    NullToZero( qry_ad_ii_VL_CALC_II_AC_TARI );
    NullToZero( qry_ad_ii_VL_IMPOSTO_DEVIDO );
    NullToZero( qry_ad_ii_VL_IPT_A_RECOLHER );
  end;
end;

procedure Tfrm_DI_adicao.TrocaNullToZero_IPI;
begin
  with datm_DI_Adicao do
  begin
    NullToZero( qry_ad_ipi_VL_BASE_CALC_ADVAL );
    NullToZero( qry_ad_ipi_PC_ALIQ_NORM_ADVAL );
    NullToZero( qry_ad_ipi_VL_CALC_IPT_ADVAL );
    NullToZero( qry_ad_ipi_QT_ML_RECIPIENTE );
    NullToZero( qry_ad_ipi_QT_MERC_UN_ALIQ_ES );
    NullToZero( qry_ad_ipi_VL_ALIQ_ESPEC_IPT );
    NullToZero( qry_ad_ipi_VL_CALC_IPT_ESPEC );
    NullToZero( qry_ad_ipi_PC_ALIQ_REDUZIDA );
    NullToZero( qry_ad_ipi_PC_REDUCAO_IPT_BLI );
    NullToZero( qry_ad_ipi_PC_ALIQ_ACOR_TARIF );
    NullToZero( qry_ad_ipi_VL_CALC_II_AC_TARI );
    NullToZero( qry_ad_ipi_VL_IMPOSTO_DEVIDO );
    NullToZero( qry_ad_ipi_VL_IPT_A_RECOLHER );
  end;
end;

procedure Tfrm_DI_adicao.TrocaNullToZero_AntiDump;
begin
  with datm_DI_Adicao do
  begin
    NullToZero( qry_ad_antidump_VL_BASE_CALC_ADVAL );
    NullToZero( qry_ad_antidump_PC_ALIQ_NORM_ADVAL );
    NullToZero( qry_ad_antidump_VL_CALC_IPT_ADVAL );
    NullToZero( qry_ad_antidump_QT_ML_RECIPIENTE );
    NullToZero( qry_ad_antidump_QT_MERC_UN_ALIQ_ES );
    NullToZero( qry_ad_antidump_VL_ALIQ_ESPEC_IPT );
    NullToZero( qry_ad_antidump_VL_CALC_IPT_ESPEC );
    NullToZero( qry_ad_antidump_PC_ALIQ_REDUZIDA );
    NullToZero( qry_ad_antidump_PC_REDUCAO_IPT_BLI );
    NullToZero( qry_ad_antidump_PC_ALIQ_ACOR_TARIF );
    NullToZero( qry_ad_antidump_VL_CALC_II_AC_TARI );
    NullToZero( qry_ad_antidump_VL_IMPOSTO_DEVIDO );
    NullToZero( qry_ad_antidump_VL_IPT_A_RECOLHER );
  end;
end;

procedure Tfrm_DI_adicao.TrocaNullToZero_Ad;
begin
  with datm_DI_Adicao do
  begin
    NullToZero( qry_adicao_QT_PARC_FINANC_360 );
    NullToZero( qry_adicao_QT_PERIOD_PGTO_360 );
    NullToZero( qry_adicao_VL_TOT_FINANC_360 );
    NullToZero( qry_adicao_PC_TAXA_JUROS );
    NullToZero( qry_adicao_VL_FINANC_SUP_360 );
    NullToZero( qry_adicao_PC_COMISSAO_AG_IMP );
    NullToZero( qry_adicao_VL_COMISSAO_AG_IMP );
    NullToZero( qry_adicao_QT_ITENS_ADICAO );
  end;
end;

procedure Tfrm_DI_adicao.btn_sairClick(Sender: TObject);
begin
  Close;
end;

procedure Tfrm_DI_adicao.btn_salvarClick(Sender: TObject);
begin
  ActiveControl := nil;
  pgctrl_adicao.SetFocus;
  if not Consiste then
    Exit;

  try
    datm_main.db_broker.StartTransaction;

    if datm_DI_Adicao.qry_Aliquota_GATT.Active then
      datm_DI_Adicao.qry_Aliquota_GATT.Close;

    datm_DI_Adicao.qry_Aliquota_GATT.ParamByName('CODIGO').AsString := datm_DI_Adicao.qry_adicao_CD_NCM_SH.AsString;
    datm_DI_Adicao.qry_Aliquota_GATT.Open;


    if (not datm_DI_Adicao.qry_Aliquota_GATTALIQUOTA_GATT.IsNull) and
       ((datm_DI_Adicao.qry_adicao_CD_TIPO_ACORDO_TAR.AsString <> '3') or
        (datm_DI_Adicao.qry_ad_ii_PC_ALIQ_ACOR_TARIF.AsFloat <> datm_DI_Adicao.qry_Aliquota_GATTALIQUOTA_GATT.AsFloat)) and
       (MessageDlg('O NCM desta adição tem alíquota GATT definida que não está sendo utilizada.'#13 +
                   'Deseja que seja utilizado o acordo GATT para esta adição?', mtConfirmation, [mbYes, mbNo], 0) = mrYes) then
    begin
      if not (datm_DI_Adicao.qry_adicao_.State in [dsInsert, dsEdit]) then
        datm_DI_Adicao.qry_adicao_.Edit;

      datm_DI_Adicao.qry_adicao_CD_TIPO_ACORDO_TAR.AsString := '3';
      if not (datm_DI_Adicao.qry_ad_ii_.State in [dsInsert, dsEdit]) then
        datm_DI_Adicao.qry_ad_ii_.Edit;

      datm_DI_Adicao.qry_ad_ii_PC_ALIQ_ACOR_TARIF.AsFloat := datm_DI_Adicao.qry_Aliquota_GATTALIQUOTA_GATT.AsFloat;
    end;

    Screen.Cursor := crHourGlass;
    nr_adicao     := datm_DI_Adicao.qry_adicao_NR_ADICAO.AsString;

    { Garante a limpeza de campos por consistência }
    Application.ProcessMessages;
    SalvaDadosNaoGravados;

    if repassa_campos_classif then
    begin
      with datm_di_adicao do
      begin
        ActiveControl := nil;
        CloseStoredProc(sp_di_repassa_campos_classif);
        sp_di_repassa_campos_classif.ParamByName('@nr_processo').AsString := str_nr_processo;
        sp_di_repassa_campos_classif.ParamByName('@nr_adicao').AsString   := datm_DI_Adicao.qry_adicao_NR_ADICAO.AsString;
        ExecStoredProc(sp_di_repassa_campos_classif);
        CloseStoredProc(sp_di_repassa_campos_classif);
        repassa_campos_classif := False;
      end;
    end;

    in_di_abrindo := True;
    datm_DI_Adicao.qry_di_.Close;
    datm_DI_Adicao.qry_di_.ParamByName('NR_PROCESSO').AsString := str_nr_processo;
    datm_DI_Adicao.qry_di_.Prepare;
    datm_DI_Adicao.qry_di_.Open;

    if Not (datm_DI_Adicao.qry_DI_.State in [dsEdit, dsInsert]) then
      datm_DI_Adicao.qry_di_.Edit;

    datm_DI_Adicao.qry_di_DT_ULTIMA_ALTERACAO.AsString := DateToStr( Date );
    datm_DI_Adicao.qry_di_.Post;

    in_di_abrindo := False;

    datm_main.db_broker.Commit;

    datm_DI_Adicao.VerificaEstado(False);
    datm_DI_Adicao.qry_adicao_.Locate('NR_PROCESSO;NR_ADICAO', VarArrayOf ([str_nr_processo, nr_adicao]), [loCaseInsensitive]);

    FechaTabelas;
    AbreTabelas;

  except
    on E: Exception do
    begin
      frm_DI_adicao.btn_cancelarClick(nil);
      if datm_main.db_broker.InTransaction then
        datm_main.db_broker.Rollback;

      TrataErro(E);
    end;
  end;
  Screen.Cursor := crDefault;
end;

procedure Tfrm_DI_adicao.Consulta_On_line( cNomeTabela : String; fcampo : TStringField; cCaption : String; nCodigo : Integer  );
begin

  Application.CreateForm(Tfrm_consulta_padrao, frm_consulta_padrao);

  frm_consulta_padrao.nCodigo            := nCodigo;
  datm_consulta_padrao.Tabela.TableName  := cNomeTabela;

  if nCodigo = 2 then
  begin
    datm_consulta_padrao.Tabela.Filter   := 'COD_ORGAO_REC = ' + datm_DI_Adicao.qry_di_CD_URF_DESPACHO.AsString;
    datm_consulta_padrao.Tabela.Filtered := True;
  end;

  if nCodigo = 3 then
  begin
    datm_consulta_padrao.Tabela.Filter   := 'ORGAO = '+datm_DI_Adicao.qry_di_CD_URF_DESPACHO.AsString+' AND '+
                                            'RECINTO = '+datm_DI_Adicao.qry_di_CD_RECINTO_ALFAND.AsString;
    datm_consulta_padrao.Tabela.Filtered := True;
  end;

  datm_consulta_padrao.Tabela.Open;
  frm_consulta_padrao.Cons_OnLine := fCampo;

  with frm_consulta_padrao do
  begin
    Caption := Caption + ' ['+ cCaption +']';
    lCons_OnLine := True;
    ShowModal;
    lCons_OnLine := False;
  end;
end;

procedure Tfrm_DI_adicao.SalvaDadosNaoGravados;
begin
  if datm_DI_Adicao.tbl_ad_ato_leg_ncm_.State          in [dsEdit,dsInsert] then
    datm_DI_Adicao.tbl_ad_ato_leg_ncm_.Post;

  if datm_DI_Adicao.tbl_ad_ato_legal_nbm_.State        in [dsEdit,dsInsert] then
    datm_DI_Adicao.tbl_ad_ato_legal_nbm_.Post;

  if ( datm_DI_Adicao.tbl_ad_destaque_ncm_.State       in [dsEdit,dsInsert] ) and ( datm_DI_Adicao.tbl_ad_destaque_ncm_NR_DESTAQUE_NCM.AsString <> '' ) then
    datm_DI_Adicao.tbl_ad_destaque_ncm_.Post;

  if datm_DI_Adicao.tbl_ad_docto_vinc_.State           in [dsEdit,dsInsert] then
    datm_DI_Adicao.tbl_ad_docto_vinc_.Post;

  if ( datm_DI_Adicao.tbl_ad_acrescimos_.State         in [dsEdit,dsInsert] ) and ( datm_DI_Adicao.tbl_ad_acrescimos_CD_MET_ACRES_VALOR.AsString <> '' ) then
    datm_DI_Adicao.tbl_ad_acrescimos_.Post;

  if ( datm_DI_Adicao.tbl_ad_deducoes_.State           in [dsEdit,dsInsert] ) and ( datm_DI_Adicao.tbl_ad_deducoes_CD_MET_DEDUC_VALOR.AsString <> '' ) then
    datm_DI_Adicao.tbl_ad_deducoes_.Post;

  if datm_DI_Adicao.tbl_ad_ato_legal_acordo_tar_.State in [dsEdit,dsInsert] then
    datm_DI_Adicao.tbl_ad_ato_legal_acordo_tar_.Post;

  if datm_DI_Adicao.tbl_ad_ato_legal_benef_ipi_.State  in [dsEdit,dsInsert] then
    datm_DI_Adicao.tbl_ad_ato_legal_benef_ipi_.Post;

  if datm_DI_Adicao.tbl_ad_ato_legal_antidump_.State   in [dsEdit,dsInsert] then
    datm_DI_Adicao.tbl_ad_ato_legal_antidump_.Post;

  if datm_DI_Adicao.qry_ad_ii_.State                   in [dsEdit,dsInsert] then
  begin
    TrocaNullToZero_II;
    datm_DI_Adicao.qry_ad_ii_.Post;
  end;

  if datm_DI_Adicao.qry_ad_ipi_.State                  in [dsEdit,dsInsert] then
  begin
    TrocaNullToZero_IPI;
    datm_DI_Adicao.qry_ad_ipi_.Post;
  end;

  if datm_DI_Adicao.qry_ad_antidump_.State             in [dsEdit,dsInsert] then
  begin
    TrocaNullToZero_AntiDump;
    datm_DI_Adicao.qry_ad_antidump_.Post;
  end;

  if datm_DI_Adicao.qry_ad_cambio_pg_antec_.State      in [dsEdit,dsInsert] then
    datm_DI_Adicao.qry_ad_cambio_pg_antec_.Post;

  if datm_DI_Adicao.qry_ad_cambio_pg_avista_.State     in [dsEdit,dsInsert] then
    datm_DI_Adicao.qry_ad_cambio_pg_avista_.Post;

  if datm_DI_Adicao.tbl_ad_cambio_parc_var_.State      in [dsEdit,dsInsert] then
    datm_DI_Adicao.tbl_ad_cambio_parc_var_.Post;

  if datm_DI_Adicao.qry_adicao_.State                  in [dsEdit,dsInsert] then
  begin
    TrocaNullToZero_Ad;
    datm_DI_Adicao.qry_adicao_.Post;
  end;

  if datm_DI_Adicao.qry_itens_.State                   in [dsEdit,dsInsert] then
    datm_DI_Adicao.qry_adicao_.Post;

  if datm_DI_Adicao.qry_di_.State                      in [dsEdit,dsInsert] then
    datm_DI_Adicao.qry_di_.Post;

end;

procedure Tfrm_DI_adicao.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  FecharCadMercadoria;

  Action := caNone;
  if btn_salvar.Enabled then
    if BoxMensagem('Cadastro de Itens da Adição foi alterado.' + #13#10 + 'Deseja salvar as alterações?', 1) then
      btn_salvarClick(nil)
    else
      btn_cancelarClick(nil);

  //SalvaDadosNaoGravados;

  FechaGeral;

  datm_DI_Adicao.Free;
  Action := caFree;
end;

procedure Tfrm_DI_adicao.FormShow(Sender: TObject);
Var
  i : Integer;
begin
  //datm_DI_Adicao.qry_adicao_.DisableControls;
  pnl_cadastro.Color := clMenuBroker;
  Shape4.Brush.Color := clPnlClaroBroker;

  in_change_adicao        := False;
  in_di_abrindo           := True;
  in_DI_Registrada        := frm_DI.in_DI_Registrada;
  nr_adicao               := '001';
  AbreGeral;
  GuardaTaxaCambialAdicao;

  If (datm_DI_Adicao.qry_adicao_CD_TRIBUTACAO_ICMS.AsString = '3') or
     (datm_DI_Adicao.qry_adicao_CD_TRIBUTACAO_ICMS.AsString = '5') or
     (datm_DI_Adicao.qry_adicao_CD_TRIBUTACAO_ICMS.AsString = '8') then
     Tributo_ICMS;

  repassa_campos_classif  := False;
  if in_DI_Registrada then
  begin
    btn_salvar.Enabled    := False;
    btn_cancelar.Enabled  := False;
    btn_excluir.Enabled   := False;
    mi_excluir.Enabled    := False;
    btn_calculo.Enabled   := False;
    mi_calculo.Enabled    := False;
    mi_salvar.Enabled     := False;
    mi_cancelar.Enabled   := False;

    //btn_incluir_item_numerario.Enabled := False;
    //btn_alterar_item_numerario.Enabled := False;
    //btn_excluir_item_numerario.Enabled := False;

    btn_incluir_1.Enabled := False;
    btn_alterar_1.Enabled := False;
    btn_excluir_1.Enabled := False;

    btn_incluir_2.Enabled := False;
    btn_alterar_2.Enabled := False;
    btn_excluir_2.Enabled := False;

    btn_co_cd_cfop.Enabled := False;
    btnTPSuspensao.enabled := false;
    btnTPIsensao.enabled := false;
    btn_co_Fund_legal_ii_duimp.Enabled := False;
    btn_co_Fund_legal_ipi_duimp.Enabled := False;
    btn_co_Fund_legal_piscofins_duimp.Enabled := False;

    for i := 0 to ComponentCount - 1 do
    begin
      if ( Components[i] is TRadioButton )      then TRadioButton( Components[i] ).Enabled      := False;
      if ( Components[i] is TEdit )             then TEdit( Components[i] ).Enabled             := False;
      if ( Components[i] is TDBRadioGroup )     then TDBRadioGroup( Components[i] ).Enabled     := False;
      if ( Components[i] is TDBLookupComboBox ) then TDBLookupComboBox( Components[i] ).Enabled := False;
    end;
  end;

  i_Tipo_Declaracao := datm_DI_Adicao.qry_di_CD_TIPO_DECLARACAO.AsInteger;

  if i_Tipo_Declaracao in [16, 17, 18] then tbsht_carga.TabVisible := True;

  if i_Tipo_Declaracao in [5, 12] then
  begin
    lbl_mot_ad_temp.Visible        := True;
    dbedt_cd_mot_ad_temp.Visible   := True;
    dbedt_desc_mot_ad_temp.Visible := True;
    btn_co_mot_ad_temp.Visible     := True;
  end
  else
  begin
    lbl_mot_ad_temp.Visible        := False;
    dbedt_cd_mot_ad_temp.Visible   := False;
    dbedt_desc_mot_ad_temp.Visible := False;
    btn_co_mot_ad_temp.Visible     := False;
  end;

  if i_Tipo_Declaracao in [20, 21] then
  begin
    lbl_via_transp.Visible       := False;
    dblkpcbox_via_transp.Visible := False;
    tbsht_carga.TabVisible       := True;
  end;

  if i_Tipo_Declaracao = 19 then
  begin
    tbsht_fornecedor_fabricante.TabVisible := False;
    tbsht_valor_aduaneiro.TabVisible       := False;
    tbsht_tributos.TabVisible              := False;
    tbsht_tributo_TD19.TabVisible          := True;
  end;

  Caption := Caption + '[ '+ Trim( Copy( str_nr_processo, 5, 14 ) ) + ' ] - Adições';

  if datm_DI_Adicao.qry_adicao_IN_MATERIAL_USADO.AsBoolean then
  begin
    rbtn_material_usado.Checked    := True;
    rbtn_Bem_sob_encomenda.Checked := False;
  end
  else
  if datm_DI_Adicao.qry_adicao_IN_BEM_ENCOMENDA.AsBoolean then
  begin
    rbtn_Bem_sob_encomenda.Checked := True;
    rbtn_material_usado.Checked    := False;
  end
  else
  begin
    rbtn_material_usado.Checked    := False;
    rbtn_Bem_sob_encomenda.Checked := False;
  end;
  if in_DI_Registrada then
  begin
    rbtn_material_usado.Enabled    := False;
    rbtn_Bem_sob_encomenda.Enabled := False;
  end;

  in_di_abrindo                    := False;

  dbrgrp_fabr_expoChange(Sender);

  datm_DI_Adicao.VerificaEstado(False);
  //datm_DI_Adicao.qry_adicao_.EnableControls;
  If (datm_DI_Adicao.qry_adicao_CD_TRIBUTACAO_ICMS.AsString = '3') or
     (datm_DI_Adicao.qry_adicao_CD_TRIBUTACAO_ICMS.AsString = '5') then
     Tributo_ICMS;


  ValidaVisibilidadeAbaMercante;
  edtItemDireto.enabled := true;
end;

procedure Tfrm_DI_adicao.ValidaVisibilidadeAbaMercante;
var
  i:integer;
begin
  datm_DI_Adicao.qryValidaViaTransp.close;
  datm_DI_Adicao.qryValidaViaTransp.ParamByName('nr_processo').value := str_nr_processo;//'';
  datm_DI_Adicao.qryValidaViaTransp.open;
  if datm_DI_Adicao.qryValidaViaTransp.isEmpty then
  begin
    for i := pgctrl_adicao.PageCount -1 downto 0 do
    begin
      if pgctrl_adicao.pages[i].Name = 'tbsPgmtoAFRMM' then
      begin
        pgctrl_adicao.pages[i].TabVisible := false;
        break;
      end;
    end;
  end;
end;

procedure Tfrm_DI_adicao.pgctrl_adicaoChange(Sender: TObject);
begin
  {
  if (Not in_DI_Registrada) and btn_salvar.Enabled then
  begin
    SalvaDadosNaoGravados;
  end; }

  FechaTabelas;
  AbreTabelas;

  {Mercadoria}
  if pgctrl_adicao.ActivePage = tbsht_mercadoria then
  begin
    {Basico}
    if pgctrl_mercadorias.ActivePage = tbsht_mercadoria_basica then
    begin
      case i_tipo_declaracao of
        2, 5:
        begin
          dbrgrp_aplicacao.Visible                := False;
          stxt_docto_vinculado.visible            := False;
          dbg_docto_vinc.visible                  := False;
        end;
        3, 6:
        begin
          dbrgrp_aplicacao.Visible                := False;
          grpbox_cond_mercadoria.Visible          := False;
        end;
        4, 8, 9, 10:
        dbrgrp_aplicacao.Visible                  := False;
        7:
        begin
          dbrgrp_aplicacao.Visible                := False;
          grpbox_cond_mercadoria.Visible          := False;
          stxt_docto_vinculado.visible            := False;
          dbg_docto_vinc.visible                  := False;
        end;
        15:
        grpbox_cond_mercadoria.Visible            := False;
        16, 17, 18, 20, 21:
        begin
          stxt_docto_vinculado.visible            := False;
          dbg_docto_vinc.visible                  := False;
        end;
        19:
        begin
          lbl_aliquota_IPI.Visible                := False;
          dbedt_aliq_IPI.Visible                  := False;
          lbl_unid_med_estatistica.Visible        := False;
          edt_nm_unid_med_est.Visible             := False;
          grpbox_cond_mercadoria.Visible          := False;
          stxt_docto_vinculado.visible            := False;
          dbg_docto_vinc.visible                  := False;
        end;
      end;
      dbrgrp_aplicacao.Visible := True;

      if datm_DI_Adicao.tbl_unid_med_.findkey([ copy( datm_DI_Adicao.qry_ncm_UNIDADE_MEDIDA.AsString, 1, 2 ) ]) then
        edt_nm_unid_med_est.text := datm_DI_Adicao.tbl_unid_med_DESCRICAO.AsString
      else
        edt_nm_unid_med_est.text := '';

      if datm_DI_Adicao.qry_adicao_.State in [dsEdit,dsInsert] then
         datm_DI_Adicao.qry_adicao_CD_MERC_NBM_SH.AsString := Copy(datm_DI_Adicao.qry_adicao_CD_NCM_SH.AsString,1,8);
    end;
  end;

  {Tributos}
  if pgctrl_adicao.ActivePage = tbsht_tributos then
  begin
    if ( pgctrl_tributos.ActivePage = tbsht_tributo_IPI ) then
    begin
      if ( datm_DI_Adicao.qry_adicao_CD_REGIME_TRIBUTAR.AsString = '2' ) or
         ( datm_DI_Adicao.qry_adicao_CD_REGIME_TRIBUTAR.AsString = '6' ) then
      begin
        BoxMensagem( 'Para o Regime de Tributação escolhido não é necessário informar dados de I.P.I.', 2 );
        pgctrl_tributos.ActivePage := tbsht_tributo_II;
        Exit;
      end;
      dbcb_ipi_nao_tributavelClick(Sender);
    end;

    if ( pgctrl_tributos.ActivePage = tbsht_tributo_II ) then
    begin
      dblkcbox_acordo_tarifExit(Sender);
      if dbedt_aliq_reduzida.Field.AsFloat > 0 then
      begin
        dbedt_pc_reducao.Color   := clMenu;
        dbedt_pc_reducao.Enabled := False;
        if btn_salvar.Enabled then
        begin
          if ( Not in_DI_Registrada ) and Not ( dbedt_pc_reducao.Field.DataSet.State in [dsInsert, dsEdit]) then
          begin
            dbedt_pc_reducao.Field.DataSet.Edit;
            dbedt_pc_reducao.Field.AsFloat := 0;
            dbedt_pc_reducao.Field.DataSet.Post;
          end;
        end;
      end
      else
      begin
        dbedt_pc_reducao.Color   := clWindow;
        dbedt_pc_reducao.Enabled := True;
      end;

      if dbedt_pc_reducao.Field.AsFloat > 0 then
      begin
        dbedt_aliq_reduzida.Color   := clMenu;
        dbedt_aliq_reduzida.Enabled := False;
        if btn_salvar.Enabled then
        begin
          if ( Not in_DI_Registrada ) and Not ( ( dbedt_aliq_reduzida.Field.DataSet.State in [dsInsert, dsEdit]) ) then
          begin
            dbedt_aliq_reduzida.Field.DataSet.Edit;
            dbedt_aliq_reduzida.Field.AsFloat := 0;
            dbedt_aliq_reduzida.Field.DataSet.Post;
          end;
        end;
      end
      else
      begin
        dbedt_aliq_reduzida.Color   := clWindow;
        dbedt_aliq_reduzida.Enabled := True;
      end;
    end;

//    AtualizaTelaICMSRJ;
  end;

  {Câmbio}
  if ( pgctrl_adicao.ActivePage = tbsht_cambio1 ) then
  begin
    {Para setar valores de cambio e não entrar em edição habilita variável}
    in_di_abrindo := True;

    if datm_DI_Adicao.qry_di_CD_TIPO_DECLARACAO.AsString = '19' then
    begin
       rbtn_cambial_Sem_Cobertura.Checked := True;
       rbtn_cambial_Ate180.Enabled        := False;
       rbtn_cambial_De180_360.Enabled     := False;
       rbtn_cambial_Acima360.Enabled      := False;
       tbsht_pg_cambio_avista2.TabVisible := False;
    end;

    if datm_DI_Adicao.qry_adicao_CD_COBERT_CAMBIAL.AsString <> '' then
    begin
      case datm_DI_Adicao.qry_adicao_CD_COBERT_CAMBIAL.AsInteger of
        1: rbtn_cambial_Ate180.Checked        := True;
        2: rbtn_cambial_De180_360.Checked     := True;
        3: rbtn_cambial_Acima360.Checked      := True;
        4: rbtn_cambial_Sem_Cobertura.Checked := True;
      end;
    end
    else
    begin
      rbtn_cambial_Ate180Click(nil);
    end;

    if in_DI_Registrada then
    begin
      rbtn_cambial_Ate180.Enabled             := False;
      rbtn_cambial_De180_360.Enabled          := False;
      rbtn_cambial_Acima360.Enabled           := False;
      rbtn_cambial_Sem_Cobertura.Enabled      := False;
    end;

    if dbedt_cd_mot_sem_cobert.Enabled then dbedt_cd_mot_sem_cobertExit(nil);
    pgctrl_pg_cambio1.ActivePage := tbsht_pg_cambio_antec1;
    pgctrl_pg_cambio2.ActivePage := tbsht_pg_cambio_antec2;

    dbrgrp_parcelas1Change(nil);
    dbrgrp_parcelas2Change(nil);

    in_di_abrindo := False;

  end;

end;

procedure Tfrm_DI_adicao.dbrgrp_fabr_expoChange(Sender: TObject);
begin
  if in_di_abrindo then Exit;
  lbl_pais_origem1.Visible                     := False;
  dbedt_cd_pais_origem1.Visible                := False;
  dbedt_nm_pais_origem1.Visible                := False;
  sbtn_tab_pais3.Visible                       := False;
  sbtn_tab_pais1.Visible                       := False;
  pgctrl_expo_fabr.visible                     := False;
  tbsht_exportador.TabVisible                  := False;
  tbsht_fabricante_produtor.TabVisible         := False;
  case dbrgrp_fabr_expo.ItemIndex of
   0: begin
        pgctrl_expo_fabr.visible               := True;
        tbsht_exportador.Caption               := ' Exportador / Fabricante / Produtor ';
        tbsht_exportador.TabVisible            := True;
        pgctrl_expo_fabr.ActivePage            := tbsht_exportador;
        lbl_pais_origem1.Visible               := False;
        dbedt_cd_pais_origem1.Visible          := False;
        dbedt_nm_pais_origem1.Visible          := False;
        sbtn_tab_pais1.Visible                 := False;
        if ( dbedt_expo_codigo.Text <> '' ) and (datm_DI_Adicao.qry_adicao_.State in [dsEdit,dsInsert]) then
        begin
          with datm_DI_Adicao do
          begin
            if tbl_empresa_est_.FindKey([dbedt_expo_codigo.Text]) then
            begin
              qry_adicao_CD_FABRICANTE.AsString      := '';
              qry_adicao_NM_FABRICANTE_MERC.AsString := '';
              qry_adicao_ED_LOGR_FABRIC.AsString     := '';
              qry_adicao_ED_NR_FABRIC.AsString       := '';
              qry_adicao_ED_COMPL_FABRIC.AsString    := '';
              qry_adicao_ED_CIDAD_FABRIC.AsString    := '';
              qry_adicao_ED_ESTADO_FABRIC.AsString   := '';
              qry_adicao_CD_PAIS_ORIG_MERC.AsString  := '';
            end;
          end;
        end;
      end;
   1: begin
        pgctrl_expo_fabr.visible               := True;
        tbsht_exportador.Caption               := ' Exportador ';
        tbsht_fabricante_produtor.Caption      := ' Fabricante / Produtor ';
        pgctrl_expo_fabr.ActivePage            := tbsht_exportador;
        tbsht_exportador.TabVisible            := True;
        tbsht_fabricante_produtor.TabVisible   := True;
      end;
   2: begin
        pgctrl_expo_fabr.visible               := True;
        tbsht_exportador.Caption               := ' Exportador ';
        tbsht_exportador.TabVisible            := True;
        pgctrl_expo_fabr.ActivePage            := tbsht_exportador;
        lbl_pais_origem1.Visible               := True;
        dbedt_cd_pais_origem1.Visible          := True;
        dbedt_nm_pais_origem1.Visible          := True;
        sbtn_tab_pais1.Visible                 := True;
        sbtn_tab_pais3.Visible                 := True;
        if (datm_DI_Adicao.qry_adicao_.State in [dsEdit,dsInsert]) then
        begin
          with datm_DI_Adicao do
          begin
            qry_adicao_CD_FABRICANTE.AsString      := '';
            qry_adicao_NM_FABRICANTE_MERC.AsString := '';
            qry_adicao_ED_LOGR_FABRIC.AsString     := '';
            qry_adicao_ED_NR_FABRIC.AsString       := '';
            qry_adicao_ED_COMPL_FABRIC.AsString    := '';
            qry_adicao_ED_CIDAD_FABRIC.AsString    := '';
            qry_adicao_ED_ESTADO_FABRIC.AsString   := '';
            qry_adicao_CD_PAIS_ORIG_MERC.AsString  := '';
          end;
        end;
      end;
  else
      begin
        pgctrl_expo_fabr.visible               := True;
        tbsht_exportador.Caption               := ' Exportador / Fabricante / Produtor ';
        pgctrl_expo_fabr.ActivePage            := tbsht_exportador;
        tbsht_exportador.TabVisible            := True;
      end;
  end;
end;

procedure Tfrm_DI_adicao.dbedt_ex_ato_legal_ncmExit(Sender: TObject);
begin
  if dbedt_ex_ato_legal_ncm.text <> '' then
  begin
    dblkpcbox_tipo_ato_legal_ncm.Enabled   := True;
    dblkpcbox_orgao_ato_legal_ncm.Enabled  := True;
    dbedt_nr_ato_legal_ncm.Enabled         := True;
    dbedt_dt_ano_ato_legal_ncm.Enabled     := True;
    dblkpcbox_tipo_ato_legal_ncm.SetFocus;
  end
  else
  begin
    dblkpcbox_tipo_ato_legal_ncm.Enabled   := False;
    dblkpcbox_orgao_ato_legal_ncm.Enabled  := False;
    dbedt_nr_ato_legal_ncm.Enabled         := False;
    dbedt_dt_ano_ato_legal_ncm.Enabled     := False;
    if ( not in_DI_Registrada ) and btn_salvar.Enabled then
    begin
      datm_DI_Adicao.tbl_ad_ato_leg_ncm_.Close;
      datm_DI_Adicao.tbl_ad_ato_leg_ncm_.Open;
      if datm_DI_Adicao.tbl_ad_ato_leg_ncm_.RecordCount > 0 then
      begin
        datm_DI_Adicao.tbl_ad_ato_leg_ncm_.Delete;
      end;
    end;
  end;
end;

procedure Tfrm_DI_adicao.dbedt_ex_ato_legal_nbmExit(Sender: TObject);
begin
  if dbedt_ex_ato_legal_nbm.text <> '' then
  begin
    dblkpcbox_tipo_ato_legal_nbm.Enabled   := True;
    dblkpcbox_orgao_ato_legal_nbm.Enabled  := True;
    dbedt_nr_ato_legal_nbm.Enabled         := True;
    dbedt_dt_ano_ato_legal_nbm.Enabled     := True;
    dblkpcbox_tipo_ato_legal_nbm.SetFocus;
  end
  else
  begin
    dblkpcbox_tipo_ato_legal_nbm.Enabled   := False;
    dblkpcbox_orgao_ato_legal_nbm.Enabled  := False;
    dbedt_nr_ato_legal_nbm.Enabled         := False;
    dbedt_dt_ano_ato_legal_nbm.Enabled     := False;
    if ( not in_DI_Registrada ) and btn_salvar.Enabled then
    begin
      datm_DI_Adicao.tbl_ad_ato_legal_nbm_.Close;
      datm_DI_Adicao.tbl_ad_ato_legal_nbm_.Open;
      if datm_DI_Adicao.tbl_ad_ato_legal_nbm_.RecordCount > 0 then
      begin
        datm_DI_Adicao.tbl_ad_ato_legal_nbm_.Delete;
      end;
    end;
  end;
end;

procedure Tfrm_DI_adicao.rbtn_ind_per_diaria1Click(Sender: TObject);
begin
  if Not ( in_di_abrindo or in_DI_Registrada or in_change_adicao ) then
  begin
    if Not (datm_DI_Adicao.qry_adicao_.State in [dsEdit,dsInsert]) then datm_DI_Adicao.qry_adicao_.Edit;
  end
  else if Not in_DI_Registrada then
  begin
    dbrgrp_parcelas1Change(nil);
  end;
  if (datm_DI_Adicao.qry_adicao_.state in [dsEdit,dsInsert]) then
     datm_DI_Adicao.qry_adicao_CD_PERIOD_PGTO_360.AsString := '1';
end;

procedure Tfrm_DI_adicao.rbtn_ind_per_mensal1Click(Sender: TObject);
begin
  if Not ( in_di_abrindo or in_DI_Registrada or in_change_adicao ) then
  begin
    if Not (datm_DI_Adicao.qry_adicao_.State in [dsEdit,dsInsert]) then datm_DI_Adicao.qry_adicao_.Edit;
  end
  else if Not in_DI_Registrada then
  begin
    dbrgrp_parcelas1Change(nil);
  end;
  if (datm_DI_Adicao.qry_adicao_.state in [dsEdit,dsInsert]) then
     datm_DI_Adicao.qry_adicao_CD_PERIOD_PGTO_360.AsString := '2';
end;

procedure Tfrm_DI_adicao.dbedt_qt_parcelas1Change(Sender: TObject);
begin
  if Not (datm_DI_Adicao.qry_adicao_.State in [dsEdit,dsInsert]) then Exit;
  if dbedt_qt_parcelas1.Text <> '' then
  begin
    dbedt_qt_periodos1.Enabled     := True;
    dbedt_vl_total_financ1.Enabled := True;
    rbtn_ind_per_diaria1.Enabled   := True;
    rbtn_ind_per_mensal1.Enabled   := True;
  end
  else
  begin
    datm_DI_Adicao.qry_adicao_QT_PERIOD_PGTO_360.AsInteger := 0;
    datm_DI_Adicao.qry_adicao_VL_TOT_FINANC_360.AsFloat    := 0;
    dbedt_qt_periodos1.Enabled                             := False;
    dbedt_vl_total_financ1.Enabled                         := False;
    rbtn_ind_per_diaria1.Enabled                           := False;
    rbtn_ind_per_mensal1.Enabled                           := False;
  end;
end;

procedure Tfrm_DI_adicao.dbedt_qt_parcelas2Change(Sender: TObject);
begin
  if Not (datm_DI_Adicao.qry_adicao_.State in [dsEdit,dsInsert]) then exit;
  if dbedt_qt_parcelas2.Text <> '' then
  begin
    dbedt_qt_periodos2.Enabled     := True;
    dbedt_vl_total_financ2.Enabled := True;
    rbtn_ind_per_diaria2.Enabled   := True;
    rbtn_ind_per_mensal2.Enabled   := True;
  end
  else
  begin
    datm_DI_Adicao.qry_adicao_QT_PERIOD_PGTO_360.AsInteger := 0;
    datm_DI_Adicao.qry_adicao_VL_TOT_FINANC_360.AsFloat    := 0;
    dbedt_qt_periodos2.Enabled                             := False;
    dbedt_vl_total_financ2.Enabled                         := False;
    rbtn_ind_per_diaria2.Enabled                           := False;
    rbtn_ind_per_mensal2.Enabled                           := False;
  end;
end;

procedure Tfrm_DI_adicao.rbtn_ind_per_diaria2Click(Sender: TObject);
begin
  if Not ( in_di_abrindo or in_DI_Registrada or in_change_adicao ) then
  begin
    if Not (datm_DI_Adicao.qry_adicao_.State in [dsEdit,dsInsert]) then datm_DI_Adicao.qry_adicao_.Edit;
  end
  else if Not in_DI_Registrada then
  begin
    dbrgrp_parcelas2Change(nil);
  end;
  if (datm_DI_Adicao.qry_adicao_.state in [dsEdit,dsInsert]) then
     datm_DI_Adicao.qry_adicao_CD_PERIOD_PGTO_360.AsString := '1';
end;

procedure Tfrm_DI_adicao.rbtn_ind_per_mensal2Click(Sender: TObject);
begin
  if Not ( in_di_abrindo or in_DI_Registrada or in_change_adicao ) then
  begin
    if Not (datm_DI_Adicao.qry_adicao_.State in [dsEdit,dsInsert]) then datm_DI_Adicao.qry_adicao_.Edit;
  end
  else if Not in_DI_Registrada then
  begin
    dbrgrp_parcelas2Change(nil);
  end;
  if (datm_DI_Adicao.qry_adicao_.state in [dsEdit,dsInsert]) then
     datm_DI_Adicao.qry_adicao_CD_PERIOD_PGTO_360.AsString := '2';
end;

procedure Tfrm_DI_adicao.dbcb_ipi_nao_tributavelClick(Sender: TObject);
begin
  if in_di_abrindo then Exit;
  if dbcb_ipi_nao_tributavel.checked then
  begin
    {Tela}
    dbrg_reg_tributacao.enabled                 := False;
    dbrg_reg_tributacao.font.color              := clInactiveCaption;
    dbedt_ex_ato_legal_benef_ipi.enabled        := False;
    gb_aliq_ad_valorem.enabled                  := False;

    dblkpcbox_tipo_ato_legal_benef_ipi.Enabled  := False;
    dblkpcbox_orgao_ato_legal_benef_ipi.Enabled := False;
    dbedt_nr_ato_legal_benef_ipi.Enabled        := False;
    dbedt_dt_ano_ato_legal_benef_ipi.Enabled    := False;

    gb_aliq_ad_valorem.font.color               := clInactiveCaption;
    gb_aliq_unitaria.enabled                    := False;
    gb_aliq_unitaria.font.color                 := clInactiveCaption;

    {DataBase}
    if btn_salvar.Enabled then
    begin
      { by Carlos em 15/06/2010 - evitar o erro da query fechada antes da edição }
      if datm_DI_Adicao.qry_ad_ipi_.Active=false then datm_DI_Adicao.qry_ad_ipi_.Open;

      if not (datm_DI_Adicao.qry_ad_ipi_.State in [dsEdit,dsInsert]) then
         datm_DI_Adicao.qry_ad_ipi_.Edit;
      datm_DI_Adicao.qry_ad_ipi_CD_TIPO_BENEF_IPI.AsString := '3';
    end;
  end
  else
  begin
    {Tela}
    dbrg_reg_tributacao.Enabled                 := True;
    dbrg_reg_tributacao.Font.color              := clWindowText;
    dbedt_ex_ato_legal_benef_ipi.Enabled        := True;
    gb_aliq_ad_valorem.Enabled                  := True;
    gb_aliq_ad_valorem.font.Color               := clWindowText;
    gb_aliq_unitaria.Enabled                    := True;
    gb_aliq_unitaria.font.Color                 := clWindowText;
    dblkpcbox_tipo_ato_legal_benef_ipi.Enabled  := True;
    dblkpcbox_orgao_ato_legal_benef_ipi.Enabled := True;
    dbedt_nr_ato_legal_benef_ipi.Enabled        := True;
    dbedt_dt_ano_ato_legal_benef_ipi.Enabled    := True;

    {DataBase}
    if btn_salvar.Enabled then
    begin
      if ( datm_DI_Adicao.qry_ad_ipi_CD_TIPO_BENEF_IPI.AsString = '' ) or
         ( datm_DI_Adicao.qry_ad_ipi_CD_TIPO_BENEF_IPI.AsString = '3' ) then
      begin
        if Not (datm_DI_Adicao.qry_ad_ipi_.State in [dsEdit,dsInsert]) then
        begin
          datm_DI_Adicao.qry_ad_ipi_.Edit;
          datm_DI_Adicao.qry_ad_ipi_CD_TIPO_BENEF_IPI.AsString := '4';
          datm_DI_Adicao.qry_ad_ipi_.Post;
        end;
      end;
    end;
  end;
end;

procedure Tfrm_DI_adicao.rbtn_cambial_Ate180Click(Sender: TObject);
begin
  with datm_DI_Adicao do
  begin
    if Not ( in_di_abrindo or in_DI_Registrada or in_change_adicao ) then
    begin
      if Not (qry_adicao_.State in [dsEdit,dsInsert]) then qry_adicao_.Edit;
    end;

    {Limpeza de campos por consistência:}
    if ( rbtn_cambial_Ate180.checked or rbtn_cambial_De180_360.checked ) then
    begin
      {Tela}
      dbedt_cd_inst_financExit(nil);
      dbedt_cd_mot_sem_cobertExit(nil);
      {DataBase}
      if btn_salvar.Enabled then
      begin
        if Not ( qry_adicao_.State in [dsEdit] ) then qry_adicao_.Edit;
        qry_adicao_VL_FINANC_SUP_360.AsFloat   := 0;
        qry_adicao_NR_ROF.AsString             := '';
        qry_adicao_CD_ORGAO_FIN_INTER.AsString := '';
        qry_adicao_CD_MOTIVO_SEM_COB.AsString  := '';
      end;
    end;

    if rbtn_cambial_Ate180.Checked then
    begin
      {Tela}
      lbl_mot_sem_cobert.Visible      := False;
      dbedt_cd_mot_sem_cobert.Visible := False;
      dbedt_mot_sem_cobert.Visible    := False;
      btn_co_motivo_sem_cob.Visible   := False;
      tbsht_pg_cambio_em1.Caption     := '&Pagamento em até 180 Dias';
      {DataBase}
      if btn_salvar.Enabled then
      begin
        qry_adicao_CD_COBERT_CAMBIAL.AsString := '1';
      end;
    end;

    if rbtn_cambial_De180_360.checked     then
    begin
      {Tela}
      tbsht_pg_cambio_em1.Caption     := '&Pagamento de 180 até 360 Dias';
      lbl_mot_sem_cobert.Visible      := False;
      dbedt_cd_mot_sem_cobert.Visible := False;
      dbedt_mot_sem_cobert.Visible    := False;
      btn_co_motivo_sem_cob.Visible   := False;
      {DataBase}
      if btn_salvar.Enabled then
      begin
        qry_adicao_CD_COBERT_CAMBIAL.AsString := '2';
      end;
    end;

    if rbtn_cambial_Acima360.Checked then
    begin
      {Tela}
      dbedt_cd_mot_sem_cobertExit(nil);
      dbcbox_com_taxa_juros.Checked   := False;
      rbtn_ind_per_diaria1.Checked    := False;
      rbtn_ind_per_diaria2.Checked    := False;
      rbtn_ind_per_mensal1.Checked    := False;
      rbtn_ind_per_mensal2.Checked    := False;
      lbl_mod_pagto.Visible           := False;
      dbedt_cd_mod_pagto_1.Visible    := False;
      dbedt_mod_pagto_1.Visible       := False;
      btn_co_mod_pagto.Visible        := False;
      lbl_inst_financ.Visible         := True;
      dbedt_cd_inst_financ.Visible    := True;
      dbedt_inst_financ.Visible       := True;
      btn_co_inst_financ.Visible      := True;
      tbsht_pg_cambio_em1.TabVisible  := False;
      tbsht_pg_cambio_Sup.TabVisible  := True;
      pgctrl_pg_cambio1.ActivePage    := tbsht_pg_cambio_antec1;
      lbl_mot_sem_cobert.Visible      := False;
      dbedt_cd_mot_sem_cobert.Visible := False;
      dbedt_mot_sem_cobert.Visible    := False;
      btn_co_motivo_sem_cob.Visible   := False;

      {DataBase}
      if btn_salvar.Enabled then
      begin
        qry_adicao_CD_TAXA_JUROS.AsString       := '';
        qry_adicao_PC_TAXA_JUROS.AsFloat        := 0;
        qry_adicao_CD_MODALIDADE_PGTO.AsString  := '';
        qry_adicao_CD_MOTIVO_SEM_COB.AsString   := '';
        qry_adicao_QT_PARC_FINANC_360.AsInteger := 0;
        qry_adicao_QT_PERIOD_PGTO_360.AsInteger := 0;
        qry_adicao_VL_TOT_FINANC_360.AsFloat    := 0;
        qry_adicao_CD_PERIOD_PGTO_360.AsString  := '';
        while tbl_ad_cambio_parc_var_.FindKey([str_nr_processo,
           qry_adicao_NR_ADICAO.AsString]) do
           tbl_ad_cambio_parc_var_.Delete;
        qry_adicao_CD_COBERT_CAMBIAL.AsString := '3';
      end;
    end
    else
    begin
      lbl_mod_pagto.Visible           := True;
      dbedt_cd_mod_pagto_1.Visible    := True;
      dbedt_mod_pagto_1.Visible       := True;
      btn_co_mod_pagto.Visible        := True;
      lbl_inst_financ.Visible         := False;
      dbedt_cd_inst_financ.Visible    := False;
      dbedt_inst_financ.Visible       := False;
      btn_co_inst_financ.Visible      := False;
      tbsht_pg_cambio_Sup.TabVisible  := False;
      tbsht_pg_cambio_em1.TabVisible  := True;
      pgctrl_pg_cambio1.ActivePage    := tbsht_pg_cambio_antec1;
    end;

    if rbtn_cambial_Sem_Cobertura.checked then
    begin
      { so rof if At( dbedt_cd_mot_sem_cobert.Text, '31-39-40-41-42-43-44-45-46-47-48-50-51-52-54-55-56-58-67-71-99' ) then}
      if dbedt_cd_mot_sem_cobert.Text <> '32' then
      begin
        {Tela}
        dbcbox_com_taxa_juros.Checked   := False;
        rbtn_ind_per_diaria1.Checked    := False;
        rbtn_ind_per_diaria2.Checked    := False;
        rbtn_ind_per_mensal1.Checked    := False;
        rbtn_ind_per_mensal2.Checked    := False;
        tbsht_pg_cambio_em2.Caption     := '&Pagamento à Prazo em Reais';
        lbl_mot_sem_cobert.Visible      := True;
        dbedt_cd_mot_sem_cobert.Visible := True;
        dbedt_mot_sem_cobert.Visible    := True;
        btn_co_motivo_sem_cob.Visible   := True;
        dbedt_cd_mot_sem_cobert.Enabled := True;
        dbedt_cd_mot_sem_cobert.Color   := clWindow;
        dbedt_cd_mot_sem_cobert.TabStop := True;

        if dbedt_cd_mot_sem_cobert.Text <> '32' then
        begin
          gbox_rof_imp_sem_cobert.Visible := False;
          gbox_pg_comissao.Visible        := False;
          gbox_pg_cambio_1.Visible        := False;
          gbox_pg_cambio_2.Visible        := False;
        end;

        {DataBase}
        if btn_salvar.Enabled then
        begin
          qry_adicao_CD_COBERT_CAMBIAL.AsString   := '4';
          qry_adicao_CD_TAXA_JUROS.AsString       := '';
          qry_adicao_PC_TAXA_JUROS.AsFloat        := 0;
          qry_adicao_QT_PARC_FINANC_360.AsInteger := 0;
          qry_adicao_QT_PERIOD_PGTO_360.AsInteger := 0;
          qry_adicao_VL_TOT_FINANC_360.AsFloat    := 0;
          qry_adicao_CD_PERIOD_PGTO_360.AsString  := '';
          qry_adicao_CD_MODALIDADE_PGTO.AsString  := '';

          while tbl_ad_cambio_parc_var_.FindKey([str_nr_processo,
                qry_adicao_NR_ADICAO.AsString]) do
                tbl_ad_cambio_parc_var_.Delete;

          qry_adicao_VL_FINANC_SUP_360.AsFloat   := 0;
          qry_adicao_PC_COMISSAO_AG_IMP.AsFloat  := 0;
          qry_adicao_VL_COMISSAO_AG_IMP.AsFloat  := 0;
          qry_adicao_NR_AGENTE_IMP.AsString      := '';
          qry_adicao_CD_BANC_AGENTE_IMP.AsString := '';
          qry_adicao_CD_AGENC_AGENT_IMP.AsString := '';

          qry_ad_cambio_pg_antec_.Close;
          qry_ad_cambio_pg_antec_.Prepare;
          qry_ad_cambio_pg_antec_.Open;

          while qry_ad_cambio_pg_antec_.RecordCount > 0 do
                qry_ad_cambio_pg_antec_.Delete;

          qry_ad_cambio_pg_avista_.Close;
          qry_ad_cambio_pg_avista_.Prepare;
          qry_ad_cambio_pg_avista_.Open;

          while qry_ad_cambio_pg_avista_.RecordCount > 0 do
                qry_ad_cambio_pg_avista_.Delete;
        end;
      end;

      if ( Not At( dbedt_cd_mot_sem_cobert.Text, '30-57-66-70' ) ) and
         ( btn_salvar.Enabled ) then
         qry_adicao_NR_ROF.AsString := '';

      {sempre em caso de S/ Cobertura}
      if ( btn_salvar.Enabled ) then
      qry_adicao_CD_ORGAO_FIN_INTER.AsString := '';
      dbedt_cd_inst_financExit(nil);
    end;

    if At( qry_adicao_CD_COBERT_CAMBIAL.AsString, '123') then
    begin
      gbox_rof_imp_sem_cobert.Visible := False;
      gbox_pg_comissao.Visible        := True;
      gbox_pg_cambio_1.Visible        := True;
      gbox_pg_cambio_2.Visible        := False;
    end
    else if qry_adicao_CD_COBERT_CAMBIAL.AsString <> '4' then
    begin
      {Tela}
      dbedt_cd_mot_sem_cobert.Enabled   := False;
      dbedt_cd_mot_sem_cobert.Color     := clMenu;
      dbedt_cd_mot_sem_cobert.TabStop   := False;
      {DataBase}
      if btn_salvar.Enabled then
      begin
        qry_adicao_CD_MOTIVO_SEM_COB.AsString := '';
      end;
    end;
  end;
end;

procedure Tfrm_DI_adicao.dbedt_cd_mot_sem_cobertExit(Sender: TObject);
begin
  if At( dbedt_cd_mot_sem_cobert.Text, '31-39-40-41-42-43-44-45-46-47-48-50-51-52-54-55-56-58-67-71-99' ) then
  begin
    gbox_rof_imp_sem_cobert.Visible := False;
    gbox_pg_comissao.Visible := False;
    gbox_pg_cambio_1.Visible := False;
    gbox_pg_cambio_2.Visible := False;
    Exit
  end;

  if At( dbedt_cd_mot_sem_cobert.Text, '30-57-66-70' ) then
  begin
    gbox_rof_imp_sem_cobert.Visible := True;
    gbox_pg_comissao.Visible := False;
    gbox_pg_cambio_1.Visible := False;
    gbox_pg_cambio_2.Visible := False;
    Exit;
  end;

  if dbedt_cd_mot_sem_cobert.Text = '32' then
  begin
    gbox_rof_imp_sem_cobert.Visible := False;
    gbox_pg_comissao.Visible        := True;
    gbox_pg_cambio_1.Visible        := False;
    gbox_pg_cambio_2.Visible        := True;
    Exit;
  end;

  if (dbedt_cd_mot_sem_cobert.Text <> '') then
  begin
    gbox_rof_imp_sem_cobert.Visible := False;
    gbox_pg_comissao.Visible        := False;
    gbox_pg_cambio_1.Visible        := False;
    gbox_pg_cambio_2.Visible        := False;
  end;
end;

procedure Tfrm_DI_adicao.dbrgrp_parcelas1Change(Sender: TObject);
begin
  case dbrgrp_parcelas1.ItemIndex of
    0 : ntbk_parcelas_1.PageIndex := 0;
    1 : ntbk_parcelas_1.PageIndex := 1;
  end;
  rbtn_ind_per_diaria1.Enabled := True;
  rbtn_ind_per_mensal1.Enabled := True;
  if ( Not ( datm_DI_Adicao.qry_adicao_CD_PERIOD_PGTO_360.IsNull ) ) and
     ( datm_DI_Adicao.qry_adicao_CD_PERIOD_PGTO_360.AsString <> '' ) then
  begin
    case datm_DI_Adicao.qry_adicao_CD_PERIOD_PGTO_360.AsInteger of
      1 : begin
            rbtn_ind_per_diaria1.Checked := True;
            rbtn_ind_per_mensal1.Checked := False;
          end;
      2 : begin
            rbtn_ind_per_diaria1.Checked := False;
            rbtn_ind_per_mensal1.Checked := True;
          end;
    end;
  end
  else
  begin
    rbtn_ind_per_diaria1.Checked := False;
    rbtn_ind_per_mensal1.Checked := False;
  end;
  if in_DI_Registrada then
  begin
    rbtn_ind_per_diaria1.Enabled := False;
    rbtn_ind_per_mensal1.Enabled := False;
  end;
end;

procedure Tfrm_DI_adicao.dbrgrp_parcelas2Change(Sender: TObject);
begin
  case dbrgrp_parcelas2.ItemIndex of
    0 : ntbk_parcelas_2.PageIndex := 0;
    1 : ntbk_parcelas_2.PageIndex := 1;
  end;
  rbtn_ind_per_diaria2.Enabled := True;
  rbtn_ind_per_mensal2.Enabled := True;
  if ( Not ( datm_DI_Adicao.qry_adicao_CD_PERIOD_PGTO_360.IsNull ) ) and
     ( datm_DI_Adicao.qry_adicao_CD_PERIOD_PGTO_360.AsString <> '' ) then
  begin
    case datm_DI_Adicao.qry_adicao_CD_PERIOD_PGTO_360.AsInteger of
      1 : begin
            rbtn_ind_per_diaria2.Checked := True;
            rbtn_ind_per_mensal2.Checked := False;
          end;
      2 : begin
            rbtn_ind_per_diaria2.Checked := False;
            rbtn_ind_per_mensal2.Checked := True;
          end;
    end;
  end
  else
  begin
    rbtn_ind_per_diaria2.Checked := False;
    rbtn_ind_per_mensal2.Checked := False;
  end;
  if in_DI_Registrada then
  begin
    rbtn_ind_per_diaria2.Enabled := False;
    rbtn_ind_per_mensal2.Enabled := False;
  end;
end;

procedure Tfrm_DI_adicao.btn_incluir_1Click(Sender: TObject);
var
  frm_Novo_Contrato : Tfrm_Contrato_cambio_antec;
begin
  try
    if Not ( datm_DI_Adicao.qry_ad_cambio_pg_antec_.RequestLive ) then Exit;
    frm_Novo_Contrato := Tfrm_Contrato_cambio_antec.Create( Self );
    datm_DI_Adicao.qry_ad_cambio_pg_antec_.Append;
    datm_DI_Adicao.qry_ad_cambio_pg_antec_VL_VINC_MD_CAMBIO.AsFloat := 0;
    frm_Novo_Contrato.ShowModal;
  except
    { .. }
  end;
end;

procedure Tfrm_DI_adicao.btn_alterar_1Click(Sender: TObject);
var
  frm_Novo_Contrato : Tfrm_Contrato_cambio_antec;
begin
{ if datm_DI_Adicao.qry_ad_cambio_pg_antec_.RecordCount = 0 then Exit;
  try}
    if Not ( datm_DI_Adicao.qry_ad_cambio_pg_antec_.RequestLive ) then Exit;
    if Not ( datm_DI_Adicao.qry_ad_cambio_pg_antec_.State in [dsInsert, dsEdit] ) then
       datm_DI_Adicao.qry_ad_cambio_pg_antec_.Edit;
    frm_Novo_Contrato := Tfrm_Contrato_cambio_antec.Create( Self );
    frm_Novo_Contrato.ShowModal;
    frm_Novo_Contrato.Free;
 { except}
    { .. }
{ end;}
end;

procedure Tfrm_DI_adicao.btn_excluir_1Click(Sender: TObject);
begin
  if datm_DI_Adicao.qry_ad_cambio_pg_antec_.RecordCount = 0 then Exit;
  try
    datm_DI_Adicao.qry_ad_cambio_pg_antec_.Delete;
  except
    { .. }
  end;
end;

procedure Tfrm_DI_adicao.btn_incluir_2Click(Sender: TObject);
var
  frm_Novo_Contrato : Tfrm_Contrato_cambio_avista;
begin
  try
    if Not ( datm_DI_Adicao.qry_ad_cambio_pg_avista_.RequestLive ) then Exit;
    frm_Novo_Contrato := Tfrm_Contrato_cambio_avista.Create( Self );
    datm_DI_Adicao.qry_ad_cambio_pg_avista_.Append;
    datm_DI_Adicao.qry_ad_cambio_pg_avista_VL_VINC_MD_CAMBIO.AsFloat := 0;
    frm_Novo_Contrato.ShowModal;
  except
    { .. }
  end;
end;

procedure Tfrm_DI_adicao.btn_alterar_2Click(Sender: TObject);
var
  frm_Novo_Contrato : Tfrm_Contrato_cambio_avista;
begin
  if Not ( datm_DI_Adicao.qry_ad_cambio_pg_avista_.RequestLive ) then Exit;
  if datm_DI_Adicao.qry_ad_cambio_pg_avista_.RecordCount = 0 then Exit;
  try
    if Not ( datm_DI_Adicao.qry_ad_cambio_pg_avista_.State in [dsInsert, dsEdit] ) then
       datm_DI_Adicao.qry_ad_cambio_pg_avista_.Edit;
    frm_Novo_Contrato := Tfrm_Contrato_cambio_avista.Create( Self );
    frm_Novo_Contrato.ShowModal;
  except
    { .. }
  end;
end;

procedure Tfrm_DI_adicao.btn_excluir_2Click(Sender: TObject);
begin
  if datm_DI_Adicao.qry_ad_cambio_pg_avista_.RecordCount = 0 then Exit;
  try
    datm_DI_Adicao.qry_ad_cambio_pg_avista_.Delete;
  except
    { .. }
  end;
end;

procedure Tfrm_DI_adicao.btn_capa_diClick(Sender: TObject);
begin
  Close;
  frm_DI.i_seletor := 1;
end;

procedure Tfrm_DI_adicao.btn_itens_diClick(Sender: TObject);
begin
  Close;
  frm_DI.i_seletor := 3;
end;

procedure Tfrm_DI_adicao.btn_cancelarClick(Sender: TObject);
begin
  if Application.MessageBox('Deseja cancelar as alterações?', 'Confirmação - Cancelamento', MB_YESNO + MB_ICONQUESTION) = mrYes then
  begin
    ActiveControl := nil;
    in_di_abrindo := True;

    if (datm_DI_Adicao.qry_ad_ii_.State in [dsInsert, dsEdit]) then
      datm_DI_Adicao.qry_ad_ii_.cancel;

    datm_DI_Adicao.qry_adicao_.Cancel;

    nr_adicao := datm_DI_Adicao.qry_adicao_NR_ADICAO.AsString;

    FechaGeral;
    repassa_campos_classif := False;
    AbreGeral;
    pgctrl_adicaoChange(nil);

    in_di_abrindo := False;
    datm_DI_Adicao.VerificaEstado(False);
  end
  else
    Abort;
end;

procedure Tfrm_DI_adicao.sbtn_tab_pais1Click(Sender: TObject);
begin
  Consulta_On_line( 'TPAIS', datm_DI_Adicao.qry_adicao_CD_PAIS_ORIG_MERC, 'Países', 1 );
end;

procedure Tfrm_DI_adicao.sbtn_tab_pais2Click(Sender: TObject);
begin
  Consulta_On_line( 'TPAIS', datm_DI_Adicao.qry_adicao_CD_PAIS_AQUIS_MERC, 'Países', 1 );
end;

procedure Tfrm_DI_adicao.sbtn_tab_pais3Click(Sender: TObject);
begin
  Consulta_On_line( 'TPAIS', datm_DI_Adicao.qry_adicao_CD_PAIS_ORIG_MERC, 'Países', 1 );
end;

procedure Tfrm_DI_adicao.sbtn_tab_pais4Click(Sender: TObject);
begin
  Consulta_On_line( 'TPAIS', datm_DI_Adicao.qry_adicao_CD_PAIS_PROC_MERC, 'Países', 1 );
end;

procedure Tfrm_DI_adicao.btn_co_exportadorClick(Sender: TObject);
begin
  Application.CreateForm(Tfrm_emp_est, frm_emp_est);
  frm_emp_est.Cons_OnLine := datm_DI_Adicao.qry_adicao_CD_FORNECEDOR;
  with frm_emp_est do
  begin
    Caption := Caption + ' [Consulta On-Line]';
    lCons_OnLine := True;
    ShowModal;
    lCons_OnLine := False;
  end;
end;

procedure Tfrm_DI_adicao.btn_co_fabricanteClick(Sender: TObject);
begin
  Application.CreateForm(Tfrm_emp_est, frm_emp_est);
  frm_emp_est.Cons_OnLine := datm_DI_Adicao.qry_adicao_CD_FABRICANTE;
  with frm_emp_est do
  begin
    Caption := Caption + ' [Consulta On-Line]';
    lCons_OnLine := True;
    ShowModal;
    lCons_OnLine := False;
  end;
end;

procedure Tfrm_DI_adicao.sbtn_tab_naladi_shClick(Sender: TObject);
begin
  Consulta_On_line( 'TNALADISH', datm_DI_Adicao.qry_adicao_CD_MERC_NALADI_SH, 'NALADI/SH', 1 );
end;

procedure Tfrm_DI_adicao.sbtn_tab_naladi_nccaClick(Sender: TObject);
begin
  Consulta_On_line( 'TNALADINCCA', datm_DI_Adicao.qry_adicao_CD_MERC_NALADI_NCC, 'NALADI/NCCA', 1 );
end;

procedure Tfrm_DI_adicao.sbtn_tab_moeda_Cond_VendaClick(Sender: TObject);
begin
  vStr_cd_modulo := '22';
  str_cd_rotina := '2215';
  Application.CreateForm(Tfrm_moeda, frm_moeda);
  frm_moeda.Cons_OnLine := datm_DI_Adicao.qry_adicao_CD_MOEDA_NEGOCIADA;
  with frm_moeda do
  begin
    Caption := Caption + ' [Consulta On-Line]';
    lCons_OnLine := True;
    ShowModal;
    lCons_OnLine := False;
  end;
end;

procedure Tfrm_DI_adicao.btn_co_acordo_aladiClick(Sender: TObject);
begin
  Consulta_On_line( 'TNALADINCCA', datm_DI_Adicao.qry_adicao_CD_MERC_NALADI_NCC, 'NALADI/NCCA', 1 );
end;

procedure Tfrm_DI_adicao.btn_co_motivo_sem_cobClick(Sender: TObject);
begin
  Consulta_On_line( 'TMOT_SEM_COBERT_CAMBIAL', datm_DI_Adicao.qry_adicao_CD_MOTIVO_SEM_COB, 'Motivo sem Cobertura Cambial', 1 );
  dbedt_cd_mot_sem_cobertExit(nil);
end;

procedure Tfrm_DI_adicao.btn_co_taxa_juros_BACENClick(Sender: TObject);
begin
  Consulta_On_line( 'TTAXAS_JUROS_BACEN', datm_DI_Adicao.qry_adicao_CD_TAXA_JUROS, 'Taxa de Juros BACEN', 1 );
end;

procedure Tfrm_DI_adicao.btn_co_mod_pagtoClick(Sender: TObject);
begin
  Consulta_On_line( 'TMODALID_PAGAMENTO', datm_DI_Adicao.qry_adicao_CD_MODALIDADE_PGTO, 'Modalidade de Pagamento', 1 );
end;

procedure Tfrm_DI_adicao.btn_local_embarqueClick(Sender: TObject);
begin
  Application.CreateForm(Tfrm_local_embarque, frm_local_embarque);
  frm_local_embarque.Cons_OnLine := datm_DI_Adicao.qry_adicao_CD_LOC_COND_VENDA;
  with frm_local_embarque do
  begin
    Caption := Caption + ' [Consulta On-Line]';
    lCons_OnLine := True;
    ShowModal;
    lCons_OnLine := False;
  end;
end;

procedure Tfrm_DI_adicao.dbedt_cd_fund_legalExit(Sender: TObject);
begin
  datm_DI_Adicao.qry_fund_leg_.Close;
  datm_DI_Adicao.qry_fund_leg_.ParamByName('CODIGO').AsString := datm_DI_Adicao.qry_adicao_CD_FUND_LEG_REGIME.AsString;
  datm_DI_Adicao.qry_fund_leg_.Prepare;
  datm_DI_Adicao.qry_fund_leg_.Open;
end;

procedure Tfrm_DI_adicao.dbedt_cd_urf_entradaExit(Sender: TObject);
begin
  datm_DI_Adicao.qry_urf_entrada_.Close;
  datm_DI_Adicao.qry_urf_entrada_.ParamByName('CODIGO').AsString := datm_DI_Adicao.qry_adicao_CD_FUND_LEG_REGIME.AsString;
  datm_DI_Adicao.qry_urf_entrada_.Prepare;
  datm_DI_Adicao.qry_urf_entrada_.Open;
end;

procedure Tfrm_DI_adicao.btn_co_incotermClick(Sender: TObject);
begin
  Consulta_On_line( 'TINCOTERMS_VENDA', datm_DI_Adicao.qry_adicao_CD_INCOTERMS_VENDA, 'INCOTERMS', 1 );
end;

procedure Tfrm_DI_adicao.btn_co_Reg_TribClick(Sender: TObject);
begin
  Consulta_On_line( 'TREG_TRIBUTARIO', datm_DI_Adicao.qry_adicao_CD_REGIME_TRIBUTAR, 'REGIME TRIBUTARIO', 1 );
end;

procedure Tfrm_DI_adicao.btn_co_met_valoracaoClick(Sender: TObject);
begin
  Consulta_On_line( 'TMETODO_VALOR_ADUANEIRA', datm_DI_Adicao.qry_adicao_CD_METOD_VALORACAO, 'Método de Valoração Aduaneira', 1 );
end;

procedure Tfrm_DI_adicao.DBNavigator1Click(Sender: TObject; Button: TNavigateBtn);
begin
  in_change_adicao        := True;
  if i_Tipo_Declaracao in [16, 17, 18] then tbsht_carga.TabVisible := True;

  if i_Tipo_Declaracao in [20, 21] then
  begin
    lbl_via_transp.Visible       := False;
    dblkpcbox_via_transp.Visible := False;
    tbsht_carga.TabVisible       := True;
  end;

  if i_Tipo_Declaracao = 19 then
  begin
    tbsht_fornecedor_fabricante.TabVisible := False;
    tbsht_valor_aduaneiro.TabVisible       := False;
    tbsht_tributos.TabVisible              := False;
    tbsht_tributo_TD19.TabVisible          := True;
  end;

  if datm_DI_Adicao.qry_adicao_IN_MATERIAL_USADO.AsBoolean then
  begin
    rbtn_material_usado.Checked    := True;
    rbtn_Bem_sob_encomenda.Checked := False;
  end
  else {tbl_adicao_IN_MATERIAL_USADO}
  begin
    if datm_DI_Adicao.qry_adicao_IN_BEM_ENCOMENDA.AsBoolean then
    begin
      rbtn_material_usado.Checked    := False;
      rbtn_Bem_sob_encomenda.Checked := True;
    end
    else {tbl_adicao_IN_BEM_ENCOMENDA}
    begin
      rbtn_material_usado.Checked    := False;
      rbtn_Bem_sob_encomenda.Checked := False;
    end;
  end;
  if in_DI_Registrada then
  begin
    rbtn_material_usado.Enabled    := False;
    rbtn_Bem_sob_encomenda.Enabled := False;
  end;

  dbrgrp_fabr_expoChange(Sender);

  with datm_DI_Adicao do
  begin
    {Mercadoria NVE}
    if qry_nve_.Active then qry_nve_.Close;
    qry_nve_.ParamByName('NR_PROCESSO').AsString := str_nr_processo;
    qry_nve_.ParamByName('NR_ADICAO').AsString := datm_DI_Adicao.qry_adicao_NR_ADICAO.AsString;
    qry_nve_.Prepare;
    qry_nve_.Open;

    {if datm_DI_Adicao.qry_nve_.RecordCount > 0  then
    begin
      btn_alterar_item_numerario.Enabled := True;
      btn_excluir_item_numerario.Enabled := True;
    end
    else
    begin
      btn_alterar_item_numerario.Enabled := False;
      btn_excluir_item_numerario.Enabled := False;
    end;}

    {Câmbio}
    if ( pgctrl_adicao.ActivePage = tbsht_cambio1 ) then
    begin
      qry_ad_cambio_pg_antec_.Close;
      qry_ad_cambio_pg_antec_.Prepare;
      qry_ad_cambio_pg_antec_.Open;
      qry_ad_cambio_pg_avista_.Close;
      qry_ad_cambio_pg_avista_.Prepare;
      qry_ad_cambio_pg_avista_.Open;
      if in_DI_Registrada then
      begin
        case qry_adicao_CD_COBERT_CAMBIAL.AsInteger of
          1: rbtn_cambial_Ate180.Checked        := True;
          2: rbtn_cambial_De180_360.Checked     := True;
          3: rbtn_cambial_Acima360.Checked      := True;
          4: rbtn_cambial_Sem_Cobertura.Checked := True;
        end;
        rbtn_cambial_Ate180.Enabled             := False;
        rbtn_cambial_De180_360.Enabled          := False;
        rbtn_cambial_Acima360.Enabled           := False;
        rbtn_cambial_Sem_Cobertura.Enabled      := False;
      end
      else
      begin
        case qry_adicao_CD_COBERT_CAMBIAL.AsInteger of
          1: rbtn_cambial_Ate180.Checked        := True;
          2: rbtn_cambial_De180_360.Checked     := True;
          3: rbtn_cambial_Acima360.Checked      := True;
          4: rbtn_cambial_Sem_Cobertura.Checked := True;
        end;
      end;

      if dbedt_cd_mot_sem_cobert.Enabled then dbedt_cd_mot_sem_cobertExit(nil);
      pgctrl_pg_cambio1.ActivePage := tbsht_pg_cambio_antec1;
      pgctrl_pg_cambio2.ActivePage := tbsht_pg_cambio_antec2;
      dbrgrp_parcelas1Change(nil);
      dbrgrp_parcelas2Change(nil);
    end;

    if ( pgctrl_adicao.ActivePage = tbsht_tributos ) then
    begin
       Controla_Tela_Tributos;
       Tributo_ICMS;
    end;
  end;
  in_change_adicao        := False;
end;

procedure Tfrm_DI_adicao.FormCreate(Sender: TObject);
begin
  Screen.Cursor := crHourGlass;
  Application.ProcessMessages;

  btn_trans_DI.Enabled  := frm_DI.btn_trans_DI.Enabled;
  btn_Retificar.Visible := frm_DI.btn_Retificar.Visible;
  btn_Retificar.Enabled := frm_DI.btn_Retificar.Enabled;

  { Inicializa o Data Module para Senha }
  Application.CreateForm( Tdatm_DI_Adicao, datm_DI_Adicao );

  pgctrl_adicao.ActivePage := tbsht_fornecedor_fabricante;

  // Painel do Fundo de Pobreza - Michel - 08/03/2010
  if not datm_DI_Adicao.in_RJ then
  begin
    pnlFundoPobreza.Visible := False;
    Panel4.Top              := pnlFundoPobreza.Top;
    GroupBox1.Height        := 310;
  end;
  GroupBox1.Top  := (tbsht_tributo_ICMS.ClientHeight div 2) - (GroupBox1.Height div 2);
  GroupBox1.Left := (tbsht_tributo_ICMS.ClientWidth div 2) - (GroupBox1.Width div 2);

  // Incluído para permitir que o gestor altere o campo, pois pediam demais ao TI - Michel - 04/07/2012
  dbedt_nr_licenciamento.ReadOnly := str_cd_cargo <> '104';
end;

procedure Tfrm_DI_adicao.grpbox_cond_mercadoriaClick(Sender: TObject);
begin
  if ( in_di_abrindo or in_DI_Registrada or in_change_adicao ) then Exit;
  begin
    rbtn_material_usado.Checked    := False;
    rbtn_Bem_sob_encomenda.Checked := False;
    with datm_DI_Adicao do
    begin
      if Not( qry_adicao_.State in [dsEdit,dsInsert] ) then qry_adicao_.Edit;
      qry_adicao_IN_MATERIAL_USADO.AsBoolean := False;
      qry_adicao_IN_BEM_ENCOMENDA.AsBoolean  := False;
    end;
    grpbox_cond_mercadoria.SetFocus;
  end;
end;

procedure Tfrm_DI_adicao.rbtn_material_usadoClick(Sender: TObject);
begin
  with datm_DI_Adicao do
  begin
    if ( in_di_abrindo or in_DI_Registrada or in_change_adicao ) then Exit;
    begin
      if Not( qry_adicao_.State in [dsEdit,dsInsert] ) then qry_adicao_.Edit;
      if rbtn_material_usado.Checked then
      begin
        qry_adicao_IN_MATERIAL_USADO.AsBoolean := True;
        qry_adicao_IN_BEM_ENCOMENDA.AsBoolean  := False;
      end
      else
      if rbtn_Bem_sob_encomenda.Checked then
      begin
        qry_adicao_IN_MATERIAL_USADO.AsBoolean := False;
        qry_adicao_IN_BEM_ENCOMENDA.AsBoolean  := True;
      end
      else
      begin
        qry_adicao_IN_MATERIAL_USADO.AsBoolean := False;
        qry_adicao_IN_BEM_ENCOMENDA.AsBoolean  := False;
      end;
    end;
  end;
end;

procedure Tfrm_DI_adicao.dbedt_cd_inst_financExit(Sender: TObject);
begin
  with datm_DI_Adicao do
  begin
    qry_inst_financ_.Close;
    qry_inst_financ_.ParamByName('CODIGO').AsString := qry_Adicao_CD_ORGAO_FIN_INTER.AsString;
    qry_inst_financ_.Prepare;
    qry_inst_financ_.Open;
  end;
end;

procedure Tfrm_DI_adicao.btn_co_inst_financClick(Sender: TObject);
begin
  Consulta_On_line( 'TINST_FINANC_INTERNACIONAL', datm_DI_Adicao.qry_Adicao_CD_ORGAO_FIN_INTER, 'Instituição Financiadora Internacional', 1 );
  dbedt_cd_inst_financExit(nil);   {luiz 20/08}
end;

procedure Tfrm_DI_adicao.btn_excluirClick(Sender: TObject);
begin
  if BoxMensagem( 'Esta adição será excluída! Confirma exclusão?', 1 ) then
  begin
    try
      datm_main.db_broker.StartTransaction;
      nr_adicao := StrZero( ( StrToInt( datm_DI_Adicao.qry_adicao_NR_ADICAO.AsString ) ), 3) ;

      FechaGeral;
      CloseStoredProc(datm_DI_Adicao.sp_exclui_adicao);
      datm_DI_Adicao.sp_exclui_adicao.ParamByName('@NR_PROCESSO').AsString := str_nr_processo;
      datm_DI_Adicao.sp_exclui_adicao.ParamByName('@NR_ADICAO').AsString   := nr_adicao;
      ExecStoredProc(datm_DI_Adicao.sp_exclui_adicao);
      CloseStoredProc(datm_DI_Adicao.sp_exclui_adicao);
      datm_main.db_broker.Commit;

      AbreGeral;

      pgctrl_adicaoChange(Sender);

    except
      on E: Exception do
      begin
        frm_DI_adicao.btn_cancelarClick(nil);
        if datm_main.db_broker.InTransaction then datm_main.db_broker.Rollback;
        TrataErro(E);
      end;
    end;
  end;
  datm_DI_Adicao.VerificaEstado(False);
end;

procedure Tfrm_DI_adicao.dbedt_ag_identificacaoExit(Sender: TObject);
begin
  if ( Not btn_salvar.Enabled ) or in_DI_Registrada then Exit;
  if datm_DI_Adicao.qry_adicao_.State in [dsEdit, dsInsert] then
    if Length ( dbedt_ag_identificacao.Text ) = 14 then
       datm_DI_Adicao.qry_adicao_CD_TIPO_AGENTE_IMP.Text := '1'
    else
       datm_DI_Adicao.qry_adicao_CD_TIPO_AGENTE_IMP.Text := '2';
end;

procedure Tfrm_DI_adicao.dblkcbox_acordo_tarifExit(Sender: TObject);
begin
  if datm_DI_Adicao.qry_adicao_CD_TIPO_ACORDO_TAR.Text = '' then
  begin
    dbedt_ex_ato_legal_acordo_tar.Enabled        := False;
    dbedt_nr_ato_legal_acordo_tar.Enabled        := False;
    dbedt_dt_ano_ato_legal_acordo_tar.Enabled    := False;
    dblkpcbox_tipo_ato_legal_acordo_tar.Enabled  := False;
    dblkpcbox_orgao_ato_legal_acordo_tar.Enabled := False;
    if ( Not in_DI_Registrada ) and btn_salvar.Enabled then
    begin
      datm_DI_Adicao.tbl_ad_ato_legal_acordo_tar_.Close;
      datm_DI_Adicao.tbl_ad_ato_legal_acordo_tar_.Open;
      if datm_DI_Adicao.tbl_ad_ato_legal_acordo_tar_.RecordCount > 0 then
      begin
        datm_DI_Adicao.tbl_ad_ato_legal_acordo_tar_.Delete;
      end;
    end;
  end
  else
  begin
    dbedt_ex_ato_legal_acordo_tar.Enabled        := True;
    dbedt_nr_ato_legal_acordo_tar.Enabled        := True;
    dbedt_dt_ano_ato_legal_acordo_tar.Enabled    := True;
    dblkpcbox_tipo_ato_legal_acordo_tar.Enabled  := True;
    dblkpcbox_orgao_ato_legal_acordo_tar.Enabled := True;
  end;
end;

procedure Tfrm_DI_adicao.dbedt_cd_incotermExit(Sender: TObject);
begin
  if ( Not btn_salvar.Enabled ) or in_DI_Registrada then Exit;
  if ( Not datm_DI_adicao.tbl_incoterms_.FindKey([dbedt_cd_incoterm.Text]) ) and
     (dbedt_cd_incoterm.Text <> '') then
  begin
    BoxMensagem('Código do INCOTERM inválido!',2);
    dbedt_cd_incoterm.SetFocus;
    Exit;
  end;

  with datm_DI_Adicao do
  begin
    qry_assoc_acresc_.Close;
    qry_assoc_acresc_.ParamByName('COD_INCOTERMS').AsString := qry_adicao_CD_INCOTERMS_VENDA.AsString;
    qry_assoc_acresc_.Prepare;
    qry_assoc_acresc_.Open;

    qry_assoc_ded_.Close;
    qry_assoc_ded_.ParamByName('COD_INCOTERMS').AsString    := qry_adicao_CD_INCOTERMS_VENDA.AsString;
    qry_assoc_ded_.Prepare;
    qry_assoc_ded_.Open;

    tbl_ad_acrescimos_.Refresh;
    tbl_ad_deducoes_.Refresh;

  end;
end;

procedure Tfrm_DI_adicao.dbedt_aliq_reduzidaExit(Sender: TObject);
begin
  if ( Not btn_salvar.Enabled ) then Exit;
  if Not in_DI_Registrada then
    if dbedt_aliq_reduzida.Field.AsFloat > 0 then
    begin
      dbedt_pc_reducao.Color := clMenu;
      dbedt_pc_reducao.Enabled := False;
      if dbedt_pc_reducao.Field.DataSet.State in [dsEdit, dsInsert] then
      begin
        dbedt_pc_reducao.Field.DataSet.Edit;
        dbedt_pc_reducao.Field.AsFloat := 0;
        dbedt_pc_reducao.Field.DataSet.Post;
      end;
    end
    else
    begin
      dbedt_pc_reducao.Color := clWindow;
      dbedt_pc_reducao.Enabled := True;
    end;
end;

procedure Tfrm_DI_adicao.dbedt_pc_reducaoExit(Sender: TObject);
begin
  if ( Not btn_salvar.Enabled ) then Exit;
  if ( Not in_DI_Registrada ) and Not ( dbedt_aliq_reduzida.Field.DataSet.State in [dsInsert, dsEdit]) then
    if dbedt_pc_reducao.Field.AsFloat > 0 then
    begin
      dbedt_aliq_reduzida.Color := clMenu;
      dbedt_aliq_reduzida.Enabled := False;
      dbedt_aliq_reduzida.Field.DataSet.Edit;
      dbedt_aliq_reduzida.Field.AsFloat := 0;
      dbedt_aliq_reduzida.Field.DataSet.Post;
    end
    else
    begin
      dbedt_aliq_reduzida.Color := clWindow;
      dbedt_aliq_reduzida.Enabled := True;
    end;
end;

procedure Tfrm_DI_adicao.btn_calculoClick(Sender: TObject);
var
  vQryItensAux : TQuery;
  vReferenciaErrada : Boolean;
begin

  vReferenciaErrada := False;

  vQryItensAux := TQuery.Create(Application);
  vQryItensAux.DatabaseName := 'DBBROKER';
  vQryItensAux.SQL.Clear;
  vQryItensAux.SQL.Add('SELECT NR_PROCESSO, NR_PROC_PO, NR_ITEM_PO, NR_ITEM, NR_ADICAO FROM TDETALHE_MERCADORIA (NOLOCK)');
  vQryItensAux.SQL.Add(' WHERE NR_PROCESSO = ''' + datm_di_adicao.qry_adicao_.FieldByName('NR_PROCESSO').AsString + '''');
  vQryItensAux.Open;
  with TQuery.Create(Application) do
  begin
    DatabaseName := 'DBBROKER';
    while not vQryItensAux.EOF do
    begin
      SQL.Clear;
      SQL.Add('SELECT COUNT(*) FROM TREF_CLIENTE (NOLOCK)');
      SQL.Add(' WHERE NR_PROCESSO   = ''' + vQryItensAux.Fields[0].AsString + '''');
      SQL.Add('   AND CD_REFERENCIA = ''' + vQryItensAux.Fields[1].AsString + '''');
      SQL.Add('   AND NR_ITEM_PO    = ''' + vQryItensAux.Fields[2].AsString + '''');
      SQL.Add('   AND TP_REFERENCIA = ''' + '01''' );
      Open;
      if Fields[0].AsInteger = 0 then
      begin
        vReferenciaErrada := True;
        BoxMensagem('O item "'+vQryItensAux.Fields[3].AsString+'" da adição "'+vQryItensAux.Fields[4].AsString+'" deste processo está impedindo o seu calculo.'
        + #10#13 + 'A referência "' + vQryItensAux.Fields[1].AsString + '" com o item "' + vQryItensAux.Fields[2].AsString + '", não foi encontrada em suas referências.'
        + #10#13 + 'Para incluir a referência, entre na guia "Referências", na tela de "Manutenção de Processos"', 2);
      end;
      Close;
      vQryItensAux.Next;
    end;
  end;

  if vReferenciaErrada then
    Exit;

  if btn_salvar.Enabled then btn_salvarClick(Sender);

  nr_adicao := datm_DI_Adicao.qry_adicao_NR_ADICAO.AsString;

  datm_DI_Adicao.qry_adicao_.DisableControls;
  FechaGeral;

  // As linhas abaixo foram substituidas para evitar erros de impostos quando calculado pela adição - Michel - 15/12/2008 - Ocorrência 04591/08
  // Em caso de erros futuros, descomentar as linhas abaixo e excluir as linhas marcadas com a ocorrência acima

  //Application.CreateForm(Tdatm_di_capa, datm_di_capa);

  Application.CreateForm(Tfrm_di_capa, frm_di_capa); // Ocorrência 04591/08
  frm_DI_capa.FormShow(frm_DI_capa); // Ocorrência 07919/09

  //datm_DI_capa.qry_di_.Close;
  //datm_di_capa.qry_di_.ParamByName('NR_PROCESSO').AsString := str_nr_processo;
  //datm_di_capa.qry_di_.Prepare;
  //datm_di_capa.qry_di_.Open;
  //datm_di_capa.RateioAcreDeduc;

  //BoxMensagem( fsp_di_calculo( str_nr_processo, True ), 3 );
  frm_DI_capa.btn_calculoClick(frm_DI_capa.btn_calculo);
  //frm_DI_capa.Write_Carga2;                                 // Ocorrência 04591/08
  if datm_DI_Capa.qry_di_.State in [dsEdit, dsInsert] then  // Ocorrência 04591/08
    datm_DI_Capa.qry_di_.Post;                              // Ocorrência 04591/08
  frm_DI_capa.Close;                                        // Ocorrência 04591/08

  AbreGeral;
  GuardaTaxaCambialAdicao;
  pgctrl_adicaoChange(Sender);

  datm_DI_Adicao.qry_adicao_.EnableControls;

end;

procedure Tfrm_DI_adicao.dbedt_cd_local_embarque2Exit(Sender: TObject);
begin
  if btn_salvar.Enabled then
  begin
    if Not (dbedt_cd_local_embarque2.Field.Dataset.State in [dsEdit, dsInsert]) then
       dbedt_cd_local_embarque2.Field.Dataset.Edit;
    if ( Not in_DI_Registrada ) then ValidCodigo( dbedt_cd_local_embarque2 );
  end;
end;

procedure Tfrm_DI_adicao.dbedt_nr_adicaoChange(Sender: TObject);
begin
  edtItemDireto.text := dbedt_nr_adicao.text;

  if ((pgctrl_adicao.ActivePage = tbsht_tributos) and (pgctrl_tributos.ActivePage = tbsht_tributo_ICMS)) then //incluido André
    AtualizaTelaICMSRJ; // linha incluida por Michel em 17/12/2009 para atualizar a tela de ICMS do Rio quando trocada a Adição

  if (in_di_abrindo or in_DI_Registrada ) then
    Exit;

  if ( pgctrl_adicao.ActivePage = tbsht_tributos ) and
     ( pgctrl_tributos.ActivePage = tbsht_tributo_IPI ) and
     ( ( datm_DI_Adicao.qry_adicao_CD_REGIME_TRIBUTAR.AsString = '2' ) or
       ( datm_DI_Adicao.qry_adicao_CD_REGIME_TRIBUTAR.AsString = '6' ) ) then
  begin
    BoxMensagem( 'Para o Regime de Tributação escolhido não é necessário informar dados de I.P.I.', 2 );
    pgctrl_tributos.ActivePage := tbsht_tributo_II;
    exit;
  end;
end;

procedure Tfrm_DI_adicao.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #27 then Close;
end;

procedure Tfrm_DI_adicao.btn_co_trib_icmsClick(Sender: TObject);
begin
  Cons_On_line( 'DBBROKER', 'TTRIBUTACAO_ICMS', datm_DI_Adicao.qry_adicao_CD_TRIBUTACAO_ICMS, 'Tributação ICMS', 18, '' ,'TTable');
  dbedt_cd_tributacao_icmsExit(nil);
end;

procedure Tfrm_DI_adicao.SpeedButton2Click(Sender: TObject);
begin
  Consulta_On_line( 'TNCM', datm_DI_Adicao.qry_adicao_CD_MERCADORIA_NCM, 'NCM/SH', 1 );
end;

procedure Tfrm_DI_adicao.dbedt_cd_pais_origem1KeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
if key = VK_F5 then
  begin
    if Sender = dbedt_cd_pais_origem1     then sbtn_tab_pais1Click(nil);
    if Sender = dbedt_expo_codigo         then btn_co_exportadorClick(nil);
    if Sender = dbedt_expo_cd_pais        then sbtn_tab_pais2Click(nil);
    if Sender = dbedt_fabr_codigo         then btn_co_fabricanteClick(nil);
    if Sender = dbedt_fabr_cd_pais        then sbtn_tab_pais3Click(nil);
    if Sender = dbedt_cd_ncm_sh           then SpeedButton2Click(nil);
    if Sender = dbedt_cd_naladi_sh        then sbtn_tab_naladi_shClick(nil);
    if Sender = dbedt_cd_naladi_ncca      then sbtn_tab_naladi_nccaClick(nil);
    if Sender = dbedt_cd_incoterm         then btn_co_incotermClick(nil);
    if Sender = dbedt_cd_moeda_cond_venda then sbtn_tab_moeda_Cond_VendaClick(nil);
    if Sender = dbedt_cd_metodo_valoracao then btn_co_met_valoracaoClick(nil);
    if Sender = dbedt_cd_local_embarque2  then btn_local_embarqueClick(nil);
    if Sender = dbedt_cd_reg_trib         then btn_co_Reg_TribClick(nil);
    if ( Sender = dbedt_cd_fund_legal ) and ( btn_co_Fund_legal.Enabled ) then btn_co_Fund_legalClick(nil);
    if Sender = dbedt_cd_tributacao_icms  then btn_co_trib_icmsClick(nil);
    if Sender = dbedt_cd_mot_sem_cobert   then btn_co_motivo_sem_cobClick(nil);
    if Sender = dbedt_cd_mod_pagto_1      then btn_co_mod_pagtoClick(nil);
    if Sender = dbedt_cd_mod_pagto_2      then btn_co_mod_pagtoClick(nil);
    if Sender = dbedt_cd_taxa_juros1      then btn_co_taxa_juros_BACENClick(nil);
    if Sender = dbedt_cd_taxa_juros2      then btn_co_taxa_juros_BACENClick(nil);
    if Sender = dbedt_cd_mot_ad_temp      then btn_co_mot_ad_tempClick(nil);
    if Sender = dbedt_cd_disp_legal       then btn_co_disp_legalClick(btn_co_disp_legal);
    if Sender = dbedt_cd_fund_legal_ii_duimp then btn_co_Fund_legal_ii_duimpClick(nil);
    if Sender = dbedt_cd_fund_legal_ipi_duimp then btn_co_Fund_legal_ipi_duimpClick(nil);
    if Sender = dbedt_cd_fund_legal_piscofins_duimp then btn_co_Fund_legal_piscofins_duimpClick(nil);
  end;
end;

procedure Tfrm_DI_adicao.dbedt_expo_cd_paisExit(Sender: TObject);
begin
  if Not dbedt_expo_cd_pais.Modified then Exit;
  ValidCodigo(dbedt_expo_cd_pais);
end;

procedure Tfrm_DI_adicao.dbedt_fabr_cd_paisExit(Sender: TObject);
begin
  if Not dbedt_fabr_cd_pais.Modified then Exit;
  ValidCodigo(dbedt_fabr_cd_pais);
end;

procedure Tfrm_DI_adicao.dbedt_expo_codigoExit(Sender: TObject);
begin
  if datm_DI_Adicao.qry_adicao_.State in [dsInsert, dsEdit] then
     ValidCodigo(dbedt_expo_codigo);
end;

procedure Tfrm_DI_adicao.dbedt_fabr_codigoExit(Sender: TObject);
begin
  if datm_DI_Adicao.qry_adicao_.State in [dsInsert, dsEdit] then
     ValidCodigo(dbedt_fabr_codigo);
end;

procedure Tfrm_DI_Adicao.AtoVinculadoAcordoTarif;
begin
  with datm_DI_adicao do
  begin
    if ( ( dbedt_ex_ato_legal_acordo_tar.Text     <> '' ) or
         ( dbedt_nr_ato_legal_acordo_tar.Text     <> '' ) or
         ( dbedt_dt_ano_ato_legal_acordo_tar.Text <> '' ) ) and
         ( qry_adicao_CD_TIPO_ACORDO_TAR.AsString <> '' ) then
    begin
      if ( tbl_ad_ato_legal_acordo_tar_.State in [dsInsert, dsEdit] ) then
      begin
        case qry_adicao_CD_TIPO_ACORDO_TAR.AsInteger of
          2:    tbl_ad_ato_legal_acordo_tar_CD_ASSUNTO_VINCUL.AsString := '3';
          3, 4: tbl_ad_ato_legal_acordo_tar_CD_ASSUNTO_VINCUL.AsString := '5';
        end;
      end;
    end
    else
    begin
      if ( not in_DI_Registrada ) and btn_salvar.Enabled then
      begin
        datm_DI_Adicao.tbl_ad_ato_legal_acordo_tar_.Close;
        datm_DI_Adicao.tbl_ad_ato_legal_acordo_tar_.Open;
        if datm_DI_Adicao.tbl_ad_ato_legal_acordo_tar_.RecordCount > 0 then
        begin
          datm_DI_Adicao.tbl_ad_ato_legal_acordo_tar_.Delete;
        end;
      end;
    end;
  end;
end;


procedure Tfrm_DI_adicao.dbedt_ex_ato_legal_acordo_tarExit(
  Sender: TObject);
begin
  AtoVinculadoAcordoTarif;
end;

procedure Tfrm_DI_adicao.dbedt_ex_ato_legal_benef_ipiExit(Sender: TObject);
begin
  if ( dbedt_ex_ato_legal_benef_ipi.Text     = '' ) and
     ( dbedt_nr_ato_legal_benef_ipi.Text     = '' ) and
     ( dbedt_dt_ano_ato_legal_benef_ipi.Text = '' ) then
  begin
    if ( not in_DI_Registrada ) and btn_salvar.Enabled then
    begin
      datm_DI_Adicao.tbl_ad_ato_legal_benef_ipi_.Close;
      datm_DI_Adicao.tbl_ad_ato_legal_benef_ipi_.Open;
      if datm_DI_Adicao.tbl_ad_ato_legal_benef_ipi_.RecordCount > 0 then
      begin
        datm_DI_Adicao.tbl_ad_ato_legal_benef_ipi_.Delete;
      end;
    end;
  end;
end;

procedure Tfrm_DI_adicao.dbedt_ex_ato_legal_antidumpExit(Sender: TObject);
begin
  if ( dbedt_ex_ato_legal_antidump.Text     = '' ) and
     ( dbedt_nr_ato_legal_antidump.Text     = '' ) and
     ( dbedt_dt_ano_ato_legal_antidump.Text = '' ) then
  begin
    if ( Not in_DI_Registrada ) and btn_salvar.Enabled then
    begin
      datm_DI_Adicao.tbl_ad_ato_legal_antidump_.Close;
      datm_DI_Adicao.tbl_ad_ato_legal_antidump_.Close;
      datm_DI_Adicao.tbl_ad_ato_legal_antidump_.Open;
      if datm_DI_Adicao.tbl_ad_ato_legal_antidump_.RecordCount > 0 then
      begin
        datm_DI_Adicao.tbl_ad_ato_legal_antidump_.Delete;
      end;
    end;
  end;
end;

function Tfrm_DI_adicao.AtzTaxaCambialAdicao( Moeda : String ): Double;
var
  i : Integer;
  TaxaOk : Boolean;
begin
  AtzTaxaCambialAdicao := 0;
  TaxaOk := False;
  for i := 1 to 4 do {Tenta localizar taxa dentre as moedas utilizadas no processo}
  begin
    if Moeda = aMoedas[i] then
    begin
      AtzTaxaCambialAdicao := aTaxas[i];
      TaxaOk := True;
    end;
  end;
  if Not TaxaOk then {Tenta localizar taxa no Histórico de Taxas de Câmbio no dia do Registro da DI}
  begin
    with datm_DI_Adicao do
    begin
      qry_taxa_cambio_.Close;
      qry_taxa_cambio_.ParamByName('CD_MOEDA').AsString  := Moeda;
      qry_taxa_cambio_.ParamByName('DT_REGISTRO').AsDate :=
         StrToDate( Copy( qry_di_DT_REGISTRO_DI.AsString, 1, 2) + '/' +
                    Copy( qry_di_DT_REGISTRO_DI.AsString, 3, 2) + '/' +
                    Copy( qry_di_DT_REGISTRO_DI.AsString, 5, 4) );
      qry_taxa_cambio_.Prepare;
      qry_taxa_cambio_.Open;
      if qry_taxa_cambio_.RecordCount > 0 then
         AtzTaxaCambialAdicao := qry_taxa_cambio_TX_CAMBIO.AsFloat
      else
      begin
        AtzTaxaCambialAdicao := 0;
        BoxMensagem('Taxa de Câmbio para moeda ' + Moeda + ' não cadastrada em ' +
           Copy( qry_di_DT_REGISTRO_DI.AsString, 1, 2) + '/' +
           Copy( qry_di_DT_REGISTRO_DI.AsString, 3, 2) + '/' +
           Copy( qry_di_DT_REGISTRO_DI.AsString, 5, 4) + '!', 2);
      end;
      qry_taxa_cambio_.Close;
    end;
  end;
end;

procedure Tfrm_DI_adicao.GuardaTaxaCambialAdicao;
var
  i : Integer;
begin
  with datm_DI_Adicao do
  begin
    for i:=1 to 4 do
    begin
      aMoedas[i] := '';
      aTaxas[i]  := 0;
    end;

    aMoedas[1] := '220';
    aTaxas[1]  := qry_adicao_TX_DOLAR.AsFloat;

    if qry_adicao_CD_MOEDA_MLE.AsString <> '' then
    begin
      aMoedas[2] := qry_adicao_CD_MOEDA_MLE.AsString;
      aTaxas[2]  := qry_adicao_TX_MLE.AsFloat;
    end;
    if qry_adicao_CD_MD_FRETE_MERC.AsString <> '' then
    begin
      aMoedas[3] := qry_adicao_CD_MD_FRETE_MERC.AsString;
      aTaxas[3]  := qry_adicao_TX_FRETE.AsFloat;
    end;
    if qry_adicao_CD_MOEDA_SEG_MERC.AsString <> '' then
    begin
      aMoedas[4] := qry_adicao_CD_MOEDA_SEG_MERC.AsString;
      aTaxas[4]  := qry_adicao_TX_SEGURO.AsFloat;
    end;
  end;
end;

procedure Tfrm_DI_adicao.dbedt_cd_moeda_cond_vendaExit(Sender: TObject);
begin
  if ( ( dbedt_cd_moeda_cond_venda.Text <> '' ) and ( str_cd_moeda_mle <> dbedt_cd_moeda_cond_venda.Text ) ) then
  begin
    if frm_DI.in_DI_Retificacao then
    begin
      if datm_DI_Adicao.qry_adicao_.State in [dsEdit] then
         datm_DI_Adicao.qry_adicao_TX_MLE.AsFloat :=
            AtzTaxaCambialAdicao( dbedt_cd_moeda_cond_venda.Text );
      BoxMensagem('Moeda alterada. Recalcule o processo!', 3);
    end;
  end;
end;

procedure Tfrm_DI_adicao.dbedt_cd_moeda_cond_vendaEnter(Sender: TObject);
begin
  str_cd_moeda_mle := datm_DI_Adicao.qry_adicao_CD_MOEDA_MLE.AsString;
end;

procedure Tfrm_DI_adicao.btn_co_mot_ad_tempClick(Sender: TObject);
begin
  Consulta_On_line( 'TMOT_ADMISSAO_TEMP', datm_DI_Adicao.qry_adicao_CD_MOTIVO_ADM_TEMP, 'MOTIVO DA ADMISSÃO TEMPORÁRIA', 1 );
end;

procedure Tfrm_DI_adicao.btn_co_disp_legalClick(Sender: TObject);
var vTipoDispositivo : string;
begin
  if Sender is TSpeedButton then begin
    if not PoeEmEdicao(datm_DI_Adicao.qry_adicao_) then exit;

    if dbedt_cd_tributacao_icms.Text = '3' then
      vTipoDispositivo := '5'
    else if dbedt_cd_tributacao_icms.Text = '5' then
      vTipoDispositivo := '2'
    else if dbedt_cd_tributacao_icms.Text = '6' then
      vTipoDispositivo := '4'
    else if dbedt_cd_tributacao_icms.Text = '7' then
      vTipoDispositivo := '3'
    else if dbedt_cd_tributacao_icms.Text = '4' then
      vTipoDispositivo := '7';

    datm_DI_Adicao.qry_adicao_CD_FUND_LEGAL_ICMS.AsString := ConsultaOnLineExFiltro('TTP_EXONERACAO','Dispositivo Legal',['CD_EX','NM_EX'],['Código','Descrição'],'CD_EX','CD_TRIB = ''' + vTipoDispositivo + '''',nil)
  end else begin
    dbedt_nm_disp_legal.Text := ConsultaLookUP('TTP_EXONERACAO','CD_EX', dbedt_cd_disp_legal.Text,'NM_EX');
    if Length(dbedt_cd_disp_legal.Text) = 3 then
      ValidaDispositivo;
  end;
end;

procedure Tfrm_DI_adicao.btn_co_Fund_legalClick(Sender: TObject);
begin
  Consulta_On_line( 'TFUND_LEG_REG_TRIBUT', datm_DI_Adicao.qry_adicao_CD_FUND_LEG_REGIME, 'FUNDAMENTO LEGAL', 1 );
end;

procedure Tfrm_DI_adicao.dbedt_cd_disp_legalExit(Sender: TObject);
begin
  ValidCodigo( dbedt_cd_disp_legal );

  if vDispositivoIlegal then
  begin
    if (dbedt_cd_disp_legal.Text = '055') then
    begin
      BoxMensagem( 'CAT63 não permitido.', 3 );
      dbedt_cd_disp_legal.Clear;
      if (datm_DI_Adicao.qry_adicao_.State in [dsEdit, dsInsert]) then
        datm_DI_Adicao.qry_adicao_.Cancel;
      dbedt_cd_disp_legal.SetFocus;
      Exit;
    end;
    if (dbedt_cd_disp_legal.Text <> '') then
    begin
      BoxMensagem( 'Dispositivo Legal não cadastrado para esse regime de tributação!', 3 );
      dbedt_cd_disp_legal.SetFocus;
    end;
    if Not (datm_DI_Adicao.qry_adicao_.State in [dsEdit, dsInsert]) then datm_DI_Adicao.qry_adicao_.Edit;
    datm_DI_Adicao.qry_adicao_.FieldByName('CD_FUND_LEGAL_ICMS').Clear;
  end;

  if (dbedt_cd_disp_legal.Text <> '') then
  begin
    if (dbedt_nm_disp_legal.Text = '') then
    begin
      BoxMensagem( 'Dispositivo Legal não cadastrado!', 3 );
      dbedt_cd_disp_legal.SetFocus;
      Exit;
    end;
    Tributo_ICMS;
  end;
end;

procedure Tfrm_di_adicao.ValidaDispositivo;
var
  vTipoDispositivo : string;
  Ano, Mes, Dia : Word;
begin
  // inserido para não fazer verificação se o processo já estiver registrado - Michel - 28/11/2008
  if ConsultaLookUPSQL(' SELECT CASE ' +
                       '          WHEN DT_REGISTRO_DI IS NULL THEN ''0''' +
                       '        ELSE ''1''' +
                       '        END IN_REGISTRADO ' +
                       ' FROM TDECLARACAO_IMPORTACAO (NOLOCK) ' +
                       ' WHERE NR_PROCESSO = ''' + str_nr_processo + '''', 'IN_REGISTRADO') = '1' then
    Exit;


  with TQuery.Create(Application) do
  begin
    try
      DatabaseName := 'DBBROKER';

      if dbedt_cd_tributacao_icms.Text = '3' then
        vTipoDispositivo := '5'
      else if dbedt_cd_tributacao_icms.Text = '5' then
        vTipoDispositivo := '2'
      else if dbedt_cd_tributacao_icms.Text = '6' then
        vTipoDispositivo := '4'
      else if dbedt_cd_tributacao_icms.Text = '7' then
        vTipoDispositivo := '3'
      else if dbedt_cd_tributacao_icms.Text = '8' then
        vTipoDispositivo := '6'
      else if dbedt_cd_tributacao_icms.Text = '4' then
        vTipoDispositivo := '7';

      SQL.Clear;
      SQL.Add('SELECT COUNT(*) FROM TTP_EXONERACAO (NOLOCK) WHERE CD_EX = ''' + dbedt_cd_disp_legal.text + ''' AND CD_TRIB = ''' + vTipoDispositivo + '''');
      Open;
      vDispositivoIlegal := ( Fields[0].AsInteger = 0 );
      Close;
      if vDispositivoIlegal then
        Exit;

      // CHECAGENS DE CAT63
      if dbedt_cd_disp_legal.Text = '055' then
      begin
        // verifica autorização do cliente
        SQL.Clear;
        SQL.Add('SELECT ISNULL(IN_CAT63,0) FROM TEMPRESA_NAC (NOLOCK) WHERE CD_EMPRESA = ( SELECT CD_CLIENTE FROM TPROCESSO (NOLOCK) WHERE NR_PROCESSO = ''' + str_nr_processo + ''')');
        Open;
        vDispositivoIlegal := ( Fields[0].AsInteger = 0 );
        Close;
        if vDispositivoIlegal then
          Exit;

        // verifica prazo de dias
        DecodeDate(now, Ano, Mes, Dia);
        SQL.Clear;
        SQL.Add('SELECT QT_DIAS_CAT63 FROM TPARAMETROS (NOLOCK)');
        Open;
        vDispositivoIlegal := not ( date <= PoeOuTiraDiasUteis(Fields[0].AsInteger,'-',StrToDate(FormatDateTime('dd/mm/yyyy',EndOfAMonth(Ano,Mes)))) );
        Close;
        if vDispositivoIlegal then
          Exit;

        // verifica mercadoria desde item
        SQL.Clear;
        SQL.Add('SELECT COUNT(NR_PROCESSO)');
        SQL.Add('  FROM TDETALHE_MERCADORIA DM (NOLOCK), TMERCADORIA ME (NOLOCK)');
        SQL.Add(' WHERE DM.NR_PROCESSO = ''' + str_nr_processo + '''');
        SQL.Add('   AND DM.NR_ADICAO = ''' + datm_di_adicao.qry_adicao_NR_ADICAO.AsString + '''');
        SQL.Add('   AND ME.CD_MERCADORIA = DM.CD_MERCADORIA');
        SQL.Add('   AND ME.IN_CAT63 = ''0''');
        Open;
        vDispositivoIlegal := ( Fields[0].AsInteger > 0 );
        Close;
        if vDispositivoIlegal then
          Exit;
      end;
    finally
      Free;
    end;
  end;
end;

procedure Tfrm_DI_adicao.Tributo_ICMS;
begin
  with datm_DI_Adicao do
  begin
    if ( qry_disp_legal_.Active = true ) then
    begin
      if ( qry_disp_legal_.Locate( 'CD_EX', dbedt_cd_disp_legal.Text, [loCaseInsensitive] )) then
      begin
        memo_tribut.Text := qry_disp_legal_NM_FUND_LEGAL.AsString;
        if qry_trat_tribut_.Locate( 'CD_TRAT_TRIB_ICMS', qry_disp_legal_CD_TRIB.AsString, [] ) then
        begin
           edt_trat_tribut.Text := qry_trat_tribut_NM_TRAT_TRIB_ICMS.AsString;
        end
        else
        begin
          edt_trat_tribut.Text := '';
          memo_tribut.Text := '';
        end;
      end
      else
      begin
          edt_trat_tribut.Text := '';
          memo_tribut.Text := '';
      end;
    end;
  end;
end;

procedure Tfrm_DI_adicao.Controla_Tela_Tributos;
begin
  if (datm_DI_Adicao.qry_adicao_CD_TRIBUTACAO_ICMS.AsString) = '' then
  begin
    Panel2.Visible := False;
    Exit;
  end;
  Panel2.Visible := True;

  if pgctrl_tributos.ActivePage = tbsht_tributo_ICMS then
  begin

    if vDispositivoIlegal then
    begin
      dbedt_cd_disp_legal.Clear;
      dbedt_nm_disp_legal.Clear;
      dbedt_cd_disp_legalExit(dbedt_cd_disp_legal);
    end;
//    btn_co_disp_legalClick(dbedt_cd_tributacao_icms);

    if ( datm_DI_Adicao.qry_adicao_CD_TRIBUTACAO_ICMS.AsString = '3' ) or ( datm_DI_Adicao.qry_adicao_CD_TRIBUTACAO_ICMS.AsString = '6' ) then
    begin
      //dbedt_pc_icms.Text := '0';
      if (datm_DI_Adicao.qry_adicao_PC_ICMS.AsFloat <> 0) then
        if PoeEmEdicao(datm_DI_Adicao.qry_adicao_) then
          datm_DI_Adicao.qry_adicao_PC_ICMS.AsFloat := 0;
      dbedt_pc_icms.Enabled := False;
    end else
      dbedt_pc_icms.Enabled := True;

    if ( datm_DI_Adicao.qry_adicao_CD_TRIBUTACAO_ICMS.AsInteger in [1,4,5,7] ) then
    begin
      if dbedt_pc_icms.canFocus then
        dbedt_pc_icms.SetFocus;
    end
    else
      Panel2.Visible := False;
  end;
end;

procedure Tfrm_DI_adicao.dbedt_cd_tributacao_icmsExit(Sender: TObject);
begin
  ValidaDispositivo;
  Controla_Tela_Tributos;
end;

procedure Tfrm_DI_adicao.dbedt_cd_tributacao_icmsChange(Sender: TObject);
begin
(*  if datm_DI_Adicao.qry_adicao_CD_TRIBUTACAO_ICMS.AsString = '' then
  begin
    edt_trat_tribut.Text := '';
    memo_tribut.Text := '';
  end;*)
end;

procedure Tfrm_DI_adicao.dbedt_cd_ncm_shChange(Sender: TObject);
begin
  with datm_DI_Adicao.qry_ncm_ do
  begin
    Close;
    ParamByName('CODIGO').asString := Copy(datm_DI_Adicao.qry_adicao_CD_MERCADORIA_NCM.AsString,1,8);
    Open;
  end;
end;

procedure Tfrm_DI_adicao.dbedt_cd_disp_legalChange(Sender: TObject);
begin
  edt_trat_tribut.Text := '';
  memo_tribut.Clear; 
  Tributo_ICMS;
end;

procedure Tfrm_DI_adicao.dbedt_cd_reg_tribChange(Sender: TObject);
begin
  if (datm_DI_Adicao.qry_adicao_.State in [dsInsert, dsEdit]) then
  begin
    if Trim( dbedt_cd_reg_trib.Text ) = '1' then
    begin
       dbedt_cd_fund_legal.TabStop := false;
       if datm_DI_Adicao.qry_adicao_.State in [dsInsert, dsEdit] then datm_DI_Adicao.qry_adicao_CD_FUND_LEG_REGIME.AsString := '';
       dbedt_cd_fund_legal.text := '';
       dbedt_desc_fund_leg.text := '';
       dbedt_cd_fund_legal.ReadOnly := true;
       btn_co_Fund_legal.Enabled := false;
    end
    else
    begin
       dbedt_cd_fund_legal.TabStop := true;
       dbedt_cd_fund_legal.ReadOnly := false;
       btn_co_Fund_legal.Enabled := true;
    end;
    dbedt_QT_MESES_ADM_TEMP.Enabled := dbedt_cd_fund_legal.Text = '37';
    if (not dbedt_QT_MESES_ADM_TEMP.Enabled) and (datm_DI_Adicao.qry_adicao_.State in [dsEdit, dsInsert]) then
      datm_DI_Adicao.qry_adicao_QT_MESES_ADM_TEMP.AsInteger := 0;
    AtualizaCheckBoxSuspensao;
  end;  
end;

procedure Tfrm_DI_adicao.dbedt_cd_metodo_valoracaoExit(Sender: TObject);
begin
  if btn_salvar.Enabled then
  begin
    if Not (dbedt_cd_metodo_valoracao.Field.Dataset.State in [dsEdit, dsInsert]) then
       dbedt_cd_metodo_valoracao.Field.Dataset.Edit;
    if ( Not in_DI_Registrada ) then ValidCodigo( dbedt_cd_metodo_valoracao );
  end;
end;

procedure Tfrm_DI_adicao.dbedt_aliq_ad_valoremExit(Sender: TObject);
begin
  with datm_DI_adicao do
  begin
    qry_ncm_.ParamByName('CODIGO').AsString := Copy(qry_adicao_CD_NCM_SH.AsString,1,8);
    qry_ncm_.Prepare;
    qry_ncm_.Open;
    if StrToFloat( qry_ncm_ALIQUOTA_II.AsString ) <> qry_ad_ii_.FieldByName('PC_ALIQ_NORM_ADVAL').AsFloat then
    begin
      if Not BoxMensagem('Valor da alíquota não confere com o digitado na Mercadoria.' + #13#10 +
         'Continua?', 1) then
      begin
        btn_cancelarClick(nil);
      end;
    end;
    qry_ncm_.Close;
  end;
end;

procedure Tfrm_DI_adicao.dbedt_pc_ipi_ad_valExit(Sender: TObject);
begin
  with datm_DI_adicao do
  begin
    qry_ncm_.ParamByName('CODIGO').AsString := Copy(qry_adicao_CD_NCM_SH.AsString,1,8);
    qry_ncm_.Prepare;
    qry_ncm_.Open;
    if StrToFloat( qry_ncm_ALIQUOTA_IPI.AsString ) <> qry_ad_ipi_.FieldByName('PC_ALIQ_NORM_ADVAL').AsFloat then
    begin
      if Not BoxMensagem('Valor da alíquota não confere com o digitado na Mercadoria.' + #13#10 +
         'Continua?', 1) then
      begin
        btn_cancelarClick(nil);
      end;
    end;
    qry_ncm_.Close;
  end;
end;

procedure Tfrm_DI_adicao.dbedt_aliq_pisEnter(Sender: TObject);
begin
  fAliq_pis :=  datm_di_adicao.qry_adicao_ALIQ_PIS.AsFloat;
end;

procedure Tfrm_DI_adicao.dbedt_aliq_pisExit(Sender: TObject);
begin
  if datm_di_adicao.qry_adicao_.State in [dsEdit] then
    if fAliq_pis <> datm_di_adicao.qry_adicao_ALIQ_PIS.AsFloat then
    begin
      BoxMensagem('A Alíquota do Pis foi alterada.', 3);
      datm_di_adicao.qry_adicao_VL_ALIQUOTA_ESPECIFICA_PIS.Clear;
      datm_di_adicao.qry_adicao_QTD_UNID_ESPECIFICA_PIS.Clear;
      datm_di_adicao.qry_adicao_CD_UNIDADE_MEDIDA_PIS.Clear;
    end;
end;

procedure Tfrm_DI_adicao.dbedt_aliq_cofinsEnter(Sender: TObject);
begin
  fAliq_cofins :=  datm_di_adicao.qry_adicao_ALIQ_COFINS.AsFloat;
end;

procedure Tfrm_DI_adicao.dbedt_aliq_cofinsExit(Sender: TObject);
begin
  if datm_di_adicao.qry_adicao_.State in [ dsEdit] then
    if fAliq_cofins <>  datm_di_adicao.qry_adicao_ALIQ_COFINS.AsFloat then
    begin
      BoxMensagem('A Alíquota do Cofins foi alterada.', 3);
      datm_di_adicao.qry_adicao_VL_ALIQUOTA_ESPECIFICA_COFINS.Clear;
      datm_di_adicao.qry_adicao_QTD_UNID_ESPECIFICA_COFINS.Clear;
      datm_di_adicao.qry_adicao_CD_UNIDADE_MEDIDA_COFINS.Clear;
    end;
end;

function Descricao_PIS_COFINS( tipo:integer ):string;
begin
  // ISENÇÃO PIS/COFINS
  if tipo = 2 then
  begin
    Descricao_PIS_COFINS := 'ISENTO DE COFINS E PIS/PASEP NA IMPORTAÇÃO DE ACORDO COM O ART. 9º, INC. II, ALINEA "f" DA LEI Nº 10.865/2004.';
  end;
  // SUSPENSÃO PIS/COFINS
  if tipo = 3 then
  begin
    Descricao_PIS_COFINS := 'COFINS E PIS/PASEP NA IMPORTAÇÃO SUSPENSO DE ACORDO COM O ART. 14 DA LEI Nº 10.865/2004.';
  end;
end;

procedure Tfrm_DI_adicao.dbedt_QT_MESES_ADM_TEMPKeyPress(Sender: TObject; var Key: Char);
begin
  if not (Key in ['0'..'9', #8]) then
    Key := #0;
end;

procedure Tfrm_DI_adicao.dbrdgr_reg_trib_pis_cofinsChange(Sender: TObject);
begin
  if ( datm_DI_Adicao.qry_adicao_.State in [dsInsert, dsEdit] ) then
  begin
    dbedt_reduc_base.enabled := (dbrdgr_reg_trib_pis_cofins.ItemIndex = 1);

    if dbedt_reduc_base.enabled then
      dbedt_reduc_base.color := clWindow
    else
      dbedt_reduc_base.color := clMenu;

    If datm_di_adicao.qry_adicao_.State in [ dsEdit] then
      datm_DI_Adicao.qry_adicao_TX_PIS_COFINS.Value := Descricao_PIS_COFINS(dbrdgr_reg_trib_pis_cofins.ItemIndex);


    if dbrdgr_reg_trib_pis_cofins.itemindex = 0 then
    begin
      if dbedtCD_FUND_LEGAL_PISCOFINS.edittext <> '' then
      begin
        if not ( datm_DI_Adicao.qry_adicao_.State in [dsInsert, dsEdit] ) then
          datm_di_adicao.qry_adicao_.edit;

        datm_di_adicao.qry_adicao_CD_FUND_LEGAL_PISCOFINS.AsString := '';
      end;

      dbedtCD_FUND_LEGAL_PISCOFINS.Enabled := False;
      btnFundLegal.Enabled                 := false;
    end
    else
    begin
      dbedtCD_FUND_LEGAL_PISCOFINS.Enabled := true;
      btnFundLegal.Enabled                 := true;
    end;

    AtualizaCheckBoxSuspensao;
  end;
end;

procedure Tfrm_DI_adicao.dbedt_cd_reg_tribExit(Sender: TObject);
begin
  if ( datm_DI_Adicao.qry_adicao_.State in [dsInsert, dsEdit] ) then
  begin
//    datm_DI_Adicao.qry_adicao_IN_MANUAL_NCM.AsString := '1';
    if datm_DI_Adicao.qry_adicao_CD_REGIME_TRIBUTAR.AsString = '3' then
      datm_DI_Adicao.qry_adicao_CD_TIPO_BENEF_PIS_COFINS.AsString := '2'
    else if datm_DI_Adicao.qry_adicao_CD_REGIME_TRIBUTAR.AsString = '5' then
      datm_DI_Adicao.qry_adicao_CD_TIPO_BENEF_PIS_COFINS.AsString := '4';
//    else datm_DI_Adicao.qry_adicao_IN_MANUAL_NCM.AsString := '0';
  end;
end;

procedure Tfrm_DI_adicao.btnFundLegalClick(Sender: TObject);
var vRegime : string;
begin
  if Sender is TSpeedButton then
  begin
    if not PoeEmEdicao(datm_DI_Adicao.qry_adicao_) then
      exit;

    case dbrdgr_reg_trib_pis_cofins.ItemIndex of
      0 : vRegime := '1';
      1 : vRegime := '4';
      2 : vRegime := '3';
      3 : vRegime := '5';
      4 : vRegime := '6';
    end;

    datm_DI_Adicao.qry_adicao_CD_FUND_LEGAL_PISCOFINS.AsString := ConsultaOnLineExSQL('SELECT CODIGO,DESCRICAO FROM TFUND_LEG_TRIB_PIS_COFINS (NOLOCK) WHERE ''' + vRegime + ''' IN (REG_TRIBUT_1, REG_TRIBUT_2, REG_TRIBUT_3, REG_TRIBUT_4)', 'FUNDAMENTO LEGAL',['CODIGO','DESCRICAO'],['Código','Descrição'],'CODIGO');
  end
  else
    edtFundLegalPisCofins.Text := ConsultaLookUP('TFUND_LEG_TRIB_PIS_COFINS','CODIGO', datm_DI_Adicao.qry_adicao_CD_FUND_LEGAL_PISCOFINS.AsString,'DESCRICAO')
end;

function Tfrm_DI_adicao.Consiste: Boolean;
var
viatransp : string;
begin
  Result := True;

  if (Trim(dbedt_cd_incoterm.Text) <> '') and
     (ConsultaLookUP('TINCOTERMS_VENDA', 'CODIGO', Trim(dbedt_cd_incoterm.Text), 'DESCRICAO') = '') then
  begin
    MessageDlg('Verifique o INCOTERM.', mtError, [mbOk], 0);
    Result := False;
    Abort;
  end;

  if (Trim(dbedtCFOP.Text) <> '') and (edtCFOP.Text = '') then
  begin
    Result := False;
    MessageDlg('CFOP inválido.', mtError, [mbOk], 0);
    dbedtCFOP.SetFocus;
    Exit;
  end;

  // Alíquotas específicas
  if (datm_DI_Adicao.qry_adicao_VL_ALIQUOTA_ESPECIFICA_PIS.AsFloat > 0) or (datm_DI_Adicao.qry_adicao_QTD_UNID_ESPECIFICA_PIS.AsFloat > 0) then
  begin
    if (datm_DI_Adicao.qry_adicao_VL_ALIQUOTA_ESPECIFICA_PIS.AsFloat = 0) or (datm_DI_Adicao.qry_adicao_QTD_UNID_ESPECIFICA_PIS.AsFloat = 0) or
       (datm_DI_Adicao.qry_adicao_CD_UNIDADE_MEDIDA_PIS.AsString = '') then
    begin
      MessageDlg('Para alíquota específica todos os campos devem ser informados.', mtInformation, [mbOk], 0);
      pgctrl_adicao.ActivePage           := tbsht_tributos;
      pgctrl_tributos.ActivePage         := tbsht_ncm_pis_cofins;
      pgcAliquotas_PIS_COFINS.ActivePage := tbsAliquota_PIS;

      if (datm_DI_Adicao.qry_adicao_VL_ALIQUOTA_ESPECIFICA_PIS.AsFloat = 0) then
        dbedt_VL_ALIQUOTA_ESPECIFICA_PIS.SetFocus
      else
      if (datm_DI_Adicao.qry_adicao_QTD_UNID_ESPECIFICA_PIS.AsFloat = 0) then
        dbedt_QTD_UNID_ESPECIFICA_PIS.SetFocus
      else
      if (datm_DI_Adicao.qry_adicao_CD_UNIDADE_MEDIDA_PIS.AsString = '') then
        dbedt_CD_UNIDADE_MEDIDA_PIS.SetFocus;

      Result := False;
      Exit;
    end;
  end;

  if (datm_DI_Adicao.qry_adicao_VL_ALIQUOTA_ESPECIFICA_COFINS.AsFloat > 0) or (datm_DI_Adicao.qry_adicao_QTD_UNID_ESPECIFICA_COFINS.AsFloat > 0) then
  begin
    if (datm_DI_Adicao.qry_adicao_VL_ALIQUOTA_ESPECIFICA_COFINS.AsFloat = 0) or (datm_DI_Adicao.qry_adicao_QTD_UNID_ESPECIFICA_COFINS.AsFloat = 0) or
       (datm_DI_Adicao.qry_adicao_CD_UNIDADE_MEDIDA_COFINS.AsString = '') then
    begin
      MessageDlg('Para alíquota específica todos os campos devem ser informados.', mtInformation, [mbOk], 0);
      pgctrl_adicao.ActivePage           := tbsht_tributos;
      pgctrl_tributos.ActivePage         := tbsht_ncm_pis_cofins;
      pgcAliquotas_PIS_COFINS.ActivePage := tbsAliquota_COFINS;

      if (datm_DI_Adicao.qry_adicao_VL_ALIQUOTA_ESPECIFICA_COFINS.AsFloat = 0) then
        dbedt_VL_ALIQUOTA_ESPECIFICA_COFINS.SetFocus
      else
      if (datm_DI_Adicao.qry_adicao_QTD_UNID_ESPECIFICA_COFINS.AsFloat = 0) then
        dbedt_QTD_UNID_ESPECIFICA_COFINS.SetFocus
      else
      if (datm_DI_Adicao.qry_adicao_CD_UNIDADE_MEDIDA_COFINS.AsString = '') then
        dbedt_CD_UNIDADE_MEDIDA_COFINS.SetFocus;

      Result := False;
      Exit;
    end;
  end;
    //FERNANDA E ERIC 30/12/2011

  viatransp :=  ConsultaLookUPSQL(' SELECT S.CD_VIA_TRANSPORTE ' +
                                  ' FROM TPROCESSO P (NOLOCK) ' +
                                  ' INNER JOIN TSERVICO S (NOLOCK) ON S.CD_SERVICO = P.CD_SERVICO ' +
                                  ' WHERE NR_PROCESSO = ' + QuotedStr(datm_DI_Adicao.qry_di_NR_PROCESSO.AsString),'CD_VIA_TRANSPORTE');


  if (viatransp = '04') and (AnsiIndexText(datm_DI_Adicao.qry_adicao_CD_INCOTERMS_VENDA.AsString , ['FOB', 'CFR', 'CIF']) >= 0) then
  begin
    BoxMensagem('Erro! Os incoterms FOB, CFR ou CIF não podem ser aplicados quando a via de transporte for aérea. Por favor, verificar.', 2);
    Consiste := False;
  end;

  if pgctrl_adicao.ActivePage = tbsht_tributos then
    if pgctrl_tributos.ActivePage = tbsht_tributo_II then
      if trim(dbedt_aliq_acordo.Text) = '' then
      begin
        BoxMensagem('Informe a alíquota de Acordo Tarifário.', 2);
        Consiste := False;
      end;
end;

procedure Tfrm_DI_adicao.btn_co_cd_cfopClick(Sender: TObject);
var
  vCFOP: String;
begin
  if Sender = btn_co_cd_cfop then
  begin
    //vCFOP := ConsultaOnLineEx('TCFOP', 'CFOP', ['CD_CFOP', 'NM_CFOP'], ['Código', 'Descrição'], 'CD_CFOP');
    vCFOP := StringReplace(ConsultaOnLineExSQL(' SELECT LEFT(CD_CFOP, 1) + "." + RIGHT(CD_CFOP, 3) AS CD_CFOP, NM_CFOP ' +
                                               ' FROM TCFOP (NOLOCK) ',
       'CFOP', ['CD_CFOP', 'NM_CFOP'], ['Código', 'Descrição'], 'CD_CFOP'),
       '.', '', [rfReplaceAll]);
    if vCFOP <> datm_DI_Adicao.qry_adicao_CD_CFOP.AsString then
    begin
      if not(datm_DI_Adicao.qry_adicao_.State in [dsEdit, dsInsert]) then
        datm_DI_Adicao.qry_adicao_.Edit;
      datm_DI_Adicao.qry_adicao_CD_CFOP.AsString := vCFOP;
    end;
  end;
end;

procedure Tfrm_DI_adicao.dbedtCFOPChange(Sender: TObject);
begin
  if Trim(dbedtCFOP.Text) = '' then
    edtCFOP.Text := ''
  else
    edtCFOP.Text := ConsultaLookUP('TCFOP', 'CD_CFOP', Trim(dbedtCFOP.Text), 'NM_CFOP');
end;

procedure Tfrm_DI_adicao.btn_trans_DIClick(Sender: TObject);
begin
  if btn_salvar.Enabled and (MessageDlg('É necessário salvar as alterações antes de efetuar a transmissão.'#13 +
     'Deseja salvar agora?', mtConfirmation, [mbYes, mbNo], 0) = mrYes) then
    btn_salvar.Click;
  if btn_salvar.Enabled then
    Exit;
  Application.CreateForm(Tfrm_trans_DI, frm_trans_DI);
  // Desabilitar as opções de alterar a consulta
  frm_trans_di.msk_cd_unid_neg.Enabled := False;
  frm_trans_di.btn_co_unid_neg.Enabled := False;
  frm_trans_di.msk_cd_grupo.Enabled    := False;
  frm_trans_di.btn_co_grupo.Enabled    := False;
  frm_trans_di.msk_cd_cliente.Enabled  := False;
  frm_trans_di.btn_co_cliente.Enabled  := False;
  // Preenche os campos
  frm_trans_DI.msk_cd_unid_neg.Text := Copy(str_nr_processo, 1, 2);
  frm_trans_DI.msk_cd_unid_negExit(frm_trans_DI.msk_cd_unid_neg);
  frm_trans_DI.msk_cd_cliente.Text := ConsultaLookUP('TPROCESSO', 'NR_PROCESSO', str_nr_processo, 'CD_CLIENTE');
  frm_trans_DI.msk_cd_clienteExit(frm_trans_DI.msk_cd_cliente);
  // Preencher parâmetro com o processo e exibir a janela
  datm_trans_di.qry_grd_di_.ParamByName('NR_PROCESSO').AsString := str_nr_processo;
  frm_trans_DI.ShowModal;
  FreeAndNil(frm_trans_DI);
end;

procedure Tfrm_DI_adicao.AtualizaTelaICMSRJ;
begin
  if ((pgctrl_adicao.ActivePage = tbsht_tributos) and (pgctrl_tributos.ActivePage = tbsht_tributo_ICMS)) then
  begin
    Controla_Tela_Tributos;
    Tributo_ICMS;
  end;
  if dbchk_IN_FUNDO_POBREZA.Checked then
  begin
    if ConsultaLookUPSQL('SELECT ISNULL(E.IN_MARINHA_MERCANTE_ICMS, G.IN_MARINHA_MERCANTE_ICMS) AS IN_MARINHA_MERCANTE_ICMS ' +
                         'FROM TPROCESSO P ' +
                            'INNER JOIN TEMPRESA_NAC E ON E.CD_EMPRESA = P.CD_CLIENTE ' +
                         '   INNER JOIN TGRUPO G ON G.CD_GRUPO = E.CD_GRUPO ' +
                         'WHERE NR_PROCESSO = :NR_PROCESSO', 'IN_MARINHA_MERCANTE_ICMS', [datm_di_adicao.qry_adicao_NR_PROCESSO.AsString]) = '1' then
      edtICMS_Fundo_Pobreza.Text := FormatFloat('###,###,##0.00', datm_di_adicao.qry_adicao_VL_BASE_CALC_ICMS_AFRMM.AsFloat * (datm_DI_Adicao.PC_Fundo_Pobreza / 100))
    else
      edtICMS_Fundo_Pobreza.Text := FormatFloat('###,###,##0.00', datm_di_adicao.qry_adicao_VL_BASE_CALC_ICMS.AsFloat * (datm_DI_Adicao.PC_Fundo_Pobreza / 100));
  end
  else
    edtICMS_Fundo_Pobreza.Text := '0,00';
end;

procedure Tfrm_DI_adicao.dbchk_IN_FUNDO_POBREZAClick(Sender: TObject);
begin
  if datm_DI_Adicao.qry_adicao_.Active then
    AtualizaTelaICMSRJ
  else
    edtICMS_Fundo_Pobreza.Text := '0,00';
end;

procedure Tfrm_DI_adicao.tbsht_ncm_pis_cofinsShow(Sender: TObject);
begin
  pgcAliquotas_PIS_COFINS.ActivePage := tbsAliquota_PIS;
end;

procedure Tfrm_DI_adicao.dbedt_CD_UNIDADE_MEDIDA_PISChange(Sender: TObject);
begin
  if dbedt_CD_UNIDADE_MEDIDA_PIS.Text = '' then
    edtUnidadeMedidaPIS.Text := ''
  else
    edtUnidadeMedidaPIS.Text := ConsultaLookUP('TUNID_MEDIDA_BROKER', 'CD_UNID_MEDIDA',
       dbedt_CD_UNIDADE_MEDIDA_PIS.Text, 'NM_UNID_MEDIDA');
end;

procedure Tfrm_DI_adicao.dbedt_CD_UNIDADE_MEDIDA_PISKeyPress(Sender: TObject; var Key: Char);
begin
  if not (Key in ['0'..'9', #8]) then
    Key := #0;
end;

procedure Tfrm_DI_adicao.dbedt_CD_UNIDADE_MEDIDA_COFINSChange(Sender: TObject);
begin
  if dbedt_CD_UNIDADE_MEDIDA_COFINS.Text = '' then
    edtUnidadeMedidaCOFINS.Text := ''
  else
    edtUnidadeMedidaCOFINS.Text := ConsultaLookUP('TUNID_MEDIDA_BROKER', 'CD_UNID_MEDIDA',
       dbedt_CD_UNIDADE_MEDIDA_COFINS.Text, 'NM_UNID_MEDIDA');
end;

procedure Tfrm_DI_adicao.dbedt_CD_UNIDADE_MEDIDA_COFINSExit(Sender: TObject);
begin
  if datm_DI_Adicao.qry_adicao_.State in [dsEdit, dsInsert] then
  begin
    if TDBEdit(Sender).Text <> '' then
    begin
      if Length(TDBEdit(Sender).Field.AsString) < 3 then
        TDBEdit(Sender).Field.AsString := RightStr('00' + TDBEdit(Sender).Field.AsString, 3);
      if ConsultaLookUPSQL(' SELECT CD_UNID_MEDIDA ' +
                           ' FROM TUNID_MEDIDA_BROKER (NOLOCK) ' +
                           ' WHERE CD_UNID_MEDIDA = ' + QuotedStr(TDBEdit(Sender).Text) +
                           '   AND IN_ATIVO = ''1''', 'CD_UNID_MEDIDA') = '' then
      begin
        MessageDlg('Unidade de medida inválida.', mtError, [mbOk], 0);
        TDBEdit(Sender).SetFocus;
      end;
    end;
  end;
end;

procedure Tfrm_DI_adicao.btnUnidadeMedidaPISClick(Sender: TObject);
var
  vCdUnidadeMedida: String;
begin
  if PoeEmEdicao(datm_di_adicao.qry_adicao_) then
  begin
    vCdUnidadeMedida := ConsultaOnLineExSQL(' SELECT CD_UNID_MEDIDA, NM_UNID_MEDIDA, NM_SIGLA ' +
                                            ' FROM TUNID_MEDIDA_BROKER (NOLOCK) ' +
                                            ' WHERE IN_ATIVO = ''1''', 'Unidade de Medida', ['CD_UNID_MEDIDA', 'NM_UNID_MEDIDA', 'NM_SIGLA'],
       ['Código', 'Nome', 'Sigla'], 'CD_UNID_MEDIDA', nil, datm_DI_Adicao.qry_adicao_CD_UNIDADE_MEDIDA_PIS.AsString);
    if vCdUnidadeMedida <> datm_DI_Adicao.qry_adicao_CD_UNIDADE_MEDIDA_PIS.AsString then
      datm_DI_Adicao.qry_adicao_CD_UNIDADE_MEDIDA_PIS.AsString := vCdUnidadeMedida;
  end;
end;

procedure Tfrm_DI_adicao.btnUnidadeMedidaCOFINSClick(Sender: TObject);
var
  vCdUnidadeMedida: String;
begin
  if PoeEmEdicao(datm_di_adicao.qry_adicao_) then
  begin
    vCdUnidadeMedida := ConsultaOnLineExSQL(' SELECT CD_UNID_MEDIDA, NM_UNID_MEDIDA, NM_SIGLA ' +
                                            ' FROM TUNID_MEDIDA_BROKER (NOLOCK) ' +
                                            ' WHERE IN_ATIVO = ''1''', 'Unidade de Medida', ['CD_UNID_MEDIDA', 'NM_UNID_MEDIDA', 'NM_SIGLA'],
       ['Código', 'Nome', 'Sigla'], 'CD_UNID_MEDIDA', nil, datm_DI_Adicao.qry_adicao_CD_UNIDADE_MEDIDA_COFINS.AsString);
    if vCdUnidadeMedida <> datm_DI_Adicao.qry_adicao_CD_UNIDADE_MEDIDA_COFINS.AsString then
      datm_DI_Adicao.qry_adicao_CD_UNIDADE_MEDIDA_COFINS.AsString := vCdUnidadeMedida;
  end;
end;

procedure Tfrm_DI_adicao.dbedt_VL_ALIQUOTA_ESPECIFICA_PISExit(Sender: TObject);
begin
  if datm_DI_Adicao.qry_adicao_.State in [dsEdit, dsInsert] then
  begin
    if (datm_DI_Adicao.qry_adicao_VL_ALIQUOTA_ESPECIFICA_PIS.AsFloat > 0) then
      datm_DI_Adicao.qry_adicao_ALIQ_PIS.AsFloat := 0;
  end;
end;

procedure Tfrm_DI_adicao.dbedt_QTD_UNID_ESPECIFICA_PISExit(Sender: TObject);
begin
  if datm_DI_Adicao.qry_adicao_.State in [dsEdit, dsInsert] then
  begin
    if (datm_DI_Adicao.qry_adicao_QTD_UNID_ESPECIFICA_PIS.AsFloat > 0) then
      datm_DI_Adicao.qry_adicao_ALIQ_PIS.AsFloat := 0;
  end;
end;

procedure Tfrm_DI_adicao.dbedt_VL_ALIQUOTA_ESPECIFICA_COFINSExit(
  Sender: TObject);
begin
  if datm_DI_Adicao.qry_adicao_.State in [dsEdit, dsInsert] then
  begin
    if (datm_DI_Adicao.qry_adicao_VL_ALIQUOTA_ESPECIFICA_COFINS.AsFloat > 0) then
      datm_DI_Adicao.qry_adicao_ALIQ_COFINS.AsFloat := 0;
  end;
end;

procedure Tfrm_DI_adicao.dbedt_QTD_UNID_ESPECIFICA_COFINSExit(Sender: TObject);
begin
  if datm_DI_Adicao.qry_adicao_.State in [dsEdit, dsInsert] then
  begin
    if (datm_DI_Adicao.qry_adicao_QTD_UNID_ESPECIFICA_COFINS.AsFloat > 0) then
      datm_DI_Adicao.qry_adicao_ALIQ_COFINS.AsFloat := 0;
  end;
end;

procedure Tfrm_DI_adicao.dbedt_cd_fund_legalChange(Sender: TObject);
begin
  if (datm_DI_Adicao.qry_adicao_.State in [dsInsert, dsEdit]) then
  begin
    dbedt_QT_MESES_ADM_TEMP.Enabled := dbedt_cd_fund_legal.Text = '37';
    if (not dbedt_QT_MESES_ADM_TEMP.Enabled) and (datm_DI_Adicao.qry_adicao_.State in [dsEdit, dsInsert]) then
      datm_DI_Adicao.qry_adicao_QT_MESES_ADM_TEMP.AsInteger := 0;
    AtualizaCheckBoxSuspensao;
  end;
end;

procedure Tfrm_DI_adicao.AtualizaCheckBoxSuspensao;
begin
  dbchk_IN_SUSPENDE_II_RETIFIC.Visible         := (Trim(dbedt_cd_reg_trib.Text) = '5') and (Trim(dbedt_cd_fund_legal.Text) = '37');
  dbchk_IN_SUSPENDE_IPI_RETIFIC.Visible        := dbchk_IN_SUSPENDE_II_RETIFIC.Visible and (dbrg_reg_tributacao.ItemIndex = 1);
  dbchk_IN_SUSPENDE_PIS_COFINS_RETIFIC.Visible := dbchk_IN_SUSPENDE_II_RETIFIC.Visible and (dbrdgr_reg_trib_pis_cofins.ItemIndex = 3);
end;

procedure Tfrm_DI_adicao.dbrg_reg_tributacaoChange(Sender: TObject);
begin
  AtualizaCheckBoxSuspensao;
end;

procedure Tfrm_DI_adicao.btn_RetificarClick(Sender: TObject);
begin
  if btn_salvar.Enabled and (MessageDlg('É necessário salvar as alterações antes de efetuar a retificação.'#13 +
     'Deseja salvar agora?', mtConfirmation, [mbYes, mbNo], 0) = mrYes) then
    btn_salvar.Click;
  if btn_salvar.Enabled then
    Exit;
  Application.CreateForm(Tfrm_RetificaDI_Adm_Temp, frm_RetificaDI_Adm_Temp);
  frm_RetificaDI_Adm_Temp.ShowModal('', '', '', str_nr_processo);
end;

procedure Tfrm_DI_adicao.tbsht_tributo_ICMSShow(Sender: TObject);
begin
  AtualizaTelaICMSRJ;
end;

procedure Tfrm_DI_adicao.btn_co_nivelClick(Sender: TObject);
begin
  if not (datm_DI_Adicao.qry_nve_.State in [dsEdit, dsInsert]) then
    datm_DI_Adicao.qry_nve_.Edit;
  datm_DI_Adicao.qry_nve_CD_NIVEL_NVE.AsString := ConsultaOnLineEx('TAB_NIVEL', 'Nível NVE',
     ['CD_NIVEL_NVE', 'NM_NIVEL'], ['Código', 'Nome'], 'CD_NIVEL_NVE', nil, 1, datm_DI_Adicao.qry_nve_CD_NIVEL_NVE.AsString);
end;

procedure Tfrm_DI_adicao.btn_co_atribClick(Sender: TObject);
var
  Filtro: String;
begin
  if Trim(dbedt_cd_nivel.Text)      = 'C'  then
    Filtro := 'CD_NOMENC_NCM LIKE "' + Copy(datm_DI_Adicao.qry_adicao_CD_NCM_SH.AsString, 1, 2) + '%"'
  else if Trim(dbedt_cd_nivel.Text) = 'P'  then
    Filtro := 'CD_NOMENC_NCM LIKE "' + Copy(datm_DI_Adicao.qry_adicao_CD_NCM_SH.AsString, 1, 4) + '%"'
  else if Trim(dbedt_cd_nivel.Text) = 'SA' then
    Filtro := 'CD_NOMENC_NCM LIKE "' + Copy(datm_DI_Adicao.qry_adicao_CD_NCM_SH.AsString, 1, 5) + '%"'
  else if Trim(dbedt_cd_nivel.Text) = 'SB' then
    Filtro := 'CD_NOMENC_NCM LIKE "' + Copy(datm_DI_Adicao.qry_adicao_CD_NCM_SH.AsString, 1, 6) + '%"'
  else if Trim(dbedt_cd_nivel.Text) = 'N'  then
    Filtro := 'CD_NOMENC_NCM LIKE "' + Copy(datm_DI_Adicao.qry_adicao_CD_NCM_SH.AsString, 1, 7) + '%"'
  else if Trim(dbedt_cd_nivel.Text) = 'U'  then
    Filtro := 'CD_NOMENC_NCM LIKE "' + Copy(datm_DI_Adicao.qry_adicao_CD_NCM_SH.AsString, 1, 8) + '%"';

  if not (datm_DI_Adicao.qry_nve_.State in [dsEdit, dsInsert]) then
    datm_DI_Adicao.qry_nve_.Edit;            
  datm_DI_Adicao.qry_nve_CD_ATRIBUTO_NCM.AsString := ConsultaOnLineExFiltro('TATRIB_VALORACAO_NVE', 'Atributo NVE',
     ['CD_ATRIBUTO_NCM', 'NM_ATRIBUTO'], ['Código', 'Nome'], 'CD_ATRIBUTO_NCM', Filtro, nil,
     datm_DI_Adicao.qry_nve_CD_ATRIBUTO_NCM.AsString, 1);
end;

procedure Tfrm_DI_adicao.btn_co_especifClick(Sender: TObject);
var
  Filtro: String;
begin
  if Trim(dbedt_cd_nivel.Text)      = 'C'  then
    Filtro := 'CD_NOMENC_NCM LIKE "' + Copy(datm_DI_Adicao.qry_adicao_CD_NCM_SH.AsString, 1, 2) + '%"'
  else if Trim(dbedt_cd_nivel.Text) = 'P'  then
    Filtro := 'CD_NOMENC_NCM LIKE "' + Copy(datm_DI_Adicao.qry_adicao_CD_NCM_SH.AsString, 1, 4) + '%"'
  else if Trim(dbedt_cd_nivel.Text) = 'SA' then
    Filtro := 'CD_NOMENC_NCM LIKE "' + Copy(datm_DI_Adicao.qry_adicao_CD_NCM_SH.AsString, 1, 5) + '%"'
  else if Trim(dbedt_cd_nivel.Text) = 'SB' then
    Filtro := 'CD_NOMENC_NCM LIKE "' + Copy(datm_DI_Adicao.qry_adicao_CD_NCM_SH.AsString, 1, 6) + '%"'
  else if Trim(dbedt_cd_nivel.Text) = 'N'  then
    Filtro := 'CD_NOMENC_NCM LIKE "' + Copy(datm_DI_Adicao.qry_adicao_CD_NCM_SH.AsString, 1, 7) + '%"'
  else if Trim(dbedt_cd_nivel.Text) = 'U'  then
    Filtro := 'CD_NOMENC_NCM LIKE "' + Copy(datm_DI_Adicao.qry_adicao_CD_NCM_SH.AsString, 1, 8) + '%"';

  if not (datm_DI_Adicao.qry_nve_.State in [dsEdit, dsInsert]) then
    datm_DI_Adicao.qry_nve_.Edit;
  datm_DI_Adicao.qry_nve_CD_ESPECIF_NCM.AsString := ConsultaOnLineExFiltro('TAB_ESPECIF_VALORACAO_NVE', 'Especificação NVE',
     ['CD_ESPECIF_NCM', 'NM_ESPECIF_NCM'], ['Código', 'Nome'], 'CD_ESPECIF_NCM', Filtro, nil, datm_DI_Adicao.qry_nve_CD_ESPECIF_NCM.AsString, 1);
end;

procedure Tfrm_DI_adicao.btn_NVE_IncluirClick(Sender: TObject);
begin
  datm_DI_Adicao.qry_nve_.Append;
end;

procedure Tfrm_DI_adicao.btn_NVE_SalvarClick(Sender: TObject);
begin
  datm_DI_Adicao.qry_nve_.Post;
  datm_DI_Adicao.qry_nve_.Close;
  datm_DI_Adicao.qry_nve_.Open;
end;

procedure Tfrm_DI_adicao.btn_NVE_CancelarClick(Sender: TObject);
begin
  datm_DI_Adicao.qry_nve_.Cancel;
end;

procedure Tfrm_DI_adicao.btn_NVE_ExcluirClick(Sender: TObject);
begin
  datm_DI_Adicao.qry_nve_.Delete;
end;

procedure Tfrm_DI_adicao.btnTPSuspensaoClick(Sender: TObject);
begin
  if btnTPSuspensao.Enabled then
  begin
    if Sender is TSpeedButton then
    begin
    if PoeEmEdicao(datm_DI_Adicao.qry_adicao_) then
      datm_DI_Adicao.qry_adicao_CD_TP_SUSPENSAO.AsString := ConsultaOnLineEx('TTP_SUSPENSAO_AFRMM',
                                                                             'Tipo Suspenção',
                                                                             ['CD_TP_SUSPENSAO','DS_TP_SUSPENSAO'],
                                                                             ['Codigo', 'Descrição'],
                                                                             'CD_TP_SUSPENSAO',
                                                                             nil,
                                                                             1,
                                                                             dbedtTP_SUSPENCAO.text)
    end
    else
      dbedtTP_SUSPENCAO.text := ConsultaLookUP('TTP_SUSPENSAO_AFRMM','CD_TP_SUSPENSAO',dbedtTP_SUSPENCAO.Text,'DS_TP_SUSPENSAO');
  end;
end;

procedure Tfrm_DI_adicao.btnTPIsensaoClick(Sender: TObject);
begin
  if btnTPIsensao.enabled then
  begin
    if Sender is TSpeedButton then
    begin
    if PoeEmEdicao(datm_DI_Adicao.qry_adicao_) then
      datm_DI_Adicao.qry_adicao_CD_TP_ISENCAO.AsString := ConsultaOnLineEx('TTP_ISENCAO_AFRMM',
                                                                           'Tipo Isenção',
                                                                           ['CD_TP_ISENCAO','DS_TP_ISENCAO'],
                                                                           ['Codigo', 'Descrição'],
                                                                           'CD_TP_ISENCAO',
                                                                           nil,
                                                                           1,
                                                                           dbedtCD_TP_ISENCAO.text);
    end
    else
      dbedtCD_TP_ISENCAO.text := ConsultaLookUP('TTP_ISENCAO_AFRMM','CD_TP_ISENCAO',dbedtCD_TP_ISENCAO.Text,'DS_TP_ISENCAO');
  end;
end;

procedure Tfrm_DI_adicao.dbrgCD_TP_AFRMMChange(Sender: TObject);
begin
  if dbrgCD_TP_AFRMM.ItemIndex = 0 then
  begin
    dbedtTP_SUSPENCAO.Enabled        := false;
    dbedtDT_VENCIMENTO_SUSPENSAO.enabled := false;    
    dbedtTP_ISENCAO.Enabled          := false;
    btnTPIsensao.enabled             := false;
    btnTPSuspensao.Enabled           := false;
  end
  else
  if dbrgCD_TP_AFRMM.ItemIndex = 1 then
  begin
    dbedtTP_SUSPENCAO.Enabled        := false;
    dbedtDT_VENCIMENTO_SUSPENSAO.enabled := false;
    dbedtTP_ISENCAO.Enabled          := true;
    btnTPIsensao.enabled             := true;
    btnTPSuspensao.Enabled           := false;
  end
  else
  if dbrgCD_TP_AFRMM.ItemIndex = 2 then
  begin
    dbedtTP_SUSPENCAO.Enabled        := true;
    dbedtDT_VENCIMENTO_SUSPENSAO.enabled := true;
    dbedtTP_ISENCAO.Enabled          := false;
    btnTPIsensao.enabled             := false;
    btnTPSuspensao.Enabled           := true;
  end;
end;

procedure Tfrm_DI_adicao.dblkcbox_acordo_tarifClick(Sender: TObject);
begin
  if (datm_DI_Adicao.qry_adicao_.State in [dsInsert, dsEdit]) then
    if trim(dblkcbox_acordo_tarif.text) <> '' then
    begin
      if datm_DI_Adicao.qry_ad_ii_PC_ALIQ_ACOR_TARIF.asfloat = 0 then
      begin
        if not (datm_DI_Adicao.qry_ad_ii_.State in [dsInsert, dsEdit]) then
          datm_DI_Adicao.qry_ad_ii_.edit;

        datm_DI_Adicao.qry_ad_ii_PC_ALIQ_ACOR_TARIF.Clear;
      end;
    end;
end;

procedure Tfrm_DI_adicao.pgctrl_adicaoChanging(Sender: TObject;
  var AllowChange: Boolean);
begin
  if btn_salvar.enabled then
  begin
    AllowChange := false;
    BoxMensagem('Salve ou cancele suas alterações', 2);
  end;
end;

procedure Tfrm_DI_adicao.edtItemDiretoKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if length(edtItemDireto.text) = 3 then
  begin
    if not btn_salvar.enabled then
    begin
      if (datm_DI_Adicao.qry_adicao_.State in [dsBrowse]) then
        if datm_DI_Adicao.qry_adicao_NR_ADICAO.asString <> edtItemDireto.text then
          datm_DI_Adicao.qry_adicao_.Locate('NR_ADICAO', edtItemDireto.text, []);
    end;
  end;
end;

procedure Tfrm_DI_adicao.edtItemDiretoKeyPress(Sender: TObject;
  var Key: Char);
begin
  if btn_salvar.enabled then
    key :=#0
  else
  If not( key in['0'..'9',#08] ) then
    key:=#0;
end;

procedure Tfrm_DI_adicao.edtItemDiretoKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
   if btn_salvar.enabled then
   if (Key = VK_DELETE) then
      Key := 0;
end;

procedure Tfrm_DI_adicao.AbrirCadMercadoria;
begin
  vStr_cd_modulo := '22';
  str_cd_rotina := '2210';
  str_cd_mod := vStr_cd_modulo;
  str_cd_rot := str_cd_rotina;
  Application.CreateForm(Tfrm_Mercadoria, frm_Mercadoria);
  frm_Mercadoria.cGrupo := '';
  frm_Mercadoria.cImportador := '';
  frm_Mercadoria.Show;
end;

procedure Tfrm_DI_adicao.FecharCadMercadoria;
begin
  if Assigned(frm_mercadoria) then
    frm_mercadoria.Close;
end;

procedure Tfrm_DI_adicao.CadMercadoria1Click(Sender: TObject);
begin
  if not Assigned(frm_mercadoria) then
    AbrirCadMercadoria;

end;

procedure Tfrm_DI_adicao.btn_co_Fund_legal_ii_duimpClick(Sender: TObject);
var
  vDescricaoFundamento: String;
begin
  if datm_DI_Adicao.qry_adicao_CD_REGIME_TRIBUTAR.AsString = '' then
  begin
    ShowMessage('Favor preencher o regime.');
    Exit;
  end;

  if btn_co_Fund_legal_ii_duimp.enabled then
  begin
    if Sender is TSpeedButton then
    begin
    if PoeEmEdicao(datm_DI_Adicao.qry_adicao_) then
      datm_DI_Adicao.qry_adicao_CD_FUND_LEGAL_II_DUIMP.AsString := ConsultaOnLineExSQL('SELECT * FROM TFUNDAMENTO_LEGAL_Pucomex ' +
                                                                                       'WHERE REGIME LIKE ''%'+ datm_DI_Adicao.qry_adicao_CD_REGIME_TRIBUTAR.AsString +' -%'' ' +
                                                                                       'AND TRIBUTOS LIKE ''%IMPOSTO DE IMPORTAÇÃO%'' ',
                                                                                       'FUNDAMENTO LEGAL DUIMP - II',
                                                                                       ['CODIGO','DESCRICAO'],
                                                                                       ['Código','Descrição'],
                                                                                       'CODIGO');
    end
    else
    begin
      vDescricaoFundamento := ConsultaLookUPSQL('SELECT * FROM TFUNDAMENTO_LEGAL_Pucomex ' +
                                             'WHERE REGIME LIKE :REGIME ' +
                                             'AND TRIBUTOS LIKE :TRIBUTO AND CODIGO = :CODIGO',
                                             'DESCRICAO', ['%'+ datm_DI_Adicao.qry_adicao_CD_REGIME_TRIBUTAR.AsString +' -%', '%IMPOSTO DE IMPORTAÇÃO%', datm_DI_Adicao.qry_adicao_CD_FUND_LEGAL_II_DUIMP.AsString]);

      if vDescricaoFundamento <> '' then
        dbedt_desc_fund_leg_ii_duimp.text := vDescricaoFundamento
      else
      begin
        ShowMessage('Não foi encontrado Fundamento Legal para este Regime de Tributação');
        datm_DI_Adicao.qry_adicao_CD_FUND_LEGAL_II_DUIMP.AsString := '';
      end;
    end;
   end;
end;


procedure Tfrm_DI_adicao.btn_co_Fund_legal_ipi_duimpClick(Sender: TObject);
var
  vRegime: String;
  vDescricaoFundamento: string;
begin
  case dbrg_reg_tributacao.ItemIndex of
    0 : vRegime := '1'; //Recolhimento Integral
    1 : vRegime := '5'; //Suspensão
    2 : vRegime := '4'; //Redução
    3 : vRegime := '3'; //Isenção
  end;

  if btn_co_Fund_legal_ipi_duimp.enabled then
  begin
    if Sender is TSpeedButton then
    begin
    if PoeEmEdicao(datm_DI_Adicao.qry_adicao_) then
      datm_DI_Adicao.qry_adicao_CD_FUND_LEGAL_IPI_DUIMP.AsString := ConsultaOnLineExSQL('SELECT * FROM TFUNDAMENTO_LEGAL_Pucomex ' +
                                                                                       'WHERE REGIME LIKE ''%'+ vRegime +' -%'' ' +
                                                                                       'AND TRIBUTOS LIKE ''%IPI%'' ',
                                                                                       'FUNDAMENTO LEGAL DUIMP - IPI',
                                                                                       ['CODIGO','DESCRICAO'],
                                                                                       ['Código','Descrição'],
                                                                                       'CODIGO');
    end
    else
    begin
      vDescricaoFundamento := ConsultaLookUPSQL('SELECT * FROM TFUNDAMENTO_LEGAL_Pucomex ' +
                                             'WHERE REGIME LIKE :REGIME ' +
                                             'AND TRIBUTOS LIKE :TRIBUTO AND CODIGO = :CODIGO',
                                             'DESCRICAO',
                                             ['%'+ vRegime +' -%', '%IPI%', datm_DI_Adicao.qry_adicao_CD_FUND_LEGAL_IPI_DUIMP.AsString]);

      if vDescricaoFundamento <> '' then
        dbedt_desc_fund_leg_ipi_duimp.text := vDescricaoFundamento
      else
      begin
        ShowMessage('Não foi encontrado Fundamento Legal para este Regime de Tributação');
        datm_DI_Adicao.qry_adicao_CD_FUND_LEGAL_IPI_DUIMP.AsString := '';
      end;
    end;
  end;
end;

procedure Tfrm_DI_adicao.btn_co_Fund_legal_piscofins_duimpClick(
  Sender: TObject);
var
  vRegime: String;
  vDescricaoFundamento: String;  
begin
  case dbrdgr_reg_trib_pis_cofins.ItemIndex of
    0 : vRegime := '1'; //integral
    1 : vRegime := '4'; //Redução
    2 : vRegime := '3'; //Isenção
    3 : vRegime := '5'; //Suspensão
    4 : vRegime := '6'; //Não Incidente
  end;

  if btn_co_Fund_legal_piscofins_duimp.enabled then
  begin
    if Sender is TSpeedButton then
    begin
    if PoeEmEdicao(datm_DI_Adicao.qry_adicao_) then
      datm_DI_Adicao.qry_adicao_CD_FUND_LEGAL_PISCOFINS_DUIMP.AsString := ConsultaOnLineExSQL('SELECT * FROM TFUNDAMENTO_LEGAL_Pucomex ' +
                                                                                       'WHERE REGIME LIKE ''%'+ vRegime +' -%'' ' +
                                                                                       'AND TRIBUTOS LIKE ''%PIS%'' ',
                                                                                       'FUNDAMENTO LEGAL DUIMP - PIS E COFINS',
                                                                                       ['CODIGO','DESCRICAO'],
                                                                                       ['Código','Descrição'],
                                                                                       'CODIGO');
    end
    else
    begin
      vDescricaoFundamento := ConsultaLookUPSQL('SELECT * FROM TFUNDAMENTO_LEGAL_Pucomex ' +
                                             'WHERE REGIME LIKE :REGIME ' +
                                             'AND TRIBUTOS LIKE :TRIBUTO AND CODIGO = :CODIGO',
                                             'DESCRICAO',
                                             ['%'+ vRegime +' -%', '%PIS%', datm_DI_Adicao.qry_adicao_CD_FUND_LEGAL_PISCOFINS_DUIMP.AsString]);

      if vDescricaoFundamento <> '' then
        dbedt_desc_fund_leg_piscofins_duimp.text := vDescricaoFundamento
      else
      begin
        ShowMessage('Não foi encontrado Fundamento Legal para este Regime de Tributação');
        datm_DI_Adicao.qry_adicao_CD_FUND_LEGAL_PISCOFINS_DUIMP.AsString := '';
      end;
    end;
  end;
end;

procedure Tfrm_DI_adicao.btnEnvioDuimpClick(Sender: TObject);
var
  Pasta: string;
  CaminhoArquivo: string;
  vNrProcesso: string;
begin
  Pasta :='C:\DDBROKER\Duimp\';
  CaminhoArquivo := Pasta+'IntegracaoDuimp.exe';
  vNrProcesso := str_nr_processo;

  if not FileExists(CaminhoArquivo) then
  begin
    ShowMessage('Sistema não encontrado no caminho ' + CaminhoArquivo +'.');
    Exit;
  end;

  StartApp('Open', PChar(CaminhoArquivo), PAnsiChar(ServidorEmUso + ' TransmissaoDuimp ' + vNrProcesso), PChar(Pasta), SW_SHOW);
end;

end.

