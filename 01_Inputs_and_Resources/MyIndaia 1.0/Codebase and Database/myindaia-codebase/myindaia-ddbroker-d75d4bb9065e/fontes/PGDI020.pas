unit PGDI020;

interface

uses
  Variants,  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, DBTables, PGGP001, Funcoes, PGGP017, ServicoNovo, StrUtils,
  FormsLog; // Este sempre depois das uses Forms e Classes - Michel - 22/03/2013

type

  Tdatm_DI_Itens = class(TDataModule)
    ds_ad_itens: TDataSource;
    sp_di_classifica_item: TStoredProc;
    sp_di_reclassifica_item: TStoredProc;
    sp_di_classifica_itemNR_ADICAO: TStringField;
    sp_di_classifica_itemNR_ITEM: TStringField;
    sp_di_reclassifica_itemNR_ADICAO: TStringField;
    sp_di_reclassifica_itemNR_ITEM: TStringField;
    sp_di_renumera_itens_adicao: TStoredProc;
    StringField1: TStringField;
    StringField2: TStringField;
    ds_adicao_: TDataSource;
    ds_tp_calc_item: TDataSource;
    tbl_tp_calc_item_: TTable;
    tbl_tp_calc_item_CD_TIPO_CALCULO_ITEM: TStringField;
    tbl_tp_calc_item_DESCRICAO: TStringField;
    ds_di: TDataSource;
    ds_pais: TDataSource;
    tbl_pais_: TTable;
    tbl_pais_CODIGO: TStringField;
    tbl_pais_DESCRICAO: TStringField;
    ds_unid_med: TDataSource;
    tbl_unid_med_: TTable;
    tbl_empresa_est_: TTable;
    tbl_empresa_est_CD_EMPRESA: TStringField;
    tbl_empresa_est_NM_EMPRESA: TStringField;
    tbl_empresa_est_AP_EMPRESA: TStringField;
    tbl_empresa_est_END_NUMERO: TStringField;
    tbl_empresa_est_END_CIDADE: TStringField;
    tbl_empresa_est_END_ESTADO: TStringField;
    tbl_empresa_est_CD_PAIS: TStringField;
    tbl_empresa_est_NR_TELEFONE: TStringField;
    tbl_empresa_est_NR_FAX: TStringField;
    tbl_empresa_est_DT_INCLUSAO: TDateTimeField;
    ds_empresa_est: TDataSource;
    ds_ncm: TDataSource;
    tbl_ncm_: TTable;
    tbl_ncm_CODIGO: TStringField;
    tbl_ncm_DESCRICAO: TStringField;
    tbl_ncm_UNIDADE_MEDIDA: TStringField;
    tbl_ncm_ALIQUOTA_II: TStringField;
    tbl_ncm_DATA_INICIO_VIG_II: TStringField;
    tbl_ncm_DATA_FIM_VIG_II: TStringField;
    tbl_ncm_ALIQUOTA_II_MERCOSUL: TStringField;
    tbl_ncm_DATA_INICIO_VIG_II_MSUL: TStringField;
    tbl_ncm_DATA_FIM_VIG_II_MSUL: TStringField;
    tbl_ncm_ALIQUOTA_IPI: TStringField;
    tbl_ncm_DATA_INICIO_VIG_IPI: TStringField;
    tbl_ncm_DATA_FIM_VIG_IPI: TStringField;
    qry_Itens_: TQuery;
    ds_Item_: TDataSource;
    qry_Itens_NR_PROCESSO: TStringField;
    qry_Itens_NR_ADICAO: TStringField;
    qry_Itens_NR_ITEM: TStringField;
    tbl_empresa_nac_: TTable;
    ds_empresa_nac: TDataSource;
    tbl_empresa_nac_CD_EMPRESA: TStringField;
    tbl_empresa_nac_NM_EMPRESA: TStringField;
    tbl_empresa_nac_AP_EMPRESA: TStringField;
    tbl_empresa_nac_END_EMPRESA: TStringField;
    tbl_empresa_nac_END_NUMERO: TStringField;
    tbl_empresa_nac_END_CIDADE: TStringField;
    tbl_empresa_nac_END_BAIRRO: TStringField;
    tbl_empresa_nac_END_UF: TStringField;
    tbl_empresa_nac_END_CEP: TStringField;
    tbl_empresa_nac_CD_TIPO_PESSOA: TStringField;
    tbl_empresa_nac_CGC_EMPRESA: TStringField;
    tbl_empresa_nac_CPF_EMPRESA: TStringField;
    tbl_empresa_nac_IE_EMPRESA: TStringField;
    tbl_empresa_nac_OUTRO_DOC: TStringField;
    tbl_empresa_nac_DT_INCLUSAO: TDateTimeField;
    tbl_empresa_nac_IN_FATURAMENTO: TStringField;
    tbl_empresa_nac_IN_ATIVO: TStringField;
    tbl_empresa_nac_IN_RESTRICAO: TStringField;
    tbl_empresa_nac_IN_EVENTUAL: TStringField;
    tbl_empresa_nac_CD_TIPO_REF: TStringField;
    tbl_empresa_nac_CD_TAB_SDA: TStringField;
    tbl_empresa_nac_IN_CLIENTE: TBooleanField;
    tbl_empresa_nac_IN_IMPORTADOR: TBooleanField;
    tbl_empresa_nac_IN_EXPORTADOR: TBooleanField;
    tbl_empresa_nac_IN_OUTROS: TBooleanField;
    tbl_empresa_nac_NR_AG_BANCO_IMPOSTOS: TStringField;
    tbl_empresa_nac_CD_SDA: TStringField;
    tbl_empresa_nac_NR_CAE: TStringField;
    tbl_empresa_nac_CD_GRUPO: TStringField;
    qry_ad_itens_nr_ordem_: TQuery;
    qry_ad_itens_nr_ordem_NR_ORDEM: TIntegerField;
    qry_di_: TQuery;
    qry_adicao_: TQuery;
    qry_ad_itens_: TQuery;
    qry_ad_itens_NR_PROCESSO: TStringField;
    qry_ad_itens_NR_ADICAO: TStringField;
    qry_ad_itens_NR_ITEM: TStringField;
    qry_ad_itens_CD_EXPORTADOR: TStringField;
    qry_ad_itens_CD_FABR_EXPO: TStringField;
    qry_ad_itens_CD_FABRICANTE: TStringField;
    qry_ad_itens_CD_MERCADORIA: TStringField;
    qry_ad_itens_CD_NALADI_NCCA: TStringField;
    qry_ad_itens_CD_NALADI_SH: TStringField;
    qry_ad_itens_CD_NCM_SH: TStringField;
    qry_ad_itens_CD_PAIS_AQUISICAO: TStringField;
    qry_ad_itens_CD_PAIS_ORIGEM: TStringField;
    qry_ad_itens_CD_TIPO_CALCULO_ITEM: TStringField;
    qry_ad_itens_NR_FATURA: TStringField;
    qry_ad_itens_PC_DESCONTO_MERC: TFloatField;
    qry_ad_itens_PL_MERCADORIA: TFloatField;
    qry_ad_itens_QT_MERC_UN_COMERC: TFloatField;
    qry_ad_itens_QT_MERC_UN_ESTAT: TFloatField;
    qry_ad_itens_TX_DESC_DET_MERC: TMemoField;
    qry_ad_itens_VL_DESCONTO_MERC: TFloatField;
    qry_ad_itens_VL_FRETE_ITEM: TFloatField;
    qry_ad_itens_VL_MCV_ITEM: TFloatField;
    qry_ad_itens_VL_MLE_ITEM: TFloatField;
    qry_ad_itens_VL_SEGURO_ITEM: TFloatField;
    qry_ad_itens_VL_UNID_COND_VENDA: TFloatField;
    qry_ad_itens_VL_UNITARIO: TFloatField;
    qry_ad_itens_NR_OPER_TRAT_PREV: TStringField;
    qry_ad_itens_NR_PEDIDO: TStringField;
    qry_ad_itens_VL_II_ITEM: TFloatField;
    qry_ad_itens_VL_IPI_ITEM: TFloatField;
    qry_ad_itens_VL_AD_ITEM: TFloatField;
    qry_ad_itens_VL_ICMS_ITEM: TFloatField;
    qry_ad_itens_VL_MLE_ITEM_MN: TFloatField;
    qry_ad_itens_VL_FRETE_ITEM_MN: TFloatField;
    qry_ad_itens_VL_SEGURO_ITEM_MN: TFloatField;
    qry_ad_itens_VL_MCV_ITEM_MN: TFloatField;
    qry_ad_itens_VL_UNID_COND_VENDA_MN: TFloatField;
    qry_ad_itens_VL_ACRESCIMO_ITEM: TFloatField;
    qry_ad_itens_VL_DEDUCAO_ITEM: TFloatField;
    qry_ad_itens_VL_ACRESCIMO_ITEM_MN: TFloatField;
    qry_ad_itens_VL_DEDUCAO_ITEM_MN: TFloatField;
    qry_ad_itens_VL_DESPESA_ITEM: TFloatField;
    qry_ad_itens_VL_DESPESA_ITEM_MN: TFloatField;
    qry_ad_itens_Look_Pais_Aquisicao: TStringField;
    i: TStringField;
    qry_ad_itens_Look_NM_Fabricante: TStringField;
    qry_ad_itens_Look_NM_Exportador: TStringField;
    qry_ad_itens_Look_Mercadoria: TStringField;
    qry_ad_itens_Look_NM_Unid_Comerc: TStringField;
    qry_ad_itens_NR_ORDEM: TSmallintField;
    qry_ad_Quantidade_itens_: TQuery;
    qry_ad_Quantidade_itens_QUANTIDADE: TIntegerField;
    qry_di_NR_PROCESSO: TStringField;
    qry_di_DT_ULTIMA_ALTERACAO: TDateTimeField;
    qry_di_IN_RISC_ATUALIZADO: TStringField;
    qry_di_QT_ADICOES: TIntegerField;
    qry_di_CD_IMPORTADOR: TStringField;
    qry_adicao_NR_PROCESSO: TStringField;
    qry_adicao_NR_ADICAO: TStringField;
    qry_adicao_QT_ITENS_ADICAO: TIntegerField;
    tbl_naladi_sh_: TTable;
    tbl_naladi_ncca_: TTable;
    qry_unid_medida_: TQuery;
    qry_unid_medida_CD_UNID_MEDIDA: TStringField;
    qry_unid_medida_NM_UNID_MEDIDA: TStringField;
    qry_unid_medida_IN_ATIVO: TStringField;
    qry_ad_itens_CD_UN_MED_COMERC: TStringField;
    qry_ad_itens_Look_ativo_unid_med: TStringField;
    qry_ad_itens_nm_ncm_: TStringField;
    qry_nve_: TQuery;
    ds_nve_: TDataSource;
    qry_nve_NR_PROCESSO: TStringField;
    qry_nve_NR_ADICAO: TStringField;
    qry_nve_NR_ITEM: TStringField;
    qry_nve_CD_NIVEL_NVE: TStringField;
    qry_nve_CD_ATRIBUTO_NCM: TStringField;
    qry_nve_CD_ESPECIF_NCM: TStringField;
    tbl_nivel_: TTable;
    tbl_atrib_: TTable;
    tbl_especif_: TTable;
    tbl_nivel_CD_NIVEL_NVE: TStringField;
    tbl_nivel_NM_NIVEL: TStringField;
    tbl_atrib_CD_NOMENC_NCM: TStringField;
    tbl_atrib_CD_ATRIBUTO_NCM: TStringField;
    tbl_atrib_IN_MULTIPLA_ESPECIF: TStringField;
    tbl_atrib_CD_NIVEL_NCM: TStringField;
    tbl_atrib_NM_ATRIBUTO: TStringField;
    tbl_especif_CD_NOMENC_NCM: TStringField;
    tbl_especif_CD_ATRIBUTO_NCM: TStringField;
    tbl_especif_CD_ESPECIF_NCM: TStringField;
    tbl_especif_CD_NIVEL_NCM: TStringField;
    tbl_especif_NM_ESPECIF_NCM: TStringField;
    qry_nve_nm_nivel_: TStringField;
    qry_nve_nm_atrib_: TStringField;
    qry_nve_nm_especif_: TStringField;
    qry_insere_nve_: TQuery;
    qry_apaga_nve_: TQuery;
    qry_processo_: TQuery;
    qry_adicao_CD_PAIS_ORIG_MERC: TStringField;
    qry_processo_NR_PROCESSO: TStringField;
    qry_processo_CD_PAIS_ORIGEM: TStringField;
    qry_di_PL_CARGA: TFloatField;
    qry_di_VL_TOT_MLE_MNEG: TFloatField;
    qry_di_VL_TOTAL_MLE_MN: TFloatField;
    qry_ii_: TQuery;
    qry_ipi_: TQuery;
    qry_emp_est_: TQuery;
    qry_di_CD_AUSENCIA_FABRIC: TStringField;
    qry_di_CD_FORNECEDOR: TStringField;
    qry_di_CD_FABRICANTE: TStringField;
    qry_di_CD_PAIS_AQUIS_MERC: TStringField;
    qry_di_CD_PAIS_ORIG_MERC: TStringField;
    qry_atz_itens_: TQuery;
    qry_di_IN_REPASSA_DADOS_ADICAO: TBooleanField;
    qry_atz_adicao_: TQuery;
    sp_di_repassa_dados_adicao: TStoredProc;
    StringField3: TStringField;
    StringField4: TStringField;
    sp_di_repassa_dados_cambio: TStoredProc;
    StringField5: TStringField;
    StringField6: TStringField;
    qry_mercadoria_: TQuery;
    qry_mercadoria_CD_MERCADORIA: TStringField;
    qry_mercadoria_AP_MERCADORIA: TStringField;
    qry_mercadoria_NM_MERCADORIA: TMemoField;
    qry_mercadoria_PL_MERCADORIA: TFloatField;
    qry_mercadoria_VL_UNITARIO: TFloatField;
    qry_mercadoria_CD_IMPORTADOR: TStringField;
    qry_mercadoria_CD_GRUPO: TStringField;
    qry_mercadoria_CD_UN_MED_COMERC: TStringField;
    qry_mercadoria_CD_NCM_SH: TStringField;
    qry_mercadoria_CD_NALADI_SH: TStringField;
    qry_mercadoria_CD_NALADI_NCCA: TStringField;
    qry_mercadoria_CD_EXPORTADOR: TStringField;
    qry_mercadoria_CD_PAIS_AQUISICAO: TStringField;
    qry_mercadoria_CD_PAIS_ORIGEM: TStringField;
    qry_mercadoria_CD_TIPO_CALCULO: TStringField;
    qry_mercadoria_CD_FABR_EXPO: TStringField;
    qry_mercadoria_CD_FABRICANTE: TStringField;
    qry_mercadoria_lookup_: TQuery;
    qry_mercadoria_lookup_CD_MERCADORIA: TStringField;
    qry_mercadoria_lookup_AP_MERCADORIA: TStringField;
    qry_nivel_: TQuery;
    qry_nivel_CD_NIVEL_NVE: TStringField;
    qry_nivel_NM_NIVEL: TStringField;
    qry_atrib_: TQuery;
    qry_especif_: TQuery;
    qry_atrib_CD_NOMENC_NCM: TStringField;
    qry_atrib_CD_ATRIBUTO_NCM: TStringField;
    qry_atrib_IN_MULTIPLA_ESPECIF: TStringField;
    qry_atrib_CD_NIVEL_NCM: TStringField;
    qry_atrib_NM_ATRIBUTO: TStringField;
    qry_especif_CD_NOMENC_NCM: TStringField;
    qry_especif_CD_ATRIBUTO_NCM: TStringField;
    qry_especif_CD_ESPECIF_NCM: TStringField;
    qry_especif_CD_NIVEL_NCM: TStringField;
    qry_especif_NM_ESPECIF_NCM: TStringField;
    qry_nve_CD_NCM_ATRIBUTO: TStringField;
    qry_nve_CD_NCM_ESPECIF: TStringField;
    qry_repassa_forn_fabri: TQuery;
    qry_repassa_forn_fabriCD_FABRICANTE: TStringField;
    qry_repassa_forn_fabriCD_FORNECEDOR: TStringField;
    qry_repassa_forn_fabriCD_PAIS_AQUIS_MERC: TStringField;
    qry_repassa_forn_fabriCD_PAIS_ORIG_MERC: TStringField;
    qry_repassa_forn_fabriIN_REPASSA_DADOS_ADICAO: TBooleanField;
    tbl_unid_med_CD_UNID_MEDIDA: TStringField;
    tbl_unid_med_NM_UNID_MEDIDA: TStringField;
    qry_grupo_: TQuery;
    tbl_empresa_est_END_EMPRESA: TStringField;
    tbl_empresa_est_END_COMPL: TStringField;
    sp_di_verifica_adicao: TStoredProc;
    qry_ad_itens_NR_DESTAQUE_NCM: TStringField;
    qry_ad_itens_NR_ITEM_PO: TStringField;
    qry_ad_itens_NR_PROC_PO: TStringField;
    qry_ad_itens_VL_DESPESAS_ITEM: TFloatField;
    qry_ad_itens_VL_DED_CPT_MNEG: TFloatField;
    qry_ad_itens_IN_PROVEM_PO: TBooleanField;
    sp_di_atz_desc_merc: TStoredProc;
    qry_grupo_CD_GRUPO: TStringField;
    sp_saldo_materia_prima: TStoredProc;
    qry_di_CD_TRIBUTACAO_ICMS: TStringField;
    qry_di_CD_FUND_LEGAL_ICMS: TStringField;
    qry_di_PC_ICMS: TFloatField;
    qry_di_PC_REDUCAO_ICMS: TFloatField;
    updDI: TUpdateSQL;
    qry_DocInstrucao: TQuery;
    dts_DocInstrucao: TDataSource;
    qry_DocInstrucaoNR_DCTO_INSTRUCAO: TStringField;
    qry_ad_itens_VL_TX_SCX_ITEM: TFloatField;
    qry_ad_itens_VL_PIS_ITEM: TFloatField;
    qry_ad_itens_VL_COFINS_ITEM: TFloatField;
    qry_ad_itens_VL_BASE_CALC_II: TFloatField;
    qry_ad_itens_FRETE_COLLECT_ITEM: TFloatField;
    qry_ad_itens_FRETE_PREPAID_ITEM: TFloatField;
    qry_ad_itens_FRETE_TNAC_ITEM: TFloatField;
    qry_ad_itens_FRETE_COLLECT_ITEM_REAL: TFloatField;
    qry_ad_itens_FRETE_PREPAID_ITEM_REAL: TFloatField;
    qry_ad_itens_FRETE_TNAC_ITEM_REAL: TFloatField;
    qry_ad_itens_FRETE_COLLECT_ITEM_DOLAR: TFloatField;
    qry_ad_itens_FRETE_PREPAID_ITEM_DOLAR: TFloatField;
    qry_ad_itens_FRETE_TNAC_ITEM_DOLAR: TFloatField;
    qry_ad_itens_PB_MERCADORIA: TFloatField;
    qry_ad_itens_VL_BASE_ICMS_ITEM: TFloatField;
    qry_ad_itens_NR_PARCIAL: TIntegerField;
    qry_Referencias: TQuery;
    ds_Referencias: TDataSource;
    qry_ReferenciasCD_REFERENCIA: TStringField;
    qry_ad_itens_CD_EMPRESA: TStringField;
    updAdicao: TUpdateSQL;
    upd_ad_itens_: TUpdateSQL;
    qry_ad_itens_NR_DANFE: TStringField;
    qry_ad_itens_NR_CNTR: TStringField;
    qry_ad_itens_ID_CLIENTE: TStringField;
    qry_ad_itens_VL_UNITARIO_FOB: TFloatField;
    qry_ad_itens_NumeroLote: TStringField;
    qryIntegracaoPhilips: TQuery;
    dtsIntegracaoPhilips: TDataSource;
    qryIntegracaoPhilipsTP_PROCESSO: TStringField;
    qry_mercadoria_NR_DESTAQUE_NCM: TStringField;
    qry_Itens_Copia: TQuery;
    qry_Itens_CopiaNR_PROCESSO: TStringField;
    qry_Itens_CopiaNR_ADICAO: TStringField;
    qry_Itens_CopiaNR_ITEM: TStringField;
    qry_Itens_CopiaCD_EXPORTADOR: TStringField;
    qry_Itens_CopiaCD_FABR_EXPO: TStringField;
    qry_Itens_CopiaCD_FABRICANTE: TStringField;
    qry_Itens_CopiaCD_MERCADORIA: TStringField;
    qry_Itens_CopiaCD_NALADI_NCCA: TStringField;
    qry_Itens_CopiaCD_NALADI_SH: TStringField;
    qry_Itens_CopiaCD_NCM_SH: TStringField;
    qry_Itens_CopiaCD_PAIS_AQUISICAO: TStringField;
    qry_Itens_CopiaCD_PAIS_ORIGEM: TStringField;
    qry_Itens_CopiaCD_TIPO_CALCULO_ITEM: TStringField;
    qry_Itens_CopiaCD_UN_MED_COMERC: TStringField;
    qry_Itens_CopiaNR_FATURA: TStringField;
    qry_Itens_CopiaPC_DESCONTO_MERC: TFloatField;
    qry_Itens_CopiaPL_MERCADORIA: TFloatField;
    qry_Itens_CopiaQT_MERC_UN_COMERC: TFloatField;
    qry_Itens_CopiaQT_MERC_UN_ESTAT: TFloatField;
    qry_Itens_CopiaTX_DESC_DET_MERC: TMemoField;
    qry_Itens_CopiaVL_DESCONTO_MERC: TFloatField;
    qry_Itens_CopiaVL_FRETE_ITEM: TFloatField;
    qry_Itens_CopiaVL_MCV_ITEM: TFloatField;
    qry_Itens_CopiaVL_MLE_ITEM: TFloatField;
    qry_Itens_CopiaVL_SEGURO_ITEM: TFloatField;
    qry_Itens_CopiaVL_UNID_COND_VENDA: TFloatField;
    qry_Itens_CopiaVL_UNITARIO: TFloatField;
    qry_Itens_CopiaNR_OPER_TRAT_PREV: TStringField;
    qry_Itens_CopiaNR_PEDIDO: TStringField;
    qry_Itens_CopiaVL_II_ITEM: TFloatField;
    qry_Itens_CopiaVL_IPI_ITEM: TFloatField;
    qry_Itens_CopiaVL_AD_ITEM: TFloatField;
    qry_Itens_CopiaVL_ICMS_ITEM: TFloatField;
    qry_Itens_CopiaVL_MLE_ITEM_MN: TFloatField;
    qry_Itens_CopiaVL_FRETE_ITEM_MN: TFloatField;
    qry_Itens_CopiaVL_SEGURO_ITEM_MN: TFloatField;
    qry_Itens_CopiaVL_MCV_ITEM_MN: TFloatField;
    qry_Itens_CopiaVL_UNID_COND_VENDA_MN: TFloatField;
    qry_Itens_CopiaVL_ACRESCIMO_ITEM: TFloatField;
    qry_Itens_CopiaVL_DEDUCAO_ITEM: TFloatField;
    qry_Itens_CopiaVL_ACRESCIMO_ITEM_MN: TFloatField;
    qry_Itens_CopiaVL_DEDUCAO_ITEM_MN: TFloatField;
    qry_Itens_CopiaVL_DESPESA_ITEM: TFloatField;
    qry_Itens_CopiaVL_DESPESA_ITEM_MN: TFloatField;
    qry_Itens_CopiaNR_ORDEM: TSmallintField;
    qry_Itens_CopiaNR_ITEM_PO: TStringField;
    qry_Itens_CopiaNR_PROC_PO: TStringField;
    qry_Itens_CopiaVL_DESPESAS_ITEM: TFloatField;
    qry_Itens_CopiaVL_DED_CPT_MNEG: TFloatField;
    qry_Itens_CopiaNR_DESTAQUE_NCM: TStringField;
    qry_Itens_CopiaIN_PROVEM_PO: TBooleanField;
    qry_Itens_CopiaVL_TX_SCX_ITEM: TFloatField;
    qry_Itens_CopiaVL_PIS_ITEM: TFloatField;
    qry_Itens_CopiaVL_COFINS_ITEM: TFloatField;
    qry_Itens_CopiaVL_BASE_CALC_II: TFloatField;
    qry_Itens_CopiaFRETE_COLLECT_ITEM: TFloatField;
    qry_Itens_CopiaFRETE_PREPAID_ITEM: TFloatField;
    qry_Itens_CopiaFRETE_TNAC_ITEM: TFloatField;
    qry_Itens_CopiaFRETE_COLLECT_ITEM_REAL: TFloatField;
    qry_Itens_CopiaFRETE_PREPAID_ITEM_REAL: TFloatField;
    qry_Itens_CopiaFRETE_TNAC_ITEM_REAL: TFloatField;
    qry_Itens_CopiaFRETE_COLLECT_ITEM_DOLAR: TFloatField;
    qry_Itens_CopiaFRETE_PREPAID_ITEM_DOLAR: TFloatField;
    qry_Itens_CopiaFRETE_TNAC_ITEM_DOLAR: TFloatField;
    qry_Itens_CopiaPB_MERCADORIA: TFloatField;
    qry_Itens_CopiaVL_BASE_ICMS_ITEM: TFloatField;
    qry_Itens_CopiaNR_PARCIAL: TIntegerField;
    qry_Itens_CopiaCD_EMPRESA: TStringField;
    qry_Itens_CopiaNR_DANFE: TStringField;
    qry_Itens_CopiaNR_CNTR: TStringField;
    qry_Itens_CopiaID_CLIENTE: TStringField;
    qry_Itens_CopiaCD_CFOP: TStringField;
    qry_Itens_CopiaVL_BASE_PIS_COFINS: TFloatField;
    qry_Itens_CopiaVL_AFRMM_ITEM: TFloatField;
    qry_Itens_CopiaVL_UNITARIO_FOB: TFloatField;
    qry_Itens_CopiaNumeroLote: TStringField;
    qry_NVE_Copia: TQuery;
    dsAtributoDuimp: TDataSource;
    qryAtributoDuimp: TQuery;
    qryAtributoDuimpNR_PROCESSO: TStringField;
    qryAtributoDuimpNR_ADICAO: TStringField;
    qryAtributoDuimpNR_ITEM: TStringField;
    qryAtributoDuimpCD_ATRIBUTO: TStringField;
    qryApagaAtributo: TQuery;
    updAtributoDuimp: TUpdateSQL;
    qryAtributoDuimpVL_ATRIBUTO: TStringField;
    dsAtributoDuimpCad: TDataSource;
    qryAtributoDuimpCad: TQuery;
    qryAtributoDuimpCadCodigo: TStringField;
    qryAtributoDuimpCadAtributoCondicionante: TBooleanField;
    qryAtributoDuimpCadAtributoCondicionado: TStringField;
    qryAtributoDuimpCadNome: TStringField;
    qryAtributoDuimpCadNomeApresentacao: TStringField;
    qryAtributoDuimpCadModalidade: TStringField;
    qryAtributoDuimpCadDataInicioVigencia: TDateTimeField;
    qryAtributoDuimpCadDataFimVigencia: TDateTimeField;
    qryAtributoDuimpCadFormaPreenchimento: TStringField;
    qryAtributoDuimpCadOrientacaoPreenchimento: TStringField;
    qryAtributoDuimpCadTamanhoMaximo: TIntegerField;
    qryAtributoDuimpCadObrigatorio: TBooleanField;
    qryAtributoDuimpCadMultivalorado: TBooleanField;
    qryAtributoDuimpCadOrgaos: TStringField;
    qryAtributoDuimpCadDescricaoCondicao: TStringField;
    qryAtributoDuimpCadCondicaoOperador: TStringField;
    qryAtributoDuimpCadCondicaoValor: TStringField;
    qry_ad_itens_NR_ITEM_DUIMP: TIntegerField;
    ds_item_acrescimos: TDataSource;
    tbl_item_acrescimos_: TTable;
    tbl_item_acrescimos_NR_PROCESSO: TStringField;
    tbl_item_acrescimos_NR_ADICAO: TStringField;
    tbl_item_acrescimos_CD_MET_ACRES_VALOR: TStringField;
    tbl_item_acrescimos_VL_ACRESCIMO_MOEDA: TFloatField;
    tbl_item_acrescimos_CD_MD_NEGOC_ACRES: TStringField;
    tbl_item_acrescimos_VL_ACRESCIMO_MN: TFloatField;
    tbl_item_acrescimos_Look_nm_acrescimo: TStringField;
    tbl_item_acrescimos_NR_ITEM: TStringField;
    tbl_tp_acres_: TTable;
    tbl_tp_acres_CODIGO: TStringField;
    tbl_tp_acres_DESCRICAO: TStringField;
    tbl_tp_acres_DESCRICAO_REDUZIDA: TStringField;
    tbl_item_deducoes_: TTable;
    tbl_item_deducoes_NR_PROCESSO: TStringField;
    tbl_item_deducoes_NR_ADICAO: TStringField;
    tbl_item_deducoes_CD_MET_DEDUC_VALOR: TStringField;
    tbl_item_deducoes_VL_DEDUCAO_MNEG: TFloatField;
    tbl_item_deducoes_CD_MD_NEGOC_DEDUC: TStringField;
    tbl_item_deducoes_VL_DEDUCAO_MN: TFloatField;
    tbl_item_deducoes_Look_nm_deducao: TStringField;
    tbl_tp_dedu_: TTable;
    tbl_tp_dedu_CODIGO: TStringField;
    tbl_tp_dedu_DESCRICAO: TStringField;
    tbl_tp_dedu_DESCRICAO_REDUZIDA: TStringField;
    ds_item_deducoes: TDataSource;
    tbl_item_deducoes_NR_ITEM: TStringField;
    qry_ad_itens_Look_Cod_Catalogo: TIntegerField;
    qry_mercadoria_lookup_CD_CATALOGO_PRODUTOS: TIntegerField;
    dsAtributosTributarios: TDataSource;
    qryAtributosTributarios: TQuery;
    qryAtributosTributariosNrProcesso: TStringField;
    qryAtributosTributariosNrAdicao: TStringField;
    qryAtributosTributariosTributoCodigo: TStringField;
    qryAtributosTributariosTributoNome: TStringField;
    qryAtributosTributariosRegimeCodigo: TStringField;
    qryAtributosTributariosRegimeNome: TStringField;
    qryAtributosTributariosFundamentoCodigo: TStringField;
    qryAtributosTributariosFundamentoNome: TStringField;
    qryAtributosTributariosFundamentoTipo: TStringField;
    qryAtributosTributariosAtributoCodigo: TStringField;
    qryAtributosTributariosAtributoDescricaoCodigo: TStringField;
    qryAtributosTributariosAtributoTipoCodigo: TStringField;
    qryAtributosTributariosAtributoValor: TStringField;
    qryAtributosTributariosAtributoDescricaoValor: TStringField;
    qryAtributosFundamento: TQuery;
    qryAtributosFundamentoNrProcesso: TStringField;
    qryAtributosFundamentoNrAdicao: TStringField;
    qryAtributosFundamentoAtributoCodigo: TStringField;
    qryAtributosFundamentoAtributoNome: TStringField;
    qryAtributosFundamentoAtributoValor: TStringField;
    qryAtributosFundamentoAtributoDescricaoValor: TStringField;
    qryAtributosFundamentoFundamentoCodigo: TStringField;
    dsAtributosFundamento: TDataSource;
    qry_ad_itens_VL_IS: TFloatField;
    qry_ad_itens_VL_CIDE: TFloatField;
    qry_ad_itens_VL_DIR_COMP: TFloatField;
    qry_ad_itens_VL_MED_SAL: TFloatField;
    qry_ad_itens_VL_OUTROS_TRIB: TFloatField;
    qry_ad_itens_VL_IBS_MUN: TFloatField;
    qry_ad_itens_VL_IBS_UF: TFloatField;
    qry_ad_itens_VL_CBS: TFloatField;
    qry_ad_itens_VL_BASE_IBS_CBS: TFloatField;
    dsLPCO: TDataSource;
    qryLPCO: TQuery;
    qryLPCONrProcesso: TStringField;
    qryLPCONrAdicao: TStringField;
    qryLPCONrItem: TStringField;
    qryLPCONrLPCO: TStringField;
    qry_ad_itens_TX_DESC_COMPLEMENTAR: TStringField;
    procedure tbl_ad_itens_BeforePost(DataSet: TDataSet);
    procedure qry_ad_itens_AfterPost(DataSet: TDataSet);
    procedure qry_ad_itens_AfterCancel(DataSet: TDataSet);
    procedure qry_ad_itens_AfterEdit(DataSet: TDataSet);
    procedure qry_ad_itens_AfterInsert(DataSet: TDataSet);
    procedure qry_ad_itens_AfterScroll(DataSet: TDataSet);
    procedure qry_ad_itens_BeforePost(DataSet: TDataSet);
    procedure qry_nve_AfterPost(DataSet: TDataSet);
    procedure qry_nve_AfterScroll(DataSet: TDataSet);
    procedure qry_di_AfterPost(DataSet: TDataSet);
    procedure qry_adicao_AfterPost(DataSet: TDataSet);
    procedure qry_ad_itens_AfterDelete(DataSet: TDataSet);
    procedure DataModuleCreate(Sender: TObject);
    procedure qryAtributoDuimpAfterScroll(DataSet: TDataSet);
    procedure qryAtributoDuimpVL_ATRIBUTOChange(Sender: TField);
    procedure qryAtributoDuimpAfterPost(DataSet: TDataSet);
  private
    { Private declarations }
    procedure Atribui_trib( NCM: String );
    procedure FillComboBox(CD_Atributo: string);
    procedure AtualizaDadosAtributos(DataSet: TDataSet);
