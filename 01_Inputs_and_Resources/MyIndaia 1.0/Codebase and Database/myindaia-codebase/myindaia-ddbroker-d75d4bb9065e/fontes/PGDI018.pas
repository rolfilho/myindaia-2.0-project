unit PGDI018;
                                    
interface

uses
  Variants,   Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  DBTables, Db, Funcoes, ServicoNovo,
  FormsLog, Provider, DBClient; // Este sempre depois das uses Forms e Classes - Michel - 22/03/2013
                              
type
  Tdatm_DI_Capa = class(TDataModule)
    ds_di_doc_instr_emb: TDataSource;                      
    tbl_di_doc_instr_emb_: TTable;
    tbl_di_doc_instr_emb_NR_PROCESSO: TStringField;
    tbl_di_doc_instr_emb_CD_TIPO_DCTO_INSTR: TStringField;
    tbl_di_doc_instr_emb_NR_DCTO_INSTRUCAO: TStringField;
    tbl_di_doc_instr_emb_Look_Doc_Instr_Emb: TStringField;
    ds_di_proc_vinc: TDataSource;
    tbl_di_proc_vinc_: TTable;
    tbl_di_proc_vinc_NR_PROCESSO: TStringField;
    tbl_di_proc_vinc_CD_TIPO_PROCESSO: TStringField;
    tbl_di_proc_vinc_NR_PROCESSO_INSTR: TStringField;
    tbl_di_proc_vinc_Look_Proc_Vinc: TStringField;
    ds_di_armazem: TDataSource;
    tbl_di_armazem_: TTable;
    tbl_di_armazem_NR_PROCESSO: TStringField;
    tbl_di_armazem_NM_ARMAZEM_CARGA: TStringField;
    tbl_di_volumes_: TTable;
    tbl_di_volumes_NR_PROCESSO: TStringField;
    tbl_di_volumes_CD_TIPO_EMBALAGEM: TStringField;
    tbl_di_volumes_QT_VOLUME_CARGA: TStringField;
    ds_di_volumes: TDataSource;
    tbl_di_darf_: TTable;
    tbl_di_darf_NR_PROCESSO: TStringField;
    tbl_di_darf_CD_RECEITA_PGTO: TStringField;
    tbl_di_darf_CD_BANCO_PGTO_TRIB: TStringField;
    tbl_di_darf_NR_AGENC_PGTO_TRIB: TStringField;
    tbl_di_darf_VL_TRIBUTO_PAGO: TFloatField;
    tbl_di_darf_DT_PGTO_TRIBUTO: TStringField;
    tbl_di_darf_VL_MULTA_PGTO_TRIB: TFloatField;
    tbl_di_darf_VL_JUROS_PGTO_TRIB: TFloatField;
    ds_di_darf: TDataSource;
    tbl_di_comp_trib_: TTable;
    tbl_di_comp_trib_NR_PROCESSO: TStringField;
    tbl_di_comp_trib_CD_RECEITA_CREDITO: TStringField;
    tbl_di_comp_trib_VL_COMPENSAR_CRED: TFloatField;
    tbl_di_comp_trib_NR_DCTO_GERADOR_CR: TStringField;
    ds_di_comp_trib: TDataSource;
    ds_di: TDataSource;
    ds_tp_vinc_expo_impo: TDataSource;
    tbl_tp_vinc_expo_impo_: TTable;
    tbl_tp_vinc_expo_impo_CD_VINC_EXPO_IMPO: TStringField;
    tbl_tp_vinc_expo_impo_DESCRICAO: TStringField;
    ds_yesno: TDataSource;
    tbl_yesno_: TTable;
    ds_empresa_nac: TDataSource;
    tbl_empresa_nac_: TTable;
    tbl_empresa_nac_CD_EMPRESA: TStringField;
    tbl_empresa_nac_AP_EMPRESA: TStringField;
    tbl_empresa_nac_NM_EMPRESA: TStringField;
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
    tbl_empresa_nac_CD_TIPO_REF: TStringField;
    tbl_empresa_nac_CD_TAB_SDA: TStringField;
    tbl_empresa_nac_DT_INCLUSAO: TDateTimeField;
    tbl_empresa_nac_IN_FATURAMENTO: TStringField;
    tbl_empresa_nac_IN_ATIVO: TStringField;
    tbl_empresa_nac_IN_RESTRICAO: TStringField;
    tbl_empresa_nac_IN_EVENTUAL: TStringField;
    tbl_empresa_nac_IN_CLIENTE: TBooleanField;
    tbl_empresa_nac_IN_IMPORTADOR: TBooleanField;
    tbl_empresa_nac_IN_EXPORTADOR: TBooleanField;
    tbl_empresa_nac_IN_OUTROS: TBooleanField;
    tbl_empresa_nac_NR_AG_BANCO_IMPOSTOS: TStringField;
    tbl_empresa_nac_CD_SDA: TStringField;
    tbl_transp_itl_: TTable;
    tbl_transp_itl_CODIGO: TStringField;
    tbl_transp_itl_DESCRICAO: TStringField;
    tbl_transp_itl_APELIDO: TStringField;
    tbl_transp_itl_CD_PAIS: TStringField;
    ds_transp_itl: TDataSource;
    tbl_local_embarque_: TTable;
    tbl_local_embarque_CODIGO: TStringField;
    tbl_local_embarque_DESCRICAO: TStringField;
    ds_local_embarque: TDataSource;
    tbl_transp_rod_: TTable;
    ds_transp_rod: TDataSource;
    ds_tipo_declaracao: TDataSource;
    tbl_tipo_declaracao_: TTable;
    tbl_tipo_declaracao_Codigo: TStringField;
    tbl_tipo_declaracao_Descricao: TStringField;
    ds_urf: TDataSource;
    tbl_urf_: TTable;
    tbl_urf_CODIGO: TStringField;
    tbl_urf_DESCRICAO: TStringField;
    ds_pais: TDataSource;
    tbl_pais_: TTable;
    tbl_pais_CODIGO: TStringField;
    tbl_pais_DESCRICAO: TStringField;
    ds_recinto_alfandegado: TDataSource;
    tbl_recinto_alfandegado_: TTable;
    tbl_recinto_alfandegado_CODIGO: TStringField;
    tbl_recinto_alfandegado_DESCRICAO: TStringField;
    tbl_recinto_alfandegado_COD_ORGAO_REC: TStringField;
    ds_recinto_setor: TDataSource;
    tbl_recinto_setor_: TTable;
    tbl_recinto_setor_Orgao: TStringField;
    tbl_recinto_setor_Recinto: TStringField;
    tbl_recinto_setor_Setor: TStringField;
    tbl_recinto_setor_Nome: TStringField;
    ds_reg_trib: TDataSource;
    tbl_reg_trib_: TTable;
    ds_fund_legal_reg_trib: TDataSource;
    tbl_fund_legal_reg_trib_: TTable;
    tbl_fund_legal_reg_trib_Codigo: TStringField;
    tbl_fund_legal_reg_trib_Descricao: TStringField;
    tbl_fund_legal_reg_trib_Reg_Tribut_1: TStringField;
    tbl_fund_legal_reg_trib_Reg_Tribut_2: TStringField;
    tbl_fund_legal_reg_trib_Reg_Tribut_3: TStringField;
    tbl_fund_legal_reg_trib_Reg_Tribut_4: TStringField;
    ds_motivo: TDataSource;
    tbl_motivo_: TTable;
    tbl_motivo_CODIGO: TStringField;
    tbl_motivo_DESCRICAO: TStringField;
    ds_mod_pagto: TDataSource;
    tbl_mod_pagto_: TTable;
    tbl_mod_pagto_CODIGO: TStringField;
    tbl_mod_pagto_DESCRICAO: TStringField;
    ds_metodo_valoracao: TDataSource;
    tbl_metodo_valoracao_: TTable;
    ds_moeda: TDataSource;
    tbl_moeda_: TTable;
    ds_embalagens: TDataSource;
    tbl_embalagens_: TTable;
    ds_taxa_cambio: TDataSource;
    tbl_taxa_cambio_: TTable;
    tbl_taxa_cambio_Codigo: TStringField;
    tbl_taxa_cambio_Descricao: TStringField;
    tbl_taxa_cambio_Taxa_Conversao: TStringField;
    tbl_taxa_cambio_Vigencia_Inicio_Taxa: TStringField;
    tbl_taxa_cambio_Vigencia_Fim_Taxa: TStringField;
    qry_ad_docto_vinc_: TQuery;
    ds_doc_instr_emb: TDataSource;
    tbl_doc_instr_emb_: TTable;
    tbl_doc_instr_emb_CODIGO: TStringField;
    tbl_doc_instr_emb_DESCRICAO: TStringField;
    ds_proc_vinc: TDataSource;
    tbl_proc_vinc_: TTable;
    sp_recalcular_adicoes: TStoredProc;
    sp_atualiza_bco_ag: TStoredProc;
    sp_di_calculo: TStoredProc;
    ds_incoterms: TDataSource;
    tbl_incoterms_: TTable;
    sp_exclui_di: TStoredProc;
    tbl_moeda_CODIGO: TStringField;
    tbl_moeda_DESCRICAO: TStringField;
    qry_ref_cliente_: TQuery;
    qry_ref_cliente_CD_REFERENCIA: TStringField;
    qry_ref_cliente_NR_PROCESSO: TStringField;
    qry_processo_: TQuery;
    qry_processo_NR_PROCESSO: TStringField;
    qry_processo_NR_PROC_RISC: TStringField;
    qry_banco_: TQuery;
    qry_adicao_taxa_: TQuery;
    qry_adicao_taxa_CD_MOEDA_MLE: TStringField;
    qry_adicao_taxa_TX_MLE: TFloatField;
    qry_ad_docto_vinc_NR_PROCESSO: TStringField;
    qry_ad_docto_vinc_NR_ADICAO: TStringField;
    qry_ad_docto_vinc_NR_SEQUENCIA: TAutoIncField;
    qry_ad_docto_vinc_CD_TIPO_DCTO_VINC: TStringField;
    qry_ad_docto_vinc_NR_DCTO_VINCULADO: TStringField;
    Query3: TQuery;
    sp_di_atz_tipo_di: TStoredProc;
    sp_di_atz_via_transp: TStoredProc;
    ds_via_transporte: TDataSource;
    tbl_via_transporte_: TTable;
    tbl_via_transporte_CD_VIA_TRANSPORTE: TStringField;
    tbl_via_transporte_NM_VIA_TRANSPORTE: TStringField;
    qry_di_: TQuery;
    qry_di_NR_PROCESSO: TStringField;
    qry_di_NR_IDENT_USUARIO: TStringField;
    qry_di_CD_APLICACAO_MERC: TStringField;
    qry_di_CD_BANDEIRA_TRANSP: TStringField;
    qry_di_CD_COBERTURA_CAMBIAL: TStringField;
    qry_di_CD_DESTAQUE_NCM: TStringField;
    qry_di_CD_FORMA_PAGAMENTO: TStringField;
    qry_di_CD_FUND_LEGAL_II: TStringField;
    qry_di_CD_IMPORTADOR: TStringField;
    qry_di_CD_INCOTERM: TStringField;
    qry_di_CD_LOCAL_EMBARQUE: TStringField;
    qry_di_CD_METODO_VALORACAO: TStringField;
    qry_di_CD_MODALIDADE_DESP: TStringField;
    qry_di_CD_MODALIDADE_PAGTO: TStringField;
    qry_di_CD_MOEDA_DESPESAS: TStringField;
    qry_di_CD_MOEDA_FRETE: TStringField;
    qry_di_CD_MOEDA_MLE: TStringField;
    qry_di_CD_MOEDA_SEGURO: TStringField;
    qry_di_CD_MOTIVO_SEM_COBERTURA: TStringField;
    qry_di_CD_MOTIVO_TRANS: TStringField;
    qry_di_CD_PAIS_IMPORTADOR: TStringField;
    qry_di_CD_PAIS_PROC_CARGA: TStringField;
    qry_di_CD_RECINTO_ALFAND: TStringField;
    qry_di_CD_REG_TRIB_II: TStringField;
    qry_di_CD_REG_TRIB_IPI: TStringField;
    qry_di_CD_SETOR_ARMAZENAM: TStringField;
    qry_di_CD_TIPO_AG_CARGA: TStringField;
    qry_di_CD_TIPO_CONSIG: TStringField;
    qry_di_CD_TIPO_DCTO_CARGA: TStringField;
    qry_di_CD_TIPO_DECLARACAO: TStringField;
    qry_di_CD_TIPO_IMPORTADOR: TStringField;
    qry_di_CD_TIPO_MANIFESTO: TStringField;
    qry_di_CD_TRANSPORTADOR: TStringField;
    qry_di_CD_URF_DESPACHO: TStringField;
    qry_di_CD_URF_ENTR_CARGA: TStringField;
    qry_di_CD_UTIL_DCTO_CARGA: TStringField;
    qry_di_CD_VIA_TRANSP_CARG: TStringField;
    qry_di_CD_VINC_IMPO_EXPO: TStringField;
    qry_di_DT_CHEGADA_CARGA: TStringField;
    qry_di_DT_EMBARQUE: TStringField;
    qry_di_DT_PROCESSAMENTO: TStringField;
    qry_di_DT_REGISTRO_DI: TStringField;
    qry_di_DT_TRANSMISSAO: TStringField;
    qry_di_IN_BEM_ENCOMENDA: TBooleanField;
    qry_di_IN_MATERIAL_USADO: TBooleanField;
    qry_di_IN_MOEDA_NACIONAL: TStringField;
    qry_di_IN_MOEDA_UNICA: TBooleanField;
    qry_di_IN_MULTIMODAL: TBooleanField;
    qry_di_IN_OPERACAO_FUNDAP: TBooleanField;
    qry_di_IN_RATEAR_FRETE_ITENS: TBooleanField;
    qry_di_IN_RATEAR_SEGURO_ITENS: TBooleanField;
    qry_di_IN_REPASSA_DADOS_ADICAO: TBooleanField;
    qry_di_IN_REPASSA_DADOS_CAMBIO: TBooleanField;
    qry_di_NM_CONSIGNATARIO: TStringField;
    qry_di_NM_VEICULO_TRANSP: TStringField;
    qry_di_NR_AGENTE_CARGA: TStringField;
    qry_di_NR_BANCO_COM: TStringField;
    qry_di_NR_BANCO_PAGAMENTO: TStringField;
    qry_di_NR_COMPRADOR_ME: TStringField;
    qry_di_NR_CONSIGNATARIO: TStringField;
    qry_di_NR_CONTRATO_CAMBIO: TStringField;
    qry_di_NR_CPF_REPR_LEGAL: TStringField;
    qry_di_NR_DECL_IMP_PROT: TStringField;
    qry_di_NR_DECLARACAO_IMP: TStringField;
    qry_di_NR_IDENTIFICACAO_COM: TStringField;
    qry_di_NR_MANIFESTO: TStringField;
    qry_di_NR_PRACA_COM: TStringField;
    qry_di_NR_PRACA_PAGAMENTO: TStringField;
    qry_di_NR_ROF: TStringField;
    qry_di_NR_VEICULO_TRANSP: TStringField;
    qry_di_PB_CARGA: TFloatField;
    qry_di_PC_COMISSAO: TFloatField;
    qry_di_PC_ICMS: TFloatField;
    qry_di_PC_REDUCAO_ICMS: TFloatField;
    qry_di_PL_CARGA: TFloatField;
    qry_di_QT_ADICOES: TIntegerField;
    qry_di_TX_INFO_COMPL: TMemoField;
    qry_di_VL_FRETE_TNAC_MNEG: TFloatField;
    qry_di_VL_TOT_DESPS_MN: TFloatField;
    qry_di_VL_TOT_DESPS_MNEG: TFloatField;
    qry_di_VL_TOT_FRT_COLLECT: TFloatField;
    qry_di_VL_TOT_FRT_PREPAID: TFloatField;
    qry_di_VL_TOT_MLE_MNEG: TFloatField;
    qry_di_VL_TOT_SEGURO_MNEG: TFloatField;
    qry_di_VL_TOTAL_FRETE_MN: TFloatField;
    qry_di_VL_TOTAL_MLE_MN: TFloatField;
    qry_di_VL_TOTAL_SEG_MN: TFloatField;
    qry_di_PC_SEGURO_MLE: TFloatField;
    qry_di_VL_TOTAL_II: TFloatField;
    qry_di_VL_TOTAL_IPI: TFloatField;
    qry_di_VL_TOTAL_AD: TFloatField;
    qry_di_DT_ULTIMA_ALTERACAO: TDateTimeField;
    qry_di_IN_RISC_ATUALIZADO: TStringField;
    qry_di_CD_TIPO_BASE_SEGURO: TStringField;
    qry_di_IN_REB: TStringField;
    qry_di_VL_TOT_ICMS: TFloatField;
    qry_di_CD_TIPO_PGTO_TRIB: TStringField;
    qry_di_NR_CONTA_PGTO_TRIB: TStringField;
    qry_di_TX_MLE: TFloatField;
    qry_di_TX_FRETE: TFloatField;
    qry_di_TX_SEGURO: TFloatField;
    qry_di_TX_DOLAR: TFloatField;
    qry_di_NR_REF_CLI: TStringField;
    qry_di_IN_SISCOMEX: TStringField;
    qry_di_CD_TIPO_ICMS: TStringField;
    qry_di_IN_ICMS_IMPRESSO: TStringField;
    qry_di_DT_ICMS_IMPRESSO: TDateTimeField;
    qry_di_VL_TOTAL_ACRESCIMOS_MN: TFloatField;
    qry_di_VL_TOTAL_DEDUCOES_MN: TFloatField;
    qry_di_VL_DESPESA_ITEM: TFloatField;
    qry_di_VL_DESPESA_ITEM_MN: TFloatField;
    qry_di_Calc_VL_TOT_MLE_MN: TFloatField;
    qry_di_Calc_VL_TOT_FRETE_MN: TFloatField;
    qry_di_Calc_VL_TOT_SEGURO_MN: TFloatField;
    qry_di_Calc_TOT_FRETE_MNEG: TFloatField;
    qry_di_Calc_VL_TOT_DESPESA_MN: TFloatField;
    qry_di_Look_tipo_declaracao: TStringField;
    qry_di_Look_Importador: TStringField;
    qry_di_Look_urf_despacho: TStringField;
    qry_di_Look_urf_entrada: TStringField;
    qry_di_Look_transp_itl: TStringField;
    qry_di_Look_Bandeira_Transp_itl: TStringField;
    qry_di_Look_Local_Embarque: TStringField;
    qry_di_Look_Pais_Procedencia: TStringField;
    qry_di_Look_Moeda_MLE: TStringField;
    qry_di_Look_Moeda_Frete: TStringField;
    qry_di_Look_Moeda_Seguro: TStringField;
    qry_di_Look_Transp_Rod: TStringField;
    qry_di_Look_Band_Cad_Transp: TStringField;
    qry_di_Look_Met_Valoracao: TStringField;
    qry_di_Look_Reg_Trib_II: TStringField;
    qry_di_Look_Fund_Legal: TStringField;
    qry_di_Look_Mot_Sem_Cobertura: TStringField;
    qry_di_Look_Modalidade_Pagto: TStringField;
    qry_inst_financ_: TQuery;
    qry_inst_financ_CODIGO: TStringField;
    qry_inst_financ_DESCRICAO: TStringField;
    ds_inst_financ_: TDataSource;
    qry_di_DT_CALCULO: TDateTimeField;
    qry_di_CD_ORGAO_FIN_INTER: TStringField;
    qry_di_CD_PRESENCA_CARGA: TStringField;
    qry_taxa_cambio_: TQuery;
    qry_taxa_cambio_CD_MOEDA: TStringField;
    qry_taxa_cambio_DT_INICIO_VIGENCIA: TDateTimeField;
    qry_taxa_cambio_DT_TERMINO_VIGENCIA: TDateTimeField;
    qry_taxa_cambio_TX_CAMBIO: TFloatField;
    qry_di_NR_SEQ_RETIFICACAO: TStringField;
    qry_di_CD_MOTIVO_RETIF: TStringField;
    qry_di_DT_RETIFICACAO: TDateTimeField;
    qry_motivo_retif_: TQuery;
    qry_motivo_retif_CD_MOTIVO_RETIF: TStringField;
    qry_motivo_retif_NM_MOTIVO_RETIF: TStringField;
    qry_di_LookMotivoRetif: TStringField;
    tbl_di_doc_instr_emb_NR_SEQUENCIA: TAutoIncField;
    tbl_di_proc_vinc_NR_SEQUENCIA: TAutoIncField;
    tbl_di_armazem_NR_SEQUENCIA: TAutoIncField;
    tbl_di_volumes_NR_SEQUENCIA: TAutoIncField;
    sp_atz_proc: TStoredProc;
    tbl_embalagens_Codigo: TStringField;
    tbl_embalagens_Descricao: TStringField;
    tbl_di_volumes_Look_Embalagem: TStringField;
    qry_di_CD_TRIBUTACAO_ICMS: TStringField;
    qry_di_CD_FUND_LEGAL_ICMS: TStringField;
    qry_tributacao_icms_: TQuery;
    qry_disp_legal_: TQuery;
    qry_disp_legal_CD_EX: TStringField;
    qry_disp_legal_NM_EX: TStringField;
    qry_tributacao_icms_CD_TRIBUTACAO_ICMS: TStringField;
    qry_tributacao_icms_NM_TRIBUTACAO_ICMS: TStringField;
    qry_di_LookFundLegalICMS: TStringField;
    qry_di_LookTributacaoICMS: TStringField;
    sp_di_repassa_dados_adicao: TStoredProc;
    sp_di_repassa_dados_cambio: TStoredProc;
    qry_di_DT_EXON_IMPRESSO: TDateTimeField;
    qry_di_IN_EXON_IMPRESSO: TStringField;
    qry_di_CD_FABRICANTE: TStringField;
    qry_di_CD_PAIS_ORIG_MERC: TStringField;
    qry_di_CD_FORNECEDOR: TStringField;
    qry_di_CD_PAIS_AQUIS_MERC: TStringField;
    qry_di_CD_AUSENCIA_FABRIC: TStringField;
    qry_emp_est_: TQuery;
    qry_emp_est_CD_EMPRESA: TStringField;
    qry_emp_est_NM_EMPRESA: TStringField;
    qry_di_LookFabricante: TStringField;
    qry_di_LookExportador: TStringField;
    qry_pais_: TQuery;
    qry_pais_CODIGO: TStringField;
    qry_pais_DESCRICAO: TStringField;
    qry_di_Look_pais_orig: TStringField;
    qry_di_Look_pais_export: TStringField;
    qry_look_agente_: TQuery;
    qry_look_agente_CD_AGENTE: TStringField;
    qry_look_agente_NM_AGENTE: TStringField;
    sp_atz_arm_di: TStoredProc;
    qry_emp_est_CD_PAIS: TStringField;
    qry_emp_estrangeira_: TQuery;
    qry_emp_estrangeira_CD_PAIS: TStringField;
    qry_di_VL_TOTAL_CAMBIO: TFloatField;
    qry_look_agente_NR_CGC_AGENTE: TStringField;
    qry_di_Look_agente_transp: TStringField;
    qry_proc_cntr_: TQuery;
    qry_proc_cntr_NR_PROCESSO: TStringField;
    qry_proc_cntr_NR_CNTR: TStringField;
    qry_proc_cntr_IN_DESOVA: TStringField;
    qry_di_Look_Recinto_Alf: TStringField;
    ds_recinto_setores_importacao: TDataSource;
    qry_recinto_setores_importacao_: TQuery;
    qry_recinto_setores_importacao_Orgao: TStringField;
    qry_recinto_setores_importacao_Recinto: TStringField;
    qry_recinto_setores_importacao_Setor: TStringField;
    qry_recinto_setores_importacao_Nome: TStringField;
    qry_di_look_setor: TStringField;
    qry_di_QT_PARC_FINANC_360: TIntegerField;
    qry_di_QT_PERIOD_PGTO_360: TIntegerField;
    qry_proc_carga_solta_: TQuery;
    qry_proc_carga_solta_NR_PROCESSO: TStringField;
    qry_proc_carga_solta_VL_QTDE: TFloatField;
    qry_proc_carga_solta_NM_ESPECIE: TStringField;
    qry_di_CD_PERIOD_PGTO_360: TStringField;
    qry_di_IN_EMBUT_FRT_ITENS: TBooleanField;
    qry_di_IN_EMBUT_SEG_ITENS: TBooleanField;
    sp_atz_evento: TStoredProc;
    qry_di_VL_TOTAL_ACRESCIMOS_MNEG: TFloatField;
    qry_di_VL_TOTAL_DEDUCOES_MNEG: TFloatField;
    qry_di_VL_TOTAL_FRETE_MNEG: TFloatField;
    sp_di_distribui_deb_com: TStoredProc;
    ds_pagto_cambio_prev: TDataSource;
    qry_pagto_cambio_prev_: TQuery;
    qry_pagto_cambio_prev_DT_PREV_PGTO_360: TStringField;
    qry_pagto_cambio_prev_VL_PREV_PGTO_360: TFloatField;
    qry_di_IN_PGTO_VARIAV_360: TBooleanField;
    qry_pagto_cambio_prev_NR_PROCESSO: TStringField;
    qry_ult_seq_: TQuery;
    qry_pagto_cambio_prev_NR_SEQUENCIA: TStringField;
    qry_ult_seq_ULTIMO: TStringField;
    qry_di_NR_DCTO_CARGA: TStringField;
    qry_di_NR_DCTO_CARGA_MAST: TStringField;
    qry_di_PC_REDUCAO_IPT_BLI: TFloatField;
    qry_di_CD_VEICULO_TRANSP: TStringField;
    qry_emb_: TQuery;
    qry_emb_CD_EMBARCACAO: TStringField;
    qry_emb_NM_EMBARCACAO: TStringField;
    qry_emb_CD_BANDEIRA: TStringField;
    qry_banco_servico_: TQuery;
    qry_banco_servico_CD_BANCO_DEB_CC: TStringField;
    qry_banco_servico_CD_BANCO_DEB_COM: TStringField;
    qry_banco_servico_CD_RESPONSAVEL: TStringField;
    qry_banco_NR_CONTA: TStringField;
    qry_banco_CD_AGENCIA: TStringField;
    qry_banco_NR_BANCO: TStringField;
    qry_transp_nac_: TQuery;
    qry_parametros_: TQuery;
    qry_parametros_PC_MAX_SEGURO_DI: TFloatField;
    qry_proc_cntr_NM_TP_CNTR: TStringField;
    qry_processo_CD_SERVICO: TStringField;
    ds_acrescimo_valoracao: TDataSource;
    qry_acrescimo_valoracao_: TQuery;
    ds_adicao_importacao: TDataSource;
    qry_adicao_importacao_: TQuery;
    qry_adicao_importacao_VL_DESPESAS_MN: TFloatField;
    qry_adicao_importacao_TX_DOLAR: TFloatField;
    qry_acrescimo_valoracao_TOTAL_VL_ACRESCIMO: TFloatField;
    ds_deducao_valoracao: TDataSource;
    qry_deducao_valoracao_: TQuery;
    qry_deducao_valoracao_VL_TOT_MOEDA: TFloatField;
    qry_deducao_valoracao_VL_TOT_REAL: TFloatField;
    qry_di_VL_TOT_PIS_COFINS: TFloatField;
    TIMP: TQuery;
    tbl_acrescimos: TTable;
    tbl_acrescimosNR_PROCESSO: TStringField;
    tbl_acrescimosCD_DESPESA: TStringField;
    tbl_acrescimosCD_MOEDA: TStringField;
    tbl_acrescimosVL_MOEDA: TFloatField;
    tbl_acrescimosTP_DESPESA: TStringField;
    tbl_acrescimosTP_BASE: TStringField;
    tbl_acrescimoslck_nm_despesa: TStringField;
    ds_acrescimos: TDataSource;
    tbl_deducoes: TTable;
    tbl_deducoesNR_PROCESSO: TStringField;
    tbl_deducoesCD_DESPESA: TStringField;
    tbl_deducoesCD_MOEDA: TStringField;
    tbl_deducoesVL_MOEDA: TFloatField;
    tbl_deducoesTP_DESPESA: TStringField;
    tbl_deducoesTP_BASE: TStringField;
    tbl_deducoeslck_nm_despesa: TStringField;
    ds_deducoes: TDataSource;
    ds_tp_acres: TDataSource;
    ds_tp_dedu: TDataSource;
    tbl_tp_dedu_: TTable;
    tbl_tp_dedu_CODIGO: TStringField;
    tbl_tp_dedu_DESCRICAO: TStringField;
    tbl_tp_dedu_DESCRICAO_REDUZIDA: TStringField;
    tbl_tp_acres_: TTable;
    tbl_tp_acres_CODIGO: TStringField;
    tbl_tp_acres_DESCRICAO: TStringField;
    tbl_tp_acres_DESCRICAO_REDUZIDA: TStringField;
    qry_ref_cliente_NR_ITEM_PO: TStringField;
    qry_di_NR_PROCESSO_SISCOMEX: TStringField;
    qry_di_DT_DI: TDateTimeField;
    qry_di_VL_TOTAL_TX_SCX: TFloatField;
    qry_di_VL_TOTAL_SEGURO_MN: TFloatField;
    tbl_di_doc_instr_emb_DT_FATURA: TDateTimeField;
    tbl_di_doc_instr_emb_CD_COND_VENDA_ENT: TStringField;
    tbl_di_doc_instr_emb_NR_DIAS: TIntegerField;
    tbl_di_doc_instr_emb_DT_VENCTO_FATURA: TDateTimeField;
    tbl_di_doc_instr_emb_DT_VENCTO_EADI: TDateTimeField;
    tbl_di_doc_instr_emb_DT_VENCTO_NAC: TDateTimeField;
    tbl_di_doc_instr_emb_IN_AVISO_EADI: TStringField;
    tbl_di_doc_instr_emb_IN_ABERTURA_PROC: TStringField;
    upd_di: TUpdateSQL;
    sp_di_atualiza_volumes: TStoredProc;
    tbl_di_darf_CALC_VL_ADM_TEMP: TFloatField;
    SP_CALCULO_SEGURO: TStoredProc;
    qryMoedasTaxas: TQuery;
    qryMoedasTaxasCD_MOEDA: TStringField;
    qryMoedasTaxasDT_CALCULO: TDateTimeField;
    qryMoedasTaxasTX_CAMBIO: TFloatField;
    qry_DE_DI: TQuery;
    qry_DE_DINR_PROCESSO: TStringField;
    qry_DE_DINR_DE_MERCOSUL: TStringField;
    qry_DE_DINR_RE_INICIAL: TStringField;
    qry_DE_DINR_RE_FINAL: TStringField;
    ds_DE_DI: TDataSource;
    upd_DE_DI: TUpdateSQL;
    qry_di_darf_: TQuery;
    qry_di_darf_NR_PROCESSO: TStringField;
    qry_di_darf_CD_RECEITA_PGTO: TStringField;
    qry_di_darf_CD_BANCO_PGTO_TRIB: TStringField;
    qry_di_darf_NR_AGENC_PGTO_TRIB: TStringField;
    qry_di_darf_VL_TRIBUTO_PAGO: TFloatField;
    qry_di_darf_DT_PGTO_TRIBUTO: TStringField;
    qry_di_darf_VL_MULTA_PGTO_TRIB: TFloatField;
    qry_di_darf_VL_JUROS_PGTO_TRIB: TFloatField;
    qry_di_darf_CALC_VL_ADM_TEMP: TFloatField;
    upd_di_darf: TUpdateSQL;
    qry_di_IN_CALCULOU_COM_AFRMM: TStringField;
    qry_di_HR_DI: TStringField;
    qry_di_HR_CALCULO: TStringField;
    qry_di_VL_TOTAL_II_SEM_SEGURO: TFloatField;
    qry_di_VL_TOTAL_IPI_SEM_SEGURO: TFloatField;
    qry_di_VL_TOT_ICMS_SEM_SEGURO: TFloatField;
    qry_di_NR_TRANSMISSAO: TStringField;
    qry_di_CD_USUARIO_TRANSMISSAO: TStringField;
    qry_di_IN_FMA: TStringField;
    qry_di_DT_PAGAMENTO_DARF: TDateTimeField;
    qry_di_TX_INFO_COMPL_AUTO: TMemoField;
    cdssp_observacoes_di_regras: TClientDataSet;
    dspsp_observacoes_di_regras: TDataSetProvider;
    sp_observacoes_di_regras: TStoredProc;
    procedure tbl_di_doc_instr_emb_AfterPost(DataSet: TDataSet);
    procedure tbl_di_proc_vinc_AfterPost(DataSet: TDataSet);
    procedure tbl_di_armazem_AfterPost(DataSet: TDataSet);
    procedure tbl_di_volumes_AfterPost(DataSet: TDataSet);
    procedure tbl_di_darf_AfterPost(DataSet: TDataSet);
    procedure tbl_di_comp_trib_AfterPost(DataSet: TDataSet);
    procedure tbl_di_volumes_QT_VOLUME_CARGAChange(Sender: TField);
    procedure ds_via_transporteDataChange(Sender: TObject; Field: TField);
    procedure qry_di_CalcFields(DataSet: TDataSet);
    procedure tbl_via_transporte_AfterOpen(DataSet: TDataSet);
    procedure tbl_via_transporte_BeforeOpen(DataSet: TDataSet);
    procedure VerificaEstado(Habilita : Boolean);
    procedure qry_di_BeforeDelete(DataSet: TDataSet);
    procedure qry_di_DT_CHEGADA_CARGAChange(Sender: TField);
    procedure qry_di_CD_LOCAL_EMBARQUEChange(Sender: TField);
    procedure qry_di_NR_DCTO_CARGAChange(Sender: TField);
    procedure qry_di_NR_DCTO_CARGA_MASTChange(Sender: TField);
    procedure qry_di_DT_EMBARQUEChange(Sender: TField);
    procedure qry_di_NM_VEICULO_TRANSPChange(Sender: TField);
    procedure tbl_di_doc_instr_emb_BeforePost(DataSet: TDataSet);
    procedure tbl_di_proc_vinc_BeforePost(DataSet: TDataSet);
    procedure tbl_di_volumes_BeforePost(DataSet: TDataSet);
    procedure tbl_di_armazem_BeforePost(DataSet: TDataSet);
    procedure tbl_di_darf_BeforePost(DataSet: TDataSet);
    procedure qry_di_IN_REBChange(Sender: TField);
    procedure qry_di_CD_PRESENCA_CARGAChange(Sender: TField);
    procedure qry_di_BeforeEdit(DataSet: TDataSet);
    procedure qry_di_BeforeInsert(DataSet: TDataSet);
    procedure qry_di_BeforePost(DataSet: TDataSet);
    procedure qry_di_IN_REPASSA_DADOS_ADICAOChange(Sender: TField);
    procedure qry_di_IN_REPASSA_DADOS_CAMBIOChange(Sender: TField);
    procedure qry_di_VL_TOT_FRT_COLLECTChange(Sender: TField);
    procedure qry_di_VL_TOT_FRT_PREPAIDChange(Sender: TField);
    procedure qry_di_VL_FRETE_TNAC_MNEGChange(Sender: TField);
    procedure qry_pagto_cambio_prev_BeforeEdit(DataSet: TDataSet);
    procedure qry_pagto_cambio_prev_BeforeInsert(DataSet: TDataSet);
    procedure qry_pagto_cambio_prev_BeforePost(DataSet: TDataSet);
    procedure qry_pagto_cambio_prev_AfterPost(DataSet: TDataSet);
    procedure qry_di_CD_VEICULO_TRANSPChange(Sender: TField);
    procedure qry_di_AfterScroll(DataSet: TDataSet);
    procedure qry_di_CD_TRANSPORTADORChange(Sender: TField);
    procedure tbl_deducoesAfterInsert(DataSet: TDataSet);
    procedure tbl_acrescimosAfterInsert(DataSet: TDataSet);
    procedure tbl_acrescimosPostError(DataSet: TDataSet; E: EDatabaseError;
      var Action: TDataAction);
    procedure tbl_deducoesPostError(DataSet: TDataSet; E: EDatabaseError;
      var Action: TDataAction);
    procedure qry_di_AfterPost(DataSet: TDataSet);
    procedure tbl_di_darf_CalcFields(DataSet: TDataSet);
    procedure qry_DE_DINewRecord(DataSet: TDataSet);
    procedure qry_DE_DIAfterPost(DataSet: TDataSet);
    procedure qry_di_darf_CalcFields(DataSet: TDataSet);
    procedure qry_di_darf_AfterPost(DataSet: TDataSet);
    procedure qry_di_IN_FMAChange(Sender: TField);
    procedure qry_di_darf_BeforePost(DataSet: TDataSet);
  private
    function CalculaValorMoeda(pMoeda, pDataCalculo: String): Real;
    { Private declarations }
  public
    function InsereRateio(pTipoOperacao, pAdicao, pDataCalculo, pMoedaAdicao : String; pValor_Peso : Real) : Boolean;
    function RateioAcreDeduc: Boolean;
  end;

