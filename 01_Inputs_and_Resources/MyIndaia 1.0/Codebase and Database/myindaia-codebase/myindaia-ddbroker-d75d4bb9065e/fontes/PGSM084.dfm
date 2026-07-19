object datm_tx_amg: Tdatm_tx_amg
  Left = 200
  Top = 104
  Height = 284
  Width = 398
  object ds_tx_amg: TDataSource
    DataSet = qry_tx_amg_
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
    Top = 71
  end
  object qry_tx_amg_: TQuery
    AfterPost = qry_tx_amg_AfterPost
    DatabaseName = 'DBBROKER'
    RequestLive = True
    SQL.Strings = (
      'SELECT * FROM'
      'TTAXA_ARMAZENAGEM ORDER BY'
      'NM_DESCRICAO'
      '')
    Left = 136
    Top = 20
    object qry_tx_amg_CD_TAXA: TStringField
      DisplayLabel = 'Código'
      FieldName = 'CD_TAXA'
      Origin = 'TTAXA_ARMAZENAGEM.CD_TAXA'
      Size = 3
    end
    object qry_tx_amg_NM_DESCRICAO: TStringField
      DisplayLabel = 'Descrição'
      FieldName = 'NM_DESCRICAO'
      Origin = 'TTAXA_ARMAZENAGEM.NM_DESCRICAO'
      Size = 30
    end
    object qry_tx_amg_VL_CNTR_20_MD_PALLET: TFloatField
      FieldName = 'VL_CNTR_20_MD_PALLET'
      Origin = 'TTAXA_ARMAZENAGEM.VL_CNTR_20_MD_PALLET'
      DisplayFormat = '#0,.00'
      EditFormat = '#0.00'
    end
    object qry_tx_amg_VL_CNTR_20_MD_OUTROS: TFloatField
      FieldName = 'VL_CNTR_20_MD_OUTROS'
      Origin = 'TTAXA_ARMAZENAGEM.VL_CNTR_20_MD_OUTROS'
      DisplayFormat = '#0,.00'
      EditFormat = '#0.00'
    end
    object qry_tx_amg_VL_CNTR_40_MD_PALLET: TFloatField
      FieldName = 'VL_CNTR_40_MD_PALLET'
      Origin = 'TTAXA_ARMAZENAGEM.VL_CNTR_40_MD_PALLET'
      DisplayFormat = '#0,.00'
      EditFormat = '#0.00'
    end
    object qry_tx_amg_VL_CNTR_40_MD_OUTROS: TFloatField
      FieldName = 'VL_CNTR_40_MD_OUTROS'
      Origin = 'TTAXA_ARMAZENAGEM.VL_CNTR_40_MD_OUTROS'
      DisplayFormat = '#0,.00'
      EditFormat = '#0.00'
    end
    object qry_tx_amg_VL_C_SOLTA_MD: TFloatField
      FieldName = 'VL_C_SOLTA_MD'
      Origin = 'TTAXA_ARMAZENAGEM.VL_C_SOLTA_MD'
      DisplayFormat = '#0,.00'
      EditFormat = '#0.00'
    end
    object qry_tx_amg_VL_CNTR_20_ME_PALLET: TFloatField
      FieldName = 'VL_CNTR_20_ME_PALLET'
      Origin = 'TTAXA_ARMAZENAGEM.VL_CNTR_20_ME_PALLET'
      DisplayFormat = '#0,.00'
      EditFormat = '#0.00'
    end
    object qry_tx_amg_VL_CNTR_20_ME_OUTROS: TFloatField
      FieldName = 'VL_CNTR_20_ME_OUTROS'
      Origin = 'TTAXA_ARMAZENAGEM.VL_CNTR_20_ME_OUTROS'
      DisplayFormat = '#0,.00'
      EditFormat = '#0.00'
    end
    object qry_tx_amg_VL_CNTR_40_ME_PALLET: TFloatField
      FieldName = 'VL_CNTR_40_ME_PALLET'
      Origin = 'TTAXA_ARMAZENAGEM.VL_CNTR_40_ME_PALLET'
      DisplayFormat = '#0,.00'
      EditFormat = '#0.00'
    end
    object qry_tx_amg_VL_CNTR_40_ME_OUTROS: TFloatField
      FieldName = 'VL_CNTR_40_ME_OUTROS'
      Origin = 'TTAXA_ARMAZENAGEM.VL_CNTR_40_ME_OUTROS'
      DisplayFormat = '#0,.00'
      EditFormat = '#0.00'
    end
    object qry_tx_amg_VL_C_SOLTA_ME: TFloatField
      FieldName = 'VL_C_SOLTA_ME'
      Origin = 'TTAXA_ARMAZENAGEM.VL_C_SOLTA_ME'
      DisplayFormat = '#0,.00'
      EditFormat = '#0.00'
    end
    object qry_tx_amg_VL_MINIMO: TFloatField
      FieldName = 'VL_MINIMO'
      Origin = 'TTAXA_ARMAZENAGEM.VL_MINIMO'
      DisplayFormat = '#0,.00'
      EditFormat = '#0.00'
    end
    object qry_tx_amg_IN_ATIVO: TStringField
      FieldName = 'IN_ATIVO'
      Origin = 'TTAXA_ARMAZENAGEM.IN_ATIVO'
      Size = 1
    end
    object qry_tx_amg_look_ativo: TStringField
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
  object qry_ult_tx_amg_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT MAX(CD_TAXA) AS ULTIMO'
      'FROM TTAXA_ARMAZENAGEM')
    Left = 241
    Top = 20
    object qry_ult_tx_amg_ULTIMO: TStringField
      FieldName = 'ULTIMO'
      Origin = 'TTAXA_ARMAZENAGEM.CD_TAXA'
      Size = 3
    end
  end
end
