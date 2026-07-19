object datm_notificacao: Tdatm_notificacao
  OldCreateOrder = False
  Left = 46
  Top = 138
  Height = 451
  Width = 987
  object qry_traz_default_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      
        'SELECT UH.CD_USUARIO, TP.NM_PRODUTO, UH.CD_UNID_NEG, TUN.NM_UNID' +
        '_NEG, UH.CD_PRODUTO, UH.IN_ATIVO, UH.IN_DEFAULT,TU.NM_USUARIO  F' +
        'ROM TUSUARIO_HABILITACAO UH (NOLOCK)'
      'LEFT JOIN TUSUARIO TU ON(TU.CD_USUARIO = UH.CD_USUARIO)'
      'LEFT JOIN TPRODUTO TP ON(TP.CD_PRODUTO = UH.CD_PRODUTO)'
      
        'LEFT JOIN TUNID_NEG TUN ON (TUN.CD_UNID_NEG = UH.CD_UNID_NEG)WHE' +
        'RE UH.CD_USUARIO=:CD_USUARIO AND'
      'UH.IN_DEFAULT='#39'1'#39
      ' ')
    Left = 56
    Top = 16
    ParamData = <
      item
        DataType = ftFixedChar
        Name = 'CD_USUARIO'
        ParamType = ptUnknown
      end>
    object qry_traz_default_CD_USUARIO: TStringField
      FieldName = 'CD_USUARIO'
      FixedChar = True
      Size = 4
    end
    object qry_traz_default_NM_PRODUTO: TStringField
      FieldName = 'NM_PRODUTO'
      FixedChar = True
      Size = 40
    end
    object qry_traz_default_CD_UNID_NEG: TStringField
      FieldName = 'CD_UNID_NEG'
      FixedChar = True
      Size = 2
    end
    object qry_traz_default_NM_UNID_NEG: TStringField
      FieldName = 'NM_UNID_NEG'
      FixedChar = True
      Size = 50
    end
    object qry_traz_default_CD_PRODUTO: TStringField
      FieldName = 'CD_PRODUTO'
      FixedChar = True
      Size = 2
    end
    object qry_traz_default_IN_ATIVO: TStringField
      FieldName = 'IN_ATIVO'
      FixedChar = True
      Size = 1
    end
    object qry_traz_default_IN_DEFAULT: TStringField
      FieldName = 'IN_DEFAULT'
      FixedChar = True
      Size = 1
    end
    object qry_traz_default_NM_USUARIO: TStringField
      FieldName = 'NM_USUARIO'
      FixedChar = True
      Size = 50
    end
  end
  object qry_pesquisa_: TQuery
    DatabaseName = 'DBBROKER'
    Left = 56
    Top = 72
  end
  object qry_processo_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      
        'SELECT TP.NR_PROCESSO, TP.CD_CLIENTE,  TP.CD_UNID_NEG, TP.CD_PRO' +
        'DUTO, TP.NR_PROCESSO_VINC,'
      
        ' (SELECT TE.NM_EMPRESA FROM TEMPRESA_NAC TE (NOLOCK) WHERE TE.CD' +
        '_EMPRESA = TP.CD_CLIENTE)NM_EMPRESA,'
      ' TP.CD_SERVICO, TS.NM_SERVICO, TS.TP_SERVICO'
      '  FROM TPROCESSO TP (NOLOCK)'
      '  LEFT JOIN TSERVICO TS ON (TS.CD_SERVICO = TP.CD_SERVICO)'
      '  WHERE TP.NR_PROCESSO =:NR_PROCESSO  AND TP.IN_LIBERADO = '#39'1'#39
      ''
      ''
      ''
      ' '
      ' '
      ' '
      ' ')
    Left = 168
    Top = 16
    ParamData = <
      item
        DataType = ftFixedChar
        Name = 'NR_PROCESSO'
        ParamType = ptUnknown
      end>
    object qry_processo_NR_PROCESSO: TStringField
      FieldName = 'NR_PROCESSO'
      FixedChar = True
      Size = 18
    end
    object qry_processo_CD_CLIENTE: TStringField
      FieldName = 'CD_CLIENTE'
      FixedChar = True
      Size = 5
    end
    object qry_processo_NM_EMPRESA: TStringField
      FieldName = 'NM_EMPRESA'
      FixedChar = True
      Size = 50
    end
    object qry_processo_CD_SERVICO: TStringField
      FieldName = 'CD_SERVICO'
      FixedChar = True
      Size = 3
    end
    object qry_processo_NM_SERVICO: TStringField
      FieldName = 'NM_SERVICO'
      FixedChar = True
      Size = 50
    end
    object qry_processo_TP_SERVICO: TStringField
      FieldName = 'TP_SERVICO'
      FixedChar = True
      Size = 1
    end
    object qry_processo_CD_UNID_NEG: TStringField
      FieldName = 'CD_UNID_NEG'
      FixedChar = True
      Size = 2
    end
    object qry_processo_CD_PRODUTO: TStringField
      FieldName = 'CD_PRODUTO'
      FixedChar = True
      Size = 2
    end
    object qry_processo_NR_PROCESSO_VINC: TStringField
      FieldName = 'NR_PROCESSO_VINC'
      FixedChar = True
      Size = 14
    end
  end
  object qry_notifica_: TQuery
    CachedUpdates = True
    BeforePost = qry_notifica_BeforePost
    AfterPost = qry_notifica_AfterPost
    BeforeDelete = qry_notifica_BeforeDelete
    AfterScroll = qry_notifica_AfterScroll
    OnCalcFields = qry_notifica_CalcFields
    DatabaseName = 'DBBROKER'
    DataSource = ds_processo
    RequestLive = True
    SQL.Strings = (
      'SELECT * FROM TNUMERARIO_NOTIFICA (NOLOCK)'
      'WHERE NR_PROCESSO = :NR_PROCESSO'
      'ORDER BY NR_SOLICITACAO')
    UpdateObject = UpdNotifica
    Left = 48
    Top = 120
    ParamData = <
      item
        DataType = ftFixedChar
        Name = 'NR_PROCESSO'
        ParamType = ptUnknown
        Size = 19
      end>
    object qry_notifica_NR_PROCESSO: TStringField
      FieldName = 'NR_PROCESSO'
      Origin = 'DBBROKER.TNUMERARIO_NOTIFICA.NR_PROCESSO'
      FixedChar = True
      Size = 18
    end
    object qry_notifica_NR_SOLICITACAO: TStringField
      FieldName = 'NR_SOLICITACAO'
      Origin = 'DBBROKER.TNUMERARIO_NOTIFICA.NR_SOLICITACAO'
      FixedChar = True
      Size = 3
    end
    object qry_notifica_DT_SOLICITACAO: TDateTimeField
      FieldName = 'DT_SOLICITACAO'
      Origin = 'DBBROKER.TNUMERARIO_NOTIFICA.DT_SOLICITACAO'
    end
    object qry_notifica_CD_USUARIO: TStringField
      FieldName = 'CD_USUARIO'
      Origin = 'DBBROKER.TNUMERARIO_NOTIFICA.CD_USUARIO'
      FixedChar = True
      Size = 4
    end
    object qry_notifica_CD_STATUS: TStringField
      FieldName = 'CD_STATUS'
      Origin = 'DBBROKER.TNUMERARIO_NOTIFICA.CD_STATUS'
      FixedChar = True
      Size = 1
    end
    object qry_notifica_TX_NUMERARIO_OBS: TMemoField
      FieldName = 'TX_NUMERARIO_OBS'
      Origin = 'DBBROKER.TNUMERARIO_NOTIFICA.TX_NUMERARIO_OBS'
      BlobType = ftMemo
    end
    object qry_notifica_TX_NUMERARIO_ASS: TMemoField
      FieldName = 'TX_NUMERARIO_ASS'
      Origin = 'DBBROKER.TNUMERARIO_NOTIFICA.TX_NUMERARIO_ASS'
      BlobType = ftMemo
    end
    object qry_notifica_VL_SOLICITADO: TFloatField
      FieldName = 'VL_SOLICITADO'
      Origin = 'DBBROKER.TNUMERARIO_NOTIFICA.VL_SOLICITADO'
      DisplayFormat = '0.00'
    end
    object qry_notifica_VL_RECEBIDO: TFloatField
      FieldName = 'VL_RECEBIDO'
      Origin = 'DBBROKER.TNUMERARIO_NOTIFICA.VL_RECEBIDO'
      DisplayFormat = '0.00'
    end
    object qry_notifica_QT_ITENS_SOLIC: TIntegerField
      FieldName = 'QT_ITENS_SOLIC'
      Origin = 'DBBROKER.TNUMERARIO_NOTIFICA.QT_ITENS_SOLIC'
      DisplayFormat = '00'
    end
    object qry_notifica_IN_EMITIDO: TStringField
      FieldName = 'IN_EMITIDO'
      Origin = 'DBBROKER.TNUMERARIO_NOTIFICA.IN_EMITIDO'
      FixedChar = True
      Size = 1
    end
    object qry_notifica_DT_EMISSAO: TDateTimeField
      FieldName = 'DT_EMISSAO'
      Origin = 'DBBROKER.TNUMERARIO_NOTIFICA.DT_EMISSAO'
    end
    object qry_notifica_CD_BASE_CALCULO: TStringField
      FieldName = 'CD_BASE_CALCULO'
      Origin = 'DBBROKER.TNUMERARIO_NOTIFICA.CD_BASE_CALCULO'
      FixedChar = True
      Size = 1
    end
    object qry_notifica_DT_PARIDADE: TDateTimeField
      FieldName = 'DT_PARIDADE'
      Origin = 'DBBROKER.TNUMERARIO_NOTIFICA.DT_PARIDADE'
    end
    object qry_notifica_Look_status: TStringField
      FieldKind = fkLookup
      FieldName = 'Look_status'
      LookupDataSet = qry_status_
      LookupKeyFields = 'CD_STATUS'
      LookupResultField = 'NM_STATUS'
      KeyFields = 'CD_STATUS'
      Size = 10
      Lookup = True
    end
    object qry_notifica_Look_nm_usuario: TStringField
      FieldKind = fkLookup
      FieldName = 'Look_nm_usuario'
      LookupDataSet = qry_usuario_
      LookupKeyFields = 'CD_USUARIO'
      LookupResultField = 'AP_USUARIO'
      KeyFields = 'CD_USUARIO'
      Size = 5
      Lookup = True
    end
    object qry_notifica_calcDT_BAIXA: TDateField
      DisplayLabel = 'Dt. Baixa'
      FieldKind = fkCalculated
      FieldName = 'calcDT_BAIXA'
      Calculated = True
    end
  end
  object ds_notifica: TDataSource
    DataSet = qry_notifica_
    Left = 56
    Top = 168
  end
  object ds_processo: TDataSource
    DataSet = qry_processo_
    Left = 232
    Top = 16
  end
  object qry_notifica_item_: TQuery
    CachedUpdates = True
    BeforeInsert = trava_grid_numerario
    BeforeEdit = trava_grid_numerario
    BeforePost = qry_notifica_item_BeforePost
    AfterPost = qry_notifica_item_AfterPost
    AfterCancel = qry_notifica_item_AfterCancel
    AfterDelete = qry_notifica_item_AfterDelete
    AfterScroll = qry_notifica_item_AfterScroll
    OnCalcFields = qry_notifica_item_CalcFields
    OnPostError = qry_notifica_item_PostError
    DatabaseName = 'DBBROKER'
    ParamCheck = False
    RequestLive = True
    SQL.Strings = (
      'SELECT * FROM TNUMERARIO_NOTIFICA_ITEM (NOLOCK)'
      '  WHERE NR_PROCESSO=:NR_PROCESSO AND'
      '  NR_SOLICITACAO=:NR_SOLICITACAO')
    Left = 168
    Top = 72
    ParamData = <
      item
        DataType = ftFixedChar
        Name = 'NR_PROCESSO'
        ParamType = ptInput
      end
      item
        DataType = ftFixedChar
        Name = 'NR_SOLICITACAO'
        ParamType = ptInput
      end>
    object qry_notifica_item_NR_PROCESSO: TStringField
      FieldName = 'NR_PROCESSO'
      Origin = 'DBBROKER.TNUMERARIO_NOTIFICA_ITEM.NR_PROCESSO'
      FixedChar = True
      Size = 18
    end
    object qry_notifica_item_NR_SOLICITACAO: TStringField
      FieldName = 'NR_SOLICITACAO'
      Origin = 'DBBROKER.TNUMERARIO_NOTIFICA_ITEM.NR_SOLICITACAO'
      FixedChar = True
      Size = 3
    end
    object qry_notifica_item_NR_LANCAMENTO: TStringField
      FieldName = 'NR_LANCAMENTO'
      Origin = 'DBBROKER.TNUMERARIO_NOTIFICA_ITEM.NR_LANCAMENTO'
      FixedChar = True
      Size = 3
    end
    object qry_notifica_item_CD_ITEM: TStringField
      FieldName = 'CD_ITEM'
      Origin = 'DBBROKER.TNUMERARIO_NOTIFICA_ITEM.CD_ITEM'
      FixedChar = True
      Size = 3
    end
    object qry_notifica_item_NR_PRIORIDADE: TIntegerField
      FieldName = 'NR_PRIORIDADE'
      Origin = 'DBBROKER.TNUMERARIO_NOTIFICA_ITEM.NR_PRIORIDADE'
    end
    object qry_notifica_item_CD_TIPO_CALCULO: TStringField
      FieldName = 'CD_TIPO_CALCULO'
      Origin = 'DBBROKER.TNUMERARIO_NOTIFICA_ITEM.CD_TIPO_CALCULO'
      FixedChar = True
      Size = 3
    end
    object qry_notifica_item_CD_BANCO: TStringField
      FieldName = 'CD_BANCO'
      Origin = 'DBBROKER.TNUMERARIO_NOTIFICA_ITEM.CD_BANCO'
      FixedChar = True
      Size = 3
    end
    object qry_notifica_item_VL_ITEM_CALCULADO: TFloatField
      FieldName = 'VL_ITEM_CALCULADO'
      Origin = 'DBBROKER.TNUMERARIO_NOTIFICA_ITEM.VL_ITEM_CALCULADO'
      DisplayFormat = '0.00'
    end
    object qry_notifica_item_VL_SOLICITADO: TFloatField
      FieldName = 'VL_SOLICITADO'
      Origin = 'DBBROKER.TNUMERARIO_NOTIFICA_ITEM.VL_SOLICITADO'
      DisplayFormat = '0.00'
    end
    object qry_notifica_item_CD_STATUS: TStringField
      FieldName = 'CD_STATUS'
      Origin = 'DBBROKER.TNUMERARIO_NOTIFICA_ITEM.CD_STATUS'
      FixedChar = True
      Size = 1
    end
    object qry_notifica_item_VL_RECEBIDO: TFloatField
      FieldName = 'VL_RECEBIDO'
      Origin = 'DBBROKER.TNUMERARIO_NOTIFICA_ITEM.VL_RECEBIDO'
      DisplayFormat = '0.00'
    end
    object qry_notifica_item_VL_UTILIZADO: TFloatField
      FieldName = 'VL_UTILIZADO'
      Origin = 'DBBROKER.TNUMERARIO_NOTIFICA_ITEM.VL_UTILIZADO'
      DisplayFormat = '0.00'
    end
    object qry_notifica_item_IN_CANCELADO: TStringField
      FieldName = 'IN_CANCELADO'
      Origin = 'DBBROKER.TNUMERARIO_NOTIFICA_ITEM.IN_CANCELADO'
      FixedChar = True
      Size = 1
    end
    object qry_notifica_item_TP_DESTINO: TStringField
      FieldName = 'TP_DESTINO'
      Origin = 'DBBROKER.TNUMERARIO_NOTIFICA_ITEM.TP_DESTINO'
      FixedChar = True
      Size = 1
    end
    object qry_notifica_item_CD_FAVORECIDO: TStringField
      FieldName = 'CD_FAVORECIDO'
      Origin = 'DBBROKER.TNUMERARIO_NOTIFICA_ITEM.CD_FAVORECIDO'
      FixedChar = True
      Size = 5
    end
    object qry_notifica_item_CD_MOEDA_COMPRA: TStringField
      FieldName = 'CD_MOEDA_COMPRA'
      Origin = 'DBBROKER.TNUMERARIO_NOTIFICA_ITEM.CD_MOEDA_COMPRA'
      FixedChar = True
      Size = 3
    end
    object qry_notifica_item_CD_MOEDA_VENDA: TStringField
      FieldName = 'CD_MOEDA_VENDA'
      Origin = 'DBBROKER.TNUMERARIO_NOTIFICA_ITEM.CD_MOEDA_VENDA'
      FixedChar = True
      Size = 3
    end
    object qry_notifica_item_VL_COMPRA: TFloatField
      FieldName = 'VL_COMPRA'
      Origin = 'DBBROKER.TNUMERARIO_NOTIFICA_ITEM.VL_COMPRA'
      DisplayFormat = '0.00'
    end
    object qry_notifica_item_VL_VENDA: TFloatField
      FieldName = 'VL_VENDA'
      Origin = 'DBBROKER.TNUMERARIO_NOTIFICA_ITEM.VL_VENDA'
      DisplayFormat = '0.00'
    end
    object qry_notifica_item_Look_nm_item: TStringField
      FieldKind = fkLookup
      FieldName = 'Look_nm_item'
      LookupDataSet = qry_item_
      LookupKeyFields = 'CD_ITEM'
      LookupResultField = 'NM_ITEM'
      KeyFields = 'CD_ITEM'
      Size = 30
      Lookup = True
    end
    object qry_notifica_item_Look_nm_status: TStringField
      FieldKind = fkLookup
      FieldName = 'Look_nm_status'
      LookupDataSet = qry_status_
      LookupKeyFields = 'CD_STATUS'
      LookupResultField = 'NM_STATUS'
      KeyFields = 'CD_STATUS'
      Size = 10
      Lookup = True
    end
    object qry_notifica_item_Look_nm_banco: TStringField
      FieldKind = fkLookup
      FieldName = 'Look_nm_banco'
      LookupDataSet = qry_banco_
      LookupKeyFields = 'CD_BANCO'
      LookupResultField = 'NM_BANCO'
      KeyFields = 'CD_BANCO'
      Size = 30
      Lookup = True
    end
    object qry_notifica_item_Look_tp_destino: TStringField
      FieldKind = fkLookup
      FieldName = 'Look_tp_destino'
      LookupDataSet = qry_tp_destino_
      LookupKeyFields = 'CD_TP_DESTINO'
      LookupResultField = 'NM_TP_DESTINO'
      KeyFields = 'TP_DESTINO'
      Lookup = True
    end
    object qry_notifica_item_Look_moeda: TStringField
      FieldKind = fkLookup
      FieldName = 'Look_moeda'
      LookupDataSet = qry_moeda_broker_
      LookupKeyFields = 'CD_MOEDA'
      LookupResultField = 'AP_MOEDA'
      KeyFields = 'CD_MOEDA_VENDA'
      Size = 5
      Lookup = True
    end
    object qry_notifica_item_Look_nm_favorecido: TStringField
      FieldKind = fkLookup
      FieldName = 'Look_nm_favorecido'
      LookupDataSet = qry_favorecido_
      LookupKeyFields = 'CD_FAVORECIDO'
      LookupResultField = 'NM_FAVORECIDO'
      KeyFields = 'CD_FAVORECIDO'
      Size = 50
      Lookup = True
    end
    object qry_notifica_item_calc_origem: TStringField
      FieldKind = fkCalculated
      FieldName = 'calc_origem'
      Calculated = True
    end
  end
  object ds_notifica_item: TDataSource
    DataSet = qry_notifica_item_
    OnStateChange = ds_notifica_itemStateChange
    Left = 165
    Top = 120
  end
  object qry_item_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      
        'SELECT CD_ITEM , NM_ITEM, TP_ITEM  FROM TITEM (NOLOCK) WHERE IN_' +
        'ATIVO = '#39'1'#39
      ''
      ''
      '')
    Left = 56
    Top = 224
    object qry_item_CD_ITEM: TStringField
      FieldName = 'CD_ITEM'
      Origin = 'DBBROKER.TITEM.CD_ITEM'
      FixedChar = True
      Size = 3
    end
    object qry_item_NM_ITEM: TStringField
      FieldName = 'NM_ITEM'
      Origin = 'DBBROKER.TITEM.NM_ITEM'
      FixedChar = True
      Size = 30
    end
    object qry_item_TP_ITEM: TStringField
      FieldName = 'TP_ITEM'
      Origin = 'DBBROKER.TITEM.TP_ITEM'
      FixedChar = True
      Size = 1
    end
  end
  object qry_tp_destino_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT CD_TP_DESTINO, NM_TP_DESTINO'
      'FROM TTP_DESTINO (NOLOCK)'
      'WHERE CD_TP_DESTINO <> '#39'4'#39)
    Left = 56
    Top = 272
  end
  object qry_usuario_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT CD_USUARIO, AP_USUARIO'
      'FROM TUSUARIO (NOLOCK)')
    Left = 56
    Top = 328
    object qry_usuario_CD_USUARIO: TStringField
      FieldName = 'CD_USUARIO'
      Origin = 'DBBROKER.TUSUARIO.CD_USUARIO'
      FixedChar = True
      Size = 4
    end
    object qry_usuario_AP_USUARIO: TStringField
      FieldName = 'AP_USUARIO'
      Origin = 'DBBROKER.TUSUARIO.AP_USUARIO'
      FixedChar = True
      Size = 15
    end
  end
  object qry_status_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT * '
      'FROM TTP_STATUS_NUMER (NOLOCK)')
    Left = 168
    Top = 176
    object qry_status_CD_STATUS: TStringField
      FieldName = 'CD_STATUS'
      Origin = 'DBBROKER.TTP_STATUS_NUMER.CD_STATUS'
      FixedChar = True
      Size = 1
    end
    object qry_status_NM_STATUS: TStringField
      FieldName = 'NM_STATUS'
      Origin = 'DBBROKER.TTP_STATUS_NUMER.NM_STATUS'
      FixedChar = True
    end
  end
  object qry_banco_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT CD_BANCO, NM_BANCO'
      'FROM TBANCO (NOLOCK)')
    Left = 168
    Top = 232
    object qry_banco_CD_BANCO: TStringField
      FieldName = 'CD_BANCO'
      Origin = 'DBBROKER.TBANCO.CD_BANCO'
      FixedChar = True
      Size = 3
    end
    object qry_banco_NM_BANCO: TStringField
      FieldName = 'NM_BANCO'
      Origin = 'DBBROKER.TBANCO.NM_BANCO'
      FixedChar = True
      Size = 40
    end
  end
  object qry_moeda_broker_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT CD_MOEDA, AP_MOEDA'
      '  FROM TMOEDA_BROKER (NOLOCK)')
    Left = 168
    Top = 288
    object qry_moeda_broker_CD_MOEDA: TStringField
      FieldName = 'CD_MOEDA'
      Origin = 'DBBROKER.TMOEDA_BROKER.CD_MOEDA'
      FixedChar = True
      Size = 3
    end
    object qry_moeda_broker_AP_MOEDA: TStringField
      FieldName = 'AP_MOEDA'
      Origin = 'DBBROKER.TMOEDA_BROKER.AP_MOEDA'
      FixedChar = True
      Size = 6
    end
  end
  object sp_calc_padrao: TStoredProc
    DatabaseName = 'DBBROKER'
    StoredProcName = 'dbo.sp_calc_padrao_ag'
    Left = 296
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
        Name = '@nr_solicitacao'
        ParamType = ptInput
      end>
  end
  object sp_atz_num_cpmf: TStoredProc
    DatabaseName = 'DBBROKER'
    StoredProcName = 'dbo.sp_atz_num_cpmf_ag'
    Left = 296
    Top = 72
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
        Name = '@nr_solic'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = '@cd_cliente'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = '@cd_servico'
        ParamType = ptInput
      end>
  end
  object sp_calculo: TStoredProc
    DatabaseName = 'DBBROKER'
    Left = 360
    Top = 17
  end
  object UPdate_num_item: TUpdateSQL
    ModifySQL.Strings = (
      'update TNUMERARIO_NOTIFICA_ITEM'
      'set'
      '  NR_PROCESSO = :NR_PROCESSO,'
      '  NR_SOLICITACAO = :NR_SOLICITACAO,'
      '  NR_LANCAMENTO = :NR_LANCAMENTO,'
      '  CD_ITEM = :CD_ITEM,'
      '  NR_PRIORIDADE = :NR_PRIORIDADE,'
      '  CD_TIPO_CALCULO = :CD_TIPO_CALCULO,'
      '  CD_BANCO = :CD_BANCO,'
      '  VL_ITEM_CALCULADO = :VL_ITEM_CALCULADO,'
      '  VL_SOLICITADO = :VL_SOLICITADO,'
      '  CD_STATUS = :CD_STATUS,'
      '  VL_RECEBIDO = :VL_RECEBIDO,'
      '  VL_UTILIZADO = :VL_UTILIZADO,'
      '  IN_CANCELADO = :IN_CANCELADO,'
      '  TP_DESTINO = :TP_DESTINO,'
      '  CD_FAVORECIDO = :CD_FAVORECIDO,'
      '  CD_MOEDA_COMPRA = :CD_MOEDA_COMPRA,'
      '  CD_MOEDA_VENDA = :CD_MOEDA_VENDA,'
      '  VL_COMPRA = :VL_COMPRA,'
      '  VL_VENDA = :VL_VENDA'
      'where'
      '  NR_PROCESSO = :OLD_NR_PROCESSO and'
      '  NR_SOLICITACAO = :OLD_NR_SOLICITACAO and'
      '  NR_LANCAMENTO = :OLD_NR_LANCAMENTO')
    InsertSQL.Strings = (
      'insert into TNUMERARIO_NOTIFICA_ITEM'
      
        '  (NR_PROCESSO, NR_SOLICITACAO, NR_LANCAMENTO, CD_ITEM, NR_PRIOR' +
        'IDADE, '
      
        '   CD_TIPO_CALCULO, CD_BANCO, VL_ITEM_CALCULADO, VL_SOLICITADO, ' +
        'CD_STATUS, '
      
        '   VL_RECEBIDO, VL_UTILIZADO, IN_CANCELADO, TP_DESTINO, CD_FAVOR' +
        'ECIDO, '
      '   CD_MOEDA_COMPRA, CD_MOEDA_VENDA, VL_COMPRA, VL_VENDA)'
      'values'
      
        '  (:NR_PROCESSO, :NR_SOLICITACAO, :NR_LANCAMENTO, :CD_ITEM, :NR_' +
        'PRIORIDADE, '
      
        '   :CD_TIPO_CALCULO, :CD_BANCO, :VL_ITEM_CALCULADO, :VL_SOLICITA' +
        'DO, :CD_STATUS, '
      
        '   :VL_RECEBIDO, :VL_UTILIZADO, :IN_CANCELADO, :TP_DESTINO, :CD_' +
        'FAVORECIDO, '
      '   :CD_MOEDA_COMPRA, :CD_MOEDA_VENDA, :VL_COMPRA, :VL_VENDA)')
    DeleteSQL.Strings = (
      'delete from TNUMERARIO_NOTIFICA_ITEM'
      'where'
      '  NR_PROCESSO = :OLD_NR_PROCESSO and'
      '  NR_SOLICITACAO = :OLD_NR_SOLICITACAO and'
      '  NR_LANCAMENTO = :OLD_NR_LANCAMENTO')
    Left = 232
    Top = 72
  end
  object qry_favorecido_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT CD_FAVORECIDO, NM_FAVORECIDO'
      '   FROM TFAVORECIDO (NOLOCK)')
    Left = 168
    Top = 336
    object qry_favorecido_CD_FAVORECIDO: TStringField
      FieldName = 'CD_FAVORECIDO'
      Origin = 'DBBROKER.TFAVORECIDO.CD_FAVORECIDO'
      FixedChar = True
      Size = 5
    end
    object qry_favorecido_NM_FAVORECIDO: TStringField
      FieldName = 'NM_FAVORECIDO'
      Origin = 'DBBROKER.TFAVORECIDO.NM_FAVORECIDO'
      FixedChar = True
      Size = 50
    end
  end
  object sp_atz_pagto_ag: TStoredProc
    DatabaseName = 'DBBROKER'
    StoredProcName = 'dbo.sp_atz_pagto_ag'
    Left = 360
    Top = 73
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
      end>
  end
  object qry_soma_valores_: TQuery
    DatabaseName = 'DBBROKER'
    Left = 296
    Top = 128
  end
  object ds_som_valores: TDataSource
    DataSet = qry_soma_valores_
    Left = 296
    Top = 184
  end
  object sp_importa_num_cancelados: TStoredProc
    DatabaseName = 'DBBROKER'
    StoredProcName = 'dbo.sp_importa_numerario_cancelado'
    Left = 360
    Top = 137
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
        Name = '@nr_solicitacao'
        ParamType = ptInput
      end>
  end
  object sp_soma_solinum_ag: TStoredProc
    DatabaseName = 'DBBROKER'
    StoredProcName = 'dbo.sp_soma_solinum_ag'
    Left = 360
    Top = 209
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
        Name = '@nr_solinum'
        ParamType = ptInput
      end>
  end
  object sp_numerario_proc_vinc: TStoredProc
    DatabaseName = 'DBBROKER'
    StoredProcName = 'dbo.sp_numerario_proc_vinc'
    Left = 296
    Top = 248
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
        Name = '@nr_proc_vinc'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = '@nr_solicitacao'
        ParamType = ptInput
      end
      item
        DataType = ftDateTime
        Name = '@dt_tarifario'
        ParamType = ptInput
      end>
  end
  object sp_atz_status_solic_pagto_ag: TStoredProc
    DatabaseName = 'DBBROKER'
    StoredProcName = 'dbo.sp_atz_status_solic_pagto_ag'
    Left = 296
    Top = 312
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
  object sp_duplica_numerario_ag: TStoredProc
    DatabaseName = 'DBBROKER'
    StoredProcName = 'dbo.sp_duplica_numerario_ag'
    Left = 357
    Top = 265
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
        Name = '@nr_solicitacao'
        ParamType = ptInput
      end>
    object StringField9: TStringField
      FieldName = 'NR_ADICAO'
      Size = 3
    end
    object StringField10: TStringField
      FieldName = 'NR_ITEM'
      Size = 3
    end
  end
  object qry_imp_notificacao_: TQuery
    OnCalcFields = qry_imp_notificacao_CalcFields
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT  P.NR_PROCESSO,'
      '        I.NR_SOLICITACAO,'
      '        I.NR_LANCAMENTO,'
      '        I.CD_ITEM,'
      '        (SELECT AP_MOEDA'
      '         FROM TMOEDA_BROKER'
      '         WHERE CD_MOEDA = I.CD_MOEDA_VENDA) CD_MOEDA_VENDA,'
      '        I.VL_VENDA,'
      '        I.VL_SOLICITADO,'
      '        P.CD_CLIENTE,'
      '        E.NM_EMPRESA,'
      '        E.END_EMPRESA,'
      '        E.END_NUMERO,'
      '        E.END_CIDADE,'
      '        E.END_BAIRRO,'
      '        E.END_COMPL,'
      '        E.END_UF,'
      '        E.END_CEP,'
      '        CASE E.CD_TIPO_PESSOA'
      '            WHEN '#39'0'#39' THEN  E.CPF_EMPRESA'
      '        ELSE  E.CGC_EMPRESA'
      '        END AS CGC_CPF_EMRPESA,'
      '        E.NR_TELEFONE,'
      '        E.NR_FAX,'
      '        P.REF_CLIENTE,'
      '        IT.NM_ITEM,'
      '        CASE IT.CD_ITEM'
      '            WHEN '#39'027'#39' THEN 1'
      '        ELSE IT.IN_ITEM_DI'
      '        END AS IN_ITEM_DI,'
      '        N.TX_NUMERARIO_OBS,'
      
        '        (SELECT TOP 1 LTRIM(RTRIM(R.CD_REFERENCIA)) + '#39'/'#39' + R.NR' +
        '_ITEM_PO'
      '         FROM TREF_CLIENTE R (NOLOCK)'
      
        '         WHERE R.NR_PROCESSO = P.NR_PROCESSO) NM_REF_DESEMBARACO' +
        ' ,'
      '        P.TX_MERCADORIA,'
      '        P.CD_CONTATO,'
      '        (SELECT C.NM_CONTATO'
      '         FROM TCLIENTE_CONTATO C (NOLOCK)'
      '         WHERE  C.CD_CLIENTE = P.CD_CLIENTE'
      '           AND C.CD_UNID_NEG = P.CD_UNID_NEG'
      '           AND C.CD_PRODUTO = P.CD_PRODUTO'
      '           AND C.CD_CONTATO = P.CD_CONTATO ) NM_CONTATO,'
      '        (SELECT C.NM_EMAIL'
      '         FROM TCLIENTE_CONTATO C (NOLOCK)'
      '         WHERE C.CD_CLIENTE = P.CD_CLIENTE'
      '           AND C.CD_UNID_NEG = P.CD_UNID_NEG'
      '           AND C.CD_PRODUTO = P.CD_PRODUTO'
      '           AND C.CD_CONTATO = P.CD_CONTATO ) NM_EMAIL,'
      '        E.NR_TELEFONE TEL_IMPORTADOR, E.NR_FAX FAX_IMPORTADOR,'
      '        (SELECT EST.NM_EMPRESA + CASE ISNULL((SELECT EN.CD_GRUPO'
      
        '                                              FROM TEMPRESA_NAC ' +
        'EN (NOLOCK)'
      
        '                                              WHERE EN.CD_EMPRES' +
        'A = P.CD_CLIENTE), '#39#39')'
      
        '                                     WHEN '#39'028'#39' THEN CASE ISNULL' +
        '(EST.NR_CLIENTE, '#39#39')'
      
        '                                                         WHEN '#39#39 +
        ' THEN '#39#39
      
        '                                                     ELSE '#39' ('#39' +' +
        ' RTRIM(EST.NR_CLIENTE) + '#39')'#39
      '                                                     END'
      '                                 ELSE '#39#39
      '                                 END'
      '         FROM TEMPRESA_EST EST (NOLOCK)'
      '         WHERE EST.CD_EMPRESA = P.CD_EXPORTADOR) NM_EMP_EST,'
      
        '        CASE WHEN D.NR_PROCESSO IS NULL THEN ROUND(PCC.VL_CIF_DO' +
        'LAR * PCC.TX_DOLAR, 2)'
      '        ELSE P.VL_CIF_MN'
      '        END AS CIF_REAIS,'
      
        '        CASE WHEN D.NR_PROCESSO IS NULL THEN ROUND(PCC.VL_CIF_DO' +
        'LAR, 2)'
      '        ELSE P.VL_CIF_DOLAR'
      '        END AS CIF_DOLAR,'
      '        P.NR_CONHECIMENTO AS HAWB_BL,'
      '        P.NR_CONHECIMENTO_MASTER AS AWB_BL,'
      '        CASE WHEN D.NR_PROCESSO IS NULL THEN PCC.VL_MLE_MOEDA'
      '        ELSE D.VL_TOT_MLE_MNEG'
      '        END AS VL_MLE_MNEG,'
      '        CASE WHEN D.NR_PROCESSO IS NULL THEN PCC.VL_FRETE_MOEDA'
      
        '        ELSE (ISNULL(P.VL_FRETE_PREPAID_MNEG, 0) + ISNULL(P.VL_F' +
        'RETE_COLLECT_MNEG, 0) + ISNULL(P.VL_FRETE_TNAC_MNEG, 0))'
      '        END VL_FRETE,'
      '        CASE WHEN D.NR_PROCESSO IS NULL THEN PCC.VL_SEGURO_MOEDA'
      '        ELSE P.VL_SEGURO_MNEG'
      '        END VL_SEGURO_MNEG,'
      '        (SELECT AP_MOEDA'
      '         FROM TMOEDA_BROKER (NOLOCK)'
      
        '         WHERE CD_MOEDA = CASE WHEN D.NR_PROCESSO IS NULL THEN P' +
        'CC.CD_MOEDA_MLE'
      
        '                          ELSE ISNULL(D.CD_MOEDA_MLE, P.CD_MOEDA' +
        '_MLE)'
      '                          END) MOEDA_MLE,'
      '        (SELECT AP_MOEDA'
      '         FROM TMOEDA_BROKER (NOLOCK)'
      
        '         WHERE CD_MOEDA = CASE WHEN D.NR_PROCESSO IS NULL THEN P' +
        'CC.CD_MOEDA_FRETE'
      
        '                          ELSE ISNULL(P.CD_MOEDA_FRETE, D.CD_MOE' +
        'DA_FRETE)'
      '                          END) MOEDA_FRETE,'
      '        (SELECT AP_MOEDA'
      '         FROM TMOEDA_BROKER (NOLOCK)'
      
        '         WHERE CD_MOEDA = CASE WHEN D.NR_PROCESSO IS NULL THEN P' +
        'CC.CD_MOEDA_SEGURO'
      
        '                          ELSE ISNULL(P.CD_MOEDA_SEGURO, D.CD_MO' +
        'EDA_SEGURO)'
      '                          END) MOEDA_SEGURO,'
      '        (SELECT V.NM_VIA_TRANSP'
      '         FROM TVIA_TRANSP_BROKER V (NOLOCK)'
      
        '         WHERE V.CD_VIA_TRANSP = S.CD_VIA_TRANSPORTE) NM_VIA_TRA' +
        'NSP,'
      '        (SELECT NM_EMBARCACAO'
      '         FROM TEMBARCACAO (NOLOCK)'
      '         WHERE CD_EMBARCACAO = P.CD_EMBARCACAO) NM_EMBARCACAO,'
      '        U.NM_UNID_NEG,'
      '        U.CGC_UNID_NEG,'
      '        U.END_UNID_NEG,'
      '        U.END_NUMERO AS NR_UNID,'
      '        U.IE_UNID_NEG,'
      '        U.NR_FONE AS FONE_UNID,'
      '        U.END_CEP AS CEP_UNID,'
      '        U.NR_FAX1 AS FAX_UNID,'
      '        U.END_CIDADE AS CIDADE_UNID,'
      '        B.NM_BANCO,'
      '        B.NR_BANCO,'
      '        B.CD_AGENCIA,'
      '        (B.NR_CONTA + '#39'-'#39' + B.DAC_AGENCIA) AS NR_CONTA,'
      '        D.NR_DECLARACAO_IMP,'
      '        (CASE ISNULL((SELECT DT_REALIZACAO'
      '                      FROM TFOLLOWUP (NOLOCK)'
      '                      WHERE NR_PROCESSO = P.NR_PROCESSO'
      '                        AND CD_EVENTO = '#39'162'#39'), '#39#39')'
      '             WHEN '#39#39' THEN (SELECT DT_REALIZACAO'
      '                           FROM TFOLLOWUP (NOLOCK)'
      '                           WHERE NR_PROCESSO = P.NR_PROCESSO'
      '                             AND CD_EVENTO = '#39'161'#39')'
      '         ELSE (SELECT DT_REALIZACAO'
      '               FROM TFOLLOWUP (NOLOCK)'
      '               WHERE NR_PROCESSO = P.NR_PROCESSO'
      '                 AND CD_EVENTO = '#39'162'#39')'
      '         END) DT_CHEGADA_CARGA,'
      '         D.TX_DOLAR,'
      '        P.CD_LOCAL_EMBARQUE,'
      '        (SELECT L.DESCRICAO + ISNULL((SELECT '#39'/'#39' + P.DESCRICAO'
      '                                      FROM TPAIS P (NOLOCK)'
      
        '                                      WHERE P.CODIGO = L.CD_PAIS' +
        '), '#39#39')'
      '         FROM TLOCAL_EMBARQUE L (NOLOCK)'
      '         WHERE L.CODIGO = P.CD_LOCAL_EMBARQUE) LOCAL,'
      '        I.TP_DESTINO,'
      '        PRO.CD_PRODUTO,'
      '        PRO.NM_PRODUTO,'
      '        E2.NM_EMPRESA AS NM_CONSIG,'
      '        E2.END_EMPRESA AS END_CONSIG,'
      '        E2.END_NUMERO AS END_NUMERO_CONSIG,'
      '        E2.END_CIDADE AS END_CIDADE_CONSIG,'
      '        E2.END_BAIRRO AS END_BAIRRO_CONSIG,'
      '        E2.END_COMPL AS END_COMPL_CONSIG,'
      '        E2.END_UF AS END_UF_CONSIG,'
      '        E2.END_CEP AS END_CEP_CONSIG,'
      '        CASE E2.CD_TIPO_PESSOA'
      '            WHEN '#39'0'#39' THEN  E2.CPF_EMPRESA'
      '        ELSE  E2.CGC_EMPRESA'
      '        END AS CGC_CPF_CONSIG,'
      '        (SELECT ARM.NM_ARMAZEM'
      '         FROM TARMAZEM ARM (NOLOCK)'
      
        '         WHERE ARM.CD_ARMAZEM = P.CD_ARMAZEM_DESCARGA) AS ARMAZE' +
        'M_DESCAGA,'
      '        (SELECT VL_TAXA'
      '         FROM TTAXA_FRETE'
      '         WHERE CD_MOEDA = I.CD_MOEDA_VENDA'
      '           AND DT_INICIO = N.DT_NOTIFICACAO) TAXA_CAMBIO,'
      '        (SELECT NM_EMPRESA'
      '         FROM TEMPRESA_EST (NOLOCK)'
      '         WHERE CD_EMPRESA = P.CD_EMP_EST) NM_EMP_EST_FI,'
      '        N.DT_NOTIFICACAO,'
      '        MFI.DT_CHEGADA AS DT_CHEGADA_FI,'
      '        HFI.NR_HOUSE AS NR_HOUSE_FI,'
      '        (SELECT EMB.NM_EMBARCACAO'
      '         FROM TEMBARCACAO EMB (NOLOCK)'
      '         WHERE EMB.CD_EMBARCACAO = MFI.CD_VEICULO) NM_EMB_FI,'
      '        (SELECT ARM.NM_ARMAZEM'
      '         FROM TARMAZEM ARM (NOLOCK)'
      
        '         WHERE ARM.CD_ARMAZEM = MFI.CD_ARMAZEM_ATRACACAO) NM_ATR' +
        'AC_FI,'
      '        P.NR_PROPOSTA'
      'FROM TPROCESSO P (NOLOCK)'
      
        '   INNER JOIN TNUMERARIO_NOTIFICA_ITEM I (NOLOCK) ON I.NR_PROCES' +
        'SO = P.NR_PROCESSO'
      '   INNER JOIN TBANCO B (NOLOCK) ON B.CD_BANCO = I.CD_BANCO'
      '   INNER JOIN TITEM IT (NOLOCK) ON IT.CD_ITEM = I.CD_ITEM'
      
        '   INNER JOIN TNUMERARIO_NOTIFICA N (NOLOCK) ON N.NR_PROCESSO   ' +
        ' = I.NR_PROCESSO'
      
        '                                            AND N.NR_SOLICITACAO' +
        ' = I.NR_SOLICITACAO'
      
        '   LEFT JOIN TEMPRESA_NAC E (NOLOCK) ON (P.CD_CLIENTE = E.CD_EMP' +
        'RESA)'
      '   LEFT JOIN TSERVICO S (NOLOCK) ON(S.CD_SERVICO = P.CD_SERVICO)'
      
        '   LEFT JOIN TUNID_NEG U (NOLOCK) ON(U.CD_UNID_NEG = P.CD_UNID_N' +
        'EG)'
      
        '   LEFT JOIN TDECLARACAO_IMPORTACAO D (NOLOCK) ON(D.NR_PROCESSO ' +
        '= P.NR_PROCESSO)'
      
        '   LEFT JOIN TPRODUTO PRO (NOLOCK) ON(PRO.CD_PRODUTO = SUBSTRING' +
        '(P.NR_PROCESSO,3,2) )'
      
        '   LEFT JOIN TEMPRESA_NAC E2 (NOLOCK) ON (D.CD_IMPORTADOR = E2.C' +
        'D_EMPRESA)'
      
        '   LEFT JOIN THOUSE HFI (NOLOCK) ON HFI.NR_PROCESSO = P.NR_PROCE' +
        'SSO'
      
        '   LEFT JOIN TMASTER MFI (NOLOCK) ON MFI.CD_MASTER = HFI.CD_MAST' +
        'ER'
      
        '   LEFT JOIN TPRE_CALCULO_CAPA PCC (NOLOCK) ON PCC.NR_PROCESSO =' +
        ' P.NR_PROCESSO'
      'WHERE P.NR_PROCESSO    = :NR_PROCESSO'
      '  AND I.NR_SOLICITACAO = :NR_SOLICITACAO'
      '  AND I.VL_SOLICITADO  > 0'
      'ORDER BY B.NM_BANCO, I.TP_DESTINO, IN_ITEM_DI, NM_ITEM')
    Left = 536
    Top = 17
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'NR_PROCESSO'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'NR_SOLICITACAO'
        ParamType = ptUnknown
      end>
    object qry_imp_notificacao_calc_end_cliente: TStringField
      FieldKind = fkCalculated
      FieldName = 'calc_end_cliente'
      Size = 255
      Calculated = True
    end
    object qry_imp_notificacao_cacl_nr_processo: TStringField
      FieldKind = fkCalculated
      FieldName = 'cacl_nr_processo'
      Size = 10
      Calculated = True
    end
    object qry_imp_notificacao_calc_nm_usuario: TStringField
      FieldKind = fkCalculated
      FieldName = 'calc_nm_usuario'
      Size = 50
      Calculated = True
    end
    object qry_imp_notificacao_calc_nm_destino: TStringField
      FieldKind = fkCalculated
      FieldName = 'calc_nm_destino'
      Size = 80
      Calculated = True
    end
    object qry_imp_notificacao_NR_PROCESSO: TStringField
      FieldName = 'NR_PROCESSO'
      FixedChar = True
      Size = 18
    end
    object qry_imp_notificacao_NR_SOLICITACAO: TStringField
      FieldName = 'NR_SOLICITACAO'
      FixedChar = True
      Size = 3
    end
    object qry_imp_notificacao_NR_LANCAMENTO: TStringField
      FieldName = 'NR_LANCAMENTO'
      FixedChar = True
      Size = 3
    end
    object qry_imp_notificacao_CD_ITEM: TStringField
      FieldName = 'CD_ITEM'
      FixedChar = True
      Size = 3
    end
    object qry_imp_notificacao_CD_MOEDA_VENDA: TStringField
      FieldName = 'CD_MOEDA_VENDA'
      FixedChar = True
      Size = 6
    end
    object qry_imp_notificacao_VL_VENDA: TFloatField
      FieldName = 'VL_VENDA'
    end
    object qry_imp_notificacao_VL_SOLICITADO: TFloatField
      FieldName = 'VL_SOLICITADO'
    end
    object qry_imp_notificacao_CD_CLIENTE: TStringField
      FieldName = 'CD_CLIENTE'
      FixedChar = True
      Size = 5
    end
    object qry_imp_notificacao_NM_EMPRESA: TStringField
      FieldName = 'NM_EMPRESA'
      FixedChar = True
      Size = 50
    end
    object qry_imp_notificacao_END_EMPRESA: TStringField
      FieldName = 'END_EMPRESA'
      FixedChar = True
      Size = 50
    end
    object qry_imp_notificacao_END_NUMERO: TStringField
      FieldName = 'END_NUMERO'
      FixedChar = True
      Size = 6
    end
    object qry_imp_notificacao_END_CIDADE: TStringField
      FieldName = 'END_CIDADE'
      FixedChar = True
      Size = 30
    end
    object qry_imp_notificacao_END_BAIRRO: TStringField
      FieldName = 'END_BAIRRO'
      FixedChar = True
      Size = 30
    end
    object qry_imp_notificacao_END_COMPL: TStringField
      FieldName = 'END_COMPL'
      FixedChar = True
      Size = 50
    end
    object qry_imp_notificacao_END_UF: TStringField
      FieldName = 'END_UF'
      FixedChar = True
      Size = 2
    end
    object qry_imp_notificacao_END_CEP: TStringField
      FieldName = 'END_CEP'
      FixedChar = True
      Size = 8
    end
    object qry_imp_notificacao_CGC_CPF_EMRPESA: TStringField
      FieldName = 'CGC_CPF_EMRPESA'
      FixedChar = True
      Size = 14
    end
    object qry_imp_notificacao_NR_TELEFONE: TStringField
      FieldName = 'NR_TELEFONE'
      FixedChar = True
      Size = 15
    end
    object qry_imp_notificacao_NR_FAX: TStringField
      FieldName = 'NR_FAX'
      FixedChar = True
      Size = 15
    end
    object qry_imp_notificacao_REF_CLIENTE: TStringField
      FieldName = 'REF_CLIENTE'
      FixedChar = True
    end
    object qry_imp_notificacao_NM_ITEM: TStringField
      FieldName = 'NM_ITEM'
      FixedChar = True
      Size = 30
    end
    object qry_imp_notificacao_TX_NUMERARIO_OBS: TMemoField
      FieldName = 'TX_NUMERARIO_OBS'
      BlobType = ftMemo
    end
    object qry_imp_notificacao_NM_REF_DESEMBARACO: TStringField
      FieldName = 'NM_REF_DESEMBARACO'
      FixedChar = True
      Size = 15
    end
    object qry_imp_notificacao_CD_CONTATO: TStringField
      FieldName = 'CD_CONTATO'
      FixedChar = True
      Size = 3
    end
    object qry_imp_notificacao_NM_CONTATO: TStringField
      FieldName = 'NM_CONTATO'
      FixedChar = True
      Size = 50
    end
    object qry_imp_notificacao_NM_EMP_EST: TStringField
      FieldName = 'NM_EMP_EST'
      FixedChar = True
      Size = 60
    end
    object qry_imp_notificacao_CIF_REAIS: TFloatField
      FieldName = 'CIF_REAIS'
    end
    object qry_imp_notificacao_CIF_DOLAR: TFloatField
      FieldName = 'CIF_DOLAR'
    end
    object qry_imp_notificacao_HAWB_BL: TStringField
      FieldName = 'HAWB_BL'
      FixedChar = True
      Size = 30
    end
    object qry_imp_notificacao_AWB_BL: TStringField
      FieldName = 'AWB_BL'
      FixedChar = True
      Size = 30
    end
    object qry_imp_notificacao_VL_MLE_MNEG: TFloatField
      FieldName = 'VL_MLE_MNEG'
    end
    object qry_imp_notificacao_VL_FRETE: TFloatField
      FieldName = 'VL_FRETE'
    end
    object qry_imp_notificacao_VL_SEGURO_MNEG: TFloatField
      FieldName = 'VL_SEGURO_MNEG'
    end
    object qry_imp_notificacao_MOEDA_MLE: TStringField
      FieldName = 'MOEDA_MLE'
      FixedChar = True
      Size = 6
    end
    object qry_imp_notificacao_MOEDA_FRETE: TStringField
      FieldName = 'MOEDA_FRETE'
      FixedChar = True
      Size = 6
    end
    object qry_imp_notificacao_MOEDA_SEGURO: TStringField
      FieldName = 'MOEDA_SEGURO'
      FixedChar = True
      Size = 6
    end
    object qry_imp_notificacao_NM_VIA_TRANSP: TStringField
      FieldName = 'NM_VIA_TRANSP'
      FixedChar = True
    end
    object qry_imp_notificacao_NM_EMBARCACAO: TStringField
      FieldName = 'NM_EMBARCACAO'
      FixedChar = True
      Size = 40
    end
    object qry_imp_notificacao_NM_UNID_NEG: TStringField
      FieldName = 'NM_UNID_NEG'
      FixedChar = True
      Size = 50
    end
    object qry_imp_notificacao_CGC_UNID_NEG: TStringField
      FieldName = 'CGC_UNID_NEG'
      FixedChar = True
      Size = 14
    end
    object qry_imp_notificacao_END_UNID_NEG: TStringField
      FieldName = 'END_UNID_NEG'
      FixedChar = True
      Size = 50
    end
    object qry_imp_notificacao_NR_UNID: TStringField
      FieldName = 'NR_UNID'
      FixedChar = True
      Size = 6
    end
    object qry_imp_notificacao_IE_UNID_NEG: TStringField
      FieldName = 'IE_UNID_NEG'
      FixedChar = True
    end
    object qry_imp_notificacao_FONE_UNID: TStringField
      FieldName = 'FONE_UNID'
      FixedChar = True
    end
    object qry_imp_notificacao_CEP_UNID: TStringField
      FieldName = 'CEP_UNID'
      FixedChar = True
      Size = 8
    end
    object qry_imp_notificacao_FAX_UNID: TStringField
      FieldName = 'FAX_UNID'
      FixedChar = True
    end
    object qry_imp_notificacao_NM_BANCO: TStringField
      FieldName = 'NM_BANCO'
      FixedChar = True
      Size = 40
    end
    object qry_imp_notificacao_NR_BANCO: TStringField
      FieldName = 'NR_BANCO'
      FixedChar = True
      Size = 3
    end
    object qry_imp_notificacao_CD_AGENCIA: TStringField
      FieldName = 'CD_AGENCIA'
      FixedChar = True
      Size = 5
    end
    object qry_imp_notificacao_NR_CONTA: TStringField
      FieldName = 'NR_CONTA'
      FixedChar = True
      Size = 10
    end
    object qry_imp_notificacao_NR_DECLARACAO_IMP: TStringField
      FieldName = 'NR_DECLARACAO_IMP'
      FixedChar = True
      Size = 10
    end
    object qry_imp_notificacao_TX_DOLAR: TFloatField
      FieldName = 'TX_DOLAR'
    end
    object qry_imp_notificacao_CD_LOCAL_EMBARQUE: TStringField
      FieldName = 'CD_LOCAL_EMBARQUE'
      FixedChar = True
      Size = 4
    end
    object qry_imp_notificacao_lOCAL: TStringField
      FieldName = 'lOCAL'
      FixedChar = True
      Size = 50
    end
    object qry_imp_notificacao_TP_DESTINO: TStringField
      FieldName = 'TP_DESTINO'
      FixedChar = True
      Size = 1
    end
    object qry_imp_notificacao_TX_MERCADORIA: TMemoField
      FieldName = 'TX_MERCADORIA'
      BlobType = ftMemo
    end
    object qry_imp_notificacao_NM_EMAIL: TStringField
      FieldName = 'NM_EMAIL'
      FixedChar = True
      Size = 50
    end
    object qry_imp_notificacao_TEL_IMPORTADOR: TStringField
      FieldName = 'TEL_IMPORTADOR'
      FixedChar = True
      Size = 15
    end
    object qry_imp_notificacao_FAX_IMPORTADOR: TStringField
      FieldName = 'FAX_IMPORTADOR'
      FixedChar = True
      Size = 15
    end
    object qry_imp_notificacao_CD_PRODUTO: TStringField
      FieldName = 'CD_PRODUTO'
      FixedChar = True
      Size = 2
    end
    object qry_imp_notificacao_NM_PRODUTO: TStringField
      FieldName = 'NM_PRODUTO'
      FixedChar = True
      Size = 40
    end
    object qry_imp_notificacao_DT_CHEGADA_CARGA2: TDateTimeField
      FieldName = 'DT_CHEGADA_CARGA'
    end
    object qry_imp_notificacao_CIDADE_UNID: TStringField
      FieldName = 'CIDADE_UNID'
      FixedChar = True
      Size = 30
    end
    object qry_imp_notificacao_NM_CONSIG: TStringField
      FieldName = 'NM_CONSIG'
      FixedChar = True
      Size = 50
    end
    object qry_imp_notificacao_END_CONSIG: TStringField
      FieldName = 'END_CONSIG'
      FixedChar = True
      Size = 50
    end
    object qry_imp_notificacao_END_NUMERO_CONSIG: TStringField
      FieldName = 'END_NUMERO_CONSIG'
      FixedChar = True
      Size = 6
    end
    object qry_imp_notificacao_END_CIDADE_CONSIG: TStringField
      FieldName = 'END_CIDADE_CONSIG'
      FixedChar = True
      Size = 30
    end
    object qry_imp_notificacao_END_BAIRRO_CONSIG: TStringField
      FieldName = 'END_BAIRRO_CONSIG'
      FixedChar = True
      Size = 30
    end
    object qry_imp_notificacao_END_COMPL_CONSIG: TStringField
      FieldName = 'END_COMPL_CONSIG'
      FixedChar = True
      Size = 50
    end
    object qry_imp_notificacao_END_UF_CONSIG: TStringField
      FieldName = 'END_UF_CONSIG'
      FixedChar = True
      Size = 2
    end
    object qry_imp_notificacao_END_CEP_CONSIG: TStringField
      FieldName = 'END_CEP_CONSIG'
      FixedChar = True
      Size = 8
    end
    object qry_imp_notificacao_CGC_CPF_CONSIG: TStringField
      FieldName = 'CGC_CPF_CONSIG'
      FixedChar = True
      Size = 14
    end
    object qry_imp_notificacao_calc_end_consig: TStringField
      FieldKind = fkCalculated
      FieldName = 'calc_end_consig'
      Size = 255
      Calculated = True
    end
    object qry_imp_notificacao_ARMAZEM_DESCAGA: TStringField
      FieldName = 'ARMAZEM_DESCAGA'
      FixedChar = True
      Size = 50
    end
    object qry_imp_notificacao_calcMLEDolar: TFloatField
      FieldKind = fkCalculated
      FieldName = 'calcMLEDolar'
      Calculated = True
    end
    object qry_imp_notificacao_TAXA_CAMBIO: TFloatField
      FieldName = 'TAXA_CAMBIO'
    end
    object qry_imp_notificacao_NM_EMP_EST_FI: TStringField
      FieldName = 'NM_EMP_EST_FI'
      FixedChar = True
      Size = 60
    end
    object qry_imp_notificacao_DT_NOTIFICACAO: TDateTimeField
      FieldName = 'DT_NOTIFICACAO'
    end
    object qry_imp_notificacao_DT_CHEGADA_FI: TDateTimeField
      FieldName = 'DT_CHEGADA_FI'
    end
    object qry_imp_notificacao_NR_HOUSE_FI: TStringField
      FieldName = 'NR_HOUSE_FI'
      FixedChar = True
      Size = 15
    end
    object qry_imp_notificacao_NM_EMB_FI: TStringField
      FieldName = 'NM_EMB_FI'
      FixedChar = True
      Size = 40
    end
    object qry_imp_notificacao_NM_ATRAC_FI: TStringField
      FieldName = 'NM_ATRAC_FI'
      FixedChar = True
      Size = 50
    end
    object qry_imp_notificacao_NR_PROPOSTA: TStringField
      FieldName = 'NR_PROPOSTA'
      FixedChar = True
    end
    object qry_imp_notificacao_calcMercadoriaFI: TStringField
      FieldKind = fkCalculated
      FieldName = 'calcMercadoriaFI'
      Size = 255
      Calculated = True
    end
    object qry_imp_notificacao_calc_nm_usuario_fi: TStringField
      FieldKind = fkCalculated
      FieldName = 'calc_nm_usuario_fi'
      Size = 255
      Calculated = True
    end
  end
  object ds_imp_notificacao: TDataSource
    DataSet = qry_imp_notificacao_
    Left = 535
    Top = 73
  end
  object pp_notificacao: TppBDEPipeline
    DataSource = ds_imp_notificacao
    UserName = '_notificacao'
    Left = 536
    Top = 137
    object pp_notificacaoppField1: TppField
      FieldAlias = 'calc_end_cliente'
      FieldName = 'calc_end_cliente'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 0
      Searchable = False
      Sortable = False
    end
    object pp_notificacaoppField2: TppField
      FieldAlias = 'cacl_nr_processo'
      FieldName = 'cacl_nr_processo'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 1
      Searchable = False
      Sortable = False
    end
    object pp_notificacaoppField3: TppField
      FieldAlias = 'calc_nm_usuario'
      FieldName = 'calc_nm_usuario'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 2
      Searchable = False
      Sortable = False
    end
    object pp_notificacaoppField4: TppField
      FieldAlias = 'calc_nm_destino'
      FieldName = 'calc_nm_destino'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 3
      Searchable = False
      Sortable = False
    end
    object pp_notificacaoppField5: TppField
      FieldAlias = 'NR_PROCESSO'
      FieldName = 'NR_PROCESSO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 4
      Searchable = False
      Sortable = False
    end
    object pp_notificacaoppField6: TppField
      FieldAlias = 'NR_SOLICITACAO'
      FieldName = 'NR_SOLICITACAO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 5
      Searchable = False
      Sortable = False
    end
    object pp_notificacaoppField7: TppField
      FieldAlias = 'NR_LANCAMENTO'
      FieldName = 'NR_LANCAMENTO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 6
      Searchable = False
      Sortable = False
    end
    object pp_notificacaoppField8: TppField
      FieldAlias = 'CD_ITEM'
      FieldName = 'CD_ITEM'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 7
      Searchable = False
      Sortable = False
    end
    object pp_notificacaoppField9: TppField
      FieldAlias = 'CD_MOEDA_VENDA'
      FieldName = 'CD_MOEDA_VENDA'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 8
      Searchable = False
      Sortable = False
    end
    object pp_notificacaoppField10: TppField
      FieldAlias = 'VL_VENDA'
      FieldName = 'VL_VENDA'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 9
      Searchable = False
      Sortable = False
    end
    object pp_notificacaoppField11: TppField
      FieldAlias = 'VL_SOLICITADO'
      FieldName = 'VL_SOLICITADO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 10
      Searchable = False
      Sortable = False
    end
    object pp_notificacaoppField12: TppField
      FieldAlias = 'CD_CLIENTE'
      FieldName = 'CD_CLIENTE'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 11
      Searchable = False
      Sortable = False
    end
    object pp_notificacaoppField13: TppField
      FieldAlias = 'NM_EMPRESA'
      FieldName = 'NM_EMPRESA'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 12
      Searchable = False
      Sortable = False
    end
    object pp_notificacaoppField14: TppField
      FieldAlias = 'END_EMPRESA'
      FieldName = 'END_EMPRESA'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 13
      Searchable = False
      Sortable = False
    end
    object pp_notificacaoppField15: TppField
      FieldAlias = 'END_NUMERO'
      FieldName = 'END_NUMERO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 14
      Searchable = False
      Sortable = False
    end
    object pp_notificacaoppField16: TppField
      FieldAlias = 'END_CIDADE'
      FieldName = 'END_CIDADE'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 15
      Searchable = False
      Sortable = False
    end
    object pp_notificacaoppField17: TppField
      FieldAlias = 'END_BAIRRO'
      FieldName = 'END_BAIRRO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 16
      Searchable = False
      Sortable = False
    end
    object pp_notificacaoppField18: TppField
      FieldAlias = 'END_COMPL'
      FieldName = 'END_COMPL'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 17
      Searchable = False
      Sortable = False
    end
    object pp_notificacaoppField19: TppField
      FieldAlias = 'END_UF'
      FieldName = 'END_UF'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 18
      Searchable = False
      Sortable = False
    end
    object pp_notificacaoppField20: TppField
      FieldAlias = 'END_CEP'
      FieldName = 'END_CEP'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 19
      Searchable = False
      Sortable = False
    end
    object pp_notificacaoppField21: TppField
      FieldAlias = 'CGC_CPF_EMRPESA'
      FieldName = 'CGC_CPF_EMRPESA'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 20
      Searchable = False
      Sortable = False
    end
    object pp_notificacaoppField22: TppField
      FieldAlias = 'NR_TELEFONE'
      FieldName = 'NR_TELEFONE'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 21
      Searchable = False
      Sortable = False
    end
    object pp_notificacaoppField23: TppField
      FieldAlias = 'NR_FAX'
      FieldName = 'NR_FAX'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 22
      Searchable = False
      Sortable = False
    end
    object pp_notificacaoppField24: TppField
      FieldAlias = 'REF_CLIENTE'
      FieldName = 'REF_CLIENTE'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 23
      Searchable = False
      Sortable = False
    end
    object pp_notificacaoppField25: TppField
      FieldAlias = 'NM_ITEM'
      FieldName = 'NM_ITEM'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 24
      Searchable = False
      Sortable = False
    end
    object pp_notificacaoppField26: TppField
      FieldAlias = 'TX_NUMERARIO_OBS'
      FieldName = 'TX_NUMERARIO_OBS'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 25
      Searchable = False
      Sortable = False
    end
    object pp_notificacaoppField27: TppField
      FieldAlias = 'NM_REF_DESEMBARACO'
      FieldName = 'NM_REF_DESEMBARACO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 26
      Searchable = False
      Sortable = False
    end
    object pp_notificacaoppField28: TppField
      FieldAlias = 'CD_CONTATO'
      FieldName = 'CD_CONTATO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 27
      Searchable = False
      Sortable = False
    end
    object pp_notificacaoppField29: TppField
      FieldAlias = 'NM_CONTATO'
      FieldName = 'NM_CONTATO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 28
      Searchable = False
      Sortable = False
    end
    object pp_notificacaoppField30: TppField
      FieldAlias = 'NM_EMP_EST'
      FieldName = 'NM_EMP_EST'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 29
      Searchable = False
      Sortable = False
    end
    object pp_notificacaoppField31: TppField
      FieldAlias = 'CIF_REAIS'
      FieldName = 'CIF_REAIS'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 30
      Searchable = False
      Sortable = False
    end
    object pp_notificacaoppField32: TppField
      FieldAlias = 'CIF_DOLAR'
      FieldName = 'CIF_DOLAR'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 31
      Searchable = False
      Sortable = False
    end
    object pp_notificacaoppField33: TppField
      FieldAlias = 'HAWB_BL'
      FieldName = 'HAWB_BL'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 32
      Searchable = False
      Sortable = False
    end
    object pp_notificacaoppField34: TppField
      FieldAlias = 'AWB_BL'
      FieldName = 'AWB_BL'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 33
      Searchable = False
      Sortable = False
    end
    object pp_notificacaoppField35: TppField
      FieldAlias = 'VL_MLE_MNEG'
      FieldName = 'VL_MLE_MNEG'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 34
      Searchable = False
      Sortable = False
    end
    object pp_notificacaoppField36: TppField
      FieldAlias = 'VL_FRETE'
      FieldName = 'VL_FRETE'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 35
      Searchable = False
      Sortable = False
    end
    object pp_notificacaoppField37: TppField
      FieldAlias = 'VL_SEGURO_MNEG'
      FieldName = 'VL_SEGURO_MNEG'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 36
      Searchable = False
      Sortable = False
    end
    object pp_notificacaoppField38: TppField
      FieldAlias = 'MOEDA_MLE'
      FieldName = 'MOEDA_MLE'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 37
      Searchable = False
      Sortable = False
    end
    object pp_notificacaoppField39: TppField
      FieldAlias = 'MOEDA_FRETE'
      FieldName = 'MOEDA_FRETE'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 38
      Searchable = False
      Sortable = False
    end
    object pp_notificacaoppField40: TppField
      FieldAlias = 'MOEDA_SEGURO'
      FieldName = 'MOEDA_SEGURO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 39
      Searchable = False
      Sortable = False
    end
    object pp_notificacaoppField41: TppField
      FieldAlias = 'NM_VIA_TRANSP'
      FieldName = 'NM_VIA_TRANSP'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 40
      Searchable = False
      Sortable = False
    end
    object pp_notificacaoppField42: TppField
      FieldAlias = 'NM_EMBARCACAO'
      FieldName = 'NM_EMBARCACAO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 41
      Searchable = False
      Sortable = False
    end
    object pp_notificacaoppField43: TppField
      FieldAlias = 'NM_UNID_NEG'
      FieldName = 'NM_UNID_NEG'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 42
      Searchable = False
      Sortable = False
    end
    object pp_notificacaoppField44: TppField
      FieldAlias = 'CGC_UNID_NEG'
      FieldName = 'CGC_UNID_NEG'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 43
      Searchable = False
      Sortable = False
    end
    object pp_notificacaoppField45: TppField
      FieldAlias = 'END_UNID_NEG'
      FieldName = 'END_UNID_NEG'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 44
      Searchable = False
      Sortable = False
    end
    object pp_notificacaoppField46: TppField
      FieldAlias = 'NR_UNID'
      FieldName = 'NR_UNID'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 45
      Searchable = False
      Sortable = False
    end
    object pp_notificacaoppField47: TppField
      FieldAlias = 'IE_UNID_NEG'
      FieldName = 'IE_UNID_NEG'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 46
      Searchable = False
      Sortable = False
    end
    object pp_notificacaoppField48: TppField
      FieldAlias = 'FONE_UNID'
      FieldName = 'FONE_UNID'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 47
      Searchable = False
      Sortable = False
    end
    object pp_notificacaoppField49: TppField
      FieldAlias = 'CEP_UNID'
      FieldName = 'CEP_UNID'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 48
      Searchable = False
      Sortable = False
    end
    object pp_notificacaoppField50: TppField
      FieldAlias = 'FAX_UNID'
      FieldName = 'FAX_UNID'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 49
      Searchable = False
      Sortable = False
    end
    object pp_notificacaoppField51: TppField
      FieldAlias = 'NM_BANCO'
      FieldName = 'NM_BANCO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 50
      Searchable = False
      Sortable = False
    end
    object pp_notificacaoppField52: TppField
      FieldAlias = 'NR_BANCO'
      FieldName = 'NR_BANCO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 51
      Searchable = False
      Sortable = False
    end
    object pp_notificacaoppField53: TppField
      FieldAlias = 'CD_AGENCIA'
      FieldName = 'CD_AGENCIA'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 52
      Searchable = False
      Sortable = False
    end
    object pp_notificacaoppField54: TppField
      FieldAlias = 'NR_CONTA'
      FieldName = 'NR_CONTA'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 53
      Searchable = False
      Sortable = False
    end
    object pp_notificacaoppField55: TppField
      FieldAlias = 'NR_DECLARACAO_IMP'
      FieldName = 'NR_DECLARACAO_IMP'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 54
      Searchable = False
      Sortable = False
    end
    object pp_notificacaoppField56: TppField
      FieldAlias = 'TX_DOLAR'
      FieldName = 'TX_DOLAR'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 55
      Searchable = False
      Sortable = False
    end
    object pp_notificacaoppField57: TppField
      FieldAlias = 'CD_LOCAL_EMBARQUE'
      FieldName = 'CD_LOCAL_EMBARQUE'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 56
      Searchable = False
      Sortable = False
    end
    object pp_notificacaoppField58: TppField
      FieldAlias = 'lOCAL'
      FieldName = 'lOCAL'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 57
      Searchable = False
      Sortable = False
    end
    object pp_notificacaoppField59: TppField
      FieldAlias = 'TP_DESTINO'
      FieldName = 'TP_DESTINO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 58
      Searchable = False
      Sortable = False
    end
    object pp_notificacaoppField60: TppField
      FieldAlias = 'TX_MERCADORIA'
      FieldName = 'TX_MERCADORIA'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 59
      Searchable = False
      Sortable = False
    end
    object pp_notificacaoppField61: TppField
      FieldAlias = 'NM_EMAIL'
      FieldName = 'NM_EMAIL'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 60
      Searchable = False
      Sortable = False
    end
    object pp_notificacaoppField62: TppField
      FieldAlias = 'TEL_IMPORTADOR'
      FieldName = 'TEL_IMPORTADOR'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 61
      Searchable = False
      Sortable = False
    end
    object pp_notificacaoppField63: TppField
      FieldAlias = 'FAX_IMPORTADOR'
      FieldName = 'FAX_IMPORTADOR'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 62
      Searchable = False
      Sortable = False
    end
    object pp_notificacaoppField64: TppField
      FieldAlias = 'CD_PRODUTO'
      FieldName = 'CD_PRODUTO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 63
      Searchable = False
      Sortable = False
    end
    object pp_notificacaoppField65: TppField
      FieldAlias = 'NM_PRODUTO'
      FieldName = 'NM_PRODUTO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 64
      Searchable = False
      Sortable = False
    end
    object pp_notificacaoppField66: TppField
      FieldAlias = 'DT_CHEGADA_CARGA'
      FieldName = 'DT_CHEGADA_CARGA'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 65
      Searchable = False
      Sortable = False
    end
    object pp_notificacaoppField67: TppField
      FieldAlias = 'CIDADE_UNID'
      FieldName = 'CIDADE_UNID'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 66
      Searchable = False
      Sortable = False
    end
    object pp_notificacaoppField68: TppField
      FieldAlias = 'NM_CONSIG'
      FieldName = 'NM_CONSIG'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 67
      Searchable = False
      Sortable = False
    end
    object pp_notificacaoppField69: TppField
      FieldAlias = 'END_CONSIG'
      FieldName = 'END_CONSIG'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 68
      Searchable = False
      Sortable = False
    end
    object pp_notificacaoppField70: TppField
      FieldAlias = 'END_NUMERO_CONSIG'
      FieldName = 'END_NUMERO_CONSIG'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 69
      Searchable = False
      Sortable = False
    end
    object pp_notificacaoppField71: TppField
      FieldAlias = 'END_CIDADE_CONSIG'
      FieldName = 'END_CIDADE_CONSIG'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 70
      Searchable = False
      Sortable = False
    end
    object pp_notificacaoppField72: TppField
      FieldAlias = 'END_BAIRRO_CONSIG'
      FieldName = 'END_BAIRRO_CONSIG'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 71
      Searchable = False
      Sortable = False
    end
    object pp_notificacaoppField73: TppField
      FieldAlias = 'END_COMPL_CONSIG'
      FieldName = 'END_COMPL_CONSIG'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 72
      Searchable = False
      Sortable = False
    end
    object pp_notificacaoppField74: TppField
      FieldAlias = 'END_UF_CONSIG'
      FieldName = 'END_UF_CONSIG'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 73
      Searchable = False
      Sortable = False
    end
    object pp_notificacaoppField75: TppField
      FieldAlias = 'END_CEP_CONSIG'
      FieldName = 'END_CEP_CONSIG'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 74
      Searchable = False
      Sortable = False
    end
    object pp_notificacaoppField76: TppField
      FieldAlias = 'CGC_CPF_CONSIG'
      FieldName = 'CGC_CPF_CONSIG'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 75
      Searchable = False
      Sortable = False
    end
    object pp_notificacaoppField77: TppField
      FieldAlias = 'calc_end_consig'
      FieldName = 'calc_end_consig'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 76
      Searchable = False
      Sortable = False
    end
    object pp_notificacaoppField78: TppField
      FieldAlias = 'ARMAZEM_DESCAGA'
      FieldName = 'ARMAZEM_DESCAGA'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 77
      Searchable = False
      Sortable = False
    end
    object pp_notificacaoppField79: TppField
      FieldAlias = 'calcMLEDolar'
      FieldName = 'calcMLEDolar'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 78
      Searchable = False
      Sortable = False
    end
    object pp_notificacaoppField80: TppField
      FieldAlias = 'TAXA_CAMBIO'
      FieldName = 'TAXA_CAMBIO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 79
      Searchable = False
      Sortable = False
    end
    object pp_notificacaoppField81: TppField
      FieldAlias = 'NM_EMP_EST_FI'
      FieldName = 'NM_EMP_EST_FI'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 80
      Searchable = False
      Sortable = False
    end
    object pp_notificacaoppField82: TppField
      FieldAlias = 'DT_NOTIFICACAO'
      FieldName = 'DT_NOTIFICACAO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 81
      Searchable = False
      Sortable = False
    end
    object pp_notificacaoppField83: TppField
      FieldAlias = 'DT_CHEGADA_FI'
      FieldName = 'DT_CHEGADA_FI'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 82
      Searchable = False
      Sortable = False
    end
    object pp_notificacaoppField84: TppField
      FieldAlias = 'NR_HOUSE_FI'
      FieldName = 'NR_HOUSE_FI'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 83
      Searchable = False
      Sortable = False
    end
    object pp_notificacaoppField85: TppField
      FieldAlias = 'NM_EMB_FI'
      FieldName = 'NM_EMB_FI'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 84
      Searchable = False
      Sortable = False
    end
    object pp_notificacaoppField86: TppField
      FieldAlias = 'NM_ATRAC_FI'
      FieldName = 'NM_ATRAC_FI'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 85
      Searchable = False
      Sortable = False
    end
    object pp_notificacaoppField87: TppField
      FieldAlias = 'NR_PROPOSTA'
      FieldName = 'NR_PROPOSTA'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 86
      Searchable = False
      Sortable = False
    end
    object pp_notificacaoppField88: TppField
      FieldAlias = 'calcMercadoriaFI'
      FieldName = 'calcMercadoriaFI'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 87
      Searchable = False
      Sortable = False
    end
    object pp_notificacaoppField89: TppField
      FieldAlias = 'calc_nm_usuario_fi'
      FieldName = 'calc_nm_usuario_fi'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 88
      Searchable = False
      Sortable = False
    end
  end
  object qry_imp_referencias_: TQuery
    OnCalcFields = qry_imp_notificacao_CalcFields
    DatabaseName = 'DBBROKER'
    DataSource = ds_imp_notificacao
    SQL.Strings = (
      
        'SELECT LTRIM(RTRIM(CD_REFERENCIA))+'#39'/'#39'+RTRIM(LTRIM(NR_ITEM_PO)) ' +
        'as CD_REFERENCIA FROM TREF_CLIENTE (NOLOCK)'
      'WHERE NR_PROCESSO = :NR_PROCESSO')
    Left = 683
    Top = 17
    ParamData = <
      item
        DataType = ftFixedChar
        Name = 'NR_PROCESSO'
        ParamType = ptUnknown
        Size = 19
      end>
    object qry_imp_referencias_CD_REFERENCIA: TStringField
      FieldName = 'CD_REFERENCIA'
      Origin = 'DBBROKER.TREF_CLIENTE.CD_REFERENCIA'
      FixedChar = True
    end
  end
  object ds_imp_referencias: TDataSource
    DataSet = qry_imp_referencias_
    Left = 683
    Top = 73
  end
  object pp_referencias: TppBDEPipeline
    DataSource = ds_imp_referencias
    RangeEnd = reCount
    RangeEndCount = 5
    UserName = '_referencias'
    Left = 683
    Top = 137
    object pp_referenciasppField1: TppField
      FieldAlias = 'CD_REFERENCIA'
      FieldName = 'CD_REFERENCIA'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 0
      Searchable = False
      Sortable = False
    end
  end
  object UpdNotifica: TUpdateSQL
    ModifySQL.Strings = (
      'update TNUMERARIO_NOTIFICA'
      'set'
      '  NR_PROCESSO = :NR_PROCESSO,'
      '  NR_SOLICITACAO = :NR_SOLICITACAO,'
      '  DT_SOLICITACAO = :DT_SOLICITACAO,'
      '  CD_USUARIO = :CD_USUARIO,'
      '  CD_STATUS = :CD_STATUS,'
      '  TX_NUMERARIO_OBS = :TX_NUMERARIO_OBS,'
      '  TX_NUMERARIO_ASS = :TX_NUMERARIO_ASS,'
      '  VL_SOLICITADO = :VL_SOLICITADO,'
      '  VL_RECEBIDO = :VL_RECEBIDO,'
      '  QT_ITENS_SOLIC = :QT_ITENS_SOLIC,'
      '  IN_EMITIDO = :IN_EMITIDO,'
      '  DT_EMISSAO = :DT_EMISSAO,'
      '  CD_BASE_CALCULO = :CD_BASE_CALCULO,'
      '  DT_PARIDADE = :DT_PARIDADE'
      'where'
      '  NR_PROCESSO = :OLD_NR_PROCESSO and'
      '  NR_SOLICITACAO = :OLD_NR_SOLICITACAO')
    InsertSQL.Strings = (
      'insert into TNUMERARIO_NOTIFICA'
      
        '  (NR_PROCESSO, NR_SOLICITACAO, DT_SOLICITACAO, CD_USUARIO, CD_S' +
        'TATUS, '
      
        '   TX_NUMERARIO_OBS, TX_NUMERARIO_ASS, VL_SOLICITADO, VL_RECEBID' +
        'O, QT_ITENS_SOLIC, '
      '   IN_EMITIDO, DT_EMISSAO, CD_BASE_CALCULO, DT_PARIDADE)'
      'values'
      
        '  (:NR_PROCESSO, :NR_SOLICITACAO, :DT_SOLICITACAO, :CD_USUARIO, ' +
        ':CD_STATUS, '
      
        '   :TX_NUMERARIO_OBS, :TX_NUMERARIO_ASS, :VL_SOLICITADO, :VL_REC' +
        'EBIDO, '
      
        '   :QT_ITENS_SOLIC, :IN_EMITIDO, :DT_EMISSAO, :CD_BASE_CALCULO, ' +
        ':DT_PARIDADE)')
    DeleteSQL.Strings = (
      'delete from TNUMERARIO_NOTIFICA'
      'where'
      '  NR_PROCESSO = :OLD_NR_PROCESSO and'
      '  NR_SOLICITACAO = :OLD_NR_SOLICITACAO')
    Left = 112
    Top = 120
  end
  object qry_imp_notificacao_exp_: TQuery
    OnCalcFields = qry_imp_notificacao_exp_CalcFields
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT P.NR_PROCESSO,'
      '       I.NR_SOLICITACAO,'
      '       I.NR_LANCAMENTO,'
      '       I.CD_ITEM,'
      '       I.CD_MOEDA_VENDA,'
      '       I.VL_VENDA,'
      '       I.VL_SOLICITADO,'
      '       P.CD_CLIENTE,'
      '       E.NM_EMPRESA,'
      '       E.END_EMPRESA,'
      '       E.END_NUMERO,'
      '       E.END_CIDADE,'
      '       E.END_BAIRRO,'
      '       E.END_COMPL,'
      '       E.END_UF,'
      '       E.END_CEP,'
      '       CASE CD_TIPO_PESSOA'
      '           WHEN '#39'0'#39' THEN  CPF_EMPRESA'
      '       ELSE  E.CGC_EMPRESA'
      '       END AS CGC_CPF_EMRPESA,'
      '       E.NR_TELEFONE,'
      '       E.NR_FAX,'
      '       P.REF_CLIENTE,'
      '       (SELECT IT.NM_ITEM'
      '        FROM TITEM IT (NOLOCK)'
      '        WHERE IT.CD_ITEM = I.CD_ITEM) NM_ITEM,'
      '       N.TX_NUMERARIO_OBS,'
      
        '       (SELECT TOP 1 LTRIM(RTRIM(R.CD_REFERENCIA)) + '#39'/'#39' + R.NR_' +
        'ITEM_PO'
      '        FROM TREF_CLIENTE R (NOLOCK)'
      '        WHERE R.NR_PROCESSO = P.NR_PROCESSO) NM_REF_DESEMBARACO,'
      '       P.TX_MERCADORIA,'
      '       P.CD_CONTATO,'
      '       (SELECT C.NM_CONTATO'
      '        FROM TCLIENTE_CONTATO C (NOLOCK)'
      '        WHERE  C.CD_CLIENTE = P.CD_CLIENTE'
      '          AND C.CD_UNID_NEG = P.CD_UNID_NEG'
      '          AND C.CD_PRODUTO = P.CD_PRODUTO'
      '          AND C.CD_CONTATO = P.CD_CONTATO ) NM_CONTATO,'
      '       (SELECT C.NM_EMAIL'
      '        FROM TCLIENTE_CONTATO C (NOLOCK)'
      '        WHERE  C.CD_CLIENTE = P.CD_CLIENTE'
      '          AND C.CD_UNID_NEG = P.CD_UNID_NEG'
      '          AND C.CD_PRODUTO = P.CD_PRODUTO'
      '          AND C.CD_CONTATO = P.CD_CONTATO ) NM_EMAIL,'
      '       E.NR_TELEFONE TEL_IMPORTADOR,'
      '       E.NR_FAX FAX_IMPORTADOR,'
      '       (SELECT EST.NM_EMPRESA + CASE ISNULL((SELECT EN.CD_GRUPO'
      
        '                                              FROM TEMPRESA_NAC ' +
        'EN (NOLOCK)'
      
        '                                              WHERE EN.CD_EMPRES' +
        'A = P.CD_CLIENTE), '#39#39')'
      
        '                                     WHEN '#39'028'#39' THEN CASE ISNULL' +
        '(EST.NR_CLIENTE, '#39#39')'
      
        '                                                         WHEN '#39#39 +
        ' THEN '#39#39
      
        '                                                     ELSE '#39' ('#39' +' +
        ' RTRIM(EST.NR_CLIENTE) + '#39')'#39
      '                                                     END'
      '                                 ELSE '#39#39
      '                                 END'
      '         FROM TEMPRESA_EST EST (NOLOCK)'
      '         WHERE EST.CD_EMPRESA = P.CD_IMPORTADOR) NM_EMP_EST,'
      '       P.VL_CIF_MN AS CIF_REAIS,'
      '       P.VL_CIF_DOLAR AS CIF_DOLAR,'
      '       P.NR_CONHECIMENTO AS HAWB_BL,'
      '       P.NR_CONHECIMENTO_MASTER AS AWB_BL,'
      '       P.VL_MLE_MNEG,'
      
        '       (P.VL_FRETE_PREPAID_MNEG + P.VL_FRETE_COLLECT_MNEG + P.VL' +
        '_FRETE_TNAC_MNEG) VL_FRETE,'
      '       P.VL_SEGURO_MNEG,'
      '       (SELECT AP_MOEDA'
      '        FROM TMOEDA_BROKER (NOLOCK)'
      '        WHERE CD_MOEDA = P.CD_MOEDA_MLE) MOEDA_MLE,'
      '       (SELECT AP_MOEDA'
      '        FROM TMOEDA_BROKER (NOLOCK)'
      '        WHERE CD_MOEDA = P.CD_MOEDA_FRETE) MOEDA_FRETE,'
      '       (SELECT AP_MOEDA'
      '        FROM TMOEDA_BROKER (NOLOCK)'
      '        WHERE CD_MOEDA = P.CD_MOEDA_SEGURO) MOEDA_SEGURO,'
      '       (SELECT V.NM_VIA_TRANSP'
      '        FROM TVIA_TRANSP_BROKER V (NOLOCK)'
      
        '        WHERE V.CD_VIA_TRANSP = S.CD_VIA_TRANSPORTE) NM_VIA_TRAN' +
        'SP,'
      '       (SELECT NM_EMBARCACAO'
      '        FROM TEMBARCACAO (NOLOCK)'
      '        WHERE CD_EMBARCACAO = P.CD_EMBARCACAO) NM_EMBARCACAO,'
      '       U.NM_UNID_NEG,'
      '       U.CGC_UNID_NEG,'
      '       U.END_UNID_NEG,'
      '       U.END_NUMERO AS NR_UNID,'
      '       U.IE_UNID_NEG,'
      '       U.NR_FONE AS FONE_UNID,'
      '       U.END_CEP AS CEP_UNID,'
      '       U.NR_FAX1 AS FAX_UNID,'
      '       U.END_CIDADE AS CIDADE_UNID,'
      '       B.NM_BANCO,'
      '       B.NR_BANCO,'
      '       B.CD_AGENCIA,'
      '       (B.NR_CONTA + '#39'-'#39' + B.DAC_AGENCIA) AS NR_CONTA,'
      '       D.NR_DECLARACAO_IMP,'
      '       (SELECT DT_ESPERADA'
      '        FROM TVIAGEM (NOLOCK)'
      '        WHERE CD_UNID_NEG = P.CD_UNID_NEG'
      '          AND CD_PRODUTO = P.CD_PRODUTO'
      '          AND CD_EMBARCACAO = P.CD_EMBARCACAO'
      '          AND NR_VIAGEM = P.NR_VIAGEM) DT_CHEGADA_CARGA,'
      '       D.TX_DOLAR,'
      '       P.CD_LOCAL_EMBARQUE,'
      '       (SELECT L.DESCRICAO + ISNULL((SELECT '#39'/'#39' + P.DESCRICAO'
      '                                      FROM TPAIS P (NOLOCK)'
      
        '                                      WHERE P.CODIGO = L.CD_PAIS' +
        '), '#39#39')'
      '         FROM TLOCAL_EMBARQUE L (NOLOCK)'
      '         WHERE L.CODIGO = P.CD_LOCAL_EMBARQUE) LOCAL,'
      '       CASE I.CD_ITEM'
      '            WHEN '#39'027'#39' THEN '#39'3'#39
      '        ELSE I.TP_DESTINO'
      '        END AS TP_DESTINO,'
      '       PRO.CD_PRODUTO,'
      '       PRO.NM_PRODUTO,'
      '       PE.TP_CONSIGNATARIO,'
      '       PE.CD_CONSIGNATARIO,'
      '       TES.END_EMPRESA AS END_CONSIG,'
      '       TES.END_NUMERO AS NUMERO_CONSIG,'
      '       TES.END_COMPL AS COMPL_CONSIG,'
      '       TES.END_CIDADE AS CIDADE_CONSIG,'
      '       TES.END_ESTADO AS EST_CONSIG,'
      '       TES.CGC_EMPRESA AS CGC_CONSIG,'
      '       P.VL_MLE_MN,'
      '       P.VL_FRETE_MN'
      
        'FROM TBANCO B (NOLOCK), TNUMERARIO_NOTIFICA_ITEM I (NOLOCK), TNU' +
        'MERARIO_NOTIFICA N (NOLOCK), TPROCESSO P (NOLOCK)'
      
        '   LEFT JOIN TEMPRESA_NAC E (NOLOCK) ON (P.CD_CLIENTE = E.CD_EMP' +
        'RESA)'
      '   LEFT JOIN TSERVICO S (NOLOCK) ON(S.CD_SERVICO = P.CD_SERVICO)'
      
        '   LEFT JOIN TUNID_NEG U (NOLOCK) ON(U.CD_UNID_NEG = P.CD_UNID_N' +
        'EG)'
      
        '   LEFT JOIN TDECLARACAO_IMPORTACAO D (NOLOCK) ON(D.NR_PROCESSO ' +
        '= P.NR_PROCESSO)'
      
        '   LEFT JOIN TPRODUTO PRO (NOLOCK) ON(PRO.CD_PRODUTO = SUBSTRING' +
        '(P.NR_PROCESSO,3,2) )'
      
        '   LEFT JOIN TPROCESSO_EXP PE (NOLOCK) ON PE.NR_PROCESSO = P.NR_' +
        'PROCESSO'
      
        '   LEFT JOIN TEMPRESA_EST TES (NOLOCK) ON TES.CD_EMPRESA = PE.CD' +
        '_CONSIGNATARIO'
      'WHERE P.NR_PROCESSO    = :NR_PROCESSO'
      '  AND P.NR_PROCESSO    = I.NR_PROCESSO'
      '  AND I.NR_SOLICITACAO = :NR_SOLICITACAO'
      '  AND I.NR_PROCESSO    = N.NR_PROCESSO'
      '  AND I.NR_SOLICITACAO = N.NR_SOLICITACAO'
      '  AND I.CD_BANCO       = B.CD_BANCO'
      '  AND I.VL_SOLICITADO  > 0'
      'ORDER BY I.TP_DESTINO, NM_ITEM')
    Left = 536
    Top = 217
    ParamData = <
      item
        DataType = ftFixedChar
        Name = 'NR_PROCESSO'
        ParamType = ptUnknown
      end
      item
        DataType = ftFixedChar
        Name = 'NR_SOLICITACAO'
        ParamType = ptUnknown
      end>
    object qry_imp_notificacao_exp_calc_end_cliente: TStringField
      FieldKind = fkCalculated
      FieldName = 'calc_end_cliente'
      Size = 255
      Calculated = True
    end
    object qry_imp_notificacao_exp_calc_nr_processo: TStringField
      FieldKind = fkCalculated
      FieldName = 'calc_nr_processo'
      Size = 10
      Calculated = True
    end
    object qry_imp_notificacao_exp_calc_nm_usuario: TStringField
      FieldKind = fkCalculated
      FieldName = 'calc_nm_usuario'
      Size = 80
      Calculated = True
    end
    object qry_imp_notificacao_exp_calc_nm_destino: TStringField
      FieldKind = fkCalculated
      FieldName = 'calc_nm_destino'
      Size = 80
      Calculated = True
    end
    object qry_imp_notificacao_exp_NR_PROCESSO: TStringField
      FieldName = 'NR_PROCESSO'
      FixedChar = True
      Size = 18
    end
    object qry_imp_notificacao_exp_NR_SOLICITACAO: TStringField
      FieldName = 'NR_SOLICITACAO'
      FixedChar = True
      Size = 3
    end
    object qry_imp_notificacao_exp_NR_LANCAMENTO: TStringField
      FieldName = 'NR_LANCAMENTO'
      FixedChar = True
      Size = 3
    end
    object qry_imp_notificacao_exp_CD_ITEM: TStringField
      FieldName = 'CD_ITEM'
      FixedChar = True
      Size = 3
    end
    object qry_imp_notificacao_exp_CD_MOEDA_VENDA: TStringField
      FieldName = 'CD_MOEDA_VENDA'
      FixedChar = True
      Size = 3
    end
    object qry_imp_notificacao_exp_VL_VENDA: TFloatField
      FieldName = 'VL_VENDA'
    end
    object qry_imp_notificacao_exp_VL_SOLICITADO: TFloatField
      FieldName = 'VL_SOLICITADO'
    end
    object qry_imp_notificacao_exp_CD_CLIENTE: TStringField
      FieldName = 'CD_CLIENTE'
      FixedChar = True
      Size = 5
    end
    object qry_imp_notificacao_exp_NM_EMPRESA: TStringField
      FieldName = 'NM_EMPRESA'
      FixedChar = True
      Size = 50
    end
    object qry_imp_notificacao_exp_END_EMPRESA: TStringField
      FieldName = 'END_EMPRESA'
      FixedChar = True
      Size = 50
    end
    object qry_imp_notificacao_exp_END_NUMERO: TStringField
      FieldName = 'END_NUMERO'
      FixedChar = True
      Size = 6
    end
    object qry_imp_notificacao_exp_END_CIDADE: TStringField
      FieldName = 'END_CIDADE'
      FixedChar = True
      Size = 30
    end
    object qry_imp_notificacao_exp_END_BAIRRO: TStringField
      FieldName = 'END_BAIRRO'
      FixedChar = True
      Size = 30
    end
    object qry_imp_notificacao_exp_END_COMPL: TStringField
      FieldName = 'END_COMPL'
      FixedChar = True
      Size = 50
    end
    object qry_imp_notificacao_exp_END_UF: TStringField
      FieldName = 'END_UF'
      FixedChar = True
      Size = 2
    end
    object qry_imp_notificacao_exp_END_CEP: TStringField
      FieldName = 'END_CEP'
      FixedChar = True
      Size = 8
    end
    object qry_imp_notificacao_exp_CGC_CPF_EMRPESA: TStringField
      FieldName = 'CGC_CPF_EMRPESA'
      FixedChar = True
      Size = 14
    end
    object qry_imp_notificacao_exp_NR_TELEFONE: TStringField
      FieldName = 'NR_TELEFONE'
      FixedChar = True
      Size = 15
    end
    object qry_imp_notificacao_exp_NR_FAX: TStringField
      FieldName = 'NR_FAX'
      FixedChar = True
      Size = 15
    end
    object qry_imp_notificacao_exp_REF_CLIENTE: TStringField
      FieldName = 'REF_CLIENTE'
      FixedChar = True
    end
    object qry_imp_notificacao_exp_NM_ITEM: TStringField
      FieldName = 'NM_ITEM'
      FixedChar = True
      Size = 30
    end
    object qry_imp_notificacao_exp_TX_NUMERARIO_OBS: TMemoField
      FieldName = 'TX_NUMERARIO_OBS'
      BlobType = ftMemo
    end
    object qry_imp_notificacao_exp_NM_REF_DESEMBARACO: TStringField
      FieldName = 'NM_REF_DESEMBARACO'
      FixedChar = True
    end
    object qry_imp_notificacao_exp_TX_MERCADORIA: TMemoField
      FieldName = 'TX_MERCADORIA'
      BlobType = ftMemo
    end
    object qry_imp_notificacao_exp_CD_CONTATO: TStringField
      FieldName = 'CD_CONTATO'
      FixedChar = True
      Size = 3
    end
    object qry_imp_notificacao_exp_NM_CONTATO: TStringField
      FieldName = 'NM_CONTATO'
      FixedChar = True
      Size = 50
    end
    object qry_imp_notificacao_exp_NM_EMAIL: TStringField
      FieldName = 'NM_EMAIL'
      FixedChar = True
      Size = 50
    end
    object qry_imp_notificacao_exp_TEL_IMPORTADOR: TStringField
      FieldName = 'TEL_IMPORTADOR'
      FixedChar = True
      Size = 15
    end
    object qry_imp_notificacao_exp_FAX_IMPORTADOR: TStringField
      FieldName = 'FAX_IMPORTADOR'
      FixedChar = True
      Size = 15
    end
    object qry_imp_notificacao_exp_NM_EMP_EST: TStringField
      FieldName = 'NM_EMP_EST'
      FixedChar = True
      Size = 60
    end
    object qry_imp_notificacao_exp_CIF_REAIS: TFloatField
      FieldName = 'CIF_REAIS'
    end
    object qry_imp_notificacao_exp_CIF_DOLAR: TFloatField
      FieldName = 'CIF_DOLAR'
    end
    object qry_imp_notificacao_exp_HAWB_BL: TStringField
      FieldName = 'HAWB_BL'
      FixedChar = True
      Size = 30
    end
    object qry_imp_notificacao_exp_AWB_BL: TStringField
      FieldName = 'AWB_BL'
      FixedChar = True
      Size = 30
    end
    object qry_imp_notificacao_exp_VL_MLE_MNEG: TFloatField
      FieldName = 'VL_MLE_MNEG'
    end
    object qry_imp_notificacao_exp_VL_FRETE: TFloatField
      FieldName = 'VL_FRETE'
    end
    object qry_imp_notificacao_exp_VL_SEGURO_MNEG: TFloatField
      FieldName = 'VL_SEGURO_MNEG'
    end
    object qry_imp_notificacao_exp_MOEDA_MLE: TStringField
      FieldName = 'MOEDA_MLE'
      FixedChar = True
      Size = 6
    end
    object qry_imp_notificacao_exp_MOEDA_FRETE: TStringField
      FieldName = 'MOEDA_FRETE'
      FixedChar = True
      Size = 6
    end
    object qry_imp_notificacao_exp_MOEDA_SEGURO: TStringField
      FieldName = 'MOEDA_SEGURO'
      FixedChar = True
      Size = 6
    end
    object qry_imp_notificacao_exp_NM_VIA_TRANSP: TStringField
      FieldName = 'NM_VIA_TRANSP'
      FixedChar = True
    end
    object qry_imp_notificacao_exp_NM_EMBARCACAO: TStringField
      FieldName = 'NM_EMBARCACAO'
      FixedChar = True
      Size = 40
    end
    object qry_imp_notificacao_exp_NM_UNID_NEG: TStringField
      FieldName = 'NM_UNID_NEG'
      FixedChar = True
      Size = 50
    end
    object qry_imp_notificacao_exp_CGC_UNID_NEG: TStringField
      FieldName = 'CGC_UNID_NEG'
      FixedChar = True
      Size = 14
    end
    object qry_imp_notificacao_exp_END_UNID_NEG: TStringField
      FieldName = 'END_UNID_NEG'
      FixedChar = True
      Size = 50
    end
    object qry_imp_notificacao_exp_NR_UNID: TStringField
      FieldName = 'NR_UNID'
      FixedChar = True
      Size = 6
    end
    object qry_imp_notificacao_exp_IE_UNID_NEG: TStringField
      FieldName = 'IE_UNID_NEG'
      FixedChar = True
    end
    object qry_imp_notificacao_exp_FONE_UNID: TStringField
      FieldName = 'FONE_UNID'
      FixedChar = True
    end
    object qry_imp_notificacao_exp_CEP_UNID: TStringField
      FieldName = 'CEP_UNID'
      FixedChar = True
      Size = 8
    end
    object qry_imp_notificacao_exp_FAX_UNID: TStringField
      FieldName = 'FAX_UNID'
      FixedChar = True
    end
    object qry_imp_notificacao_exp_NM_BANCO: TStringField
      FieldName = 'NM_BANCO'
      FixedChar = True
      Size = 40
    end
    object qry_imp_notificacao_exp_NR_BANCO: TStringField
      FieldName = 'NR_BANCO'
      FixedChar = True
      Size = 3
    end
    object qry_imp_notificacao_exp_CD_AGENCIA: TStringField
      FieldName = 'CD_AGENCIA'
      FixedChar = True
      Size = 5
    end
    object qry_imp_notificacao_exp_NR_CONTA: TStringField
      FieldName = 'NR_CONTA'
      FixedChar = True
      Size = 10
    end
    object qry_imp_notificacao_exp_NR_DECLARACAO_IMP: TStringField
      FieldName = 'NR_DECLARACAO_IMP'
      FixedChar = True
      Size = 10
    end
    object qry_imp_notificacao_exp_TX_DOLAR: TFloatField
      FieldName = 'TX_DOLAR'
    end
    object qry_imp_notificacao_exp_CD_LOCAL_EMBARQUE: TStringField
      FieldName = 'CD_LOCAL_EMBARQUE'
      FixedChar = True
      Size = 4
    end
    object qry_imp_notificacao_exp_lOCAL: TStringField
      FieldName = 'lOCAL'
      FixedChar = True
      Size = 50
    end
    object qry_imp_notificacao_exp_TP_DESTINO: TStringField
      FieldName = 'TP_DESTINO'
      FixedChar = True
      Size = 1
    end
    object qry_imp_notificacao_exp_CD_PRODUTO: TStringField
      FieldName = 'CD_PRODUTO'
      FixedChar = True
      Size = 2
    end
    object qry_imp_notificacao_exp_NM_PRODUTO: TStringField
      FieldName = 'NM_PRODUTO'
      FixedChar = True
      Size = 40
    end
    object qry_imp_notificacao_exp_DT_CHEGADA_CARGA: TDateTimeField
      FieldName = 'DT_CHEGADA_CARGA'
    end
    object qry_imp_notificacao_exp_CIDADE_UNID: TStringField
      FieldName = 'CIDADE_UNID'
      FixedChar = True
      Size = 30
    end
    object qry_imp_notificacao_exp_TP_CONSIGNATARIO: TStringField
      FieldName = 'TP_CONSIGNATARIO'
      FixedChar = True
      Size = 1
    end
    object qry_imp_notificacao_exp_CD_CONSIGNATARIO: TStringField
      FieldName = 'CD_CONSIGNATARIO'
      FixedChar = True
      Size = 5
    end
    object qry_imp_notificacao_exp_calcNmConsig: TStringField
      FieldKind = fkCalculated
      FieldName = 'calcNmConsig'
      Size = 100
      Calculated = True
    end
    object qry_imp_notificacao_exp_END_CONSIG: TStringField
      FieldName = 'END_CONSIG'
      FixedChar = True
      Size = 60
    end
    object qry_imp_notificacao_exp_NUMERO_CONSIG: TStringField
      FieldName = 'NUMERO_CONSIG'
      FixedChar = True
      Size = 6
    end
    object qry_imp_notificacao_exp_COMPL_CONSIG: TStringField
      FieldName = 'COMPL_CONSIG'
      FixedChar = True
      Size = 41
    end
    object qry_imp_notificacao_exp_CIDADE_CONSIG: TStringField
      FieldName = 'CIDADE_CONSIG'
      FixedChar = True
      Size = 30
    end
    object qry_imp_notificacao_exp_EST_CONSIG: TStringField
      FieldName = 'EST_CONSIG'
      FixedChar = True
      Size = 30
    end
    object qry_imp_notificacao_exp_calcENDConsig: TStringField
      FieldKind = fkCalculated
      FieldName = 'calcENDConsig'
      Size = 255
      Calculated = True
    end
    object qry_imp_notificacao_exp_CGC_CONSIG: TStringField
      FieldName = 'CGC_CONSIG'
      FixedChar = True
      Size = 14
    end
    object qry_imp_notificacao_exp_calcMLEDolar: TFloatField
      FieldKind = fkCalculated
      FieldName = 'calcMLEDolar'
      Calculated = True
    end
    object qry_imp_notificacao_exp_VL_MLE_MN: TFloatField
      FieldName = 'VL_MLE_MN'
    end
    object qry_imp_notificacao_exp_VL_FRETE_MN: TFloatField
      FieldName = 'VL_FRETE_MN'
    end
  end
  object ds_imp_notificacao_exp: TDataSource
    DataSet = qry_imp_notificacao_exp_
    Left = 535
    Top = 273
  end
  object pp_notificacao_exp: TppBDEPipeline
    DataSource = ds_imp_notificacao_exp
    UserName = '_notificacao1'
    Left = 535
    Top = 337
    object pp_notificacao_expppField1: TppField
      FieldAlias = 'calc_end_cliente'
      FieldName = 'calc_end_cliente'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 0
      Searchable = False
      Sortable = False
    end
    object pp_notificacao_expppField2: TppField
      FieldAlias = 'calc_nr_processo'
      FieldName = 'calc_nr_processo'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 1
      Searchable = False
      Sortable = False
    end
    object pp_notificacao_expppField3: TppField
      FieldAlias = 'calc_nm_usuario'
      FieldName = 'calc_nm_usuario'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 2
      Searchable = False
      Sortable = False
    end
    object pp_notificacao_expppField4: TppField
      FieldAlias = 'calc_nm_destino'
      FieldName = 'calc_nm_destino'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 3
      Searchable = False
      Sortable = False
    end
    object pp_notificacao_expppField5: TppField
      FieldAlias = 'NR_PROCESSO'
      FieldName = 'NR_PROCESSO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 4
      Searchable = False
      Sortable = False
    end
    object pp_notificacao_expppField6: TppField
      FieldAlias = 'NR_SOLICITACAO'
      FieldName = 'NR_SOLICITACAO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 5
      Searchable = False
      Sortable = False
    end
    object pp_notificacao_expppField7: TppField
      FieldAlias = 'NR_LANCAMENTO'
      FieldName = 'NR_LANCAMENTO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 6
      Searchable = False
      Sortable = False
    end
    object pp_notificacao_expppField8: TppField
      FieldAlias = 'CD_ITEM'
      FieldName = 'CD_ITEM'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 7
      Searchable = False
      Sortable = False
    end
    object pp_notificacao_expppField9: TppField
      FieldAlias = 'CD_MOEDA_VENDA'
      FieldName = 'CD_MOEDA_VENDA'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 8
      Searchable = False
      Sortable = False
    end
    object pp_notificacao_expppField10: TppField
      FieldAlias = 'VL_VENDA'
      FieldName = 'VL_VENDA'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 9
      Searchable = False
      Sortable = False
    end
    object pp_notificacao_expppField11: TppField
      FieldAlias = 'VL_SOLICITADO'
      FieldName = 'VL_SOLICITADO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 10
      Searchable = False
      Sortable = False
    end
    object pp_notificacao_expppField12: TppField
      FieldAlias = 'CD_CLIENTE'
      FieldName = 'CD_CLIENTE'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 11
      Searchable = False
      Sortable = False
    end
    object pp_notificacao_expppField13: TppField
      FieldAlias = 'NM_EMPRESA'
      FieldName = 'NM_EMPRESA'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 12
      Searchable = False
      Sortable = False
    end
    object pp_notificacao_expppField14: TppField
      FieldAlias = 'END_EMPRESA'
      FieldName = 'END_EMPRESA'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 13
      Searchable = False
      Sortable = False
    end
    object pp_notificacao_expppField15: TppField
      FieldAlias = 'END_NUMERO'
      FieldName = 'END_NUMERO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 14
      Searchable = False
      Sortable = False
    end
    object pp_notificacao_expppField16: TppField
      FieldAlias = 'END_CIDADE'
      FieldName = 'END_CIDADE'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 15
      Searchable = False
      Sortable = False
    end
    object pp_notificacao_expppField17: TppField
      FieldAlias = 'END_BAIRRO'
      FieldName = 'END_BAIRRO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 16
      Searchable = False
      Sortable = False
    end
    object pp_notificacao_expppField18: TppField
      FieldAlias = 'END_COMPL'
      FieldName = 'END_COMPL'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 17
      Searchable = False
      Sortable = False
    end
    object pp_notificacao_expppField19: TppField
      FieldAlias = 'END_UF'
      FieldName = 'END_UF'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 18
      Searchable = False
      Sortable = False
    end
    object pp_notificacao_expppField20: TppField
      FieldAlias = 'END_CEP'
      FieldName = 'END_CEP'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 19
      Searchable = False
      Sortable = False
    end
    object pp_notificacao_expppField21: TppField
      FieldAlias = 'CGC_CPF_EMRPESA'
      FieldName = 'CGC_CPF_EMRPESA'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 20
      Searchable = False
      Sortable = False
    end
    object pp_notificacao_expppField22: TppField
      FieldAlias = 'NR_TELEFONE'
      FieldName = 'NR_TELEFONE'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 21
      Searchable = False
      Sortable = False
    end
    object pp_notificacao_expppField23: TppField
      FieldAlias = 'NR_FAX'
      FieldName = 'NR_FAX'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 22
      Searchable = False
      Sortable = False
    end
    object pp_notificacao_expppField24: TppField
      FieldAlias = 'REF_CLIENTE'
      FieldName = 'REF_CLIENTE'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 23
      Searchable = False
      Sortable = False
    end
    object pp_notificacao_expppField25: TppField
      FieldAlias = 'NM_ITEM'
      FieldName = 'NM_ITEM'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 24
      Searchable = False
      Sortable = False
    end
    object pp_notificacao_expppField26: TppField
      FieldAlias = 'TX_NUMERARIO_OBS'
      FieldName = 'TX_NUMERARIO_OBS'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 25
      Searchable = False
      Sortable = False
    end
    object pp_notificacao_expppField27: TppField
      FieldAlias = 'NM_REF_DESEMBARACO'
      FieldName = 'NM_REF_DESEMBARACO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 26
      Searchable = False
      Sortable = False
    end
    object pp_notificacao_expppField28: TppField
      FieldAlias = 'TX_MERCADORIA'
      FieldName = 'TX_MERCADORIA'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 27
      Searchable = False
      Sortable = False
    end
    object pp_notificacao_expppField29: TppField
      FieldAlias = 'CD_CONTATO'
      FieldName = 'CD_CONTATO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 28
      Searchable = False
      Sortable = False
    end
    object pp_notificacao_expppField30: TppField
      FieldAlias = 'NM_CONTATO'
      FieldName = 'NM_CONTATO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 29
      Searchable = False
      Sortable = False
    end
    object pp_notificacao_expppField31: TppField
      FieldAlias = 'NM_EMAIL'
      FieldName = 'NM_EMAIL'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 30
      Searchable = False
      Sortable = False
    end
    object pp_notificacao_expppField32: TppField
      FieldAlias = 'TEL_IMPORTADOR'
      FieldName = 'TEL_IMPORTADOR'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 31
      Searchable = False
      Sortable = False
    end
    object pp_notificacao_expppField33: TppField
      FieldAlias = 'FAX_IMPORTADOR'
      FieldName = 'FAX_IMPORTADOR'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 32
      Searchable = False
      Sortable = False
    end
    object pp_notificacao_expppField34: TppField
      FieldAlias = 'NM_EMP_EST'
      FieldName = 'NM_EMP_EST'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 33
      Searchable = False
      Sortable = False
    end
    object pp_notificacao_expppField35: TppField
      FieldAlias = 'CIF_REAIS'
      FieldName = 'CIF_REAIS'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 34
      Searchable = False
      Sortable = False
    end
    object pp_notificacao_expppField36: TppField
      FieldAlias = 'CIF_DOLAR'
      FieldName = 'CIF_DOLAR'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 35
      Searchable = False
      Sortable = False
    end
    object pp_notificacao_expppField37: TppField
      FieldAlias = 'HAWB_BL'
      FieldName = 'HAWB_BL'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 36
      Searchable = False
      Sortable = False
    end
    object pp_notificacao_expppField38: TppField
      FieldAlias = 'AWB_BL'
      FieldName = 'AWB_BL'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 37
      Searchable = False
      Sortable = False
    end
    object pp_notificacao_expppField39: TppField
      FieldAlias = 'VL_MLE_MNEG'
      FieldName = 'VL_MLE_MNEG'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 38
      Searchable = False
      Sortable = False
    end
    object pp_notificacao_expppField40: TppField
      FieldAlias = 'VL_FRETE'
      FieldName = 'VL_FRETE'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 39
      Searchable = False
      Sortable = False
    end
    object pp_notificacao_expppField41: TppField
      FieldAlias = 'VL_SEGURO_MNEG'
      FieldName = 'VL_SEGURO_MNEG'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 40
      Searchable = False
      Sortable = False
    end
    object pp_notificacao_expppField42: TppField
      FieldAlias = 'MOEDA_MLE'
      FieldName = 'MOEDA_MLE'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 41
      Searchable = False
      Sortable = False
    end
    object pp_notificacao_expppField43: TppField
      FieldAlias = 'MOEDA_FRETE'
      FieldName = 'MOEDA_FRETE'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 42
      Searchable = False
      Sortable = False
    end
    object pp_notificacao_expppField44: TppField
      FieldAlias = 'MOEDA_SEGURO'
      FieldName = 'MOEDA_SEGURO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 43
      Searchable = False
      Sortable = False
    end
    object pp_notificacao_expppField45: TppField
      FieldAlias = 'NM_VIA_TRANSP'
      FieldName = 'NM_VIA_TRANSP'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 44
      Searchable = False
      Sortable = False
    end
    object pp_notificacao_expppField46: TppField
      FieldAlias = 'NM_EMBARCACAO'
      FieldName = 'NM_EMBARCACAO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 45
      Searchable = False
      Sortable = False
    end
    object pp_notificacao_expppField47: TppField
      FieldAlias = 'NM_UNID_NEG'
      FieldName = 'NM_UNID_NEG'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 46
      Searchable = False
      Sortable = False
    end
    object pp_notificacao_expppField48: TppField
      FieldAlias = 'CGC_UNID_NEG'
      FieldName = 'CGC_UNID_NEG'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 47
      Searchable = False
      Sortable = False
    end
    object pp_notificacao_expppField49: TppField
      FieldAlias = 'END_UNID_NEG'
      FieldName = 'END_UNID_NEG'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 48
      Searchable = False
      Sortable = False
    end
    object pp_notificacao_expppField50: TppField
      FieldAlias = 'NR_UNID'
      FieldName = 'NR_UNID'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 49
      Searchable = False
      Sortable = False
    end
    object pp_notificacao_expppField51: TppField
      FieldAlias = 'IE_UNID_NEG'
      FieldName = 'IE_UNID_NEG'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 50
      Searchable = False
      Sortable = False
    end
    object pp_notificacao_expppField52: TppField
      FieldAlias = 'FONE_UNID'
      FieldName = 'FONE_UNID'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 51
      Searchable = False
      Sortable = False
    end
    object pp_notificacao_expppField53: TppField
      FieldAlias = 'CEP_UNID'
      FieldName = 'CEP_UNID'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 52
      Searchable = False
      Sortable = False
    end
    object pp_notificacao_expppField54: TppField
      FieldAlias = 'FAX_UNID'
      FieldName = 'FAX_UNID'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 53
      Searchable = False
      Sortable = False
    end
    object pp_notificacao_expppField55: TppField
      FieldAlias = 'NM_BANCO'
      FieldName = 'NM_BANCO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 54
      Searchable = False
      Sortable = False
    end
    object pp_notificacao_expppField56: TppField
      FieldAlias = 'NR_BANCO'
      FieldName = 'NR_BANCO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 55
      Searchable = False
      Sortable = False
    end
    object pp_notificacao_expppField57: TppField
      FieldAlias = 'CD_AGENCIA'
      FieldName = 'CD_AGENCIA'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 56
      Searchable = False
      Sortable = False
    end
    object pp_notificacao_expppField58: TppField
      FieldAlias = 'NR_CONTA'
      FieldName = 'NR_CONTA'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 57
      Searchable = False
      Sortable = False
    end
    object pp_notificacao_expppField59: TppField
      FieldAlias = 'NR_DECLARACAO_IMP'
      FieldName = 'NR_DECLARACAO_IMP'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 58
      Searchable = False
      Sortable = False
    end
    object pp_notificacao_expppField60: TppField
      FieldAlias = 'TX_DOLAR'
      FieldName = 'TX_DOLAR'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 59
      Searchable = False
      Sortable = False
    end
    object pp_notificacao_expppField61: TppField
      FieldAlias = 'CD_LOCAL_EMBARQUE'
      FieldName = 'CD_LOCAL_EMBARQUE'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 60
      Searchable = False
      Sortable = False
    end
    object pp_notificacao_expppField62: TppField
      FieldAlias = 'lOCAL'
      FieldName = 'lOCAL'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 61
      Searchable = False
      Sortable = False
    end
    object pp_notificacao_expppField63: TppField
      FieldAlias = 'TP_DESTINO'
      FieldName = 'TP_DESTINO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 62
      Searchable = False
      Sortable = False
    end
    object pp_notificacao_expppField64: TppField
      FieldAlias = 'CD_PRODUTO'
      FieldName = 'CD_PRODUTO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 63
      Searchable = False
      Sortable = False
    end
    object pp_notificacao_expppField65: TppField
      FieldAlias = 'NM_PRODUTO'
      FieldName = 'NM_PRODUTO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 64
      Searchable = False
      Sortable = False
    end
    object pp_notificacao_expppField66: TppField
      FieldAlias = 'DT_CHEGADA_CARGA'
      FieldName = 'DT_CHEGADA_CARGA'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 65
      Searchable = False
      Sortable = False
    end
    object pp_notificacao_expppField67: TppField
      FieldAlias = 'CIDADE_UNID'
      FieldName = 'CIDADE_UNID'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 66
      Searchable = False
      Sortable = False
    end
    object pp_notificacao_expppField68: TppField
      FieldAlias = 'TP_CONSIGNATARIO'
      FieldName = 'TP_CONSIGNATARIO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 67
      Searchable = False
      Sortable = False
    end
    object pp_notificacao_expppField69: TppField
      FieldAlias = 'CD_CONSIGNATARIO'
      FieldName = 'CD_CONSIGNATARIO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 68
      Searchable = False
      Sortable = False
    end
    object pp_notificacao_expppField70: TppField
      FieldAlias = 'calcNmConsig'
      FieldName = 'calcNmConsig'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 69
      Searchable = False
      Sortable = False
    end
    object pp_notificacao_expppField71: TppField
      FieldAlias = 'END_CONSIG'
      FieldName = 'END_CONSIG'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 70
      Searchable = False
      Sortable = False
    end
    object pp_notificacao_expppField72: TppField
      FieldAlias = 'NUMERO_CONSIG'
      FieldName = 'NUMERO_CONSIG'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 71
      Searchable = False
      Sortable = False
    end
    object pp_notificacao_expppField73: TppField
      FieldAlias = 'COMPL_CONSIG'
      FieldName = 'COMPL_CONSIG'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 72
      Searchable = False
      Sortable = False
    end
    object pp_notificacao_expppField74: TppField
      FieldAlias = 'CIDADE_CONSIG'
      FieldName = 'CIDADE_CONSIG'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 73
      Searchable = False
      Sortable = False
    end
    object pp_notificacao_expppField75: TppField
      FieldAlias = 'EST_CONSIG'
      FieldName = 'EST_CONSIG'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 74
      Searchable = False
      Sortable = False
    end
    object pp_notificacao_expppField76: TppField
      FieldAlias = 'calcENDConsig'
      FieldName = 'calcENDConsig'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 75
      Searchable = False
      Sortable = False
    end
    object pp_notificacao_expppField77: TppField
      FieldAlias = 'CGC_CONSIG'
      FieldName = 'CGC_CONSIG'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 76
      Searchable = False
      Sortable = False
    end
    object pp_notificacao_expppField78: TppField
      FieldAlias = 'calcMLEDolar'
      FieldName = 'calcMLEDolar'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 77
      Searchable = False
      Sortable = False
    end
    object pp_notificacao_expppField79: TppField
      FieldAlias = 'VL_MLE_MN'
      FieldName = 'VL_MLE_MN'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 78
      Searchable = False
      Sortable = False
    end
    object pp_notificacao_expppField80: TppField
      FieldAlias = 'VL_FRETE_MN'
      FieldName = 'VL_FRETE_MN'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 79
      Searchable = False
      Sortable = False
    end
  end
  object dsLCL: TDataSource
    DataSet = qryLCL
    Left = 647
    Top = 273
  end
  object qryLCL: TQuery
    OnCalcFields = qry_imp_notificacao_CalcFields
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      
        '--SELECT CONVERT(CHAR(3), VL_QTDE) + '#39' '#39' + by carlos estava dand' +
        'o erro ponto flutuante 15/07/2010'
      'SELECT CONVERT(CHAR, VL_QTDE) + '#39' '#39' +'
      '       RTRIM(LTRIM(NM_ESPECIE)) +'
      '       '#39' (Peso: '#39' + CONVERT(VARCHAR, ISNULL(PC.PESO, 0)) +'
      
        '       '#39', Cubagem: '#39' + CONVERT(VARCHAR, ISNULL(PC.VL_CUBAGEM_M3,' +
        ' 0)) + '#39'), '#39' TEXTO'
      
        'FROM TPROCESSO P (NOLOCK) INNER JOIN TPROCESSO_CARGA_SOLTA PC (N' +
        'OLOCK) ON PC.NR_PROCESSO = P.NR_PROCESSO'
      '  AND P.TP_ESTUFAGEM <> '#39'1'#39
      'WHERE P.NR_PROCESSO = :NR_PROCESSO')
    Left = 647
    Top = 217
    ParamData = <
      item
        DataType = ftFixedChar
        Name = 'NR_PROCESSO'
        ParamType = ptInput
      end>
    object qryLCLTEXTO: TStringField
      FieldName = 'TEXTO'
      FixedChar = True
      Size = 106
    end
  end
  object qryFCL: TQuery
    OnCalcFields = qry_imp_notificacao_CalcFields
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT CONVERT(CHAR(3), COUNT(*)) +'
      '       RTRIM(LTRIM((SELECT TC.NM_TP_CNTR'
      '                    FROM TTP_CNTR TC'
      '                    WHERE PC.TP_CNTR = TC.TP_CNTR))) +'
      
        '       '#39' (PESO: '#39' + CONVERT(VARCHAR, SUM(ISNULL(PC.VL_PESO_TON, ' +
        '0))) +'
      
        '       '#39', CUBAGEM: '#39' + CONVERT(VARCHAR, SUM(ISNULL(PC.VL_CUBAGEM' +
        ', 0))) + '#39'), '#39' TEXTO'
      
        'FROM  TPROCESSO P (NOLOCK) INNER JOIN TPROCESSO_CNTR PC (NOLOCK)' +
        ' ON PC.NR_PROCESSO = P.NR_PROCESSO'
      'WHERE  P.NR_PROCESSO = :NR_PROCESSO'
      '  AND P.TP_ESTUFAGEM = '#39'1'#39
      'GROUP BY TP_CNTR')
    Left = 695
    Top = 217
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'NR_PROCESSO'
        ParamType = ptUnknown
      end>
    object qryFCLTEXTO: TStringField
      FieldName = 'TEXTO'
      FixedChar = True
      Size = 24
    end
  end
  object dsFCL: TDataSource
    DataSet = qryFCL
    Left = 695
    Top = 273
  end
  object dsItemCliente: TDataSource
    DataSet = qryItemCliente
    Left = 792
    Top = 224
  end
  object dsItemIndaia: TDataSource
    DataSet = qryItemIndaia
    Left = 808
    Top = 32
  end
  object qryItemCliente: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT  I.CD_ITEM, I.VL_VENDA, I.VL_SOLICITADO,'
      
        '       (SELECT IT.NM_ITEM FROM TITEM IT (NOLOCK) WHERE IT.CD_ITE' +
        'M = I.CD_ITEM) NM_ITEM,'
      
        '       B.NM_BANCO, B.NR_BANCO, B.CD_AGENCIA, (B.NR_CONTA + '#39'-'#39' +' +
        '  B.DAC_AGENCIA) AS NR_CONTA '
      
        '  FROM TBANCO B (NOLOCK), TNUMERARIO_NOTIFICA_ITEM I (NOLOCK), T' +
        'NUMERARIO_NOTIFICA N (NOLOCK), TPROCESSO P (NOLOCK)'
      '     WHERE P.NR_PROCESSO    = :NR_PROCESSO'
      '     AND  P.NR_PROCESSO    = I.NR_PROCESSO'
      '     AND  I.NR_SOLICITACAO = :NR_SOLICITACAO'
      '     AND  I.NR_PROCESSO    = N.NR_PROCESSO'
      '     AND  I.NR_SOLICITACAO = N.NR_SOLICITACAO'
      '     AND  I.CD_BANCO       = B.CD_BANCO'
      '     AND  I.VL_SOLICITADO > 0'
      '     AND  I.TP_DESTINO IN ('#39'0'#39', '#39'1'#39')'
      ' ORDER BY I.TP_DESTINO, NM_ITEM')
    Left = 792
    Top = 272
    ParamData = <
      item
        DataType = ftString
        Name = 'NR_PROCESSO'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'NR_SOLICITACAO'
        ParamType = ptInput
      end>
    object qryItemClienteCD_ITEM: TStringField
      FieldName = 'CD_ITEM'
      FixedChar = True
      Size = 3
    end
    object qryItemClienteVL_VENDA: TFloatField
      FieldName = 'VL_VENDA'
    end
    object qryItemClienteVL_SOLICITADO: TFloatField
      FieldName = 'VL_SOLICITADO'
    end
    object qryItemClienteNM_ITEM: TStringField
      FieldName = 'NM_ITEM'
      FixedChar = True
      Size = 30
    end
    object qryItemClienteNM_BANCO: TStringField
      FieldName = 'NM_BANCO'
      FixedChar = True
      Size = 40
    end
    object qryItemClienteNR_BANCO: TStringField
      FieldName = 'NR_BANCO'
      FixedChar = True
      Size = 3
    end
    object qryItemClienteCD_AGENCIA: TStringField
      FieldName = 'CD_AGENCIA'
      FixedChar = True
      Size = 5
    end
    object qryItemClienteNR_CONTA: TStringField
      FieldName = 'NR_CONTA'
      FixedChar = True
      Size = 12
    end
  end
  object qryItemIndaia: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT I.CD_ITEM, I.VL_VENDA, I.VL_SOLICITADO,'
      
        '       (SELECT IT.NM_ITEM FROM TITEM IT (NOLOCK) WHERE IT.CD_ITE' +
        'M = I.CD_ITEM) NM_ITEM,'
      
        '       B.NM_BANCO, B.NR_BANCO, B.CD_AGENCIA, (B.NR_CONTA + '#39'-'#39' +' +
        '  B.DAC_AGENCIA) AS NR_CONTA,'
      
        '       I.CD_MOEDA_VENDA, ( SELECT VL_TAXA FROM TTAXA_FRETE WHERE' +
        ' CD_MOEDA = I.CD_MOEDA_VENDA AND DT_INICIO = N.DT_NOTIFICACAO) T' +
        'AXA_CAMBIO'
      
        '  FROM TBANCO B (NOLOCK), TNUMERARIO_NOTIFICA_ITEM I (NOLOCK), T' +
        'NUMERARIO_NOTIFICA N (NOLOCK), TPROCESSO P (NOLOCK)'
      '     WHERE P.NR_PROCESSO    = :NR_PROCESSO'
      '     AND  P.NR_PROCESSO    = I.NR_PROCESSO'
      '     AND  I.NR_SOLICITACAO = :NR_SOLICITACAO'
      '     AND  I.NR_PROCESSO    = N.NR_PROCESSO'
      '     AND  I.NR_SOLICITACAO = N.NR_SOLICITACAO'
      '     AND  I.CD_BANCO       = B.CD_BANCO'
      '     AND  I.VL_SOLICITADO > 0'
      '     AND  I.TP_DESTINO IN ('#39'2'#39', '#39'3'#39', '#39'5'#39')'
      ' ORDER BY I.TP_DESTINO, NM_ITEM'
      '')
    Left = 808
    Top = 80
    ParamData = <
      item
        DataType = ftString
        Name = 'NR_PROCESSO'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'NR_SOLICITACAO'
        ParamType = ptInput
      end>
    object qryItemIndaiaCD_ITEM: TStringField
      FieldName = 'CD_ITEM'
      FixedChar = True
      Size = 3
    end
    object qryItemIndaiaVL_VENDA: TFloatField
      FieldName = 'VL_VENDA'
    end
    object qryItemIndaiaVL_SOLICITADO: TFloatField
      FieldName = 'VL_SOLICITADO'
    end
    object qryItemIndaiaNM_ITEM: TStringField
      FieldName = 'NM_ITEM'
      FixedChar = True
      Size = 30
    end
    object qryItemIndaiaNM_BANCO: TStringField
      FieldName = 'NM_BANCO'
      FixedChar = True
      Size = 40
    end
    object qryItemIndaiaNR_BANCO: TStringField
      FieldName = 'NR_BANCO'
      FixedChar = True
      Size = 3
    end
    object qryItemIndaiaCD_AGENCIA: TStringField
      FieldName = 'CD_AGENCIA'
      FixedChar = True
      Size = 5
    end
    object qryItemIndaiaNR_CONTA: TStringField
      FieldName = 'NR_CONTA'
      FixedChar = True
      Size = 12
    end
  end
  object ppBDEItemCliente: TppBDEPipeline
    DataSource = dsItemCliente
    UserName = 'BDEItemCliente'
    Left = 792
    Top = 328
    object ppBDEItemClienteppField1: TppField
      FieldAlias = 'CD_ITEM'
      FieldName = 'CD_ITEM'
      FieldLength = 0
      DisplayWidth = 0
      Position = 0
    end
    object ppBDEItemClienteppField2: TppField
      Alignment = taRightJustify
      FieldAlias = 'VL_VENDA'
      FieldName = 'VL_VENDA'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 1
    end
    object ppBDEItemClienteppField3: TppField
      Alignment = taRightJustify
      FieldAlias = 'VL_SOLICITADO'
      FieldName = 'VL_SOLICITADO'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 2
    end
    object ppBDEItemClienteppField4: TppField
      FieldAlias = 'NM_ITEM'
      FieldName = 'NM_ITEM'
      FieldLength = 30
      DisplayWidth = 30
      Position = 3
    end
    object ppBDEItemClienteppField5: TppField
      FieldAlias = 'NM_BANCO'
      FieldName = 'NM_BANCO'
      FieldLength = 40
      DisplayWidth = 40
      Position = 4
    end
    object ppBDEItemClienteppField6: TppField
      FieldAlias = 'NR_BANCO'
      FieldName = 'NR_BANCO'
      FieldLength = 3
      DisplayWidth = 3
      Position = 5
    end
    object ppBDEItemClienteppField7: TppField
      FieldAlias = 'CD_AGENCIA'
      FieldName = 'CD_AGENCIA'
      FieldLength = 5
      DisplayWidth = 5
      Position = 6
    end
    object ppBDEItemClienteppField8: TppField
      FieldAlias = 'NR_CONTA'
      FieldName = 'NR_CONTA'
      FieldLength = 12
      DisplayWidth = 12
      Position = 7
    end
  end
  object ppBDEItemIndaia: TppBDEPipeline
    DataSource = dsItemIndaia
    UserName = 'BDEItemIndaia'
    Left = 816
    Top = 136
    object ppBDEItemIndaiappField1: TppField
      FieldAlias = 'CD_ITEM'
      FieldName = 'CD_ITEM'
      FieldLength = 0
      DisplayWidth = 0
      Position = 0
    end
    object ppBDEItemIndaiappField2: TppField
      Alignment = taRightJustify
      FieldAlias = 'VL_VENDA'
      FieldName = 'VL_VENDA'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 1
    end
    object ppBDEItemIndaiappField3: TppField
      Alignment = taRightJustify
      FieldAlias = 'VL_SOLICITADO'
      FieldName = 'VL_SOLICITADO'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 2
    end
    object ppBDEItemIndaiappField4: TppField
      FieldAlias = 'NM_ITEM'
      FieldName = 'NM_ITEM'
      FieldLength = 30
      DisplayWidth = 30
      Position = 3
    end
    object ppBDEItemIndaiappField5: TppField
      FieldAlias = 'NM_BANCO'
      FieldName = 'NM_BANCO'
      FieldLength = 40
      DisplayWidth = 40
      Position = 4
    end
    object ppBDEItemIndaiappField6: TppField
      FieldAlias = 'NR_BANCO'
      FieldName = 'NR_BANCO'
      FieldLength = 3
      DisplayWidth = 3
      Position = 5
    end
    object ppBDEItemIndaiappField7: TppField
      FieldAlias = 'CD_AGENCIA'
      FieldName = 'CD_AGENCIA'
      FieldLength = 5
      DisplayWidth = 5
      Position = 6
    end
    object ppBDEItemIndaiappField8: TppField
      FieldAlias = 'NR_CONTA'
      FieldName = 'NR_CONTA'
      FieldLength = 12
      DisplayWidth = 12
      Position = 7
    end
  end
  object SqlAux: TQuery
    OnCalcFields = qry_imp_notificacao_CalcFields
    DatabaseName = 'DBBROKER'
    Left = 696
    Top = 353
  end
  object qryMoedas: TQuery
    OnCalcFields = qryMoedasCalcFields
    DatabaseName = 'DBBROKER'
    DataSource = ds_imp_notificacao
    SQL.Strings = (
      'SELECT *'
      'FROM VW_MOEDAS_DI'
      'WHERE NR_PROCESSO = :NR_PROCESSO')
    Left = 904
    Top = 88
    ParamData = <
      item
        DataType = ftString
        Name = 'NR_PROCESSO'
        ParamType = ptUnknown
        Size = 18
        Value = ''
      end>
    object qryMoedasNR_PROCESSO: TStringField
      FieldName = 'NR_PROCESSO'
      Origin = 'DBBROKER.VW_MOEDAS_DI.NR_PROCESSO'
      FixedChar = True
      Size = 18
    end
    object qryMoedasCD_MOEDA: TStringField
      FieldName = 'CD_MOEDA'
      Origin = 'DBBROKER.VW_MOEDAS_DI.CD_MOEDA'
      FixedChar = True
      Size = 3
    end
    object qryMoedasNM_MOEDA: TStringField
      FieldName = 'NM_MOEDA'
      Origin = 'DBBROKER.VW_MOEDAS_DI.NM_MOEDA'
      FixedChar = True
      Size = 6
    end
    object qryMoedasTX_MOEDA: TFloatField
      FieldName = 'TX_MOEDA'
      Origin = 'DBBROKER.VW_MOEDAS_DI.TX_MOEDA'
    end
    object qryMoedasAP_MOEDA: TStringField
      FieldName = 'AP_MOEDA'
      Origin = 'DBBROKER.VW_MOEDAS_DI.AP_MOEDA'
      FixedChar = True
      Size = 6
    end
    object qryMoedascalc_nm_moeda: TStringField
      FieldKind = fkCalculated
      FieldName = 'calc_nm_moeda'
      Calculated = True
    end
  end
  object ppBDEMoedas: TppBDEPipeline
    DataSource = dsMoedas
    RangeEnd = reCount
    RangeEndCount = 5
    UserName = 'BDEMoedas'
    Left = 904
    Top = 144
    object ppBDEMoedasppField1: TppField
      FieldAlias = 'NR_PROCESSO'
      FieldName = 'NR_PROCESSO'
      FieldLength = 18
      DisplayWidth = 18
      Position = 0
    end
    object ppBDEMoedasppField2: TppField
      FieldAlias = 'CD_MOEDA'
      FieldName = 'CD_MOEDA'
      FieldLength = 3
      DisplayWidth = 3
      Position = 1
    end
    object ppBDEMoedasppField3: TppField
      FieldAlias = 'NM_MOEDA'
      FieldName = 'NM_MOEDA'
      FieldLength = 6
      DisplayWidth = 6
      Position = 2
    end
    object ppBDEMoedasppField4: TppField
      Alignment = taRightJustify
      FieldAlias = 'TX_MOEDA'
      FieldName = 'TX_MOEDA'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 3
    end
    object ppBDEMoedasppField5: TppField
      FieldAlias = 'AP_MOEDA'
      FieldName = 'AP_MOEDA'
      FieldLength = 6
      DisplayWidth = 6
      Position = 4
    end
    object ppBDEMoedasppField6: TppField
      FieldAlias = 'calc_nm_moeda'
      FieldName = 'calc_nm_moeda'
      FieldLength = 20
      DisplayWidth = 20
      Position = 5
    end
  end
  object dsMoedas: TDataSource
    DataSet = qryMoedas
    Left = 904
    Top = 40
  end
  object qryDetalhesAdicoes: TQuery
    DatabaseName = 'DBBROKER'
    DataSource = ds_notifica
    Left = 896
    Top = 256
  end
end
