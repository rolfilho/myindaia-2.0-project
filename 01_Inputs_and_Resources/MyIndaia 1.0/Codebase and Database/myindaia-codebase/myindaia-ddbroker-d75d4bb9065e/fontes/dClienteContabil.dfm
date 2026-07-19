object datm_cliente_contabil: Tdatm_cliente_contabil
  OldCreateOrder = False
  Left = 350
  Top = 209
  Height = 450
  Width = 274
  object ds_lista: TDataSource
    DataSet = qry_lista_
    Left = 40
    Top = 16
  end
  object qry_lista_: TQuery
    AfterScroll = qry_lista_AfterScroll
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      
        'SELECT CC.CD_CT_CONTABIL, CC.CD_CLIENTE, CC.CD_UNID_NEG, CC.CD_P' +
        'RODUTO, E.NM_EMPRESA, U.NM_UNID_NEG, P.NM_PRODUTO, C.NM_CT_CONTA' +
        'BIL'
      
        'FROM TCLIENTE_CONTA_CONTABIL CC, TEMPRESA_NAC E, TUNID_NEG U, TP' +
        'RODUTO P, TCT_CONTABIL C'
      'WHERE CC.CD_CLIENTE = E.CD_EMPRESA AND'
      '      CC.CD_UNID_NEG = U.CD_UNID_NEG AND'
      '      CC.CD_PRODUTO = P.CD_PRODUTO AND'
      '      CC.CD_CT_CONTABIL = C.CD_CT_CONTABIL AND'
      '      CC.CD_CLIENTE = :CD_CLIENTE AND'
      '      CC.CD_UNID_NEG = :CD_UNID_NEG AND'
      '      CC.CD_PRODUTO = :CD_PRODUTO'
      'ORDER BY CC.CD_CT_CONTABIL')
    Left = 152
    Top = 16
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
    object qry_lista_CD_CT_CONTABIL: TStringField
      FieldName = 'CD_CT_CONTABIL'
      Origin = 'DBBROKER.TCLIENTE_CONTA_CONTABIL.CD_CT_CONTABIL'
      FixedChar = True
      Size = 12
    end
    object qry_lista_CD_CLIENTE: TStringField
      FieldName = 'CD_CLIENTE'
      Origin = 'DBBROKER.TCLIENTE_CONTA_CONTABIL.CD_CLIENTE'
      FixedChar = True
      Size = 5
    end
    object qry_lista_CD_UNID_NEG: TStringField
      FieldName = 'CD_UNID_NEG'
      Origin = 'DBBROKER.TCLIENTE_CONTA_CONTABIL.CD_UNID_NEG'
      FixedChar = True
      Size = 2
    end
    object qry_lista_CD_PRODUTO: TStringField
      FieldName = 'CD_PRODUTO'
      Origin = 'DBBROKER.TCLIENTE_CONTA_CONTABIL.CD_PRODUTO'
      FixedChar = True
      Size = 2
    end
    object qry_lista_NM_EMPRESA: TStringField
      FieldName = 'NM_EMPRESA'
      Origin = 'DBBROKER.TEMPRESA_NAC.NM_EMPRESA'
      FixedChar = True
      Size = 50
    end
    object qry_lista_NM_UNID_NEG: TStringField
      FieldName = 'NM_UNID_NEG'
      Origin = 'DBBROKER.TUNID_NEG.NM_UNID_NEG'
      FixedChar = True
      Size = 50
    end
    object qry_lista_NM_PRODUTO: TStringField
      FieldName = 'NM_PRODUTO'
      Origin = 'DBBROKER.TPRODUTO.NM_PRODUTO'
      FixedChar = True
      Size = 40
    end
    object qry_lista_NM_CT_CONTABIL: TStringField
      FieldName = 'NM_CT_CONTABIL'
      Origin = 'DBBROKER.TCT_CONTABIL.NM_CT_CONTABIL'
      FixedChar = True
      Size = 40
    end
  end
  object ds_cliente_contabil_: TDataSource
    DataSet = qry_cliente_contabil_
    Left = 40
    Top = 73
  end
  object qry_cliente_contabil_: TQuery
    DatabaseName = 'DBBROKER'
    RequestLive = True
    SQL.Strings = (
      'SELECT *'
      'FROM   TCLIENTE_CONTA_CONTABIL (NOLOCK)'
      'WHERE  CD_CLIENTE = :CD_CLIENTE AND'
      '       CD_UNID_NEG = :CD_UNID_NEG AND'
      '       CD_PRODUTO = :CD_PRODUTO AND'
      '       CD_CT_CONTABIL= :CD_CT_CONTABIL'
      'ORDER BY CD_CT_CONTABIL')
    Left = 152
    Top = 72
    ParamData = <
      item
        DataType = ftString
        Name = 'CD_CLIENTE'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'CD_UNID_NEG'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'CD_PRODUTO'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'CD_CT_CONTABIL'
        ParamType = ptInput
      end>
    object qry_cliente_contabil_CD_CLIENTE: TStringField
      FieldName = 'CD_CLIENTE'
      Origin = 'TCLIENTE_DOCUMENTO.CD_CLIENTE'
      Size = 5
    end
    object qry_cliente_contabil_CD_UNID_NEG: TStringField
      FieldName = 'CD_UNID_NEG'
      Origin = 'TCLIENTE_DOCUMENTO.CD_UNID_NEG'
      Size = 2
    end
    object qry_cliente_contabil_CD_PRODUTO: TStringField
      FieldName = 'CD_PRODUTO'
      Origin = 'TCLIENTE_DOCUMENTO.CD_PRODUTO'
      Size = 2
    end
    object qry_cliente_contabil_CD_CT_CONTABIL: TStringField
      FieldName = 'CD_CT_CONTABIL'
      Origin = 'DBBROKER.TCLIENTE_CONTA_CONTABIL.CD_CT_CONTABIL'
      FixedChar = True
      Size = 12
    end
    object qry_cliente_contabil_LookConta: TStringField
      FieldKind = fkLookup
      FieldName = 'LookConta'
      LookupDataSet = qry_conta_
      LookupKeyFields = 'CD_CT_CONTABIL'
      LookupResultField = 'NM_CT_CONTABIL'
      KeyFields = 'CD_CT_CONTABIL'
      Size = 40
      Lookup = True
    end
    object qry_cliente_contabil_LookCliente: TStringField
      FieldKind = fkLookup
      FieldName = 'LookCliente'
      LookupDataSet = qry_empresa_nac_
      LookupKeyFields = 'CD_EMPRESA'
      LookupResultField = 'NM_EMPRESA'
      KeyFields = 'CD_CLIENTE'
      Size = 50
      Lookup = True
    end
    object qry_cliente_contabil_LookUnidNeg: TStringField
      FieldKind = fkLookup
      FieldName = 'LookUnidNeg'
      LookupDataSet = qry_unid_neg_
      LookupKeyFields = 'CD_UNID_NEG'
      LookupResultField = 'NM_UNID_NEG'
      KeyFields = 'CD_UNID_NEG'
      Size = 40
      Lookup = True
    end
    object qry_cliente_contabil_LookProduto: TStringField
      FieldKind = fkLookup
      FieldName = 'LookProduto'
      LookupDataSet = qry_produto_
      LookupKeyFields = 'CD_PRODUTO'
      LookupResultField = 'NM_PRODUTO'
      KeyFields = 'CD_PRODUTO'
      Size = 40
      Lookup = True
    end
  end
  object ds_empresa_nac: TDataSource
    DataSet = qry_empresa_nac_
    Left = 40
    Top = 130
  end
  object qry_empresa_nac_: TQuery
    DatabaseName = 'DBBROKER'
    ParamCheck = False
    SQL.Strings = (
      'SELECT CD_EMPRESA, NM_EMPRESA'
      'FROM TEMPRESA_NAC')
    Left = 152
    Top = 129
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
    Left = 40
    Top = 187
  end
  object ds_produto: TDataSource
    DataSet = qry_produto_
    Left = 40
    Top = 244
  end
  object qry_produto_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT CD_PRODUTO, NM_PRODUTO'
      'FROM TPRODUTO')
    Left = 152
    Top = 243
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
    Left = 152
    Top = 186
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
  object ds_conta: TDataSource
    DataSet = qry_conta_
    Left = 40
    Top = 301
  end
  object qry_conta_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT CD_CT_CONTABIL, NM_CT_CONTABIL'
      'FROM TCT_CONTABIL')
    Left = 152
    Top = 300
    object qry_conta_CD_CT_CONTABIL: TStringField
      FieldName = 'CD_CT_CONTABIL'
      Origin = 'DBBROKER.TCT_CONTABIL.CD_CT_CONTABIL'
      FixedChar = True
      Size = 12
    end
    object qry_conta_NM_CT_CONTABIL: TStringField
      FieldName = 'NM_CT_CONTABIL'
      Origin = 'DBBROKER.TCT_CONTABIL.NM_CT_CONTABIL'
      FixedChar = True
      Size = 40
    end
  end
end
