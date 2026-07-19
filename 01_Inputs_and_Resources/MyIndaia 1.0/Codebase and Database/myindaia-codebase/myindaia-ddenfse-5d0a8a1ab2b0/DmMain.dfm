object dmdMain: TdmdMain
  OldCreateOrder = False
  Height = 237
  Width = 432
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
    SSLOptions.Mode = sslmUnassigned
    SSLOptions.VerifyMode = []
    SSLOptions.VerifyDepth = 0
    Left = 287
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
    Left = 287
    Top = 8
  end
  object IdSMTP1: TIdSMTP
    IOHandler = IdSSLIOHandlerSocketOpenSSL1
    SASLMechanisms = <>
    Left = 287
    Top = 64
  end
  object qrySDE: TFDQuery
    Connection = dbSDE
    SQL.Strings = (
      
        'SELECT NUMNFV, NUMNFS, SITRET, IMPRPS, N140XML.SEQNFS, N140XML.S' +
        'EQNXM,  N100XML.SEQXML, N100XML.BINARQ, N140NFS.CPLISV'
      'FROM SDEPROD.DBO.N140NFS AS N140NFS'
      
        'LEFT JOIN SDEPROD.DBO.N140XML AS N140XML ON N140XML.SEQNFS = N14' +
        '0NFS.SEQNFS'
      
        'LEFT JOIN SDEPROD.DBO.N100XML AS N100XML ON N100XML.SEQXML = N14' +
        '0XML.SEQXML'
      'WHERE NUMNFV = :NUMNFV AND CPLISV LIKE :NR_PROCESSO'
      'AND SEQFIL = :SEQFIL')
    Left = 80
    Top = 120
    ParamData = <
      item
        Name = 'NUMNFV'
        DataType = ftString
        ParamType = ptInput
      end
      item
        Name = 'NR_PROCESSO'
        DataType = ftString
        ParamType = ptInput
      end
      item
        Name = 'SEQFIL'
        ParamType = ptInput
      end>
  end
  object dbSDE: TFDConnection
    ConnectionName = 'SDE'
    Params.Strings = (
      'Database=SDEPROD'
      'User_Name=sa'
      'Password=123'
      'Server=senior'
      'DriverID=MSSQL')
    LoginPrompt = False
    Left = 24
    Top = 120
  end
  object dbWallet: TFDConnection
    ConnectionName = 'Wallet'
    Params.Strings = (
      'Database=MYINDAIAV2'
      'User_Name=SA'
      'Password=123'
      'Server=INDAIA10'
      'DriverID=MSSQL')
    LoginPrompt = False
    Left = 24
    Top = 64
  end
  object qryWallet: TFDQuery
    Connection = dbBroker
    SQL.Strings = (
      ' SELECT DISTINCT B.SENIORKEY, B.BRANCH_ID, E.taxID '
      'FROM MYINDAIAV2.DBO.BILLING                   B   (NOLOCK)'
      
        'JOIN MYINDAIAV2.DBO.BILLING_ITEMINVOICED BII (NOLOCK)ON BII.BILL' +
        'ING_ID=B.ID'
      
        'JOIN MYINDAIAV2.DBO.ITEMINVOICED         II  (NOLOCK)ON II.ID=BI' +
        'I.ITENSINVOICED_ID'
      
        'JOIN MYINDAIAV2.DBO.CUSTOMCLEARANCE      CC  (NOLOCK)ON CC.ID=II' +
        '.CUSTOMCLEARANCE_ID'
      
        'JOIN MYINDAIAV2.DBO.Branch               E   (NOLOCK)ON E.id = B' +
        '.branch_id'
      'WHERE CC.CUSTOMID = :NR_PROCESSO '
      '  AND B.TYPE='#39'TAX_INVOICE'#39' AND B.STATUS = '#39'INVOICED'#39
      '')
    Left = 80
    Top = 64
    ParamData = <
      item
        Name = 'NR_PROCESSO'
        DataType = ftString
        ParamType = ptInput
      end>
    object qryWalletSENIORKEY: TWideStringField
      FieldName = 'SENIORKEY'
      Origin = 'SENIORKEY'
      Size = 255
    end
    object qryWalletBRANCH_ID: TLargeintField
      FieldName = 'BRANCH_ID'
      Origin = 'BRANCH_ID'
    end
    object qryWallettaxID: TWideStringField
      FieldName = 'taxID'
      Origin = 'taxID'
      Size = 255
    end
  end
  object qryWalletProcessos: TFDQuery
    Connection = dbBroker
    SQL.Strings = (
      ''
      'SELECT DISTINCT CC.CUSTOMID'
      'FROM MYINDAIAV2.DBO.BILLING                   B   (NOLOCK)'
      
        'LEFT JOIN MYINDAIAV2.DBO.BILLING_ITEMINVOICED BII (NOLOCK) ON BI' +
        'I.BILLING_ID=B.ID'
      
        'LEFT JOIN MYINDAIAV2.DBO.ITEMINVOICED         II  (NOLOCK) ON II' +
        '.ID=BII.ITENSINVOICED_ID'
      
        'LEFT JOIN MYINDAIAV2.DBO.CUSTOMCLEARANCE      CC  (NOLOCK) ON CC' +
        '.ID=II.CUSTOMCLEARANCE_ID'
      'WHERE B.SENIORKEY = :SENIORKEY'
      'and B.BRANCH_ID   = :BRANCH_ID'
      'and B.TYPE='#39'TAX_INVOICE'#39' AND B.STATUS = '#39'INVOICED'#39)
    Left = 160
    Top = 64
    ParamData = <
      item
        Name = 'SENIORKEY'
        ParamType = ptInput
      end
      item
        Name = 'BRANCH_ID'
        DataType = ftInteger
        FDDataType = dtInt64
        ParamType = ptInput
      end>
  end
  object qryUnidNeg: TFDQuery
    Connection = dbBroker
    SQL.Strings = (
      'SELECT *'
      ' FROM TUNID_NEG (NOLOCK)'
      'WHERE CD_UNID_NEG = :CODIGO')
    Left = 136
    Top = 8
    ParamData = <
      item
        Name = 'CODIGO'
        ParamType = ptInput
      end>
  end
end
