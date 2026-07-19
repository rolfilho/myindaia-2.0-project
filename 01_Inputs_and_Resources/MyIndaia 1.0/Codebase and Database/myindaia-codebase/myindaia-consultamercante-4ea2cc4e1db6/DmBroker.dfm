object dmdBroker: TdmdBroker
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Height = 229
  Width = 363
  object IdSSLIOHandlerSocketOpenSSL1: TIdSSLIOHandlerSocketOpenSSL
    Destination = ':25'
    MaxLineAction = maException
    Port = 25
    DefaultPort = 0
    SSLOptions.Mode = sslmUnassigned
    SSLOptions.VerifyMode = []
    SSLOptions.VerifyDepth = 0
    Left = 231
    Top = 142
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
    Left = 231
    Top = 24
  end
  object IdSMTP1: TIdSMTP
    IOHandler = IdSSLIOHandlerSocketOpenSSL1
    SASLMechanisms = <>
    Left = 231
    Top = 72
  end
  object qryFila: TFDQuery
    Connection = dbBroker
    FetchOptions.AssignedValues = [evRowsetSize]
    FetchOptions.RowsetSize = -1
    Left = 144
    Top = 72
  end
  object qryBroker: TFDQuery
    Connection = dbBroker
    Left = 144
    Top = 16
  end
  object qryUpdateEvento: TFDQuery
    Connection = dbBroker
    SQL.Strings = (
      ' UPDATE TFOLLOWUP                     '
      '    SET DT_REALIZACAO = GETDATE()    '
      '          ,CD_RESP_REALIZACAO = '#39'0707'#39' '
      '   FROM TFOLLOWUP WITH(NOLOCK)        '
      '  WHERE NR_PROCESSO = :NR_PROCESSO    '
      '    AND CD_EVENTO   = :CD_EVENTO      ')
    Left = 48
    Top = 160
    ParamData = <
      item
        Name = 'NR_PROCESSO'
        DataType = ftString
        ParamType = ptInput
        Size = 16
      end
      item
        Name = 'CD_EVENTO'
        DataType = ftString
        ParamType = ptInput
        Size = 3
      end>
  end
  object dbBroker: TFDConnection
    ConnectionName = 'Broker'
    Params.Strings = (
      'Database=BROKER'
      'User_Name=SA'
      'Password=123'
      'Server=INDAIA10'
      'DriverID=MSSQL')
    LoginPrompt = False
    Left = 24
    Top = 8
  end
  object qryUpdateProcesso: TFDQuery
    Connection = dbBroker
    SQL.Strings = (
      'UPDATE TPROCESSO'
      '   SET NUM_CE = LTRIM(RTRIM(B.NR_CE_MERCANTE_FILHOTE)),'
      
        '       NR_PRESENCA_CARGA = '#39'CEMERCANTE31032008'#39' + LTRIM(RTRIM(B.' +
        'NR_CE_MERCANTE_FILHOTE)),'
      #9'   NR_MANIFESTO = LTRIM(RTRIM(B1.NR_MANIFESTO))'
      '  FROM TPROCESSO                A WITH(NOLOCK)'
      
        '  JOIN TDADOS_CONHECIMENTO_SITE B WITH(NOLOCK)ON B.NR_PROCESSO =' +
        ' A.NR_PROCESSO'
      
        '  JOIN TDADOS_CONHECIMENTO_SITE_TERCEIROS B1 WITH(NOLOCK) ON B1.' +
        'NR_BL = B.DS_CONHECIMENTO_EMBARQUE'
      ' WHERE A.NR_PROCESSO = :NR_PROCESSO'
      '   AND LTRIM(RTRIM(ISNULL(A.NUM_CE, '#39#39'))) = '#39#39
      '   AND LTRIM(RTRIM(ISNULL(B.NR_CE_MERCANTE_FILHOTE, '#39#39'))) <> '#39#39)
    Left = 48
    Top = 96
    ParamData = <
      item
        Name = 'NR_PROCESSO'
        ParamType = ptInput
      end>
  end
end
