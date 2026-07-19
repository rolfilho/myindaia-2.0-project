object datm_hab_desp: Tdatm_hab_desp
  Left = 156
  Top = 75
  Height = 357
  Width = 255
  object ds_hab_desp: TDataSource
    DataSet = qry_hab_desp_
    Left = 40
    Top = 16
  end
  object qry_hab_desp_: TQuery
    DatabaseName = 'DBBROKER'
    RequestLive = True
    SQL.Strings = (
      'SELECT * FROM '
      'TUNID_PROD_DESPACH'
      'WHERE CD_UNID_NEG = :CD_UNID_NEG AND'
      'CD_PRODUTO = :CD_PRODUTO'
      'ORDER BY'
      'CD_DESPACHANTE')
    Params.Data = {
      010002000B43445F554E49445F4E454700010200300000000A43445F50524F44
      55544F0001020030000000}
    Left = 136
    Top = 16
    object qry_hab_desp_CD_UNID_NEG: TStringField
      FieldName = 'CD_UNID_NEG'
      Origin = 'TUNID_PROD_DESPACH.CD_UNID_NEG'
      Size = 2
    end
    object qry_hab_desp_CD_PRODUTO: TStringField
      FieldName = 'CD_PRODUTO'
      Origin = 'TUNID_PROD_DESPACH.CD_PRODUTO'
      Size = 2
    end
    object qry_hab_desp_CD_DESPACHANTE: TStringField
      DisplayLabel = 'Código'
      FieldName = 'CD_DESPACHANTE'
      Origin = 'TUNID_PROD_DESPACH.CD_DESPACHANTE'
      Size = 3
    end
    object qry_hab_desp_IN_ATIVO: TStringField
      FieldName = 'IN_ATIVO'
      Origin = 'TUNID_PROD_DESPACH.IN_ATIVO'
      Size = 1
    end
    object qry_hab_desp_LookUnidNeg: TStringField
      DisplayLabel = 'Unidade'
      FieldName = 'LookUnidNeg'
      LookupDataSet = qry_unid_neg_
      LookupKeyFields = 'CD_UNID_NEG'
      LookupResultField = 'NM_UNID_NEG'
      KeyFields = 'CD_UNID_NEG'
      Size = 50
      Lookup = True
    end
    object qry_hab_desp_LookProduto: TStringField
      DisplayLabel = 'Produto'
      FieldName = 'LookProduto'
      LookupDataSet = qry_produto_
      LookupKeyFields = 'CD_PRODUTO'
      LookupResultField = 'NM_PRODUTO'
      KeyFields = 'CD_PRODUTO'
      Size = 40
      Lookup = True
    end
    object qry_hab_desp_LookDespachante: TStringField
      DisplayLabel = 'Despachante'
      FieldName = 'LookDespachante'
      LookupDataSet = qry_despachante_
      LookupKeyFields = 'CD_DESPACHANTE'
      LookupResultField = 'NM_DESPACHANTE'
      KeyFields = 'CD_DESPACHANTE'
      Size = 50
      Lookup = True
    end
    object qry_hab_desp_LookAtivo: TStringField
      DisplayLabel = 'Ativo'
      FieldName = 'LookAtivo'
      LookupDataSet = tbl_yesno_
      LookupKeyFields = 'CD_YESNO'
      LookupResultField = 'TX_YESNO'
      KeyFields = 'IN_ATIVO'
      Size = 3
      Lookup = True
    end
  end
  object qry_unid_neg_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT CD_UNID_NEG, NM_UNID_NEG '
      'FROM TUNID_NEG')
    Left = 136
    Top = 74
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
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT CD_PRODUTO, NM_PRODUTO'
      'FROM TPRODUTO')
    Left = 40
    Top = 75
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
  object qry_despachante_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT CD_DESPACHANTE, NM_DESPACHANTE'
      'FROM TDESPACHANTE')
    Left = 40
    Top = 198
    object qry_despachante_CD_DESPACHANTE: TStringField
      FieldName = 'CD_DESPACHANTE'
      Origin = 'TDESPACHANTE.CD_DESPACHANTE'
      Size = 3
    end
    object qry_despachante_NM_DESPACHANTE: TStringField
      FieldName = 'NM_DESPACHANTE'
      Origin = 'TDESPACHANTE.NM_DESPACHANTE'
      Size = 50
    end
  end
  object ds_yesno: TDataSource
    DataSet = tbl_yesno_
    Left = 40
    Top = 139
  end
  object tbl_yesno_: TTable
    DatabaseName = 'DBBROKER'
    IndexFieldNames = 'CD_YESNO'
    TableName = 'TYES_NO'
    Left = 136
    Top = 139
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
    Left = 136
    Top = 198
    object qry_usuario_hab_OK: TIntegerField
      FieldName = 'OK'
      Origin = 'TUSUARIO_HABILITACAO.CD_USUARIO'
    end
  end
end
