object datm_ctaapagar: Tdatm_ctaapagar
  OldCreateOrder = True
  Left = 448
  Top = 113
  Height = 625
  Width = 918
  object ds_favorecido: TDataSource
    DataSet = qry_favorecido_
    Left = 289
    Top = 107
  end
  object qry_favorecido_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      
        'SELECT CD_FAVORECIDO, NM_FAVORECIDO, IN_CONTROLA_IR, AP_FAVORECI' +
        'DO'
      'FROM TFAVORECIDO'
      'WHERE CD_FAVORECIDO <> '#39#39)
    Left = 353
    Top = 107
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
    object qry_favorecido_AP_FAVORECIDO: TStringField
      FieldName = 'AP_FAVORECIDO'
      Origin = 'TFAVORECIDO.CD_FAVORECIDO'
      Size = 10
    end
  end
  object ds_banco: TDataSource
    DataSet = qry_banco_
    Left = 289
    Top = 401
  end
  object qry_banco_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT CD_BANCO, NM_BANCO'
      'FROM TBANCO'
      'WHERE  IN_IMPOSTOS = '#39'0'#39)
    Left = 353
    Top = 401
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
  object ds_unid_neg: TDataSource
    DataSet = qry_unid_neg_
    Left = 289
    Top = 351
  end
  object qry_unid_neg_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT CD_UNID_NEG, NM_UNID_NEG, CD_FILIAL, AP_UNID_NEG'
      'FROM TUNID_NEG'
      'ORDER BY'
      'NM_UNID_NEG')
    Left = 353
    Top = 351
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
    object qry_unid_neg_CD_FILIAL: TStringField
      FieldName = 'CD_FILIAL'
      Origin = 'TUNID_NEG.CD_FILIAL'
      Size = 3
    end
    object qry_unid_neg_AP_UNID_NEG: TStringField
      FieldName = 'AP_UNID_NEG'
      Origin = 'TUNID_NEG.CD_UNID_NEG'
      Size = 10
    end
  end
  object ds_yesno: TDataSource
    DataSet = tbl_yesno_
    Left = 289
    Top = 303
  end
  object tbl_yesno_: TTable
    DatabaseName = 'DBBROKER'
    IndexFieldNames = 'CD_YESNO'
    TableName = 'TYES_NO'
    Left = 353
    Top = 303
  end
  object ds_ct_contabil: TDataSource
    DataSet = qry_ct_contabil_
    Left = 46
    Top = 9
  end
  object qry_ct_contabil_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      
        'SELECT CD_CT_CONTABIL, NM_CT_CONTABIL, CD_ACESSO, CD_AUX, IN_DIS' +
        'TRIBUI'
      'FROM   TCT_CONTABIL'
      'WHERE  CD_IDENTIFICADOR = '#39'A'#39
      'ORDER BY'
      'CD_CT_CONTABIL')
    Left = 120
    Top = 9
    object qry_ct_contabil_CD_CT_CONTABIL: TStringField
      FieldName = 'CD_CT_CONTABIL'
      Origin = 'DBBROKER.TCT_CONTABIL.CD_CT_CONTABIL'
      FixedChar = True
      Size = 12
    end
    object qry_ct_contabil_NM_CT_CONTABIL: TStringField
      FieldName = 'NM_CT_CONTABIL'
      Origin = 'TCONTABIL_PLANO.NM_CT_CONTABIL'
      Size = 40
    end
    object qry_ct_contabil_IN_DISTRIBUI: TStringField
      FieldName = 'IN_DISTRIBUI'
      Origin = 'TCONTABIL_PLANO.IN_DISTRIBUI'
      Size = 1
    end
    object qry_ct_contabil_CD_ACESSO: TStringField
      FieldName = 'CD_ACESSO'
      Origin = 'TCT_CONTABIL.CD_CT_CONTABIL'
      Size = 1
    end
    object qry_ct_contabil_CD_AUX: TStringField
      FieldName = 'CD_AUX'
      Origin = 'TCT_CONTABIL.NM_CT_CONTABIL'
      Size = 3
    end
  end
  object ds_ct_custo: TDataSource
    DataSet = qry_ct_custo_
    Left = 46
    Top = 156
  end
  object qry_ct_custo_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT *'
      'FROM TCONTABIL_CUSTO'
      'WHERE CD_COLIGADA = :CD_COLIGADA')
    Left = 120
    Top = 156
    ParamData = <
      item
        DataType = ftString
        Name = 'CD_COLIGADA'
        ParamType = ptUnknown
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
    Left = 289
    Top = 58
  end
  object qry_ct_distr_gerencial_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT *'
      'FROM TCONTABIL_GERENCIAL'
      'WHERE CD_COLIGADA = :CD_COLIGADA')
    Left = 353
    Top = 58
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
  object ds_contabil_distr: TDataSource
    DataSet = qry_contabil_distr_
    Left = 46
    Top = 401
  end
  object qry_contabil_distr_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT *'
      'FROM TCONTABIL_DISTRIBUICAO'
      'WHERE CD_COLIGADA = :CD_COLIGADA')
    Left = 120
    Top = 401
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
  object ds_tp_forma_pagto: TDataSource
    DataSet = tbl_tp_forma_pagto_
    Left = 289
    Top = 206
  end
  object tbl_tp_forma_pagto_: TTable
    DatabaseName = 'DBBROKER'
    IndexFieldNames = 'CD_FORMA_PAGTO'
    TableName = 'TTP_FORMA_PAGTO'
    Left = 353
    Top = 206
  end
  object qry_contab_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT *'
      'FROM TCONTABILIZACAO'
      'WHERE  CD_COLIGADA = :CD_COLIGADA AND'
      'NR_CONTAB = :NR_CONTAB')
    Left = 120
    Top = 206
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
      'FROM TCONTABILIZACAO_LANC'
      'WHERE  CD_COLIGADA = :CD_COLIGADA AND'
      'NR_CONTAB = :NR_CONTAB')
    Left = 353
    Top = 254
    ParamData = <
      item
        DataType = ftString
        Name = 'CD_COLIGADA'
        ParamType = ptUnknown
        Size = 3
      end
      item
        DataType = ftString
        Name = 'NR_CONTAB'
        ParamType = ptUnknown
        Size = 5
      end>
    object qry_contab_lanc_CD_COLIGADA: TStringField
      FieldName = 'CD_COLIGADA'
      Origin = 'TCONTABILIZACAO_LANC.CD_COLIGADA'
      Size = 2
    end
    object qry_contab_lanc_NR_CONTAB: TStringField
      FieldName = 'NR_CONTAB'
      Origin = 'TCONTABILIZACAO_LANC.NR_CONTAB'
      Size = 4
    end
    object qry_contab_lanc_NR_LANCAMENTO: TStringField
      FieldName = 'NR_LANCAMENTO'
      Origin = 'TCONTABILIZACAO_LANC.NR_LANCAMENTO'
      Size = 3
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
    object qry_contab_lanc_CD_CT_DEVEDORA: TStringField
      FieldName = 'CD_CT_DEVEDORA'
      Origin = 'DBBROKER.TCONTABILIZACAO_LANC.CD_CT_DEVEDORA'
      FixedChar = True
      Size = 12
    end
    object qry_contab_lanc_CD_CT_CREDORA: TStringField
      FieldName = 'CD_CT_CREDORA'
      Origin = 'DBBROKER.TCONTABILIZACAO_LANC.CD_CT_CREDORA'
      FixedChar = True
      Size = 12
    end
    object qry_contab_lanc_DT_MOVIMENTO: TDateTimeField
      FieldName = 'DT_MOVIMENTO'
      Origin = 'DBBROKER.TCONTABILIZACAO_LANC.DT_MOVIMENTO'
    end
  end
  object ds_contab: TDataSource
    DataSet = qry_contab_
    Left = 46
    Top = 206
  end
  object ds_contab_lanc: TDataSource
    DataSet = qry_contab_lanc_
    Left = 289
    Top = 254
  end
  object ds_contab_gerencial: TDataSource
    DataSet = qry_contab_gerencial_
    Left = 46
    Top = 351
  end
  object qry_contab_gerencial_: TQuery
    DatabaseName = 'DBBROKER'
    DataSource = ds_contab_lanc
    SQL.Strings = (
      'SELECT *'
      'FROM TCONTABILIZACAO_GERENCIAL'
      'WHERE  CD_COLIGADA = :CD_COLIGADA AND'
      'NR_CONTAB = :NR_CONTAB AND'
      'NR_LANCAMENTO = :NR_LANCAMENTO')
    Left = 120
    Top = 351
    ParamData = <
      item
        DataType = ftString
        Name = 'CD_COLIGADA'
        ParamType = ptUnknown
        Size = 3
      end
      item
        DataType = ftString
        Name = 'NR_CONTAB'
        ParamType = ptUnknown
        Size = 5
      end
      item
        DataType = ftString
        Name = 'NR_LANCAMENTO'
        ParamType = ptUnknown
        Size = 4
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
      FieldName = 'NR_LANCAMENTO'
      Origin = 'TCONTABILIZACAO_GERENCIAL.NR_LANCAMENTO'
      Size = 3
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
  object ds_ctaapagar: TDataSource
    DataSet = qry_ctaapagar_
    Left = 46
    Top = 107
  end
  object ds_ctaapagar_ger_: TDataSource
    DataSet = qry_ctaapagar_ger_
    Left = 289
    Top = 156
  end
  object qry_ctaapagar_ger_: TQuery
    AfterEdit = qry_ctaapagar_AfterEdit
    AfterScroll = qry_ctaapagar_ger_AfterScroll
    OnCalcFields = qry_ctaapagar_ger_CalcFields
    DatabaseName = 'DBBROKER'
    RequestLive = True
    SQL.Strings = (
      'SELECT *'
      'FROM TCTAAPAGAR_GER'
      'WHERE CD_UNID_NEG    = :CD_UNID_NEG    AND'
      '      DT_CTAAPAGAR   = :DT_CTAAPAGAR   AND'
      '      NR_CTAAPAGAR   = :NR_CTAAPAGAR   AND'
      '      CD_CT_CONTABIL = :CD_CT_CONTABIL AND'
      '      CD_FILIAL      = :CD_FILIAL      AND'
      '      CD_CT_CUSTO    = :CD_CT_CUSTO')
    Left = 353
    Top = 156
    ParamData = <
      item
        DataType = ftString
        Name = 'CD_UNID_NEG'
        ParamType = ptUnknown
      end
      item
        DataType = ftDateTime
        Name = 'DT_CTAAPAGAR'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'NR_CTAAPAGAR'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'CD_CT_CONTABIL'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'CD_FILIAL'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'CD_CT_CUSTO'
        ParamType = ptUnknown
      end>
    object qry_ctaapagar_ger_DT_CTAAPAGAR: TDateTimeField
      FieldName = 'DT_CTAAPAGAR'
      Origin = 'TCTAAPAGAR_GER.DT_CTAAPAGAR'
    end
    object qry_ctaapagar_ger_NR_CTAAPAGAR: TStringField
      DisplayLabel = 'N'#186
      FieldName = 'NR_CTAAPAGAR'
      Origin = 'TCTAAPAGAR_GER.DT_CTAAPAGAR'
      Size = 3
    end
    object qry_ctaapagar_ger_CD_CT_GERENCIAL: TStringField
      FieldName = 'CD_CT_GERENCIAL'
      Origin = 'TCTAAPAGAR_GER.CD_CT_GERENCIAL'
      Size = 4
    end
    object qry_ctaapagar_ger_CD_CT_CONTABIL: TStringField
      FieldName = 'CD_CT_CONTABIL'
      Origin = 'DBBROKER.TCTAAPAGAR_GER.CD_CT_CONTABIL'
      FixedChar = True
      Size = 12
    end
    object qry_ctaapagar_ger_CD_FILIAL: TStringField
      FieldName = 'CD_FILIAL'
      Origin = 'TCTAAPAGAR_GER.CD_COLIGADA'
      Size = 3
    end
    object qry_ctaapagar_ger_VL_LANCAMENTO: TFloatField
      DisplayLabel = 'Valor'
      FieldName = 'VL_LANCAMENTO'
      Origin = 'TCTAAPAGAR_GER.VL_LANCAMENTO'
      DisplayFormat = '#0,.00'
      EditFormat = '#0.00'
    end
    object qry_ctaapagar_ger_CD_CT_CUSTO: TStringField
      FieldName = 'CD_CT_CUSTO'
      Origin = 'TCTAAPAGAR_GER.CD_COLIGADA'
      Size = 4
    end
    object qry_ctaapagar_ger_LookCtContabil: TStringField
      DisplayLabel = 'Conta Cont'#225'bil'
      FieldKind = fkLookup
      FieldName = 'LookCtContabil'
      LookupDataSet = qry_ct_contabil_
      LookupKeyFields = 'CD_CT_CONTABIL'
      LookupResultField = 'NM_CT_CONTABIL'
      KeyFields = 'CD_CT_CONTABIL'
      Size = 40
      Lookup = True
    end
    object qry_ctaapagar_ger_LookCtDistrGerencial: TStringField
      DisplayLabel = 'Distr. Gerencial'
      FieldKind = fkLookup
      FieldName = 'LookCtDistrGerencial'
      LookupDataSet = qry_ct_distr_gerencial_
      LookupKeyFields = 'CD_CT_GERENCIAL'
      LookupResultField = 'NM_CT_GERENCIAL'
      KeyFields = 'CD_CT_GERENCIAL'
      Lookup = True
    end
    object qry_ctaapagar_ger_CD_UNID_NEG: TStringField
      FieldName = 'CD_UNID_NEG'
      Origin = 'TCTAAPAGAR_GER.DT_CTAAPAGAR'
      Size = 2
    end
    object qry_ctaapagar_ger_LookCtGerencial: TStringField
      FieldKind = fkLookup
      FieldName = 'LookCtGerencial'
      LookupDataSet = qry_ct_gerencial_
      LookupKeyFields = 'CD_CT_GERENCIAL'
      LookupResultField = 'NM_CT_GERENCIAL'
      KeyFields = 'CD_CT_GERENCIAL'
      Lookup = True
    end
    object qry_ctaapagar_ger_calcDistribGer: TStringField
      FieldKind = fkCalculated
      FieldName = 'calcDistribGer'
      Calculated = True
    end
  end
  object ds_ctaapagar_lanc: TDataSource
    DataSet = qry_ctaapagar_lanc_
    Left = 46
    Top = 254
  end
  object qry_ctaapagar_lanc_: TQuery
    AfterEdit = qry_ctaapagar_lanc_AfterEdit
    AfterPost = qry_ctaapagar_AfterPost
    AfterScroll = qry_ctaapagar_lanc_AfterScroll
    DatabaseName = 'DBBROKER'
    RequestLive = True
    SQL.Strings = (
      'SELECT *'
      'FROM TCTAAPAGAR_LANC'
      'WHERE'
      'CD_UNID_NEG =:CD_UNID_NEG AND'
      'DT_CTAAPAGAR = :DT_CTAAPAGAR  AND'
      'NR_CTAAPAGAR = :NR_CTAAPAGAR'
      '')
    Left = 120
    Top = 254
    ParamData = <
      item
        DataType = ftString
        Name = 'CD_UNID_NEG'
        ParamType = ptUnknown
      end
      item
        DataType = ftDateTime
        Name = 'DT_CTAAPAGAR'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'NR_CTAAPAGAR'
        ParamType = ptUnknown
      end>
    object qry_ctaapagar_lanc_DT_CTAAPAGAR: TDateTimeField
      FieldName = 'DT_CTAAPAGAR'
      Origin = 'TCTAAPAGAR_LANC.DT_CTAAPAGAR'
    end
    object qry_ctaapagar_lanc_NR_CTAAPAGAR: TStringField
      DisplayLabel = 'N'#186
      FieldName = 'NR_CTAAPAGAR'
      Origin = 'TCTAAPAGAR_LANC.DT_CTAAPAGAR'
      Size = 3
    end
    object qry_ctaapagar_lanc_CD_FILIAL: TStringField
      FieldName = 'CD_FILIAL'
      Origin = 'TCTAAPAGAR_LANC.CD_COLIGADA'
      Size = 2
    end
    object qry_ctaapagar_lanc_LookFilial: TStringField
      FieldKind = fkLookup
      FieldName = 'LookFilial'
      LookupDataSet = qry_unid_neg_
      LookupKeyFields = 'CD_UNID_NEG'
      LookupResultField = 'NM_UNID_NEG'
      KeyFields = 'CD_FILIAL'
      Size = 50
      Lookup = True
    end
    object qry_ctaapagar_lanc_CD_UNID_NEG: TStringField
      FieldName = 'CD_UNID_NEG'
      Origin = 'TCTAAPAGAR_LANC.DT_CTAAPAGAR'
      Size = 2
    end
    object qry_ctaapagar_lanc_CD_ACESSO: TStringField
      FieldName = 'CD_ACESSO'
      Origin = 'TCTAAPAGAR_LANC.DT_CTAAPAGAR'
      Size = 1
    end
    object qry_ctaapagar_lanc_CD_AUX: TStringField
      FieldName = 'CD_AUX'
      Origin = 'TCTAAPAGAR_LANC.NR_CTAAPAGAR'
      Size = 3
    end
    object qry_ctaapagar_lanc_CD_ITEM: TStringField
      FieldName = 'CD_ITEM'
      Origin = 'DBBROKER.TCTAAPAGAR_LANC.CD_ITEM'
      FixedChar = True
      Size = 3
    end
    object qry_ctaapagar_lanc_Look_nm_item: TStringField
      FieldKind = fkLookup
      FieldName = 'Look_nm_item'
      LookupDataSet = qry_item_
      LookupKeyFields = 'CD_ITEM'
      LookupResultField = 'NM_ITEM'
      KeyFields = 'CD_ITEM'
      Size = 50
      Lookup = True
    end
    object qry_ctaapagar_lanc_CD_CT_CUSTO: TStringField
      FieldName = 'CD_CT_CUSTO'
      Origin = 'DBBROKER.TCTAAPAGAR_LANC.CD_CT_CUSTO'
      FixedChar = True
      Size = 25
    end
    object qry_ctaapagar_lanc_Look_nome_rateio: TStringField
      DisplayLabel = 'Rateio'
      FieldKind = fkLookup
      FieldName = 'Look_nome_rateio'
      LookupDataSet = SqlRateio
      LookupKeyFields = 'CD_RATEIO'
      LookupResultField = 'NM_RATEIO'
      KeyFields = 'CD_RATEIO'
      Size = 60
      Lookup = True
    end
    object qry_ctaapagar_lanc_CD_CT_CONTABIL: TStringField
      FieldName = 'CD_CT_CONTABIL'
      Origin = 'DBBROKER.TCTAAPAGAR_LANC.CD_CT_CONTABIL'
      FixedChar = True
      Size = 40
    end
    object qry_ctaapagar_lanc_VL_LANCAMENTO: TFloatField
      DisplayLabel = 'Valor'
      FieldName = 'VL_LANCAMENTO'
      Origin = 'DBBROKER.TCTAAPAGAR_LANC.VL_LANCAMENTO'
      DisplayFormat = '#,##0.00'
      EditFormat = '#,##0.00'
    end
    object qry_ctaapagar_lanc_NM_HISTORICO: TMemoField
      FieldName = 'NM_HISTORICO'
      Origin = 'DBBROKER.TCTAAPAGAR_LANC.NM_HISTORICO'
      BlobType = ftMemo
    end
    object qry_ctaapagar_lanc_CODIGO: TAutoIncField
      FieldName = 'CODIGO'
      Origin = 'DBBROKER.TCTAAPAGAR_LANC.CODIGO'
    end
    object qry_ctaapagar_lanc_NR_LANC_CAIXA: TStringField
      FieldName = 'NR_LANC_CAIXA'
      Origin = 'DBBROKER.TCTAAPAGAR_LANC.NR_LANC_CAIXA'
      FixedChar = True
      Size = 6
    end
    object qry_ctaapagar_lanc_DT_MOVIMENTO_CAIXA: TDateTimeField
      FieldName = 'DT_MOVIMENTO_CAIXA'
      Origin = 'DBBROKER.TCTAAPAGAR_LANC.DT_MOVIMENTO_CAIXA'
    end
    object qry_ctaapagar_lanc_CD_RATEIO: TStringField
      DisplayLabel = 'C'#243'd. Rateio'
      FieldName = 'CD_RATEIO'
      Origin = 'DBBROKER.TCTAAPAGAR_LANC.CD_RATEIO'
      FixedChar = True
      Size = 4
    end
    object qry_ctaapagar_lanc_Look_nome_ct_custo: TStringField
      FieldKind = fkLookup
      FieldName = 'Look_nome_ct_custo'
      LookupDataSet = SqlCustosContabil
      LookupKeyFields = 'CD_CT_CUSTO'
      LookupResultField = 'NM_CT_CUSTO'
      KeyFields = 'CD_CT_CUSTO'
      Lookup = True
    end
  end
  object qry_usuario_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT CD_USUARIO, AP_USUARIO'
      'FROM TUSUARIO')
    Left = 562
    Top = 206
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
  object qry_ult_conta_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT CONVERT( integer, MAX( NR_CTAAPAGAR ) )  AS ULTIMO'
      'FROM   TCTAAPAGAR (NOLOCK)'
      'WHERE  DT_CTAAPAGAR = :DT_CTAAPAGAR AND'
      '       CD_UNID_NEG  = :CD_UNID_NEG')
    Left = 466
    Top = 206
    ParamData = <
      item
        DataType = ftDateTime
        Name = 'DT_CTAAPAGAR'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'CD_UNID_NEG'
        ParamType = ptUnknown
      end>
    object qry_ult_conta_ULTIMO: TIntegerField
      FieldName = 'ULTIMO'
    end
  end
  object sp_atz_distr_ger_ctaapagar: TStoredProc
    DatabaseName = 'DBBROKER'
    StoredProcName = 'dbo.sp_atz_distr_ger_ctaapagar'
    Left = 725
    Top = 351
    ParamData = <
      item
        DataType = ftInteger
        Name = 'Result'
        ParamType = ptResult
        Value = 0
      end
      item
        DataType = ftString
        Name = '@cd_unid_neg'
        ParamType = ptInput
      end
      item
        DataType = ftDateTime
        Name = '@dt_ctaapagar'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = '@nr_ctaapagar'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = '@cd_ct_contabil'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = '@cd_filial'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = '@cd_ct_custo'
        ParamType = ptInput
      end>
  end
  object qry_tot_distr_gerRM_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT  ( ROUND( ISNULL( L.VL_LANCAMENTO, 0), 2) -'
      '        ( ROUND( ISNULL('
      '        ( SELECT SUM(G.VL_LANCAMENTO)'
      '          FROM   TCTAAPAGAR_GER G'
      '          WHERE  G.CD_UNID_NEG    = L.CD_UNID_NEG    AND'
      '                 G.DT_CTAAPAGAR   = L.DT_CTAAPAGAR   AND'
      '                 G.NR_CTAAPAGAR   = L.NR_CTAAPAGAR   AND'
      '                 G.CD_CT_CONTABIL = L.CD_CT_CONTABIL AND'
      '                 G.CD_FILIAL      = L.CD_FILIAL AND'
      
        '                 G.CD_CT_CUSTO    = L.CD_CT_CUSTO ), 0 ), 2 ) ) ' +
        ') ERRO_DISTR_GER'
      'FROM TCTAAPAGAR_LANC L'
      'JOIN TCONTABIL_PLANO C'
      '  ON ( L.CD_CT_CONTABIL = C.CD_CT_CONTABIL )'
      'WHERE C.IN_DISTRIBUI   = '#39'1'#39' AND'
      '      L.CD_UNID_NEG  = :CD_UNID_NEG  AND'
      '      L.DT_CTAAPAGAR = :DT_CTAAPAGAR AND'
      '      L.NR_CTAAPAGAR = :NR_CTAAPAGAR ')
    Left = 562
    Top = 9
    ParamData = <
      item
        DataType = ftString
        Name = 'CD_UNID_NEG'
        ParamType = ptUnknown
      end
      item
        DataType = ftDateTime
        Name = 'DT_CTAAPAGAR'
        ParamType = ptUnknown
        Value = 36410d
      end
      item
        DataType = ftString
        Name = 'NR_CTAAPAGAR'
        ParamType = ptUnknown
        Value = '001'
      end>
    object qry_tot_distr_gerRM_ERRO_DISTR_GER: TFloatField
      FieldName = 'ERRO_DISTR_GER'
    end
  end
  object qry_tot_distr_lanc_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      
        'SELECT ( ROUND( ISNULL( ( P.VL_DESPESA + P.VL_ACRESCIMO - P.VL_D' +
        'ESCONTO - P.VL_IR - P.VL_INSS ), 0 ), 2 ) -'
      '       ( ROUND( ISNULL('
      '           ( SELECT SUM(L.VL_LANCAMENTO)'
      '             FROM TCTAAPAGAR_LANC L'
      '             WHERE P.CD_UNID_NEG    = L.CD_UNID_NEG    AND'
      '                   P.DT_CTAAPAGAR   = L.DT_CTAAPAGAR   AND'
      
        '                   P.NR_CTAAPAGAR   = L.NR_CTAAPAGAR) , 0) , 2) ' +
        ') ) ERRO_DISTR_LANC'
      'FROM TCTAAPAGAR P'
      'WHERE P.CD_UNID_NEG  = :CD_UNID_NEG  AND'
      '      P.DT_CTAAPAGAR = :DT_CTAAPAGAR AND'
      '      P.NR_CTAAPAGAR = :NR_CTAAPAGAR')
    Left = 646
    Top = 9
    ParamData = <
      item
        DataType = ftString
        Name = 'CD_UNID_NEG'
        ParamType = ptUnknown
      end
      item
        DataType = ftDateTime
        Name = 'DT_CTAAPAGAR'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'NR_CTAAPAGAR'
        ParamType = ptUnknown
      end>
    object qry_tot_distr_lanc_ERRO_DISTR_LANC: TFloatField
      FieldName = 'ERRO_DISTR_LANC'
    end
  end
  object ds_lista: TDataSource
    DataSet = qry_lista_
    Left = 46
    Top = 58
  end
  object qry_lista_: TQuery
    AfterOpen = qry_lista_AfterOpen
    AfterScroll = qry_lista_AfterScroll
    OnCalcFields = qry_lista_CalcFields
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      
        'SELECT A.CD_UNID_NEG, A.DT_CTAAPAGAR, A.NR_CTAAPAGAR, A.NR_CTAAP' +
        'AGAR_SELECIONADO,A.NR_TITULO,'
      '( isnull(A.VL_LIQUIDO,0) ) VL_PAGAMENTO,'
      'A.DT_VENCIMENTO, A.DT_PAGAMENTO, F.AP_FAVORECIDO AP_FORNECEDOR,'
      'F2.AP_FAVORECIDO FAVORECIDO, A.IN_CANCELADO, A.IN_DISTRIBUICAO,'
      
        'A.IN_LIBERADO, A.CD_FAVORECIDO, A.TP_PAGAMENTO, A.NR_REF, A.DT_M' +
        'ONTAGEM, A.STATUS, A.IN_LANC_PROVISIONADO, A.CD_BANCO, A.IN_SELE' +
        'CIONADO'
      'FROM TCTAAPAGAR A (NOLOCK),'
      'TFAVORECIDO F, TFAVORECIDO F2'
      'WHERE'
      'A.DT_CTAAPAGAR'
      'BETWEEN :DT_INICIO AND :DT_FIM AND'
      'A.CD_UNID_NEG = :CD_UNID_NEG AND'
      'A.CD_FORNECEDOR *= F.CD_FAVORECIDO and'
      'A.CD_FAVORECIDO *= F2.CD_FAVORECIDO'
      'ORDER BY'
      'A.DT_CTAAPAGAR'
      ' '
      ' ')
    Left = 121
    Top = 58
    ParamData = <
      item
        DataType = ftDateTime
        Name = 'DT_INICIO'
        ParamType = ptUnknown
      end
      item
        DataType = ftDateTime
        Name = 'DT_FIM'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'CD_UNID_NEG'
        ParamType = ptUnknown
      end>
    object qry_lista_DT_CTAAPAGAR: TDateTimeField
      DisplayLabel = 'Lan'#231'amento'
      FieldName = 'DT_CTAAPAGAR'
    end
    object qry_lista_NR_CTAAPAGAR: TStringField
      DisplayLabel = 'N'#186
      FieldName = 'NR_CTAAPAGAR'
      Size = 3
    end
    object qry_lista_VL_PAGAMENTO: TFloatField
      DisplayLabel = 'Valor'
      FieldName = 'VL_PAGAMENTO'
      DisplayFormat = '#0,.00'
      EditFormat = '#0,.00'
    end
    object qry_lista_DT_VENCIMENTO: TDateTimeField
      DisplayLabel = 'Vencimento'
      FieldName = 'DT_VENCIMENTO'
    end
    object qry_lista_DT_PAGAMENTO: TDateTimeField
      DisplayLabel = 'Pagamento'
      FieldName = 'DT_PAGAMENTO'
    end
    object qry_lista_AP_FORNECEDOR: TStringField
      FieldName = 'AP_FORNECEDOR'
      Size = 10
    end
    object qry_lista_IN_CANCELADO: TStringField
      FieldName = 'IN_CANCELADO'
      Size = 1
    end
    object qry_lista_IN_DISTRIBUICAO: TStringField
      FieldName = 'IN_DISTRIBUICAO'
      Size = 1
    end
    object qry_lista_IN_LIBERADO: TStringField
      FieldName = 'IN_LIBERADO'
      Size = 1
    end
    object qry_lista_LookDistribuicao: TStringField
      FieldKind = fkLookup
      FieldName = 'LookDistribuicao'
      LookupDataSet = tbl_yesno_
      LookupKeyFields = 'CD_YESNO'
      LookupResultField = 'TX_YESNO'
      KeyFields = 'IN_DISTRIBUICAO'
      Size = 3
      Lookup = True
    end
    object qry_lista_LookLiberado: TStringField
      FieldKind = fkLookup
      FieldName = 'LookLiberado'
      LookupDataSet = tbl_yesno_
      LookupKeyFields = 'CD_YESNO'
      LookupResultField = 'TX_YESNO'
      KeyFields = 'IN_LIBERADO'
      Size = 3
      Lookup = True
    end
    object qry_lista_CD_UNID_NEG: TStringField
      FieldName = 'CD_UNID_NEG'
      Size = 2
    end
    object qry_lista_NR_TITULO: TStringField
      FieldName = 'NR_TITULO'
      Size = 15
    end
    object qry_lista_CD_FAVORECIDO: TStringField
      FieldName = 'CD_FAVORECIDO'
      FixedChar = True
      Size = 5
    end
    object qry_lista_TP_PAGAMENTO: TStringField
      FieldName = 'TP_PAGAMENTO'
      FixedChar = True
      Size = 1
    end
    object qry_lista_NR_REF: TStringField
      FieldName = 'NR_REF'
      FixedChar = True
      Size = 3
    end
    object qry_lista_DT_MONTAGEM: TDateTimeField
      DisplayLabel = 'Dt. Montagem'
      FieldName = 'DT_MONTAGEM'
    end
    object qry_lista_calcTP_PAGTO: TStringField
      FieldKind = fkCalculated
      FieldName = 'calcTP_PAGTO'
      Size = 15
      Calculated = True
    end
    object qry_lista_FAVORECIDO: TStringField
      FieldName = 'FAVORECIDO'
      FixedChar = True
      Size = 10
    end
    object qry_lista_STATUS: TStringField
      FieldName = 'STATUS'
      FixedChar = True
      Size = 2
    end
    object qry_lista_calcStatus: TStringField
      DisplayLabel = 'Status'
      FieldKind = fkLookup
      FieldName = 'calcStatus'
      LookupDataSet = qry_status_solic_adm_
      LookupKeyFields = 'CODIGO'
      LookupResultField = 'DESCRICAO'
      KeyFields = 'STATUS'
      Size = 30
      Lookup = True
    end
    object qry_lista_IN_LANC_PROVISIONADO: TStringField
      FieldName = 'IN_LANC_PROVISIONADO'
      FixedChar = True
      Size = 1
    end
    object qry_lista_LookLancProvisionado: TStringField
      FieldKind = fkLookup
      FieldName = 'LookLancProvisionado'
      LookupDataSet = tbl_yesno_
      LookupKeyFields = 'CD_YESNO'
      LookupResultField = 'TX_YESNO'
      KeyFields = 'IN_LANC_PROVISIONADO'
      Size = 4
      Lookup = True
    end
    object qry_lista_CD_BANCO: TStringField
      FieldName = 'CD_BANCO'
      FixedChar = True
      Size = 3
    end
    object qry_lista_calcIN_SELECIONADO: TStringField
      FieldKind = fkCalculated
      FieldName = 'calcIN_SELECIONADO'
      Size = 1
      Calculated = True
    end
    object qry_lista_IN_SELECIONADO: TStringField
      FieldName = 'IN_SELECIONADO'
      FixedChar = True
      Size = 1
    end
    object qry_lista_NR_CTAAPAGAR_SELECIONADO: TStringField
      FieldName = 'NR_CTAAPAGAR_SELECIONADO'
      FixedChar = True
      Size = 3
    end
  end
  object sp_contabiliza_ctaapagar: TStoredProc
    DatabaseName = 'DBBROKER'
    StoredProcName = 'dbo.sp_contabiliza_ctaapagar'
    Left = 725
    Top = 9
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
        Name = '@nr_contab'
        ParamType = ptOutput
      end>
  end
  object qry_fav_: TQuery
    DatabaseName = 'DBBROKER'
    DataSource = ds_ctaapagar
    SQL.Strings = (
      'SELECT F.CD_FAVORECIDO, F.NM_FAVORECIDO, F.IN_CONTROLA_IR,'
      
        '       F.CD_TIPO_PESSOA, F.CGC_EMPRESA, F.CPF_EMPRESA, F.AP_FAVO' +
        'RECIDO,'
      '       B.NR_BANCO, B.CD_AGENCIA, B.NR_CONTA, B.DAC_AGENCIA'
      'FROM   TFAVORECIDO F, TBANCO B'
      'WHERE  F.CD_BANCO *= B.CD_BANCO AND'
      '       F.CD_FAVORECIDO = :CD_FORNECEDOR')
    Left = 562
    Top = 107
    ParamData = <
      item
        DataType = ftString
        Name = 'CD_FORNECEDOR'
        ParamType = ptUnknown
        Size = 6
      end>
    object qry_fav_CD_FAVORECIDO: TStringField
      FieldName = 'CD_FAVORECIDO'
      Origin = 'TFAVORECIDO.CD_FAVORECIDO'
      Size = 5
    end
    object qry_fav_NM_FAVORECIDO: TStringField
      FieldName = 'NM_FAVORECIDO'
      Origin = 'TFAVORECIDO.NM_FAVORECIDO'
      Size = 50
    end
    object qry_fav_IN_CONTROLA_IR: TBooleanField
      FieldName = 'IN_CONTROLA_IR'
      Origin = 'TFAVORECIDO.IN_CONTROLA_IR'
    end
    object qry_fav_CD_TIPO_PESSOA: TStringField
      FieldName = 'CD_TIPO_PESSOA'
      Origin = 'TFAVORECIDO.CD_TIPO_PESSOA'
      Size = 1
    end
    object qry_fav_CGC_EMPRESA: TStringField
      FieldName = 'CGC_EMPRESA'
      Origin = 'TFAVORECIDO.CGC_EMPRESA'
      Size = 14
    end
    object qry_fav_CPF_EMPRESA: TStringField
      FieldName = 'CPF_EMPRESA'
      Origin = 'TFAVORECIDO.CPF_EMPRESA'
      Size = 11
    end
    object qry_fav_AP_FAVORECIDO: TStringField
      FieldName = 'AP_FAVORECIDO'
      Origin = 'TFAVORECIDO.AP_FAVORECIDO'
      Size = 10
    end
    object qry_fav_NR_BANCO: TStringField
      FieldName = 'NR_BANCO'
      Size = 3
    end
    object qry_fav_CD_AGENCIA: TStringField
      FieldName = 'CD_AGENCIA'
      Size = 5
    end
    object qry_fav_NR_CONTA: TStringField
      FieldName = 'NR_CONTA'
      Size = 10
    end
    object qry_fav_DAC_AGENCIA: TStringField
      FieldName = 'DAC_AGENCIA'
      Size = 1
    end
  end
  object sp_distribui_ctaapagar: TStoredProc
    DatabaseName = 'DBBROKER'
    Left = 725
    Top = 107
  end
  object qry_caixa_ctrl_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT MAX(DT_MOVIMENTO) + 1 DT_MOVIMENTO'
      'FROM   TCAIXA_CONTROLE')
    Left = 466
    Top = 303
  end
  object qry_cheque_adm_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT COUNT(*) AS TOT_CHEQUE'
      'FROM   TADM'
      'WHERE  DT_CTAAPAGAR = :DT_CTAAPAGAR AND'
      '       NR_CTAAPAGAR = :NR_CTAAPAGAR AND'
      '       CD_FAVORECIDO=:CD_FAVORECIDO AND'
      '       CD_STATUS_ADM <> '#39'4'#39'  AND '
      '       CD_UNID_NEG=:CD_UNID_NEG')
    Left = 466
    Top = 451
    ParamData = <
      item
        DataType = ftDateTime
        Name = 'DT_CTAAPAGAR'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'NR_CTAAPAGAR'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'CD_FAVORECIDO'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'CD_UNID_NEG'
        ParamType = ptUnknown
      end>
  end
  object qry_ctaapagar_: TQuery
    CachedUpdates = True
    AfterOpen = qry_ctaapagar_AfterOpen
    AfterInsert = qry_ctaapagar_AfterInsert
    AfterEdit = qry_ctaapagar_AfterEdit
    BeforePost = qry_ctaapagar_BeforePost
    AfterPost = qry_ctaapagar_AfterPost
    AfterDelete = qry_ctaapagar_AfterDelete
    AfterScroll = qry_ctaapagar_AfterScroll
    OnCalcFields = qry_ctaapagar_CalcFields
    DatabaseName = 'DBBROKER'
    RequestLive = True
    SQL.Strings = (
      'SELECT *'
      'FROM TCTAAPAGAR'
      'WHERE '
      'CD_UNID_NEG  = :CD_UNID_NEG  AND'
      'DT_CTAAPAGAR = :DT_CTAAPAGAR AND'
      'NR_CTAAPAGAR = :NR_CTAAPAGAR')
    UpdateObject = upd_ctaapagar_
    Left = 120
    Top = 107
    ParamData = <
      item
        DataType = ftString
        Name = 'CD_UNID_NEG'
        ParamType = ptInput
      end
      item
        DataType = ftDateTime
        Name = 'DT_CTAAPAGAR'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'NR_CTAAPAGAR'
        ParamType = ptInput
      end>
    object qry_ctaapagar_DT_CTAAPAGAR: TDateTimeField
      DisplayLabel = 'Lan'#231'amento'
      FieldName = 'DT_CTAAPAGAR'
      Origin = 'TCTAAPAGAR.DT_CTAAPAGAR'
      DisplayFormat = 'dd/mm/yyyy'
      EditMask = '99/99/9999;1;_'
    end
    object qry_ctaapagar_NR_CTAAPAGAR: TStringField
      DisplayLabel = 'N'#186
      FieldName = 'NR_CTAAPAGAR'
      Origin = 'TCTAAPAGAR.DT_CTAAPAGAR'
      Size = 3
    end
    object qry_ctaapagar_CD_USUARIO: TStringField
      FieldName = 'CD_USUARIO'
      Origin = 'TCTAAPAGAR.CD_USUARIO'
      Size = 4
    end
    object qry_ctaapagar_CD_FORNECEDOR: TStringField
      FieldName = 'CD_FORNECEDOR'
      Origin = 'TCTAAPAGAR.CD_FORNECEDOR'
      Size = 5
    end
    object qry_ctaapagar_NM_HISTORICO: TStringField
      FieldName = 'NM_HISTORICO'
      Origin = 'TCTAAPAGAR.NM_HISTORICO'
      Size = 180
    end
    object qry_ctaapagar_CalcPagamento: TFloatField
      FieldKind = fkCalculated
      FieldName = 'CalcPagamento'
      DisplayFormat = '#0,.00'
      EditFormat = '#0.00'
      Calculated = True
    end
    object qry_ctaapagar_CalcValor: TFloatField
      DisplayLabel = 'Valor'
      FieldKind = fkCalculated
      FieldName = 'CalcValor'
      DisplayFormat = '#0,.00'
      EditFormat = '#0.00'
      Calculated = True
    end
    object qry_ctaapagar_DT_VENCIMENTO: TDateTimeField
      DisplayLabel = 'Vencimento'
      FieldName = 'DT_VENCIMENTO'
      Origin = 'TCTAAPAGAR.DT_VENCIMENTO'
      DisplayFormat = 'dd/mm/yyyy'
      EditMask = '99/99/9999;1;_'
    end
    object qry_ctaapagar_DT_PAGAMENTO: TDateTimeField
      DisplayLabel = 'Pagamento'
      FieldName = 'DT_PAGAMENTO'
      Origin = 'TCTAAPAGAR.DT_PAGAMENTO'
      DisplayFormat = 'dd/mm/yyyy'
      EditMask = '99/99/9999;1;_'
    end
    object qry_ctaapagar_CD_FAVORECIDO: TStringField
      FieldName = 'CD_FAVORECIDO'
      Origin = 'TCTAAPAGAR.CD_FAVORECIDO'
      Size = 5
    end
    object qry_ctaapagar_TP_PAGAMENTO: TStringField
      FieldName = 'TP_PAGAMENTO'
      Origin = 'TCTAAPAGAR.TP_PAGAMENTO'
      Size = 1
    end
    object qry_ctaapagar_CD_BARRAS: TStringField
      FieldName = 'CD_BARRAS'
      Origin = 'TCTAAPAGAR.CD_BARRAS'
      Size = 44
    end
    object qry_ctaapagar_CD_BANCO: TStringField
      FieldName = 'CD_BANCO'
      Origin = 'TCTAAPAGAR.CD_BANCO'
      Size = 3
    end
    object qry_ctaapagar_NR_CHEQUE: TStringField
      FieldName = 'NR_CHEQUE'
      Origin = 'TCTAAPAGAR.NR_CHEQUE'
      Size = 6
    end
    object qry_ctaapagar_NR_DOC_BCO: TStringField
      FieldName = 'NR_DOC_BCO'
      Origin = 'TCTAAPAGAR.NR_DOC_BCO'
      Size = 15
    end
    object qry_ctaapagar_IN_IMP_CHEQUE: TStringField
      FieldName = 'IN_IMP_CHEQUE'
      Origin = 'TCTAAPAGAR.IN_IMP_CHEQUE'
      Size = 1
    end
    object qry_ctaapagar_CD_STATUS_CHEQUE: TStringField
      FieldName = 'CD_STATUS_CHEQUE'
      Origin = 'TCTAAPAGAR.CD_STATUS_CHEQUE'
      Size = 1
    end
    object qry_ctaapagar_IN_CANCELADO: TStringField
      FieldName = 'IN_CANCELADO'
      Origin = 'TCTAAPAGAR.IN_CANCELADO'
      Size = 1
    end
    object qry_ctaapagar_CD_CANCELADOR: TStringField
      FieldName = 'CD_CANCELADOR'
      Origin = 'TCTAAPAGAR.CD_CANCELADOR'
      Size = 4
    end
    object qry_ctaapagar_DT_CANCELAMENTO: TDateTimeField
      FieldName = 'DT_CANCELAMENTO'
      Origin = 'TCTAAPAGAR.DT_CANCELAMENTO'
      DisplayFormat = 'dd/mm/yyyy'
      EditMask = '99/99/9999;1;_'
    end
    object qry_ctaapagar_IN_LIBERADO: TStringField
      FieldName = 'IN_LIBERADO'
      Origin = 'TCTAAPAGAR.IN_LIBERADO'
      Size = 1
    end
    object qry_ctaapagar_CD_LIBERADOR: TStringField
      FieldName = 'CD_LIBERADOR'
      Origin = 'TCTAAPAGAR.CD_LIBERADOR'
      Size = 4
    end
    object qry_ctaapagar_DT_LIBERACAO: TDateTimeField
      FieldName = 'DT_LIBERACAO'
      Origin = 'TCTAAPAGAR.DT_LIBERACAO'
      DisplayFormat = 'dd/mm/yyyy'
      EditMask = '99/99/9999;1;_'
    end
    object qry_ctaapagar_IN_TRANSFERIDO: TStringField
      FieldName = 'IN_TRANSFERIDO'
      Origin = 'TCTAAPAGAR.IN_TRANSFERIDO'
      Size = 1
    end
    object qry_ctaapagar_CD_USUARIO_GER: TStringField
      FieldName = 'CD_USUARIO_GER'
      Origin = 'TCTAAPAGAR.CD_USUARIO_GER'
      Size = 4
    end
    object qry_ctaapagar_TP_CD_BARRAS: TStringField
      FieldName = 'TP_CD_BARRAS'
      Origin = 'TCTAAPAGAR.DT_CTAAPAGAR'
      Size = 1
    end
    object qry_ctaapagar_IN_DISTRIBUICAO: TStringField
      FieldName = 'IN_DISTRIBUICAO'
      Origin = 'TCTAAPAGAR.CD_COLIGADA'
      Size = 1
    end
    object qry_ctaapagar_IN_CONTABILIZADO: TStringField
      FieldName = 'IN_CONTABILIZADO'
      Origin = 'TCTAAPAGAR.CD_COLIGADA'
      Size = 1
    end
    object qry_ctaapagar_CD_LT_CONTAB: TStringField
      FieldName = 'CD_LT_CONTAB'
      Origin = 'TCTAAPAGAR.DT_CTAAPAGAR'
      Size = 4
    end
    object qry_ctaapagar_CD_LT_CONTAB_EXT: TStringField
      FieldName = 'CD_LT_CONTAB_EXT'
      Origin = 'TCTAAPAGAR.NR_CTAAPAGAR'
      Size = 4
    end
    object qry_ctaapagar_LookFornecedor: TStringField
      DisplayLabel = 'Fornecedor'
      FieldKind = fkLookup
      FieldName = 'LookFornecedor'
      LookupDataSet = qry_favorecido_
      LookupKeyFields = 'CD_FAVORECIDO'
      LookupResultField = 'NM_FAVORECIDO'
      KeyFields = 'CD_FORNECEDOR'
      Size = 50
      Lookup = True
    end
    object qry_ctaapagar_LookUsuario: TStringField
      DisplayLabel = 'Usu'#225'rio'
      FieldKind = fkLookup
      FieldName = 'LookUsuario'
      LookupDataSet = qry_usuario_
      LookupKeyFields = 'CD_USUARIO'
      LookupResultField = 'AP_USUARIO'
      KeyFields = 'CD_USUARIO'
      Size = 50
      Lookup = True
    end
    object qry_ctaapagar_LookFavorecido: TStringField
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
    object qry_ctaapagar_LookBanco: TStringField
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
    object qry_ctaapagar_LookUsuarioGer: TStringField
      FieldKind = fkLookup
      FieldName = 'LookUsuarioGer'
      LookupDataSet = qry_usuario_
      LookupKeyFields = 'CD_USUARIO'
      LookupResultField = 'AP_USUARIO'
      KeyFields = 'CD_USUARIO_GER'
      Size = 50
      Lookup = True
    end
    object qry_ctaapagar_LookControlaIR: TBooleanField
      FieldKind = fkLookup
      FieldName = 'LookControlaIR'
      LookupDataSet = qry_favorecido_
      LookupKeyFields = 'CD_FAVORECIDO'
      LookupResultField = 'IN_CONTROLA_IR'
      KeyFields = 'CD_FORNECEDOR'
      Lookup = True
    end
    object qry_ctaapagar_CD_UNID_NEG: TStringField
      FieldName = 'CD_UNID_NEG'
      Origin = 'TCTAAPAGAR.DT_CTAAPAGAR'
      Size = 2
    end
    object qry_ctaapagar_IN_OPERACIONAL: TStringField
      FieldName = 'IN_OPERACIONAL'
      Origin = 'TCTAAPAGAR.NR_CTAAPAGAR'
      Size = 1
    end
    object qry_ctaapagar_NR_REF: TStringField
      FieldName = 'NR_REF'
      Origin = 'TCTAAPAGAR.CD_USUARIO'
      Size = 3
    end
    object qry_ctaapagar_NR_TITULO: TStringField
      FieldName = 'NR_TITULO'
      Origin = 'TCTAAPAGAR.DT_CTAAPAGAR'
      Size = 15
    end
    object qry_ctaapagar_CD_COLIGADA: TStringField
      FieldName = 'CD_COLIGADA'
      Origin = 'DBBROKER.TCTAAPAGAR.CD_COLIGADA'
      FixedChar = True
      Size = 2
    end
    object qry_ctaapagar_DT_MONTAGEM: TDateTimeField
      FieldName = 'DT_MONTAGEM'
      Origin = 'DBBROKER.TCTAAPAGAR.DT_MONTAGEM'
    end
    object qry_ctaapagar_STATUS: TStringField
      DisplayLabel = 'Status'
      FieldName = 'STATUS'
      Origin = 'DBBROKER.TCTAAPAGAR.STATUS'
      FixedChar = True
      Size = 2
    end
    object qry_ctaapagar_LookStatus: TStringField
      DisplayLabel = 'Status'
      FieldKind = fkLookup
      FieldName = 'LookStatus'
      LookupDataSet = qry_status_solic_adm_
      LookupKeyFields = 'CODIGO'
      LookupResultField = 'DESCRICAO'
      KeyFields = 'STATUS'
      LookupCache = True
      Lookup = True
    end
    object qry_ctaapagar_VL_LIQUIDO: TFloatField
      FieldName = 'VL_LIQUIDO'
      Origin = 'DBBROKER.TCTAAPAGAR.VL_LIQUIDO'
    end
    object qry_ctaapagar_DT_EMISSAO_DOC: TDateTimeField
      FieldName = 'DT_EMISSAO_DOC'
      Origin = 'DBBROKER.TCTAAPAGAR.DT_EMISSAO_DOC'
    end
    object qry_ctaapagar_IN_PISCOFINS: TStringField
      FieldName = 'IN_PISCOFINS'
      Origin = 'DBBROKER.TCTAAPAGAR.IN_PISCOFINS'
      FixedChar = True
      Size = 1
    end
    object qry_ctaapagar_VL_DESPESA: TFloatField
      FieldName = 'VL_DESPESA'
      Origin = 'DBBROKER.TCTAAPAGAR.VL_DESPESA'
      DisplayFormat = '#0,.00'
      EditFormat = '#0,.00'
    end
    object qry_ctaapagar_VL_DESCONTO: TFloatField
      FieldName = 'VL_DESCONTO'
      Origin = 'DBBROKER.TCTAAPAGAR.VL_DESCONTO'
    end
    object qry_ctaapagar_VL_ACRESCIMO: TFloatField
      FieldName = 'VL_ACRESCIMO'
      Origin = 'DBBROKER.TCTAAPAGAR.VL_ACRESCIMO'
    end
    object qry_ctaapagar_VL_IR: TFloatField
      FieldName = 'VL_IR'
      Origin = 'DBBROKER.TCTAAPAGAR.VL_IR'
    end
    object qry_ctaapagar_VL_INSS: TFloatField
      FieldName = 'VL_INSS'
      Origin = 'DBBROKER.TCTAAPAGAR.VL_INSS'
    end
    object qry_ctaapagar_VL_PISCOFINS: TFloatField
      FieldName = 'VL_PISCOFINS'
      Origin = 'DBBROKER.TCTAAPAGAR.VL_PISCOFINS'
    end
    object qry_ctaapagar_VL_ISS: TFloatField
      FieldName = 'VL_ISS'
      Origin = 'DBBROKER.TCTAAPAGAR.VL_ISS'
    end
    object qry_ctaapagar_IN_LANC_PROVISIONADO: TStringField
      FieldName = 'IN_LANC_PROVISIONADO'
      Origin = 'DBBROKER.TCTAAPAGAR.IN_LANC_PROVISIONADO'
      FixedChar = True
      Size = 1
    end
    object qry_ctaapagar_IN_SELECIONADO: TStringField
      FieldName = 'IN_SELECIONADO'
      Origin = 'DBBROKER.TCTAAPAGAR.IN_SELECIONADO'
      FixedChar = True
      Size = 1
    end
  end
  object qry_unidade_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT CD_UNID_NEG, NM_UNID_NEG'
      'FROM TUNID_NEG'
      'WHERE CD_UNID_NEG <> '#39#39)
    Left = 466
    Top = 107
    object qry_unidade_CD_UNID_NEG: TStringField
      FieldName = 'CD_UNID_NEG'
      Origin = 'TUNID_NEG.CD_UNID_NEG'
      Size = 2
    end
    object qry_unidade_NM_UNID_NEG: TStringField
      FieldName = 'NM_UNID_NEG'
      Origin = 'TUNID_NEG.NM_UNID_NEG'
      Size = 50
    end
  end
  object qry_param_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT CD_SISTEMA_CONTABIL'
      'FROM   TPARAMETROS')
    Left = 562
    Top = 451
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
    Left = 562
    Top = 156
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
  object qry_ct_contabilRM_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT CD_CT_CONTABIL, NM_CT_CONTABIL, IN_DISTRIBUI'
      'FROM   TCONTABIL_PLANO'
      'WHERE  CD_COLIGADA = '#39'01'#39
      'ORDER BY'
      'CD_CT_CONTABIL')
    Left = 562
    Top = 58
    object qry_ct_contabilRM_CD_CT_CONTABIL: TStringField
      FieldName = 'CD_CT_CONTABIL'
      Origin = 'DBBROKER.TCONTABIL_PLANO.CD_CT_CONTABIL'
      FixedChar = True
      Size = 12
    end
    object qry_ct_contabilRM_NM_CT_CONTABIL: TStringField
      FieldName = 'NM_CT_CONTABIL'
      Origin = 'TCONTABIL_PLANO.NM_CT_CONTABIL'
      Size = 40
    end
    object qry_ct_contabilRM_IN_DISTRIBUI: TStringField
      FieldName = 'IN_DISTRIBUI'
      Origin = 'TCONTABIL_PLANO.IN_DISTRIBUI'
      Size = 1
    end
  end
  object qry_ct_gerencial_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT CD_CT_GERENCIAL, NM_CT_GERENCIAL'
      'FROM   TCT_GERENCIAL')
    Left = 466
    Top = 9
    object qry_ct_gerencial_CD_CT_GERENCIAL: TStringField
      FieldName = 'CD_CT_GERENCIAL'
      Origin = 'TCT_GERENCIAL.CD_CT_GERENCIAL'
      Size = 4
    end
    object qry_ct_gerencial_NM_CT_GERENCIAL: TStringField
      FieldName = 'NM_CT_GERENCIAL'
      Origin = 'TCT_GERENCIAL.NM_CT_GERENCIAL'
    end
  end
  object qry_tot_distr_ger_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT  ( ROUND( ISNULL( L.VL_LANCAMENTO, 0), 2) -'
      '        ( ROUND( ISNULL('
      '        ( SELECT SUM(G.VL_LANCAMENTO)'
      '          FROM   TCTAAPAGAR_GER G'
      '          WHERE  G.CD_UNID_NEG    = L.CD_UNID_NEG    AND'
      '                 G.DT_CTAAPAGAR   = L.DT_CTAAPAGAR   AND'
      '                 G.NR_CTAAPAGAR   = L.NR_CTAAPAGAR   AND'
      '                 G.CD_CT_CONTABIL = L.CD_CT_CONTABIL AND'
      '                 G.CD_FILIAL      = L.CD_FILIAL AND'
      
        '                 G.CD_CT_CUSTO    = L.CD_CT_CUSTO ), 0 ), 2 ) ) ' +
        ') ERRO_DISTR_GER'
      'FROM TCTAAPAGAR_LANC L'
      'JOIN TCT_CONTABIL C'
      '  ON ( L.CD_CT_CONTABIL = C.CD_CT_CONTABIL )'
      'WHERE C.IN_DISTRIBUI   = '#39'1'#39' AND'
      '      L.CD_UNID_NEG  = :CD_UNID_NEG  AND'
      '      L.DT_CTAAPAGAR = :DT_CTAAPAGAR AND'
      '      L.NR_CTAAPAGAR = :NR_CTAAPAGAR')
    Left = 562
    Top = 401
    ParamData = <
      item
        DataType = ftString
        Name = 'CD_UNID_NEG'
        ParamType = ptUnknown
      end
      item
        DataType = ftDateTime
        Name = 'DT_CTAAPAGAR'
        ParamType = ptUnknown
        Value = 36410d
      end
      item
        DataType = ftString
        Name = 'NR_CTAAPAGAR'
        ParamType = ptUnknown
        Value = '001'
      end>
    object qry_tot_distr_ger_ERRO_DISTR_GER: TFloatField
      FieldName = 'ERRO_DISTR_GER'
    end
  end
  object sp_cria_ctaapagar: TStoredProc
    DatabaseName = 'DBBROKER'
    StoredProcName = 'dbo.sp_cria_ctaapagar'
    ParamBindMode = pbByNumber
    Left = 725
    Top = 206
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
        DataType = ftDateTime
        Name = '@dt_ctaapagar'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = '@nr_ctaapagar'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = '@qtde'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = '@NR_IDENTIFICADOR'
        ParamType = ptOutput
      end>
  end
  object qry_ctaapagar_vencto_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT NR_CTAAPAGAR, DT_VENCTO'
      'FROM TCTAAPAGAR_VENCTO'
      'WHERE NR_IDENTIFICADOR = :NR_IDENTIFICADOR'
      'AND CD_USUARIO =:CD_USUARIO'
      ''
      '')
    Left = 562
    Top = 303
    ParamData = <
      item
        DataType = ftInteger
        Name = 'NR_IDENTIFICADOR'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'CD_USUARIO'
        ParamType = ptUnknown
      end>
    object qry_ctaapagar_vencto_NR_CTAAPAGAR: TStringField
      FieldName = 'NR_CTAAPAGAR'
      Origin = 'TCTAAPAGAR_VENCTO.NR_CTAAPAGAR'
      Size = 3
    end
    object qry_ctaapagar_vencto_DT_VENCTO: TDateTimeField
      FieldName = 'DT_VENCTO'
      Origin = 'TCTAAPAGAR_VENCTO.DT_VENCTO'
    end
  end
  object qry_upd_ctaapagar_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'UPDATE TCTAAPAGAR'
      'SET    DT_VENCIMENTO = :DT_VENCIMENTO'
      'WHERE  CD_UNID_NEG  = :CD_UNID_NEG  AND'
      'DT_CTAAPAGAR = :DT_CTAAPAGAR AND'
      'NR_CTAAPAGAR = :NR_CTAAPAGAR')
    Left = 466
    Top = 156
    ParamData = <
      item
        DataType = ftDateTime
        Name = 'DT_VENCIMENTO'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'CD_UNID_NEG'
        ParamType = ptUnknown
      end
      item
        DataType = ftDateTime
        Name = 'DT_CTAAPAGAR'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'NR_CTAAPAGAR'
        ParamType = ptUnknown
      end>
  end
  object qry_del_ctaapagar_vencto_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'DELETE FROM TCTAAPAGAR_VENCTO'
      'WHERE CD_USUARIO = :CD_USUARIO')
    Left = 562
    Top = 351
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'CD_USUARIO'
        ParamType = ptUnknown
      end>
  end
  object ds_ctaapagar_lanc_processo_: TDataSource
    DataSet = qry_ctaapagar_lanc_processo_
    Left = 46
    Top = 303
  end
  object qry_ctaapagar_lanc_processo_: TQuery
    OnCalcFields = qry_ctaapagar_lanc_processo_CalcFields
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      
        'SELECT P.NR_PROCESSO, P.CD_ITEM_SOLIC_PAGTO, I.NM_ITEM, P.VL_ITE' +
        'M, E.AP_EMPRESA'
      
        'FROM   TCTAAPAGAR_LANC_PROCESSO P, TSOLIC_PAGTO S, TITEM I, TPRO' +
        'CESSO PR, TEMPRESA_NAC E'
      'WHERE  P.NR_PROCESSO = PR.NR_PROCESSO AND'
      '       PR.CD_CLIENTE = E.CD_EMPRESA AND'
      '       P.NR_PROCESSO = S.NR_PROCESSO AND'
      '       P.NR_LANC_SOLIC_PAGTO = S.NR_LANCAMENTO AND'
      '       P.CD_ITEM_SOLIC_PAGTO = S.CD_ITEM AND'
      '       P.CD_ITEM_SOLIC_PAGTO = I.CD_ITEM AND'
      '       P.CD_UNID_NEG = :CD_UNID_NEG AND'
      '       P.DT_CTAAPAGAR = :DT_CTAAPAGAR AND'
      '       P.NR_CTAAPAGAR = :NR_CTAAPAGAR')
    Left = 118
    Top = 302
    ParamData = <
      item
        DataType = ftString
        Name = 'CD_UNID_NEG'
        ParamType = ptUnknown
      end
      item
        DataType = ftDateTime
        Name = 'DT_CTAAPAGAR'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'NR_CTAAPAGAR'
        ParamType = ptUnknown
      end>
    object qry_ctaapagar_lanc_processo_NR_PROCESSO: TStringField
      FieldName = 'NR_PROCESSO'
      Origin = 'TCTAAPAGAR_LANC_PROCESSO.NR_PROCESSO'
      Size = 18
    end
    object qry_ctaapagar_lanc_processo_CD_ITEM_SOLIC_PAGTO: TStringField
      DisplayLabel = 'C'#243'd.'
      FieldName = 'CD_ITEM_SOLIC_PAGTO'
      Origin = 'TCTAAPAGAR_LANC_PROCESSO.CD_ITEM_SOLIC_PAGTO'
      Size = 3
    end
    object qry_ctaapagar_lanc_processo_NM_ITEM: TStringField
      DisplayLabel = 'Item'
      FieldName = 'NM_ITEM'
      Origin = 'TITEM.NM_ITEM'
      Size = 30
    end
    object qry_ctaapagar_lanc_processo_CalcNrProcesso: TStringField
      DisplayLabel = 'N'#186' Processo'
      FieldKind = fkCalculated
      FieldName = 'CalcNrProcesso'
      Calculated = True
    end
    object qry_ctaapagar_lanc_processo_VL_ITEM: TFloatField
      DisplayLabel = 'Valor'
      FieldName = 'VL_ITEM'
      Origin = 'TCTAAPAGAR_LANC_PROCESSO.NR_PROCESSO'
      DisplayFormat = '#0,.00'
      EditFormat = '#0,.00'
    end
    object qry_ctaapagar_lanc_processo_AP_EMPRESA: TStringField
      DisplayLabel = 'Cliente'
      FieldName = 'AP_EMPRESA'
      Origin = 'TCTAAPAGAR_LANC_PROCESSO.NR_PROCESSO'
      Size = 10
    end
  end
  object sp_cast_ctaapagar: TStoredProc
    DatabaseName = 'DBBROKER'
    StoredProcName = 'dbo.sp_cast_ctaapagar'
    Left = 725
    Top = 58
    ParamData = <
      item
        DataType = ftInteger
        Name = 'Result'
        ParamType = ptResult
        Value = 0
      end
      item
        DataType = ftDateTime
        Name = '@dt_ctaapagar'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = '@nr_ctaapagar'
        ParamType = ptInput
      end>
  end
  object sp_canc_fat_cc: TStoredProc
    DatabaseName = 'DBBROKER'
    StoredProcName = 'dbo.sp_canc_fat_cc'
    Left = 725
    Top = 156
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
        DataType = ftDateTime
        Name = '@dt_ctaapagar'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = '@nr_ctaapagar'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = '@cd_usuario'
        ParamType = ptInput
      end>
  end
  object qry_item_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT CD_ITEM , NM_ITEM , TP_ITEM '
      '  FROM TITEM'
      '  WHERE IN_ATIVO = '#39'1'#39)
    Left = 466
    Top = 254
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
  object sp_cont_integracao_contabil4: TADOStoredProc
    ConnectionString = 
      'Provider=SQLOLEDB.1;Password=123;Persist Security Info=True;User' +
      ' ID=SA;Initial Catalog=BROKER;Data Source=CAMILA;Use Procedure f' +
      'or Prepare=1;Auto Translate=True;Packet Size=4096;Workstation ID' +
      '=CAMILA;Use Encryption for Data=False;Tag with column collation'
    CursorLocation = clUseServer
    LockType = ltReadOnly
    ProcedureName = 'SP_contabiliza_prov_pagto_adm'
    Parameters = <
      item
        Name = '@RETURN_VALUE'
        DataType = ftInteger
        Direction = pdReturnValue
        Precision = 10
        Value = Null
      end
      item
        Name = '@cd_unid_neg'
        Attributes = [paNullable]
        DataType = ftString
        Size = 2
        Value = Null
      end
      item
        Name = '@nr_cta_pagar'
        Attributes = [paNullable]
        DataType = ftString
        Size = 3
        Value = Null
      end
      item
        Name = '@cd_banco'
        Attributes = [paNullable]
        DataType = ftString
        Size = 3
        Value = Null
      end
      item
        Name = '@dt_movimento'
        Attributes = [paNullable]
        DataType = ftDateTime
        Value = Null
      end
      item
        Name = '@dt_pagto'
        Attributes = [paNullable]
        DataType = ftDateTime
        Value = Null
      end
      item
        Name = '@nr_docto'
        Attributes = [paNullable]
        DataType = ftString
        Size = 20
        Value = Null
      end>
    Left = 725
    Top = 254
  end
  object sp_cont_integracao_contabil: TStoredProc
    DatabaseName = 'DBBROKER'
    StoredProcName = 'dbo.SP_contabiliza_prov_pagto_adm'
    Left = 725
    Top = 303
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
        Name = '@nr_cta_pagar'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = '@cd_banco'
        ParamType = ptInput
      end
      item
        DataType = ftDateTime
        Name = '@dt_movimento'
        ParamType = ptInput
      end
      item
        DataType = ftDateTime
        Name = '@dt_pagto'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = '@nr_docto'
        ParamType = ptInput
      end>
  end
  object qry_custo_aux_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT * FROM TCONTABIL_CUSTO_AUX')
    Left = 562
    Top = 254
    object qry_custo_aux_CODCCUSTO: TStringField
      FieldName = 'CODCCUSTO'
      Origin = 'DBBROKER.TCONTABIL_CUSTO_AUX.CODCCUSTO'
      FixedChar = True
      Size = 25
    end
    object qry_custo_aux_NOME: TStringField
      FieldName = 'NOME'
      Origin = 'DBBROKER.TCONTABIL_CUSTO_AUX.NOME'
      FixedChar = True
      Size = 80
    end
    object qry_custo_aux_CODREDUZIDO: TStringField
      FieldName = 'CODREDUZIDO'
      Origin = 'DBBROKER.TCONTABIL_CUSTO_AUX.CODREDUZIDO'
      FixedChar = True
      Size = 25
    end
  end
  object SqlCustosContabil: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT * FROM TCONTABIL_CUSTO')
    Left = 466
    Top = 401
    object SqlCustosContabilCD_COLIGADA: TStringField
      FieldName = 'CD_COLIGADA'
      Origin = 'DBBROKER.TCONTABIL_CUSTO.CD_COLIGADA'
      FixedChar = True
      Size = 2
    end
    object SqlCustosContabilCD_CT_CUSTO: TStringField
      FieldName = 'CD_CT_CUSTO'
      Origin = 'DBBROKER.TCONTABIL_CUSTO.CD_CT_CUSTO'
      FixedChar = True
      Size = 4
    end
    object SqlCustosContabilNM_CT_CUSTO: TStringField
      FieldName = 'NM_CT_CUSTO'
      Origin = 'DBBROKER.TCONTABIL_CUSTO.NM_CT_CUSTO'
      FixedChar = True
      Size = 40
    end
  end
  object qry_ult_ref_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      
        'SELECT RIGHT( '#39'000'#39' + CONVERT( varchar, ( CONVERT( int, ISNULL( ' +
        'MAX( NR_REF ), '#39'000'#39' ) ) + 1 ) ), 3 ) ULT_REF'
      'FROM   TADM'
      'WHERE'
      '  CD_UNID_NEG = :CD_UNID_NEG and'
      
        '  DT_MONTAGEM = convert(datetime,convert(varchar,getdate(),103),' +
        '103)'
      '')
    Left = 466
    Top = 58
    ParamData = <
      item
        DataType = ftString
        Name = 'CD_UNID_NEG'
        ParamType = ptUnknown
      end>
    object qry_ult_ref_ULT_REF: TStringField
      FieldName = 'ULT_REF'
      Size = 3
    end
  end
  object qry_status_solic_adm_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT *'
      'FROM TSTATUS_SOLIC_PAGTO')
    Left = 353
    Top = 9
    object qry_status_solic_adm_CODIGO: TStringField
      FieldName = 'CODIGO'
      Origin = 'TSTATUS_SOLIC_PAGTO.CODIGO'
      Size = 2
    end
    object qry_status_solic_adm_DESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Origin = 'TSTATUS_SOLIC_PAGTO.DESCRICAO'
      Size = 30
    end
  end
  object ds_status_solic_adm: TDataSource
    DataSet = qry_status_solic_adm_
    Left = 289
    Top = 9
  end
  object SqlContasFornecedor: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'select CD_CT_CONTABIL, CD_RATEIO FROM TFAVORECIDO_CONTAS'
      'where'
      '  CD_FAVORECIDO =:CD_FAVORECIDO')
    Left = 466
    Top = 351
    ParamData = <
      item
        DataType = ftString
        Name = 'CD_FAVORECIDO'
        ParamType = ptUnknown
      end>
  end
  object upd_ctaapagar_: TUpdateSQL
    ModifySQL.Strings = (
      'update TCTAAPAGAR'
      'set'
      '  DT_CTAAPAGAR = :DT_CTAAPAGAR,'
      '  NR_CTAAPAGAR = :NR_CTAAPAGAR,'
      '  CD_USUARIO = :CD_USUARIO,'
      '  CD_FORNECEDOR = :CD_FORNECEDOR,'
      '  NM_HISTORICO = :NM_HISTORICO,'
      '  VL_DESPESA = :VL_DESPESA,'
      '  VL_DESCONTO = :VL_DESCONTO,'
      '  VL_ACRESCIMO = :VL_ACRESCIMO,'
      '  VL_IR = :VL_IR,'
      '  VL_INSS = :VL_INSS,'
      '  DT_VENCIMENTO = :DT_VENCIMENTO,'
      '  DT_PAGAMENTO = :DT_PAGAMENTO,'
      '  CD_FAVORECIDO = :CD_FAVORECIDO,'
      '  TP_PAGAMENTO = :TP_PAGAMENTO,'
      '  CD_BARRAS = :CD_BARRAS,'
      '  CD_BANCO = :CD_BANCO,'
      '  NR_CHEQUE = :NR_CHEQUE,'
      '  NR_DOC_BCO = :NR_DOC_BCO,'
      '  IN_IMP_CHEQUE = :IN_IMP_CHEQUE,'
      '  CD_STATUS_CHEQUE = :CD_STATUS_CHEQUE,'
      '  IN_CANCELADO = :IN_CANCELADO,'
      '  CD_CANCELADOR = :CD_CANCELADOR,'
      '  DT_CANCELAMENTO = :DT_CANCELAMENTO,'
      '  IN_LIBERADO = :IN_LIBERADO,'
      '  CD_LIBERADOR = :CD_LIBERADOR,'
      '  DT_LIBERACAO = :DT_LIBERACAO,'
      '  IN_TRANSFERIDO = :IN_TRANSFERIDO,'
      '  CD_USUARIO_GER = :CD_USUARIO_GER,'
      '  IN_DISTRIBUICAO = :IN_DISTRIBUICAO,'
      '  TP_CD_BARRAS = :TP_CD_BARRAS,'
      '  IN_CONTABILIZADO = :IN_CONTABILIZADO,'
      '  CD_LT_CONTAB = :CD_LT_CONTAB,'
      '  CD_LT_CONTAB_EXT = :CD_LT_CONTAB_EXT,'
      '  CD_UNID_NEG = :CD_UNID_NEG,'
      '  IN_OPERACIONAL = :IN_OPERACIONAL,'
      '  NR_REF = :NR_REF,'
      '  NR_TITULO = :NR_TITULO,'
      '  CD_COLIGADA = :CD_COLIGADA,'
      '  DT_MONTAGEM = :DT_MONTAGEM,'
      '  VL_PISCOFINS = :VL_PISCOFINS,'
      '  VL_ISS = :VL_ISS,'
      '  VL_LIQUIDO = :VL_LIQUIDO,'
      '  STATUS = :STATUS,'
      '  DT_EMISSAO_DOC = :DT_EMISSAO_DOC,'
      '  IN_PISCOFINS = :IN_PISCOFINS,'
      '  IN_LANC_PROVISIONADO = :IN_LANC_PROVISIONADO,'
      '  IN_SELECIONADO = :IN_SELECIONADO'
      'where'
      '  DT_CTAAPAGAR = :OLD_DT_CTAAPAGAR and'
      '  NR_CTAAPAGAR = :OLD_NR_CTAAPAGAR and'
      '  CD_UNID_NEG = :OLD_CD_UNID_NEG')
    InsertSQL.Strings = (
      'insert into TCTAAPAGAR'
      
        '  (DT_CTAAPAGAR, NR_CTAAPAGAR, CD_USUARIO, CD_FORNECEDOR, NM_HIS' +
        'TORICO, '
      
        '   VL_DESPESA, VL_DESCONTO, VL_ACRESCIMO, VL_IR, VL_INSS, DT_VEN' +
        'CIMENTO, '
      
        '   DT_PAGAMENTO, CD_FAVORECIDO, TP_PAGAMENTO, CD_BARRAS, CD_BANC' +
        'O, NR_CHEQUE, '
      
        '   NR_DOC_BCO, IN_IMP_CHEQUE, CD_STATUS_CHEQUE, IN_CANCELADO, CD' +
        '_CANCELADOR, '
      
        '   DT_CANCELAMENTO, IN_LIBERADO, CD_LIBERADOR, DT_LIBERACAO, IN_' +
        'TRANSFERIDO, '
      
        '   CD_USUARIO_GER, IN_DISTRIBUICAO, TP_CD_BARRAS, IN_CONTABILIZA' +
        'DO, CD_LT_CONTAB, '
      
        '   CD_LT_CONTAB_EXT, CD_UNID_NEG, IN_OPERACIONAL, NR_REF, NR_TIT' +
        'ULO, CD_COLIGADA, '
      
        '   DT_MONTAGEM, VL_PISCOFINS, VL_ISS, VL_LIQUIDO, STATUS, DT_EMI' +
        'SSAO_DOC, '
      '   IN_PISCOFINS, IN_LANC_PROVISIONADO, IN_SELECIONADO)'
      'values'
      
        '  (:DT_CTAAPAGAR, :NR_CTAAPAGAR, :CD_USUARIO, :CD_FORNECEDOR, :N' +
        'M_HISTORICO, '
      
        '   :VL_DESPESA, :VL_DESCONTO, :VL_ACRESCIMO, :VL_IR, :VL_INSS, :' +
        'DT_VENCIMENTO, '
      
        '   :DT_PAGAMENTO, :CD_FAVORECIDO, :TP_PAGAMENTO, :CD_BARRAS, :CD' +
        '_BANCO, '
      
        '   :NR_CHEQUE, :NR_DOC_BCO, :IN_IMP_CHEQUE, :CD_STATUS_CHEQUE, :' +
        'IN_CANCELADO, '
      
        '   :CD_CANCELADOR, :DT_CANCELAMENTO, :IN_LIBERADO, :CD_LIBERADOR' +
        ', :DT_LIBERACAO, '
      
        '   :IN_TRANSFERIDO, :CD_USUARIO_GER, :IN_DISTRIBUICAO, :TP_CD_BA' +
        'RRAS, :IN_CONTABILIZADO, '
      
        '   :CD_LT_CONTAB, :CD_LT_CONTAB_EXT, :CD_UNID_NEG, :IN_OPERACION' +
        'AL, :NR_REF, '
      
        '   :NR_TITULO, :CD_COLIGADA, :DT_MONTAGEM, :VL_PISCOFINS, :VL_IS' +
        'S, :VL_LIQUIDO, '
      
        '   :STATUS, :DT_EMISSAO_DOC, :IN_PISCOFINS, :IN_LANC_PROVISIONAD' +
        'O, :IN_SELECIONADO)')
    DeleteSQL.Strings = (
      'delete from TCTAAPAGAR'
      'where'
      '  DT_CTAAPAGAR = :OLD_DT_CTAAPAGAR and'
      '  NR_CTAAPAGAR = :OLD_NR_CTAAPAGAR and'
      '  CD_UNID_NEG = :OLD_CD_UNID_NEG')
    Left = 208
    Top = 107
  end
  object ds_ctaapagar_rateio: TDataSource
    DataSet = qry_ctaapagar_rateio
    Left = 46
    Top = 462
  end
  object qry_ctaapagar_rateio: TQuery
    BeforeOpen = qry_ctaapagar_rateioBeforeOpen
    DatabaseName = 'DBBROKER'
    DataSource = ds_ctaapagar_lanc
    RequestLive = True
    SQL.Strings = (
      'SELECT A.*'
      'FROM TCTAAPAGAR_RATEIO A'
      'WHERE'
      '  A.CD_UNID_NEG = :CD_UNID_NEG AND'
      '  A.DT_CTAAPAGAR = :DT_CTAAPAGAR AND'
      '  A.NR_CTAAPAGAR = :NR_CTAAPAGAR  AND'
      '  A.CODIGO =:CODIGO'
      '')
    Left = 120
    Top = 462
    ParamData = <
      item
        DataType = ftString
        Name = 'CD_UNID_NEG'
        ParamType = ptUnknown
        Size = 3
      end
      item
        DataType = ftDateTime
        Name = 'DT_CTAAPAGAR'
        ParamType = ptUnknown
        Size = 8
      end
      item
        DataType = ftString
        Name = 'NR_CTAAPAGAR'
        ParamType = ptUnknown
        Size = 4
      end
      item
        DataType = ftAutoInc
        Name = 'CODIGO'
        ParamType = ptUnknown
        Size = 4
      end>
    object qry_ctaapagar_rateioDT_CTAAPAGAR: TDateTimeField
      FieldName = 'DT_CTAAPAGAR'
      Origin = 'DBBROKER.TCTAAPAGAR_RATEIO.DT_CTAAPAGAR'
    end
    object qry_ctaapagar_rateioNR_CTAAPAGAR: TStringField
      FieldName = 'NR_CTAAPAGAR'
      Origin = 'DBBROKER.TCTAAPAGAR_RATEIO.NR_CTAAPAGAR'
      FixedChar = True
      Size = 3
    end
    object qry_ctaapagar_rateioCD_CT_CUSTO: TStringField
      DisplayLabel = 'C'#243'digo'
      FieldName = 'CD_CT_CUSTO'
      Origin = 'DBBROKER.TCTAAPAGAR_RATEIO.CD_CT_CUSTO'
      FixedChar = True
      Size = 25
    end
    object qry_ctaapagar_rateioVALOR_RATEIO: TFloatField
      DisplayLabel = 'Valor'
      FieldName = 'VALOR_RATEIO'
      Origin = 'DBBROKER.TCTAAPAGAR_RATEIO.VALOR_RATEIO'
      DisplayFormat = '#0,.00'
      EditFormat = '#0,.00'
    end
    object qry_ctaapagar_rateioCD_UNID_NEG: TStringField
      FieldName = 'CD_UNID_NEG'
      Origin = 'DBBROKER.TCTAAPAGAR_RATEIO.CD_UNID_NEG'
      FixedChar = True
      Size = 2
    end
    object qry_ctaapagar_rateioCD_RATEIO: TStringField
      FieldName = 'CD_RATEIO'
      Origin = 'DBBROKER.TCTAAPAGAR_RATEIO.CD_RATEIO'
      FixedChar = True
      Size = 4
    end
    object qry_ctaapagar_rateioCODIGO: TIntegerField
      FieldName = 'CODIGO'
      Origin = 'DBBROKER.TCTAAPAGAR_RATEIO.CODIGO'
    end
    object qry_ctaapagar_rateioLkpNM_Rateio: TStringField
      DisplayLabel = 'Descri'#231#227'o Custo'
      FieldKind = fkLookup
      FieldName = 'LkpNM_Rateio'
      LookupDataSet = SqlCustosContabil
      LookupKeyFields = 'CD_CT_CUSTO'
      LookupResultField = 'NM_CT_CUSTO'
      KeyFields = 'CD_CT_CUSTO'
      Size = 40
      Lookup = True
    end
    object qry_ctaapagar_rateioLkpPerc_Rateio: TFloatField
      FieldKind = fkLookup
      FieldName = 'LkpPerc_Rateio'
      LookupDataSet = SqlPercCusto
      LookupKeyFields = 'CD_CT_CUSTO'
      LookupResultField = 'PERC'
      KeyFields = 'CD_CT_CUSTO'
      DisplayFormat = '#0,.00'
      EditFormat = '#0,.00'
      Lookup = True
    end
  end
  object sqlAux: TQuery
    DatabaseName = 'DBBROKER'
    Left = 706
    Top = 449
  end
  object SqlRateio: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT * FROM TRATEIO')
    Left = 650
    Top = 65
  end
  object SqlPercCusto: TQuery
    DatabaseName = 'DBBROKER'
    DataSource = ds_ctaapagar_lanc
    SQL.Strings = (
      'select CD_CT_CUSTO, PERC from  TRATEIO_CONTAS'
      'where'
      '  CD_RATEIO =:CD_RATEIO ')
    Left = 466
    Top = 513
    ParamData = <
      item
        DataType = ftFixedChar
        Name = 'CD_RATEIO'
        ParamType = ptUnknown
        Size = 5
      end>
    object SqlPercCustoCD_CT_CUSTO: TStringField
      FieldName = 'CD_CT_CUSTO'
      Origin = 'DBBROKER.TRATEIO_CONTAS.CD_CT_CUSTO'
      FixedChar = True
      Size = 25
    end
    object SqlPercCustoPERC: TFloatField
      DisplayLabel = 'Perc'
      FieldName = 'PERC'
      Origin = 'DBBROKER.TRATEIO_CONTAS.PERC'
    end
  end
end
