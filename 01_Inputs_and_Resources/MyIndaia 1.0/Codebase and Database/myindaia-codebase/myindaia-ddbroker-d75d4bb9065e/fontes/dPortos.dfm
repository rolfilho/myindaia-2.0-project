object datm_portos: Tdatm_portos
  OldCreateOrder = False
  Left = 116
  Top = 136
  Height = 325
  Width = 370
  object ds_porto: TDataSource
    DataSet = qry_porto_
    Left = 16
    Top = 16
  end
  object qry_porto_: TQuery
    CachedUpdates = True
    AfterPost = qry_porto_AfterPost
    AfterDelete = qry_porto_AfterDelete
    AfterScroll = qry_porto_AfterScroll
    DatabaseName = 'DBBROKER'
    RequestLive = True
    SQL.Strings = (
      'SELECT * FROM TPORTO'
      ''
      'ORDER BY'
      'CD_PORTO')
    UpdateObject = upd_porto_
    Left = 168
    Top = 8
    object qry_porto_CD_PORTO: TStringField
      FieldName = 'CD_PORTO'
      Origin = 'DBBROKER.TPORTO.CD_PORTO'
      FixedChar = True
      Size = 4
    end
    object qry_porto_CD_SIGLA: TStringField
      FieldName = 'CD_SIGLA'
      Origin = 'DBBROKER.TPORTO.CD_SIGLA'
      FixedChar = True
      Size = 3
    end
    object qry_porto_NM_PORTO: TStringField
      FieldName = 'NM_PORTO'
      Origin = 'DBBROKER.TPORTO.NM_PORTO'
      FixedChar = True
      Size = 50
    end
    object qry_porto_CD_CIDADE: TStringField
      FieldName = 'CD_CIDADE'
      Origin = 'DBBROKER.TPORTO.CD_CIDADE'
      FixedChar = True
      Size = 4
    end
    object qry_porto_CD_URF: TStringField
      FieldName = 'CD_URF'
      Origin = 'DBBROKER.TPORTO.CD_URF'
      FixedChar = True
      Size = 7
    end
    object qry_porto_CD_GRUPO_PORTO: TStringField
      FieldName = 'CD_GRUPO_PORTO'
      Origin = 'DBBROKER.TPORTO.CD_GRUPO_PORTO'
      FixedChar = True
      Size = 4
    end
    object qry_porto_look_nm_grupo_porto: TStringField
      FieldKind = fkLookup
      FieldName = 'look_nm_grupo_porto'
      LookupDataSet = qry_porto_grupo_
      LookupKeyFields = 'CD_GRUPO_PORTO'
      LookupResultField = 'NM_GRUPO_PORTO'
      KeyFields = 'CD_GRUPO_PORTO'
      Size = 50
      Lookup = True
    end
    object qry_porto_dbedt_look_nm_cidade: TStringField
      FieldKind = fkLookup
      FieldName = 'dbedt_look_nm_cidade'
      LookupDataSet = qry_local_embarque_
      LookupKeyFields = 'CODIGO'
      LookupResultField = 'DESCRICAO'
      KeyFields = 'CD_CIDADE'
      Size = 50
      Lookup = True
    end
    object qry_porto_ook_nm_pais: TStringField
      FieldKind = fkLookup
      FieldName = 'ook_nm_pais'
      LookupDataSet = qry_pais_BROKER
      LookupKeyFields = 'CD_PAIS'
      LookupResultField = 'NM_PAIS'
      KeyFields = 'CD_PAIS'
      Size = 50
      Lookup = True
    end
    object qry_porto_nome_urf: TStringField
      FieldKind = fkLookup
      FieldName = 'nome_urf'
      LookupDataSet = qry_urf
      LookupKeyFields = 'CODIGO'
      LookupResultField = 'DESCRICAO'
      KeyFields = 'CD_URF'
      Size = 50
      Lookup = True
    end
    object qry_porto_TP_PORTO: TStringField
      FieldName = 'TP_PORTO'
      Origin = 'DBBROKER.TPORTO.TP_PORTO'
      FixedChar = True
      Size = 1
    end
    object qry_porto_CD_SIGLA_CIDADE: TStringField
      FieldName = 'CD_SIGLA_CIDADE'
      Origin = 'DBBROKER.TPORTO.TP_PORTO'
      FixedChar = True
      Size = 3
    end
    object qry_porto_CD_PAIS: TStringField
      FieldName = 'CD_PAIS'
      Origin = 'DBBROKER.TPORTO.CD_PAIS'
      FixedChar = True
      Size = 3
    end
  end
  object qry_local_embarque_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT * '
      'FROM TLOCAL_EMBARQUE')
    Left = 128
    Top = 96
    object qry_local_embarque_CODIGO: TStringField
      FieldName = 'CODIGO'
      Origin = 'DBBROKER.TLOCAL_EMBARQUE.CODIGO'
      FixedChar = True
      Size = 4
    end
    object qry_local_embarque_DESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Origin = 'DBBROKER.TLOCAL_EMBARQUE.DESCRICAO'
      FixedChar = True
      Size = 50
    end
    object qry_local_embarque_CD_PAIS: TStringField
      FieldName = 'CD_PAIS'
      Origin = 'DBBROKER.TLOCAL_EMBARQUE.CD_PAIS'
      FixedChar = True
      Size = 3
    end
    object qry_local_embarque_CD_UNID_NEG_LOCAL: TStringField
      FieldName = 'CD_UNID_NEG_LOCAL'
      Origin = 'DBBROKER.TLOCAL_EMBARQUE.CD_UNID_NEG_LOCAL'
      FixedChar = True
      Size = 2
    end
    object qry_local_embarque_CD_UF: TStringField
      FieldName = 'CD_UF'
      Origin = 'DBBROKER.TLOCAL_EMBARQUE.CD_UF'
      FixedChar = True
      Size = 2
    end
  end
  object qry_pais_BROKER: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT *'
      '   FROM TPAIS_BROKER;')
    Left = 256
    Top = 32
    object qry_pais_BROKERCD_PAIS: TStringField
      FieldName = 'CD_PAIS'
      Origin = 'DBBROKER.TPAIS_BROKER.CD_PAIS'
      FixedChar = True
      Size = 3
    end
    object qry_pais_BROKERNM_PAIS: TStringField
      FieldName = 'NM_PAIS'
      Origin = 'DBBROKER.TPAIS_BROKER.NM_PAIS'
      FixedChar = True
      Size = 120
    end
    object qry_pais_BROKERNM_PAIS_PORT: TStringField
      FieldName = 'NM_PAIS_PORT'
      Origin = 'DBBROKER.TPAIS_BROKER.NM_PAIS_PORT'
      FixedChar = True
      Size = 50
    end
    object qry_pais_BROKERNM_PAIS_ING: TStringField
      FieldName = 'NM_PAIS_ING'
      Origin = 'DBBROKER.TPAIS_BROKER.NM_PAIS_ING'
      FixedChar = True
      Size = 50
    end
    object qry_pais_BROKERNM_PAIS_ESP: TStringField
      FieldName = 'NM_PAIS_ESP'
      Origin = 'DBBROKER.TPAIS_BROKER.NM_PAIS_ESP'
      FixedChar = True
      Size = 50
    end
    object qry_pais_BROKERCD_SCX_EXP: TStringField
      FieldName = 'CD_SCX_EXP'
      Origin = 'DBBROKER.TPAIS_BROKER.CD_SCX_EXP'
      FixedChar = True
      Size = 4
    end
    object qry_pais_BROKERNM_SIGLA_CRT: TStringField
      FieldName = 'NM_SIGLA_CRT'
      Origin = 'DBBROKER.TPAIS_BROKER.NM_SIGLA_CRT'
      FixedChar = True
      Size = 2
    end
  end
  object qry_porto_grupo_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT *'
      '   FROM TGRUPO_PORTO;')
    Left = 48
    Top = 168
    object qry_porto_grupo_CD_GRUPO_PORTO: TStringField
      FieldName = 'CD_GRUPO_PORTO'
      Origin = 'BROKER.TPORTO_GRUPO.CD_GRUPO_PORTO'
      FixedChar = True
      Size = 4
    end
    object qry_porto_grupo_NM_GRUPO_PORTO: TStringField
      FieldName = 'NM_GRUPO_PORTO'
      Origin = 'BROKER.TPORTO_GRUPO.NM_GRUPO_PORTO'
      FixedChar = True
      Size = 50
    end
  end
  object qry_ult_registro_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT MAX(A.CD_PORTO) ULTIMO'
      'FROM  TPORTO A')
    Left = 152
    Top = 212
    object qry_ult_registro_ULTIMO: TStringField
      FieldName = 'ULTIMO'
      Origin = 'BROKER.TPORTO.CD_PORTO'
      FixedChar = True
      Size = 4
    end
  end
  object upd_porto_: TUpdateSQL
    ModifySQL.Strings = (
      'update TPORTO'
      'set'
      '  CD_PORTO = :CD_PORTO,'
      '  CD_SIGLA = :CD_SIGLA,'
      '  NM_PORTO = :NM_PORTO,'
      '  CD_CIDADE = :CD_CIDADE,'
      '  CD_PAIS = :CD_PAIS,'
      '  CD_URF = :CD_URF,'
      '  CD_GRUPO_PORTO = :CD_GRUPO_PORTO,'
      '  TP_PORTO = :TP_PORTO,'
      '  CD_SIGLA_CIDADE = :CD_SIGLA_CIDADE'
      'where'
      '  CD_PORTO = :OLD_CD_PORTO')
    InsertSQL.Strings = (
      'insert into TPORTO'
      
        '  (CD_PORTO, CD_SIGLA, NM_PORTO, CD_CIDADE, CD_PAIS, CD_URF, CD_' +
        'GRUPO_PORTO, '
      '   TP_PORTO, CD_SIGLA_CIDADE)'
      'values'
      
        '  (:CD_PORTO, :CD_SIGLA, :NM_PORTO, :CD_CIDADE, :CD_PAIS, :CD_UR' +
        'F, :CD_GRUPO_PORTO, '
      '   :TP_PORTO, :CD_SIGLA_CIDADE)')
    DeleteSQL.Strings = (
      'delete from TPORTO'
      'where'
      '  CD_PORTO = :OLD_CD_PORTO')
    Left = 72
    Top = 16
  end
  object ds_Pais_Broker: TDataSource
    DataSet = qry_pais_BROKER
    Left = 256
    Top = 88
  end
  object qry_urf: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT * FROM'
      '   TURF')
    Left = 272
    Top = 176
  end
end
