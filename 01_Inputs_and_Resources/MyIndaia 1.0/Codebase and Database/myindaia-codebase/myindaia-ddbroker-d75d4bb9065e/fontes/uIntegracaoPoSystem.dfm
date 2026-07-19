object frmIntegrcaoPoSystem: TfrmIntegrcaoPoSystem
  Left = 243
  Top = 116
  Width = 511
  Height = 446
  Caption = 'PO System'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnActivate = FormActivate
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Panel3: TPanel
    Left = 0
    Top = 367
    Width = 495
    Height = 41
    Align = alBottom
    TabOrder = 0
    DesignSize = (
      495
      41)
    object btn_sair: TSpeedButton
      Left = 403
      Top = 5
      Width = 83
      Height = 30
      Hint = 'Sair'
      Anchors = [akRight, akBottom]
      Caption = '&Sair'
      Flat = True
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        0400000000000001000000000000000000001000000010000000000000000000
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
      ParentShowHint = False
      ShowHint = True
      OnClick = btn_sairClick
    end
    object SpeedButton1: TSpeedButton
      Left = 307
      Top = 5
      Width = 83
      Height = 30
      Hint = 'Sair'
      Anchors = [akRight, akBottom]
      Caption = 'Gerar'
      Flat = True
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        04000000000000010000130B0000130B00001000000000000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333330070
        7700333333337777777733333333008088003333333377F73377333333330088
        88003333333377FFFF7733333333000000003FFFFFFF77777777000000000000
        000077777777777777770FFFFFFF0FFFFFF07F3333337F3333370FFFFFFF0FFF
        FFF07F3FF3FF7FFFFFF70F00F0080CCC9CC07F773773777777770FFFFFFFF039
        99337F3FFFF3F7F777F30F0000F0F09999937F7777373777777F0FFFFFFFF999
        99997F3FF3FFF77777770F00F000003999337F773777773777F30FFFF0FF0339
        99337F3FF7F3733777F30F08F0F0337999337F7737F73F7777330FFFF0039999
        93337FFFF7737777733300000033333333337777773333333333}
      NumGlyphs = 2
      ParentShowHint = False
      ShowHint = True
      OnClick = SpeedButton1Click
    end
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 495
    Height = 97
    Align = alTop
    TabOrder = 1
    object lbl_cd_unid_neg: TLabel
      Left = 8
      Top = 8
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
      Transparent = True
    end
    object btn_co_unid_neg: TSpeedButton
      Left = 217
      Top = 20
      Width = 23
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
    object lbl_cd_produto: TLabel
      Left = 249
      Top = 8
      Width = 45
      Height = 13
      Caption = 'Produto'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = True
    end
    object btn_co_produto: TSpeedButton
      Left = 458
      Top = 20
      Width = 23
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
      OnClick = btn_co_produtoClick
    end
    object btn_co_processo: TSpeedButton
      Left = 459
      Top = 60
      Width = 23
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
      OnClick = btn_co_processoClick
    end
    object lbl_nr_processo: TLabel
      Left = 356
      Top = 48
      Width = 53
      Height = 13
      Caption = 'Processo'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = True
    end
    object Label1: TLabel
      Left = 9
      Top = 48
      Width = 40
      Height = 13
      Caption = 'Cliente'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = True
    end
    object btnCliente: TSpeedButton
      Left = 319
      Top = 60
      Width = 23
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
      OnClick = btnClienteClick
    end
    object msk_cd_unid_neg: TMaskEdit
      Left = 8
      Top = 20
      Width = 29
      Height = 21
      AutoSize = False
      BevelInner = bvLowered
      BevelOuter = bvNone
      BevelKind = bkSoft
      Ctl3D = False
      EditMask = '!99;0; '
      MaxLength = 2
      ParentCtl3D = False
      TabOrder = 0
      OnChange = btn_co_unid_negClick
    end
    object edt_nm_unid_neg: TEdit
      Left = 38
      Top = 20
      Width = 178
      Height = 21
      TabStop = False
      AutoSize = False
      BevelInner = bvLowered
      BevelKind = bkSoft
      BevelOuter = bvNone
      Ctl3D = False
      ParentColor = True
      ParentCtl3D = False
      ReadOnly = True
      TabOrder = 1
    end
    object msk_cd_produto: TMaskEdit
      Left = 249
      Top = 20
      Width = 29
      Height = 21
      AutoSize = False
      BevelInner = bvLowered
      BevelOuter = bvNone
      BevelKind = bkSoft
      Ctl3D = False
      EditMask = '!99;0; '
      MaxLength = 2
      ParentCtl3D = False
      TabOrder = 2
      OnChange = btn_co_produtoClick
    end
    object edt_nm_produto: TEdit
      Left = 279
      Top = 20
      Width = 178
      Height = 21
      TabStop = False
      AutoSize = False
      BevelInner = bvLowered
      BevelKind = bkSoft
      BevelOuter = bvNone
      Ctl3D = False
      ParentColor = True
      ParentCtl3D = False
      ReadOnly = True
      TabOrder = 3
    end
    object msk_nr_processo: TMaskEdit
      Left = 355
      Top = 60
      Width = 100
      Height = 21
      AutoSize = False
      BevelInner = bvLowered
      BevelOuter = bvNone
      BevelKind = bkSoft
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
      TabOrder = 4
      OnChange = msk_nr_processoChange
      OnKeyDown = msk_nr_processoKeyDown
    end
    object medCliente: TMaskEdit
      Left = 9
      Top = 60
      Width = 44
      Height = 21
      AutoSize = False
      BevelInner = bvLowered
      BevelOuter = bvNone
      BevelKind = bkSoft
      Ctl3D = False
      EditMask = '!99999;0; '
      MaxLength = 5
      ParentCtl3D = False
      TabOrder = 5
      OnChange = btnClienteClick
      OnExit = btnClienteClick
    end
    object edCliente: TEdit
      Left = 54
      Top = 60
      Width = 261
      Height = 21
      TabStop = False
      AutoSize = False
      BevelInner = bvLowered
      BevelKind = bkSoft
      BevelOuter = bvNone
      Ctl3D = False
      ParentColor = True
      ParentCtl3D = False
      ReadOnly = True
      TabOrder = 6
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 97
    Width = 495
    Height = 270
    Align = alClient
    BorderWidth = 8
    Caption = 'Panel2'
    TabOrder = 2
    object DBGrid1: TDBGrid
      Left = 9
      Top = 9
      Width = 477
      Height = 252
      Align = alClient
      DataSource = dsMain
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = []
    end
  end
  object cdsMain: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 240
    Top = 208
    object cdsMainNR_PROCESSO: TStringField
      DisplayLabel = 'Processo'
      FieldName = 'NR_PROCESSO'
      Size = 18
    end
    object cdsMainNR_NOTA: TIntegerField
      DisplayLabel = 'Num. Nota'
      FieldName = 'NR_NOTA'
    end
    object cdsMainDT_NOTA: TDateTimeField
      DisplayLabel = 'Data Nota'
      FieldName = 'DT_NOTA'
    end
    object cdsMainVL_NOTA: TFloatField
      DisplayLabel = 'Valor Nota'
      FieldName = 'VL_NOTA'
    end
  end
  object dsMain: TDataSource
    DataSet = cdsMain
    Left = 272
    Top = 208
  end
  object SaveDialog: TSaveDialog
    DefaultExt = '*.txt'
    Filter = 'Arquivo de Texto (*.txt)|*.txt'
    Title = 'PO System - Nota de Entrada'
    Left = 304
    Top = 208
  end
end
