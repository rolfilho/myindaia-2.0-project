object frm_relatorio_extrato_honorarios: Tfrm_relatorio_extrato_honorarios
  Left = 215
  Top = 178
  Width = 412
  Height = 210
  BorderIcons = [biSystemMenu]
  Caption = 'Relat'#243'rio de Honor'#225'rios'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = [fsBold]
  OldCreateOrder = True
  Position = poScreenCenter
  OnClose = FormClose
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 404
    Height = 164
    Align = alClient
    BevelInner = bvLowered
    BevelOuter = bvNone
    TabOrder = 0
    object Label1: TLabel
      Left = 16
      Top = 74
      Width = 52
      Height = 13
      Caption = 'Mes/Ano'
    end
    object Bevel1: TBevel
      Left = 12
      Top = 107
      Width = 373
      Height = 13
      Shape = bsTopLine
    end
    object lbl_cd_unid_neg: TLabel
      Left = 16
      Top = 15
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
    object btn_cd_unid_neg: TSpeedButton
      Left = 162
      Top = 27
      Width = 23
      Height = 22
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
      OnClick = btn_cd_unid_negClick
    end
    object msk_mes_ano: TMaskEdit
      Left = 80
      Top = 70
      Width = 53
      Height = 21
      EditMask = '99/9999;0; '
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      MaxLength = 7
      ParentFont = False
      TabOrder = 1
      Text = '000000'
    end
    object rg_dezena: TRadioGroup
      Left = 208
      Top = 58
      Width = 129
      Height = 37
      Caption = 'Dezena '
      Columns = 3
      ItemIndex = 0
      Items.Strings = (
        '1'#186
        '2'#186
        '3'#186)
      TabOrder = 2
    end
    object edt_nm_unid_neg: TEdit
      Left = 40
      Top = 28
      Width = 120
      Height = 21
      TabStop = False
      Color = clMenu
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      ReadOnly = True
      TabOrder = 3
    end
    object msk_cd_unid_neg: TMaskEdit
      Left = 16
      Top = 28
      Width = 21
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
      OnExit = msk_cd_unid_negExit
      OnKeyDown = msk_cd_unid_negKeyDown
    end
  end
  object Mensagem: TStatusBar
    Left = 0
    Top = 164
    Width = 404
    Height = 19
    Panels = <>
    SimplePanel = True
  end
  object btn_imprimir: TButton
    Left = 110
    Top = 122
    Width = 75
    Height = 25
    Caption = '&Imprimir'
    Default = True
    TabOrder = 2
    OnClick = btn_imprimirClick
  end
  object btn_fechar: TButton
    Left = 218
    Top = 122
    Width = 75
    Height = 25
    Cancel = True
    Caption = '&Fechar'
    ModalResult = 2
    TabOrder = 3
    OnClick = btn_fecharClick
  end
  object crp_sda: TCRPE
    WindowShowPrintSetupBtn = True
    WindowShowProgressCtls = False
    WindowState = wsMaximized
    LoadEngineOnUse = False
    Left = 8
    Top = 120
  end
end
