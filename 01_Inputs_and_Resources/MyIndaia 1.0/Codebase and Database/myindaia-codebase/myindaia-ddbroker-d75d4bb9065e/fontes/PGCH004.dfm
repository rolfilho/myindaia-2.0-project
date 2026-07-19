object datm_liberacao: Tdatm_liberacao
  Left = 6
  Top = 172
  Height = 424
  Width = 787
  object qry_itens_solic_: TQuery
    AfterScroll = qry_itens_solic_AfterScroll
    OnCalcFields = qry_itens_solic_CalcFields
    DatabaseName = 'DBBROKER'
    DataSource = ds_solic
    RequestLive = True
    SQL.Strings = (
      'SELECT'
      '   DT_SOLIC_CH, NR_SOLIC_CH , NR_LANCAMENTO, NR_PROCESSO ,'
      '   CD_CLIENTE,  CD_ITEM, VL_ITEM, VL_IR , VL_ASSIST , '
      '   CD_STATUS, CD_DESPACHANTE, IN_RESTITUI'
      'FROM'
      '  TSOLIC_CHEQUE_ITENS'
      'WHERE'
      '  ( DT_SOLIC_CH = :DT_SOLIC_CH ) AND'
      '  ( NR_SOLIC_CH = :NR_SOLIC_CH ) AND'
      
        '  ( ( CD_STATUS = "1" ) OR ( CD_STATUS = "2" ) OR ( CD_STATUS = ' +
        '"3" ) ) ')
    Params.Data = {
      010002000B44545F534F4C49435F434800010200300001000B4E525F534F4C49
      435F43480001020030000100}
    Left = 156
    Top = 80
    object qry_itens_solic_DT_SOLIC_CH: TStringField
      DisplayLabel = 'Data'
      FieldName = 'DT_SOLIC_CH'
      Origin = 'TSOLIC_CHEQUE_ITENS.DT_SOLIC_CH'
      Size = 10
    end
    object qry_itens_solic_NR_SOLIC_CH: TStringField
      FieldName = 'NR_SOLIC_CH'
      Origin = 'TSOLIC_CHEQUE_ITENS.NR_SOLIC_CH'
      Size = 3
    end
    object qry_itens_solic_NR_LANCAMENTO: TStringField
      DisplayLabel = 'Lanc.'
      FieldName = 'NR_LANCAMENTO'
      Origin = 'TSOLIC_CHEQUE_ITENS.DT_SOLIC_CH'
      Size = 3
    end
    object qry_itens_solic_NR_PROCESSO: TStringField
      DisplayLabel = 'Processo'
      FieldName = 'NR_PROCESSO'
      Origin = 'TSOLIC_CHEQUE_ITENS.NR_PROCESSO'
      Size = 18
    end
    object qry_itens_solic_CD_CLIENTE: TStringField
      FieldName = 'CD_CLIENTE'
      Origin = 'TSOLIC_CHEQUE_ITENS.CD_CLIENTE'
      Size = 5
    end
    object qry_itens_solic_CD_ITEM: TStringField
      FieldName = 'CD_ITEM'
      Origin = 'TSOLIC_CHEQUE_ITENS.CD_ITEM'
      Size = 3
    end
    object qry_itens_solic_VL_ITEM: TFloatField
      DisplayLabel = 'Valor'
      FieldName = 'VL_ITEM'
      Origin = 'TSOLIC_CHEQUE_ITENS.VL_ITEM'
      DisplayFormat = '#0,.00'
    end
    object qry_itens_solic_VL_IR: TFloatField
      DisplayLabel = 'I.R.-Fonte'
      FieldName = 'VL_IR'
      Origin = 'TSOLIC_CHEQUE_ITENS.VL_IR'
      DisplayFormat = '#0,.00'
    end
    object qry_itens_solic_VL_ASSIST: TFloatField
      DisplayLabel = 'C.Assist.'
      FieldName = 'VL_ASSIST'
      Origin = 'TSOLIC_CHEQUE_ITENS.VL_ASSIST'
      DisplayFormat = '#0,.00'
    end
    object qry_itens_solic_CD_STATUS: TStringField
      FieldName = 'CD_STATUS'
      Origin = 'TSOLIC_CHEQUE_ITENS.CD_STATUS'
      Size = 1
    end
    object qry_itens_solic_CD_DESPACHANTE: TStringField
      FieldName = 'CD_DESPACHANTE'
      Origin = 'TSOLIC_CHEQUE_ITENS.DT_SOLIC_CH'
      Size = 3
    end
    object qry_itens_solic_LookStatusItemSolicCheque: TStringField
      DisplayLabel = 'Status'
      FieldName = 'LookStatusItemSolicCheque'
      LookupDataSet = tbl_status_item_solic_ch_
      LookupKeyFields = 'CODIGO'
      LookupResultField = 'DESCRICAO'
      KeyFields = 'CD_STATUS'
      Size = 25
      Lookup = True
    end
    object qry_itens_solic_LookItem: TStringField
      DisplayLabel = 'Item'
      FieldName = 'LookItem'
      LookupDataSet = qry_item_
      LookupKeyFields = 'CD_ITEM'
      LookupResultField = 'NM_ITEM'
      KeyFields = 'CD_ITEM'
      Lookup = True
    end
    object qry_itens_solic_CalcProcesso: TStringField
      DisplayLabel = 'Processo'
      DisplayWidth = 14
      FieldName = 'CalcProcesso'
      Size = 14
      Calculated = True
    end
    object qry_itens_solic_LookCliente: TStringField
      DisplayLabel = 'Cliente'
      FieldName = 'LookCliente'
      LookupDataSet = qry_emp_nac_
      LookupKeyFields = 'CD_EMPRESA'
      LookupResultField = 'NM_EMPRESA'
      KeyFields = 'CD_CLIENTE'
      Size = 50
      Lookup = True
    end
    object qry_itens_solic_VL_DESPESA: TFloatField
      FieldName = 'VL_DESPESA'
      Calculated = True
    end
    object qry_itens_solic_IN_RESTITUI: TStringField
      FieldName = 'IN_RESTITUI'
      Origin = 'TSOLIC_CHEQUE_ITENS.DT_SOLIC_CH'
      Size = 1
    end
  end
  object ds_itens_solic: TDataSource
    DataSet = qry_itens_solic_
    Left = 56
    Top = 80
  end
  object ds_solicitado: TDataSource
    DataSet = qry_solicitado_
    Left = 56
    Top = 132
  end
  object qry_solicitado_: TQuery
    DatabaseName = 'DBBROKER'
    DataSource = ds_itens_solic
    SQL.Strings = (
      'SELECT N.DT_SOLICITACAO,  NI.VL_SOLICITADO'
      'FROM TNUMERARIO N, TNUMERARIO_ITEM_SOLIC NI'
      'WHERE ( NI.NR_PROCESSO = N.NR_PROCESSO )  AND'
      ' ( NI.NR_SOLICITACAO = N.NR_SOLICITACAO )  AND'
      ' ( NI.CD_ITEM = :CD_ITEM )  AND'
      ' ( NI.NR_PROCESSO = :NR_PROCESSO ) AND'
      ' ( NI.CD_STATUS IN ("A", "B") ) AND'
      ' ( N.CD_STATUS <> "C" )')
    Params.Data = {
      010002000743445F4954454D00010200300001000B4E525F50524F434553534F
      0001020030000100}
    Left = 156
    Top = 132
    object qry_solicitado_DT_SOLICITACAO: TDateTimeField
      DisplayLabel = 'Data'
      DisplayWidth = 12
      FieldName = 'DT_SOLICITACAO'
      Origin = 'TNUMERARIO.DT_SOLICITACAO'
    end
    object qry_solicitado_VL_SOLICITADO: TFloatField
      DisplayLabel = 'Valor'
      DisplayWidth = 14
      FieldName = 'VL_SOLICITADO'
      Origin = 'TNUMERARIO_ITEM_SOLIC.VL_SOLICITADO'
      DisplayFormat = '#0,.00'
    end
  end
  object ds_recebimento: TDataSource
    DataSet = qry_recebimento_
    Left = 56
    Top = 188
  end
  object qry_recebimento_: TQuery
    DatabaseName = 'DBBROKER'
    DataSource = ds_itens_solic
    SQL.Strings = (
      'SELECT DT_RECEBIMENTO, '
      
        '(ISNULL(RI.VL_RECEBIDO,0) -  ISNULL(RI.VL_DEVOLVIDO,0)) VL_RECEB' +
        'IDO'
      'FROM TRECEBIMENTO_ITEM_RECEB RI, TRECEBIMENTO R'
      'WHERE ( RI.NR_PROCESSO = R.NR_PROCESSO ) AND'
      ' ( RI.NR_RECEBIMENTO = R.NR_RECEBIMENTO ) AND'
      ' ( RI.CD_ITEM = :CD_ITEM ) AND'
      ' ( RI.NR_PROCESSO = :NR_PROCESSO ) AND'
      ' ( RI.IN_CANCELADO = "0" )'
      '')
    Params.Data = {
      010002000743445F4954454D00010200300001000B4E525F50524F434553534F
      0001020030000100}
    Left = 156
    Top = 188
    object qry_recebimento_DT_RECEBIMENTO: TDateTimeField
      DisplayLabel = 'Data'
      FieldName = 'DT_RECEBIMENTO'
      Origin = 'TRECEBIMENTO.DT_RECEBIMENTO'
    end
    object qry_recebimento_VL_RECEBIDO: TFloatField
      DisplayLabel = 'Valor'
      FieldName = 'VL_RECEBIDO'
      Origin = 'TRECEBIMENTO_ITEM_RECEB.VL_RECEBIDO'
      DisplayFormat = '#0,.00'
    end
  end
  object ds_utilizado: TDataSource
    DataSet = qry_utilizado_
    Left = 56
    Top = 248
  end
  object qry_utilizado_: TQuery
    DatabaseName = 'DBBROKER'
    DataSource = ds_itens_solic
    SQL.Strings = (
      'SELECT SCI.DT_SOLIC_CH,'
      'CASE SCI.IN_RESTITUI'
      '   WHEN '#39'0'#39' THEN (SCI.VL_ITEM + SCI.VL_ASSIST)'
      '   WHEN '#39'1'#39' THEN (SCI.VL_ITEM + SCI.VL_ASSIST) * (-1)'
      'END  AS VALOR'
      'FROM TSOLIC_CHEQUE SC, TSOLIC_CHEQUE_ITENS SCI'
      'WHERE SC.DT_SOLIC_CH = SCI.DT_SOLIC_CH AND'
      '               SC.NR_SOLIC_CH = SCI.NR_SOLIC_CH AND'
      '               CD_ITEM = :CD_ITEM  AND'
      '               NR_PROCESSO = :NR_PROCESSO AND'
      '               CD_STATUS IN ("0", "4", "6", "8")')
    Params.Data = {
      010002000743445F4954454D00010200300001000B4E525F50524F434553534F
      0001020030000100}
    Left = 156
    Top = 248
    object qry_utilizado_DT_SOLIC_CH: TStringField
      DisplayLabel = 'Data'
      FieldName = 'DT_SOLIC_CH'
      Origin = 'TSOLIC_CHEQUE_ITENS.DT_SOLIC_CH'
      Size = 10
    end
    object qry_utilizado_VALOR: TFloatField
      DisplayLabel = 'Valor'
      FieldName = 'VALOR'
      DisplayFormat = '#0,.00'
    end
  end
  object ds_totaliza: TDataSource
    DataSet = qry_totaliza_
    Left = 56
    Top = 307
  end
  object qry_totaliza_: TQuery
    OnCalcFields = qry_totaliza_CalcFields
    DatabaseName = 'DBBROKER'
    DataSource = ds_itens_solic
    SQL.Strings = (
      'SELECT VL_SOLICITADO , VL_RECEBIDO , '
      ' VL_UTILIZADO , VL_SALDO_ITEM , '
      ' VL_SALDO_PROCESSO'
      'FROM TNUMERARIO_SALDO_POR_ITEM'
      'WHERE ( NR_PROCESSO = :NR_PROCESSO ) AND '
      '               ( CD_ITEM = :CD_ITEM )')
    Params.Data = {
      010002000B4E525F50524F434553534F00010200300001000743445F4954454D
      0001020030000100}
    Left = 156
    Top = 307
    object qry_totaliza_VL_SOLICITADO: TFloatField
      FieldName = 'VL_SOLICITADO'
      Origin = 'TNUMERARIO_SALDO_POR_ITEM.VL_SOLICITADO'
      DisplayFormat = '#0,.00'
    end
    object qry_totaliza_VL_RECEBIDO: TFloatField
      FieldName = 'VL_RECEBIDO'
      Origin = 'TNUMERARIO_SALDO_POR_ITEM.VL_RECEBIDO'
      DisplayFormat = '#0,.00'
    end
    object qry_totaliza_VL_UTILIZADO: TFloatField
      FieldName = 'VL_UTILIZADO'
      Origin = 'TNUMERARIO_SALDO_POR_ITEM.VL_UTILIZADO'
      DisplayFormat = '#0,.00'
    end
    object qry_totaliza_VL_SALDO_ITEM: TFloatField
      FieldName = 'VL_SALDO_ITEM'
      Origin = 'TNUMERARIO_SALDO_POR_ITEM.VL_SALDO_ITEM'
      DisplayFormat = '#0,.00'
    end
    object qry_totaliza_VL_SALDO_PROCESSO: TFloatField
      FieldName = 'VL_SALDO_PROCESSO'
      Origin = 'TNUMERARIO_SALDO_POR_ITEM.VL_SALDO_PROCESSO'
      DisplayFormat = '#0,.00'
    end
    object qry_totaliza_VL_DIFERENCA: TFloatField
      FieldName = 'VL_DIFERENCA'
      DisplayFormat = '#0,.00'
      Calculated = True
    end
  end
  object ds_empresa_nac: TDataSource
    DataSet = qry_emp_nac_
    Left = 324
    Top = 24
  end
  object qry_emp_nac_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT CD_EMPRESA, NM_EMPRESA'
      'FROM TEMPRESA_NAC'
      'WHERE CD_EMPRESA <> '#39#39)
    Left = 424
    Top = 24
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
  object ds_item: TDataSource
    DataSet = qry_item_
    Left = 324
    Top = 80
  end
  object qry_item_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT CD_ITEM , NM_ITEM'
      'FROM TITEM'
      'WHERE IN_ATIVO = '#39'1'#39)
    Left = 424
    Top = 80
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
  object ds_status_item_solic_ch: TDataSource
    DataSet = tbl_status_item_solic_ch_
    Left = 532
    Top = 80
  end
  object tbl_status_item_solic_ch_: TTable
    DatabaseName = 'DBBROKER'
    IndexFieldNames = 'CODIGO'
    TableName = 'TSTATUS_SOLIC_CH_ITENS'
    Left = 672
    Top = 80
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
  object ds_banco: TDataSource
    Left = 324
    Top = 188
  end
  object ds_favorecido: TDataSource
    DataSet = qry_favorecido_
    Left = 324
    Top = 132
  end
  object qry_favorecido_: TQuery
    Active = True
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT CD_FAVORECIDO, NM_FAVORECIDO, IN_CONTROLA_IR'
      'FROM TFAVORECIDO')
    Left = 424
    Top = 132
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
    Active = True
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT CD_BANCO, NM_BANCO'
      'FROM TBANCO')
    Left = 424
    Top = 188
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
  object tbl_status_solic_ch_: TTable
    Active = True
    DatabaseName = 'DBBROKER'
    IndexFieldNames = 'CODIGO'
    TableName = 'TSTATUS_SOLIC_CH'
    Left = 672
    Top = 24
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
    Left = 532
    Top = 24
  end
  object ds_solic: TDataSource
    DataSet = qry_solic_
    Left = 56
    Top = 24
  end
  object qry_solic_: TQuery
    AfterScroll = qry_solic_AfterScroll
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT DT_SOLIC_CH, NR_SOLIC_CH, CD_FAVORECIDO, '
      
        'CD_BANCO,  CD_USUARIO, VL_SOLIC_CH, CD_STATUS_SOLIC_CH, HM_SOLIC' +
        '_CH'
      'FROM TSOLIC_CHEQUE'
      'WHERE '
      '  ( DT_SOLIC_CH = :DT_HOJE ) AND'
      '  ( CD_STATUS_SOLIC_CH IN ('#39'2'#39','#39'8'#39') ) ')
    Params.Data = {010001000744545F484F4A450001020030000000}
    Left = 156
    Top = 24
    object qry_solic_NR_SOLIC_CH: TStringField
      DisplayLabel = 'Solic.'
      FieldName = 'NR_SOLIC_CH'
      Size = 3
    end
    object qry_solic_CD_FAVORECIDO: TStringField
      FieldName = 'CD_FAVORECIDO'
      Size = 5
    end
    object qry_solic_CD_BANCO: TStringField
      FieldName = 'CD_BANCO'
      Size = 3
    end
    object qry_solic_VL_SOLIC_CH: TFloatField
      DisplayLabel = 'Valor'
      FieldName = 'VL_SOLIC_CH'
      DisplayFormat = '#0,.00'
      EditFormat = '#0.00'
    end
    object qry_solic_CD_STATUS_SOLIC_CH: TStringField
      FieldName = 'CD_STATUS_SOLIC_CH'
      Size = 1
    end
    object qry_solic_LookFavorecido: TStringField
      DisplayLabel = 'Favorecido'
      FieldName = 'LookFavorecido'
      LookupDataSet = qry_favorecido_
      LookupKeyFields = 'CD_FAVORECIDO'
      LookupResultField = 'NM_FAVORECIDO'
      KeyFields = 'CD_FAVORECIDO'
      Size = 50
      Lookup = True
    end
    object qry_solic_LookBanco: TStringField
      DisplayLabel = 'Banco'
      FieldName = 'LookBanco'
      LookupDataSet = qry_banco_
      LookupKeyFields = 'CD_BANCO'
      LookupResultField = 'NM_BANCO'
      KeyFields = 'CD_BANCO'
      Size = 40
      Lookup = True
    end
    object qry_solic_LookStSolicCheque: TStringField
      DisplayLabel = 'Status'
      FieldName = 'LookStSolicCheque'
      LookupDataSet = tbl_status_solic_ch_
      LookupKeyFields = 'CODIGO'
      LookupResultField = 'DESCRICAO'
      KeyFields = 'CD_STATUS_SOLIC_CH'
      Size = 25
      Lookup = True
    end
    object qry_solic_HM_SOLIC_CH: TStringField
      FieldName = 'HM_SOLIC_CH'
      Size = 5
    end
    object qry_solic_DT_SOLIC_CH: TStringField
      FieldName = 'DT_SOLIC_CH'
      Size = 10
    end
    object qry_solic_CD_USUARIO: TStringField
      FieldName = 'CD_USUARIO'
      Size = 4
    end
    object qry_solic_Look_Solicitante: TStringField
      FieldName = 'Look_Solicitante'
      LookupDataSet = qry_usuario_
      LookupKeyFields = 'CD_USUARIO'
      LookupResultField = 'AP_USUARIO'
      KeyFields = 'CD_USUARIO'
      Size = 15
      Lookup = True
    end
  end
  object qry_solic_ch_: TQuery
    DatabaseName = 'DBBROKER'
    DataSource = ds_solic
    RequestLive = True
    SQL.Strings = (
      'SELECT *'
      'FROM TSOLIC_CHEQUE'
      'WHERE '
      '  ( DT_SOLIC_CH = :DT_SOLIC_CH ) AND'
      '  ( NR_SOLIC_CH = :NR_SOLIC_CH )')
    Params.Data = {
      010002000B44545F534F4C49435F434800010200300001000B4E525F534F4C49
      435F43480001020030000100}
    Left = 228
    Top = 24
    object qry_solic_ch_CD_STATUS_SOLIC_CH: TStringField
      FieldName = 'CD_STATUS_SOLIC_CH'
      Origin = 'TSOLIC_CHEQUE.CD_STATUS_SOLIC_CH'
      Size = 1
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
    Left = 324
    Top = 248
    object StringField13: TStringField
      FieldName = 'NR_ADICAO'
      Size = 3
    end
    object StringField14: TStringField
      FieldName = 'NR_ITEM'
      Size = 3
    end
  end
  object sp_liberar_solic_ch: TStoredProc
    DatabaseName = 'DBBROKER'
    StoredProcName = 'dbo.sp_liberar_solic_ch'
    Params.Data = {
      0100030006526573756C74040304000000000000000C4064745F736F6C69635F
      636801010200300000000C406E725F736F6C69635F63680101020030000000}
    Left = 324
    Top = 307
  end
  object qry_usuario_: TQuery
    Active = True
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT *'
      'FROM TUSUARIO')
    Left = 532
    Top = 132
    object qry_usuario_CD_USUARIO: TStringField
      FieldName = 'CD_USUARIO'
      Origin = 'TUSUARIO.CD_USUARIO'
      Size = 4
    end
    object qry_usuario_AP_USUARIO: TStringField
      FieldName = 'AP_USUARIO'
      Origin = 'TUSUARIO.AP_USUARIO'
      Size = 15
    end
  end
end
