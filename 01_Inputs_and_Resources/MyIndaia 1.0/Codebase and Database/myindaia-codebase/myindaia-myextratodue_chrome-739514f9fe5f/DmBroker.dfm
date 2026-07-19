object dmdBroker: TdmdBroker
  OldCreateOrder = False
  Height = 185
  Width = 228
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
    Left = 120
    Top = 16
  end
  object qryStatus: TFDQuery
    Connection = dbBroker
    SQL.Strings = (
      'SELECT TOP 10 *'
      'FROM ('
      'SELECT'
      '  P.NR_PROCESSO,'
      '  P.CD_DUE, '
      '  COUNT(*) OVER(PARTITION BY F141.CD_EVENTO) AS QT_TOTAL'
      'FROM  TFOLLOWUP F141           (NOLOCK)'
      
        'INNER JOIN TPROCESSO P (NOLOCK) ON F141.NR_PROCESSO = P.NR_PROCE' +
        'SSO AND LTRIM(ISNULL(P.CD_DUE, '#39#39')) <> '#39#39
      'OUTER APPLY( SELECT TOP 1 NR_PROCESSO '
      '               FROM TPROCESSO_DOCTOS DOC (NOLOCK) '
      '              WHERE DOC.NR_PROCESSO   = P.NR_PROCESSO '
      '                AND DOC.CD_TIPO_DOCTO = '#39'164'#39
      '                AND DOC.IN_ATIVO      = '#39'1'#39
      '                AND DOC.ID_TABELA     = '#39'1652005462'#39
      '            )  DOC                                '
      'WHERE DOC.NR_PROCESSO IS NULL'
      'AND F141.DT_REALIZACAO IS NOT NULL'
      'AND F141.CD_SERVICO  = P.CD_SERVICO'
      'AND F141.CD_EVENTO   = '#39'141'#39'     '
      'AND F141.IN_APLICAVEL = '#39'1'#39
      ''
      ') TAB')
    Left = 24
    Top = 80
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
    object qryStatusQT_TOTAL: TIntegerField
      FieldName = 'QT_TOTAL'
      ReadOnly = True
    end
  end
  object cdsStatus: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspStatus'
    Left = 80
    Top = 80
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
    object cdsStatusQT_TOTAL: TIntegerField
      FieldName = 'QT_TOTAL'
      ReadOnly = True
    end
  end
  object dspStatus: TDataSetProvider
    DataSet = qryStatus
    Left = 152
    Top = 80
  end
end
