object datm_po_consulta_itens: Tdatm_po_consulta_itens
  OldCreateOrder = True
  Left = 223
  Top = 175
  Height = 160
  Width = 214
  object qry_po_itens_: TQuery
    OnCalcFields = qry_po_itens_CalcFields
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      
        'SELECT I.NR_ITEM, I.CD_MERCADORIA, I.CD_NCM_SH, I.QT_INICIAL, I.' +
        'QT_BAIXADA_LI, I.QT_BAIXADA_DI,'
      '  ( SELECT L.NR_PROCESSO'
      '    FROM TLICENCA_ITENS L ( NOLOCK )'
      '    WHERE I.NR_PROCESSO = L.NR_PROC_PO'
      '      AND I.NR_ITEM = L.NR_ITEM_PO'
      '  ) AS NR_PROCESSO_LI,'
      '  ( SELECT D.NR_PROCESSO'
      '    FROM TDETALHE_MERCADORIA D ( NOLOCK )'
      '    WHERE I.NR_PROCESSO = D.NR_PROC_PO'
      '      AND I.NR_ITEM = D.NR_ITEM_PO'
      '  ) AS NR_PROCESSO_DI'
      'FROM TPO_ITEM I ( NOLOCK )'
      'WHERE I.NR_PROCESSO = :NR_PROCESSO'
      '')
    Left = 136
    Top = 72
    ParamData = <
      item
        DataType = ftString
        Name = 'NR_PROCESSO'
        ParamType = ptUnknown
      end>
    object qry_po_itens_NR_ITEM: TStringField
      FieldName = 'NR_ITEM'
      Origin = 'TPO_ITEM.NR_ITEM'
      Size = 3
    end
    object qry_po_itens_CD_MERCADORIA: TStringField
      FieldName = 'CD_MERCADORIA'
      Origin = 'TPO_ITEM.CD_MERCADORIA'
      Size = 30
    end
    object qry_po_itens_CD_NCM_SH: TStringField
      DisplayLabel = '9999.99.99-9999;0;_'
      FieldName = 'CD_NCM_SH'
      Origin = 'TPO_ITEM.CD_NCM_SH'
      Size = 11
    end
    object qry_po_itens_QT_INICIAL: TFloatField
      FieldName = 'QT_INICIAL'
      Origin = 'TPO_ITEM.QT_INICIAL'
      DisplayFormat = '#0,.000'
      EditFormat = '#0.000'
    end
    object qry_po_itens_QT_BAIXADA_LI: TFloatField
      FieldName = 'QT_BAIXADA_LI'
      Origin = 'TPO_ITEM.QT_BAIXADA_LI'
      DisplayFormat = '#0,.000'
      EditFormat = '#0.000'
    end
    object qry_po_itens_QT_BAIXADA_DI: TFloatField
      FieldName = 'QT_BAIXADA_DI'
      Origin = 'TPO_ITEM.QT_BAIXADA_DI'
      DisplayFormat = '#0,.000'
      EditFormat = '#0.000'
    end
    object qry_po_itens_CalcQtDisponivel: TFloatField
      FieldKind = fkCalculated
      FieldName = 'CalcQtDisponivel'
      DisplayFormat = '#0,.000'
      EditFormat = '#0.000'
      Calculated = True
    end
    object qry_po_itens_NR_PROCESSO_LI: TStringField
      FieldName = 'NR_PROCESSO_LI'
      Size = 18
    end
    object qry_po_itens_NR_PROCESSO_DI: TStringField
      FieldName = 'NR_PROCESSO_DI'
      Size = 18
    end
    object qry_po_itens_CalcNrProcessoDI: TStringField
      FieldKind = fkCalculated
      FieldName = 'CalcNrProcessoDI'
      Size = 10
      Calculated = True
    end
    object qry_po_itens_CalcNrProcessoLI: TStringField
      FieldKind = fkCalculated
      FieldName = 'CalcNrProcessoLI'
      Size = 10
      Calculated = True
    end
  end
  object qry_produto_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT CD_PRODUTO, AP_PRODUTO'
      'FROM TPRODUTO ( NOLOCK )'
      'WHERE CD_PRODUTO = :CD_PRODUTO')
    Left = 136
    Top = 8
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
    Left = 40
    Top = 8
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
  object ds_po_itens: TDataSource
    DataSet = qry_po_itens_
    Left = 40
    Top = 72
  end
end
