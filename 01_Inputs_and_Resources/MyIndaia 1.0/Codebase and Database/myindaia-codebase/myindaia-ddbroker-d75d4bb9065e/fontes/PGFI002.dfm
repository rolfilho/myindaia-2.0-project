object datm_financeiro: Tdatm_financeiro
  OldCreateOrder = True
  Left = 9
  Top = 6
  Height = 734
  Width = 997
  object ds_favorecido: TDataSource
    DataSet = qry_favorecido_
    Left = 436
    Top = 63
  end
  object qry_favorecido_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT CD_FAVORECIDO, NM_FAVORECIDO, IN_CONTROLA_IR'
      'FROM TFAVORECIDO (NOLOCK)')
    Left = 436
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
    DataSet = qry_banco_
    Left = 539
    Top = 63
  end
  object qry_banco_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT CD_BANCO, NM_BANCO'
      'FROM TBANCO (NOLOCK)')
    Left = 539
    Top = 12
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
    DataSet = qry_item_
    Left = 316
    Top = 63
  end
  object qry_item_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT CD_ITEM , NM_ITEM, CD_TIPO_ITEM'
      'FROM   TITEM (NOLOCK)'
      'WHERE  IN_ATIVO = '#39'1'#39)
    Left = 316
    Top = 12
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
  object ds_desp: TDataSource
    DataSet = qry_desp_
    Left = 779
    Top = 63
  end
  object qry_desp_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT CD_DESPACHANTE, NM_DESPACHANTE'
      'FROM TDESPACHANTE (NOLOCK)')
    Left = 779
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
  object ds_empresa_nac: TDataSource
    DataSet = qry_emp_nac_
    Left = 873
    Top = 63
  end
  object qry_emp_nac_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT CD_EMPRESA, NM_EMPRESA'
      'FROM TEMPRESA_NAC (NOLOCK)')
    Left = 873
    Top = 12
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
    Left = 128
    Top = 168
  end
  object qry_unid_neg_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT CD_UNID_NEG, NM_UNID_NEG'
      'FROM TUNID_NEG (NOLOCK)'
      'WHERE  ( CD_UNID_NEG <> '#39#39' ) AND'
      '                (  CD_UNID_NEG IN '
      '                ( SELECT CD_UNID_NEG '
      '                  FROM TUSUARIO_HABILITACAO (NOLOCK)'
      
        '                  WHERE CD_USUARIO = :CD_USUARIO AND IN_ATIVO = ' +
        #39'1'#39' ) )'
      'ORDER BY'
      'NM_UNID_NEG'
      '')
    Left = 128
    Top = 116
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
  object ds_processo: TDataSource
    Left = 40
    Top = 168
  end
  object qry_ult_lanc_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT MAX(NR_LANCAMENTO) AS ULTIMO'
      'FROM   TCAIXA'
      'WHERE  CD_COLIGADA  = :CD_COLIGADA AND'
      '       DT_MOVIMENTO = :DT_MOVIMENTO')
    Left = 873
    Top = 116
    ParamData = <
      item
        DataType = ftString
        Name = 'CD_COLIGADA'
        ParamType = ptUnknown
      end
      item
        DataType = ftDate
        Name = 'DT_MOVIMENTO'
        ParamType = ptUnknown
      end>
    object qry_ult_lanc_ULTIMO: TStringField
      FieldName = 'ULTIMO'
      Origin = 'TSOLIC_CHEQUE_ITENS.NR_LANCAMENTO'
      Size = 3
    end
  end
  object ds_yesno: TDataSource
    DataSet = tbl_yesno_
    Left = 539
    Top = 168
  end
  object tbl_yesno_: TTable
    DatabaseName = 'DBBROKER'
    IndexFieldNames = 'CD_YESNO'
    TableName = 'TYES_NO'
    Left = 539
    Top = 116
  end
  object ds_ct_contabilRM: TDataSource
    DataSet = qry_ct_contabillRM_
    Left = 40
    Top = 63
  end
  object qry_ct_contabillRM_: TQuery
    DatabaseName = 'DBBROKER'
    DataSource = ds_coligada
    SQL.Strings = (
      'SELECT *'
      'FROM TCONTABIL_PLANO'
      'WHERE CD_COLIGADA = :CD_COLIGADA')
    Left = 40
    Top = 12
    ParamData = <
      item
        DataType = ftString
        Name = 'CD_COLIGADA'
        ParamType = ptUnknown
        Size = 3
      end>
    object qry_ct_contabillRM_CD_COLIGADA: TStringField
      FieldName = 'CD_COLIGADA'
      Origin = 'TCONTABIL_PLANO.CD_COLIGADA'
      Size = 2
    end
    object qry_ct_contabillRM_CD_CT_CONTABIL: TStringField
      FieldName = 'CD_CT_CONTABIL'
      Origin = 'DBBROKER.TCONTABIL_PLANO.CD_CT_CONTABIL'
      FixedChar = True
      Size = 12
    end
    object qry_ct_contabillRM_NM_CT_CONTABIL: TStringField
      FieldName = 'NM_CT_CONTABIL'
      Origin = 'TCONTABIL_PLANO.NM_CT_CONTABIL'
      Size = 40
    end
    object qry_ct_contabillRM_IN_DISTRIBUI: TStringField
      FieldName = 'IN_DISTRIBUI'
      Origin = 'TCONTABIL_PLANO.IN_DISTRIBUI'
      Size = 1
    end
  end
  object ds_historico: TDataSource
    DataSet = qry_historico_
    Left = 128
    Top = 63
  end
  object qry_historico_: TQuery
    DatabaseName = 'DBBROKER'
    DataSource = ds_coligada
    SQL.Strings = (
      'SELECT *'
      'FROM TCONTABIL_HISTORICO (NOLOCK)'
      'WHERE CD_COLIGADA = :CD_COLIGADA')
    Left = 128
    Top = 12
    ParamData = <
      item
        DataType = ftString
        Name = 'CD_COLIGADA'
        ParamType = ptUnknown
        Size = 3
      end>
    object qry_historico_CD_COLIGADA: TStringField
      FieldName = 'CD_COLIGADA'
      Origin = 'TCONTABIL_HISTORICO.CD_COLIGADA'
      Size = 2
    end
    object qry_historico_CD_HISTORICO: TStringField
      FieldName = 'CD_HISTORICO'
      Origin = 'TCONTABIL_HISTORICO.CD_HISTORICO'
      Size = 8
    end
    object qry_historico_NM_HISTORICO: TStringField
      FieldName = 'NM_HISTORICO'
      Origin = 'TCONTABIL_HISTORICO.NM_HISTORICO'
      Size = 58
    end
    object qry_historico_IN_COMPLEMENTO: TStringField
      FieldName = 'IN_COMPLEMENTO'
      Origin = 'TCONTABIL_HISTORICO.IN_COMPLEMENTO'
      Size = 1
    end
  end
  object ds_ct_custo: TDataSource
    DataSet = qry_ct_custo_
    Left = 202
    Top = 63
  end
  object qry_ct_custo_: TQuery
    DatabaseName = 'DBBROKER'
    DataSource = ds_coligada
    SQL.Strings = (
      'SELECT *'
      'FROM TCONTABIL_CUSTO (NOLOCK)'
      'WHERE CD_COLIGADA = :CD_COLIGADA')
    Left = 202
    Top = 12
    ParamData = <
      item
        DataType = ftString
        Name = 'CD_COLIGADA'
        ParamType = ptUnknown
        Size = 3
      end>
    object qry_ct_custo_CD_COLIGADA: TStringField
      FieldName = 'CD_COLIGADA'
      Origin = 'TCONTABIL_CUSTO.CD_COLIGADA'
      Size = 2
    end
    object qry_ct_custo_CD_CT_CUSTO: TStringField
      FieldName = 'CD_CT_CUSTO'
      Origin = 'TCONTABIL_CUSTO.CD_CT_CUSTO'
      Size = 3
    end
    object qry_ct_custo_NM_CT_CUSTO: TStringField
      FieldName = 'NM_CT_CUSTO'
      Origin = 'TCONTABIL_CUSTO.NM_CT_CUSTO'
      Size = 40
    end
  end
  object ds_ct_distr_gerencial: TDataSource
    DataSet = qry_ct_distr_gerencial_
    Left = 668
    Top = 63
  end
  object qry_ct_distr_gerencial_: TQuery
    DatabaseName = 'DBBROKER'
    DataSource = ds_coligada
    SQL.Strings = (
      'SELECT *'
      'FROM TCONTABIL_GERENCIAL (NOLOCK)'
      'WHERE CD_COLIGADA = :CD_COLIGADA')
    Left = 668
    Top = 12
    ParamData = <
      item
        DataType = ftString
        Name = 'CD_COLIGADA'
        ParamType = ptUnknown
      end>
    object qry_ct_distr_gerencial_CD_COLIGADA: TStringField
      FieldName = 'CD_COLIGADA'
      Origin = 'TCONTABIL_GERENCIAL.CD_COLIGADA'
      Size = 2
    end
    object qry_ct_distr_gerencial_CD_CT_GERENCIAL: TStringField
      FieldName = 'CD_CT_GERENCIAL'
      Origin = 'TCONTABIL_GERENCIAL.CD_CT_GERENCIAL'
      Size = 4
    end
    object qry_ct_distr_gerencial_NM_CT_GERENCIAL: TStringField
      FieldName = 'NM_CT_GERENCIAL'
      Origin = 'TCONTABIL_GERENCIAL.NM_CT_GERENCIAL'
    end
  end
  object qry_processo_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT NR_PROCESSO, CD_UNID_NEG, CD_CLIENTE'
      'FROM TPROCESSO (NOLOCK)'
      'WHERE  NR_PROCESSO = :NR_PROCESSO  AND'
      '       IN_LIBERADO = '#39'1'#39)
    Left = 40
    Top = 116
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
    object qry_processo_CD_CLIENTE: TStringField
      FieldName = 'CD_CLIENTE'
      Origin = 'TPROCESSO.CD_CLIENTE'
      Size = 5
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
  end
  object ds_caixa_contabil: TDataSource
    DataSet = qry_caixa_contabil_
    Left = 40
    Top = 376
  end
  object qry_caixa_contabil_: TQuery
    CachedUpdates = True
    AfterOpen = qry_caixa_contabil_AfterOpen
    BeforePost = qry_caixa_contabil_BeforePost
    AfterPost = qry_caixa_contabil_AfterPost
    AfterDelete = qry_caixa_contabil_AfterDelete
    BeforeScroll = qry_caixa_contabil_BeforeScroll
    AfterScroll = qry_caixa_contabil_AfterScroll
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT CD_COLIGADA, DT_MOVIMENTO, NR_LANCAMENTO, CD_UNID_NEG,'
      'IN_CANCELADO, IN_TRANSFERIDO, CD_HISTORICO, NM_HISTORICO,'
      'VL_LANCAMENTO, TP_NATUREZA, TP_PAGAMENTO, CD_BANCO, '
      
        'NR_CHEQUE, CD_CT_CONTABIL, CD_CT_CUSTO, TP_LANCAMENTO, IN_CONTAB' +
        'ILIZA,'
      
        'TP_PROCEDENCIA, CD_FAVORECIDO, VL_IR, CD_ACESSO, CD_AUX, CD_HIST' +
        '_PADRAO, DT_CANCELADO,'
      
        'VL_INSS, VL_PISCOFINS, VL_ISS, IN_CONCILIACAO, DT_CONCILIACAO, I' +
        'N_CONCILIACAO_AUTOM, NR_SEQ_CONCILIACAO, CD_USUARIO_CONCILIACAO,' +
        ' CD_RATEIO'
      'FROM TCAIXA'
      'WHERE TP_LANCAMENTO = "C" AND '
      'DT_MOVIMENTO = :DT_MOVIMENTO AND'
      'CD_UNID_NEG = :CD_UNID_NEG AND'
      'CD_COLIGADA = :CD_COLIGADA ')
    UpdateObject = Upd_caixa_contabil_
    Left = 40
    Top = 325
    ParamData = <
      item
        DataType = ftDateTime
        Name = 'DT_MOVIMENTO'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'CD_UNID_NEG'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'CD_COLIGADA'
        ParamType = ptInput
      end>
    object qry_caixa_contabil_CD_COLIGADA: TStringField
      FieldName = 'CD_COLIGADA'
      Origin = 'TCAIXA.CD_COLIGADA'
      Size = 2
    end
    object qry_caixa_contabil_DT_MOVIMENTO: TDateTimeField
      FieldName = 'DT_MOVIMENTO'
      Origin = 'TCAIXA.DT_MOVIMENTO'
    end
    object qry_caixa_contabil_NR_LANCAMENTO: TStringField
      DisplayLabel = 'N'#186' Lan'#231'.'
      DisplayWidth = 6
      FieldName = 'NR_LANCAMENTO'
      Origin = 'TCAIXA.NR_LANCAMENTO'
      Size = 6
    end
    object qry_caixa_contabil_CD_FAVORECIDO: TStringField
      FieldName = 'CD_FAVORECIDO'
      Origin = 'TCAIXA.CD_FAVORECIDO'
      Size = 5
    end
    object qry_caixa_contabil_CD_UNID_NEG: TStringField
      FieldName = 'CD_UNID_NEG'
      Origin = 'TCAIXA.CD_UNID_NEG'
      Size = 2
    end
    object qry_caixa_contabil_IN_CANCELADO: TStringField
      FieldName = 'IN_CANCELADO'
      Origin = 'TCAIXA.IN_CANCELADO'
      Size = 1
    end
    object qry_caixa_contabil_IN_TRANSFERIDO: TStringField
      FieldName = 'IN_TRANSFERIDO'
      Origin = 'TCAIXA.IN_TRANSFERIDO'
      Size = 1
    end
    object qry_caixa_contabil_CD_HISTORICO: TStringField
      FieldName = 'CD_HISTORICO'
      Origin = 'TCAIXA.CD_HISTORICO'
      Size = 8
    end
    object qry_caixa_contabil_NM_HISTORICO: TStringField
      FieldName = 'NM_HISTORICO'
      Origin = 'TCAIXA.NM_HISTORICO'
      Size = 180
    end
    object qry_caixa_contabil_VL_LANCAMENTO: TFloatField
      DisplayLabel = 'Valor'
      FieldName = 'VL_LANCAMENTO'
      Origin = 'TCAIXA.VL_LANCAMENTO'
      DisplayFormat = '#0,.00'
      EditFormat = '#0.00'
    end
    object qry_caixa_contabil_TP_NATUREZA: TStringField
      FieldName = 'TP_NATUREZA'
      Origin = 'TCAIXA.TP_NATUREZA'
      Size = 1
    end
    object qry_caixa_contabil_TP_PAGAMENTO: TStringField
      FieldName = 'TP_PAGAMENTO'
      Origin = 'TCAIXA.TP_PAGAMENTO'
      Size = 1
    end
    object qry_caixa_contabil_CD_BANCO: TStringField
      FieldName = 'CD_BANCO'
      Origin = 'TCAIXA.CD_BANCO'
      Size = 3
    end
    object qry_caixa_contabil_NR_CHEQUE: TStringField
      FieldName = 'NR_CHEQUE'
      Origin = 'TCAIXA.NR_CHEQUE'
      Size = 6
    end
    object qry_caixa_contabil_CD_ACESSO: TStringField
      FieldName = 'CD_ACESSO'
      Origin = 'TCAIXA.CD_COLIGADA'
      Size = 1
    end
    object qry_caixa_contabil_CD_AUX: TStringField
      FieldName = 'CD_AUX'
      Origin = 'TCAIXA.DT_MOVIMENTO'
      Size = 3
    end
    object qry_caixa_contabil_TP_LANCAMENTO: TStringField
      FieldName = 'TP_LANCAMENTO'
      Origin = 'TCAIXA.TP_LANCAMENTO'
      Size = 1
    end
    object qry_caixa_contabil_VL_IR: TFloatField
      FieldName = 'VL_IR'
      Origin = 'TCAIXA.VL_IR'
      DisplayFormat = '#0,.00'
      EditFormat = '#0,.00'
    end
    object qry_caixa_contabil_TP_PROCEDENCIA: TStringField
      FieldName = 'TP_PROCEDENCIA'
      Origin = 'TCAIXA.TP_PROCEDENCIA'
      Size = 1
    end
    object qry_caixa_contabil_CD_HIST_PADRAO: TStringField
      FieldName = 'CD_HIST_PADRAO'
      Origin = 'TCAIXA.CD_COLIGADA'
      Size = 3
    end
    object qry_caixa_contabil_LookUnidNegContabil: TStringField
      FieldKind = fkLookup
      FieldName = 'LookUnidNegContabil'
      LookupDataSet = qry_unid_neg_
      LookupKeyFields = 'CD_UNID_NEG'
      LookupResultField = 'NM_UNID_NEG'
      KeyFields = 'CD_UNID_NEG'
      Size = 50
      Lookup = True
    end
    object qry_caixa_contabil_LookCtContabilRM: TStringField
      DisplayLabel = 'Contra Partida'
      FieldKind = fkLookup
      FieldName = 'LookCtContabilRM'
      LookupDataSet = qry_ct_contabillRM_
      LookupKeyFields = 'CD_CT_CONTABIL'
      LookupResultField = 'NM_CT_CONTABIL'
      KeyFields = 'CD_CT_CONTABIL'
      Size = 40
      Lookup = True
    end
    object qry_caixa_contabil_LookHistorico: TStringField
      FieldKind = fkLookup
      FieldName = 'LookHistorico'
      LookupDataSet = qry_historico_
      LookupKeyFields = 'CD_HISTORICO'
      LookupResultField = 'NM_HISTORICO'
      KeyFields = 'CD_HISTORICO'
      Size = 58
      Lookup = True
    end
    object qry_caixa_contabil_LookBancoContabil: TStringField
      FieldKind = fkLookup
      FieldName = 'LookBancoContabil'
      LookupDataSet = qry_banco_
      LookupKeyFields = 'CD_BANCO'
      LookupResultField = 'NM_BANCO'
      KeyFields = 'CD_BANCO'
      Size = 40
      Lookup = True
    end
    object qry_caixa_contabil_LookCtCusto: TStringField
      FieldKind = fkLookup
      FieldName = 'LookCtCusto'
      LookupDataSet = qry_ct_custo_
      LookupKeyFields = 'CD_CT_CUSTO'
      LookupResultField = 'NM_CT_CUSTO'
      KeyFields = 'CD_CT_CUSTO'
      Size = 40
      Lookup = True
    end
    object qry_caixa_contabil_LookTpNatContabil: TStringField
      DisplayLabel = 'Natureza'
      FieldKind = fkLookup
      FieldName = 'LookTpNatContabil'
      LookupDataSet = tbl_tp_nat_
      LookupKeyFields = 'CD_NATUREZA'
      LookupResultField = 'NM_NATUREZA'
      KeyFields = 'TP_NATUREZA'
      Size = 10
      Lookup = True
    end
    object qry_caixa_contabil_LookCanceladoContabil: TStringField
      DisplayLabel = 'Cancelado'
      FieldKind = fkLookup
      FieldName = 'LookCanceladoContabil'
      LookupDataSet = tbl_yesno_
      LookupKeyFields = 'CD_YESNO'
      LookupResultField = 'TX_YESNO'
      KeyFields = 'IN_CANCELADO'
      Size = 3
      Lookup = True
    end
    object qry_caixa_contabil_LookComplemento: TStringField
      FieldKind = fkLookup
      FieldName = 'LookComplemento'
      LookupDataSet = qry_historico_
      LookupKeyFields = 'CD_HISTORICO'
      LookupResultField = 'IN_COMPLEMENTO'
      KeyFields = 'CD_HISTORICO'
      Size = 1
      Lookup = True
    end
    object qry_caixa_contabil_LookInDistribuicao: TStringField
      FieldKind = fkLookup
      FieldName = 'LookInDistribuicao'
      LookupDataSet = qry_ct_contabillRM_
      LookupKeyFields = 'CD_CT_CONTABIL'
      LookupResultField = 'IN_DISTRIBUI'
      KeyFields = 'CD_CT_CONTABIL'
      Size = 1
      Lookup = True
    end
    object qry_caixa_contabil_LookFavorContabil: TStringField
      FieldKind = fkLookup
      FieldName = 'LookFavorContabil'
      LookupDataSet = qry_favorecido_
      LookupKeyFields = 'CD_FAVORECIDO'
      LookupResultField = 'NM_FAVORECIDO'
      KeyFields = 'CD_FAVORECIDO'
      Size = 50
      Lookup = True
    end
    object qry_caixa_contabil_LookControlaIRContabil: TBooleanField
      FieldKind = fkLookup
      FieldName = 'LookControlaIRContabil'
      LookupDataSet = qry_favorecido_
      LookupKeyFields = 'CD_FAVORECIDO'
      LookupResultField = 'IN_CONTROLA_IR'
      KeyFields = 'CD_FAVORECIDO'
      Lookup = True
    end
    object qry_caixa_contabil_LookCtContabil: TStringField
      DisplayLabel = 'Contra Partida'
      FieldKind = fkLookup
      FieldName = 'LookCtContabil'
      LookupDataSet = qry_ct_contabil_
      LookupKeyFields = 'CD_CT_CONTABIL'
      LookupResultField = 'NM_CT_CONTABIL'
      KeyFields = 'CD_CT_CONTABIL'
      Size = 40
      Lookup = True
    end
    object qry_caixa_contabil_LookAcesso: TStringField
      DisplayLabel = 'Acesso'
      FieldKind = fkLookup
      FieldName = 'LookAcesso'
      LookupDataSet = qry_ct_contabil_
      LookupKeyFields = 'CD_CT_CONTABIL'
      LookupResultField = 'CD_ACESSO'
      KeyFields = 'CD_CT_CONTABIL'
      Size = 1
      Lookup = True
    end
    object qry_caixa_contabil_LookAux: TStringField
      DisplayLabel = 'Aux'
      FieldKind = fkLookup
      FieldName = 'LookAux'
      LookupDataSet = qry_ct_contabil_
      LookupKeyFields = 'CD_CT_CONTABIL'
      LookupResultField = 'CD_AUX'
      KeyFields = 'CD_CT_CONTABIL'
      Size = 3
      Lookup = True
    end
    object qry_caixa_contabil_LookHistPadrao: TStringField
      FieldKind = fkLookup
      FieldName = 'LookHistPadrao'
      LookupDataSet = qry_hist_padrao_
      LookupKeyFields = 'CD_HISTORICO'
      LookupResultField = 'NM_HISTORICO'
      KeyFields = 'CD_HIST_PADRAO'
      Size = 50
      Lookup = True
    end
    object qry_caixa_contabil_DT_CANCELADO: TDateTimeField
      FieldName = 'DT_CANCELADO'
      Origin = 'TCAIXA.CD_COLIGADA'
    end
    object qry_caixa_contabil_IN_CONTABILIZA: TStringField
      FieldName = 'IN_CONTABILIZA'
      Origin = 'TCAIXA.CD_COLIGADA'
      Size = 1
    end
    object qry_caixa_contabil_CD_CT_CUSTO: TStringField
      FieldName = 'CD_CT_CUSTO'
      Origin = 'DBBROKER.TCAIXA.CD_CT_CUSTO'
      FixedChar = True
      Size = 4
    end
    object qry_caixa_contabil_VL_INSS: TFloatField
      FieldName = 'VL_INSS'
      DisplayFormat = '#,##0.00'
      EditFormat = '#,##0.00'
    end
    object qry_caixa_contabil_VL_PISCOFINS: TFloatField
      FieldName = 'VL_PISCOFINS'
      DisplayFormat = '#,##0.00'
      EditFormat = '#,##0.00'
    end
    object qry_caixa_contabil_VL_ISS: TFloatField
      FieldName = 'VL_ISS'
      DisplayFormat = '#,##0.00'
      EditFormat = '#,##0.00'
    end
    object qry_caixa_contabil_IN_CONCILIACAO: TStringField
      FieldName = 'IN_CONCILIACAO'
      FixedChar = True
      Size = 1
    end
    object qry_caixa_contabil_DT_CONCILIACAO: TDateTimeField
      FieldName = 'DT_CONCILIACAO'
    end
    object qry_caixa_contabil_IN_CONCILIACAO_AUTOM: TStringField
      FieldName = 'IN_CONCILIACAO_AUTOM'
      Origin = 'DBBROKER.TCAIXA.IN_CONCILIACAO_AUTOM'
      FixedChar = True
      Size = 1
    end
    object qry_caixa_contabil_NR_SEQ_CONCILIACAO: TIntegerField
      FieldName = 'NR_SEQ_CONCILIACAO'
      Origin = 'DBBROKER.TCAIXA.NR_SEQ_CONCILIACAO'
    end
    object qry_caixa_contabil_CD_USUARIO_CONCILIACAO: TStringField
      FieldName = 'CD_USUARIO_CONCILIACAO'
      Origin = 'DBBROKER.TCAIXA.CD_USUARIO_CONCILIACAO'
      FixedChar = True
      Size = 4
    end
    object qry_caixa_contabil_CD_RATEIO: TStringField
      FieldName = 'CD_RATEIO'
      Origin = 'DBBROKER.TCAIXA.CD_RATEIO'
      FixedChar = True
      Size = 4
    end
    object qry_caixa_contabil_CD_CT_CONTABIL: TStringField
      DisplayLabel = 'C'#243'd.'
      FieldName = 'CD_CT_CONTABIL'
      Origin = 'DBBROKER.TCAIXA.CD_CT_CONTABIL'
      FixedChar = True
      Size = 13
    end
  end
  object ds_caixa_acerto: TDataSource
    DataSet = qry_caixa_acerto_
    Left = 316
    Top = 376
  end
  object qry_caixa_acerto_: TQuery
    BeforePost = qry_caixa_acerto_BeforePost
    DatabaseName = 'DBBROKER'
    RequestLive = True
    SQL.Strings = (
      'SELECT CD_COLIGADA, DT_MOVIMENTO, NR_LANCAMENTO, CD_UNID_NEG,'
      'IN_CANCELADO, IN_TRANSFERIDO, NM_HISTORICO,'
      'VL_LANCAMENTO, TP_NATUREZA, TP_PAGAMENTO, '
      'CD_BANCO, NR_CHEQUE, CD_CT_ACERTO, DT_ACERTO,'
      'NR_ACERTO, TP_LANCAMENTO, TP_PROCEDENCIA'
      'FROM TCAIXA'
      'WHERE TP_LANCAMENTO = "A"  AND'
      'DT_MOVIMENTO = :DT_MOVIMENTO AND'
      'CD_UNID_NEG = :CD_UNID_NEG AND'
      'CD_COLIGADA = :CD_COLIGADA')
    Left = 316
    Top = 325
    ParamData = <
      item
        DataType = ftDate
        Name = 'DT_MOVIMENTO'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'CD_UNID_NEG'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'CD_COLIGADA'
        ParamType = ptUnknown
      end>
    object qry_caixa_acerto_NR_LANCAMENTO: TStringField
      DisplayLabel = 'N'#186' Lan'#231'.'
      DisplayWidth = 6
      FieldName = 'NR_LANCAMENTO'
      Origin = 'TCAIXA.NR_LANCAMENTO'
      Size = 6
    end
    object qry_caixa_acerto_CD_UNID_NEG: TStringField
      FieldName = 'CD_UNID_NEG'
      Origin = 'TCAIXA.CD_UNID_NEG'
      Size = 2
    end
    object qry_caixa_acerto_IN_CANCELADO: TStringField
      FieldName = 'IN_CANCELADO'
      Origin = 'TCAIXA.IN_CANCELADO'
      Size = 1
    end
    object qry_caixa_acerto_IN_TRANSFERIDO: TStringField
      FieldName = 'IN_TRANSFERIDO'
      Origin = 'TCAIXA.IN_TRANSFERIDO'
      Size = 1
    end
    object qry_caixa_acerto_NM_HISTORICO: TStringField
      FieldName = 'NM_HISTORICO'
      Origin = 'TCAIXA.NM_HISTORICO'
      Size = 180
    end
    object qry_caixa_acerto_VL_LANCAMENTO: TFloatField
      DisplayLabel = 'Valor'
      FieldName = 'VL_LANCAMENTO'
      Origin = 'TCAIXA.VL_LANCAMENTO'
      DisplayFormat = '#0,.00'
      EditFormat = '#0.00'
    end
    object qry_caixa_acerto_TP_NATUREZA: TStringField
      FieldName = 'TP_NATUREZA'
      Origin = 'TCAIXA.TP_NATUREZA'
      Size = 1
    end
    object qry_caixa_acerto_TP_PAGAMENTO: TStringField
      FieldName = 'TP_PAGAMENTO'
      Origin = 'TCAIXA.TP_PAGAMENTO'
      Size = 1
    end
    object qry_caixa_acerto_CD_BANCO: TStringField
      FieldName = 'CD_BANCO'
      Origin = 'TCAIXA.CD_BANCO'
      Size = 3
    end
    object qry_caixa_acerto_NR_CHEQUE: TStringField
      FieldName = 'NR_CHEQUE'
      Origin = 'TCAIXA.NR_CHEQUE'
      Size = 6
    end
    object qry_caixa_acerto_DT_ACERTO: TDateTimeField
      FieldName = 'DT_ACERTO'
      Origin = 'TCAIXA.DT_ACERTO'
    end
    object qry_caixa_acerto_TP_LANCAMENTO: TStringField
      FieldName = 'TP_LANCAMENTO'
      Origin = 'TCAIXA.DT_MOVIMENTO'
      Size = 1
    end
    object qry_caixa_acerto_LookUnidNegAcerto: TStringField
      FieldKind = fkLookup
      FieldName = 'LookUnidNegAcerto'
      LookupDataSet = qry_unid_neg_
      LookupKeyFields = 'CD_UNID_NEG'
      LookupResultField = 'NM_UNID_NEG'
      KeyFields = 'CD_UNID_NEG'
      Size = 50
      Lookup = True
    end
    object qry_caixa_acerto_LookCtAcerto: TStringField
      DisplayLabel = 'Conta'
      FieldKind = fkLookup
      FieldName = 'LookCtAcerto'
      LookupDataSet = qry_conta_acerto_
      LookupKeyFields = 'CD_CONTA'
      LookupResultField = 'NM_CONTA'
      KeyFields = 'CD_CT_ACERTO'
      Lookup = True
    end
    object qry_caixa_acerto_LookTpNatAcerto: TStringField
      DisplayLabel = 'Natureza'
      FieldKind = fkLookup
      FieldName = 'LookTpNatAcerto'
      LookupDataSet = tbl_tp_nat_
      LookupKeyFields = 'CD_NATUREZA'
      LookupResultField = 'NM_NATUREZA'
      KeyFields = 'TP_NATUREZA'
      Size = 10
      Lookup = True
    end
    object qry_caixa_acerto_LookCanceladoAcerto: TStringField
      DisplayLabel = 'Cancelado'
      FieldKind = fkLookup
      FieldName = 'LookCanceladoAcerto'
      LookupDataSet = tbl_yesno_
      LookupKeyFields = 'CD_YESNO'
      LookupResultField = 'TX_YESNO'
      KeyFields = 'IN_CANCELADO'
      Lookup = True
    end
    object qry_caixa_acerto_LookBancoAcerto: TStringField
      FieldKind = fkLookup
      FieldName = 'LookBancoAcerto'
      LookupDataSet = qry_banco_
      LookupKeyFields = 'CD_BANCO'
      LookupResultField = 'NM_BANCO'
      KeyFields = 'CD_BANCO'
      Size = 40
      Lookup = True
    end
    object qry_caixa_acerto_TP_PROCEDENCIA: TStringField
      FieldName = 'TP_PROCEDENCIA'
      Origin = 'TCAIXA.DT_MOVIMENTO'
      Size = 1
    end
    object qry_caixa_acerto_CD_COLIGADA: TStringField
      FieldName = 'CD_COLIGADA'
      Origin = 'TCAIXA.CD_COLIGADA'
      Size = 2
    end
    object qry_caixa_acerto_DT_MOVIMENTO: TDateTimeField
      FieldName = 'DT_MOVIMENTO'
      Origin = 'TCAIXA.DT_MOVIMENTO'
    end
    object qry_caixa_acerto_CD_CT_ACERTO: TStringField
      FieldName = 'CD_CT_ACERTO'
      Origin = 'TCAIXA.NR_LANCAMENTO'
      Size = 3
    end
    object qry_caixa_acerto_NR_ACERTO: TStringField
      FieldName = 'NR_ACERTO'
      Origin = 'TCAIXA.CD_UNID_NEG'
      Size = 3
    end
  end
  object ds_caixa_fatur: TDataSource
    DataSet = qry_caixa_fatur_
    Left = 539
    Top = 376
  end
  object qry_caixa_fatur_: TQuery
    AfterOpen = qry_caixa_fatur_AfterOpen
    BeforePost = qry_caixa_fatur_BeforePost
    AfterScroll = qry_caixa_fatur_AfterScroll
    OnCalcFields = qry_caixa_fatur_CalcFields
    DatabaseName = 'DBBROKER'
    RequestLive = True
    SQL.Strings = (
      'SELECT CD_COLIGADA, DT_MOVIMENTO, NR_LANCAMENTO, '
      'CD_UNID_NEG, TP_PROCEDENCIA, IN_CANCELADO, IN_TRANSFERIDO,'
      'NM_HISTORICO, VL_LANCAMENTO, TP_NATUREZA, '
      'TP_PAGAMENTO, CD_BANCO, NR_CHEQUE, '
      'NR_ACERTO, CD_FAVORECIDO, NR_PROCESSO, CD_ITEM,'
      
        'VL_IR, VL_ASSIST, CD_DESPACHANTE, TP_LANCAMENTO, IN_RESTITUI, CD' +
        '_CT_CONTABIL,'
      
        'CD_CT_CUSTO, IN_CONCILIACAO, DT_CONCILIACAO, CD_USUARIO_CONCILIA' +
        'CAO,'
      
        'IN_CONCILIACAO_AUTOM, NR_SEQ_CONCILIACAO, CD_RATEIO, CODIGO_CTAA' +
        'PAGAR_LANC'
      'FROM TCAIXA'
      'WHERE TP_LANCAMENTO = "F" AND'
      'DT_MOVIMENTO = :DT_MOVIMENTO AND'
      'CD_UNID_NEG = :CD_UNID_NEG AND'
      'CD_COLIGADA = :CD_COLIGADA'
      'ORDER BY NR_PROCESSO')
    Left = 539
    Top = 325
    ParamData = <
      item
        DataType = ftDate
        Name = 'DT_MOVIMENTO'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'CD_UNID_NEG'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'CD_COLIGADA'
        ParamType = ptUnknown
      end>
    object qry_caixa_fatur_CD_COLIGADA: TStringField
      FieldName = 'CD_COLIGADA'
      Origin = 'TCAIXA.DT_MOVIMENTO'
      Size = 2
    end
    object qry_caixa_fatur_DT_MOVIMENTO: TDateTimeField
      FieldName = 'DT_MOVIMENTO'
      Origin = 'TCAIXA.DT_MOVIMENTO'
    end
    object qry_caixa_fatur_NR_LANCAMENTO: TStringField
      DisplayLabel = 'N'#186' Lan'#231'.'
      DisplayWidth = 6
      FieldName = 'NR_LANCAMENTO'
      Origin = 'TCAIXA.NR_LANCAMENTO'
      Size = 6
    end
    object qry_caixa_fatur_CD_UNID_NEG: TStringField
      FieldName = 'CD_UNID_NEG'
      Origin = 'TCAIXA.CD_UNID_NEG'
      Size = 2
    end
    object qry_caixa_fatur_TP_LANCAMENTO: TStringField
      FieldName = 'TP_LANCAMENTO'
      Origin = 'TCAIXA.DT_MOVIMENTO'
      Size = 1
    end
    object qry_caixa_fatur_TP_PROCEDENCIA: TStringField
      FieldName = 'TP_PROCEDENCIA'
      Origin = 'TCAIXA.TP_PROCEDENCIA'
      Size = 1
    end
    object qry_caixa_fatur_IN_CANCELADO: TStringField
      FieldName = 'IN_CANCELADO'
      Origin = 'TCAIXA.IN_CANCELADO'
      Size = 1
    end
    object qry_caixa_fatur_IN_TRANSFERIDO: TStringField
      FieldName = 'IN_TRANSFERIDO'
      Origin = 'TCAIXA.IN_TRANSFERIDO'
      Size = 1
    end
    object qry_caixa_fatur_NM_HISTORICO: TStringField
      FieldName = 'NM_HISTORICO'
      Origin = 'TCAIXA.NM_HISTORICO'
      Size = 180
    end
    object qry_caixa_fatur_VL_LANCAMENTO: TFloatField
      DisplayLabel = 'Valor'
      FieldName = 'VL_LANCAMENTO'
      Origin = 'TCAIXA.VL_LANCAMENTO'
      DisplayFormat = '#0,.00'
      EditFormat = '#0.00'
    end
    object qry_caixa_fatur_TP_NATUREZA: TStringField
      FieldName = 'TP_NATUREZA'
      Origin = 'TCAIXA.TP_NATUREZA'
      Size = 1
    end
    object qry_caixa_fatur_TP_PAGAMENTO: TStringField
      FieldName = 'TP_PAGAMENTO'
      Origin = 'TCAIXA.TP_PAGAMENTO'
      Size = 1
    end
    object qry_caixa_fatur_CD_BANCO: TStringField
      FieldName = 'CD_BANCO'
      Origin = 'TCAIXA.CD_BANCO'
      Size = 3
    end
    object qry_caixa_fatur_NR_CHEQUE: TStringField
      FieldName = 'NR_CHEQUE'
      Origin = 'TCAIXA.NR_CHEQUE'
      Size = 6
    end
    object qry_caixa_fatur_NR_ACERTO: TStringField
      FieldName = 'NR_ACERTO'
      Origin = 'TCAIXA.NR_ACERTO'
      Size = 3
    end
    object qry_caixa_fatur_CD_FAVORECIDO: TStringField
      FieldName = 'CD_FAVORECIDO'
      Origin = 'TCAIXA.CD_FAVORECIDO'
      Size = 5
    end
    object qry_caixa_fatur_NR_PROCESSO: TStringField
      DisplayLabel = 'Processo'
      FieldName = 'NR_PROCESSO'
      Origin = 'TCAIXA.NR_PROCESSO'
      Size = 18
    end
    object qry_caixa_fatur_CD_ITEM: TStringField
      FieldName = 'CD_ITEM'
      Origin = 'TCAIXA.CD_ITEM'
      Size = 3
    end
    object qry_caixa_fatur_VL_IR: TFloatField
      FieldName = 'VL_IR'
      Origin = 'TCAIXA.VL_IR'
      DisplayFormat = '#0,.00'
      EditFormat = '#0.00'
    end
    object qry_caixa_fatur_VL_ASSIST: TFloatField
      FieldName = 'VL_ASSIST'
      Origin = 'TCAIXA.VL_ASSIST'
      DisplayFormat = '#0,.00'
      EditFormat = '#0.00'
    end
    object qry_caixa_fatur_CD_DESPACHANTE: TStringField
      FieldName = 'CD_DESPACHANTE'
      Origin = 'TCAIXA.CD_DESPACHANTE'
      Size = 3
    end
    object qry_caixa_fatur_IN_RESTITUI: TStringField
      FieldName = 'IN_RESTITUI'
      Origin = 'TCAIXA.CD_COLIGADA'
      Size = 1
    end
    object qry_caixa_fatur_LookUnidNegFatur: TStringField
      FieldKind = fkLookup
      FieldName = 'LookUnidNegFatur'
      LookupDataSet = qry_unid_neg_
      LookupKeyFields = 'CD_UNID_NEG'
      LookupResultField = 'NM_UNID_NEG'
      KeyFields = 'CD_UNID_NEG'
      Size = 50
      Lookup = True
    end
    object qry_caixa_fatur_LookBancoFatur: TStringField
      FieldKind = fkLookup
      FieldName = 'LookBancoFatur'
      LookupDataSet = qry_banco_
      LookupKeyFields = 'CD_BANCO'
      LookupResultField = 'NM_BANCO'
      KeyFields = 'CD_BANCO'
      Size = 40
      Lookup = True
    end
    object qry_caixa_fatur_LookCanceladoFatur: TStringField
      DisplayLabel = 'Cancelado'
      FieldKind = fkLookup
      FieldName = 'LookCanceladoFatur'
      LookupDataSet = tbl_yesno_
      LookupKeyFields = 'CD_YESNO'
      LookupResultField = 'TX_YESNO'
      KeyFields = 'IN_CANCELADO'
      Size = 3
      Lookup = True
    end
    object qry_caixa_fatur_LookTpNatFatur: TStringField
      DisplayLabel = 'Natureza'
      FieldKind = fkLookup
      FieldName = 'LookTpNatFatur'
      LookupDataSet = tbl_tp_nat_
      LookupKeyFields = 'CD_NATUREZA'
      LookupResultField = 'NM_NATUREZA'
      KeyFields = 'TP_NATUREZA'
      Size = 10
      Lookup = True
    end
    object qry_caixa_fatur_LookFavorecido: TStringField
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
    object qry_caixa_fatur_LookItem: TStringField
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
    object qry_caixa_fatur_LookDesp: TStringField
      DisplayLabel = 'Despachante'
      FieldKind = fkLookup
      FieldName = 'LookDesp'
      LookupDataSet = qry_desp_
      LookupKeyFields = 'CD_DESPACHANTE'
      LookupResultField = 'NM_DESPACHANTE'
      KeyFields = 'CD_DESPACHANTE'
      Size = 50
      Lookup = True
    end
    object qry_caixa_fatur_CalcNrProcesso: TStringField
      DisplayLabel = 'N'#186' Processo'
      DisplayWidth = 14
      FieldKind = fkCalculated
      FieldName = 'CalcNrProcesso'
      Size = 14
      Calculated = True
    end
    object qry_caixa_fatur_LookTpItem: TStringField
      FieldKind = fkLookup
      FieldName = 'LookTpItem'
      LookupDataSet = qry_item_
      LookupKeyFields = 'CD_ITEM'
      LookupResultField = 'CD_TIPO_ITEM'
      KeyFields = 'CD_ITEM'
      Size = 1
      Lookup = True
    end
    object qry_caixa_fatur_LookControlaIR: TBooleanField
      FieldKind = fkLookup
      FieldName = 'LookControlaIR'
      LookupDataSet = qry_favorecido_
      LookupKeyFields = 'CD_FAVORECIDO'
      LookupResultField = 'IN_CONTROLA_IR'
      KeyFields = 'CD_FAVORECIDO'
      Lookup = True
    end
    object qry_caixa_fatur_look_cd_tipo_item: TStringField
      FieldKind = fkLookup
      FieldName = 'look_cd_tipo_item'
      LookupDataSet = qry_item_
      LookupKeyFields = 'CD_ITEM'
      LookupResultField = 'CD_TIPO_ITEM'
      KeyFields = 'CD_ITEM'
      Size = 1
      Lookup = True
    end
    object qry_caixa_fatur_calc_nm_item: TStringField
      DisplayLabel = 'Item'
      FieldKind = fkCalculated
      FieldName = 'calc_nm_item'
      Size = 36
      Calculated = True
    end
    object qry_caixa_fatur_CD_CT_CONTABIL: TStringField
      FieldName = 'CD_CT_CONTABIL'
      Origin = 'DBBROKER.TCAIXA.CD_CT_CONTABIL'
      FixedChar = True
      Size = 12
    end
    object qry_caixa_fatur_LookContabil: TStringField
      FieldKind = fkLookup
      FieldName = 'LookContabil'
      LookupDataSet = qry_ct_contabil_
      LookupKeyFields = 'CD_CT_CONTABIL'
      LookupResultField = 'NM_CT_CONTABIL'
      KeyFields = 'CD_CT_CONTABIL'
      Size = 40
      Lookup = True
    end
    object qry_caixa_fatur_CD_CT_CUSTO: TStringField
      FieldName = 'CD_CT_CUSTO'
      Origin = 'DBBROKER.TCAIXA.CD_CT_CUSTO'
      FixedChar = True
      Size = 4
    end
    object qry_caixa_fatur_LookCtCustoFat: TStringField
      DisplayWidth = 30
      FieldKind = fkLookup
      FieldName = 'LookCtCustoFat'
      LookupDataSet = qry_ct_custo_
      LookupKeyFields = 'CD_CT_CUSTO'
      LookupResultField = 'NM_CT_CUSTO'
      KeyFields = 'CD_CT_CUSTO'
      Size = 30
      Lookup = True
    end
    object qry_caixa_fatur_IN_CONCILIACAO: TStringField
      FieldName = 'IN_CONCILIACAO'
      Origin = 'DBBROKER.TCAIXA.IN_CONCILIACAO'
      FixedChar = True
      Size = 1
    end
    object qry_caixa_fatur_DT_CONCILIACAO: TDateTimeField
      FieldName = 'DT_CONCILIACAO'
      Origin = 'DBBROKER.TCAIXA.DT_CONCILIACAO'
    end
    object qry_caixa_fatur_CD_USUARIO_CONCILIACAO: TStringField
      FieldName = 'CD_USUARIO_CONCILIACAO'
      Origin = 'DBBROKER.TCAIXA.CD_USUARIO_CONCILIACAO'
      FixedChar = True
      Size = 4
    end
    object qry_caixa_fatur_IN_CONCILIACAO_AUTOM: TStringField
      FieldName = 'IN_CONCILIACAO_AUTOM'
      Origin = 'DBBROKER.TCAIXA.IN_CONCILIACAO_AUTOM'
      FixedChar = True
      Size = 1
    end
    object qry_caixa_fatur_NR_SEQ_CONCILIACAO: TIntegerField
      FieldName = 'NR_SEQ_CONCILIACAO'
      Origin = 'DBBROKER.TCAIXA.NR_SEQ_CONCILIACAO'
    end
    object qry_caixa_fatur_CD_RATEIO: TStringField
      FieldName = 'CD_RATEIO'
      Origin = 'DBBROKER.TCAIXA.CD_RATEIO'
      FixedChar = True
      Size = 4
    end
    object qry_caixa_fatur_CODIGO_CTAAPAGAR_LANC: TIntegerField
      FieldName = 'CODIGO_CTAAPAGAR_LANC'
      Origin = 'DBBROKER.TCAIXA.CODIGO_CTAAPAGAR_LANC'
    end
  end
  object ds_caixa_contabil_distr: TDataSource
    DataSet = qry_caixa_contabil_distr_
    Left = 202
    Top = 376
  end
  object qry_caixa_contabil_distr_: TQuery
    AfterScroll = qry_caixa_contabil_distr_AfterScroll
    DatabaseName = 'DBBROKER'
    DataSource = ds_caixa_contabil
    RequestLive = True
    SQL.Strings = (
      'SELECT *'
      'FROM TCAIXA_CONTABIL_DISTR (NOLOCK)'
      'WHERE NR_LANCAMENTO = :NR_LANCAMENTO AND'
      'DT_MOVIMENTO = :DT_MOVIMENTO AND'
      'CD_COLIGADA = :CD_COLIGADA')
    Left = 202
    Top = 328
    ParamData = <
      item
        DataType = ftString
        Name = 'NR_LANCAMENTO'
        ParamType = ptUnknown
        Size = 7
      end
      item
        DataType = ftDateTime
        Name = 'DT_MOVIMENTO'
        ParamType = ptUnknown
        Size = 8
      end
      item
        DataType = ftString
        Name = 'CD_COLIGADA'
        ParamType = ptUnknown
        Size = 3
      end>
    object qry_caixa_contabil_distr_CD_COLIGADA: TStringField
      FieldName = 'CD_COLIGADA'
      Origin = 'TCAIXA_CONTABIL_DISTR.CD_COLIGADA'
      Size = 2
    end
    object qry_caixa_contabil_distr_DT_MOVIMENTO: TDateTimeField
      FieldName = 'DT_MOVIMENTO'
      Origin = 'TCAIXA_CONTABIL_DISTR.DT_MOVIMENTO'
    end
    object qry_caixa_contabil_distr_NR_LANCAMENTO: TStringField
      DisplayWidth = 6
      FieldName = 'NR_LANCAMENTO'
      Origin = 'TCAIXA_CONTABIL_DISTR.NR_LANCAMENTO'
      Size = 6
    end
    object qry_caixa_contabil_distr_CD_CT_GERENCIAL: TStringField
      FieldName = 'CD_CT_GERENCIAL'
      Origin = 'TCAIXA_CONTABIL_DISTR.CD_CT_GERENCIAL'
      Size = 4
    end
    object qry_caixa_contabil_distr_VL_DISTRIBUICAO: TFloatField
      DisplayLabel = 'Valor'
      FieldName = 'VL_DISTRIBUICAO'
      Origin = 'TCAIXA_CONTABIL_DISTR.VL_DISTRIBUICAO'
      DisplayFormat = '#0,.00'
      EditFormat = '#0.00'
    end
    object qry_caixa_contabil_distr_LookCtDistrGerencial: TStringField
      DisplayLabel = 'Distr. Gerencial'
      FieldKind = fkLookup
      FieldName = 'LookCtDistrGerencial'
      LookupDataSet = qry_ct_distr_gerencial_
      LookupKeyFields = 'CD_CT_GERENCIAL'
      LookupResultField = 'NM_CT_GERENCIAL'
      KeyFields = 'CD_CT_GERENCIAL'
      Lookup = True
    end
    object qry_caixa_contabil_distr_CD_UNID_NEG: TStringField
      FieldName = 'CD_UNID_NEG'
      Origin = 'DBBROKER.TCAIXA_CONTABIL_DISTR.CD_UNID_NEG'
      FixedChar = True
      Size = 2
    end
  end
  object ds_contabil_distr: TDataSource
    DataSet = qry_contabil_distr_
    Left = 316
    Top = 168
  end
  object qry_contabil_distr_: TQuery
    DatabaseName = 'DBBROKER'
    DataSource = ds_coligada
    SQL.Strings = (
      'SELECT *'
      'FROM TCONTABIL_DISTRIBUICAO (NOLOCK)'
      'WHERE CD_COLIGADA = :CD_COLIGADA')
    Left = 316
    Top = 116
    ParamData = <
      item
        DataType = ftString
        Name = 'CD_COLIGADA'
        ParamType = ptUnknown
      end>
    object qry_contabil_distr_CD_COLIGADA: TStringField
      FieldName = 'CD_COLIGADA'
      Origin = 'TCONTABIL_DISTRIBUICAO.CD_COLIGADA'
      Size = 2
    end
    object qry_contabil_distr_CD_CT_CONTABIL: TStringField
      FieldName = 'CD_CT_CONTABIL'
      Origin = 'TCONTABIL_DISTRIBUICAO.CD_CT_CONTABIL'
      Size = 8
    end
    object qry_contabil_distr_CD_CT_GERENCIAL: TStringField
      FieldName = 'CD_CT_GERENCIAL'
      Origin = 'TCONTABIL_DISTRIBUICAO.CD_CT_GERENCIAL'
      Size = 4
    end
    object qry_contabil_distr_PC_TAXA: TFloatField
      FieldName = 'PC_TAXA'
      Origin = 'TCONTABIL_DISTRIBUICAO.PC_TAXA'
    end
  end
  object ds_conta_acerto: TDataSource
    DataSet = qry_conta_acerto_
    Left = 436
    Top = 168
  end
  object qry_conta_acerto_: TQuery
    DatabaseName = 'DBBROKER'
    DataSource = ds_coligada
    SQL.Strings = (
      'SELECT *'
      'FROM TCONTA_CAIXA (NOLOCK)'
      'WHERE TP_CONTA = "3" AND CD_COLIGADA = :CD_COLIGADA')
    Left = 436
    Top = 116
    ParamData = <
      item
        DataType = ftString
        Name = 'CD_COLIGADA'
        ParamType = ptUnknown
      end>
    object qry_conta_acerto_CD_COLIGADA: TStringField
      FieldName = 'CD_COLIGADA'
      Origin = 'TCONTA_CAIXA.CD_COLIGADA'
      Size = 2
    end
    object qry_conta_acerto_CD_CONTA: TStringField
      FieldName = 'CD_CONTA'
      Origin = 'TCONTA_CAIXA.CD_CONTA'
      Size = 3
    end
    object qry_conta_acerto_NM_CONTA: TStringField
      FieldName = 'NM_CONTA'
      Origin = 'TCONTA_CAIXA.NM_CONTA'
    end
    object qry_conta_acerto_TP_CONTA: TStringField
      FieldName = 'TP_CONTA'
      Origin = 'TCONTA_CAIXA.TP_CONTA'
      Size = 1
    end
    object qry_conta_acerto_CD_BANCO: TStringField
      FieldName = 'CD_BANCO'
      Origin = 'TCONTA_CAIXA.CD_BANCO'
      Size = 3
    end
    object qry_conta_acerto_CT_CONTABIL: TStringField
      FieldName = 'CT_CONTABIL'
      Origin = 'TCONTA_CAIXA.CT_CONTABIL'
      Size = 8
    end
    object qry_conta_acerto_IN_ATIVO: TStringField
      FieldName = 'IN_ATIVO'
      Origin = 'TCONTA_CAIXA.IN_ATIVO'
      Size = 1
    end
  end
  object ds_caixa_controle: TDataSource
    DataSet = qry_caixa_controle_
    Left = 668
    Top = 376
  end
  object qry_caixa_controle_: TQuery
    DatabaseName = 'DBBROKER'
    RequestLive = True
    SQL.Strings = (
      'SELECT *'
      'FROM   TCAIXA_CONTROLE'
      'WHERE  CD_COLIGADA = :CD_COLIGADA AND'
      '       CD_UNID_NEG = :CD_UNID_NEG AND'
      '       DT_MOVIMENTO >= :DT_MOVIMENTO')
    Left = 668
    Top = 325
    ParamData = <
      item
        DataType = ftString
        Name = 'CD_COLIGADA'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'CD_UNID_NEG'
        ParamType = ptUnknown
      end
      item
        DataType = ftDate
        Name = 'DT_MOVIMENTO'
        ParamType = ptUnknown
      end>
    object qry_caixa_controle_CD_COLIGADA: TStringField
      FieldName = 'CD_COLIGADA'
      Origin = 'TCAIXA_CONTROLE.CD_COLIGADA'
      Size = 2
    end
    object qry_caixa_controle_DT_MOVIMENTO: TDateTimeField
      FieldName = 'DT_MOVIMENTO'
      Origin = 'TCAIXA_CONTROLE.DT_MOVIMENTO'
    end
    object qry_caixa_controle_CD_USUARIO: TStringField
      FieldName = 'CD_USUARIO'
      Origin = 'TCAIXA_CONTROLE.CD_USUARIO'
      Size = 4
    end
  end
  object ds_acerto: TDataSource
    DataSet = qry_acerto_
    Left = 436
    Top = 376
  end
  object ds_caixa_saldos: TDataSource
    DataSet = qry_caixa_saldos_
    Left = 779
    Top = 330
  end
  object qry_caixa_saldos_: TQuery
    OnCalcFields = qry_caixa_saldos_CalcFields
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT S.*'
      'FROM   TCAIXA_SALDOS S, TCONTA_CAIXA C'
      'WHERE  S.CD_COLIGADA = :CD_COLIGADA AND'
      '       S.CD_UNID_NEG = :CD_UNID_NEG AND'
      '       S.DT_MOVIMENTO = :DT_MOVIMENTO AND'
      '       S.CD_UNID_NEG = C.CD_UNID_NEG AND'
      '       S.CD_CT_CAIXA = C.CD_CONTA')
    Left = 779
    Top = 277
    ParamData = <
      item
        DataType = ftString
        Name = 'CD_COLIGADA'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'CD_UNID_NEG'
        ParamType = ptUnknown
      end
      item
        DataType = ftDate
        Name = 'DT_MOVIMENTO'
        ParamType = ptUnknown
      end>
    object qry_caixa_saldos_CD_COLIGADA: TStringField
      FieldName = 'CD_COLIGADA'
      Origin = 'TCAIXA_SALDOS.CD_COLIGADA'
      Size = 2
    end
    object qry_caixa_saldos_DT_MOVIMENTO: TDateTimeField
      FieldName = 'DT_MOVIMENTO'
      Origin = 'TCAIXA_SALDOS.DT_MOVIMENTO'
    end
    object qry_caixa_saldos_CD_CT_CAIXA: TStringField
      DisplayLabel = 'C'#243'd.'
      FieldName = 'CD_CT_CAIXA'
      Origin = 'TCAIXA_SALDOS.CD_CT_CAIXA'
      Size = 3
    end
    object qry_caixa_saldos_VL_SALDO_ANT: TFloatField
      DisplayLabel = 'Saldo Ant.'
      FieldName = 'VL_SALDO_ANT'
      Origin = 'TCAIXA_SALDOS.VL_SALDO_ANT'
      DisplayFormat = '#0,.00'
      EditFormat = '#0.00'
    end
    object qry_caixa_saldos_VL_TOT_CRE: TFloatField
      DisplayLabel = 'Total Cr'#233'dito'
      FieldName = 'VL_TOT_CRE'
      Origin = 'TCAIXA_SALDOS.VL_TOT_CRE'
      DisplayFormat = '#0,.00'
      EditFormat = '#0.00'
    end
    object qry_caixa_saldos_VL_TOT_DEB: TFloatField
      DisplayLabel = 'Total D'#233'bito'
      FieldName = 'VL_TOT_DEB'
      Origin = 'TCAIXA_SALDOS.VL_TOT_DEB'
      DisplayFormat = '#0,.00'
      EditFormat = '#0.00'
    end
    object qry_caixa_saldos_LookCtCaixa: TStringField
      DisplayLabel = 'Conta Caixa'
      FieldKind = fkLookup
      FieldName = 'LookCtCaixa'
      LookupDataSet = qry_conta_caixa_
      LookupKeyFields = 'CD_CONTA'
      LookupResultField = 'NM_CONTA'
      KeyFields = 'CD_CT_CAIXA'
      Lookup = True
    end
    object qry_caixa_saldos_CalcSaldoTotal: TFloatField
      DisplayLabel = 'Saldo Total'
      FieldKind = fkCalculated
      FieldName = 'CalcSaldoTotal'
      DisplayFormat = '#0,.00'
      EditFormat = '#0.00'
      Calculated = True
    end
  end
  object ds_tp_forma_pagto: TDataSource
    DataSet = tbl_tp_forma_pagto_
    Left = 668
    Top = 168
  end
  object tbl_tp_forma_pagto_: TTable
    DatabaseName = 'DBBROKER'
    IndexFieldNames = 'CD_FORMA_PAGTO'
    TableName = 'TTP_FORMA_PAGTO'
    Left = 668
    Top = 116
  end
  object ds_tp_nat: TDataSource
    DataSet = tbl_tp_nat_
    Left = 779
    Top = 168
  end
  object tbl_tp_nat_: TTable
    DatabaseName = 'DBBROKER'
    IndexFieldNames = 'CD_NATUREZA'
    TableName = 'TTP_NATUREZA'
    Left = 779
    Top = 116
  end
  object ds_produto: TDataSource
    DataSet = qry_produto_
    Left = 202
    Top = 168
  end
  object qry_produto_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT CD_PRODUTO, NM_PRODUTO'
      'FROM TPRODUTO (NOLOCK)'
      'WHERE CD_PRODUTO <> '#39#39)
    Left = 202
    Top = 116
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
  object qry_proc_co_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT NR_PROCESSO, CD_UNID_NEG, CD_PRODUTO, CD_CLIENTE'
      'FROM TPROCESSO'
      'WHERE  NR_PROCESSO = :NR_PROCESSO AND'
      '                IN_LIBERADO = '#39'1'#39)
    Left = 873
    Top = 168
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
  end
  object sp_atz_distr_gerencial: TStoredProc
    DatabaseName = 'DBBROKER'
    StoredProcName = 'dbo.sp_atz_distr_gerencial'
    Left = 40
    Top = 223
    ParamData = <
      item
        DataType = ftInteger
        Name = 'Result'
        ParamType = ptResult
        Value = 0
      end
      item
        DataType = ftString
        Name = '@cd_coligada'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = '@cd_unid_neg'
        ParamType = ptInput
      end
      item
        DataType = ftDateTime
        Name = '@dt_movimento'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = '@nr_lancamento'
        ParamType = ptInput
      end>
  end
  object qry_tot_distr_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT SUM(VL_DISTRIBUICAO) AS TOT_DISTR'
      'FROM   TCAIXA_CONTABIL_DISTR'
      'WHERE  CD_COLIGADA = :CD_COLIGADA AND'
      '       CD_UNID_NEG = :CD_UNID_NEG AND'
      '       DT_MOVIMENTO = :DT_MOVIMENTO AND'
      '       NR_LANCAMENTO = :NR_LANCAMENTO')
    Left = 873
    Top = 223
    ParamData = <
      item
        DataType = ftString
        Name = 'CD_COLIGADA'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'CD_UNID_NEG'
        ParamType = ptUnknown
      end
      item
        DataType = ftDate
        Name = 'DT_MOVIMENTO'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'NR_LANCAMENTO'
        ParamType = ptUnknown
      end>
    object qry_tot_distr_TOT_DISTR: TFloatField
      FieldName = 'TOT_DISTR'
      Origin = 'TCAIXA_CONTABIL_DISTR.VL_DISTRIBUICAO'
    end
  end
  object qry_acerto_: TQuery
    DatabaseName = 'DBBROKER'
    DataSource = ds_caixa_acerto
    RequestLive = True
    SQL.Strings = (
      'SELECT * FROM TACERTO (NOLOCK)'
      'WHERE IN_BAIXADO = '#39'0'#39' AND'
      'CD_CT_ACERTO = :CD_CT_ACERTO AND'
      'CD_COLIGADA = :CD_COLIGADA')
    Left = 436
    Top = 325
    ParamData = <
      item
        DataType = ftString
        Name = 'CD_CT_ACERTO'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'CD_COLIGADA'
        ParamType = ptUnknown
      end>
    object qry_acerto_CD_COLIGADA: TStringField
      FieldName = 'CD_COLIGADA'
      Origin = 'TACERTO.CD_COLIGADA'
      Size = 2
    end
    object qry_acerto_CD_CT_ACERTO: TStringField
      FieldName = 'CD_CT_ACERTO'
      Origin = 'TACERTO.CD_CT_ACERTO'
      Size = 3
    end
    object qry_acerto_DT_ACERTO: TDateTimeField
      DisplayLabel = 'Data'
      FieldName = 'DT_ACERTO'
      Origin = 'TACERTO.DT_ACERTO'
    end
    object qry_acerto_NR_ACERTO: TStringField
      FieldName = 'NR_ACERTO'
      Origin = 'TACERTO.NR_ACERTO'
      Size = 3
    end
    object qry_acerto_VL_ACERTO: TFloatField
      DisplayLabel = 'Valor'
      FieldName = 'VL_ACERTO'
      Origin = 'TACERTO.VL_ACERTO'
      DisplayFormat = '#0,.00'
      EditFormat = '#0.00'
    end
    object qry_acerto_TP_NATUREZA: TStringField
      FieldName = 'TP_NATUREZA'
      Origin = 'TACERTO.TP_NATUREZA'
      Size = 1
    end
    object qry_acerto_IN_BAIXADO: TStringField
      FieldName = 'IN_BAIXADO'
      Origin = 'TACERTO.IN_BAIXADO'
      Size = 1
    end
    object qry_acerto_LookTpNatAcertoPend: TStringField
      DisplayLabel = 'Natureza'
      FieldKind = fkLookup
      FieldName = 'LookTpNatAcertoPend'
      LookupDataSet = tbl_tp_nat_
      LookupKeyFields = 'CD_NATUREZA'
      LookupResultField = 'NM_NATUREZA'
      KeyFields = 'TP_NATUREZA'
      Size = 10
      Lookup = True
    end
    object qry_acerto_NM_ACERTO: TStringField
      DisplayLabel = 'Hist'#243'rico'
      FieldName = 'NM_ACERTO'
      Origin = 'TACERTO.CD_CT_ACERTO'
      Size = 180
    end
  end
  object ds_coligada: TDataSource
    DataSet = qry_coligada_
    Left = 436
    Top = 483
  end
  object qry_coligada_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT *'
      'FROM TCOLIGADA (NOLOCK)'
      'WHERE CD_COLIGADA <> '#39#39)
    Left = 436
    Top = 429
    object qry_coligada_CD_COLIGADA: TStringField
      FieldName = 'CD_COLIGADA'
      Origin = 'TCOLIGADA.CD_COLIGADA'
      Size = 2
    end
    object qry_coligada_NM_COLIGADA: TStringField
      FieldName = 'NM_COLIGADA'
      Origin = 'TCOLIGADA.NM_COLIGADA'
    end
    object qry_coligada_IN_FATURAMENTO: TStringField
      FieldName = 'IN_FATURAMENTO'
      Origin = 'TCOLIGADA.CD_COLIGADA'
      Size = 1
    end
  end
  object ds_conta_caixa: TDataSource
    DataSet = qry_conta_caixa_
    Left = 539
    Top = 483
  end
  object qry_conta_caixa_: TQuery
    DatabaseName = 'DBBROKER'
    DataSource = ds_coligada
    SQL.Strings = (
      'SELECT *'
      'FROM TCONTA_CAIXA (NOLOCK)'
      'WHERE CD_COLIGADA = :CD_COLIGADA')
    Left = 539
    Top = 429
    ParamData = <
      item
        DataType = ftString
        Name = 'CD_COLIGADA'
        ParamType = ptUnknown
        Size = 3
      end>
    object StringField1: TStringField
      FieldName = 'CD_COLIGADA'
      Origin = 'TCONTA_CAIXA.CD_COLIGADA'
      Size = 2
    end
    object StringField2: TStringField
      FieldName = 'CD_CONTA'
      Origin = 'TCONTA_CAIXA.CD_CONTA'
      Size = 3
    end
    object StringField3: TStringField
      FieldName = 'NM_CONTA'
      Origin = 'TCONTA_CAIXA.NM_CONTA'
    end
    object StringField4: TStringField
      FieldName = 'TP_CONTA'
      Origin = 'TCONTA_CAIXA.TP_CONTA'
      Size = 1
    end
    object StringField5: TStringField
      FieldName = 'CD_BANCO'
      Origin = 'TCONTA_CAIXA.CD_BANCO'
      Size = 3
    end
    object StringField6: TStringField
      FieldName = 'CT_CONTABIL'
      Origin = 'TCONTA_CAIXA.CT_CONTABIL'
      Size = 8
    end
    object StringField7: TStringField
      FieldName = 'IN_ATIVO'
      Origin = 'TCONTA_CAIXA.IN_ATIVO'
      Size = 1
    end
    object qry_conta_caixa_CD_ACESSO: TStringField
      FieldName = 'CD_ACESSO'
      Origin = 'TCONTA_CAIXA.NM_CONTA'
      Size = 1
    end
    object qry_conta_caixa_CD_AUX: TStringField
      FieldName = 'CD_AUX'
      Origin = 'TCONTA_CAIXA.NM_CONTA'
      Size = 3
    end
    object qry_conta_caixa_CD_CT_CONTABIL: TStringField
      FieldName = 'CD_CT_CONTABIL'
      Origin = 'DBBROKER.TCONTA_CAIXA.CD_CT_CONTABIL'
      FixedChar = True
      Size = 10
    end
  end
  object sp_atz_saldos_caixa: TStoredProc
    DatabaseName = 'DBBROKER'
    StoredProcName = 'dbo.sp_atz_saldos_caixa'
    Left = 40
    Top = 272
    ParamData = <
      item
        DataType = ftInteger
        Name = 'Result'
        ParamType = ptResult
        Value = 0
      end
      item
        DataType = ftString
        Name = '@cd_coligada'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = '@cd_unid_neg'
        ParamType = ptInput
      end
      item
        DataType = ftDateTime
        Name = '@dt_movimento'
        ParamType = ptInput
      end>
  end
  object qry_cheques_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT COUNT(NR_SOLIC_CH) AS NAO_EMITIDOS'
      'FROM TSOLIC_CHEQUE'
      'WHERE  DT_SOLIC_CH = :DT_SOLIC_CH AND'
      '( CD_STATUS_SOLIC_CH NOT IN ('#39'1'#39' , '#39'3'#39', '#39'4'#39') AND'
      'CD_STATUS_CHEQUE NOT IN ('#39'1'#39', '#39'2'#39')  ) AND'
      'IN_TRANSFERIDO = '#39'0'#39' AND'
      'CD_TIPO_LANC = '#39'1'#39)
    Left = 779
    Top = 223
    ParamData = <
      item
        DataType = ftString
        Name = 'DT_SOLIC_CH'
        ParamType = ptUnknown
      end>
    object qry_cheques_NAO_EMITIDOS: TIntegerField
      FieldName = 'NAO_EMITIDOS'
    end
  end
  object sp_imp_cheque: TStoredProc
    DatabaseName = 'DBBROKER'
    StoredProcName = 'dbo.sp_imp_cheque'
    Left = 202
    Top = 223
    ParamData = <
      item
        DataType = ftInteger
        Name = 'Result'
        ParamType = ptResult
      end
      item
        DataType = ftDateTime
        Name = '@dt_movimento'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = '@cd_unid_neg'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = '@cd_coligada'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = '@cd_usuario'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = '@qt_imp'
        ParamType = ptOutput
      end>
  end
  object qry_ct_tp_caixa_: TQuery
    DatabaseName = 'DBBROKER'
    DataSource = ds_coligada
    SQL.Strings = (
      'SELECT CT_CONTABIL'
      'FROM TCONTA_CAIXA (NOLOCK)'
      'WHERE CD_COLIGADA = :CD_COLIGADA AND'
      '                TP_CONTA = '#39'1'#39)
    Left = 873
    Top = 325
    ParamData = <
      item
        DataType = ftString
        Name = 'CD_COLIGADA'
        ParamType = ptUnknown
      end>
    object qry_ct_tp_caixa_CT_CONTABIL: TStringField
      FieldName = 'CT_CONTABIL'
      Origin = 'TCONTA_CAIXA.CT_CONTABIL'
      Size = 8
    end
  end
  object sp_imp_deb_cta: TStoredProc
    DatabaseName = 'DBBROKER'
    StoredProcName = 'dbo.sp_imp_deb_cta'
    Left = 202
    Top = 272
    ParamData = <
      item
        DataType = ftInteger
        Name = 'Result'
        ParamType = ptResult
      end
      item
        DataType = ftDateTime
        Name = '@dt_movimento'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = '@cd_unid_neg'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = '@cd_coligada'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = '@qt_imp'
        ParamType = ptOutput
      end>
  end
  object sp_imp_ch_branco: TStoredProc
    DatabaseName = 'DBBROKER'
    StoredProcName = 'dbo.sp_imp_ch_branco'
    Left = 316
    Top = 223
    ParamData = <
      item
        DataType = ftInteger
        Name = 'Result'
        ParamType = ptResult
      end
      item
        DataType = ftDateTime
        Name = '@dt_movimento'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = '@cd_coligada'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = '@qt_imp'
        ParamType = ptOutput
      end>
  end
  object sp_imp_numerario: TStoredProc
    DatabaseName = 'DBBROKER'
    StoredProcName = 'dbo.sp_imp_numerario'
    Left = 316
    Top = 272
    ParamData = <
      item
        DataType = ftInteger
        Name = 'Result'
        ParamType = ptResult
      end
      item
        DataType = ftDateTime
        Name = '@dt_movimento'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = '@cd_unid_neg'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = '@cd_coligada'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = '@qt_imp'
        ParamType = ptOutput
      end>
  end
  object sp_fecha_caixa: TStoredProc
    DatabaseName = 'DBBROKER'
    StoredProcName = 'dbo.sp_fecha_caixa'
    Left = 436
    Top = 223
    ParamData = <
      item
        DataType = ftInteger
        Name = 'Result'
        ParamType = ptResult
        Value = 0
      end
      item
        DataType = ftString
        Name = '@cd_coligada'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = '@cd_unid_neg'
        ParamType = ptInput
      end
      item
        DataType = ftDateTime
        Name = '@dt_movimento'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = '@cd_usuario'
        ParamType = ptInput
      end>
  end
  object qry_tipo_item_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT * FROM TTIPO_ITEM (NOLOCK)')
    Left = 873
    Top = 376
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
    object qry_tipo_item_IN_FINANCEIRO: TStringField
      FieldName = 'IN_FINANCEIRO'
      Origin = 'TTIPO_ITEM.CD_CONTABILIZACAO'
      Size = 1
    end
  end
  object sp_contabiliza: TStoredProc
    DatabaseName = 'DBBROKER'
    StoredProcName = 'dbo.sp_contabiliza'
    Left = 436
    Top = 272
    ParamData = <
      item
        DataType = ftInteger
        Name = 'Result'
        ParamType = ptResult
      end
      item
        DataType = ftString
        Name = '@cd_coligada'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = '@cd_unid_neg'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = '@cd_produto'
        ParamType = ptInput
      end
      item
        DataType = ftDateTime
        Name = '@dt_movimento'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = '@tp_contab'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = '@cd_usuario'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = '@nr_cont'
        ParamType = ptOutput
      end>
  end
  object qry_contab_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT *'
      'FROM TCONTABILIZACAO (NOLOCK)'
      'WHERE  CD_COLIGADA = :CD_COLIGADA AND'
      'NR_CONTAB = :NR_CONTAB')
    Left = 40
    Top = 429
    ParamData = <
      item
        DataType = ftString
        Name = 'CD_COLIGADA'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'NR_CONTAB'
        ParamType = ptUnknown
      end>
    object qry_contab_CD_COLIGADA: TStringField
      FieldName = 'CD_COLIGADA'
      Origin = 'TCONTABILIZACAO.CD_COLIGADA'
      Size = 2
    end
    object qry_contab_NR_CONTAB: TStringField
      FieldName = 'NR_CONTAB'
      Origin = 'TCONTABILIZACAO.NR_CONTAB'
      Size = 4
    end
    object qry_contab_DT_CONTAB: TDateTimeField
      FieldName = 'DT_CONTAB'
      Origin = 'TCONTABILIZACAO.DT_CONTAB'
    end
    object qry_contab_CD_USUARIO: TStringField
      FieldName = 'CD_USUARIO'
      Origin = 'TCONTABILIZACAO.CD_USUARIO'
      Size = 4
    end
    object qry_contab_TP_CONTAB: TStringField
      FieldName = 'TP_CONTAB'
      Origin = 'TCONTABILIZACAO.TP_CONTAB'
      Size = 1
    end
    object qry_contab_DT_MOVIMENTO: TDateTimeField
      FieldName = 'DT_MOVIMENTO'
      Origin = 'TCONTABILIZACAO.CD_COLIGADA'
    end
    object qry_contab_CD_UNID_NEG: TStringField
      FieldName = 'CD_UNID_NEG'
      Origin = 'TCONTABILIZACAO.CD_COLIGADA'
      Size = 2
    end
    object qry_contab_CD_PRODUTO: TStringField
      FieldName = 'CD_PRODUTO'
      Origin = 'TCONTABILIZACAO.NR_CONTAB'
      Size = 2
    end
  end
  object qry_contab_lanc_: TQuery
    DatabaseName = 'DBBROKER'
    DataSource = ds_contab
    SQL.Strings = (
      'SELECT *'
      'FROM TCONTABILIZACAO_LANC (NOLOCK)'
      'WHERE  CD_COLIGADA = :CD_COLIGADA AND'
      'NR_CONTAB = :NR_CONTAB')
    Left = 202
    Top = 429
    ParamData = <
      item
        DataType = ftString
        Name = 'CD_COLIGADA'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'NR_CONTAB'
        ParamType = ptUnknown
      end>
    object qry_contab_lanc_CD_COLIGADA: TStringField
      FieldName = 'CD_COLIGADA'
      Origin = 'TCONTABILIZACAO_LANC.CD_COLIGADA'
      Size = 2
    end
    object qry_contab_lanc_DT_MOVIMENTO: TDateTimeField
      FieldName = 'DT_MOVIMENTO'
      Origin = 'TCONTABILIZACAO_LANC.CD_COLIGADA'
    end
    object qry_contab_lanc_NR_CONTAB: TStringField
      FieldName = 'NR_CONTAB'
      Origin = 'TCONTABILIZACAO_LANC.NR_CONTAB'
      Size = 4
    end
    object qry_contab_lanc_NR_LANCAMENTO: TStringField
      DisplayWidth = 6
      FieldName = 'NR_LANCAMENTO'
      Origin = 'TCONTABILIZACAO_LANC.NR_LANCAMENTO'
      Size = 6
    end
    object qry_contab_lanc_CD_CT_DEVEDORA: TStringField
      FieldName = 'CD_CT_DEVEDORA'
      Origin = 'TCONTABILIZACAO_LANC.CD_CT_DEVEDORA'
      Size = 10
    end
    object qry_contab_lanc_CD_CT_CREDORA: TStringField
      FieldName = 'CD_CT_CREDORA'
      Origin = 'TCONTABILIZACAO_LANC.CD_CT_CREDORA'
      Size = 10
    end
    object qry_contab_lanc_VL_LANCAMENTO: TFloatField
      FieldName = 'VL_LANCAMENTO'
      Origin = 'TCONTABILIZACAO_LANC.VL_LANCAMENTO'
    end
    object qry_contab_lanc_CD_HISTORICO: TStringField
      FieldName = 'CD_HISTORICO'
      Origin = 'TCONTABILIZACAO_LANC.CD_HISTORICO'
      Size = 8
    end
    object qry_contab_lanc_NM_HISTORICO: TStringField
      FieldName = 'NM_HISTORICO'
      Origin = 'TCONTABILIZACAO_LANC.NM_HISTORICO'
      Size = 186
    end
    object qry_contab_lanc_CD_FILIAL: TStringField
      FieldName = 'CD_FILIAL'
      Origin = 'TCONTABILIZACAO_LANC.CD_FILIAL'
      Size = 3
    end
    object qry_contab_lanc_CD_CUSTO: TStringField
      FieldName = 'CD_CUSTO'
      Origin = 'TCONTABILIZACAO_LANC.CD_CUSTO'
      Size = 3
    end
  end
  object ds_contab: TDataSource
    DataSet = qry_contab_
    Left = 40
    Top = 483
  end
  object ds_contab_lanc: TDataSource
    DataSet = qry_contab_lanc_
    Left = 202
    Top = 483
  end
  object ds_contab_gerencial: TDataSource
    DataSet = qry_contab_gerencial_
    Left = 316
    Top = 483
  end
  object qry_contab_gerencial_: TQuery
    DatabaseName = 'DBBROKER'
    DataSource = ds_contab_lanc
    SQL.Strings = (
      'SELECT *'
      'FROM TCONTABILIZACAO_GERENCIAL (NOLOCK)'
      'WHERE  CD_COLIGADA = :CD_COLIGADA AND'
      'NR_CONTAB = :NR_CONTAB AND'
      'NR_LANCAMENTO = :NR_LANCAMENTO')
    Left = 316
    Top = 429
    ParamData = <
      item
        DataType = ftString
        Name = 'CD_COLIGADA'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'NR_CONTAB'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'NR_LANCAMENTO'
        ParamType = ptUnknown
      end>
    object qry_contab_gerencial_CD_COLIGADA: TStringField
      FieldName = 'CD_COLIGADA'
      Origin = 'TCONTABILIZACAO_GERENCIAL.CD_COLIGADA'
      Size = 2
    end
    object qry_contab_gerencial_NR_CONTAB: TStringField
      FieldName = 'NR_CONTAB'
      Origin = 'TCONTABILIZACAO_GERENCIAL.NR_CONTAB'
      Size = 4
    end
    object qry_contab_gerencial_NR_LANCAMENTO: TStringField
      DisplayWidth = 6
      FieldName = 'NR_LANCAMENTO'
      Origin = 'TCONTABILIZACAO_GERENCIAL.NR_LANCAMENTO'
      Size = 6
    end
    object qry_contab_gerencial_CT_GERENCIAL: TStringField
      FieldName = 'CT_GERENCIAL'
      Origin = 'TCONTABILIZACAO_GERENCIAL.CT_GERENCIAL'
      Size = 4
    end
    object qry_contab_gerencial_VL_GERENCIAL: TFloatField
      FieldName = 'VL_GERENCIAL'
      Origin = 'TCONTABILIZACAO_GERENCIAL.VL_GERENCIAL'
    end
  end
  object sp_imp_liquidacao: TStoredProc
    DatabaseName = 'DBBROKER'
    StoredProcName = 'dbo.sp_imp_liquidacao'
    Left = 539
    Top = 272
    ParamData = <
      item
        DataType = ftInteger
        Name = 'Result'
        ParamType = ptResult
      end
      item
        DataType = ftDateTime
        Name = '@dt_movimento'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = '@cd_unid_neg'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = '@cd_coligada'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = '@qt_imp'
        ParamType = ptOutput
      end>
  end
  object qry_reabrir_caixa_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT DISTINCT'
      '       ('
      '       SELECT COUNT(*) AS TOT_ABERTO'
      '       FROM   TCAIXA'
      '       WHERE  CD_COLIGADA = :CD_COLIGADA AND'
      '              CD_UNID_NEG = :CD_UNID_NEG AND'
      '              DT_MOVIMENTO >= :DT_MOVIMENTO AND'
      '              DT_MOVIMENTO NOT IN ( SELECT DT_MOVIMENTO'
      '                                    FROM   TCAIXA_CONTROLE'
      ' '#9#9'                    WHERE  CD_COLIGADA = :CD_COLIGADA AND'
      
        '                                           CD_UNID_NEG = :CD_UNI' +
        'D_NEG )'
      '       ) +'
      '       ('
      '       SELECT COUNT(*) AS TOT_FECHADO'
      '       FROM   TCAIXA_CONTROLE'
      '       WHERE  CD_COLIGADA = :CD_COLIGADA AND'
      '              CD_UNID_NEG = :CD_UNID_NEG AND'
      '              DT_MOVIMENTO > :DT_MOVIMENTO'
      '       ) AS TOTAL,'
      '       ( SELECT COUNT(*)'
      '         FROM   TCAIXA'
      '         WHERE  CD_COLIGADA = :CD_COLIGADA AND'
      '                CD_UNID_NEG = :CD_UNID_NEG AND'
      '                DT_MOVIMENTO >= :DT_MOVIMENTO AND'
      '                DT_MOVIMENTO NOT IN ( SELECT DT_MOVIMENTO'
      '                                      FROM   TCAIXA_CONTROLE'
      #9#9#9'              WHERE  CD_COLIGADA = :CD_COLIGADA AND'
      
        '                                             CD_UNID_NEG = :CD_U' +
        'NID_NEG ) ) AS TOT_ABERTO,'
      '       ( SELECT COUNT(*)'
      '         FROM   TCAIXA_CONTROLE'
      '         WHERE  CD_COLIGADA = :CD_COLIGADA AND'
      '                CD_UNID_NEG = :CD_UNID_NEG AND'
      '                DT_MOVIMENTO = :DT_MOVIMENTO ) AS TOT_FECHADO'
      'FROM  TCAIXA_CONTROLE'
      'WHERE CD_COLIGADA = :CD_COLIGADA AND'
      '      CD_UNID_NEG = :CD_UNID_NEG AND'
      '      DT_MOVIMENTO = :DT_MOVIMENTO')
    Left = 668
    Top = 429
    ParamData = <
      item
        DataType = ftString
        Name = 'CD_COLIGADA'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'CD_UNID_NEG'
        ParamType = ptUnknown
      end
      item
        DataType = ftDate
        Name = 'DT_MOVIMENTO'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'CD_COLIGADA'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'CD_UNID_NEG'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'CD_COLIGADA'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'CD_UNID_NEG'
        ParamType = ptUnknown
      end
      item
        DataType = ftDate
        Name = 'DT_MOVIMENTO'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'CD_COLIGADA'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'CD_UNID_NEG'
        ParamType = ptUnknown
      end
      item
        DataType = ftDate
        Name = 'DT_MOVIMENTO'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'CD_COLIGADA'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'CD_UNID_NEG'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'CD_COLIGADA'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'CD_UNID_NEG'
        ParamType = ptUnknown
      end
      item
        DataType = ftDate
        Name = 'DT_MOVIMENTO'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'CD_COLIGADA'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'CD_UNID_NEG'
        ParamType = ptUnknown
      end
      item
        DataType = ftDate
        Name = 'DT_MOVIMENTO'
        ParamType = ptUnknown
      end>
    object qry_reabrir_caixa_TOTAL: TIntegerField
      FieldName = 'TOTAL'
    end
    object qry_reabrir_caixa_TOT_ABERTO: TIntegerField
      FieldName = 'TOT_ABERTO'
    end
    object qry_reabrir_caixa_TOT_FECHADO: TIntegerField
      FieldName = 'TOT_FECHADO'
    end
  end
  object qry_acertos_baixados_: TQuery
    DatabaseName = 'DBBROKER'
    DataSource = ds_caixa_acerto
    RequestLive = True
    SQL.Strings = (
      'SELECT * FROM TACERTO (NOLOCK)'
      'WHERE CD_CT_ACERTO = :CD_CT_ACERTO AND'
      'CD_COLIGADA = :CD_COLIGADA AND'
      'NR_ACERTO = :NR_ACERTO')
    Left = 779
    Top = 381
    ParamData = <
      item
        DataType = ftString
        Name = 'CD_CT_ACERTO'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'CD_COLIGADA'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'NR_ACERTO'
        ParamType = ptUnknown
      end>
    object qry_acertos_baixados_CD_COLIGADA: TStringField
      FieldName = 'CD_COLIGADA'
      Origin = 'TACERTO.CD_COLIGADA'
      Size = 2
    end
    object qry_acertos_baixados_CD_CT_ACERTO: TStringField
      FieldName = 'CD_CT_ACERTO'
      Origin = 'TACERTO.CD_CT_ACERTO'
      Size = 3
    end
    object qry_acertos_baixados_NR_ACERTO: TStringField
      FieldName = 'NR_ACERTO'
      Origin = 'TACERTO.NR_ACERTO'
      Size = 3
    end
    object qry_acertos_baixados_DT_ACERTO: TDateTimeField
      FieldName = 'DT_ACERTO'
      Origin = 'TACERTO.DT_ACERTO'
    end
    object qry_acertos_baixados_NM_ACERTO: TStringField
      FieldName = 'NM_ACERTO'
      Origin = 'TACERTO.NM_ACERTO'
      Size = 180
    end
    object qry_acertos_baixados_VL_ACERTO: TFloatField
      FieldName = 'VL_ACERTO'
      Origin = 'TACERTO.VL_ACERTO'
    end
    object qry_acertos_baixados_TP_NATUREZA: TStringField
      FieldName = 'TP_NATUREZA'
      Origin = 'TACERTO.TP_NATUREZA'
      Size = 1
    end
    object qry_acertos_baixados_IN_BAIXADO: TStringField
      FieldName = 'IN_BAIXADO'
      Origin = 'TACERTO.IN_BAIXADO'
      Size = 1
    end
  end
  object sp_reabre_caixa: TStoredProc
    DatabaseName = 'DBBROKER'
    StoredProcName = 'dbo.sp_reabre_caixa'
    Left = 539
    Top = 223
    ParamData = <
      item
        DataType = ftInteger
        Name = 'Result'
        ParamType = ptResult
        Value = 0
      end
      item
        DataType = ftString
        Name = '@cd_coligada'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = '@cd_unid_neg'
        ParamType = ptInput
      end
      item
        DataType = ftDateTime
        Name = '@dt_movimento'
        ParamType = ptInput
      end>
  end
  object sp_imp_pag_autonomos: TStoredProc
    DatabaseName = 'DBBROKER'
    StoredProcName = 'dbo.sp_imp_pag_autonomos'
    Left = 668
    Top = 223
    ParamData = <
      item
        DataType = ftInteger
        Name = 'Result'
        ParamType = ptResult
      end
      item
        DataType = ftDateTime
        Name = '@dt_movimento'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = '@cd_unid_neg'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = '@cd_coligada'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = '@qt_imp'
        ParamType = ptOutput
      end>
  end
  object qry_debitos_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT COUNT(NR_SOLIC_CH) AS NAO_LIBERADOS'
      'FROM TSOLIC_CHEQUE'
      'WHERE  DT_SOLIC_CH = :DT_SOLIC_CH AND'
      'CD_STATUS_SOLIC_CH = '#39'2'#39' AND'
      'IN_TRANSFERIDO = '#39'0'#39' AND'
      'CD_TIPO_LANC = '#39'2'#39)
    Left = 873
    Top = 272
    ParamData = <
      item
        DataType = ftString
        Name = 'DT_SOLIC_CH'
        ParamType = ptUnknown
      end>
    object qry_debitos_NAO_LIBERADOS: TIntegerField
      FieldName = 'NAO_LIBERADOS'
      Origin = 'TSOLIC_CHEQUE.NR_SOLIC_CH'
    end
  end
  object qry_liquidacoes_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT COUNT(*) AS PENDENTES'
      'FROM TLIQUIDACAO L,'
      'TSOLIC_CHEQUE C'
      'WHERE  DT_LIQUIDACAO <= :DT_LIQUIDACAO AND'
      #9'L.NR_SOLIC_CH = L.NR_SOLIC_CH AND '
      #9'L.DT_SOLIC_CH = C.DT_SOLIC_CH AND'
      #9'L.CD_FORMA_PAGTO = '#39'C'#39' AND'
      '                ( ( L.IN_TRANSFERIDO = '#39'0'#39' AND '
      '                    L.IN_CANCELADO = '#39'0'#39' ) OR'
      '                  ( L.IN_TRANSF_CANC = '#39'0'#39' AND'
      '                    L.IN_CANCELADO = '#39'1'#39'   AND'
      '                    L.IN_TRANSFERIDO = '#39'1'#39' ) ) AND'
      #9'C.CD_STATUS_CHEQUE IN ('#39'0'#39','#39'3'#39')')
    Left = 668
    Top = 483
    ParamData = <
      item
        DataType = ftDateTime
        Name = 'DT_LIQUIDACAO'
        ParamType = ptUnknown
      end>
    object qry_liquidacoes_PENDENTES: TIntegerField
      FieldName = 'PENDENTES'
    end
  end
  object sp_imp_ctaapagar: TStoredProc
    DatabaseName = 'DBBROKER'
    StoredProcName = 'dbo.sp_imp_ctaapagar'
    Left = 668
    Top = 280
    ParamData = <
      item
        DataType = ftInteger
        Name = 'Result'
        ParamType = ptResult
      end
      item
        DataType = ftDateTime
        Name = '@dt_movimento'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = '@cd_unid_neg'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = '@cd_coligada'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = '@qt_imp'
        ParamType = ptOutput
      end>
  end
  object qry_param_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT CD_SISTEMA_CONTABIL'
      'FROM TPARAMETROS')
    Left = 40
    Top = 532
    object qry_param_CD_SISTEMA_CONTABIL: TStringField
      FieldName = 'CD_SISTEMA_CONTABIL'
      Origin = 'TPARAMETROS.CD_SISTEMA_CONTABIL'
      Size = 1
    end
  end
  object qry_ct_contabil_unica_: TQuery
    DatabaseName = 'DBBROKER'
    RequestLive = True
    SQL.Strings = (
      'SELECT CD_CT_CONTABIL, NM_CT_CONTABIL FROM TCT_CONTABIL'
      
        'WHERE  CD_ACESSO+CD_AUX = :CD_ACESSO_AUX AND CD_IDENTIFICADOR = ' +
        #39'A'#39
      'ORDER BY'
      'CD_CT_CONTABIL')
    Left = 40
    Top = 580
    ParamData = <
      item
        DataType = ftString
        Name = 'CD_ACESSO_AUX'
        ParamType = ptUnknown
      end>
    object qry_ct_contabil_unica_CD_CT_CONTABIL: TStringField
      FieldName = 'CD_CT_CONTABIL'
      Origin = 'DBBROKER.TCT_CONTABIL.CD_CT_CONTABIL'
      FixedChar = True
      Size = 12
    end
    object qry_ct_contabil_unica_NM_CT_CONTABIL: TStringField
      FieldName = 'NM_CT_CONTABIL'
      Origin = 'TCT_CONTABIL.NM_CT_CONTABIL'
      Size = 40
    end
  end
  object qry_ct_contabil_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      
        'SELECT CD_CT_CONTABIL, NM_CT_CONTABIL, CD_ACESSO, CD_AUX FROM TC' +
        'T_CONTABIL'
      'WHERE CD_IDENTIFICADOR = '#39'A'#39
      'ORDER BY'
      'CD_CT_CONTABIL')
    Left = 40
    Top = 635
    object qry_ct_contabil_CD_CT_CONTABIL: TStringField
      FieldName = 'CD_CT_CONTABIL'
      Origin = 'DBBROKER.TCT_CONTABIL.CD_CT_CONTABIL'
      FixedChar = True
      Size = 12
    end
    object qry_ct_contabil_NM_CT_CONTABIL: TStringField
      FieldName = 'NM_CT_CONTABIL'
      Origin = 'TCT_CONTABIL.NM_CT_CONTABIL'
      Size = 40
    end
    object qry_ct_contabil_CD_ACESSO: TStringField
      FieldName = 'CD_ACESSO'
      Origin = 'TCT_CONTABIL.CD_ACESSO'
      Size = 1
    end
    object qry_ct_contabil_CD_AUX: TStringField
      FieldName = 'CD_AUX'
      Origin = 'TCT_CONTABIL.CD_AUX'
      Size = 3
    end
  end
  object ds_hist_padrao: TDataSource
    DataSet = qry_hist_padrao_
    Left = 139
    Top = 607
  end
  object qry_hist_padrao_: TQuery
    DatabaseName = 'DBBROKER'
    DataSource = ds_coligada
    SQL.Strings = (
      'SELECT *'
      'FROM THIST_PADRAO')
    Left = 139
    Top = 547
    object qry_hist_padrao_CD_HISTORICO: TStringField
      FieldName = 'CD_HISTORICO'
      Origin = 'THIST_PADRAO.CD_HISTORICO'
      Size = 3
    end
    object qry_hist_padrao_NM_HISTORICO: TStringField
      FieldName = 'NM_HISTORICO'
      Origin = 'THIST_PADRAO.NM_HISTORICO'
      Size = 50
    end
  end
  object sp_contabiliza_contmaster: TStoredProc
    DatabaseName = 'DBBROKER'
    StoredProcName = 'dbo.sp_contabiliza_contmaster'
    Left = 779
    Top = 487
    ParamData = <
      item
        DataType = ftInteger
        Name = 'Result'
        ParamType = ptResult
      end
      item
        DataType = ftString
        Name = '@cd_unid_neg'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = '@cd_produto'
        ParamType = ptInput
      end
      item
        DataType = ftDateTime
        Name = '@dt_movimento'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = '@tp_contab'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = '@cd_usuario'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = '@nr_cont'
        ParamType = ptOutput
      end>
  end
  object qry_contab_contmaster_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT *'
      'FROM TCONTABILIZACAO_CONTMASTER'
      'WHERE NR_CONTAB = :NR_CONTAB')
    Left = 244
    Top = 547
    ParamData = <
      item
        DataType = ftString
        Name = 'NR_CONTAB'
        ParamType = ptUnknown
      end>
    object qry_contab_contmaster_NR_CONTAB: TStringField
      FieldName = 'NR_CONTAB'
      Origin = 'TCONTABILIZACAO_CONTMASTER.NR_CONTAB'
      Size = 4
    end
    object qry_contab_contmaster_DT_CONTAB: TDateTimeField
      FieldName = 'DT_CONTAB'
      Origin = 'TCONTABILIZACAO_CONTMASTER.DT_CONTAB'
    end
    object qry_contab_contmaster_CD_USUARIO: TStringField
      FieldName = 'CD_USUARIO'
      Origin = 'TCONTABILIZACAO_CONTMASTER.CD_USUARIO'
      Size = 4
    end
    object qry_contab_contmaster_TP_CONTAB: TStringField
      FieldName = 'TP_CONTAB'
      Origin = 'TCONTABILIZACAO_CONTMASTER.TP_CONTAB'
      Size = 1
    end
    object qry_contab_contmaster_DT_MOVIMENTO: TDateTimeField
      FieldName = 'DT_MOVIMENTO'
      Origin = 'TCONTABILIZACAO_CONTMASTER.DT_MOVIMENTO'
    end
    object qry_contab_contmaster_CD_UNID_NEG: TStringField
      FieldName = 'CD_UNID_NEG'
      Origin = 'TCONTABILIZACAO_CONTMASTER.CD_UNID_NEG'
      Size = 2
    end
    object qry_contab_contmaster_CD_PRODUTO: TStringField
      FieldName = 'CD_PRODUTO'
      Origin = 'TCONTABILIZACAO_CONTMASTER.CD_PRODUTO'
      Size = 2
    end
    object qry_contab_contmaster_CD_CT_CTAAPAGAR: TStringField
      FieldName = 'CD_CT_CTAAPAGAR'
      Origin = 'TCONTABILIZACAO_CONTMASTER.CD_CT_CTAAPAGAR'
      Size = 10
    end
    object qry_contab_contmaster_CD_CT_INSS: TStringField
      FieldName = 'CD_CT_INSS'
      Origin = 'TCONTABILIZACAO_CONTMASTER.CD_CT_INSS'
      Size = 8
    end
  end
  object qry_contab_lanc_contmaster_: TQuery
    DatabaseName = 'DBBROKER'
    DataSource = ds_contab_contmaster
    SQL.Strings = (
      'SELECT *'
      'FROM TCONTABILIZACAO_LANC_CONTMASTER'
      'WHERE NR_CONTAB = :NR_CONTAB')
    Left = 384
    Top = 547
    ParamData = <
      item
        DataType = ftString
        Name = 'NR_CONTAB'
        ParamType = ptUnknown
      end>
    object qry_contab_lanc_contmaster_NR_CONTAB: TStringField
      FieldName = 'NR_CONTAB'
      Origin = 'TCONTABILIZACAO_LANC_CONTMASTER.NR_CONTAB'
      Size = 4
    end
    object qry_contab_lanc_contmaster_NR_LANCAMENTO: TStringField
      FieldName = 'NR_LANCAMENTO'
      Origin = 'TCONTABILIZACAO_LANC_CONTMASTER.NR_LANCAMENTO'
      Size = 6
    end
    object qry_contab_lanc_contmaster_CD_CT_DEVEDORA: TStringField
      FieldName = 'CD_CT_DEVEDORA'
      Origin = 'TCONTABILIZACAO_LANC_CONTMASTER.CD_CT_DEVEDORA'
      Size = 10
    end
    object qry_contab_lanc_contmaster_CD_CT_CREDORA: TStringField
      FieldName = 'CD_CT_CREDORA'
      Origin = 'TCONTABILIZACAO_LANC_CONTMASTER.CD_CT_CREDORA'
      Size = 10
    end
    object qry_contab_lanc_contmaster_VL_LANCAMENTO: TFloatField
      FieldName = 'VL_LANCAMENTO'
      Origin = 'TCONTABILIZACAO_LANC_CONTMASTER.VL_LANCAMENTO'
    end
    object qry_contab_lanc_contmaster_CD_HISTORICO: TStringField
      FieldName = 'CD_HISTORICO'
      Origin = 'TCONTABILIZACAO_LANC_CONTMASTER.CD_HISTORICO'
      Size = 3
    end
    object qry_contab_lanc_contmaster_NM_HISTORICO: TStringField
      FieldName = 'NM_HISTORICO'
      Origin = 'TCONTABILIZACAO_LANC_CONTMASTER.NM_HISTORICO'
      Size = 186
    end
    object qry_contab_lanc_contmaster_CD_FILIAL: TStringField
      FieldName = 'CD_FILIAL'
      Origin = 'TCONTABILIZACAO_LANC_CONTMASTER.CD_FILIAL'
      Size = 3
    end
    object qry_contab_lanc_contmaster_CD_CUSTO: TStringField
      FieldName = 'CD_CUSTO'
      Origin = 'TCONTABILIZACAO_LANC_CONTMASTER.CD_CUSTO'
      Size = 3
    end
    object qry_contab_lanc_contmaster_NM_FORNECEDOR: TStringField
      FieldName = 'NM_FORNECEDOR'
      Origin = 'TCONTABILIZACAO_LANC_CONTMASTER.NR_CONTAB'
      Size = 35
    end
  end
  object ds_contab_contmaster: TDataSource
    DataSet = qry_contab_contmaster_
    Left = 244
    Top = 607
  end
  object ds_contab_lanc_contmaster: TDataSource
    DataSet = qry_contab_lanc_contmaster_
    Left = 384
    Top = 607
  end
  object ds_contab_gerencial_contmaster: TDataSource
    DataSet = qry_contab_gerencial_contmaster_
    Left = 545
    Top = 607
  end
  object qry_contab_gerencial_contmaster_: TQuery
    DatabaseName = 'DBBROKER'
    DataSource = ds_contab_lanc_contmaster
    SQL.Strings = (
      'SELECT *'
      'FROM TCONTABILIZACAO_GERENCIAL_CONTMASTER'
      'WHERE  NR_CONTAB = :NR_CONTAB AND'
      'NR_LANCAMENTO = :NR_LANCAMENTO')
    Left = 545
    Top = 547
    ParamData = <
      item
        DataType = ftString
        Name = 'NR_CONTAB'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'NR_LANCAMENTO'
        ParamType = ptUnknown
      end>
    object qry_contab_gerencial_contmaster_NR_CONTAB: TStringField
      FieldName = 'NR_CONTAB'
      Origin = 'TCONTABILIZACAO_GERENCIAL_CONTMASTER.NR_CONTAB'
      Size = 4
    end
    object qry_contab_gerencial_contmaster_NR_LANCAMENTO: TStringField
      FieldName = 'NR_LANCAMENTO'
      Origin = 'TCONTABILIZACAO_GERENCIAL_CONTMASTER.NR_LANCAMENTO'
      Size = 6
    end
    object qry_contab_gerencial_contmaster_CT_GERENCIAL: TStringField
      FieldName = 'CT_GERENCIAL'
      Origin = 'TCONTABILIZACAO_GERENCIAL_CONTMASTER.CT_GERENCIAL'
      Size = 4
    end
    object qry_contab_gerencial_contmaster_VL_GERENCIAL: TFloatField
      FieldName = 'VL_GERENCIAL'
      Origin = 'TCONTABILIZACAO_GERENCIAL_CONTMASTER.VL_GERENCIAL'
    end
  end
  object sp_contabiliza_rm_tito: TStoredProc
    DatabaseName = 'DBBROKER'
    StoredProcName = 'dbo.sp_contabiliza_rm_tito'
    Left = 779
    Top = 438
    ParamData = <
      item
        DataType = ftInteger
        Name = 'Result'
        ParamType = ptResult
        Value = 0
      end
      item
        DataType = ftString
        Name = '@cd_coligada'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = '@cd_unid_neg'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = '@cd_produto'
        ParamType = ptInput
      end
      item
        DataType = ftDateTime
        Name = '@dt_movimento'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = '@tp_contab'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = '@cd_usuario'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = '@nr_cont'
        ParamType = ptOutput
        Value = '0000'
      end>
  end
  object qry_contab_rm_tito_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT *'
      'FROM   TCONTABILIZACAO_RM_TITO'
      'WHERE  NR_CONTAB = :NR_CONTAB')
    Left = 678
    Top = 547
    ParamData = <
      item
        DataType = ftString
        Name = 'NR_CONTAB'
        ParamType = ptUnknown
      end>
    object qry_contab_rm_tito_CD_COLIGADA: TStringField
      FieldName = 'CD_COLIGADA'
      Origin = 'TCONTABILIZACAO_RM_TITO.CD_COLIGADA'
      Size = 2
    end
    object qry_contab_rm_tito_NR_CONTAB: TStringField
      FieldName = 'NR_CONTAB'
      Origin = 'TCONTABILIZACAO_RM_TITO.NR_CONTAB'
      Size = 4
    end
    object qry_contab_rm_tito_DT_CONTAB: TDateTimeField
      FieldName = 'DT_CONTAB'
      Origin = 'TCONTABILIZACAO_RM_TITO.DT_CONTAB'
    end
    object qry_contab_rm_tito_CD_USUARIO: TStringField
      FieldName = 'CD_USUARIO'
      Origin = 'TCONTABILIZACAO_RM_TITO.CD_USUARIO'
      Size = 4
    end
    object qry_contab_rm_tito_TP_CONTAB: TStringField
      FieldName = 'TP_CONTAB'
      Origin = 'TCONTABILIZACAO_RM_TITO.TP_CONTAB'
      Size = 1
    end
    object qry_contab_rm_tito_DT_MOVIMENTO: TDateTimeField
      FieldName = 'DT_MOVIMENTO'
      Origin = 'TCONTABILIZACAO_RM_TITO.DT_MOVIMENTO'
    end
    object qry_contab_rm_tito_CD_UNID_NEG: TStringField
      FieldName = 'CD_UNID_NEG'
      Origin = 'TCONTABILIZACAO_RM_TITO.CD_UNID_NEG'
      Size = 2
    end
    object qry_contab_rm_tito_CD_PRODUTO: TStringField
      FieldName = 'CD_PRODUTO'
      Origin = 'TCONTABILIZACAO_RM_TITO.CD_PRODUTO'
      Size = 2
    end
    object qry_contab_rm_tito_CD_CT_CTAAPAGAR: TStringField
      FieldName = 'CD_CT_CTAAPAGAR'
      Origin = 'TCONTABILIZACAO_RM_TITO.CD_CT_CTAAPAGAR'
      Size = 8
    end
    object qry_contab_rm_tito_CD_CT_INSS: TStringField
      FieldName = 'CD_CT_INSS'
      Origin = 'TCONTABILIZACAO_RM_TITO.CD_CT_INSS'
      Size = 8
    end
  end
  object qry_contab_lanc_rm_tito_: TQuery
    DatabaseName = 'DBBROKER'
    DataSource = ds_contab_rem_tito
    SQL.Strings = (
      'SELECT *'
      'FROM   TCONTABILIZACAO_LANC_RM_TITO'
      'WHERE  NR_CONTAB = :NR_CONTAB')
    Left = 793
    Top = 547
    ParamData = <
      item
        DataType = ftString
        Name = 'NR_CONTAB'
        ParamType = ptUnknown
      end>
    object qry_contab_lanc_rm_tito_CD_COLIGADA: TStringField
      FieldName = 'CD_COLIGADA'
      Origin = 'TCONTABILIZACAO_LANC_RM_TITO.CD_COLIGADA'
      Size = 2
    end
    object qry_contab_lanc_rm_tito_NR_CONTAB: TStringField
      FieldName = 'NR_CONTAB'
      Origin = 'TCONTABILIZACAO_LANC_RM_TITO.NR_CONTAB'
      Size = 4
    end
    object qry_contab_lanc_rm_tito_NR_LANCAMENTO: TStringField
      FieldName = 'NR_LANCAMENTO'
      Origin = 'TCONTABILIZACAO_LANC_RM_TITO.NR_LANCAMENTO'
      Size = 6
    end
    object qry_contab_lanc_rm_tito_CD_CT_DEVEDORA: TStringField
      FieldName = 'CD_CT_DEVEDORA'
      Origin = 'TCONTABILIZACAO_LANC_RM_TITO.CD_CT_DEVEDORA'
      Size = 10
    end
    object qry_contab_lanc_rm_tito_CD_CT_CREDORA: TStringField
      FieldName = 'CD_CT_CREDORA'
      Origin = 'TCONTABILIZACAO_LANC_RM_TITO.CD_CT_CREDORA'
      Size = 10
    end
    object qry_contab_lanc_rm_tito_VL_LANCAMENTO: TFloatField
      FieldName = 'VL_LANCAMENTO'
      Origin = 'TCONTABILIZACAO_LANC_RM_TITO.VL_LANCAMENTO'
    end
    object qry_contab_lanc_rm_tito_CD_HISTORICO: TStringField
      FieldName = 'CD_HISTORICO'
      Origin = 'TCONTABILIZACAO_LANC_RM_TITO.CD_HISTORICO'
      Size = 8
    end
    object qry_contab_lanc_rm_tito_NM_HISTORICO: TStringField
      FieldName = 'NM_HISTORICO'
      Origin = 'TCONTABILIZACAO_LANC_RM_TITO.NM_HISTORICO'
      Size = 186
    end
    object qry_contab_lanc_rm_tito_CD_FILIAL: TStringField
      FieldName = 'CD_FILIAL'
      Origin = 'TCONTABILIZACAO_LANC_RM_TITO.CD_FILIAL'
      Size = 3
    end
    object qry_contab_lanc_rm_tito_CD_CUSTO: TStringField
      FieldName = 'CD_CUSTO'
      Origin = 'TCONTABILIZACAO_LANC_RM_TITO.CD_CUSTO'
      Size = 3
    end
    object qry_contab_lanc_rm_tito_DT_MOVIMENTO: TDateTimeField
      FieldName = 'DT_MOVIMENTO'
      Origin = 'TCONTABILIZACAO_LANC_RM_TITO.DT_MOVIMENTO'
    end
  end
  object ds_contab_rem_tito: TDataSource
    DataSet = qry_contab_rm_tito_
    Left = 678
    Top = 607
  end
  object ds_contab_lanc_rm_tito: TDataSource
    DataSet = qry_contab_lanc_rm_tito_
    Left = 793
    Top = 607
  end
  object ds_contab_ger_rm_tito: TDataSource
    DataSet = qry_contab_ger_rm_tito_
    Left = 913
    Top = 607
  end
  object qry_contab_ger_rm_tito_: TQuery
    DatabaseName = 'DBBROKER'
    DataSource = ds_contab_lanc_rm_tito
    SQL.Strings = (
      'SELECT *'
      'FROM   TCONTABILIZACAO_GERENCIAL_RM_TITO'
      'WHERE  NR_CONTAB = :NR_CONTAB AND'
      '       NR_LANCAMENTO = :NR_LANCAMENTO')
    Left = 913
    Top = 547
    ParamData = <
      item
        DataType = ftString
        Name = 'NR_CONTAB'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'NR_LANCAMENTO'
        ParamType = ptUnknown
      end>
    object qry_contab_ger_rm_tito_CD_COLIGADA: TStringField
      FieldName = 'CD_COLIGADA'
      Origin = 'TCONTABILIZACAO_GERENCIAL_RM_TITO.CD_COLIGADA'
      Size = 2
    end
    object qry_contab_ger_rm_tito_NR_CONTAB: TStringField
      FieldName = 'NR_CONTAB'
      Origin = 'TCONTABILIZACAO_GERENCIAL_RM_TITO.NR_CONTAB'
      Size = 4
    end
    object qry_contab_ger_rm_tito_NR_LANCAMENTO: TStringField
      FieldName = 'NR_LANCAMENTO'
      Origin = 'TCONTABILIZACAO_GERENCIAL_RM_TITO.NR_LANCAMENTO'
      Size = 6
    end
    object qry_contab_ger_rm_tito_CT_GERENCIAL: TStringField
      FieldName = 'CT_GERENCIAL'
      Origin = 'TCONTABILIZACAO_GERENCIAL_RM_TITO.CT_GERENCIAL'
      Size = 4
    end
    object qry_contab_ger_rm_tito_VL_GERENCIAL: TFloatField
      FieldName = 'VL_GERENCIAL'
      Origin = 'TCONTABILIZACAO_GERENCIAL_RM_TITO.VL_GERENCIAL'
    end
  end
  object sp_atz_faturamento: TStoredProc
    DatabaseName = 'DBBROKER'
    StoredProcName = 'dbo.sp_atz_faturamento'
    Left = 873
    Top = 438
    ParamData = <
      item
        DataType = ftInteger
        Name = 'Result'
        ParamType = ptResult
        Value = 0
      end
      item
        DataType = ftString
        Name = '@cd_coligada'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = '@cd_unid_neg'
        ParamType = ptInput
      end
      item
        DataType = ftDateTime
        Name = '@dt_movimento'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = '@nr_lancamento'
        ParamType = ptInput
      end>
  end
  object Upd_caixa_contabil_: TUpdateSQL
    ModifySQL.Strings = (
      'update TCAIXA'
      'set'
      '  CD_COLIGADA = :CD_COLIGADA,'
      '  DT_MOVIMENTO = :DT_MOVIMENTO,'
      '  NR_LANCAMENTO = :NR_LANCAMENTO,'
      '  CD_UNID_NEG = :CD_UNID_NEG,'
      '  TP_LANCAMENTO = :TP_LANCAMENTO,'
      '  TP_PROCEDENCIA = :TP_PROCEDENCIA,'
      '  IN_CANCELADO = :IN_CANCELADO,'
      '  IN_TRANSFERIDO = :IN_TRANSFERIDO,'
      '  CD_HISTORICO = :CD_HISTORICO,'
      '  NM_HISTORICO = :NM_HISTORICO,'
      '  VL_LANCAMENTO = :VL_LANCAMENTO,'
      '  TP_PAGAMENTO = :TP_PAGAMENTO,'
      '  TP_NATUREZA = :TP_NATUREZA,'
      '  CD_BANCO = :CD_BANCO,'
      '  NR_CHEQUE = :NR_CHEQUE,'
      '  CD_CT_CONTABIL = :CD_CT_CONTABIL,'
      '  CD_CT_CUSTO = :CD_CT_CUSTO,'
      '  CD_FAVORECIDO = :CD_FAVORECIDO,'
      '  VL_IR = :VL_IR,'
      '  CD_ACESSO = :CD_ACESSO,'
      '  CD_AUX = :CD_AUX,'
      '  CD_HIST_PADRAO = :CD_HIST_PADRAO,'
      '  DT_CANCELADO = :DT_CANCELADO,'
      '  IN_CONTABILIZA = :IN_CONTABILIZA,'
      '  VL_INSS = :VL_INSS,'
      '  VL_PISCOFINS = :VL_PISCOFINS,'
      '  VL_ISS = :VL_ISS,'
      '  IN_CONCILIACAO = :IN_CONCILIACAO,'
      '  DT_CONCILIACAO = :DT_CONCILIACAO,'
      '  CD_USUARIO_CONCILIACAO = :CD_USUARIO_CONCILIACAO,'
      '  IN_CONCILIACAO_AUTOM = :IN_CONCILIACAO_AUTOM,'
      '  NR_SEQ_CONCILIACAO = :NR_SEQ_CONCILIACAO,'
      '  CD_RATEIO = :CD_RATEIO'
      'where'
      '  CD_COLIGADA = :OLD_CD_COLIGADA and'
      '  DT_MOVIMENTO = :OLD_DT_MOVIMENTO and'
      '  NR_LANCAMENTO = :OLD_NR_LANCAMENTO')
    InsertSQL.Strings = (
      'insert into TCAIXA'
      
        '  (CD_COLIGADA, DT_MOVIMENTO, NR_LANCAMENTO, CD_UNID_NEG, TP_LAN' +
        'CAMENTO, '
      
        '   TP_PROCEDENCIA, IN_CANCELADO, IN_TRANSFERIDO, CD_HISTORICO, N' +
        'M_HISTORICO, '
      
        '   VL_LANCAMENTO, TP_PAGAMENTO, TP_NATUREZA, CD_BANCO, NR_CHEQUE' +
        ', CD_CT_CONTABIL, '
      
        '   CD_CT_CUSTO, CD_FAVORECIDO, VL_IR, CD_ACESSO, CD_AUX, CD_HIST' +
        '_PADRAO, '
      
        '   DT_CANCELADO, IN_CONTABILIZA, VL_INSS, VL_PISCOFINS, VL_ISS, ' +
        'IN_CONCILIACAO, '
      
        '   DT_CONCILIACAO, CD_USUARIO_CONCILIACAO, IN_CONCILIACAO_AUTOM,' +
        ' NR_SEQ_CONCILIACAO, '
      '   CD_RATEIO)'
      'values'
      
        '  (:CD_COLIGADA, :DT_MOVIMENTO, :NR_LANCAMENTO, :CD_UNID_NEG, :T' +
        'P_LANCAMENTO, '
      
        '   :TP_PROCEDENCIA, :IN_CANCELADO, :IN_TRANSFERIDO, :CD_HISTORIC' +
        'O, :NM_HISTORICO, '
      
        '   :VL_LANCAMENTO, :TP_PAGAMENTO, :TP_NATUREZA, :CD_BANCO, :NR_C' +
        'HEQUE, '
      
        '   :CD_CT_CONTABIL, :CD_CT_CUSTO, :CD_FAVORECIDO, :VL_IR, :CD_AC' +
        'ESSO, :CD_AUX, '
      
        '   :CD_HIST_PADRAO, :DT_CANCELADO, :IN_CONTABILIZA, :VL_INSS, :V' +
        'L_PISCOFINS, '
      
        '   :VL_ISS, :IN_CONCILIACAO, :DT_CONCILIACAO, :CD_USUARIO_CONCIL' +
        'IACAO, '
      '   :IN_CONCILIACAO_AUTOM, :NR_SEQ_CONCILIACAO, :CD_RATEIO)')
    DeleteSQL.Strings = (
      'delete from TCAIXA'
      'where'
      '  CD_COLIGADA = :OLD_CD_COLIGADA and'
      '  DT_MOVIMENTO = :OLD_DT_MOVIMENTO and'
      '  NR_LANCAMENTO = :OLD_NR_LANCAMENTO')
    Left = 112
    Top = 312
  end
  object dts_caixa_fatur_Rateio: TDataSource
    DataSet = qry_caixa_fatur_Rateio
    Left = 603
    Top = 376
  end
  object qry_caixa_fatur_Rateio: TQuery
    BeforeOpen = qry_caixa_fatur_RateioBeforeOpen
    DatabaseName = 'DBBROKER'
    DataSource = ds_caixa_fatur
    RequestLive = True
    SQL.Strings = (
      'select * from TCAIXA_RATEIO A'
      'WHERE'
      '  A.CD_UNID_NEG = :CD_UNID_NEG AND'
      '  A.DT_MOVIMENTO = :DT_MOVIMENTO AND'
      '  A.NR_LANCAMENTO = :NR_LANCAMENTO  '
      ''
      '')
    Left = 603
    Top = 325
    ParamData = <
      item
        DataType = ftString
        Name = 'CD_UNID_NEG'
        ParamType = ptUnknown
        Size = 3
      end
      item
        DataType = ftDateTime
        Name = 'DT_MOVIMENTO'
        ParamType = ptUnknown
        Size = 8
      end
      item
        DataType = ftString
        Name = 'NR_LANCAMENTO'
        ParamType = ptUnknown
        Size = 7
      end>
  end
  object dts_caixa_adm_Rateio: TDataSource
    DataSet = qry_caixa_adm_Rateio
    Left = 603
    Top = 488
  end
  object qry_caixa_adm_Rateio: TQuery
    BeforeOpen = qry_caixa_adm_RateioBeforeOpen
    DatabaseName = 'DBBROKER'
    DataSource = ds_caixa_contabil
    RequestLive = True
    SQL.Strings = (
      'select * from TCAIXA_RATEIO_ADM A'
      'WHERE'
      '  A.CD_UNID_NEG = :CD_UNID_NEG AND'
      '  A.DT_MOVIMENTO = :DT_MOVIMENTO AND'
      '  A.NR_LANCAMENTO = :NR_LANCAMENTO  '
      ''
      '')
    Left = 603
    Top = 437
    ParamData = <
      item
        DataType = ftString
        Name = 'CD_UNID_NEG'
        ParamType = ptUnknown
        Size = 3
      end
      item
        DataType = ftDateTime
        Name = 'DT_MOVIMENTO'
        ParamType = ptUnknown
        Size = 8
      end
      item
        DataType = ftString
        Name = 'NR_LANCAMENTO'
        ParamType = ptUnknown
        Size = 7
      end>
  end
end
