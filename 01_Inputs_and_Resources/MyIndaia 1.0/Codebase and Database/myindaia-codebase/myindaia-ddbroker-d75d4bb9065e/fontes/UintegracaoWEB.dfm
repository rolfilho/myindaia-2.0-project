object frm_upload_img: Tfrm_upload_img
  Left = 407
  Top = 289
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Imagens - Work Image para MyIndaia WEB'
  ClientHeight = 175
  ClientWidth = 418
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object panel: TPanel
    Left = 0
    Top = 0
    Width = 418
    Height = 175
    Align = alClient
    BevelInner = bvLowered
    TabOrder = 0
    object Gauge1: TGauge
      Left = 16
      Top = 140
      Width = 292
      Height = 22
      BackColor = clBtnFace
      ForeColor = clHotLight
      Progress = 0
      ShowText = False
    end
    object lbl_nr_processo: TLabel
      Left = 15
      Top = 95
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
    object btn_co_processo: TSpeedButton
      Left = 160
      Top = 108
      Width = 25
      Height = 22
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
      OnClick = btn_co_processoClick
    end
    object btn_envio: TSpeedButton
      Left = 318
      Top = 139
      Width = 89
      Height = 25
      Caption = 'Enviar'
      Flat = True
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        04000000000000010000130B0000130B00001000000000000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF003333330B7FFF
        FFB0333333777F3333773333330B7FFFFFB0333333777F3333773333330B7FFF
        FFB0333333777F3333773333330B7FFFFFB03FFFFF777FFFFF77000000000077
        007077777777777777770FFFFFFFF00077B07F33333337FFFF770FFFFFFFF000
        7BB07F3FF3FFF77FF7770F00F000F00090077F77377737777F770FFFFFFFF039
        99337F3FFFF3F7F777FF0F0000F0F09999937F7777373777777F0FFFFFFFF999
        99997F3FF3FFF77777770F00F000003999337F773777773777F30FFFF0FF0339
        99337F3FF7F3733777F30F08F0F0337999337F7737F73F7777330FFFF0039999
        93337FFFF7737777733300000033333333337777773333333333}
      NumGlyphs = 2
      OnClick = btn_envioClick
    end
    object lbl_cd_unid_neg: TLabel
      Left = 14
      Top = 13
      Width = 48
      Height = 13
      Alignment = taRightJustify
      Caption = 'Unidade'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object lbl_cd_produto: TLabel
      Left = 16
      Top = 55
      Width = 45
      Height = 13
      Caption = 'Produto'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object btn_co_unid_neg: TSpeedButton
      Left = 382
      Top = 24
      Width = 25
      Height = 23
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
    object btn_co_produto: TSpeedButton
      Left = 382
      Top = 67
      Width = 25
      Height = 22
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
      OnClick = btn_co_produtoClick
    end
    object lblbarra: TLabel
      Left = 20
      Top = 144
      Width = 281
      Height = 15
      Alignment = taCenter
      AutoSize = False
      Font.Charset = ANSI_CHARSET
      Font.Color = clNavy
      Font.Height = -12
      Font.Name = 'Verdana'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = True
      Visible = False
    end
    object msk_nr_processo: TMaskEdit
      Left = 15
      Top = 109
      Width = 142
      Height = 19
      Hint = ' N'#250'mero do Processo'
      CharCase = ecUpperCase
      Ctl3D = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      MaxLength = 14
      ParentCtl3D = False
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 0
      OnExit = msk_nr_processoExit
    end
    object arquivos: TFileListBox
      Left = 80
      Top = 8
      Width = 145
      Height = 26
      ItemHeight = 13
      TabOrder = 3
      Visible = False
    end
    object msk_cd_unid_neg: TMaskEdit
      Left = 16
      Top = 26
      Width = 36
      Height = 19
      Ctl3D = False
      EditMask = '!99;0; '
      MaxLength = 2
      ParentCtl3D = False
      TabOrder = 1
      OnExit = msk_cd_unid_negExit
      OnKeyDown = msk_cd_unid_negKeyDown
    end
    object msk_cd_produto: TMaskEdit
      Left = 16
      Top = 68
      Width = 37
      Height = 19
      Ctl3D = False
      EditMask = '!99;0; '
      MaxLength = 2
      ParentCtl3D = False
      TabOrder = 2
      OnExit = msk_cd_produtoExit
      OnKeyDown = msk_cd_unid_negKeyDown
    end
    object edt_nm_produto: TEdit
      Left = 54
      Top = 68
      Width = 325
      Height = 19
      TabStop = False
      Color = clMenu
      Ctl3D = False
      ParentCtl3D = False
      ReadOnly = True
      TabOrder = 4
    end
    object edt_nm_unid_neg: TEdit
      Left = 53
      Top = 26
      Width = 325
      Height = 19
      TabStop = False
      Color = clMenu
      Ctl3D = False
      ParentCtl3D = False
      ReadOnly = True
      TabOrder = 5
    end
    object ArquivosAux: TFileListBox
      Left = 120
      Top = 16
      Width = 145
      Height = 26
      ItemHeight = 13
      TabOrder = 6
      Visible = False
    end
  end
  object dbComex: TDatabase
    AliasName = 'COMEX'
    DatabaseName = 'DBCOMEX'
    LoginPrompt = False
    Params.Strings = (
      'USER NAME=sa'
      'PASSWORD=123')
    SessionName = 'Default'
    Left = 240
    Top = 24
  end
  object ppReport1: TppReport
    AutoStop = False
    DataPipeline = ppDBPipeline1
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = 'Report'
    PrinterSetup.PaperName = 'A4'
    PrinterSetup.PrinterName = 'Default'
    PrinterSetup.mmMarginBottom = 1000
    PrinterSetup.mmMarginLeft = 1000
    PrinterSetup.mmMarginRight = 1000
    PrinterSetup.mmMarginTop = 1000
    PrinterSetup.mmPaperHeight = 297000
    PrinterSetup.mmPaperWidth = 210000
    PrinterSetup.PaperSize = 9
    Template.FileName = 'C:\DDBroker\digitalizacao.rtm'
    Units = utMillimeters
    DeviceType = 'Screen'
    OutlineSettings.CreateNode = True
    OutlineSettings.CreatePageNodes = True
    OutlineSettings.Enabled = True
    OutlineSettings.Visible = True
    TextSearchSettings.DefaultString = '<FindText>'
    TextSearchSettings.Enabled = True
    Left = 224
    Top = 96
    Version = '7.02'
    mmColumnWidth = 0
    DataPipelineName = 'ppDBPipeline1'
    object ppHeaderBand1: TppHeaderBand
      mmBottomOffset = 0
      mmHeight = 0
      mmPrintPosition = 0
    end
    object ppDetailBand1: TppDetailBand
      BeforePrint = ppDetailBand1BeforePrint
      PrintHeight = phDynamic
      mmBottomOffset = 0
      mmHeight = 295276
      mmPrintPosition = 0
      object ppImage1: TppImage
        UserName = 'Image1'
        MaintainAspectRatio = True
        Stretch = True
        mmHeight = 295000
        mmLeft = 0
        mmTop = 0
        mmWidth = 208000
        BandType = 4
      end
      object ppDBText1: TppDBText
        UserName = 'DBText1'
        DataField = 'FileName'
        DataPipeline = ppDBPipeline1
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        Visible = False
        DataPipelineName = 'ppDBPipeline1'
        mmHeight = 3969
        mmLeft = 3440
        mmTop = 2646
        mmWidth = 106627
        BandType = 4
      end
    end
    object ppFooterBand1: TppFooterBand
      mmBottomOffset = 0
      mmHeight = 0
      mmPrintPosition = 0
    end
  end
  object tblFig: TMemoryTable
    Active = True
    TableName = 'figuras'
    Left = 256
    Top = 96
    object tblFigFileName: TStringField
      FieldName = 'FileName'
      Size = 255
    end
  end
  object ds1: TDataSource
    DataSet = tblFig
    Left = 256
    Top = 128
  end
  object ppDBPipeline1: TppDBPipeline
    DataSource = ds1
    UserName = 'DBPipeline1'
    Left = 224
    Top = 128
    object ppDBPipeline1ppField1: TppField
      FieldAlias = 'FileName'
      FieldName = 'FileName'
      FieldLength = 0
      DisplayWidth = 0
      Position = 0
    end
  end
end
