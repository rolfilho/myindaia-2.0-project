object datm_depto: Tdatm_depto
  Left = 270
  Top = 154
  Height = 238
  Width = 294
  object qry_depto_: TQuery
    DatabaseName = 'DBBROKER'
    RequestLive = True
    SQL.Strings = (
      'SELECT * '
      'FROM TDEPTO ORDER BY'
      'NM_DEPTO')
    Left = 32
    Top = 24
    object qry_depto_CD_DEPTO: TStringField
      FieldName = 'CD_DEPTO'
      Origin = 'TDEPTO.CD_DEPTO'
      Size = 3
    end
    object qry_depto_NM_DEPTO: TStringField
      FieldName = 'NM_DEPTO'
      Origin = 'TDEPTO.NM_DEPTO'
      Size = 30
    end
  end
  object ds_depto: TDataSource
    DataSet = qry_depto_
    Left = 31
    Top = 81
  end
  object qry_ult_depto_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT MAX( CD_DEPTO ) ULTIMO'
      'FROM TDEPTO')
    Left = 112
    Top = 24
    object qry_ult_depto_ULTIMO: TStringField
      FieldName = 'ULTIMO'
      Origin = 'TDEPTO.CD_DEPTO'
      Size = 3
    end
  end
end
