object datm_DocumentosExportacao: Tdatm_DocumentosExportacao
  OldCreateOrder = False
  Left = 879
  Top = 208
  Height = 451
  Width = 534
  object SQLConnection: TSQLConnection
    ConnectionName = 'MSSQLConnection'
    DriverName = 'MSSQL'
    GetDriverFunc = 'getSQLDriverMSSQL'
    LibraryName = 'dbexpmss.dll'
    LoginPrompt = False
    Params.Strings = (
      'DriverName=MSSQL'
      'HostName=INDAIA10'
      'DataBase=BROKER'
      'User_Name=SA'
      'Password=123'
      'BlobSize=-1'
      'ErrorResourceFile='
      'LocaleCode=0000'
      'MSSQL TransIsolation=ReadCommited'
      'OS Authentication=False')
    VendorLib = 'oledb'
    Connected = True
    Left = 35
    Top = 7
  end
  object qryUnidadeNeg: TSQLQuery
    MaxBlobSize = -1
    Params = <>
    SQL.Strings = (
      'SELECT CD_UNID_NEG '
      ',CD_UNID_NEG + '#39' - '#39' +  NM_UNID_NEG AS NM_UNID_NEG'
      'FROM TUNID_NEG'
      'ORDER BY CD_UNID_NEG ')
    SQLConnection = SQLConnection
    Left = 118
    Top = 4
    object qryUnidadeNegCD_UNID_NEG: TStringField
      FieldName = 'CD_UNID_NEG'
      Required = True
      FixedChar = True
      Size = 2
    end
    object qryUnidadeNegNM_UNID_NEG: TStringField
      FieldName = 'NM_UNID_NEG'
      Required = True
      FixedChar = True
      Size = 55
    end
  end
  object dspUnidadeNeg: TDataSetProvider
    DataSet = qryUnidadeNeg
    Left = 205
    Top = 4
  end
  object cdsUnidadeNeg: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspUnidadeNeg'
    Left = 292
    Top = 4
    object cdsUnidadeNegCD_UNID_NEG: TStringField
      FieldName = 'CD_UNID_NEG'
      Required = True
      FixedChar = True
      Size = 2
    end
    object cdsUnidadeNegNM_UNID_NEG: TStringField
      FieldName = 'NM_UNID_NEG'
      Required = True
      FixedChar = True
      Size = 55
    end
  end
  object dsUnidadeNeg: TDataSource
    DataSet = cdsUnidadeNeg
    Left = 374
    Top = 4
  end
  object dsProduto: TDataSource
    DataSet = cdsProduto
    Left = 371
    Top = 63
  end
  object cdsProduto: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspProduto'
    Left = 292
    Top = 62
    object cdsProdutoCD_PRODUTO: TStringField
      FieldName = 'CD_PRODUTO'
      Required = True
      FixedChar = True
      Size = 2
    end
    object cdsProdutoNM_PRODUTO: TStringField
      FieldName = 'NM_PRODUTO'
      Required = True
      FixedChar = True
      Size = 45
    end
  end
  object dspProduto: TDataSetProvider
    DataSet = qryProduto
    Left = 208
    Top = 60
  end
  object qryProduto: TSQLQuery
    MaxBlobSize = -1
    Params = <>
    SQL.Strings = (
      'SELECT CD_PRODUTO '
      ',CD_PRODUTO + '#39' - '#39' + NM_PRODUTO AS NM_PRODUTO'
      ' FROM TPRODUTO'
      'ORDER BY CD_PRODUTO ')
    SQLConnection = SQLConnection
    Left = 112
    Top = 61
    object qryProdutoCD_PRODUTO: TStringField
      FieldName = 'CD_PRODUTO'
      Required = True
      FixedChar = True
      Size = 2
    end
    object qryProdutoNM_PRODUTO: TStringField
      FieldName = 'NM_PRODUTO'
      Required = True
      FixedChar = True
      Size = 45
    end
  end
  object qryPackingList: TSQLQuery
    MaxBlobSize = -1
    Params = <>
    SQLConnection = SQLConnection
    Left = 54
    Top = 183
    object qryPackingListNR_PROCESSO: TStringField
      FieldName = 'NR_PROCESSO'
      Required = True
      FixedChar = True
      Size = 18
    end
    object qryPackingListEXPORT_EMPRESA: TStringField
      FieldName = 'EXPORT_EMPRESA'
      FixedChar = True
      Size = 80
    end
    object qryPackingListEXPORT_CNPJ: TStringField
      FieldName = 'EXPORT_CNPJ'
      FixedChar = True
      Size = 18
    end
    object qryPackingListEXPORT_CIDADE_NUMERO: TStringField
      FieldName = 'EXPORT_CIDADE_NUMERO'
      FixedChar = True
      Size = 500
    end
    object qryPackingListEXPORT_ESTADO_PAIS: TStringField
      FieldName = 'EXPORT_ESTADO_PAIS'
      FixedChar = True
      Size = 509
    end
    object qryPackingListEXPORT_TELEFONE: TStringField
      FieldName = 'EXPORT_TELEFONE'
      FixedChar = True
      Size = 15
    end
    object qryPackingListEXPORT_CEP: TStringField
      FieldName = 'EXPORT_CEP'
      FixedChar = True
      Size = 9
    end
    object qryPackingListCIDADE_DATA_ESPANHOL: TStringField
      FieldName = 'CIDADE_DATA_ESPANHOL'
      Size = 131
    end
    object qryPackingListCIDADE_DATA_PORTUGUES: TStringField
      FieldName = 'CIDADE_DATA_PORTUGUES'
      Size = 131
    end
    object qryPackingListCIDADE_DATA_INGLES: TStringField
      FieldName = 'CIDADE_DATA_INGLES'
      FixedChar = True
      Size = 61
    end
    object qryPackingListNR_FATURA: TStringField
      FieldName = 'NR_FATURA'
      FixedChar = True
      Size = 30
    end
    object qryPackingListIMPORT_EMPRESA: TStringField
      FieldName = 'IMPORT_EMPRESA'
      FixedChar = True
      Size = 100
    end
    object qryPackingListIMPORT_CIDADE_ESTADO: TStringField
      FieldName = 'IMPORT_CIDADE_ESTADO'
      FixedChar = True
      Size = 500
    end
    object qryPackingListIMPORT_PAIS_ING: TStringField
      FieldName = 'IMPORT_PAIS_ING'
      FixedChar = True
      Size = 50
    end
    object qryPackingListIMPORT_PAIS_ESP: TStringField
      FieldName = 'IMPORT_PAIS_ESP'
      FixedChar = True
      Size = 50
    end
    object qryPackingListIMPORT_PAIS_POR: TStringField
      FieldName = 'IMPORT_PAIS_POR'
      FixedChar = True
      Size = 120
    end
    object qryPackingListPAIS_ORIGEM: TStringField
      FieldName = 'PAIS_ORIGEM'
      Required = True
      FixedChar = True
      Size = 6
    end
    object qryPackingListDS_PORTO_EMBARQUE: TStringField
      FieldName = 'DS_PORTO_EMBARQUE'
      FixedChar = True
      Size = 62
    end
    object qryPackingListDS_PORTO_DESTINO_ESP: TStringField
      FieldName = 'DS_PORTO_DESTINO_ESP'
      FixedChar = True
      Size = 200
    end
    object qryPackingListDS_PORTO_DESTINO_ING: TStringField
      FieldName = 'DS_PORTO_DESTINO_ING'
      FixedChar = True
      Size = 200
    end
    object qryPackingListDS_PORTO_DESTINO_POR: TStringField
      FieldName = 'DS_PORTO_DESTINO_POR'
      FixedChar = True
      Size = 200
    end
    object qryPackingListNM_VIA_TRANSPORTE_ING: TStringField
      FieldName = 'NM_VIA_TRANSPORTE_ING'
      FixedChar = True
    end
    object qryPackingListNM_VIA_TRANSPORTE_ESP: TStringField
      FieldName = 'NM_VIA_TRANSPORTE_ESP'
      FixedChar = True
    end
    object qryPackingListNM_VIA_TRANSPORTE_POR: TStringField
      FieldName = 'NM_VIA_TRANSPORTE_POR'
      FixedChar = True
    end
    object qryPackingListPATH_LOGO: TStringField
      FieldName = 'PATH_LOGO'
      FixedChar = True
      Size = 100
    end
    object qryPackingListTX_INF_EMBALAGEM: TStringField
      FieldName = 'TX_INF_EMBALAGEM'
      Required = True
      FixedChar = True
      Size = 1000
    end
    object qryPackingListPAIS_DESTINO_ESP: TStringField
      FieldName = 'PAIS_DESTINO_ESP'
      FixedChar = True
      Size = 50
    end
    object qryPackingListPAIS_DESTINO_ING: TStringField
      FieldName = 'PAIS_DESTINO_ING'
      FixedChar = True
      Size = 50
    end
    object qryPackingListPAIS_DESTINO_POR: TStringField
      FieldName = 'PAIS_DESTINO_POR'
      FixedChar = True
      Size = 120
    end
    object qryPackingListCIDADE_ORIGEM: TStringField
      FieldName = 'CIDADE_ORIGEM'
      Required = True
      FixedChar = True
      Size = 30
    end
    object qryPackingListVL_PESO_BRUTO: TFloatField
      FieldName = 'VL_PESO_BRUTO'
    end
    object qryPackingListVL_PESO_LIQUIDO: TFloatField
      FieldName = 'VL_PESO_LIQUIDO'
    end
    object qryPackingListVL_TOT_CUBAGEM: TFloatField
      FieldName = 'VL_TOT_CUBAGEM'
    end
    object qryPackingListQT_TOTAL_MERCADORIA: TFloatField
      FieldName = 'QT_TOTAL_MERCADORIA'
    end
    object qryPackingListNR_ORDEM: TStringField
      FieldName = 'NR_ORDEM'
      Size = 30
    end
    object qryPackingListMODAL: TStringField
      FieldName = 'MODAL'
      Size = 5
    end
  end
  object dspPackingList: TDataSetProvider
    DataSet = qryPackingList
    Left = 56
    Top = 240
  end
  object cdsPackingList: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspPackingList'
    Left = 54
    Top = 290
    object cdsPackingListNR_PROCESSO: TStringField
      FieldName = 'NR_PROCESSO'
      Required = True
      FixedChar = True
      Size = 18
    end
    object cdsPackingListEXPORT_EMPRESA: TStringField
      FieldName = 'EXPORT_EMPRESA'
      FixedChar = True
      Size = 80
    end
    object cdsPackingListEXPORT_CNPJ: TStringField
      FieldName = 'EXPORT_CNPJ'
      FixedChar = True
      Size = 18
    end
    object cdsPackingListEXPORT_CIDADE_NUMERO: TStringField
      FieldName = 'EXPORT_CIDADE_NUMERO'
      FixedChar = True
      Size = 500
    end
    object cdsPackingListEXPORT_ESTADO_PAIS: TStringField
      FieldName = 'EXPORT_ESTADO_PAIS'
      FixedChar = True
      Size = 509
    end
    object cdsPackingListEXPORT_TELEFONE: TStringField
      FieldName = 'EXPORT_TELEFONE'
      FixedChar = True
      Size = 15
    end
    object cdsPackingListEXPORT_CEP: TStringField
      FieldName = 'EXPORT_CEP'
      FixedChar = True
      Size = 9
    end
    object cdsPackingListCIDADE_DATA_ESPANHOL: TStringField
      FieldName = 'CIDADE_DATA_ESPANHOL'
      Size = 131
    end
    object cdsPackingListCIDADE_DATA_PORTUGUES: TStringField
      FieldName = 'CIDADE_DATA_PORTUGUES'
      Size = 131
    end
    object cdsPackingListCIDADE_DATA_INGLES: TStringField
      FieldName = 'CIDADE_DATA_INGLES'
      FixedChar = True
      Size = 61
    end
    object cdsPackingListNR_FATURA: TStringField
      FieldName = 'NR_FATURA'
      FixedChar = True
      Size = 30
    end
    object cdsPackingListIMPORT_EMPRESA: TStringField
      FieldName = 'IMPORT_EMPRESA'
      FixedChar = True
      Size = 100
    end
    object cdsPackingListIMPORT_CIDADE_ESTADO: TStringField
      FieldName = 'IMPORT_CIDADE_ESTADO'
      FixedChar = True
      Size = 500
    end
    object cdsPackingListIMPORT_PAIS_ING: TStringField
      FieldName = 'IMPORT_PAIS_ING'
      FixedChar = True
      Size = 50
    end
    object cdsPackingListIMPORT_PAIS_ESP: TStringField
      FieldName = 'IMPORT_PAIS_ESP'
      FixedChar = True
      Size = 50
    end
    object cdsPackingListIMPORT_PAIS_POR: TStringField
      FieldName = 'IMPORT_PAIS_POR'
      FixedChar = True
      Size = 120
    end
    object cdsPackingListPAIS_ORIGEM: TStringField
      FieldName = 'PAIS_ORIGEM'
      Required = True
      FixedChar = True
      Size = 6
    end
    object cdsPackingListDS_PORTO_EMBARQUE: TStringField
      FieldName = 'DS_PORTO_EMBARQUE'
      FixedChar = True
      Size = 62
    end
    object cdsPackingListDS_PORTO_DESTINO_ESP: TStringField
      FieldName = 'DS_PORTO_DESTINO_ESP'
      FixedChar = True
      Size = 200
    end
    object cdsPackingListDS_PORTO_DESTINO_ING: TStringField
      FieldName = 'DS_PORTO_DESTINO_ING'
      FixedChar = True
      Size = 200
    end
    object cdsPackingListDS_PORTO_DESTINO_POR: TStringField
      FieldName = 'DS_PORTO_DESTINO_POR'
      FixedChar = True
      Size = 200
    end
    object cdsPackingListNM_VIA_TRANSPORTE_ING: TStringField
      FieldName = 'NM_VIA_TRANSPORTE_ING'
      FixedChar = True
    end
    object cdsPackingListNM_VIA_TRANSPORTE_ESP: TStringField
      FieldName = 'NM_VIA_TRANSPORTE_ESP'
      FixedChar = True
    end
    object cdsPackingListNM_VIA_TRANSPORTE_POR: TStringField
      FieldName = 'NM_VIA_TRANSPORTE_POR'
      FixedChar = True
    end
    object cdsPackingListPATH_LOGO: TStringField
      FieldName = 'PATH_LOGO'
      FixedChar = True
      Size = 100
    end
    object cdsPackingListTX_INF_EMBALAGEM: TStringField
      FieldName = 'TX_INF_EMBALAGEM'
      Required = True
      FixedChar = True
      Size = 1000
    end
    object cdsPackingListPAIS_DESTINO_ESP: TStringField
      FieldName = 'PAIS_DESTINO_ESP'
      FixedChar = True
      Size = 50
    end
    object cdsPackingListPAIS_DESTINO_ING: TStringField
      FieldName = 'PAIS_DESTINO_ING'
      FixedChar = True
      Size = 50
    end
    object cdsPackingListPAIS_DESTINO_POR: TStringField
      FieldName = 'PAIS_DESTINO_POR'
      FixedChar = True
      Size = 120
    end
    object cdsPackingListCIDADE_ORIGEM: TStringField
      FieldName = 'CIDADE_ORIGEM'
      Required = True
      FixedChar = True
      Size = 30
    end
    object cdsPackingListVL_PESO_BRUTO: TFloatField
      FieldName = 'VL_PESO_BRUTO'
      DisplayFormat = '#,0.00'
    end
    object cdsPackingListVL_PESO_LIQUIDO: TFloatField
      FieldName = 'VL_PESO_LIQUIDO'
      DisplayFormat = '#,0.00'
    end
    object cdsPackingListVL_TOT_CUBAGEM: TFloatField
      FieldName = 'VL_TOT_CUBAGEM'
      DisplayFormat = '#,0.000'
    end
    object cdsPackingListQT_TOTAL_MERCADORIA: TFloatField
      FieldName = 'QT_TOTAL_MERCADORIA'
    end
    object cdsPackingListNR_ORDEM: TStringField
      FieldName = 'NR_ORDEM'
      Size = 30
    end
    object cdsPackingListMODAL: TStringField
      FieldName = 'MODAL'
      Size = 5
    end
  end
  object dsPackingList: TDataSource
    DataSet = cdsPackingList
    Left = 54
    Top = 344
  end
  object dsPackingListItem: TDataSource
    DataSet = cdsPackingListItem
    Left = 139
    Top = 344
  end
  object cdsPackingListItem: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspPackingListItem'
    Left = 140
    Top = 292
    object cdsPackingListItemNR_PROCESSO: TStringField
      FieldName = 'NR_PROCESSO'
      Required = True
      FixedChar = True
      Size = 18
    end
    object cdsPackingListItemCD_MERCADORIA: TStringField
      FieldName = 'CD_MERCADORIA'
      FixedChar = True
      Size = 40
    end
    object cdsPackingListItemMERCADORIA_ING: TStringField
      FieldName = 'MERCADORIA_ING'
      FixedChar = True
      Size = 200
    end
    object cdsPackingListItemMERCADORIA_ESP: TStringField
      FieldName = 'MERCADORIA_ESP'
      FixedChar = True
      Size = 200
    end
    object cdsPackingListItemMERCADORIA_POR: TStringField
      FieldName = 'MERCADORIA_POR'
      FixedChar = True
      Size = 200
    end
    object cdsPackingListItemCD_UNID_MEDIDA: TStringField
      FieldName = 'CD_UNID_MEDIDA'
      Required = True
      FixedChar = True
      Size = 3
    end
    object cdsPackingListItemUNIDADE_MEDIDA_ING: TStringField
      FieldName = 'UNIDADE_MEDIDA_ING'
      FixedChar = True
      Size = 100
    end
    object cdsPackingListItemUNIDADE_MEDIDA_ESP: TStringField
      FieldName = 'UNIDADE_MEDIDA_ESP'
      FixedChar = True
      Size = 100
    end
    object cdsPackingListItemUNIDADE_MEDIDA_POR: TStringField
      FieldName = 'UNIDADE_MEDIDA_POR'
      FixedChar = True
      Size = 50
    end
    object cdsPackingListItemQT_MERCADORIA: TFloatField
      FieldName = 'QT_MERCADORIA'
    end
    object cdsPackingListItemVL_TOT_PESO_BRUTO: TFloatField
      FieldName = 'VL_TOT_PESO_BRUTO'
      DisplayFormat = '#,0.00'
    end
    object cdsPackingListItemVL_TOT_PESO_LIQ: TFloatField
      FieldName = 'VL_TOT_PESO_LIQ'
      DisplayFormat = '#,0.00'
    end
    object cdsPackingListItemVL_UNITARIO: TFloatField
      FieldName = 'VL_UNITARIO'
      DisplayFormat = '#,0.00'
    end
    object cdsPackingListItemVL_TOT_ITEM: TFloatField
      FieldName = 'VL_TOT_ITEM'
      DisplayFormat = '#,0.00'
    end
    object cdsPackingListItemNR_PEDIDO: TStringField
      FieldName = 'NR_PEDIDO'
      FixedChar = True
      Size = 30
    end
    object cdsPackingListItemEMBALAGEM: TStringField
      FieldName = 'EMBALAGEM'
      Size = 30
    end
  end
  object dspPackingListItem: TDataSetProvider
    DataSet = qryPackingListItem
    Left = 138
    Top = 240
  end
  object qryPackingListItem: TSQLQuery
    MaxBlobSize = -1
    Params = <>
    SQLConnection = SQLConnection
    Left = 139
    Top = 183
    object qryPackingListItemNR_PROCESSO: TStringField
      FieldName = 'NR_PROCESSO'
      Required = True
      FixedChar = True
      Size = 18
    end
    object qryPackingListItemCD_MERCADORIA: TStringField
      FieldName = 'CD_MERCADORIA'
      FixedChar = True
      Size = 40
    end
    object qryPackingListItemMERCADORIA_ING: TStringField
      FieldName = 'MERCADORIA_ING'
      FixedChar = True
      Size = 200
    end
    object qryPackingListItemMERCADORIA_ESP: TStringField
      FieldName = 'MERCADORIA_ESP'
      FixedChar = True
      Size = 200
    end
    object qryPackingListItemMERCADORIA_POR: TStringField
      FieldName = 'MERCADORIA_POR'
      FixedChar = True
      Size = 200
    end
    object qryPackingListItemCD_UNID_MEDIDA: TStringField
      FieldName = 'CD_UNID_MEDIDA'
      Required = True
      FixedChar = True
      Size = 3
    end
    object qryPackingListItemUNIDADE_MEDIDA_ING: TStringField
      FieldName = 'UNIDADE_MEDIDA_ING'
      FixedChar = True
      Size = 100
    end
    object qryPackingListItemUNIDADE_MEDIDA_ESP: TStringField
      FieldName = 'UNIDADE_MEDIDA_ESP'
      FixedChar = True
      Size = 100
    end
    object qryPackingListItemUNIDADE_MEDIDA_POR: TStringField
      FieldName = 'UNIDADE_MEDIDA_POR'
      FixedChar = True
      Size = 50
    end
    object qryPackingListItemQT_MERCADORIA: TFloatField
      FieldName = 'QT_MERCADORIA'
    end
    object qryPackingListItemVL_TOT_PESO_BRUTO: TFloatField
      FieldName = 'VL_TOT_PESO_BRUTO'
    end
    object qryPackingListItemVL_TOT_PESO_LIQ: TFloatField
      FieldName = 'VL_TOT_PESO_LIQ'
    end
    object qryPackingListItemVL_UNITARIO: TFloatField
      FieldName = 'VL_UNITARIO'
    end
    object qryPackingListItemVL_TOT_ITEM: TFloatField
      FieldName = 'VL_TOT_ITEM'
    end
    object qryPackingListItemNR_PEDIDO: TStringField
      FieldName = 'NR_PEDIDO'
      FixedChar = True
      Size = 30
    end
    object qryPackingListItemEMBALAGEM: TStringField
      FieldName = 'EMBALAGEM'
      Size = 30
    end
  end
  object qryFaturaComercial: TSQLQuery
    MaxBlobSize = -1
    Params = <>
    SQLConnection = SQLConnection
    Left = 241
    Top = 182
    object qryFaturaComercialNR_PROCESSO: TStringField
      FieldName = 'NR_PROCESSO'
      Required = True
      FixedChar = True
      Size = 18
    end
    object qryFaturaComercialEXPORT_EMPRESA: TStringField
      FieldName = 'EXPORT_EMPRESA'
      FixedChar = True
      Size = 80
    end
    object qryFaturaComercialEXPORT_CNPJ: TStringField
      FieldName = 'EXPORT_CNPJ'
      FixedChar = True
      Size = 18
    end
    object qryFaturaComercialTX_DADOS_BANCARIOS_FATCOM: TStringField
      FieldName = 'TX_DADOS_BANCARIOS_FATCOM'
      FixedChar = True
      Size = 500
    end
    object qryFaturaComercialEXPORT_CIDADE_NUMERO: TStringField
      FieldName = 'EXPORT_CIDADE_NUMERO'
      FixedChar = True
      Size = 500
    end
    object qryFaturaComercialEXPORT_ESTADO_PAIS: TStringField
      FieldName = 'EXPORT_ESTADO_PAIS'
      FixedChar = True
      Size = 509
    end
    object qryFaturaComercialEXPORT_TELEFONE: TStringField
      FieldName = 'EXPORT_TELEFONE'
      FixedChar = True
      Size = 15
    end
    object qryFaturaComercialEXPORT_CEP: TStringField
      FieldName = 'EXPORT_CEP'
      FixedChar = True
      Size = 9
    end
    object qryFaturaComercialCIDADE_DATA_ESPANHOL: TStringField
      FieldName = 'CIDADE_DATA_ESPANHOL'
      Size = 131
    end
    object qryFaturaComercialCIDADE_DATA_PORTUGUES: TStringField
      FieldName = 'CIDADE_DATA_PORTUGUES'
      Size = 131
    end
    object qryFaturaComercialCIDADE_DATA_INGLES: TStringField
      FieldName = 'CIDADE_DATA_INGLES'
      FixedChar = True
      Size = 61
    end
    object qryFaturaComercialNR_FATURA: TStringField
      FieldName = 'NR_FATURA'
      FixedChar = True
      Size = 30
    end
    object qryFaturaComercialIMPORT_EMPRESA: TStringField
      FieldName = 'IMPORT_EMPRESA'
      FixedChar = True
      Size = 100
    end
    object qryFaturaComercialIMPORT_CIDADE_ESTADO: TStringField
      FieldName = 'IMPORT_CIDADE_ESTADO'
      FixedChar = True
      Size = 500
    end
    object qryFaturaComercialIMPORT_PAIS_ING: TStringField
      FieldName = 'IMPORT_PAIS_ING'
      FixedChar = True
      Size = 50
    end
    object qryFaturaComercialIMPORT_PAIS_ESP: TStringField
      FieldName = 'IMPORT_PAIS_ESP'
      FixedChar = True
      Size = 50
    end
    object qryFaturaComercialIMPORT_PAIS_POR: TStringField
      FieldName = 'IMPORT_PAIS_POR'
      FixedChar = True
      Size = 120
    end
    object qryFaturaComercialCONSIG_EMPRESA: TStringField
      FieldName = 'CONSIG_EMPRESA'
      FixedChar = True
      Size = 100
    end
    object qryFaturaComercialCONSIG_CIDADE_ESTADO: TStringField
      FieldName = 'CONSIG_CIDADE_ESTADO'
      FixedChar = True
      Size = 500
    end
    object qryFaturaComercialCONSIG_PAIS_ING: TStringField
      FieldName = 'CONSIG_PAIS_ING'
      FixedChar = True
      Size = 50
    end
    object qryFaturaComercialCONSIG_PAIS_ESP: TStringField
      FieldName = 'CONSIG_PAIS_ESP'
      FixedChar = True
      Size = 50
    end
    object qryFaturaComercialCONSIG_PAIS_POR: TStringField
      FieldName = 'CONSIG_PAIS_POR'
      FixedChar = True
      Size = 120
    end
    object qryFaturaComercialNOTIFY_EMPRESA: TStringField
      FieldName = 'NOTIFY_EMPRESA'
      FixedChar = True
      Size = 100
    end
    object qryFaturaComercialNOTIFY_CIDADE_ESTADO: TStringField
      FieldName = 'NOTIFY_CIDADE_ESTADO'
      FixedChar = True
      Size = 500
    end
    object qryFaturaComercialNOTIFY_PAIS_ING: TStringField
      FieldName = 'NOTIFY_PAIS_ING'
      FixedChar = True
      Size = 50
    end
    object qryFaturaComercialNOTIFY_PAIS_ESP: TStringField
      FieldName = 'NOTIFY_PAIS_ESP'
      FixedChar = True
      Size = 50
    end
    object qryFaturaComercialNOTIFY_PAIS_POR: TStringField
      FieldName = 'NOTIFY_PAIS_POR'
      FixedChar = True
      Size = 120
    end
    object qryFaturaComercialPAIS_ORIGEM: TStringField
      FieldName = 'PAIS_ORIGEM'
      Required = True
      FixedChar = True
      Size = 6
    end
    object qryFaturaComercialDS_PORTO_EMBARQUE: TStringField
      FieldName = 'DS_PORTO_EMBARQUE'
      FixedChar = True
      Size = 62
    end
    object qryFaturaComercialDS_PORTO_DESTINO_ESP: TStringField
      FieldName = 'DS_PORTO_DESTINO_ESP'
      FixedChar = True
      Size = 200
    end
    object qryFaturaComercialDS_PORTO_DESTINO_ING: TStringField
      FieldName = 'DS_PORTO_DESTINO_ING'
      FixedChar = True
      Size = 200
    end
    object qryFaturaComercialDS_PORTO_DESTINO_POR: TStringField
      FieldName = 'DS_PORTO_DESTINO_POR'
      FixedChar = True
      Size = 200
    end
    object qryFaturaComercialNM_VIA_TRANSPORTE_ING: TStringField
      FieldName = 'NM_VIA_TRANSPORTE_ING'
      FixedChar = True
    end
    object qryFaturaComercialNM_VIA_TRANSPORTE_ESP: TStringField
      FieldName = 'NM_VIA_TRANSPORTE_ESP'
      FixedChar = True
    end
    object qryFaturaComercialNM_VIA_TRANSPORTE_POR: TStringField
      FieldName = 'NM_VIA_TRANSPORTE_POR'
      FixedChar = True
    end
    object qryFaturaComercialPATH_LOGO: TStringField
      FieldName = 'PATH_LOGO'
      FixedChar = True
      Size = 100
    end
    object qryFaturaComercialNM_TERMO_PAGTO_ING: TStringField
      FieldName = 'NM_TERMO_PAGTO_ING'
      FixedChar = True
      Size = 300
    end
    object qryFaturaComercialNM_TERMO_PAGTO_ESP: TStringField
      FieldName = 'NM_TERMO_PAGTO_ESP'
      FixedChar = True
      Size = 300
    end
    object qryFaturaComercialTX_INF_EMBALAGEM: TStringField
      FieldName = 'TX_INF_EMBALAGEM'
      Required = True
      FixedChar = True
      Size = 1000
    end
    object qryFaturaComercialINCOTERM: TStringField
      FieldName = 'INCOTERM'
      FixedChar = True
      Size = 3
    end
    object qryFaturaComercialPAIS_DESTINO_ESP: TStringField
      FieldName = 'PAIS_DESTINO_ESP'
      FixedChar = True
      Size = 50
    end
    object qryFaturaComercialPAIS_DESTINO_ING: TStringField
      FieldName = 'PAIS_DESTINO_ING'
      FixedChar = True
      Size = 50
    end
    object qryFaturaComercialPAIS_DESTINO_POR: TStringField
      FieldName = 'PAIS_DESTINO_POR'
      FixedChar = True
      Size = 120
    end
    object qryFaturaComercialCIDADE_ORIGEM: TStringField
      FieldName = 'CIDADE_ORIGEM'
      Required = True
      FixedChar = True
      Size = 30
    end
    object qryFaturaComercialVL_PESO_BRUTO: TFloatField
      FieldName = 'VL_PESO_BRUTO'
    end
    object qryFaturaComercialVL_PESO_LIQUIDO: TFloatField
      FieldName = 'VL_PESO_LIQUIDO'
    end
    object qryFaturaComercialVL_TOT_CUBAGEM: TFloatField
      FieldName = 'VL_TOT_CUBAGEM'
    end
    object qryFaturaComercialVL_TOT_EXW: TFloatField
      FieldName = 'VL_TOT_EXW'
    end
    object qryFaturaComercialMOEDA_MLE: TStringField
      FieldName = 'MOEDA_MLE'
      FixedChar = True
      Size = 6
    end
    object qryFaturaComercialVL_SEGURO: TFloatField
      FieldName = 'VL_SEGURO'
      Required = True
    end
    object qryFaturaComercialMOEDA_SEGURO: TStringField
      FieldName = 'MOEDA_SEGURO'
      FixedChar = True
      Size = 6
    end
    object qryFaturaComercialVL_FRETE_INT: TFloatField
      FieldName = 'VL_FRETE_INT'
    end
    object qryFaturaComercialMOEDA_FRETE: TStringField
      FieldName = 'MOEDA_FRETE'
      FixedChar = True
      Size = 6
    end
    object qryFaturaComercialDESC_FRETE: TStringField
      FieldName = 'DESC_FRETE'
      FixedChar = True
      Size = 30
    end
    object qryFaturaComercialVL_TOT_DESPESA: TFloatField
      FieldName = 'VL_TOT_DESPESA'
      Required = True
    end
    object qryFaturaComercialVL_ACRESCIMO: TFloatField
      FieldName = 'VL_ACRESCIMO'
      Required = True
    end
    object qryFaturaComercialVL_DESCONTO: TFloatField
      FieldName = 'VL_DESCONTO'
      Required = True
    end
    object qryFaturaComercialVL_TOTAL_MLE: TFloatField
      FieldName = 'VL_TOTAL_MLE'
    end
    object qryFaturaComercialVL_TOTAL_MVC: TFloatField
      FieldName = 'VL_TOTAL_MVC'
    end
    object qryFaturaComercialNOTIFY_NR_CUIT: TStringField
      FieldName = 'NOTIFY_NR_CUIT'
      Size = 40
    end
    object qryFaturaComercialCONSIG_NR_CUIT: TStringField
      FieldName = 'CONSIG_NR_CUIT'
      Size = 40
    end
    object qryFaturaComercialIMPORT_NR_CUIT: TStringField
      FieldName = 'IMPORT_NR_CUIT'
      Size = 40
    end
    object qryFaturaComercialNR_ORDEM: TStringField
      FieldName = 'NR_ORDEM'
      Size = 30
    end
    object qryFaturaComercialNM_AGENTE: TStringField
      FieldName = 'NM_AGENTE'
      Size = 60
    end
  end
  object dspFaturaComercial: TDataSetProvider
    DataSet = qryFaturaComercial
    Left = 241
    Top = 239
  end
  object cdsFaturaComercial: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspFaturaComercial'
    Left = 243
    Top = 292
    object cdsFaturaComercialVL_PESO_BRUTO: TFloatField
      FieldName = 'VL_PESO_BRUTO'
      DisplayFormat = '#,0.00'
    end
    object cdsFaturaComercialVL_PESO_LIQUIDO: TFloatField
      FieldName = 'VL_PESO_LIQUIDO'
      DisplayFormat = '#,0.00'
    end
    object cdsFaturaComercialVL_TOT_CUBAGEM: TFloatField
      FieldName = 'VL_TOT_CUBAGEM'
      DisplayFormat = '#,0.000'
    end
    object cdsFaturaComercialVL_TOT_EXW: TFloatField
      FieldName = 'VL_TOT_EXW'
      DisplayFormat = '#,0.00'
    end
    object cdsFaturaComercialMOEDA_MLE: TStringField
      FieldName = 'MOEDA_MLE'
      FixedChar = True
      Size = 6
    end
    object cdsFaturaComercialVL_SEGURO: TFloatField
      FieldName = 'VL_SEGURO'
      Required = True
      DisplayFormat = '#,0.00'
    end
    object cdsFaturaComercialMOEDA_SEGURO: TStringField
      FieldName = 'MOEDA_SEGURO'
      FixedChar = True
      Size = 6
    end
    object cdsFaturaComercialVL_FRETE_INT: TFloatField
      FieldName = 'VL_FRETE_INT'
      DisplayFormat = '#,0.00'
    end
    object cdsFaturaComercialMOEDA_FRETE: TStringField
      FieldName = 'MOEDA_FRETE'
      FixedChar = True
      Size = 6
    end
    object cdsFaturaComercialDESC_FRETE: TStringField
      FieldName = 'DESC_FRETE'
      FixedChar = True
      Size = 30
    end
    object cdsFaturaComercialVL_TOT_DESPESA: TFloatField
      FieldName = 'VL_TOT_DESPESA'
      Required = True
      DisplayFormat = '#,0.00'
    end
    object cdsFaturaComercialVL_ACRESCIMO: TFloatField
      FieldName = 'VL_ACRESCIMO'
      Required = True
      DisplayFormat = '#,0.00'
    end
    object cdsFaturaComercialVL_DESCONTO: TFloatField
      FieldName = 'VL_DESCONTO'
      Required = True
      DisplayFormat = '#,0.00'
    end
    object cdsFaturaComercialVL_TOTAL_MLE: TFloatField
      FieldName = 'VL_TOTAL_MLE'
      DisplayFormat = '#,0.00'
    end
    object cdsFaturaComercialVL_TOTAL_MVC: TFloatField
      FieldName = 'VL_TOTAL_MVC'
      DisplayFormat = '#,0.00'
    end
    object cdsFaturaComercialNR_PROCESSO: TStringField
      FieldName = 'NR_PROCESSO'
      Required = True
      FixedChar = True
      Size = 18
    end
    object cdsFaturaComercialEXPORT_EMPRESA: TStringField
      FieldName = 'EXPORT_EMPRESA'
      FixedChar = True
      Size = 80
    end
    object cdsFaturaComercialEXPORT_CNPJ: TStringField
      FieldName = 'EXPORT_CNPJ'
      FixedChar = True
      Size = 18
    end
    object cdsFaturaComercialTX_DADOS_BANCARIOS_FATCOM: TStringField
      FieldName = 'TX_DADOS_BANCARIOS_FATCOM'
      FixedChar = True
      Size = 500
    end
    object cdsFaturaComercialEXPORT_CIDADE_NUMERO: TStringField
      FieldName = 'EXPORT_CIDADE_NUMERO'
      FixedChar = True
      Size = 500
    end
    object cdsFaturaComercialEXPORT_ESTADO_PAIS: TStringField
      FieldName = 'EXPORT_ESTADO_PAIS'
      FixedChar = True
      Size = 509
    end
    object cdsFaturaComercialEXPORT_TELEFONE: TStringField
      FieldName = 'EXPORT_TELEFONE'
      FixedChar = True
      Size = 15
    end
    object cdsFaturaComercialEXPORT_CEP: TStringField
      FieldName = 'EXPORT_CEP'
      FixedChar = True
      Size = 9
    end
    object cdsFaturaComercialCIDADE_DATA_ESPANHOL: TStringField
      FieldName = 'CIDADE_DATA_ESPANHOL'
      Size = 131
    end
    object cdsFaturaComercialCIDADE_DATA_PORTUGUES: TStringField
      FieldName = 'CIDADE_DATA_PORTUGUES'
      Size = 131
    end
    object cdsFaturaComercialCIDADE_DATA_INGLES: TStringField
      FieldName = 'CIDADE_DATA_INGLES'
      FixedChar = True
      Size = 61
    end
    object cdsFaturaComercialNR_FATURA: TStringField
      FieldName = 'NR_FATURA'
      FixedChar = True
      Size = 30
    end
    object cdsFaturaComercialIMPORT_EMPRESA: TStringField
      FieldName = 'IMPORT_EMPRESA'
      FixedChar = True
      Size = 100
    end
    object cdsFaturaComercialIMPORT_CIDADE_ESTADO: TStringField
      FieldName = 'IMPORT_CIDADE_ESTADO'
      FixedChar = True
      Size = 500
    end
    object cdsFaturaComercialIMPORT_PAIS_ING: TStringField
      FieldName = 'IMPORT_PAIS_ING'
      FixedChar = True
      Size = 50
    end
    object cdsFaturaComercialIMPORT_PAIS_ESP: TStringField
      FieldName = 'IMPORT_PAIS_ESP'
      FixedChar = True
      Size = 50
    end
    object cdsFaturaComercialIMPORT_PAIS_POR: TStringField
      FieldName = 'IMPORT_PAIS_POR'
      FixedChar = True
      Size = 120
    end
    object cdsFaturaComercialCONSIG_EMPRESA: TStringField
      FieldName = 'CONSIG_EMPRESA'
      FixedChar = True
      Size = 100
    end
    object cdsFaturaComercialCONSIG_CIDADE_ESTADO: TStringField
      FieldName = 'CONSIG_CIDADE_ESTADO'
      FixedChar = True
      Size = 500
    end
    object cdsFaturaComercialCONSIG_PAIS_ING: TStringField
      FieldName = 'CONSIG_PAIS_ING'
      FixedChar = True
      Size = 50
    end
    object cdsFaturaComercialCONSIG_PAIS_ESP: TStringField
      FieldName = 'CONSIG_PAIS_ESP'
      FixedChar = True
      Size = 50
    end
    object cdsFaturaComercialCONSIG_PAIS_POR: TStringField
      FieldName = 'CONSIG_PAIS_POR'
      FixedChar = True
      Size = 120
    end
    object cdsFaturaComercialNOTIFY_EMPRESA: TStringField
      FieldName = 'NOTIFY_EMPRESA'
      FixedChar = True
      Size = 100
    end
    object cdsFaturaComercialNOTIFY_CIDADE_ESTADO: TStringField
      FieldName = 'NOTIFY_CIDADE_ESTADO'
      FixedChar = True
      Size = 500
    end
    object cdsFaturaComercialNOTIFY_PAIS_ING: TStringField
      FieldName = 'NOTIFY_PAIS_ING'
      FixedChar = True
      Size = 50
    end
    object cdsFaturaComercialNOTIFY_PAIS_ESP: TStringField
      FieldName = 'NOTIFY_PAIS_ESP'
      FixedChar = True
      Size = 50
    end
    object cdsFaturaComercialNOTIFY_PAIS_POR: TStringField
      FieldName = 'NOTIFY_PAIS_POR'
      FixedChar = True
      Size = 120
    end
    object cdsFaturaComercialPAIS_ORIGEM: TStringField
      FieldName = 'PAIS_ORIGEM'
      Required = True
      FixedChar = True
      Size = 6
    end
    object cdsFaturaComercialDS_PORTO_EMBARQUE: TStringField
      FieldName = 'DS_PORTO_EMBARQUE'
      FixedChar = True
      Size = 62
    end
    object cdsFaturaComercialDS_PORTO_DESTINO_ESP: TStringField
      FieldName = 'DS_PORTO_DESTINO_ESP'
      FixedChar = True
      Size = 200
    end
    object cdsFaturaComercialDS_PORTO_DESTINO_ING: TStringField
      FieldName = 'DS_PORTO_DESTINO_ING'
      FixedChar = True
      Size = 200
    end
    object cdsFaturaComercialDS_PORTO_DESTINO_POR: TStringField
      FieldName = 'DS_PORTO_DESTINO_POR'
      FixedChar = True
      Size = 200
    end
    object cdsFaturaComercialNM_VIA_TRANSPORTE_ING: TStringField
      FieldName = 'NM_VIA_TRANSPORTE_ING'
      FixedChar = True
    end
    object cdsFaturaComercialNM_VIA_TRANSPORTE_ESP: TStringField
      FieldName = 'NM_VIA_TRANSPORTE_ESP'
      FixedChar = True
    end
    object cdsFaturaComercialNM_VIA_TRANSPORTE_POR: TStringField
      FieldName = 'NM_VIA_TRANSPORTE_POR'
      FixedChar = True
    end
    object cdsFaturaComercialPATH_LOGO: TStringField
      FieldName = 'PATH_LOGO'
      FixedChar = True
      Size = 100
    end
    object cdsFaturaComercialNM_TERMO_PAGTO_ING: TStringField
      FieldName = 'NM_TERMO_PAGTO_ING'
      FixedChar = True
      Size = 300
    end
    object cdsFaturaComercialNM_TERMO_PAGTO_ESP: TStringField
      FieldName = 'NM_TERMO_PAGTO_ESP'
      FixedChar = True
      Size = 300
    end
    object cdsFaturaComercialTX_INF_EMBALAGEM: TStringField
      FieldName = 'TX_INF_EMBALAGEM'
      Required = True
      FixedChar = True
      Size = 1000
    end
    object cdsFaturaComercialINCOTERM: TStringField
      FieldName = 'INCOTERM'
      FixedChar = True
      Size = 3
    end
    object cdsFaturaComercialPAIS_DESTINO_ESP: TStringField
      FieldName = 'PAIS_DESTINO_ESP'
      FixedChar = True
      Size = 50
    end
    object cdsFaturaComercialPAIS_DESTINO_ING: TStringField
      FieldName = 'PAIS_DESTINO_ING'
      FixedChar = True
      Size = 50
    end
    object cdsFaturaComercialPAIS_DESTINO_POR: TStringField
      FieldName = 'PAIS_DESTINO_POR'
      FixedChar = True
      Size = 120
    end
    object cdsFaturaComercialCIDADE_ORIGEM: TStringField
      FieldName = 'CIDADE_ORIGEM'
      Required = True
      FixedChar = True
      Size = 30
    end
    object cdsFaturaComercialCONSIG_NR_CUIT: TStringField
      FieldName = 'CONSIG_NR_CUIT'
      Size = 40
    end
    object cdsFaturaComercialNOTIFY_NR_CUIT: TStringField
      FieldName = 'NOTIFY_NR_CUIT'
      Size = 40
    end
    object cdsFaturaComercialIMPORT_NR_CUIT: TStringField
      FieldName = 'IMPORT_NR_CUIT'
      Size = 40
    end
    object cdsFaturaComercialNR_ORDEM: TStringField
      FieldName = 'NR_ORDEM'
      Size = 30
    end
  end
  object dsFaturaComercial: TDataSource
    DataSet = cdsFaturaComercial
    Left = 241
    Top = 347
  end
  object qryFaturaComercialItem: TSQLQuery
    MaxBlobSize = -1
    Params = <>
    SQLConnection = SQLConnection
    Left = 346
    Top = 182
    object qryFaturaComercialItemNR_PROCESSO: TStringField
      FieldName = 'NR_PROCESSO'
      Required = True
      FixedChar = True
      Size = 18
    end
    object qryFaturaComercialItemCD_MERCADORIA: TStringField
      FieldName = 'CD_MERCADORIA'
      FixedChar = True
      Size = 40
    end
    object qryFaturaComercialItemMERCADORIA_ING: TStringField
      FieldName = 'MERCADORIA_ING'
      FixedChar = True
      Size = 403
    end
    object qryFaturaComercialItemMERCADORIA_ESP: TStringField
      FieldName = 'MERCADORIA_ESP'
      FixedChar = True
      Size = 403
    end
    object qryFaturaComercialItemCD_UNID_MEDIDA: TStringField
      FieldName = 'CD_UNID_MEDIDA'
      Required = True
      FixedChar = True
      Size = 3
    end
    object qryFaturaComercialItemUNIDADE_MEDIDA_ING: TStringField
      FieldName = 'UNIDADE_MEDIDA_ING'
      FixedChar = True
      Size = 50
    end
    object qryFaturaComercialItemUNIDADE_MEDIDA_ESP: TStringField
      FieldName = 'UNIDADE_MEDIDA_ESP'
      FixedChar = True
      Size = 50
    end
    object qryFaturaComercialItemQT_MERCADORIA: TFloatField
      FieldName = 'QT_MERCADORIA'
    end
    object qryFaturaComercialItemCD_NCM: TStringField
      FieldName = 'CD_NCM'
      FixedChar = True
      Size = 11
    end
    object qryFaturaComercialItemCD_NALADI_SH: TStringField
      FieldName = 'CD_NALADI_SH'
      FixedChar = True
      Size = 8
    end
    object qryFaturaComercialItemVL_UNITARIO: TFloatField
      FieldName = 'VL_UNITARIO'
    end
    object qryFaturaComercialItemVL_TOT_ITEM: TFloatField
      FieldName = 'VL_TOT_ITEM'
    end
    object qryFaturaComercialItemNR_PEDIDO: TStringField
      FieldName = 'NR_PEDIDO'
      FixedChar = True
      Size = 30
    end
    object qryFaturaComercialItemMERCADORIA_ESP_1: TStringField
      FieldName = 'MERCADORIA_POR'
      FixedChar = True
      Size = 200
    end
    object qryFaturaComercialItemUNIDADE_MEDIDA_POR: TStringField
      FieldName = 'UNIDADE_MEDIDA_POR'
      FixedChar = True
      Size = 50
    end
  end
  object dspFaturaComercialItem: TDataSetProvider
    DataSet = qryFaturaComercialItem
    Left = 346
    Top = 239
  end
  object cdsFaturaComercialItem: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspFaturaComercialItem'
    Left = 349
    Top = 293
    object cdsFaturaComercialItemNR_PROCESSO: TStringField
      FieldName = 'NR_PROCESSO'
      Required = True
      FixedChar = True
      Size = 18
    end
    object cdsFaturaComercialItemCD_MERCADORIA: TStringField
      FieldName = 'CD_MERCADORIA'
      FixedChar = True
      Size = 40
    end
    object cdsFaturaComercialItemMERCADORIA_ING: TStringField
      FieldName = 'MERCADORIA_ING'
      FixedChar = True
      Size = 403
    end
    object cdsFaturaComercialItemMERCADORIA_ESP: TStringField
      FieldName = 'MERCADORIA_ESP'
      FixedChar = True
      Size = 403
    end
    object cdsFaturaComercialItemCD_UNID_MEDIDA: TStringField
      FieldName = 'CD_UNID_MEDIDA'
      Required = True
      FixedChar = True
      Size = 3
    end
    object cdsFaturaComercialItemUNIDADE_MEDIDA_ING: TStringField
      FieldName = 'UNIDADE_MEDIDA_ING'
      FixedChar = True
      Size = 50
    end
    object cdsFaturaComercialItemUNIDADE_MEDIDA_ESP: TStringField
      FieldName = 'UNIDADE_MEDIDA_ESP'
      FixedChar = True
      Size = 50
    end
    object cdsFaturaComercialItemQT_MERCADORIA: TFloatField
      FieldName = 'QT_MERCADORIA'
    end
    object cdsFaturaComercialItemCD_NCM: TStringField
      FieldName = 'CD_NCM'
      FixedChar = True
      Size = 11
    end
    object cdsFaturaComercialItemCD_NALADI_SH: TStringField
      FieldName = 'CD_NALADI_SH'
      FixedChar = True
      Size = 8
    end
    object cdsFaturaComercialItemVL_UNITARIO: TFloatField
      FieldName = 'VL_UNITARIO'
      DisplayFormat = '#,0.00'
    end
    object cdsFaturaComercialItemVL_TOT_ITEM: TFloatField
      FieldName = 'VL_TOT_ITEM'
      DisplayFormat = '#,0.00'
    end
    object cdsFaturaComercialItemNR_PEDIDO: TStringField
      FieldName = 'NR_PEDIDO'
      FixedChar = True
      Size = 30
    end
    object cdsFaturaComercialItemMERCADORIA_ESP_1: TStringField
      FieldName = 'MERCADORIA_POR'
      FixedChar = True
      Size = 200
    end
    object cdsFaturaComercialItemUNIDADE_MEDIDA_POR: TStringField
      FieldName = 'UNIDADE_MEDIDA_POR'
      FixedChar = True
      Size = 50
    end
  end
  object dsFaturaComercialItem: TDataSource
    DataSet = cdsFaturaComercialItem
    Left = 346
    Top = 347
  end
  object qryGrupo: TSQLQuery
    MaxBlobSize = -1
    Params = <>
    SQL.Strings = (
      
        'SELECT CD_GRUPO FROM TPROCESSO WHERE NR_PROCESSO = '#39'0102ER-00251' +
        '1-22'#39)
    SQLConnection = SQLConnection
    Left = 104
    Top = 117
    object qryGrupoCD_GRUPO: TStringField
      FieldName = 'CD_GRUPO'
      FixedChar = True
      Size = 3
    end
  end
  object dspGrupo: TDataSetProvider
    DataSet = qryGrupo
    Left = 200
    Top = 119
  end
  object cdsGrupo: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspGrupo'
    Left = 284
    Top = 121
    object cdsGrupoCD_GRUPO: TStringField
      FieldName = 'CD_GRUPO'
      FixedChar = True
      Size = 3
    end
  end
end
