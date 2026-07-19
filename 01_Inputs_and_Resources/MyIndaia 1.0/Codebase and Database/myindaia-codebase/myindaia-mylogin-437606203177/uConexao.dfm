object dtmConexao: TdtmConexao
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Height = 635
  Width = 752
  object qrySistemas: TSQLQuery
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftString
        Name = 'CD_CARGO'
        ParamType = ptInput
        Size = 4
        Value = '001'
      end>
    SQL.Strings = (
      'SELECT S.*'
      
        'FROM TB_SISTEMA S INNER JOIN TB_CARGO_SISTEMA CS ON CS.CD_SISTEM' +
        'A = S.CD_SISTEMA'
      'WHERE CS.CD_CARGO = :CD_CARGO'
      '  AND CS.IN_ATIVO = '#39'1'#39
      'ORDER BY S.NM_SISTEMA')
    SQLConnection = Connection
    Left = 224
    Top = 128
    object qrySistemasCD_SISTEMA: TIntegerField
      FieldName = 'CD_SISTEMA'
      Required = True
    end
    object qrySistemasNM_SISTEMA: TStringField
      FieldName = 'NM_SISTEMA'
      Size = 50
    end
    object qrySistemasNM_APLICATIVO: TStringField
      FieldName = 'NM_APLICATIVO'
      Size = 1000
    end
    object qrySistemasNM_PROCESSO: TStringField
      FieldName = 'NM_PROCESSO'
      Size = 255
    end
    object qrySistemasDT_STOP: TSQLTimeStampField
      FieldName = 'DT_STOP'
    end
    object qrySistemasNM_ARQUIVO_SCRIPT: TStringField
      FieldName = 'NM_ARQUIVO_SCRIPT'
      Size = 1000
    end
    object qrySistemasNM_APLICATIVO_PARAM: TStringField
      FieldName = 'NM_APLICATIVO_PARAM'
      Size = 1000
    end
  end
  object qryUsuario: TSQLQuery
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftWideString
        Name = 'AP_USUARIO'
        ParamType = ptInput
        Value = 'MF'
      end>
    SQL.Strings = (
      'SELECT U.CD_USUARIO,'
      '       C.CD_CARGO,'
      '       C.NM_CARGO,'
      '       RTRIM(U.NM_USUARIO) AS NM_USUARIO,'
      '       RTRIM(U.AP_USUARIO) AS AP_USUARIO,'
      '       RTRIM(U.NM_EMAIL) AS NM_EMAIL,'
      '       ISNULL(U.IN_MANAGER, '#39#39') AS IN_MANAGER'
      'FROM VW_USUARIO U'
      'INNER JOIN VW_CARGO C ON C.CD_CARGO = U.CD_CARGO'
      'WHERE U.AP_USUARIO = :AP_USUARIO'
      '  AND U.IN_ATIVO = '#39'1'#39
      '  AND C.IN_ATIVO = '#39'1'#39)
    SQLConnection = Connection
    Left = 224
    Top = 16
    object qryUsuarioCD_USUARIO: TStringField
      FieldName = 'CD_USUARIO'
      Required = True
      FixedChar = True
      Size = 4
    end
    object qryUsuarioCD_CARGO: TStringField
      FieldName = 'CD_CARGO'
      Required = True
      FixedChar = True
      Size = 3
    end
    object qryUsuarioNM_CARGO: TStringField
      FieldName = 'NM_CARGO'
      FixedChar = True
      Size = 40
    end
    object qryUsuarioNM_USUARIO: TStringField
      FieldName = 'NM_USUARIO'
      Size = 50
    end
    object qryUsuarioAP_USUARIO: TStringField
      FieldName = 'AP_USUARIO'
      Size = 15
    end
    object qryUsuarioNM_EMAIL: TStringField
      FieldName = 'NM_EMAIL'
      Size = 255
    end
    object qryUsuarioIN_MANAGER: TStringField
      FieldName = 'IN_MANAGER'
      Required = True
      FixedChar = True
      Size = 1
    end
  end
  object qrySP_WHO: TSQLQuery
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftString
        Name = 'LOGIN'
        ParamType = ptInput
        Size = 3
        Value = 'mf'
      end>
    SQL.Strings = (
      'EXEC SP_WHO :LOGIN')
    SQLConnection = Connection
    Left = 224
    Top = 72
    object qrySP_WHOspid: TSmallintField
      FieldName = 'spid'
      Required = True
    end
    object qrySP_WHOecid: TSmallintField
      FieldName = 'ecid'
      Required = True
    end
    object qrySP_WHOstatus: TWideStringField
      FieldName = 'status'
      Required = True
      FixedChar = True
      Size = 60
    end
    object qrySP_WHOloginame: TWideStringField
      FieldName = 'loginame'
      Size = 256
    end
    object qrySP_WHOhostname: TWideStringField
      FieldName = 'hostname'
      Required = True
      FixedChar = True
      Size = 256
    end
    object qrySP_WHOblk: TStringField
      FieldName = 'blk'
      FixedChar = True
      Size = 5
    end
    object qrySP_WHOdbname: TWideStringField
      FieldName = 'dbname'
      Size = 256
    end
    object qrySP_WHOcmd: TWideStringField
      FieldName = 'cmd'
      Required = True
      FixedChar = True
      Size = 32
    end
    object qrySP_WHOrequest_id: TIntegerField
      FieldName = 'request_id'
      Required = True
    end
  end
  object cmdAlteraSenha: TADOCommand
    Connection = ADOConnection
    Parameters = <>
    Left = 160
    Top = 439
  end
  object ADOConnection: TADOConnection
    ConnectionString = 
      'Provider=SQLOLEDB.1;Password=123;Persist Security Info=True;User' +
      ' ID=SA;Initial Catalog=MYLOGIN;Data Source=INDAIA10;Use Procedur' +
      'e for Prepare=1;Auto Translate=True;Packet Size=4096;Workstation' +
      ' ID=INDAIA-STS-260;Use Encryption for Data=False;Tag with column' +
      ' collation when possible=False'
    LoginPrompt = False
    Provider = 'SQLOLEDB.1'
    Left = 56
    Top = 440
  end
  object qrySenhas: TADOQuery
    Connection = ADOConnection
    CursorType = ctStatic
    Parameters = <
      item
        Name = 'AP_USUARIO'
        DataType = ftString
        NumericScale = 255
        Precision = 255
        Size = 15
        Value = Null
      end>
    SQL.Strings = (
      
        'SELECT CONVERT(INT, U.CD_USUARIO) AS CD_USUARIO, US.DT_SENHA, US' +
        '.NM_SENHA'
      
        'FROM VW_USUARIO U LEFT JOIN TB_USUARIO_SENHAS US ON US.CD_USUARI' +
        'O = U.CD_USUARIO'
      
        '                                            AND US.DT_SENHA >= C' +
        'ONVERT(DATETIME, DATEADD(MONTH, -12, GETDATE()), 103)'
      'WHERE U.AP_USUARIO = :AP_USUARIO')
    Left = 160
    Top = 503
    object qrySenhasCD_USUARIO: TIntegerField
      FieldName = 'CD_USUARIO'
      ReadOnly = True
    end
    object qrySenhasDT_SENHA: TDateTimeField
      FieldName = 'DT_SENHA'
    end
    object qrySenhasNM_SENHA: TStringField
      FieldName = 'NM_SENHA'
      Size = 50
    end
  end
  object qryUltimaAlteracaosenha: TADOQuery
    Connection = ADOConnection
    CursorType = ctStatic
    Parameters = <
      item
        Name = 'AP_USUARIO'
        DataType = ftString
        NumericScale = 255
        Precision = 255
        Size = 15
        Value = Null
      end>
    SQL.Strings = (
      
        'SELECT DATEDIFF(DAY, MAX(ISNULL(US.DT_SENHA, 0)), GETDATE()) AS ' +
        'QTD_DIAS'
      
        'FROM VW_USUARIO U LEFT JOIN TB_USUARIO_SENHAS US ON US.CD_USUARI' +
        'O = U.CD_USUARIO'
      
        '                                            AND US.DT_SENHA >= C' +
        'ONVERT(DATETIME, DATEADD(MONTH, -12, GETDATE()), 103)'
      'WHERE U.AP_USUARIO = :AP_USUARIO')
    Left = 56
    Top = 504
    object qryUltimaAlteracaosenhaQTD_DIAS: TIntegerField
      FieldName = 'QTD_DIAS'
      ReadOnly = True
    end
  end
  object qryParametros: TSQLQuery
    MaxBlobSize = -1
    Params = <>
    SQL.Strings = (
      'SELECT NM_HOST, NR_PORTA, NM_LOGIN, NM_SENHA'
      'FROM broker.dbo.VW_CONFIG_MAIL')
    SQLConnection = Connection
    Left = 224
    Top = 184
    object qryParametrosNM_HOST: TStringField
      FieldName = 'NM_HOST'
      Size = 100
    end
    object qryParametrosNR_PORTA: TIntegerField
      FieldName = 'NR_PORTA'
    end
    object qryParametrosNM_LOGIN: TStringField
      FieldName = 'NM_LOGIN'
      Size = 100
    end
    object qryParametrosNM_SENHA: TStringField
      FieldName = 'NM_SENHA'
      Size = 100
    end
  end
  object dspUsuario: TDataSetProvider
    DataSet = qryUsuario
    Left = 128
    Top = 16
  end
  object dspSP_WHO: TDataSetProvider
    DataSet = qrySP_WHO
    Left = 128
    Top = 72
  end
  object dspSistemas: TDataSetProvider
    DataSet = qrySistemas
    Left = 128
    Top = 128
  end
  object dspParametros: TDataSetProvider
    DataSet = qryParametros
    Left = 128
    Top = 184
  end
  object cdsUsuario: TClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftWideString
        Name = 'AP_USUARIO'
        ParamType = ptInput
        Value = 'MF'
      end>
    ProviderName = 'dspUsuario'
    Left = 336
    Top = 16
    object cdsUsuarioCD_USUARIO: TStringField
      FieldName = 'CD_USUARIO'
      Required = True
      FixedChar = True
      Size = 4
    end
    object cdsUsuarioCD_CARGO: TStringField
      FieldName = 'CD_CARGO'
      Required = True
      FixedChar = True
      Size = 3
    end
    object cdsUsuarioNM_CARGO: TStringField
      FieldName = 'NM_CARGO'
      FixedChar = True
      Size = 40
    end
    object cdsUsuarioNM_USUARIO: TStringField
      FieldName = 'NM_USUARIO'
      Size = 50
    end
    object cdsUsuarioAP_USUARIO: TStringField
      FieldName = 'AP_USUARIO'
      Size = 15
    end
    object cdsUsuarioNM_EMAIL: TStringField
      FieldName = 'NM_EMAIL'
      Size = 255
    end
    object cdsUsuarioIN_MANAGER: TStringField
      FieldName = 'IN_MANAGER'
      Required = True
      FixedChar = True
      Size = 1
    end
  end
  object cdsSP_WHO: TClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftString
        Name = 'LOGIN'
        ParamType = ptInput
        Size = 3
      end>
    ProviderName = 'dspSP_WHO'
    Left = 336
    Top = 72
    object cdsSP_WHOspid: TSmallintField
      FieldName = 'spid'
      Required = True
    end
    object cdsSP_WHOecid: TSmallintField
      FieldName = 'ecid'
      Required = True
    end
    object cdsSP_WHOstatus: TWideStringField
      FieldName = 'status'
      Required = True
      FixedChar = True
      Size = 60
    end
    object cdsSP_WHOloginame: TWideStringField
      FieldName = 'loginame'
      Size = 256
    end
    object cdsSP_WHOhostname: TWideStringField
      FieldName = 'hostname'
      Required = True
      FixedChar = True
      Size = 256
    end
    object cdsSP_WHOblk: TStringField
      FieldName = 'blk'
      FixedChar = True
      Size = 5
    end
    object cdsSP_WHOdbname: TWideStringField
      FieldName = 'dbname'
      Size = 256
    end
    object cdsSP_WHOcmd: TWideStringField
      FieldName = 'cmd'
      Required = True
      FixedChar = True
      Size = 32
    end
    object cdsSP_WHOrequest_id: TIntegerField
      FieldName = 'request_id'
      Required = True
    end
  end
  object cdsSistemas: TClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftString
        Name = 'CD_CARGO'
        ParamType = ptInput
        Size = 4
        Value = '001'
      end>
    ProviderName = 'dspSistemas'
    Left = 336
    Top = 128
    object cdsSistemasCD_SISTEMA: TIntegerField
      FieldName = 'CD_SISTEMA'
      Required = True
    end
    object cdsSistemasNM_SISTEMA: TStringField
      FieldName = 'NM_SISTEMA'
      Size = 50
    end
    object cdsSistemasNM_APLICATIVO: TStringField
      FieldName = 'NM_APLICATIVO'
      Size = 1000
    end
    object cdsSistemasNM_PROCESSO: TStringField
      FieldName = 'NM_PROCESSO'
      Size = 255
    end
    object cdsSistemasDT_STOP: TSQLTimeStampField
      FieldName = 'DT_STOP'
    end
    object cdsSistemasNM_ARQUIVO_SCRIPT: TStringField
      FieldName = 'NM_ARQUIVO_SCRIPT'
      Size = 1000
    end
    object cdsSistemasNM_APLICATIVO_PARAM: TStringField
      FieldName = 'NM_APLICATIVO_PARAM'
      Size = 1000
    end
  end
  object cdsParametros: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspParametros'
    Left = 336
    Top = 184
    object cdsParametrosNM_HOST: TStringField
      FieldName = 'NM_HOST'
      Size = 100
    end
    object cdsParametrosNR_PORTA: TIntegerField
      FieldName = 'NR_PORTA'
    end
    object cdsParametrosNM_LOGIN: TStringField
      FieldName = 'NM_LOGIN'
      Size = 100
    end
    object cdsParametrosNM_SENHA: TStringField
      FieldName = 'NM_SENHA'
      Size = 100
    end
  end
  object qrySistemasParados: TSQLQuery
    MaxBlobSize = -1
    Params = <>
    SQL.Strings = (
      'SELECT S.*'
      'FROM TB_SISTEMA S'
      'WHERE DT_STOP IS NOT NULL')
    SQLConnection = Connection
    Left = 224
    Top = 248
    object IntegerField1: TIntegerField
      FieldName = 'CD_SISTEMA'
      Required = True
    end
    object StringField1: TStringField
      FieldName = 'NM_SISTEMA'
      Size = 50
    end
    object StringField2: TStringField
      FieldName = 'NM_APLICATIVO'
      Size = 1000
    end
    object StringField3: TStringField
      FieldName = 'NM_PROCESSO'
      Size = 255
    end
    object qrySistemasParadosDT_STOP: TSQLTimeStampField
      FieldName = 'DT_STOP'
    end
  end
  object dspSistemasParados: TDataSetProvider
    DataSet = qrySistemasParados
    Left = 128
    Top = 248
  end
  object cdsSistemasParados: TClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftString
        Name = 'CD_CARGO'
        ParamType = ptInput
        Size = 4
        Value = '001'
      end>
    ProviderName = 'dspSistemasParados'
    Left = 336
    Top = 248
    object cdsSistemasParadosCD_SISTEMA: TIntegerField
      FieldName = 'CD_SISTEMA'
      Required = True
    end
    object cdsSistemasParadosNM_SISTEMA: TStringField
      FieldName = 'NM_SISTEMA'
      Size = 50
    end
    object cdsSistemasParadosNM_APLICATIVO: TStringField
      FieldName = 'NM_APLICATIVO'
      Size = 1000
    end
    object cdsSistemasParadosNM_PROCESSO: TStringField
      FieldName = 'NM_PROCESSO'
      Size = 255
    end
    object cdsSistemasParadosDT_STOP: TSQLTimeStampField
      FieldName = 'DT_STOP'
    end
  end
  object TimerSistemasParados: TTimer
    Interval = 30000
    OnTimer = TimerSistemasParadosTimer
    Left = 464
    Top = 184
  end
  object TimerParar: TTimer
    Enabled = False
    OnTimer = TimerPararTimer
    Left = 464
    Top = 240
  end
  object qryConsulta: TSQLQuery
    MaxBlobSize = -1
    Params = <>
    SQLConnection = Connection
    Left = 224
    Top = 304
  end
  object Connection: TSQLConnection
    ConnectionName = 'MSSQLConnection'
    DriverName = 'MSSQL'
    GetDriverFunc = 'getSQLDriverMSSQL'
    LibraryName = 'dbxmss.dll'
    LoginPrompt = False
    Params.Strings = (
      'DriverUnit=DBXMSSQL'
      
        'DriverPackageLoader=TDBXDynalinkDriverLoader,DBXCommonDriver150.' +
        'bpl'
      
        'DriverAssemblyLoader=Borland.Data.TDBXDynalinkDriverLoader,Borla' +
        'nd.Data.DbxCommonDriver,Version=15.0.0.0,Culture=neutral,PublicK' +
        'eyToken=91d62ebb5b0d1b1b'
      
        'MetaDataPackageLoader=TDBXMsSqlMetaDataCommandFactory,DbxMSSQLDr' +
        'iver150.bpl'
      
        'MetaDataAssemblyLoader=Borland.Data.TDBXMsSqlMetaDataCommandFact' +
        'ory,Borland.Data.DbxMSSQLDriver,Version=15.0.0.0,Culture=neutral' +
        ',PublicKeyToken=91d62ebb5b0d1b1b'
      'GetDriverFunc=getSQLDriverMSSQL'
      'LibraryName=dbxmss.dll'
      'VendorLib=sqlncli10.dll'
      'MaxBlobSize=-1'
      'OSAuthentication=False'
      'PrepareSQL=True'
      'SchemaOverride=sa.dbo'
      'DriverName=MSSQL'
      'HostName=INDAIA10'
      'Database=MYLOGIN'
      'BlobSize=-1'
      'ErrorResourceFile='
      'LocaleCode=0000'
      'IsolationLevel=ReadCommitted'
      'OS Authentication=False'
      'Prepare SQL=False'
      'ConnectTimeout=60'
      'Mars_Connection=False'
      'User_Name=user'
      'Password=password')
    VendorLib = 'sqlncli10.dll'
    BeforeDisconnect = ConnectionBeforeDisconnect
    Left = 40
    Top = 16
  end
  object ConnectionBroker: TSQLConnection
    ConnectionName = 'MSSQLConnection'
    DriverName = 'MSSQL'
    GetDriverFunc = 'getSQLDriverMSSQL'
    LibraryName = 'dbxmss.dll'
    LoginPrompt = False
    Params.Strings = (
      'DriverUnit=DBXMSSQL'
      
        'DriverPackageLoader=TDBXDynalinkDriverLoader,DBXCommonDriver150.' +
        'bpl'
      
        'DriverAssemblyLoader=Borland.Data.TDBXDynalinkDriverLoader,Borla' +
        'nd.Data.DbxCommonDriver,Version=15.0.0.0,Culture=neutral,PublicK' +
        'eyToken=91d62ebb5b0d1b1b'
      
        'MetaDataPackageLoader=TDBXMsSqlMetaDataCommandFactory,DbxMSSQLDr' +
        'iver150.bpl'
      
        'MetaDataAssemblyLoader=Borland.Data.TDBXMsSqlMetaDataCommandFact' +
        'ory,Borland.Data.DbxMSSQLDriver,Version=15.0.0.0,Culture=neutral' +
        ',PublicKeyToken=91d62ebb5b0d1b1b'
      'GetDriverFunc=getSQLDriverMSSQL'
      'LibraryName=dbxmss.dll'
      'VendorLib=sqlncli10.dll'
      'MaxBlobSize=-1'
      'OSAuthentication=False'
      'PrepareSQL=True'
      'SchemaOverride=sa.dbo'
      'DriverName=MSSQL'
      'HostName=INDAIA10'
      'Database=BROKER'
      'BlobSize=-1'
      'ErrorResourceFile='
      'LocaleCode=0000'
      'IsolationLevel=ReadCommitted'
      'OS Authentication=False'
      'Prepare SQL=False'
      'ConnectTimeout=60'
      'Mars_Connection=False'
      'User_Name=SA'
      'Password=123')
    VendorLib = 'sqlncli10.dll'
    BeforeDisconnect = ConnectionBeforeDisconnect
    Left = 344
    Top = 448
  end
  object qryTemp: TSQLQuery
    MaxBlobSize = -1
    Params = <>
    SQLConnection = ConnectionBroker
    Left = 416
    Top = 448
  end
end
