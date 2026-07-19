object datm_TaxaSelic: Tdatm_TaxaSelic
  OldCreateOrder = False
  Left = 294
  Top = 150
  Height = 296
  Width = 287
  object dts_ListaTaxaSelic: TDataSource
    DataSet = qry_ListaTaxaSelic
    Left = 39
    Top = 89
  end
  object qry_ListaTaxaSelic: TQuery
    AfterScroll = qry_ListaTaxaSelicAfterScroll
    OnCalcFields = qry_ListaTaxaSelicCalcFields
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      
        'select codigo, year(dt_inicio_vigencia) ANO, TX_SELIC, month(dt_' +
        'inicio_vigencia) MES from ttaxa_selic'
      'order by '
      '  year(dt_inicio_vigencia) desc, month(dt_inicio_vigencia) desc')
    Left = 39
    Top = 33
    object qry_ListaTaxaSelicANO: TIntegerField
      DisplayLabel = 'Ano'
      FieldName = 'ANO'
    end
    object qry_ListaTaxaSeliccalcMes: TStringField
      DisplayLabel = 'M'#234's'
      FieldKind = fkCalculated
      FieldName = 'calcMes'
      Calculated = True
    end
    object qry_ListaTaxaSelicTX_SELIC: TFloatField
      DisplayLabel = 'Taxa (%)'
      FieldName = 'TX_SELIC'
      DisplayFormat = '#,##0.00'
      EditFormat = '#,##0.00'
    end
    object qry_ListaTaxaSelicMES: TIntegerField
      FieldName = 'MES'
      Visible = False
    end
    object qry_ListaTaxaSeliccodigo: TStringField
      FieldName = 'codigo'
      Visible = False
      FixedChar = True
      Size = 3
    end
  end
  object qry_TaxaSelic: TQuery
    BeforeInsert = qry_TaxaSelicBeforeEdit
    BeforeEdit = qry_TaxaSelicBeforeEdit
    BeforePost = qry_TaxaSelicBeforePost
    AfterPost = qry_TaxaSelicAfterPost
    DatabaseName = 'DBBROKER'
    RequestLive = True
    SQL.Strings = (
      'SELECT * FROM ttaxa_selic')
    Left = 170
    Top = 33
    object qry_TaxaSelicCODIGO: TStringField
      FieldName = 'CODIGO'
      Origin = 'DBBROKER.ttaxa_selic.CODIGO'
      FixedChar = True
      Size = 3
    end
    object qry_TaxaSelicDT_INICIO_VIGENCIA: TDateTimeField
      FieldName = 'DT_INICIO_VIGENCIA'
      Origin = 'DBBROKER.ttaxa_selic.DT_INICIO_VIGENCIA'
    end
    object qry_TaxaSelicDT_TERMINO_VIGENCIA: TDateTimeField
      FieldName = 'DT_TERMINO_VIGENCIA'
      Origin = 'DBBROKER.ttaxa_selic.DT_TERMINO_VIGENCIA'
    end
    object qry_TaxaSelicTX_SELIC: TFloatField
      FieldName = 'TX_SELIC'
      Origin = 'DBBROKER.ttaxa_selic.TX_SELIC'
      DisplayFormat = '#,##0.00'
      EditFormat = '#,##0.00'
    end
  end
  object dts_TaxaSelic: TDataSource
    DataSet = qry_TaxaSelic
    Left = 170
    Top = 89
  end
  object qry_ult_cod_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT MAX(CODIGO) AS ULTIMO'
      'FROM ttaxa_selic'
      '')
    Left = 42
    Top = 167
    object qry_ult_cod_ULTIMO: TStringField
      FieldName = 'ULTIMO'
      Origin = 'DBBROKER.ttaxa_selic.CODIGO'
      FixedChar = True
      Size = 3
    end
  end
end
