object dmdBroker: TdmdBroker
  OldCreateOrder = False
  Height = 245
  Width = 285
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
  object qryDuimpRegistro: TFDQuery
    Connection = dbBroker
    SQL.Strings = (
      'SELECT TOP 10 *'
      'FROM ('
      'SELECT'
      '  P.NR_PROCESSO,'
      '  P.CD_DUIMP,'
      '  COUNT(*) OVER(PARTITION BY EV021.CD_EVENTO) AS QT_TOTAL'
      ''
      'FROM  TPROCESSO P           (NOLOCK)'
      
        'LEFT JOIN TFOLLOWUP EV021 (NOLOCK) ON EV021.NR_PROCESSO = P.NR_P' +
        'ROCESSO AND EV021.CD_EVENTO = '#39'021'#39
      
        'LEFT JOIN TFOLLOWUP EV636 (NOLOCK) ON EV636.NR_PROCESSO = P.NR_P' +
        'ROCESSO AND EV636.CD_EVENTO = '#39'636'#39
      ''
      'WHERE '
      'EV021.DT_REALIZACAO IS NOT NULL'
      'AND EV021.IN_APLICAVEL = '#39'1'#39
      'AND EV636.DT_REALIZACAO IS NULL'
      'AND EV636.IN_APLICAVEL = '#39'1'#39
      'AND LTRIM(ISNULL(P.CD_DUIMP, '#39#39')) <> '#39#39
      ') TAB')
    Left = 24
    Top = 128
    object qryDuimpRegistroNR_PROCESSO: TStringField
      FieldName = 'NR_PROCESSO'
      Origin = 'NR_PROCESSO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      FixedChar = True
      Size = 18
    end
    object qryDuimpRegistroCD_DUIMP: TStringField
      FieldName = 'CD_DUIMP'
      Origin = 'CD_DUIMP'
      FixedChar = True
      Size = 16
    end
    object qryDuimpRegistroQT_TOTAL: TIntegerField
      FieldName = 'QT_TOTAL'
      Origin = 'QT_TOTAL'
      ReadOnly = True
    end
  end
  object cdsDuimpRegistro: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspDuimpRegistro'
    Left = 80
    Top = 128
    object cdsDuimpRegistroNR_PROCESSO: TStringField
      FieldName = 'NR_PROCESSO'
      Required = True
      FixedChar = True
      Size = 18
    end
    object cdsDuimpRegistroCD_DUIMP: TStringField
      FieldName = 'CD_DUIMP'
      Size = 14
    end
    object cdsDuimpRegistroQT_TOTAL: TIntegerField
      FieldName = 'QT_TOTAL'
      ReadOnly = True
    end
  end
  object dspDuimpRegistro: TDataSetProvider
    DataSet = qryDuimpRegistro
    Left = 152
    Top = 128
  end
  object qryDuimpCanal: TFDQuery
    Connection = dbBroker
    SQL.Strings = (
      'SELECT TOP 10 *'
      'FROM ('
      'SELECT'
      '  P.NR_PROCESSO,'
      '  P.CD_DUIMP,'
      '  COUNT(*) OVER(PARTITION BY EV088.CD_EVENTO) AS QT_TOTAL'
      ''
      'FROM  TPROCESSO P           (NOLOCK)'
      
        'LEFT JOIN TFOLLOWUP EV088 (NOLOCK) ON EV088.NR_PROCESSO = P.NR_P' +
        'ROCESSO AND EV088.CD_EVENTO = '#39'088'#39
      
        'LEFT JOIN TFOLLOWUP EV035 (NOLOCK) ON EV035.NR_PROCESSO = P.NR_P' +
        'ROCESSO AND EV035.CD_EVENTO = '#39'035'#39
      ''
      'WHERE '
      'EV088.DT_REALIZACAO IS NOT NULL'
      'AND EV088.IN_APLICAVEL = '#39'1'#39
      'AND EV035.DT_REALIZACAO IS NULL'
      'AND EV035.IN_APLICAVEL = '#39'1'#39
      'AND LTRIM(ISNULL(P.CD_DUIMP, '#39#39')) <> '#39#39
      ') TAB')
    Left = 24
    Top = 176
    object qryDuimpCanalNR_PROCESSO: TStringField
      FieldName = 'NR_PROCESSO'
      Origin = 'NR_PROCESSO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      FixedChar = True
      Size = 18
    end
    object qryDuimpCanalCD_DUIMP: TStringField
      FieldName = 'CD_DUIMP'
      Origin = 'CD_DUIMP'
      Size = 14
    end
    object qryDuimpCanalQT_TOTAL: TIntegerField
      FieldName = 'QT_TOTAL'
      ReadOnly = True
    end
  end
  object cdsDuimpCanal: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspDuimpCanal'
    Left = 80
    Top = 176
    object cdsDuimpCanalNR_PROCESSO: TStringField
      FieldName = 'NR_PROCESSO'
      Required = True
      FixedChar = True
      Size = 18
    end
    object cdsDuimpCanalCD_DUIMP: TStringField
      FieldName = 'CD_DUIMP'
      Size = 14
    end
    object cdsDuimpCanalQT_TOTAL: TIntegerField
      FieldName = 'QT_TOTAL'
      ReadOnly = True
    end
  end
  object dspDuimpCanal: TDataSetProvider
    DataSet = qryDuimpCanal
    Left = 152
    Top = 176
  end
end
