object datm_integracao_risc: Tdatm_integracao_risc
  Left = 200
  Top = 108
  Height = 333
  Width = 385
  object tbl_di_w_: TTable
    DatabaseName = 'DBDI'
    IndexFieldNames = 'NR_PROCESSO'
    TableName = 'TDECLARACAO_IMPORTACAO'
    UpdateMode = upWhereKeyOnly
    Left = 116
    Top = 12
    object tbl_di_w_NR_PROCESSO: TStringField
      FieldName = 'NR_PROCESSO'
      Required = True
      Size = 11
    end
    object tbl_di_w_NR_IDENT_USUARIO: TStringField
      FieldName = 'NR_IDENT_USUARIO'
      Size = 15
    end
    object tbl_di_w_CD_APLICACAO_MERC: TStringField
      FieldName = 'CD_APLICACAO_MERC'
      Size = 1
    end
    object tbl_di_w_CD_BANDEIRA_TRANSP: TStringField
      FieldName = 'CD_BANDEIRA_TRANSP'
      Size = 3
    end
    object tbl_di_w_CD_COBERTURA_CAMBIAL: TStringField
      FieldName = 'CD_COBERTURA_CAMBIAL'
      Size = 1
    end
    object tbl_di_w_CD_DESTAQUE_NCM: TStringField
      FieldName = 'CD_DESTAQUE_NCM'
      Size = 3
    end
    object tbl_di_w_CD_FORMA_PAGAMENTO: TStringField
      FieldName = 'CD_FORMA_PAGAMENTO'
      Size = 1
    end
    object tbl_di_w_CD_FUND_LEGAL_II: TStringField
      FieldName = 'CD_FUND_LEGAL_II'
      Size = 2
    end
    object tbl_di_w_CD_IMPORTADOR: TStringField
      FieldName = 'CD_IMPORTADOR'
      Size = 5
    end
    object tbl_di_w_CD_INCOTERM: TStringField
      FieldName = 'CD_INCOTERM'
      Size = 3
    end
    object tbl_di_w_CD_LOCAL_EMBARQUE: TStringField
      FieldName = 'CD_LOCAL_EMBARQUE'
      Size = 4
    end
    object tbl_di_w_CD_METODO_VALORACAO: TStringField
      FieldName = 'CD_METODO_VALORACAO'
      Size = 2
    end
    object tbl_di_w_CD_MODALIDADE_DESP: TStringField
      FieldName = 'CD_MODALIDADE_DESP'
      Size = 1
    end
    object tbl_di_w_CD_MODALIDADE_PAGTO: TStringField
      FieldName = 'CD_MODALIDADE_PAGTO'
      Size = 2
    end
    object tbl_di_w_CD_MOEDA_DESPESAS: TStringField
      FieldName = 'CD_MOEDA_DESPESAS'
      Size = 3
    end
    object tbl_di_w_CD_MOEDA_FRETE: TStringField
      FieldName = 'CD_MOEDA_FRETE'
      Size = 3
    end
    object tbl_di_w_CD_MOEDA_MLE: TStringField
      FieldName = 'CD_MOEDA_MLE'
      Size = 3
    end
    object tbl_di_w_CD_MOEDA_SEGURO: TStringField
      FieldName = 'CD_MOEDA_SEGURO'
      Size = 3
    end
    object tbl_di_w_CD_MOTIVO_SEM_COBERTURA: TStringField
      FieldName = 'CD_MOTIVO_SEM_COBERTURA'
      Size = 2
    end
    object tbl_di_w_CD_MOTIVO_TRANS: TStringField
      FieldName = 'CD_MOTIVO_TRANS'
      Size = 1
    end
    object tbl_di_w_CD_PAIS_IMPORTADOR: TStringField
      FieldName = 'CD_PAIS_IMPORTADOR'
      Size = 3
    end
    object tbl_di_w_CD_PAIS_PROC_CARGA: TStringField
      FieldName = 'CD_PAIS_PROC_CARGA'
      Size = 3
    end
    object tbl_di_w_CD_RECINTO_ALFAND: TStringField
      FieldName = 'CD_RECINTO_ALFAND'
      Size = 7
    end
    object tbl_di_w_CD_REG_TRIB_II: TStringField
      FieldName = 'CD_REG_TRIB_II'
      Size = 1
    end
    object tbl_di_w_CD_REG_TRIB_IPI: TStringField
      FieldName = 'CD_REG_TRIB_IPI'
      Size = 1
    end
    object tbl_di_w_CD_SETOR_ARMAZENAM: TStringField
      FieldName = 'CD_SETOR_ARMAZENAM'
      Size = 3
    end
    object tbl_di_w_CD_TIPO_AG_CARGA: TStringField
      FieldName = 'CD_TIPO_AG_CARGA'
      Size = 1
    end
    object tbl_di_w_CD_TIPO_CONSIG: TStringField
      FieldName = 'CD_TIPO_CONSIG'
      Size = 1
    end
    object tbl_di_w_CD_TIPO_DCTO_CARGA: TStringField
      FieldName = 'CD_TIPO_DCTO_CARGA'
      Size = 2
    end
    object tbl_di_w_CD_TIPO_DECLARACAO: TStringField
      FieldName = 'CD_TIPO_DECLARACAO'
      Size = 2
    end
    object tbl_di_w_CD_TIPO_IMPORTADOR: TStringField
      FieldName = 'CD_TIPO_IMPORTADOR'
      Size = 1
    end
    object tbl_di_w_CD_TIPO_MANIFESTO: TStringField
      FieldName = 'CD_TIPO_MANIFESTO'
      Size = 1
    end
    object tbl_di_w_CD_TRANSPORTADOR: TStringField
      FieldName = 'CD_TRANSPORTADOR'
      Size = 4
    end
    object tbl_di_w_CD_URF_DESPACHO: TStringField
      FieldName = 'CD_URF_DESPACHO'
      Size = 7
    end
    object tbl_di_w_CD_URF_ENTR_CARGA: TStringField
      FieldName = 'CD_URF_ENTR_CARGA'
      Size = 7
    end
    object tbl_di_w_CD_UTIL_DCTO_CARGA: TStringField
      FieldName = 'CD_UTIL_DCTO_CARGA'
      Size = 1
    end
    object tbl_di_w_CD_VIA_TRANSP_CARG: TStringField
      FieldName = 'CD_VIA_TRANSP_CARG'
      Size = 2
    end
    object tbl_di_w_CD_VINC_IMPO_EXPO: TStringField
      FieldName = 'CD_VINC_IMPO_EXPO'
      Required = True
      Size = 1
    end
    object tbl_di_w_DT_CHEGADA_CARGA: TStringField
      FieldName = 'DT_CHEGADA_CARGA'
      Size = 8
    end
    object tbl_di_w_DT_EMBARQUE: TStringField
      FieldName = 'DT_EMBARQUE'
      Size = 8
    end
    object tbl_di_w_DT_PROCESSAMENTO: TStringField
      FieldName = 'DT_PROCESSAMENTO'
      Size = 8
    end
    object tbl_di_w_DT_REGISTRO_DI: TStringField
      FieldName = 'DT_REGISTRO_DI'
      Size = 8
    end
    object tbl_di_w_DT_TRANSMISSAO: TStringField
      FieldName = 'DT_TRANSMISSAO'
      Size = 8
    end
    object tbl_di_w_IN_BEM_ENCOMENDA: TBooleanField
      FieldName = 'IN_BEM_ENCOMENDA'
      Required = True
    end
    object tbl_di_w_IN_MATERIAL_USADO: TBooleanField
      FieldName = 'IN_MATERIAL_USADO'
      Required = True
    end
    object tbl_di_w_IN_MOEDA_NACIONAL: TStringField
      FieldName = 'IN_MOEDA_NACIONAL'
      Required = True
      Size = 1
    end
    object tbl_di_w_IN_MOEDA_UNICA: TBooleanField
      FieldName = 'IN_MOEDA_UNICA'
      Required = True
    end
    object tbl_di_w_IN_MULTIMODAL: TBooleanField
      FieldName = 'IN_MULTIMODAL'
      Required = True
    end
    object tbl_di_w_IN_OPERACAO_FUNDAP: TBooleanField
      FieldName = 'IN_OPERACAO_FUNDAP'
      Required = True
    end
    object tbl_di_w_IN_RATEAR_FRETE_ITENS: TBooleanField
      FieldName = 'IN_RATEAR_FRETE_ITENS'
      Required = True
    end
    object tbl_di_w_IN_RATEAR_SEGURO_ITENS: TBooleanField
      FieldName = 'IN_RATEAR_SEGURO_ITENS'
      Required = True
    end
    object tbl_di_w_IN_REPASSA_DADOS_ADICAO: TBooleanField
      FieldName = 'IN_REPASSA_DADOS_ADICAO'
      Required = True
    end
    object tbl_di_w_IN_REPASSA_DADOS_CAMBIO: TBooleanField
      FieldName = 'IN_REPASSA_DADOS_CAMBIO'
      Required = True
    end
    object tbl_di_w_NM_CONSIGNATARIO: TStringField
      FieldName = 'NM_CONSIGNATARIO'
      Size = 60
    end
    object tbl_di_w_NM_VEICULO_TRANSP: TStringField
      FieldName = 'NM_VEICULO_TRANSP'
      Size = 30
    end
    object tbl_di_w_NR_AGENTE_CARGA: TStringField
      FieldName = 'NR_AGENTE_CARGA'
      Size = 14
    end
    object tbl_di_w_NR_BANCO_COM: TStringField
      FieldName = 'NR_BANCO_COM'
      Size = 5
    end
    object tbl_di_w_NR_BANCO_PAGAMENTO: TStringField
      FieldName = 'NR_BANCO_PAGAMENTO'
      Size = 5
    end
    object tbl_di_w_NR_COMPRADOR_ME: TStringField
      FieldName = 'NR_COMPRADOR_ME'
      Size = 14
    end
    object tbl_di_w_NR_CONSIGNATARIO: TStringField
      FieldName = 'NR_CONSIGNATARIO'
      Size = 14
    end
    object tbl_di_w_NR_CONTRATO_CAMBIO: TStringField
      FieldName = 'NR_CONTRATO_CAMBIO'
      Size = 8
    end
    object tbl_di_w_NR_CPF_REPR_LEGAL: TStringField
      FieldName = 'NR_CPF_REPR_LEGAL'
      Size = 11
    end
    object tbl_di_w_NR_DCTO_CARGA: TStringField
      FieldName = 'NR_DCTO_CARGA'
      Size = 18
    end
    object tbl_di_w_NR_DCTO_CARGA_MAST: TStringField
      FieldName = 'NR_DCTO_CARGA_MAST'
      Size = 18
    end
    object tbl_di_w_NR_DECL_IMP_PROT: TStringField
      FieldName = 'NR_DECL_IMP_PROT'
      Size = 10
    end
    object tbl_di_w_NR_DECLARACAO_IMP: TStringField
      FieldName = 'NR_DECLARACAO_IMP'
      Size = 10
    end
    object tbl_di_w_NR_IDENTIFICACAO_COM: TStringField
      FieldName = 'NR_IDENTIFICACAO_COM'
      Size = 14
    end
    object tbl_di_w_NR_MANIFESTO: TStringField
      FieldName = 'NR_MANIFESTO'
      Size = 15
    end
    object tbl_di_w_NR_PRACA_COM: TStringField
      FieldName = 'NR_PRACA_COM'
      Size = 4
    end
    object tbl_di_w_NR_PRACA_PAGAMENTO: TStringField
      FieldName = 'NR_PRACA_PAGAMENTO'
      Size = 5
    end
    object tbl_di_w_NR_ROF: TStringField
      FieldName = 'NR_ROF'
      Size = 8
    end
    object tbl_di_w_NR_VEICULO_TRANSP: TStringField
      FieldName = 'NR_VEICULO_TRANSP'
      Size = 15
    end
    object tbl_di_w_PB_CARGA: TFloatField
      FieldName = 'PB_CARGA'
      Required = True
    end
    object tbl_di_w_PC_COMISSAO: TFloatField
      FieldName = 'PC_COMISSAO'
      Required = True
    end
    object tbl_di_w_PC_ICMS: TFloatField
      FieldName = 'PC_ICMS'
      Required = True
    end
    object tbl_di_w_PC_REDUCAO_ICMS: TFloatField
      FieldName = 'PC_REDUCAO_ICMS'
      Required = True
    end
    object tbl_di_w_PL_CARGA: TFloatField
      FieldName = 'PL_CARGA'
      Required = True
    end
    object tbl_di_w_QT_ADICOES: TIntegerField
      FieldName = 'QT_ADICOES'
      Required = True
    end
    object tbl_di_w_TX_INFO_COMPL: TMemoField
      FieldName = 'TX_INFO_COMPL'
      BlobType = ftMemo
    end
    object tbl_di_w_VL_FRETE_TNAC_MNEG: TFloatField
      FieldName = 'VL_FRETE_TNAC_MNEG'
      Required = True
    end
    object tbl_di_w_VL_TOT_DESPS_MN: TFloatField
      FieldName = 'VL_TOT_DESPS_MN'
      Required = True
    end
    object tbl_di_w_VL_TOT_DESPS_MNEG: TFloatField
      FieldName = 'VL_TOT_DESPS_MNEG'
      Required = True
    end
    object tbl_di_w_VL_TOT_FRT_COLLECT: TFloatField
      FieldName = 'VL_TOT_FRT_COLLECT'
      Required = True
    end
    object tbl_di_w_VL_TOT_FRT_PREPAID: TFloatField
      FieldName = 'VL_TOT_FRT_PREPAID'
      Required = True
    end
    object tbl_di_w_VL_TOT_MLE_MNEG: TFloatField
      FieldName = 'VL_TOT_MLE_MNEG'
      Required = True
    end
    object tbl_di_w_VL_TOT_SEGURO_MNEG: TFloatField
      FieldName = 'VL_TOT_SEGURO_MNEG'
      Required = True
    end
    object tbl_di_w_VL_TOTAL_FRETE_MN: TFloatField
      FieldName = 'VL_TOTAL_FRETE_MN'
      Required = True
    end
    object tbl_di_w_VL_TOTAL_MLE_MN: TFloatField
      FieldName = 'VL_TOTAL_MLE_MN'
      Required = True
    end
    object tbl_di_w_VL_TOTAL_SEG_MN: TFloatField
      FieldName = 'VL_TOTAL_SEG_MN'
      Required = True
    end
    object tbl_di_w_PC_SEGURO_MLE: TFloatField
      FieldName = 'PC_SEGURO_MLE'
    end
    object tbl_di_w_VL_TOTAL_II: TFloatField
      FieldName = 'VL_TOTAL_II'
    end
    object tbl_di_w_VL_TOTAL_IPI: TFloatField
      FieldName = 'VL_TOTAL_IPI'
    end
    object tbl_di_w_VL_TOTAL_AD: TFloatField
      FieldName = 'VL_TOTAL_AD'
    end
    object tbl_di_w_DT_ULTIMA_ALTERACAO: TDateTimeField
      FieldName = 'DT_ULTIMA_ALTERACAO'
    end
    object tbl_di_w_IN_RISC_ATUALIZADO: TStringField
      FieldName = 'IN_RISC_ATUALIZADO'
      Size = 1
    end
    object tbl_di_w_CD_TIPO_BASE_SEGURO: TStringField
      FieldName = 'CD_TIPO_BASE_SEGURO'
      Size = 1
    end
    object tbl_di_w_IN_REB: TStringField
      FieldName = 'IN_REB'
      Size = 1
    end
    object tbl_di_w_VL_TOT_ICMS: TFloatField
      FieldName = 'VL_TOT_ICMS'
    end
    object tbl_di_w_CD_TIPO_PGTO_TRIB: TStringField
      FieldName = 'CD_TIPO_PGTO_TRIB'
      Size = 1
    end
    object tbl_di_w_NR_CONTA_PGTO_TRIB: TStringField
      FieldName = 'NR_CONTA_PGTO_TRIB'
      Size = 19
    end
    object tbl_di_w_TX_MLE: TFloatField
      FieldName = 'TX_MLE'
    end
    object tbl_di_w_TX_FRETE: TFloatField
      FieldName = 'TX_FRETE'
    end
    object tbl_di_w_TX_SEGURO: TFloatField
      FieldName = 'TX_SEGURO'
    end
    object tbl_di_w_TX_DOLAR: TFloatField
      FieldName = 'TX_DOLAR'
    end
    object tbl_di_w_NR_REF_CLI: TStringField
      FieldName = 'NR_REF_CLI'
      Size = 15
    end
    object tbl_di_w_IN_SISCOMEX: TStringField
      FieldName = 'IN_SISCOMEX'
      Size = 1
    end
    object tbl_di_w_CD_TIPO_ICMS: TStringField
      FieldName = 'CD_TIPO_ICMS'
      Size = 1
    end
    object tbl_di_w_IN_ICMS_IMPRESSO: TStringField
      FieldName = 'IN_ICMS_IMPRESSO'
      Size = 1
    end
    object tbl_di_w_DT_ICMS_IMPRESSO: TDateTimeField
      FieldName = 'DT_ICMS_IMPRESSO'
    end
  end
  object qry_armazem_: TQuery
    DatabaseName = 'DBDI'
    SQL.Strings = (
      'SELECT NR_PROCESSO , NM_ARMAZEM_CARGA'
      'FROM TCARGA_ARMAZEM TCARGA_ARMAZEM'
      ' WHERE NR_PROCESSO = :NR_PROCESSO')
    Params.Data = {010001000B4E525F50524F434553534F0001020030000000}
    Left = 116
    Top = 64
    object qry_armazem_NR_PROCESSO: TStringField
      FieldName = 'NR_PROCESSO'
      Origin = 'TCARGA_ARMAZEM.NR_PROCESSO'
      Size = 11
    end
    object qry_armazem_NM_ARMAZEM_CARGA: TStringField
      FieldName = 'NM_ARMAZEM_CARGA'
      Origin = 'TCARGA_ARMAZEM.NM_ARMAZEM_CARGA'
      Size = 10
    end
  end
  object qry_adicao_: TQuery
    DatabaseName = 'DBDI'
    SQL.Strings = (
      'SELECT NR_PROCESSO , NR_ADICAO , CD_ACORDO_ALADI , '
      ' CD_AGENC_AGENT_IMP , CD_APLICACAO_MERC , '
      ' CD_AUSENCIA_FABRIC , '
      ' CD_BANC_AGENTE_IMP , CD_COBERT_CAMBIAL , '
      ' CD_FUND_LEG_REGIME , '
      ' CD_INCOTERMS_VENDA , CD_LOC_COND_VENDA , '
      ' CD_MD_FRETE_MERC , CD_MERC_NALADI_NCC , '
      ' CD_MERC_NALADI_SH , CD_MERC_NBM_SH , '
      ' CD_MERCADORIA_NCM ,  CD_NCM_SH ,'
      ' CD_METOD_VALORACAO , '
      ' CD_MODALIDADE_PGTO , '
      ' CD_MOEDA_NEGOCIADA , CD_MOEDA_SEG_MERC , '
      ' CD_MOTIVO_SEM_COB , '
      ' CD_ORGAO_FIN_INTER , '
      ' CD_PAIS_AQUIS_MERC , CD_PAIS_ORIG_MERC , '
      ' CD_PAIS_PROC_MERC , CD_REGIME_TRIBUTAR , '
      ' CD_TAXA_JUROS , CD_TIPO_ACORDO_TAR , '
      ' CD_TIPO_AGENTE_IMP , CD_URF_ENTR_MERC , '
      ' CD_VIA_TRANSPORTE , CD_VINC_IMPO_EXPO , '
      ' ED_CIDAD_FABRIC , ED_CIDAD_FORN_ESTR , '
      ' ED_COMPL_FABRIC , ED_COMPL_FORN_ESTR , '
      ' ED_ESTAD_FORN_ESTR , ED_ESTADO_FABRIC , '
      ' ED_LOGR_FABRIC , ED_LOGR_FORN_ESTR , '
      ' ED_NR_FABRIC , ED_NR_FORN_ESTR , '
      ' IN_BEM_ENCOMENDA , '
      ' IN_JUROS_ATE_360 , IN_MATERIAL_USADO , '
      ' IN_PGTO_VARIAV_360 , '
      ' NM_FABRICANTE_MERC , NM_FORN_ESTR , '
      ' NR_AGENTE_IMP , NR_DCTO_REDUCAO , '
      ' NR_OPER_TRAT_PREV , NR_ROF , '
      ' PC_COEF_REDUC_II , PC_COMISSAO_AG_IMP , '
      ' PC_TAXA_JUROS , PL_MERCADORIA , '
      ' QT_ITENS_ADICAO , QT_PARC_FINANC_360 , '
      ' QT_PERIOD_PGTO_360 , QT_UN_ESTATISTICA , '
      ' CD_PERIOD_PGTO_360, VL_CALC_DCR_DOLAR , '
      ' VL_COMISSAO_AG_IMP , '
      ' VL_FINANC_SUP_360 , VL_FRETE_MERC_MN , '
      ' VL_FRETE_MERC_MNEG , VL_II_A_REC_ZFM , '
      ' VL_II_CALC_DCR_MN , VL_II_DEVIDO_ZFM , '
      ' VL_MERC_COND_VENDA , VL_MERC_EMB_MN , '
      ' VL_MERC_VENDA_MN , '
      ' VL_SEG_MERC_MN , VL_SEG_MERC_MNEG , '
      ' VL_TOT_FINANC_360 ,  CD_MOTIVO_ADM_TEMP, '
      ' vl_merc_loc_emb_mneg,  vl_merc_loc_emb_mn,'
      ' TX_COMPL_VL_ADUAN'
      'FROM TADICAO_DE_IMPORTACAO TADICAO_DE_IMPORTACAO'
      ' WHERE NR_PROCESSO = :NR_PROCESSO')
    Params.Data = {010001000B4E525F50524F434553534F0001020030000000}
    Left = 200
    Top = 13
    object qry_adicao_NR_PROCESSO: TStringField
      FieldName = 'NR_PROCESSO'
      Origin = 'TADICAO_DE_IMPORTACAO.NR_PROCESSO'
      Size = 11
    end
    object qry_adicao_NR_ADICAO: TStringField
      FieldName = 'NR_ADICAO'
      Origin = 'TADICAO_DE_IMPORTACAO.NR_ADICAO'
      Size = 3
    end
    object qry_adicao_CD_ACORDO_ALADI: TStringField
      FieldName = 'CD_ACORDO_ALADI'
      Origin = 'TADICAO_DE_IMPORTACAO.CD_ACORDO_ALADI'
      Size = 3
    end
    object qry_adicao_CD_AGENC_AGENT_IMP: TStringField
      FieldName = 'CD_AGENC_AGENT_IMP'
      Origin = 'TADICAO_DE_IMPORTACAO.CD_AGENC_AGENT_IMP'
      Size = 4
    end
    object qry_adicao_CD_APLICACAO_MERC: TStringField
      FieldName = 'CD_APLICACAO_MERC'
      Origin = 'TADICAO_DE_IMPORTACAO.CD_APLICACAO_MERC'
      Size = 1
    end
    object qry_adicao_CD_AUSENCIA_FABRIC: TStringField
      FieldName = 'CD_AUSENCIA_FABRIC'
      Origin = 'TADICAO_DE_IMPORTACAO.CD_AUSENCIA_FABRIC'
      Size = 1
    end
    object qry_adicao_CD_BANC_AGENTE_IMP: TStringField
      FieldName = 'CD_BANC_AGENTE_IMP'
      Origin = 'TADICAO_DE_IMPORTACAO.CD_BANC_AGENTE_IMP'
      Size = 5
    end
    object qry_adicao_CD_COBERT_CAMBIAL: TStringField
      FieldName = 'CD_COBERT_CAMBIAL'
      Origin = 'TADICAO_DE_IMPORTACAO.CD_COBERT_CAMBIAL'
      Size = 1
    end
    object qry_adicao_CD_FUND_LEG_REGIME: TStringField
      FieldName = 'CD_FUND_LEG_REGIME'
      Origin = 'TADICAO_DE_IMPORTACAO.CD_FUND_LEG_REGIME'
      Size = 2
    end
    object qry_adicao_CD_INCOTERMS_VENDA: TStringField
      FieldName = 'CD_INCOTERMS_VENDA'
      Origin = 'TADICAO_DE_IMPORTACAO.CD_INCOTERMS_VENDA'
      Size = 3
    end
    object qry_adicao_CD_LOC_COND_VENDA: TStringField
      FieldName = 'CD_LOC_COND_VENDA'
      Origin = 'TADICAO_DE_IMPORTACAO.CD_LOC_COND_VENDA'
      Size = 4
    end
    object qry_adicao_CD_MD_FRETE_MERC: TStringField
      FieldName = 'CD_MD_FRETE_MERC'
      Origin = 'TADICAO_DE_IMPORTACAO.CD_MD_FRETE_MERC'
      Size = 3
    end
    object qry_adicao_CD_MERC_NALADI_NCC: TStringField
      FieldName = 'CD_MERC_NALADI_NCC'
      Origin = 'TADICAO_DE_IMPORTACAO.CD_MERC_NALADI_NCC'
      Size = 7
    end
    object qry_adicao_CD_MERC_NALADI_SH: TStringField
      FieldName = 'CD_MERC_NALADI_SH'
      Origin = 'TADICAO_DE_IMPORTACAO.CD_MERC_NALADI_SH'
      Size = 8
    end
    object qry_adicao_CD_MERC_NBM_SH: TStringField
      FieldName = 'CD_MERC_NBM_SH'
      Origin = 'TADICAO_DE_IMPORTACAO.CD_MERC_NBM_SH'
      Size = 8
    end
    object qry_adicao_CD_MERCADORIA_NCM: TStringField
      FieldName = 'CD_MERCADORIA_NCM'
      Origin = 'TADICAO_DE_IMPORTACAO.CD_MERCADORIA_NCM'
      Size = 11
    end
    object qry_adicao_CD_METOD_VALORACAO: TStringField
      FieldName = 'CD_METOD_VALORACAO'
      Origin = 'TADICAO_DE_IMPORTACAO.CD_METOD_VALORACAO'
      Size = 2
    end
    object qry_adicao_CD_MODALIDADE_PGTO: TStringField
      FieldName = 'CD_MODALIDADE_PGTO'
      Origin = 'TADICAO_DE_IMPORTACAO.CD_MODALIDADE_PGTO'
      Size = 2
    end
    object qry_adicao_CD_MOEDA_NEGOCIADA: TStringField
      FieldName = 'CD_MOEDA_NEGOCIADA'
      Origin = 'TADICAO_DE_IMPORTACAO.CD_MOEDA_NEGOCIADA'
      Size = 3
    end
    object qry_adicao_CD_MOEDA_SEG_MERC: TStringField
      FieldName = 'CD_MOEDA_SEG_MERC'
      Origin = 'TADICAO_DE_IMPORTACAO.CD_MOEDA_SEG_MERC'
      Size = 3
    end
    object qry_adicao_CD_MOTIVO_SEM_COB: TStringField
      FieldName = 'CD_MOTIVO_SEM_COB'
      Origin = 'TADICAO_DE_IMPORTACAO.CD_MOTIVO_SEM_COB'
      Size = 2
    end
    object qry_adicao_CD_ORGAO_FIN_INTER: TStringField
      FieldName = 'CD_ORGAO_FIN_INTER'
      Origin = 'TADICAO_DE_IMPORTACAO.CD_ORGAO_FIN_INTER'
      Size = 2
    end
    object qry_adicao_CD_PAIS_AQUIS_MERC: TStringField
      FieldName = 'CD_PAIS_AQUIS_MERC'
      Origin = 'TADICAO_DE_IMPORTACAO.CD_PAIS_AQUIS_MERC'
      Size = 3
    end
    object qry_adicao_CD_PAIS_ORIG_MERC: TStringField
      FieldName = 'CD_PAIS_ORIG_MERC'
      Origin = 'TADICAO_DE_IMPORTACAO.CD_PAIS_ORIG_MERC'
      Size = 3
    end
    object qry_adicao_CD_PAIS_PROC_MERC: TStringField
      FieldName = 'CD_PAIS_PROC_MERC'
      Origin = 'TADICAO_DE_IMPORTACAO.CD_PAIS_PROC_MERC'
      Size = 3
    end
    object qry_adicao_CD_REGIME_TRIBUTAR: TStringField
      FieldName = 'CD_REGIME_TRIBUTAR'
      Origin = 'TADICAO_DE_IMPORTACAO.CD_REGIME_TRIBUTAR'
      Size = 1
    end
    object qry_adicao_CD_TAXA_JUROS: TStringField
      FieldName = 'CD_TAXA_JUROS'
      Origin = 'TADICAO_DE_IMPORTACAO.CD_TAXA_JUROS'
      Size = 4
    end
    object qry_adicao_CD_TIPO_ACORDO_TAR: TStringField
      FieldName = 'CD_TIPO_ACORDO_TAR'
      Origin = 'TADICAO_DE_IMPORTACAO.CD_TIPO_ACORDO_TAR'
      Size = 1
    end
    object qry_adicao_CD_TIPO_AGENTE_IMP: TStringField
      FieldName = 'CD_TIPO_AGENTE_IMP'
      Origin = 'TADICAO_DE_IMPORTACAO.CD_TIPO_AGENTE_IMP'
      Size = 1
    end
    object qry_adicao_CD_URF_ENTR_MERC: TStringField
      FieldName = 'CD_URF_ENTR_MERC'
      Origin = 'TADICAO_DE_IMPORTACAO.CD_URF_ENTR_MERC'
      Size = 7
    end
    object qry_adicao_CD_VIA_TRANSPORTE: TStringField
      FieldName = 'CD_VIA_TRANSPORTE'
      Origin = 'TADICAO_DE_IMPORTACAO.CD_VIA_TRANSPORTE'
      Size = 2
    end
    object qry_adicao_CD_VINC_IMPO_EXPO: TStringField
      FieldName = 'CD_VINC_IMPO_EXPO'
      Origin = 'TADICAO_DE_IMPORTACAO.CD_VINC_IMPO_EXPO'
      Size = 1
    end
    object qry_adicao_ED_CIDAD_FABRIC: TStringField
      FieldName = 'ED_CIDAD_FABRIC'
      Origin = 'TADICAO_DE_IMPORTACAO.ED_CIDAD_FABRIC'
      Size = 25
    end
    object qry_adicao_ED_CIDAD_FORN_ESTR: TStringField
      FieldName = 'ED_CIDAD_FORN_ESTR'
      Origin = 'TADICAO_DE_IMPORTACAO.ED_CIDAD_FORN_ESTR'
      Size = 25
    end
    object qry_adicao_ED_COMPL_FABRIC: TStringField
      FieldName = 'ED_COMPL_FABRIC'
      Origin = 'TADICAO_DE_IMPORTACAO.ED_COMPL_FABRIC'
      Size = 21
    end
    object qry_adicao_ED_COMPL_FORN_ESTR: TStringField
      FieldName = 'ED_COMPL_FORN_ESTR'
      Origin = 'TADICAO_DE_IMPORTACAO.ED_COMPL_FORN_ESTR'
      Size = 21
    end
    object qry_adicao_ED_ESTAD_FORN_ESTR: TStringField
      FieldName = 'ED_ESTAD_FORN_ESTR'
      Origin = 'TADICAO_DE_IMPORTACAO.ED_ESTAD_FORN_ESTR'
      Size = 25
    end
    object qry_adicao_ED_ESTADO_FABRIC: TStringField
      FieldName = 'ED_ESTADO_FABRIC'
      Origin = 'TADICAO_DE_IMPORTACAO.ED_ESTADO_FABRIC'
      Size = 25
    end
    object qry_adicao_ED_LOGR_FABRIC: TStringField
      FieldName = 'ED_LOGR_FABRIC'
      Origin = 'TADICAO_DE_IMPORTACAO.ED_LOGR_FABRIC'
      Size = 40
    end
    object qry_adicao_ED_LOGR_FORN_ESTR: TStringField
      FieldName = 'ED_LOGR_FORN_ESTR'
      Origin = 'TADICAO_DE_IMPORTACAO.ED_LOGR_FORN_ESTR'
      Size = 40
    end
    object qry_adicao_ED_NR_FABRIC: TStringField
      FieldName = 'ED_NR_FABRIC'
      Origin = 'TADICAO_DE_IMPORTACAO.ED_NR_FABRIC'
      Size = 6
    end
    object qry_adicao_ED_NR_FORN_ESTR: TStringField
      FieldName = 'ED_NR_FORN_ESTR'
      Origin = 'TADICAO_DE_IMPORTACAO.ED_NR_FORN_ESTR'
      Size = 6
    end
    object qry_adicao_IN_BEM_ENCOMENDA: TBooleanField
      FieldName = 'IN_BEM_ENCOMENDA'
      Origin = 'TADICAO_DE_IMPORTACAO.IN_BEM_ENCOMENDA'
    end
    object qry_adicao_IN_JUROS_ATE_360: TBooleanField
      FieldName = 'IN_JUROS_ATE_360'
      Origin = 'TADICAO_DE_IMPORTACAO.IN_JUROS_ATE_360'
    end
    object qry_adicao_IN_MATERIAL_USADO: TBooleanField
      FieldName = 'IN_MATERIAL_USADO'
      Origin = 'TADICAO_DE_IMPORTACAO.IN_MATERIAL_USADO'
    end
    object qry_adicao_IN_PGTO_VARIAV_360: TBooleanField
      FieldName = 'IN_PGTO_VARIAV_360'
      Origin = 'TADICAO_DE_IMPORTACAO.IN_PGTO_VARIAV_360'
    end
    object qry_adicao_NM_FABRICANTE_MERC: TStringField
      FieldName = 'NM_FABRICANTE_MERC'
      Origin = 'TADICAO_DE_IMPORTACAO.NM_FABRICANTE_MERC'
      Size = 60
    end
    object qry_adicao_NM_FORN_ESTR: TStringField
      FieldName = 'NM_FORN_ESTR'
      Origin = 'TADICAO_DE_IMPORTACAO.NM_FORN_ESTR'
      Size = 60
    end
    object qry_adicao_NR_AGENTE_IMP: TStringField
      FieldName = 'NR_AGENTE_IMP'
      Origin = 'TADICAO_DE_IMPORTACAO.NR_AGENTE_IMP'
      Size = 14
    end
    object qry_adicao_NR_DCTO_REDUCAO: TStringField
      FieldName = 'NR_DCTO_REDUCAO'
      Origin = 'TADICAO_DE_IMPORTACAO.NR_DCTO_REDUCAO'
      Size = 8
    end
    object qry_adicao_NR_OPER_TRAT_PREV: TStringField
      FieldName = 'NR_OPER_TRAT_PREV'
      Origin = 'TADICAO_DE_IMPORTACAO.NR_OPER_TRAT_PREV'
      Size = 10
    end
    object qry_adicao_NR_ROF: TStringField
      FieldName = 'NR_ROF'
      Origin = 'TADICAO_DE_IMPORTACAO.NR_ROF'
      Size = 8
    end
    object qry_adicao_PC_COEF_REDUC_II: TFloatField
      FieldName = 'PC_COEF_REDUC_II'
      Origin = 'TADICAO_DE_IMPORTACAO.PC_COEF_REDUC_II'
    end
    object qry_adicao_PC_COMISSAO_AG_IMP: TFloatField
      FieldName = 'PC_COMISSAO_AG_IMP'
      Origin = 'TADICAO_DE_IMPORTACAO.PC_COMISSAO_AG_IMP'
    end
    object qry_adicao_PC_TAXA_JUROS: TFloatField
      FieldName = 'PC_TAXA_JUROS'
      Origin = 'TADICAO_DE_IMPORTACAO.PC_TAXA_JUROS'
    end
    object qry_adicao_PL_MERCADORIA: TFloatField
      FieldName = 'PL_MERCADORIA'
      Origin = 'TADICAO_DE_IMPORTACAO.PL_MERCADORIA'
    end
    object qry_adicao_QT_ITENS_ADICAO: TIntegerField
      FieldName = 'QT_ITENS_ADICAO'
      Origin = 'TADICAO_DE_IMPORTACAO.QT_ITENS_ADICAO'
    end
    object qry_adicao_CD_PERIOD_PGTO_360: TStringField
      FieldName = 'CD_PERIOD_PGTO_360'
      Origin = 'TADICAO_DE_IMPORTACAO.NR_PROCESSO'
      Size = 1
    end
    object qry_adicao_QT_PARC_FINANC_360: TIntegerField
      FieldName = 'QT_PARC_FINANC_360'
      Origin = 'TADICAO_DE_IMPORTACAO.QT_PARC_FINANC_360'
    end
    object qry_adicao_QT_PERIOD_PGTO_360: TIntegerField
      FieldName = 'QT_PERIOD_PGTO_360'
      Origin = 'TADICAO_DE_IMPORTACAO.QT_PERIOD_PGTO_360'
    end
    object qry_adicao_QT_UN_ESTATISTICA: TFloatField
      FieldName = 'QT_UN_ESTATISTICA'
      Origin = 'TADICAO_DE_IMPORTACAO.QT_UN_ESTATISTICA'
    end
    object qry_adicao_VL_CALC_DCR_DOLAR: TFloatField
      FieldName = 'VL_CALC_DCR_DOLAR'
      Origin = 'TADICAO_DE_IMPORTACAO.VL_CALC_DCR_DOLAR'
    end
    object qry_adicao_VL_COMISSAO_AG_IMP: TFloatField
      FieldName = 'VL_COMISSAO_AG_IMP'
      Origin = 'TADICAO_DE_IMPORTACAO.VL_COMISSAO_AG_IMP'
    end
    object qry_adicao_VL_FINANC_SUP_360: TFloatField
      FieldName = 'VL_FINANC_SUP_360'
      Origin = 'TADICAO_DE_IMPORTACAO.VL_FINANC_SUP_360'
    end
    object qry_adicao_VL_FRETE_MERC_MN: TFloatField
      FieldName = 'VL_FRETE_MERC_MN'
      Origin = 'TADICAO_DE_IMPORTACAO.VL_FRETE_MERC_MN'
    end
    object qry_adicao_VL_FRETE_MERC_MNEG: TFloatField
      FieldName = 'VL_FRETE_MERC_MNEG'
      Origin = 'TADICAO_DE_IMPORTACAO.VL_FRETE_MERC_MNEG'
    end
    object qry_adicao_VL_II_A_REC_ZFM: TFloatField
      FieldName = 'VL_II_A_REC_ZFM'
      Origin = 'TADICAO_DE_IMPORTACAO.VL_II_A_REC_ZFM'
    end
    object qry_adicao_VL_II_CALC_DCR_MN: TFloatField
      FieldName = 'VL_II_CALC_DCR_MN'
      Origin = 'TADICAO_DE_IMPORTACAO.VL_II_CALC_DCR_MN'
    end
    object qry_adicao_VL_II_DEVIDO_ZFM: TFloatField
      FieldName = 'VL_II_DEVIDO_ZFM'
      Origin = 'TADICAO_DE_IMPORTACAO.VL_II_DEVIDO_ZFM'
    end
    object qry_adicao_VL_MERC_COND_VENDA: TFloatField
      FieldName = 'VL_MERC_COND_VENDA'
      Origin = 'TADICAO_DE_IMPORTACAO.VL_MERC_COND_VENDA'
    end
    object qry_adicao_VL_MERC_EMB_MN: TFloatField
      FieldName = 'VL_MERC_EMB_MN'
      Origin = 'TADICAO_DE_IMPORTACAO.VL_MERC_EMB_MN'
    end
    object qry_adicao_VL_MERC_VENDA_MN: TFloatField
      FieldName = 'VL_MERC_VENDA_MN'
      Origin = 'TADICAO_DE_IMPORTACAO.VL_MERC_VENDA_MN'
    end
    object qry_adicao_VL_SEG_MERC_MN: TFloatField
      FieldName = 'VL_SEG_MERC_MN'
      Origin = 'TADICAO_DE_IMPORTACAO.VL_SEG_MERC_MN'
    end
    object qry_adicao_VL_SEG_MERC_MNEG: TFloatField
      FieldName = 'VL_SEG_MERC_MNEG'
      Origin = 'TADICAO_DE_IMPORTACAO.VL_SEG_MERC_MNEG'
    end
    object qry_adicao_VL_TOT_FINANC_360: TFloatField
      FieldName = 'VL_TOT_FINANC_360'
      Origin = 'TADICAO_DE_IMPORTACAO.VL_TOT_FINANC_360'
    end
    object qry_adicao_TX_COMPL_VL_ADUAN: TStringField
      FieldName = 'TX_COMPL_VL_ADUAN'
      Origin = 'TADICAO_DE_IMPORTACAO.NR_PROCESSO'
      Size = 250
    end
    object qry_adicao_CD_MOTIVO_ADM_TEMP: TStringField
      FieldName = 'CD_MOTIVO_ADM_TEMP'
      Origin = 'TADICAO_DE_IMPORTACAO.NR_PROCESSO'
      Size = 2
    end
    object qry_adicao_CD_NCM_SH: TStringField
      FieldName = 'CD_NCM_SH'
      Origin = 'TADICAO_DE_IMPORTACAO.NR_PROCESSO'
      Size = 8
    end
    object qry_adicao_vl_merc_loc_emb_mneg: TFloatField
      FieldName = 'vl_merc_loc_emb_mneg'
      Origin = 'TADICAO_DE_IMPORTACAO.NR_PROCESSO'
    end
    object qry_adicao_vl_merc_loc_emb_mn: TFloatField
      FieldName = 'vl_merc_loc_emb_mn'
      Origin = 'TADICAO_DE_IMPORTACAO.NR_ADICAO'
    end
  end
  object qry_trib_ii_: TQuery
    DatabaseName = 'DBDI'
    SQL.Strings = (
      'SELECT NR_PROCESSO , NR_ADICAO , '
      ' CD_RECEITA_IMPOSTO , CD_TIPO_ALIQ_IPT , '
      ' VL_BASE_CALC_ADVAL , '
      ' PC_ALIQ_NORM_ADVAL , PC_ALIQ_REDUZIDA , '
      ' PC_REDUCAO_IPT_BLI , '
      ' PC_ALIQ_ACOR_TARIF , VL_IPT_A_RECOLHER'
      'FROM TRIBUTO TRIBUTO'
      'WHERE NR_PROCESSO = :NR_PROCESSO AND'
      ' NR_ADICAO = :NR_ADICAO AND'
      ' CD_RECEITA_IMPOSTO = '#39'0001'#39)
    Params.Data = {
      010002000B4E525F50524F434553534F0001020030000000094E525F41444943
      414F0001020030000000}
    Left = 284
    Top = 16
    object qry_trib_ii_NR_PROCESSO: TStringField
      FieldName = 'NR_PROCESSO'
      Origin = 'TRIBUTO.NR_PROCESSO'
      Size = 11
    end
    object qry_trib_ii_NR_ADICAO: TStringField
      FieldName = 'NR_ADICAO'
      Origin = 'TRIBUTO.NR_ADICAO'
      Size = 3
    end
    object qry_trib_ii_CD_RECEITA_IMPOSTO: TStringField
      FieldName = 'CD_RECEITA_IMPOSTO'
      Origin = 'TRIBUTO.CD_RECEITA_IMPOSTO'
      Size = 4
    end
    object qry_trib_ii_CD_TIPO_ALIQ_IPT: TStringField
      FieldName = 'CD_TIPO_ALIQ_IPT'
      Origin = 'TRIBUTO.CD_TIPO_ALIQ_IPT'
      Size = 1
    end
    object qry_trib_ii_VL_BASE_CALC_ADVAL: TFloatField
      FieldName = 'VL_BASE_CALC_ADVAL'
      Origin = 'TRIBUTO.VL_BASE_CALC_ADVAL'
    end
    object qry_trib_ii_PC_ALIQ_NORM_ADVAL: TFloatField
      FieldName = 'PC_ALIQ_NORM_ADVAL'
      Origin = 'TRIBUTO.PC_ALIQ_NORM_ADVAL'
    end
    object qry_trib_ii_PC_ALIQ_REDUZIDA: TFloatField
      FieldName = 'PC_ALIQ_REDUZIDA'
      Origin = 'TRIBUTO.PC_ALIQ_REDUZIDA'
    end
    object qry_trib_ii_PC_REDUCAO_IPT_BLI: TFloatField
      FieldName = 'PC_REDUCAO_IPT_BLI'
      Origin = 'TRIBUTO.PC_REDUCAO_IPT_BLI'
    end
    object qry_trib_ii_PC_ALIQ_ACOR_TARIF: TFloatField
      FieldName = 'PC_ALIQ_ACOR_TARIF'
      Origin = 'TRIBUTO.PC_ALIQ_ACOR_TARIF'
    end
    object qry_trib_ii_VL_IPT_A_RECOLHER: TFloatField
      FieldName = 'VL_IPT_A_RECOLHER'
      Origin = 'TRIBUTO.VL_IPT_A_RECOLHER'
    end
  end
  object qry_trib_ipi_: TQuery
    DatabaseName = 'DBDI'
    SQL.Strings = (
      'SELECT NR_PROCESSO , NR_ADICAO , '
      ' CD_RECEITA_IMPOSTO , CD_TIPO_BENEF_IPI, '
      ' CD_TIPO_ALIQ_IPT , '
      ' VL_BASE_CALC_ADVAL , '
      ' PC_ALIQ_NORM_ADVAL , PC_ALIQ_REDUZIDA , '
      ' PC_REDUCAO_IPT_BLI , '
      ' PC_ALIQ_ACOR_TARIF , VL_IPT_A_RECOLHER'
      'FROM TRIBUTO TRIBUTO'
      'WHERE NR_PROCESSO = :NR_PROCESSO AND'
      ' NR_ADICAO = :NR_ADICAO AND'
      ' CD_RECEITA_IMPOSTO = '#39'0002'#39)
    Params.Data = {
      010002000B4E525F50524F434553534F0001020030000000094E525F41444943
      414F0001020030000000}
    Left = 284
    Top = 68
    object qry_trib_ipi_NR_PROCESSO: TStringField
      FieldName = 'NR_PROCESSO'
      Origin = 'TRIBUTO.NR_PROCESSO'
      Size = 11
    end
    object qry_trib_ipi_NR_ADICAO: TStringField
      FieldName = 'NR_ADICAO'
      Origin = 'TRIBUTO.NR_ADICAO'
      Size = 3
    end
    object qry_trib_ipi_CD_RECEITA_IMPOSTO: TStringField
      FieldName = 'CD_RECEITA_IMPOSTO'
      Origin = 'TRIBUTO.CD_RECEITA_IMPOSTO'
      Size = 4
    end
    object qry_trib_ipi_CD_TIPO_BENEF_IPI: TStringField
      FieldName = 'CD_TIPO_BENEF_IPI'
      Origin = 'TRIBUTO.CD_TIPO_BENEF_IPI'
      Size = 1
    end
    object qry_trib_ipi_CD_TIPO_ALIQ_IPT: TStringField
      FieldName = 'CD_TIPO_ALIQ_IPT'
      Origin = 'TRIBUTO.NR_PROCESSO'
      Size = 1
    end
    object qry_trib_ipi_VL_BASE_CALC_ADVAL: TFloatField
      FieldName = 'VL_BASE_CALC_ADVAL'
      Origin = 'TRIBUTO.NR_ADICAO'
    end
    object qry_trib_ipi_PC_ALIQ_NORM_ADVAL: TFloatField
      FieldName = 'PC_ALIQ_NORM_ADVAL'
      Origin = 'TRIBUTO.CD_RECEITA_IMPOSTO'
    end
    object qry_trib_ipi_PC_ALIQ_REDUZIDA: TFloatField
      FieldName = 'PC_ALIQ_REDUZIDA'
      Origin = 'TRIBUTO.CD_TIPO_BENEF_IPI'
    end
    object qry_trib_ipi_PC_REDUCAO_IPT_BLI: TFloatField
      FieldName = 'PC_REDUCAO_IPT_BLI'
      Origin = 'TRIBUTO.VL_BASE_CALC_ADVAL'
    end
    object qry_trib_ipi_PC_ALIQ_ACOR_TARIF: TFloatField
      FieldName = 'PC_ALIQ_ACOR_TARIF'
      Origin = 'TRIBUTO.PC_ALIQ_NORM_ADVAL'
    end
    object qry_trib_ipi_VL_IPT_A_RECOLHER: TFloatField
      FieldName = 'VL_IPT_A_RECOLHER'
      Origin = 'TRIBUTO.PC_ALIQ_REDUZIDA'
    end
  end
  object qry_proc_risc_: TQuery
    DatabaseName = 'DBDI'
    RequestLive = True
    SQL.Strings = (
      'SELECT NR_PROCESSO , IN_RISC_ATUALIZADO'
      'FROM TDECLARACAO_IMPORTACAO TDECLARACAO_IMPORTACAO'
      'WHERE IN_RISC_ATUALIZADO = '#39'0'#39)
    Left = 28
    Top = 12
    object qry_proc_risc_NR_PROCESSO: TStringField
      FieldName = 'NR_PROCESSO'
      Origin = 'TDECLARACAO_IMPORTACAO.NR_PROCESSO'
      Size = 11
    end
    object qry_proc_risc_IN_RISC_ATUALIZADO: TStringField
      FieldName = 'IN_RISC_ATUALIZADO'
      Origin = 'TDECLARACAO_IMPORTACAO.IN_RISC_ATUALIZADO'
      Size = 1
    end
  end
  object qry_processo_: TQuery
    DatabaseName = 'DBPROCESSO'
    SQL.Strings = (
      'SELECT NR_PROCESSO , NR_PROC_RISC'
      'FROM TPROCESSO TPROCESSO'
      'WHERE NR_PROCESSO = :NR_PROCESSO')
    Params.Data = {010001000B4E525F50524F434553534F0001020030000000}
    Left = 28
    Top = 64
    object qry_processo_NR_PROCESSO: TStringField
      FieldName = 'NR_PROCESSO'
      Origin = 'TPROCESSO.NR_PROCESSO'
      Size = 11
    end
    object qry_processo_NR_PROC_RISC: TStringField
      FieldName = 'NR_PROC_RISC'
      Origin = 'TPROCESSO.NR_PROC_RISC'
      Size = 5
    end
  end
  object qry_empresa_nac_: TQuery
    DatabaseName = 'DBCAD'
    SQL.Strings = (
      'SELECT CD_EMPRESA , NM_EMPRESA , CGC_EMPRESA , '
      ' CPF_EMPRESA'
      'FROM TEMPRESA_NAC TEMPRESA_NAC'
      'WHERE CD_EMPRESA = :CD_EMPRESA')
    Params.Data = {010001000A43445F454D50524553410001020030000000}
    Left = 284
    Top = 116
    object qry_empresa_nac_CD_EMPRESA: TStringField
      FieldName = 'CD_EMPRESA'
      Origin = 'TEMPRESA_NAC.CD_EMPRESA'
      Size = 5
    end
    object qry_empresa_nac_NM_EMPRESA: TStringField
      FieldName = 'NM_EMPRESA'
      Origin = 'TEMPRESA_NAC.NM_EMPRESA'
      Size = 50
    end
    object qry_empresa_nac_CGC_EMPRESA: TStringField
      FieldName = 'CGC_EMPRESA'
      Origin = 'TEMPRESA_NAC.CGC_EMPRESA'
      Size = 14
    end
    object qry_empresa_nac_CPF_EMPRESA: TStringField
      FieldName = 'CPF_EMPRESA'
      Origin = 'TEMPRESA_NAC.CPF_EMPRESA'
      Size = 11
    end
  end
  object qry_ncm_: TQuery
    DatabaseName = 'DBTABSISCO'
    SQL.Strings = (
      'SELECT CODIGO , UNIDADE_MEDIDA'
      'FROM TNCM TNCM'
      'WHERE CODIGO = :CODIGO')
    Params.Data = {0100010006434F4449474F0001020030000000}
    Left = 284
    Top = 168
    object qry_ncm_CODIGO: TStringField
      FieldName = 'CODIGO'
      Origin = 'TNCM.CODIGO'
      Size = 8
    end
    object qry_ncm_UNIDADE_MEDIDA: TStringField
      FieldName = 'UNIDADE_MEDIDA'
      Origin = 'TNCM.UNIDADE_MEDIDA'
      Size = 4
    end
  end
end
