object frm_imp_ir: Tfrm_imp_ir
  Left = 220
  Top = 142
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  ClientHeight = 264
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
    Top = 7
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
    Top = 19
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
    Top = 90
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
    Top = 101
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
    Left = 21
    Top = 132
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
  object Label1: TLabel
    Left = 21
    Top = 49
    Width = 78
    Height = 13
    Caption = 'Recolhimento'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object btn_co_recol: TSpeedButton
    Left = 286
    Top = 61
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
    OnClick = btn_co_recolClick
  end
  object lbl_data: TLabel
    Left = 21
    Top = 177
    Width = 78
    Height = 13
    Caption = 'Data Emissão'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object msk_cd_coligada: TMaskEdit
    Left = 21
    Top = 20
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
    Top = 20
    Width = 212
    Height = 21
    TabStop = False
    Color = clMenu
    ReadOnly = True
    TabOrder = 7
  end
  object edt_nm_favorecido: TEdit
    Left = 64
    Top = 102
    Width = 343
    Height = 21
    TabStop = False
    Color = clMenu
    ReadOnly = True
    TabOrder = 8
  end
  object msk_cd_favorecido: TMaskEdit
    Left = 21
    Top = 102
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
    TabOrder = 2
    OnExit = msk_cd_favorecidoExit
    OnKeyDown = msk_cd_coligadaKeyDown
  end
  object btn_iniciar: TButton
    Left = 144
    Top = 222
    Width = 75
    Height = 25
    Caption = '&Imprimir'
    TabOrder = 5
    OnClick = btn_iniciarClick
  end
  object btn_fechar: TButton
    Left = 252
    Top = 222
    Width = 75
    Height = 25
    Cancel = True
    Caption = '&Fechar'
    ModalResult = 2
    TabOrder = 6
    OnClick = btn_fecharClick
  end
  object msk_ano: TMaskEdit
    Left = 21
    Top = 145
    Width = 46
    Height = 21
    EditMask = '9999;1;_'
    MaxLength = 4
    TabOrder = 3
    Text = '    '
    OnExit = msk_anoExit
  end
  object msk_cd_recol: TMaskEdit
    Left = 21
    Top = 62
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
    TabOrder = 1
    OnExit = msk_cd_recolExit
    OnKeyDown = msk_cd_coligadaKeyDown
  end
  object edt_nm_natureza: TEdit
    Left = 64
    Top = 62
    Width = 217
    Height = 21
    TabStop = False
    Color = clMenu
    ReadOnly = True
    TabOrder = 9
  end
  object msk_data: TMaskEdit
    Left = 21
    Top = 192
    Width = 73
    Height = 21
    EditMask = '!99/99/9999;1;_'
    MaxLength = 10
    TabOrder = 4
    Text = '  /  /    '
    OnExit = msk_dataExit
  end
  object crp_ir: TCrpe
    WindowShowPrintSetupBtn = True
    WindowState = wsMaximized
    LoadEngineOnUse = False
    Left = 392
    Top = 7
  end
end
