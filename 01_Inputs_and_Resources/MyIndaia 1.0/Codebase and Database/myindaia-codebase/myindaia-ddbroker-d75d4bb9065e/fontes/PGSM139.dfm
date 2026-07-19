object datm_mod_follow_up: Tdatm_mod_follow_up
  Left = 200
  Top = 104
  Height = 321
  Width = 424
  object ds_mod_follow_up: TDataSource
    DataSet = qry_mod_follow_up_
    OnStateChange = ds_mod_follow_upStateChange
    Left = 83
    Top = 14
  end
  object qry_mod_follow_up_: TQuery
    DatabaseName = 'DBBROKER'
    RequestLive = True
    SQL.Strings = (
      'SELECT * FROM TMOD_FOLLOW_UP'
      'ORDER BY '
      'CD_FOLLOW_UP')
    Left = 223
    Top = 14
    object qry_mod_follow_up_CD_FOLLOW_UP: TStringField
      FieldName = 'CD_FOLLOW_UP'
      Origin = 'TMOD_FOLLOW_UP.CD_FOLLOW_UP'
      Size = 2
    end
    object qry_mod_follow_up_NM_FOLLOW_UP: TStringField
      FieldName = 'NM_FOLLOW_UP'
      Origin = 'TMOD_FOLLOW_UP.NM_FOLLOW_UP'
      Size = 30
    end
    object qry_mod_follow_up_IN_ATIVO: TStringField
      FieldName = 'IN_ATIVO'
      Origin = 'TMOD_FOLLOW_UP.IN_ATIVO'
      Size = 1
    end
    object qry_mod_follow_up_IN_ARM_DESC: TStringField
      FieldName = 'IN_ARM_DESC'
      Origin = 'TMOD_FOLLOW_UP.IN_ARM_DESC'
      Size = 1
    end
    object qry_mod_follow_up_IN_MERCADORIA: TStringField
      FieldName = 'IN_MERCADORIA'
      Origin = 'TMOD_FOLLOW_UP.IN_MERCADORIA'
      Size = 1
    end
    object qry_mod_follow_up_IN_NR_DI: TStringField
      FieldName = 'IN_NR_DI'
      Origin = 'TMOD_FOLLOW_UP.IN_NR_DI'
      Size = 1
    end
    object qry_mod_follow_up_IN_OBS: TStringField
      FieldName = 'IN_OBS'
      Origin = 'TMOD_FOLLOW_UP.IN_OBS'
      Size = 1
    end
    object qry_mod_follow_up_IN_EMBARCACAO: TStringField
      FieldName = 'IN_EMBARCACAO'
      Origin = 'TMOD_FOLLOW_UP.IN_EMBARCACAO'
      Size = 1
    end
    object qry_mod_follow_up_lokk_ativo: TStringField
      FieldName = 'lokk_ativo'
      LookupDataSet = tbl_yesno_
      LookupKeyFields = 'CD_YESNO'
      LookupResultField = 'TX_YESNO'
      KeyFields = 'IN_ATIVO'
      Size = 3
      Lookup = True
    end
  end
  object tbl_yesno_: TTable
    DatabaseName = 'DBBROKER'
    IndexFieldNames = 'CD_YESNO'
    TableName = 'TYES_NO'
    Left = 223
    Top = 180
  end
  object ds_yesno: TDataSource
    DataSet = tbl_yesno_
    Left = 83
    Top = 180
  end
  object ds_mod_follow_up_evento: TDataSource
    DataSet = qry_mod_follow_up_evento_
    OnStateChange = ds_mod_follow_up_eventoStateChange
    Left = 83
    Top = 68
  end
  object qry_mod_follow_up_evento_: TQuery
    DatabaseName = 'DBBROKER'
    DataSource = ds_mod_follow_up
    RequestLive = True
    SQL.Strings = (
      'SELECT * '
      'FROM TMOD_FOLLOW_UP_EVENTO'
      'WHERE CD_FOLLOW_UP = :CD_FOLLOW_UP'
      'ORDER BY NR_ORDEM')
    Params.Data = {010001000C43445F464F4C4C4F575F55500001020030000100}
    Left = 223
    Top = 68
    object qry_mod_follow_up_evento_CD_FOLLOW_UP: TStringField
      FieldName = 'CD_FOLLOW_UP'
      Origin = 'TMOD_FOLLOW_UP_EVENTO.CD_FOLLOW_UP'
      Size = 2
    end
    object qry_mod_follow_up_evento_CD_EVENTO: TStringField
      FieldName = 'CD_EVENTO'
      Origin = 'TMOD_FOLLOW_UP_EVENTO.CD_EVENTO'
      Size = 3
    end
    object qry_mod_follow_up_evento_NR_ORDEM: TIntegerField
      FieldName = 'NR_ORDEM'
      Origin = 'TMOD_FOLLOW_UP_EVENTO.NR_ORDEM'
    end
    object qry_mod_follow_up_evento_look_evento: TStringField
      FieldName = 'look_evento'
      LookupDataSet = qry_evento_
      LookupKeyFields = 'CD_EVENTO'
      LookupResultField = 'NM_EVENTO'
      KeyFields = 'CD_EVENTO'
      Size = 50
      Lookup = True
    end
  end
  object ds_evento: TDataSource
    DataSet = qry_evento_
    Left = 83
    Top = 124
  end
  object qry_evento_: TQuery
    DatabaseName = 'DBBROKER'
    ParamCheck = False
    SQL.Strings = (
      'SELECT * FROM TEVENTO'
      'ORDER BY '
      'CD_EVENTO')
    Left = 223
    Top = 124
    object qry_evento_CD_EVENTO: TStringField
      DisplayLabel = 'Código'
      FieldName = 'CD_EVENTO'
      Origin = 'TEVENTO.CD_EVENTO'
      Size = 3
    end
    object qry_evento_NM_EVENTO: TStringField
      DisplayLabel = 'Descrição'
      FieldName = 'NM_EVENTO'
      Origin = 'TEVENTO.NM_EVENTO'
      Size = 50
    end
    object qry_evento_AP_EVENTO: TStringField
      FieldName = 'AP_EVENTO'
      Origin = 'TEVENTO.CD_ETAPA'
      Size = 15
    end
  end
  object qry_sel_cd_mod_follow_up: TQuery
    DatabaseName = 'DBBROKER'
    ParamCheck = False
    SQL.Strings = (
      'SELECT CD_FOLLOW_UP'
      'FROM TMOD_FOLLOW_UP'
      'ORDER BY CD_FOLLOW_UP DESC'
      '')
    Left = 223
    Top = 235
    object qry_sel_cd_mod_follow_upCD_FOLLOW_UP: TStringField
      FieldName = 'CD_FOLLOW_UP'
      Origin = 'TMOD_FOLLOW_UP.CD_FOLLOW_UP'
      Size = 2
    end
  end
end
