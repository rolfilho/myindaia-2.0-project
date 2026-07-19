object datm_tx_codesp: Tdatm_tx_codesp
  Left = 200
  Top = 104
  Height = 342
  Width = 549
  object ds_tx_codesp: TDataSource
    DataSet = qry_tx_codesp_
    Left = 136
    Top = 77
  end
  object tbl_yesno_: TTable
    DatabaseName = 'DBBROKER'
    SessionName = 'Default'
    IndexFieldNames = 'CD_YESNO'
    TableName = 'TYES_NO'
    Left = 32
    Top = 20
  end
  object ds_yesno: TDataSource
    DataSet = tbl_yesno_
    Left = 32
    Top = 77
  end
  object qry_tx_codesp_: TQuery
    DatabaseName = 'DBBROKER'
    RequestLive = True
    SQL.Strings = (
      'SELECT * FROM'
      'TTAXA_CODESP')
    Left = 136
    Top = 20
    object qry_tx_codesp_NR_PERIODO: TIntegerField
      FieldName = 'NR_PERIODO'
      Origin = 'TTAXA_CODESP.NR_PERIODO'
    end
    object qry_tx_codesp_VL_ARM_GERAL_05_1: TFloatField
      FieldName = 'VL_ARM_GERAL_05_1'
      Origin = 'TTAXA_CODESP.VL_ARM_GERAL_05_1'
      DisplayFormat = '#0,.00'
      EditFormat = '#0.00'
    end
    object qry_tx_codesp_VL_ARM_GERAL_05_2: TFloatField
      FieldName = 'VL_ARM_GERAL_05_2'
      Origin = 'TTAXA_CODESP.VL_ARM_GERAL_05_2'
      DisplayFormat = '#0,.00'
      EditFormat = '#0.00'
    end
    object qry_tx_codesp_VL_ARM_GERAL_05_3: TFloatField
      FieldName = 'VL_ARM_GERAL_05_3'
      Origin = 'TTAXA_CODESP.VL_ARM_GERAL_05_3'
      DisplayFormat = '#0,.00'
      EditFormat = '#0.00'
    end
    object qry_tx_codesp_VL_ARM_GERAL_10_1: TFloatField
      FieldName = 'VL_ARM_GERAL_10_1'
      Origin = 'TTAXA_CODESP.VL_ARM_GERAL_10_1'
      DisplayFormat = '#0,.00'
      EditFormat = '#0.00'
    end
    object qry_tx_codesp_VL_ARM_GERAL_10_2: TFloatField
      FieldName = 'VL_ARM_GERAL_10_2'
      Origin = 'TTAXA_CODESP.VL_ARM_GERAL_10_2'
      DisplayFormat = '#0,.00'
      EditFormat = '#0.00'
    end
    object qry_tx_codesp_VL_ARM_GERAL_10_3: TFloatField
      FieldName = 'VL_ARM_GERAL_10_3'
      Origin = 'TTAXA_CODESP.VL_ARM_GERAL_10_3'
      DisplayFormat = '#0,.00'
      EditFormat = '#0.00'
    end
    object qry_tx_codesp_VL_ARM_GERAL_15_1: TFloatField
      FieldName = 'VL_ARM_GERAL_15_1'
      Origin = 'TTAXA_CODESP.VL_ARM_GERAL_15_1'
      DisplayFormat = '#0,.00'
      EditFormat = '#0.00'
    end
    object qry_tx_codesp_VL_ARM_GERAL_15_2: TFloatField
      FieldName = 'VL_ARM_GERAL_15_2'
      Origin = 'TTAXA_CODESP.VL_ARM_GERAL_15_2'
      DisplayFormat = '#0,.00'
      EditFormat = '#0.00'
    end
    object qry_tx_codesp_VL_ARM_GERAL_15_3: TFloatField
      FieldName = 'VL_ARM_GERAL_15_3'
      Origin = 'TTAXA_CODESP.VL_ARM_GERAL_15_3'
      DisplayFormat = '#0,.00'
      EditFormat = '#0.00'
    end
    object qry_tx_codesp_VL_ARM_GERAL_99_1: TFloatField
      FieldName = 'VL_ARM_GERAL_99_1'
      Origin = 'TTAXA_CODESP.VL_ARM_GERAL_99_1'
      DisplayFormat = '#0,.00'
      EditFormat = '#0.00'
    end
    object qry_tx_codesp_VL_ARM_GERAL_99_2: TFloatField
      FieldName = 'VL_ARM_GERAL_99_2'
      Origin = 'TTAXA_CODESP.VL_ARM_GERAL_99_2'
      DisplayFormat = '#0,.00'
      EditFormat = '#0.00'
    end
    object qry_tx_codesp_VL_ARM_GERAL_99_3: TFloatField
      FieldName = 'VL_ARM_GERAL_99_3'
      Origin = 'TTAXA_CODESP.VL_ARM_GERAL_99_3'
      DisplayFormat = '#0,.00'
      EditFormat = '#0.00'
    end
    object qry_tx_codesp_VL_ARM_GERAL_MIN: TFloatField
      FieldName = 'VL_ARM_GERAL_MIN'
      Origin = 'TTAXA_CODESP.VL_ARM_GERAL_MIN'
      DisplayFormat = '#0,.00'
      EditFormat = '#0.00'
    end
    object qry_tx_codesp_VL_ARM_GRANEL_1_1: TFloatField
      FieldName = 'VL_ARM_GRANEL_1_1'
      Origin = 'TTAXA_CODESP.VL_ARM_GRANEL_1_1'
      DisplayFormat = '#0,.00'
      EditFormat = '#0.00'
    end
    object qry_tx_codesp_VL_ARM_GRANEL_1_2: TFloatField
      FieldName = 'VL_ARM_GRANEL_1_2'
      Origin = 'TTAXA_CODESP.VL_ARM_GRANEL_1_2'
      DisplayFormat = '#0,.00'
      EditFormat = '#0.00'
    end
    object qry_tx_codesp_VL_ARM_GRANEL_1_3: TFloatField
      FieldName = 'VL_ARM_GRANEL_1_3'
      Origin = 'TTAXA_CODESP.VL_ARM_GRANEL_1_3'
      DisplayFormat = '#0,.00'
      EditFormat = '#0.00'
    end
    object qry_tx_codesp_VL_ARM_GRANEL_9_1: TFloatField
      FieldName = 'VL_ARM_GRANEL_9_1'
      Origin = 'TTAXA_CODESP.VL_ARM_GRANEL_9_1'
      DisplayFormat = '#0,.00'
      EditFormat = '#0.00'
    end
    object qry_tx_codesp_VL_ARM_GRANEL_9_2: TFloatField
      FieldName = 'VL_ARM_GRANEL_9_2'
      Origin = 'TTAXA_CODESP.VL_ARM_GRANEL_9_2'
      DisplayFormat = '#0,.00'
      EditFormat = '#0.00'
    end
    object qry_tx_codesp_VL_ARM_GRANEL_9_3: TFloatField
      FieldName = 'VL_ARM_GRANEL_9_3'
      Origin = 'TTAXA_CODESP.VL_ARM_GRANEL_9_3'
      DisplayFormat = '#0,.00'
      EditFormat = '#0.00'
    end
    object qry_tx_codesp_VL_MOV_ATE_5: TFloatField
      FieldName = 'VL_MOV_ATE_5'
      Origin = 'TTAXA_CODESP.VL_MOV_ATE_5'
      DisplayFormat = '#0,.00'
      EditFormat = '#0.00'
    end
    object qry_tx_codesp_VL_MOV_ACIMA_5: TFloatField
      FieldName = 'VL_MOV_ACIMA_5'
      Origin = 'TTAXA_CODESP.VL_MOV_ACIMA_5'
      DisplayFormat = '#0,.00'
      EditFormat = '#0.00'
    end
    object qry_tx_codesp_VL_MOV_GRANEL: TFloatField
      FieldName = 'VL_MOV_GRANEL'
      Origin = 'TTAXA_CODESP.VL_MOV_GRANEL'
      DisplayFormat = '#0,.00'
      EditFormat = '#0.00'
    end
    object qry_tx_codesp_VL_MOV_CNTR: TFloatField
      FieldName = 'VL_MOV_CNTR'
      Origin = 'TTAXA_CODESP.VL_MOV_CNTR'
      DisplayFormat = '#0,.00'
      EditFormat = '#0.00'
    end
    object qry_tx_codesp_PC_ISS: TFloatField
      FieldName = 'PC_ISS'
      Origin = 'TTAXA_CODESP.PC_ISS'
      DisplayFormat = '#0,.00'
      EditFormat = '#0.00'
    end
  end
end
