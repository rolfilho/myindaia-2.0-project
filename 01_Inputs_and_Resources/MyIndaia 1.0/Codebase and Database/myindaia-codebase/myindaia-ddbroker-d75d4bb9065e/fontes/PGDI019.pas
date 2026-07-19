unit PGDI019;

interface

uses
  Windows, Messages,SysUtils , Classes, Graphics, Controls, Forms, Dialogs,
  Db, DBTables, Funcoes, Variants, StrUtils,
  FormsLog; // Este sempre depois das uses Forms e Classes - Michel - 22/03/2013

type
  Tdatm_DI_Adicao = class(TDataModule)
    ds_adicao: TDataSource;
    ds_ad_ato_legal_ncm: TDataSource;
    tbl_ad_ato_leg_ncm_: TTable;
    ds_ad_ato_legal_nbm: TDataSource;
    tbl_ad_ato_legal_nbm_: TTable;
    ds_ad_ato_legal_acordo_tar: TDataSource;
    tbl_ad_ato_legal_acordo_tar_: TTable;
    ds_ad_ato_legal_benef_ipi: TDataSource;
    tbl_ad_ato_legal_benef_ipi_: TTable;
    ds_ad_ato_legal_antidump: TDataSource;
    tbl_ad_ato_legal_antidump_: TTable;
    ds_ad_destaque_ncm: TDataSource;
    tbl_ad_destaque_ncm_: TTable;
    ds_ad_docto_vinc: TDataSource;
    tbl_ad_docto_vinc_: TTable;
    dsq_ad_cambio_pg_antecip: TDataSource;
    dsq_ad_cambio_pg_avista: TDataSource;
    ds_ad_cambio_parc_var: TDataSource;
    tbl_ad_cambio_parc_var_: TTable;
    tbl_ad_ato_leg_ncm_NR_PROCESSO: TStringField;
    tbl_ad_ato_leg_ncm_NR_ADICAO: TStringField;
    tbl_ad_ato_leg_ncm_CD_ASSUNTO_VINCUL: TStringField;
    tbl_ad_ato_leg_ncm_SG_TIPO_ATO_VINCUL: TStringField;
    tbl_ad_ato_leg_ncm_SG_ORG_ATO_VINCUL: TStringField;
    tbl_ad_ato_leg_ncm_DT_ANO_ATO_VINCUL: TStringField;
    tbl_ad_ato_leg_ncm_NR_ATO_VINCULADO: TStringField;
    tbl_ad_ato_leg_ncm_NR_EX_ATO_VINCUL: TStringField;
    tbl_ad_ato_legal_nbm_NR_PROCESSO: TStringField;
    tbl_ad_ato_legal_nbm_NR_ADICAO: TStringField;
    tbl_ad_ato_legal_nbm_CD_ASSUNTO_VINCUL: TStringField;
    tbl_ad_ato_legal_nbm_SG_TIPO_ATO_VINCUL: TStringField;
    tbl_ad_ato_legal_nbm_SG_ORG_ATO_VINCUL: TStringField;
    tbl_ad_ato_legal_nbm_DT_ANO_ATO_VINCUL: TStringField;
    tbl_ad_ato_legal_nbm_NR_ATO_VINCULADO: TStringField;
    tbl_ad_ato_legal_nbm_NR_EX_ATO_VINCUL: TStringField;
    tbl_ad_ato_legal_acordo_tar_NR_PROCESSO: TStringField;
    tbl_ad_ato_legal_acordo_tar_NR_ADICAO: TStringField;
    tbl_ad_ato_legal_acordo_tar_CD_ASSUNTO_VINCUL: TStringField;
    tbl_ad_ato_legal_acordo_tar_SG_TIPO_ATO_VINCUL: TStringField;
    tbl_ad_ato_legal_acordo_tar_SG_ORG_ATO_VINCUL: TStringField;
    tbl_ad_ato_legal_acordo_tar_DT_ANO_ATO_VINCUL: TStringField;
    tbl_ad_ato_legal_acordo_tar_NR_ATO_VINCULADO: TStringField;
    tbl_ad_ato_legal_acordo_tar_NR_EX_ATO_VINCUL: TStringField;
    tbl_ad_ato_legal_benef_ipi_NR_PROCESSO: TStringField;
    tbl_ad_ato_legal_benef_ipi_NR_ADICAO: TStringField;
    tbl_ad_ato_legal_benef_ipi_CD_ASSUNTO_VINCUL: TStringField;
    tbl_ad_ato_legal_benef_ipi_SG_TIPO_ATO_VINCUL: TStringField;
    tbl_ad_ato_legal_benef_ipi_SG_ORG_ATO_VINCUL: TStringField;
    tbl_ad_ato_legal_benef_ipi_DT_ANO_ATO_VINCUL: TStringField;
    tbl_ad_ato_legal_benef_ipi_NR_ATO_VINCULADO: TStringField;
    tbl_ad_ato_legal_benef_ipi_NR_EX_ATO_VINCUL: TStringField;
    tbl_ad_ato_legal_antidump_NR_PROCESSO: TStringField;
    tbl_ad_ato_legal_antidump_NR_ADICAO: TStringField;
    tbl_ad_ato_legal_antidump_CD_ASSUNTO_VINCUL: TStringField;
    tbl_ad_ato_legal_antidump_SG_TIPO_ATO_VINCUL: TStringField;
    tbl_ad_ato_legal_antidump_SG_ORG_ATO_VINCUL: TStringField;
    tbl_ad_ato_legal_antidump_DT_ANO_ATO_VINCUL: TStringField;
    tbl_ad_ato_legal_antidump_NR_ATO_VINCULADO: TStringField;
    tbl_ad_ato_legal_antidump_NR_EX_ATO_VINCUL: TStringField;
    tbl_ad_destaque_ncm_NR_PROCESSO: TStringField;
    tbl_ad_destaque_ncm_NR_ADICAO: TStringField;
    tbl_ad_destaque_ncm_NR_DESTAQUE_NCM: TStringField;
    tbl_ad_docto_vinc_NR_PROCESSO: TStringField;
    tbl_ad_docto_vinc_NR_ADICAO: TStringField;
    tbl_ad_docto_vinc_CD_TIPO_DCTO_VINC: TStringField;
    tbl_ad_docto_vinc_NR_DCTO_VINCULADO: TStringField;
    tbl_ad_cambio_parc_var_NR_PROCESSO: TStringField;
    tbl_ad_cambio_parc_var_NR_ADICAO: TStringField;
    tbl_ad_cambio_parc_var_DT_PREV_PGTO_360: TStringField;
    tbl_ad_cambio_parc_var_VL_PREV_PGTO_360: TFloatField;
    ds_ad_acrescimos: TDataSource;
    tbl_ad_acrescimos_: TTable;
    tbl_ad_acrescimos_NR_PROCESSO: TStringField;
    tbl_ad_acrescimos_NR_ADICAO: TStringField;
    tbl_ad_acrescimos_CD_MET_ACRES_VALOR: TStringField;
    tbl_ad_acrescimos_VL_ACRESCIMO_MOEDA: TFloatField;
    tbl_ad_acrescimos_CD_MD_NEGOC_ACRES: TStringField;
    tbl_ad_acrescimos_VL_ACRESCIMO_MN: TFloatField;
    ds_ad_deducoes: TDataSource;
    tbl_ad_deducoes_: TTable;
    tbl_ad_deducoes_NR_PROCESSO: TStringField;
    tbl_ad_deducoes_NR_ADICAO: TStringField;
    tbl_ad_deducoes_CD_MET_DEDUC_VALOR: TStringField;
    tbl_ad_deducoes_VL_DEDUCAO_MNEG: TFloatField;
    tbl_ad_deducoes_CD_MD_NEGOC_DEDUC: TStringField;
    tbl_ad_deducoes_VL_DEDUCAO_MN: TFloatField;
    tbl_ad_docto_vinc_Look_tp_docto_vinc: TStringField;
    ds_ad_ii: TDataSource;
    ds_ad_ipi: TDataSource;
    ds_ad_antidump: TDataSource;
    tbl_ad_antidump_: TTable;
    tbl_ad_antidump_NR_PROCESSO: TStringField;
    tbl_ad_antidump_NR_ADICAO: TStringField;
    tbl_ad_antidump_CD_RECEITA_IMPOSTO: TStringField;
    tbl_ad_antidump_CD_TIPO_ALIQ_IPT: TStringField;
    tbl_ad_antidump_VL_BASE_CALC_ADVAL: TFloatField;
    tbl_ad_antidump_PC_ALIQ_NORM_ADVAL: TFloatField;
    tbl_ad_antidump_VL_CALC_IPT_ADVAL: TFloatField;
    tbl_ad_antidump_NM_UN_ALIQ_ESP_IPT: TStringField;
    tbl_ad_antidump_CD_TIPO_RECIPIENTE: TStringField;
    tbl_ad_antidump_QT_ML_RECIPIENTE: TFloatField;
    tbl_ad_antidump_QT_MERC_UN_ALIQ_ES: TFloatField;
    tbl_ad_antidump_VL_ALIQ_ESPEC_IPT: TFloatField;
    tbl_ad_antidump_VL_CALC_IPT_ESPEC: TFloatField;
    tbl_ad_antidump_CD_TIPO_BENEF_IPI: TStringField;
    tbl_ad_antidump_PC_ALIQ_REDUZIDA: TFloatField;
    tbl_ad_antidump_PC_REDUCAO_IPT_BLI: TFloatField;
    tbl_ad_antidump_PC_ALIQ_ACOR_TARIF: TFloatField;
    tbl_ad_antidump_VL_CALC_II_AC_TARI: TFloatField;
    tbl_ad_antidump_VL_IMPOSTO_DEVIDO: TFloatField;
    tbl_ad_antidump_VL_IPT_A_RECOLHER: TFloatField;
    tbl_ad_antidump_CD_TIPO_DIREITO: TStringField;
    tbl_ad_antidump_NR_NOTA_COMPL_TIPI: TStringField;
    sp_di_renumera_itens_adicao: TStoredProc;
    StringField1: TStringField;
    StringField2: TStringField;
    sp_di_calculo: TStoredProc;
    ds_ad_itens_w: TDataSource;
    ds_di: TDataSource;
    qry_ad_cambio_pg_antec_: TQuery;
    qry_ad_cambio_pg_avista_: TQuery;
    qry_ad_cambio_pg_avista_NR_PROCESSO: TStringField;
    qry_ad_cambio_pg_avista_NR_ADICAO: TStringField;
    qry_ad_cambio_pg_avista_CD_FORMA_PAGAMENTO: TStringField;
    qry_ad_cambio_pg_avista_IN_PAGAMENTO_MN: TStringField;
    qry_ad_cambio_pg_avista_CD_BANCO_PAGAMENTO: TStringField;
    qry_ad_cambio_pg_avista_CD_PRACA_PAGAMENTO: TStringField;
    qry_ad_cambio_pg_avista_NR_OP_CAMBIO: TStringField;
    qry_ad_cambio_pg_avista_VL_VINC_MD_CAMBIO: TFloatField;
    qry_ad_cambio_pg_avista_NR_COMPR_CAMBIO: TStringField;
    qry_ad_cambio_pg_avista_CD_TP_COMPR_CAMBIO: TStringField;
    qry_ad_cambio_pg_avista_Look_Moeda_nac: TStringField;
    qry_ncm_: TQuery;
    ds_ncm: TDataSource;
    qry_fund_leg_: TQuery;
    ds_fund_leg: TDataSource;
    ds_urf_entrada: TDataSource;
    qry_urf_entrada_: TQuery;
    ds_mot_sem_cobertura: TDataSource;
    qry_mot_sem_cobertura_: TQuery;
    qry_fund_leg_Codigo: TStringField;
    qry_fund_leg_Descricao: TStringField;
    qry_fund_leg_Reg_Tribut_1: TStringField;
    qry_fund_leg_Reg_Tribut_2: TStringField;
    qry_fund_leg_Reg_Tribut_3: TStringField;
    qry_fund_leg_Reg_Tribut_4: TStringField;
    qry_mot_sem_cobertura_CODIGO: TStringField;
    qry_mot_sem_cobertura_DESCRICAO: TStringField;
    ds_mod_pagto: TDataSource;
    qry_mod_pagto_: TQuery;
    qry_mod_pagto_CODIGO: TStringField;
    qry_mod_pagto_DESCRICAO: TStringField;
    qry_atrib_nve_: TQuery;
    ds_atrib_nve: TDataSource;
    ds_espec_nve: TDataSource;
    qry_espec_nve_: TQuery;
    ds_nve: TDataSource;
    qry_nve_: TQuery;
    qry_atrib_nve_CD_NOMENC_NCM: TStringField;
    qry_atrib_nve_CD_ATRIBUTO_NCM: TStringField;
    qry_atrib_nve_IN_MULTIPLA_ESPECIF: TStringField;
    qry_atrib_nve_CD_NIVEL_NCM: TStringField;
    qry_atrib_nve_NM_ATRIBUTO: TStringField;
    ds_abrangencia_nve: TDataSource;
    ds_atrib_nve_desc: TDataSource;
    qry_atrib_nve_desc_: TQuery;
    StringField3: TStringField;
    StringField4: TStringField;
    StringField5: TStringField;
    StringField6: TStringField;
    StringField7: TStringField;
    ds_espec_nve_desc: TDataSource;
    qry_espec_nve_desc_: TQuery;
    tbl_ad_acrescimos_Look_nm_acrescimo: TStringField;
    tbl_ad_deducoes_Look_nm_deducao: TStringField;
    ds_empresa_est: TDataSource;
    tbl_empresa_est_: TTable;
    tbl_empresa_est_CD_EMPRESA: TStringField;
    tbl_empresa_est_AP_EMPRESA: TStringField;
    tbl_empresa_est_END_NUMERO: TStringField;
    tbl_empresa_est_END_CIDADE: TStringField;
    tbl_empresa_est_END_ESTADO: TStringField;
    tbl_empresa_est_CD_PAIS: TStringField;
    tbl_empresa_est_NR_TELEFONE: TStringField;
    tbl_empresa_est_NR_FAX: TStringField;
    tbl_empresa_est_DT_INCLUSAO: TDateTimeField;
    ds_pais: TDataSource;
    tbl_pais_: TTable;
    tbl_pais_CODIGO: TStringField;
    tbl_pais_DESCRICAO: TStringField;
    ds_local_embarque: TDataSource;
    tbl_local_embarque_: TTable;
    tbl_local_embarque_CODIGO: TStringField;
    tbl_local_embarque_DESCRICAO: TStringField;
    ds_reg_trib: TDataSource;
    tbl_reg_trib_: TTable;
    ds_motivo: TDataSource;
    tbl_motivo_: TTable;
    tbl_motivo_CODIGO: TStringField;
    tbl_motivo_DESCRICAO: TStringField;
    ds_tp_doc_vinc: TDataSource;
    tbl_tp_doc_vinc_: TTable;
    tbl_tp_doc_vinc_CD_TIPO_DOCTO_VINC: TStringField;
    tbl_tp_doc_vinc_DESCRICAO: TStringField;
    ds_metodo_valoracao: TDataSource;
    tbl_metodo_valoracao_: TTable;
    ds_tp_acres: TDataSource;
    tbl_tp_acres_: TTable;
    tbl_tp_acres_CODIGO: TStringField;
    tbl_tp_acres_DESCRICAO: TStringField;
    tbl_tp_acres_DESCRICAO_REDUZIDA: TStringField;
    tbl_tp_dedu_: TTable;
    tbl_tp_dedu_CODIGO: TStringField;
    tbl_tp_dedu_DESCRICAO: TStringField;
    tbl_tp_dedu_DESCRICAO_REDUZIDA: TStringField;
    ds_tp_dedu: TDataSource;
    ds_moeda: TDataSource;
    tbl_moeda_: TTable;
    ds_tp_vinc_expo_impo: TDataSource;
    tbl_tp_vinc_expo_impo_: TTable;
    tbl_tp_vinc_expo_impo_CD_VINC_EXPO_IMPO: TStringField;
    tbl_tp_vinc_expo_impo_DESCRICAO: TStringField;
    ds_tp_ato_legal: TDataSource;
    tbl_tp_ato_legal_: TTable;
    tbl_tp_ato_legal_Codigo: TStringField;
    tbl_tp_ato_legal_Descricao: TStringField;
    ds_orgao_emissor: TDataSource;
    tbl_orgao_emissor_: TTable;
    tbl_orgao_emissor_Codigo: TStringField;
    tbl_orgao_emissor_Descricao: TStringField;
    ds_unid_med: TDataSource;
    tbl_unid_med_: TTable;
    tbl_unid_med_CODIGO: TStringField;
    tbl_unid_med_DESCRICAO: TStringField;
    ds_via_transporte: TDataSource;
    tbl_via_transporte_: TTable;
    tbl_via_transporte_CD_VIA_TRANSPORTE: TStringField;
    tbl_via_transporte_NM_VIA_TRANSPORTE: TStringField;
    ds_taxa_cambio: TDataSource;
    tbl_taxa_cambio_: TTable;
    tbl_taxa_cambio_Codigo: TStringField;
    tbl_taxa_cambio_Descricao: TStringField;
    tbl_taxa_cambio_Taxa_Conversao: TStringField;
    tbl_taxa_cambio_Vigencia_Inicio_Taxa: TStringField;
    tbl_taxa_cambio_Vigencia_Fim_Taxa: TStringField;
    ds_acordo_tarif: TDataSource;
    tbl_acordo_tarif_: TTable;
    tbl_acordo_tarif_CD_TIPO_ACORDO_TAR: TStringField;
    tbl_acordo_tarif_DESCRICAO: TStringField;
    qry_ncm_CODIGO: TStringField;
    qry_ncm_DESCRICAO: TStringField;
    qry_ncm_UNIDADE_MEDIDA: TStringField;
    qry_ncm_ALIQUOTA_II: TStringField;
    qry_ncm_DATA_INICIO_VIG_II: TStringField;
    qry_ncm_DATA_FIM_VIG_II: TStringField;
    qry_ncm_ALIQUOTA_II_MERCOSUL: TStringField;
    qry_ncm_DATA_INICIO_VIG_II_MSUL: TStringField;
    qry_ncm_DATA_FIM_VIG_II_MSUL: TStringField;
    qry_ncm_ALIQUOTA_IPI: TStringField;
    qry_ncm_DATA_INICIO_VIG_IPI: TStringField;
    qry_ncm_DATA_FIM_VIG_IPI: TStringField;
    ds_yesno: TDataSource;
    tbl_yesno_: TTable;
    qry_inst_financ_: TQuery;
    qry_inst_financ_CODIGO: TStringField;
    qry_inst_financ_DESCRICAO: TStringField;
    dsq_inst_financ_: TDataSource;
    sp_exclui_adicao: TStoredProc;
    StringField8: TStringField;
    StringField9: TStringField;
    ds_tp_recipiente: TDataSource;
    tbl_tp_recipiente_: TTable;
    tbl_tp_recipiente_Codigo: TStringField;
    tbl_tp_recipiente_Descricao: TStringField;
    ds_assoc_acresc: TDataSource;
    qry_assoc_acresc_: TQuery;
    ds_assoc_ded: TDataSource;
    qry_assoc_ded_: TQuery;
    qry_assoc_acresc_COD_INCOTERMS: TStringField;
    qry_assoc_acresc_COD_ACR_DECR: TStringField;
    qry_assoc_acresc_look_Descricao: TStringField;
    qry_assoc_ded_COD_INCOTERMS: TStringField;
    qry_assoc_ded_COD_ACR_DECR: TStringField;
    qry_assoc_ded_look_Descricao: TStringField;
    qry_espec_nve_desc_CD_NOMENC_NCM: TStringField;
    qry_espec_nve_desc_CD_ATRIBUTO_NCM: TStringField;
    qry_espec_nve_desc_CD_ESPECIF_NCM: TStringField;
    qry_espec_nve_desc_CD_NIVEL_NCM: TStringField;
    qry_espec_nve_desc_NM_ESPECIF_NCM: TStringField;
    ds_nve_pesq: TDataSource;
    qry_nve_pesq_: TQuery;
    ds_incoterms: TDataSource;
    tbl_incoterms_: TTable;
    tbl_tributacao_icms: TTable;
    tbl_tributacao_icmsCD_TRIBUTACAO_ICMS: TStringField;
    tbl_tributacao_icmsNM_TRIBUTACAO_ICMS: TStringField;
    qry_di_: TQuery;
    qry_di_NR_PROCESSO: TStringField;
    qry_di_QT_ADICOES: TIntegerField;
    qry_di_CD_MOEDA_MLE: TStringField;
    qry_di_DT_ULTIMA_ALTERACAO: TDateTimeField;
    qry_di_IN_RISC_ATUALIZADO: TStringField;
    qry_di_CD_URF_DESPACHO: TStringField;
    qry_di_CD_RECINTO_ALFAND: TStringField;
    qry_di_CD_TIPO_DECLARACAO: TStringField;
    qry_adicao_: TQuery;
    qry_adicao_NR_PROCESSO: TStringField;
    qry_adicao_NR_ADICAO: TStringField;
    qry_adicao_CD_ACORDO_ALADI: TStringField;
    qry_adicao_CD_AGENC_AGENT_IMP: TStringField;
    qry_adicao_CD_APLICACAO_MERC: TStringField;
    qry_adicao_CD_AUSENCIA_FABRIC: TStringField;
    qry_adicao_CD_BANC_AGENTE_IMP: TStringField;
    qry_adicao_CD_COBERT_CAMBIAL: TStringField;
    qry_adicao_CD_FABRICANTE: TStringField;
    qry_adicao_CD_FORNECEDOR: TStringField;
    qry_adicao_CD_FUND_LEG_REGIME: TStringField;
    qry_adicao_CD_INCOTERMS_VENDA: TStringField;
    qry_adicao_CD_LOC_COND_VENDA: TStringField;
    qry_adicao_CD_MD_FRETE_MERC: TStringField;
    qry_adicao_CD_MERC_NALADI_NCC: TStringField;
    qry_adicao_CD_MERC_NALADI_SH: TStringField;
    qry_adicao_CD_MERC_NBM_SH: TStringField;
    qry_adicao_CD_NCM_SH: TStringField;
    qry_adicao_CD_MERCADORIA_NCM: TStringField;
    qry_adicao_CD_METOD_VALORACAO: TStringField;
    qry_adicao_CD_MODALIDADE_PGTO: TStringField;
    qry_adicao_CD_MOEDA_NEGOCIADA: TStringField;
    qry_adicao_CD_MOEDA_SEG_MERC: TStringField;
    qry_adicao_CD_MOEDAS_DESPESAS: TStringField;
    qry_adicao_CD_MOTIVO_ADM_TEMP: TStringField;
    qry_adicao_CD_MOTIVO_SEM_COB: TStringField;
    qry_adicao_CD_ORGAO_FIN_INTER: TStringField;
    qry_adicao_CD_PAIS_AQUIS_MERC: TStringField;
    qry_adicao_CD_PAIS_ORIG_MERC: TStringField;
    qry_adicao_CD_PAIS_PROC_MERC: TStringField;
    qry_adicao_CD_PERIOD_PGTO_360: TStringField;
    qry_adicao_CD_REGIME_TRIBUTAR: TStringField;
    qry_adicao_CD_TAXA_JUROS: TStringField;
    qry_adicao_CD_TIPO_ACORDO_TAR: TStringField;
    qry_adicao_CD_TIPO_AGENTE_IMP: TStringField;
    qry_adicao_CD_URF_ENTR_MERC: TStringField;
    qry_adicao_CD_VIA_TRANSPORTE: TStringField;
    qry_adicao_CD_VINC_IMPO_EXPO: TStringField;
    qry_adicao_ED_CIDAD_FABRIC: TStringField;
    qry_adicao_ED_CIDAD_FORN_ESTR: TStringField;
    qry_adicao_ED_COMPL_FABRIC: TStringField;
    qry_adicao_ED_COMPL_FORN_ESTR: TStringField;
    qry_adicao_ED_ESTAD_FORN_ESTR: TStringField;
    qry_adicao_ED_ESTADO_FABRIC: TStringField;
    qry_adicao_ED_LOGR_FABRIC: TStringField;
    qry_adicao_ED_LOGR_FORN_ESTR: TStringField;
    qry_adicao_ED_NR_FABRIC: TStringField;
    qry_adicao_ED_NR_FORN_ESTR: TStringField;
    qry_adicao_IN_BEM_ENCOMENDA: TBooleanField;
    qry_adicao_IN_IPI_NAO_TRIBUT: TBooleanField;
    qry_adicao_IN_JUROS_ATE_360: TBooleanField;
    qry_adicao_IN_MATERIAL_USADO: TBooleanField;
    qry_adicao_IN_MULTIMODAL: TBooleanField;
    qry_adicao_IN_PGTO_VARIAV_360: TBooleanField;
    qry_adicao_NM_FABRICANTE_MERC: TStringField;
    qry_adicao_NM_FORN_ESTR: TStringField;
    qry_adicao_NR_AGENTE_IMP: TStringField;
    qry_adicao_NR_DCTO_REDUCAO: TStringField;
    qry_adicao_NR_OPER_TRAT_PREV: TStringField;
    qry_adicao_NR_ROF: TStringField;
    qry_adicao_PC_COEF_REDUC_II: TFloatField;
    qry_adicao_PC_COMISSAO_AG_IMP: TFloatField;
    qry_adicao_PC_TAXA_JUROS: TFloatField;
    qry_adicao_PL_MERCADORIA: TFloatField;
    qry_adicao_QT_ITENS_ADICAO: TIntegerField;
    qry_adicao_QT_PARC_FINANC_360: TIntegerField;
    qry_adicao_QT_PERIOD_PGTO_360: TIntegerField;
    qry_adicao_QT_UN_ESTATISTICA: TFloatField;
    qry_adicao_TX_COMPL_VL_ADUAN: TStringField;
    qry_adicao_VL_ACRESCIMOS_MN: TFloatField;
    qry_adicao_VL_CALC_DCR_DOLAR: TFloatField;
    qry_adicao_VL_COMISSAO_AG_IMP: TFloatField;
    qry_adicao_VL_DEDUCOES_MN: TFloatField;
    qry_adicao_VL_DESPESAS_MN: TFloatField;
    qry_adicao_VL_DESPESAS_MNEG: TFloatField;
    qry_adicao_VL_FINANC_SUP_360: TFloatField;
    qry_adicao_VL_FRETE_MERC_MN: TFloatField;
    qry_adicao_VL_FRETE_MERC_MNEG: TFloatField;
    qry_adicao_VL_II_A_REC_ZFM: TFloatField;
    qry_adicao_VL_II_CALC_DCR_MN: TFloatField;
    qry_adicao_VL_II_DEVIDO_ZFM: TFloatField;
    qry_adicao_VL_MERC_COND_VENDA: TFloatField;
    qry_adicao_VL_MERC_EMB_MN: TFloatField;
    qry_adicao_VL_MERC_VENDA_MN: TFloatField;
    qry_adicao_VL_SEG_MERC_MN: TFloatField;
    qry_adicao_VL_SEG_MERC_MNEG: TFloatField;
    qry_adicao_VL_TOT_FINANC_360: TFloatField;
    qry_adicao_VL_UNID_LOC_EMP: TFloatField;
    qry_adicao_IN_ADICAO_CALCULADA: TBooleanField;
    qry_adicao_PC_ICMS: TFloatField;
    qry_adicao_PC_REDUCAO_ICMS: TFloatField;
    qry_adicao_VL_ICMS_CALCULADO: TFloatField;
    qry_adicao_VL_ICMS_A_RECOLHER: TFloatField;
    qry_adicao_CD_MOEDA_MLE: TStringField;
    qry_adicao_TX_MLE: TFloatField;
    qry_adicao_TX_FRETE: TFloatField;
    qry_adicao_TX_SEGURO: TFloatField;
    qry_adicao_TX_DOLAR: TFloatField;
    qry_adicao_CD_TRIBUTACAO_ICMS: TStringField;
    qry_adicao_vl_base_calculo_mn: TFloatField;
    qry_adicao_vl_merc_loc_emb_mn: TFloatField;
    qry_adicao_vl_merc_loc_emb_mneg: TFloatField;
    qry_adicao_Look_Pais_origem: TStringField;
    qry_adicao_Look_Pais_Aquisicao: TStringField;
    qry_adicao_Look_Pais_Procedencia: TStringField;
    qry_adicao_Look_Exportador: TStringField;
    qry_adicao_Look_Fabricante: TStringField;
    qry_adicao_Look_Loc_Cond_Venda: TStringField;
    qry_adicao_Look_Reg_Trib: TStringField;
    qry_adicao_Look_Mot_Sem_Cobertura: TStringField;
    qry_adicao_Look_Metodo_Valoracao: TStringField;
    qry_adicao_Look_nm_Trib_ICMS: TStringField;
    qry_itens_: TQuery;
    qry_itens_NR_PROCESSO: TStringField;
    qry_itens_NR_ADICAO: TStringField;
    qry_itens_NR_ITEM: TStringField;
    qry_itens_CD_NCM_SH: TStringField;
    qry_itens_CD_NALADI_SH: TStringField;
    qry_itens_CD_NALADI_NCCA: TStringField;
    qry_itens_QT_MERC_UN_COMERC: TFloatField;
    qry_itens_QT_MERC_UN_ESTAT: TFloatField;
    qry_itens_PL_MERCADORIA: TFloatField;
    qry_itens_PC_DESCONTO_MERC: TFloatField;
    qry_itens_VL_UNITARIO: TFloatField;
    qry_itens_VL_DESCONTO_MERC: TFloatField;
    qry_itens_VL_MLE_ITEM: TFloatField;
    qry_itens_VL_FRETE_ITEM: TFloatField;
    qry_itens_VL_SEGURO_ITEM: TFloatField;
    qry_itens_VL_MCV_ITEM: TFloatField;
    qry_itens_VL_UNID_COND_VENDA: TFloatField;
    qry_itens_CD_TIPO_CALCULO_ITEM: TStringField;
    qry_itens_CD_MERCADORIA: TStringField;
    qry_itens_CD_FABR_EXPO: TStringField;
    qry_itens_CD_EXPORTADOR: TStringField;
    qry_itens_CD_PAIS_ORIGEM: TStringField;
    qry_itens_CD_FABRICANTE: TStringField;
    qry_itens_CD_PAIS_AQUISICAO: TStringField;
    sp_di_repassa_campos_classif: TStoredProc;
    qry_ad_ii_: TQuery;
    qry_ad_ii_NR_PROCESSO: TStringField;
    qry_ad_ii_NR_ADICAO: TStringField;
    qry_ad_ii_CD_RECEITA_IMPOSTO: TStringField;
    qry_ad_ii_CD_TIPO_ALIQ_IPT: TStringField;
    qry_ad_ii_VL_BASE_CALC_ADVAL: TFloatField;
    qry_ad_ii_PC_ALIQ_NORM_ADVAL: TFloatField;
    qry_ad_ii_VL_CALC_IPT_ADVAL: TFloatField;
    qry_ad_ii_NM_UN_ALIQ_ESP_IPT: TStringField;
    qry_ad_ii_CD_TIPO_RECIPIENTE: TStringField;
    qry_ad_ii_QT_ML_RECIPIENTE: TFloatField;
    qry_ad_ii_QT_MERC_UN_ALIQ_ES: TFloatField;
    qry_ad_ii_VL_ALIQ_ESPEC_IPT: TFloatField;
    qry_ad_ii_VL_CALC_IPT_ESPEC: TFloatField;
    qry_ad_ii_CD_TIPO_BENEF_IPI: TStringField;
    qry_ad_ii_PC_ALIQ_REDUZIDA: TFloatField;
    qry_ad_ii_PC_REDUCAO_IPT_BLI: TFloatField;
    qry_ad_ii_PC_ALIQ_ACOR_TARIF: TFloatField;
    qry_ad_ii_VL_CALC_II_AC_TARI: TFloatField;
    qry_ad_ii_VL_IMPOSTO_DEVIDO: TFloatField;
    qry_ad_ii_VL_IPT_A_RECOLHER: TFloatField;
    qry_ad_ii_CD_TIPO_DIREITO: TStringField;
    qry_ad_ii_NR_NOTA_COMPL_TIPI: TStringField;
    qry_ad_ipi_: TQuery;
    qry_ad_ipi_NR_PROCESSO: TStringField;
    qry_ad_ipi_NR_ADICAO: TStringField;
    qry_ad_ipi_CD_RECEITA_IMPOSTO: TStringField;
    qry_ad_ipi_CD_TIPO_ALIQ_IPT: TStringField;
    qry_ad_ipi_VL_BASE_CALC_ADVAL: TFloatField;
    qry_ad_ipi_PC_ALIQ_NORM_ADVAL: TFloatField;
    qry_ad_ipi_VL_CALC_IPT_ADVAL: TFloatField;
    qry_ad_ipi_NM_UN_ALIQ_ESP_IPT: TStringField;
    qry_ad_ipi_CD_TIPO_RECIPIENTE: TStringField;
    qry_ad_ipi_QT_ML_RECIPIENTE: TFloatField;
    qry_ad_ipi_QT_MERC_UN_ALIQ_ES: TFloatField;
    qry_ad_ipi_VL_ALIQ_ESPEC_IPT: TFloatField;
    qry_ad_ipi_VL_CALC_IPT_ESPEC: TFloatField;
    qry_ad_ipi_CD_TIPO_BENEF_IPI: TStringField;
    qry_ad_ipi_PC_ALIQ_REDUZIDA: TFloatField;
    qry_ad_ipi_PC_REDUCAO_IPT_BLI: TFloatField;
    qry_ad_ipi_PC_ALIQ_ACOR_TARIF: TFloatField;
    qry_ad_ipi_VL_CALC_II_AC_TARI: TFloatField;
    qry_ad_ipi_VL_IMPOSTO_DEVIDO: TFloatField;
    qry_ad_ipi_VL_IPT_A_RECOLHER: TFloatField;
    qry_ad_ipi_CD_TIPO_DIREITO: TStringField;
    qry_ad_ipi_NR_NOTA_COMPL_TIPI: TStringField;
    qry_ad_antidump_: TQuery;
    qry_ad_antidump_NR_PROCESSO: TStringField;
    qry_ad_antidump_NR_ADICAO: TStringField;
    qry_ad_antidump_CD_RECEITA_IMPOSTO: TStringField;
    qry_ad_antidump_CD_TIPO_ALIQ_IPT: TStringField;
    qry_ad_antidump_VL_BASE_CALC_ADVAL: TFloatField;
    qry_ad_antidump_PC_ALIQ_NORM_ADVAL: TFloatField;
    qry_ad_antidump_VL_CALC_IPT_ADVAL: TFloatField;
    qry_ad_antidump_NM_UN_ALIQ_ESP_IPT: TStringField;
    qry_ad_antidump_CD_TIPO_RECIPIENTE: TStringField;
    qry_ad_antidump_QT_ML_RECIPIENTE: TFloatField;
    qry_ad_antidump_QT_MERC_UN_ALIQ_ES: TFloatField;
    qry_ad_antidump_VL_ALIQ_ESPEC_IPT: TFloatField;
    qry_ad_antidump_VL_CALC_IPT_ESPEC: TFloatField;
    qry_ad_antidump_CD_TIPO_BENEF_IPI: TStringField;
    qry_ad_antidump_PC_ALIQ_REDUZIDA: TFloatField;
    qry_ad_antidump_PC_REDUCAO_IPT_BLI: TFloatField;
    qry_ad_antidump_PC_ALIQ_ACOR_TARIF: TFloatField;
    qry_ad_antidump_VL_CALC_II_AC_TARI: TFloatField;
    qry_ad_antidump_VL_IMPOSTO_DEVIDO: TFloatField;
    qry_ad_antidump_VL_IPT_A_RECOLHER: TFloatField;
    qry_ad_antidump_CD_TIPO_DIREITO: TStringField;
    qry_ad_antidump_NR_NOTA_COMPL_TIPI: TStringField;
    qry_ad_cambio_pg_antec_NR_PROCESSO: TStringField;
    qry_ad_cambio_pg_antec_NR_ADICAO: TStringField;
    qry_ad_cambio_pg_antec_CD_FORMA_PAGAMENTO: TStringField;
    qry_ad_cambio_pg_antec_NR_SEQUENCIA: TAutoIncField;
    qry_ad_cambio_pg_antec_IN_PAGAMENTO_MN: TStringField;
    qry_ad_cambio_pg_antec_CD_BANCO_PAGAMENTO: TStringField;
    qry_ad_cambio_pg_antec_CD_PRACA_PAGAMENTO: TStringField;
    qry_ad_cambio_pg_antec_NR_OP_CAMBIO: TStringField;
    qry_ad_cambio_pg_antec_VL_VINC_MD_CAMBIO: TFloatField;
    qry_ad_cambio_pg_antec_NR_COMPR_CAMBIO: TStringField;
    qry_ad_cambio_pg_antec_CD_TP_COMPR_CAMBIO: TStringField;
    qry_ad_cambio_pg_antec_Look_Moeda_Nac: TStringField;
    qry_taxa_cambio_: TQuery;
    qry_taxa_cambio_CD_MOEDA: TStringField;
    qry_taxa_cambio_DT_INICIO_VIGENCIA: TDateTimeField;
    qry_taxa_cambio_DT_TERMINO_VIGENCIA: TDateTimeField;
    qry_taxa_cambio_TX_CAMBIO: TFloatField;
    qry_di_DT_REGISTRO_DI: TStringField;
    qry_di_IN_MOEDA_UNICA: TBooleanField;
    qry_itens_CD_UN_MED_COMERC: TStringField;
    tbl_ad_destaque_ncm_NR_SEQUENCIA: TAutoIncField;
    tbl_ad_docto_vinc_NR_SEQUENCIA: TAutoIncField;
    tbl_ad_cambio_parc_var_NR_SEQUENCIA: TAutoIncField;
    qry_ad_cambio_pg_avista_NR_SEQUENCIA: TAutoIncField;
    tbl_mot_ad_temp_: TTable;
    ds_mot_ad_temp: TDataSource;
    qry_adicao_Look_Mot_Ad_Temp: TStringField;
    qry_nve_NR_PROCESSO: TStringField;
    qry_nve_NR_ADICAO: TStringField;
    qry_nve_CD_NIVEL_NVE: TStringField;
    qry_nve_CD_ATRIBUTO_NCM: TStringField;
    qry_nve_CD_ESPECIF_NCM: TStringField;
    qry_abrangencia_nve_: TQuery;
    qry_abrangencia_nve_CODIGO: TStringField;
    qry_abrangencia_nve_DESCRICAO: TStringField;
    qry_nve_LookNivel: TStringField;
    ds_nivel: TDataSource;
    qry_nivel_: TQuery;
    qry_nivel_CD_NIVEL_NVE: TStringField;
    qry_nivel_NM_NIVEL: TStringField;
    qry_nve_LookAtributo: TStringField;
    qry_nve_LookEspecif: TStringField;
    qry_disp_legal_: TQuery;
    qry_disp_legal_CD_EX: TStringField;
    qry_disp_legal_NM_EX: TStringField;
    qry_disp_legal_CD_TRIB: TStringField;
    qry_trat_tribut_: TQuery;
    qry_disp_legal_LookupTributacao: TStringField;
    qry_trat_tribut_CD_TRAT_TRIB_ICMS: TStringField;
    qry_trat_tribut_NM_TRAT_TRIB_ICMS: TStringField;
    qry_adicao_CD_FUND_LEGAL_ICMS: TStringField;
    qry_adicao_Look_Disp_Legal: TStringField;
    qry_disp_legal_NM_FUND_LEGAL: TStringField;
    sp_atz_tipo_icms: TStoredProc;
    qry_adicao_VL_DESPESAS: TFloatField;
    tbl_empresa_est_NM_EMPRESA: TStringField;
    tbl_empresa_est_END_COMPL: TStringField;
    tbl_empresa_est_END_EMPRESA: TStringField;
    qry_adicao_NR_DESTAQUE_NCM: TStringField;
    qry_adicao_NR_ATO_DRAWBACK: TStringField;
    qry_adicao_ALIQ_PIS: TFloatField;
    qry_adicao_ALIQ_COFINS: TFloatField;
    qry_adicao_VL_BASE_PIS: TFloatField;
    qry_adicao_VL_PIS: TFloatField;
    qry_adicao_VL_COFINS: TFloatField;
    qry_adicao_TX_PIS_COFINS: TMemoField;
    qry_adicao_CD_TIPO_BENEF_PIS_COFINS: TStringField;
    qry_adicao_PC_REDUCAO_PIS_COFINS: TFloatField;
    qry_adicao_IN_MANUAL_NCM: TStringField;
    qry_adicao_VL_BASE_CALC_ICMS: TFloatField;
    qry_adicao_CD_FUND_LEGAL_PISCOFINS: TStringField;
    qry_adicao_VL_BASE_CALC_II: TFloatField;
    qry_adicao_VL_BASE_CALC_IPI: TFloatField;
    qry_adicao_VL_TX_SCX_AD: TFloatField;
    qry_adicao_PC_REDUCAO_IPT_II: TFloatField;
    qry_adicao_PC_REDUCAO_IPT_IPI: TFloatField;
    qry_adicao_PB_MERCADORIA: TFloatField;
    qry_adicao_IN_PERMITE_CAT63: TStringField;
    qry_adicao_VL_BASE_CALC_ICMS_AFRMM: TFloatField;
    qry_adicao_VL_ICMS_A_RECOLHER_AFRMM: TFloatField;
    qry_adicao_VL_ICMS_DEVIDO_AFRMM: TFloatField;
    qry_adicao_CD_CFOP: TStringField;
    qry_ncm_DATA_INICIO_VIG_GATT: TStringField;
    qry_ncm_DATA_FIM_VIG_GATT: TStringField;
    qry_adicao_IN_FUNDO_POBREZA: TStringField;
    qry_adicao_VL_ALIQUOTA_ESPECIFICA_PIS: TFloatField;
    qry_adicao_VL_ALIQUOTA_ESPECIFICA_COFINS: TFloatField;
    qry_adicao_QTD_UNID_ESPECIFICA_PIS: TFloatField;
    qry_adicao_QTD_UNID_ESPECIFICA_COFINS: TFloatField;
    qry_adicao_CD_UNIDADE_MEDIDA_PIS: TStringField;
    qry_adicao_CD_UNIDADE_MEDIDA_COFINS: TStringField;
    qry_adicao_QT_MESES_ADM_TEMP: TIntegerField;
    qry_Aliquota_GATT: TQuery;
    qry_Aliquota_GATTALIQUOTA_GATT: TFloatField;
    qry_adicao_VL_PIS_CALCULADO: TFloatField;
    qry_adicao_VL_COFINS_CALCULADO: TFloatField;
    qry_adicao_IN_SUSPENDE_II_RETIFIC: TBooleanField;
    qry_adicao_IN_SUSPENDE_IPI_RETIFIC: TBooleanField;
    qry_adicao_IN_SUSPENDE_PIS_COFINS_RETIFIC: TBooleanField;
    upd_adicao: TUpdateSQL;
    upd_di: TUpdateSQL;
    qry_adicao_VL_AFRMM: TFloatField;
    qry_adicao_ALIQ_PIS_REDUZIDA: TFloatField;
    qry_adicao_ALIQ_COFINS_REDUZIDA: TFloatField;
    qry_adicao_Look_NM_NCM: TStringField;
    qry_adicao_VL_MULTA_II: TFloatField;
    qry_adicao_VL_JUROS_II: TFloatField;
    qry_adicao_VL_MULTA_IPI: TFloatField;
    qry_adicao_VL_JUROS_IPI: TFloatField;
    qry_adicao_VL_MULTA_PIS: TFloatField;
    qry_adicao_VL_JUROS_PIS: TFloatField;
    qry_adicao_VL_MULTA_COFINS: TFloatField;
    qry_adicao_VL_JUROS_COFINS: TFloatField;
    qry_di_IN_FMA: TStringField;
    qry_di_DT_PAGAMENTO_DARF: TDateTimeField;
    qry_adicao_CD_TP_PGMTO_AFRMM: TStringField;
    qry_adicao_CD_TP_ISENCAO: TStringField;
    qry_adicao_CD_TP_SUSPENSAO: TStringField;
    qry_adicao_NR_PARCELA_ENTREPOSTO: TIntegerField;
    tbl_TTP_ISENCAO_AFRMM: TTable;
    tbl_TTP_SUSPENSAO_AFRMM: TTable;
    qry_adicao_Look_Tp_Suspensao: TStringField;
    qry_adicao_Look_CD_TP_ISENCAO: TStringField;
    qry_adicao_DT_VENCIMENTO_SUSPENSAO: TDateTimeField;
    qry_adicao_NR_ATO_CONCESSORIO: TStringField;
    qryValidaViaTransp: TQuery;
    qry_adicao_CD_FUND_LEGAL_II_DUIMP: TStringField;
    qry_adicao_CD_FUND_LEGAL_IPI_DUIMP: TStringField;
    qry_adicao_CD_FUND_LEGAL_PISCOFINS_DUIMP: TStringField;
    tblFundLegalIIDuimp: TTable;
    qry_adicao_Look_fund_legal_ii_duimp: TStringField;
    tblFundLegalIPIDuimp: TTable;
    tblFundLegalPisCofinsDuimp: TTable;
    qry_adicao_Look_fund_legal_ipi_duimp: TStringField;
    qry_adicao_Look_fund_legal_piscofins_duimp: TStringField;
    qry_adicao_VL_IS: TFloatField;
    qry_adicao_VL_CIDE: TFloatField;
    qry_adicao_VL_DIR_COMP: TFloatField;
    qry_adicao_VL_MED_SAL: TFloatField;
    qry_adicao_VL_OUTROS_TRIB: TFloatField;
    qry_adicao_ALIQ_IBS_UF: TFloatField;
    qry_adicao_ALIQ_IBS_MUN: TFloatField;
    qry_adicao_ALIQ_CBS: TFloatField;
    qry_adicao_VL_IBS_MUN: TFloatField;
    qry_adicao_VL_IBS_UF: TFloatField;
    qry_adicao_VL_CBS: TFloatField;
    qry_adicao_VL_BASE_IBS_CBS: TFloatField;
    procedure tbl_di_doc_instr_emb_AfterPost(DataSet: TDataSet);
    procedure tbl_di_proc_vinc_AfterPost(DataSet: TDataSet);
    procedure tbl_di_armazem_AfterPost(DataSet: TDataSet);
    procedure tbl_di_volumes_AfterPost(DataSet: TDataSet);
    procedure tbl_di_darf_AfterPost(DataSet: TDataSet);
    procedure tbl_di_comp_trib_AfterPost(DataSet: TDataSet);
    procedure tbl_ad_destaque_ncm_AfterPost(DataSet: TDataSet);
    procedure tbl_ad_docto_vinc_AfterPost(DataSet: TDataSet);
    procedure tbl_ad_acrescimos_AfterPost(DataSet: TDataSet);
    procedure tbl_ad_deducoes_AfterPost(DataSet: TDataSet);
    procedure tbl_ad_acrescimos_VL_ACRESCIMO_MOEDAChange(Sender: TField);
    procedure tbl_ad_deducoes_VL_DEDUCAO_MNEGChange(Sender: TField);
    procedure tbl_ad_ato_legal_antidump_BeforePost(DataSet: TDataSet);
    procedure tbl_ad_ato_legal_acordo_tar_BeforePost(DataSet: TDataSet);
    procedure tbl_ad_ato_legal_benef_ipi_BeforePost(DataSet: TDataSet);
    procedure tbl_ad_antidump_BeforePost(DataSet: TDataSet);
    procedure tbl_ad_cambio_parc_var_AfterPost(DataSet: TDataSet);
    procedure qry_adicao_CD_FORNECEDORChange(Sender: TField);
    procedure qry_adicao_CD_FABRICANTEChange(Sender: TField);
    procedure qry_adicao_CD_PAIS_ORIG_MERCChange(Sender: TField);
    procedure qry_adicao_CD_PAIS_AQUIS_MERCChange(Sender: TField);
    procedure qry_adicao_CD_MERCADORIA_NCMChange(Sender: TField);
    procedure qry_adicao_CD_MERC_NALADI_SHChange(Sender: TField);
    procedure qry_adicao_CD_MERC_NALADI_NCCChange(Sender: TField);
    procedure qry_adicao_CD_AUSENCIA_FABRICChange(Sender: TField);
    procedure qry_adicao_BeforeDelete(DataSet: TDataSet);
    procedure qry_adicao_BeforeEdit(DataSet: TDataSet);
    procedure qry_adicao_BeforeInsert(DataSet: TDataSet);
    procedure qry_di_BeforeEdit(DataSet: TDataSet);
    procedure qry_ad_ii_BeforePost(DataSet: TDataSet);
    procedure qry_ad_ipi_BeforePost(DataSet: TDataSet);
    procedure qry_ad_antidump_BeforePost(DataSet: TDataSet);
    procedure qry_adicao_CD_MOTIVO_SEM_COBChange(Sender: TField);
    procedure qry_adicao_CD_MODALIDADE_PGTOChange(Sender: TField);
    procedure tbl_ad_ato_leg_ncm_NR_EX_ATO_VINCULChange(Sender: TField);
    procedure tbl_ad_ato_legal_nbm_NR_EX_ATO_VINCULChange(Sender: TField);
    procedure tbl_ad_ato_legal_benef_ipi_NR_EX_ATO_VINCULChange(Sender: TField);
    procedure tbl_ad_ato_legal_antidump_NR_EX_ATO_VINCULChange(Sender: TField);
    procedure tbl_ad_ato_legal_acordo_tar_SG_TIPO_ATO_VINCULChange(Sender: TField);
    procedure tbl_ad_ato_legal_acordo_tar_SG_ORG_ATO_VINCULChange(Sender: TField);
    procedure tbl_ad_ato_legal_acordo_tar_DT_ANO_ATO_VINCULChange(Sender: TField);
    procedure tbl_ad_ato_legal_acordo_tar_NR_ATO_VINCULADOChange(Sender: TField);
    procedure tbl_ad_ato_legal_acordo_tar_NR_EX_ATO_VINCULChange(Sender: TField);
    procedure tbl_ad_ato_legal_nbm_BeforePost(DataSet: TDataSet);
    procedure tbl_ad_ato_leg_ncm_BeforePost(DataSet: TDataSet);
    procedure qry_adicao_AfterOpen(DataSet: TDataSet);
    procedure tbl_ad_destaque_ncm_BeforePost(DataSet: TDataSet);
    procedure tbl_ad_docto_vinc_BeforePost(DataSet: TDataSet);
    procedure qry_ad_cambio_pg_antec_BeforePost(DataSet: TDataSet);
    procedure tbl_ad_cambio_parc_var_BeforePost(DataSet: TDataSet);
    procedure qry_ad_cambio_pg_avista_BeforePost(DataSet: TDataSet);
    procedure VerificaEstado(Habilita : Boolean);
    procedure qry_adicao_AfterPost(DataSet: TDataSet);
    procedure qry_adicao_AfterScroll(DataSet: TDataSet);
    procedure qry_adicao_PC_ICMSChange(Sender: TField);
    procedure qry_adicao_PC_REDUCAO_ICMSChange(Sender: TField);
    procedure DataModuleCreate(Sender: TObject);
    procedure qry_adicao_CD_FUND_LEG_REGIMEChange(Sender: TField);
    procedure qry_di_AfterPost(DataSet: TDataSet);
    procedure qry_di_AfterDelete(DataSet: TDataSet);
    procedure qry_nve_AfterPost(DataSet: TDataSet);
    procedure ds_nveStateChange(Sender: TObject);
    procedure qry_nve_NewRecord(DataSet: TDataSet);
    procedure qry_nve_AfterDelete(DataSet: TDataSet);
    procedure ds_diStateChange(Sender: TObject);
    procedure qry_di_IN_FMAChange(Sender: TField);
  private
    AliquotasSemFundo: array of Double;
    function PossuiEx(pTipo: string): Boolean;
    function DoubeIndex(ADoubleArray: array of Double; AValue: Double): Integer;
  public
    Grupo: String;
    in_RJ: Boolean;
    PC_Fundo_Pobreza: Double;
  end;

