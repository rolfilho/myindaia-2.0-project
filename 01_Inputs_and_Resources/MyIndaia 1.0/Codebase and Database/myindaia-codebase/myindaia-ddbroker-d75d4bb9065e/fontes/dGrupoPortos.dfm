object datm_grupo_portos: Tdatm_grupo_portos
  OldCreateOrder = False
  Left = 200
  Top = 247
  Height = 311
  Width = 312
  object qry_grupo_portos_: TQuery
    CachedUpdates = True
    AfterPost = qry_grupo_portos_AfterPost
    AfterDelete = qry_grupo_portos_AfterDelete
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT CD_GRUPO_PORTO, NM_GRUPO_PORTO'
      'FROM TGRUPO_PORTO'
      'ORDER BY'
      'CD_GRUPO_PORTO'
      ''
      '')
    UpdateObject = upd_grupo_portos
    Left = 64
    Top = 136
    object qry_grupo_portos_CD_GRUPO_PORTO: TStringField
      FieldName = 'CD_GRUPO_PORTO'
      Origin = 'BROKER.TPORTO_GRUPO.CD_GRUPO_PORTO'
      FixedChar = True
      Size = 4
    end
    object qry_grupo_portos_NM_GRUPO_PORTO: TStringField
      FieldName = 'NM_GRUPO_PORTO'
      Origin = 'BROKER.TPORTO_GRUPO.NM_GRUPO_PORTO'
      FixedChar = True
      Size = 50
    end
  end
  object ds_grupo_portos: TDataSource
    DataSet = qry_grupo_portos_
    Left = 72
    Top = 24
  end
  object upd_grupo_portos: TUpdateSQL
    ModifySQL.Strings = (
      'update TGRUPO_PORTO'
      'set'
      '  NM_GRUPO_PORTO = :NM_GRUPO_PORTO'
      'where'
      '  CD_GRUPO_PORTO = :OLD_CD_GRUPO_PORTO')
    InsertSQL.Strings = (
      'insert into TGRUPO_PORTO'
      '  (CD_GRUPO_PORTO, NM_GRUPO_PORTO)'
      'values'
      '  (:CD_GRUPO_PORTO, :NM_GRUPO_PORTO)')
    DeleteSQL.Strings = (
      'delete from TGRUPO_PORTO'
      'where'
      '  CD_GRUPO_PORTO = :OLD_CD_GRUPO_PORTO')
    Left = 72
    Top = 80
  end
  object qry_ult_grupo_portos_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT MAX(A.CD_GRUPO_PORTO) ULTIMO'
      'FROM  TGRUPO_PORTO A')
    Left = 72
    Top = 204
    object qry_ult_grupo_portos_ULTIMO: TStringField
      FieldName = 'ULTIMO'
      Origin = 'BROKER.TPORTO.CD_PORTO'
      FixedChar = True
      Size = 4
    end
  end
end
