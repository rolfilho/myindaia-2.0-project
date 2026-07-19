object datm_lib_pagto: Tdatm_lib_pagto
  OldCreateOrder = True
  Left = 171
  Top = 127
  Height = 449
  Width = 698
  object ds_item: TDataSource
    DataSet = qry_item_
    Left = 244
    Top = 62
  end
  object qry_item_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      
        'SELECT I.CD_ITEM, I.NM_ITEM, I.CD_TIPO_ITEM, T.IN_SOLIC_CHQ, I.I' +
        'N_ITEM_DI'
      'FROM TITEM I (NOLOCK),'
      '            TTIPO_ITEM T (NOLOCK)'
      'WHERE I.CD_TIPO_ITEM = T.CD_TIPO_ITEM AND'
      '              I.IN_ATIVO = '#39'1'#39)
    Left = 244
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
  object ds_empresa_nac: TDataSource
    DataSet = qry_emp_nac_
    Left = 244
    Top = 286
  end
  object qry_emp_nac_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT CD_EMPRESA, NM_EMPRESA'
      'FROM TEMPRESA_NAC (NOLOCK)')
    Left = 244
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
    Left = 332
    Top = 286
  end
  object qry_unid_neg_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT CD_UNID_NEG, NM_UNID_NEG'
      'FROM   TUNID_NEG (NOLOCK)'
      'WHERE  ( CD_UNID_NEG <> '#39#39' ) AND'
      '                (  CD_UNID_NEG IN'
      '                ( SELECT CD_UNID_NEG'
      '                  FROM   TUSUARIO_HABILITACAO (NOLOCK)'
      
        '                  WHERE  CD_USUARIO = :CD_USUARIO AND IN_ATIVO =' +
        ' '#39'1'#39' ) )'
      'ORDER BY'
      'NM_UNID_NEG'
      ''
      '')
    Left = 332
    Top = 232
    ParamData = <
      item
        DataType = ftString
        Name = 'CD_USUARIO'
        ParamType = ptInput
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
  end
  object ds_produto: TDataSource
    DataSet = qry_produto_
    Left = 431
    Top = 286
  end
  object qry_produto_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT CD_PRODUTO, NM_PRODUTO'
      'FROM TPRODUTO (NOLOCK)'
      'WHERE CD_PRODUTO <> '#39#39)
    Left = 431
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
    Left = 244
    Top = 176
  end
  object qry_servico_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT CD_SERVICO, NM_SERVICO'
      'FROM TSERVICO (NOLOCK)')
    Left = 244
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
    Left = 55
    Top = 176
  end
  object qry_processo_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT NR_PROCESSO, CD_UNID_NEG, CD_PRODUTO, CD_SERVICO,'
      'CD_CLIENTE'
      'FROM TPROCESSO (NOLOCK)'
      'WHERE  NR_PROCESSO = :NR_PROCESSO AND'
      '                IN_CANCELADO = '#39'0'#39' AND'
      '                IN_LIBERADO = '#39'1'#39' AND'
      '                IN_PRODUCAO ='#39'1'#39)
    Left = 55
    Top = 120
    ParamData = <
      item
        DataType = ftString
        Name = 'NR_PROCESSO'
        ParamType = ptInput
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
      'FROM TPROCESSO (NOLOCK)'
      'WHERE  NR_PROCESSO = :NR_PROCESSO AND'
      '                IN_LIBERADO = '#39'1'#39)
    Left = 431
    Top = 120
    ParamData = <
      item
        DataType = ftString
        Name = 'NR_PROCESSO'
        ParamType = ptInput
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
      'FROM TPARAMETROS (NOLOCK)')
    Left = 431
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
    Left = 332
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
    Left = 332
    Top = 176
  end
  object qry_lib_pagto_item_: TQuery
    OnCalcFields = qry_lib_pagto_item_CalcFields
    DatabaseName = 'DBBROKER'
    DataSource = ds_lib_pagto
    SQL.Strings = (
      
        'SELECT S.NR_REF, ( ISNULL( VL_PAGTO, 0 ) - ISNULL( VL_DESCONTO, ' +
        '0) ) VL_PAGTO, S.CD_ITEM,'
      '       ISNULL('
      
        '       ( SELECT ( ISNULL( VL_PAGTO, 0 ) - ISNULL( VL_DESCONTO, 0' +
        ' ) ) VL_PAGTO'
      '         FROM   TSOLIC_PAGTO P (NOLOCK)'
      '         WHERE  P.NR_PROCESSO = S.NR_PROCESSO AND'
      '                P.NR_LANCAMENTO = S.NR_LANCAMENTO AND'
      '                S.CD_ITEM = P.CD_ITEM AND'
      '                P.CD_STATUS IN ( '#39'1'#39', '#39'2'#39', '#39'3'#39', '#39'5'#39', '#39'19'#39' )'
      '       ), 0 ) AS VL_BLOQUEADO,'
      
        '       S.NR_PROCESSO, S.NR_LANCAMENTO, U.DESCRICAO NM_STATUS, I.' +
        'NM_ITEM'
      'FROM   TSOLIC_PAGTO S (NOLOCK),'
      '       TSTATUS_SOLIC_PAGTO U (NOLOCK),'
      '       TITEM I (NOLOCK),'
      '       TPROCESSO P (NOLOCK)'
      'WHERE  S.CD_ITEM *= I.CD_ITEM AND'
      '       S.CD_STATUS = U.CODIGO AND'
      '       S.NR_PROCESSO = P.NR_PROCESSO AND'
      '       P.CD_UNID_NEG = :CD_UNID_NEG AND'
      '       S.IN_TED = :IN_TED AND'
      '       S.CD_STATUS IN ( '#39'1'#39', '#39'2'#39', '#39'3'#39', '#39'5'#39', '#39'19'#39' ) AND'
      '       S.DT_PAGTO = :DT_PAGTO AND'
      '       S.NR_REF = :NR_REF AND'
      '       S.NR_DOCTO = :NR_DOCTO AND'
      '       ( ( S.NR_REF <> '#39#39' ) AND ( S.NR_REF IS NOT NULL ) )')
    Left = 151
    Top = 13
    ParamData = <
      item
        DataType = ftString
        Name = 'CD_UNID_NEG'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'IN_TED'
        ParamType = ptInput
      end
      item
        DataType = ftDateTime
        Name = 'DT_PAGTO'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'NR_REF'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'NR_DOCTO'
        ParamType = ptUnknown
      end>
    object qry_lib_pagto_item_NR_REF: TStringField
      DisplayLabel = 'Lote'
      FieldName = 'NR_REF'
      Size = 3
    end
    object qry_lib_pagto_item_NR_LANCAMENTO: TStringField
      DisplayLabel = 'N'#186' Lanc.'
      FieldName = 'NR_LANCAMENTO'
      Size = 3
    end
    object qry_lib_pagto_item_VL_PAGTO: TFloatField
      DisplayLabel = 'Valor'
      FieldName = 'VL_PAGTO'
      DisplayFormat = '#0,.00'
      EditFormat = '#0.00'
    end
    object qry_lib_pagto_item_VL_BLOQUEADO: TFloatField
      DisplayLabel = 'Vl. Bloqueado'
      FieldName = 'VL_BLOQUEADO'
      DisplayFormat = '#0,.00'
      EditFormat = '#0.00'
    end
    object qry_lib_pagto_item_NR_PROCESSO: TStringField
      DisplayLabel = 'Processo'
      FieldName = 'NR_PROCESSO'
      Size = 18
    end
    object qry_lib_pagto_item_NM_STATUS: TStringField
      DisplayLabel = 'Status'
      FieldName = 'NM_STATUS'
      Size = 30
    end
    object qry_lib_pagto_item_CD_ITEM: TStringField
      DisplayLabel = 'C'#243'd. Item'
      FieldName = 'CD_ITEM'
      Size = 3
    end
    object qry_lib_pagto_item_NM_ITEM: TStringField
      DisplayLabel = 'Item'
      FieldName = 'NM_ITEM'
      Size = 30
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
    Left = 151
    Top = 62
  end
  object ds_destino: TDataSource
    DataSet = qry_destino_
    Left = 332
    Top = 62
  end
  object qry_destino_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT D.CD_DESTINO, D.NM_DESTINO, D.CD_FAVORECIDO, F.CD_BANCO'
      'FROM TDESTINO D (NOLOCK), TFAVORECIDO F (NOLOCK)'
      'WHERE D.CD_FAVORECIDO *= F.CD_FAVORECIDO ')
    Left = 332
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
    Left = 55
    Top = 286
  end
  object qry_calculo_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT *'
      'FROM TCALCULO (NOLOCK)')
    Left = 55
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
  object qry_status_solic_pagto_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT *'
      'FROM TSTATUS_SOLIC_PAGTO (NOLOCK)')
    Left = 431
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
    Left = 431
    Top = 61
  end
  object qry_di_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT NR_PROCESSO, DT_CALCULO'
      'FROM TDECLARACAO_IMPORTACAO (NOLOCK)'
      'WHERE NR_PROCESSO = :NR_PROCESSO')
    Left = 554
    Top = 120
    ParamData = <
      item
        DataType = ftString
        Name = 'NR_PROCESSO'
        ParamType = ptInput
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
    Left = 554
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
      
        'SELECT DISTINCT S.NR_REF, P.CD_UNID_NEG, S.DT_PAGTO, E.AP_EMPRES' +
        'A,'
      '       ISNULL('
      
        '       ( SELECT SUM( ISNULL( VL_PAGTO, 0 ) - ISNULL( VL_DESCONTO' +
        ', 0 ) )'
      '         FROM   TSOLIC_PAGTO P (NOLOCK)'
      '         WHERE  S.DT_PAGTO = P.DT_PAGTO AND'
      '                S.NR_REF = P.NR_REF AND'
      '                S.CD_FAVORECIDO = P.CD_FAVORECIDO AND'
      '                S.CD_BANCO = P.CD_BANCO AND'
      '                P.IN_TED = :IN_TED AND'
      
        '                ( ( S.NR_REF <> '#39#39' ) AND ( S.NR_REF IS NOT NULL ' +
        ') AND ( S.NR_REF NOT IN ('#39'T'#39', '#39'D'#39') ) ) AND'
      
        '                P.CD_STATUS NOT IN ('#39'4'#39', '#39'6'#39', '#39'12'#39', '#39'13'#39', '#39'14'#39', ' +
        #39'15'#39', '#39'17'#39')'
      '       ), 0 ) VL_PAGTO,'
      '       ISNULL('
      
        '       ( SELECT SUM( ISNULL( VL_PAGTO, 0 ) - ISNULL( VL_DESCONTO' +
        ', 0 ) )'
      '         FROM   TSOLIC_PAGTO P (NOLOCK)'
      '         WHERE  S.DT_PAGTO = P.DT_PAGTO AND'
      '                S.NR_REF = P.NR_REF AND'
      '                S.CD_FAVORECIDO = P.CD_FAVORECIDO AND'
      '                S.CD_BANCO = P.CD_BANCO AND'
      '                P.IN_TED = :IN_TED AND'
      
        '                ( ( S.NR_REF <> '#39#39' ) AND ( S.NR_REF IS NOT NULL ' +
        ') AND ( S.NR_REF NOT IN ('#39'T'#39', '#39'D'#39') ) ) AND'
      '                P.CD_STATUS IN ( '#39'1'#39', '#39'2'#39', '#39'3'#39', '#39'5'#39', '#39'19'#39' )'
      '       ), 0 ) VL_BLOQUEADO,'
      '       B.NM_BANCO, F.NM_FAVORECIDO, S.IN_TED, S.NR_DOCTO'
      'FROM   TSOLIC_PAGTO S (NOLOCK),'
      '       TBANCO B (NOLOCK),'
      '       TFAVORECIDO F (NOLOCK),'
      '       TPROCESSO P (NOLOCK),'
      '       TEMPRESA_NAC E (NOLOCK)'
      'WHERE  S.CD_BANCO *= B.CD_BANCO AND'
      '       S.NR_PROCESSO = P.NR_PROCESSO AND'
      '       P.CD_CLIENTE = E.CD_EMPRESA AND'
      '       P.CD_UNID_NEG = :CD_UNID_NEG AND'
      '       S.IN_TED = :IN_TED AND'
      '       S.CD_FAVORECIDO *= F.CD_FAVORECIDO AND'
      '       S.DT_PAGTO = :DT_PAGTO AND'
      
        '       ( ( S.NR_REF <> '#39#39' ) AND ( S.NR_REF IS NOT NULL ) AND ( S' +
        '.NR_REF NOT IN ('#39'T'#39', '#39'D'#39') ) ) AND'
      '       ISNULL('
      
        '       ( SELECT SUM( ISNULL( VL_PAGTO, 0 ) - ISNULL( VL_DESCONTO' +
        ', 0 ) )'
      '         FROM   TSOLIC_PAGTO P (NOLOCK)'
      '         WHERE  S.DT_PAGTO = P.DT_PAGTO AND'
      '                S.NR_REF = P.NR_REF AND'
      '                S.CD_FAVORECIDO = P.CD_FAVORECIDO AND'
      '                S.CD_BANCO = P.CD_BANCO AND'
      '                P.IN_TED = :IN_TED AND'
      
        '                ( ( S.NR_REF <> '#39#39' ) AND ( S.NR_REF IS NOT NULL ' +
        ') AND ( S.NR_REF NOT IN ('#39'T'#39', '#39'D'#39') ) ) AND'
      
        '                P.CD_STATUS IN ('#39'1'#39', '#39'2'#39', '#39'3'#39', '#39'5'#39', '#39'19'#39' ) ), 0 ' +
        ') > 0'
      
        'GROUP BY P.CD_UNID_NEG, S.DT_PAGTO, E.AP_EMPRESA, S.NR_REF, S.CD' +
        '_BANCO, S.CD_FAVORECIDO, B.NM_BANCO, F.NM_FAVORECIDO, S.IN_TED, ' +
        'S.NR_DOCTO')
    Left = 55
    Top = 13
    ParamData = <
      item
        DataType = ftString
        Name = 'IN_TED'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'IN_TED'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'CD_UNID_NEG'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'IN_TED'
        ParamType = ptInput
      end
      item
        DataType = ftDate
        Name = 'DT_PAGTO'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'IN_TED'
        ParamType = ptInput
      end>
    object qry_lib_pagto_CD_UNID_NEG: TStringField
      FieldName = 'CD_UNID_NEG'
      Size = 2
    end
    object qry_lib_pagto_NR_REF: TStringField
      DisplayLabel = 'Lote'
      FieldName = 'NR_REF'
      Size = 3
    end
    object qry_lib_pagto_VL_PAGTO: TFloatField
      DisplayLabel = 'Vl. Pagto.'
      FieldName = 'VL_PAGTO'
      DisplayFormat = '#0,.00'
      EditFormat = '#0.00'
    end
    object qry_lib_pagto_VL_BLOQUEADO: TFloatField
      DisplayLabel = 'Vl. Bloqueado'
      FieldName = 'VL_BLOQUEADO'
      DisplayFormat = '#0,.00'
      EditFormat = '#0.00'
    end
    object qry_lib_pagto_NM_BANCO: TStringField
      DisplayLabel = 'Banco'
      FieldName = 'NM_BANCO'
      Size = 40
    end
    object qry_lib_pagto_NM_FAVORECIDO: TStringField
      DisplayLabel = 'Favorecido'
      FieldName = 'NM_FAVORECIDO'
      Size = 50
    end
    object qry_lib_pagto_DT_PAGTO: TDateTimeField
      DisplayLabel = 'Dt. Pagto.'
      FieldName = 'DT_PAGTO'
    end
    object qry_lib_pagto_IN_TED: TStringField
      FieldName = 'IN_TED'
      Size = 1
    end
    object qry_lib_pagto_AP_EMPRESA: TStringField
      FieldName = 'AP_EMPRESA'
      FixedChar = True
      Size = 10
    end
    object qry_lib_pagto_NR_DOCTO: TStringField
      FieldName = 'NR_DOCTO'
      FixedChar = True
      Size = 10
    end
  end
  object ds_lib_pagto: TDataSource
    DataSet = qry_lib_pagto_
    Left = 55
    Top = 63
  end
  object sp_liberar_solic_pagto: TStoredProc
    DatabaseName = 'DBBROKER'
    StoredProcName = 'dbo.sp_liberar_solic_pagto'
    Left = 554
    Top = 13
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
        Name = '@nr_lancamento'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = '@cd_item'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = '@operacao'
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
  object qry_itens_liberados_: TQuery
    OnCalcFields = qry_itens_liberados_CalcFields
    DatabaseName = 'DBBROKER'
    DataSource = ds_lib_pagto
    SQL.Strings = (
      
        'SELECT S.NR_REF, ( ISNULL( VL_PAGTO, 0 ) - ISNULL( VL_DESCONTO, ' +
        '0 ) ) VL_PAGTO, S.CD_ITEM,'
      '       ISNULL('
      
        '       ( SELECT ( ISNULL( VL_PAGTO, 0 ) - ISNULL( VL_DESCONTO, 0' +
        ' ) ) VL_PAGTO'
      '         FROM  TSOLIC_PAGTO P (NOLOCK)'
      '         WHERE P.NR_PROCESSO = S.NR_PROCESSO AND'
      '               P.NR_LANCAMENTO = S.NR_LANCAMENTO AND'
      '               S.CD_ITEM = P.CD_ITEM AND'
      
        '               P.CD_STATUS NOT IN ( '#39'1'#39', '#39'2'#39', '#39'3'#39', '#39'4'#39', '#39'5'#39', '#39'17' +
        #39' )'
      '       ), 0 ) AS VL_BLOQUEADO,'
      
        '       S.NR_PROCESSO, S.NR_LANCAMENTO, U.DESCRICAO NM_STATUS, I.' +
        'NM_ITEM'
      'FROM   TSOLIC_PAGTO S (NOLOCK),'
      '       TSTATUS_SOLIC_PAGTO U (NOLOCK),'
      '       TITEM I (NOLOCK),'
      '       TPROCESSO P (NOLOCK)'
      'WHERE  S.CD_ITEM *= I.CD_ITEM AND'
      '       S.CD_STATUS = U.CODIGO AND'
      '       S.NR_PROCESSO = P.NR_PROCESSO AND'
      '       P.CD_UNID_NEG = :CD_UNID_NEG AND'
      '       S.IN_TED = :IN_TED AND'
      '       S.DT_PAGTO = :DT_PAGTO AND'
      '       S.NR_REF = :NR_REF AND'
      
        '       ( ( S.NR_REF <> '#39#39' ) AND ( S.NR_REF IS NOT NULL )  AND ( ' +
        'S.NR_REF NOT IN ('#39'T'#39', '#39'D'#39') ) ) AND'
      
        '       ( ( SELECT ( ISNULL( VL_PAGTO, 0 ) - ISNULL( VL_DESCONTO,' +
        ' 0 ) ) VL_PAGTO'
      '           FROM   TSOLIC_PAGTO P (NOLOCK)'
      '           WHERE  P.NR_PROCESSO = S.NR_PROCESSO AND'
      '                  P.NR_LANCAMENTO = S.NR_LANCAMENTO AND'
      '                  S.CD_ITEM = P.CD_ITEM AND'
      
        '                  P.CD_STATUS NOT IN ( '#39'1'#39', '#39'2'#39', '#39'3'#39', '#39'4'#39', '#39'5'#39', ' +
        #39'17'#39', '#39'19'#39' )'
      '       ) > 0 ) AND'
      '       ( SELECT VL_PAGTO'
      '         FROM   TSOLIC_PAGTO P (NOLOCK)'
      '         WHERE  P.NR_PROCESSO = S.NR_PROCESSO AND'
      '                P.NR_LANCAMENTO = S.NR_LANCAMENTO AND'
      '                S.CD_ITEM = P.CD_ITEM AND'
      
        '                P.CD_STATUS NOT IN ( '#39'1'#39', '#39'2'#39', '#39'3'#39', '#39'4'#39', '#39'5'#39', '#39'1' +
        '7'#39', '#39'19'#39' )'
      '       ) IS NOT NULL')
    Left = 151
    Top = 120
    ParamData = <
      item
        DataType = ftString
        Name = 'CD_UNID_NEG'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'IN_TED'
        ParamType = ptInput
      end
      item
        DataType = ftDateTime
        Name = 'DT_PAGTO'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'NR_REF'
        ParamType = ptInput
      end>
    object qry_itens_liberados_NR_PROCESSO: TStringField
      FieldName = 'NR_PROCESSO'
      Size = 18
    end
    object qry_itens_liberados_NR_LANCAMENTO: TStringField
      DisplayLabel = 'N'#186' Lanc.'
      FieldName = 'NR_LANCAMENTO'
      Size = 3
    end
    object qry_itens_liberados_CD_ITEM: TStringField
      FieldName = 'CD_ITEM'
      Size = 3
    end
    object qry_itens_liberados_CalcNrProcesso: TStringField
      DisplayLabel = 'N'#186' Processo'
      FieldKind = fkCalculated
      FieldName = 'CalcNrProcesso'
      Size = 14
      Calculated = True
    end
    object qry_itens_liberados_NR_REF: TStringField
      DisplayLabel = 'Lote'
      FieldName = 'NR_REF'
      Size = 3
    end
    object qry_itens_liberados_VL_PAGTO: TFloatField
      DisplayLabel = 'Vl. Pagto'
      FieldName = 'VL_PAGTO'
      DisplayFormat = '#0,.00'
      EditFormat = '#0.00'
    end
    object qry_itens_liberados_VL_BLOQUEADO: TFloatField
      DisplayLabel = 'Vl. Bloqueado'
      FieldName = 'VL_BLOQUEADO'
      DisplayFormat = '#0,.00'
      EditFormat = '#0.00'
    end
    object qry_itens_liberados_NM_STATUS: TStringField
      DisplayLabel = 'Status'
      FieldName = 'NM_STATUS'
      Size = 30
    end
    object qry_itens_liberados_NM_ITEM: TStringField
      DisplayLabel = 'Item'
      FieldName = 'NM_ITEM'
      Size = 30
    end
  end
  object ds_itens_liberados_: TDataSource
    DataSet = qry_itens_liberados_
    Left = 151
    Top = 176
  end
  object qry_solic_item_: TQuery
    DatabaseName = 'DBBROKER'
    DataSource = ds_lib_pagto_item
    RequestLive = True
    SQL.Strings = (
      
        'SELECT NR_PROCESSO, NR_LANCAMENTO, CD_ITEM, CD_STATUS, VL_PAGTO,' +
        ' VL_DESCONTO, DT_PAGTO'
      'FROM   TSOLIC_PAGTO (NOLOCK)'
      'WHERE  NR_PROCESSO = :NR_PROCESSO AND'
      '       NR_LANCAMENTO = :NR_LANCAMENTO AND'
      '       CD_ITEM = :CD_ITEM')
    Left = 554
    Top = 232
    ParamData = <
      item
        DataType = ftString
        Name = 'NR_PROCESSO'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'NR_LANCAMENTO'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'CD_ITEM'
        ParamType = ptInput
      end>
    object qry_solic_item_NR_PROCESSO: TStringField
      FieldName = 'NR_PROCESSO'
      Origin = 'TSOLIC_PAGTO.NR_PROCESSO'
      Size = 18
    end
    object qry_solic_item_NR_LANCAMENTO: TStringField
      FieldName = 'NR_LANCAMENTO'
      Origin = 'TSOLIC_PAGTO.NR_PROCESSO'
      Size = 3
    end
    object qry_solic_item_CD_ITEM: TStringField
      FieldName = 'CD_ITEM'
      Origin = 'TSOLIC_PAGTO.CD_ITEM'
      Size = 3
    end
    object qry_solic_item_CD_STATUS: TStringField
      FieldName = 'CD_STATUS'
      Origin = 'TSOLIC_PAGTO.CD_STATUS'
      Size = 2
    end
    object qry_solic_item_VL_PAGTO: TFloatField
      FieldName = 'VL_PAGTO'
      Origin = 'TSOLIC_PAGTO.VL_PAGTO'
      DisplayFormat = '#0,.00'
      EditFormat = '#0.00'
    end
    object qry_solic_item_VL_DESCONTO: TFloatField
      FieldName = 'VL_DESCONTO'
      Origin = 'TSOLIC_PAGTO.NR_PROCESSO'
      DisplayFormat = '#0,.00'
      EditFormat = '#0.00'
    end
    object qry_solic_item_DT_PAGTO: TDateTimeField
      FieldName = 'DT_PAGTO'
      Origin = 'TSOLIC_PAGTO.NR_PROCESSO'
    end
    object qry_solic_item_LookItem: TStringField
      DisplayLabel = 'Item'
      FieldKind = fkLookup
      FieldName = 'LookItem'
      LookupDataSet = qry_item_
      LookupKeyFields = 'CD_ITEM'
      LookupResultField = 'NM_ITEM'
      KeyFields = 'CD_ITEM'
      Size = 30
      Lookup = True
    end
  end
  object sp_cancela_item_solic_pagto: TStoredProc
    DatabaseName = 'DBBROKER'
    StoredProcName = 'dbo.sp_cancela_item_solic_pagto'
    Left = 554
    Top = 287
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
        Name = '@nr_lancamento'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = '@cd_item'
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
  object sp_cancela_solic_pagto: TStoredProc
    DatabaseName = 'DBBROKER'
    StoredProcName = 'dbo.sp_cancela_solic_pagto'
    Left = 553
    Top = 344
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
end
