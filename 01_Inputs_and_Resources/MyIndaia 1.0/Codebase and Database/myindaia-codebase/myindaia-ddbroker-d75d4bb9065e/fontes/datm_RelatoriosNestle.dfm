object datm_RelatorioNestle: Tdatm_RelatorioNestle
  OldCreateOrder = False
  OnCreate = qryconqry
  Left = 410
  Top = 243
  Height = 619
  Width = 1190
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
    Left = 35
    Top = 7
  end
  object dspProgRodoviario: TDataSetProvider
    DataSet = qryProgRodoviario
    Left = 45
    Top = 179
  end
  object qryProgRodoviario: TSQLQuery
    MaxBlobSize = -1
    Params = <>
    SQLConnection = SQLConnection
    Left = 45
    Top = 122
    object qryProgRodoviarioNR_PROCESSO: TStringField
      FieldName = 'NR_PROCESSO'
      Required = True
      FixedChar = True
      Size = 18
    end
    object qryProgRodoviarioREFERENCIA: TStringField
      FieldName = 'REFERENCIA'
      Required = True
      FixedChar = True
      Size = 18
    end
    object qryProgRodoviarioEXPORT_EMPRESA: TStringField
      FieldName = 'EXPORT_EMPRESA'
      Required = True
      FixedChar = True
      Size = 80
    end
    object qryProgRodoviarioEXPORT_CARREGAMENTO: TStringField
      FieldName = 'EXPORT_CARREGAMENTO'
      Required = True
      FixedChar = True
      Size = 104
    end
    object qryProgRodoviarioEXPORT_ENDERECO: TStringField
      FieldName = 'EXPORT_ENDERECO'
      Required = True
      FixedChar = True
      Size = 200
    end
    object qryProgRodoviarioEXPORT_CNPJ: TStringField
      FieldName = 'EXPORT_CNPJ'
      FixedChar = True
      Size = 24
    end
    object qryProgRodoviarioEXPORT_EMPRESA_NUMERO: TStringField
      FieldName = 'EXPORT_EMPRESA_NUMERO'
      Required = True
      FixedChar = True
      Size = 200
    end
    object qryProgRodoviarioEXPORT_CIDADE_ESTADO: TStringField
      FieldName = 'EXPORT_CIDADE_ESTADO'
      Required = True
      FixedChar = True
      Size = 200
    end
    object qryProgRodoviarioEXPORT_CIDADE: TStringField
      FieldName = 'EXPORT_CIDADE'
      Required = True
      FixedChar = True
      Size = 200
    end
    object qryProgRodoviarioIMPORT_EMPRESA: TStringField
      FieldName = 'IMPORT_EMPRESA'
      FixedChar = True
      Size = 100
    end
    object qryProgRodoviarioIMPORT_EMPRESA_NUMERO: TStringField
      FieldName = 'IMPORT_EMPRESA_NUMERO'
      Required = True
      FixedChar = True
      Size = 200
    end
    object qryProgRodoviarioIMPORT_CIDADE_ESTADO_PAIS: TStringField
      FieldName = 'IMPORT_CIDADE_ESTADO_PAIS'
      Required = True
      FixedChar = True
      Size = 200
    end
    object qryProgRodoviarioIMPORT_EMPRESA_NUMERO_CIDADE: TStringField
      FieldName = 'IMPORT_EMPRESA_NUMERO_CIDADE'
      Required = True
      FixedChar = True
      Size = 200
    end
    object qryProgRodoviarioIMPORT_ESTADO_PAIS: TStringField
      FieldName = 'IMPORT_ESTADO_PAIS'
      Required = True
      FixedChar = True
      Size = 200
    end
    object qryProgRodoviarioNOTIFY_EMPRESA: TStringField
      FieldName = 'NOTIFY_EMPRESA'
      FixedChar = True
      Size = 200
    end
    object qryProgRodoviarioNOTIFY_EMPRESA_NUMERO: TStringField
      FieldName = 'NOTIFY_EMPRESA_NUMERO'
      Required = True
      FixedChar = True
      Size = 200
    end
    object qryProgRodoviarioNOTIFTY_ESTADO_PAIS: TStringField
      FieldName = 'NOTIFTY_ESTADO_PAIS'
      Required = True
      FixedChar = True
      Size = 200
    end
    object qryProgRodoviarioCONSIG_EMPRESA: TStringField
      FieldName = 'CONSIG_EMPRESA'
      FixedChar = True
      Size = 100
    end
    object qryProgRodoviarioDS_PORTO_EMBARQUE: TStringField
      FieldName = 'DS_PORTO_EMBARQUE'
      Required = True
      FixedChar = True
      Size = 53
    end
    object qryProgRodoviarioDS_PORTO_DESTINO: TStringField
      FieldName = 'DS_PORTO_DESTINO'
      FixedChar = True
      Size = 50
    end
    object qryProgRodoviarioDS_PORTO_TRANSBORDO: TStringField
      FieldName = 'DS_PORTO_TRANSBORDO'
      FixedChar = True
      Size = 50
    end
    object qryProgRodoviarioDS_PORTO_DESCARGA: TStringField
      FieldName = 'DS_PORTO_DESCARGA'
      FixedChar = True
      Size = 50
    end
    object qryProgRodoviarioVL_TOT_QTDE_PROD: TFloatField
      FieldName = 'VL_TOT_QTDE_PROD'
    end
    object qryProgRodoviarioVL_PESO_LIQUIDO: TFloatField
      FieldName = 'VL_PESO_LIQUIDO'
      DisplayFormat = '##,###0.000'
    end
    object qryProgRodoviarioVL_PESO_BRUTO: TFloatField
      FieldName = 'VL_PESO_BRUTO'
      DisplayFormat = '##,###0.000'
    end
    object qryProgRodoviarioVL_M3: TFloatField
      FieldName = 'VL_M3'
      DisplayFormat = '##,###0.000'
    end
    object qryProgRodoviarioNM_EMBARCACAO: TStringField
      FieldName = 'NM_EMBARCACAO'
      FixedChar = True
      Size = 40
    end
    object qryProgRodoviarioVIAGEMDOAGENTE: TStringField
      FieldName = 'VIAGEMDOAGENTE'
      FixedChar = True
      Size = 15
    end
    object qryProgRodoviarioDT_PREVISAO_EMBARQUE: TSQLTimeStampField
      FieldName = 'DT_PREVISAO_EMBARQUE'
    end
    object qryProgRodoviarioDT_DEADLINE_BL: TSQLTimeStampField
      FieldName = 'DT_DEADLINE_BL'
    end
    object qryProgRodoviarioDT_DEADLINE_CARGA: TSQLTimeStampField
      FieldName = 'DT_DEADLINE_CARGA'
    end
    object qryProgRodoviarioDT_PREVISAO_CHEGADA: TSQLTimeStampField
      FieldName = 'DT_PREVISAO_CHEGADA'
    end
    object qryProgRodoviarioTEMPERATURA: TStringField
      FieldName = 'TEMPERATURA'
      Required = True
      FixedChar = True
      Size = 5
    end
    object qryProgRodoviarioDT_PREVISAO_CARREGAMENTO: TSQLTimeStampField
      FieldName = 'DT_PREVISAO_CARREGAMENTO'
    end
    object qryProgRodoviarioNM_ARMAZEM_RETIRADA: TStringField
      FieldName = 'NM_ARMAZEM_RETIRADA'
      FixedChar = True
      Size = 50
    end
    object qryProgRodoviarioEND_CIDADE_COLETA: TStringField
      FieldName = 'END_CIDADE_COLETA'
      FixedChar = True
      Size = 30
    end
    object qryProgRodoviarioNM_ARMAZEM_ENTREGA: TStringField
      FieldName = 'NM_ARMAZEM_ENTREGA'
      FixedChar = True
      Size = 50
    end
    object qryProgRodoviarioCD_REF_RESERVA_PRACA: TStringField
      DisplayWidth = 200
      FieldName = 'CD_REF_RESERVA_PRACA'
      FixedChar = True
      Size = 200
    end
    object qryProgRodoviarioVL_MLE_MNEG: TFloatField
      FieldName = 'VL_MLE_MNEG'
      DisplayFormat = '##,##0.00'
    end
    object qryProgRodoviarioMARCA_NM_EMPRESA: TStringField
      FieldName = 'MARCA_NM_EMPRESA'
      FixedChar = True
      Size = 100
    end
    object qryProgRodoviarioNM_PROCESSO_SAP: TStringField
      DisplayWidth = 200
      FieldName = 'NM_PROCESSO_SAP'
      FixedChar = True
      Size = 200
    end
    object qryProgRodoviarioMARCA_NM_PAIS: TStringField
      FieldName = 'MARCA_NM_PAIS'
      FixedChar = True
      Size = 120
    end
    object qryProgRodoviarioMARCA_NM_EMPRESA_NAC: TStringField
      FieldName = 'MARCA_NM_EMPRESA_NAC'
      FixedChar = True
      Size = 80
    end
    object qryProgRodoviarioPATH_LOGO: TStringField
      FieldName = 'PATH_LOGO'
      FixedChar = True
      Size = 100
    end
    object qryProgRodoviarioTX_INF_EMBALAGEM: TMemoField
      FieldName = 'TX_INF_EMBALAGEM'
      BlobType = ftMemo
      Size = 1
    end
    object qryProgRodoviarioCD_INCOTERM: TStringField
      FieldName = 'CD_INCOTERM'
      FixedChar = True
      Size = 3
    end
    object qryProgRodoviarioTRANSPORTADORA: TStringField
      FieldName = 'TRANSPORTADORA'
      Required = True
      FixedChar = True
      Size = 77
    end
    object qryProgRodoviarioAP_MOEDA: TStringField
      FieldName = 'AP_MOEDA'
      FixedChar = True
      Size = 6
    end
    object qryProgRodoviarioNM_AGENTE: TStringField
      FieldName = 'NM_AGENTE'
      FixedChar = True
      Size = 70
    end
    object qryProgRodoviarioVISTORIADOR: TStringField
      FieldName = 'VISTORIADOR'
      Required = True
      FixedChar = True
      Size = 36
    end
    object qryProgRodoviarioDESPACHANTE: TStringField
      FieldName = 'DESPACHANTE'
      Required = True
      FixedChar = True
      Size = 48
    end
    object qryProgRodoviarioNM_AREA: TStringField
      FieldName = 'NM_AREA'
      FixedChar = True
      Size = 61
    end
    object qryProgRodoviarioCONTAINERS: TMemoField
      FieldName = 'CONTAINERS'
      BlobType = ftMemo
      Size = 1
    end
    object qryProgRodoviarioOBSERVACAO: TStringField
      FieldName = 'OBSERVACAO'
      Size = 200
    end
    object qryProgRodoviarioCONTROLE_NESTLE: TStringField
      FieldName = 'CONTROLE_NESTLE'
      FixedChar = True
      Size = 15
    end
    object qryProgRodoviarioARM_ESTOCAGEM: TStringField
      FieldName = 'ARM_ESTOCAGEM'
      Size = 60
    end
    object qryProgRodoviarioEND_CONSIG_EMPRESA_NUMERO: TStringField
      FieldName = 'END_CONSIG_EMPRESA_NUMERO'
      FixedChar = True
      Size = 200
    end
    object qryProgRodoviarioMOEDA: TStringField
      FieldName = 'MOEDA'
      FixedChar = True
      Size = 6
    end
    object qryProgRodoviarioIDIOMA_PEDIDO: TStringField
      FieldName = 'IDIOMA_PEDIDO'
      Size = 30
    end
    object qryProgRodoviarioCD_REF_BOOKING_LOADER: TStringField
      FieldName = 'CD_REF_BOOKING_LOADER'
      Size = 200
    end
    object qryProgRodoviarioMERC_PERIGOSA: TStringField
      FieldName = 'MERC_PERIGOSA'
    end
    object qryProgRodoviarioFRONTEIRA: TStringField
      FieldName = 'FRONTEIRA'
      Size = 50
    end
  end
  object dsProgRodoviario: TDataSource
    DataSet = cdsProgRodoviario
    Left = 45
    Top = 283
  end
  object qryProgRodoviarioItem: TSQLQuery
    MaxBlobSize = -1
    Params = <>
    SQLConnection = SQLConnection
    Left = 150
    Top = 122
    object qryProgRodoviarioItemNM_PROCESSO_SAP: TStringField
      FieldName = 'NM_PROCESSO_SAP'
      FixedChar = True
      Size = 15
    end
    object qryProgRodoviarioItemTX_MERCADORIA: TStringField
      FieldName = 'TX_MERCADORIA'
      FixedChar = True
      Size = 326
    end
    object qryProgRodoviarioItemVL_TOT: TStringField
      FieldName = 'VL_TOT'
      FixedChar = True
      Size = 112
    end
  end
  object dspProgRodoviarioItem: TDataSetProvider
    DataSet = qryProgRodoviarioItem
    Left = 150
    Top = 178
  end
  object cdsProgRodoviarioItem: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspProgRodoviarioItem'
    Left = 150
    Top = 230
    object cdsProgRodoviarioItemNM_PROCESSO_SAP: TStringField
      FieldName = 'NM_PROCESSO_SAP'
      FixedChar = True
      Size = 15
    end
    object cdsProgRodoviarioItemTX_MERCADORIA: TStringField
      FieldName = 'TX_MERCADORIA'
      FixedChar = True
      Size = 326
    end
    object cdsProgRodoviarioItemVL_TOT: TStringField
      FieldName = 'VL_TOT'
      FixedChar = True
      Size = 112
    end
  end
  object dsProgRodoviarioItem: TDataSource
    DataSet = cdsProgRodoviarioItem
    Left = 150
    Top = 284
  end
  object cdsProgRodoviario: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspProgRodoviario'
    Left = 45
    Top = 230
    object cdsProgRodoviarioNR_PROCESSO: TStringField
      FieldName = 'NR_PROCESSO'
      Required = True
      FixedChar = True
      Size = 18
    end
    object cdsProgRodoviarioREFERENCIA: TStringField
      FieldName = 'REFERENCIA'
      Required = True
      FixedChar = True
      Size = 18
    end
    object cdsProgRodoviarioEXPORT_EMPRESA: TStringField
      FieldName = 'EXPORT_EMPRESA'
      Required = True
      FixedChar = True
      Size = 80
    end
    object cdsProgRodoviarioEXPORT_CARREGAMENTO: TStringField
      FieldName = 'EXPORT_CARREGAMENTO'
      Required = True
      FixedChar = True
      Size = 104
    end
    object cdsProgRodoviarioEXPORT_ENDERECO: TStringField
      FieldName = 'EXPORT_ENDERECO'
      Required = True
      FixedChar = True
      Size = 109
    end
    object cdsProgRodoviarioEXPORT_CNPJ: TStringField
      FieldName = 'EXPORT_CNPJ'
      FixedChar = True
      Size = 24
    end
    object cdsProgRodoviarioEXPORT_EMPRESA_NUMERO: TStringField
      FieldName = 'EXPORT_EMPRESA_NUMERO'
      Required = True
      FixedChar = True
      Size = 200
    end
    object cdsProgRodoviarioEXPORT_CIDADE_ESTADO: TStringField
      FieldName = 'EXPORT_CIDADE_ESTADO'
      Required = True
      FixedChar = True
      Size = 200
    end
    object cdsProgRodoviarioEXPORT_CIDADE: TStringField
      FieldName = 'EXPORT_CIDADE'
      Required = True
      FixedChar = True
      Size = 200
    end
    object cdsProgRodoviarioIMPORT_EMPRESA: TStringField
      FieldName = 'IMPORT_EMPRESA'
      FixedChar = True
      Size = 100
    end
    object cdsProgRodoviarioIMPORT_EMPRESA_NUMERO: TStringField
      FieldName = 'IMPORT_EMPRESA_NUMERO'
      Required = True
      FixedChar = True
      Size = 200
    end
    object cdsProgRodoviarioIMPORT_CIDADE_ESTADO_PAIS: TStringField
      FieldName = 'IMPORT_CIDADE_ESTADO_PAIS'
      Required = True
      FixedChar = True
      Size = 200
    end
    object cdsProgRodoviarioIMPORT_EMPRESA_NUMERO_CIDADE: TStringField
      FieldName = 'IMPORT_EMPRESA_NUMERO_CIDADE'
      Required = True
      FixedChar = True
      Size = 200
    end
    object cdsProgRodoviarioIMPORT_ESTADO_PAIS: TStringField
      FieldName = 'IMPORT_ESTADO_PAIS'
      Required = True
      FixedChar = True
      Size = 200
    end
    object cdsProgRodoviarioNOTIFY_EMPRESA: TStringField
      FieldName = 'NOTIFY_EMPRESA'
      FixedChar = True
      Size = 100
    end
    object cdsProgRodoviarioNOTIFY_EMPRESA_NUMERO: TStringField
      FieldName = 'NOTIFY_EMPRESA_NUMERO'
      Required = True
      FixedChar = True
      Size = 200
    end
    object cdsProgRodoviarioNOTIFTY_ESTADO_PAIS: TStringField
      FieldName = 'NOTIFTY_ESTADO_PAIS'
      Required = True
      FixedChar = True
      Size = 200
    end
    object cdsProgRodoviarioCONSIG_EMPRESA: TStringField
      FieldName = 'CONSIG_EMPRESA'
      FixedChar = True
      Size = 100
    end
    object cdsProgRodoviarioDS_PORTO_EMBARQUE: TStringField
      FieldName = 'DS_PORTO_EMBARQUE'
      Required = True
      FixedChar = True
      Size = 53
    end
    object cdsProgRodoviarioDS_PORTO_DESTINO: TStringField
      FieldName = 'DS_PORTO_DESTINO'
      FixedChar = True
      Size = 50
    end
    object cdsProgRodoviarioDS_PORTO_TRANSBORDO: TStringField
      FieldName = 'DS_PORTO_TRANSBORDO'
      FixedChar = True
      Size = 50
    end
    object cdsProgRodoviarioDS_PORTO_DESCARGA: TStringField
      FieldName = 'DS_PORTO_DESCARGA'
      FixedChar = True
      Size = 50
    end
    object cdsProgRodoviarioVL_TOT_QTDE_PROD: TFloatField
      FieldName = 'VL_TOT_QTDE_PROD'
      DisplayFormat = '##,##0.00'
    end
    object cdsProgRodoviarioVL_PESO_LIQUIDO: TFloatField
      FieldName = 'VL_PESO_LIQUIDO'
      DisplayFormat = '##,###0.000'
    end
    object cdsProgRodoviarioVL_PESO_BRUTO: TFloatField
      FieldName = 'VL_PESO_BRUTO'
      DisplayFormat = '##,###0.000'
    end
    object cdsProgRodoviarioVL_M3: TFloatField
      FieldName = 'VL_M3'
      DisplayFormat = '##,###0.000'
    end
    object cdsProgRodoviarioNM_EMBARCACAO: TStringField
      FieldName = 'NM_EMBARCACAO'
      FixedChar = True
      Size = 40
    end
    object cdsProgRodoviarioVIAGEMDOAGENTE: TStringField
      FieldName = 'VIAGEMDOAGENTE'
      FixedChar = True
      Size = 15
    end
    object cdsProgRodoviarioDT_PREVISAO_EMBARQUE: TSQLTimeStampField
      FieldName = 'DT_PREVISAO_EMBARQUE'
      DisplayFormat = 'dd/mm/yyyy'
    end
    object cdsProgRodoviarioDT_DEADLINE_BL: TSQLTimeStampField
      FieldName = 'DT_DEADLINE_BL'
      DisplayFormat = 'dd/mm/yyyy hh:mm'
    end
    object cdsProgRodoviarioDT_DEADLINE_CARGA: TSQLTimeStampField
      FieldName = 'DT_DEADLINE_CARGA'
      DisplayFormat = 'dd/mm/yyyy hh:mm'
    end
    object cdsProgRodoviarioDT_PREVISAO_CHEGADA: TSQLTimeStampField
      FieldName = 'DT_PREVISAO_CHEGADA'
      DisplayFormat = 'dd/mm/yyyy'
    end
    object cdsProgRodoviarioTEMPERATURA: TStringField
      FieldName = 'TEMPERATURA'
      Required = True
      FixedChar = True
      Size = 5
    end
    object cdsProgRodoviarioDT_PREVISAO_CARREGAMENTO: TSQLTimeStampField
      FieldName = 'DT_PREVISAO_CARREGAMENTO'
      DisplayFormat = 'dd/mm/yyyy'
    end
    object cdsProgRodoviarioNM_ARMAZEM_RETIRADA: TStringField
      FieldName = 'NM_ARMAZEM_RETIRADA'
      FixedChar = True
      Size = 50
    end
    object cdsProgRodoviarioEND_CIDADE_COLETA: TStringField
      FieldName = 'END_CIDADE_COLETA'
      FixedChar = True
      Size = 30
    end
    object cdsProgRodoviarioNM_ARMAZEM_ENTREGA: TStringField
      FieldName = 'NM_ARMAZEM_ENTREGA'
      FixedChar = True
      Size = 50
    end
    object cdsProgRodoviarioCD_REF_RESERVA_PRACA: TStringField
      FieldName = 'CD_REF_RESERVA_PRACA'
      FixedChar = True
      Size = 200
    end
    object cdsProgRodoviarioVL_MLE_MNEG: TFloatField
      FieldName = 'VL_MLE_MNEG'
      DisplayFormat = '##,##0.00'
    end
    object cdsProgRodoviarioMARCA_NM_EMPRESA: TStringField
      FieldName = 'MARCA_NM_EMPRESA'
      FixedChar = True
      Size = 100
    end
    object cdsProgRodoviarioNM_PROCESSO_SAP: TStringField
      FieldName = 'NM_PROCESSO_SAP'
      FixedChar = True
      Size = 15
    end
    object cdsProgRodoviarioMARCA_NM_PAIS: TStringField
      FieldName = 'MARCA_NM_PAIS'
      FixedChar = True
      Size = 120
    end
    object cdsProgRodoviarioMARCA_NM_EMPRESA_NAC: TStringField
      FieldName = 'MARCA_NM_EMPRESA_NAC'
      FixedChar = True
      Size = 80
    end
    object cdsProgRodoviarioPATH_LOGO: TStringField
      FieldName = 'PATH_LOGO'
      FixedChar = True
      Size = 100
    end
    object cdsProgRodoviarioTX_INF_EMBALAGEM: TMemoField
      FieldName = 'TX_INF_EMBALAGEM'
      BlobType = ftMemo
      Size = 1
    end
    object cdsProgRodoviarioCD_INCOTERM: TStringField
      FieldName = 'CD_INCOTERM'
      FixedChar = True
      Size = 3
    end
    object cdsProgRodoviarioTRANSPORTADORA: TStringField
      FieldName = 'TRANSPORTADORA'
      Required = True
      FixedChar = True
      Size = 77
    end
    object cdsProgRodoviarioAP_MOEDA: TStringField
      FieldName = 'AP_MOEDA'
      FixedChar = True
      Size = 6
    end
    object cdsProgRodoviarioNM_AGENTE: TStringField
      FieldName = 'NM_AGENTE'
      FixedChar = True
      Size = 70
    end
    object cdsProgRodoviarioVISTORIADOR: TStringField
      FieldName = 'VISTORIADOR'
      Required = True
      FixedChar = True
      Size = 36
    end
    object cdsProgRodoviarioDESPACHANTE: TStringField
      FieldName = 'DESPACHANTE'
      Required = True
      FixedChar = True
      Size = 48
    end
    object cdsProgRodoviarioNM_AREA: TStringField
      FieldName = 'NM_AREA'
      FixedChar = True
      Size = 61
    end
    object cdsProgRodoviarioCONTAINERS: TMemoField
      FieldName = 'CONTAINERS'
      BlobType = ftMemo
      Size = 1
    end
    object cdsProgRodoviarioOBSERVACAO: TStringField
      FieldName = 'OBSERVACAO'
      Size = 200
    end
    object cdsProgRodoviarioCONTROLE_NESTLE: TStringField
      FieldName = 'CONTROLE_NESTLE'
      FixedChar = True
      Size = 15
    end
    object cdsProgRodoviarioARM_ESTOCAGEM: TStringField
      FieldName = 'ARM_ESTOCAGEM'
      Size = 60
    end
    object cdsProgRodoviarioEND_CONSIG_EMPRESA_NUMERO: TStringField
      FieldName = 'END_CONSIG_EMPRESA_NUMERO'
      FixedChar = True
      Size = 200
    end
    object cdsProgRodoviarioMOEDA: TStringField
      FieldName = 'MOEDA'
      FixedChar = True
      Size = 6
    end
    object cdsProgRodoviarioIDIOMA_PEDIDO: TStringField
      FieldName = 'IDIOMA_PEDIDO'
      Size = 30
    end
    object cdsProgRodoviarioCD_REF_BOOKING_LOADER: TStringField
      FieldName = 'CD_REF_BOOKING_LOADER'
      Size = 200
    end
    object cdsProgRodoviarioMERC_PERIGOSA: TStringField
      FieldName = 'MERC_PERIGOSA'
    end
    object cdsProgRodoviarioFRONTEIRA: TStringField
      FieldName = 'FRONTEIRA'
      Size = 50
    end
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
    Left = 643
    Top = 5
  end
  object cdsProduto: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspProduto'
    Left = 585
    Top = 5
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
    Left = 523
    Top = 5
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
    Left = 462
    Top = 5
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
  object qrySaque: TSQLQuery
    MaxBlobSize = -1
    Params = <>
    SQLConnection = SQLConnection
    Left = 701
    Top = 124
    object qrySaqueNR_PROCESSO: TStringField
      FieldName = 'NR_PROCESSO'
      FixedChar = True
    end
    object qrySaqueCONTROLE_NESTLE: TStringField
      FieldName = 'CONTROLE_NESTLE'
      FixedChar = True
    end
    object qrySaqueEXPORT_CIDADE_ESTADO: TStringField
      FieldName = 'EXPORT_CIDADE_ESTADO'
      FixedChar = True
      Size = 60
    end
    object qrySaqueINSTRUCAO: TStringField
      FieldName = 'INSTRUCAO'
      FixedChar = True
      Size = 40
    end
    object qrySaqueDESC_DOCUMENTO1: TStringField
      FieldName = 'DESC_DOCUMENTO1'
      FixedChar = True
      Size = 50
    end
    object qrySaqueDESC_DOCUMENTO2: TStringField
      FieldName = 'DESC_DOCUMENTO2'
      FixedChar = True
      Size = 50
    end
    object qrySaqueVALOR_NUM: TFMTBCDField
      FieldName = 'VALOR_NUM'
      Precision = 20
      Size = 2
    end
    object qrySaqueVL_EXTENSO1: TStringField
      FieldName = 'VL_EXTENSO1'
      FixedChar = True
      Size = 200
    end
    object qrySaqueVL_EXTENSO2: TStringField
      FieldName = 'VL_EXTENSO2'
      FixedChar = True
      Size = 200
    end
    object qrySaqueDS_VALUE1: TStringField
      FieldName = 'DS_VALUE1'
      FixedChar = True
      Size = 100
    end
    object qrySaqueDS_VALUE2: TStringField
      FieldName = 'DS_VALUE2'
      FixedChar = True
      Size = 100
    end
    object qrySaqueDATA_ATUAL: TStringField
      FieldName = 'DATA_ATUAL'
      FixedChar = True
      Size = 50
    end
    object qrySaqueIMPORT_EMPRESA: TStringField
      FieldName = 'IMPORT_EMPRESA'
      FixedChar = True
      Size = 60
    end
    object qrySaqueIMPORT_EMPRESA_NUMERO_CIDADE: TStringField
      FieldName = 'IMPORT_EMPRESA_NUMERO_CIDADE'
      FixedChar = True
      Size = 100
    end
    object qrySaqueIMPORT_ESTADO_PAIS: TStringField
      FieldName = 'IMPORT_ESTADO_PAIS'
      FixedChar = True
      Size = 60
    end
    object qrySaqueNM_GRUPO: TStringField
      FieldName = 'NM_GRUPO'
      FixedChar = True
      Size = 60
    end
    object qrySaqueCOPY: TStringField
      FieldName = 'COPY'
      FixedChar = True
      Size = 5
    end
    object qrySaqueDT_VENCIMENTO: TStringField
      FieldName = 'DT_VENCIMENTO'
      FixedChar = True
    end
    object qrySaqueREF_CC: TStringField
      FieldName = 'REF_CC'
      FixedChar = True
      Size = 200
    end
    object qrySaqueMOEDA: TStringField
      FieldName = 'MOEDA'
      FixedChar = True
      Size = 6
    end
  end
  object dspSaque: TDataSetProvider
    DataSet = qrySaque
    Left = 700
    Top = 182
  end
  object cdsSaque: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspSaque'
    Left = 700
    Top = 236
    object cdsSaqueNR_PROCESSO: TStringField
      FieldName = 'NR_PROCESSO'
      FixedChar = True
    end
    object cdsSaqueCONTROLE_NESTLE: TStringField
      FieldName = 'CONTROLE_NESTLE'
      FixedChar = True
    end
    object cdsSaqueEXPORT_CIDADE_ESTADO: TStringField
      FieldName = 'EXPORT_CIDADE_ESTADO'
      FixedChar = True
      Size = 60
    end
    object cdsSaqueINSTRUCAO: TStringField
      FieldName = 'INSTRUCAO'
      FixedChar = True
      Size = 40
    end
    object cdsSaqueDESC_DOCUMENTO1: TStringField
      FieldName = 'DESC_DOCUMENTO1'
      FixedChar = True
      Size = 50
    end
    object cdsSaqueDESC_DOCUMENTO2: TStringField
      FieldName = 'DESC_DOCUMENTO2'
      FixedChar = True
      Size = 50
    end
    object cdsSaqueVALOR_NUM: TFMTBCDField
      FieldName = 'VALOR_NUM'
      DisplayFormat = '##,##0.00'
      Precision = 20
      Size = 2
    end
    object cdsSaqueVL_EXTENSO1: TStringField
      FieldName = 'VL_EXTENSO1'
      FixedChar = True
      Size = 200
    end
    object cdsSaqueVL_EXTENSO2: TStringField
      FieldName = 'VL_EXTENSO2'
      FixedChar = True
      Size = 200
    end
    object cdsSaqueDS_VALUE1: TStringField
      FieldName = 'DS_VALUE1'
      FixedChar = True
      Size = 100
    end
    object cdsSaqueDS_VALUE2: TStringField
      FieldName = 'DS_VALUE2'
      FixedChar = True
      Size = 100
    end
    object cdsSaqueDATA_ATUAL: TStringField
      FieldName = 'DATA_ATUAL'
      FixedChar = True
      Size = 50
    end
    object cdsSaqueIMPORT_EMPRESA: TStringField
      FieldName = 'IMPORT_EMPRESA'
      FixedChar = True
      Size = 60
    end
    object cdsSaqueIMPORT_EMPRESA_NUMERO_CIDADE: TStringField
      FieldName = 'IMPORT_EMPRESA_NUMERO_CIDADE'
      FixedChar = True
      Size = 100
    end
    object cdsSaqueIMPORT_ESTADO_PAIS: TStringField
      FieldName = 'IMPORT_ESTADO_PAIS'
      FixedChar = True
      Size = 60
    end
    object cdsSaqueNM_GRUPO: TStringField
      FieldName = 'NM_GRUPO'
      FixedChar = True
      Size = 60
    end
    object cdsSaqueCOPY: TStringField
      FieldName = 'COPY'
      FixedChar = True
      Size = 5
    end
    object cdsSaqueDT_VENCIMENTO: TStringField
      FieldName = 'DT_VENCIMENTO'
      FixedChar = True
    end
    object cdsSaqueREF_CC: TStringField
      FieldName = 'REF_CC'
      FixedChar = True
      Size = 200
    end
    object cdsSaqueMOEDA: TStringField
      FieldName = 'MOEDA'
      FixedChar = True
      Size = 6
    end
  end
  object dsSaque: TDataSource
    DataSet = cdsSaque
    Left = 700
    Top = 286
  end
  object qryInternalExportDoc: TSQLQuery
    MaxBlobSize = -1
    Params = <>
    SQLConnection = SQLConnection
    Left = 289
    Top = 123
    object qryInternalExportDocNR_PROCESSO: TStringField
      FieldName = 'NR_PROCESSO'
      Required = True
      FixedChar = True
      Size = 18
    end
    object qryInternalExportDocDATA: TStringField
      FieldName = 'DATA'
      Size = 100
    end
    object qryInternalExportDocNM_EMPRESA: TStringField
      FieldName = 'NM_EMPRESA'
      FixedChar = True
      Size = 80
    end
    object qryInternalExportDocPATH_LOGO: TStringField
      FieldName = 'PATH_LOGO'
      FixedChar = True
      Size = 100
    end
    object qryInternalExportDocCONTROLE_NESTLE: TStringField
      FieldName = 'CONTROLE_NESTLE'
      FixedChar = True
      Size = 15
    end
    object qryInternalExportDocDESCRICAO: TStringField
      DisplayWidth = 1500
      FieldName = 'DESCRICAO'
      FixedChar = True
      Size = 1500
    end
    object qryInternalExportDocREF_CC: TStringField
      FieldName = 'REF_CC'
      Size = 200
    end
  end
  object dspInternalExportDoc: TDataSetProvider
    DataSet = qryInternalExportDoc
    Left = 289
    Top = 180
  end
  object cdsInternalExportDoc: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspInternalExportDoc'
    Left = 289
    Top = 230
    object cdsInternalExportDocNR_PROCESSO: TStringField
      FieldName = 'NR_PROCESSO'
      Required = True
      FixedChar = True
      Size = 18
    end
    object cdsInternalExportDocDATA: TStringField
      FieldName = 'DATA'
      Size = 100
    end
    object cdsInternalExportDocNM_EMPRESA: TStringField
      FieldName = 'NM_EMPRESA'
      FixedChar = True
      Size = 80
    end
    object cdsInternalExportDocPATH_LOGO: TStringField
      FieldName = 'PATH_LOGO'
      FixedChar = True
      Size = 100
    end
    object cdsInternalExportDocCONTROLE_NESTLE: TStringField
      FieldName = 'CONTROLE_NESTLE'
      FixedChar = True
      Size = 15
    end
    object cdsInternalExportDocDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      FixedChar = True
      Size = 1500
    end
    object cdsInternalExportDocREF_CC: TStringField
      FieldName = 'REF_CC'
      Size = 200
    end
  end
  object dsInternalExportDoc: TDataSource
    DataSet = cdsInternalExportDoc
    Left = 289
    Top = 284
  end
  object qryInternalExportDocItem: TSQLQuery
    MaxBlobSize = -1
    Params = <>
    SQLConnection = SQLConnection
    Left = 404
    Top = 123
    object qryInternalExportDocItemNR_PROCESSO: TStringField
      FieldName = 'NR_PROCESSO'
      Required = True
      FixedChar = True
      Size = 18
    end
    object qryInternalExportDocItemCD_MERCADORIA: TStringField
      FieldName = 'CD_MERCADORIA'
      FixedChar = True
      Size = 40
    end
    object qryInternalExportDocItemDT_FABRICACAO: TSQLTimeStampField
      FieldName = 'DT_FABRICACAO'
    end
    object qryInternalExportDocItemDT_VENCIMENTO: TSQLTimeStampField
      FieldName = 'DT_VENCIMENTO'
    end
    object qryInternalExportDocItemTX_MERCADORIA: TStringField
      FieldName = 'TX_MERCADORIA'
      FixedChar = True
      Size = 200
    end
    object qryInternalExportDocItemQT_MERCADORIA: TFloatField
      FieldName = 'QT_MERCADORIA'
    end
  end
  object dspInternalExportDocItem: TDataSetProvider
    DataSet = qryInternalExportDocItem
    Left = 404
    Top = 180
  end
  object cdsInternalExportDocItem: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspInternalExportDocItem'
    Left = 404
    Top = 231
    object cdsInternalExportDocItemNR_PROCESSO: TStringField
      FieldName = 'NR_PROCESSO'
      Required = True
      FixedChar = True
      Size = 18
    end
    object cdsInternalExportDocItemCD_MERCADORIA: TStringField
      FieldName = 'CD_MERCADORIA'
      FixedChar = True
      Size = 40
    end
    object cdsInternalExportDocItemDT_FABRICACAO: TSQLTimeStampField
      FieldName = 'DT_FABRICACAO'
    end
    object cdsInternalExportDocItemDT_VENCIMENTO: TSQLTimeStampField
      FieldName = 'DT_VENCIMENTO'
    end
    object cdsInternalExportDocItemTX_MERCADORIA: TStringField
      FieldName = 'TX_MERCADORIA'
      FixedChar = True
      Size = 200
    end
    object cdsInternalExportDocItemQT_MERCADORIA: TFloatField
      FieldName = 'QT_MERCADORIA'
    end
  end
  object dsInternalExportDocItem: TDataSource
    DataSet = cdsInternalExportDocItem
    Left = 404
    Top = 284
  end
  object qryBordero: TSQLQuery
    MaxBlobSize = -1
    Params = <>
    SQLConnection = SQLConnection
    Left = 780
    Top = 125
    object qryBorderoNR_PROCESSO: TStringField
      FieldName = 'NR_PROCESSO'
      Required = True
      FixedChar = True
      Size = 18
    end
    object qryBorderoPATH_LOGO: TStringField
      FieldName = 'PATH_LOGO'
      FixedChar = True
      Size = 100
    end
    object qryBorderoCONTROLE_NESTLE: TStringField
      FieldName = 'CONTROLE_NESTLE'
      FixedChar = True
      Size = 15
    end
    object qryBorderoEXPORT_EMPRESA: TStringField
      FieldName = 'EXPORT_EMPRESA'
      Required = True
      FixedChar = True
      Size = 80
    end
    object qryBorderoIMPORT_EMPRESA: TStringField
      FieldName = 'IMPORT_EMPRESA'
      FixedChar = True
      Size = 100
    end
    object qryBorderoVL_TOT_MCV: TFloatField
      FieldName = 'VL_TOT_MCV'
    end
    object qryBorderoNR_CONHECIMENTO: TStringField
      FieldName = 'NR_CONHECIMENTO'
      FixedChar = True
      Size = 30
    end
    object qryBorderoDT_CONHECIMENTO: TSQLTimeStampField
      FieldName = 'DT_CONHECIMENTO'
    end
    object qryBorderoNM_TERMO_PAGTO: TStringField
      FieldName = 'NM_TERMO_PAGTO'
      FixedChar = True
      Size = 50
    end
    object qryBorderoNM_VIA_TRANSPORTE: TStringField
      FieldName = 'NM_VIA_TRANSPORTE'
      FixedChar = True
    end
    object qryBorderoNR_DDE: TStringField
      FieldName = 'NR_DDE'
      FixedChar = True
      Size = 11
    end
    object qryBorderoTX_DECL_ADIC_INST_EMB: TStringField
      FieldName = 'TX_DECL_ADIC_INST_EMB'
      FixedChar = True
      Size = 500
    end
    object qryBorderoDT_VENCIMENTO: TSQLTimeStampField
      FieldName = 'DT_VENCIMENTO'
    end
    object qryBorderoINSTRUCAO: TStringField
      FieldName = 'INSTRUCAO'
      Size = 200
    end
    object qryBorderoCD_DUE: TStringField
      FieldName = 'CD_DUE'
      FixedChar = True
      Size = 14
    end
    object qryBorderoDS_BANCO_SAQUE: TStringField
      FieldName = 'DS_BANCO_SAQUE'
      FixedChar = True
      Size = 100
    end
    object qryBorderoDS_BANCO_BORDERO: TStringField
      FieldName = 'DS_BANCO_BORDERO'
      FixedChar = True
      Size = 100
    end
    object qryBorderoCD_RUC: TStringField
      FieldName = 'CD_RUC'
      FixedChar = True
      Size = 35
    end
    object qryBorderoREF_CC: TStringField
      FieldName = 'REF_CC'
      Size = 200
    end
  end
  object dspBordero: TDataSetProvider
    DataSet = qryBordero
    Left = 780
    Top = 182
  end
  object cdsBordero: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspBordero'
    Left = 780
    Top = 232
    object cdsBorderoNR_PROCESSO: TStringField
      FieldName = 'NR_PROCESSO'
      Required = True
      FixedChar = True
      Size = 18
    end
    object cdsBorderoPATH_LOGO: TStringField
      FieldName = 'PATH_LOGO'
      FixedChar = True
      Size = 100
    end
    object cdsBorderoCONTROLE_NESTLE: TStringField
      FieldName = 'CONTROLE_NESTLE'
      FixedChar = True
      Size = 15
    end
    object cdsBorderoEXPORT_EMPRESA: TStringField
      FieldName = 'EXPORT_EMPRESA'
      Required = True
      FixedChar = True
      Size = 80
    end
    object cdsBorderoIMPORT_EMPRESA: TStringField
      FieldName = 'IMPORT_EMPRESA'
      FixedChar = True
      Size = 100
    end
    object cdsBorderoVL_TOT_MCV: TFloatField
      FieldName = 'VL_TOT_MCV'
      DisplayFormat = '#,##0.00'
    end
    object cdsBorderoNR_CONHECIMENTO: TStringField
      FieldName = 'NR_CONHECIMENTO'
      FixedChar = True
      Size = 30
    end
    object cdsBorderoDT_CONHECIMENTO: TSQLTimeStampField
      FieldName = 'DT_CONHECIMENTO'
    end
    object cdsBorderoNM_TERMO_PAGTO: TStringField
      FieldName = 'NM_TERMO_PAGTO'
      FixedChar = True
      Size = 50
    end
    object cdsBorderoNM_VIA_TRANSPORTE: TStringField
      FieldName = 'NM_VIA_TRANSPORTE'
      FixedChar = True
    end
    object cdsBorderoNR_DDE: TStringField
      FieldName = 'NR_DDE'
      FixedChar = True
      Size = 11
    end
    object cdsBorderoTX_DECL_ADIC_INST_EMB: TStringField
      FieldName = 'TX_DECL_ADIC_INST_EMB'
      FixedChar = True
      Size = 500
    end
    object cdsBorderoDT_VENCIMENTO: TSQLTimeStampField
      FieldName = 'DT_VENCIMENTO'
    end
    object cdsBorderoINSTRUCAO: TStringField
      FieldName = 'INSTRUCAO'
      Size = 200
    end
    object cdsBorderoCD_DUE: TStringField
      FieldName = 'CD_DUE'
      FixedChar = True
      Size = 14
    end
    object cdsBorderoDS_BANCO_SAQUE: TStringField
      FieldName = 'DS_BANCO_SAQUE'
      FixedChar = True
      Size = 100
    end
    object cdsBorderoDS_BANCO_BORDERO: TStringField
      FieldName = 'DS_BANCO_BORDERO'
      FixedChar = True
      Size = 100
    end
    object cdsBorderoCD_RUC: TStringField
      FieldName = 'CD_RUC'
      FixedChar = True
      Size = 35
    end
    object cdsBorderoREF_CC: TStringField
      FieldName = 'REF_CC'
      Size = 200
    end
  end
  object dsBordero: TDataSource
    DataSet = cdsBordero
    Left = 781
    Top = 286
  end
  object qryCaricom: TSQLQuery
    MaxBlobSize = -1
    Params = <>
    SQLConnection = SQLConnection
    Left = 534
    Top = 122
    object qryCaricomNR_PROCESSO: TStringField
      FieldName = 'NR_PROCESSO'
      Required = True
      FixedChar = True
      Size = 18
    end
    object qryCaricomEXPORT_EMPRESA: TStringField
      FieldName = 'EXPORT_EMPRESA'
      Required = True
      FixedChar = True
      Size = 80
    end
    object qryCaricomEXPORT_EMPRESA_NUMERO: TStringField
      FieldName = 'EXPORT_EMPRESA_NUMERO'
      FixedChar = True
      Size = 57
    end
    object qryCaricomEXPORT_CIDADE_ESTADO: TStringField
      FieldName = 'EXPORT_CIDADE_ESTADO'
      FixedChar = True
      Size = 33
    end
    object qryCaricomIMPORT_EMPRESA: TStringField
      FieldName = 'IMPORT_EMPRESA'
      FixedChar = True
      Size = 100
    end
    object qryCaricomCONSIG_EMPRESA: TStringField
      FieldName = 'CONSIG_EMPRESA'
      FixedChar = True
      Size = 100
    end
    object qryCaricomDS_PORTO_EMBARQUE: TStringField
      FieldName = 'DS_PORTO_EMBARQUE'
      FixedChar = True
      Size = 53
    end
    object qryCaricomVL_PESO_BRUTO: TFloatField
      FieldName = 'VL_PESO_BRUTO'
      DisplayFormat = '##,###0.000'
    end
    object qryCaricomVL_M3: TFloatField
      FieldName = 'VL_M3'
      DisplayFormat = '##,###0.000'
    end
    object qryCaricomVL_MLE_MNEG: TFloatField
      FieldName = 'VL_MLE_MNEG'
      DisplayFormat = '##,##0.00'
    end
    object qryCaricomNM_PROCESSO_SAP: TStringField
      FieldName = 'NM_PROCESSO_SAP'
      FixedChar = True
      Size = 15
    end
    object qryCaricomMARCA_NM_PAIS: TStringField
      FieldName = 'MARCA_NM_PAIS'
      FixedChar = True
      Size = 120
    end
    object qryCaricomMARCA_NM_EMPRESA_NAC: TStringField
      FieldName = 'MARCA_NM_EMPRESA_NAC'
      FixedChar = True
      Size = 80
    end
    object qryCaricomCD_INCOTERM: TStringField
      FieldName = 'CD_INCOTERM'
      FixedChar = True
      Size = 3
    end
    object qryCaricomVL_FRETE_PREPAID_MNEG: TFloatField
      FieldName = 'VL_FRETE_PREPAID_MNEG'
    end
    object qryCaricomVL_SEGURO: TFloatField
      FieldName = 'VL_SEGURO'
      DisplayFormat = '##,##0.00'
    end
    object qryCaricomVL_TOT_MCV: TFloatField
      FieldName = 'VL_TOT_MCV'
      DisplayFormat = '##,##0.00'
    end
    object qryCaricomNR_CONHECIMENTO: TStringField
      FieldName = 'NR_CONHECIMENTO'
      FixedChar = True
      Size = 30
    end
    object qryCaricomNM_TERMO_PAGTO: TStringField
      DisplayWidth = 100
      FieldName = 'NM_TERMO_PAGTO'
      FixedChar = True
      Size = 100
    end
    object qryCaricomNR_PERIODICIDADE: TIntegerField
      FieldName = 'NR_PERIODICIDADE'
    end
    object qryCaricomNM_VIA_TRANSPORTE: TStringField
      FieldName = 'NM_VIA_TRANSPORTE'
      FixedChar = True
    end
    object qryCaricomAP_MOEDA: TStringField
      FieldName = 'AP_MOEDA'
      FixedChar = True
      Size = 6
    end
    object qryCaricomVL_PACKING: TFMTBCDField
      FieldName = 'VL_PACKING'
      Precision = 15
      Size = 2
    end
    object qryCaricomVL_OTHER: TFMTBCDField
      FieldName = 'VL_OTHER'
      Precision = 15
      Size = 2
    end
    object qryCaricomDS_PORTO_DESTINO: TStringField
      FieldName = 'DS_PORTO_DESTINO'
      Size = 50
    end
    object qryCaricomTX_MARCACAO_VOLUME: TStringField
      FieldName = 'TX_MARCACAO_VOLUME'
      Size = 500
    end
    object qryCaricomCONSIG_ENDERECO: TStringField
      FieldName = 'CONSIG_ENDERECO'
      FixedChar = True
      Size = 170
    end
    object qryCaricomCONTROLE_NESTLE: TStringField
      FieldName = 'CONTROLE_NESTLE'
      FixedChar = True
      Size = 29
    end
    object qryCaricomREF_CC: TStringField
      FieldName = 'REF_CC'
      Size = 200
    end
  end
  object dspCaricom: TDataSetProvider
    DataSet = qryCaricom
    Left = 533
    Top = 180
  end
  object cdsCaricom: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspCaricom'
    Left = 533
    Top = 230
    object cdsCaricomNR_PROCESSO: TStringField
      FieldName = 'NR_PROCESSO'
      Required = True
      FixedChar = True
      Size = 18
    end
    object cdsCaricomEXPORT_EMPRESA: TStringField
      FieldName = 'EXPORT_EMPRESA'
      Required = True
      FixedChar = True
      Size = 80
    end
    object cdsCaricomEXPORT_EMPRESA_NUMERO: TStringField
      FieldName = 'EXPORT_EMPRESA_NUMERO'
      FixedChar = True
      Size = 57
    end
    object cdsCaricomEXPORT_CIDADE_ESTADO: TStringField
      FieldName = 'EXPORT_CIDADE_ESTADO'
      FixedChar = True
      Size = 33
    end
    object cdsCaricomIMPORT_EMPRESA: TStringField
      FieldName = 'IMPORT_EMPRESA'
      FixedChar = True
      Size = 100
    end
    object cdsCaricomCONSIG_EMPRESA: TStringField
      FieldName = 'CONSIG_EMPRESA'
      FixedChar = True
      Size = 100
    end
    object cdsCaricomDS_PORTO_EMBARQUE: TStringField
      FieldName = 'DS_PORTO_EMBARQUE'
      FixedChar = True
      Size = 53
    end
    object cdsCaricomVL_PESO_BRUTO: TFloatField
      FieldName = 'VL_PESO_BRUTO'
      DisplayFormat = '##,###0.000'
    end
    object cdsCaricomVL_M3: TFloatField
      FieldName = 'VL_M3'
      DisplayFormat = '##,###0.000'
    end
    object cdsCaricomVL_MLE_MNEG: TFloatField
      FieldName = 'VL_MLE_MNEG'
      DisplayFormat = '##,##0.00'
    end
    object cdsCaricomNM_PROCESSO_SAP: TStringField
      FieldName = 'NM_PROCESSO_SAP'
      FixedChar = True
      Size = 15
    end
    object cdsCaricomMARCA_NM_PAIS: TStringField
      FieldName = 'MARCA_NM_PAIS'
      FixedChar = True
      Size = 120
    end
    object cdsCaricomMARCA_NM_EMPRESA_NAC: TStringField
      FieldName = 'MARCA_NM_EMPRESA_NAC'
      FixedChar = True
      Size = 80
    end
    object cdsCaricomCD_INCOTERM: TStringField
      FieldName = 'CD_INCOTERM'
      FixedChar = True
      Size = 3
    end
    object cdsCaricomVL_FRETE_PREPAID_MNEG: TFloatField
      FieldName = 'VL_FRETE_PREPAID_MNEG'
      DisplayFormat = '##,##0.00'
    end
    object cdsCaricomVL_SEGURO: TFloatField
      FieldName = 'VL_SEGURO'
      DisplayFormat = '##,##0.00'
    end
    object cdsCaricomVL_TOT_MCV: TFloatField
      FieldName = 'VL_TOT_MCV'
      DisplayFormat = '##,##0.00'
    end
    object cdsCaricomNR_CONHECIMENTO: TStringField
      FieldName = 'NR_CONHECIMENTO'
      FixedChar = True
      Size = 30
    end
    object cdsCaricomNM_TERMO_PAGTO: TStringField
      FieldName = 'NM_TERMO_PAGTO'
      FixedChar = True
      Size = 50
    end
    object cdsCaricomNR_PERIODICIDADE: TIntegerField
      FieldName = 'NR_PERIODICIDADE'
    end
    object cdsCaricomNM_VIA_TRANSPORTE: TStringField
      FieldName = 'NM_VIA_TRANSPORTE'
      FixedChar = True
    end
    object cdsCaricomAP_MOEDA: TStringField
      FieldName = 'AP_MOEDA'
      FixedChar = True
      Size = 6
    end
    object cdsCaricomVL_PACKING: TFMTBCDField
      FieldName = 'VL_PACKING'
      DisplayFormat = '##,##0.00'
      Precision = 15
      Size = 2
    end
    object cdsCaricomVL_OTHER: TFMTBCDField
      FieldName = 'VL_OTHER'
      DisplayFormat = '##,##0.00'
      Precision = 15
      Size = 2
    end
    object cdsCaricomDS_PORTO_DESTINO: TStringField
      FieldName = 'DS_PORTO_DESTINO'
      Size = 50
    end
    object cdsCaricomTX_MARCACAO_VOLUME: TStringField
      FieldName = 'TX_MARCACAO_VOLUME'
      Size = 500
    end
    object cdsCaricomCONSIG_ENDERECO: TStringField
      FieldName = 'CONSIG_ENDERECO'
      FixedChar = True
      Size = 170
    end
    object cdsCaricomCONTROLE_NESTLE: TStringField
      FieldName = 'CONTROLE_NESTLE'
      FixedChar = True
      Size = 29
    end
    object cdsCaricomREF_CC: TStringField
      FieldName = 'REF_CC'
      Size = 200
    end
  end
  object dsCaricom: TDataSource
    DataSet = cdsCaricom
    Left = 533
    Top = 284
  end
  object dsCaricomItem: TDataSource
    DataSet = cdsCaricomItem
    Left = 605
    Top = 284
  end
  object cdsCaricomItem: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspCaricomItem'
    Left = 605
    Top = 230
    object cdsCaricomItemQT_MERCADORIA: TFloatField
      FieldName = 'QT_MERCADORIA'
    end
    object cdsCaricomItemVL_TOT_PESO_LIQ: TFloatField
      FieldName = 'VL_TOT_PESO_LIQ'
      DisplayFormat = '##,###0.000'
    end
    object cdsCaricomItemVL_UNITARIO: TFloatField
      FieldName = 'VL_UNITARIO'
      DisplayFormat = '#,0.00'
    end
    object cdsCaricomItemVL_TOT_ITEM: TFloatField
      FieldName = 'VL_TOT_ITEM'
      DisplayFormat = '#,0.00'
    end
    object cdsCaricomItemNM_UNID_MEDIDA_ING: TStringField
      FieldName = 'NM_UNID_MEDIDA_ING'
      FixedChar = True
      Size = 50
    end
    object cdsCaricomItemNM_UNID_MEDIDA_ESP: TStringField
      FieldName = 'NM_UNID_MEDIDA_ESP'
      FixedChar = True
      Size = 50
    end
    object cdsCaricomItemTX_MERCADORIA: TStringField
      FieldName = 'TX_MERCADORIA'
      FixedChar = True
      Size = 40
    end
  end
  object dspCaricomItem: TDataSetProvider
    DataSet = qryCaricomItem
    Left = 605
    Top = 180
  end
  object qryCaricomItem: TSQLQuery
    MaxBlobSize = -1
    Params = <>
    SQLConnection = SQLConnection
    Left = 605
    Top = 123
    object qryCaricomItemQT_MERCADORIA: TFloatField
      FieldName = 'QT_MERCADORIA'
    end
    object qryCaricomItemVL_TOT_PESO_LIQ: TFloatField
      FieldName = 'VL_TOT_PESO_LIQ'
    end
    object qryCaricomItemVL_UNITARIO: TFloatField
      FieldName = 'VL_UNITARIO'
    end
    object qryCaricomItemVL_TOT_ITEM: TFloatField
      FieldName = 'VL_TOT_ITEM'
    end
    object qryCaricomItemNM_UNID_MEDIDA_ING: TStringField
      FieldName = 'NM_UNID_MEDIDA_ING'
      FixedChar = True
      Size = 50
    end
    object qryCaricomItemNM_UNID_MEDIDA_ESP: TStringField
      FieldName = 'NM_UNID_MEDIDA_ESP'
      FixedChar = True
      Size = 50
    end
    object qryCaricomItemTX_MERCADORIA: TStringField
      FieldName = 'TX_MERCADORIA'
      FixedChar = True
      Size = 40
    end
  end
  object qryInstrucaoEmbarque: TSQLQuery
    MaxBlobSize = -1
    Params = <>
    SQLConnection = SQLConnection
    Left = 48
    Top = 349
    object qryInstrucaoEmbarqueNR_FORNECIMENTO: TStringField
      FieldName = 'NR_FORNECIMENTO'
      FixedChar = True
      Size = 310
    end
    object qryInstrucaoEmbarqueDT_INSERCAO: TSQLTimeStampField
      FieldName = 'DT_INSERCAO'
    end
    object qryInstrucaoEmbarqueTX_OBS: TStringField
      FieldName = 'TX_OBS'
      FixedChar = True
      Size = 255
    end
    object qryInstrucaoEmbarqueCONSIG_ENDERECO1: TStringField
      FieldName = 'CONSIG_ENDERECO1'
      Required = True
      FixedChar = True
      Size = 107
    end
    object qryInstrucaoEmbarqueCONSIG_ENDERECO2: TStringField
      FieldName = 'CONSIG_ENDERECO2'
      Required = True
      FixedChar = True
      Size = 186
    end
    object qryInstrucaoEmbarqueNOTIFY_NM_EMPRESA: TStringField
      FieldName = 'NOTIFY_NM_EMPRESA'
      FixedChar = True
      Size = 100
    end
    object qryInstrucaoEmbarqueNOTIFY_ENDERECO1: TStringField
      FieldName = 'NOTIFY_ENDERECO1'
      Required = True
      FixedChar = True
      Size = 107
    end
    object qryInstrucaoEmbarqueNOTIFY_ENDERECO2: TStringField
      FieldName = 'NOTIFY_ENDERECO2'
      Required = True
      FixedChar = True
      Size = 186
    end
    object qryInstrucaoEmbarqueVL_CUBAGEM: TFMTBCDField
      FieldName = 'VL_CUBAGEM'
      Required = True
      DisplayFormat = '##,###0.000'
      Precision = 16
      Size = 7
    end
    object qryInstrucaoEmbarqueNM_VIA_TRANSP: TStringField
      FieldName = 'NM_VIA_TRANSP'
      FixedChar = True
    end
    object qryInstrucaoEmbarqueDS_LOCAL_EMBARQUE: TStringField
      FieldName = 'DS_LOCAL_EMBARQUE'
      FixedChar = True
      Size = 50
    end
    object qryInstrucaoEmbarqueDS_LOCAL_DESTINO: TStringField
      FieldName = 'DS_LOCAL_DESTINO'
      FixedChar = True
      Size = 50
    end
    object qryInstrucaoEmbarqueDT_PREV_EMBARQUE: TSQLTimeStampField
      FieldName = 'DT_PREV_EMBARQUE'
    end
    object qryInstrucaoEmbarqueDT_FECHAMENTO: TSQLTimeStampField
      FieldName = 'DT_FECHAMENTO'
    end
    object qryInstrucaoEmbarqueDT_FINALIZADO: TSQLTimeStampField
      FieldName = 'DT_FINALIZADO'
    end
    object qryInstrucaoEmbarqueNM_TERMO_PAGTO: TStringField
      FieldName = 'NM_TERMO_PAGTO'
      FixedChar = True
      Size = 50
    end
    object qryInstrucaoEmbarqueCD_INCOTERM: TStringField
      FieldName = 'CD_INCOTERM'
      FixedChar = True
      Size = 3
    end
    object qryInstrucaoEmbarqueVL_MLE: TFMTBCDField
      FieldName = 'VL_MLE'
      DisplayFormat = '##,##0.00'
      Precision = 16
      Size = 7
    end
    object qryInstrucaoEmbarqueVL_SEGURO: TFMTBCDField
      FieldName = 'VL_SEGURO'
      DisplayFormat = '##,##0.00'
      Precision = 16
      Size = 7
    end
    object qryInstrucaoEmbarqueVL_FRETE_INT: TFMTBCDField
      FieldName = 'VL_FRETE_INT'
      DisplayFormat = '##,##0.00'
      Precision = 16
      Size = 7
    end
    object qryInstrucaoEmbarqueORIGEM_NM_PAIS: TStringField
      FieldName = 'ORIGEM_NM_PAIS'
      FixedChar = True
      Size = 120
    end
    object qryInstrucaoEmbarqueDESTINO_NM_PAIS: TStringField
      FieldName = 'DESTINO_NM_PAIS'
      FixedChar = True
      Size = 120
    end
    object qryInstrucaoEmbarqueVL_TOTAL: TFMTBCDField
      FieldName = 'VL_TOTAL'
      DisplayFormat = '##,##0.00'
      Precision = 17
      Size = 7
    end
    object qryInstrucaoEmbarqueNM_EXPOTADOR: TStringField
      FieldName = 'NM_EXPOTADOR'
      Size = 80
    end
    object qryInstrucaoEmbarqueCONSIG_ENDERECO3: TStringField
      FieldName = 'CONSIG_ENDERECO3'
      Size = 300
    end
    object qryInstrucaoEmbarqueNOTIFY_ENDERECO3: TStringField
      FieldName = 'NOTIFY_ENDERECO3'
      Size = 300
    end
    object qryInstrucaoEmbarqueIMPOR_NM_EMPRESA: TStringField
      FieldName = 'IMPOR_NM_EMPRESA'
      FixedChar = True
      Size = 100
    end
    object qryInstrucaoEmbarqueIMPOR_ENDERECO1: TStringField
      FieldName = 'IMPOR_ENDERECO1'
      Required = True
      FixedChar = True
      Size = 107
    end
    object qryInstrucaoEmbarqueIMPOR_ENDERECO2: TStringField
      FieldName = 'IMPOR_ENDERECO2'
      Required = True
      FixedChar = True
      Size = 186
    end
    object qryInstrucaoEmbarqueIMPOR_ENDERECO3: TStringField
      FieldName = 'IMPOR_ENDERECO3'
      FixedChar = True
      Size = 57
    end
    object qryInstrucaoEmbarqueCONSIG_NM_EMPRESA: TStringField
      FieldName = 'CONSIG_NM_EMPRESA'
      FixedChar = True
      Size = 100
    end
    object qryInstrucaoEmbarqueNR_PEDIDO: TStringField
      FieldName = 'NR_PEDIDO'
      FixedChar = True
      Size = 18
    end
    object qryInstrucaoEmbarqueVL_PESO_BRUTO: TFMTBCDField
      FieldName = 'VL_PESO_BRUTO'
      Required = True
      DisplayFormat = '##,###0.000'
      Precision = 15
      Size = 3
    end
    object qryInstrucaoEmbarqueVL_PESO_LIQ: TFMTBCDField
      FieldName = 'VL_PESO_LIQ'
      Required = True
      DisplayFormat = '##,###0.000'
      Precision = 15
      Size = 3
    end
    object qryInstrucaoEmbarqueCD_RAP: TStringField
      FieldName = 'CD_RAP'
      Required = True
      FixedChar = True
      Size = 9
    end
    object qryInstrucaoEmbarqueCONSIG_CD_EMPRESA: TStringField
      FieldName = 'CONSIG_CD_EMPRESA'
      FixedChar = True
      Size = 5
    end
    object qryInstrucaoEmbarqueNOTIFY_CD_EMPRESA: TStringField
      FieldName = 'NOTIFY_CD_EMPRESA'
      FixedChar = True
      Size = 5
    end
    object qryInstrucaoEmbarqueIMPOR_CD_EMPRESA: TStringField
      FieldName = 'IMPOR_CD_EMPRESA'
      FixedChar = True
      Size = 5
    end
  end
  object dspInstrucaoEmbarque: TDataSetProvider
    DataSet = qryInstrucaoEmbarque
    Left = 48
    Top = 404
  end
  object cdsInstrucaoEmbarque: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspInstrucaoEmbarque'
    Left = 48
    Top = 456
    object cdsInstrucaoEmbarqueNR_FORNECIMENTO: TStringField
      FieldName = 'NR_FORNECIMENTO'
      FixedChar = True
      Size = 310
    end
    object cdsInstrucaoEmbarqueDT_INSERCAO: TSQLTimeStampField
      FieldName = 'DT_INSERCAO'
    end
    object cdsInstrucaoEmbarqueTX_OBS: TStringField
      FieldName = 'TX_OBS'
      FixedChar = True
      Size = 255
    end
    object cdsInstrucaoEmbarqueCONSIG_ENDERECO1: TStringField
      FieldName = 'CONSIG_ENDERECO1'
      Required = True
      FixedChar = True
      Size = 107
    end
    object cdsInstrucaoEmbarqueCONSIG_ENDERECO2: TStringField
      FieldName = 'CONSIG_ENDERECO2'
      Required = True
      FixedChar = True
      Size = 186
    end
    object cdsInstrucaoEmbarqueNM_EMPRESA_1: TStringField
      FieldName = 'NOTIFY_NM_EMPRESA'
      FixedChar = True
      Size = 100
    end
    object cdsInstrucaoEmbarqueNOTIFY_ENDERECO1: TStringField
      FieldName = 'NOTIFY_ENDERECO1'
      Required = True
      FixedChar = True
      Size = 107
    end
    object cdsInstrucaoEmbarqueNOTIFY_ENDERECO2: TStringField
      FieldName = 'NOTIFY_ENDERECO2'
      Required = True
      FixedChar = True
      Size = 186
    end
    object cdsInstrucaoEmbarqueVL_CUBAGEM: TFMTBCDField
      FieldName = 'VL_CUBAGEM'
      Required = True
      DisplayFormat = '##,###0.000'
      Precision = 16
      Size = 7
    end
    object cdsInstrucaoEmbarqueNM_VIA_TRANSP: TStringField
      FieldName = 'NM_VIA_TRANSP'
      FixedChar = True
    end
    object cdsInstrucaoEmbarqueDS_LOCAL_EMBARQUE: TStringField
      FieldName = 'DS_LOCAL_EMBARQUE'
      FixedChar = True
      Size = 50
    end
    object cdsInstrucaoEmbarqueDS_LOCAL_DESTINO: TStringField
      FieldName = 'DS_LOCAL_DESTINO'
      FixedChar = True
      Size = 50
    end
    object cdsInstrucaoEmbarqueDT_PREV_EMBARQUE: TSQLTimeStampField
      FieldName = 'DT_PREV_EMBARQUE'
    end
    object cdsInstrucaoEmbarqueDT_FECHAMENTO: TSQLTimeStampField
      FieldName = 'DT_FECHAMENTO'
    end
    object cdsInstrucaoEmbarqueDT_FINALIZADO: TSQLTimeStampField
      FieldName = 'DT_FINALIZADO'
    end
    object cdsInstrucaoEmbarqueNM_TERMO_PAGTO: TStringField
      FieldName = 'NM_TERMO_PAGTO'
      FixedChar = True
      Size = 50
    end
    object cdsInstrucaoEmbarqueCD_INCOTERM: TStringField
      FieldName = 'CD_INCOTERM'
      FixedChar = True
      Size = 3
    end
    object cdsInstrucaoEmbarqueVL_MLE: TFMTBCDField
      FieldName = 'VL_MLE'
      DisplayFormat = '##,##0.00'
      Precision = 16
      Size = 7
    end
    object cdsInstrucaoEmbarqueVL_SEGURO: TFMTBCDField
      FieldName = 'VL_SEGURO'
      DisplayFormat = '##,##0.00'
      Precision = 16
      Size = 7
    end
    object cdsInstrucaoEmbarqueVL_FRETE_INT: TFMTBCDField
      FieldName = 'VL_FRETE_INT'
      DisplayFormat = '##,##0.00'
      Precision = 16
      Size = 7
    end
    object cdsInstrucaoEmbarqueORIGEM_NM_PAIS: TStringField
      FieldName = 'ORIGEM_NM_PAIS'
      FixedChar = True
      Size = 120
    end
    object cdsInstrucaoEmbarqueDESTINO_NM_PAIS: TStringField
      FieldName = 'DESTINO_NM_PAIS'
      FixedChar = True
      Size = 120
    end
    object cdsInstrucaoEmbarqueVL_TOTAL: TFMTBCDField
      FieldName = 'VL_TOTAL'
      DisplayFormat = '##,##0.00'
      Precision = 17
      Size = 7
    end
    object cdsInstrucaoEmbarqueNM_EXPOTADOR: TStringField
      FieldName = 'NM_EXPOTADOR'
      Size = 80
    end
    object cdsInstrucaoEmbarqueCONSIG_ENDERECO3: TStringField
      FieldName = 'CONSIG_ENDERECO3'
      Size = 300
    end
    object cdsInstrucaoEmbarqueNOTIFY_ENDERECO3: TStringField
      FieldName = 'NOTIFY_ENDERECO3'
      Size = 300
    end
    object cdsInstrucaoEmbarqueIMPOR_NM_EMPRESA: TStringField
      FieldName = 'IMPOR_NM_EMPRESA'
      FixedChar = True
      Size = 100
    end
    object cdsInstrucaoEmbarqueIMPOR_ENDERECO1: TStringField
      FieldName = 'IMPOR_ENDERECO1'
      Required = True
      FixedChar = True
      Size = 107
    end
    object cdsInstrucaoEmbarqueIMPOR_ENDERECO2: TStringField
      FieldName = 'IMPOR_ENDERECO2'
      Required = True
      FixedChar = True
      Size = 186
    end
    object cdsInstrucaoEmbarqueIMPOR_ENDERECO3: TStringField
      FieldName = 'IMPOR_ENDERECO3'
      FixedChar = True
      Size = 57
    end
    object cdsInstrucaoEmbarqueCONSIG_NM_EMPRESA: TStringField
      FieldName = 'CONSIG_NM_EMPRESA'
      FixedChar = True
      Size = 100
    end
    object cdsInstrucaoEmbarqueNR_PEDIDO: TStringField
      FieldName = 'NR_PEDIDO'
      FixedChar = True
      Size = 18
    end
    object cdsInstrucaoEmbarqueVL_PESO_BRUTO: TFMTBCDField
      FieldName = 'VL_PESO_BRUTO'
      Required = True
      DisplayFormat = '##,###0.000'
      Precision = 15
      Size = 3
    end
    object cdsInstrucaoEmbarqueVL_PESO_LIQ: TFMTBCDField
      FieldName = 'VL_PESO_LIQ'
      Required = True
      DisplayFormat = '##,###0.000'
      Precision = 15
      Size = 3
    end
    object cdsInstrucaoEmbarqueCD_RAP: TStringField
      FieldName = 'CD_RAP'
      Required = True
      FixedChar = True
      Size = 9
    end
    object cdsInstrucaoEmbarqueCONSIG_CD_EMPRESA: TStringField
      FieldName = 'CONSIG_CD_EMPRESA'
      FixedChar = True
      Size = 5
    end
    object cdsInstrucaoEmbarqueNOTIFY_CD_EMPRESA: TStringField
      FieldName = 'NOTIFY_CD_EMPRESA'
      FixedChar = True
      Size = 5
    end
    object cdsInstrucaoEmbarqueIMPOR_CD_EMPRESA: TStringField
      FieldName = 'IMPOR_CD_EMPRESA'
      FixedChar = True
      Size = 5
    end
  end
  object dsInstrucaoEmbarque: TDataSource
    DataSet = cdsInstrucaoEmbarque
    Left = 48
    Top = 510
  end
  object qryInstrucaoEmbarqueItem: TSQLQuery
    MaxBlobSize = -1
    Params = <>
    SQLConnection = SQLConnection
    Left = 172
    Top = 350
    object qryInstrucaoEmbarqueItemCD_MERCADORIA: TStringField
      FieldName = 'CD_MERCADORIA'
      Required = True
      FixedChar = True
      Size = 40
    end
    object qryInstrucaoEmbarqueItemNM_MERCADORIA: TStringField
      FieldName = 'NM_MERCADORIA'
      FixedChar = True
      Size = 241
    end
    object qryInstrucaoEmbarqueItemVL_QTDE: TFMTBCDField
      FieldName = 'VL_QTDE'
      Required = True
      Precision = 16
      Size = 7
    end
    object qryInstrucaoEmbarqueItemVL_PRECO_UNIT: TFMTBCDField
      FieldName = 'VL_PRECO_UNIT'
      DisplayFormat = '##,##0.00'
      Precision = 16
      Size = 7
    end
    object qryInstrucaoEmbarqueItemVL_PRECO_TOT: TFMTBCDField
      FieldName = 'VL_PRECO_TOT'
      DisplayFormat = '##,##0.00'
      Precision = 16
      Size = 7
    end
    object qryInstrucaoEmbarqueItemORDEM: TIntegerField
      FieldName = 'ORDEM'
    end
    object qryInstrucaoEmbarqueItemUNIDADE_MEDIDA: TStringField
      FieldName = 'UNIDADE_MEDIDA'
      FixedChar = True
      Size = 50
    end
    object qryInstrucaoEmbarqueItemQT_UNIDADE: TStringField
      FieldName = 'QT_UNIDADE'
      FixedChar = True
      Size = 70
    end
    object qryInstrucaoEmbarqueItemCUBAGEM: TFMTBCDField
      FieldName = 'CUBAGEM'
      DisplayFormat = '##,###0.000'
      Precision = 15
      Size = 3
    end
    object qryInstrucaoEmbarqueItemPESO_BRUTO: TFMTBCDField
      FieldName = 'PESO_BRUTO'
      DisplayFormat = '##,###0.000'
      Precision = 15
      Size = 3
    end
    object qryInstrucaoEmbarqueItemPESO_LIQUIDO: TFMTBCDField
      FieldName = 'PESO_LIQUIDO'
      DisplayFormat = '##,###0.000'
      Precision = 15
      Size = 3
    end
  end
  object dspInstrucaoEmbarqueItem: TDataSetProvider
    DataSet = qryInstrucaoEmbarqueItem
    Left = 172
    Top = 406
  end
  object cdsInstrucaoEmbarqueItem: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspInstrucaoEmbarqueItem'
    Left = 172
    Top = 456
    object cdsInstrucaoEmbarqueItemCD_MERCADORIA: TStringField
      FieldName = 'CD_MERCADORIA'
      Required = True
      FixedChar = True
      Size = 40
    end
    object cdsInstrucaoEmbarqueItemNM_MERCADORIA: TStringField
      FieldName = 'NM_MERCADORIA'
      FixedChar = True
      Size = 241
    end
    object cdsInstrucaoEmbarqueItemVL_QTDE: TFMTBCDField
      FieldName = 'VL_QTDE'
      Required = True
      Precision = 16
      Size = 7
    end
    object cdsInstrucaoEmbarqueItemVL_PRECO_UNIT: TFMTBCDField
      FieldName = 'VL_PRECO_UNIT'
      DisplayFormat = '##,##0.00'
      Precision = 16
      Size = 7
    end
    object cdsInstrucaoEmbarqueItemVL_PRECO_TOT: TFMTBCDField
      FieldName = 'VL_PRECO_TOT'
      DisplayFormat = '##,##0.00'
      Precision = 16
      Size = 7
    end
    object cdsInstrucaoEmbarqueItemORDEM: TIntegerField
      FieldName = 'ORDEM'
    end
    object cdsInstrucaoEmbarqueItemUNIDADE_MEDIDA: TStringField
      FieldName = 'UNIDADE_MEDIDA'
      FixedChar = True
      Size = 50
    end
    object cdsInstrucaoEmbarqueItemQT_UNIDADE: TStringField
      FieldName = 'QT_UNIDADE'
      FixedChar = True
      Size = 70
    end
    object cdsInstrucaoEmbarqueItemCUBAGEM: TFMTBCDField
      FieldName = 'CUBAGEM'
      DisplayFormat = '##,###0.000'
      Precision = 15
      Size = 3
    end
    object cdsInstrucaoEmbarqueItemPESO_BRUTO: TFMTBCDField
      FieldName = 'PESO_BRUTO'
      DisplayFormat = '##,###0.000'
      Precision = 15
      Size = 3
    end
    object cdsInstrucaoEmbarqueItemPESO_LIQUIDO: TFMTBCDField
      FieldName = 'PESO_LIQUIDO'
      DisplayFormat = '##,###0.000'
      Precision = 15
      Size = 3
    end
  end
  object dsInstrucaoEmbarqueItem: TDataSource
    DataSet = cdsInstrucaoEmbarqueItem
    Left = 172
    Top = 510
  end
  object qryPackingList: TSQLQuery
    MaxBlobSize = -1
    Params = <>
    SQLConnection = SQLConnection
    Left = 279
    Top = 350
    object qryPackingListNR_PROCESSO: TStringField
      FieldName = 'NR_PROCESSO'
      Required = True
      FixedChar = True
      Size = 18
    end
    object qryPackingListCONTROLE_NESTLE: TStringField
      DisplayWidth = 20
      FieldName = 'CONTROLE_NESTLE'
      FixedChar = True
    end
    object qryPackingListEXPORT_EMPRESA: TStringField
      FieldName = 'EXPORT_EMPRESA'
      Required = True
      FixedChar = True
      Size = 80
    end
    object qryPackingListEXPORT_CNPJ: TStringField
      FieldName = 'EXPORT_CNPJ'
      FixedChar = True
      Size = 18
    end
    object qryPackingListCONSIG_EMPRESA: TStringField
      FieldName = 'CONSIG_EMPRESA'
      FixedChar = True
      Size = 100
    end
    object qryPackingListDS_PORTO_DESTINO: TStringField
      FieldName = 'DS_PORTO_DESTINO'
      FixedChar = True
      Size = 50
    end
    object qryPackingListNM_EMBARCACAO: TStringField
      FieldName = 'NM_EMBARCACAO'
      FixedChar = True
      Size = 40
    end
    object qryPackingListCONTAINERS: TMemoField
      FieldName = 'CONTAINERS'
      BlobType = ftMemo
      Size = 1
    end
    object qryPackingListMARCA_NM_EMPRESA: TStringField
      FieldName = 'MARCA_NM_EMPRESA'
      FixedChar = True
      Size = 100
    end
    object qryPackingListMARCA_NM_PAIS: TStringField
      FieldName = 'MARCA_NM_PAIS'
      FixedChar = True
      Size = 120
    end
    object qryPackingListMARCA_NM_EMPRESA_NAC: TStringField
      FieldName = 'MARCA_NM_EMPRESA_NAC'
      FixedChar = True
      Size = 80
    end
    object qryPackingListPATH_LOGO: TStringField
      FieldName = 'PATH_LOGO'
      FixedChar = True
      Size = 100
    end
    object qryPackingListNR_CONHECIMENTO: TStringField
      FieldName = 'NR_CONHECIMENTO'
      FixedChar = True
      Size = 30
    end
    object qryPackingListIMPORT_EMPRESA: TStringField
      FieldName = 'IMPORT_EMPRESA'
      FixedChar = True
      Size = 100
    end
    object qryPackingListTRANSPORTADORA: TStringField
      FieldName = 'TRANSPORTADORA'
      Required = True
      FixedChar = True
      Size = 60
    end
    object qryPackingListDT_PREVISAO_CARREGAMENTO: TSQLTimeStampField
      FieldName = 'DT_PREVISAO_CARREGAMENTO'
    end
    object qryPackingListTX_MARCACAO_VOLUME: TStringField
      FieldName = 'TX_MARCACAO_VOLUME'
      FixedChar = True
      Size = 500
    end
    object qryPackingListEXPORT_ENDERECO_2: TStringField
      FieldName = 'EXPORT_ENDERECO_2'
      FixedChar = True
      Size = 400
    end
    object qryPackingListIMPORT_CIDADE_ESTADO_PAIS: TStringField
      FieldName = 'IMPORT_CIDADE_ESTADO_PAIS'
      FixedChar = True
      Size = 400
    end
    object qryPackingListEND_CONSIG_CIDADE_ESTADO_PAIS: TStringField
      FieldName = 'END_CONSIG_CIDADE_ESTADO_PAIS'
      FixedChar = True
      Size = 400
    end
    object qryPackingListTX_MARCACAO_VOLUME_ESP: TStringField
      FieldName = 'TX_MARCACAO_VOLUME_ESP'
      Size = 500
    end
    object qryPackingListCD_SERVICO: TStringField
      FieldName = 'CD_SERVICO'
      Size = 3
    end
    object qryPackingListTX_INF_EMBALAGEM: TStringField
      FieldName = 'TX_INF_EMBALAGEM'
      FixedChar = True
      Size = 800
    end
    object qryPackingListVL_M3: TStringField
      FieldName = 'VL_M3'
      FixedChar = True
      Size = 23
    end
    object qryPackingListREF_CC: TStringField
      FieldName = 'REF_CC'
      Size = 200
    end
    object qryPackingListREF_PEDIDO_CONTAINER: TStringField
      FieldName = 'REF_PEDIDO_CONTAINER'
      Size = 200
    end
    object qryPackingListREF_PEDIDO: TStringField
      DisplayWidth = 400
      FieldName = 'REF_PEDIDO'
      FixedChar = True
      Size = 400
    end
  end
  object dspPackingList: TDataSetProvider
    DataSet = qryPackingList
    Left = 281
    Top = 407
  end
  object cdsPackingList: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspPackingList'
    Left = 279
    Top = 457
    object cdsPackingListNR_PROCESSO: TStringField
      FieldName = 'NR_PROCESSO'
      Required = True
      FixedChar = True
      Size = 18
    end
    object cdsPackingListCONTROLE_NESTLE: TStringField
      FieldName = 'CONTROLE_NESTLE'
      FixedChar = True
      Size = 50
    end
    object cdsPackingListEXPORT_EMPRESA: TStringField
      FieldName = 'EXPORT_EMPRESA'
      Required = True
      FixedChar = True
      Size = 80
    end
    object cdsPackingListEXPORT_CNPJ: TStringField
      FieldName = 'EXPORT_CNPJ'
      FixedChar = True
      Size = 18
    end
    object cdsPackingListIMPORT_EMPRESA: TStringField
      FieldName = 'IMPORT_EMPRESA'
      FixedChar = True
      Size = 100
    end
    object cdsPackingListCONSIG_EMPRESA: TStringField
      FieldName = 'CONSIG_EMPRESA'
      FixedChar = True
      Size = 100
    end
    object cdsPackingListDS_PORTO_DESTINO: TStringField
      FieldName = 'DS_PORTO_DESTINO'
      FixedChar = True
      Size = 50
    end
    object cdsPackingListNM_EMBARCACAO: TStringField
      FieldName = 'NM_EMBARCACAO'
      FixedChar = True
      Size = 40
    end
    object cdsPackingListCONTAINERS: TMemoField
      FieldName = 'CONTAINERS'
      BlobType = ftMemo
      Size = 1
    end
    object cdsPackingListMARCA_NM_EMPRESA: TStringField
      FieldName = 'MARCA_NM_EMPRESA'
      FixedChar = True
      Size = 100
    end
    object cdsPackingListMARCA_NM_PAIS: TStringField
      FieldName = 'MARCA_NM_PAIS'
      FixedChar = True
      Size = 120
    end
    object cdsPackingListMARCA_NM_EMPRESA_NAC: TStringField
      FieldName = 'MARCA_NM_EMPRESA_NAC'
      FixedChar = True
      Size = 80
    end
    object cdsPackingListPATH_LOGO: TStringField
      FieldName = 'PATH_LOGO'
      FixedChar = True
      Size = 100
    end
    object cdsPackingListNR_CONHECIMENTO: TStringField
      FieldName = 'NR_CONHECIMENTO'
      FixedChar = True
      Size = 30
    end
    object cdsPackingListTRANSPORTADORA: TStringField
      FieldName = 'TRANSPORTADORA'
      Required = True
      FixedChar = True
      Size = 60
    end
    object cdsPackingListDT_PREVISAO_CARREGAMENTO: TSQLTimeStampField
      FieldName = 'DT_PREVISAO_CARREGAMENTO'
      DisplayFormat = 'DD/MM/YYYY'
    end
    object cdsPackingListTX_MARCACAO_VOLUME: TStringField
      FieldName = 'TX_MARCACAO_VOLUME'
      FixedChar = True
      Size = 500
    end
    object cdsPackingListEXPORT_ENDERECO_2: TStringField
      FieldName = 'EXPORT_ENDERECO_2'
      FixedChar = True
      Size = 400
    end
    object cdsPackingListIMPORT_CIDADE_ESTADO_PAIS: TStringField
      FieldName = 'IMPORT_CIDADE_ESTADO_PAIS'
      FixedChar = True
      Size = 400
    end
    object cdsPackingListEND_CONSIG_CIDADE_ESTADO_PAIS: TStringField
      FieldName = 'END_CONSIG_CIDADE_ESTADO_PAIS'
      FixedChar = True
      Size = 400
    end
    object cdsPackingListTX_MARCACAO_VOLUME_ESP: TStringField
      FieldName = 'TX_MARCACAO_VOLUME_ESP'
      Size = 500
    end
    object cdsPackingListCD_SERVICO: TStringField
      FieldName = 'CD_SERVICO'
      Size = 3
    end
    object cdsPackingListTX_INF_EMBALAGEM: TStringField
      FieldName = 'TX_INF_EMBALAGEM'
      FixedChar = True
      Size = 800
    end
    object cdsPackingListVL_M3: TStringField
      FieldName = 'VL_M3'
      FixedChar = True
      Size = 23
    end
    object cdsPackingListREF_CC: TStringField
      FieldName = 'REF_CC'
      Size = 200
    end
    object cdsPackingListREF_PEDIDO_CONTAINER: TStringField
      FieldName = 'REF_PEDIDO_CONTAINER'
      Size = 200
    end
    object cdsPackingListREF_PEDIDO: TStringField
      FieldName = 'REF_PEDIDO'
      FixedChar = True
      Size = 400
    end
  end
  object dsPackingList: TDataSource
    DataSet = cdsPackingList
    Left = 279
    Top = 511
  end
  object dsPackingListItem: TDataSource
    DataSet = cdsPackingListItem
    Left = 364
    Top = 511
  end
  object cdsPackingListItem: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspPackingListItem'
    Left = 364
    Top = 459
    object cdsPackingListItemNR_PROCESSO: TStringField
      FieldName = 'NR_PROCESSO'
      Required = True
      FixedChar = True
      Size = 18
    end
    object cdsPackingListItemCONTROLE_NESTLE: TStringField
      FieldName = 'CONTROLE_NESTLE'
      FixedChar = True
      Size = 15
    end
    object cdsPackingListItemCD_MERCADORIA: TStringField
      FieldName = 'CD_MERCADORIA'
      FixedChar = True
      Size = 8000
    end
    object cdsPackingListItemQT_PESO_LIQ: TFMTBCDField
      FieldName = 'QT_PESO_LIQ'
      DisplayFormat = '##,###0.000'
      Precision = 15
      Size = 7
    end
    object cdsPackingListItemQT_PESO_BRUTO: TFMTBCDField
      FieldName = 'QT_PESO_BRUTO'
      DisplayFormat = '##,###0.000'
      Precision = 15
      Size = 7
    end
    object cdsPackingListItemCD_LOTE: TStringField
      FieldName = 'CD_LOTE'
      FixedChar = True
    end
    object cdsPackingListItemTOTAL_VL_TOT_PESO_LIQ: TFMTBCDField
      FieldName = 'TOTAL_VL_TOT_PESO_LIQ'
      Precision = 15
      Size = 7
    end
    object cdsPackingListItemTOTAL_VL_TOT_PESO_BRUTO: TFMTBCDField
      FieldName = 'TOTAL_VL_TOT_PESO_BRUTO'
      Precision = 15
      Size = 7
    end
    object cdsPackingListItemTOTAL_QT_MERCADORIA: TIntegerField
      FieldName = 'TOTAL_QT_MERCADORIA'
    end
    object cdsPackingListItemQT_MERCADORIA: TIntegerField
      FieldName = 'QT_MERCADORIA'
    end
    object cdsPackingListItemDT_VENCIMENTO: TStringField
      FieldName = 'DT_VENCIMENTO'
      FixedChar = True
      Size = 8000
    end
    object cdsPackingListItemDT_FABRICACAO: TStringField
      FieldName = 'DT_FABRICACAO'
      FixedChar = True
      Size = 8000
    end
    object cdsPackingListItemQT_MEDIDA_ING: TStringField
      FieldName = 'QT_MEDIDA_ING'
      FixedChar = True
    end
    object cdsPackingListItemQT_MEDIDA_ESP: TStringField
      FieldName = 'QT_MEDIDA_ESP'
      FixedChar = True
    end
    object cdsPackingListItemTX_MERCADORIA_ESP: TStringField
      FieldName = 'TX_MERCADORIA_ESP'
      FixedChar = True
      Size = 8000
    end
    object cdsPackingListItemTX_MERCADORIA_ING: TStringField
      FieldName = 'TX_MERCADORIA_ING'
      FixedChar = True
      Size = 8000
    end
    object cdsPackingListItemVL_CUBAGEM_TOTAL: TFloatField
      FieldName = 'VL_CUBAGEM_TOTAL'
      DisplayFormat = '##,###0.000'
    end
  end
  object dspPackingListItem: TDataSetProvider
    DataSet = qryPackingListItem
    Left = 363
    Top = 407
  end
  object qryPackingListItem: TSQLQuery
    MaxBlobSize = -1
    Params = <>
    SQLConnection = SQLConnection
    Left = 364
    Top = 350
    object qryPackingListItemNR_PROCESSO: TStringField
      FieldName = 'NR_PROCESSO'
      Required = True
      FixedChar = True
      Size = 18
    end
    object qryPackingListItemCONTROLE_NESTLE: TStringField
      DisplayWidth = 50
      FieldName = 'CONTROLE_NESTLE'
      FixedChar = True
      Size = 50
    end
    object qryPackingListItemCD_MERCADORIA: TStringField
      FieldName = 'CD_MERCADORIA'
      FixedChar = True
      Size = 8000
    end
    object qryPackingListItemQT_PESO_LIQ: TFMTBCDField
      FieldName = 'QT_PESO_LIQ'
      DisplayFormat = '##,###0.000'
      Precision = 15
      Size = 7
    end
    object qryPackingListItemQT_PESO_BRUTO: TFMTBCDField
      FieldName = 'QT_PESO_BRUTO'
      DisplayFormat = '##,###0.000'
      Precision = 15
      Size = 7
    end
    object qryPackingListItemCD_LOTE: TStringField
      FieldName = 'CD_LOTE'
      FixedChar = True
    end
    object qryPackingListItemQT_MERCADORIA: TIntegerField
      FieldName = 'QT_MERCADORIA'
    end
    object qryPackingListItemTOTAL_VL_TOT_PESO_LIQ: TFMTBCDField
      FieldName = 'TOTAL_VL_TOT_PESO_LIQ'
      Precision = 15
      Size = 7
    end
    object qryPackingListItemTOTAL_VL_TOT_PESO_BRUTO: TFMTBCDField
      FieldName = 'TOTAL_VL_TOT_PESO_BRUTO'
      Precision = 15
      Size = 7
    end
    object qryPackingListItemTOTAL_QT_MERCADORIA: TIntegerField
      FieldName = 'TOTAL_QT_MERCADORIA'
    end
    object qryPackingListItemDT_FABRICACAO: TStringField
      FieldName = 'DT_FABRICACAO'
      FixedChar = True
      Size = 8000
    end
    object qryPackingListItemDT_VENCIMENTO: TStringField
      FieldName = 'DT_VENCIMENTO'
      FixedChar = True
      Size = 8000
    end
    object qryPackingListItemQT_MEDIDA_ING: TStringField
      FieldName = 'QT_MEDIDA_ING'
      FixedChar = True
    end
    object qryPackingListItemQT_MEDIDA_ESP: TStringField
      FieldName = 'QT_MEDIDA_ESP'
      FixedChar = True
    end
    object qryPackingListItemTX_MERCADORIA_ESP: TStringField
      FieldName = 'TX_MERCADORIA_ESP'
      FixedChar = True
      Size = 8000
    end
    object qryPackingListItemTX_MERCADORIA_ING: TStringField
      FieldName = 'TX_MERCADORIA_ING'
      FixedChar = True
      Size = 8000
    end
    object qryPackingListItemVL_CUBAGEM_TOTAL: TFloatField
      FieldName = 'VL_CUBAGEM_TOTAL'
    end
  end
  object qryFaturaComercial: TSQLQuery
    MaxBlobSize = -1
    Params = <>
    SQLConnection = SQLConnection
    Left = 466
    Top = 349
    object qryFaturaComercialRESUMO_EMBALAGENS_ESP: TMemoField
      FieldName = 'RESUMO_EMBALAGENS_ESP'
      BlobType = ftMemo
      Size = 1
    end
    object qryFaturaComercialRESUMO_EMBALAGENS_ING: TMemoField
      FieldName = 'RESUMO_EMBALAGENS_ING'
      BlobType = ftMemo
      Size = 1
    end
    object qryFaturaComercialNR_PROCESSO: TStringField
      FieldName = 'NR_PROCESSO'
      Required = True
      FixedChar = True
      Size = 18
    end
    object qryFaturaComercialCD_DUE: TStringField
      FieldName = 'CD_DUE'
      FixedChar = True
      Size = 14
    end
    object qryFaturaComercialCONTROLE_NESTLE: TStringField
      DisplayWidth = 20
      FieldName = 'CONTROLE_NESTLE'
      FixedChar = True
    end
    object qryFaturaComercialDS_PORTO_EMBARQUE: TStringField
      FieldName = 'DS_PORTO_EMBARQUE'
      FixedChar = True
      Size = 53
    end
    object qryFaturaComercialDS_PORTO_DESTINO: TStringField
      FieldName = 'DS_PORTO_DESTINO'
      FixedChar = True
      Size = 50
    end
    object qryFaturaComercialMARCA_NM_EMPRESA: TStringField
      FieldName = 'MARCA_NM_EMPRESA'
      FixedChar = True
      Size = 100
    end
    object qryFaturaComercialMARCA_NM_PAIS: TStringField
      FieldName = 'MARCA_NM_PAIS'
      FixedChar = True
      Size = 120
    end
    object qryFaturaComercialMARCA_NM_EMPRESA_NAC: TStringField
      FieldName = 'MARCA_NM_EMPRESA_NAC'
      FixedChar = True
      Size = 80
    end
    object qryFaturaComercialPATH_LOGO: TStringField
      FieldName = 'PATH_LOGO'
      FixedChar = True
      Size = 100
    end
    object qryFaturaComercialCD_INCOTERM: TStringField
      FieldName = 'CD_INCOTERM'
      FixedChar = True
      Size = 3
    end
    object qryFaturaComercialNM_PROCESSO_SAP_TODOS: TMemoField
      FieldName = 'NM_PROCESSO_SAP_TODOS'
      BlobType = ftMemo
      Size = 1
    end
    object qryFaturaComercialNM_PROCESSO_SAP_PRIMEIRO: TStringField
      FieldName = 'NM_PROCESSO_SAP_PRIMEIRO'
      FixedChar = True
      Size = 15
    end
    object qryFaturaComercialNR_ORDER: TMemoField
      FieldName = 'NR_ORDER'
      BlobType = ftMemo
      Size = 1
    end
    object qryFaturaComercialNR_CONHECIMENTO: TStringField
      FieldName = 'NR_CONHECIMENTO'
      FixedChar = True
      Size = 30
    end
    object qryFaturaComercialDT_CONHECIMENTO: TSQLTimeStampField
      FieldName = 'DT_CONHECIMENTO'
    end
    object qryFaturaComercialNM_TERMO_PAGTO: TStringField
      FieldName = 'NM_TERMO_PAGTO'
      FixedChar = True
      Size = 100
    end
    object qryFaturaComercialNM_TERMO_PAGTO_ESP: TStringField
      FieldName = 'NM_TERMO_PAGTO_ESP'
      FixedChar = True
      Size = 100
    end
    object qryFaturaComercialNR_PERIODICIDADE: TIntegerField
      FieldName = 'NR_PERIODICIDADE'
    end
    object qryFaturaComercialNM_VIA_TRANSPORTE: TStringField
      FieldName = 'NM_VIA_TRANSPORTE'
      FixedChar = True
    end
    object qryFaturaComercialTX_DECL_ADIC_INST_EMB: TStringField
      FieldName = 'TX_DECL_ADIC_INST_EMB'
      FixedChar = True
      Size = 300
    end
    object qryFaturaComercialTRANSPORTADORA: TStringField
      FieldName = 'TRANSPORTADORA'
      Required = True
      FixedChar = True
      Size = 60
    end
    object qryFaturaComercialCIDADE_DATA_ESPANHOL: TStringField
      FieldName = 'CIDADE_DATA_ESPANHOL'
      Size = 131
    end
    object qryFaturaComercialCIDADE_DATA_INGLES: TStringField
      FieldName = 'CIDADE_DATA_INGLES'
      Size = 70
    end
    object qryFaturaComercialNM_EMBARCACAO: TStringField
      FieldName = 'NM_EMBARCACAO'
      FixedChar = True
      Size = 40
    end
    object qryFaturaComercialPAIS_ORIGEM: TStringField
      FieldName = 'PAIS_ORIGEM'
      Required = True
      FixedChar = True
      Size = 500
    end
    object qryFaturaComercialTX_MARCACAO_VOLUME: TStringField
      FieldName = 'TX_MARCACAO_VOLUME'
      FixedChar = True
      Size = 500
    end
    object qryFaturaComercialEXPORT_EMPRESA: TStringField
      FieldName = 'EXPORT_EMPRESA'
      FixedChar = True
      Size = 80
    end
    object qryFaturaComercialEXPORT_END_1: TStringField
      FieldName = 'EXPORT_END_1'
      FixedChar = True
      Size = 108
    end
    object qryFaturaComercialEXPORT_END_2: TStringField
      FieldName = 'EXPORT_END_2'
      FixedChar = True
      Size = 120
    end
    object qryFaturaComercialEXPORT_CNPJ: TStringField
      FieldName = 'EXPORT_CNPJ'
      FixedChar = True
      Size = 18
    end
    object qryFaturaComercialEXPORT_CIDADE: TStringField
      FieldName = 'EXPORT_CIDADE'
      Required = True
      FixedChar = True
      Size = 30
    end
    object qryFaturaComercialIMPORT_EMPRESA: TStringField
      FieldName = 'IMPORT_EMPRESA'
      FixedChar = True
      Size = 100
    end
    object qryFaturaComercialIMPORT_CIDADE_ESTADO_PAIS: TStringField
      DisplayWidth = 500
      FieldName = 'IMPORT_CIDADE_ESTADO_PAIS'
      FixedChar = True
      Size = 500
    end
    object qryFaturaComercialCONSIG_EMPRESA: TStringField
      FieldName = 'CONSIG_EMPRESA'
      FixedChar = True
      Size = 100
    end
    object qryFaturaComercialEND_CONSIG_CIDADE_ESTADO_PAIS: TStringField
      DisplayWidth = 500
      FieldName = 'END_CONSIG_CIDADE_ESTADO_PAIS'
      FixedChar = True
      Size = 500
    end
    object qryFaturaComercialLOCAL_INCOTERM: TStringField
      FieldName = 'LOCAL_INCOTERM'
      FixedChar = True
      Size = 50
    end
    object qryFaturaComercialTX_INF_EMBALAGEM: TMemoField
      FieldName = 'TX_INF_EMBALAGEM'
      BlobType = ftMemo
      Size = 1
    end
    object qryFaturaComercialNR_CNTR: TStringField
      FieldName = 'NR_CNTR'
      FixedChar = True
    end
    object qryFaturaComercialVL_PESO_LIQUIDO: TFloatField
      FieldName = 'VL_PESO_LIQUIDO'
    end
    object qryFaturaComercialVL_PESO_BRUTO: TFloatField
      FieldName = 'VL_PESO_BRUTO'
    end
    object qryFaturaComercialVL_M3: TFloatField
      FieldName = 'VL_M3'
    end
    object qryFaturaComercialVL_MLE_MNEG: TFloatField
      FieldName = 'VL_MLE_MNEG'
    end
    object qryFaturaComercialVL_TOT_DESPESA: TFloatField
      FieldName = 'VL_TOT_DESPESA'
    end
    object qryFaturaComercialVL_TOT_MCV: TFloatField
      FieldName = 'VL_TOT_MCV'
    end
    object qryFaturaComercialVL_FRETE_PREPAID_MNEG: TFMTBCDField
      FieldName = 'VL_FRETE_PREPAID_MNEG'
      Precision = 15
      Size = 2
    end
    object qryFaturaComercialVL_SEGURO: TFMTBCDField
      FieldName = 'VL_SEGURO'
      Precision = 15
      Size = 2
    end
    object qryFaturaComercialCD_RUC: TStringField
      FieldName = 'CD_RUC'
      FixedChar = True
      Size = 35
    end
    object qryFaturaComercialREF_PEDIDO: TStringField
      FieldName = 'REF_PEDIDO'
      FixedChar = True
      Size = 300
    end
    object qryFaturaComercialTX_MARCACAO_VOLUME_ESP: TStringField
      FieldName = 'TX_MARCACAO_VOLUME_ESP'
      Size = 500
    end
    object qryFaturaComercialCD_SERVICO: TStringField
      FieldName = 'CD_SERVICO'
      Size = 3
    end
    object qryFaturaComercialREF_CC: TStringField
      FieldName = 'REF_CC'
      Size = 200
    end
    object qryFaturaComercialMOEDA: TStringField
      FieldName = 'MOEDA'
      Size = 6
    end
  end
  object dspFaturaComercial: TDataSetProvider
    DataSet = qryFaturaComercial
    Left = 466
    Top = 406
  end
  object cdsFaturaComercial: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspFaturaComercial'
    Left = 467
    Top = 459
    object cdsFaturaComercialNR_PROCESSO: TStringField
      FieldName = 'NR_PROCESSO'
      Required = True
      FixedChar = True
      Size = 18
    end
    object cdsFaturaComercialCONTROLE_NESTLE: TStringField
      DisplayWidth = 20
      FieldName = 'CONTROLE_NESTLE'
      FixedChar = True
    end
    object cdsFaturaComercialDS_PORTO_EMBARQUE: TStringField
      FieldName = 'DS_PORTO_EMBARQUE'
      FixedChar = True
      Size = 53
    end
    object cdsFaturaComercialDS_PORTO_DESTINO: TStringField
      FieldName = 'DS_PORTO_DESTINO'
      FixedChar = True
      Size = 50
    end
    object cdsFaturaComercialMARCA_NM_EMPRESA: TStringField
      FieldName = 'MARCA_NM_EMPRESA'
      FixedChar = True
      Size = 100
    end
    object cdsFaturaComercialMARCA_NM_PAIS: TStringField
      FieldName = 'MARCA_NM_PAIS'
      FixedChar = True
      Size = 120
    end
    object cdsFaturaComercialMARCA_NM_EMPRESA_NAC: TStringField
      FieldName = 'MARCA_NM_EMPRESA_NAC'
      FixedChar = True
      Size = 80
    end
    object cdsFaturaComercialPATH_LOGO: TStringField
      FieldName = 'PATH_LOGO'
      FixedChar = True
      Size = 100
    end
    object cdsFaturaComercialCD_INCOTERM: TStringField
      FieldName = 'CD_INCOTERM'
      FixedChar = True
      Size = 3
    end
    object cdsFaturaComercialNR_ORDER: TMemoField
      FieldName = 'NR_ORDER'
      BlobType = ftMemo
      Size = 1
    end
    object cdsFaturaComercialNR_CONHECIMENTO: TStringField
      FieldName = 'NR_CONHECIMENTO'
      FixedChar = True
      Size = 30
    end
    object cdsFaturaComercialNM_TERMO_PAGTO: TStringField
      FieldName = 'NM_TERMO_PAGTO'
      FixedChar = True
      Size = 100
    end
    object cdsFaturaComercialNR_PERIODICIDADE: TIntegerField
      FieldName = 'NR_PERIODICIDADE'
    end
    object cdsFaturaComercialNM_VIA_TRANSPORTE: TStringField
      FieldName = 'NM_VIA_TRANSPORTE'
      FixedChar = True
    end
    object cdsFaturaComercialTRANSPORTADORA: TStringField
      FieldName = 'TRANSPORTADORA'
      Required = True
      FixedChar = True
      Size = 77
    end
    object cdsFaturaComercialDT_CONHECIMENTO: TSQLTimeStampField
      FieldName = 'DT_CONHECIMENTO'
    end
    object cdsFaturaComercialCIDADE_DATA_INGLES: TStringField
      FieldName = 'CIDADE_DATA_INGLES'
      Size = 131
    end
    object cdsFaturaComercialCIDADE_DATA_ESPANHOL: TStringField
      FieldName = 'CIDADE_DATA_ESPANHOL'
      Size = 70
    end
    object cdsFaturaComercialNM_PROCESSO_SAP_TODOS: TMemoField
      FieldName = 'NM_PROCESSO_SAP_TODOS'
      BlobType = ftMemo
      Size = 1
    end
    object cdsFaturaComercialNM_PROCESSO_SAP_PRIMEIRO: TStringField
      FieldName = 'NM_PROCESSO_SAP_PRIMEIRO'
      FixedChar = True
      Size = 15
    end
    object cdsFaturaComercialTX_DECL_ADIC_INST_EMB: TStringField
      FieldName = 'TX_DECL_ADIC_INST_EMB'
      FixedChar = True
      Size = 300
    end
    object cdsFaturaComercialNM_TERMO_PAGTO_ESP: TStringField
      FieldName = 'NM_TERMO_PAGTO_ESP'
      Size = 100
    end
    object cdsFaturaComercialNM_EMBARCACAO: TStringField
      FieldName = 'NM_EMBARCACAO'
      FixedChar = True
      Size = 40
    end
    object cdsFaturaComercialEXPORT_END_1: TStringField
      FieldName = 'EXPORT_END_1'
      FixedChar = True
      Size = 200
    end
    object cdsFaturaComercialEXPORT_END_2: TStringField
      FieldName = 'EXPORT_END_2'
      FixedChar = True
      Size = 200
    end
    object cdsFaturaComercialCD_DUE: TStringField
      FieldName = 'CD_DUE'
      Size = 14
    end
    object cdsFaturaComercialPAIS_ORIGEM: TStringField
      FieldName = 'PAIS_ORIGEM'
      Size = 120
    end
    object cdsFaturaComercialRESUMO_EMBALAGENS_ESP: TMemoField
      FieldName = 'RESUMO_EMBALAGENS_ESP'
      BlobType = ftMemo
      Size = 1
    end
    object cdsFaturaComercialRESUMO_EMBALAGENS_ING: TMemoField
      FieldName = 'RESUMO_EMBALAGENS_ING'
      BlobType = ftMemo
      Size = 1
    end
    object cdsFaturaComercialTX_MARCACAO_VOLUME: TStringField
      FieldName = 'TX_MARCACAO_VOLUME'
      FixedChar = True
      Size = 500
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
    object cdsFaturaComercialEXPORT_CIDADE: TStringField
      FieldName = 'EXPORT_CIDADE'
      Required = True
      FixedChar = True
      Size = 30
    end
    object cdsFaturaComercialIMPORT_EMPRESA: TStringField
      FieldName = 'IMPORT_EMPRESA'
      FixedChar = True
      Size = 100
    end
    object cdsFaturaComercialIMPORT_CIDADE_ESTADO_PAIS: TStringField
      DisplayWidth = 500
      FieldName = 'IMPORT_CIDADE_ESTADO_PAIS'
      FixedChar = True
      Size = 500
    end
    object cdsFaturaComercialCONSIG_EMPRESA: TStringField
      FieldName = 'CONSIG_EMPRESA'
      FixedChar = True
      Size = 100
    end
    object cdsFaturaComercialEND_CONSIG_CIDADE_ESTADO_PAIS: TStringField
      DisplayWidth = 500
      FieldName = 'END_CONSIG_CIDADE_ESTADO_PAIS'
      FixedChar = True
      Size = 500
    end
    object cdsFaturaComercialLOCAL_INCOTERM: TStringField
      FieldName = 'LOCAL_INCOTERM'
      FixedChar = True
      Size = 50
    end
    object cdsFaturaComercialTX_INF_EMBALAGEM: TMemoField
      FieldName = 'TX_INF_EMBALAGEM'
      BlobType = ftMemo
      Size = 1
    end
    object cdsFaturaComercialNR_CNTR: TStringField
      FieldName = 'NR_CNTR'
      FixedChar = True
    end
    object cdsFaturaComercialVL_PESO_LIQUIDO: TFloatField
      FieldName = 'VL_PESO_LIQUIDO'
      DisplayFormat = '##,###0.000'
    end
    object cdsFaturaComercialVL_PESO_BRUTO: TFloatField
      FieldName = 'VL_PESO_BRUTO'
      DisplayFormat = '##,###0.000'
    end
    object cdsFaturaComercialVL_M3: TFloatField
      FieldName = 'VL_M3'
      DisplayFormat = '##,###0.000'
    end
    object cdsFaturaComercialVL_MLE_MNEG: TFloatField
      FieldName = 'VL_MLE_MNEG'
      DisplayFormat = '##,##0.00'
    end
    object cdsFaturaComercialVL_TOT_DESPESA: TFloatField
      FieldName = 'VL_TOT_DESPESA'
      DisplayFormat = '##,##0.00'
    end
    object cdsFaturaComercialVL_TOT_MCV: TFloatField
      FieldName = 'VL_TOT_MCV'
      DisplayFormat = '##,##0.00'
    end
    object cdsFaturaComercialVL_FRETE_PREPAID_MNEG: TFMTBCDField
      FieldName = 'VL_FRETE_PREPAID_MNEG'
      DisplayFormat = '##,##0.00'
      Precision = 15
      Size = 2
    end
    object cdsFaturaComercialVL_SEGURO: TFMTBCDField
      FieldName = 'VL_SEGURO'
      DisplayFormat = '##,##0.00'
      Precision = 15
      Size = 2
    end
    object cdsFaturaComercialCD_RUC: TStringField
      FieldName = 'CD_RUC'
      FixedChar = True
      Size = 35
    end
    object cdsFaturaComercialREF_PEDIDO: TStringField
      FieldName = 'REF_PEDIDO'
      FixedChar = True
      Size = 300
    end
    object cdsFaturaComercialTX_MARCACAO_VOLUME_ESP: TStringField
      FieldName = 'TX_MARCACAO_VOLUME_ESP'
      Size = 500
    end
    object cdsFaturaComercialCD_SERVICO: TStringField
      FieldName = 'CD_SERVICO'
      Size = 3
    end
    object cdsFaturaComercialREF_CC: TStringField
      FieldName = 'REF_CC'
      Size = 200
    end
    object cdsFaturaComercialMOEDA: TStringField
      FieldName = 'MOEDA'
      Size = 6
    end
  end
  object dsFaturaComercial: TDataSource
    DataSet = cdsFaturaComercial
    Left = 466
    Top = 514
  end
  object qryFaturaComercialItem: TSQLQuery
    MaxBlobSize = -1
    Params = <>
    SQLConnection = SQLConnection
    Left = 571
    Top = 349
    object qryFaturaComercialItemNR_PEDIDO_IMP: TStringField
      FieldName = 'NR_PEDIDO_IMP'
      FixedChar = True
      Size = 15
    end
    object qryFaturaComercialItemQT_MERCADORIA: TFloatField
      FieldName = 'QT_MERCADORIA'
    end
    object qryFaturaComercialItemNR_ORDER: TStringField
      FieldName = 'NR_ORDER'
      FixedChar = True
      Size = 30
    end
    object qryFaturaComercialItemVL_UNITARIO: TFloatField
      FieldName = 'VL_UNITARIO'
    end
    object qryFaturaComercialItemVL_TOT_ITEM: TFloatField
      FieldName = 'VL_TOT_ITEM'
    end
    object qryFaturaComercialItemNM_UNID_MEDIDA_ING: TStringField
      FieldName = 'NM_UNID_MEDIDA_ING'
      FixedChar = True
      Size = 50
    end
    object qryFaturaComercialItemNM_UNID_MEDIDA_ESP: TStringField
      FieldName = 'NM_UNID_MEDIDA_ESP'
      FixedChar = True
      Size = 50
    end
    object qryFaturaComercialItemCD_MERCADORIA: TStringField
      FieldName = 'CD_MERCADORIA'
      FixedChar = True
      Size = 40
    end
    object qryFaturaComercialItemCD_NCM_SH: TStringField
      FieldName = 'CD_NCM_SH'
      FixedChar = True
      Size = 11
    end
    object qryFaturaComercialItemTX_MERCADORIA_ESPANHOL: TStringField
      DisplayWidth = 2000
      FieldName = 'TX_MERCADORIA_ESPANHOL'
      FixedChar = True
      Size = 2000
    end
    object qryFaturaComercialItemTX_MERCADORIA_INGLES: TStringField
      DisplayWidth = 2000
      FieldName = 'TX_MERCADORIA_INGLES'
      FixedChar = True
      Size = 2000
    end
    object qryFaturaComercialItemNR_PROCESSO: TStringField
      FieldName = 'NR_PROCESSO'
      Size = 18
    end
    object qryFaturaComercialItemTIPO: TStringField
      FieldName = 'TIPO'
      Size = 4
    end
  end
  object dspFaturaComercialItem: TDataSetProvider
    DataSet = qryFaturaComercialItem
    Left = 571
    Top = 406
  end
  object cdsFaturaComercialItem: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspFaturaComercialItem'
    Left = 574
    Top = 460
    object cdsFaturaComercialItemNR_PEDIDO_IMP: TStringField
      FieldName = 'NR_PEDIDO_IMP'
      FixedChar = True
      Size = 15
    end
    object cdsFaturaComercialItemCD_NCM_SH: TStringField
      FieldName = 'CD_NCM_SH'
      FixedChar = True
      Size = 11
    end
    object cdsFaturaComercialItemNM_UNID_MEDIDA_ING: TStringField
      FieldName = 'NM_UNID_MEDIDA_ING'
      FixedChar = True
      Size = 50
    end
    object cdsFaturaComercialItemQT_MERCADORIA: TFloatField
      FieldName = 'QT_MERCADORIA'
    end
    object cdsFaturaComercialItemNR_ORDER: TStringField
      FieldName = 'NR_ORDER'
      FixedChar = True
      Size = 30
    end
    object cdsFaturaComercialItemVL_UNITARIO: TFloatField
      FieldName = 'VL_UNITARIO'
      DisplayFormat = '#,0.000000'
    end
    object cdsFaturaComercialItemVL_TOT_ITEM: TFloatField
      FieldName = 'VL_TOT_ITEM'
      DisplayFormat = '#,0.00'
    end
    object cdsFaturaComercialItemNM_UNID_MEDIDA_ESP: TStringField
      FieldName = 'NM_UNID_MEDIDA_ESP'
      FixedChar = True
      Size = 50
    end
    object cdsFaturaComercialItemCD_MERCADORIA: TStringField
      FieldName = 'CD_MERCADORIA'
      FixedChar = True
      Size = 40
    end
    object cdsFaturaComercialItemTX_MERCADORIA_ESPANHOL: TStringField
      DisplayWidth = 600
      FieldName = 'TX_MERCADORIA_ESPANHOL'
      FixedChar = True
      Size = 600
    end
    object cdsFaturaComercialItemTX_MERCADORIA_INGLES: TStringField
      DisplayWidth = 600
      FieldName = 'TX_MERCADORIA_INGLES'
      FixedChar = True
      Size = 600
    end
    object cdsFaturaComercialItemNR_PROCESSO: TStringField
      FieldName = 'NR_PROCESSO'
      Size = 18
    end
    object cdsFaturaComercialItemTIPO: TStringField
      FieldName = 'TIPO'
      Size = 4
    end
  end
  object dsFaturaComercialItem: TDataSource
    DataSet = cdsFaturaComercialItem
    Left = 571
    Top = 514
  end
  object qryShippingInstructions: TSQLQuery
    MaxBlobSize = -1
    Params = <>
    SQLConnection = SQLConnection
    Left = 688
    Top = 349
    object qryShippingInstructionsEXPO_NM_EMPRESA: TStringField
      FieldName = 'EXPO_NM_EMPRESA'
      FixedChar = True
      Size = 100
    end
    object qryShippingInstructionsEXPO_ENDERECO: TStringField
      FieldName = 'EXPO_ENDERECO'
      Required = True
      FixedChar = True
      Size = 107
    end
    object qryShippingInstructionsEXPO_END_CIDADE: TStringField
      FieldName = 'EXPO_END_CIDADE'
      FixedChar = True
      Size = 30
    end
    object qryShippingInstructionsEXPO_NM_PAIS: TStringField
      FieldName = 'EXPO_NM_PAIS'
      FixedChar = True
      Size = 120
    end
    object qryShippingInstructionsPATH_LOGO: TStringField
      FieldName = 'PATH_LOGO'
      FixedChar = True
      Size = 100
    end
    object qryShippingInstructionsCD_REFERENCIA: TStringField
      FieldName = 'CD_REFERENCIA'
      Required = True
      FixedChar = True
      Size = 30
    end
    object qryShippingInstructionsIMPORT_NM_EMPRESA: TStringField
      FieldName = 'IMPORT_NM_EMPRESA'
      FixedChar = True
      Size = 80
    end
    object qryShippingInstructionsIMPORT_ENDERECO_1: TStringField
      FieldName = 'IMPORT_ENDERECO_1'
      Required = True
      FixedChar = True
      Size = 58
    end
    object qryShippingInstructionsIMPORT_ENDERECO_2: TStringField
      FieldName = 'IMPORT_ENDERECO_2'
      Required = True
      FixedChar = True
      Size = 44
    end
    object qryShippingInstructionsIMPORT_CNPJ: TStringField
      FieldName = 'IMPORT_CNPJ'
      FixedChar = True
      Size = 24
    end
    object qryShippingInstructionsFABRICANTE_NM_EMPRESA: TStringField
      FieldName = 'FABRICANTE_NM_EMPRESA'
      FixedChar = True
      Size = 100
    end
    object qryShippingInstructionsFABRICANTE_END_1: TStringField
      FieldName = 'FABRICANTE_END_1'
      Required = True
      FixedChar = True
      Size = 107
    end
    object qryShippingInstructionsFABRICANTE_END_2: TStringField
      FieldName = 'FABRICANTE_END_2'
      Required = True
      FixedChar = True
      Size = 153
    end
    object qryShippingInstructionsNR_PROCESSO: TStringField
      FieldName = 'NR_PROCESSO'
      Required = True
      FixedChar = True
      Size = 18
    end
    object qryShippingInstructionsDS_PAIS_ORIGEM: TStringField
      FieldName = 'DS_PAIS_ORIGEM'
      FixedChar = True
      Size = 50
    end
    object qryShippingInstructionsDS_PORTO_DESTINO: TStringField
      FieldName = 'DS_PORTO_DESTINO'
      FixedChar = True
      Size = 50
    end
    object qryShippingInstructionsNM_VIA_TRANSP_INGLES: TStringField
      FieldName = 'NM_VIA_TRANSP_INGLES'
      FixedChar = True
    end
    object qryShippingInstructionsDT_EMBARQUE: TSQLTimeStampField
      FieldName = 'DT_EMBARQUE'
    end
    object qryShippingInstructionsINCOTERM: TStringField
      FieldName = 'INCOTERM'
      FixedChar = True
      Size = 3
    end
    object qryShippingInstructionsTX_OBSERVACAO: TMemoField
      FieldName = 'TX_OBSERVACAO'
      BlobType = ftMemo
      Size = 1
    end
    object qryShippingInstructionsDATA_ATUAL: TStringField
      FieldName = 'DATA_ATUAL'
      Size = 39
    end
    object qryShippingInstructionsDS_SHIPOWNER: TStringField
      FieldName = 'DS_SHIPOWNER'
      Required = True
      FixedChar = True
      Size = 100
    end
    object qryShippingInstructionsNR_PROCESSO_FORMATADO: TStringField
      FieldName = 'NR_PROCESSO_FORMATADO'
      FixedChar = True
      Size = 14
    end
  end
  object dspShippingInstructions: TDataSetProvider
    DataSet = qryShippingInstructions
    Left = 688
    Top = 405
  end
  object cdsShippingInstructions: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspShippingInstructions'
    Left = 688
    Top = 459
    object cdsShippingInstructionsEXPO_NM_EMPRESA: TStringField
      FieldName = 'EXPO_NM_EMPRESA'
      FixedChar = True
      Size = 100
    end
    object cdsShippingInstructionsEXPO_ENDERECO: TStringField
      FieldName = 'EXPO_ENDERECO'
      Required = True
      FixedChar = True
      Size = 107
    end
    object cdsShippingInstructionsEXPO_END_CIDADE: TStringField
      FieldName = 'EXPO_END_CIDADE'
      FixedChar = True
      Size = 30
    end
    object cdsShippingInstructionsEXPO_NM_PAIS: TStringField
      FieldName = 'EXPO_NM_PAIS'
      FixedChar = True
      Size = 120
    end
    object cdsShippingInstructionsPATH_LOGO: TStringField
      FieldName = 'PATH_LOGO'
      FixedChar = True
      Size = 100
    end
    object cdsShippingInstructionsCD_REFERENCIA: TStringField
      FieldName = 'CD_REFERENCIA'
      Required = True
      FixedChar = True
      Size = 30
    end
    object cdsShippingInstructionsIMPORT_NM_EMPRESA: TStringField
      FieldName = 'IMPORT_NM_EMPRESA'
      FixedChar = True
      Size = 80
    end
    object cdsShippingInstructionsIMPORT_ENDERECO_1: TStringField
      FieldName = 'IMPORT_ENDERECO_1'
      Required = True
      FixedChar = True
      Size = 58
    end
    object cdsShippingInstructionsIMPORT_ENDERECO_2: TStringField
      FieldName = 'IMPORT_ENDERECO_2'
      Required = True
      FixedChar = True
      Size = 44
    end
    object cdsShippingInstructionsIMPORT_CNPJ: TStringField
      FieldName = 'IMPORT_CNPJ'
      FixedChar = True
      Size = 24
    end
    object cdsShippingInstructionsFABRICANTE_NM_EMPRESA: TStringField
      FieldName = 'FABRICANTE_NM_EMPRESA'
      FixedChar = True
      Size = 100
    end
    object cdsShippingInstructionsFABRICANTE_END_1: TStringField
      FieldName = 'FABRICANTE_END_1'
      Required = True
      FixedChar = True
      Size = 107
    end
    object cdsShippingInstructionsFABRICANTE_END_2: TStringField
      FieldName = 'FABRICANTE_END_2'
      Required = True
      FixedChar = True
      Size = 153
    end
    object cdsShippingInstructionsNR_PROCESSO: TStringField
      FieldName = 'NR_PROCESSO'
      Required = True
      FixedChar = True
      Size = 18
    end
    object cdsShippingInstructionsDS_PAIS_ORIGEM: TStringField
      FieldName = 'DS_PAIS_ORIGEM'
      FixedChar = True
      Size = 50
    end
    object cdsShippingInstructionsDS_PORTO_DESTINO: TStringField
      FieldName = 'DS_PORTO_DESTINO'
      FixedChar = True
      Size = 50
    end
    object cdsShippingInstructionsNM_VIA_TRANSP_INGLES: TStringField
      FieldName = 'NM_VIA_TRANSP_INGLES'
      FixedChar = True
    end
    object cdsShippingInstructionsDT_EMBARQUE: TSQLTimeStampField
      FieldName = 'DT_EMBARQUE'
    end
    object cdsShippingInstructionsINCOTERM: TStringField
      FieldName = 'INCOTERM'
      FixedChar = True
      Size = 3
    end
    object cdsShippingInstructionsTX_OBSERVACAO: TMemoField
      FieldName = 'TX_OBSERVACAO'
      BlobType = ftMemo
      Size = 1
    end
    object cdsShippingInstructionsDATA_ATUAL: TStringField
      FieldName = 'DATA_ATUAL'
      Size = 39
    end
    object cdsShippingInstructionsDS_SHIPOWNER: TStringField
      FieldName = 'DS_SHIPOWNER'
      Required = True
      FixedChar = True
      Size = 100
    end
    object cdsShippingInstructionsNR_PROCESSO_FORMATADO: TStringField
      FieldName = 'NR_PROCESSO_FORMATADO'
      FixedChar = True
      Size = 14
    end
  end
  object dsShippingInstructions: TDataSource
    DataSet = cdsShippingInstructions
    Left = 688
    Top = 513
  end
  object qryShippingInstructionsItem: TSQLQuery
    MaxBlobSize = -1
    Params = <>
    SQLConnection = SQLConnection
    Left = 817
    Top = 348
    object qryShippingInstructionsItemNR_PROCESSO: TStringField
      FieldName = 'NR_PROCESSO'
      Required = True
      FixedChar = True
      Size = 18
    end
    object qryShippingInstructionsItemORDEM: TFMTBCDField
      FieldName = 'ORDEM'
      Precision = 19
      Size = 0
    end
    object qryShippingInstructionsItemQT_INICIAL: TFloatField
      FieldName = 'QT_INICIAL'
    end
    object qryShippingInstructionsItemUN_MEDIDA: TStringField
      FieldName = 'UN_MEDIDA'
      FixedChar = True
      Size = 3
    end
    object qryShippingInstructionsItemMERCADORIA: TStringField
      FieldName = 'MERCADORIA'
      Required = True
      FixedChar = True
      Size = 81
    end
    object qryShippingInstructionsItemVL_UNITARIO: TFloatField
      FieldName = 'VL_UNITARIO'
    end
    object qryShippingInstructionsItemVL_TOTAL: TFloatField
      FieldName = 'VL_TOTAL'
    end
    object qryShippingInstructionsItemAP_MOEDA: TStringField
      FieldName = 'AP_MOEDA'
      FixedChar = True
      Size = 6
    end
  end
  object dspShippingInstructionsItem: TDataSetProvider
    DataSet = qryShippingInstructionsItem
    Left = 817
    Top = 404
  end
  object cdsShippingInstructionsItem: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspShippingInstructionsItem'
    Left = 817
    Top = 459
    object cdsShippingInstructionsItemNR_PROCESSO: TStringField
      FieldName = 'NR_PROCESSO'
      Required = True
      FixedChar = True
      Size = 18
    end
    object cdsShippingInstructionsItemORDEM: TFMTBCDField
      FieldName = 'ORDEM'
      Precision = 19
      Size = 0
    end
    object cdsShippingInstructionsItemQT_INICIAL: TFloatField
      FieldName = 'QT_INICIAL'
      DisplayFormat = '##,##0.00'
    end
    object cdsShippingInstructionsItemUN_MEDIDA: TStringField
      FieldName = 'UN_MEDIDA'
      FixedChar = True
      Size = 3
    end
    object cdsShippingInstructionsItemMERCADORIA: TStringField
      FieldName = 'MERCADORIA'
      Required = True
      FixedChar = True
      Size = 81
    end
    object cdsShippingInstructionsItemVL_UNITARIO: TFloatField
      FieldName = 'VL_UNITARIO'
      DisplayFormat = '##,##0.00'
    end
    object cdsShippingInstructionsItemVL_TOTAL: TFloatField
      FieldName = 'VL_TOTAL'
      DisplayFormat = '##,##0.00'
    end
    object cdsShippingInstructionsItemAP_MOEDA: TStringField
      FieldName = 'AP_MOEDA'
      FixedChar = True
      Size = 6
    end
  end
  object dsShippingInstructionsItem: TDataSource
    DataSet = cdsShippingInstructionsItem
    Left = 817
    Top = 513
  end
  object qryEmails: TSQLQuery
    MaxBlobSize = -1
    Params = <>
    SQLConnection = SQLConnection
    Left = 919
    Top = 6
    object qryEmailsEMAILS: TStringField
      DisplayWidth = 700
      FieldName = 'EMAILS'
      FixedChar = True
      Size = 700
    end
    object qryEmailsASSUNTO: TStringField
      FieldName = 'ASSUNTO'
      FixedChar = True
      Size = 100
    end
    object qryEmailsCORPO_EMAIL: TMemoField
      FieldName = 'CORPO_EMAIL'
      BlobType = ftMemo
    end
  end
  object qryRapsImpressao: TSQLQuery
    MaxBlobSize = -1
    Params = <>
    SQLConnection = SQLConnection
    Left = 880
    Top = 133
    object qryRapsImpressaoCD_RAP: TStringField
      FieldName = 'CD_RAP'
      Required = True
      FixedChar = True
      Size = 6
    end
    object qryRapsImpressaoCD_RAP_ANO: TStringField
      FieldName = 'CD_RAP_ANO'
      Required = True
      FixedChar = True
      Size = 2
    end
    object qryRapsImpressaoDT_INSERCAO: TSQLTimeStampField
      FieldName = 'DT_INSERCAO'
    end
    object qryRapsImpressaoNR_FORNECIMENTO: TStringField
      FieldName = 'NR_FORNECIMENTO'
      FixedChar = True
      Size = 310
    end
  end
  object dsRapsImpressao: TDataSource
    DataSet = cdsRapsImpressao
    Left = 876
    Top = 283
  end
  object cdsRapsImpressao: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspRapsImpressao'
    Left = 876
    Top = 236
    object cdsRapsImpressaoCD_RAP: TStringField
      FieldName = 'CD_RAP'
      FixedChar = True
      Size = 6
    end
    object cdsRapsImpressaoCD_RAP_ANO: TStringField
      FieldName = 'CD_RAP_ANO'
      FixedChar = True
      Size = 2
    end
    object cdsRapsImpressaoDT_INSERCAO: TSQLTimeStampField
      FieldName = 'DT_INSERCAO'
    end
    object cdsRapsImpressaoNR_FORNECIMENTO: TStringField
      FieldName = 'NR_FORNECIMENTO'
      FixedChar = True
      Size = 310
    end
  end
  object dspRapsImpressao: TDataSetProvider
    DataSet = qryRapsImpressao
    Left = 879
    Top = 182
  end
  object dsRapsSelecionadas: TDataSource
    AutoEdit = False
    DataSet = cdsRapsSelecionadas
    Left = 985
    Top = 283
  end
  object cdsRapsSelecionadas: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 986
    Top = 237
    object cdsRapsSelecionadasCD_RAP: TStringField
      FieldName = 'CD_RAP'
      FixedChar = True
      Size = 6
    end
    object cdsRapsSelecionadasCD_RAP_ANO: TStringField
      FieldName = 'CD_RAP_ANO'
      FixedChar = True
      Size = 2
    end
    object cdsRapsSelecionadasDT_INSERCAO: TSQLTimeStampField
      FieldName = 'DT_INSERCAO'
    end
    object cdsRapsSelecionadasNR_FORNECIMENTO: TStringField
      FieldName = 'NR_FORNECIMENTO'
      FixedChar = True
      Size = 310
    end
  end
  object dsContainers: TDataSource
    DataSet = cdsContainers
    Left = 374
    Top = 57
  end
  object cdsContainers: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspContainers'
    Left = 289
    Top = 55
    object cdsContainersCONTAINER: TStringField
      FieldName = 'CONTAINER'
      FixedChar = True
      Size = 41
    end
    object cdsContainersNR_CNTR: TStringField
      FieldName = 'NR_CNTR'
      FixedChar = True
    end
  end
  object dspContainers: TDataSetProvider
    DataSet = qryContainers
    Left = 206
    Top = 55
  end
  object qryContainers: TSQLQuery
    MaxBlobSize = -1
    Params = <>
    SQLConnection = SQLConnection
    Left = 113
    Top = 55
    object qryContainersCONTAINER: TStringField
      FieldName = 'CONTAINER'
      FixedChar = True
      Size = 41
    end
    object qryContainersNR_CNTR: TStringField
      FieldName = 'NR_CNTR'
      FixedChar = True
    end
  end
  object qryAtualizaSeqProgRodoviaria: TSQLQuery
    MaxBlobSize = -1
    Params = <>
    SQLConnection = SQLConnection
    Left = 804
    Top = 5
    object StringField1: TStringField
      FieldName = 'EMAILS'
      FixedChar = True
      Size = 200
    end
    object StringField2: TStringField
      FieldName = 'ASSUNTO'
      FixedChar = True
      Size = 100
    end
  end
  object qryCertificadoVigilanciaS: TSQLQuery
    MaxBlobSize = -1
    Params = <>
    SQLConnection = SQLConnection
    Left = 947
    Top = 348
    object qryCertificadoVigilanciaSNR_PROCESSO: TStringField
      FieldName = 'NR_PROCESSO'
      Required = True
      FixedChar = True
      Size = 18
    end
    object qryCertificadoVigilanciaSEXPORT_EMPRESA: TStringField
      FieldName = 'EXPORT_EMPRESA'
      FixedChar = True
      Size = 80
    end
    object qryCertificadoVigilanciaSEXPORT_CNPJ: TStringField
      FieldName = 'EXPORT_CNPJ'
      FixedChar = True
      Size = 18
    end
    object qryCertificadoVigilanciaSIMPORT_EMPRESA: TStringField
      FieldName = 'IMPORT_EMPRESA'
      FixedChar = True
      Size = 100
    end
    object qryCertificadoVigilanciaSIMPORT_CIDADE_ESTADO_PAIS: TStringField
      FieldName = 'IMPORT_CIDADE_ESTADO_PAIS'
      FixedChar = True
      Size = 500
    end
    object qryCertificadoVigilanciaSFABRICANTE_NOME: TStringField
      FieldName = 'FABRICANTE_NOME'
      FixedChar = True
      Size = 80
    end
    object qryCertificadoVigilanciaSFABR_CIDADE_ESTADO_PAIS: TStringField
      FieldName = 'FABR_CIDADE_ESTADO_PAIS'
      FixedChar = True
      Size = 500
    end
    object qryCertificadoVigilanciaSPAIS_ORIGEM: TStringField
      FieldName = 'PAIS_ORIGEM'
      Required = True
      FixedChar = True
      Size = 6
    end
    object qryCertificadoVigilanciaSDESTINO_FINAL_ING: TStringField
      FieldName = 'DESTINO_FINAL_ING'
      FixedChar = True
      Size = 50
    end
    object qryCertificadoVigilanciaSDESTINO_FINAL_ESP: TStringField
      FieldName = 'DESTINO_FINAL_ESP'
      FixedChar = True
      Size = 50
    end
    object qryCertificadoVigilanciaSDS_PORTO_EMBARQUE: TStringField
      FieldName = 'DS_PORTO_EMBARQUE'
      FixedChar = True
      Size = 53
    end
    object qryCertificadoVigilanciaSDS_PORTO_DESTINO: TStringField
      FieldName = 'DS_PORTO_DESTINO'
      FixedChar = True
      Size = 50
    end
    object qryCertificadoVigilanciaSCONDICAO_TRANSPORTE_ING: TStringField
      FieldName = 'CONDICAO_TRANSPORTE_ING'
      Required = True
      FixedChar = True
      Size = 300
    end
    object qryCertificadoVigilanciaSCONDICAO_TRANSPORTE_ESP: TStringField
      FieldName = 'CONDICAO_TRANSPORTE_ESP'
      Required = True
      FixedChar = True
      Size = 300
    end
    object qryCertificadoVigilanciaSDS_LICENCA_SANITARIA: TStringField
      FieldName = 'DS_LICENCA_SANITARIA'
      FixedChar = True
      Size = 50
    end
    object qryCertificadoVigilanciaSNM_VIA_TRANSPORTE_ING: TStringField
      FieldName = 'NM_VIA_TRANSPORTE_ING'
      FixedChar = True
    end
    object qryCertificadoVigilanciaSNM_VIA_TRANSPORTE_ESP: TStringField
      FieldName = 'NM_VIA_TRANSPORTE_ESP'
      FixedChar = True
    end
    object qryCertificadoVigilanciaSFABR_CNPJ: TStringField
      FieldName = 'FABR_CNPJ'
      Size = 18
    end
    object qryCertificadoVigilanciaSIDENTIFICACAO: TStringField
      FieldName = 'IDENTIFICACAO'
      FixedChar = True
      Size = 300
    end
    object qryCertificadoVigilanciaSEXPORTADOR_ENDERECO: TStringField
      FieldName = 'EXPORTADOR_ENDERECO'
      Size = 200
    end
  end
  object dspCertificadoVigilanciaS: TDataSetProvider
    DataSet = qryCertificadoVigilanciaS
    Left = 946
    Top = 406
  end
  object cdsCertificadoVigilanciaS: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspCertificadoVigilanciaS'
    Left = 946
    Top = 456
    object cdsCertificadoVigilanciaSNR_PROCESSO: TStringField
      FieldName = 'NR_PROCESSO'
      Required = True
      FixedChar = True
      Size = 18
    end
    object cdsCertificadoVigilanciaSEXPORT_EMPRESA: TStringField
      FieldName = 'EXPORT_EMPRESA'
      FixedChar = True
      Size = 80
    end
    object cdsCertificadoVigilanciaSEXPORT_CNPJ: TStringField
      FieldName = 'EXPORT_CNPJ'
      FixedChar = True
      Size = 18
    end
    object cdsCertificadoVigilanciaSIMPORT_EMPRESA: TStringField
      FieldName = 'IMPORT_EMPRESA'
      FixedChar = True
      Size = 100
    end
    object cdsCertificadoVigilanciaSIMPORT_CIDADE_ESTADO_PAIS: TStringField
      FieldName = 'IMPORT_CIDADE_ESTADO_PAIS'
      FixedChar = True
      Size = 500
    end
    object cdsCertificadoVigilanciaSFABRICANTE_NOME: TStringField
      FieldName = 'FABRICANTE_NOME'
      FixedChar = True
      Size = 80
    end
    object cdsCertificadoVigilanciaSFABR_CIDADE_ESTADO_PAIS: TStringField
      FieldName = 'FABR_CIDADE_ESTADO_PAIS'
      FixedChar = True
      Size = 500
    end
    object cdsCertificadoVigilanciaSPAIS_ORIGEM: TStringField
      FieldName = 'PAIS_ORIGEM'
      Required = True
      FixedChar = True
      Size = 6
    end
    object cdsCertificadoVigilanciaSDESTINO_FINAL_ING: TStringField
      FieldName = 'DESTINO_FINAL_ING'
      FixedChar = True
      Size = 50
    end
    object cdsCertificadoVigilanciaSDESTINO_FINAL_ESP: TStringField
      FieldName = 'DESTINO_FINAL_ESP'
      FixedChar = True
      Size = 50
    end
    object cdsCertificadoVigilanciaSDS_PORTO_EMBARQUE: TStringField
      FieldName = 'DS_PORTO_EMBARQUE'
      FixedChar = True
      Size = 53
    end
    object cdsCertificadoVigilanciaSDS_PORTO_DESTINO: TStringField
      FieldName = 'DS_PORTO_DESTINO'
      FixedChar = True
      Size = 50
    end
    object cdsCertificadoVigilanciaSCONDICAO_TRANSPORTE_ING: TStringField
      FieldName = 'CONDICAO_TRANSPORTE_ING'
      Required = True
      FixedChar = True
      Size = 300
    end
    object cdsCertificadoVigilanciaSCONDICAO_TRANSPORTE_ESP: TStringField
      FieldName = 'CONDICAO_TRANSPORTE_ESP'
      Required = True
      FixedChar = True
      Size = 300
    end
    object cdsCertificadoVigilanciaSDS_LICENCA_SANITARIA: TStringField
      FieldName = 'DS_LICENCA_SANITARIA'
      FixedChar = True
      Size = 50
    end
    object cdsCertificadoVigilanciaSNM_VIA_TRANSPORTE_ING: TStringField
      FieldName = 'NM_VIA_TRANSPORTE_ING'
      FixedChar = True
    end
    object cdsCertificadoVigilanciaSNM_VIA_TRANSPORTE_ESP: TStringField
      FieldName = 'NM_VIA_TRANSPORTE_ESP'
      FixedChar = True
    end
    object cdsCertificadoVigilanciaSFABR_CNPJ: TStringField
      FieldName = 'FABR_CNPJ'
      Size = 18
    end
    object cdsCertificadoVigilanciaSIDENTIFICACAO: TStringField
      FieldName = 'IDENTIFICACAO'
      FixedChar = True
      Size = 300
    end
    object cdsCertificadoVigilanciaSEXPORTADOR_ENDERECO: TStringField
      FieldName = 'EXPORTADOR_ENDERECO'
      Size = 200
    end
  end
  object dsCertificadoVigilanciaS: TDataSource
    DataSet = cdsCertificadoVigilanciaS
    Left = 945
    Top = 510
  end
  object qryCertificadoVigilanciaSItem: TSQLQuery
    MaxBlobSize = -1
    Params = <>
    SQLConnection = SQLConnection
    Left = 1079
    Top = 351
    object qryCertificadoVigilanciaSItemNR_PROCESSO: TStringField
      FieldName = 'NR_PROCESSO'
      Required = True
      FixedChar = True
      Size = 18
    end
    object qryCertificadoVigilanciaSItemCD_MERCADORIA: TStringField
      FieldName = 'CD_MERCADORIA'
      FixedChar = True
      Size = 40
    end
    object qryCertificadoVigilanciaSItemMERCADORIA_ING: TStringField
      FieldName = 'MERCADORIA_ING'
      FixedChar = True
      Size = 403
    end
    object qryCertificadoVigilanciaSItemMERCADORIA_ESP: TStringField
      FieldName = 'MERCADORIA_ESP'
      FixedChar = True
      Size = 403
    end
    object qryCertificadoVigilanciaSItemCERTIFICADO_PARA_ING: TStringField
      FieldName = 'CERTIFICADO_PARA_ING'
      Required = True
      FixedChar = True
      Size = 30
    end
    object qryCertificadoVigilanciaSItemCERTIFICADO_PARA_ESP: TStringField
      FieldName = 'CERTIFICADO_PARA_ESP'
      Required = True
      FixedChar = True
      Size = 30
    end
    object qryCertificadoVigilanciaSItemUNIDADE_MEDIDA_ING: TStringField
      FieldName = 'UNIDADE_MEDIDA_ING'
      FixedChar = True
      Size = 50
    end
    object qryCertificadoVigilanciaSItemUNIDADE_MEDIDA_ESP: TStringField
      FieldName = 'UNIDADE_MEDIDA_ESP'
      FixedChar = True
      Size = 50
    end
    object qryCertificadoVigilanciaSItemDT_FABRICACAO: TStringField
      FieldName = 'DT_FABRICACAO'
      FixedChar = True
      Size = 1000
    end
    object qryCertificadoVigilanciaSItemDT_VENCIMENTO: TStringField
      FieldName = 'DT_VENCIMENTO'
      FixedChar = True
      Size = 1000
    end
    object qryCertificadoVigilanciaSItemQT_MERCADORIA: TStringField
      FieldName = 'QT_MERCADORIA'
      FixedChar = True
      Size = 1000
    end
    object qryCertificadoVigilanciaSItemCD_LOTE: TStringField
      FieldName = 'CD_LOTE'
      FixedChar = True
      Size = 1000
    end
    object qryCertificadoVigilanciaSItemMARCA_ING: TStringField
      FieldName = 'MARCA_ING'
    end
    object qryCertificadoVigilanciaSItemMARCA_ESP: TStringField
      FieldName = 'MARCA_ESP'
    end
    object qryCertificadoVigilanciaSItemTX_MARCACAO_VOLUME: TStringField
      FieldName = 'TX_MARCACAO_VOLUME'
      Size = 200
    end
  end
  object dspCertificadoVigilanciaSItem: TDataSetProvider
    DataSet = qryCertificadoVigilanciaSItem
    Left = 1078
    Top = 406
  end
  object cdsCertificadoVigilanciaSItem: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspCertificadoVigilanciaSItem'
    Left = 1083
    Top = 457
    object cdsCertificadoVigilanciaSItemNR_PROCESSO: TStringField
      FieldName = 'NR_PROCESSO'
      Required = True
      FixedChar = True
      Size = 18
    end
    object cdsCertificadoVigilanciaSItemCD_MERCADORIA: TStringField
      FieldName = 'CD_MERCADORIA'
      FixedChar = True
      Size = 40
    end
    object cdsCertificadoVigilanciaSItemMERCADORIA_ING: TStringField
      FieldName = 'MERCADORIA_ING'
      FixedChar = True
      Size = 403
    end
    object cdsCertificadoVigilanciaSItemMERCADORIA_ESP: TStringField
      FieldName = 'MERCADORIA_ESP'
      FixedChar = True
      Size = 403
    end
    object cdsCertificadoVigilanciaSItemCERTIFICADO_PARA_ING: TStringField
      FieldName = 'CERTIFICADO_PARA_ING'
      Required = True
      FixedChar = True
      Size = 30
    end
    object cdsCertificadoVigilanciaSItemCERTIFICADO_PARA_ESP: TStringField
      FieldName = 'CERTIFICADO_PARA_ESP'
      Required = True
      FixedChar = True
      Size = 30
    end
    object cdsCertificadoVigilanciaSItemUNIDADE_MEDIDA_ING: TStringField
      FieldName = 'UNIDADE_MEDIDA_ING'
      FixedChar = True
      Size = 50
    end
    object cdsCertificadoVigilanciaSItemUNIDADE_MEDIDA_ESP: TStringField
      FieldName = 'UNIDADE_MEDIDA_ESP'
      FixedChar = True
      Size = 50
    end
    object cdsCertificadoVigilanciaSItemDT_FABRICACAO: TStringField
      FieldName = 'DT_FABRICACAO'
      FixedChar = True
      Size = 1000
    end
    object cdsCertificadoVigilanciaSItemDT_VENCIMENTO: TStringField
      FieldName = 'DT_VENCIMENTO'
      FixedChar = True
      Size = 1000
    end
    object cdsCertificadoVigilanciaSItemQT_MERCADORIA: TStringField
      FieldName = 'QT_MERCADORIA'
      FixedChar = True
      Size = 1000
    end
    object cdsCertificadoVigilanciaSItemCD_LOTE: TStringField
      FieldName = 'CD_LOTE'
      FixedChar = True
      Size = 400
    end
    object cdsCertificadoVigilanciaSItemMARCA_ING: TStringField
      FieldName = 'MARCA_ING'
    end
    object cdsCertificadoVigilanciaSItemMARCA_ESP: TStringField
      FieldName = 'MARCA_ESP'
    end
    object cdsCertificadoVigilanciaSItemTX_MARCACAO_VOLUME: TStringField
      FieldName = 'TX_MARCACAO_VOLUME'
      Size = 200
    end
  end
  object dsCertificadoVigilanciaSItem: TDataSource
    DataSet = cdsCertificadoVigilanciaSItem
    Left = 1078
    Top = 510
  end
  object qryValidacaoContainerM: TSQLQuery
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftString
        Name = 'PROCESSO'
        ParamType = ptInput
      end>
    SQL.Strings = (
      'SELECT COUNT(TP.NR_PROCESSO) AS COUNT_CNTR'
      'FROM BROKER.DBO.TPROCESSO_EXP_PEDIDO PEP (NOLOCK) '
      
        'LEFT JOIN BROKER.DBO.TPROCESSO TP (NOLOCK) ON TP.NR_PROCESSO = P' +
        'EP.NR_PROCESSO '
      
        'LEFT JOIN BROKER.DBO.TSERVICO_NOVO SN (NOLOCK) ON SN.CD_SERVICO ' +
        '= TP.CD_SERVICO '
      
        'LEFT JOIN BROKER.DBO.TVIA_TRANSP_BROKER VT (NOLOCK) ON VT.CD_VIA' +
        '_TRANSP = SN.CD_VIA_TRANSPORTE '
      'WHERE TP.NR_PROCESSO = :PROCESSO'
      'AND VT.CD_VIA_TRANSP='#39'01'#39#10' '
      'AND NR_CNTR IS NULL')
    SQLConnection = SQLConnection
    Left = 1089
    Top = 31
    object qryValidacaoContainerMCOUNT_CNTR: TIntegerField
      FieldName = 'COUNT_CNTR'
    end
  end
  object qryIdiomaPedido: TSQLQuery
    MaxBlobSize = -1
    Params = <>
    SQLConnection = SQLConnection
    Left = 1097
    Top = 87
    object qryIdiomaPedidoCD_LINGUA_PEDIDO: TStringField
      FieldName = 'CD_LINGUA_PEDIDO'
      Size = 1
    end
  end
  object qryMercadorias: TSQLQuery
    MaxBlobSize = -1
    Params = <>
    SQL.Strings = (
      'SELECT LTRIM(RTRIM(ISNULL(CD_MERCADORIA,  '#39#39'))) AS MERCADORIA,'
      '                    CD_MERCADORIA                             '
      '               FROM TPROCESSO_EXP_ITEM (NOLOCK)               '
      '              WHERE NR_PROCESSO ='#39'0102EM-000511-22'#39'  ')
    SQLConnection = SQLConnection
    Left = 458
    Top = 55
    object qryMercadoriasMERCADORIA: TStringField
      FieldName = 'MERCADORIA'
      FixedChar = True
      Size = 40
    end
    object qryMercadoriasCD_MERCADORIA: TStringField
      FieldName = 'CD_MERCADORIA'
      FixedChar = True
      Size = 40
    end
  end
  object dspMercadorias: TDataSetProvider
    DataSet = qryMercadorias
    Left = 535
    Top = 55
  end
  object cdsMercadorias: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspMercadorias'
    Left = 613
    Top = 55
    object cdsMercadoriasMERCADORIA: TStringField
      FieldName = 'MERCADORIA'
      FixedChar = True
      Size = 40
    end
    object cdsMercadoriasCD_MERCADORIA: TStringField
      FieldName = 'CD_MERCADORIA'
      FixedChar = True
      Size = 40
    end
  end
  object dsMercadorias: TDataSource
    DataSet = cdsMercadorias
    Left = 690
    Top = 55
  end
end
