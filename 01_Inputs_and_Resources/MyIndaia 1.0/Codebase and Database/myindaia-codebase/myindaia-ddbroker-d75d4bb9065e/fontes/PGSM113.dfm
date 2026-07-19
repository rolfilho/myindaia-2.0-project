object datm_despachante: Tdatm_despachante
  Left = 310
  Top = 109
  Height = 367
  Width = 272
  object ds_despachante: TDataSource
    DataSet = qry_despachante_
    Left = 54
    Top = 20
  end
  object qry_despachante_: TQuery
    DatabaseName = 'DBBROKER'
    RequestLive = True
    SQL.Strings = (
      'SELECT * FROM TDESPACHANTE'
      'ORDER BY'
      'CD_DESPACHANTE')
    Left = 146
    Top = 20
    object qry_despachante_CD_DESPACHANTE: TStringField
      DisplayLabel = 'Código'
      FieldName = 'CD_DESPACHANTE'
      Origin = 'TDESPACHANTE.CD_DESPACHANTE'
      Size = 3
    end
    object qry_despachante_NM_DESPACHANTE: TStringField
      DisplayLabel = 'Nome'
      FieldName = 'NM_DESPACHANTE'
      Origin = 'TDESPACHANTE.NM_DESPACHANTE'
      Size = 50
    end
    object qry_despachante_AP_DESPACHANTE: TStringField
      DisplayLabel = 'Apelido'
      FieldName = 'AP_DESPACHANTE'
      Origin = 'TDESPACHANTE.AP_DESPACHANTE'
      Size = 10
    end
    object qry_despachante_VL_MIN_SDA: TFloatField
      DisplayLabel = 'Valor Mín. SDA'
      FieldName = 'VL_MIN_SDA'
      Origin = 'TDESPACHANTE.VL_MIN_SDA'
      DisplayFormat = '#0,.00'
      EditFormat = '#0.00'
    end
    object qry_despachante_VL_MAX_SDA: TFloatField
      DisplayLabel = 'Valor Máx. SDA'
      FieldName = 'VL_MAX_SDA'
      Origin = 'TDESPACHANTE.VL_MAX_SDA'
      DisplayFormat = '#0,.00'
      EditFormat = '#0.00'
    end
    object qry_despachante_CD_RISC: TStringField
      FieldName = 'CD_RISC'
      Origin = 'TDESPACHANTE.CD_RISC'
      Size = 3
    end
    object qry_despachante_IN_ATIVO: TStringField
      Alignment = taCenter
      DisplayLabel = 'Ativo'
      FieldName = 'IN_ATIVO'
      Origin = 'TDESPACHANTE.IN_ATIVO'
      Size = 1
    end
    object qry_despachante_LookAtivo: TStringField
      Alignment = taCenter
      DisplayLabel = 'Ativo'
      FieldName = 'LookAtivo'
      LookupDataSet = tbl_yesno_
      LookupKeyFields = 'CD_YESNO'
      LookupResultField = 'TX_YESNO'
      KeyFields = 'IN_ATIVO'
      Size = 3
      Lookup = True
    end
    object qry_despachante_CD_FAVORECIDO: TStringField
      FieldName = 'CD_FAVORECIDO'
      Origin = 'TDESPACHANTE.CD_DESPACHANTE'
      Size = 5
    end
    object qry_despachante_CD_MOD_SDA: TStringField
      FieldName = 'CD_MOD_SDA'
      Origin = 'TDESPACHANTE.NM_DESPACHANTE'
      Size = 2
    end
    object qry_despachante_NR_REGISTRO: TStringField
      FieldName = 'NR_REGISTRO'
      Origin = 'TDESPACHANTE.AP_DESPACHANTE'
      Size = 9
    end
    object qry_despachante_LookSDA: TStringField
      FieldName = 'LookSDA'
      LookupDataSet = qry_mod_sda
      LookupKeyFields = 'CD_MOD_SDA'
      LookupResultField = 'NM_MOD_SDA'
      KeyFields = 'CD_MOD_SDA'
      Lookup = True
    end
    object qry_despachante_LookFavorecido: TStringField
      FieldName = 'LookFavorecido'
      LookupDataSet = qry_favorecido_
      LookupKeyFields = 'CD_FAVORECIDO'
      LookupResultField = 'NM_FAVORECIDO'
      KeyFields = 'CD_FAVORECIDO'
      Size = 120
      Lookup = True
    end
    object qry_despachante_CPF_DESPACHANTE: TStringField
      FieldName = 'CPF_DESPACHANTE'
      Origin = 'TDESPACHANTE.CD_DESPACHANTE'
      EditMask = '999.999.999-99;0;_'
      Size = 11
    end
    object qry_despachante_NR_CONTA_CORRENTE: TStringField
      FieldName = 'NR_CONTA_CORRENTE'
      Origin = 'TDESPACHANTE.CD_DESPACHANTE'
      Size = 10
    end
    object qry_despachante_NR_DIGITO_CONTA_CORRENTE: TStringField
      FieldName = 'NR_DIGITO_CONTA_CORRENTE'
      Origin = 'TDESPACHANTE.NM_DESPACHANTE'
      Size = 1
    end
    object qry_despachante_CD_DESP_SDA: TStringField
      FieldName = 'CD_DESP_SDA'
      Origin = 'TDESPACHANTE.CD_DESPACHANTE'
      Size = 12
    end
  end
  object qry_ult_despachante_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT MAX(CD_DESPACHANTE) AS ULTIMO'
      'FROM TDESPACHANTE')
    Left = 54
    Top = 141
    object qry_ult_despachante_ULTIMO: TStringField
      FieldName = 'ULTIMO'
      Origin = 'TDESPACHANTE.CD_DESPACHANTE'
      Size = 3
    end
  end
  object tbl_yesno_: TTable
    Active = True
    DatabaseName = 'DBBROKER'
    IndexFieldNames = 'CD_YESNO'
    TableName = 'TYES_NO'
    Left = 146
    Top = 81
  end
  object ds_yesno: TDataSource
    DataSet = tbl_yesno_
    Left = 54
    Top = 81
  end
  object qry_favorecido_: TQuery
    Active = True
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT CD_FAVORECIDO, NM_FAVORECIDO'
      'FROM TFAVORECIDO')
    Left = 164
    Top = 141
    object qry_favorecido_CD_FAVORECIDO: TStringField
      FieldName = 'CD_FAVORECIDO'
      Origin = 'TFAVORECIDO.CD_FAVORECIDO'
      Size = 5
    end
    object qry_favorecido_NM_FAVORECIDO: TStringField
      FieldName = 'NM_FAVORECIDO'
      Origin = 'TFAVORECIDO.NM_FAVORECIDO'
      Size = 50
    end
  end
  object qry_mod_sda: TQuery
    Active = True
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT CD_MOD_SDA, NM_MOD_SDA'
      'FROM TTP_MOD_SDA')
    Left = 172
    Top = 202
    object qry_mod_sdaCD_MOD_SDA: TStringField
      FieldName = 'CD_MOD_SDA'
      Origin = 'TTP_MOD_SDA.CD_MOD_SDA'
      Size = 2
    end
    object qry_mod_sdaNM_MOD_SDA: TStringField
      FieldName = 'NM_MOD_SDA'
      Origin = 'TTP_MOD_SDA.NM_MOD_SDA'
    end
  end
  object ds_mod_sda: TDataSource
    DataSet = qry_mod_sda
    Left = 54
    Top = 201
  end
end
