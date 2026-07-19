object datm_monta_pagto: Tdatm_monta_pagto
  OldCreateOrder = True
  Left = 112
  Top = 142
  Height = 444
  Width = 876
  object ds_item: TDataSource
    DataSet = qry_item_
    Left = 582
    Top = 174
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
    Left = 582
    Top = 118
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
  object sp_proc_itens_monta_pagto: TStoredProc
    DatabaseName = 'DBBROKER'
    StoredProcName = 'dbo.sp_proc_itens_monta_pagto'
    Left = 488
    Top = 128
    ParamData = <
      item
        DataType = ftInteger
        Name = 'Result'
        ParamType = ptResult
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
        Name = '@nr_doc'
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
    Left = 142
    Top = 286
  end
  object qry_emp_nac_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT CD_EMPRESA, NM_EMPRESA'
      'FROM TEMPRESA_NAC (NOLOCK)')
    Left = 142
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
    Left = 224
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
      '')
    Left = 224
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
  end
  object ds_produto: TDataSource
    DataSet = qry_produto_
    Left = 317
    Top = 286
  end
  object qry_produto_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT CD_PRODUTO, NM_PRODUTO'
      'FROM   TPRODUTO (NOLOCK)'
      'WHERE  ( CD_PRODUTO <> '#39#39' ) AND'
      '                (  CD_PRODUTO IN'
      '                ( SELECT CD_PRODUTO'
      '                  FROM   TUSUARIO_HABILITACAO (NOLOCK)'
      '                  WHERE  CD_USUARIO = :CD_USUARIO AND'
      '                         CD_UNID_NEG = :CD_UNID_NEG AND'
      '                         IN_ATIVO = '#39'1'#39' ) )'
      'ORDER BY'
      'NM_PRODUTO'
      '')
    Left = 317
    Top = 232
    ParamData = <
      item
        DataType = ftString
        Name = 'CD_USUARIO'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'CD_UNID_NEG'
        ParamType = ptUnknown
      end>
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
    Left = 142
    Top = 174
  end
  object qry_servico_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT CD_SERVICO, NM_SERVICO'
      'FROM TSERVICO (NOLOCK)')
    Left = 142
    Top = 118
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
    Top = 174
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
    Top = 118
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
      'FROM TPROCESSO (NOLOCK)'
      'WHERE  NR_PROCESSO = :NR_PROCESSO AND'
      '                IN_LIBERADO = '#39'1'#39)
    Left = 317
    Top = 118
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
      'SELECT HM_PARA_SOLIC_CH, IN_CANC_CH_OP'
      'FROM TPARAMETROS (NOLOCK)')
    Left = 317
    Top = 174
    object qry_param_HM_PARA_SOLIC_CH: TStringField
      FieldName = 'HM_PARA_SOLIC_CH'
      Origin = 'TPARAMETROS.HM_PARA_SOLIC_CH'
      Size = 5
    end
    object qry_param_IN_CANC_CH_OP: TStringField
      FieldName = 'IN_CANC_CH_OP'
      Origin = 'TPARAMETROS.HM_PARA_SOLIC_CH'
      Size = 1
    end
  end
  object tbl_yesno_: TTable
    DatabaseName = 'DBBROKER'
    IndexFieldNames = 'CD_YESNO'
    TableName = 'TYES_NO'
    Left = 224
    Top = 118
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
    Left = 224
    Top = 174
  end
  object qry_solic_pagto_: TQuery
    CachedUpdates = True
    AfterInsert = qry_solic_pagto_AfterInsert
    AfterEdit = qry_solic_pagto_AfterEdit
    AfterPost = qry_solic_pagto_AfterPost
    AfterCancel = qry_solic_pagto_AfterCancel
    AfterDelete = qry_solic_pagto_AfterDelete
    AfterScroll = qry_solic_pagto_AfterScroll
    OnCalcFields = qry_solic_pagto_CalcFields
    DatabaseName = 'DBBROKER'
    DataSource = ds_grd_pagto
    SQL.Strings = (
      'SELECT * '
      'FROM   TSOLIC_PAGTO (NOLOCK)'
      'WHERE  NR_PROCESSO = :NR_PROCESSO AND'
      '       NR_LANCAMENTO = :NR_LANCAMENTO AND'
      '       CD_ITEM = :CD_ITEM AND'
      '       IN_SOLICITADO = '#39'1'#39' AND ( NR_REF = '#39#39' OR NR_REF IS NULL )')
    UpdateObject = upd_solic_pagto
    Left = 55
    Top = 13
    ParamData = <
      item
        DataType = ftString
        Name = 'NR_PROCESSO'
        ParamType = ptUnknown
        Size = 19
      end
      item
        DataType = ftString
        Name = 'NR_LANCAMENTO'
        ParamType = ptUnknown
        Size = 4
      end
      item
        DataType = ftString
        Name = 'CD_ITEM'
        ParamType = ptUnknown
        Size = 4
      end>
    object qry_solic_pagto_NR_PROCESSO: TStringField
      FieldName = 'NR_PROCESSO'
      Origin = 'TSOLIC_PAGTO.NR_PROCESSO'
      Size = 18
    end
    object qry_solic_pagto_NR_LANCAMENTO: TStringField
      FieldName = 'NR_LANCAMENTO'
      Origin = 'TSOLIC_PAGTO.DT_PAGTO'
      Size = 3
    end
    object qry_solic_pagto_CD_ITEM: TStringField
      FieldName = 'CD_ITEM'
      Origin = 'TSOLIC_PAGTO.CD_ITEM'
      Size = 3
    end
    object qry_solic_pagto_DT_PAGTO: TDateTimeField
      DisplayLabel = 'Dt. Pagto.'
      FieldName = 'DT_PAGTO'
      Origin = 'TSOLIC_PAGTO.DT_PAGTO'
    end
    object qry_solic_pagto_VL_PAGTO: TFloatField
      DisplayLabel = 'Valor'
      FieldName = 'VL_PAGTO'
      Origin = 'TSOLIC_PAGTO.VL_PAGTO'
      DisplayFormat = '#0,.00'
      EditFormat = '#0.00'
    end
    object qry_solic_pagto_IN_SOLICITADO: TStringField
      FieldName = 'IN_SOLICITADO'
      Origin = 'TSOLIC_PAGTO.NR_PROCESSO'
      Size = 1
    end
    object qry_solic_pagto_LookItem: TStringField
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
    object qry_solic_pagto_CalcNrProcesso: TStringField
      DisplayLabel = 'N'#186' Processo'
      FieldKind = fkCalculated
      FieldName = 'CalcNrProcesso'
      Size = 18
      Calculated = True
    end
    object qry_solic_pagto_LookSolicitado: TStringField
      DisplayLabel = 'Solicitado'
      FieldKind = fkLookup
      FieldName = 'LookSolicitado'
      LookupDataSet = tbl_yesno_
      LookupKeyFields = 'CD_YESNO'
      LookupResultField = 'TX_YESNO'
      KeyFields = 'IN_SOLICITADO'
      Size = 3
      Lookup = True
    end
    object qry_solic_pagto_Look_IN_SOLIC_CHQ: TStringField
      FieldKind = fkLookup
      FieldName = 'Look_IN_SOLIC_CHQ'
      LookupDataSet = qry_item_
      LookupKeyFields = 'CD_ITEM'
      LookupResultField = 'IN_SOLIC_CHQ'
      KeyFields = 'CD_ITEM'
      Size = 1
      Lookup = True
    end
    object qry_solic_pagto_CD_CALCULO: TStringField
      FieldName = 'CD_CALCULO'
      Origin = 'TSOLIC_PAGTO.CD_DESTINO'
      Size = 3
    end
    object qry_solic_pagto_LookCalculo: TStringField
      DisplayLabel = 'Tipo de C'#225'lculo'
      FieldKind = fkLookup
      FieldName = 'LookCalculo'
      LookupDataSet = qry_calculo_
      LookupKeyFields = 'CD_CALCULO'
      LookupResultField = 'NM_CALCULO'
      KeyFields = 'CD_CALCULO'
      Size = 40
      Lookup = True
    end
    object qry_solic_pagto_LookItemDI: TStringField
      FieldKind = fkLookup
      FieldName = 'LookItemDI'
      LookupDataSet = qry_item_
      LookupKeyFields = 'CD_ITEM'
      LookupResultField = 'IN_ITEM_DI'
      KeyFields = 'CD_ITEM'
      Size = 1
      Lookup = True
    end
    object qry_solic_pagto_DT_SOLIC_PAGTO: TDateTimeField
      FieldName = 'DT_SOLIC_PAGTO'
      Origin = 'TSOLIC_PAGTO.CD_ITEM'
    end
    object qry_solic_pagto_HM_SOLIC_PAGTO: TStringField
      FieldName = 'HM_SOLIC_PAGTO'
      Origin = 'TSOLIC_PAGTO.CD_ITEM'
      Size = 5
    end
    object qry_solic_pagto_IN_RESTITUI: TStringField
      FieldName = 'IN_RESTITUI'
      Origin = 'TSOLIC_PAGTO.NR_PROCESSO'
      Size = 1
    end
    object qry_solic_pagto_IN_CALCULADO: TStringField
      FieldName = 'IN_CALCULADO'
      Origin = 'TSOLIC_PAGTO.CD_ITEM'
      Size = 1
    end
    object qry_solic_pagto_CD_FAVORECIDO: TStringField
      FieldName = 'CD_FAVORECIDO'
      Origin = 'TSOLIC_PAGTO.CD_DESTINO'
      OnChange = qry_solic_pagto_CD_FAVORECIDOChange
      Size = 5
    end
    object qry_solic_pagto_CD_BANCO: TStringField
      FieldName = 'CD_BANCO'
      Origin = 'TSOLIC_PAGTO.DT_PAGTO'
      Size = 3
    end
    object qry_solic_pagto_NR_DOCTO: TStringField
      FieldName = 'NR_DOCTO'
      Origin = 'TSOLIC_PAGTO.CD_STATUS'
      Size = 10
    end
    object qry_solic_pagto_NR_REF: TStringField
      FieldName = 'NR_REF'
      Origin = 'TSOLIC_PAGTO.IN_SOLICITADO'
      Size = 3
    end
    object qry_solic_pagto_CD_USUARIO_SOLIC: TStringField
      FieldName = 'CD_USUARIO_SOLIC'
      Origin = 'TSOLIC_PAGTO.NR_PROCESSO'
      Size = 4
    end
    object qry_solic_pagto_CD_USUARIO_MONTA: TStringField
      FieldName = 'CD_USUARIO_MONTA'
      Origin = 'TSOLIC_PAGTO.CD_ITEM'
      Size = 4
    end
    object qry_solic_pagto_CD_STATUS: TStringField
      FieldName = 'CD_STATUS'
      Origin = 'TSOLIC_PAGTO.NR_PROCESSO'
      Size = 2
    end
    object qry_solic_pagto_TP_DESTINO: TStringField
      FieldName = 'TP_DESTINO'
      Origin = 'TSOLIC_PAGTO.VL_PAGTO'
      Size = 1
    end
    object qry_solic_pagto_VL_DESCONTO: TFloatField
      FieldName = 'VL_DESCONTO'
      Origin = 'TSOLIC_PAGTO.VL_PAGTO'
      DisplayFormat = '#0,.00'
      EditFormat = '#0,.00'
    end
    object qry_solic_pagto_VL_PERC_DESCONTO: TFloatField
      FieldName = 'VL_PERC_DESCONTO'
      Origin = 'TSOLIC_PAGTO.CD_DESTINO'
      DisplayFormat = '#0,.00'
      EditFormat = '#0,.00'
    end
    object qry_solic_pagto_LookBanco: TStringField
      DisplayLabel = 'Banco'
      FieldKind = fkLookup
      FieldName = 'LookBanco'
      LookupDataSet = qry_banco_
      LookupKeyFields = 'CD_BANCO'
      LookupResultField = 'NM_BANCO'
      KeyFields = 'CD_BANCO'
      Size = 40
      Lookup = True
    end
    object qry_solic_pagto_LookFavorecido: TStringField
      DisplayLabel = 'Favorecido'
      FieldKind = fkLookup
      FieldName = 'LookFavorecido'
      LookupDataSet = qry_favorecido_
      LookupKeyFields = 'CD_FAVORECIDO'
      LookupResultField = 'NM_FAVORECIDO'
      KeyFields = 'CD_FAVORECIDO'
      Size = 50
      Lookup = True
    end
    object qry_solic_pagto_LookStatus: TStringField
      DisplayLabel = 'Status'
      FieldKind = fkLookup
      FieldName = 'LookStatus'
      LookupDataSet = qry_status_solic_pagto_
      LookupKeyFields = 'CODIGO'
      LookupResultField = 'DESCRICAO'
      KeyFields = 'CD_STATUS'
      Size = 30
      Lookup = True
    end
    object qry_solic_pagto_LookTpDestino: TStringField
      DisplayLabel = 'Tipo de Destino'
      FieldKind = fkLookup
      FieldName = 'LookTpDestino'
      LookupDataSet = qry_tp_destino_
      LookupKeyFields = 'CD_TP_DESTINO'
      LookupResultField = 'NM_TP_DESTINO'
      KeyFields = 'TP_DESTINO'
      Lookup = True
    end
    object qry_solic_pagto_CalcVlTotal: TFloatField
      DisplayLabel = 'Valor'
      FieldKind = fkCalculated
      FieldName = 'CalcVlTotal'
      DisplayFormat = '#0,.00'
      EditFormat = '#0.00'
      Calculated = True
    end
    object qry_solic_pagto_IN_TED: TStringField
      FieldName = 'IN_TED'
      Origin = 'TSOLIC_PAGTO.CD_STATUS'
      Size = 1
    end
    object qry_solic_pagto_IN_MONTAR: TStringField
      FieldName = 'IN_MONTAR'
      Origin = 'DBBROKER.TSOLIC_PAGTO.IN_MONTAR'
      FixedChar = True
      Size = 1
    end
    object qry_solic_pagto_CD_DESTINO: TStringField
      FieldName = 'CD_DESTINO'
      Origin = 'DBBROKER.TSOLIC_PAGTO.CD_DESTINO'
      FixedChar = True
      Size = 4
    end
    object qry_solic_pagto_CD_STATUS_CHEQUE: TStringField
      FieldName = 'CD_STATUS_CHEQUE'
      Origin = 'DBBROKER.TSOLIC_PAGTO.CD_STATUS_CHEQUE'
      FixedChar = True
      Size = 1
    end
    object qry_solic_pagto_IN_TRANSF_FIN: TStringField
      FieldName = 'IN_TRANSF_FIN'
      Origin = 'DBBROKER.TSOLIC_PAGTO.IN_TRANSF_FIN'
      FixedChar = True
      Size = 1
    end
    object qry_solic_pagto_DT_CANCELAMENTO: TDateTimeField
      FieldName = 'DT_CANCELAMENTO'
      Origin = 'DBBROKER.TSOLIC_PAGTO.DT_CANCELAMENTO'
    end
    object qry_solic_pagto_CD_CANCELADOR: TStringField
      FieldName = 'CD_CANCELADOR'
      Origin = 'DBBROKER.TSOLIC_PAGTO.CD_CANCELADOR'
      FixedChar = True
      Size = 4
    end
    object qry_solic_pagto_CD_MOEDA: TStringField
      FieldName = 'CD_MOEDA'
      Origin = 'DBBROKER.TSOLIC_PAGTO.CD_MOEDA'
      FixedChar = True
      Size = 3
    end
    object qry_solic_pagto_VL_COMPRA: TFloatField
      FieldName = 'VL_COMPRA'
      Origin = 'DBBROKER.TSOLIC_PAGTO.VL_COMPRA'
    end
    object qry_solic_pagto_CD_MOEDA_VENDA: TStringField
      FieldName = 'CD_MOEDA_VENDA'
      Origin = 'DBBROKER.TSOLIC_PAGTO.CD_MOEDA_VENDA'
      FixedChar = True
      Size = 3
    end
    object qry_solic_pagto_VL_VENDA: TFloatField
      FieldName = 'VL_VENDA'
      Origin = 'DBBROKER.TSOLIC_PAGTO.VL_VENDA'
    end
    object qry_solic_pagto_DT_MONTAGEM: TDateTimeField
      FieldName = 'DT_MONTAGEM'
      Origin = 'DBBROKER.TSOLIC_PAGTO.DT_MONTAGEM'
    end
    object qry_solic_pagto_TP_SOLICITACAO: TStringField
      FieldName = 'TP_SOLICITACAO'
      Origin = 'DBBROKER.TSOLIC_PAGTO.TP_SOLICITACAO'
      FixedChar = True
      Size = 1
    end
    object qry_solic_pagto_IN_SELECIONADO: TStringField
      FieldName = 'IN_SELECIONADO'
      Origin = 'DBBROKER.TSOLIC_PAGTO.IN_SELECIONADO'
      FixedChar = True
      Size = 1
    end
    object qry_solic_pagto_NR_RD: TStringField
      FieldName = 'NR_RD'
      Origin = 'DBBROKER.TSOLIC_PAGTO.NR_RD'
      FixedChar = True
      Size = 8
    end
    object qry_solic_pagto_DT_IMPR_TXT: TDateTimeField
      FieldName = 'DT_IMPR_TXT'
      Origin = 'DBBROKER.TSOLIC_PAGTO.DT_IMPR_TXT'
    end
    object qry_solic_pagto_DT_IMPR_RD: TDateTimeField
      FieldName = 'DT_IMPR_RD'
      Origin = 'DBBROKER.TSOLIC_PAGTO.DT_IMPR_RD'
    end
    object qry_solic_pagto_DT_PARIDADE: TDateTimeField
      FieldName = 'DT_PARIDADE'
      Origin = 'DBBROKER.TSOLIC_PAGTO.DT_PARIDADE'
    end
    object qry_solic_pagto_VL_PARIDADE: TFloatField
      FieldName = 'VL_PARIDADE'
      Origin = 'DBBROKER.TSOLIC_PAGTO.VL_PARIDADE'
    end
    object qry_solic_pagto_IN_CONVERSAO: TStringField
      FieldName = 'IN_CONVERSAO'
      Origin = 'DBBROKER.TSOLIC_PAGTO.IN_CONVERSAO'
      FixedChar = True
      Size = 1
    end
    object qry_solic_pagto_VL_COMPRA_EFETIVA: TFloatField
      FieldName = 'VL_COMPRA_EFETIVA'
      Origin = 'DBBROKER.TSOLIC_PAGTO.VL_COMPRA_EFETIVA'
    end
    object qry_solic_pagto_CD_MONTADOR: TStringField
      FieldName = 'CD_MONTADOR'
      Origin = 'DBBROKER.TSOLIC_PAGTO.CD_MONTADOR'
      FixedChar = True
      Size = 4
    end
  end
  object ds_solic_pagto: TDataSource
    DataSet = qry_solic_pagto_
    Left = 55
    Top = 62
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
    Left = 678
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
    Left = 678
    Top = 62
  end
  object qry_di_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT NR_PROCESSO, DT_CALCULO, DT_REGISTRO_DI'
      'FROM TDECLARACAO_IMPORTACAO (NOLOCK)'
      'WHERE NR_PROCESSO = :NR_PROCESSO')
    Left = 774
    Top = 286
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
    Left = 488
    Top = 72
    object StringField3: TStringField
      FieldName = 'NR_ADICAO'
      Size = 3
    end
    object StringField4: TStringField
      FieldName = 'NR_ITEM'
      Size = 3
    end
  end
  object ds_banco: TDataSource
    DataSet = qry_banco_
    Left = 774
    Top = 62
  end
  object qry_banco_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT CD_BANCO, NM_BANCO, NR_DOC'
      'FROM TBANCO (NOLOCK)'
      'WHERE IN_ATIVO = "1" AND CD_BANCO <> '#39#39)
    Left = 776
    Top = 13
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
    object qry_banco_NR_DOC: TStringField
      FieldName = 'NR_DOC'
      Origin = 'DBBROKER.TBANCO.NR_DOC'
      FixedChar = True
      Size = 6
    end
  end
  object ds_favorecido: TDataSource
    DataSet = qry_favorecido_
    Left = 774
    Top = 174
  end
  object qry_favorecido_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT CD_FAVORECIDO, NM_FAVORECIDO, CD_BANCO'
      'FROM TFAVORECIDO (NOLOCK)'
      'WHERE IN_ATIVO = '#39'1'#39' AND CD_FAVORECIDO <> '#39#39)
    Left = 774
    Top = 118
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
    object qry_favorecido_CD_BANCO: TStringField
      FieldName = 'CD_BANCO'
      Origin = 'TFAVORECIDO.CD_FAVORECIDO'
      Size = 3
    end
  end
  object qry_ult_ref_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      
        'SELECT RIGHT( '#39'000'#39' + CONVERT( varchar, ( CONVERT( int, ISNULL( ' +
        'MAX( S.NR_REF ), '#39'000'#39' ) ) + 1 ) ), 3 ) ULT_REF'
      'FROM   TSOLIC_PAGTO S'
      
        'WHERE  CONVERT( datetime, S.DT_PAGTO, 103) = CONVERT( datetime, ' +
        'CONVERT( char(10), GETDATE(), 103 ), 103) AND'
      '       S.NR_REF NOT IN ('#39'T'#39', '#39'D'#39', '#39'C'#39')')
    Left = 390
    Top = 232
    object qry_ult_ref_ULT_REF: TStringField
      FieldName = 'ULT_REF'
      Size = 3
    end
  end
  object qry_solic_fav_: TQuery
    CachedUpdates = True
    AfterInsert = qry_solic_fav_AfterInsert
    AfterEdit = qry_solic_fav_AfterEdit
    AfterPost = qry_solic_fav_AfterPost
    AfterCancel = qry_solic_fav_AfterCancel
    AfterDelete = qry_solic_fav_AfterDelete
    AfterScroll = qry_solic_fav_AfterScroll
    OnCalcFields = qry_solic_fav_CalcFields
    DatabaseName = 'DBBROKER'
    DataSource = ds_grd_fav
    SQL.Strings = (
      'SELECT * '
      'FROM TSOLIC_PAGTO (NOLOCK)'
      'WHERE NR_PROCESSO = :NR_PROCESSO AND'
      'NR_LANCAMENTO = :NR_LANCAMENTO AND'
      'CD_ITEM = :CD_ITEM AND'
      'IN_SOLICITADO = '#39'1'#39' AND ( NR_REF = '#39#39' OR NR_REF IS NULL )')
    UpdateObject = Upd_solic_fav
    Left = 224
    Top = 13
    ParamData = <
      item
        DataType = ftString
        Name = 'NR_PROCESSO'
        ParamType = ptUnknown
        Size = 19
      end
      item
        DataType = ftString
        Name = 'NR_LANCAMENTO'
        ParamType = ptUnknown
        Size = 4
      end
      item
        DataType = ftString
        Name = 'CD_ITEM'
        ParamType = ptUnknown
        Size = 4
      end>
    object qry_solic_fav_NR_PROCESSO: TStringField
      FieldName = 'NR_PROCESSO'
      Origin = 'TSOLIC_PAGTO.NR_PROCESSO'
      Size = 18
    end
    object qry_solic_fav_NR_LANCAMENTO: TStringField
      FieldName = 'NR_LANCAMENTO'
      Origin = 'TSOLIC_PAGTO.DT_PAGTO'
      Size = 3
    end
    object qry_solic_fav_CD_ITEM: TStringField
      FieldName = 'CD_ITEM'
      Origin = 'TSOLIC_PAGTO.CD_ITEM'
      Size = 3
    end
    object qry_solic_fav_VL_PAGTO: TFloatField
      DisplayLabel = 'Valor'
      FieldName = 'VL_PAGTO'
      Origin = 'TSOLIC_PAGTO.VL_PAGTO'
      DisplayFormat = '#0,.00'
      EditFormat = '#0.00'
    end
    object qry_solic_fav_DT_PAGTO: TDateTimeField
      FieldName = 'DT_PAGTO'
      Origin = 'TSOLIC_PAGTO.DT_PAGTO'
    end
    object qry_solic_fav_CD_STATUS: TStringField
      FieldName = 'CD_STATUS'
      Origin = 'TSOLIC_PAGTO.CD_STATUS'
      Size = 2
    end
    object qry_solic_fav_IN_SOLICITADO: TStringField
      FieldName = 'IN_SOLICITADO'
      Origin = 'TSOLIC_PAGTO.IN_SOLICITADO'
      Size = 1
    end
    object qry_solic_fav_IN_RESTITUI: TStringField
      FieldName = 'IN_RESTITUI'
      Origin = 'TSOLIC_PAGTO.IN_RESTITUI'
      Size = 1
    end
    object qry_solic_fav_DT_SOLIC_PAGTO: TDateTimeField
      FieldName = 'DT_SOLIC_PAGTO'
      Origin = 'TSOLIC_PAGTO.DT_SOLIC_PAGTO'
    end
    object qry_solic_fav_HM_SOLIC_PAGTO: TStringField
      FieldName = 'HM_SOLIC_PAGTO'
      Origin = 'TSOLIC_PAGTO.HM_SOLIC_PAGTO'
      Size = 5
    end
    object qry_solic_fav_CD_CALCULO: TStringField
      FieldName = 'CD_CALCULO'
      Origin = 'TSOLIC_PAGTO.CD_CALCULO'
      Size = 3
    end
    object qry_solic_fav_IN_CALCULADO: TStringField
      FieldName = 'IN_CALCULADO'
      Origin = 'TSOLIC_PAGTO.IN_CALCULADO'
      Size = 1
    end
    object qry_solic_fav_CD_FAVORECIDO: TStringField
      FieldName = 'CD_FAVORECIDO'
      Origin = 'TSOLIC_PAGTO.CD_FAVORECIDO'
      Size = 5
    end
    object qry_solic_fav_CD_BANCO: TStringField
      FieldName = 'CD_BANCO'
      Origin = 'TSOLIC_PAGTO.CD_BANCO'
      Size = 3
    end
    object qry_solic_fav_NR_DOCTO: TStringField
      FieldName = 'NR_DOCTO'
      Origin = 'TSOLIC_PAGTO.NR_DOCTO'
      Size = 10
    end
    object qry_solic_fav_NR_REF: TStringField
      FieldName = 'NR_REF'
      Origin = 'TSOLIC_PAGTO.NR_REF'
      Size = 3
    end
    object qry_solic_fav_CD_USUARIO_SOLIC: TStringField
      FieldName = 'CD_USUARIO_SOLIC'
      Origin = 'TSOLIC_PAGTO.CD_USUARIO_SOLIC'
      Size = 4
    end
    object qry_solic_fav_CD_USUARIO_MONTA: TStringField
      FieldName = 'CD_USUARIO_MONTA'
      Origin = 'TSOLIC_PAGTO.CD_USUARIO_MONTA'
      Size = 4
    end
    object qry_solic_fav_TP_DESTINO: TStringField
      FieldName = 'TP_DESTINO'
      Origin = 'TSOLIC_PAGTO.VL_PAGTO'
      Size = 1
    end
    object qry_solic_fav_VL_DESCONTO: TFloatField
      FieldName = 'VL_DESCONTO'
      Origin = 'TSOLIC_PAGTO.VL_PAGTO'
      DisplayFormat = '#0,.00'
      EditFormat = '#0.00'
    end
    object qry_solic_fav_VL_PERC_DESCONTO: TFloatField
      FieldName = 'VL_PERC_DESCONTO'
      Origin = 'TSOLIC_PAGTO.CD_DESTINO'
      DisplayFormat = '#0,.00'
      EditFormat = '#0.00'
    end
    object qry_solic_fav_LookItem: TStringField
      DisplayLabel = 'Item'
      FieldKind = fkLookup
      FieldName = 'LookItem'
      LookupDataSet = qry_item_
      LookupKeyFields = 'CD_ITEM'
      LookupResultField = 'NM_ITEM'
      KeyFields = 'CD_ITEM'
      Size = 50
      Lookup = True
    end
    object qry_solic_fav_LookStatus: TStringField
      DisplayLabel = 'Status'
      FieldKind = fkLookup
      FieldName = 'LookStatus'
      LookupDataSet = qry_status_solic_pagto_
      LookupKeyFields = 'CODIGO'
      LookupResultField = 'DESCRICAO'
      KeyFields = 'CD_STATUS'
      Size = 30
      Lookup = True
    end
    object qry_solic_fav_LookTpDestino: TStringField
      DisplayLabel = 'Tipo de Destino'
      FieldKind = fkLookup
      FieldName = 'LookTpDestino'
      LookupDataSet = qry_tp_destino_
      LookupKeyFields = 'CD_TP_DESTINO'
      LookupResultField = 'NM_TP_DESTINO'
      KeyFields = 'TP_DESTINO'
      Lookup = True
    end
    object qry_solic_fav_CalcNrProcesso: TStringField
      DisplayLabel = 'N'#186' Processo'
      FieldKind = fkCalculated
      FieldName = 'CalcNrProcesso'
      Size = 14
      Calculated = True
    end
    object qry_solic_fav_CalcVlTotal: TFloatField
      DisplayLabel = 'Valor'
      FieldKind = fkCalculated
      FieldName = 'CalcVlTotal'
      DisplayFormat = '#0,.00'
      EditFormat = '#0,.00'
      Calculated = True
    end
    object qry_solic_fav_LookBanco: TStringField
      DisplayLabel = 'Banco'
      FieldKind = fkLookup
      FieldName = 'LookBanco'
      LookupDataSet = qry_banco_
      LookupKeyFields = 'CD_BANCO'
      LookupResultField = 'NM_BANCO'
      KeyFields = 'CD_BANCO'
      Size = 40
      Lookup = True
    end
    object qry_solic_fav_IN_TED: TStringField
      FieldName = 'IN_TED'
      Origin = 'TSOLIC_PAGTO.CD_STATUS'
      Size = 1
    end
    object qry_solic_fav_CD_DESTINO: TStringField
      FieldName = 'CD_DESTINO'
      Origin = 'DBBROKER.TSOLIC_PAGTO.CD_DESTINO'
      FixedChar = True
      Size = 4
    end
    object qry_solic_fav_CD_STATUS_CHEQUE: TStringField
      FieldName = 'CD_STATUS_CHEQUE'
      Origin = 'DBBROKER.TSOLIC_PAGTO.CD_STATUS_CHEQUE'
      FixedChar = True
      Size = 1
    end
    object qry_solic_fav_IN_TRANSF_FIN: TStringField
      FieldName = 'IN_TRANSF_FIN'
      Origin = 'DBBROKER.TSOLIC_PAGTO.IN_TRANSF_FIN'
      FixedChar = True
      Size = 1
    end
    object qry_solic_fav_DT_CANCELAMENTO: TDateTimeField
      FieldName = 'DT_CANCELAMENTO'
      Origin = 'DBBROKER.TSOLIC_PAGTO.DT_CANCELAMENTO'
    end
    object qry_solic_fav_CD_CANCELADOR: TStringField
      FieldName = 'CD_CANCELADOR'
      Origin = 'DBBROKER.TSOLIC_PAGTO.CD_CANCELADOR'
      FixedChar = True
      Size = 4
    end
    object qry_solic_fav_CD_MOEDA: TStringField
      FieldName = 'CD_MOEDA'
      Origin = 'DBBROKER.TSOLIC_PAGTO.CD_MOEDA'
      FixedChar = True
      Size = 3
    end
    object qry_solic_fav_VL_COMPRA: TFloatField
      FieldName = 'VL_COMPRA'
      Origin = 'DBBROKER.TSOLIC_PAGTO.VL_COMPRA'
    end
    object qry_solic_fav_CD_MOEDA_VENDA: TStringField
      FieldName = 'CD_MOEDA_VENDA'
      Origin = 'DBBROKER.TSOLIC_PAGTO.CD_MOEDA_VENDA'
      FixedChar = True
      Size = 3
    end
    object qry_solic_fav_VL_VENDA: TFloatField
      FieldName = 'VL_VENDA'
      Origin = 'DBBROKER.TSOLIC_PAGTO.VL_VENDA'
    end
    object qry_solic_fav_DT_MONTAGEM: TDateTimeField
      FieldName = 'DT_MONTAGEM'
      Origin = 'DBBROKER.TSOLIC_PAGTO.DT_MONTAGEM'
    end
    object qry_solic_fav_TP_SOLICITACAO: TStringField
      FieldName = 'TP_SOLICITACAO'
      Origin = 'DBBROKER.TSOLIC_PAGTO.TP_SOLICITACAO'
      FixedChar = True
      Size = 1
    end
    object qry_solic_fav_IN_SELECIONADO: TStringField
      FieldName = 'IN_SELECIONADO'
      Origin = 'DBBROKER.TSOLIC_PAGTO.IN_SELECIONADO'
      FixedChar = True
      Size = 1
    end
    object qry_solic_fav_NR_RD: TStringField
      FieldName = 'NR_RD'
      Origin = 'DBBROKER.TSOLIC_PAGTO.NR_RD'
      FixedChar = True
      Size = 8
    end
    object qry_solic_fav_DT_IMPR_TXT: TDateTimeField
      FieldName = 'DT_IMPR_TXT'
      Origin = 'DBBROKER.TSOLIC_PAGTO.DT_IMPR_TXT'
    end
    object qry_solic_fav_DT_IMPR_RD: TDateTimeField
      FieldName = 'DT_IMPR_RD'
      Origin = 'DBBROKER.TSOLIC_PAGTO.DT_IMPR_RD'
    end
    object qry_solic_fav_DT_PARIDADE: TDateTimeField
      FieldName = 'DT_PARIDADE'
      Origin = 'DBBROKER.TSOLIC_PAGTO.DT_PARIDADE'
    end
    object qry_solic_fav_VL_PARIDADE: TFloatField
      FieldName = 'VL_PARIDADE'
      Origin = 'DBBROKER.TSOLIC_PAGTO.VL_PARIDADE'
    end
    object qry_solic_fav_IN_CONVERSAO: TStringField
      FieldName = 'IN_CONVERSAO'
      Origin = 'DBBROKER.TSOLIC_PAGTO.IN_CONVERSAO'
      FixedChar = True
      Size = 1
    end
    object qry_solic_fav_VL_COMPRA_EFETIVA: TFloatField
      FieldName = 'VL_COMPRA_EFETIVA'
      Origin = 'DBBROKER.TSOLIC_PAGTO.VL_COMPRA_EFETIVA'
    end
    object qry_solic_fav_IN_MONTAR: TStringField
      FieldName = 'IN_MONTAR'
      Origin = 'DBBROKER.TSOLIC_PAGTO.IN_MONTAR'
      FixedChar = True
      Size = 1
    end
    object qry_solic_fav_CD_MONTADOR: TStringField
      FieldName = 'CD_MONTADOR'
      Origin = 'DBBROKER.TSOLIC_PAGTO.CD_MONTADOR'
      FixedChar = True
      Size = 4
    end
  end
  object ds_solic_fav: TDataSource
    DataSet = qry_solic_fav_
    Left = 224
    Top = 62
  end
  object qry_ref_: TQuery
    AfterScroll = qry_ref_AfterScroll
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      
        'SELECT P.CD_UNID_NEG, S.NR_REF, SUM( ISNULL( S.VL_PAGTO, 0 ) - I' +
        'SNULL( S.VL_DESCONTO, 0 ) ) VL_PAGTO, MAX( S.DT_PAGTO ) DT_PAGTO' +
        ','
      
        '       MAX( S.CD_FAVORECIDO ) CD_FAVORECIDO, S.CD_BANCO, S.NR_DO' +
        'CTO, S.CD_STATUS_CHEQUE'
      'FROM   TSOLIC_PAGTO S (NOLOCK), TPROCESSO P (NOLOCK)'
      'WHERE  ISNULL( S.CD_USUARIO_MONTA, '#39#39' ) <> '#39#39' AND'
      '       ISNULL( S.NR_REF, '#39#39' ) <> '#39#39' AND'
      '       ISNULL( S.CD_FAVORECIDO, '#39#39' ) <> '#39#39' AND'
      '       S.NR_PROCESSO = P.NR_PROCESSO AND'
      '       S.DT_PAGTO = :DT_PAGTO AND'
      '       P.CD_UNID_NEG = :CD_UNID_NEG AND'
      '       S.CD_STATUS NOT IN ( '#39'4'#39', '#39'12'#39', '#39'13'#39', '#39'14'#39', '#39'15'#39', '#39'17'#39' )'
      
        'GROUP BY P.CD_UNID_NEG, S.NR_REF, S.CD_BANCO, S.CD_FAVORECIDO, S' +
        '.NR_DOCTO, S.CD_STATUS_CHEQUE')
    Left = 587
    Top = 232
    ParamData = <
      item
        DataType = ftDate
        Name = 'DT_PAGTO'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'CD_UNID_NEG'
        ParamType = ptUnknown
      end>
    object qry_ref_CD_UNID_NEG: TStringField
      FieldName = 'CD_UNID_NEG'
      Size = 2
    end
    object qry_ref_NR_REF: TStringField
      DisplayLabel = 'Ref.'
      FieldName = 'NR_REF'
      Size = 3
    end
    object qry_ref_DT_PAGTO: TDateTimeField
      DisplayLabel = 'Dt. Pagto'
      FieldName = 'DT_PAGTO'
    end
    object qry_ref_CD_BANCO: TStringField
      FieldName = 'CD_BANCO'
      Size = 3
    end
    object qry_ref_CD_FAVORECIDO: TStringField
      FieldName = 'CD_FAVORECIDO'
      Size = 5
    end
    object qry_ref_LookBanco: TStringField
      DisplayLabel = 'Banco'
      FieldKind = fkLookup
      FieldName = 'LookBanco'
      LookupDataSet = qry_banco_
      LookupKeyFields = 'CD_BANCO'
      LookupResultField = 'NM_BANCO'
      KeyFields = 'CD_BANCO'
      Size = 40
      Lookup = True
    end
    object qry_ref_LookFavorecido: TStringField
      DisplayLabel = 'Favorecido'
      FieldKind = fkLookup
      FieldName = 'LookFavorecido'
      LookupDataSet = qry_co_fav_
      LookupKeyFields = 'CD_FAVORECIDO'
      LookupResultField = 'NM_FAVORECIDO'
      KeyFields = 'CD_FAVORECIDO'
      Size = 50
      Lookup = True
    end
    object qry_ref_VL_PAGTO: TFloatField
      DisplayLabel = 'Valor'
      FieldName = 'VL_PAGTO'
      DisplayFormat = '#0,.00'
      EditFormat = '#0.00'
    end
    object qry_ref_NR_DOCTO: TStringField
      DisplayLabel = 'N'#186' Docto. '
      FieldName = 'NR_DOCTO'
      Size = 10
    end
    object qry_ref_CD_STATUS_CHEQUE: TStringField
      FieldName = 'CD_STATUS_CHEQUE'
      Size = 1
    end
    object qry_ref_LookStatusCheque: TStringField
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
  object ds_ref: TDataSource
    DataSet = qry_ref_
    Left = 587
    Top = 286
  end
  object qry_ref_itens_: TQuery
    OnCalcFields = qry_ref_itens_CalcFields
    DatabaseName = 'DBBROKER'
    DataSource = ds_ref
    SQL.Strings = (
      
        'SELECT P.CD_UNID_NEG, S.NR_PROCESSO, S.NR_LANCAMENTO, S.NR_REF, ' +
        'S.CD_ITEM, ( ISNULL( S.VL_PAGTO, 0 ) - ISNULL( S.VL_DESCONTO, 0 ' +
        ') ) VL_PAGTO, S.DT_PAGTO, S.CD_STATUS, S.TP_DESTINO, S.IN_MONTAR' +
        ', S.CD_USUARIO_MONTA'
      'FROM   TSOLIC_PAGTO S (NOLOCK), TPROCESSO P (NOLOCK)'
      'WHERE  S.NR_PROCESSO = P.NR_PROCESSO AND'
      '       P.CD_UNID_NEG = :CD_UNID_NEG AND'
      '       DT_PAGTO = :DT_PAGTO AND'
      '       NR_REF = :NR_REF AND'
      '       CD_BANCO = :CD_BANCO AND'
      '       CD_FAVORECIDO = :CD_FAVORECIDO AND'
      '       NR_DOCTO = :NR_DOCTO AND'
      '       ISNULL( NR_REF, '#39#39' ) <> '#39#39' AND'
      '       ISNULL( CD_FAVORECIDO, '#39#39' ) <> '#39#39)
    Left = 677
    Top = 231
    ParamData = <
      item
        DataType = ftString
        Name = 'CD_UNID_NEG'
        ParamType = ptUnknown
        Size = 3
      end
      item
        DataType = ftDateTime
        Name = 'DT_PAGTO'
        ParamType = ptUnknown
        Size = 8
      end
      item
        DataType = ftString
        Name = 'NR_REF'
        ParamType = ptUnknown
        Size = 4
      end
      item
        DataType = ftString
        Name = 'CD_BANCO'
        ParamType = ptUnknown
        Size = 4
      end
      item
        DataType = ftString
        Name = 'CD_FAVORECIDO'
        ParamType = ptUnknown
        Size = 6
      end
      item
        DataType = ftString
        Name = 'NR_DOCTO'
        ParamType = ptUnknown
        Size = 11
      end>
    object qry_ref_itens_CD_UNID_NEG: TStringField
      FieldName = 'CD_UNID_NEG'
      Size = 2
    end
    object qry_ref_itens_NR_PROCESSO: TStringField
      FieldName = 'NR_PROCESSO'
      Size = 18
    end
    object qry_ref_itens_NR_LANCAMENTO: TStringField
      DisplayLabel = 'N'#186' Lanc.'
      FieldName = 'NR_LANCAMENTO'
      Size = 3
    end
    object qry_ref_itens_NR_REF: TStringField
      FieldName = 'NR_REF'
      Size = 3
    end
    object qry_ref_itens_VL_PAGTO: TFloatField
      DisplayLabel = 'Valor'
      FieldName = 'VL_PAGTO'
      DisplayFormat = '#0,.00'
      EditFormat = '#0.00'
    end
    object qry_ref_itens_DT_PAGTO: TDateTimeField
      FieldName = 'DT_PAGTO'
    end
    object qry_ref_itens_CD_STATUS: TStringField
      FieldName = 'CD_STATUS'
      Size = 2
    end
    object qry_ref_itens_LookItem: TStringField
      DisplayLabel = 'Item'
      FieldKind = fkLookup
      FieldName = 'LookItem'
      LookupDataSet = qry_item_
      LookupKeyFields = 'CD_ITEM'
      LookupResultField = 'NM_ITEM'
      KeyFields = 'CD_ITEM'
      Size = 40
      Lookup = True
    end
    object qry_ref_itens_CalcNrProcesso: TStringField
      DisplayLabel = 'N'#186' Processo'
      FieldKind = fkCalculated
      FieldName = 'CalcNrProcesso'
      Size = 18
      Calculated = True
    end
    object qry_ref_itens_TP_DESTINO: TStringField
      FieldName = 'TP_DESTINO'
      Size = 1
    end
    object qry_ref_itens_LookTpDestino: TStringField
      DisplayLabel = 'Tipo de Destino'
      FieldKind = fkLookup
      FieldName = 'LookTpDestino'
      LookupDataSet = qry_tp_destino_
      LookupKeyFields = 'CD_TP_DESTINO'
      LookupResultField = 'NM_TP_DESTINO'
      KeyFields = 'TP_DESTINO'
      Lookup = True
    end
    object qry_ref_itens_CD_ITEM: TStringField
      FieldName = 'CD_ITEM'
      Size = 3
    end
    object qry_ref_itens_LookStatus: TStringField
      DisplayLabel = 'Status'
      FieldKind = fkLookup
      FieldName = 'LookStatus'
      LookupDataSet = qry_status_solic_pagto_
      LookupKeyFields = 'CODIGO'
      LookupResultField = 'DESCRICAO'
      KeyFields = 'CD_STATUS'
      Size = 30
      Lookup = True
    end
    object qry_ref_itens_IN_MONTAR: TStringField
      FieldName = 'IN_MONTAR'
      FixedChar = True
      Size = 1
    end
    object qry_ref_itens_calcMONTAR: TStringField
      FieldKind = fkCalculated
      FieldName = 'calcMONTAR'
      Size = 1
      Calculated = True
    end
    object qry_ref_itens_CD_USUARIO_MONTA: TStringField
      FieldName = 'CD_USUARIO_MONTA'
      FixedChar = True
      Size = 4
    end
  end
  object ds_ref_itens: TDataSource
    DataSet = qry_ref_itens_
    Left = 678
    Top = 285
  end
  object ds_tp_destino: TDataSource
    DataSet = qry_tp_destino_
    Left = 678
    Top = 174
  end
  object qry_tp_destino_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT CD_TP_DESTINO, NM_TP_DESTINO'
      'FROM TTP_DESTINO (NOLOCK)')
    Left = 678
    Top = 118
    object qry_tp_destino_CD_TP_DESTINO: TStringField
      FieldName = 'CD_TP_DESTINO'
      Origin = 'TTP_DESTINO.CD_TP_DESTINO'
      Size = 1
    end
    object qry_tp_destino_NM_TP_DESTINO: TStringField
      FieldName = 'NM_TP_DESTINO'
      Origin = 'TTP_DESTINO.NM_TP_DESTINO'
    end
  end
  object qry_grd_pagto_: TQuery
    AfterScroll = qry_grd_pagto_AfterScroll
    OnCalcFields = qry_grd_pagto_CalcFields
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      
        'SELECT S.NR_PROCESSO, S.NR_LANCAMENTO, S.CD_ITEM, ( S.VL_PAGTO -' +
        ' S.VL_DESCONTO ) VL_PAGTO, S.CD_FAVORECIDO, S.CD_STATUS,'
      '       S.TP_DESTINO, ISNULL( N.VL_RECEBIDO, 0 ) VL_RECEBIDO,'
      '       S.IN_MONTAR, S.CD_USUARIO_MONTA'
      'FROM   TSOLIC_PAGTO S (NOLOCK)'
      
        '       LEFT JOIN TNUMERARIO_NOTIFICA_ITEM N (NOLOCK) ON ( S.NR_P' +
        'ROCESSO = N.NR_PROCESSO AND S.CD_ITEM = N.CD_ITEM )'
      'WHERE  S.CD_STATUS NOT IN ( '#39'4'#39', '#39'7'#39', '#39'17'#39', '#39'18'#39' ) AND'
      '       S.NR_PROCESSO = :NR_PROCESSO AND'
      
        '       S.IN_SOLICITADO = '#39'1'#39' AND ( S.NR_REF = '#39#39' OR S.NR_REF IS ' +
        'NULL ) AND'
      '       ISNULL( S.NR_REF, '#39#39' ) NOT IN ('#39'D'#39', '#39'C'#39', '#39'T'#39')'
      'ORDER BY S.NR_PROCESSO, S.CD_ITEM')
    Left = 143
    Top = 15
    ParamData = <
      item
        DataType = ftString
        Name = 'NR_PROCESSO'
        ParamType = ptUnknown
      end>
    object qry_grd_pagto_NR_PROCESSO: TStringField
      FieldName = 'NR_PROCESSO'
      Origin = 'TSOLIC_PAGTO.NR_PROCESSO'
      Size = 18
    end
    object qry_grd_pagto_NR_LANCAMENTO: TStringField
      FieldName = 'NR_LANCAMENTO'
      Size = 3
    end
    object qry_grd_pagto_CD_ITEM: TStringField
      FieldName = 'CD_ITEM'
      Origin = 'TSOLIC_PAGTO.CD_ITEM'
      Size = 3
    end
    object qry_grd_pagto_VL_PAGTO: TFloatField
      DisplayLabel = 'Valor'
      FieldName = 'VL_PAGTO'
      Origin = 'TSOLIC_PAGTO.VL_PAGTO'
      DisplayFormat = '#0,.00'
      EditFormat = '#0.00'
    end
    object StringField9: TStringField
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
    object StringField10: TStringField
      DisplayLabel = 'N'#186' Processo'
      FieldKind = fkCalculated
      FieldName = 'CalcNrProcesso'
      Size = 18
      Calculated = True
    end
    object StringField30: TStringField
      DisplayLabel = 'Status'
      FieldKind = fkLookup
      FieldName = 'LookStatus'
      LookupDataSet = qry_status_solic_pagto_
      LookupKeyFields = 'CODIGO'
      LookupResultField = 'DESCRICAO'
      KeyFields = 'CD_STATUS'
      Size = 30
      Lookup = True
    end
    object StringField31: TStringField
      FieldName = 'CD_STATUS'
      Origin = 'TSOLIC_PAGTO.NR_PROCESSO'
      Size = 2
    end
    object StringField33: TStringField
      DisplayLabel = 'Tipo de Destino'
      FieldKind = fkLookup
      FieldName = 'LookTpDestino'
      LookupDataSet = qry_tp_destino_
      LookupKeyFields = 'CD_TP_DESTINO'
      LookupResultField = 'NM_TP_DESTINO'
      KeyFields = 'TP_DESTINO'
      Lookup = True
    end
    object qry_grd_pagto_VL_RECEBIDO: TFloatField
      DisplayLabel = 'Vl. Recebido'
      FieldName = 'VL_RECEBIDO'
      Origin = 'TSOLIC_PAGTO.VL_PAGTO'
      DisplayFormat = '#0,.00'
    end
    object qry_grd_pagto_CD_FAVORECIDO: TStringField
      FieldName = 'CD_FAVORECIDO'
      Size = 5
    end
    object qry_grd_pagto_LookFavorecido: TStringField
      DisplayLabel = 'Favorecido'
      FieldKind = fkLookup
      FieldName = 'LookFavorecido'
      LookupDataSet = qry_favorecido_
      LookupKeyFields = 'CD_FAVORECIDO'
      LookupResultField = 'NM_FAVORECIDO'
      KeyFields = 'CD_FAVORECIDO'
      Size = 50
      Lookup = True
    end
    object qry_grd_pagto_TP_DESTINO: TStringField
      FieldName = 'TP_DESTINO'
      Size = 1
    end
    object qry_grd_pagto_IN_MONTAR: TStringField
      FieldName = 'IN_MONTAR'
      FixedChar = True
      Size = 1
    end
    object qry_grd_pagto_calcMontar: TStringField
      FieldKind = fkCalculated
      FieldName = 'calcMontar'
      Size = 1
      Calculated = True
    end
    object qry_grd_pagto_CD_USUARIO_MONTA: TStringField
      FieldName = 'CD_USUARIO_MONTA'
      FixedChar = True
      Size = 4
    end
  end
  object ds_grd_pagto: TDataSource
    DataSet = qry_grd_pagto_
    Left = 142
    Top = 62
  end
  object qry_grd_fav_: TQuery
    AfterScroll = qry_grd_fav_AfterScroll
    OnCalcFields = qry_grd_fav_CalcFields
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      
        'SELECT S.NR_PROCESSO, S.NR_LANCAMENTO, S.CD_ITEM, S.CD_DESTINO, ' +
        'S.CD_FAVORECIDO, S.CD_BANCO,'
      
        '       ( S.VL_PAGTO - S.VL_DESCONTO ) VL_PAGTO, S.CD_STATUS, S.D' +
        'T_PAGTO, S.NR_DOCTO, S.TP_DESTINO,'
      '       ISNULL( N.VL_RECEBIDO, 0 ) VL_RECEBIDO,'
      '       S.IN_MONTAR, S.CD_USUARIO_MONTA'
      
        'FROM   TSOLIC_PAGTO S (NOLOCK), TNUMERARIO_SALDO_POR_ITEM N (NOL' +
        'OCK), TPROCESSO P (NOLOCK)'
      'WHERE  S.NR_PROCESSO *= N.NR_PROCESSO AND'
      '       S.CD_ITEM *= N.CD_ITEM AND'
      '       S.NR_PROCESSO = P.NR_PROCESSO AND'
      '       S.CD_STATUS NOT IN ( '#39'4'#39', '#39'7'#39', '#39'17'#39', '#39'18'#39' ) AND'
      '       S.CD_FAVORECIDO = :CD_FAVORECIDO AND'
      '       P.CD_UNID_NEG = :CD_UNID_NEG AND'
      '       P.CD_PRODUTO = :CD_PRODUTO AND'
      
        '       ( ( S.CD_USUARIO_SOLIC = :CD_USUARIO ) OR ( :CD_USUARIO =' +
        ' '#39#39' ) ) AND'
      
        '       S.IN_SOLICITADO = '#39'1'#39' AND ( S.NR_REF = '#39#39' OR S.NR_REF IS ' +
        'NULL )'
      'ORDER BY S.NR_PROCESSO, S.CD_ITEM')
    Left = 317
    Top = 13
    ParamData = <
      item
        DataType = ftString
        Name = 'CD_FAVORECIDO'
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
        Name = 'CD_USUARIO'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'CD_USUARIO'
        ParamType = ptUnknown
      end>
    object qry_grd_fav_NR_PROCESSO: TStringField
      FieldName = 'NR_PROCESSO'
      Size = 18
    end
    object qry_grd_fav_NR_LANCAMENTO: TStringField
      FieldName = 'NR_LANCAMENTO'
      Size = 3
    end
    object qry_grd_fav_CD_ITEM: TStringField
      FieldName = 'CD_ITEM'
      Origin = 'TSOLIC_PAGTO.CD_ITEM'
      Size = 3
    end
    object qry_grd_fav_VL_PAGTO: TFloatField
      DisplayLabel = 'Valor'
      FieldName = 'VL_PAGTO'
      Origin = 'TSOLIC_PAGTO.VL_PAGTO'
      DisplayFormat = '#0,.00'
      EditFormat = '#0.00'
    end
    object StringField36: TStringField
      FieldName = 'CD_DESTINO'
      Origin = 'TSOLIC_PAGTO.CD_DESTINO'
      Size = 4
    end
    object StringField37: TStringField
      FieldName = 'CD_STATUS'
      Origin = 'TSOLIC_PAGTO.CD_STATUS'
      Size = 2
    end
    object StringField43: TStringField
      FieldName = 'CD_FAVORECIDO'
      Origin = 'TSOLIC_PAGTO.CD_FAVORECIDO'
      Size = 5
    end
    object StringField44: TStringField
      FieldName = 'CD_BANCO'
      Origin = 'TSOLIC_PAGTO.CD_BANCO'
      Size = 3
    end
    object StringField45: TStringField
      FieldName = 'NR_DOCTO'
      Origin = 'TSOLIC_PAGTO.NR_DOCTO'
      Size = 10
    end
    object StringField49: TStringField
      DisplayLabel = 'Item'
      FieldKind = fkLookup
      FieldName = 'LookItem'
      LookupDataSet = qry_item_
      LookupKeyFields = 'CD_ITEM'
      LookupResultField = 'NM_ITEM'
      KeyFields = 'CD_ITEM'
      Size = 50
      Lookup = True
    end
    object StringField50: TStringField
      DisplayLabel = 'Status'
      FieldKind = fkLookup
      FieldName = 'LookStatus'
      LookupDataSet = qry_status_solic_pagto_
      LookupKeyFields = 'CODIGO'
      LookupResultField = 'DESCRICAO'
      KeyFields = 'CD_STATUS'
      Size = 30
      Lookup = True
    end
    object StringField52: TStringField
      DisplayLabel = 'Tipo de Destino'
      FieldKind = fkLookup
      FieldName = 'LookTpDestino'
      LookupDataSet = qry_tp_destino_
      LookupKeyFields = 'CD_TP_DESTINO'
      LookupResultField = 'NM_TP_DESTINO'
      KeyFields = 'TP_DESTINO'
      Lookup = True
    end
    object qry_grd_fav_DT_PAGTO: TDateTimeField
      FieldName = 'DT_PAGTO'
    end
    object qry_grd_fav_VL_RECEBIDO: TFloatField
      DisplayLabel = 'Vl. Recebido'
      FieldName = 'VL_RECEBIDO'
      DisplayFormat = '#0,.00'
      EditFormat = '#0.00'
    end
    object qry_grd_fav_CalcNrProcesso: TStringField
      DisplayLabel = 'N'#186' Processo'
      FieldKind = fkCalculated
      FieldName = 'CalcNrProcesso'
      Size = 14
      Calculated = True
    end
    object qry_grd_fav_TP_DESTINO: TStringField
      FieldName = 'TP_DESTINO'
      Size = 1
    end
    object qry_grd_fav_IN_MONTAR: TStringField
      FieldName = 'IN_MONTAR'
      FixedChar = True
      Size = 1
    end
    object qry_grd_fav_calcMontar: TStringField
      FieldKind = fkCalculated
      FieldName = 'calcMontar'
      Size = 1
      Calculated = True
    end
    object qry_grd_fav_CD_USUARIO_MONTA: TStringField
      FieldName = 'CD_USUARIO_MONTA'
      FixedChar = True
      Size = 4
    end
  end
  object ds_grd_fav: TDataSource
    DataSet = qry_grd_fav_
    Left = 317
    Top = 62
  end
  object qry_solic_item_: TQuery
    DatabaseName = 'DBBROKER'
    DataSource = ds_ref_itens
    RequestLive = True
    SQL.Strings = (
      
        'SELECT NR_PROCESSO, NR_LANCAMENTO, CD_ITEM, CD_STATUS, VL_PAGTO,' +
        ' VL_DESCONTO, DT_PAGTO'
      'FROM   TSOLIC_PAGTO (NOLOCK)'
      'WHERE  NR_PROCESSO = :NR_PROCESSO AND'
      '       NR_LANCAMENTO = :NR_LANCAMENTO AND'
      '       CD_ITEM = :CD_ITEM')
    Left = 774
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
  object sp_atualiza_utilizado: TStoredProc
    DatabaseName = 'DBBROKER'
    StoredProcName = 'dbo.sp_atualiza_utilizado'
    Left = 488
    Top = 16
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
    object StringField8: TStringField
      FieldName = 'NR_ADICAO'
      Size = 3
    end
    object StringField11: TStringField
      FieldName = 'NR_ITEM'
      Size = 3
    end
  end
  object sp_distribui_pagto: TStoredProc
    DatabaseName = 'DBBROKER'
    StoredProcName = 'dbo.sp_distribui_pagto'
    Left = 488
    Top = 185
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
  object sp_cancela_item_solic_pagto: TStoredProc
    DatabaseName = 'DBBROKER'
    StoredProcName = 'dbo.sp_cancela_item_solic_pagto'
    Left = 488
    Top = 241
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
    Left = 488
    Top = 298
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
  object qry_pagtoData_: TQuery
    OnCalcFields = qry_pagtoData_CalcFields
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      
        'SELECT S.NR_PROCESSO, S.NR_LANCAMENTO, S.CD_ITEM, S.CD_DESTINO, ' +
        'S.CD_FAVORECIDO, S.CD_BANCO,'
      
        '       ( S.VL_PAGTO - S.VL_DESCONTO ) VL_PAGTO, S.CD_STATUS, S.D' +
        'T_PAGTO, S.NR_DOCTO, S.TP_DESTINO,'
      '       ISNULL( N.VL_RECEBIDO, 0 ) VL_RECEBIDO'
      
        'FROM   TSOLIC_PAGTO S (NOLOCK), TNUMERARIO_SALDO_POR_ITEM N (NOL' +
        'OCK), TPROCESSO P (NOLOCK)'
      'WHERE  S.NR_PROCESSO = N.NR_PROCESSO AND'
      '       S.CD_ITEM = N.CD_ITEM AND'
      '       S.NR_PROCESSO = P.NR_PROCESSO AND'
      '       S.CD_STATUS NOT IN ( '#39'4'#39', '#39'7'#39', '#39'17'#39', '#39'18'#39' ) AND'
      '       P.CD_UNID_NEG = :CD_UNID_NEG AND'
      '       S.DT_SOLIC_PAGTO = :DT_SOLIC_PAGTO AND'
      
        '       S.IN_SOLICITADO = '#39'1'#39' AND ( S.NR_REF = '#39#39' OR S.NR_REF IS ' +
        'NULL )')
    Left = 56
    Top = 344
    ParamData = <
      item
        DataType = ftString
        Name = 'CD_UNID_NEG'
        ParamType = ptUnknown
      end
      item
        DataType = ftDateTime
        Name = 'DT_SOLIC_PAGTO'
        ParamType = ptUnknown
      end>
    object qry_pagtoData_NR_PROCESSO: TStringField
      FieldName = 'NR_PROCESSO'
      Size = 18
    end
    object qry_pagtoData_NR_LANCAMENTO: TStringField
      FieldName = 'NR_LANCAMENTO'
      Size = 3
    end
    object qry_pagtoData_CD_ITEM: TStringField
      FieldName = 'CD_ITEM'
      Size = 3
    end
    object qry_pagtoData_CD_DESTINO: TStringField
      FieldName = 'CD_DESTINO'
      Size = 4
    end
    object qry_pagtoData_CD_FAVORECIDO: TStringField
      FieldName = 'CD_FAVORECIDO'
      Size = 5
    end
    object qry_pagtoData_CD_BANCO: TStringField
      FieldName = 'CD_BANCO'
      Size = 3
    end
    object qry_pagtoData_VL_PAGTO: TFloatField
      FieldName = 'VL_PAGTO'
      DisplayFormat = '#0,.00'
      EditFormat = '#0.00'
    end
    object qry_pagtoData_CD_STATUS: TStringField
      FieldName = 'CD_STATUS'
      Size = 2
    end
    object qry_pagtoData_DT_PAGTO: TDateTimeField
      FieldName = 'DT_PAGTO'
    end
    object qry_pagtoData_NR_DOCTO: TStringField
      FieldName = 'NR_DOCTO'
      Size = 10
    end
    object qry_pagtoData_TP_DESTINO: TStringField
      FieldName = 'TP_DESTINO'
      Size = 1
    end
    object qry_pagtoData_VL_RECEBIDO: TFloatField
      FieldName = 'VL_RECEBIDO'
      DisplayFormat = '#0,.00'
      EditFormat = '#0.00'
    end
    object qry_pagtoData_calcNrProcesso: TStringField
      FieldKind = fkCalculated
      FieldName = 'calcNrProcesso'
      Size = 14
      Calculated = True
    end
    object qry_pagtoData_Look_Favorecido: TStringField
      FieldKind = fkLookup
      FieldName = 'Look_Favorecido'
      LookupDataSet = qry_co_fav_
      LookupKeyFields = 'CD_FAVORECIDO'
      LookupResultField = 'NM_FAVORECIDO'
      KeyFields = 'CD_FAVORECIDO'
      Size = 50
      Lookup = True
    end
    object qry_pagtoData_Look_Item: TStringField
      FieldKind = fkLookup
      FieldName = 'Look_Item'
      LookupDataSet = qry_item_
      LookupKeyFields = 'CD_ITEM'
      LookupResultField = 'NM_ITEM'
      KeyFields = 'CD_ITEM'
      Size = 50
      Lookup = True
    end
    object qry_pagtoData_Look_TpDestino: TStringField
      FieldKind = fkLookup
      FieldName = 'Look_TpDestino'
      LookupDataSet = qry_tp_destino_
      LookupKeyFields = 'CD_TP_DESTINO'
      LookupResultField = 'NM_TP_DESTINO'
      KeyFields = 'TP_DESTINO'
      Lookup = True
    end
    object qry_pagtoData_Look_Status: TStringField
      FieldKind = fkLookup
      FieldName = 'Look_Status'
      LookupDataSet = qry_status_solic_pagto_
      LookupKeyFields = 'CODIGO'
      LookupResultField = 'DESCRICAO'
      KeyFields = 'CD_STATUS'
      Size = 30
      Lookup = True
    end
  end
  object dsgridPagtoData_: TDataSource
    DataSet = qry_pagtoData_
    Left = 149
    Top = 344
  end
  object qry_co_fav_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT CD_FAVORECIDO, NM_FAVORECIDO'
      'FROM TFAVORECIDO (NOLOCK)'
      'WHERE IN_ATIVO = '#39'1'#39' ')
    Left = 582
    Top = 62
    object StringField7: TStringField
      FieldName = 'CD_FAVORECIDO'
      Origin = 'TFAVORECIDO.CD_FAVORECIDO'
      Size = 5
    end
    object StringField12: TStringField
      FieldName = 'NM_FAVORECIDO'
      Origin = 'TFAVORECIDO.NM_FAVORECIDO'
      Size = 50
    end
  end
  object qry_status_cheque_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT *'
      'FROM TSTATUS_CHEQUE (NOLOCK)')
    Left = 582
    Top = 13
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
  object qry_usuario_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT CD_USUARIO, AP_USUARIO'
      'FROM TUSUARIO (NOLOCK)'
      'WHERE IN_ATIVO = '#39'1'#39' AND CD_USUARIO <> '#39#39)
    Left = 774
    Top = 344
    object qry_usuario_CD_USUARIO: TStringField
      FieldName = 'CD_USUARIO'
      Origin = 'TUSUARIO.CD_USUARIO'
      Size = 4
    end
    object qry_usuario_AP_USUARIO: TStringField
      FieldName = 'AP_USUARIO'
      Origin = 'TUSUARIO.CD_USUARIO'
      Size = 15
    end
  end
  object qry_soma_fav_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT SUM ( S.VL_PAGTO - S.VL_DESCONTO ) VL_TOTAL'
      
        'FROM   TSOLIC_PAGTO S (NOLOCK), TNUMERARIO_SALDO_POR_ITEM N (NOL' +
        'OCK), TPROCESSO P (NOLOCK)'
      'WHERE  S.NR_PROCESSO = N.NR_PROCESSO AND'
      '       S.NR_PROCESSO = P.NR_PROCESSO AND'
      '       S.CD_ITEM = N.CD_ITEM AND'
      '       S.CD_STATUS NOT IN ( '#39'4'#39', '#39'7'#39', '#39'17'#39', '#39'18'#39' ) AND'
      '       S.CD_FAVORECIDO = :CD_FAVORECIDO AND'
      '       P.CD_UNID_NEG = :CD_UNID_NEG AND'
      '       P.CD_PRODUTO = :CD_PRODUTO AND'
      
        '       ( ( S.CD_USUARIO_SOLIC = :CD_USUARIO ) OR ( :CD_USUARIO =' +
        ' '#39#39' ) ) AND'
      
        '       S.IN_SOLICITADO = '#39'1'#39' AND ( S.NR_REF = '#39#39' OR S.NR_REF IS ' +
        'NULL )')
    Left = 391
    Top = 13
    ParamData = <
      item
        DataType = ftString
        Name = 'CD_FAVORECIDO'
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
        Name = 'CD_USUARIO'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'CD_USUARIO'
        ParamType = ptUnknown
      end>
    object qry_soma_fav_VL_TOTAL: TFloatField
      FieldName = 'VL_TOTAL'
      DisplayFormat = '#0,.00'
      EditFormat = '#0.00'
    end
  end
  object ds_soma_fav: TDataSource
    DataSet = qry_soma_fav_
    Left = 389
    Top = 62
  end
  object qry_soma_proc_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT SUM ( S.VL_PAGTO - S.VL_DESCONTO ) VL_TOTAL'
      
        'FROM   TSOLIC_PAGTO S (NOLOCK), TNUMERARIO_SALDO_POR_ITEM N (NOL' +
        'OCK)'
      'WHERE  S.NR_PROCESSO = N.NR_PROCESSO AND'
      '       S.CD_ITEM = N.CD_ITEM AND'
      '       S.CD_STATUS NOT IN ( '#39'4'#39', '#39'7'#39', '#39'17'#39', '#39'18'#39' ) AND'
      '       S.NR_PROCESSO = :NR_PROCESSO AND'
      
        '       S.IN_SOLICITADO = '#39'1'#39' AND ( S.NR_REF = '#39#39' OR S.NR_REF IS ' +
        'NULL ) AND'
      '       S.NR_REF NOT IN ('#39'D'#39', '#39'C'#39', '#39'T'#39')')
    Left = 391
    Top = 118
    ParamData = <
      item
        DataType = ftString
        Name = 'NR_PROCESSO'
        ParamType = ptUnknown
      end>
    object FloatField2: TFloatField
      FieldName = 'VL_TOTAL'
      DisplayFormat = '#0,.00'
      EditFormat = '#0.00'
    end
  end
  object ds_soma_proc: TDataSource
    DataSet = qry_soma_proc_
    Left = 389
    Top = 174
  end
  object sp_cancela_item_solic_pagamento: TStoredProc
    DatabaseName = 'DBBROKER'
    StoredProcName = 'dbo.sp_cancela_item_solic_pagamento'
    Left = 488
    Top = 354
    ParamData = <
      item
        DataType = ftInteger
        Name = 'Result'
        ParamType = ptResult
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
  end
  object tblLote: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT NR_REF FROM TULTIMO_LOTE')
    Left = 277
    Top = 356
  end
  object upd_solic_pagto: TUpdateSQL
    ModifySQL.Strings = (
      'update TSOLIC_PAGTO'
      'set'
      '  NR_PROCESSO = :NR_PROCESSO,'
      '  NR_LANCAMENTO = :NR_LANCAMENTO,'
      '  CD_ITEM = :CD_ITEM,'
      '  VL_PAGTO = :VL_PAGTO,'
      '  CD_DESTINO = :CD_DESTINO,'
      '  DT_PAGTO = :DT_PAGTO,'
      '  CD_STATUS = :CD_STATUS,'
      '  IN_SOLICITADO = :IN_SOLICITADO,'
      '  IN_RESTITUI = :IN_RESTITUI,'
      '  DT_SOLIC_PAGTO = :DT_SOLIC_PAGTO,'
      '  HM_SOLIC_PAGTO = :HM_SOLIC_PAGTO,'
      '  CD_CALCULO = :CD_CALCULO,'
      '  IN_CALCULADO = :IN_CALCULADO,'
      '  CD_FAVORECIDO = :CD_FAVORECIDO,'
      '  CD_BANCO = :CD_BANCO,'
      '  NR_DOCTO = :NR_DOCTO,'
      '  NR_REF = :NR_REF,'
      '  CD_USUARIO_SOLIC = :CD_USUARIO_SOLIC,'
      '  CD_USUARIO_MONTA = :CD_USUARIO_MONTA,'
      '  CD_STATUS_CHEQUE = :CD_STATUS_CHEQUE,'
      '  TP_DESTINO = :TP_DESTINO,'
      '  IN_TRANSF_FIN = :IN_TRANSF_FIN,'
      '  VL_DESCONTO = :VL_DESCONTO,'
      '  VL_PERC_DESCONTO = :VL_PERC_DESCONTO,'
      '  DT_CANCELAMENTO = :DT_CANCELAMENTO,'
      '  CD_CANCELADOR = :CD_CANCELADOR,'
      '  IN_TED = :IN_TED,'
      '  CD_MOEDA = :CD_MOEDA,'
      '  VL_COMPRA = :VL_COMPRA,'
      '  CD_MOEDA_VENDA = :CD_MOEDA_VENDA,'
      '  VL_VENDA = :VL_VENDA,'
      '  DT_MONTAGEM = :DT_MONTAGEM,'
      '  TP_SOLICITACAO = :TP_SOLICITACAO,'
      '  IN_SELECIONADO = :IN_SELECIONADO,'
      '  NR_RD = :NR_RD,'
      '  DT_IMPR_TXT = :DT_IMPR_TXT,'
      '  DT_IMPR_RD = :DT_IMPR_RD,'
      '  DT_PARIDADE = :DT_PARIDADE,'
      '  VL_PARIDADE = :VL_PARIDADE,'
      '  IN_CONVERSAO = :IN_CONVERSAO,'
      '  VL_COMPRA_EFETIVA = :VL_COMPRA_EFETIVA,'
      '  IN_MONTAR = :IN_MONTAR,'
      '  CD_MONTADOR = :CD_MONTADOR'
      'where'
      '  NR_PROCESSO = :OLD_NR_PROCESSO and'
      '  NR_LANCAMENTO = :OLD_NR_LANCAMENTO and'
      '  CD_ITEM = :OLD_CD_ITEM')
    InsertSQL.Strings = (
      'insert into TSOLIC_PAGTO'
      '  (NR_PROCESSO, NR_LANCAMENTO, CD_ITEM, VL_PAGTO, CD_DESTINO, '
      'DT_PAGTO, '
      '   CD_STATUS, IN_SOLICITADO, IN_RESTITUI, DT_SOLIC_PAGTO, '
      'HM_SOLIC_PAGTO, '
      '   CD_CALCULO, IN_CALCULADO, CD_FAVORECIDO, CD_BANCO, NR_DOCTO, '
      'NR_REF, '
      '   CD_USUARIO_SOLIC, CD_USUARIO_MONTA, CD_STATUS_CHEQUE, '
      'TP_DESTINO, IN_TRANSF_FIN, '
      '   VL_DESCONTO, VL_PERC_DESCONTO, DT_CANCELAMENTO, '
      'CD_CANCELADOR, IN_TED, '
      '   CD_MOEDA, VL_COMPRA, CD_MOEDA_VENDA, VL_VENDA, DT_MONTAGEM, '
      'TP_SOLICITACAO, '
      '   IN_SELECIONADO, NR_RD, DT_IMPR_TXT, DT_IMPR_RD, DT_PARIDADE, '
      'VL_PARIDADE, '
      '   IN_CONVERSAO, VL_COMPRA_EFETIVA, IN_MONTAR, CD_MONTADOR)'
      'values'
      
        '  (:NR_PROCESSO, :NR_LANCAMENTO, :CD_ITEM, :VL_PAGTO, :CD_DESTIN' +
        'O, '
      ':DT_PAGTO, '
      '   :CD_STATUS, :IN_SOLICITADO, :IN_RESTITUI, :DT_SOLIC_PAGTO, '
      ':HM_SOLIC_PAGTO, '
      
        '   :CD_CALCULO, :IN_CALCULADO, :CD_FAVORECIDO, :CD_BANCO, :NR_DO' +
        'CTO, '
      ':NR_REF, '
      '   :CD_USUARIO_SOLIC, :CD_USUARIO_MONTA, :CD_STATUS_CHEQUE, '
      ':TP_DESTINO, '
      '   :IN_TRANSF_FIN, :VL_DESCONTO, :VL_PERC_DESCONTO, '
      ':DT_CANCELAMENTO, :CD_CANCELADOR, '
      '   :IN_TED, :CD_MOEDA, :VL_COMPRA, :CD_MOEDA_VENDA, :VL_VENDA, '
      ':DT_MONTAGEM, '
      '   :TP_SOLICITACAO, :IN_SELECIONADO, :NR_RD, :DT_IMPR_TXT, '
      ':DT_IMPR_RD, '
      
        '   :DT_PARIDADE, :VL_PARIDADE, :IN_CONVERSAO, :VL_COMPRA_EFETIVA' +
        ', '
      ':IN_MONTAR, '
      '   :CD_MONTADOR)')
    DeleteSQL.Strings = (
      'delete from TSOLIC_PAGTO'
      'where'
      '  NR_PROCESSO = :OLD_NR_PROCESSO and'
      '  NR_LANCAMENTO = :OLD_NR_LANCAMENTO and'
      '  CD_ITEM = :OLD_CD_ITEM')
    Left = 41
    Top = 2
  end
  object Upd_solic_fav: TUpdateSQL
    ModifySQL.Strings = (
      'update TSOLIC_PAGTO'
      'set'
      '  NR_PROCESSO = :NR_PROCESSO,'
      '  NR_LANCAMENTO = :NR_LANCAMENTO,'
      '  CD_ITEM = :CD_ITEM,'
      '  VL_PAGTO = :VL_PAGTO,'
      '  CD_DESTINO = :CD_DESTINO,'
      '  DT_PAGTO = :DT_PAGTO,'
      '  CD_STATUS = :CD_STATUS,'
      '  IN_SOLICITADO = :IN_SOLICITADO,'
      '  IN_RESTITUI = :IN_RESTITUI,'
      '  DT_SOLIC_PAGTO = :DT_SOLIC_PAGTO,'
      '  HM_SOLIC_PAGTO = :HM_SOLIC_PAGTO,'
      '  CD_CALCULO = :CD_CALCULO,'
      '  IN_CALCULADO = :IN_CALCULADO,'
      '  CD_FAVORECIDO = :CD_FAVORECIDO,'
      '  CD_BANCO = :CD_BANCO,'
      '  NR_DOCTO = :NR_DOCTO,'
      '  NR_REF = :NR_REF,'
      '  CD_USUARIO_SOLIC = :CD_USUARIO_SOLIC,'
      '  CD_USUARIO_MONTA = :CD_USUARIO_MONTA,'
      '  CD_STATUS_CHEQUE = :CD_STATUS_CHEQUE,'
      '  TP_DESTINO = :TP_DESTINO,'
      '  IN_TRANSF_FIN = :IN_TRANSF_FIN,'
      '  VL_DESCONTO = :VL_DESCONTO,'
      '  VL_PERC_DESCONTO = :VL_PERC_DESCONTO,'
      '  DT_CANCELAMENTO = :DT_CANCELAMENTO,'
      '  CD_CANCELADOR = :CD_CANCELADOR,'
      '  IN_TED = :IN_TED,'
      '  CD_MOEDA = :CD_MOEDA,'
      '  VL_COMPRA = :VL_COMPRA,'
      '  CD_MOEDA_VENDA = :CD_MOEDA_VENDA,'
      '  VL_VENDA = :VL_VENDA,'
      '  DT_MONTAGEM = :DT_MONTAGEM,'
      '  TP_SOLICITACAO = :TP_SOLICITACAO,'
      '  IN_SELECIONADO = :IN_SELECIONADO,'
      '  NR_RD = :NR_RD,'
      '  DT_IMPR_TXT = :DT_IMPR_TXT,'
      '  DT_IMPR_RD = :DT_IMPR_RD,'
      '  DT_PARIDADE = :DT_PARIDADE,'
      '  VL_PARIDADE = :VL_PARIDADE,'
      '  IN_CONVERSAO = :IN_CONVERSAO,'
      '  VL_COMPRA_EFETIVA = :VL_COMPRA_EFETIVA,'
      '  IN_MONTAR = :IN_MONTAR,'
      '  CD_MONTADOR = :CD_MONTADOR'
      'where'
      '  NR_PROCESSO = :OLD_NR_PROCESSO and'
      '  NR_LANCAMENTO = :OLD_NR_LANCAMENTO and'
      '  CD_ITEM = :OLD_CD_ITEM')
    InsertSQL.Strings = (
      'insert into TSOLIC_PAGTO'
      '  (NR_PROCESSO, NR_LANCAMENTO, CD_ITEM, VL_PAGTO, CD_DESTINO, '
      'DT_PAGTO, '
      '   CD_STATUS, IN_SOLICITADO, IN_RESTITUI, DT_SOLIC_PAGTO, '
      'HM_SOLIC_PAGTO, '
      '   CD_CALCULO, IN_CALCULADO, CD_FAVORECIDO, CD_BANCO, NR_DOCTO, '
      'NR_REF, '
      '   CD_USUARIO_SOLIC, CD_USUARIO_MONTA, CD_STATUS_CHEQUE, '
      'TP_DESTINO, IN_TRANSF_FIN, '
      '   VL_DESCONTO, VL_PERC_DESCONTO, DT_CANCELAMENTO, '
      'CD_CANCELADOR, IN_TED, '
      '   CD_MOEDA, VL_COMPRA, CD_MOEDA_VENDA, VL_VENDA, DT_MONTAGEM, '
      'TP_SOLICITACAO, '
      '   IN_SELECIONADO, NR_RD, DT_IMPR_TXT, DT_IMPR_RD, DT_PARIDADE, '
      'VL_PARIDADE, '
      '   IN_CONVERSAO, VL_COMPRA_EFETIVA, IN_MONTAR, CD_MONTADOR)'
      'values'
      
        '  (:NR_PROCESSO, :NR_LANCAMENTO, :CD_ITEM, :VL_PAGTO, :CD_DESTIN' +
        'O, '
      ':DT_PAGTO, '
      '   :CD_STATUS, :IN_SOLICITADO, :IN_RESTITUI, :DT_SOLIC_PAGTO, '
      ':HM_SOLIC_PAGTO, '
      
        '   :CD_CALCULO, :IN_CALCULADO, :CD_FAVORECIDO, :CD_BANCO, :NR_DO' +
        'CTO, '
      ':NR_REF, '
      '   :CD_USUARIO_SOLIC, :CD_USUARIO_MONTA, :CD_STATUS_CHEQUE, '
      ':TP_DESTINO, '
      '   :IN_TRANSF_FIN, :VL_DESCONTO, :VL_PERC_DESCONTO, '
      ':DT_CANCELAMENTO, :CD_CANCELADOR, '
      '   :IN_TED, :CD_MOEDA, :VL_COMPRA, :CD_MOEDA_VENDA, :VL_VENDA, '
      ':DT_MONTAGEM, '
      '   :TP_SOLICITACAO, :IN_SELECIONADO, :NR_RD, :DT_IMPR_TXT, '
      ':DT_IMPR_RD, '
      
        '   :DT_PARIDADE, :VL_PARIDADE, :IN_CONVERSAO, :VL_COMPRA_EFETIVA' +
        ', '
      ':IN_MONTAR, '
      '   :CD_MONTADOR)')
    DeleteSQL.Strings = (
      'delete from TSOLIC_PAGTO'
      'where'
      '  NR_PROCESSO = :OLD_NR_PROCESSO and'
      '  NR_LANCAMENTO = :OLD_NR_LANCAMENTO and'
      '  CD_ITEM = :OLD_CD_ITEM')
    Left = 249
    Top = 2
  end
end
