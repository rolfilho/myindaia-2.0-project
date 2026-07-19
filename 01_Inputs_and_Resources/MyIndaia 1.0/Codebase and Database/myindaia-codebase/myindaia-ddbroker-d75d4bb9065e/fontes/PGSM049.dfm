object datm_moeda: Tdatm_moeda
  OldCreateOrder = True
  Left = 249
  Top = 163
  Height = 302
  Width = 356
  object ds_moeda: TDataSource
    DataSet = qry_moeda_broker_
    Left = 31
    Top = 17
  end
  object qry_moeda_broker_: TQuery
    AfterScroll = qry_moeda_broker_AfterScroll
    DatabaseName = 'DBBROKER'
    RequestLive = True
    SQL.Strings = (
      'SELECT * FROM TMOEDA_BROKER'
      'ORDER BY'
      'CD_MOEDA')
    Left = 130
    Top = 17
    object qry_moeda_broker_CD_MOEDA: TStringField
      DisplayLabel = 'C'#243'digo'
      FieldName = 'CD_MOEDA'
      Origin = 'TMOEDA.CD_MOEDA'
      Size = 3
    end
    object qry_moeda_broker_NM_MOEDA: TStringField
      DisplayLabel = 'Descri'#231#227'o'
      FieldName = 'NM_MOEDA'
      Origin = 'TMOEDA.NM_MOEDA'
      Size = 30
    end
    object qry_moeda_broker_AP_MOEDA: TStringField
      DisplayLabel = 'Sigla'
      FieldName = 'AP_MOEDA'
      Origin = 'TMOEDA.AP_MOEDA'
      Size = 6
    end
    object qry_moeda_broker_IN_ATIVO: TStringField
      FieldName = 'IN_ATIVO'
      Origin = 'TMOEDA.IN_ATIVO'
      Size = 1
    end
    object qry_moeda_broker_CD_MOEDA_SCX: TStringField
      FieldName = 'CD_MOEDA_SCX'
      Origin = 'TMOEDA.CD_MOEDA_SCX'
      Size = 3
    end
    object qry_moeda_broker_LookAtivo: TStringField
      DisplayLabel = 'Ativo'
      FieldKind = fkLookup
      FieldName = 'LookAtivo'
      LookupDataSet = tbl_yesno_
      LookupKeyFields = 'CD_YESNO'
      LookupResultField = 'TX_YESNO'
      KeyFields = 'IN_ATIVO'
      Size = 3
      Lookup = True
    end
    object qry_moeda_broker_LookScx: TStringField
      DisplayLabel = 'Moeda no Sicomex'
      FieldKind = fkLookup
      FieldName = 'LookScx'
      LookupDataSet = qry_moeda_scx_
      LookupKeyFields = 'CODIGO'
      LookupResultField = 'DESCRICAO'
      KeyFields = 'CD_MOEDA_SCX'
      Size = 120
      Lookup = True
    end
    object qry_moeda_broker_NM_MOEDA_SING: TStringField
      FieldName = 'NM_MOEDA_SING'
      Origin = 'TMOEDA_BROKER.CD_MOEDA'
    end
    object qry_moeda_broker_NM_MOEDA_PLURAL: TStringField
      FieldName = 'NM_MOEDA_PLURAL'
      Origin = 'TMOEDA_BROKER.NM_MOEDA'
    end
    object qry_moeda_broker_NM_CENTAVOS_SING: TStringField
      FieldName = 'NM_CENTAVOS_SING'
      Origin = 'TMOEDA_BROKER.AP_MOEDA'
    end
    object qry_moeda_broker_NM_CENTAVOS_PLURAL: TStringField
      FieldName = 'NM_CENTAVOS_PLURAL'
      Origin = 'TMOEDA_BROKER.IN_ATIVO'
    end
    object qry_moeda_broker_AP_MOEDA_INGLES: TStringField
      FieldName = 'AP_MOEDA_INGLES'
      Origin = 'DBBROKER.TMOEDA_BROKER.AP_MOEDA_INGLES'
      FixedChar = True
      Size = 6
    end
    object qry_moeda_broker_NM_MOEDA_SING_ING: TStringField
      FieldName = 'NM_MOEDA_SING_ING'
      Origin = 'DBBROKER.TMOEDA_BROKER.NM_MOEDA_SING_ING'
      FixedChar = True
    end
    object qry_moeda_broker_NM_MOEDA_PLURAL_ING: TStringField
      FieldName = 'NM_MOEDA_PLURAL_ING'
      Origin = 'DBBROKER.TMOEDA_BROKER.NM_MOEDA_PLURAL_ING'
      FixedChar = True
    end
    object qry_moeda_broker_NM_CENTAVOS_SING_ING: TStringField
      FieldName = 'NM_CENTAVOS_SING_ING'
      Origin = 'DBBROKER.TMOEDA_BROKER.NM_CENTAVOS_SING_ING'
      FixedChar = True
    end
    object qry_moeda_broker_NM_CENTAVOS_PLURAL_ING: TStringField
      FieldName = 'NM_CENTAVOS_PLURAL_ING'
      Origin = 'DBBROKER.TMOEDA_BROKER.NM_CENTAVOS_PLURAL_ING'
      FixedChar = True
    end
    object qry_moeda_broker_NM_MOEDA_SING_ESP: TStringField
      FieldName = 'NM_MOEDA_SING_ESP'
      Origin = 'DBBROKER.TMOEDA_BROKER.NM_MOEDA_SING_ESP'
      FixedChar = True
    end
    object qry_moeda_broker_NM_MOEDA_PLURAL_ESP: TStringField
      FieldName = 'NM_MOEDA_PLURAL_ESP'
      Origin = 'DBBROKER.TMOEDA_BROKER.NM_MOEDA_PLURAL_ESP'
      FixedChar = True
    end
    object qry_moeda_broker_NM_CENTAVOS_SING_ESP: TStringField
      FieldName = 'NM_CENTAVOS_SING_ESP'
      Origin = 'DBBROKER.TMOEDA_BROKER.NM_CENTAVOS_SING_ESP'
      FixedChar = True
    end
    object qry_moeda_broker_NM_CENTAVOS_PLURAL_ESP: TStringField
      FieldName = 'NM_CENTAVOS_PLURAL_ESP'
      Origin = 'DBBROKER.TMOEDA_BROKER.NM_CENTAVOS_PLURAL_ESP'
      FixedChar = True
    end
  end
  object tbl_yesno_: TTable
    DatabaseName = 'DBBROKER'
    IndexFieldNames = 'CD_YESNO'
    TableName = 'TYES_NO'
    Left = 130
    Top = 72
  end
  object ds_yesno: TDataSource
    DataSet = tbl_yesno_
    Left = 31
    Top = 72
  end
  object ds_taxa_cambio: TDataSource
    DataSet = qry_taxa_cambio_
    Left = 31
    Top = 137
  end
  object qry_taxa_cambio_: TQuery
    AfterScroll = qry_taxa_cambio_AfterScroll
    DatabaseName = 'DBBROKER'
    RequestLive = True
    SQL.Strings = (
      'SELECT * FROM TTAXA_CAMBIO'
      'WHERE CD_MOEDA = :CD_MOEDA'
      'ORDER BY DT_INICIO_VIGENCIA')
    Left = 130
    Top = 137
    ParamData = <
      item
        DataType = ftString
        Name = 'CD_MOEDA'
        ParamType = ptUnknown
      end>
    object qry_taxa_cambio_CD_MOEDA: TStringField
      FieldName = 'CD_MOEDA'
      Origin = 'TTAXA_CAMBIO.CD_MOEDA'
      Size = 3
    end
    object qry_taxa_cambio_DT_INICIO_VIGENCIA: TDateTimeField
      DisplayLabel = 'In'#237'cio da Vig'#234'ncia'
      FieldName = 'DT_INICIO_VIGENCIA'
      Origin = 'TTAXA_CAMBIO.DT_INICIO_VIGENCIA'
      OnSetText = qryTaxaFreteDT_INICIOSetText
      DisplayFormat = 'dd/mm/yyyy'
      EditMask = '!99/99/0000;1;_'
    end
    object qry_taxa_cambio_DT_TERMINO_VIGENCIA: TDateTimeField
      DisplayLabel = 'T'#233'rmino da Vig'#234'ncia'
      FieldName = 'DT_TERMINO_VIGENCIA'
      Origin = 'TTAXA_CAMBIO.DT_TERMINO_VIGENCIA'
      OnSetText = qryTaxaFreteDT_INICIOSetText
      DisplayFormat = 'dd/mm/yyyy'
      EditMask = '!99/99/0000;1;_'
    end
    object qry_taxa_cambio_TX_CAMBIO: TFloatField
      DisplayLabel = 'Taxa de C'#226'mbio'
      FieldName = 'TX_CAMBIO'
      Origin = 'TTAXA_CAMBIO.TX_CAMBIO'
      DisplayFormat = '#0.0000'
      EditFormat = '#0.0000'
    end
    object qry_taxa_cambio_LookMoeda: TStringField
      DisplayLabel = 'Moeda'
      FieldKind = fkLookup
      FieldName = 'LookMoeda'
      LookupDataSet = qry_moeda_broker_
      LookupKeyFields = 'CD_MOEDA'
      LookupResultField = 'NM_MOEDA'
      KeyFields = 'CD_MOEDA'
      Size = 30
      Lookup = True
    end
  end
  object qry_moeda_scx_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT * FROM TMOEDA')
    Left = 230
    Top = 17
    object qry_moeda_scx_CODIGO: TStringField
      FieldName = 'CODIGO'
      Origin = 'TMOEDA.CODIGO'
      Size = 3
    end
    object qry_moeda_scx_DESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Origin = 'TMOEDA.DESCRICAO'
      Size = 120
    end
  end
  object qry_consist_alt_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT CD_MOEDA FROM TTAXA_CAMBIO'
      'WHERE '
      '( ( :DT_INICIO_VIG BETWEEN '
      'DT_INICIO_VIGENCIA AND DT_TERMINO_VIGENCIA )'
      'OR'
      '( :DT_TERMINO_VIG BETWEEN '
      'DT_INICIO_VIGENCIA AND DT_TERMINO_VIGENCIA ) )'
      'AND CD_MOEDA = :CD_MOEDA'
      'AND DT_INICIO_VIGENCIA <> :INICIO '
      'AND DT_TERMINO_VIGENCIA <> :TERMINO')
    Left = 230
    Top = 72
    ParamData = <
      item
        DataType = ftDate
        Name = 'DT_INICIO_VIG'
        ParamType = ptUnknown
      end
      item
        DataType = ftDate
        Name = 'DT_TERMINO_VIG'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'CD_MOEDA'
        ParamType = ptUnknown
      end
      item
        DataType = ftDate
        Name = 'INICIO'
        ParamType = ptUnknown
      end
      item
        DataType = ftDate
        Name = 'TERMINO'
        ParamType = ptUnknown
      end>
    object qry_consist_alt_CD_MOEDA: TStringField
      FieldName = 'CD_MOEDA'
      Origin = 'TTAXA_CAMBIO.CD_MOEDA'
      Size = 3
    end
  end
  object qry_consist_inc_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT CD_MOEDA FROM TTAXA_CAMBIO'
      'WHERE '
      '( ( :DT_INICIO_VIG BETWEEN '
      'DT_INICIO_VIGENCIA AND DT_TERMINO_VIGENCIA )'
      'OR'
      '( :DT_TERMINO_VIG BETWEEN '
      'DT_INICIO_VIGENCIA AND DT_TERMINO_VIGENCIA ) )'
      'AND CD_MOEDA = :CD_MOEDA')
    Left = 230
    Top = 137
    ParamData = <
      item
        DataType = ftDate
        Name = 'DT_INICIO_VIG'
        ParamType = ptUnknown
      end
      item
        DataType = ftDate
        Name = 'DT_TERMINO_VIG'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'CD_MOEDA'
        ParamType = ptUnknown
      end>
    object qry_consist_inc_CD_MOEDA: TStringField
      FieldName = 'CD_MOEDA'
      Origin = 'TTAXA_CAMBIO.CD_MOEDA'
      Size = 3
    end
  end
  object qry_conv_cambio_: TQuery
    DatabaseName = 'DBBROKER'
    RequestLive = True
    SQL.Strings = (
      'SELECT *FROM TCONVERSAO_CAMBIO'
      'WHERE Codigo = :CD_MOEDA')
    Left = 230
    Top = 200
    ParamData = <
      item
        DataType = ftString
        Name = 'CD_MOEDA'
        ParamType = ptUnknown
      end>
    object qry_conv_cambio_Codigo: TStringField
      FieldName = 'Codigo'
      Origin = 'TCONVERSAO_CAMBIO.Codigo'
      Size = 3
    end
    object qry_conv_cambio_Descricao: TStringField
      FieldName = 'Descricao'
      Origin = 'TCONVERSAO_CAMBIO.Descricao'
      Size = 120
    end
    object qry_conv_cambio_Taxa_Conversao: TStringField
      FieldName = 'Taxa_Conversao'
      Origin = 'TCONVERSAO_CAMBIO.Taxa_Conversao'
      Size = 9
    end
    object qry_conv_cambio_Vigencia_Inicio_Taxa: TStringField
      FieldName = 'Vigencia_Inicio_Taxa'
      Origin = 'TCONVERSAO_CAMBIO.Vigencia_Inicio_Taxa'
      Size = 10
    end
    object qry_conv_cambio_Vigencia_Fim_Taxa: TStringField
      FieldName = 'Vigencia_Fim_Taxa'
      Origin = 'TCONVERSAO_CAMBIO.Vigencia_Fim_Taxa'
      Size = 10
    end
  end
  object dsTaxaFrete: TDataSource
    DataSet = qryTaxaFrete
    Left = 31
    Top = 201
  end
  object qryTaxaFrete: TQuery
    AfterScroll = qryTaxaFreteAfterScroll
    DatabaseName = 'DBBROKER'
    RequestLive = True
    SQL.Strings = (
      'SELECT * FROM TTAXA_FRETE'
      'WHERE CD_MOEDA = :CD_MOEDA'
      'ORDER BY DT_INICIO')
    Left = 130
    Top = 201
    ParamData = <
      item
        DataType = ftString
        Name = 'CD_MOEDA'
        ParamType = ptUnknown
      end>
    object qryTaxaFreteCD_MOEDA: TStringField
      FieldName = 'CD_MOEDA'
      Origin = 'DBBROKER.TTAXA_FRETE.CD_MOEDA'
      FixedChar = True
      Size = 3
    end
    object qryTaxaFreteDT_INICIO: TDateTimeField
      FieldName = 'DT_INICIO'
      Origin = 'DBBROKER.TTAXA_FRETE.DT_INICIO'
      OnSetText = qryTaxaFreteDT_INICIOSetText
      EditMask = '99/99/9999;1;_'
    end
    object qryTaxaFreteDT_FIM: TDateTimeField
      FieldName = 'DT_FIM'
      Origin = 'DBBROKER.TTAXA_FRETE.DT_FIM'
      OnSetText = qryTaxaFreteDT_INICIOSetText
      EditMask = '99/99/9999;1;_'
    end
    object qryTaxaFreteVL_TAXA: TFloatField
      FieldName = 'VL_TAXA'
      Origin = 'DBBROKER.TTAXA_FRETE.VL_TAXA'
      DisplayFormat = '#0,.0000'
      EditFormat = '#0.0000'
    end
    object qryTaxaFreteVL_TAXA_UTIL: TFloatField
      FieldName = 'VL_TAXA_UTIL'
      Origin = 'DBBROKER.TTAXA_FRETE.VL_TAXA_UTIL'
      DisplayFormat = '#0,.0000'
      EditFormat = '#0.0000'
    end
    object qryTaxaFreteVL_COMPRA: TFloatField
      FieldName = 'VL_COMPRA'
      Origin = 'DBBROKER.TTAXA_FRETE.VL_COMPRA'
      DisplayFormat = '#0,.0000'
      EditFormat = '#0.0000'
    end
  end
end