var
  datm_DI_Adicao: Tdatm_DI_Adicao;

implementation

uses GSMLIB, PGDI004, PGGP001, PGGP017, PGDI003, ConsOnlineEx;

{$R *.DFM}

procedure Tdatm_DI_Adicao.tbl_di_doc_instr_emb_AfterPost(DataSet: TDataSet);
begin
  DataSet.Refresh;
end;

procedure Tdatm_DI_Adicao.tbl_di_proc_vinc_AfterPost(DataSet: TDataSet);
begin
  DataSet.Refresh;
end;

procedure Tdatm_DI_Adicao.tbl_di_armazem_AfterPost(DataSet: TDataSet);
begin
  DataSet.Refresh;
end;

procedure Tdatm_DI_Adicao.tbl_di_volumes_AfterPost(DataSet: TDataSet);
begin
  DataSet.Refresh;
end;

procedure Tdatm_DI_Adicao.tbl_di_darf_AfterPost(DataSet: TDataSet);
begin
  DataSet.Refresh;
end;

procedure Tdatm_DI_Adicao.tbl_di_comp_trib_AfterPost(DataSet: TDataSet);
begin
  DataSet.Refresh;
end;

procedure Tdatm_DI_Adicao.tbl_ad_destaque_ncm_AfterPost(DataSet: TDataSet);
begin
  DataSet.Refresh;
