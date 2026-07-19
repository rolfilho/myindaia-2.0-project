object datm_po_consulta_prod: Tdatm_po_consulta_prod
  OldCreateOrder = True
  Left = 244
  Top = 49
  Height = 189
  Width = 383
  object qry_po_itens1_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      
        'SELECT I.NR_PROCESSO, E.NM_EMPRESA, I.QT_INICIAL, I.NR_ITEM, I.C' +
        'D_NCM_SH'
      
        'FROM TPO_ITEM I ( NOLOCK ), TPO P ( NOLOCK ), TEMPRESA_NAC E ( N' +
        'OLOCK )'
      'WHERE ( P.NR_PROCESSO   = I.NR_PROCESSO  )'
      '  AND ( P.CD_IMPORTADOR = E.CD_EMPRESA   )'
      '  AND ( I.CD_MERCADORIA = :CD_MERCADORIA )')
    Left = 312
    Top = 24
    ParamData = <
      item
        DataType = ftString
        Name = 'CD_MERCADORIA'
        ParamType = ptUnknown
      end>
    object qry_po_itens1_NR_PROCESSO: TStringField
      FieldName = 'NR_PROCESSO'
      Origin = 'TPO_ITEM.NR_PROCESSO'
      Size = 18
    end
    object qry_po_itens1_NM_EMPRESA: TStringField
      FieldName = 'NM_EMPRESA'
      FixedChar = True
      Size = 50
    end
    object qry_po_itens1_QT_INICIAL: TFloatField
      FieldName = 'QT_INICIAL'
      Origin = 'TPO_ITEM.QT_INICIAL'
      DisplayFormat = '#0,.000'
      EditFormat = '#0.000'
    end
    object qry_po_itens1_NR_ITEM: TStringField
      FieldName = 'NR_ITEM'
      Origin = 'TPO_ITEM.NR_ITEM'
      Size = 3
    end
    object qry_po_itens1_CD_NCM_SH: TStringField
      FieldName = 'CD_NCM_SH'
      Origin = 'TPO_ITEM.NR_PROCESSO'
      Size = 11
    end
  end
  object qry_produto_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT CD_PRODUTO, AP_PRODUTO'
      'FROM TPRODUTO ( NOLOCK )'
      'WHERE CD_PRODUTO = :CD_PRODUTO')
    Left = 119
    Top = 24
    ParamData = <
      item
        DataType = ftString
        Name = 'CD_PRODUTO'
        ParamType = ptUnknown
      end>
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
  object qry_unid_neg_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT CD_UNID_NEG, AP_UNID_NEG'
      'FROM TUNID_NEG ( NOLOCK )'
      'WHERE CD_UNID_NEG = :CD_UNID_NEG')
    Left = 39
    Top = 24
    ParamData = <
      item
        DataType = ftString
        Name = 'CD_UNID_NEG'
        ParamType = ptUnknown
      end>
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
  object qry_cliente_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT CD_EMPRESA, NM_EMPRESA, AP_EMPRESA'
      'FROM TEMPRESA_NAC ( NOLOCK)'
      'WHERE CD_EMPRESA = :CD_CLIENTE ')
    Left = 39
    Top = 100
    ParamData = <
      item
        DataType = ftString
        Name = 'CD_CLIENTE'
        ParamType = ptUnknown
      end>
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
    object qry_cliente_AP_EMPRESA: TStringField
      FieldName = 'AP_EMPRESA'
      Origin = 'TEMPRESA_NAC.AP_EMPRESA'
      Size = 10
    end
  end
  object ds_po_itens1: TDataSource
    DataSet = qry_po_itens1_
    Left = 225
    Top = 24
  end
  object qry_po_itens2_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      
        'SELECT I.NR_PROCESSO, E.NM_EMPRESA, I.QT_INICIAL, I.NR_ITEM, I.C' +
        'D_NCM_SH'
      
        'FROM TPO_ITEM I ( NOLOCK ), TPO P ( NOLOCK ), TEMPRESA_NAC E ( N' +
        'OLOCK )'
      'WHERE ( P.NR_PROCESSO   = I.NR_PROCESSO  )'
      '  AND ( P.CD_IMPORTADOR = E.CD_EMPRESA   )'
      '  AND ( P.CD_IMPORTADOR = :CD_IMPORTADOR )'
      '  AND ( I.CD_MERCADORIA = :CD_MERCADORIA )'
      '')
    Left = 312
    Top = 100
    ParamData = <
      item
        DataType = ftString
        Name = 'CD_IMPORTADOR'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'CD_MERCADORIA'
        ParamType = ptUnknown
      end>
    object StringField1: TStringField
      FieldName = 'NR_PROCESSO'
      Origin = 'TPO_ITEM.NR_PROCESSO'
      Size = 18
    end
    object qry_po_itens2_NM_EMPRESA: TStringField
      FieldName = 'NM_EMPRESA'
      FixedChar = True
      Size = 50
    end
    object FloatField1: TFloatField
      FieldName = 'QT_INICIAL'
      Origin = 'TPO_ITEM.QT_INICIAL'
      DisplayFormat = '#0,.000'
      EditFormat = '#0.000'
    end
    object StringField3: TStringField
      FieldName = 'NR_ITEM'
      Origin = 'TPO_ITEM.NR_ITEM'
      Size = 3
    end
    object StringField4: TStringField
      FieldName = 'CD_NCM_SH'
      Origin = 'TPO_ITEM.NR_PROCESSO'
      Size = 11
    end
  end
  object ds_po_itens2: TDataSource
    DataSet = qry_po_itens2_
    Left = 225
    Top = 100
  end
end
