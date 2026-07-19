object frm_solic_pagto: Tfrm_solic_pagto
  Left = 126
  Top = 107
  Width = 750
  Height = 550
  HorzScrollBar.Visible = False
  VertScrollBar.Visible = False
  BorderIcons = [biSystemMenu]
  Caption = 'Solicita'#231#227'o de Pagamento'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  KeyPreview = True
  Menu = menu_cadastro
  OldCreateOrder = True
  Position = poScreenCenter
  OnClose = FormClose
  OnCreate = FormCreate
  OnKeyPress = FormKeyPress
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object pnl_cadastro: TPanel
    Left = 0
    Top = 0
    Width = 742
    Height = 49
    Align = alTop
    BevelInner = bvLowered
    Color = clSilver
    TabOrder = 0
    DesignSize = (
      742
      49)
    object btn_incluir: TSpeedButton
      Left = 5
      Top = 4
      Width = 37
      Height = 41
      Hint = 'Incluir'
      Flat = True
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        0400000000000001000000000000000000001000000010000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF0033333333B333
        333B33FF33337F3333F73BB3777BB7777BB3377FFFF77FFFF77333B000000000
        0B3333777777777777333330FFFFFFFF07333337F33333337F333330FFFFFFFF
        07333337F33333337F333330FFFFFFFF07333337F33333337F333330FFFFFFFF
        07333FF7F33333337FFFBBB0FFFFFFFF0BB37777F3333333777F3BB0FFFFFFFF
        0BBB3777F3333FFF77773330FFFF000003333337F333777773333330FFFF0FF0
        33333337F3337F37F3333330FFFF0F0B33333337F3337F77FF333330FFFF003B
        B3333337FFFF77377FF333B000000333BB33337777777F3377FF3BB3333BB333
        3BB33773333773333773B333333B3333333B7333333733333337}
      NumGlyphs = 2
      ParentShowHint = False
      ShowHint = True
      OnClick = btn_incluirClick
    end
    object btn_sair: TSpeedButton
      Left = 700
      Top = 4
      Width = 37
      Height = 41
      Hint = 'Sair'
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
    object btn_salvar: TSpeedButton
      Left = 42
      Top = 4
      Width = 37
      Height = 41
      Hint = 'Salvar'
      Enabled = False
      Flat = True
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        0400000000000001000000000000000000001000000010000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
        333333FFFFFFFFFFFFF33000077777770033377777777777773F000007888888
        00037F3337F3FF37F37F00000780088800037F3337F77F37F37F000007800888
        00037F3337F77FF7F37F00000788888800037F3337777777337F000000000000
        00037F3FFFFFFFFFFF7F00000000000000037F77777777777F7F000FFFFFFFFF
        00037F7F333333337F7F000FFFFFFFFF00037F7F333333337F7F000FFFFFFFFF
        00037F7F333333337F7F000FFFFFFFFF00037F7F333333337F7F000FFFFFFFFF
        00037F7F333333337F7F000FFFFFFFFF07037F7F33333333777F000FFFFFFFFF
        0003737FFFFFFFFF7F7330099999999900333777777777777733}
      NumGlyphs = 2
      ParentShowHint = False
      ShowHint = True
      OnClick = btn_salvarClick
    end
    object btn_cancelar: TSpeedButton
      Left = 79
      Top = 4
      Width = 37
      Height = 41
      Hint = 'Cancelar'
      Enabled = False
      Flat = True
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        0400000000000001000000000000000000001000000010000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
        333333333333333333333333333333333333333FFF33FF333FFF339993370733
        999333777FF37FF377733339993000399933333777F777F77733333399970799
        93333333777F7377733333333999399933333333377737773333333333990993
        3333333333737F73333333333331013333333333333777FF3333333333910193
        333333333337773FF3333333399000993333333337377737FF33333399900099
        93333333773777377FF333399930003999333337773777F777FF339993370733
        9993337773337333777333333333333333333333333333333333333333333333
        3333333333333333333333333333333333333333333333333333}
      NumGlyphs = 2
      ParentShowHint = False
      ShowHint = True
      OnClick = btn_cancelarClick
    end
    object btn_solicitar: TSpeedButton
      Left = 116
      Top = 4
      Width = 37
      Height = 41
      Hint = 'Solicitar Pagto'
      Flat = True
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        0400000000000001000000000000000000001000000010000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00555555555555
        555555555555555555555555555555555555555555FF55555555555559055555
        55555555577FF5555555555599905555555555557777F5555555555599905555
        555555557777FF5555555559999905555555555777777F555555559999990555
        5555557777777FF5555557990599905555555777757777F55555790555599055
        55557775555777FF5555555555599905555555555557777F5555555555559905
        555555555555777FF5555555555559905555555555555777FF55555555555579
        05555555555555777FF5555555555557905555555555555777FF555555555555
        5990555555555555577755555555555555555555555555555555}
      NumGlyphs = 2
      ParentShowHint = False
      ShowHint = True
      OnClick = btn_solicitarClick
    end
    object btn_marca_todas: TSpeedButton
      Left = 278
      Top = 4
      Width = 37
      Height = 41
      Hint = 'Marcar Todas'
      Flat = True
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        0400000000000001000000000000000000001000000010000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333000000000
        333333777777777F33333330B00000003333337F7777777F3333333000000000
        333333777777777F333333330EEEEEE033333337FFFFFF7F3333333300000000
        333333377777777F3333333330BFBFB03333333373333373F33333330BFBFBFB
        03333337F33333F7F33333330FBFBF0F03333337F33337F7F33333330BFBFB0B
        03333337F3F3F7F7333333330F0F0F0033333337F7F7F773333333330B0B0B03
        3333333737F7F7F333333333300F0F03333333337737F7F33333333333300B03
        333333333377F7F33333333333330F03333333333337F7F33333333333330B03
        3333333333373733333333333333303333333333333373333333}
      NumGlyphs = 2
      ParentShowHint = False
      ShowHint = True
      OnClick = btn_marca_todasClick
    end
    object btn_desmarca_todas: TSpeedButton
      Left = 241
      Top = 4
      Width = 37
      Height = 41
      Hint = 'Desmarcar Todas'
      Flat = True
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        0400000000000001000000000000000000001000000010000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333033333
        33333333373F33333333333330B03333333333337F7F33333333333330F03333
        333333337F7FF3333333333330B00333333333337F773FF33333333330F0F003
        333333337F7F773F3333333330B0B0B0333333337F7F7F7F3333333300F0F0F0
        333333377F73737F33333330B0BFBFB03333337F7F33337F33333330F0FBFBF0
        3333337F7333337F33333330BFBFBFB033333373F3333373333333330BFBFB03
        33333337FFFFF7FF3333333300000000333333377777777F333333330EEEEEE0
        33333337FFFFFF7FF3333333000000000333333777777777F33333330000000B
        03333337777777F7F33333330000000003333337777777773333}
      NumGlyphs = 2
      ParentShowHint = False
      ShowHint = True
      Visible = False
      OnClick = btn_desmarca_todasClick
    end
    object btn_canc_lanc: TSpeedButton
      Left = 153
      Top = 4
      Width = 37
      Height = 41
      Hint = 'Cancelar Item da Solicita'#231#227'o de Pagto'
      Flat = True
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        0400000000000001000000000000000000001000000010000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
        3333333333FFFFF3333333333999993333333333F77777FFF333333999999999
        3333333777333777FF3333993333339993333377FF3333377FF3399993333339
        993337777FF3333377F3393999333333993337F777FF333337FF993399933333
        399377F3777FF333377F993339993333399377F33777FF33377F993333999333
        399377F333777FF3377F993333399933399377F3333777FF377F993333339993
        399377FF3333777FF7733993333339993933373FF3333777F7F3399933333399
        99333773FF3333777733339993333339933333773FFFFFF77333333999999999
        3333333777333777333333333999993333333333377777333333}
      NumGlyphs = 2
      ParentShowHint = False
      ShowHint = True
      OnClick = btn_canc_lancClick
    end
    object btn_monta_pagto: TSpeedButton
      Left = 197
      Top = 4
      Width = 37
      Height = 41
      Hint = 'Montagem de Pagto'
      Flat = True
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        0400000000000001000000000000000000001000000010000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
        3333333333333333333333333333333333333FFFFFFFFFFFFFFF000000000000
        000077777777777777770FFFFFFFFFFFFFF07F3333FFF33333370FFFF777FFFF
        FFF07F333777333333370FFFFFFFFFFFFFF07F3333FFFFFF33370FFFF777777F
        FFF07F33377777733FF70FFFFFFFFFFF99907F3FFF33333377770F777FFFFFFF
        9CA07F77733333337F370FFFFFFFFFFF9A907FFFFFFFFFFF7FF7000000000000
        0000777777777777777733333333333333333333333333333333333333333333
        3333333333333333333333333333333333333333333333333333333333333333
        3333333333333333333333333333333333333333333333333333}
      NumGlyphs = 2
      ParentShowHint = False
      ShowHint = True
      OnClick = btn_monta_pagtoClick
    end
    object btnDespesasArmazem: TSpeedButton
      Left = 410
      Top = 4
      Width = 103
      Height = 41
      Hint = 'C'#225'lculo de Armazenagem'
      Anchors = [akTop, akRight]
      Caption = 'Armazenagem'
      Flat = True
      Font.Charset = ANSI_CHARSET
      Font.Color = clTeal
      Font.Height = -11
      Font.Name = 'Trebuchet MS'
      Font.Style = []
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        04000000000000010000120B0000120B00001000000000000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00337000000000
        73333337777777773F333308888888880333337F3F3F3FFF7F33330808089998
        0333337F737377737F333308888888880333337F3F3F3F3F7F33330808080808
        0333337F737373737F333308888888880333337F3F3F3F3F7F33330808080808
        0333337F737373737F333308888888880333337F3F3F3F3F7F33330808080808
        0333337F737373737F333308888888880333337F3FFFFFFF7F33330800000008
        0333337F7777777F7F333308000E0E080333337F7FFFFF7F7F33330800000008
        0333337F777777737F333308888888880333337F333333337F33330888888888
        03333373FFFFFFFF733333700000000073333337777777773333}
      NumGlyphs = 2
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      OnClick = btnDespesasArmazemClick
    end
    object btnDespesasFrete: TSpeedButton
      Left = 514
      Top = 4
      Width = 71
      Height = 41
      Hint = 'C'#225'lculo de Frete'
      Anchors = [akTop, akRight]
      Caption = 'Frete'
      Flat = True
      Font.Charset = ANSI_CHARSET
      Font.Color = clTeal
      Font.Height = -11
      Font.Name = 'Trebuchet MS'
      Font.Style = []
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        04000000000000010000120B0000120B00001000000000000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00337000000000
        73333337777777773F333308888888880333337F3F3F3FFF7F33330808089998
        0333337F737377737F333308888888880333337F3F3F3F3F7F33330808080808
        0333337F737373737F333308888888880333337F3F3F3F3F7F33330808080808
        0333337F737373737F333308888888880333337F3F3F3F3F7F33330808080808
        0333337F737373737F333308888888880333337F3FFFFFFF7F33330800000008
        0333337F7777777F7F333308000E0E080333337F7FFFFF7F7F33330800000008
        0333337F777777737F333308888888880333337F333333337F33330888888888
        03333373FFFFFFFF733333700000000073333337777777773333}
      NumGlyphs = 2
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      OnClick = btnDespesasFreteClick
    end
    object dbnvg: TDBNavigator
      Left = 600
      Top = 14
      Width = 88
      Height = 23
      DataSource = datm_solic_pagto.ds_solic_pagto
      VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast]
      Flat = True
      Hints.Strings = (
        'Primeiro'
        'Anterior'
        'Pr'#243'ximo'
        #218'ltimo')
      ParentShowHint = False
      ShowHint = True
      TabOrder = 0
      BeforeAction = dbnvgBeforeAction
    end
  end
  object Panel1: TPanel
    Left = 0
    Top = 49
    Width = 742
    Height = 107
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 1
    object lbl_unid_neg: TLabel
      Left = 12
      Top = 12
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
    object lbl_produto: TLabel
      Left = 267
      Top = 12
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
    object btn_co_unid_neg: TSpeedButton
      Left = 226
      Top = 25
      Width = 23
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
      OnClick = btn_co_unid_negClick
    end
    object btn_co_produto: TSpeedButton
      Left = 488
      Top = 25
      Width = 23
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
    object lbl_processo: TLabel
      Left = 532
      Top = 12
      Width = 53
      Height = 13
      Alignment = taRightJustify
      Caption = 'Processo'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object btn_co_processo: TSpeedButton
      Left = 641
      Top = 26
      Width = 23
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
    object lbl_cliente: TLabel
      Left = 12
      Top = 57
      Width = 40
      Height = 13
      Alignment = taRightJustify
      Caption = 'Cliente'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object lbl_servico: TLabel
      Left = 267
      Top = 57
      Width = 44
      Height = 13
      Alignment = taRightJustify
      Caption = 'Servi'#231'o'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object edt_nm_unid_neg: TEdit
      Left = 40
      Top = 26
      Width = 185
      Height = 21
      TabStop = False
      Color = clMenu
      ReadOnly = True
      TabOrder = 1
    end
    object edt_nm_produto: TEdit
      Left = 299
      Top = 26
      Width = 188
      Height = 21
      TabStop = False
      Color = clMenu
      ReadOnly = True
      TabOrder = 3
    end
    object msk_nr_processo: TMaskEdit
      Left = 532
      Top = 26
      Width = 108
      Height = 21
      CharCase = ecUpperCase
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      MaxLength = 18
      ParentFont = False
      TabOrder = 4
      OnEnter = msk_nr_processoEnter
      OnExit = msk_nr_processoExit
      OnKeyDown = dbedt_cd_itemKeyDown
    end
    object edt_nm_cliente: TEdit
      Left = 56
      Top = 71
      Width = 193
      Height = 21
      TabStop = False
      Color = clMenu
      ReadOnly = True
      TabOrder = 6
    end
    object edt_nm_servico: TEdit
      Left = 300
      Top = 71
      Width = 213
      Height = 21
      TabStop = False
      Color = clMenu
      ReadOnly = True
      TabOrder = 8
    end
    object msk_cd_unid_neg: TMaskEdit
      Left = 11
      Top = 26
      Width = 29
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
      OnEnter = msk_cd_unid_negEnter
      OnExit = msk_cd_unid_negExit
    end
    object msk_cd_produto: TMaskEdit
      Left = 267
      Top = 26
      Width = 33
      Height = 21
      EditMask = '99;0; '
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      MaxLength = 2
      ParentFont = False
      TabOrder = 2
      OnEnter = msk_cd_produtoEnter
      OnExit = msk_cd_produtoExit
    end
    object edt_cd_cliente: TEdit
      Left = 13
      Top = 71
      Width = 44
      Height = 21
      TabStop = False
      Color = clMenu
      ReadOnly = True
      TabOrder = 5
    end
    object edt_cd_servico: TEdit
      Left = 268
      Top = 71
      Width = 33
      Height = 21
      TabStop = False
      Color = clMenu
      ReadOnly = True
      TabOrder = 7
    end
  end
  object nbClassificacao: TNotebook
    Left = 0
    Top = 156
    Width = 742
    Height = 348
    Align = alClient
    TabOrder = 3
    object TPage
      Left = 0
      Top = 0
      Caption = 'desemb'
      DesignSize = (
        742
        348)
      object shp3: TShape
        Left = -5
        Top = 1
        Width = 747
        Height = 3
        Brush.Style = bsClear
        Pen.Color = clGray
      end
      object dbgrdSolicPagto: TDBGrid
        Left = 6
        Top = 9
        Width = 729
        Height = 166
        Anchors = [akLeft, akTop, akRight, akBottom]
        Ctl3D = False
        DataSource = datm_solic_pagto.ds_solic_pagto
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit, dgMultiSelect]
        ParentCtl3D = False
        ParentFont = False
        ReadOnly = True
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWhite
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = [fsBold]
        OnKeyDown = dbgrdSolicPagtoKeyDown
        Columns = <
          item
            Alignment = taCenter
            Expanded = False
            FieldName = 'LookSolicitado'
            Title.Alignment = taCenter
            Title.Caption = 'Sol.'
            Title.Color = clBlack
            Width = 34
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'NR_LANCAMENTO'
            Title.Color = clBlack
            Width = 56
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'LookItem'
            Title.Color = clBlack
            Width = 142
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'CalcVlTotal'
            Title.Alignment = taCenter
            Title.Color = clBlack
            Width = 86
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'LookFavorecido'
            Title.Alignment = taCenter
            Title.Color = clBlack
            Width = 160
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'LookStatus'
            Title.Color = clBlack
            Width = 129
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'LookTpDestino'
            Title.Color = clBlack
            Width = 139
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'NR_RD'
            Title.Caption = 'RD'
            Title.Color = clBlack
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'DT_IMPR_RD'
            Title.Caption = 'Dt. Impress'#227'o Border'#244
            Title.Color = clBlack
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'DT_IMPR_TXT'
            Title.Caption = 'Dt. impress'#227'o TXT'
            Title.Color = clBlack
            Visible = True
          end>
      end
      object pnl_solic_pagto: TPanel
        Left = 0
        Top = 181
        Width = 742
        Height = 167
        Align = alBottom
        BevelInner = bvLowered
        ParentShowHint = False
        ShowHint = False
        TabOrder = 1
        object lbl_item: TLabel
          Left = 9
          Top = 12
          Width = 25
          Height = 13
          Alignment = taRightJustify
          AutoSize = False
          Caption = 'Item'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object lbl_status: TLabel
          Left = 457
          Top = 12
          Width = 37
          Height = 13
          Alignment = taRightJustify
          Caption = 'Status'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object btn_co_item: TSpeedButton
          Left = 254
          Top = 24
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
          OnClick = btn_co_itemClick
        end
        object lbl_favorecido: TLabel
          Left = 9
          Top = 54
          Width = 64
          Height = 13
          Alignment = taRightJustify
          Caption = 'Favorecido'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object btn_co_favorecido: TSpeedButton
          Left = 254
          Top = 66
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
          OnClick = btn_co_favorecidoClick
        end
        object lbl_dt_pagto: TLabel
          Left = 288
          Top = 54
          Width = 55
          Height = 13
          Alignment = taRightJustify
          Caption = 'Dt. Pagto'
          FocusControl = dbedt_dt_pagto
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object lbl_calculo: TLabel
          Left = 388
          Top = 53
          Width = 90
          Height = 13
          Caption = 'Tipo de C'#225'lculo'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          Visible = False
        end
        object btn_co_calculo: TSpeedButton
          Left = 596
          Top = 66
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
          Visible = False
          OnClick = btn_co_calculoClick
        end
        object Label1: TLabel
          Left = 287
          Top = 12
          Width = 91
          Height = 13
          Alignment = taRightJustify
          Caption = 'Tipo de Destino'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object lbl_vl_item: TLabel
          Left = 9
          Top = 98
          Width = 30
          Height = 13
          Alignment = taRightJustify
          Caption = 'Valor'
          FocusControl = dbedt_vl_pagto
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object lbl_desconto: TLabel
          Left = 101
          Top = 98
          Width = 88
          Height = 13
          Alignment = taRightJustify
          Caption = 'Valor Desconto'
          FocusControl = dbedt_vl_desconto
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object lbl_perc_desconto: TLabel
          Left = 195
          Top = 98
          Width = 68
          Height = 13
          Alignment = taRightJustify
          Caption = '% Desconto'
          FocusControl = dbedt_perc_desconto
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object lbl_vl_total: TLabel
          Left = 387
          Top = 98
          Width = 63
          Height = 13
          Alignment = taRightJustify
          Caption = 'Valor Total'
          FocusControl = dbedt_vl_total
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label2: TLabel
          Left = 515
          Top = 98
          Width = 51
          Height = 13
          Caption = 'N'#186' Lanc.'
          FocusControl = dbedt_nr_lanc
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object lbl_rd: TLabel
          Left = 10
          Top = 145
          Width = 701
          Height = 13
          Caption = 
            'Este item teve seu border'#244' emitido, possui Nr. de RD, e n'#227'o pode' +
            ' ser mais alterado apenas cancelado quando necess'#225'rio !'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clMaroon
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          Visible = False
        end
        object Label3: TLabel
          Left = 287
          Top = 98
          Width = 91
          Height = 13
          Alignment = taRightJustify
          Caption = 'Dt. Solic. Pagto'
          FocusControl = dbedt_dt_solic_pagto
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object dbedt_nm_item: TDBEdit
          Left = 45
          Top = 25
          Width = 209
          Height = 21
          TabStop = False
          Color = clMenu
          DataField = 'LookItem'
          DataSource = datm_solic_pagto.ds_solic_pagto
          ReadOnly = True
          TabOrder = 1
        end
        object dblckbox_st_solic_ch_itens: TDBLookupComboBox
          Left = 455
          Top = 25
          Width = 166
          Height = 21
          DataField = 'LookStatus'
          DataSource = datm_solic_pagto.ds_solic_pagto
          Enabled = False
          ListField = 'DESCRICAO'
          ReadOnly = True
          TabOrder = 3
          OnClick = dbedt_cd_itemChange
        end
        object dbedt_cd_item: TDBEdit
          Left = 9
          Top = 25
          Width = 37
          Height = 21
          DataField = 'CD_ITEM'
          DataSource = datm_solic_pagto.ds_solic_pagto
          TabOrder = 0
          OnChange = dbedt_cd_itemChange
          OnExit = dbedt_cd_itemExit
          OnKeyDown = dbedt_cd_itemKeyDown
        end
        object dbedt_nm_favorecido: TDBEdit
          Left = 54
          Top = 67
          Width = 199
          Height = 21
          TabStop = False
          Color = clMenu
          DataField = 'LookFavorecido'
          DataSource = datm_solic_pagto.ds_solic_pagto
          ReadOnly = True
          TabOrder = 5
        end
        object dbedt_dt_pagto: TDBEdit
          Left = 288
          Top = 67
          Width = 97
          Height = 21
          TabStop = False
          Color = clMenu
          DataField = 'DT_PAGTO'
          DataSource = datm_solic_pagto.ds_solic_pagto
          ReadOnly = True
          TabOrder = 6
        end
        object dbedt_nm_calculo: TDBEdit
          Left = 424
          Top = 66
          Width = 172
          Height = 21
          TabStop = False
          Color = clMenu
          DataField = 'LookCalculo'
          DataSource = datm_solic_pagto.ds_solic_pagto
          ReadOnly = True
          TabOrder = 8
          Visible = False
        end
        object dblckpbox_tp_destino: TDBLookupComboBox
          Left = 288
          Top = 25
          Width = 164
          Height = 21
          DataField = 'LookTpDestino'
          DataSource = datm_solic_pagto.ds_solic_pagto
          ListField = 'NM_TP_DESTINO'
          ReadOnly = True
          TabOrder = 2
          OnClick = dbedt_cd_itemChange
        end
        object dbedt_vl_pagto: TDBEdit
          Left = 9
          Top = 111
          Width = 89
          Height = 21
          DataField = 'VL_PAGTO'
          DataSource = datm_solic_pagto.ds_solic_pagto
          TabOrder = 9
          OnChange = dbedt_cd_itemChange
        end
        object dbedt_vl_desconto: TDBEdit
          Left = 101
          Top = 111
          Width = 91
          Height = 21
          TabStop = False
          Color = clMenu
          DataField = 'VL_DESCONTO'
          DataSource = datm_solic_pagto.ds_solic_pagto
          ReadOnly = True
          TabOrder = 10
          OnChange = dbedt_cd_itemChange
        end
        object dbedt_perc_desconto: TDBEdit
          Left = 195
          Top = 111
          Width = 82
          Height = 21
          TabStop = False
          Color = clMenu
          DataField = 'VL_PERC_DESCONTO'
          DataSource = datm_solic_pagto.ds_solic_pagto
          ReadOnly = True
          TabOrder = 11
          OnChange = dbedt_cd_itemChange
        end
        object dbedt_vl_total: TDBEdit
          Left = 387
          Top = 111
          Width = 124
          Height = 21
          TabStop = False
          Color = clMenu
          DataField = 'CalcVlTotal'
          DataSource = datm_solic_pagto.ds_solic_pagto
          ReadOnly = True
          TabOrder = 13
          OnChange = dbedt_cd_itemChange
        end
        object dbedt_nr_lanc: TDBEdit
          Left = 515
          Top = 111
          Width = 79
          Height = 21
          TabStop = False
          Color = clMenu
          DataField = 'NR_LANCAMENTO'
          DataSource = datm_solic_pagto.ds_solic_pagto
          ReadOnly = True
          TabOrder = 14
          OnChange = dbedt_cd_itemChange
        end
        object dbedt_cd_favorecido: TDBEdit
          Left = 9
          Top = 67
          Width = 46
          Height = 21
          DataField = 'CD_FAVORECIDO'
          DataSource = datm_solic_pagto.ds_solic_pagto
          TabOrder = 4
          OnChange = dbedt_cd_itemChange
          OnExit = dbedt_cd_favorecidoExit
          OnKeyDown = dbedt_cd_itemKeyDown
        end
        object dbedt_cd_calculo: TDBEdit
          Left = 388
          Top = 66
          Width = 37
          Height = 21
          DataField = 'CD_CALCULO'
          DataSource = datm_solic_pagto.ds_solic_pagto
          TabOrder = 7
          Visible = False
          OnChange = dbedt_cd_itemChange
          OnExit = dbedt_cd_calculoExit
          OnKeyDown = dbedt_cd_itemKeyDown
        end
        object dbedt_dt_solic_pagto: TDBEdit
          Left = 287
          Top = 111
          Width = 97
          Height = 21
          TabStop = False
          Color = clMenu
          DataField = 'DT_SOLIC_PAGTO'
          DataSource = datm_solic_pagto.ds_solic_pagto
          ReadOnly = True
          TabOrder = 12
        end
        object pnlDadosFrete: TPanel
          Left = 624
          Top = 18
          Width = 111
          Height = 117
          BevelOuter = bvNone
          TabOrder = 15
          object lbl6: TLabel
            Left = 9
            Top = 36
            Width = 64
            Height = 13
            Alignment = taRightJustify
            Caption = 'Tx. C'#226'mbio'
            FocusControl = dbedtParidade
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object lbl7: TLabel
            Left = 9
            Top = 80
            Width = 39
            Height = 13
            Caption = 'Moeda'
            FocusControl = dbedtApMoeda
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object dbedtParidade: TDBEdit
            Left = 9
            Top = 49
            Width = 96
            Height = 21
            Color = clMenu
            DataField = 'VL_PARIDADE'
            DataSource = datm_solic_pagto.ds_solic_pagto
            ReadOnly = True
            TabOrder = 0
            OnChange = dbedt_cd_itemChange
          end
          object dbedtApMoeda: TDBEdit
            Left = 9
            Top = 92
            Width = 96
            Height = 21
            TabStop = False
            Color = clMenu
            DataField = 'calcAPMoeda'
            DataSource = datm_solic_pagto.ds_solic_pagto
            ReadOnly = True
            TabOrder = 1
            OnChange = dbedt_cd_itemChange
          end
        end
      end
    end
    object TPage
      Left = 0
      Top = 0
      Caption = 'agenc'
      DesignSize = (
        742
        348)
      object shp2: TShape
        Left = -2
        Top = 1
        Width = 747
        Height = 3
        Brush.Style = bsClear
        Pen.Color = clGray
      end
      object dbgrid_solic_pagto: TDBGrid
        Left = 7
        Top = 10
        Width = 728
        Height = 179
        Anchors = [akLeft, akTop, akRight, akBottom]
        Color = clMenu
        Ctl3D = False
        DataSource = datm_solic_pagto.ds_solic_pagto
        Options = [dgTitles, dgTabs, dgConfirmDelete, dgCancelOnExit]
        ParentCtl3D = False
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = []
        OnCellClick = dbgrid_solic_pagtoCellClick
        OnDrawColumnCell = dbgrid_solic_pagtoDrawColumnCell
        Columns = <
          item
            Expanded = False
            FieldName = 'IN_SELECIONADO'
            Title.Caption = 'Sel'
            Title.Color = clBlack
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clWhite
            Title.Font.Height = -11
            Title.Font.Name = 'MS Sans Serif'
            Title.Font.Style = [fsBold]
            Width = 25
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'CD_ITEM'
            Title.Caption = 'C'#243'd.'
            Title.Color = clBlack
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clWhite
            Title.Font.Height = -11
            Title.Font.Name = 'MS Sans Serif'
            Title.Font.Style = [fsBold]
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'LookItemAG'
            Title.Caption = 'Item'
            Title.Color = clBlack
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clWhite
            Title.Font.Height = -11
            Title.Font.Name = 'MS Sans Serif'
            Title.Font.Style = [fsBold]
            Width = 185
            Visible = True
          end
          item
            Alignment = taCenter
            Expanded = False
            FieldName = 'VL_COMPRA'
            Title.Caption = 'Compra'
            Title.Color = clBlack
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clWhite
            Title.Font.Height = -11
            Title.Font.Name = 'MS Sans Serif'
            Title.Font.Style = [fsBold]
            Width = 50
            Visible = True
          end
          item
            Alignment = taCenter
            Expanded = False
            FieldName = 'CD_MOEDA'
            Title.Caption = 'Moeda'
            Title.Color = clBlack
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clWhite
            Title.Font.Height = -11
            Title.Font.Name = 'MS Sans Serif'
            Title.Font.Style = [fsBold]
            Width = 48
            Visible = True
          end
          item
            Alignment = taCenter
            Expanded = False
            FieldName = 'VL_VENDA'
            Title.Caption = 'Venda'
            Title.Color = clBlack
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clWhite
            Title.Font.Height = -11
            Title.Font.Name = 'MS Sans Serif'
            Title.Font.Style = [fsBold]
            Width = 42
            Visible = True
          end
          item
            Alignment = taCenter
            Expanded = False
            FieldName = 'CD_MOEDA_VENDA'
            Title.Caption = 'Moeda'
            Title.Color = clBlack
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clWhite
            Title.Font.Height = -11
            Title.Font.Name = 'MS Sans Serif'
            Title.Font.Style = [fsBold]
            Width = 48
            Visible = True
          end
          item
            Alignment = taCenter
            Expanded = False
            FieldName = 'VL_COMPRA_EFETIVA'
            Title.Caption = 'Solicitado'
            Title.Color = clBlack
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clWhite
            Title.Font.Height = -11
            Title.Font.Name = 'MS Sans Serif'
            Title.Font.Style = [fsBold]
            Width = 67
            Visible = True
          end
          item
            Alignment = taCenter
            Expanded = False
            FieldName = 'VL_PAGTO'
            Title.Caption = 'Pagto (R$)'
            Title.Color = clBlack
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clWhite
            Title.Font.Height = -11
            Title.Font.Name = 'MS Sans Serif'
            Title.Font.Style = [fsBold]
            Width = 77
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'LookStatus'
            Title.Color = clBlack
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clWhite
            Title.Font.Height = -11
            Title.Font.Name = 'MS Sans Serif'
            Title.Font.Style = [fsBold]
            Width = 116
            Visible = True
          end>
      end
      object Panel2: TPanel
        Left = 0
        Top = 196
        Width = 742
        Height = 152
        Align = alBottom
        BevelInner = bvLowered
        TabOrder = 1
        object Label4: TLabel
          Left = 15
          Top = 100
          Width = 64
          Height = 13
          Alignment = taRightJustify
          Caption = 'Favorecido'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object SpeedButton1: TSpeedButton
          Left = 319
          Top = 114
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
          OnClick = btn_co_favorecidoClick
        end
        object lb_paridade: TLabel
          Left = 495
          Top = 101
          Width = 51
          Height = 13
          Caption = 'Paridade'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label5: TLabel
          Left = 164
          Top = 57
          Width = 90
          Height = 13
          Alignment = taRightJustify
          Caption = 'Valor Solicitado'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label6: TLabel
          Left = 365
          Top = 13
          Width = 91
          Height = 13
          Alignment = taRightJustify
          Caption = 'Tipo de Destino'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label9: TLabel
          Left = 366
          Top = 100
          Width = 51
          Height = 13
          Alignment = taRightJustify
          Caption = 'Dt Pagto'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label13: TLabel
          Left = 284
          Top = 57
          Width = 39
          Height = 13
          Alignment = taRightJustify
          Caption = 'Moeda'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label14: TLabel
          Left = 15
          Top = 13
          Width = 25
          Height = 13
          Alignment = taRightJustify
          AutoSize = False
          Caption = 'Item'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object SpeedButton2: TSpeedButton
          Left = 319
          Top = 18
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
          Visible = False
        end
        object Label7: TLabel
          Left = 366
          Top = 57
          Width = 76
          Height = 13
          Alignment = taRightJustify
          Caption = 'Dt Montagem'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object lb_dt_vencto: TLabel
          Left = 629
          Top = 13
          Width = 58
          Height = 13
          Alignment = taRightJustify
          Caption = 'Dt Vencto'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          Visible = False
        end
        object lb_nr_docto_fav: TLabel
          Left = 629
          Top = 56
          Width = 52
          Height = 13
          Alignment = taRightJustify
          Caption = 'Nr Docto'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          Visible = False
        end
        object Label8: TLabel
          Left = 15
          Top = 58
          Width = 90
          Height = 13
          Caption = 'Tipo de C'#225'lculo'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object SpeedButton3: TSpeedButton
          Left = 122
          Top = 71
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
          OnClick = btn_co_calculoClick
        end
        object edtNomeFavorecido: TEdit
          Left = 61
          Top = 114
          Width = 257
          Height = 21
          TabStop = False
          Color = clMenu
          ReadOnly = True
          TabOrder = 12
        end
        object DBEdit2: TDBEdit
          Left = 285
          Top = 71
          Width = 59
          Height = 21
          Color = clMenu
          DataField = 'CD_MOEDA'
          DataSource = datm_solic_pagto.ds_solic_pagto
          ReadOnly = True
          TabOrder = 9
        end
        object DBEdit3: TDBEdit
          Left = 366
          Top = 114
          Width = 110
          Height = 21
          Color = clMenu
          DataField = 'DT_PAGTO'
          DataSource = datm_solic_pagto.ds_solic_pagto
          ReadOnly = True
          TabOrder = 13
        end
        object look_tp_destino: TDBLookupComboBox
          Left = 366
          Top = 27
          Width = 110
          Height = 21
          DataField = 'LookTpDestino'
          DataSource = datm_solic_pagto.ds_solic_pagto
          TabOrder = 3
        end
        object DBEdit4: TDBEdit
          Left = 165
          Top = 71
          Width = 105
          Height = 21
          DataField = 'VL_COMPRA_EFETIVA'
          DataSource = datm_solic_pagto.ds_solic_pagto
          TabOrder = 8
          OnChange = dbedt_cd_itemChange
        end
        object dbradgrop_tp_convert: TDBRadioGroup
          Left = 496
          Top = 23
          Width = 115
          Height = 69
          Caption = 'Tipo Convers'#227'o'
          DataField = 'IN_CONVERSAO'
          DataSource = datm_solic_pagto.ds_solic_pagto
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          Items.Strings = (
            'Manual'
            'Tarif'#225'rio')
          ParentFont = False
          TabOrder = 0
          Values.Strings = (
            '0'
            '1')
          OnChange = dbradgrop_tp_convertChange
        end
        object dbedt_dt_paridade: TDBEdit
          Left = 495
          Top = 115
          Width = 85
          Height = 21
          DataField = 'DT_PARIDADE'
          DataSource = datm_solic_pagto.ds_solic_pagto
          MaxLength = 10
          TabOrder = 14
          OnChange = dbedt_cd_itemChange
        end
        object dbedt_vl_paridade: TDBEdit
          Left = 495
          Top = 115
          Width = 86
          Height = 21
          DataField = 'VL_PARIDADE'
          DataSource = datm_solic_pagto.ds_solic_pagto
          TabOrder = 15
          OnChange = dbedt_cd_itemChange
        end
        object edtDescricaoItem: TEdit
          Left = 51
          Top = 27
          Width = 294
          Height = 21
          TabStop = False
          Color = clMenu
          ReadOnly = True
          TabOrder = 2
        end
        object DBEdit8: TDBEdit
          Left = 366
          Top = 71
          Width = 110
          Height = 21
          Color = clMenu
          DataSource = datm_solic_pagto.ds_solic_pagto
          ReadOnly = True
          TabOrder = 10
        end
        object dbedt_dt_vencto: TDBEdit
          Left = 629
          Top = 27
          Width = 91
          Height = 21
          DataField = 'DT_VENCTO'
          TabOrder = 4
          Visible = False
        end
        object edt_nr_docto_fav: TDBEdit
          Left = 629
          Top = 70
          Width = 91
          Height = 21
          DataField = 'NR_DOCTO_FAV'
          TabOrder = 5
          Visible = False
        end
        object DBEdit6: TDBEdit
          Left = 15
          Top = 27
          Width = 37
          Height = 21
          Color = clMenu
          DataField = 'CD_ITEM'
          DataSource = datm_solic_pagto.ds_solic_pagto
          ReadOnly = True
          TabOrder = 1
          OnChange = DBEdit6Change
        end
        object DBEdit5: TDBEdit
          Left = 15
          Top = 114
          Width = 47
          Height = 21
          DataField = 'CD_FAVORECIDO'
          DataSource = datm_solic_pagto.ds_solic_pagto
          TabOrder = 11
          OnChange = DBEdit5Change
          OnExit = dbedt_cd_favorecidoExit
        end
        object DBEdit7: TDBEdit
          Left = 51
          Top = 71
          Width = 70
          Height = 21
          TabStop = False
          Color = clMenu
          DataField = 'LookCalculo'
          DataSource = datm_solic_pagto.ds_solic_pagto
          ReadOnly = True
          TabOrder = 7
        end
        object DBEdit9: TDBEdit
          Left = 15
          Top = 71
          Width = 37
          Height = 21
          DataField = 'CD_CALCULO'
          DataSource = datm_solic_pagto.ds_solic_pagto
          TabOrder = 6
          OnChange = dbedt_cd_itemChange
          OnExit = dbedt_cd_calculoExit
          OnKeyDown = dbedt_cd_itemKeyDown
        end
      end
    end
    object TPage
      Left = 0
      Top = 0
      Caption = 'vazio'
      DesignSize = (
        742
        348)
      object shp4: TShape
        Left = -5
        Top = 1
        Width = 747
        Height = 3
        Brush.Style = bsClear
        Pen.Color = clGray
      end
      object lbl2: TLabel
        Left = 194
        Top = 144
        Width = 341
        Height = 48
        Alignment = taCenter
        Anchors = [akLeft, akTop, akRight, akBottom]
        Caption = 
          'Informe o processo desejado para que o sistema'#13#10'exiba as informa' +
          #231#245'es correspondentes ao '#13#10'tipo de classifica'#231#227'o do mesmo.'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clTeal
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
    end
  end
  object pnlDespesasArmazem: TPanel
    Left = 207
    Top = 102
    Width = 329
    Height = 321
    BevelInner = bvLowered
    BorderStyle = bsSingle
    Ctl3D = False
    ParentCtl3D = False
    TabOrder = 2
    Visible = False
    object pnl3: TPanel
      Left = 2
      Top = 2
      Width = 323
      Height = 38
      Align = alTop
      BevelInner = bvLowered
      TabOrder = 0
      object lbl4: TLabel
        Left = 7
        Top = 6
        Width = 306
        Height = 26
        Caption = 
          'Selecione as despesas que devem ser trazidas para o pagamento e ' +
          'confirme.'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clGray
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = True
        WordWrap = True
      end
    end
    object pnl2: TPanel
      Left = 2
      Top = 276
      Width = 323
      Height = 41
      Align = alBottom
      BevelInner = bvLowered
      TabOrder = 1
      object btnConfirmaCancelamento: TSpeedButton
        Left = 246
        Top = 6
        Width = 71
        Height = 29
        Caption = 'Confirmar'
        Flat = True
        OnClick = btnConfirmaCancelamentoClick
      end
      object btnCancelaCancelamento: TSpeedButton
        Left = 173
        Top = 6
        Width = 71
        Height = 29
        Caption = 'Cancelar'
        Flat = True
        OnClick = btnCancelaCancelamentoClick
      end
      object shp1: TShape
        Left = 11
        Top = 14
        Width = 14
        Height = 14
        Brush.Color = clRed
        Pen.Color = clWhite
      end
      object lbl1: TLabel
        Left = 28
        Top = 15
        Width = 136
        Height = 13
        Caption = 'Canceladas no Controle'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clGray
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
    end
    object scbDespesasArmazem: TScrollBox
      Left = 8
      Top = 48
      Width = 273
      Height = 145
      BorderStyle = bsNone
      TabOrder = 2
    end
  end
  object pnlFrete: TPanel
    Left = 199
    Top = 92
    Width = 346
    Height = 357
    BevelInner = bvLowered
    BorderStyle = bsSingle
    Ctl3D = False
    ParentCtl3D = False
    TabOrder = 4
    Visible = False
    object pnlMoeda: TPanel
      Left = 2
      Top = 241
      Width = 340
      Height = 71
      Align = alBottom
      BevelInner = bvLowered
      TabOrder = 1
      object lbl3: TLabel
        Left = 2
        Top = 2
        Width = 336
        Height = 13
        Align = alTop
        Caption = ' Escolha as Taxas das seguintes moedas:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clGray
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = True
        WordWrap = True
      end
      object sbMoeda: TScrollBox
        Left = 2
        Top = 15
        Width = 336
        Height = 54
        Align = alClient
        BorderStyle = bsNone
        TabOrder = 0
      end
    end
    object pnlbotaoFrete: TPanel
      Left = 2
      Top = 312
      Width = 340
      Height = 41
      Align = alBottom
      BevelInner = bvLowered
      TabOrder = 0
      object btnConfirmaFrete: TSpeedButton
        Left = 262
        Top = 7
        Width = 71
        Height = 29
        Caption = 'Confirmar'
        Flat = True
        OnClick = btnConfirmaFreteClick
      end
      object btnCancelaFrete: TSpeedButton
        Left = 189
        Top = 7
        Width = 71
        Height = 29
        Caption = 'Cancelar'
        Flat = True
        OnClick = btnCancelaFreteClick
      end
    end
    object sbFrete: TScrollBox
      Left = 2
      Top = 40
      Width = 340
      Height = 201
      Align = alClient
      BorderStyle = bsNone
      TabOrder = 2
    end
    object pnlTituloFrete: TPanel
      Left = 2
      Top = 2
      Width = 340
      Height = 38
      Align = alTop
      BevelInner = bvLowered
      TabOrder = 3
      object lbl5: TLabel
        Left = 7
        Top = 6
        Width = 310
        Height = 26
        Caption = 
          'Selecione as despesas que devem ser trazidas para o pagamento e ' +
          'confirme.'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clGray
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = True
        WordWrap = True
      end
    end
  end
  object menu_cadastro: TMainMenu
    Left = 537
    Top = 4
    object mi_incluir: TMenuItem
      Caption = '&Incluir'
      Hint = ' '
      OnClick = btn_incluirClick
    end
    object mi_salvar: TMenuItem
      Caption = '&Salvar'
      Enabled = False
      OnClick = btn_salvarClick
    end
    object mi_cancelar: TMenuItem
      Caption = '&Cancelar'
      Enabled = False
      OnClick = btn_cancelarClick
    end
    object mi_solicitar: TMenuItem
      Caption = 'S&olicitar'
      OnClick = btn_solicitarClick
    end
    object mi_canc_lanc: TMenuItem
      Caption = 'Ca&ncelar item'
      Hint = 'Cancela item'
      OnClick = btn_canc_lancClick
    end
    object mi_monta_pagto: TMenuItem
      Caption = 'Mon&tagem'
      OnClick = btn_monta_pagtoClick
    end
    object mi_desmarca: TMenuItem
      Caption = '&Desmarca'
      Hint = 'Desmarca todas'
      Visible = False
      OnClick = btn_desmarca_todasClick
    end
    object mi_marca: TMenuItem
      Caption = '&Marca'
      Hint = 'Marca todas'
      OnClick = btn_marca_todasClick
    end
    object mi_sair: TMenuItem
      Caption = 'Sai&r'
      Hint = ' '
      OnClick = btn_sairClick
    end
  end
end