end;

procedure Tdatm_DI_Adicao.tbl_ad_docto_vinc_AfterPost(DataSet: TDataSet);
begin
  DataSet.Refresh;
end;

procedure Tdatm_DI_Adicao.tbl_ad_acrescimos_AfterPost(DataSet: TDataSet);
begin
  DataSet.Refresh;
end;

procedure Tdatm_DI_Adicao.tbl_ad_deducoes_AfterPost(DataSet: TDataSet);
begin
  DataSet.Refresh;
end;

procedure Tdatm_DI_Adicao.tbl_ad_acrescimos_VL_ACRESCIMO_MOEDAChange(Sender: TField);
begin
  if Not( tbl_ad_acrescimos_.State in [dsEdit,dsInsert] ) then Exit;
  if frm_DI.in_DI_Retificacao then
  begin
    tbl_ad_acrescimos_VL_ACRESCIMO_MN.AsFloat :=
       tbl_ad_acrescimos_VL_ACRESCIMO_MOEDA.AsFloat *
       frm_DI_adicao.AtzTaxaCambialAdicao(tbl_ad_acrescimos_CD_MD_NEGOC_ACRES.AsString);
  end
  else
  begin
    if Not( tbl_ad_acrescimos_.State in [dsEdit,dsInsert] ) then Exit;
    if (tbl_taxa_cambio_.findkey([tbl_ad_acrescimos_CD_MD_NEGOC_ACRES.AsString ])) then
      tbl_ad_acrescimos_VL_ACRESCIMO_MN.AsFloat :=
      tbl_ad_acrescimos_VL_ACRESCIMO_MOEDA.AsFloat *
      tbl_taxa_cambio_taxa_conversao.AsFloat
    else
      tbl_ad_acrescimos_VL_ACRESCIMO_MN.AsFloat := 0;
  end;
