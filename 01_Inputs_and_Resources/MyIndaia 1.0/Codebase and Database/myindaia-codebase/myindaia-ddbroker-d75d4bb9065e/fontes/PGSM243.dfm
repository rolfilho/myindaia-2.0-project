object datm_cliente_agente: Tdatm_cliente_agente
  Left = 289
  Top = 157
  Height = 515
  Width = 374
  object ds_cliente_ag: TDataSource
    DataSet = qry_cliente_ag_
    Left = 51
    Top = 12
  end
  object qry_cliente_ag_: TQuery
    CachedUpdates = True
    AfterScroll = qry_cliente_ag_AfterScroll
    OnCalcFields = qry_cliente_ag_CalcFields
    DatabaseName = 'DBBROKER'
    SessionName = 'Default'
    SQL.Strings = (
      'SELECT * FROM '
      'TCLIENTE_AGENTE'
      'WHERE CD_CLIENTE = :CD_CLIENTE AND'
      'CD_UNID_NEG = :CD_UNID_NEG AND'
      'CD_PRODUTO = :CD_PRODUTO '
      'ORDER BY CD_AGENTE')
    Params.Data = {
      010003000A43445F434C49454E544500010200300000000B43445F554E49445F
      4E454700010200300000000A43445F50524F4455544F0001020030000000}
    UpdateObject = us_cliente_ag
    Left = 170
    Top = 12
    object qry_cliente_ag_CD_CLIENTE: TStringField
      FieldName = 'CD_CLIENTE'
      Origin = 'TCLIENTE_AGENTE.CD_CLIENTE'
      Size = 5
    end
    object qry_cliente_ag_CD_UNID_NEG: TStringField
      FieldName = 'CD_UNID_NEG'
      Origin = 'TCLIENTE_AGENTE.CD_UNID_NEG'
      Size = 2
    end
    object qry_cliente_ag_CD_PRODUTO: TStringField
      FieldName = 'CD_PRODUTO'
      Origin = 'TCLIENTE_AGENTE.CD_PRODUTO'
      Size = 2
    end
    object qry_cliente_ag_CD_AGENTE: TStringField
      FieldName = 'CD_AGENTE'
      Origin = 'TCLIENTE_AGENTE.CD_AGENTE'
      Size = 4
    end
    object qry_cliente_ag_NR_DIAS_FREE_TIME: TIntegerField
      FieldName = 'NR_DIAS_FREE_TIME'
      Origin = 'TCLIENTE_AGENTE.NR_DIAS_FREE_TIME'
    end
    object qry_cliente_ag_IN_ATIVO: TStringField
      FieldName = 'IN_ATIVO'
      Origin = 'TCLIENTE_AGENTE.CD_CLIENTE'
      Size = 1
    end
    object qry_cliente_ag_LookCliente: TStringField
      FieldName = 'LookCliente'
      Size = 50
      Calculated = True
    end
    object qry_cliente_ag_LookUnidNeg: TStringField
      FieldName = 'LookUnidNeg'
      Size = 50
      Calculated = True
    end
    object qry_cliente_ag_LookProduto: TStringField
      FieldName = 'LookProduto'
      Size = 40
      Calculated = True
    end
    object qry_cliente_ag_LookAgente: TStringField
      DisplayLabel = 'Agente'
      FieldName = 'LookAgente'
      Size = 60
      Calculated = True
    end
    object qry_cliente_ag_LookAtivo: TStringField
      DisplayLabel = 'Ativo'
      FieldName = 'LookAtivo'
      LookupDataSet = qry_yes_no_
      LookupKeyFields = 'CD_YESNO'
      LookupResultField = 'TX_YESNO'
      KeyFields = 'IN_ATIVO'
      Size = 3
      Lookup = True
    end
    object qry_cliente_ag_CD_TRANSPORTADOR: TStringField
      FieldName = 'CD_TRANSPORTADOR'
      Origin = 'TCLIENTE_AGENTE.CD_CLIENTE'
      Size = 4
    end
    object qry_cliente_ag_LookTransp: TStringField
      FieldName = 'LookTransp'
      Calculated = True
    end
  end
  object ds_empresa_nac: TDataSource
    DataSet = qry_empresa_nac_
    Left = 51
    Top = 121
  end
  object qry_empresa_nac_: TQuery
    DatabaseName = 'DBBROKER'
    ParamCheck = False
    SQL.Strings = (
      'SELECT CD_EMPRESA, NM_EMPRESA'
      'FROM   TEMPRESA_NAC'
      'WHERE  CD_EMPRESA = :CD_EMPRESA')
    Params.Data = {010001000A43445F454D50524553410001020030000000}
    Left = 170
    Top = 121
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
  object ds_yesno: TDataSource
    Left = 51
    Top = 265
  end
  object ds_unid_neg: TDataSource
    DataSet = qry_unid_neg_
    Left = 51
    Top = 169
  end
  object ds_produto: TDataSource
    DataSet = qry_produto_
    Left = 51
    Top = 217
  end
  object qry_produto_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT CD_PRODUTO, NM_PRODUTO'
      'FROM   TPRODUTO'
      'WHERE  CD_PRODUTO = :CD_PRODUTO')
    Params.Data = {010001000A43445F50524F4455544F0001020030000000}
    Left = 170
    Top = 217
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
      'SELECT CD_UNID_NEG, NM_UNID_NEG'
      'FROM   TUNID_NEG'
      'WHERE  CD_UNID_NEG = :CD_UNID_NEG')
    Params.Data = {010001000B43445F554E49445F4E45470001020030000000}
    Left = 170
    Top = 169
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
  object ds_ag: TDataSource
    DataSet = qry_ag_
    Left = 51
    Top = 312
  end
  object qry_ag_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT CD_AGENTE, NM_AGENTE'
      'FROM   TAGENTE'
      'WHERE  CD_AGENTE = :CD_AGENTE')
    Params.Data = {010001000943445F4147454E54450001020030000000}
    Left = 170
    Top = 312
    object qry_ag_CD_AGENTE: TStringField
      FieldName = 'CD_AGENTE'
      Origin = 'TAGENTE.CD_AGENTE'
      Size = 4
    end
    object qry_ag_NM_AGENTE: TStringField
      FieldName = 'NM_AGENTE'
      Origin = 'TAGENTE.NM_AGENTE'
      Size = 60
    end
  end
  object ds_cliente_ag_dem: TDataSource
    DataSet = qry_cliente_ag_dem_
    Left = 51
    Top = 67
  end
  object qry_cliente_ag_dem_: TQuery
    CachedUpdates = True
    OnCalcFields = qry_cliente_ag_dem_CalcFields
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT * FROM '
      'TCLIENTE_AGENTE_DEMURRAGE'
      'WHERE CD_CLIENTE = :CD_CLIENTE AND'
      'CD_UNID_NEG = :CD_UNID_NEG AND'
      'CD_PRODUTO = :CD_PRODUTO AND'
      'CD_AGENTE = :CD_AGENTE AND'
      'CD_TRANSPORTADOR =:CD_TRANSPORTADOR')
    Params.Data = {
      010005000A43445F434C49454E544500010200300000000B43445F554E49445F
      4E454700010200300000000A43445F50524F4455544F00010200300000000943
      445F4147454E544500010200300000001043445F5452414E53504F525441444F
      520001020030000000}
    UpdateObject = us_cliente_ag_dem_
    Left = 168
    Top = 67
    object qry_cliente_ag_dem_CD_UNID_NEG: TStringField
      FieldName = 'CD_UNID_NEG'
      Origin = 'TCLIENTE_AGENTE_DEMURRAGE.CD_UNID_NEG'
      Size = 2
    end
    object qry_cliente_ag_dem_CD_PRODUTO: TStringField
      FieldName = 'CD_PRODUTO'
      Origin = 'TCLIENTE_AGENTE_DEMURRAGE.CD_PRODUTO'
      Size = 2
    end
    object qry_cliente_ag_dem_CD_CLIENTE: TStringField
      FieldName = 'CD_CLIENTE'
      Origin = 'TCLIENTE_AGENTE_DEMURRAGE.CD_CLIENTE'
      Size = 5
    end
    object qry_cliente_ag_dem_CD_AGENTE: TStringField
      FieldName = 'CD_AGENTE'
      Origin = 'TCLIENTE_AGENTE_DEMURRAGE.CD_AGENTE'
      Size = 4
    end
    object qry_cliente_ag_dem_NR_PERIODO: TStringField
      DisplayLabel = 'Período'
      FieldName = 'NR_PERIODO'
      Origin = 'TCLIENTE_AGENTE_DEMURRAGE.CD_UNID_NEG'
      Size = 3
    end
    object qry_cliente_ag_dem_NR_DIAS_PERIODO: TIntegerField
      DisplayLabel = 'Nº Dias'
      FieldName = 'NR_DIAS_PERIODO'
      Origin = 'TCLIENTE_AGENTE_DEMURRAGE.NR_DIAS_PERIODO'
    end
    object qry_cliente_ag_dem_VL_DIARIA: TFloatField
      DisplayLabel = 'Valor Diária'
      FieldName = 'VL_DIARIA'
      Origin = 'TCLIENTE_AGENTE_DEMURRAGE.VL_DIARIA'
      DisplayFormat = '#0,.00'
      EditFormat = '#0.00'
    end
    object qry_cliente_ag_dem_CD_MOEDA: TStringField
      FieldName = 'CD_MOEDA'
      Origin = 'TCLIENTE_AGENTE_DEMURRAGE.CD_MOEDA'
      Size = 3
    end
    object qry_cliente_ag_dem_TP_CNTR: TStringField
      FieldName = 'TP_CNTR'
      Origin = 'TCLIENTE_AGENTE_DEMURRAGE.TP_CNTR'
      Size = 2
    end
    object qry_cliente_ag_dem_IN_ISENTO: TStringField
      FieldName = 'IN_ISENTO'
      Origin = 'TCLIENTE_AGENTE_DEMURRAGE.CD_UNID_NEG'
      Size = 1
    end
    object qry_cliente_ag_dem_LookCliente: TStringField
      FieldName = 'LookCliente'
      Size = 50
      Calculated = True
    end
    object qry_cliente_ag_dem_LookUnidNeg: TStringField
      FieldName = 'LookUnidNeg'
      Size = 50
      Calculated = True
    end
    object qry_cliente_ag_dem_LookProduto: TStringField
      FieldName = 'LookProduto'
      Size = 40
      Calculated = True
    end
    object qry_cliente_ag_dem_LookAgente: TStringField
      FieldName = 'LookAgente'
      Size = 60
      Calculated = True
    end
    object qry_cliente_ag_dem_LookTpCntr: TStringField
      DisplayLabel = 'Tipo Cntr'
      FieldName = 'LookTpCntr'
      LookupDataSet = qry_tp_cntr_
      LookupKeyFields = 'TP_CNTR'
      LookupResultField = 'NM_TP_CNTR'
      KeyFields = 'TP_CNTR'
      Lookup = True
    end
    object qry_cliente_ag_dem_LookMoeda: TStringField
      FieldName = 'LookMoeda'
      Size = 30
      Calculated = True
    end
    object qry_cliente_ag_dem_LookIsento: TStringField
      DisplayLabel = 'Isento'
      FieldName = 'LookIsento'
      LookupDataSet = qry_yes_no_
      LookupKeyFields = 'CD_YESNO'
      LookupResultField = 'TX_YESNO'
      KeyFields = 'IN_ISENTO'
      Size = 3
      Lookup = True
    end
    object qry_cliente_ag_dem_DT_INI_VIG: TDateTimeField
      FieldName = 'DT_INI_VIG'
      Origin = 'TCLIENTE_AGENTE_DEMURRAGE.CD_UNID_NEG'
    end
    object qry_cliente_ag_dem_DT_FIM_VIG: TDateTimeField
      FieldName = 'DT_FIM_VIG'
      Origin = 'TCLIENTE_AGENTE_DEMURRAGE.CD_PRODUTO'
    end
    object qry_cliente_ag_dem_CD_TRANSPORTADOR: TStringField
      FieldName = 'CD_TRANSPORTADOR'
      Origin = 'TCLIENTE_AGENTE_DEMURRAGE.CD_UNID_NEG'
      Size = 4
    end
    object qry_cliente_ag_dem_LookTransp: TStringField
      FieldName = 'LookTransp'
      Calculated = True
    end
  end
  object qry_yes_no_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT CD_YESNO, TX_YESNO'
      'FROM   TYES_NO')
    Left = 170
    Top = 265
    object qry_yes_no_CD_YESNO: TStringField
      FieldName = 'CD_YESNO'
      Origin = 'TYES_NO.CD_YESNO'
      Size = 1
    end
    object qry_yes_no_TX_YESNO: TStringField
      FieldName = 'TX_YESNO'
      Origin = 'TYES_NO.TX_YESNO'
      Size = 3
    end
  end
  object ds_tp_cntr: TDataSource
    DataSet = qry_tp_cntr_
    Left = 51
    Top = 362
  end
  object qry_tp_cntr_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT TP_CNTR, NM_TP_CNTR'
      'FROM   TTP_CNTR')
    Left = 170
    Top = 362
  end
  object ds_moeda: TDataSource
    DataSet = qry_moeda_
    Left = 51
    Top = 410
  end
  object qry_moeda_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT CD_MOEDA, NM_MOEDA'
      'FROM   TMOEDA_BROKER'
      'WHERE  CD_MOEDA = :CD_MOEDA')
    Params.Data = {010001000843445F4D4F4544410001020030000000}
    Left = 170
    Top = 410
    object qry_moeda_CD_MOEDA: TStringField
      FieldName = 'CD_MOEDA'
      Origin = 'TMOEDA_BROKER.CD_MOEDA'
      Size = 3
    end
    object qry_moeda_NM_MOEDA: TStringField
      FieldName = 'NM_MOEDA'
      Origin = 'TMOEDA_BROKER.NM_MOEDA'
      Size = 30
    end
  end
  object us_cliente_ag: TUpdateSQL
    ModifySQL.Strings = (
      'update TCLIENTE_AGENTE'
      'set'
      '  CD_CLIENTE = :CD_CLIENTE,'
      '  CD_UNID_NEG = :CD_UNID_NEG,'
      '  CD_PRODUTO = :CD_PRODUTO,'
      '  CD_AGENTE = :CD_AGENTE,'
      '  NR_DIAS_FREE_TIME = :NR_DIAS_FREE_TIME,'
      '  IN_ATIVO = :IN_ATIVO,'
      '  CD_TRANSPORTADOR = :CD_TRANSPORTADOR'
      'where'
      '  CD_CLIENTE = :OLD_CD_CLIENTE and'
      '  CD_UNID_NEG = :OLD_CD_UNID_NEG and'
      '  CD_PRODUTO = :OLD_CD_PRODUTO and'
      '  CD_AGENTE = :OLD_CD_AGENTE and'
      '  CD_TRANSPORTADOR = :OLD_CD_TRANSPORTADOR')
    InsertSQL.Strings = (
      'insert into TCLIENTE_AGENTE'
      
        '  (CD_CLIENTE, CD_UNID_NEG, CD_PRODUTO, CD_AGENTE, NR_DIAS_FREE_' +
        'TIME, IN_ATIVO, '
      '   CD_TRANSPORTADOR)'
      'values'
      
        '  (:CD_CLIENTE, :CD_UNID_NEG, :CD_PRODUTO, :CD_AGENTE, :NR_DIAS_' +
        'FREE_TIME, '
      '   :IN_ATIVO, :CD_TRANSPORTADOR)')
    DeleteSQL.Strings = (
      'delete from TCLIENTE_AGENTE'
      'where'
      '  CD_CLIENTE = :OLD_CD_CLIENTE and'
      '  CD_UNID_NEG = :OLD_CD_UNID_NEG and'
      '  CD_PRODUTO = :OLD_CD_PRODUTO and'
      '  CD_AGENTE = :OLD_CD_AGENTE and'
      '  CD_TRANSPORTADOR = :OLD_CD_TRANSPORTADOR')
    Left = 282
    Top = 12
  end
  object us_cliente_ag_dem_: TUpdateSQL
    ModifySQL.Strings = (
      'update TCLIENTE_AGENTE_DEMURRAGE'
      'set'
      '  CD_UNID_NEG = :CD_UNID_NEG,'
      '  CD_PRODUTO = :CD_PRODUTO,'
      '  CD_CLIENTE = :CD_CLIENTE,'
      '  CD_AGENTE = :CD_AGENTE,'
      '  NR_PERIODO = :NR_PERIODO,'
      '  NR_DIAS_PERIODO = :NR_DIAS_PERIODO,'
      '  VL_DIARIA = :VL_DIARIA,'
      '  CD_MOEDA = :CD_MOEDA,'
      '  TP_CNTR = :TP_CNTR,'
      '  IN_ISENTO = :IN_ISENTO,'
      '  DT_INI_VIG = :DT_INI_VIG,'
      '  DT_FIM_VIG = :DT_FIM_VIG,'
      '  CD_TRANSPORTADOR = :CD_TRANSPORTADOR'
      'where'
      '  CD_UNID_NEG = :OLD_CD_UNID_NEG and'
      '  CD_PRODUTO = :OLD_CD_PRODUTO and'
      '  CD_CLIENTE = :OLD_CD_CLIENTE and'
      '  CD_AGENTE = :OLD_CD_AGENTE and'
      '  NR_PERIODO = :OLD_NR_PERIODO and'
      '  TP_CNTR = :OLD_TP_CNTR and'
      '  CD_TRANSPORTADOR = :OLD_CD_TRANSPORTADOR')
    InsertSQL.Strings = (
      'insert into TCLIENTE_AGENTE_DEMURRAGE'
      
        '  (CD_UNID_NEG, CD_PRODUTO, CD_CLIENTE, CD_AGENTE, NR_PERIODO, N' +
        'R_DIAS_PERIODO, '
      
        '   VL_DIARIA, CD_MOEDA, TP_CNTR, IN_ISENTO, DT_INI_VIG, DT_FIM_V' +
        'IG, CD_TRANSPORTADOR)'
      'values'
      
        '  (:CD_UNID_NEG, :CD_PRODUTO, :CD_CLIENTE, :CD_AGENTE, :NR_PERIO' +
        'DO, :NR_DIAS_PERIODO, '
      
        '   :VL_DIARIA, :CD_MOEDA, :TP_CNTR, :IN_ISENTO, :DT_INI_VIG, :DT' +
        '_FIM_VIG, '
      '   :CD_TRANSPORTADOR)')
    DeleteSQL.Strings = (
      'delete from TCLIENTE_AGENTE_DEMURRAGE'
      'where'
      '  CD_UNID_NEG = :OLD_CD_UNID_NEG and'
      '  CD_PRODUTO = :OLD_CD_PRODUTO and'
      '  CD_CLIENTE = :OLD_CD_CLIENTE and'
      '  CD_AGENTE = :OLD_CD_AGENTE and'
      '  NR_PERIODO = :OLD_NR_PERIODO and'
      '  TP_CNTR = :OLD_TP_CNTR and'
      '  CD_TRANSPORTADOR = :OLD_CD_TRANSPORTADOR')
    Left = 282
    Top = 68
  end
  object qry_transp_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      ''
      'SELECT CODIGO AS CD_TRANSP_ITL, DESCRICAO AS NM_TRANSP_ITL'
      'FROM   TTRANSPORTADOR_ITL'
      'WHERE  CODIGO = :CD_TRANSP_ITL')
    Params.Data = {010001000D43445F5452414E53505F49544C0001020030000000}
    Left = 280
    Top = 184
    object qry_transp_CD_TRANSP_ITL: TStringField
      FieldName = 'CD_TRANSP_ITL'
      Origin = 'TTRANSPORTADOR_ITL.CODIGO'
      Size = 4
    end
    object qry_transp_NM_TRANSP_ITL: TStringField
      FieldName = 'NM_TRANSP_ITL'
      Origin = 'TTRANSPORTADOR_ITL.DESCRICAO'
      Size = 60
    end
  end
  object ds_transp_: TDataSource
    DataSet = qry_transp_
    Left = 280
    Top = 128
  end
end
