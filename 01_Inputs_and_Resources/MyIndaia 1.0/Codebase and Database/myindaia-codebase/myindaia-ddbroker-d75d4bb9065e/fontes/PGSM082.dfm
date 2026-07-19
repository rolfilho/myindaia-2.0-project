object datm_tx_tra: Tdatm_tx_tra
  Left = 213
  Top = 248
  Height = 169
  Width = 321
  object ds_tx_tra: TDataSource
    DataSet = qry_tx_tra_
    Left = 136
    Top = 71
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
    Top = 72
  end
  object qry_tx_tra_: TQuery
    AfterPost = qry_tx_tra_AfterPost
    DatabaseName = 'DBBROKER'
    RequestLive = True
    SQL.Strings = (
      'SELECT * FROM'
      'TTAXA_TRA ORDER BY'
      'NM_DESCRICAO'
      '')
    Left = 136
    Top = 21
    object qry_tx_tra_CD_TAXA_TRA: TStringField
      DisplayLabel = 'Código'
      FieldName = 'CD_TAXA_TRA'
      Origin = 'TTAXA_TRA.CD_TAXA_TRA'
      Size = 3
    end
    object qry_tx_tra_NM_DESCRICAO: TStringField
      DisplayLabel = 'Descrição'
      FieldName = 'NM_DESCRICAO'
      Origin = 'TTAXA_TRA.NM_DESCRICAO'
      Size = 30
    end
    object qry_tx_tra_VL_THC_CNTR_20: TFloatField
      FieldName = 'VL_THC_CNTR_20'
      Origin = 'TTAXA_TRA.VL_THC_CNTR_20'
      DisplayFormat = '#0,.00'
      EditFormat = '#0.00'
    end
    object qry_tx_tra_VL_THC_CNTR_40: TFloatField
      FieldName = 'VL_THC_CNTR_40'
      Origin = 'TTAXA_TRA.VL_THC_CNTR_40'
      DisplayFormat = '#0,.00'
      EditFormat = '#0.00'
    end
    object qry_tx_tra_VL_THC_C_SOLTA: TFloatField
      FieldName = 'VL_THC_C_SOLTA'
      Origin = 'TTAXA_TRA.VL_THC_C_SOLTA'
      DisplayFormat = '#0,.00'
      EditFormat = '#0.00'
    end
    object qry_tx_tra_VL_THC_CNTR_20_RORO: TFloatField
      FieldName = 'VL_THC_CNTR_20_RORO'
      Origin = 'TTAXA_TRA.VL_THC_CNTR_20_RORO'
      DisplayFormat = '#0,.00'
      EditFormat = '#0.00'
    end
    object qry_tx_tra_VL_THC_CNTR_40_RORO: TFloatField
      FieldName = 'VL_THC_CNTR_40_RORO'
      Origin = 'TTAXA_TRA.VL_THC_CNTR_40_RORO'
      DisplayFormat = '#0,.00'
      EditFormat = '#0.00'
    end
    object qry_tx_tra_VL_THC_C_SOLTA_RORO: TFloatField
      FieldName = 'VL_THC_C_SOLTA_RORO'
      Origin = 'TTAXA_TRA.VL_THC_C_SOLTA_RORO'
      DisplayFormat = '#0,.00'
      EditFormat = '#0.00'
    end
    object qry_tx_tra_VL_THC_MIN: TFloatField
      FieldName = 'VL_THC_MIN'
      Origin = 'TTAXA_TRA.VL_THC_MIN'
      DisplayFormat = '#0,.00'
      EditFormat = '#0.00'
    end
    object qry_tx_tra_VL_CARR_CNTR_20_MM: TFloatField
      FieldName = 'VL_CARR_CNTR_20_MM'
      Origin = 'TTAXA_TRA.VL_CARR_CNTR_20_MM'
      DisplayFormat = '#0,.00'
      EditFormat = '#0.00'
    end
    object qry_tx_tra_VL_CARR_CNTR_20_MO: TFloatField
      FieldName = 'VL_CARR_CNTR_20_MO'
      Origin = 'TTAXA_TRA.VL_CARR_CNTR_20_MO'
      DisplayFormat = '#0,.00'
      EditFormat = '#0.00'
    end
    object qry_tx_tra_VL_CARR_CNTR_40_MM: TFloatField
      FieldName = 'VL_CARR_CNTR_40_MM'
      Origin = 'TTAXA_TRA.VL_CARR_CNTR_40_MM'
      DisplayFormat = '#0,.00'
      EditFormat = '#0.00'
    end
    object qry_tx_tra_VL_CARR_CNTR_40_MO: TFloatField
      FieldName = 'VL_CARR_CNTR_40_MO'
      Origin = 'TTAXA_TRA.VL_CARR_CNTR_40_MO'
      DisplayFormat = '#0,.00'
      EditFormat = '#0.00'
    end
    object qry_tx_tra_VL_CARR_C_SOLTA_MM: TFloatField
      FieldName = 'VL_CARR_C_SOLTA_MM'
      Origin = 'TTAXA_TRA.VL_CARR_C_SOLTA_MM'
      DisplayFormat = '#0,.00'
      EditFormat = '#0.00'
    end
    object qry_tx_tra_VL_CARR_C_SOLTA_MO: TFloatField
      FieldName = 'VL_CARR_C_SOLTA_MO'
      Origin = 'TTAXA_TRA.VL_CARR_C_SOLTA_MO'
      DisplayFormat = '#0,.00'
      EditFormat = '#0.00'
    end
    object qry_tx_tra_VL_CARR_MIN: TFloatField
      FieldName = 'VL_CARR_MIN'
      Origin = 'TTAXA_TRA.VL_CARR_MIN'
      DisplayFormat = '#0,.00'
      EditFormat = '#0.00'
    end
    object qry_tx_tra_PC_ACR_CARR_PERIGO: TFloatField
      FieldName = 'PC_ACR_CARR_PERIGO'
      Origin = 'TTAXA_TRA.PC_ACR_CARR_PERIGO'
      DisplayFormat = '#0,.00'
      EditFormat = '#0.00'
    end
    object qry_tx_tra_NR_PERIODO_ARM: TIntegerField
      FieldName = 'NR_PERIODO_ARM'
      Origin = 'TTAXA_TRA.NR_PERIODO_ARM'
    end
    object qry_tx_tra_VL_ARM_CNTR_1P: TFloatField
      FieldName = 'VL_ARM_CNTR_1P'
      Origin = 'TTAXA_TRA.VL_ARM_CNTR_1P'
      DisplayFormat = '#0,.00'
      EditFormat = '#0.00'
    end
    object qry_tx_tra_VL_ARM_CNTR_DP: TFloatField
      FieldName = 'VL_ARM_CNTR_DP'
      Origin = 'TTAXA_TRA.VL_ARM_CNTR_DP'
      DisplayFormat = '#0,.00'
      EditFormat = '#0.00'
    end
    object qry_tx_tra_VL_ARM_CNTR_20_MIN: TFloatField
      FieldName = 'VL_ARM_CNTR_20_MIN'
      Origin = 'TTAXA_TRA.VL_ARM_CNTR_20_MIN'
      DisplayFormat = '#0,.00'
      EditFormat = '#0.00'
    end
    object qry_tx_tra_VL_ARM_CNTR_40_MIN: TFloatField
      FieldName = 'VL_ARM_CNTR_40_MIN'
      Origin = 'TTAXA_TRA.VL_ARM_CNTR_40_MIN'
      DisplayFormat = '#0,.00'
      EditFormat = '#0.00'
    end
    object qry_tx_tra_VL_ARM_CNTR_REIMP: TFloatField
      FieldName = 'VL_ARM_CNTR_REIMP'
      Origin = 'TTAXA_TRA.VL_ARM_CNTR_REIMP'
      DisplayFormat = '#0,.00'
      EditFormat = '#0.00'
    end
    object qry_tx_tra_VL_ARM_C_SOLTA_1P: TFloatField
      FieldName = 'VL_ARM_C_SOLTA_1P'
      Origin = 'TTAXA_TRA.VL_ARM_C_SOLTA_1P'
      DisplayFormat = '#0,.00'
      EditFormat = '#0.00'
    end
    object qry_tx_tra_VL_ARM_C_SOLTA_2P: TFloatField
      FieldName = 'VL_ARM_C_SOLTA_2P'
      Origin = 'TTAXA_TRA.VL_ARM_C_SOLTA_2P'
      DisplayFormat = '#0,.00'
      EditFormat = '#0.00'
    end
    object qry_tx_tra_VL_ARM_C_SOLTA_3P: TFloatField
      FieldName = 'VL_ARM_C_SOLTA_3P'
      Origin = 'TTAXA_TRA.VL_ARM_C_SOLTA_3P'
      DisplayFormat = '#0,.00'
      EditFormat = '#0.00'
    end
    object qry_tx_tra_VL_ARM_C_SOLTA_DP: TFloatField
      FieldName = 'VL_ARM_C_SOLTA_DP'
      Origin = 'TTAXA_TRA.VL_ARM_C_SOLTA_DP'
      DisplayFormat = '#0,.00'
      EditFormat = '#0.00'
    end
    object qry_tx_tra_VL_ARM_C_SOLTA_MIN: TFloatField
      FieldName = 'VL_ARM_C_SOLTA_MIN'
      Origin = 'TTAXA_TRA.VL_ARM_C_SOLTA_MIN'
      DisplayFormat = '#0,.00'
      EditFormat = '#0.00'
    end
    object qry_tx_tra_VL_ARM_C_SOLTA_BAGAGEM: TFloatField
      FieldName = 'VL_ARM_C_SOLTA_BAGAGEM'
      Origin = 'TTAXA_TRA.VL_ARM_C_SOLTA_BAGAGEM'
      DisplayFormat = '#0,.00'
      EditFormat = '#0.00'
    end
    object qry_tx_tra_VL_ARM_C_SOLTA_REIMP: TFloatField
      FieldName = 'VL_ARM_C_SOLTA_REIMP'
      Origin = 'TTAXA_TRA.VL_ARM_C_SOLTA_REIMP'
      DisplayFormat = '#0,.00'
      EditFormat = '#0.00'
    end
    object qry_tx_tra_PC_ACR_ARM_PERIGO: TFloatField
      FieldName = 'PC_ACR_ARM_PERIGO'
      Origin = 'TTAXA_TRA.PC_ACR_ARM_PERIGO'
      DisplayFormat = '#0,.00'
      EditFormat = '#0.00'
    end
    object qry_tx_tra_VL_ENERGIA_CNTR_FIXO: TFloatField
      FieldName = 'VL_ENERGIA_CNTR_FIXO'
      Origin = 'TTAXA_TRA.VL_ENERGIA_CNTR_FIXO'
      DisplayFormat = '#0,.00'
      EditFormat = '#0.00'
    end
    object qry_tx_tra_VL_ENERGIA_CNTR_20: TFloatField
      FieldName = 'VL_ENERGIA_CNTR_20'
      Origin = 'TTAXA_TRA.VL_ENERGIA_CNTR_20'
      DisplayFormat = '#0,.00'
      EditFormat = '#0.00'
    end
    object qry_tx_tra_VL_ENERGIA_CNTR_40: TFloatField
      FieldName = 'VL_ENERGIA_CNTR_40'
      Origin = 'TTAXA_TRA.VL_ENERGIA_CNTR_40'
      DisplayFormat = '#0,.00'
      EditFormat = '#0.00'
    end
    object qry_tx_tra_PC_ISS: TFloatField
      DisplayLabel = 'Taxa ISS'
      FieldName = 'PC_ISS'
      Origin = 'TTAXA_TRA.PC_ISS'
      DisplayFormat = '#0,.00'
      EditFormat = '#0.00'
    end
    object qry_tx_tra_IN_ATIVO: TStringField
      FieldName = 'IN_ATIVO'
      Origin = 'TTAXA_TRA.IN_ATIVO'
      Size = 1
    end
    object qry_tx_tra_look_ativo: TStringField
      DisplayLabel = 'Ativo'
      FieldName = 'look_ativo'
      LookupDataSet = tbl_yesno_
      LookupKeyFields = 'CD_YESNO'
      LookupResultField = 'TX_YESNO'
      KeyFields = 'IN_ATIVO'
      Size = 3
      Lookup = True
    end
  end
  object qry_ult_tx_tra_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT MAX(CD_TAXA_TRA) AS ULTIMO'
      'FROM TTAXA_TRA')
    Left = 241
    Top = 20
    object qry_ult_tx_tra_ULTIMO: TStringField
      FieldName = 'ULTIMO'
      Origin = 'TTAXA_TRA.CD_TAXA_TRA'
      Size = 3
    end
  end
end
