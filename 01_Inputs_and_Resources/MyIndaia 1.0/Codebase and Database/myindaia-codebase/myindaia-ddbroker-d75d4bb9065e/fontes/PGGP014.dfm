object datm_lib_ctaapagar: Tdatm_lib_ctaapagar
  OldCreateOrder = True
  Left = 204
  Top = 156
  Height = 387
  Width = 765
  object ds_coligada: TDataSource
    DataSet = qry_unidade_
    Left = 54
    Top = 71
  end
  object qry_unidade_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT CD_UNID_NEG, NM_UNID_NEG'
      'FROM TUNID_NEG'
      'WHERE CD_UNID_NEG <> '#39#39)
    Left = 54
    Top = 14
    object qry_unidade_CD_UNID_NEG: TStringField
      FieldName = 'CD_UNID_NEG'
      Origin = 'TUNID_NEG.CD_UNID_NEG'
      Size = 2
    end
    object qry_unidade_NM_UNID_NEG: TStringField
      FieldName = 'NM_UNID_NEG'
      Origin = 'TUNID_NEG.NM_UNID_NEG'
      Size = 50
    end
  end
  object ds_ctaapagar: TDataSource
    DataSet = qry_ctaapagar_
    Left = 180
    Top = 71
  end
  object qry_ctaapagar_: TQuery
    CachedUpdates = True
    BeforeOpen = qry_ctaapagar_BeforeOpen
    AfterPost = qry_ctaapagar_AfterPost
    OnCalcFields = qry_ctaapagar_CalcFields
    DatabaseName = 'DBBROKER'
    RequestLive = True
    SQL.Strings = (
      
        'SELECT DT_CTAAPAGAR, NR_CTAAPAGAR, CD_UNID_NEG, CD_FAVORECIDO, C' +
        'D_BANCO, CD_FORNECEDOR,  TP_PAGAMENTO,'
      
        '       NR_TITULO, IN_OPERACIONAL,  CD_LIBERADOR, DT_VENCIMENTO, ' +
        'DT_PAGAMENTO, NM_HISTORICO, IN_LIBERADO,'
      
        '       IN_DISTRIBUICAO, IN_CONTABILIZADO, DT_LIBERACAO, VL_LIQUI' +
        'DO, STATUS'
      'FROM   TCTAAPAGAR'
      'WHERE  IN_CANCELADO = '#39'0'#39' AND IN_DISTRIBUICAO = '#39'1'#39' AND'
      '       NR_REF =:NR_REF AND  CD_UNID_NEG  = :CD_UNID_NEG AND'
      '       DT_VENCIMENTO BETWEEN :DT_INICIO AND :DT_FIM AND'
      '       DT_CTAAPAGAR =:DT_CTAAPAGAR'
      'ORDER BY'
      'IN_LIBERADO, DT_VENCIMENTO')
    Left = 180
    Top = 14
    ParamData = <
      item
        DataType = ftString
        Name = 'NR_REF'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'CD_UNID_NEG'
        ParamType = ptInput
      end
      item
        DataType = ftDateTime
        Name = 'DT_INICIO'
        ParamType = ptInput
      end
      item
        DataType = ftDateTime
        Name = 'DT_FIM'
        ParamType = ptInput
      end
      item
        DataType = ftDateTime
        Name = 'DT_CTAAPAGAR'
        ParamType = ptInput
      end>
    object qry_ctaapagar_CD_UNID_NEG: TStringField
      FieldName = 'CD_UNID_NEG'
      Origin = 'TCTAAPAGAR.CD_UNID_NEG'
      Size = 2
    end
    object qry_ctaapagar_CD_FAVORECIDO: TStringField
      FieldName = 'CD_FAVORECIDO'
      Origin = 'TCTAAPAGAR.CD_FAVORECIDO'
      Size = 5
    end
    object qry_ctaapagar_CD_BANCO: TStringField
      FieldName = 'CD_BANCO'
      Origin = 'TCTAAPAGAR.CD_BANCO'
      Size = 3
    end
    object qry_ctaapagar_CD_FORNECEDOR: TStringField
      FieldName = 'CD_FORNECEDOR'
      Origin = 'TCTAAPAGAR.CD_UNID_NEG'
      Size = 5
    end
    object qry_ctaapagar_DT_CTAAPAGAR: TDateTimeField
      FieldName = 'DT_CTAAPAGAR'
      Origin = 'TCTAAPAGAR.DT_CTAAPAGAR'
    end
    object qry_ctaapagar_NR_CTAAPAGAR: TStringField
      FieldName = 'NR_CTAAPAGAR'
      Origin = 'TCTAAPAGAR.NR_CTAAPAGAR'
      Size = 3
    end
    object qry_ctaapagar_DT_VENCIMENTO: TDateTimeField
      DisplayLabel = 'Vencimento'
      FieldName = 'DT_VENCIMENTO'
      Origin = 'TCTAAPAGAR.DT_VENCIMENTO'
    end
    object qry_ctaapagar_DT_PAGAMENTO: TDateTimeField
      DisplayLabel = 'Pagamento'
      FieldName = 'DT_PAGAMENTO'
      Origin = 'TCTAAPAGAR.DT_PAGAMENTO'
    end
    object qry_ctaapagar_NM_HISTORICO: TStringField
      DisplayLabel = 'Hist'#243'rico'
      FieldName = 'NM_HISTORICO'
      Origin = 'TCTAAPAGAR.NM_HISTORICO'
      Size = 180
    end
    object qry_ctaapagar_IN_LIBERADO: TStringField
      FieldName = 'IN_LIBERADO'
      Origin = 'TCTAAPAGAR.IN_LIBERADO'
      Size = 1
    end
    object qry_ctaapagar_IN_DISTRIBUICAO: TStringField
      FieldName = 'IN_DISTRIBUICAO'
      Origin = 'TCTAAPAGAR.IN_DISTRIBUICAO'
      Size = 1
    end
    object qry_ctaapagar_LookLiberado: TStringField
      DisplayLabel = 'Lib.?'
      FieldKind = fkLookup
      FieldName = 'LookLiberado'
      LookupDataSet = tbl_yesno_
      LookupKeyFields = 'CD_YESNO'
      LookupResultField = 'TX_YESNO'
      KeyFields = 'IN_LIBERADO'
      Size = 3
      Lookup = True
    end
    object qry_ctaapagar_Look_Favorecido: TStringField
      FieldKind = fkLookup
      FieldName = 'Look_Favorecido'
      LookupDataSet = qry_favorecido_
      LookupKeyFields = 'CD_FAVORECIDO'
      LookupResultField = 'NM_FAVORECIDO'
      KeyFields = 'CD_FAVORECIDO'
      Size = 40
      Lookup = True
    end
    object qry_ctaapagar_Look_Banco: TStringField
      FieldKind = fkLookup
      FieldName = 'Look_Banco'
      LookupDataSet = qry_banco_
      LookupKeyFields = 'CD_BANCO'
      LookupResultField = 'NM_BANCO'
      KeyFields = 'CD_BANCO'
      Size = 40
      Lookup = True
    end
    object qry_ctaapagar_Look_Fornecedor: TStringField
      DisplayLabel = 'Fornecedor'
      FieldKind = fkLookup
      FieldName = 'Look_Fornecedor'
      LookupDataSet = qry_favorecido_
      LookupKeyFields = 'CD_FAVORECIDO'
      LookupResultField = 'NM_FAVORECIDO'
      KeyFields = 'CD_FORNECEDOR'
      Size = 40
      Lookup = True
    end
    object qry_ctaapagar_NR_TITULO: TStringField
      FieldName = 'NR_TITULO'
      Origin = 'TCTAAPAGAR.CD_UNID_NEG'
      Size = 15
    end
    object qry_ctaapagar_IN_OPERACIONAL: TStringField
      FieldName = 'IN_OPERACIONAL'
      Origin = 'DBBROKER.TCTAAPAGAR.IN_OPERACIONAL'
      FixedChar = True
      Size = 1
    end
    object qry_ctaapagar_TP_PAGAMENTO: TStringField
      FieldName = 'TP_PAGAMENTO'
      Origin = 'DBBROKER.TCTAAPAGAR.TP_PAGAMENTO'
      FixedChar = True
      Size = 1
    end
    object qry_ctaapagar_IN_CONTABILIZADO: TStringField
      FieldName = 'IN_CONTABILIZADO'
      Origin = 'DBBROKER.TCTAAPAGAR.IN_CONTABILIZADO'
      FixedChar = True
      Size = 1
    end
    object qry_ctaapagar_CD_LIBERADOR: TStringField
      FieldName = 'CD_LIBERADOR'
      Origin = 'DBBROKER.TCTAAPAGAR.CD_LIBERADOR'
      FixedChar = True
      Size = 4
    end
    object qry_ctaapagar_DT_LIBERACAO: TDateTimeField
      FieldName = 'DT_LIBERACAO'
      Origin = 'DBBROKER.TCTAAPAGAR.DT_LIBERACAO'
    end
    object qry_ctaapagar_VL_LIQUIDO: TFloatField
      FieldName = 'VL_LIQUIDO'
      Origin = 'DBBROKER.TCTAAPAGAR.VL_LIQUIDO'
      DisplayFormat = '#,##0.00'
      EditFormat = '#,##0.00'
    end
    object qry_ctaapagar_STATUS: TStringField
      FieldName = 'STATUS'
      Origin = 'DBBROKER.TCTAAPAGAR.STATUS'
      FixedChar = True
      Size = 2
    end
  end
  object qry_liberacao_: TQuery
    CachedUpdates = True
    AfterPost = qry_liberacao_AfterPost
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT CD_UNID_NEG, DT_CTAAPAGAR, NR_CTAAPAGAR,'
      'IN_LIBERADO, CD_LIBERADOR, DT_LIBERACAO, DT_PAGAMENTO'
      'FROM TCTAAPAGAR'
      'WHERE '
      'CD_UNID_NEG = :CD_UNID_NEG AND'
      'DT_CTAAPAGAR = :DT_CTAAPAGAR AND'
      'NR_CTAAPAGAR = :NR_CTAAPAGAR'
      ' ')
    UpdateObject = UpdateSQL1
    Left = 449
    Top = 200
    ParamData = <
      item
        DataType = ftString
        Name = 'CD_UNID_NEG'
        ParamType = ptUnknown
      end
      item
        DataType = ftDateTime
        Name = 'DT_CTAAPAGAR'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'NR_CTAAPAGAR'
        ParamType = ptUnknown
      end>
    object qry_liberacao_DT_CTAAPAGAR: TDateTimeField
      FieldName = 'DT_CTAAPAGAR'
      Origin = 'TCTAAPAGAR.DT_CTAAPAGAR'
    end
    object qry_liberacao_NR_CTAAPAGAR: TStringField
      FieldName = 'NR_CTAAPAGAR'
      Origin = 'TCTAAPAGAR.NR_CTAAPAGAR'
      Size = 3
    end
    object qry_liberacao_IN_LIBERADO: TStringField
      FieldName = 'IN_LIBERADO'
      Origin = 'TCTAAPAGAR.IN_LIBERADO'
      Size = 1
    end
    object qry_liberacao_CD_LIBERADOR: TStringField
      FieldName = 'CD_LIBERADOR'
      Origin = 'TCTAAPAGAR.CD_LIBERADOR'
      Size = 4
    end
    object qry_liberacao_DT_LIBERACAO: TDateTimeField
      FieldName = 'DT_LIBERACAO'
      Origin = 'TCTAAPAGAR.DT_LIBERACAO'
    end
    object qry_liberacao_DT_PAGAMENTO: TDateTimeField
      DisplayLabel = 'Dt. Pagto'
      FieldName = 'DT_PAGAMENTO'
      Origin = 'TCTAAPAGAR.CD_COLIGADA'
    end
    object qry_liberacao_CD_UNID_NEG: TStringField
      FieldName = 'CD_UNID_NEG'
      Origin = 'TCTAAPAGAR.CD_UNID_NEG'
      Size = 2
    end
  end
  object tbl_yesno_: TTable
    DatabaseName = 'DBBROKER'
    TableName = 'TYES_NO'
    Left = 317
    Top = 14
  end
  object ds_yesno: TDataSource
    DataSet = tbl_yesno_
    Left = 317
    Top = 71
  end
  object sp_distribui_ctaapagar: TStoredProc
    DatabaseName = 'DBBROKER'
    StoredProcName = 'dbo.sp_distribui_ctaapagar'
    Left = 613
    Top = 260
    ParamData = <
      item
        DataType = ftInteger
        Name = 'Result'
        ParamType = ptResult
      end
      item
        DataType = ftDateTime
        Name = '@dt_movimento'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = '@cd_unid_neg'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = '@qt_imp'
        ParamType = ptOutput
      end>
  end
  object qry_favorecido_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT CD_FAVORECIDO, NM_FAVORECIDO'
      'FROM   TFAVORECIDO')
    Left = 449
    Top = 71
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
  end
  object qry_banco_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT CD_BANCO, NM_BANCO'
      'FROM   TBANCO')
    Left = 449
    Top = 139
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
  end
  object sp_distribui_ctaapagar_ag: TStoredProc
    DatabaseName = 'DBBROKER'
    StoredProcName = 'dbo.sp_distribui_ctaapagar_ag'
    Left = 613
    Top = 14
    ParamData = <
      item
        DataType = ftInteger
        Name = 'Result'
        ParamType = ptResult
      end
      item
        DataType = ftDateTime
        Name = '@dt_movimento'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = '@cd_unid_neg'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = '@nr_cta_pagar'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = '@tp_pagamento'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = '@cd_banco'
        ParamType = ptInput
      end>
  end
  object UpdateSQL1: TUpdateSQL
    ModifySQL.Strings = (
      'update TCTAAPAGAR'
      'set'
      '  CD_UNID_NEG = :CD_UNID_NEG,'
      '  DT_CTAAPAGAR = :DT_CTAAPAGAR,'
      '  NR_CTAAPAGAR = :NR_CTAAPAGAR,'
      '  IN_LIBERADO = :IN_LIBERADO,'
      '  CD_LIBERADOR = :CD_LIBERADOR,'
      '  DT_LIBERACAO = :DT_LIBERACAO,'
      '  DT_PAGAMENTO = :DT_PAGAMENTO'
      'where'
      '  DT_CTAAPAGAR = :OLD_DT_CTAAPAGAR and'
      '  NR_CTAAPAGAR = :OLD_NR_CTAAPAGAR')
    InsertSQL.Strings = (
      'insert into TCTAAPAGAR'
      
        '  (CD_UNID_NEG, DT_CTAAPAGAR, NR_CTAAPAGAR, IN_LIBERADO, CD_LIBE' +
        'RADOR, '
      '   DT_LIBERACAO, DT_PAGAMENTO)'
      'values'
      
        '  (:CD_UNID_NEG, :DT_CTAAPAGAR, :NR_CTAAPAGAR, :IN_LIBERADO, :CD' +
        '_LIBERADOR, '
      '   :DT_LIBERACAO, :DT_PAGAMENTO)')
    DeleteSQL.Strings = (
      'delete from TCTAAPAGAR'
      'where'
      '  DT_CTAAPAGAR = :OLD_DT_CTAAPAGAR and'
      '  NR_CTAAPAGAR = :OLD_NR_CTAAPAGAR')
    Left = 51
    Top = 260
  end
  object UpdateSQL2: TUpdateSQL
    ModifySQL.Strings = (
      'update TCTAAPAGAR'
      'set'
      '  DT_CTAAPAGAR = :DT_CTAAPAGAR,'
      '  NR_CTAAPAGAR = :NR_CTAAPAGAR,'
      '  CD_UNID_NEG = :CD_UNID_NEG,'
      '  CD_FAVORECIDO = :CD_FAVORECIDO,'
      '  CD_BANCO = :CD_BANCO,'
      '  CD_FORNECEDOR = :CD_FORNECEDOR,'
      '  TP_PAGAMENTO = :TP_PAGAMENTO,'
      '  VL_DESPESA = :VL_DESPESA,'
      '  VL_DESCONTO = :VL_DESCONTO,'
      '  VL_ACRESCIMO = :VL_ACRESCIMO,'
      '  VL_IR = :VL_IR,'
      '  VL_INSS = :VL_INSS,'
      '  NR_TITULO = :NR_TITULO,'
      '  IN_OPERACIONAL = :IN_OPERACIONAL,'
      '  CD_LIBERADOR = :CD_LIBERADOR,'
      '  DT_VENCIMENTO = :DT_VENCIMENTO,'
      '  DT_PAGAMENTO = :DT_PAGAMENTO,'
      '  NM_HISTORICO = :NM_HISTORICO,'
      '  IN_LIBERADO = :IN_LIBERADO,'
      '  IN_DISTRIBUICAO = :IN_DISTRIBUICAO,'
      '  IN_CONTABILIZADO = :IN_CONTABILIZADO,'
      '  DT_LIBERACAO = :DT_LIBERACAO'
      'where'
      '  DT_CTAAPAGAR = :OLD_DT_CTAAPAGAR and'
      '  NR_CTAAPAGAR = :OLD_NR_CTAAPAGAR and'
      '  CD_UNID_NEG = :OLD_CD_UNID_NEG')
    InsertSQL.Strings = (
      'insert into TCTAAPAGAR'
      
        '  (DT_CTAAPAGAR, NR_CTAAPAGAR, CD_UNID_NEG, CD_FAVORECIDO, CD_BA' +
        'NCO, CD_FORNECEDOR, '
      
        '   TP_PAGAMENTO, VL_DESPESA, VL_DESCONTO, VL_ACRESCIMO, VL_IR, V' +
        'L_INSS, '
      
        '   NR_TITULO, IN_OPERACIONAL, CD_LIBERADOR, DT_VENCIMENTO, DT_PA' +
        'GAMENTO, '
      
        '   NM_HISTORICO, IN_LIBERADO, IN_DISTRIBUICAO, IN_CONTABILIZADO,' +
        ' DT_LIBERACAO)'
      'values'
      
        '  (:DT_CTAAPAGAR, :NR_CTAAPAGAR, :CD_UNID_NEG, :CD_FAVORECIDO, :' +
        'CD_BANCO, '
      
        '   :CD_FORNECEDOR, :TP_PAGAMENTO, :VL_DESPESA, :VL_DESCONTO, :VL' +
        '_ACRESCIMO, '
      
        '   :VL_IR, :VL_INSS, :NR_TITULO, :IN_OPERACIONAL, :CD_LIBERADOR,' +
        ' :DT_VENCIMENTO, '
      
        '   :DT_PAGAMENTO, :NM_HISTORICO, :IN_LIBERADO, :IN_DISTRIBUICAO,' +
        ' :IN_CONTABILIZADO, '
      '   :DT_LIBERACAO)')
    DeleteSQL.Strings = (
      'delete from TCTAAPAGAR'
      'where'
      '  DT_CTAAPAGAR = :OLD_DT_CTAAPAGAR and'
      '  NR_CTAAPAGAR = :OLD_NR_CTAAPAGAR and'
      '  CD_UNID_NEG = :OLD_CD_UNID_NEG')
    Left = 178
    Top = 260
  end
  object sp_contabiliza_pagto_dinheiro_ctapagar: TStoredProc
    DatabaseName = 'DBBROKER'
    StoredProcName = 'dbo.sp_contabiliza_pagto_dinheiro_ctapagar'
    Left = 613
    Top = 71
    ParamData = <
      item
        DataType = ftInteger
        Name = 'Result'
        ParamType = ptResult
        Value = 0
      end
      item
        DataType = ftString
        Name = '@nr_cta_pagar'
        ParamType = ptInput
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
        DataType = ftDateTime
        Name = '@dt_movimento'
        ParamType = ptInput
      end
      item
        DataType = ftDateTime
        Name = '@dt_pagto'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = '@nr_docto'
        ParamType = ptInput
      end>
  end
  object sp_baixa_lanc_adm: TStoredProc
    DatabaseName = 'DBBROKER'
    StoredProcName = 'dbo.sp_contabiliza_pagto_dinheiro_ctapagar_ADM'
    Left = 613
    Top = 200
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
        Name = '@nr_cta_pagar'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = '@cd_banco'
        ParamType = ptInput
      end
      item
        DataType = ftDateTime
        Name = '@dt_movimento'
        ParamType = ptInput
      end
      item
        DataType = ftDateTime
        Name = '@dt_pagto'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = '@nr_docto'
        ParamType = ptInput
      end>
  end
  object qry_ContasAgrupadas: TQuery
    AfterScroll = qry_ContasAgrupadasAfterScroll
    OnCalcFields = qry_ContasAgrupadasCalcFields
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'select'
      '  A.NR_REF,'
      '  sum ( ( isnull(A.VL_LIQUIDO,0))) VL_LANCTO,'
      
        '  B.NM_FAVORECIDO, A.DT_MONTAGEM, A.DT_PAGAMENTO, A.TP_PAGAMENTO' +
        ', A.IN_LIBERADO, A.STATUS, A.DT_VENCIMENTO AS DT_VENC, A.DT_CTAA' +
        'PAGAR'
      'from'
      '  TCTAAPAGAR A, TFAVORECIDO B'
      'where'
      
        '  B.CD_FAVORECIDO = A.CD_FAVORECIDO AND ISNULL(A.NR_REF,'#39#39') <> '#39 +
        #39
      '  AND  A.CD_UNID_NEG  = :CD_UNID_NEG AND'
      '  A.DT_VENCIMENTO BETWEEN :DT_INICIO AND :DT_FIM'
      'group by'
      
        '  A.NR_REF, B.NM_FAVORECIDO, A.DT_MONTAGEM, A.DT_PAGAMENTO, A.TP' +
        '_PAGAMENTO, A.IN_LIBERADO, A.STATUS, A.DT_VENCIMENTO, A.DT_CTAAP' +
        'AGAR'
      'order by'
      '  A.IN_LIBERADO'
      '')
    Left = 54
    Top = 139
    ParamData = <
      item
        DataType = ftString
        Name = 'CD_UNID_NEG'
        ParamType = ptInput
      end
      item
        DataType = ftDateTime
        Name = 'DT_INICIO'
        ParamType = ptInput
      end
      item
        DataType = ftDateTime
        Name = 'DT_FIM'
        ParamType = ptInput
      end>
    object qry_ContasAgrupadasNR_REF: TStringField
      DisplayLabel = 'Lote'
      FieldName = 'NR_REF'
      FixedChar = True
      Size = 3
    end
    object qry_ContasAgrupadasVL_LANCTO: TFloatField
      DisplayLabel = 'Valor'
      FieldName = 'VL_LANCTO'
      DisplayFormat = '#,##0.00'
      EditFormat = '#,##0.00'
    end
    object qry_ContasAgrupadasNM_FAVORECIDO: TStringField
      DisplayLabel = 'Favorecido'
      FieldName = 'NM_FAVORECIDO'
      FixedChar = True
      Size = 50
    end
    object qry_ContasAgrupadasDT_MONTAGEM: TDateTimeField
      DisplayLabel = 'Dt. Montagem'
      FieldName = 'DT_MONTAGEM'
    end
    object qry_ContasAgrupadasDT_PAGAMENTO: TDateTimeField
      DisplayLabel = 'Dt. Pagto'
      FieldName = 'DT_PAGAMENTO'
    end
    object qry_ContasAgrupadasTP_PAGAMENTO: TStringField
      FieldName = 'TP_PAGAMENTO'
      FixedChar = True
      Size = 1
    end
    object qry_ContasAgrupadasIN_LIBERADO: TStringField
      FieldName = 'IN_LIBERADO'
      FixedChar = True
      Size = 1
    end
    object qry_ContasAgrupadascalcTpPagto: TStringField
      DisplayLabel = 'Tipo de Pagto'
      FieldKind = fkCalculated
      FieldName = 'calcTpPagto'
      Calculated = True
    end
    object qry_ContasAgrupadascalcLiberado: TStringField
      DisplayLabel = 'Lib.?'
      FieldKind = fkCalculated
      FieldName = 'calcLiberado'
      Size = 3
      Calculated = True
    end
    object qry_ContasAgrupadasSTATUS: TStringField
      FieldName = 'STATUS'
      FixedChar = True
      Size = 2
    end
    object qry_ContasAgrupadascalcStatus: TStringField
      DisplayLabel = 'Status'
      FieldKind = fkLookup
      FieldName = 'calcStatus'
      LookupDataSet = qry_status_solic_adm_
      LookupKeyFields = 'CODIGO'
      LookupResultField = 'DESCRICAO'
      KeyFields = 'STATUS'
      Size = 30
      Lookup = True
    end
    object qry_ContasAgrupadasDT_VENC: TDateTimeField
      FieldName = 'DT_VENC'
    end
    object qry_ContasAgrupadasDT_CTAAPAGAR: TDateTimeField
      FieldName = 'DT_CTAAPAGAR'
    end
  end
  object dts_ContasAgrupadas: TDataSource
    DataSet = qry_ContasAgrupadas
    Left = 54
    Top = 200
  end
  object SqlContasLancamento: TQuery
    DatabaseName = 'DBBROKER'
    DataSource = ds_ctaapagar
    SQL.Strings = (
      'select'
      
        '  A.DT_CTAAPAGAR, A.NR_CTAAPAGAR, A.CD_CT_CONTABIL, A.CD_FILIAL,' +
        ' A.CD_CT_CUSTO,'
      
        '  A.VL_LANCAMENTO, A.CD_UNID_NEG, A.CD_ACESSO, A.CD_AUX, A.CD_IT' +
        'EM, B.NM_CT_CONTABIL, A.NR_LANC_CAIXA, A.DT_MOVIMENTO_CAIXA'
      'from TCTAAPAGAR_LANC A, TCT_CONTABIL B'
      'where'
      
        '  A.DT_CTAAPAGAR =:DT_CTAAPAGAR and A.NR_CTAAPAGAR =:NR_CTAAPAGA' +
        'R and'
      
        '  A.CD_UNID_NEG = :CD_UNID_NEG and B.CD_CT_CONTABIL = A.CD_CT_CO' +
        'NTABIL and year(A.DT_CTAAPAGAR) = B.ANO_CONTA')
    Left = 180
    Top = 139
    ParamData = <
      item
        DataType = ftDateTime
        Name = 'DT_CTAAPAGAR'
        ParamType = ptUnknown
        Size = 8
      end
      item
        DataType = ftString
        Name = 'NR_CTAAPAGAR'
        ParamType = ptUnknown
        Size = 4
      end
      item
        DataType = ftString
        Name = 'CD_UNID_NEG'
        ParamType = ptUnknown
        Size = 3
      end>
    object SqlContasLancamentoDT_CTAAPAGAR: TDateTimeField
      FieldName = 'DT_CTAAPAGAR'
      Origin = 'DBBROKER.TCTAAPAGAR_LANC.DT_CTAAPAGAR'
      Visible = False
    end
    object SqlContasLancamentoNR_CTAAPAGAR: TStringField
      FieldName = 'NR_CTAAPAGAR'
      Origin = 'DBBROKER.TCTAAPAGAR_LANC.NR_CTAAPAGAR'
      Visible = False
      FixedChar = True
      Size = 3
    end
    object SqlContasLancamentoCD_CT_CONTABIL: TStringField
      DisplayLabel = 'C'#243'digo'
      FieldName = 'CD_CT_CONTABIL'
      Origin = 'DBBROKER.TCTAAPAGAR_LANC.CD_CT_CONTABIL'
      FixedChar = True
      Size = 40
    end
    object SqlContasLancamentoCD_FILIAL: TStringField
      FieldName = 'CD_FILIAL'
      Origin = 'DBBROKER.TCTAAPAGAR_LANC.CD_FILIAL'
      Visible = False
      FixedChar = True
      Size = 2
    end
    object SqlContasLancamentoNM_CT_CONTABIL: TStringField
      DisplayLabel = 'Conta Contabil'
      FieldName = 'NM_CT_CONTABIL'
      Origin = 'DBBROKER.TCT_CONTABIL.NM_CT_CONTABIL'
      FixedChar = True
      Size = 40
    end
    object SqlContasLancamentoCD_CT_CUSTO: TStringField
      FieldName = 'CD_CT_CUSTO'
      Origin = 'DBBROKER.TCTAAPAGAR_LANC.CD_CT_CUSTO'
      Visible = False
      FixedChar = True
      Size = 25
    end
    object SqlContasLancamentoVL_LANCAMENTO: TFloatField
      DisplayLabel = 'Valor'
      FieldName = 'VL_LANCAMENTO'
      Origin = 'DBBROKER.TCTAAPAGAR_LANC.VL_LANCAMENTO'
      DisplayFormat = '#,##0.00'
      EditFormat = '#,##0.00'
    end
    object SqlContasLancamentoCD_UNID_NEG: TStringField
      FieldName = 'CD_UNID_NEG'
      Origin = 'DBBROKER.TCTAAPAGAR_LANC.CD_UNID_NEG'
      Visible = False
      FixedChar = True
      Size = 2
    end
    object SqlContasLancamentoCD_ACESSO: TStringField
      FieldName = 'CD_ACESSO'
      Origin = 'DBBROKER.TCTAAPAGAR_LANC.CD_ACESSO'
      Visible = False
      FixedChar = True
      Size = 1
    end
    object SqlContasLancamentoCD_AUX: TStringField
      FieldName = 'CD_AUX'
      Origin = 'DBBROKER.TCTAAPAGAR_LANC.CD_AUX'
      Visible = False
      FixedChar = True
      Size = 3
    end
    object SqlContasLancamentoCD_ITEM: TStringField
      FieldName = 'CD_ITEM'
      Origin = 'DBBROKER.TCTAAPAGAR_LANC.CD_ITEM'
      Visible = False
      FixedChar = True
      Size = 3
    end
    object SqlContasLancamentoNR_LANC_CAIXA: TStringField
      FieldName = 'NR_LANC_CAIXA'
      Origin = 'DBBROKER.TCTAAPAGAR_LANC.NR_LANC_CAIXA'
      FixedChar = True
      Size = 6
    end
    object SqlContasLancamentoDT_MOVIMENTO_CAIXA: TDateTimeField
      FieldName = 'DT_MOVIMENTO_CAIXA'
      Origin = 'DBBROKER.TCTAAPAGAR_LANC.DT_MOVIMENTO_CAIXA'
    end
  end
  object DtsContasLancamento: TDataSource
    DataSet = SqlContasLancamento
    Left = 180
    Top = 200
  end
  object qry_status_solic_adm_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT *'
      'FROM TSTATUS_SOLIC_PAGTO')
    Left = 311
    Top = 139
    object qry_status_solic_adm_CODIGO: TStringField
      FieldName = 'CODIGO'
      Origin = 'TSTATUS_SOLIC_PAGTO.CODIGO'
      Size = 2
    end
    object qry_status_solic_adm_DESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Origin = 'TSTATUS_SOLIC_PAGTO.DESCRICAO'
      Size = 30
    end
  end
  object ds_status_solic_adm: TDataSource
    DataSet = qry_status_solic_adm_
    Left = 311
    Top = 200
  end
  object qry_ins_caixa: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'INSERT TCAIXA'
      
        '  ( CD_COLIGADA, DT_MOVIMENTO, NR_LANCAMENTO, CD_UNID_NEG, TP_LA' +
        'NCAMENTO, TP_PROCEDENCIA, IN_CANCELADO, IN_TRANSFERIDO,'
      
        '    CD_HISTORICO, NM_HISTORICO, VL_LANCAMENTO, TP_PAGAMENTO, TP_' +
        'NATUREZA, CD_FAVORECIDO, CD_CT_CONTABIL, CD_CT_CONTABIL_CTAAPAGA' +
        'R,'
      '    IN_RESTITUI, CD_BANCO, NR_CTAAPAGAR, CODIGO_CTAAPAGAR_LANC )'
      '('
      
        'select CD_COLIGADA, :DT_CANCELAMENTO, RIGHT( '#39'000000'#39' + CONVERT(' +
        ' VARCHAR, ( ISNULL( :NR_LANC_NOVO, 0) + 1 ) ), 6),'
      
        '    CD_UNID_NEG, TP_LANCAMENTO, TP_PROCEDENCIA, IN_CANCELADO, IN' +
        '_TRANSFERIDO,'
      
        '    CD_HISTORICO, '#39'Estorno C'#39', VL_LANCAMENTO, TP_PAGAMENTO, '#39'C'#39',' +
        ' CD_FAVORECIDO, CD_CT_CONTABIL, CD_CT_CONTABIL_CTAAPAGAR,'
      '    IN_RESTITUI, CD_BANCO, NR_CTAAPAGAR, CODIGO_CTAAPAGAR_LANC'
      
        'from tcaixa where CD_COLIGADA =:CD_COLIGADA and DT_MOVIMENTO =:D' +
        'T_MOVIMENTO and NR_LANCAMENTO =:NR_LANCAMENTO)')
    Left = 449
    Top = 260
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'DT_CANCELAMENTO'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'NR_LANC_NOVO'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'CD_COLIGADA'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'DT_MOVIMENTO'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'NR_LANCAMENTO'
        ParamType = ptInput
      end>
    object StringField1: TStringField
      FieldName = 'NR_LANCAMENTO'
      Size = 3
    end
  end
  object qry_ult_lancto_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      
        '  SELECT CONVERT( INT, MAX( ISNULL( NR_LANCAMENTO, '#39'000000'#39' ) ) ' +
        ') as NR_LANCAMENTO'
      '  FROM   TCAIXA (TABLOCK HOLDLOCK)'
      '  WHERE  DT_MOVIMENTO =:DT_MOVIMENTO')
    Left = 449
    Top = 14
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'DT_MOVIMENTO'
        ParamType = ptUnknown
      end>
    object qry_ult_lancto_NR_LANCAMENTO: TIntegerField
      FieldName = 'NR_LANCAMENTO'
    end
  end
  object sp_distribui_adm: TStoredProc
    DatabaseName = 'DBBROKER'
    StoredProcName = 'dbo.sp_distribui_adm'
    Left = 613
    Top = 139
    ParamData = <
      item
        DataType = ftInteger
        Name = 'Result'
        ParamType = ptResult
        Value = 0
      end
      item
        DataType = ftString
        Name = '@cd_unid_neg'
        ParamType = ptInput
      end
      item
        DataType = ftDateTime
        Name = '@dt_pagto'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = '@nr_ref'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = '@tp_natureza'
        ParamType = ptInput
      end>
    object StringField17: TStringField
      FieldName = 'NR_ADICAO'
      Size = 3
    end
    object StringField18: TStringField
      FieldName = 'NR_ITEM'
      Size = 3
    end
  end
end
