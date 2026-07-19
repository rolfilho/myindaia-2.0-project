object datm_pe_itens: Tdatm_pe_itens
  OldCreateOrder = True
  Left = 357
  Top = 200
  Height = 328
  Width = 587
  object ds_pe: TDataSource
    DataSet = qry_pe_
    Left = 30
    Top = 89
  end
  object qry_pe_: TQuery
    DatabaseName = 'DBBROKER'
    RequestLive = True
    SQL.Strings = (
      
        'SELECT NR_PROCESSO, CD_UNID_NEG, QT_TOTAL_ITENS, CD_EXPORTADOR, ' +
        'VL_TOT_QTDE_PROD, VL_TOT_QTDE_EMBALAGEM,'
      
        '       VL_TOT_CUBAGEM, VL_PESO_LIQUIDO, VL_TOT_EXW, VL_TOT_FOB, ' +
        'VL_FRETE, VL_SEGURO, VL_TOT_MCV, CD_LINGUA_PEDIDO'
      'FROM TPE'
      'WHERE NR_PROCESSO = :NR_PROCESSO AND CD_UNID_NEG = :CD_UNID_NEG'
      '')
    Left = 30
    Top = 16
    ParamData = <
      item
        DataType = ftString
        Name = 'NR_PROCESSO'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'CD_UNID_NEG'
        ParamType = ptUnknown
      end>
    object qry_pe_NR_PROCESSO: TStringField
      FieldName = 'NR_PROCESSO'
      Origin = 'TPE.NR_PROCESSO'
      Size = 18
    end
    object qry_pe_QT_TOTAL_ITENS: TStringField
      FieldName = 'QT_TOTAL_ITENS'
      Origin = 'TPE.NR_PROCESSO'
      Size = 3
    end
    object qry_pe_VL_TOT_QTDE_PROD: TFloatField
      FieldName = 'VL_TOT_QTDE_PROD'
      Origin = 'TPE.NR_PROCESSO'
    end
    object qry_pe_VL_TOT_QTDE_EMBALAGEM: TFloatField
      FieldName = 'VL_TOT_QTDE_EMBALAGEM'
      Origin = 'TPE.QT_TOTAL_ITENS'
    end
    object qry_pe_VL_TOT_CUBAGEM: TFloatField
      FieldName = 'VL_TOT_CUBAGEM'
      Origin = 'TPE.CD_IMPORTADOR'
    end
    object qry_pe_VL_PESO_LIQUIDO: TFloatField
      FieldName = 'VL_PESO_LIQUIDO'
      Origin = 'TPE.VL_TOT_QTDE_PROD'
    end
    object qry_pe_VL_TOT_EXW: TFloatField
      FieldName = 'VL_TOT_EXW'
      Origin = 'TPE.VL_TOT_QTDE_EMBALAGEM'
    end
    object qry_pe_VL_TOT_FOB: TFloatField
      FieldName = 'VL_TOT_FOB'
      Origin = 'TPE.NR_PROCESSO'
    end
    object qry_pe_VL_FRETE: TFloatField
      FieldName = 'VL_FRETE'
      Origin = 'TPE.QT_TOTAL_ITENS'
    end
    object qry_pe_VL_SEGURO: TFloatField
      FieldName = 'VL_SEGURO'
      Origin = 'TPE.CD_IMPORTADOR'
    end
    object qry_pe_VL_TOT_MCV: TFloatField
      FieldName = 'VL_TOT_MCV'
      Origin = 'TPE.VL_TOT_QTDE_PROD'
    end
    object qry_pe_CD_UNID_NEG: TStringField
      FieldName = 'CD_UNID_NEG'
      Origin = 'TPE.NR_PROCESSO'
      Size = 2
    end
    object qry_pe_CD_LINGUA_PEDIDO: TStringField
      FieldName = 'CD_LINGUA_PEDIDO'
      Origin = 'TPE.NR_PROCESSO'
      Size = 1
    end
    object qry_pe_CD_EXPORTADOR: TStringField
      FieldName = 'CD_EXPORTADOR'
      Origin = 'TPE.NR_PROCESSO'
      Size = 5
    end
  end
  object ds_pe_itens_: TDataSource
    DataSet = qry_pe_itens_
    Left = 119
    Top = 89
  end
  object qry_pe_itens_: TQuery
    BeforeInsert = qry_pe_itens_BeforeInsert
    BeforeEdit = qry_pe_itens_BeforeEdit
    DatabaseName = 'DBBROKER'
    RequestLive = True
    SQL.Strings = (
      'SELECT *'
      'FROM TPE_ITEM'
      'WHERE NR_PROCESSO = :NR_PROCESSO AND CD_UNID_NEG = :CD_UNID_NEG'
      '')
    Left = 119
    Top = 16
    ParamData = <
      item
        DataType = ftString
        Name = 'NR_PROCESSO'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'CD_UNID_NEG'
        ParamType = ptUnknown
      end>
    object qry_pe_itens_NR_PROCESSO: TStringField
      DisplayWidth = 18
      FieldName = 'NR_PROCESSO'
      Origin = 'TPE_ITEM.NR_PROCESSO'
      Size = 18
    end
    object qry_pe_itens_NR_ITEM: TStringField
      FieldName = 'NR_ITEM'
      Origin = 'TPE_ITEM.NR_ITEM'
      Size = 3
    end
    object qry_pe_itens_NR_PEDIDO_IMP: TStringField
      FieldName = 'NR_PEDIDO_IMP'
      Origin = 'TPE_ITEM.NR_PEDIDO_IMP'
      Size = 18
    end
    object qry_pe_itens_CD_UNID_NEG: TStringField
      FieldName = 'CD_UNID_NEG'
      Origin = 'TPE_ITEM.NR_PROCESSO'
      Size = 2
    end
    object qry_pe_itens_CD_MERCADORIA: TStringField
      DisplayWidth = 20
      FieldName = 'CD_MERCADORIA'
      Origin = 'TPE_ITEM.CD_MERCADORIA'
    end
    object qry_pe_itens_CD_NCM: TStringField
      FieldName = 'CD_NCM'
      Origin = 'TPE_ITEM.CD_NCM'
      EditMask = '9999.99.99-999;0;_'
      Size = 11
    end
    object qry_pe_itens_CD_NALADI_SH: TStringField
      FieldName = 'CD_NALADI_SH'
      Origin = 'TPE_ITEM.CD_NALADI_SH'
      EditMask = '9999.99.99;0;_'
      Size = 8
    end
    object qry_pe_itens_CD_UNID_MEDIDA: TStringField
      FieldName = 'CD_UNID_MEDIDA'
      Origin = 'TPE_ITEM.CD_UNID_MEDIDA'
      Size = 3
    end
    object qry_pe_itens_CD_EMBALAGEM: TStringField
      FieldName = 'CD_EMBALAGEM'
      Origin = 'TPE_ITEM.CD_EMBALAGEM'
      Size = 4
    end
    object qry_pe_itens_CD_CLASSIF_EMBALAGEM: TStringField
      FieldName = 'CD_CLASSIF_EMBALAGEM'
      Origin = 'TPE_ITEM.CD_CLASSIF_EMBALAGEM'
      Size = 30
    end
    object qry_pe_itens_CD_FABR_EXPO: TStringField
      FieldName = 'CD_FABR_EXPO'
      Origin = 'TPE_ITEM.CD_FABR_EXPO'
      Size = 1
    end
    object qry_pe_itens_QT_POR_EMB: TFloatField
      FieldName = 'QT_POR_EMB'
      Origin = 'TPE_ITEM.QT_POR_EMB'
      DisplayFormat = '#0'
      EditFormat = '#0'
    end
    object qry_pe_itens_QT_EMBALAGEM: TFloatField
      FieldName = 'QT_EMBALAGEM'
      Origin = 'TPE_ITEM.QT_EMBALAGEM'
      DisplayFormat = '#0'
      EditFormat = '#0'
    end
    object qry_pe_itens_QT_MERCADORIA: TFloatField
      FieldName = 'QT_MERCADORIA'
      Origin = 'TPE_ITEM.QT_MERCADORIA'
      DisplayFormat = '#0,.00'
      EditFormat = '#0.00'
    end
    object qry_pe_itens_VL_UNITARIO: TFloatField
      FieldName = 'VL_UNITARIO'
      Origin = 'TPE_ITEM.VL_UNITARIO'
      DisplayFormat = '#0,.000000'
      EditFormat = '#0.000000'
    end
    object qry_pe_itens_VL_PESO_LIQ_UNIT: TFloatField
      FieldName = 'VL_PESO_LIQ_UNIT'
      Origin = 'TPE_ITEM.VL_PESO_LIQ_UNIT'
      DisplayFormat = '#0,.0000'
      EditFormat = '#0.0000'
    end
    object qry_pe_itens_VL_COMPRIMENTO_EMB: TFloatField
      FieldName = 'VL_COMPRIMENTO_EMB'
      Origin = 'TPE_ITEM.VL_COMPRIMENTO_EMB'
      DisplayFormat = '#0,.00'
      EditFormat = '#0.00'
    end
    object qry_pe_itens_VL_LARGURA_EMB: TFloatField
      FieldName = 'VL_LARGURA_EMB'
      Origin = 'TPE_ITEM.VL_LARGURA_EMB'
      DisplayFormat = '#0,.00'
      EditFormat = '#0.00'
    end
    object qry_pe_itens_VL_ALTURA_EMB: TFloatField
      FieldName = 'VL_ALTURA_EMB'
      Origin = 'TPE_ITEM.VL_ALTURA_EMB'
      DisplayFormat = '#0,.00'
      EditFormat = '#0.00'
    end
    object qry_pe_itens_VL_PESO_EMB: TFloatField
      FieldName = 'VL_PESO_EMB'
      Origin = 'TPE_ITEM.VL_PESO_EMB'
      DisplayFormat = '#0,.0000'
      EditFormat = '#0.0000'
    end
    object qry_pe_itens_VL_TOT_ITEM: TFloatField
      FieldName = 'VL_TOT_ITEM'
      Origin = 'TPE_ITEM.VL_TOT_ITEM'
      DisplayFormat = '#0,.00'
      EditFormat = '#0.00'
    end
    object qry_pe_itens_VL_TOT_PESO_LIQ: TFloatField
      FieldName = 'VL_TOT_PESO_LIQ'
      Origin = 'TPE_ITEM.VL_TOT_PESO_LIQ'
      DisplayFormat = '#0,.0000'
      EditFormat = '#0.0000'
    end
    object qry_pe_itens_VL_TOT_PESO_BRUTO: TFloatField
      FieldName = 'VL_TOT_PESO_BRUTO'
      Origin = 'TPE_ITEM.VL_TOT_PESO_BRUTO'
      DisplayFormat = '#0,.0000'
      EditFormat = '#0.0000'
    end
    object qry_pe_itens_VL_CUBAGEM: TFloatField
      FieldName = 'VL_CUBAGEM'
      Origin = 'TPE_ITEM.VL_CUBAGEM'
      DisplayFormat = '#0,.00'
      EditFormat = '#0.00'
    end
    object qry_pe_itens_VL_MLE: TFloatField
      FieldName = 'VL_MLE'
      Origin = 'TPE_ITEM.VL_MLE'
      DisplayFormat = '#0,.00'
      EditFormat = '#0.00'
    end
    object qry_pe_itens_VL_MCV: TFloatField
      FieldName = 'VL_MCV'
      Origin = 'TPE_ITEM.VL_MCV'
      DisplayFormat = '#0,.00'
      EditFormat = '#0.00'
    end
    object qry_pe_itens_TX_MERCADORIA: TMemoField
      FieldName = 'TX_MERCADORIA'
      Origin = 'TPE_ITEM.TX_MERCADORIA'
      BlobType = ftMemo
    end
    object qry_pe_itens_VL_POR_EMB: TFloatField
      FieldName = 'VL_POR_EMB'
      Origin = 'TPE_ITEM.NR_PROCESSO'
      DisplayFormat = '#0,.00'
      EditFormat = '#0.00'
    end
    object qry_pe_itens_LookNmEmbalagem: TStringField
      FieldKind = fkLookup
      FieldName = 'LookNmEmbalagem'
      LookupDataSet = qry_embalagem_
      LookupKeyFields = 'CD_EMBALAGEM'
      LookupResultField = 'NM_EMBALAGEM_S'
      KeyFields = 'CD_EMBALAGEM'
      Size = 60
      Lookup = True
    end
    object qry_pe_itens_LookNmUnidade: TStringField
      FieldKind = fkLookup
      FieldName = 'LookNmUnidade'
      LookupDataSet = qry_unid_medida_
      LookupKeyFields = 'CD_UNID_MEDIDA'
      LookupResultField = 'NM_UNID_MEDIDA'
      KeyFields = 'CD_UNID_MEDIDA'
      Size = 60
      Lookup = True
    end
    object qry_pe_itens_LookNmMercadoria: TStringField
      FieldKind = fkLookup
      FieldName = 'LookNmMercadoria'
      LookupDataSet = qry_mercadoria_lookup_
      LookupKeyFields = 'CD_MERCADORIA'
      LookupResultField = 'AP_MERCADORIA'
      KeyFields = 'CD_MERCADORIA'
      Size = 60
      Lookup = True
    end
    object qry_pe_itens_CD_EMBALAGEM_SUP: TStringField
      FieldName = 'CD_EMBALAGEM_SUP'
      Origin = 'TPE_ITEM.NR_PROCESSO'
      Size = 4
    end
    object qry_pe_itens_CD_CLASSIF_EMBALAGEM_SUP: TStringField
      FieldName = 'CD_CLASSIF_EMBALAGEM_SUP'
      Origin = 'TPE_ITEM.NR_ITEM'
      Size = 30
    end
    object qry_pe_itens_QT_POR_EMB_SUP: TFloatField
      FieldName = 'QT_POR_EMB_SUP'
      Origin = 'TPE_ITEM.CD_UNID_NEG'
      DisplayFormat = '#0'
      EditFormat = '#0'
    end
    object qry_pe_itens_QT_EMBALAGEM_SUP: TFloatField
      FieldName = 'QT_EMBALAGEM_SUP'
      Origin = 'TPE_ITEM.NR_PEDIDO_IMP'
      DisplayFormat = '#0'
      EditFormat = '#0'
    end
    object qry_pe_itens_LookNmEmbSup: TStringField
      FieldKind = fkLookup
      FieldName = 'LookNmEmbSup'
      LookupDataSet = qry_emb_sup
      LookupKeyFields = 'CD_EMBALAGEM'
      LookupResultField = 'NM_EMBALAGEM_S'
      KeyFields = 'CD_EMBALAGEM_SUP'
      Size = 60
      Lookup = True
    end
    object qry_pe_itens_VL_POR_EMB_SUP: TFloatField
      FieldName = 'VL_POR_EMB_SUP'
      Origin = 'TPE_ITEM.NR_PROCESSO'
      DisplayFormat = '#0,.00'
      EditFormat = '#0.00'
    end
    object qry_pe_itens_CD_EMBALAGEM_CLIENTE: TStringField
      FieldName = 'CD_EMBALAGEM_CLIENTE'
      Origin = 'TPE_ITEM.CD_NCM'
      Size = 10
    end
    object qry_pe_itens_CD_FABRICANTE: TStringField
      FieldName = 'CD_FABRICANTE'
      Origin = 'TPE_ITEM.CD_NCM'
      Size = 5
    end
    object qry_pe_itens_NR_PEDIDO: TStringField
      FieldName = 'NR_PEDIDO'
      Origin = 'TPE_ITEM.CD_NALADI_SH'
      Size = 18
    end
    object qry_pe_itens_LookFabricante: TStringField
      FieldKind = fkLookup
      FieldName = 'LookFabricante'
      LookupDataSet = qry_emp_est_
      LookupKeyFields = 'CD_EMPRESA'
      LookupResultField = 'NM_EMPRESA'
      KeyFields = 'CD_FABRICANTE'
      Size = 60
      Lookup = True
    end
  end
  object qry_exec_sp_: TQuery
    DatabaseName = 'DBBROKER'
    ParamCheck = False
    SQL.Strings = (
      ''
      '')
    Left = 119
    Top = 224
  end
  object qry_ncm_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT CODIGO, DESCRICAO, UNIDADE_MEDIDA'
      'FROM TNCM'
      'WHERE CODIGO = :CODIGO')
    Left = 30
    Top = 151
    ParamData = <
      item
        DataType = ftString
        Name = 'CODIGO'
        ParamType = ptUnknown
      end>
    object qry_ncm_CODIGO: TStringField
      FieldName = 'CODIGO'
      Origin = 'TNCM.CODIGO'
      Size = 8
    end
    object qry_ncm_DESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Origin = 'TNCM.DESCRICAO'
      Size = 120
    end
    object qry_ncm_UNIDADE_MEDIDA: TStringField
      FieldName = 'UNIDADE_MEDIDA'
      Origin = 'TNCM.UNIDADE_MEDIDA'
      Size = 4
    end
  end
  object qry_naladi_: TQuery
    DatabaseName = 'DBBROKER'
    ParamCheck = False
    SQL.Strings = (
      'SELECT *'
      'FROM TNALADISH'
      'WHERE CODIGO = :CODIGO')
    Left = 30
    Top = 224
    ParamData = <
      item
        DataType = ftString
        Name = 'CODIGO'
        ParamType = ptUnknown
      end>
    object qry_naladi_Codigo: TStringField
      FieldName = 'Codigo'
      Origin = 'TNALADISH.Codigo'
      Size = 8
    end
    object qry_naladi_Descricao: TStringField
      FieldName = 'Descricao'
      Origin = 'TNALADISH.Descricao'
      Size = 120
    end
  end
  object qry_embalagem_: TQuery
    DatabaseName = 'DBBROKER'
    ParamCheck = False
    SQL.Strings = (
      
        'SELECT CD_EMBALAGEM, NM_EMBALAGEM_S, CD_EMBALAGEM_SUP, QT_EMBALA' +
        'GEM_SUP'
      'FROM TEMBALAGEM')
    Left = 340
    Top = 151
    object qry_embalagem_CD_EMBALAGEM: TStringField
      FieldName = 'CD_EMBALAGEM'
      Origin = 'TEMBALAGEM.CD_EMBALAGEM'
      Size = 4
    end
    object qry_embalagem_NM_EMBALAGEM_S: TStringField
      FieldName = 'NM_EMBALAGEM_S'
      Origin = 'TEMBALAGEM.CD_EMBALAGEM'
      Size = 50
    end
    object qry_embalagem_CD_EMBALAGEM_SUP: TStringField
      FieldName = 'CD_EMBALAGEM_SUP'
      Origin = 'TEMBALAGEM.CD_EMBALAGEM'
      Size = 4
    end
    object qry_embalagem_QT_EMBALAGEM_SUP: TFloatField
      FieldName = 'QT_EMBALAGEM_SUP'
      Origin = 'TEMBALAGEM.NM_EMBALAGEM_S'
    end
  end
  object qry_unid_medida_: TQuery
    DatabaseName = 'DBBROKER'
    SessionName = 'Default'
    ParamCheck = False
    SQL.Strings = (
      'SELECT CD_UNID_MEDIDA, NM_UNID_MEDIDA'
      'FROM TUNID_MEDIDA_BROKER'
      '')
    Left = 340
    Top = 224
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
  end
  object qry_emp_nac_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT CD_EMPRESA, NM_EMPRESA, CD_GRUPO'
      'FROM TEMPRESA_NAC'
      'WHERE IN_ATIVO = '#39'1'#39)
    Left = 229
    Top = 16
    object qry_emp_nac_CD_EMPRESA: TStringField
      FieldName = 'CD_EMPRESA'
      Origin = 'TEMPRESA_NAC.CD_EMPRESA'
      Size = 5
    end
    object qry_emp_nac_NM_EMPRESA: TStringField
      FieldName = 'NM_EMPRESA'
      Origin = 'TEMPRESA_NAC.NM_EMPRESA'
      Size = 50
    end
    object qry_emp_nac_CD_GRUPO: TStringField
      FieldName = 'CD_GRUPO'
      Origin = 'TEMPRESA_NAC.CD_GRUPO'
      Size = 3
    end
  end
  object ds_emp_nac: TDataSource
    DataSet = qry_emp_nac_
    Left = 229
    Top = 89
  end
  object qry_mercadoria_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      
        'SELECT CD_MERCADORIA, AP_MERCADORIA, NM_MERCADORIA, PL_MERCADORI' +
        'A, VL_UNITARIO, CD_IMPORTADOR, CD_GRUPO, CD_UN_MED_COMERC, CD_NC' +
        'M_SH, CD_NALADI_SH, CD_NALADI_NCCA, CD_EXPORTADOR, CD_PAIS_AQUIS' +
        'ICAO, CD_PAIS_ORIGEM, CD_TIPO_CALCULO, CD_FABR_EXPO, CD_FABRICAN' +
        'TE, CD_EMBALAGEM, QT_POR_EMBALAGEM, TX_DESC_INGLES, TX_DESC_ESP'
      'FROM TMERCADORIA_EXP'
      'WHERE CD_MERCADORIA = :CD_MERCADORIA'
      'AND CD_MERCADORIA IS NOT NULL'
      '')
    Left = 119
    Top = 151
    ParamData = <
      item
        DataType = ftString
        Name = 'CD_MERCADORIA'
        ParamType = ptUnknown
      end>
    object qry_mercadoria_CD_MERCADORIA: TStringField
      DisplayWidth = 20
      FieldName = 'CD_MERCADORIA'
      Origin = 'TMERCADORIA.CD_MERCADORIA'
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
    object qry_mercadoria_CD_EMBALAGEM: TStringField
      FieldName = 'CD_EMBALAGEM'
      Origin = 'TMERCADORIA.CD_MERCADORIA'
      Size = 4
    end
    object qry_mercadoria_QT_POR_EMBALAGEM: TFloatField
      FieldName = 'QT_POR_EMBALAGEM'
      Origin = 'TMERCADORIA.AP_MERCADORIA'
    end
    object qry_mercadoria_TX_DESC_INGLES: TMemoField
      FieldName = 'TX_DESC_INGLES'
      Origin = 'TMERCADORIA.CD_MERCADORIA'
      BlobType = ftMemo
    end
    object qry_mercadoria_TX_DESC_ESP: TMemoField
      FieldName = 'TX_DESC_ESP'
      Origin = 'TMERCADORIA.AP_MERCADORIA'
      BlobType = ftMemo
    end
  end
  object qry_mercadoria_lookup_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT CD_MERCADORIA, AP_MERCADORIA'
      'FROM TMERCADORIA_EXP')
    Left = 229
    Top = 151
    object qry_mercadoria_lookup_CD_MERCADORIA: TStringField
      DisplayWidth = 20
      FieldName = 'CD_MERCADORIA'
      Origin = 'TMERCADORIA.CD_MERCADORIA'
    end
    object qry_mercadoria_lookup_AP_MERCADORIA: TStringField
      FieldName = 'AP_MERCADORIA'
      Origin = 'TMERCADORIA.AP_MERCADORIA'
      Size = 25
    end
  end
  object qry_emb_sup: TQuery
    DatabaseName = 'DBBROKER'
    ParamCheck = False
    SQL.Strings = (
      'SELECT CD_EMBALAGEM, NM_EMBALAGEM_S'
      'FROM TEMBALAGEM')
    Left = 229
    Top = 224
    object StringField1: TStringField
      FieldName = 'CD_EMBALAGEM'
      Origin = 'TEMBALAGEM.CD_EMBALAGEM'
      Size = 4
    end
    object qry_emb_supNM_EMBALAGEM_S: TStringField
      FieldName = 'NM_EMBALAGEM_S'
      Origin = 'TEMBALAGEM.CD_EMBALAGEM'
      Size = 50
    end
  end
  object ds_emp_est: TDataSource
    DataSet = qry_emp_est_
    Left = 340
    Top = 89
  end
  object qry_emp_est_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT CD_EMPRESA, NM_EMPRESA'
      'FROM TEMPRESA_EST'
      'WHERE IN_ATIVO = '#39'1'#39)
    Left = 341
    Top = 24
    object qry_emp_est_CD_EMPRESA: TStringField
      FieldName = 'CD_EMPRESA'
      Origin = 'TEMPRESA_EST.CD_EMPRESA'
      Size = 5
    end
    object qry_emp_est_NM_EMPRESA: TStringField
      FieldName = 'NM_EMPRESA'
      Origin = 'TEMPRESA_EST.NM_EMPRESA'
      Size = 60
    end
  end
end
