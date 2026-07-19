object datm_emb: Tdatm_emb
  Left = 200
  Top = 104
  Height = 173
  Width = 363
  object ds_emb: TDataSource
    DataSet = qry_emb_
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
  object qry_emb_: TQuery
    AfterPost = qry_emb_AfterPost
    DatabaseName = 'DBBROKER'
    RequestLive = True
    SQL.Strings = (
      'SELECT * FROM'
      'TEMBARCACAO ORDER BY'
      'NM_EMBARCACAO')
    Left = 136
    Top = 20
    object qry_emb_CD_EMBARCACAO: TStringField
      DisplayLabel = 'Código'
      FieldName = 'CD_EMBARCACAO'
      Origin = 'TEMBARCACAO.CD_EMBARCACAO'
      Size = 4
    end
    object qry_emb_NM_EMBARCACAO: TStringField
      DisplayLabel = 'Descrição'
      FieldName = 'NM_EMBARCACAO'
      Origin = 'TEMBARCACAO.NM_EMBARCACAO'
      Size = 40
    end
    object qry_emb_IN_RORO: TStringField
      FieldName = 'IN_RORO'
      Origin = 'TEMBARCACAO.IN_RORO'
      Size = 1
    end
    object qry_emb_IN_ATIVO: TStringField
      FieldName = 'IN_ATIVO'
      Origin = 'TEMBARCACAO.IN_ATIVO'
      Size = 1
    end
    object qry_emb_look_ativo: TStringField
      DisplayLabel = 'Ativo'
      FieldName = 'look_ativo'
      LookupDataSet = tbl_yesno_
      LookupKeyFields = 'CD_YESNO'
      LookupResultField = 'TX_YESNO'
      KeyFields = 'IN_ATIVO'
      Size = 3
      Lookup = True
    end
    object qry_emb_look_roro: TStringField
      DisplayLabel = 'RORO'
      FieldName = 'look_roro'
      LookupDataSet = tbl_yesno_
      LookupKeyFields = 'CD_YESNO'
      LookupResultField = 'TX_YESNO'
      KeyFields = 'IN_RORO'
      Size = 3
      Lookup = True
    end
    object qry_emb_CD_BANDEIRA: TStringField
      FieldName = 'CD_BANDEIRA'
      Origin = 'TEMBARCACAO.CD_EMBARCACAO'
      Size = 3
    end
    object qry_emb_LookPais: TStringField
      FieldName = 'LookPais'
      LookupDataSet = qry_pais_
      LookupKeyFields = 'CODIGO'
      LookupResultField = 'DESCRICAO'
      KeyFields = 'CD_BANDEIRA'
      Size = 40
      Lookup = True
    end
  end
  object qry_ult_emb_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT MAX(CD_EMBARCACAO) AS ULTIMO'
      'FROM TEMBARCACAO')
    Left = 241
    Top = 20
    object qry_ult_emb_ULTIMO: TStringField
      FieldName = 'ULTIMO'
      Origin = 'TEMBARCACAO.CD_EMBARCACAO'
      Size = 4
    end
  end
  object qry_pais_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT CODIGO, DESCRICAO'
      'FROM TPAIS')
    Left = 240
    Top = 72
    object qry_pais_CODIGO: TStringField
      FieldName = 'CODIGO'
      Origin = 'TPAIS.CODIGO'
      Size = 3
    end
    object qry_pais_DESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Origin = 'TPAIS.DESCRICAO'
      Size = 120
    end
  end
end
