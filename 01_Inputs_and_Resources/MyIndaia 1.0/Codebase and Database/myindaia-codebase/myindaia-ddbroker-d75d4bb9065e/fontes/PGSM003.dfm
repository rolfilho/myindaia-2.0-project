object datm_ensaios: Tdatm_ensaios
  Left = 123
  Top = 101
  Height = 612
  Width = 717
  object ds_cliente_projecao: TDataSource
    DataSet = qry_cliente_projecao_
    Left = 47
    Top = 12
  end
  object qry_cliente_projecao_: TQuery
    AfterOpen = qry_cliente_projecao_AfterOpen
    AfterScroll = qry_cliente_projecao_AfterScroll
    DatabaseName = 'DBBROKER'
    ParamCheck = False
    RequestLive = True
    SQL.Strings = (
      'SELECT * FROM '
      'TCLIENTE_PROJECAO'
      'WHERE CD_CLIENTE = :CD_CLIENTE AND'
      'CD_UNID_NEG = :CD_UNID_NEG AND'
      'CD_PRODUTO = :CD_PRODUTO')
    Params.Data = {
      010003000A43445F434C49454E544500010200300000000B43445F554E49445F
      4E454700010200300000000A43445F50524F4455544F0001020030000000}
    Left = 160
    Top = 12
    object qry_cliente_projecao_CD_CLIENTE: TStringField
      FieldName = 'CD_CLIENTE'
      Origin = 'TCLIENTE_FATURAMENTO.CD_CLIENTE'
      Size = 5
    end
    object qry_cliente_projecao_CD_UNID_NEG: TStringField
      FieldName = 'CD_UNID_NEG'
      Origin = 'TCLIENTE_FATURAMENTO.CD_UNID_NEG'
      Size = 2
    end
    object qry_cliente_projecao_CD_PRODUTO: TStringField
      FieldName = 'CD_PRODUTO'
      Origin = 'TCLIENTE_FATURAMENTO.CD_PRODUTO'
      Size = 2
    end
    object qry_cliente_projecao_CD_SERVICO: TStringField
      DisplayLabel = 'Cód.'
      FieldName = 'CD_SERVICO'
      Origin = 'TCLIENTE_FATURAMENTO.CD_SERVICO'
      Size = 3
    end
    object qry_cliente_projecao_CD_ITEM: TStringField
      DisplayLabel = 'Cód.'
      FieldName = 'CD_ITEM'
      Origin = 'TCLIENTE_FATURAMENTO.CD_ITEM'
      Size = 3
    end
    object qry_cliente_projecao_TP_CALCULO: TStringField
      FieldName = 'TP_CALCULO'
      Origin = 'TCLIENTE_FATURAMENTO.TP_CALCULO'
      Size = 3
    end
    object qry_cliente_projecao_LookCliente: TStringField
      DisplayLabel = 'Cliente'
      FieldName = 'LookCliente'
      LookupDataSet = qry_cliente_
      LookupKeyFields = 'CD_EMPRESA'
      LookupResultField = 'NM_EMPRESA'
      KeyFields = 'CD_CLIENTE'
      Size = 50
      Lookup = True
    end
    object qry_cliente_projecao_LookUnidNeg: TStringField
      DisplayLabel = 'Unid.Neg.'
      FieldName = 'LookUnidNeg'
      LookupDataSet = qry_unid_neg_
      LookupKeyFields = 'CD_UNID_NEG'
      LookupResultField = 'AP_UNID_NEG'
      KeyFields = 'CD_UNID_NEG'
      Size = 50
      Lookup = True
    end
    object qry_cliente_projecao_LookProduto: TStringField
      DisplayLabel = 'Produto'
      FieldName = 'LookProduto'
      LookupDataSet = qry_produto_
      LookupKeyFields = 'CD_PRODUTO'
      LookupResultField = 'NM_PRODUTO'
      KeyFields = 'CD_PRODUTO'
      Size = 40
      Lookup = True
    end
    object qry_cliente_projecao_LookServico: TStringField
      DisplayLabel = 'Serviço'
      FieldName = 'LookServico'
      LookupDataSet = qry_servico_
      LookupKeyFields = 'CD_SERVICO'
      LookupResultField = 'NM_SERVICO'
      KeyFields = 'CD_SERVICO'
      Size = 50
      Lookup = True
    end
    object qry_cliente_projecao_LookItem: TStringField
      DisplayLabel = 'Item'
      FieldName = 'LookItem'
      LookupDataSet = qry_item_
      LookupKeyFields = 'CD_ITEM'
      LookupResultField = 'NM_ITEM'
      KeyFields = 'CD_ITEM'
      Size = 30
      Lookup = True
    end
    object qry_cliente_projecao_LookCalculo: TStringField
      FieldName = 'LookCalculo'
      LookupDataSet = qry_calculo_
      LookupKeyFields = 'CD_CALCULO'
      LookupResultField = 'NM_CALCULO'
      KeyFields = 'TP_CALCULO'
      Size = 40
      Lookup = True
    end
    object qry_cliente_projecao_LookTabelaCalculo: TStringField
      FieldName = 'LookTabelaCalculo'
      LookupDataSet = qry_calculo_
      LookupKeyFields = 'CD_CALCULO'
      LookupResultField = 'CD_TABELA'
      KeyFields = 'TP_CALCULO'
      Size = 1
      Lookup = True
    end
  end
  object qry_servico_: TQuery
    DatabaseName = 'DBBROKER'
    ParamCheck = False
    SQL.Strings = (
      'SELECT CD_SERVICO, NM_SERVICO '
      'FROM TSERVICO')
    Left = 47
    Top = 108
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
  object qry_item_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT CD_ITEM, NM_ITEM'
      'FROM TITEM'
      'WHERE CD_TIPO_ITEM = "R"')
    Left = 160
    Top = 156
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
  object ds_banco: TDataSource
    DataSet = qry_banco_
    Left = 47
    Top = 205
  end
  object qry_banco_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT CD_BANCO, NM_BANCO'
      'FROM TBANCO')
    Left = 160
    Top = 205
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
  object ds_calculo: TDataSource
    DataSet = qry_calculo_
    Left = 47
    Top = 257
  end
  object qry_calculo_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT *'
      'FROM TCALCULO')
    Left = 160
    Top = 257
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
  object tbl_yesno_: TTable
    DatabaseName = 'DBBROKER'
    TableName = 'TYES_NO'
    Left = 432
    Top = 12
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
    Left = 320
    Top = 12
  end
  object tbl_regime_trib_: TTable
    DatabaseName = 'DBBROKER'
    TableName = 'TREGIME_TRIB'
    Left = 432
    Top = 60
    object tbl_regime_trib_CD_REGIME_TRIB: TStringField
      FieldName = 'CD_REGIME_TRIB'
      Required = True
      Size = 1
    end
    object tbl_regime_trib_NM_REGIME_TRIB: TStringField
      FieldName = 'NM_REGIME_TRIB'
      Required = True
    end
  end
  object ds_regime_trib: TDataSource
    DataSet = tbl_regime_trib_
    Left = 320
    Top = 60
  end
  object tbl_dt_base_: TTable
    DatabaseName = 'DBBROKER'
    TableName = 'TDT_BASE_MOEDA_IND'
    Left = 432
    Top = 108
    object tbl_dt_base_CD_DT_BASE: TStringField
      FieldName = 'CD_DT_BASE'
      Required = True
      Size = 1
    end
    object tbl_dt_base_NM_DT_BASE: TStringField
      FieldName = 'NM_DT_BASE'
      Required = True
    end
  end
  object ds_dt_base: TDataSource
    DataSet = tbl_dt_base_
    Left = 320
    Top = 108
  end
  object ds_ensaio_imp: TDataSource
    DataSet = qry_ensaio_imp_
    Left = 320
    Top = 363
  end
  object qry_ensaio_imp_: TQuery
    AfterOpen = qry_ensaio_imp_AfterOpen
    BeforeScroll = qry_ensaio_imp_BeforeScroll
    AfterScroll = qry_ensaio_imp_AfterScroll
    OnCalcFields = qry_ensaio_imp_CalcFields
    DatabaseName = 'DBBROKER'
    DataSource = ds_cliente_projecao
    RequestLive = True
    SQL.Strings = (
      'SELECT *'
      'FROM TENSAIOS_IMP'
      'WHERE CD_CLIENTE = :CD_CLIENTE AND'
      'CD_UNID_NEG = :CD_UNID_NEG AND'
      'CD_PRODUTO = :CD_PRODUTO AND'
      'CD_SERVICO = :CD_SERVICO AND'
      'CD_ITEM = :CD_ITEM')
    Params.Data = {
      010005000A43445F434C49454E544500010200300001000B43445F554E49445F
      4E454700010200300001000A43445F50524F4455544F00010200300001000A43
      445F5345525649434F00010200300001000743445F4954454D00010200300001
      00}
    Left = 432
    Top = 363
    object qry_ensaio_imp_CD_CLIENTE: TStringField
      FieldName = 'CD_CLIENTE'
      Origin = 'TRECEITAS_IMP.CD_CLIENTE'
      Size = 5
    end
    object qry_ensaio_imp_CD_UNID_NEG: TStringField
      FieldName = 'CD_UNID_NEG'
      Origin = 'TRECEITAS_IMP.CD_UNID_NEG'
      Size = 2
    end
    object qry_ensaio_imp_CD_PRODUTO: TStringField
      FieldName = 'CD_PRODUTO'
      Origin = 'TRECEITAS_IMP.CD_PRODUTO'
      Size = 2
    end
    object qry_ensaio_imp_CD_SERVICO: TStringField
      FieldName = 'CD_SERVICO'
      Origin = 'TRECEITAS_IMP.CD_SERVICO'
      Size = 3
    end
    object qry_ensaio_imp_CD_ITEM: TStringField
      FieldName = 'CD_ITEM'
      Origin = 'TRECEITAS_IMP.CD_ITEM'
      Size = 3
    end
    object qry_ensaio_imp_CD_REGIME_TRIB: TStringField
      FieldName = 'CD_REGIME_TRIB'
      Origin = 'TRECEITAS_IMP.CD_REGIME_TRIB'
      Size = 1
    end
    object qry_ensaio_imp_TP_DT_BASE: TStringField
      FieldName = 'TP_DT_BASE'
      Origin = 'TRECEITAS_IMP.TP_DT_BASE'
      Size = 1
    end
    object qry_ensaio_imp_VL_NUM_TAXA: TFloatField
      FieldName = 'VL_NUM_TAXA'
      Origin = 'TRECEITAS_IMP.VL_NUMERADOR_TAXA'
      DisplayFormat = '#0,.0000'
      EditFormat = '#0.0000'
    end
    object qry_ensaio_imp_VL_DEN_TAXA: TFloatField
      FieldName = 'VL_DEN_TAXA'
      Origin = 'TRECEITAS_IMP.VL_DENOMINADOR_TAXA'
    end
    object qry_ensaio_imp_TP_BASE_CALC_TAXA: TStringField
      FieldName = 'TP_BASE_CALC_TAXA'
      Origin = 'TRECEITAS_IMP.TP_BASE_CALCULO_TAXA'
      Size = 1
    end
    object qry_ensaio_imp_CD_MOEDA_TAXA: TStringField
      FieldName = 'CD_MOEDA_TAXA'
      Origin = 'TRECEITAS_IMP.CD_MOEDA_TAXA'
      Size = 3
    end
    object qry_ensaio_imp_VL_NUM_ACR: TFloatField
      FieldName = 'VL_NUM_ACR'
      Origin = 'TRECEITAS_IMP.VL_NUMERADOR_ACRESCIMO'
      DisplayFormat = '#0,.0000'
      EditFormat = '#0.0000'
    end
    object qry_ensaio_imp_VL_DEN_ACR: TFloatField
      FieldName = 'VL_DEN_ACR'
      Origin = 'TRECEITAS_IMP.VL_DENOMINADOR_ACRESCIMO'
    end
    object qry_ensaio_imp_TP_BASE_CALC_ACR: TStringField
      FieldName = 'TP_BASE_CALC_ACR'
      Origin = 'TRECEITAS_IMP.TP_BASE_CALCULO_ACRESCIMO'
      Size = 1
    end
    object qry_ensaio_imp_CD_MOEDA_ACR: TStringField
      FieldName = 'CD_MOEDA_ACR'
      Origin = 'TRECEITAS_IMP.CD_MOEDA_ACRESCIMO'
      Size = 3
    end
    object qry_ensaio_imp_VL_NUM_FORA_REGIAO: TFloatField
      FieldName = 'VL_NUM_FORA_REGIAO'
      Origin = 'TRECEITAS_IMP.VL_NUMERADOR_FORA_REGIAO'
      DisplayFormat = '#0,.0000'
      EditFormat = '#0.0000'
    end
    object qry_ensaio_imp_VL_DEN_FORA_REGIAO: TFloatField
      FieldName = 'VL_DEN_FORA_REGIAO'
      Origin = 'TRECEITAS_IMP.VL_DENOMINADOR_FORA_REGIAO'
    end
    object qry_ensaio_imp_TP_BASE_CALC_FORA_REGIAO: TStringField
      FieldName = 'TP_BASE_CALC_FORA_REGIAO'
      Origin = 'TRECEITAS_IMP.TP_BASE_CALCULO_FORA_REGIAO'
      Size = 1
    end
    object qry_ensaio_imp_CD_MOEDA_FORA_REGIAO: TStringField
      FieldName = 'CD_MOEDA_FORA_REGIAO'
      Origin = 'TRECEITAS_IMP.CD_MOEDA_FORA_REGIAO'
      Size = 3
    end
    object qry_ensaio_imp_VL_NUM_MIN: TFloatField
      FieldName = 'VL_NUM_MIN'
      Origin = 'TRECEITAS_IMP.VL_NUMERADOR_MINIMO'
      DisplayFormat = '#0,.0000'
      EditFormat = '#0.0000'
    end
    object qry_ensaio_imp_VL_DEN_MIN: TFloatField
      FieldName = 'VL_DEN_MIN'
      Origin = 'TRECEITAS_IMP.VL_DENOMINADOR_MINIMO'
    end
    object qry_ensaio_imp_TP_BASE_CALC_MIN: TStringField
      FieldName = 'TP_BASE_CALC_MIN'
      Origin = 'TRECEITAS_IMP.TP_BASE_CALCULO_MINIMO'
      Size = 1
    end
    object qry_ensaio_imp_CD_MOEDA_MIN: TStringField
      FieldName = 'CD_MOEDA_MIN'
      Origin = 'TRECEITAS_IMP.CD_MOEDA_MINIMO'
      Size = 3
    end
    object qry_ensaio_imp_VL_NUM_MAX: TFloatField
      DisplayLabel = 'Num. Máx.'
      FieldName = 'VL_NUM_MAX'
      Origin = 'TRECEITAS_IMP.VL_NUMERADOR_MAXIMO'
      DisplayFormat = '#0,.0000'
      EditFormat = '#0.0000'
    end
    object qry_ensaio_imp_VL_DEN_MAX: TFloatField
      FieldName = 'VL_DEN_MAX'
      Origin = 'TRECEITAS_IMP.VL_DENOMINADOR_MAXIMO'
    end
    object qry_ensaio_imp_TP_BASE_CALC_MAX: TStringField
      FieldName = 'TP_BASE_CALC_MAX'
      Origin = 'TRECEITAS_IMP.TP_BASE_CALCULO_MAXIMO'
      Size = 1
    end
    object qry_ensaio_imp_CD_MOEDA_MAX: TStringField
      FieldName = 'CD_MOEDA_MAX'
      Origin = 'TRECEITAS_IMP.CD_MOEDA_MAXIMO'
      Size = 3
    end
    object qry_ensaio_imp_IN_ATIVO: TStringField
      FieldName = 'IN_ATIVO'
      Origin = 'TRECEITAS_IMP.IN_ATIVO'
      Size = 1
    end
    object qry_ensaio_imp_LookAtivo: TStringField
      FieldName = 'LookAtivo'
      LookupDataSet = tbl_yesno_
      LookupKeyFields = 'CD_YESNO'
      LookupResultField = 'TX_YESNO'
      KeyFields = 'IN_ATIVO'
      Size = 3
      Lookup = True
    end
    object qry_ensaio_imp_LookRegimeTrib: TStringField
      FieldName = 'LookRegimeTrib'
      LookupDataSet = tbl_regime_trib_
      LookupKeyFields = 'CD_REGIME_TRIB'
      LookupResultField = 'NM_REGIME_TRIB'
      KeyFields = 'CD_REGIME_TRIB'
      Lookup = True
    end
    object qry_ensaio_imp_LookDtBase: TStringField
      FieldName = 'LookDtBase'
      LookupDataSet = tbl_dt_base_
      LookupKeyFields = 'CD_DT_BASE'
      LookupResultField = 'NM_DT_BASE'
      KeyFields = 'TP_DT_BASE'
      Lookup = True
    end
    object qry_ensaio_imp_LookBaseCalcTaxa: TStringField
      FieldName = 'LookBaseCalcTaxa'
      LookupDataSet = qry_base_calc_imp_
      LookupKeyFields = 'CD_BASE_CALCULO'
      LookupResultField = 'NM_BASE_CALCULO'
      KeyFields = 'TP_BASE_CALC_TAXA'
      Size = 30
      Lookup = True
    end
    object qry_ensaio_imp_LookBaseCalcAcr: TStringField
      FieldName = 'LookBaseCalcAcr'
      LookupDataSet = qry_base_calc_imp_
      LookupKeyFields = 'CD_BASE_CALCULO'
      LookupResultField = 'NM_BASE_CALCULO'
      KeyFields = 'TP_BASE_CALC_ACR'
      Size = 30
      Lookup = True
    end
    object qry_ensaio_imp_LookBaseCalcForaRegiao: TStringField
      FieldName = 'LookBaseCalcForaRegiao'
      LookupDataSet = qry_base_calc_imp_
      LookupKeyFields = 'CD_BASE_CALCULO'
      LookupResultField = 'NM_BASE_CALCULO'
      KeyFields = 'TP_BASE_CALC_FORA_REGIAO'
      Size = 30
      Lookup = True
    end
    object qry_ensaio_imp_LookBaseCalcMin: TStringField
      FieldName = 'LookBaseCalcMin'
      LookupDataSet = qry_base_calc_imp_
      LookupKeyFields = 'CD_BASE_CALCULO'
      LookupResultField = 'NM_BASE_CALCULO'
      KeyFields = 'TP_BASE_CALC_MIN'
      Size = 30
      Lookup = True
    end
    object qry_ensaio_imp_LookBaseCalcMax: TStringField
      FieldName = 'LookBaseCalcMax'
      LookupDataSet = qry_base_calc_imp_
      LookupKeyFields = 'CD_BASE_CALCULO'
      LookupResultField = 'NM_BASE_CALCULO'
      KeyFields = 'TP_BASE_CALC_MAX'
      Size = 30
      Lookup = True
    end
    object qry_ensaio_imp_LookMoedaTaxa: TStringField
      FieldName = 'LookMoedaTaxa'
      LookupDataSet = qry_moeda_
      LookupKeyFields = 'CD_MOEDA'
      LookupResultField = 'NM_MOEDA'
      KeyFields = 'CD_MOEDA_TAXA'
      Size = 30
      Lookup = True
    end
    object qry_ensaio_imp_LookMoedaAcr: TStringField
      FieldName = 'LookMoedaAcr'
      LookupDataSet = qry_moeda_
      LookupKeyFields = 'CD_MOEDA'
      LookupResultField = 'NM_MOEDA'
      KeyFields = 'CD_MOEDA_ACR'
      Size = 30
      Lookup = True
    end
    object qry_ensaio_imp_LookMoedaForaRegiao: TStringField
      FieldName = 'LookMoedaForaRegiao'
      LookupDataSet = qry_moeda_
      LookupKeyFields = 'CD_MOEDA'
      LookupResultField = 'NM_MOEDA'
      KeyFields = 'CD_MOEDA_FORA_REGIAO'
      Size = 30
      Lookup = True
    end
    object qry_ensaio_imp_LookMoedaMin: TStringField
      FieldName = 'LookMoedaMin'
      LookupDataSet = qry_moeda_
      LookupKeyFields = 'CD_MOEDA'
      LookupResultField = 'NM_MOEDA'
      KeyFields = 'CD_MOEDA_MIN'
      Size = 30
      Lookup = True
    end
    object qry_ensaio_imp_LookMoedaMax: TStringField
      FieldName = 'LookMoedaMax'
      LookupDataSet = qry_moeda_
      LookupKeyFields = 'CD_MOEDA'
      LookupResultField = 'NM_MOEDA'
      KeyFields = 'CD_MOEDA_MAX'
      Size = 30
      Lookup = True
    end
    object qry_ensaio_imp_Calc_Taxa: TFloatField
      FieldName = 'Calc_Taxa'
      DisplayFormat = '#0,.0000'
      EditFormat = '#0.0000'
      Calculated = True
    end
    object qry_ensaio_imp_Calc_Acr: TFloatField
      FieldName = 'Calc_Acr'
      DisplayFormat = '#0,.0000'
      EditFormat = '#0.0000'
      Calculated = True
    end
    object qry_ensaio_imp_Calc_Fora_Regiao: TFloatField
      FieldName = 'Calc_Fora_Regiao'
      DisplayFormat = '#0,.0000'
      EditFormat = '#0.0000'
      Calculated = True
    end
    object qry_ensaio_imp_Calc_Min: TFloatField
      FieldName = 'Calc_Min'
      DisplayFormat = '#0,.0000'
      EditFormat = '#0.0000'
      Calculated = True
    end
    object qry_ensaio_imp_Calc_Max: TFloatField
      FieldName = 'Calc_Max'
      DisplayFormat = '#0,.0000'
      EditFormat = '#0.0000'
      Calculated = True
    end
  end
  object ds_moeda: TDataSource
    DataSet = qry_moeda_
    Left = 47
    Top = 309
  end
  object qry_moeda_: TQuery
    DatabaseName = 'DBBROKER'
    RequestLive = True
    SQL.Strings = (
      'SELECT CD_MOEDA, NM_MOEDA FROM TMOEDA_BROKER')
    Left = 160
    Top = 309
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
  object ds_ensaio_exp: TDataSource
    DataSet = qry_ensaio_exp_
    Left = 320
    Top = 423
  end
  object qry_ensaio_exp_: TQuery
    AfterOpen = qry_ensaio_exp_AfterOpen
    BeforeScroll = qry_ensaio_exp_BeforeScroll
    AfterScroll = qry_ensaio_exp_AfterScroll
    OnCalcFields = qry_ensaio_exp_CalcFields
    DatabaseName = 'DBBROKER'
    DataSource = ds_cliente_projecao
    RequestLive = True
    SQL.Strings = (
      'SELECT *'
      'FROM TENSAIOS_EXP'
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
    Left = 432
    Top = 423
    object qry_ensaio_exp_CD_UNID_NEG: TStringField
      FieldName = 'CD_UNID_NEG'
      Origin = 'TRECEITAS_EXP.CD_UNID_NEG'
      Size = 2
    end
    object qry_ensaio_exp_CD_PRODUTO: TStringField
      FieldName = 'CD_PRODUTO'
      Origin = 'TRECEITAS_EXP.CD_PRODUTO'
      Size = 2
    end
    object qry_ensaio_exp_CD_CLIENTE: TStringField
      FieldName = 'CD_CLIENTE'
      Origin = 'TRECEITAS_EXP.CD_CLIENTE'
      Size = 5
    end
    object qry_ensaio_exp_CD_SERVICO: TStringField
      FieldName = 'CD_SERVICO'
      Origin = 'TRECEITAS_EXP.CD_SERVICO'
      Size = 3
    end
    object qry_ensaio_exp_CD_ITEM: TStringField
      FieldName = 'CD_ITEM'
      Origin = 'TRECEITAS_EXP.CD_ITEM'
      Size = 3
    end
    object qry_ensaio_exp_TP_DT_BASE: TStringField
      FieldName = 'TP_DT_BASE'
      Origin = 'TRECEITAS_EXP.TP_DT_BASE'
      Size = 1
    end
    object qry_ensaio_exp_TP_FAIXA: TStringField
      FieldName = 'TP_FAIXA'
      Origin = 'TRECEITAS_EXP.TP_FAIXA'
      Size = 1
    end
    object qry_ensaio_exp_TP_FAIXA_VALOR: TStringField
      FieldName = 'TP_FAIXA_VALOR'
      Origin = 'TRECEITAS_EXP.TP_FAIXA_VALOR'
      Size = 1
    end
    object qry_ensaio_exp_VL_NUM_TAXA: TFloatField
      FieldName = 'VL_NUM_TAXA'
      Origin = 'TRECEITAS_EXP.VL_NUM_TAXA'
      DisplayFormat = '#0,.0000'
      EditFormat = '#0.0000'
    end
    object qry_ensaio_exp_VL_DEN_TAXA: TFloatField
      FieldName = 'VL_DEN_TAXA'
      Origin = 'TRECEITAS_EXP.VL_DEN_TAXA'
    end
    object qry_ensaio_exp_TP_BASE_CALC_TAXA: TStringField
      FieldName = 'TP_BASE_CALC_TAXA'
      Origin = 'TRECEITAS_EXP.TP_BASE_CALC_TAXA'
      Size = 1
    end
    object qry_ensaio_exp_CD_MOEDA_TAXA: TStringField
      FieldName = 'CD_MOEDA_TAXA'
      Origin = 'TRECEITAS_EXP.CD_MOEDA_TAXA'
      Size = 3
    end
    object qry_ensaio_exp_VL_NUM_MIN: TFloatField
      FieldName = 'VL_NUM_MIN'
      Origin = 'TRECEITAS_EXP.CD_UNID_NEG'
      DisplayFormat = '#0,.0000'
      EditFormat = '#0.0000'
    end
    object qry_ensaio_exp_VL_DEN_MIN: TFloatField
      FieldName = 'VL_DEN_MIN'
      Origin = 'TRECEITAS_EXP.VL_DEN_MIN'
    end
    object qry_ensaio_exp_TP_BASE_CALC_MIN: TStringField
      FieldName = 'TP_BASE_CALC_MIN'
      Origin = 'TRECEITAS_EXP.TP_BASE_CALC_MIN'
      Size = 1
    end
    object qry_ensaio_exp_CD_MOEDA_MIN: TStringField
      FieldName = 'CD_MOEDA_MIN'
      Origin = 'TRECEITAS_EXP.CD_MOEDA_MIN'
      Size = 3
    end
    object qry_ensaio_exp_VL_NUM_MAX: TFloatField
      FieldName = 'VL_NUM_MAX'
      Origin = 'TRECEITAS_EXP.VL_NUM_MAX'
      DisplayFormat = '#0,.0000'
      EditFormat = '#0.0000'
    end
    object qry_ensaio_exp_VL_DEN_MAX: TFloatField
      FieldName = 'VL_DEN_MAX'
      Origin = 'TRECEITAS_EXP.VL_DEN_MAX'
    end
    object qry_ensaio_exp_TP_BASE_CALC_MAX: TStringField
      FieldName = 'TP_BASE_CALC_MAX'
      Origin = 'TRECEITAS_EXP.TP_BASE_CALC_MAX'
      Size = 1
    end
    object qry_ensaio_exp_CD_MOEDA_MAX: TStringField
      FieldName = 'CD_MOEDA_MAX'
      Origin = 'TRECEITAS_EXP.CD_MOEDA_MAX'
      Size = 3
    end
    object qry_ensaio_exp_PC_REDUC_RE_CANC: TFloatField
      FieldName = 'PC_REDUC_RE_CANC'
      Origin = 'TRECEITAS_EXP.PC_REDUC_RE_CANC'
      DisplayFormat = '#0,.00'
      EditFormat = '#0.00'
    end
    object qry_ensaio_exp_IN_ATIVO: TStringField
      FieldName = 'IN_ATIVO'
      Origin = 'TRECEITAS_EXP.CD_UNID_NEG'
      Size = 1
    end
    object qry_ensaio_exp_LookDtBase: TStringField
      FieldName = 'LookDtBase'
      LookupDataSet = tbl_dt_base_
      LookupKeyFields = 'CD_DT_BASE'
      LookupResultField = 'NM_DT_BASE'
      KeyFields = 'TP_DT_BASE'
      Lookup = True
    end
    object qry_ensaio_exp_LookFaixa: TStringField
      FieldName = 'LookFaixa'
      LookupDataSet = tbl_tp_faixa_
      LookupKeyFields = 'TP_FAIXA'
      LookupResultField = 'NM_TP_FAIXA'
      KeyFields = 'TP_FAIXA'
      Lookup = True
    end
    object qry_ensaio_exp_LookFaixaValor: TStringField
      FieldName = 'LookFaixaValor'
      LookupDataSet = tbl_tp_faixa_valor_
      LookupKeyFields = 'TP_FAIXA_VALOR'
      LookupResultField = 'NM_TP_FAIXA_VALOR'
      KeyFields = 'TP_FAIXA_VALOR'
      Lookup = True
    end
    object qry_ensaio_exp_LookBaseCalcTaxa: TStringField
      FieldName = 'LookBaseCalcTaxa'
      LookupDataSet = qry_base_calc_exp_
      LookupKeyFields = 'CD_BASE_CALCULO'
      LookupResultField = 'NM_BASE_CALCULO'
      KeyFields = 'TP_BASE_CALC_TAXA'
      Size = 30
      Lookup = True
    end
    object qry_ensaio_exp_LookBaseCalcMin: TStringField
      FieldName = 'LookBaseCalcMin'
      LookupDataSet = qry_base_calc_exp_
      LookupKeyFields = 'CD_BASE_CALCULO'
      LookupResultField = 'NM_BASE_CALCULO'
      KeyFields = 'TP_BASE_CALC_MIN'
      Size = 30
      Lookup = True
    end
    object qry_ensaio_exp_LookBaseCalcMax: TStringField
      FieldName = 'LookBaseCalcMax'
      LookupDataSet = qry_base_calc_exp_
      LookupKeyFields = 'CD_BASE_CALCULO'
      LookupResultField = 'NM_BASE_CALCULO'
      KeyFields = 'TP_BASE_CALC_MAX'
      Size = 30
      Lookup = True
    end
    object qry_ensaio_exp_LookMoedaTaxa: TStringField
      FieldName = 'LookMoedaTaxa'
      LookupDataSet = qry_moeda_
      LookupKeyFields = 'CD_MOEDA'
      LookupResultField = 'NM_MOEDA'
      KeyFields = 'CD_MOEDA_TAXA'
      Size = 30
      Lookup = True
    end
    object qry_ensaio_exp_LookMoedaMin: TStringField
      FieldName = 'LookMoedaMin'
      LookupDataSet = qry_moeda_
      LookupKeyFields = 'CD_MOEDA'
      LookupResultField = 'NM_MOEDA'
      KeyFields = 'CD_MOEDA_MIN'
      Size = 30
      Lookup = True
    end
    object qry_ensaio_exp_LookMoedaMax: TStringField
      FieldName = 'LookMoedaMax'
      LookupDataSet = qry_moeda_
      LookupKeyFields = 'CD_MOEDA'
      LookupResultField = 'NM_MOEDA'
      KeyFields = 'CD_MOEDA_MAX'
      Size = 30
      Lookup = True
    end
    object qry_ensaio_exp_Calc_Taxa2: TFloatField
      FieldName = 'Calc_Taxa2'
      DisplayFormat = '#0,.0000'
      EditFormat = '#0.0000'
      Calculated = True
    end
    object qry_ensaio_exp_Calc_Min2: TFloatField
      FieldName = 'Calc_Min2'
      DisplayFormat = '#0,.0000'
      EditFormat = '#0.0000'
      Calculated = True
    end
    object qry_ensaio_exp_Calc_Max2: TFloatField
      FieldName = 'Calc_Max2'
      DisplayFormat = '#0,.0000'
      EditFormat = '#0.0000'
      Calculated = True
    end
  end
  object tbl_tp_faixa_: TTable
    DatabaseName = 'DBBROKER'
    TableName = 'TTP_FAIXA'
    Left = 432
    Top = 156
    object tbl_tp_faixa_TP_FAIXA: TStringField
      FieldName = 'TP_FAIXA'
      Required = True
      Size = 1
    end
    object tbl_tp_faixa_NM_TP_FAIXA: TStringField
      FieldName = 'NM_TP_FAIXA'
      Required = True
    end
  end
  object ds_tp_faixa: TDataSource
    DataSet = tbl_tp_faixa_
    Left = 320
    Top = 156
  end
  object tbl_tp_faixa_valor_: TTable
    DatabaseName = 'DBBROKER'
    TableName = 'TTP_FAIXA_VALOR'
    Left = 432
    Top = 205
    object tbl_tp_faixa_valor_TP_FAIXA_VALOR: TStringField
      FieldName = 'TP_FAIXA_VALOR'
      Required = True
      Size = 1
    end
    object tbl_tp_faixa_valor_NM_TP_FAIXA_VALOR: TStringField
      FieldName = 'NM_TP_FAIXA_VALOR'
      Required = True
    end
  end
  object ds_tp_faixa_valor: TDataSource
    DataSet = tbl_tp_faixa_valor_
    Left = 320
    Top = 205
  end
  object sp_cria_ensaios: TStoredProc
    DatabaseName = 'DBBROKER'
    StoredProcName = 'dbo.sp_cria_ensaios'
    Params.Data = {
      0100070006526573756C74040304000000000000000B4063645F636C69656E74
      6501010200300000000C4063645F756E69645F6E656701010200300000000B40
      63645F70726F6475746F0101020030000000094063645F6974656D3101010200
      30000000094063645F6974656D320101020030000000094063645F6974656D33
      0101020030000000}
    Left = 47
    Top = 363
  end
  object ds_base_calc_imp: TDataSource
    DataSet = qry_base_calc_imp_
    Left = 320
    Top = 309
  end
  object qry_base_calc_imp_: TQuery
    DatabaseName = 'DBBROKER'
    DataSource = ds_cliente_projecao
    RequestLive = True
    SQL.Strings = (
      'SELECT CD_BASE_CALCULO, NM_BASE_CALCULO'
      'FROM TBASE_CALCULO'
      'WHERE IN_IMP = '#39'1'#39)
    Left = 432
    Top = 309
    object qry_base_calc_imp_CD_BASE_CALCULO: TStringField
      FieldName = 'CD_BASE_CALCULO'
      Origin = 'TBASE_CALCULO.CD_BASE_CALCULO'
      Size = 1
    end
    object qry_base_calc_imp_NM_BASE_CALCULO: TStringField
      FieldName = 'NM_BASE_CALCULO'
      Origin = 'TBASE_CALCULO.NM_BASE_CALCULO'
      Size = 30
    end
  end
  object ds_base_calc_exp: TDataSource
    DataSet = qry_base_calc_exp_
    Left = 320
    Top = 257
  end
  object qry_base_calc_exp_: TQuery
    DatabaseName = 'DBBROKER'
    RequestLive = True
    SQL.Strings = (
      'SELECT CD_BASE_CALCULO, NM_BASE_CALCULO'
      'FROM TBASE_CALCULO'
      'WHERE IN_EXP = '#39'1'#39)
    Left = 432
    Top = 257
    object qry_base_calc_exp_CD_BASE_CALCULO: TStringField
      FieldName = 'CD_BASE_CALCULO'
      Origin = 'TBASE_CALCULO.CD_BASE_CALCULO'
      Size = 1
    end
    object qry_base_calc_exp_NM_BASE_CALCULO: TStringField
      FieldName = 'NM_BASE_CALCULO'
      Origin = 'TBASE_CALCULO.NM_BASE_CALCULO'
      Size = 30
    end
  end
  object qry_produto_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT CD_PRODUTO, NM_PRODUTO'
      'FROM TPRODUTO')
    Left = 160
    Top = 108
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
      'SELECT CD_UNID_NEG, AP_UNID_NEG'
      'FROM TUNID_NEG')
    Left = 47
    Top = 60
    object qry_unid_neg_CD_UNID_NEG: TStringField
      FieldName = 'CD_UNID_NEG'
      Origin = 'TUNID_NEG.CD_UNID_NEG'
      Size = 2
    end
    object qry_unid_neg_AP_UNID_NEG: TStringField
      FieldName = 'AP_UNID_NEG'
      Origin = 'TUNID_NEG.AP_UNID_NEG'
      Size = 10
    end
  end
  object qry_cliente_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT CD_EMPRESA, NM_EMPRESA, AP_EMPRESA'
      'FROM TEMPRESA_NAC TEMPRESA_NAC')
    Left = 160
    Top = 60
    object qry_cliente_CD_EMPRESA: TStringField
      FieldName = 'CD_EMPRESA'
      Origin = 'TEMPRESA_NAC.CD_EMPRESA'
      Size = 5
    end
    object qry_cliente_NM_EMPRESA: TStringField
      FieldName = 'NM_EMPRESA'
      Origin = 'TEMPRESA_NAC.NM_EMPRESA'
      Size = 50
    end
    object qry_cliente_AP_EMPRESA: TStringField
      FieldName = 'AP_EMPRESA'
      Origin = 'TEMPRESA_NAC.AP_EMPRESA'
      Size = 10
    end
  end
  object ds_receita_imp: TDataSource
    DataSet = qry_receita_imp_
    Left = 320
    Top = 475
  end
  object qry_receita_imp_: TQuery
    AfterOpen = qry_receita_imp_AfterOpen
    OnCalcFields = qry_receita_imp_CalcFields
    DatabaseName = 'DBBROKER'
    DataSource = ds_cliente_projecao
    SQL.Strings = (
      'SELECT *'
      'FROM TRECEITAS_IMP'
      'WHERE CD_CLIENTE = :CD_CLIENTE AND'
      'CD_UNID_NEG = :CD_UNID_NEG AND'
      'CD_PRODUTO = :CD_PRODUTO AND'
      'CD_SERVICO = :CD_SERVICO AND'
      'CD_ITEM = :CD_ITEM')
    Params.Data = {
      010005000A43445F434C49454E544500010200300001000B43445F554E49445F
      4E454700010200300001000A43445F50524F4455544F00010200300001000A43
      445F5345525649434F00010200300001000743445F4954454D00010200300001
      00}
    Left = 432
    Top = 475
    object qry_receita_imp_CD_CLIENTE: TStringField
      FieldName = 'CD_CLIENTE'
      Origin = 'TRECEITAS_IMP.CD_CLIENTE'
      Size = 5
    end
    object qry_receita_imp_CD_UNID_NEG: TStringField
      FieldName = 'CD_UNID_NEG'
      Origin = 'TRECEITAS_IMP.CD_UNID_NEG'
      Size = 2
    end
    object qry_receita_imp_CD_PRODUTO: TStringField
      FieldName = 'CD_PRODUTO'
      Origin = 'TRECEITAS_IMP.CD_PRODUTO'
      Size = 2
    end
    object qry_receita_imp_CD_SERVICO: TStringField
      FieldName = 'CD_SERVICO'
      Origin = 'TRECEITAS_IMP.CD_SERVICO'
      Size = 3
    end
    object qry_receita_imp_CD_ITEM: TStringField
      FieldName = 'CD_ITEM'
      Origin = 'TRECEITAS_IMP.CD_ITEM'
      Size = 3
    end
    object qry_receita_imp_CD_REGIME_TRIB: TStringField
      FieldName = 'CD_REGIME_TRIB'
      Origin = 'TRECEITAS_IMP.CD_REGIME_TRIB'
      Size = 1
    end
    object qry_receita_imp_TP_DT_BASE: TStringField
      FieldName = 'TP_DT_BASE'
      Origin = 'TRECEITAS_IMP.TP_DT_BASE'
      Size = 1
    end
    object qry_receita_imp_VL_NUM_TAXA: TFloatField
      FieldName = 'VL_NUM_TAXA'
      Origin = 'TRECEITAS_IMP.VL_NUMERADOR_TAXA'
      DisplayFormat = '#0,.0000'
      EditFormat = '#0.0000'
    end
    object qry_receita_imp_VL_DEN_TAXA: TFloatField
      FieldName = 'VL_DEN_TAXA'
      Origin = 'TRECEITAS_IMP.VL_DENOMINADOR_TAXA'
    end
    object qry_receita_imp_TP_BASE_CALC_TAXA: TStringField
      FieldName = 'TP_BASE_CALC_TAXA'
      Origin = 'TRECEITAS_IMP.TP_BASE_CALCULO_TAXA'
      Size = 1
    end
    object qry_receita_imp_CD_MOEDA_TAXA: TStringField
      FieldName = 'CD_MOEDA_TAXA'
      Origin = 'TRECEITAS_IMP.CD_MOEDA_TAXA'
      Size = 3
    end
    object qry_receita_imp_VL_NUM_ACR: TFloatField
      FieldName = 'VL_NUM_ACR'
      Origin = 'TRECEITAS_IMP.VL_NUMERADOR_ACRESCIMO'
      DisplayFormat = '#0,.0000'
      EditFormat = '#0.0000'
    end
    object qry_receita_imp_VL_DEN_ACR: TFloatField
      FieldName = 'VL_DEN_ACR'
      Origin = 'TRECEITAS_IMP.VL_DENOMINADOR_ACRESCIMO'
    end
    object qry_receita_imp_TP_BASE_CALC_ACR: TStringField
      FieldName = 'TP_BASE_CALC_ACR'
      Origin = 'TRECEITAS_IMP.TP_BASE_CALCULO_ACRESCIMO'
      Size = 1
    end
    object qry_receita_imp_CD_MOEDA_ACR: TStringField
      FieldName = 'CD_MOEDA_ACR'
      Origin = 'TRECEITAS_IMP.CD_MOEDA_ACRESCIMO'
      Size = 3
    end
    object qry_receita_imp_VL_NUM_FORA_REGIAO: TFloatField
      FieldName = 'VL_NUM_FORA_REGIAO'
      Origin = 'TRECEITAS_IMP.VL_NUMERADOR_FORA_REGIAO'
      DisplayFormat = '#0,.00'
      EditFormat = '#0.00'
    end
    object qry_receita_imp_VL_DEN_FORA_REGIAO: TFloatField
      FieldName = 'VL_DEN_FORA_REGIAO'
      Origin = 'TRECEITAS_IMP.VL_DENOMINADOR_FORA_REGIAO'
    end
    object qry_receita_imp_TP_BASE_CALC_FORA_REGIAO: TStringField
      FieldName = 'TP_BASE_CALC_FORA_REGIAO'
      Origin = 'TRECEITAS_IMP.TP_BASE_CALCULO_FORA_REGIAO'
      Size = 1
    end
    object qry_receita_imp_CD_MOEDA_FORA_REGIAO: TStringField
      FieldName = 'CD_MOEDA_FORA_REGIAO'
      Origin = 'TRECEITAS_IMP.CD_MOEDA_FORA_REGIAO'
      Size = 3
    end
    object qry_receita_imp_VL_NUM_MIN: TFloatField
      FieldName = 'VL_NUM_MIN'
      Origin = 'TRECEITAS_IMP.VL_NUMERADOR_MINIMO'
      DisplayFormat = '#0,.0000'
      EditFormat = '#0.0000'
    end
    object qry_receita_imp_VL_DEN_MIN: TFloatField
      FieldName = 'VL_DEN_MIN'
      Origin = 'TRECEITAS_IMP.VL_DENOMINADOR_MINIMO'
    end
    object qry_receita_imp_TP_BASE_CALC_MIN: TStringField
      FieldName = 'TP_BASE_CALC_MIN'
      Origin = 'TRECEITAS_IMP.TP_BASE_CALCULO_MINIMO'
      Size = 1
    end
    object qry_receita_imp_CD_MOEDA_MIN: TStringField
      FieldName = 'CD_MOEDA_MIN'
      Origin = 'TRECEITAS_IMP.CD_MOEDA_MINIMO'
      Size = 3
    end
    object qry_receita_imp_VL_NUM_MAX: TFloatField
      FieldName = 'VL_NUM_MAX'
      Origin = 'TRECEITAS_IMP.VL_NUMERADOR_MAXIMO'
      DisplayFormat = '#0,.0000'
      EditFormat = '#0.0000'
    end
    object qry_receita_imp_VL_DEN_MAX: TFloatField
      FieldName = 'VL_DEN_MAX'
      Origin = 'TRECEITAS_IMP.VL_DENOMINADOR_MAXIMO'
    end
    object qry_receita_imp_TP_BASE_CALC_MAX: TStringField
      FieldName = 'TP_BASE_CALC_MAX'
      Origin = 'TRECEITAS_IMP.TP_BASE_CALCULO_MAXIMO'
      Size = 1
    end
    object qry_receita_imp_CD_MOEDA_MAX: TStringField
      FieldName = 'CD_MOEDA_MAX'
      Origin = 'TRECEITAS_IMP.CD_MOEDA_MAXIMO'
      Size = 3
    end
    object qry_receita_imp_IN_ATIVO: TStringField
      FieldName = 'IN_ATIVO'
      Origin = 'TRECEITAS_IMP.CD_CLIENTE'
      Size = 1
    end
    object qry_receita_imp_LookAtivo: TStringField
      FieldName = 'LookAtivo'
      LookupDataSet = tbl_yesno_
      LookupKeyFields = 'CD_YESNO'
      LookupResultField = 'TX_YESNO'
      KeyFields = 'IN_ATIVO'
      Size = 3
      Lookup = True
    end
    object qry_receita_imp_LookRegimeTrib: TStringField
      FieldName = 'LookRegimeTrib'
      LookupDataSet = tbl_regime_trib_
      LookupKeyFields = 'CD_REGIME_TRIB'
      LookupResultField = 'NM_REGIME_TRIB'
      KeyFields = 'CD_REGIME_TRIB'
      Lookup = True
    end
    object qry_receita_imp_LookDtBase: TStringField
      FieldName = 'LookDtBase'
      LookupDataSet = tbl_dt_base_
      LookupKeyFields = 'CD_DT_BASE'
      LookupResultField = 'NM_DT_BASE'
      KeyFields = 'TP_DT_BASE'
      Lookup = True
    end
    object qry_receita_imp_LookBaseCalcTaxa: TStringField
      FieldName = 'LookBaseCalcTaxa'
      LookupDataSet = qry_base_calc_imp_
      LookupKeyFields = 'CD_BASE_CALCULO'
      LookupResultField = 'NM_BASE_CALCULO'
      KeyFields = 'TP_BASE_CALC_TAXA'
      Size = 30
      Lookup = True
    end
    object qry_receita_imp_LookBaseCalcAcr: TStringField
      FieldName = 'LookBaseCalcAcr'
      LookupDataSet = qry_base_calc_imp_
      LookupKeyFields = 'CD_BASE_CALCULO'
      LookupResultField = 'NM_BASE_CALCULO'
      KeyFields = 'TP_BASE_CALC_ACR'
      Size = 30
      Lookup = True
    end
    object qry_receita_imp_LookBaseCalcForaRegiao: TStringField
      FieldName = 'LookBaseCalcForaRegiao'
      LookupDataSet = qry_base_calc_imp_
      LookupKeyFields = 'CD_BASE_CALCULO'
      LookupResultField = 'NM_BASE_CALCULO'
      KeyFields = 'TP_BASE_CALC_FORA_REGIAO'
      Size = 30
      Lookup = True
    end
    object qry_receita_imp_LookBaseCalcMin: TStringField
      FieldName = 'LookBaseCalcMin'
      LookupDataSet = qry_base_calc_imp_
      LookupKeyFields = 'CD_BASE_CALCULO'
      LookupResultField = 'NM_BASE_CALCULO'
      KeyFields = 'TP_BASE_CALC_MIN'
      Size = 30
      Lookup = True
    end
    object qry_receita_imp_LookBaseCalcMax: TStringField
      FieldName = 'LookBaseCalcMax'
      LookupDataSet = qry_base_calc_imp_
      LookupKeyFields = 'CD_BASE_CALCULO'
      LookupResultField = 'NM_BASE_CALCULO'
      KeyFields = 'TP_BASE_CALC_MAX'
      Size = 30
      Lookup = True
    end
    object qry_receita_imp_LookMoedaTaxa: TStringField
      FieldName = 'LookMoedaTaxa'
      LookupDataSet = qry_moeda_
      LookupKeyFields = 'CD_MOEDA'
      LookupResultField = 'NM_MOEDA'
      KeyFields = 'CD_MOEDA_TAXA'
      Size = 30
      Lookup = True
    end
    object qry_receita_imp_LookMoedaAcr: TStringField
      FieldName = 'LookMoedaAcr'
      LookupDataSet = qry_moeda_
      LookupKeyFields = 'CD_MOEDA'
      LookupResultField = 'NM_MOEDA'
      KeyFields = 'CD_MOEDA_ACR'
      Size = 30
      Lookup = True
    end
    object qry_receita_imp_LookMoedaForaRegiao: TStringField
      FieldName = 'LookMoedaForaRegiao'
      LookupDataSet = qry_moeda_
      LookupKeyFields = 'CD_MOEDA'
      LookupResultField = 'NM_MOEDA'
      KeyFields = 'CD_MOEDA_FORA_REGIAO'
      Size = 30
      Lookup = True
    end
    object qry_receita_imp_LookMoedaMin: TStringField
      FieldName = 'LookMoedaMin'
      LookupDataSet = qry_moeda_
      LookupKeyFields = 'CD_MOEDA'
      LookupResultField = 'NM_MOEDA'
      KeyFields = 'CD_MOEDA_MIN'
      Size = 30
      Lookup = True
    end
    object qry_receita_imp_LookMoedaMax: TStringField
      FieldName = 'LookMoedaMax'
      LookupDataSet = qry_moeda_
      LookupKeyFields = 'CD_MOEDA'
      LookupResultField = 'NM_MOEDA'
      KeyFields = 'CD_MOEDA_MAX'
      Size = 30
      Lookup = True
    end
    object qry_receita_imp_Calc_Taxa: TFloatField
      FieldName = 'Calc_Taxa'
      DisplayFormat = '#0,.0000'
      EditFormat = '#0.0000'
      Calculated = True
    end
    object qry_receita_imp_Calc_Acr: TFloatField
      FieldName = 'Calc_Acr'
      DisplayFormat = '#0,.0000'
      EditFormat = '#0.0000'
      Calculated = True
    end
    object qry_receita_imp_Calc_Fora_Regiao: TFloatField
      FieldName = 'Calc_Fora_Regiao'
      DisplayFormat = '#0,.0000'
      EditFormat = '#0.0000'
      Calculated = True
    end
    object qry_receita_imp_Calc_Min: TFloatField
      FieldName = 'Calc_Min'
      DisplayFormat = '#0,.0000'
      EditFormat = '#0.0000'
      Calculated = True
    end
    object qry_receita_imp_Calc_Max: TFloatField
      FieldName = 'Calc_Max'
      DisplayFormat = '#0,.0000'
      EditFormat = '#0.0000'
      Calculated = True
    end
  end
  object ds_receita_exp: TDataSource
    DataSet = qry_receita_exp_
    Left = 320
    Top = 527
  end
  object qry_receita_exp_: TQuery
    AfterOpen = qry_receita_exp_AfterOpen
    OnCalcFields = qry_receita_exp_CalcFields
    DatabaseName = 'DBBROKER'
    DataSource = ds_cliente_projecao
    SQL.Strings = (
      'SELECT *'
      'FROM TRECEITAS_EXP'
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
    Left = 432
    Top = 527
    object qry_receita_exp_CD_UNID_NEG: TStringField
      FieldName = 'CD_UNID_NEG'
      Origin = 'TRECEITAS_EXP.CD_UNID_NEG'
      Size = 2
    end
    object qry_receita_exp_CD_PRODUTO: TStringField
      FieldName = 'CD_PRODUTO'
      Origin = 'TRECEITAS_EXP.CD_PRODUTO'
      Size = 2
    end
    object qry_receita_exp_CD_CLIENTE: TStringField
      FieldName = 'CD_CLIENTE'
      Origin = 'TRECEITAS_EXP.CD_CLIENTE'
      Size = 5
    end
    object qry_receita_exp_CD_SERVICO: TStringField
      FieldName = 'CD_SERVICO'
      Origin = 'TRECEITAS_EXP.CD_SERVICO'
      Size = 3
    end
    object qry_receita_exp_CD_ITEM: TStringField
      FieldName = 'CD_ITEM'
      Origin = 'TRECEITAS_EXP.CD_ITEM'
      Size = 3
    end
    object qry_receita_exp_TP_DT_BASE: TStringField
      FieldName = 'TP_DT_BASE'
      Origin = 'TRECEITAS_EXP.TP_DT_BASE'
      Size = 1
    end
    object qry_receita_exp_TP_FAIXA: TStringField
      FieldName = 'TP_FAIXA'
      Origin = 'TRECEITAS_EXP.TP_FAIXA'
      Size = 1
    end
    object qry_receita_exp_TP_FAIXA_VALOR: TStringField
      FieldName = 'TP_FAIXA_VALOR'
      Origin = 'TRECEITAS_EXP.TP_FAIXA_VALOR'
      Size = 1
    end
    object qry_receita_exp_VL_NUM_TAXA: TFloatField
      FieldName = 'VL_NUM_TAXA'
      Origin = 'TRECEITAS_EXP.VL_NUM_TAXA'
      DisplayFormat = '#0,.0000'
      EditFormat = '#0.0000'
    end
    object qry_receita_exp_VL_DEN_TAXA: TFloatField
      FieldName = 'VL_DEN_TAXA'
      Origin = 'TRECEITAS_EXP.VL_DEN_TAXA'
    end
    object qry_receita_exp_TP_BASE_CALC_TAXA: TStringField
      FieldName = 'TP_BASE_CALC_TAXA'
      Origin = 'TRECEITAS_EXP.TP_BASE_CALC_TAXA'
      Size = 1
    end
    object qry_receita_exp_CD_MOEDA_TAXA: TStringField
      FieldName = 'CD_MOEDA_TAXA'
      Origin = 'TRECEITAS_EXP.CD_MOEDA_TAXA'
      Size = 3
    end
    object qry_receita_exp_VL_NUM_MIN: TFloatField
      FieldName = 'VL_NUM_MIN'
      Origin = 'TRECEITAS_EXP.CD_UNID_NEG'
      DisplayFormat = '#0,.0000'
      EditFormat = '#0.0000'
    end
    object qry_receita_exp_VL_DEN_MIN: TFloatField
      FieldName = 'VL_DEN_MIN'
      Origin = 'TRECEITAS_EXP.VL_DEN_MIN'
    end
    object qry_receita_exp_TP_BASE_CALC_MIN: TStringField
      FieldName = 'TP_BASE_CALC_MIN'
      Origin = 'TRECEITAS_EXP.TP_BASE_CALC_MIN'
      Size = 1
    end
    object qry_receita_exp_CD_MOEDA_MIN: TStringField
      FieldName = 'CD_MOEDA_MIN'
      Origin = 'TRECEITAS_EXP.CD_MOEDA_MIN'
      Size = 3
    end
    object qry_receita_exp_VL_NUM_MAX: TFloatField
      FieldName = 'VL_NUM_MAX'
      Origin = 'TRECEITAS_EXP.VL_NUM_MAX'
      DisplayFormat = '#0,.0000'
      EditFormat = '#0.0000'
    end
    object qry_receita_exp_VL_DEN_MAX: TFloatField
      FieldName = 'VL_DEN_MAX'
      Origin = 'TRECEITAS_EXP.VL_DEN_MAX'
    end
    object qry_receita_exp_TP_BASE_CALC_MAX: TStringField
      FieldName = 'TP_BASE_CALC_MAX'
      Origin = 'TRECEITAS_EXP.TP_BASE_CALC_MAX'
      Size = 1
    end
    object qry_receita_exp_CD_MOEDA_MAX: TStringField
      FieldName = 'CD_MOEDA_MAX'
      Origin = 'TRECEITAS_EXP.CD_MOEDA_MAX'
      Size = 3
    end
    object qry_receita_exp_PC_REDUC_RE_CANC: TFloatField
      FieldName = 'PC_REDUC_RE_CANC'
      Origin = 'TRECEITAS_EXP.PC_REDUC_RE_CANC'
      DisplayFormat = '#0,.00'
      EditFormat = '#0.00'
    end
    object qry_receita_exp_IN_ATIVO: TStringField
      FieldName = 'IN_ATIVO'
      Origin = 'TRECEITAS_EXP.CD_UNID_NEG'
      Size = 1
    end
    object qry_receita_exp_LookDtBase: TStringField
      FieldName = 'LookDtBase'
      LookupDataSet = tbl_dt_base_
      LookupKeyFields = 'CD_DT_BASE'
      LookupResultField = 'NM_DT_BASE'
      KeyFields = 'TP_DT_BASE'
      Lookup = True
    end
    object qry_receita_exp_LookFaixa: TStringField
      FieldName = 'LookFaixa'
      LookupDataSet = tbl_tp_faixa_
      LookupKeyFields = 'TP_FAIXA'
      LookupResultField = 'NM_TP_FAIXA'
      KeyFields = 'TP_FAIXA'
      Lookup = True
    end
    object qry_receita_exp_LookFaixaValor: TStringField
      FieldName = 'LookFaixaValor'
      LookupDataSet = tbl_tp_faixa_valor_
      LookupKeyFields = 'TP_FAIXA_VALOR'
      LookupResultField = 'NM_TP_FAIXA_VALOR'
      KeyFields = 'TP_FAIXA_VALOR'
      Lookup = True
    end
    object qry_receita_exp_LookBaseCalcTaxa: TStringField
      FieldName = 'LookBaseCalcTaxa'
      LookupDataSet = qry_base_calc_exp_
      LookupKeyFields = 'CD_BASE_CALCULO'
      LookupResultField = 'NM_BASE_CALCULO'
      KeyFields = 'TP_BASE_CALC_TAXA'
      Size = 30
      Lookup = True
    end
    object qry_receita_exp_LookBaseCalcMin: TStringField
      FieldName = 'LookBaseCalcMin'
      LookupDataSet = qry_base_calc_exp_
      LookupKeyFields = 'CD_BASE_CALCULO'
      LookupResultField = 'NM_BASE_CALCULO'
      KeyFields = 'TP_BASE_CALC_MIN'
      Size = 30
      Lookup = True
    end
    object qry_receita_exp_LookBaseCalcMax: TStringField
      FieldName = 'LookBaseCalcMax'
      LookupDataSet = qry_base_calc_exp_
      LookupKeyFields = 'CD_BASE_CALCULO'
      LookupResultField = 'NM_BASE_CALCULO'
      KeyFields = 'TP_BASE_CALC_MAX'
      Size = 30
      Lookup = True
    end
    object qry_receita_exp_LookMoedaTaxa: TStringField
      FieldName = 'LookMoedaTaxa'
      LookupDataSet = qry_moeda_
      LookupKeyFields = 'CD_MOEDA'
      LookupResultField = 'NM_MOEDA'
      KeyFields = 'CD_MOEDA_TAXA'
      Size = 30
      Lookup = True
    end
    object qry_receita_exp_LookMoedaMin: TStringField
      FieldName = 'LookMoedaMin'
      LookupDataSet = qry_moeda_
      LookupKeyFields = 'CD_MOEDA'
      LookupResultField = 'NM_MOEDA'
      KeyFields = 'CD_MOEDA_MIN'
      Size = 30
      Lookup = True
    end
    object qry_receita_exp_LookMoedaMax: TStringField
      FieldName = 'LookMoedaMax'
      LookupDataSet = qry_moeda_
      LookupKeyFields = 'CD_MOEDA'
      LookupResultField = 'NM_MOEDA'
      KeyFields = 'CD_MOEDA_MAX'
      Size = 30
      Lookup = True
    end
    object qry_receita_exp_Calc_Taxa2: TFloatField
      FieldName = 'Calc_Taxa2'
      ImportedConstraint = '#0.00'
      DisplayFormat = '#0,.0000'
      EditFormat = '#0.0000'
      Calculated = True
    end
    object qry_receita_exp_Calc_Min2: TFloatField
      FieldName = 'Calc_Min2'
      DisplayFormat = '#0,.0000'
      EditFormat = '#0.0000'
      Calculated = True
    end
    object qry_receita_exp_Calc_Max2: TFloatField
      FieldName = 'Calc_Max2'
      DisplayFormat = '#0,.0000'
      EditFormat = '#0.0000'
      Calculated = True
    end
  end
  object sp_ensaios: TStoredProc
    DatabaseName = 'DBBROKER'
    StoredProcName = 'dbo.sp_ensaios'
    Params.Data = {
      01000A0006526573756C74040304000000000000000B4063645F636C69656E74
      6501010200300000000C4063645F756E69645F6E656701010200300000000B40
      63645F70726F6475746F01010200300000000B4063645F7365727669636F0101
      020030000000084063645F6974656D0101020030000000074064745F696E6901
      0B080000002C845D40CB420000074064745F66696D010B080000002C845D40CB
      42000009406F7065726163616F010102003000000004406D6F64010102003000
      0000}
    Left = 160
    Top = 363
  end
  object sp_rel_ensaio: TStoredProc
    DatabaseName = 'DBBROKER'
    StoredProcName = 'dbo.sp_rel_ensaio'
    Params.Data = {
      0100090006526573756C74040304000000000000000B4063645F636C69656E74
      6501010200300000000C4063645F756E69645F6E656701010200300000000B40
      63645F70726F6475746F0101020030000000074064745F696E69010B08000000
      2C845D40CB420000074064745F66696D010B080000002C845D40CB4200000940
      63645F6974656D310101020030000000094063645F6974656D32010102003000
      0000094063645F6974656D330101020030000000}
    Left = 160
    Top = 423
  end
end
