object frm_ctaapagar: Tfrm_ctaapagar
  Left = 329
  Top = 20
  Width = 1022
  Height = 718
  BorderIcons = [biSystemMenu, biMaximize]
  Caption = 'Contas a Pagar - Movimenta'#231#227'o'
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
  WindowState = wsMaximized
  OnClose = FormClose
  OnCreate = FormCreate
  OnKeyPress = FormKeyPress
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object pnl_geral: TPanel
    Left = 0
    Top = 0
    Width = 1006
    Height = 44
    Align = alTop
    BevelOuter = bvLowered
    TabOrder = 0
    DesignSize = (
      1006
      44)
    object btn_incluir: TSpeedButton
      Left = 2
      Top = 2
      Width = 38
      Height = 41
      Hint = 'Incluir'
      Enabled = False
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
      Left = 509
      Top = 2
      Width = 38
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
      Left = 40
      Top = 2
      Width = 38
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
      Left = 78
      Top = 2
      Width = 38
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
    object btn_canc_lanc: TSpeedButton
      Left = 154
      Top = 2
      Width = 38
      Height = 41
      Hint = 'Cancelar Lan'#231'amento'
      Enabled = False
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
    object btn_excluir: TSpeedButton
      Left = 116
      Top = 2
      Width = 38
      Height = 41
      Hint = 'Excluir'
      Enabled = False
      Flat = True
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        0400000000000001000000000000000000001000000010000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333000000000
        3333333777777777F3333330F777777033333337F3F3F3F7F3333330F0808070
        33333337F7F7F7F7F3333330F080707033333337F7F7F7F7F3333330F0808070
        33333337F7F7F7F7F3333330F080707033333337F7F7F7F7F3333330F0808070
        333333F7F7F7F7F7F3F33030F080707030333737F7F7F7F7F7333300F0808070
        03333377F7F7F7F773333330F080707033333337F7F7F7F7F333333070707070
        33333337F7F7F7F7FF3333000000000003333377777777777F33330F88877777
        0333337FFFFFFFFF7F3333000000000003333377777777777333333330777033
        3333333337FFF7F3333333333000003333333333377777333333}
      NumGlyphs = 2
      ParentShowHint = False
      ShowHint = True
      OnClick = btn_excluirClick
    end
    object btn_contabiliza: TSpeedButton
      Left = 192
      Top = 2
      Width = 38
      Height = 41
      Hint = 'Contabiliza Lan'#231'amentos'
      Enabled = False
      Flat = True
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        04000000000000010000120B0000120B00001000000000000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333303333
        333333333337FF3333333333330003333333333333777F333333333333080333
        3333333F33777FF33F3333B33B000B33B3333373F777773F7333333BBB0B0BBB
        33333337737F7F77F333333BBB0F0BBB33333337337373F73F3333BBB0F7F0BB
        B333337F3737F73F7F3333BB0FB7BF0BB3333F737F37F37F73FFBBBB0BF7FB0B
        BBB3773F7F37337F377333BB0FBFBF0BB333337F73F333737F3333BBB0FBF0BB
        B3333373F73FF7337333333BBB000BBB33333337FF777337F333333BBBBBBBBB
        3333333773FF3F773F3333B33BBBBB33B33333733773773373333333333B3333
        333333333337F33333333333333B333333333333333733333333}
      NumGlyphs = 2
      ParentShowHint = False
      ShowHint = True
      OnClick = btn_contabilizaClick
    end
    object btn_pesq: TSpeedButton
      Left = 471
      Top = 2
      Width = 38
      Height = 41
      Hint = 'Pesquisar'
      Flat = True
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        0400000000000001000000000000000000001000000010000000000000000000
        80000080000000808000800000008000800080800000C0C0C000808080000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00BBBBBBBBBBBB
        BB0BBBBBBBBBBBBBBF8FBBBBBBBBBBBBB000BBBBBBBBBBBBF888BBBBBBBBBBBB
        000BBBBBBBBBBBBF888BBBBBBBBBBBB000BBBBBBBBBBBBF888BBBBBBBBBBBB00
        0BBBBBBBBFFFBF888BBBBBB80008BB80BBBBBBBF8883F888BBBBBB08888800BB
        BBBBBB887778888BBBBBB08FFFFF80BBBBBBB8F7777778FBBBBB88FFFFFFF88B
        BBBBB8777777783FBBBB08FFFFFFF80BBBBB8F777777778FBBBB08FFFFFFF80B
        BBBB8F777777778FBBBB08FFFFFFF80BBBBB83F77777778BBBBB88FFFFFFF88B
        BBBBB8F7777778FBBBBBB08FFFFF80BBBBBBB83FF777F8BBBBBBBB0888880BBB
        BBBBBB883FF88BBBBBBBBBB80008BBBBBBBBBBBB888BBBBBBBBB}
      NumGlyphs = 2
      ParentShowHint = False
      ShowHint = True
      Visible = False
      OnClick = btn_pesqClick
    end
    object Label6: TLabel
      Left = 649
      Top = 5
      Width = 37
      Height = 13
      Anchors = []
      Caption = 'Ordem'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object BtnMonta: TSpeedButton
      Left = 230
      Top = 2
      Width = 38
      Height = 41
      Hint = 'Monta as Contas'
      Flat = True
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        0400000000000001000000000000000000001000000000000000000000000000
        8000008000000080800080000000800080008080000080808000C0C0C0000000
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
      OnClick = BtnMontaClick
    end
    object BtnAutoriz: TSpeedButton
      Left = 268
      Top = 2
      Width = 38
      Height = 41
      Hint = 'Monta as Contas'
      Flat = True
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        04000000000000010000120B0000120B00001000000000000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333000000
        000033333377777777773333330FFFFFFFF03FF3FF7FF33F3FF700300000FF0F
        00F077F777773F737737E00BFBFB0FFFFFF07773333F7F3333F7E0BFBF000FFF
        F0F077F3337773F3F737E0FBFBFBF0F00FF077F3333FF7F77F37E0BFBF00000B
        0FF077F3337777737337E0FBFBFBFBF0FFF077F33FFFFFF73337E0BF0000000F
        FFF077FF777777733FF7000BFB00B0FF00F07773FF77373377373330000B0FFF
        FFF03337777373333FF7333330B0FFFF00003333373733FF777733330B0FF00F
        0FF03333737F37737F373330B00FFFFF0F033337F77F33337F733309030FFFFF
        00333377737FFFFF773333303300000003333337337777777333}
      NumGlyphs = 2
      ParentShowHint = False
      ShowHint = True
      OnClick = BtnAutorizClick
    end
    object btnFinanceiro: TSpeedButton
      Left = 306
      Top = 2
      Width = 38
      Height = 41
      Hint = 'Chama tela do Financeiro'
      Flat = True
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        04000000000000010000130B0000130B00001000000000000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333303
        333333333333337FF3333333333333903333333333333377FF33333333333399
        03333FFFFFFFFF777FF3000000999999903377777777777777FF0FFFF0999999
        99037F3337777777777F0FFFF099999999907F3FF777777777770F00F0999999
        99037F773777777777730FFFF099999990337F3FF777777777330F00FFFFF099
        03337F773333377773330FFFFFFFF09033337F3FF3FFF77733330F00F0000003
        33337F773777777333330FFFF0FF033333337F3FF7F3733333330F08F0F03333
        33337F7737F7333333330FFFF003333333337FFFF77333333333000000333333
        3333777777333333333333333333333333333333333333333333}
      NumGlyphs = 2
      ParentShowHint = False
      ShowHint = True
      OnClick = btnFinanceiroClick
    end
    object dbnvg: TDBNavigator
      Left = 355
      Top = 10
      Width = 104
      Height = 25
      DataSource = datm_ctaapagar.ds_lista
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
    end
    object cb_ordem: TComboBox
      Left = 649
      Top = 18
      Width = 137
      Height = 21
      Style = csDropDownList
      Anchors = []
      ItemHeight = 13
      TabOrder = 1
      TabStop = False
      OnClick = cb_ordemClick
    end
  end
  object Panel1: TPanel
    Left = 0
    Top = 44
    Width = 1006
    Height = 92
    Align = alTop
    Anchors = []
    BevelInner = bvLowered
    TabOrder = 1
    DesignSize = (
      1006
      92)
    object lbl_inicio: TLabel
      Left = 11
      Top = 7
      Width = 34
      Height = 13
      Alignment = taRightJustify
      Caption = 'In'#237'cio'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object lbl_fim: TLabel
      Left = 121
      Top = 7
      Width = 28
      Height = 13
      Alignment = taRightJustify
      Caption = 'Final'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object lbl_unidade: TLabel
      Left = 239
      Top = 7
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
    object btn_co_coligada: TSpeedButton
      Left = 511
      Top = 21
      Width = 24
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
      OnClick = btn_co_coligadaClick
    end
    object Label26: TLabel
      Left = 11
      Top = 47
      Width = 65
      Height = 13
      Alignment = taRightJustify
      Caption = 'Fornecedor'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object SpeedButton1: TSpeedButton
      Left = 296
      Top = 60
      Width = 24
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
      OnClick = SpeedButton1Click
    end
    object Label34: TLabel
      Left = 331
      Top = 47
      Width = 83
      Height = 13
      Alignment = taRightJustify
      Caption = 'N'#186' Nota Fiscal'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object rdgrp_base: TRadioGroup
      Left = 542
      Top = 16
      Width = 158
      Height = 65
      Anchors = []
      Caption = 'Baseado na data de:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      Items.Strings = (
        'Lan'#231'amento'
        'Vencimento'
        'Pagamento')
      ParentFont = False
      TabOrder = 0
      OnClick = rdgrp_baseClick
    end
    object edt_nm_unidade: TEdit
      Left = 267
      Top = 21
      Width = 243
      Height = 21
      TabStop = False
      Color = clMenu
      ReadOnly = True
      TabOrder = 4
    end
    object msk_dt_inicio: TDateEdit
      Left = 11
      Top = 21
      Width = 106
      Height = 21
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      NumGlyphs = 2
      ParentFont = False
      TabOrder = 1
      OnEnter = DateEdit1Enter
      OnExit = DateEdit1Exit
    end
    object msk_dt_fim: TDateEdit
      Left = 121
      Top = 21
      Width = 106
      Height = 21
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      NumGlyphs = 2
      ParentFont = False
      TabOrder = 2
      OnEnter = DateEdit2Enter
      OnExit = DateEdit1Exit
    end
    object msk_cd_unidade: TMaskEdit
      Left = 239
      Top = 21
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
      TabOrder = 3
      OnChange = btn_co_coligadaClick
      OnEnter = msk_cd_unidadeEnter
      OnExit = msk_cd_unidadeExit
      OnKeyDown = dbedt_cd_favor_contabilKeyDown
    end
    object Edit1: TEdit
      Left = 50
      Top = 60
      Width = 245
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
      TabOrder = 6
    end
    object MaskEdit7: TMaskEdit
      Left = 331
      Top = 60
      Width = 151
      Height = 21
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 7
      OnExit = MaskEdit7Exit
    end
    object MaskEdit8: TEdit
      Left = 11
      Top = 60
      Width = 40
      Height = 21
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      MaxLength = 5
      ParentFont = False
      TabOrder = 5
      OnChange = SpeedButton1Click
      OnExit = MaskEdit7Exit
    end
  end
  object pgctrl_ctaapagar: TPageControl
    Left = 0
    Top = 136
    Width = 1006
    Height = 524
    ActivePage = ts_dados_basicos
    Align = alClient
    HotTrack = True
    TabOrder = 2
    OnChange = pgctrl_ctaapagarChange
    OnChanging = pgctrl_ctaapagarChanging
    object ts_pesq: TTabSheet
      Caption = '  Pesquisa  '
      TabVisible = False
      object pnl_pesquisa: TPanel
        Left = 0
        Top = 0
        Width = 1016
        Height = 607
        BevelOuter = bvLowered
        TabOrder = 0
        OnEnter = pnl_pesquisaEnter
        object lbl_forn_pesq: TLabel
          Left = 17
          Top = 19
          Width = 65
          Height = 13
          Alignment = taRightJustify
          Caption = 'Fornecedor'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object btn_co_forn_pesq: TSpeedButton
          Left = 303
          Top = 32
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
          OnClick = btn_co_forn_pesqClick
        end
        object Label5: TLabel
          Left = 18
          Top = 100
          Width = 79
          Height = 13
          AutoSize = False
          Caption = 'Hist'#243'rico'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object lbl_vl_pagto_pesq: TLabel
          Left = 205
          Top = 150
          Width = 97
          Height = 13
          Caption = 'Valor Pagamento'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object lbl_banco_pesq: TLabel
          Left = 206
          Top = 205
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
        object btn_co_banco_pesq: TSpeedButton
          Left = 487
          Top = 218
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
          OnClick = btn_co_banco_pesqClick
        end
        object lbl_cheque_pesq: TLabel
          Left = 206
          Top = 244
          Width = 62
          Height = 13
          Alignment = taRightJustify
          Caption = 'Cheque N'#186
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object lbl_cd_ct_contabil: TLabel
          Left = 17
          Top = 291
          Width = 84
          Height = 13
          Caption = 'Conta Cont'#225'bil'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object btn_co_ct_ct_contabil_pesq: TSpeedButton
          Left = 428
          Top = 305
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
          OnClick = btn_co_ct_ct_contabil_pesqClick
        end
        object Label2: TLabel
          Left = 298
          Top = 167
          Width = 24
          Height = 13
          Caption = 'At'#233':'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label9: TLabel
          Left = 205
          Top = 167
          Width = 21
          Height = 13
          Caption = 'De:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label15: TLabel
          Left = 18
          Top = 60
          Width = 83
          Height = 13
          Alignment = taRightJustify
          Caption = 'N'#186' Nota Fiscal'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object edt_nm_forn_pesq: TEdit
          Left = 57
          Top = 32
          Width = 245
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
          TabOrder = 1
        end
        object msk_nm_historico_pesq: TMaskEdit
          Left = 18
          Top = 113
          Width = 457
          Height = 21
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          MaxLength = 180
          ParentFont = False
          TabOrder = 3
        end
        object rdgrp_forma_pagto_pesq: TRadioGroup
          Left = 18
          Top = 142
          Width = 172
          Height = 135
          Caption = 'Forma de Pagto'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ItemIndex = 3
          Items.Strings = (
            'Dinheiro'
            'Cheque'
            'DOC / D'#233'bito Conta'
            'Qualquer das anteriores')
          ParentFont = False
          TabOrder = 4
          TabStop = True
        end
        object msk_vl_pagto_pesq_inicial: TMaskEdit
          Left = 206
          Top = 180
          Width = 85
          Height = 21
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 5
          OnExit = msk_vl_pagto_pesq_inicialExit
        end
        object msk_nr_cheque_pesq: TMaskEdit
          Left = 206
          Top = 257
          Width = 104
          Height = 21
          EditMask = '999999;0; '
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          MaxLength = 6
          ParentFont = False
          TabOrder = 9
        end
        object edt_nm_ct_contabil_pesq: TEdit
          Left = 92
          Top = 305
          Width = 335
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
          TabOrder = 11
        end
        object msk_vl_pagto_pesq_final: TMaskEdit
          Left = 297
          Top = 180
          Width = 85
          Height = 21
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 6
          OnExit = msk_vl_pagto_pesq_finalExit
        end
        object msk_pesq_titulo: TMaskEdit
          Left = 18
          Top = 73
          Width = 152
          Height = 21
          EditMask = ' '
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          MaxLength = 1
          ParentFont = False
          TabOrder = 2
          Text = ' '
        end
        object msk_cd_forn_pesq: TMaskEdit
          Left = 18
          Top = 32
          Width = 40
          Height = 21
          EditMask = '99999;0; '
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          MaxLength = 5
          ParentFont = False
          TabOrder = 0
          OnChange = btn_co_forn_pesqClick
          OnExit = msk_cd_forn_pesqExit
          OnKeyDown = dbedt_cd_favor_contabilKeyDown
        end
        object msk_cd_banco_pesq: TMaskEdit
          Left = 206
          Top = 218
          Width = 39
          Height = 21
          EditMask = '999;0; '
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          MaxLength = 3
          ParentFont = False
          TabOrder = 7
          OnChange = btn_co_banco_pesqClick
          OnExit = msk_cd_banco_pesqExit
          OnKeyDown = dbedt_cd_favor_contabilKeyDown
        end
        object edt_nm_banco_pesq: TEdit
          Left = 245
          Top = 218
          Width = 241
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
          TabOrder = 8
        end
        object msk_cd_ct_contabil_pesq: TMaskEdit
          Left = 18
          Top = 305
          Width = 71
          Height = 21
          EditMask = '999999999999;0; '
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          MaxLength = 12
          ParentFont = False
          TabOrder = 10
          OnChange = btn_co_ct_ct_contabil_pesqClick
          OnExit = msk_cd_ct_contabil_pesqExit
          OnKeyDown = dbedt_cd_favor_contabilKeyDown
        end
      end
    end
    object ts_lista: TTabSheet
      Caption = '     Lista     '
      object dbgrd_lista: TDBGrid
        Left = 0
        Top = 0
        Width = 1006
        Height = 508
        Align = alClient
        Color = clWhite
        DataSource = datm_ctaapagar.ds_lista
        Options = [dgTitles, dgIndicator, dgColLines, dgRowLines, dgAlwaysShowSelection, dgConfirmDelete, dgMultiSelect]
        ReadOnly = True
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = []
        OnDblClick = dbgrd_listaDblClick
        Columns = <
          item
            Expanded = False
            FieldName = 'DT_CTAAPAGAR'
            Title.Caption = 'Dt. Lan'#231'.'
            Title.Color = clBlack
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clWhite
            Title.Font.Height = -11
            Title.Font.Name = 'MS Sans Serif'
            Title.Font.Style = [fsBold]
            Width = 60
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'NR_CTAAPAGAR'
            Title.Color = clBlack
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clWhite
            Title.Font.Height = -11
            Title.Font.Name = 'MS Sans Serif'
            Title.Font.Style = [fsBold]
            Width = 35
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'NR_CTAAPAGAR_SELECIONADO'
            Title.Caption = 'N'#186
            Title.Color = clBlack
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clWhite
            Title.Font.Height = -11
            Title.Font.Name = 'MS Sans Serif'
            Title.Font.Style = [fsBold]
            Width = 35
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'NR_TITULO'
            Title.Caption = 'Nota Fiscal'
            Title.Color = clBlack
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clWhite
            Title.Font.Height = -11
            Title.Font.Name = 'MS Sans Serif'
            Title.Font.Style = [fsBold]
            Width = 76
            Visible = True
          end
          item
            Alignment = taLeftJustify
            Expanded = False
            FieldName = 'VL_PAGAMENTO'
            Title.Color = clBlack
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clWhite
            Title.Font.Height = -11
            Title.Font.Name = 'MS Sans Serif'
            Title.Font.Style = [fsBold]
            Width = 65
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'calcTP_PAGTO'
            Title.Caption = 'Forma Pagto'
            Title.Color = clBlack
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clWhite
            Title.Font.Height = -11
            Title.Font.Name = 'MS Sans Serif'
            Title.Font.Style = [fsBold]
            Width = 78
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'DT_VENCIMENTO'
            Title.Caption = 'Dt Venc.'
            Title.Color = clBlack
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clWhite
            Title.Font.Height = -11
            Title.Font.Name = 'MS Sans Serif'
            Title.Font.Style = [fsBold]
            Width = 68
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'DT_MONTAGEM'
            Title.Caption = 'Dt Mont.'
            Title.Color = clBlack
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clWhite
            Title.Font.Height = -11
            Title.Font.Name = 'MS Sans Serif'
            Title.Font.Style = [fsBold]
            Width = 68
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'DT_PAGAMENTO'
            Title.Caption = 'Dt Pagto.'
            Title.Color = clBlack
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clWhite
            Title.Font.Height = -11
            Title.Font.Name = 'MS Sans Serif'
            Title.Font.Style = [fsBold]
            Width = 66
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'FAVORECIDO'
            Title.Caption = 'Favorecido'
            Title.Color = clBlack
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clWhite
            Title.Font.Height = -11
            Title.Font.Name = 'MS Sans Serif'
            Title.Font.Style = [fsBold]
            Width = 99
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'AP_FORNECEDOR'
            Title.Caption = 'Fornecedor'
            Title.Color = clBlack
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clWhite
            Title.Font.Height = -11
            Title.Font.Name = 'MS Sans Serif'
            Title.Font.Style = [fsBold]
            Width = 95
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'LookDistribuicao'
            Title.Caption = 'Distr.'
            Title.Color = clBlack
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clWhite
            Title.Font.Height = -11
            Title.Font.Name = 'MS Sans Serif'
            Title.Font.Style = [fsBold]
            Width = 33
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'LookLiberado'
            Title.Caption = 'Liber.'
            Title.Color = clBlack
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clWhite
            Title.Font.Height = -11
            Title.Font.Name = 'MS Sans Serif'
            Title.Font.Style = [fsBold]
            Width = 33
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'calcStatus'
            Title.Color = clBlack
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clWhite
            Title.Font.Height = -11
            Title.Font.Name = 'MS Sans Serif'
            Title.Font.Style = [fsBold]
            Width = 65
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'LookLancProvisionado'
            Title.Caption = 'Prov.'
            Title.Color = clBlack
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clWhite
            Title.Font.Height = -11
            Title.Font.Name = 'MS Sans Serif'
            Title.Font.Style = [fsBold]
            Width = 39
            Visible = True
          end
          item
            Alignment = taCenter
            Expanded = False
            FieldName = 'calcIN_SELECIONADO'
            Font.Charset = SYMBOL_CHARSET
            Font.Color = clTeal
            Font.Height = -16
            Font.Name = 'Wingdings'
            Font.Style = [fsBold]
            Title.Caption = 'Selec.'
            Title.Color = clBlack
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clWhite
            Title.Font.Height = -11
            Title.Font.Name = 'MS Sans Serif'
            Title.Font.Style = [fsBold]
            Width = 38
            Visible = True
          end>
      end
    end
    object ts_dados_basicos: TTabSheet
      Caption = '   Dados B'#225'sicos   '
      object pnl_ctaapagar: TPanel
        Left = 0
        Top = 0
        Width = 998
        Height = 496
        Align = alClient
        BevelOuter = bvLowered
        TabOrder = 0
        object Shape4: TShape
          Left = 583
          Top = 152
          Width = 198
          Height = 230
          Brush.Style = bsClear
          Pen.Color = clGray
        end
        object Shape2: TShape
          Left = 582
          Top = 26
          Width = 199
          Height = 49
          Brush.Style = bsClear
          Pen.Color = clGray
        end
        object Shape1: TShape
          Left = 582
          Top = 85
          Width = 199
          Height = 56
          Brush.Style = bsClear
          Pen.Color = clGray
        end
        object lbl_nr_lanc: TLabel
          Left = 135
          Top = 14
          Width = 33
          Height = 13
          Alignment = taRightJustify
          Caption = 'Lan'#231'.'
          Color = clMenu
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentColor = False
          ParentFont = False
        end
        object lbl_cancelado: TLabel
          Left = 592
          Top = 53
          Width = 75
          Height = 13
          Alignment = taRightJustify
          Caption = 'CANCELADO'
          Color = clMenu
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clGray
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentColor = False
          ParentFont = False
          Transparent = True
          Visible = False
        end
        object lbl_lancamento: TLabel
          Left = 20
          Top = 14
          Width = 91
          Height = 13
          Alignment = taRightJustify
          Caption = 'Dt. Lan'#231'amento'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object lbl_usuario: TLabel
          Left = 594
          Top = 92
          Width = 44
          Height = 13
          Alignment = taRightJustify
          Caption = 'Usu'#225'rio'
          FocusControl = dbedt_nm_usuario
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label11: TLabel
          Left = 685
          Top = 545
          Width = 196
          Height = 13
          Caption = 'Usu'#225'rio resp. pela Distr. Gerencial'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          Visible = False
        end
        object btn_co_usuario_ger: TSpeedButton
          Left = 960
          Top = 559
          Width = 25
          Height = 21
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
          OnClick = btn_co_usuario_gerClick
        end
        object lbl_liberado: TLabel
          Left = 656
          Top = 53
          Width = 63
          Height = 13
          Alignment = taRightJustify
          Caption = 'LIBERADO'
          Color = clMenu
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clGray
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentColor = False
          ParentFont = False
          Transparent = True
          Visible = False
        end
        object lbl_docto_banco: TLabel
          Left = 443
          Top = 14
          Width = 110
          Height = 13
          Caption = 'Lan'#231'. Provisionado'
          FocusControl = dbedt_nr_doc_bco
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label14: TLabel
          Left = 178
          Top = 14
          Width = 83
          Height = 13
          Caption = 'N'#186' Nota Fiscal'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object lb_contabiliiza: TLabel
          Left = 665
          Top = 53
          Width = 100
          Height = 13
          Alignment = taRightJustify
          Caption = 'CONTABILIZADO'
          Color = clMenu
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clGray
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentColor = False
          ParentFont = False
          Transparent = True
          Visible = False
        end
        object Label19: TLabel
          Left = 309
          Top = 14
          Width = 99
          Height = 13
          Caption = 'Dt. Emiss'#227'o Doc.'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object lbl_vl_ir: TLabel
          Left = 626
          Top = 183
          Width = 14
          Height = 13
          Caption = 'IR'
          FocusControl = dbedt_vl_ir
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object lbl_vl_inss: TLabel
          Left = 625
          Top = 231
          Width = 30
          Height = 13
          Caption = 'INSS'
          FocusControl = dbedt_vl_inss
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label17: TLabel
          Left = 625
          Top = 279
          Width = 72
          Height = 13
          Caption = 'PIS/COFINS'
          FocusControl = DBEdit1
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label18: TLabel
          Left = 625
          Top = 327
          Width = 21
          Height = 13
          Caption = 'ISS'
          FocusControl = DBEdit2
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Shape5: TShape
          Left = 584
          Top = 153
          Width = 196
          Height = 18
          Brush.Color = clSilver
          Pen.Color = clGray
          Pen.Style = psClear
        end
        object Label22: TLabel
          Left = 588
          Top = 153
          Width = 54
          Height = 13
          Caption = 'Encargos'
          FocusControl = dbedt_vl_ir
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clGray
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          Transparent = True
        end
        object Shape6: TShape
          Left = 584
          Top = 28
          Width = 196
          Height = 18
          Brush.Color = clSilver
          Pen.Color = clGray
          Pen.Style = psClear
        end
        object Label23: TLabel
          Left = 588
          Top = 29
          Width = 37
          Height = 13
          Caption = 'Status'
          FocusControl = dbedt_vl_ir
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clGray
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          Transparent = True
        end
        object PnlDados: TPanel
          Left = 13
          Top = 53
          Width = 562
          Height = 333
          BevelOuter = bvNone
          TabOrder = 5
          object Shape3: TShape
            Left = 7
            Top = 180
            Width = 550
            Height = 148
            Brush.Style = bsClear
            Pen.Color = clGray
          end
          object lbl_vl_lanc: TLabel
            Left = 20
            Top = 280
            Width = 64
            Height = 13
            Alignment = taRightJustify
            Caption = 'Valor Bruto'
            FocusControl = dbedt_vl_despesa
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object lbl_banco: TLabel
            Left = 20
            Top = 193
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
          object lbl_nr_cheque: TLabel
            Left = 430
            Top = 193
            Width = 62
            Height = 13
            Alignment = taRightJustify
            Caption = 'Cheque N'#186
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object btn_co_banco: TSpeedButton
            Left = 392
            Top = 205
            Width = 24
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
            OnClick = btn_co_bancoClick
          end
          object lbl_desconto: TLabel
            Left = 120
            Top = 280
            Width = 55
            Height = 13
            Caption = 'Desconto'
            FocusControl = dbedt_vl_desconto
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object lbl_acrescimo: TLabel
            Left = 224
            Top = 280
            Width = 59
            Height = 13
            Caption = 'Acr'#233'scimo'
            FocusControl = dbedt_vl_acrescimo
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object lbl_dt_pagamento: TLabel
            Left = 328
            Top = 236
            Width = 55
            Height = 13
            Caption = 'Dt. Pagto'
            FocusControl = dbedt_dt_pagamento
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object lbl_vencimento: TLabel
            Left = 121
            Top = 236
            Width = 62
            Height = 13
            Caption = 'Dt. Vencto'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object lbl_qtde: TLabel
            Left = 20
            Top = 236
            Width = 28
            Height = 13
            Alignment = taRightJustify
            Caption = 'Qtde'
            FocusControl = dbedt_vl_despesa
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object lbl_pagamento: TLabel
            Left = 328
            Top = 280
            Width = 77
            Height = 13
            Caption = 'Valor L'#237'quido'
            FocusControl = dbedt_vl_pagamento
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Label21: TLabel
            Left = 224
            Top = 236
            Width = 80
            Height = 13
            Caption = 'Dt. Montagem'
            FocusControl = dbedt_dt_montagem
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object lbl_historico: TLabel
            Left = 7
            Top = 132
            Width = 79
            Height = 13
            AutoSize = False
            Caption = 'Hist'#243'rico'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object lbl_fornec: TLabel
            Left = 7
            Top = 3
            Width = 65
            Height = 13
            Alignment = taRightJustify
            Caption = 'Fornecedor'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object btn_co_fornecedor: TSpeedButton
            Left = 250
            Top = 16
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
            OnClick = btn_co_fornecedorClick
          end
          object lbl_favorecido: TLabel
            Left = 283
            Top = 3
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
            Left = 533
            Top = 16
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
            OnClick = btn_co_favorecidoClick
          end
          object Label24: TLabel
            Left = 430
            Top = 236
            Width = 93
            Height = 13
            Alignment = taRightJustify
            Caption = 'N'#186' Docto Banco'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object dbedt_vl_despesa: TDBEdit
            Left = 21
            Top = 293
            Width = 84
            Height = 21
            DataField = 'VL_DESPESA'
            DataSource = datm_ctaapagar.ds_ctaapagar
            TabOrder = 15
            OnEnter = dbedt_vl_despesaEnter
            OnExit = dbedt_vl_despesaExit
          end
          object dbedt_nr_cheque: TDBEdit
            Left = 431
            Top = 206
            Width = 91
            Height = 21
            TabStop = False
            Color = clMenu
            DataField = 'NR_CHEQUE'
            DataSource = datm_ctaapagar.ds_ctaapagar
            ReadOnly = True
            TabOrder = 10
          end
          object dbedt_vl_desconto: TDBEdit
            Left = 120
            Top = 293
            Width = 89
            Height = 21
            DataField = 'VL_DESCONTO'
            DataSource = datm_ctaapagar.ds_ctaapagar
            TabOrder = 16
            OnEnter = dbedt_vl_descontoEnter
            OnExit = dbedt_vl_descontoExit
          end
          object dbedt_vl_acrescimo: TDBEdit
            Left = 224
            Top = 293
            Width = 89
            Height = 21
            DataField = 'VL_ACRESCIMO'
            DataSource = datm_ctaapagar.ds_ctaapagar
            TabOrder = 17
            OnExit = dbedt_vl_acrescimoExit
          end
          object dbedt_dt_pagamento: TDBEdit
            Left = 328
            Top = 249
            Width = 91
            Height = 21
            TabStop = False
            Color = clMenu
            DataField = 'DT_PAGAMENTO'
            DataSource = datm_ctaapagar.ds_ctaapagar
            MaxLength = 10
            ReadOnly = True
            TabOrder = 14
          end
          object msk_qtde: TMaskEdit
            Left = 21
            Top = 249
            Width = 85
            Height = 21
            Color = clMenu
            Enabled = False
            EditMask = '999;0;_'
            MaxLength = 3
            TabOrder = 11
            OnExit = msk_qtdeExit
          end
          object dbedt_dt_vencimento: TDBDateEdit
            Left = 121
            Top = 249
            Width = 90
            Height = 21
            DataField = 'DT_VENCIMENTO'
            DataSource = datm_ctaapagar.ds_ctaapagar
            NumGlyphs = 2
            TabOrder = 12
          end
          object dbedt_vl_pagamento: TDBEdit
            Left = 328
            Top = 293
            Width = 92
            Height = 21
            TabStop = False
            Color = clMenu
            DataField = 'CalcPagamento'
            DataSource = datm_ctaapagar.ds_ctaapagar
            ReadOnly = True
            TabOrder = 18
          end
          object dbedt_dt_montagem: TDBEdit
            Left = 224
            Top = 249
            Width = 89
            Height = 21
            TabStop = False
            Color = clMenu
            DataField = 'DT_MONTAGEM'
            DataSource = datm_ctaapagar.ds_ctaapagar
            ReadOnly = True
            TabOrder = 13
          end
          object dbedt_nm_banco: TEdit
            Left = 65
            Top = 206
            Width = 326
            Height = 21
            TabStop = False
            Color = clMenu
            ReadOnly = True
            TabOrder = 9
          end
          object dbedt_cd_banco: TDBEdit
            Left = 21
            Top = 206
            Width = 44
            Height = 21
            DataField = 'CD_BANCO'
            DataSource = datm_ctaapagar.ds_ctaapagar
            TabOrder = 8
            OnChange = btn_co_bancoClick
            OnExit = dbedt_cd_bancoExit
            OnKeyDown = dbedt_cd_favor_contabilKeyDown
          end
          object dbedt_nm_historico: TDBEdit
            Left = 7
            Top = 145
            Width = 552
            Height = 21
            DataField = 'NM_HISTORICO'
            DataSource = datm_ctaapagar.ds_ctaapagar
            TabOrder = 7
          end
          object grpbox_cd_barras: TGroupBox
            Left = 7
            Top = 48
            Width = 350
            Height = 76
            Caption = 'C'#243'd Barras'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
            TabOrder = 5
            object dbedt_cd_barras: TDBEdit
              Left = 12
              Top = 43
              Width = 325
              Height = 21
              DataField = 'CD_BARRAS'
              DataSource = datm_ctaapagar.ds_ctaapagar
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
              TabOrder = 1
              OnEnter = dbedt_cd_barrasEnter
              OnExit = dbedt_cd_barrasExit
            end
            object dbchk_manual: TDBCheckBox
              Left = 12
              Top = 21
              Width = 67
              Height = 17
              TabStop = False
              Caption = '&Manual'
              DataField = 'TP_CD_BARRAS'
              DataSource = datm_ctaapagar.ds_ctaapagar
              TabOrder = 0
              ValueChecked = '1'
              ValueUnchecked = '0'
            end
          end
          object dbrdgrp_forma_pagto: TDBRadioGroup
            Left = 363
            Top = 48
            Width = 196
            Height = 77
            Caption = '&Forma de Pagamento'
            DataField = 'TP_PAGAMENTO'
            DataSource = datm_ctaapagar.ds_ctaapagar
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            Items.Strings = (
              'Dinheiro'
              'Cheque'
              'DOC / D'#233'bito Conta'
              'TED')
            ParentFont = False
            TabOrder = 6
            Values.Strings = (
              '$'
              'C'
              'D'
              'T')
            OnChange = dbrdgrp_forma_pagtoChange
            OnExit = dbrdgrp_forma_pagtoExit
          end
          object dbedt_nm_fornecedor: TEdit
            Left = 51
            Top = 16
            Width = 198
            Height = 21
            TabStop = False
            Color = clMenu
            ReadOnly = True
            TabOrder = 2
          end
          object dbedt_nm_favorecido: TEdit
            Left = 326
            Top = 16
            Width = 206
            Height = 21
            TabStop = False
            Color = clMenu
            ReadOnly = True
            TabOrder = 4
          end
          object dbedt_cd_fornecedor: TDBEdit
            Left = 7
            Top = 16
            Width = 45
            Height = 21
            DataField = 'CD_FORNECEDOR'
            DataSource = datm_ctaapagar.ds_ctaapagar
            TabOrder = 1
            OnChange = btn_co_fornecedorClick
            OnExit = dbedt_cd_fornecedorExit
            OnKeyDown = dbedt_cd_favor_contabilKeyDown
          end
          object dbedt_cd_favorecido: TDBEdit
            Left = 283
            Top = 16
            Width = 44
            Height = 21
            DataField = 'CD_FAVORECIDO'
            DataSource = datm_ctaapagar.ds_ctaapagar
            TabOrder = 3
            OnChange = btn_co_favorecidoClick
            OnExit = dbedt_cd_favorecidoExit
            OnKeyDown = dbedt_cd_favor_contabilKeyDown
          end
          object dblck_lanc_provisionado1: TDBLookupComboBox
            Left = 430
            Top = -6
            Width = 64
            Height = 21
            DataField = 'IN_LANC_PROVISIONADO'
            DataSource = datm_ctaapagar.ds_ctaapagar
            KeyField = 'CD_YESNO'
            ListField = 'TX_YESNO'
            ListSource = datm_ctaapagar.ds_yesno
            TabOrder = 0
            Visible = False
          end
        end
        object dbedt_nr_ctaapagar: TDBEdit
          Left = 135
          Top = 27
          Width = 33
          Height = 21
          TabStop = False
          Color = clMenu
          DataField = 'NR_CTAAPAGAR'
          DataSource = datm_ctaapagar.ds_ctaapagar
          ReadOnly = True
          TabOrder = 1
        end
        object dbedt_dt_ctaapagar: TDBEdit
          Left = 20
          Top = 27
          Width = 104
          Height = 21
          TabStop = False
          Color = clMenu
          DataField = 'DT_CTAAPAGAR'
          DataSource = datm_ctaapagar.ds_ctaapagar
          MaxLength = 10
          ReadOnly = True
          TabOrder = 0
        end
        object dbedt_nm_usuario: TEdit
          Left = 639
          Top = 105
          Width = 127
          Height = 21
          TabStop = False
          Color = clMenu
          ReadOnly = True
          TabOrder = 7
        end
        object dbedt_cd_usuario_ger: TDBEdit
          Left = 685
          Top = 559
          Width = 44
          Height = 21
          DataField = 'CD_USUARIO_GER'
          DataSource = datm_ctaapagar.ds_ctaapagar
          TabOrder = 14
          Visible = False
          OnChange = btn_co_usuario_gerClick
          OnExit = dbedt_cd_usuario_gerExit
          OnKeyDown = dbedt_cd_favor_contabilKeyDown
        end
        object dbedt_nm_usuario_ger: TEdit
          Left = 734
          Top = 559
          Width = 221
          Height = 21
          TabStop = False
          Color = clMenu
          ReadOnly = True
          TabOrder = 15
          Visible = False
        end
        object dbedt_nr_doc_bco: TDBEdit
          Left = 443
          Top = 303
          Width = 117
          Height = 21
          TabStop = False
          Color = clMenu
          DataField = 'NR_DOC_BCO'
          DataSource = datm_ctaapagar.ds_ctaapagar
          ReadOnly = True
          TabOrder = 11
        end
        object dbedt_cd_usuario: TDBEdit
          Left = 595
          Top = 105
          Width = 44
          Height = 21
          TabStop = False
          Color = clMenu
          DataField = 'CD_USUARIO'
          DataSource = datm_ctaapagar.ds_ctaapagar
          MaxLength = 5
          ReadOnly = True
          TabOrder = 6
          OnChange = dbedt_cd_usuarioChange
          OnKeyDown = dbedt_cd_favor_contabilKeyDown
        end
        object dbedt_nr_titulo: TDBEdit
          Left = 178
          Top = 27
          Width = 121
          Height = 21
          DataField = 'NR_TITULO'
          DataSource = datm_ctaapagar.ds_ctaapagar
          TabOrder = 2
        end
        object DBDateEdit1: TDBDateEdit
          Left = 309
          Top = 27
          Width = 96
          Height = 21
          DataField = 'DT_EMISSAO_DOC'
          DataSource = datm_ctaapagar.ds_ctaapagar
          NumGlyphs = 2
          TabOrder = 3
          OnExit = DBDateEdit1Exit
        end
        object dbedt_vl_ir: TDBEdit
          Left = 626
          Top = 197
          Width = 110
          Height = 24
          TabStop = False
          AutoSize = False
          BevelInner = bvLowered
          BevelOuter = bvNone
          BevelKind = bkFlat
          Ctl3D = False
          DataField = 'VL_IR'
          DataSource = datm_ctaapagar.ds_ctaapagar
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentCtl3D = False
          ParentFont = False
          TabOrder = 8
          OnExit = dbedt_vl_irExit
        end
        object dbedt_vl_inss: TDBEdit
          Left = 625
          Top = 245
          Width = 110
          Height = 24
          TabStop = False
          AutoSize = False
          BevelInner = bvLowered
          BevelOuter = bvNone
          BevelKind = bkFlat
          Ctl3D = False
          DataField = 'VL_INSS'
          DataSource = datm_ctaapagar.ds_ctaapagar
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentCtl3D = False
          ParentFont = False
          TabOrder = 9
          OnExit = dbedt_vl_inssExit
        end
        object DBEdit1: TDBEdit
          Left = 625
          Top = 293
          Width = 110
          Height = 24
          TabStop = False
          AutoSize = False
          BevelInner = bvLowered
          BevelOuter = bvNone
          BevelKind = bkFlat
          Ctl3D = False
          DataField = 'VL_PISCOFINS'
          DataSource = datm_ctaapagar.ds_ctaapagar
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentCtl3D = False
          ParentFont = False
          TabOrder = 10
          OnExit = dbedt_vl_inssExit
        end
        object DBEdit2: TDBEdit
          Left = 625
          Top = 341
          Width = 110
          Height = 24
          TabStop = False
          AutoSize = False
          BevelInner = bvLowered
          BevelOuter = bvNone
          BevelKind = bkFlat
          Ctl3D = False
          DataField = 'VL_ISS'
          DataSource = datm_ctaapagar.ds_ctaapagar
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentCtl3D = False
          ParentFont = False
          TabOrder = 12
          OnExit = dbedt_vl_inssExit
        end
        object dblck_lanc_provisionado: TDBLookupComboBox
          Left = 442
          Top = 27
          Width = 65
          Height = 21
          DataField = 'IN_LANC_PROVISIONADO'
          DataSource = datm_ctaapagar.ds_ctaapagar
          KeyField = 'CD_YESNO'
          ListField = 'TX_YESNO'
          ListSource = datm_ctaapagar.ds_yesno
          TabOrder = 4
          OnClick = dblck_lanc_provisionadoClick
          OnExit = dblck_lanc_provisionadoExit
        end
        object dbchkSelecionado: TDBCheckBox
          Left = 445
          Top = 348
          Width = 106
          Height = 17
          Caption = 'Selecionado'
          DataField = 'IN_SELECIONADO'
          DataSource = datm_ctaapagar.ds_ctaapagar
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 13
          ValueChecked = '1'
          ValueUnchecked = '0'
        end
      end
    end
    object ts_lancamentos: TTabSheet
      Caption = 'Lan'#231'amentos'
      object pnl_ctaapagar_lanc: TPanel
        Left = 0
        Top = 0
        Width = 998
        Height = 496
        Align = alClient
        BevelOuter = bvLowered
        TabOrder = 0
        object pgctrl_lancamentos: TPageControl
          Left = 1
          Top = 55
          Width = 996
          Height = 440
          ActivePage = ts_dados_lanc
          Align = alClient
          HotTrack = True
          TabOrder = 1
          OnChange = pgctrl_ctaapagarChange
          OnChanging = pgctrl_ctaapagarChanging
          object ts_lista_lanc: TTabSheet
            Caption = '    &Lista    '
            object dbgrid_processos: TDBGrid
              Left = 0
              Top = 124
              Width = 996
              Height = 300
              Align = alClient
              Color = clWhite
              DataSource = datm_ctaapagar.ds_ctaapagar_lanc_processo_
              Options = [dgTitles, dgIndicator, dgColLines, dgRowLines, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete]
              ReadOnly = True
              TabOrder = 1
              TitleFont.Charset = DEFAULT_CHARSET
              TitleFont.Color = clWindowText
              TitleFont.Height = -11
              TitleFont.Name = 'MS Sans Serif'
              TitleFont.Style = []
              Columns = <
                item
                  Expanded = False
                  FieldName = 'CalcNrProcesso'
                  Title.Color = clBlack
                  Title.Font.Charset = DEFAULT_CHARSET
                  Title.Font.Color = clWhite
                  Title.Font.Height = -11
                  Title.Font.Name = 'MS Sans Serif'
                  Title.Font.Style = [fsBold]
                  Width = 115
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'CD_ITEM_SOLIC_PAGTO'
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
                  FieldName = 'NM_ITEM'
                  Title.Color = clBlack
                  Title.Font.Charset = DEFAULT_CHARSET
                  Title.Font.Color = clWhite
                  Title.Font.Height = -11
                  Title.Font.Name = 'MS Sans Serif'
                  Title.Font.Style = [fsBold]
                  Width = 167
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'VL_ITEM'
                  Title.Color = clBlack
                  Title.Font.Charset = DEFAULT_CHARSET
                  Title.Font.Color = clWhite
                  Title.Font.Height = -11
                  Title.Font.Name = 'MS Sans Serif'
                  Title.Font.Style = [fsBold]
                  Width = 97
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'AP_EMPRESA'
                  Title.Color = clBlack
                  Title.Font.Charset = DEFAULT_CHARSET
                  Title.Font.Color = clWhite
                  Title.Font.Height = -11
                  Title.Font.Name = 'MS Sans Serif'
                  Title.Font.Style = [fsBold]
                  Width = 129
                  Visible = True
                end>
            end
            object DBGrid1: TDBGrid
              Left = 0
              Top = 0
              Width = 996
              Height = 124
              Align = alTop
              Color = clWhite
              DataSource = datm_ctaapagar.ds_ctaapagar_lanc
              Options = [dgTitles, dgIndicator, dgColLines, dgRowLines, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete]
              ReadOnly = True
              TabOrder = 0
              TitleFont.Charset = DEFAULT_CHARSET
              TitleFont.Color = clWindowText
              TitleFont.Height = -11
              TitleFont.Name = 'MS Sans Serif'
              TitleFont.Style = []
              Columns = <
                item
                  Expanded = False
                  FieldName = 'CD_CT_CONTABIL'
                  Title.Caption = 'Nr  Conta Contabil'
                  Title.Color = clBlack
                  Title.Font.Charset = DEFAULT_CHARSET
                  Title.Font.Color = clWhite
                  Title.Font.Height = -11
                  Title.Font.Name = 'MS Sans Serif'
                  Title.Font.Style = [fsBold]
                  Width = 118
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'CD_RATEIO'
                  Title.Caption = 'C'#243'd.'
                  Title.Color = clBlack
                  Title.Font.Charset = DEFAULT_CHARSET
                  Title.Font.Color = clWhite
                  Title.Font.Height = -11
                  Title.Font.Name = 'MS Sans Serif'
                  Title.Font.Style = [fsBold]
                  Width = 52
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'Look_nome_rateio'
                  Title.Color = clBlack
                  Title.Font.Charset = DEFAULT_CHARSET
                  Title.Font.Color = clWhite
                  Title.Font.Height = -11
                  Title.Font.Name = 'MS Sans Serif'
                  Title.Font.Style = [fsBold]
                  Width = 216
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'VL_LANCAMENTO'
                  Title.Alignment = taRightJustify
                  Title.Color = clBlack
                  Title.Font.Charset = DEFAULT_CHARSET
                  Title.Font.Color = clWhite
                  Title.Font.Height = -11
                  Title.Font.Name = 'MS Sans Serif'
                  Title.Font.Style = [fsBold]
                  Width = 113
                  Visible = True
                end>
            end
          end
          object ts_dados_lanc: TTabSheet
            Caption = '   &Dados B'#225'sicos   '
            object pnl_dados_basicos_lanc: TPanel
              Left = 0
              Top = 0
              Width = 996
              Height = 424
              Align = alClient
              BevelOuter = bvLowered
              TabOrder = 0
              object lbl_cd_ct_custo: TLabel
                Left = 436
                Top = 58
                Width = 33
                Height = 13
                Caption = 'Custo'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = [fsBold]
                ParentFont = False
                Visible = False
              end
              object btn_co_ct_custo: TSpeedButton
                Left = 820
                Top = 71
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
                OnClick = btn_co_ct_custoClick
              end
              object lbl_filial: TLabel
                Left = 12
                Top = 103
                Width = 27
                Height = 13
                Caption = 'Filial'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = [fsBold]
                ParentFont = False
              end
              object btn_co_filial: TSpeedButton
                Left = 396
                Top = 116
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
                OnClick = btn_co_filialClick
              end
              object Label4: TLabel
                Left = 12
                Top = 256
                Width = 30
                Height = 13
                Alignment = taRightJustify
                Caption = 'Valor'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = [fsBold]
                ParentFont = False
              end
              object lb_item: TLabel
                Left = 12
                Top = 17
                Width = 84
                Height = 13
                Caption = 'Conta Contabil'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = [fsBold]
                ParentFont = False
              end
              object btn_ContaContabil: TSpeedButton
                Left = 396
                Top = 30
                Width = 24
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
                OnClick = btn_ContaContabilClick
              end
              object Label20: TLabel
                Left = 12
                Top = 146
                Width = 51
                Height = 13
                Alignment = taRightJustify
                Caption = 'Hist'#243'rico'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = [fsBold]
                ParentFont = False
              end
              object Label25: TLabel
                Left = 12
                Top = 58
                Width = 38
                Height = 13
                Caption = 'Rateio'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = [fsBold]
                ParentFont = False
              end
              object btn_rateio: TSpeedButton
                Left = 396
                Top = 71
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
                OnClick = btn_rateioClick
              end
              object dbedt_nm_ct_custo: TEdit
                Left = 492
                Top = 72
                Width = 327
                Height = 21
                TabStop = False
                Color = clMenu
                ReadOnly = True
                TabOrder = 9
                Visible = False
              end
              object dbedt_nm_filial: TEdit
                Left = 68
                Top = 117
                Width = 327
                Height = 21
                TabStop = False
                Color = clMenu
                ReadOnly = True
                TabOrder = 5
              end
              object dbedt_vl_lancamento: TDBEdit
                Left = 12
                Top = 269
                Width = 85
                Height = 21
                DataField = 'VL_LANCAMENTO'
                DataSource = datm_ctaapagar.ds_ctaapagar_lanc
                TabOrder = 7
                OnChange = dbedt_cd_ct_contabilChange
              end
              object dbedt_nm_ct_contabil: TEdit
                Left = 122
                Top = 31
                Width = 273
                Height = 21
                TabStop = False
                Color = clMenu
                ReadOnly = True
                TabOrder = 1
              end
              object DBMemo1: TDBMemo
                Left = 12
                Top = 160
                Width = 411
                Height = 89
                DataField = 'NM_HISTORICO'
                DataSource = datm_ctaapagar.ds_ctaapagar_lanc
                Font.Charset = ANSI_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'Courier'
                Font.Style = []
                ParentFont = False
                TabOrder = 6
              end
              object dbedt_cd_filial: TDBEdit
                Left = 12
                Top = 117
                Width = 57
                Height = 21
                DataField = 'CD_FILIAL'
                DataSource = datm_ctaapagar.ds_ctaapagar_lanc
                TabOrder = 4
                OnChange = btn_co_filialClick
                OnExit = dbedt_cd_filialExit
                OnKeyDown = dbedt_cd_favor_contabilKeyDown
              end
              object dbedt_cd_ct_custo: TDBEdit
                Left = 436
                Top = 72
                Width = 57
                Height = 21
                DataField = 'CD_CT_CUSTO'
                DataSource = datm_ctaapagar.ds_ctaapagar_lanc
                TabOrder = 8
                Visible = False
                OnChange = btn_co_ct_custoClick
                OnExit = dbedt_cd_ct_custoExit
                OnKeyDown = dbedt_cd_favor_contabilKeyDown
              end
              object dbedt_cd_ct_contabil: TDBEdit
                Left = 12
                Top = 31
                Width = 111
                Height = 21
                DataField = 'CD_CT_CONTABIL'
                DataSource = datm_ctaapagar.ds_ctaapagar_lanc
                TabOrder = 0
                OnChange = btn_ContaContabilClick
                OnExit = dbedt_cd_ct_contabilExit
                OnKeyDown = dbedt_cd_favor_contabilKeyDown
              end
              object dbedt_nm_rateio: TEdit
                Left = 70
                Top = 72
                Width = 327
                Height = 21
                TabStop = False
                Color = clMenu
                ReadOnly = True
                TabOrder = 3
              end
              object dbedt_cd_rateio: TDBEdit
                Left = 12
                Top = 72
                Width = 57
                Height = 21
                DataField = 'CD_RATEIO'
                DataSource = datm_ctaapagar.ds_ctaapagar_lanc
                TabOrder = 2
                OnChange = btn_rateioClick
                OnExit = dbedt_cd_rateioExit
                OnKeyDown = dbedt_cd_favor_contabilKeyDown
              end
            end
          end
          object ts_Rateio: TTabSheet
            Caption = 'Rateio'
            ImageIndex = 2
            object Panel3: TPanel
              Left = 0
              Top = 0
              Width = 996
              Height = 424
              Align = alClient
              BevelInner = bvLowered
              TabOrder = 0
              object DBGrid2: TDBGrid
                Left = 2
                Top = 2
                Width = 992
                Height = 420
                Align = alClient
                Color = clWhite
                DataSource = datm_ctaapagar.ds_ctaapagar_rateio
                Options = [dgTitles, dgIndicator, dgColLines, dgRowLines, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete]
                ReadOnly = True
                TabOrder = 0
                TitleFont.Charset = DEFAULT_CHARSET
                TitleFont.Color = clWindowText
                TitleFont.Height = -11
                TitleFont.Name = 'MS Sans Serif'
                TitleFont.Style = []
                Columns = <
                  item
                    Expanded = False
                    FieldName = 'CD_CT_CUSTO'
                    Title.Color = clBlack
                    Title.Font.Charset = DEFAULT_CHARSET
                    Title.Font.Color = clWhite
                    Title.Font.Height = -11
                    Title.Font.Name = 'MS Sans Serif'
                    Title.Font.Style = [fsBold]
                    Width = 209
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'LkpNM_Rateio'
                    Title.Color = clBlack
                    Title.Font.Charset = DEFAULT_CHARSET
                    Title.Font.Color = clWhite
                    Title.Font.Height = -11
                    Title.Font.Name = 'MS Sans Serif'
                    Title.Font.Style = [fsBold]
                    Width = 399
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'LkpPerc_Rateio'
                    Title.Caption = 'Perc.(%)'
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
                    FieldName = 'VALOR_RATEIO'
                    Title.Color = clBlack
                    Title.Font.Charset = DEFAULT_CHARSET
                    Title.Font.Color = clWhite
                    Title.Font.Height = -11
                    Title.Font.Name = 'MS Sans Serif'
                    Title.Font.Style = [fsBold]
                    Visible = True
                  end>
              end
            end
          end
        end
        object Panel2: TPanel
          Left = 1
          Top = 1
          Width = 996
          Height = 54
          Align = alTop
          BevelOuter = bvLowered
          TabOrder = 0
          object Label1: TLabel
            Left = 10
            Top = 11
            Width = 91
            Height = 13
            Alignment = taRightJustify
            Caption = 'Dt. Lan'#231'amento'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Label3: TLabel
            Left = 129
            Top = 11
            Width = 70
            Height = 13
            Alignment = taRightJustify
            Caption = 'Lan'#231'amento'
            Color = clMenu
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentColor = False
            ParentFont = False
          end
          object lbl_valor: TLabel
            Left = 211
            Top = 11
            Width = 30
            Height = 13
            Alignment = taRightJustify
            Caption = 'Valor'
            FocusControl = dbedt_valor
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Label16: TLabel
            Left = 338
            Top = 11
            Width = 95
            Height = 13
            Alignment = taRightJustify
            Caption = 'Valor Dispon'#237'vel'
            FocusControl = EditValDisponivel
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object dbedt_dt_ctaapagar2: TDBEdit
            Left = 10
            Top = 25
            Width = 104
            Height = 21
            TabStop = False
            Color = clMenu
            DataField = 'DT_CTAAPAGAR'
            DataSource = datm_ctaapagar.ds_ctaapagar
            MaxLength = 10
            ReadOnly = True
            TabOrder = 0
          end
          object dbedt_nr_ctaapagar2: TDBEdit
            Left = 129
            Top = 25
            Width = 33
            Height = 21
            TabStop = False
            Color = clMenu
            DataField = 'NR_CTAAPAGAR'
            DataSource = datm_ctaapagar.ds_ctaapagar
            ReadOnly = True
            TabOrder = 1
          end
          object dbedt_valor: TDBEdit
            Left = 211
            Top = 25
            Width = 101
            Height = 21
            TabStop = False
            Color = clMenu
            DataField = 'CalcValor'
            DataSource = datm_ctaapagar.ds_ctaapagar
            ReadOnly = True
            TabOrder = 2
          end
          object EditValDisponivel: TEdit
            Left = 339
            Top = 25
            Width = 101
            Height = 21
            TabStop = False
            Color = clMenu
            ReadOnly = True
            TabOrder = 3
          end
        end
      end
    end
    object ts_distr_gerencial: TTabSheet
      Caption = 'Distribui'#231#227'o Gerencial'
      TabVisible = False
      object pnl_distr_gerencial: TPanel
        Left = 0
        Top = 0
        Width = 1006
        Height = 530
        Align = alClient
        BevelOuter = bvLowered
        TabOrder = 0
        object lbl_ct_gerencial: TLabel
          Left = 289
          Top = 129
          Width = 92
          Height = 13
          Caption = 'Conta Gerencial'
          FocusControl = dbedt_nm_ct_gerencial
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object lbl_vl_distr_gerencial: TLabel
          Left = 289
          Top = 171
          Width = 30
          Height = 13
          Alignment = taRightJustify
          Caption = 'Valor'
          FocusControl = dbedt_vl_distr
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object btn_co_ct_gerencial: TSpeedButton
          Left = 570
          Top = 143
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
          OnClick = btn_co_ct_gerencialClick
        end
        object lbl_vl_lancamento: TLabel
          Left = 289
          Top = 264
          Width = 121
          Height = 13
          Alignment = taRightJustify
          Caption = 'Valor do Lan'#231'amento'
          FocusControl = dbedt_vl_lancamento2
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label7: TLabel
          Left = 10
          Top = 3
          Width = 91
          Height = 13
          Alignment = taRightJustify
          Caption = 'Dt. Lan'#231'amento'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label8: TLabel
          Left = 127
          Top = 3
          Width = 70
          Height = 13
          Alignment = taRightJustify
          Caption = 'Lan'#231'amento'
          Color = clMenu
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentColor = False
          ParentFont = False
        end
        object Label12: TLabel
          Left = 211
          Top = 3
          Width = 84
          Height = 13
          Caption = 'Conta Cont'#225'bil'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label10: TLabel
          Left = 289
          Top = 50
          Width = 92
          Height = 13
          Caption = 'Centro de Custo'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label13: TLabel
          Left = 289
          Top = 88
          Width = 27
          Height = 13
          Caption = 'Filial'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object dbgrd_distr_gerencial: TDBGrid
          Left = 10
          Top = 49
          Width = 271
          Height = 288
          Color = clWhite
          DataSource = datm_ctaapagar.ds_ctaapagar_ger_
          Options = [dgTitles, dgIndicator, dgColLines, dgRowLines, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete]
          ReadOnly = True
          TabOrder = 2
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -11
          TitleFont.Name = 'MS Sans Serif'
          TitleFont.Style = []
          Columns = <
            item
              Expanded = False
              FieldName = 'calcDistribGer'
              Title.Caption = 'Conta Gerencial'
              Title.Color = clBlack
              Title.Font.Charset = DEFAULT_CHARSET
              Title.Font.Color = clWhite
              Title.Font.Height = -11
              Title.Font.Name = 'MS Sans Serif'
              Title.Font.Style = [fsBold]
              Width = 150
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'VL_LANCAMENTO'
              Title.Alignment = taRightJustify
              Title.Color = clBlack
              Title.Font.Charset = DEFAULT_CHARSET
              Title.Font.Color = clWhite
              Title.Font.Height = -11
              Title.Font.Name = 'MS Sans Serif'
              Title.Font.Style = [fsBold]
              Width = 81
              Visible = True
            end>
        end
        object dbedt_cd_ct_gerencial: TDBEdit
          Left = 289
          Top = 144
          Width = 33
          Height = 21
          DataField = 'CD_CT_GERENCIAL'
          DataSource = datm_ctaapagar.ds_ctaapagar_ger_
          TabOrder = 0
          OnChange = btn_co_ct_gerencialClick
          OnExit = dbedt_cd_ct_gerencialExit
          OnKeyDown = dbedt_cd_favor_contabilKeyDown
        end
        object dbedt_nm_ct_gerencial: TEdit
          Left = 327
          Top = 144
          Width = 241
          Height = 21
          TabStop = False
          Color = clMenu
          ReadOnly = True
          TabOrder = 3
        end
        object dbedt_vl_distr: TDBEdit
          Left = 289
          Top = 184
          Width = 101
          Height = 21
          DataField = 'VL_LANCAMENTO'
          DataSource = datm_ctaapagar.ds_ctaapagar_ger_
          TabOrder = 1
        end
        object dbedt_vl_lancamento2: TDBEdit
          Left = 289
          Top = 277
          Width = 101
          Height = 21
          TabStop = False
          Color = clMenu
          DataField = 'VL_LANCAMENTO'
          DataSource = datm_ctaapagar.ds_ctaapagar_lanc
          ReadOnly = True
          TabOrder = 4
        end
        object dbedt_dt_ctaapagar3: TDBEdit
          Left = 10
          Top = 18
          Width = 104
          Height = 21
          TabStop = False
          Color = clMenu
          DataField = 'DT_CTAAPAGAR'
          DataSource = datm_ctaapagar.ds_ctaapagar_lanc
          MaxLength = 6
          ReadOnly = True
          TabOrder = 5
        end
        object dbedt_nr_ctaapagar3: TDBEdit
          Left = 127
          Top = 18
          Width = 33
          Height = 21
          TabStop = False
          Color = clMenu
          DataField = 'NR_CTAAPAGAR'
          DataSource = datm_ctaapagar.ds_ctaapagar_lanc
          ReadOnly = True
          TabOrder = 6
        end
        object dbedt_cd_ct_contabil2: TDBEdit
          Left = 211
          Top = 18
          Width = 75
          Height = 21
          TabStop = False
          Color = clMenu
          DataField = 'CD_CT_CONTABIL'
          DataSource = datm_ctaapagar.ds_ctaapagar_lanc
          ReadOnly = True
          TabOrder = 7
          OnKeyDown = dbedt_cd_favor_contabilKeyDown
        end
        object dbedt_nm_ct_contabil2: TDBEdit
          Left = 281
          Top = 18
          Width = 297
          Height = 21
          TabStop = False
          Color = clMenu
          DataField = 'Look_nm_item'
          DataSource = datm_ctaapagar.ds_ctaapagar_lanc
          ReadOnly = True
          TabOrder = 8
        end
        object dbedt_cd_ct_custo2: TDBEdit
          Left = 289
          Top = 63
          Width = 64
          Height = 21
          Color = clMenu
          DataField = 'CD_CT_CUSTO'
          DataSource = datm_ctaapagar.ds_ctaapagar_lanc
          TabOrder = 9
          OnChange = dbedt_cd_ct_contabilChange
          OnExit = dbedt_cd_ct_custoExit
          OnKeyDown = dbedt_cd_favor_contabilKeyDown
        end
        object dbedt_nm_ct_custo2: TDBEdit
          Left = 356
          Top = 63
          Width = 221
          Height = 21
          TabStop = False
          Color = clMenu
          DataField = 'Look_nome_ct_custo'
          DataSource = datm_ctaapagar.ds_ctaapagar_lanc
          ReadOnly = True
          TabOrder = 10
        end
        object dbedt_cd_ct_filial2: TDBEdit
          Left = 289
          Top = 100
          Width = 33
          Height = 21
          Color = clMenu
          DataField = 'CD_FILIAL'
          DataSource = datm_ctaapagar.ds_ctaapagar_lanc
          MaxLength = 3
          TabOrder = 11
          OnChange = dbedt_cd_ct_contabilChange
          OnExit = dbedt_cd_filialExit
          OnKeyDown = dbedt_cd_favor_contabilKeyDown
        end
        object dbedt_nm_filial2: TDBEdit
          Left = 327
          Top = 100
          Width = 221
          Height = 21
          TabStop = False
          Color = clMenu
          DataField = 'LookFilial'
          DataSource = datm_ctaapagar.ds_ctaapagar_lanc
          ReadOnly = True
          TabOrder = 12
        end
      end
    end
  end
  object menu_cadastro: TMainMenu
    Left = 825
    Top = 18
    object mi_incluir: TMenuItem
      Caption = '&Incluir'
      Enabled = False
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
    object mi_excluir: TMenuItem
      Caption = '&Excluir'
      Enabled = False
      OnClick = btn_excluirClick
    end
    object mi_canc_lanc: TMenuItem
      Caption = 'Cancelar &Lan'#231'amento'
      Enabled = False
      OnClick = btn_canc_lancClick
    end
    object Montar1: TMenuItem
      Caption = 'Montar'
      OnClick = BtnMontaClick
    end
    object AutorizaodePagtos1: TMenuItem
      Caption = 'Autoriza'#231#227'o de Pagtos'
      OnClick = BtnAutorizClick
    end
    object Financeiro1: TMenuItem
      Caption = 'Financeiro'
      OnClick = btnFinanceiroClick
    end
    object mi_pesq: TMenuItem
      Caption = '&Pesquisar'
      OnClick = btn_pesqClick
    end
    object mi_sair: TMenuItem
      Caption = 'Sai&r'
      Hint = ' '
      OnClick = btn_sairClick
    end
  end
end
