object datm_conciliacao: Tdatm_conciliacao
  OldCreateOrder = False
  Left = 422
  Top = 133
  Height = 454
  Width = 331
  object ds_caixa: TDataSource
    DataSet = qry_caixa_
    Left = 40
    Top = 9
  end
  object qry_caixa_: TQuery
    OnCalcFields = qry_caixa_CalcFields
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      
        'SELECT C.NR_CHEQUE, SUM(C.VL_LANCAMENTO) AS VL_LANCAMENTO, C.DT_' +
        'MOVIMENTO, C.CD_COLIGADA, C.CD_UNID_NEG, C.CD_BANCO, C.IN_CONCIL' +
        'IACAO,'
      
        '       C.DT_CONCILIACAO, MAX( C.NR_PROCESSO ) AS NR_PROCESSO, C.' +
        'TP_NATUREZA, MAX( C.CD_FAVORECIDO ) AS CD_FAVORECIDO, C.NM_HISTO' +
        'RICO,'
      
        '       MAX( C.CD_ITEM ) AS CD_ITEM, MAX( C.CD_CT_CONTABIL ) AS C' +
        'D_CT_CONTABIL, MAX( C.NR_LANCAMENTO ) AS NR_LANCAMENTO,'
      
        '       C.TP_PAGAMENTO, C.NR_SEQ_CONCILIACAO, C.IN_CONCILIACAO_AU' +
        'TOM, C.IN_CONTABILIZA, SUM( C.VL_INSS ) AS VL_INSS,'
      
        '       SUM( C.VL_IR ) AS VL_IR, SUM( C.VL_PISCOFINS ) AS VL_PISC' +
        'OFINS, SUM( C.VL_ISS ) AS VL_ISS, I.NM_ITEM AS NM_ITEM'
      'FROM TCAIXA C (NOLOCK)'
      '     INNER JOIN TITEM I (NOLOCK) ON ( C.CD_ITEM = I.CD_ITEM )'
      'WHERE C.CD_COLIGADA = '#39'01'#39
      'AND C.CD_UNID_NEG = :CD_UNID_NEG'
      'AND C.CD_BANCO = :CD_BANCO'
      
        'AND C.DT_MOVIMENTO BETWEEN CONVERT(DATETIME, :DT_INICIO ,103) AN' +
        'D CONVERT(DATETIME, :DT_FIM ,103)'
      
        'AND ( C.IN_CONCILIACAO IN ( :IN_CONCILIACAO, '#39'1'#39' ) OR ( '#39'3'#39' = :I' +
        'N_CONCILIACAO ) )'
      
        'AND ( ISNULL( C.DT_CONCILIACAO, '#39#39' ) = CONVERT(DATETIME, :DT_CON' +
        'CILIACAO ,103 ) OR ( '#39'  /  /    '#39' = :DT_CONCILIACAO ) )'
      'AND ( C.NR_CHEQUE = :NR_CHEQUE OR ( '#39#39' = :NR_CHEQUE ) )'
      
        'AND ( ( C.VL_LANCAMENTO = :VL_LANCAMENTO ) OR ( 0 = :VL_LANCAMEN' +
        'TO ) )'
      
        'AND ( ( C.TP_PAGAMENTO = :TP_PAGAMENTO ) OR ( '#39#39' = :TP_PAGAMENTO' +
        ' ) )'
      'AND C.IN_RESTITUI = '#39'0'#39
      'AND ISNULL( C.NR_CHEQUE, '#39#39' ) <> '#39#39
      'AND C.NR_CHEQUE NOT IN ( SELECT DISTINCT NR_CHEQUE'
      '                       FROM TCAIXA (NOLOCK)'
      '                       WHERE CD_COLIGADA = '#39'01'#39
      '                       AND CD_UNID_NEG = :CD_UNID_NEG'
      '                       AND CD_BANCO = :CD_BANCO'
      
        '                       AND DT_MOVIMENTO BETWEEN CONVERT(DATETIME' +
        ', :DT_INICIO ,103) AND CONVERT(DATETIME, :DT_FIM ,103)'
      
        '                       AND ( ( IN_CONCILIACAO IN ( :IN_CONCILIAC' +
        'AO, '#39'1'#39' ) ) OR ( '#39'3'#39' = :IN_CONCILIACAO ) )'
      '                       AND ISNULL( NR_CHEQUE, '#39#39' ) <> '#39#39
      '                       AND IN_RESTITUI = '#39'1'#39' )'
      
        'GROUP BY C.NR_CHEQUE, C.DT_MOVIMENTO, C.CD_COLIGADA, C.CD_UNID_N' +
        'EG, C.CD_BANCO, C.IN_CONCILIACAO, C.DT_CONCILIACAO, C.TP_NATUREZ' +
        'A,'
      
        '         C.NM_HISTORICO, C.TP_PAGAMENTO, C.NR_SEQ_CONCILIACAO, C' +
        '.IN_CONCILIACAO_AUTOM, C.IN_CONTABILIZA, I.NM_ITEM'
      'UNION'
      
        'SELECT C.NR_CHEQUE, C.VL_LANCAMENTO, C.DT_MOVIMENTO, C.CD_COLIGA' +
        'DA, C.CD_UNID_NEG, C.CD_BANCO, C.IN_CONCILIACAO,'
      
        '       C.DT_CONCILIACAO, MAX( C.NR_PROCESSO ) AS NR_PROCESSO, C.' +
        'TP_NATUREZA, MAX( C.CD_FAVORECIDO ) AS CD_FAVORECIDO, C.NM_HISTO' +
        'RICO,'
      
        '       MAX( C.CD_ITEM ) AS CD_ITEM, MAX( C.CD_CT_CONTABIL ) AS C' +
        'D_CT_CONTABIL, MAX( C.NR_LANCAMENTO ) AS NR_LANCAMENTO,'
      
        '       C.TP_PAGAMENTO, C.NR_SEQ_CONCILIACAO, C.IN_CONCILIACAO_AU' +
        'TOM, C.IN_CONTABILIZA, C.VL_INSS, C.VL_IR, C.VL_PISCOFINS, C.VL_' +
        'ISS,'
      '       I.NM_ITEM'
      'FROM TCAIXA C (NOLOCK)'
      '     INNER JOIN TITEM I (NOLOCK) ON ( C.CD_ITEM = I.CD_ITEM )'
      'WHERE C.CD_COLIGADA = '#39'01'#39
      'AND C.CD_UNID_NEG = :CD_UNID_NEG'
      'AND C.CD_BANCO = :CD_BANCO'
      
        'AND C.DT_MOVIMENTO BETWEEN CONVERT(DATETIME, :DT_INICIO ,103) AN' +
        'D CONVERT(DATETIME, :DT_FIM ,103)'
      
        'AND ( C.IN_CONCILIACAO IN ( :IN_CONCILIACAO, '#39'1'#39' ) OR ( '#39'3'#39' = :I' +
        'N_CONCILIACAO ) )'
      
        'AND ( ISNULL( C.DT_CONCILIACAO, '#39#39' ) = CONVERT(DATETIME, :DT_CON' +
        'CILIACAO ,103) OR ( '#39'  /  /    '#39' = :DT_CONCILIACAO ) )'
      
        'AND ( ISNULL( C.NR_CHEQUE, '#39#39' ) = :NR_CHEQUE AND ( :NR_CHEQUE = ' +
        #39#39' ) )'
      
        'AND ( ( C.VL_LANCAMENTO = :VL_LANCAMENTO ) OR ( 0 = :VL_LANCAMEN' +
        'TO ) )'
      
        'AND ( ( C.TP_PAGAMENTO = :TP_PAGAMENTO ) OR ( '#39#39' = :TP_PAGAMENTO' +
        ' ) )'
      'AND C.IN_RESTITUI = '#39'0'#39
      'AND ISNULL( C.NR_CHEQUE, '#39#39' ) = '#39#39
      
        'GROUP BY C.VL_LANCAMENTO, C.NR_CHEQUE, C.DT_MOVIMENTO, C.CD_COLI' +
        'GADA, C.CD_UNID_NEG, C.CD_BANCO, C.IN_CONCILIACAO,'
      
        '       C.DT_CONCILIACAO, C.TP_NATUREZA, C.CD_FAVORECIDO, C.NM_HI' +
        'STORICO, C.TP_PAGAMENTO, C.NR_SEQ_CONCILIACAO, C.IN_CONCILIACAO_' +
        'AUTOM,'
      
        '       C.IN_CONTABILIZA, C.VL_INSS, C.VL_IR, C.VL_PISCOFINS, C.V' +
        'L_ISS, I.NM_ITEM'
      'ORDER BY DT_MOVIMENTO')
    Left = 137
    Top = 8
    ParamData = <
      item
        DataType = ftString
        Name = 'CD_UNID_NEG'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'CD_BANCO'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'DT_INICIO'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'DT_FIM'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'IN_CONCILIACAO'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'IN_CONCILIACAO'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'DT_CONCILIACAO'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'DT_CONCILIACAO'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'NR_CHEQUE'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'NR_CHEQUE'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'VL_LANCAMENTO'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'VL_LANCAMENTO'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'TP_PAGAMENTO'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'TP_PAGAMENTO'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'CD_UNID_NEG'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'CD_BANCO'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'DT_INICIO'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'DT_FIM'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'IN_CONCILIACAO'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'IN_CONCILIACAO'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'CD_UNID_NEG'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'CD_BANCO'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'DT_INICIO'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'DT_FIM'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'IN_CONCILIACAO'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'IN_CONCILIACAO'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'DT_CONCILIACAO'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'DT_CONCILIACAO'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'NR_CHEQUE'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'NR_CHEQUE'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'VL_LANCAMENTO'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'VL_LANCAMENTO'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'TP_PAGAMENTO'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'TP_PAGAMENTO'
        ParamType = ptInput
      end>
    object qry_caixa_CD_COLIGADA: TStringField
      FieldName = 'CD_COLIGADA'
      Origin = 'DBBROKER.TCAIXA.CD_COLIGADA'
      FixedChar = True
      Size = 2
    end
    object qry_caixa_DT_MOVIMENTO: TDateTimeField
      FieldName = 'DT_MOVIMENTO'
      Origin = 'DBBROKER.TCAIXA.DT_MOVIMENTO'
    end
    object qry_caixa_NR_LANCAMENTO: TStringField
      FieldName = 'NR_LANCAMENTO'
      Origin = 'DBBROKER.TCAIXA.NR_LANCAMENTO'
      FixedChar = True
      Size = 6
    end
    object qry_caixa_CD_UNID_NEG: TStringField
      FieldName = 'CD_UNID_NEG'
      Origin = 'DBBROKER.TCAIXA.CD_UNID_NEG'
      FixedChar = True
      Size = 2
    end
    object qry_caixa_VL_LANCAMENTO: TFloatField
      FieldName = 'VL_LANCAMENTO'
      Origin = 'DBBROKER.TCAIXA.VL_LANCAMENTO'
      DisplayFormat = '#0,.00'
      EditFormat = '#0,.00'
    end
    object qry_caixa_CD_BANCO: TStringField
      FieldName = 'CD_BANCO'
      Origin = 'DBBROKER.TCAIXA.CD_BANCO'
      FixedChar = True
      Size = 3
    end
    object qry_caixa_NR_CHEQUE: TStringField
      FieldName = 'NR_CHEQUE'
      Origin = 'DBBROKER.TCAIXA.NR_CHEQUE'
      FixedChar = True
      Size = 6
    end
    object qry_caixa_IN_CONCILIACAO: TStringField
      FieldName = 'IN_CONCILIACAO'
      Origin = 'DBBROKER.TCAIXA.IN_CONCILIACAO'
      FixedChar = True
      Size = 1
    end
    object qry_caixa_NM_HISTORICO: TStringField
      FieldName = 'NM_HISTORICO'
      Origin = 'DBBROKER.TCAIXA.NM_HISTORICO'
      FixedChar = True
      Size = 180
    end
    object qry_caixa_NR_PROCESSO: TStringField
      FieldName = 'NR_PROCESSO'
      Origin = 'DBBROKER.TCAIXA.NR_PROCESSO'
      FixedChar = True
      Size = 18
    end
    object qry_caixa_CD_ITEM: TStringField
      FieldName = 'CD_ITEM'
      Origin = 'DBBROKER.TCAIXA.CD_ITEM'
      FixedChar = True
      Size = 3
    end
    object qry_caixa_CD_CT_CONTABIL: TStringField
      FieldName = 'CD_CT_CONTABIL'
      Origin = 'DBBROKER.TCAIXA.CD_CT_CONTABIL'
      FixedChar = True
      Size = 10
    end
    object qry_caixa_DT_CONCILIACAO: TDateTimeField
      FieldName = 'DT_CONCILIACAO'
      Origin = 'DBBROKER.TCAIXA.DT_CONCILIACAO'
    end
    object qry_caixa_CalcStatus: TStringField
      FieldKind = fkCalculated
      FieldName = 'CalcStatus'
      Size = 1
      Calculated = True
    end
    object qry_caixa_CalcProcesso: TStringField
      FieldKind = fkCalculated
      FieldName = 'CalcProcesso'
      Size = 10
      Calculated = True
    end
    object qry_caixa_CD_FAVORECIDO: TStringField
      FieldName = 'CD_FAVORECIDO'
      FixedChar = True
      Size = 5
    end
    object qry_caixa_TP_NATUREZA: TStringField
      FieldName = 'TP_NATUREZA'
      FixedChar = True
      Size = 1
    end
    object qry_caixa_TP_PAGAMENTO: TStringField
      FieldName = 'TP_PAGAMENTO'
      FixedChar = True
      Size = 1
    end
    object qry_caixa_NR_SEQ_CONCILIACAO: TIntegerField
      FieldName = 'NR_SEQ_CONCILIACAO'
    end
    object qry_caixa_IN_CONCILIACAO_AUTOM: TStringField
      FieldName = 'IN_CONCILIACAO_AUTOM'
      FixedChar = True
      Size = 1
    end
    object qry_caixa_IN_CONTABILIZA: TStringField
      FieldName = 'IN_CONTABILIZA'
      FixedChar = True
      Size = 1
    end
    object qry_caixa_CalcConciliacao: TStringField
      FieldKind = fkCalculated
      FieldName = 'CalcConciliacao'
      Size = 3
      Calculated = True
    end
    object qry_caixa_CalcContabilizacao: TStringField
      FieldKind = fkCalculated
      FieldName = 'CalcContabilizacao'
      Size = 3
      Calculated = True
    end
    object qry_caixa_CalcForma: TIntegerField
      FieldKind = fkCalculated
      FieldName = 'CalcForma'
      Calculated = True
    end
    object qry_caixa_VL_INSS: TFloatField
      FieldName = 'VL_INSS'
      DisplayFormat = '#0,.00'
      EditFormat = '#0,.00'
    end
    object qry_caixa_VL_IR: TFloatField
      FieldName = 'VL_IR'
      DisplayFormat = '#0,.00'
      EditFormat = '#0,.00'
    end
    object qry_caixa_VL_PISCOFINS: TFloatField
      FieldName = 'VL_PISCOFINS'
      DisplayFormat = '#0,.00'
      EditFormat = '#0,.00'
    end
    object qry_caixa_VL_ISS: TFloatField
      FieldName = 'VL_ISS'
      DisplayFormat = '#0,.00'
      EditFormat = '#0,.00'
    end
    object qry_caixa_NM_ITEM: TStringField
      FieldName = 'NM_ITEM'
      FixedChar = True
      Size = 30
    end
  end
  object qry_nao_conciliado_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT SUM(VL_LANCAMENTO) AS CONCILIADO '
      'FROM TCAIXA (NOLOCK)'
      'WHERE CD_COLIGADA = '#39'01'#39
      'AND CD_UNID_NEG = :CD_UNID_NEG'
      'AND CD_BANCO = :CD_BANCO'
      
        'AND DT_MOVIMENTO BETWEEN CONVERT(DATETIME, :DT_INICIO ,103) AND ' +
        'CONVERT(DATETIME, :DT_FIM ,103)'
      'AND IN_CONCILIACAO IN ( '#39'0'#39', '#39'1'#39' ) ')
    Left = 137
    Top = 59
    ParamData = <
      item
        DataType = ftString
        Name = 'CD_UNID_NEG'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'CD_BANCO'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'DT_INICIO'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'DT_FIM'
        ParamType = ptInput
      end>
    object qry_nao_conciliado_CONCILIADO: TFloatField
      FieldName = 'CONCILIADO'
      Origin = 'DBBROKER.TCAIXA.VL_LANCAMENTO'
    end
  end
  object qry_conciliado_: TQuery
    OnCalcFields = qry_caixa_CalcFields
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT SUM(VL_LANCAMENTO) AS CONCILIADO '
      'FROM TCAIXA (NOLOCK)'
      'WHERE CD_COLIGADA = '#39'01'#39
      'AND CD_UNID_NEG = :CD_UNID_NEG'
      'AND CD_BANCO = :CD_BANCO'
      
        'AND DT_MOVIMENTO BETWEEN CONVERT(DATETIME, :DT_INICIO ,103) AND ' +
        'CONVERT(DATETIME, :DT_FIM ,103)'
      'AND IN_CONCILIACAO = '#39'2'#39)
    Left = 136
    Top = 111
    ParamData = <
      item
        DataType = ftString
        Name = 'CD_UNID_NEG'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'CD_BANCO'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'DT_INICIO'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'DT_FIM'
        ParamType = ptInput
      end>
    object FloatField1: TFloatField
      FieldName = 'CONCILIADO'
      Origin = 'DBBROKER.TCAIXA.VL_LANCAMENTO'
    end
  end
  object qry_banco_padrao_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT CD_BANCO_CONCILIACAO'
      'FROM   TUNID_NEG (NOLOCK)'
      'WHERE  CD_UNID_NEG = :CD_UNID_NEG')
    Left = 136
    Top = 163
    ParamData = <
      item
        DataType = ftString
        Name = 'CD_UNID_NEG'
        ParamType = ptInput
      end>
    object qry_banco_padrao_CD_BANCO_CONCILIACAO: TStringField
      FieldName = 'CD_BANCO_CONCILIACAO'
      Origin = 'DBBROKER.TUNID_NEG.CD_BANCO_CONCILIACAO'
      FixedChar = True
      Size = 3
    end
  end
  object ds_conc_: TDataSource
    DataSet = qry_conc_
    Left = 40
    Top = 215
  end
  object qry_conc_: TQuery
    DatabaseName = 'DBBROKER'
    RequestLive = True
    SQL.Strings = (
      'SELECT * '
      'FROM TCONCILIACAO'
      'WHERE IN_CONCILIADO = '#39'0'#39
      'AND CD_UNID_NEG = :CD_UNID_NEG'
      'AND CD_BANCO = :CD_BANCO'
      ''
      '')
    Left = 137
    Top = 214
    ParamData = <
      item
        DataType = ftString
        Name = 'CD_UNID_NEG'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'CD_BANCO'
        ParamType = ptInput
      end>
    object qry_conc_NR_IDENTIFICADOR: TIntegerField
      FieldName = 'NR_IDENTIFICADOR'
      Origin = 'DBBROKER.TCONCILIACAO_SAFRA.NR_IDENTIFICADOR'
    end
    object qry_conc_VL_LANCAMENTO: TFloatField
      FieldName = 'VL_LANCAMENTO'
      Origin = 'DBBROKER.TCONCILIACAO_SAFRA.VL_LANCAMENTO'
      DisplayFormat = '#0,.00'
      EditFormat = '#0,.00'
    end
    object qry_conc_DT_LANCAMENTO: TDateTimeField
      FieldName = 'DT_LANCAMENTO'
      Origin = 'DBBROKER.TCONCILIACAO_SAFRA.DT_LANCAMENTO'
    end
    object qry_conc_NM_HISTORICO: TStringField
      FieldName = 'NM_HISTORICO'
      Origin = 'DBBROKER.TCONCILIACAO_SAFRA.NM_HISTORICO'
      FixedChar = True
      Size = 25
    end
    object qry_conc_NR_DOCUMENTO: TStringField
      FieldName = 'NR_DOCUMENTO'
      Origin = 'DBBROKER.TCONCILIACAO_SAFRA.NR_DOCUMENTO'
      FixedChar = True
      Size = 6
    end
    object qry_conc_NM_CATEGORIA: TIntegerField
      FieldName = 'NM_CATEGORIA'
      Origin = 'DBBROKER.TCONCILIACAO_SAFRA.NM_CATEGORIA'
    end
    object qry_conc_TP_NATUREZA: TStringField
      FieldName = 'TP_NATUREZA'
      Origin = 'DBBROKER.TCONCILIACAO_SAFRA.TP_NATUREZA'
      FixedChar = True
      Size = 1
    end
    object qry_conc_IN_CPMF: TStringField
      FieldName = 'IN_CPMF'
      Origin = 'DBBROKER.TCONCILIACAO_SAFRA.IN_CPMF'
      FixedChar = True
      Size = 1
    end
    object qry_conc_IN_CONCILIADO: TStringField
      FieldName = 'IN_CONCILIADO'
      Origin = 'DBBROKER.TCONCILIACAO.IN_CONCILIADO'
      FixedChar = True
      Size = 1
    end
    object qry_conc_CD_UNID_NEG: TStringField
      FieldName = 'CD_UNID_NEG'
      Origin = 'DBBROKER.TCONCILIACAO.CD_UNID_NEG'
      FixedChar = True
      Size = 2
    end
    object qry_conc_CD_BANCO: TStringField
      FieldName = 'CD_BANCO'
      Origin = 'DBBROKER.TCONCILIACAO.CD_BANCO'
      FixedChar = True
      Size = 3
    end
    object qry_conc_NR_SEQ: TAutoIncField
      FieldName = 'NR_SEQ'
      Origin = 'DBBROKER.TCONCILIACAO.NR_SEQ'
    end
    object qry_conc_NR_LANCAMENTO: TStringField
      FieldName = 'NR_LANCAMENTO'
      Origin = 'DBBROKER.TCONCILIACAO.NR_LANCAMENTO'
      FixedChar = True
      Size = 4
    end
  end
  object ds_caixa_docto: TDataSource
    DataSet = qry_caixa_docto_
    Left = 40
    Top = 266
  end
  object qry_caixa_docto_: TQuery
    CachedUpdates = True
    BeforePost = qry_caixa_docto_BeforePost
    AfterDelete = qry_caixa_docto_AfterDelete
    DatabaseName = 'DBBROKER'
    RequestLive = True
    SQL.Strings = (
      'SELECT * '
      'FROM    TCAIXA'
      'WHERE NR_CHEQUE = :NR_CHEQUE'
      '     AND CD_UNID_NEG = :CD_UNID_NEG'
      '      AND CD_BANCO = :CD_BANCO'
      '      AND TP_NATUREZA <> '#39'C'#39
      '      AND IN_CANCELADO = '#39'0'#39
      '      AND IN_CONCILIACAO= '#39'0'#39
      '      AND TP_PROCEDENCIA <> '#39'0'#39
      '')
    UpdateObject = updCaixaDocto
    Left = 137
    Top = 266
    ParamData = <
      item
        DataType = ftString
        Name = 'NR_CHEQUE'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'CD_UNID_NEG'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'CD_BANCO'
        ParamType = ptInput
      end>
    object qry_caixa_docto_DT_MOVIMENTO: TDateTimeField
      FieldName = 'DT_MOVIMENTO'
      Origin = 'DBBROKER.TCAIXA.DT_MOVIMENTO'
    end
    object qry_caixa_docto_VL_LANCAMENTO: TFloatField
      FieldName = 'VL_LANCAMENTO'
      Origin = 'DBBROKER.TCAIXA.VL_LANCAMENTO'
      DisplayFormat = '#0,.00'
      EditFormat = '#0,.00'
    end
    object qry_caixa_docto_CD_BANCO: TStringField
      FieldName = 'CD_BANCO'
      Origin = 'DBBROKER.TCAIXA.CD_BANCO'
      FixedChar = True
      Size = 3
    end
    object qry_caixa_docto_NR_CHEQUE: TStringField
      FieldName = 'NR_CHEQUE'
      Origin = 'DBBROKER.TCAIXA.NR_CHEQUE'
      FixedChar = True
      Size = 6
    end
    object qry_caixa_docto_TP_NATUREZA: TStringField
      FieldName = 'TP_NATUREZA'
      Origin = 'DBBROKER.TCAIXA.TP_NATUREZA'
      FixedChar = True
      Size = 1
    end
    object qry_caixa_docto_NR_LANCAMENTO: TStringField
      FieldName = 'NR_LANCAMENTO'
      Origin = 'DBBROKER.TCAIXA.NR_LANCAMENTO'
      FixedChar = True
      Size = 6
    end
    object qry_caixa_docto_NM_HISTORICO: TStringField
      FieldName = 'NM_HISTORICO'
      Origin = 'DBBROKER.TCAIXA.NM_HISTORICO'
      FixedChar = True
      Size = 180
    end
    object qry_caixa_docto_CD_COLIGADA: TStringField
      FieldName = 'CD_COLIGADA'
      Origin = 'DBBROKER.TCAIXA.CD_COLIGADA'
      FixedChar = True
      Size = 2
    end
    object qry_caixa_docto_NR_SEQ_CONCILIACAO: TIntegerField
      FieldName = 'NR_SEQ_CONCILIACAO'
      Origin = 'DBBROKER.TCAIXA.NR_SEQ_CONCILIACAO'
    end
    object qry_caixa_docto_NR_PROCESSO: TStringField
      FieldName = 'NR_PROCESSO'
      Origin = 'DBBROKER.TCAIXA.NR_PROCESSO'
      FixedChar = True
      Size = 18
    end
    object qry_caixa_docto_CD_UNID_NEG: TStringField
      FieldName = 'CD_UNID_NEG'
      Origin = 'DBBROKER.TCAIXA.CD_UNID_NEG'
      FixedChar = True
      Size = 2
    end
    object qry_caixa_docto_CD_CT_CONTABIL: TStringField
      FieldName = 'CD_CT_CONTABIL'
      Origin = 'DBBROKER.TCAIXA.CD_CT_CONTABIL'
      FixedChar = True
      Size = 10
    end
    object qry_caixa_docto_IN_CONCILIACAO: TStringField
      FieldName = 'IN_CONCILIACAO'
      Origin = 'DBBROKER.TCAIXA.IN_CONCILIACAO'
      FixedChar = True
      Size = 1
    end
    object qry_caixa_docto_DT_CONCILIACAO: TDateTimeField
      FieldName = 'DT_CONCILIACAO'
      Origin = 'DBBROKER.TCAIXA.DT_CONCILIACAO'
    end
    object qry_caixa_docto_CD_USUARIO_CONCILIACAO: TStringField
      FieldName = 'CD_USUARIO_CONCILIACAO'
      Origin = 'DBBROKER.TCAIXA.CD_USUARIO_CONCILIACAO'
      FixedChar = True
      Size = 4
    end
    object qry_caixa_docto_IN_CONCILIACAO_AUTOM: TStringField
      FieldName = 'IN_CONCILIACAO_AUTOM'
      Origin = 'DBBROKER.TCAIXA.IN_CONCILIACAO_AUTOM'
      FixedChar = True
      Size = 1
    end
  end
  object qry_le_arq_txt_: TQuery
    DatabaseName = 'DBBROKER'
    RequestLive = True
    SQL.Strings = (
      'SELECT * '
      'FROM TCONCILIACAO (NOLOCK)'
      'WHERE DT_LANCAMENTO = :DT_LANCAMENTO'
      '     AND VL_LANCAMENTO = :VL_LANCAMENTO'
      '      AND NR_DOCUMENTO = :NR_DOCUMENTO'
      '     AND VL_LANCAMENTO <> 40'
      ''
      '')
    Left = 137
    Top = 318
    ParamData = <
      item
        DataType = ftDateTime
        Name = 'DT_LANCAMENTO'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'VL_LANCAMENTO'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'NR_DOCUMENTO'
        ParamType = ptInput
      end>
    object IntegerField4: TIntegerField
      FieldName = 'NR_IDENTIFICADOR'
      Origin = 'DBBROKER.TCONCILIACAO_SAFRA.NR_IDENTIFICADOR'
    end
    object FloatField3: TFloatField
      FieldName = 'VL_LANCAMENTO'
      Origin = 'DBBROKER.TCONCILIACAO_SAFRA.VL_LANCAMENTO'
      DisplayFormat = '#0,.00'
      EditFormat = '#0,.00'
    end
    object DateTimeField2: TDateTimeField
      FieldName = 'DT_LANCAMENTO'
      Origin = 'DBBROKER.TCONCILIACAO_SAFRA.DT_LANCAMENTO'
    end
    object StringField5: TStringField
      FieldName = 'NM_HISTORICO'
      Origin = 'DBBROKER.TCONCILIACAO_SAFRA.NM_HISTORICO'
      FixedChar = True
      Size = 25
    end
    object StringField6: TStringField
      FieldName = 'NR_DOCUMENTO'
      Origin = 'DBBROKER.TCONCILIACAO_SAFRA.NR_DOCUMENTO'
      FixedChar = True
      Size = 6
    end
    object IntegerField6: TIntegerField
      FieldName = 'NM_CATEGORIA'
      Origin = 'DBBROKER.TCONCILIACAO_SAFRA.NM_CATEGORIA'
    end
    object StringField7: TStringField
      FieldName = 'TP_NATUREZA'
      Origin = 'DBBROKER.TCONCILIACAO_SAFRA.TP_NATUREZA'
      FixedChar = True
      Size = 1
    end
    object StringField8: TStringField
      FieldName = 'IN_CPMF'
      Origin = 'DBBROKER.TCONCILIACAO_SAFRA.IN_CPMF'
      FixedChar = True
      Size = 1
    end
    object qry_le_arq_txt_IN_CONCILIADO: TStringField
      FieldName = 'IN_CONCILIADO'
      Origin = 'DBBROKER.TCONCILIACAO.IN_CONCILIADO'
      FixedChar = True
      Size = 1
    end
    object qry_le_arq_txt_NR_SEQ: TAutoIncField
      FieldName = 'NR_SEQ'
      Origin = 'DBBROKER.TCONCILIACAO.NR_SEQ'
    end
    object qry_le_arq_txt_CD_UNID_NEG: TStringField
      FieldName = 'CD_UNID_NEG'
      Origin = 'DBBROKER.TCONCILIACAO.CD_UNID_NEG'
      FixedChar = True
      Size = 2
    end
    object qry_le_arq_txt_CD_BANCO: TStringField
      FieldName = 'CD_BANCO'
      Origin = 'DBBROKER.TCONCILIACAO.CD_BANCO'
      FixedChar = True
      Size = 3
    end
    object qry_le_arq_txt_NR_LANCAMENTO: TStringField
      FieldName = 'NR_LANCAMENTO'
      Origin = 'DBBROKER.TCONCILIACAO.NR_LANCAMENTO'
      FixedChar = True
      Size = 4
    end
  end
  object qry_conc_lanc_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT * FROM TCONCILIACAO (NOLOCK) WHERE IN_CONCILIADO = '#39'0'#39)
    Left = 137
    Top = 370
    object IntegerField1: TIntegerField
      FieldName = 'NR_IDENTIFICADOR'
      Origin = 'DBBROKER.TCONCILIACAO_SAFRA.NR_IDENTIFICADOR'
    end
    object FloatField2: TFloatField
      FieldName = 'VL_LANCAMENTO'
      Origin = 'DBBROKER.TCONCILIACAO_SAFRA.VL_LANCAMENTO'
      DisplayFormat = '#0,.00'
      EditFormat = '#0,.00'
    end
    object DateTimeField1: TDateTimeField
      FieldName = 'DT_LANCAMENTO'
      Origin = 'DBBROKER.TCONCILIACAO_SAFRA.DT_LANCAMENTO'
    end
    object StringField1: TStringField
      FieldName = 'NM_HISTORICO'
      Origin = 'DBBROKER.TCONCILIACAO_SAFRA.NM_HISTORICO'
      FixedChar = True
      Size = 25
    end
    object StringField2: TStringField
      FieldName = 'NR_DOCUMENTO'
      Origin = 'DBBROKER.TCONCILIACAO_SAFRA.NR_DOCUMENTO'
      FixedChar = True
      Size = 6
    end
    object IntegerField2: TIntegerField
      FieldName = 'NM_CATEGORIA'
      Origin = 'DBBROKER.TCONCILIACAO_SAFRA.NM_CATEGORIA'
    end
    object StringField3: TStringField
      FieldName = 'TP_NATUREZA'
      Origin = 'DBBROKER.TCONCILIACAO_SAFRA.TP_NATUREZA'
      FixedChar = True
      Size = 1
    end
    object StringField4: TStringField
      FieldName = 'IN_CPMF'
      Origin = 'DBBROKER.TCONCILIACAO_SAFRA.IN_CPMF'
      FixedChar = True
      Size = 1
    end
    object StringField9: TStringField
      FieldName = 'IN_CONCILIADO'
      Origin = 'DBBROKER.TCONCILIACAO.IN_CONCILIADO'
      FixedChar = True
      Size = 1
    end
    object StringField10: TStringField
      FieldName = 'CD_UNID_NEG'
      Origin = 'DBBROKER.TCONCILIACAO.CD_UNID_NEG'
      FixedChar = True
      Size = 2
    end
    object StringField11: TStringField
      FieldName = 'CD_BANCO'
      Origin = 'DBBROKER.TCONCILIACAO.CD_BANCO'
      FixedChar = True
      Size = 3
    end
    object AutoIncField1: TAutoIncField
      FieldName = 'NR_SEQ'
      Origin = 'DBBROKER.TCONCILIACAO.NR_SEQ'
    end
    object StringField12: TStringField
      FieldName = 'NR_LANCAMENTO'
      Origin = 'DBBROKER.TCONCILIACAO.NR_LANCAMENTO'
      FixedChar = True
      Size = 4
    end
  end
  object ds_conc_lanc_: TDataSource
    DataSet = qry_conc_lanc_
    Left = 40
    Top = 370
  end
  object sp_concilia: TStoredProc
    DatabaseName = 'DBBROKER'
    StoredProcName = 'dbo.sp_conciliacao'
    Left = 240
    Top = 8
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
        Name = '@cd_banco'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = '@cd_usuario'
        ParamType = ptInput
      end
      item
        DataType = ftDateTime
        Name = '@dt_conciliacao'
        ParamType = ptInput
      end
      item
        DataType = ftDateTime
        Name = '@dt_arquivo'
        ParamType = ptInput
      end>
  end
  object updCaixaDocto: TUpdateSQL
    Left = 224
    Top = 264
  end
end