//    procedure cbxNcmAtributoDominiosChange(Sender: TObject);
  public
    FDomainCodes: TStringList;
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    { Public declarations }
  end;

var
  datm_DI_Itens: Tdatm_DI_Itens;

implementation

uses PGDI004, PGDI001, PGDI005, GSMLIB, ConsOnlineEx;

{$R *.DFM}

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

procedure Tdatm_DI_Itens.Atribui_trib( NCM: String );
var Qry: TQuery;
begin
   Qry := TQuery.Create( datm_DI_Itens );
   with Qry do
   begin
      Close;
      DataBaseName := 'DBBroker';
      Sql.Clear;
      Sql.Add('SELECT * FROM TNCM (NOLOCK) WHERE CODIGO = "' + NCM + '"');
      Open;
      if RecordCount > 0 then
      begin
{
        if digitou_letras( Qry.FieldByName('ALIQUOTA_II').AsString ) then
           qry_ad_itens_VL_II_ITEM.AsFloat  := 0
        else
           qry_ad_itens_VL_II_ITEM.AsFloat  := Qry.FieldByName('ALIQUOTA_II').AsFloat;
        if digitou_letras( Qry.FieldByname('ALIQUOTA_IPI').AsString ) then
           qry_ad_itens_VL_IPI_ITEM.AsFloat := 0
        else
           qry_ad_itens_VL_IPI_ITEM.AsFloat := Qry.FieldByname('ALIQUOTA_IPI').AsFloat;}
      end
      else
      begin
{        qry_ad_itens_VL_II_ITEM.AsFloat  := 0;
        qry_ad_itens_VL_IPI_ITEM.AsFloat := 0;}
      end;
      Close;
      Free;
   end;