var
  datm_DI_Capa: Tdatm_DI_Capa;
  str_sequencia : String[2];

implementation

uses GSMLIB, PGGP001, PGGP017, PGDI001, PGDI003, ConsOnLineEx, PGCH009;

{$R *.DFM}

procedure Tdatm_DI_Capa.tbl_di_doc_instr_emb_AfterPost(DataSet: TDataSet);
begin
  with frm_DI_Capa do
  begin
    str_hist_fatura := '';
    tbl_di_doc_instr_emb_.First;
    while not (tbl_di_doc_instr_emb_.EOF) do
    begin
      if tbl_di_doc_instr_emb_CD_TIPO_DCTO_INSTR.AsString = '01' then
      begin
         if str_hist_fatura <> '' then str_hist_fatura := str_hist_fatura + ', ';
         str_hist_fatura := str_hist_fatura + tbl_di_doc_instr_emb_NR_DCTO_INSTRUCAO.AsString;
      end;
      tbl_di_doc_instr_emb_.Next;
    end;
    if Not ( qry_di_.State in [dsInsert, dsEdit] ) then qry_di_.Edit;
    Atualiza_Historico_Padrao_novo;
  end;
  DataSet.Refresh;
end;

procedure Tdatm_DI_Capa.tbl_di_proc_vinc_AfterPost(DataSet: TDataSet);
begin
  DataSet.Refresh;
