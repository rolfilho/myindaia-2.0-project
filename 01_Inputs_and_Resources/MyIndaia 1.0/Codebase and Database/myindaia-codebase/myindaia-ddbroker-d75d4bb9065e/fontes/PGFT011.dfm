object frm_cli_mes_ano: Tfrm_cli_mes_ano
  Left = 200
  Top = 108
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  ClientHeight = 151
  ClientWidth = 390
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = True
  Position = poScreenCenter
  OnClose = FormClose
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 13
    Top = 64
    Width = 52
    Height = 13
    Caption = 'M'#234's/Ano'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object lbl_cd_cliente: TLabel
    Left = 13
    Top = 18
    Width = 40
    Height = 13
    Caption = 'Cliente'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object btn_co_cliente: TSpeedButton
    Left = 357
    Top = 29
    Width = 25
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
    OnClick = btn_co_clienteClick
  end
  object mskedt_mes_ano: TMaskEdit
    Left = 13
    Top = 80
    Width = 57
    Height = 21
    EditMask = '!99/9999;1;_'
    MaxLength = 7
    TabOrder = 1
    Text = '  /    '
  end
  object edt_nm_cliente: TEdit
    Left = 56
    Top = 30
    Width = 296
    Height = 21
    TabStop = False
    Color = clMenu
    ReadOnly = True
    TabOrder = 4
  end
  object msk_cd_cliente: TMaskEdit
    Left = 13
    Top = 30
    Width = 39
    Height = 21
    EditMask = '99999;0; '
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    MaxLength = 5
    ParentFont = False
    TabOrder = 0
    OnExit = msk_cd_clienteExit
    OnKeyDown = msk_cd_clienteKeyDown
  end
  object btn_iniciar: TButton
    Left = 113
    Top = 115
    Width = 75
    Height = 25
    Caption = '&Imprimir'
    TabOrder = 2
    OnClick = btn_iniciarClick
  end
  object btn_fechar: TButton
    Left = 205
    Top = 115
    Width = 75
    Height = 25
    Cancel = True
    Caption = '&Fechar'
    ModalResult = 2
    TabOrder = 3
    OnClick = btn_fecharClick
  end
  object crp_cli_mes_ano: TCRPE
    WindowShowPrintSetupBtn = True
    WindowShowProgressCtls = False
    WindowState = wsMaximized
    LoadEngineOnUse = False
    Left = 312
    Top = 64
  end
end
