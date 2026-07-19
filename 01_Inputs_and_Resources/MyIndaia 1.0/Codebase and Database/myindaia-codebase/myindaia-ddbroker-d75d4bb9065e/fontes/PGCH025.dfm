object frm_sel_col_fav: Tfrm_sel_col_fav
  Left = 220
  Top = 142
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  ClientHeight = 188
  ClientWidth = 464
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  Position = poScreenCenter
  OnClose = FormClose
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object lbl_cd_coligada: TLabel
    Left = 21
    Top = 11
    Width = 50
    Height = 13
    Caption = 'Coligada'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object btn_cd_coligada: TSpeedButton
    Left = 264
    Top = 23
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
    OnClick = btn_cd_coligadaClick
  end
  object lbl_favorecido: TLabel
    Left = 21
    Top = 97
    Width = 64
    Height = 13
    Caption = 'Favorecido'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object btn_co_favorecido: TSpeedButton
    Left = 410
    Top = 109
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
    OnClick = btn_co_favorecidoClick
  end
  object Label7: TLabel
    Left = 318
    Top = 11
    Width = 23
    Height = 13
    Caption = 'Ano'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label9: TLabel
    Left = 21
    Top = 53
    Width = 139
    Height = 13
    Alignment = taRightJustify
    Caption = 'Código de Recolhimento'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object btn_co_recol: TSpeedButton
    Left = 410
    Top = 65
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
    OnClick = btn_co_recolClick
  end
  object msk_cd_coligada: TMaskEdit
    Left = 21
    Top = 24
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
    OnExit = msk_cd_coligadaExit
    OnKeyDown = msk_cd_coligadaKeyDown
  end
  object edt_nm_coligada: TEdit
    Left = 45
    Top = 24
    Width = 212
    Height = 21
    TabStop = False
    Color = clMenu
    ReadOnly = True
    TabOrder = 6
  end
  object edt_nm_favorecido: TEdit
    Left = 64
    Top = 109
    Width = 343
    Height = 21
    TabStop = False
    Color = clMenu
    ReadOnly = True
    TabOrder = 7
  end
  object msk_cd_favorecido: TMaskEdit
    Left = 21
    Top = 109
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
    TabOrder = 3
    OnExit = msk_cd_favorecidoExit
  end
  object btn_iniciar: TButton
    Left = 126
    Top = 151
    Width = 75
    Height = 25
    Caption = '&Imprimir'
    TabOrder = 4
    OnClick = btn_iniciarClick
  end
  object btn_fechar: TButton
    Left = 234
    Top = 151
    Width = 75
    Height = 25
    Cancel = True
    Caption = '&Fechar'
    ModalResult = 2
    TabOrder = 5
    OnClick = btn_fecharClick
  end
  object msk_ano: TMaskEdit
    Left = 318
    Top = 24
    Width = 46
    Height = 21
    EditMask = '9999;1;_'
    MaxLength = 4
    TabOrder = 1
    Text = '    '
    OnExit = msk_anoExit
  end
  object msk_cd_recol: TMaskEdit
    Left = 21
    Top = 66
    Width = 40
    Height = 21
    EditMask = '9999;0; '
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    MaxLength = 4
    ParentFont = False
    TabOrder = 2
    OnExit = msk_cd_recolExit
    OnKeyDown = msk_cd_coligadaKeyDown
  end
  object edt_nm_recol: TEdit
    Left = 64
    Top = 66
    Width = 343
    Height = 21
    TabStop = False
    Color = clMenu
    ReadOnly = True
    TabOrder = 8
  end
  object crp_col_fav: TCrpe
    WindowShowPrintSetupBtn = True
    WindowState = wsMaximized
    LoadEngineOnUse = False
    Left = 416
    Top = 7
  end
end