end;

procedure Tdatm_DI_Itens.tbl_ad_itens_BeforePost(DataSet: TDataSet);
begin
  if qry_ad_itens_.State = dsInsert then
  begin
    with qry_ad_itens_nr_ordem_ do
    begin
      ParamByName('NR_PROCESSO').AsString:= qry_adicao_NR_PROCESSO.AsString;
      Prepare;
      Open;
      qry_ad_itens_NR_ORDEM.AsInteger:= qry_ad_itens_nr_ordem_NR_ORDEM.AsInteger;
      Close;
    end;
  end;
end;

procedure Tdatm_DI_Itens.qry_ad_itens_AfterPost(DataSet: TDataSet);
begin
  frm_DI_Itens.DBNavigator1.Enabled := True;
  frm_DI_Itens.DBNavigator2.Enabled := True;
  qry_ad_itens_.ApplyUpdates;
end;

procedure Tdatm_DI_Itens.qry_ad_itens_AfterCancel(DataSet: TDataSet);
begin
  frm_DI_Itens.DBNavigator1.Enabled := True;
  frm_DI_Itens.DBNavigator2.Enabled := True;

  frm_DI_Itens.ConsisteCmbsReferencia(True, True);
  frm_DI_Itens.CmbItens.ItemIndex    := frm_DI_Itens.CmbItens.Items.IndexOf(qry_ad_itens_NR_ITEM_PO.AsString);
  frm_DI_Itens.CmbParciais.ItemIndex := frm_DI_Itens.CmbParciais.Items.IndexOf(qry_ad_itens_NR_PARCIAL.AsString);
