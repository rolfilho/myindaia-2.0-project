object datm_expurgo: Tdatm_expurgo
  Left = 200
  Top = 104
  Height = 185
  Width = 290
  object qry_unid_neg_: TQuery
    DatabaseName = 'DBBROKER'
    ParamCheck = False
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
  object ds_expurgo: TDataSource
    DataSet = qry_expurgo_
    Left = 32
    Top = 16
  end
  object qry_expurgo_: TQuery
    DatabaseName = 'DBBROKER'
    ParamCheck = False
    RequestLive = True
    SQL.Strings = (
      'SELECT *'
      'FROM TEXPURGO')
    Left = 116
    Top = 16
    object qry_expurgo_CD_UNID_NEG: TStringField
      FieldName = 'CD_UNID_NEG'
      Origin = 'TEXPURGO.CD_UNID_NEG'
      Size = 2
    end
    object qry_expurgo_CD_PRODUTO: TStringField
      FieldName = 'CD_PRODUTO'
      Origin = 'TEXPURGO.CD_PRODUTO'
      Size = 2
    end
    object qry_expurgo_VL_CNTR_20: TFloatField
      DisplayLabel = 'Vl. Contâiner 20'#39
      FieldName = 'VL_CNTR_20'
      Origin = 'TEXPURGO.VL_CNTR_20'
      DisplayFormat = '#0,.00'
      EditFormat = '#0.00'
    end
    object qry_expurgo_VL_CNTR_40: TFloatField
      DisplayLabel = 'Vl. Contâiner 40'#39
      FieldName = 'VL_CNTR_40'
      Origin = 'TEXPURGO.VL_CNTR_40'
      DisplayFormat = '#0,.00'
      EditFormat = '#0.00'
    end
    object qry_expurgo_LookUnidNeg: TStringField
      DisplayLabel = 'Unidade de Negócio'
      FieldName = 'LookUnidNeg'
      LookupDataSet = qry_unid_neg_
      LookupKeyFields = 'CD_UNID_NEG'
      LookupResultField = 'NM_UNID_NEG'
      KeyFields = 'CD_UNID_NEG'
      Size = 50
      Lookup = True
    end
    object qry_expurgo_LookProduto: TStringField
      DisplayLabel = 'Produto'
      FieldName = 'LookProduto'
      LookupDataSet = qry_produto_
      LookupKeyFields = 'CD_PRODUTO'
      LookupResultField = 'NM_PRODUTO'
      KeyFields = 'CD_PRODUTO'
      Size = 40
      Lookup = True
    end
  end
  object qry_produto_: TQuery
    DatabaseName = 'DBBROKER'
    ParamCheck = False
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
    Left = 200
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
