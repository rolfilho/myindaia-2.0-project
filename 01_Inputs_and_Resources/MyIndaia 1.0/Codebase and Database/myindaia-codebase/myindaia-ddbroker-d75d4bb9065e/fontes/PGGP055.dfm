object frm_rel_com_ind_por: Tfrm_rel_com_ind_por
  Left = 372
  Top = 267
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'Relat'#243'rio Comercial Indicado Por'
  ClientHeight = 192
  ClientWidth = 397
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = True
  Position = poScreenCenter
  OnClose = FormClose
  OnCreate = FormCreate
  OnKeyPress = FormKeyPress
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 397
    Height = 192
    Align = alClient
    BevelInner = bvLowered
    TabOrder = 0
    object Shape1: TShape
      Left = 8
      Top = 40
      Width = 377
      Height = 105
      Brush.Style = bsClear
      Pen.Color = clGray
    end
    object btn_co_indicado: TSpeedButton
      Left = 338
      Top = 63
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
      OnClick = btn_co_indicadoClick
    end
    object btn_co_depto: TSpeedButton
      Left = 338
      Top = 111
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
      OnClick = btn_co_deptoClick
    end
    object Label1: TLabel
      Left = 19
      Top = 48
      Width = 50
      Height = 13
      Caption = 'Indicado'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label2: TLabel
      Left = 19
      Top = 95
      Width = 80
      Height = 13
      Caption = 'Departamento'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Shape2: TShape
      Left = 8
      Top = 10
      Width = 377
      Height = 25
      Brush.Style = bsClear
      Pen.Color = clGray
    end
    object Label3: TLabel
      Left = 16
      Top = 15
      Width = 230
      Height = 16
      Caption = 'Relat'#243'rio Comercial Indicado por'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clGray
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = True
    end
    object msk_cd_indicado: TMaskEdit
      Left = 19
      Top = 63
      Width = 40
      Height = 21
      EditMask = '!999;0; '
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      MaxLength = 3
      ParentFont = False
      TabOrder = 0
      OnExit = msk_cd_indicadoExit
      OnKeyDown = msk_cd_indicadoKeyDown
    end
    object msk_cd_depto: TMaskEdit
      Left = 19
      Top = 111
      Width = 40
      Height = 21
      EditMask = '!999;0; '
      MaxLength = 3
      TabOrder = 1
      OnExit = msk_cd_deptoExit
      OnKeyDown = msk_cd_indicadoKeyDown
    end
    object edt_nm_indicado: TEdit
      Left = 62
      Top = 63
      Width = 270
      Height = 21
      TabStop = False
      Color = clMenu
      ReadOnly = True
      TabOrder = 2
    end
    object edt_nm_depto: TEdit
      Left = 62
      Top = 111
      Width = 270
      Height = 21
      TabStop = False
      Color = clMenu
      ReadOnly = True
      TabOrder = 3
    end
    object btn_imprimir: TButton
      Left = 209
      Top = 156
      Width = 75
      Height = 25
      Caption = '&Imprimir'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 4
      OnClick = btn_imprimirClick
    end
    object btn_cancelar: TButton
      Left = 297
      Top = 156
      Width = 75
      Height = 25
      Caption = '&Sair'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 5
      OnClick = btn_cancelarClick
    end
  end
  object crp_rel_com_ind_por: TCRPE
    WindowShowPrintSetupBtn = True
    WindowShowProgressCtls = False
    WindowState = wsMaximized
    LoadEngineOnUse = False
    Left = 238
    Top = 58
  end
end
