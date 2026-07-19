object datm_urf_scx: Tdatm_urf_scx
  Left = 200
  Top = 105
  Height = 159
  Width = 171
  object qry_urf_scx_: TQuery
    DatabaseName = 'DBBROKER'
    RequestLive = True
    SQL.Strings = (
      'SELECT * FROM'
      'TURF ORDER BY'
      'DESCRICAO')
    Left = 64
    Top = 16
    object qry_urf_scx_CODIGO: TStringField
      DisplayLabel = 'Cód.'
      FieldName = 'CODIGO'
      Origin = 'TURF.CODIGO'
      Size = 7
    end
    object qry_urf_scx_DESCRICAO: TStringField
      DisplayLabel = 'U.R.F.'
      FieldName = 'DESCRICAO'
      Origin = 'TURF.DESCRICAO'
      Size = 120
    end
    object qry_urf_scx_CD_DIGITO: TStringField
      FieldName = 'CD_DIGITO'
      Origin = 'TURF.CODIGO'
      Size = 1
    end
  end
  object ds_urf_scx: TDataSource
    DataSet = qry_urf_scx_
    Left = 64
    Top = 72
  end
end
