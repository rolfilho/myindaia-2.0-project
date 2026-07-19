object datm_documento: Tdatm_documento
  OldCreateOrder = True
  Left = 446
  Top = 185
  Height = 267
  Width = 227
  object qry_documento_: TQuery
    AfterPost = qry_documento_AfterPost
    DatabaseName = 'DBBROKER'
    RequestLive = True
    SQL.Strings = (
      'SELECT *'
      'FROM TTP_DOCUMENTO'
      
        'WHERE ( ( CD_UNID_NEG = :CD_UNID_NEG ) OR ( :CD_UNID_NEG = '#39#39' ) ' +
        ') AND'
      '      ( ( CD_PRODUTO = :CD_PRODUTO ) OR ( :CD_PRODUTO = '#39#39' ) )'
      'ORDER BY'
      'CODIGO')
    Left = 120
    Top = 16
    ParamData = <
      item
        DataType = ftString
        Name = 'CD_UNID_NEG'
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
        Name = 'CD_PRODUTO'
        ParamType = ptUnknown
      end>
    object qry_documento_CODIGO: TStringField
      FieldName = 'CODIGO'
      Origin = 'TTP_DOCUMENTO.CODIGO'
      Size = 3
    end
    object qry_documento_DESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Origin = 'TTP_DOCUMENTO.CODIGO'
      Size = 50
    end
    object qry_documento_CD_UNID_NEG: TStringField
      FieldName = 'CD_UNID_NEG'
      Origin = 'TTP_DOCUMENTO.CODIGO'
      Size = 2
    end
    object qry_documento_CD_PRODUTO: TStringField
      FieldName = 'CD_PRODUTO'
      Origin = 'TTP_DOCUMENTO.DESCRICAO'
      Size = 2
    end
    object qry_documento_LookUnidNeg: TStringField
      DisplayLabel = 'Unid. Neg.'
      DisplayWidth = 50
      FieldKind = fkLookup
      FieldName = 'LookUnidNeg'
      LookupDataSet = qry_unid_neg_
      LookupKeyFields = 'CD_UNID_NEG'
      LookupResultField = 'NM_UNID_NEG'
      KeyFields = 'CD_UNID_NEG'
      Size = 50
      Lookup = True
    end
    object qry_documento_LookProduto: TStringField
      DisplayLabel = 'Produto'
      FieldKind = fkLookup
      FieldName = 'LookProduto'
      LookupDataSet = qry_produto_
      LookupKeyFields = 'CD_PRODUTO'
      LookupResultField = 'NM_PRODUTO'
      KeyFields = 'CD_PRODUTO'
      Size = 50
      Lookup = True
    end
  end
  object ds_documento: TDataSource
    DataSet = qry_documento_
    Left = 28
    Top = 16
  end
  object qry_ult_doc_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT MAX(CODIGO) AS ULTIMO'
      'FROM TTP_DOCUMENTO')
    Left = 28
    Top = 152
    object qry_ult_doc_ULTIMO: TStringField
      FieldName = 'ULTIMO'
      Origin = 'TTP_DOCUMENTO.CODIGO'
      Size = 3
    end
  end
  object qry_unid_neg_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT CD_UNID_NEG, NM_UNID_NEG '
      'FROM TUNID_NEG')
    Left = 120
    Top = 82
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
    Left = 28
    Top = 82
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
end
