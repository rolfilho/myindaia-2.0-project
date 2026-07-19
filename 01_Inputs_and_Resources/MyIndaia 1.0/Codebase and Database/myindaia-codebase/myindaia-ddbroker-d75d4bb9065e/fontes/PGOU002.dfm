object datm_nf_broker_sap: Tdatm_nf_broker_sap
  Left = 1
  Top = 121
  Height = 269
  Width = 867
  object qry_di_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT '#9'NR_PROCESSO,'
      '        NR_DECLARACAO_IMP,'
      '('
      '        SELECT CD_REFERENCIA NR_REF_CLI'
      '        FROM TREF_CLIENTE R'
      '        WHERE R.NR_PROCESSO = D.NR_PROCESSO AND'
      '              R.NR_SEQUENCIA = '#39'01'#39
      ')       NR_REF_CLI,'
      '        CD_IMPORTADOR,'
      '        CD_VIA_TRANSP_CARG,'
      '        DT_CHEGADA_CARGA,'
      '        ISNULL(PL_CARGA, 0) PL_CARGA,'
      '        ISNULL(PB_CARGA, 0) PB_CARGA,'
      '        ISNULL(VL_TOTAL_II, 0) VL_TOTAL_II,'
      '        ISNULL(VL_TOTAL_IPI, 0) VL_TOTAL_IPI,'
      '        DT_REGISTRO_DI,'
      '        ISNULL(VL_TOT_MLE_MNEG, 0) VL_TOT_MLE_MNEG,'
      '('
      '        ISNULL(VL_TOT_FRT_PREPAID, 0) +'
      '        ISNULL(VL_TOT_FRT_COLLECT, 0) -'
      '        ISNULL(VL_FRETE_TNAC_MNEG, 0)'
      ')       VL_TOT_FRT_MNEG,'
      '        ISNULL(VL_TOT_SEGURO_MNEG, 0) VL_TOT_SEGURO_MNEG,'
      '('
      '        ISNULL(VL_TOTAL_MLE_MN, 0) +'
      '        ISNULL(VL_TOT_DESPS_MN, 0) +'
      '        ISNULL(VL_TOTAL_ACRESCIMOS_MN, 0) -'
      '        ISNULL(VL_TOTAL_DEDUCOES_MN, 0) +'
      '        ISNULL(VL_TOTAL_FRETE_MN, 0) +'
      '        ISNULL(VL_TOTAL_SEG_MN, 0)'
      ')       VL_TOTAL_CIF_MN,'
      '        ISNULL(VL_TOTAL_MLE_MN, 0) VL_TOTAL_MLE_MN,'
      '        ISNULL(VL_TOTAL_FRETE_MN, 0) VL_TOTAL_FRETE_MN,'
      '        ISNULL(VL_TOTAL_SEG_MN, 0) VL_TOTAL_SEG_MN,'
      
        '        ISNULL(VL_TOTAL_ACRESCIMOS_MN, 0) VL_TOTAL_ACRESCIMOS_MN' +
        ','
      '        ISNULL(VL_TOT_ICMS, 0) VL_TOT_ICMS,'
      '('
      '        SELECT SUM(ISNULL(VL_ICMS_CALCULADO, 0))'
      '        FROM TADICAO_DE_IMPORTACAO A'
      '        WHERE A.NR_PROCESSO = D.NR_PROCESSO'
      ')       VL_TOT_ICMS_CALCULADO,'
      '('
      '        CASE PC_SEGURO_MLE'
      '          WHEN 0 THEN '#39'V'#39
      '          ELSE '#39'P'#39
      '        END'
      ')       TIPO_SEGURO,'
      '        ISNULL(PC_SEGURO_MLE, 0) PC_SEGURO_MLE,'
      '        ISNULL(VL_TOT_FRT_PREPAID, 0) VL_TOT_FRT_PREPAID,'
      '        ISNULL(VL_TOT_FRT_COLLECT, 0) VL_TOT_FRT_COLLECT,'
      '        ISNULL(VL_FRETE_TNAC_MNEG, 0) VL_FRETE_TNAC_MNEG,'
      '('
      '        '#39'1'#39
      ')       FLAG_STATUS_DI,'
      '        CD_TIPO_BASE_SEGURO FLAG_TIPO_SEGURO,'
      '        ISNULL(VL_TOTAL_DEDUCOES_MN, 0) VL_TOTAL_DEDUCOES_MN,'
      '        QT_ADICOES,'
      '('
      '        ISNULL(VL_TOTAL_ACRESCIMOS_MN, 0) /'
      '        ISNULL(TX_MLE, 1)'
      ')       VL_TOTAL_ACRESCIMOS_MNEG'
      'FROM TDECLARACAO_IMPORTACAO D'
      'WHERE D.NR_PROCESSO = :NR_PROCESSO'
      '')
    Params.Data = {010001000B4E525F50524F434553534F0001020030000000}
    Left = 264
    Top = 48
    object qry_di_CD_IMPORTADOR: TStringField
      FieldName = 'CD_IMPORTADOR'
      Size = 5
    end
    object qry_di_CD_VIA_TRANSP_CARG: TStringField
      FieldName = 'CD_VIA_TRANSP_CARG'
      Size = 2
    end
    object qry_di_DT_CHEGADA_CARGA: TStringField
      FieldName = 'DT_CHEGADA_CARGA'
      Size = 8
    end
    object qry_di_PL_CARGA: TFloatField
      FieldName = 'PL_CARGA'
    end
    object qry_di_PB_CARGA: TFloatField
      FieldName = 'PB_CARGA'
    end
    object qry_di_VL_TOTAL_II: TFloatField
      FieldName = 'VL_TOTAL_II'
    end
    object qry_di_VL_TOTAL_IPI: TFloatField
      FieldName = 'VL_TOTAL_IPI'
    end
    object qry_di_NR_DECLARACAO_IMP: TStringField
      FieldName = 'NR_DECLARACAO_IMP'
      Size = 10
    end
    object qry_di_DT_REGISTRO_DI: TStringField
      FieldName = 'DT_REGISTRO_DI'
      Size = 8
    end
    object qry_di_VL_TOT_MLE_MNEG: TFloatField
      FieldName = 'VL_TOT_MLE_MNEG'
    end
    object qry_di_VL_TOT_FRT_MNEG: TFloatField
      FieldName = 'VL_TOT_FRT_MNEG'
    end
    object qry_di_VL_TOT_SEGURO_MNEG: TFloatField
      FieldName = 'VL_TOT_SEGURO_MNEG'
    end
    object qry_di_VL_TOTAL_CIF_MN: TFloatField
      FieldName = 'VL_TOTAL_CIF_MN'
    end
    object qry_di_VL_TOTAL_MLE_MN: TFloatField
      FieldName = 'VL_TOTAL_MLE_MN'
    end
    object qry_di_VL_TOTAL_FRETE_MN: TFloatField
      FieldName = 'VL_TOTAL_FRETE_MN'
    end
    object qry_di_VL_TOTAL_SEG_MN: TFloatField
      FieldName = 'VL_TOTAL_SEG_MN'
    end
    object qry_di_VL_TOTAL_ACRESCIMOS_MN: TFloatField
      FieldName = 'VL_TOTAL_ACRESCIMOS_MN'
    end
    object qry_di_VL_TOT_ICMS: TFloatField
      FieldName = 'VL_TOT_ICMS'
    end
    object qry_di_VL_TOT_ICMS_CALCULADO: TFloatField
      FieldName = 'VL_TOT_ICMS_CALCULADO'
    end
    object qry_di_TIPO_SEGURO: TStringField
      FieldName = 'TIPO_SEGURO'
      Size = 1
    end
    object qry_di_PC_SEGURO_MLE: TFloatField
      FieldName = 'PC_SEGURO_MLE'
    end
    object qry_di_VL_TOT_FRT_PREPAID: TFloatField
      FieldName = 'VL_TOT_FRT_PREPAID'
    end
    object qry_di_VL_TOT_FRT_COLLECT: TFloatField
      FieldName = 'VL_TOT_FRT_COLLECT'
    end
    object qry_di_VL_FRETE_TNAC_MNEG: TFloatField
      FieldName = 'VL_FRETE_TNAC_MNEG'
    end
    object qry_di_FLAG_STATUS_DI: TStringField
      FieldName = 'FLAG_STATUS_DI'
      Size = 1
    end
    object qry_di_FLAG_TIPO_SEGURO: TStringField
      FieldName = 'FLAG_TIPO_SEGURO'
      Size = 1
    end
    object qry_di_VL_TOTAL_DEDUCOES_MN: TFloatField
      FieldName = 'VL_TOTAL_DEDUCOES_MN'
    end
    object qry_di_QT_ADICOES: TIntegerField
      FieldName = 'QT_ADICOES'
    end
    object qry_di_VL_TOTAL_ACRESCIMOS_MNEG: TFloatField
      FieldName = 'VL_TOTAL_ACRESCIMOS_MNEG'
    end
    object qry_di_NR_PROCESSO: TStringField
      FieldName = 'NR_PROCESSO'
      Size = 18
    end
    object qry_di_NR_REF_CLI: TStringField
      FieldName = 'NR_REF_CLI'
      Size = 15
    end
  end
  object AConfiguracao: TAdsSettings
    DateFormat = 'DD/MM/CCYY'
    NumDecimals = 2
    ShowDeleted = False
    AdsServerTypes = [stADS_REMOTE, stADS_LOCAL]
    Left = 632
    Top = 56
  end
  object AConexao: TAdsConnection
    IsConnected = True
    ConnectPath = 'c:\giplite\dados'
    Left = 680
    Top = 56
  end
  object qry_servico_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT CD_SERVICO, NM_SERVICO, CD_VIA_TRANSPORTE'
      'FROM TSERVICO')
    Left = 464
    Top = 52
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
    object qry_servico_CD_VIA_TRANSPORTE: TStringField
      FieldName = 'CD_VIA_TRANSPORTE'
      Origin = 'TSERVICO.CD_VIA_TRANSPORTE'
      Size = 2
    end
  end
  object qry_proc_emb_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT P.NR_PROCESSO, P.CD_SERVICO, E.NM_EMBARCACAO, P.NR_VOO'
      'FROM TPROCESSO P, TEMBARCACAO E'
      'WHERE P.CD_EMBARCACAO = E.CD_EMBARCACAO AND'
      #9'P.NR_PROCESSO = :NR_PROCESSO')
    Params.Data = {010001000B4E525F50524F434553534F0001020030000000}
    Left = 360
    Top = 50
    object qry_proc_emb_NR_PROCESSO: TStringField
      FieldName = 'NR_PROCESSO'
      Origin = 'TPROCESSO.NR_PROCESSO'
      Size = 18
    end
    object qry_proc_emb_NM_EMBARCACAO: TStringField
      FieldName = 'NM_EMBARCACAO'
      Origin = 'TEMBARCACAO.NM_EMBARCACAO'
      Size = 40
    end
    object qry_proc_emb_NR_VOO: TStringField
      FieldName = 'NR_VOO'
      Origin = 'TPROCESSO.NR_PROCESSO'
      Size = 18
    end
    object qry_proc_emb_CD_SERVICO: TStringField
      FieldName = 'CD_SERVICO'
      Origin = 'TPROCESSO.NR_PROCESSO'
      Size = 3
    end
    object qry_proc_emb_LookViaTransp: TStringField
      FieldName = 'LookViaTransp'
      LookupDataSet = qry_servico_
      LookupKeyFields = 'CD_SERVICO'
      LookupResultField = 'CD_VIA_TRANSPORTE'
      KeyFields = 'CD_SERVICO'
      Size = 2
      Lookup = True
    end
  end
  object Atbl_Importador: TAdsTable
    DatabaseName = 'd:\ddbroker\gip-lite\dados'
    Filtered = True
    IndexName = 'Agi01cd'
    Version = '2.50 (ACE 2.50)'
    AdsConnection = AConexao
    AdsTableOptions.AdsFilterOptions = RESPECT_WHEN_COUNTING
    IndexFiles.Strings = (
      'Agi01cd.ntx'
      'Agi01cf.ntx'
      'Agi01cg.ntx'
      'Agi01cp.ntx'
      'Agi01nm.ntx')
    TableName = 'AGI001.DBF'
    TableType = ttAdsNTX
    Left = 112
    Top = 48
  end
  object Atbl_Unidade: TAdsTable
    DatabaseName = 'd:\ddbroker\gip-lite\dados'
    Filtered = True
    IndexName = 'Agi21cd'
    Version = '2.50 (ACE 2.50)'
    AdsConnection = AConexao
    AdsTableOptions.AdsFilterOptions = RESPECT_WHEN_COUNTING
    IndexFiles.Strings = (
      'Agi21cd.ntx'
      'Agi21nm.ntx'
      'Agi21si.ntx')
    TableName = 'AGI021.DBF'
    TableType = ttAdsNTX
    Left = 200
    Top = 104
  end
  object Atbl_NF: TAdsTable
    DatabaseName = 'd:\ddbroker\gip-lite\dados'
    Filtered = True
    IndexName = 'Anc14pr'
    Version = '2.50 (ACE 2.50)'
    AdsConnection = AConexao
    AdsTableOptions.AdsFilterOptions = RESPECT_WHEN_COUNTING
    IndexFiles.Strings = (
      'Anc14pr.ntx')
    TableName = 'ANC014.DBF'
    TableType = ttAdsNTX
    Left = 32
    Top = 48
    object Atbl_NFCA1401: TStringField
      DisplayLabel = 'Nº Processo'
      FieldName = 'CA1401'
      Size = 15
    end
    object Atbl_NFCA1402: TStringField
      FieldName = 'CA1402'
      Size = 60
    end
    object Atbl_NFCD1404: TDateField
      DisplayLabel = 'Dt. Notas Fiscais'
      FieldName = 'CD1404'
    end
    object Atbl_NFCA1427: TStringField
      FieldName = 'CA1427'
      Size = 4
    end
    object Atbl_NFCN1415: TFloatField
      FieldName = 'CN1415'
    end
    object Atbl_NFCN1416: TFloatField
      FieldName = 'CN1416'
    end
  end
  object ds_lista: TDataSource
    DataSet = Atbl_NF
    Left = 32
    Top = 104
  end
  object qry_cliente_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT CD_EMPRESA, NM_EMPRESA, AP_EMPRESA'
      'FROM TEMPRESA_NAC'
      'WHERE CD_EMPRESA = :CD_CLIENTE')
    Params.Data = {010001000A43445F434C49454E54450001020030000000}
    Left = 541
    Top = 52
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
  object qry_proc_transp_: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT P.NR_PROCESSO, P.CD_TRANSP_NAC, T.NM_TRANSP_ROD'
      'FROM   TPROCESSO P, TTRANSP_ROD T'
      'WHERE  P.CD_TRANSP_NAC = T.CD_TRANSP_ROD AND'
      #9'P.NR_PROCESSO = :NR_PROCESSO')
    Params.Data = {010001000B4E525F50524F434553534F0001020030000000}
    Left = 360
    Top = 107
    object qry_proc_transp_NR_PROCESSO: TStringField
      FieldName = 'NR_PROCESSO'
      Origin = 'TPROCESSO.NR_PROCESSO'
      Size = 18
    end
    object qry_proc_transp_CD_TRANSP_NAC: TStringField
      FieldName = 'CD_TRANSP_NAC'
      Origin = 'TPROCESSO.CD_TRANSP_NAC'
      Size = 4
    end
    object qry_proc_transp_NM_TRANSP_ROD: TStringField
      FieldName = 'NM_TRANSP_ROD'
      Origin = 'TTRANSP_ROD.NM_TRANSP_ROD'
      Size = 60
    end
  end
  object ATbl_NF_Item: TAdsTable
    DatabaseName = 'd:\ddbroker\gip-lite\dados'
    Filtered = True
    IndexName = 'Anc15pr'
    Version = '2.50 (ACE 2.50)'
    AdsConnection = AConexao
    AdsTableOptions.AdsFilterOptions = RESPECT_WHEN_COUNTING
    IndexFiles.Strings = (
      'Anc15cp.ntx'
      'Anc15fa.ntx'
      'Anc15fn.ntx'
      'Anc15ft.ntx'
      'Anc15it.ntx'
      'Anc15nf.ntx'
      'Anc15op.ntx'
      'Anc15pd.ntx'
      'Anc15pr.ntx')
    TableName = 'ANC015.DBF'
    TableType = ttAdsNTX
    Left = 200
    Top = 48
  end
  object db_broker: TDatabase
    AliasName = 'BROKER'
    DatabaseName = 'DBBROKER'
    LoginPrompt = False
    Params.Strings = (
      'USER NAME=SA'
      'PASSWORD=123')
    SessionName = 'Default'
    Left = 538
    Top = 116
  end
end
