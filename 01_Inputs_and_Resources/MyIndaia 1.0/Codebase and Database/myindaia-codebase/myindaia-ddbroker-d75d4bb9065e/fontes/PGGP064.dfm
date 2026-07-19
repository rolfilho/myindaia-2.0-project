object datm_pesq_lote: Tdatm_pesq_lote
  OldCreateOrder = True
  Left = 162
  Top = 136
  Height = 378
  Width = 562
  object qry_pesq_lote_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      
        'SELECT D.NR_LOTE, D.CD_MERCADORIA, M.AP_MERCADORIA, D.NR_REF, M.' +
        'PL_MERCADORIA,'
      
        '       ISNULL( D.QT_DISPONIVEL, 0 ) QT_DISPONIVEL, ISNULL( D.PL_' +
        'DISPONIVEL, 0 ) PL_DISPONIVEL'
      'FROM   TDA_LOTE D, TMERCADORIA M'
      'WHERE  NR_PROCESSO = :NR_PROCESSO AND'
      '       D.CD_MERCADORIA *= M.CD_MERCADORIA'
      'ORDER BY'
      'D.NR_LOTE')
    Left = 37
    Top = 20
    ParamData = <
      item
        DataType = ftString
        Name = 'NR_PROCESSO'
        ParamType = ptUnknown
      end>
    object qry_pesq_lote_NR_LOTE: TStringField
      DisplayLabel = 'N'#186' Lote'
      FieldName = 'NR_LOTE'
      Size = 12
    end
    object qry_pesq_lote_CD_MERCADORIA: TStringField
      DisplayLabel = 'C'#243'd.'
      FieldName = 'CD_MERCADORIA'
      Size = 30
    end
    object qry_pesq_lote_AP_MERCADORIA: TStringField
      DisplayLabel = 'Mercadoria'
      FieldName = 'AP_MERCADORIA'
      Size = 25
    end
    object qry_pesq_lote_NR_REF: TStringField
      DisplayLabel = 'N'#186' Ref'
      FieldName = 'NR_REF'
      Size = 15
    end
    object qry_pesq_lote_QT_DISPONIVEL: TIntegerField
      DisplayLabel = 'Qtde'
      FieldName = 'QT_DISPONIVEL'
    end
    object qry_pesq_lote_PL_DISPONIVEL: TFloatField
      DisplayLabel = 'Peso L'#237'q.'
      FieldName = 'PL_DISPONIVEL'
      DisplayFormat = '#0,.00000'
      EditFormat = '#0.00000'
    end
    object qry_pesq_lote_PL_MERCADORIA: TFloatField
      FieldName = 'PL_MERCADORIA'
    end
  end
  object ds_pesq_lote: TDataSource
    AutoEdit = False
    DataSet = qry_pesq_lote_
    Left = 36
    Top = 80
  end
end
