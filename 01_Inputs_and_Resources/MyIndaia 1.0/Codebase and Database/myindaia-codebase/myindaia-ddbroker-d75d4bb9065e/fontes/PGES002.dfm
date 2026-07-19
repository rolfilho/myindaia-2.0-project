object datm_tot_gastos_processo: Tdatm_tot_gastos_processo
  Left = 200
  Top = 104
  Height = 150
  Width = 311
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
      Origin = 'TMOEDA_BROKER.CD_MOEDA'
      Size = 3
    end
    object qry_moeda_NM_MOEDA: TStringField
      FieldName = 'NM_MOEDA'
      Origin = 'TMOEDA_BROKER.NM_MOEDA'
      Size = 30
    end
  end
end
