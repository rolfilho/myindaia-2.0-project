object datm_DARF: Tdatm_DARF
  Left = 200
  Top = 104
  Height = 208
  Width = 278
  object qry_unid_neg_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT CD_UNID_NEG, NM_UNID_NEG'
      'FROM TUNID_NEG')
    Left = 32
    Top = 76
    object qry_unid_neg_CD_UNID_NEG: TStringField
      FieldName = 'CD_UNID_NEG'
      Origin = 'TUNID_NEG.CD_UNID_NEG'
      Size = 2
    end
    object qry_unid_neg_NM_UNID_NEG: TStringField
      FieldName = 'NM_UNID_NEG'
      Origin = 'TUNID_NEG.NM_UNID_NEG'
      Size = 50
    end
  end
  object ds_DARF: TDataSource
    DataSet = qry_DARF_
    Left = 32
    Top = 16
  end
  object qry_DARF_: TQuery
    DatabaseName = 'DBBROKER'
    ParamCheck = False
    RequestLive = True
    SQL.Strings = (
      'SELECT *'
      'FROM TDARF '
      'ORDER BY CD_UNID_NEG, CD_PRODUTO')
    Left = 116
    Top = 16
    object qry_DARF_CD_UNID_NEG: TStringField
      FieldName = 'CD_UNID_NEG'
      Size = 2
    end
    object qry_DARF_CD_PRODUTO: TStringField
      FieldName = 'CD_PRODUTO'
      Size = 2
    end
    object qry_DARF_VL_DARF: TFloatField
      DisplayLabel = 'Valor DARF'
      FieldName = 'VL_DARF'
      DisplayFormat = '#0,.00'
      EditFormat = '#0.00'
    end
    object qry_DARF_CD_MOEDA: TStringField
      FieldName = 'CD_MOEDA'
      Size = 3
    end
    object qry_DARF_LookUnidNeg: TStringField
      DisplayLabel = 'Unidade'
      FieldName = 'LookUnidNeg'
      LookupDataSet = qry_unid_neg_
      LookupKeyFields = 'CD_UNID_NEG'
      LookupResultField = 'NM_UNID_NEG'
      KeyFields = 'CD_UNID_NEG'
      Size = 50
      Lookup = True
    end
    object qry_DARF_LookProduto: TStringField
      DisplayLabel = 'Produto'
      FieldName = 'LookProduto'
      LookupDataSet = qry_produto_
      LookupKeyFields = 'CD_PRODUTO'
      LookupResultField = 'NM_PRODUTO'
      KeyFields = 'CD_PRODUTO'
      Size = 40
      Lookup = True
    end
    object qry_DARF_LookMoeda: TStringField
      DisplayLabel = 'Moeda'
      FieldName = 'LookMoeda'
      LookupDataSet = qry_moeda_
      LookupKeyFields = 'CD_MOEDA'
      LookupResultField = 'NM_MOEDA'
      KeyFields = 'CD_MOEDA'
      Size = 30
      Lookup = True
    end
  end
  object qry_produto_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT CD_PRODUTO, NM_PRODUTO'
      'FROM TPRODUTO')
    Left = 116
    Top = 76
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
  object qry_moeda_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT * '
      'FROM TMOEDA_BROKER')
    Left = 192
    Top = 76
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
  object qry_usuario_hab_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT *'
      'FROM TUSUARIO_HABILITACAO'
      'WHERE CD_UNID_NEG = :CD_UNID_NEG AND'
      'CD_PRODUTO = :CD_PRODUTO AND'
      'CD_USUARIO = :CD_USUARIO')
    Params.Data = {
      010003000B43445F554E49445F4E454700010200300000000A43445F50524F44
      55544F00010200300000000A43445F5553554152494F0001020030000000}
    Left = 192
    Top = 16
    object qry_usuario_hab_CD_USUARIO: TStringField
      FieldName = 'CD_USUARIO'
      Origin = 'TUSUARIO_HABILITACAO.CD_USUARIO'
      Size = 4
    end
    object qry_usuario_hab_CD_UNID_NEG: TStringField
      FieldName = 'CD_UNID_NEG'
      Origin = 'TUSUARIO_HABILITACAO.CD_UNID_NEG'
      Size = 2
    end
    object qry_usuario_hab_CD_PRODUTO: TStringField
      FieldName = 'CD_PRODUTO'
      Origin = 'TUSUARIO_HABILITACAO.CD_PRODUTO'
      Size = 2
    end
    object qry_usuario_hab_IN_ATIVO: TStringField
      FieldName = 'IN_ATIVO'
      Origin = 'TUSUARIO_HABILITACAO.IN_ATIVO'
      Size = 1
    end
  end
end