end;

procedure Tdatm_DI_Capa.tbl_di_armazem_AfterPost(DataSet: TDataSet);
begin
  DataSet.Refresh;
end;

procedure Tdatm_DI_Capa.tbl_di_volumes_AfterPost(DataSet: TDataSet);
begin
  DataSet.Refresh;
end;

procedure Tdatm_DI_Capa.tbl_di_darf_AfterPost(DataSet: TDataSet);
begin
  DataSet.Refresh;
end;

procedure Tdatm_DI_Capa.tbl_di_comp_trib_AfterPost(DataSet: TDataSet);
begin
  DataSet.Refresh;
end;

procedure Tdatm_DI_Capa.tbl_di_volumes_QT_VOLUME_CARGAChange(
  Sender: TField);
begin
  if frm_di_capa = nil then
    Exit;

  if (datm_DI_Capa.tbl_di_volumes_QT_VOLUME_CARGA.AsString <>
      trim(datm_DI_Capa.tbl_di_volumes_QT_VOLUME_CARGA.AsString)) then
      datm_DI_Capa.tbl_di_volumes_QT_VOLUME_CARGA.AsString :=
        trim(datm_DI_Capa.tbl_di_volumes_QT_VOLUME_CARGA.AsString);
end;

procedure Tdatm_DI_Capa.ds_via_transporteDataChange(Sender: TObject; Field: TField);
var
 cd_via_transp_old : Byte;
