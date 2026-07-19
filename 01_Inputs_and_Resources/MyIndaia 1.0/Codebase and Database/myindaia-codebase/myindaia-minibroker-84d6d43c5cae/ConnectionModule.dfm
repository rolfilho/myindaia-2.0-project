object FireDacMSSQLConnection: TFireDacMSSQLConnection
  OldCreateOrder = True
  OnDestroy = DataModuleDestroy
  Height = 168
  Width = 336
  object Connection: TFDConnection
    Params.Strings = (
      'Database=BROKER'
      'User_Name=sa'
      'Password=123'
      'DriverID=MSSQL'
      'Server=antuerpia')
    LoginPrompt = False
    Left = 16
    Top = 8
  end
  object IdSSLIOHandlerSocketOpenSSL1: TIdSSLIOHandlerSocketOpenSSL
    Destination = ':25'
    MaxLineAction = maException
    Port = 25
    DefaultPort = 0
    SSLOptions.Mode = sslmUnassigned
    SSLOptions.VerifyMode = []
    SSLOptions.VerifyDepth = 0
    Left = 223
    Top = 94
  end
  object IdSMTP1: TIdSMTP
    IOHandler = IdSSLIOHandlerSocketOpenSSL1
    SASLMechanisms = <>
    Left = 103
    Top = 94
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
    Left = 23
    Top = 94
  end
  object qryBroker: TFDQuery
    Connection = Connection
    Left = 104
    Top = 8
  end
  object qryUsuario: TFDQuery
    Connection = Connection
    SQL.Strings = (
      '  SELECT TOP (1) A.CD_USUARIO, '
      '                 A.NM_EMAIL, '
      
        '                 ISNULL(H.CD_PRODUTO,'#39'01'#39')   AS CD_PRODUTO_PADRA' +
        'O, '
      
        '                 ISNULL(H.CD_UNID_NEG, '#39'01'#39') AS CD_UNID_NEG_PADR' +
        'AO,'
      '                 CD_CARGO  '
      '    FROM BROKER.DBO.TUSUARIO              A (NOLOCK)'
      '    LEFT'
      
        '    JOIN BROKER.DBO.TUSUARIO_HABILITACAO  H (NOLOCK) ON H.CD_USU' +
        'ARIO = A.CD_USUARIO'
      
        '                                                    AND ISNULL(H' +
        '.IN_DEFAULT, 0) = 1'
      ' WHERE A.AP_USUARIO= :AP_USUARIO')
    Left = 224
    Top = 8
    ParamData = <
      item
        Name = 'AP_USUARIO'
        DataType = ftString
        ParamType = ptInput
      end>
  end
end
