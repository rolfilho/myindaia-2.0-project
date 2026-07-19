object Frm_impressao: TFrm_impressao
  Left = 437
  Top = 280
  BorderStyle = bsNone
  BorderWidth = 2
  Caption = 'Op'#231#245'es de Impress'#227'o'
  ClientHeight = 519
  ClientWidth = 645
  Color = clBlack
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = True
  Position = poOwnerFormCenter
  OnClose = FormClose
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object pnl_main: TPanel
    Left = 0
    Top = 0
    Width = 645
    Height = 519
    Align = alClient
    BevelOuter = bvNone
    BorderWidth = 3
    Color = clWhite
    Ctl3D = True
    ParentCtl3D = False
    TabOrder = 0
    object pnl_mail: TPanel
      Left = 3
      Top = 82
      Width = 639
      Height = 196
      Align = alTop
      BevelInner = bvLowered
      TabOrder = 2
      Visible = False
      object Shape10: TShape
        Left = 99
        Top = 42
        Width = 95
        Height = 21
        Brush.Style = bsClear
        Pen.Color = clWhite
      end
      object Shape9: TShape
        Left = 99
        Top = 18
        Width = 95
        Height = 21
        Brush.Style = bsClear
        Pen.Color = clWhite
      end
      object Shape5: TShape
        Left = 495
        Top = 41
        Width = 131
        Height = 46
        Brush.Style = bsClear
        Pen.Color = clGray
      end
      object Shape4: TShape
        Left = 15
        Top = 17
        Width = 82
        Height = 71
        Brush.Style = bsClear
        Pen.Color = clGray
      end
      object Label2: TLabel
        Left = 29
        Top = 22
        Width = 53
        Height = 54
        Alignment = taCenter
        Caption = #353
        Color = clWindow
        Font.Charset = SYMBOL_CHARSET
        Font.Color = clWindowText
        Font.Height = -53
        Font.Name = 'Webdings'
        Font.Style = []
        ParentColor = False
        ParentFont = False
        Transparent = True
        Layout = tlCenter
      end
      object Label7: TLabel
        Left = 146
        Top = 70
        Width = 44
        Height = 13
        Hint = 'Subject of this message'
        Caption = 'Assunto :'
        ParentShowHint = False
        ShowHint = True
      end
      object Label6: TLabel
        Left = 172
        Top = 46
        Width = 18
        Height = 13
        Hint = 'cc: name(s), comma delimited'
        Caption = 'cc :'
        ParentShowHint = False
        ShowHint = True
      end
      object Label5: TLabel
        Left = 162
        Top = 22
        Width = 28
        Height = 13
        Hint = 'Recipient'#39's name(s), comma delimited'
        Caption = 'Para :'
        ParentShowHint = False
        ShowHint = True
      end
      object Label1: TLabel
        Left = 501
        Top = 46
        Width = 91
        Height = 13
        Caption = 'Formato do arquivo'
      end
      object Shape1: TShape
        Left = 98
        Top = 17
        Width = 97
        Height = 23
        Brush.Style = bsClear
        Pen.Color = clGray
      end
      object Shape2: TShape
        Left = 98
        Top = 41
        Width = 97
        Height = 23
        Brush.Style = bsClear
        Pen.Color = clGray
      end
      object Shape3: TShape
        Left = 98
        Top = 65
        Width = 97
        Height = 23
        Brush.Style = bsClear
        Pen.Color = clGray
      end
      object Shape8: TShape
        Left = 495
        Top = 17
        Width = 131
        Height = 22
        Brush.Style = bsClear
        Pen.Color = clGray
      end
      object SpeedButton3: TSpeedButton
        Left = 101
        Top = 19
        Width = 92
        Height = 19
        Flat = True
        OnClick = SpeedButton3Click
      end
      object SpeedButton4: TSpeedButton
        Left = 101
        Top = 43
        Width = 92
        Height = 19
        Flat = True
        OnClick = SpeedButton4Click
      end
      object LstFiles: TListBox
        Left = 14
        Top = 156
        Width = 612
        Height = 23
        Color = 15987699
        Ctl3D = False
        Enabled = False
        ItemHeight = 13
        ParentCtl3D = False
        TabOrder = 7
      end
      object reMessageText: TRichEdit
        Left = 13
        Top = 92
        Width = 615
        Height = 63
        BevelInner = bvNone
        BevelOuter = bvNone
        BevelKind = bkFlat
        Ctl3D = False
        Lines.Strings = (
          '')
        ParentCtl3D = False
        TabOrder = 6
      end
      object Eto: TEdit
        Left = 196
        Top = 17
        Width = 296
        Height = 23
        AutoSize = False
        Ctl3D = False
        ParentCtl3D = False
        ParentShowHint = False
        ShowHint = True
        TabOrder = 0
        OnChange = EtoChange
      end
      object EdtCC: TEdit
        Left = 196
        Top = 41
        Width = 296
        Height = 23
        AutoSize = False
        Ctl3D = False
        ParentCtl3D = False
        ParentShowHint = False
        ShowHint = True
        TabOrder = 2
        OnChange = EdtCCChange
      end
      object eSubject: TEdit
        Left = 196
        Top = 65
        Width = 296
        Height = 23
        AutoSize = False
        Ctl3D = False
        ParentCtl3D = False
        TabOrder = 4
      end
      object ComboBox_TP: TComboBox
        Left = 502
        Top = 59
        Width = 118
        Height = 21
        ItemHeight = 13
        ItemIndex = 3
        TabOrder = 3
        Text = 'PDF'
        Items.Strings = (
          'RTF '
          'XLS'
          'HTML'
          'PDF')
      end
      object chkCopyMe: TCheckBox
        Left = 500
        Top = 20
        Width = 123
        Height = 17
        Caption = 'me copiar neste email'
        Checked = True
        State = cbChecked
        TabOrder = 1
      end
      object wbEmail: TWebBrowser
        Left = 2
        Top = 91
        Width = 635
        Height = 103
        Align = alBottom
        TabOrder = 5
        ControlData = {
          4C000000A1410000A50A00000000000000000000000000000000000000000000
          000000004C000000000000000000000001000000E0D057007335CF11AE690800
          2B2E12620B000000000000004C0000000114020000000000C000000000000046
          8000000000000000000000000000000000000000000000000000000000000000
          00000000000000000100000000000000000000000000000000000000}
      end
    end
    object Panel1: TPanel
      Left = 3
      Top = 454
      Width = 639
      Height = 42
      Align = alBottom
      BevelInner = bvLowered
      TabOrder = 5
      object SpeedButton1: TSpeedButton
        Left = 433
        Top = 7
        Width = 99
        Height = 28
        Caption = 'Visualizar...'
        Flat = True
        Glyph.Data = {
          76010000424D7601000000000000760000002800000020000000100000000100
          04000000000000010000130B0000130B00001000000000000000000000000000
          800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00300000000000
          00033FFFFFFFFFFFFFFF0888888888888880777777777777777F088888888888
          8880777777777777777F0000000000000000FFFFFFFFFFFFFFFF0F8F8F8F8F8F
          8F80777777777777777F08F8F8F8F8F8F9F0777777777777777F0F8F8F8F8F8F
          8F807777777777777F7F0000000000000000777777777777777F3330FFFFFFFF
          03333337F3FFFF3F7F333330F0000F0F03333337F77773737F333330FFFFFFFF
          03333337F3FF3FFF7F333330F00F000003333337F773777773333330FFFF0FF0
          33333337F3FF7F3733333330F08F0F0333333337F7737F7333333330FFFF0033
          33333337FFFF7733333333300000033333333337777773333333}
        NumGlyphs = 2
        OnClick = SpeedButton1Click
      end
      object SpeedButton2: TSpeedButton
        Left = 533
        Top = 7
        Width = 99
        Height = 28
        Caption = 'Sair'
        Flat = True
        Glyph.Data = {
          76010000424D7601000000000000760000002800000020000000100000000100
          04000000000000010000120B0000120B00001000000000000000000000000000
          800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00330000000000
          03333377777777777F333301BBBBBBBB033333773F3333337F3333011BBBBBBB
          0333337F73F333337F33330111BBBBBB0333337F373F33337F333301110BBBBB
          0333337F337F33337F333301110BBBBB0333337F337F33337F333301110BBBBB
          0333337F337F33337F333301110BBBBB0333337F337F33337F333301110BBBBB
          0333337F337F33337F333301110BBBBB0333337F337FF3337F33330111B0BBBB
          0333337F337733337F333301110BBBBB0333337F337F33337F333301110BBBBB
          0333337F3F7F33337F333301E10BBBBB0333337F7F7F33337F333301EE0BBBBB
          0333337F777FFFFF7F3333000000000003333377777777777333}
        NumGlyphs = 2
        OnClick = SpeedButton2Click
      end
    end
    object DBGrid1: TDBGrid
      Left = 3
      Top = 376
      Width = 639
      Height = 78
      Align = alClient
      Ctl3D = False
      DataSource = ds_relatorios
      ParentCtl3D = False
      TabOrder = 4
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = []
      Columns = <
        item
          Expanded = False
          FieldName = 'DESCRIAO'
          Title.Caption = 'Descri'#231#227'o'
          Title.Color = clBlack
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clWhite
          Title.Font.Height = -11
          Title.Font.Name = 'MS Sans Serif'
          Title.Font.Style = [fsBold]
          Width = 200
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'NM_PATH'
          Title.Caption = 'Path'
          Title.Color = clBlack
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clWhite
          Title.Font.Height = -11
          Title.Font.Name = 'MS Sans Serif'
          Title.Font.Style = [fsBold]
          Width = 269
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'DT_DOCUMENTO'
          Title.Caption = 'Data'
          Title.Color = clBlack
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clWhite
          Title.Font.Height = -11
          Title.Font.Name = 'MS Sans Serif'
          Title.Font.Style = [fsBold]
          Width = 60
          Visible = True
        end>
    end
    object Panel2: TPanel
      Left = 3
      Top = 31
      Width = 639
      Height = 51
      Align = alTop
      BevelInner = bvLowered
      Color = clSilver
      TabOrder = 1
      object RadioGroup_main: TRadioGroup
        Left = 8
        Top = 3
        Width = 622
        Height = 40
        Columns = 6
        ItemIndex = 0
        Items.Strings = (
          'Visualiza'#231#227'o'
          'Impressora'
          'Arquivo'
          'Email'
          'Designer'
          'Vincular')
        TabOrder = 0
        OnClick = RadioGroup_mainClick
      end
    end
    object Panel3: TPanel
      Left = 3
      Top = 3
      Width = 639
      Height = 28
      Align = alTop
      BevelInner = bvLowered
      TabOrder = 0
      object Label9: TLabel
        Left = 9
        Top = 8
        Width = 227
        Height = 13
        Caption = 'Gerenciador de Impress'#227'o - [ myIndai'#225' ]'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
    end
    object pnl_arquivo: TPanel
      Left = 3
      Top = 278
      Width = 639
      Height = 98
      Align = alTop
      BevelInner = bvLowered
      TabOrder = 3
      Visible = False
      object Shape6: TShape
        Left = 14
        Top = 14
        Width = 80
        Height = 69
        Brush.Style = bsClear
        Pen.Color = clGray
      end
      object Shape7: TShape
        Left = 96
        Top = 14
        Width = 385
        Height = 69
        Brush.Style = bsClear
        Pen.Color = clGray
      end
      object Label8: TLabel
        Left = 28
        Top = 24
        Width = 53
        Height = 54
        Caption = #205
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -53
        Font.Name = 'Webdings'
        Font.Style = []
        ParentFont = False
      end
      object Label3: TLabel
        Left = 112
        Top = 30
        Width = 91
        Height = 13
        Caption = 'Formato do arquivo'
      end
      object Label4: TLabel
        Left = 217
        Top = 30
        Width = 97
        Height = 13
        Caption = 'Salva arquivo como '
      end
      object btn_co_unid_neg: TSpeedButton
        Left = 439
        Top = 43
        Width = 22
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
      object ComboBox2: TComboBox
        Left = 112
        Top = 43
        Width = 94
        Height = 21
        ItemHeight = 13
        TabOrder = 0
        Text = 'RTF '
        Items.Strings = (
          'RTF '
          'XLS'
          'HTML'
          'PDF')
      end
      object Edit_arquivo: TEdit
        Left = 216
        Top = 43
        Width = 222
        Height = 21
        TabOrder = 1
      end
    end
    object Panel4: TPanel
      Left = 3
      Top = 496
      Width = 639
      Height = 20
      Align = alBottom
      BevelInner = bvLowered
      TabOrder = 6
      object lblStatus: TLabel
        Left = 5
        Top = 4
        Width = 572
        Height = 13
        AutoSize = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
    end
  end
  object OpenDialogRTF: TOpenDialog
    Filter = '*.RTF|RTF files'
    Left = 96
    Top = 268
  end
  object OpenDialogXLS: TOpenDialog
    Filter = '*.XLS|EXCEL files'
    Left = 176
    Top = 220
  end
  object OpenDialogHTML: TOpenDialog
    Filter = '*.HTML|HTML files'
    Left = 288
    Top = 212
  end
  object OpenDialogPDF: TOpenDialog
    Filter = '*.PDF|PDF files'
    Left = 208
    Top = 324
  end
  object ppReport1: TppReport
    AutoStop = False
    DataPipeline = frm_fatura_comercial2.BDE_detalhe
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = 'Report'
    PrinterSetup.PaperName = 'A4'
    PrinterSetup.PrinterName = 'Default'
    PrinterSetup.mmMarginBottom = 15000
    PrinterSetup.mmMarginLeft = 10000
    PrinterSetup.mmMarginRight = 10000
    PrinterSetup.mmMarginTop = 20000
    PrinterSetup.mmPaperHeight = 297000
    PrinterSetup.mmPaperWidth = 210000
    PrinterSetup.PaperSize = 9
    Template.FileName = 'C:\DDBROKER\fatcomCroda.rtm'
    Units = utMillimeters
    DeviceType = 'Screen'
    OutlineSettings.CreateNode = True
    OutlineSettings.CreatePageNodes = True
    OutlineSettings.Enabled = True
    OutlineSettings.Visible = False
    PreviewFormSettings.WindowState = wsMaximized
    PreviewFormSettings.ZoomSetting = zsPageWidth
    TextSearchSettings.DefaultString = '<FindText>'
    TextSearchSettings.Enabled = True
    Left = 376
    Top = 255
    Version = '7.02'
    mmColumnWidth = 0
    DataPipelineName = 'BDE_detalhe'
    object ppHeaderBand1: TppHeaderBand
      PrintHeight = phDynamic
      PrintOnLastPage = False
      mmBottomOffset = 0
      mmHeight = 265
      mmPrintPosition = 0
    end
    object ppDetailBand1: TppDetailBand
      PrintHeight = phDynamic
      mmBottomOffset = 0
      mmHeight = 11642
      mmPrintPosition = 0
      object ppDBMemo1: TppDBMemo
        UserName = 'DBMemo1'
        CharWrap = False
        DataField = 'TX_MERCADORIA'
        DataPipeline = frm_fatura_comercial2.BDE_detalhe
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        Stretch = True
        Transparent = True
        DataPipelineName = 'BDE_detalhe'
        mmHeight = 10583
        mmLeft = 87577
        mmTop = 1058
        mmWidth = 60061
        BandType = 4
        mmBottomOffset = 0
        mmOverFlowOffset = 0
        mmStopPosition = 0
        mmLeading = 0
      end
      object ppDBText24: TppDBText
        UserName = 'DBText24'
        DataField = 'QT_MERCADORIA'
        DataPipeline = frm_fatura_comercial2.BDE_detalhe
        DisplayFormat = '#0.,00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'BDE_detalhe'
        mmHeight = 3175
        mmLeft = 1588
        mmTop = 1058
        mmWidth = 14552
        BandType = 4
      end
      object ppDBText25: TppDBText
        UserName = 'DBText25'
        DataField = 'CD_MERCADORIA'
        DataPipeline = frm_fatura_comercial2.BDE_detalhe
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'BDE_detalhe'
        mmHeight = 3175
        mmLeft = 19050
        mmTop = 1058
        mmWidth = 31221
        BandType = 4
      end
      object ppDBText26: TppDBText
        UserName = 'DBText26'
        BlankWhenZero = True
        DataField = 'VL_UNITARIO5'
        DataPipeline = frm_fatura_comercial2.BDE_detalhe
        DisplayFormat = '#0.,00000'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taCentered
        Transparent = True
        DataPipelineName = 'BDE_detalhe'
        mmHeight = 3175
        mmLeft = 148696
        mmTop = 1058
        mmWidth = 19579
        BandType = 4
      end
      object ppDBText27: TppDBText
        UserName = 'DBText27'
        BlankWhenZero = True
        DataField = 'VL_TOT_ITEM'
        DataPipeline = frm_fatura_comercial2.BDE_detalhe
        DisplayFormat = '#0.,00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'BDE_detalhe'
        mmHeight = 3175
        mmLeft = 169334
        mmTop = 1058
        mmWidth = 19050
        BandType = 4
      end
      object ppDBText9: TppDBText
        UserName = 'DBText67'
        DataField = 'calcPackage'
        DataPipeline = frm_fatura_comercial2.BDE_detalhe
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'BDE_detalhe'
        mmHeight = 3175
        mmLeft = 51594
        mmTop = 1058
        mmWidth = 35190
        BandType = 4
      end
    end
    object ppFooterBand1: TppFooterBand
      mmBottomOffset = 0
      mmHeight = 97896
      mmPrintPosition = 0
      object ppShape4: TppShape
        UserName = 'Shape4'
        Pen.Width = 2
        mmHeight = 81492
        mmLeft = 0
        mmTop = 16404
        mmWidth = 189971
        BandType = 8
      end
      object ppDBMemo8: TppDBMemo
        UserName = 'DBMemo8'
        CharWrap = False
        DataField = 'TX_NOTIFY1'
        DataPipeline = frm_fatura_comercial2.BDE_total
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        Visible = False
        DataPipelineName = 'BDE_total'
        mmHeight = 16669
        mmLeft = 3704
        mmTop = 80698
        mmWidth = 86519
        BandType = 8
        mmBottomOffset = 0
        mmOverFlowOffset = 0
        mmStopPosition = 0
        mmLeading = 0
      end
      object ppDBText79: TppDBText
        UserName = 'DBText79'
        DataField = 'NIT_NOTIFY'
        DataPipeline = frm_fatura_comercial2.BDE_total
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'BDE_total'
        mmHeight = 2879
        mmLeft = 3704
        mmTop = 91546
        mmWidth = 79111
        BandType = 8
      end
      object ppShape7: TppShape
        UserName = 'Shape7'
        Brush.Style = bsClear
        Pen.Width = 2
        mmHeight = 11906
        mmLeft = 0
        mmTop = 63500
        mmWidth = 189971
        BandType = 8
      end
      object ppShape10: TppShape
        UserName = 'Shape10'
        Brush.Style = bsClear
        Pen.Width = 2
        mmHeight = 11906
        mmLeft = 122238
        mmTop = 63500
        mmWidth = 67733
        BandType = 8
      end
      object ppDBText10: TppDBText
        UserName = 'DBText9'
        DataField = 'ROD01'
        DataPipeline = frm_fatura_comercial2.ppBDETexto
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppBDETexto'
        mmHeight = 3440
        mmLeft = 794
        mmTop = 18256
        mmWidth = 59796
        BandType = 8
      end
      object ppDBText11: TppDBText
        UserName = 'DBText10'
        DataField = 'ROD08'
        DataPipeline = frm_fatura_comercial2.ppBDETexto
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        ParentDataPipeline = False
        TextAlignment = taCentered
        Transparent = True
        DataPipelineName = 'ppBDETexto'
        mmHeight = 3440
        mmLeft = 61913
        mmTop = 17463
        mmWidth = 59796
        BandType = 8
      end
      object ppDBText12: TppDBText
        UserName = 'DBText11'
        DataField = 'ROD09'
        DataPipeline = frm_fatura_comercial2.ppBDETexto
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = [fsBold]
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppBDETexto'
        mmHeight = 3429
        mmLeft = 62177
        mmTop = 43392
        mmWidth = 32015
        BandType = 8
      end
      object ppDBText13: TppDBText
        UserName = 'DBText12'
        DataField = 'ROD10'
        DataPipeline = frm_fatura_comercial2.ppBDETexto
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = [fsBold]
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppBDETexto'
        mmHeight = 3387
        mmLeft = 61913
        mmTop = 49213
        mmWidth = 32808
        BandType = 8
      end
      object ppDBText14: TppDBText
        UserName = 'DBText13'
        DataField = 'ROD07'
        DataPipeline = frm_fatura_comercial2.ppBDETexto
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppBDETexto'
        mmHeight = 3440
        mmLeft = 794
        mmTop = 75936
        mmWidth = 59796
        BandType = 8
      end
      object ppDBText15: TppDBText
        UserName = 'DBText14'
        DataField = 'ROD06'
        DataPipeline = frm_fatura_comercial2.ppBDETexto
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppBDETexto'
        mmHeight = 3440
        mmLeft = 529
        mmTop = 64294
        mmWidth = 59796
        BandType = 8
      end
      object ppDBText16: TppDBText
        UserName = 'DBText15'
        DataField = 'ROD02'
        DataPipeline = frm_fatura_comercial2.ppBDETexto
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppBDETexto'
        mmHeight = 3440
        mmLeft = 1058
        mmTop = 30163
        mmWidth = 28046
        BandType = 8
      end
      object ppDBText17: TppDBText
        UserName = 'DBText16'
        DataField = 'ROD03'
        DataPipeline = frm_fatura_comercial2.ppBDETexto
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppBDETexto'
        mmHeight = 3440
        mmLeft = 1058
        mmTop = 34660
        mmWidth = 28046
        BandType = 8
      end
      object ppDBText18: TppDBText
        UserName = 'DBText17'
        DataField = 'ROD04'
        DataPipeline = frm_fatura_comercial2.ppBDETexto
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppBDETexto'
        mmHeight = 3440
        mmLeft = 1058
        mmTop = 39158
        mmWidth = 28046
        BandType = 8
      end
      object ppDBText19: TppDBText
        UserName = 'DBText18'
        DataField = 'ROD05'
        DataPipeline = frm_fatura_comercial2.ppBDETexto
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppBDETexto'
        mmHeight = 3440
        mmLeft = 1058
        mmTop = 43656
        mmWidth = 31750
        BandType = 8
      end
      object ppDBText20: TppDBText
        UserName = 'DBText19'
        DataField = 'ROD11'
        DataPipeline = frm_fatura_comercial2.ppBDETexto
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppBDETexto'
        mmHeight = 3440
        mmLeft = 123561
        mmTop = 31750
        mmWidth = 28046
        BandType = 8
      end
      object ppDBText21: TppDBText
        UserName = 'DBText20'
        DataField = 'ROD12'
        DataPipeline = frm_fatura_comercial2.ppBDETexto
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppBDETexto'
        mmHeight = 3440
        mmLeft = 123561
        mmTop = 46302
        mmWidth = 28046
        BandType = 8
      end
      object ppDBText23: TppDBText
        UserName = 'DBText21'
        DataField = 'ROD13'
        DataPipeline = frm_fatura_comercial2.ppBDETexto
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppBDETexto'
        mmHeight = 3440
        mmLeft = 123561
        mmTop = 50800
        mmWidth = 28046
        BandType = 8
      end
      object ppLabel4: TppLabel
        UserName = 'Label4'
        Caption = 'VIA'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3440
        mmLeft = 1058
        mmTop = 47890
        mmWidth = 5292
        BandType = 8
      end
      object ppLabel5: TppLabel
        UserName = 'Label5'
        Caption = 'B/L'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3440
        mmLeft = 1058
        mmTop = 51858
        mmWidth = 5027
        BandType = 8
      end
      object ppLabel6: TppLabel
        UserName = 'Label6'
        Caption = 'L/C NR.'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3440
        mmLeft = 124354
        mmTop = 64558
        mmWidth = 11377
        BandType = 8
      end
      object ppLabel8: TppLabel
        UserName = 'Label8'
        Caption = 'TOTAL           :'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3810
        mmLeft = 123561
        mmTop = 55033
        mmWidth = 21336
        BandType = 8
      end
      object ppLabel9: TppLabel
        UserName = 'Label9'
        Caption = 'SUB-TOTAL:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3440
        mmLeft = 123561
        mmTop = 21431
        mmWidth = 19315
        BandType = 8
      end
      object ppDBMemo3: TppDBMemo
        UserName = 'DBMemo3'
        CharWrap = False
        DataField = 'calcMarcas'
        DataPipeline = frm_fatura_comercial2.BDE_detalhe
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'BDE_detalhe'
        mmHeight = 19579
        mmLeft = 62442
        mmTop = 21960
        mmWidth = 59002
        BandType = 8
        mmBottomOffset = 0
        mmOverFlowOffset = 0
        mmStopPosition = 0
        mmLeading = 0
      end
      object ppDBMemo4: TppDBMemo
        UserName = 'DBMemo4'
        CharWrap = False
        DataField = 'calcPacote'
        DataPipeline = frm_fatura_comercial2.BDE_detalhe
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'BDE_detalhe'
        mmHeight = 7144
        mmLeft = 1058
        mmTop = 22225
        mmWidth = 59531
        BandType = 8
        mmBottomOffset = 0
        mmOverFlowOffset = 0
        mmStopPosition = 0
        mmLeading = 0
      end
      object ppDBText28: TppDBText
        UserName = 'DBText23'
        DataField = 'TERMO_PAGTO'
        DataPipeline = frm_fatura_comercial2.BDE_total
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'BDE_total'
        mmHeight = 3260
        mmLeft = 1588
        mmTop = 71173
        mmWidth = 120386
        BandType = 8
      end
      object ppLabel10: TppLabel
        UserName = 'Label10'
        Caption = 'KG'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3175
        mmLeft = 55827
        mmTop = 30163
        mmWidth = 4233
        BandType = 8
      end
      object ppLabel11: TppLabel
        UserName = 'Label101'
        Caption = 'KG'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3175
        mmLeft = 55827
        mmTop = 34396
        mmWidth = 4233
        BandType = 8
      end
      object ppLabel12: TppLabel
        UserName = 'Label12'
        Caption = 'M3'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3175
        mmLeft = 56092
        mmTop = 38894
        mmWidth = 3969
        BandType = 8
      end
      object ppDBText29: TppDBText
        UserName = 'DBText28'
        DataField = 'NM_NOTIFY'
        DataPipeline = frm_fatura_comercial2.BDE_total
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'BDE_total'
        mmHeight = 2879
        mmLeft = 3704
        mmTop = 80433
        mmWidth = 78846
        BandType = 8
      end
      object ppDBText30: TppDBText
        UserName = 'DBText29'
        DataField = 'calc_notify3'
        DataPipeline = frm_fatura_comercial2.BDE_total
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 6
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'BDE_total'
        mmHeight = 2498
        mmLeft = 3704
        mmTop = 83344
        mmWidth = 85725
        BandType = 8
      end
      object ppDBText31: TppDBText
        UserName = 'DBText30'
        DataField = 'calc_notify2'
        DataPipeline = frm_fatura_comercial2.BDE_total
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'BDE_total'
        mmHeight = 2879
        mmLeft = 3704
        mmTop = 86254
        mmWidth = 79375
        BandType = 8
      end
      object ppDBText42: TppDBText
        UserName = 'DBText42'
        DataField = 'TRANSPORTE'
        DataPipeline = frm_fatura_comercial2.BDE_total
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'BDE_total'
        mmHeight = 2879
        mmLeft = 28046
        mmTop = 43921
        mmWidth = 32015
        BandType = 8
      end
      object ppDBText43: TppDBText
        UserName = 'DBText43'
        DataField = 'VIA'
        DataPipeline = frm_fatura_comercial2.BDE_total
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'BDE_total'
        mmHeight = 3175
        mmLeft = 11642
        mmTop = 48154
        mmWidth = 48419
        BandType = 8
      end
      object ppDBText44: TppDBText
        UserName = 'DBText44'
        DataField = 'NR_CONHECIMENTO'
        DataPipeline = frm_fatura_comercial2.BDE_total
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'BDE_total'
        mmHeight = 3175
        mmLeft = 11642
        mmTop = 51858
        mmWidth = 48419
        BandType = 8
      end
      object ppDBText52: TppDBText
        UserName = 'DBText52'
        DataField = 'CD_INCOTERM'
        DataPipeline = frm_fatura_comercial2.BDE_total
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'BDE_total'
        mmHeight = 3704
        mmLeft = 134938
        mmTop = 55298
        mmWidth = 7938
        BandType = 8
      end
      object ppDBText60: TppDBText
        UserName = 'DBText60'
        DataField = 'NM_LOCAL_DESTINO'
        DataPipeline = frm_fatura_comercial2.BDE_total
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'BDE_total'
        mmHeight = 3175
        mmLeft = 94721
        mmTop = 43392
        mmWidth = 26988
        BandType = 8
      end
      object ppDBText61: TppDBText
        UserName = 'DBText61'
        DataField = 'NM_LOCAL_ORIGEM'
        DataPipeline = frm_fatura_comercial2.BDE_total
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'BDE_total'
        mmHeight = 3175
        mmLeft = 94721
        mmTop = 48948
        mmWidth = 26988
        BandType = 8
      end
      object ppLine1: TppLine
        UserName = 'Line1'
        Pen.Width = 2
        Position = lpLeft
        StretchWithParent = True
        Weight = 1.500000000000000000
        mmHeight = 46831
        mmLeft = 60854
        mmTop = 16669
        mmWidth = 2117
        BandType = 8
      end
      object ppLine14: TppLine
        UserName = 'Line14'
        Pen.Width = 2
        Position = lpLeft
        StretchWithParent = True
        Weight = 1.500000000000000000
        mmHeight = 46567
        mmLeft = 122238
        mmTop = 17198
        mmWidth = 2117
        BandType = 8
      end
      object ppLine18: TppLine
        UserName = 'Line18'
        Pen.Width = 2
        Weight = 1.500000000000000000
        mmHeight = 1852
        mmLeft = 265
        mmTop = 29369
        mmWidth = 60590
        BandType = 8
      end
      object ppLine19: TppLine
        UserName = 'Line19'
        Pen.Width = 2
        Weight = 1.500000000000000000
        mmHeight = 1852
        mmLeft = 61119
        mmTop = 21431
        mmWidth = 61119
        BandType = 8
      end
      object ppLine20: TppLine
        UserName = 'Line20'
        Pen.Width = 2
        Weight = 1.500000000000000000
        mmHeight = 1852
        mmLeft = 61119
        mmTop = 42069
        mmWidth = 61119
        BandType = 8
      end
      object ppDBText41: TppDBText
        UserName = 'DBText302'
        DataField = 'TELEFONE_NOTIFY'
        DataPipeline = frm_fatura_comercial2.BDE_total
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'BDE_total'
        mmHeight = 2879
        mmLeft = 3704
        mmTop = 88900
        mmWidth = 79375
        BandType = 8
      end
      object ppPesoLiq: TppLabel
        UserName = 'Label13'
        Caption = '5.040,0000'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3175
        mmLeft = 30163
        mmTop = 30427
        mmWidth = 23283
        BandType = 8
      end
      object ppPesoBruto: TppLabel
        UserName = 'Label15'
        Caption = '5.588,2400'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3175
        mmLeft = 30163
        mmTop = 34925
        mmWidth = 23283
        BandType = 8
      end
      object ppCubagem: TppLabel
        UserName = 'Label16'
        Caption = '9,097'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3175
        mmLeft = 30163
        mmTop = 39158
        mmWidth = 23283
        BandType = 8
      end
      object ppSubTot: TppLabel
        UserName = 'Label17'
        Caption = '34.574,40'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3175
        mmLeft = 168540
        mmTop = 21167
        mmWidth = 18785
        BandType = 8
      end
      object ppDesc: TppLabel
        UserName = 'Label18'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        Visible = False
        mmHeight = 3175
        mmLeft = 144992
        mmTop = 18521
        mmWidth = 18785
        BandType = 8
      end
      object ppTotFob: TppLabel
        UserName = 'Label19'
        Caption = '34.574,40'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3528
        mmLeft = 175260
        mmTop = 35983
        mmWidth = 12065
        BandType = 8
      end
      object ppFrete: TppLabel
        UserName = 'Label20'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        Visible = False
        mmHeight = 3175
        mmLeft = 145786
        mmTop = 26458
        mmWidth = 18785
        BandType = 8
      end
      object ppSeguro: TppLabel
        UserName = 'Label21'
        Caption = '0,00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        Visible = False
        mmHeight = 3175
        mmLeft = 145257
        mmTop = 22490
        mmWidth = 18785
        BandType = 8
      end
      object ppTot: TppLabel
        UserName = 'Label22'
        Caption = '34.574,40'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3175
        mmLeft = 168540
        mmTop = 55298
        mmWidth = 18785
        BandType = 8
      end
      object ppDBText49: TppDBText
        UserName = 'DBText49'
        DataField = 'VL_DESCONTO'
        DataPipeline = frm_fatura_comercial2.BDE_detalhe
        DisplayFormat = '#0.,00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'BDE_detalhe'
        mmHeight = 3440
        mmLeft = 168540
        mmTop = 31750
        mmWidth = 18256
        BandType = 8
      end
      object ppDBText50: TppDBText
        UserName = 'DBText201'
        DataField = 'VL_FRETE'
        DataPipeline = frm_fatura_comercial2.BDE_detalhe
        DisplayFormat = '#0.,00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'BDE_detalhe'
        mmHeight = 3440
        mmLeft = 168275
        mmTop = 46302
        mmWidth = 18785
        BandType = 8
      end
      object ppDBText51: TppDBText
        UserName = 'DBText51'
        DataField = 'VL_SEGURO'
        DataPipeline = frm_fatura_comercial2.BDE_detalhe
        DisplayFormat = '#0.,00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'BDE_detalhe'
        mmHeight = 3440
        mmLeft = 168540
        mmTop = 50800
        mmWidth = 18785
        BandType = 8
      end
      object ppDBText62: TppDBText
        UserName = 'DBText62'
        DataField = 'TX_TERMO_PAGTO'
        DataPipeline = frm_fatura_comercial2.BDE_total
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        Visible = False
        DataPipelineName = 'BDE_total'
        mmHeight = 3175
        mmLeft = 1588
        mmTop = 67469
        mmWidth = 120121
        BandType = 8
      end
      object ppDBText63: TppDBText
        UserName = 'DBText601'
        DataField = 'NM_LOCAL_DESTINO_1'
        DataPipeline = frm_fatura_comercial2.BDE_total
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        Visible = False
        DataPipelineName = 'BDE_total'
        mmHeight = 3175
        mmLeft = 94721
        mmTop = 43392
        mmWidth = 26988
        BandType = 8
      end
      object ppDBText64: TppDBText
        UserName = 'DBText64'
        DataField = 'NM_LOCAL_ORIGEM_1'
        DataPipeline = frm_fatura_comercial2.BDE_total
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        Visible = False
        DataPipelineName = 'BDE_total'
        mmHeight = 3175
        mmLeft = 94721
        mmTop = 49213
        mmWidth = 26988
        BandType = 8
      end
      object ppDBText47: TppDBText
        UserName = 'DBText47'
        DataField = 'ROD14'
        DataPipeline = frm_fatura_comercial2.ppBDETexto
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppBDETexto'
        mmHeight = 3440
        mmLeft = 123031
        mmTop = 41804
        mmWidth = 43921
        BandType = 8
      end
      object ppDBText65: TppDBText
        UserName = 'DBText65'
        DataField = 'VL_ACRESCIMO'
        DataPipeline = frm_fatura_comercial2.BDE_detalhe
        DisplayFormat = '#0.,00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'BDE_detalhe'
        mmHeight = 3440
        mmLeft = 169334
        mmTop = 41540
        mmWidth = 18256
        BandType = 8
      end
      object ppLine2: TppLine
        UserName = 'Line8'
        Pen.Width = 2
        Position = lpLeft
        StretchWithParent = True
        Weight = 1.500000000000000000
        mmHeight = 22490
        mmLeft = 93663
        mmTop = 74877
        mmWidth = 2117
        BandType = 8
      end
      object ppDBText32: TppDBText
        UserName = 'DBText41'
        DataField = 'NM_PAIS_DESTINO_1'
        DataPipeline = frm_fatura_comercial2.BDE_total
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'BDE_total'
        mmHeight = 3175
        mmLeft = 96309
        mmTop = 54769
        mmWidth = 25400
        BandType = 8
      end
      object ppDBText33: TppDBText
        UserName = 'DBText48'
        DataField = 'NM_PAIS_ORIGEM'
        DataPipeline = frm_fatura_comercial2.BDE_total
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'BDE_total'
        mmHeight = 3175
        mmLeft = 94721
        mmTop = 60061
        mmWidth = 26988
        BandType = 8
      end
      object ppDBText34: TppDBText
        UserName = 'DBText50'
        DataField = 'NM_PAIS_ORIGEM_1'
        DataPipeline = frm_fatura_comercial2.BDE_total
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'BDE_total'
        mmHeight = 3175
        mmLeft = 94721
        mmTop = 60061
        mmWidth = 26988
        BandType = 8
      end
      object ppDBText35: TppDBText
        UserName = 'DBText602'
        DataField = 'NM_PAIS_DESTINO'
        DataPipeline = frm_fatura_comercial2.BDE_total
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'BDE_total'
        mmHeight = 3175
        mmLeft = 96309
        mmTop = 54769
        mmWidth = 24871
        BandType = 8
      end
      object ppDBText36: TppDBText
        UserName = 'DBText63'
        DataField = 'CRO02'
        DataPipeline = frm_fatura_comercial2.ppBDETexto
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = [fsBold]
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppBDETexto'
        mmHeight = 2910
        mmLeft = 62177
        mmTop = 54769
        mmWidth = 33867
        BandType = 8
      end
      object ppDBText37: TppDBText
        UserName = 'DBText66'
        DataField = 'CRO01'
        DataPipeline = frm_fatura_comercial2.ppBDETexto
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = [fsBold]
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppBDETexto'
        mmHeight = 3429
        mmLeft = 61913
        mmTop = 60061
        mmWidth = 32808
        BandType = 8
      end
      object ppDBTxtNot1: TppDBText
        UserName = 'DBTxtNot1'
        DataField = 'ROD15'
        DataPipeline = frm_fatura_comercial2.ppBDETexto
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        ParentDataPipeline = False
        Transparent = True
        Visible = False
        DataPipelineName = 'ppBDETexto'
        mmHeight = 3440
        mmLeft = 95250
        mmTop = 75936
        mmWidth = 39952
        BandType = 8
      end
      object ppDBMemNot: TppDBMemo
        UserName = 'DBMemNot'
        CharWrap = False
        DataField = 'TX_NOTIFY2'
        DataPipeline = frm_fatura_comercial2.BDE_total
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        Visible = False
        DataPipelineName = 'BDE_total'
        mmHeight = 15875
        mmLeft = 98690
        mmTop = 79904
        mmWidth = 74613
        BandType = 8
        mmBottomOffset = 0
        mmOverFlowOffset = 0
        mmStopPosition = 0
        mmLeading = 0
      end
      object ppDBTxtNot2: TppDBText
        UserName = 'DBTxtNot2'
        DataField = 'NM_NOTIFY2'
        DataPipeline = frm_fatura_comercial2.BDE_total
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        Visible = False
        DataPipelineName = 'BDE_total'
        mmHeight = 2910
        mmLeft = 98690
        mmTop = 80433
        mmWidth = 78846
        BandType = 8
      end
      object ppDBTxtNot3: TppDBText
        UserName = 'DBTxtNot3'
        DataField = 'calc_notify2_linha2'
        DataPipeline = frm_fatura_comercial2.BDE_total
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        Visible = False
        DataPipelineName = 'BDE_total'
        mmHeight = 2910
        mmLeft = 98954
        mmTop = 83344
        mmWidth = 79111
        BandType = 8
      end
      object ppDBTxtNot4: TppDBText
        UserName = 'DBText303'
        DataField = 'calc_notify2_linha3'
        DataPipeline = frm_fatura_comercial2.BDE_total
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        Visible = False
        DataPipelineName = 'BDE_total'
        mmHeight = 2910
        mmLeft = 99219
        mmTop = 86254
        mmWidth = 78581
        BandType = 8
      end
      object ppDBTxtNot5: TppDBText
        UserName = 'DBTxtNot5'
        DataField = 'TELEFONE_NOTIFY2'
        DataPipeline = frm_fatura_comercial2.BDE_total
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        Visible = False
        DataPipelineName = 'BDE_total'
        mmHeight = 2910
        mmLeft = 99219
        mmTop = 89165
        mmWidth = 79111
        BandType = 8
      end
      object ppDBTxtAss1: TppDBText
        UserName = 'DBText69'
        DataField = 'ROD16'
        DataPipeline = frm_fatura_comercial2.ppBDETexto
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppBDETexto'
        mmHeight = 3704
        mmLeft = 137584
        mmTop = 75671
        mmWidth = 8731
        BandType = 8
      end
      object ppDBTxtAss2: TppDBText
        UserName = 'DBText70'
        DataField = 'CLIENTE'
        DataPipeline = frm_fatura_comercial2.BDE_total
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'BDE_total'
        mmHeight = 3175
        mmLeft = 147109
        mmTop = 75671
        mmWidth = 41275
        BandType = 8
      end
      object ppDBTxtAss3: TppDBText
        UserName = 'DBText701'
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
        mmLeft = 106627
        mmTop = 92075
        mmWidth = 82286
        BandType = 8
      end
      object ppLineAss4: TppLine
        UserName = 'Line10'
        Weight = 0.750000000000000000
        mmHeight = 1058
        mmLeft = 93663
        mmTop = 92340
        mmWidth = 95250
        BandType = 8
      end
      object ppDBTxtDestino: TppDBText
        UserName = 'DBText35'
        DataField = 'LOCAL_TOTAL'
        DataPipeline = frm_fatura_comercial2.BDE_total
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'BDE_total'
        mmHeight = 2879
        mmLeft = 145257
        mmTop = 55827
        mmWidth = 21696
        BandType = 8
      end
      object ppDBTxtDestinoCC: TppDBText
        UserName = 'DBTxtDestinoCC'
        DataField = 'LOCAL_TOTAL_CARTA'
        DataPipeline = frm_fatura_comercial2.BDE_total
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        Visible = False
        DataPipelineName = 'BDE_total'
        mmHeight = 3175
        mmLeft = 145257
        mmTop = 55827
        mmWidth = 22490
        BandType = 8
      end
      object ppDBText38: TppDBText
        UserName = 'DBText71'
        DataField = 'CRO03'
        DataPipeline = frm_fatura_comercial2.ppBDETexto
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        WordWrap = True
        DataPipelineName = 'ppBDETexto'
        mmHeight = 13758
        mmLeft = 55827
        mmTop = 1323
        mmWidth = 82286
        BandType = 8
      end
      object ppDBText80: TppDBText
        UserName = 'DBText46'
        DataField = 'LOCAL_TOTAL'
        DataPipeline = frm_fatura_comercial2.BDE_total
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'BDE_total'
        mmHeight = 2879
        mmLeft = 146315
        mmTop = 55827
        mmWidth = 25135
        BandType = 8
      end
      object ppDBText83: TppDBText
        UserName = 'DBText83'
        DataField = 'RUC_NOTIFY'
        DataPipeline = frm_fatura_comercial2.BDE_total
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 6
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'BDE_total'
        mmHeight = 2646
        mmLeft = 3969
        mmTop = 91546
        mmWidth = 77523
        BandType = 8
      end
      object ppDBText97: TppDBText
        UserName = 'DBText97'
        DataField = 'CUIT_NOTIFY'
        DataPipeline = frm_fatura_comercial2.BDE_total
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'BDE_total'
        mmHeight = 2879
        mmLeft = 4233
        mmTop = 91546
        mmWidth = 79111
        BandType = 8
      end
      object ppLabel1: TppLabel
        UserName = 'Label23'
        Caption = 'TOTAL           :'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 123296
        mmTop = 35983
        mmWidth = 21431
        BandType = 8
      end
      object ppDBText5: TppDBText
        UserName = 'DBText68'
        DataField = 'INCOTERM2'
        DataPipeline = frm_fatura_comercial2.BDE_total
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'BDE_total'
        mmHeight = 3704
        mmLeft = 134673
        mmTop = 36248
        mmWidth = 7938
        BandType = 8
      end
    end
    object ppPageStyle2: TppPageStyle
      EndPage = 0
      SinglePage = 0
      StartPage = 0
      mmBottomOffset = 0
      mmHeight = 262000
      mmPrintPosition = 0
      object ppShape6: TppShape
        UserName = 'Shape5'
        Brush.Style = bsClear
        Pen.Width = 2
        mmHeight = 208227
        mmLeft = 0
        mmTop = 53711
        mmWidth = 189971
        BandType = 9
      end
      object ppShape8: TppShape
        UserName = 'Shape1'
        Brush.Style = bsClear
        Pen.Width = 2
        mmHeight = 20108
        mmLeft = 0
        mmTop = 20373
        mmWidth = 189971
        BandType = 9
      end
      object ppShape9: TppShape
        UserName = 'Shape3'
        Brush.Style = bsClear
        Pen.Width = 2
        mmHeight = 8996
        mmLeft = 0
        mmTop = 45244
        mmWidth = 189971
        BandType = 9
      end
      object ppLine7: TppLine
        UserName = 'Line3'
        Pen.Width = 2
        Position = lpLeft
        StretchWithParent = True
        Weight = 1.500000000000000000
        mmHeight = 216165
        mmLeft = 17727
        mmTop = 45244
        mmWidth = 2381
        BandType = 9
      end
      object ppLine9: TppLine
        UserName = 'Line4'
        Pen.Width = 2
        Position = lpLeft
        StretchWithParent = True
        Weight = 1.500000000000000000
        mmHeight = 215900
        mmLeft = 51065
        mmTop = 45244
        mmWidth = 2381
        BandType = 9
      end
      object ppLine10: TppLine
        UserName = 'Line5'
        Pen.Width = 2
        Position = lpLeft
        StretchWithParent = True
        Weight = 1.500000000000000000
        mmHeight = 216165
        mmLeft = 147109
        mmTop = 45244
        mmWidth = 1323
        BandType = 9
      end
      object ppLine11: TppLine
        UserName = 'Line6'
        Pen.Width = 2
        Position = lpLeft
        StretchWithParent = True
        Weight = 1.500000000000000000
        mmHeight = 216165
        mmLeft = 168540
        mmTop = 45244
        mmWidth = 794
        BandType = 9
      end
      object ppLabel13: TppLabel
        UserName = 'Label1'
        Caption = 'TOTAL'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3440
        mmLeft = 169598
        mmTop = 46302
        mmWidth = 19844
        BandType = 9
      end
      object ppDBText39: TppDBText
        UserName = 'DBText1'
        DataField = 'TIT09'
        DataPipeline = frm_fatura_comercial2.ppBDETexto
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        ParentDataPipeline = False
        TextAlignment = taCentered
        Transparent = True
        DataPipelineName = 'ppBDETexto'
        mmHeight = 3440
        mmLeft = 148167
        mmTop = 46038
        mmWidth = 20373
        BandType = 9
      end
      object ppDBText40: TppDBText
        UserName = 'DBText2'
        DataField = 'TIT08'
        DataPipeline = frm_fatura_comercial2.ppBDETexto
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        ParentDataPipeline = False
        TextAlignment = taCentered
        Transparent = True
        DataPipelineName = 'ppBDETexto'
        mmHeight = 3440
        mmLeft = 88371
        mmTop = 49477
        mmWidth = 58208
        BandType = 9
      end
      object ppDBText45: TppDBText
        UserName = 'DBText3'
        DataField = 'TIT07'
        DataPipeline = frm_fatura_comercial2.ppBDETexto
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        ParentDataPipeline = False
        TextAlignment = taCentered
        Transparent = True
        DataPipelineName = 'ppBDETexto'
        mmHeight = 3440
        mmLeft = 18785
        mmTop = 49477
        mmWidth = 32015
        BandType = 9
      end
      object ppDBText46: TppDBText
        UserName = 'DBText4'
        DataField = 'TIT06'
        DataPipeline = frm_fatura_comercial2.ppBDETexto
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppBDETexto'
        mmHeight = 3440
        mmLeft = 1058
        mmTop = 49477
        mmWidth = 16140
        BandType = 9
      end
      object ppDBText48: TppDBText
        UserName = 'DBText5'
        DataField = 'TIT05'
        DataPipeline = frm_fatura_comercial2.ppBDETexto
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        ParentDataPipeline = False
        TextAlignment = taCentered
        Transparent = True
        DataPipelineName = 'ppBDETexto'
        mmHeight = 3440
        mmLeft = 1058
        mmTop = 41010
        mmWidth = 187590
        BandType = 9
      end
      object ppDBText55: TppDBText
        UserName = 'DBText6'
        DataField = 'TIT03'
        DataPipeline = frm_fatura_comercial2.ppBDETexto
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppBDETexto'
        mmHeight = 3440
        mmLeft = 1323
        mmTop = 21431
        mmWidth = 84402
        BandType = 9
      end
      object ppDBText56: TppDBText
        UserName = 'DBText7'
        DataField = 'TIT04'
        DataPipeline = frm_fatura_comercial2.ppBDETexto
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppBDETexto'
        mmHeight = 3440
        mmLeft = 93398
        mmTop = 21696
        mmWidth = 94721
        BandType = 9
      end
      object ppDBText57: TppDBText
        UserName = 'DBText8'
        DataField = 'TIT02'
        DataPipeline = frm_fatura_comercial2.ppBDETexto
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppBDETexto'
        mmHeight = 3440
        mmLeft = 123296
        mmTop = 11906
        mmWidth = 13229
        BandType = 9
      end
      object ppLabel14: TppLabel
        UserName = 'Label2'
        Caption = 'N'#186
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3440
        mmLeft = 123296
        mmTop = 7408
        mmWidth = 3440
        BandType = 9
      end
      object ppLabel17: TppLabel
        UserName = 'Label3'
        Caption = 'E-MAIL:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3440
        mmLeft = 123296
        mmTop = 16404
        mmWidth = 11906
        BandType = 9
      end
      object ppDBText58: TppDBText
        UserName = 'DBText22'
        DataField = 'TIT01'
        DataPipeline = frm_fatura_comercial2.ppBDETexto
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 14
        Font.Style = [fsBold]
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppBDETexto'
        mmHeight = 5556
        mmLeft = 123031
        mmTop = 1058
        mmWidth = 65881
        BandType = 9
      end
      object ppDBText59: TppDBText
        UserName = 'DBText53'
        DataField = 'SIGLA_MOEDA'
        DataPipeline = frm_fatura_comercial2.BDE_total
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taCentered
        Transparent = True
        DataPipelineName = 'BDE_total'
        mmHeight = 3175
        mmLeft = 148432
        mmTop = 49742
        mmWidth = 20108
        BandType = 9
      end
      object ppDBText66: TppDBText
        UserName = 'DBText54'
        DataField = 'SIGLA_MOEDA'
        DataPipeline = frm_fatura_comercial2.BDE_total
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taCentered
        Transparent = True
        DataPipelineName = 'BDE_total'
        mmHeight = 3175
        mmLeft = 169863
        mmTop = 50006
        mmWidth = 19050
        BandType = 9
      end
      object ppShape11: TppShape
        UserName = 'Shape2'
        Brush.Style = bsClear
        Pen.Width = 2
        mmHeight = 5821
        mmLeft = 0
        mmTop = 39952
        mmWidth = 189971
        BandType = 9
      end
      object ppPG: TppSystemVariable
        UserName = 'pg'
        VarType = vtPageNoDesc
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 4191
        mmLeft = 178065
        mmTop = 261673
        mmWidth = 11303
        BandType = 9
      end
      object ppSystemVariable2: TppSystemVariable
        UserName = 'SystemVariable2'
        VarType = vtPageNo
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        Visible = False
        mmHeight = 3260
        mmLeft = 119327
        mmTop = 794
        mmWidth = 1566
        BandType = 9
      end
      object ppImage1: TppImage
        UserName = 'Image1'
        MaintainAspectRatio = False
        Picture.Data = {
          0A544A504547496D616765B60B0000FFD8FFE000104A46494600010101006000
          600000FFE1001645786966000049492A0008000000000000000000FFDB004300
          080606070605080707070909080A0C140D0C0B0B0C1912130F141D1A1F1E1D1A
          1C1C20242E2720222C231C1C2837292C30313434341F27393D38323C2E333432
          FFDB0043010909090C0B0C180D0D1832211C2132323232323232323232323232
          3232323232323232323232323232323232323232323232323232323232323232
          3232323232FFC0001108002400A103012200021101031101FFC4001F00000105
          01010101010100000000000000000102030405060708090A0BFFC400B5100002
          010303020403050504040000017D010203000411051221314106135161072271
          14328191A1082342B1C11552D1F02433627282090A161718191A25262728292A
          3435363738393A434445464748494A535455565758595A636465666768696A73
          7475767778797A838485868788898A92939495969798999AA2A3A4A5A6A7A8A9
          AAB2B3B4B5B6B7B8B9BAC2C3C4C5C6C7C8C9CAD2D3D4D5D6D7D8D9DAE1E2E3E4
          E5E6E7E8E9EAF1F2F3F4F5F6F7F8F9FAFFC4001F010003010101010101010101
          0000000000000102030405060708090A0BFFC400B51100020102040403040705
          040400010277000102031104052131061241510761711322328108144291A1B1
          C109233352F0156272D10A162434E125F11718191A262728292A35363738393A
          434445464748494A535455565758595A636465666768696A737475767778797A
          82838485868788898A92939495969798999AA2A3A4A5A6A7A8A9AAB2B3B4B5B6
          B7B8B9BAC2C3C4C5C6C7C8C9CAD2D3D4D5D6D7D8D9DAE2E3E4E5E6E7E8E9EAF2
          F3F4F5F6F7F8F9FAFFDA000C03010002110311003F00EAFE21FC45D46C75C83C
          25E128966D6E76559262011096FBAA01E0B60E493C281DC9E2E69FF096D2EADD
          5FC59AB6A5AF5F37CD234B74EB0A93D42203D3FCF1D2BCFF00E13C835AF8C7AA
          6A5704B4A52EEE23CF6264551F92B115F4381834C4796F883E12E9B63A45D5DF
          86F51D5B49BC82279505BDDC8C8E5464295CE7B63823AF7AEC3C06D7AFE04D12
          4D4269E6BB92D12495E724B92C33839E78CE3F0AE888CD2D219F3EFC67D3DFC2
          371A54FA36A5AB5B0BC5B83320D4662A4AF9641196E3EF37E95DB695F0CAC2FB
          C3B657136BBE23173716D1CAF22EA9270C541240E9D4D72FFB46FF00AAF0F7FB
          B77FCA2AEB6F7E26E85E0CD174BB2D4A2BE7BA3A7432C690DB92241B07DD6240
          FAF3401C169FAE7897E1FF00C5287C3773AC5CEA9A7C93C5115BA90B6E8E5C05
          619C95604F63838E8335F41AFDD1CE6BC7FC2BE0AD5FC51E355F1F78912DED61
          629358D94320972BB7F765987180083EA4F3F28E0FACDD4C6DAD279F6EE31C6C
          F8CE33804D0079678C3C77AD6ABE304F047835E28AF0B6CBAD40FCDE49032C17
          8C0DA3A9E4E78001E6B66DBE10E85240875DBAD4F5BBC03E7B8BBBB7C16EE554
          3617D873F535E7BFB3F7FA5F8AB59BFB87325D9B2525D8F2C6493739FC4AAD7D
          09408F16F16F80F57F035849AFF82B5CD4E1B7B51BEE34F926322841D5941C82
          077520F19E462BAFF869E3D5F1C68D29B98E38753B32A2E6343F2B039DAEB9EC
          7078ED8AEDE48D654649143A302ACA464107A8AF9CBE0C2BE93F156EF4D4CBA0
          B7B9B563ED1C8B863FF7CE3FE0540CF5FF001F787ADB52F0FEA3A8B5C5F5BDDD
          9D94B2432DB5DC9160AA961955201E7D6BCB7E12688FE3687569758D6B5C6FB2
          BC4B188B529547CCA49CF3ED5ED7E2CFF91375CFFB07CFFF00A2DABCAFF6761F
          F12ED7CFACD07FE80D401D36A3F0BA78E02FE1FF001778834FBC1CA79D7AF344
          C7D1949CFE3FA1E95CF7833E26EB363E2A3E10F1AA27DB3CD104776301849FC2
          1F1C32B0230C31DB239E3D988AF9D7E3EC4B6BE34B0BA87E499EC439653CEE47
          6DA7FCFA5311F45D676BBABDBE85A0DEEAD73FEA6D216958671BB03819F7381F
          8D5BB790CB6B148C082E8AC41EA32335E77F10DFFE125F11E83E0684EE8AEA51
          7DA963F86DE3E429FF0079BF503D690CE47E0E78D751B8F176A3A46B77334B2E
          A5BAE621331F92619664507EE82A490380367BD7BB8E95F3EFC60D3AE3C2BE3F
          D37C59A7A60DC32C9C703CE8B0307FDE4C0FC0D7BB693A9DBEB1A459EA7684B5
          BDDC293464FA300467DF9A00BB45145007CCE5DFE177C677B8BC471626791F70
          1F7ADA524EE03BED39CE3FB9F4AFA4EDEE22BA8239E0952586450E924672AE0F
          4208EA2B0BC57E0ED23C636096BAAC2C4C24B433C676C9093D4AB7E0320F0703
          D2BCFF004EF86FE3DF089683C2BE2EB57B124B086F222A14E7B2E1C7E20AE4F6
          A623D849A335E6F1787FE285FF00EE753F1869D63011CB69F69BE43ED960A071
          DF9FA5777A36991E8FA45B69F1CF3CEB026DF36E1CBC8E7A96627A9249A433C6
          7F68C3FBBF0EF3F36DBBC7E515769E20F0641E36F86DA65AA954BE82CE296CA6
          3FC2FE58F94FFB2DD0FE07B0AC7F18FC36F13F8EE7B59355D774AB74B4F35608
          EDACA4E8E573B8B3F270ABFAD767E12D37C41A469E9A7EB17BA7DDDB5B411C36
          CF6D03C7210A31F3E5883C6DE98EF408F2EF833E359B4DBE7F056B1BA222475B
          4F34E1A29013BE13F8E48F7C8EE2BDD36874C300411820F4AF2DF1E7C223E2AF
          11C5ACE97A9C7A6CEE07DA18C658975C6D91369186F5E7B0F7AEFF00428B59B7
          D3162D72EED6EEED0E3CEB688C61D78C12A49C37AE38A067CF7E06B93F0E3E2D
          CBA66A6DE5C04BE9F248FC0D8C418A4CFA1DABCFA31F4AFA60139E6B8BF1CFC3
          8D27C7102C972EF6BA8449B62BB897276FF7594F0CBC9E3AF270466B0F45F0F7
          C50F0D40B6367AE687A9D8C43643F6F4943AA8E9F779E9D8B1A623D0B58D56DB
          44D26EF53BC7096D6B134AE49C671D87B9E83EB5E3BF02742BAB8BED57C5F789
          B45D06820E387667DF291EC18003E87D2BABB8F016B7E2C9226F1BEB914F6914
          9E62E97A5C6D1424F6DCE7E66FD31EB5DFDADAC1676B15B5BC31C30C481238E3
          50AAAA380001D052199BE2EE3C17AE9FFA87DC7FE8B6AF2BFD9D8FFA0F8807FD
          3683FF00416AF4FF001669BAA6B3E1FB8D374ABBB5B592E94C334B711B385898
          10DB4023E6E98CF1D6BCFF00C39F0C7C61E0D5B95D07C55A72ADC953289B4F27
          76D040EAC71D6803D7092180E39AF9FBC428BF14BE32C563A7B0974BD395629E
          E1794F2D1B739C8EC58EC1EBC91C577577E05F18F88AD7ECBE21F1C15B37E26B
          7D36C844645F42E4F4F6C1AEC3C37E17D27C29A52E9FA45B08A2CEE66639791B
          D59BB9FE5D050234E79E2B4B69679DC470C485DDCF45503249FC05790F83FC3F
          7FE3ABDD4FC7275BD4B486D426782D16D76022D9080A0960DDD79C71906BB2F1
          CF877C43E29B19748B0D56C2C34CB88C2CE5EDDE4998E79504300148C7BF5AB1
          E0BD135EF0EE9F0E95A85EE9B75A7DADBAC56CD6D6CF14B91DDF2C41E3D3BD03
          394F197C34D4350F0BDD86F156B3A9CD6CA6E60B7BAF2D91A45071F7501CE0B0
          E08EB547E02F8996F343BAF0F4AE3CDB26F3E053D4C2E79C7D1C9FFBE857AA6A
          E3543A7B8D1E4B34BDDCBB1AF119E3033F3642904F19C73D6BCA748F845E23F0
          FF0088FF00B7B4CF11E9D1DE6F91CC26C9C4243924A11BF3B79FC303D2803D97
          3ED4572FE5F8EFFE7EBC39FF0080D3FF00F1745007804FF1A3C709732AAEA916
          15D947FA2C7D33FEED33FE17578EBFE82917FE02C7FF00C4D1453107FC2EAF1D
          7FD0522FFC058FFF0089A3FE17578EBFE82917FE02C7FF00C4D145001FF0BABC
          75FF004148BFF0163FFE268FF85D5E3AFF00A0A45FF80B1FFF00134514007FC2
          EAF1D7FD0522FF00C058FF00F89A3FE17578EBFE82917FE02C7FFC4D145001FF
          000BABC75FF4148BFF000163FF00E268FF0085D5E3AFFA0A45FF0080B1FF00F1
          34514007FC2EAF1D7FD0522FFC058FFF0089A3FE17578EBFE82917FE02C7FF00
          C4D145001FF0BABC75FF004148BFF0163FFE268FF85D5E3AFF00A0A45FF80B1F
          FF00134514007FC2EAF1D7FD0522FF00C058FF00F89A3FE17578EBFE82917FE0
          2C7FFC4D145001FF000BABC75FF4148BFF000163FF00E268FF0085D5E3AFFA0A
          45FF0080B1FF00F134514007FC2EAF1D7FD0522FFC058FFF0089A6B7C6BF1D05
          27FB522E9FF3EB1FFF0013451401D3FF00C2CFF177FD04D7FF0001A2FF00E268
          A28A00FFD9}
        mmHeight = 10848
        mmLeft = 0
        mmTop = 6085
        mmWidth = 44979
        BandType = 9
      end
      object ppLine12: TppLine
        UserName = 'Line9'
        Pen.Width = 2
        Position = lpLeft
        StretchWithParent = True
        Weight = 1.500000000000000000
        mmHeight = 215900
        mmLeft = 87048
        mmTop = 45244
        mmWidth = 2381
        BandType = 9
      end
      object ppDBText67: TppDBText
        UserName = 'DBText72'
        DataField = 'ROD01'
        DataPipeline = frm_fatura_comercial2.ppBDETexto
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        ParentDataPipeline = False
        TextAlignment = taCentered
        Transparent = True
        DataPipelineName = 'ppBDETexto'
        mmHeight = 3440
        mmLeft = 52388
        mmTop = 49477
        mmWidth = 33602
        BandType = 9
      end
    end
    object ppGroup1: TppGroup
      BreakName = 'NR_PEDIDO_IMP'
      DataPipeline = frm_fatura_comercial2.BDE_detalhe
      OutlineSettings.CreateNode = True
      NewPage = True
      ResetPageNo = True
      UserName = 'Group1'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      DataPipelineName = 'BDE_detalhe'
      object ppGroupHeaderBand1: TppGroupHeaderBand
        PrintHeight = phDynamic
        mmBottomOffset = 0
        mmHeight = 80963
        mmPrintPosition = 0
        object ppDBMemo2: TppDBMemo
          UserName = 'DBMemo2'
          CharWrap = False
          DataField = 'TX_IMPORTADOR'
          DataPipeline = frm_fatura_comercial2.BDE_total
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = []
          ParentDataPipeline = False
          Transparent = True
          Visible = False
          DataPipelineName = 'BDE_total'
          mmHeight = 17727
          mmLeft = 4763
          mmTop = 23019
          mmWidth = 86254
          BandType = 3
          GroupNo = 0
          mmBottomOffset = 0
          mmOverFlowOffset = 0
          mmStopPosition = 0
          mmLeading = 0
        end
        object ppDBText1: TppDBText
          UserName = 'DBText76'
          DataField = 'NR_NIT'
          DataPipeline = frm_fatura_comercial2.BDE_total
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = []
          ParentDataPipeline = False
          Transparent = True
          DataPipelineName = 'BDE_total'
          mmHeight = 2879
          mmLeft = 5027
          mmTop = 34660
          mmWidth = 86254
          BandType = 3
          GroupNo = 0
        end
        object ppDBMemo6: TppDBMemo
          UserName = 'DBMemo6'
          CharWrap = False
          DataField = 'TX_CONSIGNATARIO'
          DataPipeline = frm_fatura_comercial2.BDE_total
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 6
          Font.Style = []
          ParentDataPipeline = False
          Transparent = True
          Visible = False
          DataPipelineName = 'BDE_total'
          mmHeight = 17992
          mmLeft = 94192
          mmTop = 22754
          mmWidth = 93663
          BandType = 3
          GroupNo = 0
          mmBottomOffset = 0
          mmOverFlowOffset = 0
          mmStopPosition = 0
          mmLeading = 0
        end
        object ppDBText93: TppDBText
          UserName = 'DBText82'
          DataField = 'RUC_CONSIGNATARIO'
          DataPipeline = frm_fatura_comercial2.BDE_total
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 6
          Font.Style = []
          ParentDataPipeline = False
          Transparent = True
          DataPipelineName = 'BDE_total'
          mmHeight = 2910
          mmLeft = 94456
          mmTop = 34660
          mmWidth = 75671
          BandType = 3
          GroupNo = 0
        end
        object ppDBText2: TppDBText
          UserName = 'DBText73'
          DataField = 'NIT_CONSIGNATARIO'
          DataPipeline = frm_fatura_comercial2.BDE_total
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = []
          ParentDataPipeline = False
          Transparent = True
          DataPipelineName = 'BDE_total'
          mmHeight = 2910
          mmLeft = 94456
          mmTop = 34660
          mmWidth = 75671
          BandType = 3
          GroupNo = 0
        end
        object ppDBText92: TppDBText
          UserName = 'DBText74'
          DataField = 'NR_RUC'
          DataPipeline = frm_fatura_comercial2.BDE_total
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 6
          Font.Style = []
          ParentDataPipeline = False
          Transparent = True
          DataPipelineName = 'BDE_total'
          mmHeight = 2910
          mmLeft = 5027
          mmTop = 34660
          mmWidth = 86254
          BandType = 3
          GroupNo = 0
        end
        object ppDBText86: TppDBText
          UserName = 'DBText40'
          DataField = 'TELEFONE_CONSIGNATARIO'
          DataPipeline = frm_fatura_comercial2.BDE_total
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = []
          ParentDataPipeline = False
          Transparent = True
          DataPipelineName = 'BDE_total'
          mmHeight = 2910
          mmLeft = 94456
          mmTop = 37306
          mmWidth = 90752
          BandType = 3
          GroupNo = 0
        end
        object ppDBText85: TppDBText
          UserName = 'DBText39'
          DataField = 'NR_TELEFONE'
          DataPipeline = frm_fatura_comercial2.BDE_total
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = []
          ParentDataPipeline = False
          Transparent = True
          DataPipelineName = 'BDE_total'
          mmHeight = 2910
          mmLeft = 5027
          mmTop = 37835
          mmWidth = 83608
          BandType = 3
          GroupNo = 0
        end
        object ppDBMemo7: TppDBMemo
          UserName = 'DBMemo7'
          CharWrap = False
          DataField = 'TX_EXPORTADOR'
          DataPipeline = frm_fatura_comercial2.BDE_total
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          ParentDataPipeline = False
          Transparent = True
          Visible = False
          DataPipelineName = 'BDE_total'
          mmHeight = 17727
          mmLeft = 49213
          mmTop = 3175
          mmWidth = 85461
          BandType = 3
          GroupNo = 0
          mmBottomOffset = 0
          mmOverFlowOffset = 0
          mmStopPosition = 0
          mmLeading = 0
        end
        object ppDBText68: TppDBText
          UserName = 'DBText31'
          DataField = 'NR_PEDIDO_IMP'
          DataPipeline = frm_fatura_comercial2.BDE_detalhe
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          ParentDataPipeline = False
          Transparent = True
          DataPipelineName = 'BDE_detalhe'
          mmHeight = 3260
          mmLeft = 137848
          mmTop = 7144
          mmWidth = 51594
          BandType = 3
          GroupNo = 0
        end
        object ppDBText69: TppDBText
          UserName = 'DBText32'
          DataField = 'calc_dt_fatura'
          DataPipeline = frm_fatura_comercial2.BDE_total
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          ParentDataPipeline = False
          Transparent = True
          DataPipelineName = 'BDE_total'
          mmHeight = 3175
          mmLeft = 137848
          mmTop = 11377
          mmWidth = 51594
          BandType = 3
          GroupNo = 0
        end
        object ppDBText70: TppDBText
          UserName = 'DBText33'
          DataField = 'NM_EMPRESA'
          DataPipeline = frm_fatura_comercial2.BDE_total
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = []
          ParentDataPipeline = False
          Transparent = True
          DataPipelineName = 'BDE_total'
          mmHeight = 2910
          mmLeft = 5027
          mmTop = 25665
          mmWidth = 86254
          BandType = 3
          GroupNo = 0
        end
        object ppDBText71: TppDBText
          UserName = 'DBText34'
          DataField = 'calc_importador'
          DataPipeline = frm_fatura_comercial2.BDE_total
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 6
          Font.Style = []
          ParentDataPipeline = False
          Transparent = True
          DataPipelineName = 'BDE_total'
          mmHeight = 2381
          mmLeft = 5027
          mmTop = 28310
          mmWidth = 86519
          BandType = 3
          GroupNo = 0
        end
        object ppDBText72: TppDBText
          UserName = 'DBText301'
          DataField = 'calc_import2'
          DataPipeline = frm_fatura_comercial2.BDE_total
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = []
          ParentDataPipeline = False
          Transparent = True
          DataPipelineName = 'BDE_total'
          mmHeight = 2910
          mmLeft = 5027
          mmTop = 31485
          mmWidth = 86254
          BandType = 3
          GroupNo = 0
        end
        object ppDBText73: TppDBText
          UserName = 'DBText36'
          DataField = 'calc_consig2'
          DataPipeline = frm_fatura_comercial2.BDE_total
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = []
          ParentDataPipeline = False
          Transparent = True
          DataPipelineName = 'BDE_total'
          mmHeight = 2910
          mmLeft = 94456
          mmTop = 31485
          mmWidth = 92075
          BandType = 3
          GroupNo = 0
        end
        object ppDBText74: TppDBText
          UserName = 'DBText37'
          DataField = 'calc_consig3'
          DataPipeline = frm_fatura_comercial2.BDE_total
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 6
          Font.Style = []
          ParentDataPipeline = False
          Transparent = True
          DataPipelineName = 'BDE_total'
          mmHeight = 2381
          mmLeft = 94456
          mmTop = 28575
          mmWidth = 92075
          BandType = 3
          GroupNo = 0
        end
        object ppDBText75: TppDBText
          UserName = 'DBText38'
          DataField = 'NM_CONSIGNATARIO'
          DataPipeline = frm_fatura_comercial2.BDE_total
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = []
          ParentDataPipeline = False
          Transparent = True
          DataPipelineName = 'BDE_total'
          mmHeight = 2910
          mmLeft = 94456
          mmTop = 25400
          mmWidth = 92075
          BandType = 3
          GroupNo = 0
        end
        object ppDBText76: TppDBText
          UserName = 'DBText55'
          DataField = 'CLIENTE'
          DataPipeline = frm_fatura_comercial2.BDE_total
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          ParentDataPipeline = False
          Transparent = True
          DataPipelineName = 'BDE_total'
          mmHeight = 3175
          mmLeft = 49477
          mmTop = 3175
          mmWidth = 83873
          BandType = 3
          GroupNo = 0
        end
        object ppLabel18: TppLabel
          UserName = 'Label11'
          Caption = 'Phone:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          TextAlignment = taCentered
          Transparent = True
          mmHeight = 3175
          mmLeft = 49477
          mmTop = 15875
          mmWidth = 8996
          BandType = 3
          GroupNo = 0
        end
        object ppDBText77: TppDBText
          UserName = 'DBText56'
          DataField = 'TEL_CLIENTE'
          DataPipeline = frm_fatura_comercial2.BDE_total
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          ParentDataPipeline = False
          Transparent = True
          DataPipelineName = 'BDE_total'
          mmHeight = 3175
          mmLeft = 58738
          mmTop = 15875
          mmWidth = 22225
          BandType = 3
          GroupNo = 0
        end
        object ppDBText81: TppDBText
          UserName = 'DBText57'
          DataField = 'FAX_CLIENTE'
          DataPipeline = frm_fatura_comercial2.BDE_total
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          ParentDataPipeline = False
          Transparent = True
          DataPipelineName = 'BDE_total'
          mmHeight = 3175
          mmLeft = 89429
          mmTop = 15875
          mmWidth = 24342
          BandType = 3
          GroupNo = 0
        end
        object ppDBText82: TppDBText
          UserName = 'DBText58'
          DataField = 'calc_end_cliente'
          DataPipeline = frm_fatura_comercial2.BDE_total
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          ParentDataPipeline = False
          Transparent = True
          DataPipelineName = 'BDE_total'
          mmHeight = 3175
          mmLeft = 49477
          mmTop = 6350
          mmWidth = 83873
          BandType = 3
          GroupNo = 0
        end
        object ppDBText84: TppDBText
          UserName = 'DBText59'
          DataField = 'calc_end_cliente2'
          DataPipeline = frm_fatura_comercial2.BDE_total
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          ParentDataPipeline = False
          Transparent = True
          DataPipelineName = 'BDE_total'
          mmHeight = 3175
          mmLeft = 49477
          mmTop = 9525
          mmWidth = 83873
          BandType = 3
          GroupNo = 0
        end
        object ppLabel19: TppLabel
          UserName = 'Label14'
          Caption = 'FAX:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          TextAlignment = taCentered
          Transparent = True
          mmHeight = 3175
          mmLeft = 82021
          mmTop = 15875
          mmWidth = 6350
          BandType = 3
          GroupNo = 0
        end
        object ppMerc: TppMemo
          UserName = 'Merc'
          Caption = 'PHARMALAN USP'#13#10
          CharWrap = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          Lines.Strings = (
            'PHARMALAN USP'
            'CRODAMAZON CACAU')
          Transparent = True
          mmHeight = 265
          mmLeft = 56092
          mmTop = 57000
          mmWidth = 82815
          BandType = 3
          GroupNo = 0
          mmBottomOffset = 0
          mmOverFlowOffset = 0
          mmStopPosition = 0
          mmLeading = 0
        end
        object ppDBText91: TppDBText
          UserName = 'DBText75'
          DataField = 'CGC_CLIENTE'
          DataPipeline = frm_fatura_comercial2.BDE_total
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          ParentDataPipeline = False
          Transparent = True
          DataPipelineName = 'BDE_total'
          mmHeight = 3175
          mmLeft = 49477
          mmTop = 12700
          mmWidth = 83873
          BandType = 3
          GroupNo = 0
        end
        object ppDBText3: TppDBText
          UserName = 'DBText77'
          DataField = 'NR_CUIT'
          DataPipeline = frm_fatura_comercial2.BDE_total
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = []
          ParentDataPipeline = False
          Transparent = True
          DataPipelineName = 'BDE_total'
          mmHeight = 2910
          mmLeft = 5027
          mmTop = 34660
          mmWidth = 86254
          BandType = 3
          GroupNo = 0
        end
        object ppDBText4: TppDBText
          UserName = 'DBText80'
          DataField = 'CUIT_CONSIGNATARIO'
          DataPipeline = frm_fatura_comercial2.BDE_total
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = []
          ParentDataPipeline = False
          Transparent = True
          DataPipelineName = 'BDE_total'
          mmHeight = 2910
          mmLeft = 94456
          mmTop = 34660
          mmWidth = 75671
          BandType = 3
          GroupNo = 0
        end
      end
      object ppGroupFooterBand1: TppGroupFooterBand
        PrintHeight = phDynamic
        mmBottomOffset = 0
        mmHeight = 16404
        mmPrintPosition = 0
        object ppDBMemo5: TppDBMemo
          UserName = 'DBMemo5'
          CharWrap = False
          DataField = 'TX_DECL_ADICIONAL'
          DataPipeline = frm_fatura_comercial2.BDE_total
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          ParentDataPipeline = False
          Stretch = True
          DataPipelineName = 'BDE_total'
          mmHeight = 9260
          mmLeft = 56356
          mmTop = 6085
          mmWidth = 81756
          BandType = 5
          GroupNo = 0
          mmBottomOffset = 0
          mmOverFlowOffset = 0
          mmStopPosition = 0
          mmLeading = 0
        end
        object ppDBCalc1: TppDBCalc
          UserName = 'DBCalc1'
          DataField = 'VL_TOT_ITEM'
          DataPipeline = frm_fatura_comercial2.BDE_detalhe
          DisplayFormat = '#0.,000'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          ResetGroup = ppGroup1
          Transparent = True
          DataPipelineName = 'BDE_detalhe'
          mmHeight = 3175
          mmLeft = 171715
          mmTop = 2117
          mmWidth = 16933
          BandType = 5
          GroupNo = 0
        end
        object ppLine13: TppLine
          UserName = 'Line2'
          Weight = 0.750000000000000000
          mmHeight = 1852
          mmLeft = 170921
          mmTop = 1058
          mmWidth = 18256
          BandType = 5
          GroupNo = 0
        end
        object ppLine15: TppLine
          UserName = 'Line7'
          Weight = 0.750000000000000000
          mmHeight = 1852
          mmLeft = 1323
          mmTop = 265
          mmWidth = 14817
          BandType = 5
          GroupNo = 0
        end
        object ppDBCalc2: TppDBCalc
          UserName = 'DBCalc2'
          DataField = 'QT_MERCADORIA'
          DataPipeline = frm_fatura_comercial2.BDE_detalhe
          DisplayFormat = '#0.,00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          ResetGroup = ppGroup1
          Transparent = True
          DataPipelineName = 'BDE_detalhe'
          mmHeight = 3175
          mmLeft = 2117
          mmTop = 1323
          mmWidth = 13229
          BandType = 5
          GroupNo = 0
        end
      end
    end
    object ppGroup3: TppGroup
      BreakName = 'CD_UNID_MEDIDA'
      DataPipeline = frm_fatura_comercial2.BDE_detalhe
      OutlineSettings.CreateNode = True
      ReprintOnSubsequentPage = False
      UserName = 'Group3'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      DataPipelineName = 'BDE_detalhe'
      object ppGroupHeaderBand3: TppGroupHeaderBand
        mmBottomOffset = 0
        mmHeight = 5292
        mmPrintPosition = 0
        object ppDBText94: TppDBText
          UserName = 'DBText45'
          DataField = 'UNIDADE'
          DataPipeline = frm_fatura_comercial2.BDE_detalhe
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          ParentDataPipeline = False
          Transparent = True
          DataPipelineName = 'BDE_detalhe'
          mmHeight = 3175
          mmLeft = 1852
          mmTop = 794
          mmWidth = 14552
          BandType = 3
          GroupNo = 1
        end
      end
      object ppGroupFooterBand3: TppGroupFooterBand
        mmBottomOffset = 0
        mmHeight = 0
        mmPrintPosition = 0
      end
    end
    object ppGroup4: TppGroup
      BreakName = 'NR_ORDER'
      DataPipeline = frm_fatura_comercial2.BDE_detalhe
      OutlineSettings.CreateNode = True
      ReprintOnSubsequentPage = False
      UserName = 'Group4'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      DataPipelineName = 'BDE_detalhe'
      object ppGroupHeaderBand4: TppGroupHeaderBand
        mmBottomOffset = 0
        mmHeight = 0
        mmPrintPosition = 0
      end
      object ppGroupFooterBand4: TppGroupFooterBand
        mmBottomOffset = 0
        mmHeight = 2646
        mmPrintPosition = 0
      end
    end
    object ppGroup2: TppGroup
      BreakName = 'REMESSA'
      DataPipeline = frm_fatura_comercial2.BDE_detalhe
      OutlineSettings.CreateNode = True
      ReprintOnSubsequentPage = False
      UserName = 'Group2'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      DataPipelineName = 'BDE_detalhe'
      object ppGroupHeaderBand2: TppGroupHeaderBand
        mmBottomOffset = 0
        mmHeight = 5292
        mmPrintPosition = 0
      end
      object ppGroupFooterBand2: TppGroupFooterBand
        mmBottomOffset = 0
        mmHeight = 0
        mmPrintPosition = 0
      end
    end
    object ppParameterList1: TppParameterList
    end
  end
  object ppDesigner: TppDesigner
    Caption = 'ReportBuilder'
    DataSettings.SessionType = 'BDESession'
    DataSettings.AllowEditSQL = False
    DataSettings.CollationType = ctASCII
    DataSettings.DatabaseType = dtParadox
    DataSettings.IsCaseSensitive = True
    DataSettings.SQLType = sqBDELocal
    Position = poScreenCenter
    Report = ppReport1
    IniStorageType = 'IniFile'
    IniStorageName = '($WINSYS)\RBuilder.ini'
    WindowHeight = 400
    WindowLeft = 100
    WindowTop = 50
    WindowWidth = 600
    Left = 424
    Top = 336
  end
  object qry_relatorios_: TQuery
    AfterScroll = qry_relatorios_AfterScroll
    DatabaseName = 'DBBROKER'
    SQL.Strings = (
      'SELECT *'
      'FROM TMODELO_DOC '
      'WHERE ( IN_PROCESSO             =:IN_PROCESSO '
      '   AND ISNULL(CD_UNID_NEG,'#39#39')   =:CD_UNID_NEG '
      '   AND ISNULL(CD_MODULO,'#39#39')     =:CD_MODULO '
      '   AND ISNULL(CD_VIA_TRANSP,'#39#39') =:CD_VIA_TRANSP '
      '   AND ISNULL(CD_PRODUTO,'#39#39')    =:CD_PRODUTO)'
      '   '
      
        '  AND ( ( IN_GRUPO      = '#39'1'#39' AND ISNULL(CD_GRUPO,'#39#39')      =:CD_' +
        'GRUPO) '
      
        '      OR (IN_EMP_NAC    = '#39'1'#39' AND ISNULL(CD_EMP_NAC,'#39#39')    =:CD_' +
        'EMP_NAC)  '
      
        '      OR (IN_EMP_EST    = '#39'1'#39' AND ISNULL(CD_EMP_EST,'#39#39')    =:CD_' +
        'EMP_EST)'
      
        '      OR (IN_AGENTE     = '#39'1'#39' AND ISNULL(CD_AGENTE,'#39#39')     =:CD_' +
        'AGENTE) '
      
        '      OR (IN_CIA        = '#39'1'#39' AND ISNULL(CD_CIA,'#39#39')        =:CD_' +
        'CIA) '
      
        '      OR (IN_ARMADOR    = '#39'1'#39' AND ISNULL(CD_ARMADOR,'#39#39')    =:CD_' +
        'ARMADOR) '
      
        '      OR (IN_COMISSARIA = '#39'1'#39' AND ISNULL(CD_COMISSARIA,'#39#39') =:CD_' +
        'COMISSARIA) '
      '      OR (IN_DAFAULT    = '#39'1'#39' )'
      
        '      OR (IN_ESTUFAGEM  = '#39'1'#39' AND ISNULL(CD_ESTUFAGEM,'#39#39')  =:CD_' +
        'ESTUFAGEM) )')
    Left = 384
    Top = 176
    ParamData = <
      item
        DataType = ftFixedChar
        Name = 'IN_PROCESSO'
        ParamType = ptUnknown
      end
      item
        DataType = ftFixedChar
        Name = 'CD_UNID_NEG'
        ParamType = ptUnknown
      end
      item
        DataType = ftFixedChar
        Name = 'CD_MODULO'
        ParamType = ptUnknown
      end
      item
        DataType = ftFixedChar
        Name = 'CD_VIA_TRANSP'
        ParamType = ptUnknown
      end
      item
        DataType = ftFixedChar
        Name = 'CD_PRODUTO'
        ParamType = ptUnknown
      end
      item
        DataType = ftFixedChar
        Name = 'CD_GRUPO'
        ParamType = ptUnknown
      end
      item
        DataType = ftFixedChar
        Name = 'CD_EMP_NAC'
        ParamType = ptUnknown
      end
      item
        DataType = ftFixedChar
        Name = 'CD_EMP_EST'
        ParamType = ptUnknown
      end
      item
        DataType = ftFixedChar
        Name = 'CD_AGENTE'
        ParamType = ptUnknown
      end
      item
        DataType = ftFixedChar
        Name = 'CD_CIA'
        ParamType = ptUnknown
      end
      item
        DataType = ftFixedChar
        Name = 'CD_ARMADOR'
        ParamType = ptUnknown
      end
      item
        DataType = ftFixedChar
        Name = 'CD_COMISSARIA'
        ParamType = ptUnknown
      end
      item
        DataType = ftFixedChar
        Name = 'CD_ESTUFAGEM'
        ParamType = ptUnknown
      end>
    object qry_relatorios_CD_UNID_NEG: TStringField
      FieldName = 'CD_UNID_NEG'
      Origin = 'DBBROKER.TMODELO_DOC.CD_UNID_NEG'
      FixedChar = True
      Size = 2
    end
    object qry_relatorios_CD_MODULO: TStringField
      FieldName = 'CD_MODULO'
      Origin = 'DBBROKER.TMODELO_DOC.CD_MODULO'
      FixedChar = True
      Size = 4
    end
    object qry_relatorios_CODIGO: TStringField
      FieldName = 'CODIGO'
      Origin = 'DBBROKER.TMODELO_DOC.CODIGO'
      FixedChar = True
      Size = 3
    end
    object qry_relatorios_DESCRIAO: TStringField
      FieldName = 'DESCRIAO'
      Origin = 'DBBROKER.TMODELO_DOC.DESCRIAO'
      FixedChar = True
      Size = 50
    end
    object qry_relatorios_NM_PATH: TStringField
      FieldName = 'NM_PATH'
      Origin = 'DBBROKER.TMODELO_DOC.NM_PATH'
      FixedChar = True
      Size = 100
    end
    object qry_relatorios_DT_DOCUMENTO: TDateTimeField
      FieldName = 'DT_DOCUMENTO'
      Origin = 'DBBROKER.TMODELO_DOC.DT_DOCUMENTO'
    end
    object qry_relatorios_IN_DAFAULT: TStringField
      FieldName = 'IN_DAFAULT'
      Origin = 'DBBROKER.TMODELO_DOC.IN_DAFAULT'
      FixedChar = True
      Size = 1
    end
    object qry_relatorios_IN_EMP_NAC: TStringField
      FieldName = 'IN_EMP_NAC'
      Origin = 'DBBROKER.TMODELO_DOC.IN_EMP_NAC'
      FixedChar = True
      Size = 1
    end
    object qry_relatorios_IN_EMP_EST: TStringField
      FieldName = 'IN_EMP_EST'
      Origin = 'DBBROKER.TMODELO_DOC.IN_EMP_EST'
      FixedChar = True
      Size = 1
    end
    object qry_relatorios_IN_AGENTE: TStringField
      FieldName = 'IN_AGENTE'
      Origin = 'DBBROKER.TMODELO_DOC.IN_AGENTE'
      FixedChar = True
      Size = 1
    end
    object qry_relatorios_IN_CIA: TStringField
      FieldName = 'IN_CIA'
      Origin = 'DBBROKER.TMODELO_DOC.IN_CIA'
      FixedChar = True
      Size = 1
    end
    object qry_relatorios_IN_ARMADOR: TStringField
      FieldName = 'IN_ARMADOR'
      Origin = 'DBBROKER.TMODELO_DOC.IN_ARMADOR'
      FixedChar = True
      Size = 1
    end
    object qry_relatorios_IN_COMISSARIA: TStringField
      FieldName = 'IN_COMISSARIA'
      Origin = 'DBBROKER.TMODELO_DOC.IN_COMISSARIA'
      FixedChar = True
      Size = 1
    end
    object qry_relatorios_CD_EMP_NAC: TStringField
      FieldName = 'CD_EMP_NAC'
      Origin = 'DBBROKER.TMODELO_DOC.CD_EMP_NAC'
      FixedChar = True
      Size = 5
    end
    object qry_relatorios_CD_EMP_EST: TStringField
      FieldName = 'CD_EMP_EST'
      Origin = 'DBBROKER.TMODELO_DOC.CD_EMP_EST'
      FixedChar = True
      Size = 5
    end
    object qry_relatorios_CD_AGENTE: TStringField
      FieldName = 'CD_AGENTE'
      Origin = 'DBBROKER.TMODELO_DOC.CD_AGENTE'
      FixedChar = True
      Size = 4
    end
    object qry_relatorios_CD_CIA: TStringField
      FieldName = 'CD_CIA'
      Origin = 'DBBROKER.TMODELO_DOC.CD_CIA'
      FixedChar = True
      Size = 4
    end
    object qry_relatorios_CD_ARMADOR: TStringField
      FieldName = 'CD_ARMADOR'
      Origin = 'DBBROKER.TMODELO_DOC.CD_ARMADOR'
      FixedChar = True
      Size = 4
    end
    object qry_relatorios_CD_COMISSARIA: TStringField
      FieldName = 'CD_COMISSARIA'
      Origin = 'DBBROKER.TMODELO_DOC.CD_COMISSARIA'
      FixedChar = True
      Size = 3
    end
    object qry_relatorios_CD_VIA_TRANSP: TStringField
      FieldName = 'CD_VIA_TRANSP'
      FixedChar = True
      Size = 2
    end
    object qry_relatorios_CD_PRODUTO: TStringField
      FieldName = 'CD_PRODUTO'
      FixedChar = True
      Size = 2
    end
    object qry_relatorios_IN_PROCESSO: TStringField
      FieldName = 'IN_PROCESSO'
      FixedChar = True
      Size = 1
    end
    object qry_relatorios_CD_GRUPO: TStringField
      FieldName = 'CD_GRUPO'
      FixedChar = True
      Size = 3
    end
    object qry_relatorios_IN_GRUPO: TStringField
      FieldName = 'IN_GRUPO'
      FixedChar = True
      Size = 1
    end
    object qry_relatorios_CD_TIPO_DOCTO: TIntegerField
      FieldName = 'CD_TIPO_DOCTO'
    end
  end
  object ds_relatorios: TDataSource
    DataSet = qry_relatorios_
    Left = 526
    Top = 305
  end
  object Timer1: TTimer
    Interval = 50
    OnTimer = Timer1Timer
    Left = 27
    Top = 186
  end
end
