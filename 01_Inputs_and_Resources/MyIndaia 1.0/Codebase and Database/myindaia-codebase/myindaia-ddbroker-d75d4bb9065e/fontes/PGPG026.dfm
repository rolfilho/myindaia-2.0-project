object datm_pagto_gera_ted: Tdatm_pagto_gera_ted
  OldCreateOrder = True
  Left = 105
  Top = 167
  Height = 431
  Width = 854
  object ds_item: TDataSource
    DataSet = qry_item_
    Left = 220
    Top = 62
  end
  object qry_item_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      
        'SELECT I.CD_ITEM, I.NM_ITEM, I.CD_TIPO_ITEM, T.IN_SOLIC_CHQ, I.I' +
        'N_ITEM_DI'
      'FROM TITEM I,'
      '            TTIPO_ITEM T'
      'WHERE I.CD_TIPO_ITEM = T.CD_TIPO_ITEM AND'
      '              I.IN_ATIVO = '#39'1'#39)
    Left = 220
    Top = 13
    object qry_item_CD_ITEM: TStringField
      FieldName = 'CD_ITEM'
      Origin = 'TITEM.CD_ITEM'
      Size = 3
    end
    object qry_item_NM_ITEM: TStringField
      FieldName = 'NM_ITEM'
      Origin = 'TITEM.NM_ITEM'
      Size = 30
    end
    object qry_item_CD_TIPO_ITEM: TStringField
      FieldName = 'CD_TIPO_ITEM'
      Size = 1
    end
    object qry_item_IN_SOLIC_CHQ: TStringField
      FieldName = 'IN_SOLIC_CHQ'
      Origin = 'TITEM.CD_ITEM'
      Size = 1
    end
    object qry_item_IN_ITEM_DI: TStringField
      FieldName = 'IN_ITEM_DI'
      Origin = 'TITEM.CD_ITEM'
      Size = 1
    end
  end
  object sp_proc_itens_solic_pagto: TStoredProc
    DatabaseName = 'DBBROKER'
    StoredProcName = 'dbo.sp_proc_itens_solic_pagto'
    Left = 518
    Top = 232
    ParamData = <
      item
        DataType = ftInteger
        Name = 'Result'
        ParamType = ptResult
        Value = 1
      end
      item
        DataType = ftString
        Name = '@nr_processo'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = '@nr_lancamento'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = '@cd_item'
        ParamType = ptInput
      end>
    object StringField13: TStringField
      FieldName = 'NR_ADICAO'
      Size = 3
    end
    object StringField14: TStringField
      FieldName = 'NR_ITEM'
      Size = 3
    end
  end
  object ds_empresa_nac: TDataSource
    DataSet = qry_emp_nac_
    Left = 220
    Top = 286
  end
  object qry_emp_nac_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT CD_EMPRESA, NM_EMPRESA'
      'FROM TEMPRESA_NAC')
    Left = 220
    Top = 232
    object qry_emp_nac_CD_EMPRESA: TStringField
      FieldName = 'CD_EMPRESA'
      Origin = 'TEMPRESA_NAC.CD_EMPRESA'
      Size = 5
    end
    object qry_emp_nac_NM_EMPRESA: TStringField
      FieldName = 'NM_EMPRESA'
      Origin = 'TEMPRESA_NAC.NM_EMPRESA'
      Size = 50
    end
  end
  object ds_unid_neg: TDataSource
    DataSet = qry_unid_neg_
    Left = 308
    Top = 286
  end
  object qry_unid_neg_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT CD_UNID_NEG, NM_UNID_NEG,  CGC_UNID_NEG'
      'FROM   TUNID_NEG'
      'WHERE  ( CD_UNID_NEG <> '#39#39' ) AND'
      '                (  CD_UNID_NEG IN'
      '                ( SELECT CD_UNID_NEG'
      '                  FROM   TUSUARIO_HABILITACAO'
      
        '                  WHERE  CD_USUARIO = :CD_USUARIO AND IN_ATIVO =' +
        ' '#39'1'#39' ) )'
      'ORDER BY'
      'NM_UNID_NEG')
    Left = 308
    Top = 232
    ParamData = <
      item
        DataType = ftString
        Name = 'CD_USUARIO'
        ParamType = ptUnknown
      end>
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
    object qry_unid_neg_CGC_UNID_NEG: TStringField
      FieldName = 'CGC_UNID_NEG'
      Size = 14
    end
  end
  object ds_produto: TDataSource
    DataSet = qry_produto_
    Left = 407
    Top = 286
  end
  object qry_produto_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT CD_PRODUTO, NM_PRODUTO'
      'FROM TPRODUTO'
      'WHERE CD_PRODUTO <> '#39#39)
    Left = 407
    Top = 232
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
  object ds_servico: TDataSource
    DataSet = qry_servico_
    Left = 220
    Top = 176
  end
  object qry_servico_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT CD_SERVICO, NM_SERVICO'
      'FROM TSERVICO')
    Left = 220
    Top = 120
    object qry_servico_CD_SERVICO: TStringField
      FieldName = 'CD_SERVICO'
      Origin = 'TSERVICO.CD_SERVICO'
      Size = 3
    end
    object qry_servico_NM_SERVICO: TStringField
      FieldName = 'NM_SERVICO'
      Origin = 'TSERVICO.NM_SERVICO'
      Size = 50
    end
  end
  object ds_processo: TDataSource
    DataSet = qry_processo_
    Left = 31
    Top = 176
  end
  object qry_processo_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT NR_PROCESSO, CD_UNID_NEG, CD_PRODUTO, CD_SERVICO,'
      'CD_CLIENTE'
      'FROM TPROCESSO'
      'WHERE  NR_PROCESSO = :NR_PROCESSO AND'
      '                IN_CANCELADO = '#39'0'#39' AND'
      '                IN_LIBERADO = '#39'1'#39' AND'
      '                IN_PRODUCAO ='#39'1'#39)
    Left = 31
    Top = 120
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
    object qry_processo_CD_UNID_NEG: TStringField
      FieldName = 'CD_UNID_NEG'
      Origin = 'TPROCESSO.CD_UNID_NEG'
      Size = 2
    end
    object qry_processo_CD_PRODUTO: TStringField
      FieldName = 'CD_PRODUTO'
      Origin = 'TPROCESSO.CD_PRODUTO'
      Size = 2
    end
    object qry_processo_CD_CLIENTE: TStringField
      FieldName = 'CD_CLIENTE'
      Origin = 'TPROCESSO.CD_CLIENTE'
      Size = 5
    end
    object qry_processo_CD_SERVICO: TStringField
      FieldName = 'CD_SERVICO'
      Origin = 'TPROCESSO.NR_PROCESSO'
      Size = 3
    end
    object qry_processo_LookUnidNeg: TStringField
      FieldKind = fkLookup
      FieldName = 'LookUnidNeg'
      LookupDataSet = qry_unid_neg_
      LookupKeyFields = 'CD_UNID_NEG'
      LookupResultField = 'NM_UNID_NEG'
      KeyFields = 'CD_UNID_NEG'
      Size = 50
      Lookup = True
    end
    object qry_processo_LookProduto: TStringField
      FieldKind = fkLookup
      FieldName = 'LookProduto'
      LookupDataSet = qry_produto_
      LookupKeyFields = 'CD_PRODUTO'
      LookupResultField = 'NM_PRODUTO'
      KeyFields = 'CD_PRODUTO'
      Size = 40
      Lookup = True
    end
    object qry_processo_LookCliente: TStringField
      FieldKind = fkLookup
      FieldName = 'LookCliente'
      LookupDataSet = qry_emp_nac_
      LookupKeyFields = 'CD_EMPRESA'
      LookupResultField = 'NM_EMPRESA'
      KeyFields = 'CD_CLIENTE'
      Size = 50
      Lookup = True
    end
    object qry_processo_LookServico: TStringField
      FieldKind = fkLookup
      FieldName = 'LookServico'
      LookupDataSet = qry_servico_
      LookupKeyFields = 'CD_SERVICO'
      LookupResultField = 'NM_SERVICO'
      KeyFields = 'CD_SERVICO'
      Size = 50
      Lookup = True
    end
  end
  object qry_proc_co_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT NR_PROCESSO, CD_UNID_NEG, CD_PRODUTO, CD_SERVICO,'
      'CD_CLIENTE'
      'FROM TPROCESSO'
      'WHERE  NR_PROCESSO = :NR_PROCESSO AND'
      '                IN_LIBERADO = '#39'1'#39)
    Left = 407
    Top = 120
    ParamData = <
      item
        DataType = ftString
        Name = 'NR_PROCESSO'
        ParamType = ptUnknown
      end>
    object qry_proc_co_NR_PROCESSO: TStringField
      FieldName = 'NR_PROCESSO'
      Origin = 'TPROCESSO.NR_PROCESSO'
      Size = 18
    end
    object qry_proc_co_CD_UNID_NEG: TStringField
      FieldName = 'CD_UNID_NEG'
      Origin = 'TPROCESSO.CD_UNID_NEG'
      Size = 2
    end
    object qry_proc_co_CD_PRODUTO: TStringField
      FieldName = 'CD_PRODUTO'
      Origin = 'TPROCESSO.CD_PRODUTO'
      Size = 2
    end
    object qry_proc_co_CD_SERVICO: TStringField
      FieldName = 'CD_SERVICO'
      Origin = 'TPROCESSO.CD_SERVICO'
      Size = 3
    end
    object qry_proc_co_CD_CLIENTE: TStringField
      FieldName = 'CD_CLIENTE'
      Origin = 'TPROCESSO.CD_CLIENTE'
      Size = 5
    end
    object qry_proc_co_LookUnidade: TStringField
      FieldKind = fkLookup
      FieldName = 'LookUnidade'
      LookupDataSet = qry_unid_neg_
      LookupKeyFields = 'CD_UNID_NEG'
      LookupResultField = 'NM_UNID_NEG'
      KeyFields = 'CD_UNID_NEG'
      Size = 50
      Lookup = True
    end
    object qry_proc_co_LookProduto: TStringField
      FieldKind = fkLookup
      FieldName = 'LookProduto'
      LookupDataSet = qry_produto_
      LookupKeyFields = 'CD_PRODUTO'
      LookupResultField = 'NM_PRODUTO'
      KeyFields = 'CD_PRODUTO'
      Size = 50
      Lookup = True
    end
    object qry_proc_co_LookCliente: TStringField
      FieldKind = fkLookup
      FieldName = 'LookCliente'
      LookupDataSet = qry_emp_nac_
      LookupKeyFields = 'CD_EMPRESA'
      LookupResultField = 'NM_EMPRESA'
      KeyFields = 'CD_CLIENTE'
      Size = 50
      Lookup = True
    end
    object qry_proc_co_LookServico: TStringField
      FieldKind = fkLookup
      FieldName = 'LookServico'
      LookupDataSet = qry_produto_
      LookupKeyFields = 'CD_PRODUTO'
      LookupResultField = 'NM_PRODUTO'
      KeyFields = 'CD_PRODUTO'
      Size = 50
      Lookup = True
    end
  end
  object qry_param_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT HM_PARA_SOLIC_CH'
      'FROM TPARAMETROS')
    Left = 407
    Top = 176
    object qry_param_HM_PARA_SOLIC_CH: TStringField
      FieldName = 'HM_PARA_SOLIC_CH'
      Origin = 'TPARAMETROS.HM_PARA_SOLIC_CH'
      Size = 5
    end
  end
  object tbl_yesno_: TTable
    DatabaseName = 'DBBROKER'
    IndexFieldNames = 'CD_YESNO'
    TableName = 'TYES_NO'
    Left = 308
    Top = 120
    object tbl_yesno_CD_YESNO: TStringField
      FieldName = 'CD_YESNO'
      Size = 1
    end
    object tbl_yesno_TX_YESNO: TStringField
      FieldName = 'TX_YESNO'
      Size = 3
    end
    object tbl_yesno_IN_YESNO: TBooleanField
      FieldName = 'IN_YESNO'
      Required = True
    end
  end
  object ds_yesno: TDataSource
    DataSet = tbl_yesno_
    Left = 308
    Top = 176
  end
  object qry_lib_pagto_item_: TQuery
    OnCalcFields = qry_lib_pagto_item_CalcFields
    DatabaseName = 'DBBROKER'
    DataSource = ds_lib_pagto
    SQL.Strings = (
      'SELECT S.NR_REF, S.CD_ITEM, S.CD_STATUS,'
      
        '       ( ISNULL( VL_PAGTO, 0 ) - ISNULL( VL_DESCONTO, 0 ) ) AS V' +
        'L_PAGTO,'
      
        '       S.NR_PROCESSO, S.NR_LANCAMENTO, U.DESCRICAO NM_STATUS, I.' +
        'NM_ITEM'
      'FROM   TSOLIC_PAGTO S,'
      '       TSTATUS_SOLIC_PAGTO U,'
      '       TITEM I,'
      '       TPROCESSO P'
      'WHERE  S.CD_ITEM *= I.CD_ITEM AND'
      '       S.CD_STATUS = U.CODIGO AND'
      '       S.NR_PROCESSO = P.NR_PROCESSO AND'
      '       P.CD_UNID_NEG = :CD_UNID_NEG AND'
      '       S.IN_TED = '#39'1'#39' AND'
      '       S.NR_REF = :NR_REF AND'
      '       S.DT_PAGTO = :DT_PAGTO AND'
      '       ( ( S.CD_BANCO = :CD_BANCO ) or ( :CD_BANCO = '#39#39' ) ) AND'
      '       ( ( S.NR_REF <> '#39#39' ) AND ( S.NR_REF IS NOT NULL ) ) AND'
      '       ( ( SELECT VL_PAGTO'
      '           FROM   TSOLIC_PAGTO P'
      '           WHERE  P.NR_PROCESSO = S.NR_PROCESSO AND'
      '                  P.NR_LANCAMENTO = S.NR_LANCAMENTO AND'
      '                  S.CD_ITEM = P.CD_ITEM AND'
      
        '                  P.CD_STATUS IN ( '#39'7'#39', '#39'8'#39', '#39'9'#39', '#39'10'#39', '#39'11'#39', '#39'1' +
        '2'#39', '#39'13'#39', '#39'14'#39', '#39'15'#39', '#39'16'#39', '#39'18'#39' )'
      '       ) > 0 ) AND'
      
        '       ( SELECT ( ISNULL( VL_PAGTO, 0 ) - ISNULL( VL_DESCONTO, 0' +
        ' ) ) AS VL_PAGTO'
      '         FROM   TSOLIC_PAGTO P'
      '         WHERE  P.NR_PROCESSO = S.NR_PROCESSO AND'
      '                P.NR_LANCAMENTO = S.NR_LANCAMENTO AND'
      '                S.CD_ITEM = P.CD_ITEM AND'
      
        '                P.CD_STATUS IN ( '#39'7'#39', '#39'8'#39', '#39'9'#39', '#39'10'#39', '#39'11'#39', '#39'12'#39 +
        ', '#39'13'#39', '#39'14'#39', '#39'15'#39', '#39'16'#39', '#39'18'#39' )'
      '       ) IS NOT NULL')
    Left = 127
    Top = 13
    ParamData = <
      item
        DataType = ftString
        Name = 'CD_UNID_NEG'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'NR_REF'
        ParamType = ptUnknown
      end
      item
        DataType = ftDateTime
        Name = 'DT_PAGTO'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'CD_BANCO'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'CD_BANCO'
        ParamType = ptUnknown
      end>
    object qry_lib_pagto_item_NR_PROCESSO: TStringField
      DisplayLabel = 'Processo'
      FieldName = 'NR_PROCESSO'
      Size = 18
    end
    object qry_lib_pagto_item_NR_LANCAMENTO: TStringField
      DisplayLabel = 'N'#186' Lanc.'
      FieldName = 'NR_LANCAMENTO'
      Size = 3
    end
    object qry_lib_pagto_item_CD_ITEM: TStringField
      DisplayLabel = 'C'#243'd. Item'
      FieldName = 'CD_ITEM'
      Size = 3
    end
    object qry_lib_pagto_item_NR_REF: TStringField
      DisplayLabel = 'Lote'
      FieldName = 'NR_REF'
      Size = 3
    end
    object qry_lib_pagto_item_VL_PAGTO: TFloatField
      DisplayLabel = 'Valor'
      FieldName = 'VL_PAGTO'
      DisplayFormat = '#0,.00'
      EditFormat = '#0.00'
    end
    object qry_lib_pagto_item_NM_STATUS: TStringField
      DisplayLabel = 'Status'
      FieldName = 'NM_STATUS'
      Size = 30
    end
    object qry_lib_pagto_item_NM_ITEM: TStringField
      DisplayLabel = 'Item'
      FieldName = 'NM_ITEM'
      Size = 30
    end
    object qry_lib_pagto_item_CD_STATUS: TStringField
      FieldName = 'CD_STATUS'
      Size = 2
    end
    object qry_lib_pagto_item_CalcNrProcesso: TStringField
      DisplayLabel = 'N'#186' Processo'
      DisplayWidth = 14
      FieldKind = fkCalculated
      FieldName = 'CalcNrProcesso'
      Size = 14
      Calculated = True
    end
  end
  object ds_lib_pagto_item: TDataSource
    DataSet = qry_lib_pagto_item_
    Left = 127
    Top = 62
  end
  object ds_destino: TDataSource
    DataSet = qry_destino_
    Left = 308
    Top = 62
  end
  object qry_destino_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT D.CD_DESTINO, D.NM_DESTINO, D.CD_FAVORECIDO, F.CD_BANCO'
      'FROM TDESTINO D, TFAVORECIDO F'
      'WHERE D.CD_FAVORECIDO *= F.CD_FAVORECIDO ')
    Left = 308
    Top = 13
    object qry_destino_CD_DESTINO: TStringField
      FieldName = 'CD_DESTINO'
      Origin = 'TDESTINO.CD_DESTINO'
      Size = 4
    end
    object qry_destino_NM_DESTINO: TStringField
      FieldName = 'NM_DESTINO'
      Origin = 'TDESTINO.NM_DESTINO'
      Size = 50
    end
    object qry_destino_CD_FAVORECIDO: TStringField
      FieldName = 'CD_FAVORECIDO'
      Size = 5
    end
    object qry_destino_CD_BANCO: TStringField
      FieldName = 'CD_BANCO'
      Size = 3
    end
  end
  object ds_calculo: TDataSource
    DataSet = qry_calculo_
    Left = 31
    Top = 286
  end
  object qry_calculo_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT *'
      'FROM TCALCULO')
    Left = 31
    Top = 232
    object qry_calculo_CD_CALCULO: TStringField
      FieldName = 'CD_CALCULO'
      Origin = 'TCALCULO.CD_CALCULO'
      Size = 3
    end
    object qry_calculo_NM_CALCULO: TStringField
      FieldName = 'NM_CALCULO'
      Origin = 'TCALCULO.NM_CALCULO'
      Size = 40
    end
    object qry_calculo_NM_STORED_PROCEDURE: TStringField
      FieldName = 'NM_STORED_PROCEDURE'
      Origin = 'TCALCULO.NM_STORED_PROCEDURE'
      Size = 30
    end
    object qry_calculo_CD_TABELA: TStringField
      FieldName = 'CD_TABELA'
      Origin = 'TCALCULO.CD_TABELA'
      Size = 1
    end
  end
  object sp_atz_solic_pagto: TStoredProc
    DatabaseName = 'DBBROKER'
    StoredProcName = 'dbo.sp_atz_solic_pagto'
    Left = 518
    Top = 286
    ParamData = <
      item
        DataType = ftInteger
        Name = 'Result'
        ParamType = ptResult
        Value = 0
      end
      item
        DataType = ftString
        Name = '@nr_processo'
        ParamType = ptInput
      end>
    object StringField1: TStringField
      FieldName = 'NR_ADICAO'
      Size = 3
    end
    object StringField2: TStringField
      FieldName = 'NR_ITEM'
      Size = 3
    end
  end
  object qry_status_solic_pagto_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT *'
      'FROM TSTATUS_SOLIC_PAGTO')
    Left = 407
    Top = 13
    object qry_status_solic_pagto_CODIGO: TStringField
      FieldName = 'CODIGO'
      Origin = 'TSTATUS_SOLIC_PAGTO.CODIGO'
      Size = 2
    end
    object qry_status_solic_pagto_DESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Origin = 'TSTATUS_SOLIC_PAGTO.DESCRICAO'
      Size = 30
    end
  end
  object ds_status_solic_pagto: TDataSource
    DataSet = qry_status_solic_pagto_
    Left = 407
    Top = 62
  end
  object qry_di_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT NR_PROCESSO, DT_CALCULO'
      'FROM TDECLARACAO_IMPORTACAO'
      'WHERE NR_PROCESSO = :NR_PROCESSO')
    Left = 766
    Top = 232
    ParamData = <
      item
        DataType = ftString
        Name = 'NR_PROCESSO'
        ParamType = ptUnknown
      end>
    object qry_di_NR_PROCESSO: TStringField
      FieldName = 'NR_PROCESSO'
      Origin = 'TDECLARACAO_IMPORTACAO.NR_PROCESSO'
      Size = 18
    end
    object qry_di_DT_CALCULO: TDateTimeField
      FieldName = 'DT_CALCULO'
      Origin = 'TDECLARACAO_IMPORTACAO.DT_CALCULO'
    end
  end
  object sp_di_calculo_: TStoredProc
    DatabaseName = 'DBBROKER'
    StoredProcName = 'dbo.sp_di_calculo'
    Left = 518
    Top = 176
    object StringField3: TStringField
      FieldName = 'NR_ADICAO'
      Size = 3
    end
    object StringField4: TStringField
      FieldName = 'NR_ITEM'
      Size = 3
    end
  end
  object qry_lib_pagto_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT P.CD_UNID_NEG, S.NR_REF, S.DT_PAGTO,'
      '       ISNULL( ('
      
        '       SELECT SUM( ROUND( ISNULL( VL_PAGTO, 0 ) - ISNULL( VL_DES' +
        'CONTO, 0 ), 2 ) ) AS VL_PAGTO'
      '       FROM   TSOLIC_PAGTO P'
      '       WHERE  S.DT_PAGTO = P.DT_PAGTO AND'
      '              S.NR_REF = P.NR_REF AND'
      '              S.CD_FAVORECIDO = P.CD_FAVORECIDO AND'
      '              P.IN_TED = '#39'1'#39' AND'
      
        '              ( ( S.NR_REF <> '#39#39' ) AND ( S.NR_REF IS NOT NULL ) ' +
        ') AND'
      
        '                  P.CD_STATUS IN ( '#39'7'#39', '#39'8'#39', '#39'9'#39', '#39'10'#39', '#39'11'#39', '#39'1' +
        '6'#39', '#39'18'#39' ) ), 0 ) VL_PAGTO,'
      '       S.CD_BANCO, B.NM_BANCO,'
      
        '       S.CD_FAVORECIDO, F.NM_FAVORECIDO, S.NR_DOCTO, S.CD_STATUS' +
        '_CHEQUE'
      'FROM   TSOLIC_PAGTO S,'
      '       TBANCO B,'
      '       TFAVORECIDO F,'
      '       TPROCESSO P'
      'WHERE  S.CD_BANCO *= B.CD_BANCO AND'
      '       S.CD_FAVORECIDO *= F.CD_FAVORECIDO AND'
      '       S.NR_PROCESSO = P.NR_PROCESSO AND'
      '       P.CD_UNID_NEG = :CD_UNID_NEG AND'
      '       S.IN_TED = '#39'1'#39' AND'
      '       S.TP_DESTINO <> '#39'4'#39' AND'
      '       S.DT_PAGTO = :DT_PAGTO AND'
      
        '       S.CD_STATUS IN ( '#39'7'#39', '#39'8'#39', '#39'9'#39', '#39'10'#39', '#39'11'#39', '#39'16'#39', '#39'18'#39' ) ' +
        'AND'
      '       ( ( S.CD_BANCO = :CD_BANCO ) or ( :CD_BANCO = '#39#39' ) ) AND'
      '       ( ( S.NR_REF <> '#39#39' ) AND ( S.NR_REF IS NOT NULL ) ) AND'
      '       ISNULL('
      
        '       ( SELECT SUM( ISNULL( VL_PAGTO, 0 ) - ISNULL( VL_DESCONTO' +
        ', 0 ) ) AS VL_PAGTO'
      '         FROM   TSOLIC_PAGTO P'
      '         WHERE  S.DT_PAGTO = P.DT_PAGTO AND'
      '                S.NR_REF = P.NR_REF AND'
      
        '                ( ( S.NR_REF <> '#39#39' ) AND ( S.NR_REF IS NOT NULL ' +
        ') ) AND'
      
        '                P.CD_STATUS IN ( '#39'7'#39', '#39'8'#39', '#39'9'#39', '#39'10'#39', '#39'11'#39', '#39'16'#39 +
        ', '#39'18'#39' ) ), 0 ) > 0 AND'
      '       NOT EXISTS('
      '       ( SELECT NR_PROCESSO, NR_LANCAMENTO, CD_ITEM'
      '         FROM   TSOLIC_PAGTO P'
      '         WHERE  S.DT_PAGTO = P.DT_PAGTO AND'
      '                S.NR_REF = P.NR_REF AND'
      
        '                ( ( S.NR_REF <> '#39#39' ) AND ( S.NR_REF IS NOT NULL ' +
        ') ) AND'
      
        '                P.CD_STATUS IN ( '#39'0'#39', '#39'1'#39', '#39'2'#39', '#39'3'#39', '#39'5'#39', '#39'6'#39', '#39 +
        '19'#39' ) ) ) AND'
      '       S.NR_REF NOT IN ( '#39'C'#39', '#39'D'#39', '#39'T'#39' )'
      
        'GROUP BY P.CD_UNID_NEG, S.NR_REF, S.DT_PAGTO, S.CD_BANCO, B.NM_B' +
        'ANCO, S.CD_FAVORECIDO, F.NM_FAVORECIDO, S.NR_DOCTO, S.CD_STATUS_' +
        'CHEQUE'
      'ORDER BY CD_STATUS_CHEQUE, S.NR_DOCTO')
    Left = 32
    Top = 13
    ParamData = <
      item
        DataType = ftString
        Name = 'CD_UNID_NEG'
        ParamType = ptUnknown
      end
      item
        DataType = ftDate
        Name = 'DT_PAGTO'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'CD_BANCO'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'CD_BANCO'
        ParamType = ptUnknown
      end>
    object qry_lib_pagto_CD_UNID_NEG: TStringField
      FieldName = 'CD_UNID_NEG'
      Size = 2
    end
    object qry_lib_pagto_NR_REF: TStringField
      DisplayLabel = 'Ref.'
      FieldName = 'NR_REF'
      Size = 3
    end
    object qry_lib_pagto_VL_PAGTO: TFloatField
      DisplayLabel = 'Vl. Pagto.'
      FieldName = 'VL_PAGTO'
      DisplayFormat = '#0,.00'
      EditFormat = '#0.00'
    end
    object qry_lib_pagto_CD_BANCO: TStringField
      FieldName = 'CD_BANCO'
      Size = 3
    end
    object qry_lib_pagto_NM_BANCO: TStringField
      DisplayLabel = 'Banco'
      FieldName = 'NM_BANCO'
      Size = 40
    end
    object qry_lib_pagto_CD_FAVORECIDO: TStringField
      FieldName = 'CD_FAVORECIDO'
      Size = 5
    end
    object qry_lib_pagto_NM_FAVORECIDO: TStringField
      DisplayLabel = 'Favorecido'
      FieldName = 'NM_FAVORECIDO'
      Size = 50
    end
    object qry_lib_pagto_DT_PAGTO: TDateTimeField
      FieldName = 'DT_PAGTO'
    end
    object qry_lib_pagto_NR_DOCTO: TStringField
      DisplayLabel = 'N'#186' Cheque'
      FieldName = 'NR_DOCTO'
      Size = 10
    end
    object qry_lib_pagto_CD_STATUS_CHEQUE: TStringField
      FieldName = 'CD_STATUS_CHEQUE'
      Size = 1
    end
    object qry_lib_pagto_LookStatusCheque: TStringField
      DisplayLabel = 'Status do Cheque'
      FieldKind = fkLookup
      FieldName = 'LookStatusCheque'
      LookupDataSet = qry_status_cheque_
      LookupKeyFields = 'CODIGO'
      LookupResultField = 'DESCRICAO'
      KeyFields = 'CD_STATUS_CHEQUE'
      Size = 25
      Lookup = True
    end
  end
  object ds_lib_pagto: TDataSource
    DataSet = qry_lib_pagto_
    Left = 31
    Top = 62
  end
  object ds_banco: TDataSource
    DataSet = qry_banco_
    Left = 127
    Top = 176
  end
  object qry_banco_: TQuery
    DatabaseName = 'DBBROKER'
    RequestLive = True
    SQL.Strings = (
      'SELECT *'
      'FROM TBANCO'
      'WHERE CD_BANCO <> '#39#39)
    Left = 127
    Top = 120
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
    object qry_banco_AP_BANCO: TStringField
      FieldName = 'AP_BANCO'
      Origin = 'TBANCO.CD_BANCO'
      Size = 10
    end
    object qry_banco_NR_CONTA: TStringField
      FieldName = 'NR_CONTA'
      Origin = 'TBANCO.NM_BANCO'
      Size = 10
    end
    object qry_banco_CD_AGENCIA: TStringField
      FieldName = 'CD_AGENCIA'
      Origin = 'TBANCO.AP_BANCO'
      Size = 5
    end
    object qry_banco_CD_CT_CONTABIL: TStringField
      FieldName = 'CD_CT_CONTABIL'
      Origin = 'TBANCO.CD_BANCO'
      Size = 10
    end
    object qry_banco_IN_ATIVO: TStringField
      FieldName = 'IN_ATIVO'
      Origin = 'TBANCO.CD_AGENCIA'
      Size = 1
    end
    object qry_banco_TP_CONTA: TStringField
      FieldName = 'TP_CONTA'
      Origin = 'TBANCO.CD_CT_CONTABIL'
      Size = 1
    end
    object qry_banco_IN_FINANCEIRO: TStringField
      FieldName = 'IN_FINANCEIRO'
      Origin = 'TBANCO.IN_ATIVO'
      Size = 1
    end
    object qry_banco_NR_BANCO: TStringField
      FieldName = 'NR_BANCO'
      Origin = 'TBANCO.TP_CONTA'
      Size = 3
    end
    object qry_banco_LVALOR: TIntegerField
      FieldName = 'LVALOR'
      Origin = 'TBANCO.IN_FINANCEIRO'
    end
    object qry_banco_CVALOR: TIntegerField
      FieldName = 'CVALOR'
      Origin = 'TBANCO.NR_BANCO'
    end
    object qry_banco_LEXTENSO: TIntegerField
      FieldName = 'LEXTENSO'
      Origin = 'TBANCO.LVALOR'
    end
    object qry_banco_CEXTENSO: TIntegerField
      FieldName = 'CEXTENSO'
      Origin = 'TBANCO.CVALOR'
    end
    object qry_banco_LFAVOR: TIntegerField
      FieldName = 'LFAVOR'
      Origin = 'TBANCO.LEXTENSO'
    end
    object qry_banco_CFAVOR: TIntegerField
      FieldName = 'CFAVOR'
      Origin = 'TBANCO.CEXTENSO'
    end
    object qry_banco_LCIDADE: TIntegerField
      FieldName = 'LCIDADE'
      Origin = 'TBANCO.LFAVOR'
    end
    object qry_banco_CCIDADE: TIntegerField
      FieldName = 'CCIDADE'
      Origin = 'TBANCO.CFAVOR'
    end
    object qry_banco_CDIA: TIntegerField
      FieldName = 'CDIA'
      Origin = 'TBANCO.LCIDADE'
    end
    object qry_banco_CANO: TIntegerField
      FieldName = 'CANO'
      Origin = 'TBANCO.CCIDADE'
    end
    object qry_banco_ANOMASK: TStringField
      FieldName = 'ANOMASK'
      Origin = 'TBANCO.CD_BANCO'
      Size = 4
    end
    object qry_banco_FORMCONT: TBooleanField
      FieldName = 'FORMCONT'
      Origin = 'TBANCO.CANO'
    end
    object qry_banco_LEXTENSO2: TIntegerField
      FieldName = 'LEXTENSO2'
      Origin = 'TBANCO.ANOMASK'
    end
    object qry_banco_CEXTENSO2: TIntegerField
      FieldName = 'CEXTENSO2'
      Origin = 'TBANCO.FORMCONT'
    end
    object qry_banco_CMES: TIntegerField
      FieldName = 'CMES'
      Origin = 'TBANCO.CD_BANCO'
    end
    object qry_banco_LCHEQUE: TIntegerField
      FieldName = 'LCHEQUE'
      Origin = 'TBANCO.CD_BANCO'
    end
    object qry_banco_CCHEQUE: TIntegerField
      FieldName = 'CCHEQUE'
      Origin = 'TBANCO.NM_BANCO'
    end
    object qry_banco_CBANCO: TIntegerField
      FieldName = 'CBANCO'
      Origin = 'TBANCO.NR_CONTA'
    end
    object qry_banco_CD_ACESSO: TStringField
      FieldName = 'CD_ACESSO'
      Origin = 'TBANCO.AP_BANCO'
      Size = 1
    end
    object qry_banco_CD_AUX: TStringField
      FieldName = 'CD_AUX'
      Origin = 'TBANCO.NR_CONTA'
      Size = 3
    end
    object qry_banco_NR_CHEQUE: TStringField
      FieldName = 'NR_CHEQUE'
      Origin = 'TBANCO.AP_BANCO'
      Size = 6
    end
    object qry_banco_NR_REMESSA: TStringField
      FieldName = 'NR_REMESSA'
      Origin = 'TBANCO.CD_CT_CONTABIL'
      Size = 6
    end
  end
  object ds_solic_pagto: TDataSource
    DataSet = qry_solic_pagto_
    Left = 127
    Top = 286
  end
  object qry_solic_pagto_: TQuery
    DatabaseName = 'DBBROKER'
    DataSource = ds_lib_pagto_item
    RequestLive = True
    SQL.Strings = (
      
        'SELECT NR_PROCESSO, NR_LANCAMENTO, CD_ITEM, NR_DOCTO, CD_STATUS_' +
        'CHEQUE, DT_PAGTO, VL_PAGTO, VL_DESCONTO, CD_STATUS, IN_TRANSF_FI' +
        'N, NR_REF'
      'FROM   TSOLIC_PAGTO'
      'WHERE  NR_PROCESSO = :NR_PROCESSO AND'
      '       NR_LANCAMENTO = :NR_LANCAMENTO AND'
      '       CD_ITEM = :CD_ITEM AND'
      '       IN_TED = '#39'1'#39)
    Left = 127
    Top = 232
    ParamData = <
      item
        DataType = ftString
        Name = 'NR_PROCESSO'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'NR_LANCAMENTO'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'CD_ITEM'
        ParamType = ptUnknown
      end>
    object qry_solic_pagto_NR_PROCESSO: TStringField
      FieldName = 'NR_PROCESSO'
      Origin = 'TSOLIC_PAGTO.NR_PROCESSO'
      Size = 18
    end
    object qry_solic_pagto_NR_LANCAMENTO: TStringField
      FieldName = 'NR_LANCAMENTO'
      Origin = 'TSOLIC_PAGTO.NR_PROCESSO'
      Size = 3
    end
    object qry_solic_pagto_CD_ITEM: TStringField
      FieldName = 'CD_ITEM'
      Origin = 'TSOLIC_PAGTO.CD_ITEM'
      Size = 3
    end
    object qry_solic_pagto_CD_STATUS_CHEQUE: TStringField
      FieldName = 'CD_STATUS_CHEQUE'
      Origin = 'TSOLIC_PAGTO.NR_PROCESSO'
      Size = 1
    end
    object qry_solic_pagto_NR_DOCTO: TStringField
      FieldName = 'NR_DOCTO'
      Origin = 'TSOLIC_PAGTO.NR_PROCESSO'
      Size = 10
    end
    object qry_solic_pagto_DT_PAGTO: TDateTimeField
      FieldName = 'DT_PAGTO'
      Origin = 'TSOLIC_PAGTO.NR_PROCESSO'
    end
    object qry_solic_pagto_CD_STATUS: TStringField
      FieldName = 'CD_STATUS'
      Origin = 'TSOLIC_PAGTO.NR_PROCESSO'
      Size = 2
    end
    object qry_solic_pagto_VL_PAGTO: TFloatField
      FieldName = 'VL_PAGTO'
      Origin = 'TSOLIC_PAGTO.NR_PROCESSO'
    end
    object qry_solic_pagto_VL_DESCONTO: TFloatField
      FieldName = 'VL_DESCONTO'
      Origin = 'TSOLIC_PAGTO.NR_PROCESSO'
      DisplayFormat = '#0,.00'
      EditFormat = '#0.00'
    end
    object qry_solic_pagto_IN_TRANSF_FIN: TStringField
      FieldName = 'IN_TRANSF_FIN'
      Origin = 'TSOLIC_PAGTO.NR_PROCESSO'
      Size = 1
    end
    object qry_solic_pagto_NR_REF: TStringField
      FieldName = 'NR_REF'
      Origin = 'TSOLIC_PAGTO.CD_ITEM'
      Size = 3
    end
  end
  object qry_itens_pendentes_: TQuery
    DatabaseName = 'DBBROKER'
    DataSource = ds_lib_pagto
    SQL.Strings = (
      'SELECT S.NR_REF, S.CD_ITEM,'
      
        '       ( ISNULL( VL_PAGTO, 0 ) - ISNULL( VL_DESCONTO, 0 ) ) AS V' +
        'L_PAGTO,'
      
        '       S.NR_PROCESSO, S.NR_LANCAMENTO, U.DESCRICAO NM_STATUS, I.' +
        'NM_ITEM'
      'FROM   TSOLIC_PAGTO S,'
      '       TSTATUS_SOLIC_PAGTO U,'
      '       TITEM I,'
      '       TPROCESSO P'
      'WHERE  S.CD_ITEM *= I.CD_ITEM AND'
      '       S.CD_STATUS = U.CODIGO AND'
      '       S.NR_PROCESSO = P.NR_PROCESSO AND'
      '       P.CD_UNID_NEG = :CD_UNID_NEG AND'
      '       S.IN_TED = '#39'0'#39' AND'
      '       S.NR_REF = :NR_REF AND'
      '       S.DT_PAGTO = :DT_PAGTO AND'
      '       ( ( S.CD_BANCO = :CD_BANCO ) or ( :CD_BANCO = '#39#39' ) ) AND'
      '       ( ( S.NR_REF <> '#39#39' ) AND ( S.NR_REF IS NOT NULL ) ) AND'
      
        '       ( ( SELECT ( ISNULL( VL_PAGTO, 0 ) - ISNULL( VL_DESCONTO,' +
        ' 0 ) ) AS VL_PAGTO'
      '           FROM   TSOLIC_PAGTO P'
      '           WHERE  P.NR_PROCESSO = S.NR_PROCESSO AND'
      '                  P.NR_LANCAMENTO = S.NR_LANCAMENTO AND'
      '                  S.CD_ITEM = P.CD_ITEM AND'
      
        '                  P.CD_STATUS NOT IN ('#39'7'#39', '#39'8'#39', '#39'9'#39', '#39'10'#39', '#39'11'#39',' +
        ' '#39'16'#39')'
      '       ) > 0 ) AND'
      
        '       ( SELECT ( ISNULL( VL_PAGTO, 0 ) - ISNULL( VL_DESCONTO, 0' +
        ' ) ) AS VL_PAGTO'
      '         FROM   TSOLIC_PAGTO P'
      '         WHERE  P.NR_PROCESSO = S.NR_PROCESSO AND'
      '                P.NR_LANCAMENTO = S.NR_LANCAMENTO AND'
      '                S.CD_ITEM = P.CD_ITEM AND'
      
        '                P.CD_STATUS NOT IN ('#39'7'#39', '#39'8'#39', '#39'9'#39', '#39'10'#39', '#39'11'#39', '#39 +
        '16'#39')'
      '       ) IS NOT NULL')
    Left = 652
    Top = 13
    ParamData = <
      item
        DataType = ftString
        Name = 'CD_UNID_NEG'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'NR_REF'
        ParamType = ptUnknown
      end
      item
        DataType = ftDateTime
        Name = 'DT_PAGTO'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'CD_BANCO'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'CD_BANCO'
        ParamType = ptUnknown
      end>
    object StringField8: TStringField
      DisplayLabel = 'Processo'
      FieldName = 'NR_PROCESSO'
      Size = 18
    end
    object qry_itens_pendentes_NR_LANCAMENTO: TStringField
      FieldName = 'NR_LANCAMENTO'
      Size = 3
    end
    object StringField10: TStringField
      DisplayLabel = 'C'#243'd. Item'
      FieldName = 'CD_ITEM'
      Size = 3
    end
    object StringField11: TStringField
      DisplayLabel = 'Item'
      FieldName = 'NM_ITEM'
      Size = 30
    end
    object StringField7: TStringField
      DisplayLabel = 'Ref.'
      FieldName = 'NR_REF'
      Size = 3
    end
    object FloatField1: TFloatField
      DisplayLabel = 'Valor'
      FieldName = 'VL_PAGTO'
      DisplayFormat = '#0,.00'
      EditFormat = '#0.00'
    end
    object StringField9: TStringField
      DisplayLabel = 'Status'
      FieldName = 'NM_STATUS'
      Size = 30
    end
    object StringField12: TStringField
      DisplayLabel = 'N'#186' Processo'
      DisplayWidth = 14
      FieldKind = fkCalculated
      FieldName = 'CalcNrProcesso'
      Size = 14
      Calculated = True
    end
  end
  object ds_itens_pendentes: TDataSource
    DataSet = qry_itens_pendentes_
    Left = 652
    Top = 62
  end
  object ds_solic_pagto_pend: TDataSource
    DataSet = qry_solic_pagto_pend_
    Left = 652
    Top = 286
  end
  object qry_solic_pagto_pend_: TQuery
    DatabaseName = 'DBBROKER'
    DataSource = ds_itens_pendentes
    RequestLive = True
    SQL.Strings = (
      
        'SELECT NR_PROCESSO, NR_LANCAMENTO, CD_ITEM, CD_STATUS, DT_PAGTO,' +
        ' NR_REF'
      'FROM   TSOLIC_PAGTO'
      'WHERE   NR_PROCESSO = :NR_PROCESSO AND'
      '        NR_LANCAMENTO = :NR_LANCAMENTO AND'
      '        CD_ITEM = :CD_ITEM AND'
      '        IN_TED = '#39'0'#39)
    Left = 652
    Top = 232
    ParamData = <
      item
        DataType = ftString
        Name = 'NR_PROCESSO'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'NR_LANCAMENTO'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'CD_ITEM'
        ParamType = ptUnknown
      end>
    object qry_solic_pagto_pend_NR_PROCESSO: TStringField
      FieldName = 'NR_PROCESSO'
      Origin = 'TSOLIC_PAGTO.NR_PROCESSO'
      Size = 18
    end
    object qry_solic_pagto_pend_NR_LANCAMENTO: TStringField
      FieldName = 'NR_LANCAMENTO'
      Origin = 'TSOLIC_PAGTO.NR_PROCESSO'
      Size = 3
    end
    object qry_solic_pagto_pend_CD_ITEM: TStringField
      FieldName = 'CD_ITEM'
      Origin = 'TSOLIC_PAGTO.CD_ITEM'
      Size = 3
    end
    object qry_solic_pagto_pend_DT_PAGTO: TDateTimeField
      FieldName = 'DT_PAGTO'
      Origin = 'TSOLIC_PAGTO.DT_PAGTO'
    end
    object qry_solic_pagto_pend_NR_REF: TStringField
      FieldName = 'NR_REF'
      Origin = 'TSOLIC_PAGTO.NR_REF'
      Size = 3
    end
    object qry_solic_pagto_pend_CD_STATUS: TStringField
      FieldName = 'CD_STATUS'
      Origin = 'TSOLIC_PAGTO.NR_PROCESSO'
      Size = 2
    end
  end
  object sp_distribui_pagto: TStoredProc
    DatabaseName = 'DBBROKER'
    StoredProcName = 'dbo.sp_distribui_pagto'
    Left = 518
    Top = 120
    ParamData = <
      item
        DataType = ftInteger
        Name = 'Result'
        ParamType = ptResult
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
        Name = '@tp_destino'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = '@nr_doc'
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
  object qry_status_cheque_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT *'
      'FROM TSTATUS_CHEQUE')
    Left = 651
    Top = 120
    object qry_status_cheque_CODIGO: TStringField
      FieldName = 'CODIGO'
      Origin = 'TSTATUS_CHEQUE.CODIGO'
      Size = 1
    end
    object qry_status_cheque_DESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Origin = 'TSTATUS_CHEQUE.DESCRICAO'
      Size = 25
    end
  end
  object ds_status_cheque: TDataSource
    DataSet = qry_status_cheque_
    Left = 651
    Top = 176
  end
  object sp_cancela_solic_pagto: TStoredProc
    DatabaseName = 'DBBROKER'
    StoredProcName = 'dbo.sp_cancela_solic_pagto'
    Left = 766
    Top = 176
    ParamData = <
      item
        DataType = ftInteger
        Name = 'Result'
        ParamType = ptResult
        Value = 0
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
        Name = '@in_ted'
        ParamType = ptInput
        Size = 1
      end>
    object StringField19: TStringField
      FieldName = 'NR_ADICAO'
      Size = 3
    end
    object StringField20: TStringField
      FieldName = 'NR_ITEM'
      Size = 3
    end
  end
  object sp_atualiza_utilizado: TStoredProc
    DatabaseName = 'DBBROKER'
    StoredProcName = 'dbo.sp_atualiza_utilizado'
    Left = 518
    Top = 62
    ParamData = <
      item
        DataType = ftInteger
        Name = 'Result'
        ParamType = ptResult
        Value = 0
      end
      item
        DataType = ftString
        Name = '@nr_processo'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = '@cd_item'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = '@vl_valor'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = '@operacao'
        ParamType = ptInput
      end>
  end
  object qry_ult_ref_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      
        'SELECT RIGHT( '#39'000'#39' + CONVERT( varchar, ( CONVERT( int, ISNULL( ' +
        'MAX( NR_REF ), '#39'000'#39' ) ) + 1 ) ), 3 ) ULT_REF'
      'FROM   TSOLIC_PAGTO'
      'WHERE  CONVERT( datetime, DT_PAGTO, 103 ) = :DT_PAGTO AND'
      '       NR_REF NOT IN ('#39'T'#39', '#39'D'#39', '#39'C'#39')')
    Left = 519
    Top = 13
    ParamData = <
      item
        DataType = ftDateTime
        Name = 'DT_PAGTO'
        ParamType = ptUnknown
      end>
    object qry_ult_ref_ULT_REF: TStringField
      FieldName = 'ULT_REF'
      Size = 3
    end
  end
  object sp_reemite_cheque: TStoredProc
    DatabaseName = 'DBBROKER'
    StoredProcName = 'dbo.sp_reemite_cheque'
    Left = 766
    Top = 120
    ParamData = <
      item
        DataType = ftInteger
        Name = 'Result'
        ParamType = ptResult
        Value = 0
      end
      item
        DataType = ftString
        Name = '@nr_ref'
        ParamType = ptInput
      end
      item
        DataType = ftDateTime
        Name = '@dt_pagto'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = '@nr_novo_cheque'
        ParamType = ptInput
      end
      item
        DataType = ftDateTime
        Name = '@dt_base'
        ParamType = ptInput
      end>
    object StringField5: TStringField
      FieldName = 'NR_ADICAO'
      Size = 3
    end
    object StringField6: TStringField
      FieldName = 'NR_ITEM'
      Size = 3
    end
  end
  object qry_caixa_ctrl_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT MAX(DT_MOVIMENTO) + 1 DT_MOVIMENTO'
      'FROM   TCAIXA_CONTROLE'
      'WHERE  CD_UNID_NEG = :CD_UNID_NEG')
    Left = 766
    Top = 13
    ParamData = <
      item
        DataType = ftString
        Name = 'CD_UNID_NEG'
        ParamType = ptUnknown
      end>
  end
  object qry_cidade_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT END_CIDADE'
      'FROM   TPROCESSO P, TUNID_NEG U'
      'WHERE  P.NR_PROCESSO = :NR_PROCESSO AND'
      '       P.CD_UNID_NEG = U.CD_UNID_NEG')
    Left = 764
    Top = 286
    ParamData = <
      item
        DataType = ftString
        Name = 'NR_PROCESSO'
        ParamType = ptUnknown
      end>
    object qry_cidade_END_CIDADE: TStringField
      FieldName = 'END_CIDADE'
      Origin = 'TUNID_NEG.END_CIDADE'
      Size = 30
    end
  end
  object qry_banco_ted_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      
        'SELECT AP_BANCO, CD_AGENCIA, NR_CONTA, NM_BANCO, NR_BANCO, DAC_A' +
        'GENCIA, CD_BANCO'
      'FROM TBANCO'
      'WHERE CD_BANCO = :CD_BANCO')
    Left = 32
    Top = 352
    ParamData = <
      item
        DataType = ftString
        Name = 'CD_BANCO'
        ParamType = ptUnknown
      end>
    object qry_banco_ted_CD_AGENCIA: TStringField
      FieldName = 'CD_AGENCIA'
      Origin = 'TBANCO.CD_AGENCIA'
      Size = 5
    end
    object qry_banco_ted_NR_CONTA: TStringField
      FieldName = 'NR_CONTA'
      Origin = 'TBANCO.NR_CONTA'
      Size = 10
    end
    object qry_banco_ted_NM_BANCO: TStringField
      FieldName = 'NM_BANCO'
      Origin = 'TBANCO.CD_AGENCIA'
      Size = 40
    end
    object qry_banco_ted_NR_BANCO: TStringField
      FieldName = 'NR_BANCO'
      Origin = 'TBANCO.NR_CONTA'
      Size = 3
    end
    object qry_banco_ted_DAC_AGENCIA: TStringField
      FieldName = 'DAC_AGENCIA'
      Origin = 'TBANCO.NM_BANCO'
      Size = 1
    end
    object qry_banco_ted_AP_BANCO: TStringField
      FieldName = 'AP_BANCO'
      Origin = 'TBANCO.AP_BANCO'
      Size = 10
    end
    object qry_banco_ted_CD_BANCO: TStringField
      FieldName = 'CD_BANCO'
      Origin = 'TBANCO.AP_BANCO'
      Size = 3
    end
  end
  object qry_favorecido_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT NM_FAVORECIDO, CGC_EMPRESA, CD_BANCO, CPF_EMPRESA'
      'FROM TFAVORECIDO'
      'WHERE CD_FAVORECIDO = :CD_FAVORECIDO ')
    Left = 128
    Top = 352
    ParamData = <
      item
        DataType = ftString
        Name = 'CD_FAVORECIDO'
        ParamType = ptUnknown
      end>
  end
  object sp_distribui_pagamento: TStoredProc
    DatabaseName = 'DBBROKER'
    StoredProcName = 'dbo.sp_distribui_pagamento'
    Left = 520
    Top = 345
    ParamData = <
      item
        DataType = ftInteger
        Name = 'Result'
        ParamType = ptResult
      end
      item
        DataType = ftDateTime
        Name = '@dt_pagto'
        ParamType = ptInput
      end
      item
        DataType = ftDateTime
        Name = '@dt_canc'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = '@nr_ref'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = '@tp_destino'
        ParamType = ptInput
      end>
  end
end