begin
  if frm_di_capa = nil then
    Exit;

  with frm_DI_capa do
  begin
    if ( ( pgctrl_capa_di.ActivePage = tbsht_Transporte_aereo )          or
         ( pgctrl_capa_di.ActivePage = tbsht_Transporte_Ferroviario )    or
         ( pgctrl_capa_di.ActivePage = tbsht_Transporte_Fluvial )        or
         ( pgctrl_capa_di.ActivePage = tbsht_Transporte_Lacustre )       or
         ( pgctrl_capa_di.ActivePage = tbsht_Transporte_Maritimo )       or
         ( pgctrl_capa_di.ActivePage = tbsht_Transporte_Meios_Proprios ) or
         ( pgctrl_capa_di.ActivePage = tbsht_Transporte_Postal )         or
         ( pgctrl_capa_di.ActivePage = tbsht_Transporte_Rodoviario )     or
         ( pgctrl_capa_di.ActivePage = tbsht_Transporte_Tubo_Coduto ) )  and
       ( Not (in_calculo) ) and
       ( Not (in_abrindo_via) ) then
    begin
      frm_DI_capa.LimpaChecks;
      cd_via_transp_old := i_cod_via_transp;
      Val(tbl_via_transporte_CD_VIA_TRANSPORTE.AsString, i_cod_via_transp, Code);
      if ( cd_via_transp_old <> i_cod_via_transp ) then
      begin
        qry_di_.Close;
        try
          datm_main.db_broker.StartTransaction;
          CloseStoredProc(sp_di_atz_via_transp);
          sp_di_atz_via_transp.ParamByName('@NR_PROCESSO').AsString    := str_nr_processo;
          sp_di_atz_via_transp.ParamByName('@CD_VIA_TRANSP').AsInteger := i_cod_via_transp;
          ExecStoredProc(sp_di_atz_via_transp);
          CloseStoredProc(sp_di_atz_via_transp);
          datm_main.db_broker.Commit;
        except
          on E: Exception do
          begin
            if datm_main.db_broker.InTransaction then datm_main.db_broker.Rollback;
            TrataErro(E);
          end;
        end;

        if in_DI_Registrada then qry_di_.RequestLive := False;
        qry_di_.Close;
        qry_di_.ParamByName('NR_PROCESSO').AsString := str_nr_processo;
        qry_di_.Prepare;
        qry_di_.Open;
        if Not ( qry_di_.State in [dsEdit, dsInsert] ) then qry_di_.Edit;
        if i_cod_via_transp = 1 then
          frm_DI_capa.dbchkbox_REB.Visible := True
        else
          frm_DI_capa.dbchkbox_REB.Visible := False;
      end;
      ReadUpdateWindow_CD_Via_Transporte;
    end
    else
    begin
      Exit;
    end;
  end;
