object datm_ag_tx: Tdatm_ag_tx
  Left = 200
  Top = 104
  Height = 313
  Width = 526
  object ds_ag_tx: TDataSource
    DataSet = qry_ag_tx_
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
  object qry_ag_tx_: TQuery
    DatabaseName = 'DBBROKER'
    RequestLive = True
    SQL.Strings = (
      'SELECT * FROM'
      'TAGENTE_TAXA ORDER BY'
      'NM_TAXA')
    Left = 136
    Top = 20
    object qry_ag_tx_CD_TAXA: TStringField
      DisplayLabel = 'Código'
      FieldName = 'CD_TAXA'
      Origin = 'TAGENTE_TAXA.CD_TAXA'
      Size = 4
    end
    object qry_ag_tx_NM_TAXA: TStringField
      DisplayLabel = 'Descrição'
      FieldName = 'NM_TAXA'
      Origin = 'TAGENTE_TAXA.NM_TAXA'
      Size = 30
    end
    object qry_ag_tx_VL_CPTZ_CNTR_20: TFloatField
      FieldName = 'VL_CPTZ_CNTR_20'
      Origin = 'TAGENTE_TAXA.VL_CPTZ_CNTR_20'
      DisplayFormat = '#0,.00'
      EditFormat = '#0.00'
    end
    object qry_ag_tx_VL_CPTZ_CNTR_40: TFloatField
      FieldName = 'VL_CPTZ_CNTR_40'
      Origin = 'TAGENTE_TAXA.VL_CPTZ_CNTR_40'
      DisplayFormat = '#0,.00'
      EditFormat = '#0.00'
    end
    object qry_ag_tx_VL_CPTZ_C_SOLTA: TFloatField
      FieldName = 'VL_CPTZ_C_SOLTA'
      Origin = 'TAGENTE_TAXA.VL_CPTZ_C_SOLTA'
      DisplayFormat = '#0,.00'
      EditFormat = '#0.00'
    end
    object qry_ag_tx_VL_CPTZ_MINIMA: TFloatField
      FieldName = 'VL_CPTZ_MINIMA'
      Origin = 'TAGENTE_TAXA.VL_CPTZ_MINIMA'
      DisplayFormat = '#0,.00'
      EditFormat = '#0.00'
    end
    object qry_ag_tx_VL_LIBERACAO_BL: TFloatField
      FieldName = 'VL_LIBERACAO_BL'
      Origin = 'TAGENTE_TAXA.VL_LIBERACAO_BL'
      DisplayFormat = '#0,.00'
      EditFormat = '#0.00'
    end
    object qry_ag_tx_IN_ATIVO: TStringField
      FieldName = 'IN_ATIVO'
      Origin = 'TAGENTE_TAXA.IN_ATIVO'
      Size = 1
    end
    object qry_ag_tx_look_ativo: TStringField
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
  object qry_ult_ag_tx_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT MAX(A.CD_AGENTE) ULTIMO'
      'FROM  TAGENTE A')
    Left = 224
    Top = 20
    object qry_ult_ag_tx_ULTIMO: TStringField
      FieldName = 'ULTIMO'
      Origin = 'TAGENTE.CD_AGENTE'
      Size = 4
    end
  end
end
