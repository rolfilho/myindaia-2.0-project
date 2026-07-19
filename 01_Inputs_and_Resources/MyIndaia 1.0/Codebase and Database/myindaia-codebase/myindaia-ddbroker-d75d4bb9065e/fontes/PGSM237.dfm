object datm_depto_cargo: Tdatm_depto_cargo
  Left = 365
  Top = 222
  Height = 200
  Width = 241
  object qry_cargo_: TQuery
    DatabaseName = 'DBBROKER'
    RequestLive = True
    SQL.Strings = (
      'SELECT * '
      'FROM TDEPTO_CARGO ORDER BY'
      'CD_DEPTO_CARGO')
    Left = 28
    Top = 14
    object qry_cargo_CD_DEPTO_CARGO: TStringField
      FieldName = 'CD_DEPTO_CARGO'
      Origin = 'TDEPTO_CARGO.CD_DEPTO_CARGO'
      Size = 3
    end
    object qry_cargo_NM_DEPTO_CARGO: TStringField
      FieldName = 'NM_DEPTO_CARGO'
      Origin = 'TDEPTO_CARGO.NM_DEPTO_CARGO'
      Size = 30
    end
  end
  object qry_ult_cargo_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT MAX( CD_DEPTO_CARGO ) ULTIMO'
      'FROM TDEPTO_CARGO')
    Left = 108
    Top = 14
    object qry_ult_cargo_ULTIMO: TStringField
      FieldName = 'ULTIMO'
      Origin = 'TDEPTO_CARGO.CD_DEPTO_CARGO'
      Size = 3
    end
  end
  object ds_cargo: TDataSource
    DataSet = qry_cargo_
    Left = 28
    Top = 62
  end
end