end;

procedure Tdatm_DI_Capa.qry_di_CalcFields(DataSet: TDataSet);
begin
  if frm_di_capa = nil then
    Exit;

  if (qry_di_VL_TOT_SEGURO_MNEG.AsFloat > 0) and
     (qry_di_CD_MOEDA_SEGURO.AsString <> '') then
     qry_di_Calc_VL_TOT_SEGURO_MN.AsFloat :=
     Arredondar( qry_di_VL_TOT_SEGURO_MNEG.AsFloat * qry_di_TX_SEGURO.AsFloat , 2 )
  else
    qry_di_Calc_VL_TOT_SEGURO_MN.AsFloat := 0;

  qry_di_Calc_TOT_FRETE_MNEG.AsFloat := qry_di_VL_TOT_FRT_PREPAID.AsFloat +
                                        qry_di_VL_TOT_FRT_COLLECT.AsFloat -
                                        qry_di_VL_FRETE_TNAC_MNEG.AsFloat;

  if (qry_di_Calc_TOT_FRETE_MNEG.AsFloat > 0) and
     (qry_di_CD_MOEDA_FRETE.AsString <> '') then
     qry_di_Calc_VL_TOT_FRETE_MN.AsFloat :=
     Arredondar( qry_di_Calc_TOT_FRETE_MNEG.AsFloat * qry_di_TX_FRETE.AsFloat, 2 )
  else
     qry_di_Calc_VL_TOT_FRETE_MN.AsFloat := 0;

  if (qry_di_IN_MOEDA_UNICA.AsBoolean ) and
     (qry_di_VL_TOT_MLE_MNEG.AsFloat > 0) and
     (qry_di_CD_MOEDA_MLE.AsString <> '') then
     qry_di_Calc_VL_TOT_MLE_MN.AsFloat :=
     Arredondar( qry_di_VL_TOT_MLE_MNEG.AsFloat * qry_di_TX_MLE.AsFloat, 2 )
  else
     qry_di_Calc_VL_TOT_MLE_MN.AsFloat := 0;

  if (qry_di_IN_MOEDA_UNICA.AsBoolean) and
     (qry_di_VL_TOT_DESPS_MNEG.AsFloat > 0) and
     (qry_di_CD_MOEDA_MLE.AsString <> '') then
     qry_di_Calc_VL_TOT_DESPESA_MN.AsFloat :=
     Arredondar( qry_di_VL_TOT_DESPS_MNEG.AsFloat * qry_di_TX_MLE.AsFloat, 2 )
  else
     qry_di_Calc_VL_TOT_DESPESA_MN.AsFloat := 0;

  if not qry_recinto_setores_importacao_.Active then
    qry_recinto_setores_importacao_.Open;
  if qry_recinto_setores_importacao_.Locate( 'Orgao;Recinto;Setor',
     VarArrayOf ( [qry_di_CD_URF_DESPACHO.AsString, qry_di_CD_RECINTO_ALFAND.AsString, qry_di_CD_SETOR_ARMAZENAM.AsString ] ), [loCaseInsensitive]) then
  begin
    qry_di_look_setor.AsString := qry_recinto_setores_importacao_Nome.AsString;
  end;

end;

procedure Tdatm_DI_Capa.tbl_via_transporte_AfterOpen(DataSet: TDataSet);
begin
  frm_DI_capa.in_abrindo_via := False;
  frm_DI_capa.Via_de_Transporte;
end;

procedure Tdatm_DI_Capa.tbl_via_transporte_BeforeOpen(DataSet: TDataSet);
begin
  frm_DI_capa.in_abrindo_via := True;
end;

procedure Tdatm_DI_Capa.VerificaEstado(Habilita : Boolean);
begin
  frm_DI_capa.btn_salvar.Enabled       := Habilita;
  frm_DI_capa.btn_cancelar.Enabled     := Habilita;
  frm_DI_capa.mi_salvar.Enabled        := Habilita;
  frm_DI_capa.mi_cancelar.Enabled      := Habilita;
end;

procedure Tdatm_DI_Capa.qry_di_BeforeDelete(DataSet: TDataSet);
begin
  if Not BoxMensagem('Confirma exclusão?', 1) then Abort;
end;

procedure Tdatm_DI_Capa.qry_di_DT_CHEGADA_CARGAChange(Sender: TField);
begin
  if frm_di_capa = nil then
    Exit;

(* comentado André 20/06/2008  if ( frm_DI_capa.dbedt_cd_tipo_declaracao.Text <> '13' ) and
     ( frm_DI_capa.dbedt_cd_tipo_declaracao.Text <> '14' ) and
     ( frm_DI_capa.dbedt_cd_tipo_declaracao.Text <> '15' ) then
     frm_DI_capa.str_hist_dt_cheg := Copy( qry_di_DT_CHEGADA_CARGA.AsString, 1, 2 ) + '/' +
                                     Copy( qry_di_DT_CHEGADA_CARGA.AsString, 3, 2 ) + '/' +
                                     Copy( qry_di_DT_CHEGADA_CARGA.AsString, 5, 4 )
   else
     frm_DI_capa.str_hist_dt_cheg := '';
  frm_DI_capa.Atualiza_Historico_Padrao;*)
  // Realizar evento Chegada da Mercadoria
  CloseStoredProc(sp_atz_evento);
  sp_atz_evento.ParamByName('@NR_PROCESSO').AsString     := str_nr_processo;
  sp_atz_evento.ParamByName('@CD_EVENTO_TXT').AsString   := 'CD_EV_CHEGADA';
  sp_atz_evento.ParamByName('@DT_REALIZACAO').AsDateTime :=
     StrToDate( Copy( qry_di_DT_CHEGADA_CARGA.AsString, 1, 2 ) + '/' +
                Copy( qry_di_DT_CHEGADA_CARGA.AsString, 3, 2 ) + '/' +
                Copy( qry_di_DT_CHEGADA_CARGA.AsString, 5, 4 ) );
  ExecStoredProc(sp_atz_evento);
  CloseStoredProc(sp_atz_evento);

end;

procedure Tdatm_DI_Capa.qry_di_CD_LOCAL_EMBARQUEChange(Sender: TField);
begin
  if frm_di_capa = nil then
    Exit;

  frm_DI_capa.str_hist_loc_emb := qry_di_Look_local_Embarque.AsString;
  frm_DI_capa.Atualiza_Historico_Padrao_novo;
end;

procedure Tdatm_DI_Capa.qry_di_NR_DCTO_CARGAChange(Sender: TField);
begin
  if frm_di_capa = nil then
    Exit;

  if qry_di_CD_VIA_TRANSP_CARG.AsString = '07' then // Rodoviário
     frm_DI_capa.str_hist_conh := Copy( qry_di_NR_DCTO_CARGA.AsString, 1, 2 ) + '-' +
                                  Copy( qry_di_NR_DCTO_CARGA.AsString, 3, 10 )
  else
     frm_DI_capa.str_hist_conh := qry_di_NR_DCTO_CARGA.AsString;
  frm_DI_capa.Atualiza_Historico_Padrao_novo;
