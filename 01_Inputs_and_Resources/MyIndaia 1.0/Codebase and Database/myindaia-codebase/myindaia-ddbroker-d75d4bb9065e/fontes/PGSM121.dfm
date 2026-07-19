object frm_previsao: Tfrm_previsao
  Left = 367
  Top = 153
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'Confer'#234'ncia de Valores da DI'
  ClientHeight = 504
  ClientWidth = 742
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  KeyPreview = True
  Menu = mnuPrevisao
  OldCreateOrder = True
  Position = poScreenCenter
  OnClose = FormClose
  OnCreate = FormCreate
  OnKeyDown = FormKeyDown
  OnShow = FormShow
  DesignSize = (
    742
    504)
  PixelsPerInch = 96
  TextHeight = 13
  object pnl_cadastro: TPanel
    Left = 0
    Top = 0
    Width = 742
    Height = 41
    Align = alTop
    BevelInner = bvLowered
    TabOrder = 1
    object shp2: TShape
      Left = 560
      Top = 6
      Width = 141
      Height = 29
      Brush.Style = bsClear
      Pen.Color = clGray
    end
    object btn_sair: TSpeedButton
      Left = 706
      Top = 4
      Width = 31
      Height = 33
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
      Left = 36
      Top = 4
      Width = 31
      Height = 33
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
      Left = 67
      Top = 4
      Width = 31
      Height = 33
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
    object btn_incluir: TSpeedButton
      Left = 5
      Top = 4
      Width = 31
      Height = 33
      Hint = 'Novo'
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
    object btn_excluir: TSpeedButton
      Left = 98
      Top = 4
      Width = 32
      Height = 33
      Hint = 'Excluir item'
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
    object btn_calculo: TSpeedButton
      Left = 167
      Top = 4
      Width = 31
      Height = 33
      Hint = 'C'#225'lculo da Previs'#227'o de Valores'
      Enabled = False
      Flat = True
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        0400000000000001000000000000000000001000000010000000000000000000
        8000008000000080800080000000800080008080000080808000C0C0C0000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00337444444444
        73333337777777773F333348888888884333337F3F3F3FFF7F33334848489998
        4333337F737377737F333348888888884333337F3F3F3F3F7F33334848484848
        4333337F737373737F333348888888884333337F3F3F3F3F7F33334848484848
        4333337F737373737F333348888888884333337F3F3F3F3F7F33334848484848
        4333337F737373737F333348888888884333337F3FFFFFFF7F33334844444448
        4333337F7777777F7F333348444E4E484333337F7FFFFF7F7F33334844444448
        4333337F777777737F333348888888884333337F333333337F33334888888888
        43333373FFFFFFFF733333744444444473333337777777773333}
      NumGlyphs = 2
      ParentShowHint = False
      ShowHint = True
      OnClick = btn_calculoClick
    end
    object btn_imprimir: TSpeedButton
      Left = 133
      Top = 4
      Width = 31
      Height = 33
      Hint = 'Imprimir'
      Enabled = False
      Flat = True
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        0400000000000001000000000000000000001000000010000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00300000000000
        0003377777777777777308888888888888807F33333333333337088888888888
        88807FFFFFFFFFFFFFF7000000000000000077777777777777770F8F8F8F8F8F
        8F807F333333333333F708F8F8F8F8F8F9F07F333333333337370F8F8F8F8F8F
        8F807FFFFFFFFFFFFFF7000000000000000077777777777777773330FFFFFFFF
        03333337F3FFFF3F7F333330F0000F0F03333337F77773737F333330FFFFFFFF
        03333337F3FF3FFF7F333330F00F000003333337F773777773333330FFFF0FF0
        33333337F3F37F3733333330F08F0F0333333337F7337F7333333330FFFF0033
        33333337FFFF7733333333300000033333333337777773333333}
      NumGlyphs = 2
      ParentShowHint = False
      ShowHint = True
      OnClick = btn_imprimirClick
    end
    object lbl_adicao: TLabel
      Left = 573
      Top = 14
      Width = 40
      Height = 13
      Caption = 'Adi'#231#227'o'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      Visible = False
    end
    object lbl_barra: TLabel
      Left = 654
      Top = 15
      Width = 7
      Height = 13
      Caption = '/'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      Visible = False
    end
    object shp1: TShape
      Left = 464
      Top = 10
      Width = 83
      Height = 22
      Brush.Style = bsClear
      Pen.Color = clGray
    end
    object btn_trans_DI: TSpeedButton
      Left = 220
      Top = 4
      Width = 29
      Height = 33
      Hint = 'Transmitir DI'
      Enabled = False
      Flat = True
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        0400000000000001000000000000000000001000000010000000000000000000
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
      OnClick = btn_trans_DIClick
    end
    object btn_Retificar: TSpeedButton
      Left = 220
      Top = 4
      Width = 29
      Height = 33
      Hint = 'Retificar DI'
      Enabled = False
      Flat = True
      Glyph.Data = {
        36060000424D3606000000000000360000002800000020000000100000000100
        1800000000000006000000000000000000000000000000000000008080008080
        0080800080800080800080800080800080800080800080800000000080800080
        8000808000808000808000808000808000808000808000808000808000808000
        80800080800080807F7F7FFFFFFFFFFFFF008080008080008080008080008080
        0080800080800080800080800080800080800080800080800000FF0000000080
        8000808000808000808000808000808000808000808000808000808000808000
        80800080800080807F7F7F7F7F7FFFFFFFFFFFFF008080008080008080008080
        0080800080800080800080800080800080800080800080800000FF0000FF0000
        00008080008080008080008080FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFF7F7F7F7F7F7F7F7F7FFFFFFFFFFFFF008080000000000000
        0000000000000000000000000000FF0000FF0000FF0000FF0000FF0000FF0000
        FF0000000080800080807F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F
        7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7FFFFFFFFFFFFF00000000FF00
        00FF0000FF0000FF000000000000FF0000FF0000FF0000FF0000FF0000FF0000
        FF0000FF0000000080807F7F7FFFFFFF0080800080800080807F7F7F7F7F7F7F
        7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7FFFFFFF00000000FF00
        00FF0000FF0000FF000000000000FF0000FF0000FF0000FF0000FF0000FF0000
        FF0000FF0000FF0000007F7F7FFFFFFF008080FFFFFFFFFFFF7F7F7F7F7F7F7F
        7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F00000000FF00
        00000000000000FF000000000000FF0000FF0000FF0000FF0000FF0000FF0000
        FF0000FF0000000080807F7F7FFFFFFF7F7F7F7F7F7F0080807F7F7F7F7F7F7F
        7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F00808000000000FF00
        00FF0000FF0000FF000000000000FF0000FF0000FF0000FF0000FF0000FF0000
        FF0000000080800080807F7F7FFFFFFF008080FFFFFFFFFFFF7F7F7F7F7F7F7F
        7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F00808000808000000000FF00
        00000000000000FF0000FF0000FF0000FF0000FF000000000000FF0000FF0000
        000080800080800080807F7F7FFFFFFF7F7F7F7F7F7F00808000808000808000
        80800080807F7F7F7F7F7F7F7F7F7F7F7F00808000808000808000000000FF00
        00FF0000FF0000FF0000FF0000FF0000FF0000FF000000000000FF0000000080
        800080800080800080807F7F7FFFFFFF008080FFFFFFFFFFFF008080FFFFFFFF
        FFFFFFFFFF7F7F7F7F7F7F7F7F7F00808000808000808000808000000000FF00
        00000000000000FF000000000000000000000000000000000000000080800080
        800080800080800080807F7F7FFFFFFF7F7F7F7F7F7F0080807F7F7F7F7F7F7F
        7F7F7F7F7F7F7F7F7F7F7F00808000808000808000808000808000000000FF00
        00FF0000FF0000FF0000000000FF0000FF000000000080800080800080800080
        800080800080800080807F7F7FFFFFFF008080FFFFFFFFFFFF7F7F7FFFFFFF00
        80807F7F7F00808000808000808000808000808000808000808000000000FF00
        000000BFBFBF00FF0000000000FF000000000080800080800080800080800080
        800080800080800080807F7F7FFFFFFF7F7F7F7F7F7F0080807F7F7FFFFFFF7F
        7F7F00808000808000808000808000808000808000808000808000000000FF00
        00FF0000FF0000FF000000000000000080800080800080800080800080800080
        800080800080800080807F7F7FFFFFFFFFFFFFFFFFFFFFFFFF7F7F7F7F7F7F00
        8080008080008080008080008080008080008080008080008080000000000000
        0000000000000000000000000080800080800080800080800080800080800080
        800080800080800080807F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F00808000
        8080008080008080008080008080008080008080008080008080008080008080
        0080800080800080800080800080800080800080800080800080800080800080
        8000808000808000808000808000808000808000808000808000808000808000
        8080008080008080008080008080008080008080008080008080}
      NumGlyphs = 2
      ParentShowHint = False
      ShowHint = True
      Visible = False
      OnClick = btn_RetificarClick
    end
    object dbedt_nr_adicao: TDBEdit
      Left = 620
      Top = 10
      Width = 33
      Height = 19
      TabStop = False
      BevelInner = bvLowered
      BevelOuter = bvNone
      BevelKind = bkFlat
      Color = clMenu
      Ctl3D = False
      DataField = 'NR_ADICAO'
      DataSource = datm_previsao.ds_previsao_adicao
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      MaxLength = 15
      ParentCtl3D = False
      ParentFont = False
      ReadOnly = True
      TabOrder = 0
      Visible = False
    end
    object dbedt_qtadicoes: TDBEdit
      Left = 663
      Top = 10
      Width = 33
      Height = 19
      TabStop = False
      BevelInner = bvLowered
      BevelOuter = bvNone
      BevelKind = bkFlat
      Color = clMenu
      Ctl3D = False
      DataField = 'QT_ADICOES'
      DataSource = datm_previsao.ds_previsao
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      MaxLength = 15
      ParentCtl3D = False
      ParentFont = False
      ReadOnly = True
      TabOrder = 1
      Visible = False
    end
    object dbnvgr_previsao_adicao: TDBNavigator
      Left = 466
      Top = 11
      Width = 80
      Height = 20
      DataSource = datm_previsao.ds_previsao_adicao
      VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast]
      Enabled = False
      Flat = True
      Hints.Strings = (
        'Primeira adi'#231#227'o'
        'Adi'#231#227'o Anterior'
        'Pr'#243'xima adi'#231#227'o'
        #218'ltima adi'#231#227'o')
      ParentShowHint = False
      ShowHint = True
      TabOrder = 2
    end
  end
  object pgctrlPrev: TPageControl
    Left = 0
    Top = 41
    Width = 742
    Height = 463
    ActivePage = ts_capa
    Align = alClient
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    HotTrack = True
    ParentFont = False
    TabOrder = 0
    OnChange = pgctrlPrevChange
    OnChanging = pgctrlPrevChanging
    object ts_capa: TTabSheet
      Caption = '&Capa'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      object fra_Valores: TGroupBox
        Left = 9
        Top = 201
        Width = 717
        Height = 232
        TabOrder = 1
        object shp4: TShape
          Left = 8
          Top = 137
          Width = 701
          Height = 88
          Brush.Style = bsClear
          Pen.Color = clGray
        end
        object shp3: TShape
          Left = 8
          Top = 92
          Width = 701
          Height = 43
          Brush.Style = bsClear
          Pen.Color = clGray
        end
        object shp5: TShape
          Left = 8
          Top = 9
          Width = 701
          Height = 81
          Brush.Style = bsClear
          Pen.Color = clGray
        end
        object lbl_moeda: TLabel
          Left = 19
          Top = 21
          Width = 39
          Height = 13
          Caption = 'Moeda'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object lbl_vl_moeda: TLabel
          Left = 141
          Top = 21
          Width = 90
          Height = 13
          Caption = 'Valor na Moeda'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object lbl_vl_real: TLabel
          Left = 394
          Top = 21
          Width = 80
          Height = 13
          Caption = 'Valor em Real'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object lbl_Frete: TLabel
          Left = 19
          Top = 111
          Width = 30
          Height = 13
          Caption = 'Frete'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object lbl_Seguro: TLabel
          Left = 19
          Top = 148
          Width = 41
          Height = 13
          Caption = 'Seguro'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object btn_co_moeda_mle: TSpeedButton
          Left = 99
          Top = 18
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
          OnClick = btn_co_moeda_mleClick
        end
        object btn_co_moeda_seguro: TSpeedButton
          Left = 99
          Top = 145
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
          OnClick = btn_co_moeda_seguroClick
        end
        object btn_co_moeda_frete: TSpeedButton
          Left = 99
          Top = 108
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
          OnClick = btn_co_moeda_freteClick
        end
        object lbl_pc_seguro: TLabel
          Left = 622
          Top = 164
          Width = 50
          Height = 13
          Caption = 'Taxa (%)'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object lbl1: TLabel
          Left = 121
          Top = 45
          Width = 110
          Height = 13
          Caption = 'Despesa na Moeda'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object lbl2: TLabel
          Left = 374
          Top = 46
          Width = 100
          Height = 13
          Caption = 'Despesa em Real'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object lbl_frete_terr_nacional: TLabel
          Left = 263
          Top = 96
          Width = 123
          Height = 13
          Caption = 'Em territ'#243'rio Nacional'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object dbedt_cd_moeda_mle: TDBEdit
          Left = 66
          Top = 18
          Width = 32
          Height = 21
          DataField = 'CD_MOEDA_MLE'
          DataSource = datm_previsao.ds_previsao
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 0
          OnExit = dbedt_vl_mle_mnegExit
          OnKeyDown = msk_cd_unid_negKeyDown
        end
        object dbedt_vl_mle_mneg: TDBEdit
          Left = 235
          Top = 18
          Width = 121
          Height = 21
          DataField = 'VL_MLE_MNEG'
          DataSource = datm_previsao.ds_previsao
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          MaxLength = 20
          ParentFont = False
          TabOrder = 1
          OnExit = dbedt_vl_mle_mnegExit
        end
        object dbedt_vl_mle_mn: TDBEdit
          Left = 479
          Top = 18
          Width = 122
          Height = 21
          TabStop = False
          Color = clMenu
          DataField = 'VL_MLE_MN'
          DataSource = datm_previsao.ds_previsao
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          MaxLength = 20
          ParentFont = False
          ReadOnly = True
          TabOrder = 2
          OnExit = dbedt_vl_mle_mnExit
        end
        object dbedt_vl_desp_mn: TDBEdit
          Left = 479
          Top = 42
          Width = 123
          Height = 21
          TabStop = False
          Color = clMenu
          DataField = 'VL_DESP_MN'
          DataSource = datm_previsao.ds_previsao
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          MaxLength = 20
          ParentFont = False
          ReadOnly = True
          TabOrder = 4
          OnExit = dbedt_vl_desp_mnExit
        end
        object dbedt_vl_frete_mn: TDBEdit
          Left = 389
          Top = 108
          Width = 121
          Height = 21
          TabStop = False
          Color = clMenu
          DataField = 'VL_FRETE_MN'
          DataSource = datm_previsao.ds_previsao
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          MaxLength = 20
          ParentFont = False
          ReadOnly = True
          TabOrder = 9
        end
        object dbedt_vl_seguro_mn: TDBEdit
          Left = 139
          Top = 169
          Width = 118
          Height = 21
          TabStop = False
          Color = clMenu
          DataField = 'VL_SEGURO_MN'
          DataSource = datm_previsao.ds_previsao
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          MaxLength = 20
          ParentFont = False
          ReadOnly = True
          TabOrder = 13
        end
        object dbedt_vl_seguro_mneg: TDBEdit
          Left = 139
          Top = 145
          Width = 118
          Height = 21
          DataField = 'VL_SEGURO_MNEG'
          DataSource = datm_previsao.ds_previsao
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          MaxLength = 20
          ParentFont = False
          TabOrder = 12
          OnExit = dbedt_vl_seguro_mnegExit
        end
        object dbedt_cd_moeda_seguro: TDBEdit
          Left = 66
          Top = 145
          Width = 32
          Height = 21
          DataField = 'CD_MOEDA_SEGURO'
          DataSource = datm_previsao.ds_previsao
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 11
          OnExit = dbedt_cd_moeda_seguroExit
          OnKeyDown = msk_cd_unid_negKeyDown
        end
        object dbedt_cd_moeda_frete: TDBEdit
          Left = 66
          Top = 108
          Width = 32
          Height = 21
          DataField = 'CD_MOEDA_FRETE'
          DataSource = datm_previsao.ds_previsao
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 6
          OnExit = dbedt_vl_frete_mnegExit
          OnKeyDown = msk_cd_unid_negKeyDown
        end
        object dbedt_vl_frete_mneg: TDBEdit
          Left = 138
          Top = 108
          Width = 121
          Height = 21
          DataField = 'VL_FRETE_MNEG'
          DataSource = datm_previsao.ds_previsao
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          MaxLength = 20
          ParentFont = False
          TabOrder = 7
          OnExit = dbedt_vl_frete_mnegExit
        end
        object dbedt_vl_desp_mneg: TDBEdit
          Left = 235
          Top = 42
          Width = 121
          Height = 21
          DataField = 'VL_DESP_MNEG'
          DataSource = datm_previsao.ds_previsao
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          MaxLength = 20
          ParentFont = False
          TabOrder = 3
          OnExit = dbedt_vl_desp_mnegExit
        end
        object dbedt_pc_seguro: TDBEdit
          Left = 622
          Top = 177
          Width = 73
          Height = 21
          DataField = 'PC_SEGURO'
          DataSource = datm_previsao.ds_previsao
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          MaxLength = 20
          ParentFont = False
          TabOrder = 15
          OnExit = dbedt_pc_seguroExit
        end
        object dbcheck_embut_frete: TDBCheckBox
          Left = 523
          Top = 110
          Width = 165
          Height = 14
          Caption = 'Frete Embutido nos itens'
          DataField = 'IN_EMBUT_FRT_ITENS'
          DataSource = datm_previsao.ds_previsao
          TabOrder = 10
          ValueChecked = 'True'
          ValueUnchecked = 'False'
          OnExit = dbedt_pc_seguroExit
        end
        object DBCheckBox1: TDBCheckBox
          Left = 19
          Top = 204
          Width = 179
          Height = 15
          Caption = 'Seguro Embutido nos Itens'
          DataField = 'IN_EMBUT_SEG_ITENS'
          DataSource = datm_previsao.ds_previsao
          TabOrder = 16
          ValueChecked = 'True'
          ValueUnchecked = 'False'
          OnExit = dbedt_pc_seguroExit
        end
        object dbchkbox_mesma_moeda: TDBCheckBox
          Left = 19
          Top = 66
          Width = 326
          Height = 18
          Caption = 'Mesma Moeda na Condi'#231#227'o de Venda nas Adi'#231#245'es'
          DataField = 'IN_MOEDA_UNICA'
          DataSource = datm_previsao.ds_previsao
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 5
          ValueChecked = 'True'
          ValueUnchecked = 'False'
          OnClick = dbchkbox_mesma_moedaClick
        end
        object dbedt_vl_frete_terr_nacional1: TDBEdit
          Left = 263
          Top = 109
          Width = 121
          Height = 21
          DataField = 'VL_FRETE_TNAC_MNEG'
          DataSource = datm_previsao.ds_previsao
          MaxLength = 20
          TabOrder = 8
          OnExit = dbedt_pc_seguroExit
        end
        object dbrgrp_seguro: TDBRadioGroup
          Left = 264
          Top = 147
          Width = 353
          Height = 72
          Caption = 'Base Seguro'
          Columns = 2
          DataField = 'CD_BASE_SEGURO'
          DataSource = datm_previsao.ds_previsao
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          Items.Strings = (
            'VMLE'
            'VMLE + Frete'
            'VMLE + Frete + L.E.')
          ParentFont = False
          TabOrder = 14
          Values.Strings = (
            '1'
            '2'
            '4')
          OnClick = dbedt_pc_seguroExit
        end
      end
      object GroupBox2: TGroupBox
        Left = 9
        Top = 144
        Width = 717
        Height = 62
        TabOrder = 0
        object shp7: TShape
          Left = 298
          Top = 13
          Width = 411
          Height = 45
          Brush.Style = bsClear
          Pen.Color = clGray
        end
        object lbl_peso_bruto: TLabel
          Left = 10
          Top = 15
          Width = 89
          Height = 13
          Caption = 'Peso Bruto (kg)'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object lbl_peso_liquido: TLabel
          Left = 147
          Top = 15
          Width = 102
          Height = 13
          Cursor = 1
          Caption = 'Peso L'#237'quido (kg)'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object lbl4: TLabel
          Left = 314
          Top = 17
          Width = 87
          Height = 13
          Caption = 'Acr'#233'scimo (R$)'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object lbl5: TLabel
          Left = 451
          Top = 17
          Width = 80
          Height = 13
          Caption = 'Dedu'#231#227'o (R$)'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object lbl14: TLabel
          Left = 580
          Top = 17
          Width = 74
          Height = 13
          Caption = 'Frete Interno'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object dbedt_peso_bruto: TDBEdit
          Left = 11
          Top = 28
          Width = 122
          Height = 21
          DataField = 'PB_PREVISAO'
          DataSource = datm_previsao.ds_previsao
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          MaxLength = 20
          ParentFont = False
          TabOrder = 0
        end
        object dbedt_peso_liquido: TDBEdit
          Left = 147
          Top = 28
          Width = 122
          Height = 21
          Cursor = 1
          DataField = 'PL_PREVISAO'
          DataSource = datm_previsao.ds_previsao
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          MaxLength = 20
          ParentFont = False
          TabOrder = 1
        end
        object dbedt_vl_acrescimo: TDBEdit
          Left = 314
          Top = 31
          Width = 118
          Height = 21
          DataField = 'VL_ACRESCIMO'
          DataSource = datm_previsao.ds_previsao
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          MaxLength = 17
          ParentFont = False
          TabOrder = 2
          OnChange = dbedt_cd_ncm_sh2Change
          OnEnter = dbedt_quantidade2Enter
          OnExit = dbedt_quantidade2Exit
        end
        object dbedt_vl_deducao: TDBEdit
          Left = 451
          Top = 31
          Width = 116
          Height = 21
          DataField = 'VL_DEDUCAO'
          DataSource = datm_previsao.ds_previsao
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          MaxLength = 17
          ParentFont = False
          TabOrder = 3
          OnChange = dbedt_cd_ncm_sh2Change
          OnEnter = dbedt_quantidade2Enter
          OnExit = dbedt_quantidade2Exit
        end
        object dbedt_vl_frete_interno: TDBEdit
          Left = 581
          Top = 31
          Width = 116
          Height = 21
          DataField = 'VL_FRETE_INTERNO'
          DataSource = datm_previsao.ds_previsao
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          MaxLength = 17
          ParentFont = False
          TabOrder = 4
          OnChange = dbedt_cd_ncm_sh2Change
          OnEnter = dbedt_quantidade2Enter
          OnExit = dbedt_quantidade2Exit
        end
      end
      object GroupBox1: TGroupBox
        Left = 9
        Top = -2
        Width = 717
        Height = 151
        TabOrder = 2
        object lbl_unid_neg: TLabel
          Left = 9
          Top = 18
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
        object btn_co_unid_neg: TSpeedButton
          Left = 203
          Top = 31
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
          OnClick = btn_co_unid_negClick
        end
        object lbl_nr_processo: TLabel
          Left = 236
          Top = 18
          Width = 53
          Height = 13
          Caption = 'Processo'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object btn_co_nr_processo: TSpeedButton
          Left = 343
          Top = 31
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
          OnClick = btn_co_nr_processoClick
        end
        object lbl_importador: TLabel
          Left = 9
          Top = 105
          Width = 65
          Height = 13
          Caption = 'Importador:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object btn_co_importador: TSpeedButton
          Left = 281
          Top = 120
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
          OnClick = btn_co_importadorClick
        end
        object lbl_via_transp: TLabel
          Left = 9
          Top = 63
          Width = 84
          Height = 13
          Caption = 'Via Transporte'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label1: TLabel
          Left = 320
          Top = 62
          Width = 60
          Height = 13
          Caption = 'Data Base'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object lbl_cd_incoterm: TLabel
          Left = 236
          Top = 63
          Width = 66
          Height = 13
          Caption = 'INCOTERM'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label5: TLabel
          Left = 309
          Top = 105
          Width = 32
          Height = 13
          Caption = 'CNPJ'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label12: TLabel
          Left = 456
          Top = 16
          Width = 257
          Height = 17
          Alignment = taCenter
          AutoSize = False
          Caption = 'Volumes'
          Color = clBlack
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWhite
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentColor = False
          ParentFont = False
        end
        object lbl_vinculacao_comp_vend: TLabel
          Left = 455
          Top = 106
          Width = 252
          Height = 13
          Caption = 'Vincula'#231#227'o entre o Comprador e o Vendedor'
        end
        object msk_nr_processo: TMaskEdit
          Left = 236
          Top = 31
          Width = 107
          Height = 21
          CharCase = ecUpperCase
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          MaxLength = 18
          ParentFont = False
          TabOrder = 3
          OnEnter = msk_nr_processoEnter
          OnExit = msk_nr_processoExit
          OnKeyDown = msk_cd_unid_negKeyDown
        end
        object dbedt_nm_importador: TDBEdit
          Left = 57
          Top = 120
          Width = 223
          Height = 21
          TabStop = False
          Color = clMenu
          DataField = 'Look_nm_importador'
          DataSource = datm_previsao.ds_previsao
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          ReadOnly = True
          TabOrder = 8
        end
        object dblkpcbox_via_transp: TDBLookupComboBox
          Left = 9
          Top = 76
          Width = 221
          Height = 21
          DataField = 'CD_VIA_TRANSP'
          DataSource = datm_previsao.ds_previsao
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          KeyField = 'CD_VIA_TRANSP'
          ListField = 'NM_VIA_TRANSP'
          ListSource = datm_previsao.ds_via_transp
          ParentFont = False
          TabOrder = 5
        end
        object edt_nm_unidade: TEdit
          Left = 37
          Top = 31
          Width = 165
          Height = 21
          TabStop = False
          Color = clMenu
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 2
        end
        object msk_cd_unid_neg: TMaskEdit
          Left = 9
          Top = 31
          Width = 29
          Height = 21
          EditMask = '99;0; '
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          MaxLength = 2
          ParentFont = False
          TabOrder = 1
          OnChange = btn_co_unid_negClick
          OnEnter = msk_cd_unid_negEnter
          OnExit = msk_cd_unid_negExit
          OnKeyDown = msk_cd_unid_negKeyDown
        end
        object dbedt_dt_calculo: TDBEdit
          Left = 320
          Top = 75
          Width = 96
          Height = 21
          DataField = 'DT_CALCULO'
          DataSource = datm_previsao.ds_previsao
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 4
          OnExit = dbedt_vl_mle_mnegExit
        end
        object dbedt_cd_incoterm: TDBEdit
          Left = 236
          Top = 76
          Width = 63
          Height = 21
          CharCase = ecUpperCase
          DataField = 'CD_INCOTERM'
          DataSource = datm_previsao.ds_previsao
          TabOrder = 6
        end
        object dbedt_cd_importador: TDBEdit
          Left = 9
          Top = 120
          Width = 49
          Height = 21
          DataField = 'CD_CLIENTE'
          DataSource = datm_previsao.ds_previsao
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 7
          OnChange = btn_co_importadorClick
          OnExit = dbedt_cd_importadorExit
          OnKeyDown = msk_cd_unid_negKeyDown
        end
        object chkProcessos: TCheckBox
          Left = 374
          Top = 27
          Width = 81
          Height = 30
          Caption = #218'ltimos Processos'
          Checked = True
          State = cbChecked
          TabOrder = 0
          WordWrap = True
        end
        object EditCNPJ2: TMaskEdit
          Left = 310
          Top = 120
          Width = 130
          Height = 21
          TabStop = False
          Color = clMenu
          EditMask = '99.999.999/9999-99;0;_'
          MaxLength = 18
          ReadOnly = True
          TabOrder = 9
        end
        object dbg_volumes: TDBGrid
          Left = 456
          Top = 32
          Width = 257
          Height = 73
          Color = clMenu
          DataSource = datm_previsao.ds_di_volumes
          Options = [dgEditing, dgTitles, dgColumnResize, dgColLines, dgRowLines, dgCancelOnExit]
          TabOrder = 10
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -11
          TitleFont.Name = 'MS Sans Serif'
          TitleFont.Style = [fsBold]
          Columns = <
            item
              Expanded = False
              FieldName = 'Look_Embalagem'
              Title.Alignment = taCenter
              Width = 178
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'QT_VOLUME_CARGA'
              Title.Alignment = taCenter
              Title.Caption = 'Qtd.'
              Visible = True
            end>
        end
        object dbcb_vinc_comp_vend: TDBComboBox
          Left = 456
          Top = 120
          Width = 249
          Height = 21
          DataField = 'CD_VINC_IMPO_EXPO'
          DataSource = datm_previsao.ds_previsao
          ItemHeight = 13
          Items.Strings = (
            'Sem Vincula'#231#227'o'
            'Com Vincula'#231#227'o sem Influ'#234'ncia no Pre'#231'o'
            'Com Vincula'#231#227'o e com Influ'#234'ncia no Pre'#231'o')
          TabOrder = 11
          OnChange = dbcb_vinc_comp_vendChange
        end
      end
    end
    object ts_adicoes: TTabSheet
      Caption = '&Adi'#231#245'es'
      object lbl_ncm_sh2: TLabel
        Left = 197
        Top = 15
        Width = 51
        Height = 13
        Caption = 'NCM/SH'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object lbl_quantidade2: TLabel
        Left = 182
        Top = 71
        Width = 66
        Height = 13
        Caption = 'Quantidade'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object btn_co_ncm_sh2: TSpeedButton
        Left = 369
        Top = 11
        Width = 25
        Height = 21
        Flat = True
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
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
        ParentFont = False
        OnClick = btn_co_ncm_sh2Click
      end
      object lbl_vl_mle_mneg_tot2: TLabel
        Left = 457
        Top = 17
        Width = 91
        Height = 13
        Caption = 'Valor da Adi'#231#227'o'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object lbl_nr_processo4: TLabel
        Left = 15
        Top = 15
        Width = 53
        Height = 13
        Caption = 'Processo'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object lbl3: TLabel
        Left = 493
        Top = 44
        Width = 56
        Height = 13
        Caption = 'Peso L'#237'q.'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object btn_co_moeda_mle_adicao: TSpeedButton
        Left = 104
        Top = 40
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
        OnClick = btn_co_moeda_mle_adicaoClick
      end
      object lbl6: TLabel
        Left = 29
        Top = 43
        Width = 39
        Height = 13
        Caption = 'Moeda'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label3: TLabel
        Left = 391
        Top = 70
        Width = 156
        Height = 13
        Caption = 'Quant. na Unid. Estat'#237'stica'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object lbl16: TLabel
        Left = 151
        Top = 43
        Width = 96
        Height = 13
        Caption = 'Unid. Estat'#237'stica'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object lbl_expo_codigo: TLabel
        Left = 9
        Top = 94
        Width = 62
        Height = 13
        Caption = 'Exportador'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object btn_co_exportador: TSpeedButton
        Left = 201
        Top = 108
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
        OnClick = btn_co_exportadorClick
      end
      object lbl_fabr_codigo: TLabel
        Left = 264
        Top = 94
        Width = 61
        Height = 13
        Caption = 'Fabricante'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object btn_co_fabricante: TSpeedButton
        Left = 508
        Top = 108
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
        OnClick = btn_co_fabricanteClick
      end
      object btn_co_pais_aquisicao: TSpeedButton
        Left = 201
        Top = 148
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
        OnClick = btn_co_pais_aquisicaoClick
      end
      object Label6: TLabel
        Left = 10
        Top = 134
        Width = 104
        Height = 13
        Caption = 'Pa'#237's de Aquisi'#231#227'o'
      end
      object Label2: TLabel
        Left = 258
        Top = 167
        Width = 252
        Height = 13
        Caption = 'Vincula'#231#227'o entre o Comprador e o Vendedor'
      end
      object Label7: TLabel
        Left = 14
        Top = 71
        Width = 50
        Height = 13
        Caption = 'Incoterm'
      end
      object btn_co_incoterm: TSpeedButton
        Left = 110
        Top = 67
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
        OnClick = btn_co_incotermClick
      end
      object Label63: TLabel
        Left = 270
        Top = 212
        Width = 33
        Height = 13
        Caption = 'CFOP'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        WordWrap = True
      end
      object btn_co_cd_cfop: TSpeedButton
        Left = 663
        Top = 209
        Width = 25
        Height = 26
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
        OnClick = btn_co_cd_cfopClick
      end
      object Label17: TLabel
        Left = 264
        Top = 132
        Width = 88
        Height = 13
        Caption = 'Pa'#237's de Origem'
      end
      object btn_co_pais_Origem_Fab: TSpeedButton
        Left = 520
        Top = 146
        Width = 21
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
        OnClick = btn_co_pais_Origem_FabClick
      end
      object dbedt_cd_ncm_sh: TDBEdit
        Left = 252
        Top = 11
        Width = 117
        Height = 21
        DataField = 'CD_NCM_SH'
        DataSource = datm_previsao.ds_previsao_adicao
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 3
        OnChange = dbedt_cd_ncm_sh2Change
        OnExit = dbedt_cd_ncm_sh2Exit
        OnKeyDown = msk_cd_unid_negKeyDown
      end
      object dbedt_quantidade: TDBEdit
        Left = 252
        Top = 67
        Width = 117
        Height = 21
        DataField = 'QUANTIDADE'
        DataSource = datm_previsao.ds_previsao_adicao
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        MaxLength = 17
        ParentFont = False
        TabOrder = 5
        OnChange = dbedt_cd_ncm_sh2Change
        OnEnter = dbedt_quantidade2Enter
        OnExit = dbedt_quantidade2Exit
      end
      object dbedt_nr_processo: TDBEdit
        Left = 71
        Top = 11
        Width = 86
        Height = 21
        TabStop = False
        Color = clMenu
        DataField = 'calc_nr_processo'
        DataSource = datm_previsao.ds_previsao
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        MaxLength = 7
        ParentFont = False
        ReadOnly = True
        TabOrder = 0
        OnExit = dbedt_cd_importadorExit
      end
      object dbedt_peso_liq: TDBEdit
        Left = 554
        Top = 40
        Width = 117
        Height = 21
        DataField = 'PL_MERCADORIA'
        DataSource = datm_previsao.ds_previsao_adicao
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 7
        OnChange = dbedt_cd_ncm_sh2Change
      end
      object dbedt_vl_mle_mneg_tot: TDBEdit
        Left = 554
        Top = 13
        Width = 117
        Height = 21
        DataField = 'VL_MLE_MNEG_TOT'
        DataSource = datm_previsao.ds_previsao_adicao
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        MaxLength = 20
        ParentFont = False
        TabOrder = 6
        OnChange = dbedt_cd_ncm_sh2Change
        OnEnter = dbedt_vl_mle_mneg_tot2Enter
        OnExit = dbedt_vl_mle_mneg_totExit
      end
      object dbedt_cd_moeda_mle_adicao: TDBEdit
        Left = 70
        Top = 40
        Width = 33
        Height = 21
        DataField = 'CD_MOEDA_MLE'
        DataSource = datm_previsao.ds_previsao_adicao
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 1
        OnChange = dbedt_cd_ncm_sh2Change
        OnExit = dbedt_cd_moeda_mle_adicaoExit
        OnKeyDown = msk_cd_unid_negKeyDown
      end
      object dbedt_qt_un_est: TDBEdit
        Left = 554
        Top = 67
        Width = 117
        Height = 21
        DataField = 'QT_MERC_UN_ALIQ_ES'
        DataSource = datm_previsao.ds_previsao_adicao
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        MaxLength = 17
        ParentFont = False
        TabOrder = 8
        OnChange = dbedt_cd_ncm_sh2Change
        OnEnter = dbedt_quantidade2Enter
        OnExit = dbedt_quantidade2Exit
      end
      object dbedt_expo_descricao: TEdit
        Left = 57
        Top = 108
        Width = 142
        Height = 21
        TabStop = False
        Color = clMenu
        Ctl3D = True
        ParentCtl3D = False
        ReadOnly = True
        TabOrder = 12
      end
      object dbedt_expo_codigo: TDBEdit
        Left = 9
        Top = 108
        Width = 49
        Height = 21
        DataField = 'CD_EXPORTADOR'
        DataSource = datm_previsao.ds_previsao_adicao
        TabOrder = 11
        OnChange = btn_co_exportadorClick
        OnExit = dbedt_expo_codigoExit
      end
      object dbedt_fabr_descricao: TEdit
        Left = 313
        Top = 108
        Width = 194
        Height = 21
        TabStop = False
        Color = clMenu
        Ctl3D = True
        ParentCtl3D = False
        ReadOnly = True
        TabOrder = 15
      end
      object dbedt_fabr_codigo: TDBEdit
        Left = 264
        Top = 108
        Width = 50
        Height = 21
        DataField = 'CD_FABRICANTE'
        DataSource = datm_previsao.ds_previsao_adicao
        TabOrder = 16
        OnChange = btn_co_fabricanteClick
        OnExit = dbedt_fabr_codigoExit
      end
      object edt6: TEdit
        Left = 252
        Top = 40
        Width = 195
        Height = 21
        TabStop = False
        Color = clBtnFace
        ReadOnly = True
        TabOrder = 4
        Text = 'edt6'
      end
      object dbrgrp_aplicacao: TDBRadioGroup
        Left = 9
        Top = 177
        Width = 216
        Height = 42
        Caption = 'Aplica'#231#227'o'
        Columns = 2
        DataField = 'CD_APLICACAO_MERC'
        DataSource = datm_previsao.ds_previsao_adicao
        Items.Strings = (
          'Consumo'
          'Revenda')
        TabOrder = 10
        Values.Strings = (
          '1'
          '2')
        OnChange = dbrgrp_aplicacaoClick
      end
      object dblkp_vin_comp_vend: TDBLookupComboBox
        Left = 256
        Top = 181
        Width = 313
        Height = 21
        DataField = 'CD_VINC_IMPO_EXPO'
        DataSource = datm_previsao.ds_previsao_adicao
        KeyField = 'CD_VINC_EXPO_IMPO'
        ListField = 'DESCRICAO'
        ListSource = datm_previsao.ds_tp_vinc_expo_impo
        TabOrder = 9
        OnClick = dbrgrp_aplicacaoClick
      end
      object dbedt_cd_incoterm_ad: TDBEdit
        Left = 69
        Top = 67
        Width = 40
        Height = 21
        CharCase = ecUpperCase
        DataField = 'CD_INCOTERMS_VENDA'
        DataSource = datm_previsao.ds_previsao_adicao
        TabOrder = 2
        OnChange = dbedt_cd_incoterm_adChange
      end
      object pgctrl_Tributos: TPageControl
        Left = 0
        Top = 226
        Width = 734
        Height = 209
        ActivePage = tbsPisCofins
        Align = alBottom
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 17
        OnChange = pgctrl_TributosChange
        object tbsII: TTabSheet
          Caption = 'I.I.'
          object lbl_cd_regime_trib_ii2: TLabel
            Left = 63
            Top = 11
            Width = 40
            Height = 13
            Caption = 'C'#243'digo'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object btn_co_reg_trib_ii2: TSpeedButton
            Left = 294
            Top = 7
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
            OnClick = btn_co_reg_trib_ii2Click
          end
          object btn_co_Fund_legal: TSpeedButton
            Left = 294
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
            OnClick = btn_co_Fund_legalClick
          end
          object Label27: TLabel
            Left = 38
            Top = 35
            Width = 64
            Height = 13
            Caption = 'Fund.Legal'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object lbl_pc_aliq_ii2: TLabel
            Left = 13
            Top = 84
            Width = 90
            Height = 13
            Caption = 'Ad. Valorem (%)'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object lbl7: TLabel
            Left = 7
            Top = 133
            Width = 62
            Height = 13
            Caption = 'Acordo (%)'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Label4: TLabel
            Left = 350
            Top = 11
            Width = 105
            Height = 13
            Caption = 'Base de C'#225'lculo II'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object lbl_vl_ii2: TLabel
            Left = 350
            Top = 36
            Width = 96
            Height = 13
            Caption = 'Valor a Recolher'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object lbl_pc_reducao_ipt_bli2: TLabel
            Left = 336
            Top = 77
            Width = 84
            Height = 26
            Caption = 'Percentual de Redu'#231#227'o (%)'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
            WordWrap = True
          end
          object lbl_pc_reduzida_ii2: TLabel
            Left = 181
            Top = 84
            Width = 75
            Height = 13
            Caption = 'Reduzida (%)'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Label28: TLabel
            Left = 7
            Top = 109
            Width = 88
            Height = 13
            Caption = 'Tipo do Acordo'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Label93: TLabel
            Left = 37
            Top = 60
            Width = 41
            Height = 13
            Caption = 'Meses:'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Label29: TLabel
            Left = 223
            Top = 109
            Width = 81
            Height = 13
            Caption = 'Acordo ALADI'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object dbedt_cd_reg_trib_ii: TDBEdit
            Left = 113
            Top = 7
            Width = 28
            Height = 21
            DataField = 'CD_REG_TRIB_II'
            DataSource = datm_previsao.ds_previsao_adicao
            TabOrder = 0
            OnChange = dbedt_cd_fund_legalChange
            OnExit = dbedt_cd_reg_trib_ii2Exit
            OnKeyDown = msk_cd_unid_negKeyDown
          end
          object dbedt_desc_reg_trib: TDBEdit
            Left = 141
            Top = 7
            Width = 152
            Height = 21
            TabStop = False
            Color = clMenu
            Ctl3D = True
            DataField = 'Look_Reg_Trib_II'
            DataSource = datm_previsao.ds_previsao_adicao
            ParentCtl3D = False
            ReadOnly = True
            TabOrder = 1
          end
          object dbedt_desc_fund_leg: TDBEdit
            Left = 141
            Top = 32
            Width = 152
            Height = 21
            TabStop = False
            Color = clMenu
            Ctl3D = True
            DataField = 'Descricao'
            DataSource = datm_previsao.ds_fund_leg
            ParentCtl3D = False
            ReadOnly = True
            TabOrder = 3
          end
          object dbedt_cd_fund_legal: TDBEdit
            Left = 113
            Top = 32
            Width = 28
            Height = 21
            DataField = 'CD_FUND_LEG_REGIME'
            DataSource = datm_previsao.ds_previsao_adicao
            TabOrder = 2
            OnChange = dbedt_cd_fund_legalChange
            OnExit = dbedt_cd_fund_legalExit
            OnKeyDown = msk_cd_unid_negKeyDown
          end
          object dbedt_pc_aliq_ii: TDBEdit
            Left = 113
            Top = 80
            Width = 50
            Height = 21
            DataField = 'PC_ALIQ_II'
            DataSource = datm_previsao.ds_previsao_adicao
            MaxLength = 10
            TabOrder = 8
            OnChange = dbedt_cd_ncm_sh2Change
          end
          object dbedt_aliq_acordo: TDBEdit
            Left = 113
            Top = 129
            Width = 50
            Height = 21
            DataField = 'PC_ALIQ_ACORDO'
            DataSource = datm_previsao.ds_previsao_adicao
            TabOrder = 13
            OnChange = dbedt_cd_ncm_shChange
          end
          object DBEdit1: TDBEdit
            Left = 457
            Top = 7
            Width = 205
            Height = 21
            TabStop = False
            Color = clMenu
            DataField = 'VL_BASE_CALC_II'
            DataSource = datm_previsao.ds_previsao_adicao
            Enabled = False
            MaxLength = 10
            ReadOnly = True
            TabOrder = 4
            OnChange = dbedt_cd_ncm_sh2Change
          end
          object dbedt_vl_ii: TDBEdit
            Left = 457
            Top = 32
            Width = 205
            Height = 21
            TabStop = False
            Color = clMenu
            DataField = 'VL_II'
            DataSource = datm_previsao.ds_previsao_adicao
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlue
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            MaxLength = 20
            ParentFont = False
            ReadOnly = True
            TabOrder = 5
          end
          object dbedt_pc_reduzida_ii: TDBEdit
            Left = 268
            Top = 80
            Width = 50
            Height = 21
            DataField = 'PC_ALIQ_REDUZIDA_II'
            DataSource = datm_previsao.ds_previsao_adicao
            MaxLength = 10
            TabOrder = 9
            OnChange = dbedt_cd_ncm_sh2Change
            OnExit = dbedt_pc_reduzida_iiExit
          end
          object dbedt_pc_reducao_ipt_bli: TDBEdit
            Left = 428
            Top = 80
            Width = 50
            Height = 21
            DataField = 'PC_REDUCAO_IPT_BLI'
            DataSource = datm_previsao.ds_previsao_adicao
            MaxLength = 10
            TabOrder = 10
            OnChange = dbedt_cd_ncm_sh2Change
          end
          object dblkcbox_acordo_tarif: TDBLookupComboBox
            Left = 113
            Top = 105
            Width = 97
            Height = 21
            DataField = 'CD_TIPO_ACORDO_TAR'
            DataSource = datm_previsao.ds_previsao_adicao
            KeyField = 'CD_TIPO_ACORDO_TAR'
            ListField = 'DESCRICAO'
            ListSource = datm_previsao.ds_acordo_tarif
            TabOrder = 11
            OnClick = dbedt_cd_ncm_shChange
          end
          object dbedt_QT_MESES_ADM_TEMP: TDBEdit
            Left = 113
            Top = 56
            Width = 58
            Height = 21
            DataField = 'QT_MESES_ADM_TEMP'
            DataSource = datm_previsao.ds_previsao_adicao
            TabOrder = 6
          end
          object dbchk_IN_SUSPENDE_II_RETIFIC: TDBCheckBox
            Left = 188
            Top = 57
            Width = 147
            Height = 17
            Caption = 'Suspender retifica'#231#227'o'
            DataField = 'IN_SUSPENDE_II_RETIFIC'
            DataSource = datm_previsao.ds_previsao_adicao
            TabOrder = 7
            ValueChecked = 'True'
            ValueUnchecked = 'False'
          end
          object dbedt_cd_acordo_aladi: TDBEdit
            Left = 312
            Top = 105
            Width = 41
            Height = 21
            DataField = 'CD_ACORDO_ALADI'
            DataSource = datm_previsao.ds_previsao_adicao
            TabOrder = 12
          end
        end
        object tbsIPI: TTabSheet
          Caption = 'I.P.I.'
          ImageIndex = 1
          object lbl_pc_aliq_ipi2: TLabel
            Left = 178
            Top = 32
            Width = 90
            Height = 13
            Caption = 'Ad. Valorem (%)'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object lbl_pc_aliq_reduzida_ipi2: TLabel
            Left = 193
            Top = 60
            Width = 75
            Height = 13
            Caption = 'Reduzida (%)'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object lbl_vl_ipi2: TLabel
            Left = 172
            Top = 85
            Width = 96
            Height = 13
            Caption = 'Valor a Recolher'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object dbchk_ipi_nao_tributavel: TDBCheckBox
            Left = 10
            Top = 5
            Width = 137
            Height = 17
            Caption = 'I.P.I. n'#227'o tribut'#225'vel'
            DataField = 'IN_IPI_NAO_TRIBUT'
            DataSource = datm_previsao.ds_previsao_adicao
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
            TabOrder = 0
            ValueChecked = 'True'
            ValueUnchecked = 'False'
            OnClick = dbchk_ipi_nao_tributavelClick
          end
          object dbrgrp_reg_tributacao_ipi: TDBRadioGroup
            Left = 10
            Top = 28
            Width = 156
            Height = 76
            Caption = 'Regime de Tributa'#231#227'o'
            Color = clBtnFace
            DataField = 'CD_REG_TRIB_IPI'
            DataSource = datm_previsao.ds_previsao_adicao
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            Items.Strings = (
              'Recolhimento Integral'
              'Suspens'#227'o'
              'Redu'#231#227'o'
              'Isen'#231#227'o')
            ParentColor = False
            ParentFont = False
            TabOrder = 1
            Values.Strings = (
              '4'
              '5'
              '2'
              '1')
            OnChange = dbedt_cd_ncm_sh2Change
          end
          object dbedt_pc_aliq_ipi: TDBEdit
            Left = 272
            Top = 29
            Width = 50
            Height = 21
            DataField = 'PC_ALIQ_IPI'
            DataSource = datm_previsao.ds_previsao_adicao
            MaxLength = 10
            TabOrder = 3
            OnChange = dbedt_cd_ncm_sh2Change
          end
          object dbedt_pc_aliq_reduzida_ipi: TDBEdit
            Left = 272
            Top = 55
            Width = 50
            Height = 21
            DataField = 'PC_ALIQ_REDUZIDA_IPI'
            DataSource = datm_previsao.ds_previsao_adicao
            MaxLength = 10
            TabOrder = 4
            OnChange = dbedt_cd_ncm_sh2Change
          end
          object dbedt_vl_ipi: TDBEdit
            Left = 272
            Top = 81
            Width = 101
            Height = 21
            TabStop = False
            Color = clMenu
            DataField = 'VL_IPI'
            DataSource = datm_previsao.ds_previsao_adicao
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlue
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            MaxLength = 20
            ParentFont = False
            ReadOnly = True
            TabOrder = 5
          end
          object dbchk_IN_SUSPENDE_IPI_RETIFIC: TDBCheckBox
            Left = 12
            Top = 113
            Width = 147
            Height = 17
            Caption = 'Suspender retifica'#231#227'o'
            DataField = 'IN_SUSPENDE_IPI_RETIFIC'
            DataSource = datm_previsao.ds_previsao_adicao
            TabOrder = 2
            ValueChecked = 'True'
            ValueUnchecked = 'False'
          end
        end
        object tbsICMS: TTabSheet
          Caption = 'I.C.M.S.'
          ImageIndex = 2
          DesignSize = (
            726
            181)
          object lbl15: TLabel
            Left = 12
            Top = 5
            Width = 96
            Height = 13
            Caption = 'Tributa'#231#227'o ICMS'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object btn_co_trib_icms: TSpeedButton
            Left = 330
            Top = 18
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
            OnClick = btn_co_trib_icmsClick
          end
          object lbl_pc_aliq_icms2: TLabel
            Left = 12
            Top = 45
            Width = 49
            Height = 13
            Caption = 'Al'#237'quota'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object lbl_pc_aliq_icms_red2: TLabel
            Left = 69
            Top = 45
            Width = 65
            Height = 13
            Caption = '% Redu'#231#227'o'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object lbl_vl_icms2: TLabel
            Left = 140
            Top = 45
            Width = 96
            Height = 13
            Caption = 'Valor a Recolher'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object btn_co_disp_legal: TSpeedButton
            Left = 453
            Top = 100
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
            OnClick = btn_co_disp_legalClick
          end
          object lbl_fund: TLabel
            Left = 12
            Top = 86
            Width = 98
            Height = 13
            Caption = 'Dispositivo Legal'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object lblICMS_AFRMM: TLabel
            Left = 262
            Top = 45
            Width = 90
            Height = 13
            Caption = 'ICMS + AFRMM'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object dbedt_cd_tributacao_icms: TDBEdit
            Left = 12
            Top = 18
            Width = 32
            Height = 21
            DataField = 'CD_TRIBUTACAO_ICMS'
            DataSource = datm_previsao.ds_previsao_adicao
            TabOrder = 0
            OnChange = btn_co_trib_icmsClick
            OnExit = dbedt_cd_tributacao_icmsExit
            OnKeyDown = msk_cd_unid_negKeyDown
          end
          object dbedt_nm_tributacao_icms: TEdit
            Left = 45
            Top = 18
            Width = 284
            Height = 21
            TabStop = False
            Color = clMenu
            ReadOnly = True
            TabOrder = 1
          end
          object dbedt_pc_aliq_icms: TDBEdit
            Left = 12
            Top = 58
            Width = 51
            Height = 21
            DataField = 'PC_ALIQ_ICMS'
            DataSource = datm_previsao.ds_previsao_adicao
            MaxLength = 10
            TabOrder = 2
            OnChange = dbedt_cd_ncm_sh2Change
          end
          object dbedt_pc_aliq_icms_red: TDBEdit
            Left = 69
            Top = 58
            Width = 53
            Height = 21
            DataField = 'PC_ALIQ_ICMS_RED'
            DataSource = datm_previsao.ds_previsao_adicao
            MaxLength = 10
            TabOrder = 3
            OnChange = dbedt_cd_ncm_sh2Change
          end
          object dbedt_vl_icms: TDBEdit
            Left = 140
            Top = 58
            Width = 117
            Height = 21
            TabStop = False
            Color = clMenu
            DataField = 'VL_ICMS'
            DataSource = datm_previsao.ds_previsao_adicao
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlue
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            MaxLength = 20
            ParentFont = False
            ReadOnly = True
            TabOrder = 4
          end
          object dbedt_nm_disp_legal: TEdit
            Left = 48
            Top = 100
            Width = 404
            Height = 21
            TabStop = False
            Color = clMenu
            ReadOnly = True
            TabOrder = 6
          end
          object dbedt_cd_disp_legal: TDBEdit
            Left = 12
            Top = 100
            Width = 31
            Height = 21
            DataField = 'CD_FUND_LEGAL_ICMS'
            DataSource = datm_previsao.ds_previsao_adicao
            TabOrder = 5
            OnChange = btn_co_disp_legalClick
            OnExit = dbedt_cd_disp_legalExit
            OnKeyDown = msk_cd_unid_negKeyDown
          end
          object pnlICMS_Fundo_Pobreza: TPanel
            Left = 392
            Top = 46
            Width = 329
            Height = 45
            Anchors = [akLeft, akTop, akRight]
            BevelInner = bvRaised
            BevelOuter = bvLowered
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
            TabOrder = 7
            object Label67: TLabel
              Left = 200
              Top = 5
              Width = 104
              Height = 13
              Caption = 'Fundo de Pobreza'
            end
            object dbchk_IN_FUNDO_POBREZA: TDBCheckBox
              Left = 12
              Top = 15
              Width = 168
              Height = 17
              Caption = 'Utilizar Fundo de Pobreza'
              DataField = 'IN_FUNDO_POBREZA'
              DataSource = datm_previsao.ds_previsao_adicao
              TabOrder = 0
              ValueChecked = '1'
              ValueUnchecked = '0'
              OnClick = dbchk_IN_FUNDO_POBREZAClick
            end
            object edtICMS_Fundo_Pobreza: TEdit
              Left = 200
              Top = 17
              Width = 121
              Height = 21
              ReadOnly = True
              TabOrder = 1
              Text = '0,00'
            end
          end
          object dbedtICMS_AFRMM: TDBEdit
            Left = 262
            Top = 58
            Width = 117
            Height = 21
            TabStop = False
            Color = clMenu
            DataField = 'VL_ICMS_A_RECOLHER_AFRMM'
            DataSource = datm_previsao.ds_previsao_adicao
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlue
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            MaxLength = 20
            ParentFont = False
            ReadOnly = True
            TabOrder = 8
          end
        end
        object tbsAntiDumping: TTabSheet
          Caption = 'Antidumping'
          ImageIndex = 4
          object Bevel7: TBevel
            Left = 72
            Top = 6
            Width = 585
            Height = 169
            Shape = bsFrame
            Style = bsRaised
          end
          object Label53: TLabel
            Left = 334
            Top = 1
            Width = 63
            Height = 13
            Caption = ' Al'#237'quotas '
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object GroupBox9: TGroupBox
            Left = 77
            Top = 19
            Width = 281
            Height = 153
            Caption = ' Ad Valorem '
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
            TabOrder = 0
            object Label54: TLabel
              Left = 32
              Top = 40
              Width = 90
              Height = 13
              Caption = 'Ad. Valorem (%)'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object Label55: TLabel
              Left = 24
              Top = 80
              Width = 97
              Height = 33
              AutoSize = False
              Caption = 'Base de C'#228'lculo Ad Valorem'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
              WordWrap = True
            end
            object dbedt_vl_ad_valorem: TDBEdit
              Left = 128
              Top = 36
              Width = 50
              Height = 21
              DataField = 'PC_NORMAL_ANTIDUMPING'
              DataSource = datm_previsao.ds_previsao_adicao
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
              TabOrder = 0
            end
            object dbedt_vl_base_calc_advalorem: TDBEdit
              Left = 128
              Top = 84
              Width = 129
              Height = 21
              DataField = 'VL_BASE_CALC_ANTIDUMPING'
              DataSource = datm_previsao.ds_previsao_adicao
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
              TabOrder = 1
            end
          end
          object GroupBox10: TGroupBox
            Left = 373
            Top = 19
            Width = 281
            Height = 153
            Caption = ' Espec'#237'fica '
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
            TabOrder = 1
            object Label57: TLabel
              Left = 94
              Top = 40
              Width = 30
              Height = 13
              Caption = 'Valor'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object Label58: TLabel
              Left = 13
              Top = 72
              Width = 111
              Height = 13
              Caption = 'Unidade de Medida'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object Label59: TLabel
              Left = 16
              Top = 104
              Width = 108
              Height = 13
              Caption = 'Quant. na Unidade'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object dbedt_vl_aliq_espec: TDBEdit
              Left = 128
              Top = 36
              Width = 97
              Height = 21
              DataField = 'PC_ESPEC_ANTIDUMPING'
              DataSource = datm_previsao.ds_previsao_adicao
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
              TabOrder = 0
            end
            object dbedt_desc_unid_aliq_espec: TDBEdit
              Left = 128
              Top = 68
              Width = 145
              Height = 21
              DataField = 'NM_UNID_ESPEC_ANTIDUMPING'
              DataSource = datm_previsao.ds_previsao_adicao
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
              TabOrder = 1
            end
            object dbedt_qt_unid_aliq_espec: TDBEdit
              Left = 128
              Top = 100
              Width = 73
              Height = 21
              DataField = 'QT_UNID_ESPEC_ANTIDUMPING'
              DataSource = datm_previsao.ds_previsao_adicao
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
              TabOrder = 2
            end
          end
        end
        object tbsPisCofins: TTabSheet
          Caption = 'PIS/COFINS'
          ImageIndex = 3
          object Bevel2: TBevel
            Left = 592
            Top = 30
            Width = 129
            Height = 149
            Shape = bsFrame
          end
          object Shape3: TShape
            Left = 592
            Top = 8
            Width = 128
            Height = 20
            Brush.Style = bsClear
            Pen.Color = clGray
          end
          object Bevel1: TBevel
            Left = 346
            Top = 30
            Width = 241
            Height = 150
            Shape = bsFrame
          end
          object lbl11: TLabel
            Left = 600
            Top = 45
            Width = 21
            Height = 13
            Caption = 'PIS'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object lbl13: TLabel
            Left = 652
            Top = 139
            Width = 10
            Height = 13
            Caption = '%'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object lbl12: TLabel
            Left = 600
            Top = 84
            Width = 46
            Height = 13
            Caption = 'COFINS'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Shape1: TShape
            Left = 3
            Top = 8
            Width = 336
            Height = 20
            Brush.Style = bsClear
            Pen.Color = clGray
          end
          object Label8: TLabel
            Left = 11
            Top = 11
            Width = 55
            Height = 13
            Caption = 'Al'#237'quotas'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Label9: TLabel
            Left = 354
            Top = 133
            Width = 68
            Height = 13
            Caption = 'Fund. Legal'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object SpeedButton3: TSpeedButton
            Left = 553
            Top = 147
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
            OnClick = SpeedButton3Click
          end
          object Shape2: TShape
            Left = 346
            Top = 8
            Width = 240
            Height = 20
            Brush.Style = bsClear
            Pen.Color = clGray
          end
          object Label10: TLabel
            Left = 353
            Top = 11
            Width = 126
            Height = 13
            Caption = 'Regime de Tributa'#231#227'o'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Label11: TLabel
            Left = 599
            Top = 11
            Width = 49
            Height = 13
            Caption = 'C'#225'lculos'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object lbl10: TLabel
            Left = 600
            Top = 123
            Width = 84
            Height = 13
            Caption = 'Redu'#231#227'o Base'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object dbedt4: TDBEdit
            Left = 600
            Top = 57
            Width = 114
            Height = 21
            Color = clMenu
            DataField = 'VL_PIS'
            DataSource = datm_previsao.ds_previsao_adicao
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlue
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            MaxLength = 10
            ParentFont = False
            ReadOnly = True
            TabOrder = 5
            OnChange = dbedt_cd_ncm_sh2Change
          end
          object dbedt5: TDBEdit
            Left = 600
            Top = 96
            Width = 114
            Height = 21
            Color = clMenu
            DataField = 'VL_COFINS'
            DataSource = datm_previsao.ds_previsao_adicao
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlue
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            MaxLength = 10
            ParentFont = False
            ReadOnly = True
            TabOrder = 6
            OnChange = dbedt_cd_ncm_sh2Change
          end
          object dbrdgr_reg_trib_pis_cofins: TDBRadioGroup
            Left = 354
            Top = 36
            Width = 225
            Height = 68
            Color = clBtnFace
            Columns = 2
            DataField = 'CD_TIPO_BENEF_PIS_COFINS'
            DataSource = datm_previsao.ds_previsao_adicao
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            Items.Strings = (
              'Integral'
              'Redu'#231#227'o'
              'Isen'#231#227'o'
              'Suspens'#227'o'
              'N'#227'o Incid'#234'ncia')
            ParentColor = False
            ParentFont = False
            TabOrder = 1
            Values.Strings = (
              '1'
              '3'
              '2'
              '4'
              '5')
            OnChange = dbrdgr_reg_trib_pis_cofinsChange
          end
          object dbedtFundLegalPisCofins: TDBEdit
            Left = 354
            Top = 147
            Width = 29
            Height = 21
            DataField = 'CD_FUND_LEGAL_PISCOFINS'
            DataSource = datm_previsao.ds_previsao_adicao
            TabOrder = 3
            OnChange = dbedtFundLegalPisCofinsChange
            OnExit = dbedtFundLegalPisCofinsExit
          end
          object edtFundLegalPisCofins: TEdit
            Left = 382
            Top = 147
            Width = 169
            Height = 21
            TabStop = False
            Color = clMenu
            Ctl3D = True
            ParentCtl3D = False
            ReadOnly = True
            TabOrder = 4
          end
          object pgcAliquotas_PIS_COFINS: TPageControl
            Left = 0
            Top = 30
            Width = 340
            Height = 151
            ActivePage = tbsAliquota_PIS
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            MultiLine = True
            ParentFont = False
            TabOrder = 0
            TabPosition = tpLeft
            object tbsAliquota_PIS: TTabSheet
              Caption = 'PIS'
              object GroupBox3: TGroupBox
                Left = 8
                Top = 0
                Width = 97
                Height = 142
                Caption = 'Ad Valorem'
                TabOrder = 0
                object Label24: TLabel
                  Left = 13
                  Top = 21
                  Width = 49
                  Height = 13
                  Caption = 'Al'#237'quota'
                  FocusControl = dbedt_aliq_pis
                end
                object Label19: TLabel
                  Left = 13
                  Top = 61
                  Width = 54
                  Height = 13
                  Caption = 'Reduzida'
                  FocusControl = dbedt_aliq_pis_reduzida
                end
                object dbedt_aliq_pis: TDBEdit
                  Left = 14
                  Top = 36
                  Width = 75
                  Height = 21
                  DataField = 'ALIQ_PIS'
                  DataSource = datm_previsao.ds_previsao_adicao
                  TabOrder = 0
                  OnEnter = dbedt_aliq_pisEnter
                  OnExit = dbedt_aliq_pisExit
                end
                object dbedt_aliq_pis_reduzida: TDBEdit
                  Left = 14
                  Top = 76
                  Width = 75
                  Height = 21
                  DataField = 'ALIQ_PIS_REDUZIDA'
                  DataSource = datm_previsao.ds_previsao_adicao
                  TabOrder = 1
                  OnEnter = dbedt_aliq_pisEnter
                  OnExit = dbedt_aliq_pisExit
                end
              end
              object GroupBox4: TGroupBox
                Left = 109
                Top = 0
                Width = 202
                Height = 142
                Caption = 'Espec'#237'fica'
                TabOrder = 1
                object Label83: TLabel
                  Left = 11
                  Top = 18
                  Width = 49
                  Height = 13
                  Caption = 'Al'#237'quota'
                end
                object Label88: TLabel
                  Left = 11
                  Top = 58
                  Width = 135
                  Height = 13
                  Caption = 'Quantidade na Unidade'
                end
                object Label89: TLabel
                  Left = 11
                  Top = 100
                  Width = 111
                  Height = 13
                  Caption = 'Unidade de Medida'
                end
                object btnUnidadeMedidaPIS: TSpeedButton
                  Left = 169
                  Top = 115
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
                  OnClick = btnUnidadeMedidaPISClick
                end
                object dbedt_VL_ALIQUOTA_ESPECIFICA_PIS: TDBEdit
                  Left = 12
                  Top = 33
                  Width = 93
                  Height = 21
                  DataField = 'VL_ALIQUOTA_ESPECIFICA_PIS'
                  DataSource = datm_previsao.ds_previsao_adicao
                  TabOrder = 0
                  OnExit = dbedt_VL_ALIQUOTA_ESPECIFICA_PISExit
                end
                object dbedt_QTD_UNID_ESPECIFICA_PIS: TDBEdit
                  Left = 12
                  Top = 73
                  Width = 98
                  Height = 21
                  DataField = 'QTD_UNID_ESPECIFICA_PIS'
                  DataSource = datm_previsao.ds_previsao_adicao
                  TabOrder = 1
                  OnExit = dbedt_QTD_UNID_ESPECIFICA_PISExit
                end
                object dbedt_CD_UNIDADE_MEDIDA_PIS: TDBEdit
                  Left = 12
                  Top = 115
                  Width = 37
                  Height = 21
                  DataField = 'CD_UNIDADE_MEDIDA_PIS'
                  DataSource = datm_previsao.ds_previsao_adicao
                  TabOrder = 2
                  OnChange = dbedt_CD_UNIDADE_MEDIDA_PISChange
                  OnExit = dbedt_CD_UNIDADE_MEDIDA_PISExit
                  OnKeyPress = dbedt_CD_UNIDADE_MEDIDA_PISKeyPress
                end
                object edtUnidadeMedidaPIS: TEdit
                  Left = 50
                  Top = 115
                  Width = 117
                  Height = 21
                  TabStop = False
                  Color = clMenu
                  ReadOnly = True
                  TabOrder = 3
                end
              end
            end
            object tbsAliquota_COFINS: TTabSheet
              Caption = 'COFINS'
              ImageIndex = 1
              object GroupBox5: TGroupBox
                Left = 8
                Top = 0
                Width = 97
                Height = 142
                Caption = 'Ad Valorem'
                TabOrder = 0
                object Label13: TLabel
                  Left = 13
                  Top = 21
                  Width = 49
                  Height = 13
                  Caption = 'Al'#237'quota'
                  FocusControl = dbedt_aliq_cofins
                end
                object Label20: TLabel
                  Left = 13
                  Top = 61
                  Width = 54
                  Height = 13
                  Caption = 'Reduzida'
                  FocusControl = dbedt_aliq_cofins_reduzida
                end
                object dbedt_aliq_cofins: TDBEdit
                  Left = 14
                  Top = 36
                  Width = 75
                  Height = 21
                  DataField = 'ALIQ_COFINS'
                  DataSource = datm_previsao.ds_previsao_adicao
                  TabOrder = 0
                  OnEnter = dbedt_aliq_cofinsEnter
                  OnExit = dbedt_aliq_cofinsExit
                end
                object dbedt_aliq_cofins_reduzida: TDBEdit
                  Left = 14
                  Top = 76
                  Width = 75
                  Height = 21
                  DataField = 'ALIQ_COFINS_REDUZIDA'
                  DataSource = datm_previsao.ds_previsao_adicao
                  TabOrder = 1
                  OnEnter = dbedt_aliq_pisEnter
                  OnExit = dbedt_aliq_pisExit
                end
              end
              object GroupBox6: TGroupBox
                Left = 109
                Top = 0
                Width = 202
                Height = 142
                Caption = 'Espec'#237'fica'
                TabOrder = 1
                object Label14: TLabel
                  Left = 11
                  Top = 18
                  Width = 49
                  Height = 13
                  Caption = 'Al'#237'quota'
                end
                object Label15: TLabel
                  Left = 11
                  Top = 58
                  Width = 135
                  Height = 13
                  Caption = 'Quantidade na Unidade'
                end
                object Label16: TLabel
                  Left = 11
                  Top = 100
                  Width = 111
                  Height = 13
                  Caption = 'Unidade de Medida'
                end
                object btnUnidadeMedidaCOFINS: TSpeedButton
                  Left = 169
                  Top = 115
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
                  OnClick = btnUnidadeMedidaCOFINSClick
                end
                object dbedt_VL_ALIQUOTA_ESPECIFICA_COFINS: TDBEdit
                  Left = 12
                  Top = 33
                  Width = 93
                  Height = 21
                  DataField = 'VL_ALIQUOTA_ESPECIFICA_COFINS'
                  DataSource = datm_previsao.ds_previsao_adicao
                  TabOrder = 0
                  OnExit = dbedt_VL_ALIQUOTA_ESPECIFICA_COFINSExit
                end
                object dbedt_QTD_UNID_ESPECIFICA_COFINS: TDBEdit
                  Left = 12
                  Top = 73
                  Width = 98
                  Height = 21
                  DataField = 'QTD_UNID_ESPECIFICA_COFINS'
                  DataSource = datm_previsao.ds_previsao_adicao
                  TabOrder = 1
                  OnExit = dbedt_QTD_UNID_ESPECIFICA_COFINSExit
                end
                object dbedt_CD_UNIDADE_MEDIDA_COFINS: TDBEdit
                  Left = 12
                  Top = 115
                  Width = 37
                  Height = 21
                  DataField = 'CD_UNIDADE_MEDIDA_COFINS'
                  DataSource = datm_previsao.ds_previsao_adicao
                  TabOrder = 2
                  OnChange = dbedt_CD_UNIDADE_MEDIDA_COFINSChange
                  OnExit = dbedt_CD_UNIDADE_MEDIDA_PISExit
                  OnKeyPress = dbedt_CD_UNIDADE_MEDIDA_PISKeyPress
                end
                object edtUnidadeMedidaCOFINS: TEdit
                  Left = 50
                  Top = 115
                  Width = 117
                  Height = 21
                  TabStop = False
                  Color = clMenu
                  ReadOnly = True
                  TabOrder = 3
                end
              end
            end
          end
          object dbedt3: TDBEdit
            Left = 600
            Top = 135
            Width = 48
            Height = 21
            DataField = 'PC_REDUCAO_PIS_COFINS'
            DataSource = datm_previsao.ds_previsao_adicao
            MaxLength = 10
            TabOrder = 7
            OnChange = dbedt_cd_ncm_sh2Change
          end
          object dbchk_IN_SUSPENDE_PIS_COFINS_RETIFIC: TDBCheckBox
            Left = 355
            Top = 109
            Width = 147
            Height = 17
            Caption = 'Suspender retifica'#231#227'o'
            DataField = 'IN_SUSPENDE_PIS_COFINS_RETIFIC'
            DataSource = datm_previsao.ds_previsao_adicao
            TabOrder = 2
            ValueChecked = 'True'
            ValueUnchecked = 'False'
          end
        end
      end
      object dbedt_pais_aquisicao: TEdit
        Left = 57
        Top = 148
        Width = 142
        Height = 21
        TabStop = False
        Color = clMenu
        TabOrder = 14
      end
      object dbedt_paisaquisicao_codigo: TDBEdit
        Left = 9
        Top = 148
        Width = 49
        Height = 21
        DataField = 'CD_PAIS_AQUISICAO'
        DataSource = datm_previsao.ds_previsao_adicao
        TabOrder = 13
        OnChange = btn_co_pais_aquisicaoClick
        OnExit = dbedt_paisaquisicao_codigoExit
      end
      object dbedtCFOP: TDBEdit
        Left = 308
        Top = 212
        Width = 51
        Height = 21
        DataField = 'CD_CFOP'
        DataSource = datm_previsao.ds_previsao_adicao
        TabOrder = 18
        OnChange = dbedtCFOPChange
      end
      object edtCFOP: TEdit
        Left = 363
        Top = 212
        Width = 300
        Height = 21
        Color = clMenu
        ReadOnly = True
        TabOrder = 19
      end
      object dbedt_paisaquisicao_Fab_codigo: TDBEdit
        Left = 261
        Top = 146
        Width = 52
        Height = 21
        DataField = 'CD_PAIS_FABRICANTE'
        DataSource = datm_previsao.ds_previsao_adicao
        TabOrder = 20
        OnChange = btn_co_pais_Origem_FabClick
        OnExit = dbedt_paisaquisicao_Fab_codigoExit
      end
      object dbedt_pais_aquisicao_Fab: TEdit
        Left = 322
        Top = 146
        Width = 185
        Height = 21
        TabStop = False
        Color = clMenu
        TabOrder = 21
      end
    end
    object ts_despesas: TTabSheet
      Caption = '&Despesas'
      object shp6: TShape
        Left = 12
        Top = 11
        Width = 710
        Height = 52
        Brush.Style = bsClear
        Pen.Color = clGray
      end
      object lbl_nr_processo3: TLabel
        Left = 22
        Top = 19
        Width = 53
        Height = 13
        Caption = 'Processo'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object dbg_prev_despesa: TDBGrid
        Left = 12
        Top = 64
        Width = 711
        Height = 304
        DataSource = datm_previsao.ds_previsao_despesa
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
        ParentFont = False
        ReadOnly = True
        TabOrder = 1
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWhite
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = [fsBold]
        Columns = <
          item
            Alignment = taCenter
            Expanded = False
            FieldName = 'CD_ITEM'
            Title.Alignment = taCenter
            Title.Caption = 'C'#243'd.'
            Title.Color = clBlack
            Width = 33
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'look_nm_item'
            Title.Alignment = taCenter
            Title.Color = clBlack
            Width = 298
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'VL_DESPESA'
            Title.Alignment = taCenter
            Title.Color = clBlack
            Width = 121
            Visible = True
          end>
      end
      object pnl_prev_custo: TPanel
        Left = 12
        Top = 372
        Width = 711
        Height = 52
        BevelInner = bvLowered
        TabOrder = 2
        object lbl_valor: TLabel
          Left = 382
          Top = 8
          Width = 30
          Height = 13
          Caption = 'Valor'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object lblItem: TLabel
          Left = 11
          Top = 8
          Width = 25
          Height = 13
          Caption = 'Item'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object btn_co_item: TSpeedButton
          Left = 342
          Top = 20
          Width = 25
          Height = 23
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
        object dbedt_vl_despesa: TDBEdit
          Left = 382
          Top = 21
          Width = 121
          Height = 21
          DataField = 'VL_DESPESA'
          DataSource = datm_previsao.ds_previsao_despesa
          MaxLength = 14
          TabOrder = 2
          OnChange = dbedt_cd_itemChange
        end
        object dbedt_nm_item: TDBEdit
          Left = 47
          Top = 21
          Width = 294
          Height = 21
          TabStop = False
          Color = clMenu
          DataField = 'look_nm_item'
          DataSource = datm_previsao.ds_previsao_despesa
          ReadOnly = True
          TabOrder = 1
        end
        object dbedt_cd_item: TDBEdit
          Left = 11
          Top = 21
          Width = 37
          Height = 21
          DataField = 'CD_ITEM'
          DataSource = datm_previsao.ds_previsao_despesa
          TabOrder = 0
          OnChange = dbedt_cd_itemChange
          OnExit = dbedt_cd_itemExit
          OnKeyDown = msk_cd_unid_negKeyDown
        end
      end
      object dbedt_nr_processo3: TDBEdit
        Left = 22
        Top = 32
        Width = 122
        Height = 22
        TabStop = False
        AutoSize = False
        BevelInner = bvLowered
        BevelOuter = bvNone
        BevelKind = bkFlat
        Color = clMenu
        Ctl3D = False
        DataField = 'calc_nr_processo'
        DataSource = datm_previsao.ds_previsao
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        MaxLength = 7
        ParentCtl3D = False
        ParentFont = False
        ReadOnly = True
        TabOrder = 0
        OnExit = dbedt_cd_importadorExit
      end
    end
  end
  object pnlUsuario: TPanel
    Left = 432
    Top = 41
    Width = 310
    Height = 19
    Anchors = [akTop, akRight]
    BevelInner = bvLowered
    TabOrder = 2
    object Label18: TLabel
      Left = 2
      Top = 2
      Width = 60
      Height = 15
      Align = alLeft
      Caption = ' Usu'#225'rio:  '
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object dbtxtNM_USUARIO: TDBText
      Left = 62
      Top = 2
      Width = 95
      Height = 15
      Align = alLeft
      AutoSize = True
      DataField = 'NM_USUARIO'
      DataSource = datm_previsao.ds_previsao
    end
  end
  object mnuPrevisao: TMainMenu
    Left = 323
    Top = 7
    object mi_incluir: TMenuItem
      Caption = '&Incluir'
      OnClick = btn_incluirClick
    end
    object mi_salvar: TMenuItem
      Caption = '&Salvar'
      Enabled = False
      Hint = 'Salvar'
      OnClick = btn_salvarClick
    end
    object mi_cancelar: TMenuItem
      Caption = '&Cancelar'
      Enabled = False
      Hint = 'Cancelar'
      OnClick = btn_cancelarClick
    end
    object mi_excluir: TMenuItem
      Caption = '&Excluir'
      Enabled = False
      Hint = 'Excluir'
      OnClick = btn_excluirClick
    end
    object mi_imprimir: TMenuItem
      Caption = 'Im&primir'
      Enabled = False
      OnClick = btn_imprimirClick
    end
    object mi_calculo: TMenuItem
      Caption = 'Ca&lcular'
      Enabled = False
      Hint = 'Calcular Previs'#227'o'
      OnClick = btn_calculoClick
    end
    object miSair: TMenuItem
      Caption = 'Sai&r'
      Hint = 'Salvar'
      OnClick = btn_sairClick
    end
  end
  object crp_previsao: TCRPE
    WindowShowPrintSetupBtn = True
    WindowShowProgressCtls = False
    WindowState = wsMaximized
    LoadEngineOnUse = False
    Left = 345
    Top = 39
  end
end
