object datm_prop_merc: Tdatm_prop_merc
  Left = 200
  Top = 128
  Height = 202
  Width = 311
  object ds_prop_merc: TDataSource
    DataSet = qry_prop_merc_
    Left = 41
    Top = 26
  end
  object qry_prop_merc_: TQuery
    CachedUpdates = True
    OnUpdateError = qry_prop_merc_UpdateError
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT * FROM TPROPRIETARIO_MERC'
      'WHERE CD_PROPRIETARIO <> '#39#39
      'ORDER BY'
      'CD_PROPRIETARIO'
      '')
    UpdateObject = us_prop_merc
    Left = 142
    Top = 26
    object qry_prop_merc_CD_PROPRIETARIO: TStringField
      DisplayLabel = 'Cód.'
      FieldName = 'CD_PROPRIETARIO'
      Origin = 'TPROPRIETARIO_MERC.CD_PROPRIETARIO'
      Size = 3
    end
    object qry_prop_merc_NM_PROPRIETARIO: TStringField
      DisplayLabel = 'Nome'
      FieldName = 'NM_PROPRIETARIO'
      Origin = 'TPROPRIETARIO_MERC.NM_PROPRIETARIO'
      Size = 50
    end
  end
  object qry_ult_prop_merc_: TQuery
    Active = True
    CachedUpdates = True
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT MAX(CD_PROPRIETARIO) AS ULTIMO'
      'FROM TPROPRIETARIO_MERC')
    Left = 40
    Top = 98
    object qry_ult_prop_merc_ULTIMO: TStringField
      FieldName = 'ULTIMO'
      Origin = 'TPROPRIETARIO_MERC.CD_PROPRIETARIO'
      Size = 3
    end
  end
  object us_prop_merc: TUpdateSQL
    ModifySQL.Strings = (
      'update TPROPRIETARIO_MERC'
      'set'
      '  CD_PROPRIETARIO = :CD_PROPRIETARIO,'
      '  NM_PROPRIETARIO = :NM_PROPRIETARIO'
      'where'
      '  CD_PROPRIETARIO = :OLD_CD_PROPRIETARIO')
    InsertSQL.Strings = (
      'insert into TPROPRIETARIO_MERC'
      '  (CD_PROPRIETARIO, NM_PROPRIETARIO)'
      'values'
      '  (:CD_PROPRIETARIO, :NM_PROPRIETARIO)')
    DeleteSQL.Strings = (
      'delete from TPROPRIETARIO_MERC'
      'where'
      '  CD_PROPRIETARIO = :OLD_CD_PROPRIETARIO')
    Left = 144
    Top = 96
  end
end
