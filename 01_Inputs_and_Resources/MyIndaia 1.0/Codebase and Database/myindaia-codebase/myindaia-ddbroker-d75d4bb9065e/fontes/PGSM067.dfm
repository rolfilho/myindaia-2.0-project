object datm_cliente_numerario: Tdatm_cliente_numerario
  OldCreateOrder = True
  Left = 74
  Height = 618
  Width = 603
  object ds_cliente_numerario: TDataSource
    DataSet = qry_cliente_numerario_
    Left = 38
    Top = 12
  end
  object qry_cliente_numerario_: TQuery
    AfterScroll = qry_cliente_numerario_AfterScroll
    DatabaseName = 'DBBROKER'
    ParamCheck = False
    RequestLive = True
    SQL.Strings = (
      'SELECT * FROM '
      'TCLIENTE_NUMERARIO'
      'WHERE CD_CLIENTE = :CD_CLIENTE AND'
      'CD_UNID_NEG = :CD_UNID_NEG AND'
      'CD_PRODUTO = :CD_PRODUTO AND'
      'CD_SERVICO = :CD_SERVICO')
    Left = 159
    Top = 12
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
      end>
    object qry_cliente_numerario_CD_CLIENTE: TStringField
      FieldName = 'CD_CLIENTE'
      Origin = 'TCLIENTE_NUMERARIO.CD_CLIENTE'
      Size = 5
    end
    object qry_cliente_numerario_CD_UNID_NEG: TStringField
      FieldName = 'CD_UNID_NEG'
      Origin = 'TCLIENTE_NUMERARIO.CD_UNID_NEG'
      Size = 2
    end
    object qry_cliente_numerario_CD_PRODUTO: TStringField
      FieldName = 'CD_PRODUTO'
      Origin = 'TCLIENTE_NUMERARIO.CD_PRODUTO'
      Size = 2
    end
    object qry_cliente_numerario_CD_SERVICO: TStringField
      FieldName = 'CD_SERVICO'
      Origin = 'TCLIENTE_NUMERARIO.CD_SERVICO'
      Size = 3
    end
    object qry_cliente_numerario_NR_SOLICITACAO: TStringField
      Alignment = taRightJustify
      DisplayLabel = 'N'#186' Solicita'#231#227'o'
      FieldName = 'NR_SOLICITACAO'
      Origin = 'TCLIENTE_NUMERARIO.NR_SOLICITACAO'
      Size = 3
    end
    object qry_cliente_numerario_CD_ITEM: TStringField
      DisplayLabel = 'C'#243'd.'
      FieldName = 'CD_ITEM'
      Origin = 'TCLIENTE_NUMERARIO.CD_ITEM'
      Size = 3
    end
    object qry_cliente_numerario_TP_CALCULO: TStringField
      FieldName = 'TP_CALCULO'
      Origin = 'TCLIENTE_NUMERARIO.TP_CALCULO'
      Size = 3
    end
    object qry_cliente_numerario_CD_BANCO: TStringField
      FieldName = 'CD_BANCO'
      Origin = 'TCLIENTE_NUMERARIO.CD_BANCO'
      Size = 3
    end
    object qry_cliente_numerario_TP_DESTINO: TStringField
      FieldName = 'TP_DESTINO'
      Origin = 'TCLIENTE_NUMERARIO.CD_CLIENTE'
      Size = 1
    end
    object qry_cliente_numerario_LookCliente: TStringField
      FieldKind = fkLookup
      FieldName = 'LookCliente'
      LookupDataSet = qry_empresa_nac_
      LookupKeyFields = 'CD_EMPRESA'
      LookupResultField = 'NM_EMPRESA'
      KeyFields = 'CD_CLIENTE'
      Size = 50
      Lookup = True
    end
    object qry_cliente_numerario_LookUnidNeg: TStringField
      FieldKind = fkLookup
      FieldName = 'LookUnidNeg'
      LookupDataSet = qry_unid_neg_
      LookupKeyFields = 'CD_UNID_NEG'
      LookupResultField = 'NM_UNID_NEG'
      KeyFields = 'CD_UNID_NEG'
      Size = 50
      Lookup = True
    end
    object qry_cliente_numerario_LookProduto: TStringField
      FieldKind = fkLookup
      FieldName = 'LookProduto'
      LookupDataSet = qry_produto_
      LookupKeyFields = 'CD_PRODUTO'
      LookupResultField = 'NM_PRODUTO'
      KeyFields = 'CD_PRODUTO'
      Size = 40
      Lookup = True
    end
    object qry_cliente_numerario_LookServico: TStringField
      FieldKind = fkLookup
      FieldName = 'LookServico'
      LookupDataSet = qry_servico_
      LookupKeyFields = 'CD_SERVICO'
      LookupResultField = 'NM_SERVICO'
      KeyFields = 'CD_SERVICO'
      Size = 50
      Lookup = True
    end
    object qry_cliente_numerario_LookItem: TStringField
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
    object qry_cliente_numerario_LookCalculo: TStringField
      FieldKind = fkLookup
      FieldName = 'LookCalculo'
      LookupDataSet = qry_calculo_
      LookupKeyFields = 'CD_CALCULO'
      LookupResultField = 'NM_CALCULO'
      KeyFields = 'TP_CALCULO'
      Size = 40
      Lookup = True
    end
    object qry_cliente_numerario_LookBanco: TStringField
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
    object qry_cliente_numerario_LookTabelaCalculo: TStringField
      FieldKind = fkLookup
      FieldName = 'LookTabelaCalculo'
      LookupDataSet = qry_calculo_
      LookupKeyFields = 'CD_CALCULO'
      LookupResultField = 'CD_TABELA'
      KeyFields = 'TP_CALCULO'
      Size = 1
      Lookup = True
    end
    object qry_cliente_numerario_LookTabCalculo: TStringField
      FieldKind = fkLookup
      FieldName = 'LookTabCalculo'
      LookupDataSet = qry_calculo_
      LookupKeyFields = 'CD_CALCULO'
      LookupResultField = 'CD_TABELA'
      KeyFields = 'TP_CALCULO'
      Size = 1
      Lookup = True
    end
    object qry_cliente_numerario_LookTpDestino: TStringField
      DisplayLabel = 'Tipo de Destino'
      FieldKind = fkLookup
      FieldName = 'LookTpDestino'
      LookupDataSet = qry_tp_destino_
      LookupKeyFields = 'CD_TP_DESTINO'
      LookupResultField = 'NM_TP_DESTINO'
      KeyFields = 'TP_DESTINO'
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
    Left = 159
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
    Left = 159
    Top = 155
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
    Left = 159
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
      'FROM TSERVICO'
      'UNION ALL'
      'SELECT CONVERT(VARCHAR, CD_SERVICO), NM_SERVICO '
      'FROM TSERVICO_NOVO')
    Left = 159
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
    Left = 159
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
  object ds_banco: TDataSource
    DataSet = qry_banco_
    Left = 38
    Top = 301
  end
  object qry_banco_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT * '
      'FROM TBANCO')
    Left = 159
    Top = 300
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
      Origin = 'TBANCO.CD_BANCO'
      Size = 10
    end
    object qry_banco_NR_CONTA: TStringField
      FieldName = 'NR_CONTA'
      Origin = 'TBANCO.NM_BANCO'
      Size = 10
    end
    object qry_banco_CD_AGENCIA: TStringField
      FieldName = 'CD_AGENCIA'
      Origin = 'TBANCO.AP_BANCO'
      Size = 5
    end
    object qry_banco_IN_ATIVO: TStringField
      FieldName = 'IN_ATIVO'
      Origin = 'TBANCO.CD_AGENCIA'
      Size = 1
    end
    object qry_banco_TP_CONTA: TStringField
      FieldName = 'TP_CONTA'
      Origin = 'TBANCO.CD_CT_CONTABIL'
      Size = 1
    end
    object qry_banco_IN_FINANCEIRO: TStringField
      FieldName = 'IN_FINANCEIRO'
      Origin = 'TBANCO.IN_ATIVO'
      Size = 1
    end
    object qry_banco_CD_CT_CONTABIL: TStringField
      FieldName = 'CD_CT_CONTABIL'
      Origin = 'TBANCO.CD_BANCO'
      Size = 10
    end
  end
  object ds_calculo: TDataSource
    DataSet = qry_calculo_
    Left = 38
    Top = 353
  end
  object qry_calculo_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT *'
      'FROM TCALCULO')
    Left = 159
    Top = 352
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
    Left = 430
    Top = 12
  end
  object ds_yesno: TDataSource
    DataSet = tbl_yesno_
    Left = 320
    Top = 12
  end
  object tbl_regime_trib_: TTable
    DatabaseName = 'DBBROKER'
    TableName = 'TREGIME_TRIB'
    Left = 430
    Top = 60
  end
  object ds_regime_trib: TDataSource
    DataSet = tbl_regime_trib_
    Left = 320
    Top = 60
  end
  object tbl_dt_base_: TTable
    DatabaseName = 'DBBROKER'
    TableName = 'TDT_BASE_MOEDA_IND'
    Left = 430
    Top = 109
  end
  object ds_dt_base: TDataSource
    DataSet = tbl_dt_base_
    Left = 320
    Top = 109
  end
  object ds_receita_imp: TDataSource
    DataSet = qry_receita_imp_
    Left = 320
    Top = 357
  end
  object qry_receita_imp_: TQuery
    OnCalcFields = qry_receita_imp_CalcFields
    DatabaseName = 'DBBROKER'
    DataSource = ds_cliente_numerario
    RequestLive = True
    SQL.Strings = (
      'SELECT *'
      'FROM TRECEITAS_IMP'
      'WHERE CD_CLIENTE = :CD_CLIENTE AND'
      'CD_UNID_NEG = :CD_UNID_NEG AND'
      'CD_PRODUTO = :CD_PRODUTO AND'
      'CD_SERVICO = :CD_SERVICO AND'
      'CD_ITEM = :CD_ITEM')
    Left = 430
    Top = 360
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
      DisplayFormat = '#0,.00'
      EditFormat = '#0.00'
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
      DisplayFormat = '#0,.00'
      EditFormat = '#0.00'
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
      DisplayFormat = '#0,.00'
      EditFormat = '#0.00'
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
      DisplayFormat = '#0,.00'
      EditFormat = '#0.00'
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
      Origin = 'TRECEITAS_IMP.IN_ATIVO'
      Size = 1
    end
    object qry_receita_imp_LookAtivo: TStringField
      FieldKind = fkLookup
      FieldName = 'LookAtivo'
      LookupDataSet = tbl_yesno_
      LookupKeyFields = 'CD_YESNO'
      LookupResultField = 'TX_YESNO'
      KeyFields = 'IN_ATIVO'
      Size = 3
      Lookup = True
    end
    object qry_receita_imp_LookRegimeTrib: TStringField
      FieldKind = fkLookup
      FieldName = 'LookRegimeTrib'
      LookupDataSet = tbl_regime_trib_
      LookupKeyFields = 'CD_REGIME_TRIB'
      LookupResultField = 'NM_REGIME_TRIB'
      KeyFields = 'CD_REGIME_TRIB'
      Lookup = True
    end
    object qry_receita_imp_LookDtBase: TStringField
      FieldKind = fkLookup
      FieldName = 'LookDtBase'
      LookupDataSet = tbl_dt_base_
      LookupKeyFields = 'CD_DT_BASE'
      LookupResultField = 'NM_DT_BASE'
      KeyFields = 'TP_DT_BASE'
      Lookup = True
    end
    object qry_receita_imp_LookBaseCalcTaxa: TStringField
      FieldKind = fkLookup
      FieldName = 'LookBaseCalcTaxa'
      LookupDataSet = qry_base_calc_imp_
      LookupKeyFields = 'CD_BASE_CALCULO'
      LookupResultField = 'NM_BASE_CALCULO'
      KeyFields = 'TP_BASE_CALC_TAXA'
      Size = 30
      Lookup = True
    end
    object qry_receita_imp_LookBaseCalcAcr: TStringField
      FieldKind = fkLookup
      FieldName = 'LookBaseCalcAcr'
      LookupDataSet = qry_base_calc_imp_
      LookupKeyFields = 'CD_BASE_CALCULO'
      LookupResultField = 'NM_BASE_CALCULO'
      KeyFields = 'TP_BASE_CALC_ACR'
      Size = 30
      Lookup = True
    end
    object qry_receita_imp_LookBaseCalcForaRegiao: TStringField
      FieldKind = fkLookup
      FieldName = 'LookBaseCalcForaRegiao'
      LookupDataSet = qry_base_calc_imp_
      LookupKeyFields = 'CD_BASE_CALCULO'
      LookupResultField = 'NM_BASE_CALCULO'
      KeyFields = 'TP_BASE_CALC_FORA_REGIAO'
      Size = 30
      Lookup = True
    end
    object qry_receita_imp_LookBaseCalcMin: TStringField
      FieldKind = fkLookup
      FieldName = 'LookBaseCalcMin'
      LookupDataSet = qry_base_calc_imp_
      LookupKeyFields = 'CD_BASE_CALCULO'
      LookupResultField = 'NM_BASE_CALCULO'
      KeyFields = 'TP_BASE_CALC_MIN'
      Size = 30
      Lookup = True
    end
    object qry_receita_imp_LookBaseCalcMax: TStringField
      FieldKind = fkLookup
      FieldName = 'LookBaseCalcMax'
      LookupDataSet = qry_base_calc_imp_
      LookupKeyFields = 'CD_BASE_CALCULO'
      LookupResultField = 'NM_BASE_CALCULO'
      KeyFields = 'TP_BASE_CALC_MAX'
      Size = 30
      Lookup = True
    end
    object qry_receita_imp_LookMoedaTaxa: TStringField
      FieldKind = fkLookup
      FieldName = 'LookMoedaTaxa'
      LookupDataSet = qry_moeda_
      LookupKeyFields = 'CD_MOEDA'
      LookupResultField = 'NM_MOEDA'
      KeyFields = 'CD_MOEDA_TAXA'
      Size = 30
      Lookup = True
    end
    object qry_receita_imp_LookMoedaAcr: TStringField
      FieldKind = fkLookup
      FieldName = 'LookMoedaAcr'
      LookupDataSet = qry_moeda_
      LookupKeyFields = 'CD_MOEDA'
      LookupResultField = 'NM_MOEDA'
      KeyFields = 'CD_MOEDA_ACR'
      Size = 30
      Lookup = True
    end
    object qry_receita_imp_LookMoedaForaRegiao: TStringField
      FieldKind = fkLookup
      FieldName = 'LookMoedaForaRegiao'
      LookupDataSet = qry_moeda_
      LookupKeyFields = 'CD_MOEDA'
      LookupResultField = 'NM_MOEDA'
      KeyFields = 'CD_MOEDA_FORA_REGIAO'
      Size = 30
      Lookup = True
    end
    object qry_receita_imp_LookMoedaMin: TStringField
      FieldKind = fkLookup
      FieldName = 'LookMoedaMin'
      LookupDataSet = qry_moeda_
      LookupKeyFields = 'CD_MOEDA'
      LookupResultField = 'NM_MOEDA'
      KeyFields = 'CD_MOEDA_MIN'
      Size = 30
      Lookup = True
    end
    object qry_receita_imp_LookMoedaMax: TStringField
      FieldKind = fkLookup
      FieldName = 'LookMoedaMax'
      LookupDataSet = qry_moeda_
      LookupKeyFields = 'CD_MOEDA'
      LookupResultField = 'NM_MOEDA'
      KeyFields = 'CD_MOEDA_MAX'
      Size = 30
      Lookup = True
    end
    object qry_receita_imp_Calc_Taxa: TFloatField
      FieldKind = fkCalculated
      FieldName = 'Calc_Taxa'
      DisplayFormat = '#0,.0000'
      EditFormat = '#0.0000'
      Calculated = True
    end
    object qry_receita_imp_Calc_Acr: TFloatField
      FieldKind = fkCalculated
      FieldName = 'Calc_Acr'
      DisplayFormat = '#0,.0000'
      EditFormat = '#0.0000'
      Calculated = True
    end
    object qry_receita_imp_Calc_Fora_Regiao: TFloatField
      FieldKind = fkCalculated
      FieldName = 'Calc_Fora_Regiao'
      DisplayFormat = '#0,.0000'
      EditFormat = '#0.0000'
      Calculated = True
    end
    object qry_receita_imp_Calc_Min: TFloatField
      FieldKind = fkCalculated
      FieldName = 'Calc_Min'
      DisplayFormat = '#0,.0000'
      EditFormat = '#0.0000'
      Calculated = True
    end
    object qry_receita_imp_Calc_Max: TFloatField
      FieldKind = fkCalculated
      FieldName = 'Calc_Max'
      DisplayFormat = '#0,.0000'
      EditFormat = '#0.0000'
      Calculated = True
    end
  end
  object ds_moeda: TDataSource
    DataSet = qry_moeda_
    Left = 38
    Top = 405
  end
  object qry_moeda_: TQuery
    DatabaseName = 'DBBROKER'
    RequestLive = True
    SQL.Strings = (
      'SELECT CD_MOEDA, NM_MOEDA FROM TMOEDA_BROKER')
    Left = 159
    Top = 405
    object qry_moeda_CD_MOEDA: TStringField
      DisplayLabel = 'C'#243'digo'
      FieldName = 'CD_MOEDA'
      Origin = 'TMOEDA.CD_MOEDA'
      Size = 3
    end
    object qry_moeda_NM_MOEDA: TStringField
      DisplayLabel = 'Descri'#231#227'o'
      FieldName = 'NM_MOEDA'
      Origin = 'TMOEDA.NM_MOEDA'
      Size = 30
    end
  end
  object tbl_tp_faixa_: TTable
    DatabaseName = 'DBBROKER'
    TableName = 'TTP_FAIXA'
    Left = 430
    Top = 161
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
    Top = 161
  end
  object tbl_tp_faixa_valor_: TTable
    DatabaseName = 'DBBROKER'
    TableName = 'TTP_FAIXA_VALOR'
    Left = 430
    Top = 209
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
    Top = 209
  end
  object ds_receita_exp: TDataSource
    DataSet = qry_receita_exp_
    Left = 320
    Top = 409
  end
  object qry_receita_exp_: TQuery
    AfterScroll = qry_receita_exp_AfterScroll
    OnCalcFields = qry_receita_exp_CalcFields
    DatabaseName = 'DBBROKER'
    DataSource = ds_cliente_numerario
    ParamCheck = False
    RequestLive = True
    SQL.Strings = (
      'SELECT *'
      'FROM TRECEITAS_EXP'
      'WHERE CD_CLIENTE = :CD_CLIENTE AND'
      'CD_UNID_NEG = :CD_UNID_NEG AND'
      'CD_PRODUTO = :CD_PRODUTO AND'
      'CD_SERVICO = :CD_SERVICO AND'
      'CD_ITEM = :CD_ITEM')
    Left = 430
    Top = 408
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
    object qry_receita_exp_LookDtBase: TStringField
      FieldKind = fkLookup
      FieldName = 'LookDtBase'
      LookupDataSet = tbl_dt_base_
      LookupKeyFields = 'CD_DT_BASE'
      LookupResultField = 'NM_DT_BASE'
      KeyFields = 'TP_DT_BASE'
      Lookup = True
    end
    object qry_receita_exp_LookFaixa: TStringField
      FieldKind = fkLookup
      FieldName = 'LookFaixa'
      LookupDataSet = tbl_tp_faixa_
      LookupKeyFields = 'TP_FAIXA'
      LookupResultField = 'NM_TP_FAIXA'
      KeyFields = 'TP_FAIXA'
      Lookup = True
    end
    object qry_receita_exp_LookFaixaValor: TStringField
      FieldKind = fkLookup
      FieldName = 'LookFaixaValor'
      LookupDataSet = tbl_tp_faixa_valor_
      LookupKeyFields = 'TP_FAIXA_VALOR'
      LookupResultField = 'NM_TP_FAIXA_VALOR'
      KeyFields = 'TP_FAIXA_VALOR'
      Lookup = True
    end
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
      DisplayFormat = '#0,.00'
      EditFormat = '#0.00'
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
      Origin = 'TRECEITAS_EXP.VL_NUM_MIN'
      DisplayFormat = '#0,.00'
      EditFormat = '#0.00'
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
      DisplayFormat = '#0,.00'
      EditFormat = '#0.00'
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
      Origin = 'TRECEITAS_EXP.IN_ATIVO'
      Size = 1
    end
    object qry_receita_exp_LookBaseCalcTaxa: TStringField
      FieldKind = fkLookup
      FieldName = 'LookBaseCalcTaxa'
      LookupDataSet = qry_base_calc_exp_
      LookupKeyFields = 'CD_BASE_CALCULO'
      LookupResultField = 'NM_BASE_CALCULO'
      KeyFields = 'TP_BASE_CALC_TAXA'
      Size = 30
      Lookup = True
    end
    object qry_receita_exp_LookBaseCalcMin: TStringField
      FieldKind = fkLookup
      FieldName = 'LookBaseCalcMin'
      LookupDataSet = qry_base_calc_exp_
      LookupKeyFields = 'CD_BASE_CALCULO'
      LookupResultField = 'NM_BASE_CALCULO'
      KeyFields = 'TP_BASE_CALC_MIN'
      Size = 30
      Lookup = True
    end
    object qry_receita_exp_LookBaseCalcMax: TStringField
      FieldKind = fkLookup
      FieldName = 'LookBaseCalcMax'
      LookupDataSet = qry_base_calc_exp_
      LookupKeyFields = 'CD_BASE_CALCULO'
      LookupResultField = 'NM_BASE_CALCULO'
      KeyFields = 'TP_BASE_CALC_MAX'
      Size = 30
      Lookup = True
    end
    object qry_receita_exp_LookMoedaTaxa: TStringField
      FieldKind = fkLookup
      FieldName = 'LookMoedaTaxa'
      LookupDataSet = qry_moeda_
      LookupKeyFields = 'CD_MOEDA'
      LookupResultField = 'NM_MOEDA'
      KeyFields = 'CD_MOEDA_TAXA'
      Size = 30
      Lookup = True
    end
    object qry_receita_exp_LookMoedaMin: TStringField
      FieldKind = fkLookup
      FieldName = 'LookMoedaMin'
      LookupDataSet = qry_moeda_
      LookupKeyFields = 'CD_MOEDA'
      LookupResultField = 'NM_MOEDA'
      KeyFields = 'CD_MOEDA_MIN'
      Size = 30
      Lookup = True
    end
    object qry_receita_exp_LookMoedaMax: TStringField
      FieldKind = fkLookup
      FieldName = 'LookMoedaMax'
      LookupDataSet = qry_moeda_
      LookupKeyFields = 'CD_MOEDA'
      LookupResultField = 'NM_MOEDA'
      KeyFields = 'CD_MOEDA_MAX'
      Size = 30
      Lookup = True
    end
    object qry_receita_exp_Calc_Taxa2: TFloatField
      FieldKind = fkCalculated
      FieldName = 'Calc_Taxa2'
      DisplayFormat = '#0,.00'
      EditFormat = '#0.00'
      Calculated = True
    end
    object qry_receita_exp_Calc_Min2: TFloatField
      FieldKind = fkCalculated
      FieldName = 'Calc_Min2'
      DisplayFormat = '#0,.00'
      EditFormat = '#0.00'
      Calculated = True
    end
    object qry_receita_exp_Calc_Max2: TFloatField
      FieldKind = fkCalculated
      FieldName = 'Calc_Max2'
      DisplayFormat = '#0,.00'
      EditFormat = '#0.00'
      Calculated = True
    end
  end
  object sp_receitas: TStoredProc
    DatabaseName = 'DBBROKER'
    StoredProcName = 'dbo.sp_receitas'
    Left = 159
    Top = 464
    ParamData = <
      item
        DataType = ftInteger
        Name = 'Result'
        ParamType = ptResult
      end
      item
        DataType = ftString
        Name = '@cd_cliente'
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
        DataType = ftString
        Name = '@cd_servico'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = '@cd_item'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = '@operacao'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = '@mod'
        ParamType = ptInput
      end>
  end
  object ds_base_calc_imp: TDataSource
    DataSet = qry_base_calc_imp_
    Left = 320
    Top = 308
  end
  object qry_base_calc_imp_: TQuery
    DatabaseName = 'DBBROKER'
    RequestLive = True
    SQL.Strings = (
      'SELECT CD_BASE_CALCULO, NM_BASE_CALCULO'
      'FROM TBASE_CALCULO'
      'WHERE IN_IMP = '#39'1'#39)
    Left = 430
    Top = 308
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
    Top = 259
  end
  object qry_base_calc_exp_: TQuery
    DatabaseName = 'DBBROKER'
    RequestLive = True
    SQL.Strings = (
      'SELECT CD_BASE_CALCULO, NM_BASE_CALCULO'
      'FROM TBASE_CALCULO'
      'WHERE IN_EXP = '#39'1'#39)
    Left = 430
    Top = 259
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
  object ds_tp_destino: TDataSource
    DataSet = qry_tp_destino_
    Left = 320
    Top = 465
  end
  object qry_tp_destino_: TQuery
    DatabaseName = 'DBBROKER'
    ParamCheck = False
    SQL.Strings = (
      'SELECT *'
      'FROM TTP_DESTINO')
    Left = 430
    Top = 464
    object qry_tp_destino_CD_TP_DESTINO: TStringField
      FieldName = 'CD_TP_DESTINO'
      Origin = 'TTP_DESTINO.CD_TP_DESTINO'
      Size = 1
    end
    object qry_tp_destino_NM_TP_DESTINO: TStringField
      FieldName = 'NM_TP_DESTINO'
      Origin = 'TTP_DESTINO.NM_TP_DESTINO'
    end
  end
end
