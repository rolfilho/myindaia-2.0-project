object datm_feriado: Tdatm_feriado
  Left = 200
  Top = 104
  Height = 150
  Width = 215
  object qry_feriado_: TQuery
    DatabaseName = 'DBBROKER'
    RequestLive = True
    SQL.Strings = (
      'SELECT * FROM   TFERIADO'
      'ORDER BY'
      'DT_FERIADO')
    Left = 96
    Top = 24
    object qry_feriado_DT_FERIADO: TDateTimeField
      FieldName = 'DT_FERIADO'
      Origin = 'TFERIADO.DT_FERIADO'
      DisplayFormat = 'dd/mm/yyyy'
      EditMask = '!99/99/0000;1;_'
    end
    object qry_feriado_NM_FERIADO: TStringField
      FieldName = 'NM_FERIADO'
      Origin = 'TFERIADO.NM_FERIADO'
      Size = 50
    end
  end
  object ds_feriado: TDataSource
    DataSet = qry_feriado_
    Left = 24
    Top = 24
  end
end
