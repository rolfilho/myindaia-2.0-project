object datm_pesq_solic_ch: Tdatm_pesq_solic_ch
  Height = 492
  Width = 455
  object ds_solic_ch: TDataSource
    DataSet = qry_solic_ch_
    Left = 52
    Top = 288
  end
  object qry_solic_ch_: TQuery
    AfterScroll = qry_solic_ch_AfterScroll
    DatabaseName = 'DBBROKER'
    ParamCheck = False
    SQL.Strings = (
      'SELECT DISTINCT SC.DT_SOLIC_CH, SC.NR_SOLIC_CH, SC.HM_SOLIC_CH,'
      '  SC.CD_STATUS_SOLIC_CH, SC.CD_BANCO, SC.CD_FAVORECIDO,'
      '  SC.VL_SOLIC_CH, SC.NR_CHEQUE, SC.CD_USUARIO, SC.CD_TIPO_LANC,'
      '  SC.CD_STATUS_CHEQUE, SC.IN_TRANSFERIDO'
      'FROM TSOLIC_CHEQUE SC'
      'WHERE SC.DT_SOLIC_CH <> '#39#39)
    Left = 160
    Top = 288
    object qry_solic_ch_DT_SOLIC_CH: TStringField
      DisplayLabel = 'Data'
      FieldName = 'DT_SOLIC_CH'
      Origin = 'TSOLIC_CHEQUE.DT_SOLIC_CH'
      Size = 10
    end
    object qry_solic_ch_NR_SOLIC_CH: TStringField
      DisplayLabel = 'Solic.'
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
    object qry_solic_ch_VL_SOLIC_CH: TFloatField
      DisplayLabel = 'Valor'
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
    object qry_solic_ch_LookStatusSolicCh: TStringField
      DisplayLabel = 'Status'
      FieldName = 'LookStatusSolicCh'
      LookupDataSet = tbl_status_solic_ch_
      LookupKeyFields = 'CODIGO'
      LookupResultField = 'DESCRICAO'
      KeyFields = 'CD_STATUS_SOLIC_CH'
      Size = 25
      Lookup = True
    end
    object qry_solic_ch_LookBanco: TStringField
      DisplayLabel = 'Banco'
      FieldName = 'LookBanco'
      LookupDataSet = qry_banco_
      LookupKeyFields = 'CD_BANCO'
      LookupResultField = 'NM_BANCO'
      KeyFields = 'CD_BANCO'
      Size = 40
      Lookup = True
    end
    object qry_solic_ch_LookFavorecido: TStringField
      DisplayLabel = 'Favorecido'
      FieldName = 'LookFavorecido'
      LookupDataSet = qry_favorecido_
      LookupKeyFields = 'CD_FAVORECIDO'
      LookupResultField = 'NM_FAVORECIDO'
      KeyFields = 'CD_FAVORECIDO'
      Size = 50
      Lookup = True
    end
    object qry_solic_ch_CD_USUARIO: TStringField
      FieldName = 'CD_USUARIO'
      Origin = 'TSOLIC_CHEQUE.DT_SOLIC_CH'
      Size = 4
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
    object qry_solic_ch_IN_TRANSFERIDO: TStringField
      FieldName = 'IN_TRANSFERIDO'
      Origin = 'TSOLIC_CHEQUE.DT_SOLIC_CH'
      Size = 1
    end
    object qry_solic_ch_look_usuario: TStringField
      DisplayLabel = 'Usuário'
      FieldName = 'look_usuario'
      LookupDataSet = qry_usuario_
      LookupKeyFields = 'CD_USUARIO'
      LookupResultField = 'NM_USUARIO'
      KeyFields = 'CD_USUARIO'
      Size = 50
      Lookup = True
    end
  end
  object ds_solic_ch_itens: TDataSource
    AutoEdit = False
    DataSet = qry_solic_ch_itens_
    Left = 52
    Top = 344
  end
  object qry_solic_ch_itens_: TQuery
    OnCalcFields = qry_solic_ch_itens_CalcFields
    DatabaseName = 'DBBROKER'
    RequestLive = True
    SQL.Strings = (
      'SELECT NR_LANCAMENTO, NR_PROCESSO, CD_ITEM,'
      'VL_ITEM, DT_SOLIC_CH, NR_SOLIC_CH,  CD_STATUS,'
      'VL_IR, VL_ASSIST, CD_DESPACHANTE, CD_CLIENTE'
      'FROM TSOLIC_CHEQUE_ITENS'
      'WHERE'
      '   ( DT_SOLIC_CH = :DT_SOLIC_CH ) AND'
      '   ( NR_SOLIC_CH = :NR_SOLIC_CH )'
      '')
    Params.Data = {
      010002000B44545F534F4C49435F434800010B0033302F30332F313939380000
      010B4E525F534F4C49435F434800010400303031000001}
    Left = 160
    Top = 344
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
    object qry_solic_ch_itens_VL_IR: TFloatField
      FieldName = 'VL_IR'
      Origin = 'TSOLIC_CHEQUE_ITENS.VL_IR'
      DisplayFormat = '#0,.00'
      EditFormat = '#0.00'
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
    object qry_solic_ch_itens_CD_CLIENTE: TStringField
      FieldName = 'CD_CLIENTE'
      Size = 5
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
    object qry_solic_ch_itens_CalcNrProcesso: TStringField
      DisplayLabel = 'Processo'
      DisplayWidth = 18
      FieldName = 'CalcNrProcesso'
      Size = 18
      Calculated = True
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
  end
  object ds_favorecido: TDataSource
    AutoEdit = False
    DataSet = qry_favorecido_
    Left = 52
    Top = 12
  end
  object qry_favorecido_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT CD_FAVORECIDO, NM_FAVORECIDO, IN_CONTROLA_IR'
      'FROM TFAVORECIDO'
      'WHERE CD_FAVORECIDO <> '#39#39)
    Left = 160
    Top = 12
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
  object ds_banco: TDataSource
    AutoEdit = False
    DataSet = qry_banco_
    Left = 52
    Top = 68
  end
  object qry_banco_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT CD_BANCO, NM_BANCO'
      'FROM TBANCO'
      'WHERE CD_BANCO <> '#39#39)
    Left = 160
    Top = 68
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
  object ds_item: TDataSource
    AutoEdit = False
    DataSet = qry_item_
    Left = 52
    Top = 124
  end
  object qry_item_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT CD_ITEM , NM_ITEM'
      'FROM TITEM'
      'WHERE CD_ITEM <> '#39#39)
    Left = 160
    Top = 124
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
  end
  object ds_empresa_nac: TDataSource
    AutoEdit = False
    DataSet = qry_emp_nac_
    Left = 52
    Top = 173
  end
  object qry_emp_nac_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT CD_EMPRESA, NM_EMPRESA'
      'FROM TEMPRESA_NAC'
      'WHERE CD_EMPRESA <> '#39#39)
    Left = 160
    Top = 173
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
  object tbl_status_solic_ch_: TTable
    DatabaseName = 'DBBROKER'
    IndexFieldNames = 'CODIGO'
    TableName = 'TSTATUS_SOLIC_CH'
    Left = 160
    Top = 232
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
    AutoEdit = False
    DataSet = tbl_status_solic_ch_
    Left = 52
    Top = 232
  end
  object ds_usuario: TDataSource
    AutoEdit = False
    DataSet = qry_usuario_
    Left = 52
    Top = 405
  end
  object qry_usuario_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT CD_USUARIO, NM_USUARIO'
      'FROM TUSUARIO'
      'WHERE CD_USUARIO <> '#39#39)
    Left = 160
    Top = 405
    object qry_usuario_CD_USUARIO: TStringField
      FieldName = 'CD_USUARIO'
      Origin = 'TUSUARIO.CD_USUARIO'
      Size = 4
    end
    object qry_usuario_NM_USUARIO: TStringField
      FieldName = 'NM_USUARIO'
      Origin = 'TUSUARIO.NM_USUARIO'
      Size = 50
    end
  end
  object ds_status_item_solic_ch: TDataSource
    AutoEdit = False
    DataSet = tbl_status_item_solic_ch_
    Left = 52
    Top = 464
  end
  object tbl_status_item_solic_ch_: TTable
    DatabaseName = 'DBBROKER'
    IndexFieldNames = 'CODIGO'
    TableName = 'TSTATUS_SOLIC_CH_ITENS'
    Left = 160
    Top = 464
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
  object ds_desp: TDataSource
    AutoEdit = False
    DataSet = qry_desp_
    Left = 280
    Top = 12
  end
  object qry_desp_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT CD_DESPACHANTE, NM_DESPACHANTE'
      'FROM TDESPACHANTE')
    Left = 370
    Top = 12
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
  object ds_servico: TDataSource
    AutoEdit = False
    DataSet = qry_servico_
    Left = 280
    Top = 68
  end
  object qry_servico_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT CD_SERVICO, NM_SERVICO'
      'FROM TSERVICO')
    Left = 370
    Top = 68
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
  object qry_proc_co_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT NR_PROCESSO, CD_UNID_NEG, CD_PRODUTO, CD_SERVICO,'
      'CD_CLIENTE'
      'FROM TPROCESSO'
      'WHERE  NR_PROCESSO = :NR_PROCESSO AND'
      '                IN_LIBERADO = '#39'1'#39)
    Params.Data = {010001000B4E525F50524F434553534F0001020030000000}
    Left = 280
    Top = 124
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
      LookupDataSet = qry_servico_
      LookupKeyFields = 'CD_SERVICO'
      LookupResultField = 'NM_SERVICO'
      KeyFields = 'CD_SERVICO'
      Size = 50
      Lookup = True
    end
  end
  object ds_unid_neg: TDataSource
    AutoEdit = False
    DataSet = qry_unid_neg_
    Left = 280
    Top = 173
  end
  object qry_unid_neg_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT CD_UNID_NEG, NM_UNID_NEG'
      'FROM TUNID_NEG'
      'WHERE CD_UNID_NEG <> '#39#39)
    Left = 370
    Top = 173
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
    AutoEdit = False
    DataSet = qry_produto_
    Left = 280
    Top = 232
  end
  object qry_produto_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT CD_PRODUTO, NM_PRODUTO'
      'FROM TPRODUTO'
      'WHERE CD_PRODUTO <> '#39#39)
    Left = 370
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
  object sp_cancela_solic_ch: TStoredProc
    DatabaseName = 'DBBROKER'
    StoredProcName = 'dbo.sp_cancela_solic_ch'
    Params.Data = {
      0100040006526573756C74040304000000000000000C4064745F736F6C69635F
      636801010200300000000C406E725F736F6C69635F636801010200300000000B
      4063645F7573756172696F0101020030000000}
    Left = 280
    Top = 344
    object StringField11: TStringField
      FieldName = 'NR_ADICAO'
      Size = 3
    end
    object StringField12: TStringField
      FieldName = 'NR_ITEM'
      Size = 3
    end
  end
end
