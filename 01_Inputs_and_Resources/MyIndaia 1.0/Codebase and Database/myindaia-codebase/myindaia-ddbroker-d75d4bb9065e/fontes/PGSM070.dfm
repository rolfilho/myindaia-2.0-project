object datm_cliente_transp: Tdatm_cliente_transp
  Left = 440
  Top = 193
  Height = 466
  Width = 303
  object ds_cliente_transp: TDataSource
    DataSet = qry_cliente_transp_
    Left = 51
    Top = 12
  end
  object qry_cliente_transp_: TQuery
    DatabaseName = 'DBBROKER'
    RequestLive = True
    SQL.Strings = (
      'SELECT * FROM '
      'TCLIENTE_TRANSPORTADOR'
      'WHERE CD_CLIENTE = :CD_CLIENTE AND'
      'CD_UNID_NEG = :CD_UNID_NEG AND'
      'CD_PRODUTO = :CD_PRODUTO')
    Params.Data = {
      010003000A43445F434C49454E544500010200300000000B43445F554E49445F
      4E454700010200300000000A43445F50524F4455544F0001020030000000}
    Left = 198
    Top = 12
    object qry_cliente_transp_CD_CLIENTE: TStringField
      FieldName = 'CD_CLIENTE'
      Origin = 'TCLIENTE_TRANSPORTADOR.CD_CLIENTE'
      Size = 5
    end
    object qry_cliente_transp_CD_UNID_NEG: TStringField
      FieldName = 'CD_UNID_NEG'
      Origin = 'TCLIENTE_TRANSPORTADOR.CD_UNID_NEG'
      Size = 2
    end
    object qry_cliente_transp_CD_PRODUTO: TStringField
      FieldName = 'CD_PRODUTO'
      Origin = 'TCLIENTE_TRANSPORTADOR.CD_PRODUTO'
      Size = 2
    end
    object qry_cliente_transp_CD_TRANSP: TStringField
      FieldName = 'CD_TRANSP'
      Origin = 'TCLIENTE_TRANSPORTADOR.CD_TRANSP'
      Size = 4
    end
    object qry_cliente_transp_IN_ATIVO: TStringField
      FieldName = 'IN_ATIVO'
      Origin = 'TCLIENTE_TRANSPORTADOR.IN_ATIVO'
      Size = 1
    end
    object qry_cliente_transp_LookCliente: TStringField
      FieldName = 'LookCliente'
      LookupDataSet = qry_empresa_nac_
      LookupKeyFields = 'CD_EMPRESA'
      LookupResultField = 'NM_EMPRESA'
      KeyFields = 'CD_CLIENTE'
      Size = 50
      Lookup = True
    end
    object qry_cliente_transp_LookUnidNeg: TStringField
      FieldName = 'LookUnidNeg'
      LookupDataSet = qry_unid_neg_
      LookupKeyFields = 'CD_UNID_NEG'
      LookupResultField = 'NM_UNID_NEG'
      KeyFields = 'CD_UNID_NEG'
      Size = 50
      Lookup = True
    end
    object qry_cliente_transp_LookProduto: TStringField
      FieldName = 'LookProduto'
      LookupDataSet = qry_produto_
      LookupKeyFields = 'CD_PRODUTO'
      LookupResultField = 'NM_PRODUTO'
      KeyFields = 'CD_PRODUTO'
      Size = 40
      Lookup = True
    end
    object qry_cliente_transp_LookTransp: TStringField
      DisplayLabel = 'Transportador'
      FieldName = 'LookTransp'
      LookupDataSet = qry_transp_rod_
      LookupKeyFields = 'CD_TRANSP_ROD'
      LookupResultField = 'NM_TRANSP_ROD'
      KeyFields = 'CD_TRANSP'
      Size = 60
      Lookup = True
    end
    object qry_cliente_transp_LookTaxa: TStringField
      DisplayLabel = 'Tarifa'
      FieldName = 'LookTaxa'
      LookupDataSet = tbl_taxa_
      LookupKeyFields = 'CD_TAXA'
      LookupResultField = 'NM_TAXA'
      KeyFields = 'CD_TARIFA'
      Size = 30
      Lookup = True
    end
    object qry_cliente_transp_LookAtivo: TStringField
      DisplayLabel = 'Ativo'
      FieldName = 'LookAtivo'
      LookupDataSet = tbl_yesno_
      LookupKeyFields = 'CD_YESNO'
      LookupResultField = 'TX_YESNO'
      KeyFields = 'IN_ATIVO'
      Size = 3
      Lookup = True
    end
    object qry_cliente_transp_CD_TARIFA: TStringField
      FieldName = 'CD_TARIFA'
      Origin = 'TCLIENTE_TRANSPORTADOR.CD_CLIENTE'
      Size = 3
    end
  end
  object ds_empresa_nac: TDataSource
    DataSet = qry_empresa_nac_
    Left = 51
    Top = 60
  end
  object qry_empresa_nac_: TQuery
    DatabaseName = 'DBBROKER'
    ParamCheck = False
    SQL.Strings = (
      'SELECT CD_EMPRESA, NM_EMPRESA'
      'FROM TEMPRESA_NAC')
    Left = 198
    Top = 60
    object qry_empresa_nac_CD_EMPRESA: TStringField
      FieldName = 'CD_EMPRESA'
      Origin = 'TEMPRESA_NAC.CD_EMPRESA'
      Size = 5
    end
    object qry_empresa_nac_NM_EMPRESA: TStringField
      FieldName = 'NM_EMPRESA'
      Origin = 'TEMPRESA_NAC.NM_EMPRESA'
      Size = 50
    end
  end
  object ds_yesno: TDataSource
    DataSet = tbl_yesno_
    Left = 51
    Top = 204
  end
  object tbl_yesno_: TTable
    DatabaseName = 'DBBROKER'
    IndexFieldNames = 'CD_YESNO'
    TableName = 'TYES_NO'
    Left = 198
    Top = 204
    object tbl_yesno_CD_YESNO: TStringField
      FieldName = 'CD_YESNO'
      Size = 1
    end
    object tbl_yesno_TX_YESNO: TStringField
      FieldName = 'TX_YESNO'
      Size = 3
    end
  end
  object ds_unid_neg: TDataSource
    DataSet = qry_unid_neg_
    Left = 51
    Top = 108
  end
  object ds_produto: TDataSource
    DataSet = qry_produto_
    Left = 51
    Top = 156
  end
  object qry_produto_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT CD_PRODUTO, NM_PRODUTO'
      'FROM TPRODUTO')
    Left = 198
    Top = 155
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
  object qry_unid_neg_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT CD_UNID_NEG, NM_UNID_NEG FROM'
      'TUNID_NEG')
    Left = 198
    Top = 108
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
  object ds_transp_rod: TDataSource
    DataSet = qry_transp_rod_
    Left = 51
    Top = 252
  end
  object qry_transp_rod_: TQuery
    DatabaseName = 'DBBROKER'
    ParamCheck = False
    SQL.Strings = (
      'SELECT CD_TRANSP_ROD, NM_TRANSP_ROD'
      'FROM TTRANSP_ROD')
    Left = 198
    Top = 252
    object qry_transp_rod_CD_TRANSP_ROD: TStringField
      FieldName = 'CD_TRANSP_ROD'
      Origin = 'TTRANSP_ROD.CD_TRANSP_ROD'
      Size = 4
    end
    object qry_transp_rod_NM_TRANSP_ROD: TStringField
      FieldName = 'NM_TRANSP_ROD'
      Origin = 'TTRANSP_ROD.NM_TRANSP_ROD'
      Size = 60
    end
  end
  object ds_taxa: TDataSource
    DataSet = qry_taxa_
    Left = 51
    Top = 303
  end
  object qry_taxa_: TQuery
    DatabaseName = 'DBBROKER'
    DataSource = ds_transp_rod
    ParamCheck = False
    SQL.Strings = (
      'SELECT CD_TAXA, NM_TAXA'
      'FROM TTAXA_TRANSP_ROD'
      'WHERE CD_TRANSP_ROD = :CD_TRANSP_ROD')
    Params.Data = {010001000D43445F5452414E53505F524F440001020030000100}
    Left = 198
    Top = 303
    object qry_taxa_CD_TAXA: TStringField
      FieldName = 'CD_TAXA'
      Origin = 'TTAXA_TRANSP_ROD.CD_TAXA'
      Size = 3
    end
    object qry_taxa_NM_TAXA: TStringField
      FieldName = 'NM_TAXA'
      Origin = 'TTAXA_TRANSP_ROD.NM_TAXA'
      Size = 30
    end
  end
  object tbl_taxa_: TTable
    DatabaseName = 'DBBROKER'
    TableName = 'TTAXA_TRANSP_ROD'
    Left = 198
    Top = 357
    object tbl_taxa_CD_TAXA: TStringField
      FieldName = 'CD_TAXA'
      Required = True
      Size = 3
    end
    object tbl_taxa_NM_TAXA: TStringField
      FieldName = 'NM_TAXA'
      Required = True
      Size = 30
    end
  end
end
