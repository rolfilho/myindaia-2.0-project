object datm_sda: Tdatm_sda
  Left = 91
  Top = 106
  Height = 465
  Width = 266
  object ds_sda: TDataSource
    DataSet = qry_sda_
    Left = 16
    Top = 20
  end
  object qry_sda_: TQuery
    DatabaseName = 'DBBROKER'
    RequestLive = True
    SQL.Strings = (
      'SELECT * FROM TSDA'
      'ORDER BY'
      'CD_SDA')
    Left = 91
    Top = 20
    object qry_sda_CD_SDA: TStringField
      DisplayLabel = 'Código'
      FieldName = 'CD_SDA'
      Origin = 'TSDA.CD_SDA'
      Size = 3
    end
    object qry_sda_TX_DESCRICAO: TStringField
      DisplayLabel = 'Descrição'
      FieldName = 'TX_DESCRICAO'
      Origin = 'TSDA.TX_DESCRICAO'
      Size = 50
    end
    object qry_sda_VL_MINIMO: TFloatField
      DisplayLabel = 'Val. Mínimo'
      FieldName = 'VL_MINIMO'
      Origin = 'TSDA.VL_MINIMO'
      DisplayFormat = '#0,.00'
      EditFormat = '#0.00'
    end
    object qry_sda_VL_MAXIMO: TFloatField
      DisplayLabel = 'Val.Máximo'
      FieldName = 'VL_MAXIMO'
      Origin = 'TSDA.VL_MAXIMO'
      DisplayFormat = '#0,.00'
      EditFormat = '#0.00'
    end
    object qry_sda_PC_ASSIST_SOCIAL: TFloatField
      DisplayLabel = 'Contr. Sindical'
      FieldName = 'PC_ASSIST_SOCIAL'
      Origin = 'TSDA.CD_SDA'
      DisplayFormat = '#0,.00'
      EditFormat = '#0.00'
    end
    object qry_sda_PC_TAXA: TFloatField
      FieldName = 'PC_TAXA'
      Origin = 'TSDA.CD_SDA'
      DisplayFormat = '#0,.00'
      EditFormat = '#0.00'
    end
    object qry_sda_IN_CALC_FOB: TStringField
      FieldName = 'IN_CALC_FOB'
      Origin = 'TSDA.CD_SDA'
      Size = 1
    end
  end
  object qry_ult_sda_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT MAX(CD_SDA) AS ULTIMO'
      'FROM TSDA')
    Left = 16
    Top = 84
    object qry_ult_sda_ULTIMO: TStringField
      FieldName = 'ULTIMO'
      Origin = 'TSDA.CD_SDA'
      Size = 3
    end
  end
  object ds_yesno: TDataSource
    DataSet = tbl_yesno_
    Left = 17
    Top = 147
  end
  object tbl_yesno_: TTable
    DatabaseName = 'DBBROKER'
    SessionName = 'Default'
    IndexFieldNames = 'CD_YESNO'
    TableName = 'TYES_NO'
    Left = 92
    Top = 147
    object tbl_yesno_CD_YESNO: TStringField
      FieldName = 'CD_YESNO'
      Size = 1
    end
    object tbl_yesno_TX_YESNO: TStringField
      FieldName = 'TX_YESNO'
      Size = 3
    end
    object tbl_yesno_IN_YESNO: TBooleanField
      FieldName = 'IN_YESNO'
      Required = True
    end
  end
end
