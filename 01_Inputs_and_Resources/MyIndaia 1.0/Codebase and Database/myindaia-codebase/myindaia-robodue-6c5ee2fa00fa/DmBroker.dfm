object dmdBroker: TdmdBroker
  OldCreateOrder = False
  Height = 191
  Width = 298
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
    Top = 8
  end
  object qryBroker: TFDQuery
    Connection = dbBroker
    Left = 80
    Top = 8
  end
  object IdSSLIOHandlerSocketOpenSSL1: TIdSSLIOHandlerSocketOpenSSL
    Destination = ':25'
    MaxLineAction = maException
    Port = 25
    DefaultPort = 0
    SSLOptions.Method = sslvTLSv1_2
    SSLOptions.SSLVersions = [sslvTLSv1_2]
    SSLOptions.Mode = sslmUnassigned
    SSLOptions.VerifyMode = []
    SSLOptions.VerifyDepth = 0
    Left = 183
    Top = 118
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
    Left = 183
  end
  object IdSMTP1: TIdSMTP
    IOHandler = IdSSLIOHandlerSocketOpenSSL1
    SASLMechanisms = <>
    Left = 183
    Top = 48
  end
  object qryStatus: TFDQuery
    Connection = dbBroker
    SQL.Strings = (
      'SELECT'
      
        'ISNULL(PE.CD_DESPACHANTE, DESPACHANTE_EMPRESA.CD_DESPACHANTE) DE' +
        'SPACHANTE,'
      'P.CD_CLIENTE,'
      'P.NR_PROCESSO,'
      'P.CD_DUE,'
      'F088.DT_REALIZACAO AS DT_REALIZACAO088'
      'FROM TPROCESSO P (NOLOCK)'
      
        'INNER JOIN TFOLLOWUP F124 (NOLOCK)ON F124.NR_PROCESSO = P.NR_PRO' +
        'CESSO AND F124.CD_EVENTO = '#39'124'#39' AND F124.DT_REALIZACAO IS NOT N' +
        'ULL AND F124.IN_APLICAVEL = 1'
      
        'INNER JOIN TFOLLOWUP F141 (NOLOCK)ON F141.NR_PROCESSO = P.NR_PRO' +
        'CESSO AND F141.CD_EVENTO = '#39'141'#39' AND F141.DT_REALIZACAO IS NULL ' +
        'AND F141.IN_APLICAVEL = 1'
      
        'INNER JOIN TFOLLOWUP F088 (NOLOCK)ON F088.NR_PROCESSO = P.NR_PRO' +
        'CESSO AND F088.CD_EVENTO = '#39'088'#39' AND F088.IN_APLICAVEL = 1'
      
        'LEFT JOIN TPROCESSO_EXP PE (NOLOCK) ON PE.NR_PROCESSO = P.NR_PRO' +
        'CESSO'
      
        'OUTER APPLY (SELECT TOP 1 CD_DESPACHANTE FROM TDESPACHANTE_CLIEN' +
        'TE WHERE TIPO='#39'DDE'#39' AND CD_EMPRESA = P.CD_CLIENTE ORDER BY CD_DE' +
        'SPACHANTE) AS DESPACHANTE_EMPRESA                               ' +
        '       '
      'LEFT JOIN TDESPACHANTE DE (NOLOCK) ON DE.CD_DESPACHANTE = '
      
        '                                      ISNULL(PE.CD_DESPACHANTE, ' +
        'DESPACHANTE_EMPRESA.CD_DESPACHANTE)'
      'WHERE P.CD_DUE IS NOT NULL AND P.CD_DUE <> '#39#39
      'AND P.IN_CANCELADO = '#39'0'#39
      'AND LEN(P.CD_DUE) > 12'
      
        'AND ISNULL(PE.CD_DESPACHANTE, DESPACHANTE_EMPRESA.CD_DESPACHANTE' +
        ') = :CD_DESPACHANTE'
      'ORDER BY P.NR_PROCESSO')
    Left = 24
    Top = 64
    ParamData = <
      item
        Name = 'CD_DESPACHANTE'
        DataType = ftString
        ParamType = ptInput
        Value = '003'
      end>
    object qryStatusNR_PROCESSO: TStringField
      FieldName = 'NR_PROCESSO'
      Origin = 'NR_PROCESSO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      FixedChar = True
      Size = 18
    end
    object qryStatusCD_DUE: TStringField
      FieldName = 'CD_DUE'
      Origin = 'CD_DUE'
      Size = 14
    end
    object qryStatusDT_REALIZACAO088: TSQLTimeStampField
      FieldName = 'DT_REALIZACAO088'
      Origin = 'DT_REALIZACAO088'
    end
    object qryStatusDESPACHANTE: TStringField
      FieldName = 'DESPACHANTE'
      Origin = 'DESPACHANTE'
      ReadOnly = True
      FixedChar = True
      Size = 3
    end
    object qryStatusCD_CLIENTE: TStringField
      FieldName = 'CD_CLIENTE'
      Origin = 'CD_CLIENTE'
      FixedChar = True
      Size = 5
    end
  end
  object cdsStatus: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspStatus'
    Left = 80
    Top = 64
    object cdsStatusNR_PROCESSO: TStringField
      FieldName = 'NR_PROCESSO'
      Required = True
      FixedChar = True
      Size = 18
    end
    object cdsStatusCD_DUE: TStringField
      FieldName = 'CD_DUE'
      Size = 14
    end
    object cdsStatusDT_REALIZACAO088: TSQLTimeStampField
      FieldName = 'DT_REALIZACAO088'
    end
  end
  object dspStatus: TDataSetProvider
    DataSet = qryStatus
    Left = 24
    Top = 120
  end
  object QryConsulta: TFDQuery
    Connection = dbBroker
    SQL.Strings = (
      'SELECT'
      '  P.NR_PROCESSO,'
      '  P.CD_DUE,'
      '  F088.DT_REALIZACAO AS DT_REALIZACAO088'
      'FROM TPROCESSO P (NOLOCK)'
      
        'INNER JOIN TFOLLOWUP F124 (NOLOCK)ON F124.NR_PROCESSO = P.NR_PRO' +
        'CESSO AND F124.CD_EVENTO = '#39'124'#39' AND F124.DT_REALIZACAO IS NOT N' +
        'ULL AND F124.IN_APLICAVEL = 1'
      
        'INNER JOIN TFOLLOWUP F141 (NOLOCK)ON F141.NR_PROCESSO = P.NR_PRO' +
        'CESSO AND F141.CD_EVENTO = '#39'141'#39' AND F141.DT_REALIZACAO IS NULL ' +
        'AND F141.IN_APLICAVEL = 1'
      
        'INNER JOIN TFOLLOWUP F088 (NOLOCK)ON F088.NR_PROCESSO = P.NR_PRO' +
        'CESSO AND F088.CD_EVENTO = '#39'088'#39' AND F088.IN_APLICAVEL = 1'
      'WHERE P.CD_DUE IS NOT NULL AND P.CD_DUE <> '#39#39
      'AND P.IN_CANCELADO = '#39'0'#39
      'AND LEN(P.CD_DUE) > 12')
    Left = 80
    Top = 120
  end
end
