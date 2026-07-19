object datm_ag: Tdatm_ag
  Left = 371
  Top = 185
  Height = 195
  Width = 432
  object ds_ag: TDataSource
    DataSet = qry_ag_
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
  object qry_ag_: TQuery
    DatabaseName = 'DBBROKER'
    RequestLive = True
    SQL.Strings = (
      'SELECT * FROM'
      'TAGENTE ORDER BY'
      'NM_AGENTE')
    Left = 136
    Top = 20
    object qry_ag_CD_AGENTE: TStringField
      DisplayLabel = 'Código'
      FieldName = 'CD_AGENTE'
      Origin = 'TAGENTE.CD_AGENTE'
      Size = 4
    end
    object qry_ag_NM_AGENTE: TStringField
      DisplayLabel = 'Descrição'
      FieldName = 'NM_AGENTE'
      Origin = 'TAGENTE.NM_AGENTE'
      Size = 60
    end
    object qry_ag_CD_TAXA_IMP: TStringField
      DisplayLabel = 'Cód. Tx. Imp.'
      FieldName = 'CD_TAXA_IMP'
      Origin = 'TAGENTE.CD_TAXA_IMP'
      Size = 4
    end
    object qry_ag_CD_TAXA_EXP: TStringField
      DisplayLabel = 'Cód. Tx. Exp.'
      FieldName = 'CD_TAXA_EXP'
      Origin = 'TAGENTE.CD_TAXA_EXP'
      Size = 4
    end
    object qry_ag_IN_ATIVO: TStringField
      FieldName = 'IN_ATIVO'
      Origin = 'TAGENTE.IN_ATIVO'
      Size = 1
    end
    object qry_ag_look_tx_imp: TStringField
      DisplayLabel = 'Desc. Tx. Imp.'
      FieldName = 'look_tx_imp'
      LookupDataSet = qry_ag_tx_
      LookupKeyFields = 'CD_TAXA'
      LookupResultField = 'NM_TAXA'
      KeyFields = 'CD_TAXA_IMP'
      Size = 25
      Lookup = True
    end
    object qry_ag_look_tx_exp: TStringField
      DisplayLabel = 'Desc. Tx. Exp.'
      FieldName = 'look_tx_exp'
      LookupDataSet = qry_ag_tx_
      LookupKeyFields = 'CD_TAXA'
      LookupResultField = 'NM_TAXA'
      KeyFields = 'CD_TAXA_EXP'
      Size = 25
      Lookup = True
    end
    object qry_ag_look_ativo: TStringField
      DisplayLabel = 'Ativo'
      FieldName = 'look_ativo'
      LookupDataSet = tbl_yesno_
      LookupKeyFields = 'CD_YESNO'
      LookupResultField = 'TX_YESNO'
      KeyFields = 'IN_ATIVO'
      Size = 3
      Lookup = True
    end
    object qry_ag_NR_CGC_AGENTE: TStringField
      FieldName = 'NR_CGC_AGENTE'
      Origin = 'TAGENTE.CD_AGENTE'
      EditMask = '99.999.999/9999-99;0;_'
      Size = 14
    end
  end
  object qry_ult_ag_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT MAX(A.CD_AGENTE) ULTIMO'
      'FROM  TAGENTE A')
    Left = 224
    Top = 20
    object qry_ult_ag_ULTIMO: TStringField
      FieldName = 'ULTIMO'
      Origin = 'TAGENTE.CD_AGENTE'
      Size = 4
    end
  end
  object ds_ag_tx: TDataSource
    DataSet = qry_ag_tx_
    Left = 320
    Top = 77
  end
  object qry_ag_tx_: TQuery
    DatabaseName = 'DBBROKER'
    RequestLive = True
    SQL.Strings = (
      'SELECT * FROM'
      'TAGENTE_TAXA ORDER BY'
      'NM_TAXA')
    Left = 320
    Top = 20
    object qry_ag_tx_CD_TAXA: TStringField
      FieldName = 'CD_TAXA'
      Origin = 'TAGENTE_TAXA.CD_TAXA'
      Size = 4
    end
    object qry_ag_tx_NM_TAXA: TStringField
      FieldName = 'NM_TAXA'
      Origin = 'TAGENTE_TAXA.NM_TAXA'
      Size = 30
    end
    object qry_ag_tx_VL_CPTZ_CNTR_20: TFloatField
      FieldName = 'VL_CPTZ_CNTR_20'
      Origin = 'TAGENTE_TAXA.VL_CPTZ_CNTR_20'
    end
    object qry_ag_tx_VL_CPTZ_CNTR_40: TFloatField
      FieldName = 'VL_CPTZ_CNTR_40'
      Origin = 'TAGENTE_TAXA.VL_CPTZ_CNTR_40'
    end
    object qry_ag_tx_VL_CPTZ_C_SOLTA: TFloatField
      FieldName = 'VL_CPTZ_C_SOLTA'
      Origin = 'TAGENTE_TAXA.VL_CPTZ_C_SOLTA'
    end
    object qry_ag_tx_VL_CPTZ_MINIMA: TFloatField
      FieldName = 'VL_CPTZ_MINIMA'
      Origin = 'TAGENTE_TAXA.VL_CPTZ_MINIMA'
    end
    object qry_ag_tx_VL_LIBERACAO_BL: TFloatField
      FieldName = 'VL_LIBERACAO_BL'
      Origin = 'TAGENTE_TAXA.VL_LIBERACAO_BL'
    end
    object qry_ag_tx_IN_ATIVO: TStringField
      FieldName = 'IN_ATIVO'
      Origin = 'TAGENTE_TAXA.IN_ATIVO'
      Size = 1
    end
  end
end
