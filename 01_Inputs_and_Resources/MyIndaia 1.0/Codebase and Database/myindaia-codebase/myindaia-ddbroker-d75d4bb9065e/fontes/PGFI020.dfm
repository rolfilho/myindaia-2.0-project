object datm_pesq_fin: Tdatm_pesq_fin
  OldCreateOrder = True
  Left = 241
  Top = 186
  Height = 430
  Width = 417
  object ds_adm: TDataSource
    DataSet = qry_adm_
    Left = 36
    Top = 74
  end
  object qry_unid_neg_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT CD_UNID_NEG, NM_UNID_NEG, AP_UNID_NEG'
      'FROM   TUNID_NEG (NOLOCK)'
      'WHERE  CD_UNID_NEG = :CD_UNID_NEG AND'
      '       CD_UNID_NEG IN ( SELECT CD_UNID_NEG'
      '                        FROM   TUSUARIO_HABILITACAO (NOLOCK)'
      '                        WHERE  CD_USUARIO = :CD_USUARIO AND'
      '                               IN_ATIVO = '#39'1'#39' )'
      '')
    Left = 200
    Top = 20
    ParamData = <
      item
        DataType = ftString
        Name = 'CD_UNID_NEG'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'CD_USUARIO'
        ParamType = ptUnknown
      end>
  end
  object qry_favorecido_: TQuery
    DatabaseName = 'DBBROKER'
    RequestLive = True
    SQL.Strings = (
      'SELECT CD_FAVORECIDO, NM_FAVORECIDO'
      'FROM   TFAVORECIDO (NOLOCK)'
      'WHERE  CD_FAVORECIDO = :CD_FAVORECIDO ')
    Left = 200
    Top = 289
    ParamData = <
      item
        DataType = ftString
        Name = 'CD_FAVORECIDO'
        ParamType = ptUnknown
      end>
  end
  object qry_ct_contabil_: TQuery
    DatabaseName = 'DBBROKER'
    RequestLive = True
    SQL.Strings = (
      'SELECT CD_CT_CONTABIL, NM_CT_CONTABIL'
      'FROM   TCT_CONTABIL (NOLOCK)'
      'WHERE  CD_IDENTIFICADOR = '#39'A'#39' AND'
      '       CD_CT_CONTABIL = :CD_CT_CONTABIL')
    Left = 200
    Top = 126
    ParamData = <
      item
        DataType = ftString
        Name = 'CD_CT_CONTABIL'
        ParamType = ptUnknown
      end>
  end
  object qry_historico_: TQuery
    DatabaseName = 'DBBROKER'
    RequestLive = True
    SQL.Strings = (
      'SELECT CD_HISTORICO, NM_HISTORICO'
      'FROM   THIST_PADRAO (NOLOCK)'
      'WHERE  CD_HISTORICO = :CD_HISTORICO')
    Left = 200
    Top = 341
    ParamData = <
      item
        DataType = ftString
        Name = 'CD_HISTORICO'
        ParamType = ptUnknown
      end>
  end
  object qry_banco_: TQuery
    DatabaseName = 'DBBROKER'
    RequestLive = True
    SQL.Strings = (
      'SELECT CD_BANCO, NM_BANCO'
      'FROM   TBANCO (NOLOCK)'
      'WHERE  CD_BANCO = :CD_BANCO')
    Left = 200
    Top = 236
    ParamData = <
      item
        DataType = ftString
        Name = 'CD_BANCO'
        ParamType = ptUnknown
      end>
  end
  object qry_produto_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT CD_PRODUTO, NM_PRODUTO, AP_PRODUTO'
      'FROM   TPRODUTO (NOLOCK)'
      'WHERE  CD_PRODUTO = :CD_PRODUTO AND'
      '       CD_PRODUTO IN ( SELECT CD_PRODUTO'
      '                       FROM   TUSUARIO_HABILITACAO (NOLOCK)'
      '                       WHERE  CD_USUARIO = :CD_USUARIO AND'
      '                              IN_ATIVO = '#39'1'#39' )'
      '')
    Left = 200
    Top = 74
    ParamData = <
      item
        DataType = ftString
        Name = 'CD_PRODUTO'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'CD_USUARIO'
        ParamType = ptUnknown
      end>
  end
  object qry_item_: TQuery
    DatabaseName = 'DBBROKER'
    RequestLive = True
    SQL.Strings = (
      'SELECT CD_ITEM, NM_ITEM'
      'FROM   TITEM (NOLOCK)'
      'WHERE  CD_ITEM = :CD_ITEM')
    Left = 200
    Top = 181
    ParamData = <
      item
        DataType = ftString
        Name = 'CD_ITEM'
        ParamType = ptUnknown
      end>
  end
  object qry_processo_: TQuery
    DatabaseName = 'DBBROKER'
    RequestLive = True
    SQL.Strings = (
      'SELECT CD_UNID_NEG, CD_PRODUTO, CD_CLIENTE, NR_PROCESSO'
      'FROM   TPROCESSO (NOLOCK)'
      'WHERE  NR_PROCESSO = :NR_PROCESSO AND'
      '       IN_CANCELADO = '#39'0'#39' AND'
      '       IN_PRODUCAO = '#39'1'#39' AND'
      '       IN_LIBERADO = '#39'1'#39)
    Left = 289
    Top = 20
    ParamData = <
      item
        DataType = ftString
        Name = 'NR_PROCESSO'
        ParamType = ptUnknown
      end>
  end
  object ds_fat: TDataSource
    DataSet = qry_fat_
    Left = 114
    Top = 74
  end
  object qry_adm_: TQuery
    OnCalcFields = qry_adm_CalcFields
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT CD_COLIGADA, DT_MOVIMENTO, NR_LANCAMENTO, CD_UNID_NEG,'
      
        '       IN_CANCELADO, IN_TRANSFERIDO, CD_HIST_PADRAO, NM_HISTORIC' +
        'O,'
      '       VL_LANCAMENTO, TP_NATUREZA, TP_PAGAMENTO, CD_BANCO,'
      
        '       NR_CHEQUE, CD_CT_CONTABIL, CD_CT_CUSTO, TP_LANCAMENTO, IN' +
        '_CONTABILIZA,'
      
        '       TP_PROCEDENCIA, CD_FAVORECIDO, VL_IR, CD_ACESSO, CD_AUX, ' +
        'DT_CANCELADO, DT_CONCILIACAO'
      'FROM   TCAIXA (NOLOCK)'
      'WHERE  1 = 0'
      '')
    Left = 37
    Top = 20
    object qry_adm_DT_MOVIMENTO: TDateTimeField
      DisplayLabel = 'Data'
      FieldName = 'DT_MOVIMENTO'
      Origin = 'TCAIXA.DT_MOVIMENTO'
    end
    object qry_adm_NR_LANCAMENTO: TStringField
      DisplayLabel = 'N'#186' Lan'#231'.'
      FieldName = 'NR_LANCAMENTO'
      Origin = 'TCAIXA.NR_LANCAMENTO'
      Size = 6
    end
    object qry_adm_CD_FAVORECIDO: TStringField
      FieldName = 'CD_FAVORECIDO'
      Origin = 'TCAIXA.CD_FAVORECIDO'
      Size = 5
    end
    object qry_adm_CD_UNID_NEG: TStringField
      FieldName = 'CD_UNID_NEG'
      Origin = 'TCAIXA.CD_UNID_NEG'
      Size = 2
    end
    object qry_adm_IN_CANCELADO: TStringField
      FieldName = 'IN_CANCELADO'
      Origin = 'TCAIXA.IN_CANCELADO'
      Size = 1
    end
    object qry_adm_IN_TRANSFERIDO: TStringField
      FieldName = 'IN_TRANSFERIDO'
      Origin = 'TCAIXA.IN_TRANSFERIDO'
      Size = 1
    end
    object qry_adm_NM_HISTORICO: TStringField
      FieldName = 'NM_HISTORICO'
      Origin = 'TCAIXA.NM_HISTORICO'
      Size = 180
    end
    object qry_adm_VL_LANCAMENTO: TFloatField
      DisplayLabel = 'Valor'
      FieldName = 'VL_LANCAMENTO'
      Origin = 'TCAIXA.VL_LANCAMENTO'
      DisplayFormat = '#0,.00'
      EditFormat = '#0.00'
    end
    object qry_adm_TP_NATUREZA: TStringField
      FieldName = 'TP_NATUREZA'
      Origin = 'TCAIXA.TP_NATUREZA'
      Size = 1
    end
    object qry_adm_TP_PAGAMENTO: TStringField
      FieldName = 'TP_PAGAMENTO'
      Origin = 'TCAIXA.TP_PAGAMENTO'
      Size = 1
    end
    object qry_adm_CD_BANCO: TStringField
      FieldName = 'CD_BANCO'
      Origin = 'TCAIXA.CD_BANCO'
      Size = 3
    end
    object qry_adm_NR_CHEQUE: TStringField
      FieldName = 'NR_CHEQUE'
      Origin = 'TCAIXA.NR_CHEQUE'
      Size = 6
    end
    object qry_adm_CD_ACESSO: TStringField
      FieldName = 'CD_ACESSO'
      Origin = 'TCAIXA.CD_COLIGADA'
      Size = 1
    end
    object qry_adm_CD_AUX: TStringField
      FieldName = 'CD_AUX'
      Origin = 'TCAIXA.DT_MOVIMENTO'
      Size = 3
    end
    object qry_adm_CD_CT_CONTABIL: TStringField
      DisplayLabel = 'Conta Cont'#225'bil'
      FieldName = 'CD_CT_CONTABIL'
      Origin = 'TCAIXA.CD_COLIGADA'
      EditMask = '999.99.99999;0;_'
      Size = 10
    end
    object qry_adm_CD_CT_CUSTO: TStringField
      FieldName = 'CD_CT_CUSTO'
      Origin = 'TCAIXA.CD_CT_CUSTO'
      Size = 3
    end
    object qry_adm_TP_LANCAMENTO: TStringField
      FieldName = 'TP_LANCAMENTO'
      Origin = 'TCAIXA.TP_LANCAMENTO'
      Size = 1
    end
    object qry_adm_VL_IR: TFloatField
      FieldName = 'VL_IR'
      Origin = 'TCAIXA.VL_IR'
      DisplayFormat = '#0,.00'
      EditFormat = '#0,.00'
    end
    object qry_adm_TP_PROCEDENCIA: TStringField
      FieldName = 'TP_PROCEDENCIA'
      Origin = 'TCAIXA.TP_PROCEDENCIA'
      Size = 1
    end
    object qry_adm_CD_HIST_PADRAO: TStringField
      FieldName = 'CD_HIST_PADRAO'
      Origin = 'TCAIXA.CD_COLIGADA'
      Size = 3
    end
    object qry_adm_DT_CANCELADO: TDateTimeField
      FieldName = 'DT_CANCELADO'
      Origin = 'TCAIXA.CD_COLIGADA'
    end
    object qry_adm_IN_CONTABILIZA: TStringField
      FieldName = 'IN_CONTABILIZA'
      Origin = 'TCAIXA.CD_COLIGADA'
      Size = 1
    end
    object qry_adm_LookCtContabil: TStringField
      DisplayLabel = 'Contra Partida'
      FieldKind = fkCalculated
      FieldName = 'LookCtContabil'
      Size = 40
      Calculated = True
    end
    object qry_adm_LookNatureza: TStringField
      DisplayLabel = 'Natureza'
      FieldKind = fkCalculated
      FieldName = 'LookNatureza'
      Size = 10
      Calculated = True
    end
    object qry_adm_LookContabiliza: TStringField
      FieldKind = fkCalculated
      FieldName = 'LookContabiliza'
      Size = 3
      Calculated = True
    end
    object qry_adm_LookCancelado: TStringField
      DisplayLabel = 'Cancelado'
      FieldKind = fkCalculated
      FieldName = 'LookCancelado'
      Size = 3
      Calculated = True
    end
    object qry_adm_LookFavorecido: TStringField
      DisplayLabel = 'Favorecido'
      FieldKind = fkCalculated
      FieldName = 'LookFavorecido'
      Size = 50
      Calculated = True
    end
    object qry_adm_LookHistorico: TStringField
      DisplayLabel = 'Hist'#243'rico'
      DisplayWidth = 58
      FieldKind = fkCalculated
      FieldName = 'LookHistorico'
      Size = 58
      Calculated = True
    end
    object qry_adm_LookBanco: TStringField
      FieldKind = fkCalculated
      FieldName = 'LookBanco'
      Size = 40
      Calculated = True
    end
    object qry_adm_LookCtCusto: TStringField
      FieldKind = fkCalculated
      FieldName = 'LookCtCusto'
      Size = 40
      Calculated = True
    end
    object qry_adm_LookUnidNeg: TStringField
      FieldKind = fkCalculated
      FieldName = 'LookUnidNeg'
      Size = 50
      Calculated = True
    end
    object qry_adm_DT_CONCILIACAO: TDateTimeField
      FieldName = 'DT_CONCILIACAO'
      Origin = 'DBBROKER.TCAIXA.DT_CONCILIACAO'
    end
  end
  object qry_tp_natureza_: TQuery
    DatabaseName = 'DBBROKER'
    RequestLive = True
    SQL.Strings = (
      'SELECT CD_NATUREZA, NM_NATUREZA'
      'FROM   TTP_NATUREZA (NOLOCK)'
      'WHERE  CD_NATUREZA = :CD_NATUREZA')
    Left = 289
    Top = 288
    ParamData = <
      item
        DataType = ftString
        Name = 'CD_NATUREZA'
        ParamType = ptUnknown
      end>
  end
  object qry_yes_no_: TQuery
    DatabaseName = 'DBBROKER'
    RequestLive = True
    SQL.Strings = (
      'SELECT CD_YESNO, TX_YESNO'
      'FROM   TYES_NO (NOLOCK)'
      'WHERE  CD_YESNO = :CD_YESNO')
    Left = 289
    Top = 74
    ParamData = <
      item
        DataType = ftString
        Name = 'CD_YESNO'
        ParamType = ptUnknown
      end>
  end
  object qry_ct_custo_: TQuery
    DatabaseName = 'DBBROKER'
    RequestLive = True
    SQL.Strings = (
      'SELECT CD_CT_CUSTO, NM_CT_CUSTO'
      'FROM   TCT_CUSTO (NOLOCK)'
      'WHERE  CD_CT_CUSTO = :CD_CT_CUSTO')
    Left = 289
    Top = 124
    ParamData = <
      item
        DataType = ftString
        Name = 'CD_CT_CUSTO'
        ParamType = ptUnknown
      end>
  end
  object qry_fat_: TQuery
    OnCalcFields = qry_fat_CalcFields
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT DT_MOVIMENTO, NR_LANCAMENTO, CD_UNID_NEG, TP_PROCEDENCIA,'
      
        '       IN_CANCELADO, IN_TRANSFERIDO, NM_HISTORICO, VL_LANCAMENTO' +
        ', TP_NATUREZA,'
      
        '       TP_PAGAMENTO, CD_BANCO, NR_CHEQUE, CD_FAVORECIDO, NR_PROC' +
        'ESSO, CD_ITEM,'
      
        '       VL_IR, VL_ASSIST, CD_DESPACHANTE, TP_LANCAMENTO, IN_RESTI' +
        'TUI, CD_CT_CONTABIL, DT_CONCILIACAO'
      'FROM   TCAIXA (NOLOCK)'
      'WHERE  1 = 0'
      '')
    Left = 116
    Top = 20
    object qry_fat_DT_MOVIMENTO: TDateTimeField
      DisplayLabel = 'Data'
      FieldName = 'DT_MOVIMENTO'
      Origin = 'TCAIXA.DT_MOVIMENTO'
    end
    object qry_fat_NR_LANCAMENTO: TStringField
      DisplayLabel = 'N'#186' Lan'#231'.'
      FieldName = 'NR_LANCAMENTO'
      Origin = 'TCAIXA.NR_LANCAMENTO'
      Size = 6
    end
    object qry_fat_CD_UNID_NEG: TStringField
      FieldName = 'CD_UNID_NEG'
      Origin = 'TCAIXA.CD_UNID_NEG'
      Size = 2
    end
    object qry_fat_TP_LANCAMENTO: TStringField
      FieldName = 'TP_LANCAMENTO'
      Origin = 'TCAIXA.DT_MOVIMENTO'
      Size = 1
    end
    object qry_fat_TP_PROCEDENCIA: TStringField
      FieldName = 'TP_PROCEDENCIA'
      Origin = 'TCAIXA.TP_PROCEDENCIA'
      Size = 1
    end
    object qry_fat_IN_CANCELADO: TStringField
      FieldName = 'IN_CANCELADO'
      Origin = 'TCAIXA.IN_CANCELADO'
      Size = 1
    end
    object qry_fat_IN_TRANSFERIDO: TStringField
      FieldName = 'IN_TRANSFERIDO'
      Origin = 'TCAIXA.IN_TRANSFERIDO'
      Size = 1
    end
    object qry_fat_NM_HISTORICO: TStringField
      FieldName = 'NM_HISTORICO'
      Origin = 'TCAIXA.NM_HISTORICO'
      Size = 180
    end
    object qry_fat_VL_LANCAMENTO: TFloatField
      DisplayLabel = 'Valor'
      FieldName = 'VL_LANCAMENTO'
      Origin = 'TCAIXA.VL_LANCAMENTO'
      DisplayFormat = '#0,.00'
      EditFormat = '#0.00'
    end
    object qry_fat_TP_NATUREZA: TStringField
      FieldName = 'TP_NATUREZA'
      Origin = 'TCAIXA.TP_NATUREZA'
      Size = 1
    end
    object qry_fat_TP_PAGAMENTO: TStringField
      FieldName = 'TP_PAGAMENTO'
      Origin = 'TCAIXA.TP_PAGAMENTO'
      Size = 1
    end
    object qry_fat_CD_BANCO: TStringField
      FieldName = 'CD_BANCO'
      Origin = 'TCAIXA.CD_BANCO'
      Size = 3
    end
    object qry_fat_NR_CHEQUE: TStringField
      FieldName = 'NR_CHEQUE'
      Origin = 'TCAIXA.NR_CHEQUE'
      Size = 6
    end
    object qry_fat_CD_FAVORECIDO: TStringField
      FieldName = 'CD_FAVORECIDO'
      Origin = 'TCAIXA.CD_FAVORECIDO'
      Size = 5
    end
    object qry_fat_NR_PROCESSO: TStringField
      DisplayLabel = 'N'#186' Proc.'
      FieldName = 'NR_PROCESSO'
      Origin = 'TCAIXA.NR_PROCESSO'
      Size = 18
    end
    object qry_fat_CD_ITEM: TStringField
      FieldName = 'CD_ITEM'
      Origin = 'TCAIXA.CD_ITEM'
      Size = 3
    end
    object qry_fat_VL_IR: TFloatField
      FieldName = 'VL_IR'
      Origin = 'TCAIXA.VL_IR'
      DisplayFormat = '#0,.00'
      EditFormat = '#0.00'
    end
    object qry_fat_VL_ASSIST: TFloatField
      FieldName = 'VL_ASSIST'
      Origin = 'TCAIXA.VL_ASSIST'
      DisplayFormat = '#0,.00'
      EditFormat = '#0.00'
    end
    object qry_fat_CD_DESPACHANTE: TStringField
      FieldName = 'CD_DESPACHANTE'
      Origin = 'TCAIXA.CD_DESPACHANTE'
      Size = 3
    end
    object qry_fat_IN_RESTITUI: TStringField
      FieldName = 'IN_RESTITUI'
      Origin = 'TCAIXA.CD_COLIGADA'
      Size = 1
    end
    object qry_fat_LookUnidNeg: TStringField
      FieldKind = fkCalculated
      FieldName = 'LookUnidNeg'
      Size = 50
      Calculated = True
    end
    object qry_fat_LookCdProduto: TStringField
      FieldKind = fkCalculated
      FieldName = 'LookCdProduto'
      Size = 2
      Calculated = True
    end
    object qry_fat_LookProduto: TStringField
      FieldKind = fkCalculated
      FieldName = 'LookProduto'
      Size = 40
      Calculated = True
    end
    object qry_fat_LookFavorecido: TStringField
      DisplayLabel = 'Favorecido'
      FieldKind = fkCalculated
      FieldName = 'LookFavorecido'
      Size = 50
      Calculated = True
    end
    object qry_fat_LookBanco: TStringField
      FieldKind = fkCalculated
      FieldName = 'LookBanco'
      Size = 40
      Calculated = True
    end
    object qry_fat_LookCancelado: TStringField
      FieldKind = fkCalculated
      FieldName = 'LookCancelado'
      Size = 3
      Calculated = True
    end
    object qry_fat_LookItem: TStringField
      DisplayLabel = 'Item'
      FieldKind = fkCalculated
      FieldName = 'LookItem'
      Size = 30
      Calculated = True
    end
    object qry_fat_LookDespachante: TStringField
      FieldKind = fkCalculated
      FieldName = 'LookDespachante'
      Size = 50
      Calculated = True
    end
    object qry_fat_CalcNrProcesso: TStringField
      DisplayLabel = 'N'#186' Proc.'
      FieldKind = fkCalculated
      FieldName = 'CalcNrProcesso'
      Size = 14
      Calculated = True
    end
    object qry_fat_LookRestitui: TStringField
      FieldKind = fkCalculated
      FieldName = 'LookRestitui'
      Size = 3
      Calculated = True
    end
    object qry_fat_LookCdCliente: TStringField
      FieldKind = fkCalculated
      FieldName = 'LookCdCliente'
      Size = 5
      Calculated = True
    end
    object qry_fat_LookCliente: TStringField
      FieldKind = fkCalculated
      FieldName = 'LookCliente'
      Size = 50
      Calculated = True
    end
    object qry_fat_CD_CT_CONTABIL: TStringField
      FieldName = 'CD_CT_CONTABIL'
      Origin = 'TCAIXA.DT_MOVIMENTO'
      Size = 10
    end
    object qry_fat_LookContabil: TStringField
      FieldKind = fkLookup
      FieldName = 'LookContabil'
      LookupDataSet = qry_ct_contabil_
      LookupKeyFields = 'CD_CT_CONTABIL'
      LookupResultField = 'NM_CT_CONTABIL'
      KeyFields = 'CD_CT_CONTABIL'
      Size = 40
      Lookup = True
    end
    object qry_fat_DT_CONCILIACAO: TDateTimeField
      FieldName = 'DT_CONCILIACAO'
      Origin = 'DBBROKER.TCAIXA.DT_CONCILIACAO'
    end
  end
  object qry_despachante_: TQuery
    DatabaseName = 'DBBROKER'
    RequestLive = True
    SQL.Strings = (
      'SELECT CD_DESPACHANTE, NM_DESPACHANTE'
      'FROM   TDESPACHANTE (NOLOCK)'
      'WHERE  CD_DESPACHANTE = :CD_DESPACHANTE')
    Left = 289
    Top = 180
    ParamData = <
      item
        DataType = ftString
        Name = 'CD_DESPACHANTE'
        ParamType = ptUnknown
      end>
  end
  object qry_cliente_: TQuery
    DatabaseName = 'DBBROKER'
    RequestLive = True
    SQL.Strings = (
      'SELECT CD_EMPRESA, NM_EMPRESA'
      'FROM   TEMPRESA_NAC (NOLOCK)'
      'WHERE  CD_EMPRESA = :CD_EMPRESA')
    Left = 289
    Top = 234
    ParamData = <
      item
        DataType = ftString
        Name = 'CD_EMPRESA'
        ParamType = ptUnknown
      end>
  end
end
