object datm_tx_teca: Tdatm_tx_teca
  Left = 200
  Top = 104
  Height = 370
  Width = 601
  object ds_tx_teca: TDataSource
    DataSet = qry_tx_teca_
    Left = 136
    Top = 71
  end
  object qry_tx_teca_: TQuery
    DatabaseName = 'DBBROKER'
    RequestLive = True
    SQL.Strings = (
      'SELECT * FROM'
      'TTAXA_TECA')
    Left = 136
    Top = 21
    object qry_tx_teca_VL_ARM_05: TFloatField
      FieldName = 'VL_ARM_05'
      Origin = 'TTAXA_TECA.VL_ARM_05'
      DisplayFormat = '#0,.00'
      EditFormat = '#0.00'
    end
    object qry_tx_teca_VL_ARM_10: TFloatField
      FieldName = 'VL_ARM_10'
      Origin = 'TTAXA_TECA.VL_ARM_10'
      DisplayFormat = '#0,.00'
      EditFormat = '#0.00'
    end
    object qry_tx_teca_VL_ARM_20: TFloatField
      FieldName = 'VL_ARM_20'
      Origin = 'TTAXA_TECA.VL_ARM_20'
      DisplayFormat = '#0,.00'
      EditFormat = '#0.00'
    end
    object qry_tx_teca_VL_ARM_99: TFloatField
      FieldName = 'VL_ARM_99'
      Origin = 'TTAXA_TECA.VL_ARM_99'
      DisplayFormat = '#0,.00'
      EditFormat = '#0.00'
    end
    object qry_tx_teca_VL_CPTZ: TFloatField
      FieldName = 'VL_CPTZ'
      Origin = 'TTAXA_TECA.VL_CPTZ'
      DisplayFormat = '#0,.00'
      EditFormat = '#0.00'
    end
    object qry_tx_teca_VL_CPTZ_PESO_MIN: TFloatField
      FieldName = 'VL_CPTZ_PESO_MIN'
      Origin = 'TTAXA_TECA.VL_CPTZ_PESO_MIN'
      DisplayFormat = '#0,.00'
      EditFormat = '#0.00'
    end
  end
end