end;

procedure Tdatm_DI_Itens.qry_ad_itens_AfterEdit(DataSet: TDataSet);
begin
  frm_DI_Itens.DBNavigator1.Enabled := False;
  frm_DI_Itens.DBNavigator2.Enabled := False;
end;

procedure Tdatm_DI_Itens.qry_ad_itens_AfterInsert(DataSet: TDataSet);
begin
  frm_DI_Itens.DBNavigator1.Enabled := False;
  frm_DI_Itens.DBNavigator2.Enabled := False;
end;

procedure Tdatm_DI_Itens.qry_ad_itens_AfterScroll(DataSet: TDataSet);
var  str_cd_ncm_c8 : string[8];
begin

  if frm_DI_Itens.pgctrl_Item.ActivePageIndex = 7 then
  begin
    frm_DI_Itens.CarregarLPCOsItem;
    frm_DI_Itens.CarregarLPCOsDisponiveis;
  end;

  frm_DI_Itens.mi_atz_desc_merc.Visible  := ( Copy( str_nr_processo, 5, 2 ) = 'IN' ) or
                                            ( Copy( str_nr_processo, 5, 2 ) = 'IT' );
  frm_DI_Itens.btn_atz_desc_merc.Visible := ( Copy( str_nr_processo, 5, 2 ) = 'IN' ) or
                                            ( Copy( str_nr_processo, 5, 2 ) = 'IT' );

  qry_ii_.Close;
  qry_ii_.Open;
  qry_ipi_.Close;
  qry_ipi_.Open;

  if tbl_unid_med_.Active and
     tbl_ncm_.Active then
  begin
    str_cd_ncm_c8 := Copy( qry_ad_itens_CD_NCM_SH.AsString, 1, 8 );

    if Trim(str_cd_ncm_c8) = '' then Exit;

    if tbl_ncm_.FindKey([ str_cd_ncm_c8 ]) then
    begin
       if tbl_unid_med_.FindKey([ tbl_ncm_UNIDADE_MEDIDA.AsString ]) then
       begin
         frm_DI_Itens.edt_nm_unid_est.text  := tbl_unid_med_NM_UNID_MEDIDA.AsString;
         frm_DI_Itens.edt_nm_unid_est2.text := tbl_unid_med_NM_UNID_MEDIDA.AsString;
       end
       else
       begin
         frm_DI_Itens.edt_nm_unid_est.text  := '';
         frm_DI_Itens.edt_nm_unid_est2.text := '';
       end
    end;
  end;

  // ** NVE
  with datm_DI_Itens.qry_nve_ do
  begin
    Close;
    Sql.Clear;
    Sql.Add('Select * from TDI_NVE (NOLOCK) where NR_PROCESSO = "' + str_nr_processo + '" and NR_ADICAO = "'+ qry_adicao_NR_ADICAO.asString  + '" and NR_ITEM = "' + qry_ad_itens_NR_ITEM.asString  + '" ');
    Sql.Add('Order By CD_NIVEL_NVE, CD_ATRIBUTO_NCM, CD_ESPECIF_NCM');
    Open;
  end;

  qryAtributoDuimp.Close;
  qryAtributoDuimp.Sql.Clear;
  qryAtributoDuimp.Sql.Add('Select * from TNCM_ATRIBUTO_DUIMP (NOLOCK) where NR_PROCESSO = "' + str_nr_processo + '" and NR_ADICAO = "'+ qry_adicao_NR_ADICAO.asString  + '" and NR_ITEM = "' + qry_ad_itens_NR_ITEM.asString  + '" ');
  qryAtributoDuimp.Sql.Add('Order By CD_ATRIBUTO');
  qryAtributoDuimp.Open;
  if qryAtributoDuimp.RecordCount < 1 then
    AtualizaDadosAtributos(qryAtributoDuimp);

  qryAtributosTributarios.Close;
  qryAtributosTributarios.ParamByName('NR_PROCESSO').AsString := str_nr_processo;
  qryAtributosTributarios.ParamByName('NR_ADICAO').AsString   := qry_adicao_NR_ADICAO.AsString;
  qryAtributosTributarios.ParamByName('NR_ITEM').AsString   := qry_ad_itens_NR_ITEM.asString;
  qryAtributosTributarios.Prepare;
  qryAtributosTributarios.Open;

  qryAtributosFundamento.Close;
  qryAtributosFundamento.ParamByName('NR_PROCESSO').AsString := str_nr_processo;
  qryAtributosFundamento.ParamByName('NR_ADICAO').AsString   := qry_adicao_NR_ADICAO.AsString;
  qryAtributosFundamento.ParamByName('NR_ITEM').AsString   := qry_ad_itens_NR_ITEM.asString;
  qryAtributosFundamento.Prepare;
  qryAtributosFundamento.Open;

  tbl_item_acrescimos_.Open;
  tbl_item_deducoes_.Open;  

  with frm_DI_Itens do
  begin
    if ( datm_DI_Itens.qry_ad_itens_IN_PROVEM_PO.AsBoolean ) then
    begin
      dbcbo_nr_po.ReadOnly               := True;
      dbcbo_nr_po2.ReadOnly              := True;
      dbedt_nr_item_po.ReadOnly          := True;
      dbedt_nr_item_po2.ReadOnly         := True;
      dbcbo_nr_po.Color                  := clMenu;
      dbcbo_nr_po2.Color                 := clMenu;
      dbedt_nr_item_po.Color             := clMenu;
      dbedt_nr_item_po2.Color            := clMenu;
    end
    else
    begin
      dbcbo_nr_po.ReadOnly               := False;
      dbcbo_nr_po2.ReadOnly              := False;
      dbedt_nr_item_po.ReadOnly          := False;
      dbedt_nr_item_po2.ReadOnly         := False;
      dbcbo_nr_po.Color                  := clWindow;
      dbcbo_nr_po2.Color                 := clWindow;
      dbedt_nr_item_po.Color             := clWindow;
      dbedt_nr_item_po2.Color            := clWindow;
    end;
  end;

  //Pedidos/Itens
  frm_DI_Itens.ConsisteCmbsReferencia(True, True);
  
  if datm_DI_Itens.qry_ad_itens_NR_ITEM_PO.AsString <> '' then
    frm_DI_Itens.CmbItens.ItemIndex    := frm_DI_Itens.CmbItens.Items.IndexOf(qry_ad_itens_NR_ITEM_PO.AsString);
  if datm_DI_Itens.qry_ad_itens_NR_PARCIAL.AsString <> '' then
    frm_DI_Itens.CmbParciais.ItemIndex := frm_DI_Itens.CmbParciais.Items.IndexOf(qry_ad_itens_NR_PARCIAL.AsString);

  qryIntegracaoPhilips.Close;
  qryIntegracaoPhilips.ParamByName('PROCESSO').AsString := qry_ad_itens_NR_PROCESSO.AsString;
  qryIntegracaoPhilips.ParamByName('NR_ITEM_CLIENTE').AsString := qry_ad_itens_NR_ITEM_PO.AsString;
  qryIntegracaoPhilips.ParamByName('NR_PO').AsString := qry_ad_itens_NR_PROC_PO.AsString;
  qryIntegracaoPhilips.Open;
