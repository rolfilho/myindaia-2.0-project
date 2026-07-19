object datm_fin_transf_pagto: Tdatm_fin_transf_pagto
  OldCreateOrder = True
  Left = 200
  Top = 108
  Height = 185
  Width = 442
  object qry_caixa_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT DISTINCT C.NR_LANCAMENTO, C.NR_PROCESSO, C.CD_ITEM,'
      '       CASE C.IN_RESTITUI'
      '         WHEN '#39'0'#39' THEN I.NM_ITEM'
      '         ELSE '#39'REST./'#39' + I.NM_ITEM'
      '       END AS NM_ITEM, C.VL_LANCAMENTO, C.DT_MOVIMENTO'
      'FROM   TCAIXA C (NOLOCK)'
      'INNER JOIN TITEM I (NOLOCK) ON C.CD_ITEM = I.CD_ITEM'
      
        'INNER JOIN TFATURAMENTO_CC F (NOLOCK) ON F.NR_PROCESSO = C.NR_PR' +
        'OCESSO AND F.CD_ITEM = C.CD_ITEM'
      
        '                                         AND F.VL_ITEM = C.VL_LA' +
        'NCAMENTO'
      'WHERE  C.NR_PROCESSO = :NR_PROCESSO AND'
      '       C.DT_MOVIMENTO = :DT_MOVIMENTO AND'
      '       C.CD_ITEM = :CD_ITEM AND'
      '       C.IN_CANCELADO = '#39'0'#39' AND'
      '       F.IN_CANCELADO  = '#39'0'#39' AND'
      '       F.IN_FATURADO   = '#39'0'#39
      'ORDER BY'
      'C.NR_LANCAMENTO')
    Left = 44
    Top = 12
    ParamData = <
      item
        DataType = ftString
        Name = 'NR_PROCESSO'
        ParamType = ptUnknown
      end
      item
        DataType = ftDate
        Name = 'DT_MOVIMENTO'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'CD_ITEM'
        ParamType = ptUnknown
      end>
    object qry_caixa_NR_LANCAMENTO: TStringField
      DisplayLabel = 'N'#186' Lancto'
      FieldName = 'NR_LANCAMENTO'
      Origin = 'TCAIXA.NR_LANCAMENTO'
      Size = 6
    end
    object qry_caixa_NR_PROCESSO: TStringField
      DisplayLabel = 'Processo'
      FieldName = 'NR_PROCESSO'
      Origin = 'TCAIXA.NR_PROCESSO'
      Size = 18
    end
    object qry_caixa_NM_ITEM: TStringField
      DisplayLabel = 'Item'
      FieldName = 'NM_ITEM'
      Size = 36
    end
    object qry_caixa_CD_ITEM: TStringField
      DisplayLabel = 'C'#243'd.'
      FieldName = 'CD_ITEM'
      Origin = 'TCAIXA.CD_ITEM'
      Size = 3
    end
    object qry_caixa_DT_MOVIMENTO: TDateTimeField
      DisplayLabel = 'Data'
      FieldName = 'DT_MOVIMENTO'
      Origin = 'TCAIXA.DT_MOVIMENTO'
      DisplayFormat = 'dd/mm/yyyy'
    end
    object qry_caixa_VL_LANCAMENTO: TFloatField
      DisplayLabel = 'Valor'
      FieldName = 'VL_LANCAMENTO'
      DisplayFormat = '#0,.00'
      EditFormat = '#0.00'
    end
  end
  object ds_caixa: TDataSource
    DataSet = qry_caixa_
    Left = 44
    Top = 72
  end
  object qry_unid_neg_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT CD_UNID_NEG, AP_UNID_NEG'
      'FROM   TUNID_NEG (NOLOCK)'
      'WHERE  CD_UNID_NEG = :CD_UNID_NEG AND'
      '       CD_UNID_NEG IN'
      '       ( SELECT CD_UNID_NEG'
      '         FROM   TUSUARIO_HABILITACAO (NOLOCK)'
      '         WHERE  CD_USUARIO = :CD_USUARIO )')
    Left = 140
    Top = 12
    ParamData = <
      item
        DataType = ftString
        Name = 'CD_UNID_NEG'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'CD_USUARIO'
        ParamType = ptUnknown
      end>
    object qry_unid_neg_CD_UNID_NEG: TStringField
      FieldName = 'CD_UNID_NEG'
      Size = 2
    end
    object qry_unid_neg_AP_UNID_NEG: TStringField
      FieldName = 'AP_UNID_NEG'
      Size = 10
    end
  end
  object qry_produto_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT CD_PRODUTO, AP_PRODUTO, NM_PRODUTO'
      'FROM   TPRODUTO (NOLOCK)'
      'WHERE  CD_PRODUTO = :CD_PRODUTO AND'
      '       CD_PRODUTO IN'
      '              ( SELECT CD_PRODUTO'
      '                FROM   TUSUARIO_HABILITACAO (NOLOCK)'
      '                WHERE  CD_USUARIO = :CD_USUARIO )')
    Left = 136
    Top = 72
    ParamData = <
      item
        DataType = ftString
        Name = 'CD_PRODUTO'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'CD_USUARIO'
        ParamType = ptUnknown
      end>
    object qry_produto_CD_PRODUTO: TStringField
      FieldName = 'CD_PRODUTO'
      Size = 2
    end
    object qry_produto_AP_PRODUTO: TStringField
      FieldName = 'AP_PRODUTO'
      Size = 10
    end
    object qry_produto_NM_PRODUTO: TStringField
      FieldName = 'NM_PRODUTO'
      FixedChar = True
      Size = 40
    end
  end
  object qry_processo_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT NR_PROCESSO'
      'FROM   TPROCESSO (NOLOCK)'
      'WHERE  NR_PROCESSO = :NR_PROCESSO  AND'
      '       IN_LIBERADO = '#39'1'#39' AND'
      '       IN_CANCELADO = '#39'0'#39' AND'
      '       IN_PRODUCAO = '#39'1'#39
      '')
    Left = 230
    Top = 12
    ParamData = <
      item
        DataType = ftString
        Name = 'NR_PROCESSO'
        ParamType = ptUnknown
      end>
    object qry_processo_NR_PROCESSO: TStringField
      FieldName = 'NR_PROCESSO'
      Origin = 'TPROCESSO.NR_PROCESSO'
      Size = 18
    end
  end
  object qry_item_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT CD_ITEM, NM_ITEM'
      'FROM   TITEM (NOLOCK)'
      'WHERE  CD_ITEM = :CD_ITEM')
    Left = 234
    Top = 72
    ParamData = <
      item
        DataType = ftString
        Name = 'CD_ITEM'
        ParamType = ptUnknown
      end>
  end
  object sp_fin_transf_pagto: TStoredProc
    DatabaseName = 'DBBROKER'
    StoredProcName = 'dbo.sp_fin_transf_pagto'
    Left = 328
    Top = 16
    ParamData = <
      item
        DataType = ftInteger
        Name = 'Result'
        ParamType = ptResult
      end
      item
        DataType = ftString
        Name = '@nr_processo_orig'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = '@nr_processo_dest'
        ParamType = ptInput
      end
      item
        DataType = ftDateTime
        Name = '@dt_pagamento'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = '@vl_pagamento'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = '@cd_item'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = '@nr_lanc'
        ParamType = ptInput
      end>
  end
end
