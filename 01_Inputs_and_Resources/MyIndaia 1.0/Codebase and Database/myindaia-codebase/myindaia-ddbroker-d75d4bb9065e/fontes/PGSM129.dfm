object datm_faixas: Tdatm_faixas
  Left = 55
  Top = 42
  Height = 514
  Width = 503
  object ds_receita_exp_faixa: TDataSource
    DataSet = qry_receita_exp_faixa_
    Left = 38
    Top = 12
  end
  object qry_receita_exp_faixa_: TQuery
    OnCalcFields = qry_receita_exp_faixa_CalcFields
    DatabaseName = 'DBBROKER'
    ParamCheck = False
    RequestLive = True
    SQL.Strings = (
      'SELECT * FROM '
      'TRECEITAS_EXP_FAIXA'
      'WHERE CD_CLIENTE = :CD_CLIENTE AND'
      'CD_UNID_NEG = :CD_UNID_NEG AND'
      'CD_PRODUTO = :CD_PRODUTO AND'
      'CD_SERVICO = :CD_SERVICO AND'
      'CD_ITEM = :CD_ITEM')
    Params.Data = {
      010005000A43445F434C49454E544500010200300000000B43445F554E49445F
      4E454700010200300000000A43445F50524F4455544F00010200300000000A43
      445F5345525649434F00010200300000000743445F4954454D00010200300000
      00}
    Left = 176
    Top = 12
    object qry_receita_exp_faixa_CD_UNID_NEG: TStringField
      FieldName = 'CD_UNID_NEG'
      Origin = 'TRECEITAS_EXP_FAIXA.CD_UNID_NEG'
      Size = 2
    end
    object qry_receita_exp_faixa_CD_PRODUTO: TStringField
      FieldName = 'CD_PRODUTO'
      Origin = 'TRECEITAS_EXP_FAIXA.CD_PRODUTO'
      Size = 2
    end
    object qry_receita_exp_faixa_CD_CLIENTE: TStringField
      FieldName = 'CD_CLIENTE'
      Origin = 'TRECEITAS_EXP_FAIXA.CD_CLIENTE'
      Size = 5
    end
    object qry_receita_exp_faixa_CD_SERVICO: TStringField
      FieldName = 'CD_SERVICO'
      Origin = 'TRECEITAS_EXP_FAIXA.CD_SERVICO'
      Size = 3
    end
    object qry_receita_exp_faixa_CD_ITEM: TStringField
      FieldName = 'CD_ITEM'
      Origin = 'TRECEITAS_EXP_FAIXA.CD_ITEM'
      Size = 3
    end
    object qry_receita_exp_faixa_NR_FAIXA: TStringField
      DisplayLabel = 'Nº Faixa'
      FieldName = 'NR_FAIXA'
      Origin = 'TRECEITAS_EXP_FAIXA.NR_FAIXA'
      Size = 2
    end
    object qry_receita_exp_faixa_VL_INICIO_FAIXA: TFloatField
      DisplayLabel = 'Início da Faixa'
      FieldName = 'VL_INICIO_FAIXA'
      Origin = 'TRECEITAS_EXP_FAIXA.VL_INICIO_FAIXA'
      DisplayFormat = '#0,.00'
      EditFormat = '#0.00'
    end
    object qry_receita_exp_faixa_VL_FIM_FAIXA: TFloatField
      DisplayLabel = 'Fim da Faixa'
      FieldName = 'VL_FIM_FAIXA'
      Origin = 'TRECEITAS_EXP_FAIXA.VL_FIM_FAIXA'
      DisplayFormat = '#0,.00'
      EditFormat = '#0.00'
    end
    object qry_receita_exp_faixa_VL_NUM_FAIXA: TFloatField
      FieldName = 'VL_NUM_FAIXA'
      Origin = 'TRECEITAS_EXP_FAIXA.VL_NUM_FAIXA'
      DisplayFormat = '#0,.0000'
      EditFormat = '#0.0000'
    end
    object qry_receita_exp_faixa_VL_DEN_FAIXA: TFloatField
      FieldName = 'VL_DEN_FAIXA'
      Origin = 'TRECEITAS_EXP_FAIXA.VL_DEN_FAIXA'
    end
    object qry_receita_exp_faixa_TP_BASE_CALC_FAIXA: TStringField
      FieldName = 'TP_BASE_CALC_FAIXA'
      Origin = 'TRECEITAS_EXP_FAIXA.TP_BASE_CALC_FAIXA'
      Size = 1
    end
    object qry_receita_exp_faixa_CD_MOEDA_FAIXA: TStringField
      FieldName = 'CD_MOEDA_FAIXA'
      Origin = 'TRECEITAS_EXP_FAIXA.CD_MOEDA_FAIXA'
      Size = 3
    end
    object qry_receita_exp_faixa_LookCliente: TStringField
      FieldName = 'LookCliente'
      LookupDataSet = qry_empresa_nac_
      LookupKeyFields = 'CD_EMPRESA'
      LookupResultField = 'NM_EMPRESA'
      KeyFields = 'CD_CLIENTE'
      Size = 50
      Lookup = True
    end
    object qry_receita_exp_faixa_LookUnidNeg: TStringField
      FieldName = 'LookUnidNeg'
      LookupDataSet = qry_unid_neg_
      LookupKeyFields = 'CD_UNID_NEG'
      LookupResultField = 'NM_UNID_NEG'
      KeyFields = 'CD_UNID_NEG'
      Size = 50
      Lookup = True
    end
    object qry_receita_exp_faixa_LookProduto: TStringField
      FieldName = 'LookProduto'
      LookupDataSet = qry_produto_
      LookupKeyFields = 'CD_PRODUTO'
      LookupResultField = 'NM_PRODUTO'
      KeyFields = 'CD_PRODUTO'
      Size = 50
      Lookup = True
    end
    object qry_receita_exp_faixa_LookServico: TStringField
      FieldName = 'LookServico'
      LookupDataSet = qry_servico_
      LookupKeyFields = 'CD_SERVICO'
      LookupResultField = 'NM_SERVICO'
      KeyFields = 'CD_SERVICO'
      Size = 50
      Lookup = True
    end
    object qry_receita_exp_faixa_LookItem: TStringField
      FieldName = 'LookItem'
      LookupDataSet = qry_item_
      LookupKeyFields = 'CD_ITEM'
      LookupResultField = 'NM_ITEM'
      KeyFields = 'CD_ITEM'
      Size = 30
      Lookup = True
    end
    object qry_receita_exp_faixa_LookBaseCalcTaxa: TStringField
      FieldName = 'LookBaseCalcTaxa'
      LookupDataSet = tbl_base_calculo_
      LookupKeyFields = 'CD_BASE_CALCULO'
      LookupResultField = 'NM_BASE_CALCULO'
      KeyFields = 'TP_BASE_CALC_FAIXA'
      Size = 30
      Lookup = True
    end
    object qry_receita_exp_faixa_LookMoedaFaixa: TStringField
      FieldName = 'LookMoedaFaixa'
      LookupDataSet = qry_moeda_
      LookupKeyFields = 'CD_MOEDA'
      LookupResultField = 'NM_MOEDA'
      KeyFields = 'CD_MOEDA_FAIXA'
      Size = 30
      Lookup = True
    end
    object qry_receita_exp_faixa_Calc_Taxa: TFloatField
      FieldName = 'Calc_Taxa'
      DisplayFormat = '#0,.0000'
      EditFormat = '#0.0000'
      Calculated = True
    end
    object qry_receita_exp_faixa_TP_POR_BASE_CALC: TStringField
      FieldName = 'TP_POR_BASE_CALC'
      Origin = 'TRECEITAS_EXP_FAIXA.CD_UNID_NEG'
      Size = 1
    end
    object qry_receita_exp_faixa_LookPorBaseCalc: TStringField
      FieldName = 'LookPorBaseCalc'
      LookupDataSet = tbl_yesno_
      LookupKeyFields = 'CD_YESNO'
      LookupResultField = 'TX_YESNO'
      KeyFields = 'TP_POR_BASE_CALC'
      Size = 3
      Lookup = True
    end
  end
  object ds_empresa_nac: TDataSource
    DataSet = qry_empresa_nac_
    Left = 38
    Top = 60
  end
  object qry_empresa_nac_: TQuery
    DatabaseName = 'DBBROKER'
    ParamCheck = False
    SQL.Strings = (
      'SELECT CD_EMPRESA, NM_EMPRESA'
      'FROM TEMPRESA_NAC')
    Left = 176
    Top = 60
    object qry_empresa_nac_CD_EMPRESA: TStringField
      FieldName = 'CD_EMPRESA'
      Origin = 'TEMPRESA_NAC.CD_EMPRESA'
      Size = 5
    end
    object qry_empresa_nac_NM_EMPRESA: TStringField
      FieldName = 'NM_EMPRESA'
      Origin = 'TEMPRESA_NAC.NM_EMPRESA'
      Size = 50
    end
  end
  object ds_unid_neg: TDataSource
    DataSet = qry_unid_neg_
    Left = 38
    Top = 108
  end
  object ds_produto: TDataSource
    DataSet = qry_produto_
    Left = 38
    Top = 156
  end
  object qry_produto_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT CD_PRODUTO, NM_PRODUTO'
      'FROM TPRODUTO')
    Left = 176
    Top = 156
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
  object qry_unid_neg_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT CD_UNID_NEG, NM_UNID_NEG FROM'
      'TUNID_NEG')
    Left = 176
    Top = 108
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
  object ds_servico: TDataSource
    DataSet = qry_servico_
    Left = 38
    Top = 204
  end
  object qry_servico_: TQuery
    DatabaseName = 'DBBROKER'
    ParamCheck = False
    SQL.Strings = (
      'SELECT CD_SERVICO, NM_SERVICO '
      'FROM TSERVICO')
    Left = 176
    Top = 204
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
  object ds_item: TDataSource
    DataSet = qry_item_
    Left = 38
    Top = 252
  end
  object qry_item_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT CD_ITEM, NM_ITEM'
      'FROM TITEM')
    Left = 176
    Top = 252
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
  object ds_moeda: TDataSource
    DataSet = qry_moeda_
    Left = 38
    Top = 305
  end
  object qry_moeda_: TQuery
    DatabaseName = 'DBBROKER'
    RequestLive = True
    SQL.Strings = (
      'SELECT CD_MOEDA, NM_MOEDA FROM TMOEDA')
    Left = 176
    Top = 305
    object qry_moeda_CD_MOEDA: TStringField
      DisplayLabel = 'Código'
      FieldName = 'CD_MOEDA'
      Origin = 'TMOEDA.CD_MOEDA'
      Size = 3
    end
    object qry_moeda_NM_MOEDA: TStringField
      DisplayLabel = 'Descrição'
      FieldName = 'NM_MOEDA'
      Origin = 'TMOEDA.NM_MOEDA'
      Size = 30
    end
  end
  object tbl_base_calculo_: TTable
    Filter = 'IN_EXP = '#39'1'#39
    DatabaseName = 'DBBROKER'
    TableName = 'TBASE_CALCULO'
    Left = 176
    Top = 361
  end
  object ds_base_calculo: TDataSource
    DataSet = tbl_base_calculo_
    Left = 38
    Top = 361
  end
  object qry_ult_faixa_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT MAX(NR_FAIXA) AS ULTIMO'
      'FROM TRECEITAS_EXP_FAIXA'
      'WHERE CD_CLIENTE = :CD_CLIENTE AND'
      'CD_UNID_NEG = :CD_UNID_NEG AND'
      'CD_PRODUTO = :CD_PRODUTO AND'
      'CD_SERVICO = :CD_SERVICO AND'
      'CD_ITEM = :CD_ITEM')
    Params.Data = {
      010005000A43445F434C49454E544500010200300000000B43445F554E49445F
      4E454700010200300000000A43445F50524F4455544F00010200300000000A43
      445F5345525649434F00010200300000000743445F4954454D00010200300000
      00}
    Left = 292
    Top = 12
    object qry_ult_faixa_ULTIMO: TStringField
      FieldName = 'ULTIMO'
      Origin = 'TRECEITAS_EXP_FAIXA.NR_FAIXA'
      Size = 2
    end
  end
  object qry_fim_faixa_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT VL_FIM_FAIXA'
      'FROM TRECEITAS_EXP_FAIXA'
      'WHERE  NR_FAIXA = :NR_ULT_FAIXA AND'
      'CD_CLIENTE = :CD_CLIENTE AND'
      'CD_UNID_NEG = :CD_UNID_NEG AND'
      'CD_PRODUTO = :CD_PRODUTO AND'
      'CD_SERVICO = :CD_SERVICO AND'
      'CD_ITEM = :CD_ITEM'
      '')
    Params.Data = {
      010006000C4E525F554C545F464149584100010200300000000A43445F434C49
      454E544500010200300000000B43445F554E49445F4E45470001020030000000
      0A43445F50524F4455544F00010200300000000A43445F5345525649434F0001
      0200300000000743445F4954454D0001020030000000}
    Left = 292
    Top = 60
    object qry_fim_faixa_VL_FIM_FAIXA: TFloatField
      FieldName = 'VL_FIM_FAIXA'
      Origin = 'TRECEITAS_EXP_FAIXA.VL_FIM_FAIXA'
    end
  end
  object tbl_yesno_: TTable
    DatabaseName = 'DBBROKER'
    TableName = 'TYES_NO'
    Left = 176
    Top = 420
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
    Left = 38
    Top = 420
  end
end
