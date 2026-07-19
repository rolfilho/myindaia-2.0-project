object datm_pais: Tdatm_pais
  OldCreateOrder = True
  Left = 552
  Top = 142
  Height = 302
  Width = 356
  object ds_pais: TDataSource
    DataSet = qry_pais_broker_
    Left = 31
    Top = 17
  end
  object qry_pais_broker_: TQuery
    DatabaseName = 'DBBROKER'
    RequestLive = True
    SQL.Strings = (
      'SELECT * FROM TPAIS_BROKER'
      'ORDER BY'
      'CD_PAIS ')
    Left = 130
    Top = 17
    object qry_pais_broker_CD_PAIS: TStringField
      FieldName = 'CD_PAIS'
      Origin = 'TPAIS_BROKER.CD_PAIS'
      Size = 3
    end
    object qry_pais_broker_NM_PAIS: TStringField
      FieldName = 'NM_PAIS'
      Origin = 'TPAIS_BROKER.NM_PAIS'
      Size = 120
    end
    object qry_pais_broker_NM_PAIS_PORT: TStringField
      FieldName = 'NM_PAIS_PORT'
      Origin = 'TPAIS_BROKER.NM_PAIS_PORT'
      Size = 50
    end
    object qry_pais_broker_NM_PAIS_ING: TStringField
      FieldName = 'NM_PAIS_ING'
      Origin = 'TPAIS_BROKER.NM_PAIS_ING'
      Size = 50
    end
    object qry_pais_broker_NM_PAIS_ESP: TStringField
      FieldName = 'NM_PAIS_ESP'
      Origin = 'TPAIS_BROKER.NM_PAIS_ESP'
      Size = 50
    end
    object qry_pais_broker_CD_SCX_EXP: TStringField
      FieldName = 'CD_SCX_EXP'
      Origin = 'TPAIS_BROKER.CD_PAIS'
      Size = 4
    end
    object qry_pais_broker_NM_SIGLA_CRT: TStringField
      FieldName = 'NM_SIGLA_CRT'
      Origin = 'TPAIS_BROKER.CD_PAIS'
      Size = 2
    end
    object qry_pais_broker_IN_NALADI_FATURA: TStringField
      FieldName = 'IN_NALADI_FATURA'
      Origin = 'TPAIS_BROKER.CD_PAIS'
      Size = 1
    end
    object qry_pais_broker_IN_NCM_FATURA: TStringField
      FieldName = 'IN_NCM_FATURA'
      Origin = 'TPAIS_BROKER.NM_PAIS'
      Size = 1
    end
    object qry_pais_broker_IN_ALADI: TStringField
      FieldName = 'IN_ALADI'
      Origin = 'DBBROKER.TPAIS_BROKER.IN_ALADI'
      FixedChar = True
      Size = 1
    end
    object qry_pais_broker_IN_FUMIGACAO: TStringField
      FieldName = 'IN_FUMIGACAO'
      Origin = 'DBBROKER.TPAIS_BROKER.IN_FUMIGACAO'
      FixedChar = True
      Size = 1
    end
    object qry_pais_broker_IN_ALADI_EXP: TStringField
      FieldName = 'IN_ALADI_EXP'
      Origin = 'DBBROKER.TPAIS_BROKER.IN_ALADI_EXP'
      FixedChar = True
      Size = 1
    end
    object qry_pais_broker_IN_FUMIGACAO_EXP: TStringField
      FieldName = 'IN_FUMIGACAO_EXP'
      Origin = 'DBBROKER.TPAIS_BROKER.IN_FUMIGACAO_EXP'
      FixedChar = True
      Size = 1
    end
    object qry_pais_broker_NM_CONTINENTE: TStringField
      FieldName = 'NM_CONTINENTE'
      Origin = 'DBBROKER.TPAIS_BROKER.NM_CONTINENTE'
      FixedChar = True
    end
  end
  object tbl_yesno_: TTable
    DatabaseName = 'DBBROKER'
    IndexFieldNames = 'CD_YESNO'
    TableName = 'TYES_NO'
    Left = 130
    Top = 72
  end
  object ds_yesno: TDataSource
    DataSet = tbl_yesno_
    Left = 31
    Top = 72
  end
end
