object datm_co_novoex: Tdatm_co_novoex
  OldCreateOrder = False
  Left = 480
  Top = 200
  Height = 283
  Width = 352
  object dsREsNovoEx: TDataSource
    DataSet = qryREsNovoEx
    Left = 29
    Top = 137
  end
  object qryREsNovoEx: TQuery
    CachedUpdates = True
    AfterPost = qryREsNovoExAfterPost
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      
        'SELECT DISTINCT R.NR_RE, E.NM_EMPRESA, E.CGC_EMPRESA, EE.NM_EMPR' +
        'ESA NM_EMPRESA2, R.IN_RE_CO, R.NR_NCM, R.TX_ENQUADRAMENTO, SUM(R' +
        '.VL_COND_VENDA) VL_COND_VENDA,'
      
        'SUM(R.VL_LOCAL_EMB) VL_LOCAL_EMB, SUM(R.QT_UNID_COMERC) QT_UNID_' +
        'COMERC, R.TX_UNID_COMERC,'
      
        'SUM(R.QT_UNID_ESTAT) QT_UNID_ESTAT, R.TX_UNID_ESTAT, SUM(R.QT_PE' +
        'SO_LIQ) QT_PESO_LIQ, R.CD_USUARIO_CO'
      'FROM TPROCESSO_RE_ITENS_NOVOEX R'
      '  INNER JOIN TPROCESSO P ON P.NR_PROCESSO = R.NR_PROCESSO'
      '  INNER JOIN TEMPRESA_NAC E ON E.CD_EMPRESA = P.CD_CLIENTE'
      '  INNER JOIN TEMPRESA_EST EE ON EE.CD_EMPRESA = P.CD_IMPORTADOR'
      
        'GROUP BY R.NR_RE, R.IN_RE_CO, R.NR_NCM, R.TX_ENQUADRAMENTO, R.TX' +
        '_UNID_COMERC, R.TX_UNID_ESTAT, '
      'E.NM_EMPRESA, E.CGC_EMPRESA, EE.NM_EMPRESA, R.CD_USUARIO_CO')
    UpdateObject = updREsNovoEx
    Left = 27
    Top = 16
    object qryREsNovoExNR_RE: TStringField
      FieldName = 'NR_RE'
      EditMask = '00/0000000-000;0;_'
      FixedChar = True
      Size = 12
    end
    object qryREsNovoExIN_RE_CO: TBooleanField
      FieldName = 'IN_RE_CO'
    end
    object qryREsNovoExNR_NCM: TStringField
      FieldName = 'NR_NCM'
      EditMask = '0000.00.00-00;0;_'
      FixedChar = True
      Size = 11
    end
    object qryREsNovoExTX_ENQUADRAMENTO: TMemoField
      FieldName = 'TX_ENQUADRAMENTO'
      BlobType = ftMemo
    end
    object qryREsNovoExVL_COND_VENDA: TFloatField
      FieldName = 'VL_COND_VENDA'
      DisplayFormat = '0.,00'
    end
    object qryREsNovoExVL_LOCAL_EMB: TFloatField
      FieldName = 'VL_LOCAL_EMB'
      DisplayFormat = '0.,00'
    end
    object qryREsNovoExQT_UNID_COMERC: TFloatField
      FieldName = 'QT_UNID_COMERC'
      EditFormat = '0.,000'
    end
    object qryREsNovoExTX_UNID_COMERC: TMemoField
      FieldName = 'TX_UNID_COMERC'
      BlobType = ftMemo
    end
    object qryREsNovoExQT_UNID_ESTAT: TFloatField
      FieldName = 'QT_UNID_ESTAT'
      EditFormat = '0.,000'
    end
    object qryREsNovoExTX_UNID_ESTAT: TMemoField
      FieldName = 'TX_UNID_ESTAT'
      BlobType = ftMemo
    end
    object qryREsNovoExQT_PESO_LIQ: TFloatField
      FieldName = 'QT_PESO_LIQ'
      EditFormat = '0.,00000'
    end
    object qryREsNovoExCGC_EMPRESA: TStringField
      FieldName = 'CGC_EMPRESA'
      EditMask = '00.000.000/0000-00;0;_'
      FixedChar = True
      Size = 14
    end
    object qryREsNovoExNM_EMPRESA: TStringField
      FieldName = 'NM_EMPRESA'
      FixedChar = True
      Size = 80
    end
    object qryREsNovoExCD_USUARIO_CO: TStringField
      FieldName = 'CD_USUARIO_CO'
      FixedChar = True
      Size = 4
    end
    object qryREsNovoExNM_EMPRESA2: TStringField
      FieldName = 'NM_EMPRESA2'
      FixedChar = True
      Size = 100
    end
  end
  object updREsNovoEx: TUpdateSQL
    ModifySQL.Strings = (
      'update TPROCESSO_RE_ITENS_NOVOEX'
      'set'
      '  IN_RE_CO = :IN_RE_CO,'
      '  CD_USUARIO_CO = :CD_USUARIO_CO'
      'where'
      '  NR_RE = :OLD_NR_RE'
      ' AND NR_ITEM = 1')
    InsertSQL.Strings = (
      'insert into TPROCESSO_RE_ITENS_NOVOEX'
      '  (IN_RE_CO, CD_USUARIO_CO)'
      'values'
      '  (:IN_RE_CO, :CD_USUARIO_CO)')
    DeleteSQL.Strings = (
      'delete from TPROCESSO_RE_ITENS_NOVOEX'
      'where'
      '  NR_RE = :OLD_NR_RE')
    Left = 29
    Top = 72
  end
  object qryREsCOCapa: TQuery
    Active = True
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      
        'SELECT TOP 1 E.NM_EMPRESA '#39'EXP1'#39', E.END_EMPRESA '#39'EXP2'#39', RTRIM(E.' +
        'END_CIDADE) + '#39'/'#39' + RTRIM(E.END_UF) + '#39'/BRASIL'#39' '#39'EXP3'#39','
      
        '  EE.NM_EMPRESA '#39'IMP1'#39', EE.END_EMPRESA '#39'IMP2'#39', RTRIM(EE.END_CIDA' +
        'DE) + '#39'/'#39' + PB.NM_PAIS '#39'IMP3'#39','
      '  EE2.NM_EMPRESA '#39'CONS1'#39', '#39#39' '#39'CONS2'#39', PB2.NM_PAIS '#39'CONS3'#39','
      
        '  LE.DESCRICAO '#39'PORTO'#39', UPPER(VT.NM_VIA_TRANSP) '#39'MODAL'#39', PB3.NM_' +
        'PAIS '#39'DESTINO'#39','
      
        '  (SELECT TOP 1 RC.CD_REFERENCIA FROM TREF_CLIENTE RC WHERE RC.N' +
        'R_PROCESSO = P.NR_PROCESSO AND RC.TP_REFERENCIA = '#39'01'#39' ORDER BY ' +
        'RC.CD_REFERENCIA) '#39'FATURA'#39','
      
        '  (SELECT TOP 1 CONVERT(VARCHAR,RC.DT_REFERENCIA,103) FROM TREF_' +
        'CLIENTE RC WHERE RC.NR_PROCESSO = P.NR_PROCESSO AND RC.TP_REFERE' +
        'NCIA = '#39'01'#39' ORDER BY RC.CD_REFERENCIA) '#39'DT FATURA'#39
      'FROM TPROCESSO P'
      '  INNER JOIN TEMPRESA_NAC E ON E.CD_EMPRESA = P.CD_CLIENTE'
      '  LEFT JOIN TEMPRESA_EST EE ON EE.CD_EMPRESA = P.CD_IMPORTADOR'
      '  LEFT JOIN TPAIS_BROKER PB ON PB.CD_PAIS = EE.CD_PAIS '
      '  LEFT JOIN TEMPRESA_EST EE2 ON EE2.CD_EMPRESA = P.CD_CONSIGNEE'
      '  LEFT JOIN TPAIS_BROKER PB2 ON PB2.CD_PAIS = EE2.CD_PAIS'
      
        '  LEFT JOIN TLOCAL_EMBARQUE LE ON LE.CODIGO = P.CD_LOCAL_EMBARQU' +
        'E'
      '  LEFT JOIN VW_SERVICO_GERAL SG ON SG.CD_SERVICO = P.CD_SERVICO'
      
        '  LEFT JOIN TVIA_TRANSP_BROKER VT ON VT.CD_VIA_TRANSP = SG.CD_VI' +
        'A_TRANSPORTE'
      '  LEFT JOIN TPAIS_BROKER PB3 ON PB3.CD_PAIS = P.CD_PAIS_DESTINO'
      
        '  INNER JOIN TPROCESSO_RE_ITENS_NOVOEX NE ON NE.NR_PROCESSO = P.' +
        'NR_PROCESSO'
      'WHERE NE.IN_RE_CO = '#39'1'#39' '
      '      AND NE.CD_USUARIO_CO = :CD_USUARIO_CO')
    Left = 112
    Top = 16
    ParamData = <
      item
        DataType = ftString
        Name = 'CD_USUARIO_CO'
        ParamType = ptInput
        Value = '1801'
      end>
    object qryREsCOCapaEXP1: TStringField
      FieldName = 'EXP1'
      FixedChar = True
      Size = 80
    end
    object qryREsCOCapaEXP2: TStringField
      FieldName = 'EXP2'
      FixedChar = True
      Size = 50
    end
    object qryREsCOCapaEXP3: TStringField
      FieldName = 'EXP3'
      FixedChar = True
      Size = 40
    end
    object qryREsCOCapaIMP1: TStringField
      FieldName = 'IMP1'
      FixedChar = True
      Size = 100
    end
    object qryREsCOCapaIMP2: TStringField
      FieldName = 'IMP2'
      FixedChar = True
      Size = 100
    end
    object qryREsCOCapaIMP3: TStringField
      FieldName = 'IMP3'
      FixedChar = True
      Size = 151
    end
    object qryREsCOCapaCONS1: TStringField
      FieldName = 'CONS1'
      FixedChar = True
      Size = 100
    end
    object qryREsCOCapaCONS2: TStringField
      FieldName = 'CONS2'
      FixedChar = True
      Size = 1
    end
    object qryREsCOCapaCONS3: TStringField
      FieldName = 'CONS3'
      FixedChar = True
      Size = 120
    end
    object qryREsCOCapaPORTO: TStringField
      FieldName = 'PORTO'
      FixedChar = True
      Size = 50
    end
    object qryREsCOCapaMODAL: TStringField
      FieldName = 'MODAL'
      FixedChar = True
    end
    object qryREsCOCapaDESTINO: TStringField
      FieldName = 'DESTINO'
      FixedChar = True
      Size = 120
    end
    object qryREsCOCapaFATURA: TStringField
      FieldName = 'FATURA'
      FixedChar = True
      Size = 16
    end
    object qryREsCOCapaDTFATURA: TStringField
      FieldName = 'DT FATURA'
      FixedChar = True
      Size = 30
    end
  end
  object dsREsCOCapa: TDataSource
    DataSet = qryREsCOCapa
    Left = 186
    Top = 16
  end
  object qryREsCOItens: TQuery
    Active = True
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      
        'SELECT NR_RE, LEFT(NR_NCM,8) NCM_MERCADORIA, TX_MERCADORIA, QT_U' +
        'NID_COMERC PL_MERCADORIA, TX_UNID_COMERC, QT_PESO_LIQ PESO_LIQ ,' +
        ' VL_LOCAL_EMB VL_MERCADORIA'
      'FROM TPROCESSO_RE_ITENS_NOVOEX'
      'WHERE IN_RE_CO = '#39'1'#39' AND CD_USUARIO_CO = :CD_USUARIO_CO'
      'ORDER BY NCM_MERCADORIA')
    Left = 112
    Top = 72
    ParamData = <
      item
        DataType = ftString
        Name = 'CD_USUARIO_CO'
        ParamType = ptInput
        Value = '1801'
      end>
    object qryREsCOItensNR_RE: TStringField
      FieldName = 'NR_RE'
      FixedChar = True
      Size = 12
    end
    object qryREsCOItensNCM_MERCADORIA: TStringField
      FieldName = 'NCM_MERCADORIA'
      FixedChar = True
      Size = 8
    end
    object qryREsCOItensTX_MERCADORIA: TMemoField
      FieldName = 'TX_MERCADORIA'
      BlobType = ftMemo
    end
    object qryREsCOItensPL_MERCADORIA: TFloatField
      FieldName = 'PL_MERCADORIA'
    end
    object qryREsCOItensTX_UNID_COMERC: TMemoField
      FieldName = 'TX_UNID_COMERC'
      BlobType = ftMemo
    end
    object qryREsCOItensPESO_LIQ: TFloatField
      FieldName = 'PESO_LIQ'
    end
    object qryREsCOItensVL_MERCADORIA: TFloatField
      FieldName = 'VL_MERCADORIA'
    end
  end
  object dsREsCOItens: TDataSource
    DataSet = qryREsCOItens
    Left = 186
    Top = 72
  end
  object qryREsCONCM: TQuery
    Active = True
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      
        'SELECT DISTINCT NR_ORDEM, SUBSTRING(NR_NCM_MERCADORIA, 1, 4) + '#39 +
        '.'#39' + SUBSTRING(NR_NCM_MERCADORIA, 5, 2) + '#39'.'#39' + SUBSTRING(NR_NCM' +
        '_MERCADORIA, 7, 2) NR_NCM_MERCADORIA_MSK, '
      
        'SUBSTRING(NR_NALADI_MERCADORIA, 1, 4) + '#39'.'#39' + SUBSTRING(NR_NALAD' +
        'I_MERCADORIA, 5, 2) + '#39'.'#39' + SUBSTRING(NR_NALADI_MERCADORIA, 7, 2' +
        ') NR_NALADI_MERCADORIA_MSK,'
      
        'NR_NCM_MERCADORIA, ISNULL(CONVERT(VARCHAR(MAX),TX_NCM), '#39#39') AS T' +
        'X_NCM'
      
        'FROM (SELECT DENSE_RANK() OVER (ORDER BY REI.NR_NCM_MERCADORIA) ' +
        'NR_ORDEM, REI.NR_NCM_MERCADORIA, CON.TX_NCM, REI.NR_NALADI_MERCA' +
        'DORIA'
      
        'FROM (SELECT NR_RE, LEFT(NR_NCM,8) NR_NCM_MERCADORIA, '#39#39' NR_NALA' +
        'DI_MERCADORIA, TX_MERCADORIA, QT_UNID_COMERC PL_MERCADORIA, TX_U' +
        'NID_COMERC, QT_PESO_LIQ PESO_LIQ , VL_LOCAL_EMB VL_MERCADORIA'
      'FROM TPROCESSO_RE_ITENS_NOVOEX'
      'WHERE IN_RE_CO = '#39'1'#39' AND CD_USUARIO_CO = :CD_USUARIO_CO) REI'
      
        '  LEFT JOIN TEXP_CO_NCM CON ON CON.NR_NCM_MERCADORIA = REI.NR_NC' +
        'M_MERCADORIA) AS VW'
      'ORDER BY NR_NCM_MERCADORIA')
    Left = 112
    Top = 136
    ParamData = <
      item
        DataType = ftString
        Name = 'CD_USUARIO_CO'
        ParamType = ptInput
        Value = '1801'
      end>
    object qryREsCONCMNR_ORDEM: TFloatField
      FieldName = 'NR_ORDEM'
    end
    object qryREsCONCMNR_NCM_MERCADORIA_MSK: TStringField
      FieldName = 'NR_NCM_MERCADORIA_MSK'
      FixedChar = True
      Size = 10
    end
    object qryREsCONCMNR_NALADI_MERCADORIA_MSK: TStringField
      FieldName = 'NR_NALADI_MERCADORIA_MSK'
      FixedChar = True
      Size = 5
    end
    object qryREsCONCMNR_NCM_MERCADORIA: TStringField
      FieldName = 'NR_NCM_MERCADORIA'
      FixedChar = True
      Size = 8
    end
    object qryREsCONCMTX_NCM: TMemoField
      FieldName = 'TX_NCM'
      BlobType = ftMemo
    end
  end
  object dsREsCONCM: TDataSource
    DataSet = qryREsCONCM
    Left = 184
    Top = 136
  end
  object ppRpREsCO: TppReport
    AutoStop = False
    DataPipeline = ppBDEREsCOCapa
    PassSetting = psTwoPass
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = 'ACE 18'
    PrinterSetup.PaperName = 'A4'
    PrinterSetup.PrinterName = 'Default'
    PrinterSetup.mmMarginBottom = 5000
    PrinterSetup.mmMarginLeft = 11000
    PrinterSetup.mmMarginRight = 5000
    PrinterSetup.mmMarginTop = 6000
    PrinterSetup.mmPaperHeight = 297011
    PrinterSetup.mmPaperWidth = 210016
    PrinterSetup.PaperSize = 9
    Template.FileName = 'C:\DDBROKER\NOVOEX_ACE35_FECOMERCIO.RTM'
    Units = utPrinterPixels
    DeviceType = 'Screen'
    OutlineSettings.CreateNode = True
    OutlineSettings.CreatePageNodes = True
    OutlineSettings.Enabled = False
    OutlineSettings.Visible = False
    PreviewFormSettings.WindowState = wsMaximized
    PreviewFormSettings.ZoomSetting = zsPageWidth
    TextSearchSettings.DefaultString = '<FindText>'
    TextSearchSettings.Enabled = False
    Left = 186
    Top = 199
    Version = '7.02'
    mmColumnWidth = 0
    DataPipelineName = 'ppBDEREsCOCapa'
    object ace18_header: TppHeaderBand
      PrintHeight = phDynamic
      mmBottomOffset = 0
      mmHeight = 108479
      mmPrintPosition = 0
      object ace18_dbt1: TppDBText
        UserName = 'ace18_dbt1'
        ReprintOnOverFlow = True
        DataField = 'EXP1'
        DataPipeline = ppBDEREsCOCapa
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppBDEREsCOCapa'
        mmHeight = 3704
        mmLeft = 2646
        mmTop = 25400
        mmWidth = 79904
        BandType = 0
      end
      object ace18_dbt2: TppDBText
        UserName = 'ace18_dbt2'
        ReprintOnOverFlow = True
        DataField = 'EXP2'
        DataPipeline = ppBDEREsCOCapa
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppBDEREsCOCapa'
        mmHeight = 3704
        mmLeft = 2646
        mmTop = 28840
        mmWidth = 79904
        BandType = 0
      end
      object ace18_dbt3: TppDBText
        UserName = 'ace18_dbt3'
        ReprintOnOverFlow = True
        DataField = 'EXP3'
        DataPipeline = ppBDEREsCOCapa
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppBDEREsCOCapa'
        mmHeight = 3704
        mmLeft = 2646
        mmTop = 32279
        mmWidth = 79904
        BandType = 0
      end
      object ace18_dbt4: TppDBText
        UserName = 'DBText1'
        ReprintOnOverFlow = True
        DataField = 'IMP1'
        DataPipeline = ppBDEREsCOCapa
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppBDEREsCOCapa'
        mmHeight = 3704
        mmLeft = 2646
        mmTop = 43392
        mmWidth = 79904
        BandType = 0
      end
      object ace18_dbt6: TppDBText
        UserName = 'DBText2'
        ReprintOnOverFlow = True
        DataField = 'IMP3'
        DataPipeline = ppBDEREsCOCapa
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppBDEREsCOCapa'
        mmHeight = 3704
        mmLeft = 2646
        mmTop = 50536
        mmWidth = 79904
        BandType = 0
      end
      object ace18_dbt8: TppDBText
        UserName = 'DBText3'
        ReprintOnOverFlow = True
        DataField = 'PORTO'
        DataPipeline = ppBDEREsCOCapa
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppBDEREsCOCapa'
        mmHeight = 3704
        mmLeft = 2646
        mmTop = 82021
        mmWidth = 78581
        BandType = 0
      end
      object ace18_dbt9: TppDBText
        UserName = 'DBText4'
        ReprintOnOverFlow = True
        DataField = 'MODAL'
        DataPipeline = ppBDEREsCOCapa
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppBDEREsCOCapa'
        mmHeight = 3704
        mmLeft = 2646
        mmTop = 94456
        mmWidth = 47625
        BandType = 0
      end
      object ace18_dbt10: TppDBText
        UserName = 'ace18_dbt10'
        ReprintOnOverFlow = True
        DataField = 'DESTINO'
        DataPipeline = ppBDEREsCOCapa
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppBDEREsCOCapa'
        mmHeight = 3704
        mmLeft = 99484
        mmTop = 82021
        mmWidth = 79375
        BandType = 0
      end
      object ace18_dbt11: TppDBText
        UserName = 'ace18_dbt11'
        ReprintOnOverFlow = True
        AutoSize = True
        DataField = 'FATURA'
        DataPipeline = ppBDEREsCOCapa
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppBDEREsCOCapa'
        mmHeight = 3260
        mmLeft = 114300
        mmTop = 94986
        mmWidth = 17230
        BandType = 0
      end
      object ace18_dbt12: TppDBText
        UserName = 'ace18_dbt12'
        ReprintOnOverFlow = True
        DataField = 'DT FATURA'
        DataPipeline = ppBDEREsCOCapa
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppBDEREsCOCapa'
        mmHeight = 3440
        mmLeft = 153988
        mmTop = 94986
        mmWidth = 15875
        BandType = 0
      end
      object ace18_dbt5: TppDBText
        UserName = 'DBText18'
        ReprintOnOverFlow = True
        DataField = 'IMP2'
        DataPipeline = ppBDEREsCOCapa
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppBDEREsCOCapa'
        mmHeight = 3969
        mmLeft = 2646
        mmTop = 46831
        mmWidth = 79904
        BandType = 0
      end
      object ace18_dbt7: TppDBText
        UserName = 'DBText22'
        ReprintOnOverFlow = True
        DataField = 'CONS1'
        DataPipeline = ppBDEREsCOCapa
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppBDEREsCOCapa'
        mmHeight = 3704
        mmLeft = 2646
        mmTop = 62706
        mmWidth = 78846
        BandType = 0
      end
      object ppDBText34: TppDBText
        UserName = 'DBText34'
        ReprintOnOverFlow = True
        DataField = 'CONS3'
        DataPipeline = ppBDEREsCOCapa
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppBDEREsCOCapa'
        mmHeight = 3704
        mmLeft = 2646
        mmTop = 69321
        mmWidth = 78846
        BandType = 0
      end
      object ppLabel2: TppLabel
        UserName = 'Label2'
        Caption = '1. Produtor Final ou Exportador: (nome, endere'#231'o, pais)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3260
        mmLeft = 2646
        mmTop = 20373
        mmWidth = 70231
        BandType = 0
      end
      object ppLabel3: TppLabel
        UserName = 'Label3'
        Caption = '2. Importador: (nome, endere'#231'o, pa'#237's)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3260
        mmLeft = 2646
        mmTop = 38365
        mmWidth = 47890
        BandType = 0
      end
      object ppLabel4: TppLabel
        UserName = 'Label4'
        Caption = '3. Consignat'#225'rio: (nome, pa'#237's)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3260
        mmLeft = 2646
        mmTop = 57944
        mmWidth = 38142
        BandType = 0
      end
      object ppLabel5: TppLabel
        UserName = 'Label5'
        Caption = 'Identifica'#231#227'o do Certificado:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3260
        mmLeft = 99156
        mmTop = 20108
        mmWidth = 35052
        BandType = 0
      end
      object ppLabel6: TppLabel
        UserName = 'Label6'
        Caption = '(N'#250'mero)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3260
        mmLeft = 108215
        mmTop = 24606
        mmWidth = 11938
        BandType = 0
      end
      object ppLabel7: TppLabel
        UserName = 'Label7'
        Caption = '4. Porto ou Lugar de Embarque Previsto:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3260
        mmLeft = 2646
        mmTop = 76994
        mmWidth = 51562
        BandType = 0
      end
      object ppLabel8: TppLabel
        UserName = 'Label8'
        Caption = '5. Pa'#237's de Destino: '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3440
        mmLeft = 99219
        mmTop = 76729
        mmWidth = 24342
        BandType = 0
      end
      object ppLabel9: TppLabel
        UserName = 'Label9'
        Caption = '6. Meio de Transporte Previsto:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3260
        mmLeft = 2646
        mmTop = 89694
        mmWidth = 39539
        BandType = 0
      end
      object ppLabel10: TppLabel
        UserName = 'Label10'
        Caption = '7. Fatura Comercial:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3175
        mmLeft = 99484
        mmTop = 89694
        mmWidth = 26194
        BandType = 0
      end
      object ppLabel11: TppLabel
        UserName = 'Label11'
        Caption = 'N'#250'mero:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3260
        mmLeft = 99484
        mmTop = 94986
        mmWidth = 10880
        BandType = 0
      end
      object ppLabel12: TppLabel
        UserName = 'Label12'
        Caption = 'Data:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3260
        mmLeft = 144198
        mmTop = 94986
        mmWidth = 6773
        BandType = 0
      end
      object ppLabel13: TppLabel
        UserName = 'Label13'
        Caption = '8. N'#186' de Ordem (A)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        WordWrap = True
        mmHeight = 6615
        mmLeft = 6879
        mmTop = 101336
        mmWidth = 12435
        BandType = 0
      end
      object ppLabel14: TppLabel
        UserName = 'Label14'
        Caption = '9. C'#243'digos NALADI'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        WordWrap = True
        mmHeight = 5757
        mmLeft = 29083
        mmTop = 101336
        mmWidth = 11684
        BandType = 0
      end
      object ppLabel15: TppLabel
        UserName = 'Label15'
        Caption = '10. Denomina'#231#245'es das Mercadorias (B)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        WordWrap = True
        mmHeight = 6615
        mmLeft = 74083
        mmTop = 101336
        mmWidth = 41540
        BandType = 0
      end
      object ppLabel16: TppLabel
        UserName = 'Label16'
        Caption = '11. Peso L'#237'quido ou Quantidade'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        WordWrap = True
        mmHeight = 6615
        mmLeft = 141288
        mmTop = 101336
        mmWidth = 22225
        BandType = 0
      end
      object ppLabel17: TppLabel
        UserName = 'Label17'
        Caption = '12. Valor FOB em D'#243'lares(US$)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        WordWrap = True
        mmHeight = 6615
        mmLeft = 167746
        mmTop = 101336
        mmWidth = 18256
        BandType = 0
      end
      object ppMemo1: TppMemo
        UserName = 'Memo1'
        Caption = 'Memo1'
        CharWrap = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = [fsBold, fsItalic]
        Lines.Strings = (
          
            'Acordo de Complementa'#231#227'o Econ'#244'mica N'#186' 35 celebrado entre os Gove' +
            'rnos dos Estados Partes do Mercosul e o Governo da Rep'#250'blica do ' +
            'Chile')
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 9790
        mmLeft = 2117
        mmTop = 10054
        mmWidth = 186532
        BandType = 0
        mmBottomOffset = 0
        mmOverFlowOffset = 0
        mmStopPosition = 0
        mmLeading = 0
      end
      object ppLabel1: TppLabel
        UserName = 'Label1'
        Caption = 'CERTIFICADO DE ORIGEM'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 18
        Font.Style = [fsBold, fsItalic]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 7493
        mmLeft = 51180
        mmTop = 3440
        mmWidth = 81534
        BandType = 0
      end
      object ppImage1: TppImage
        UserName = 'Image1'
        DirectDraw = True
        MaintainAspectRatio = False
        Picture.Data = {
          0A544A504547496D616765F1270000FFD8FFE000104A46494600010200006400
          640000FFEC00114475636B79000100040000003C0000FFEE000E41646F626500
          64C000000001FFDB0084000604040405040605050609060506090B080606080B
          0C0A0A0B0A0A0C100C0C0C0C0C0C100C0E0F100F0E0C1313141413131C1B1B1B
          1C1F1F1F1F1F1F1F1F1F1F010707070D0C0D181010181A1511151A1F1F1F1F1F
          1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F
          1F1F1F1F1F1F1F1F1F1F1F1FFFC00011080060016503011100021101031101FF
          C400A70001000203010101000000000000000000000506010204030708010100
          030101000000000000000000000000010203040510000103040004030405060B
          0803000000020304050001120611221307213214314142236171526215817292
          33243451B182A2D24373D3551617F091C1C253A30818A1B24411000202010400
          0601030303050000000000011102032131120441516122131432718152A14262
          91C105F0B1D12315FFDA000C03010002110311003F00FD5340280500A0140280
          500A0140280500A01402805440317A89624C5588D4506A66A35260C71FA2A609
          836A10280500A0140280500A0140280500A0140280500A0140280500A0140280
          500A0140280500A0140280500A0140280500A01402805018F7546C110523BA6A
          F1C774DE49A20ADBCC025995BF9219DEB9B27729535589BF038BFD50D1BFC4BF
          ECAFFDDD67F7F0F993F5B27918FF0054347FF12FFB2BFF00774FBF87CC9FAD93
          C8C8F7374922B5AD256E257E03F296FEEEA69DFA5B621E0B22D5C78D75D5C98B
          466AC0500A0140280500A0140280500A0140280500A0140280500A0140280500
          A0140280500A0140280500A0140280500A0140280C71AACEB00E293946318C95
          7AF54B22DD1B64A285FEDEDAA66B2A292F5C7C8F94BF9DDCF7A76A348548DAC4
          0DF122E3858BFB457FE51AF1ED932E6D0EC5558B52418F645014ED77D267753E
          216E0223FA455A53FE2DBDD916EEBF03B7FD1383FF001075FEE4FF00A356FF00
          E5D111F72C6A5D9483B5B8DE45D5AD6FECFF00A350FF00E2E8C9FB962B9A676F
          5D3F9CF58A81A706D97234145AD89B8102E4C47ECFDEAC3A9D27565B3E74D1F6
          CE1E15EED5423CF1520500A0140280500A0140280500A01402A40A0140280500
          A0140280500A0140280500A0140280500A0140280500A0140280501A118D878D
          FC2D557AA926BA9F347A9ABBCCBAAAAEB7A6D4228CAD756F7C05C281E62CBECF
          DEF70FD75E63C57CF683756E08E95FBC3DA7D7D2162DE49220479051649A8A8D
          BF940387F3ABD9C5D3B2D91C77ECF2673FFEC3F6BF1E24F971FADB2DFD1AD6DD
          2C8F628B3A4763C5B74D9AEDA475A77F86C2B8446E17729E0B17122F99D331CC
          7E1C6BCACD82E8ECA5EA4BC2EA2FD0541CCCCBB995721E2091974D00BFF663E6
          FE55462C36F162D65E05AABAD248C854B0280500A0140280500A0140280500A0
          1402A40A0140280500A0140280500A0140280500A0140280500A0140280500A0
          14028050151DFE5136D144D2EA9209B8B17AB593B6462DFCA4298FC4A2A64298
          0FC457AC2F5E4CBA7C4A1AFDB3DC37749119C757D675646C22C35C6B7EA2DD3B
          7949C9793A85FCAC6BBF0E458D1CF9573249BFFE3976CD20B0ABEB162B7B4CDC
          E37FE60855ABDBCA66B1632720BB2FDB6885C176D120BB84AF902AE4CD7E05F9
          A6587F36AB7EC5D9A2C542F7ECAE73581402A00A033500500A960E1B4AC59C81
          C759DA577E9858D46998F56C25E52C3CD52EBA10775413038501AE43C7871B71
          FE0A88126D53220C71A4491A98B90DBDB7B566AEAAE0B431C6D7ABCFA8D8D0D5
          493B5B3310E3ECE37E150EDAC3621B3D6AC881460548140280500A0140280500
          A0140280500A0140280500A0140280500A01402808DFC1D8DDF5DEAA9D947373
          EA0997B884711C7F347F8EF54D993B9236ABB2220FC891D1FA43FDBF640DB66D
          C44A293B57D192195F32EBA998F954FA2BD6BD9C688E34EB27D235475DB0EDFC
          33EDBA2665E4D36757FC3D340FCC6B07CDC521314FE1F31796B8ED4B59EC689D
          49C61DF25D29064DF66D61F6BEC648C536920BDF24F89F973E50C6AB6EBF916A
          E424371EF13286D8075C888C71B04F7C6CDADF114F973C4CF81F363CDE5F0A8A
          75E54936C878CCF79568C4A323FF00CBEE9CEDD249754B5F44C48D1F37EB14C7
          EEE5E5F2D4D3AF3AF8117C9075E9DDDA6D372EE20662357D7E79B812A4C9D5F2
          B1260391101F00F879BF36A2FD7D2453215C73FF0090F751678B42EB0F2561E3
          EFFB54A01E036B7DAC703C47F38AB4FA847CE8D3FF00630DD0387711A9BE7D14
          CAD6BBD79988F4BF3F015007F4A8FA91E23E74591E77AB52434A6DB4DBAAA83B
          52EDD0603C3AE4E03CE9F0FB9F6BEAFE1ACABD77304BC852F53DC60A1F75BC96
          C3AAC8424A6C6A62DE66494EBF9F1B7487214FA43E51E5FA3E1AD6F874D195E6
          59F63EF31B4D9D5D6B5B825F62956DCAEBA45D34D32E3C2E3E53F2FC45CA358A
          C1A493F29A4A77BB8CEAD09ABC039D8DFB5E367976E4209010F810E789E58972
          E5E035A7D68DC9F908D466B570EF719BB60E9A4D033EBBA7AA3BFD9931F44244
          26863C3903972CBDD953E2704723D95EFE3B5C1CC8C3EA8FE4B5B68442E2584A
          C9DB10F3100DC7FE6FF754FD7F364FC87D1F58D9A2766846F3116A5CDA38B785
          8ED89010F980C7E121AE6BE374BC1AD6E99499E8A692BDD4498BD1255B1B2CAE
          16220E61B17D9AF1EF36EC41D75B454D5CB6BEABBC44B28570ADDA495B83A8E3
          50941B78E39DB2E38FDAFC97AAE47C32C6365AB165A95F8BBEB72329216DDDCA
          C94A754840543513001FA31F2FFF005AC6AF9E68C8E0D32255D8FB3C728CC992
          1766A0ACDAC02292A0598DC46DC2DCD5EDD1AF03819D75A10280500A01402805
          00A0140280500A0140280500A0140280500A0140280500A01402819F9F3B4FA5
          C64B6EDB87F9861ECE1005C8DA5DDA258DF3594CC833FC95DDD8CD2B439B1E32
          5FBD7DB3C35B8E5F538BB268C5B951C3A60C4713215447254447CC41D2B553AF
          9A371931911AE6BBA877096BC5AF29B59A8D83D52A8C9AA3D24CC084711220F3
          737F1D5AD7750ABC829695ED9F73E5275F463993D7E6048464500EAA89899097
          370F8848712B16395472E6871E2664A45CC5F7199774918D7AFF0057976B6132
          492C976F7E9F43992F87CB97E5BD689AB5387891A9E7746577BDFDE6E2CA35CB
          1838E8D5D249672974D45CFD3A822221E39644AFE8DA9C956BC06A4AF6458BA4
          3B49B122E5B2A8ACAA8EF14944881421F489F0E53F35679DCD916C358A9AF63D
          8BB47B51B124E1B2A8A866EF824A264245FB28FC263CD519AC9C118AB0D9F376
          3A56CAEBB70CE51A31766A444AAE6E9A02649AF64CD16FF392131CB93A5E6C7F
          8ABA5E7467F1B2F7ADEB3A77709C5D8A92BB52A6C845D12726A0F4D33CB1C448
          83CDCD583CB068B19D9DA760F51EF0EE6A2ADD64D13F5364D7302113FDAC7CA4
          5E6A67B2845555A2274D967FDA49F9A8DD8E25D2B1AF95B2A84AB44BAB9D832C
          3D9E61212F2F984AAD9DAC89345959A359F8190D8BBCF2893745645BCAC4A80D
          DD924429D8956038E45E5F3729D4D6EAB5456F566759DDDEEA3A3BDD1E575D90
          FC7F17283504D1CD257D465CD97F2FE1CB2A644AF74D16A59A3E8DD8DD4A5359
          D1936D283749EBB5D4746DEFE64AC6220205F7B10CBF2D7376B22B6435C74839
          E7A14A4FBA0924A5DCA2D899F8B96F7248AC4362E5EA8D78597AEED9A4EFC797
          8D4F28987535AEE1D9255355FB67E817A67CB0928AA65F67ABF0F971FCB6AAE2
          C6F1B964DEEAC8F692DD35F5C956FB5EBCB367037B8A7655015B88FC382BFD1A
          D3266A5B7A95AD7C99D9DA98E76D90945FA0AB58A76E3A918D96F02B27CDCD8F
          E6900FE4AB747134467B497FAF4A4E5466848A0140280500A0140280500A0140
          280500A0140280500A0140280500A01402805018A308CF0A2D03462DC2A26484
          A05F85260448E1E14F192470E14D640F0F75491038546A20CF0B54C9302A241A
          FB28B56499A84DC1108C7B2A54C92678513704423348063C290A6448E1469323
          5317AAEABC0B19B5AD6A9AA821B1530119A90280500A0140280500A014028050
          0A0140280501E0BD96E915922105785F023B5C86C5EEC86C4197E9522592B63E
          61A06F1B6ECCE9D3752760BD73076F1BBA8841938F53649A2E4802E65F8829D3
          CB94B120F1F2E5F157565C5C4CEB7D4DFB7BBC6D9B2BD70DDC4D41A8E23DEBB6
          CFE21BB45D373641AB826FD7EA7AD5FA79F8188925F778FC553971D6AF6655DB
          7A9CAFB7DEE0C7A5B7C9A8A45BC8ED41E59370C81A386EBB86BD045CAA42B93A
          5C1350017FFA4425C3E1E3CB34C75B2AC4FBA4BE4B6E8D8FB8DB13BDDAF06D27
          2163DA3C62CE4213D7315CDCB8F5C46028E02FDBE4418D888847DFE5B70A3C09
          576F3FE853E4D13F33BB6FDDB6684DBE261D59983876128C555FD548B6554E0E
          9B9A2048897AD6825D5EBF27C5E1EFA8C3855E96B43F6979D52F32660F65DA9E
          76FC65DEC48B6D9CD15AC11A7D449351C0110257C4FE6A69AB8D94C4B9846FEF
          E159E4C29E4E09E84D7DCE0867BDDAB2BA06BD3910D537331B4AE847C5B55CC9
          34137AAE42A75C8332E9A0691E623CC5C31F7F1ABAEB45DD5BD1157921496B8C
          FF0035A6B123384C5C33E89A8522CC56685D4CADF2FD31A8E311B0712CFAF7CB
          EC8F0F1E7B2A96AEDFA94FD5B6E83838EDDAEB475A30B5659470E23D03514B7A
          3343AEDAE90AA5827D41CBE5A78A62A65FC372BF4E4C37B3AFA85E3E86A7BFEE
          1170D07B4CDA4C0E0E6976892F1ED93501CB04DF10D90509C9ACA039C32B0988
          A01EDC87CBCD6FAF3674F14539CD799F439951F0453A5182A922F012234545D3
          2593B10DB8F3262A2045FA635C5BE86B5D5A3E6903DCDDA5067A74B6C9E81789
          DC0530026282CDD566E5647AE90975567565933C4872E4C6BBAFD5A4D9577AC7
          EE60F234F4DBC4C8773B715F4653B8ED9B32BEB29DD45C20C9353D79B1494E91
          2D777D6E90A9CA4AF4FA17E5E5CB2F1AAFD7C6AFC2DB9A2B2B6C5BF72DE196B7
          A52FB38A44F93E9A5766801583ACA393104073BF1C448941E6F75AB1C381E4BF
          044F2D0E25E7B74D760949ADA2D1CF19356AB3D93FC381640DBF451257A4902A
          A2FEA323E5EA649FBB93C794E89DA2A2AC853DFB718B8583DA26D26070536BB5
          4978F6C9A80E5803E21E8284E4D6501CE19584C4500F6E43E5E6DEBD7E56755F
          923359269CCEBD6F7B9B1DFA6B52D8C1A8FA769F89C2BC6892A975998A8492FD
          513517F98078F94B9BDB55B605C392FDCBBF6DFF0052AF21DCCEE08EB7333CAB
          88664CE3E74A109A2ED1C112689B94D0EB2AE41EA619002B91728FB3DA35A63C
          147755D7DDFF005E443C90EDFE2585DCCCFEBBDAC929C827D06F1B463737314A
          3262B24C54451CAEAA76481DA9E731BE2A0AB8F8F97DF7C1568EE9432D4D51E5
          13DCC9846F232122E63E7F596710A4A293B088A892492E8973B22CDCBC494508
          39B955121E1CC3CC37AD2DD7ABD179FF00A90ADAA44C6B32DDC893876132BA31
          69A52A292C9C70596EA326EB73091AF753076A02643988A68DBDB895F85AC596
          4A56ADA215E52F52B4C7BA7B627AF26E1E0317933293CB6BB0C9208ACD904D44
          97512270E735DC190E2975311C6FF0E5E3956D6EB7BA16D1215B7F42CD17B5EC
          0CB774352D8EED1D2B20CD47F1B28C9351A81D9131051B93655676798E59E7D4
          C6E3F0F8567F14D1D97F68E5B7A923DC69C9981D2A5672209BD9E463651D883B
          49459331487324F1055021CBED65CBF66F54C34E5655F334F06573FCEBB8B09D
          435E945A39579311CABF84946ED574D1051A889AE8B86C6E5422E42B10902E3F
          556BF5E6ADAFED6655BECFF91BF69F73D876E8B672ABCC433C4556E0A48C647B
          758176AB2C37B8812E6EDC0E56C6F9012437F7FD6ED75D63B44134BF23CBB81B
          E4EEBBB6B18CFC6E161A25FB172E93752AD9432159A9A63D2CC5EB512EAF5797
          11CADC3DF4EB62592B67FC63FA97B3822E4FB97BAB6D6F4A979138CD6EF3EB7A
          696B4AB754936E5D251417025EADA6099F4C714D4E61CAD91656AD3EB539DAAB
          58293ED2CB3925DC7435246461158A9996CBAE8A3E95C2083C6F71EA88A43EA5
          42455C04B1C88C48B8797DDCE9515B8BD099F6918AF73DF3BD59D6E10C68A90C
          9B70B2AC5464B1BD62E3AFD074AB9C17F982D044D4344521221B72A98F356ABA
          DC727C6CB365A347D9FF00CC7157904DEB193665D316AFE3AE422AFCB123EAA0
          A9286D94132FD491910F8645C6F88F3E5C7C7F52A995288DDF7090DDA6B5C29C
          8141DC53D141AC793271EA5CB6BA22E0D4FDFF008A78895C33E910E56FA71AE8
          B60AF05786E48BBD4B6771A726A0749979C8826F67918D947820ED25164CC521
          C893C41540872FB5972FD9BD61868AD754348D0AE5F74DC984EA3AF4A2F1CABC
          988E55FC24A3768B268828D844D745C36372A1172158848571FAAB7F828E74FC
          5EA64ADAAFF237ED46E7B0EDB18CA5579886788AADC14918C8F6CB02ED16586F
          714CD7276E072B637C80921BFBFEB8ECE1A51B50FD0957948FA5572171402805
          00A0140280500A03C17B2D748AC91082BC2F8115AE4362F7643620CBF4A930C9
          454B44D365B5A8C78D1DC9357EE1CB972EDB2E9B336FD251E2A4BAA2424E5C64
          3915B80890F85BDFEDADF2E6E466A9A9C1A9E83B7EBC1E9FF1F60B3337ABBD73
          708B581C97AB71EA174D358DEAA098995F1FD55F97EF7355F2F62B6B4C1575DD
          9C8E7B5BB23CB6C4D1E6C2DAD11B43AB2F2C8368E349CF4BA49A048A0B9BB5C0
          33491B09112457F1BE38F86335EC2AAAC2FC64BE4AF89D36EDD6C8D367753511
          2F1AD5059A35608307116BB8149BB122347985FA1928247E6C6DECB78555F639
          57623E3D17A1BCD76D9F4DCFB1792F24D9E46231ABC5BF8F519164B8BBE992EA
          7585CFCB2CD2120E4BE3F4F9AD187B2EB4758DCB71D53F210DDBA9941832819F
          9561B26B0CAD700632319D472603FBBF5172726891A36C472E87378FC57CACC9
          D84ED29432128D08863D9351AC53B8DBCC002294ADE7759F44CFD3FE1AEB222E
          98892EA0288F363D3E5F69735B8DB1DBEE6BB0B539392C51CCFB852DAC95E51D
          358E95737C49A2CC2CA249A227C08154927EE3A84A88F985C638DFCB95617745
          6D3626A45FFA371C8ED4F6423498C6EB9291A5132DAEB5616481C26762F99D44
          964C454E27E6E979797E9A9FB5654F37E02A7AA1DB29159AC3C3CBCD8C86B904
          B22BB16766A483B549A7EED678E6CBA80B08781162806456B5CBE2B5E7ECB976
          F329C62BC0BB4B357AEA35C3662B26D9D2C9DC1359648974C08BDE498288117E
          98D732D3535ABE2CA1EBDDAB7AD91D69ACECB23291BAA00DA25A37644D335812
          E902EE48D777D4201E38D8301CAFC7C7C2BB2FDC976697BAC60E92F4D8CDBB4C
          E93D794D3D29AB0690AAA4578DF4E5EBC5B9ABD72682F857B0F473E23FA8B974
          EF8E5F1543EE4DFE4B2F71A24ABB6E5B369D462765D69C6BAFAC69B25C004090
          2C1448912124944CBE12021B5C7EAAC30E7B52FF0022278E870B6D67607914EA
          2B69946D2F1EE5B1335136CC8D992806174D525C89CBBC8AE37FEAC43C78FD18
          CBBAE52B415443B7ED9C92CD21E1E5E6C6435C825515D8B3B36241DAA4D3F76B
          3C7365D405843C08B1413C8AD6BDFDF6BEBF69D6CDAFC99458E29C4F779DBD90
          929A8998929346EFA15DB95DB9B46CAB7B28D5DA656268B589CAB90F570232F8
          86D8E36E395457B115755E3B97B7BAFF00A102A76836E38A7D197D9A3FA2FE5C
          67162B44AD9D9D59607188DFD7FEAF34EDCBE6E1F156B4EE555D5A3F1455D393
          B7F91609CD2F709BD565E05ECEB04EF2A8937155AC628924926AE5D72E993D50
          8943CFC0B3E03C3CB7E3585335559382D4D11C89769EE324E9D1C8A5E8679959
          96DB122D885B3D5053E90B943E7E6D55C794B98F2B7DEE6ABDFB4BFF001E842A
          EA992DACEADB542B26F1779F45E44C7A3D18FEA312B3CC43950172BFA8C15101
          F02C524C8B879ADE3C72CB96B66DC410A9A2F420587689DDB5F38B909A059E36
          9629D889168CC9B5DB3E35545CAE691AEE0164F256E38F2F2F11E397356AFB2F
          94A5A440E3BFA93F0FA73E1D9EFB3EC0FD2919949B7A1622D5BA8CDB20DC8FA8
          A6289ACEC89450B1CD4CFCB6B0E36E6CB27962AEABC471DBD0ECDEF5B7BB2EA9
          2102D5E26C6F24893655CAA8938C5331C4F10155BF378F85F2FC97A8C37E3656
          34F0641876F669792B4BCA4C357334D18A91D0A69B0249A3615AFF00355242EE
          5455450C46C3FAF11C6DE5F6D6AFB0D55A5B58CAB8F65FC4F5D1F4ADA7596119
          12B4D3279151888B7B0A31AA3672A82405D21517276B8E2247972A5FF1A8CF9E
          B7B4C40A5389BEC3A66CEFB6E69B0C4CDB363764C976283770C14777C5C9266A
          9110BB6F916480E3CBFC3C72AAE1C94C75B26BF2834B6A40B5ECFCAC541EA915
          113C9263AAB855F59676C09C13874BD96EA1629396FD34FF00693C439AFECE6B
          FBF77DB56BDACEBB911ED2DAD61B7004598AD2D1E6A20E4545EC11CAA697A510
          C3A2827EB0FA67E6F98447EDF2F870AE6E557AC08F69CA876EA3E3E6E6E6615C
          A914FA7D466B3F24046E04AB35142CB02FFAC2AE2AFDAF12F02BE5577D9E7555
          FE24B4756A1A7940B8967EE556CB48CD2E2E1EA8C9AFA243201C7950EA2E791D
          F89191285722BD465CDCEAA9E152122123F42DD184C4D49B59F8D129B77678AD
          8E256334485116E3D12BBFC44BA43E6212E6BDFE1E5ABBCD5E2AB1B7A95BAD4B
          06F5AD3ED975290806AF5363792409B2AE95449C704CC713C40556FCDE3E0597
          E4BD618AD557566A60BCE8418F6F269692B4BCA4CB57334D18A91F0A69B0249A
          3615AFF355243D4A8AA8A188D87F5E238DBCBEDAE8FB294A4B4B6E66ABAA7FC4
          F5D234ADA759611712B4D3279151888B7B0A31AA3672A82405D21517276B8E22
          47972A5FF1AAE7CEAEDBE31FB854848BDD739A0A0140280500A0140687C70BE1
          C32E1CBC6AA9C38251F22D5F769E9259DC14BCB3D85DA41BB95DE45BD66D925A
          C40238AD14BF4CDBACD1331310EA8A8A17988B1B7376DB12493F02A8ECECFCC4
          FECD02CE55EEC728E5D28C9337CDDCB16AD9B751C0962A342F48819E043E6CCD
          3FAFDD7EE63A52D0919E3BCBFF00B95CD5371DC5FCAC7B06FB2BA929D4E65CA0
          FE25FB466D9A2B14D1DA8DD55D25C1B34251400112F90A9FCCF30639637BE1A2
          ACA5ED8DFD4B5ED1FEC5A21E4B664371DAB5597D85C2AE09BA0F35A56C9B2134
          DAB8B9259888B60C94457B6259E438DC3C3CD585AB554574BF50DC34FCC8E71B
          2ECBAC6CFB3148CF3D998BD720425C192E947A5D654EEE0484D46ED1131B7C81
          C31FCBC6AFF0D78A7E6C97A644BCCB06A69EF2BEBF1BB0484F8B870FC127AFA3
          7D2A22D12415E2A922D3010702422423D45D5572E17E51CB88E596D8EB7E3055
          7FECD51544374DE1DF6BD7EE7A32BD3504157E96B3749BFA0F488AB74FA26AF4
          BD5929D21B97505511EA7C38F2D745BAF8E99BE3FEBFB0ADFE4D11212BDC4966
          3B58A724EDD41C5C959A5B5E76B34495875C5C0A6449AEB88FA845E117584323
          14C46D62212F8A8BAD56A56B1BF997762D5DD390978DEDFCE4B44BE5239FC6B4
          55E20E13040F9911CB0215D370189FE6F1FBD6AE7C4A6D04A7A14D9DDF762D16
          5051917EAEC4CA4211ECA35BB84DBA2E11731C97548326A920048AA05F6321BD
          BCD5D94EAAC95B5969C0CB1B9B2FF23D1D6CBBB406B5AE6E0F660A4D3955D884
          C44120DC1B2294890FEE3D24C1C64891D843AAA9E43C72E6E154A63A64BBC696
          A456FED6CB7774E425E33B7F392D10F948E7F1AD15788384C103E64472C08574
          DC0627F9BC7EF5AB9B12E568366F42335B7BB3B9D5E46562E56426A46CD0ACC9
          84D346EC87D68A165431106EC15B2666761F99EDF68963E37D335155EBA15A33
          8748D95EED48BB8A4F63918F95649A64F99C8306ADA69B19A8459189A3E90D33
          0C70216FCA37E62B95F96D9294AEBC483B3B52A6CF2B1779A98D85CC907A8906
          44C56419269FECCF4D0494036C820796287364571BF1F65AABD9545ED4B7251E
          5ADF729198EE34E6AC128D9CB72689BC875589A46688815D0728ABFACF9C078A
          9897C37F2F854E4EB46256AADB725EEBD4ABA5B96EF0BAA5B70753CBCB366738
          BC63F8B74DD9269A8D05F9B21248DBA282A2B07297123B8DFC796BA6BD659322
          A5544A32CB6DFD09B8DD8374DA9A6D3391D2E5109C1BD78C22A31345BA882C51
          DE651E92C8A8E0BAC7CB8A24188FDEF1AC2F8D63754F592CF56D167D776375B4
          76E194E22A2916FA49859C75101022455C38974C5C0AA04390DF1CC6FCB58E6C
          5C2F16D8B62D6B250A1377DBA2E2B429B96975A699EDF649B48335D16A9922E1
          743AA928D89A22DEF8E617131533F0BD765FAF8DDAD55A46C63C8DD1DCF7975D
          AE5FBA28CA74CC4167E8EB3749BDD87A445524FA26AF4BD5929D21B97505511E
          A7C38F2D55E0C75CBF1B5B789A2D8FA8BD70BC86B4A3962E1560B386BD641C00
          A77552234F21E558540CADF786B86CB8DE3C997C6F941F2AED9EDFB5EC6EF5FB
          21B1B992370C097DB193D6CCDADDA7590B13759962D9A2AA715B944BE6A78F1C
          8BCBC7BF3E0AD1395E50553883465BCEE6DF5B6C072CA3F959DD9D7D71ABE768
          351166822BAC9F5C136E8370514E925FD664397C38F11AABC35E511ED4889DFD
          0B7B098D8217B8CD3547F24A4D474AC7ACFDA3D729A20ED159B2820AA45E9116
          E8DD1303B5C3932CB8F8F96B1E35B63B592874FF00713B7A89B9F9B92EE3869B
          1B20A42B4671B6969192441151C9F5152492452B3A497444396E4644045ECB0F
          0E6A8C75AAC6DC17B3D57A901B66EEF075551EC1EEC83E519CAB04145E1019BC
          5BD13C5934315D1B26F3E77EB087A423915B947E0B69871579A4D6E2CF7F4277
          B75B14ABEBCEBE5A64A6354449328A97769B741D090277F5892C9374DBE22910
          DB8751203F1BF98712AA7671F15585EEF1442FC8E2D2FB80BED5FE7089098449
          F442BD58F938B26EA87A3729F550E9910AE8912442499E405ECFA6AF9FAFC6B5
          B25B96FEE38E0363DA5C4B8E85B3CF2F15B63554956B28CD36216976042A182C
          924E507002A074F82A980F2F0F35FC784DF152D4592BF8F8AF26529A7EE4525B
          9EED0DAA5B70773CBCB376738BC5BF8B748324C0DA0BF2642491B74503158780
          97123B8DFC796B658F0DAEB1D57E4B466792DFD372535F97D92437CD8209C6D3
          2E04C240118E0062C49ADD2F480E885CAFE8B1CB9AE388AA278F0FCEACF260E3
          8AB78DFD4D2D73EAEA899A440264915ED7B5950C721FBC3958C7F4AB85C2D4D0
          F8A23B96F10BAADB71753CBCB366738BC63F8B74DD9269A8D05F9B21248DBA28
          2A2B0F012E24771BF8F2D7A18F163CD655AA8946396DC537E44D466C1BAED2D7
          699C8E972884E0DEBC6115189A282882C51DE651E92A8A8E0BAC7CB8A24188FD
          EF1ACB2D71E3E2ACA64BD5EAD7916783DA26361ED8B7D922DA87E36FE37D4B46
          677214BD5DD2BDC438970E4EAFFF00159E5C6A997878118ADA494157B8730EB4
          6D99763B048339F808E276AB09460D5BCB20B86476EB8743D3A8DD51C31E9A42
          423E62CAFCBB7C095979326DBC17D90613AAC7B0BA5B448B355362A28B288A51
          A44BA80225D457AAD1401F37F562235CF6BD2ADA8F1231BD8DBB632920FF0041
          8093977E6FE4651AA4E155D614522BA8B0753A60092680623E38F2F1C6DEFA8E
          D56B56F4D855EC5C6B22E280500A0140792898A899277F615AF6BF0FA6AAD4B9
          25152B76F9B58C0AF3525C1B37369160A1B757D18AA22919264B20A1AAA108E3
          939257DB7E1EDAE87964AA3CF59EDE2BAF32631CD764955E363D3E93362B0C7F
          4C396E025724DA26A961964399DED970CB8D4E5CFF0023E4D6A56B4E247A5D9A
          864A2DBB4FC624C9DB0905252325EE4D41EB570E0EE6BD93306E0049AC4459A6
          A010971FAB8176A7448B3A722CEBEA914E7648DD896BA8A4A46B65DAA2A64222
          49B9E9E7D4111B657F95CBEEF1BFD1C29F2D9578F830D6CBC88DB76F589ECF21
          3CE641E3BFC55AD993E8C5C5A93436C39E0963E9ECAE23D53FEB78F8F371A95D
          8BAA71FF00425EB74CE7D4B4A98817EB33FC49CDF5563600808C2709AD64D3F8
          814FD91071614BC8909395471F37B06AD9AEAE938F799BAB4F4D8F2BF6960492
          522ECF1E5B5551C7AA3D5B243D05CEEA75487C51F5564FADF33A62BE1C7C31C7
          96A5F71DDAB3FCBCCBB497E3B92925A331905D5B1C83D4D8395C1D3F8B4CD3BB
          67041D3C44B34D45534EDD01E544C04BC72E3C6F59E3BDAA4713AF6DD5D0D9B5
          F7906E5E3866D5F85D174A34E8D94BA67E069FCE4D70B65C7ECF1FA6A296E0E4
          B22323FB75148BC55F49BC753CF0DA14702925E9EC29342FD6229A4D916E90E7
          F19639170B78F0AD3EC5B75A495A562C9FF13C1876BA1DBDE3105E41F484442A
          A2B4342BB240DB35512B6281010A20E14E8815C43AEA9E3F9D612B4FD8B4BB2D
          D90B1C55A26B6DD610D9B5F7904E5E3866D5F8122E9469D1EA5D33F3A7F3935C
          2D971FB397D358D6DC5974B43819E8EA26D5565213F2726CD46C4CC51589AA1D
          34CB11B9264C9BB43B2988F0CB2C87C71ABDF27968515753A98EA3E99EBE9029
          57AEA45D2376883C5FD3DCDAA1911082022880729171C951322E16CAE54F9A74
          8D8B1CB01A20C1EB8EE05A4D48124E545D6178A7A3F5289393BA8AF4AE0D811E
          63222E702E1C7EAE15B6557D5A260E79DEDC252F25052B79D926925AFA469347
          ADACC4494EB0882A6A89B5500B310B7288887D91B5698FB2E89D63DB62B6DD7A
          1C719DA38B660DDBBB9892958D6CF4E4C231DFA3140DE1A84BF595F4ED9B9A9C
          153231123E9F1E1CBE16A7D87BD770E933EA763EED8C5B9712A4D241F45B09D2
          2526E2D99222DDDA876C1532EAA2A2A912A1CA648A81979BCDCD51F65C2ABFED
          2C9436C9F3816C307F8347A8516D5342CD9B13514F241311C46C98AA0A0780FD
          A1BD67CDABF27A91550A0AE6BBDAD8B865A22EB493F966FAF25D1846AF89BF49
          B7274BA822DD16FD4530E5C95C8878DF1F6D6D93B4ECDCFE4F728A8685DA5802
          44E2ECF1E0EAAAB8F54A6AB921F87DD4BA9D52B7323EAAC9F57E674C57C38F86
          38F2D42ECBE5CBFBBCCBA45B64E3AEF6357629B8559F5D324FD4A164FA89D8AD
          C388754140FD20BD60D2B39271AE30531A767E219A1057633126D2475F409930
          964AED2CE4999DBF755C49BDDBAC90F810E4964256CB2CABA9F72D6E4A372894
          C1ECC7B4B08841398572FDFBF6EABD2946CE5726E9AED1F5D525FD43651BA086
          25D53CB9B21F87863C46A2DDAB3B27E289E3BFA92D0BA5348D985671CBE75313
          8AA42D2D24FECDECA26D44B2E8262D516E908DCF98B9322F88BC07866F359D5D
          63DA38EDE82774A612B2EDA6DBBB731538D00DBA72AC7A365AEDD4F124141709
          2E8A89E5C0B982F895B97878D165B2AF1F02D652D7A11521DAA89750A3141272
          2D06F2032EF1DA176DD674F81415ACB2BD5414487E6858B14C007C3D98D5D766
          CAC9F9682CB7F5363ED7B64A59FC9444E49C3292A492D28DDA5D9920BB94BFFD
          049386CE04143F0CFA788970E61A95D8D155A5E30557E47A4DF6D9292DA8B664
          6764A2E44D95A38ECCBD1F4AEDF2B9E240BB65F22C8B8E45E5F8785678B3358F
          8B5A165F912AE3518E78BC43D7C6A3A9684B29E825CAC90B912591241522C530
          4B9C4B221C31CAD6E5F0A8796D10B44F711FD0AF46768E2998B76EEE624A5A35
          B3D3924E31DFA31409E1A84BF595F4ED9B99F058C8C448FA7C7872F85AB47D8F
          250D19DA93FBEE7B35ED9ACD64655EB5DA665029A5FD44826168DB58CAC98A5C
          A5E8B34FE5808F215AFE1C7CDCD54B65E58D51AD89B50BA28911A574D33246F7
          1E165031C87E91C84C6B29934F028D19DA38A660DDBBB9892958D6CF4E4938C7
          7E8C50378A284BF595F4ED9B99F054C8C448FA7C7872F85ABA6FD96DA850FD0A
          5ABC8EB7DDB18B72E25099C83E8B613844A4DC5B32445BBB50ED82A65D545455
          2254394C905032F379B9AABF3C44A982CAB124F2B0117F805E0924C9AC6D9BFA
          44D26C6489023861614C8398797DE3E358DECEF6F52B4A690465B418B7052779
          774EA66D2AD4E3D51797447A6D142222412F4E9B7E5E7F31647E16E6F0ABBCEF
          F11BB93663A7BA6B14AC7A9B049BB3510F4CDDF2FE8BAEDD3BDAC37E9E0D9348
          8B96DCCA819545EEACF6231A39359EDC8C00C5374E7E4DF47C30E11D1EEBD18A
          416E9124391376C82AA62057F39DEB4CB995E652D4556C5D2B02E280501FFFD9}
        mmHeight = 30956
        mmLeft = 101071
        mmTop = 30956
        mmWidth = 83873
        BandType = 0
      end
      object ppMemo3: TppMemo
        UserName = 'Memo3'
        Caption = 'Memo3'
        CharWrap = False
        Color = clNavy
        Font.Charset = DEFAULT_CHARSET
        Font.Color = 8404992
        Font.Name = 'Times New Roman'
        Font.Size = 10
        Font.Style = [fsItalic]
        Lines.Strings = (
          'Av. Alberto Bins, 665 / 13'#186' andar'
          'CEP. 90030-142 Porto Alegre-RS'
          'Telefone: (51) 3286 5677')
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 13229
        mmLeft = 115623
        mmTop = 59531
        mmWidth = 53181
        BandType = 0
        mmBottomOffset = 0
        mmOverFlowOffset = 0
        mmStopPosition = 0
        mmLeading = 0
      end
    end
    object ace18_detail2: TppDetailBand
      PrintHeight = phDynamic
      mmBottomOffset = 0
      mmHeight = 52652
      mmPrintPosition = 0
      object SRExpCONCM: TppSubReport
        UserName = 'SRExpCONCM'
        ExpandAll = True
        NewPrintJob = False
        OutlineSettings.CreateNode = True
        ParentPrinterSetup = False
        TraverseAllData = False
        DataPipelineName = 'ppBDEREsCONCM'
        mmHeight = 52652
        mmLeft = 0
        mmTop = 529
        mmWidth = 194016
        BandType = 4
        mmBottomOffset = 0
        mmOverFlowOffset = 0
        mmStopPosition = 0
        object ppChildReport1: TppChildReport
          AutoStop = False
          DataPipeline = ppBDEREsCONCM
          PrinterSetup.BinName = 'Default'
          PrinterSetup.DocumentName = 'ACE 18'
          PrinterSetup.PaperName = 'A4'
          PrinterSetup.PrinterName = 'Default'
          PrinterSetup.mmMarginBottom = 5000
          PrinterSetup.mmMarginLeft = 11000
          PrinterSetup.mmMarginRight = 5000
          PrinterSetup.mmMarginTop = 6000
          PrinterSetup.mmPaperHeight = 297011
          PrinterSetup.mmPaperWidth = 210016
          PrinterSetup.PaperSize = 9
          Units = utPrinterPixels
          Version = '7.02'
          mmColumnWidth = 0
          DataPipelineName = 'ppBDEREsCONCM'
          object ppDetailBand1: TppDetailBand
            PrintHeight = phDynamic
            mmBottomOffset = 0
            mmHeight = 6879
            mmPrintPosition = 0
            object SRExpCOItens: TppSubReport
              UserName = 'SRExpCOItens'
              ExpandAll = False
              NewPrintJob = False
              OutlineSettings.CreateNode = True
              TraverseAllData = False
              DataPipelineName = 'ppBDEREsCOItens'
              mmHeight = 5821
              mmLeft = 0
              mmTop = 0
              mmWidth = 194016
              BandType = 4
              mmBottomOffset = 0
              mmOverFlowOffset = 0
              mmStopPosition = 0
              object ppChildReport2: TppChildReport
                AutoStop = False
                DataPipeline = ppBDEREsCOItens
                PrinterSetup.BinName = 'Default'
                PrinterSetup.DocumentName = 'ACE 18'
                PrinterSetup.PaperName = 'A4'
                PrinterSetup.PrinterName = 'Default'
                PrinterSetup.mmMarginBottom = 5000
                PrinterSetup.mmMarginLeft = 11000
                PrinterSetup.mmMarginRight = 5000
                PrinterSetup.mmMarginTop = 6000
                PrinterSetup.mmPaperHeight = 297011
                PrinterSetup.mmPaperWidth = 210016
                PrinterSetup.PaperSize = 9
                Units = utPrinterPixels
                Version = '7.02'
                mmColumnWidth = 0
                DataPipelineName = 'ppBDEREsCOItens'
                object ppTitleBand2: TppTitleBand
                  mmBottomOffset = 0
                  mmHeight = 0
                  mmPrintPosition = 0
                end
                object ppDetailBand2: TppDetailBand
                  mmBottomOffset = 0
                  mmHeight = 4763
                  mmPrintPosition = 0
                  object ppDBText5: TppDBText
                    UserName = 'DBText1'
                    DataField = 'TX_MERCADORIA'
                    DataPipeline = ppBDEREsCOItens
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clBlack
                    Font.Name = 'Arial'
                    Font.Size = 8
                    Font.Style = []
                    Transparent = True
                    DataPipelineName = 'ppBDEREsCOItens'
                    mmHeight = 3175
                    mmLeft = 47890
                    mmTop = 794
                    mmWidth = 88106
                    BandType = 4
                  end
                  object ppDBText6: TppDBText
                    UserName = 'DBText2'
                    DataField = 'PL_MERCADORIA'
                    DataPipeline = ppBDEREsCOItens
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clBlack
                    Font.Name = 'Arial'
                    Font.Size = 8
                    Font.Style = []
                    TextAlignment = taRightJustified
                    Transparent = True
                    DataPipelineName = 'ppBDEREsCOItens'
                    mmHeight = 3175
                    mmLeft = 140229
                    mmTop = 794
                    mmWidth = 9525
                    BandType = 4
                  end
                  object ppDBText7: TppDBText
                    UserName = 'DBText3'
                    DataField = 'VL_MERCADORIA'
                    DataPipeline = ppBDEREsCOItens
                    DisplayFormat = '0.,00'
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clBlack
                    Font.Name = 'Arial'
                    Font.Size = 8
                    Font.Style = []
                    Transparent = True
                    DataPipelineName = 'ppBDEREsCOItens'
                    mmHeight = 3175
                    mmLeft = 169598
                    mmTop = 794
                    mmWidth = 14552
                    BandType = 4
                  end
                  object ppDBText4: TppDBText
                    UserName = 'DBText4'
                    DataField = 'TX_UNID_COMERC'
                    DataPipeline = ppBDEREsCOItens
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clBlack
                    Font.Name = 'Arial'
                    Font.Size = 8
                    Font.Style = []
                    Transparent = True
                    DataPipelineName = 'ppBDEREsCOItens'
                    mmHeight = 3175
                    mmLeft = 150284
                    mmTop = 794
                    mmWidth = 17463
                    BandType = 4
                  end
                end
                object ppSummaryBand2: TppSummaryBand
                  mmBottomOffset = 0
                  mmHeight = 0
                  mmPrintPosition = 0
                end
              end
            end
          end
          object ppFooterBand2: TppFooterBand
            Visible = False
            mmBottomOffset = 0
            mmHeight = 0
            mmPrintPosition = 0
          end
          object ppGroup1: TppGroup
            BreakName = 'NR_NCM_MERCADORIA'
            DataPipeline = ppBDEREsCONCM
            OutlineSettings.CreateNode = True
            ResetPageNo = True
            UserName = 'Group1'
            mmNewColumnThreshold = 0
            mmNewPageThreshold = 0
            DataPipelineName = 'ppBDEREsCONCM'
            object ppGroupHeaderBand1: TppGroupHeaderBand
              PrintHeight = phDynamic
              mmBottomOffset = 0
              mmHeight = 4233
              mmPrintPosition = 0
              object ppDBText1: TppDBText
                UserName = 'DBText1'
                DataField = 'NR_ORDEM'
                DataPipeline = ppBDEREsCONCM
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 8
                Font.Style = []
                ParentDataPipeline = False
                Transparent = True
                DataPipelineName = 'ppBDEREsCONCM'
                mmHeight = 3175
                mmLeft = 7408
                mmTop = 0
                mmWidth = 3969
                BandType = 3
                GroupNo = 0
              end
              object ppDBText2: TppDBText
                UserName = 'DBText2'
                DataField = 'NR_NALADI_MERCADORIA_MSK'
                DataPipeline = ppBDEREsCONCM
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 8
                Font.Style = []
                ParentDataPipeline = False
                Transparent = True
                DataPipelineName = 'ppBDEREsCONCM'
                mmHeight = 3175
                mmLeft = 25929
                mmTop = 0
                mmWidth = 17198
                BandType = 3
                GroupNo = 0
              end
              object ppDBMemo1: TppDBMemo
                UserName = 'DBMemo1'
                CharWrap = False
                DataField = 'TX_NCM'
                DataPipeline = ppBDEREsCONCM
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 8
                Font.Style = []
                ShiftWithParent = True
                Stretch = True
                Transparent = True
                DataPipelineName = 'ppBDEREsCONCM'
                mmHeight = 3175
                mmLeft = 48154
                mmTop = 1058
                mmWidth = 90223
                BandType = 3
                GroupNo = 0
                mmBottomOffset = 0
                mmOverFlowOffset = 0
                mmStopPosition = 0
                mmLeading = 0
              end
            end
            object ppGroupFooterBand1: TppGroupFooterBand
              mmBottomOffset = 0
              mmHeight = 0
              mmPrintPosition = 0
            end
          end
        end
      end
    end
    object ppFooterBand1: TppFooterBand
      mmBottomOffset = 0
      mmHeight = 87577
      mmPrintPosition = 0
      object ppLabel21: TppLabel
        UserName = 'Label20'
        Caption = 'CERTIFICA'#199#195'O DE ORIGEM'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 11
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 4763
        mmLeft = 68263
        mmTop = 32544
        mmWidth = 56886
        BandType = 8
      end
      object ppLabel22: TppLabel
        UserName = 'Label21'
        Caption = '15. Declara'#231#227'o do produtor final ou do exportador:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3175
        mmLeft = 2646
        mmTop = 38365
        mmWidth = 64294
        BandType = 8
      end
      object ppLabel23: TppLabel
        UserName = 'Label22'
        Caption = '16. Certifica'#231#227'o da Entidade Habilitada:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3175
        mmLeft = 97367
        mmTop = 38365
        mmWidth = 49742
        BandType = 8
      end
      object ppMemo2: TppMemo
        UserName = 'Memo2'
        Caption = 
          '    Certificamos a veracidade da declara'#231#227'o que antecede, de aco' +
          'rdo com a'#13#10'legisla'#231#227'o vigente.'#13#10
        CharWrap = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        Lines.Strings = (
          
            '    Certificamos a veracidade da declara'#231#227'o que antecede, de aco' +
            'rdo com a legisla'#231#227'o vigente.')
        Transparent = True
        mmHeight = 9525
        mmLeft = 97367
        mmTop = 43127
        mmWidth = 85990
        BandType = 8
        mmBottomOffset = 0
        mmOverFlowOffset = 0
        mmStopPosition = 0
        mmLeading = 0
      end
      object ppLabel24: TppLabel
        UserName = 'Label23'
        Caption = '___________________________________'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 2646
        mmLeft = 21960
        mmTop = 64029
        mmWidth = 54769
        BandType = 8
      end
      object ppLabel25: TppLabel
        UserName = 'Label24'
        Caption = 'Procurador / Antonio Marcelo G. Costa'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3260
        mmLeft = 24606
        mmTop = 67469
        mmWidth = 48853
        BandType = 8
      end
      object ppSystemVariable1: TppSystemVariable
        UserName = 'SystemVariable1'
        VarType = vtPageNo
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3387
        mmLeft = 184944
        mmTop = 83344
        mmWidth = 1566
        BandType = 8
      end
      object ppLabel28: TppLabel
        UserName = 'Label28'
        Caption = '/'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3387
        mmLeft = 186532
        mmTop = 83344
        mmWidth = 804
        BandType = 8
      end
      object ppSystemVariable2: TppSystemVariable
        UserName = 'SystemVariable2'
        VarType = vtPageCount
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3387
        mmLeft = 187325
        mmTop = 83344
        mmWidth = 1566
        BandType = 8
      end
      object ppLabel30: TppLabel
        UserName = 'Label30'
        Caption = 'Uruguaiana,'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3260
        mmLeft = 34131
        mmTop = 71438
        mmWidth = 15367
        BandType = 8
      end
      object ppSystemVariable3: TppSystemVariable
        UserName = 'SystemVariable3'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3260
        mmLeft = 50271
        mmTop = 71438
        mmWidth = 14139
        BandType = 8
      end
      object ppRichText1: TppRichText
        UserName = 'RichText1'
        Caption = 'RichText1'
        RichText = 
          '{\rtf1\ansi\ansicpg1252\deff0\deflang1046{\fonttbl{\f0\fnil\fcha' +
          'rset0 Arial;}{\f1\fnil MS Sans Serif;}}'#13#10'\viewkind4\uc1\pard\fs1' +
          '4      Declaramos que as mercadorias mencionadas no presente for' +
          'mul\'#39'e1rio foram produzidas no Brasil e est\'#39'e3o de acordo com a' +
          's condi\'#39'e7\'#39'f5es de origem estabelecida no \b Acordo de Complem' +
          'enta\'#39'e7\'#39'e3o Econ\'#39'f4mica n. \'#39'ba 35 (ACE N.\'#39'ba 35)\b0\f1\fs16' +
          '\par'#13#10'}'#13#10
        mmHeight = 9525
        mmLeft = 1323
        mmTop = 43127
        mmWidth = 91281
        BandType = 8
        mmBottomOffset = 0
        mmOverFlowOffset = 0
        mmStopPosition = 0
      end
      object ppLabel27: TppLabel
        UserName = 'Label25'
        Caption = '(carimbo, assinatura)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        Transparent = True
        mmHeight = 2910
        mmLeft = 161661
        mmTop = 73025
        mmWidth = 23019
        BandType = 8
      end
      object ppDBText3: TppDBText
        UserName = 'DBText5'
        DataField = 'EXP1'
        DataPipeline = ppBDEREsCOCapa
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        DataPipelineName = 'ppBDEREsCOCapa'
        mmHeight = 3440
        mmLeft = 7938
        mmTop = 53975
        mmWidth = 79904
        BandType = 8
      end
      object ppLabel20: TppLabel
        UserName = 'Label201'
        Caption = '14. Observa'#231#245'es:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3175
        mmLeft = 2381
        mmTop = 17463
        mmWidth = 22225
        BandType = 8
      end
      object ppLabel19: TppLabel
        UserName = 'Label19'
        Caption = '13. Normas de Origem (c)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3175
        mmLeft = 85725
        mmTop = 794
        mmWidth = 32808
        BandType = 8
      end
      object ppLabel18: TppLabel
        UserName = 'Label18'
        Caption = 'N'#186' de Ordem'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3175
        mmLeft = 2117
        mmTop = 794
        mmWidth = 16404
        BandType = 8
      end
    end
    object ppPageStyle1: TppPageStyle
      EndPage = 0
      SinglePage = 0
      StartPage = 0
      mmBottomOffset = 0
      mmHeight = 280988
      mmPrintPosition = 0
      object ppShape1: TppShape
        UserName = 'Shape1'
        mmHeight = 277019
        mmLeft = 0
        mmTop = 3440
        mmWidth = 188119
        BandType = 9
      end
      object ppShape19: TppShape
        UserName = 'Shape16'
        Brush.Color = clSilver
        Pen.Color = clSilver
        mmHeight = 7144
        mmLeft = 126736
        mmTop = 273051
        mmWidth = 30956
        BandType = 9
      end
      object ppLine1: TppLine
        UserName = 'Line1'
        Weight = 0.750000000000000000
        mmHeight = 3969
        mmLeft = 126736
        mmTop = 273051
        mmWidth = 30956
        BandType = 9
      end
      object ppLine2: TppLine
        UserName = 'Line2'
        Position = lpRight
        Weight = 0.750000000000000000
        mmHeight = 7408
        mmLeft = 119327
        mmTop = 273051
        mmWidth = 7408
        BandType = 9
      end
      object ppLine3: TppLine
        UserName = 'Line3'
        Position = lpRight
        Weight = 0.750000000000000000
        mmHeight = 7408
        mmLeft = 150284
        mmTop = 273051
        mmWidth = 7408
        BandType = 9
      end
      object ppLine5: TppLine
        UserName = 'Line5'
        Position = lpRight
        Weight = 0.750000000000000000
        mmHeight = 44715
        mmLeft = 87842
        mmTop = 235744
        mmWidth = 7408
        BandType = 9
      end
      object ppLine4: TppLine
        UserName = 'Line4'
        Weight = 0.750000000000000000
        mmHeight = 3969
        mmLeft = 0
        mmTop = 235744
        mmWidth = 188130
        BandType = 9
      end
      object ppLine7: TppLine
        UserName = 'Line7'
        Weight = 0.750000000000000000
        mmHeight = 3969
        mmLeft = 0
        mmTop = 230717
        mmWidth = 188130
        BandType = 9
      end
      object ppLine8: TppLine
        UserName = 'Line8'
        Position = lpRight
        Weight = 0.750000000000000000
        mmHeight = 80698
        mmLeft = 87842
        mmTop = 19844
        mmWidth = 7408
        BandType = 9
      end
      object ppLine9: TppLine
        UserName = 'Line9'
        Weight = 0.750000000000000000
        mmHeight = 3969
        mmLeft = 0
        mmTop = 100542
        mmWidth = 188130
        BandType = 9
      end
      object ppLine10: TppLine
        UserName = 'Line10'
        Weight = 0.750000000000000000
        mmHeight = 3969
        mmLeft = 0
        mmTop = 37306
        mmWidth = 95250
        BandType = 9
      end
      object ppLine11: TppLine
        UserName = 'Line101'
        Weight = 0.750000000000000000
        mmHeight = 3969
        mmLeft = 0
        mmTop = 107686
        mmWidth = 188130
        BandType = 9
      end
      object ppLine12: TppLine
        UserName = 'Line102'
        Weight = 0.750000000000000000
        mmHeight = 3969
        mmLeft = 0
        mmTop = 55827
        mmWidth = 95250
        BandType = 9
      end
      object ppLine13: TppLine
        UserName = 'Line13'
        Weight = 0.750000000000000000
        mmHeight = 3969
        mmLeft = 0
        mmTop = 74613
        mmWidth = 188130
        BandType = 9
      end
      object ppLine14: TppLine
        UserName = 'Line14'
        Weight = 0.750000000000000000
        mmHeight = 3969
        mmLeft = 0
        mmTop = 87577
        mmWidth = 188130
        BandType = 9
      end
      object ppLine15: TppLine
        UserName = 'Line15'
        Position = lpRight
        Weight = 0.750000000000000000
        mmHeight = 115094
        mmLeft = 15610
        mmTop = 100542
        mmWidth = 7408
        BandType = 9
      end
      object ppLine16: TppLine
        UserName = 'Line16'
        Weight = 0.750000000000000000
        mmHeight = 3969
        mmLeft = 0
        mmTop = 215636
        mmWidth = 188130
        BandType = 9
      end
      object ppLine17: TppLine
        UserName = 'Line17'
        Weight = 0.750000000000000000
        mmHeight = 3969
        mmLeft = 0
        mmTop = 202671
        mmWidth = 188130
        BandType = 9
      end
      object ppLine18: TppLine
        UserName = 'Line18'
        Weight = 0.750000000000000000
        mmHeight = 3969
        mmLeft = 265
        mmTop = 198702
        mmWidth = 188130
        BandType = 9
      end
      object ppLine19: TppLine
        UserName = 'Line19'
        Position = lpRight
        Weight = 0.750000000000000000
        mmHeight = 98161
        mmLeft = 38629
        mmTop = 100542
        mmWidth = 7408
        BandType = 9
      end
      object ppLine20: TppLine
        UserName = 'Line20'
        Position = lpRight
        Weight = 0.750000000000000000
        mmHeight = 98161
        mmLeft = 133615
        mmTop = 100542
        mmWidth = 7408
        BandType = 9
      end
      object ppLine21: TppLine
        UserName = 'Line201'
        Position = lpRight
        Weight = 0.750000000000000000
        mmHeight = 98161
        mmLeft = 157427
        mmTop = 100542
        mmWidth = 7408
        BandType = 9
      end
      object ppShape2: TppShape
        UserName = 'Shape2'
        Brush.Color = clSilver
        Pen.Color = clSilver
        mmHeight = 8202
        mmLeft = 161925
        mmTop = 20108
        mmWidth = 25929
        BandType = 9
      end
      object ppLine22: TppLine
        UserName = 'Line22'
        Position = lpRight
        Weight = 0.750000000000000000
        mmHeight = 8467
        mmLeft = 154517
        mmTop = 19844
        mmWidth = 7408
        BandType = 9
      end
      object ppLine23: TppLine
        UserName = 'Line23'
        Weight = 0.750000000000000000
        mmHeight = 3969
        mmLeft = 161661
        mmTop = 28046
        mmWidth = 26458
        BandType = 9
      end
      object ppLine6: TppLine
        UserName = 'Line6'
        Weight = 0.750000000000000000
        mmHeight = 3969
        mmLeft = 0
        mmTop = 19844
        mmWidth = 188119
        BandType = 9
      end
    end
    object ppParameterList1: TppParameterList
    end
  end
  object ppBDEREsCOCapa: TppBDEPipeline
    DataSource = dsREsCOCapa
    UserName = 'BDEREsCOCapa'
    Left = 272
    Top = 18
    object ppBDEREsCOCapappField1: TppField
      FieldAlias = 'EXP1'
      FieldName = 'EXP1'
      FieldLength = 80
      DisplayWidth = 80
      Position = 0
    end
    object ppBDEREsCOCapappField2: TppField
      FieldAlias = 'EXP2'
      FieldName = 'EXP2'
      FieldLength = 50
      DisplayWidth = 50
      Position = 1
    end
    object ppBDEREsCOCapappField3: TppField
      FieldAlias = 'EXP3'
      FieldName = 'EXP3'
      FieldLength = 40
      DisplayWidth = 40
      Position = 2
    end
    object ppBDEREsCOCapappField4: TppField
      FieldAlias = 'IMP1'
      FieldName = 'IMP1'
      FieldLength = 100
      DisplayWidth = 100
      Position = 3
    end
    object ppBDEREsCOCapappField5: TppField
      FieldAlias = 'IMP2'
      FieldName = 'IMP2'
      FieldLength = 100
      DisplayWidth = 100
      Position = 4
    end
    object ppBDEREsCOCapappField6: TppField
      FieldAlias = 'IMP3'
      FieldName = 'IMP3'
      FieldLength = 151
      DisplayWidth = 151
      Position = 5
    end
    object ppBDEREsCOCapappField7: TppField
      FieldAlias = 'CONS1'
      FieldName = 'CONS1'
      FieldLength = 100
      DisplayWidth = 100
      Position = 6
    end
    object ppBDEREsCOCapappField8: TppField
      FieldAlias = 'CONS2'
      FieldName = 'CONS2'
      FieldLength = 1
      DisplayWidth = 1
      Position = 7
    end
    object ppBDEREsCOCapappField9: TppField
      FieldAlias = 'CONS3'
      FieldName = 'CONS3'
      FieldLength = 120
      DisplayWidth = 120
      Position = 8
    end
    object ppBDEREsCOCapappField10: TppField
      FieldAlias = 'PORTO'
      FieldName = 'PORTO'
      FieldLength = 50
      DisplayWidth = 50
      Position = 9
    end
    object ppBDEREsCOCapappField11: TppField
      FieldAlias = 'MODAL'
      FieldName = 'MODAL'
      FieldLength = 20
      DisplayWidth = 20
      Position = 10
    end
    object ppBDEREsCOCapappField12: TppField
      FieldAlias = 'DESTINO'
      FieldName = 'DESTINO'
      FieldLength = 120
      DisplayWidth = 120
      Position = 11
    end
    object ppBDEREsCOCapappField13: TppField
      FieldAlias = 'FATURA'
      FieldName = 'FATURA'
      FieldLength = 16
      DisplayWidth = 16
      Position = 12
    end
    object ppBDEREsCOCapappField14: TppField
      FieldAlias = 'DT FATURA'
      FieldName = 'DT FATURA'
      FieldLength = 30
      DisplayWidth = 30
      Position = 13
    end
  end
  object ppBDEREsCOItens: TppBDEPipeline
    DataSource = dsREsCOItens
    UserName = 'BDEREsCOItens'
    Left = 272
    Top = 72
    MasterDataPipelineName = 'ppBDEREsCONCM'
    object ppBDEREsCOItensppField1: TppField
      FieldAlias = 'NR_RE'
      FieldName = 'NR_RE'
      FieldLength = 12
      DisplayWidth = 12
      Position = 0
    end
    object ppBDEREsCOItensppField2: TppField
      FieldAlias = 'NCM_MERCADORIA'
      FieldName = 'NCM_MERCADORIA'
      FieldLength = 8
      DisplayWidth = 8
      Position = 1
    end
    object ppBDEREsCOItensppField3: TppField
      FieldAlias = 'TX_MERCADORIA'
      FieldName = 'TX_MERCADORIA'
      FieldLength = 0
      DataType = dtMemo
      DisplayWidth = 10
      Position = 2
      Searchable = False
      Sortable = False
    end
    object ppBDEREsCOItensppField4: TppField
      Alignment = taRightJustify
      FieldAlias = 'PL_MERCADORIA'
      FieldName = 'PL_MERCADORIA'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 3
    end
    object ppBDEREsCOItensppField5: TppField
      FieldAlias = 'TX_UNID_COMERC'
      FieldName = 'TX_UNID_COMERC'
      FieldLength = 0
      DataType = dtMemo
      DisplayWidth = 10
      Position = 4
      Searchable = False
      Sortable = False
    end
    object ppBDEREsCOItensppField6: TppField
      Alignment = taRightJustify
      FieldAlias = 'PESO_LIQ'
      FieldName = 'PESO_LIQ'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 5
    end
    object ppBDEREsCOItensppField7: TppField
      Alignment = taRightJustify
      FieldAlias = 'VL_MERCADORIA'
      FieldName = 'VL_MERCADORIA'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 6
    end
    object ppBDEREsCOItensppMasterFieldLink1: TppMasterFieldLink
      MasterFieldName = 'NR_NCM_MERCADORIA'
      DetailFieldName = 'NCM_MERCADORIA'
      DetailSortOrder = soAscending
    end
  end
  object ppBDEREsCONCM: TppBDEPipeline
    DataSource = dsREsCONCM
    UserName = 'BDEREsCONCM'
    Left = 272
    Top = 136
    object ppBDEREsCONCMppField1: TppField
      Alignment = taRightJustify
      FieldAlias = 'NR_ORDEM'
      FieldName = 'NR_ORDEM'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 0
    end
    object ppBDEREsCONCMppField2: TppField
      FieldAlias = 'NR_NCM_MERCADORIA_MSK'
      FieldName = 'NR_NCM_MERCADORIA_MSK'
      FieldLength = 10
      DisplayWidth = 10
      Position = 1
    end
    object ppBDEREsCONCMppField3: TppField
      FieldAlias = 'NR_NALADI_MERCADORIA_MSK'
      FieldName = 'NR_NALADI_MERCADORIA_MSK'
      FieldLength = 5
      DisplayWidth = 5
      Position = 2
    end
    object ppBDEREsCONCMppField4: TppField
      FieldAlias = 'NR_NCM_MERCADORIA'
      FieldName = 'NR_NCM_MERCADORIA'
      FieldLength = 8
      DisplayWidth = 8
      Position = 3
    end
    object ppBDEREsCONCMppField5: TppField
      FieldAlias = 'TX_NCM'
      FieldName = 'TX_NCM'
      FieldLength = 0
      DataType = dtMemo
      DisplayWidth = 10
      Position = 4
      Searchable = False
      Sortable = False
    end
  end
end
