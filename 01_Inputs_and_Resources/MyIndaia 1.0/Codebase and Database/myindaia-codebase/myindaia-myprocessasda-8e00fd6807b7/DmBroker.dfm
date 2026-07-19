object dmdBroker: TdmdBroker
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Height = 301
  Width = 431
  object IdSSLIOHandlerSocketOpenSSL1: TIdSSLIOHandlerSocketOpenSSL
    Destination = ':587'
    MaxLineAction = maException
    Port = 587
    DefaultPort = 0
    SSLOptions.Method = sslvTLSv1_2
    SSLOptions.SSLVersions = [sslvTLSv1_2]
    SSLOptions.Mode = sslmClient
    SSLOptions.VerifyMode = []
    SSLOptions.VerifyDepth = 0
    Left = 239
    Top = 216
  end
  object IdMessage1: TIdMessage
    AttachmentEncoding = 'UUE'
    BccList = <>
    CCList = <>
    Encoding = meDefault
    FromList = <
      item
      end>
    Recipients = <>
    ReplyTo = <>
    ConvertPreamble = True
    Left = 47
    Top = 216
  end
  object IdSMTP1: TIdSMTP
    IOHandler = IdSSLIOHandlerSocketOpenSSL1
    SASLMechanisms = <>
    Left = 127
    Top = 216
  end
  object qryBroker: TFDQuery
    Connection = dbBroker
    Left = 136
    Top = 16
  end
  object dbBroker: TFDConnection
    ConnectionName = 'Broker'
    Params.Strings = (
      'Database=BROKER'
      'User_Name=SA'
      'Password=123'
      'Server=INDAIA10'
      'DriverID=MSSQL')
    Connected = True
    LoginPrompt = False
    Left = 24
    Top = 16
  end
  object qryFilaDespachante: TFDQuery
    Connection = dbBroker
    SQL.Strings = (
      'SELECT DISTINCT '
      '       --S.NR_PROCESSO, '
      '       D.CD_DESPACHANTE,'
      '       LTRIM(RTRIM(D.NR_REGISTRO)) AS NR_REGISTRO,'
      '       LTRIM(RTRIM(D.NR_REGISTRO_RJ)) AS NR_REGISTRO_RJ,'
      '       D.CPF_DESPACHANTE'
      '       --SUBSTRING( S.NR_PROCESSO, 5, 14 ) AS CALCPROCESSO, '
      '       --S.IN_EMITE,'
      '       --S.VL_BASE_CALCULO,'
      '       --S.VL_SDA, '
      '       --S.VL_CONTR_ASSIST, '
      '       --S.VL_COMPL, '
      '       --(S.VL_SDA + S.VL_CONTR_ASSIST) AS SOMA'
      'FROM   TPROCESSO_SDA          S  (NOLOCK)'
      
        '  INNER JOIN TPROCESSO        P  (NOLOCK) ON S.NR_PROCESSO    = ' +
        'P.NR_PROCESSO'
      
        '  INNER JOIN TDESPACHANTE     D  (NOLOCK) ON D.CD_DESPACHANTE = ' +
        'S.CD_DESPACHANTE'
      
        '  INNER JOIN VW_SERVICO_GERAL SE (NOLOCK) ON P.CD_SERVICO     = ' +
        'SE.CD_SERVICO'
      ''
      'WHERE P.DT_ABERTURA >= '#39'2017/01/01'#39
      '  AND P.IN_CANCELADO = '#39'0'#39' '
      '  AND P.IN_LIBERADO  = '#39'1'#39' '
      '  AND S.IN_EMITE     = '#39'1'#39
      '  '
      ''
      '')
    Left = 104
    Top = 88
  end
  object qryDadosSDA: TFDQuery
    Connection = dbBroker
    Left = 232
    Top = 96
  end
  object qryDespachante: TFDQuery
    Connection = dbBroker
    SQL.Strings = (
      'SELECT NM_DESPACHANTE, '
      '       LTRIM(RTRIM(NR_REGISTRO)) AS NR_REGISTRO, '
      '       CPF_DESPACHANTE, '
      '       DS_SENHA_SDA,'
      '       SUBSTRING(CPF_DESPACHANTE,1,3)+'#39'.'#39'+'
      '       SUBSTRING(CPF_DESPACHANTE,4,3)+'#39'.'#39'+'
      '       SUBSTRING(CPF_DESPACHANTE,7,3)+'#39'-'#39'+'
      '       SUBSTRING(CPF_DESPACHANTE,10,2) AS CPF_FORMATADO,'
      '  DS_SENHA_SDA_RJ,'
      'NR_REGISTRO_RJ'
      'FROM TDESPACHANTE (NOLOCK)'
      ''
      ''
      '')
    Left = 256
    Top = 8
    object qryDespachanteNM_DESPACHANTE: TStringField
      FieldName = 'NM_DESPACHANTE'
      Origin = 'NM_DESPACHANTE'
      Size = 50
    end
    object qryDespachanteNR_REGISTRO: TStringField
      FieldName = 'NR_REGISTRO'
      Origin = 'NR_REGISTRO'
      ReadOnly = True
      Size = 9
    end
    object qryDespachanteCPF_DESPACHANTE: TStringField
      FieldName = 'CPF_DESPACHANTE'
      Origin = 'CPF_DESPACHANTE'
      FixedChar = True
      Size = 11
    end
    object qryDespachanteDS_SENHA_SDA: TStringField
      FieldName = 'DS_SENHA_SDA'
      Origin = 'DS_SENHA_SDA'
      FixedChar = True
      Size = 10
    end
    object qryDespachanteCPF_FORMATADO: TStringField
      FieldName = 'CPF_FORMATADO'
      Origin = 'CPF_FORMATADO'
      ReadOnly = True
      Size = 14
    end
    object qryDespachanteDS_SENHA_SDA_RJ: TStringField
      FieldName = 'DS_SENHA_SDA_RJ'
      Origin = 'DS_SENHA_SDA_RJ'
      FixedChar = True
      Size = 15
    end
    object qryDespachanteNR_REGISTRO_RJ: TStringField
      FieldName = 'NR_REGISTRO_RJ'
      Origin = 'NR_REGISTRO_RJ'
      FixedChar = True
      Size = 4
    end
  end
  object qryInserePgmtoWallet: TFDQuery
    Connection = dbBroker
    SQL.Strings = (
      'DECLARE @RESULTADO VARCHAR(50)'
      ''
      
        'EXEC SP_INSERE_PGMTO_SDA_WALLET :NR_PROCESSO, :VALOR_DEBITO, @RE' +
        'SULTADO OUTPUT'
      ''
      'SELECT @RESULTADO AS RESULTADO')
    Left = 104
    Top = 144
    ParamData = <
      item
        Name = 'NR_PROCESSO'
        ParamType = ptInput
      end
      item
        Name = 'VALOR_DEBITO'
        DataType = ftFloat
        FDDataType = dtDouble
        ParamType = ptInput
      end>
  end
  object qryVerificaPgmtoJaLancado: TFDQuery
    Connection = dbBroker
    SQL.Strings = (
      'DECLARE @NR_PROCESSO CHAR(18)'
      'SET @NR_PROCESSO = :NR_PROCESSO'
      ''
      'DECLARE @VALOR_PGMTO NUMERIC(15,2)'
      'SET @VALOR_PGMTO =:VALOR_DEBITO'
      ''
      'SELECT DBO.FN_PGMTO_SDA_LANCADO(@NR_PROCESSO,@VALOR_PGMTO) AS ID')
    Left = 240
    Top = 144
    ParamData = <
      item
        Name = 'NR_PROCESSO'
        DataType = ftString
        FDDataType = dtAnsiString
        ParamType = ptInput
      end
      item
        Name = 'VALOR_DEBITO'
        DataType = ftFloat
        FDDataType = dtDouble
        ParamType = ptInput
      end>
    object qryVerificaPgmtoJaLancadoID: TLargeintField
      FieldName = 'ID'
      Origin = 'ID'
      ReadOnly = True
    end
  end
  object qryUpdateProcessoSDA: TFDQuery
    Connection = dbBroker
    SQL.Strings = (
      ' UPDATE TPROCESSO_SDA         '
      ' SET CD_STATUS         = '#39'2'#39'  '
      '   , IN_EMITE          = '#39'0'#39'  '
      '/*   , CD_USUARIO_EMITE  = '#39#39'  */'
      '   , CD_USUARIO_CANCEL = '#39#39'   '
      '   , CD_EMISSOR        = CD_USUARIO_EMITE'
      '   , DT_CANCEL         = NULL '
      '   , DT_EMISSAO        = GETDATE()'
      'FROM TPROCESSO_SDA '
      'WHERE NR_PROCESSO = :NR_PROCESSO')
    Left = 344
    Top = 112
    ParamData = <
      item
        Name = 'NR_PROCESSO'
        DataType = ftString
        FDDataType = dtAnsiString
        ParamType = ptInput
      end>
  end
end
