object datm_solic_pagto: Tdatm_solic_pagto
  OldCreateOrder = True
  Left = 212
  Top = 107
  Height = 375
  Width = 760
  object ds_item: TDataSource
    DataSet = qry_item_
    Left = 140
    Top = 62
  end
  object qry_item_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      
        'SELECT I.CD_ITEM, I.NM_ITEM, I.CD_TIPO_ITEM, T.IN_SOLIC_CHQ, I.I' +
        'N_ITEM_DI, I.IN_SOLIC_PAGTO'
      'FROM TITEM I,'
      '            TTIPO_ITEM T'
      'WHERE I.CD_TIPO_ITEM = T.CD_TIPO_ITEM AND'
      '              I.IN_ATIVO = '#39'1'#39)
    Left = 140
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
    object qry_item_IN_SOLIC_PAGTO: TStringField
      FieldName = 'IN_SOLIC_PAGTO'
      Origin = 'TITEM.CD_ITEM'
      Size = 1
    end
  end
  object sp_proc_itens_solic_pagto: TStoredProc
    DatabaseName = 'DBBROKER'
    StoredProcName = 'dbo.sp_proc_itens_solic_pagto'
    Left = 434
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
    Left = 140
    Top = 286
  end
  object qry_emp_nac_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT CD_EMPRESA, NM_EMPRESA'
      'FROM TEMPRESA_NAC')
    Left = 140
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
    Left = 228
    Top = 286
  end
  object qry_unid_neg_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT CD_UNID_NEG, NM_UNID_NEG'
      'FROM TUNID_NEG'
      'WHERE CD_UNID_NEG <> '#39#39)
    Left = 228
    Top = 232
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
    Left = 327
    Top = 286
  end
  object qry_produto_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT CD_PRODUTO, NM_PRODUTO'
      'FROM TPRODUTO'
      'WHERE CD_PRODUTO <> '#39#39)
    Left = 327
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
    Left = 140
    Top = 176
  end
  object qry_servico_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT CD_SERVICO, NM_SERVICO'
      'FROM TSERVICO')
    Left = 140
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
      'FROM TPROCESSO'
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
    Left = 330
    Top = 117
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
    Left = 330
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
    Left = 228
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
    Left = 228
    Top = 176
  end
  object qry_solic_pagto_: TQuery
    AfterInsert = qry_solic_pagto_AfterInsert
    AfterEdit = qry_solic_pagto_AfterEdit
    AfterPost = qry_solic_pagto_AfterPost
    AfterCancel = qry_solic_pagto_AfterCancel
    AfterScroll = qry_solic_pagto_AfterScroll
    OnCalcFields = qry_solic_pagto_CalcFields
    DatabaseName = 'DBBROKER'
    RequestLive = True
    SQL.Strings = (
      'SELECT *'
      'FROM TSOLIC_PAGTO '
      'WHERE NR_PROCESSO = :NR_PROCESSO'
      '')
    Left = 55
    Top = 13
    ParamData = <
      item
        DataType = ftString
        Name = 'NR_PROCESSO'
        ParamType = ptUnknown
      end>
    object qry_solic_pagto_NR_PROCESSO: TStringField
      FieldName = 'NR_PROCESSO'
      Origin = 'TSOLIC_PAGTO.NR_PROCESSO'
      Size = 18
    end
    object qry_solic_pagto_NR_LANCAMENTO: TStringField
      DisplayLabel = 'N'#186' Lanc.'
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
    object qry_solic_pagto_IN_SOLICITADO: TStringField
      FieldName = 'IN_SOLICITADO'
      Origin = 'TSOLIC_PAGTO.NR_PROCESSO'
      Size = 1
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
    object qry_solic_pagto_DT_SOLIC_PAGTO: TDateTimeField
      FieldName = 'DT_SOLIC_PAGTO'
      Origin = 'TSOLIC_PAGTO.CD_ITEM'
    end
    object qry_solic_pagto_HM_SOLIC_PAGTO: TStringField
      FieldName = 'HM_SOLIC_PAGTO'
      Origin = 'TSOLIC_PAGTO.CD_ITEM'
      Size = 5
    end
    object qry_solic_pagto_CD_FAVORECIDO: TStringField
      FieldName = 'CD_FAVORECIDO'
      Origin = 'TSOLIC_PAGTO.CD_DESTINO'
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
    object qry_solic_pagto_NR_DOCTO: TStringField
      FieldName = 'NR_DOCTO'
      Origin = 'TSOLIC_PAGTO.CD_DESTINO'
      Size = 10
    end
    object qry_solic_pagto_NR_REF: TStringField
      FieldName = 'NR_REF'
      Origin = 'TSOLIC_PAGTO.DT_PAGTO'
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
      EditFormat = '#0.00'
    end
    object qry_solic_pagto_VL_PERC_DESCONTO: TFloatField
      FieldName = 'VL_PERC_DESCONTO'
      Origin = 'TSOLIC_PAGTO.CD_DESTINO'
      DisplayFormat = '#0,.00'
      EditFormat = '#0.00'
    end
    object qry_solic_pagto_CD_BANCO: TStringField
      FieldName = 'CD_BANCO'
      Origin = 'TSOLIC_PAGTO.NR_PROCESSO'
      Size = 3
    end
    object qry_solic_pagto_CalcVlTotal: TFloatField
      DisplayLabel = 'Valor'
      FieldKind = fkCalculated
      FieldName = 'CalcVlTotal'
      DisplayFormat = '#0,.00'
      EditFormat = '#0.00'
      Calculated = True
    end
    object qry_solic_pagto_CalcNrProcesso: TStringField
      DisplayLabel = 'N'#186' Processo'
      FieldKind = fkCalculated
      FieldName = 'CalcNrProcesso'
      Size = 18
      Calculated = True
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
    object qry_solic_pagto_LookStatus: TStringField
      DisplayLabel = 'Status'
      DisplayWidth = 30
      FieldKind = fkLookup
      FieldName = 'LookStatus'
      LookupDataSet = qry_status_solic_pagto_
      LookupKeyFields = 'CODIGO'
      LookupResultField = 'DESCRICAO'
      KeyFields = 'CD_STATUS'
      Size = 30
      Lookup = True
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
    object qry_solic_pagto_LookCalculo: TStringField
      FieldKind = fkLookup
      FieldName = 'LookCalculo'
      LookupDataSet = qry_calculo_
      LookupKeyFields = 'CD_CALCULO'
      LookupResultField = 'NM_CALCULO'
      KeyFields = 'CD_CALCULO'
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
    object qry_solic_pagto_VL_PAGTO: TFloatField
      FieldName = 'VL_PAGTO'
      Origin = 'TSOLIC_PAGTO.NR_PROCESSO'
      DisplayFormat = '#0,.00'
      EditFormat = '#0.00'
    end
    object qry_solic_pagto_LookSolicPagto: TStringField
      FieldKind = fkLookup
      FieldName = 'LookSolicPagto'
      LookupDataSet = qry_item_
      LookupKeyFields = 'CD_ITEM'
      LookupResultField = 'IN_SOLIC_PAGTO'
      KeyFields = 'CD_ITEM'
      Size = 1
      Lookup = True
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
    object qry_solic_pagto_IN_SELECIONADO: TStringField
      FieldName = 'IN_SELECIONADO'
      Origin = 'DBBROKER.TSOLIC_PAGTO.IN_SELECIONADO'
      FixedChar = True
      Size = 1
    end
    object qry_solic_pagto_DT_PARIDADE: TDateTimeField
      FieldName = 'DT_PARIDADE'
      Origin = 'DBBROKER.TSOLIC_PAGTO.DT_PARIDADE'
      OnChange = qry_solic_pagto_DT_PARIDADEChange
      EditMask = '!99/99/0000;1;_'
    end
    object qry_solic_pagto_VL_PARIDADE: TFloatField
      FieldName = 'VL_PARIDADE'
      Origin = 'DBBROKER.TSOLIC_PAGTO.VL_PARIDADE'
      OnChange = qry_solic_pagto_VL_PARIDADEChange
      DisplayFormat = '#0,.00'
      EditFormat = '#0.00'
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
      OnChange = qry_solic_pagto_VL_COMPRA_EFETIVAChange
      DisplayFormat = '#0,.00'
      EditFormat = '#0.00'
    end
    object qry_solic_pagto_LookItemAG: TStringField
      FieldKind = fkCalculated
      FieldName = 'LookItemAG'
      Size = 30
      Calculated = True
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
      DisplayFormat = '#0,.00'
      EditFormat = '#0.00'
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
      DisplayFormat = '#0,.00'
      EditFormat = '#0.00'
    end
    object qry_solic_pagto_calcAPMoeda: TStringField
      FieldKind = fkCalculated
      FieldName = 'calcAPMoeda'
      Size = 50
      Calculated = True
    end
  end
  object ds_solic_pagto: TDataSource
    DataSet = qry_solic_pagto_
    OnDataChange = ds_solic_pagtoDataChange
    Left = 55
    Top = 62
  end
  object ds_favorecido: TDataSource
    DataSet = qry_favorecido_
    Left = 228
    Top = 62
  end
  object qry_favorecido_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT CD_FAVORECIDO, NM_FAVORECIDO, CD_BANCO'
      'FROM TFAVORECIDO'
      'WHERE IN_ATIVO = '#39'1'#39)
    Left = 228
    Top = 13
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
      Origin = 'TFAVORECIDO.CD_BANCO'
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
      'FROM TCALCULO')
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
  object sp_atz_solic_pagto: TStoredProc
    DatabaseName = 'DBBROKER'
    StoredProcName = 'dbo.sp_atz_solic_pagto'
    Left = 434
    Top = 283
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
    Left = 332
    Top = 12
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
    Left = 331
    Top = 61
  end
  object qry_di_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT NR_PROCESSO, DT_CALCULO, DT_REGISTRO_DI'
      'FROM TDECLARACAO_IMPORTACAO'
      'WHERE NR_PROCESSO = :NR_PROCESSO')
    Left = 434
    Top = 119
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
    object qry_di_DT_REGISTRO_DI: TStringField
      FieldName = 'DT_REGISTRO_DI'
      Origin = 'TDECLARACAO_IMPORTACAO.NR_PROCESSO'
      Size = 8
    end
  end
  object sp_di_calculo_: TStoredProc
    DatabaseName = 'DBBROKER'
    StoredProcName = 'dbo.sp_di_calculo'
    Left = 434
    Top = 178
    object StringField3: TStringField
      FieldName = 'NR_ADICAO'
      Size = 3
    end
    object StringField4: TStringField
      FieldName = 'NR_ITEM'
      Size = 3
    end
  end
  object ds_tp_destino: TDataSource
    DataSet = qry_tp_destino_
    Left = 434
    Top = 62
  end
  object qry_tp_destino_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT CD_TP_DESTINO, NM_TP_DESTINO'
      'FROM TTP_DESTINO')
    Left = 434
    Top = 13
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
  object sp_proc_pagto: TStoredProc
    DatabaseName = 'DBBROKER'
    StoredProcName = 'dbo.sp_proc_pagto'
    Left = 554
    Top = 178
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
        Name = '@cd_calculo'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = '@vl_calculado'
        ParamType = ptOutput
        Value = 0.000000000000000000
      end>
  end
  object sp_cancela_item_solic_pagto: TStoredProc
    DatabaseName = 'DBBROKER'
    StoredProcName = 'dbo.sp_cancela_item_solic_pagto'
    Left = 554
    Top = 122
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
  end
  object qry_ult_lanc_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      
        'SELECT ISNULL( RIGHT( '#39'000'#39' + CONVERT( varchar(3), (CONVERT( int' +
        ', MAX( ISNULL( NR_LANCAMENTO, '#39'000'#39' ) ) ) + 1 ) ), 3 ), '#39'001'#39' ) ' +
        'NR_LANCAMENTO'
      'FROM   TSOLIC_PAGTO'
      'WHERE  NR_PROCESSO = :NR_PROCESSO')
    Left = 554
    Top = 16
    ParamData = <
      item
        DataType = ftString
        Name = 'NR_PROCESSO'
        ParamType = ptUnknown
      end>
    object qry_ult_lanc_NR_LANCAMENTO: TStringField
      FieldName = 'NR_LANCAMENTO'
      Size = 3
    end
  end
  object qry_tp_item_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT CD_TIPO_ITEM, IN_ITEM_DI'
      'FROM TITEM (NOLOCK)'
      'WHERE CD_ITEM = :CD_ITEM')
    Left = 552
    Top = 72
    ParamData = <
      item
        DataType = ftString
        Name = 'CD_ITEM'
        ParamType = ptInput
      end>
    object qry_tp_item_CD_TIPO_ITEM: TStringField
      FieldName = 'CD_TIPO_ITEM'
      Origin = 'DBBROKER.TITEM.CD_TIPO_ITEM'
      FixedChar = True
      Size = 1
    end
    object qry_tp_item_IN_ITEM_DI: TStringField
      FieldName = 'IN_ITEM_DI'
      Origin = 'DBBROKER.TITEM.IN_ITEM_DI'
      FixedChar = True
      Size = 1
    end
  end
  object sp_solic_pagto_ag: TStoredProc
    DatabaseName = 'DBBROKER'
    StoredProcName = 'dbo.sp_solic_pagto_ag'
    Left = 555
    Top = 231
    ParamData = <
      item
        DataType = ftInteger
        Name = 'Result'
        ParamType = ptResult
      end
      item
        DataType = ftString
        Name = '@NR_PROCESSO'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = '@NR_LANC'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = '@tp_processo'
        ParamType = ptInput
      end>
  end
  object sp_proc_solic_pagto_ag: TStoredProc
    DatabaseName = 'DBBROKER'
    StoredProcName = 'dbo.sp_proc_solic_pagto_ag'
    Left = 554
    Top = 282
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
      end>
  end
  object sp_pagto_faturamento: TStoredProc
    DatabaseName = 'DBBROKER'
    StoredProcName = 'dbo.sp_pagto_faturamento'
    Left = 656
    Top = 16
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
      end>
  end
end