end;

procedure Tdatm_DI_Adicao.tbl_ad_deducoes_VL_DEDUCAO_MNEGChange(Sender: TField);
begin
  if Not( tbl_ad_deducoes_.State in [dsEdit,dsInsert] ) then Exit;
  if frm_DI.in_DI_Retificacao then
  begin
    tbl_ad_deducoes_VL_DEDUCAO_MN.AsFloat :=
       tbl_ad_deducoes_VL_DEDUCAO_MNEG.AsFloat *
       frm_DI_adicao.AtzTaxaCambialAdicao(tbl_ad_deducoes_CD_MD_NEGOC_DEDUC.AsString);
  end
  else
  begin
    if (tbl_taxa_cambio_.findkey([tbl_ad_deducoes_CD_MD_NEGOC_DEDUC.AsString])) then
      tbl_ad_deducoes_VL_DEDUCAO_MN.AsFloat :=
         tbl_ad_deducoes_VL_DEDUCAO_MNEG.AsFloat *
         tbl_taxa_cambio_taxa_conversao.AsFloat
    else
      tbl_ad_deducoes_VL_DEDUCAO_MN.AsFloat := 0;
  end;
end;

procedure Tdatm_DI_Adicao.tbl_ad_ato_legal_antidump_BeforePost(DataSet: TDataSet);
begin
  tbl_ad_ato_legal_antidump_CD_ASSUNTO_VINCUL.AsString := '6';
