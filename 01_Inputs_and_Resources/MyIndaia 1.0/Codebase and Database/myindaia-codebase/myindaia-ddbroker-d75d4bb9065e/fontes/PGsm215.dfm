object datm_cliente_docto: Tdatm_cliente_docto
  Left = 200
  Top = 104
  Height = 406
  Width = 340
  object ds_cliente_docto_lista: TDataSource
    DataSet = qry_cli_docto_lista_
    Left = 46
    Top = 12
  end
  object qry_cliente_docto_: TQuery
    DatabaseName = 'DBBROKER'
    RequestLive = True
    SQL.Strings = (
      'SELECT *'
      'FROM   TCLIENTE_DOCUMENTO (NOLOCK)'
      'WHERE  CD_CLIENTE = :CD_CLIENTE AND'
      '       CD_UNID_NEG = :CD_UNID_NEG AND'
      '       CD_PRODUTO = :CD_PRODUTO AND'
      '       CD_DOCUMENTO = :CD_DOCUMENTO'
      'ORDER BY CD_DOCUMENTO')
    Params.Data = {
      010004000A43445F434C49454E544500010200300000000B43445F554E49445F
      4E454700010200300000000A43445F50524F4455544F00010200300000000C43
      445F444F43554D454E544F0001020030000000}
    Left = 167
    Top = 60
    object qry_cliente_docto_CD_CLIENTE: TStringField
      FieldName = 'CD_CLIENTE'
      Origin = 'TCLIENTE_DOCUMENTO.CD_CLIENTE'
      Size = 5
    end
    object qry_cliente_docto_CD_UNID_NEG: TStringField
      FieldName = 'CD_UNID_NEG'
      Origin = 'TCLIENTE_DOCUMENTO.CD_UNID_NEG'
      Size = 2
    end
    object qry_cliente_docto_CD_PRODUTO: TStringField
      FieldName = 'CD_PRODUTO'
      Origin = 'TCLIENTE_DOCUMENTO.CD_PRODUTO'
      Size = 2
    end
    object qry_cliente_docto_CD_DOCUMENTO: TStringField
      FieldName = 'CD_DOCUMENTO'
      Origin = 'TCLIENTE_DOCUMENTO.CD_DOCUMENTO'
      Size = 3
    end
    object qry_cliente_docto_CD_FORMA_DOC: TStringField
      FieldName = 'CD_FORMA_DOC'
      Origin = 'TCLIENTE_DOCUMENTO.CD_CLIENTE'
      Size = 1
    end
    object qry_cliente_docto_LookCliente: TStringField
      FieldName = 'LookCliente'
      LookupDataSet = qry_empresa_nac_
      LookupKeyFields = 'CD_EMPRESA'
      LookupResultField = 'NM_EMPRESA'
      KeyFields = 'CD_CLIENTE'
      Size = 50
      Lookup = True
    end
    object qry_cliente_docto_LookUnidNeg: TStringField
      FieldName = 'LookUnidNeg'
      LookupDataSet = qry_unid_neg_
      LookupKeyFields = 'CD_UNID_NEG'
      LookupResultField = 'NM_UNID_NEG'
      KeyFields = 'CD_UNID_NEG'
      Size = 50
      Lookup = True
    end
    object qry_cliente_docto_LookProduto: TStringField
      FieldName = 'LookProduto'
      LookupDataSet = qry_produto_
      LookupKeyFields = 'CD_PRODUTO'
      LookupResultField = 'NM_PRODUTO'
      KeyFields = 'CD_PRODUTO'
      Size = 50
      Lookup = True
    end
    object qry_cliente_docto_LookDocto: TStringField
      FieldName = 'LookDocto'
      LookupDataSet = qry_docto_
      LookupKeyFields = 'CODIGO'
      LookupResultField = 'DESCRICAO'
      KeyFields = 'CD_DOCUMENTO'
      Size = 30
      Lookup = True
    end
    object qry_cliente_docto_LookFormaDoc: TStringField
      FieldName = 'LookFormaDoc'
      LookupDataSet = qry_tp_forma_doc_
      LookupKeyFields = 'CD_FORMA_DOC'
      LookupResultField = 'NM_FORMA_DOC'
      KeyFields = 'CD_FORMA_DOC'
      Size = 10
      Lookup = True
    end
  end
  object ds_empresa_nac: TDataSource
    DataSet = qry_empresa_nac_
    Left = 46
    Top = 108
  end
  object qry_empresa_nac_: TQuery
    Active = True
    DatabaseName = 'DBBROKER'
    ParamCheck = False
    SQL.Strings = (
      'SELECT CD_EMPRESA, NM_EMPRESA'
      'FROM TEMPRESA_NAC')
    Left = 167
    Top = 108
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
  object ds_unid_neg: TDataSource
    DataSet = qry_unid_neg_
    Left = 46
    Top = 156
  end
  object ds_produto: TDataSource
    DataSet = qry_produto_
    Left = 46
    Top = 204
  end
  object qry_produto_: TQuery
    Active = True
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT CD_PRODUTO, NM_PRODUTO'
      'FROM TPRODUTO')
    Left = 167
    Top = 203
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
    Active = True
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT CD_UNID_NEG, NM_UNID_NEG FROM'
      'TUNID_NEG')
    Left = 167
    Top = 156
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
  object qry_cli_docto_lista_: TQuery
    AfterScroll = qry_cli_docto_lista_AfterScroll
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      
        'SELECT E.CD_EMPRESA CD_CLIENTE, E.NM_EMPRESA, U.CD_UNID_NEG, U.N' +
        'M_UNID_NEG, P.CD_PRODUTO, P.NM_PRODUTO, CD.CD_DOCUMENTO, D.DESCR' +
        'ICAO, F.NM_FORMA_DOC'
      
        'FROM   TCLIENTE_DOCUMENTO CD, TTP_DOCUMENTO D, TEMPRESA_NAC E, T' +
        'UNID_NEG U, TPRODUTO P, TTP_FORMA_DOC F'
      'WHERE  D.CD_UNID_NEG = CD.CD_UNID_NEG    AND'
      '       D.CD_PRODUTO = CD.CD_PRODUTO      AND'
      '       CD.CD_CLIENTE = E.CD_EMPRESA      AND'
      '       CD.CD_UNID_NEG = U.CD_UNID_NEG    AND'
      '       CD.CD_PRODUTO = P.CD_PRODUTO      AND'
      '       D.CODIGO = CD.CD_DOCUMENTO        AND'
      '       CD.CD_FORMA_DOC *= F.CD_FORMA_DOC AND'
      '       CD.CD_CLIENTE = :CD_CLIENTE       AND'
      '       CD.CD_UNID_NEG = :CD_UNID_NEG     AND'
      '       CD.CD_PRODUTO = :CD_PRODUTO'
      'ORDER BY CD_DOCUMENTO')
    Params.Data = {
      010003000A43445F434C49454E544500010200300000000B43445F554E49445F
      4E454700010200300000000A43445F50524F4455544F0001020030000000}
    Left = 167
    Top = 12
    object qry_cli_docto_lista_CD_DOCUMENTO: TStringField
      DisplayLabel = 'Cód.'
      FieldName = 'CD_DOCUMENTO'
      Origin = 'TCLIENTE_DOCUMENTO.CD_DOCUMENTO'
      Size = 3
    end
    object qry_cli_docto_lista_DESCRICAO: TStringField
      DisplayLabel = 'Documento'
      FieldName = 'DESCRICAO'
      Size = 50
    end
    object qry_cli_docto_lista_CD_CLIENTE: TStringField
      FieldName = 'CD_CLIENTE'
      Origin = 'TEMPRESA_NAC.CD_EMPRESA'
      Size = 5
    end
    object qry_cli_docto_lista_NM_EMPRESA: TStringField
      FieldName = 'NM_EMPRESA'
      Origin = 'TEMPRESA_NAC.NM_EMPRESA'
      Size = 50
    end
    object qry_cli_docto_lista_CD_UNID_NEG: TStringField
      FieldName = 'CD_UNID_NEG'
      Origin = 'TUNID_NEG.CD_UNID_NEG'
      Size = 2
    end
    object qry_cli_docto_lista_NM_UNID_NEG: TStringField
      FieldName = 'NM_UNID_NEG'
      Origin = 'TUNID_NEG.NM_UNID_NEG'
      Size = 50
    end
    object qry_cli_docto_lista_CD_PRODUTO: TStringField
      FieldName = 'CD_PRODUTO'
      Origin = 'TPRODUTO.CD_PRODUTO'
      Size = 2
    end
    object qry_cli_docto_lista_NM_PRODUTO: TStringField
      FieldName = 'NM_PRODUTO'
      Origin = 'TPRODUTO.NM_PRODUTO'
      Size = 40
    end
    object qry_cli_docto_lista_NM_FORMA_DOC: TStringField
      DisplayLabel = 'Enviar'
      FieldName = 'NM_FORMA_DOC'
      Size = 10
    end
  end
  object ds_cliente_docto: TDataSource
    DataSet = qry_cliente_docto_
    Left = 46
    Top = 60
  end
  object qry_docto_: TQuery
    Active = True
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT CODIGO, DESCRICAO'
      'FROM   TTP_DOCUMENTO'
      'WHERE  CD_UNID_NEG = :CD_UNID_NEG AND'
      '       CD_PRODUTO = :CD_PRODUTO')
    Params.Data = {
      010002000B43445F554E49445F4E454700010200300000000A43445F50524F44
      55544F0001020030000000}
    Left = 167
    Top = 254
    object qry_docto_CODIGO: TStringField
      FieldName = 'CODIGO'
      Origin = 'TTP_DOCUMENTO.CODIGO'
      Size = 3
    end
    object qry_docto_DESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Origin = 'TTP_DOCUMENTO.CODIGO'
      Size = 50
    end
  end
  object qry_tp_forma_doc_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT CD_FORMA_DOC, NM_FORMA_DOC'
      'FROM   TTP_FORMA_DOC')
    Left = 166
    Top = 310
    object qry_tp_forma_doc_CD_FORMA_DOC: TStringField
      FieldName = 'CD_FORMA_DOC'
      Origin = 'TTP_FORMA_DOC.CD_FORMA_DOC'
      Size = 1
    end
    object qry_tp_forma_doc_NM_FORMA_DOC: TStringField
      FieldName = 'NM_FORMA_DOC'
      Origin = 'TTP_FORMA_DOC.NM_FORMA_DOC'
      Size = 10
    end
  end
  object ds_tp_forma_doc: TDataSource
    DataSet = qry_tp_forma_doc_
    Left = 46
    Top = 313
  end
end
