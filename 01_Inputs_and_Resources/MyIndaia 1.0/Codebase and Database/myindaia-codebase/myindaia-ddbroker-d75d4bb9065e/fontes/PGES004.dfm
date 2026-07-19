object datm_tot_gastos_porto: Tdatm_tot_gastos_porto
  Left = 200
  Top = 104
  Height = 150
  Width = 448
  object qry_unid_neg_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT CD_UNID_NEG, AP_UNID_NEG'
      'FROM TUNID_NEG'
      'WHERE CD_UNID_NEG = :CD_UNID_NEG')
    Params.Data = {010001000B43445F554E49445F4E45470001020030000000}
    Left = 36
    Top = 12
    object qry_unid_neg_CD_UNID_NEG: TStringField
      FieldName = 'CD_UNID_NEG'
      Origin = 'TUNID_NEG.CD_UNID_NEG'
      Size = 2
    end
    object qry_unid_neg_AP_UNID_NEG: TStringField
      FieldName = 'AP_UNID_NEG'
      Origin = 'TUNID_NEG.AP_UNID_NEG'
      Size = 10
    end
  end
  object qry_produto_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT CD_PRODUTO, AP_PRODUTO'
      'FROM TPRODUTO'
      'WHERE CD_PRODUTO = :CD_PRODUTO')
    Params.Data = {010001000A43445F50524F4455544F0001020030000000}
    Left = 120
    Top = 12
    object qry_produto_CD_PRODUTO: TStringField
      FieldName = 'CD_PRODUTO'
      Origin = 'TPRODUTO.CD_PRODUTO'
      Size = 2
    end
    object qry_produto_AP_PRODUTO: TStringField
      FieldName = 'AP_PRODUTO'
      Origin = 'TPRODUTO.AP_PRODUTO'
      Size = 10
    end
  end
  object qry_grupo_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT CD_GRUPO, NM_GRUPO'
      'FROM TGRUPO'
      'WHERE CD_GRUPO = :CD_GRUPO')
    Params.Data = {010001000843445F475255504F0001020030000000}
    Left = 36
    Top = 60
    object qry_grupo_CD_GRUPO: TStringField
      FieldName = 'CD_GRUPO'
      Origin = 'TGRUPO.CD_GRUPO'
      Size = 3
    end
    object qry_grupo_NM_GRUPO: TStringField
      FieldName = 'NM_GRUPO'
      Origin = 'TGRUPO.NM_GRUPO'
      Size = 50
    end
  end
  object qry_cliente_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT CD_EMPRESA, NM_EMPRESA'
      'FROM TEMPRESA_NAC'
      'WHERE CD_EMPRESA = :CD_EMPRESA')
    Params.Data = {010001000A43445F454D50524553410001020030000000}
    Left = 120
    Top = 60
    object qry_cliente_CD_EMPRESA: TStringField
      FieldName = 'CD_EMPRESA'
      Origin = 'TEMPRESA_NAC.CD_EMPRESA'
      Size = 5
    end
    object qry_cliente_NM_EMPRESA: TStringField
      FieldName = 'NM_EMPRESA'
      Origin = 'TEMPRESA_NAC.NM_EMPRESA'
      Size = 50
    end
  end
  object qry_grupo_item_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT CD_GRUPO_ITEM, NM_GRUPO_ITEM'
      'FROM TGRUPO_ITEM'
      'WHERE CD_GRUPO_ITEM = :CD_GRUPO_ITEM')
    Params.Data = {010001000D43445F475255504F5F4954454D0001020030000000}
    Left = 200
    Top = 12
    object qry_grupo_item_CD_GRUPO_ITEM: TStringField
      FieldName = 'CD_GRUPO_ITEM'
      Origin = 'TGRUPO_ITEM.CD_GRUPO_ITEM'
      Size = 2
    end
    object qry_grupo_item_NM_GRUPO_ITEM: TStringField
      FieldName = 'NM_GRUPO_ITEM'
      Origin = 'TGRUPO_ITEM.NM_GRUPO_ITEM'
      Size = 30
    end
  end
  object qry_moeda_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT CD_MOEDA, NM_MOEDA'
      'FROM TMOEDA_BROKER'
      'WHERE CD_MOEDA = :CD_MOEDA')
    Params.Data = {010001000843445F4D4F4544410001020030000000}
    Left = 200
    Top = 60
    object qry_moeda_CD_MOEDA: TStringField
      FieldName = 'CD_MOEDA'
      Origin = 'TMOEDA.CD_MOEDA'
      Size = 3
    end
    object qry_moeda_NM_MOEDA: TStringField
      FieldName = 'NM_MOEDA'
      Origin = 'TMOEDA.NM_MOEDA'
      Size = 30
    end
  end
  object sp_gastos_armazenagem: TStoredProc
    DatabaseName = 'DBBROKER'
    StoredProcName = 'dbo.sp_gastos_armazenagem'
    Params.Data = {
      01000A0006526573756C7404030400000000000000094063645F677275706F01
      010200300000000B4063645F636C69656E746501010200300000000C4063645F
      756E69645F6E656701010200300000000B4063645F70726F6475746F01010200
      300000001040706572696F646F5F696E696369616C010B080000002C845D40CB
      4200000E40706572696F646F5F66696E616C010B080000002C845D40CB420000
      0E4063645F677275706F5F6974656D0101020030000000094063645F6D6F6564
      61010102003000000011406E725F6964656E746966696361646F720203040000
      0000000000}
    Left = 312
    Top = 12
  end
  object qry_del_gastos_armazenagem: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'DELETE TGASTOS_ARMAZENAGEM'
      'WHERE NR_IDENTIFICADOR = :nr_identificador')
    Params.Data = {01000100106E725F6964656E746966696361646F7200000000}
    Left = 312
    Top = 60
  end
end
