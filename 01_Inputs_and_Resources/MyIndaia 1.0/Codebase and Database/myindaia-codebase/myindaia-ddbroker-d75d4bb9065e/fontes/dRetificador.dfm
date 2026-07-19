object datm_retifica: Tdatm_retifica
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Left = 280
  Top = 161
  Height = 624
  Width = 382
  object qry_pesquisa_: TQuery
    DatabaseName = 'DBBROKER'
    Left = 162
    Top = 18
  end
  object qry_traz_default_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      
        'SELECT UH.CD_USUARIO, TP.NM_PRODUTO, UH.CD_UNID_NEG, TUN.NM_UNID' +
        '_NEG, UH.CD_PRODUTO, UH.IN_ATIVO, UH.IN_DEFAULT,TU.NM_USUARIO  F' +
        'ROM TUSUARIO_HABILITACAO UH'
      'LEFT JOIN TUSUARIO TU ON(TU.CD_USUARIO = UH.CD_USUARIO)'
      'LEFT JOIN TPRODUTO TP ON(TP.CD_PRODUTO = UH.CD_PRODUTO)'
      
        'LEFT JOIN TUNID_NEG TUN ON (TUN.CD_UNID_NEG = UH.CD_UNID_NEG)WHE' +
        'RE UH.CD_USUARIO=:CD_USUARIO AND'
      'UH.IN_DEFAULT='#39'1'#39)
    Left = 162
    Top = 75
    ParamData = <
      item
        DataType = ftFixedChar
        Name = 'CD_USUARIO'
        ParamType = ptUnknown
      end>
    object qry_traz_default_CD_USUARIO: TStringField
      FieldName = 'CD_USUARIO'
      FixedChar = True
      Size = 4
    end
    object qry_traz_default_NM_PRODUTO: TStringField
      FieldName = 'NM_PRODUTO'
      FixedChar = True
      Size = 40
    end
    object qry_traz_default_CD_UNID_NEG: TStringField
      FieldName = 'CD_UNID_NEG'
      FixedChar = True
      Size = 2
    end
    object qry_traz_default_NM_UNID_NEG: TStringField
      FieldName = 'NM_UNID_NEG'
      FixedChar = True
      Size = 50
    end
    object qry_traz_default_CD_PRODUTO: TStringField
      FieldName = 'CD_PRODUTO'
      FixedChar = True
      Size = 2
    end
    object qry_traz_default_IN_ATIVO: TStringField
      FieldName = 'IN_ATIVO'
      FixedChar = True
      Size = 1
    end
    object qry_traz_default_IN_DEFAULT: TStringField
      FieldName = 'IN_DEFAULT'
      FixedChar = True
      Size = 1
    end
    object qry_traz_default_NM_USUARIO: TStringField
      FieldName = 'NM_USUARIO'
      FixedChar = True
      Size = 50
    end
  end
  object qry_processo_: TQuery
    CachedUpdates = True
    AfterOpen = qry_processo_AfterOpen
    AfterPost = qry_processo_AfterPost
    AfterCancel = qry_processo_AfterCancel
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      
        'SELECT TP.NR_PROCESSO, TP.CD_CLIENTE, TP.CD_SERVICO ,TS.NM_SERVI' +
        'CO, TP.CUBAGEM, TP.VL_TT_VENDA, TP.TP_ESTUFAGEM,'
      
        '  (SELECT TE.NM_EMPRESA FROM TEMPRESA_NAC TE WHERE TE.CD_EMPRESA' +
        ' = TP.CD_CLIENTE)NM_CLIENTE, TS.CD_VIA_TRANSPORTE,'
      
        '   TP.VL_PESO_BRUTO, TP.CHARGEABLE, TP.VL_TARIFA_FRETE, TP.VL_FR' +
        'ETE, TP.VL_OTHER_CHARGE, TP.VL_HOUSE, TP.QTD_VOLUME,'
      
        '   (SELECT TM.AP_MOEDA FROM TMOEDA_BROKER TM WHERE TM.CD_MOEDA =' +
        ' TP.CD_MOEDA_FRETE)AP_MOEDA, TS.TP_SERVICO,'
      
        '   TP.IN_PEDIDO, TP.CD_MOEDA_FRETE,  TP.TP_PROCESSO, P.TP_PRODUT' +
        'O, TP.CD_LOCAL_CONSOLIDACAO,'
      
        '   TP.CD_ORIGEM, (SELECT O.NM_PORTO FROM TPORTO O WHERE O.CD_POR' +
        'TO = TP.CD_ORIGEM) NM_ORIGEM,'
      
        '   TP.CD_DESTINO, (SELECT D.NM_PORTO FROM TPORTO D WHERE D.CD_PO' +
        'RTO = TP.CD_DESTINO) NM_DESTINO,'
      
        '   TP.CD_AGENTE, (SELECT A.NM_AGENTE FROM TAGENTE A WHERE A.CD_A' +
        'GENTE = TP.CD_AGENTE) NM_AGENTE,'
      
        '   TP.CD_CIA_TRANSP, (SELECT T.DESCRICAO FROM TTRANSPORTADOR_ITL' +
        ' T WHERE T.CODIGO = TP.CD_CIA_TRANSP) NM_CIA,'
      
        '   TP.CD_ARMADOR, (SELECT T.DESCRICAO FROM TTRANSPORTADOR_ITL T ' +
        'WHERE T.CODIGO = TP.CD_ARMADOR) NM_ARMADOR,'
      
        '   (SELECT D.NM_PORTO FROM TPORTO D WHERE D.CD_PORTO = TP.CD_LOC' +
        'AL_CONSOLIDACAO) NM_CONSOLIDACAO'
      '  FROM TPROCESSO TP, TSERVICO TS, TPRODUTO P'
      
        '   WHERE TP.NR_PROCESSO = :NR_PROCESSO AND TP.CD_UNID_NEG=:CD_UN' +
        'ID_NEG AND TP.IN_LIBERADO = '#39'1'#39
      
        '   AND TP.CD_PRODUTO=:CD_PRODUTO AND TS.CD_SERVICO = TP.CD_SERVI' +
        'CO AND TS.TP_SERVICO = '#39'1'#39
      '   AND TP.CD_PRODUTO = P.CD_PRODUTO'
      ''
      ''
      ''
      ''
      ''
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' ')
    UpdateObject = UpDAte_processo
    Left = 162
    Top = 133
    ParamData = <
      item
        DataType = ftFixedChar
        Name = 'NR_PROCESSO'
        ParamType = ptUnknown
      end
      item
        DataType = ftFixedChar
        Name = 'CD_UNID_NEG'
        ParamType = ptUnknown
      end
      item
        DataType = ftFixedChar
        Name = 'CD_PRODUTO'
        ParamType = ptUnknown
      end>
    object qry_processo_NR_PROCESSO: TStringField
      FieldName = 'NR_PROCESSO'
      FixedChar = True
      Size = 18
    end
    object qry_processo_CD_CLIENTE: TStringField
      FieldName = 'CD_CLIENTE'
      FixedChar = True
      Size = 5
    end
    object qry_processo_CD_SERVICO: TStringField
      FieldName = 'CD_SERVICO'
      FixedChar = True
      Size = 3
    end
    object qry_processo_NM_SERVICO: TStringField
      FieldName = 'NM_SERVICO'
      FixedChar = True
      Size = 50
    end
    object qry_processo_NM_CLIENTE: TStringField
      FieldName = 'NM_CLIENTE'
      FixedChar = True
      Size = 50
    end
    object qry_processo_VL_PESO_BRUTO: TFloatField
      FieldName = 'VL_PESO_BRUTO'
      DisplayFormat = '0.00'
    end
    object qry_processo_CHARGEABLE: TFloatField
      FieldName = 'CHARGEABLE'
      OnChange = qry_processo_CHARGEABLEChange
      DisplayFormat = '0.00'
    end
    object qry_processo_VL_TARIFA_FRETE: TFloatField
      FieldName = 'VL_TARIFA_FRETE'
      OnChange = qry_processo_CHARGEABLEChange
      DisplayFormat = '0.00'
    end
    object qry_processo_VL_FRETE: TFloatField
      FieldName = 'VL_FRETE'
      OnChange = qry_processo_VL_FRETEChange
      DisplayFormat = '0.00'
    end
    object qry_processo_VL_OTHER_CHARGE: TFloatField
      FieldName = 'VL_OTHER_CHARGE'
      OnChange = qry_processo_VL_FRETEChange
      DisplayFormat = '0.00'
    end
    object qry_processo_VL_HOUSE: TFloatField
      FieldName = 'VL_HOUSE'
      DisplayFormat = '0.00'
    end
    object qry_processo_CUBAGEM: TFloatField
      FieldName = 'CUBAGEM'
      DisplayFormat = '0.00'
    end
    object qry_processo_VL_TT_VENDA: TFloatField
      FieldName = 'VL_TT_VENDA'
    end
    object qry_processo_CD_VIA_TRANSPORTE: TStringField
      FieldName = 'CD_VIA_TRANSPORTE'
      FixedChar = True
      Size = 2
    end
    object qry_processo_TP_ESTUFAGEM: TStringField
      FieldName = 'TP_ESTUFAGEM'
      FixedChar = True
      Size = 1
    end
    object qry_processo_QTD_VOLUME: TFloatField
      FieldName = 'QTD_VOLUME'
    end
    object qry_processo_AP_MOEDA: TStringField
      FieldName = 'AP_MOEDA'
      FixedChar = True
      Size = 6
    end
    object qry_processo_TP_SERVICO: TStringField
      FieldName = 'TP_SERVICO'
      FixedChar = True
      Size = 1
    end
    object qry_processo_IN_PEDIDO: TStringField
      FieldName = 'IN_PEDIDO'
      FixedChar = True
      Size = 1
    end
    object qry_processo_CD_MOEDA_FRETE: TStringField
      FieldName = 'CD_MOEDA_FRETE'
      FixedChar = True
      Size = 3
    end
    object qry_processo_CD_ORIGEM: TStringField
      FieldName = 'CD_ORIGEM'
      FixedChar = True
      Size = 4
    end
    object qry_processo_NM_ORIGEM: TStringField
      FieldName = 'NM_ORIGEM'
      FixedChar = True
      Size = 50
    end
    object qry_processo_CD_DESTINO: TStringField
      FieldName = 'CD_DESTINO'
      FixedChar = True
      Size = 4
    end
    object qry_processo_NM_DESTINO: TStringField
      FieldName = 'NM_DESTINO'
      FixedChar = True
      Size = 50
    end
    object qry_processo_CD_AGENTE: TStringField
      FieldName = 'CD_AGENTE'
      FixedChar = True
      Size = 4
    end
    object qry_processo_NM_AGENTE: TStringField
      FieldName = 'NM_AGENTE'
      FixedChar = True
      Size = 60
    end
    object qry_processo_CD_CIA_TRANSP: TStringField
      FieldName = 'CD_CIA_TRANSP'
      OnChange = qry_processo_CD_CIA_TRANSPChange
      FixedChar = True
      Size = 4
    end
    object qry_processo_NM_CIA: TStringField
      FieldName = 'NM_CIA'
      FixedChar = True
      Size = 60
    end
    object qry_processo_CD_ARMADOR: TStringField
      FieldName = 'CD_ARMADOR'
      FixedChar = True
      Size = 4
    end
    object qry_processo_NM_ARMADOR: TStringField
      FieldName = 'NM_ARMADOR'
      FixedChar = True
      Size = 60
    end
    object qry_processo_TP_PROCESSO: TStringField
      FieldName = 'TP_PROCESSO'
      FixedChar = True
      Size = 1
    end
    object qry_processo_TP_PRODUTO: TStringField
      FieldName = 'TP_PRODUTO'
      FixedChar = True
      Size = 2
    end
    object qry_processo_CD_LOCAL_CONSOLIDACAO: TStringField
      FieldName = 'CD_LOCAL_CONSOLIDACAO'
      FixedChar = True
      Size = 4
    end
    object qry_processo_NM_CONSOLIDACAO: TStringField
      FieldName = 'NM_CONSOLIDACAO'
      FixedChar = True
      Size = 50
    end
  end
  object ds_processo: TDataSource
    DataSet = qry_processo_
    Left = 42
    Top = 133
  end
  object qry_vl_brasil_: TQuery
    CachedUpdates = True
    BeforePost = qry_vl_brasil_BeforePost
    AfterPost = qry_vl_brasil_AfterPost
    OnCalcFields = qry_vl_brasil_CalcFields
    OnNewRecord = qry_vl_brasil_NewRecord
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT TP.NR_PROCESSO, TP.CD_DESP, TP.CD_ITEM,'
      
        '  (SELECT TI.NM_ITEM FROM TITEM TI WHERE TI.CD_ITEM = TP.CD_ITEM' +
        ')NM_ITEM,'
      '    TP.TP_BASE_CALCULO, TP.IN_REPASSA,  TP.VL_COMPRA_AG,'
      '  TP.IN_PROFIT, TP.VL_VENDA, TP.VL_BASE_CLI,  TP.CD_MOEDA_VENDA,'
      
        '   TP.VL_CUSTO_EST, (SELECT TM.AP_MOEDA FROM TMOEDA_BROKER TM WH' +
        'ERE TM.CD_MOEDA =TP.CD_MOEDA_VENDA)AP_MOEDA,'
      '   (SELECT TC.NM_TP_BASE_CALC_FRETE FROM TTP_BASE_CALC_FRETE TC'
      
        '    WHERE TC.CD_TP_BASE_CALC_FRETE = TP.TP_BASE_CALCULO) NM_TP_C' +
        'ALC'
      '   FROM TPROCESSO_DESPESAS  TP'
      '   WHERE TP.NR_PROCESSO =:NR_PROCESSO AND  TP.IN_MENCIONADO='#39'0'#39
      ' AND ISNULL(NR_NOTIFICACAO,'#39'0'#39') = '#39'0'#39
      ' ')
    UpdateObject = Update_vl_brasil
    Left = 162
    Top = 420
    ParamData = <
      item
        DataType = ftFixedChar
        Name = 'NR_PROCESSO'
        ParamType = ptUnknown
      end>
    object qry_vl_brasil_NR_PROCESSO: TStringField
      FieldName = 'NR_PROCESSO'
      FixedChar = True
      Size = 18
    end
    object qry_vl_brasil_CD_DESP: TStringField
      FieldName = 'CD_DESP'
      FixedChar = True
      Size = 4
    end
    object qry_vl_brasil_CD_ITEM: TStringField
      FieldName = 'CD_ITEM'
      FixedChar = True
      Size = 3
    end
    object qry_vl_brasil_NM_ITEM: TStringField
      FieldName = 'NM_ITEM'
      FixedChar = True
      Size = 30
    end
    object qry_vl_brasil_TP_BASE_CALCULO: TStringField
      FieldName = 'TP_BASE_CALCULO'
      FixedChar = True
      Size = 2
    end
    object qry_vl_brasil_IN_REPASSA: TStringField
      FieldName = 'IN_REPASSA'
      FixedChar = True
      Size = 1
    end
    object qry_vl_brasil_VL_COMPRA_AG: TFloatField
      FieldName = 'VL_COMPRA_AG'
      DisplayFormat = '0.00'
    end
    object qry_vl_brasil_IN_PROFIT: TStringField
      FieldName = 'IN_PROFIT'
      FixedChar = True
      Size = 1
    end
    object qry_vl_brasil_VL_VENDA: TFloatField
      FieldName = 'VL_VENDA'
      DisplayFormat = '0.00'
    end
    object qry_vl_brasil_VL_BASE_CLI: TFloatField
      FieldName = 'VL_BASE_CLI'
      OnChange = qry_vl_brasil_VL_BASE_CLIChange
      DisplayFormat = '0.00'
    end
    object qry_vl_brasil_CD_MOEDA_VENDA: TStringField
      FieldName = 'CD_MOEDA_VENDA'
      FixedChar = True
      Size = 3
    end
    object qry_vl_brasil_VL_CUSTO_EST: TFloatField
      FieldName = 'VL_CUSTO_EST'
      DisplayFormat = '0.00'
    end
    object qry_vl_brasil_AP_MOEDA: TStringField
      FieldName = 'AP_MOEDA'
      FixedChar = True
      Size = 6
    end
    object qry_vl_brasil_NM_TP_CALC: TStringField
      FieldName = 'NM_TP_CALC'
      FixedChar = True
      Size = 100
    end
    object qry_vl_brasil_calc_profit: TStringField
      FieldKind = fkCalculated
      FieldName = 'calc_profit'
      Size = 3
      Calculated = True
    end
    object qry_vl_brasil_calc_repassa: TStringField
      FieldKind = fkCalculated
      FieldName = 'calc_repassa'
      Size = 10
      Calculated = True
    end
    object qry_vl_brasil_calcItem: TStringField
      FieldKind = fkCalculated
      FieldName = 'calcItem'
      Size = 100
      Calculated = True
    end
    object qry_vl_brasil_calcMoeda: TStringField
      FieldKind = fkCalculated
      FieldName = 'calcMoeda'
      Size = 100
      Calculated = True
    end
  end
  object qry_vl_other_: TQuery
    CachedUpdates = True
    BeforePost = qry_vl_other_BeforePost
    AfterPost = qry_vl_other_AfterPost
    OnCalcFields = qry_vl_other_CalcFields
    OnNewRecord = qry_vl_other_NewRecord
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      
        'SELECT TP.CD_ITEM,TP.TP_BASE_CALCULO, TP.VL_VENDA, TP.VL_BASE_CL' +
        'I, TP.NR_PROCESSO, TP.CD_DESP,'
      
        '(SELECT TI.NM_ITEM FROM TITEM TI WHERE TI.CD_ITEM = TP.CD_ITEM) ' +
        'NM_ITEM, ISNULL(NR_NOTIFICACAO,'#39'0'#39') AS NR_NOTICACAO,'
      '(SELECT TC.NM_TP_BASE_CALC_FRETE FROM TTP_BASE_CALC_FRETE TC'
      
        '    WHERE TC.CD_TP_BASE_CALC_FRETE = TP.TP_BASE_CALCULO) NM_TP_C' +
        'ALC'
      ''
      ' FROM TPROCESSO_DESPESAS TP WHERE TP.NR_PROCESSO=:NR_PROCESSO'
      
        '    AND TP.IN_MENCIONADO = '#39'1'#39' AND ISNULL(NR_NOTIFICACAO,'#39'0'#39') = ' +
        #39'0'#39
      ''
      ' '
      ' '
      ''
      ' '
      ' '
      ' ')
    UpdateObject = Update_other
    Left = 162
    Top = 363
    ParamData = <
      item
        DataType = ftFixedChar
        Name = 'NR_PROCESSO'
        ParamType = ptUnknown
      end>
    object qry_vl_other_CD_ITEM: TStringField
      FieldName = 'CD_ITEM'
      FixedChar = True
      Size = 3
    end
    object qry_vl_other_TP_BASE_CALCULO: TStringField
      FieldName = 'TP_BASE_CALCULO'
      FixedChar = True
      Size = 2
    end
    object qry_vl_other_VL_VENDA: TFloatField
      FieldName = 'VL_VENDA'
      DisplayFormat = '0.00'
    end
    object qry_vl_other_VL_BASE_CLI: TFloatField
      FieldName = 'VL_BASE_CLI'
      OnChange = qry_vl_other_VL_BASE_CLIChange
      DisplayFormat = '0.00'
    end
    object qry_vl_other_NM_ITEM: TStringField
      FieldName = 'NM_ITEM'
      FixedChar = True
      Size = 30
    end
    object qry_vl_other_NM_TP_CALC: TStringField
      FieldName = 'NM_TP_CALC'
      FixedChar = True
      Size = 100
    end
    object qry_vl_other_NR_PROCESSO: TStringField
      FieldName = 'NR_PROCESSO'
      FixedChar = True
      Size = 18
    end
    object qry_vl_other_CD_DESP: TStringField
      FieldName = 'CD_DESP'
      FixedChar = True
      Size = 4
    end
    object qry_vl_other_NR_NOTICACAO: TStringField
      FieldName = 'NR_NOTICACAO'
      FixedChar = True
      Size = 3
    end
    object qry_vl_other_calcItem: TStringField
      FieldKind = fkCalculated
      FieldName = 'calcItem'
      Size = 100
      Calculated = True
    end
  end
  object ds_vl_brasil: TDataSource
    DataSet = qry_vl_brasil_
    Left = 42
    Top = 420
  end
  object ds_vl_other: TDataSource
    DataSet = qry_vl_other_
    Left = 42
    Top = 363
  end
  object Update_other: TUpdateSQL
    ModifySQL.Strings = (
      'update TPROCESSO_DESPESAS'
      'set'
      '  NR_PROCESSO = :NR_PROCESSO,'
      '  CD_DESP = :CD_DESP,'
      '  CD_ITEM = :CD_ITEM,'
      '  TP_BASE_CALCULO = :TP_BASE_CALCULO,'
      '  VL_VENDA = :VL_VENDA,'
      '  VL_BASE_CLI = :VL_BASE_CLI'
      'where'
      '  NR_PROCESSO = :OLD_NR_PROCESSO and'
      '  CD_DESP = :OLD_CD_DESP')
    InsertSQL.Strings = (
      'insert into TPROCESSO_DESPESAS'
      
        '  (NR_PROCESSO, CD_DESP, CD_ITEM, TP_BASE_CALCULO, VL_VENDA, VL_' +
        'BASE_CLI)'
      'values'
      
        '  (:NR_PROCESSO, :CD_DESP, :CD_ITEM, :TP_BASE_CALCULO, :VL_VENDA' +
        ', :VL_BASE_CLI)')
    DeleteSQL.Strings = (
      'delete from TPROCESSO_DESPESAS'
      'where'
      '  NR_PROCESSO = :OLD_NR_PROCESSO and'
      '  CD_DESP = :OLD_CD_DESP')
    Left = 282
    Top = 362
  end
  object qry_despesa_house_: TQuery
    CachedUpdates = True
    BeforePost = qry_despesa_house_BeforePost
    AfterPost = qry_despesa_house_AfterPost
    OnCalcFields = qry_despesa_house_CalcFields
    OnNewRecord = qry_despesa_house_NewRecord
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      
        'SELECT TP.NR_PROCESSO, TP.CD_DESP, TP.CD_ITEM, TP.TP_BASE_CALCUL' +
        'O,TP.CD_MOEDA,'
      '   TP.VL_COMPRA_AG, TP.VL_BASE_AG,'
      '  (SELECT TC.NM_TP_BASE_CALC_FRETE FROM TTP_BASE_CALC_FRETE TC'
      
        '    WHERE TC.CD_TP_BASE_CALC_FRETE = TP.TP_BASE_CALCULO) NM_TP_C' +
        'ALC,'
      
        '     (SELECT TI.NM_ITEM FROM TITEM TI WHERE TI.CD_ITEM = TP.CD_I' +
        'TEM)NM_ITEM,'
      
        '     (SELECT TM.AP_MOEDA FROM TMOEDA_BROKER TM WHERE TM.CD_MOEDA' +
        ' = TP.CD_MOEDA)AP_MOEDA'
      '   FROM TPROCESSO_DESPESAS TP'
      ''
      
        '   WHERE TP.NR_PROCESSO =:NR_PROCESSO AND ISNULL(NR_NOTIFICACAO,' +
        #39'0'#39') = '#39'0'#39
      ' ')
    UpdateObject = UpDate_despesa_house
    Left = 162
    Top = 536
    ParamData = <
      item
        DataType = ftFixedChar
        Name = 'NR_PROCESSO'
        ParamType = ptUnknown
      end>
    object qry_despesa_house_NR_PROCESSO: TStringField
      FieldName = 'NR_PROCESSO'
      FixedChar = True
      Size = 18
    end
    object qry_despesa_house_CD_DESP: TStringField
      FieldName = 'CD_DESP'
      FixedChar = True
      Size = 4
    end
    object qry_despesa_house_CD_ITEM: TStringField
      FieldName = 'CD_ITEM'
      FixedChar = True
      Size = 3
    end
    object qry_despesa_house_TP_BASE_CALCULO: TStringField
      FieldName = 'TP_BASE_CALCULO'
      FixedChar = True
      Size = 2
    end
    object qry_despesa_house_CD_MOEDA: TStringField
      FieldName = 'CD_MOEDA'
      FixedChar = True
      Size = 3
    end
    object qry_despesa_house_VL_COMPRA_AG: TFloatField
      FieldName = 'VL_COMPRA_AG'
      DisplayFormat = '0.00'
    end
    object qry_despesa_house_VL_BASE_AG: TFloatField
      FieldName = 'VL_BASE_AG'
      OnChange = qry_despesa_house_VL_BASE_AGChange
      DisplayFormat = '0.00'
    end
    object qry_despesa_house_NM_TP_CALC: TStringField
      FieldName = 'NM_TP_CALC'
      FixedChar = True
      Size = 100
    end
    object qry_despesa_house_NM_ITEM: TStringField
      FieldName = 'NM_ITEM'
      FixedChar = True
      Size = 30
    end
    object qry_despesa_house_AP_MOEDA: TStringField
      FieldName = 'AP_MOEDA'
      FixedChar = True
      Size = 6
    end
    object qry_despesa_house_calcItem: TStringField
      FieldKind = fkCalculated
      FieldName = 'calcItem'
      Size = 100
      Calculated = True
    end
    object qry_despesa_house_calcMoeda: TStringField
      FieldKind = fkCalculated
      FieldName = 'calcMoeda'
      Size = 100
      Calculated = True
    end
  end
  object Update_vl_brasil: TUpdateSQL
    ModifySQL.Strings = (
      'update TPROCESSO_DESPESAS'
      'set'
      '  NR_PROCESSO = :NR_PROCESSO,'
      '  CD_DESP = :CD_DESP,'
      '  CD_ITEM = :CD_ITEM,'
      '  TP_BASE_CALCULO = :TP_BASE_CALCULO,'
      '  VL_COMPRA_AG = :VL_COMPRA_AG,'
      '  VL_VENDA = :VL_VENDA,'
      '  IN_REPASSA = :IN_REPASSA,'
      '  VL_BASE_CLI = :VL_BASE_CLI,'
      '  IN_PROFIT = :IN_PROFIT,'
      '  VL_CUSTO_EST = :VL_CUSTO_EST,'
      '  CD_MOEDA_VENDA = :CD_MOEDA_VENDA'
      'where'
      '  NR_PROCESSO = :OLD_NR_PROCESSO and'
      '  CD_DESP = :OLD_CD_DESP')
    InsertSQL.Strings = (
      'insert into TPROCESSO_DESPESAS'
      
        '  (NR_PROCESSO, CD_DESP, CD_ITEM, TP_BASE_CALCULO, VL_COMPRA_AG,' +
        ' VL_VENDA, '
      
        '   IN_REPASSA, VL_BASE_CLI, IN_PROFIT, VL_CUSTO_EST, CD_MOEDA_VE' +
        'NDA)'
      'values'
      
        '  (:NR_PROCESSO, :CD_DESP, :CD_ITEM, :TP_BASE_CALCULO, :VL_COMPR' +
        'A_AG, :VL_VENDA, '
      
        '   :IN_REPASSA, :VL_BASE_CLI, :IN_PROFIT, :VL_CUSTO_EST, :CD_MOE' +
        'DA_VENDA)')
    DeleteSQL.Strings = (
      'delete from TPROCESSO_DESPESAS'
      'where'
      '  NR_PROCESSO = :OLD_NR_PROCESSO and'
      '  CD_DESP = :OLD_CD_DESP')
    Left = 282
    Top = 420
  end
  object ds_despesa_house: TDataSource
    DataSet = qry_despesa_house_
    Left = 42
    Top = 536
  end
  object UpDate_despesa_house: TUpdateSQL
    ModifySQL.Strings = (
      'update TPROCESSO_DESPESAS'
      'set'
      '  NR_PROCESSO = :NR_PROCESSO,'
      '  CD_DESP = :CD_DESP,'
      '  CD_ITEM = :CD_ITEM,'
      '  TP_BASE_CALCULO = :TP_BASE_CALCULO,'
      '  CD_MOEDA = :CD_MOEDA,'
      '  VL_COMPRA_AG = :VL_COMPRA_AG,'
      '  VL_BASE_AG = :VL_BASE_AG'
      'where'
      '  NR_PROCESSO = :OLD_NR_PROCESSO and'
      '  CD_DESP = :OLD_CD_DESP')
    InsertSQL.Strings = (
      'insert into TPROCESSO_DESPESAS'
      
        '  (NR_PROCESSO, CD_DESP, CD_ITEM, TP_BASE_CALCULO, CD_MOEDA, VL_' +
        'COMPRA_AG, '
      '   VL_BASE_AG)'
      'values'
      
        '  (:NR_PROCESSO, :CD_DESP, :CD_ITEM, :TP_BASE_CALCULO, :CD_MOEDA' +
        ', :VL_COMPRA_AG, '
      '   :VL_BASE_AG)')
    DeleteSQL.Strings = (
      'delete from TPROCESSO_DESPESAS'
      'where'
      '  NR_PROCESSO = :OLD_NR_PROCESSO and'
      '  CD_DESP = :OLD_CD_DESP')
    Left = 282
    Top = 536
  end
  object UpDAte_processo: TUpdateSQL
    ModifySQL.Strings = (
      'update TPROCESSO'
      'set'
      '  NR_PROCESSO = :NR_PROCESSO,'
      '  CD_CLIENTE = :CD_CLIENTE,'
      '  CD_SERVICO = :CD_SERVICO,'
      '  CD_MOEDA_FRETE = :CD_MOEDA_FRETE,'
      '  CD_AGENTE = :CD_AGENTE,'
      '  VL_PESO_BRUTO = :VL_PESO_BRUTO,'
      '  TP_PROCESSO = :TP_PROCESSO,'
      '  CD_ORIGEM = :CD_ORIGEM,'
      '  CD_DESTINO = :CD_DESTINO,'
      '  CD_CIA_TRANSP = :CD_CIA_TRANSP,'
      '  CD_ARMADOR = :CD_ARMADOR,'
      '  QTD_VOLUME = :QTD_VOLUME,'
      '  CUBAGEM = :CUBAGEM,'
      '  CHARGEABLE = :CHARGEABLE,'
      '  VL_TARIFA_FRETE = :VL_TARIFA_FRETE,'
      '  VL_OTHER_CHARGE = :VL_OTHER_CHARGE,'
      '  VL_FRETE = :VL_FRETE,'
      '  VL_HOUSE = :VL_HOUSE,'
      '  VL_TT_VENDA = :VL_TT_VENDA,'
      '  TP_ESTUFAGEM = :TP_ESTUFAGEM,'
      '  IN_PEDIDO = :IN_PEDIDO,'
      '  CD_LOCAL_CONSOLIDACAO = :CD_LOCAL_CONSOLIDACAO'
      'where'
      '  NR_PROCESSO = :OLD_NR_PROCESSO')
    InsertSQL.Strings = (
      'insert into TPROCESSO'
      
        '  (NR_PROCESSO, CD_CLIENTE, CD_SERVICO, CD_MOEDA_FRETE, CD_AGENT' +
        'E, VL_PESO_BRUTO, '
      
        '   TP_PROCESSO, CD_ORIGEM, CD_DESTINO, CD_CIA_TRANSP, CD_ARMADOR' +
        ', QTD_VOLUME, '
      
        '   CUBAGEM, CHARGEABLE, VL_TARIFA_FRETE, VL_OTHER_CHARGE, VL_FRE' +
        'TE, VL_HOUSE, '
      '   VL_TT_VENDA, TP_ESTUFAGEM, IN_PEDIDO, CD_LOCAL_CONSOLIDACAO)'
      'values'
      
        '  (:NR_PROCESSO, :CD_CLIENTE, :CD_SERVICO, :CD_MOEDA_FRETE, :CD_' +
        'AGENTE, '
      
        '   :VL_PESO_BRUTO, :TP_PROCESSO, :CD_ORIGEM, :CD_DESTINO, :CD_CI' +
        'A_TRANSP, '
      
        '   :CD_ARMADOR, :QTD_VOLUME, :CUBAGEM, :CHARGEABLE, :VL_TARIFA_F' +
        'RETE, :VL_OTHER_CHARGE, '
      
        '   :VL_FRETE, :VL_HOUSE, :VL_TT_VENDA, :TP_ESTUFAGEM, :IN_PEDIDO' +
        ', :CD_LOCAL_CONSOLIDACAO)')
    DeleteSQL.Strings = (
      'delete from TPROCESSO'
      'where'
      '  NR_PROCESSO = :OLD_NR_PROCESSO')
    Left = 282
    Top = 133
  end
  object qry_processo_carga_: TQuery
    CachedUpdates = True
    BeforePost = qry_processo_carga_BeforePost
    AfterPost = qry_processo_carga_AfterPost
    OnCalcFields = qry_processo_carga_CalcFields
    OnNewRecord = qry_processo_carga_NewRecord
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      
        'SELECT TI.NR_PROCESSO, TI.CD_CARGA, TI.QTDE, TI.VL_COMPR, TI.VL_' +
        'LARG, TI.CD_VIA_TRANSP, TI.TP_ESTUFAGEM,'
      
        '    TI.VL_ALT, TI.PESO_TON, TI.CUBAGEM_VENDA, TI.PESO_VOLUMETRIC' +
        'O,'
      
        '    TI.TP_EMBALAGEM, (SELECT TE.NM_EMBALAGEM_S FROM TEMBALAGEM T' +
        'E WHERE TE.CD_EMBALAGEM = TI.TP_EMBALAGEM)NM_EMBALAGEM'
      '     FROM TINSTRUCAO_CARGA TI'
      '       WHERE TI.NR_PROCESSO=:NR_PROCESSO'
      '        AND TI.CD_VIA_TRANSP='#39'01'#39' AND TI.TP_ESTUFAGEM ='#39'0'#39)
    UpdateObject = Update_proc_carga
    Left = 162
    Top = 305
    ParamData = <
      item
        DataType = ftFixedChar
        Name = 'NR_PROCESSO'
        ParamType = ptUnknown
      end>
    object qry_processo_carga_NR_PROCESSO: TStringField
      FieldName = 'NR_PROCESSO'
      FixedChar = True
    end
    object qry_processo_carga_CD_CARGA: TStringField
      FieldName = 'CD_CARGA'
      FixedChar = True
      Size = 3
    end
    object qry_processo_carga_QTDE: TFloatField
      FieldName = 'QTDE'
      DisplayFormat = '00'
    end
    object qry_processo_carga_VL_COMPR: TFloatField
      FieldName = 'VL_COMPR'
    end
    object qry_processo_carga_VL_LARG: TFloatField
      FieldName = 'VL_LARG'
    end
    object qry_processo_carga_CD_VIA_TRANSP: TStringField
      FieldName = 'CD_VIA_TRANSP'
      FixedChar = True
      Size = 2
    end
    object qry_processo_carga_TP_ESTUFAGEM: TStringField
      FieldName = 'TP_ESTUFAGEM'
      FixedChar = True
      Size = 1
    end
    object qry_processo_carga_VL_ALT: TFloatField
      FieldName = 'VL_ALT'
    end
    object qry_processo_carga_PESO_TON: TFloatField
      FieldName = 'PESO_TON'
      DisplayFormat = '0.000'
    end
    object qry_processo_carga_CUBAGEM_VENDA: TFloatField
      FieldName = 'CUBAGEM_VENDA'
    end
    object qry_processo_carga_PESO_VOLUMETRICO: TFloatField
      FieldName = 'PESO_VOLUMETRICO'
      DisplayFormat = '0.00'
    end
    object qry_processo_carga_TP_EMBALAGEM: TStringField
      FieldName = 'TP_EMBALAGEM'
      FixedChar = True
      Size = 4
    end
    object qry_processo_carga_NM_EMBALAGEM: TStringField
      FieldName = 'NM_EMBALAGEM'
      FixedChar = True
      Size = 50
    end
    object qry_processo_carga_calcEMBALAGEM: TStringField
      FieldKind = fkCalculated
      FieldName = 'calcEMBALAGEM'
      Size = 100
      Calculated = True
    end
  end
  object ds_processo_carga: TDataSource
    DataSet = qry_processo_carga_
    Left = 42
    Top = 305
  end
  object qry_processo_cntr_: TQuery
    CachedUpdates = True
    AfterPost = qry_processo_cntr_AfterPost
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      
        'SELECT TP.NR_PROCESSO, TP.NR_CNTR, CODIGO,  TP.TP_CNTR, TP.NR_LA' +
        'CRE, TP.VL_VENDA,'
      '   TP.VL_PESO_TON,  TP.TP_FRETE,   TP.VL_CUBAGEM,'
      
        '   (SELECT TC.NM_TP_CNTR FROM TTP_CNTR TC WHERE TC.TP_CNTR = TP.' +
        'TP_CNTR) NM_CNTR'
      '   FROM TPROCESSO_CNTR TP'
      '   WHERE TP.NR_PROCESSO = :NR_PROCESSO'
      ' '
      ' '
      ' ')
    UpdateObject = UpDAte_proc_cntr
    Left = 162
    Top = 478
    ParamData = <
      item
        DataType = ftFixedChar
        Name = 'NR_PROCESSO'
        ParamType = ptUnknown
      end>
    object qry_processo_cntr_NR_PROCESSO: TStringField
      FieldName = 'NR_PROCESSO'
      Origin = 'DBBROKER.TPROCESSO_CNTR.NR_PROCESSO'
      FixedChar = True
      Size = 18
    end
    object qry_processo_cntr_NR_CNTR: TStringField
      FieldName = 'NR_CNTR'
      Origin = 'DBBROKER.TPROCESSO_CNTR.NR_CNTR'
      FixedChar = True
    end
    object qry_processo_cntr_CODIGO: TStringField
      FieldName = 'CODIGO'
      Origin = 'DBBROKER.TPROCESSO_CNTR.CODIGO'
      FixedChar = True
      Size = 3
    end
    object qry_processo_cntr_TP_CNTR: TStringField
      FieldName = 'TP_CNTR'
      Origin = 'DBBROKER.TPROCESSO_CNTR.TP_CNTR'
      FixedChar = True
      Size = 2
    end
    object qry_processo_cntr_NR_LACRE: TStringField
      FieldName = 'NR_LACRE'
      Origin = 'DBBROKER.TPROCESSO_CNTR.NR_LACRE'
      FixedChar = True
    end
    object qry_processo_cntr_VL_VENDA: TFloatField
      FieldName = 'VL_VENDA'
      Origin = 'DBBROKER.TPROCESSO_CNTR.VL_VENDA'
      DisplayFormat = '0.00'
    end
    object qry_processo_cntr_VL_PESO_TON: TFloatField
      FieldName = 'VL_PESO_TON'
      Origin = 'DBBROKER.TPROCESSO_CNTR.VL_PESO_TON'
      DisplayFormat = '0.000'
    end
    object qry_processo_cntr_TP_FRETE: TStringField
      FieldName = 'TP_FRETE'
      Origin = 'DBBROKER.TPROCESSO_CNTR.TP_FRETE'
      FixedChar = True
      Size = 1
    end
    object qry_processo_cntr_NM_CNTR: TStringField
      FieldName = 'NM_CNTR'
      FixedChar = True
    end
    object qry_processo_cntr_VL_CUBAGEM: TFloatField
      FieldName = 'VL_CUBAGEM'
      DisplayFormat = '0.00'
    end
  end
  object ds_proc_cntr: TDataSource
    DataSet = qry_processo_cntr_
    Left = 42
    Top = 478
  end
  object UpDAte_proc_cntr: TUpdateSQL
    ModifySQL.Strings = (
      'update TPROCESSO_CNTR'
      'set'
      '  NR_PROCESSO = :NR_PROCESSO,'
      '  NR_CNTR = :NR_CNTR,'
      '  CODIGO = :CODIGO,'
      '  TP_CNTR = :TP_CNTR,'
      '  NR_LACRE = :NR_LACRE,'
      '  VL_VENDA = :VL_VENDA,'
      '  VL_PESO_TON = :VL_PESO_TON,'
      '  TP_FRETE = :TP_FRETE'
      'where'
      '  NR_PROCESSO = :OLD_NR_PROCESSO and'
      '  CODIGO = :OLD_CODIGO')
    InsertSQL.Strings = (
      'insert into TPROCESSO_CNTR'
      
        '  (NR_PROCESSO, NR_CNTR, CODIGO, TP_CNTR, NR_LACRE, VL_VENDA, VL' +
        '_PESO_TON, '
      '   TP_FRETE)'
      'values'
      
        '  (:NR_PROCESSO, :NR_CNTR, :CODIGO, :TP_CNTR, :NR_LACRE, :VL_VEN' +
        'DA, :VL_PESO_TON, '
      '   :TP_FRETE)')
    DeleteSQL.Strings = (
      'delete from TPROCESSO_CNTR'
      'where'
      '  NR_PROCESSO = :OLD_NR_PROCESSO and'
      '  CODIGO = :OLD_CODIGO')
    Left = 282
    Top = 478
  end
  object Update_proc_carga: TUpdateSQL
    ModifySQL.Strings = (
      'update TINSTRUCAO_CARGA'
      'set'
      '  NR_PROCESSO = :NR_PROCESSO,'
      '  CD_CARGA = :CD_CARGA,'
      '  QTDE = :QTDE,'
      '  VL_COMPR = :VL_COMPR,'
      '  VL_LARG = :VL_LARG,'
      '  VL_ALT = :VL_ALT,'
      '  CUBAGEM_VENDA = :CUBAGEM_VENDA,'
      '  PESO_VOLUMETRICO = :PESO_VOLUMETRICO,'
      '  CD_VIA_TRANSP = :CD_VIA_TRANSP,'
      '  TP_ESTUFAGEM = :TP_ESTUFAGEM,'
      '  TP_EMBALAGEM = :TP_EMBALAGEM,'
      '  PESO_TON = :PESO_TON'
      'where'
      '  NR_PROCESSO = :OLD_NR_PROCESSO and'
      '  CD_CARGA = :OLD_CD_CARGA')
    InsertSQL.Strings = (
      'insert into TINSTRUCAO_CARGA'
      
        '  (NR_PROCESSO, CD_CARGA, QTDE, VL_COMPR, VL_LARG, VL_ALT, CUBAG' +
        'EM_VENDA, '
      
        '   PESO_VOLUMETRICO, CD_VIA_TRANSP, TP_ESTUFAGEM, TP_EMBALAGEM, ' +
        'PESO_TON)'
      'values'
      
        '  (:NR_PROCESSO, :CD_CARGA, :QTDE, :VL_COMPR, :VL_LARG, :VL_ALT,' +
        ' :CUBAGEM_VENDA, '
      
        '   :PESO_VOLUMETRICO, :CD_VIA_TRANSP, :TP_ESTUFAGEM, :TP_EMBALAG' +
        'EM, :PESO_TON)')
    DeleteSQL.Strings = (
      'delete from TINSTRUCAO_CARGA'
      'where'
      '  NR_PROCESSO = :OLD_NR_PROCESSO and'
      '  CD_CARGA = :OLD_CD_CARGA')
    Left = 282
    Top = 305
  end
  object qry_proc_relacionados_: TQuery
    OnCalcFields = qry_proc_relacionados_CalcFields
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      
        'SELECT H2.CD_MASTER, H2.NR_MASTER, H2.CD_HOUSE, H2.NR_HOUSE, H2.' +
        'NR_PROCESSO,'
      
        '  (SELECT E.NM_EMPRESA FROM TEMPRESA_NAC E WHERE E.CD_EMPRESA = ' +
        'P.CD_CLIENTE) NM_CLIENTE'
      ''
      '  FROM THOUSE H, THOUSE H2, TPROCESSO P'
      '   WHERE P.NR_PROCESSO =:NR_PROCESSO'
      '    AND P.NR_PROCESSO  = H.NR_PROCESSO'
      '    AND H.CD_MASTER    = H2.CD_MASTER')
    Left = 162
    Top = 190
    ParamData = <
      item
        DataType = ftString
        Name = 'NR_PROCESSO'
        ParamType = ptUnknown
      end>
    object qry_proc_relacionados_CD_MASTER: TStringField
      FieldName = 'CD_MASTER'
      FixedChar = True
      Size = 15
    end
    object qry_proc_relacionados_NR_MASTER: TStringField
      FieldName = 'NR_MASTER'
      FixedChar = True
      Size = 14
    end
    object qry_proc_relacionados_CD_HOUSE: TStringField
      FieldName = 'CD_HOUSE'
      FixedChar = True
    end
    object qry_proc_relacionados_NR_HOUSE: TStringField
      FieldName = 'NR_HOUSE'
      FixedChar = True
      Size = 15
    end
    object qry_proc_relacionados_NR_PROCESSO: TStringField
      FieldName = 'NR_PROCESSO'
      FixedChar = True
      Size = 14
    end
    object qry_proc_relacionados_NM_CLIENTE: TStringField
      FieldName = 'NM_CLIENTE'
      FixedChar = True
      Size = 50
    end
    object qry_proc_relacionados_calc_processo: TStringField
      FieldKind = fkCalculated
      FieldName = 'calc_processo'
      Size = 10
      Calculated = True
    end
  end
  object ds_proc_relacionados: TDataSource
    DataSet = qry_proc_relacionados_
    Left = 42
    Top = 190
  end
  object qry_house_: TQuery
    DatabaseName = 'DBBROKER'
    RequestLive = True
    SQL.Strings = (
      'SELECT CD_MASTER, NR_MASTER, CD_HOUSE, NR_HOUSE,'
      ' NR_PROCESSO'
      ' FROM THOUSE'
      ' WHERE NR_PROCESSO = :NR_PROCESSO '
      ' AND IN_ESTORNO = '#39'0'#39)
    Left = 162
    Top = 248
    ParamData = <
      item
        DataType = ftFixedChar
        Name = 'NR_PROCESSO'
        ParamType = ptUnknown
      end>
    object qry_house_CD_MASTER: TStringField
      FieldName = 'CD_MASTER'
      Origin = 'DBBROKER.THOUSE.CD_MASTER'
      FixedChar = True
      Size = 15
    end
    object qry_house_NR_MASTER: TStringField
      FieldName = 'NR_MASTER'
      Origin = 'DBBROKER.THOUSE.NR_MASTER'
      FixedChar = True
      Size = 14
    end
    object qry_house_CD_HOUSE: TStringField
      FieldName = 'CD_HOUSE'
      Origin = 'DBBROKER.THOUSE.CD_HOUSE'
      FixedChar = True
    end
    object qry_house_NR_HOUSE: TStringField
      FieldName = 'NR_HOUSE'
      Origin = 'DBBROKER.THOUSE.NR_HOUSE'
      FixedChar = True
      Size = 15
    end
    object qry_house_NR_PROCESSO: TStringField
      FieldName = 'NR_PROCESSO'
      Origin = 'DBBROKER.THOUSE.NR_PROCESSO'
      FixedChar = True
      Size = 14
    end
  end
  object ds_house: TDataSource
    DataSet = qry_house_
    Left = 42
    Top = 248
  end
end
