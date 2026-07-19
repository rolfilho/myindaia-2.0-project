object frm_DI_adicao: Tfrm_DI_adicao
  Left = 558
  Top = 216
  Width = 761
  Height = 603
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
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
    Width = 745
    Height = 49
    Align = alTop
    BevelInner = bvLowered
    TabOrder = 0
    object Shape4: TShape
      Left = 487
      Top = 5
      Width = 242
      Height = 39
      Brush.Color = clBtnFace
      Pen.Color = clGray
    end
    object btn_sair: TSpeedButton
      Left = 446
      Top = 5
      Width = 36
      Height = 39
      Hint = 'Sa'#237'da'
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
      Left = 6
      Top = 5
      Width = 36
      Height = 39
      Hint = 'Salva os dados da adi'#231#227'o atual'
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
      Left = 50
      Top = 5
      Width = 36
      Height = 39
      Hint = 'Cancela mudan'#231'as na adi'#231#227'o atual'
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
    object btn_capa_di: TSpeedButton
      Left = 134
      Top = 5
      Width = 36
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
    object btn_itens_di: TSpeedButton
      Left = 170
      Top = 5
      Width = 36
      Height = 39
      Hint = 'Itens DI'
      Flat = True
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        0400000000000001000000000000000000001000000010000000000000000000
        8000008000000080800080000000800080008080000080808000C0C0C0000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00555500000000
        0555555F7777777775F55500FFFFFFFFF0555577F5FFFFFFF7F550F0F9999999
        F05557F7F777777757F550F0FFFFFFFFF05557F7F5FFFFFFF7F550F0F9999999
        F05557F7F777777757F550F0FF666FFFF05557F7F5FFFFFFF7F550F0F9999999
        F05557F7F777777757F550F0FF6F666FF05557F7F5FFFFFFF7F550F0F9999999
        F05557F7F777777757F550F0FF66F6FFF05557F7F5FFFFFFF7F550F0F9999999
        F05557F7F777777757F550F0FFFFFFFFF05557F7FF5F5F5F57F550F00F0F0F0F
        005557F77F7F7F7F77555055070707070555575F7F7F7F7F7F55550507070707
        0555557575757575755555505050505055555557575757575555}
      NumGlyphs = 2
      ParentShowHint = False
      ShowHint = True
      OnClick = btn_itens_diClick
    end
    object btn_excluir: TSpeedButton
      Left = 94
      Top = 5
      Width = 36
      Height = 39
      Hint = 'Exclui Adi'#231#227'o'
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
      Left = 210
      Top = 5
      Width = 36
      Height = 39
      Hint = 'C'#225'lculo do Processo DI'
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
    object lbl_nm_usuario: TLabel
      Left = 499
      Top = 18
      Width = 58
      Height = 13
      Caption = 'Adi'#231#227'o N'#186
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = True
    end
    object Label2: TLabel
      Left = 595
      Top = 18
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
      Left = 640
      Top = 14
      Width = 85
      Height = 21
      Brush.Color = clBtnFace
      Pen.Color = clGray
    end
    object btn_trans_DI: TSpeedButton
      Left = 251
      Top = 4
      Width = 39
      Height = 41
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
      Left = 251
      Top = 4
      Width = 39
      Height = 41
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
      Left = 295
      Top = 4
      Width = 39
      Height = 41
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
    object dbedt_nr_adicao: TDBEdit
      Left = 560
      Top = 14
      Width = 35
      Height = 21
      TabStop = False
      AutoSize = False
      BevelInner = bvLowered
      BevelOuter = bvNone
      BevelKind = bkFlat
      Ctl3D = False
      DataField = 'NR_ADICAO'
      DataSource = datm_DI_Adicao.ds_adicao
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      MaxLength = 15
      ParentColor = True
      ParentCtl3D = False
      ParentFont = False
      ReadOnly = True
      TabOrder = 0
      OnChange = dbedt_nr_adicaoChange
    end
    object dbedt_qt_adicoes: TDBEdit
      Left = 602
      Top = 14
      Width = 35
      Height = 21
      TabStop = False
      AutoSize = False
      BevelInner = bvLowered
      BevelOuter = bvNone
      BevelKind = bkFlat
      Ctl3D = False
      DataField = 'QT_ADICOES'
      DataSource = datm_DI_Adicao.ds_di
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      MaxLength = 15
      ParentColor = True
      ParentCtl3D = False
      ParentFont = False
      ReadOnly = True
      TabOrder = 1
    end
    object DBNavigator1: TDBNavigator
      Left = 641
      Top = 15
      Width = 84
      Height = 20
      DataSource = datm_DI_Adicao.ds_adicao
      VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast]
      Flat = True
      Ctl3D = True
      Hints.Strings = (
        'Primeira adi'#231#227'o'
        'Adi'#231#227'o Anterior'
        'Pr'#243'xima adi'#231#227'o'
        #218'ltima adi'#231#227'o')
      ParentCtl3D = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 2
      OnClick = DBNavigator1Click
    end
    object edtItemDireto: TEdit
      Left = 561
      Top = 14
      Width = 35
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
      TabOrder = 3
      OnKeyDown = edtItemDiretoKeyDown
      OnKeyPress = edtItemDiretoKeyPress
      OnKeyUp = edtItemDiretoKeyUp
    end
  end
  object pgctrl_adicao: TPageControl
    Left = 0
    Top = 49
    Width = 745
    Height = 495
    ActivePage = tbsht_tributos
    Align = alClient
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    MultiLine = True
    ParentFont = False
    TabOrder = 1
    OnChange = pgctrl_adicaoChange
    OnChanging = pgctrl_adicaoChanging
    object tbsht_fornecedor_fabricante: TTabSheet
      Caption = '&Fornecedor'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      object lbl_vinculacao_comp_vend: TLabel
        Left = 351
        Top = 113
        Width = 252
        Height = 13
        Caption = 'Vincula'#231#227'o entre o Comprador e o Vendedor'
      end
      object lbl_pais_origem1: TLabel
        Left = 351
        Top = 158
        Width = 88
        Height = 13
        Caption = 'Pa'#237's de Origem'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        Visible = False
        WordWrap = True
      end
      object sbtn_tab_pais1: TSpeedButton
        Left = 693
        Top = 171
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
        OnClick = sbtn_tab_pais1Click
      end
      object lbl_nr_licenciamento: TLabel
        Left = 352
        Top = 23
        Width = 101
        Height = 13
        Caption = 'N'#186' Licenciamento'
      end
      object lbl_numero: TLabel
        Left = 352
        Top = 67
        Width = 146
        Height = 13
        Caption = 'N'#250'mero do Ato Drawback'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object pgctrl_expo_fabr: TPageControl
        Left = 16
        Top = 220
        Width = 703
        Height = 191
        ActivePage = tbsht_exportador
        TabOrder = 6
        object tbsht_exportador: TTabSheet
          Caption = ' Exportador '
          object SpeedButton8: TSpeedButton
            Left = 661
            Top = 174
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
          end
          object lbl_expo_codigo: TLabel
            Left = 23
            Top = 24
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
            Left = 457
            Top = 20
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
          object lbl_expo_nome: TLabel
            Left = 52
            Top = 48
            Width = 33
            Height = 13
            Caption = 'Nome'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object lbl_expo_logradouro: TLabel
            Left = 20
            Top = 72
            Width = 65
            Height = 13
            Caption = 'Logradouro'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object lbl_expo_numero: TLabel
            Left = 472
            Top = 72
            Width = 44
            Height = 13
            Caption = 'N'#250'mero'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object lbl_expo_complemento: TLabel
            Left = 46
            Top = 96
            Width = 39
            Height = 13
            Caption = 'Compl.'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object lbl_expo_cidade: TLabel
            Left = 344
            Top = 96
            Width = 40
            Height = 13
            Caption = 'Cidade'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object lbl_expo_estado: TLabel
            Left = 45
            Top = 120
            Width = 40
            Height = 13
            Caption = 'Estado'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object lbl_expo_pais_aquis: TLabel
            Left = 280
            Top = 120
            Width = 104
            Height = 13
            Caption = 'Pa'#237's de Aquisi'#231#227'o'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object sbtn_tab_pais2: TSpeedButton
            Left = 589
            Top = 116
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
            Visible = False
            OnClick = sbtn_tab_pais2Click
          end
          object dbedt_expo_codigo: TDBEdit
            Left = 88
            Top = 20
            Width = 48
            Height = 21
            DataField = 'CD_FORNECEDOR'
            DataSource = datm_DI_Adicao.ds_adicao
            TabOrder = 0
            OnExit = dbedt_expo_codigoExit
            OnKeyDown = dbedt_cd_pais_origem1KeyDown
          end
          object dbedt_expo_descricao: TDBEdit
            Left = 136
            Top = 20
            Width = 320
            Height = 21
            TabStop = False
            Color = clMenu
            Ctl3D = True
            DataField = 'Look_Exportador'
            DataSource = datm_DI_Adicao.ds_adicao
            ParentCtl3D = False
            ReadOnly = True
            TabOrder = 1
          end
          object dbedt_expo_nome: TDBEdit
            Left = 88
            Top = 44
            Width = 441
            Height = 21
            DataField = 'NM_FORN_ESTR'
            DataSource = datm_DI_Adicao.ds_adicao
            TabOrder = 2
          end
          object dbedt_expo_logradouro: TDBEdit
            Left = 88
            Top = 68
            Width = 337
            Height = 21
            DataField = 'ED_LOGR_FORN_ESTR'
            DataSource = datm_DI_Adicao.ds_adicao
            TabOrder = 3
          end
          object dbedt_expo_numero: TDBEdit
            Left = 520
            Top = 68
            Width = 53
            Height = 21
            DataField = 'ED_NR_FORN_ESTR'
            DataSource = datm_DI_Adicao.ds_adicao
            TabOrder = 4
          end
          object dbedt_expo_complemento: TDBEdit
            Left = 88
            Top = 92
            Width = 165
            Height = 21
            DataField = 'ED_COMPL_FORN_ESTR'
            DataSource = datm_DI_Adicao.ds_adicao
            TabOrder = 5
          end
          object dbedt_expo_cidade: TDBEdit
            Left = 388
            Top = 92
            Width = 185
            Height = 21
            DataField = 'ED_CIDAD_FORN_ESTR'
            DataSource = datm_DI_Adicao.ds_adicao
            TabOrder = 6
          end
          object dbedt_expo_estado: TDBEdit
            Left = 88
            Top = 116
            Width = 185
            Height = 21
            DataField = 'ED_ESTAD_FORN_ESTR'
            DataSource = datm_DI_Adicao.ds_adicao
            TabOrder = 7
          end
          object dbedt_expo_cd_pais: TDBEdit
            Left = 388
            Top = 116
            Width = 40
            Height = 21
            DataField = 'CD_PAIS_AQUIS_MERC'
            DataSource = datm_DI_Adicao.ds_adicao
            TabOrder = 8
            OnExit = dbedt_expo_cd_paisExit
            OnKeyDown = dbedt_cd_pais_origem1KeyDown
          end
          object dbedt_expo_nm_pais: TDBEdit
            Left = 428
            Top = 116
            Width = 160
            Height = 21
            TabStop = False
            Color = clMenu
            Ctl3D = True
            DataField = 'Look_pais_aquisicao'
            DataSource = datm_DI_Adicao.ds_adicao
            ParentCtl3D = False
            ReadOnly = True
            TabOrder = 9
          end
        end
        object tbsht_fabricante_produtor: TTabSheet
          Caption = 'Fa&bricante / Produtor'
          object lbl_fabr_codigo: TLabel
            Left = 24
            Top = 24
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
            Left = 457
            Top = 20
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
          object lbl_fabr_nome: TLabel
            Left = 52
            Top = 48
            Width = 33
            Height = 13
            Caption = 'Nome'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object lbl_fabr_logradouro: TLabel
            Left = 20
            Top = 72
            Width = 65
            Height = 13
            Caption = 'Logradouro'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object lbl_fabr_complemento: TLabel
            Left = 46
            Top = 96
            Width = 39
            Height = 13
            Caption = 'Compl.'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object lbl_fabr_estado: TLabel
            Left = 45
            Top = 120
            Width = 40
            Height = 13
            Caption = 'Estado'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object lbl_fabr_cidade: TLabel
            Left = 344
            Top = 96
            Width = 40
            Height = 13
            Caption = 'Cidade'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object lbl_fabr_numero: TLabel
            Left = 472
            Top = 72
            Width = 44
            Height = 13
            Caption = 'N'#250'mero'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object lbl_fabr_pais_origem: TLabel
            Left = 296
            Top = 120
            Width = 88
            Height = 13
            Caption = 'Pa'#237's de Origem'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object sbtn_tab_pais3: TSpeedButton
            Left = 589
            Top = 116
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
            OnClick = sbtn_tab_pais3Click
          end
          object dbedt_fabr_codigo: TDBEdit
            Left = 88
            Top = 20
            Width = 48
            Height = 21
            DataField = 'CD_FABRICANTE'
            DataSource = datm_DI_Adicao.ds_adicao
            TabOrder = 0
            OnExit = dbedt_fabr_codigoExit
            OnKeyDown = dbedt_cd_pais_origem1KeyDown
          end
          object dbedt_fabr_descricao: TDBEdit
            Left = 136
            Top = 20
            Width = 320
            Height = 21
            TabStop = False
            Color = clMenu
            Ctl3D = True
            DataField = 'Look_Fabricante'
            DataSource = datm_DI_Adicao.ds_adicao
            ParentCtl3D = False
            ReadOnly = True
            TabOrder = 8
          end
          object dbedt_fabr_nm: TDBEdit
            Left = 88
            Top = 44
            Width = 441
            Height = 21
            DataField = 'NM_FABRICANTE_MERC'
            DataSource = datm_DI_Adicao.ds_adicao
            TabOrder = 1
          end
          object dbedt_fabr_logradouro: TDBEdit
            Left = 88
            Top = 68
            Width = 337
            Height = 21
            DataField = 'ED_LOGR_FABRIC'
            DataSource = datm_DI_Adicao.ds_adicao
            TabOrder = 2
          end
          object dbedt_fabr_complemento: TDBEdit
            Left = 88
            Top = 92
            Width = 165
            Height = 21
            DataField = 'ED_COMPL_FABRIC'
            DataSource = datm_DI_Adicao.ds_adicao
            TabOrder = 4
          end
          object dbedt_fabr_estado: TDBEdit
            Left = 88
            Top = 116
            Width = 185
            Height = 21
            DataField = 'ED_ESTADO_FABRIC'
            DataSource = datm_DI_Adicao.ds_adicao
            TabOrder = 6
          end
          object dbedt_fabr_cidade: TDBEdit
            Left = 388
            Top = 92
            Width = 185
            Height = 21
            DataField = 'ED_CIDAD_FABRIC'
            DataSource = datm_DI_Adicao.ds_adicao
            TabOrder = 5
          end
          object dbedt_fabr_numero: TDBEdit
            Left = 520
            Top = 68
            Width = 53
            Height = 21
            DataField = 'ED_NR_FABRIC'
            DataSource = datm_DI_Adicao.ds_adicao
            TabOrder = 3
          end
          object dbedt_fabr_cd_pais: TDBEdit
            Left = 388
            Top = 116
            Width = 40
            Height = 21
            DataField = 'CD_PAIS_ORIG_MERC'
            DataSource = datm_DI_Adicao.ds_adicao
            TabOrder = 7
            OnExit = dbedt_fabr_cd_paisExit
          end
          object dbedt_fabr_nm_pais: TDBEdit
            Left = 428
            Top = 116
            Width = 160
            Height = 21
            TabStop = False
            Color = clMenu
            Ctl3D = True
            DataField = 'Look_pais_origem'
            DataSource = datm_DI_Adicao.ds_adicao
            ParentCtl3D = False
            ReadOnly = True
            TabOrder = 9
          end
        end
      end
      object dbrgrp_fabr_expo: TDBRadioGroup
        Left = 16
        Top = 31
        Width = 281
        Height = 113
        Ctl3D = True
        DataField = 'CD_AUSENCIA_FABRIC'
        DataSource = datm_DI_Adicao.ds_adicao
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        Items.Strings = (
          'O fabricante/produtor '#233' o exportador'
          'O fabricante/produtor n'#227'o '#233' o exportador'
          'O fabricante/produtor '#233' desconhecido')
        ParentCtl3D = False
        ParentFont = False
        TabOrder = 0
        Values.Strings = (
          '1'
          '2'
          '3')
        OnChange = dbrgrp_fabr_expoChange
      end
      object dbedt_cd_pais_origem1: TDBEdit
        Left = 351
        Top = 171
        Width = 44
        Height = 21
        DataField = 'CD_PAIS_ORIG_MERC'
        DataSource = datm_DI_Adicao.ds_adicao
        TabOrder = 4
        Visible = False
        OnKeyDown = dbedt_cd_pais_origem1KeyDown
      end
      object dbedt_nm_pais_origem1: TDBEdit
        Left = 395
        Top = 171
        Width = 297
        Height = 21
        TabStop = False
        Color = clMenu
        Ctl3D = True
        DataField = 'Look_pais_origem'
        DataSource = datm_DI_Adicao.ds_adicao
        ParentCtl3D = False
        ReadOnly = True
        TabOrder = 5
        Visible = False
      end
      object dblkpcbox_vinc_comp_vend: TDBLookupComboBox
        Left = 351
        Top = 126
        Width = 216
        Height = 21
        DataField = 'CD_VINC_IMPO_EXPO'
        DataSource = datm_DI_Adicao.ds_adicao
        KeyField = 'CD_VINC_EXPO_IMPO'
        ListField = 'DESCRICAO'
        ListSource = datm_DI_Adicao.ds_tp_vinc_expo_impo
        TabOrder = 3
      end
      object dbedt_nr_licenciamento: TDBEdit
        Left = 352
        Top = 36
        Width = 93
        Height = 21
        DataField = 'NR_OPER_TRAT_PREV'
        DataSource = datm_DI_Adicao.ds_adicao
        ReadOnly = True
        TabOrder = 1
      end
      object dbedt_cd_numero_ato: TDBEdit
        Left = 352
        Top = 80
        Width = 119
        Height = 21
        DataField = 'NR_ATO_DRAWBACK'
        DataSource = datm_DI_Adicao.ds_adicao
        TabOrder = 2
      end
    end
    object tbsht_mercadoria: TTabSheet
      Caption = '&Mercadoria'
      object pgctrl_mercadorias: TPageControl
        Left = 0
        Top = 0
        Width = 737
        Height = 467
        ActivePage = tbsht_mercadoria_basica
        Align = alClient
        TabOrder = 0
        OnChange = pgctrl_adicaoChange
        OnChanging = pgctrl_adicaoChanging
        object tbsht_mercadoria_basica: TTabSheet
          Caption = 'B'#225'sico'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          object lbl_naladi_sh: TLabel
            Left = 64
            Top = 116
            Width = 69
            Height = 13
            Caption = 'NALADI/SH'
          end
          object sbtn_tab_naladi_sh: TSpeedButton
            Left = 363
            Top = 112
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
            OnClick = sbtn_tab_naladi_shClick
          end
          object lbl_naladi_ncca: TLabel
            Left = 468
            Top = 116
            Width = 85
            Height = 13
            Caption = 'NALADI/NCCA'
          end
          object sbtn_tab_naladi_ncca: TSpeedButton
            Left = 681
            Top = 112
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
            OnClick = sbtn_tab_naladi_nccaClick
          end
          object lbl_denominacao_ncm: TLabel
            Left = 24
            Top = 138
            Width = 109
            Height = 13
            Caption = 'Denomina'#231#227'o NCM'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object lbl_aliquota_II: TLabel
            Left = 64
            Top = 162
            Width = 69
            Height = 13
            Caption = 'Al'#237'quota I.I.'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object lbl_aliquota_IPI: TLabel
            Left = 449
            Top = 163
            Width = 81
            Height = 13
            Caption = 'Al'#237'quota I.P.I.'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object lbl_Qt_Med_Estatistica: TLabel
            Left = 24
            Top = 187
            Width = 188
            Height = 13
            Caption = 'Quantidade na Medida Estat'#237'tica'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object lbl_unid_med_estatistica: TLabel
            Left = 355
            Top = 188
            Width = 176
            Height = 13
            Caption = 'Unidade de Medida Estat'#237'stica'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object lbl_peso_liquido: TLabel
            Left = 24
            Top = 210
            Width = 102
            Height = 13
            Caption = 'Peso L'#237'quido (kg)'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
            WordWrap = True
          end
          object SpeedButton2: TSpeedButton
            Left = 216
            Top = 50
            Width = 21
            Height = 18
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
            OnClick = SpeedButton2Click
          end
          object Label63: TLabel
            Left = 24
            Top = 237
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
            Left = 683
            Top = 232
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
            OnClick = btn_co_cd_cfopClick
          end
          object dbedt_cd_naladi_sh: TDBEdit
            Left = 238
            Top = 112
            Width = 124
            Height = 21
            DataField = 'CD_MERC_NALADI_SH'
            DataSource = datm_DI_Adicao.ds_adicao
            TabOrder = 12
            OnKeyDown = dbedt_cd_pais_origem1KeyDown
          end
          object dbedt_cd_naladi_ncca: TDBEdit
            Left = 556
            Top = 112
            Width = 124
            Height = 21
            DataField = 'CD_MERC_NALADI_NCC'
            DataSource = datm_DI_Adicao.ds_adicao
            TabOrder = 13
            OnKeyDown = dbedt_cd_pais_origem1KeyDown
          end
          object dbedt_nm_ncm: TDBEdit
            Left = 238
            Top = 136
            Width = 469
            Height = 21
            TabStop = False
            Color = clMenu
            Ctl3D = True
            DataField = 'DESCRICAO'
            DataSource = datm_DI_Adicao.ds_ncm
            ParentCtl3D = False
            ReadOnly = True
            TabOrder = 14
          end
          object dbedt_aliq_II: TDBEdit
            Left = 238
            Top = 160
            Width = 65
            Height = 21
            TabStop = False
            Color = clMenu
            Ctl3D = True
            DataField = 'ALIQUOTA_II'
            DataSource = datm_DI_Adicao.ds_ncm
            ParentCtl3D = False
            ReadOnly = True
            TabOrder = 15
          end
          object dbedt_aliq_IPI: TDBEdit
            Left = 533
            Top = 160
            Width = 65
            Height = 21
            TabStop = False
            Color = clMenu
            Ctl3D = True
            DataField = 'ALIQUOTA_IPI'
            DataSource = datm_DI_Adicao.ds_ncm
            ParentCtl3D = False
            ReadOnly = True
            TabOrder = 16
          end
          object dbedt_qt_med_estatistica: TDBEdit
            Left = 238
            Top = 184
            Width = 113
            Height = 21
            TabStop = False
            Color = clMenu
            Ctl3D = True
            DataField = 'QT_UN_ESTATISTICA'
            DataSource = datm_DI_Adicao.ds_adicao
            ParentCtl3D = False
            ReadOnly = True
            TabOrder = 17
          end
          object dbedt_pl_mercadoria: TDBEdit
            Left = 238
            Top = 208
            Width = 113
            Height = 21
            TabStop = False
            Color = clMenu
            Ctl3D = True
            DataField = 'PL_MERCADORIA'
            DataSource = datm_DI_Adicao.ds_adicao
            ParentCtl3D = False
            ReadOnly = True
            TabOrder = 19
          end
          object dbg_destaque_ncm: TDBGrid
            Left = 24
            Top = 288
            Width = 180
            Height = 58
            DataSource = datm_DI_Adicao.ds_ad_destaque_ncm
            Options = [dgEditing, dgTitles, dgColumnResize, dgColLines, dgRowLines, dgCancelOnExit]
            TabOrder = 20
            TitleFont.Charset = DEFAULT_CHARSET
            TitleFont.Color = clWindowText
            TitleFont.Height = -11
            TitleFont.Name = 'MS Sans Serif'
            TitleFont.Style = [fsBold]
            Columns = <
              item
                Expanded = False
                FieldName = 'NR_DESTAQUE_NCM'
                Title.Alignment = taCenter
                Width = 151
                Visible = True
              end>
          end
          object dbrgrp_aplicacao: TDBRadioGroup
            Left = 212
            Top = 265
            Width = 319
            Height = 96
            Caption = 'Aplica'#231#227'o'
            Columns = 2
            DataField = 'CD_APLICACAO_MERC'
            DataSource = datm_DI_Adicao.ds_adicao
            Items.Strings = (
              'Consumo'
              'Revenda'
              'Incorpora'#231#227'o Ativo Fixo'
              'Industrializa'#231#227'o'
              'Outra')
            TabOrder = 21
            Values.Strings = (
              '1'
              '2'
              '3'
              '4'
              '5')
          end
          object dbg_docto_vinc: TDBGrid
            Left = 536
            Top = 289
            Width = 172
            Height = 136
            DataSource = datm_DI_Adicao.ds_ad_docto_vinc
            Options = [dgEditing, dgTitles, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgCancelOnExit]
            TabOrder = 23
            TitleFont.Charset = DEFAULT_CHARSET
            TitleFont.Color = clWindowText
            TitleFont.Height = -11
            TitleFont.Name = 'MS Sans Serif'
            TitleFont.Style = [fsBold]
            Columns = <
              item
                Expanded = False
                FieldName = 'Look_tp_docto_vinc'
                Width = 37
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'NR_DCTO_VINCULADO'
                Width = 115
                Visible = True
              end>
          end
          object grpbox_cond_mercadoria: TGroupBox
            Left = 212
            Top = 364
            Width = 319
            Height = 61
            Caption = 'Condi'#231#227'o da Mercadoria'
            TabOrder = 22
            TabStop = True
            OnClick = grpbox_cond_mercadoriaClick
            object rbtn_material_usado: TRadioButton
              Left = 8
              Top = 24
              Width = 113
              Height = 17
              Caption = 'Material Usado'
              TabOrder = 0
              OnClick = rbtn_material_usadoClick
            end
            object rbtn_Bem_sob_encomenda: TRadioButton
              Left = 156
              Top = 24
              Width = 141
              Height = 17
              Caption = 'Bem sob encomenda'
              TabOrder = 1
              OnClick = rbtn_material_usadoClick
            end
          end
          object pnl_ncm: TPanel
            Left = 24
            Top = 50
            Width = 80
            Height = 18
            BevelOuter = bvNone
            BorderStyle = bsSingle
            Caption = 'NCM'
            Ctl3D = False
            ParentCtl3D = False
            TabOrder = 24
          end
          object pnl_nbm: TPanel
            Left = 24
            Top = 69
            Width = 80
            Height = 19
            BevelOuter = bvNone
            BorderStyle = bsSingle
            Caption = 'NBM'
            Ctl3D = False
            ParentCtl3D = False
            TabOrder = 25
          end
          object stxt_classificacao: TStaticText
            Left = 24
            Top = 31
            Width = 80
            Height = 18
            Alignment = taCenter
            AutoSize = False
            BorderStyle = sbsSingle
            Caption = 'Classifica'#231#227'o'
            Color = 8421440
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWhite
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentColor = False
            ParentFont = False
            TabOrder = 26
          end
          object stxt_codigo: TStaticText
            Left = 105
            Top = 31
            Width = 132
            Height = 18
            Alignment = taCenter
            AutoSize = False
            BorderStyle = sbsSingle
            Caption = 'C'#243'digo'
            Color = 8421440
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWhite
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentColor = False
            ParentFont = False
            TabOrder = 27
          end
          object stxt_docto_vinculado: TStaticText
            Left = 537
            Top = 270
            Width = 168
            Height = 18
            Alignment = taCenter
            AutoSize = False
            Caption = 'Documento Vinculado'
            Color = clBlack
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWhite
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentColor = False
            ParentFont = False
            TabOrder = 28
          end
          object stxt_destaque_ncm: TStaticText
            Left = 24
            Top = 270
            Width = 179
            Height = 18
            Alignment = taCenter
            AutoSize = False
            Caption = 'Destaque NCM para Anu'#234'ncia'
            Color = clBlack
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWhite
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentColor = False
            ParentFont = False
            TabOrder = 29
          end
          object stxt_ato_legal_ncm: TStaticText
            Left = 238
            Top = 13
            Width = 466
            Height = 17
            Alignment = taCenter
            AutoSize = False
            BorderStyle = sbsSingle
            Caption = 'Ato Legal'
            Color = clBlack
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWhite
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentColor = False
            ParentFont = False
            TabOrder = 30
          end
          object stxt_ex_ato_legal_ncm: TStaticText
            Left = 238
            Top = 31
            Width = 65
            Height = 17
            Alignment = taCenter
            AutoSize = False
            BorderStyle = sbsSingle
            Caption = '"EX"'
            Color = 8421440
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWhite
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentColor = False
            ParentFont = False
            TabOrder = 31
          end
          object stxt_tipo_ato_legal_ncm: TStaticText
            Left = 304
            Top = 31
            Width = 108
            Height = 17
            Alignment = taCenter
            AutoSize = False
            BorderStyle = sbsSingle
            Caption = 'Tipo'
            Color = 8421440
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWhite
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentColor = False
            ParentFont = False
            TabOrder = 32
          end
          object stxt_orgao_ato_legal_ncm: TStaticText
            Left = 413
            Top = 31
            Width = 148
            Height = 17
            Alignment = taCenter
            AutoSize = False
            BorderStyle = sbsSingle
            Caption = 'Org'#227'o Emissor'
            Color = 8421440
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWhite
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentColor = False
            ParentFont = False
            TabOrder = 33
          end
          object stxt_nr_ato_legal_ncm: TStaticText
            Left = 562
            Top = 31
            Width = 66
            Height = 17
            Alignment = taCenter
            AutoSize = False
            BorderStyle = sbsSingle
            Caption = 'N'#250'mero'
            Color = 8421440
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWhite
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentColor = False
            ParentFont = False
            TabOrder = 34
          end
          object stxt_dt_ano_ato_legal_ncm: TStaticText
            Left = 629
            Top = 31
            Width = 75
            Height = 17
            Alignment = taCenter
            AutoSize = False
            BorderStyle = sbsSingle
            Caption = 'Ano'
            Color = 8421440
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWhite
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentColor = False
            ParentFont = False
            TabOrder = 35
          end
          object dbedt_dt_ano_ato_legal_ncm: TDBEdit
            Left = 629
            Top = 49
            Width = 75
            Height = 19
            Ctl3D = False
            DataField = 'DT_ANO_ATO_VINCUL'
            DataSource = datm_DI_Adicao.ds_ad_ato_legal_ncm
            ParentCtl3D = False
            TabOrder = 5
          end
          object dbedt_nr_ato_legal_ncm: TDBEdit
            Left = 562
            Top = 49
            Width = 66
            Height = 19
            Ctl3D = False
            DataField = 'NR_ATO_VINCULADO'
            DataSource = datm_DI_Adicao.ds_ad_ato_legal_ncm
            ParentCtl3D = False
            TabOrder = 4
          end
          object dblkpcbox_orgao_ato_legal_ncm: TDBLookupComboBox
            Left = 413
            Top = 49
            Width = 148
            Height = 19
            Ctl3D = False
            DataField = 'SG_ORG_ATO_VINCUL'
            DataSource = datm_DI_Adicao.ds_ad_ato_legal_ncm
            DropDownWidth = 300
            KeyField = 'Codigo'
            ListField = 'Codigo;Descricao'
            ListSource = datm_DI_Adicao.ds_orgao_emissor
            ParentCtl3D = False
            TabOrder = 3
          end
          object dblkpcbox_tipo_ato_legal_ncm: TDBLookupComboBox
            Left = 304
            Top = 49
            Width = 108
            Height = 19
            Ctl3D = False
            DataField = 'SG_TIPO_ATO_VINCUL'
            DataSource = datm_DI_Adicao.ds_ad_ato_legal_ncm
            DropDownWidth = 300
            KeyField = 'Codigo'
            ListField = 'Codigo;Descricao'
            ListSource = datm_DI_Adicao.ds_tp_ato_legal
            ParentCtl3D = False
            TabOrder = 2
          end
          object dbedt_ex_ato_legal_ncm: TDBEdit
            Left = 238
            Top = 49
            Width = 65
            Height = 19
            Ctl3D = False
            DataField = 'NR_EX_ATO_VINCUL'
            DataSource = datm_DI_Adicao.ds_ad_ato_legal_ncm
            ParentCtl3D = False
            TabOrder = 1
            OnExit = dbedt_ex_ato_legal_ncmExit
          end
          object dbedt_ex_ato_legal_nbm: TDBEdit
            Left = 238
            Top = 69
            Width = 65
            Height = 19
            Ctl3D = False
            DataField = 'NR_EX_ATO_VINCUL'
            DataSource = datm_DI_Adicao.ds_ad_ato_legal_nbm
            ParentCtl3D = False
            TabOrder = 7
            OnExit = dbedt_ex_ato_legal_nbmExit
          end
          object dblkpcbox_tipo_ato_legal_nbm: TDBLookupComboBox
            Left = 304
            Top = 69
            Width = 108
            Height = 19
            Ctl3D = False
            DataField = 'SG_TIPO_ATO_VINCUL'
            DataSource = datm_DI_Adicao.ds_ad_ato_legal_nbm
            DropDownWidth = 300
            KeyField = 'Codigo'
            ListField = 'Codigo;Descricao'
            ListSource = datm_DI_Adicao.ds_tp_ato_legal
            ParentCtl3D = False
            TabOrder = 8
          end
          object dblkpcbox_orgao_ato_legal_nbm: TDBLookupComboBox
            Left = 413
            Top = 69
            Width = 148
            Height = 19
            Ctl3D = False
            DataField = 'SG_ORG_ATO_VINCUL'
            DataSource = datm_DI_Adicao.ds_ad_ato_legal_nbm
            DropDownWidth = 300
            KeyField = 'Codigo'
            ListField = 'Codigo;Descricao'
            ListSource = datm_DI_Adicao.ds_orgao_emissor
            ParentCtl3D = False
            TabOrder = 9
          end
          object dbedt_nr_ato_legal_nbm: TDBEdit
            Left = 562
            Top = 69
            Width = 66
            Height = 19
            Ctl3D = False
            DataField = 'NR_ATO_VINCULADO'
            DataSource = datm_DI_Adicao.ds_ad_ato_legal_nbm
            ParentCtl3D = False
            TabOrder = 10
          end
          object dbedt_dt_ano_ato_legal_nbm: TDBEdit
            Left = 629
            Top = 69
            Width = 75
            Height = 19
            Ctl3D = False
            DataField = 'DT_ANO_ATO_VINCUL'
            DataSource = datm_DI_Adicao.ds_ad_ato_legal_nbm
            ParentCtl3D = False
            TabOrder = 11
          end
          object edt_nm_unid_med_est: TEdit
            Left = 533
            Top = 184
            Width = 173
            Height = 21
            TabStop = False
            Color = clMenu
            ReadOnly = True
            TabOrder = 18
          end
          object dbedt_cd_nbm: TDBEdit
            Left = 105
            Top = 69
            Width = 109
            Height = 19
            TabStop = False
            Color = clMenu
            Ctl3D = False
            DataField = 'CD_MERC_NBM_SH'
            DataSource = datm_DI_Adicao.ds_adicao
            ParentCtl3D = False
            ReadOnly = True
            TabOrder = 6
          end
          object dbedt_cd_ncm_sh: TDBEdit
            Left = 105
            Top = 50
            Width = 109
            Height = 19
            Ctl3D = False
            DataField = 'CD_MERCADORIA_NCM'
            DataSource = datm_DI_Adicao.ds_adicao
            MaxLength = 8
            ParentCtl3D = False
            TabOrder = 0
            OnChange = dbedt_cd_ncm_shChange
            OnKeyDown = dbedt_cd_pais_origem1KeyDown
          end
          object dbedt_nr_destaque_ncm: TDBEdit
            Left = 24
            Top = 368
            Width = 181
            Height = 21
            TabStop = False
            Color = clMenu
            DataField = 'NR_DESTAQUE_NCM'
            DataSource = datm_DI_Adicao.ds_adicao
            ReadOnly = True
            TabOrder = 36
            OnKeyDown = dbedt_cd_pais_origem1KeyDown
          end
          object StaticText1: TStaticText
            Left = 24
            Top = 349
            Width = 180
            Height = 18
            Alignment = taCenter
            AutoSize = False
            Caption = 'Destaque NCM (Quebra)'
            Color = clBlack
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWhite
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentColor = False
            ParentFont = False
            TabOrder = 37
          end
          object dbedtCFOP: TDBEdit
            Left = 62
            Top = 232
            Width = 51
            Height = 21
            DataField = 'CD_CFOP'
            DataSource = datm_DI_Adicao.ds_adicao
            TabOrder = 38
            OnChange = dbedtCFOPChange
            OnKeyDown = dbedt_cd_pais_origem1KeyDown
          end
          object edtCFOP: TEdit
            Left = 117
            Top = 232
            Width = 566
            Height = 21
            Color = clMenu
            ReadOnly = True
            TabOrder = 39
          end
        end
        object tbsht_mercadoria_item: TTabSheet
          Caption = '&Itens'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          object lbl_moeda_mcv: TLabel
            Left = 8
            Top = 15
            Width = 172
            Height = 13
            Caption = 'Moeda na Condi'#231#227'o da Venda'
          end
          object lbl_vl_tot_Cond_Vend: TLabel
            Left = 260
            Top = 15
            Width = 196
            Height = 13
            Caption = 'Valor Total na Condi'#231#227'o da Venda'
          end
          object dbedt_cd_moeda_mcv: TDBEdit
            Left = 184
            Top = 12
            Width = 49
            Height = 21
            DataField = 'CD_MOEDA_NEGOCIADA'
            DataSource = datm_DI_Adicao.ds_adicao
            Enabled = False
            TabOrder = 0
          end
          object dbedt_tot_merc_cod_vend: TDBEdit
            Left = 463
            Top = 12
            Width = 137
            Height = 21
            DataField = 'VL_MERC_EMB_MN'
            DataSource = datm_DI_Adicao.ds_adicao
            Enabled = False
            TabOrder = 1
          end
          object dbg_ad_itens: TDBGrid
            Left = 8
            Top = 40
            Width = 710
            Height = 351
            DataSource = datm_DI_Adicao.ds_ad_itens_w
            Options = [dgTitles, dgColumnResize, dgColLines, dgRowLines]
            ReadOnly = True
            TabOrder = 2
            TitleFont.Charset = DEFAULT_CHARSET
            TitleFont.Color = clWindowText
            TitleFont.Height = -11
            TitleFont.Name = 'MS Sans Serif'
            TitleFont.Style = [fsBold]
            Columns = <
              item
                Expanded = False
                FieldName = 'NR_ITEM'
                Title.Caption = 'Item'
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
                FieldName = 'CD_NCM_SH'
                Title.Caption = 'NCM'
                Title.Color = clBlack
                Title.Font.Charset = DEFAULT_CHARSET
                Title.Font.Color = clWhite
                Title.Font.Height = -11
                Title.Font.Name = 'MS Sans Serif'
                Title.Font.Style = [fsBold]
                Width = 158
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'CD_NALADI_SH'
                Title.Caption = 'NALADI/SH'
                Title.Color = clBlack
                Title.Font.Charset = DEFAULT_CHARSET
                Title.Font.Color = clWhite
                Title.Font.Height = -11
                Title.Font.Name = 'MS Sans Serif'
                Title.Font.Style = [fsBold]
                Width = 110
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'CD_NALADI_NCCA'
                Title.Caption = 'NALADI/NCCA'
                Title.Color = clBlack
                Title.Font.Charset = DEFAULT_CHARSET
                Title.Font.Color = clWhite
                Title.Font.Height = -11
                Title.Font.Name = 'MS Sans Serif'
                Title.Font.Style = [fsBold]
                Width = 104
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'QT_MERC_UN_COMERC'
                Title.Caption = 'Quantidade'
                Title.Color = clBlack
                Title.Font.Charset = DEFAULT_CHARSET
                Title.Font.Color = clWhite
                Title.Font.Height = -11
                Title.Font.Name = 'MS Sans Serif'
                Title.Font.Style = [fsBold]
                Width = 123
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'CD_UN_MED_COMERC'
                Title.Caption = 'UN'
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
                Expanded = False
                FieldName = 'QT_MERC_UN_ESTAT'
                Title.Caption = 'Quant.Est.'
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
                Expanded = False
                FieldName = 'PL_MERCADORIA'
                Title.Caption = 'Peso L'#237'quido'
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
                FieldName = 'PC_DESCONTO_MERC'
                Title.Caption = '% Desc.'
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
                Expanded = False
                FieldName = 'VL_UNITARIO'
                Title.Caption = 'Vl. Unit'#225'rio'
                Title.Color = clBlack
                Title.Font.Charset = DEFAULT_CHARSET
                Title.Font.Color = clWhite
                Title.Font.Height = -11
                Title.Font.Name = 'MS Sans Serif'
                Title.Font.Style = [fsBold]
                Width = 101
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'VL_DESCONTO_MERC'
                Title.Caption = 'Vl.Desconto'
                Title.Color = clBlack
                Title.Font.Charset = DEFAULT_CHARSET
                Title.Font.Color = clWhite
                Title.Font.Height = -11
                Title.Font.Name = 'MS Sans Serif'
                Title.Font.Style = [fsBold]
                Width = 100
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'VL_MLE_ITEM'
                Title.Caption = 'Vl. MLE item'
                Title.Color = clBlack
                Title.Font.Charset = DEFAULT_CHARSET
                Title.Font.Color = clWhite
                Title.Font.Height = -11
                Title.Font.Name = 'MS Sans Serif'
                Title.Font.Style = [fsBold]
                Width = 105
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'VL_FRETE_ITEM'
                Title.Caption = 'Vl.Frete Item'
                Title.Color = clBlack
                Title.Font.Charset = DEFAULT_CHARSET
                Title.Font.Color = clWhite
                Title.Font.Height = -11
                Title.Font.Name = 'MS Sans Serif'
                Title.Font.Style = [fsBold]
                Width = 105
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'VL_SEGURO_ITEM'
                Title.Caption = 'Vl.Seguro Item'
                Title.Color = clBlack
                Title.Font.Charset = DEFAULT_CHARSET
                Title.Font.Color = clWhite
                Title.Font.Height = -11
                Title.Font.Name = 'MS Sans Serif'
                Title.Font.Style = [fsBold]
                Width = 114
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'VL_MCV_ITEM'
                Title.Caption = 'Vl. MCV Item'
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
                Expanded = False
                FieldName = 'VL_UNID_COND_VENDA'
                Title.Caption = 'Vl. Unit. MCV'
                Title.Color = clBlack
                Title.Font.Charset = DEFAULT_CHARSET
                Title.Font.Color = clWhite
                Title.Font.Height = -11
                Title.Font.Name = 'MS Sans Serif'
                Title.Font.Style = [fsBold]
                Width = 110
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'CD_TIPO_CALCULO_ITEM'
                Title.Caption = 'TC'
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
                Expanded = False
                FieldName = 'CD_MERCADORIA'
                Title.Caption = 'MERCADORIA'
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
                Expanded = False
                FieldName = 'CD_FABR_EXPO'
                Title.Caption = 'Fabr/Expo'
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
                Expanded = False
                FieldName = 'CD_EXPORTADOR'
                Title.Caption = 'Exportador'
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
                Expanded = False
                FieldName = 'CD_PAIS_ORIGEM'
                Title.Caption = 'Pais Origem'
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
                Expanded = False
                FieldName = 'CD_FABRICANTE'
                Title.Caption = 'Fabricante'
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
                FieldName = 'CD_PAIS_AQUISICAO'
                Title.Caption = 'Pa'#237's Aquisi'#231#227'o'
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
        object tbsht_mercadoria_nve: TTabSheet
          Caption = '&NVE'
          DesignSize = (
            729
            439)
          object Label4: TLabel
            Left = 4
            Top = 17
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
          object Label96: TLabel
            Left = 4
            Top = 56
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
          object btn_co_nivel: TSpeedButton
            Left = 213
            Top = 68
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
          object Label97: TLabel
            Left = 244
            Top = 56
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
          object btn_co_atrib: TSpeedButton
            Left = 454
            Top = 68
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
          object Label98: TLabel
            Left = 485
            Top = 56
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
          object btn_co_especif: TSpeedButton
            Left = 693
            Top = 68
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
            Left = 4
            Top = 30
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
            DataSource = datm_DI_Adicao.ds_adicao
            Font.Charset = ANSI_CHARSET
            Font.Color = clBlack
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentCtl3D = False
            ParentFont = False
            ReadOnly = True
            TabOrder = 0
          end
          object dbedt_nm_ncm_nve: TDBEdit
            Left = 117
            Top = 30
            Width = 594
            Height = 22
            TabStop = False
            AutoSize = False
            BevelInner = bvLowered
            BevelOuter = bvNone
            BevelKind = bkSoft
            Color = clMenu
            Ctl3D = False
            DataField = 'Look_NM_NCM'
            DataSource = datm_DI_Adicao.ds_adicao
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
          end
          object dbedt_cd_nivel: TDBEdit
            Left = 4
            Top = 69
            Width = 62
            Height = 21
            CharCase = ecUpperCase
            DataField = 'CD_NIVEL_NVE'
            DataSource = datm_DI_Adicao.ds_nve
            TabOrder = 2
          end
          object dbedt_nm_nivel: TDBEdit
            Left = 65
            Top = 69
            Width = 147
            Height = 21
            TabStop = False
            Color = clMenu
            DataField = 'LookNivel'
            DataSource = datm_DI_Adicao.ds_nve
            ReadOnly = True
            TabOrder = 3
          end
          object dbedt_cd_atrib: TDBEdit
            Left = 243
            Top = 69
            Width = 63
            Height = 21
            CharCase = ecUpperCase
            DataField = 'CD_ATRIBUTO_NCM'
            DataSource = datm_DI_Adicao.ds_nve
            TabOrder = 4
          end
          object dbedt_nm_atrib: TDBEdit
            Left = 305
            Top = 69
            Width = 148
            Height = 21
            TabStop = False
            Color = clMenu
            DataField = 'LookAtributo'
            DataSource = datm_DI_Adicao.ds_nve
            ReadOnly = True
            TabOrder = 5
          end
          object dbedt_cd_espec: TDBEdit
            Left = 486
            Top = 69
            Width = 61
            Height = 21
            CharCase = ecUpperCase
            DataField = 'CD_ESPECIF_NCM'
            DataSource = datm_DI_Adicao.ds_nve
            TabOrder = 6
          end
          object dbedt_nm_especif: TDBEdit
            Left = 546
            Top = 69
            Width = 147
            Height = 21
            TabStop = False
            Color = clMenu
            DataField = 'LookEspecif'
            DataSource = datm_DI_Adicao.ds_nve
            ReadOnly = True
            TabOrder = 7
          end
          object Panel5: TPanel
            Left = 0
            Top = 145
            Width = 729
            Height = 294
            Align = alBottom
            BevelOuter = bvNone
            BorderWidth = 4
            TabOrder = 8
            object DBGrid1: TDBGrid
              Left = 4
              Top = 4
              Width = 721
              Height = 286
              Align = alClient
              Ctl3D = False
              DataSource = datm_DI_Adicao.ds_nve
              Options = [dgTitles, dgIndicator, dgColLines, dgRowLines, dgRowSelect, dgAlwaysShowSelection]
              ParentCtl3D = False
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
          object Panel6: TPanel
            Left = 596
            Top = 0
            Width = 125
            Height = 28
            Anchors = [akTop, akRight]
            BevelOuter = bvNone
            BorderStyle = bsSingle
            Ctl3D = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentCtl3D = False
            ParentFont = False
            TabOrder = 9
            object btn_NVE_Incluir: TSpeedButton
              Left = 0
              Top = 0
              Width = 27
              Height = 27
              Hint = 'Salva os dados da adi'#231#227'o atual'
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
              OnClick = btn_NVE_IncluirClick
            end
            object btn_NVE_Salvar: TSpeedButton
              Left = 31
              Top = 0
              Width = 27
              Height = 27
              Hint = 'Salva os dados da adi'#231#227'o atual'
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
              OnClick = btn_NVE_SalvarClick
            end
            object btn_NVE_Cancelar: TSpeedButton
              Left = 64
              Top = 0
              Width = 27
              Height = 27
              Hint = 'Salva os dados da adi'#231#227'o atual'
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
              OnClick = btn_NVE_CancelarClick
            end
            object btn_NVE_Excluir: TSpeedButton
              Left = 96
              Top = 0
              Width = 27
              Height = 27
              Hint = 'Salva os dados da adi'#231#227'o atual'
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
              OnClick = btn_NVE_ExcluirClick
            end
          end
        end
      end
    end
    object tbsht_carga: TTabSheet
      Caption = '&Carga'
      TabVisible = False
      object lbl_cd_pais_procedencia: TLabel
        Left = 8
        Top = 58
        Width = 120
        Height = 13
        Caption = 'Pa'#237's de Proced'#234'ncia'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object sbtn_tab_pais4: TSpeedButton
        Left = 348
        Top = 54
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
        OnClick = sbtn_tab_pais4Click
      end
      object lbl_urf_entrada_pais: TLabel
        Left = 8
        Top = 26
        Width = 122
        Height = 13
        Caption = 'URF Entrada no Pa'#237's'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object sbtn_tab_urf_entrada: TSpeedButton
        Left = 384
        Top = 22
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
      end
      object lbl_via_transp: TLabel
        Left = 28
        Top = 90
        Width = 102
        Height = 13
        Caption = 'Via de Transporte'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object grpbox_seguro_total: TGroupBox
        Left = 8
        Top = 252
        Width = 585
        Height = 65
        Caption = '  Seguro Total '
        TabOrder = 0
        object lbl_moeda_seguro_total: TLabel
          Left = 8
          Top = 31
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
        object sbtn_tab_moeda_Seguro_Total: TSpeedButton
          Left = 104
          Top = 27
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
        end
        object lbl_vl_seguro_moeda: TLabel
          Left = 144
          Top = 31
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
        object lbl_vl_seguro_real: TLabel
          Left = 368
          Top = 31
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
        object dbedt_cd_moeda_seguro: TDBEdit
          Left = 56
          Top = 27
          Width = 41
          Height = 21
          DataField = 'CD_MOEDA_SEG_MERC'
          DataSource = datm_DI_Adicao.ds_adicao
          TabOrder = 0
        end
        object dbedt_vl_seguro_moeda: TDBEdit
          Left = 240
          Top = 27
          Width = 121
          Height = 21
          DataField = 'VL_SEG_MERC_MNEG'
          DataSource = datm_DI_Adicao.ds_adicao
          TabOrder = 1
        end
        object dbedt_vl_seguro_real: TDBEdit
          Left = 456
          Top = 27
          Width = 121
          Height = 21
          DataField = 'VL_SEG_MERC_MN'
          DataSource = datm_DI_Adicao.ds_adicao
          TabOrder = 2
        end
      end
      object dbedt_cd_pais_procedencia: TDBEdit
        Left = 136
        Top = 54
        Width = 37
        Height = 21
        DataField = 'CD_PAIS_PROC_MERC'
        DataSource = datm_DI_Adicao.ds_adicao
        TabOrder = 1
      end
      object dbedt_nm_pais_procedencia: TDBEdit
        Left = 176
        Top = 54
        Width = 169
        Height = 21
        TabStop = False
        Color = clMenu
        Ctl3D = True
        DataField = 'Look_pais_procedencia'
        DataSource = datm_DI_Adicao.ds_adicao
        ParentCtl3D = False
        ReadOnly = True
        TabOrder = 2
      end
      object dbedt_cd_urf_entrada: TDBEdit
        Left = 136
        Top = 22
        Width = 73
        Height = 21
        DataField = 'CD_URF_ENTR_MERC'
        DataSource = datm_DI_Adicao.ds_adicao
        TabOrder = 3
        OnExit = dbedt_cd_urf_entradaExit
      end
      object dbedt_nm_urf_entrada: TDBEdit
        Left = 212
        Top = 22
        Width = 169
        Height = 21
        TabStop = False
        Color = clMenu
        Ctl3D = True
        DataField = 'DESCRICAO'
        DataSource = datm_DI_Adicao.ds_urf_entrada
        ParentCtl3D = False
        ReadOnly = True
        TabOrder = 4
      end
      object grpbox_frete_total: TGroupBox
        Left = 8
        Top = 148
        Width = 585
        Height = 65
        Caption = '  Frete Total '
        TabOrder = 5
        object lbl_moeda_frete_total: TLabel
          Left = 8
          Top = 26
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
        object sbtn_tab_moeda_Frete_Total: TSpeedButton
          Left = 104
          Top = 22
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
        end
        object lbl_vl_frete_moeda: TLabel
          Left = 144
          Top = 26
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
        object lbl_vl_frete_real: TLabel
          Left = 368
          Top = 26
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
        object dbedt_cd_moeda_frete: TDBEdit
          Left = 56
          Top = 22
          Width = 41
          Height = 21
          DataField = 'CD_MD_FRETE_MERC'
          DataSource = datm_DI_Adicao.ds_adicao
          TabOrder = 0
        end
        object dbedt_vl_frete_moeda: TDBEdit
          Left = 240
          Top = 22
          Width = 121
          Height = 21
          DataField = 'VL_FRETE_MERC_MNEG'
          DataSource = datm_DI_Adicao.ds_adicao
          TabOrder = 1
        end
        object dbedt_vl_frete_real: TDBEdit
          Left = 456
          Top = 22
          Width = 121
          Height = 21
          DataField = 'VL_FRETE_MERC_MN'
          DataSource = datm_DI_Adicao.ds_adicao
          TabOrder = 2
        end
      end
      object dblkpcbox_via_transp: TDBLookupComboBox
        Left = 136
        Top = 86
        Width = 145
        Height = 21
        DataField = 'CD_VIA_TRANSPORTE'
        DataSource = datm_DI_Adicao.ds_adicao
        KeyField = 'CD_VIA_TRANSPORTE'
        ListField = 'NM_VIA_TRANSPORTE'
        ListSource = datm_DI_Adicao.ds_via_transporte
        TabOrder = 6
      end
      object dbchkbox_in_multimodal: TDBCheckBox
        Left = 360
        Top = 88
        Width = 149
        Height = 17
        Caption = 'Transporte Multimodal'
        DataField = 'IN_MULTIMODAL'
        DataSource = datm_DI_Adicao.ds_adicao
        TabOrder = 7
        ValueChecked = 'True'
        ValueUnchecked = 'False'
      end
    end
    object tbsht_valor_aduaneiro: TTabSheet
      Caption = '&Valor Aduaneiro'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      object Label11: TLabel
        Left = 16
        Top = 9
        Width = 197
        Height = 13
        Caption = 'Condi'#231#227'o de Venda da Mercadoria'
      end
      object pnl_frete_seguro_intl: TPanel
        Left = 16
        Top = 159
        Width = 702
        Height = 72
        BevelInner = bvLowered
        TabOrder = 1
        object lbl_frete_internacional: TLabel
          Left = 18
          Top = 18
          Width = 108
          Height = 13
          Caption = 'Frete Internacional'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object lbl_seguro_internacional: TLabel
          Left = 18
          Top = 43
          Width = 119
          Height = 13
          Caption = 'Seguro Internacional'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label22: TLabel
          Left = 337
          Top = 18
          Width = 115
          Height = 13
          Caption = 'Despesas na moeda'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object dbedt_vl_frete_internacional: TDBEdit
          Left = 144
          Top = 14
          Width = 138
          Height = 21
          TabStop = False
          Color = clMenu
          Ctl3D = True
          DataField = 'VL_FRETE_MERC_MN'
          DataSource = datm_DI_Adicao.ds_adicao
          Enabled = False
          ParentCtl3D = False
          TabOrder = 0
        end
        object dbedt_vl_seguro_internacional: TDBEdit
          Left = 144
          Top = 39
          Width = 138
          Height = 21
          TabStop = False
          Color = clMenu
          Ctl3D = True
          DataField = 'VL_SEG_MERC_MN'
          DataSource = datm_DI_Adicao.ds_adicao
          Enabled = False
          ParentCtl3D = False
          TabOrder = 1
        end
        object dbedt_vl_despesas: TDBEdit
          Left = 459
          Top = 14
          Width = 138
          Height = 21
          TabStop = False
          Color = clWhite
          Ctl3D = True
          DataField = 'VL_DESPESAS'
          DataSource = datm_DI_Adicao.ds_adicao
          ParentCtl3D = False
          TabOrder = 2
        end
      end
      object pgctrl_acres_dedu: TPageControl
        Left = 17
        Top = 240
        Width = 702
        Height = 169
        ActivePage = tbsht_valoracao_acrescimos
        TabOrder = 2
        object tbsht_valoracao_acrescimos: TTabSheet
          Caption = 'Ac&r'#233'scimos'
          object dbg_acrescimos: TDBGrid
            Left = 0
            Top = 0
            Width = 694
            Height = 141
            Align = alClient
            DataSource = datm_DI_Adicao.ds_ad_acrescimos
            Options = [dgEditing, dgTitles, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgCancelOnExit]
            TabOrder = 0
            TitleFont.Charset = DEFAULT_CHARSET
            TitleFont.Color = clWindowText
            TitleFont.Height = -11
            TitleFont.Name = 'MS Sans Serif'
            TitleFont.Style = [fsBold]
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
            Width = 694
            Height = 141
            Align = alClient
            DataSource = datm_DI_Adicao.ds_ad_deducoes
            Options = [dgEditing, dgTitles, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgCancelOnExit]
            TabOrder = 0
            TitleFont.Charset = DEFAULT_CHARSET
            TitleFont.Color = clWindowText
            TitleFont.Height = -11
            TitleFont.Name = 'MS Sans Serif'
            TitleFont.Style = [fsBold]
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
        object tbsht_valoracao_complemento: TTabSheet
          Caption = 'C&omplemento'
          object dbmemo_complemento: TDBMemo
            Left = 0
            Top = 0
            Width = 694
            Height = 141
            Align = alClient
            DataField = 'TX_COMPL_VL_ADUAN'
            DataSource = datm_DI_Adicao.ds_adicao
            TabOrder = 0
          end
        end
      end
      object pnl_cond_venda_mercadoria: TPanel
        Left = 16
        Top = 24
        Width = 702
        Height = 125
        BevelInner = bvLowered
        TabOrder = 0
        object lbl_cd_incoterm: TLabel
          Left = 16
          Top = 23
          Width = 66
          Height = 13
          Caption = 'INCOTERM'
        end
        object lbl_metodo_valoracao: TLabel
          Left = 220
          Top = 23
          Width = 122
          Height = 13
          Caption = 'M'#233'todo de Valora'#231#227'o'
        end
        object lbl_cd_moeda_cond_venda: TLabel
          Left = 16
          Top = 56
          Width = 39
          Height = 13
          Caption = 'Moeda'
        end
        object sbtn_tab_moeda_Cond_Venda: TSpeedButton
          Left = 173
          Top = 52
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
          OnClick = sbtn_tab_moeda_Cond_VendaClick
        end
        object lbl_vl_moeda_cond_venda: TLabel
          Left = 220
          Top = 56
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
        object lbl_vl_real_cond_venda: TLabel
          Left = 482
          Top = 56
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
        object lbl_local_cond_venda: TLabel
          Left = 16
          Top = 87
          Width = 107
          Height = 13
          Caption = 'Local da Condi'#231#227'o'
        end
        object btn_local_embarque: TSpeedButton
          Left = 496
          Top = 83
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
          OnClick = btn_local_embarqueClick
        end
        object btn_co_incoterm: TSpeedButton
          Left = 173
          Top = 19
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
        object btn_co_met_valoracao: TSpeedButton
          Left = 665
          Top = 19
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
          OnClick = btn_co_met_valoracaoClick
        end
        object dbedt_cd_incoterm: TDBEdit
          Left = 132
          Top = 19
          Width = 40
          Height = 21
          CharCase = ecUpperCase
          DataField = 'CD_INCOTERMS_VENDA'
          DataSource = datm_DI_Adicao.ds_adicao
          TabOrder = 0
          OnExit = dbedt_cd_incotermExit
          OnKeyDown = dbedt_cd_pais_origem1KeyDown
        end
        object dbedt_cd_metodo_valoracao: TDBEdit
          Left = 348
          Top = 19
          Width = 32
          Height = 21
          DataField = 'CD_METOD_VALORACAO'
          DataSource = datm_DI_Adicao.ds_adicao
          TabOrder = 1
          OnExit = dbedt_cd_metodo_valoracaoExit
          OnKeyDown = dbedt_cd_pais_origem1KeyDown
        end
        object dbedt_cd_moeda_cond_venda: TDBEdit
          Left = 132
          Top = 52
          Width = 40
          Height = 21
          Ctl3D = True
          DataField = 'CD_MOEDA_NEGOCIADA'
          DataSource = datm_DI_Adicao.ds_adicao
          ParentCtl3D = False
          TabOrder = 2
          OnEnter = dbedt_cd_moeda_cond_vendaEnter
          OnExit = dbedt_cd_moeda_cond_vendaExit
          OnKeyDown = dbedt_cd_pais_origem1KeyDown
        end
        object dbedt_vl_moeda_cond_venda: TDBEdit
          Left = 348
          Top = 52
          Width = 121
          Height = 21
          TabStop = False
          Color = clMenu
          Ctl3D = True
          DataField = 'VL_MERC_COND_VENDA'
          DataSource = datm_DI_Adicao.ds_adicao
          Enabled = False
          ParentCtl3D = False
          TabOrder = 4
        end
        object dbedt_vl_real_cond_venda: TDBEdit
          Left = 570
          Top = 52
          Width = 121
          Height = 21
          TabStop = False
          Color = clMenu
          Ctl3D = True
          DataField = 'VL_MERC_VENDA_MN'
          DataSource = datm_DI_Adicao.ds_adicao
          Enabled = False
          ParentCtl3D = False
          TabOrder = 5
        end
        object dbedt_cd_local_embarque2: TDBEdit
          Left = 132
          Top = 83
          Width = 41
          Height = 21
          DataField = 'CD_LOC_COND_VENDA'
          DataSource = datm_DI_Adicao.ds_adicao
          TabOrder = 3
          OnExit = dbedt_cd_local_embarque2Exit
          OnKeyDown = dbedt_cd_pais_origem1KeyDown
        end
        object dbedt_nm_local_embarque2: TDBEdit
          Left = 173
          Top = 83
          Width = 322
          Height = 21
          TabStop = False
          Color = clMenu
          DataField = 'Look_Loc_Cond_Venda'
          DataSource = datm_DI_Adicao.ds_adicao
          TabOrder = 6
        end
        object dbedt_nm_metodo_valoracao: TDBEdit
          Left = 380
          Top = 19
          Width = 284
          Height = 21
          TabStop = False
          Color = clMenu
          Ctl3D = True
          DataField = 'Look_metodo_Valoracao'
          DataSource = datm_DI_Adicao.ds_adicao
          ParentCtl3D = False
          ReadOnly = True
          TabOrder = 7
        end
      end
    end
    object tbsht_tributos: TTabSheet
      Caption = '&Tributos'
      object pgctrl_tributos: TPageControl
        Left = 0
        Top = 0
        Width = 737
        Height = 467
        ActivePage = tbsht_ibs_cbs
        Align = alClient
        TabOrder = 0
        OnChange = pgctrl_adicaoChange
        OnChanging = pgctrl_adicaoChanging
        object tbsht_tributo_II: TTabSheet
          Caption = '&I.I.'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          object Label25: TLabel
            Left = 48
            Top = 16
            Width = 93
            Height = 13
            Caption = 'Base de C'#225'lculo'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
            WordWrap = True
          end
          object stxt_base_calculo_nao_gerada: TStaticText
            Left = 326
            Top = 13
            Width = 382
            Height = 32
            Alignment = taCenter
            AutoSize = False
            BevelKind = bkFlat
            BorderStyle = sbsSunken
            Caption = 
              'A base de C'#225'lculo n'#227'o pode ser gerada se n'#227'o for informado um c'#243 +
              'digo de INCOTERM v'#225'lido.'
            Color = clMenu
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clRed
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentColor = False
            ParentFont = False
            TabOrder = 0
            Visible = False
          end
          object dbedt_vl_base_calculo: TDBEdit
            Left = 155
            Top = 14
            Width = 161
            Height = 21
            TabStop = False
            Color = clMenu
            Ctl3D = True
            DataField = 'VL_BASE_CALC_ADVAL'
            DataSource = datm_DI_Adicao.ds_ad_ii
            Enabled = False
            ParentCtl3D = False
            TabOrder = 1
          end
          object gbox_reg_trib: TGroupBox
            Left = 20
            Top = 47
            Width = 688
            Height = 172
            Caption = 'Regime de Tributa'#231#227'o'
            TabOrder = 2
            object Label27: TLabel
              Left = 29
              Top = 54
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
            object btn_co_Fund_legal: TSpeedButton
              Left = 651
              Top = 50
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
            object Label1: TLabel
              Left = 29
              Top = 27
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
            object btn_co_Reg_Trib: TSpeedButton
              Left = 651
              Top = 23
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
              OnClick = btn_co_Reg_TribClick
            end
            object lbl_mot_ad_temp: TLabel
              Left = 29
              Top = 111
              Width = 101
              Height = 13
              Caption = 'Motivo Ad. Temp.'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object btn_co_mot_ad_temp: TSpeedButton
              Left = 651
              Top = 107
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
              OnClick = btn_co_mot_ad_tempClick
            end
            object Label93: TLabel
              Left = 29
              Top = 138
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
            object Label119: TLabel
              Left = 29
              Top = 82
              Width = 108
              Height = 13
              Caption = 'Fund.Legal DUIMP'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object btn_co_Fund_legal_ii_duimp: TSpeedButton
              Left = 651
              Top = 78
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
              OnClick = btn_co_Fund_legal_ii_duimpClick
            end
            object dbedt_cd_fund_legal: TDBEdit
              Left = 138
              Top = 50
              Width = 43
              Height = 21
              DataField = 'CD_FUND_LEG_REGIME'
              DataSource = datm_DI_Adicao.ds_adicao
              TabOrder = 2
              OnChange = dbedt_cd_fund_legalChange
              OnExit = dbedt_cd_fund_legalExit
              OnKeyDown = dbedt_cd_pais_origem1KeyDown
            end
            object dbedt_desc_fund_leg: TDBEdit
              Left = 181
              Top = 50
              Width = 469
              Height = 21
              TabStop = False
              Color = clMenu
              Ctl3D = True
              DataField = 'Descricao'
              DataSource = datm_DI_Adicao.ds_fund_leg
              ParentCtl3D = False
              ReadOnly = True
              TabOrder = 3
            end
            object dbedt_cd_reg_trib: TDBEdit
              Left = 138
              Top = 23
              Width = 43
              Height = 21
              DataField = 'CD_REGIME_TRIBUTAR'
              DataSource = datm_DI_Adicao.ds_adicao
              TabOrder = 0
              OnChange = dbedt_cd_reg_tribChange
              OnExit = dbedt_cd_reg_tribExit
              OnKeyDown = dbedt_cd_pais_origem1KeyDown
            end
            object dbedt_desc_reg_trib: TDBEdit
              Left = 181
              Top = 23
              Width = 469
              Height = 21
              TabStop = False
              Color = clMenu
              Ctl3D = True
              DataField = 'Look_Reg_trib'
              DataSource = datm_DI_Adicao.ds_adicao
              ParentCtl3D = False
              ReadOnly = True
              TabOrder = 1
            end
            object dbedt_cd_mot_ad_temp: TDBEdit
              Left = 138
              Top = 107
              Width = 43
              Height = 21
              DataField = 'CD_MOTIVO_ADM_TEMP'
              DataSource = datm_DI_Adicao.ds_adicao
              TabOrder = 4
              OnKeyDown = dbedt_cd_pais_origem1KeyDown
            end
            object dbedt_desc_mot_ad_temp: TDBEdit
              Left = 181
              Top = 107
              Width = 469
              Height = 21
              TabStop = False
              Color = clMenu
              Ctl3D = True
              DataField = 'Look_Mot_Ad_Temp'
              DataSource = datm_DI_Adicao.ds_adicao
              ParentCtl3D = False
              ReadOnly = True
              TabOrder = 5
            end
            object dbedt_QT_MESES_ADM_TEMP: TDBEdit
              Left = 138
              Top = 134
              Width = 58
              Height = 21
              DataField = 'QT_MESES_ADM_TEMP'
              DataSource = datm_DI_Adicao.ds_adicao
              TabOrder = 6
              OnKeyDown = dbedt_cd_pais_origem1KeyDown
              OnKeyPress = dbedt_QT_MESES_ADM_TEMPKeyPress
            end
            object dbchk_IN_SUSPENDE_II_RETIFIC: TDBCheckBox
              Left = 231
              Top = 136
              Width = 147
              Height = 17
              Caption = 'Suspender retifica'#231#227'o'
              DataField = 'IN_SUSPENDE_II_RETIFIC'
              DataSource = datm_DI_Adicao.ds_adicao
              TabOrder = 7
              ValueChecked = 'True'
              ValueUnchecked = 'False'
            end
            object dbedt_cd_fund_legal_ii_duimp: TDBEdit
              Left = 138
              Top = 78
              Width = 43
              Height = 21
              DataField = 'CD_FUND_LEGAL_II_DUIMP'
              DataSource = datm_DI_Adicao.ds_adicao
              TabOrder = 8
              OnExit = btn_co_Fund_legal_ii_duimpClick
              OnKeyDown = dbedt_cd_pais_origem1KeyDown
            end
            object dbedt_desc_fund_leg_ii_duimp: TDBEdit
              Left = 181
              Top = 78
              Width = 469
              Height = 21
              TabStop = False
              Color = clMenu
              Ctl3D = True
              DataField = 'Look_fund_legal_ii_duimp'
              DataSource = datm_DI_Adicao.ds_adicao
              ParentCtl3D = False
              ReadOnly = True
              TabOrder = 9
            end
          end
          object gbox_acordo_tar: TGroupBox
            Left = 20
            Top = 226
            Width = 688
            Height = 101
            Caption = 'Acordo Tarif'#225'rio'
            TabOrder = 3
            object Label28: TLabel
              Left = 31
              Top = 33
              Width = 26
              Height = 13
              Caption = 'Tipo'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object Label29: TLabel
              Left = 31
              Top = 60
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
            object Bevel4: TBevel
              Left = 253
              Top = 19
              Width = 421
              Height = 71
              Shape = bsFrame
              Style = bsRaised
            end
            object dbedt_cd_acordo_aladi: TDBEdit
              Left = 136
              Top = 59
              Width = 41
              Height = 21
              DataField = 'CD_ACORDO_ALADI'
              DataSource = datm_DI_Adicao.ds_adicao
              TabOrder = 7
            end
            object dblkcbox_acordo_tarif: TDBLookupComboBox
              Left = 136
              Top = 29
              Width = 97
              Height = 21
              DataField = 'CD_TIPO_ACORDO_TAR'
              DataSource = datm_DI_Adicao.ds_adicao
              KeyField = 'CD_TIPO_ACORDO_TAR'
              ListField = 'DESCRICAO'
              ListSource = datm_DI_Adicao.ds_acordo_tarif
              TabOrder = 1
              OnClick = dblkcbox_acordo_tarifClick
              OnExit = dblkcbox_acordo_tarifExit
            end
            object StaticText2: TStaticText
              Left = 261
              Top = 27
              Width = 406
              Height = 17
              Alignment = taCenter
              AutoSize = False
              BorderStyle = sbsSingle
              Caption = 'Ato Legal'
              Color = clBlack
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWhite
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentColor = False
              ParentFont = False
              TabOrder = 0
            end
            object dbedt_ex_ato_legal_acordo_tar: TDBEdit
              Left = 261
              Top = 64
              Width = 49
              Height = 19
              Ctl3D = False
              DataField = 'NR_EX_ATO_VINCUL'
              DataSource = datm_DI_Adicao.ds_ad_ato_legal_acordo_tar
              ParentCtl3D = False
              TabOrder = 8
              OnEnter = dblkcbox_acordo_tarifExit
              OnExit = dbedt_ex_ato_legal_acordo_tarExit
            end
            object dblkpcbox_tipo_ato_legal_acordo_tar: TDBLookupComboBox
              Left = 311
              Top = 64
              Width = 92
              Height = 19
              Ctl3D = False
              DataField = 'SG_TIPO_ATO_VINCUL'
              DataSource = datm_DI_Adicao.ds_ad_ato_legal_acordo_tar
              DropDownWidth = 300
              KeyField = 'Codigo'
              ListField = 'Codigo;Descricao'
              ListSource = datm_DI_Adicao.ds_tp_ato_legal
              ParentCtl3D = False
              TabOrder = 9
              OnEnter = dblkcbox_acordo_tarifExit
            end
            object dblkpcbox_orgao_ato_legal_acordo_tar: TDBLookupComboBox
              Left = 404
              Top = 64
              Width = 125
              Height = 19
              Ctl3D = False
              DataField = 'SG_ORG_ATO_VINCUL'
              DataSource = datm_DI_Adicao.ds_ad_ato_legal_acordo_tar
              DropDownWidth = 300
              KeyField = 'Codigo'
              ListField = 'Codigo;Descricao'
              ListSource = datm_DI_Adicao.ds_orgao_emissor
              ParentCtl3D = False
              TabOrder = 10
              OnEnter = dblkcbox_acordo_tarifExit
            end
            object dbedt_nr_ato_legal_acordo_tar: TDBEdit
              Left = 530
              Top = 64
              Width = 67
              Height = 19
              Ctl3D = False
              DataField = 'NR_ATO_VINCULADO'
              DataSource = datm_DI_Adicao.ds_ad_ato_legal_acordo_tar
              ParentCtl3D = False
              TabOrder = 11
              OnEnter = dblkcbox_acordo_tarifExit
              OnExit = dbedt_ex_ato_legal_acordo_tarExit
            end
            object dbedt_dt_ano_ato_legal_acordo_tar: TDBEdit
              Left = 598
              Top = 64
              Width = 69
              Height = 19
              Ctl3D = False
              DataField = 'DT_ANO_ATO_VINCUL'
              DataSource = datm_DI_Adicao.ds_ad_ato_legal_acordo_tar
              ParentCtl3D = False
              TabOrder = 12
              OnEnter = dblkcbox_acordo_tarifExit
              OnExit = dbedt_ex_ato_legal_acordo_tarExit
            end
            object StaticText20: TStaticText
              Left = 261
              Top = 45
              Width = 49
              Height = 18
              Alignment = taCenter
              AutoSize = False
              BorderStyle = sbsSingle
              Caption = '"EX"'
              Color = 8421440
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWhite
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentColor = False
              ParentFont = False
              TabOrder = 2
            end
            object StaticText21: TStaticText
              Left = 311
              Top = 45
              Width = 92
              Height = 18
              Alignment = taCenter
              AutoSize = False
              BorderStyle = sbsSingle
              Caption = 'Tipo'
              Color = 8421440
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWhite
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentColor = False
              ParentFont = False
              TabOrder = 3
            end
            object StaticText22: TStaticText
              Left = 404
              Top = 45
              Width = 125
              Height = 18
              Alignment = taCenter
              AutoSize = False
              BorderStyle = sbsSingle
              Caption = 'Org'#227'o Emissor'
              Color = 8421440
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWhite
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentColor = False
              ParentFont = False
              TabOrder = 4
            end
            object StaticText23: TStaticText
              Left = 530
              Top = 45
              Width = 67
              Height = 18
              Alignment = taCenter
              AutoSize = False
              BorderStyle = sbsSingle
              Caption = 'N'#250'mero'
              Color = 8421440
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWhite
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentColor = False
              ParentFont = False
              TabOrder = 5
            end
            object StaticText24: TStaticText
              Left = 598
              Top = 45
              Width = 69
              Height = 18
              Alignment = taCenter
              AutoSize = False
              BorderStyle = sbsSingle
              Caption = 'Ano'
              Color = 8421440
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWhite
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentColor = False
              ParentFont = False
              TabOrder = 6
            end
          end
          object gbox_aliquotas: TGroupBox
            Left = 20
            Top = 333
            Width = 688
            Height = 96
            Caption = 'Al'#237'quotas'
            TabOrder = 4
            object Label30: TLabel
              Left = 32
              Top = 21
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
            object Label31: TLabel
              Left = 32
              Top = 45
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
            object Label32: TLabel
              Left = 32
              Top = 69
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
            object Label33: TLabel
              Left = 239
              Top = 66
              Width = 156
              Height = 13
              Caption = 'Percentual de Redu'#231#227'o (%)'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object dbedt_aliq_ad_valorem: TDBEdit
              Left = 136
              Top = 17
              Width = 59
              Height = 21
              DataField = 'PC_ALIQ_NORM_ADVAL'
              DataSource = datm_DI_Adicao.ds_ad_ii
              MaxLength = 10
              TabOrder = 0
              OnExit = dbedt_aliq_ad_valoremExit
            end
            object dbedt_aliq_acordo: TDBEdit
              Left = 136
              Top = 41
              Width = 59
              Height = 21
              DataField = 'PC_ALIQ_ACOR_TARIF'
              DataSource = datm_DI_Adicao.ds_ad_ii
              TabOrder = 1
            end
            object dbedt_aliq_reduzida: TDBEdit
              Left = 136
              Top = 65
              Width = 59
              Height = 21
              DataField = 'PC_ALIQ_REDUZIDA'
              DataSource = datm_DI_Adicao.ds_ad_ii
              TabOrder = 3
              OnExit = dbedt_aliq_reduzidaExit
            end
            object dbedt_pc_reducao: TDBEdit
              Left = 408
              Top = 63
              Width = 50
              Height = 21
              DataField = 'PC_REDUCAO_IPT_BLI'
              DataSource = datm_DI_Adicao.ds_ad_ii
              TabOrder = 2
              OnExit = dbedt_pc_reducaoExit
            end
          end
        end
        object tbsht_tributo_IPI: TTabSheet
          Caption = 'I.&P.I.'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          object bv_benef_fiscal_ipi: TBevel
            Left = 60
            Top = 58
            Width = 611
            Height = 151
            Shape = bsFrame
            Style = bsRaised
          end
          object Label43: TLabel
            Left = 314
            Top = 52
            Width = 101
            Height = 13
            Caption = ' Benef'#237'cio Fiscal '
          end
          object bv_aliquotas_ipi: TBevel
            Left = 60
            Top = 231
            Width = 611
            Height = 185
            Shape = bsFrame
            Style = bsRaised
          end
          object Label44: TLabel
            Left = 333
            Top = 226
            Width = 63
            Height = 13
            Caption = ' Al'#237'quotas '
          end
          object Bevel5: TBevel
            Left = 277
            Top = 72
            Width = 369
            Height = 67
            Shape = bsFrame
            Style = bsRaised
          end
          object Label120: TLabel
            Left = 73
            Top = 179
            Width = 108
            Height = 13
            Caption = 'Fund.Legal DUIMP'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object btn_co_Fund_legal_ipi_duimp: TSpeedButton
            Left = 623
            Top = 175
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
            OnClick = btn_co_Fund_legal_ipi_duimpClick
          end
          object dbcb_ipi_nao_tributavel: TDBCheckBox
            Left = 60
            Top = 35
            Width = 137
            Height = 17
            Caption = 'I.P.I. n'#227'o tribut'#225'vel'
            DataField = 'IN_IPI_NAO_TRIBUT'
            DataSource = datm_DI_Adicao.ds_adicao
            TabOrder = 0
            ValueChecked = 'True'
            ValueUnchecked = 'False'
            OnClick = dbcb_ipi_nao_tributavelClick
          end
          object gb_aliq_ad_valorem: TGroupBox
            Left = 73
            Top = 244
            Width = 281
            Height = 153
            Caption = ' Ad Valorem '
            TabOrder = 8
            object Label45: TLabel
              Left = 32
              Top = 72
              Width = 90
              Height = 13
              Caption = 'Ad. Valorem (%)'
            end
            object Label46: TLabel
              Left = 47
              Top = 104
              Width = 75
              Height = 13
              Caption = 'Reduzida (%)'
            end
            object Label47: TLabel
              Left = 8
              Top = 40
              Width = 139
              Height = 13
              Caption = 'Nota Complementar TIPI'
            end
            object dbedt_pc_ipi_ad_val: TDBEdit
              Left = 128
              Top = 68
              Width = 57
              Height = 21
              DataField = 'PC_ALIQ_NORM_ADVAL'
              DataSource = datm_DI_Adicao.ds_ad_ipi
              TabOrder = 1
              OnExit = dbedt_pc_ipi_ad_valExit
            end
            object dbedt_pc_ipi_reduzida: TDBEdit
              Left = 128
              Top = 100
              Width = 57
              Height = 21
              DataField = 'PC_ALIQ_REDUZIDA'
              DataSource = datm_DI_Adicao.ds_ad_ipi
              TabOrder = 2
            end
            object dbedt_nota_compl_tipi: TDBEdit
              Left = 152
              Top = 36
              Width = 33
              Height = 21
              DataField = 'NR_NOTA_COMPL_TIPI'
              DataSource = datm_DI_Adicao.ds_ad_ipi
              TabOrder = 0
            end
          end
          object gb_aliq_unitaria: TGroupBox
            Left = 368
            Top = 244
            Width = 289
            Height = 153
            Caption = ' Unit'#225'ria '
            TabOrder = 9
            object Label48: TLabel
              Left = 16
              Top = 20
              Width = 144
              Height = 13
              Caption = 'Valor Unidade de Medida'
            end
            object Label49: TLabel
              Left = 49
              Top = 44
              Width = 111
              Height = 13
              Caption = 'Unidade de Medida'
            end
            object Label50: TLabel
              Left = 52
              Top = 68
              Width = 108
              Height = 13
              Caption = 'Quant. na Unidade'
            end
            object Label51: TLabel
              Left = 9
              Top = 92
              Width = 151
              Height = 13
              Caption = 'Capacidade do Recipiente'
            end
            object Label52: TLabel
              Left = 8
              Top = 120
              Width = 62
              Height = 13
              Caption = 'Recipiente'
            end
            object dbedt_vl_unid_med: TDBEdit
              Left = 164
              Top = 16
              Width = 97
              Height = 21
              DataField = 'VL_ALIQ_ESPEC_IPT'
              DataSource = datm_DI_Adicao.ds_ad_ipi
              TabOrder = 0
            end
            object dbedt_nm_unid_medida: TDBEdit
              Left = 164
              Top = 40
              Width = 117
              Height = 21
              DataField = 'NM_UN_ALIQ_ESP_IPT'
              DataSource = datm_DI_Adicao.ds_ad_ipi
              TabOrder = 1
            end
            object dbedt_qt_unidade: TDBEdit
              Left = 164
              Top = 64
              Width = 73
              Height = 21
              DataField = 'QT_MERC_UN_ALIQ_ES'
              DataSource = datm_DI_Adicao.ds_ad_ipi
              TabOrder = 2
            end
            object dbedt_capacidade_recip: TDBEdit
              Left = 164
              Top = 88
              Width = 73
              Height = 21
              DataField = 'QT_ML_RECIPIENTE'
              DataSource = datm_DI_Adicao.ds_ad_ipi
              TabOrder = 3
            end
            object dblkcbox_tp_recipiente: TDBLookupComboBox
              Left = 76
              Top = 116
              Width = 205
              Height = 21
              DataField = 'CD_TIPO_RECIPIENTE'
              DataSource = datm_DI_Adicao.ds_ad_ipi
              DropDownWidth = 200
              KeyField = 'Codigo'
              ListField = 'Descricao'
              ListSource = datm_DI_Adicao.ds_tp_recipiente
              TabOrder = 4
            end
          end
          object dbrg_reg_tributacao: TDBRadioGroup
            Left = 73
            Top = 67
            Width = 185
            Height = 97
            HelpType = htKeyword
            Caption = 'Regime de Tributa'#231#227'o'
            Color = clBtnFace
            DataField = 'CD_TIPO_BENEF_IPI'
            DataSource = datm_DI_Adicao.ds_ad_ipi
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            Items.Strings = (
              ' Recolhimento Integral'
              ' Suspens'#227'o'
              ' Redu'#231#227'o'
              ' Isen'#231#227'o')
            ParentColor = False
            ParentFont = False
            TabOrder = 1
            Values.Strings = (
              '4'
              '5'
              '2'
              '1')
            OnChange = dbrg_reg_tributacaoChange
          end
          object StaticText3: TStaticText
            Left = 284
            Top = 78
            Width = 356
            Height = 17
            Alignment = taCenter
            AutoSize = False
            BorderStyle = sbsSingle
            Caption = 'Ato Legal'
            Color = clBlack
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWhite
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentColor = False
            ParentFont = False
            TabOrder = 10
          end
          object StaticText25: TStaticText
            Left = 284
            Top = 96
            Width = 41
            Height = 17
            Alignment = taCenter
            AutoSize = False
            BorderStyle = sbsSingle
            Caption = '"EX"'
            Color = 8421440
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWhite
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentColor = False
            ParentFont = False
            TabOrder = 11
          end
          object StaticText26: TStaticText
            Left = 326
            Top = 96
            Width = 76
            Height = 17
            Alignment = taCenter
            AutoSize = False
            BorderStyle = sbsSingle
            Caption = 'Tipo'
            Color = 8421440
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWhite
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentColor = False
            ParentFont = False
            TabOrder = 12
          end
          object StaticText27: TStaticText
            Left = 403
            Top = 96
            Width = 101
            Height = 17
            Alignment = taCenter
            AutoSize = False
            BorderStyle = sbsSingle
            Caption = 'Org'#227'o Emissor'
            Color = 8421440
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWhite
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentColor = False
            ParentFont = False
            TabOrder = 13
          end
          object StaticText28: TStaticText
            Left = 505
            Top = 96
            Width = 66
            Height = 17
            Alignment = taCenter
            AutoSize = False
            BorderStyle = sbsSingle
            Caption = 'N'#250'mero'
            Color = 8421440
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWhite
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentColor = False
            ParentFont = False
            TabOrder = 14
          end
          object StaticText29: TStaticText
            Left = 572
            Top = 96
            Width = 68
            Height = 17
            Alignment = taCenter
            AutoSize = False
            BorderStyle = sbsSingle
            Caption = 'Ano'
            Color = 8421440
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWhite
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentColor = False
            ParentFont = False
            TabOrder = 15
          end
          object dbedt_dt_ano_ato_legal_benef_ipi: TDBEdit
            Left = 572
            Top = 114
            Width = 68
            Height = 19
            Ctl3D = False
            DataField = 'DT_ANO_ATO_VINCUL'
            DataSource = datm_DI_Adicao.ds_ad_ato_legal_benef_ipi
            ParentCtl3D = False
            TabOrder = 7
            OnExit = dbedt_ex_ato_legal_benef_ipiExit
          end
          object dbedt_nr_ato_legal_benef_ipi: TDBEdit
            Left = 505
            Top = 114
            Width = 66
            Height = 19
            Ctl3D = False
            DataField = 'NR_ATO_VINCULADO'
            DataSource = datm_DI_Adicao.ds_ad_ato_legal_benef_ipi
            ParentCtl3D = False
            TabOrder = 6
            OnExit = dbedt_ex_ato_legal_benef_ipiExit
          end
          object dblkpcbox_orgao_ato_legal_benef_ipi: TDBLookupComboBox
            Left = 403
            Top = 114
            Width = 101
            Height = 19
            Ctl3D = False
            DataField = 'SG_ORG_ATO_VINCUL'
            DataSource = datm_DI_Adicao.ds_ad_ato_legal_benef_ipi
            DropDownWidth = 300
            KeyField = 'Codigo'
            ListField = 'Codigo;Descricao'
            ListSource = datm_DI_Adicao.ds_orgao_emissor
            ParentCtl3D = False
            TabOrder = 5
          end
          object dblkpcbox_tipo_ato_legal_benef_ipi: TDBLookupComboBox
            Left = 326
            Top = 114
            Width = 76
            Height = 19
            Ctl3D = False
            DataField = 'SG_TIPO_ATO_VINCUL'
            DataSource = datm_DI_Adicao.ds_ad_ato_legal_benef_ipi
            DropDownWidth = 300
            KeyField = 'Codigo'
            ListField = 'Codigo;Descricao'
            ListSource = datm_DI_Adicao.ds_tp_ato_legal
            ParentCtl3D = False
            TabOrder = 4
          end
          object dbedt_ex_ato_legal_benef_ipi: TDBEdit
            Left = 284
            Top = 114
            Width = 41
            Height = 19
            Ctl3D = False
            DataField = 'NR_EX_ATO_VINCUL'
            DataSource = datm_DI_Adicao.ds_ad_ato_legal_benef_ipi
            ParentCtl3D = False
            TabOrder = 3
            OnExit = dbedt_ex_ato_legal_benef_ipiExit
          end
          object dbchk_IN_SUSPENDE_IPI_RETIFIC: TDBCheckBox
            Left = 276
            Top = 146
            Width = 147
            Height = 17
            Caption = 'Suspender retifica'#231#227'o'
            DataField = 'IN_SUSPENDE_IPI_RETIFIC'
            DataSource = datm_DI_Adicao.ds_adicao
            TabOrder = 2
            ValueChecked = 'True'
            ValueUnchecked = 'False'
            OnClick = dbcb_ipi_nao_tributavelClick
          end
          object dbedt_cd_fund_legal_ipi_duimp: TDBEdit
            Left = 179
            Top = 175
            Width = 43
            Height = 21
            DataField = 'CD_FUND_LEGAL_IPI_DUIMP'
            DataSource = datm_DI_Adicao.ds_adicao
            TabOrder = 16
            OnExit = btn_co_Fund_legal_ipi_duimpClick
            OnKeyDown = dbedt_cd_pais_origem1KeyDown
          end
          object dbedt_desc_fund_leg_ipi_duimp: TDBEdit
            Left = 222
            Top = 175
            Width = 400
            Height = 21
            TabStop = False
            Color = clMenu
            Ctl3D = True
            DataField = 'Look_fund_legal_ipi_duimp'
            DataSource = datm_DI_Adicao.ds_adicao
            ParentCtl3D = False
            ReadOnly = True
            TabOrder = 17
          end
        end
        object tbsht_tributo_ICMS: TTabSheet
          Caption = 'I.&C.M.S.'
          OnShow = tbsht_tributo_ICMSShow
          object GroupBox1: TGroupBox
            Left = 67
            Top = 17
            Width = 600
            Height = 361
            TabOrder = 0
            object Label19: TLabel
              Left = 19
              Top = 17
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
              Left = 324
              Top = 30
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
            object pnlFundoPobreza: TPanel
              Left = 20
              Top = 118
              Width = 561
              Height = 51
              BevelInner = bvLowered
              TabOrder = 4
              object Label67: TLabel
                Left = 304
                Top = 8
                Width = 104
                Height = 13
                Caption = 'Fundo de Pobreza'
              end
              object dbchk_IN_FUNDO_POBREZA: TDBCheckBox
                Left = 13
                Top = 18
                Width = 168
                Height = 17
                Caption = 'Utilizar Fundo de Pobreza'
                DataField = 'IN_FUNDO_POBREZA'
                DataSource = datm_DI_Adicao.ds_adicao
                TabOrder = 0
                ValueChecked = '1'
                ValueUnchecked = '0'
                OnClick = dbchk_IN_FUNDO_POBREZAClick
              end
              object edtICMS_Fundo_Pobreza: TEdit
                Left = 304
                Top = 21
                Width = 121
                Height = 21
                ReadOnly = True
                TabOrder = 1
                Text = '0,00'
              end
            end
            object dbedt_nm_tributacao_icms: TDBEdit
              Left = 51
              Top = 30
              Width = 272
              Height = 21
              TabStop = False
              Color = clMenu
              DataField = 'look_nm_trib_icms'
              DataSource = datm_DI_Adicao.ds_adicao
              TabOrder = 1
            end
            object Panel2: TPanel
              Left = 20
              Top = 60
              Width = 561
              Height = 55
              BevelInner = bvLowered
              TabOrder = 2
              object Label16: TLabel
                Left = 12
                Top = 9
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
              object Label17: TLabel
                Left = 228
                Top = 9
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
              object Label15: TLabel
                Left = 304
                Top = 9
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
              object Label6: TLabel
                Left = 86
                Top = 9
                Width = 74
                Height = 13
                Caption = 'Valor Devido'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = [fsBold]
                ParentFont = False
              end
              object lblICMS_AFRMM: TLabel
                Left = 432
                Top = 9
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
              object dbedt_pc_icms: TDBEdit
                Left = 12
                Top = 23
                Width = 53
                Height = 21
                DataField = 'PC_ICMS'
                DataSource = datm_DI_Adicao.ds_adicao
                TabOrder = 0
              end
              object dbedt_pc_reducao_icms: TDBEdit
                Left = 228
                Top = 23
                Width = 53
                Height = 21
                DataField = 'PC_REDUCAO_ICMS'
                DataSource = datm_DI_Adicao.ds_adicao
                TabOrder = 1
              end
              object dbedt_vl_icms_a_recolher: TDBEdit
                Left = 304
                Top = 22
                Width = 120
                Height = 21
                TabStop = False
                Color = clMenu
                DataField = 'VL_ICMS_A_RECOLHER'
                DataSource = datm_DI_Adicao.ds_adicao
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlue
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = [fsBold]
                ParentFont = False
                TabOrder = 2
              end
              object dbedt_vl_icms_devido: TDBEdit
                Left = 86
                Top = 23
                Width = 120
                Height = 21
                TabStop = False
                Color = clMenu
                DataField = 'VL_ICMS_CALCULADO'
                DataSource = datm_DI_Adicao.ds_adicao
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlue
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = [fsBold]
                ParentFont = False
                TabOrder = 3
              end
              object dbedtICMS_AFRMM: TDBEdit
                Left = 432
                Top = 22
                Width = 120
                Height = 21
                TabStop = False
                Color = clMenu
                DataField = 'VL_ICMS_A_RECOLHER_AFRMM'
                DataSource = datm_DI_Adicao.ds_adicao
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlue
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = [fsBold]
                ParentFont = False
                TabOrder = 4
              end
            end
            object Panel4: TPanel
              Left = 20
              Top = 172
              Width = 561
              Height = 178
              BevelInner = bvLowered
              TabOrder = 3
              object lbl_fund: TLabel
                Left = 12
                Top = 14
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
              object btn_co_disp_legal: TSpeedButton
                Left = 453
                Top = 28
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
              object Label20: TLabel
                Left = 11
                Top = 60
                Width = 123
                Height = 13
                Caption = 'Tratamento Tribut'#225'rio'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = [fsBold]
                ParentFont = False
              end
              object Label21: TLabel
                Left = 171
                Top = 60
                Width = 58
                Height = 13
                Caption = 'Descri'#231#227'o'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = [fsBold]
                ParentFont = False
              end
              object dbedt_nm_disp_legal: TEdit
                Left = 48
                Top = 28
                Width = 404
                Height = 21
                TabStop = False
                Color = clMenu
                ReadOnly = True
                TabOrder = 3
              end
              object memo_tribut: TMemo
                Left = 171
                Top = 74
                Width = 375
                Height = 87
                TabStop = False
                Color = clMenu
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = [fsBold]
                ParentFont = False
                ReadOnly = True
                TabOrder = 2
              end
              object edt_trat_tribut: TEdit
                Left = 12
                Top = 74
                Width = 145
                Height = 21
                TabStop = False
                Color = clMenu
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = [fsBold]
                ParentFont = False
                ReadOnly = True
                TabOrder = 1
              end
              object dbedt_cd_disp_legal: TDBEdit
                Left = 12
                Top = 28
                Width = 37
                Height = 21
                DataField = 'CD_FUND_LEGAL_ICMS'
                DataSource = datm_DI_Adicao.ds_adicao
                TabOrder = 0
                OnChange = btn_co_disp_legalClick
                OnExit = dbedt_cd_disp_legalExit
                OnKeyDown = dbedt_cd_pais_origem1KeyDown
              end
            end
            object dbedt_cd_tributacao_icms: TDBEdit
              Left = 20
              Top = 30
              Width = 32
              Height = 21
              DataField = 'CD_TRIBUTACAO_ICMS'
              DataSource = datm_DI_Adicao.ds_adicao
              TabOrder = 0
              OnChange = dbedt_cd_tributacao_icmsChange
              OnExit = dbedt_cd_tributacao_icmsExit
              OnKeyDown = dbedt_cd_pais_origem1KeyDown
            end
          end
        end
        object tbsht_antidumping: TTabSheet
          Caption = '&Antidumping'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          object Bevel7: TBevel
            Left = 69
            Top = 168
            Width = 593
            Height = 169
            Shape = bsFrame
            Style = bsRaised
          end
          object Label53: TLabel
            Left = 334
            Top = 162
            Width = 63
            Height = 13
            Caption = ' Al'#237'quotas '
          end
          object Bevel10: TBevel
            Left = 178
            Top = 69
            Width = 367
            Height = 69
            Shape = bsFrame
            Style = bsRaised
          end
          object GroupBox9: TGroupBox
            Left = 77
            Top = 176
            Width = 281
            Height = 153
            Caption = ' Ad Valorem '
            TabOrder = 5
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
              Caption = 'Base de C'#228'lculo Ad Valorem (R$)'
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
              DataField = 'PC_ALIQ_NORM_ADVAL'
              DataSource = datm_DI_Adicao.ds_ad_antidump
              TabOrder = 0
            end
            object dbedt_vl_base_calc_advalorem: TDBEdit
              Left = 128
              Top = 84
              Width = 129
              Height = 21
              DataField = 'VL_BASE_CALC_ADVAL'
              DataSource = datm_DI_Adicao.ds_ad_antidump
              TabOrder = 1
            end
          end
          object GroupBox10: TGroupBox
            Left = 373
            Top = 176
            Width = 281
            Height = 153
            Caption = ' Espec'#237'fica '
            TabOrder = 6
            object Label57: TLabel
              Left = 67
              Top = 40
              Width = 58
              Height = 13
              Caption = 'Valor (R$)'
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
              DataField = 'VL_ALIQ_ESPEC_IPT'
              DataSource = datm_DI_Adicao.ds_ad_antidump
              TabOrder = 0
            end
            object dbedt_desc_unid_aliq_espec: TDBEdit
              Left = 128
              Top = 68
              Width = 145
              Height = 21
              DataField = 'NM_UN_ALIQ_ESP_IPT'
              DataSource = datm_DI_Adicao.ds_ad_antidump
              TabOrder = 1
            end
            object dbedt_qt_unid_aliq_espec: TDBEdit
              Left = 128
              Top = 100
              Width = 73
              Height = 21
              DataField = 'QT_MERC_UN_ALIQ_ES'
              DataSource = datm_DI_Adicao.ds_ad_antidump
              TabOrder = 2
            end
          end
          object StaticText4: TStaticText
            Left = 184
            Top = 76
            Width = 354
            Height = 17
            Alignment = taCenter
            AutoSize = False
            BorderStyle = sbsSingle
            Caption = 'Ato Legal'
            Color = clBlack
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWhite
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentColor = False
            ParentFont = False
            TabOrder = 7
          end
          object StaticText30: TStaticText
            Left = 184
            Top = 94
            Width = 41
            Height = 17
            Alignment = taCenter
            AutoSize = False
            BorderStyle = sbsSingle
            Caption = '"EX"'
            Color = 8421440
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWhite
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentColor = False
            ParentFont = False
            TabOrder = 8
          end
          object StaticText31: TStaticText
            Left = 226
            Top = 94
            Width = 76
            Height = 17
            Alignment = taCenter
            AutoSize = False
            BorderStyle = sbsSingle
            Caption = 'Tipo'
            Color = 8421440
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWhite
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentColor = False
            ParentFont = False
            TabOrder = 9
          end
          object StaticText32: TStaticText
            Left = 303
            Top = 94
            Width = 99
            Height = 17
            Alignment = taCenter
            AutoSize = False
            BorderStyle = sbsSingle
            Caption = 'Org'#227'o Emissor'
            Color = 8421440
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWhite
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentColor = False
            ParentFont = False
            TabOrder = 10
          end
          object StaticText33: TStaticText
            Left = 403
            Top = 94
            Width = 66
            Height = 17
            Alignment = taCenter
            AutoSize = False
            BorderStyle = sbsSingle
            Caption = 'N'#250'mero'
            Color = 8421440
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWhite
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentColor = False
            ParentFont = False
            TabOrder = 11
          end
          object StaticText34: TStaticText
            Left = 470
            Top = 94
            Width = 68
            Height = 17
            Alignment = taCenter
            AutoSize = False
            BorderStyle = sbsSingle
            Caption = 'Ano'
            Color = 8421440
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWhite
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentColor = False
            ParentFont = False
            TabOrder = 12
          end
          object dbedt_dt_ano_ato_legal_antidump: TDBEdit
            Left = 470
            Top = 112
            Width = 68
            Height = 19
            Ctl3D = False
            DataField = 'DT_ANO_ATO_VINCUL'
            DataSource = datm_DI_Adicao.ds_ad_ato_legal_antidump
            ParentCtl3D = False
            TabOrder = 4
            OnExit = dbedt_ex_ato_legal_antidumpExit
          end
          object dbedt_nr_ato_legal_antidump: TDBEdit
            Left = 403
            Top = 112
            Width = 66
            Height = 19
            Ctl3D = False
            DataField = 'NR_ATO_VINCULADO'
            DataSource = datm_DI_Adicao.ds_ad_ato_legal_antidump
            ParentCtl3D = False
            TabOrder = 3
            OnExit = dbedt_ex_ato_legal_antidumpExit
          end
          object dblkpcbox_orgao_ato_legal_antidump: TDBLookupComboBox
            Left = 303
            Top = 112
            Width = 99
            Height = 19
            Ctl3D = False
            DataField = 'SG_ORG_ATO_VINCUL'
            DataSource = datm_DI_Adicao.ds_ad_ato_legal_antidump
            DropDownWidth = 300
            KeyField = 'Codigo'
            ListField = 'Codigo;Descricao'
            ListSource = datm_DI_Adicao.ds_orgao_emissor
            ParentCtl3D = False
            TabOrder = 2
          end
          object dblkpcbox_tipo_ato_legal_antidump: TDBLookupComboBox
            Left = 226
            Top = 112
            Width = 76
            Height = 19
            Ctl3D = False
            DataField = 'SG_TIPO_ATO_VINCUL'
            DataSource = datm_DI_Adicao.ds_ad_ato_legal_antidump
            DropDownWidth = 300
            KeyField = 'Codigo'
            ListField = 'Codigo;Descricao'
            ListSource = datm_DI_Adicao.ds_tp_ato_legal
            ParentCtl3D = False
            TabOrder = 1
          end
          object dbedt_ex_ato_legal_antidump: TDBEdit
            Left = 184
            Top = 112
            Width = 41
            Height = 19
            Ctl3D = False
            DataField = 'NR_EX_ATO_VINCUL'
            DataSource = datm_DI_Adicao.ds_ad_ato_legal_antidump
            ParentCtl3D = False
            TabOrder = 0
            OnExit = dbedt_ex_ato_legal_antidumpExit
          end
        end
        object tbsht_calculos: TTabSheet
          Caption = 'C'#225'&lculos'
          DesignSize = (
            729
            439)
          object StaticText5: TStaticText
            Left = 148
            Top = 7
            Width = 471
            Height = 36
            Alignment = taCenter
            Anchors = [akTop, akRight]
            AutoSize = False
            BevelInner = bvLowered
            BevelKind = bkSoft
            BevelOuter = bvRaised
            BorderStyle = sbsSingle
            Caption = 
              'Os c'#225'lculos s'#227'o resultantes do preenchimento dos dados de valora' +
              #231#227'o, Imposto de Importa'#231#227'o, Imposto sobre Produtos Industrializa' +
              'dos e Direitos Antidumping'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlue
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            TabOrder = 0
          end
          object gbII: TGroupBox
            Left = 3
            Top = 82
            Width = 140
            Height = 331
            Caption = ' I.I.'
            TabOrder = 1
            object Label56: TLabel
              Left = 11
              Top = 24
              Width = 57
              Height = 13
              Caption = 'Calculado'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object Label60: TLabel
              Left = 11
              Top = 73
              Width = 114
              Height = 13
              Caption = 'Calculado Reduzido'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object Label61: TLabel
              Left = 11
              Top = 122
              Width = 41
              Height = 13
              Caption = 'Devido'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object Label62: TLabel
              Left = 11
              Top = 171
              Width = 64
              Height = 13
              Caption = 'A Recolher'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object Label103: TLabel
              Left = 11
              Top = 234
              Width = 32
              Height = 13
              Caption = 'Multa'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object Label104: TLabel
              Left = 11
              Top = 283
              Width = 31
              Height = 13
              Caption = 'Juros'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object Bevel1: TBevel
              Left = 5
              Top = 223
              Width = 130
              Height = 2
            end
            object dbedt_vl_ii_calculado: TDBEdit
              Left = 11
              Top = 44
              Width = 118
              Height = 21
              TabStop = False
              Color = clMenu
              DataField = 'VL_CALC_IPT_ADVAL'
              DataSource = datm_DI_Adicao.ds_ad_ii
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlue
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
              TabOrder = 0
            end
            object dbedt_vl_ii_reduzido: TDBEdit
              Left = 11
              Top = 93
              Width = 118
              Height = 21
              TabStop = False
              Color = clMenu
              DataField = 'VL_CALC_II_AC_TARI'
              DataSource = datm_DI_Adicao.ds_ad_ii
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlue
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
              TabOrder = 1
            end
            object dbedt_vl_ii_devido: TDBEdit
              Left = 11
              Top = 142
              Width = 118
              Height = 21
              TabStop = False
              Color = clMenu
              DataField = 'VL_IMPOSTO_DEVIDO'
              DataSource = datm_DI_Adicao.ds_ad_ii
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlue
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
              TabOrder = 2
            end
            object dbedt_vl_ii_a_recolher: TDBEdit
              Left = 11
              Top = 191
              Width = 118
              Height = 21
              TabStop = False
              Color = clMenu
              DataField = 'VL_IPT_A_RECOLHER'
              DataSource = datm_DI_Adicao.ds_ad_ii
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlue
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
              TabOrder = 3
            end
            object dbedtVL_MULTA_II: TDBEdit
              Left = 11
              Top = 254
              Width = 118
              Height = 21
              DataField = 'VL_MULTA_II'
              DataSource = datm_DI_Adicao.ds_adicao
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlue
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
              TabOrder = 4
            end
            object dbedtVL_JUROS_II: TDBEdit
              Left = 11
              Top = 303
              Width = 118
              Height = 21
              DataField = 'VL_JUROS_II'
              DataSource = datm_DI_Adicao.ds_adicao
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlue
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
              TabOrder = 5
            end
          end
          object gbIPI: TGroupBox
            Left = 146
            Top = 82
            Width = 140
            Height = 331
            Caption = ' I.P.I.'
            TabOrder = 2
            object Label69: TLabel
              Left = 11
              Top = 24
              Width = 41
              Height = 13
              Caption = 'Devido'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object Label70: TLabel
              Left = 11
              Top = 73
              Width = 64
              Height = 13
              Caption = 'A Recolher'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object Label105: TLabel
              Left = 11
              Top = 234
              Width = 32
              Height = 13
              Caption = 'Multa'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object Label106: TLabel
              Left = 11
              Top = 283
              Width = 31
              Height = 13
              Caption = 'Juros'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object Bevel6: TBevel
              Left = 5
              Top = 223
              Width = 130
              Height = 2
            end
            object dbedt_vl_ipi_devido: TDBEdit
              Left = 11
              Top = 44
              Width = 118
              Height = 21
              TabStop = False
              Color = clMenu
              DataField = 'VL_IMPOSTO_DEVIDO'
              DataSource = datm_DI_Adicao.ds_ad_ipi
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlue
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
              TabOrder = 0
            end
            object dbedt_vl_ipi_a_recolher: TDBEdit
              Left = 11
              Top = 93
              Width = 118
              Height = 21
              TabStop = False
              Color = clMenu
              DataField = 'VL_IPT_A_RECOLHER'
              DataSource = datm_DI_Adicao.ds_ad_ipi
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlue
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
              TabOrder = 1
            end
            object dbedtVL_MULTA_IPI: TDBEdit
              Left = 11
              Top = 254
              Width = 118
              Height = 21
              DataField = 'VL_MULTA_IPI'
              DataSource = datm_DI_Adicao.ds_adicao
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlue
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
              TabOrder = 2
            end
            object dbedtVL_JUROS_IPI: TDBEdit
              Left = 11
              Top = 303
              Width = 118
              Height = 21
              DataField = 'VL_JUROS_IPI'
              DataSource = datm_DI_Adicao.ds_adicao
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlue
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
              TabOrder = 3
            end
          end
          object gbAntidumping: TGroupBox
            Left = 575
            Top = 82
            Width = 140
            Height = 221
            Caption = ' Antidumping '
            TabOrder = 5
            object Label71: TLabel
              Left = 11
              Top = 24
              Width = 41
              Height = 13
              Caption = 'Devido'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object Label72: TLabel
              Left = 11
              Top = 73
              Width = 64
              Height = 13
              Caption = 'A Recolher'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object dbedt_vl_ad_devido: TDBEdit
              Left = 11
              Top = 44
              Width = 118
              Height = 21
              TabStop = False
              Color = clMenu
              DataField = 'VL_IMPOSTO_DEVIDO'
              DataSource = datm_DI_Adicao.ds_ad_antidump
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlue
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
              TabOrder = 0
            end
            object dbedt_vl_ad_a_recolher: TDBEdit
              Left = 11
              Top = 93
              Width = 118
              Height = 21
              TabStop = False
              Color = clMenu
              DataField = 'VL_IPT_A_RECOLHER'
              DataSource = datm_DI_Adicao.ds_ad_antidump
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlue
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
              TabOrder = 1
            end
          end
          object gbPIS: TGroupBox
            Left = 289
            Top = 82
            Width = 140
            Height = 331
            Caption = ' PIS '
            TabOrder = 3
            object Label99: TLabel
              Left = 11
              Top = 24
              Width = 57
              Height = 13
              Caption = 'Calculado'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object Label100: TLabel
              Left = 11
              Top = 73
              Width = 64
              Height = 13
              Caption = 'A Recolher'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object Label107: TLabel
              Left = 11
              Top = 234
              Width = 32
              Height = 13
              Caption = 'Multa'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object Label108: TLabel
              Left = 11
              Top = 283
              Width = 31
              Height = 13
              Caption = 'Juros'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object Bevel11: TBevel
              Left = 5
              Top = 223
              Width = 130
              Height = 2
            end
            object dbedt_vl_pis_calculado: TDBEdit
              Left = 11
              Top = 44
              Width = 118
              Height = 21
              TabStop = False
              Color = clMenu
              DataField = 'VL_PIS_CALCULADO'
              DataSource = datm_DI_Adicao.ds_adicao
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlue
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
              TabOrder = 0
            end
            object dbedt_vl_pis2: TDBEdit
              Left = 11
              Top = 93
              Width = 118
              Height = 21
              TabStop = False
              Color = clMenu
              DataField = 'VL_PIS'
              DataSource = datm_DI_Adicao.ds_adicao
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlue
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
              TabOrder = 1
            end
            object dbedtVL_MULTA_PIS: TDBEdit
              Left = 11
              Top = 254
              Width = 118
              Height = 21
              DataField = 'VL_MULTA_PIS'
              DataSource = datm_DI_Adicao.ds_adicao
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlue
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
              TabOrder = 2
            end
            object dbedtVL_JUROS_PIS: TDBEdit
              Left = 11
              Top = 303
              Width = 118
              Height = 21
              DataField = 'VL_JUROS_PIS'
              DataSource = datm_DI_Adicao.ds_adicao
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlue
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
              TabOrder = 3
            end
          end
          object gbCOFINS: TGroupBox
            Left = 432
            Top = 82
            Width = 140
            Height = 331
            Caption = ' COFINS '
            TabOrder = 4
            object Label101: TLabel
              Left = 11
              Top = 24
              Width = 57
              Height = 13
              Caption = 'Calculado'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object Label102: TLabel
              Left = 11
              Top = 73
              Width = 64
              Height = 13
              Caption = 'A Recolher'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object Label109: TLabel
              Left = 11
              Top = 234
              Width = 32
              Height = 13
              Caption = 'Multa'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object Label112: TLabel
              Left = 11
              Top = 283
              Width = 31
              Height = 13
              Caption = 'Juros'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object Bevel12: TBevel
              Left = 5
              Top = 223
              Width = 130
              Height = 2
            end
            object dbedt_vl_cofins_calculado: TDBEdit
              Left = 11
              Top = 44
              Width = 118
              Height = 21
              TabStop = False
              Color = clMenu
              DataField = 'VL_COFINS_CALCULADO'
              DataSource = datm_DI_Adicao.ds_adicao
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlue
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
              TabOrder = 0
            end
            object dbedt_vl_cofins2: TDBEdit
              Left = 11
              Top = 93
              Width = 118
              Height = 21
              TabStop = False
              Color = clMenu
              DataField = 'VL_COFINS'
              DataSource = datm_DI_Adicao.ds_adicao
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlue
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
              TabOrder = 1
            end
            object dbedtVL_MULTA_COFINS: TDBEdit
              Left = 11
              Top = 254
              Width = 118
              Height = 21
              DataField = 'VL_MULTA_COFINS'
              DataSource = datm_DI_Adicao.ds_adicao
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlue
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
              TabOrder = 2
            end
            object dbedtVL_JUROS_COFINS: TDBEdit
              Left = 11
              Top = 303
              Width = 118
              Height = 21
              DataField = 'VL_JUROS_COFINS'
              DataSource = datm_DI_Adicao.ds_adicao
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlue
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
              TabOrder = 3
            end
          end
          object dbcb_in_fma: TcxDBCheckBox
            Left = 3
            Top = 10
            Caption = 'Recolhimento de impostos via Darf'
            DataBinding.DataField = 'IN_FMA'
            DataBinding.DataSource = datm_DI_Adicao.ds_di
            Properties.ImmediatePost = True
            Properties.MultiLine = True
            Properties.NullStyle = nssUnchecked
            Properties.ValueChecked = '1'
            Properties.ValueGrayed = '0'
            Style.BorderStyle = ebs3D
            TabOrder = 6
            Width = 126
          end
          object pnlPagamentoDarf: TPanel
            Left = 0
            Top = 48
            Width = 265
            Height = 26
            BevelOuter = bvNone
            TabOrder = 7
            object Label113: TLabel
              Left = 5
              Top = 8
              Width = 136
              Height = 13
              Caption = 'Data Pagamento DARF:'
            end
            object cxdbedtDT_PAGAMENTO_DARF: TcxDBDateEdit
              Left = 144
              Top = 4
              DataBinding.DataField = 'DT_PAGAMENTO_DARF'
              DataBinding.DataSource = datm_DI_Adicao.ds_di
              Properties.ImmediatePost = True
              Style.BorderStyle = ebs3D
              TabOrder = 0
              Width = 121
            end
          end
        end
        object tbsht_ncm_pis_cofins: TTabSheet
          Caption = 'PIS/COFINS'
          OnShow = tbsht_ncm_pis_cofinsShow
          object Shape11: TShape
            Left = 17
            Top = 254
            Width = 696
            Height = 22
            Brush.Style = bsClear
            Pen.Color = clGray
          end
          object Bevel13: TBevel
            Left = 17
            Top = 278
            Width = 697
            Height = 55
            Shape = bsFrame
          end
          object Label73: TLabel
            Left = 16
            Top = 3
            Width = 28
            Height = 13
            Caption = 'NCM'
            Transparent = True
          end
          object Shape10: TShape
            Left = 17
            Top = 48
            Width = 432
            Height = 22
            Brush.Style = bsClear
            Pen.Color = clGray
          end
          object Label64: TLabel
            Left = 29
            Top = 287
            Width = 89
            Height = 13
            Caption = 'Base Pis Cofins'
            FocusControl = dbedt_base_pis
          end
          object Label65: TLabel
            Left = 133
            Top = 287
            Width = 18
            Height = 13
            Caption = 'Pis'
            FocusControl = dbedt_vl_pis
          end
          object Label66: TLabel
            Left = 229
            Top = 287
            Width = 36
            Height = 13
            Caption = 'Cofins'
            FocusControl = dbedt_vl_cofins
          end
          object Label86: TLabel
            Left = 333
            Top = 287
            Width = 102
            Height = 13
            Caption = 'Redu'#231#227'o da Base'
            FocusControl = dbedt_vl_cofins
          end
          object Label87: TLabel
            Left = 378
            Top = 304
            Width = 10
            Height = 13
            Caption = '%'
          end
          object Label68: TLabel
            Left = 16
            Top = 339
            Width = 58
            Height = 13
            Caption = 'Descri'#231#227'o'
          end
          object Label23: TLabel
            Left = 21
            Top = 53
            Width = 63
            Height = 13
            Caption = ' Al'#237'quotas '
            Transparent = True
          end
          object lbl3: TLabel
            Left = 21
            Top = 260
            Width = 53
            Height = 13
            Caption = ' C'#225'lculos'
            Transparent = True
          end
          object shp3: TShape
            Left = 458
            Top = 48
            Width = 254
            Height = 22
            Brush.Style = bsClear
            Pen.Color = clGray
          end
          object bvl1: TBevel
            Left = 458
            Top = 72
            Width = 255
            Height = 178
            Shape = bsFrame
          end
          object btnFundLegal: TSpeedButton
            Left = 677
            Top = 181
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
            OnClick = btnFundLegalClick
          end
          object lbl4: TLabel
            Left = 469
            Top = 53
            Width = 126
            Height = 13
            Caption = 'Regime de Tributa'#231#227'o'
          end
          object lbl6: TLabel
            Left = 468
            Top = 167
            Width = 68
            Height = 13
            Caption = 'Fund. Legal'
          end
          object Label121: TLabel
            Left = 469
            Top = 207
            Width = 108
            Height = 13
            Caption = 'Fund.Legal DUIMP'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object btn_co_Fund_legal_piscofins_duimp: TSpeedButton
            Left = 677
            Top = 221
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
            OnClick = btn_co_Fund_legal_piscofins_duimpClick
          end
          object dbchk_manual: TDBCheckBox
            Left = 141
            Top = 18
            Width = 402
            Height = 17
            Caption = 'Altera'#231#227'o Manual das Al'#237'quotas e Regime de Tributa'#231#227'o'
            DataField = 'IN_MANUAL_NCM'
            DataSource = datm_DI_Adicao.ds_adicao
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
            TabOrder = 1
            ValueChecked = '1'
            ValueUnchecked = '0'
          end
          object DBEdit6: TDBEdit
            Left = 17
            Top = 17
            Width = 109
            Height = 21
            DataField = 'CD_MERCADORIA_NCM'
            DataSource = datm_DI_Adicao.ds_adicao
            Enabled = False
            MaxLength = 8
            ParentColor = True
            TabOrder = 0
            OnChange = dbedt_cd_ncm_shChange
            OnKeyDown = dbedt_cd_pais_origem1KeyDown
          end
          object dbedt_base_pis: TDBEdit
            Left = 30
            Top = 301
            Width = 89
            Height = 21
            DataField = 'VL_BASE_PIS'
            DataSource = datm_DI_Adicao.ds_adicao
            Enabled = False
            ParentColor = True
            TabOrder = 7
          end
          object dbedt_vl_pis: TDBEdit
            Left = 134
            Top = 301
            Width = 81
            Height = 21
            DataField = 'VL_PIS'
            DataSource = datm_DI_Adicao.ds_adicao
            Enabled = False
            ParentColor = True
            TabOrder = 8
          end
          object dbedt_vl_cofins: TDBEdit
            Left = 230
            Top = 301
            Width = 89
            Height = 21
            DataField = 'VL_COFINS'
            DataSource = datm_DI_Adicao.ds_adicao
            Enabled = False
            ParentColor = True
            TabOrder = 9
          end
          object dbedt_reduc_base: TDBEdit
            Left = 334
            Top = 301
            Width = 39
            Height = 21
            DataField = 'PC_REDUCAO_PIS_COFINS'
            DataSource = datm_DI_Adicao.ds_adicao
            TabOrder = 10
          end
          object dbmemo_pis_cofins: TDBMemo
            Left = 17
            Top = 353
            Width = 697
            Height = 76
            DataField = 'TX_PIS_COFINS'
            DataSource = datm_DI_Adicao.ds_adicao
            TabOrder = 11
          end
          object dbrdgr_reg_trib_pis_cofins: TDBRadioGroup
            Left = 467
            Top = 75
            Width = 235
            Height = 70
            Color = clBtnFace
            Columns = 2
            DataField = 'CD_TIPO_BENEF_PIS_COFINS'
            DataSource = datm_DI_Adicao.ds_adicao
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
            TabOrder = 3
            Values.Strings = (
              '1'
              '3'
              '2'
              '4'
              '5')
            OnChange = dbrdgr_reg_trib_pis_cofinsChange
          end
          object edtFundLegalPisCofins: TEdit
            Left = 496
            Top = 181
            Width = 177
            Height = 21
            TabStop = False
            Color = clMenu
            Ctl3D = True
            ParentCtl3D = False
            ReadOnly = True
            TabOrder = 6
          end
          object dbedtCD_FUND_LEGAL_PISCOFINS: TDBEdit
            Left = 468
            Top = 181
            Width = 29
            Height = 21
            DataField = 'CD_FUND_LEGAL_PISCOFINS'
            DataSource = datm_DI_Adicao.ds_adicao
            TabOrder = 5
            OnChange = btnFundLegalClick
            OnExit = dbedt_cd_reg_tribExit
            OnKeyDown = dbedt_cd_pais_origem1KeyDown
          end
          object pgcAliquotas_PIS_COFINS: TPageControl
            Left = 18
            Top = 73
            Width = 431
            Height = 176
            ActivePage = tbsAliquota_COFINS
            MultiLine = True
            TabOrder = 2
            TabPosition = tpLeft
            object tbsAliquota_PIS: TTabSheet
              Caption = 'PIS'
              object GroupBox2: TGroupBox
                Left = 8
                Top = 0
                Width = 116
                Height = 118
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
                object Label94: TLabel
                  Left = 13
                  Top = 69
                  Width = 54
                  Height = 13
                  Caption = 'Reduzida'
                  FocusControl = dbedt_aliq_pis_reduzida
                end
                object dbedt_aliq_pis: TDBEdit
                  Left = 14
                  Top = 36
                  Width = 89
                  Height = 21
                  DataField = 'ALIQ_PIS'
                  DataSource = datm_DI_Adicao.ds_adicao
                  TabOrder = 1
                  OnEnter = dbedt_aliq_pisEnter
                  OnExit = dbedt_aliq_pisExit
                end
                object dbedt_aliq_pis_reduzida: TDBEdit
                  Left = 14
                  Top = 84
                  Width = 89
                  Height = 21
                  DataField = 'ALIQ_PIS_REDUZIDA'
                  DataSource = datm_DI_Adicao.ds_adicao
                  TabOrder = 0
                  OnEnter = dbedt_aliq_pisEnter
                  OnExit = dbedt_aliq_pisExit
                end
              end
              object GroupBox3: TGroupBox
                Left = 128
                Top = 0
                Width = 275
                Height = 118
                Caption = 'Espec'#237'fica'
                TabOrder = 1
                object Label83: TLabel
                  Left = 11
                  Top = 21
                  Width = 49
                  Height = 13
                  Caption = 'Al'#237'quota'
                end
                object Label88: TLabel
                  Left = 134
                  Top = 21
                  Width = 135
                  Height = 13
                  Caption = 'Quantidade na Unidade'
                end
                object Label89: TLabel
                  Left = 11
                  Top = 69
                  Width = 111
                  Height = 13
                  Caption = 'Unidade de Medida'
                end
                object btnUnidadeMedidaPIS: TSpeedButton
                  Left = 242
                  Top = 83
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
                  Top = 36
                  Width = 115
                  Height = 21
                  DataField = 'VL_ALIQUOTA_ESPECIFICA_PIS'
                  DataSource = datm_DI_Adicao.ds_adicao
                  TabOrder = 0
                  OnExit = dbedt_VL_ALIQUOTA_ESPECIFICA_PISExit
                end
                object dbedt_QTD_UNID_ESPECIFICA_PIS: TDBEdit
                  Left = 135
                  Top = 36
                  Width = 115
                  Height = 21
                  DataField = 'QTD_UNID_ESPECIFICA_PIS'
                  DataSource = datm_DI_Adicao.ds_adicao
                  TabOrder = 1
                  OnExit = dbedt_QTD_UNID_ESPECIFICA_PISExit
                end
                object dbedt_CD_UNIDADE_MEDIDA_PIS: TDBEdit
                  Left = 12
                  Top = 84
                  Width = 37
                  Height = 21
                  DataField = 'CD_UNIDADE_MEDIDA_PIS'
                  DataSource = datm_DI_Adicao.ds_adicao
                  TabOrder = 2
                  OnChange = dbedt_CD_UNIDADE_MEDIDA_PISChange
                  OnExit = dbedt_CD_UNIDADE_MEDIDA_COFINSExit
                  OnKeyPress = dbedt_CD_UNIDADE_MEDIDA_PISKeyPress
                end
                object edtUnidadeMedidaPIS: TEdit
                  Left = 50
                  Top = 84
                  Width = 191
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
              object GroupBox4: TGroupBox
                Left = 8
                Top = 0
                Width = 116
                Height = 118
                Caption = 'Ad Valorem'
                TabOrder = 0
                object Label26: TLabel
                  Left = 13
                  Top = 21
                  Width = 49
                  Height = 13
                  Caption = 'Al'#237'quota'
                  FocusControl = dbedt_aliq_cofins
                end
                object Label95: TLabel
                  Left = 13
                  Top = 69
                  Width = 54
                  Height = 13
                  Caption = 'Reduzida'
                  FocusControl = dbedt_aliq_cofins_reduzida
                end
                object dbedt_aliq_cofins: TDBEdit
                  Left = 14
                  Top = 36
                  Width = 89
                  Height = 21
                  DataField = 'ALIQ_COFINS'
                  DataSource = datm_DI_Adicao.ds_adicao
                  TabOrder = 1
                  OnEnter = dbedt_aliq_cofinsEnter
                  OnExit = dbedt_aliq_cofinsExit
                end
                object dbedt_aliq_cofins_reduzida: TDBEdit
                  Left = 14
                  Top = 84
                  Width = 89
                  Height = 21
                  DataField = 'ALIQ_COFINS_REDUZIDA'
                  DataSource = datm_DI_Adicao.ds_adicao
                  TabOrder = 0
                  OnEnter = dbedt_aliq_cofinsEnter
                  OnExit = dbedt_aliq_cofinsExit
                end
              end
              object GroupBox8: TGroupBox
                Left = 128
                Top = 0
                Width = 275
                Height = 118
                Caption = 'Espec'#237'fica'
                TabOrder = 1
                object Label90: TLabel
                  Left = 11
                  Top = 21
                  Width = 49
                  Height = 13
                  Caption = 'Al'#237'quota'
                end
                object Label91: TLabel
                  Left = 134
                  Top = 21
                  Width = 135
                  Height = 13
                  Caption = 'Quantidade na Unidade'
                end
                object Label92: TLabel
                  Left = 11
                  Top = 69
                  Width = 111
                  Height = 13
                  Caption = 'Unidade de Medida'
                end
                object btnUnidadeMedidaCOFINS: TSpeedButton
                  Left = 242
                  Top = 83
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
                  Top = 36
                  Width = 115
                  Height = 21
                  DataField = 'VL_ALIQUOTA_ESPECIFICA_COFINS'
                  DataSource = datm_DI_Adicao.ds_adicao
                  TabOrder = 0
                  OnExit = dbedt_VL_ALIQUOTA_ESPECIFICA_COFINSExit
                end
                object dbedt_QTD_UNID_ESPECIFICA_COFINS: TDBEdit
                  Left = 135
                  Top = 36
                  Width = 115
                  Height = 21
                  DataField = 'QTD_UNID_ESPECIFICA_COFINS'
                  DataSource = datm_DI_Adicao.ds_adicao
                  TabOrder = 1
                  OnExit = dbedt_QTD_UNID_ESPECIFICA_COFINSExit
                end
                object dbedt_CD_UNIDADE_MEDIDA_COFINS: TDBEdit
                  Left = 12
                  Top = 84
                  Width = 37
                  Height = 21
                  DataField = 'CD_UNIDADE_MEDIDA_COFINS'
                  DataSource = datm_DI_Adicao.ds_adicao
                  TabOrder = 2
                  OnChange = dbedt_CD_UNIDADE_MEDIDA_COFINSChange
                  OnExit = dbedt_CD_UNIDADE_MEDIDA_COFINSExit
                  OnKeyPress = dbedt_CD_UNIDADE_MEDIDA_PISKeyPress
                end
                object edtUnidadeMedidaCOFINS: TEdit
                  Left = 50
                  Top = 84
                  Width = 191
                  Height = 21
                  TabStop = False
                  Color = clMenu
                  ReadOnly = True
                  TabOrder = 3
                end
              end
            end
          end
          object dbchk_IN_SUSPENDE_PIS_COFINS_RETIFIC: TDBCheckBox
            Left = 468
            Top = 148
            Width = 147
            Height = 17
            Caption = 'Suspender retifica'#231#227'o'
            DataField = 'IN_SUSPENDE_PIS_COFINS_RETIFIC'
            DataSource = datm_DI_Adicao.ds_adicao
            TabOrder = 4
            ValueChecked = 'True'
            ValueUnchecked = 'False'
            OnClick = dbcb_ipi_nao_tributavelClick
          end
          object dbedt_cd_fund_legal_piscofins_duimp: TDBEdit
            Left = 468
            Top = 222
            Width = 43
            Height = 21
            DataField = 'CD_FUND_LEGAL_PISCOFINS_DUIMP'
            DataSource = datm_DI_Adicao.ds_adicao
            TabOrder = 12
            OnExit = btn_co_Fund_legal_piscofins_duimpClick
            OnKeyDown = dbedt_cd_pais_origem1KeyDown
          end
          object dbedt_desc_fund_leg_piscofins_duimp: TDBEdit
            Left = 511
            Top = 222
            Width = 162
            Height = 21
            TabStop = False
            Color = clMenu
            Ctl3D = True
            DataField = 'Look_fund_legal_piscofins_duimp'
            DataSource = datm_DI_Adicao.ds_adicao
            ParentCtl3D = False
            ReadOnly = True
            TabOrder = 13
          end
        end
        object tbsht_ibs_cbs: TTabSheet
          Caption = 'IBS/CBS'
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
              Width = 46
              Height = 13
              Caption = 'Valor IS'
            end
            object lbl_valor_CIDE: TLabel
              Left = 13
              Top = 56
              Width = 63
              Height = 13
              Caption = 'Valor CIDE'
            end
            object lbl_valor_dir_comp: TLabel
              Left = 13
              Top = 83
              Width = 169
              Height = 13
              Caption = 'Valor Direitos compensat'#243'rios'
            end
            object lbl_valor_med_salv: TLabel
              Left = 13
              Top = 110
              Width = 154
              Height = 13
              Caption = 'Valor Medidas salvaguarda'
            end
            object lbl_valor_outros_trib: TLabel
              Left = 13
              Top = 137
              Width = 117
              Height = 13
              Caption = 'Valor Outros tributos'
            end
            object dbedt_valor_is: TDBEdit
              Left = 200
              Top = 25
              Width = 120
              Height = 21
              DataField = 'VL_IS'
              DataSource = datm_DI_Adicao.ds_adicao
              TabOrder = 0
            end
            object dbedt_valor_CIDE: TDBEdit
              Left = 200
              Top = 52
              Width = 120
              Height = 21
              DataField = 'VL_CIDE'
              DataSource = datm_DI_Adicao.ds_adicao
              TabOrder = 1
            end
            object dbedt_valor_dir_comp: TDBEdit
              Left = 200
              Top = 79
              Width = 120
              Height = 21
              DataField = 'VL_DIR_COMP'
              DataSource = datm_DI_Adicao.ds_adicao
              TabOrder = 2
            end
            object dbedt_valor_med_salv: TDBEdit
              Left = 200
              Top = 106
              Width = 120
              Height = 21
              DataField = 'VL_MED_SAL'
              DataSource = datm_DI_Adicao.ds_adicao
              TabOrder = 3
            end
            object dbedt_valor_outros_trib: TDBEdit
              Left = 200
              Top = 133
              Width = 120
              Height = 21
              DataField = 'VL_OUTROS_TRIB'
              DataSource = datm_DI_Adicao.ds_adicao
              TabOrder = 4
            end
          end
          object GroupBox12: TGroupBox
            Left = 370
            Top = 15
            Width = 340
            Height = 170
            Caption = ' Al'#237'quotas '
            TabOrder = 1
            object lbl_aliq_ibs_uf: TLabel
              Left = 13
              Top = 29
              Width = 93
              Height = 13
              Caption = 'Al'#237'quota IBS UF'
            end
            object lbl_aliq_ibs_municipio: TLabel
              Left = 13
              Top = 56
              Width = 133
              Height = 13
              Caption = 'Al'#237'quota IBS Munic'#237'pio'
            end
            object lbl_aliq_cbs: TLabel
              Left = 13
              Top = 83
              Width = 77
              Height = 13
              Caption = 'Al'#237'quota CBS'
            end
            object dbedt_aliq_ibs_uf: TDBEdit
              Left = 200
              Top = 25
              Width = 120
              Height = 21
              DataField = 'ALIQ_IBS_UF'
              DataSource = datm_DI_Adicao.ds_adicao
              TabOrder = 0
            end
            object dbedt_aliq_ibs_municipio: TDBEdit
              Left = 200
              Top = 52
              Width = 120
              Height = 21
              DataField = 'ALIQ_IBS_MUN'
              DataSource = datm_DI_Adicao.ds_adicao
              TabOrder = 1
            end
            object dbedt_aliq_cbs: TDBEdit
              Left = 200
              Top = 79
              Width = 120
              Height = 21
              DataField = 'ALIQ_CBS'
              DataSource = datm_DI_Adicao.ds_adicao
              TabOrder = 2
            end
          end
          object GroupBox13: TGroupBox
            Left = 370
            Top = 199
            Width = 340
            Height = 170
            Caption = ' Valores Calculados '
            TabOrder = 2
            object lbl_base_ibs_cbs: TLabel
              Left = 13
              Top = 29
              Width = 162
              Height = 13
              Caption = 'Valor Base C'#225'lculo IBS/CBS'
            end
            object lbl_valor_ibs_municipio: TLabel
              Left = 13
              Top = 83
              Width = 112
              Height = 13
              Caption = 'Valor IBS Municipio'
            end
            object lbl_valor_ibs_uf: TLabel
              Left = 13
              Top = 56
              Width = 74
              Height = 13
              Caption = 'Valor IBS UF'
            end
            object lbl_valor_cbs: TLabel
              Left = 13
              Top = 110
              Width = 58
              Height = 13
              Caption = 'Valor CBS'
            end
            object dbedt_base_ibs_cbs: TDBEdit
              Left = 200
              Top = 25
              Width = 120
              Height = 21
              DataField = 'VL_BASE_IBS_CBS'
              DataSource = datm_DI_Adicao.ds_adicao
              Enabled = False
              ReadOnly = True
              TabOrder = 0
            end
            object dbedt_valor_ibs_municipio: TDBEdit
              Left = 200
              Top = 79
              Width = 120
              Height = 21
              DataField = 'VL_IBS_MUN'
              DataSource = datm_DI_Adicao.ds_adicao
              Enabled = False
              ReadOnly = True
              TabOrder = 2
            end
            object dbedt_valor_ibs_uf: TDBEdit
              Left = 200
              Top = 52
              Width = 120
              Height = 21
              DataField = 'VL_IBS_UF'
              DataSource = datm_DI_Adicao.ds_adicao
              Enabled = False
              ReadOnly = True
              TabOrder = 1
            end
            object dbedt_valor_cbs: TDBEdit
              Left = 200
              Top = 106
              Width = 120
              Height = 21
              DataField = 'VL_CBS'
              DataSource = datm_DI_Adicao.ds_adicao
              Enabled = False
              ReadOnly = True
              TabOrder = 3
            end
          end
        end
      end
    end
    object tbsht_tributo_TD19: TTabSheet
      Caption = '&Tributo'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabVisible = False
      object Bevel2: TBevel
        Left = 24
        Top = 16
        Width = 569
        Height = 305
        Shape = bsFrame
        Style = bsRaised
      end
      object Label36: TLabel
        Left = 256
        Top = 8
        Width = 25
        Height = 13
        Caption = '  I.I.'
      end
      object GroupBox5: TGroupBox
        Left = 32
        Top = 28
        Width = 553
        Height = 101
        Caption = ' Regime de Tributa'#231#227'o '
        TabOrder = 0
        object Label34: TLabel
          Left = 36
          Top = 30
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
        object SpeedButton13: TSpeedButton
          Left = 341
          Top = 26
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
        end
        object Label35: TLabel
          Left = 12
          Top = 66
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
        object SpeedButton15: TSpeedButton
          Left = 513
          Top = 62
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
        end
        object dbedt_cd_reg_trib1: TDBEdit
          Left = 80
          Top = 26
          Width = 21
          Height = 21
          DataField = 'CD_REGIME_TRIBUTAR'
          DataSource = datm_DI_Adicao.ds_adicao
          MaxLength = 5
          TabOrder = 0
        end
        object dbedt_nm_reg_trib: TDBEdit
          Left = 104
          Top = 26
          Width = 233
          Height = 21
          TabStop = False
          Color = clMenu
          Ctl3D = True
          DataField = 'Look_Reg_trib'
          DataSource = datm_DI_Adicao.ds_adicao
          ParentCtl3D = False
          ReadOnly = True
          TabOrder = 1
        end
        object dbedt_cd_fund_legal1: TDBEdit
          Left = 80
          Top = 62
          Width = 29
          Height = 21
          DataField = 'CD_FUND_LEG_REGIME'
          DataSource = datm_DI_Adicao.ds_adicao
          MaxLength = 5
          TabOrder = 2
        end
        object dbedt_nm_fund_legal: TDBEdit
          Left = 112
          Top = 62
          Width = 397
          Height = 21
          TabStop = False
          Color = clMenu
          Ctl3D = True
          ParentCtl3D = False
          ReadOnly = True
          TabOrder = 3
        end
      end
      object GroupBox6: TGroupBox
        Left = 32
        Top = 140
        Width = 553
        Height = 169
        Caption = ' Demostrativo do Coeficiente de Redu'#231#227'o '
        TabOrder = 1
        object Label37: TLabel
          Left = 45
          Top = 34
          Width = 75
          Height = 13
          Caption = 'Identifica'#231#227'o'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label38: TLabel
          Left = 36
          Top = 82
          Width = 84
          Height = 13
          Caption = 'Valor em Dolar'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label39: TLabel
          Left = 31
          Top = 130
          Width = 89
          Height = 13
          Caption = 'Imposto Devido'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label40: TLabel
          Left = 302
          Top = 26
          Width = 83
          Height = 26
          Caption = 'Coeficiente de Redu'#231#227'o'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          WordWrap = True
        end
        object Label41: TLabel
          Left = 307
          Top = 82
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
        object Label42: TLabel
          Left = 276
          Top = 130
          Width = 111
          Height = 13
          Caption = 'Imposto a Recolher'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object dbedt_nr_identificacao: TDBEdit
          Left = 128
          Top = 30
          Width = 97
          Height = 21
          DataField = 'NR_DCTO_REDUCAO'
          DataSource = datm_DI_Adicao.ds_adicao
          MaxLength = 5
          TabOrder = 0
        end
        object dbedt_vl_dolar_red_ii: TDBEdit
          Left = 128
          Top = 78
          Width = 97
          Height = 21
          DataField = 'VL_MERC_COND_VENDA'
          DataSource = datm_DI_Adicao.ds_adicao
          MaxLength = 5
          TabOrder = 1
        end
        object dbedt_vl_ii_devido2: TDBEdit
          Left = 128
          Top = 126
          Width = 97
          Height = 21
          DataField = 'VL_IMPOSTO_DEVIDO'
          DataSource = datm_DI_Adicao.ds_ad_ii
          MaxLength = 5
          TabOrder = 2
        end
        object dbedt_pc_reducao_ii: TDBEdit
          Left = 392
          Top = 30
          Width = 97
          Height = 21
          DataField = 'PC_COEF_REDUC_II'
          DataSource = datm_DI_Adicao.ds_adicao
          MaxLength = 5
          TabOrder = 3
        end
        object dbedt_vl_ii_em_real: TDBEdit
          Left = 392
          Top = 78
          Width = 97
          Height = 21
          DataField = 'VL_MERC_VENDA_MN'
          DataSource = datm_DI_Adicao.ds_adicao
          MaxLength = 5
          TabOrder = 4
        end
        object dbedt_vl_ii_a_recolher2: TDBEdit
          Left = 392
          Top = 126
          Width = 97
          Height = 21
          DataField = 'VL_IPT_A_RECOLHER'
          DataSource = datm_DI_Adicao.ds_ad_ii
          MaxLength = 5
          TabOrder = 5
        end
      end
    end
    object tbsht_cambio1: TTabSheet
      Caption = '&C'#226'mbio'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      object gbox_pg_cambio_2: TGroupBox
        Left = 56
        Top = 183
        Width = 617
        Height = 208
        TabOrder = 4
        object Label78: TLabel
          Left = 8
          Top = 15
          Width = 151
          Height = 13
          Caption = 'Modalidade de Pagamento'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object SpeedButton24: TSpeedButton
          Left = 585
          Top = 12
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
          OnClick = btn_co_mod_pagtoClick
        end
        object pgctrl_pg_cambio2: TPageControl
          Left = 4
          Top = 35
          Width = 609
          Height = 170
          ActivePage = tbsht_pg_cambio_em2
          TabOrder = 0
          object tbsht_pg_cambio_antec2: TTabSheet
            Caption = 'Pagamento A&ntecipado'
            object Bevel8: TBevel
              Left = 146
              Top = 36
              Width = 309
              Height = 50
              Shape = bsFrame
              Style = bsRaised
            end
            object Label110: TLabel
              Left = 182
              Top = 56
              Width = 90
              Height = 13
              Caption = 'Valor Vinculado'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object dbedt_vl_vinc_md_cambio_antec: TDBEdit
              Left = 284
              Top = 52
              Width = 129
              Height = 21
              DataField = 'VL_VINC_MD_CAMBIO'
              DataSource = datm_DI_Adicao.dsq_ad_cambio_pg_antecip
              MaxLength = 5
              TabOrder = 0
            end
          end
          object tbsht_pg_cambio_avista2: TTabSheet
            Caption = 'Pagamento '#224' V&ista'
            object Bevel9: TBevel
              Left = 146
              Top = 36
              Width = 309
              Height = 50
              Shape = bsFrame
              Style = bsRaised
            end
            object Label111: TLabel
              Left = 182
              Top = 56
              Width = 90
              Height = 13
              Caption = 'Valor Vinculado'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object dbedt_vl_vinc_md_cambio_avista: TDBEdit
              Left = 284
              Top = 52
              Width = 129
              Height = 21
              DataField = 'VL_VINC_MD_CAMBIO'
              DataSource = datm_DI_Adicao.dsq_ad_cambio_pg_avista
              MaxLength = 5
              TabOrder = 0
            end
          end
          object tbsht_pg_cambio_em2: TTabSheet
            Caption = '&Pagamento em at'#233' 180 Dias'
            object GroupBox17: TGroupBox
              Left = 340
              Top = 8
              Width = 257
              Height = 133
              TabOrder = 2
              object btn_co_taxa_juros_BACEN2: TSpeedButton
                Left = 173
                Top = 42
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
                OnClick = btn_co_taxa_juros_BACENClick
              end
              object Label84: TLabel
                Left = 40
                Top = 81
                Width = 81
                Height = 13
                Caption = 'Taxa de Juros'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = [fsBold]
                ParentFont = False
              end
              object Label85: TLabel
                Left = 84
                Top = 46
                Width = 40
                Height = 13
                Caption = 'C'#243'digo'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = [fsBold]
                ParentFont = False
                WordWrap = True
              end
              object dbedt_cd_taxa_juros2: TDBEdit
                Left = 128
                Top = 43
                Width = 41
                Height = 21
                DataField = 'CD_TAXA_JUROS'
                DataSource = datm_DI_Adicao.ds_adicao
                TabOrder = 0
                OnKeyDown = dbedt_cd_pais_origem1KeyDown
              end
              object dbedt_pc_taxa_juros2: TDBEdit
                Left = 128
                Top = 78
                Width = 117
                Height = 21
                DataField = 'PC_TAXA_JUROS'
                DataSource = datm_DI_Adicao.ds_adicao
                TabOrder = 1
              end
            end
            object dbrgrp_parcelas2: TDBRadioGroup
              Left = 0
              Top = -4
              Width = 337
              Height = 37
              Columns = 2
              Ctl3D = True
              DataField = 'IN_PGTO_VARIAV_360'
              DataSource = datm_DI_Adicao.ds_adicao
              Items.Strings = (
                'Parcelas Fixas'
                'Parcelas Vari'#225'veis')
              ParentCtl3D = False
              TabOrder = 0
              Values.Strings = (
                'False'
                'True')
              OnChange = dbrgrp_parcelas2Change
            end
            object Panel3: TPanel
              Left = 0
              Top = 32
              Width = 337
              Height = 109
              BevelInner = bvLowered
              Caption = 'Panel3'
              TabOrder = 1
              object ntbk_parcelas_2: TNotebook
                Left = 2
                Top = 2
                Width = 333
                Height = 105
                Align = alClient
                TabOrder = 0
                object TPage
                  Left = 0
                  Top = 0
                  Caption = 'Default'
                  object Label79: TLabel
                    Left = 6
                    Top = 16
                    Width = 86
                    Height = 13
                    Caption = 'N'#186' de Parcelas'
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clWindowText
                    Font.Height = -11
                    Font.Name = 'MS Sans Serif'
                    Font.Style = [fsBold]
                    ParentFont = False
                  end
                  object Label80: TLabel
                    Left = 142
                    Top = 16
                    Width = 78
                    Height = 13
                    Caption = 'Periodicidade'
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clWindowText
                    Font.Height = -11
                    Font.Name = 'MS Sans Serif'
                    Font.Style = [fsBold]
                    ParentFont = False
                  end
                  object Label81: TLabel
                    Left = 6
                    Top = 48
                    Width = 63
                    Height = 13
                    Caption = 'Valor Total'
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clWindowText
                    Font.Height = -11
                    Font.Name = 'MS Sans Serif'
                    Font.Style = [fsBold]
                    ParentFont = False
                  end
                  object Label82: TLabel
                    Left = 6
                    Top = 76
                    Width = 157
                    Height = 13
                    Caption = 'Indicador de Periodicidade:'
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clWindowText
                    Font.Height = -11
                    Font.Name = 'MS Sans Serif'
                    Font.Style = [fsBold]
                    ParentFont = False
                  end
                  object dbedt_qt_parcelas2: TDBEdit
                    Left = 96
                    Top = 12
                    Width = 33
                    Height = 21
                    DataField = 'QT_PARC_FINANC_360'
                    DataSource = datm_DI_Adicao.ds_adicao
                    MaxLength = 3
                    TabOrder = 0
                  end
                  object dbedt_qt_periodos2: TDBEdit
                    Left = 224
                    Top = 12
                    Width = 33
                    Height = 21
                    DataField = 'QT_PERIOD_PGTO_360'
                    DataSource = datm_DI_Adicao.ds_adicao
                    MaxLength = 3
                    TabOrder = 1
                  end
                  object dbedt_vl_total_financ2: TDBEdit
                    Left = 76
                    Top = 44
                    Width = 129
                    Height = 21
                    DataField = 'VL_TOT_FINANC_360'
                    DataSource = datm_DI_Adicao.ds_adicao
                    TabOrder = 2
                  end
                  object rbtn_ind_per_diaria2: TRadioButton
                    Left = 168
                    Top = 74
                    Width = 69
                    Height = 17
                    Caption = 'Di'#225'ria'
                    Enabled = False
                    TabOrder = 3
                    OnClick = rbtn_ind_per_diaria2Click
                  end
                  object rbtn_ind_per_mensal2: TRadioButton
                    Left = 240
                    Top = 74
                    Width = 69
                    Height = 17
                    Caption = 'Mensal'
                    Enabled = False
                    TabOrder = 4
                    OnClick = rbtn_ind_per_mensal2Click
                  end
                end
                object TPage
                  Left = 0
                  Top = 0
                  object dbedt_parc_var_cambio: TDBGrid
                    Left = 44
                    Top = 8
                    Width = 237
                    Height = 89
                    DataSource = datm_DI_Adicao.ds_ad_cambio_parc_var
                    Options = [dgEditing, dgTitles, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
                    TabOrder = 0
                    TitleFont.Charset = DEFAULT_CHARSET
                    TitleFont.Color = clWindowText
                    TitleFont.Height = -11
                    TitleFont.Name = 'MS Sans Serif'
                    TitleFont.Style = [fsBold]
                    Columns = <
                      item
                        Alignment = taCenter
                        Expanded = False
                        FieldName = 'DT_PREV_PGTO_360'
                        Title.Alignment = taCenter
                        Title.Color = clBlack
                        Title.Font.Charset = DEFAULT_CHARSET
                        Title.Font.Color = clWhite
                        Title.Font.Height = -11
                        Title.Font.Name = 'MS Sans Serif'
                        Title.Font.Style = [fsBold]
                        Width = 80
                        Visible = True
                      end
                      item
                        Expanded = False
                        FieldName = 'VL_PREV_PGTO_360'
                        Title.Alignment = taCenter
                        Title.Color = clBlack
                        Title.Font.Charset = DEFAULT_CHARSET
                        Title.Font.Color = clWhite
                        Title.Font.Height = -11
                        Title.Font.Name = 'MS Sans Serif'
                        Title.Font.Style = [fsBold]
                        Width = 132
                        Visible = True
                      end>
                  end
                end
              end
            end
            object dbchkbox_in_taxa_juros2: TDBCheckBox
              Left = 416
              Top = 4
              Width = 133
              Height = 17
              Caption = 'Com Taxa de Juros'
              DataField = 'IN_JUROS_ATE_360'
              DataSource = datm_DI_Adicao.ds_adicao
              TabOrder = 3
              ValueChecked = 'True'
              ValueUnchecked = 'False'
            end
          end
        end
        object dbedt_cd_mod_pagto_2: TDBEdit
          Left = 164
          Top = 12
          Width = 25
          Height = 21
          DataField = 'CD_MODALIDADE_PGTO'
          DataSource = datm_DI_Adicao.ds_adicao
          TabOrder = 1
          OnKeyDown = dbedt_cd_pais_origem1KeyDown
        end
        object dbedt_mod_pagto2: TDBEdit
          Left = 192
          Top = 12
          Width = 389
          Height = 21
          TabStop = False
          Color = clMenu
          Ctl3D = True
          DataField = 'DESCRICAO'
          DataSource = datm_DI_Adicao.ds_mod_pagto
          ParentCtl3D = False
          ReadOnly = True
          TabOrder = 2
        end
      end
      object gbox_pg_cambio_1: TGroupBox
        Left = 56
        Top = 181
        Width = 617
        Height = 209
        TabOrder = 2
        object btn_co_inst_financ: TSpeedButton
          Left = 585
          Top = 14
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
          OnClick = btn_co_inst_financClick
        end
        object lbl_inst_financ: TLabel
          Left = 36
          Top = 17
          Width = 123
          Height = 13
          Caption = 'Institui'#231#227'o Financeira'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          Visible = False
        end
        object lbl_mod_pagto: TLabel
          Left = 8
          Top = 17
          Width = 151
          Height = 13
          Caption = 'Modalidade de Pagamento'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object btn_co_mod_pagto: TSpeedButton
          Left = 585
          Top = 14
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
          OnClick = btn_co_mod_pagtoClick
        end
        object pgctrl_pg_cambio1: TPageControl
          Left = 4
          Top = 37
          Width = 609
          Height = 169
          ActivePage = tbsht_pg_cambio_antec1
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 1
          object tbsht_pg_cambio_antec1: TTabSheet
            Caption = 'Pagamento A&ntecipado'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlue
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
            object dbg_contrato_cambio_antec: TDBGrid
              Left = 0
              Top = 4
              Width = 601
              Height = 105
              DataSource = datm_DI_Adicao.dsq_ad_cambio_pg_antecip
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgConfirmDelete, dgCancelOnExit, dgMultiSelect]
              ParentFont = False
              ReadOnly = True
              TabOrder = 0
              TitleFont.Charset = EASTEUROPE_CHARSET
              TitleFont.Color = clWhite
              TitleFont.Height = -11
              TitleFont.Name = 'MS Sans Serif'
              TitleFont.Style = [fsBold]
              Columns = <
                item
                  Alignment = taCenter
                  Expanded = False
                  FieldName = 'Look_Moeda_Nac'
                  Title.Alignment = taCenter
                  Title.Color = clBlack
                  Width = 59
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'NR_OP_CAMBIO'
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -11
                  Font.Name = 'Microsoft Sans Serif'
                  Font.Style = [fsBold]
                  Title.Alignment = taCenter
                  Title.Caption = 'No. Contrato'
                  Title.Color = clBlack
                  Title.Font.Charset = EASTEUROPE_CHARSET
                  Title.Font.Color = clWhite
                  Title.Font.Height = -11
                  Title.Font.Name = 'Microsoft Sans Serif'
                  Title.Font.Style = [fsBold]
                  Width = 119
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'CD_BANCO_PAGAMENTO'
                  Title.Alignment = taCenter
                  Title.Color = clBlack
                  Width = 57
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'CD_PRACA_PAGAMENTO'
                  Title.Alignment = taCenter
                  Title.Color = clBlack
                  Width = 54
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'VL_VINC_MD_CAMBIO'
                  Title.Alignment = taCenter
                  Title.Color = clBlack
                  Width = 127
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'NR_COMPR_CAMBIO'
                  Title.Alignment = taCenter
                  Title.Color = clBlack
                  Width = 129
                  Visible = True
                end>
            end
            object btn_incluir_1: TBitBtn
              Left = 169
              Top = 116
              Width = 75
              Height = 21
              Caption = '&Incluir'
              TabOrder = 1
              OnClick = btn_incluir_1Click
            end
            object btn_alterar_1: TBitBtn
              Left = 265
              Top = 116
              Width = 75
              Height = 21
              Caption = '&Alterar'
              TabOrder = 2
              OnClick = btn_alterar_1Click
            end
            object btn_excluir_1: TBitBtn
              Left = 357
              Top = 116
              Width = 75
              Height = 21
              Caption = '&Excluir'
              TabOrder = 3
              OnClick = btn_excluir_1Click
            end
          end
          object tbsht_pg_cambio_avista1: TTabSheet
            Caption = 'Pagamento '#224' V&ista'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlue
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
            object dbg_contrato_cambio_av: TDBGrid
              Left = 0
              Top = 4
              Width = 601
              Height = 105
              DataSource = datm_DI_Adicao.dsq_ad_cambio_pg_avista
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgConfirmDelete, dgCancelOnExit, dgMultiSelect]
              ParentFont = False
              TabOrder = 0
              TitleFont.Charset = EASTEUROPE_CHARSET
              TitleFont.Color = clWhite
              TitleFont.Height = -11
              TitleFont.Name = 'MS Sans Serif'
              TitleFont.Style = [fsBold]
              Columns = <
                item
                  Alignment = taCenter
                  Expanded = False
                  FieldName = 'Look_Moeda_nac'
                  Title.Alignment = taCenter
                  Title.Color = clBlack
                  Width = 59
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'NR_OP_CAMBIO'
                  Title.Alignment = taCenter
                  Title.Color = clBlack
                  Width = 119
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'CD_BANCO_PAGAMENTO'
                  Title.Alignment = taCenter
                  Title.Color = clBlack
                  Width = 57
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'CD_PRACA_PAGAMENTO'
                  Title.Alignment = taCenter
                  Title.Color = clBlack
                  Width = 54
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'VL_VINC_MD_CAMBIO'
                  Title.Alignment = taCenter
                  Title.Color = clBlack
                  Width = 127
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'NR_COMPR_CAMBIO'
                  Title.Alignment = taCenter
                  Title.Color = clBlack
                  Width = 129
                  Visible = True
                end>
            end
            object btn_incluir_2: TBitBtn
              Left = 169
              Top = 116
              Width = 75
              Height = 21
              Caption = '&Incluir'
              TabOrder = 1
              OnClick = btn_incluir_2Click
            end
            object btn_alterar_2: TBitBtn
              Left = 265
              Top = 116
              Width = 75
              Height = 21
              Caption = '&Alterar'
              TabOrder = 2
              OnClick = btn_alterar_2Click
            end
            object btn_excluir_2: TBitBtn
              Left = 357
              Top = 116
              Width = 75
              Height = 21
              Caption = '&Excluir'
              TabOrder = 3
              OnClick = btn_excluir_2Click
            end
          end
          object tbsht_pg_cambio_em1: TTabSheet
            Caption = '&Pagamento em at'#233' 180 Dias'
            object GroupBox7: TGroupBox
              Left = 342
              Top = 6
              Width = 257
              Height = 133
              TabOrder = 2
              object btn_co_taxa_juros_BACEN: TSpeedButton
                Left = 173
                Top = 42
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
                OnClick = btn_co_taxa_juros_BACENClick
              end
              object Label12: TLabel
                Left = 40
                Top = 81
                Width = 81
                Height = 13
                Caption = 'Taxa de Juros'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = [fsBold]
                ParentFont = False
              end
              object Label13: TLabel
                Left = 84
                Top = 46
                Width = 40
                Height = 13
                Caption = 'C'#243'digo'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = [fsBold]
                ParentFont = False
                WordWrap = True
              end
              object dbedt_cd_taxa_juros1: TDBEdit
                Left = 128
                Top = 42
                Width = 41
                Height = 21
                DataField = 'CD_TAXA_JUROS'
                DataSource = datm_DI_Adicao.ds_adicao
                TabOrder = 0
                OnKeyDown = dbedt_cd_pais_origem1KeyDown
              end
              object dbedt_pc_taxa_juros1: TDBEdit
                Left = 128
                Top = 78
                Width = 117
                Height = 21
                DataField = 'PC_TAXA_JUROS'
                DataSource = datm_DI_Adicao.ds_adicao
                TabOrder = 1
              end
            end
            object dbrgrp_parcelas1: TDBRadioGroup
              Left = 1
              Top = -1
              Width = 337
              Height = 33
              Columns = 2
              Ctl3D = True
              DataField = 'IN_PGTO_VARIAV_360'
              DataSource = datm_DI_Adicao.ds_adicao
              Items.Strings = (
                'Parcelas Fixas'
                'Parcelas Vari'#225'veis')
              ParentCtl3D = False
              TabOrder = 0
              Values.Strings = (
                'False'
                'True')
              OnChange = dbrgrp_parcelas1Change
            end
            object Panel1: TPanel
              Left = 4
              Top = 36
              Width = 329
              Height = 104
              BevelInner = bvLowered
              Caption = 'Panel3'
              TabOrder = 1
              object ntbk_parcelas_1: TNotebook
                Left = 4
                Top = 2
                Width = 323
                Height = 99
                PageIndex = 1
                TabOrder = 0
                object TPage
                  Left = 0
                  Top = 0
                  Caption = 'Default'
                  object Label7: TLabel
                    Left = 6
                    Top = 16
                    Width = 86
                    Height = 13
                    Caption = 'N'#186' de Parcelas'
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clWindowText
                    Font.Height = -11
                    Font.Name = 'MS Sans Serif'
                    Font.Style = [fsBold]
                    ParentFont = False
                  end
                  object Label8: TLabel
                    Left = 142
                    Top = 16
                    Width = 78
                    Height = 13
                    Caption = 'Periodicidade'
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clWindowText
                    Font.Height = -11
                    Font.Name = 'MS Sans Serif'
                    Font.Style = [fsBold]
                    ParentFont = False
                  end
                  object Label9: TLabel
                    Left = 6
                    Top = 48
                    Width = 63
                    Height = 13
                    Caption = 'Valor Total'
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clWindowText
                    Font.Height = -11
                    Font.Name = 'MS Sans Serif'
                    Font.Style = [fsBold]
                    ParentFont = False
                  end
                  object Label10: TLabel
                    Left = 6
                    Top = 76
                    Width = 157
                    Height = 13
                    Caption = 'Indicador de Periodicidade:'
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clWindowText
                    Font.Height = -11
                    Font.Name = 'MS Sans Serif'
                    Font.Style = [fsBold]
                    ParentFont = False
                  end
                  object dbedt_qt_parcelas1: TDBEdit
                    Left = 96
                    Top = 12
                    Width = 33
                    Height = 21
                    DataField = 'QT_PARC_FINANC_360'
                    DataSource = datm_DI_Adicao.ds_adicao
                    MaxLength = 3
                    TabOrder = 0
                  end
                  object dbedt_qt_periodos1: TDBEdit
                    Left = 224
                    Top = 12
                    Width = 33
                    Height = 21
                    DataField = 'QT_PERIOD_PGTO_360'
                    DataSource = datm_DI_Adicao.ds_adicao
                    MaxLength = 3
                    TabOrder = 1
                  end
                  object dbedt_vl_total_financ1: TDBEdit
                    Left = 76
                    Top = 44
                    Width = 129
                    Height = 21
                    DataField = 'VL_TOT_FINANC_360'
                    DataSource = datm_DI_Adicao.ds_adicao
                    TabOrder = 2
                  end
                  object rbtn_ind_per_diaria1: TRadioButton
                    Left = 168
                    Top = 74
                    Width = 69
                    Height = 17
                    Caption = 'Di'#225'ria_'
                    Enabled = False
                    TabOrder = 3
                    OnClick = rbtn_ind_per_diaria1Click
                  end
                  object rbtn_ind_per_mensal1: TRadioButton
                    Left = 240
                    Top = 74
                    Width = 69
                    Height = 17
                    Caption = 'Mensal'
                    Enabled = False
                    TabOrder = 4
                    OnClick = rbtn_ind_per_mensal1Click
                  end
                end
                object TPage
                  Left = 0
                  Top = 0
                  object DBGrid10: TDBGrid
                    Left = 44
                    Top = 8
                    Width = 237
                    Height = 89
                    DataSource = datm_DI_Adicao.ds_ad_cambio_parc_var
                    Options = [dgEditing, dgTitles, dgColumnResize, dgColLines, dgRowLines, dgConfirmDelete, dgCancelOnExit]
                    TabOrder = 0
                    TitleFont.Charset = DEFAULT_CHARSET
                    TitleFont.Color = clWindowText
                    TitleFont.Height = -11
                    TitleFont.Name = 'MS Sans Serif'
                    TitleFont.Style = [fsBold]
                    Columns = <
                      item
                        Alignment = taCenter
                        Expanded = False
                        FieldName = 'DT_PREV_PGTO_360'
                        Title.Alignment = taCenter
                        Title.Color = clBlack
                        Title.Font.Charset = DEFAULT_CHARSET
                        Title.Font.Color = clWhite
                        Title.Font.Height = -11
                        Title.Font.Name = 'MS Sans Serif'
                        Title.Font.Style = [fsBold]
                        Width = 80
                        Visible = True
                      end
                      item
                        Expanded = False
                        FieldName = 'VL_PREV_PGTO_360'
                        Title.Alignment = taCenter
                        Title.Color = clBlack
                        Title.Font.Charset = DEFAULT_CHARSET
                        Title.Font.Color = clWhite
                        Title.Font.Height = -11
                        Title.Font.Name = 'MS Sans Serif'
                        Title.Font.Style = [fsBold]
                        Width = 132
                        Visible = True
                      end>
                  end
                end
              end
            end
            object dbcbox_com_taxa_juros: TDBCheckBox
              Left = 416
              Top = 4
              Width = 133
              Height = 17
              Caption = 'Com Taxa de Juros'
              DataField = 'IN_JUROS_ATE_360'
              DataSource = datm_DI_Adicao.ds_adicao
              TabOrder = 3
              ValueChecked = 'True'
              ValueUnchecked = 'False'
            end
          end
          object tbsht_pg_cambio_Sup: TTabSheet
            Caption = 'Prazo superior a 360 dias'
            TabVisible = False
            object Bevel3: TBevel
              Left = 28
              Top = 36
              Width = 549
              Height = 50
              Shape = bsFrame
              Style = bsRaised
            end
            object Label5: TLabel
              Left = 38
              Top = 56
              Width = 90
              Height = 13
              Caption = 'Valor Vinculado'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object Label14: TLabel
              Left = 302
              Top = 56
              Width = 109
              Height = 13
              Caption = 'N'#186' do ROF/BACEN'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object dbedt_vl_vinculado_cambio: TDBEdit
              Left = 140
              Top = 52
              Width = 129
              Height = 21
              DataField = 'VL_FINANC_SUP_360'
              DataSource = datm_DI_Adicao.ds_adicao
              TabOrder = 0
            end
            object dbedt_nr_rof2: TDBEdit
              Left = 420
              Top = 52
              Width = 145
              Height = 21
              DataField = 'NR_ROF'
              DataSource = datm_DI_Adicao.ds_adicao
              TabOrder = 1
            end
          end
        end
        object dbedt_inst_financ: TDBEdit
          Left = 192
          Top = 14
          Width = 389
          Height = 21
          TabStop = False
          Color = clMenu
          Ctl3D = True
          DataField = 'DESCRICAO'
          DataSource = datm_DI_Adicao.dsq_inst_financ_
          ParentCtl3D = False
          ReadOnly = True
          TabOrder = 4
          Visible = False
        end
        object dbedt_cd_inst_financ: TDBEdit
          Left = 165
          Top = 14
          Width = 25
          Height = 21
          DataField = 'CD_ORGAO_FIN_INTER'
          DataSource = datm_DI_Adicao.ds_adicao
          TabOrder = 3
          Visible = False
          OnExit = dbedt_cd_inst_financExit
        end
        object dbedt_cd_mod_pagto_1: TDBEdit
          Left = 164
          Top = 14
          Width = 28
          Height = 21
          DataField = 'CD_MODALIDADE_PGTO'
          DataSource = datm_DI_Adicao.ds_adicao
          TabOrder = 0
          OnKeyDown = dbedt_cd_pais_origem1KeyDown
        end
        object dbedt_mod_pagto_1: TDBEdit
          Left = 192
          Top = 14
          Width = 392
          Height = 21
          TabStop = False
          Color = clMenu
          Ctl3D = True
          DataField = 'DESCRICAO'
          DataSource = datm_DI_Adicao.ds_mod_pagto
          ParentCtl3D = False
          ReadOnly = True
          TabOrder = 2
        end
      end
      object gbox_pg_comissao: TGroupBox
        Left = 57
        Top = 110
        Width = 617
        Height = 65
        Caption = ' Agente '
        TabOrder = 1
        object Label74: TLabel
          Left = 28
          Top = 16
          Width = 89
          Height = 17
          AutoSize = False
          Caption = '% da Comiss'#227'o'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          WordWrap = True
        end
        object Label75: TLabel
          Left = 331
          Top = 16
          Width = 75
          Height = 13
          Caption = 'Identifica'#231#227'o'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          WordWrap = True
        end
        object Label76: TLabel
          Left = 460
          Top = 16
          Width = 37
          Height = 13
          Caption = 'Banco'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          WordWrap = True
        end
        object Label77: TLabel
          Left = 531
          Top = 16
          Width = 47
          Height = 13
          Caption = 'Ag'#234'ncia'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          WordWrap = True
        end
        object Label18: TLabel
          Left = 152
          Top = 16
          Width = 105
          Height = 13
          Caption = 'Valor da Comiss'#227'o'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          WordWrap = True
        end
        object dbedt_ag_pc_comissao: TDBEdit
          Left = 28
          Top = 32
          Width = 85
          Height = 21
          DataField = 'PC_COMISSAO_AG_IMP'
          DataSource = datm_DI_Adicao.ds_adicao
          TabOrder = 0
        end
        object dbedt_ag_identificacao: TDBEdit
          Left = 331
          Top = 32
          Width = 125
          Height = 21
          DataField = 'NR_AGENTE_IMP'
          DataSource = datm_DI_Adicao.ds_adicao
          TabOrder = 2
          OnExit = dbedt_ag_identificacaoExit
        end
        object dbedt_ag_nr_banco: TDBEdit
          Left = 460
          Top = 32
          Width = 61
          Height = 21
          DataField = 'CD_BANC_AGENTE_IMP'
          DataSource = datm_DI_Adicao.ds_adicao
          TabOrder = 3
        end
        object dbedt_ag_nr_agencia: TDBEdit
          Left = 531
          Top = 32
          Width = 49
          Height = 21
          DataField = 'CD_AGENC_AGENT_IMP'
          DataSource = datm_DI_Adicao.ds_adicao
          TabOrder = 4
        end
        object dbedt_ag_vl: TDBEdit
          Left = 152
          Top = 32
          Width = 137
          Height = 21
          DataField = 'VL_COMISSAO_AG_IMP'
          DataSource = datm_DI_Adicao.ds_adicao
          TabOrder = 1
        end
      end
      object gbox_rof_imp_sem_cobert: TGroupBox
        Left = 57
        Top = 110
        Width = 617
        Height = 65
        Caption = ' Importa'#231#227'o sem Cobertura Cambial '
        TabOrder = 3
        object Label3: TLabel
          Left = 178
          Top = 28
          Width = 109
          Height = 13
          Caption = 'N'#186' do ROF/BACEN'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object dbedt_nr_rof: TDBEdit
          Left = 296
          Top = 24
          Width = 145
          Height = 21
          DataField = 'NR_ROF'
          DataSource = datm_DI_Adicao.ds_adicao
          TabOrder = 0
        end
      end
      object gbox_cobertura_cambial: TGroupBox
        Left = 57
        Top = 31
        Width = 617
        Height = 73
        Caption = ' Cobertura Cambial'
        TabOrder = 0
        object btn_co_motivo_sem_cob: TSpeedButton
          Left = 549
          Top = 42
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
          OnClick = btn_co_motivo_sem_cobClick
        end
        object lbl_mot_sem_cobert: TLabel
          Left = 8
          Top = 46
          Width = 117
          Height = 19
          AutoSize = False
          Caption = 'Motivo s/ Cobertura'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          WordWrap = True
        end
        object rbtn_cambial_Ate180: TRadioButton
          Left = 8
          Top = 20
          Width = 113
          Height = 17
          Caption = '1 - At'#233' 180 dias'
          TabOrder = 0
          OnClick = rbtn_cambial_Ate180Click
        end
        object rbtn_cambial_De180_360: TRadioButton
          Left = 144
          Top = 20
          Width = 165
          Height = 17
          Caption = '2 - De 181 at'#233' 360 dias'
          TabOrder = 1
          OnClick = rbtn_cambial_Ate180Click
        end
        object rbtn_cambial_Acima360: TRadioButton
          Left = 312
          Top = 20
          Width = 149
          Height = 17
          Caption = '3 - Acima de 360 dias'
          TabOrder = 2
          OnClick = rbtn_cambial_Ate180Click
        end
        object rbtn_cambial_Sem_Cobertura: TRadioButton
          Left = 472
          Top = 20
          Width = 137
          Height = 17
          Caption = '4 - Sem cobertura'
          TabOrder = 3
          OnClick = rbtn_cambial_Ate180Click
        end
        object dbedt_cd_mot_sem_cobert: TDBEdit
          Left = 128
          Top = 42
          Width = 28
          Height = 21
          Color = clMenu
          DataField = 'CD_MOTIVO_SEM_COB'
          DataSource = datm_DI_Adicao.ds_adicao
          TabOrder = 4
          OnExit = dbedt_cd_mot_sem_cobertExit
          OnKeyDown = dbedt_cd_pais_origem1KeyDown
        end
        object dbedt_mot_sem_cobert: TDBEdit
          Left = 156
          Top = 42
          Width = 392
          Height = 21
          TabStop = False
          Color = clMenu
          Ctl3D = True
          DataField = 'DESCRICAO'
          DataSource = datm_DI_Adicao.ds_mot_sem_cobertura
          ParentCtl3D = False
          ReadOnly = True
          TabOrder = 5
        end
      end
    end
    object tbsPgmtoAFRMM: TTabSheet
      Caption = 'Pagamento AFRMM'
      ImageIndex = 7
      object Label114: TLabel
        Left = 13
        Top = 114
        Width = 92
        Height = 13
        Caption = 'Tipo Suspens'#227'o'
      end
      object Label115: TLabel
        Left = 14
        Top = 69
        Width = 75
        Height = 13
        Caption = 'Tipo Isen'#231#227'o'
      end
      object btnTPIsensao: TSpeedButton
        Left = 377
        Top = 85
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
        OnClick = btnTPIsensaoClick
      end
      object btnTPSuspensao: TSpeedButton
        Left = 378
        Top = 129
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
        OnClick = btnTPSuspensaoClick
      end
      object Label116: TLabel
        Left = 415
        Top = 16
        Width = 65
        Height = 13
        Caption = 'Nr. Parcela'
      end
      object Label117: TLabel
        Left = 15
        Top = 156
        Width = 215
        Height = 13
        Caption = 'Data Vencimento da Suspens'#227'o / Ato'
      end
      object Label118: TLabel
        Left = 259
        Top = 156
        Width = 114
        Height = 13
        Caption = 'Nr. Ato Concess'#243'rio'
      end
      object dbrgCD_TP_AFRMM: TDBRadioGroup
        Left = 14
        Top = 9
        Width = 384
        Height = 46
        Caption = 'Tipo AFRMM'
        Columns = 3
        DataField = 'CD_TP_PGMTO_AFRMM'
        DataSource = datm_DI_Adicao.ds_adicao
        Items.Strings = (
          'Integral'
          'Isen'#231#227'o'
          'Suspens'#227'o')
        TabOrder = 0
        Values.Strings = (
          '1'
          '2'
          '3')
        OnChange = dbrgCD_TP_AFRMMChange
        OnExit = dbedt_cd_local_embarque2Exit
      end
      object dbedtTP_SUSPENCAO: TDBEdit
        Left = 13
        Top = 130
        Width = 41
        Height = 21
        DataField = 'CD_TP_SUSPENSAO'
        DataSource = datm_DI_Adicao.ds_adicao
        TabOrder = 1
        OnExit = dbedt_cd_local_embarque2Exit
        OnKeyDown = dbedt_cd_pais_origem1KeyDown
      end
      object dbedtCD_TP_SUSPENSAO: TDBEdit
        Left = 55
        Top = 130
        Width = 322
        Height = 21
        TabStop = False
        Color = clMenu
        DataField = 'Look_Tp_Suspensao'
        DataSource = datm_DI_Adicao.ds_adicao
        TabOrder = 2
      end
      object dbedtTP_ISENCAO: TDBEdit
        Left = 13
        Top = 85
        Width = 41
        Height = 21
        DataField = 'CD_TP_ISENCAO'
        DataSource = datm_DI_Adicao.ds_adicao
        TabOrder = 3
        OnExit = dbedt_cd_local_embarque2Exit
        OnKeyDown = dbedt_cd_pais_origem1KeyDown
      end
      object dbedtCD_TP_ISENCAO: TDBEdit
        Left = 54
        Top = 85
        Width = 322
        Height = 21
        TabStop = False
        Color = clMenu
        DataField = 'Look_TP_ISENCAO'
        DataSource = datm_DI_Adicao.ds_adicao
        TabOrder = 4
      end
      object dbedtNR_PARCELA: TDBEdit
        Left = 415
        Top = 34
        Width = 60
        Height = 21
        DataField = 'NR_PARCELA_ENTREPOSTO'
        DataSource = datm_DI_Adicao.ds_adicao
        TabOrder = 5
        OnExit = dbedt_cd_local_embarque2Exit
      end
      object dbedtDT_VENCIMENTO_SUSPENSAO: TDBDateEdit
        Left = 15
        Top = 175
        Width = 110
        Height = 19
        DataField = 'DT_VENCIMENTO_SUSPENSAO'
        DataSource = datm_DI_Adicao.ds_adicao
        NumGlyphs = 2
        TabOrder = 6
      end
      object dbedNR_ATO_CONCESSORIO: TDBEdit
        Left = 259
        Top = 175
        Width = 98
        Height = 21
        DataField = 'NR_ATO_CONCESSORIO'
        DataSource = datm_DI_Adicao.ds_adicao
        TabOrder = 7
        OnExit = dbedt_cd_local_embarque2Exit
      end
    end
  end
  object menu_manut_cadastro: TMainMenu
    Left = 365
    Top = 6
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
    object mi_capa_di: TMenuItem
      Caption = 'Ca&pa'
      Hint = 'Capa'
      OnClick = btn_capa_diClick
    end
    object mi_itens_di: TMenuItem
      Caption = '&Itens'
      Hint = 'Itens'
      OnClick = btn_itens_diClick
    end
    object mi_calculo: TMenuItem
      Caption = 'Calcu&lar'
      Hint = 'Calcular'
      OnClick = btn_calculoClick
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