end;

procedure Tdatm_DI_Itens.qry_ad_itens_BeforePost(DataSet: TDataSet);
begin
  if frm_DI_Itens.CmbItens.Text <> '' then
    qry_ad_itens_NR_ITEM_PO.AsString      := frm_DI_Itens.CmbItens.Text;
  if frm_DI_Itens.CmbParciais.Text <> '' then
    qry_ad_itens_NR_PARCIAL.AsString      := frm_DI_Itens.CmbParciais.Text;
  if frm_DI_Itens.CmbParciais.Text <> '' then
    qry_ad_itens_NR_ADICAO.AsString      := frm_DI_Itens.dbedtNrAdicao.Text;
  if frm_DI_Itens.CmbParciais.Text <> '' then
    qry_ad_itens_NR_ITEM.AsString      := frm_DI_Itens.dbedtNrItem.Text;

  qry_ad_itens_VL_MLE_ITEM.AsFloat      := Arredondar( qry_ad_itens_VL_MLE_ITEM.AsFloat, 2);
  qry_ad_itens_VL_DESCONTO_MERC.AsFloat := Arredondar( qry_ad_itens_VL_DESCONTO_MERC.AsFloat, 2);
  Atribui_trib( qry_ad_itens_CD_NCM_SH.asString );
end;