end;

procedure Tdatm_DI_Capa.qry_di_NR_DCTO_CARGA_MASTChange(Sender: TField);
begin
  if frm_di_capa = nil then
    Exit;

  frm_DI_capa.str_hist_conh_m := qry_di_NR_DCTO_CARGA_MAST.AsString;
  frm_DI_capa.Atualiza_Historico_Padrao_novo;
end;

procedure Tdatm_DI_Capa.qry_di_DT_EMBARQUEChange(Sender: TField);
begin
  if frm_di_capa = nil then
    Exit;

  frm_DI_capa.str_hist_dt_emb  := Copy( datm_DI_Capa.qry_di_DT_EMBARQUE.AsString, 1, 2) + '/' +
                                  Copy( datm_DI_Capa.qry_di_DT_EMBARQUE.AsString, 3, 2) + '/' +
                                  Copy( datm_DI_Capa.qry_di_DT_EMBARQUE.AsString, 5, 4);
  frm_DI_capa.Atualiza_Historico_Padrao_novo;
end;

procedure Tdatm_DI_Capa.qry_di_NM_VEICULO_TRANSPChange(Sender: TField);
begin
  if frm_di_capa = nil then
    Exit;

  frm_DI_capa.str_hist_veiculo := qry_di_NM_VEICULO_TRANSP.AsString;
  frm_DI_capa.Atualiza_Historico_Padrao_novo;
end;

procedure Tdatm_DI_Capa.tbl_di_doc_instr_emb_BeforePost(DataSet: TDataSet);
begin
  if tbl_di_doc_instr_emb_CD_TIPO_DCTO_INSTR.AsString = '' then
  begin
    BoxMensagem('Informe a denominação do documento!', 2);
    Abort;
  end;
  if tbl_di_doc_instr_emb_.State in [dsInsert] then
     tbl_di_doc_instr_emb_NR_SEQUENCIA.AsInteger :=
        Sequencia( '2', tbl_di_doc_instr_emb_NR_PROCESSO.AsString );
end;

procedure Tdatm_DI_Capa.tbl_di_proc_vinc_BeforePost(DataSet: TDataSet);
begin
  if tbl_di_proc_vinc_CD_TIPO_PROCESSO.AsString = '' then
  begin
    BoxMensagem('Informe o tipo do processo!', 2);
    Abort;
  end;
  if tbl_di_proc_vinc_.State in [dsInsert] then
     tbl_di_proc_vinc_NR_SEQUENCIA.AsInteger :=
        Sequencia( '4', tbl_di_proc_vinc_NR_PROCESSO.AsString );
end;

procedure Tdatm_DI_Capa.tbl_di_volumes_BeforePost(DataSet: TDataSet);
begin
  if tbl_di_volumes_CD_TIPO_EMBALAGEM.AsString = '' then
  begin
    BoxMensagem('Informe a embalagem do volume!', 2);
    Abort;
  end;
  if tbl_di_volumes_.State in [dsInsert] then
     tbl_di_volumes_NR_SEQUENCIA.AsInteger :=
        Sequencia( '3', tbl_di_volumes_NR_PROCESSO.AsString );
end;

procedure Tdatm_DI_Capa.tbl_di_armazem_BeforePost(DataSet: TDataSet);
begin
  if tbl_di_armazem_NM_ARMAZEM_CARGA.AsString = '' then
  begin
    BoxMensagem('Informe armazem!', 2);
    Abort;
  end;
  if tbl_di_armazem_.State in [dsInsert] then
     tbl_di_armazem_NR_SEQUENCIA.AsInteger :=
        Sequencia( '1', tbl_di_armazem_NR_PROCESSO.AsString );
end;

procedure Tdatm_DI_Capa.tbl_di_darf_BeforePost(DataSet: TDataSet);
begin
  if tbl_di_darf_CD_RECEITA_PGTO.AsString = '' then
  begin
    BoxMensagem('Informe a receita do débito em conta!', 2);
    Abort;
  end;
end;

procedure Tdatm_DI_Capa.qry_di_IN_REBChange(Sender: TField);
begin
  if frm_di_capa = nil then
    Exit;

  BoxMensagem('Recalcule o processo!', 3);
end;

procedure Tdatm_DI_Capa.qry_di_CD_PRESENCA_CARGAChange(Sender: TField);
begin
  if frm_di_capa = nil then
    Exit;

  frm_DI_capa.str_hist_pcarga := qry_di_CD_PRESENCA_CARGA.AsString;
  frm_DI_capa.Atualiza_Historico_Padrao_novo;
end;

procedure Tdatm_DI_Capa.qry_di_BeforeEdit(DataSet: TDataSet);
begin
  VerificaEstado(True);
end;

procedure Tdatm_DI_Capa.qry_di_BeforeInsert(DataSet: TDataSet);
begin
  VerificaEstado(True);
end;

procedure Tdatm_DI_Capa.qry_di_BeforePost(DataSet: TDataSet);
begin
  qry_di_VL_TOT_MLE_MNEG.AsFloat    := Arredondar( qry_di_VL_TOT_MLE_MNEG.AsFloat, 2);
  qry_di_VL_TOT_DESPS_MNEG.AsFloat  := Arredondar( qry_di_VL_TOT_DESPS_MNEG.AsFloat, 2);
  qry_di_VL_FRETE_TNAC_MNEG.AsFloat := Arredondar( qry_di_VL_FRETE_TNAC_MNEG.AsFloat, 2);
  qry_di_VL_TOT_FRT_COLLECT.AsFloat := Arredondar( qry_di_VL_TOT_FRT_COLLECT.AsFloat, 2);
  qry_di_VL_TOT_FRT_PREPAID.AsFloat := Arredondar( qry_di_VL_TOT_FRT_PREPAID.AsFloat, 2);
  qry_di_VL_TOT_SEGURO_MNEG.AsFloat := Arredondar( qry_di_VL_TOT_SEGURO_MNEG.AsFloat, 2);
  qry_di_VL_TOTAL_MLE_MN.AsFloat    := Arredondar( qry_di_VL_TOTAL_MLE_MN.AsFloat, 2);
  qry_di_VL_TOT_DESPS_MN.AsFloat    := Arredondar( qry_di_VL_TOT_DESPS_MN.AsFloat, 2);
end;

procedure Tdatm_DI_Capa.qry_di_IN_REPASSA_DADOS_ADICAOChange(
  Sender: TField);
begin
  if frm_di_capa = nil then
    Exit;

  with frm_DI_capa do
  begin
    if qry_di_IN_REPASSA_DADOS_ADICAO.AsBoolean then
    begin
      in_repassa_dados_adicao := True;
    end
    else
    begin
      in_repassa_dados_adicao := False;
    end;
  end;
end;

procedure Tdatm_DI_Capa.qry_di_IN_REPASSA_DADOS_CAMBIOChange(
  Sender: TField);
begin
  if frm_di_capa = nil then
    Exit;

  with frm_DI_capa do
  begin
    if qry_di_IN_REPASSA_DADOS_CAMBIO.AsBoolean then
    begin
      in_repassa_dados_cambio := True;
    end
    else
    begin
      in_repassa_dados_cambio := False;
    end;
  end;
end;

procedure Tdatm_DI_Capa.qry_di_VL_TOT_FRT_COLLECTChange(Sender: TField);
begin
  if frm_di_capa = nil then
    Exit;

  qry_di_VL_TOTAL_FRETE_MNEG.AsFloat := qry_di_VL_TOT_FRT_PREPAID.AsFloat +
                                        qry_di_VL_TOT_FRT_COLLECT.AsFloat -
                                        qry_di_VL_FRETE_TNAC_MNEG.AsFloat;
end;

procedure Tdatm_DI_Capa.qry_di_VL_TOT_FRT_PREPAIDChange(Sender: TField);
begin
  if frm_di_capa = nil then
    Exit;

  qry_di_VL_TOTAL_FRETE_MNEG.AsFloat := qry_di_VL_TOT_FRT_PREPAID.AsFloat +
                                        qry_di_VL_TOT_FRT_COLLECT.AsFloat -
                                        qry_di_VL_FRETE_TNAC_MNEG.AsFloat;
end;

procedure Tdatm_DI_Capa.qry_di_VL_FRETE_TNAC_MNEGChange(Sender: TField);
begin
  if frm_di_capa = nil then
    Exit;

  qry_di_VL_TOTAL_FRETE_MNEG.AsFloat := qry_di_VL_TOT_FRT_PREPAID.AsFloat +
                                        qry_di_VL_TOT_FRT_COLLECT.AsFloat -
                                        qry_di_VL_FRETE_TNAC_MNEG.AsFloat;
end;


procedure Tdatm_DI_Capa.qry_pagto_cambio_prev_BeforeEdit(
  DataSet: TDataSet);
begin
  frm_DI_capa.in_repassa_dados_cambio := True;
  if not (qry_di_.State in [dsEdit, dsInsert]) then
     qry_di_.edit;
  VerificaEstado(True);
end;

procedure Tdatm_DI_Capa.qry_pagto_cambio_prev_BeforeInsert(
  DataSet: TDataSet);
begin
  frm_DI_capa.in_repassa_dados_cambio := True;
  if not (qry_di_.State in [dsEdit, dsInsert]) then
     qry_di_.edit;

  VerificaEstado(True);
end;

procedure Tdatm_DI_Capa.qry_pagto_cambio_prev_BeforePost(
  DataSet: TDataSet);
begin
  qry_pagto_cambio_prev_NR_PROCESSO.AsString := qry_di_NR_PROCESSO.AsString;
  qry_pagto_cambio_prev_VL_PREV_PGTO_360.AsFloat := Arredondar( qry_pagto_cambio_prev_VL_PREV_PGTO_360.AsFloat, 2);

  if qry_pagto_cambio_prev_.State in [dsInsert] then
     qry_pagto_cambio_prev_NR_SEQUENCIA.AsString := UltCod( qry_ult_seq_, qry_ult_seq_ULTIMO );

