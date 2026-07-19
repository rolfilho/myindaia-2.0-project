object datm_ConfigEnvioEmail: Tdatm_ConfigEnvioEmail
  OldCreateOrder = True
  OnCreate = DataModuleCreate
  Left = 433
  Top = 166
  Height = 553
  Width = 728
  object dsListaGrupos: TDataSource
    DataSet = cdsListaGrupos
    Left = 421
    Top = 201
  end
  object qryListaGrupos: TSQLQuery
    MaxBlobSize = -1
    Params = <>
    SQL.Strings = (
      'SELECT A.CD_CONFIG_ENVIO_EMAIL             '
      '      ,A.CD_PRODUTO '
      '      ,B.NM_PRODUTO                       '
      '      ,A.CD_GRUPO    '
      '      ,C.NM_GRUPO                      '
      'FROM TCONFIG_ENVIO_EMAIL A WITH(NOLOCK)  '
      
        'JOIN TPRODUTO            B WITH(NOLOCK) ON B.CD_PRODUTO = A.CD_P' +
        'RODUTO'
      
        'JOIN TGRUPO              C WITH(NOLOCK) ON C.CD_GRUPO   = A.CD_G' +
        'RUPO')
    SQLConnection = SQLConnection
    Left = 421
    Top = 20
    object cdsListaGruposCD_CONFIG_ENVIO_EMAIL: TIntegerField
      FieldName = 'CD_CONFIG_ENVIO_EMAIL'
      Required = True
    end
    object strngfldListaGruposCD_PRODUTO: TStringField
      FieldName = 'CD_PRODUTO'
      FixedChar = True
      Size = 2
    end
    object strngfldListaGruposCD_GRUPO: TStringField
      FieldName = 'CD_GRUPO'
      FixedChar = True
      Size = 3
    end
    object qryListaGruposNM_PRODUTO: TStringField
      FieldName = 'NM_PRODUTO'
      Required = True
      FixedChar = True
      Size = 40
    end
    object qryListaGruposNM_GRUPO: TStringField
      FieldName = 'NM_GRUPO'
      Required = True
      FixedChar = True
      Size = 50
    end
  end
  object qryConfig: TSQLQuery
    MaxBlobSize = 1
    Params = <>
    SQL.Strings = (
      'SELECT '#9'   A.CD_CONFIG_ENVIO_EMAIL'
      #9'  ,A.CD_PRODUTO'
      #9'  ,A.CD_GRUPO'
      '  FROM TCONFIG_ENVIO_EMAIL A WITH(NOLOCK)')
    SQLConnection = SQLConnection
    Left = 21
    Top = 276
    object cdsConfigCD_CONFIG_ENVIO_EMAIL: TIntegerField
      FieldName = 'CD_CONFIG_ENVIO_EMAIL'
      ProviderFlags = [pfInUpdate, pfInKey]
      ReadOnly = True
    end
    object strngfldConfigCD_PRODUTO: TStringField
      FieldName = 'CD_PRODUTO'
      FixedChar = True
      Size = 2
    end
    object strngfldConfigCD_GRUPO: TStringField
      FieldName = 'CD_GRUPO'
      FixedChar = True
      Size = 3
    end
  end
  object dsConfig: TDataSource
    DataSet = cdsConfig
    OnStateChange = dsConfigStateChange
    Left = 21
    Top = 457
  end
  object qryGrupo: TSQLQuery
    MaxBlobSize = -1
    Params = <>
    SQL.Strings = (
      'SELECT CD_GRUPO, NM_GRUPO '
      'FROM TGRUPO')
    SQLConnection = SQLConnection
    Left = 101
    Top = 20
    object strngfldqry1CD_GRUPO: TStringField
      FieldName = 'CD_GRUPO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      FixedChar = True
      Size = 3
    end
    object strngfldqry1NM_GRUPO: TStringField
      FieldName = 'NM_GRUPO'
      FixedChar = True
      Size = 50
    end
  end
  object dsGrupo: TDataSource
    DataSet = cdsGrupo
    Left = 93
    Top = 201
  end
  object qryProduto: TSQLQuery
    MaxBlobSize = -1
    Params = <>
    SQL.Strings = (
      'SELECT CD_PRODUTO, NM_PRODUTO'
      'FROM TPRODUTO A WITH(NOLOCK)')
    SQLConnection = SQLConnection
    Left = 309
    Top = 20
    object strngfldProdutoCD_PRODUTO: TStringField
      FieldName = 'CD_PRODUTO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      FixedChar = True
      Size = 2
    end
    object strngfldProdutoNM_PRODUTO: TStringField
      FieldName = 'NM_PRODUTO'
      FixedChar = True
      Size = 40
    end
  end
  object dsProduto: TDataSource
    DataSet = cdsProduto
    Left = 306
    Top = 201
  end
  object qryTipoDocumento: TSQLQuery
    MaxBlobSize = -1
    Params = <>
    SQL.Strings = (
      ' SELECT DISTINCT CD_TIPO_DOCTO             '
      
        '                             ,NM_TIPO_DOCTO                     ' +
        ' '
      ' FROM TTP_DOCTO_DIGITALIZADO A WITH(NOLOCK)'
      ''
      ' UNION ALL     '
      '                            '
      ' SELECT '#39'999'#39'                            '
      '       ,'#39'Todos'#39'   '
      '                       '
      ' ORDER BY NM_TIPO_DOCTO                    ')
    SQLConnection = SQLConnection
    Left = 205
    Top = 20
    object cdsTipoDocumentoCD_TIPO_DOCTO: TIntegerField
      FieldName = 'CD_TIPO_DOCTO'
      Required = True
    end
    object strngfldTipoDocumentoNM_TIPO_DOCTO: TStringField
      FieldName = 'NM_TIPO_DOCTO'
      FixedChar = True
      Size = 255
    end
  end
  object dsTipoDocumento: TDataSource
    DataSet = cdsTipoDocumento
    Left = 202
    Top = 201
  end
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
    Left = 32
    Top = 12
  end
  object dsConfigArquivo: TDataSource
    DataSet = cdsConfigArquivo
    OnStateChange = dsConfigArquivoStateChange
    Left = 117
    Top = 457
  end
  object dspListaGrupos: TDataSetProvider
    DataSet = qryListaGrupos
    Left = 424
    Top = 80
  end
  object cdsListaGrupos: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspListaGrupos'
    Left = 424
    Top = 144
    object cdsListaGruposCD_CONFIG_ENVIO_EMAIL2: TIntegerField
      FieldName = 'CD_CONFIG_ENVIO_EMAIL'
    end
    object cdsListaGruposCD_PRODUTO: TStringField
      FieldName = 'CD_PRODUTO'
      FixedChar = True
      Size = 2
    end
    object cdsListaGruposCD_GRUPO: TStringField
      FieldName = 'CD_GRUPO'
      FixedChar = True
      Size = 3
    end
    object cdsListaGruposNM_PRODUTO: TStringField
      FieldName = 'NM_PRODUTO'
      Required = True
      FixedChar = True
      Size = 40
    end
    object cdsListaGruposNM_GRUPO: TStringField
      FieldName = 'NM_GRUPO'
      Required = True
      FixedChar = True
      Size = 50
    end
  end
  object cdsConfig: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspConfig'
    Left = 24
    Top = 400
    object cdsConfigCD_CONFIG_ENVIO_EMAIL2: TIntegerField
      FieldName = 'CD_CONFIG_ENVIO_EMAIL'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object strngfldConfigCD_PRODUTO1: TStringField
      FieldName = 'CD_PRODUTO'
      FixedChar = True
      Size = 2
    end
    object strngfldConfigCD_GRUPO1: TStringField
      FieldName = 'CD_GRUPO'
      FixedChar = True
      Size = 3
    end
  end
  object dspConfig: TDataSetProvider
    DataSet = qryConfig
    UpdateMode = upWhereKeyOnly
    Left = 24
    Top = 336
  end
  object dspConfigArquivo: TDataSetProvider
    DataSet = qryConfigArquivo
    Options = [poAllowMultiRecordUpdates]
    UpdateMode = upWhereKeyOnly
    Left = 120
    Top = 336
  end
  object qryNomeArquivo: TSQLQuery
    MaxBlobSize = -1
    Params = <>
    SQL.Strings = (
      ' SELECT CD_CONFIG_ENVIO_EMAIL_ARQU_SL                     '
      '       ,CD_CONFIG_ENVIO_EMAIL_ARQU                        '
      '       ,NM_SIGLA                                          '
      '       ,NM_NOVO_NOME_ARQUIVO                              '
      '       ,CD_CONFIG_ENVIO_EMAIL                             '
      '  FROM TCONFIG_ENVIO_EMAIL_ARQUIVOS_SIGLAS  WITH(NOLOCK)  ')
    SQLConnection = SQLConnection
    Left = 224
    Top = 277
    object qryNomeArquivoCD_CONFIG_ENVIO_EMAIL_ARQU_SL: TIntegerField
      FieldName = 'CD_CONFIG_ENVIO_EMAIL_ARQU_SL'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      ReadOnly = True
    end
    object qryNomeArquivoCD_CONFIG_ENVIO_EMAIL_ARQU: TIntegerField
      FieldName = 'CD_CONFIG_ENVIO_EMAIL_ARQU'
    end
    object qryNomeArquivoNM_SIGLA: TStringField
      FieldName = 'NM_SIGLA'
      FixedChar = True
      Size = 10
    end
    object qryNomeArquivoNM_NOVO_NOME_ARQUIVO: TStringField
      FieldName = 'NM_NOVO_NOME_ARQUIVO'
      FixedChar = True
      Size = 60
    end
    object qryNomeArquivoCD_CONFIG_ENVIO_EMAIL: TIntegerField
      FieldName = 'CD_CONFIG_ENVIO_EMAIL'
    end
  end
  object cdsNomeArquivo: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspNomeArquivo'
    BeforePost = cdsNomeArquivoBeforePost
    Left = 224
    Top = 400
    object cdsNomeArquivoCD_CONFIG_ENVIO_EMAIL_ARQU_SL: TIntegerField
      FieldName = 'CD_CONFIG_ENVIO_EMAIL_ARQU_SL'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object cdsNomeArquivoCD_CONFIG_ENVIO_EMAIL_ARQU: TIntegerField
      FieldName = 'CD_CONFIG_ENVIO_EMAIL_ARQU'
      ProviderFlags = [pfInUpdate]
    end
    object cdsNomeArquivoCD_CONFIG_ENVIO_EMAIL: TIntegerField
      FieldName = 'CD_CONFIG_ENVIO_EMAIL'
      ProviderFlags = [pfInUpdate]
    end
    object cdsNomeArquivoNM_SIGLA: TStringField
      FieldName = 'NM_SIGLA'
      ProviderFlags = [pfInUpdate]
      FixedChar = True
      Size = 10
    end
    object cdsNomeArquivoNM_NOVO_NOME_ARQUIVO: TStringField
      FieldName = 'NM_NOVO_NOME_ARQUIVO'
      ProviderFlags = [pfInUpdate]
      FixedChar = True
      Size = 60
    end
  end
  object dsNomeArquivo: TDataSource
    DataSet = cdsNomeArquivo
    OnStateChange = dsNomeArquivoStateChange
    Left = 224
    Top = 456
  end
  object dspNomeArquivo: TDataSetProvider
    DataSet = qryNomeArquivo
    Options = [poAllowMultiRecordUpdates]
    UpdateMode = upWhereKeyOnly
    Left = 224
    Top = 336
  end
  object cdsGrupo: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspGrupo'
    AfterScroll = cdsGrupoAfterScroll
    Left = 96
    Top = 144
    object strngfldGrupoCD_GRUPO: TStringField
      FieldName = 'CD_GRUPO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      FixedChar = True
      Size = 3
    end
    object strngfldGrupoNM_GRUPO: TStringField
      FieldName = 'NM_GRUPO'
      FixedChar = True
      Size = 50
    end
  end
  object cdsProduto: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspProduto'
    AfterScroll = cdsProdutoAfterScroll
    Left = 304
    Top = 144
    object strngfldProdutoCD_PRODUTO1: TStringField
      FieldName = 'CD_PRODUTO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      FixedChar = True
      Size = 2
    end
    object strngfldProdutoNM_PRODUTO1: TStringField
      FieldName = 'NM_PRODUTO'
      FixedChar = True
      Size = 40
    end
  end
  object cdsTipoDocumento: TClientDataSet
    Aggregates = <>
    FetchOnDemand = False
    Params = <>
    ProviderName = 'dspTipoDocumento'
    Left = 200
    Top = 144
    object cdsTipoDocumentoCD_TIPO_DOCTO2: TIntegerField
      FieldName = 'CD_TIPO_DOCTO'
      Required = True
    end
    object strngfldTipoDocumentoNM_TIPO_DOCTO1: TStringField
      FieldName = 'NM_TIPO_DOCTO'
      FixedChar = True
      Size = 255
    end
  end
  object dspGrupo: TDataSetProvider
    DataSet = qryGrupo
    Left = 96
    Top = 80
  end
  object dspProduto: TDataSetProvider
    DataSet = qryProduto
    Left = 304
    Top = 80
  end
  object dspTipoDocumento: TDataSetProvider
    DataSet = qryTipoDocumento
    Left = 200
    Top = 80
  end
  object cdsConfigArquivo: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspConfigArquivo'
    BeforePost = cdsConfigArquivoBeforePost
    OnReconcileError = cdsConfigArquivoReconcileError
    Left = 120
    Top = 400
    object cdsConfigArquivoCD_CONFIG_ENVIO_EMAIL_ARQU2: TIntegerField
      FieldName = 'CD_CONFIG_ENVIO_EMAIL_ARQU'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object cdsConfigArquivoCD_CONFIG_ENVIO_EMAIL2: TIntegerField
      FieldName = 'CD_CONFIG_ENVIO_EMAIL'
      ProviderFlags = [pfInUpdate]
    end
    object cdsConfigArquivoCD_ARQUIVO2: TIntegerField
      FieldName = 'CD_ARQUIVO'
      ProviderFlags = [pfInUpdate]
      Visible = False
    end
    object cdsConfigArquivoNM_ARQUIVO: TStringField
      FieldKind = fkLookup
      FieldName = 'NM_ARQUIVO'
      LookupDataSet = cdsTipoDocumento
      LookupKeyFields = 'CD_TIPO_DOCTO'
      LookupResultField = 'NM_TIPO_DOCTO'
      KeyFields = 'CD_ARQUIVO'
      LookupCache = True
      ProviderFlags = []
      Size = 60
      Lookup = True
    end
    object cdsConfigArquivoNM_ASSUNTO: TStringField
      FieldName = 'NM_ASSUNTO'
      ProviderFlags = [pfInWhere]
      FixedChar = True
      Size = 200
    end
    object cdsConfigArquivoNM_DESTINATARIO: TStringField
      FieldName = 'NM_DESTINATARIO'
      ProviderFlags = [pfInWhere]
      FixedChar = True
      Size = 200
    end
    object cdsConfigArquivoNM_COPIA: TStringField
      FieldName = 'NM_COPIA'
      ProviderFlags = [pfInWhere]
      FixedChar = True
      Size = 200
    end
    object cdsConfigArquivoNM_CORPO: TStringField
      FieldName = 'NM_CORPO'
      ProviderFlags = [pfInWhere]
      FixedChar = True
      Size = 200
    end
  end
  object qryConfigArquivo: TSQLQuery
    MaxBlobSize = -1
    Params = <>
    SQL.Strings = (
      'SELECT   CD_CONFIG_ENVIO_EMAIL_ARQU'
      #9#9',CD_CONFIG_ENVIO_EMAIL'
      #9#9',CD_ARQUIVO'
      #9#9',NM_ASSUNTO'
      #9#9',NM_DESTINATARIO'#9#9
      #9#9',NM_COPIA '
      #9#9',NM_CORPO'#9#9
      '  FROM TCONFIG_ENVIO_EMAIL_ARQUIVOS A WITH(NOLOCK)')
    SQLConnection = SQLConnection
    Left = 125
    Top = 276
    object cdsConfigArquivoCD_CONFIG_ENVIO_EMAIL_ARQU: TIntegerField
      FieldName = 'CD_CONFIG_ENVIO_EMAIL_ARQU'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      ReadOnly = True
    end
    object cdsConfigArquivoCD_CONFIG_ENVIO_EMAIL: TIntegerField
      FieldName = 'CD_CONFIG_ENVIO_EMAIL'
    end
    object cdsConfigArquivoCD_ARQUIVO: TIntegerField
      FieldName = 'CD_ARQUIVO'
    end
    object qryConfigArquivoNM_ASSUNTO: TStringField
      FieldName = 'NM_ASSUNTO'
      FixedChar = True
      Size = 200
    end
    object qryConfigArquivoNM_DESTINATARIO: TStringField
      FieldName = 'NM_DESTINATARIO'
      FixedChar = True
      Size = 200
    end
    object qryConfigArquivoNM_COPIA: TStringField
      FieldName = 'NM_COPIA'
      FixedChar = True
      Size = 200
    end
    object qryConfigArquivoNM_CORPO: TStringField
      FieldName = 'NM_CORPO'
      FixedChar = True
      Size = 200
    end
  end
  object qryConfigEmpresa: TSQLQuery
    MaxBlobSize = 1
    Params = <>
    SQL.Strings = (
      'SELECT CD_CONFIG_ENVIO_EMAIL_EMP'
      '      ,CD_CONFIG_ENVIO_EMAIL'
      '      ,CD_EMPRESA'
      '  FROM TCONFIG_ENVIO_EMAIL_EMPRESAS A WITH(NOLOCK)')
    SQLConnection = SQLConnection
    Left = 365
    Top = 276
    object qryConfigEmpresaCD_CONFIG_ENVIO_EMAIL_EMP: TIntegerField
      FieldName = 'CD_CONFIG_ENVIO_EMAIL_EMP'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object qryConfigEmpresaCD_CONFIG_ENVIO_EMAIL: TIntegerField
      FieldName = 'CD_CONFIG_ENVIO_EMAIL'
    end
    object qryConfigEmpresaCD_EMPRESA: TStringField
      FieldName = 'CD_EMPRESA'
      FixedChar = True
      Size = 5
    end
  end
  object dsConfigEmpresa: TDataSource
    DataSet = cdsConfigEmpresa
    OnStateChange = dsConfigEmpresaStateChange
    Left = 365
    Top = 457
  end
  object dsConfigArquivoEmpresa: TDataSource
    DataSet = cdsConfigArquivoEmpresa
    OnStateChange = dsConfigArquivoEmpresaStateChange
    Left = 485
    Top = 457
  end
  object cdsConfigEmpresa: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspConfigEmpresa'
    BeforePost = cdsConfigEmpresaBeforePost
    OnReconcileError = cdsConfigEmpresaReconcileError
    Left = 368
    Top = 400
    object cdsConfigEmpresaCD_CONFIG_ENVIO_EMAIL_EMP: TIntegerField
      FieldName = 'CD_CONFIG_ENVIO_EMAIL_EMP'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object cdsConfigEmpresaCD_CONFIG_ENVIO_EMAIL: TIntegerField
      FieldName = 'CD_CONFIG_ENVIO_EMAIL'
      ProviderFlags = [pfInUpdate]
    end
    object cdsConfigEmpresaCD_EMPRESA: TStringField
      FieldName = 'CD_EMPRESA'
      ProviderFlags = [pfInUpdate]
      FixedChar = True
      Size = 5
    end
  end
  object dspConfigEmpresa: TDataSetProvider
    DataSet = qryConfigEmpresa
    Options = [poAllowMultiRecordUpdates]
    UpdateMode = upWhereKeyOnly
    Left = 368
    Top = 336
  end
  object dspConfigArquivoEmpresa: TDataSetProvider
    DataSet = qryConfigArquivoEmpresa
    Options = [poAllowMultiRecordUpdates]
    UpdateMode = upWhereKeyOnly
    Left = 488
    Top = 336
  end
  object qryNomeArquivoEmpresa: TSQLQuery
    MaxBlobSize = -1
    Params = <>
    SQL.Strings = (
      'SELECT   CD_CONFIG_ENVIO_EMAIL_EMP_SL'
      #9#9',CD_CONFIG_ENVIO_EMAIL_EMP_ARQ'
      #9#9',CD_CONFIG_ENVIO_EMAIL_EMP'
      '                               ,CD_CONFIG_ENVIO_EMAIL'
      #9#9',NM_SIGLA'
      #9#9',NM_NOVO_NOME_ARQUIVO                           '
      'FROM TCONFIG_ENVIO_EMAIL_EMPRESAS_SIGLAS A WITH(NOLOCK) ')
    SQLConnection = SQLConnection
    Left = 620
    Top = 277
    object qryNomeArquivoEmpresaCD_CONFIG_ENVIO_EMAIL_EMP_SL: TIntegerField
      FieldName = 'CD_CONFIG_ENVIO_EMAIL_EMP_SL'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      ReadOnly = True
    end
    object qryNomeArquivoEmpresaCD_CONFIG_ENVIO_EMAIL_EMP_ARQ: TIntegerField
      FieldName = 'CD_CONFIG_ENVIO_EMAIL_EMP_ARQ'
    end
    object qryNomeArquivoEmpresaCD_CONFIG_ENVIO_EMAIL_EMP: TIntegerField
      FieldName = 'CD_CONFIG_ENVIO_EMAIL_EMP'
    end
    object qryNomeArquivoEmpresaNM_SIGLA: TStringField
      FieldName = 'NM_SIGLA'
      FixedChar = True
      Size = 10
    end
    object qryNomeArquivoEmpresaNM_NOVO_NOME_ARQUIVO: TStringField
      FieldName = 'NM_NOVO_NOME_ARQUIVO'
      FixedChar = True
      Size = 60
    end
    object qryNomeArquivoEmpresaCD_CONFIG_ENVIO_EMAIL: TIntegerField
      FieldName = 'CD_CONFIG_ENVIO_EMAIL'
    end
  end
  object cdsNomeArquivoEmpresa: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspNomeArquivoEmpresa'
    BeforePost = cdsNomeArquivoEmpresaBeforePost
    OnReconcileError = cdsNomeArquivoEmpresaReconcileError
    Left = 620
    Top = 400
    object cdsNomeArquivoEmpresaCD_CONFIG_ENVIO_EMAIL_EMP_SL: TIntegerField
      FieldName = 'CD_CONFIG_ENVIO_EMAIL_EMP_SL'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object cdsNomeArquivoEmpresaCD_CONFIG_ENVIO_EMAIL_EMP_ARQ: TIntegerField
      FieldName = 'CD_CONFIG_ENVIO_EMAIL_EMP_ARQ'
      ProviderFlags = [pfInUpdate]
    end
    object cdsNomeArquivoEmpresaCD_CONFIG_ENVIO_EMAIL_EMP: TIntegerField
      FieldName = 'CD_CONFIG_ENVIO_EMAIL_EMP'
      ProviderFlags = [pfInUpdate]
    end
    object cdsNomeArquivoEmpresaNM_SIGLA: TStringField
      FieldName = 'NM_SIGLA'
      ProviderFlags = [pfInUpdate]
      FixedChar = True
      Size = 10
    end
    object cdsNomeArquivoEmpresaNM_NOVO_NOME_ARQUIVO: TStringField
      FieldName = 'NM_NOVO_NOME_ARQUIVO'
      ProviderFlags = [pfInUpdate]
      FixedChar = True
      Size = 60
    end
    object cdsNomeArquivoEmpresaCD_CONFIG_ENVIO_EMAIL: TIntegerField
      FieldName = 'CD_CONFIG_ENVIO_EMAIL'
      ProviderFlags = [pfInUpdate]
    end
  end
  object dsNomeArquivoEmpresa: TDataSource
    DataSet = cdsNomeArquivoEmpresa
    OnStateChange = dsNomeArquivoEmpresaStateChange
    Left = 620
    Top = 456
  end
  object dspNomeArquivoEmpresa: TDataSetProvider
    DataSet = qryNomeArquivoEmpresa
    Options = [poAllowMultiRecordUpdates]
    UpdateMode = upWhereKeyOnly
    Left = 620
    Top = 336
  end
  object cdsConfigArquivoEmpresa: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspConfigArquivoEmpresa'
    BeforePost = cdsConfigArquivoEmpresaBeforePost
    OnReconcileError = cdsConfigArquivoEmpresaReconcileError
    Left = 488
    Top = 400
    object cdsConfigArquivoEmpresaCD_CONFIG_ENVIO_EMAIL_EMP_ARQ: TIntegerField
      FieldName = 'CD_CONFIG_ENVIO_EMAIL_EMP_ARQ'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object cdsConfigArquivoEmpresaCD_CONFIG_ENVIO_EMAIL_EMP: TIntegerField
      FieldName = 'CD_CONFIG_ENVIO_EMAIL_EMP'
      ProviderFlags = [pfInUpdate]
    end
    object cdsConfigArquivoEmpresaCD_ARQUIVO: TIntegerField
      FieldName = 'CD_ARQUIVO'
      ProviderFlags = [pfInUpdate]
    end
    object cdsConfigArquivoEmpresaNM_ARQUIVO: TStringField
      FieldKind = fkLookup
      FieldName = 'NM_ARQUIVO'
      LookupDataSet = cdsTipoDocumento
      LookupKeyFields = 'CD_TIPO_DOCTO'
      LookupResultField = 'NM_TIPO_DOCTO'
      KeyFields = 'CD_ARQUIVO'
      LookupCache = True
      ProviderFlags = []
      Size = 60
      Lookup = True
    end
    object cdsConfigArquivoEmpresaCD_CONFIG_ENVIO_EMAIL: TIntegerField
      FieldName = 'CD_CONFIG_ENVIO_EMAIL'
      ProviderFlags = [pfInUpdate]
    end
    object cdsConfigArquivoEmpresaNM_ASSUNTO: TStringField
      FieldName = 'NM_ASSUNTO'
      ProviderFlags = [pfInUpdate]
      FixedChar = True
      Size = 200
    end
    object cdsConfigArquivoEmpresaNM_DESTINATARIO: TStringField
      FieldName = 'NM_DESTINATARIO'
      ProviderFlags = [pfInUpdate]
      FixedChar = True
      Size = 200
    end
    object cdsConfigArquivoEmpresaNM_COPIA: TStringField
      FieldName = 'NM_COPIA'
      ProviderFlags = [pfInUpdate]
      FixedChar = True
      Size = 200
    end
    object cdsConfigArquivoEmpresaNM_CORPO: TStringField
      FieldName = 'NM_CORPO'
      ProviderFlags = [pfInUpdate]
      FixedChar = True
      Size = 200
    end
  end
  object qryConfigArquivoEmpresa: TSQLQuery
    MaxBlobSize = -1
    Params = <>
    SQL.Strings = (
      'SELECT   CD_CONFIG_ENVIO_EMAIL_EMP_ARQ'
      #9#9',CD_CONFIG_ENVIO_EMAIL_EMP'
      '        ,CD_CONFIG_ENVIO_EMAIL'
      #9#9',CD_ARQUIVO'
      #9#9',NM_ASSUNTO'
      #9#9',NM_DESTINATARIO'
      #9#9',NM_COPIA'
      #9#9',NM_CORPO'
      'FROM TCONFIG_ENVIO_EMAIL_EMPRESAS_ARQUIVOS WITH(NOLOCK)')
    SQLConnection = SQLConnection
    Left = 493
    Top = 276
    object qryConfigArquivoEmpresaCD_CONFIG_ENVIO_EMAIL_EMP_ARQ: TIntegerField
      FieldName = 'CD_CONFIG_ENVIO_EMAIL_EMP_ARQ'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      ReadOnly = True
    end
    object qryConfigArquivoEmpresaCD_CONFIG_ENVIO_EMAIL_EMP: TIntegerField
      FieldName = 'CD_CONFIG_ENVIO_EMAIL_EMP'
    end
    object qryConfigArquivoEmpresaCD_ARQUIVO: TIntegerField
      FieldName = 'CD_ARQUIVO'
    end
    object qryConfigArquivoEmpresaCD_CONFIG_ENVIO_EMAIL: TIntegerField
      FieldName = 'CD_CONFIG_ENVIO_EMAIL'
    end
    object qryConfigArquivoEmpresaNM_ASSUNTO: TStringField
      FieldName = 'NM_ASSUNTO'
      FixedChar = True
      Size = 200
    end
    object qryConfigArquivoEmpresaNM_DESTINATARIO: TStringField
      FieldName = 'NM_DESTINATARIO'
      FixedChar = True
      Size = 200
    end
    object qryConfigArquivoEmpresaNM_COPIA: TStringField
      FieldName = 'NM_COPIA'
      FixedChar = True
      Size = 200
    end
    object qryConfigArquivoEmpresaNM_CORPO: TStringField
      FieldName = 'NM_CORPO'
      FixedChar = True
      Size = 200
    end
  end
  object qryEmpresa: TSQLQuery
    MaxBlobSize = -1
    Params = <>
    SQL.Strings = (
      'SELECT CD_EMPRESA, NM_EMPRESA'
      '  FROM TEMPRESA_NAC WITH(NOLOCK)'
      'ORDER BY NM_EMPRESA ')
    SQLConnection = SQLConnection
    Left = 533
    Top = 24
    object qryEmpresaCD_EMPRESA: TStringField
      FieldName = 'CD_EMPRESA'
      Required = True
      FixedChar = True
      Size = 5
    end
    object qryEmpresaNM_EMPRESA: TStringField
      FieldName = 'NM_EMPRESA'
      FixedChar = True
      Size = 80
    end
  end
  object dsEmpresa: TDataSource
    DataSet = cdsEmpresa
    Left = 530
    Top = 201
  end
  object cdsEmpresa: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspEmpresa'
    AfterScroll = cdsEmpresaAfterScroll
    Left = 528
    Top = 144
    object cdsEmpresaCD_EMPRESA: TStringField
      FieldName = 'CD_EMPRESA'
      Required = True
      FixedChar = True
      Size = 5
    end
    object cdsEmpresaNM_EMPRESA: TStringField
      FieldName = 'NM_EMPRESA'
      FixedChar = True
      Size = 80
    end
  end
  object dspEmpresa: TDataSetProvider
    DataSet = qryEmpresa
    Left = 528
    Top = 80
  end
  object dsListaEmpresa: TDataSource
    DataSet = cdsListaEmpresa
    Left = 616
    Top = 201
  end
  object qryListaEmpresa: TSQLQuery
    MaxBlobSize = -1
    Params = <>
    SQL.Strings = (
      'SELECT CD_CONFIG_ENVIO_EMAIL_EMP'
      '     , CD_CONFIG_ENVIO_EMAIL'
      '     , B.CD_EMPRESA'
      '     , B.NM_EMPRESA'
      '  FROM TCONFIG_ENVIO_EMAIL_EMPRESAS A WITH(NOLOCK)'
      
        '  JOIN TEMPRESA_NAC                 B WITH(NOLOCK) ON B.CD_EMPRE' +
        'SA = A.CD_EMPRESA'
      'ORDER BY NM_EMPRESA ')
    SQLConnection = SQLConnection
    Left = 621
    Top = 20
    object qryListaEmpresaCD_CONFIG_ENVIO_EMAIL_EMP: TIntegerField
      FieldName = 'CD_CONFIG_ENVIO_EMAIL_EMP'
    end
    object qryListaEmpresaCD_CONFIG_ENVIO_EMAIL: TIntegerField
      FieldName = 'CD_CONFIG_ENVIO_EMAIL'
    end
    object qryListaEmpresaCD_EMPRESA: TStringField
      FieldName = 'CD_EMPRESA'
      Required = True
      FixedChar = True
      Size = 5
    end
    object qryListaEmpresaNM_EMPRESA: TStringField
      FieldName = 'NM_EMPRESA'
      FixedChar = True
      Size = 80
    end
  end
  object dspListaEmpresa: TDataSetProvider
    DataSet = qryListaEmpresa
    Left = 619
    Top = 80
  end
  object cdsListaEmpresa: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspListaEmpresa'
    Left = 619
    Top = 144
    object cdsListaEmpresaCD_CONFIG_ENVIO_EMAIL_EMP: TIntegerField
      FieldName = 'CD_CONFIG_ENVIO_EMAIL_EMP'
    end
    object cdsListaEmpresaCD_CONFIG_ENVIO_EMAIL: TIntegerField
      FieldName = 'CD_CONFIG_ENVIO_EMAIL'
    end
    object cdsListaEmpresaCD_EMPRESA: TStringField
      FieldName = 'CD_EMPRESA'
      Required = True
      FixedChar = True
      Size = 5
    end
    object cdsListaEmpresaNM_EMPRESA: TStringField
      FieldName = 'NM_EMPRESA'
      FixedChar = True
      Size = 80
    end
  end
end
