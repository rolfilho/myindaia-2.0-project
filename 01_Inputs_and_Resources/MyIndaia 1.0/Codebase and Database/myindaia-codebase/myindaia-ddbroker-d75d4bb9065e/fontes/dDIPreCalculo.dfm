object datm_DI_PreCalculo: Tdatm_DI_PreCalculo
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  OnDestroy = DataModuleDestroy
  Left = 525
  Top = 194
  Height = 281
  Width = 473
  object qryMoedas: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT CD_MOEDA, NM_MOEDA, AP_MOEDA'
      'FROM TMOEDA_BROKER'
      'WHERE IN_ATIVO = '#39'1'#39)
    Left = 328
    Top = 64
    object qryMoedasCD_MOEDA: TStringField
      FieldName = 'CD_MOEDA'
      Origin = 'DBBROKER.TMOEDA_BROKER.CD_MOEDA'
      FixedChar = True
      Size = 3
    end
    object qryMoedasNM_MOEDA: TStringField
      FieldName = 'NM_MOEDA'
      Origin = 'DBBROKER.TMOEDA_BROKER.NM_MOEDA'
      FixedChar = True
      Size = 30
    end
    object qryMoedasAP_MOEDA: TStringField
      FieldName = 'AP_MOEDA'
      Origin = 'DBBROKER.TMOEDA_BROKER.AP_MOEDA'
      FixedChar = True
      Size = 6
    end
  end
  object qryPreCalculoCapa: TQuery
    CachedUpdates = True
    AfterPost = qryPreCalculoCapaAfterPost
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      
        'SELECT *, RIGHT(RTRIM(NR_PROCESSO), LEN(RTRIM(NR_PROCESSO)) - 4)' +
        ' AS NR_PROCESSO_SIMPLES'
      'FROM TPRE_CALCULO_CAPA'
      'WHERE NR_PROCESSO = :NR_PROCESSO')
    UpdateObject = updPreCalculoCapa
    Left = 40
    Top = 64
    ParamData = <
      item
        DataType = ftString
        Name = 'NR_PROCESSO'
        ParamType = ptInput
        Value = '0101IM-0807-10'
      end>
    object qryPreCalculoCapaNR_PROCESSO: TStringField
      FieldName = 'NR_PROCESSO'
      Origin = 'DBBROKER.TPRE_CALCULO_CAPA.NR_PROCESSO'
      FixedChar = True
      Size = 18
    end
    object qryPreCalculoCapaCD_INCOTERM: TStringField
      FieldName = 'CD_INCOTERM'
      Origin = 'DBBROKER.TPRE_CALCULO_CAPA.CD_INCOTERM'
      FixedChar = True
      Size = 3
    end
    object qryPreCalculoCapaCD_MOEDA_FOB: TStringField
      FieldName = 'CD_MOEDA_FOB'
      Origin = 'DBBROKER.TPRE_CALCULO_CAPA.CD_MOEDA_FOB'
      OnChange = qryPreCalculoCapaCD_MOEDA_FOBChange
      FixedChar = True
      Size = 3
    end
    object qryPreCalculoCapaVL_FOB_MOEDA: TFloatField
      FieldName = 'VL_FOB_MOEDA'
      Origin = 'DBBROKER.TPRE_CALCULO_CAPA.VL_FOB_MOEDA'
      DisplayFormat = '#0,.00'
      EditFormat = '#0.00'
    end
    object qryPreCalculoCapaTX_FOB: TFloatField
      FieldName = 'TX_FOB'
      Origin = 'DBBROKER.TPRE_CALCULO_CAPA.TX_FOB'
      DisplayFormat = '#0.0000000'
      EditFormat = '#0.0000000'
    end
    object qryPreCalculoCapaCD_MOEDA_FRETE: TStringField
      FieldName = 'CD_MOEDA_FRETE'
      Origin = 'DBBROKER.TPRE_CALCULO_CAPA.CD_MOEDA_FRETE'
      OnChange = qryPreCalculoCapaCD_MOEDA_FRETEChange
      FixedChar = True
      Size = 3
    end
    object qryPreCalculoCapaVL_FRETE_MOEDA: TFloatField
      FieldName = 'VL_FRETE_MOEDA'
      Origin = 'DBBROKER.TPRE_CALCULO_CAPA.VL_FRETE_MOEDA'
      DisplayFormat = '#0,.00'
      EditFormat = '#0.00'
    end
    object qryPreCalculoCapaTX_FRETE: TFloatField
      FieldName = 'TX_FRETE'
      Origin = 'DBBROKER.TPRE_CALCULO_CAPA.TX_FRETE'
      DisplayFormat = '#0.0000000'
      EditFormat = '#0.0000000'
    end
    object qryPreCalculoCapaCD_MOEDA_SEGURO: TStringField
      FieldName = 'CD_MOEDA_SEGURO'
      Origin = 'DBBROKER.TPRE_CALCULO_CAPA.CD_MOEDA_SEGURO'
      OnChange = qryPreCalculoCapaCD_MOEDA_SEGUROChange
      FixedChar = True
      Size = 3
    end
    object qryPreCalculoCapaVL_SEGURO_MOEDA: TFloatField
      FieldName = 'VL_SEGURO_MOEDA'
      Origin = 'DBBROKER.TPRE_CALCULO_CAPA.VL_SEGURO_MOEDA'
      DisplayFormat = '#0,.00'
      EditFormat = '#0.00'
    end
    object qryPreCalculoCapaTX_SEGURO: TFloatField
      FieldName = 'TX_SEGURO'
      Origin = 'DBBROKER.TPRE_CALCULO_CAPA.TX_SEGURO'
      DisplayFormat = '#0.0000000'
      EditFormat = '#0.0000000'
    end
    object qryPreCalculoCapaVL_CIF_DOLAR: TFloatField
      FieldName = 'VL_CIF_DOLAR'
      Origin = 'DBBROKER.TPRE_CALCULO_CAPA.VL_CIF_DOLAR'
      DisplayFormat = '#0,.00'
      EditFormat = '#0.00'
    end
    object qryPreCalculoCapaTX_DOLAR: TFloatField
      FieldName = 'TX_DOLAR'
      Origin = 'DBBROKER.TPRE_CALCULO_CAPA.TX_DOLAR'
      DisplayFormat = '#0.0000000'
      EditFormat = '#0.0000000'
    end
    object qryPreCalculoCapaVL_ACRESCIMOS_REAIS: TFloatField
      FieldName = 'VL_ACRESCIMOS_REAIS'
      DisplayFormat = '#0,.00'
      EditFormat = '#0.00'
    end
    object qryPreCalculoCapaVL_DEDUCOES_REAIS: TFloatField
      FieldName = 'VL_DEDUCOES_REAIS'
      DisplayFormat = '#0,.00'
      EditFormat = '#0.00'
    end
    object qryPreCalculoCapaNR_PROCESSO_SIMPLES: TStringField
      FieldName = 'NR_PROCESSO_SIMPLES'
      FixedChar = True
      Size = 14
    end
    object qryPreCalculoCapaVL_MLE_MOEDA: TFloatField
      FieldName = 'VL_MLE_MOEDA'
    end
    object qryPreCalculoCapaCD_MOEDA_MLE: TStringField
      FieldName = 'CD_MOEDA_MLE'
      OnChange = qryPreCalculoCapaCD_MOEDA_MLEChange
      FixedChar = True
      Size = 3
    end
    object qryPreCalculoCapaTX_MLE: TFloatField
      FieldName = 'TX_MLE'
      DisplayFormat = '#0.0000000'
      EditFormat = '#0.0000000'
    end
  end
  object qryPreCalculoAdicao: TQuery
    CachedUpdates = True
    AfterOpen = qryPreCalculoAdicaoAfterOpen
    BeforePost = qryPreCalculoAdicaoBeforePost
    AfterPost = qryPreCalculoAdicaoAfterPost
    AfterDelete = qryPreCalculoAdicaoAfterPost
    AfterScroll = qryPreCalculoAdicaoAfterScroll
    DatabaseName = 'DBBROKER'
    DataSource = dsPreCalculoCapa
    SQL.Strings = (
      'SELECT *'
      'FROM TPRE_CALCULO_ADICAO'
      'WHERE NR_PROCESSO = :NR_PROCESSO')
    UpdateObject = updPreCalculoAdicao
    Left = 160
    Top = 64
    ParamData = <
      item
        DataType = ftFixedChar
        Name = 'NR_PROCESSO'
        ParamType = ptUnknown
        Size = 19
      end>
    object qryPreCalculoAdicaoNR_PROCESSO: TStringField
      FieldName = 'NR_PROCESSO'
      Origin = 'DBBROKER.TPRE_CALCULO_ADICAO.NR_PROCESSO'
      FixedChar = True
      Size = 18
    end
    object qryPreCalculoAdicaoNR_ADICAO: TIntegerField
      FieldName = 'NR_ADICAO'
      Origin = 'DBBROKER.TPRE_CALCULO_ADICAO.NR_ADICAO'
    end
    object qryPreCalculoAdicaoVL_CIF_REAIS: TFloatField
      FieldName = 'VL_CIF_REAIS'
      Origin = 'DBBROKER.TPRE_CALCULO_ADICAO.VL_CIF_REAIS'
      DisplayFormat = '#0,.00'
      EditFormat = '#0.00'
    end
    object qryPreCalculoAdicaoPC_ALIQUOTA_II: TFloatField
      FieldName = 'PC_ALIQUOTA_II'
      Origin = 'DBBROKER.TPRE_CALCULO_ADICAO.PC_ALIQUOTA_II'
      DisplayFormat = '#0.0000'
      EditFormat = '#0.0000'
    end
    object qryPreCalculoAdicaoVL_II_REAIS: TFloatField
      FieldName = 'VL_II_REAIS'
      Origin = 'DBBROKER.TPRE_CALCULO_ADICAO.VL_II_REAIS'
      DisplayFormat = '#0,.00'
      EditFormat = '#0.00'
    end
    object qryPreCalculoAdicaoPC_ALIQUOTA_IPI: TFloatField
      FieldName = 'PC_ALIQUOTA_IPI'
      Origin = 'DBBROKER.TPRE_CALCULO_ADICAO.PC_ALIQUOTA_IPI'
      DisplayFormat = '#0.0000'
      EditFormat = '#0.0000'
    end
    object qryPreCalculoAdicaoVL_IPI_REAIS: TFloatField
      FieldName = 'VL_IPI_REAIS'
      Origin = 'DBBROKER.TPRE_CALCULO_ADICAO.VL_IPI_REAIS'
      DisplayFormat = '#0,.00'
      EditFormat = '#0.00'
    end
    object qryPreCalculoAdicaoPC_ALIQUOTA_PIS: TFloatField
      FieldName = 'PC_ALIQUOTA_PIS'
      Origin = 'DBBROKER.TPRE_CALCULO_ADICAO.PC_ALIQUOTA_PIS'
      OnChange = qryPreCalculoAdicaoPC_ALIQUOTA_PISChange
      DisplayFormat = '#0.0000'
      EditFormat = '#0.0000'
    end
    object qryPreCalculoAdicaoVL_PIS_REAIS: TFloatField
      FieldName = 'VL_PIS_REAIS'
      Origin = 'DBBROKER.TPRE_CALCULO_ADICAO.VL_PIS_REAIS'
      DisplayFormat = '#0,.00'
      EditFormat = '#0.00'
    end
    object qryPreCalculoAdicaoPC_ALIQUOTA_COFINS: TFloatField
      FieldName = 'PC_ALIQUOTA_COFINS'
      Origin = 'DBBROKER.TPRE_CALCULO_ADICAO.PC_ALIQUOTA_COFINS'
      OnChange = qryPreCalculoAdicaoPC_ALIQUOTA_COFINSChange
      DisplayFormat = '#0.0000'
      EditFormat = '#0.0000'
    end
    object qryPreCalculoAdicaoVL_COFINS_REAIS: TFloatField
      FieldName = 'VL_COFINS_REAIS'
      Origin = 'DBBROKER.TPRE_CALCULO_ADICAO.VL_COFINS_REAIS'
      DisplayFormat = '#0,.00'
      EditFormat = '#0.00'
    end
    object qryPreCalculoAdicaoPC_ALIQUOTA_ICMS: TFloatField
      FieldName = 'PC_ALIQUOTA_ICMS'
      Origin = 'DBBROKER.TPRE_CALCULO_ADICAO.PC_ALIQUOTA_ICMS'
      DisplayFormat = '#0.0000'
      EditFormat = '#0.0000'
    end
    object qryPreCalculoAdicaoVL_ICMS_REAIS: TFloatField
      FieldName = 'VL_ICMS_REAIS'
      Origin = 'DBBROKER.TPRE_CALCULO_ADICAO.VL_ICMS_REAIS'
      DisplayFormat = '#0,.00'
      EditFormat = '#0.00'
    end
    object qryPreCalculoAdicaoVL_OUTRAS_DESP_REAIS: TFloatField
      FieldName = 'VL_OUTRAS_DESP_REAIS'
      Origin = 'DBBROKER.TPRE_CALCULO_ADICAO.VL_OUTRAS_DESP_REAIS'
      DisplayFormat = '#0,.00'
      EditFormat = '#0.00'
    end
    object qryPreCalculoAdicaoVL_DESP_ADUAN_REAIS: TFloatField
      FieldName = 'VL_DESP_ADUAN_REAIS'
      Origin = 'DBBROKER.TPRE_CALCULO_ADICAO.VL_DESP_ADUAN_REAIS'
      DisplayFormat = '#0,.00'
      EditFormat = '#0.00'
    end
    object qryPreCalculoAdicaoVL_BASE_PIS_COFINS: TFloatField
      FieldName = 'VL_BASE_PIS_COFINS'
      Origin = 'DBBROKER.TPRE_CALCULO_ADICAO.VL_BASE_PIS_COFINS'
      DisplayFormat = '#0,.00'
      EditFormat = '#0.00'
    end
    object qryPreCalculoAdicaoVL_BASE_ICMS: TFloatField
      FieldName = 'VL_BASE_ICMS'
      Origin = 'DBBROKER.TPRE_CALCULO_ADICAO.VL_BASE_ICMS'
      DisplayFormat = '#0,.00'
      EditFormat = '#0.00'
    end
    object qryPreCalculoAdicaoVL_ALIQUOTA_ESPECIFICA_PIS: TFloatField
      FieldName = 'VL_ALIQUOTA_ESPECIFICA_PIS'
      Origin = 'DBBROKER.TPRE_CALCULO_ADICAO.VL_ALIQUOTA_ESPECIFICA_PIS'
      OnChange = qryPreCalculoAdicaoVL_ALIQUOTA_ESPECIFICA_PISChange
    end
    object qryPreCalculoAdicaoVL_ALIQUOTA_ESPECIFICA_COFINS: TFloatField
      FieldName = 'VL_ALIQUOTA_ESPECIFICA_COFINS'
      Origin = 'DBBROKER.TPRE_CALCULO_ADICAO.VL_ALIQUOTA_ESPECIFICA_COFINS'
      OnChange = qryPreCalculoAdicaoVL_ALIQUOTA_ESPECIFICA_COFINSChange
    end
    object qryPreCalculoAdicaoQTD_UNID_ESPECIFICA_PIS: TFloatField
      FieldName = 'QTD_UNID_ESPECIFICA_PIS'
      Origin = 'DBBROKER.TPRE_CALCULO_ADICAO.QTD_UNID_ESPECIFICA_PIS'
      OnChange = qryPreCalculoAdicaoVL_ALIQUOTA_ESPECIFICA_PISChange
    end
    object qryPreCalculoAdicaoQTD_UNID_ESPECIFICA_COFINS: TFloatField
      FieldName = 'QTD_UNID_ESPECIFICA_COFINS'
      Origin = 'DBBROKER.TPRE_CALCULO_ADICAO.QTD_UNID_ESPECIFICA_COFINS'
      OnChange = qryPreCalculoAdicaoVL_ALIQUOTA_ESPECIFICA_COFINSChange
    end
  end
  object dsPreCalculoCapa: TDataSource
    DataSet = qryPreCalculoCapa
    OnStateChange = dsPreCalculoCapaStateChange
    Left = 40
    Top = 16
  end
  object dsPreCalculoAdicao: TDataSource
    DataSet = qryPreCalculoAdicao
    OnStateChange = dsPreCalculoCapaStateChange
    Left = 160
    Top = 16
  end
  object dsMoedas: TDataSource
    DataSet = qryMoedas
    Left = 328
    Top = 16
  end
  object updPreCalculoCapa: TUpdateSQL
    ModifySQL.Strings = (
      'update TPRE_CALCULO_CAPA'
      'set'
      '  NR_PROCESSO = :NR_PROCESSO,'
      '  CD_INCOTERM = :CD_INCOTERM,'
      '  CD_MOEDA_FOB = :CD_MOEDA_FOB,'
      '  VL_FOB_MOEDA = :VL_FOB_MOEDA,'
      '  TX_FOB = :TX_FOB,'
      '  CD_MOEDA_FRETE = :CD_MOEDA_FRETE,'
      '  VL_FRETE_MOEDA = :VL_FRETE_MOEDA,'
      '  TX_FRETE = :TX_FRETE,'
      '  CD_MOEDA_SEGURO = :CD_MOEDA_SEGURO,'
      '  VL_SEGURO_MOEDA = :VL_SEGURO_MOEDA,'
      '  TX_SEGURO = :TX_SEGURO,'
      '  TX_DOLAR = :TX_DOLAR,'
      '  VL_ACRESCIMOS_REAIS = :VL_ACRESCIMOS_REAIS,'
      '  VL_DEDUCOES_REAIS = :VL_DEDUCOES_REAIS,'
      '  VL_MLE_MOEDA = :VL_MLE_MOEDA,'
      '  CD_MOEDA_MLE = :CD_MOEDA_MLE,'
      '  TX_MLE = :TX_MLE'
      'where'
      '  NR_PROCESSO = :OLD_NR_PROCESSO')
    InsertSQL.Strings = (
      'insert into TPRE_CALCULO_CAPA'
      
        '  (NR_PROCESSO, CD_INCOTERM, CD_MOEDA_FOB, VL_FOB_MOEDA, TX_FOB,' +
        ' CD_MOEDA_FRETE, '
      
        '   VL_FRETE_MOEDA, TX_FRETE, CD_MOEDA_SEGURO, VL_SEGURO_MOEDA, T' +
        'X_SEGURO, '
      
        '   TX_DOLAR, VL_ACRESCIMOS_REAIS, VL_DEDUCOES_REAIS, VL_MLE_MOED' +
        'A, CD_MOEDA_MLE, '
      '   TX_MLE)'
      'values'
      
        '  (:NR_PROCESSO, :CD_INCOTERM, :CD_MOEDA_FOB, :VL_FOB_MOEDA, :TX' +
        '_FOB, :CD_MOEDA_FRETE, '
      
        '   :VL_FRETE_MOEDA, :TX_FRETE, :CD_MOEDA_SEGURO, :VL_SEGURO_MOED' +
        'A, :TX_SEGURO, '
      
        '   :TX_DOLAR, :VL_ACRESCIMOS_REAIS, :VL_DEDUCOES_REAIS, :VL_MLE_' +
        'MOEDA, '
      '   :CD_MOEDA_MLE, :TX_MLE)')
    DeleteSQL.Strings = (
      'delete from TPRE_CALCULO_CAPA'
      'where'
      '  NR_PROCESSO = :OLD_NR_PROCESSO')
    Left = 40
    Top = 120
  end
  object updPreCalculoAdicao: TUpdateSQL
    ModifySQL.Strings = (
      'update TPRE_CALCULO_ADICAO'
      'set'
      '  NR_PROCESSO = :NR_PROCESSO,'
      '  NR_ADICAO = :NR_ADICAO,'
      '  VL_CIF_REAIS = :VL_CIF_REAIS,'
      '  PC_ALIQUOTA_II = :PC_ALIQUOTA_II,'
      '  VL_II_REAIS = :VL_II_REAIS,'
      '  PC_ALIQUOTA_IPI = :PC_ALIQUOTA_IPI,'
      '  VL_IPI_REAIS = :VL_IPI_REAIS,'
      '  PC_ALIQUOTA_PIS = :PC_ALIQUOTA_PIS,'
      '  VL_PIS_REAIS = :VL_PIS_REAIS,'
      '  PC_ALIQUOTA_COFINS = :PC_ALIQUOTA_COFINS,'
      '  VL_COFINS_REAIS = :VL_COFINS_REAIS,'
      '  PC_ALIQUOTA_ICMS = :PC_ALIQUOTA_ICMS,'
      '  VL_ICMS_REAIS = :VL_ICMS_REAIS,'
      '  VL_OUTRAS_DESP_REAIS = :VL_OUTRAS_DESP_REAIS,'
      '  VL_DESP_ADUAN_REAIS = :VL_DESP_ADUAN_REAIS,'
      '  VL_BASE_PIS_COFINS = :VL_BASE_PIS_COFINS,'
      '  VL_BASE_ICMS = :VL_BASE_ICMS,'
      '  VL_ALIQUOTA_ESPECIFICA_PIS = :VL_ALIQUOTA_ESPECIFICA_PIS,'
      
        '  VL_ALIQUOTA_ESPECIFICA_COFINS = :VL_ALIQUOTA_ESPECIFICA_COFINS' +
        ','
      '  QTD_UNID_ESPECIFICA_PIS = :QTD_UNID_ESPECIFICA_PIS,'
      '  QTD_UNID_ESPECIFICA_COFINS = :QTD_UNID_ESPECIFICA_COFINS'
      'where'
      '  NR_PROCESSO = :OLD_NR_PROCESSO and'
      '  NR_ADICAO = :OLD_NR_ADICAO')
    InsertSQL.Strings = (
      'insert into TPRE_CALCULO_ADICAO'
      
        '  (NR_PROCESSO, NR_ADICAO, VL_CIF_REAIS, PC_ALIQUOTA_II, VL_II_R' +
        'EAIS, PC_ALIQUOTA_IPI, '
      
        '   VL_IPI_REAIS, PC_ALIQUOTA_PIS, VL_PIS_REAIS, PC_ALIQUOTA_COFI' +
        'NS, VL_COFINS_REAIS, '
      
        '   PC_ALIQUOTA_ICMS, VL_ICMS_REAIS, VL_OUTRAS_DESP_REAIS, VL_DES' +
        'P_ADUAN_REAIS, '
      
        '   VL_BASE_PIS_COFINS, VL_BASE_ICMS, VL_ALIQUOTA_ESPECIFICA_PIS,' +
        ' VL_ALIQUOTA_ESPECIFICA_COFINS, '
      '   QTD_UNID_ESPECIFICA_PIS, QTD_UNID_ESPECIFICA_COFINS)'
      'values'
      
        '  (:NR_PROCESSO, :NR_ADICAO, :VL_CIF_REAIS, :PC_ALIQUOTA_II, :VL' +
        '_II_REAIS, '
      
        '   :PC_ALIQUOTA_IPI, :VL_IPI_REAIS, :PC_ALIQUOTA_PIS, :VL_PIS_RE' +
        'AIS, :PC_ALIQUOTA_COFINS, '
      
        '   :VL_COFINS_REAIS, :PC_ALIQUOTA_ICMS, :VL_ICMS_REAIS, :VL_OUTR' +
        'AS_DESP_REAIS, '
      
        '   :VL_DESP_ADUAN_REAIS, :VL_BASE_PIS_COFINS, :VL_BASE_ICMS, :VL' +
        '_ALIQUOTA_ESPECIFICA_PIS, '
      
        '   :VL_ALIQUOTA_ESPECIFICA_COFINS, :QTD_UNID_ESPECIFICA_PIS, :QT' +
        'D_UNID_ESPECIFICA_COFINS)')
    DeleteSQL.Strings = (
      'delete from TPRE_CALCULO_ADICAO'
      'where'
      '  NR_PROCESSO = :OLD_NR_PROCESSO and'
      '  NR_ADICAO = :OLD_NR_ADICAO')
    Left = 160
    Top = 120
  end
  object SP_PRE_CALCULO: TStoredProc
    DatabaseName = 'DBBROKER'
    StoredProcName = 'SP_PRE_CALCULO'
    Left = 104
    Top = 192
    ParamData = <
      item
        DataType = ftInteger
        Name = 'Result'
        ParamType = ptResult
      end
      item
        DataType = ftString
        Name = '@NR_PROCESSO'
        ParamType = ptInput
        Value = '0101IM-1000-09'
      end>
  end
  object qryTotais: TQuery
    CachedUpdates = True
    AfterOpen = qryTotaisAfterOpen
    DatabaseName = 'DBBROKER'
    DataSource = dsPreCalculoAdicao
    SQL.Strings = (
      'SELECT SUM(VL_II_REAIS) AS VL_II_REAIS,'
      '       SUM(VL_IPI_REAIS) AS VL_IPI_REAIS,'
      '       SUM(VL_BASE_PIS_COFINS) AS VL_BASE_PIS_COFINS,'
      '       SUM(VL_PIS_REAIS) AS VL_PIS_REAIS,'
      '       SUM(VL_COFINS_REAIS) AS VL_COFINS_REAIS,'
      '       SUM(VL_BASE_ICMS) AS VL_BASE_ICMS,'
      '       SUM(VL_ICMS_REAIS) AS VL_ICMS_REAIS,'
      '       SUM(VL_OUTRAS_DESP_REAIS) AS VL_OUTRAS_DESP_REAIS,'
      
        '       SUM(VL_II_REAIS) + SUM(VL_IPI_REAIS) + SUM(VL_PIS_REAIS) ' +
        '+ SUM(VL_COFINS_REAIS) + SUM(VL_ICMS_REAIS) + SUM(VL_OUTRAS_DESP' +
        '_REAIS) AS VL_TOTAL'
      'FROM TPRE_CALCULO_ADICAO'
      'WHERE NR_PROCESSO = :NR_PROCESSO')
    Left = 256
    Top = 64
    ParamData = <
      item
        DataType = ftFixedChar
        Name = 'NR_PROCESSO'
        ParamType = ptUnknown
        Size = 19
      end>
    object qryTotaisVL_II_REAIS: TFloatField
      FieldName = 'VL_II_REAIS'
      Origin = 'DBBROKER.TPRE_CALCULO_ADICAO.VL_II_REAIS'
      DisplayFormat = '#0,.00'
    end
    object qryTotaisVL_IPI_REAIS: TFloatField
      FieldName = 'VL_IPI_REAIS'
      Origin = 'DBBROKER.TPRE_CALCULO_ADICAO.VL_IPI_REAIS'
      DisplayFormat = '#0,.00'
    end
    object qryTotaisVL_BASE_PIS_COFINS: TFloatField
      FieldName = 'VL_BASE_PIS_COFINS'
      Origin = 'DBBROKER.TPRE_CALCULO_ADICAO.VL_BASE_PIS_COFINS'
      DisplayFormat = '#0,.00'
    end
    object qryTotaisVL_PIS_REAIS: TFloatField
      FieldName = 'VL_PIS_REAIS'
      Origin = 'DBBROKER.TPRE_CALCULO_ADICAO.VL_PIS_REAIS'
      DisplayFormat = '#0,.00'
    end
    object qryTotaisVL_COFINS_REAIS: TFloatField
      FieldName = 'VL_COFINS_REAIS'
      Origin = 'DBBROKER.TPRE_CALCULO_ADICAO.VL_COFINS_REAIS'
      DisplayFormat = '#0,.00'
    end
    object qryTotaisVL_BASE_ICMS: TFloatField
      FieldName = 'VL_BASE_ICMS'
      Origin = 'DBBROKER.TPRE_CALCULO_ADICAO.VL_BASE_ICMS'
      DisplayFormat = '#0,.00'
    end
    object qryTotaisVL_ICMS_REAIS: TFloatField
      FieldName = 'VL_ICMS_REAIS'
      Origin = 'DBBROKER.TPRE_CALCULO_ADICAO.VL_ICMS_REAIS'
      DisplayFormat = '#0,.00'
    end
    object qryTotaisVL_OUTRAS_DESP_REAIS: TFloatField
      FieldName = 'VL_OUTRAS_DESP_REAIS'
      Origin = 'DBBROKER.TPRE_CALCULO_ADICAO.VL_OUTRAS_DESP_REAIS'
      DisplayFormat = '#0,.00'
    end
    object qryTotaisVL_TOTAL: TFloatField
      FieldName = 'VL_TOTAL'
      Origin = 'DBBROKER.TPRE_CALCULO_ADICAO.VL_II_REAIS'
      DisplayFormat = '#0,.00'
    end
  end
  object dsTotais: TDataSource
    DataSet = qryTotais
    Left = 256
    Top = 16
  end
end
