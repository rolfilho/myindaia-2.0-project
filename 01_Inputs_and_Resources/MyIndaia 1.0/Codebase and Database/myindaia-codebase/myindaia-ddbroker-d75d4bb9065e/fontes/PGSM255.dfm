object datm_delegacia: Tdatm_delegacia
  Left = 353
  Top = 188
  Height = 301
  Width = 550
  object ds_delegacia: TDataSource
    DataSet = qry_delegacia_
    Left = 42
    Top = 62
  end
  object qry_delegacia_: TQuery
    CachedUpdates = True
    OnUpdateError = qry_delegacia_UpdateError
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT *'
      'FROM   TDELEGACIA'
      'WHERE  CD_DELEGACIA = :CD_DELEGACIA')
    Params.Data = {010001000C43445F44454C4547414349410001020030000000}
    UpdateObject = us_delegacia
    Left = 143
    Top = 62
    object qry_delegacia_CD_DELEGACIA: TStringField
      FieldName = 'CD_DELEGACIA'
      Origin = 'TDELEGACIA.CD_DELEGACIA'
      Size = 2
    end
    object qry_delegacia_NM_DELEGACIA: TStringField
      FieldName = 'NM_DELEGACIA'
      Origin = 'TDELEGACIA.NM_DELEGACIA'
    end
  end
  object us_delegacia: TUpdateSQL
    ModifySQL.Strings = (
      'update TDELEGACIA'
      'set'
      '  CD_DELEGACIA = :CD_DELEGACIA,'
      '  NM_DELEGACIA = :NM_DELEGACIA'
      'where'
      '  CD_DELEGACIA = :OLD_CD_DELEGACIA')
    InsertSQL.Strings = (
      'insert into TDELEGACIA'
      '  (CD_DELEGACIA, NM_DELEGACIA)'
      'values'
      '  (:CD_DELEGACIA, :NM_DELEGACIA)')
    DeleteSQL.Strings = (
      'delete from TDELEGACIA'
      'where'
      '  CD_DELEGACIA = :OLD_CD_DELEGACIA')
    Left = 235
    Top = 62
  end
  object ds_lista: TDataSource
    DataSet = qry_lista_
    Left = 42
    Top = 12
  end
  object qry_lista_: TQuery
    CachedUpdates = True
    AfterOpen = qry_lista_AfterOpen
    AfterScroll = qry_lista_AfterScroll
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT CD_DELEGACIA, NM_DELEGACIA'
      'FROM   TDELEGACIA D'
      'ORDER BY'
      'CD_DELEGACIA')
    Left = 143
    Top = 12
    object qry_lista_CD_DELEGACIA: TStringField
      DisplayLabel = 'Cód.'
      FieldName = 'CD_DELEGACIA'
      Origin = 'TDELEGACIA.CD_DELEGACIA'
      Size = 2
    end
    object qry_lista_NM_DELEGACIA: TStringField
      DisplayLabel = 'Delegacia'
      FieldName = 'NM_DELEGACIA'
      Origin = 'TDELEGACIA.NM_DELEGACIA'
    end
  end
  object qry_ult_delegacia_: TQuery
    CachedUpdates = True
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT MAX(CD_DELEGACIA) AS ULTIMO'
      'FROM   TDELEGACIA')
    Left = 44
    Top = 118
    object qry_ult_delegacia_ULTIMO: TStringField
      FieldName = 'ULTIMO'
      Origin = 'TDELEGACIA.CD_DELEGACIA'
      Size = 2
    end
  end
end
