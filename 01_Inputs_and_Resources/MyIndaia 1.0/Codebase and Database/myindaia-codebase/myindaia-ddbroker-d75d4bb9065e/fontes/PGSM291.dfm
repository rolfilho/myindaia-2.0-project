object datm_cntr: Tdatm_cntr
  OldCreateOrder = False
  Left = 280
  Top = 196
  Height = 182
  Width = 186
  object qry_cntr_: TQuery
    CachedUpdates = True
    BeforePost = qry_cntr_BeforePost
    AfterPost = qry_cntr_AfterPost
    AfterDelete = qry_cntr_AfterDelete
    DatabaseName = 'DBBROKER'
    RequestLive = True
    SQL.Strings = (
      'SELECT TP_CNTR, NM_TP_CNTR, IN_ATIVO, TP_PESO, CD_ISO'
      '   FROM TTP_CNTR'
      '  ORDER BY  '
      '   TP_CNTR')
    UpdateObject = IpDate_cntr
    Left = 32
    Top = 16
    object qry_cntr_TP_CNTR: TStringField
      FieldName = 'TP_CNTR'
      Origin = 'DBBROKER.TTP_CNTR.TP_CNTR'
      FixedChar = True
      Size = 2
    end
    object qry_cntr_NM_TP_CNTR: TStringField
      FieldName = 'NM_TP_CNTR'
      Origin = 'DBBROKER.TTP_CNTR.NM_TP_CNTR'
      FixedChar = True
    end
    object qry_cntr_IN_ATIVO: TStringField
      FieldName = 'IN_ATIVO'
      Origin = 'DBBROKER.TTP_CNTR.IN_ATIVO'
      FixedChar = True
      Size = 1
    end
    object qry_cntr_TP_PESO: TStringField
      FieldName = 'TP_PESO'
      Origin = 'DBBROKER.TTP_CNTR.TP_PESO'
      FixedChar = True
      Size = 1
    end
    object qry_cntr_CD_ISO: TStringField
      FieldName = 'CD_ISO'
      Origin = 'DBBROKER.TTP_CNTR.CD_ISO'
      FixedChar = True
      Size = 4
    end
  end
  object ds_cntr: TDataSource
    DataSet = qry_cntr_
    Left = 120
    Top = 16
  end
  object IpDate_cntr: TUpdateSQL
    ModifySQL.Strings = (
      'update TTP_CNTR'
      'set'
      '  TP_CNTR = :TP_CNTR,'
      '  NM_TP_CNTR = :NM_TP_CNTR,'
      '  IN_ATIVO = :IN_ATIVO,'
      '  TP_PESO = :TP_PESO,'
      '  CD_ISO = :CD_ISO'
      'where'
      '  TP_CNTR = :OLD_TP_CNTR')
    InsertSQL.Strings = (
      'insert into TTP_CNTR'
      '  (TP_CNTR, NM_TP_CNTR, IN_ATIVO, TP_PESO, CD_ISO)'
      'values'
      '  (:TP_CNTR, :NM_TP_CNTR, :IN_ATIVO, :TP_PESO, :CD_ISO)')
    DeleteSQL.Strings = (
      'delete from TTP_CNTR'
      'where'
      '  TP_CNTR = :OLD_TP_CNTR')
    Left = 40
    Top = 88
  end
  object qry_ult_cntr_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT MAX(TP_CNTR) AS ULTIMO FROM TTP_CNTR'
      '    ')
    Left = 112
    Top = 88
    object qry_ult_cntr_ULTIMO: TStringField
      FieldName = 'ULTIMO'
      Origin = 'DBBROKER.TTP_CNTR.TP_CNTR'
      FixedChar = True
      Size = 2
    end
  end
end
