object frm_sel_unid_prod_arm: Tfrm_sel_unid_prod_arm
  Left = 147
  Top = 77
  Width = 374
  Height = 453
  BorderIcons = [biSystemMenu]
  Caption = 'frm_sel_unid_prod_arm'
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
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 366
    Height = 426
    Align = alClient
    BevelWidth = 2
    TabOrder = 0
    object lbl_unid_neg: TLabel
      Left = 11
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
    object btn_co_unid_neg: TSpeedButton
      Left = 305
      Top = 25
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
    object lbl_produto: TLabel
      Left = 11
      Top = 53
      Width = 45
      Height = 13
      Alignment = taRightJustify
      Caption = 'Produto'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object btn_co_produto: TSpeedButton
      Left = 305
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
      OnClick = btn_co_produtoClick
    end
    object lbl_periodo: TLabel
      Left = 11
      Top = 134
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
      Left = 125
      Top = 152
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
    object lbl_arm: TLabel
      Left = 11
      Top = 92
      Width = 51
      Height = 13
      Caption = 'Armaz'#233'm'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object btn_co_arm: TSpeedButton
      Left = 305
      Top = 106
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
      OnClick = btn_co_armClick
    end
    object SrcLabel: TLabel
      Left = 11
      Top = 180
      Width = 145
      Height = 16
      AutoSize = False
      Caption = 'Lista de Origem:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object DstLabel: TLabel
      Left = 193
      Top = 180
      Width = 145
      Height = 16
      AutoSize = False
      Caption = 'Lista de Destino:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object IncludeBtn: TSpeedButton
      Left = 152
      Top = 228
      Width = 24
      Height = 24
      Caption = '>'
      OnClick = IncludeBtnClick
    end
    object IncAllBtn: TSpeedButton
      Left = 152
      Top = 260
      Width = 24
      Height = 24
      Caption = '>>'
      OnClick = IncAllBtnClick
    end
    object ExcludeBtn: TSpeedButton
      Left = 152
      Top = 292
      Width = 24
      Height = 24
      Caption = '<'
      Enabled = False
      OnClick = ExcludeBtnClick
    end
    object ExAllBtn: TSpeedButton
      Left = 152
      Top = 324
      Width = 24
      Height = 24
      Caption = '<<'
      Enabled = False
      OnClick = ExAllBtnClick
    end
    object Label3: TLabel
      Left = 13
      Top = 196
      Width = 93
      Height = 17
      AutoSize = False
      Caption = 'Processo'
      Color = clBlack
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentColor = False
      ParentFont = False
    end
    object Label4: TLabel
      Left = 197
      Top = 196
      Width = 93
      Height = 17
      AutoSize = False
      Caption = 'Processo'
      Color = clBlack
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentColor = False
      ParentFont = False
    end
    object msk_dt_inicio: TMaskEdit
      Left = 11
      Top = 148
      Width = 73
      Height = 21
      EditMask = '!99/99/9999;1;_'
      MaxLength = 10
      TabOrder = 3
      Text = '  /  /    '
      OnExit = msk_dt_inicioExit
    end
    object btn_imprimir: TButton
      Left = 87
      Top = 393
      Width = 66
      Height = 26
      Caption = '&Imprimir'
      TabOrder = 5
      OnClick = btn_imprimirClick
    end
    object btn_sair: TButton
      Left = 183
      Top = 393
      Width = 66
      Height = 26
      Cancel = True
      Caption = '&Sair'
      ModalResult = 2
      TabOrder = 6
      OnClick = btn_sairClick
    end
    object msk_cd_unid_neg: TMaskEdit
      Left = 11
      Top = 26
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
      OnExit = msk_cd_unid_negExit
      OnKeyDown = msk_cd_unid_negKeyDown
    end
    object edt_nm_unid_neg: TEdit
      Left = 42
      Top = 26
      Width = 255
      Height = 21
      TabStop = False
      Color = clMenu
      ReadOnly = True
      TabOrder = 7
    end
    object msk_cd_produto: TMaskEdit
      Left = 11
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
      OnExit = msk_cd_produtoExit
      OnKeyDown = msk_cd_unid_negKeyDown
    end
    object edt_nm_produto: TEdit
      Left = 42
      Top = 66
      Width = 255
      Height = 21
      TabStop = False
      Color = clMenu
      ReadOnly = True
      TabOrder = 8
    end
    object msk_dt_fim: TMaskEdit
      Left = 163
      Top = 148
      Width = 73
      Height = 21
      EditMask = '!99/99/9999;1;_'
      MaxLength = 10
      TabOrder = 4
      Text = '  /  /    '
      OnExit = msk_dt_fimExit
    end
    object msk_cd_arm: TMaskEdit
      Left = 11
      Top = 106
      Width = 39
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
      OnExit = msk_cd_armExit
      OnKeyDown = msk_cd_unid_negKeyDown
    end
    object edt_nm_arm: TEdit
      Left = 54
      Top = 106
      Width = 242
      Height = 21
      TabStop = False
      Color = clMenu
      ReadOnly = True
      TabOrder = 9
    end
    object SrcList: TListBox
      Left = 11
      Top = 213
      Width = 122
      Height = 169
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Courier New'
      Font.Style = []
      ItemHeight = 14
      MultiSelect = True
      ParentFont = False
      Sorted = True
      TabOrder = 10
    end
    object DstList: TListBox
      Left = 195
      Top = 212
      Width = 122
      Height = 169
      TabStop = False
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Courier New'
      Font.Style = []
      ItemHeight = 14
      MultiSelect = True
      ParentFont = False
      TabOrder = 11
    end
  end
  object crp_unid_prod: TCRPE
    WindowShowPrintSetupBtn = True
    WindowShowProgressCtls = False
    WindowState = wsMaximized
    LoadEngineOnUse = False
    Left = 310
    Top = 258
  end
end