end;

procedure Tdatm_DI_Adicao.tbl_ad_ato_legal_acordo_tar_BeforePost(DataSet: TDataSet);
begin
  if qry_adicao_CD_TIPO_ACORDO_TAR.AsString = '2' then
    tbl_ad_ato_legal_acordo_tar_CD_ASSUNTO_VINCUL.AsString := '3'
  else
    tbl_ad_ato_legal_acordo_tar_CD_ASSUNTO_VINCUL.AsString := '5';
end;

procedure Tdatm_DI_Adicao.tbl_ad_ato_legal_benef_ipi_BeforePost(DataSet: TDataSet);
begin
  tbl_ad_ato_legal_benef_ipi_CD_ASSUNTO_VINCUL.AsString := '4';
end;

procedure Tdatm_DI_Adicao.tbl_ad_antidump_BeforePost(DataSet: TDataSet);
var
  lAdValorem : Boolean;
  lEspecifica : Boolean;
begin
  lAdValorem := False;
  lEspecifica := False;

  if (tbl_ad_antidump_.Active) then
  begin
    { INTERNACAO ZFM - PI - PRODUTO INDUSTRIALIZADO }
    if qry_di_CD_TIPO_DECLARACAO.AsString <> '19' then
      begin
        if (tbl_ad_antidump_PC_ALIQ_NORM_ADVAL.AsFloat > 0) then lAdValorem := TRUE;
        if (tbl_ad_antidump_VL_ALIQ_ESPEC_IPT.AsFloat > 0) then lEspecifica := TRUE;
        if (lAdValorem = True) and ( lEspecifica = False) then
           tbl_ad_antidump_CD_TIPO_ALIQ_IPT.AsString := '1'
        else if (lAdValorem = False) and ( lEspecifica = True) then
           tbl_ad_antidump_CD_TIPO_ALIQ_IPT.AsString := '2'
        else if (lAdValorem = True) and ( lEspecifica = True) then
           tbl_ad_antidump_CD_TIPO_ALIQ_IPT.AsString := '3'
        else
           tbl_ad_antidump_CD_TIPO_ALIQ_IPT.AsString := '1'
      end
  end
