object datm_LI_Itens: Tdatm_LI_Itens
  OldCreateOrder = True
  Left = 1030
  Top = 291
  Height = 499
  Width = 674
  object ds_li_itens: TDataSource
    DataSet = qry_li_itens_
    Left = 40
    Top = 64
  end
  object qry_li_itens_: TQuery
    BeforeInsert = qry_li_itens_BeforeInsert
    BeforeEdit = qry_li_itens_BeforeEdit
    BeforePost = qry_li_itens_BeforePost
    AfterScroll = qry_li_itens_AfterScroll
    OnCalcFields = qry_li_itens_CalcFields
    DatabaseName = 'DBBROKER'
    RequestLive = True
    SQL.Strings = (
      'SELECT * '
      'FROM TLICENCA_ITENS'
      'WHERE NR_PROCESSO = :NR_PROCESSO')
    Left = 135
    Top = 64
    ParamData = <
      item
        DataType = ftString
        Name = 'NR_PROCESSO'
        ParamType = ptUnknown
      end>
    object qry_li_itens_NR_PROCESSO: TStringField
      FieldName = 'NR_PROCESSO'
      Origin = 'TLICENCA_ITENS.NR_PROCESSO'
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
      DisplayFormat = '#0,.0000000'
      EditFormat = '#0.0000000'
    end
    object qry_li_itens_VL_TOTAL_MLE: TFloatField
      FieldName = 'VL_TOTAL_MLE'
      Origin = 'TLICENCA_ITENS.VL_TOTAL_MLE'
      DisplayFormat = '#0,.0000000'
      EditFormat = '#0.0000000'
    end
    object qry_li_itens_VL_UNIT_MCV: TFloatField
      FieldName = 'VL_UNIT_MCV'
      Origin = 'TLICENCA_ITENS.VL_UNIT_MCV'
      DisplayFormat = '#0,.0000000'
      EditFormat = '#0.00000'
    end
    object qry_li_itens_LookExportador: TStringField
      FieldKind = fkLookup
      FieldName = 'LookExportador'
      LookupDataSet = tbl_empresa_est_
      LookupKeyFields = 'CD_EMPRESA'
      LookupResultField = 'NM_EMPRESA'
      KeyFields = 'CD_EXPORTADOR'
      Size = 60
      Lookup = True
    end
    object qry_li_itens_LookFabProd: TStringField
      FieldKind = fkLookup
      FieldName = 'LookFabProd'
      LookupDataSet = tbl_empresa_est_
      LookupKeyFields = 'CD_EMPRESA'
      LookupResultField = 'NM_EMPRESA'
      KeyFields = 'CD_FABRICANTE'
      Size = 60
      Lookup = True
    end
    object qry_li_itens_LookPaisAquisicao: TStringField
      FieldKind = fkLookup
      FieldName = 'LookPaisAquisicao'
      LookupDataSet = tbl_pais_
      LookupKeyFields = 'CODIGO'
      LookupResultField = 'DESCRICAO'
      KeyFields = 'CD_PAIS_AQUISICAO'
      Size = 120
      Lookup = True
    end
    object qry_li_itens_LookPaisOrigem: TStringField
      FieldKind = fkLookup
      FieldName = 'LookPaisOrigem'
      LookupDataSet = tbl_pais_
      LookupKeyFields = 'CODIGO'
      LookupResultField = 'DESCRICAO'
      KeyFields = 'CD_PAIS_ORIGEM'
      Size = 120
      Lookup = True
    end
    object qry_li_itens_LookUnidMedida: TStringField
      FieldKind = fkLookup
      FieldName = 'LookUnidMedida'
      LookupDataSet = qry_unid_medida_
      LookupKeyFields = 'CD_UNID_MEDIDA'
      LookupResultField = 'NM_UNID_MEDIDA'
      KeyFields = 'CD_UN_MED_COMERC'
      Size = 120
      Lookup = True
    end
    object qry_li_itens_LookNCM: TStringField
      FieldKind = fkLookup
      FieldName = 'LookNCM'
      LookupDataSet = tbl_ncm_
      LookupKeyFields = 'CODIGO'
      LookupResultField = 'DESCRICAO'
      KeyFields = 'CD_NCM_SH'
      Size = 120
      Lookup = True
    end
    object qry_li_itens_CD_UN_MED_COMERC: TStringField
      FieldName = 'CD_UN_MED_COMERC'
      Origin = 'TLICENCA_ITENS.NR_PROCESSO'
      Size = 3
    end
    object qry_li_itens_CD_UN_MED_ESTAT: TStringField
      FieldName = 'CD_UN_MED_ESTAT'
      Origin = 'TLICENCA_ITENS.NR_ITEM'
      Size = 3
    end
    object qry_li_itens_CD_MERCADORIA: TStringField
      DisplayLabel = 'C'#243'd. Merc.'
      DisplayWidth = 30
      FieldName = 'CD_MERCADORIA'
      Origin = 'TLICENCA_ITENS.NR_PROCESSO'
      Size = 30
    end
    object qry_li_itens_VL_RAT_FRETE: TFloatField
      FieldName = 'VL_RAT_FRETE'
      Origin = 'TLICENCA_ITENS.NR_PROCESSO'
    end
    object qry_li_itens_VL_RAT_SEGURO: TFloatField
      FieldName = 'VL_RAT_SEGURO'
      Origin = 'TLICENCA_ITENS.NR_ITEM'
    end
    object qry_li_itens_VL_RAT_DESPESA: TFloatField
      FieldName = 'VL_RAT_DESPESA'
      Origin = 'TLICENCA_ITENS.NR_DESTAQUE_NCM'
    end
    object qry_li_itens_VL_RAT_DESCONTO: TFloatField
      FieldName = 'VL_RAT_DESCONTO'
      Origin = 'TLICENCA_ITENS.CD_IMPORTADOR'
    end
    object qry_li_itens_NR_ATO_DRAWBACK: TStringField
      FieldName = 'NR_ATO_DRAWBACK'
      Origin = 'TLICENCA_ITENS.NR_DESTAQUE_NCM'
      Size = 13
    end
    object qry_li_itens_CD_REGIME_TRIBUTACAO: TStringField
      FieldName = 'CD_REGIME_TRIBUTACAO'
      Origin = 'TLICENCA_ITENS.NR_DESTAQUE_NCM'
      Size = 1
    end
    object qry_li_itens_CD_FUND_LEGAL: TStringField
      FieldName = 'CD_FUND_LEGAL'
      Origin = 'TLICENCA_ITENS.CD_IMPORTADOR'
      Size = 2
    end
    object qry_li_itens_LookRegTrib: TStringField
      FieldKind = fkLookup
      FieldName = 'LookRegTrib'
      LookupDataSet = qry_reg_trib_
      LookupKeyFields = 'CODIGO'
      LookupResultField = 'DESCRICAO'
      KeyFields = 'CD_REGIME_TRIBUTACAO'
      Size = 120
      Lookup = True
    end
    object qry_li_itens_LookFundLegal: TStringField
      FieldKind = fkCalculated
      FieldName = 'LookFundLegal'
      Size = 120
      Calculated = True
    end
    object qry_li_itens_IN_DRAWBACK_AUTOMATICO: TStringField
      FieldName = 'IN_DRAWBACK_AUTOMATICO'
      Origin = 'DBBROKER.TLICENCA_ITENS.IN_DRAWBACK_AUTOMATICO'
      FixedChar = True
      Size = 1
    end
    object qry_li_itens_NR_ITEM_DRAWBACK: TStringField
      FieldName = 'NR_ITEM_DRAWBACK'
      Origin = 'DBBROKER.TLICENCA_ITENS.NR_ITEM_DRAWBACK'
      FixedChar = True
      Size = 6
    end
    object qry_li_itens_QT_PRODUTO_DRAWBACK: TFloatField
      FieldName = 'QT_PRODUTO_DRAWBACK'
      Origin = 'DBBROKER.TLICENCA_ITENS.QT_PRODUTO_DRAWBACK'
    end
    object qry_li_itens_VL_PRODUTO_DRAWBACK: TFloatField
      FieldName = 'VL_PRODUTO_DRAWBACK'
      Origin = 'DBBROKER.TLICENCA_ITENS.VL_PRODUTO_DRAWBACK'
    end
    object qry_li_itens_NR_ITEM_PO: TStringField
      FieldName = 'NR_ITEM_PO'
      Origin = 'DBBROKER.TLICENCA_ITENS.NR_ITEM_PO'
      FixedChar = True
      Size = 4
    end
    object qry_li_itens_NR_PROC_PO: TStringField
      FieldName = 'NR_PROC_PO'
      Origin = 'DBBROKER.TLICENCA_ITENS.NR_PROC_PO'
      FixedChar = True
      Size = 30
    end
    object qry_li_itens_SISTEMA_DRAWBACK: TIntegerField
      FieldName = 'SISTEMA_DRAWBACK'
      Origin = 'DBBROKER.TLICENCA_ITENS.SISTEMA_DRAWBACK'
    end
    object qry_li_itens_NR_QUEBRA_EXTRA: TStringField
      FieldName = 'NR_QUEBRA_EXTRA'
      Origin = 'DBBROKER.TLICENCA_ITENS.NR_QUEBRA_EXTRA'
      FixedChar = True
      Size = 3
    end
    object qry_li_itens_VL_TOTAL_MLE_SEM_FRETE: TFloatField
      FieldName = 'VL_TOTAL_MLE_SEM_FRETE'
      Origin = 'TLICENCA_ITENS.VL_TOTAL_MLE_SEM_FRETE'
      DisplayFormat = '#0,.0000000'
      EditFormat = '#0.0000000'
    end
    object qry_li_itens_VL_RAT_FRETE_MOEDA_MERC: TFloatField
      FieldName = 'VL_RAT_FRETE_MOEDA_MERC'
      Origin = 'DBBROKER.TLICENCA_ITENS.VL_RAT_FRETE_MOEDA_MERC'
    end
  end
  object qry_unid_medida_: TQuery
    DatabaseName = 'DBBROKER'
    SessionName = 'Default'
    RequestLive = True
    SQL.Strings = (
      'SELECT *'
      'FROM TUNID_MEDIDA_BROKER'
      '')
    Left = 136
    Top = 176
    object qry_unid_medida_CD_UNID_MEDIDA: TStringField
      FieldName = 'CD_UNID_MEDIDA'
      Origin = 'TUNID_MEDIDA_BROKER.CD_UNID_MEDIDA'
      Size = 3
    end
    object qry_unid_medida_NM_UNID_MEDIDA: TStringField
      FieldName = 'NM_UNID_MEDIDA'
      Origin = 'TUNID_MEDIDA_BROKER.NM_UNID_MEDIDA'
      Size = 50
    end
    object qry_unid_medida_IN_ATIVO: TStringField
      FieldName = 'IN_ATIVO'
      Origin = 'TUNID_MEDIDA_BROKER.IN_ATIVO'
      Size = 1
    end
    object qry_unid_medida_CD_GIPLITE: TStringField
      FieldName = 'CD_GIPLITE'
      Origin = 'TUNID_MEDIDA_BROKER.CD_GIPLITE'
      Size = 2
    end
  end
  object ds_unid_med: TDataSource
    DataSet = qry_unid_medida_
    Left = 40
    Top = 176
  end
  object ds_ncm: TDataSource
    DataSet = tbl_ncm_
    Left = 256
    Top = 9
  end
  object tbl_ncm_: TTable
    DatabaseName = 'DBBROKER'
    IndexFieldNames = 'CODIGO'
    ReadOnly = True
    TableName = 'TNCM'
    UpdateMode = upWhereKeyOnly
    Left = 352
    Top = 9
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
    Left = 576
    Top = 240
  end
  object tbl_naladi_sh_: TTable
    DatabaseName = 'DBBROKER'
    IndexFieldNames = 'CODIGO'
    ReadOnly = True
    TableName = 'TNALADISH'
    UpdateMode = upWhereKeyOnly
    Left = 480
    Top = 240
  end
  object tbl_pais_: TTable
    DatabaseName = 'DBBROKER'
    IndexFieldNames = 'CODIGO'
    ReadOnly = True
    TableName = 'TPAIS'
    UpdateMode = upWhereKeyOnly
    Left = 352
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
    Left = 256
    Top = 176
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
      'WHERE NR_PROCESSO = :NR_PROCESSO'
      '')
    Left = 136
    Top = 8
    ParamData = <
      item
        DataType = ftString
        Name = 'NR_PROCESSO'
        ParamType = ptUnknown
      end>
    object qry_li_NR_PROCESSO: TStringField
      FieldName = 'NR_PROCESSO'
      Origin = 'TLICENCA_IMPORTACAO.NR_PROCESSO'
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
    Left = 353
    Top = 120
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
      Size = 8
    end
    object tbl_empresa_nac_CD_GRUPO: TStringField
      FieldName = 'CD_GRUPO'
      Size = 3
    end
  end
  object ds_empresa_nac: TDataSource
    DataSet = tbl_empresa_nac_
    Left = 257
    Top = 120
  end
  object ds_empresa_est: TDataSource
    DataSet = tbl_empresa_est_
    Left = 257
    Top = 65
  end
  object tbl_empresa_est_: TTable
    DatabaseName = 'DBBROKER'
    IndexFieldNames = 'CD_EMPRESA'
    TableName = 'TEMPRESA_EST'
    UpdateMode = upWhereKeyOnly
    Left = 353
    Top = 65
    object tbl_empresa_est_CD_EMPRESA: TStringField
      DisplayLabel = 'C'#243'digo'
      FieldName = 'CD_EMPRESA'
      Required = True
      Size = 5
    end
    object tbl_empresa_est_NM_EMPRESA: TStringField
      DisplayLabel = 'Raz'#227'o Social'
      FieldName = 'NM_EMPRESA'
      Size = 60
    end
    object tbl_empresa_est_AP_EMPRESA: TStringField
      DisplayLabel = 'Apelido'
      FieldName = 'AP_EMPRESA'
      Size = 10
    end
    object tbl_empresa_est_END_EMPRESA: TStringField
      DisplayLabel = 'Endere'#231'o'
      FieldName = 'END_EMPRESA'
      Size = 60
    end
    object tbl_empresa_est_END_COMPL: TStringField
      DisplayLabel = 'Compl.Endere'#231'o'
      FieldName = 'END_COMPL'
      Size = 41
    end
    object tbl_empresa_est_END_NUMERO: TStringField
      DisplayLabel = 'N'#250'mero'
      FieldName = 'END_NUMERO'
      Size = 6
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
      DisplayLabel = 'Pa'#237's'
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
      DisplayLabel = 'Inclus'#227'o'
      FieldName = 'DT_INCLUSAO'
      DisplayFormat = 'dd/mm/yyyy'
      EditMask = '!99/99/0000;1;_'
    end
  end
  object sp_li_apaga_renum_itens: TStoredProc
    DatabaseName = 'DBBROKER'
    StoredProcName = 'dbo.sp_li_apaga_renum_itens'
    Left = 544
    Top = 344
    ParamData = <
      item
        DataType = ftInteger
        Name = 'Result'
        ParamType = ptResult
        Value = 0
      end
      item
        DataType = ftString
        Name = '@nr_processo'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = '@nr_item'
        ParamType = ptInput
      end>
  end
  object sp_li_monta_li: TStoredProc
    DatabaseName = 'DBBROKER'
    StoredProcName = 'dbo.sp_li_monta_li'
    Left = 352
    Top = 344
    ParamData = <
      item
        DataType = ftInteger
        Name = 'Result'
        ParamType = ptResult
      end
      item
        DataType = ftString
        Name = '@nr_processo'
        ParamType = ptInput
      end>
  end
  object qry_li_nve_: TQuery
    DatabaseName = 'DBBROKER'
    RequestLive = True
    SQL.Strings = (
      'SELECT * FROM TLICENCA_NVE'
      'WHERE (NR_PROCESSO = :nr_processo) and (NR_ITEM = :nr_item) ')
    Left = 136
    Top = 128
    ParamData = <
      item
        DataType = ftString
        Name = 'nr_processo'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'nr_item'
        ParamType = ptUnknown
      end>
    object qry_li_nve_NR_PROCESSO: TStringField
      FieldName = 'NR_PROCESSO'
      Origin = 'TLICENCA_NVE.NR_PROCESSO'
    end
    object qry_li_nve_NR_ITEM: TStringField
      FieldName = 'NR_ITEM'
      Origin = 'TLICENCA_NVE.NR_ITEM'
      Size = 3
    end
    object qry_li_nve_CD_NIVEL_NVE: TStringField
      FieldName = 'CD_NIVEL_NVE'
      Origin = 'TLICENCA_NVE.CD_NIVEL_NVE'
      Size = 3
    end
    object qry_li_nve_CD_ATRIBUTO_NCM: TStringField
      FieldName = 'CD_ATRIBUTO_NCM'
      Origin = 'TLICENCA_NVE.CD_ATRIBUTO_NCM'
      Size = 2
    end
    object qry_li_nve_CD_ESPECIF_NCM: TStringField
      FieldName = 'CD_ESPECIF_NCM'
      Origin = 'TLICENCA_NVE.CD_ESPECIF_NCM'
      Size = 4
    end
    object qry_li_nve_LookNomeAtrib: TStringField
      FieldKind = fkLookup
      FieldName = 'LookNomeAtrib'
      LookupDataSet = qry_atrib_
      LookupKeyFields = 'CD_ATRIBUTO_NCM'
      LookupResultField = 'NM_ATRIBUTO'
      KeyFields = 'CD_ATRIBUTO_NCM'
      Size = 120
      Lookup = True
    end
    object qry_li_nve_LookNomeEspec: TStringField
      FieldKind = fkLookup
      FieldName = 'LookNomeEspec'
      LookupDataSet = qry_especif_
      LookupKeyFields = 'CD_ESPECIF_NCM'
      LookupResultField = 'NM_ESPECIF_NCM'
      KeyFields = 'CD_ESPECIF_NCM'
      Size = 120
      Lookup = True
    end
  end
  object ds_li_nve: TDataSource
    DataSet = qry_li_nve_
    Left = 40
    Top = 120
  end
  object qry_nivel_: TQuery
    DatabaseName = 'DBBROKER'
    ParamCheck = False
    RequestLive = True
    SQL.Strings = (
      'SELECT * FROM TAB_NIVEL ORDER BY CD_NIVEL_NVE')
    Left = 136
    Top = 232
    object qry_nivel_CD_NIVEL_NVE: TStringField
      FieldName = 'CD_NIVEL_NVE'
      Origin = 'TAB_NIVEL.CD_NIVEL_NVE'
      Size = 3
    end
    object qry_nivel_NM_NIVEL: TStringField
      FieldName = 'NM_NIVEL'
      Origin = 'TAB_NIVEL.CD_NIVEL_NVE'
      Size = 50
    end
  end
  object qry_atrib_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT * FROM TATRIB_VALORACAO_NVE')
    Left = 136
    Top = 288
    object qry_atrib_CD_NOMENC_NCM: TStringField
      FieldName = 'CD_NOMENC_NCM'
      Origin = 'TATRIB_VALORACAO_NVE.CD_NOMENC_NCM'
      Size = 8
    end
    object qry_atrib_CD_ATRIBUTO_NCM: TStringField
      FieldName = 'CD_ATRIBUTO_NCM'
      Origin = 'TATRIB_VALORACAO_NVE.CD_ATRIBUTO_NCM'
      Size = 2
    end
    object qry_atrib_IN_MULTIPLA_ESPECIF: TStringField
      FieldName = 'IN_MULTIPLA_ESPECIF'
      Origin = 'TATRIB_VALORACAO_NVE.IN_MULTIPLA_ESPECIF'
      Size = 1
    end
    object qry_atrib_CD_NIVEL_NCM: TStringField
      FieldName = 'CD_NIVEL_NCM'
      Origin = 'TATRIB_VALORACAO_NVE.CD_NIVEL_NCM'
      Size = 3
    end
    object qry_atrib_NM_ATRIBUTO: TStringField
      FieldName = 'NM_ATRIBUTO'
      Origin = 'TATRIB_VALORACAO_NVE.NM_ATRIBUTO'
      Size = 249
    end
  end
  object qry_especif_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT * FROM TAB_ESPECIF_VALORACAO_NVE')
    Left = 136
    Top = 344
    object qry_especif_CD_NOMENC_NCM: TStringField
      FieldName = 'CD_NOMENC_NCM'
      Origin = 'TAB_ESPECIF_VALORACAO_NVE.CD_NOMENC_NCM'
      Size = 8
    end
    object qry_especif_CD_ATRIBUTO_NCM: TStringField
      FieldName = 'CD_ATRIBUTO_NCM'
      Origin = 'TAB_ESPECIF_VALORACAO_NVE.CD_ATRIBUTO_NCM'
      Size = 2
    end
    object qry_especif_CD_ESPECIF_NCM: TStringField
      FieldName = 'CD_ESPECIF_NCM'
      Origin = 'TAB_ESPECIF_VALORACAO_NVE.CD_ESPECIF_NCM'
      Size = 4
    end
    object qry_especif_CD_NIVEL_NCM: TStringField
      FieldName = 'CD_NIVEL_NCM'
      Origin = 'TAB_ESPECIF_VALORACAO_NVE.CD_NIVEL_NCM'
      Size = 3
    end
    object qry_especif_NM_ESPECIF_NCM: TStringField
      FieldName = 'NM_ESPECIF_NCM'
      Origin = 'TAB_ESPECIF_VALORACAO_NVE.NM_ESPECIF_NCM'
      Size = 249
    end
  end
  object ds_nivel: TDataSource
    DataSet = qry_nivel_
    Left = 40
    Top = 232
  end
  object ds_atrib: TDataSource
    DataSet = qry_atrib_
    Left = 40
    Top = 288
  end
  object ds_especif: TDataSource
    DataSet = qry_especif_
    Left = 40
    Top = 344
  end
  object qry_dup_nve_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'INSERT INTO TLICENCA_NVE'
      
        '    SELECT NR_PROCESSO, NR_ITEM, CD_NIVEL_NVE, CD_ATRIBUTO_NCM, ' +
        'CD_ESPECIF_NCM'
      '    FROM TLICENCA_NVE'
      '    WHERE  NR_PROCESSO = :NR_PROCESSO AND NR_ITEM = :NR_ITEM')
    Left = 480
    Top = 120
    ParamData = <
      item
        DataType = ftString
        Name = 'NR_PROCESSO'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'NR_ITEM'
        ParamType = ptUnknown
      end>
  end
  object qry_apaga_nve_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'DELETE FROM TLICENCA_NVE '
      'WHERE NR_PROCESSO = :NR_PROCESSO AND '
      '               NR_ITEM = :NR_ITEM')
    Left = 576
    Top = 120
    ParamData = <
      item
        DataType = ftString
        Name = 'NR_PROCESSO'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'NR_ITEM'
        ParamType = ptUnknown
      end>
  end
  object qry_copia_nve_merc_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      
        'IF ( SELECT COUNT(*) FROM TLICENCA_NVE WHERE ( NR_PROCESSO = :NR' +
        '_PROCESSO AND NR_ITEM = :NR_ITEM )) = 0'
      'BEGIN'
      'INSERT INTO TLICENCA_NVE'
      
        'SELECT :NR_PROCESSO, :NR_ITEM, CD_NIVEL_NVE, CD_ATRIBUTO_NCM, CD' +
        '_ESPECIF_NCM'
      'FROM TMERCAD_NVE'
      'WHERE CD_MERCADORIA = :CD_MERCADORIA'
      'END;')
    Left = 480
    Top = 172
    ParamData = <
      item
        DataType = ftString
        Name = 'NR_PROCESSO'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'NR_ITEM'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'NR_PROCESSO'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'NR_ITEM'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'CD_MERCADORIA'
        ParamType = ptUnknown
      end>
  end
  object sp_li_dupl_nve: TStoredProc
    DatabaseName = 'DBBROKER'
    StoredProcName = 'dbo.sp_li_dupl_nve'
    Left = 441
    Top = 344
    ParamData = <
      item
        DataType = ftInteger
        Name = 'Result'
        ParamType = ptResult
        Value = 0
      end
      item
        DataType = ftString
        Name = '@nr_processo'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = '@nr_item'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = '@nr_item_new'
        ParamType = ptInput
      end>
  end
  object qry_mercadoria_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT'
      
        '  CD_MERCADORIA, AP_MERCADORIA, NM_MERCADORIA, PL_MERCADORIA, VL' +
        '_UNITARIO,'
      
        '  CD_IMPORTADOR, CD_GRUPO, CD_UN_MED_COMERC, CD_NCM_SH, CD_NALAD' +
        'I_SH, CD_NALADI_NCCA,'
      
        '  CD_EXPORTADOR, CD_PAIS_AQUISICAO, CD_PAIS_ORIGEM, CD_TIPO_CALC' +
        'ULO, CD_FABR_EXPO,'
      '  CD_FABRICANTE'
      'FROM TMERCADORIA ( NOLOCK )'
      'WHERE CD_MERCADORIA = :CD_MERCADORIA'
      '  AND CD_MERCADORIA IS NOT NULL')
    Left = 576
    Top = 8
    ParamData = <
      item
        DataType = ftString
        Name = 'CD_MERCADORIA'
        ParamType = ptUnknown
      end>
    object qry_mercadoria_CD_MERCADORIA: TStringField
      DisplayWidth = 15
      FieldName = 'CD_MERCADORIA'
      Origin = 'TMERCADORIA.CD_MERCADORIA'
      Size = 15
    end
    object qry_mercadoria_AP_MERCADORIA: TStringField
      FieldName = 'AP_MERCADORIA'
      Origin = 'TMERCADORIA.AP_MERCADORIA'
      Size = 25
    end
    object qry_mercadoria_NM_MERCADORIA: TMemoField
      FieldName = 'NM_MERCADORIA'
      Origin = 'TMERCADORIA.CD_MERCADORIA'
      BlobType = ftMemo
    end
    object qry_mercadoria_PL_MERCADORIA: TFloatField
      FieldName = 'PL_MERCADORIA'
      Origin = 'TMERCADORIA.AP_MERCADORIA'
    end
    object qry_mercadoria_VL_UNITARIO: TFloatField
      FieldName = 'VL_UNITARIO'
      Origin = 'TMERCADORIA.NM_MERCADORIA'
    end
    object qry_mercadoria_CD_IMPORTADOR: TStringField
      FieldName = 'CD_IMPORTADOR'
      Origin = 'TMERCADORIA.PL_MERCADORIA'
      Size = 5
    end
    object qry_mercadoria_CD_GRUPO: TStringField
      FieldName = 'CD_GRUPO'
      Origin = 'TMERCADORIA.VL_UNITARIO'
      Size = 3
    end
    object qry_mercadoria_CD_UN_MED_COMERC: TStringField
      FieldName = 'CD_UN_MED_COMERC'
      Origin = 'TMERCADORIA.CD_IMPORTADOR'
      Size = 3
    end
    object qry_mercadoria_CD_NCM_SH: TStringField
      FieldName = 'CD_NCM_SH'
      Origin = 'TMERCADORIA.CD_GRUPO'
      Size = 11
    end
    object qry_mercadoria_CD_NALADI_SH: TStringField
      FieldName = 'CD_NALADI_SH'
      Origin = 'TMERCADORIA.CD_UN_MED_COMERC'
      Size = 8
    end
    object qry_mercadoria_CD_NALADI_NCCA: TStringField
      FieldName = 'CD_NALADI_NCCA'
      Origin = 'TMERCADORIA.CD_NCM_SH'
      Size = 7
    end
    object qry_mercadoria_CD_EXPORTADOR: TStringField
      FieldName = 'CD_EXPORTADOR'
      Origin = 'TMERCADORIA.CD_NALADI_SH'
      Size = 5
    end
    object qry_mercadoria_CD_PAIS_AQUISICAO: TStringField
      FieldName = 'CD_PAIS_AQUISICAO'
      Origin = 'TMERCADORIA.CD_NALADI_NCCA'
      Size = 3
    end
    object qry_mercadoria_CD_PAIS_ORIGEM: TStringField
      FieldName = 'CD_PAIS_ORIGEM'
      Origin = 'TMERCADORIA.CD_EXPORTADOR'
      Size = 3
    end
    object qry_mercadoria_CD_TIPO_CALCULO: TStringField
      FieldName = 'CD_TIPO_CALCULO'
      Origin = 'TMERCADORIA.CD_PAIS_AQUISICAO'
      Size = 1
    end
    object qry_mercadoria_CD_FABR_EXPO: TStringField
      FieldName = 'CD_FABR_EXPO'
      Origin = 'TMERCADORIA.CD_PAIS_ORIGEM'
      Size = 1
    end
    object qry_mercadoria_CD_FABRICANTE: TStringField
      FieldName = 'CD_FABRICANTE'
      Origin = 'TMERCADORIA.CD_TIPO_CALCULO'
      Size = 5
    end
  end
  object sp_li_calculo: TStoredProc
    DatabaseName = 'DBBROKER'
    StoredProcName = 'dbo.sp_li_calculo'
    Left = 256
    Top = 344
    ParamData = <
      item
        DataType = ftInteger
        Name = 'Result'
        ParamType = ptResult
        Value = 0
      end
      item
        DataType = ftString
        Name = '@nr_processo'
        ParamType = ptInput
      end>
  end
  object qry_fund_legal_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT *'
      'FROM TFUND_LEG_REG_TRIBUT'
      'WHERE ( CODIGO IN'
      ' ( SELECT CD_FUND_LEGAL'
      '   FROM TTP_FUND_LEGAL T'
      
        '   WHERE CD_REGIME_TRIB = :CD_REGIME_TRIB ) AND ( :CODIGO = '#39#39' )' +
        ' ) OR'
      '( CODIGO = :CODIGO )')
    Left = 480
    Top = 64
    ParamData = <
      item
        DataType = ftString
        Name = 'CD_REGIME_TRIB'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'CODIGO'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'CODIGO'
        ParamType = ptUnknown
      end>
  end
  object qry_reg_trib_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT *'
      'FROM TREG_TRIBUTARIO')
    Left = 576
    Top = 64
  end
  object qry_grupo_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT CD_GRUPO'
      'FROM   TEMPRESA_NAC'
      'WHERE  CD_EMPRESA = :CD_EMPRESA')
    Left = 480
    Top = 7
    ParamData = <
      item
        DataType = ftString
        Name = 'CD_EMPRESA'
        ParamType = ptUnknown
      end>
    object qry_grupo_CD_GRUPO: TStringField
      FieldName = 'CD_GRUPO'
      Origin = 'DBBROKER.TEMPRESA_NAC.CD_GRUPO'
      FixedChar = True
      Size = 3
    end
  end
end
