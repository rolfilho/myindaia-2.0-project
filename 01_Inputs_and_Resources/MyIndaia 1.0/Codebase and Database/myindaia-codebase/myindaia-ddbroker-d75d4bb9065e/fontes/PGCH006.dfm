object datm_solic_ch: Tdatm_solic_ch
  Left = 60
  Height = 492
  Width = 580
  object ds_solic_ch_itens: TDataSource
    DataSet = qry_solic_ch_itens_
    Left = 228
    Top = 73
  end
  object ds_solic_ch: TDataSource
    AutoEdit = False
    DataSet = qry_solic_ch_
    Left = 140
    Top = 73
  end
  object ds_item: TDataSource
    DataSet = qry_item_
    Left = 228
    Top = 294
  end
  object qry_item_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT I.CD_ITEM, I.NM_ITEM, I.CD_TIPO_ITEM, T.IN_SOLIC_CHQ'
      'FROM TITEM I,'
      '            TTIPO_ITEM T'
      'WHERE I.CD_TIPO_ITEM = T.CD_TIPO_ITEM AND'
      '              I.IN_ATIVO = '#39'1'#39)
    Left = 228
    Top = 237
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
  end
  object ds_banco: TDataSource
    DataSet = qry_banco_
    Left = 140
    Top = 294
  end
  object ds_desp: TDataSource
    DataSet = qry_desp_
    Left = 327
    Top = 294
  end
  object ds_favorecido: TDataSource
    DataSet = qry_favorecido_
    Left = 47
    Top = 294
  end
  object tbl_status_solic_ch_: TTable
    DatabaseName = 'DBBROKER'
    IndexFieldNames = 'CODIGO'
    TableName = 'TSTATUS_SOLIC_CH'
    Left = 327
    Top = 12
    object tbl_status_solic_ch_CODIGO: TStringField
      FieldName = 'CODIGO'
      Required = True
      Size = 1
    end
    object tbl_status_solic_ch_DESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Size = 25
    end
  end
  object ds_status_solic_ch: TDataSource
    DataSet = tbl_status_solic_ch_
    Left = 327
    Top = 73
  end
  object ds_status_item_solic_ch: TDataSource
    DataSet = tbl_status_item_solic_ch_
    Left = 327
    Top = 176
  end
  object tbl_status_item_solic_ch_: TTable
    DatabaseName = 'DBBROKER'
    IndexFieldNames = 'CODIGO'
    TableName = 'TSTATUS_SOLIC_CH_ITENS'
    Left = 327
    Top = 120
    object tbl_status_item_solic_ch_CODIGO: TStringField
      FieldName = 'CODIGO'
      Required = True
      Size = 1
    end
    object tbl_status_item_solic_ch_DESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Size = 25
    end
  end
  object ds_status_ch: TDataSource
    DataSet = tbl_status_ch_
    Left = 451
    Top = 120
  end
  object tbl_status_ch_: TTable
    DatabaseName = 'DBBROKER'
    IndexFieldNames = 'CODIGO'
    TableName = 'TSTATUS_CHEQUE'
    Left = 451
    Top = 73
    object tbl_status_ch_CODIGO: TStringField
      FieldName = 'CODIGO'
      Required = True
      Size = 1
    end
    object tbl_status_ch_DESCRICAO: TStringField
      DisplayWidth = 25
      FieldName = 'DESCRICAO'
      Size = 25
    end
  end
  object sp_cancela_solic_ch: TStoredProc
    DatabaseName = 'DBBROKER'
    StoredProcName = 'dbo.sp_cancela_solic_ch'
    Params.Data = {
      0100040006526573756C74040304000000000000000C4064745F736F6C69635F
      636801010200300000000C406E725F736F6C69635F636801010200300000000B
      4063645F7573756172696F0101020030000000}
    Left = 451
    Top = 294
    object StringField11: TStringField
      FieldName = 'NR_ADICAO'
      Size = 3
    end
    object StringField12: TStringField
      FieldName = 'NR_ITEM'
      Size = 3
    end
  end
  object sp_proc_item_solic_ch: TStoredProc
    DatabaseName = 'DBBROKER'
    StoredProcName = 'dbo.sp_proc_itens_solic_ch'
    Params.Data = {
      0100050006526573756C74040304000000000000000C4064745F736F6C69635F
      636801010200300000000C406E725F736F6C69635F636801010200300000000E
      406E725F6C616E63616D656E746F010102003000000009406F7065726163616F
      0101020030000000}
    Left = 451
    Top = 176
    object StringField13: TStringField
      FieldName = 'NR_ADICAO'
      Size = 3
    end
    object StringField14: TStringField
      FieldName = 'NR_ITEM'
      Size = 3
    end
  end
  object sp_cancela_item_solic_ch: TStoredProc
    DatabaseName = 'DBBROKER'
    StoredProcName = 'dbo.sp_cancela_item_solic_ch'
    Params.Data = {
      0100050006526573756C74040304000000000000000C4064745F736F6C69635F
      636801010200300000000C406E725F736F6C69635F636801010200300000000E
      406E725F6C616E63616D656E746F01010200300000000B4063645F7573756172
      696F0101020030000000}
    Left = 451
    Top = 237
    object StringField15: TStringField
      FieldName = 'NR_ADICAO'
      Size = 3
    end
    object StringField16: TStringField
      FieldName = 'NR_ITEM'
      Size = 3
    end
  end
  object ds_solic_ch_usuario_: TDataSource
    DataSet = qry_solic_ch_usuario_
    Left = 47
    Top = 73
  end
  object qry_solic_ch_usuario_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT NR_SOLIC_CH, CD_FAVORECIDO, CD_BANCO, VL_SOLIC_CH,'
      'CD_STATUS_SOLIC_CH, DT_SOLIC_CH, CD_TIPO_LANC'
      'FROM TSOLIC_CHEQUE'
      'WHERE'
      '  ( DT_SOLIC_CH = :DT_SOLIC_CH ) AND'
      '  ( CD_TIPO_LANC = :CD_TIPO_LANC ) AND'
      '  CD_USUARIO IN'
      '    ((SELECT CD_USUARIO'
      '      FROM  TUSUARIO U, TCARGO_DESCENDENTE C'
      '      WHERE U.CD_CARGO = C.CD_DESCENDENTE AND'
      '                     C.CD_CARGO <> C.CD_DESCENDENTE AND'
      '                     C.CD_CARGO = :CD_CARGO ) UNION'
      '     (SELECT :CD_USUARIO))'
      '')
    Params.Data = {
      010004000B44545F534F4C49435F434800010200300000000C43445F5449504F
      5F4C414E4300010200300000000843445F434152474F00010200300000000A43
      445F5553554152494F0001020030000000}
    Left = 47
    Top = 12
    object qry_solic_ch_usuario_NR_SOLIC_CH: TStringField
      DisplayLabel = 'Solic.'
      FieldName = 'NR_SOLIC_CH'
      Size = 3
    end
    object qry_solic_ch_usuario_CD_FAVORECIDO: TStringField
      FieldName = 'CD_FAVORECIDO'
      Size = 5
    end
    object qry_solic_ch_usuario_CD_BANCO: TStringField
      FieldName = 'CD_BANCO'
      Size = 3
    end
    object qry_solic_ch_usuario_VL_SOLIC_CH: TFloatField
      DisplayLabel = 'Valor'
      FieldName = 'VL_SOLIC_CH'
      DisplayFormat = '#0,.00'
      EditFormat = '#0.00'
    end
    object qry_solic_ch_usuario_CD_STATUS_SOLIC_CH: TStringField
      FieldName = 'CD_STATUS_SOLIC_CH'
      Size = 1
    end
    object qry_solic_ch_usuario_LookFavorecido: TStringField
      DisplayLabel = 'Favorecido'
      FieldName = 'LookFavorecido'
      LookupDataSet = qry_favorecido_
      LookupKeyFields = 'CD_FAVORECIDO'
      LookupResultField = 'NM_FAVORECIDO'
      KeyFields = 'CD_FAVORECIDO'
      Size = 50
      Lookup = True
    end
    object qry_solic_ch_usuario_LookBanco: TStringField
      DisplayLabel = 'Banco'
      FieldName = 'LookBanco'
      LookupDataSet = qry_banco_
      LookupKeyFields = 'CD_BANCO'
      LookupResultField = 'NM_BANCO'
      KeyFields = 'CD_BANCO'
      Size = 40
      Lookup = True
    end
    object qry_solic_ch_usuario_LookStSolicCheque: TStringField
      DisplayLabel = 'Status'
      FieldName = 'LookStSolicCheque'
      LookupDataSet = tbl_status_solic_ch_
      LookupKeyFields = 'CODIGO'
      LookupResultField = 'DESCRICAO'
      KeyFields = 'CD_STATUS_SOLIC_CH'
      Size = 25
      Lookup = True
    end
    object qry_solic_ch_usuario_DT_SOLIC_CH: TStringField
      FieldName = 'DT_SOLIC_CH'
      Size = 10
    end
    object qry_solic_ch_usuario_CD_TIPO_LANC: TStringField
      FieldName = 'CD_TIPO_LANC'
      Size = 1
    end
  end
  object qry_favorecido_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT CD_FAVORECIDO, NM_FAVORECIDO, IN_CONTROLA_IR'
      'FROM TFAVORECIDO')
    Left = 47
    Top = 237
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
    object qry_favorecido_IN_CONTROLA_IR: TBooleanField
      FieldName = 'IN_CONTROLA_IR'
      Origin = 'TFAVORECIDO.IN_CONTROLA_IR'
    end
  end
  object qry_banco_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT CD_BANCO, NM_BANCO'
      'FROM TBANCO')
    Left = 140
    Top = 237
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
  object qry_desp_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT CD_DESPACHANTE, NM_DESPACHANTE'
      'FROM TDESPACHANTE')
    Left = 327
    Top = 237
    object qry_desp_CD_DESPACHANTE: TStringField
      FieldName = 'CD_DESPACHANTE'
      Origin = 'TDESPACHANTE.CD_DESPACHANTE'
      Size = 3
    end
    object qry_desp_NM_DESPACHANTE: TStringField
      FieldName = 'NM_DESPACHANTE'
      Origin = 'TDESPACHANTE.NM_DESPACHANTE'
      Size = 50
    end
  end
  object ds_empresa_nac: TDataSource
    DataSet = qry_emp_nac_
    Left = 140
    Top = 406
  end
  object qry_emp_nac_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT CD_EMPRESA, NM_EMPRESA'
      'FROM TEMPRESA_NAC')
    Left = 144
    Top = 348
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
    Top = 406
  end
  object qry_unid_neg_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT CD_UNID_NEG, NM_UNID_NEG'
      'FROM TUNID_NEG'
      'WHERE CD_UNID_NEG <> '#39#39)
    Left = 228
    Top = 348
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
    Top = 406
  end
  object qry_produto_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT CD_PRODUTO, NM_PRODUTO'
      'FROM TPRODUTO'
      'WHERE CD_PRODUTO <> '#39#39)
    Left = 327
    Top = 348
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
    Left = 47
    Top = 406
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
    Params.Data = {010001000B4E525F50524F434553534F0001020030000000}
    Left = 47
    Top = 348
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
      FieldName = 'LookUnidNeg'
      LookupDataSet = qry_unid_neg_
      LookupKeyFields = 'CD_UNID_NEG'
      LookupResultField = 'NM_UNID_NEG'
      KeyFields = 'CD_UNID_NEG'
      Size = 50
      Lookup = True
    end
    object qry_processo_LookProduto: TStringField
      FieldName = 'LookProduto'
      LookupDataSet = qry_produto_
      LookupKeyFields = 'CD_PRODUTO'
      LookupResultField = 'NM_PRODUTO'
      KeyFields = 'CD_PRODUTO'
      Size = 40
      Lookup = True
    end
    object qry_processo_LookCliente: TStringField
      FieldName = 'LookCliente'
      LookupDataSet = qry_emp_nac_
      LookupKeyFields = 'CD_EMPRESA'
      LookupResultField = 'NM_EMPRESA'
      KeyFields = 'CD_CLIENTE'
      Size = 50
      Lookup = True
    end
    object qry_processo_LookServico: TStringField
      FieldName = 'LookServico'
      LookupDataSet = qry_servico_
      LookupKeyFields = 'CD_SERVICO'
      LookupResultField = 'NM_SERVICO'
      KeyFields = 'CD_SERVICO'
      Size = 50
      Lookup = True
    end
  end
  object qry_ult_lanc_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT MAX(NR_LANCAMENTO) AS ULTIMO'
      'FROM TSOLIC_CHEQUE_ITENS'
      'WHERE NR_SOLIC_CH = :NR_SOLIC_CH AND'
      '               DT_SOLIC_CH = :DT_SOLIC_CH')
    Params.Data = {
      010002000B4E525F534F4C49435F434800010200300000000B44545F534F4C49
      435F43480001020030000000}
    Left = 47
    Top = 120
    object qry_ult_lanc_ULTIMO: TStringField
      FieldName = 'ULTIMO'
      Origin = 'TSOLIC_CHEQUE_ITENS.NR_LANCAMENTO'
      Size = 3
    end
  end
  object qry_ult_solic_ch_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT MAX(NR_SOLIC_CH) AS ULTIMO'
      'FROM TSOLIC_CHEQUE'
      'WHERE DT_SOLIC_CH = :DT_SOLIC_CH')
    Params.Data = {010001000B44545F534F4C49435F43480001020030000000}
    Left = 47
    Top = 176
    object qry_ult_solic_ch_ULTIMO: TStringField
      FieldName = 'ULTIMO'
      Origin = 'TSOLIC_CHEQUE.NR_SOLIC_CH'
      Size = 3
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
    Params.Data = {010001000B4E525F50524F434553534F0001020030000000}
    Left = 451
    Top = 12
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
      FieldName = 'LookUnidade'
      LookupDataSet = qry_unid_neg_
      LookupKeyFields = 'CD_UNID_NEG'
      LookupResultField = 'NM_UNID_NEG'
      KeyFields = 'CD_UNID_NEG'
      Size = 50
      Lookup = True
    end
    object qry_proc_co_LookProduto: TStringField
      FieldName = 'LookProduto'
      LookupDataSet = qry_produto_
      LookupKeyFields = 'CD_PRODUTO'
      LookupResultField = 'NM_PRODUTO'
      KeyFields = 'CD_PRODUTO'
      Size = 50
      Lookup = True
    end
    object qry_proc_co_LookCliente: TStringField
      FieldName = 'LookCliente'
      LookupDataSet = qry_emp_nac_
      LookupKeyFields = 'CD_EMPRESA'
      LookupResultField = 'NM_EMPRESA'
      KeyFields = 'CD_CLIENTE'
      Size = 50
      Lookup = True
    end
    object qry_proc_co_LookServico: TStringField
      FieldName = 'LookServico'
      LookupDataSet = qry_produto_
      LookupKeyFields = 'CD_PRODUTO'
      LookupResultField = 'NM_PRODUTO'
      KeyFields = 'CD_PRODUTO'
      Size = 50
      Lookup = True
    end
  end
  object qry_solic_ch_itens_: TQuery
    AfterOpen = qry_solic_ch_itens_AfterScroll
    AfterCancel = qry_solic_ch_itens_AfterScroll
    AfterScroll = qry_solic_ch_itens_AfterScroll
    OnCalcFields = qry_solic_ch_itens_CalcFields
    DatabaseName = 'DBBROKER'
    DataSource = ds_solic_ch
    RequestLive = True
    SQL.Strings = (
      'SELECT DT_SOLIC_CH, NR_SOLIC_CH,  NR_LANCAMENTO, '
      'NR_PROCESSO, CD_ITEM, VL_ITEM, CD_STATUS, IN_RESTITUI, '
      'VL_IR, VL_ASSIST, CD_DESPACHANTE, CD_CLIENTE, CD_FORNECEDOR'
      'FROM TSOLIC_CHEQUE_ITENS'
      'WHERE'
      '   ( DT_SOLIC_CH = :DT_SOLIC_CH ) AND'
      '   ( NR_SOLIC_CH = :NR_SOLIC_CH )'
      '')
    Params.Data = {
      010002000B44545F534F4C49435F434800010200300001000B4E525F534F4C49
      435F43480001020030000100}
    Left = 228
    Top = 12
    object qry_solic_ch_itens_NR_LANCAMENTO: TStringField
      DisplayLabel = 'Lanç.'
      FieldName = 'NR_LANCAMENTO'
      Origin = 'TSOLIC_CHEQUE_ITENS.NR_LANCAMENTO'
      Size = 3
    end
    object qry_solic_ch_itens_NR_PROCESSO: TStringField
      DisplayLabel = 'Processo'
      FieldName = 'NR_PROCESSO'
      Origin = 'TSOLIC_CHEQUE_ITENS.NR_PROCESSO'
      Size = 18
    end
    object qry_solic_ch_itens_CD_ITEM: TStringField
      FieldName = 'CD_ITEM'
      Origin = 'TSOLIC_CHEQUE_ITENS.CD_ITEM'
      Size = 3
    end
    object qry_solic_ch_itens_VL_ITEM: TFloatField
      DisplayLabel = 'Valor'
      FieldName = 'VL_ITEM'
      Origin = 'TSOLIC_CHEQUE_ITENS.VL_ITEM'
      DisplayFormat = '#0,.00'
      EditFormat = '#0.00'
    end
    object qry_solic_ch_itens_DT_SOLIC_CH: TStringField
      FieldName = 'DT_SOLIC_CH'
      Origin = 'TSOLIC_CHEQUE_ITENS.DT_SOLIC_CH'
      Size = 10
    end
    object qry_solic_ch_itens_NR_SOLIC_CH: TStringField
      FieldName = 'NR_SOLIC_CH'
      Origin = 'TSOLIC_CHEQUE_ITENS.NR_SOLIC_CH'
      Size = 3
    end
    object qry_solic_ch_itens_CD_STATUS: TStringField
      FieldName = 'CD_STATUS'
      Origin = 'TSOLIC_CHEQUE_ITENS.CD_STATUS'
      Size = 1
    end
    object qry_solic_ch_itens_VL_ASSIST: TFloatField
      FieldName = 'VL_ASSIST'
      Origin = 'TSOLIC_CHEQUE_ITENS.VL_ASSIST'
      DisplayFormat = '#0,.00'
      EditFormat = '#0.00'
    end
    object qry_solic_ch_itens_CD_DESPACHANTE: TStringField
      FieldName = 'CD_DESPACHANTE'
      Origin = 'TSOLIC_CHEQUE_ITENS.CD_DESPACHANTE'
      Size = 3
    end
    object qry_solic_ch_itens_CD_CLIENTE: TStringField
      FieldName = 'CD_CLIENTE'
      Size = 5
    end
    object qry_solic_ch_itens_CD_FORNECEDOR: TStringField
      FieldName = 'CD_FORNECEDOR'
      Origin = 'TSOLIC_CHEQUE_ITENS.DT_SOLIC_CH'
      Size = 5
    end
    object qry_solic_ch_itens_IN_RESTITUI: TStringField
      FieldName = 'IN_RESTITUI'
      Origin = 'TSOLIC_CHEQUE_ITENS.DT_SOLIC_CH'
      Size = 1
    end
    object qry_solic_ch_itens_VL_IR: TFloatField
      FieldName = 'VL_IR'
      Origin = 'TSOLIC_CHEQUE_ITENS.NR_SOLIC_CH'
      DisplayFormat = '#0,.00'
      EditFormat = '#0.00'
    end
    object qry_solic_ch_itens_LookItem: TStringField
      DisplayLabel = 'Item'
      FieldName = 'LookItem'
      LookupDataSet = qry_item_
      LookupKeyFields = 'CD_ITEM'
      LookupResultField = 'NM_ITEM'
      KeyFields = 'CD_ITEM'
      Size = 30
      Lookup = True
    end
    object qry_solic_ch_itens_LookStSolicChItens: TStringField
      DisplayLabel = 'Status'
      FieldName = 'LookStSolicChItens'
      LookupDataSet = tbl_status_item_solic_ch_
      LookupKeyFields = 'CODIGO'
      LookupResultField = 'DESCRICAO'
      KeyFields = 'CD_STATUS'
      Size = 25
      Lookup = True
    end
    object qry_solic_ch_itens_LookDespachante: TStringField
      FieldName = 'LookDespachante'
      LookupDataSet = qry_desp_
      LookupKeyFields = 'CD_DESPACHANTE'
      LookupResultField = 'NM_DESPACHANTE'
      KeyFields = 'CD_DESPACHANTE'
      Size = 50
      Lookup = True
    end
    object qry_solic_ch_itens_CalcNrProcesso: TStringField
      DisplayLabel = 'Processo'
      DisplayWidth = 18
      FieldName = 'CalcNrProcesso'
      Size = 18
      Calculated = True
    end
    object qry_solic_ch_itens_LookCli: TStringField
      DisplayLabel = 'Cliente'
      FieldName = 'LookCli'
      LookupDataSet = qry_emp_nac_
      LookupKeyFields = 'CD_EMPRESA'
      LookupResultField = 'NM_EMPRESA'
      KeyFields = 'CD_CLIENTE'
      Size = 50
      Lookup = True
    end
    object qry_solic_ch_itens_LookTpItem: TStringField
      FieldName = 'LookTpItem'
      LookupDataSet = qry_item_
      LookupKeyFields = 'CD_ITEM'
      LookupResultField = 'CD_TIPO_ITEM'
      KeyFields = 'CD_ITEM'
      Size = 1
      Lookup = True
    end
    object qry_solic_ch_itens_LookFornecedor: TStringField
      FieldName = 'LookFornecedor'
      LookupDataSet = qry_favorecido_
      LookupKeyFields = 'CD_FAVORECIDO'
      LookupResultField = 'NM_FAVORECIDO'
      KeyFields = 'CD_FORNECEDOR'
      Size = 40
      Lookup = True
    end
    object qry_solic_ch_itens_LookControlaIR: TBooleanField
      FieldName = 'LookControlaIR'
      LookupDataSet = qry_favorecido_
      LookupKeyFields = 'CD_FAVORECIDO'
      LookupResultField = 'IN_CONTROLA_IR'
      KeyFields = 'CD_FORNECEDOR'
      Lookup = True
    end
    object qry_solic_ch_itens_Calc_VL_CH_ITEM: TFloatField
      FieldName = 'Calc_VL_CH_ITEM'
      DisplayFormat = '#0,.00'
      EditFormat = '#0.00'
      Calculated = True
    end
    object qry_solic_ch_itens_Look_IN_SOLIC_CHQ: TStringField
      FieldName = 'Look_IN_SOLIC_CHQ'
      LookupDataSet = qry_item_
      LookupKeyFields = 'CD_ITEM'
      LookupResultField = 'IN_SOLIC_CHQ'
      KeyFields = 'CD_ITEM'
      Size = 1
      Lookup = True
    end
  end
  object qry_solic_ch_: TQuery
    AfterOpen = qry_solic_ch_AfterScroll
    AfterScroll = qry_solic_ch_AfterScroll
    DatabaseName = 'DBBROKER'
    DataSource = ds_solic_ch_usuario_
    RequestLive = True
    SQL.Strings = (
      'SELECT DT_SOLIC_CH, NR_SOLIC_CH, HM_SOLIC_CH, '
      '  CD_STATUS_SOLIC_CH, CD_BANCO, CD_FAVORECIDO, '
      '  VL_SOLIC_CH, NR_CHEQUE, CD_USUARIO, CD_TIPO_LANC,'
      '  CD_STATUS_CHEQUE, IN_EMITIR'
      'FROM'
      '  TSOLIC_CHEQUE'
      'WHERE'
      '  ( DT_SOLIC_CH = :DT_SOLIC_CH ) AND'
      '  ( NR_SOLIC_CH = :NR_SOLIC_CH ) AND'
      '  ( CD_TIPO_LANC = :CD_TIPO_LANC ) '
      ''
      '')
    Params.Data = {
      010003000B44545F534F4C49435F434800010200300001000B4E525F534F4C49
      435F434800010200300001000C43445F5449504F5F4C414E4300010200300001
      00}
    Left = 140
    Top = 12
    object qry_solic_ch_DT_SOLIC_CH: TStringField
      FieldName = 'DT_SOLIC_CH'
      Origin = 'TSOLIC_CHEQUE.DT_SOLIC_CH'
      Size = 10
    end
    object qry_solic_ch_NR_SOLIC_CH: TStringField
      DisplayLabel = 'Solicitação'
      FieldName = 'NR_SOLIC_CH'
      Origin = 'TSOLIC_CHEQUE.NR_SOLIC_CH'
      Size = 3
    end
    object qry_solic_ch_HM_SOLIC_CH: TStringField
      FieldName = 'HM_SOLIC_CH'
      Origin = 'TSOLIC_CHEQUE.HM_SOLIC_CH'
      Size = 5
    end
    object qry_solic_ch_CD_STATUS_SOLIC_CH: TStringField
      FieldName = 'CD_STATUS_SOLIC_CH'
      Origin = 'TSOLIC_CHEQUE.CD_STATUS_SOLIC_CH'
      Size = 1
    end
    object qry_solic_ch_CD_BANCO: TStringField
      FieldName = 'CD_BANCO'
      Origin = 'TSOLIC_CHEQUE.CD_BANCO'
      Size = 3
    end
    object qry_solic_ch_CD_FAVORECIDO: TStringField
      FieldName = 'CD_FAVORECIDO'
      Origin = 'TSOLIC_CHEQUE.CD_FAVORECIDO'
      Size = 5
    end
    object qry_solic_ch_CD_USUARIO: TStringField
      FieldName = 'CD_USUARIO'
      Origin = 'TSOLIC_CHEQUE.DT_SOLIC_CH'
      Size = 4
    end
    object qry_solic_ch_VL_SOLIC_CH: TFloatField
      FieldName = 'VL_SOLIC_CH'
      Origin = 'TSOLIC_CHEQUE.VL_SOLIC_CH'
      DisplayFormat = '#0,.00'
      EditFormat = '#0.00'
    end
    object qry_solic_ch_NR_CHEQUE: TStringField
      FieldName = 'NR_CHEQUE'
      Origin = 'TSOLIC_CHEQUE.NR_CHEQUE'
      Size = 6
    end
    object qry_solic_ch_CD_TIPO_LANC: TStringField
      FieldName = 'CD_TIPO_LANC'
      Origin = 'TSOLIC_CHEQUE.DT_SOLIC_CH'
      Size = 1
    end
    object qry_solic_ch_CD_STATUS_CHEQUE: TStringField
      FieldName = 'CD_STATUS_CHEQUE'
      Origin = 'TSOLIC_CHEQUE.DT_SOLIC_CH'
      Size = 1
    end
    object qry_solic_ch_IN_EMITIR: TStringField
      FieldName = 'IN_EMITIR'
      Origin = 'TSOLIC_CHEQUE.DT_SOLIC_CH'
      Size = 1
    end
    object qry_solic_ch_LookStatusSolicCh: TStringField
      FieldName = 'LookStatusSolicCh'
      LookupDataSet = tbl_status_solic_ch_
      LookupKeyFields = 'CODIGO'
      LookupResultField = 'DESCRICAO'
      KeyFields = 'CD_STATUS_SOLIC_CH'
      Size = 25
      Lookup = True
    end
    object qry_solic_ch_LookBanco: TStringField
      FieldName = 'LookBanco'
      LookupDataSet = qry_banco_
      LookupKeyFields = 'CD_BANCO'
      LookupResultField = 'NM_BANCO'
      KeyFields = 'CD_BANCO'
      Size = 40
      Lookup = True
    end
    object qry_solic_ch_LookFavorecido: TStringField
      FieldName = 'LookFavorecido'
      LookupDataSet = qry_favorecido_
      LookupKeyFields = 'CD_FAVORECIDO'
      LookupResultField = 'NM_FAVORECIDO'
      KeyFields = 'CD_FAVORECIDO'
      Size = 50
      Lookup = True
    end
    object qry_solic_ch_LookControlaIR: TBooleanField
      FieldName = 'LookControlaIR'
      LookupDataSet = qry_favorecido_
      LookupKeyFields = 'CD_FAVORECIDO'
      LookupResultField = 'IN_CONTROLA_IR'
      KeyFields = 'CD_FAVORECIDO'
      Lookup = True
    end
  end
  object qry_param_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT HM_PARA_SOLIC_CH'
      'FROM TPARAMETROS')
    Left = 451
    Top = 348
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
end
