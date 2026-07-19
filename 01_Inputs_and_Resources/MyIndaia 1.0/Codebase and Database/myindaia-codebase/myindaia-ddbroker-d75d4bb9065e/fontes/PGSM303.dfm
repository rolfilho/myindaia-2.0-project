object datm_cliente_conta_contabil: Tdatm_cliente_conta_contabil
  OldCreateOrder = True
  Left = 233
  Top = 157
  Height = 344
  Width = 276
  object qry_cliente_cta_contabil_: TQuery
    DatabaseName = 'DBBROKER'
    RequestLive = True
    SQL.Strings = (
      'SELECT *'
      'FROM   TCLIENTE_CONTA_CONTABIL (NOLOCK)'
      'WHERE  CD_CLIENTE = :CD_CLIENTE AND'
      '       CD_UNID_NEG = :CD_UNID_NEG AND'
      '       CD_PRODUTO = :CD_PRODUTO AND'
      '       CD_CT_CONTABIL = :CD_CT_CONTABIL'
      'ORDER BY CD_CT_CONTABIL')
    Left = 171
    Top = 60
    ParamData = <
      item
        DataType = ftString
        Name = 'CD_CLIENTE'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'CD_UNID_NEG'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'CD_PRODUTO'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'CD_CT_CONTABIL'
        ParamType = ptInput
      end>
    object qry_cliente_cta_contabil_CD_CLIENTE: TStringField
      FieldName = 'CD_CLIENTE'
      Origin = 'TCLIENTE_DOCUMENTO.CD_CLIENTE'
      Size = 5
    end
    object qry_cliente_cta_contabil_CD_UNID_NEG: TStringField
      FieldName = 'CD_UNID_NEG'
      Origin = 'TCLIENTE_DOCUMENTO.CD_UNID_NEG'
      Size = 2
    end
    object qry_cliente_cta_contabil_CD_PRODUTO: TStringField
      FieldName = 'CD_PRODUTO'
      Origin = 'TCLIENTE_DOCUMENTO.CD_PRODUTO'
      Size = 2
    end
    object qry_cliente_cta_contabil_LookCliente: TStringField
      FieldKind = fkLookup
      FieldName = 'LookCliente'
      LookupDataSet = qry_empresa_nac_
      LookupKeyFields = 'CD_EMPRESA'
      LookupResultField = 'NM_EMPRESA'
      KeyFields = 'CD_CLIENTE'
      Size = 50
      Lookup = True
    end
    object qry_cliente_cta_contabil_LookUnidNeg: TStringField
      FieldKind = fkLookup
      FieldName = 'LookUnidNeg'
      LookupDataSet = qry_unid_neg_
      LookupKeyFields = 'CD_UNID_NEG'
      LookupResultField = 'NM_UNID_NEG'
      KeyFields = 'CD_UNID_NEG'
      Size = 50
      Lookup = True
    end
    object qry_cliente_cta_contabil_LookProduto: TStringField
      FieldKind = fkLookup
      FieldName = 'LookProduto'
      LookupDataSet = qry_produto_
      LookupKeyFields = 'CD_PRODUTO'
      LookupResultField = 'NM_PRODUTO'
      KeyFields = 'CD_PRODUTO'
      Size = 50
      Lookup = True
    end
    object qry_cliente_cta_contabil_CD_CT_CONTABIL: TStringField
      FieldName = 'CD_CT_CONTABIL'
      Origin = 'DBBROKER.TCLIENTE_CONTA_CONTABIL.CD_CT_CONTABIL'
      FixedChar = True
      Size = 10
    end
  end
  object ds_empresa_nac: TDataSource
    DataSet = qry_empresa_nac_
    Left = 50
    Top = 108
  end
  object qry_empresa_nac_: TQuery
    Active = True
    DatabaseName = 'DBBROKER'
    ParamCheck = False
    SQL.Strings = (
      'SELECT CD_EMPRESA, NM_EMPRESA'
      'FROM TEMPRESA_NAC')
    Left = 171
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
    Left = 50
    Top = 156
  end
  object ds_produto: TDataSource
    DataSet = qry_produto_
    Left = 50
    Top = 204
  end
  object qry_produto_: TQuery
    Active = True
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT CD_PRODUTO, NM_PRODUTO'
      'FROM TPRODUTO')
    Left = 171
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
    Left = 171
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
  object ds_cliente_cta_contabil: TDataSource
    DataSet = qry_cliente_cta_contabil_
    Left = 50
    Top = 60
  end
  object ds_lista: TDataSource
    DataSet = qry_lista_
    Left = 50
    Top = 12
  end
  object qry_lista_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      
        'SELECT E.CD_EMPRESA CD_CLIENTE, E.NM_EMPRESA, U.CD_UNID_NEG, U.N' +
        'M_UNID_NEG,'
      
        '       P.CD_PRODUTO, P.NM_PRODUTO, CT.CD_CT_CONTABIL, C.NM_CT_CO' +
        'NTABIL'
      
        'FROM   TCLIENTE_CONTA_CONTABIL CT, TCT_CONTABIL C, TEMPRESA_NAC ' +
        'E,'
      '       TUNID_NEG U, TPRODUTO P'
      'WHERE  CT.CD_CLIENTE = E.CD_EMPRESA         AND'
      '       CT.CD_UNID_NEG = U.CD_UNID_NEG       AND'
      '       CT.CD_PRODUTO = P.CD_PRODUTO         AND'
      '       CT.CD_CT_CONTABIL = C.CD_CT_CONTABIL AND'
      '       CT.CD_CLIENTE = :CD_CLIENTE          AND'
      '       CT.CD_UNID_NEG = :CD_UNID_NEG        AND'
      '       CT.CD_PRODUTO = :CD_PRODUTO'
      'ORDER BY CT.CD_CT_CONTABIL')
    Left = 170
    Top = 13
    ParamData = <
      item
        DataType = ftString
        Name = 'CD_CLIENTE'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'CD_UNID_NEG'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'CD_PRODUTO'
        ParamType = ptInput
      end>
    object qry_lista_CD_CLIENTE: TStringField
      FieldName = 'CD_CLIENTE'
      Origin = 'DBBROKER.TEMPRESA_NAC.CD_EMPRESA'
      FixedChar = True
      Size = 5
    end
    object qry_lista_NM_EMPRESA: TStringField
      FieldName = 'NM_EMPRESA'
      Origin = 'DBBROKER.TEMPRESA_NAC.NM_EMPRESA'
      FixedChar = True
      Size = 50
    end
    object qry_lista_CD_UNID_NEG: TStringField
      FieldName = 'CD_UNID_NEG'
      Origin = 'DBBROKER.TUNID_NEG.CD_UNID_NEG'
      FixedChar = True
      Size = 2
    end
    object qry_lista_NM_UNID_NEG: TStringField
      FieldName = 'NM_UNID_NEG'
      Origin = 'DBBROKER.TUNID_NEG.NM_UNID_NEG'
      FixedChar = True
      Size = 50
    end
    object qry_lista_CD_PRODUTO: TStringField
      FieldName = 'CD_PRODUTO'
      Origin = 'DBBROKER.TPRODUTO.CD_PRODUTO'
      FixedChar = True
      Size = 2
    end
    object qry_lista_NM_PRODUTO: TStringField
      FieldName = 'NM_PRODUTO'
      Origin = 'DBBROKER.TPRODUTO.NM_PRODUTO'
      FixedChar = True
      Size = 40
    end
    object qry_lista_CD_CT_CONTABIL: TStringField
      FieldName = 'CD_CT_CONTABIL'
      Origin = 'DBBROKER.TCLIENTE_CONTA_CONTABIL.CD_CT_CONTABIL'
      FixedChar = True
      Size = 10
    end
    object qry_lista_NM_CT_CONTABIL: TStringField
      FieldName = 'NM_CT_CONTABIL'
      Origin = 'DBBROKER.TCT_CONTABIL.NM_CT_CONTABIL'
      FixedChar = True
      Size = 40
    end
  end
end