end;

procedure Tdatm_DI_Capa.qry_pagto_cambio_prev_AfterPost(DataSet: TDataSet);
begin
  qry_pagto_cambio_prev_.Close;
  qry_pagto_cambio_prev_.ParamByName('NR_PROCESSO').AsString := str_nr_processo;
  qry_pagto_cambio_prev_.Prepare;
  qry_pagto_cambio_prev_.Open;
end;

procedure Tdatm_DI_Capa.qry_di_CD_VEICULO_TRANSPChange(Sender: TField);
begin
  if frm_di_capa = nil then
    Exit;

  if qry_di_CD_VIA_TRANSP_CARG.AsString <> '01' then Exit;
  if Not ( qry_di_.State in [dsInsert, dsEdit] ) then qry_di_.Edit;
  qry_emb_.Close;
  qry_emb_.ParamByName('CD_EMBARCACAO').AsString := qry_di_CD_VEICULO_TRANSP.AsString;
  qry_emb_.Prepare;
  qry_emb_.Open;
  if qry_emb_.RecordCount > 0 then
  begin
    qry_di_NM_VEICULO_TRANSP.AsString  := qry_emb_NM_EMBARCACAO.AsString;
//    qry_di_CD_BANDEIRA_TRANSP.AsString := qry_emb_CD_BANDEIRA.AsString;
  end
  else
  begin
    qry_di_NM_VEICULO_TRANSP.AsString  := '';
  end;
  qry_emb_.Close;
end;

procedure Tdatm_DI_Capa.qry_di_AfterScroll(DataSet: TDataSet);
begin
  if frm_di_capa = nil then
    Exit;

  if qry_di_CD_VIA_TRANSP_CARG.AsString = '04' then
  begin
    if qry_di_CD_TIPO_MANIFESTO.AsString = '2' then
       qry_di_NR_MANIFESTO.EditMask := '99999999-9;0; '
    else
       qry_di_NR_MANIFESTO.EditMask := '';
  end;
end;

procedure Tdatm_DI_Capa.qry_di_CD_TRANSPORTADORChange(Sender: TField);
begin
  if frm_di_capa = nil then
    Exit;

  qry_di_CD_BANDEIRA_TRANSP.AsString := qry_di_Look_Band_cad_Transp.AsString;
end;

procedure Tdatm_DI_Capa.tbl_deducoesAfterInsert(DataSet: TDataSet);
begin
  tbl_deducoes.FieldByName('TP_DESPESA').AsString  := 'D';
end;

procedure Tdatm_DI_Capa.tbl_acrescimosAfterInsert(DataSet: TDataSet);
begin
  tbl_acrescimos.FieldByName('TP_DESPESA').AsString  := 'A';
end;

procedure Tdatm_DI_Capa.tbl_acrescimosPostError(DataSet: TDataSet;
  E: EDatabaseError; var Action: TDataAction);
begin
  TrataErro(E);  //Rodrigo Capra 26/11/2007
  Action := daAbort;
  tbl_acrescimos.Cancel;
end;

procedure Tdatm_DI_Capa.tbl_deducoesPostError(DataSet: TDataSet;
  E: EDatabaseError; var Action: TDataAction);
begin
  Action := daAbort;
  tbl_deducoes.Cancel;
end;

Function Tdatm_DI_Capa.RateioAcreDeduc : Boolean;
var
  X, vSomaX, vValorTotalAdicao, vPesoTotalAdicao, vAcrescimo, vDeducao, vAdicao,
  vAcrescimoMN, vDeducaoMN, y : Real;
  vDataCalculoDI : String;
  i : integer;
begin
  {Nova rotina de data de cálculo}
  Application.CreateForm( Tfrm_sel_data, frm_sel_data);
  frm_sel_data.str_cd_relatorio := '16';
  frm_sel_data.nr_proc_di       := str_nr_processo;
  Result := frm_sel_data.ShowModal = mrOk;
end;

function Tdatm_DI_Capa.InsereRateio(pTipoOperacao, pAdicao, pDataCalculo, pMoedaAdicao : String; pValor_Peso : Real) : Boolean;
begin
  with TQuery.Create(Application) do
  begin
    DatabaseName := 'DBBROKER';
    SQL.Clear;
    if pTipoOperacao = 'A' then
    begin
      SQL.ADD('INSERT INTO TACRESCIMO_VALORACAO (NR_PROCESSO, NR_ADICAO, CD_MET_ACRES_VALOR, VL_ACRESCIMO_MOEDA, CD_MD_NEGOC_ACRES, VL_ACRESCIMO_MN)');
      SQL.ADD('VALUES (:NR_PROCESSO, :NR_ADICAO, :CD_MET_ACRES_VALOR, :VL_ACRESCIMO_MOEDA, :CD_MD_NEGOC_ACRES, :VL_ACRESCIMO_MN)');
      ParamByName('NR_PROCESSO').AsString        := qry_di_.FieldByName('NR_PROCESSO').AsString;
      ParamByName('NR_ADICAO').AsString          := pAdicao;
      ParamByName('CD_MET_ACRES_VALOR').AsString := tbl_acrescimos.FieldByName('CD_DESPESA').AsString;
      ParamByName('VL_ACRESCIMO_MOEDA').AsFloat  := pValor_Peso;
      if qry_di_.FieldByName('CD_MOEDA_MLE').AsString <> '' then
      begin
        ParamByName('CD_MD_NEGOC_ACRES').AsString  := qry_di_.FieldByName('CD_MOEDA_MLE').AsString; //tbl_acrescimos.FieldByName('CD_MOEDA').AsString;
        ParamByName('VL_ACRESCIMO_MN').AsFloat     := pValor_Peso * CalculaValorMoeda(qry_di_.FieldByName('CD_MOEDA_MLE').AsString, pDataCalculo);
      end else begin
        ParamByName('CD_MD_NEGOC_ACRES').AsString  := pMoedaAdicao; //tbl_acrescimos.FieldByName('CD_MOEDA').AsString;
        ParamByName('VL_ACRESCIMO_MN').AsFloat     := pValor_Peso * CalculaValorMoeda(pMoedaAdicao, pDataCalculo);
      end;
    end
    else if pTipoOperacao = 'D' then
    begin
      SQL.ADD('INSERT INTO TDEDUCAO_VALORACAO (NR_PROCESSO, NR_ADICAO, CD_MET_DEDUC_VALOR, VL_DEDUCAO_MNEG, CD_MD_NEGOC_DEDUC, VL_DEDUCAO_MN)');
      SQL.ADD('VALUES (:NR_PROCESSO, :NR_ADICAO, :CD_MET_DEDUC_VALOR, :VL_DEDUCAO_MNEG, :CD_MD_NEGOC_DEDUC, :VL_DEDUCAO_MN)');
      ParamByName('NR_PROCESSO').AsString        := qry_di_.FieldByName('NR_PROCESSO').AsString;
      ParamByName('NR_ADICAO').AsString          := pAdicao;
      ParamByName('CD_MET_DEDUC_VALOR').AsString := tbl_deducoes.FieldByName('CD_DESPESA').AsString;
      ParamByName('VL_DEDUCAO_MNEG').AsFloat     := pValor_Peso;
      if qry_di_.FieldByName('CD_MOEDA_MLE').AsString <> '' then
      begin
        ParamByName('CD_MD_NEGOC_DEDUC').AsString  := qry_di_.FieldByName('CD_MOEDA_MLE').AsString; //tbl_deducoes.FieldByName('CD_MOEDA').AsString;
        ParamByName('VL_DEDUCAO_MN').AsFloat       := pValor_Peso * CalculaValorMoeda(qry_di_.FieldByName('CD_MOEDA_MLE').AsString, pDataCalculo);
      end else begin
        ParamByName('CD_MD_NEGOC_ACRES').AsString  := pMoedaAdicao; //tbl_acrescimos.FieldByName('CD_MOEDA').AsString;
        ParamByName('VL_ACRESCIMO_MN').AsFloat     := pValor_Peso * CalculaValorMoeda(pMoedaAdicao, pDataCalculo);
      end;
    end;
    ExecSQL;
    Free;
  end;
end;
                                                                             