procedure Tdatm_DI_Itens.qry_nve_AfterPost(DataSet: TDataSet);
var
  nr_processo, nr_adicao, nr_item, cd_nve, cd_atrib, cd_especif: String;
  Resultado: Integer;
begin
  nr_processo := datm_DI_Itens.qry_nve_NR_PROCESSO.asString;
  nr_adicao   := datm_DI_Itens.qry_nve_NR_ADICAO.asString;
  nr_item     := datm_DI_Itens.qry_nve_NR_ITEM.asString;
  cd_nve      := datm_DI_Itens.qry_nve_CD_NIVEL_NVE.asString;
  cd_atrib    := datm_DI_Itens.qry_nve_CD_ATRIBUTO_NCM.asString;
  cd_especif  := datm_DI_Itens.qry_nve_CD_ESPECIF_NCM.asString;

  CloseStoredProc(sp_di_reclassifica_item);
  sp_di_reclassifica_item.ParamByName('@NR_PROCESSO').AsString := nr_processo;
  sp_di_reclassifica_item.ParamByName('@NR_ADICAO').AsString   := nr_adicao;
  sp_di_reclassifica_item.ParamByName('@NR_ITEM').AsString     := nr_item;

  qry_ad_itens_.Close;
  qry_adicao_.Close;
  qry_di_.Close;

  ExecStoredProc(sp_di_reclassifica_item);

  Resultado := sp_di_reclassifica_item.ParamByName('Result').AsInteger;
  if Resultado = 0 then
  begin
    nr_adicao := sp_di_reclassifica_item.ParamByName('@NR_ADICAO').AsString;
    nr_item   := sp_di_reclassifica_item.ParamByName('@NR_ITEM').AsString;
  end;
  CloseStoredProc(sp_di_reclassifica_item);


  CloseStoredProc(sp_di_renumera_itens_adicao);
  sp_di_renumera_itens_adicao.ParamByName('@NR_PROCESSO').AsString := str_nr_processo;
  sp_di_renumera_itens_adicao.ParamByName('@NR_ADICAO').AsString   := nr_adicao;
  ExecStoredProc(sp_di_renumera_itens_adicao);
  CloseStoredProc(sp_di_renumera_itens_adicao);

  qry_di_.ParamByName('NR_PROCESSO').AsString:= nr_processo;
  qry_di_.Prepare;
  qry_di_.Open;

  qry_adicao_.Open;

  qry_ad_itens_.Prepare;
  qry_ad_itens_.Open;

  qry_di_.EnableControls;
  qry_adicao_.EnableControls;
  qry_ad_itens_.EnableControls;

  if Resultado = 0 then
    qry_adicao_.Locate('NR_PROCESSO;NR_ADICAO', VarArrayOf ([nr_processo, nr_adicao]), [loCaseInsensitive])
  else qry_adicao_.Locate('NR_PROCESSO;NR_ADICAO', VarArrayOf ([nr_processo, '001']), [loCaseInsensitive]);

  if Resultado = 0 then
     qry_ad_itens_.Locate('NR_PROCESSO;NR_ADICAO;NR_ITEM', VarArrayOf ([nr_processo, nr_adicao, nr_item]), [loCaseInsensitive])
  else qry_ad_itens_.Locate('NR_PROCESSO;NR_ADICAO;NR_ITEM', VarArrayOf ([nr_processo, nr_adicao, '001']), [loCaseInsensitive]);

  with qry_nve_ do
  begin
    Close;
    Prepare;
    Open;
    Locate('NR_PROCESSO;NR_ADICAO;NR_ITEM;CD_NIVEL_NVE;CD_ATRIBUTO_NCM;CD_ESPECIF_NCM',VarArrayOF([ nr_processo, nr_adicao, nr_item, cd_nve, cd_atrib, cd_especif ]),[]);
  end;
