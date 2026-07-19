object datm_etapa: Tdatm_etapa
  OldCreateOrder = True
  Left = 68
  Top = 96
  Height = 260
  Width = 214
  object ds_etapa: TDataSource
    DataSet = qry_etapa_
    Left = 36
    Top = 24
  end
  object qry_etapa_: TQuery
    DatabaseName = 'DBBROKER'
    RequestLive = True
    SQL.Strings = (
      'SELECT * FROM TETAPA'
      'ORDER BY'
      'CD_ETAPA')
    Left = 108
    Top = 24
    object qry_etapa_CD_ETAPA: TIntegerField
      FieldName = 'CD_ETAPA'
      Origin = 'DBBROKER.TETAPA.CD_ETAPA'
    end
    object qry_etapa_NM_ETAPA: TStringField
      DisplayLabel = 'Descri'#231#227'o'
      DisplayWidth = 3
      FieldName = 'NM_ETAPA'
      Origin = 'TETAPA.NM_ETAPA'
      Size = 50
    end
    object qry_etapa_IN_ATIVO: TStringField
      DisplayLabel = 'Ativo'
      FieldName = 'IN_ATIVO'
      Origin = 'TETAPA.CD_ETAPA'
      Size = 1
    end
    object qry_etapa_LookAtivo: TStringField
      DisplayWidth = 3
      FieldKind = fkLookup
      FieldName = 'LookAtivo'
      LookupDataSet = tbl_yesno_
      LookupKeyFields = 'CD_YESNO'
      LookupResultField = 'TX_YESNO'
      KeyFields = 'IN_ATIVO'
      Size = 3
      Lookup = True
    end
    object qry_etapa_NM_INGLES: TStringField
      FieldName = 'NM_INGLES'
      Origin = 'DBBROKER.TETAPA.NM_INGLES'
      FixedChar = True
      Size = 50
    end
    object qry_etapa_NM_ESPANHOL: TStringField
      FieldName = 'NM_ESPANHOL'
      Origin = 'DBBROKER.TETAPA.NM_ESPANHOL'
      FixedChar = True
      Size = 50
    end
    object qry_etapa_CD_UNID_NEG: TStringField
      FieldName = 'CD_UNID_NEG'
      Origin = 'DBBROKER.TETAPA.CD_UNID_NEG'
      FixedChar = True
      Size = 2
    end
    object qry_etapa_CD_PRODUTO: TStringField
      FieldName = 'CD_PRODUTO'
      Origin = 'DBBROKER.TETAPA.CD_PRODUTO'
      FixedChar = True
      Size = 2
    end
    object qry_etapa_CD_EVENTO: TStringField
      FieldName = 'CD_EVENTO'
      Origin = 'DBBROKER.TETAPA.CD_EVENTO'
      FixedChar = True
      Size = 3
    end
    object qry_etapa_IN_ETAPA_AUTOMATICA: TStringField
      FieldName = 'IN_ETAPA_AUTOMATICA'
      Origin = 'DBBROKER.TETAPA.IN_ETAPA_AUTOMATICA'
      FixedChar = True
      Size = 1
    end
    object qry_etapa_IN_RETRABALHO: TStringField
      FieldName = 'IN_RETRABALHO'
      Origin = 'DBBROKER.TETAPA.IN_RETRABALHO'
      FixedChar = True
      Size = 1
    end
  end
  object ds_yesno: TDataSource
    DataSet = tbl_yesno_
    Left = 36
    Top = 88
  end
  object tbl_yesno_: TTable
    DatabaseName = 'DBBROKER'
    IndexFieldNames = 'CD_YESNO'
    TableName = 'TYES_NO'
    Left = 108
    Top = 88
    object tbl_yesno_CD_YESNO: TStringField
      FieldName = 'CD_YESNO'
      Size = 1
    end
    object tbl_yesno_TX_YESNO: TStringField
      FieldName = 'TX_YESNO'
      Size = 3
    end
  end
  object qry_ult_etapa_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT MAX(CD_ETAPA) AS ULTIMO'
      'FROM TETAPA')
    Left = 36
    Top = 148
    object qry_ult_etapa_ULTIMO: TStringField
      FieldName = 'ULTIMO'
      Origin = 'TETAPA.CD_ETAPA'
      Size = 3
    end
  end
end
