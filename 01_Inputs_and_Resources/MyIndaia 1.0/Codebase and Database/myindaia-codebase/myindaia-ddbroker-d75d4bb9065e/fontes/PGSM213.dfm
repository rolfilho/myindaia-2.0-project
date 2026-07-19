object datm_area: Tdatm_area
  OldCreateOrder = True
  Left = 656
  Top = 213
  Height = 248
  Width = 346
  object ds_area: TDataSource
    DataSet = qry_area_
    Left = 36
    Top = 24
  end
  object qry_area_: TQuery
    DatabaseName = 'DBBROKER'
    RequestLive = True
    SQL.Strings = (
      'SELECT * FROM TAREA'
      'WHERE CD_AREA <> '#39#39
      'ORDER BY'
      'CD_AREA')
    Left = 97
    Top = 24
    object qry_area_CD_AREA: TStringField
      DisplayLabel = 'C'#243'd.'
      FieldName = 'CD_AREA'
      Origin = 'TAREA.CD_AREA'
      Size = 2
    end
    object qry_area_NM_AREA: TStringField
      DisplayLabel = #193'rea'
      FieldName = 'NM_AREA'
      Origin = 'TAREA.NM_AREA'
      Size = 50
    end
    object qry_area_NM_GERENTE: TStringField
      FieldName = 'NM_GERENTE'
      Origin = 'TAREA.CD_AREA'
      Size = 50
    end
    object qry_area_NM_ANALISTA: TStringField
      FieldName = 'NM_ANALISTA'
      Origin = 'TAREA.NM_AREA'
      Size = 50
    end
    object qry_area_NM_EMAIL_GERENTE: TStringField
      FieldName = 'NM_EMAIL_GERENTE'
      Origin = 'TAREA.NM_GERENTE'
      Size = 100
    end
    object qry_area_NM_EMAIL_ANALISTA: TStringField
      FieldName = 'NM_EMAIL_ANALISTA'
      Origin = 'TAREA.NM_ANALISTA'
      Size = 100
    end
    object qry_area_NM_GRUPO: TStringField
      FieldName = 'NM_GRUPO'
      Origin = 'TAREA.CD_AREA'
      Size = 3
    end
    object qry_area_DIV_MERC: TStringField
      FieldName = 'DIV_MERC'
      Origin = 'DBBROKER.TAREA.DIV_MERC'
      FixedChar = True
      Size = 2
    end
    object qry_area_FDC_NUMERO: TStringField
      FieldName = 'FDC_NUMERO'
      Size = 4
    end
  end
  object qry_ult_area_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT MAX(CD_AREA) AS ULTIMO'
      'FROM TAREA')
    Left = 156
    Top = 24
    object qry_ult_area_ULTIMO: TStringField
      FieldName = 'ULTIMO'
      Origin = 'TAREA.CD_AREA'
      Size = 2
    end
  end
  object qry_LCC: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT * FROM TMERCADORIA_LCC'
      'ORDER BY DESCRICAO')
    Left = 32
    Top = 116
    object qry_LCCCD_LCC: TStringField
      FieldName = 'CD_LCC'
      Origin = 'DBBROKER.TMERCADORIA_LCC.CD_LCC'
      FixedChar = True
      Size = 2
    end
    object qry_LCCDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Origin = 'DBBROKER.TMERCADORIA_LCC.DESCRICAO'
      FixedChar = True
      Size = 100
    end
    object qry_LCCCD_GRUPO: TStringField
      FieldName = 'CD_GRUPO'
      Origin = 'DBBROKER.TMERCADORIA_LCC.CD_GRUPO'
      FixedChar = True
      Size = 3
    end
  end
  object ds_LCC: TDataSource
    DataSet = qry_LCC
    Left = 93
    Top = 115
  end
end
