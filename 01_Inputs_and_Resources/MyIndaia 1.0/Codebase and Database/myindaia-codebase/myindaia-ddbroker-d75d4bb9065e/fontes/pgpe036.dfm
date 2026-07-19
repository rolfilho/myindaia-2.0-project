object datm_exp_impr_cert_seg: Tdatm_exp_impr_cert_seg
  Left = 55
  Top = 119
  Height = 439
  Width = 911
  object ppDesigner: TppDesigner
    Caption = 'Relatórios'
    Icon.Data = {
      0000010001002020100000000000E80200001600000028000000200000004000
      0000010004000000000080020000000000000000000000000000000000000000
      000000008000008000000080800080000000800080008080000080808000C0C0
      C0000000FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000330000000000000000000000033303303303300000000000000
      0003303330333003003300000000000000033003330330002333000000000000
      0030000033003033333000000000000033333330000003330003330000000803
      33333333333333300233330000000F033333333333333302333BB03000004F83
      33333333333333333BB003BB00004FF3333333333333B33BB0033BBB00004FF3
      33333333B3BB3BB0033BBBB000004FF83B333B3B3B3BBBB03BBBBB0300F04FFF
      33B3B3B3BBBBBBBBBBBB00330FF04FFF8B3B3333BBBBBBBBBB0033330FF044FF
      F8BBB03033BBBBB330333330FFF444FFF8BB0BB3003B330003333330FF44444F
      F88B3BBB300000033333B33FFF44444FFF3BB0BBB3000333B33BB38FF4444444
      FF003B0BB333333BBBBBB3FFF44444444FF00030BBBBBBBBBBBBBBFF44444444
      0000000303BBB3300000BFF444444400000000000000000000000FF444440000
      0000000000000000000000444444000000000000000000000000000044440000
      0000000000000000000000000444000000000000000000000000000000040000
      000000000000000000000000000000000000000000000000000000000000FFFF
      FFFFFFFFFFFFFFFF1FFFFF8003FFFC0000FFF800007FF800007FE000003F0000
      001F0000001F0000000F00000007000000070000000000000000000000000000
      00000000000000000000000000000000000000000000000000000000000000C0
      00000FE01F003FFFFF80FFFFFFC0FFFFFFF0FFFFFFF8FFFFFFFEFFFFFFFF}
    Position = poScreenCenter
    DataSettings.DatabaseName = 'DbBroker'
    DataSettings.SessionType = 'BDESession'
    DataSettings.AllowEditSQL = False
    DataSettings.DatabaseType = dtMSSQLServer
    DataSettings.SQLType = sqBDELocal
    Report = ppReport
    ShowData = False
    Visible = False
    WindowHeight = 480
    WindowLeft = 0
    WindowTop = 0
    WindowWidth = 640
    WindowState = wsMaximized
    Left = 160
    Top = 182
  end
  object ppReport: TppReport
    AutoStop = False
    DataPipeline = ppBDE_Proc
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = 'Report'
    PrinterSetup.PaperName = 'A4 210 x 297 mm'
    PrinterSetup.PrinterName = 'Default'
    PrinterSetup.mmMarginBottom = 5000
    PrinterSetup.mmMarginLeft = 11000
    PrinterSetup.mmMarginRight = 5000
    PrinterSetup.mmMarginTop = 31000
    PrinterSetup.mmPaperHeight = 297000
    PrinterSetup.mmPaperWidth = 210000
    Template.FileName = 'C:\DDBroker\CertSeguroCartaCred.rtm'
    Units = utPrinterPixels
    UserName = 'Report'
    DeviceType = 'Screen'
    Left = 160
    Top = 246
    Version = '4.23 Pro'
    mmColumnWidth = 200000
    object ppHeaderBand1: TppHeaderBand
      PrintHeight = phDynamic
      mmBottomOffset = 0
      mmHeight = 257705
      mmPrintPosition = 0
      object ppDBText1: TppDBText
        UserName = 'DBText1'
        Alignment = taCenter
        DataField = 'NM_LOCAL_PAIS_ORIGEM'
        DataPipeline = ppBDE_CartaCred
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        mmHeight = 3704
        mmLeft = 50536
        mmTop = 200025
        mmWidth = 50006
        BandType = 0
      end
      object ppDBText2: TppDBText
        UserName = 'DBText2'
        AutoSize = True
        DataField = 'CalcNrProcesso'
        DataPipeline = ppBDE_Proc
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        mmHeight = 3704
        mmLeft = 36248
        mmTop = 59796
        mmWidth = 20638
        BandType = 0
      end
      object ppDBMemo1: TppDBMemo
        UserName = 'DBMemo1'
        CharWrap = False
        DataField = 'TX_MARCACAO_VOLUME'
        DataPipeline = ppBDE_Proc
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        Stretch = True
        Transparent = True
        mmHeight = 35190
        mmLeft = 9525
        mmTop = 84138
        mmWidth = 24342
        BandType = 0
        mmBottomOffset = 0
        mmOverFlowOffset = 0
        mmStopPosition = 0
        mmLeading = 0
      end
      object ppDBMemo2: TppDBMemo
        UserName = 'DBMemo2'
        CharWrap = False
        DataField = 'TX_INF_EMBALAGEM'
        DataPipeline = ppBDE_Proc
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        Stretch = True
        Transparent = True
        mmHeight = 35190
        mmLeft = 48683
        mmTop = 84138
        mmWidth = 19050
        BandType = 0
        mmBottomOffset = 0
        mmOverFlowOffset = 0
        mmStopPosition = 0
        mmLeading = 0
      end
      object ppDBText4: TppDBText
        UserName = 'DBText4'
        Alignment = taRightJustify
        DataField = 'VL_PESO_LIQUIDO'
        DataPipeline = ppBDE_Proc
        DisplayFormat = '#,0.000;-#,0.000'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        mmHeight = 3704
        mmLeft = 41275
        mmTop = 145521
        mmWidth = 20108
        BandType = 0
      end
      object ppLabel2: TppLabel
        UserName = 'Label2'
        Caption = 'NET WEIGHT'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 13229
        mmTop = 145521
        mmWidth = 16140
        BandType = 0
      end
      object ppLabel3: TppLabel
        UserName = 'Label3'
        Caption = 'GROSS WEIGHT'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 13229
        mmTop = 150813
        mmWidth = 20902
        BandType = 0
      end
      object ppDBText5: TppDBText
        UserName = 'DBText5'
        Alignment = taRightJustify
        DataField = 'VL_PESO_BRUTO'
        DataPipeline = ppBDE_Proc
        DisplayFormat = '#,0.000;-#,0.000'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        mmHeight = 3704
        mmLeft = 41275
        mmTop = 150813
        mmWidth = 20108
        BandType = 0
      end
      object ppDBText6: TppDBText
        UserName = 'DBText6'
        DataField = 'NM_PAIS_ORIGEM'
        DataPipeline = ppBDE_CartaCred
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        mmHeight = 3704
        mmLeft = 79111
        mmTop = 186532
        mmWidth = 35983
        BandType = 0
      end
      object ppDBText7: TppDBText
        UserName = 'DBText7'
        DataField = 'NM_PAIS_DESTINO'
        DataPipeline = ppBDE_CartaCred
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        mmHeight = 3704
        mmLeft = 131234
        mmTop = 186532
        mmWidth = 35983
        BandType = 0
      end
      object ppDBText8: TppDBText
        UserName = 'DBText8'
        DataField = 'NM_VIA_TRANSPORTE'
        DataPipeline = ppBDE_Proc
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        mmHeight = 3704
        mmLeft = 17992
        mmTop = 200025
        mmWidth = 35983
        BandType = 0
      end
      object ppDBText11: TppDBText
        UserName = 'DBText11'
        AutoSize = True
        DataField = 'CID_EXPORTADOR'
        DataPipeline = ppBDE_Proc
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        mmHeight = 3704
        mmLeft = 17992
        mmTop = 247121
        mmWidth = 24342
        BandType = 0
      end
      object ppDBText14: TppDBText
        UserName = 'DBText14'
        Alignment = taCenter
        DataField = 'VL_SEGURO'
        DataPipeline = ppBDE_Proc
        DisplayFormat = '#,0.00;-#,0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        mmHeight = 3704
        mmLeft = 168011
        mmTop = 200025
        mmWidth = 20902
        BandType = 0
      end
      object ppSystemVariable2: TppSystemVariable
        UserName = 'SystemVariable2'
        AutoSize = False
        DisplayFormat = 'dd        mm        yy'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 105569
        mmTop = 50000
        mmWidth = 24606
        BandType = 0
      end
      object ppLabel4: TppLabel
        UserName = 'Label4'
        Alignment = taCenter
        Caption = 'KGS'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 62442
        mmTop = 145521
        mmWidth = 5821
        BandType = 0
      end
      object ppLabel5: TppLabel
        UserName = 'Label5'
        Alignment = taCenter
        Caption = 'KGS'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 62442
        mmTop = 150813
        mmWidth = 5821
        BandType = 0
      end
      object ppDBText17: TppDBText
        UserName = 'DBText17'
        DataField = 'NR_AVERBACAO'
        DataPipeline = ppBDE_Processo
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        mmHeight = 3704
        mmLeft = 36513
        mmTop = 50000
        mmWidth = 17198
        BandType = 0
      end
      object ppDBText3: TppDBText
        UserName = 'DBText3'
        Alignment = taRightJustify
        DataField = 'VL_TOT_MCV_SEG'
        DataPipeline = ppBDE_Proc
        DisplayFormat = '#,0.00;-#,0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        mmHeight = 3704
        mmLeft = 168805
        mmTop = 84402
        mmWidth = 19050
        BandType = 0
      end
      object ppLabel6: TppLabel
        UserName = 'Label6'
        Caption = '(CIF + 10%)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 172773
        mmTop = 88371
        mmWidth = 15081
        BandType = 0
      end
      object ppDBMemo5: TppDBMemo
        UserName = 'DBMemo5'
        CharWrap = False
        DataField = 'TX_MERCADORIA'
        DataPipeline = ppBDE_Processo
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        Stretch = True
        Transparent = True
        mmHeight = 35190
        mmLeft = 81227
        mmTop = 84138
        mmWidth = 76200
        BandType = 0
        mmBottomOffset = 0
        mmOverFlowOffset = 0
        mmStopPosition = 0
        mmLeading = 0
      end
      object ppLabel7: TppLabel
        UserName = 'Label7'
        Caption = '- X - '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 21696
        mmTop = 186532
        mmWidth = 6350
        BandType = 0
      end
      object ppDBText15: TppDBText
        UserName = 'DBText101'
        Alignment = taCenter
        DataField = 'NM_LOCAL_DESTINO'
        DataPipeline = ppBDE_CartaCred
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        mmHeight = 3704
        mmLeft = 104246
        mmTop = 200025
        mmWidth = 50006
        BandType = 0
      end
      object ppDBMemo4: TppDBMemo
        UserName = 'DBMemo4'
        CharWrap = False
        DataField = 'END_AGENTE_SEGURO'
        DataPipeline = ppBDE_AgenteSeg
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        Stretch = True
        Transparent = True
        mmHeight = 4498
        mmLeft = 43921
        mmTop = 235215
        mmWidth = 136790
        BandType = 0
        mmBottomOffset = 0
        mmOverFlowOffset = 0
        mmStopPosition = 0
        mmLeading = 0
      end
      object ppDBMemo3: TppDBMemo
        UserName = 'DBMemo3'
        CharWrap = False
        DataField = 'TX_TERMO_PAGTO'
        DataPipeline = ppBDE_Proc
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 16669
        mmLeft = 13229
        mmTop = 126471
        mmWidth = 177800
        BandType = 0
        mmBottomOffset = 0
        mmOverFlowOffset = 0
        mmStopPosition = 0
        mmLeading = 0
      end
      object ppDBText9: TppDBText
        UserName = 'DBText9'
        DataField = 'AP_MOEDA'
        DataPipeline = ppBDE_Proc
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        mmHeight = 3704
        mmLeft = 158486
        mmTop = 84402
        mmWidth = 10583
        BandType = 0
      end
      object ppDBText16: TppDBText
        UserName = 'DBText16'
        DataField = 'AP_MOEDA'
        DataPipeline = ppBDE_Proc
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        mmHeight = 3704
        mmLeft = 157163
        mmTop = 200025
        mmWidth = 10583
        BandType = 0
      end
      object ppDBMemo6: TppDBMemo
        UserName = 'DBMemo6'
        CharWrap = False
        DataField = 'NM_AGENTE_SEGURO'
        DataPipeline = ppBDE_AgenteSeg
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        Stretch = True
        Transparent = True
        mmHeight = 4498
        mmLeft = 43921
        mmTop = 225955
        mmWidth = 136790
        BandType = 0
        mmBottomOffset = 0
        mmOverFlowOffset = 0
        mmStopPosition = 0
        mmLeading = 0
      end
      object ppDBText18: TppDBText
        UserName = 'DBText18'
        DataField = 'NR_CONTRATO_SEGURO'
        DataPipeline = ppBDE_Processo
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        mmHeight = 3704
        mmLeft = 157427
        mmTop = 37306
        mmWidth = 16669
        BandType = 0
      end
      object ppDBMemo7: TppDBMemo
        UserName = 'DBMemo7'
        CharWrap = False
        DataField = 'TX_EXPORTADOR'
        DataPipeline = ppBDE_CartaCred
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        mmHeight = 3704
        mmLeft = 51858
        mmTop = 20108
        mmWidth = 78317
        BandType = 0
        mmBottomOffset = 0
        mmOverFlowOffset = 0
        mmStopPosition = 0
        mmLeading = 0
      end
    end
    object ppDetailBand1: TppDetailBand
      mmBottomOffset = 0
      mmHeight = 0
      mmPrintPosition = 0
    end
    object ppFooterBand1: TppFooterBand
      mmBottomOffset = 0
      mmHeight = 0
      mmPrintPosition = 0
    end
  end
  object Tunid: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'select cd_unid_neg, nm_unid_neg from tunid_neg')
    Left = 352
    Top = 16
    object Tunidcd_unid_neg: TStringField
      FieldName = 'cd_unid_neg'
      Size = 2
    end
    object Tunidnm_unid_neg: TStringField
      FieldName = 'nm_unid_neg'
      Size = 50
    end
  end
  object Dts_Unid: TDataSource
    DataSet = Tunid
    Left = 352
    Top = 72
  end
  object Tncm: TQuery
    DatabaseName = 'DbBroker'
    SQL.Strings = (
      'select * from tncm'
      '')
    Left = 159
    Top = 16
  end
  object Dts_Ncm: TDataSource
    DataSet = Tncm
    Left = 159
    Top = 72
  end
  object ppBDE_Ncm: TppBDEPipeline
    DataSource = Dts_Ncm
    SkipWhenNoRecords = False
    UserName = 'BDE_Ncm'
    Left = 159
    Top = 128
    object ppBDE_NcmppField1: TppField
      FieldAlias = 'CODIGO'
      FieldName = 'CODIGO'
      FieldLength = 0
      DisplayWidth = 0
      Position = 0
    end
    object ppBDE_NcmppField2: TppField
      FieldAlias = 'DESCRICAO'
      FieldName = 'DESCRICAO'
      FieldLength = 120
      DisplayWidth = 120
      Position = 1
    end
    object ppBDE_NcmppField3: TppField
      FieldAlias = 'UNIDADE_MEDIDA'
      FieldName = 'UNIDADE_MEDIDA'
      FieldLength = 4
      DisplayWidth = 4
      Position = 2
    end
    object ppBDE_NcmppField4: TppField
      FieldAlias = 'ALIQUOTA_II'
      FieldName = 'ALIQUOTA_II'
      FieldLength = 6
      DisplayWidth = 6
      Position = 3
    end
    object ppBDE_NcmppField5: TppField
      FieldAlias = 'DATA_INICIO_VIG_II'
      FieldName = 'DATA_INICIO_VIG_II'
      FieldLength = 10
      DisplayWidth = 10
      Position = 4
    end
    object ppBDE_NcmppField6: TppField
      FieldAlias = 'DATA_FIM_VIG_II'
      FieldName = 'DATA_FIM_VIG_II'
      FieldLength = 10
      DisplayWidth = 10
      Position = 5
    end
    object ppBDE_NcmppField7: TppField
      FieldAlias = 'ALIQUOTA_II_MERCOSUL'
      FieldName = 'ALIQUOTA_II_MERCOSUL'
      FieldLength = 6
      DisplayWidth = 6
      Position = 6
    end
    object ppBDE_NcmppField8: TppField
      FieldAlias = 'DATA_INICIO_VIG_II_MSUL'
      FieldName = 'DATA_INICIO_VIG_II_MSUL'
      FieldLength = 10
      DisplayWidth = 10
      Position = 7
    end
    object ppBDE_NcmppField9: TppField
      FieldAlias = 'DATA_FIM_VIG_II_MSUL'
      FieldName = 'DATA_FIM_VIG_II_MSUL'
      FieldLength = 10
      DisplayWidth = 10
      Position = 8
    end
    object ppBDE_NcmppField10: TppField
      FieldAlias = 'ALIQUOTA_IPI'
      FieldName = 'ALIQUOTA_IPI'
      FieldLength = 6
      DisplayWidth = 6
      Position = 9
    end
    object ppBDE_NcmppField11: TppField
      FieldAlias = 'DATA_INICIO_VIG_IPI'
      FieldName = 'DATA_INICIO_VIG_IPI'
      FieldLength = 10
      DisplayWidth = 10
      Position = 10
    end
    object ppBDE_NcmppField12: TppField
      FieldAlias = 'DATA_FIM_VIG_IPI'
      FieldName = 'DATA_FIM_VIG_IPI'
      FieldLength = 10
      DisplayWidth = 10
      Position = 11
    end
  end
  object TAgenteSeg: TQuery
    DatabaseName = 'DbBroker'
    SQL.Strings = (
      
        'SELECT LTRIM( RTRIM( ISNULL( E.NM_EMPRESA, "" ) ) ) AS NM_AGENTE' +
        '_SEGURO,'
      '       LTRIM( RTRIM( ISNULL( E.END_EMPRESA, "" ) ) ) +'
      
        '       CASE LTRIM( RTRIM( ISNULL( E.END_NUMERO, "" ) ) ) WHEN ""' +
        ' THEN "" ELSE ", " END + LTRIM( RTRIM( ISNULL( E.END_NUMERO, "" ' +
        ') ) ) +'
      
        '       CASE LTRIM( RTRIM( ISNULL( E.END_COMPL, "" ) ) ) WHEN "" ' +
        'THEN "" ELSE " - " END + LTRIM( RTRIM( ISNULL( E.END_COMPL, "" )' +
        ' ) ) +'
      
        '       CASE LTRIM( RTRIM( ISNULL( E.END_CIDADE, "" ) ) ) WHEN ""' +
        ' THEN "" ELSE " - " END + LTRIM( RTRIM( ISNULL( E.END_CIDADE, ""' +
        ' ) ) )'
      '       AS END_AGENTE_SEGURO'
      'FROM   TEMPRESA_EST E, TPROCESSO P'
      'WHERE  P.NR_PROCESSO = :NR_PROCESSO AND'
      '       P.CD_AGENTE_SEGURO *= E.CD_EMPRESA')
    Params.Data = {010001000B4E525F50524F434553534F0001020030000000}
    Left = 98
    Top = 16
  end
  object Dts_AgenteSeg: TDataSource
    DataSet = TAgenteSeg
    Left = 98
    Top = 72
  end
  object ppBDE_AgenteSeg: TppBDEPipeline
    DataSource = Dts_AgenteSeg
    SkipWhenNoRecords = False
    UserName = 'BDE_AgenteSeg'
    Left = 98
    Top = 128
    object ppBDE_AgenteSegppField1: TppField
      FieldAlias = 'NM_AGENTE_SEGURO'
      FieldName = 'NM_AGENTE_SEGURO'
      FieldLength = 0
      DisplayWidth = 0
      Position = 0
    end
    object ppBDE_AgenteSegppField2: TppField
      FieldAlias = 'END_AGENTE_SEGURO'
      FieldName = 'END_AGENTE_SEGURO'
      FieldLength = 145
      DisplayWidth = 145
      Position = 1
    end
  end
  object TProc: TQuery
    DatabaseName = 'DbBroker'
    SQL.Strings = (
      
        'SELECT P.NR_PROCESSO AS NR_PROCESSO, LTRIM( RTRIM( NM_SIGLA ) ) ' +
        '+ "-" +  SUBSTRING( P.NR_PROCESSO, 5, 14 ) +'
      
        '       CASE LTRIM( RTRIM( ISNULL( P.NR_FATURA, "" ) ) ) WHEN "" ' +
        'THEN ""'
      
        '       WHEN SUBSTRING( P.NR_PROCESSO, 5, 14 ) THEN "" ELSE " / "' +
        ' +'
      
        '       LTRIM( RTRIM( ISNULL( P.NR_FATURA, "" ) ) ) END AS CalcNr' +
        'Processo,'
      
        '       P.CD_EXPORTADOR AS CD_EXPORTADOR, P.CD_IMPORTADOR AS CD_I' +
        'MPORTADOR, P.CD_CONSIGNATARIO AS CD_CONSIGNATARIO,'
      
        '       P.CD_VIA_TRANSPORTE AS CD_VIA_TRANSPORTE, P.CD_LOCAL_ORIG' +
        'EM AS CD_LOCAL_ORIGEM,'
      
        '       P.CD_LOCAL_DESTINO AS CD_LOCAL_DESTINO, P.TP_CONSIGNATARI' +
        'O AS TP_CONSIGNATARIO,'
      
        '       P.TX_INF_EMBALAGEM AS TX_INF_EMBALAGEM, P.TX_MARCACAO_VOL' +
        'UME AS TX_MARCACAO_VOLUME,'
      
        '       P.TX_DECL_ADICIONAL AS TX_DECL_ADICIONAL, P.VL_PESO_BRUTO' +
        ' AS VL_PESO_BRUTO,'
      
        '       P.VL_PESO_LIQUIDO AS VL_PESO_LIQUIDO, P.CD_MOEDA, M.AP_MO' +
        'EDA, P.TX_TERMO_PAGTO, S.CD_UNID_NEG,'
      
        '       ( ( P.VL_TOT_MCV / 100 ) * PA.PC_SEGURO_EXP ) + P.VL_TOT_' +
        'MCV AS VL_TOT_MCV_SEG,'
      '       P.VL_SEGURO, EXP.NM_EMPRESA AS NM_EXPORTADOR,'
      '       LTRIM( RTRIM( ISNULL( EXP.END_CIDADE, "" ) ) ) + " - " +'
      '       CASE P.CD_LINGUA_PEDIDO'
      
        '          WHEN "0" THEN RIGHT( "0" + CONVERT( varchar(2), DATEPA' +
        'RT( dd, GETDATE() ) ), 2 ) + " de " +'
      '              CASE DATEPART( m, GETDATE() )'
      '                 WHEN 1 THEN "Janeiro"'
      '                 WHEN 2 THEN "Fevereiro"'
      '                 WHEN 3 THEN "Março"'
      '                 WHEN 4 THEN "Abril"'
      '                 WHEN 5 THEN "Maio"'
      '                 WHEN 6 THEN "Junho"'
      '                 WHEN 7 THEN "Julho"'
      '                 WHEN 8 THEN "Agosto"'
      '                 WHEN 9 THEN "Setembro"'
      '                 WHEN 10 THEN "Outubro"'
      '                 WHEN 11 THEN "Novembro"'
      '                 WHEN 12 THEN "Dezembro"'
      
        '              END + " de " + CONVERT(char(4), DATEPART( yyyy, GE' +
        'TDATE() ) )'
      '          WHEN "1" THEN'
      '              CASE DATEPART( m, GETDATE() )'
      '                 WHEN 1 THEN "January"'
      '                 WHEN 2 THEN "February"'
      '                 WHEN 3 THEN "March"'
      '                 WHEN 4 THEN "April"'
      '                 WHEN 5 THEN "May"'
      '                 WHEN 6 THEN "June"'
      '                 WHEN 7 THEN "July"'
      '                 WHEN 8 THEN "August"'
      '                 WHEN 9 THEN "September"'
      '                 WHEN 10 THEN "October"'
      '                 WHEN 11 THEN "November"'
      '                 WHEN 12 THEN "December"'
      
        '              END + " " + RIGHT( "0" + CONVERT( varchar(2), DATE' +
        'PART( dd, GETDATE() ) ), 2 ) +'
      
        '              CASE RIGHT( CONVERT( varchar(2), DATEPART( d, GETD' +
        'ATE() ) ), 1 )'
      '                 WHEN "1" THEN "st"'
      '                 WHEN "2" THEN "nd"'
      '                 ELSE "th"'
      
        '              END + ", " + CONVERT( char(4), DATEPART( yyyy, GET' +
        'DATE() ) )'
      
        '          WHEN "2" THEN RIGHT( "0" + CONVERT( varchar(2), DATEPA' +
        'RT( dd, GETDATE() ) ), 2 ) + " de " +'
      '              CASE DATEPART( m, GETDATE() )'
      '                 WHEN 1 THEN "Enero"'
      '                 WHEN 2 THEN "Febrero"'
      '                 WHEN 3 THEN "Marzo"'
      '                 WHEN 4 THEN "Abril"'
      '                 WHEN 5 THEN "Mayo"'
      '                 WHEN 6 THEN "Junio"'
      '                 WHEN 7 THEN "Julio"'
      '                 WHEN 8 THEN "Agosto"'
      '                 WHEN 9 THEN "Septiembre"'
      '                 WHEN 10 THEN "Octubre"'
      '                 WHEN 11 THEN "Noviembre"'
      '                 WHEN 12 THEN "Diciembre"'
      
        '              END  + " de " + CONVERT( char(4), DATEPART( yyyy, ' +
        'GETDATE() ) )'
      '       END AS CID_EXPORTADOR,'
      '       CASE P.CD_LINGUA_PEDIDO'
      '          WHEN '#39'1'#39' THEN V.NM_VIA_TRANSP_INGLES'
      '          WHEN '#39'2'#39' THEN V.NM_VIA_TRANSP_ESP'
      '          ELSE V.NM_VIA_TRANSP'
      '       END AS NM_VIA_TRANSPORTE,'
      '       LO.DESCRICAO AS NM_LOCAL_ORIGEM,'
      '       LD.DESCRICAO AS NM_LOCAL_DESTINO'
      
        'FROM   TPROCESSO_EXP P, TPARAMETROS PA, TMOEDA_BROKER M, TVIA_TR' +
        'ANSP_BROKER V,'
      
        '       TLOCAL_EMBARQUE LO, TLOCAL_EMBARQUE LD, TEMPRESA_NAC EXP,' +
        ' TUNID_NEG U, TPROCESSO S'
      'WHERE  P.NR_PROCESSO = S.NR_PROCESSO AND'
      '       S.CD_UNID_NEG = U.CD_UNID_NEG AND'
      '       P.CD_MOEDA *= M.CD_MOEDA AND'
      '       P.CD_VIA_TRANSPORTE *= V.CD_VIA_TRANSP AND'
      '       P.CD_LOCAL_ORIGEM *= LO.CODIGO AND'
      '       P.CD_LOCAL_DESTINO *= LD.CODIGO AND'
      '       P.CD_EXPORTADOR *= EXP.CD_EMPRESA AND'
      '       P.NR_PROCESSO = :NR_PROCESSO'
      '')
    Params.Data = {010001000B4E525F50524F434553534F0001020030000000}
    Left = 28
    Top = 16
  end
  object Dts_Proc: TDataSource
    DataSet = TProc
    Left = 28
    Top = 72
  end
  object ppBDE_Proc: TppBDEPipeline
    DataSource = Dts_Proc
    SkipWhenNoRecords = False
    UserName = 'BDE_Proc'
    Left = 28
    Top = 128
  end
  object Tprocesso: TQuery
    DatabaseName = 'DbBroker'
    SQL.Strings = (
      
        'SELECT P.CD_UNID_NEG, P.CD_PRODUTO, P.NR_PROCESSO, P.NR_AVERBACA' +
        'O, P.CD_PAIS_ORIGEM,'
      
        '       P.CD_PAIS_DESTINO, P.NR_AVERBACAO, P.VL_PREMIO_SEGURO, P.' +
        'CD_AGENTE_SEGURO,'
      '       P.TX_MERCADORIA,'
      '       CASE PE.CD_LINGUA_PEDIDO'
      '          WHEN '#39'1'#39' THEN PO.NM_PAIS_ING'
      '          WHEN '#39'2'#39' THEN PO.NM_PAIS_ESP'
      '          ELSE PO.NM_PAIS_PORT'
      '       END AS NM_PAIS_ORIGEM,'
      '       CASE PE.CD_LINGUA_PEDIDO'
      '          WHEN '#39'1'#39' THEN PD.NM_PAIS_ING'
      '          WHEN '#39'2'#39' THEN PD.NM_PAIS_ESP'
      '          ELSE PD.NM_PAIS_PORT'
      '       END AS NM_PAIS_DESTINO,'
      '       CASE ISNULL( H.NR_CONTRATO_SEGURO, '#39'EM EMISSAO'#39' )'
      '         WHEN '#39#39' THEN '#39'EM EMISSAO'#39
      '         ELSE ISNULL( H.NR_CONTRATO_SEGURO, '#39'EM EMISSAO'#39' )'
      '       END AS NR_CONTRATO_SEGURO '
      
        'FROM   TPROCESSO P, TPROCESSO_EXP PE, TPAIS_BROKER PO, TPAIS_BRO' +
        'KER PD, TCLIENTE_HABILITACAO H'
      'WHERE  P.NR_PROCESSO = :NR_PROCESSO AND'
      '       P.CD_UNID_NEG = H.CD_UNID_NEG AND'
      '       P.CD_PRODUTO = H.CD_PRODUTO AND'
      '       P.CD_CLIENTE = H.CD_CLIENTE AND'
      '       P.NR_PROCESSO = PE.NR_PROCESSO AND'
      '       P.CD_PAIS_ORIGEM *= PO.CD_PAIS AND'
      '       P.CD_PAIS_DESTINO *= PD.CD_PAIS'
      '')
    Params.Data = {010001000B4E525F50524F434553534F0001020030000000}
    Left = 225
    Top = 16
  end
  object Dts_Processo: TDataSource
    DataSet = Tprocesso
    Left = 225
    Top = 72
  end
  object ppBDE_Processo: TppBDEPipeline
    DataSource = Dts_Processo
    SkipWhenNoRecords = False
    UserName = 'BDE_Processo'
    Left = 225
    Top = 128
    object ppBDE_ProcessoppField1: TppField
      FieldAlias = 'CD_UNID_NEG'
      FieldName = 'CD_UNID_NEG'
      FieldLength = 0
      DisplayWidth = 0
      Position = 0
    end
    object ppBDE_ProcessoppField2: TppField
      FieldAlias = 'CD_PRODUTO'
      FieldName = 'CD_PRODUTO'
      FieldLength = 2
      DisplayWidth = 2
      Position = 1
    end
    object ppBDE_ProcessoppField3: TppField
      FieldAlias = 'NR_PROCESSO'
      FieldName = 'NR_PROCESSO'
      FieldLength = 18
      DisplayWidth = 18
      Position = 2
    end
    object ppBDE_ProcessoppField4: TppField
      FieldAlias = 'NR_AVERBACAO'
      FieldName = 'NR_AVERBACAO'
      FieldLength = 10
      DisplayWidth = 10
      Position = 3
    end
    object ppBDE_ProcessoppField5: TppField
      FieldAlias = 'CD_PAIS_ORIGEM'
      FieldName = 'CD_PAIS_ORIGEM'
      FieldLength = 3
      DisplayWidth = 3
      Position = 4
    end
    object ppBDE_ProcessoppField6: TppField
      FieldAlias = 'CD_PAIS_DESTINO'
      FieldName = 'CD_PAIS_DESTINO'
      FieldLength = 3
      DisplayWidth = 3
      Position = 5
    end
    object ppBDE_ProcessoppField7: TppField
      FieldAlias = 'NR_AVERBACAO_1'
      FieldName = 'NR_AVERBACAO_1'
      FieldLength = 10
      DisplayWidth = 10
      Position = 6
    end
    object ppBDE_ProcessoppField8: TppField
      Alignment = taRightJustify
      FieldAlias = 'VL_PREMIO_SEGURO'
      FieldName = 'VL_PREMIO_SEGURO'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 7
    end
    object ppBDE_ProcessoppField9: TppField
      FieldAlias = 'CD_AGENTE_SEGURO'
      FieldName = 'CD_AGENTE_SEGURO'
      FieldLength = 5
      DisplayWidth = 5
      Position = 8
    end
    object ppBDE_ProcessoppField10: TppField
      FieldAlias = 'TX_MERCADORIA'
      FieldName = 'TX_MERCADORIA'
      FieldLength = 0
      DataType = dtMemo
      DisplayWidth = 10
      Position = 9
      Searchable = False
      Sortable = False
    end
    object ppBDE_ProcessoppField11: TppField
      FieldAlias = 'NM_PAIS_ORIGEM'
      FieldName = 'NM_PAIS_ORIGEM'
      FieldLength = 50
      DisplayWidth = 50
      Position = 10
    end
    object ppBDE_ProcessoppField12: TppField
      FieldAlias = 'NM_PAIS_DESTINO'
      FieldName = 'NM_PAIS_DESTINO'
      FieldLength = 50
      DisplayWidth = 50
      Position = 11
    end
    object ppBDE_ProcessoppField13: TppField
      FieldAlias = 'NR_CONTRATO_SEGURO'
      FieldName = 'NR_CONTRATO_SEGURO'
      FieldLength = 10
      DisplayWidth = 10
      Position = 12
    end
  end
  object TParametros: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT PC_SEGURO_EXP'
      'FROM TPARAMETROS')
    Left = 417
    Top = 16
  end
  object TCartaCred: TQuery
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      
        'SELECT NR_PROCESSO, TX_EXPORTADOR, NM_PAIS_ORIGEM, NM_PAIS_DESTI' +
        'NO,'
      
        '       LTRIM( RTRIM( ISNULL( NM_LOCAL_ORIGEM, "" ) ) ) + "/" + L' +
        'TRIM( RTRIM( ISNULL( NM_PAIS_ORIGEM, "" ) ) ) AS NM_LOCAL_PAIS_O' +
        'RIGEM,'
      '       NM_LOCAL_DESTINO'
      'FROM   TEXP_CARTA_CRED ( NOLOCK )'
      'WHERE  NR_PROCESSO = :NR_PROCESSO')
    Params.Data = {
      010001000B4E525F50524F434553534F00010F003031303245412D303030312D
      3030000001}
    Left = 292
    Top = 16
    object TCartaCredNR_PROCESSO: TStringField
      FieldName = 'NR_PROCESSO'
      Size = 18
    end
    object TCartaCredTX_EXPORTADOR: TMemoField
      FieldName = 'TX_EXPORTADOR'
      BlobType = ftMemo
    end
    object TCartaCredNM_PAIS_ORIGEM: TStringField
      FieldName = 'NM_PAIS_ORIGEM'
      Size = 120
    end
    object TCartaCredNM_PAIS_DESTINO: TStringField
      FieldName = 'NM_PAIS_DESTINO'
      Size = 120
    end
    object TCartaCredNM_LOCAL_PAIS_ORIGEM: TStringField
      FieldName = 'NM_LOCAL_PAIS_ORIGEM'
      Size = 171
    end
    object TCartaCredNM_LOCAL_DESTINO: TStringField
      FieldName = 'NM_LOCAL_DESTINO'
      Size = 50
    end
  end
  object Dts_CartaCred: TDataSource
    AutoEdit = False
    DataSet = TCartaCred
    Left = 292
    Top = 72
  end
  object ppBDE_CartaCred: TppBDEPipeline
    DataSource = Dts_CartaCred
    SkipWhenNoRecords = False
    UserName = 'BDE_CartaCred'
    Left = 292
    Top = 128
    object ppBDE_CartaCredppField1: TppField
      FieldAlias = 'NR_PROCESSO'
      FieldName = 'NR_PROCESSO'
      FieldLength = 0
      DisplayWidth = 0
      Position = 0
    end
    object ppBDE_CartaCredppField2: TppField
      FieldAlias = 'TX_EXPORTADOR'
      FieldName = 'TX_EXPORTADOR'
      FieldLength = 0
      DataType = dtMemo
      DisplayWidth = 10
      Position = 1
      Searchable = False
      Sortable = False
    end
    object ppBDE_CartaCredppField3: TppField
      FieldAlias = 'NM_PAIS_ORIGEM'
      FieldName = 'NM_PAIS_ORIGEM'
      FieldLength = 120
      DisplayWidth = 120
      Position = 2
    end
    object ppBDE_CartaCredppField4: TppField
      FieldAlias = 'NM_PAIS_DESTINO'
      FieldName = 'NM_PAIS_DESTINO'
      FieldLength = 120
      DisplayWidth = 120
      Position = 3
    end
    object ppBDE_CartaCredppField5: TppField
      FieldAlias = 'NM_LOCAL_PAIS_ORIGEM'
      FieldName = 'NM_LOCAL_PAIS_ORIGEM'
      FieldLength = 171
      DisplayWidth = 171
      Position = 4
    end
    object ppBDE_CartaCredppField6: TppField
      FieldAlias = 'NM_LOCAL_DESTINO'
      FieldName = 'NM_LOCAL_DESTINO'
      FieldLength = 50
      DisplayWidth = 50
      Position = 5
    end
  end
end
