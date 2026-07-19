object datm_DI_adicao_com_LI: Tdatm_DI_adicao_com_LI
  Left = 220
  Top = 170
  Height = 411
  Width = 526
  object tbl_unidade_: TTable
    Filtered = True
    DatabaseName = 'DBTABSISCO'
    SessionName = 'Default'
    ReadOnly = True
    TableName = 'TUNID_MEDIDA'
    Left = 168
    Top = 28
    object tbl_unidade_CODIGO: TStringField
      FieldName = 'CODIGO'
      Size = 2
    end
    object tbl_unidade_DESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Size = 120
    end
  end
  object db_ri: TDatabase
    AliasName = 'LI'
    DatabaseName = 'DBREGIMP'
    LoginPrompt = False
    Params.Strings = (
      'USER NAME=SA'
      'PASSWORD=123')
    SessionName = 'Default'
    Left = 48
    Top = 28
  end
  object tbl_adicao_: TTable
    DatabaseName = 'DBDI'
    SessionName = 'Default'
    IndexFieldNames = 'NR_PROCESSO;NR_ADICAO'
    TableName = 'TADICAO_DE_IMPORTACAO'
    UpdateMode = upWhereKeyOnly
    Left = 168
    Top = 92
    object tbl_adicao_NR_PROCESSO: TStringField
      FieldName = 'NR_PROCESSO'
      Required = True
      Size = 11
    end
    object tbl_adicao_NR_ADICAO: TStringField
      FieldName = 'NR_ADICAO'
      Required = True
      Size = 3
    end
    object tbl_adicao_CD_ACORDO_ALADI: TStringField
      FieldName = 'CD_ACORDO_ALADI'
      Size = 3
    end
    object tbl_adicao_CD_AGENC_AGENT_IMP: TStringField
      FieldName = 'CD_AGENC_AGENT_IMP'
      Size = 4
    end
    object tbl_adicao_CD_APLICACAO_MERC: TStringField
      FieldName = 'CD_APLICACAO_MERC'
      Size = 1
    end
    object tbl_adicao_CD_AUSENCIA_FABRIC: TStringField
      FieldName = 'CD_AUSENCIA_FABRIC'
      Size = 1
    end
    object tbl_adicao_CD_BANC_AGENTE_IMP: TStringField
      FieldName = 'CD_BANC_AGENTE_IMP'
      Size = 5
    end
    object tbl_adicao_CD_COBERT_CAMBIAL: TStringField
      FieldName = 'CD_COBERT_CAMBIAL'
      Size = 1
    end
    object tbl_adicao_CD_FABRICANTE: TStringField
      FieldName = 'CD_FABRICANTE'
      Size = 5
    end
    object tbl_adicao_CD_FORNECEDOR: TStringField
      FieldName = 'CD_FORNECEDOR'
      Size = 5
    end
    object tbl_adicao_CD_FUND_LEG_REGIME: TStringField
      FieldName = 'CD_FUND_LEG_REGIME'
      Size = 2
    end
    object tbl_adicao_CD_INCOTERMS_VENDA: TStringField
      FieldName = 'CD_INCOTERMS_VENDA'
      Size = 3
    end
    object tbl_adicao_CD_LOC_COND_VENDA: TStringField
      FieldName = 'CD_LOC_COND_VENDA'
      Size = 4
    end
    object tbl_adicao_CD_MD_FRETE_MERC: TStringField
      FieldName = 'CD_MD_FRETE_MERC'
      Size = 3
    end
    object tbl_adicao_CD_MERC_NALADI_NCC: TStringField
      FieldName = 'CD_MERC_NALADI_NCC'
      Size = 7
    end
    object tbl_adicao_CD_MERC_NALADI_SH: TStringField
      FieldName = 'CD_MERC_NALADI_SH'
      Size = 8
    end
    object tbl_adicao_CD_MERC_NBM_SH: TStringField
      FieldName = 'CD_MERC_NBM_SH'
      Size = 8
    end
    object tbl_adicao_CD_NCM_SH: TStringField
      FieldName = 'CD_NCM_SH'
      Size = 8
    end
    object tbl_adicao_CD_MERCADORIA_NCM: TStringField
      FieldName = 'CD_MERCADORIA_NCM'
      Size = 11
    end
    object tbl_adicao_CD_METOD_VALORACAO: TStringField
      FieldName = 'CD_METOD_VALORACAO'
      Size = 2
    end
    object tbl_adicao_CD_MODALIDADE_PGTO: TStringField
      FieldName = 'CD_MODALIDADE_PGTO'
      Size = 2
    end
    object tbl_adicao_CD_MOEDA_NEGOCIADA: TStringField
      FieldName = 'CD_MOEDA_NEGOCIADA'
      Size = 3
    end
    object tbl_adicao_CD_MOEDA_SEG_MERC: TStringField
      FieldName = 'CD_MOEDA_SEG_MERC'
      Size = 3
    end
    object tbl_adicao_CD_MOEDAS_DESPESAS: TStringField
      FieldName = 'CD_MOEDAS_DESPESAS'
      Size = 3
    end
    object tbl_adicao_CD_MOTIVO_ADM_TEMP: TStringField
      FieldName = 'CD_MOTIVO_ADM_TEMP'
      Size = 2
    end
    object tbl_adicao_CD_MOTIVO_SEM_COB: TStringField
      FieldName = 'CD_MOTIVO_SEM_COB'
      Size = 2
    end
    object tbl_adicao_CD_ORGAO_FIN_INTER: TStringField
      FieldName = 'CD_ORGAO_FIN_INTER'
      Size = 2
    end
    object tbl_adicao_CD_PAIS_AQUIS_MERC: TStringField
      FieldName = 'CD_PAIS_AQUIS_MERC'
      Size = 3
    end
    object tbl_adicao_CD_PAIS_ORIG_MERC: TStringField
      FieldName = 'CD_PAIS_ORIG_MERC'
      Size = 3
    end
    object tbl_adicao_CD_PAIS_PROC_MERC: TStringField
      FieldName = 'CD_PAIS_PROC_MERC'
      Size = 3
    end
    object tbl_adicao_CD_PERIOD_PGTO_360: TStringField
      FieldName = 'CD_PERIOD_PGTO_360'
      Size = 1
    end
    object tbl_adicao_CD_REGIME_TRIBUTAR: TStringField
      FieldName = 'CD_REGIME_TRIBUTAR'
      Size = 1
    end
    object tbl_adicao_CD_TAXA_JUROS: TStringField
      FieldName = 'CD_TAXA_JUROS'
      Size = 4
    end
    object tbl_adicao_CD_TIPO_ACORDO_TAR: TStringField
      FieldName = 'CD_TIPO_ACORDO_TAR'
      Size = 1
    end
    object tbl_adicao_CD_TIPO_AGENTE_IMP: TStringField
      FieldName = 'CD_TIPO_AGENTE_IMP'
      Size = 1
    end
    object tbl_adicao_CD_URF_ENTR_MERC: TStringField
      FieldName = 'CD_URF_ENTR_MERC'
      Size = 7
    end
    object tbl_adicao_CD_VIA_TRANSPORTE: TStringField
      FieldName = 'CD_VIA_TRANSPORTE'
      Size = 2
    end
    object tbl_adicao_CD_VINC_IMPO_EXPO: TStringField
      FieldName = 'CD_VINC_IMPO_EXPO'
      Size = 1
    end
    object tbl_adicao_ED_CIDAD_FABRIC: TStringField
      FieldName = 'ED_CIDAD_FABRIC'
      Size = 25
    end
    object tbl_adicao_ED_CIDAD_FORN_ESTR: TStringField
      FieldName = 'ED_CIDAD_FORN_ESTR'
      Size = 25
    end
    object tbl_adicao_ED_COMPL_FABRIC: TStringField
      FieldName = 'ED_COMPL_FABRIC'
      Size = 21
    end
    object tbl_adicao_ED_COMPL_FORN_ESTR: TStringField
      FieldName = 'ED_COMPL_FORN_ESTR'
      Size = 21
    end
    object tbl_adicao_ED_ESTAD_FORN_ESTR: TStringField
      FieldName = 'ED_ESTAD_FORN_ESTR'
      Size = 25
    end
    object tbl_adicao_ED_ESTADO_FABRIC: TStringField
      FieldName = 'ED_ESTADO_FABRIC'
      Size = 25
    end
    object tbl_adicao_ED_LOGR_FABRIC: TStringField
      FieldName = 'ED_LOGR_FABRIC'
      Size = 40
    end
    object tbl_adicao_ED_LOGR_FORN_ESTR: TStringField
      FieldName = 'ED_LOGR_FORN_ESTR'
      Size = 40
    end
    object tbl_adicao_ED_NR_FABRIC: TStringField
      FieldName = 'ED_NR_FABRIC'
      Size = 6
    end
    object tbl_adicao_ED_NR_FORN_ESTR: TStringField
      FieldName = 'ED_NR_FORN_ESTR'
      Size = 6
    end
    object tbl_adicao_IN_BEM_ENCOMENDA: TBooleanField
      FieldName = 'IN_BEM_ENCOMENDA'
      Required = True
    end
    object tbl_adicao_IN_IPI_NAO_TRIBUT: TBooleanField
      FieldName = 'IN_IPI_NAO_TRIBUT'
      Required = True
    end
    object tbl_adicao_IN_JUROS_ATE_360: TBooleanField
      FieldName = 'IN_JUROS_ATE_360'
      Required = True
    end
    object tbl_adicao_IN_MATERIAL_USADO: TBooleanField
      FieldName = 'IN_MATERIAL_USADO'
      Required = True
    end
    object tbl_adicao_IN_MULTIMODAL: TBooleanField
      FieldName = 'IN_MULTIMODAL'
      Required = True
    end
    object tbl_adicao_IN_PGTO_VARIAV_360: TBooleanField
      FieldName = 'IN_PGTO_VARIAV_360'
      Required = True
    end
    object tbl_adicao_NM_FABRICANTE_MERC: TStringField
      FieldName = 'NM_FABRICANTE_MERC'
      Size = 60
    end
    object tbl_adicao_NM_FORN_ESTR: TStringField
      FieldName = 'NM_FORN_ESTR'
      Size = 60
    end
    object tbl_adicao_NR_AGENTE_IMP: TStringField
      FieldName = 'NR_AGENTE_IMP'
      Size = 14
    end
    object tbl_adicao_NR_DCTO_REDUCAO: TStringField
      FieldName = 'NR_DCTO_REDUCAO'
      Size = 8
    end
    object tbl_adicao_NR_OPER_TRAT_PREV: TStringField
      FieldName = 'NR_OPER_TRAT_PREV'
      Size = 10
    end
    object tbl_adicao_NR_ROF: TStringField
      FieldName = 'NR_ROF'
      Size = 8
    end
    object tbl_adicao_PC_COEF_REDUC_II: TFloatField
      FieldName = 'PC_COEF_REDUC_II'
      Required = True
    end
    object tbl_adicao_PC_COMISSAO_AG_IMP: TFloatField
      FieldName = 'PC_COMISSAO_AG_IMP'
      Required = True
    end
    object tbl_adicao_PC_TAXA_JUROS: TFloatField
      FieldName = 'PC_TAXA_JUROS'
      Required = True
    end
    object tbl_adicao_PL_MERCADORIA: TFloatField
      FieldName = 'PL_MERCADORIA'
      Required = True
    end
    object tbl_adicao_QT_ITENS_ADICAO: TIntegerField
      FieldName = 'QT_ITENS_ADICAO'
      Required = True
    end
    object tbl_adicao_QT_PARC_FINANC_360: TIntegerField
      FieldName = 'QT_PARC_FINANC_360'
      Required = True
    end
    object tbl_adicao_QT_PERIOD_PGTO_360: TIntegerField
      FieldName = 'QT_PERIOD_PGTO_360'
      Required = True
    end
    object tbl_adicao_QT_UN_ESTATISTICA: TFloatField
      FieldName = 'QT_UN_ESTATISTICA'
      Required = True
    end
    object tbl_adicao_TX_COMPL_VL_ADUAN: TStringField
      FieldName = 'TX_COMPL_VL_ADUAN'
      Size = 250
    end
    object tbl_adicao_VL_ACRESCIMOS_MN: TFloatField
      FieldName = 'VL_ACRESCIMOS_MN'
      Required = True
    end
    object tbl_adicao_vl_base_calculo_mn: TFloatField
      FieldName = 'vl_base_calculo_mn'
      Required = True
    end
    object tbl_adicao_VL_CALC_DCR_DOLAR: TFloatField
      FieldName = 'VL_CALC_DCR_DOLAR'
      Required = True
    end
    object tbl_adicao_VL_COMISSAO_AG_IMP: TFloatField
      FieldName = 'VL_COMISSAO_AG_IMP'
      Required = True
    end
    object tbl_adicao_VL_DEDUCOES_MN: TFloatField
      FieldName = 'VL_DEDUCOES_MN'
      Required = True
    end
    object tbl_adicao_VL_DESPESAS_MN: TFloatField
      FieldName = 'VL_DESPESAS_MN'
      Required = True
    end
    object tbl_adicao_VL_DESPESAS_MNEG: TFloatField
      FieldName = 'VL_DESPESAS_MNEG'
      Required = True
    end
    object tbl_adicao_VL_FINANC_SUP_360: TFloatField
      FieldName = 'VL_FINANC_SUP_360'
      Required = True
    end
    object tbl_adicao_VL_FRETE_MERC_MN: TFloatField
      FieldName = 'VL_FRETE_MERC_MN'
      Required = True
    end
    object tbl_adicao_VL_FRETE_MERC_MNEG: TFloatField
      FieldName = 'VL_FRETE_MERC_MNEG'
      Required = True
    end
    object tbl_adicao_VL_II_A_REC_ZFM: TFloatField
      FieldName = 'VL_II_A_REC_ZFM'
      Required = True
    end
    object tbl_adicao_VL_II_CALC_DCR_MN: TFloatField
      FieldName = 'VL_II_CALC_DCR_MN'
      Required = True
    end
    object tbl_adicao_VL_II_DEVIDO_ZFM: TFloatField
      FieldName = 'VL_II_DEVIDO_ZFM'
      Required = True
    end
    object tbl_adicao_VL_MERC_COND_VENDA: TFloatField
      FieldName = 'VL_MERC_COND_VENDA'
      Required = True
    end
    object tbl_adicao_VL_MERC_EMB_MN: TFloatField
      FieldName = 'VL_MERC_EMB_MN'
      Required = True
    end
    object tbl_adicao_vl_merc_loc_emb_mn: TFloatField
      FieldName = 'vl_merc_loc_emb_mn'
      Required = True
    end
    object tbl_adicao_VL_MERC_VENDA_MN: TFloatField
      FieldName = 'VL_MERC_VENDA_MN'
      Required = True
    end
    object tbl_adicao_VL_SEG_MERC_MN: TFloatField
      FieldName = 'VL_SEG_MERC_MN'
      Required = True
    end
    object tbl_adicao_VL_SEG_MERC_MNEG: TFloatField
      FieldName = 'VL_SEG_MERC_MNEG'
      Required = True
    end
    object tbl_adicao_VL_TOT_FINANC_360: TFloatField
      FieldName = 'VL_TOT_FINANC_360'
      Required = True
    end
    object tbl_adicao_VL_UNID_LOC_EMP: TFloatField
      FieldName = 'VL_UNID_LOC_EMP'
      Required = True
    end
    object tbl_adicao_IN_ADICAO_CALCULADA: TBooleanField
      FieldName = 'IN_ADICAO_CALCULADA'
      Required = True
    end
  end
  object qry_li_: TQuery
    DatabaseName = 'DBREGIMP'
    SessionName = 'Default'
    SQL.Strings = (
      'SELECT NR_TRAT_IMP_MICRO , NR_IDENT_USUARIO , '
      ' NR_OPER_TRAT_PROT , CD_AUTORIZ_TRANSM , '
      ' NR_OPER_TRAT_PREV , NR_LI_SUBSTITUIDO , '
      ' CD_ORIGEM_LI , NR_DECL_IMP_VINC , '
      ' NR_ADI_IMP_VINC , NR_SEQ_RETI_VINC , '
      ' CD_TIPO_IMPORTADOR , NR_IMPORTADOR , '
      ' CD_PAIS_IMPORTADOR , NM_IMPORTADOR , '
      ' NR_TEL_IMPORTADOR , ED_LOGR_IMPORTADOR , '
      ' ED_NR_IMPORTADOR , ED_COMPL_IMPO , '
      ' ED_BA_IMPORTADOR , ED_MUN_IMPORTADOR , '
      ' ED_UF_IMPORTADOR , ED_CEP_IMPORTADOR , '
      ' CD_ATIV_ECON_IMPO , NR_CPF_REPR_LEGAL , '
      ' CD_URF_ENTR_MERC , NM_FORN_ESTR , '
      ' ED_LOGR_FORN_ESTR , ED_NR_FORN_ESTR , '
      ' ED_COMPL_FORN_ESTR , '
      ' ED_CIDAD_FORN_ESTR , '
      ' ED_ESTAD_FORN_ESTR , '
      ' CD_PAIS_AQUIS_MERC , CD_MERCADORIA_NCM , '
      ' CD_PAIS_PROC_MERC , CD_AUSENCIA_FABRIC , '
      ' NM_FABRICANTE_MERC , ED_LOGR_FABRIC , '
      ' ED_NR_FABRIC , ED_COMPL_FABRIC , '
      ' ED_CIDAD_FABRIC , ED_ESTADO_FABRIC , '
      ' CD_PAIS_ORIG_MERC , CD_MERC_NALADI_NCC , '
      ' CD_MERC_NALADI_SH , PL_MERCADORIA , '
      ' QT_UN_ESTATISTICA , CD_MOEDA_NEGOCIADA , '
      ' QT_DIA_LIMITE_PGTO , '
      ' CD_INCOTERMS_VENDA , VL_MERC_MNEG_EMB , '
      ' VL_TOT_DOLAR_EMB , CD_TIPO_ACORDO_TAR , '
      ' CD_ACORDO_ALADI , CD_REGIME_TRIBUTAR , '
      ' CD_FUND_LEG_REGIME , CD_COBERT_CAMBIAL , '
      ' CD_MODALIDADE_PGTO , '
      ' CD_ORGAO_FIN_INTER , CD_MOTIVO_SEM_COB , '
      ' CD_AGENCIA_SECEX , CD_URF_DESPACHO , '
      ' IN_REST_DATA_EMB_LI , '
      ' IN_MATERIAL_USADO , IN_BEM_ENCOMENDA , '
      ' NR_ATO_DRAWBACK , NR_COMUNIC_COMPRA , '
      ' DT_REG_OPER_TRAT , DT_ATU_OPER_MICRO , '
      ' IN_SALVO_DIAG , IN_SELECAO_DIAG , '
      ' TX_INFO_COMPL , CD_SITUAC_OP_TRAT , '
      ' DT_SITUAC_OP_TRAT , DT_VALID_OP_TRAT , '
      ' CD_CANCEL_OP_TRAT , DT_CANCEL_OP_TRAT , '
      ' NR_CPF_CANC_ANUENC , '
      ' NR_LI_SUBSTITUTIVO'
      'FROM OPERAÇÃO_COM_TRATAMENTO OPERAÇÃO_COM_TRATAMENTO'
      'WHERE NR_OPER_TRAT_PREV = :NR_OPER_TRAT_PREV'
      '')
    Params.Data = {01000100114E525F4F5045525F545241545F505245560001020030000000}
    Left = 48
    Top = 92
    object qry_li_NR_OPER_TRAT_PREV: TStringField
      FieldName = 'NR_OPER_TRAT_PREV'
      Origin = 'OPERAÇÃO_COM_TRATAMENTO.NR_OPER_TRAT_PREV'
      Size = 10
    end
    object qry_li_NR_IDENT_USUARIO: TStringField
      FieldName = 'NR_IDENT_USUARIO'
      Origin = 'OPERAÇÃO_COM_TRATAMENTO.NR_IDENT_USUARIO'
      Size = 15
    end
    object qry_li_NR_OPER_TRAT_PROT: TStringField
      FieldName = 'NR_OPER_TRAT_PROT'
      Origin = 'OPERAÇÃO_COM_TRATAMENTO.NR_OPER_TRAT_PROT'
      Size = 10
    end
    object qry_li_CD_AUTORIZ_TRANSM: TStringField
      FieldName = 'CD_AUTORIZ_TRANSM'
      Origin = 'OPERAÇÃO_COM_TRATAMENTO.CD_AUTORIZ_TRANSM'
      Size = 1
    end
    object qry_li_NR_LI_SUBSTITUIDO: TStringField
      FieldName = 'NR_LI_SUBSTITUIDO'
      Origin = 'OPERAÇÃO_COM_TRATAMENTO.NR_LI_SUBSTITUIDO'
      Size = 10
    end
    object qry_li_CD_ORIGEM_LI: TStringField
      FieldName = 'CD_ORIGEM_LI'
      Origin = 'OPERAÇÃO_COM_TRATAMENTO.CD_ORIGEM_LI'
      Size = 1
    end
    object qry_li_NR_DECL_IMP_VINC: TStringField
      FieldName = 'NR_DECL_IMP_VINC'
      Origin = 'OPERAÇÃO_COM_TRATAMENTO.NR_DECL_IMP_VINC'
      Size = 10
    end
    object qry_li_NR_ADI_IMP_VINC: TStringField
      FieldName = 'NR_ADI_IMP_VINC'
      Origin = 'OPERAÇÃO_COM_TRATAMENTO.NR_ADI_IMP_VINC'
      Size = 3
    end
    object qry_li_NR_SEQ_RETI_VINC: TStringField
      FieldName = 'NR_SEQ_RETI_VINC'
      Origin = 'OPERAÇÃO_COM_TRATAMENTO.NR_SEQ_RETI_VINC'
      Size = 2
    end
    object qry_li_CD_TIPO_IMPORTADOR: TStringField
      FieldName = 'CD_TIPO_IMPORTADOR'
      Origin = 'OPERAÇÃO_COM_TRATAMENTO.CD_TIPO_IMPORTADOR'
      Size = 1
    end
    object qry_li_NR_IMPORTADOR: TStringField
      FieldName = 'NR_IMPORTADOR'
      Origin = 'OPERAÇÃO_COM_TRATAMENTO.NR_IMPORTADOR'
      Size = 14
    end
    object qry_li_CD_PAIS_IMPORTADOR: TStringField
      FieldName = 'CD_PAIS_IMPORTADOR'
      Origin = 'OPERAÇÃO_COM_TRATAMENTO.CD_PAIS_IMPORTADOR'
      Size = 3
    end
    object qry_li_NM_IMPORTADOR: TStringField
      FieldName = 'NM_IMPORTADOR'
      Origin = 'OPERAÇÃO_COM_TRATAMENTO.NM_IMPORTADOR'
      Size = 60
    end
    object qry_li_NR_TEL_IMPORTADOR: TStringField
      FieldName = 'NR_TEL_IMPORTADOR'
      Origin = 'OPERAÇÃO_COM_TRATAMENTO.NR_TEL_IMPORTADOR'
      Size = 15
    end
    object qry_li_ED_LOGR_IMPORTADOR: TStringField
      FieldName = 'ED_LOGR_IMPORTADOR'
      Origin = 'OPERAÇÃO_COM_TRATAMENTO.ED_LOGR_IMPORTADOR'
      Size = 40
    end
    object qry_li_ED_NR_IMPORTADOR: TStringField
      FieldName = 'ED_NR_IMPORTADOR'
      Origin = 'OPERAÇÃO_COM_TRATAMENTO.ED_NR_IMPORTADOR'
      Size = 6
    end
    object qry_li_ED_COMPL_IMPO: TStringField
      FieldName = 'ED_COMPL_IMPO'
      Origin = 'OPERAÇÃO_COM_TRATAMENTO.ED_COMPL_IMPO'
      Size = 21
    end
    object qry_li_ED_BA_IMPORTADOR: TStringField
      FieldName = 'ED_BA_IMPORTADOR'
      Origin = 'OPERAÇÃO_COM_TRATAMENTO.ED_BA_IMPORTADOR'
      Size = 25
    end
    object qry_li_ED_MUN_IMPORTADOR: TStringField
      FieldName = 'ED_MUN_IMPORTADOR'
      Origin = 'OPERAÇÃO_COM_TRATAMENTO.ED_MUN_IMPORTADOR'
      Size = 25
    end
    object qry_li_ED_UF_IMPORTADOR: TStringField
      FieldName = 'ED_UF_IMPORTADOR'
      Origin = 'OPERAÇÃO_COM_TRATAMENTO.ED_UF_IMPORTADOR'
      Size = 2
    end
    object qry_li_ED_CEP_IMPORTADOR: TStringField
      FieldName = 'ED_CEP_IMPORTADOR'
      Origin = 'OPERAÇÃO_COM_TRATAMENTO.ED_CEP_IMPORTADOR'
      Size = 8
    end
    object qry_li_CD_ATIV_ECON_IMPO: TStringField
      FieldName = 'CD_ATIV_ECON_IMPO'
      Origin = 'OPERAÇÃO_COM_TRATAMENTO.CD_ATIV_ECON_IMPO'
      Size = 4
    end
    object qry_li_NR_CPF_REPR_LEGAL: TStringField
      FieldName = 'NR_CPF_REPR_LEGAL'
      Origin = 'OPERAÇÃO_COM_TRATAMENTO.NR_CPF_REPR_LEGAL'
      Size = 11
    end
    object qry_li_CD_URF_ENTR_MERC: TStringField
      FieldName = 'CD_URF_ENTR_MERC'
      Origin = 'OPERAÇÃO_COM_TRATAMENTO.CD_URF_ENTR_MERC'
      Size = 7
    end
    object qry_li_NM_FORN_ESTR: TStringField
      FieldName = 'NM_FORN_ESTR'
      Origin = 'OPERAÇÃO_COM_TRATAMENTO.NM_FORN_ESTR'
      Size = 60
    end
    object qry_li_ED_LOGR_FORN_ESTR: TStringField
      FieldName = 'ED_LOGR_FORN_ESTR'
      Origin = 'OPERAÇÃO_COM_TRATAMENTO.ED_LOGR_FORN_ESTR'
      Size = 40
    end
    object qry_li_ED_NR_FORN_ESTR: TStringField
      FieldName = 'ED_NR_FORN_ESTR'
      Origin = 'OPERAÇÃO_COM_TRATAMENTO.ED_NR_FORN_ESTR'
      Size = 6
    end
    object qry_li_ED_COMPL_FORN_ESTR: TStringField
      FieldName = 'ED_COMPL_FORN_ESTR'
      Origin = 'OPERAÇÃO_COM_TRATAMENTO.ED_COMPL_FORN_ESTR'
      Size = 21
    end
    object qry_li_ED_CIDAD_FORN_ESTR: TStringField
      FieldName = 'ED_CIDAD_FORN_ESTR'
      Origin = 'OPERAÇÃO_COM_TRATAMENTO.ED_CIDAD_FORN_ESTR'
      Size = 25
    end
    object qry_li_ED_ESTAD_FORN_ESTR: TStringField
      FieldName = 'ED_ESTAD_FORN_ESTR'
      Origin = 'OPERAÇÃO_COM_TRATAMENTO.ED_ESTAD_FORN_ESTR'
      Size = 25
    end
    object qry_li_CD_PAIS_AQUIS_MERC: TStringField
      FieldName = 'CD_PAIS_AQUIS_MERC'
      Origin = 'OPERAÇÃO_COM_TRATAMENTO.CD_PAIS_AQUIS_MERC'
      Size = 3
    end
    object qry_li_CD_MERCADORIA_NCM: TStringField
      FieldName = 'CD_MERCADORIA_NCM'
      Origin = 'OPERAÇÃO_COM_TRATAMENTO.CD_MERCADORIA_NCM'
      Size = 8
    end
    object qry_li_CD_PAIS_PROC_MERC: TStringField
      FieldName = 'CD_PAIS_PROC_MERC'
      Origin = 'OPERAÇÃO_COM_TRATAMENTO.CD_PAIS_PROC_MERC'
      Size = 3
    end
    object qry_li_CD_AUSENCIA_FABRIC: TStringField
      FieldName = 'CD_AUSENCIA_FABRIC'
      Origin = 'OPERAÇÃO_COM_TRATAMENTO.CD_AUSENCIA_FABRIC'
      Size = 1
    end
    object qry_li_NM_FABRICANTE_MERC: TStringField
      FieldName = 'NM_FABRICANTE_MERC'
      Origin = 'OPERAÇÃO_COM_TRATAMENTO.NM_FABRICANTE_MERC'
      Size = 60
    end
    object qry_li_ED_LOGR_FABRIC: TStringField
      FieldName = 'ED_LOGR_FABRIC'
      Origin = 'OPERAÇÃO_COM_TRATAMENTO.ED_LOGR_FABRIC'
      Size = 40
    end
    object qry_li_ED_NR_FABRIC: TStringField
      FieldName = 'ED_NR_FABRIC'
      Origin = 'OPERAÇÃO_COM_TRATAMENTO.ED_NR_FABRIC'
      Size = 6
    end
    object qry_li_ED_COMPL_FABRIC: TStringField
      FieldName = 'ED_COMPL_FABRIC'
      Origin = 'OPERAÇÃO_COM_TRATAMENTO.ED_COMPL_FABRIC'
      Size = 21
    end
    object qry_li_ED_CIDAD_FABRIC: TStringField
      FieldName = 'ED_CIDAD_FABRIC'
      Origin = 'OPERAÇÃO_COM_TRATAMENTO.ED_CIDAD_FABRIC'
      Size = 25
    end
    object qry_li_ED_ESTADO_FABRIC: TStringField
      FieldName = 'ED_ESTADO_FABRIC'
      Origin = 'OPERAÇÃO_COM_TRATAMENTO.ED_ESTADO_FABRIC'
      Size = 25
    end
    object qry_li_CD_PAIS_ORIG_MERC: TStringField
      FieldName = 'CD_PAIS_ORIG_MERC'
      Origin = 'OPERAÇÃO_COM_TRATAMENTO.CD_PAIS_ORIG_MERC'
      Size = 3
    end
    object qry_li_CD_MERC_NALADI_NCC: TStringField
      FieldName = 'CD_MERC_NALADI_NCC'
      Origin = 'OPERAÇÃO_COM_TRATAMENTO.CD_MERC_NALADI_NCC'
      Size = 7
    end
    object qry_li_CD_MERC_NALADI_SH: TStringField
      FieldName = 'CD_MERC_NALADI_SH'
      Origin = 'OPERAÇÃO_COM_TRATAMENTO.CD_MERC_NALADI_SH'
      Size = 8
    end
    object qry_li_PL_MERCADORIA: TStringField
      FieldName = 'PL_MERCADORIA'
      Origin = 'OPERAÇÃO_COM_TRATAMENTO.PL_MERCADORIA'
      Size = 15
    end
    object qry_li_QT_UN_ESTATISTICA: TStringField
      FieldName = 'QT_UN_ESTATISTICA'
      Origin = 'OPERAÇÃO_COM_TRATAMENTO.QT_UN_ESTATISTICA'
      Size = 15
    end
    object qry_li_CD_MOEDA_NEGOCIADA: TStringField
      FieldName = 'CD_MOEDA_NEGOCIADA'
      Origin = 'OPERAÇÃO_COM_TRATAMENTO.CD_MOEDA_NEGOCIADA'
      Size = 3
    end
    object qry_li_QT_DIA_LIMITE_PGTO: TStringField
      FieldName = 'QT_DIA_LIMITE_PGTO'
      Origin = 'OPERAÇÃO_COM_TRATAMENTO.QT_DIA_LIMITE_PGTO'
      Size = 3
    end
    object qry_li_CD_INCOTERMS_VENDA: TStringField
      FieldName = 'CD_INCOTERMS_VENDA'
      Origin = 'OPERAÇÃO_COM_TRATAMENTO.CD_INCOTERMS_VENDA'
      Size = 3
    end
    object qry_li_VL_TOT_DOLAR_EMB: TStringField
      FieldName = 'VL_TOT_DOLAR_EMB'
      Origin = 'OPERAÇÃO_COM_TRATAMENTO.VL_TOT_DOLAR_EMB'
      Size = 11
    end
    object qry_li_CD_TIPO_ACORDO_TAR: TStringField
      FieldName = 'CD_TIPO_ACORDO_TAR'
      Origin = 'OPERAÇÃO_COM_TRATAMENTO.CD_TIPO_ACORDO_TAR'
      Size = 1
    end
    object qry_li_CD_ACORDO_ALADI: TStringField
      FieldName = 'CD_ACORDO_ALADI'
      Origin = 'OPERAÇÃO_COM_TRATAMENTO.CD_ACORDO_ALADI'
      Size = 3
    end
    object qry_li_CD_REGIME_TRIBUTAR: TStringField
      FieldName = 'CD_REGIME_TRIBUTAR'
      Origin = 'OPERAÇÃO_COM_TRATAMENTO.CD_REGIME_TRIBUTAR'
      Size = 1
    end
    object qry_li_CD_FUND_LEG_REGIME: TStringField
      FieldName = 'CD_FUND_LEG_REGIME'
      Origin = 'OPERAÇÃO_COM_TRATAMENTO.CD_FUND_LEG_REGIME'
      Size = 2
    end
    object qry_li_CD_COBERT_CAMBIAL: TStringField
      FieldName = 'CD_COBERT_CAMBIAL'
      Origin = 'OPERAÇÃO_COM_TRATAMENTO.CD_COBERT_CAMBIAL'
      Size = 1
    end
    object qry_li_CD_MODALIDADE_PGTO: TStringField
      FieldName = 'CD_MODALIDADE_PGTO'
      Origin = 'OPERAÇÃO_COM_TRATAMENTO.CD_MODALIDADE_PGTO'
      Size = 2
    end
    object qry_li_CD_ORGAO_FIN_INTER: TStringField
      FieldName = 'CD_ORGAO_FIN_INTER'
      Origin = 'OPERAÇÃO_COM_TRATAMENTO.CD_ORGAO_FIN_INTER'
      Size = 2
    end
    object qry_li_CD_MOTIVO_SEM_COB: TStringField
      FieldName = 'CD_MOTIVO_SEM_COB'
      Origin = 'OPERAÇÃO_COM_TRATAMENTO.CD_MOTIVO_SEM_COB'
      Size = 2
    end
    object qry_li_CD_AGENCIA_SECEX: TStringField
      FieldName = 'CD_AGENCIA_SECEX'
      Origin = 'OPERAÇÃO_COM_TRATAMENTO.CD_AGENCIA_SECEX'
      Size = 5
    end
    object qry_li_CD_URF_DESPACHO: TStringField
      FieldName = 'CD_URF_DESPACHO'
      Origin = 'OPERAÇÃO_COM_TRATAMENTO.CD_URF_DESPACHO'
      Size = 7
    end
    object qry_li_IN_REST_DATA_EMB_LI: TStringField
      FieldName = 'IN_REST_DATA_EMB_LI'
      Origin = 'OPERAÇÃO_COM_TRATAMENTO.IN_REST_DATA_EMB_LI'
      Size = 1
    end
    object qry_li_IN_MATERIAL_USADO: TBooleanField
      FieldName = 'IN_MATERIAL_USADO'
      Origin = 'OPERAÇÃO_COM_TRATAMENTO.IN_MATERIAL_USADO'
    end
    object qry_li_IN_BEM_ENCOMENDA: TBooleanField
      FieldName = 'IN_BEM_ENCOMENDA'
      Origin = 'OPERAÇÃO_COM_TRATAMENTO.IN_BEM_ENCOMENDA'
    end
    object qry_li_NR_ATO_DRAWBACK: TStringField
      FieldName = 'NR_ATO_DRAWBACK'
      Origin = 'OPERAÇÃO_COM_TRATAMENTO.NR_ATO_DRAWBACK'
      Size = 13
    end
    object qry_li_NR_COMUNIC_COMPRA: TStringField
      FieldName = 'NR_COMUNIC_COMPRA'
      Origin = 'OPERAÇÃO_COM_TRATAMENTO.NR_COMUNIC_COMPRA'
      Size = 13
    end
    object qry_li_DT_REG_OPER_TRAT: TStringField
      FieldName = 'DT_REG_OPER_TRAT'
      Origin = 'OPERAÇÃO_COM_TRATAMENTO.DT_REG_OPER_TRAT'
      Size = 10
    end
    object qry_li_DT_ATU_OPER_MICRO: TStringField
      FieldName = 'DT_ATU_OPER_MICRO'
      Origin = 'OPERAÇÃO_COM_TRATAMENTO.DT_ATU_OPER_MICRO'
      Size = 10
    end
    object qry_li_IN_SALVO_DIAG: TBooleanField
      FieldName = 'IN_SALVO_DIAG'
      Origin = 'OPERAÇÃO_COM_TRATAMENTO.IN_SALVO_DIAG'
    end
    object qry_li_IN_SELECAO_DIAG: TBooleanField
      FieldName = 'IN_SELECAO_DIAG'
      Origin = 'OPERAÇÃO_COM_TRATAMENTO.IN_SELECAO_DIAG'
    end
    object qry_li_CD_SITUAC_OP_TRAT: TStringField
      FieldName = 'CD_SITUAC_OP_TRAT'
      Origin = 'OPERAÇÃO_COM_TRATAMENTO.CD_SITUAC_OP_TRAT'
      Size = 2
    end
    object qry_li_DT_SITUAC_OP_TRAT: TStringField
      FieldName = 'DT_SITUAC_OP_TRAT'
      Origin = 'OPERAÇÃO_COM_TRATAMENTO.DT_SITUAC_OP_TRAT'
      Size = 10
    end
    object qry_li_DT_VALID_OP_TRAT: TStringField
      FieldName = 'DT_VALID_OP_TRAT'
      Origin = 'OPERAÇÃO_COM_TRATAMENTO.DT_VALID_OP_TRAT'
      Size = 10
    end
    object qry_li_CD_CANCEL_OP_TRAT: TStringField
      FieldName = 'CD_CANCEL_OP_TRAT'
      Origin = 'OPERAÇÃO_COM_TRATAMENTO.CD_CANCEL_OP_TRAT'
      Size = 1
    end
    object qry_li_DT_CANCEL_OP_TRAT: TStringField
      FieldName = 'DT_CANCEL_OP_TRAT'
      Origin = 'OPERAÇÃO_COM_TRATAMENTO.DT_CANCEL_OP_TRAT'
      Size = 10
    end
    object qry_li_NR_CPF_CANC_ANUENC: TStringField
      FieldName = 'NR_CPF_CANC_ANUENC'
      Origin = 'OPERAÇÃO_COM_TRATAMENTO.NR_CPF_CANC_ANUENC'
      Size = 11
    end
    object qry_li_NR_LI_SUBSTITUTIVO: TStringField
      FieldName = 'NR_LI_SUBSTITUTIVO'
      Origin = 'OPERAÇÃO_COM_TRATAMENTO.NR_LI_SUBSTITUTIVO'
      Size = 10
    end
    object qry_li_TX_INFO_COMPL: TMemoField
      FieldName = 'TX_INFO_COMPL'
      Origin = 'OPERAÇÃO_COM_TRATAMENTO.NR_TRAT_IMP_MICRO'
      BlobType = ftMemo
    end
    object qry_li_NR_TRAT_IMP_MICRO: TStringField
      FieldName = 'NR_TRAT_IMP_MICRO'
      Origin = 'OPERAÇÃO_COM_TRATAMENTO.NR_TRAT_IMP_MICRO'
      Size = 8
    end
    object qry_li_VL_MERC_MNEG_EMB: TStringField
      FieldName = 'VL_MERC_MNEG_EMB'
      Origin = 'OPERAÇÃO_COM_TRATAMENTO.NR_IDENT_USUARIO'
      Size = 15
    end
  end
  object tbl_Item_: TTable
    DatabaseName = 'DBDI'
    SessionName = 'Default'
    TableName = 'TDETALHE_MERCADORIA'
    UpdateMode = upWhereKeyOnly
    Left = 168
    Top = 156
    object tbl_Item_NR_PROCESSO: TStringField
      FieldName = 'NR_PROCESSO'
      Required = True
      Size = 11
    end
    object tbl_Item_NR_ADICAO: TStringField
      FieldName = 'NR_ADICAO'
      Required = True
      Size = 3
    end
    object tbl_Item_NR_ITEM: TStringField
      FieldName = 'NR_ITEM'
      Required = True
      Size = 3
    end
    object tbl_Item_CD_EXPORTADOR: TStringField
      FieldName = 'CD_EXPORTADOR'
      Size = 5
    end
    object tbl_Item_CD_FABR_EXPO: TStringField
      FieldName = 'CD_FABR_EXPO'
      Size = 1
    end
    object tbl_Item_CD_FABRICANTE: TStringField
      FieldName = 'CD_FABRICANTE'
      Size = 5
    end
    object tbl_Item_CD_MERCADORIA: TStringField
      FieldName = 'CD_MERCADORIA'
      Size = 15
    end
    object tbl_Item_CD_NALADI_NCCA: TStringField
      FieldName = 'CD_NALADI_NCCA'
      Size = 7
    end
    object tbl_Item_CD_NALADI_SH: TStringField
      FieldName = 'CD_NALADI_SH'
      Size = 8
    end
    object tbl_Item_CD_NCM_SH: TStringField
      FieldName = 'CD_NCM_SH'
      Size = 11
    end
    object tbl_Item_CD_PAIS_AQUISICAO: TStringField
      FieldName = 'CD_PAIS_AQUISICAO'
      Size = 3
    end
    object tbl_Item_CD_PAIS_ORIGEM: TStringField
      FieldName = 'CD_PAIS_ORIGEM'
      Size = 3
    end
    object tbl_Item_CD_TIPO_CALCULO_ITEM: TStringField
      FieldName = 'CD_TIPO_CALCULO_ITEM'
      Size = 1
    end
    object tbl_Item_NR_FATURA: TStringField
      FieldName = 'NR_FATURA'
      Size = 15
    end
    object tbl_Item_PC_DESCONTO_MERC: TFloatField
      FieldName = 'PC_DESCONTO_MERC'
      Required = True
    end
    object tbl_Item_PL_MERCADORIA: TFloatField
      FieldName = 'PL_MERCADORIA'
      Required = True
    end
    object tbl_Item_QT_MERC_UN_COMERC: TFloatField
      FieldName = 'QT_MERC_UN_COMERC'
      Required = True
    end
    object tbl_Item_QT_MERC_UN_ESTAT: TFloatField
      FieldName = 'QT_MERC_UN_ESTAT'
      Required = True
    end
    object tbl_Item_TX_DESC_DET_MERC: TMemoField
      FieldName = 'TX_DESC_DET_MERC'
      BlobType = ftMemo
    end
    object tbl_Item_VL_DESCONTO_MERC: TFloatField
      FieldName = 'VL_DESCONTO_MERC'
      Required = True
    end
    object tbl_Item_VL_FRETE_ITEM: TFloatField
      FieldName = 'VL_FRETE_ITEM'
      Required = True
    end
    object tbl_Item_VL_MCV_ITEM: TFloatField
      FieldName = 'VL_MCV_ITEM'
      Required = True
    end
    object tbl_Item_VL_MLE_ITEM: TFloatField
      FieldName = 'VL_MLE_ITEM'
      Required = True
    end
    object tbl_Item_VL_SEGURO_ITEM: TFloatField
      FieldName = 'VL_SEGURO_ITEM'
      Required = True
    end
    object tbl_Item_VL_UNID_COND_VENDA: TFloatField
      FieldName = 'VL_UNID_COND_VENDA'
      Required = True
    end
    object tbl_Item_VL_UNITARIO: TFloatField
      FieldName = 'VL_UNITARIO'
      Required = True
    end
    object tbl_Item_NR_OPER_TRAT_PREV: TStringField
      FieldName = 'NR_OPER_TRAT_PREV'
      Size = 10
    end
    object tbl_Item_CD_UN_MED_COMERC: TStringField
      FieldName = 'CD_UN_MED_COMERC'
      Size = 3
    end
  end
  object qry_item_: TQuery
    DatabaseName = 'DBREGIMP'
    SQL.Strings = (
      'SELECT NR_OPER_TRAT_PREV , NR_SEQ_PRODUTO , '
      ' QT_MERC_UN_COMERC , NM_UN_MEDID_COMER , '
      ' VL_UNID_COND_VENDA , TX_DESC_DET_MERC , '
      ' CD_PRODUTO'
      'FROM DETALHE_MERC_COM_TRATAMENTO DETALHE_MERC_COM_TRATAMENTO'
      'WHERE NR_OPER_TRAT_PREV = :NR_OPER_TRAT_PREV')
    Params.Data = {01000100114E525F4F5045525F545241545F505245560001020030000000}
    Left = 48
    Top = 156
    object qry_item_NR_OPER_TRAT_PREV: TStringField
      FieldName = 'NR_OPER_TRAT_PREV'
      Origin = 'DETALHE_MERC_COM_TRATAMENTO.NR_OPER_TRAT_PREV'
      Size = 10
    end
    object qry_item_NR_SEQ_PRODUTO: TStringField
      FieldName = 'NR_SEQ_PRODUTO'
      Origin = 'DETALHE_MERC_COM_TRATAMENTO.NR_SEQ_PRODUTO'
      Size = 2
    end
    object qry_item_QT_MERC_UN_COMERC: TStringField
      FieldName = 'QT_MERC_UN_COMERC'
      Origin = 'DETALHE_MERC_COM_TRATAMENTO.QT_MERC_UN_COMERC'
      Size = 14
    end
    object qry_item_NM_UN_MEDID_COMER: TStringField
      FieldName = 'NM_UN_MEDID_COMER'
      Origin = 'DETALHE_MERC_COM_TRATAMENTO.NM_UN_MEDID_COMER'
    end
    object qry_item_VL_UNID_COND_VENDA: TStringField
      FieldName = 'VL_UNID_COND_VENDA'
      Origin = 'DETALHE_MERC_COM_TRATAMENTO.VL_UNID_COND_VENDA'
      Size = 21
    end
    object qry_item_TX_DESC_DET_MERC: TMemoField
      FieldName = 'TX_DESC_DET_MERC'
      Origin = 'DETALHE_MERC_COM_TRATAMENTO.TX_DESC_DET_MERC'
      BlobType = ftMemo
    end
    object qry_item_CD_PRODUTO: TStringField
      FieldName = 'CD_PRODUTO'
      Origin = 'DETALHE_MERC_COM_TRATAMENTO.CD_PRODUTO'
      Size = 15
    end
  end
  object qry_li_browse: TQuery
    DatabaseName = 'DBREGIMP'
    SQL.Strings = (
      'SELECT NR_OPER_TRAT_PREV, DT_REG_OPER_TRAT, NM_FORN_ESTR'
      'FROM OPERAÇÃO_COM_TRATAMENTO OPERAÇÃO_COM_TRATAMENTO'
      'ORDER BY CONVERT(DATETIME, DT_REG_OPER_TRAT, 103)')
    Left = 168
    Top = 220
    object qry_li_browseNR_OPER_TRAT_PREV: TStringField
      FieldName = 'NR_OPER_TRAT_PREV'
      Origin = 'OPERAÃ€O_COM_TRATAMENTO.NR_OPER_TRAT_PREV'
      EditMask = '99/99999999;0; '
      Size = 10
    end
    object qry_li_browseDT_REG_OPER_TRAT: TStringField
      FieldName = 'DT_REG_OPER_TRAT'
      Origin = 'OPERAÃ€O_COM_TRATAMENTO.DT_REG_OPER_TRAT'
      Size = 10
    end
    object qry_li_browseNM_FORN_ESTR: TStringField
      FieldName = 'NM_FORN_ESTR'
      Origin = 'OPERAÃ€O_COM_TRATAMENTO.NM_FORN_ESTR'
      Size = 60
    end
  end
  object ds_li: TDataSource
    DataSet = qry_li_browse
    Left = 48
    Top = 220
  end
  object sp_di_classifica_item: TStoredProc
    DatabaseName = 'DBDI'
    StoredProcName = 'dbo.sp_di_classifica_item;1'
    Params.Data = {
      0100040006526573756C7404030400FFFFFFFF00010C406E725F70726F636573
      736F01010200300000000A406E725F61646963616F020102003000010008406E
      725F6974656D0201020030000100}
    Left = 168
    Top = 292
    object sp_di_classifica_itemNR_ADICAO: TStringField
      FieldName = 'NR_ADICAO'
      Size = 3
    end
    object sp_di_classifica_itemNR_ITEM: TStringField
      FieldName = 'NR_ITEM'
      Size = 3
    end
  end
  object sp_di_calculo: TStoredProc
    DatabaseName = 'DBDI'
    StoredProcName = 'dbo.sp_di_calculo;1'
    Params.Data = {
      0100020006526573756C74040304000000000000000C406E725F70726F636573
      736F0101020030000000}
    Left = 48
    Top = 292
    object StringField1: TStringField
      FieldName = 'NR_ADICAO'
      Size = 3
    end
    object StringField2: TStringField
      FieldName = 'NR_ITEM'
      Size = 3
    end
  end
  object qry_di_itens_: TQuery
    DatabaseName = 'DBDI'
    RequestLive = True
    SQL.Strings = (
      'SELECT NR_PROCESSO, NR_ADICAO, NR_ITEM'
      'FROM TDETALHE_MERCADORIA'
      'WHERE NR_PROCESSO = :NR_PROCESSO AND'
      '      NR_ADICAO   = :NR_ADICAO AND'
      '      NR_ITEM     = :NR_ITEM')
    Params.Data = {
      010003000B4E525F50524F434553534F0001020030000000094E525F41444943
      414F0001020030000000074E525F4954454D0001020030000000}
    Left = 332
    Top = 28
    object qry_di_itens_NR_PROCESSO: TStringField
      FieldName = 'NR_PROCESSO'
      Origin = 'TDETALHE_MERCADORIA.NR_PROCESSO'
      Size = 11
    end
    object qry_di_itens_NR_ADICAO: TStringField
      FieldName = 'NR_ADICAO'
      Origin = 'TDETALHE_MERCADORIA.NR_ADICAO'
      Size = 3
    end
    object qry_di_itens_NR_ITEM: TStringField
      FieldName = 'NR_ITEM'
      Origin = 'TDETALHE_MERCADORIA.NR_ITEM'
      Size = 3
    end
  end
  object sp_unid_medida: TStoredProc
    DatabaseName = 'DBCAD'
    StoredProcName = 'dbo.sp_unid_medida;1'
    Params.Data = {
      0100030006526573756C740403040000000000000111406E6D5F756E5F6D6564
      5F636F6D65726301010200300000000F4063645F756E69645F6D656469646102
      010100000001}
    Left = 332
    Top = 92
  end
end
