object datm_fat_cc: Tdatm_fat_cc
  OldCreateOrder = True
  Left = 120
  Top = 108
  Height = 294
  Width = 680
  object qry_unid_neg_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT *'
      'FROM TUNID_NEG (NOLOCK)'
      'WHERE CD_UNID_NEG IN '
      '              ( SELECT CD_UNID_NEG '
      '                FROM TUSUARIO_HABILITACAO (NOLOCK)'
      '                WHERE CD_USUARIO = :CD_USUARIO )')
    Left = 60
    Top = 20
    ParamData = <
      item
        DataType = ftString
        Name = 'CD_USUARIO'
        ParamType = ptUnknown
      end>
    object qry_unid_neg_CD_UNID_NEG: TStringField
      FieldName = 'CD_UNID_NEG'
      Size = 2
    end
    object qry_unid_neg_AP_UNID_NEG: TStringField
      FieldName = 'AP_UNID_NEG'
      Size = 10
    end
    object qry_unid_neg_IN_ATIVO: TStringField
      FieldName = 'IN_ATIVO'
      Size = 1
    end
  end
  object qry_produto_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT *'
      'FROM TPRODUTO (NOLOCK)'
      'WHERE CD_PRODUTO IN '
      '              ( SELECT CD_PRODUTO'
      '                FROM TUSUARIO_HABILITACAO (NOLOCK)'
      '                WHERE CD_USUARIO = :CD_USUARIO )')
    Left = 152
    Top = 20
    ParamData = <
      item
        DataType = ftString
        Name = 'CD_USUARIO'
        ParamType = ptUnknown
      end>
    object qry_produto_CD_PRODUTO: TStringField
      FieldName = 'CD_PRODUTO'
      Size = 2
    end
    object qry_produto_AP_PRODUTO: TStringField
      FieldName = 'AP_PRODUTO'
      Size = 10
    end
    object qry_produto_IN_ATIVO: TStringField
      FieldName = 'IN_ATIVO'
      Size = 1
    end
  end
  object qry_usuario_habilitacao_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT *'
      'FROM TUSUARIO_HABILITACAO (NOLOCK)'
      'WHERE CD_USUARIO = :CD_USUARIO AND'
      '               CD_UNID_NEG = :CD_UNID_NEG AND'
      '               CD_PRODUTO = :CD_PRODUTO'
      ''
      '               ')
    Left = 60
    Top = 72
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
      end
      item
        DataType = ftString
        Name = 'CD_PRODUTO'
        ParamType = ptUnknown
      end>
    object qry_usuario_habilitacao_CD_USUARIO: TStringField
      FieldName = 'CD_USUARIO'
      Origin = 'TUSUARIO_HABILITACAO.CD_USUARIO'
      Size = 4
    end
    object qry_usuario_habilitacao_CD_UNID_NEG: TStringField
      FieldName = 'CD_UNID_NEG'
      Origin = 'TUSUARIO_HABILITACAO.CD_UNID_NEG'
      Size = 2
    end
    object qry_usuario_habilitacao_CD_PRODUTO: TStringField
      FieldName = 'CD_PRODUTO'
      Origin = 'TUSUARIO_HABILITACAO.CD_PRODUTO'
      Size = 2
    end
    object qry_usuario_habilitacao_IN_ATIVO: TStringField
      FieldName = 'IN_ATIVO'
      Origin = 'TUSUARIO_HABILITACAO.IN_ATIVO'
      Size = 1
    end
  end
  object qry_processo_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT P.NR_PROCESSO, P.CD_UNID_NEG, P.CD_PRODUTO,'
      '               P.CD_CLIENTE, P.CD_SERVICO, P.IN_LIBERADO,'
      '              C.AP_EMPRESA, S.NM_SERVICO'
      
        'FROM TPROCESSO P (NOLOCK), TEMPRESA_NAC C (NOLOCK), TSERVICO S (' +
        'NOLOCK)'
      'WHERE (P.CD_CLIENTE *= C.CD_EMPRESA) AND'
      '              (P.CD_SERVICO *= S.CD_SERVICO) AND'
      '              (P.NR_PROCESSO = :NR_PROCESSO) AND'
      '              (P.IN_PRODUCAO = '#39'1'#39' )  AND '
      '              (P.IN_CANCELADO = '#39'0'#39' )')
    Left = 233
    Top = 20
    ParamData = <
      item
        DataType = ftString
        Name = 'NR_PROCESSO'
        ParamType = ptUnknown
      end>
    object qry_processo_NR_PROCESSO: TStringField
      FieldName = 'NR_PROCESSO'
      Size = 18
    end
    object qry_processo_CD_SERVICO: TStringField
      FieldName = 'CD_SERVICO'
      Size = 3
    end
    object qry_processo_AP_EMPRESA: TStringField
      FieldName = 'AP_EMPRESA'
      Size = 10
    end
    object qry_processo_NM_SERVICO: TStringField
      FieldName = 'NM_SERVICO'
      Size = 50
    end
    object qry_processo_IN_LIBERADO: TStringField
      FieldName = 'IN_LIBERADO'
      Size = 1
    end
    object qry_processo_CD_UNID_NEG: TStringField
      FieldName = 'CD_UNID_NEG'
      Size = 2
    end
    object qry_processo_CD_PRODUTO: TStringField
      FieldName = 'CD_PRODUTO'
      Size = 2
    end
    object qry_processo_CD_CLIENTE: TStringField
      FieldName = 'CD_CLIENTE'
      Size = 5
    end
  end
  object ds_processo: TDataSource
    DataSet = qry_processo_
    Left = 233
    Top = 72
  end
  object qry_item_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT CD_ITEM , NM_ITEM , CD_TIPO_ITEM'
      'FROM   TITEM (NOLOCK)'
      'WHERE  IN_ATIVO = '#39'1'#39
      'ORDER BY CD_ITEM')
    Left = 60
    Top = 140
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
      Origin = 'TITEM.CD_ITEM'
      Size = 1
    end
  end
  object qry_banco_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT * FROM TBANCO (NOLOCK)')
    Left = 152
    Top = 140
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
      Origin = 'TBANCO.AP_BANCO'
      Size = 10
    end
    object qry_banco_NR_CONTA: TStringField
      FieldName = 'NR_CONTA'
      Origin = 'TBANCO.NR_CONTA'
      Size = 10
    end
    object qry_banco_CD_AGENCIA: TStringField
      FieldName = 'CD_AGENCIA'
      Origin = 'TBANCO.CD_AGENCIA'
      Size = 5
    end
    object qry_banco_IN_ATIVO: TStringField
      FieldName = 'IN_ATIVO'
      Origin = 'TBANCO.IN_ATIVO'
      Size = 1
    end
    object qry_banco_TP_CONTA: TStringField
      FieldName = 'TP_CONTA'
      Origin = 'TBANCO.TP_CONTA'
      Size = 1
    end
    object qry_banco_IN_FINANCEIRO: TStringField
      FieldName = 'IN_FINANCEIRO'
      Origin = 'TBANCO.IN_FINANCEIRO'
      Size = 1
    end
    object qry_banco_CD_CT_CONTABIL: TStringField
      FieldName = 'CD_CT_CONTABIL'
      Origin = 'TBANCO.CD_BANCO'
      Size = 10
    end
    object qry_banco_CD_ACESSO: TStringField
      FieldName = 'CD_ACESSO'
      Origin = 'TBANCO.FORMCONT'
      Size = 1
    end
    object qry_banco_CD_AUX: TStringField
      FieldName = 'CD_AUX'
      Origin = 'TBANCO.LEXTENSO2'
      Size = 3
    end
  end
  object tbl_yesno_: TTable
    DatabaseName = 'DBBROKER'
    IndexFieldNames = 'CD_YESNO'
    TableName = 'TYES_NO'
    Left = 308
    Top = 140
  end
  object qry_fat_cc_: TQuery
    AfterOpen = qry_fat_cc_AfterOpen
    BeforePost = qry_fat_cc_BeforePost
    AfterScroll = qry_fat_cc_AfterScroll
    OnCalcFields = qry_fat_cc_CalcFields
    DatabaseName = 'DBBROKER'
    DataSource = ds_processo
    RequestLive = True
    SQL.Strings = (
      'SELECT *'
      'FROM TFATURAMENTO_CC (NOLOCK)'
      'WHERE NR_PROCESSO = :NR_PROCESSO'
      'ORDER BY'
      'NR_LANCAMENTO')
    Left = 308
    Top = 20
    ParamData = <
      item
        DataType = ftString
        Name = 'NR_PROCESSO'
        ParamType = ptUnknown
        Size = 19
      end>
    object qry_fat_cc_NR_PROCESSO: TStringField
      FieldName = 'NR_PROCESSO'
      Origin = 'TFATURAMENTO_CC.NR_PROCESSO'
      Size = 18
    end
    object qry_fat_cc_NR_LANCAMENTO: TStringField
      FieldName = 'NR_LANCAMENTO'
      Origin = 'TFATURAMENTO_CC.NR_LANCAMENTO'
      Size = 6
    end
    object qry_fat_cc_CD_USUARIO: TStringField
      FieldName = 'CD_USUARIO'
      Origin = 'TFATURAMENTO_CC.CD_USUARIO'
      Size = 4
    end
    object qry_fat_cc_CD_FAVORECIDO: TStringField
      FieldName = 'CD_FAVORECIDO'
      Origin = 'TFATURAMENTO_CC.CD_FAVORECIDO'
      Size = 5
    end
    object qry_fat_cc_CD_BANCO: TStringField
      FieldName = 'CD_BANCO'
      Origin = 'TFATURAMENTO_CC.CD_BANCO'
      Size = 3
    end
    object qry_fat_cc_CD_ITEM: TStringField
      FieldName = 'CD_ITEM'
      Origin = 'TFATURAMENTO_CC.CD_ITEM'
      Size = 3
    end
    object qry_fat_cc_CD_DESPACHANTE: TStringField
      FieldName = 'CD_DESPACHANTE'
      Origin = 'TFATURAMENTO_CC.CD_DESPACHANTE'
      Size = 3
    end
    object qry_fat_cc_CD_TIPO_LANC: TStringField
      FieldName = 'CD_TIPO_LANC'
      Origin = 'TFATURAMENTO_CC.CD_TIPO_LANC'
      Size = 1
    end
    object qry_fat_cc_CD_ORIGEM_LANC: TStringField
      FieldName = 'CD_ORIGEM_LANC'
      Origin = 'TFATURAMENTO_CC.CD_ORIGEM_LANC'
      Size = 1
    end
    object qry_fat_cc_CD_STATUS_LANC: TStringField
      FieldName = 'CD_STATUS_LANC'
      Origin = 'TFATURAMENTO_CC.CD_STATUS_LANC'
      Size = 1
    end
    object qry_fat_cc_NR_CHEQUE: TStringField
      FieldName = 'NR_CHEQUE'
      Origin = 'TFATURAMENTO_CC.NR_CHEQUE'
      Size = 6
    end
    object qry_fat_cc_VL_ITEM: TFloatField
      FieldName = 'VL_ITEM'
      Origin = 'TFATURAMENTO_CC.VL_ITEM'
      DisplayFormat = '#0,.00'
      EditFormat = '#0.00'
    end
    object qry_fat_cc_VL_IR: TFloatField
      FieldName = 'VL_IR'
      Origin = 'TFATURAMENTO_CC.VL_IR'
      DisplayFormat = '#0,.00'
      EditFormat = '#0.00'
    end
    object qry_fat_cc_VL_ASSIST: TFloatField
      FieldName = 'VL_ASSIST'
      Origin = 'TFATURAMENTO_CC.VL_ASSIST'
      DisplayFormat = '#0,.00'
      EditFormat = '#0.00'
    end
    object qry_fat_cc_IN_FATURADO: TStringField
      FieldName = 'IN_FATURADO'
      Origin = 'TFATURAMENTO_CC.IN_FATURADO'
      Size = 1
    end
    object qry_fat_cc_NM_ITEM_COMPLEMENTO: TStringField
      FieldName = 'NM_ITEM_COMPLEMENTO'
      Origin = 'TFATURAMENTO_CC.NR_PROCESSO'
    end
    object qry_fat_cc_look_nm_item: TStringField
      FieldKind = fkLookup
      FieldName = 'look_nm_item'
      LookupDataSet = qry_item_
      LookupKeyFields = 'CD_ITEM'
      LookupResultField = 'NM_ITEM'
      KeyFields = 'CD_ITEM'
      Size = 30
      Lookup = True
    end
    object qry_fat_cc_calc_vl_lancamento: TFloatField
      FieldKind = fkCalculated
      FieldName = 'calc_vl_lancamento'
      DisplayFormat = '#0,.00'
      EditFormat = '#0.00'
      Calculated = True
    end
    object qry_fat_cc_look_tp_procedencia: TStringField
      FieldKind = fkLookup
      FieldName = 'look_tp_procedencia'
      LookupDataSet = qry_tp_proced_
      LookupKeyFields = 'TP_PROCEDENCIA'
      LookupResultField = 'NM_PROCEDENCIA'
      KeyFields = 'CD_ORIGEM_LANC'
      Lookup = True
    end
    object qry_fat_cc_look_nm_favorecido: TStringField
      FieldKind = fkLookup
      FieldName = 'look_nm_favorecido'
      LookupDataSet = qry_favorecido_
      LookupKeyFields = 'CD_FAVORECIDO'
      LookupResultField = 'NM_FAVORECIDO'
      KeyFields = 'CD_FAVORECIDO'
      Size = 40
      Lookup = True
    end
    object qry_fat_cc_look_nm_banco: TStringField
      FieldKind = fkLookup
      FieldName = 'look_nm_banco'
      LookupDataSet = qry_banco_
      LookupKeyFields = 'CD_BANCO'
      LookupResultField = 'NM_BANCO'
      KeyFields = 'CD_BANCO'
      Size = 30
      Lookup = True
    end
    object qry_fat_cc_look_nm_despachante: TStringField
      FieldKind = fkLookup
      FieldName = 'look_nm_despachante'
      LookupDataSet = qry_desp_
      LookupKeyFields = 'CD_DESPACHANTE'
      LookupResultField = 'NM_DESPACHANTE'
      KeyFields = 'CD_DESPACHANTE'
      Size = 40
      Lookup = True
    end
    object qry_fat_cc_CD_CANCELADOR: TStringField
      FieldName = 'CD_CANCELADOR'
      Origin = 'TFATURAMENTO_CC.NR_PROCESSO'
      Size = 4
    end
    object qry_fat_cc_DT_CANCELAMENTO: TDateTimeField
      FieldName = 'DT_CANCELAMENTO'
      Origin = 'TFATURAMENTO_CC.NR_LANCAMENTO'
      DisplayFormat = 'dd/mm/yyyy'
      EditMask = '99/99/9999'
    end
    object qry_fat_cc_IN_CANCELADO: TStringField
      FieldName = 'IN_CANCELADO'
      Origin = 'TFATURAMENTO_CC.DT_LANCAMENTO'
      Size = 1
    end
    object qry_fat_cc_look_controla_ir: TBooleanField
      FieldKind = fkLookup
      FieldName = 'look_controla_ir'
      LookupDataSet = qry_favorecido_
      LookupKeyFields = 'CD_FAVORECIDO'
      LookupResultField = 'IN_CONTROLA_IR'
      KeyFields = 'CD_FAVORECIDO'
      Lookup = True
    end
    object qry_fat_cc_CD_FORMA_PAGTO: TStringField
      FieldName = 'CD_FORMA_PAGTO'
      Origin = 'TFATURAMENTO_CC.NR_PROCESSO'
      Size = 1
    end
    object qry_fat_cc_NR_SOLIC_FAT: TStringField
      FieldName = 'NR_SOLIC_FAT'
      Origin = 'TFATURAMENTO_CC.NR_LANCAMENTO'
      EditMask = '99/9999;0;_'
      Size = 6
    end
    object qry_fat_cc_IN_RESTITUI: TStringField
      FieldName = 'IN_RESTITUI'
      Origin = 'TFATURAMENTO_CC.DT_LANCAMENTO'
      Size = 1
    end
    object qry_fat_cc_DT_LANCAMENTO: TDateTimeField
      FieldName = 'DT_LANCAMENTO'
      Origin = 'TFATURAMENTO_CC.NR_PROCESSO'
      DisplayFormat = 'dd/mm/yyyy'
      EditMask = '!99/99/9999;1;_'
    end
    object qry_fat_cc_CD_UNID_NEG: TStringField
      FieldName = 'CD_UNID_NEG'
      Origin = 'TFATURAMENTO_CC.NR_LANCAMENTO'
      Size = 2
    end
    object qry_fat_cc_CD_PRODUTO: TStringField
      FieldName = 'CD_PRODUTO'
      Origin = 'TFATURAMENTO_CC.DT_LANCAMENTO'
      Size = 2
    end
    object qry_fat_cc_IN_CONTABIL: TStringField
      FieldName = 'IN_CONTABIL'
      Origin = 'TFATURAMENTO_CC.CD_USUARIO'
      Size = 1
    end
    object qry_fat_cc_CD_ITEM_NAO_FAT: TStringField
      FieldName = 'CD_ITEM_NAO_FAT'
      Origin = 'TFATURAMENTO_CC.NR_PROCESSO'
      Size = 3
    end
    object qry_fat_cc_look_cd_tp_item: TStringField
      FieldKind = fkLookup
      FieldName = 'look_cd_tp_item'
      LookupDataSet = qry_item_
      LookupKeyFields = 'CD_ITEM'
      LookupResultField = 'CD_TIPO_ITEM'
      KeyFields = 'CD_ITEM'
      Size = 1
      Lookup = True
    end
    object qry_fat_cc_calc_nm_item: TStringField
      DisplayLabel = 'Item'
      FieldKind = fkCalculated
      FieldName = 'calc_nm_item'
      Size = 36
      Calculated = True
    end
    object qry_fat_cc_look_cancelado: TStringField
      FieldKind = fkLookup
      FieldName = 'look_cancelado'
      LookupDataSet = tbl_yesno_
      LookupKeyFields = 'CD_YESNO'
      LookupResultField = 'TX_YESNO'
      KeyFields = 'IN_CANCELADO'
      Size = 3
      Lookup = True
    end
    object qry_fat_cc_look_in_fat_cc: TStringField
      FieldKind = fkLookup
      FieldName = 'look_in_fat_cc'
      LookupDataSet = qry_tipo_item_
      LookupKeyFields = 'CD_TIPO_ITEM'
      LookupResultField = 'IN_FAT_CC'
      KeyFields = 'look_cd_tp_item'
      Size = 1
      Lookup = True
    end
  end
  object ds_fat_cc: TDataSource
    DataSet = qry_fat_cc_
    Left = 308
    Top = 72
  end
  object qry_favorecido_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT CD_FAVORECIDO, NM_FAVORECIDO, IN_CONTROLA_IR'
      'FROM TFAVORECIDO (NOLOCK)'
      'WHERE IN_ATIVO = '#39'1'#39)
    Left = 60
    Top = 192
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
  object qry_desp_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT CD_DESPACHANTE, NM_DESPACHANTE'
      'FROM TDESPACHANTE (NOLOCK)')
    Left = 152
    Top = 192
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
  object qry_usuario_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT * FROM TUSUARIO (NOLOCK)')
    Left = 233
    Top = 140
    object qry_usuario_CD_USUARIO: TStringField
      FieldName = 'CD_USUARIO'
      Origin = 'TUSUARIO.CD_USUARIO'
      Size = 4
    end
    object qry_usuario_CD_SENHA: TStringField
      FieldName = 'CD_SENHA'
      Origin = 'TUSUARIO.CD_SENHA'
      Size = 10
    end
    object qry_usuario_CD_CARGO: TStringField
      FieldName = 'CD_CARGO'
      Origin = 'TUSUARIO.CD_CARGO'
      Size = 3
    end
    object qry_usuario_NM_USUARIO: TStringField
      FieldName = 'NM_USUARIO'
      Origin = 'TUSUARIO.NM_USUARIO'
      Size = 50
    end
    object qry_usuario_AP_USUARIO: TStringField
      FieldName = 'AP_USUARIO'
      Origin = 'TUSUARIO.AP_USUARIO'
      Size = 15
    end
    object qry_usuario_IN_ATIVO: TStringField
      FieldName = 'IN_ATIVO'
      Origin = 'TUSUARIO.IN_ATIVO'
      Size = 1
    end
  end
  object qry_tp_proced_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT * '
      'FROM TTP_PROCEDENCIA (NOLOCK)')
    Left = 233
    Top = 192
    object qry_tp_proced_TP_PROCEDENCIA: TStringField
      FieldName = 'TP_PROCEDENCIA'
      Origin = 'TTP_PROCEDENCIA.TP_PROCEDENCIA'
      Size = 1
    end
    object qry_tp_proced_NM_PROCEDENCIA: TStringField
      FieldName = 'NM_PROCEDENCIA'
      Origin = 'TTP_PROCEDENCIA.NM_PROCEDENCIA'
    end
  end
  object ds_yesno: TDataSource
    DataSet = tbl_yesno_
    Left = 308
    Top = 192
  end
  object qry_tipo_item_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT * FROM TTIPO_ITEM (NOLOCK)')
    Left = 493
    Top = 20
    object qry_tipo_item_CD_TIPO_ITEM: TStringField
      FieldName = 'CD_TIPO_ITEM'
      Origin = 'TTIPO_ITEM.CD_TIPO_ITEM'
      Size = 1
    end
    object qry_tipo_item_NM_TIPO_ITEM: TStringField
      FieldName = 'NM_TIPO_ITEM'
      Origin = 'TTIPO_ITEM.NM_TIPO_ITEM'
      Size = 30
    end
    object qry_tipo_item_TP_NATUREZA: TStringField
      FieldName = 'TP_NATUREZA'
      Origin = 'TTIPO_ITEM.TP_NATUREZA'
      Size = 1
    end
    object qry_tipo_item_IN_FATURAR: TStringField
      FieldName = 'IN_FATURAR'
      Origin = 'TTIPO_ITEM.IN_FATURAR'
      Size = 1
    end
    object qry_tipo_item_IN_RESTITUI: TStringField
      FieldName = 'IN_RESTITUI'
      Origin = 'TTIPO_ITEM.IN_RESTITUI'
      Size = 1
    end
    object qry_tipo_item_IN_FAT_CC: TStringField
      FieldName = 'IN_FAT_CC'
      Origin = 'TTIPO_ITEM.TP_OPERACAO'
      Size = 1
    end
  end
  object qry_item_por_ton_: TQuery
    DatabaseName = 'DBBROKER'
    DataSource = ds_processo
    SQL.Strings = (
      'SELECT CD_ITEM'
      'FROM TCLIENTE_ITEM_POR_TON (NOLOCK)'
      'WHERE CD_CLIENTE = :CD_CLIENTE AND'
      '               CD_UNID_NEG = :CD_UNID_NEG AND'
      '               CD_PRODUTO = :CD_PRODUTO AND'
      '               CD_SERVICO = :CD_SERVICO AND'
      '               CD_ITEM = :CD_ITEM AND'
      '               IN_ATIVO = '#39'1'#39)
    Left = 581
    Top = 20
    ParamData = <
      item
        DataType = ftString
        Name = 'CD_CLIENTE'
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
        Name = 'CD_SERVICO'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'CD_ITEM'
        ParamType = ptUnknown
      end>
    object qry_item_por_ton_CD_ITEM: TStringField
      FieldName = 'CD_ITEM'
      Origin = 'TCLIENTE_ITEM_POR_TON.CD_ITEM'
      Size = 3
    end
  end
  object qry_rest_correta_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT NR_PROCESSO, NR_LANCAMENTO'
      'FROM   TFATURAMENTO_CC (NOLOCK)'
      'WHERE  NR_PROCESSO = :NR_PROCESSO AND'
      '       CD_ITEM = :CD_ITEM AND'
      '       IN_CANCELADO = '#39'0'#39' AND'
      '       IN_RESTITUI = '#39'0'#39' AND'
      '       DT_LANCAMENTO = :DT_LANCAMENTO AND'
      '       NR_LANCAMENTO <> :NR_LANCAMENTO')
    Left = 581
    Top = 72
    ParamData = <
      item
        DataType = ftString
        Name = 'NR_PROCESSO'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'CD_ITEM'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'DT_LANCAMENTO'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'NR_LANCAMENTO'
        ParamType = ptUnknown
      end>
  end
  object qry_ts_fatura_: TQuery
    DatabaseName = 'DBBROKER'
    DataSource = ds_fat_cc
    SQL.Strings = (
      'SELECT NR_NOTA_FATURA'
      'FROM   TS_FATURA F (NOLOCK)'
      'WHERE  CD_UNID_NEG = :CD_UNID_NEG AND'
      '       CD_PRODUTO = :CD_PRODUTO AND'
      '       NR_SOLICITACAO = :NR_SOLIC_FAT AND'
      '       IN_CANCELADO = '#39'0'#39
      '')
    Left = 388
    Top = 140
    ParamData = <
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
        Name = 'NR_SOLIC_FAT'
        ParamType = ptUnknown
      end>
    object qry_ts_fatura_NR_NOTA_FATURA: TStringField
      FieldName = 'NR_NOTA_FATURA'
      Origin = 'TS_FATURA.NR_NOTA_FATURA'
      Size = 6
    end
  end
  object ds_fs_fatura: TDataSource
    DataSet = qry_ts_fatura_
    Left = 388
    Top = 196
  end
  object qry_fat_cc_cliente_: TQuery
    DatabaseName = 'DBBROKER'
    DataSource = ds_processo
    SQL.Strings = (
      
        'SELECT F.NR_PROCESSO, F.NR_LANCAMENTO, F.DT_LANCAMENTO, I.NM_ITE' +
        'M, F.VL_ITEM, Y.TX_YESNO'
      
        'FROM   TFATURAMENTO_CC_CLIENTE F (NOLOCK), TITEM I (NOLOCK), TYE' +
        'S_NO Y (NOLOCK)'
      'WHERE  F.CD_ITEM = I.CD_ITEM AND'
      '       F.IN_CANCELADO = Y.CD_YESNO AND'
      '       F.NR_PROCESSO = :NR_PROCESSO'
      'ORDER BY'
      'NR_LANCAMENTO')
    Left = 402
    Top = 20
    ParamData = <
      item
        DataType = ftString
        Name = 'NR_PROCESSO'
        ParamType = ptUnknown
      end>
    object qry_fat_cc_cliente_NR_PROCESSO: TStringField
      FieldName = 'NR_PROCESSO'
      Origin = 'TFATURAMENTO_CC_CLIENTE.NR_PROCESSO'
      Size = 18
    end
    object qry_fat_cc_cliente_NR_LANCAMENTO: TStringField
      DisplayLabel = 'N'#250'mero'
      FieldName = 'NR_LANCAMENTO'
      Origin = 'TFATURAMENTO_CC_CLIENTE.NR_LANCAMENTO'
      Size = 3
    end
    object qry_fat_cc_cliente_DT_LANCAMENTO: TDateTimeField
      DisplayLabel = 'Data'
      FieldName = 'DT_LANCAMENTO'
      Origin = 'TFATURAMENTO_CC_CLIENTE.DT_LANCAMENTO'
      DisplayFormat = 'dd/mm/yyyy'
    end
    object qry_fat_cc_cliente_NM_ITEM: TStringField
      DisplayLabel = 'Item'
      FieldName = 'NM_ITEM'
      Origin = 'TITEM.NM_ITEM'
      Size = 30
    end
    object qry_fat_cc_cliente_VL_ITEM: TFloatField
      DisplayLabel = 'Valor da Despesa'
      FieldName = 'VL_ITEM'
      Origin = 'TFATURAMENTO_CC_CLIENTE.VL_ITEM'
      DisplayFormat = '#0.,00'
      EditFormat = '#0,00'
    end
    object qry_fat_cc_cliente_TX_YESNO: TStringField
      DisplayLabel = 'Cancelado'
      FieldName = 'TX_YESNO'
      Origin = 'TYES_NO.TX_YESNO'
      Size = 3
    end
  end
  object ds_fat_cc_cliente: TDataSource
    DataSet = qry_fat_cc_cliente_
    Left = 402
    Top = 72
  end
  object qry_item_cpmf_: TQuery
    DatabaseName = 'DBBROKER'
    DataSource = ds_fat_cc
    SQL.Strings = (
      'SELECT COUNT(*) ITEM_CPMF'
      'FROM   TFATURAMENTO_CC (NOLOCK)'
      'WHERE  NR_PROCESSO = :NR_PROCESSO AND'
      '       CD_ITEM     = ( SELECT CD_ITEM_CPMF'
      '                       FROM TPARAMETROS (NOLOCK) )')
    Left = 492
    Top = 72
    ParamData = <
      item
        DataType = ftString
        Name = 'NR_PROCESSO'
        ParamType = ptUnknown
      end>
    object qry_item_cpmf_ITEM_CPMF: TIntegerField
      FieldName = 'ITEM_CPMF'
    end
  end
  object dts_DtConcil: TDataSource
    Left = 492
    Top = 196
  end
  object qry_DtConcil: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      
        'SELECT MAX( DT_CONCILIACAO ) AS DT_CONCILIACAO FROM TCAIXA (NOLO' +
        'CK)'
      'WHERE'
      '  NR_PROCESSO = :NR_PROCESSO AND'
      '  CD_ITEM = :CD_ITEM AND'
      '  VL_LANCAMENTO = :VL_LANCAMENTO'
      '')
    Left = 492
    Top = 140
    ParamData = <
      item
        DataType = ftString
        Name = 'NR_PROCESSO'
        ParamType = ptUnknown
        Size = 19
      end
      item
        DataType = ftString
        Name = 'CD_ITEM'
        ParamType = ptUnknown
        Size = 4
      end
      item
        DataType = ftUnknown
        Name = 'VL_LANCAMENTO'
        ParamType = ptUnknown
      end>
  end
end
