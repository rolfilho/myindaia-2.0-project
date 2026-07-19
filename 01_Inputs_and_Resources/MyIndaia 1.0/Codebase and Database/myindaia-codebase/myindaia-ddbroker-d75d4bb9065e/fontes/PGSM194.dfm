object frm_rel_extrato_cc: Tfrm_rel_extrato_cc
  Left = 332
  Top = 211
  Width = 402
  Height = 292
  BorderIcons = []
  Caption = 'Relat'#243'rio'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = True
  Position = poScreenCenter
  PrintScale = poNone
  OnClose = FormClose
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 394
    Height = 265
    Align = alClient
    BevelWidth = 2
    TabOrder = 0
    object lbl_coligada: TLabel
      Left = 18
      Top = 10
      Width = 50
      Height = 13
      Alignment = taRightJustify
      Caption = 'Coligada'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object btn_co_coligada: TSpeedButton
      Left = 320
      Top = 22
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
      OnClick = btn_co_coligadaClick
    end
    object lbl_unid_neg: TLabel
      Left = 18
      Top = 53
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
    object btn_co_unid_neg: TSpeedButton
      Left = 320
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
      OnClick = btn_co_unid_negClick
    end
    object btn_co_banco: TSpeedButton
      Left = 320
      Top = 107
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
      OnClick = btn_co_bancoClick
    end
    object lbl_banco: TLabel
      Left = 18
      Top = 95
      Width = 37
      Height = 13
      Alignment = taRightJustify
      Caption = 'Banco'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object lbl_periodo: TLabel
      Left = 18
      Top = 143
      Width = 120
      Height = 13
      Caption = 'Selecione o per'#237'odo:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object lbl_a: TLabel
      Left = 105
      Top = 161
      Width = 8
      Height = 13
      Caption = 'a'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object btn_imprimir: TButton
      Left = 114
      Top = 223
      Width = 66
      Height = 29
      Caption = 'Im&primir'
      TabOrder = 6
      OnClick = btn_imprimirClick
    end
    object btn_sair: TButton
      Left = 230
      Top = 223
      Width = 66
      Height = 29
      Cancel = True
      Caption = '&Sair'
      ModalResult = 2
      TabOrder = 7
      OnClick = btn_sairClick
    end
    object msk_cd_coligada: TMaskEdit
      Left = 18
      Top = 23
      Width = 26
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
      Left = 47
      Top = 23
      Width = 268
      Height = 21
      TabStop = False
      Color = clMenu
      ReadOnly = True
      TabOrder = 8
    end
    object msk_cd_unid_neg: TMaskEdit
      Left = 18
      Top = 66
      Width = 26
      Height = 21
      EditMask = '99;0; '
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      MaxLength = 2
      ParentFont = False
      TabOrder = 1
      OnExit = msk_cd_unid_negExit
      OnKeyDown = msk_cd_coligadaKeyDown
    end
    object edt_nm_unid_neg: TEdit
      Left = 47
      Top = 66
      Width = 268
      Height = 21
      TabStop = False
      Color = clMenu
      ReadOnly = True
      TabOrder = 9
    end
    object edt_nm_banco: TEdit
      Left = 54
      Top = 108
      Width = 261
      Height = 21
      TabStop = False
      Color = clMenu
      ReadOnly = True
      TabOrder = 10
    end
    object msk_cd_banco: TMaskEdit
      Left = 18
      Top = 108
      Width = 33
      Height = 21
      EditMask = '999;0; '
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      MaxLength = 3
      ParentFont = False
      TabOrder = 2
      OnExit = msk_cd_bancoExit
      OnKeyDown = msk_cd_coligadaKeyDown
    end
    object msk_dt_inicio: TMaskEdit
      Left = 18
      Top = 157
      Width = 73
      Height = 21
      EditMask = '!99/99/9999;1;_'
      MaxLength = 10
      TabOrder = 3
      Text = '  /  /    '
    end
    object msk_dt_fim: TMaskEdit
      Left = 130
      Top = 157
      Width = 73
      Height = 21
      EditMask = '!99/99/9999;1;_'
      MaxLength = 10
      TabOrder = 4
      Text = '  /  /    '
    end
    object rd_conc: TRadioGroup
      Left = 226
      Top = 143
      Width = 110
      Height = 61
      Caption = 'Registros'
      ItemIndex = 2
      Items.Strings = (
        'Conciliados'
        'N'#227'o Conciliados'
        'Ambos')
      TabOrder = 5
      OnExit = rd_concExit
    end
  end
  object crp_extrato_cc: TCRPE
    WindowShowPrintSetupBtn = True
    WindowShowProgressCtls = False
    WindowState = wsMaximized
    LoadEngineOnUse = False
    Left = 350
    Top = 10
  end
end
