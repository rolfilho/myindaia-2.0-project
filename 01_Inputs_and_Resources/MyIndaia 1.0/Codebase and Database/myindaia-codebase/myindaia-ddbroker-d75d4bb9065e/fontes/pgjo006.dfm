object datm_LI_Itens: Tdatm_LI_Itens
  Left = 200
  Top = 104
  Height = 553
  Width = 446
  object ds_li_itens: TDataSource
    DataSet = qry_li_itens_
    Left = 40
    Top = 64
  end
  object qry_li_itens_: TQuery
    BeforeInsert = qry_li_itens_BeforeInsert
    BeforeEdit = qry_li_itens_BeforeEdit
    DatabaseName = 'DBBROKER'
    RequestLive = True
    SQL.Strings = (
      'SELECT * '
      'FROM TLICENCA_ITENS'
      'WHERE NR_PROCESSO = :NR_PROCESSO')
    Params.Data = {010001000B4E525F50524F434553534F0001020030000100}
    Left = 120
    Top = 64
    object qry_li_itens_NR_PROCESSO: TStringField
      FieldName = 'NR_PROCESSO'
      Origin = 'TLICENCA_ITENS.NR_PROCESSO'
      Size = 18
    end
    object qry_li_itens_NR_ITEM: TStringField
      FieldName = 'NR_ITEM'
      Origin = 'TLICENCA_ITENS.NR_ITEM'
      Size = 3
    end
    object qry_li_itens_NR_DESTAQUE_NCM: TStringField
      FieldName = 'NR_DESTAQUE_NCM'
      Origin = 'TLICENCA_ITENS.NR_PROCESSO'
      Size = 3
    end
    object qry_li_itens_CD_EXPORTADOR: TStringField
      FieldName = 'CD_EXPORTADOR'
      Origin = 'TLICENCA_ITENS.CD_EXPORTADOR'
      Size = 5
    end
    object qry_li_itens_CD_FABR_EXPO: TStringField
      FieldName = 'CD_FABR_EXPO'
      Origin = 'TLICENCA_ITENS.CD_FABR_EXPO'
      Size = 1
    end
    object qry_li_itens_CD_FABRICANTE: TStringField
      FieldName = 'CD_FABRICANTE'
      Origin = 'TLICENCA_ITENS.CD_FABRICANTE'
      Size = 5
    end
    object qry_li_itens_CD_MERCADORIA: TStringField
      FieldName = 'CD_MERCADORIA'
      Origin = 'TLICENCA_ITENS.CD_MERCADORIA'
      Size = 50
    end
    object qry_li_itens_CD_NALADI_NCCA: TStringField
      FieldName = 'CD_NALADI_NCCA'
      Origin = 'TLICENCA_ITENS.CD_NALADI_NCCA'
      EditMask = '9999.99.9;0;_'
      Size = 7
    end
    object qry_li_itens_CD_NALADI_SH: TStringField
      FieldName = 'CD_NALADI_SH'
      Origin = 'TLICENCA_ITENS.CD_NALADI_SH'
      EditMask = '9999.99.99;0;_'
      Size = 8
    end
    object qry_li_itens_CD_NCM_SH: TStringField
      FieldName = 'CD_NCM_SH'
      Origin = 'TLICENCA_ITENS.CD_NCM_SH'
      EditMask = '9999.99.99-999;0;_'
      Size = 11
    end
    object qry_li_itens_CD_PAIS_AQUISICAO: TStringField
      FieldName = 'CD_PAIS_AQUISICAO'
      Origin = 'TLICENCA_ITENS.CD_PAIS_AQUISICAO'
      Size = 3
    end
    object qry_li_itens_CD_PAIS_ORIGEM: TStringField
      FieldName = 'CD_PAIS_ORIGEM'
      Origin = 'TLICENCA_ITENS.CD_PAIS_ORIGEM'
      Size = 3
    end
    object qry_li_itens_CD_IMPORTADOR: TStringField
      FieldName = 'CD_IMPORTADOR'
      Origin = 'TLICENCA_ITENS.NR_PROCESSO'
      Size = 5
    end
    object qry_li_itens_CD_PAIS_PROCEDENCIA: TStringField
      FieldName = 'CD_PAIS_PROCEDENCIA'
      Origin = 'TLICENCA_ITENS.NR_ITEM'
      Size = 3
    end
    object qry_li_itens_CD_UN_MED_COMERC: TStringField
      FieldName = 'CD_UN_MED_COMERC'
      Origin = 'TLICENCA_ITENS.NR_PROCESSO'
      Size = 2
    end
    object qry_li_itens_CD_UN_MED_ESTAT: TStringField
      FieldName = 'CD_UN_MED_ESTAT'
      Origin = 'TLICENCA_ITENS.NR_ITEM'
      Size = 2
    end
    object qry_li_itens_PL_MERCADORIA: TFloatField
      FieldName = 'PL_MERCADORIA'
      Origin = 'TLICENCA_ITENS.PL_MERCADORIA'
      DisplayFormat = '#0,.00000'
      EditFormat = '#0.00000'
    end
    object qry_li_itens_QT_MERC_UN_COMERC: TFloatField
      FieldName = 'QT_MERC_UN_COMERC'
      Origin = 'TLICENCA_ITENS.QT_MERC_UN_COMERC'
      DisplayFormat = '#0,.00000'
      EditFormat = '#0.00000'
    end
    object qry_li_itens_QT_MERC_UN_ESTAT: TFloatField
      FieldName = 'QT_MERC_UN_ESTAT'
      Origin = 'TLICENCA_ITENS.QT_MERC_UN_ESTAT'
      DisplayFormat = '#0,.00000'
      EditFormat = '#0.00000'
    end
    object qry_li_itens_TX_DESC_DET_MERC: TMemoField
      FieldName = 'TX_DESC_DET_MERC'
      Origin = 'TLICENCA_ITENS.TX_DESC_DET_MERC'
      BlobType = ftMemo
    end
    object qry_li_itens_VL_UNIT_MLE: TFloatField
      FieldName = 'VL_UNIT_MLE'
      Origin = 'TLICENCA_ITENS.VL_UNIT_MLE'
      DisplayFormat = '#0,.00000'
      EditFormat = '#0.00000'
    end
    object qry_li_itens_VL_TOTAL_MLE: TFloatField
      FieldName = 'VL_TOTAL_MLE'
      Origin = 'TLICENCA_ITENS.VL_TOTAL_MLE'
      DisplayFormat = '#0,.00'
      EditFormat = '#0.00'
    end
    object qry_li_itens_VL_UNIT_MCV: TFloatField
      FieldName = 'VL_UNIT_MCV'
      Origin = 'TLICENCA_ITENS.VL_UNIT_MCV'
      DisplayFormat = '#0,.00000'
      EditFormat = '#0.00000'
    end
    object qry_li_itens_LookMercadoria: TStringField
      FieldName = 'LookMercadoria'
      LookupDataSet = tbl_mercadoria_
      LookupKeyFields = 'CD_MERCADORIA'
      LookupResultField = 'AP_MERCADORIA'
      KeyFields = 'CD_MERCADORIA'
      Size = 25
      Lookup = True
    end
    object qry_li_itens_LookExportador: TStringField
      FieldName = 'LookExportador'
      LookupDataSet = tbl_empresa_est_
      LookupKeyFields = 'CD_EMPRESA'
      LookupResultField = 'NM_EMPRESA'
      KeyFields = 'CD_EXPORTADOR'
      Size = 60
      Lookup = True
    end
    object qry_li_itens_LookFabProd: TStringField
      FieldName = 'LookFabProd'
      LookupDataSet = tbl_empresa_est_
      LookupKeyFields = 'CD_EMPRESA'
      LookupResultField = 'NM_EMPRESA'
      KeyFields = 'CD_FABRICANTE'
      Size = 60
      Lookup = True
    end
    object qry_li_itens_LookPaisAquisicao: TStringField
      FieldName = 'LookPaisAquisicao'
      LookupDataSet = tbl_pais_
      LookupKeyFields = 'CODIGO'
      LookupResultField = 'DESCRICAO'
      KeyFields = 'CD_PAIS_AQUISICAO'
      Size = 120
      Lookup = True
    end
    object qry_li_itens_LookPaisOrigem: TStringField
      FieldName = 'LookPaisOrigem'
      LookupDataSet = tbl_pais_
      LookupKeyFields = 'CODIGO'
      LookupResultField = 'DESCRICAO'
      KeyFields = 'CD_PAIS_ORIGEM'
      Size = 120
      Lookup = True
    end
    object qry_li_itens_LookUnidMedida: TStringField
      FieldName = 'LookUnidMedida'
      LookupDataSet = qry_unid_medida_
      LookupKeyFields = 'CODIGO'
      LookupResultField = 'DESCRICAO'
      KeyFields = 'CD_UN_MED_COMERC'
      Size = 120
      Lookup = True
    end
  end
  object qry_unid_medida_: TQuery
    DatabaseName = 'DBBROKER'
    SessionName = 'Default'
    RequestLive = True
    SQL.Strings = (
      'SELECT *'
      'FROM TUNID_MEDIDA'
      '')
    Left = 121
    Top = 120
    object qry_unid_medida_CODIGO: TStringField
      FieldName = 'CODIGO'
      Origin = 'TUNID_MEDIDA.CODIGO'
      Size = 2
    end
    object qry_unid_medida_DESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Origin = 'TUNID_MEDIDA.DESCRICAO'
      Size = 120
    end
  end
  object ds_unid_med: TDataSource
    DataSet = qry_unid_medida_
    Left = 41
    Top = 120
  end
  object ds_ncm: TDataSource
    DataSet = tbl_ncm_
    Left = 36
    Top = 236
  end
  object tbl_ncm_: TTable
    DatabaseName = 'DBBROKER'
    IndexFieldNames = 'CODIGO'
    ReadOnly = True
    TableName = 'TNCM'
    UpdateMode = upWhereKeyOnly
    Left = 125
    Top = 236
    object tbl_ncm_CODIGO: TStringField
      FieldName = 'CODIGO'
      Size = 8
    end
    object tbl_ncm_DESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Size = 120
    end
    object tbl_ncm_UNIDADE_MEDIDA: TStringField
      FieldName = 'UNIDADE_MEDIDA'
      Size = 4
    end
    object tbl_ncm_ALIQUOTA_II: TStringField
      FieldName = 'ALIQUOTA_II'
      Size = 6
    end
    object tbl_ncm_DATA_INICIO_VIG_II: TStringField
      FieldName = 'DATA_INICIO_VIG_II'
      Size = 10
    end
    object tbl_ncm_DATA_FIM_VIG_II: TStringField
      FieldName = 'DATA_FIM_VIG_II'
      Size = 10
    end
    object tbl_ncm_ALIQUOTA_II_MERCOSUL: TStringField
      FieldName = 'ALIQUOTA_II_MERCOSUL'
      Size = 6
    end
    object tbl_ncm_DATA_INICIO_VIG_II_MSUL: TStringField
      FieldName = 'DATA_INICIO_VIG_II_MSUL'
      Size = 10
    end
    object tbl_ncm_DATA_FIM_VIG_II_MSUL: TStringField
      FieldName = 'DATA_FIM_VIG_II_MSUL'
      Size = 10
    end
    object tbl_ncm_ALIQUOTA_IPI: TStringField
      FieldName = 'ALIQUOTA_IPI'
      Size = 6
    end
    object tbl_ncm_DATA_INICIO_VIG_IPI: TStringField
      FieldName = 'DATA_INICIO_VIG_IPI'
      Size = 10
    end
    object tbl_ncm_DATA_FIM_VIG_IPI: TStringField
      FieldName = 'DATA_FIM_VIG_IPI'
      Size = 10
    end
  end
  object tbl_naladi_ncca_: TTable
    DatabaseName = 'DBBROKER'
    IndexFieldNames = 'CODIGO'
    TableName = 'TNALADINCCA'
    UpdateMode = upWhereKeyOnly
    Left = 33
    Top = 360
  end
  object tbl_naladi_sh_: TTable
    DatabaseName = 'DBBROKER'
    IndexFieldNames = 'CODIGO'
    ReadOnly = True
    TableName = 'TNALADISH'
    UpdateMode = upWhereKeyOnly
    Left = 121
    Top = 360
  end
  object tbl_pais_: TTable
    DatabaseName = 'DBBROKER'
    IndexFieldNames = 'CODIGO'
    ReadOnly = True
    TableName = 'TPAIS'
    UpdateMode = upWhereKeyOnly
    Left = 121
    Top = 176
    object tbl_pais_CODIGO: TStringField
      FieldName = 'CODIGO'
      Size = 3
    end
    object tbl_pais_DESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Size = 120
    end
  end
  object ds_pais: TDataSource
    DataSet = tbl_pais_
    Left = 33
    Top = 176
  end
  object tbl_mercadoria_: TTable
    DatabaseName = 'DBBROKER'
    IndexFieldNames = 'CD_MERCADORIA'
    TableName = 'TMERCADORIA'
    UpdateMode = upWhereKeyOnly
    Left = 121
    Top = 292
    object tbl_mercadoria_CD_MERCADORIA: TStringField
      FieldName = 'CD_MERCADORIA'
      Required = True
      Size = 15
    end
    object tbl_mercadoria_NM_MERCADORIA: TMemoField
      FieldName = 'NM_MERCADORIA'
      Required = True
      BlobType = ftMemo
    end
    object tbl_mercadoria_AP_MERCADORIA: TStringField
      FieldName = 'AP_MERCADORIA'
      Required = True
      Size = 25
    end
    object tbl_mercadoria_VL_UNITARIO: TFloatField
      FieldName = 'VL_UNITARIO'
    end
    object tbl_mercadoria_CD_NCM_SH: TStringField
      FieldName = 'CD_NCM_SH'
      Size = 11
    end
    object tbl_mercadoria_CD_NALADI_SH: TStringField
      FieldName = 'CD_NALADI_SH'
      Size = 8
    end
    object tbl_mercadoria_CD_NALADI_NCCA: TStringField
      FieldName = 'CD_NALADI_NCCA'
      Size = 7
    end
    object tbl_mercadoria_PL_MERCADORIA: TFloatField
      FieldName = 'PL_MERCADORIA'
    end
    object tbl_mercadoria_CD_EXPORTADOR: TStringField
      FieldName = 'CD_EXPORTADOR'
      Size = 5
    end
    object tbl_mercadoria_CD_PAIS_AQUISICAO: TStringField
      FieldName = 'CD_PAIS_AQUISICAO'
      Size = 3
    end
    object tbl_mercadoria_CD_PAIS_ORIGEM: TStringField
      FieldName = 'CD_PAIS_ORIGEM'
      Size = 3
    end
    object tbl_mercadoria_CD_FABRICANTE: TStringField
      FieldName = 'CD_FABRICANTE'
      Size = 5
    end
    object tbl_mercadoria_CD_IMPORTADOR: TStringField
      FieldName = 'CD_IMPORTADOR'
      Size = 5
    end
    object tbl_mercadoria_CD_GRUPO: TStringField
      FieldName = 'CD_GRUPO'
      Size = 3
    end
    object tbl_mercadoria_CD_FABR_EXPO: TStringField
      FieldName = 'CD_FABR_EXPO'
      Size = 1
    end
    object tbl_mercadoria_CD_TIPO_CALCULO: TStringField
      FieldName = 'CD_TIPO_CALCULO'
      Size = 1
    end
    object tbl_mercadoria_CD_UN_MED_COMERC: TStringField
      FieldName = 'CD_UN_MED_COMERC'
      Size = 3
    end
  end
  object ds_mercadoria: TDataSource
    DataSet = tbl_mercadoria_
    Left = 33
    Top = 292
  end
  object ds_li: TDataSource
    DataSet = qry_li_
    Left = 40
    Top = 8
  end
  object qry_li_: TQuery
    DatabaseName = 'DBBROKER'
    RequestLive = True
    SQL.Strings = (
      'SELECT * '
      'FROM TLICENCA_IMPORTACAO'
      'WHERE NR_PROCESSO = :NR_PROCESSO')
    Params.Data = {010001000B4E525F50524F434553534F0001020030000000}
    Left = 120
    Top = 8
    object qry_li_NR_PROCESSO: TStringField
      FieldName = 'NR_PROCESSO'
      Origin = 'TLICENCA_IMPORTACAO.NR_PROCESSO'
      Size = 18
    end
    object qry_li_NR_IDENT_USUARIO: TStringField
      FieldName = 'NR_IDENT_USUARIO'
      Origin = 'TLICENCA_IMPORTACAO.NR_IDENT_USUARIO'
      Size = 15
    end
    object qry_li_NR_ATO_DRAWBACK: TStringField
      FieldName = 'NR_ATO_DRAWBACK'
      Origin = 'TLICENCA_IMPORTACAO.NR_ATO_DRAWBACK'
      Size = 13
    end
    object qry_li_NR_COMUNICADO_COMPRA: TStringField
      FieldName = 'NR_COMUNICADO_COMPRA'
      Origin = 'TLICENCA_IMPORTACAO.NR_COMUNICADO_COMPRA'
      Size = 13
    end
    object qry_li_NR_REGISTRO_LI: TStringField
      FieldName = 'NR_REGISTRO_LI'
      Origin = 'TLICENCA_IMPORTACAO.NR_REGISTRO_LI'
      Size = 10
    end
    object qry_li_NR_PROCESSO_SISCOMEX: TStringField
      FieldName = 'NR_PROCESSO_SISCOMEX'
      Origin = 'TLICENCA_IMPORTACAO.NR_IDENT_USUARIO'
      Size = 8
    end
    object qry_li_CD_MOD_PAGAMENTO: TStringField
      FieldName = 'CD_MOD_PAGAMENTO'
      Origin = 'TLICENCA_IMPORTACAO.CD_MOD_PAGAMENTO'
      Size = 2
    end
    object qry_li_CD_IMPORTADOR: TStringField
      FieldName = 'CD_IMPORTADOR'
      Origin = 'TLICENCA_IMPORTACAO.CD_IMPORTADOR'
      Size = 5
    end
    object qry_li_CD_ACORDO_ALADI: TStringField
      FieldName = 'CD_ACORDO_ALADI'
      Origin = 'TLICENCA_IMPORTACAO.CD_ACORDO_ALADI'
      Size = 3
    end
    object qry_li_CD_REGIME_TRIBUTACAO: TStringField
      FieldName = 'CD_REGIME_TRIBUTACAO'
      Origin = 'TLICENCA_IMPORTACAO.CD_REGIME_TRIBUTACAO'
      Size = 1
    end
    object qry_li_CD_FUND_LEGAL: TStringField
      FieldName = 'CD_FUND_LEGAL'
      Origin = 'TLICENCA_IMPORTACAO.CD_FUND_LEGAL'
      Size = 2
    end
    object qry_li_CD_AGENCIA_SECEX: TStringField
      FieldName = 'CD_AGENCIA_SECEX'
      Origin = 'TLICENCA_IMPORTACAO.CD_AGENCIA_SECEX'
      Size = 4
    end
    object qry_li_CD_PAIS_PROCEDENCIA: TStringField
      FieldName = 'CD_PAIS_PROCEDENCIA'
      Origin = 'TLICENCA_IMPORTACAO.CD_PAIS_PROCEDENCIA'
      Size = 3
    end
    object qry_li_CD_INCOTERM: TStringField
      FieldName = 'CD_INCOTERM'
      Origin = 'TLICENCA_IMPORTACAO.CD_INCOTERM'
      Size = 3
    end
    object qry_li_CD_INSTITUICAO_FINANC: TStringField
      FieldName = 'CD_INSTITUICAO_FINANC'
      Origin = 'TLICENCA_IMPORTACAO.CD_INSTITUICAO_FINANC'
      Size = 2
    end
    object qry_li_CD_MOT_SEM_COBERTURA: TStringField
      FieldName = 'CD_MOT_SEM_COBERTURA'
      Origin = 'TLICENCA_IMPORTACAO.CD_MOT_SEM_COBERTURA'
      Size = 2
    end
    object qry_li_CD_CONDICAO_MERC: TStringField
      FieldName = 'CD_CONDICAO_MERC'
      Origin = 'TLICENCA_IMPORTACAO.CD_CONDICAO_MERC'
      Size = 1
    end
    object qry_li_CD_MOEDA_FOB: TStringField
      FieldName = 'CD_MOEDA_FOB'
      Origin = 'TLICENCA_IMPORTACAO.CD_MOEDA_FOB'
      Size = 3
    end
    object qry_li_CD_URF_DESPACHO: TStringField
      FieldName = 'CD_URF_DESPACHO'
      Origin = 'TLICENCA_IMPORTACAO.CD_URF_DESPACHO'
      Size = 7
    end
    object qry_li_CD_URF_ENTRADA: TStringField
      FieldName = 'CD_URF_ENTRADA'
      Origin = 'TLICENCA_IMPORTACAO.CD_URF_ENTRADA'
      Size = 7
    end
    object qry_li_CD_MOEDA_FRETE: TStringField
      FieldName = 'CD_MOEDA_FRETE'
      Origin = 'TLICENCA_IMPORTACAO.CD_MOEDA_FRETE'
      Size = 3
    end
    object qry_li_CD_MOEDA_SEGURO: TStringField
      FieldName = 'CD_MOEDA_SEGURO'
      Origin = 'TLICENCA_IMPORTACAO.CD_MOEDA_SEGURO'
      Size = 3
    end
    object qry_li_CD_MOEDA_MLE: TStringField
      FieldName = 'CD_MOEDA_MLE'
      Origin = 'TLICENCA_IMPORTACAO.CD_MOEDA_MLE'
      Size = 3
    end
    object qry_li_CD_TIPO_IMPORTADOR: TStringField
      FieldName = 'CD_TIPO_IMPORTADOR'
      Origin = 'TLICENCA_IMPORTACAO.CD_TIPO_IMPORTADOR'
      Size = 1
    end
    object qry_li_CD_SERVICO: TStringField
      FieldName = 'CD_SERVICO'
      Origin = 'TLICENCA_IMPORTACAO.CD_SERVICO'
      Size = 3
    end
    object qry_li_DT_PROCESSO_LI: TDateTimeField
      FieldName = 'DT_PROCESSO_LI'
      Origin = 'TLICENCA_IMPORTACAO.DT_PROCESSO_LI'
    end
    object qry_li_DT_REGISTRO_LI: TDateTimeField
      FieldName = 'DT_REGISTRO_LI'
      Origin = 'TLICENCA_IMPORTACAO.DT_REGISTRO_LI'
    end
    object qry_li_QT_DIAS_COBERTURA: TIntegerField
      FieldName = 'QT_DIAS_COBERTURA'
      Origin = 'TLICENCA_IMPORTACAO.QT_DIAS_COBERTURA'
    end
    object qry_li_QT_TOTAL_PES_LIQ: TFloatField
      FieldName = 'QT_TOTAL_PES_LIQ'
      Origin = 'TLICENCA_IMPORTACAO.QT_TOTAL_PES_LIQ'
    end
    object qry_li_QT_MED_ESTATISTICA: TFloatField
      FieldName = 'QT_MED_ESTATISTICA'
      Origin = 'TLICENCA_IMPORTACAO.QT_MED_ESTATISTICA'
    end
    object qry_li_QT_TOTAL_ITEM: TStringField
      FieldName = 'QT_TOTAL_ITEM'
      Origin = 'TLICENCA_IMPORTACAO.NR_PROCESSO'
      Size = 3
    end
    object qry_li_TP_CAMBIO: TStringField
      FieldName = 'TP_CAMBIO'
      Origin = 'TLICENCA_IMPORTACAO.TP_CAMBIO'
      Size = 1
    end
    object qry_li_TP_ACORDO_ALADI: TStringField
      FieldName = 'TP_ACORDO_ALADI'
      Origin = 'TLICENCA_IMPORTACAO.NR_PROCESSO'
      Size = 1
    end
    object qry_li_TX_INFO_COMPLEMENTAR: TMemoField
      FieldName = 'TX_INFO_COMPLEMENTAR'
      Origin = 'TLICENCA_IMPORTACAO.TX_INFO_COMPLEMENTAR'
      BlobType = ftMemo
    end
    object qry_li_VL_FRETE_MOEDA: TFloatField
      FieldName = 'VL_FRETE_MOEDA'
      Origin = 'TLICENCA_IMPORTACAO.VL_FRETE_MOEDA'
    end
    object qry_li_VL_SEGURO_MOEDA: TFloatField
      FieldName = 'VL_SEGURO_MOEDA'
      Origin = 'TLICENCA_IMPORTACAO.VL_SEGURO_MOEDA'
    end
    object qry_li_VL_DESPESA_MOEDA: TFloatField
      FieldName = 'VL_DESPESA_MOEDA'
      Origin = 'TLICENCA_IMPORTACAO.VL_DESPESA_MOEDA'
    end
    object qry_li_VL_DESCONTO_MOEDA: TFloatField
      FieldName = 'VL_DESCONTO_MOEDA'
      Origin = 'TLICENCA_IMPORTACAO.VL_DESCONTO_MOEDA'
    end
    object qry_li_VL_TOTAL_MOEDA: TFloatField
      FieldName = 'VL_TOTAL_MOEDA'
      Origin = 'TLICENCA_IMPORTACAO.VL_TOTAL_MOEDA'
    end
    object qry_li_IN_MONTADA: TStringField
      FieldName = 'IN_MONTADA'
      Origin = 'TLICENCA_IMPORTACAO.NR_IDENT_USUARIO'
      Size = 1
    end
  end
  object tbl_empresa_nac_: TTable
    DatabaseName = 'DBBROKER'
    IndexFieldNames = 'CD_EMPRESA'
    TableName = 'TEMPRESA_NAC'
    UpdateMode = upWhereKeyOnly
    Left = 361
    Top = 8
    object tbl_empresa_nac_CD_EMPRESA: TStringField
      FieldName = 'CD_EMPRESA'
      Required = True
      Size = 5
    end
    object tbl_empresa_nac_NM_EMPRESA: TStringField
      FieldName = 'NM_EMPRESA'
      Size = 50
    end
    object tbl_empresa_nac_AP_EMPRESA: TStringField
      FieldName = 'AP_EMPRESA'
      Size = 10
    end
    object tbl_empresa_nac_END_EMPRESA: TStringField
      FieldName = 'END_EMPRESA'
      Size = 50
    end
    object tbl_empresa_nac_END_NUMERO: TStringField
      FieldName = 'END_NUMERO'
      Size = 6
    end
    object tbl_empresa_nac_END_CIDADE: TStringField
      FieldName = 'END_CIDADE'
      Size = 30
    end
    object tbl_empresa_nac_END_BAIRRO: TStringField
      FieldName = 'END_BAIRRO'
      Size = 30
    end
    object tbl_empresa_nac_END_UF: TStringField
      FieldName = 'END_UF'
      Size = 2
    end
    object tbl_empresa_nac_END_CEP: TStringField
      FieldName = 'END_CEP'
      Size = 8
    end
    object tbl_empresa_nac_CD_TIPO_PESSOA: TStringField
      FieldName = 'CD_TIPO_PESSOA'
      Size = 1
    end
    object tbl_empresa_nac_CGC_EMPRESA: TStringField
      FieldName = 'CGC_EMPRESA'
      Size = 14
    end
    object tbl_empresa_nac_CPF_EMPRESA: TStringField
      FieldName = 'CPF_EMPRESA'
      Size = 11
    end
    object tbl_empresa_nac_IE_EMPRESA: TStringField
      FieldName = 'IE_EMPRESA'
    end
    object tbl_empresa_nac_OUTRO_DOC: TStringField
      FieldName = 'OUTRO_DOC'
    end
    object tbl_empresa_nac_DT_INCLUSAO: TDateTimeField
      FieldName = 'DT_INCLUSAO'
    end
    object tbl_empresa_nac_IN_FATURAMENTO: TStringField
      FieldName = 'IN_FATURAMENTO'
      Size = 1
    end
    object tbl_empresa_nac_IN_ATIVO: TStringField
      FieldName = 'IN_ATIVO'
      Size = 1
    end
    object tbl_empresa_nac_IN_RESTRICAO: TStringField
      FieldName = 'IN_RESTRICAO'
      Size = 1
    end
    object tbl_empresa_nac_IN_EVENTUAL: TStringField
      FieldName = 'IN_EVENTUAL'
      Size = 1
    end
    object tbl_empresa_nac_CD_TIPO_REF: TStringField
      FieldName = 'CD_TIPO_REF'
      Size = 1
    end
    object tbl_empresa_nac_CD_TAB_SDA: TStringField
      FieldName = 'CD_TAB_SDA'
      Size = 3
    end
    object tbl_empresa_nac_IN_CLIENTE: TBooleanField
      FieldName = 'IN_CLIENTE'
      Required = True
    end
    object tbl_empresa_nac_IN_IMPORTADOR: TBooleanField
      FieldName = 'IN_IMPORTADOR'
      Required = True
    end
    object tbl_empresa_nac_IN_EXPORTADOR: TBooleanField
      FieldName = 'IN_EXPORTADOR'
      Required = True
    end
    object tbl_empresa_nac_IN_OUTROS: TBooleanField
      FieldName = 'IN_OUTROS'
      Required = True
    end
    object tbl_empresa_nac_CD_BANCO_IMPOSTOS: TStringField
      FieldName = 'CD_BANCO_IMPOSTOS'
      Size = 3
    end
    object tbl_empresa_nac_NR_AG_BANCO_IMPOSTOS: TStringField
      FieldName = 'NR_AG_BANCO_IMPOSTOS'
      Size = 5
    end
    object tbl_empresa_nac_CD_SDA: TStringField
      FieldName = 'CD_SDA'
      Size = 4
    end
    object tbl_empresa_nac_NR_CAE: TStringField
      FieldName = 'NR_CAE'
      Size = 6
    end
    object tbl_empresa_nac_CD_GRUPO: TStringField
      FieldName = 'CD_GRUPO'
      Size = 3
    end
  end
  object ds_empresa_nac: TDataSource
    DataSet = tbl_empresa_nac_
    Left = 249
    Top = 8
  end
  object ds_empresa_est: TDataSource
    DataSet = tbl_empresa_est_
    Left = 233
    Top = 210
  end
  object tbl_empresa_est_: TTable
    DatabaseName = 'DBBROKER'
    IndexFieldNames = 'CD_EMPRESA'
    TableName = 'TEMPRESA_EST'
    UpdateMode = upWhereKeyOnly
    Left = 345
    Top = 210
    object tbl_empresa_est_CD_EMPRESA: TStringField
      DisplayLabel = 'Código'
      FieldName = 'CD_EMPRESA'
      Required = True
      Size = 5
    end
    object tbl_empresa_est_NM_EMPRESA: TStringField
      DisplayLabel = 'Razão Social'
      FieldName = 'NM_EMPRESA'
      Size = 60
    end
    object tbl_empresa_est_AP_EMPRESA: TStringField
      DisplayLabel = 'Apelido'
      FieldName = 'AP_EMPRESA'
      Size = 10
    end
    object tbl_empresa_est_END_EMPRESA: TStringField
      DisplayLabel = 'Endereço'
      FieldName = 'END_EMPRESA'
      Size = 40
    end
    object tbl_empresa_est_END_NUMERO: TStringField
      DisplayLabel = 'Número'
      FieldName = 'END_NUMERO'
      Size = 6
    end
    object tbl_empresa_est_END_COMPL: TStringField
      DisplayLabel = 'Compl.Endereço'
      FieldName = 'END_COMPL'
      Size = 21
    end
    object tbl_empresa_est_END_CIDADE: TStringField
      DisplayLabel = 'Cidade'
      FieldName = 'END_CIDADE'
      Size = 30
    end
    object tbl_empresa_est_END_ESTADO: TStringField
      DisplayLabel = 'Estado'
      FieldName = 'END_ESTADO'
      Size = 30
    end
    object tbl_empresa_est_CD_PAIS: TStringField
      DisplayLabel = 'País'
      FieldName = 'CD_PAIS'
      Size = 3
    end
    object tbl_empresa_est_NR_TELEFONE: TStringField
      DisplayLabel = 'Telefone'
      FieldName = 'NR_TELEFONE'
      Size = 15
    end
    object tbl_empresa_est_NR_FAX: TStringField
      DisplayLabel = 'Fax'
      FieldName = 'NR_FAX'
      Size = 15
    end
    object tbl_empresa_est_DT_INCLUSAO: TDateTimeField
      DisplayLabel = 'Inclusão'
      FieldName = 'DT_INCLUSAO'
      DisplayFormat = 'dd/mm/yyyy'
      EditMask = '!99/99/0000;1;_'
    end
  end
  object sp_li_apaga_renum_itens: TStoredProc
    DatabaseName = 'DBBROKER'
    StoredProcName = 'dbo.sp_li_apaga_renum_itens'
    Params.Data = {
      0100030006526573756C74040304000000000000010C406E725F70726F636573
      736F010102003000000008406E725F6974656D0101020030000000}
    Left = 344
    Top = 336
  end
end
