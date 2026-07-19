object dmdMain: TdmdMain
  OldCreateOrder = False
  Height = 271
  Width = 463
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
  object IdSSLIOHandlerSocketOpenSSL1: TIdSSLIOHandlerSocketOpenSSL
    Destination = ':25'
    MaxLineAction = maException
    Port = 25
    DefaultPort = 0
    SSLOptions.Method = sslvTLSv1_2
    SSLOptions.SSLVersions = [sslvTLSv1_2]
    SSLOptions.Mode = sslmClient
    SSLOptions.VerifyMode = []
    SSLOptions.VerifyDepth = 0
    Left = 343
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
    Left = 343
    Top = 8
  end
  object IdSMTP1: TIdSMTP
    IOHandler = IdSSLIOHandlerSocketOpenSSL1
    SASLMechanisms = <>
    Left = 343
    Top = 56
  end
  object queryPedido: TFDQuery
    Connection = dbBroker
    Left = 40
    Top = 200
  end
  object queryAuxiliar: TFDQuery
    Connection = dbBroker
    Left = 120
    Top = 200
  end
  object queryID: TFDQuery
    Connection = dbBroker
    Left = 184
    Top = 200
  end
  object queryProcesso: TFDQuery
    Connection = dbBroker
    Left = 256
    Top = 200
  end
  object queryPO: TFDQuery
    Connection = dbBroker
    Left = 336
    Top = 200
  end
  object queryPOItem: TFDQuery
    Connection = dbBroker
    Left = 392
    Top = 200
  end
  object qryBroker: TFDQuery
    Connection = dbBroker
    Left = 72
    Top = 120
  end
  object qryServerTime: TFDQuery
    Connection = dbBroker
    Left = 136
    Top = 120
  end
end
