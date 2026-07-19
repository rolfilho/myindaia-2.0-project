object frm_packing_list2: Tfrm_packing_list2
  Left = 430
  Top = 259
  Width = 330
  Height = 258
  BorderIcons = [biSystemMenu]
  Caption = 'Impress'#227'o do Packing List'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnClose = FormClose
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 314
    Height = 220
    Align = alClient
    BevelInner = bvLowered
    BevelOuter = bvNone
    BorderWidth = 4
    TabOrder = 0
    object Shape1: TShape
      Left = 10
      Top = 10
      Width = 300
      Height = 25
      Brush.Style = bsClear
      Pen.Color = clGray
    end
    object Label1: TLabel
      Left = 16
      Top = 15
      Width = 85
      Height = 16
      Caption = 'Packing List'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clGray
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = True
    end
    object SpeedButton1: TSpeedButton
      Left = 193
      Top = 193
      Width = 117
      Height = 28
      Caption = '&Emitir Packing List'
      Flat = True
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        04000000000000010000120B0000120B00001000000000000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00300000000000
        0003377777777777777308888888888888807F33333333333337088888888888
        88807FFFFFFFFFFFFFF7000000000000000077777777777777770F8F8F8F8F8F
        8F807F333333333333F708F8F8F8F8F8F9F07F333333333337370F8F8F8F8F8F
        8F807FFFFFFFFFFFFFF7000000000000000077777777777777773330FFFFFFFF
        03333337F3FFFF3F7F333330F0000F0F03333337F77773737F333330FFFFFFFF
        03333337F3FF3FFF7F333330F00F000003333337F773777773333330FFFF0FF0
        33333337F3F37F3733333330F08F0F0333333337F7337F7333333330FFFF0033
        33333337FFFF7733333333300000033333333337777773333333}
      NumGlyphs = 2
      OnClick = SpeedButton1Click
    end
    object Shape2: TShape
      Left = 10
      Top = 36
      Width = 300
      Height = 152
      Brush.Style = bsClear
      Pen.Color = clGray
    end
    object Label2: TLabel
      Left = 28
      Top = 93
      Width = 53
      Height = 13
      Caption = 'Processo'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label3: TLabel
      Left = 28
      Top = 53
      Width = 48
      Height = 13
      Caption = 'Unidade'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object btn_co_unid_neg: TSpeedButton
      Left = 228
      Top = 66
      Width = 25
      Height = 21
      Flat = True
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        0400000000000001000000000000000000001000000010000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00555555555555
        5555555555555555555555555555555555555555555555555555555555555555
        555555555555555555555555555555555555555FFFFFFFFFF555550000000000
        55555577777777775F55500B8B8B8B8B05555775F555555575F550F0B8B8B8B8
        B05557F75F555555575F50BF0B8B8B8B8B0557F575FFFFFFFF7F50FBF0000000
        000557F557777777777550BFBFBFBFB0555557F555555557F55550FBFBFBFBF0
        555557F555555FF7555550BFBFBF00055555575F555577755555550BFBF05555
        55555575FFF75555555555700007555555555557777555555555555555555555
        5555555555555555555555555555555555555555555555555555}
      NumGlyphs = 2
      OnClick = btn_co_unid_negClick
    end
    object btn_nr_processo: TSpeedButton
      Left = 156
      Top = 106
      Width = 25
      Height = 21
      Flat = True
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        0400000000000001000000000000000000001000000010000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00555555555555
        5555555555555555555555555555555555555555555555555555555555555555
        555555555555555555555555555555555555555FFFFFFFFFF555550000000000
        55555577777777775F55500B8B8B8B8B05555775F555555575F550F0B8B8B8B8
        B05557F75F555555575F50BF0B8B8B8B8B0557F575FFFFFFFF7F50FBF0000000
        000557F557777777777550BFBFBFBFB0555557F555555557F55550FBFBFBFBF0
        555557F555555FF7555550BFBFBF00055555575F555577755555550BFBF05555
        55555575FFF75555555555700007555555555557777555555555555555555555
        5555555555555555555555555555555555555555555555555555}
      NumGlyphs = 2
      OnClick = btn_nr_processoClick
    end
    object edt_nm_unid_neg: TEdit
      Left = 52
      Top = 66
      Width = 175
      Height = 21
      TabStop = False
      Color = clMenu
      ReadOnly = True
      TabOrder = 1
    end
    object mskedt_nr_processo: TMaskEdit
      Left = 29
      Top = 106
      Width = 127
      Height = 21
      CharCase = ecUpperCase
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      MaxLength = 14
      ParentFont = False
      TabOrder = 2
    end
    object mskedt_cd_unid_neg: TMaskEdit
      Left = 29
      Top = 66
      Width = 24
      Height = 21
      EditMask = '99;0; '
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      MaxLength = 2
      ParentFont = False
      TabOrder = 0
      OnChange = btn_co_unid_negClick
      OnKeyDown = mskedt_cd_unid_negKeyDown
    end
    object rb_original: TRadioButton
      Left = 27
      Top = 140
      Width = 113
      Height = 17
      Caption = 'Original'
      Checked = True
      TabOrder = 3
      TabStop = True
    end
    object rb_copia: TRadioButton
      Left = 27
      Top = 156
      Width = 113
      Height = 17
      Caption = 'C'#243'pia'
      TabOrder = 4
    end
  end
  object chkProcessos: TCheckBox
    Left = 184
    Top = 108
    Width = 124
    Height = 17
    Caption = #218'ltimos Processos'
    Checked = True
    State = cbChecked
    TabOrder = 1
  end
  object crp_packing: TCRPE
    WindowShowPrintSetupBtn = False
    WindowShowProgressCtls = False
    WindowState = wsNormal
    LoadEngineOnUse = False
    Left = 240
    Top = 24
  end
  object pprep_packing: TppReport
    AutoStop = False
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = 'Report'
    PrinterSetup.PaperName = 'A4'
    PrinterSetup.PrinterName = 'Default'
    PrinterSetup.mmMarginBottom = 6350
    PrinterSetup.mmMarginLeft = 6350
    PrinterSetup.mmMarginRight = 6350
    PrinterSetup.mmMarginTop = 6350
    PrinterSetup.mmPaperHeight = 297000
    PrinterSetup.mmPaperWidth = 210000
    PrinterSetup.PaperSize = 9
    Template.FileName = 'C:\DDBROKER\PackingCroda.rtm'
    Units = utMillimeters
    DeviceType = 'Screen'
    OutlineSettings.CreateNode = True
    OutlineSettings.CreatePageNodes = True
    OutlineSettings.Enabled = False
    OutlineSettings.Visible = True
    TextSearchSettings.DefaultString = '<FindText>'
    TextSearchSettings.Enabled = True
    Left = 248
    Top = 136
    Version = '7.02'
    mmColumnWidth = 0
    object ppHeBd1: TppHeaderBand
      mmBottomOffset = 0
      mmHeight = 0
      mmPrintPosition = 0
    end
    object ppDtBd1: TppDetailBand
      PrintHeight = phDynamic
      mmBottomOffset = 0
      mmHeight = 6879
      mmPrintPosition = 0
      object ppdbtxt2: TppDBText
        UserName = 'dbtxt2'
        DataField = 'calcPackage'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        mmHeight = 3175
        mmLeft = 24871
        mmTop = 1588
        mmWidth = 35190
        BandType = 4
      end
      object ppDBtxtNivel: TppDBText
        UserName = 'DBtxtNivel'
        DataField = 'calcNivel'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        mmHeight = 3175
        mmLeft = 794
        mmTop = 1588
        mmWidth = 22225
        BandType = 4
      end
      object ppDBtxt26: TppDBText
        UserName = 'DBtxt26'
        DataField = 'calcPesoLiquido'
        DisplayFormat = '#0,.000'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3175
        mmLeft = 168540
        mmTop = 1588
        mmWidth = 24871
        BandType = 4
      end
      object ppDBMemo2: TppDBMemo
        UserName = 'DBMemo2'
        CharWrap = False
        DataField = 'calcMercadoria'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        Stretch = True
        Transparent = True
        mmHeight = 3175
        mmLeft = 60854
        mmTop = 1588
        mmWidth = 103981
        BandType = 4
        mmBottomOffset = 0
        mmOverFlowOffset = 0
        mmStopPosition = 0
        mmLeading = 0
      end
    end
    object ppFtBd1: TppFooterBand
      mmBottomOffset = 0
      mmHeight = 13758
      mmPrintPosition = 0
      object ppShape4: TppShape
        UserName = 'Shape2'
        mmHeight = 14023
        mmLeft = 0
        mmTop = 0
        mmWidth = 197380
        BandType = 8
      end
      object ppDBText11: TppDBText
        UserName = 'DBText12'
        DataField = 'NM_EXPORTADOR'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        ParentDataPipeline = False
        Transparent = True
        mmHeight = 3704
        mmLeft = 156369
        mmTop = 265
        mmWidth = 40217
        BandType = 8
      end
      object ppDBText12: TppDBText
        UserName = 'DBText15'
        DataField = 'CRO04'
        DataPipeline = frm_fatura_comercial2.ppBDETexto
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        ParentDataPipeline = False
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppBDETexto'
        mmHeight = 3704
        mmLeft = 118798
        mmTop = 9790
        mmWidth = 78317
        BandType = 8
      end
      object ppLine2: TppLine
        UserName = 'Line2'
        Weight = 0.750000000000000000
        mmHeight = 1058
        mmLeft = 265
        mmTop = 9260
        mmWidth = 196586
        BandType = 8
      end
      object ppDBText20: TppDBText
        UserName = 'DBText21'
        DataField = 'CRO03'
        DataPipeline = frm_fatura_comercial2.ppBDETexto
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        ParentDataPipeline = False
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppBDETexto'
        mmHeight = 3704
        mmLeft = 144463
        mmTop = 265
        mmWidth = 11113
        BandType = 8
      end
    end
    object ppPageStyle2: TppPageStyle
      EndPage = 0
      SinglePage = 0
      StartPage = 0
      mmBottomOffset = 0
      mmHeight = 284300
      mmPrintPosition = 0
      object ppshp3: TppShape
        UserName = 'shp3'
        mmHeight = 47096
        mmLeft = 0
        mmTop = 33602
        mmWidth = 197380
        BandType = 9
      end
      object ppShape6: TppShape
        UserName = 'Shape1'
        mmHeight = 203994
        mmLeft = 0
        mmTop = 80433
        mmWidth = 197380
        BandType = 9
      end
      object ppshp2: TppShape
        UserName = 'shp2'
        mmHeight = 21167
        mmLeft = 0
        mmTop = 16933
        mmWidth = 197380
        BandType = 9
      end
      object ppshp4: TppShape
        UserName = 'shp4'
        mmHeight = 5027
        mmLeft = 0
        mmTop = 80433
        mmWidth = 197380
        BandType = 9
      end
      object ppLn2: TppLine
        UserName = 'Ln2'
        Weight = 0.750000000000000000
        mmHeight = 1058
        mmLeft = 265
        mmTop = 66675
        mmWidth = 98425
        BandType = 9
      end
      object ppLn3: TppLine
        UserName = 'Ln3'
        Position = lpLeft
        Weight = 0.750000000000000000
        mmHeight = 9790
        mmLeft = 148167
        mmTop = 71173
        mmWidth = 265
        BandType = 9
      end
      object ppLn4: TppLine
        UserName = 'Ln4'
        Weight = 0.750000000000000000
        mmHeight = 265
        mmLeft = 98425
        mmTop = 70908
        mmWidth = 98690
        BandType = 9
      end
      object ppLn5: TppLine
        UserName = 'Ln5'
        Position = lpLeft
        Weight = 0.750000000000000000
        mmHeight = 203730
        mmLeft = 23548
        mmTop = 80433
        mmWidth = 265
        BandType = 9
      end
      object ppLn6: TppLine
        UserName = 'Ln6'
        Position = lpLeft
        Weight = 0.750000000000000000
        mmHeight = 203730
        mmLeft = 60325
        mmTop = 80433
        mmWidth = 265
        BandType = 9
      end
      object ppLn7: TppLine
        UserName = 'Ln7'
        Position = lpLeft
        Weight = 0.750000000000000000
        mmHeight = 203465
        mmLeft = 165100
        mmTop = 80698
        mmWidth = 265
        BandType = 9
      end
      object ppLn1: TppLine
        UserName = 'Ln1'
        Position = lpLeft
        Weight = 0.750000000000000000
        mmHeight = 63500
        mmLeft = 98425
        mmTop = 16933
        mmWidth = 265
        BandType = 9
      end
      object ppDBText9: TppDBText
        UserName = 'DBText1'
        DataField = 'TIT01'
        DataPipeline = frm_fatura_comercial2.ppBDETexto
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppBDETexto'
        mmHeight = 3969
        mmLeft = 129911
        mmTop = 3704
        mmWidth = 48154
        BandType = 9
      end
      object ppDBText10: TppDBText
        UserName = 'DBText2'
        DataField = 'TIT02'
        DataPipeline = frm_fatura_comercial2.ppBDETexto
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppBDETexto'
        mmHeight = 3175
        mmLeft = 131234
        mmTop = 8731
        mmWidth = 17198
        BandType = 9
      end
      object ppDBText13: TppDBText
        UserName = 'DBText3'
        DataField = 'TIT03'
        DataPipeline = frm_fatura_comercial2.ppBDETexto
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppBDETexto'
        mmHeight = 3175
        mmLeft = 131234
        mmTop = 12435
        mmWidth = 17198
        BandType = 9
      end
      object ppDBText14: TppDBText
        UserName = 'DBText4'
        DataField = 'TIT04'
        DataPipeline = frm_fatura_comercial2.ppBDETexto
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppBDETexto'
        mmHeight = 3175
        mmLeft = 529
        mmTop = 17727
        mmWidth = 96573
        BandType = 9
      end
      object ppDBText15: TppDBText
        UserName = 'DBText5'
        DataField = 'TIT05'
        DataPipeline = frm_fatura_comercial2.ppBDETexto
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppBDETexto'
        mmHeight = 3175
        mmLeft = 99219
        mmTop = 17727
        mmWidth = 97102
        BandType = 9
      end
      object ppDBText16: TppDBText
        UserName = 'DBText6'
        DataField = 'TIT06'
        DataPipeline = frm_fatura_comercial2.ppBDETexto
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppBDETexto'
        mmHeight = 3175
        mmLeft = 794
        mmTop = 38894
        mmWidth = 42863
        BandType = 9
      end
      object ppDBText17: TppDBText
        UserName = 'DBText7'
        DataField = 'TIT07'
        DataPipeline = frm_fatura_comercial2.ppBDETexto
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppBDETexto'
        mmHeight = 3175
        mmLeft = 48683
        mmTop = 39158
        mmWidth = 16140
        BandType = 9
      end
      object ppDBText18: TppDBText
        UserName = 'DBText8'
        DataField = 'TIT03'
        DataPipeline = frm_fatura_comercial2.ppBDETexto
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppBDETexto'
        mmHeight = 3175
        mmLeft = 48683
        mmTop = 43921
        mmWidth = 14023
        BandType = 9
      end
      object ppDBText19: TppDBText
        UserName = 'DBText9'
        DataField = 'TIT11'
        DataPipeline = frm_fatura_comercial2.ppBDETexto
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppBDETexto'
        mmHeight = 3175
        mmLeft = 98954
        mmTop = 38894
        mmWidth = 97631
        BandType = 9
      end
      object ppDBText21: TppDBText
        UserName = 'DBText13'
        DataField = 'TIT12'
        DataPipeline = frm_fatura_comercial2.ppBDETexto
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppBDETexto'
        mmHeight = 3175
        mmLeft = 98954
        mmTop = 71967
        mmWidth = 48419
        BandType = 9
      end
      object ppDBText23: TppDBText
        UserName = 'DBText14'
        DataField = 'TIT13'
        DataPipeline = frm_fatura_comercial2.ppBDETexto
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppBDETexto'
        mmHeight = 3175
        mmLeft = 149225
        mmTop = 71967
        mmWidth = 47361
        BandType = 9
      end
      object ppDBText24: TppDBText
        UserName = 'DBText16'
        DataField = 'TIT15'
        DataPipeline = frm_fatura_comercial2.ppBDETexto
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        ParentDataPipeline = False
        TextAlignment = taCentered
        Transparent = True
        DataPipelineName = 'ppBDETexto'
        mmHeight = 3175
        mmLeft = 61119
        mmTop = 81227
        mmWidth = 102923
        BandType = 9
      end
      object ppDBText25: TppDBText
        UserName = 'DBText17'
        DataField = 'TIT16'
        DataPipeline = frm_fatura_comercial2.ppBDETexto
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        ParentDataPipeline = False
        TextAlignment = taCentered
        Transparent = True
        DataPipelineName = 'ppBDETexto'
        mmHeight = 3175
        mmLeft = 166423
        mmTop = 81227
        mmWidth = 29898
        BandType = 9
      end
      object ppDBText51: TppDBText
        UserName = 'DBText101'
        DataField = 'TIT08'
        DataPipeline = frm_fatura_comercial2.ppBDETexto
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppBDETexto'
        mmHeight = 3175
        mmLeft = 48683
        mmTop = 48419
        mmWidth = 26988
        BandType = 9
      end
      object ppDBText52: TppDBText
        UserName = 'DBText52'
        DataField = 'TIT09'
        DataPipeline = frm_fatura_comercial2.ppBDETexto
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppBDETexto'
        mmHeight = 3175
        mmLeft = 48683
        mmTop = 52917
        mmWidth = 26988
        BandType = 9
      end
      object ppDBText26: TppDBText
        UserName = 'DBText53'
        DataField = 'TIT10'
        DataPipeline = frm_fatura_comercial2.ppBDETexto
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppBDETexto'
        mmHeight = 3175
        mmLeft = 48683
        mmTop = 57415
        mmWidth = 26988
        BandType = 9
      end
      object ppLine1: TppLine
        UserName = 'Line1'
        Position = lpLeft
        Weight = 0.750000000000000000
        mmHeight = 28840
        mmLeft = 47361
        mmTop = 37835
        mmWidth = 265
        BandType = 9
      end
      object ppDBText27: TppDBText
        UserName = 'DBText10'
        DataField = 'DUP06'
        DataPipeline = frm_fatura_comercial2.ppBDETexto
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppBDETexto'
        mmHeight = 3175
        mmLeft = 1058
        mmTop = 67733
        mmWidth = 26988
        BandType = 9
      end
      object ppSystemVariable2: TppSystemVariable
        UserName = 'SystemVariable1'
        VarType = vtPageNoDesc
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 4191
        mmLeft = 185738
        mmTop = 284300
        mmWidth = 11303
        BandType = 9
      end
      object ppDBTxtNot2: TppDBText
        UserName = 'DBTxtNot2'
        DataField = 'TIT17'
        DataPipeline = frm_fatura_comercial2.ppBDETexto
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        ParentDataPipeline = False
        Transparent = True
        Visible = False
        DataPipelineName = 'ppBDETexto'
        mmHeight = 3175
        mmLeft = 98954
        mmTop = 54504
        mmWidth = 97631
        BandType = 9
      end
      object ppDBText28: TppDBText
        UserName = 'DBText23'
        DataField = 'CRO02'
        DataPipeline = frm_fatura_comercial2.ppBDETexto
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        ParentDataPipeline = False
        TextAlignment = taCentered
        Transparent = True
        DataPipelineName = 'ppBDETexto'
        mmHeight = 3175
        mmLeft = 265
        mmTop = 81227
        mmWidth = 23019
        BandType = 9
      end
      object ppDBText29: TppDBText
        UserName = 'DBText24'
        DataField = 'CRO01'
        DataPipeline = frm_fatura_comercial2.ppBDETexto
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        ParentDataPipeline = False
        TextAlignment = taCentered
        Transparent = True
        DataPipelineName = 'ppBDETexto'
        mmHeight = 3175
        mmLeft = 24342
        mmTop = 81227
        mmWidth = 35454
        BandType = 9
      end
      object ppDBImage1: TppDBImage
        UserName = 'DBImage1'
        MaintainAspectRatio = False
        DataField = 'TX_LOGOMARCA_EMPRESA_NAC'
        DataPipeline = ppBDE_total
        GraphicType = 'Bitmap'
        ParentDataPipeline = False
        DataPipelineName = 'ppBDE_total'
        mmHeight = 13229
        mmLeft = 1588
        mmTop = 1588
        mmWidth = 44715
        BandType = 9
      end
    end
    object ppGroup1: TppGroup
      BreakName = 'NR_PEDIDO'
      OutlineSettings.CreateNode = True
      NewPage = True
      ResetPageNo = True
      UserName = 'Group1'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      DataPipelineName = ''
      object ppGroupHeaderBand1: TppGroupHeaderBand
        mmBottomOffset = 0
        mmHeight = 115000
        mmPrintPosition = 0
        object ppDBText32: TppDBText
          UserName = 'DBText26'
          DataField = 'NIT_NOTIFY1'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          ParentDataPipeline = False
          Transparent = True
          mmHeight = 3175
          mmLeft = 102129
          mmTop = 53975
          mmWidth = 88371
          BandType = 3
          GroupNo = 0
        end
        object ppDBText35: TppDBText
          UserName = 'DBText29'
          DataField = 'RUC_NOTIFY1'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          ParentDataPipeline = False
          Transparent = True
          mmHeight = 3175
          mmLeft = 102394
          mmTop = 53711
          mmWidth = 88636
          BandType = 3
          GroupNo = 0
        end
        object ppDBText34: TppDBText
          UserName = 'DBText28'
          DataField = 'RUC_CONSIGNATARIO'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          ParentDataPipeline = False
          Transparent = True
          mmHeight = 3175
          mmLeft = 102394
          mmTop = 33073
          mmWidth = 84402
          BandType = 3
          GroupNo = 0
        end
        object ppDBText37: TppDBText
          UserName = 'DBText37'
          DataField = 'CUIT_CONSIGNATARIO'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          ParentDataPipeline = False
          Transparent = True
          mmHeight = 3175
          mmLeft = 103188
          mmTop = 32808
          mmWidth = 83608
          BandType = 3
          GroupNo = 0
        end
        object ppDBText30: TppDBText
          UserName = 'DBText22'
          DataField = 'NR_NIT'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          ParentDataPipeline = False
          Transparent = True
          mmHeight = 3175
          mmLeft = 5556
          mmTop = 33602
          mmWidth = 80963
          BandType = 3
          GroupNo = 0
        end
        object ppDBText33: TppDBText
          UserName = 'DBText27'
          DataField = 'NR_RUC'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          ParentDataPipeline = False
          Transparent = True
          mmHeight = 3175
          mmLeft = 5292
          mmTop = 33338
          mmWidth = 81227
          BandType = 3
          GroupNo = 0
        end
        object ppDBMemoIMP: TppDBMemo
          UserName = 'DBMemoIMP'
          CharWrap = False
          DataField = 'TX_IMPORTADOR'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          ParentDataPipeline = False
          Transparent = True
          Visible = False
          mmHeight = 18785
          mmLeft = 5292
          mmTop = 21696
          mmWidth = 89959
          BandType = 3
          GroupNo = 0
          mmBottomOffset = 0
          mmOverFlowOffset = 0
          mmStopPosition = 0
          mmLeading = 0
        end
        object ppDBtxt10: TppDBText
          UserName = 'DBtxt10'
          DataField = 'NM_IMPORTADOR'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          ParentDataPipeline = False
          Transparent = True
          mmHeight = 3969
          mmLeft = 5292
          mmTop = 21960
          mmWidth = 89959
          BandType = 3
          GroupNo = 0
        end
        object ppDBMemoNOT: TppDBMemo
          UserName = 'DBMemoNOT'
          CharWrap = False
          DataField = 'TX_NOTIFY1'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          ParentDataPipeline = False
          Transparent = True
          Visible = False
          mmHeight = 12435
          mmLeft = 102129
          mmTop = 42333
          mmWidth = 89959
          BandType = 3
          GroupNo = 0
          mmBottomOffset = 0
          mmOverFlowOffset = 0
          mmStopPosition = 0
          mmLeading = 0
        end
        object ppDBText36: TppDBText
          UserName = 'DBText36'
          DataField = 'NR_CUIT'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          ParentDataPipeline = False
          Transparent = True
          mmHeight = 3175
          mmLeft = 5556
          mmTop = 33602
          mmWidth = 81227
          BandType = 3
          GroupNo = 0
        end
        object ppDBMemoCON: TppDBMemo
          UserName = 'DBMemoCON'
          CharWrap = False
          DataField = 'TX_CONSIGNATARIO'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          ParentDataPipeline = False
          Transparent = True
          Visible = False
          mmHeight = 18785
          mmLeft = 102129
          mmTop = 21696
          mmWidth = 89959
          BandType = 3
          GroupNo = 0
          mmBottomOffset = 0
          mmOverFlowOffset = 0
          mmStopPosition = 0
          mmLeading = 0
        end
        object ppDBMemoNOT2: TppDBMemo
          UserName = 'DBMemoNOT2'
          CharWrap = False
          DataField = 'TX_NOTIFY2'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          ParentDataPipeline = False
          Transparent = True
          Visible = False
          mmHeight = 12435
          mmLeft = 102394
          mmTop = 57150
          mmWidth = 89959
          BandType = 3
          GroupNo = 0
          mmBottomOffset = 0
          mmOverFlowOffset = 0
          mmStopPosition = 0
          mmLeading = 0
        end
        object ppDBMemoEXP: TppDBMemo
          UserName = 'DBMemoEXP'
          CharWrap = False
          DataField = 'TX_EXPORTADOR'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          ParentDataPipeline = False
          Transparent = True
          Visible = False
          mmHeight = 19844
          mmLeft = 51858
          mmTop = 1058
          mmWidth = 90223
          BandType = 3
          GroupNo = 0
          mmBottomOffset = 0
          mmOverFlowOffset = 0
          mmStopPosition = 0
          mmLeading = 0
        end
        object ppDBMemo1: TppDBMemo
          UserName = 'DBMemo1'
          CharWrap = False
          DataField = 'calcMarcas'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = []
          ParentDataPipeline = False
          Transparent = True
          mmHeight = 28046
          mmLeft = 529
          mmTop = 42598
          mmWidth = 46567
          BandType = 3
          GroupNo = 0
          mmBottomOffset = 0
          mmOverFlowOffset = 0
          mmStopPosition = 0
          mmLeading = 0
        end
        object ppDBtxt1: TppDBText
          UserName = 'DBtxt1'
          DataField = 'NM_EXPORTADOR'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          ParentDataPipeline = False
          Transparent = True
          mmHeight = 3969
          mmLeft = 51858
          mmTop = 1058
          mmWidth = 89694
          BandType = 3
          GroupNo = 0
        end
        object ppDBtxt5: TppDBText
          UserName = 'DBtxt5'
          DataField = 'END_EMPRESA_EXP'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          ParentDataPipeline = False
          Transparent = True
          mmHeight = 3969
          mmLeft = 51858
          mmTop = 5027
          mmWidth = 89694
          BandType = 3
          GroupNo = 0
        end
        object ppDBtxt6: TppDBText
          UserName = 'DBtxt6'
          DataField = 'END_GERAL_EXP'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          ParentDataPipeline = False
          Transparent = True
          mmHeight = 3969
          mmLeft = 51858
          mmTop = 8996
          mmWidth = 89694
          BandType = 3
          GroupNo = 0
        end
        object ppDBtxt7: TppDBText
          UserName = 'DBtxt7'
          DataField = 'NR_PHONE_EXP'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          ParentDataPipeline = False
          Transparent = True
          mmHeight = 3969
          mmLeft = 51858
          mmTop = 12965
          mmWidth = 89694
          BandType = 3
          GroupNo = 0
        end
        object ppDBtxt9: TppDBText
          UserName = 'DBtxt9'
          DataField = 'DT_FATURA'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          ParentDataPipeline = False
          Transparent = True
          mmHeight = 3969
          mmLeft = 145521
          mmTop = 12435
          mmWidth = 24871
          BandType = 3
          GroupNo = 0
        end
        object ppDBtxt11: TppDBText
          UserName = 'DBtxt101'
          DataField = 'END_EMPRESA_IMP'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 6
          Font.Style = []
          ParentDataPipeline = False
          Transparent = True
          mmHeight = 2498
          mmLeft = 5292
          mmTop = 25135
          mmWidth = 89694
          BandType = 3
          GroupNo = 0
        end
        object ppDBtxt12: TppDBText
          UserName = 'DBtxt12'
          DataField = 'calc_imp2'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          ParentDataPipeline = False
          Transparent = True
          mmHeight = 3440
          mmLeft = 5292
          mmTop = 28046
          mmWidth = 89959
          BandType = 3
          GroupNo = 0
        end
        object ppDBtxt13: TppDBText
          UserName = 'DBtxt102'
          DataField = 'NM_CONSIGNATARIO'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          ParentDataPipeline = False
          Transparent = True
          mmHeight = 3969
          mmLeft = 102129
          mmTop = 21696
          mmWidth = 89959
          BandType = 3
          GroupNo = 0
        end
        object ppDBtxt14: TppDBText
          UserName = 'DBtxt14'
          DataField = 'END_CONSIGNATARIO'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 6
          Font.Style = []
          ParentDataPipeline = False
          Transparent = True
          mmHeight = 2498
          mmLeft = 102129
          mmTop = 25135
          mmWidth = 89959
          BandType = 3
          GroupNo = 0
        end
        object ppDBtxt15: TppDBText
          UserName = 'DBtxt15'
          DataField = 'calc_consig2'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          ParentDataPipeline = False
          Transparent = True
          mmHeight = 3440
          mmLeft = 102129
          mmTop = 28046
          mmWidth = 89959
          BandType = 3
          GroupNo = 0
        end
        object ppDBtxt18: TppDBText
          UserName = 'DBtxt18'
          DataField = 'calc_origem'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          ParentDataPipeline = False
          Transparent = True
          mmHeight = 3969
          mmLeft = 100542
          mmTop = 75671
          mmWidth = 44979
          BandType = 3
          GroupNo = 0
        end
        object ppDBtxt19: TppDBText
          UserName = 'DBtxt19'
          DataField = 'calc_destino'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          ParentDataPipeline = False
          Transparent = True
          mmHeight = 3969
          mmLeft = 150019
          mmTop = 75936
          mmWidth = 44979
          BandType = 3
          GroupNo = 0
        end
        object ppDBtxt23: TppDBText
          UserName = 'DBtxt23'
          DataField = 'NM_NOTIFY1'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          ParentDataPipeline = False
          Transparent = True
          mmHeight = 3969
          mmLeft = 102129
          mmTop = 42333
          mmWidth = 89959
          BandType = 3
          GroupNo = 0
        end
        object ppDBtxt24: TppDBText
          UserName = 'DBtxt24'
          DataField = 'END_NOTIFY1'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 6
          Font.Style = []
          ParentDataPipeline = False
          Transparent = True
          mmHeight = 2498
          mmLeft = 102129
          mmTop = 46038
          mmWidth = 89959
          BandType = 3
          GroupNo = 0
        end
        object ppDBtxt25: TppDBText
          UserName = 'DBtxt25'
          DataField = 'calc_notify2'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          ParentDataPipeline = False
          Transparent = True
          mmHeight = 3969
          mmLeft = 102129
          mmTop = 49477
          mmWidth = 89959
          BandType = 3
          GroupNo = 0
        end
        object ppDBText59: TppDBText
          UserName = 'DBText59'
          DataField = 'NR_PEDIDO'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          ParentDataPipeline = False
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3704
          mmLeft = 75142
          mmTop = 38894
          mmWidth = 21167
          BandType = 3
          GroupNo = 0
        end
        object ppDBText60: TppDBText
          UserName = 'DBText60'
          DataField = 'DT_FATURA'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          ParentDataPipeline = False
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3704
          mmLeft = 75142
          mmTop = 42863
          mmWidth = 21167
          BandType = 3
          GroupNo = 0
        end
        object ppDBMemo3: TppDBMemo
          UserName = 'DBMemo3'
          CharWrap = False
          DataField = 'calcPacote'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          ParentDataPipeline = False
          Transparent = True
          mmHeight = 8996
          mmLeft = 529
          mmTop = 71438
          mmWidth = 94986
          BandType = 3
          GroupNo = 0
          mmBottomOffset = 0
          mmOverFlowOffset = 0
          mmStopPosition = 0
          mmLeading = 0
        end
        object ppPesoLiq: TppLabel
          UserName = 'Label13'
          Caption = '6.075,0000'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3175
          mmLeft = 75142
          mmTop = 47625
          mmWidth = 21167
          BandType = 3
          GroupNo = 0
        end
        object ppPesoBruto: TppLabel
          UserName = 'Label15'
          Caption = '6.739,5000'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3175
          mmLeft = 75142
          mmTop = 51858
          mmWidth = 21167
          BandType = 3
          GroupNo = 0
        end
        object ppCubagem: TppLabel
          UserName = 'Label16'
          Caption = '14,620'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3175
          mmLeft = 75142
          mmTop = 55827
          mmWidth = 21167
          BandType = 3
          GroupNo = 0
        end
        object ppPg: TppSystemVariable
          UserName = 'Pg'
          VarType = vtPageNo
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = []
          Transparent = True
          Visible = False
          mmHeight = 3969
          mmLeft = 192088
          mmTop = 2381
          mmWidth = 1852
          BandType = 3
          GroupNo = 0
        end
        object ppDBTextORIGEM: TppDBText
          UserName = 'DBText102'
          DataField = 'NM_LOCAL_ORIGEM'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          ParentDataPipeline = False
          Transparent = True
          Visible = False
          mmHeight = 3969
          mmLeft = 100542
          mmTop = 75936
          mmWidth = 44979
          BandType = 3
          GroupNo = 0
        end
        object ppDBTextDESTINO: TppDBText
          UserName = 'DBText11'
          DataField = 'NM_LOCAL_DESTINO'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          ParentDataPipeline = False
          Transparent = True
          Visible = False
          mmHeight = 3969
          mmLeft = 150019
          mmTop = 75936
          mmWidth = 44979
          BandType = 3
          GroupNo = 0
        end
        object ppMerc: TppMemo
          UserName = 'Merc'
          CharWrap = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          Transparent = True
          mmHeight = 265
          mmLeft = 55298
          mmTop = 90000
          mmWidth = 103981
          BandType = 3
          GroupNo = 0
          mmBottomOffset = 0
          mmOverFlowOffset = 0
          mmStopPosition = 0
          mmLeading = 0
        end
        object ppDBTxtNot2_1: TppDBText
          UserName = 'DBText18'
          DataField = 'NM_NOTIFY2'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          ParentDataPipeline = False
          Transparent = True
          Visible = False
          mmHeight = 3969
          mmLeft = 102394
          mmTop = 57150
          mmWidth = 89959
          BandType = 3
          GroupNo = 0
        end
        object ppDBTxtNot2_2: TppDBText
          UserName = 'DBText19'
          DataField = 'END_NOTIFY2'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          ParentDataPipeline = False
          Transparent = True
          Visible = False
          mmHeight = 3969
          mmLeft = 102394
          mmTop = 61119
          mmWidth = 89959
          BandType = 3
          GroupNo = 0
        end
        object ppDBTxtNot2_3: TppDBText
          UserName = 'DBText20'
          DataField = 'calc_notify2_2'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          ParentDataPipeline = False
          Transparent = True
          Visible = False
          mmHeight = 3969
          mmLeft = 102394
          mmTop = 65088
          mmWidth = 89959
          BandType = 3
          GroupNo = 0
        end
        object ppDBText31: TppDBText
          UserName = 'DBText25'
          DataField = 'NIT_CONSIGNATARIO'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          ParentDataPipeline = False
          Transparent = True
          mmHeight = 3175
          mmLeft = 102129
          mmTop = 33073
          mmWidth = 84402
          BandType = 3
          GroupNo = 0
        end
        object ppDBtxt8: TppDBText
          UserName = 'DBtxt8'
          DataField = 'NR_PEDIDO'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          ParentDataPipeline = False
          Transparent = True
          mmHeight = 3260
          mmLeft = 145521
          mmTop = 8467
          mmWidth = 24871
          BandType = 3
          GroupNo = 0
        end
      end
      object ppGroupFooterBand1: TppGroupFooterBand
        PrintHeight = phDynamic
        mmBottomOffset = 0
        mmHeight = 11906
        mmPrintPosition = 0
        object ppDBMemo5: TppDBMemo
          UserName = 'DBMemo5'
          CharWrap = False
          DataField = 'TX_DECL_ADICIONAL'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          ParentDataPipeline = False
          Stretch = True
          mmHeight = 7144
          mmLeft = 72496
          mmTop = 3440
          mmWidth = 90488
          BandType = 5
          GroupNo = 0
          mmBottomOffset = 0
          mmOverFlowOffset = 0
          mmStopPosition = 0
          mmLeading = 0
        end
      end
    end
    object ppGroup2: TppGroup
      BreakName = 'TX_CAMINHO'
      OutlineSettings.CreateNode = True
      ReprintOnSubsequentPage = False
      UserName = 'Group2'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      DataPipelineName = ''
      object ppGroupHeaderBand2: TppGroupHeaderBand
        mmBottomOffset = 0
        mmHeight = 5292
        mmPrintPosition = 0
      end
      object ppGroupFooterBand2: TppGroupFooterBand
        mmBottomOffset = 0
        mmHeight = 3175
        mmPrintPosition = 0
      end
    end
    object ppParameterList1: TppParameterList
    end
  end
  object ds_total: TDataSource
    DataSet = qry_total_
    Left = 98
    Top = 165
  end
  object ds_detalhe: TDataSource
    DataSet = qry_detalhe_
    Left = 204
    Top = 156
  end
  object qry_total_: TQuery
    OnCalcFields = qry_total_CalcFields
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      ''
      'SELECT E.NR_PROCESSO, E.CD_LINGUA_PEDIDO,'
      '       DATEPART(DD, E.DT_FATURA) DIA_FATURA,'
      '       DATEPART(MM, E.DT_FATURA) MES_FATURA,'
      '       DATEPART(YYYY, E.DT_FATURA) ANO_FATURA,'
      '       EE.NM_EMPRESA,'
      '       E.TX_MARCACAO_VOLUME,'
      '       E.VL_TOT_QTDE_EMBALAGEM,'
      '       CONVERT(DECIMAL(16,3), E.VL_PESO_BRUTO) PESO_BRUTO_TOTAL,'
      '       CONVERT(DECIMAL(16,3), E.VL_PESO_LIQUIDO) PESO_LIQ_TOTAL,'
      '       E.TX_DECL_ADICIONAL,'
      '       (SELECT TOP 1(RC.CD_REFERENCIA)'
      '        FROM   TREF_CLIENTE RC'
      '        WHERE  RC.TP_REFERENCIA = '#39'01'#39' AND'
      '               RC.NR_PROCESSO = E.NR_PROCESSO) AS CUSTOMER,'
      '       (SELECT TOP 1(RC.CD_REFERENCIA)'
      '        FROM   TREF_CLIENTE RC'
      '        WHERE  RC.TP_REFERENCIA = '#39'07'#39'AND'
      '               RC.NR_PROCESSO = E.NR_PROCESSO) AS SHIPPER  ,'
      '            '
      '           CASE ISNULL(EN.PATH_LOGO, '#39#39')'
      '                WHEN '#39#39' '
      '                THEN ( '#39#39' )'
      '                ELSE ( '#39'C:\DDBROKER\'#39' + EN.PATH_LOGO )'
      '         END AS TX_LOGOMARCA_EMPRESA_NAC         '
      '               '
      ''
      ''
      'FROM TPROCESSO_EXP     E'
      
        'JOIN TPROCESSO         P   (NOLOCK) ON P.NR_PROCESSO = E.NR_PROC' +
        'ESSO'
      
        'JOIN TEMPRESA_NAC      EN  (NOLOCK) ON EN.CD_EMPRESA = P.CD_CLIE' +
        'NTE '
      
        'LEFT JOIN TEMPRESA_EST EE  (NOLOCK) ON EE.CD_EMPRESA = E.CD_IMPO' +
        'RTADOR'
      '       '
      'WHERE  E.NR_PROCESSO = :PROCESSO')
    Left = 71
    Top = 146
    ParamData = <
      item
        DataType = ftString
        Name = 'processo'
        ParamType = ptInput
      end>
    object qry_total_calc_original: TStringField
      FieldKind = fkCalculated
      FieldName = 'calc_original'
      Calculated = True
    end
    object qry_total_NR_PROCESSO: TStringField
      FieldName = 'NR_PROCESSO'
      FixedChar = True
      Size = 18
    end
    object qry_total_DIA_FATURA: TIntegerField
      FieldName = 'DIA_FATURA'
    end
    object qry_total_MES_FATURA: TIntegerField
      FieldName = 'MES_FATURA'
    end
    object qry_total_ANO_FATURA: TIntegerField
      FieldName = 'ANO_FATURA'
    end
    object qry_total_NM_EMPRESA: TStringField
      FieldName = 'NM_EMPRESA'
      FixedChar = True
      Size = 60
    end
    object qry_total_TX_MARCACAO_VOLUME: TMemoField
      FieldName = 'TX_MARCACAO_VOLUME'
      BlobType = ftMemo
    end
    object qry_total_VL_TOT_QTDE_EMBALAGEM: TFloatField
      FieldName = 'VL_TOT_QTDE_EMBALAGEM'
    end
    object qry_total_PESO_BRUTO_TOTAL: TFloatField
      FieldName = 'PESO_BRUTO_TOTAL'
    end
    object qry_total_PESO_LIQ_TOTAL: TFloatField
      FieldName = 'PESO_LIQ_TOTAL'
    end
    object qry_total_TX_DECL_ADICIONAL: TMemoField
      FieldName = 'TX_DECL_ADICIONAL'
      BlobType = ftMemo
    end
    object qry_total_calc_dt_fatura: TStringField
      FieldKind = fkCalculated
      FieldName = 'calc_dt_fatura'
      Calculated = True
    end
    object qry_total_CD_LINGUA_PEDIDO: TStringField
      FieldName = 'CD_LINGUA_PEDIDO'
      FixedChar = True
      Size = 1
    end
    object qry_total_soma_tara: TFloatField
      FieldKind = fkCalculated
      FieldName = 'soma_tara'
      Calculated = True
    end
    object qry_total_CUSTOMER: TStringField
      FieldName = 'CUSTOMER'
      FixedChar = True
      Size = 15
    end
    object qry_total_SHIPPER: TStringField
      FieldName = 'SHIPPER'
      FixedChar = True
      Size = 15
    end
    object qry_total_TX_LOGOMARCA_EMPRESA_NAC: TStringField
      FieldName = 'TX_LOGOMARCA_EMPRESA_NAC'
      FixedChar = True
      Size = 112
    end
  end
  object qry_detalhe_: TQuery
    DatabaseName = 'DBBROKER'
    DataSource = ds_total
    SQL.Strings = (
      
        'SELECT E.CD_LINGUA_PEDIDO, EI.CD_EMBALAGEM_SUP, EI.CD_EMBALAGEM,' +
        ' EI.NR_PROCESSO,'
      '       EI.QT_EMBALAGEM_SUP,'
      '      (CASE'
      
        '          WHEN E.CD_LINGUA_PEDIDO = '#39'0'#39' THEN ES.NM_DESCR_DETALHA' +
        'DA  '
      
        '          WHEN E.CD_LINGUA_PEDIDO = '#39'1'#39' THEN ES.NM_DESCR_DETALHA' +
        'DA_INGLES   '
      
        '          WHEN E.CD_LINGUA_PEDIDO = '#39'2'#39' THEN ES.NM_DESCR_DETALHA' +
        'DA_ESPANHOL  '
      '        END) AS DESC_EMB_SUP,'
      '        EI.NR_ITEM,'
      
        '        LTRIM(RTRIM(STR(CONVERT(DECIMAL(16,3), EI.QT_EMBALAGEM))' +
        ')) + '#39' '#39' +'
      '       (CASE'
      
        '          WHEN E.CD_LINGUA_PEDIDO = '#39'0'#39' THEN EMB.NM_DESCR_DETALH' +
        'ADA  '
      
        '          WHEN E.CD_LINGUA_PEDIDO = '#39'1'#39' THEN EMB.NM_DESCR_DETALH' +
        'ADA_INGLES   '
      
        '          WHEN E.CD_LINGUA_PEDIDO = '#39'2'#39' THEN EMB.NM_DESCR_DETALH' +
        'ADA_ESPANHOL  '
      '        END) AS DESC_EMB,'
      '        EI.CD_MERCADORIA, '
      '        EI.TX_MERCADORIA,'
      '        CONVERT(DECIMAL(16,3), EI.VL_TOT_PESO_BRUTO) PESO_BRUTO,'
      '        CONVERT(DECIMAL(16,3), EI.VL_PESO_EMB) TARA,'
      '        CONVERT(DECIMAL(16,3), EI.VL_TOT_PESO_LIQ) PESO_LIQUIDO,'
      
        '        CONVERT(DECIMAL(16,3), EI.VL_COMPRIMENTO_EMB) COMPRIMENT' +
        'O,'
      '        CONVERT(DECIMAL(16,3), EI.VL_LARGURA_EMB) LARGURA,'
      '        CONVERT(DECIMAL(16,3), EI.VL_ALTURA_EMB) ALTURA     '
      ''
      ''
      'FROM TPROCESSO_EXP_ITEM EI'
      
        '     LEFT JOIN TMERCADORIA_EXP ME ON ME.CD_MERCADORIA = EI.CD_ME' +
        'RCADORIA '
      
        '          JOIN TEMBALAGEM ES      ON ES.CD_EMBALAGEM = EI.CD_EMB' +
        'ALAGEM_SUP'
      
        '          JOIN TEMBALAGEM EMB     ON EMB.CD_EMBALAGEM = EI.CD_EM' +
        'BALAGEM'
      
        '          JOIN TPROCESSO_EXP E    ON E.NR_PROCESSO = EI.NR_PROCE' +
        'SSO'
      ''
      ''
      'WHERE EI.NR_PROCESSO =  :nr_processo'
      'ORDER BY EI.NR_PROCESSO, EI.NR_ITEM')
    Left = 155
    Top = 154
    ParamData = <
      item
        DataType = ftString
        Name = 'nr_processo'
        ParamType = ptInput
      end>
    object qry_detalhe_CD_LINGUA_PEDIDO: TStringField
      FieldName = 'CD_LINGUA_PEDIDO'
      FixedChar = True
      Size = 1
    end
    object qry_detalhe_CD_EMBALAGEM_SUP: TStringField
      FieldName = 'CD_EMBALAGEM_SUP'
      FixedChar = True
      Size = 4
    end
    object qry_detalhe_CD_EMBALAGEM: TStringField
      FieldName = 'CD_EMBALAGEM'
      FixedChar = True
      Size = 4
    end
    object qry_detalhe_QT_EMBALAGEM_SUP: TFloatField
      FieldName = 'QT_EMBALAGEM_SUP'
    end
    object qry_detalhe_DESC_EMB_SUP: TStringField
      FieldName = 'DESC_EMB_SUP'
      FixedChar = True
      Size = 50
    end
    object qry_detalhe_NR_ITEM: TStringField
      FieldName = 'NR_ITEM'
      FixedChar = True
      Size = 3
    end
    object qry_detalhe_DESC_EMB: TStringField
      FieldName = 'DESC_EMB'
      FixedChar = True
      Size = 50
    end
    object qry_detalhe_CD_MERCADORIA: TStringField
      DisplayWidth = 40
      FieldName = 'CD_MERCADORIA'
      FixedChar = True
      Size = 40
    end
    object qry_detalhe_TX_MERCADORIA: TMemoField
      FieldName = 'TX_MERCADORIA'
      BlobType = ftMemo
    end
    object qry_detalhe_PESO_BRUTO: TFloatField
      FieldName = 'PESO_BRUTO'
    end
    object qry_detalhe_TARA: TFloatField
      FieldName = 'TARA'
    end
    object qry_detalhe_PESO_LIQUIDO: TFloatField
      FieldName = 'PESO_LIQUIDO'
    end
    object qry_detalhe_COMPRIMENTO: TFloatField
      FieldName = 'COMPRIMENTO'
    end
    object qry_detalhe_LARGURA: TFloatField
      FieldName = 'LARGURA'
    end
    object qry_detalhe_ALTURA: TFloatField
      FieldName = 'ALTURA'
    end
    object qry_detalhe_NR_PROCESSO: TStringField
      FieldName = 'NR_PROCESSO'
      FixedChar = True
      Size = 18
    end
  end
  object ppBDE_total: TppBDEPipeline
    DataSource = ds_total
    UserName = 'BDE_total'
    Left = 86
    Top = 113
    object ppBDE_totalppField1: TppField
      FieldAlias = 'calc_original'
      FieldName = 'calc_original'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 0
      Searchable = False
      Sortable = False
    end
    object ppBDE_totalppField2: TppField
      FieldAlias = 'NR_PROCESSO'
      FieldName = 'NR_PROCESSO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 1
      Searchable = False
      Sortable = False
    end
    object ppBDE_totalppField3: TppField
      FieldAlias = 'DIA_FATURA'
      FieldName = 'DIA_FATURA'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 2
      Searchable = False
      Sortable = False
    end
    object ppBDE_totalppField4: TppField
      FieldAlias = 'MES_FATURA'
      FieldName = 'MES_FATURA'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 3
      Searchable = False
      Sortable = False
    end
    object ppBDE_totalppField5: TppField
      FieldAlias = 'ANO_FATURA'
      FieldName = 'ANO_FATURA'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 4
      Searchable = False
      Sortable = False
    end
    object ppBDE_totalppField6: TppField
      FieldAlias = 'NM_EMPRESA'
      FieldName = 'NM_EMPRESA'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 5
      Searchable = False
      Sortable = False
    end
    object ppBDE_totalppField7: TppField
      FieldAlias = 'TX_MARCACAO_VOLUME'
      FieldName = 'TX_MARCACAO_VOLUME'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 6
      Searchable = False
      Sortable = False
    end
    object ppBDE_totalppField8: TppField
      FieldAlias = 'VL_TOT_QTDE_EMBALAGEM'
      FieldName = 'VL_TOT_QTDE_EMBALAGEM'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 7
      Searchable = False
      Sortable = False
    end
    object ppBDE_totalppField9: TppField
      FieldAlias = 'PESO_BRUTO_TOTAL'
      FieldName = 'PESO_BRUTO_TOTAL'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 8
      Searchable = False
      Sortable = False
    end
    object ppBDE_totalppField10: TppField
      FieldAlias = 'PESO_LIQ_TOTAL'
      FieldName = 'PESO_LIQ_TOTAL'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 9
      Searchable = False
      Sortable = False
    end
    object ppBDE_totalppField11: TppField
      FieldAlias = 'TX_DECL_ADICIONAL'
      FieldName = 'TX_DECL_ADICIONAL'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 10
      Searchable = False
      Sortable = False
    end
    object ppBDE_totalppField12: TppField
      FieldAlias = 'calc_dt_fatura'
      FieldName = 'calc_dt_fatura'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 11
      Searchable = False
      Sortable = False
    end
    object ppBDE_totalppField13: TppField
      FieldAlias = 'CD_LINGUA_PEDIDO'
      FieldName = 'CD_LINGUA_PEDIDO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 12
      Searchable = False
      Sortable = False
    end
    object ppBDE_totalppField14: TppField
      FieldAlias = 'soma_tara'
      FieldName = 'soma_tara'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 13
      Searchable = False
      Sortable = False
    end
    object ppBDE_totalppField15: TppField
      FieldAlias = 'CUSTOMER'
      FieldName = 'CUSTOMER'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 14
      Searchable = False
      Sortable = False
    end
    object ppBDE_totalppField16: TppField
      FieldAlias = 'SHIPPER'
      FieldName = 'SHIPPER'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 15
      Searchable = False
      Sortable = False
    end
    object BDE_totalTX_LOGOMARCA_EMPRESA_NAC: TppField
      FieldAlias = 'TX_LOGOMARCA_EMPRESA_NAC'
      FieldName = 'TX_LOGOMARCA_EMPRESA_NAC'
      FieldLength = 10
      DisplayWidth = 10
      Position = 16
    end
  end
  object ppBDE_detalhe: TppBDEPipeline
    DataSource = ds_detalhe
    UserName = 'BDE_detalhe'
    Left = 166
    Top = 121
    MasterDataPipelineName = 'ppBDE_total'
    object ppBDE_detalheppField1: TppField
      FieldAlias = 'CD_LINGUA_PEDIDO'
      FieldName = 'CD_LINGUA_PEDIDO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 0
      Searchable = False
      Sortable = False
    end
    object ppBDE_detalheppField2: TppField
      FieldAlias = 'CD_EMBALAGEM_SUP'
      FieldName = 'CD_EMBALAGEM_SUP'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 1
      Searchable = False
      Sortable = False
    end
    object ppBDE_detalheppField3: TppField
      FieldAlias = 'CD_EMBALAGEM'
      FieldName = 'CD_EMBALAGEM'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 2
      Searchable = False
      Sortable = False
    end
    object ppBDE_detalheppField4: TppField
      FieldAlias = 'QT_EMBALAGEM_SUP'
      FieldName = 'QT_EMBALAGEM_SUP'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 3
      Searchable = False
      Sortable = False
    end
    object ppBDE_detalheppField5: TppField
      FieldAlias = 'DESC_EMB_SUP'
      FieldName = 'DESC_EMB_SUP'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 4
      Searchable = False
      Sortable = False
    end
    object ppBDE_detalheppField6: TppField
      FieldAlias = 'NR_ITEM'
      FieldName = 'NR_ITEM'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 5
      Searchable = False
      Sortable = False
    end
    object ppBDE_detalheppField8: TppField
      FieldAlias = 'DESC_EMB'
      FieldName = 'DESC_EMB'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 6
      Searchable = False
      Sortable = False
    end
    object ppBDE_detalheppField9: TppField
      FieldAlias = 'CD_MERCADORIA'
      FieldName = 'CD_MERCADORIA'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 7
      Searchable = False
      Sortable = False
    end
    object ppBDE_detalheppField10: TppField
      FieldAlias = 'TX_MERCADORIA'
      FieldName = 'TX_MERCADORIA'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 8
      Searchable = False
      Sortable = False
    end
    object ppBDE_detalheppField11: TppField
      FieldAlias = 'PESO_BRUTO'
      FieldName = 'PESO_BRUTO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 9
      Searchable = False
      Sortable = False
    end
    object ppBDE_detalheppField12: TppField
      FieldAlias = 'TARA'
      FieldName = 'TARA'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 10
      Searchable = False
      Sortable = False
    end
    object ppBDE_detalheppField13: TppField
      FieldAlias = 'PESO_LIQUIDO'
      FieldName = 'PESO_LIQUIDO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 11
      Searchable = False
      Sortable = False
    end
    object ppBDE_detalheppField14: TppField
      FieldAlias = 'COMPRIMENTO'
      FieldName = 'COMPRIMENTO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 12
      Searchable = False
      Sortable = False
    end
    object ppBDE_detalheppField15: TppField
      FieldAlias = 'LARGURA'
      FieldName = 'LARGURA'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 13
      Searchable = False
      Sortable = False
    end
    object ppBDE_detalheppField16: TppField
      FieldAlias = 'ALTURA'
      FieldName = 'ALTURA'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 14
      Searchable = False
      Sortable = False
    end
    object ppBDE_detalheppField17: TppField
      FieldAlias = 'NR_PROCESSO'
      FieldName = 'NR_PROCESSO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 15
      Searchable = False
      Sortable = False
    end
    object ppBDE_detalheppMasterFieldLink1: TppMasterFieldLink
      MasterFieldName = 'NR_PROCESSO'
      DetailFieldName = 'NR_PROCESSO'
      DetailSortOrder = soAscending
    end
  end
end
