object datm_evento_po: Tdatm_evento_po
  Left = 200
  Top = 104
  Height = 288
  Width = 427
  object ds_evento_po: TDataSource
    DataSet = qry_evento_po_
    Left = 124
    Top = 17
  end
  object ds_evento: TDataSource
    DataSet = qry_evento_
    Left = 208
    Top = 124
  end
  object qry_evento_: TQuery
    Active = True
    DatabaseName = 'DBBROKER'
    ParamCheck = False
    SQL.Strings = (
      'SELECT * FROM TEVENTO'
      'ORDER BY '
      'CD_EVENTO')
    Left = 208
    Top = 72
    object qry_evento_CD_EVENTO: TStringField
      DisplayLabel = 'Código'
      FieldName = 'CD_EVENTO'
      Origin = 'TEVENTO.CD_EVENTO'
      Size = 3
    end
    object qry_evento_NM_EVENTO: TStringField
      DisplayLabel = 'Descrição'
      FieldName = 'NM_EVENTO'
      Origin = 'TEVENTO.NM_EVENTO'
      Size = 50
    end
  end
  object qry_ult_ordem_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT MAX(NR_ORDEM) AS ULTIMO'
      'FROM TEVENTO_PO')
    Left = 208
    Top = 17
    object qry_ult_ordem_ULTIMO: TIntegerField
      FieldName = 'ULTIMO'
      Origin = 'TEVENTO_PO.NR_ORDEM'
    end
  end
  object qry_ev_base_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT NR_ORDEM'
      'FROM   TEVENTO_PO'
      'WHERE  CD_EVENTO = :CD_EV_BASICO')
    Params.Data = {010001000C43445F45565F42415349434F0001020030000000}
    Left = 308
    Top = 17
    object qry_ev_base_NR_ORDEM: TIntegerField
      FieldName = 'NR_ORDEM'
      Origin = 'TEVENTO_PO.NR_ORDEM'
    end
  end
  object qry_ev_futuro_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT NR_ORDEM'
      'FROM   TEVENTO_PO'
      'WHERE  CD_EVENTO = :CD_EV_FUTURO')
    Params.Data = {010001000C43445F45565F46555455524F0001020030000000}
    Left = 308
    Top = 72
    object qry_ev_futuro_NR_ORDEM: TIntegerField
      FieldName = 'NR_ORDEM'
      Origin = 'TEVENTO_PO.NR_ORDEM'
    end
  end
  object sp_ordena_evento_po: TStoredProc
    DatabaseName = 'DBBROKER'
    StoredProcName = 'dbo.sp_ordena_evento_po'
    Params.Data = {
      0100030006526573756C740403040005000000000110406E725F6F7264656D5F
      6F726967656D0103040000000000000011406E725F6F7264656D5F6465737469
      6E6F01030400000000000000}
    Left = 39
    Top = 196
  end
  object qry_evento_po_: TQuery
    AfterScroll = qry_evento_po_AfterScroll
    DatabaseName = 'DBBROKER'
    ParamCheck = False
    RequestLive = True
    SQL.Strings = (
      'SELECT *'
      'FROM   TEVENTO_PO'
      'WHERE  CD_EVENTO = :CD_EVENTO'
      '')
    Params.Data = {010001000943445F4556454E544F0001020030000000}
    Left = 124
    Top = 72
    object qry_evento_po_NR_ORDEM: TIntegerField
      FieldName = 'NR_ORDEM'
      Origin = 'TEVENTO_PO.NR_ORDEM'
    end
    object qry_evento_po_CD_EVENTO: TStringField
      DisplayLabel = 'Cód.'
      FieldName = 'CD_EVENTO'
      Origin = 'TEVENTO_PO.CD_EVENTO'
      Size = 3
    end
    object qry_evento_po_CD_EV_BASICO: TStringField
      FieldName = 'CD_EV_BASICO'
      Origin = 'TEVENTO_PO.CD_EV_BASICO'
      Size = 3
    end
    object qry_evento_po_PZ_DO_EV_BASICO: TFloatField
      FieldName = 'PZ_DO_EV_BASICO'
      Origin = 'TEVENTO_PO.PZ_DO_EV_BASICO'
    end
    object qry_evento_po_CD_EV_FUTURO: TStringField
      FieldName = 'CD_EV_FUTURO'
      Origin = 'TEVENTO_PO.CD_EV_FUTURO'
      Size = 3
    end
    object qry_evento_po_PZ_ATE_EV_FUTURO: TFloatField
      FieldName = 'PZ_ATE_EV_FUTURO'
      Origin = 'TEVENTO_PO.PZ_ATE_EV_FUTURO'
    end
    object qry_evento_po_LookEvento: TStringField
      DisplayLabel = 'Evento'
      FieldName = 'LookEvento'
      LookupDataSet = qry_evento_
      LookupKeyFields = 'CD_EVENTO'
      LookupResultField = 'NM_EVENTO'
      KeyFields = 'CD_EVENTO'
      Size = 50
      Lookup = True
    end
    object qry_evento_po_LookEventoBase: TStringField
      FieldName = 'LookEventoBase'
      LookupDataSet = qry_evento_
      LookupKeyFields = 'CD_EVENTO'
      LookupResultField = 'NM_EVENTO'
      KeyFields = 'CD_EV_BASICO'
      Size = 50
      Lookup = True
    end
    object qry_evento_po_LookEventoFuturo: TStringField
      FieldName = 'LookEventoFuturo'
      LookupDataSet = qry_evento_
      LookupKeyFields = 'CD_EVENTO'
      LookupResultField = 'NM_EVENTO'
      KeyFields = 'CD_EV_FUTURO'
      Size = 50
      Lookup = True
    end
  end
  object ds_lista: TDataSource
    DataSet = qry_lista_
    Left = 36
    Top = 17
  end
  object qry_lista_: TQuery
    AfterScroll = qry_lista_AfterScroll
    DatabaseName = 'DBBROKER'
    ParamCheck = False
    SQL.Strings = (
      'SELECT P.NR_ORDEM, P.CD_EVENTO, E.NM_EVENTO '
      'FROM TEVENTO_PO P, TEVENTO E'
      'WHERE P.CD_EVENTO = E.CD_EVENTO'
      'ORDER BY'
      'P.NR_ORDEM')
    Left = 36
    Top = 72
    object qry_lista_NR_ORDEM: TIntegerField
      DisplayLabel = 'Nº Ordem'
      FieldName = 'NR_ORDEM'
      Origin = 'TEVENTO_PO.NR_ORDEM'
    end
    object qry_lista_CD_EVENTO: TStringField
      DisplayLabel = 'Cód.'
      FieldName = 'CD_EVENTO'
      Origin = 'TEVENTO_PO.CD_EVENTO'
      Size = 3
    end
    object qry_lista_NM_EVENTO: TStringField
      DisplayLabel = 'Evento'
      FieldName = 'NM_EVENTO'
      Origin = 'TEVENTO.NM_EVENTO'
      Size = 50
    end
  end
  object sp_exclui_evento_po: TStoredProc
    DatabaseName = 'DBBROKER'
    StoredProcName = 'dbo.sp_exclui_evento_po'
    Params.Data = {
      0100030006526573756C74040304000000000000010A4063645F6576656E746F
      01010200300000000C40696E5F636F6E73697374650105020000000000}
    Left = 208
    Top = 196
  end
end