end;

procedure Tdatm_DI_Adicao.tbl_ad_cambio_parc_var_AfterPost(
  DataSet: TDataSet);
begin
  DataSet.Refresh;
end;

procedure Tdatm_DI_Adicao.qry_adicao_CD_FORNECEDORChange(Sender: TField);
begin
  with frm_DI_adicao do
  begin
    if Trim(dbedt_expo_codigo.Text) = '' then Exit;
    repassa_campos_classif:= True;
    if tbl_empresa_est_.FindKey([ StrZero( StrToInt(dbedt_expo_codigo.Text), 5 )]) then
    begin
      qry_adicao_NM_FORN_ESTR.AsString       := tbl_empresa_est_NM_EMPRESA.AsString;
      qry_adicao_ED_LOGR_FORN_ESTR.AsString  := tbl_empresa_est_END_EMPRESA.AsString;
      qry_adicao_ED_NR_FORN_ESTR.AsString    := tbl_empresa_est_END_NUMERO.AsString;
      qry_adicao_ED_COMPL_FORN_ESTR.AsString := tbl_empresa_est_END_COMPL.AsString;
      qry_adicao_ED_CIDAD_FORN_ESTR.AsString := tbl_empresa_est_END_CIDADE.AsString;
      qry_adicao_ED_ESTAD_FORN_ESTR.AsString := tbl_empresa_est_END_ESTADO.AsString;
      qry_adicao_CD_PAIS_AQUIS_MERC.AsString := tbl_empresa_est_CD_PAIS.AsString;
    end
    else
    begin
      qry_adicao_NM_FORN_ESTR.AsString       := '';
      qry_adicao_ED_LOGR_FORN_ESTR.AsString  := '';
      qry_adicao_ED_NR_FORN_ESTR.AsString    := '';
      qry_adicao_ED_COMPL_FORN_ESTR.AsString := '';
      qry_adicao_ED_CIDAD_FORN_ESTR.AsString := '';
      qry_adicao_ED_ESTAD_FORN_ESTR.AsString := '';
      qry_adicao_CD_PAIS_AQUIS_MERC.AsString := '';
    end;
  end;
end;

procedure Tdatm_DI_Adicao.qry_adicao_CD_FABRICANTEChange(Sender: TField);
begin
  with frm_DI_adicao do
  begin
    if Trim(dbedt_fabr_codigo.Text) = '' then Exit;
    repassa_campos_classif:= True;
    if tbl_empresa_est_.FindKey([ StrZero( StrToInt(dbedt_fabr_codigo.Text), 5 )]) then
    begin
      qry_adicao_NM_FABRICANTE_MERC.AsString := tbl_empresa_est_NM_EMPRESA.AsString;
      qry_adicao_ED_LOGR_FABRIC.AsString     := tbl_empresa_est_END_EMPRESA.AsString;
      qry_adicao_ED_NR_FABRIC.AsString       := tbl_empresa_est_END_NUMERO.AsString;
      qry_adicao_ED_COMPL_FABRIC.AsString    := tbl_empresa_est_END_COMPL.AsString;
      qry_adicao_ED_CIDAD_FABRIC.AsString    := tbl_empresa_est_END_CIDADE.AsString;
      qry_adicao_ED_ESTADO_FABRIC.AsString   := tbl_empresa_est_END_ESTADO.AsString;
      qry_adicao_CD_PAIS_ORIG_MERC.AsString  := tbl_empresa_est_CD_PAIS.AsString;
    end
    else
    begin
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

procedure Tdatm_DI_Adicao.qry_adicao_CD_PAIS_ORIG_MERCChange(Sender: TField);
begin
  frm_di_adicao.repassa_campos_classif:= True;
end;

procedure Tdatm_DI_Adicao.qry_adicao_CD_PAIS_AQUIS_MERCChange(Sender: TField);
begin
  frm_di_adicao.repassa_campos_classif:= True;
end;

procedure Tdatm_DI_Adicao.qry_adicao_CD_MERCADORIA_NCMChange(Sender: TField);
begin
  frm_di_adicao.repassa_campos_classif := True;
  qry_adicao_CD_MERC_NBM_SH.AsString   := Copy(qry_adicao_CD_MERCADORIA_NCM.AsString, 1, 8);
end;

procedure Tdatm_DI_Adicao.qry_adicao_CD_MERC_NALADI_SHChange(Sender: TField);
begin
  frm_di_adicao.repassa_campos_classif := True;
end;

procedure Tdatm_DI_Adicao.qry_adicao_CD_MERC_NALADI_NCCChange(Sender: TField);
begin
  frm_di_adicao.repassa_campos_classif := True;
end;

procedure Tdatm_DI_Adicao.qry_adicao_CD_AUSENCIA_FABRICChange(Sender: TField);
begin
  frm_di_adicao.repassa_campos_classif := True;
end;

procedure Tdatm_DI_Adicao.qry_adicao_BeforeDelete(DataSet: TDataSet);
begin
  if Not BoxMensagem('Confirma exclusão?', 1) then Abort;
end;

procedure Tdatm_DI_Adicao.qry_adicao_BeforeEdit(DataSet: TDataSet);
begin
  VerificaEstado(True);
end;

procedure Tdatm_DI_Adicao.qry_adicao_BeforeInsert(DataSet: TDataSet);
begin
  VerificaEstado(True);
end;

procedure Tdatm_DI_Adicao.qry_di_BeforeEdit(DataSet: TDataSet);
begin
  VerificaEstado(True);
end;

procedure Tdatm_DI_Adicao.qry_ad_ii_BeforePost(DataSet: TDataSet);
begin
  { INTERNACAO ZFM - PI - PRODUTO INDUSTRIALIZADO }
  if qry_di_CD_TIPO_DECLARACAO.AsString <> '19' then
    qry_ad_ii_CD_TIPO_ALIQ_IPT.AsString := '1'
  else
    qry_ad_ii_CD_TIPO_ALIQ_IPT.AsString := '';
end;

procedure Tdatm_DI_Adicao.qry_ad_ipi_BeforePost(DataSet: TDataSet);
Var
  lAdValorem, lEspecifica, lNotaComplementar : Boolean;
begin

  lAdValorem        := False;
  lEspecifica       := False;
  lNotaComplementar := False;

  { INTERNACAO ZFM - PI - PRODUTO INDUSTRIALIZADO }
  if qry_di_CD_TIPO_DECLARACAO.AsString <> '19' then
  begin
    if (qry_ad_ipi_PC_ALIQ_ACOR_TARIF.AsFloat > 0) or
       (qry_ad_ipi_PC_ALIQ_NORM_ADVAL.AsFloat > 0) or
       (qry_ad_ipi_PC_ALIQ_REDUZIDA.AsFloat > 0) then lAdValorem   := True;
    if (qry_ad_ipi_VL_ALIQ_ESPEC_IPT.AsFloat > 0) then lEspecifica := True;
    if (qry_ad_ipi_NR_NOTA_COMPL_TIPI.AsString <> '') then lNotaComplementar := True;
    if (lAdValorem and lEspecifica and (Not lNotaComplementar) ) then
       qry_ad_ipi_CD_TIPO_ALIQ_IPT.AsString := '1'
    else if (lAdValorem and lNotaComplementar ) then
       qry_ad_ipi_CD_TIPO_ALIQ_IPT.AsString := '4'
    else if ( (Not lAdValorem) and lEspecifica and (Not lNotaComplementar) ) then
       qry_ad_ipi_CD_TIPO_ALIQ_IPT.AsString := '2'
    else if (lAdValorem and lEspecifica and ( Not lNotaComplementar) ) then
       qry_ad_ipi_CD_TIPO_ALIQ_IPT.AsString := '3'
    else
       qry_ad_ipi_CD_TIPO_ALIQ_IPT.AsString := '1'
  end
  else
    qry_ad_ipi_CD_TIPO_ALIQ_IPT.AsString := '';
end;

procedure Tdatm_DI_Adicao.qry_ad_antidump_BeforePost(DataSet: TDataSet);
var
  lAdValorem, lEspecifica : Boolean;
begin
  qry_ad_antidump_NR_PROCESSO.AsString        := str_nr_processo;
  qry_ad_antidump_NR_ADICAO.AsString          := qry_adicao_NR_ADICAO.AsString;
  qry_ad_antidump_CD_RECEITA_IMPOSTO.AsString := '0003';

  lAdValorem  := False;
  lEspecifica := False;

  { INTERNACAO ZFM - PI - PRODUTO INDUSTRIALIZADO }
  if qry_di_CD_TIPO_DECLARACAO.AsString <> '19' then
  begin
    if (qry_ad_antidump_PC_ALIQ_NORM_ADVAL.AsFloat > 0) then lAdValorem := True;
    if (qry_ad_antidump_VL_ALIQ_ESPEC_IPT.AsFloat > 0) then lEspecifica := True;
    if (lAdValorem and ( Not lEspecifica ) ) then
       qry_ad_antidump_CD_TIPO_ALIQ_IPT.AsString := '1'
    else if ( (Not lAdValorem) and lEspecifica ) then
       qry_ad_antidump_CD_TIPO_ALIQ_IPT.AsString := '2'
    else if (lAdValorem and lEspecifica) then
       qry_ad_antidump_CD_TIPO_ALIQ_IPT.AsString := '3'
    else
       qry_ad_antidump_CD_TIPO_ALIQ_IPT.AsString := '1'
  end
end;

procedure Tdatm_DI_Adicao.qry_adicao_CD_MOTIVO_SEM_COBChange(
  Sender: TField);
begin
  with datm_DI_Adicao do
  begin
    qry_mot_sem_cobertura_.Close;
    qry_mot_sem_cobertura_.ParamByName('CODIGO').AsString := qry_adicao_CD_MOTIVO_SEM_COB.AsString;
    qry_mot_sem_cobertura_.Prepare;
    qry_mot_sem_cobertura_.Open;
  end;
end;

procedure Tdatm_DI_Adicao.qry_adicao_CD_MODALIDADE_PGTOChange(
  Sender: TField);
begin
  with datm_DI_Adicao do
  begin
    qry_mod_pagto_.Close;
    qry_mod_pagto_.ParamByName('CODIGO').AsString := qry_adicao_CD_MODALIDADE_PGTO.AsString;
    qry_mod_pagto_.Prepare;
    qry_mod_pagto_.Open;
  end;
end;

procedure Tdatm_DI_Adicao.tbl_ad_ato_leg_ncm_NR_EX_ATO_VINCULChange(
  Sender: TField);
begin
  datm_DI_Adicao.tbl_ad_ato_leg_ncm_CD_ASSUNTO_VINCUL.AsString := '1';
end;

procedure Tdatm_DI_Adicao.tbl_ad_ato_legal_nbm_NR_EX_ATO_VINCULChange(
  Sender: TField);
begin
  tbl_ad_ato_legal_nbm_CD_ASSUNTO_VINCUL.AsString := '2';
end;

procedure Tdatm_DI_Adicao.tbl_ad_ato_legal_benef_ipi_NR_EX_ATO_VINCULChange(
  Sender: TField);