end;

procedure Tdatm_DI_Itens.qry_nve_AfterScroll(DataSet: TDataSet);
begin
  if qry_nve_.RecordCount > 0 then
     frm_DI_Itens.ts_nve.Enabled := True
  else
     frm_DI_Itens.ts_nve.Enabled := False;

  qry_atrib_.Close;
  qry_atrib_.SQL[2] := 'CD_NOMENC_NCM = "' + Trim( qry_nve_CD_NCM_ATRIBUTO.AsString ) + '" AND CD_ATRIBUTO_NCM = "' + Trim( qry_nve_CD_ATRIBUTO_NCM.AsString ) + '"';
  qry_atrib_.Prepare;
  qry_atrib_.Open;

  qry_especif_.Close;
  qry_especif_.SQL[2] := 'CD_NOMENC_NCM = "' + Trim( qry_nve_CD_NCM_ESPECIF.AsString ) + '" AND CD_ATRIBUTO_NCM = "' + Trim( qry_nve_CD_ATRIBUTO_NCM.AsString ) + '" AND CD_ESPECIF_NCM = "' + Trim( qry_nve_CD_ESPECIF_NCM.AsString ) + '"';
  qry_especif_.Prepare;
  qry_especif_.Open;

  {if frm_DI_Itens.pgctrl_Item.ActivePage = frm_DI_Itens.ts_nve then
  begin
    if Not ( qry_nve_.State in [dsInsert] ) then
    begin
      qry_nve_.Edit;
      qry_nve_.Cancel;
    end;
  end;}