function Tdatm_DI_Capa.CalculaValorMoeda(pMoeda : String; pDataCalculo : String) : Real;
begin
  Result := 0;
  with TQuery.Create(application) do
  begin
    DatabaseName := 'DBBROKER';
    SQL.Clear;
    SQL.Add('SELECT TX_CAMBIO');
    SQL.Add('FROM TTAXA_CAMBIO (nolock)');
    SQL.Add('WHERE CD_MOEDA = ''' + pMoeda + '''');
    SQL.Add(' AND (DT_INICIO_VIGENCIA <= CONVERT(DATETIME, ''' + pDataCalculo + ''', 103) AND DT_TERMINO_VIGENCIA >= CONVERT(DATETIME, ''' + pDataCalculo + ''', 103))');
    open;
    if IsEmpty then
    begin
      close;
      SQL.Clear;
      SQL.Add('SELECT TOP 1 dt_inicio_vigencia, TX_CAMBIO FROM TTAXA_CAMBIO (nolock) WHERE CD_MOEDA = ''' + pMoeda + '''');
      SQL.Add('order by dt_inicio_vigencia desc');
      open;
    end;
    Result := FieldByName('TX_CAMBIO').AsFloat;
    Free;
  end;
end;

procedure Tdatm_DI_Capa.qry_di_AfterPost(DataSet: TDataSet);
begin
  qry_di_.ApplyUpdates;
end;

procedure Tdatm_DI_Capa.tbl_di_darf_CalcFields(DataSet: TDataSet);
begin
{5602 - PIS
 5629 - COFINS
 1038 - IPI
 0086 - II}
  if tbl_di_darf_CD_RECEITA_PGTO.AsString = '5602' then
    tbl_di_darf_CALC_VL_ADM_TEMP.AsFloat := StrToFloat(ConsultaLookUPSQL(' SELECT ISNULL(SUM(ISNULL(VL_PIS, 0)), 0) AS VL_PIS ' +
                                                                         ' FROM TADICAO_DE_IMPORTACAO ' +
                                                                         ' WHERE NR_PROCESSO = ' + QuotedStr(tbl_di_darf_NR_PROCESSO.AsString) +
                                                                         '   AND CD_REGIME_TRIBUTAR = ''5'' ' +
                                                                         '   AND CD_FUND_LEG_REGIME = ''37''', 'VL_PIS'))
  else if tbl_di_darf_CD_RECEITA_PGTO.AsString = '5629' then
    tbl_di_darf_CALC_VL_ADM_TEMP.AsFloat := StrToFloat(ConsultaLookUPSQL(' SELECT ISNULL(SUM(ISNULL(VL_COFINS, 0)), 0) AS VL_COFINS ' +
                                                                         ' FROM TADICAO_DE_IMPORTACAO ' +
                                                                         ' WHERE NR_PROCESSO = ' + QuotedStr(tbl_di_darf_NR_PROCESSO.AsString) +
                                                                         '   AND CD_REGIME_TRIBUTAR = ''5'' ' +
                                                                         '   AND CD_FUND_LEG_REGIME = ''37''', 'VL_COFINS'))
  else if tbl_di_darf_CD_RECEITA_PGTO.AsString = '1038' then
    tbl_di_darf_CALC_VL_ADM_TEMP.AsFloat := StrToFloat(ConsultaLookUPSQL(' SELECT ISNULL(SUM(ISNULL(TR.VL_IPT_A_RECOLHER, 0)), 0) AS VL_IPI ' +
                                                                         ' FROM TADICAO_DE_IMPORTACAO AI LEFT JOIN TRIBUTO TR ON TR.NR_PROCESSO = AI.NR_PROCESSO ' +
                                                                         '                                                   AND TR.NR_ADICAO   = AI.NR_ADICAO ' +
                                                                         ' WHERE AI.NR_PROCESSO = ' + QuotedStr(tbl_di_darf_NR_PROCESSO.AsString) +
                                                                         '   AND AI.CD_REGIME_TRIBUTAR = ''5'' ' +
                                                                         '   AND AI.CD_FUND_LEG_REGIME = ''37'' ' +
                                                                         '   AND TR.CD_RECEITA_IMPOSTO = ''0002''', 'VL_IPI'))
  else if tbl_di_darf_CD_RECEITA_PGTO.AsString = '0086' then
    tbl_di_darf_CALC_VL_ADM_TEMP.AsFloat := StrToFloat(ConsultaLookUPSQL(' SELECT ISNULL(SUM(ISNULL(TR.VL_IPT_A_RECOLHER, 0)), 0) AS VL_II ' +
                                                                         ' FROM TADICAO_DE_IMPORTACAO AI LEFT JOIN TRIBUTO TR ON TR.NR_PROCESSO = AI.NR_PROCESSO ' +
                                                                         '                                                   AND TR.NR_ADICAO   = AI.NR_ADICAO ' +
                                                                         ' WHERE AI.NR_PROCESSO = ' + QuotedStr(tbl_di_darf_NR_PROCESSO.AsString) +
                                                                         '   AND AI.CD_REGIME_TRIBUTAR = ''5'' ' +
                                                                         '   AND AI.CD_FUND_LEG_REGIME = ''37'' ' +
                                                                         '   AND TR.CD_RECEITA_IMPOSTO = ''0001''', 'VL_II'))
  else
    tbl_di_darf_CALC_VL_ADM_TEMP.AsFloat := 0;
end;

procedure Tdatm_DI_Capa.qry_DE_DINewRecord(DataSet: TDataSet);
begin
  qry_DE_DINR_PROCESSO.AsString := qry_di_NR_PROCESSO.AsString;
end;

procedure Tdatm_DI_Capa.qry_DE_DIAfterPost(DataSet: TDataSet);
begin
  qry_DE_DI.ApplyUpdates;
end;

procedure Tdatm_DI_Capa.qry_di_darf_CalcFields(DataSet: TDataSet);
begin
  if qry_di_darf_CD_RECEITA_PGTO.AsString = '5602' then
    qry_di_darf_CALC_VL_ADM_TEMP.AsFloat := StrToFloat(ConsultaLookUPSQL(' SELECT ISNULL(SUM(ISNULL(VL_PIS, 0)), 0) AS VL_PIS ' +
                                                                         ' FROM TADICAO_DE_IMPORTACAO ' +
                                                                         ' WHERE NR_PROCESSO = ' + QuotedStr(qry_di_darf_NR_PROCESSO.AsString) +
                                                                         '   AND CD_REGIME_TRIBUTAR = ''5'' ' +
                                                                         '   AND CD_FUND_LEG_REGIME = ''37''', 'VL_PIS'))
  else if qry_di_darf_CD_RECEITA_PGTO.AsString = '5629' then
    qry_di_darf_CALC_VL_ADM_TEMP.AsFloat := StrToFloat(ConsultaLookUPSQL(' SELECT ISNULL(SUM(ISNULL(VL_COFINS, 0)), 0) AS VL_COFINS ' +
                                                                         ' FROM TADICAO_DE_IMPORTACAO ' +
                                                                         ' WHERE NR_PROCESSO = ' + QuotedStr(qry_di_darf_NR_PROCESSO.AsString) +
                                                                         '   AND CD_REGIME_TRIBUTAR = ''5'' ' +
                                                                         '   AND CD_FUND_LEG_REGIME = ''37''', 'VL_COFINS'))
  else if qry_di_darf_CD_RECEITA_PGTO.AsString = '1038' then
    qry_di_darf_CALC_VL_ADM_TEMP.AsFloat := StrToFloat(ConsultaLookUPSQL(' SELECT ISNULL(SUM(ISNULL(TR.VL_IPT_A_RECOLHER, 0)), 0) AS VL_IPI ' +
                                                                         ' FROM TADICAO_DE_IMPORTACAO AI LEFT JOIN TRIBUTO TR ON TR.NR_PROCESSO = AI.NR_PROCESSO ' +
                                                                         '                                                   AND TR.NR_ADICAO   = AI.NR_ADICAO ' +
                                                                         ' WHERE AI.NR_PROCESSO = ' + QuotedStr(qry_di_darf_NR_PROCESSO.AsString) +
                                                                         '   AND AI.CD_REGIME_TRIBUTAR = ''5'' ' +
                                                                         '   AND AI.CD_FUND_LEG_REGIME = ''37'' ' +
                                                                         '   AND TR.CD_RECEITA_IMPOSTO = ''0002''', 'VL_IPI'))
  else if qry_di_darf_CD_RECEITA_PGTO.AsString = '0086' then
    qry_di_darf_CALC_VL_ADM_TEMP.AsFloat := StrToFloat(ConsultaLookUPSQL(' SELECT ISNULL(SUM(ISNULL(TR.VL_IPT_A_RECOLHER, 0)), 0) AS VL_II ' +
                                                                         ' FROM TADICAO_DE_IMPORTACAO AI LEFT JOIN TRIBUTO TR ON TR.NR_PROCESSO = AI.NR_PROCESSO ' +
                                                                         '                                                   AND TR.NR_ADICAO   = AI.NR_ADICAO ' +
                                                                         ' WHERE AI.NR_PROCESSO = ' + QuotedStr(qry_di_darf_NR_PROCESSO.AsString) +
                                                                         '   AND AI.CD_REGIME_TRIBUTAR = ''5'' ' +
                                                                         '   AND AI.CD_FUND_LEG_REGIME = ''37'' ' +
                                                                         '   AND TR.CD_RECEITA_IMPOSTO = ''0001''', 'VL_II'))
  else
    qry_di_darf_CALC_VL_ADM_TEMP.AsFloat := 0;
end;

procedure Tdatm_DI_Capa.qry_di_darf_AfterPost(DataSet: TDataSet);
begin
  qry_di_darf_.ApplyUpdates;
end;

procedure Tdatm_DI_Capa.qry_di_IN_FMAChange(Sender: TField);
begin
  if qry_di_IN_FMA.AsString <> '1' then
    qry_di_DT_PAGAMENTO_DARF.Clear;
end;

procedure Tdatm_DI_Capa.qry_di_darf_BeforePost(DataSet: TDataSet);
begin
  qry_di_darf_NR_PROCESSO.AsString := qry_di_NR_PROCESSO.AsString;
  qry_di_darf_CD_BANCO_PGTO_TRIB.AsString := ConsultaLookUPSQL('SELECT TOP 1 CD_BANCO_PGTO_TRIB ' +
                                                               'FROM TPAGAMENTO_TRIBUTOS ' +
                                                               'WHERE NR_PROCESSO = :NR_PROCESSO ' +
                                                               '  AND CD_BANCO_PGTO_TRIB IS NOT NULL', 'CD_BANCO_PGTO_TRIB', [qry_di_NR_PROCESSO.AsString]);
  qry_di_darf_NR_AGENC_PGTO_TRIB.AsString := ConsultaLookUPSQL('SELECT TOP 1 NR_AGENC_PGTO_TRIB ' +
                                                               'FROM TPAGAMENTO_TRIBUTOS ' +
                                                               'WHERE NR_PROCESSO = :NR_PROCESSO ' +
                                                               '  AND NR_AGENC_PGTO_TRIB IS NOT NULL', 'NR_AGENC_PGTO_TRIB', [qry_di_NR_PROCESSO.AsString]);
  if qry_di_darf_VL_MULTA_PGTO_TRIB.IsNull then
    qry_di_darf_VL_MULTA_PGTO_TRIB.AsFloat := 0;
  if qry_di_darf_VL_JUROS_PGTO_TRIB.IsNull then
    qry_di_darf_VL_JUROS_PGTO_TRIB.AsFloat := 0;
end;

end.
