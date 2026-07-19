object datm_etapa: Tdatm_etapa
  Left = 68
  Top = 96
  Height = 150
  Width = 215
  object ds_etapa: TDataSource
    DataSet = qry_etapa_
    Left = 36
    Top = 24
  end
  object tbl_etapa_: TTable
    DatabaseName = 'DBCAD'
    TableName = 'TETAPA'
    Left = 184
    Top = 28
    object tbl_etapa_CD_ETAPA: TStringField
      DisplayLabel = 'Código'
      FieldName = 'CD_ETAPA'
      Required = True
      Size = 3
    end
    object tbl_etapa_NM_ETAPA: TStringField
      DisplayLabel = 'Descrição'
      FieldName = 'NM_ETAPA'
      Required = True
      Size = 50
    end
  end
  object qry_etapa_: TQuery
    DatabaseName = 'DBCAD'
    SQL.Strings = (
      'SELECT * '
      'FROM TETAPA')
    Left = 108
    Top = 24
  end
end