begin
  with frm_DI_adicao do
  begin
    if ( ( dbedt_ex_ato_legal_benef_ipi.Text <> '' ) or
         ( dbedt_nr_ato_legal_benef_ipi.Text <> '' ) or
         ( dbedt_dt_ano_ato_legal_benef_ipi.Text <> '' ) ) then
    begin
      tbl_ad_ato_legal_benef_ipi_CD_ASSUNTO_VINCUL.AsString := '4';
    end
    else
    begin
      if tbl_ad_ato_legal_benef_ipi_.RecordCount > 0 then
        tbl_ad_ato_legal_benef_ipi_.delete
      else
        if ( tbl_ad_ato_legal_benef_ipi_.State in [dsedit,dsinsert] ) then
             tbl_ad_ato_legal_benef_ipi_.Cancel;
    end;
  end;
end;

procedure Tdatm_DI_Adicao.tbl_ad_ato_legal_antidump_NR_EX_ATO_VINCULChange(
  Sender: TField);
begin
  with frm_DI_adicao do
  begin
    if ( ( dbedt_ex_ato_legal_antidump.Text <> '' ) or
         ( dbedt_nr_ato_legal_antidump.Text <> '' ) or
         ( dbedt_dt_ano_ato_legal_antidump.Text <> '' ) ) then
    begin
      tbl_ad_ato_legal_antidump_CD_ASSUNTO_VINCUL.AsString := '6';
    end
    else
    begin
      if tbl_ad_ato_legal_antidump_.RecordCount > 0 then
        tbl_ad_ato_legal_antidump_.Delete
      else
        if ( tbl_ad_ato_legal_antidump_.State in [dsedit,dsinsert] ) then
             tbl_ad_ato_legal_antidump_.Cancel;
    end;
  end;
end;

procedure Tdatm_DI_Adicao.tbl_ad_ato_legal_acordo_tar_SG_TIPO_ATO_VINCULChange(
  Sender: TField);
begin
  frm_DI_adicao.AtoVinculadoAcordoTarif;
end;

procedure Tdatm_DI_Adicao.tbl_ad_ato_legal_acordo_tar_SG_ORG_ATO_VINCULChange(
  Sender: TField);
begin
  frm_DI_adicao.AtoVinculadoAcordoTarif;
end;

procedure Tdatm_DI_Adicao.tbl_ad_ato_legal_acordo_tar_DT_ANO_ATO_VINCULChange(
  Sender: TField);
begin
  frm_DI_adicao.AtoVinculadoAcordoTarif;
end;

procedure Tdatm_DI_Adicao.tbl_ad_ato_legal_acordo_tar_NR_ATO_VINCULADOChange(
  Sender: TField);
begin
  frm_DI_adicao.AtoVinculadoAcordoTarif;
end;

procedure Tdatm_DI_Adicao.tbl_ad_ato_legal_acordo_tar_NR_EX_ATO_VINCULChange(
  Sender: TField);
begin
  frm_DI_adicao.AtoVinculadoAcordoTarif;
end;

procedure Tdatm_DI_Adicao.tbl_ad_ato_legal_nbm_BeforePost(DataSet: TDataSet);
begin
  tbl_ad_ato_legal_nbm_CD_ASSUNTO_VINCUL.AsString := '2';
end;

procedure Tdatm_DI_Adicao.tbl_ad_ato_leg_ncm_BeforePost(DataSet: TDataSet);
begin
  tbl_ad_ato_leg_ncm_CD_ASSUNTO_VINCUL.AsString := '1';
end;

procedure Tdatm_DI_Adicao.qry_adicao_AfterOpen(DataSet: TDataSet);
begin
  with frm_DI_Adicao do
  begin
    if qry_di_IN_MOEDA_UNICA.AsBoolean then
    begin
      dbedt_cd_moeda_cond_venda.Color    := clMenu;
      dbedt_cd_moeda_cond_venda.ReadOnly := True;
      dbedt_cd_moeda_cond_venda.TabStop  := False;
      sbtn_tab_moeda_Cond_Venda.Enabled  := False;
    end
    else
    begin
      dbedt_cd_moeda_cond_venda.Color    := clWindow;
      dbedt_cd_moeda_cond_venda.ReadOnly := False;
      dbedt_cd_moeda_cond_venda.TabStop  := True;
      sbtn_tab_moeda_Cond_Venda.Enabled  := True;
    end;

//    if AnsiIndexText(Copy(qry_adicao_NR_PROCESSO.AsString, 5, 2), ['IE', 'IN']) >= 0 then
//      lblICMS_AFRMM.Visible := False
//    else
    lblICMS_AFRMM.Visible := ConsultaLookUPSQL(' SELECT ISNULL(E.IN_MARINHA_MERCANTE_ICMS, G.IN_MARINHA_MERCANTE_ICMS) AS IN_MARINHA_MERCANTE_ICMS ' +
                                               ' FROM TPROCESSO                 P ' +
                                               '    INNER JOIN TGRUPO           G ON G.CD_GRUPO = P.CD_GRUPO ' +
                                               '    INNER JOIN VW_SERVICO_GERAL S ON S.CD_SERVICO = P.CD_SERVICO ' +
                                               '    INNER JOIN TEMPRESA_NAC     E ON E.CD_EMPRESA = P.CD_CLIENTE ' +
                                               ' WHERE P.NR_PROCESSO = ' + QuotedStr(qry_adicao_NR_PROCESSO.AsString), 'IN_MARINHA_MERCANTE_ICMS') = '1';
    dbedtICMS_AFRMM.Visible := lblICMS_AFRMM.Visible;
  end;
end;

procedure Tdatm_DI_Adicao.tbl_ad_destaque_ncm_BeforePost(DataSet: TDataSet);
begin
  if tbl_ad_destaque_ncm_.State in [dsInsert] then
     tbl_ad_destaque_ncm_NR_SEQUENCIA.AsInteger :=
        Sequencia( '5', tbl_ad_destaque_ncm_NR_PROCESSO.AsString +
                        tbl_ad_destaque_ncm_NR_ADICAO.AsString );
end;

procedure Tdatm_DI_Adicao.tbl_ad_docto_vinc_BeforePost(DataSet: TDataSet);
begin
  if tbl_ad_docto_vinc_.State in [dsInsert] then
     tbl_ad_docto_vinc_NR_SEQUENCIA.AsInteger :=
        Sequencia( '6', tbl_ad_docto_vinc_NR_PROCESSO.AsString +
                        tbl_ad_docto_vinc_NR_ADICAO.AsString );
end;

procedure Tdatm_DI_Adicao.qry_ad_cambio_pg_antec_BeforePost(DataSet: TDataSet);
begin
  qry_ad_cambio_pg_antec_VL_VINC_MD_CAMBIO.AsFloat := Arredondar( qry_ad_cambio_pg_antec_VL_VINC_MD_CAMBIO.AsFloat, 2);
  if qry_ad_cambio_pg_antec_.State in [dsInsert] then
     qry_ad_cambio_pg_antec_NR_SEQUENCIA.AsInteger :=
        Sequencia( '8', qry_ad_cambio_pg_antec_NR_PROCESSO.AsString +
                        qry_ad_cambio_pg_antec_NR_ADICAO.AsString +
                        qry_ad_cambio_pg_antec_CD_FORMA_PAGAMENTO.AsString );
end;

procedure Tdatm_DI_Adicao.tbl_ad_cambio_parc_var_BeforePost(DataSet: TDataSet);
begin
  tbl_ad_cambio_parc_var_VL_PREV_PGTO_360.AsFloat := Arredondar( tbl_ad_cambio_parc_var_VL_PREV_PGTO_360.AsFloat, 2);
  if tbl_ad_cambio_parc_var_.State in [dsInsert] then
     tbl_ad_cambio_parc_var_NR_SEQUENCIA.AsInteger :=
        Sequencia( '7', tbl_ad_cambio_parc_var_NR_PROCESSO.AsString +
                        tbl_ad_cambio_parc_var_NR_ADICAO.AsString );
end;

procedure Tdatm_DI_Adicao.qry_ad_cambio_pg_avista_BeforePost(DataSet: TDataSet);
begin
  qry_ad_cambio_pg_avista_VL_VINC_MD_CAMBIO.AsFloat := Arredondar( qry_ad_cambio_pg_avista_VL_VINC_MD_CAMBIO.AsFloat, 2);
  if qry_ad_cambio_pg_avista_.State in [dsInsert] then
     qry_ad_cambio_pg_avista_NR_SEQUENCIA.AsInteger :=
        Sequencia( '8', qry_ad_cambio_pg_avista_NR_PROCESSO.AsString +
                        qry_ad_cambio_pg_avista_NR_ADICAO.AsString +
                        qry_ad_cambio_pg_avista_CD_FORMA_PAGAMENTO.AsString );
end;

procedure Tdatm_DI_Adicao.VerificaEstado(Habilita : Boolean);
begin
  with frm_DI_adicao do
  begin
    btn_salvar.Enabled       := Habilita;
    btn_cancelar.Enabled     := Habilita;
    mi_salvar.Enabled        := Habilita;
    mi_cancelar.Enabled      := Habilita;
  end;
end;

function digitou_letras( t: String ): Boolean;
var digitouletras: Boolean;
    i: Integer;
begin
    if length( t ) = 0 then
    begin
       result := true;
       exit;
    end
    else
    digitouletras := false;
    for i:= 1 to Length( t ) do
    begin
        if ( t[i] <> '.' ) and ( t[i] <> ',' ) then
        if ( Not( t[i] in ['0'..'9'] )) or ( t[i] = ' ' ) then digitouletras := true;
    end;
    result := digitouletras;
end;

procedure Tdatm_DI_Adicao.qry_adicao_AfterPost(DataSet: TDataSet);
begin
  CloseStoredProc( sp_atz_tipo_icms );
  sp_atz_tipo_icms.ParamByName('@NR_PROCESSO').AsString := str_nr_processo;
  ExecStoredProc( sp_atz_tipo_icms );
  CloseStoredProc( sp_atz_tipo_icms );

  with qry_adicao_ do
  begin
    if qry_ncm_.State <> dsInactive then qry_ncm_.Close;
    qry_ncm_.ParamByName('CODIGO').asString := Copy(qry_adicao_CD_MERCADORIA_NCM.AsString,1,8);
    qry_ncm_.Prepare;
    qry_ncm_.Open;
    if ( qry_ad_ii_.State = dsInactive ) then qry_ad_ii_.Open;
    if ( qry_ad_ipi_.State = dsInactive ) then qry_ad_ipi_.Open;
    qry_ad_ii_.Edit;
    if digitou_letras( qry_ncm_ALIQUOTA_II.asString ) then qry_ad_ii_PC_ALIQ_NORM_ADVAL.AsFloat := 0
    else
    begin
      if frm_di_adicao.dbedt_cd_reg_trib.Text = '2' then
      begin
        qry_ad_ii_PC_ALIQ_NORM_ADVAL.AsFloat := 0;
      end
      else
      begin
      if ( qry_ad_ii_PC_ALIQ_NORM_ADVAL.AsFloat <= 0 ) and not ( PossuiEx('II') ) then
           qry_ad_ii_PC_ALIQ_NORM_ADVAL.asFloat := qry_ncm_ALIQUOTA_II.AsFloat;
      end;
    end;
    qry_ad_ii_.Post;
    if qry_ad_ipi_.FieldByName('NR_PROCESSO').AsString <> '' then //Rodrigo Capra
    begin
      qry_ad_ipi_.Edit;
      if digitou_letras( qry_ncm_ALIQUOTA_IPI.asString ) then qry_ad_ipi_PC_ALIQ_NORM_ADVAL.AsFloat := 0
      else
      begin
        if frm_di_adicao.dbedt_cd_reg_trib.Text = '2' then
        begin
          qry_ad_ipi_PC_ALIQ_NORM_ADVAL.asFloat := 0;
        end
        else
        begin
          if ( qry_ad_ipi_PC_ALIQ_NORM_ADVAL.AsFloat <= 0 ) and not ( PossuiEx('IPI') ) then
             qry_ad_ipi_PC_ALIQ_NORM_ADVAL.AsFloat := qry_ncm_ALIQUOTA_IPI.AsFloat;
        end;
      end;
      qry_ad_ipi_.Post;
    end;
  end;
  qry_adicao_.ApplyUpdates;

