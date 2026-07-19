object datm_pe_consulta_itens: Tdatm_pe_consulta_itens
  OldCreateOrder = True
  Left = 223
  Top = 175
  Height = 126
  Width = 352
  object qry_pe_itens_: TQuery
    OnCalcFields = qry_pe_itens_CalcFields
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      
        'SELECT NR_PROCESSO, NR_ITEM, CD_MERCADORIA, CD_NCM, QT_MERCADORI' +
        'A, QT_BAIXADA '
      'FROM TPE_ITEM '
      'WHERE NR_PROCESSO = :NR_PROCESSO AND CD_UNID_NEG = :CD_UNID_NEG')
    Left = 268
    Top = 24
    ParamData = <
      item
        DataType = ftString
        Name = 'NR_PROCESSO'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'CD_UNID_NEG'
        ParamType = ptUnknown
      end>
    object qry_pe_itens_NR_PROCESSO: TStringField
      FieldName = 'NR_PROCESSO'
      Origin = 'TPE_ITEM.NR_PROCESSO'
      Size = 18
    end
    object qry_pe_itens_NR_ITEM: TStringField
      FieldName = 'NR_ITEM'
      Origin = 'TPE_ITEM.NR_ITEM'
      Size = 3
    end
    object qry_pe_itens_CD_MERCADORIA: TStringField
      DisplayWidth = 20
      FieldName = 'CD_MERCADORIA'
      Origin = 'TPE_ITEM.CD_MERCADORIA'
    end
    object qry_pe_itens_CD_NCM: TStringField
      FieldName = 'CD_NCM'
      Origin = 'TPE_ITEM.CD_NCM'
      Size = 11
    end
    object qry_pe_itens_QT_MERCADORIA: TFloatField
      FieldName = 'QT_MERCADORIA'
      Origin = 'TPE_ITEM.QT_MERCADORIA'
      DisplayFormat = '#0,.00'
      EditFormat = '#0.00'
    end
    object qry_pe_itens_QT_BAIXADA: TFloatField
      FieldName = 'QT_BAIXADA'
      Origin = 'TPE_ITEM.QT_BAIXADA'
      DisplayFormat = '#0,.00'
      EditFormat = '#0.00'
    end
    object qry_pe_itens_CalcQtDisponivel: TFloatField
      FieldKind = fkCalculated
      FieldName = 'CalcQtDisponivel'
      DisplayFormat = '#0,.00'
      EditFormat = '#0.00'
      Calculated = True
    end
  end
  object qry_produto_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT CD_PRODUTO, AP_PRODUTO'
      'FROM TPRODUTO'
      'WHERE CD_PRODUTO = :CD_PRODUTO')
    Left = 111
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
      'FROM TUNID_NEG'
      'WHERE CD_UNID_NEG = :CD_UNID_NEG')
    Left = 33
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
  object ds_pe_itens: TDataSource
    DataSet = qry_pe_itens_
    Left = 188
    Top = 24
  end
end
