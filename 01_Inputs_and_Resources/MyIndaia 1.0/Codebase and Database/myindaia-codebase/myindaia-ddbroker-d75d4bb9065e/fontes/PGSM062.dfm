object datm_priori_item: Tdatm_priori_item
  Left = 376
  Top = 174
  Height = 417
  Width = 368
  object ds_priori_item: TDataSource
    DataSet = qry_priori_item_
    Left = 40
    Top = 80
  end
  object qry_priori_item_: TQuery
    AfterScroll = qry_priori_item_AfterScroll
    DatabaseName = 'DBBROKER'
    RequestLive = True
    SQL.Strings = (
      'SELECT *'
      'FROM TITEM_PRIORIDADE'
      'WHERE CD_ITEM = :CD_ITEM')
    Params.Data = {010001000743445F4954454D0001020030000000}
    Left = 148
    Top = 80
    object qry_priori_item_CD_ITEM: TStringField
      FieldName = 'CD_ITEM'
      Origin = 'TITEM_PRIORIDADE.CD_ITEM'
      Size = 3
    end
    object qry_priori_item_CD_UNID_NEG: TStringField
      FieldName = 'CD_UNID_NEG'
      Origin = 'TITEM_PRIORIDADE.CD_UNID_NEG'
      Size = 2
    end
    object qry_priori_item_CD_PRODUTO: TStringField
      FieldName = 'CD_PRODUTO'
      Origin = 'TITEM_PRIORIDADE.CD_PRODUTO'
      Size = 2
    end
    object qry_priori_item_NR_PRIORIDADE: TFloatField
      FieldName = 'NR_PRIORIDADE'
      Origin = 'TITEM_PRIORIDADE.NR_PRIORIDADE'
    end
    object qry_priori_item_LookItem: TStringField
      FieldName = 'LookItem'
      LookupDataSet = qry_item_
      LookupKeyFields = 'CD_ITEM'
      LookupResultField = 'NM_ITEM'
      KeyFields = 'CD_ITEM'
      Size = 50
      Lookup = True
    end
    object qry_priori_item_LookUnidNeg: TStringField
      FieldName = 'LookUnidNeg'
      LookupDataSet = qry_unid_neg_
      LookupKeyFields = 'CD_UNID_NEG'
      LookupResultField = 'NM_UNID_NEG'
      KeyFields = 'CD_UNID_NEG'
      Size = 50
      Lookup = True
    end
    object qry_priori_item_LookProduto: TStringField
      FieldName = 'LookProduto'
      LookupDataSet = qry_produto_
      LookupKeyFields = 'CD_PRODUTO'
      LookupResultField = 'NM_PRODUTO'
      KeyFields = 'CD_PRODUTO'
      Size = 50
      Lookup = True
    end
  end
  object qry_unid_neg_: TQuery
    Active = True
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT CD_UNID_NEG, NM_UNID_NEG '
      'FROM TUNID_NEG')
    Left = 148
    Top = 138
    object qry_unid_neg_CD_UNID_NEG: TStringField
      FieldName = 'CD_UNID_NEG'
      Origin = 'TUNID_NEG.CD_UNID_NEG'
      Size = 2
    end
    object qry_unid_neg_NM_UNID_NEG: TStringField
      FieldName = 'NM_UNID_NEG'
      Origin = 'TUNID_NEG.CD_UNID_NEG'
      Size = 50
    end
  end
  object qry_produto_: TQuery
    Active = True
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT CD_PRODUTO, NM_PRODUTO'
      'FROM TPRODUTO')
    Left = 40
    Top = 138
    object qry_produto_CD_PRODUTO: TStringField
      FieldName = 'CD_PRODUTO'
      Origin = 'TPRODUTO.CD_PRODUTO'
      Size = 2
    end
    object qry_produto_NM_PRODUTO: TStringField
      FieldName = 'NM_PRODUTO'
      Origin = 'TPRODUTO.NM_PRODUTO'
      Size = 40
    end
  end
  object qry_item_: TQuery
    Active = True
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT CD_ITEM, NM_ITEM'
      'FROM TITEM')
    Left = 40
    Top = 262
    object qry_item_CD_ITEM: TStringField
      FieldName = 'CD_ITEM'
      Origin = 'TITEM.CD_ITEM'
      Size = 3
    end
    object qry_item_NM_ITEM: TStringField
      FieldName = 'NM_ITEM'
      Origin = 'TITEM.NM_ITEM'
      Size = 30
    end
  end
  object ds_yesno: TDataSource
    DataSet = tbl_yesno_
    Left = 40
    Top = 203
  end
  object tbl_yesno_: TTable
    DatabaseName = 'DBBROKER'
    IndexFieldNames = 'CD_YESNO'
    TableName = 'TYES_NO'
    Left = 148
    Top = 203
    object tbl_yesno_CD_YESNO: TStringField
      FieldName = 'CD_YESNO'
      Size = 1
    end
    object tbl_yesno_TX_YESNO: TStringField
      FieldName = 'TX_YESNO'
      Size = 3
    end
  end
  object qry_usuario_hab_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT COUNT(CD_USUARIO) AS OK'
      'FROM TUSUARIO_HABILITACAO'
      'WHERE CD_USUARIO = :CD_USUARIO AND'
      'CD_UNID_NEG = :CD_UNID_NEG AND'
      'CD_PRODUTO = :CD_PRODUTO AND'
      'IN_ATIVO = '#39'1'#39)
    Params.Data = {
      010003000A43445F5553554152494F00010200300000000B43445F554E49445F
      4E454700010200300000000A43445F50524F4455544F0001020030000000}
    Left = 148
    Top = 262
    object qry_usuario_hab_OK: TIntegerField
      FieldName = 'OK'
      Origin = 'TUSUARIO_HABILITACAO.CD_USUARIO'
    end
  end
  object sp_ordena_priori_item: TStoredProc
    DatabaseName = 'DBBROKER'
    StoredProcName = 'dbo.sp_ordena_priori_item'
    Params.Data = {
      0100050006526573756C74040304000000000000000C4063645F756E69645F6E
      656701010200300000000B4063645F70726F6475746F01010200300000001140
      6E725F7072696F72695F6F726967656D0103040000000000000012406E725F70
      72696F72695F64657374696E6F01030400000000000000}
    Left = 40
    Top = 319
  end
  object qry_priori_item_lista_: TQuery
    Active = True
    AfterScroll = qry_priori_item_lista_AfterScroll
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      
        'SELECT P.CD_ITEM AS[P.CD_ITEM], P.CD_UNID_NEG, P.CD_PRODUTO, P.N' +
        'R_PRIORIDADE, I.NM_ITEM '
      'FROM   TITEM_PRIORIDADE P, TITEM I'
      'WHERE  CD_UNID_NEG = :CD_UNID_NEG AND'
      '       CD_PRODUTO  = :CD_PRODUTO AND'
      '       I.CD_ITEM   = P.CD_ITEM'
      'ORDER BY'
      'I.CD_ITEM')
    Params.Data = {
      010002000B43445F554E49445F4E454700010200300000000A43445F50524F44
      55544F0001020030000000}
    Left = 147
    Top = 24
    object qry_priori_item_lista_CD_UNID_NEG: TStringField
      FieldName = 'CD_UNID_NEG'
      Origin = 'TITEM_PRIORIDADE.CD_UNID_NEG'
      Size = 2
    end
    object qry_priori_item_lista_CD_PRODUTO: TStringField
      FieldName = 'CD_PRODUTO'
      Origin = 'TITEM_PRIORIDADE.CD_PRODUTO'
      Size = 2
    end
    object qry_priori_item_lista_NR_PRIORIDADE: TFloatField
      DisplayLabel = 'Prioridade'
      FieldName = 'NR_PRIORIDADE'
      Origin = 'TITEM_PRIORIDADE.NR_PRIORIDADE'
    end
    object qry_priori_item_lista_NM_ITEM: TStringField
      DisplayLabel = 'Item'
      FieldName = 'NM_ITEM'
      Origin = 'TITEM.NM_ITEM'
      Size = 30
    end
    object qry_priori_item_lista_LookProduto: TStringField
      FieldName = 'LookProduto'
      LookupDataSet = qry_produto_
      LookupKeyFields = 'CD_PRODUTO'
      LookupResultField = 'NM_PRODUTO'
      KeyFields = 'CD_PRODUTO'
      Size = 40
      Lookup = True
    end
    object qry_priori_item_lista_LookUnidNeg: TStringField
      FieldName = 'LookUnidNeg'
      LookupDataSet = qry_unid_neg_
      LookupKeyFields = 'CD_UNID_NEG'
      LookupResultField = 'NM_UNID_NEG'
      KeyFields = 'CD_UNID_NEG'
      Size = 50
      Lookup = True
    end
    object qry_priori_item_lista_PCD_ITEM: TStringField
      DisplayLabel = 'Codigo'
      FieldName = 'P.CD_ITEM'
      Size = 3
    end
  end
  object ds_priori_item_lista: TDataSource
    DataSet = qry_priori_item_lista_
    Left = 40
    Top = 24
  end
end