end;

function Tdatm_DI_adicao.PossuiEx(pTipo:string) : Boolean;
begin
  if pTipo = 'II' then
  begin
    if not tbl_ad_ato_legal_acordo_tar_.Active then
      tbl_ad_ato_legal_acordo_tar_.Open;
    Result := ( tbl_ad_ato_legal_acordo_tar_.RecordCount > 0 );
    if not Result then
    begin
      if not tbl_ad_ato_leg_ncm_.Active then
        tbl_ad_ato_leg_ncm_.Open;
      Result := ( tbl_ad_ato_leg_ncm_.RecordCount > 0 );
    end;
  end else if pTipo = 'IPI' then
  begin
    if not tbl_ad_ato_legal_benef_ipi_.Active then
      tbl_ad_ato_legal_benef_ipi_.Open;
    Result := ( tbl_ad_ato_legal_benef_ipi_.RecordCount > 0 );
    if not Result then
    begin
      if not tbl_ad_ato_legal_nbm_.Active then
        tbl_ad_ato_legal_nbm_.Open;
      Result := ( tbl_ad_ato_legal_nbm_.RecordCount > 0 );
    end;
  end;
end;

procedure Tdatm_DI_Adicao.qry_adicao_AfterScroll(DataSet: TDataSet);
begin
  if frm_DI_adicao.pgctrl_adicao.ActivePage = frm_DI_adicao.tbsht_tributos then
  begin
    qry_fund_leg_.Close;
    qry_fund_leg_.ParamByName('CODIGO').AsString := qry_adicao_CD_FUND_LEG_REGIME.AsString;
    qry_fund_leg_.Prepare;
    qry_fund_leg_.Open;
  end;
end;

function Tdatm_DI_Adicao.DoubeIndex(ADoubleArray: array of Double; AValue: Double): Integer;
begin
  Result := 0;
  if High(ADoubleArray) >= 0 then
    while (Result <= High(ADoubleArray)) and (ADoubleArray[Result] <> AValue) do
      Inc(Result);
  if Result > High(ADoubleArray) then
    Result := -1;
end;

procedure Tdatm_DI_Adicao.qry_adicao_PC_ICMSChange(Sender: TField);
begin
  if in_RJ then
  begin
    if qry_adicao_.Active and (qry_adicao_.State in [dsEdit, dsInsert]) then
    begin
      if DoubeIndex(AliquotasSemFundo, qry_adicao_PC_ICMS.AsFloat) >= 0 then
        qry_adicao_IN_FUNDO_POBREZA.AsString := '0'
      else
        qry_adicao_IN_FUNDO_POBREZA.AsString := '1';
    end;
  end
  else if qry_adicao_IN_FUNDO_POBREZA.AsString <> '0' then
    qry_adicao_IN_FUNDO_POBREZA.AsString := '0';
end;

procedure Tdatm_DI_Adicao.qry_adicao_PC_REDUCAO_ICMSChange(Sender: TField);
begin
  if in_RJ then
  begin
    if qry_adicao_.Active and (qry_adicao_.State in [dsEdit, dsInsert]) then
    begin
      if DoubeIndex(AliquotasSemFundo, qry_adicao_PC_REDUCAO_ICMS.AsFloat) >= 0 then
        qry_adicao_IN_FUNDO_POBREZA.AsString := '1'
      else
        qry_adicao_IN_FUNDO_POBREZA.AsString := '0';
    end;
  end
  else if qry_adicao_IN_FUNDO_POBREZA.AsString <> '0' then
    qry_adicao_IN_FUNDO_POBREZA.AsString := '0';
end;

procedure Tdatm_DI_Adicao.DataModuleCreate(Sender: TObject);
var
  vAliquotas, S: String;
begin
  // Incluido para não ficar validando o tempo todo na procedure AtualizaTelaICMSRJ - Michel - 08/03/2010
  in_RJ            := ConsultaLookUPSQL(' SELECT E.END_UF ' +
                                        ' FROM TPROCESSO P INNER JOIN TEMPRESA_NAC E ON E.CD_EMPRESA = P.CD_IMPORTADOR ' +
                                        ' WHERE NR_PROCESSO = ' + QuotedStr(str_nr_processo), 'END_UF') = 'RJ';
  PC_Fundo_Pobreza := StrToFloat(ConsultaLookup('TPARAMETROS', '"bla"', 'bla', 'PC_FUNDO_POBREZA_RJ'));

  Grupo            := ConsultaLookUP('TPROCESSO', 'NR_PROCESSO', str_nr_processo, 'CD_GRUPO');
  vAliquotas       := Trim(ConsultaLookUP('TGRUPO', 'CD_GRUPO', Grupo, 'PC_ALIQUOTAS_SEM_FUNDO_POBREZA'));
  SetLength(AliquotasSemFundo, 0);
  while vAliquotas <> '' do
  begin
    S := '';
    while (vAliquotas <> '') and (vAliquotas[1] <> ',') do
    begin
      S := S + vAliquotas[1];
      Delete(vAliquotas, 1, 1);
    end;
    Delete(vAliquotas, 1, 1);
    vAliquotas := Trim(vAliquotas);
    SetLength(AliquotasSemFundo, High(AliquotasSemFundo) + 2);
    if DecimalSeparator = '.' then
      AliquotasSemFundo[High(AliquotasSemFundo)] := StrToFloat(S)
    else
      AliquotasSemFundo[High(AliquotasSemFundo)] := StrToFloat(StringReplace(S, '.', DecimalSeparator, []));
  end;
end;

procedure Tdatm_DI_Adicao.qry_adicao_CD_FUND_LEG_REGIMEChange(Sender: TField);
begin
  if ((qry_adicao_CD_REGIME_TRIBUTAR.AsString <> '5') or (qry_adicao_CD_FUND_LEG_REGIME.AsString <> '37')) and qry_adicao_IN_SUSPENDE_II_RETIFIC.AsBoolean then
  begin
    if not (qry_adicao_.State in [dsEdit, dsInsert]) then
      qry_adicao_.Edit;
    qry_adicao_IN_SUSPENDE_II_RETIFIC.AsBoolean := False;
  end;

  if ((not qry_adicao_IN_SUSPENDE_II_RETIFIC.AsBoolean) or (qry_ad_ipi_CD_TIPO_BENEF_IPI.AsString <> '5')) and qry_adicao_IN_SUSPENDE_IPI_RETIFIC.AsBoolean then
  begin
    if not (qry_adicao_.State in [dsEdit, dsInsert]) then
      qry_adicao_.Edit;
    qry_adicao_IN_SUSPENDE_IPI_RETIFIC.AsBoolean := False;
  end;

  if ((not qry_adicao_IN_SUSPENDE_II_RETIFIC.AsBoolean) or (qry_adicao_CD_TIPO_BENEF_PIS_COFINS.AsString <> '4')) and qry_adicao_IN_SUSPENDE_PIS_COFINS_RETIFIC.AsBoolean then
  begin
    if not (qry_adicao_.State in [dsEdit, dsInsert]) then
      qry_adicao_.Edit;
    qry_adicao_IN_SUSPENDE_PIS_COFINS_RETIFIC.AsBoolean := False;
  end;
end;

procedure Tdatm_DI_Adicao.qry_di_AfterPost(DataSet: TDataSet);
begin
  qry_di_.ApplyUpdates;
end;

procedure Tdatm_DI_Adicao.qry_di_AfterDelete(DataSet: TDataSet);
begin
  qry_di_.ApplyUpdates;
end;

procedure Tdatm_DI_Adicao.qry_nve_AfterPost(DataSet: TDataSet);
begin
  FastExecSQL('EXEC SP_VALORACAO_NCM_2_ITENS ''' + qry_adicao_NR_PROCESSO.AsString + ''', ''' + qry_adicao_NR_ADICAO.AsString + '''');
end;

procedure Tdatm_DI_Adicao.ds_nveStateChange(Sender: TObject);
begin
  if (not qry_nve_.Active) or frm_DI_adicao.in_DI_Registrada then
  begin
    frm_DI_adicao.btn_NVE_Incluir.Enabled := False;
    frm_DI_adicao.btn_NVE_Salvar.Enabled := False;
    frm_DI_adicao.btn_NVE_Cancelar.Enabled := False;
    frm_DI_adicao.btn_NVE_Excluir.Enabled := False;
  end
  else
  begin
    frm_DI_adicao.btn_NVE_Incluir.Enabled := not (qry_nve_.State in [dsEdit, dsInsert]);
    frm_DI_adicao.btn_NVE_Salvar.Enabled := (qry_nve_.State in [dsEdit, dsInsert]);
    frm_DI_adicao.btn_NVE_Cancelar.Enabled := (qry_nve_.State in [dsEdit, dsInsert]);
    frm_DI_adicao.btn_NVE_Excluir.Enabled := (qry_nve_.RecordCount > 0) and not (qry_nve_.State in [dsEdit, dsInsert]);
  end;
end;

procedure Tdatm_DI_Adicao.qry_nve_NewRecord(DataSet: TDataSet);
begin
  qry_nve_NR_PROCESSO.AsString := qry_adicao_NR_PROCESSO.AsString;
  qry_nve_NR_ADICAO.AsString := qry_adicao_NR_ADICAO.AsString;
end;

procedure Tdatm_DI_Adicao.qry_nve_AfterDelete(DataSet: TDataSet);
begin
  FastExecSQL('EXEC SP_VALORACAO_NCM_2_ITENS ''' + qry_adicao_NR_PROCESSO.AsString + ''', ''' + qry_adicao_NR_ADICAO.AsString + '''');
end;

procedure Tdatm_DI_Adicao.ds_diStateChange(Sender: TObject);
begin
  if not qry_di_.Active then
    Exit;
    
  if qry_di_IN_FMA.AsString = '1' then
  begin
    frm_DI_adicao.gbII.Height := 331;
    frm_DI_adicao.gbIPI.Height := 331;
    frm_DI_adicao.gbPIS.Height := 331;
    frm_DI_adicao.gbCOFINS.Height := 331;
    frm_DI_adicao.gbAntidumping.Height := 331;
  end
  else
  begin
    frm_DI_adicao.gbII.Height := 221;
    frm_DI_adicao.gbIPI.Height := 221;
    frm_DI_adicao.gbPIS.Height := 221;
    frm_DI_adicao.gbCOFINS.Height := 221;
    frm_DI_adicao.gbAntidumping.Height := 221;
  end;
  frm_DI_adicao.pnlPagamentoDarf.Visible := qry_di_IN_FMA.AsString = '1';
end;

procedure Tdatm_DI_Adicao.qry_di_IN_FMAChange(Sender: TField);
begin
  ds_diStateChange(ds_adicao);
  if not (qry_adicao_.State in [dsEdit, dsInsert]) then
    qry_adicao_.Edit;
  if (qry_di_IN_FMA.AsString <> '1') then
  begin
    qry_adicao_VL_MULTA_II.AsFloat := 0;
    qry_adicao_VL_JUROS_II.AsFloat := 0;
    qry_adicao_VL_MULTA_IPI.AsFloat := 0;
    qry_adicao_VL_JUROS_IPI.AsFloat := 0;
    qry_adicao_VL_MULTA_PIS.AsFloat := 0;
    qry_adicao_VL_JUROS_PIS.AsFloat := 0;
    qry_adicao_VL_MULTA_COFINS.AsFloat := 0;
    qry_adicao_VL_JUROS_COFINS.AsFloat := 0;
    qry_di_DT_PAGAMENTO_DARF.Clear;
  end;
end;

end.
