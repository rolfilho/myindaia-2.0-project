object datm_grupo_servico: Tdatm_grupo_servico
  Left = 383
  Top = 189
  Height = 167
  Width = 248
  object us_grupo_servico: TUpdateSQL
    ModifySQL.Strings = (
      'update TGRUPO_SERVICO'
      'set'
      '  CD_GRUPO = :CD_GRUPO,'
      '  NM_GRUPO = :NM_GRUPO,'
      '  NR_META = :NR_META'
      'where'
      '  CD_GRUPO = :OLD_CD_GRUPO')
    InsertSQL.Strings = (
      'insert into TGRUPO_SERVICO'
      '  (CD_GRUPO, NM_GRUPO, NR_META)'
      'values'
      '  (:CD_GRUPO, :NM_GRUPO, :NR_META)')
    DeleteSQL.Strings = (
      'delete from TGRUPO_SERVICO'
      'where'
      '  CD_GRUPO = :OLD_CD_GRUPO')
    Left = 144
    Top = 72
  end
  object qry_grupo_servico_: TQuery
    CachedUpdates = True
    OnUpdateError = qry_grupo_servico_UpdateError
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT *'
      'FROM TGRUPO_SERVICO'
      'WHERE CD_GRUPO <> '#39#39
      'ORDER BY'
      'CD_GRUPO'
      '')
    UpdateObject = us_grupo_servico
    Left = 144
    Top = 16
    object qry_grupo_servico_CD_GRUPO: TStringField
      DisplayLabel = 'Código'
      FieldName = 'CD_GRUPO'
      Origin = 'TGRUPO_SERVICO.CD_GRUPO'
      Size = 3
    end
    object qry_grupo_servico_NM_GRUPO: TStringField
      DisplayLabel = 'Nome'
      FieldName = 'NM_GRUPO'
      Origin = 'TGRUPO_SERVICO.CD_GRUPO'
      Size = 60
    end
    object qry_grupo_servico_NR_META: TFloatField
      FieldName = 'NR_META'
      Origin = 'TGRUPO_SERVICO.CD_GRUPO'
    end
  end
  object ds_grupo_servico: TDataSource
    DataSet = qry_grupo_servico_
    Left = 40
    Top = 16
  end
  object qry_ult_grupo_servico_: TQuery
    CachedUpdates = True
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT MAX(CD_GRUPO) AS ULTIMO'
      'FROM TGRUPO_SERVICO')
    Left = 40
    Top = 72
    object qry_ult_grupo_servico_ULTIMO: TStringField
      FieldName = 'ULTIMO'
      Origin = 'TGRUPO_SERVICO.CD_GRUPO'
      Size = 3
    end
  end
end
