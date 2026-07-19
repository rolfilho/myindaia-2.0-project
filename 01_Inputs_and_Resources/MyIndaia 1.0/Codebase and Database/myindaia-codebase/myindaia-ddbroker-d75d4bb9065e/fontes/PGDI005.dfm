object frm_DI_Itens: Tfrm_DI_Itens
  Left = 496
  Top = 221
  Width = 805
  Height = 628
  BorderIcons = [biSystemMenu]
  Caption = 'Declara'#231#227'o de Importa'#231#227'o '
  Color = clBtnFace
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  KeyPreview = True
  Menu = menu_manut_cadastro
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
    Width = 789
    Height = 49
    Align = alTop
    BevelInner = bvLowered
    TabOrder = 0
    object btn_sair: TSpeedButton
      Left = 390
      Top = 5
      Width = 35
      Height = 39
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
      Top = 5
      Width = 35
      Height = 39
      Hint = 'Salvar'
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
      Left = 75
      Top = 5
      Width = 35
      Height = 39
      Hint = 'Cancelar'
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
    object btn_novo_item: TSpeedButton
      Left = 5
      Top = 5
      Width = 35
      Height = 39
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
      OnClick = btn_novo_itemClick
    end
    object btn_adicao_di: TSpeedButton
      Left = 223
      Top = 5
      Width = 35
      Height = 39
      Hint = 'Adi'#231#245'es DI'
      Flat = True
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        0400000000000001000000000000000000001000000010000000000000000000
        8000008000000080800080000000800080008080000080808000C0C0C0000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00555500000000
        0555555F7777777775F55500FFFFFFFFF0555577F5FFFFFFF7F550F0FBBBBBBB
        F05557F7F777777757F550F0FFFFFFFFF05557F7F5FFFFFFF7F550F0FBBBBBBB
        F05557F7F777777757F550F0FF666FFFF05557F7F5FFFFFFF7F550F0FBBBBBBB
        F05557F7F777777757F550F0FF6F666FF05557F7F5FFFFFFF7F550F0FBBBBBBB
        F05557F7F777777757F550F0FF66F6FFF05557F7F5FFFFFFF7F550F0FBBBBBBB
        F05557F7F777777757F550F0FFFFFFFFF05557F7FF5F5F5F57F550F00F0F0F0F
        005557F77F7F7F7F77555055070707070555575F7F7F7F7F7F55550507070707
        0555557575757575755555505050505055555557575757575555}
      NumGlyphs = 2
      ParentShowHint = False
      ShowHint = True
      OnClick = btn_adicao_diClick
    end
    object btn_capa_di: TSpeedButton
      Left = 188
      Top = 5
      Width = 35
      Height = 39
      Hint = 'Capa DI'
      Flat = True
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        0400000000000001000000000000000000001000000010000000000000000000
        8000008000000080800080000000800080008080000080808000C0C0C0000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00555500000000
        0555555F7777777775F55500FFFFFFFFF0555577F5FFFFFFF7F550F0FEEEEEEE
        F05557F7F777777757F550F0FFFFFFFFF05557F7F5FFFFFFF7F550F0FEEEEEEE
        F05557F7F777777757F550F0FF777FFFF05557F7F5FFFFFFF7F550F0FEEEEEEE
        F05557F7F777777757F550F0FF7F777FF05557F7F5FFFFFFF7F550F0FEEEEEEE
        F05557F7F777777757F550F0FF77F7FFF05557F7F5FFFFFFF7F550F0FEEEEEEE
        F05557F7F777777757F550F0FFFFFFFFF05557F7FF5F5F5F57F550F00F0F0F0F
        005557F77F7F7F7F77555055070707070555575F7F7F7F7F7F55550507070707
        0555557575757575755555505050505055555557575757575555}
      NumGlyphs = 2
      ParentShowHint = False
      ShowHint = True
      OnClick = btn_capa_diClick
    end
    object btn_duplica: TSpeedButton
      Left = 149
      Top = 5
      Width = 35
      Height = 39
      Hint = 'Duplica'#231#227'o de Item'
      Enabled = False
      Flat = True
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        0400000000000001000000000000000000001000000010000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF003333330B7FFF
        FFB0333333777F3333773333330B7FFFFFB0333333777F3333773333330B7FFF
        FFB0333333777F3333773333330B7FFFFFB03FFFFF777FFFFF77000000000077
        007077777777777777770FFFFFFFF00077B07F33333337FFFF770FFFFFFFF000
        7BB07F3FF3FFF77FF7770F00F000F00090077F77377737777F770FFFFFFFF039
        99337F3FFFF3F7F777FF0F0000F0F09999937F7777373777777F0FFFFFFFF999
        99997F3FF3FFF77777770F00F000003999337F773777773777F30FFFF0FF0339
        99337F3FF7F3733777F30F08F0F0337999337F7737F73F7777330FFFF0039999
        93337FFFF7737777733300000033333333337777773333333333}
      Layout = blGlyphBottom
      NumGlyphs = 2
      ParentShowHint = False
      ShowHint = True
      OnClick = btn_duplicaClick
    end
    object btn_excluir: TSpeedButton
      Left = 110
      Top = 5
      Width = 35
      Height = 39
      Hint = 'Excluir item'
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
    object btn_atz_desc_merc: TSpeedButton
      Left = 262
      Top = 5
      Width = 35
      Height = 39
      Hint = 'Atualiza Descri'#231#227'o da Mercadoria'
      Flat = True
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        0400000000000001000000000000000000001000000010000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF003FFFFFFFFFFF
        FFFF33333333333FFFFF3FFFFFFFFF00000F333333333377777F33FFFFFFFF09
        990F33333333337F337F333FFFFFFF09990F33333333337F337F3333FFFFFF09
        990F33333333337FFF7F33333FFFFF00000F3333333333777773333333FFFFFF
        FFFF3FFFFF3333333F330000033FFFFF0FFF77777F3333337FF30EEE0333FFF0
        00FF7F337FFF333777FF0EEE00033F00000F7F33777F3777777F0EEE0E033000
        00007FFF7F7FF777777700000E00033000FF777773777F3777F3330EEE0E0330
        00FF337FFF7F7F3777F33300000E033000FF337777737F37773333330EEE0300
        03FF33337FFF77777333333300000333333F3333777773333333}
      NumGlyphs = 2
      ParentShowHint = False
      ShowHint = True
      OnClick = btn_atz_desc_mercClick
    end
    object btn_trans_DI: TSpeedButton
      Left = 301
      Top = 5
      Width = 35
      Height = 39
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
      Left = 301
      Top = 5
      Width = 35
      Height = 39
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
    object btnEnvioDuimp: TSpeedButton
      Left = 340
      Top = 5
      Width = 35
      Height = 39
      Hint = 'Retificar DI'
      Caption = 'DUIMP'
      Flat = True
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlue
      Font.Height = -9
      Font.Name = 'Segoe UI Semibold'
      Font.Style = []
      NumGlyphs = 2
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      OnClick = btnEnvioDuimpClick
    end
    object Panel3: TPanel
      Left = 430
      Top = 4
      Width = 355
      Height = 41
      TabOrder = 0
      object Label9: TLabel
        Left = 215
        Top = 17
        Width = 7
        Height = 13
        Caption = '/'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = True
      end
      object Shape6: TShape
        Left = 265
        Top = 12
        Width = 84
        Height = 23
        Brush.Color = clBtnFace
        Pen.Color = clGray
      end
      object Shape5: TShape
        Left = 88
        Top = 12
        Width = 84
        Height = 23
        Brush.Color = clBtnFace
        Pen.Color = clGray
      end
      object lbl_nm_usuario: TLabel
        Left = 183
        Top = 0
        Width = 40
        Height = 13
        Caption = 'Adi'#231#227'o'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = True
      end
      object Label6: TLabel
        Left = 5
        Top = 0
        Width = 25
        Height = 13
        Caption = 'Item'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = True
      end
      object Label17: TLabel
        Left = 38
        Top = 17
        Width = 7
        Height = 13
        Caption = '/'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = True
      end
      object DBNavigator1: TDBNavigator
        Left = 268
        Top = 14
        Width = 80
        Height = 20
        DataSource = datm_DI_Itens.ds_adicao_
        VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast]
        Flat = True
        Hints.Strings = (
          'Primeira adi'#231#227'o'
          'Adi'#231#227'o Anterior'
          'Pr'#243'xima adi'#231#227'o'
          #218'ltima adi'#231#227'o')
        ParentShowHint = False
        ShowHint = True
        TabOrder = 0
      end
      object DBNavigator2: TDBNavigator
        Left = 91
        Top = 14
        Width = 80
        Height = 20
        DataSource = datm_DI_Itens.ds_ad_itens
        VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast]
        Flat = True
        Ctl3D = True
        Hints.Strings = (
          'Primeiro item'
          'Item Anterior'
          'Pr'#243'ximo item'
          #218'ltimo item')
        ParentCtl3D = False
        ParentShowHint = False
        ShowHint = True
        TabOrder = 1
      end
      object dbedtNrItem: TDBEdit
        Left = 5
        Top = 14
        Width = 32
        Height = 21
        TabStop = False
        AutoSize = False
        BevelInner = bvLowered
        BevelOuter = bvNone
        BevelKind = bkFlat
        Color = clMenu
        Ctl3D = False
        DataField = 'NR_ITEM'
        DataSource = datm_DI_Itens.ds_ad_itens
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        MaxLength = 15
        ParentCtl3D = False
        ParentFont = False
        ReadOnly = True
        TabOrder = 2
        OnChange = dbedtNrItemChange
      end
      object dbedtNrAdicao: TDBEdit
        Left = 183
        Top = 14
        Width = 32
        Height = 21
        TabStop = False
        AutoSize = False
        BevelInner = bvLowered
        BevelOuter = bvNone
        BevelKind = bkFlat
        Color = clMenu
        Ctl3D = False
        DataField = 'NR_ADICAO'
        DataSource = datm_DI_Itens.ds_adicao_
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        MaxLength = 15
        ParentCtl3D = False
        ParentFont = False
        ReadOnly = True
        TabOrder = 3
        OnChange = dbedtNrAdicaoChange
      end
      object DBEdit10: TDBEdit
        Left = 47
        Top = 14
        Width = 32
        Height = 21
        TabStop = False
        AutoSize = False
        BevelInner = bvLowered
        BevelOuter = bvNone
        BevelKind = bkFlat
        Color = clMenu
        Ctl3D = False
        DataField = 'QT_ITENS_ADICAO'
        DataSource = datm_DI_Itens.ds_adicao_
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        MaxLength = 15
        ParentCtl3D = False
        ParentFont = False
        ReadOnly = True
        TabOrder = 4
      end
      object DBEdit12: TDBEdit
        Left = 222
        Top = 14
        Width = 32
        Height = 21
        TabStop = False
        AutoSize = False
        BevelInner = bvLowered
        BevelOuter = bvNone
        BevelKind = bkFlat
        Color = clMenu
        Ctl3D = False
        DataField = 'QT_ADICOES'
        DataSource = datm_DI_Itens.ds_di
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        MaxLength = 15
        ParentCtl3D = False
        ParentFont = False
        ReadOnly = True
        TabOrder = 5
      end
      object edtItemDireto: TEdit
        Left = 6
        Top = 14
        Width = 32
        Height = 21
        TabStop = False
        AutoSize = False
        BevelInner = bvLowered
        BevelKind = bkFlat
        BevelOuter = bvNone
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        MaxLength = 3
        ParentFont = False
        TabOrder = 6
        OnKeyDown = edtItemDiretoKeyDown
        OnKeyPress = edtItemDiretoKeyPress
        OnKeyUp = edtItemDiretoKeyUp
      end
      object edtAdicaoDireto: TEdit
        Left = 183
        Top = 14
        Width = 32
        Height = 21
        TabStop = False
        AutoSize = False
        BevelInner = bvLowered
        BevelKind = bkFlat
        BevelOuter = bvNone
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        MaxLength = 3
        ParentFont = False
        TabOrder = 7
        OnKeyDown = edtAdicaoDiretoKeyDown
        OnKeyPress = edtAdicaoDiretoKeyPress
        OnKeyUp = edtAdicaoDiretoKeyUp
      end
    end
  end
  object pgctrl_Item: TPageControl
    Left = 0
    Top = 49
    Width = 789
    Height = 520
    ActivePage = tsAtributos
    Align = alClient
    TabOrder = 1
    OnChange = pgctrl_ItemChange
    OnChanging = pgctrl_ItemChanging
    object ts_item_unit: TTabSheet
      Caption = 'Valor Unit'#225'rio'
      object Shape1: TShape
        Left = 15
        Top = 5
        Width = 703
        Height = 37
        Brush.Style = bsClear
        Pen.Color = clGray
      end
      object lbl_vinculacao_comp_vend: TLabel
        Left = 15
        Top = 196
        Width = 90
        Height = 13
        Caption = 'Tipo de C'#225'lculo'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object lbl_pais_origem1: TLabel
        Left = 32
        Top = 17
        Width = 45
        Height = 13
        Caption = 'Produto'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        WordWrap = True
      end
      object Label1: TLabel
        Left = 468
        Top = 434
        Width = 88
        Height = 13
        Caption = 'Pa'#237's de Origem'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        WordWrap = True
      end
      object btn_co_pais_aquisicao: TSpeedButton
        Left = 693
        Top = 405
        Width = 25
        Height = 21
        Flat = True
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
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
        OnClick = btn_co_pais_aquisicaoClick
      end
      object Label2: TLabel
        Left = 468
        Top = 392
        Width = 104
        Height = 13
        Caption = 'Pa'#237's de Aquisi'#231#227'o'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object btn_co_pais_origem: TSpeedButton
        Left = 693
        Top = 447
        Width = 25
        Height = 22
        Flat = True
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
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
        OnClick = btn_co_pais_origemClick
      end
      object Label3: TLabel
        Left = 14
        Top = 392
        Width = 62
        Height = 13
        Caption = 'Exportador'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label4: TLabel
        Left = 14
        Top = 434
        Width = 123
        Height = 13
        Caption = 'Fabricante / Produtor'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object btn_co_exportador: TSpeedButton
        Left = 360
        Top = 405
        Width = 25
        Height = 21
        Flat = True
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
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
        OnClick = btn_co_exportadorClick
      end
      object btn_co_fabricante: TSpeedButton
        Left = 360
        Top = 448
        Width = 25
        Height = 21
        Flat = True
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
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
        OnClick = btn_co_fabricanteClick
      end
      object btn_co_produto: TSpeedButton
        Left = 685
        Top = 13
        Width = 25
        Height = 21
        Flat = True
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
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
        OnClick = btn_co_produtoClick
      end
      object Label5: TLabel
        Left = 15
        Top = 100
        Width = 72
        Height = 13
        Caption = 'Unid.Medida'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        WordWrap = True
      end
      object Label7: TLabel
        Left = 15
        Top = 75
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
      object Label8: TLabel
        Left = 15
        Top = 124
        Width = 78
        Height = 13
        Caption = 'Valor Unit'#225'rio'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label11: TLabel
        Left = 15
        Top = 148
        Width = 47
        Height = 13
        Caption = '% Desc.'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label12: TLabel
        Left = 15
        Top = 172
        Width = 74
        Height = 13
        Caption = 'Vl. Desconto'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label13: TLabel
        Left = 15
        Top = 221
        Width = 76
        Height = 13
        Caption = 'Valor do Item'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label14: TLabel
        Left = 391
        Top = 75
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
      object Label15: TLabel
        Left = 391
        Top = 148
        Width = 124
        Height = 13
        Caption = 'Unid.Med. Estat'#237'stica'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label16: TLabel
        Left = 391
        Top = 166
        Width = 91
        Height = 26
        Caption = 'Quant. na Unid.'#13#10'Estat'#237'stica'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label18: TLabel
        Left = 391
        Top = 100
        Width = 69
        Height = 13
        Caption = 'NALADI/SH'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label19: TLabel
        Left = 391
        Top = 124
        Width = 85
        Height = 13
        Caption = 'NALADI/NCCA'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object btn_unid_med: TSpeedButton
        Left = 348
        Top = 95
        Width = 25
        Height = 23
        Flat = True
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
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
        OnClick = btn_unid_medClick
      end
      object btn_co_naladi_sh: TSpeedButton
        Left = 693
        Top = 96
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
        OnClick = btn_co_naladi_shClick
      end
      object btn_co_naladi_ncca: TSpeedButton
        Left = 693
        Top = 120
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
        OnClick = btn_co_naladi_nccaClick
      end
      object btn_co_ncm: TSpeedButton
        Left = 693
        Top = 71
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
        OnClick = btn_co_ncmClick
      end
      object Label10: TLabel
        Left = 391
        Top = 196
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
      object Label38: TLabel
        Left = 391
        Top = 221
        Width = 36
        Height = 13
        Caption = 'N'#186' PO'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label73: TLabel
        Left = 391
        Top = 246
        Width = 104
        Height = 13
        Caption = 'Destaque da NCM'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label45: TLabel
        Left = 391
        Top = 272
        Width = 55
        Height = 13
        Caption = 'N'#186' Fatura'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object lblContainer: TLabel
        Left = 392
        Top = 296
        Width = 55
        Height = 13
        Caption = 'Cont'#234'iner'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object lbl1: TLabel
        Left = 622
        Top = 331
        Width = 65
        Height = 13
        Caption = 'ID (Cliente)'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label47: TLabel
        Left = 15
        Top = 245
        Width = 91
        Height = 13
        Caption = 'N'#250'mero do Lote'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object lblNrItemDuimp: TLabel
        Left = 15
        Top = 51
        Width = 85
        Height = 13
        Caption = 'Nr. Item Duimp'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object lblOpeExportador: TLabel
        Left = 390
        Top = 392
        Width = 58
        Height = 13
        Caption = 'C'#243'd. Ope.'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object lblOpeFabricante: TLabel
        Left = 390
        Top = 435
        Width = 58
        Height = 13
        Caption = 'C'#243'd. Ope.'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object lblCodigoCatalogo: TLabel
        Left = 391
        Top = 51
        Width = 112
        Height = 13
        Caption = 'C'#243'digo no Cat'#225'logo'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object dbrgrp_fabr_expo: TDBRadioGroup
        Left = 392
        Top = 325
        Width = 217
        Height = 59
        Color = clBtnFace
        Ctl3D = True
        DataField = 'CD_FABR_EXPO'
        DataSource = datm_DI_Itens.ds_ad_itens
        Enabled = False
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        Items.Strings = (
          'Fabr./Prod. '#233' o exportador'
          'Fabr./Prod. n'#227'o '#233' o exportador'
          'Fabr./Prod. '#233' desconhecido')
        ParentColor = False
        ParentCtl3D = False
        ParentFont = False
        TabOrder = 20
        TabStop = True
        Values.Strings = (
          '1'
          '2'
          '3')
        OnChange = dbrgrp_fabr_expoChange
      end
      object dbedt_nm_pais_origem: TDBEdit
        Left = 508
        Top = 448
        Width = 184
        Height = 21
        TabStop = False
        Color = clMenu
        Ctl3D = True
        DataField = 'Look_Pais_Origem'
        DataSource = datm_DI_Itens.ds_ad_itens
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentCtl3D = False
        ParentFont = False
        ReadOnly = True
        TabOrder = 24
      end
      object dbedt_nm_pais_aquisicao: TDBEdit
        Left = 508
        Top = 405
        Width = 184
        Height = 21
        TabStop = False
        Color = clMenu
        Ctl3D = True
        DataField = 'Look_Pais_Aquisicao'
        DataSource = datm_DI_Itens.ds_ad_itens
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentCtl3D = False
        ParentFont = False
        ReadOnly = True
        TabOrder = 25
      end
      object dbedt_nm_exportador: TDBEdit
        Left = 60
        Top = 405
        Width = 300
        Height = 21
        TabStop = False
        Color = clMenu
        Ctl3D = True
        DataField = 'Look_Nm_Exportador'
        DataSource = datm_DI_Itens.ds_ad_itens
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentCtl3D = False
        ParentFont = False
        ReadOnly = True
        TabOrder = 26
      end
      object dbedt_nm_fabricante: TDBEdit
        Left = 60
        Top = 448
        Width = 300
        Height = 21
        TabStop = False
        Color = clMenu
        Ctl3D = True
        DataField = 'Look_Nm_Fabricante'
        DataSource = datm_DI_Itens.ds_ad_itens
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentCtl3D = False
        ParentFont = False
        ReadOnly = True
        TabOrder = 27
      end
      object dbm_descricao_mercadoria: TDBMemo
        Left = 15
        Top = 271
        Width = 363
        Height = 114
        DataField = 'TX_DESC_DET_MERC'
        DataSource = datm_DI_Itens.ds_ad_itens
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Courier New'
        Font.Style = []
        ParentFont = False
        ScrollBars = ssVertical
        TabOrder = 8
        OnChange = dbedt_qt_mercadoriaChange
      end
      object dbedt_nm_produto: TEdit
        Left = 284
        Top = 13
        Width = 400
        Height = 21
        TabStop = False
        Color = clMenu
        Ctl3D = True
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentCtl3D = False
        ParentFont = False
        ReadOnly = True
        TabOrder = 28
      end
      object dbedt_nm_unid_med: TDBEdit
        Left = 147
        Top = 96
        Width = 200
        Height = 21
        TabStop = False
        Color = clMenu
        Ctl3D = True
        DataField = 'Look_nm_unid_comerc'
        DataSource = datm_DI_Itens.ds_ad_itens
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentCtl3D = False
        ParentFont = False
        ReadOnly = True
        TabOrder = 29
      end
      object dbedt_qt_mercadoria: TDBEdit
        Left = 114
        Top = 71
        Width = 135
        Height = 21
        DataField = 'QT_MERC_UN_COMERC'
        DataSource = datm_DI_Itens.ds_ad_itens
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        MaxLength = 17
        ParentFont = False
        TabOrder = 1
        OnChange = dbedt_qt_mercadoriaChange
        OnEnter = dbedt_qt_mercadoriaEnter
        OnExit = dbedt_qt_mercadoriaExit
      end
      object dbedt_vl_unitario: TDBEdit
        Left = 114
        Top = 120
        Width = 117
        Height = 21
        DataField = 'VL_UNITARIO'
        DataSource = datm_DI_Itens.ds_ad_itens
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 3
        OnChange = dbedt_qt_mercadoriaChange
        OnEnter = dbedt_vl_unitarioEnter
        OnExit = dbedt_vl_unitarioExit
      end
      object dbedt_pc_desconto: TDBEdit
        Left = 114
        Top = 144
        Width = 53
        Height = 21
        DataField = 'PC_DESCONTO_MERC'
        DataSource = datm_DI_Itens.ds_ad_itens
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 4
        OnChange = dbedt_qt_mercadoriaChange
        OnEnter = dbedt_pc_descontoEnter
        OnExit = dbedt_pc_descontoExit
      end
      object dbedt_vl_desconto: TDBEdit
        Left = 114
        Top = 168
        Width = 117
        Height = 21
        DataField = 'VL_DESCONTO_MERC'
        DataSource = datm_DI_Itens.ds_ad_itens
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 5
        OnChange = dbedt_qt_mercadoriaChange
        OnEnter = dbedt_vl_descontoEnter
        OnExit = dbedt_vl_descontoExit
      end
      object dbedt_vl_item: TDBEdit
        Left = 114
        Top = 217
        Width = 117
        Height = 21
        DataField = 'VL_MLE_ITEM'
        DataSource = datm_DI_Itens.ds_ad_itens
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 7
        OnChange = dbedt_qt_mercadoriaChange
        OnEnter = dbedt_vl_itemEnter
        OnExit = dbedt_vl_itemEnter
      end
      object dbedt_cd_ncm: TDBEdit
        Left = 519
        Top = 71
        Width = 173
        Height = 21
        DataField = 'CD_NCM_SH'
        DataSource = datm_DI_Itens.ds_ad_itens
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 11
        OnChange = dbedt_qt_mercadoriaChange
        OnExit = dbedt_cd_ncmExit
        OnKeyDown = dbedt_cd_produtoKeyDown
      end
      object dbedt_qt_unid_estat: TDBEdit
        Left = 519
        Top = 168
        Width = 169
        Height = 21
        DataField = 'QT_MERC_UN_ESTAT'
        DataSource = datm_DI_Itens.ds_ad_itens
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 14
        OnChange = dbedt_qt_mercadoriaChange
        OnEnter = dbedt_qt_unid_estatEnter
      end
      object dbedt_cd_naladi_sh: TDBEdit
        Left = 519
        Top = 96
        Width = 173
        Height = 21
        DataField = 'CD_NALADI_SH'
        DataSource = datm_DI_Itens.ds_ad_itens
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 12
        OnChange = dbedt_qt_mercadoriaChange
        OnExit = dbedt_cd_naladi_shExit
        OnKeyDown = dbedt_cd_produtoKeyDown
      end
      object dbedt_naladi_ncca: TDBEdit
        Left = 519
        Top = 120
        Width = 173
        Height = 21
        DataField = 'CD_NALADI_NCCA'
        DataSource = datm_DI_Itens.ds_ad_itens
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 13
        OnChange = dbedt_qt_mercadoriaChange
        OnExit = dbedt_naladi_nccaExit
        OnKeyDown = dbedt_cd_produtoKeyDown
      end
      object cbox_tp_calculo: TDBLookupComboBox
        Left = 114
        Top = 192
        Width = 149
        Height = 21
        DataField = 'CD_TIPO_CALCULO_ITEM'
        DataSource = datm_DI_Itens.ds_ad_itens
        KeyField = 'CD_TIPO_CALCULO_ITEM'
        ListField = 'DESCRICAO'
        ListSource = datm_DI_Itens.ds_tp_calc_item
        TabOrder = 6
        OnClick = cbox_tp_calculoClick
      end
      object edt_nm_unid_est: TEdit
        Left = 519
        Top = 144
        Width = 194
        Height = 21
        TabStop = False
        Color = clBtnFace
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        ReadOnly = True
        TabOrder = 30
      end
      object dbedt_peso_liq: TDBEdit
        Left = 519
        Top = 192
        Width = 169
        Height = 21
        DataField = 'PL_MERCADORIA'
        DataSource = datm_DI_Itens.ds_ad_itens
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 15
        OnChange = dbedt_qt_mercadoriaChange
        OnEnter = dbedt_peso_liqEnter
        OnExit = dbedt_peso_liqExit
      end
      object dbedt_destaque_ncm: TDBEdit
        Left = 519
        Top = 242
        Width = 70
        Height = 21
        DataField = 'NR_DESTAQUE_NCM'
        DataSource = datm_DI_Itens.ds_ad_itens
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 18
        OnChange = dbedt_qt_mercadoriaChange
      end
      object dbedt_nr_item_po: TDBEdit
        Left = 694
        Top = 194
        Width = 41
        Height = 21
        TabStop = False
        DataField = 'NR_ITEM_PO'
        DataSource = datm_DI_Itens.ds_ad_itens
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 23
        Visible = False
        OnChange = dbedt_qt_mercadoriaChange
        OnExit = dbedt_nr_item_poExit
      end
      object dbedt_cd_produto: TDBEdit
        Left = 115
        Top = 13
        Width = 169
        Height = 21
        DataField = 'CD_MERCADORIA'
        DataSource = datm_DI_Itens.ds_ad_itens
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 0
        OnChange = btn_co_produtoClick
        OnExit = dbedt_cd_produtoExit
        OnKeyDown = dbedt_cd_produtoKeyDown
      end
      object dbedt_cd_unid_comerc: TDBEdit
        Left = 114
        Top = 96
        Width = 34
        Height = 21
        DataField = 'CD_UN_MED_COMERC'
        DataSource = datm_DI_Itens.ds_ad_itens
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 2
        OnChange = dbedt_qt_mercadoriaChange
        OnExit = dbedt_cd_unid_comercExit
        OnKeyDown = dbedt_cd_produtoKeyDown
      end
      object dbedt_cd_exportador: TDBEdit
        Left = 14
        Top = 405
        Width = 47
        Height = 21
        DataField = 'CD_EXPORTADOR'
        DataSource = datm_DI_Itens.ds_ad_itens
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 9
        OnChange = dbedt_qt_mercadoriaChange
        OnExit = dbedt_cd_exportadorExit
        OnKeyDown = dbedt_cd_produtoKeyDown
      end
      object dbedt_cd_fabricante: TDBEdit
        Left = 14
        Top = 448
        Width = 47
        Height = 21
        DataField = 'CD_FABRICANTE'
        DataSource = datm_DI_Itens.ds_ad_itens
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 10
        OnChange = dbedt_qt_mercadoriaChange
        OnExit = dbedt_cd_fabricanteExit
        OnKeyDown = dbedt_cd_produtoKeyDown
      end
      object dbedt_cd_pais_aquisicao: TDBEdit
        Left = 468
        Top = 405
        Width = 41
        Height = 21
        DataField = 'CD_PAIS_AQUISICAO'
        DataSource = datm_DI_Itens.ds_ad_itens
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 21
        OnChange = dbedt_qt_mercadoriaChange
        OnExit = dbedt_cd_pais_aquisicaoExit
        OnKeyDown = dbedt_cd_produtoKeyDown
      end
      object dbedt_cd_pais_origem: TDBEdit
        Left = 468
        Top = 448
        Width = 41
        Height = 21
        DataField = 'CD_PAIS_ORIGEM'
        DataSource = datm_DI_Itens.ds_ad_itens
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 22
        OnChange = dbedt_qt_mercadoriaChange
        OnExit = dbedt_cd_pais_origemExit
        OnKeyDown = dbedt_cd_produtoKeyDown
      end
      object CmbNrFatura: TDBLookupComboBox
        Left = 519
        Top = 267
        Width = 206
        Height = 21
        DataField = 'NR_FATURA'
        DataSource = datm_DI_Itens.ds_ad_itens
        KeyField = 'NR_DCTO_INSTRUCAO'
        ListField = 'NR_DCTO_INSTRUCAO'
        ListSource = datm_DI_Itens.dts_DocInstrucao
        TabOrder = 19
        OnClick = cbox_tp_calculoClick
      end
      object CmbItens: TComboBox
        Left = 644
        Top = 217
        Width = 50
        Height = 21
        Style = csDropDownList
        ItemHeight = 0
        Sorted = True
        TabOrder = 16
        OnChange = CmbItensChange
        OnClick = CmbItensClick
      end
      object CmbParciais: TComboBox
        Left = 693
        Top = 217
        Width = 39
        Height = 21
        Style = csDropDownList
        ItemHeight = 0
        Sorted = True
        TabOrder = 17
        OnChange = CmbItensChange
      end
      object dbcbo_nr_po: TDBComboBox
        Left = 519
        Top = 217
        Width = 125
        Height = 21
        Style = csDropDownList
        DataField = 'NR_PROC_PO'
        DataSource = datm_DI_Itens.ds_ad_itens
        ItemHeight = 13
        TabOrder = 31
        OnClick = dbedt_qt_mercadoriaChange
        OnExit = dbcbo_nr_poExit
      end
      object dbcbbConteiner: TDBComboBox
        Left = 519
        Top = 292
        Width = 206
        Height = 21
        DataField = 'NR_CNTR'
        DataSource = datm_DI_Itens.ds_ad_itens
        ItemHeight = 13
        TabOrder = 32
        OnChange = dbedt_qt_mercadoriaChange
      end
      object dbedtID_CLIENTE: TDBEdit
        Left = 622
        Top = 347
        Width = 82
        Height = 21
        DataField = 'ID_CLIENTE'
        DataSource = datm_DI_Itens.ds_ad_itens
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 33
        OnChange = dbedt_qt_mercadoriaChange
        OnEnter = dbedt_qt_unid_estatEnter
      end
      object btnQtdUnidEstatIgual: TBitBtn
        Left = 693
        Top = 169
        Width = 25
        Height = 22
        Hint = 'Atualizar o campo Quant. na Unid. Estat'#237'stica em todos os itens'
        ParentShowHint = False
        ShowHint = True
        TabOrder = 34
        OnClick = btnQtdUnidEstatIgualClick
        Glyph.Data = {
          76010000424D7601000000000000760000002800000020000000100000000100
          04000000000000010000120B0000120B00001000000000000000000000000000
          800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF003FFFFFFFFFFF
          FFFF33333333333FFFFF3FFFFFFFFF00000F333333333377777F33FFFFFFFF09
          990F33333333337F337F333FFFFFFF09990F33333333337F337F3333FFFFFF09
          990F33333333337FFF7F33333FFFFF00000F3333333333777773333333FFFFFF
          FFFF3333333333333F333333333FFFFF0FFF3333333333337FF333333333FFF0
          00FF33333333333777FF333333333F00000F33FFFFF33777777F300000333000
          0000377777F33777777730EEE033333000FF37F337F3333777F330EEE0333330
          00FF37F337F3333777F330EEE033333000FF37FFF7F333F77733300000333000
          03FF3777773337777333333333333333333F3333333333333333}
        NumGlyphs = 2
      end
      object dbedt_NumeroLote: TDBEdit
        Left = 114
        Top = 241
        Width = 117
        Height = 21
        DataField = 'NumeroLote'
        DataSource = datm_DI_Itens.ds_ad_itens
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 35
        OnChange = dbedt_qt_mercadoriaChange
        OnEnter = dbedt_vl_itemEnter
        OnExit = dbedt_vl_itemEnter
      end
      object bdeNrItemDuimp: TDBEdit
        Left = 114
        Top = 47
        Width = 135
        Height = 21
        DataField = 'NR_ITEM_DUIMP'
        DataSource = datm_DI_Itens.ds_ad_itens
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        MaxLength = 17
        ParentFont = False
        ReadOnly = True
        TabOrder = 36
        OnChange = dbedt_qt_mercadoriaChange
        OnEnter = dbedt_qt_mercadoriaEnter
        OnExit = dbedt_qt_mercadoriaExit
      end
      object edtOpeExportador: TEdit
        Left = 390
        Top = 405
        Width = 60
        Height = 21
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        ReadOnly = True
        TabOrder = 37
      end
      object edtOpeFabricante: TEdit
        Left = 390
        Top = 448
        Width = 60
        Height = 21
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        ReadOnly = True
        TabOrder = 38
      end
      object edtCodigoCatalogo: TDBEdit
        Left = 519
        Top = 47
        Width = 135
        Height = 21
        DataField = 'Look_Cod_Catalogo'
        DataSource = datm_DI_Itens.ds_ad_itens
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        MaxLength = 17
        ParentFont = False
        ReadOnly = True
        TabOrder = 39
        OnChange = dbedt_qt_mercadoriaChange
        OnEnter = dbedt_qt_mercadoriaEnter
        OnExit = dbedt_qt_mercadoriaExit
      end
    end
    object ts_item_tot: TTabSheet
      Caption = 'Valor Total'
      object Shape2: TShape
        Left = 15
        Top = 5
        Width = 703
        Height = 37
        Brush.Style = bsClear
        Pen.Color = clGray
      end
      object Label20: TLabel
        Left = 32
        Top = 17
        Width = 45
        Height = 13
        Caption = 'Produto'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        WordWrap = True
      end
      object Label21: TLabel
        Left = 15
        Top = 55
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
      object btn_co_produto2: TSpeedButton
        Left = 685
        Top = 13
        Width = 25
        Height = 21
        Flat = True
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
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
        OnClick = btn_co_produtoClick
      end
      object btn_co_ncm2: TSpeedButton
        Left = 693
        Top = 51
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
        OnClick = btn_co_ncmClick
      end
      object Label22: TLabel
        Left = 391
        Top = 80
        Width = 69
        Height = 13
        Caption = 'NALADI/SH'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label23: TLabel
        Left = 391
        Top = 104
        Width = 85
        Height = 13
        Caption = 'NALADI/NCCA'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label24: TLabel
        Left = 391
        Top = 55
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
      object btn_co_naladi_sh2: TSpeedButton
        Left = 693
        Top = 76
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
        OnClick = btn_co_naladi_shClick
      end
      object btn_co_naladi_ncca2: TSpeedButton
        Left = 693
        Top = 100
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
        OnClick = btn_co_naladi_nccaClick
      end
      object Label25: TLabel
        Left = 391
        Top = 128
        Width = 124
        Height = 13
        Caption = 'Unid.Med. Estat'#237'stica'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label26: TLabel
        Left = 391
        Top = 146
        Width = 91
        Height = 26
        Caption = 'Quant. na Unid.'#13#10'Estat'#237'stica'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label27: TLabel
        Left = 391
        Top = 176
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
      object Label28: TLabel
        Left = 15
        Top = 104
        Width = 76
        Height = 13
        Caption = 'Valor do Item'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label29: TLabel
        Left = 15
        Top = 176
        Width = 90
        Height = 13
        Caption = 'Tipo de C'#225'lculo'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label30: TLabel
        Left = 15
        Top = 152
        Width = 74
        Height = 13
        Caption = 'Vl. Desconto'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label31: TLabel
        Left = 15
        Top = 128
        Width = 47
        Height = 13
        Caption = '% Desc.'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label32: TLabel
        Left = 15
        Top = 201
        Width = 78
        Height = 13
        Caption = 'Valor Unit'#225'rio'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label33: TLabel
        Left = 15
        Top = 80
        Width = 72
        Height = 13
        Caption = 'Unid.Medida'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        WordWrap = True
      end
      object btn_unid_med2: TSpeedButton
        Left = 348
        Top = 76
        Width = 25
        Height = 21
        Flat = True
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
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
        OnClick = btn_unid_medClick
      end
      object Label34: TLabel
        Left = 468
        Top = 377
        Width = 88
        Height = 13
        Caption = 'Pa'#237's de Origem'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        WordWrap = True
      end
      object btn_co_pais_aquisicao2: TSpeedButton
        Left = 693
        Top = 348
        Width = 25
        Height = 21
        Flat = True
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
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
        OnClick = btn_co_pais_aquisicaoClick
      end
      object btn_co_pais_origem2: TSpeedButton
        Left = 693
        Top = 390
        Width = 25
        Height = 22
        Flat = True
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
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
        OnClick = btn_co_pais_origemClick
      end
      object Label35: TLabel
        Left = 468
        Top = 335
        Width = 104
        Height = 13
        Caption = 'Pa'#237's de Aquisi'#231#227'o'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object btn_co_fabricante2: TSpeedButton
        Left = 425
        Top = 391
        Width = 25
        Height = 21
        Flat = True
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
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
        OnClick = btn_co_fabricanteClick
      end
      object btn_co_exportador2: TSpeedButton
        Left = 425
        Top = 348
        Width = 25
        Height = 21
        Flat = True
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
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
        OnClick = btn_co_exportadorClick
      end
      object Label36: TLabel
        Left = 14
        Top = 335
        Width = 62
        Height = 13
        Caption = 'Exportador'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label37: TLabel
        Left = 14
        Top = 377
        Width = 123
        Height = 13
        Caption = 'Fabricante / Produtor'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label39: TLabel
        Left = 391
        Top = 201
        Width = 36
        Height = 13
        Caption = 'N'#186' PO'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label44: TLabel
        Left = 391
        Top = 224
        Width = 104
        Height = 13
        Caption = 'Destaque da NCM'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object dbedt_qt_mercadoria2: TDBEdit
        Left = 114
        Top = 51
        Width = 117
        Height = 21
        DataField = 'QT_MERC_UN_COMERC'
        DataSource = datm_DI_Itens.ds_ad_itens
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        MaxLength = 17
        ParentFont = False
        TabOrder = 1
        OnChange = dbedt_qt_mercadoriaChange
        OnEnter = dbedt_qt_mercadoria2Enter
        OnExit = dbedt_qt_mercadoria2Exit
      end
      object dbedt_nm_produto2: TDBEdit
        Left = 231
        Top = 13
        Width = 453
        Height = 21
        TabStop = False
        Color = clMenu
        Ctl3D = True
        DataField = 'Look_Mercadoria'
        DataSource = datm_DI_Itens.ds_ad_itens
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentCtl3D = False
        ParentFont = False
        ReadOnly = True
        TabOrder = 20
      end
      object dbedt_naladi_ncca2: TDBEdit
        Left = 519
        Top = 100
        Width = 173
        Height = 21
        DataField = 'CD_NALADI_NCCA'
        DataSource = datm_DI_Itens.ds_ad_itens
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 10
        OnChange = dbedt_qt_mercadoriaChange
        OnExit = dbedt_naladi_nccaExit
        OnKeyDown = dbedt_cd_produtoKeyDown
      end
      object dbedt_cd_naladi_sh2: TDBEdit
        Left = 519
        Top = 76
        Width = 173
        Height = 21
        DataField = 'CD_NALADI_SH'
        DataSource = datm_DI_Itens.ds_ad_itens
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 9
        OnChange = dbedt_qt_mercadoriaChange
        OnExit = dbedt_cd_naladi_shExit
        OnKeyDown = dbedt_cd_produtoKeyDown
      end
      object dbedt_cd_ncm2: TDBEdit
        Left = 519
        Top = 51
        Width = 173
        Height = 21
        DataField = 'CD_NCM_SH'
        DataSource = datm_DI_Itens.ds_ad_itens
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 8
        OnChange = dbedt_qt_mercadoriaChange
        OnExit = dbedt_cd_ncmExit
        OnKeyDown = dbedt_cd_produtoKeyDown
      end
      object edt_nm_unid_est2: TEdit
        Left = 519
        Top = 124
        Width = 200
        Height = 21
        TabStop = False
        Color = clBtnFace
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        ReadOnly = True
        TabOrder = 21
      end
      object dbedt_qt_unid_estat2: TDBEdit
        Left = 519
        Top = 148
        Width = 173
        Height = 21
        DataField = 'QT_MERC_UN_ESTAT'
        DataSource = datm_DI_Itens.ds_ad_itens
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 11
        OnChange = dbedt_qt_mercadoriaChange
        OnEnter = dbedt_qt_unid_estat2Enter
      end
      object dbedt_peso_liq2: TDBEdit
        Left = 519
        Top = 172
        Width = 173
        Height = 21
        DataField = 'PL_MERCADORIA'
        DataSource = datm_DI_Itens.ds_ad_itens
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 12
        OnChange = dbedt_qt_mercadoriaChange
        OnEnter = dbedt_peso_liq2Enter
        OnExit = dbedt_peso_liq2Exit
      end
      object dbedt_vl_item2: TDBEdit
        Left = 114
        Top = 100
        Width = 117
        Height = 21
        DataField = 'VL_MLE_ITEM'
        DataSource = datm_DI_Itens.ds_ad_itens
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 3
        OnChange = dbedt_qt_mercadoriaChange
        OnEnter = dbedt_vl_item2Enter
        OnExit = dbedt_vl_item2Exit
      end
      object dbedt_nm_unid_med2: TDBEdit
        Left = 147
        Top = 76
        Width = 200
        Height = 21
        TabStop = False
        Color = clMenu
        Ctl3D = True
        DataField = 'Look_nm_unid_comerc'
        DataSource = datm_DI_Itens.ds_ad_itens
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentCtl3D = False
        ParentFont = False
        ReadOnly = True
        TabOrder = 22
      end
      object dbedt_vl_unitario2: TDBEdit
        Left = 114
        Top = 197
        Width = 117
        Height = 21
        DataField = 'VL_UNITARIO'
        DataSource = datm_DI_Itens.ds_ad_itens
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 7
        OnChange = dbedt_qt_mercadoriaChange
        OnEnter = dbedt_vl_unitario2Enter
        OnExit = dbedt_vl_unitario2Enter
      end
      object dbedt_pc_desconto2: TDBEdit
        Left = 114
        Top = 124
        Width = 53
        Height = 21
        DataField = 'PC_DESCONTO_MERC'
        DataSource = datm_DI_Itens.ds_ad_itens
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 4
        OnChange = dbedt_qt_mercadoriaChange
        OnEnter = dbedt_pc_desconto2Enter
        OnExit = dbedt_pc_desconto2Exit
      end
      object dbedt_vl_desconto2: TDBEdit
        Left = 114
        Top = 148
        Width = 117
        Height = 21
        DataField = 'VL_DESCONTO_MERC'
        DataSource = datm_DI_Itens.ds_ad_itens
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 5
        OnChange = dbedt_qt_mercadoriaChange
        OnEnter = dbedt_vl_desconto2Enter
        OnExit = dbedt_vl_desconto2Exit
      end
      object cbox_tp_calculo2: TDBLookupComboBox
        Left = 114
        Top = 172
        Width = 149
        Height = 21
        DataField = 'CD_TIPO_CALCULO_ITEM'
        DataSource = datm_DI_Itens.ds_ad_itens
        KeyField = 'CD_TIPO_CALCULO_ITEM'
        ListField = 'DESCRICAO'
        ListSource = datm_DI_Itens.ds_tp_calc_item
        TabOrder = 6
        OnClick = cbox_tp_calculo2Click
      end
      object dbm_descricao_mercadoria2: TDBMemo
        Left = 14
        Top = 253
        Width = 389
        Height = 68
        DataField = 'TX_DESC_DET_MERC'
        DataSource = datm_DI_Itens.ds_ad_itens
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Courier New'
        Font.Style = []
        ParentFont = False
        ScrollBars = ssVertical
        TabOrder = 14
        OnChange = dbedt_qt_mercadoriaChange
      end
      object dbrgrp_fabr_expo2: TDBRadioGroup
        Left = 420
        Top = 248
        Width = 299
        Height = 72
        Color = clBtnFace
        Ctl3D = True
        DataField = 'CD_FABR_EXPO'
        DataSource = datm_DI_Itens.ds_ad_itens
        Enabled = False
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        Items.Strings = (
          'Fabr./Prod. '#233' o exportador'
          'Fabr./Prod. n'#227'o '#233' o exportador'
          'Fabr./Prod. '#233' desconhecido')
        ParentColor = False
        ParentCtl3D = False
        ParentFont = False
        TabOrder = 15
        TabStop = True
        Values.Strings = (
          '1'
          '2'
          '3')
        OnChange = dbedt_qt_mercadoriaChange
      end
      object dbedt_nm_pais_origem2: TDBEdit
        Left = 508
        Top = 391
        Width = 184
        Height = 21
        TabStop = False
        Color = clMenu
        Ctl3D = True
        DataField = 'Look_Pais_Origem'
        DataSource = datm_DI_Itens.ds_ad_itens
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentCtl3D = False
        ParentFont = False
        ReadOnly = True
        TabOrder = 23
      end
      object dbedt_nm_pais_aquisicao2: TDBEdit
        Left = 508
        Top = 348
        Width = 184
        Height = 21
        TabStop = False
        Color = clMenu
        Ctl3D = True
        DataField = 'Look_Pais_Aquisicao'
        DataSource = datm_DI_Itens.ds_ad_itens
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentCtl3D = False
        ParentFont = False
        ReadOnly = True
        TabOrder = 24
      end
      object dbedt_nm_fabricante2: TDBEdit
        Left = 60
        Top = 391
        Width = 364
        Height = 21
        TabStop = False
        Color = clMenu
        Ctl3D = True
        DataField = 'Look_Nm_Fabricante'
        DataSource = datm_DI_Itens.ds_ad_itens
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentCtl3D = False
        ParentFont = False
        ReadOnly = True
        TabOrder = 25
      end
      object dbedt_nm_exportador2: TDBEdit
        Left = 60
        Top = 348
        Width = 364
        Height = 21
        TabStop = False
        Color = clMenu
        Ctl3D = True
        DataField = 'Look_NM_Exportador'
        DataSource = datm_DI_Itens.ds_ad_itens
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentCtl3D = False
        ParentFont = False
        ReadOnly = True
        TabOrder = 26
      end
      object dbedt_destaque_ncm2: TDBEdit
        Left = 519
        Top = 220
        Width = 35
        Height = 21
        DataField = 'NR_DESTAQUE_NCM'
        DataSource = datm_DI_Itens.ds_ad_itens
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 13
        OnChange = dbedt_qt_mercadoriaChange
      end
      object dbedt_nr_item_po2: TDBEdit
        Left = 576
        Top = 220
        Width = 42
        Height = 21
        DataField = 'NR_ITEM_PO'
        DataSource = datm_DI_Itens.ds_ad_itens
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        MaxLength = 10
        ParentFont = False
        TabOrder = 27
        OnChange = dbedt_qt_mercadoriaChange
        OnExit = dbedt_nr_item_po2Exit
      end
      object dbedt_cd_unid_comerc2: TDBEdit
        Left = 114
        Top = 76
        Width = 34
        Height = 21
        DataField = 'CD_UN_MED_COMERC'
        DataSource = datm_DI_Itens.ds_ad_itens
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 2
        OnChange = dbedt_qt_mercadoriaChange
        OnExit = dbedt_cd_unid_comerc2Exit
        OnKeyDown = dbedt_cd_produtoKeyDown
      end
      object dbedt_cd_produto2: TDBEdit
        Left = 114
        Top = 13
        Width = 118
        Height = 21
        DataField = 'CD_MERCADORIA'
        DataSource = datm_DI_Itens.ds_ad_itens
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 0
        OnChange = dbedt_qt_mercadoriaChange
        OnExit = dbedt_cd_produtoExit
        OnKeyDown = dbedt_cd_produtoKeyDown
      end
      object dbedt_cd_pais_aquisicao2: TDBEdit
        Left = 468
        Top = 348
        Width = 41
        Height = 21
        DataField = 'CD_PAIS_AQUISICAO'
        DataSource = datm_DI_Itens.ds_ad_itens
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 17
        OnChange = dbedt_qt_mercadoriaChange
        OnExit = dbedt_cd_pais_aquisicao2Exit
        OnKeyDown = dbedt_cd_produtoKeyDown
      end
      object dbedt_cd_pais_origem2: TDBEdit
        Left = 468
        Top = 391
        Width = 41
        Height = 21
        DataField = 'CD_PAIS_ORIGEM'
        DataSource = datm_DI_Itens.ds_ad_itens
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 19
        OnChange = dbedt_qt_mercadoriaChange
        OnExit = dbedt_cd_pais_origem2Exit
        OnKeyDown = dbedt_cd_produtoKeyDown
      end
      object dbedt_cd_fabricante2: TDBEdit
        Left = 14
        Top = 391
        Width = 47
        Height = 21
        DataField = 'CD_FABRICANTE'
        DataSource = datm_DI_Itens.ds_ad_itens
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 18
        OnChange = dbedt_qt_mercadoriaChange
        OnExit = dbedt_cd_fabricante2Exit
        OnKeyDown = dbedt_cd_produtoKeyDown
      end
      object dbedt_cd_exportador2: TDBEdit
        Left = 14
        Top = 348
        Width = 47
        Height = 21
        DataField = 'CD_EXPORTADOR'
        DataSource = datm_DI_Itens.ds_ad_itens
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 16
        OnChange = dbedt_qt_mercadoriaChange
        OnExit = dbedt_cd_exportador2Exit
        OnKeyDown = dbedt_cd_produtoKeyDown
      end
      object CmbItens2: TComboBox
        Left = 644
        Top = 197
        Width = 50
        Height = 21
        Style = csDropDownList
        ItemHeight = 0
        Sorted = True
        TabOrder = 28
        OnChange = CmbItensChange
        OnClick = CmbItensClick
      end
      object CmbParciais2: TComboBox
        Left = 693
        Top = 197
        Width = 39
        Height = 21
        Style = csDropDownList
        ItemHeight = 0
        Sorted = True
        TabOrder = 29
        OnChange = CmbItensChange
      end
      object dbcbo_nr_po2: TDBComboBox
        Left = 519
        Top = 197
        Width = 125
        Height = 21
        Style = csDropDownList
        DataField = 'NR_PROC_PO'
        DataSource = datm_DI_Itens.ds_ad_itens
        ItemHeight = 13
        TabOrder = 30
        OnClick = dbedt_qt_mercadoriaChange
        OnExit = dbcbo_nr_poExit
      end
    end
    object ts_nve: TTabSheet
      Caption = 'NVE'
      object Panel1: TPanel
        Left = 0
        Top = 0
        Width = 781
        Height = 492
        Align = alClient
        BevelInner = bvLowered
        TabOrder = 0
        object Label40: TLabel
          Left = 11
          Top = 10
          Width = 28
          Height = 13
          Caption = 'NCM'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label41: TLabel
          Left = 11
          Top = 58
          Width = 32
          Height = 13
          Caption = 'N'#237'vel'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label42: TLabel
          Left = 251
          Top = 58
          Width = 45
          Height = 13
          Caption = 'Atributo'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label43: TLabel
          Left = 492
          Top = 58
          Width = 81
          Height = 13
          Caption = 'Especifica'#231#227'o'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object btn_co_nivel: TSpeedButton
          Left = 220
          Top = 70
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
          OnClick = btn_co_nivelClick
        end
        object btn_co_atrib: TSpeedButton
          Left = 461
          Top = 70
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
          OnClick = btn_co_atribClick
        end
        object btn_co_especif: TSpeedButton
          Left = 701
          Top = 70
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
          OnClick = btn_co_especifClick
        end
        object dbedt_cd_ncm_nve: TDBEdit
          Left = 11
          Top = 23
          Width = 120
          Height = 22
          TabStop = False
          AutoSize = False
          BevelInner = bvLowered
          BevelOuter = bvNone
          BevelKind = bkSoft
          Color = clMenu
          Ctl3D = False
          DataField = 'CD_NCM_SH'
          DataSource = datm_DI_Itens.ds_ad_itens
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentCtl3D = False
          ParentFont = False
          ReadOnly = True
          TabOrder = 0
          OnExit = dbedt_cd_ncmExit
          OnKeyDown = dbedt_cd_produtoKeyDown
        end
        object dbedt_nm_ncm_nve: TDBEdit
          Left = 132
          Top = 23
          Width = 594
          Height = 22
          TabStop = False
          AutoSize = False
          BevelInner = bvLowered
          BevelOuter = bvNone
          BevelKind = bkSoft
          Color = clMenu
          Ctl3D = False
          DataField = 'nm_ncm_'
          DataSource = datm_DI_Itens.ds_ad_itens
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          MaxLength = 11
          ParentCtl3D = False
          ParentFont = False
          ReadOnly = True
          TabOrder = 1
          OnChange = dbedt_qt_mercadoriaChange
          OnExit = dbedt_cd_ncmExit
          OnKeyDown = dbedt_cd_produtoKeyDown
        end
        object Panel2: TPanel
          Left = 2
          Top = 164
          Width = 777
          Height = 326
          Align = alBottom
          BevelOuter = bvNone
          BorderWidth = 4
          TabOrder = 2
          object DBGrid1: TDBGrid
            Left = 4
            Top = 4
            Width = 769
            Height = 318
            Align = alClient
            Ctl3D = False
            DataSource = datm_DI_Itens.ds_nve_
            Options = [dgTitles, dgIndicator, dgColLines, dgRowLines, dgRowSelect, dgAlwaysShowSelection]
            ParentCtl3D = False
            ReadOnly = True
            TabOrder = 0
            TitleFont.Charset = ANSI_CHARSET
            TitleFont.Color = clWindowText
            TitleFont.Height = -11
            TitleFont.Name = 'MS Sans Serif'
            TitleFont.Style = []
            Columns = <
              item
                Expanded = False
                FieldName = 'LookNivel'
                Title.Color = clBlack
                Title.Font.Charset = ANSI_CHARSET
                Title.Font.Color = clWhite
                Title.Font.Height = -11
                Title.Font.Name = 'MS Sans Serif'
                Title.Font.Style = [fsBold]
                Width = 103
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'CD_ATRIBUTO_NCM'
                Title.Color = clBlack
                Title.Font.Charset = ANSI_CHARSET
                Title.Font.Color = clWhite
                Title.Font.Height = -11
                Title.Font.Name = 'MS Sans Serif'
                Title.Font.Style = [fsBold]
                Width = 270
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'CD_ESPECIF_NCM'
                Title.Color = clBlack
                Title.Font.Charset = ANSI_CHARSET
                Title.Font.Color = clWhite
                Title.Font.Height = -11
                Title.Font.Name = 'MS Sans Serif'
                Title.Font.Style = [fsBold]
                Width = 302
                Visible = True
              end>
          end
        end
        object dbedt_nm_nivel: TDBEdit
          Left = 72
          Top = 71
          Width = 147
          Height = 21
          TabStop = False
          Color = clMenu
          DataField = 'LookNivel'
          DataSource = datm_DI_Itens.ds_nve_
          ReadOnly = True
          TabOrder = 3
        end
        object dbedt_nm_atrib: TDBEdit
          Left = 312
          Top = 71
          Width = 148
          Height = 21
          TabStop = False
          Color = clMenu
          DataField = 'LookAtrib'
          DataSource = datm_DI_Itens.ds_nve_
          ReadOnly = True
          TabOrder = 4
        end
        object dbedt_nm_especif: TDBEdit
          Left = 553
          Top = 71
          Width = 147
          Height = 21
          TabStop = False
          Color = clMenu
          DataField = 'LookEspecif'
          DataSource = datm_DI_Itens.ds_nve_
          ReadOnly = True
          TabOrder = 5
        end
        object dbedt_cd_espec: TDBEdit
          Left = 493
          Top = 71
          Width = 61
          Height = 21
          CharCase = ecUpperCase
          DataField = 'CD_ESPECIF_NCM'
          DataSource = datm_DI_Itens.ds_nve_
          TabOrder = 8
          OnChange = dbedt_cd_nivelChange
          OnEnter = dbedt_cd_especEnter
          OnExit = dbedt_cd_especExit
          OnKeyDown = dbedt_cd_produtoKeyDown
        end
        object dbedt_cd_nivel: TDBEdit
          Left = 11
          Top = 71
          Width = 62
          Height = 21
          CharCase = ecUpperCase
          DataField = 'CD_NIVEL_NVE'
          DataSource = datm_DI_Itens.ds_nve_
          TabOrder = 6
          OnChange = dbedt_cd_nivelChange
          OnExit = dbedt_cd_nivelExit
          OnKeyDown = dbedt_cd_produtoKeyDown
        end
        object dbedt_cd_atrib: TDBEdit
          Left = 250
          Top = 71
          Width = 63
          Height = 21
          CharCase = ecUpperCase
          DataField = 'CD_ATRIBUTO_NCM'
          DataSource = datm_DI_Itens.ds_nve_
          TabOrder = 7
          OnChange = dbedt_cd_nivelChange
          OnEnter = dbedt_cd_atribEnter
          OnExit = dbedt_cd_atribExit
          OnKeyDown = dbedt_cd_produtoKeyDown
        end
      end
    end
    object TabSheet1: TTabSheet
      Caption = 'Informa'#231#245'es para cliente'
      ImageIndex = 3
      OnShow = TabSheet1Show
      object Label46: TLabel
        Left = 15
        Top = 16
        Width = 106
        Height = 13
        Caption = 'Valor Unit'#225'rio FOB'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object lblTipoProcessoPhilips: TLabel
        Left = 15
        Top = 56
        Width = 86
        Height = 13
        Caption = 'Tipo Processo:'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object DBEdit1: TDBEdit
        Left = 126
        Top = 12
        Width = 117
        Height = 21
        DataField = 'VL_UNITARIO_FOB'
        DataSource = datm_DI_Itens.ds_ad_itens
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 0
        OnChange = dbedt_qt_mercadoriaChange
        OnEnter = dbedt_vl_unitarioEnter
        OnExit = dbedt_vl_unitarioExit
      end
      object edtTipoProcessoPhilips: TDBEdit
        Left = 126
        Top = 52
        Width = 117
        Height = 21
        DataField = 'TP_PROCESSO'
        DataSource = datm_DI_Itens.dtsIntegracaoPhilips
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 1
        OnChange = dbedt_qt_mercadoriaChange
        OnEnter = dbedt_vl_unitarioEnter
        OnExit = dbedt_vl_unitarioExit
      end
    end
    object ts_AcrescimoDeducao: TTabSheet
      Caption = 'Acr'#233'scimos / Dedu'#231#245'es'
      ImageIndex = 5
      object pnlAcrescimoDeducaop: TPanel
        Left = 0
        Top = 0
        Width = 781
        Height = 492
        Align = alClient
        TabOrder = 0
        object pgctrl_acres_dedu: TPageControl
          Left = 1
          Top = 1
          Width = 779
          Height = 240
          ActivePage = tbsht_valoracao_acrescimos
          Align = alTop
          TabOrder = 0
          object tbsht_valoracao_acrescimos: TTabSheet
            Caption = 'Ac&r'#233'scimos'
            object dbg_acrescimos: TDBGrid
              Left = 0
              Top = 0
              Width = 771
              Height = 212
              Align = alClient
              DataSource = datm_DI_Itens.ds_item_acrescimos
              Options = [dgEditing, dgTitles, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgCancelOnExit]
              TabOrder = 0
              TitleFont.Charset = ANSI_CHARSET
              TitleFont.Color = clWindowText
              TitleFont.Height = -11
              TitleFont.Name = 'MS Sans Serif'
              TitleFont.Style = []
              Columns = <
                item
                  Expanded = False
                  FieldName = 'Look_nm_acrescimo'
                  Title.Color = clBlack
                  Title.Font.Charset = DEFAULT_CHARSET
                  Title.Font.Color = clWhite
                  Title.Font.Height = -11
                  Title.Font.Name = 'MS Sans Serif'
                  Title.Font.Style = [fsBold]
                  Width = 362
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'CD_MD_NEGOC_ACRES'
                  Title.Color = clBlack
                  Title.Font.Charset = DEFAULT_CHARSET
                  Title.Font.Color = clWhite
                  Title.Font.Height = -11
                  Title.Font.Name = 'MS Sans Serif'
                  Title.Font.Style = [fsBold]
                  Visible = True
                end
                item
                  Alignment = taRightJustify
                  Expanded = False
                  FieldName = 'VL_ACRESCIMO_MOEDA'
                  Title.Color = clBlack
                  Title.Font.Charset = DEFAULT_CHARSET
                  Title.Font.Color = clWhite
                  Title.Font.Height = -11
                  Title.Font.Name = 'MS Sans Serif'
                  Title.Font.Style = [fsBold]
                  Width = 64
                  Visible = True
                end
                item
                  Alignment = taRightJustify
                  Expanded = False
                  FieldName = 'VL_ACRESCIMO_MN'
                  ReadOnly = True
                  Title.Color = clBlack
                  Title.Font.Charset = DEFAULT_CHARSET
                  Title.Font.Color = clWhite
                  Title.Font.Height = -11
                  Title.Font.Name = 'MS Sans Serif'
                  Title.Font.Style = [fsBold]
                  Width = 64
                  Visible = True
                end>
            end
          end
          object tbsht_valoracao_deducoes: TTabSheet
            Caption = 'D&edu'#231#245'es'
            object dbg_deducoes: TDBGrid
              Left = 0
              Top = 0
              Width = 731
              Height = 212
              Align = alClient
              DataSource = datm_DI_Itens.ds_item_deducoes
              Options = [dgEditing, dgTitles, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgCancelOnExit]
              TabOrder = 0
              TitleFont.Charset = ANSI_CHARSET
              TitleFont.Color = clWindowText
              TitleFont.Height = -11
              TitleFont.Name = 'MS Sans Serif'
              TitleFont.Style = []
              Columns = <
                item
                  Expanded = False
                  FieldName = 'Look_nm_deducao'
                  Title.Color = clBlack
                  Title.Font.Charset = DEFAULT_CHARSET
                  Title.Font.Color = clWhite
                  Title.Font.Height = -11
                  Title.Font.Name = 'MS Sans Serif'
                  Title.Font.Style = [fsBold]
                  Width = 362
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'CD_MD_NEGOC_DEDUC'
                  Title.Color = clBlack
                  Title.Font.Charset = DEFAULT_CHARSET
                  Title.Font.Color = clWhite
                  Title.Font.Height = -11
                  Title.Font.Name = 'MS Sans Serif'
                  Title.Font.Style = [fsBold]
                  Visible = True
                end
                item
                  Alignment = taRightJustify
                  Expanded = False
                  FieldName = 'VL_DEDUCAO_MNEG'
                  Title.Color = clBlack
                  Title.Font.Charset = DEFAULT_CHARSET
                  Title.Font.Color = clWhite
                  Title.Font.Height = -11
                  Title.Font.Name = 'MS Sans Serif'
                  Title.Font.Style = [fsBold]
                  Width = 64
                  Visible = True
                end
                item
                  Alignment = taRightJustify
                  Expanded = False
                  FieldName = 'VL_DEDUCAO_MN'
                  ReadOnly = True
                  Title.Color = clBlack
                  Title.Font.Charset = DEFAULT_CHARSET
                  Title.Font.Color = clWhite
                  Title.Font.Height = -11
                  Title.Font.Name = 'MS Sans Serif'
                  Title.Font.Style = [fsBold]
                  Width = 64
                  Visible = True
                end>
            end
          end
        end
      end
    end
    object tsAtributos: TTabSheet
      Caption = 'Duimp (Atributos)'
      ImageIndex = 6
      object pgcAtributos: TPageControl
        Left = 0
        Top = 0
        Width = 781
        Height = 492
        ActivePage = tsAtributoDuimp
        Align = alClient
        TabOrder = 0
        object tsAtributoDuimp: TTabSheet
          Caption = 'Atributos da Duimp'
          object Panel4: TPanel
            Left = 0
            Top = 0
            Width = 773
            Height = 464
            Align = alClient
            TabOrder = 0
            object Panel5: TPanel
              Left = 1
              Top = 1
              Width = 771
              Height = 280
              Align = alTop
              TabOrder = 0
              object lblAtributo: TLabel
                Left = 15
                Top = 44
                Width = 45
                Height = 13
                Caption = 'Atributo'
                Font.Charset = ANSI_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = [fsBold]
                ParentFont = False
              end
              object Label48: TLabel
                Left = 206
                Top = 44
                Width = 30
                Height = 13
                Caption = 'Valor'
                Font.Charset = ANSI_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = [fsBold]
                ParentFont = False
              end
              object Label49: TLabel
                Left = 15
                Top = 146
                Width = 104
                Height = 13
                Caption = 'Atributo Condicionado'
              end
              object Label50: TLabel
                Left = 16
                Top = 188
                Width = 28
                Height = 13
                Caption = 'Nome'
              end
              object Label51: TLabel
                Left = 300
                Top = 186
                Width = 97
                Height = 13
                Caption = 'Nome Apresenta'#231#227'o'
              end
              object Label52: TLabel
                Left = 300
                Top = 146
                Width = 95
                Height = 13
                Caption = 'Data Inicio Vig'#234'ncia'
              end
              object Label53: TLabel
                Left = 158
                Top = 144
                Width = 118
                Height = 13
                Caption = 'Forma de Preenchimento'
              end
              object Label54: TLabel
                Left = 16
                Top = 226
                Width = 141
                Height = 13
                Caption = 'Orienta'#231#227'o de Preenchimento'
              end
              object Label55: TLabel
                Left = 444
                Top = 146
                Width = 84
                Height = 13
                Caption = 'Tamanho M'#225'ximo'
              end
              object Label56: TLabel
                Left = 587
                Top = 146
                Width = 34
                Height = 13
                Caption = 'Org'#227'os'
              end
              object Label57: TLabel
                Left = 587
                Top = 186
                Width = 96
                Height = 13
                Caption = 'Descri'#231#227'o Condi'#231#227'o'
              end
              object lblNcmAtributoDominios: TLabel
                Left = 206
                Top = 106
                Width = 165
                Height = 13
                Caption = 'Selecione o valor do atributo'
                Font.Charset = ANSI_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = [fsBold]
                ParentFont = False
              end
              object Label58: TLabel
                Left = 15
                Top = 106
                Width = 51
                Height = 13
                Caption = 'Obrigat'#243'rio'
              end
              object Label59: TLabel
                Left = 109
                Top = 106
                Width = 68
                Height = 13
                Caption = 'Condicionante'
              end
              object dbeAtributoDuimp: TDBEdit
                Left = 15
                Top = 59
                Width = 173
                Height = 21
                DataField = 'CD_ATRIBUTO'
                DataSource = datm_DI_Itens.dsAtributoDuimp
                Font.Charset = ANSI_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = [fsBold]
                ParentFont = False
                TabOrder = 0
                OnChange = dbeAtributoDuimpChange
              end
              object txtAtributoDuimpDominio: TDBMemo
                Left = 208
                Top = 59
                Width = 513
                Height = 43
                DataField = 'VL_ATRIBUTO'
                DataSource = datm_DI_Itens.dsAtributoDuimp
                TabOrder = 1
                OnChange = dbeAtributoDuimpChange
              end
              object cbxNcmAtributoDominios: TComboBox
                Left = 208
                Top = 121
                Width = 514
                Height = 21
                ItemHeight = 13
                TabOrder = 2
                Visible = False
                OnChange = cbxNcmAtributoDominiosChange
              end
              object dbedtAtributoCondicionado: TDBEdit
                Left = 15
                Top = 161
                Width = 135
                Height = 21
                Color = cl3DLight
                DataField = 'AtributoCondicionado'
                DataSource = datm_DI_Itens.dsAtributoDuimpCad
                Font.Charset = ANSI_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                ParentFont = False
                ReadOnly = True
                TabOrder = 3
                OnChange = dbeAtributoDuimpChange
              end
              object DBEdit3: TDBEdit
                Left = 16
                Top = 201
                Width = 278
                Height = 21
                Color = cl3DLight
                DataField = 'Nome'
                DataSource = datm_DI_Itens.dsAtributoDuimpCad
                Font.Charset = ANSI_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                ParentFont = False
                ReadOnly = True
                TabOrder = 4
                OnChange = dbeAtributoDuimpChange
              end
              object DBEdit4: TDBEdit
                Left = 300
                Top = 201
                Width = 280
                Height = 21
                Color = cl3DLight
                DataField = 'NomeApresentacao'
                DataSource = datm_DI_Itens.dsAtributoDuimpCad
                Font.Charset = ANSI_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                ParentFont = False
                ReadOnly = True
                TabOrder = 5
                OnChange = dbeAtributoDuimpChange
              end
              object DBEdit5: TDBEdit
                Left = 300
                Top = 161
                Width = 135
                Height = 21
                Color = cl3DLight
                DataField = 'DataInicioVigencia'
                DataSource = datm_DI_Itens.dsAtributoDuimpCad
                Font.Charset = ANSI_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                ParentFont = False
                ReadOnly = True
                TabOrder = 6
                OnChange = dbeAtributoDuimpChange
              end
              object DBEdit6: TDBEdit
                Left = 158
                Top = 161
                Width = 135
                Height = 21
                Color = cl3DLight
                DataField = 'FormaPreenchimento'
                DataSource = datm_DI_Itens.dsAtributoDuimpCad
                Font.Charset = ANSI_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                ParentFont = False
                ReadOnly = True
                TabOrder = 7
                OnChange = dbeAtributoDuimpChange
              end
              object DBEdit7: TDBEdit
                Left = 16
                Top = 241
                Width = 706
                Height = 21
                Color = cl3DLight
                DataField = 'OrientacaoPreenchimento'
                DataSource = datm_DI_Itens.dsAtributoDuimpCad
                Font.Charset = ANSI_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                ParentFont = False
                ReadOnly = True
                TabOrder = 8
                OnChange = dbeAtributoDuimpChange
              end
              object DBEdit8: TDBEdit
                Left = 444
                Top = 161
                Width = 135
                Height = 21
                Color = cl3DLight
                DataField = 'TamanhoMaximo'
                DataSource = datm_DI_Itens.dsAtributoDuimpCad
                Font.Charset = ANSI_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                ParentFont = False
                ReadOnly = True
                TabOrder = 9
                OnChange = dbeAtributoDuimpChange
              end
              object DBEdit9: TDBEdit
                Left = 587
                Top = 161
                Width = 135
                Height = 21
                Color = cl3DLight
                DataField = 'Orgaos'
                DataSource = datm_DI_Itens.dsAtributoDuimpCad
                Font.Charset = ANSI_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                ParentFont = False
                ReadOnly = True
                TabOrder = 10
                OnChange = dbeAtributoDuimpChange
              end
              object DBEdit11: TDBEdit
                Left = 587
                Top = 201
                Width = 135
                Height = 21
                Color = cl3DLight
                DataField = 'DescricaoCondicao'
                DataSource = datm_DI_Itens.dsAtributoDuimpCad
                Font.Charset = ANSI_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                ParentFont = False
                ReadOnly = True
                TabOrder = 11
                OnChange = dbeAtributoDuimpChange
              end
              object edtObrigatorio: TEdit
                Left = 15
                Top = 121
                Width = 80
                Height = 21
                Color = cl3DLight
                Font.Charset = ANSI_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                ParentFont = False
                TabOrder = 12
              end
              object edtCondicionante: TEdit
                Left = 109
                Top = 121
                Width = 80
                Height = 21
                Color = cl3DLight
                Font.Charset = ANSI_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                ParentFont = False
                TabOrder = 13
              end
              object BitBtn1: TBitBtn
                Left = 17
                Top = 9
                Width = 112
                Height = 25
                Caption = 'Consultar Atributos'
                TabOrder = 14
                OnClick = BitBtn1Click
              end
            end
            object Panel6: TPanel
              Left = 1
              Top = 281
              Width = 771
              Height = 182
              Align = alClient
              TabOrder = 1
              object dbgAtributosDuimp: TDBGrid
                Left = 1
                Top = 1
                Width = 769
                Height = 180
                Align = alClient
                DataSource = datm_DI_Itens.dsAtributoDuimp
                TabOrder = 0
                TitleFont.Charset = ANSI_CHARSET
                TitleFont.Color = clWindowText
                TitleFont.Height = -11
                TitleFont.Name = 'MS Sans Serif'
                TitleFont.Style = []
                Columns = <
                  item
                    Expanded = False
                    FieldName = 'CD_ATRIBUTO'
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'VL_ATRIBUTO'
                    Width = 600
                    Visible = True
                  end>
              end
            end
          end
        end
        object tsAtributoTributario: TTabSheet
          Caption = 'Atributos Tribut'#225'rios'
          ImageIndex = 1
          object Panel7: TPanel
            Left = 0
            Top = 0
            Width = 773
            Height = 464
            Align = alClient
            TabOrder = 0
            object Panel8: TPanel
              Left = 1
              Top = 1
              Width = 771
              Height = 64
              Align = alTop
              TabOrder = 0
              object btnAtributosTributarios: TBitBtn
                Left = 17
                Top = 17
                Width = 184
                Height = 32
                Caption = 'Consultar Atributos Tribut'#225'rios'
                TabOrder = 0
                OnClick = btnAtributosTributariosClick
              end
              object btnAtualizarAtributosTributarios: TBitBtn
                Left = 608
                Top = 17
                Width = 105
                Height = 32
                Caption = 'Atualizar'
                TabOrder = 1
                Visible = False
                OnClick = btnAtualizarAtributosTributariosClick
                Glyph.Data = {
                  36090000424D3609000000000000360000002800000018000000180000000100
                  20000000000000090000C30E0000C30E00000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  00000000000000000000000000000000000000000000000000007EB232177DB0
                  325E7DB032560000000000000000000000007FB3330C00000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  00000000000000000000000000000000000000000000709F2BF6709F2BFF709F
                  2BFF709F2BFF709F2BFF709F2BBD00000000709F2BFF85BB3304000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  000000000000000000000000000000000000709F2BFF709F2BFF75A62E400000
                  000000000000709F2B99709F2BFF709F2BE8709F2BFF00000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000709F2BC3709F2BFF00000000000000000000
                  000000000000709F2B6E709F2BFF709F2BFF709F2BFF00000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000709F2BFF709F2BFF00000000000000000000
                  000000000000709F2BFF709F2BFF709F2BFF709F2BFF0000000084AC4AFF84AC
                  4AFF84AC4AFF84AC4AFF84AC4AFF84AC4AFF84AC4AFF84AC4AFF84AC4AFF84AC
                  4AFF84AC4AFF84AC4AB000000000000000000000000000000000000000000000
                  000000000000000000000000000000000000000000000000000085AD4BFFF8FA
                  F5FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                  FFFFFFFFFFFFFFFFFF8200000000709F2BFF709F2BFF709F2BFF709F2BFF0000
                  00000000000000000000F8FAF50B709F2BFF709F2BFF0000000085AD4BFFFFFF
                  FFFFFEFEFEFEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFCFCF
                  CFFFA8A8A8FE9D9D9D8100000000709F2BFF709F2BFF709F2BFF709F2B6E0000
                  0000000000000000000000000000709F2BFF709F2BC30000000085AD4BFFFFFF
                  FFFFADADADFF969696FF969696FF969696FF969696FFAEAEAEFFFFFFFFFFEBEB
                  EBFFB4B4B4FEA3A3A38100000000709F2BFF709F2BE8709F2BFF709F2B990000
                  00000000000075A62E40709F2BFF709F2BFF000000000000000085AD4BFFFFFF
                  FFFFFDFDFDFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                  FFFFEDEDEDFFD5D5D5A185BB3304709F2BFF00000000709F2BBD709F2BFF709F
                  2BFF709F2BFF709F2BFF709F2BF600000000000000000000000085AD4BFFFFFF
                  FFFFFEFEFEFEFFFFFFFFFEFEFEFFFEFEFEFFFFFFFFFFFEFEFEFFFEFEFEFFFEFE
                  FEFFFEFEFEFFFEFEFEFDFEFEFE617FB3330C9A9A9A0296969617000000007DB0
                  32567DB0325E7EB23217FFFFFF0B84AC4A83000000000000000085AD4BFFFFFF
                  FFFFABABABFF969696FF969696FF969696FF969696FF969696FF969696FF9696
                  96FF969696FF969696FFA5A5A5FEE3E3E3A0969696B2F9F9F9F9FFFFFFB9FFFF
                  FF86FFFFFF81969696ABFFFFFFEF85AD4BFF000000000000000085AD4BFFFFFF
                  FFFFFEFEFEFFFFFFFFFFFEFEFEFFFEFEFEFFFEFEFEFFFEFEFEFFFFFFFFFFFFFF
                  FFFFFEFEFEFEFEFEFEFEFEFEFEFEFFFFFFFF9B9B9BFF969696FF969696FF9696
                  96FF969696FF9B9B9BFFFFFFFFFF84AC4AFE000000000000000085AD4BFFFFFF
                  FFFFAEAEAEFF969696FF969696FF969696FF969696FF969696FF969696FFFFFF
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFF84AC4AFE000000000000000085AD4BFFFFFF
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFF84AC4AFE000000000000000085AD4BFFFFFF
                  FFFFAEAEAEFF969696FF969696FF969696FF969696FFAEAEAEFFFFFFFFFFFFFF
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFAEAEAEFF969696FF969696FF9696
                  96FFAEAEAEFFFFFFFFFFFFFFFFFF85AD4BFF000000000000000085AD4BFFF5F8
                  F0FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                  FFFFFFFFFFFFFFFFFFFFF5F8F0FF84AC4AFE000000000000000085AD4BFF84AC
                  4AFE84AC4AFE85AD4BFF84AC4AFE84AC4AFE85AD4BFF84AC4AFE85AD4BFF85AD
                  4BFF84AC4AFE84AC4AFE84AC4AFE85AD4BFF84AC4AFE84AC4AFE85AD4BFF84AC
                  4AFE84AC4AFE85AD4BFF84AC4AFE84AC4AFE000000000000000085AD4BFF84AC
                  4AFF84AC4AFF85AD4BFF84AC4AFF84AC4AFF85AD4BFF84AC4AFF85AD4BFF85AD
                  4BFF84AC4AFF84AC4AFF84AC4AFF85AD4BFF84AC4AFF84AC4AFF85AD4BFF84AC
                  4AFF84AC4AFF85AD4BFF84AC4AFF84AC4AFF000000000000000085AD4BFF84AC
                  4AFE84AC4AFE85AD4BFF84AC4AFE84AC4AFE85AD4BFF84AC4AFE85AD4BFF85AD
                  4BFF84AC4AFE84AC4AFE84AC4AFE85AD4BFF84AC4AFE84AC4AFE85AD4BFF84AC
                  4AFE84AC4AFE85AD4BFF84AC4AFE84AC4AFE0000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000}
              end
            end
            object Panel9: TPanel
              Left = 1
              Top = 65
              Width = 771
              Height = 398
              Align = alClient
              TabOrder = 1
              object grdAtributoTributario: TDBGrid
                Left = 1
                Top = 1
                Width = 769
                Height = 396
                Align = alClient
                DataSource = datm_DI_Itens.dsAtributosTributarios
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                ParentFont = False
                ReadOnly = True
                TabOrder = 0
                TitleFont.Charset = DEFAULT_CHARSET
                TitleFont.Color = clWindowText
                TitleFont.Height = -11
                TitleFont.Name = 'MS Sans Serif'
                TitleFont.Style = [fsBold]
                OnKeyPress = grdAtributoTributarioKeyPress
                Columns = <
                  item
                    Expanded = False
                    FieldName = 'TributoNome'
                    Title.Caption = 'Tributo'
                    Width = 80
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'RegimeCodigo'
                    Title.Caption = 'Regime'
                    Width = 50
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'FundamentoCodigo'
                    Title.Caption = 'Fundamento'
                    Width = 75
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'FundamentoNome'
                    Title.Caption = 'Fundamento'
                    Width = 120
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'AtributoCodigo'
                    Title.Caption = 'Atributo'
                    Width = 70
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'AtributoDescricaoCodigo'
                    Title.Caption = 'Atributo'
                    Width = 120
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'AtributoValor'
                    Title.Caption = 'Valor'
                    Width = 60
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'AtributoDescricaoValor'
                    Title.Caption = 'Valor'
                    Width = 8000
                    Visible = True
                  end>
              end
            end
          end
        end
        object tsAtributoFundamento: TTabSheet
          Caption = 'Atributos do Fundamento'
          ImageIndex = 2
          object Panel10: TPanel
            Left = 0
            Top = 0
            Width = 773
            Height = 464
            Align = alClient
            TabOrder = 0
            object pnlMenuAtributoFundamento: TPanel
              Left = 1
              Top = 1
              Width = 771
              Height = 64
              Align = alTop
              TabOrder = 0
              object btnAtributosFundamento: TBitBtn
                Left = 17
                Top = 17
                Width = 208
                Height = 32
                Caption = 'Consultar Atributos Fundamento'
                TabOrder = 0
                OnClick = btnAtributosFundamentoClick
              end
              object btnAtualizarAtributosFundamento: TBitBtn
                Left = 608
                Top = 17
                Width = 105
                Height = 32
                Caption = 'Atualizar'
                TabOrder = 1
                Visible = False
                OnClick = btnAtualizarAtributosFundamentoClick
                Glyph.Data = {
                  36090000424D3609000000000000360000002800000018000000180000000100
                  20000000000000090000C30E0000C30E00000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  00000000000000000000000000000000000000000000000000007EB232177DB0
                  325E7DB032560000000000000000000000007FB3330C00000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  00000000000000000000000000000000000000000000709F2BF6709F2BFF709F
                  2BFF709F2BFF709F2BFF709F2BBD00000000709F2BFF85BB3304000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  000000000000000000000000000000000000709F2BFF709F2BFF75A62E400000
                  000000000000709F2B99709F2BFF709F2BE8709F2BFF00000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000709F2BC3709F2BFF00000000000000000000
                  000000000000709F2B6E709F2BFF709F2BFF709F2BFF00000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000709F2BFF709F2BFF00000000000000000000
                  000000000000709F2BFF709F2BFF709F2BFF709F2BFF0000000084AC4AFF84AC
                  4AFF84AC4AFF84AC4AFF84AC4AFF84AC4AFF84AC4AFF84AC4AFF84AC4AFF84AC
                  4AFF84AC4AFF84AC4AB000000000000000000000000000000000000000000000
                  000000000000000000000000000000000000000000000000000085AD4BFFF8FA
                  F5FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                  FFFFFFFFFFFFFFFFFF8200000000709F2BFF709F2BFF709F2BFF709F2BFF0000
                  00000000000000000000F8FAF50B709F2BFF709F2BFF0000000085AD4BFFFFFF
                  FFFFFEFEFEFEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFCFCF
                  CFFFA8A8A8FE9D9D9D8100000000709F2BFF709F2BFF709F2BFF709F2B6E0000
                  0000000000000000000000000000709F2BFF709F2BC30000000085AD4BFFFFFF
                  FFFFADADADFF969696FF969696FF969696FF969696FFAEAEAEFFFFFFFFFFEBEB
                  EBFFB4B4B4FEA3A3A38100000000709F2BFF709F2BE8709F2BFF709F2B990000
                  00000000000075A62E40709F2BFF709F2BFF000000000000000085AD4BFFFFFF
                  FFFFFDFDFDFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                  FFFFEDEDEDFFD5D5D5A185BB3304709F2BFF00000000709F2BBD709F2BFF709F
                  2BFF709F2BFF709F2BFF709F2BF600000000000000000000000085AD4BFFFFFF
                  FFFFFEFEFEFEFFFFFFFFFEFEFEFFFEFEFEFFFFFFFFFFFEFEFEFFFEFEFEFFFEFE
                  FEFFFEFEFEFFFEFEFEFDFEFEFE617FB3330C9A9A9A0296969617000000007DB0
                  32567DB0325E7EB23217FFFFFF0B84AC4A83000000000000000085AD4BFFFFFF
                  FFFFABABABFF969696FF969696FF969696FF969696FF969696FF969696FF9696
                  96FF969696FF969696FFA5A5A5FEE3E3E3A0969696B2F9F9F9F9FFFFFFB9FFFF
                  FF86FFFFFF81969696ABFFFFFFEF85AD4BFF000000000000000085AD4BFFFFFF
                  FFFFFEFEFEFFFFFFFFFFFEFEFEFFFEFEFEFFFEFEFEFFFEFEFEFFFFFFFFFFFFFF
                  FFFFFEFEFEFEFEFEFEFEFEFEFEFEFFFFFFFF9B9B9BFF969696FF969696FF9696
                  96FF969696FF9B9B9BFFFFFFFFFF84AC4AFE000000000000000085AD4BFFFFFF
                  FFFFAEAEAEFF969696FF969696FF969696FF969696FF969696FF969696FFFFFF
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFF84AC4AFE000000000000000085AD4BFFFFFF
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFF84AC4AFE000000000000000085AD4BFFFFFF
                  FFFFAEAEAEFF969696FF969696FF969696FF969696FFAEAEAEFFFFFFFFFFFFFF
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFAEAEAEFF969696FF969696FF9696
                  96FFAEAEAEFFFFFFFFFFFFFFFFFF85AD4BFF000000000000000085AD4BFFF5F8
                  F0FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                  FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                  FFFFFFFFFFFFFFFFFFFFF5F8F0FF84AC4AFE000000000000000085AD4BFF84AC
                  4AFE84AC4AFE85AD4BFF84AC4AFE84AC4AFE85AD4BFF84AC4AFE85AD4BFF85AD
                  4BFF84AC4AFE84AC4AFE84AC4AFE85AD4BFF84AC4AFE84AC4AFE85AD4BFF84AC
                  4AFE84AC4AFE85AD4BFF84AC4AFE84AC4AFE000000000000000085AD4BFF84AC
                  4AFF84AC4AFF85AD4BFF84AC4AFF84AC4AFF85AD4BFF84AC4AFF85AD4BFF85AD
                  4BFF84AC4AFF84AC4AFF84AC4AFF85AD4BFF84AC4AFF84AC4AFF85AD4BFF84AC
                  4AFF84AC4AFF85AD4BFF84AC4AFF84AC4AFF000000000000000085AD4BFF84AC
                  4AFE84AC4AFE85AD4BFF84AC4AFE84AC4AFE85AD4BFF84AC4AFE85AD4BFF85AD
                  4BFF84AC4AFE84AC4AFE84AC4AFE85AD4BFF84AC4AFE84AC4AFE85AD4BFF84AC
                  4AFE84AC4AFE85AD4BFF84AC4AFE84AC4AFE0000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000}
              end
            end
            object pnlgrdAtributoFundamento: TPanel
              Left = 1
              Top = 65
              Width = 771
              Height = 398
              Align = alClient
              TabOrder = 1
              object grdAtributoFundamento: TDBGrid
                Left = 1
                Top = 1
                Width = 769
                Height = 396
                Align = alClient
                DataSource = datm_DI_Itens.dsAtributosFundamento
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                ParentFont = False
                ReadOnly = True
                TabOrder = 0
                TitleFont.Charset = DEFAULT_CHARSET
                TitleFont.Color = clWindowText
                TitleFont.Height = -11
                TitleFont.Name = 'MS Sans Serif'
                TitleFont.Style = [fsBold]
                Columns = <
                  item
                    Expanded = False
                    FieldName = 'AtributoCodigo'
                    Width = 153
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'AtributoNome'
                    Width = 197
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'AtributoValor'
                    Width = 138
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'AtributoDescricaoValor'
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'FundamentoCodigo'
                    Width = 64
                    Visible = True
                  end>
              end
            end
          end
        end
        object TabSheet2: TTabSheet
          Caption = 'Descri'#231#227'o de Mercadoria'
          ImageIndex = 3
          object Label60: TLabel
            Left = 17
            Top = 18
            Width = 224
            Height = 13
            Caption = 'Descri'#231#227'o complementar da mercadoria'
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object memDescricaoComplementarMercadoria: TDBMemo
            Left = 16
            Top = 36
            Width = 513
            Height = 118
            DataField = 'TX_DESC_COMPLEMENTAR'
            DataSource = datm_DI_Itens.ds_ad_itens
            TabOrder = 0
            OnChange = memDescricaoComplementarMercadoriaChange
          end
        end
      end
    end
    object tsTributos: TTabSheet
      Caption = 'Tributos'
      ImageIndex = 6
      object GroupBox11: TGroupBox
        Left = 15
        Top = 15
        Width = 340
        Height = 170
        Caption = ' Valores Adicionais  '
        TabOrder = 0
        object lbl_valor_is: TLabel
          Left = 13
          Top = 29
          Width = 37
          Height = 13
          Caption = 'Valor IS'
        end
        object lbl_valor_CIDE: TLabel
          Left = 13
          Top = 56
          Width = 52
          Height = 13
          Caption = 'Valor CIDE'
        end
        object lbl_valor_dir_comp: TLabel
          Left = 13
          Top = 83
          Width = 139
          Height = 13
          Caption = 'Valor Direitos compensat'#243'rios'
        end
        object lbl_valor_med_salv: TLabel
          Left = 13
          Top = 110
          Width = 128
          Height = 13
          Caption = 'Valor Medidas salvaguarda'
        end
        object lbl_valor_outros_trib: TLabel
          Left = 13
          Top = 137
          Width = 95
          Height = 13
          Caption = 'Valor Outros tributos'
        end
        object dbedt_valor_is: TDBEdit
          Left = 200
          Top = 25
          Width = 120
          Height = 21
          DataField = 'VL_IS'
          DataSource = datm_DI_Itens.ds_ad_itens
          TabOrder = 0
          OnChange = dbedt_qt_mercadoriaChange
        end
        object dbedt_valor_CIDE: TDBEdit
          Left = 200
          Top = 52
          Width = 120
          Height = 21
          DataField = 'VL_CIDE'
          DataSource = datm_DI_Itens.ds_ad_itens
          TabOrder = 1
          OnChange = dbedt_qt_mercadoriaChange
        end
        object dbedt_valor_dir_comp: TDBEdit
          Left = 200
          Top = 79
          Width = 120
          Height = 21
          DataField = 'VL_DIR_COMP'
          DataSource = datm_DI_Itens.ds_ad_itens
          TabOrder = 2
          OnChange = dbedt_qt_mercadoriaChange
        end
        object dbedt_valor_med_salv: TDBEdit
          Left = 200
          Top = 106
          Width = 120
          Height = 21
          DataField = 'VL_MED_SAL'
          DataSource = datm_DI_Itens.ds_ad_itens
          TabOrder = 3
          OnChange = dbedt_qt_mercadoriaChange
        end
        object dbedt_valor_outros_trib: TDBEdit
          Left = 200
          Top = 133
          Width = 120
          Height = 21
          DataField = 'VL_OUTROS_TRIB'
          DataSource = datm_DI_Itens.ds_ad_itens
          TabOrder = 4
          OnChange = dbedt_qt_mercadoriaChange
        end
      end
      object GroupBox13: TGroupBox
        Left = 370
        Top = 15
        Width = 340
        Height = 170
        Caption = ' Valores Calculados '
        TabOrder = 1
        object lbl_base_ibs_cbs: TLabel
          Left = 13
          Top = 29
          Width = 135
          Height = 13
          Caption = 'Valor Base C'#225'lculo IBS/CBS'
        end
        object lbl_valor_ibs_municipio: TLabel
          Left = 13
          Top = 83
          Width = 92
          Height = 13
          Caption = 'Valor IBS Municipio'
        end
        object lbl_valor_ibs_uf: TLabel
          Left = 13
          Top = 56
          Width = 61
          Height = 13
          Caption = 'Valor IBS UF'
        end
        object lbl_valor_cbs: TLabel
          Left = 13
          Top = 110
          Width = 48
          Height = 13
          Caption = 'Valor CBS'
        end
        object dbedt_base_ibs_cbs: TDBEdit
          Left = 200
          Top = 25
          Width = 120
          Height = 21
          DataField = 'VL_BASE_IBS_CBS'
          DataSource = datm_DI_Itens.ds_ad_itens
          Enabled = False
          ReadOnly = True
          TabOrder = 0
          OnChange = dbedt_qt_mercadoriaChange
        end
        object dbedt_valor_ibs_municipio: TDBEdit
          Left = 200
          Top = 79
          Width = 120
          Height = 21
          DataField = 'VL_IBS_MUN'
          DataSource = datm_DI_Itens.ds_ad_itens
          Enabled = False
          ReadOnly = True
          TabOrder = 2
          OnChange = dbedt_qt_mercadoriaChange
        end
        object dbedt_valor_ibs_uf: TDBEdit
          Left = 200
          Top = 52
          Width = 120
          Height = 21
          DataField = 'VL_IBS_UF'
          DataSource = datm_DI_Itens.ds_ad_itens
          Enabled = False
          ReadOnly = True
          TabOrder = 1
          OnChange = dbedt_qt_mercadoriaChange
        end
        object dbedt_valor_cbs: TDBEdit
          Left = 200
          Top = 106
          Width = 120
          Height = 21
          DataField = 'VL_CBS'
          DataSource = datm_DI_Itens.ds_ad_itens
          Enabled = False
          ReadOnly = True
          TabOrder = 3
          OnChange = dbedt_qt_mercadoriaChange
        end
      end
    end
    object tsLPCO: TTabSheet
      Caption = 'LPCO'
      ImageIndex = 7
      object pnl: TPanel
        Left = 0
        Top = 0
        Width = 781
        Height = 492
        Align = alClient
        BevelInner = bvLowered
        TabOrder = 0
        object lbl3: TLabel
          Left = 18
          Top = 21
          Width = 33
          Height = 13
          Caption = 'LPCO'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object pnl1: TPanel
          Left = 2
          Top = 96
          Width = 777
          Height = 394
          Align = alBottom
          BevelOuter = bvNone
          BorderWidth = 4
          TabOrder = 0
          object dbgrd1: TDBGrid
            Left = 4
            Top = 4
            Width = 769
            Height = 386
            Align = alClient
            Ctl3D = False
            DataSource = datm_DI_Itens.dsLPCO
            Options = [dgTitles, dgIndicator, dgColLines, dgRowLines, dgRowSelect, dgAlwaysShowSelection]
            ParentCtl3D = False
            ReadOnly = True
            TabOrder = 0
            TitleFont.Charset = ANSI_CHARSET
            TitleFont.Color = clWindowText
            TitleFont.Height = -11
            TitleFont.Name = 'MS Sans Serif'
            TitleFont.Style = []
            Columns = <
              item
                Expanded = False
                FieldName = 'NrLPCO'
                Title.Caption = 'LPCO'
                Width = 201
                Visible = True
              end>
          end
        end
        object cbbLPCO: TComboBox
          Left = 16
          Top = 40
          Width = 193
          Height = 21
          ItemHeight = 0
          TabOrder = 1
        end
        object btnIncluirLPCO: TButton
          Left = 216
          Top = 38
          Width = 105
          Height = 25
          Caption = 'Incluir LPCO'
          TabOrder = 2
          OnClick = btnIncluirLPCOClick
        end
        object btnExcluirLPCO: TButton
          Left = 680
          Top = 70
          Width = 92
          Height = 25
          Caption = 'Excluir LPCO'
          TabOrder = 3
          OnClick = btnExcluirLPCOClick
        end
      end
    end
  end
  object menu_manut_cadastro: TMainMenu
    Left = 736
    Top = 52
    object mi_novo: TMenuItem
      Caption = '&Novo'
      OnClick = btn_novo_itemClick
    end
    object mi_salvar: TMenuItem
      Caption = '&Salvar'
      OnClick = btn_salvarClick
    end
    object mi_cancelar: TMenuItem
      Caption = '&Cancelar'
      OnClick = btn_cancelarClick
    end
    object mi_excluir: TMenuItem
      Caption = '&Excluir'
      Hint = 'Excluir'
      OnClick = btn_excluirClick
    end
    object mi_duplicar: TMenuItem
      Caption = '&Duplicar'
      Enabled = False
      Hint = 'Duplicar'
      OnClick = btn_duplicaClick
    end
    object CopiarItens1: TMenuItem
      Caption = 'Copiar Itens'
      OnClick = CopiarItens1Click
    end
    object mi_capa_di: TMenuItem
      Caption = 'Ca&pa'
      Hint = 'Capa'
      OnClick = btn_capa_diClick
    end
    object mi_adicao_di: TMenuItem
      Caption = '&Adi'#231#227'o'
      Hint = 'Adi'#231#227'o'
      OnClick = btn_adicao_diClick
    end
    object mi_atz_desc_merc: TMenuItem
      Caption = '&Atz Descr. Mercadoria'
      OnClick = btn_atz_desc_mercClick
    end
    object CadMercadoria1: TMenuItem
      Caption = 'Cad. Mercadoria'
      OnClick = CadMercadoria1Click
    end
    object mi_sair: TMenuItem
      Caption = 'Sai&r'
      OnClick = btn_sairClick
    end
  end
end
