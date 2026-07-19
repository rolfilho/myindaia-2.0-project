object datm_previsao: Tdatm_previsao
  OldCreateOrder = True
  OnCreate = datm_previsaoCreate
  Left = 586
  Top = 138
  Height = 599
  Width = 587
  object ds_previsao: TDataSource
    DataSet = qry_previsao_
    OnStateChange = ds_previsaoStateChange
    Left = 43
    Top = 16
  end
  object qry_previsao_: TQuery
    CachedUpdates = True
    BeforeOpen = qry_previsao_BeforeOpen
    AfterOpen = qry_previsao_AfterOpen
    AfterClose = qry_previsao_AfterClose
    BeforeInsert = qry_previsao_BeforeInsert
    AfterInsert = qry_previsao_AfterInsert
    BeforeEdit = qry_previsao_BeforeEdit
    AfterPost = qry_previsao_AfterPost
    AfterDelete = qry_previsao_AfterDelete
    AfterScroll = qry_previsao_AfterScroll
    OnCalcFields = qry_previsao_CalcFields
    DatabaseName = 'DBBROKER'
    RequestLive = True
    SQL.Strings = (
      'SELECT P.*, RTRIM(U.NM_USUARIO) AS NM_USUARIO'
      'FROM TPREVISAO P'
      '   LEFT JOIN TUSUARIO U ON U.CD_USUARIO = P.CD_USUARIO'
      'WHERE P.NR_PROCESSO = :NR_PROCESSO')
    UpdateMode = upWhereKeyOnly
    UpdateObject = upd_previsao_
    Left = 112
    Top = 16
    ParamData = <
      item
        DataType = ftString
        Name = 'NR_PROCESSO'
        ParamType = ptUnknown
      end>
    object qry_previsao_NR_PROCESSO: TStringField
      FieldName = 'NR_PROCESSO'
      Origin = 'TPREVISAO.CD_UNIDADE'
      Size = 18
    end
    object qry_previsao_CD_CLIENTE: TStringField
      FieldName = 'CD_CLIENTE'
      Origin = 'TPREVISAO.CD_CLIENTE'
      Size = 5
    end
    object qry_previsao_CD_VIA_TRANSP: TStringField
      FieldName = 'CD_VIA_TRANSP'
      Origin = 'TPREVISAO.CD_VIA_TRANSP'
      Size = 2
    end
    object qry_previsao_DT_ENTRADA: TDateTimeField
      FieldName = 'DT_ENTRADA'
      Origin = 'TPREVISAO.DT_ENTRADA'
      DisplayFormat = 'dd/mm/yyyy'
      EditMask = '!99/99/0000;1;_'
    end
    object qry_previsao_CD_MOEDA_MLE: TStringField
      FieldName = 'CD_MOEDA_MLE'
      Origin = 'TPREVISAO.CD_MOEDA_MLE'
      Size = 3
    end
    object qry_previsao_CD_MOEDA_FRETE: TStringField
      FieldName = 'CD_MOEDA_FRETE'
      Origin = 'TPREVISAO.CD_MOEDA_FRETE'
      Size = 3
    end
    object qry_previsao_CD_MOEDA_SEGURO: TStringField
      FieldName = 'CD_MOEDA_SEGURO'
      Origin = 'TPREVISAO.CD_MOEDA_SEGURO'
      Size = 3
    end
    object qry_previsao_VL_MLE_MNEG: TFloatField
      FieldName = 'VL_MLE_MNEG'
      Origin = 'TPREVISAO.VL_MLE_MNEG'
      DisplayFormat = '#0,.00'
      EditFormat = '#0.00'
    end
    object qry_previsao_VL_MLE_MN: TFloatField
      FieldName = 'VL_MLE_MN'
      Origin = 'TPREVISAO.VL_MLE_MN'
      DisplayFormat = '#0,.00'
      EditFormat = '#0.00'
    end
    object qry_previsao_VL_DESP_MN: TFloatField
      FieldName = 'VL_DESP_MN'
      Origin = 'TPREVISAO.VL_DESP_MN'
      DisplayFormat = '#0,.00'
      EditFormat = '#0.00'
    end
    object qry_previsao_VL_FRETE_MNEG: TFloatField
      FieldName = 'VL_FRETE_MNEG'
      Origin = 'TPREVISAO.VL_FRETE_MNEG'
      DisplayFormat = '#0,.00'
      EditFormat = '#0.00'
    end
    object qry_previsao_VL_FRETE_MN: TFloatField
      FieldName = 'VL_FRETE_MN'
      Origin = 'TPREVISAO.VL_FRETE_MN'
      DisplayFormat = '#0,.00'
      EditFormat = '#0.00'
    end
    object qry_previsao_VL_SEGURO_MNEG: TFloatField
      FieldName = 'VL_SEGURO_MNEG'
      Origin = 'TPREVISAO.VL_SEGURO_MNEG'
      DisplayFormat = '#0,.00'
      EditFormat = '#0.00'
    end
    object qry_previsao_VL_SEGURO_MN: TFloatField
      FieldName = 'VL_SEGURO_MN'
      Origin = 'TPREVISAO.VL_SEGURO_MN'
      DisplayFormat = '#0,.00'
      EditFormat = '#0.00'
    end
    object qry_previsao_CD_BASE_SEGURO: TStringField
      FieldName = 'CD_BASE_SEGURO'
      Origin = 'TPREVISAO.CD_BASE_SEGURO'
      Size = 1
    end
    object qry_previsao_PC_SEGURO: TFloatField
      FieldName = 'PC_SEGURO'
      Origin = 'TPREVISAO.PC_SEGURO'
      DisplayFormat = '#0,.0000'
      EditFormat = '#0.0000'
    end
    object qry_previsao_IN_REB: TStringField
      FieldName = 'IN_REB'
      Origin = 'TPREVISAO.IN_REB'
      Size = 1
    end
    object qry_previsao_PB_PREVISAO: TFloatField
      FieldName = 'PB_PREVISAO'
      Origin = 'TPREVISAO.PB_PREVISAO'
      DisplayFormat = '#0,.00000'
      EditFormat = '#0.00000'
    end
    object qry_previsao_PL_PREVISAO: TFloatField
      FieldName = 'PL_PREVISAO'
      Origin = 'TPREVISAO.PL_PREVISAO'
      DisplayFormat = '#0,.00000'
      EditFormat = '#0.00000'
    end
    object qry_previsao_QT_EMBALAGEM: TFloatField
      FieldName = 'QT_EMBALAGEM'
      Origin = 'TPREVISAO.QT_EMBALAGEM'
      DisplayFormat = '#0,.00000'
      EditFormat = '#0.#######'
    end
    object qry_previsao_CD_EMBALAGEM: TStringField
      FieldName = 'CD_EMBALAGEM'
      Origin = 'TPREVISAO.CD_EMBALAGEM'
      Size = 2
    end
    object qry_previsao_CD_USUARIO: TStringField
      FieldName = 'CD_USUARIO'
      Origin = 'TPREVISAO.CD_USUARIO'
      Size = 4
    end
    object qry_previsao_DT_PREVISAO: TDateTimeField
      FieldName = 'DT_PREVISAO'
      Origin = 'TPREVISAO.DT_PREVISAO'
    end
    object qry_previsao_QT_ADICOES: TIntegerField
      FieldName = 'QT_ADICOES'
      Origin = 'TPREVISAO.QT_ADICOES'
      DisplayFormat = '000'
    end
    object qry_previsao_VL_TAXA_MLE: TFloatField
      FieldName = 'VL_TAXA_MLE'
      Origin = 'TPREVISAO.NR_PROCESSO'
    end
    object qry_previsao_VL_TAXA_FRETE: TFloatField
      FieldName = 'VL_TAXA_FRETE'
      Origin = 'TPREVISAO.CD_CLIENTE'
    end
    object qry_previsao_VL_TAXA_SEGURO: TFloatField
      FieldName = 'VL_TAXA_SEGURO'
      Origin = 'TPREVISAO.CD_VIA_TRANSP'
    end
    object qry_previsao_Look_nm_importador: TStringField
      FieldKind = fkLookup
      FieldName = 'Look_nm_importador'
      LookupDataSet = tbl_empresa_nac_
      LookupKeyFields = 'CD_EMPRESA'
      LookupResultField = 'NM_EMPRESA'
      KeyFields = 'CD_CLIENTE'
      Size = 40
      Lookup = True
    end
    object qry_previsao_Calc_vl_mle_mn: TFloatField
      FieldKind = fkCalculated
      FieldName = 'Calc_vl_mle_mn'
      DisplayFormat = '#0,.00'
      EditFormat = '#0.00'
      Calculated = True
    end
    object qry_previsao_Calc_vl_frete_mn: TFloatField
      FieldKind = fkCalculated
      FieldName = 'Calc_vl_frete_mn'
      DisplayFormat = '#0,.00'
      EditFormat = '#0.00'
      Calculated = True
    end
    object qry_previsao_Calc_vl_seguro_mn: TFloatField
      FieldKind = fkCalculated
      FieldName = 'Calc_vl_seguro_mn'
      DisplayFormat = '#0,.00'
      EditFormat = '#0.00'
      Calculated = True
    end
    object qry_previsao_Calc_vl_desp_mn: TFloatField
      FieldKind = fkCalculated
      FieldName = 'Calc_vl_desp_mn'
      DisplayFormat = '#0,.00'
      EditFormat = '#0.00'
      Calculated = True
    end
    object qry_previsao_VL_DESP_MNEG: TFloatField
      FieldName = 'VL_DESP_MNEG'
      Origin = 'TPREVISAO.NR_PREVISAO'
      DisplayFormat = '#0,.00'
      EditFormat = '#0.00'
    end
    object qry_previsao_calc_nr_processo: TStringField
      DisplayWidth = 14
      FieldKind = fkCalculated
      FieldName = 'calc_nr_processo'
      Size = 14
      Calculated = True
    end
    object qry_previsao_DT_CALCULO: TDateTimeField
      FieldName = 'DT_CALCULO'
      Origin = 'TPREVISAO.NR_PROCESSO'
      DisplayFormat = 'dd/mm/yyyy'
      EditMask = '!99/99/0000;1;_'
    end
    object qry_previsao_VL_TX_SISCOMEX: TFloatField
      FieldName = 'VL_TX_SISCOMEX'
      Origin = 'TPREVISAO.NR_PROCESSO'
    end
    object qry_previsao_VL_CIF_MN: TFloatField
      FieldName = 'VL_CIF_MN'
      Origin = 'TPREVISAO.CD_CLIENTE'
    end
    object qry_previsao_CD_INCOTERM: TStringField
      FieldName = 'CD_INCOTERM'
      Origin = 'TPREVISAO.DT_ENTRADA'
      Size = 3
    end
    object qry_previsao_IN_EMBUT_FRT_ITENS: TBooleanField
      FieldName = 'IN_EMBUT_FRT_ITENS'
      Origin = 'TPREVISAO.NR_PROCESSO'
    end
    object qry_previsao_IN_EMBUT_SEG_ITENS: TBooleanField
      FieldName = 'IN_EMBUT_SEG_ITENS'
      Origin = 'TPREVISAO.NR_PROCESSO'
    end
    object qry_previsao_IN_MOEDA_UNICA: TBooleanField
      FieldName = 'IN_MOEDA_UNICA'
      Origin = 'TPREVISAO.CD_VIA_TRANSP'
    end
    object qry_previsao_VL_ACRESCIMO: TFloatField
      FieldName = 'VL_ACRESCIMO'
      Origin = 'DBBROKER.TPREVISAO.VL_ACRESCIMO'
      DisplayFormat = '#0,.00'
    end
    object qry_previsao_VL_DEDUCAO: TFloatField
      FieldName = 'VL_DEDUCAO'
      Origin = 'DBBROKER.TPREVISAO.VL_DEDUCAO'
      DisplayFormat = '#0,.00'
    end
    object qry_previsao_VL_FRETE_INTERNO: TFloatField
      FieldName = 'VL_FRETE_INTERNO'
      Origin = 'DBBROKER.TPREVISAO.VL_FRETE_INTERNO'
      DisplayFormat = '#0,.00'
    end
    object qry_previsao_CD_VINC_IMPO_EXPO: TStringField
      FieldName = 'CD_VINC_IMPO_EXPO'
      Origin = 'DBBROKER.TPREVISAO.CD_VINC_IMPO_EXPO'
      FixedChar = True
      Size = 40
    end
    object qry_previsao_VL_ACRESCIMO_MN: TFloatField
      FieldName = 'VL_ACRESCIMO_MN'
      Origin = 'DBBROKER.TPREVISAO.VL_ACRESCIMO_MN'
    end
    object qry_previsao_VL_DEDUCAO_MN: TFloatField
      FieldName = 'VL_DEDUCAO_MN'
      Origin = 'DBBROKER.TPREVISAO.VL_DEDUCAO_MN'
    end
    object qry_previsao_VL_FRETE_TNAC_MNEG: TFloatField
      FieldName = 'VL_FRETE_TNAC_MNEG'
      Origin = 'DBBROKER.TPREVISAO.VL_FRETE_TNAC_MNEG'
      DisplayFormat = '#0,.00'
    end
    object qry_previsao_NM_USUARIO: TStringField
      FieldName = 'NM_USUARIO'
      FixedChar = True
      Size = 50
    end
  end
  object ds_previsao_adicao: TDataSource
    DataSet = qry_previsao_adicao_
    OnStateChange = ds_previsaoStateChange
    Left = 35
    Top = 65
  end
  object qry_previsao_adicao_: TQuery
    CachedUpdates = True
    AfterOpen = qry_previsao_adicao_AfterOpen
    BeforeInsert = qry_previsao_adicao_BeforeInsert
    BeforeEdit = qry_previsao_adicao_BeforeEdit
    AfterPost = qry_previsao_adicao_AfterPost
    AfterCancel = qry_previsao_adicao_AfterCancel
    AfterDelete = qry_previsao_adicao_AfterDelete
    BeforeScroll = qry_previsao_adicao_BeforeScroll
    AfterScroll = qry_previsao_adicao_AfterScroll
    DatabaseName = 'DBBROKER'
    DataSource = ds_previsao
    RequestLive = True
    SQL.Strings = (
      'SELECT * FROM TPREVISAO_ADICAO'
      'WHERE NR_PROCESSO = :NR_PROCESSO'
      'ORDER BY NR_PROCESSO, NR_ADICAO')
    UpdateObject = upd_previsao_adicao_
    Left = 113
    Top = 72
    ParamData = <
      item
        DataType = ftString
        Name = 'NR_PROCESSO'
        ParamType = ptUnknown
        Size = 19
      end>
    object qry_previsao_adicao_NR_PROCESSO: TStringField
      FieldName = 'NR_PROCESSO'
      Origin = 'TPREVISAO_ADICAO.NR_PROCESSO'
      Size = 18
    end
    object qry_previsao_adicao_NR_ADICAO: TStringField
      FieldName = 'NR_ADICAO'
      Origin = 'TPREVISAO_ADICAO.NR_ADICAO'
      Size = 3
    end
    object qry_previsao_adicao_CD_NCM_SH: TStringField
      FieldName = 'CD_NCM_SH'
      Origin = 'TPREVISAO_ADICAO.CD_NCM_SH'
      OnChange = qry_previsao_adicao_CD_NCM_SHChange
      EditMask = '9999.99.99-999;0;_'
      Size = 11
    end
    object qry_previsao_adicao_QUANTIDADE: TFloatField
      FieldName = 'QUANTIDADE'
      Origin = 'TPREVISAO_ADICAO.QUANTIDADE'
      DisplayFormat = '#0,.0000000'
      EditFormat = '#0.0000000'
    end
    object qry_previsao_adicao_VL_MLE_MNEG_TOT: TFloatField
      FieldName = 'VL_MLE_MNEG_TOT'
      Origin = 'TPREVISAO_ADICAO.VL_MLE_MNEG_TOT'
      DisplayFormat = '#0,.00'
      EditFormat = '#0.00'
    end
    object qry_previsao_adicao_VL_MLE_MNEG_UNIT: TFloatField
      FieldName = 'VL_MLE_MNEG_UNIT'
      Origin = 'TPREVISAO_ADICAO.VL_MLE_MNEG_UNIT'
      DisplayFormat = '#0,.00'
      EditFormat = '#0.00'
    end
    object qry_previsao_adicao_PC_ALIQ_II: TFloatField
      FieldName = 'PC_ALIQ_II'
      Origin = 'TPREVISAO_ADICAO.PC_ALIQ_II'
      DisplayFormat = '#0,.00'
      EditFormat = '#0.00'
    end
    object qry_previsao_adicao_PC_ALIQ_ACORDO: TFloatField
      FieldName = 'PC_ALIQ_ACORDO'
      Origin = 'TPREVISAO_ADICAO.PC_ALIQ_IPI'
      DisplayFormat = '#0,.00'
      EditFormat = '#0.00'
    end
    object qry_previsao_adicao_PC_ALIQ_IPI: TFloatField
      FieldName = 'PC_ALIQ_IPI'
      Origin = 'TPREVISAO_ADICAO.PC_ALIQ_IPI'
      DisplayFormat = '#0,.00'
      EditFormat = '#0.00'
    end
    object qry_previsao_adicao_PC_ALIQ_ICMS: TFloatField
      FieldName = 'PC_ALIQ_ICMS'
      Origin = 'TPREVISAO_ADICAO.PC_ALIQ_ICMS'
      OnChange = qry_previsao_adicao_PC_ALIQ_ICMSChange
      DisplayFormat = '#0,.00'
      EditFormat = '#0.00'
    end
    object qry_previsao_adicao_PC_ALIQ_ICMS_RED: TFloatField
      FieldName = 'PC_ALIQ_ICMS_RED'
      Origin = 'TPREVISAO_ADICAO.PC_ALIQ_ICMS_RED'
      OnChange = qry_previsao_adicao_PC_ALIQ_ICMS_REDChange
      DisplayFormat = '#0,.00'
      EditFormat = '#0.00'
    end
    object qry_previsao_adicao_VL_IPI: TFloatField
      FieldName = 'VL_IPI'
      Origin = 'TPREVISAO_ADICAO.VL_IPI'
      DisplayFormat = '#0,.00'
      EditFormat = '#0.00'
    end
    object qry_previsao_adicao_VL_II: TFloatField
      FieldName = 'VL_II'
      Origin = 'TPREVISAO_ADICAO.VL_II'
      DisplayFormat = '#0,.00'
      EditFormat = '#0.00'
    end
    object qry_previsao_adicao_VL_ICMS: TFloatField
      FieldName = 'VL_ICMS'
      Origin = 'TPREVISAO_ADICAO.VL_ICMS'
      DisplayFormat = '#0,.00'
      EditFormat = '#0.00'
    end
    object qry_previsao_adicao_CD_REG_TRIB_II: TStringField
      FieldName = 'CD_REG_TRIB_II'
      Origin = 'TPREVISAO_ADICAO.CD_REG_TRIB_II'
      OnChange = qry_previsao_adicao_CD_REG_TRIB_IIChange
      Size = 1
    end
    object qry_previsao_adicao_CD_REG_TRIB_IPI: TStringField
      FieldName = 'CD_REG_TRIB_IPI'
      Origin = 'TPREVISAO_ADICAO.CD_REG_TRIB_IPI'
      OnChange = qry_previsao_adicao_CD_REG_TRIB_IIChange
      Size = 1
    end
    object qry_previsao_adicao_VL_ALIQ_ESPEC_IPT: TFloatField
      FieldName = 'VL_ALIQ_ESPEC_IPT'
      Origin = 'TPREVISAO_ADICAO.VL_ALIQ_ESPEC_IPT'
      DisplayFormat = '#0,.00'
      EditFormat = '#0.00'
    end
    object qry_previsao_adicao_QT_MERC_UN_ALIQ_ES: TFloatField
      FieldName = 'QT_MERC_UN_ALIQ_ES'
      Origin = 'TPREVISAO_ADICAO.QT_MERC_UN_ALIQ_ES'
      DisplayFormat = '#0,.0000000'
      EditFormat = '#0.0000000'
    end
    object qry_previsao_adicao_PC_ALIQ_REDUZIDA_II: TFloatField
      FieldName = 'PC_ALIQ_REDUZIDA_II'
      Origin = 'TPREVISAO_ADICAO.PC_ALIQ_REDUZIDA_II'
      DisplayFormat = '#0,.00'
      EditFormat = '#0.00'
    end
    object qry_previsao_adicao_PC_ALIQ_REDUZIDA_IPI: TFloatField
      FieldName = 'PC_ALIQ_REDUZIDA_IPI'
      Origin = 'TPREVISAO_ADICAO.PC_ALIQ_REDUZIDA_IPI'
      DisplayFormat = '#0,.00'
      EditFormat = '#0.00'
    end
    object qry_previsao_adicao_PC_REDUCAO_IPT_BLI: TFloatField
      FieldName = 'PC_REDUCAO_IPT_BLI'
      Origin = 'TPREVISAO_ADICAO.PC_REDUCAO_IPT_BLI'
      DisplayFormat = '#0,.00'
      EditFormat = '#0.00'
    end
    object qry_previsao_adicao_IN_IPI_NAO_TRIBUT: TBooleanField
      FieldName = 'IN_IPI_NAO_TRIBUT'
      Origin = 'TPREVISAO_ADICAO.NR_PREVISAO'
    end
    object qry_previsao_adicao_Look_Reg_Trib_II: TStringField
      FieldKind = fkLookup
      FieldName = 'Look_Reg_Trib_II'
      LookupDataSet = tbl_reg_trib_
      LookupKeyFields = 'CODIGO'
      LookupResultField = 'DESCRICAO'
      KeyFields = 'CD_REG_TRIB_II'
      Size = 30
      Lookup = True
    end
    object qry_previsao_adicao_PL_MERCADORIA: TFloatField
      FieldName = 'PL_MERCADORIA'
      Origin = 'TPREVISAO_ADICAO.NR_PREVISAO'
      DisplayFormat = '#0,.00000'
      EditFormat = '#0.00000'
      Precision = 5
    end
    object qry_previsao_adicao_VL_ACRESCIMO: TFloatField
      FieldName = 'VL_ACRESCIMO'
      Origin = 'TPREVISAO_ADICAO.PC_ALIQ_IPI'
      DisplayFormat = '#0,.00'
      EditFormat = '#0.00'
    end
    object qry_previsao_adicao_VL_DEDUCAO: TFloatField
      FieldName = 'VL_DEDUCAO'
      Origin = 'TPREVISAO_ADICAO.PC_ALIQ_ICMS'
      DisplayFormat = '#0,.00'
      EditFormat = '#0.00'
    end
    object qry_previsao_adicao_VL_FRETE: TFloatField
      FieldName = 'VL_FRETE'
      Origin = 'TPREVISAO_ADICAO.NR_PROCESSO'
    end
    object qry_previsao_adicao_VL_SEGURO: TFloatField
      FieldName = 'VL_SEGURO'
      Origin = 'TPREVISAO_ADICAO.NR_ADICAO'
    end
    object qry_previsao_adicao_VL_MLE: TFloatField
      FieldName = 'VL_MLE'
      Origin = 'TPREVISAO_ADICAO.CD_NCM_SH'
    end
    object qry_previsao_adicao_VL_BASE_CALC_II: TFloatField
      FieldName = 'VL_BASE_CALC_II'
      Origin = 'TPREVISAO_ADICAO.QUANTIDADE'
      DisplayFormat = '#0,.00'
      EditFormat = '#0,.00'
    end
    object qry_previsao_adicao_VL_BASE_CALC_IPI: TFloatField
      FieldName = 'VL_BASE_CALC_IPI'
      Origin = 'TPREVISAO_ADICAO.VL_MLE_MNEG_TOT'
    end
    object qry_previsao_adicao_VL_BASE_CALC_ICMS: TFloatField
      FieldName = 'VL_BASE_CALC_ICMS'
      Origin = 'TPREVISAO_ADICAO.VL_MLE_MNEG_UNIT'
    end
    object qry_previsao_adicao_VL_DESPESAS: TFloatField
      FieldName = 'VL_DESPESAS'
      Origin = 'TPREVISAO_ADICAO.PC_ALIQ_II'
    end
    object qry_previsao_adicao_CD_MOEDA_MLE: TStringField
      FieldName = 'CD_MOEDA_MLE'
      Origin = 'TPREVISAO_ADICAO.PC_ALIQ_IPI'
      Size = 3
    end
    object qry_previsao_adicao_ALIQ_PIS: TFloatField
      FieldName = 'ALIQ_PIS'
      Origin = 'DBBROKER.TPREVISAO_ADICAO.ALIQ_PIS'
      DisplayFormat = '#0,.00'
      EditFormat = '#0,.00'
    end
    object qry_previsao_adicao_ALIQ_COFINS: TFloatField
      FieldName = 'ALIQ_COFINS'
      Origin = 'DBBROKER.TPREVISAO_ADICAO.ALIQ_COFINS'
      DisplayFormat = '#0,.00'
      EditFormat = '#0,.00'
    end
    object qry_previsao_adicao_VL_BASE_PIS: TFloatField
      FieldName = 'VL_BASE_PIS'
      Origin = 'DBBROKER.TPREVISAO_ADICAO.VL_BASE_PIS'
      DisplayFormat = '#0,.00'
      EditFormat = '#0,.00'
    end
    object qry_previsao_adicao_VL_PIS: TFloatField
      FieldName = 'VL_PIS'
      Origin = 'DBBROKER.TPREVISAO_ADICAO.VL_PIS'
      DisplayFormat = '#0,.00'
      EditFormat = '#0,.00'
    end
    object qry_previsao_adicao_VL_COFINS: TFloatField
      FieldName = 'VL_COFINS'
      Origin = 'DBBROKER.TPREVISAO_ADICAO.VL_COFINS'
      DisplayFormat = '#0,.00'
      EditFormat = '#0,.00'
    end
    object qry_previsao_adicao_PC_REDUCAO_PIS_COFINS: TFloatField
      FieldName = 'PC_REDUCAO_PIS_COFINS'
      Origin = 'DBBROKER.TPREVISAO_ADICAO.PC_REDUCAO_PIS_COFINS'
      DisplayFormat = '#0,.00'
      EditFormat = '#0,.00'
    end
    object qry_previsao_adicao_CD_TRIBUTACAO_ICMS: TStringField
      FieldName = 'CD_TRIBUTACAO_ICMS'
      Origin = 'DBBROKER.TPREVISAO_ADICAO.CD_TRIBUTACAO_ICMS'
      FixedChar = True
      Size = 1
    end
    object qry_previsao_adicao_CD_EXPORTADOR: TStringField
      FieldName = 'CD_EXPORTADOR'
      Origin = 'DBBROKER.TPREVISAO_ADICAO.CD_EXPORTADOR'
      FixedChar = True
      Size = 5
    end
    object qry_previsao_adicao_CD_FABRICANTE: TStringField
      FieldName = 'CD_FABRICANTE'
      Origin = 'DBBROKER.TPREVISAO_ADICAO.CD_FABRICANTE'
      OnChange = qry_previsao_adicao_CD_FABRICANTEChange
      FixedChar = True
      Size = 5
    end
    object qry_previsao_adicao_CD_FUND_LEGAL_ICMS: TStringField
      FieldName = 'CD_FUND_LEGAL_ICMS'
      Origin = 'DBBROKER.TPREVISAO_ADICAO.CD_FUND_LEGAL_ICMS'
      FixedChar = True
      Size = 3
    end
    object qry_previsao_adicao_CD_PAIS_AQUISICAO: TStringField
      FieldName = 'CD_PAIS_AQUISICAO'
      Origin = 'DBBROKER.TPREVISAO_ADICAO.CD_PAIS_AQUISICAO'
      FixedChar = True
      Size = 3
    end
    object qry_previsao_adicao_CD_FUND_LEG_REGIME: TStringField
      FieldName = 'CD_FUND_LEG_REGIME'
      Origin = 'DBBROKER.TPREVISAO_ADICAO.CD_FUND_LEG_REGIME'
      OnChange = qry_previsao_adicao_CD_REG_TRIB_IIChange
      FixedChar = True
      Size = 2
    end
    object qry_previsao_adicao_CD_VINC_IMPO_EXPO: TStringField
      FieldName = 'CD_VINC_IMPO_EXPO'
      Origin = 'DBBROKER.TPREVISAO_ADICAO.CD_VINC_IMPO_EXPO'
      FixedChar = True
      Size = 1
    end
    object qry_previsao_adicao_CD_APLICACAO_MERC: TStringField
      FieldName = 'CD_APLICACAO_MERC'
      Origin = 'DBBROKER.TPREVISAO_ADICAO.CD_APLICACAO_MERC'
      FixedChar = True
      Size = 1
    end
    object qry_previsao_adicao_CD_INCOTERMS_VENDA: TStringField
      FieldName = 'CD_INCOTERMS_VENDA'
      Origin = 'DBBROKER.TPREVISAO_ADICAO.CD_INCOTERMS_VENDA'
      FixedChar = True
      Size = 3
    end
    object qry_previsao_adicao_CD_CFOP: TStringField
      FieldName = 'CD_CFOP'
      Origin = 'DBBROKER.TPREVISAO_ADICAO.CD_CFOP'
      FixedChar = True
      Size = 4
    end
    object qry_previsao_adicao_CD_TIPO_ACORDO_TAR: TStringField
      FieldName = 'CD_TIPO_ACORDO_TAR'
      Origin = 'DBBROKER.TPREVISAO_ADICAO.CD_TIPO_ACORDO_TAR'
      FixedChar = True
      Size = 1
    end
    object qry_previsao_adicao_CD_TIPO_BENEF_PIS_COFINS: TStringField
      FieldName = 'CD_TIPO_BENEF_PIS_COFINS'
      Origin = 'DBBROKER.TPREVISAO_ADICAO.CD_TIPO_BENEF_PIS_COFINS'
      OnChange = qry_previsao_adicao_CD_REG_TRIB_IIChange
      FixedChar = True
      Size = 1
    end
    object qry_previsao_adicao_CD_FUND_LEGAL_PISCOFINS: TStringField
      FieldName = 'CD_FUND_LEGAL_PISCOFINS'
      Origin = 'DBBROKER.TPREVISAO_ADICAO.CD_FUND_LEGAL_PISCOFINS'
      FixedChar = True
      Size = 2
    end
    object qry_previsao_adicao_IN_FUNDO_POBREZA: TStringField
      FieldName = 'IN_FUNDO_POBREZA'
      Origin = 'DBBROKER.TPREVISAO_ADICAO.IN_FUNDO_POBREZA'
      FixedChar = True
      Size = 1
    end
    object qry_previsao_adicao_VL_ALIQUOTA_ESPECIFICA_PIS: TFloatField
      FieldName = 'VL_ALIQUOTA_ESPECIFICA_PIS'
      Origin = 'DBBROKER.TPREVISAO_ADICAO.VL_ALIQUOTA_ESPECIFICA_PIS'
      DisplayFormat = '#0.0000000'
      EditFormat = '#0.0000000'
    end
    object qry_previsao_adicao_VL_ALIQUOTA_ESPECIFICA_COFINS: TFloatField
      FieldName = 'VL_ALIQUOTA_ESPECIFICA_COFINS'
      Origin = 'DBBROKER.TPREVISAO_ADICAO.VL_ALIQUOTA_ESPECIFICA_COFINS'
      DisplayFormat = '#0.0000000'
      EditFormat = '#0.0000000'
    end
    object qry_previsao_adicao_QTD_UNID_ESPECIFICA_PIS: TFloatField
      FieldName = 'QTD_UNID_ESPECIFICA_PIS'
      Origin = 'DBBROKER.TPREVISAO_ADICAO.QTD_UNID_ESPECIFICA_PIS'
    end
    object qry_previsao_adicao_QTD_UNID_ESPECIFICA_COFINS: TFloatField
      FieldName = 'QTD_UNID_ESPECIFICA_COFINS'
      Origin = 'DBBROKER.TPREVISAO_ADICAO.QTD_UNID_ESPECIFICA_COFINS'
    end
    object qry_previsao_adicao_CD_UNIDADE_MEDIDA_PIS: TStringField
      FieldName = 'CD_UNIDADE_MEDIDA_PIS'
      Origin = 'DBBROKER.TPREVISAO_ADICAO.CD_UNIDADE_MEDIDA_PIS'
      FixedChar = True
      Size = 3
    end
    object qry_previsao_adicao_CD_UNIDADE_MEDIDA_COFINS: TStringField
      FieldName = 'CD_UNIDADE_MEDIDA_COFINS'
      Origin = 'DBBROKER.TPREVISAO_ADICAO.CD_UNIDADE_MEDIDA_COFINS'
      FixedChar = True
      Size = 3
    end
    object qry_previsao_adicao_QT_MESES_ADM_TEMP: TIntegerField
      FieldName = 'QT_MESES_ADM_TEMP'
      Origin = 'DBBROKER.TPREVISAO_ADICAO.QT_MESES_ADM_TEMP'
    end
    object qry_previsao_adicao_VL_PIS_CALCULADO: TFloatField
      FieldName = 'VL_PIS_CALCULADO'
      Origin = 'DBBROKER.TPREVISAO_ADICAO.VL_PIS_CALCULADO'
    end
    object qry_previsao_adicao_VL_COFINS_CALCULADO: TFloatField
      FieldName = 'VL_COFINS_CALCULADO'
      Origin = 'DBBROKER.TPREVISAO_ADICAO.VL_COFINS_CALCULADO'
    end
    object qry_previsao_adicao_IN_SUSPENDE_II_RETIFIC: TBooleanField
      FieldName = 'IN_SUSPENDE_II_RETIFIC'
      Origin = 'DBBROKER.TPREVISAO_ADICAO.IN_SUSPENDE_II_RETIFIC'
    end
    object qry_previsao_adicao_IN_SUSPENDE_IPI_RETIFIC: TBooleanField
      FieldName = 'IN_SUSPENDE_IPI_RETIFIC'
      Origin = 'DBBROKER.TPREVISAO_ADICAO.IN_SUSPENDE_IPI_RETIFIC'
    end
    object qry_previsao_adicao_IN_SUSPENDE_PIS_COFINS_RETIFIC: TBooleanField
      FieldName = 'IN_SUSPENDE_PIS_COFINS_RETIFIC'
      Origin = 'DBBROKER.TPREVISAO_ADICAO.IN_SUSPENDE_PIS_COFINS_RETIFIC'
    end
    object qry_previsao_adicao_CD_PAIS_FABRICANTE: TStringField
      FieldName = 'CD_PAIS_FABRICANTE'
      Origin = 'DBBROKER.TPREVISAO_ADICAO.NR_PROCESSO'
      FixedChar = True
      Size = 3
    end
    object qry_previsao_adicao_PC_NORMAL_ANTIDUMPING: TFloatField
      FieldName = 'PC_NORMAL_ANTIDUMPING'
      Origin = 'DBBROKER.TPREVISAO_ADICAO.PC_NORMAL_ANTIDUMPING'
    end
    object qry_previsao_adicao_VL_BASE_CALC_ANTIDUMPING: TFloatField
      FieldName = 'VL_BASE_CALC_ANTIDUMPING'
      Origin = 'DBBROKER.TPREVISAO_ADICAO.VL_BASE_CALC_ANTIDUMPING'
    end
    object qry_previsao_adicao_PC_ESPEC_ANTIDUMPING: TFloatField
      FieldName = 'PC_ESPEC_ANTIDUMPING'
      Origin = 'DBBROKER.TPREVISAO_ADICAO.PC_ESPEC_ANTIDUMPING'
    end
    object qry_previsao_adicao_NM_UNID_ESPEC_ANTIDUMPING: TStringField
      FieldName = 'NM_UNID_ESPEC_ANTIDUMPING'
      Origin = 'DBBROKER.TPREVISAO_ADICAO.NM_UNID_ESPEC_ANTIDUMPING'
      FixedChar = True
      Size = 100
    end
    object qry_previsao_adicao_QT_UNID_ESPEC_ANTIDUMPING: TFloatField
      FieldName = 'QT_UNID_ESPEC_ANTIDUMPING'
      Origin = 'DBBROKER.TPREVISAO_ADICAO.QT_UNID_ESPEC_ANTIDUMPING'
    end
    object qry_previsao_adicao_VL_BASE_CALC_ICMS_AFRMM: TFloatField
      FieldName = 'VL_BASE_CALC_ICMS_AFRMM'
      Origin = 'DBBROKER.TPREVISAO_ADICAO.VL_BASE_CALC_ICMS_AFRMM'
    end
    object qry_previsao_adicao_VL_ICMS_A_RECOLHER_AFRMM: TFloatField
      FieldName = 'VL_ICMS_A_RECOLHER_AFRMM'
      Origin = 'DBBROKER.TPREVISAO_ADICAO.VL_ICMS_A_RECOLHER_AFRMM'
    end
    object qry_previsao_adicao_CD_ACORDO_ALADI: TStringField
      FieldName = 'CD_ACORDO_ALADI'
      Origin = 'DBBROKER.TPREVISAO_ADICAO.CD_ACORDO_ALADI'
      FixedChar = True
      Size = 3
    end
    object qry_previsao_adicao_VL_ICMS_DEVIDO_AFRMM: TFloatField
      FieldName = 'VL_ICMS_DEVIDO_AFRMM'
      Origin = 'DBBROKER.TPREVISAO_ADICAO.VL_ICMS_DEVIDO_AFRMM'
    end
    object qry_previsao_adicao_ALIQ_PIS_REDUZIDA: TFloatField
      FieldName = 'ALIQ_PIS_REDUZIDA'
      Origin = 'DBBROKER.TPREVISAO_ADICAO.ALIQ_PIS_REDUZIDA'
      DisplayFormat = '#0,.00'
      EditFormat = '#0,.00'
    end
    object qry_previsao_adicao_ALIQ_COFINS_REDUZIDA: TFloatField
      FieldName = 'ALIQ_COFINS_REDUZIDA'
      Origin = 'DBBROKER.TPREVISAO_ADICAO.ALIQ_COFINS_REDUZIDA'
      DisplayFormat = '#0,.00'
      EditFormat = '#0,.00'
    end
  end
  object ds_via_transp: TDataSource
    DataSet = qry_via_transp_
    Left = 259
    Top = 70
  end
  object qry_via_transp_: TQuery
    DatabaseName = 'DBBROKER'
    RequestLive = True
    SQL.Strings = (
      'SELECT * FROM TVIA_TRANSP_BROKER')
    Left = 336
    Top = 70
    object qry_via_transp_CD_VIA_TRANSP: TStringField
      FieldName = 'CD_VIA_TRANSP'
      Origin = 'TVIA_TRANSP_BROKER.CD_VIA_TRANSP'
      Size = 2
    end
    object qry_via_transp_NM_VIA_TRANSP: TStringField
      FieldName = 'NM_VIA_TRANSP'
      Origin = 'TVIA_TRANSP_BROKER.NM_VIA_TRANSP'
    end
  end
  object ds_embalagens: TDataSource
    DataSet = qry_embalagens_
    Left = 259
    Top = 130
  end
  object qry_embalagens_: TQuery
    DatabaseName = 'DBBROKER'
    RequestLive = True
    SQL.Strings = (
      'SELECT * FROM TTP_EMBALAGEM')
    Left = 336
    Top = 130
    object qry_embalagens_Codigo: TStringField
      FieldName = 'Codigo'
      Origin = 'TTP_EMBALAGEM.Codigo'
      Size = 2
    end
    object qry_embalagens_Descricao: TStringField
      FieldName = 'Descricao'
      Origin = 'TTP_EMBALAGEM.Descricao'
      Size = 120
    end
  end
  object ds_empresa_nac: TDataSource
    DataSet = tbl_empresa_nac_
    Left = 43
    Top = 184
  end
  object tbl_empresa_nac_: TTable
    DatabaseName = 'DBBROKER'
    IndexFieldNames = 'CD_EMPRESA'
    ReadOnly = True
    TableName = 'TEMPRESA_NAC'
    Left = 112
    Top = 184
    object tbl_empresa_nac_CD_EMPRESA: TStringField
      DisplayLabel = 'C'#243'digo'
      FieldName = 'CD_EMPRESA'
      Size = 5
    end
    object tbl_empresa_nac_AP_EMPRESA: TStringField
      DisplayLabel = 'Apelido'
      FieldName = 'AP_EMPRESA'
      Size = 10
    end
    object tbl_empresa_nac_NM_EMPRESA: TStringField
      DisplayLabel = 'Raz'#227'o Social'
      FieldName = 'NM_EMPRESA'
      Size = 50
    end
    object tbl_empresa_nac_END_EMPRESA: TStringField
      DisplayLabel = 'Endere'#231'o'
      FieldName = 'END_EMPRESA'
      Size = 50
    end
    object tbl_empresa_nac_END_NUMERO: TStringField
      DisplayLabel = 'N'#250'mero'
      FieldName = 'END_NUMERO'
      Size = 6
    end
    object tbl_empresa_nac_END_CIDADE: TStringField
      DisplayLabel = 'Cidade'
      FieldName = 'END_CIDADE'
      Size = 30
    end
    object tbl_empresa_nac_END_BAIRRO: TStringField
      DisplayLabel = 'Bairro'
      FieldName = 'END_BAIRRO'
      Size = 30
    end
    object tbl_empresa_nac_END_UF: TStringField
      DisplayLabel = 'UF'
      FieldName = 'END_UF'
      Size = 2
    end
    object tbl_empresa_nac_END_CEP: TStringField
      DisplayLabel = 'CEP'
      FieldName = 'END_CEP'
      EditMask = '99999-999;0;_'
      Size = 8
    end
    object tbl_empresa_nac_CD_TIPO_PESSOA: TStringField
      DisplayLabel = 'Tipo de Pessoa'
      FieldName = 'CD_TIPO_PESSOA'
      Size = 1
    end
    object tbl_empresa_nac_CGC_EMPRESA: TStringField
      DisplayLabel = 'CGC'
      FieldName = 'CGC_EMPRESA'
      EditMask = '99.999.999\/9999\-99;0;_'
      Size = 14
    end
    object tbl_empresa_nac_CPF_EMPRESA: TStringField
      DisplayLabel = 'CPF'
      FieldName = 'CPF_EMPRESA'
      EditMask = '999.999.999\-99;0;_'
      Size = 11
    end
    object tbl_empresa_nac_IE_EMPRESA: TStringField
      DisplayLabel = 'Inscr.Estadual'
      FieldName = 'IE_EMPRESA'
    end
    object tbl_empresa_nac_OUTRO_DOC: TStringField
      DisplayLabel = 'Outro Docto.'
      FieldName = 'OUTRO_DOC'
    end
    object tbl_empresa_nac_CD_TIPO_REF: TStringField
      FieldName = 'CD_TIPO_REF'
      Size = 1
    end
    object tbl_empresa_nac_CD_TAB_SDA: TStringField
      FieldName = 'CD_TAB_SDA'
      Size = 3
    end
    object tbl_empresa_nac_DT_INCLUSAO: TDateTimeField
      DisplayLabel = 'Inclus'#227'o'
      FieldName = 'DT_INCLUSAO'
      DisplayFormat = 'dd/mm/yyyy'
      EditMask = '!99/99/0000;1;_'
    end
    object tbl_empresa_nac_IN_FATURAMENTO: TStringField
      FieldName = 'IN_FATURAMENTO'
      Size = 1
    end
    object tbl_empresa_nac_IN_ATIVO: TStringField
      FieldName = 'IN_ATIVO'
      Size = 1
    end
    object tbl_empresa_nac_IN_RESTRICAO: TStringField
      FieldName = 'IN_RESTRICAO'
      Size = 1
    end
    object tbl_empresa_nac_IN_EVENTUAL: TStringField
      FieldName = 'IN_EVENTUAL'
      Size = 1
    end
    object tbl_empresa_nac_IN_CLIENTE: TBooleanField
      FieldName = 'IN_CLIENTE'
    end
    object tbl_empresa_nac_IN_IMPORTADOR: TBooleanField
      FieldName = 'IN_IMPORTADOR'
    end
    object tbl_empresa_nac_IN_EXPORTADOR: TBooleanField
      FieldName = 'IN_EXPORTADOR'
    end
    object tbl_empresa_nac_IN_OUTROS: TBooleanField
      FieldName = 'IN_OUTROS'
    end
    object tbl_empresa_nac_NR_AG_BANCO_IMPOSTOS: TStringField
      DisplayLabel = 'Ag'#234'ncia'
      FieldName = 'NR_AG_BANCO_IMPOSTOS'
      Size = 5
    end
    object tbl_empresa_nac_CD_SDA: TStringField
      FieldName = 'CD_SDA'
      Size = 4
    end
  end
  object qry_unidade_: TQuery
    DatabaseName = 'DBBROKER'
    RequestLive = True
    SQL.Strings = (
      'SELECT * FROM TUNID_NEG'
      'WHERE CD_UNID_NEG = :CD_UNID_NEG')
    Left = 408
    Top = 70
    ParamData = <
      item
        DataType = ftString
        Name = 'CD_UNID_NEG'
        ParamType = ptUnknown
      end>
    object qry_unidade_CD_UNID_NEG: TStringField
      DisplayLabel = 'Codigo'
      FieldName = 'CD_UNID_NEG'
      Origin = 'TUNID_NEG.CD_UNID_NEG'
      Size = 2
    end
    object qry_unidade_AP_UNID_NEG: TStringField
      FieldName = 'AP_UNID_NEG'
      Origin = 'TUNID_NEG.NM_UNID_NEG'
      Size = 10
    end
  end
  object qry_conversao_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT TX_CAMBIO'
      'FROM   TTAXA_CAMBIO'
      'WHERE  CD_MOEDA = :CD_MOEDA AND'
      
        '       :DT_CALCULO BETWEEN DT_INICIO_VIGENCIA AND DT_TERMINO_VIG' +
        'ENCIA')
    Left = 336
    Top = 15
    ParamData = <
      item
        DataType = ftString
        Name = 'CD_MOEDA'
        ParamType = ptUnknown
      end
      item
        DataType = ftDate
        Name = 'DT_CALCULO'
        ParamType = ptUnknown
      end>
    object qry_conversao_TX_CAMBIO: TFloatField
      FieldName = 'TX_CAMBIO'
      Origin = 'TTAXA_CAMBIO.TX_CAMBIO'
    end
  end
  object qry_ncm_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT CODIGO , DESCRICAO , UNIDADE_MEDIDA , '
      ' ALIQUOTA_II , DATA_INICIO_VIG_II , '
      ' DATA_FIM_VIG_II , ALIQUOTA_II_MERCOSUL , '
      ' DATA_INICIO_VIG_II_MSUL , '
      ' DATA_FIM_VIG_II_MSUL , ALIQUOTA_IPI , '
      ' DATA_INICIO_VIG_IPI , DATA_FIM_VIG_IPI'
      'FROM TNCM TNCM '
      'WHERE CODIGO = :CODIGO')
    Left = 112
    Top = 243
    ParamData = <
      item
        DataType = ftString
        Name = 'CODIGO'
        ParamType = ptUnknown
      end>
    object qry_ncm_CODIGO: TStringField
      FieldName = 'CODIGO'
      Origin = 'TNCM.CODIGO'
      Size = 8
    end
    object qry_ncm_DESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Origin = 'TNCM.DESCRICAO'
      Size = 120
    end
    object qry_ncm_UNIDADE_MEDIDA: TStringField
      FieldName = 'UNIDADE_MEDIDA'
      Origin = 'TNCM.UNIDADE_MEDIDA'
      Size = 4
    end
    object qry_ncm_ALIQUOTA_II: TStringField
      FieldName = 'ALIQUOTA_II'
      Origin = 'TNCM.ALIQUOTA_II'
      Size = 6
    end
    object qry_ncm_DATA_INICIO_VIG_II: TStringField
      FieldName = 'DATA_INICIO_VIG_II'
      Origin = 'TNCM.DATA_INICIO_VIG_II'
      Size = 10
    end
    object qry_ncm_DATA_FIM_VIG_II: TStringField
      FieldName = 'DATA_FIM_VIG_II'
      Origin = 'TNCM.DATA_FIM_VIG_II'
      Size = 10
    end
    object qry_ncm_ALIQUOTA_II_MERCOSUL: TStringField
      FieldName = 'ALIQUOTA_II_MERCOSUL'
      Origin = 'TNCM.ALIQUOTA_II_MERCOSUL'
      Size = 6
    end
    object qry_ncm_DATA_INICIO_VIG_II_MSUL: TStringField
      FieldName = 'DATA_INICIO_VIG_II_MSUL'
      Origin = 'TNCM.DATA_INICIO_VIG_II_MSUL'
      Size = 10
    end
    object qry_ncm_DATA_FIM_VIG_II_MSUL: TStringField
      FieldName = 'DATA_FIM_VIG_II_MSUL'
      Origin = 'TNCM.DATA_FIM_VIG_II_MSUL'
      Size = 10
    end
    object qry_ncm_ALIQUOTA_IPI: TStringField
      FieldName = 'ALIQUOTA_IPI'
      Origin = 'TNCM.ALIQUOTA_IPI'
      Size = 6
    end
    object qry_ncm_DATA_INICIO_VIG_IPI: TStringField
      FieldName = 'DATA_INICIO_VIG_IPI'
      Origin = 'TNCM.DATA_INICIO_VIG_IPI'
      Size = 10
    end
    object qry_ncm_DATA_FIM_VIG_IPI: TStringField
      FieldName = 'DATA_FIM_VIG_IPI'
      Origin = 'TNCM.DATA_FIM_VIG_IPI'
      Size = 10
    end
  end
  object ds_ncm: TDataSource
    DataSet = qry_ncm_
    Left = 43
    Top = 243
  end
  object ds_reg_trib: TDataSource
    DataSet = tbl_reg_trib_
    Left = 43
    Top = 299
  end
  object tbl_reg_trib_: TTable
    DatabaseName = 'DBBROKER'
    IndexFieldNames = 'CODIGO'
    TableName = 'TREG_TRIBUTARIO'
    UpdateMode = upWhereKeyOnly
    Left = 112
    Top = 299
  end
  object qry_moeda_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT CODIGO , DESCRICAO'
      'FROM TMOEDA '
      'WHERE CODIGO = :CODIGO')
    Left = 112
    Top = 354
    ParamData = <
      item
        DataType = ftString
        Name = 'CODIGO'
        ParamType = ptUnknown
      end>
    object qry_moeda_CODIGO: TStringField
      FieldName = 'CODIGO'
      Origin = 'TMOEDA.CODIGO'
      Size = 3
    end
    object qry_moeda_DESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Origin = 'TMOEDA.DESCRICAO'
      Size = 120
    end
  end
  object ds_moeda: TDataSource
    DataSet = qry_moeda_
    Left = 43
    Top = 354
  end
  object qry_apaga_prev_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'DELETE TPREVISAO WHERE NR_PROCESSO = :NR_PROCESSO'
      'DELETE TPREVISAO_ADICAO WHERE NR_PROCESSO = :NR_PROCESSO'
      'DELETE TPREVISAO_DESPESA WHERE NR_PROCESSO = :NR_PROCESSO')
    Left = 488
    Top = 17
    ParamData = <
      item
        DataType = ftString
        Name = 'NR_PROCESSO'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'NR_PROCESSO'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'NR_PROCESSO'
        ParamType = ptUnknown
      end>
    object StringField1: TStringField
      FieldName = 'CD_VIA_TRANSPORTE'
      Origin = 'TVIA_TRANSPORTE.CD_VIA_TRANSPORTE'
      Size = 2
    end
    object StringField2: TStringField
      FieldName = 'NM_VIA_TRANSPORTE'
      Origin = 'TVIA_TRANSPORTE.NM_VIA_TRANSPORTE'
    end
  end
  object qry_previsao_despesa_: TQuery
    CachedUpdates = True
    AfterPost = qry_previsao_despesa_AfterPost
    AfterDelete = qry_previsao_despesa_AfterDelete
    DatabaseName = 'DBBROKER'
    DataSource = ds_previsao
    RequestLive = True
    SQL.Strings = (
      'SELECT * FROM TPREVISAO_DESPESA'
      'WHERE NR_PROCESSO = :NR_PROCESSO')
    UpdateMode = upWhereKeyOnly
    UpdateObject = upd_previsao_despesa_
    Left = 112
    Top = 126
    ParamData = <
      item
        DataType = ftString
        Name = 'NR_PROCESSO'
        ParamType = ptUnknown
        Size = 19
      end>
    object qry_previsao_despesa_NR_PROCESSO: TStringField
      FieldName = 'NR_PROCESSO'
      Origin = 'TPREVISAO_DESPESA.NR_PROCESSO'
      Size = 18
    end
    object qry_previsao_despesa_CD_ITEM: TStringField
      FieldName = 'CD_ITEM'
      Origin = 'TPREVISAO_DESPESA.CD_ITEM'
      Size = 3
    end
    object qry_previsao_despesa_VL_DESPESA: TFloatField
      DisplayLabel = 'Valor'
      FieldName = 'VL_DESPESA'
      Origin = 'TPREVISAO_DESPESA.VL_DESPESA'
      DisplayFormat = '#0,.00'
      EditFormat = '#0.00'
    end
    object qry_previsao_despesa_look_nm_item: TStringField
      DisplayLabel = 'Item'
      FieldKind = fkLookup
      FieldName = 'look_nm_item'
      LookupDataSet = qry_item_
      LookupKeyFields = 'CD_ITEM'
      LookupResultField = 'NM_ITEM'
      KeyFields = 'CD_ITEM'
      Size = 30
      Lookup = True
    end
  end
  object qry_item_: TQuery
    DatabaseName = 'DBBROKER'
    RequestLive = True
    SQL.Strings = (
      'SELECT * FROM TITEM')
    Left = 408
    Top = 130
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
      Origin = 'TITEM.CD_TIPO_ITEM'
      Size = 1
    end
    object qry_item_CD_TIPO_LANC_FAT: TStringField
      FieldName = 'CD_TIPO_LANC_FAT'
      Origin = 'TITEM.CD_TIPO_LANC_FAT'
      Size = 1
    end
    object qry_item_IN_ATIVO: TStringField
      FieldName = 'IN_ATIVO'
      Origin = 'TITEM.IN_ATIVO'
      Size = 1
    end
    object qry_item_IN_CPMF: TStringField
      FieldName = 'IN_CPMF'
      Origin = 'TITEM.IN_CPMF'
      Size = 1
    end
    object qry_item_CD_CT_CONTABIL: TStringField
      FieldName = 'CD_CT_CONTABIL'
      Origin = 'TITEM.CD_CT_CONTABIL'
      Size = 10
    end
    object qry_item_CD_CT_CUSTO: TStringField
      FieldName = 'CD_CT_CUSTO'
      Origin = 'TITEM.CD_CT_CUSTO'
      Size = 3
    end
    object qry_item_IN_CONSOLIDA: TStringField
      FieldName = 'IN_CONSOLIDA'
      Origin = 'TITEM.IN_CONSOLIDA'
      Size = 1
    end
    object qry_item_CD_FORMA_RATEIO: TStringField
      FieldName = 'CD_FORMA_RATEIO'
      Origin = 'TITEM.CD_FORMA_RATEIO'
      Size = 1
    end
  end
  object ds_previsao_despesa: TDataSource
    DataSet = qry_previsao_despesa_
    Left = 27
    Top = 118
  end
  object sp_prev_calc: TStoredProc
    DatabaseName = 'DBBROKER'
    StoredProcName = 'dbo.sp_prev_calculo'
    Left = 258
    Top = 17
    ParamData = <
      item
        DataType = ftInteger
        Name = 'Result'
        ParamType = ptResult
        Value = 0
      end
      item
        DataType = ftString
        Name = '@nr_processo'
        ParamType = ptInput
      end>
    object StringField8: TStringField
      FieldName = 'NR_ADICAO'
      Size = 3
    end
    object StringField9: TStringField
      FieldName = 'NR_ITEM'
      Size = 3
    end
  end
  object qry_qt_adicoes_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT COUNT(*) AS QT_ADICOES'
      'FROM TPREVISAO_ADICAO'
      'WHERE NR_PROCESSO = :NR_PROCESSO')
    Left = 408
    Top = 17
    ParamData = <
      item
        DataType = ftString
        Name = 'NR_PROCESSO'
        ParamType = ptUnknown
      end>
    object qry_qt_adicoes_QT_ADICOES: TIntegerField
      FieldName = 'QT_ADICOES'
    end
  end
  object qry_processo_: TQuery
    DatabaseName = 'DBBROKER'
    RequestLive = True
    SQL.Strings = (
      'SELECT NR_PROCESSO, CD_CLIENTE'
      'FROM TPROCESSO'
      'WHERE NR_PROCESSO = :NR_PROCESSO')
    Left = 216
    Top = 210
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
    object qry_processo_CD_CLIENTE: TStringField
      FieldName = 'CD_CLIENTE'
      Origin = 'TPROCESSO.CD_CLIENTE'
      Size = 5
    end
  end
  object qry_tot_pl_: TQuery
    DatabaseName = 'DBBROKER'
    DataSource = ds_previsao_adicao
    SQL.Strings = (
      'SELECT ROUND( ISNULL( SUM(PL_MERCADORIA), 0 ), 5 ) TOT_PL'
      'FROM TPREVISAO_ADICAO'
      'WHERE NR_PROCESSO = :NR_PROCESSO AND'
      '      NR_ADICAO <> :NR_ADICAO'
      '')
    Left = 209
    Top = 310
    ParamData = <
      item
        DataType = ftString
        Name = 'NR_PROCESSO'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'NR_ADICAO'
        ParamType = ptUnknown
      end>
    object qry_tot_pl_TOT_PL: TFloatField
      FieldName = 'TOT_PL'
      Origin = 'TPREVISAO_ADICAO.PL_MERCADORIA'
    end
  end
  object qry_produto_: TQuery
    DatabaseName = 'DBBROKER'
    RequestLive = True
    SQL.Strings = (
      'SELECT CD_PRODUTO, AP_PRODUTO FROM TPRODUTO'
      'WHERE CD_PRODUTO = :CD_PRODUTO')
    Left = 487
    Top = 70
    ParamData = <
      item
        DataType = ftString
        Name = 'CD_PRODUTO'
        ParamType = ptUnknown
      end>
    object qry_produto_CD_PRODUTO: TStringField
      FieldName = 'CD_PRODUTO'
      Origin = 'TPRODUTO.CD_PRODUTO'
      Size = 2
    end
    object qry_produto_AP_PRODUTO: TStringField
      FieldName = 'AP_PRODUTO'
      Origin = 'TPRODUTO.AP_PRODUTO'
      Size = 10
    end
  end
  object qry_ncm_PIS_COFINS: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'select * from TNCM_PIS_COFINS'
      'WHERE NCM = :CODIGO')
    Left = 118
    Top = 410
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'CODIGO'
        ParamType = ptUnknown
      end>
    object qry_ncm_PIS_COFINSNCM: TStringField
      FieldName = 'NCM'
      Origin = 'DBBROKER.TNCM_PIS_COFINS.NCM'
      FixedChar = True
      Size = 8
    end
    object qry_ncm_PIS_COFINSCAPITULO: TStringField
      FieldName = 'CAPITULO'
      Origin = 'DBBROKER.TNCM_PIS_COFINS.CAPITULO'
      FixedChar = True
      Size = 4
    end
    object qry_ncm_PIS_COFINSALIQ_PIS: TFloatField
      FieldName = 'ALIQ_PIS'
      Origin = 'DBBROKER.TNCM_PIS_COFINS.ALIQ_PIS'
    end
    object qry_ncm_PIS_COFINSALIQ_COFINS: TFloatField
      FieldName = 'ALIQ_COFINS'
      Origin = 'DBBROKER.TNCM_PIS_COFINS.ALIQ_COFINS'
    end
    object qry_ncm_PIS_COFINSTX_ARTIGO: TMemoField
      FieldName = 'TX_ARTIGO'
      Origin = 'DBBROKER.TNCM_PIS_COFINS.TX_ARTIGO'
      BlobType = ftMemo
    end
  end
  object ds_ncm_PIS_COFINS: TDataSource
    DataSet = qry_ncm_
    Left = 42
    Top = 411
  end
  object upd_previsao_: TUpdateSQL
    ModifySQL.Strings = (
      'update TPREVISAO'
      'set'
      '  NR_PROCESSO = :NR_PROCESSO,'
      '  CD_CLIENTE = :CD_CLIENTE,'
      '  CD_VIA_TRANSP = :CD_VIA_TRANSP,'
      '  DT_ENTRADA = :DT_ENTRADA,'
      '  CD_MOEDA_MLE = :CD_MOEDA_MLE,'
      '  CD_MOEDA_FRETE = :CD_MOEDA_FRETE,'
      '  CD_MOEDA_SEGURO = :CD_MOEDA_SEGURO,'
      '  VL_MLE_MNEG = :VL_MLE_MNEG,'
      '  VL_MLE_MN = :VL_MLE_MN,'
      '  VL_DESP_MNEG = :VL_DESP_MNEG,'
      '  VL_DESP_MN = :VL_DESP_MN,'
      '  VL_FRETE_MNEG = :VL_FRETE_MNEG,'
      '  VL_FRETE_MN = :VL_FRETE_MN,'
      '  VL_SEGURO_MNEG = :VL_SEGURO_MNEG,'
      '  VL_SEGURO_MN = :VL_SEGURO_MN,'
      '  CD_BASE_SEGURO = :CD_BASE_SEGURO,'
      '  PC_SEGURO = :PC_SEGURO,'
      '  IN_REB = :IN_REB,'
      '  PB_PREVISAO = :PB_PREVISAO,'
      '  PL_PREVISAO = :PL_PREVISAO,'
      '  QT_EMBALAGEM = :QT_EMBALAGEM,'
      '  CD_EMBALAGEM = :CD_EMBALAGEM,'
      '  CD_USUARIO = :CD_USUARIO,'
      '  DT_PREVISAO = :DT_PREVISAO,'
      '  QT_ADICOES = :QT_ADICOES,'
      '  VL_TAXA_MLE = :VL_TAXA_MLE,'
      '  VL_TAXA_FRETE = :VL_TAXA_FRETE,'
      '  VL_TAXA_SEGURO = :VL_TAXA_SEGURO,'
      '  DT_CALCULO = :DT_CALCULO,'
      '  VL_TX_SISCOMEX = :VL_TX_SISCOMEX,'
      '  VL_CIF_MN = :VL_CIF_MN,'
      '  CD_INCOTERM = :CD_INCOTERM,'
      '  IN_EMBUT_FRT_ITENS = :IN_EMBUT_FRT_ITENS,'
      '  IN_EMBUT_SEG_ITENS = :IN_EMBUT_SEG_ITENS,'
      '  VL_ACRESCIMO_MN = :VL_ACRESCIMO_MN,'
      '  VL_DEDUCAO_MN = :VL_DEDUCAO_MN,'
      '  IN_MOEDA_UNICA = :IN_MOEDA_UNICA,'
      '  VL_ACRESCIMO = :VL_ACRESCIMO,'
      '  VL_DEDUCAO = :VL_DEDUCAO,'
      '  VL_FRETE_INTERNO = :VL_FRETE_INTERNO,'
      '  VL_FRETE_TNAC_MNEG = :VL_FRETE_TNAC_MNEG,'
      '  CD_VINC_IMPO_EXPO = :CD_VINC_IMPO_EXPO'
      'where'
      '  NR_PROCESSO = :OLD_NR_PROCESSO')
    InsertSQL.Strings = (
      'insert into TPREVISAO'
      '  (NR_PROCESSO, CD_CLIENTE, CD_VIA_TRANSP, DT_ENTRADA, '
      'CD_MOEDA_MLE, CD_MOEDA_FRETE, '
      '   CD_MOEDA_SEGURO, VL_MLE_MNEG, VL_MLE_MN, VL_DESP_MNEG, '
      'VL_DESP_MN, VL_FRETE_MNEG, '
      '   VL_FRETE_MN, VL_SEGURO_MNEG, VL_SEGURO_MN, CD_BASE_SEGURO, '
      'PC_SEGURO, '
      
        '   IN_REB, PB_PREVISAO, PL_PREVISAO, QT_EMBALAGEM, CD_EMBALAGEM,' +
        ' '
      'CD_USUARIO, '
      '   DT_PREVISAO, QT_ADICOES, VL_TAXA_MLE, VL_TAXA_FRETE, '
      'VL_TAXA_SEGURO, '
      '   DT_CALCULO, VL_TX_SISCOMEX, VL_CIF_MN, CD_INCOTERM, '
      'IN_EMBUT_FRT_ITENS, '
      '   IN_EMBUT_SEG_ITENS, VL_ACRESCIMO_MN, VL_DEDUCAO_MN, '
      'IN_MOEDA_UNICA, '
      
        '   VL_ACRESCIMO, VL_DEDUCAO, VL_FRETE_INTERNO, CD_VINC_IMPO_EXPO' +
        ',  VL_FRETE_TNAC_MNEG)'
      'values'
      '  (:NR_PROCESSO, :CD_CLIENTE, :CD_VIA_TRANSP, :DT_ENTRADA, '
      ':CD_MOEDA_MLE, '
      '   :CD_MOEDA_FRETE, :CD_MOEDA_SEGURO, :VL_MLE_MNEG, :VL_MLE_MN, '
      ':VL_DESP_MNEG, '
      '   :VL_DESP_MN, :VL_FRETE_MNEG, :VL_FRETE_MN, :VL_SEGURO_MNEG, '
      ':VL_SEGURO_MN, '
      
        '   :CD_BASE_SEGURO, :PC_SEGURO, :IN_REB, :PB_PREVISAO, :PL_PREVI' +
        'SAO, '
      ':QT_EMBALAGEM, '
      '   :CD_EMBALAGEM, :CD_USUARIO, :DT_PREVISAO, :QT_ADICOES, '
      ':VL_TAXA_MLE, '
      
        '   :VL_TAXA_FRETE, :VL_TAXA_SEGURO, :DT_CALCULO, :VL_TX_SISCOMEX' +
        ', '
      ':VL_CIF_MN, '
      '   :CD_INCOTERM, :IN_EMBUT_FRT_ITENS, :IN_EMBUT_SEG_ITENS, '
      ':VL_ACRESCIMO_MN, '
      '   :VL_DEDUCAO_MN, :IN_MOEDA_UNICA, :VL_ACRESCIMO, :VL_DEDUCAO, '
      ':VL_FRETE_INTERNO, '
      '   :CD_VINC_IMPO_EXPO,  :VL_FRETE_TNAC_MNEG)'
      ''
      ''
      '')
    DeleteSQL.Strings = (
      'delete from TPREVISAO'
      'where'
      '  NR_PROCESSO = :OLD_NR_PROCESSO')
    Left = 184
    Top = 16
  end
  object upd_previsao_adicao_: TUpdateSQL
    ModifySQL.Strings = (
      'update TPREVISAO_ADICAO'
      'set'
      '  NR_PROCESSO = :NR_PROCESSO,'
      '  NR_ADICAO = :NR_ADICAO,'
      '  CD_NCM_SH = :CD_NCM_SH,'
      '  QUANTIDADE = :QUANTIDADE,'
      '  VL_MLE_MNEG_TOT = :VL_MLE_MNEG_TOT,'
      '  VL_MLE_MNEG_UNIT = :VL_MLE_MNEG_UNIT,'
      '  PC_ALIQ_II = :PC_ALIQ_II,'
      '  PC_ALIQ_IPI = :PC_ALIQ_IPI,'
      '  PC_ALIQ_ICMS = :PC_ALIQ_ICMS,'
      '  PC_ALIQ_ICMS_RED = :PC_ALIQ_ICMS_RED,'
      '  VL_II = :VL_II,'
      '  VL_IPI = :VL_IPI,'
      '  VL_ICMS = :VL_ICMS,'
      '  CD_REG_TRIB_II = :CD_REG_TRIB_II,'
      '  CD_REG_TRIB_IPI = :CD_REG_TRIB_IPI,'
      '  VL_ALIQ_ESPEC_IPT = :VL_ALIQ_ESPEC_IPT,'
      '  QT_MERC_UN_ALIQ_ES = :QT_MERC_UN_ALIQ_ES,'
      '  PC_ALIQ_REDUZIDA_II = :PC_ALIQ_REDUZIDA_II,'
      '  PC_ALIQ_REDUZIDA_IPI = :PC_ALIQ_REDUZIDA_IPI,'
      '  PC_REDUCAO_IPT_BLI = :PC_REDUCAO_IPT_BLI,'
      '  IN_IPI_NAO_TRIBUT = :IN_IPI_NAO_TRIBUT,'
      '  PL_MERCADORIA = :PL_MERCADORIA,'
      '  VL_FRETE = :VL_FRETE,'
      '  VL_SEGURO = :VL_SEGURO,'
      '  VL_MLE = :VL_MLE,'
      '  VL_BASE_CALC_II = :VL_BASE_CALC_II,'
      '  VL_BASE_CALC_IPI = :VL_BASE_CALC_IPI,'
      '  VL_BASE_CALC_ICMS = :VL_BASE_CALC_ICMS,'
      '  VL_DESPESAS = :VL_DESPESAS,'
      '  VL_ACRESCIMO = :VL_ACRESCIMO,'
      '  VL_DEDUCAO = :VL_DEDUCAO,'
      '  PC_ALIQ_ACORDO = :PC_ALIQ_ACORDO,'
      '  CD_MOEDA_MLE = :CD_MOEDA_MLE,'
      '  ALIQ_PIS = :ALIQ_PIS,'
      '  ALIQ_COFINS = :ALIQ_COFINS,'
      '  VL_BASE_PIS = :VL_BASE_PIS,'
      '  VL_PIS = :VL_PIS,'
      '  VL_COFINS = :VL_COFINS,'
      '  PC_REDUCAO_PIS_COFINS = :PC_REDUCAO_PIS_COFINS,'
      '  CD_TRIBUTACAO_ICMS = :CD_TRIBUTACAO_ICMS,'
      '  CD_EXPORTADOR = :CD_EXPORTADOR,'
      '  CD_FABRICANTE = :CD_FABRICANTE,'
      '  CD_FUND_LEGAL_ICMS = :CD_FUND_LEGAL_ICMS,'
      '  CD_PAIS_AQUISICAO = :CD_PAIS_AQUISICAO,'
      '  CD_FUND_LEG_REGIME = :CD_FUND_LEG_REGIME,'
      '  CD_VINC_IMPO_EXPO = :CD_VINC_IMPO_EXPO,'
      '  CD_APLICACAO_MERC = :CD_APLICACAO_MERC,'
      '  CD_INCOTERMS_VENDA = :CD_INCOTERMS_VENDA,'
      '  CD_CFOP = :CD_CFOP,'
      '  CD_TIPO_ACORDO_TAR = :CD_TIPO_ACORDO_TAR,'
      '  CD_TIPO_BENEF_PIS_COFINS = :CD_TIPO_BENEF_PIS_COFINS,'
      '  CD_FUND_LEGAL_PISCOFINS = :CD_FUND_LEGAL_PISCOFINS,'
      '  IN_FUNDO_POBREZA = :IN_FUNDO_POBREZA,'
      '  QT_MESES_ADM_TEMP = :QT_MESES_ADM_TEMP,'
      '  VL_PIS_CALCULADO = :VL_PIS_CALCULADO,'
      '  VL_COFINS_CALCULADO = :VL_COFINS_CALCULADO,'
      '  VL_ALIQUOTA_ESPECIFICA_PIS = :VL_ALIQUOTA_ESPECIFICA_PIS,'
      
        '  VL_ALIQUOTA_ESPECIFICA_COFINS = :VL_ALIQUOTA_ESPECIFICA_COFINS' +
        ','
      '  QTD_UNID_ESPECIFICA_PIS = :QTD_UNID_ESPECIFICA_PIS,'
      '  QTD_UNID_ESPECIFICA_COFINS = :QTD_UNID_ESPECIFICA_COFINS,'
      '  CD_UNIDADE_MEDIDA_PIS = :CD_UNIDADE_MEDIDA_PIS,'
      '  CD_UNIDADE_MEDIDA_COFINS = :CD_UNIDADE_MEDIDA_COFINS,'
      '  IN_SUSPENDE_II_RETIFIC = :IN_SUSPENDE_II_RETIFIC,'
      '  IN_SUSPENDE_IPI_RETIFIC = :IN_SUSPENDE_IPI_RETIFIC,'
      
        '  IN_SUSPENDE_PIS_COFINS_RETIFIC = :IN_SUSPENDE_PIS_COFINS_RETIF' +
        'IC,'
      '  CD_PAIS_FABRICANTE = :CD_PAIS_FABRICANTE,'
      '  PC_NORMAL_ANTIDUMPING = :PC_NORMAL_ANTIDUMPING,'
      '  VL_BASE_CALC_ANTIDUMPING = :VL_BASE_CALC_ANTIDUMPING,'
      '  PC_ESPEC_ANTIDUMPING = :PC_ESPEC_ANTIDUMPING,'
      '  NM_UNID_ESPEC_ANTIDUMPING = :NM_UNID_ESPEC_ANTIDUMPING,'
      '  QT_UNID_ESPEC_ANTIDUMPING = :QT_UNID_ESPEC_ANTIDUMPING,'
      '  VL_BASE_CALC_ICMS_AFRMM = :VL_BASE_CALC_ICMS_AFRMM,'
      '  VL_ICMS_A_RECOLHER_AFRMM = :VL_ICMS_A_RECOLHER_AFRMM,'
      '  VL_ICMS_DEVIDO_AFRMM = :VL_ICMS_DEVIDO_AFRMM,'
      '  CD_ACORDO_ALADI = :CD_ACORDO_ALADI,'
      '  ALIQ_PIS_REDUZIDA = :ALIQ_PIS_REDUZIDA,'
      '  ALIQ_COFINS_REDUZIDA = :ALIQ_COFINS_REDUZIDA'
      'where'
      '  NR_PROCESSO = :OLD_NR_PROCESSO and'
      '  NR_ADICAO = :OLD_NR_ADICAO')
    InsertSQL.Strings = (
      'insert into TPREVISAO_ADICAO'
      
        '  (NR_PROCESSO, NR_ADICAO, CD_NCM_SH, QUANTIDADE, VL_MLE_MNEG_TO' +
        'T, VL_MLE_MNEG_UNIT, '
      
        '   PC_ALIQ_II, PC_ALIQ_IPI, PC_ALIQ_ICMS, PC_ALIQ_ICMS_RED, VL_I' +
        'I, VL_IPI, '
      
        '   VL_ICMS, CD_REG_TRIB_II, CD_REG_TRIB_IPI, VL_ALIQ_ESPEC_IPT, ' +
        'QT_MERC_UN_ALIQ_ES, '
      
        '   PC_ALIQ_REDUZIDA_II, PC_ALIQ_REDUZIDA_IPI, PC_REDUCAO_IPT_BLI' +
        ', IN_IPI_NAO_TRIBUT, '
      
        '   PL_MERCADORIA, VL_FRETE, VL_SEGURO, VL_MLE, VL_BASE_CALC_II, ' +
        'VL_BASE_CALC_IPI, '
      
        '   VL_BASE_CALC_ICMS, VL_DESPESAS, VL_ACRESCIMO, VL_DEDUCAO, PC_' +
        'ALIQ_ACORDO, '
      
        '   CD_MOEDA_MLE, ALIQ_PIS, ALIQ_COFINS, VL_BASE_PIS, VL_PIS, VL_' +
        'COFINS, '
      
        '   PC_REDUCAO_PIS_COFINS, CD_TRIBUTACAO_ICMS, CD_EXPORTADOR, CD_' +
        'FABRICANTE, '
      
        '   CD_FUND_LEGAL_ICMS, CD_PAIS_AQUISICAO, CD_FUND_LEG_REGIME, CD' +
        '_VINC_IMPO_EXPO, '
      
        '   CD_APLICACAO_MERC, CD_INCOTERMS_VENDA, CD_CFOP, CD_TIPO_ACORD' +
        'O_TAR, '
      
        '   CD_TIPO_BENEF_PIS_COFINS, CD_FUND_LEGAL_PISCOFINS, IN_FUNDO_P' +
        'OBREZA, '
      
        '   QT_MESES_ADM_TEMP, VL_PIS_CALCULADO, VL_COFINS_CALCULADO, VL_' +
        'ALIQUOTA_ESPECIFICA_PIS, '
      
        '   VL_ALIQUOTA_ESPECIFICA_COFINS, QTD_UNID_ESPECIFICA_PIS, QTD_U' +
        'NID_ESPECIFICA_COFINS, '
      
        '   CD_UNIDADE_MEDIDA_PIS, CD_UNIDADE_MEDIDA_COFINS, IN_SUSPENDE_' +
        'II_RETIFIC, '
      
        '   IN_SUSPENDE_IPI_RETIFIC, IN_SUSPENDE_PIS_COFINS_RETIFIC, CD_P' +
        'AIS_FABRICANTE, '
      
        '   PC_NORMAL_ANTIDUMPING, VL_BASE_CALC_ANTIDUMPING, PC_ESPEC_ANT' +
        'IDUMPING, '
      
        '   NM_UNID_ESPEC_ANTIDUMPING, QT_UNID_ESPEC_ANTIDUMPING, VL_BASE' +
        '_CALC_ICMS_AFRMM, '
      
        '   VL_ICMS_A_RECOLHER_AFRMM, VL_ICMS_DEVIDO_AFRMM, CD_ACORDO_ALA' +
        'DI, ALIQ_PIS_REDUZIDA, '
      '   ALIQ_COFINS_REDUZIDA)'
      'values'
      
        '  (:NR_PROCESSO, :NR_ADICAO, :CD_NCM_SH, :QUANTIDADE, :VL_MLE_MN' +
        'EG_TOT, '
      
        '   :VL_MLE_MNEG_UNIT, :PC_ALIQ_II, :PC_ALIQ_IPI, :PC_ALIQ_ICMS, ' +
        ':PC_ALIQ_ICMS_RED, '
      
        '   :VL_II, :VL_IPI, :VL_ICMS, :CD_REG_TRIB_II, :CD_REG_TRIB_IPI,' +
        ' :VL_ALIQ_ESPEC_IPT, '
      
        '   :QT_MERC_UN_ALIQ_ES, :PC_ALIQ_REDUZIDA_II, :PC_ALIQ_REDUZIDA_' +
        'IPI, :PC_REDUCAO_IPT_BLI, '
      
        '   :IN_IPI_NAO_TRIBUT, :PL_MERCADORIA, :VL_FRETE, :VL_SEGURO, :V' +
        'L_MLE, '
      
        '   :VL_BASE_CALC_II, :VL_BASE_CALC_IPI, :VL_BASE_CALC_ICMS, :VL_' +
        'DESPESAS, '
      
        '   :VL_ACRESCIMO, :VL_DEDUCAO, :PC_ALIQ_ACORDO, :CD_MOEDA_MLE, :' +
        'ALIQ_PIS, '
      
        '   :ALIQ_COFINS, :VL_BASE_PIS, :VL_PIS, :VL_COFINS, :PC_REDUCAO_' +
        'PIS_COFINS, '
      
        '   :CD_TRIBUTACAO_ICMS, :CD_EXPORTADOR, :CD_FABRICANTE, :CD_FUND' +
        '_LEGAL_ICMS, '
      
        '   :CD_PAIS_AQUISICAO, :CD_FUND_LEG_REGIME, :CD_VINC_IMPO_EXPO, ' +
        ':CD_APLICACAO_MERC, '
      
        '   :CD_INCOTERMS_VENDA, :CD_CFOP, :CD_TIPO_ACORDO_TAR, :CD_TIPO_' +
        'BENEF_PIS_COFINS, '
      
        '   :CD_FUND_LEGAL_PISCOFINS, :IN_FUNDO_POBREZA, :QT_MESES_ADM_TE' +
        'MP, :VL_PIS_CALCULADO, '
      
        '   :VL_COFINS_CALCULADO, :VL_ALIQUOTA_ESPECIFICA_PIS, :VL_ALIQUO' +
        'TA_ESPECIFICA_COFINS, '
      
        '   :QTD_UNID_ESPECIFICA_PIS, :QTD_UNID_ESPECIFICA_COFINS, :CD_UN' +
        'IDADE_MEDIDA_PIS, '
      
        '   :CD_UNIDADE_MEDIDA_COFINS, :IN_SUSPENDE_II_RETIFIC, :IN_SUSPE' +
        'NDE_IPI_RETIFIC, '
      
        '   :IN_SUSPENDE_PIS_COFINS_RETIFIC, :CD_PAIS_FABRICANTE, :PC_NOR' +
        'MAL_ANTIDUMPING, '
      
        '   :VL_BASE_CALC_ANTIDUMPING, :PC_ESPEC_ANTIDUMPING, :NM_UNID_ES' +
        'PEC_ANTIDUMPING, '
      
        '   :QT_UNID_ESPEC_ANTIDUMPING, :VL_BASE_CALC_ICMS_AFRMM, :VL_ICM' +
        'S_A_RECOLHER_AFRMM, '
      
        '   :VL_ICMS_DEVIDO_AFRMM, :CD_ACORDO_ALADI, :ALIQ_PIS_REDUZIDA, ' +
        ':ALIQ_COFINS_REDUZIDA)')
    DeleteSQL.Strings = (
      'delete from TPREVISAO_ADICAO'
      'where'
      '  NR_PROCESSO = :OLD_NR_PROCESSO and'
      '  NR_ADICAO = :OLD_NR_ADICAO')
    Left = 184
    Top = 72
  end
  object upd_previsao_despesa_: TUpdateSQL
    ModifySQL.Strings = (
      'update TPREVISAO_DESPESA'
      'set'
      '  NR_PROCESSO = :NR_PROCESSO,'
      '  CD_ITEM = :CD_ITEM,'
      '  VL_DESPESA = :VL_DESPESA'
      'where'
      '  NR_PROCESSO = :OLD_NR_PROCESSO and'
      '  CD_ITEM = :OLD_CD_ITEM')
    InsertSQL.Strings = (
      'insert into TPREVISAO_DESPESA'
      '  (NR_PROCESSO, CD_ITEM, VL_DESPESA)'
      'values'
      '  (:NR_PROCESSO, :CD_ITEM, :VL_DESPESA)')
    DeleteSQL.Strings = (
      'delete from TPREVISAO_DESPESA'
      'where'
      '  NR_PROCESSO = :OLD_NR_PROCESSO and'
      '  CD_ITEM = :OLD_CD_ITEM')
    Left = 184
    Top = 128
  end
  object tbl_di_volumes_: TTable
    BeforeInsert = tbl_di_volumes_BeforeInsert
    BeforeEdit = tbl_di_volumes_BeforeEdit
    BeforePost = tbl_di_volumes_BeforePost
    AfterPost = tbl_di_volumes_AfterPost
    BeforeDelete = tbl_di_volumes_BeforeDelete
    DatabaseName = 'DBBROKER'
    IndexFieldNames = 'NR_PROCESSO'
    MasterFields = 'NR_PROCESSO'
    MasterSource = ds_previsao
    TableName = 'TPREVISAO_EMBALAGEM_CARGA'
    UpdateMode = upWhereKeyOnly
    Left = 410
    Top = 198
    object tbl_di_volumes_NR_SEQUENCIA: TAutoIncField
      FieldName = 'NR_SEQUENCIA'
    end
    object tbl_di_volumes_NR_PROCESSO: TStringField
      FieldName = 'NR_PROCESSO'
      Size = 18
    end
    object tbl_di_volumes_CD_TIPO_EMBALAGEM: TStringField
      FieldName = 'CD_TIPO_EMBALAGEM'
      Size = 2
    end
    object tbl_di_volumes_QT_VOLUME_CARGA: TStringField
      DisplayLabel = 'Quantidade'
      FieldName = 'QT_VOLUME_CARGA'
      EditMask = '99999;1;_'
      Size = 5
    end
    object tbl_di_volumes_Look_Embalagem: TStringField
      DisplayLabel = 'Embalagem'
      FieldKind = fkLookup
      FieldName = 'Look_Embalagem'
      LookupDataSet = tbl_embalagens_
      LookupKeyFields = 'Codigo'
      LookupResultField = 'Descricao'
      KeyFields = 'CD_TIPO_EMBALAGEM'
      Size = 120
      Lookup = True
    end
  end
  object ds_di_volumes: TDataSource
    DataSet = tbl_di_volumes_
    Left = 326
    Top = 198
  end
  object tbl_embalagens_: TTable
    DatabaseName = 'DBBROKER'
    IndexFieldNames = 'Codigo'
    ReadOnly = True
    TableName = 'TTP_EMBALAGEM'
    UpdateMode = upWhereKeyOnly
    Left = 440
    Top = 270
    object tbl_embalagens_Codigo: TStringField
      FieldName = 'Codigo'
      Size = 2
    end
    object tbl_embalagens_Descricao: TStringField
      FieldName = 'Descricao'
      Size = 120
    end
  end
  object dts_embalagens: TDataSource
    DataSet = tbl_embalagens_
    Left = 290
    Top = 262
  end
  object qry_fund_leg_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT Codigo , Descricao , Reg_Tribut_1 , '
      ' Reg_Tribut_2 , Reg_Tribut_3 , '
      ' Reg_Tribut_4'
      'FROM TFUND_LEG_REG_TRIBUT TFUND_LEG_REG_TRIBUT'
      'WHERE Codigo = :CODIGO')
    UpdateMode = upWhereChanged
    Left = 340
    Top = 399
    ParamData = <
      item
        DataType = ftString
        Name = 'CODIGO'
        ParamType = ptUnknown
      end>
    object qry_fund_leg_Codigo: TStringField
      FieldName = 'Codigo'
      Origin = 'TFUND_LEG_REG_TRIBUT.Codigo'
      Size = 2
    end
    object qry_fund_leg_Descricao: TStringField
      FieldName = 'Descricao'
      Origin = 'TFUND_LEG_REG_TRIBUT.Descricao'
      Size = 120
    end
    object qry_fund_leg_Reg_Tribut_1: TStringField
      FieldName = 'Reg_Tribut_1'
      Origin = 'TFUND_LEG_REG_TRIBUT.Reg_Tribut_1'
      Size = 1
    end
    object qry_fund_leg_Reg_Tribut_2: TStringField
      FieldName = 'Reg_Tribut_2'
      Origin = 'TFUND_LEG_REG_TRIBUT.Reg_Tribut_2'
      Size = 1
    end
    object qry_fund_leg_Reg_Tribut_3: TStringField
      FieldName = 'Reg_Tribut_3'
      Origin = 'TFUND_LEG_REG_TRIBUT.Reg_Tribut_3'
      Size = 1
    end
    object qry_fund_leg_Reg_Tribut_4: TStringField
      FieldName = 'Reg_Tribut_4'
      Origin = 'TFUND_LEG_REG_TRIBUT.Reg_Tribut_4'
      Size = 1
    end
  end
  object ds_fund_leg: TDataSource
    DataSet = qry_fund_leg_
    Left = 248
    Top = 399
  end
  object tbl_tp_vinc_expo_impo_: TTable
    DatabaseName = 'DBBROKER'
    IndexFieldNames = 'CD_VINC_EXPO_IMPO'
    ReadOnly = True
    TableName = 'TTP_VINC_EXPO_IMPO'
    UpdateMode = upWhereKeyOnly
    Left = 359
    Top = 321
    object tbl_tp_vinc_expo_impo_CD_VINC_EXPO_IMPO: TStringField
      FieldName = 'CD_VINC_EXPO_IMPO'
      Required = True
      Size = 1
    end
    object tbl_tp_vinc_expo_impo_DESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Size = 50
    end
  end
  object ds_tp_vinc_expo_impo: TDataSource
    DataSet = tbl_tp_vinc_expo_impo_
    Left = 287
    Top = 321
  end
  object ds_acordo_tarif: TDataSource
    DataSet = tbl_acordo_tarif_
    Left = 488
    Top = 282
  end
  object tbl_acordo_tarif_: TTable
    DatabaseName = 'DBBROKER'
    IndexFieldNames = 'CD_TIPO_ACORDO_TAR'
    ReadOnly = True
    TableName = 'TTP_ACORDO_TARIF'
    UpdateMode = upWhereChanged
    Left = 492
    Top = 330
    object tbl_acordo_tarif_CD_TIPO_ACORDO_TAR: TStringField
      FieldName = 'CD_TIPO_ACORDO_TAR'
      Required = True
      Size = 1
    end
    object tbl_acordo_tarif_DESCRICAO: TStringField
      FieldName = 'DESCRICAO'
    end
  end
  object SP_CALCULO_SEGURO_PREVISAO: TStoredProc
    DatabaseName = 'DBBROKER'
    StoredProcName = 'dbo.SP_CALCULO_SEGURO_PREVISAO'
    Left = 112
    Top = 488
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
      end
      item
        DataType = ftFloat
        Name = '@VL_SEGURO_MN'
        ParamType = ptInputOutput
      end
      item
        DataType = ftFloat
        Name = '@VL_SEGURO_MNEG'
        ParamType = ptInputOutput
      end
      item
        DataType = ftString
        Name = '@CD_TIPO_BASE_SEGURO'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = '@PC_SEGURO_MLE'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = '@CD_MOEDA_MLE'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = '@CD_MOEDA_FRETE'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = '@CD_MOEDA_SEGURO'
        ParamType = ptInputOutput
      end
      item
        DataType = ftString
        Name = '@IN_MOEDA_UNICA'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = '@IN_EMBUT_FRT_ITENS'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = '@VL_TOTAL_MLE_MN'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = '@VL_TOT_MLE_MNEG'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = '@VL_TOT_DESPS_MN'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = '@VL_TOT_DESPS_MNEG'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = '@VL_TOTAL_FRETE_MN'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = '@VL_TOTAL_FRETE_MNEG'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = '@VL_FRETE_TNAC_MNEG'
        ParamType = ptInput
      end>
  end
  object qryPreencheEvento: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'UPDATE TFOLLOWUP '
      'SET'
      
        'DT_REALIZACAO = CONVERT(DATE,CONVERT(CHAR(10),GETDATE(),105), 10' +
        '3), '
      'CD_RESP_REALIZACAO = :CD_USUARIO, '
      'DT_REALIZACAO_EFETIVA = GETDATE()  '
      'WHERE CD_EVENTO = '#39'963'#39' AND  '
      'NR_PROCESSO = :NR_PROCESSO')
    Left = 352
    Top = 480
    ParamData = <
      item
        DataType = ftString
        Name = 'CD_USUARIO'
        ParamType = ptInput
        Size = 4
      end
      item
        DataType = ftString
        Name = 'NR_PROCESSO'
        ParamType = ptInput
        Size = 16
      end>
  end
end
