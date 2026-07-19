object datm_sel_banco_data: Tdatm_sel_banco_data
  OldCreateOrder = True
  Left = 333
  Top = 100
  Height = 266
  Width = 237
  object qry_banco_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      
        'SELECT CD_BANCO, NM_BANCO, NR_BANCO, CD_AGENCIA, NR_CONTA, DAC_A' +
        'GENCIA'
      'FROM TBANCO'
      'WHERE CD_BANCO = '#39#39)
    Left = 35
    Top = 22
    object qry_banco_CD_BANCO: TStringField
      FieldName = 'CD_BANCO'
      Origin = 'TBANCO.CD_BANCO'
      Size = 3
    end
    object qry_banco_NM_BANCO: TStringField
      FieldName = 'NM_BANCO'
      Origin = 'TBANCO.NM_BANCO'
      Size = 40
    end
    object qry_banco_NR_BANCO: TStringField
      FieldName = 'NR_BANCO'
      Origin = 'TBANCO.CD_BANCO'
      Size = 3
    end
    object qry_banco_CD_AGENCIA: TStringField
      FieldName = 'CD_AGENCIA'
      Origin = 'TBANCO.NM_BANCO'
      Size = 5
    end
    object qry_banco_NR_CONTA: TStringField
      FieldName = 'NR_CONTA'
      Origin = 'TBANCO.NR_BANCO'
      Size = 10
    end
    object qry_banco_DAC_AGENCIA: TStringField
      FieldName = 'DAC_AGENCIA'
      Origin = 'TBANCO.CD_AGENCIA'
      Size = 1
    end
  end
  object sp_atz_rel_pagto: TStoredProc
    DatabaseName = 'DBBROKER'
    StoredProcName = 'dbo.sp_atz_rel_pagto'
    Left = 134
    Top = 22
    ParamData = <
      item
        DataType = ftInteger
        Name = 'Result'
        ParamType = ptResult
      end
      item
        DataType = ftString
        Name = '@cd_unid_neg'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = '@cd_produto'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = '@dt_mov'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = '@cd_banco'
        ParamType = ptInput
      end>
  end
  object qry_coligada_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT CD_COLIGADA, NM_COLIGADA, CGC_COLIGADA, END_COLIGADA, '
      'END_NUMERO, END_COMPL, END_CIDADE, END_CEP, END_UF'
      'FROM TCOLIGADA'
      'WHERE CD_COLIGADA <> '#39#39)
    Left = 35
    Top = 79
    object qry_coligada_CD_COLIGADA: TStringField
      FieldName = 'CD_COLIGADA'
      Origin = 'TCOLIGADA.CD_COLIGADA'
      Size = 2
    end
    object qry_coligada_NM_COLIGADA: TStringField
      FieldName = 'NM_COLIGADA'
      Origin = 'TCOLIGADA.NM_COLIGADA'
    end
    object qry_coligada_CGC_COLIGADA: TStringField
      FieldName = 'CGC_COLIGADA'
      Origin = 'TCOLIGADA.CD_COLIGADA'
      Size = 14
    end
    object qry_coligada_END_COLIGADA: TStringField
      FieldName = 'END_COLIGADA'
      Origin = 'TCOLIGADA.NM_COLIGADA'
      Size = 50
    end
    object qry_coligada_END_NUMERO: TStringField
      FieldName = 'END_NUMERO'
      Origin = 'TCOLIGADA.CGC_COLIGADA'
      Size = 6
    end
    object qry_coligada_END_COMPL: TStringField
      FieldName = 'END_COMPL'
      Origin = 'TCOLIGADA.END_COLIGADA'
    end
    object qry_coligada_END_CIDADE: TStringField
      FieldName = 'END_CIDADE'
      Origin = 'TCOLIGADA.END_NUMERO'
    end
    object qry_coligada_END_CEP: TStringField
      FieldName = 'END_CEP'
      Origin = 'TCOLIGADA.END_COMPL'
      Size = 8
    end
    object qry_coligada_END_UF: TStringField
      FieldName = 'END_UF'
      Origin = 'TCOLIGADA.END_CIDADE'
      Size = 2
    end
  end
  object qry_favorecido_: TQuery
    DatabaseName = 'DBBROKER'
    DataSource = ds_ctaapagar
    SQL.Strings = (
      
        'SELECT CD_FAVORECIDO, NM_FAVORECIDO, NR_BANCO, NR_AGENCIA, NR_CO' +
        'NTA,'
      'NR_DAC, CGC_EMPRESA, CPF_EMPRESA'
      'FROM TFAVORECIDO'
      'WHERE CD_FAVORECIDO =:CD_FORNECEDOR')
    Left = 134
    Top = 79
    ParamData = <
      item
        DataType = ftString
        Name = 'CD_FORNECEDOR'
        ParamType = ptUnknown
        Size = 6
      end>
    object qry_favorecido_CD_FAVORECIDO: TStringField
      FieldName = 'CD_FAVORECIDO'
      Origin = 'TFAVORECIDO.CD_FAVORECIDO'
      Size = 5
    end
    object qry_favorecido_NM_FAVORECIDO: TStringField
      FieldName = 'NM_FAVORECIDO'
      Origin = 'TFAVORECIDO.NM_FAVORECIDO'
      Size = 50
    end
    object qry_favorecido_NR_BANCO: TStringField
      FieldName = 'NR_BANCO'
      Origin = 'TFAVORECIDO.NR_BANCO'
      Size = 3
    end
    object qry_favorecido_NR_AGENCIA: TStringField
      FieldName = 'NR_AGENCIA'
      Origin = 'TFAVORECIDO.NR_AGENCIA'
      Size = 5
    end
    object qry_favorecido_NR_CONTA: TStringField
      FieldName = 'NR_CONTA'
      Origin = 'TFAVORECIDO.NR_CONTA'
      Size = 12
    end
    object qry_favorecido_NR_DAC: TStringField
      FieldName = 'NR_DAC'
      Origin = 'TFAVORECIDO.NR_DAC'
      Size = 2
    end
    object qry_favorecido_CGC_EMPRESA: TStringField
      FieldName = 'CGC_EMPRESA'
      Origin = 'TFAVORECIDO.CD_FAVORECIDO'
      Size = 14
    end
    object qry_favorecido_CPF_EMPRESA: TStringField
      FieldName = 'CPF_EMPRESA'
      Origin = 'TFAVORECIDO.CD_FAVORECIDO'
      Size = 11
    end
  end
  object qry_ctaapagar_: TQuery
    OnCalcFields = qry_ctaapagar_CalcFields
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      
        'SELECT A.DT_CTAAPAGAR, A.NR_CTAAPAGAR, A.DT_PAGAMENTO, A.DT_VENC' +
        'IMENTO, '
      
        '       A.VL_DESPESA, A.VL_DESCONTO, A.VL_ACRESCIMO, A.VL_IR, A.V' +
        'L_INSS, '
      '       A.CD_FORNECEDOR, A.TP_CD_BARRAS, A.CD_BARRAS, F.NR_BANCO,'
      '       CASE'
      
        '         WHEN ( ( ISNULL(A.CD_BARRAS, '#39#39') =  '#39#39' ) AND ( F.NR_BAN' +
        'CO =  B.NR_BANCO ) ) THEN '#39'01'#39
      
        '         WHEN ( ( ISNULL(A.CD_BARRAS, '#39#39') =  '#39#39' ) AND ( F.NR_BAN' +
        'CO <> B.NR_BANCO ) ) THEN '#39'03'#39
      
        '         WHEN ( ( ISNULL(A.CD_BARRAS, '#39#39') <> '#39#39' ) AND ( SUBSTRIN' +
        'G(A.CD_BARRAS, 1, 3) =  B.NR_BANCO ) ) THEN '#39'30'#39
      '         ELSE '#39'31'#39
      '       END TP_PAGTO'
      'FROM TCTAAPAGAR A'
      'JOIN TFAVORECIDO F'
      '  ON (A.CD_FORNECEDOR = F.CD_FAVORECIDO)'
      'LEFT JOIN TBANCO B'
      '  ON (A.CD_BANCO = B.CD_BANCO) AND (A.CD_BANCO     = :CD_BANCO)'
      'WHERE A.CD_COLIGADA  = :CD_COLIGADA AND'
      '      A.DT_PAGAMENTO = :DT_PAGAMENTO AND'
      '      A.IN_LIBERADO  = '#39'1'#39' AND'
      '      A.IN_CANCELADO = '#39'0'#39
      'ORDER BY'
      '      CASE'
      
        '         WHEN ( ( ISNULL(A.CD_BARRAS, '#39#39') =  '#39#39' ) AND ( F.NR_BAN' +
        'CO =  B.NR_BANCO ) ) THEN '#39'01'#39
      
        '         WHEN ( ( ISNULL(A.CD_BARRAS, '#39#39') =  '#39#39' ) AND ( F.NR_BAN' +
        'CO <> B.NR_BANCO ) ) THEN '#39'03'#39
      
        '         WHEN ( ( ISNULL(A.CD_BARRAS, '#39#39') <> '#39#39' ) AND ( SUBSTRIN' +
        'G(A.CD_BARRAS, 1, 3) = B.NR_BANCO ) ) THEN '#39'30'#39
      '         ELSE '#39'31'#39
      '       END'
      '')
    Left = 134
    Top = 134
    ParamData = <
      item
        DataType = ftString
        Name = 'CD_BANCO'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'CD_COLIGADA'
        ParamType = ptUnknown
      end
      item
        DataType = ftDateTime
        Name = 'DT_PAGAMENTO'
        ParamType = ptUnknown
      end>
    object qry_ctaapagar_DT_CTAAPAGAR: TDateTimeField
      FieldName = 'DT_CTAAPAGAR'
      Origin = 'TCTAAPAGAR.DT_CTAAPAGAR'
    end
    object qry_ctaapagar_NR_CTAAPAGAR: TStringField
      FieldName = 'NR_CTAAPAGAR'
      Origin = 'TCTAAPAGAR.NR_CTAAPAGAR'
      Size = 3
    end
    object qry_ctaapagar_DT_PAGAMENTO: TDateTimeField
      FieldName = 'DT_PAGAMENTO'
      Origin = 'TCTAAPAGAR.DT_PAGAMENTO'
    end
    object qry_ctaapagar_DT_VENCIMENTO: TDateTimeField
      FieldName = 'DT_VENCIMENTO'
      Origin = 'TCTAAPAGAR.DT_VENCIMENTO'
    end
    object qry_ctaapagar_VL_DESPESA: TFloatField
      FieldName = 'VL_DESPESA'
      Origin = 'TCTAAPAGAR.VL_DESPESA'
    end
    object qry_ctaapagar_VL_DESCONTO: TFloatField
      FieldName = 'VL_DESCONTO'
      Origin = 'TCTAAPAGAR.VL_DESCONTO'
    end
    object qry_ctaapagar_VL_ACRESCIMO: TFloatField
      FieldName = 'VL_ACRESCIMO'
      Origin = 'TCTAAPAGAR.VL_ACRESCIMO'
    end
    object qry_ctaapagar_VL_IR: TFloatField
      FieldName = 'VL_IR'
      Origin = 'TCTAAPAGAR.VL_IR'
    end
    object qry_ctaapagar_VL_INSS: TFloatField
      FieldName = 'VL_INSS'
      Origin = 'TCTAAPAGAR.VL_INSS'
    end
    object qry_ctaapagar_CD_BARRAS: TStringField
      FieldName = 'CD_BARRAS'
      Origin = 'TCTAAPAGAR.CD_BARRAS'
      Size = 44
    end
    object qry_ctaapagar_TP_CD_BARRAS: TStringField
      FieldName = 'TP_CD_BARRAS'
      Origin = 'TCTAAPAGAR.DT_CTAAPAGAR'
      Size = 1
    end
    object qry_ctaapagar_CD_FORNECEDOR: TStringField
      FieldName = 'CD_FORNECEDOR'
      Origin = 'TCTAAPAGAR.NR_CTAAPAGAR'
      Size = 5
    end
    object qry_ctaapagar_CalcValor: TFloatField
      FieldKind = fkCalculated
      FieldName = 'CalcValor'
      DisplayFormat = '#0,.00'
      EditFormat = '#0.00'
      Calculated = True
    end
    object qry_ctaapagar_CalcPagamento: TFloatField
      FieldKind = fkCalculated
      FieldName = 'CalcPagamento'
      DisplayFormat = '#0,.00'
      EditFormat = '#0.00'
      Calculated = True
    end
    object qry_ctaapagar_NR_BANCO: TStringField
      FieldName = 'NR_BANCO'
      Size = 3
    end
    object qry_ctaapagar_TP_PAGTO: TStringField
      FieldName = 'TP_PAGTO'
      Size = 2
    end
  end
  object ds_ctaapagar: TDataSource
    DataSet = qry_ctaapagar_
    Left = 35
    Top = 134
  end
  object qry_unidade_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT NM_UNID_NEG '
      'FROM TUNID_NEG'
      'WHERE CD_UNID_NEG = :CD_UNID_NEG')
    Left = 33
    Top = 184
    ParamData = <
      item
        DataType = ftString
        Name = 'CD_UNID_NEG'
        ParamType = ptUnknown
      end>
    object qry_unidade_NM_UNID_NEG: TStringField
      FieldName = 'NM_UNID_NEG'
      Origin = 'TUNID_NEG.NM_UNID_NEG'
      Size = 50
    end
  end
  object qry_produto_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT NM_PRODUTO'
      'FROM TPRODUTO '
      'WHERE CD_PRODUTO = :CD_PRODUTO')
    Left = 136
    Top = 184
    ParamData = <
      item
        DataType = ftString
        Name = 'CD_PRODUTO'
        ParamType = ptUnknown
      end>
  end
end
