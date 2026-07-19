object datm_veiculo: Tdatm_veiculo
  OldCreateOrder = True
  OnCreate = DataModuleCreate
  Left = 299
  Top = 173
  Height = 479
  Width = 741
  object ds_veiculo: TDataSource
    DataSet = qry_veiculo_
    Left = 44
    Top = 16
  end
  object qry_ult_veiculo_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT MAX(CD_EMBARCACAO) AS ULTIMO'
      'FROM TEMBARCACAO')
    Left = 48
    Top = 128
    object qry_ult_veiculo_ULTIMO: TStringField
      FieldName = 'ULTIMO'
      Origin = 'DBBROKER.TTAB_FRETE.CD_TAB_FRETE'
      FixedChar = True
      Size = 4
    end
  end
  object upd_qry_veiculo_: TUpdateSQL
    ModifySQL.Strings = (
      'update TEMBARCACAO'
      'set'
      '  CD_EMBARCACAO = :CD_EMBARCACAO,'
      '  NM_EMBARCACAO = :NM_EMBARCACAO,'
      '  IN_RORO = :IN_RORO,'
      '  IN_ATIVO = :IN_ATIVO,'
      '  CD_BANDEIRA = :CD_BANDEIRA'
      'where'
      '  CD_EMBARCACAO = :OLD_CD_EMBARCACAO')
    InsertSQL.Strings = (
      'insert into TEMBARCACAO'
      '  (CD_EMBARCACAO, NM_EMBARCACAO, IN_RORO, IN_ATIVO, CD_BANDEIRA)'
      'values'
      
        '  (:CD_EMBARCACAO, :NM_EMBARCACAO, :IN_RORO, :IN_ATIVO, :CD_BAND' +
        'EIRA)')
    DeleteSQL.Strings = (
      'delete from TEMBARCACAO'
      'where'
      '  CD_EMBARCACAO = :OLD_CD_EMBARCACAO')
    Left = 160
    Top = 72
  end
  object qry_veiculo_: TQuery
    CachedUpdates = True
    BeforePost = qry_veiculo_BeforePost
    AfterPost = qry_veiculo_AfterPost
    AfterDelete = qry_veiculo_AfterDelete
    DatabaseName = 'DBBROKER'
    RequestLive = True
    SQL.Strings = (
      'SELECT * '
      'FROM TEMBARCACAO'
      'ORDER BY'
      'CD_EMBARCACAO')
    UpdateObject = upd_qry_veiculo_
    Left = 162
    Top = 8
    object qry_veiculo_CD_EMBARCACAO: TStringField
      FieldName = 'CD_EMBARCACAO'
      Origin = 'DBBROKER.TEMBARCACAO.CD_EMBARCACAO'
      FixedChar = True
      Size = 4
    end
    object qry_veiculo_NM_EMBARCACAO: TStringField
      FieldName = 'NM_EMBARCACAO'
      Origin = 'DBBROKER.TEMBARCACAO.NM_EMBARCACAO'
      FixedChar = True
      Size = 40
    end
    object qry_veiculo_CD_BANDEIRA: TStringField
      FieldName = 'CD_BANDEIRA'
      Origin = 'DBBROKER.TVEICULO.CD_BANDEIRA'
      FixedChar = True
      Size = 3
    end
    object qry_veiculo_look_nm_pais: TStringField
      FieldKind = fkLookup
      FieldName = 'look_nm_pais'
      LookupDataSet = qry_tpais_broker_
      LookupKeyFields = 'CD_PAIS'
      LookupResultField = 'NM_PAIS'
      KeyFields = 'CD_BANDEIRA'
      Size = 120
      Lookup = True
    end
    object qry_veiculo_IN_RORO: TStringField
      FieldName = 'IN_RORO'
      Origin = 'DBBROKER.TEMBARCACAO.IN_RORO'
      FixedChar = True
      Size = 1
    end
    object qry_veiculo_IN_ATIVO: TStringField
      FieldName = 'IN_ATIVO'
      Origin = 'DBBROKER.TEMBARCACAO.IN_ATIVO'
      FixedChar = True
      Size = 1
    end
    object qry_veiculo_IRIN: TStringField
      FieldName = 'IRIN'
      Origin = 'DBBROKER.TEMBARCACAO.CD_EMBARCACAO'
      FixedChar = True
      Size = 15
    end
  end
  object qry_tpais_broker_: TQuery
    Active = True
    DatabaseName = 'DBBROKER'
    DataSource = ds_veiculo
    SQL.Strings = (
      'SELECT * '
      'FROM TPAIS_BROKER')
    Left = 42
    Top = 208
    object qry_tpais_broker_CD_PAIS: TStringField
      FieldName = 'CD_PAIS'
      Origin = 'DBBROKER.TPAIS_BROKER.CD_PAIS'
      FixedChar = True
      Size = 3
    end
    object qry_tpais_broker_NM_PAIS: TStringField
      FieldName = 'NM_PAIS'
      Origin = 'DBBROKER.TPAIS_BROKER.NM_PAIS'
      FixedChar = True
      Size = 120
    end
  end
  object ds_veiculo_lista: TDataSource
    DataSet = qry_veiculo_
    Left = 44
    Top = 74
  end
  object qry_armador_: TQuery
    DatabaseName = 'DBBROKER'
    DataSource = ds_veiculo
    SQL.Strings = (
      'select CODIGO, DESCRICAO'
      'from TTRANSPORTADOR_ITL '
      '  WHERE TP_TRANSPORTADOR = '#39'1'#39)
    Left = 40
    Top = 280
    object qry_armador_CODIGO: TStringField
      FieldName = 'CODIGO'
      Origin = 'DBBROKER.TTRANSPORTADOR_ITL.CODIGO'
      FixedChar = True
      Size = 4
    end
    object qry_armador_DESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Origin = 'DBBROKER.TTRANSPORTADOR_ITL.DESCRICAO'
      FixedChar = True
      Size = 60
    end
  end
  object qry_porto_: TQuery
    Active = True
    DatabaseName = 'DBBROKER'
    DataSource = ds_veiculo
    SQL.Strings = (
      'select CD_PORTO, NM_PORTO, CD_SIGLA'
      'from TPORTO'
      ' WHERE TP_PORTO = '#39'1'#39
      'ORDER BY NM_PORTO')
    Left = 40
    Top = 352
    object qry_porto_CD_PORTO: TStringField
      FieldName = 'CD_PORTO'
      Origin = 'DBBROKER.TPORTO.CD_PORTO'
      FixedChar = True
      Size = 4
    end
    object qry_porto_NM_PORTO: TStringField
      FieldName = 'NM_PORTO'
      Origin = 'DBBROKER.TPORTO.NM_PORTO'
      FixedChar = True
      Size = 50
    end
    object qry_porto_CD_SIGLA: TStringField
      FieldName = 'CD_SIGLA'
      Origin = 'DBBROKER.TPORTO.CD_SIGLA'
      FixedChar = True
      Size = 3
    end
  end
  object qry_veiculo_rota_: TQuery
    Active = True
    CachedUpdates = True
    BeforeInsert = qry_veiculo_rota_BeforeInsert
    BeforeEdit = qry_veiculo_rota_BeforeEdit
    BeforePost = qry_veiculo_rota_BeforePost
    AfterPost = qry_veiculo_rota_AfterPost
    BeforeDelete = qry_veiculo_rota_BeforeDelete
    AfterDelete = qry_veiculo_rota_AfterDelete
    OnNewRecord = qry_veiculo_rota_NewRecord
    DatabaseName = 'DBBROKER'
    DataSource = ds_veiculo
    SQL.Strings = (
      'select *'
      'from TVEICULO_ROTA'
      'where'
      'CD_VEICULO=:CD_EMBARCACAO')
    UpdateObject = upd_qry_veiculo_rota_
    Left = 160
    Top = 144
    ParamData = <
      item
        DataType = ftFixedChar
        Name = 'CD_EMBARCACAO'
        ParamType = ptUnknown
        Size = 5
      end>
    object qry_veiculo_rota_CD_VEICULO_ROTA: TStringField
      FieldName = 'CD_VEICULO_ROTA'
      Origin = 'DBBROKER.TVEICULO_ROTA.CD_VEICULO_ROTA'
      FixedChar = True
      Size = 2
    end
    object qry_veiculo_rota_CD_VEICULO: TStringField
      FieldName = 'CD_VEICULO'
      Origin = 'DBBROKER.TVEICULO_ROTA.CD_VEICULO'
      FixedChar = True
      Size = 4
    end
    object qry_veiculo_rota_CD_ORIGEM: TStringField
      FieldName = 'CD_ORIGEM'
      Origin = 'DBBROKER.TVEICULO_ROTA.CD_ORIGEM'
      FixedChar = True
      Size = 4
    end
    object qry_veiculo_rota_CD_DESTINO: TStringField
      FieldName = 'CD_DESTINO'
      Origin = 'DBBROKER.TVEICULO_ROTA.CD_DESTINO'
      FixedChar = True
      Size = 4
    end
    object qry_veiculo_rota_look_nm_local_origem: TStringField
      FieldKind = fkLookup
      FieldName = 'look_nm_local_origem'
      LookupDataSet = qry_porto_
      LookupKeyFields = 'CD_PORTO'
      LookupResultField = 'NM_PORTO'
      KeyFields = 'CD_ORIGEM'
      Size = 50
      Lookup = True
    end
    object qry_veiculo_rota_look_nm_local_destino: TStringField
      FieldKind = fkLookup
      FieldName = 'look_nm_local_destino'
      LookupDataSet = qry_porto_
      LookupKeyFields = 'CD_PORTO'
      LookupResultField = 'NM_PORTO'
      KeyFields = 'CD_DESTINO'
      Size = 50
      Lookup = True
    end
  end
  object ds_porto: TDataSource
    DataSet = qry_porto_
    Left = 144
    Top = 352
  end
  object upd_qry_veiculo_rota_: TUpdateSQL
    ModifySQL.Strings = (
      'update TVEICULO_ROTA'
      'set'
      '  CD_VEICULO_ROTA = :CD_VEICULO_ROTA,'
      '  CD_VEICULO = :CD_VEICULO,'
      '  CD_ORIGEM = :CD_ORIGEM,'
      '  CD_DESTINO = :CD_DESTINO'
      'where'
      '  CD_VEICULO_ROTA = :OLD_CD_VEICULO_ROTA')
    InsertSQL.Strings = (
      'insert into TVEICULO_ROTA'
      '  (CD_VEICULO_ROTA, CD_VEICULO, CD_ORIGEM, CD_DESTINO)'
      'values'
      '  (:CD_VEICULO_ROTA, :CD_VEICULO, :CD_ORIGEM, :CD_DESTINO)')
    DeleteSQL.Strings = (
      'delete from TVEICULO_ROTA'
      'where'
      '  CD_VEICULO_ROTA = :OLD_CD_VEICULO_ROTA')
    Left = 160
    Top = 208
  end
  object ds_veiculo_rota: TDataSource
    DataSet = qry_veiculo_rota_
    Left = 160
    Top = 272
  end
  object qry_ult_veiculo_rota_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT MAX(CD_VEICULO_ROTA) AS ULTIMO'
      'FROM TVEICULO_ROTA')
    Left = 272
    Top = 72
    object qry_ult_veiculo_rota_ULTIMO: TStringField
      FieldName = 'ULTIMO'
      Origin = 'DBBROKER.TVEICULO_ROTA.CD_VEICULO_ROTA'
      FixedChar = True
      Size = 2
    end
  end
  object qry_veiculo_armador_: TQuery
    CachedUpdates = True
    AfterPost = qry_veiculo_armador_AfterPost
    AfterDelete = qry_veiculo_armador_AfterDelete
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT TVA.CD_VEICULO, TVA.CD_ARMADOR,'
      '  (SELECT TA.DESCRICAO  FROM TTRANSPORTADOR_ITL TA WHERE'
      ' TA.CODIGO =TVA.CD_ARMADOR) NM_ARMADOR'
      '   FROM TVEICULO_ARMADOR TVA'
      '   WHERE TVA.CD_VEICULO=:CD_VEICULO'
      ' ')
    UpdateObject = UpDate_Vei_armador
    Left = 272
    Top = 8
    ParamData = <
      item
        DataType = ftFixedChar
        Name = 'CD_VEICULO'
        ParamType = ptUnknown
      end>
    object qry_veiculo_armador_CD_VEICULO: TStringField
      FieldName = 'CD_VEICULO'
      FixedChar = True
      Size = 4
    end
    object qry_veiculo_armador_CD_ARMADOR: TStringField
      FieldName = 'CD_ARMADOR'
      FixedChar = True
      Size = 4
    end
    object qry_veiculo_armador_NM_ARMADOR: TStringField
      FieldName = 'NM_ARMADOR'
      FixedChar = True
      Size = 50
    end
  end
  object ds_veiculo_armador: TDataSource
    DataSet = qry_veiculo_armador_
    Left = 424
    Top = 8
  end
  object UpDate_Vei_armador: TUpdateSQL
    ModifySQL.Strings = (
      'update TVEICULO_ARMADOR'
      'set'
      '  CD_VEICULO = :CD_VEICULO,'
      '  CD_ARMADOR = :CD_ARMADOR'
      'where'
      '  CD_VEICULO = :OLD_CD_VEICULO and'
      '  CD_ARMADOR = :OLD_CD_ARMADOR')
    InsertSQL.Strings = (
      'insert into TVEICULO_ARMADOR'
      '  (CD_VEICULO, CD_ARMADOR)'
      'values'
      '  (:CD_VEICULO, :CD_ARMADOR)')
    DeleteSQL.Strings = (
      'delete from TVEICULO_ARMADOR'
      'where'
      '  CD_VEICULO = :OLD_CD_VEICULO and'
      '  CD_ARMADOR = :OLD_CD_ARMADOR')
    Left = 424
    Top = 72
  end
end