end;


procedure Tdatm_DI_Itens.qry_di_AfterPost(DataSet: TDataSet);
begin
  qry_di_.ApplyUpdates;
end;

procedure Tdatm_DI_Itens.qry_adicao_AfterPost(DataSet: TDataSet);
begin
  qry_adicao_.ApplyUpdates;
end;

procedure Tdatm_DI_Itens.qry_ad_itens_AfterDelete(DataSet: TDataSet);
begin
  qry_ad_itens_.ApplyUpdates;
end;

procedure Tdatm_DI_Itens.DataModuleCreate(Sender: TObject);
begin
  SetServicoNovo(str_nr_processo, Self);
end;

procedure Tdatm_DI_Itens.qryAtributoDuimpAfterScroll(DataSet: TDataSet);
begin
  AtualizaDadosAtributos(DataSet);
end;

procedure Tdatm_DI_Itens.AtualizaDadosAtributos(DataSet: TDataSet);
begin
  frm_DI_Itens.cbxNcmAtributoDominios.Items.Clear;
  frm_DI_Itens.cbxNcmAtributoDominios.Text := '';
  FDomainCodes.Clear;
  frm_DI_Itens.cbxNcmAtributoDominios.ItemIndex := -1;

  // repopula o combo
  FillComboBox(DataSet.FieldByName('CD_ATRIBUTO').AsString);

  qryAtributoDuimpCad.Close;
  qryAtributoDuimpCad.ParamByName('Codigo').AsString := DataSet.FieldByName('CD_ATRIBUTO').AsString;
  qryAtributoDuimpCad.Open;

  if not qryAtributoDuimpCad.IsEmpty then
  begin
    if qryAtributoDuimpCad.FieldByName('Obrigatorio').AsBoolean then
      frm_DI_Itens.edtObrigatorio.Text := 'Sim'
    else
      frm_DI_Itens.edtObrigatorio.Text := 'Não';

    if qryAtributoDuimpCad.FieldByName('AtributoCondicionante').AsBoolean then
      frm_DI_Itens.edtCondicionante.Text := 'Sim'
    else
      frm_DI_Itens.edtCondicionante.Text := 'Não';
  end
  else
  begin
    frm_DI_Itens.edtObrigatorio.Clear;
    frm_DI_Itens.edtCondicionante.Clear;
  end;
end;

constructor Tdatm_DI_Itens.Create(AOwner: TComponent);
begin
  inherited;
  FDomainCodes := TStringList.Create;
//  frm_DI_Itens.cbxNcmAtributoDominios.OnChange := cbxNcmAtributoDominiosChange;
end;

destructor Tdatm_DI_Itens.Destroy;
begin
  FDomainCodes.Free;
  inherited;
end;

procedure Tdatm_DI_Itens.FillComboBox(CD_Atributo: string);
var
  Query: TQuery;
  codigoStr, descricao: string;
begin
  // limpa lista de items e lookup
  frm_DI_Itens.cbxNcmAtributoDominios.Items.Clear;
  FDomainCodes.Clear;

  // primeira opção vazia
  frm_DI_Itens.cbxNcmAtributoDominios.Items.Add('');
  FDomainCodes.Add('');  

  // carrega as demais opções
  Query := TQuery.Create(nil);
  try
    Query.DatabaseName := 'DBBROKER';
    Query.SQL.Text :=
      'SELECT Codigo, Descricao ' +
      'FROM AtributoDuimpDominio ' +
      'WHERE CodigoAtributo = :CodigoAtributo';
    Query.ParamByName('CodigoAtributo').AsString := CD_Atributo;
    Query.Open;

    frm_DI_Itens.cbxNcmAtributoDominios.Visible := not Query.IsEmpty;
    frm_DI_Itens.lblNcmAtributoDominios.Visible := frm_DI_Itens.cbxNcmAtributoDominios.Visible;
    frm_DI_Itens.txtAtributoDuimpDominio.ReadOnly := frm_DI_Itens.cbxNcmAtributoDominios.Visible;

    while not Query.Eof do
    begin
      codigoStr := Query.FieldByName('Codigo').AsString;
      descricao := Query.FieldByName('Descricao').AsString;
      FDomainCodes.Add(codigoStr);
      frm_DI_Itens.cbxNcmAtributoDominios.Items.Add(codigoStr + ' - ' + descricao);
      Query.Next;
    end;
  finally
    Query.Free;
  end;
end;

procedure Tdatm_DI_Itens.qryAtributoDuimpVL_ATRIBUTOChange(Sender: TField);
var
  vQuery: TQuery;
begin
  vQuery := TQuery.Create(nil);
  vQuery.DatabaseName := 'DBBROKER' ;
  try
    if qryAtributoDuimpCadAtributoCondicionante.AsBoolean then
    begin

      if (qryAtributoDuimpCadCondicaoOperador.AsString = '==') and (Sender.AsString = qryAtributoDuimpCadCondicaoValor.AsString) then
      begin
        ShowMessage('Será inserido os atributos condicionados');

        vQuery.SQL.Text := 'SELECT Codigo FROM AtributoDuimp WHERE AtributoCondicionado = :AtributoCondicionado';
        vQuery.ParamByName('AtributoCondicionado').AsString := qryAtributoDuimpCD_ATRIBUTO.AsString;
        vQuery.Open;
        vQuery.First;

        qryAtributoDuimp.DisableControls;
        while not vQuery.eof do
        begin
          qryAtributoDuimp.Append;
          qryAtributoDuimpNR_PROCESSO.AsString := str_nr_processo;
          qryAtributoDuimpNR_ADICAO.AsString   := qry_adicao_NR_ADICAO.AsString;
          qryAtributoDuimpNR_ITEM.AsString     := qry_ad_itens_NR_ITEM.AsString;
          qryAtributoDuimpCD_ATRIBUTO.AsString := vQuery.fieldByName('Codigo').AsString;
          qryAtributoDuimp.Post;

          vQuery.Next;
        end;
        qryAtributoDuimp.EnableControls;
        frm_DI_Itens.dbgAtributosDuimp.refresh;
      end;
    end;
  finally
    vQuery.Free;
  end;
end;

procedure Tdatm_DI_Itens.qryAtributoDuimpAfterPost(DataSet: TDataSet);
var
  vCdAtributoNovo: String;
begin
  AtualizaDadosAtributos(qryAtributoDuimp);
  vCdAtributoNovo := qryAtributoDuimp.fieldByName('CD_ATRIBUTO').AsString;
  qryAtributoDuimp.Close;
  qryAtributoDuimp.Sql.Clear;
  qryAtributoDuimp.Sql.Add('Select * from TNCM_ATRIBUTO_DUIMP (NOLOCK) where NR_PROCESSO = "' + str_nr_processo + '" and NR_ADICAO = "'+ qry_adicao_NR_ADICAO.asString  + '" and NR_ITEM = "' + qry_ad_itens_NR_ITEM.asString  + '" ');
  qryAtributoDuimp.Sql.Add('Order By CD_ATRIBUTO');
  qryAtributoDuimp.Open;
  qryAtributoDuimp.Locate('CD_ATRIBUTO', vCdAtributoNovo, []);
end;

end.
