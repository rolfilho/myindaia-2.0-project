object dmdBroker: TdmdBroker
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Height = 162
  Width = 325
  object IdSSLIOHandlerSocketOpenSSL1: TIdSSLIOHandlerSocketOpenSSL
    Destination = ':25'
    MaxLineAction = maException
    Port = 25
    DefaultPort = 0
    SSLOptions.Mode = sslmUnassigned
    SSLOptions.VerifyMode = []
    SSLOptions.VerifyDepth = 0
    Left = 215
    Top = 104
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
    Top = 104
  end
  object IdSMTP1: TIdSMTP
    IOHandler = IdSSLIOHandlerSocketOpenSSL1
    SASLMechanisms = <>
    Left = 103
    Top = 104
  end
  object qryBroker: TFDQuery
    Connection = dbBroker
    Left = 88
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
    LoginPrompt = False
    Left = 24
    Top = 16
  end
  object qryFila: TFDQuery
    Connection = dbBroker
    Left = 184
    Top = 16
  end
  object qryUpdateNrNF: TFDQuery
    Connection = dbBroker
    SQL.Strings = (
      'DECLARE @VAR_ID VARCHAR(18) '
      'SET @VAR_ID = :VAR_ID'
      ''
      'UPDATE MYINDAIAV2.DBO.BILLING '
      '   SET NR_NOTA = N.NUMDFS '
      
        '  FROM MYINDAIAV2.DBO.BILLING                       B    (NOLOCK' +
        ')   '
      
        '   INNER  JOIN MYINDAIAV2.DBO.BRANCH                BRA  (NOLOCK' +
        ') ON BRA.ID                = B.BRANCH_ID'
      
        '   INNER  JOIN MYINDAIAV2.DBO.BILLING_ITEMINVOICED  BIV  (NOLOCK' +
        ') ON BIV.BILLING_ID        = B.ID   '
      
        '   INNER  JOIN MYINDAIAV2.DBO.ITEMINVOICED          IV   (NOLOCK' +
        ') ON IV.ID                 = BIV.ITENSINVOICED_ID '
      
        '   LEFT  JOIN SENIOR.SAPIENS.dbo.E140IDE        N    (NOLOCK) ON' +
        ' N.CODEMP              = 1'
      
        '                  '#9#9#9'                                     AND N.' +
        'CODFIL              = BRA.SENIORKEY'
      
        '                  '#9#9#9'                                     AND N.' +
        'NUMNFV              = B.SENIORKEY'
      'WHERE IV.CUSTOMCLEARANCE_ID =@VAR_ID'
      '  AND B.TYPE='#39'TAX_INVOICE'#39
      '  AND N.NUMDFS >0  ')
    Left = 256
    Top = 24
    ParamData = <
      item
        Name = 'VAR_ID'
        DataType = ftString
        FDDataType = dtAnsiString
        ParamType = ptInput
      end>
  end
end
